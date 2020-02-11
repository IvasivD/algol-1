unit InputDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  StdCtrls, cxTextEdit, Buttons, ExtCtrls;

type
  TFrmInputDialog = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    EdValue: TcxTextEdit;
    PromptLabel: TLabel;
    EndDescript: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmInputDialog: TFrmInputDialog;

Function ShowInputDialog( Caption,PromtDescription,ValueFinishDescript:string;var Value:Variant;ReadOnly:Boolean;WidthForm:Integer=-1 ):Boolean;
implementation

{$R *.dfm}


Function ShowInputDialog( Caption,PromtDescription,ValueFinishDescript:string; var Value:Variant; ReadOnly:Boolean; WidthForm:Integer=-1 ):Boolean;
begin
 try
  Application.CreateForm(TFrmInputDialog, FrmInputDialog);

  if WidthForm <> -1 then
    FrmInputDialog.Width := WidthForm
  else
    FrmInputDialog.Width := FrmInputDialog.Canvas.TextWidth( PromtDescription ) + FrmInputDialog.PromptLabel.Left*2 + FrmInputDialog.Canvas.TextWidth( ValueFinishDescript )*2+5;  

  FrmInputDialog.Caption :=Caption;
  FrmInputDialog.PromptLabel.Caption := PromtDescription;
  FrmInputDialog.EdValue.EditValue   := Value;
  FrmInputDialog.EdValue.Properties.ReadOnly := ReadOnly;

  if ValueFinishDescript <>'' then
  begin
    FrmInputDialog.EndDescript. caption:= ValueFinishDescript;
    FrmInputDialog.EndDescript.Left:=FrmInputDialog.EdValue.Left+FrmInputDialog.EdValue.Width;
    FrmInputDialog.EndDescript.Left:=FrmInputDialog.EndDescript.Left - FrmInputDialog.EndDescript.Width;
    FrmInputDialog.EdValue.Width := FrmInputDialog.EdValue.Width - FrmInputDialog.EndDescript.Width - 5;
  end;

  if FrmInputDialog.ShowModal = mrOK then
  begin
   Value := FrmInputDialog.EdValue.EditValue;
   result:=true;
  end
  else result:=false;

 finally
  FrmInputDialog.Free;
 end;
end;
end.


EndDescript
