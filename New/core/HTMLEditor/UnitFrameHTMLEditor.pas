unit UnitFrameHTMLEditor;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, DHTMLEDLib_TLB, StdCtrls, ExtCtrls,
  ShellAPI, ComCtrls, ToolWin, ImgList  ,ActiveX,OleCtnrs,ieConst,
  mshtml_TLB, ComObj,Contnrs,printers, UnitHTMLEditor,SetTable,SelectFor,UnitProc,
  Menus,  UnitSyntaxMemo, Spin, cxGraphics,
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
  cxPCdxBarPopupMenu, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxPC, DB, dxmdaset, dxGDIPlusClasses, cxClasses, dximctrl,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxBlobEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridLevel, cxGridCustomView, cxImage, cxTL,
  cxGridBandedTableView, cxGridCardView, UnitSelICon;
const
  HTMLEditSetupIni = 'HTMLEditSetup.ini';
type
  TFrameHTMLEditor = class(TFrame)
    MainPageControl: TcxPageControl;
    TabVisualEditor: TcxTabSheet;
    MyHTMLEdit: TDHTMLEdit;
    TabHTML: TcxTabSheet;
    OpenDialog: TOpenDialog;
    ImageList1: TImageList;
    cdColor: TColorDialog;
    PMenuInsertTAble: TPopupMenu;
    PupMnInsertTable: TMenuItem;
    N16: TMenuItem;
    PupMnEditTable: TMenuItem;
    N14: TMenuItem;
    PupMnInsertRow: TMenuItem;
    PupMnInsertCol: TMenuItem;
    PupMnInsertCell: TMenuItem;
    N15: TMenuItem;
    PupMnDelRow: TMenuItem;
    PupMnDelCol: TMenuItem;
    PupMnDelCell: TMenuItem;
    N17: TMenuItem;
    PupMnSplitCell: TMenuItem;
    PupMnMergCell: TMenuItem;
    N2: TMenuItem;
    PupMnClearCell: TMenuItem;
    SaveDialog: TSaveDialog;
    ToolBarMain: TToolBar;
    ToolButtonFont: TToolButton;
    ComboBoxFont: TcxComboBox;
    ToolButtonFontSize: TToolButton;
    ComboBoxSize: TcxComboBox;
    ToolButton14: TToolButton;
    ButDel: TToolButton;
    ToolButtonColor: TToolButton;
    ButColor: TToolButton;
    ButFont: TToolButton;
    ButBold: TToolButton;
    ButItalic: TToolButton;
    ButUnderline: TToolButton;
    ButNumList: TToolButton;
    ButBullet: TToolButton;
    ButDecreaseIndent: TToolButton;
    ButIncreaseIndent: TToolButton;
    ToolButtonAlign: TToolButton;
    ButAlingLeft: TToolButton;
    ButAlingCenter: TToolButton;
    ButAlingRight: TToolButton;
    ToolButtonSub: TToolButton;
    ButSub: TToolButton;
    ButSup: TToolButton;
    ToolButtonHR: TToolButton;
    ButInsertHR: TToolButton;
    ToolButtonLink: TToolButton;
    ButHiperLink: TToolButton;
    ToolButton11: TToolButton;
    ButFlash: TToolButton;
    ButVideo: TToolButton;
    ButIframe: TToolButton;
    ButYouTube: TToolButton;
    ButPicture: TToolButton;
    ButTable: TToolButton;
    ToolBarTop: TToolBar;
    ToolButton17: TToolButton;
    ButNew: TToolButton;
    ButOpen: TToolButton;
    ButSave: TToolButton;
    ToolButton3: TToolButton;
    ButPreview: TToolButton;
    ButPrint: TToolButton;
    ToolButton6: TToolButton;
    ButPreviewBrowser: TToolButton;
    ToolButton12: TToolButton;
    ButSelectAll: TToolButton;
    ToolButton19: TToolButton;
    ButCut: TToolButton;
    ButCopy: TToolButton;
    ButPaste: TToolButton;
    ButPasteWithFilter: TToolButton;
    ToolButton15: TToolButton;
    ButUndo: TToolButton;
    ButRedo: TToolButton;
    ToolButton10: TToolButton;
    ButFind: TToolButton;
    ToolButton4: TToolButton;
    ButShowDetail: TToolButton;
    ToolButton8: TToolButton;
    butIconAttach: TToolButton;
    MemDataIcon: TdxMemData;
    MemDataIconCommnet: TStringField;
    MemDataIconBlobFile: TBlobField;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewIconList: TcxGridDBTableView;
    DSMemDataIcon: TDataSource;
    ViewIconListRecId: TcxGridDBColumn;
    ViewIconListCommnet: TcxGridDBColumn;
    ViewIconListBlobFile: TcxGridDBColumn;
    LSheet: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    cxStyle213: TcxStyle;
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    cxStyle216: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    MemDataIconTagName: TStringField;
    ViewIconListTagName: TcxGridDBColumn;
    procedure TabHTMLShow(Sender: TObject);
    procedure ButOpenClick(Sender: TObject);
    procedure ButNumListClick(Sender: TObject);
    procedure ButBulletClick(Sender: TObject);
    procedure ButNewClick(Sender: TObject);
    procedure ButAlingLeftClick(Sender: TObject);
    procedure ButAlingCenterClick(Sender: TObject);
    procedure ButAlingRightClick(Sender: TObject);
    procedure RefreshView;
    procedure FormDestroy(Sender: TObject);
    procedure ButPreviewClick(Sender: TObject);
    procedure ButPrintClick(Sender: TObject);
    procedure ButPreviewBrowserClick(Sender: TObject);
    procedure ButSelectAllClick(Sender: TObject);
    procedure ButCutClick(Sender: TObject);
    procedure ButPasteClick(Sender: TObject);
    procedure ButCopyClick(Sender: TObject);
    procedure ButUndoClick(Sender: TObject);
    procedure ButRedoClick(Sender: TObject);
    procedure ButFindClick(Sender: TObject);
    procedure ButDecreaseIndentClick(Sender: TObject);
    procedure ButIncreaseIndentClick(Sender: TObject);
    procedure ButDelClick(Sender: TObject);
    procedure MyHTMLEditDisplayChanged(Sender: TObject);
    procedure ButColorClick(Sender: TObject);
    procedure ButFontClick(Sender: TObject);
    procedure ButBoldClick(Sender: TObject);
    procedure ButItalicClick(Sender: TObject);
    procedure ButUnderlineClick(Sender: TObject);
    procedure ComboBoxFontPropertiesEditValueChanged(Sender: TObject);
    procedure ComboBoxSizePropertiesEditValueChanged(Sender: TObject);
    procedure ButSubClick(Sender: TObject);
    procedure ButSupClick(Sender: TObject);
    procedure ButInsertHRClick(Sender: TObject);
    procedure ButPictureClick(Sender: TObject);
    procedure ButFlashClick(Sender: TObject);
    procedure ButTableClick(Sender: TObject);
    procedure PupMnInsertTableClick(Sender: TObject);
    procedure TabVisualEditorShow(Sender: TObject);
    procedure ButSaveClick(Sender: TObject);
    procedure PupMnEditTableClick(Sender: TObject);
    procedure PupMnInsertRowClick(Sender: TObject);
    procedure PupMnInsertColClick(Sender: TObject);
    procedure PupMnInsertCellClick(Sender: TObject);
    procedure PupMnDelRowClick(Sender: TObject);
    procedure PupMnDelColClick(Sender: TObject);
    procedure PupMnDelCellClick(Sender: TObject);
    procedure PupMnSplitCellClick(Sender: TObject);
    procedure PupMnMergCellClick(Sender: TObject);
    procedure ButInsertSymbalClick(Sender: TObject);
    procedure PMenuInsertTAblePopup(Sender: TObject);
    procedure ButGoogleHromeClick(Sender: TObject);
    procedure ButPreviewMozillaClick(Sender: TObject);
    procedure ButPreviewOperaClick(Sender: TObject);
    procedure BtPrewiewBrowserIEClick(Sender: TObject);
    procedure ButPreviewIEClick(Sender: TObject);
    procedure MnEdObjectClick(Sender: TObject);
    procedure MenEditClick(Sender: TObject);
    procedure ButHiperLinkClick(Sender: TObject);
    procedure ButPasteWithFilterClick(Sender: TObject);
    procedure ButSaveAsHtmlClick(Sender: TObject);
    procedure ButShowDetailClick(Sender: TObject);

    procedure ButYouTubeClick(Sender: TObject);
    procedure ButIframeClick(Sender: TObject);
    procedure ButVideoClick(Sender: TObject);
    procedure PupMnClearCellClick(Sender: TObject);
    procedure MyHTMLEditDocumentComplete(Sender: TObject);
    procedure butIconAttachClick(Sender: TObject);
  private
    { Private declarations }
    FSaveOptBrowser:TSaveOptBrowser;
    FOptLoadDoc:TTypeLoadDocBrowser;
    FFunctRefresh:TNotifyEvent;

    FLoadAutoFile:String;
    FSaveOptFile:String;
    FPathToImage:String;
    FFirstRun : Boolean;

    procedure InitElementButons;
    procedure SwitchOnTabDesigner;
    procedure SetPathToImage( aPathImage:String='' );
    procedure FPrepare;
  public
    { Public declarations }
    HTMLEditor:TWebHtmlEditor;


    procedure InitFrame;
    procedure RefreshButton(Sender: TObject);
    procedure SetParam(aLoadAutoFile,aSaveOptFile,aPathToImage:string);
    procedure SetRefreshFunction(FunctReresh:TNotifyevent);
    function  CheckSaveChanged:TOptMessageDlgButRes;
    procedure EnabledSetFont( En:Boolean );
    procedure EnabledSetColor( En:Boolean );
    procedure EnabledSetNumList( En:Boolean );
    procedure EnabledSetIndent( En:Boolean );
    procedure EnabledSetAlignText( En:Boolean );
    procedure EnabledSetSubSup( En:Boolean );
    procedure EnabledSetTable( En:Boolean );
    procedure EnabledSetMedia( En:Boolean );
    procedure EnabledSetHR( En:Boolean );
    procedure EnabledSetHiperLink( En:Boolean );
    procedure EnabledIconAttach( En:Boolean );
    procedure EnabledSimpleMode( En:Boolean );
  end;

