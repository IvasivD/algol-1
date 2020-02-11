unit UnitControlDrawImage;

interface
uses SysUtils, Classes, Controls, Variants, cxTextEdit, ImgList, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, dxGDIPlusClasses,Graphics,DB;

type
 TparamImgValue = record
    fieldName:string;
    value :variant;
    Umova:string[2];
    IndImg:Integer;
 end;

 TParamControl = record
    Control: TControl;
    ImageList:TImageList;
    paramImgValue : array of TparamImgValue;
    db:TDataset;
    Img : TImage;
 end;
 PParamControl = ^TParamControl;

 TIconDrawControlShema=class
 private
   FListControl : TList;
   function  FGetValueStrForControl(aContr: TControl):String;
   function  FGetSeekRightForControl(aContr: TControl):Integer;
   function  FGetCurrColorForControl(aContr: TControl):TColor;
   function  FPrepareControl( aContr: TControl; ImgWdth:Integer ):TImage;
   procedure FRepaintCurrObj( param : TParamControl );
   function  FCheckUmova( DB:TDataSet; paramImgValue : TparamImgValue):Boolean;
 public
   constructor Create;
   destructor Close;
   procedure AddControl( aContr: TControl; aImageList:TImageList; db : TDataset; paramImgValue : array of TparamImgValue );
   procedure RefreshControls;
 end;


implementation

uses cxEdit;

{ TDBShema }
function TIconDrawControlShema.FGetSeekRightForControl(aContr: TControl):Integer;
begin
  result := 0;
  if aContr is TcxTextEdit then result := -2;
  if aContr is TcxExtLookupComboBox then result := 17;
end;

function TIconDrawControlShema.FGetValueStrForControl(aContr: TControl):String;
begin
  result := '';
  if aContr is TcxTextEdit then result := TcxTextEdit(aContr).Text;
  if aContr is TcxExtLookupComboBox then result := TcxExtLookupComboBox(aContr).Text;
end;

function TIconDrawControlShema.FGetCurrColorForControl(aContr: TControl):TColor;
begin
  result := clWhite;
  if aContr is TcxCustomTextEdit then result := TcxCustomTextEdit(aContr).Style.Color;
  //if aContr is TcxExtLookupComboBox then result := TcxExtLookupComboBox(aContr).Style.Color;
end;

function TIconDrawControlShema.FPrepareControl( aContr: TControl; ImgWdth:Integer ):TImage;
var MainPanelName:string;
    PanImage:string;
    aPanMain:TPanel;
    aPan:TPanel;
    aButWith:Integer;
    aColor:TColor;
begin
  MainPanelName:= 'MainPanel_' + aContr.Name;
  PanImage := 'PanImage_' + aContr.Name;

  aButWith := FGetSeekRightForControl( aContr );
  aColor  := FGetCurrColorForControl( aContr );

  ImgWdth := ImgWdth + 4;

  aPanMain := aContr.Owner.FindComponent(MainPanelName) as TPanel;
  if aPanMain = nil then
  begin
    aPanMain := TPanel.Create(aContr.Owner);
    aPanMain.Name   := MainPanelName;
    aPanMain.Parent := aContr.Parent;
  end;

  aPanMain.Width := aContr.Width;
  aPanMain.Height:= aContr.Height;

  aPanMain.Left := aContr.Left;
  aPanMain.Top := aContr.Top;
  aContr.Left := 0;
  aContr.Top  := 0;
  aPanMain.BevelInner := bvnone;
  aPanMain.BevelOuter := bvnone;

  aContr.Parent := aPanMain;
  aContr.Align  := alClient;

  aPan := aContr.Owner.FindComponent(PanImage) as TPanel;
  if aPan = nil then
  begin
    aPan := TPanel.Create(aContr.Owner);
    aPan.Name  := PanImage;
    aPan.Parent:= aPanMain;
    aPan.BringToFront;
    aPan.Color := clGreen;
    aPan.Caption := '';
  end;

  aPan.Width := ImgWdth - 2;
  aPan.Height:= aContr.Height - 5;
  aPan.Left  := aContr.Left + aContr.Width - aButWith - ImgWdth;
  aPan.Top   := aContr.Top + 3;
  aPan.BevelInner := bvnone;
  aPan.BevelOuter := bvnone;
  if aColor <> -1 then aPan.Color := aColor;

  result := TImage.Create( aContr.Owner );
  result.Parent := aPan;
  result.Height := aPan.Height;
  result.Width  := aPan.Width;
  result.Align  := alClient;
  result.Center := True;
  result.Transparent := True;
  result.AutoSize := True;
