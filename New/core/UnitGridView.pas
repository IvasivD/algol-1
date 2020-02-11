unit UnitGridView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, Buttons, ExtCtrls,
  Core, ImgList,UnitProc;

type
  TButtShowGridView = array[0..2] of Boolean;
  TButModalProperty = record
    Caption : Widestring;
    ImgListIndex:Integer;
    NumGlyps:Integer;
    ModalRes : TModalResult;
    Action : TUpdateValueDetail;
    Visible : Boolean;
  end;

  TPanelEdit = record
    AddAction : TUpdateValue;
    EditAction : TUpdateValue;
    DelAction : TUpdateValue;
    Show : TButtShowGridView;
    WidthForm : Integer;
    ShowInControl : TWinControl;
  end;

  TFrmGridView = class(TForm)
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PanelGridView: TPanel;
    GridView: TcxGrid;
    GridViewDBTableView1: TcxGridDBTableView;
    GridViewLevel1: TcxGridLevel;
    PanelEditTop: TPanel;
    butDel: TSpeedButton;
    butEdit: TSpeedButton;
    butAdd: TSpeedButton;
    ImageList: TImageList;
    PanelMoveUpDown: TPanel;
    BevelMainSpliterMoveRows: TBevel;
    butMoveUp: TSpeedButton;
    butMoveDown: TSpeedButton;
    procedure butAddClick(Sender: TObject);
    procedure butEditClick(Sender: TObject);
    procedure butDelClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure butMoveUpClick(Sender: TObject);
    procedure butMoveDownClick(Sender: TObject);
  private
    { Private declarations }
    FConfirmClose:Boolean;
    FElem:TDBShemaView;
    FParamPanleEdit:TPanelEdit;
    FButOkCaption:TButModalProperty;
    FButCancelCaption:TButModalProperty;

    procedure FCheckOk;
    Procedure FCheckCancel;

    procedure FPreparePanleEdit( aParam:TPanelEdit; ButOkCaption, ButCancelCaption:TButModalProperty );
    procedure ViewCellDblClick( Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);

    procedure InitModalButton(ButOkCaption, ButCancelCaption:TButModalProperty);
  public
    { Public declarations }
    Procedure PrepareButton(but:TBitBtn; ButProperty :TButModalProperty );
    procedure PrepareShowEditPanel( aPanel:TPanel;aPanelEdit:TPanelEdit );
    procedure InitTopElem( aPanelEdit:TPanelEdit; Elem:TDBShemaView;  ButOkCaption, ButCancelCaption:TButModalProperty);
    procedure Refresh; virtual;
  published
     property Elem:TDBShemaView read FElem;
     property ConfirmClose:Boolean read  FConfirmClose write FConfirmClose;
  end;

Function ShowGridView(  FormCaption:Widestring; Elem:TDBShemaView; aPanelEdit:TPanelEdit; ButOkCaption, ButCancelCaption:TButModalProperty ):Variant;
function GetEmptyPanelEdit(aBut:Array of boolean):TPanelEdit;
function GetDefButModProperty(aCapt:Widestring):TButModalProperty;
//Procedure PrepareButton(but:TBitBtn; ButProperty :TButModalProperty );
var
  FrmGridView: TFrmGridView;

implementation

{$R *.dfm}

Function ShowGridView(  FormCaption:Widestring; Elem:TDBShemaView; aPanelEdit:TPanelEdit; ButOkCaption, ButCancelCaption:TButModalProperty ):Variant;
begin

  try
    Application.CreateForm(TFrmGridView, FrmGridView);
    FrmGridView.InitTopElem( aPanelEdit, Elem,  ButOkCaption, ButCancelCaption);

    FrmGridView.Caption := FormCaption;
    if FrmGridView.ShowModal = mrok then
      result := Elem.GetValueId
    else result := null;

  finally
    FrmGridView.Free;
  end;

end;

procedure TFrmGridView.PrepareShowEditPanel( aPanel:TPanel;aPanelEdit:TPanelEdit );
var i:Integer;
begin
  for i:=0 to Length(aPanelEdit.Show)-1 do
  if aPanelEdit.Show[i] then
  begin
    aPanel.Visible:= True;
    Break;
  end;
end;

procedure TFrmGridView.InitTopElem( aPanelEdit:TPanelEdit; Elem:TDBShemaView; ButOkCaption, ButCancelCaption:TButModalProperty);
begin
  GridView.Levels[0].GridView := Elem.View;
  FElem := Elem;
  FElem.AddCellDblClick( ViewCellDblClick );
  FElem.DBOpen;
  FParamPanleEdit := aPanelEdit;
  FButOkCaption := ButOkCaption;
  FButCancelCaption := ButCancelCaption;
  PanelMoveUpDown.Visible := FElem.FieldNumber <>'';
  if aPanelEdit.WidthForm <> -1 then
    self.Width := aPanelEdit.WidthForm;
  if aPanelEdit.ShowInControl <> nil then
  begin
    ShowFormInPositionButton(self, aPanelEdit.ShowInControl, taLeftJustify );
    self.BorderStyle := bsNone;
  end;
  //**************************************
  FPreparePanleEdit( aPanelEdit, ButOkCaption, ButCancelCaption );
  PrepareShowEditPanel( PanelEditTop, aPanelEdit );
end;

