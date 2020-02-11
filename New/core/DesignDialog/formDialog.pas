unit formDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxImage,
  cxCheckListBox, ComCtrls, cxTextEdit, cxMemo, cxRichEdit;

type
  TfrmDialog = class(TForm)
    PanelBottonm: TPanel;
    ImageList: TImageList;
    PanelLeft: TPanel;
    PanelTopImg: TPanel;
    panelPrefixText: TPanel;
    PanelTop: TPanel;
    PanelMain: TPanel;
    LbMessage: TStaticText;
    PanelCaption: TPanel;
    panelText: TPanel;
    ImgRadioBut: TImage;
    PanelSpaceAtention: TPanel;
    PanelImage: TPanel;
    Image: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    StaticCaptionText: TRichEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

    { Private declarations }
  public
    FSelBut:integer; 
    procedure ButtonClick(Sender: TObject);
    { Public declarations }
  end;



implementation

{$R *.dfm}
//******************************************************************************
procedure TfrmDialog.ButtonClick(Sender: TObject);
begin
 FSelBut:=(Sender as TButton).Tag;
 self.close;
end;
//******************************************************************************
procedure TfrmDialog.FormShow(Sender: TObject);
var i:Integer;
begin
  for i:=0 to self.ComponentCount-1 do
      begin
        if ( self.Components[i] is TRichEdit ) then
             TRichEdit(self.Components[i]).Color:=self.Color;
      end;
end;
//******************************************************************************
procedure TfrmDialog.FormCreate(Sender: TObject);
begin
 FSelBut:=-1;
end;
//******************************************************************************
procedure TfrmDialog.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then 
  begin
    FSelBut:=-1;
    Close;
  end;  
end;

end.
