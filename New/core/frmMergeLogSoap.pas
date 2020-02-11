unit frmMergeLogSoap;

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
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridLevel, cxClasses, cxGridCustomView, StdCtrls, Buttons, ExtCtrls,
  cxImageComboBox, cxCalendar, cxGridBandedTableView, cxGridCardView,
  cxButtonEdit , IBQuery, cxPCdxBarPopupMenu, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxPC, ImgList, cxTL,unitProc,DateUtils,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxDBTL, cxTLData, cxImage,
  cxBlobEdit,cefvcl,ceflib, FrmProgress;

type
  TfrmMergeSoap = class(TForm)
    PanelBottomRight: TPanel;
    CloseBtn: TBitBtn;
    cxGridViewRepository: TcxGridViewRepository;
    DSMergeSoap: TDataSource;
    ViewMergeSoap1C: TcxGridDBTableView;
    ViewMergeSoap1CMEGESOAPID: TcxGridDBColumn;
    ViewMergeSoap1COBJECTNAME: TcxGridDBColumn;
    ViewMergeSoap1CTYPEOPERATION: TcxGridDBColumn;
    ViewMergeSoap1CADATE: TcxGridDBColumn;
    ButSynhronizeAll: TBitBtn;
    ViewMergeSoap1COPERATIONID: TcxGridDBColumn;
    ViewMergeSoap1CUSERNAME: TcxGridDBColumn;
    ViewMergeSoap1CREASON: TcxGridDBColumn;
    MainPageControl: TcxPageControl;
    TabUser: TcxTabSheet;
    TabAdmin: TcxTabSheet;
    PanelTopClient: TPanel;
    ButRefresh: TSpeedButton;
    ButSelfMergeLog: TSpeedButton;
    ButAllMergeLog: TSpeedButton;
    PanelTopAdmin: TPanel;
    ImComboBoxForDateIndex: TcxImageComboBox;
    SpeedButton1: TSpeedButton;
    ButShowJustSynhronize: TSpeedButton;
    ButShowJustNotSynhronize: TSpeedButton;
    ButShowJustAll: TSpeedButton;
    ImageListAction: TImageList;
    ImageListReason: TImageList;
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
    ViewMergeSoapWeb: TcxGridDBTableView;
    ViewMergeSoapWebID: TcxGridDBColumn;
    ViewMergeSoapWebTABLENAME: TcxGridDBColumn;
    ViewMergeSoapWebOPERATIONID: TcxGridDBColumn;
    ViewMergeSoapWebMENID: TcxGridDBColumn;
    ViewMergeSoapWebADATE: TcxGridDBColumn;
    ViewMergeSoapWebREASON: TcxGridDBColumn;
    ViewMergeSoapWebOPERATIONIDTableValue: TcxGridDBColumn;
    PageControlView: TcxPageControl;
    TabView: TcxTabSheet;
    TabTree: TcxTabSheet;
    TreeLogMergeSoapWeb: TcxDBTreeList;
    GridLogMergeSoap: TcxGrid;
    GridLogMergeSoapDBTableView1: TcxGridDBTableView;
    GridLogMergeSoapLevel1: TcxGridLevel;
    TreeLogMergeSoapWebID: TcxDBTreeListColumn;
    TreeLogMergeSoapWebTABLENAME: TcxDBTreeListColumn;
    TreeLogMergeSoapWebOPERATIONID: TcxDBTreeListColumn;
    TreeLogMergeSoapWebUSERNAME: TcxDBTreeListColumn;
    TreeLogMergeSoapWebADATE: TcxDBTreeListColumn;
    TreeLogMergeSoapWebREASON: TcxDBTreeListColumn;
    TreeLogMergeSoapWebPARENT: TcxDBTreeListColumn;
    TreeLogMergeSoapWebcxDBTreeOBJECTNAME: TcxDBTreeListColumn;
    TreeLogMergeSoapWebcxDBTreeListMENID: TcxDBTreeListColumn;
    ViewLog: TcxGridDBTableView;
    ViewLogID: TcxGridDBColumn;
    ViewLogAPLICATION: TcxGridDBColumn;
    ViewLogTITLE: TcxGridDBColumn;
    ViewLogTABLENAME: TcxGridDBColumn;
    ViewLogOBJID: TcxGridDBColumn;
    ViewLogUSERID: TcxGridDBColumn;
    ViewLogTYPEACTION: TcxGridDBColumn;
    ViewLogADATE: TcxGridDBColumn;
    ViewLogFORMNAME: TcxGridDBColumn;
    ViewLogFORMCAPTION: TcxGridDBColumn;
    ViewLogADATA: TcxGridDBColumn;
    ViewLogUSERNAME: TcxGridDBColumn;
    ViewLogAPPLICATIONICON: TcxGridDBColumn;
    TreeLogMergeSoapWebcxDBTreeListKEYFIELD_ID: TcxDBTreeListColumn;
    Panel1: TPanel;
    EdSearch: TcxTextEdit;
    butSearch: TSpeedButton;
    ImageListOther: TImageList;
    procedure ButRefreshClick(Sender: TObject);
    procedure ImComboBoxForDateIndexPropertiesEditValueChanged(
      Sender: TObject);
    procedure ViewMergeSoap1CREASONCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure butSearchClick(Sender: TObject);
    procedure EdSearchKeyPress(Sender: TObject; var Key: Char);
  private
     function FFindAdminCurrentSelectButton:TSpeedButton;
     function FFindUserCurrentSelectButton:TSpeedButton;
    { Private declarations }
  public
    procedure Refresh;
    Procedure ResreshButDown( IsAdmin:Boolean; IndexBut:Integer );
    { Public declarations }
  end;