procedure TFrmGridView.InitModalButton(ButOkCaption, ButCancelCaption:TButModalProperty);
begin
  FButOkCaption := ButOkCaption;
  FButCancelCaption := ButCancelCaption;

  FPreparePanleEdit(self.FParamPanleEdit, FButOkCaption, FButCancelCaption );
end;

function GetDefButModProperty(aCapt:Widestring):TButModalProperty;
begin
  Result.Caption :=aCapt;

  //Result.ImgList := nil;
  Result.ImgListIndex := -1;
  Result.NumGlyps := 1;
  Result.ModalRes := -1;
  Result.Visible := aCapt <> '';
end;


procedure TFrmGridView.Refresh;
begin
  if self.Name='' then exit;
  butDel.Enabled :=not FElem.DB.IsEmpty;

  //butAdd.Enabled := self.FCurrManager > 0;
  butEdit.Enabled :=(not FElem.DB.IsEmpty){ and (self.FCurrManager > 0)};
  butDel.Enabled := (not FElem.DB.IsEmpty) {and (self.FCurrManager > 0)};
  butMoveUp.Enabled := (FElem.FieldNumber <>'')and ( FElem.CheckMoveUpRow ) {and (self.FCurrManager > 0)};
  butMoveDown.Enabled := (FElem.FieldNumber <>'')and ( FElem.CheckMoveDownRow ) {and (self.FCurrManager > 0)};
end;


Procedure TFrmGridView.PrepareButton(but:TBitBtn; ButProperty :TButModalProperty );
var aBmp:TBitmap;
begin
  but.Visible := ButProperty.Visible;
  but.Caption := ButProperty.Caption;
  if ButProperty.ModalRes <>-1 then but.ModalResult := ButProperty.ModalRes;

  if{ ( ButProperty.ImgList<>nil )and}( ButProperty.ImgListIndex<>-1 ) then
  begin
   try
     aBmp:=TBitmap.Create;
     aBmp.PixelFormat := pf32bit;

     ImageList.GetBitmap( ButProperty.ImgListIndex ,aBmp);

     but.Glyph.Assign( aBmp );
     but.NumGlyphs := ButProperty.NumGlyps;
   finally
     aBmp.Free;
   end;
  end;
end;

procedure TFrmGridView.FPreparePanleEdit( aParam : TPanelEdit; ButOkCaption, ButCancelCaption:TButModalProperty );
var i:Integer;
begin
  PrepareButton( OkBtn, ButOkCaption );
  PrepareButton( CancelBtn, ButCancelCaption );

  PanelEditTop.Visible:= False;
  //**************************************

  if PanelEditTop.Visible then
  begin
    butAdd.Visible := aParam.Show[0];
    butEdit.Visible := aParam.Show[1];
    butDel.Visible := aParam.Show[2];
  end;
  //**************************************
end;

function GetEmptyPanelEdit( aBut:Array of boolean ):TPanelEdit;
var i:Integer;
begin
  @Result.AddAction  := nil;
  @Result.EditAction := nil;
  @Result.DelAction  := nil;
  Result.WidthForm := -1;

  for i:=0 to Length( Result.Show )-1 do
    Result.Show[i] := aBut[i];
end;

procedure TFrmGridView.butAddClick(Sender: TObject);
begin
  if @FParamPanleEdit.AddAction <> nil then
    FParamPanleEdit.AddAction(FElem)
  else
  begin
   if not FElem.UpdateForm then
     FElem.DBInsert(True);
  end;

  Refresh;
end;

procedure TFrmGridView.butEditClick(Sender: TObject);
begin
  if @FParamPanleEdit.EditAction <> nil then
    FParamPanleEdit.EditAction(FElem)
  else
  begin
   if not FElem.UpdateForm then
     FElem.DBEdit(True);
  end;

  Refresh;
end;

procedure TFrmGridView.butDelClick(Sender: TObject);
begin
  if @FParamPanleEdit.DelAction <> nil then
    FParamPanleEdit.DelAction(FElem)
  else FElem.DBDelete;

  Refresh;
end;

procedure TFrmGridView.ViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if (butEdit.Visible) and (PanelEditTop.Visible) then butEdit.Click
  else
   if FParamPanleEdit.ShowInControl <> nil then OkBtn.Click;
end;

Procedure TFrmGridView.FCheckOk;
begin
  if @FButOkCaption.Action <> nil then
  begin
    if FButOkCaption.Action( Self.Elem, nil ) then
      ConfirmClose := True
    else
      ConfirmClose := False;
  end
    else ConfirmClose := True;
end;

procedure TFrmGridView.OkBtnClick(Sender: TObject);
begin
  FCheckOk;
end;

Procedure TFrmGridView.FCheckCancel;
begin
  if @FButCancelCaption.Action <> nil then
  begin
    if FButCancelCaption.Action( Self.Elem, nil ) then
      ConfirmClose := True
    else
      ConfirmClose := False;
  end
    else ConfirmClose := True;
end;

procedure TFrmGridView.CancelBtnClick(Sender: TObject);
begin
  FCheckCancel;
end;

procedure TFrmGridView.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if self.ModalResult = mrCancel then CanClose := True
  else
    CanClose := ConfirmClose;
end;

procedure TFrmGridView.butMoveUpClick(Sender: TObject);
begin
  FElem.MoveUpRow;
  Refresh;
end;

procedure TFrmGridView.butMoveDownClick(Sender: TObject);
begin
  FElem.MoveDownRow;
  Refresh;
end;

end.
