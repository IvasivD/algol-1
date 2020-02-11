unit SelectFor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxRadioGroup, Buttons, ExtCtrls,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, StdCtrls, cxGroupBox;

type
  TFrmSelectFor = class(TForm)
    cxRGroupSelect: TcxRadioGroup;
    PanBottom: TPanel;
    SbtOk: TSpeedButton;
    SbtCancel: TSpeedButton;
    BoxEditLng: TGroupBox;
    RbtBlockLng: TcxRadioButton;
    RbtSelLng: TcxRadioButton;
    procedure SbtCancelClick(Sender: TObject);
    procedure SbtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
      AClose:Integer;
  end;
Function ShowSelectDialog(Acaption:String;Awidth:Integer;AHeight:Integer;
                          ForSelect:Array of string;Var TypeEdit:integer;aList:TstringList=nil):integer;

var
  FrmSelectFor: TFrmSelectFor;

implementation

{$R *.dfm}
//******************************************************************************
Function ShowSelectDialog(Acaption:String;Awidth:Integer;AHeight:Integer;
                                             ForSelect:Array of string;Var TypeEdit:integer;aList:TstringList=nil):integer;
var i:integer;
    acount:Integer;
begin
  try
   Application.CreateForm(TFrmSelectFor, FrmSelectFor);
   if aList=nil then FrmSelectFor.BoxEditLng.Visible:=false
      else  FrmSelectFor.BoxEditLng.Visible:=true;
   if FrmSelectFor.BoxEditLng.Visible then  AHeight:=AHeight+60;
   //**************************************************
   if aList=nil then acount:=Length(ForSelect)
      else acount:=aList.Count;
   //**************************************************
   for i:=0 to acount-1 do
       begin
        FrmSelectFor.cxRGroupSelect.Properties.Items.Add;
        if aList=nil then FrmSelectFor.cxRGroupSelect.Properties.Items.Items[i].Caption:=ForSelect[i]
           else FrmSelectFor.cxRGroupSelect.Properties.Items.Items[i].Caption:=aList.Strings[i];
       end;
   //**************************************************
   FrmSelectFor.BorderStyle            := bsNone;
   FrmSelectFor.cxRGroupSelect.Caption := Acaption;
   FrmSelectFor.cxRGroupSelect.ItemIndex:=0;
   FrmSelectFor.Width := Awidth;
   FrmSelectFor.Height:= AHeight;

   //**************************************************
   FrmSelectFor.ShowModal;
   if FrmSelectFor.AClose = 1 THEN
      begin
        Result:=FrmSelectFor.cxRGroupSelect.ItemIndex;
         if FrmSelectFor.BoxEditLng.Visible then
          begin
           if FrmSelectFor.RbtBlockLng.Checked then TypeEdit:=0
              else TypeEdit:=1;
          end
           else TypeEdit:=-1;
      end

      else Result:=-1;
   //**************************************************
  finally
   FreeAndNil(FrmSelectFor);
  end;
end;
//******************************************************************************
procedure TFrmSelectFor.SbtCancelClick(Sender: TObject);
begin
 AClose:=0;
 Close;
end;
//******************************************************************************
procedure TFrmSelectFor.SbtOkClick(Sender: TObject);
begin
 AClose:=1;
 Close;
end;
//******************************************************************************
procedure TFrmSelectFor.FormCreate(Sender: TObject);
begin
  AClose:=0;
end;
//******************************************************************************
procedure TFrmSelectFor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_ESCAPE then close;
  if Key=VK_RETURN then SbtOk.Click;
end;

end.
