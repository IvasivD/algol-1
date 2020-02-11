unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, DHTMLEDLib_TLB, StdCtrls, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, cxPC, cxContainer, cxEdit, cxTextEdit, cxMemo, ShellAPI,
  cxMaskEdit, cxDropDownEdit, ComCtrls, ToolWin, ImgList  ,ActiveX,OleCtnrs,ieConst,
  mshtml_TLB, ComObj,Contnrs,printers, UnitHTMLEditor,SetTable,SelectFor,UnitProc,
  Menus, cxRichEdit, UnitSyntaxMemo, UnitFrameHTMLEditor, Spin;


const
  HTMLEditSetupIni = 'HTMLEditSetup.ini';
type


  TFrmHtmlEditor = class(TForm)
    FrameHTMLEditor: TFrameHTMLEditor;
    MainMenu1: TMainMenu;
    ButPreviewIE: TMenuItem;
    MmenNewPage: TMenuItem;
    N27: TMenuItem;
    MButOpen: TMenuItem;
    ButSaveHtml: TMenuItem;
    ButSaveAsHtml: TMenuItem;
    N4: TMenuItem;
    PreviewPrintHTML: TMenuItem;
    PrintHTML: TMenuItem;
    N32: TMenuItem;
    ButRtfToHtml: TMenuItem;
    N31: TMenuItem;
    ButGoogleHrome: TMenuItem;
    ButPreviewMozilla: TMenuItem;
    ButPreviewOpera: TMenuItem;
    BtPrewiewBrowserIE: TMenuItem;
    N26: TMenuItem;
    MenEdit: TMenuItem;
    MnUndo: TMenuItem;
    MnRedo: TMenuItem;
    N20: TMenuItem;
    MnuSelectAll: TMenuItem;
    MnCut: TMenuItem;
    MnCopy: TMenuItem;
    MnPaste: TMenuItem;
    MnPasteWithFilter: TMenuItem;
    N1: TMenuItem;
    MnEdObject: TMenuItem;
    N8: TMenuItem;
    MnButFlash: TMenuItem;
    MnInsertImage: TMenuItem;
    MnTable: TMenuItem;
    N9: TMenuItem;
    ButInsertSymbal: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MmenNewPageClick(Sender: TObject);
    procedure MButOpenClick(Sender: TObject);
    procedure ButSaveAsHtmlClick(Sender: TObject);
    procedure ButSaveHtmlClick(Sender: TObject);
    procedure PreviewPrintHTMLClick(Sender: TObject);
    procedure PrintHTMLClick(Sender: TObject);
    procedure ButGoogleHromeClick(Sender: TObject);
    procedure ButPreviewMozillaClick(Sender: TObject);
    procedure ButPreviewOperaClick(Sender: TObject);
    procedure BtPrewiewBrowserIEClick(Sender: TObject);
    procedure MnUndoClick(Sender: TObject);
    procedure MnRedoClick(Sender: TObject);
    procedure MnuSelectAllClick(Sender: TObject);
    procedure MnCutClick(Sender: TObject);
    procedure MnCopyClick(Sender: TObject);
    procedure MnPasteClick(Sender: TObject);
    procedure MnPasteWithFilterClick(Sender: TObject);
    procedure MnEdObjectClick(Sender: TObject);
    procedure MnButFlashClick(Sender: TObject);
    procedure MnInsertImageClick(Sender: TObject);
    procedure MnTableClick(Sender: TObject);
    procedure ButInsertSymbalClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure FRefreshMnButton(Sender: TObject);
  public

    procedure SetParam(aLoadAutoFile,aSaveOptFile,aPathToImage:string);
    { Public declarations }
  end;

var
  FrmHtmlEditor: TFrmHtmlEditor;

implementation

{$R *.dfm}


procedure TFrmHtmlEditor.SetParam(aLoadAutoFile,aSaveOptFile,aPathToImage:string);
begin
  FrameHTMLEditor.SetParam( aLoadAutoFile, aSaveOptFile, aPathToImage );
end;