implementation

{$R *.dfm}

procedure TFrameHTMLEditor.InitFrame;
begin
  FPrepare;
  RefreshView;
end;
//******************************************************************************
procedure TFrameHTMLEditor.FPrepare;
var DC:HDC;
begin
  FFirstRun := True;
  FLoadAutoFile:='';
  FSaveOptFile:='';
  FPathToImage:='';

  FSaveOptBrowser:= BrSaveOptAll;

  HTMLEditor := TWebHtmlEditor.Create( MyHTMLEdit, TabHTML,   ExtractFilePath(Application.ExeName)+HTMLEditSetupIni );
  SetPathToImage;

  HTMLEditor.FontCmbBoxPrepare(ComboBoxFont);
  
  InitElementButons;
  MainPageControl.ActivePage := TabVisualEditor;
  FFunctRefresh:=nil;
end;
//******************************************************************************
procedure TFrameHTMLEditor.SetRefreshFunction(FunctReresh:TNotifyevent);
begin
  FFunctRefresh:=FunctReresh;
  HTMLEditor.SetRefreshFunction( FunctReresh );
  HTMLEditor.RefreshButton(HTMLEditor);
  RefreshView;
end;
//******************************************************************************
procedure TFrameHTMLEditor.SetParam(aLoadAutoFile,aSaveOptFile,aPathToImage:string);
begin
  FLoadAutoFile:= aLoadAutoFile;
  FSaveOptFile:= aSaveOptFile;
  FPathToImage:= aPathToImage;

  self.RefreshView;