end;

procedure TIconDrawControlShema.AddControl( aContr: TControl; aImageList:TImageList; db : TDataset; paramImgValue : array of TparamImgValue );
var i:Integer;
    aParamCntr: PParamControl;
    img:TImage;
begin
  Img:= FPrepareControl( aContr, aImageList.Width );

  New(aParamCntr);

  aParamCntr.Control := aContr;
  aParamCntr.ImageList := aImageList;

  SetLength( aParamCntr.paramImgValue, Length( paramImgValue ) );
  for i:=0 to Length( paramImgValue )-1 do
  begin
    aParamCntr.paramImgValue[i].fieldName := paramImgValue[i].fieldName;
    aParamCntr.paramImgValue[i].value := paramImgValue[i].value;
    aParamCntr.paramImgValue[i].Umova := paramImgValue[i].Umova;
    aParamCntr.paramImgValue[i].IndImg := paramImgValue[i].IndImg;
  end;

  aParamCntr.DB := DB;
  aParamCntr.Img := img;
  FListControl.Add( aParamCntr );
end;

function TIconDrawControlShema.FCheckUmova( DB:TDataSet; paramImgValue : TparamImgValue):Boolean;
begin
  result := False;
  if paramImgValue.Umova = '=' then if db.FieldByName( paramImgValue.fieldName ).value = paramImgValue.value then result := True;
  if paramImgValue.Umova = '>' then if db.FieldByName( paramImgValue.fieldName ).value > paramImgValue.value then result := True;
  if paramImgValue.Umova = '<' then if db.FieldByName( paramImgValue.fieldName ).value < paramImgValue.value then result := True;
  if (paramImgValue.Umova = '=>')or(paramImgValue.Umova = '>=') then if db.FieldByName( paramImgValue.fieldName ).value >= paramImgValue.value then result := True;
  if (paramImgValue.Umova = '=<')or(paramImgValue.Umova = '<=') then if db.FieldByName( paramImgValue.fieldName ).value <= paramImgValue.value then result := True;
  if (paramImgValue.Umova = '<>') then if db.FieldByName( paramImgValue.fieldName ).value <> paramImgValue.value then result := True;
end;

procedure TIconDrawControlShema.FRepaintCurrObj( param : TParamControl );
var i:Integer;
    Cond:Boolean;
    CurrImageInd:Integer;
begin
   Cond:=False;
   CurrImageInd:=-1;
   for i:=0 to Length(param.paramImgValue)-1 do
   begin

     Cond := FCheckUmova( param.db, param.paramImgValue[i] );
     if (Cond) and ( FGetValueStrForControl(param.Control ) <> '' ) then
     begin
       CurrImageInd :=param.paramImgValue[i].IndImg;
       Break;
     end;
   end;

   param.Img.Canvas.FillRect( param.Img.ClientRect );
   if (Cond)and(CurrImageInd<>-1) then
     param.ImageList.DrawOverlay( param.Img.Canvas,0,0, CurrImageInd, 0, True );
end;

procedure TIconDrawControlShema.RefreshControls;
var i:Integer;
begin
  for i:=0 to FListControl.Count-1 do
  begin
    FRepaintCurrObj( PParamControl(FListControl.Items[i])^ );
  end;
end;

destructor TIconDrawControlShema.Close;
var i:Integer;
begin
  for i:=0 to FListControl.Count-1 do
    Dispose( FListControl.Items[i]);

  FListControl.Free;
end;

constructor TIconDrawControlShema.Create;
begin
  FListControl := TList.Create;
end;

end.
 