procedure TFrmHtmlEditor.FormCreate(Sender: TObject);
begin
  FrameHTMLEditor.InitFrame;
  FrameHTMLEditor.SetRefreshFunction( FRefreshMnButton );

 { FrameHTMLEditor.EnabledSetFont( False );
  FrameHTMLEditor.EnabledSetColor( False );
  FrameHTMLEditor.EnabledSetIndent( False );
  FrameHTMLEditor.EnabledSetAlignText( False );
  FrameHTMLEditor.EnabledSetNumList( False );
  FrameHTMLEditor.EnabledSetSubSup( False );
  FrameHTMLEditor.EnabledSetTable( False );
  FrameHTMLEditor.EnabledSetMedia( False );
  FrameHTMLEditor.EnabledSetHR( False );
  FrameHTMLEditor.EnabledSetHiperLink( False );
  //FrameHTMLEditor.EnabledSimpleMode(True);}
end;

procedure TFrmHtmlEditor.FRefreshMnButton(Sender: TObject);
begin
  ButGoogleHrome.Visible    := FrameHTMLEditor.HTMLEditor.PreviewInBrowseIsAvailable(BrPreviewGHrome);
  ButPreviewMozilla.Visible := FrameHTMLEditor.HTMLEditor.PreviewInBrowseIsAvailable(BrPreviewFirefox);
  ButPreviewOpera.Visible   := FrameHTMLEditor.HTMLEditor.PreviewInBrowseIsAvailable(BrPreviewOpera);
  BtPrewiewBrowserIE.Visible:= FrameHTMLEditor.HTMLEditor.PreviewInBrowseIsAvailable(BrPreviewIE);
  //*****************************
  MnUndo.Enabled := FrameHTMLEditor.ButUndo.Enabled;
  MnRedo.Enabled := FrameHTMLEditor.ButRedo.Enabled;

  MnuSelectAll.Enabled := FrameHTMLEditor.ButSelectAll.Enabled;
  MnCut.Enabled   := FrameHTMLEditor.ButCut.Enabled;
  MnCopy.Enabled  := FrameHTMLEditor.ButCopy.Enabled;
  MnPaste.Enabled := FrameHTMLEditor.ButPaste.Enabled;
  MnPasteWithFilter.Enabled := FrameHTMLEditor.ButPasteWithFilter.Enabled;
  MnEdObject.Enabled:= FrameHTMLEditor.HTMLEditor.ObjectSelected; 
  //*****************************
  MnInsertImage.Enabled := FrameHTMLEditor.ButPicture.Enabled;
  MnTable.Enabled := FrameHTMLEditor.ButTable.Enabled;
  MnButFlash.Enabled := FrameHTMLEditor.ButFlash.Enabled;
  //*****************************
  //FrameHTMLEditor.RefreshView;
end;

procedure TFrmHtmlEditor.MmenNewPageClick(Sender: TObject);
begin
  FrameHTMLEditor.ButNew.Click;
end;

procedure TFrmHtmlEditor.MButOpenClick(Sender: TObject);
begin
  FrameHTMLEditor.ButOpen.Click;
end;

procedure TFrmHtmlEditor.ButSaveHtmlClick(Sender: TObject);
begin
  FrameHTMLEditor.ButSaveClick(Sender);
end;

procedure TFrmHtmlEditor.ButSaveAsHtmlClick(Sender: TObject);
begin
  FrameHTMLEditor.ButSaveAsHtmlClick(Sender);
end;

procedure TFrmHtmlEditor.PreviewPrintHTMLClick(Sender: TObject);
begin
  FrameHTMLEditor.ButPreview.Click;
end;

procedure TFrmHtmlEditor.PrintHTMLClick(Sender: TObject);
begin
  FrameHTMLEditor.ButPrint.Click;
end;

procedure TFrmHtmlEditor.ButGoogleHromeClick(Sender: TObject);
begin
  FrameHTMLEditor.ButGoogleHromeClick(Sender);
end;

procedure TFrmHtmlEditor.ButPreviewMozillaClick(Sender: TObject);
begin
  FrameHTMLEditor.ButPreviewMozillaClick(Sender);
end;

procedure TFrmHtmlEditor.ButPreviewOperaClick(Sender: TObject);
begin
  FrameHTMLEditor.ButPreviewOperaClick(Sender);
end;

procedure TFrmHtmlEditor.BtPrewiewBrowserIEClick(Sender: TObject);
begin
  FrameHTMLEditor.BtPrewiewBrowserIEClick(Sender);
end;

procedure TFrmHtmlEditor.MnUndoClick(Sender: TObject);
begin
  FrameHTMLEditor.ButUndo.Click;
end;

procedure TFrmHtmlEditor.MnRedoClick(Sender: TObject);
begin
  FrameHTMLEditor.ButRedo.Click;
end;

procedure TFrmHtmlEditor.MnuSelectAllClick(Sender: TObject);
begin
  FrameHTMLEditor.ButSelectAll.Click;
end;

procedure TFrmHtmlEditor.MnCutClick(Sender: TObject);
begin
  FrameHTMLEditor.ButCut.Click;
end;

procedure TFrmHtmlEditor.MnCopyClick(Sender: TObject);
begin
  FrameHTMLEditor.ButCopy.Click;
end;

procedure TFrmHtmlEditor.MnPasteClick(Sender: TObject);
begin
  FrameHTMLEditor.ButPaste.Click;
end;

procedure TFrmHtmlEditor.MnPasteWithFilterClick(Sender: TObject);
begin
  FrameHTMLEditor.ButPasteWithFilter.Click;
end;

procedure TFrmHtmlEditor.MnEdObjectClick(Sender: TObject);
begin
  FrameHTMLEditor.HTMLEditor.ObjectUpdate;
end;

procedure TFrmHtmlEditor.MnButFlashClick(Sender: TObject);
begin
  FrameHTMLEditor.ButFlash.Click;
end;

procedure TFrmHtmlEditor.MnInsertImageClick(Sender: TObject);
begin
  FrameHTMLEditor.ButPicture.Click;
end;

procedure TFrmHtmlEditor.MnTableClick(Sender: TObject);
begin
  FrameHTMLEditor.ButTable.Click;
end;

procedure TFrmHtmlEditor.ButInsertSymbalClick(Sender: TObject);
begin
  FrameHTMLEditor.ButInsertSymbalClick(Sender);
end;

procedure TFrmHtmlEditor.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  if FrameHTMLEditor.CheckSaveChanged = res_CANCEL then Action:= caNone;
end;

end.