end;
//******************************************************************************
procedure TFrameHTMLEditor.TabHTMLShow(Sender: TObject);
begin
 HTMLEditor.PreviewCodeHtml;
 RefreshButton(Sender);
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButOpenClick(Sender: TObject);
begin
  if CheckSaveChanged <> res_CANCEL then
    if OpenDialog.Execute then
      HTMLEditor.LoadHTMLURL( OpenDialog.FileName, FOptLoadDoc );
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButNumListClick(Sender: TObject);
begin
  HTMLEditor.SetNumberedList(ButNumList.Down);
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButBulletClick(Sender: TObject);
begin
  HTMLEditor.SetBulletList(ButBullet.Down);
end;
//******************************************************************************
procedure TFrameHTMLEditor.SwitchOnTabDesigner;
begin
  if MainPageControl.ActivePage <> TabVisualEditor then MainPageControl.ActivePage:= TabVisualEditor;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButNewClick(Sender: TObject);
begin
  if CheckSaveChanged <> res_CANCEL then
  begin
    SwitchOnTabDesigner;
    HTMLEditor.NewHTML;
  end;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButAlingLeftClick(Sender: TObject);
begin
  HTMLEditor.TextAlignment := taLeftJustify;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButAlingCenterClick(Sender: TObject);