var
  frmMergeSoap: TfrmMergeSoap;

implementation

uses core;

{$R *.dfm}

function TfrmMergeSoap.FFindAdminCurrentSelectButton:TSpeedButton;
begin
 result:=ButShowJustSynhronize;

 if ButShowJustSynhronize.Down then Result:=ButShowJustSynhronize;
 if ButShowJustNotSynhronize.Down then Result:=ButShowJustNotSynhronize;
 if ButShowJustAll.Down then Result:=ButShowJustAll;
end;
//******************************************************************************
function TfrmMergeSoap.FFindUserCurrentSelectButton:TSpeedButton;
begin
 Result:=ButSelfMergeLog;
 
 if ButSelfMergeLog.Down then Result:=ButSelfMergeLog;
 if ButAllMergeLog.Down then Result:=ButAllMergeLog;
end;
//******************************************************************************
procedure TfrmMergeSoap.Refresh;
var Progres : TProgressFormProp;
begin
  try
    Progres := ShowProgress( WaitFormCaption );
    if MainPageControl.ActivePage = TabAdmin then
       FFindAdminCurrentSelectButton.Click
    else
       FFindUserCurrentSelectButton.Click;
  finally
    ClosedProgress( Progres.FormProgres );
  end;
end;
//******************************************************************************
procedure TfrmMergeSoap.ButRefreshClick(Sender: TObject);
begin
  Refresh;
end;
//******************************************************************************
procedure TfrmMergeSoap.ResreshButDown(IsAdmin:Boolean; IndexBut: Integer);
begin
 if IsAdmin then
 begin                                                                                                                                                                      
   if (IndexBut = 0)and( @ButShowJustSynhronize.OnClick<>nil ) then ButShowJustSynhronize.Down := true;
   if (IndexBut = 1)and( @ButShowJustNotSynhronize.OnClick<>nil ) then ButShowJustNotSynhronize.Down := true;
   if (IndexBut = 2)and( @ButShowJustAll.OnClick<>nil ) then ButShowJustAll.Down := true;
   MainPageControl.ActivePage := TabAdmin;
 end
  else
  begin
    if (IndexBut = 0)and(@ButSelfMergeLog.OnClick<>nil) then ButSelfMergeLog.Down := true;
    if (IndexBut = 1)and(@ButAllMergeLog.OnClick<>nil) then ButAllMergeLog.Down := true;
    MainPageControl.ActivePage := TabUser;
  end;
  
 MainPageControl.HideTabs := true;
end;
//******************************************************************************
procedure TfrmMergeSoap.ImComboBoxForDateIndexPropertiesEditValueChanged(
  Sender: TObject);
begin
  Refresh;
end;
//******************************************************************************
procedure TfrmMergeSoap.ViewMergeSoap1CREASONCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var OldColorBrash:TColor;
begin
  if ( AViewInfo.Value = null )and( not AViewInfo.GridRecord.Focused ) then
    ACanvas.Canvas.Brush.Color := $00CAFFCA;    // Synhronized Green

  if ( AViewInfo.Value = -1 )and( not AViewInfo.GridRecord.Focused ) then
    ACanvas.Canvas.Brush.Color := $00E8E8FF;    // Uncknown  

  if ( AViewInfo.Value = 0 )and( not AViewInfo.GridRecord.Focused ) then
    ACanvas.Canvas.Brush.Color := $00F8FCBE;    // Have't conneñtion

  if ( AViewInfo.Value = 1 )and( not AViewInfo.GridRecord.Focused ) then
    ACanvas.Canvas.Brush.Color := $00E8E8FF;    // Wait for Manager Igree
end;
//******************************************************************************
procedure TfrmMergeSoap.FormShow(Sender: TObject);
begin
 if PageControlView.ActivePage = TabView then GridLogMergeSoap.SetFocus;
 if PageControlView.ActivePage = TabTree then TreeLogMergeSoapWeb.SetFocus;
end;
//******************************************************************************
procedure TfrmMergeSoap.CloseBtnClick(Sender: TObject);
begin
  Close; 
end;
//******************************************************************************
procedure TfrmMergeSoap.butSearchClick(Sender: TObject);
begin
  SearchTextOnViewByAllColumns( TCxGridDBTableView(GridLogMergeSoap.Levels[0].GridView), EdSearch.Text );
end;
//******************************************************************************
procedure TfrmMergeSoap.EdSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then butSearch.Click;
end;
//******************************************************************************
end.


