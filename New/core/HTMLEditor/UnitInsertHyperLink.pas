unit UnitInsertHyperLink;

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
  cxTextEdit, StdCtrls, Buttons, ExtCtrls, cxCheckBox;

type
  THyperLinkProperty = record
   Url:WideString;
   Text:WideString;
   ToolTip:WideString;
   Target:String;
  end;

  TFrmInsertHyperLink = class(TForm)
    Panel1: TPanel;
    SbtOK: TSpeedButton;
    SbtClose: TSpeedButton;
    Panel2: TPanel;
    Label8: TLabel;
    EdLinkUrl: TcxTextEdit;
    Label1: TLabel;
    EdLinkText: TcxTextEdit;
    Label2: TLabel;
    EdLinkToolTip: TcxTextEdit;
    ChShowInNewWindow: TcxCheckBox;
    procedure SbtOKClick(Sender: TObject);
    procedure SbtCloseClick(Sender: TObject);
    function Validate:Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowInsertHyperLink(var aProperty:THyperLinkProperty):Boolean;

  var FrmInsertHyperLink: TFrmInsertHyperLink;

implementation
Uses UnitProc;

{$R *.dfm}

function ShowInsertHyperLink(var aProperty:THyperLinkProperty):Boolean;
begin
  try
   Application.CreateForm( TFrmInsertHyperLink, FrmInsertHyperLink );
   FrmInsertHyperLink.EdLinkUrl.Text:= aProperty.Url;
   FrmInsertHyperLink.EdLinkText.Text:= aProperty.Text;
   FrmInsertHyperLink.EdLinkToolTip.Text:= aProperty.ToolTip;
   FrmInsertHyperLink.ChShowInNewWindow.Checked := CompareText( aProperty.Target ,'_blank') = 0;

   FrmInsertHyperLink.EdLinkText.Enabled :=  aProperty.Text = '';
   if FrmInsertHyperLink.ShowModal = mrOk then
   begin
     aProperty.Url := ( FrmInsertHyperLink.EdLinkUrl.Text);
     aProperty.Text := FrmInsertHyperLink.EdLinkText.Text;
     aProperty.ToolTip := Trim( FrmInsertHyperLink.EdLinkToolTip.Text) ;
     if FrmInsertHyperLink.ChShowInNewWindow.Checked then aProperty.Target :='_blank'
     else  aProperty.Target :='_self';

     result:=True;
   end
    else result:=False;

  finally
    FrmInsertHyperLink.Free; 
  end;
end;

function TFrmInsertHyperLink.Validate:Boolean;
begin
  result:=True;
  
  if EdLinkUrl.Text ='' then
  begin
   MyShowMessageDlg('¬каж≥ть веб л≥нк.',mtError, but_OK );
   result:=False;
   exit;
  end;

  if EdLinkText.Text ='' then
  begin
   MyShowMessageDlg('¬каж≥ть текст.',mtError, but_OK );
   result:=False;
   exit;
  end;

end;

procedure TFrmInsertHyperLink.SbtOKClick(Sender: TObject);
begin
  if Validate then ModalResult := mrOk;
end;

procedure TFrmInsertHyperLink.SbtCloseClick(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

end.