begin
  HTMLEditor.TextAlignment := taCenter;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButAlingRightClick(Sender: TObject);
begin
  HTMLEditor.TextAlignment := taRightJustify;
end;
//******************************************************************************
procedure TFrameHTMLEditor.SetPathToImage( aPathImage:String='' );
begin
  HTMLEditor.SetSCCPath('CSS\');
  
  if aPathImage='' then
  begin
    HTMLEditor.SetImagePath('IMAGES\');
    HTMLEditor.SetFlashObjPath('IMAGES\');
    HTMLEditor.SetVideoObjPath('VIDEOS\');
  end
  else
  begin
    HTMLEditor.SetImagePath( aPathImage );
    HTMLEditor.SetFlashObjPath( aPathImage );
    HTMLEditor.SetVideoObjPath( aPathImage );
  end;
end;
//******************************************************************************
procedure TFrameHTMLEditor.FormDestroy(Sender: TObject);
begin
  HTMLEditor.Free;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPreviewClick(Sender: TObject);
begin
  SwitchOnTabDesigner;
  HTMLEditor.PrintPreview;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPrintClick(Sender: TObject);
begin
  SwitchOnTabDesigner;
  if MyShowMessageDlg('Роздрукувати документ ?', mtConfirmation, but_YES_NO ) = res_YES then HTMLEditor.Print;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPreviewBrowserClick(Sender: TObject);
begin
  SwitchOnTabDesigner;
  HTMLEditor.PreviewInBrowser( BrPreviewDefault );
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButSelectAllClick(Sender: TObject);
begin
  HTMLEditor.SelectAll;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButCutClick(Sender: TObject);
begin
  HTMLEditor.CutObj;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButCopyClick(Sender: TObject);
begin
  HTMLEditor.CopyObj;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPasteClick(Sender: TObject);
begin
  HTMLEditor.PasteObj;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPasteWithFilterClick(Sender: TObject);
begin
  HTMLEditor.PasteWithFilter;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButUndoClick(Sender: TObject);
begin
  HTMLEditor.Undo;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButRedoClick(Sender: TObject);
begin
  HTMLEditor.Redo;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButFindClick(Sender: TObject);
begin
  HTMLEditor.ShowFind;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButDecreaseIndentClick(Sender: TObject);
begin
  HTMLEditor.DecreaseIndent;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButIncreaseIndentClick(Sender: TObject);
begin
  HTMLEditor.IncreaseIndent;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButDelClick(Sender: TObject);
begin
  HTMLEditor.DeleteObj;
end;
//******************************************************************************
procedure TFrameHTMLEditor.MyHTMLEditDisplayChanged(Sender: TObject);
var aEvent:TNotiFyEvent;
begin
  HTMLEditor.RefreshFontNameComboBox(ComboBoxFont);
  HTMLEditor.RefreshFontSizeComboBox(ComboBoxSize);
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButColorClick(Sender: TObject);
begin
  HTMLEditor.SetColor;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButFontClick(Sender: TObject);
begin
  HTMLEditor.SelectFont;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButBoldClick(Sender: TObject);
begin
  HTMLEditor.Bold   :=ButBold.Down;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButItalicClick(Sender: TObject);
begin
  HTMLEditor.Italic :=ButItalic.Down;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButUnderlineClick(Sender: TObject);
begin
  HTMLEditor.Underline :=ButUnderline.Down;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ComboBoxFontPropertiesEditValueChanged(
  Sender: TObject);
begin
  HTMLEditor.FontName:=ComboBoxFont.Text;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ComboBoxSizePropertiesEditValueChanged(
  Sender: TObject);
begin
  HTMLEditor.FontSize:=ComboBoxSize.ItemIndex;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButSubClick(Sender: TObject);
begin
  HTMLEditor.InsertSub;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButSupClick(Sender: TObject);
begin
  HTMLEditor.InsertSup;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButInsertHRClick(Sender: TObject);
begin
  HTMLEditor.InsertHR;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPictureClick(Sender: TObject);
var AHTMLTAble:IHTMLElement;
    AHTMLTD   :IHTMLElement;
    AHTMLTR   :IHTMLElement;
    AFileNameImg :String;
    ForSelect  :Integer;
    ForDir     :String;
    k:integer;
begin
  AHTMLTAble:=HTMLEditor.GetCurrentElem('TABLE');
  if AHTMLTAble<>nil then
  begin
    AHTMLTD :=HTMLEditor.GetCurrentElem( 'TD' );
    AHTMLTR :=HTMLEditor.GetCurrentElem( 'TR' );
    ForSelect:=ShowSelectDialog('Вставити малюнок як:',200,100, ['Незалежний малюнок','Фон ячейки'],k);
  end
  else ForSelect:=0;
  //*******************************************************
  if ForSelect=-1 then exit;
  if ForSelect=0  then HTMLEditor.InsertImage('');
  if ForSelect=1  then
  begin
    ForDir :='';
    AFileNameImg:=OPenFileName(ForDir,'*.jpg|*.jpg|*.swf|*.swf|*.*|*.*');
    SetPictureToCell(AHTMLTAble as DispHTMLTable, GetCurRow(AHTMLTR),GetCurCol(AHTMLTD),AFileNameImg);
  end;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButFlashClick(Sender: TObject);
begin
  HTMLEditor.InsertFlash;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButTableClick(Sender: TObject);
begin
  PMenuInsertTAble.Popup( TControl(Sender).ClientOrigin.X, TControl(Sender).ClientOrigin.Y + TControl(Sender).Height );
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnInsertTableClick(Sender: TObject);
begin
  if HTMLEditor.CanInsertTable THEN
     HTMLEditor.InsertTable(TMenuItem(Sender).Caption)
      else HTMLEditor.InsertTable(TMenuItem(Sender).Caption,true);
end;
//******************************************************************************
procedure TFrameHTMLEditor.TabVisualEditorShow(Sender: TObject);
begin
  HTMLEditor.PreviewDesignerFromCodeHtml;
  RefreshButton(Sender);
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButSaveClick(Sender: TObject);
begin
  SwitchOnTabDesigner;
  HTMLEditor.SaveDocument(self.FSaveOptBrowser);
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnEditTableClick(Sender: TObject);
begin
  HTMLEditor.InsertTable(TMenuItem(Sender).Caption,true);
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnInsertRowClick(Sender: TObject);
begin
  HTMLEditor.InsertRow;
  //ShowMessage( HTMLEditor.DocumentBodyHTML );
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnInsertColClick(Sender: TObject);
begin
  HTMLEditor.InsertColumn;
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnInsertCellClick(Sender: TObject);
begin
  HTMLEditor.InsertCell;
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnDelRowClick(Sender: TObject);
begin
  HTMLEditor.DeleteRows;
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnDelColClick(Sender: TObject);
begin
  HTMLEditor.DeleteColumns;
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnDelCellClick(Sender: TObject);
begin
  HTMLEditor.DeleteCells;
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnSplitCellClick(Sender: TObject);
begin
  HTMLEditor.SplitCell;
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnMergCellClick(Sender: TObject);
begin
 HTMLEditor.MergeCells;
end;
//******************************************************************************
procedure TFrameHTMLEditor.PupMnClearCellClick(Sender: TObject);
begin
  HTMLEditor.ClearCell;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButInsertSymbalClick(Sender: TObject);
begin
  ShellExecute(Handle,'OPEN','charmap.exe',nil,nil,SW_SHOW);
end;
//******************************************************************************
procedure TFrameHTMLEditor.InitElementButons;
begin
  HTMLEditor.btnCopy      := ButCopy;
  HTMLEditor.btnCut       := ButCut;
  HTMLEditor.btnPaste     := ButPaste;
  HTMLEditor.butPasteWithFilter := ButPasteWithFilter;
  HTMLEditor.butUndo      := ButUndo;
  HTMLEditor.butRedo      := ButRedo;
  HTMLEditor.btnDel       := ButDel;

  HTMLEditor.btnBold      := ButBold;
  HTMLEditor.btnItalic    := ButItalic;
  HTMLEditor.btnUnderline := ButUnderline;

  HTMLEditor.btnNumList   := ButNumList;
  HTMLEditor.btnBullet    := ButBullet;

  HTMLEditor.butInsertHR  := ButInsertHR;
  HTMLEditor.butHiperLink := ButHiperLink;

  HTMLEditor.butDecreaseIndent := ButDecreaseIndent;
  HTMLEditor.butIncreaseIndent := ButIncreaseIndent;

  HTMLEditor.btnAlignLeft := ButAlingLeft;
  HTMLEditor.btnCenter    := ButAlingCenter;
  HTMLEditor.btnAlignRight:= ButAlingRight;
  HTMLEditor.btnColor     := ButColor;
  HTMLEditor.btnFont      := ButFont;

  HTMLEditor.btnSub       := ButSub;
  HTMLEditor.btnSup       := ButSup;

  HTMLEditor.butPicture   := ButPicture;
  HTMLEditor.butTable     := ButTable;
  HTMLEditor.butFlash     := ButFlash;
  HTMLEditor.butYouTube   := ButYouTube;
  HTMLEditor.butIframe    := ButIframe;
  HTMLEditor.butVideo     := ButVideo;

  HTMLEditor.butShowDetail:= ButShowDetail;
  HTMLEditor.butIconAttach := butIconAttach;
end;
//******************************************************************************
procedure TFrameHTMLEditor.RefreshButton(Sender: TObject);
begin
  ButPasteWithFilter.Enabled :=ButPaste.Enabled; // MainPageControl.ActivePage = TabVisualEditor;
  ButUndo.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  ButRedo.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  ButFind.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  //ButPreviewBrowser.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  ButSelectAll.Enabled := MainPageControl.ActivePage = TabVisualEditor;

  butShowDetail.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  butShowDetail.Down    := HTMLEditor.ShowDtailTag;
  ToolBarMain.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  ComboBoxFont.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  ComboBoxSize.Enabled := MainPageControl.ActivePage = TabVisualEditor;
  //*****************************
  if @FFunctRefresh<> nil  then FFunctRefresh(Sender);
end;
//******************************************************************************
procedure TFrameHTMLEditor.PMenuInsertTAblePopup(Sender: TObject);
begin
  if (HTMLEditor.CanUpdateTable) then PupMnEditTable.Enabled:=true
     else PupMnEditTable.Enabled := false;

  if (HTMLEditor.CanInsertTable) THEN
     PupMnInsertTable.Enabled:=true
      else  PupMnInsertTable.Enabled := false;

  if (HTMLEditor.CanInsertRow) then
     PupMnInsertRow.Enabled :=true
      else   PupMnInsertRow.Enabled := false;

  if (HTMLEditor.CanInsertColumn) then
     PupMnInsertCol.Enabled :=true
       else  PupMnInsertCol.Enabled := false;

  if (HTMLEditor.CanInsertCell) then
     PupMnInsertCell.Enabled :=true
       else  PupMnInsertCell.Enabled := false;

  if (HTMLEditor.CanDeleteRows) then
     PupMnDelRow.Enabled :=true
       else  PupMnDelRow.Enabled := false;

  if (HTMLEditor.CanDeleteColumns) then
     PupMnDelCol.Enabled :=true
       else  PupMnDelCol.Enabled := false;

  if (HTMLEditor.CanDeleteCells) then
     PupMnDelCell.Enabled :=true
       else  PupMnDelCell.Enabled := false;

  PupMnClearCell.Enabled := PupMnDelCell.Enabled;

  if (HTMLEditor.CanSplitCell) then
     PupMnSplitCell.Enabled :=true
      else    PupMnSplitCell.Enabled := false;

  if (HTMLEditor.CanMergeCells)   then
      PupMnMergCell.Enabled :=true
       else    PupMnMergCell.Enabled := false;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButGoogleHromeClick(Sender: TObject);
begin
  HTMLEditor.PreviewInBrowser( BrPreviewGHrome );
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPreviewMozillaClick(Sender: TObject);
begin
  HTMLEditor.PreviewInBrowser( BrPreviewFirefox );
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPreviewOperaClick(Sender: TObject);
begin
 HTMLEditor.PreviewInBrowser( BrPreviewOpera );
end;
//******************************************************************************
procedure TFrameHTMLEditor.BtPrewiewBrowserIEClick(Sender: TObject);
begin
  HTMLEditor.PreviewInBrowser( BrPreviewIE );
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButPreviewIEClick(Sender: TObject);
begin
  RefreshButton(Sender);
end;
//******************************************************************************
procedure TFrameHTMLEditor.MnEdObjectClick(Sender: TObject);
begin
  HTMLEditor.ObjectUpdate;
end;
//******************************************************************************
procedure TFrameHTMLEditor.MenEditClick(Sender: TObject);
begin
  RefreshButton(Sender);
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButHiperLinkClick(Sender: TObject);
begin
  HTMLEditor.InsertLink;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButSaveAsHtmlClick(Sender: TObject);
begin
  SwitchOnTabDesigner;
  HTMLEditor.SaveAsDocument(self.FSaveOptBrowser);
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButShowDetailClick(Sender: TObject);
begin
  HTMLEditor.ShowDtailTag := not HTMLEditor.ShowDtailTag ;
  self.RefreshButton(Sender);
end;
//******************************************************************************
function TFrameHTMLEditor.CheckSaveChanged:TOptMessageDlgButRes;
begin
  if HTMLEditor.DOMIsChanged then
  begin
    result:= MyShowMessageDlg('Зберегти зміни?', mtConfirmation, but_YES_NO_Cancel );
    if result = res_Yes then HTMLEditor.SaveDocument;
  end
   else result:= res_Yes;
end;
//******************************************************************************
procedure TFrameHTMLEditor.RefreshView;
begin
  if HTMLEditor = nil then exit;

  if LowerCase( FSaveOptFile) = 'all' then FSaveOptBrowser := BrSaveOptAll;
  if LowerCase( FSaveOptFile) = 'content' then FSaveOptBrowser := BrSaveOptContent;
  if FPathToImage <>'' then SetPathToImage( FPathToImage );

  FOptLoadDoc := BrLoadDocNormal;
  
  if FLoadAutoFile='' then HTMLEditor.NewHTML
  else
  begin
  
    FOptLoadDoc := BrLoadDocByParam;
    HTMLEditor.FileName := FLoadAutoFile;
    if FileExists( FLoadAutoFile ) then
      HTMLEditor.LoadHTMLURL( FLoadAutoFile, FOptLoadDoc );

  end;
  
  MyHTMLEdit.SetFocus;  
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButYouTubeClick(Sender: TObject);
begin
  HTMLEditor.InsertYoutube;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButIframeClick(Sender: TObject);
begin
  HTMLEditor.InsertIFrame;
end;
//******************************************************************************
procedure TFrameHTMLEditor.ButVideoClick(Sender: TObject);
begin
  HTMLEditor.InsertVideo;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetFont( En:Boolean );
begin
  ToolButtonFont.Visible:=En;
  ToolButtonFontSize.Visible:=En;
  ComboBoxFont.Visible:=En;
  ComboBoxSize.Visible:=En;
  ButFont.Visible:=En;
  ButBold.Visible:=En;
  ButItalic.Visible:=En;
  ButUnderline.Visible:=En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetColor( En:Boolean );
begin
  ToolButtonColor.Visible := En;
  ButColor.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetNumList( En:Boolean );
begin
  ButNumList.Visible := En;
  ButBullet.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetIndent( En:Boolean );
begin
  ButDecreaseIndent.Visible := En;
  ButIncreaseIndent.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetAlignText( En:Boolean );
begin
  ToolButtonAlign.Visible := En;
  ButAlingLeft.Visible := En;
  ButAlingCenter.Visible := En;
  ButAlingRight.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetSubSup( En:Boolean );
begin
  ToolButtonSub.Visible := En;
  ButSub.Visible := En;
  ButSup.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetTable( En:Boolean );
begin
  ButTable.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetMedia( En:Boolean );
begin
  ButPicture.Visible := En;
  ButYouTube.Visible := En;
  ButIframe.Visible := En;
  ButVideo.Visible := En;
  ButFlash.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetHiperLink( En:Boolean );
begin
  ToolButtonLink.Visible := En;
  ButHiperLink.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSetHR( En:Boolean );
begin
  ToolButtonHR.Visible := En;
  ButInsertHR.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledIconAttach(En:Boolean);
begin
 butIconAttach.Visible := En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.EnabledSimpleMode(En:Boolean);
begin
  ToolBarMain.Visible :=not En;
end;
//******************************************************************************
procedure TFrameHTMLEditor.MyHTMLEditDocumentComplete(Sender: TObject);
begin
  if FFirstRun then
  begin
    HTMLEditor.FontCmbBoxSetDefFont( ComboBoxFont, ComboBoxSize );
    HTMLEditor.DOMIsChanged := False;
    FFirstRun :=False;
    HTMLEditor.ReadStyleIconToDB( MemDataIcon, 'BlobFile','Comment','TagName', 'ICON.CSS', 'background', 'content' );
  end;
end;

procedure DBAddBlobFileData( DB:TDataset; fieldName, FileName:String );
var ValueStream:TMemoryStream;
begin
  if DB.FieldByName( fieldName ).IsBlob then
  begin
    try
      ValueStream := TMemoryStream.Create;
      ValueStream.LoadFromFile( FileName );
      TBlobField(DB.FieldByName(fieldName)).LoadFromStream( ValueStream );
    finally
      ValueStream.Free;
    end;
  end;
end;

procedure TFrameHTMLEditor.butIconAttachClick(Sender: TObject);
begin
  if ShowSelectIcon( butIconAttach, ViewIconList, 300, 450) then
    HTMLEditor.InsertClassIconElem( HTMLEditor.IconCssTagElem, MemDataIcon.FieldByName('TagName').AsString );
end;

end.
