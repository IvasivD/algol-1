unit EmbassyDocDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Grids, ImgList, DBGrids, Menus, ActnList, ShellApi,
  ComObj, ExcelXP, IBCustomDataSet, IBDatabase, IBQuery,IBStoredProc,
  IBTable, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,UnitIBQuery,UnitADOQuery,ADODB,
  cxGridTableView, cxGridDBTableView, cxGrid, DocumVisaBr,UnitProc,VisaCenterSelFrm;
  
const 
  nDocIsUse = 0;
  nDocNeedCount = 1;
  nDocIssuePeriod = 2;
  nDocBeginPeriod = 3;
  nDocExpirePeriod = 4;
  nDocForLas = 5;
  nDocAgeRestrict = 6;
  nDocMarried = 7;
  nDocPosada = 8;
  nDocNecessarySum = 9;
  nDocInd = 10;
  nDocManual = 11;
  nDocTransmit = 12;
  nDocReturn = 13;
  nDocLast = nDocReturn;
  NameDocArr: array[nDocNeedCount..nDocLast] of string =(
    'Кількість док.', 'Дата видачі док. до початку періоду дії візи', 
    'Початок періоду дії док. не пізніше початку періоду дії візи',
    'Період дії док. після закінчення періоду дії візи',
    'Документ за останні, щонайменше', 'Обмеження по віку',
    'Сімейний стан', 'Посада', 'Фінансування',
    'Для індивідуалів', 'Додавати вручну', 
    'Не передавати в консульство', 'Повернення туристу');

type
  TPrintReportRec = record
    TypeDocId: Integer;
    DocName: string;
    DocData: array[nDocIsUse..nDocLast] of array of string;
  end;
  TPrintReportArr = array of TPrintReportRec;
type
  TEmbassyDocumDlg = class(TForm)
    ItsKonsulSrc: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    AllDocCheckBox: TCheckBox;
    MemoLabel: TLabel;
    MaybeDBMemo: TDBMemo;
    Label2: TLabel;
    DocumSelectBtn: TSpeedButton;
    DocumUnSelectBtn: TSpeedButton;
    HideUnUseCheckBox: TCheckBox;
    DocEditBtn: TSpeedButton;
    DocCopyOneToAllBtn: TSpeedButton;
    DocCopyAllToAllBtn: TSpeedButton;
    GroupPopupMenu: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    FundingBtn: TSpeedButton;
    UpdateDocEmbassyProc_: TIBStoredProc;
    Panel2: TPanel;
    Splitter1: TSplitter;
    CountLabel: TLabel;
    OneTypeDocPopupMenu: TPopupMenu;
    N3: TMenuItem;
    SubGroupPopupMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Panel3: TPanel;
    Splitter2: TSplitter;
    SameTypeDocLabel: TLabel;
    N4: TMenuItem;
    N5: TMenuItem;
    ActionList: TActionList;
    ShowDocAction: TAction;
    DocLinkPopupMenu: TPopupMenu;
    N6: TMenuItem;
    DBMemo: TDBMemo;
    MaybeMemoLabel: TLabel;
    PartnerBtn: TSpeedButton;
    SpeedButton1: TSpeedButton;
    ExportToExlAction: TAction;
    Label5: TLabel;
    FilingBtn: TSpeedButton;
    CopyOneFilingBtn: TSpeedButton;
    CopyAllFilingBtn: TSpeedButton;
    RefreshBtn: TSpeedButton;
    VisaCenterBtn: TSpeedButton;
    Label4: TLabel;
    SelVisaCenterBtn: TSpeedButton;
    SelSameDocAction: TAction;
    UnSelSameDocAction: TAction;
    PopupMenu1: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    SelSetDocumentAction: TAction;
    UnSelSetDocumentAction: TAction;
    N10: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    SelSameGroupAction: TAction;
    UnSelSameGroupAction: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    MarkUnUseAction: TAction;
    N16: TMenuItem;
    N17: TMenuItem;
    SameTypeImage: TImage;
    ItsDocumVisaListSrc: TDataSource;
    GridEmbassyDBTableView1: TcxGridDBTableView;
    GridEmbassyLevel1: TcxGridLevel;
    GridEmbassy: TcxGrid;
    UsedDocsDBGridDBTableView1: TcxGridDBTableView;
    UsedDocsDBGridLevel1: TcxGridLevel;
    UsedDocsDBGrid: TcxGrid;
    DocTypesDBGridDBTableView1: TcxGridDBTableView;
    DocTypesDBGridLevel1: TcxGridLevel;
    DocTypesDBGrid: TcxGrid;
    GridEmbassyDocumDlg_VisaCenterDBTableView1: TcxGridDBTableView;
    GridEmbassyDocumDlg_VisaCenterLevel1: TcxGridLevel;
    GridEmbassyDocumDlg_VisaCenter: TcxGrid;
    FilingDBGridDBTableView1: TcxGridDBTableView;
    FilingDBGridLevel1: TcxGridLevel;
    FilingDBGrid: TcxGrid;
    GridSelPartnerDBTableView1: TcxGridDBTableView;
    GridSelPartnerLevel1: TcxGridLevel;
    GridSelPartner: TcxGrid;
    OneTypeDocDBGridDBTableView1: TcxGridDBTableView;
    OneTypeDocDBGridLevel1: TcxGridLevel;
    OneTypeDocDBGrid: TcxGrid;
    procedure DocumSelectBtnClick(Sender: TObject);
    procedure DocumUnSelectBtnClick(Sender: TObject);
    procedure ItsKonsulSrcDataChange(Sender: TObject; Field: TField);
    procedure DocEditBtnClick(Sender: TObject);
    procedure RoomTypeNewBtnClick(Sender: TObject);
    procedure UsedDocsDBGridDblClick(Sender: TObject);
    procedure DocCopyOneToAllBtnClick(Sender: TObject);
    procedure DocCopyAllToAllBtnClick(Sender: TObject);
{    procedure UsedDocsDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);}
    procedure HideUnUseCheckBoxClick(Sender: TObject);
    procedure AllDocCheckBoxClick(Sender: TObject);
    procedure ItsDocumVisaListSrcDataChange(Sender: TObject;
      Field: TField);
    procedure DBGridEnter(Sender: TObject);
    procedure NClick(Sender: TObject);
    procedure NSubClick(Sender: TObject);
    procedure N_DelClick(Sender: TObject);
    procedure N_DelSubClick(Sender: TObject);
    procedure EmbassyDBGridDblClick(Sender: TObject);
    procedure FundingBtnClick(Sender: TObject);
//    procedure ItsKonsulQryCalcFields(DataSet: TDataSet);
{    procedure EmbassyDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);}
    procedure N3Click(Sender: TObject);
    procedure UsedDocsDBGridMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure ShowDocActionExecute(Sender: TObject);
{    procedure DocTypesDBGrid_DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);}
    procedure DocLinkPopupMenuPopup(Sender: TObject);
    procedure OneTypeDocPopupMenuPopup(Sender: TObject);
    procedure OneTypeDocQryCalcFields(DataSet: TDataSet);
    procedure OneTypeDocDBGrid_DblClick(Sender: TObject);
    procedure PartnerBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ExportToExlActionExecute(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
{    procedure DBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);}
    procedure SelDocDBGridDblClick(Sender: TObject);
    procedure CopyOneSelDocBtnClick(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure RefreshBtnClick(Sender: TObject);
    procedure VisaCenterBtnClick(Sender: TObject);
{    procedure VisaCenterDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);}
    procedure SelSameDocActionExecute(Sender: TObject);
    procedure SelSetDocumentActionExecute(Sender: TObject);
    procedure SelSameGroupActionExecute(Sender: TObject);
    procedure MarkUnUseActionExecute(Sender: TObject);
    procedure SameTypeImageClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DocTypesDBGridEnter(Sender: TObject);
  private
    { Private declarations }
    FToAll: Boolean;
    FSelectedDoc: Boolean;
    FSQLText: String;
    FEmbassyList: string;
    FEmbassyArr: array of string;
    FEmbassyDocArr: TPrintReportArr;
    function GetEmbassyListId: String;

    function GetSortDoc(Col: Integer): String;
    procedure LoadVisaDocGroups(PopMenu: TPopupMenu; Qry: TDataset;
      GroupName, GroupId: TField);
    procedure DocCopyOneToAll(CountryId: Integer; EmbassyListId, 
      EmbassyName, CountryName: String);
    procedure DocCopyAllToAll(CountryId: Integer; EmbassyListId, 
      EmbassyName, CountryName: String);
    procedure DocCopySelectedToAll(CountryId: Integer; EmbassyListId, 
      EmbassyName, CountryName: String);
    procedure UpdateBtn;
    procedure UpdateDocEmbassy(EmbassyId, CountryId: Integer;
      DataChenged: Boolean; const IsUse: string);
    procedure GetEmbassiesDocData;
    procedure GetEmbassiesDocs;
    procedure ExportToExcel;
    procedure CopyField(const EmbassyListId, EmbassyName: string;
      aTag: Integer);
    procedure UpdateDocQuery(aQuery: TIBQuery; FieldName: string);
    function GetSameTypeDocId: Integer;
    procedure FRefreshDataControls;

    procedure View_EmbassyDocumDlg_UsedDocsDBGridCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure View_EmbassyDocumDlg_UsedDocsDBGridKeyPress(
      Sender: TObject; var Key: Char);

    procedure View_EmbassyDocumDlg_DocTypesDBGridCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure View_EmbassyDocumDlg_VisaCenterDBGridCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure ViewFilingCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure View_EmbassyDocumDlg_SelPartnerDBGridCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure View_EmbassyDocumDlg_EmbassyDBGridFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);

    procedure View_EmbassyDocumDlg_UsedDocsDBGridFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);

   procedure VisaCenterFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);


    procedure View_EmbassyDocumDlg_OneTypeDocDBGridCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

  public
    { Public declarations }
    Function DoDocumUnSelect: Boolean;
    procedure UpdStatusPanel(DatSet: TDataSet);
    procedure InitControls;
    Procedure DeactiveControls;
  end;
function ExecuteEmbassyDocumEdit: Boolean;
var
  EmbassyDocumDlg: TEmbassyDocumDlg;

implementation

uses ServMod, TourConsts, TourCmnlIf, EmbassyDocEdtDlg,
  {DocumVisaBr,} OrderUn, StatForm, FundingFrm, CopyDocToKonsulFrm,
  PartnerForServForm, OptSet, AnketDataFrm, ServModIB, {VisaCenterSelFrm,}
  StrUtils, Math, core;

const FilingImg: array[Boolean] of Integer = (114, 51);

{$R *.dfm}
function ExecuteEmbassyDocumEdit: Boolean;
begin

   Application.CreateForm(TEmbassyDocumDlg, EmbassyDocumDlg);
  try
    EmbassyDocumDlg.Caption := EmbassyDocumDlg.Caption + Elem_BrCountryQry.DB.FieldByName('NAME').asString;

    EmbassyDocumDlg.InitControls;
    EmbassyDocumDlg.UpdateBtn;
    Result := EmbassyDocumDlg.ShowModal = mrOk;
  finally
    EmbassyDocumDlg.DeactiveControls;
    EmbassyDocumDlg.Free;
    //EmbassyDocumDlg:=Nil;
  end;
end;


function TEmbassyDocumDlg.DoDocumUnSelect: Boolean;
begin
  Result := False;
  with Elem_VISADOCUMENTS_NEWQry.DB do
  begin
    if not Active then Open;
    if not Locate('VISADOCUMENTID', Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger, []) then
      ErrorFmtDlg('Не знайдено запис', [])
    else
    begin
      Result := True;
      Delete;
      Elem_DocumVisaQry.Requery;
    end;
  end;
end;

procedure TEmbassyDocumDlg.InitControls;
begin
  FEmbassyList := GetEmbassyListId;
  ItsKonsulSrc.OnDataChange := ItsKonsulSrcDataChange;

  LoadVisaDocGroups( GroupPopupMenu, Elem_VisaDocGroupsQry.DB,
                                     Elem_VisaDocGroupsQry.DB.FieldByName('GROUPNAME'),
                                     Elem_VisaDocGroupsQry.DB.FieldByName('VISADOCGROUPID') );

  LoadVisaDocGroups( SubGroupPopupMenu, Elem_VisaDocSubGroupsQry.DB ,
                                    Elem_VisaDocSubGroupsQry.DB.FieldByName('NAME'),
                                    Elem_VisaDocSubGroupsQry.DB.FieldByName('ID') );

  Elem_ItsDocumVisaListQry.AddCellDblClick( View_EmbassyDocumDlg_UsedDocsDBGridCellDblClick );
  Elem_ItsDocumVisaListQry.View.OnKeyPress := View_EmbassyDocumDlg_UsedDocsDBGridKeyPress;
  Elem_DocumVisaQry.AddCellDblClick( View_EmbassyDocumDlg_DocTypesDBGridCellDblClick );
  Elem_SelVisaCentersQry.AddCellDblClick( View_EmbassyDocumDlg_VisaCenterDBGridCellDblClick );
  Elem_TOURISTANKETTEMPLATES.AddCellDblClick( ViewFilingCellDblClick );
  Elem_SelPartnersQry.AddCellDblClick( View_EmbassyDocumDlg_SelPartnerDBGridCellDblClick );
  Elem_OneTypeDocQry.AddCellDblClick( View_EmbassyDocumDlg_OneTypeDocDBGridCellDblClick );

  TcxGridDBTableView(GridEmbassy.Levels[0].GridView).OnFocusedRecordChanged:= View_EmbassyDocumDlg_EmbassyDBGridFocusedRecordChanged;
  TcxGridDBTableView(UsedDocsDBGrid.Levels[0].GridView).OnFocusedRecordChanged := View_EmbassyDocumDlg_UsedDocsDBGridFocusedRecordChanged;
 { TcxGridDBTableView(GridEmbassyDocumDlg_VisaCenter.Levels[0].GridView).OnFocusedRecordChanged:=VisaCenterFocusedRecordChanged;
  SetFilterOnWievForManyColumns( TcxGridDBTableView( GridEmbassy.Levels[0].GridView ), ['OUREMBASSY','InProvince'], ['F',null], ['=','<>'], [], fboAnd , True, false );
  SetFilterOnWievForManyColumns( TcxGridDBTableView( GridEmbassy.Levels[0].GridView ), ['ForOwnerVisa'], ['T'], ['='], [fboOr], fboOr , True, True );
  }
  Elem_BrCountryQry.DBOpen;
  Elem_DocumVisaQry.DBOpen;

  Elem_ItsDocumVisaListQry.DBOpen;

  Elem_SelVisaCentersQry.DBOpen;
  Elem_TOURISTANKETTEMPLATES.DBOpen;
  Elem_OneTypeDocQry.DBOpen;
  Elem_SelPartnersQry.DBOpen;

  FToAll :=False;
  FSelectedDoc := False;
  Self.FRefreshDataControls;
end;

Procedure TEmbassyDocumDlg.DeactiveControls;
begin
  SetFilterOnWievForManyColumns( TcxGridDBTableView( GridEmbassy.Levels[0].GridView ), ['OUREMBASSY','InProvince'], ['F',null], ['=','<>'], [fboAnd,fboOr], fboAnd, False, false );
  TcxGridDBTableView(GridEmbassy.Levels[0].GridView).OnFocusedRecordChanged:= nil;
  TcxGridDBTableView(UsedDocsDBGrid.Levels[0].GridView).OnFocusedRecordChanged := nil;
  TcxGridDBTableView(GridEmbassyDocumDlg_VisaCenter.Levels[0].GridView).OnFocusedRecordChanged:=nil; 
end;

procedure TEmbassyDocumDlg.DocumSelectBtnClick(Sender: TObject);
begin
  inherited;
  FSelectedDoc := True;
  DocEditBtn.Click;
  UpdateBtn;
  UsedDocsDBGrid.SetFocus;
end;

procedure TEmbassyDocumDlg.DocumUnSelectBtnClick(Sender: TObject);
var Id: Integer;
begin
  inherited;
  Id := Elem_ItsDocumVisaListQry.DB.FieldByName('DOCID').asInteger;
  if WarningFmtDlgYC(SVisaDocumentFrmWarningDelete, [Elem_ItsDocumVisaListQry.DB.FieldByName('VIEWNAME').asString]) then
    DoDocumUnSelect;

  Elem_DocumVisaQry.DB.Locate('ID', Id, []);
  
  UpdateBtn;
  DocTypesDBGrid.SetFocus;
end;

procedure TEmbassyDocumDlg.ItsKonsulSrcDataChange(Sender: TObject;
  Field: TField);
var TypeDocId, Id, EmbassyId, CountryId: Integer;
begin
  inherited;

  TypeDocId := Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEDOCID').asInteger;
  Elem_DocumVisaQry.Requery;
  Elem_ItsDocumVisaListQry.DB.Locate('TypeDocID', TypeDocId, []);

  EmbassyId := Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
  CountryId := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger;

  Id := Elem_DocumVisaQry.GetValueId;

  Elem_DocumVisaQry.DB.Locate('ID', Id,[]);
  UpdateBtn;
  Elem_SelPartnersQry.DBOpen;
end;

procedure TEmbassyDocumDlg.DocEditBtnClick(Sender: TObject);
var EmbassyDocId, DocId, TypeDocId: Integer;
    DocName, DocMemo: String;
    DataChenged: Boolean;
    LinkField: TField;
begin
  inherited;
  if not FSelectedDoc then
  with DMServ do
  begin
    EmbassyDocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;
    DocName := Elem_ItsDocumVisaListQry.DB.FieldByName('VIEWNAME').asString;
    DocId := Elem_ItsDocumVisaListQry.DB.FieldByName('DOCID').asInteger;
    TypeDocId := Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEDOCID').asInteger;
    DocMemo := Elem_ItsDocumVisaListQry.DB.FieldByName('COMMENTS').AsVariant;
    LinkField := Elem_ItsDocumVisaListQry.DB.FieldByName('LINK');
  end
  else
  begin
    EmbassyDocId := 0;

    DocName := Elem_DocumVisaQry.DB.FieldByName('NAME').AsString;
    DocId :=  Elem_DocumVisaQry.DB.FieldByName('ID').asInteger;
    DocMemo := Elem_DocumVisaQry.DB.FieldByName('MEMO').AsString;
    LinkField := nil;
  end;

  if ExecuteEmbassyDocEdit( EmbassyDocId, DocName, FSelectedDoc, DocId, TypeDocId, DocMemo, DataChenged, LinkField) then
  begin
    if not FSelectedDoc then EmbassyDocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;

    Elem_ItsDocumVisaListQry.Requery;
    Elem_DocumVisaQry.Requery;

    //UpdateQuery(DMServ.ItsDocumVisaListQry);
    //UpdateQueryEx(DocumVisaListQry);

    Elem_ItsDocumVisaListQry.DB.Locate('VISADOCUMENTID', EmbassyDocId, []);

    UpdateDocEmbassy( Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').Value,
      Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger,
      DataChenged, Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').asString );
  end;
  FSelectedDoc := False;
end;

procedure TEmbassyDocumDlg.RoomTypeNewBtnClick(Sender: TObject);
begin
  AppendDocumVisaRecord;
  //UpdateQueryEx(DocumVisaListQry);
  Elem_DocumVisaQry.DBOpen;
end;

procedure TEmbassyDocumDlg.UsedDocsDBGridDblClick(Sender: TObject);
var Fld: string;
begin
 { inherited;
  FSelectedDoc := False;
  if Elem_ItsDocumVisaListQry.DBRecordCount > 0
  then DocEditBtn.Click; }
end;

procedure TEmbassyDocumDlg.DocCopyOneToAll(CountryId: Integer; 
  EmbassyListId, EmbassyName, CountryName: String);
const                 
uSql =
  'update VISADOCUMENTS_NEW set NEEDCOUNT = %d, AGERESTRICTION = %d, ' +
  'EXPIREMONTHS = %s, ISSUEDMONTHS = %s, SUMMA = :Summa, COMMENTS = ''%s'', ' +
  'PERIOD = %s, ISUSE = ''%s'', EXPIREPERIOD = %s, ' +  //TYPEID = %d,
  'ISSUESPERIOD = %s,  TYPEVAL = %s, ' +
  'FORADDMANUAL = ''%s'', FORIND = ''%s'', MARRIEDSTATE = %s, ' +
  'POSADA = %s, FUNDING = %s, RETURNED = ''%s'', TRANSMIT = ''%s'', ' +
  'FUNDINGCOUNT = %s, BEGINDOC = %s, DOCFORLASTCOUNT = %s, DOCFORLASTPERIOD = %s, ' +
  'BEFOREFILING = %s, BEFOREFILINGPERIOD = %s, BANKWITHOUTSUM = %s, '+
  'FILINGATWORK = %s, ForOwnerVisa = %s ' +
  'where EmbassyId in (%s) and TypeDocId = %d and ' +
  'EmbassyId in (select EmbassyId from VISADOCUMENTS_NEW ' +
  'where CountryId = %d and TypeDocId = %d ) ';
sQry =
  'insert into VISADOCUMENTS_NEW (EmbassyId, CountryId, NEEDCOUNT, AGERESTRICTION, ' +
  'EXPIREMONTHS, ISSUEDMONTHS, SUMMA, COMMENTS, PERIOD, ISUSE, TYPEDOCID,' +  //DOCID, TYPEID,
  'EXPIREPERIOD, ISSUESPERIOD, TYPEVAL, ' +
  'FORADDMANUAL, FORIND, MARRIEDSTATE, POSADA, FUNDING, FUNDINGCOUNT, ' +
  'RETURNED, TRANSMIT, BEGINDOC, DOCFORLASTCOUNT, DOCFORLASTPERIOD, ' +
  'BEFOREFILING, BEFOREFILINGPERIOD, BANKWITHOUTSUM, FILINGATWORK, VisaDocGroupId, SubGroupId, ' +
  'ForOwnerVisa ) ' +
  'select E.EmbassyId, %d, %d, %d, ' +
  '%s, %s, :Summa, ''%s'', %s, ''%s'', %d, %s, %s, %s, ' + //
  '''%s'' , ''%s'', %s, %s , %s, %s, ' +
  '''%s'', ''%s'', %s, %s , %s, %s, %s, %s, %s, %s, %s, ' +
  '%s ' +
  'from CntrEmbassies E ' +
  'left join Companies Co on Co.CompanyId = E.EmbassyId ' +
  'where E.EmbassyId in (%s) and Co.AsAmbas = ''T'' and ' +
  '( (E.InProvince is not null) and (E.InProvince <> '''') or E.ForOwnerVisa = ''T'') and ' +
  'E.EmbassyId not in (select EmbassyId from VISADOCUMENTS_NEW ' +
  'where CountryId = %d and TypeDocId = %d) ';

var
  NeedCount, AGERESTRICTION, TypeDocId: Integer;
  Period, ExpirePeriod, IssuesPeriod, TypeVal: Variant;
  Summa: Real;
  DocName, Comments, IsUse: String;
  FORADDMANUAL, FORIND, FUNDING, ForOwnerVisa: String;
  EXPIREMONTHS, ISSUEDMONTHS,RETURNED, TRANSMIT: String;
  MARRIEDSTATE, POSADAID, FUNDINGCOUNT: Variant;
  BEGINDOC, DOCFORLASTCOUNT, DOCFORLASTPERIOD: Variant;
  BEFOREFILING, BEFOREFILINGPERIOD, BANKWITHOUTSUM, FILINGATWORK: Variant;
  Group, SubGroup: Variant;
  Msg: String;
  StList: TStringList;
  I: Integer;

  DBParam : TConnectDBParam;

  ApplyOtherSql:Widestring;
begin
  DocName := Elem_ItsDocumVisaListQry.DB.FieldByName('VIEWNAME').asString;
  NeedCount := Elem_ItsDocumVisaListQry.DB.FieldByName('NEEDCOUNT').asInteger;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('EXPIREMONTHS') do
  if IsNull then EXPIREMONTHS := 'Null'
  else EXPIREMONTHS := AsString;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('ISSUEDMONTHS') do
  if IsNull then ISSUEDMONTHS := 'Null'
  else ISSUEDMONTHS := AsString;

  AGERESTRICTION := Elem_ItsDocumVisaListQry.DB.FieldByName('AGERESTRICTION').asInteger;
  Summa := Elem_ItsDocumVisaListQry.DB.FieldByName('SUMMA').AsVariant;
  Comments := StringReplace(Elem_ItsDocumVisaListQry.DB.FieldByName('COMMENTS').AsVariant,
      '''','''''', [rfReplaceAll] );

  TypeDocId := Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEDOCID').asInteger;
  with DMServ.ItsDocumVisaListQryperiod do
  if IsNull then Period := 'Null'
    else Period := Value;
  IsUse := Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').asString;
  with Elem_ItsDocumVisaListQry.DB.FieldByName('EXPIREPERIOD') do
  if IsNull then ExpirePeriod := 'Null'
    else ExpirePeriod := Value;
  with Elem_ItsDocumVisaListQry.DB.FieldByName('PERIOD') do
  if IsNull then IssuesPeriod := 'Null'
  else IssuesPeriod := Value;
  with Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEVAL') do
  if IsNull then TypeVal := 'Null'
  else TypeVal := Value;
  with Elem_ItsDocumVisaListQry.DB.FieldByName('FUNDING') do
  if IsNull then FUNDING := 'Null'
  else FUNDING := ''''+Value+'''';
  with Elem_ItsDocumVisaListQry.DB.FieldByName('FUNDINGCOUNT') do
  if IsNull then FUNDINGCOUNT := 'Null'
  else FUNDINGCOUNT := Value;

  FORADDMANUAL := Elem_ItsDocumVisaListQry.DB.FieldByName('FORADDMANUAL').asString;
  FORInd := Elem_ItsDocumVisaListQry.DB.FieldByName('FORIND').asString;
  RETURNED := Elem_ItsDocumVisaListQry.DB.FieldByName('RETURNED').asString;
  TRANSMIT := Elem_ItsDocumVisaListQry.DB.FieldByName('TRANSMIT').asString;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('MARRIEDSTATE') do
  if IsNull then MarriedState := 'Null'
  else MarriedState := Value;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('POSADAID') do
  if IsNull then PosadaId := 'Null'
  else PosadaId := Value;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('BEGINDOC') do
  if IsNull then BeginDoc := 'Null'
  else BeginDoc := '''' + Value + '''';

  with Elem_ItsDocumVisaListQry.DB.FieldByName('DOCFORLASTCOUNT') do
  if IsNull then DocForLastCount := 'Null'
  else DocForLastCount := Value;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('DOCFORLASTPERIOD') do
  if IsNull then DocForLastPeriod := 'Null'
  else DocForLastPeriod := Value;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('VisaDocGroupId') do
  if IsNull then Group := 'Null'
  else Group := Value;
  with Elem_ItsDocumVisaListQry.DB.FieldByName('SUBGROUPID') do
  if IsNull then SubGroup := 'Null'
  else SubGroup := Value;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('BEFOREFILING') do
  if IsNull then BEFOREFILING := 'Null'
  else BEFOREFILING := Value;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('BEFOREFILINGPERIOD') do
  if IsNull then BEFOREFILINGPERIOD := 'Null'
  else BEFOREFILINGPERIOD := Value;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('BANKWITHOUTSUM') do
  if IsNull then BANKWITHOUTSUM := 'Null'
  else BANKWITHOUTSUM := #39 + Value + #39;  

  with Elem_ItsDocumVisaListQry.DB.FieldByName('FILINGATWORK') do
  if IsNull then FILINGATWORK := 'Null'
  else FILINGATWORK := #39 + Value + #39;

  with Elem_ItsDocumVisaListQry.DB.FieldByName('FOROWNERVISA') do
  if IsNull then ForOwnerVisa := 'Null'
  else ForOwnerVisa := AsString;

  DBParam := Elem_ItsDocumVisaListQry.DBGetParamConnect;
  ApplyOtherSql := Format(uSql, [ NeedCount, AGERESTRICTION, EXPIREMONTHS,
      ISSUEDMONTHS, Comments,{TypeId,} Period, IsUse,
      ExpirePeriod, IssuesPeriod, TypeVal,
      FORADDMANUAL, FORIND, MARRIEDSTATE, POSADAID, FUNDING, RETURNED, TRANSMIT,
      FUNDINGCOUNT, BeginDoc, DocForLastCount, DocForLastPeriod,
      BEFOREFILING, BEFOREFILINGPERIOD, BANKWITHOUTSUM, FILINGATWORK, ForOwnerVisa,
      EmbassyListId, TypeDocId, CountryId, TypeDocId]);
  ReplaseON( ApplyOtherSql,':Summa', FloatToStr(Summa) );
  DBUpdate( ApplyOtherSql, DBParam );

  if IsUse = 'T' then
  begin
    ApplyOtherSql := Format(sQry, [ CountryId, NeedCount, AGERESTRICTION, EXPIREMONTHS,
        ISSUEDMONTHS, Comments, Period, IsUse, TypeDocId,
        ExpirePeriod, IssuesPeriod, TypeVal,
        FORADDMANUAL, FORIND, MARRIEDSTATE, POSADAID, FUNDING, FUNDINGCOUNT,
        RETURNED, TRANSMIT, BeginDoc, DocForLastCount, DocForLastPeriod,
        BEFOREFILING, BEFOREFILINGPERIOD, BANKWITHOUTSUM, FILINGATWORK,
        Group, SubGroup, ForOwnerVisa,
        EmbassyListId, CountryId, TypeDocId ]);

    ReplaseON( ApplyOtherSql, ':Summa', FloatToStr(Summa) );
    DBUpdate( ApplyOtherSql, DBParam );
  end;

  try
    StList := TStringList.Create();
    StList.CommaText := EmbassyListId;
    for i := 0 to StList.Count - 1 do
      UpdateDocEmbassy(StrToInt(StList[I]), CountryId, true, Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').asString);
  finally
    StList.Free;
  end;
end;

procedure TEmbassyDocumDlg.DocCopyAllToAll(CountryId: Integer; 
  EmbassyListId, EmbassyName, CountryName: String);
var Id: Integer;
    Msg: String;
begin
  inherited;
  Id := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;
  if EmbassyName = EmptyStr then Msg := Format(SVisaDocumentFrmConfirmDocCopyAll, [CountryName])
  else Msg := Format(SVisaDocumentFrmConfirmDocCopyAlltoEmb, [EmbassyName]);
  if ConfirmDlgYN(Msg) then
  with Elem_ItsDocumVisaListQry.DB do
  begin
    FToall := True;
    First;
    while not Eof do
    begin
      DocCopyOneToAll(CountryId, EmbassyListId, EmbassyName, CountryName);
      Next
    end;
    Locate('VISADOCUMENTID', Id, []);
    FToAll := False;
  end;
end;
(*
procedure TEmbassyDocumDlg.UsedDocsDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
const VisaImg: array[1..2] of Integer = (69, 123);
var ColName: String;
begin
 { inherited;
  ColName := Column.FieldName;
  with DMServ, (Sender as TSvtDBGrid) do
  begin
    if ItsDocumVisaListQryISUSE.IsNull or ( Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').asString = 'F' ) then
     Canvas.Font.Color := clRed;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
    if not ItsDocumVisaListQryLINK.IsNull and (ColName = 'VIEWNAME')
    then BrowseImgList.Draw(Canvas, Rect.Right - 17, Rect.Top + 1, 61)
    else if (ColName = 'TYPENAME') and ItsDocumVisaListQryFILINGATWORK.AsBoolean
    then BrowseImgList.Draw(Canvas, Rect.Right - 17, Rect.Top + 1, 118);    

    if (ColName = 'FORIND') or (ColName = 'FORADDMANUAL')
        or (ColName = 'RETURNED') or (ColName = 'TRANSMIT')
        or (ColName = 'BEGINDOC') or (ColName = 'FOROWNERVISA') then
     begin
       Canvas.Brush.Style := bsSolid;
       Canvas.FillRect(Rect);
       if ((ColName = 'FORIND') and (Elem_ItsDocumVisaListQry.DB.FieldByName('FORIND').asString = 'T'))
         or ((ColName = 'FORADDMANUAL') and (Elem_ItsDocumVisaListQry.DB.FieldByName('FORADDMANUAL').asString = 'T'))
          or ((ColName = 'RETURNED') and (Elem_ItsDocumVisaListQry.DB.FieldByName('RETURNED').asString = 'T'))
           or ((ColName = 'TRANSMIT') and (Elem_ItsDocumVisaListQry.DB.FieldByName('TRANSMIT').asString = 'T'))
            or ((ColName = 'BEGINDOC') and (Elem_ItsDocumVisaListQry.DB.FieldByName('BEGINDOC').asString = 'T'))
       then DMServ.BrowseImgList.Draw(
         Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, 69)
       else with ItsDocumVisaListQryFOROWNERVISA do 
       if (ColName = 'FOROWNERVISA') and not IsNull
       then DMServ.BrowseImgList.Draw(
         Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, VisaImg[Value])
     end;
  end }
end;     *)

procedure FilterDBItsDocumVisaListQry( DataSet: TDataSet; var Accept: Boolean );
begin
   Accept := DataSet.FieldByName('IsUse').AsString='T';
end;


procedure TEmbassyDocumDlg.HideUnUseCheckBoxClick(Sender: TObject);
var Id: Integer;
begin
  inherited;
  Elem_ItsDocumVisaListQry.AddFilterFunct( FilterDBItsDocumVisaListQry );
  Elem_ItsDocumVisaListQry.DB.Filtered := HideUnUseCheckBox.Checked;
end;

procedure TEmbassyDocumDlg.AllDocCheckBoxClick(Sender: TObject);

//const AllDocSQL = 'select  N.VIEWID DocId, N.VIEWNAME DocName, ' +
//                  'N.MEMO, N.ShortName ' +
//                  'from DOCUM_VISA_VIEW N ' +
//                  'order by 2';
var Id:Integer;
begin
  inherited;
  //with Elem_DocumVisaListQry.DB do
  Exit;
  begin
   Id :=  Elem_DocumVisaQry.GetValueId;
   Elem_DocumVisaQry.DB.Close;

   if AllDocCheckBox.Checked then
   begin
     //FSQLText := Elem_DocumVisaListQry.DBGetSQL;
     Elem_DocumVisaQry.DBQueryChangeSql( Elem_DocumVisaQry.DBGetSQLWithoutAfterFrom,False);
     //SQL.Text := AllDocSQL;
   end else
   begin
    Elem_DocumVisaQry.DBQueryChangeSql( Elem_DocumVisaQry.MainSQL, False);  //  MainSQL
    //SQL.Text := FSQLText;
    Elem_DocumVisaQry.DBQuerySetParamValue('EmbassyId', Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').Value );
    //ParamByName('EmbassyId').Value :=  Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').Value;//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
   end;
   Elem_DocumVisaQry.DBOpen;
   Elem_DocumVisaQry.DB.Locate('DOCID', Id, [])
  end;
end;

procedure TEmbassyDocumDlg.ItsDocumVisaListSrcDataChange(Sender: TObject;
  Field: TField);
const Capt='Кількість записів : %d';
begin
 { inherited;
  with CountLabel do
  Caption := Format(Capt, [ Elem_ItsDocumVisaListQry.DBRecordCount ]);
  with DMServ do
  DocumUnSelectBtn.Enabled := ( Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').IsNull)  or
                              ( Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').asString = 'F' );

  if not Elem_ItsDocumVisaListQry.DB.FieldByName('SETOFDOCUMENT').IsNull
    and not Elem_ItsDocumVisaListQry.DB.FieldByName('SAMETYPEDOCID').IsNull then
     SameTypeDocLabel.Caption := 'Взаємозамінні набори документів'
  else
   if not Elem_ItsDocumVisaListQry.DB.FieldByName('SETOFDOCUMENT').IsNull then
     SameTypeDocLabel.Caption := 'Набір документів'
  else
    SameTypeDocLabel.Caption := 'Взаємозамінні документи';   }
end;

procedure TEmbassyDocumDlg.UpdStatusPanel(DatSet: TDataSet);
var SelRowCount: Integer;
begin
  SelRowCount := 0;
   //Elem_ItsDocumVisaListQry.View.DataController.RowCount
  if DatSet is TIBCustomDataSet then TIBCustomDataSet(DatSet).FetchAll;

  if DatSet = Elem_ItsDocumVisaListQry.DB then SelRowCount :=  Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount;
  StatusBarForm.StatusBar.Panels[1].Text := IntToStr(DatSet.RecordCount)  +
  IfThen(SelRowCount > 1, ' (' + IntToStr(SelRowCount) + ')', '');
end;

procedure TEmbassyDocumDlg.DBGridEnter(Sender: TObject);
begin
  {inherited;
  UpdStatusPanel((Sender as TSvtDBGrid).DataSource.DataSet);
  UpdateBtn;  }
end;

procedure TEmbassyDocumDlg.NClick(Sender: TObject);
const 
  sUpdOneDocSQL = 'Update VISADOCUMENTS_NEW Set VisaDocGroupId = %d ' +
    'Where VisaDocumentId = %d';
//    'Where TypeDocId = %d and CountryId = %d';
var IdGroup: Integer;
begin
  inherited;
  IdGroup := (Sender as TMenuItem).Tag;
 { with DMServ, UpdQry do
  begin
    if Active then Close;    
    SQL.Text := Format(sUpdOneDocSQL, [IdGroup, Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger] );
    ExecSQL;
    Elem_ItsDocumVisaListQry.Requery;
    //UpdateQueryAndLocate( Elem_ItsDocumVisaListQry.DB, Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID') );
  end; }
end;

procedure TEmbassyDocumDlg.N_DelClick(Sender: TObject);
const sClearSQL = 'Update VISADOCUMENTS_NEW ' +
      'Set VisaDocGroupId = null ' +
      'Where VisaDocumentId = %d';
//      'Where TypeDocId = %d and CountryId = %d';
begin
  inherited;
  {with DMServ, UpdQry do
  begin
    if Active then Close;
    SQL.Text := Format(sClearSQL, [ Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger ]);
    ExecSQL;
    Elem_ItsDocumVisaListQry.Requery;
    //UpdateQueryAndLocate( Elem_ItsDocumVisaListQry.DB, Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID') );
  end;  }
end;

procedure TEmbassyDocumDlg.LoadVisaDocGroups(PopMenu: TPopupMenu; Qry: TDataset;
  GroupName, GroupId: TField);
var MenuItemCount: Integer;
    NewItem: TMenuItem;
begin
  //if Qry is TIBCustomDataSet then UpdateQuery(TIBQuery(Qry));
  if not Qry.Active then Qry.Open;

  for MenuItemCount := PopMenu.Items.Count - 1 downto 2 do
  PopMenu.Items[MenuItemCount].Free;
  with Qry do
  begin
    First;
    while not Eof do
    begin
      NewItem := TMenuItem.Create(PopMenu);
      PopMenu.Items.Add(NewItem);
      NewItem.Caption := GroupName.Value;
      NewItem.Tag := GroupId.Value;
      if PopMenu.Tag = 0 then NewItem.OnClick := NClick
      else NewItem.OnClick := NSubClick;
      Next;
    end;
  end;
end;

procedure TEmbassyDocumDlg.FundingBtnClick(Sender: TObject);
var (*BankPeriod, BankCount, BankVal, PermTransf: Integer;
    FundingSum, BankSum: Real;*)
    Id, DocId: Integer;
begin
  inherited;
  Id :=  Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').Value;//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
  DocId := Elem_ItsDocumVisaListQry.DB.FieldByName('DOCID').asInteger;
  if ExecuteEmbassyFunding( ( Elem_CNTREMBASSIES.DB ) )   //DMServIB.ItsKonsulQry
  then
  begin
    Elem_CNTREMBASSIES.requery;
    //UpdateQuery(TIBQuery( Elem_CNTREMBASSIES.DB ) , True, True);  //  DMServIB.ItsKonsulQry

    Elem_CNTREMBASSIES.DB.Locate('COMPANYID', Id, []);
    Elem_ItsDocumVisaListQry.DB.Locate('DOCID', DocId, []);
  end;
end;

procedure TEmbassyDocumDlg.EmbassyDBGridDblClick(Sender: TObject);
begin
  inherited;
  FundingBtn.Click
end;
 
procedure TEmbassyDocumDlg.DocCopyOneToAllBtnClick(Sender: TObject);
var CountryId, SelDocCount: Integer;
    EmbassyListId, EmbassyName, CountryName: string;
begin
  //with UsedDocsDBGrid.SelectedRows do SelDocCount := IfThen(Count = 0, 1, Count);
  SelDocCount := TcxGridDBTableView(UsedDocsDBGrid.FocusedView).DataController.Controller.SelectedRecordCount;
  EmbassyName := Elem_CNTREMBASSIES.DB.fieldByName('EMBASSYNAME').AsString;// Elem_ItsKonsulQry.DB.FieldByName('EMBASSYNAME').asString;

  if ExecuteCopyDocToKonsul(CountryId, EmbassyListId, EmbassyName, CountryName,
    Elem_ItsDocumVisaListQry.DB.FieldByName('VIEWNAME').asString, SelDocCount)
  then DocCopySelectedToAll{DocCopyOneToAll}(CountryId, EmbassyListId, EmbassyName, CountryName)
end;

procedure TEmbassyDocumDlg.DocCopyAllToAllBtnClick(Sender: TObject);
var CountryId: Integer;
    EmbassyListId, EmbassyName, CountryName: string;
begin
  EmbassyName := Elem_CNTREMBASSIES.DB.fieldByName('EMBASSYNAME').AsString; //Elem_ItsKonsulQry.DB.FieldByName('EMBASSYNAME').asString;
  if ExecuteCopyDocToKonsul(CountryId, EmbassyListId, EmbassyName, CountryName, 
    '')
  then DocCopyAllToAll(CountryId, EmbassyListId, EmbassyName, CountryName)
end;

procedure TEmbassyDocumDlg.UpdateBtn;
var En: Boolean;
begin
  if self.Name ='' then exit;

  En := Elem_ItsDocumVisaListQry.DBRecordCount > 0;
  DocCopyOneToAllBtn.Enabled := En;
  DocCopyAllToAllBtn.Enabled := En;
  DocEditBtn.Enabled := En;
  DocumSelectBtn.Enabled := DocTypesDBGrid.IsFocused;

  DocumUnSelectBtn.Enabled := UsedDocsDBGrid.IsFocused and
    Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').IsNull or ( Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').asString = 'F' );

  VisaCenterBtn.Enabled := Elem_SelVisaCentersQry.View.DataController.RecordCount > 0;
  Elem_ItsDocumVisaListQry.SetFocusOnView;
end;

function TEmbassyDocumDlg.GetEmbassyListId: string;
var Id: Integer;
begin
  Id := Elem_ItsKonsulQry.DB.FieldByName('CntrEmbassyId').asInteger;
  Elem_ItsKonsulQry.DB.DisableControls;
  Elem_ItsKonsulQry.DB.First;
  Result := EmptyStr;
  while not Elem_ItsKonsulQry.DB.Eof do
  begin
    Result := Result + Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asString + ',';
    Elem_ItsKonsulQry.DB.Next;
  end;
  Elem_ItsKonsulQry.DB.EnableControls;
  Elem_ItsKonsulQry.DB.Locate('CntrEmbassyId', Id, []);

  if Length(Result) > 0 then System.Delete(Result, Length(Result), 1);
end;
(*)
procedure TEmbassyDocumDlg.EmbassyDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
begin
  inherited;
 { with DMServ, (Sender as TSvtDBGrid) do
  begin
    case Column.Index of
    4: begin
         BrowseImgList.Draw(Canvas, (Rect.Left + Rect.Right) div 2 - 8, 1, 118);
         if DMServIB.ItsKonsulQryFILINGPLACEWORK.AsBoolean then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, 69 );
       end;
    5: begin
         BrowseImgList.Draw(Canvas, Rect.Right - 18, 1, 116);
         with DMServIB.ItsKonsulQryOURFILING do
         if not IsNull then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, FilingImg[AsBoolean]);
       end;
    end;
  end }
end;      *)

procedure TEmbassyDocumDlg.N3Click(Sender: TObject);
var Id,i, OneType: Integer;
    CurONETYPEDOC:Variant;
    ONETYPEDOCIndex:Integer;
begin
  inherited;
  if not Elem_ItsDocumVisaListQry.DB.FieldByName('ONETYPEDOC').IsNull then
    //with DMServ, ItsDocumVisaListQry do
    begin
      OneType := Elem_ItsDocumVisaListQry.DB.FieldByName('ONETYPEDOC').asInteger;
      ONETYPEDOCIndex := Elem_ItsDocumVisaListQry.View.GetColumnByFieldName('ONETYPEDOC').Index;

      for i:=0 to Elem_ItsDocumVisaListQry.View.ViewData.RowCount -1 do
      begin
        if Elem_ItsDocumVisaListQry.View.ViewData.Rows[i].Values [ ONETYPEDOCIndex ] = OneType then
          Elem_ItsDocumVisaListQry.View.ViewData.Rows[i].Selected:=True;
      end;

    end;
end;


function TEmbassyDocumDlg.GetSortDoc(Col: Integer): String;
begin
  case Col of
    0: Result := 'N.ViewName, L.ItemName';
    1: Result := 'L.ItemName, N.ViewName';
    2: Result := 'SAMETYPEDOCID, SETOFDOCUMENT';
    3: Result := 'D.NeedCount';
    4: Result := 'D.BeforeFiling, BeforeFilingPeriod';
    5: Result := 'D.IssuesPeriod, D.IssuedMonths';
    6: Result := 'D.BeginDoc';
    7: Result := 'D.ExpirePeriod, D.ExpireMonths';
    8: Result := 'D.DocForLastPeriod, D.DocForLastCount';
    9: Result := 'D.AgeRestriction';
   10: Result := 'D.MARRIEDSTATE';
   11: Result := 'P.POSADANAME';
   13: Result := 'D.ForInd DESC';
   14: Result := 'D.ForAddManual DESC';
   15: Result := 'D.Transmit DESC';
   16: Result := 'D.Returned DESC';
//   17: Result := 'D.ForOwnerVisa'; 
   17: Result := 'G.GroupName';
   18: Result := 'sG.SubGroupName';
  end;
  if col > 1 then Result := Result + ', N.ViewName, L.ItemName';
end;

procedure TEmbassyDocumDlg.NSubClick(Sender: TObject);
const sUpdSQL = 'Update VISADOCUMENTS_NEW ' +
      'Set SubGroupId = %d ' +
      'Where VisaDocumentId = %d';
//      'Where TypeDocId = %d and CountryId = %d';
var Id, IdGroup: Integer;
begin
  inherited;
  IdGroup := (Sender as TMenuItem).Tag;
 {{ with DMServ, UpdQry do
  begin
    if Active then Close;
    SQL.Text := Format(sUpdSQL, [IdGroup, Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger]);
    ExecSQL;
    Elem_ItsDocumVisaListQry.Requery;
    //UpdateQueryAndLocate( Elem_ItsDocumVisaListQry.DB, Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID') );
  end;}
end;

procedure TEmbassyDocumDlg.N_DelSubClick(Sender: TObject);
const sClearSQL = 'Update VISADOCUMENTS_NEW ' +
      'Set SubGroupId = null ' +
      'Where VisaDocumentId = %d';
//      'Where TypeDocId = %d and CountryId = %d';
begin
  inherited;
 { with DMServ, UpdQry do
  begin
    if Active then Close;
    SQL.Text := Format(sClearSQL, [ Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger]);
    ExecSQL;
    Elem_ItsDocumVisaListQry.Requery;
    //UpdateQueryAndLocate( Elem_ItsDocumVisaListQry.DB, Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID'));
  end; }
end;

procedure TEmbassyDocumDlg.UsedDocsDBGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var Coord:TGridCoord;
    CurRec:Integer;
begin
 {aGrid := TCrackDBGrid(Sender);
 with aGrid do
 if Assigned(DataLink) and not DataSource.DataSet.FieldByName('LINK').IsNull then
 begin
   Coord:=MouseCoord(x,y);
   with Coord do
     if (Y < 0.001) or (X < 0) or (X > 0) then Exit;
   CurRec:=DataLink.ActiveRecord;
   DataLink.ActiveRecord:=Coord.Y-1;
   Hint := DataSource.DataSet.FieldByName('LINK').AsString;
   DataLink.ActiveRecord:=CurRec;
 end; }
end;

procedure TEmbassyDocumDlg.ShowDocActionExecute(Sender: TObject);
begin
  inherited;
//  if DocTypesDBGrid.Focused and not DocumVisaListQryLINK.IsNull
//  then ShellExecute(0,'Open', PChar(DocumVisaListQryLINK.Value),nil,nil,SW_SHOW);
  if UsedDocsDBGrid.Focused and not Elem_ItsDocumVisaListQry.DB.FieldByName('LINK').IsNull
  then ShellExecute(0,'Open', PChar( Elem_ItsDocumVisaListQry.DB.FieldByName('LINK').asString ),nil,nil,SW_SHOW)
end;
(*)
procedure TEmbassyDocumDlg.DocTypesDBGrid_DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
var ColName: string;
begin
  inherited;
//  ColName := UpperCase(Column.FieldName);
//  with DMServ, (Sender as TSvtDBGrid) do
//  if not DocumVisaListQryLINK.IsNull and (ColName = 'DOCNAME')
//  then DMServ.BrowseImgList.Draw(Canvas, Rect.Right - 17, Rect.Top + 1, 61);
end;   *)

procedure TEmbassyDocumDlg.DocLinkPopupMenuPopup(Sender: TObject);
begin
  inherited;
  ShowDocAction.Enabled := False;//not DocumVisaListQryLINK.IsNull;
end;

procedure TEmbassyDocumDlg.OneTypeDocPopupMenuPopup(Sender: TObject);
begin
  inherited;
  ShowDocAction.Enabled := not DMServ.ItsDocumVisaListQryLINK.IsNull
end;

procedure TEmbassyDocumDlg.OneTypeDocQryCalcFields(DataSet: TDataSet);
var StrSum: string;
begin
 { inherited;

  //with DMServ, OneTypeDocQryAGERESTRICTION do
  if DataSet.FieldByName('AGERESTRICTION').Value < 0 then
    DataSet.FieldByName('CalcAgeRestr').Value := Format('до %d р.', [Abs(DataSet.FieldByName('AGERESTRICTION').asInteger)])
  else
  if DataSet.FieldByName('AGERESTRICTION').Value > 0 then
    DataSet.FieldByName('CalcAgeRestr').Value := Format('з %d р.', [DataSet.FieldByName('AGERESTRICTION').asInteger])
  else DataSet.FieldByName('CalcAgeRestr').Value := '';

  //with DMServ, OneTypeDocQryMARRIEDSTATE do
  if not  DataSet.FieldByName('MARRIEDSTATE').IsNull then
    DataSet.FieldByName('CalcMarried').Value := LoadResString(pMarriedMUaIdents[DataSet.FieldByName('MARRIEDSTATE').asInteger]);

  //with DMServ, OneTypeDocQryExpireMonths do
  if DataSet.FieldByName('ExpireMonths').IsNull then DataSet.FieldByName('CalcEXPIREMONTHS').asString := ''
  else DataSet.FieldByName('CalcEXPIREMONTHS').asString  := DataSet.FieldByName('ExpireMonths').AsString + ' ' + Expire[DataSet.FieldByName('EXPIREPERIOD').AsInteger];

  if DataSet.FieldByName('ISSUEDMONTHS').IsNull then DataSet.FieldByName('CalcISSUEDMONTHS').AsString := ''
  else DataSet.FieldByName('CalcISSUEDMONTHS').AsString :=  DataSet.FieldByName('ISSUEDMONTHS').AsString + ' ' + Expire[ DataSet.FieldByName('ISSUESPERIOD').asinteger ];

  //with DMServ, OneTypeDocQryDOCFORLASTCOUNT do
  if DataSet.FieldByName('DOCFORLASTCOUNT').IsNull then DataSet.FieldByName('CalcDocForLast').asString := ''
  else DataSet.FieldByName('CalcDocForLast').asString := DataSet.FieldByName('DOCFORLASTCOUNT').AsString + ' ' +
        Expire[DataSet.FieldByName('DOCFORLASTPERIOD').asInteger];

  //with DMServ, OneTypeDocQrySumma do
  if ( DataSet.FieldByName('Summa').Value = 0) and ( DataSet.FieldByName('FUNDING').isNull ) then
    DataSet.FieldByName('CalcSum').asString := ''
  else
  begin
    if DataSet.FieldByName('FUNDING').asString = 'T' then StrSum := 'Додаткове фінансування '
    else if DataSet.FieldByName('FUNDING').asString = 'W' then StrSum := 'Додаткове фін. без суми '
    else if DataSet.FieldByName('FUNDING').asString = 'F' then StrSum := 'Основний дохід '
    else StrSum := 'Банк';
    DataSet.FieldByName('CalcSum').asString := StrSum;
  end;

  if not DataSet.FieldByName('SETOFDOCUMENT').IsNull or not DataSet.FieldByName('SAMETYPEDOCID').IsNull then
    DataSet.FieldByName('CalcSameTypeDoc').asString := Format('%s / %s', [
    DataSet.FieldByName('SETOFDOCUMENT').asString, DataSet.FieldByName('SAMETYPEDOCID').asString ]);}
end;

procedure ComparePersDocExec(TypeDocId,IdCountry:Integer);
var DBParam : TConnectDBParam;
    ComparePersDocProc : TDataset;
begin
  DBParam := Elem_ItsDocumVisaListQry.DBGetParamConnect;
  //if DBParam.IBDatabaseConnection <> nil then
  begin
    try
      ComparePersDocProc := DBCreateStoredProcDataSet( DBParam ,'VISAPERS_COMPAREALLDOC_PROC',['TypeDocId','CountryID'],[ftInteger,ftInteger] );
      DBSetParamValue(ComparePersDocProc, 'TypeDocId', TypeDocId );
      DBSetParamValue(ComparePersDocProc, 'CountryID', IdCountry );

      DBStoredProcExec( ComparePersDocProc );
    finally
      DBDestroyStorProc( ComparePersDocProc );
    end;
  end;
end;

procedure UpdateAllDocExec( TypeDocId,ManagerId,CountryId:Integer );
var DBParam : TConnectDBParam;
    UpdateAllDocProc : TDataset;
begin
  DBParam := Elem_ItsDocumVisaListQry.DBGetParamConnect;
  //if DBParam.IBDatabaseConnection <> nil then
  begin
    try
      UpdateAllDocProc := DBCreateStoredProcDataSet( DBParam,'VISAALLPERSDOC_SORT_PROC',['TypeDocId','ManagerId','CountryID'],[ftInteger,ftInteger,ftInteger] );
      {UpdateAllDocProc.ParamByName('TypeDocId').Value := TypeDocId;
      UpdateAllDocProc.ParamByName('ManagerId').Value := ManagerId;
      UpdateAllDocProc.ParamByName('CountryID').Value := CountryId; }

      DBSetParamValue(UpdateAllDocProc, 'TypeDocId', TypeDocId );
      DBSetParamValue(UpdateAllDocProc, 'ManagerId', ManagerId);
      DBSetParamValue(UpdateAllDocProc, 'CountryID', CountryId );

      DBStoredProcExec( UpdateAllDocProc );
    finally
      DBDestroyStorProc( UpdateAllDocProc );
    end;
  end;
end;

procedure UpdateDocEmbassyExec( TypeDocId, EmbassyId, VisaDocumentId, ManagerId, CountryId:Integer; ISUSE:string; Comments:Variant );
var DBParam : TConnectDBParam;
    UpdateDocEmbassyProc : TDataset;
begin
  DBParam := Elem_ItsDocumVisaListQry.DBGetParamConnect;
  //if DBParam.IBDatabaseConnection <> nil then
  begin
    try
      UpdateDocEmbassyProc := DBCreateStoredProcDataSet( DBParam,'DOCVISAEMBASSY_PROC_NEW',['TypeDocId','ManagerId','CountryID'],[ftInteger,ftInteger,ftInteger] );

      DBSetParamValue(UpdateDocEmbassyProc, 'TypeDocId', TypeDocId );
      DBSetParamValue(UpdateDocEmbassyProc, 'ManagerId', ManagerId);
      DBSetParamValue(UpdateDocEmbassyProc, 'CountryID', CountryId );
      DBSetParamValue(UpdateDocEmbassyProc, 'EmbassyId', EmbassyId );
      DBSetParamValue(UpdateDocEmbassyProc, 'VisaDocumentId', VisaDocumentId );
      DBSetParamValue(UpdateDocEmbassyProc, 'Comments', Comments );
      DBSetParamValue(UpdateDocEmbassyProc, 'ISUSE', ISUSE );

     { UpdateDocEmbassyProc.ParamByName('TypeDocId').Value := TypeDocId;
      UpdateDocEmbassyProc.ParamByName('EmbassyId').Value := EmbassyId;
      UpdateDocEmbassyProc.ParamByName('VisaDocumentId').Value := VisaDocumentId;
      UpdateDocEmbassyProc.ParamByName('ManagerId').Value := ManagerId;
      UpdateDocEmbassyProc.ParamByName('Comments').Value :=Comments;
      UpdateDocEmbassyProc.ParamByName('CountryID').Value := CountryId;
      UpdateDocEmbassyProc.ParamByName('ISUSE').Value := ISUSE; }

      DBStoredProcExec( UpdateDocEmbassyProc );
    finally
      DBDestroyStorProc( UpdateDocEmbassyProc );
    end;
  end;

end;

procedure TEmbassyDocumDlg.UpdateDocEmbassy(EmbassyId, CountryId: Integer;
  DataChenged: Boolean; const IsUse: string);
begin
  UpdateDocEmbassyExec( Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEDOCID').asInteger, EmbassyId,
                        Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger, DMServ.CurManager, CountryId, IsUse, Elem_ItsDocumVisaListQry.DB.FieldByName('COMMENTS').AsVariant );
  if FSelectedDoc or DataChenged then
    UpdateAllDocExec( Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEDOCID').asInteger,DMServ.CurManager,CountryId );

  ComparePersDocExec(Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEDOCID').asInteger,CountryId);
end;

procedure TEmbassyDocumDlg.OneTypeDocDBGrid_DblClick(Sender: TObject);
var DocId :Integer;
begin
 { inherited;
  DocId := OneTypeDocQryDOCID.Value;

  if not Elem_DocumVisaListQry.DB.Locate('DOCID', DocID , []) then
  begin
    AllDocCheckBox.Checked := True;
    Elem_DocumVisaListQry.DB.Locate('DOCID', DocID , [])
  end; }
end;

procedure TEmbassyDocumDlg.PartnerBtnClick(Sender: TObject);
var CountryId, EmbassyId: Integer;
begin
  inherited;
  CountryId := Elem_BrCountryQry.GetValueId;// Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger;
  EmbassyId := Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').Value;//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
  ExecutePartnerForServ(CountryId, EmbassyId);
end;

procedure TEmbassyDocumDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Elem_SelPartnersQry.DB.Close;
  //  DMServIB.ItsKonsulQry.Close;
  //DMServ.ItsDocumVisaListQry.Close;
  //Elem_ItsDocumVisaListQry.DBClose;
end;

procedure TEmbassyDocumDlg.GetEmbassiesDocData;
var I, j, VisaDocId, EmbassyId: Integer;
    RecCount: Integer;
begin

  begin
    RecCount := Elem_ItsKonsulQry.DBRecordCount;
    SetLength(FEmbassyArr, RecCount);
    for I := 0 to Length(FEmbassyDocArr) - 1 do
     for J := nDocIsUse to nDocLast do SetLength(FEmbassyDocArr[I].DocData[J], RecCount);

    EmbassyId := Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').asInteger;//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
    VisaDocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;
    Elem_ItsKonsulQry.DB.DisableControls;
    //ItsKonsulSrc.OnDataChange := nil;
    Elem_ItsKonsulQry.DB.First;
    I := 0;
    while not Elem_ItsKonsulQry.DB.Eof do
    begin
      FEmbassyArr[I] := Elem_ItsKonsulQry.DB.FieldByName('EMBASSYNAME').asString;

      Elem_ItsDocumVisaListQry.DB.Close;
      Elem_ItsDocumVisaListQry.DBQuerySetParamValue('EmbassyId', Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').asInteger);//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
      Elem_ItsDocumVisaListQry.DBOpen;

      Elem_ItsDocumVisaListQry.DB.DisableControls;
      Elem_ItsDocumVisaListQry.DB.First;
      while not Elem_ItsDocumVisaListQry.DB.Eof do
      begin
        for J := 0 to Length(FEmbassyDocArr) - 1 do
        if FEmbassyDocArr[J].TypeDocId = Elem_ItsDocumVisaListQry.DB.FieldByName('TYPEDOCID').asInteger then Break;
        FEmbassyDocArr[J].DocData[nDocIsUse, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('ISUSE').asString; 
        FEmbassyDocArr[J].DocData[nDocNeedCount, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('NEEDCOUNT').asString; 
        FEmbassyDocArr[J].DocData[nDocIssuePeriod, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('CalcIssuedMonths').asString; 
        FEmbassyDocArr[J].DocData[nDocBeginPeriod, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('BEGINDOC').asString; 
        FEmbassyDocArr[J].DocData[nDocExpirePeriod, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('CalcExpireMonths').asString; 
        FEmbassyDocArr[J].DocData[nDocForLas, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('CalcDocForLast').asString; 
        FEmbassyDocArr[J].DocData[nDocAgeRestrict, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('CalcAgeRestr').asString; 
        FEmbassyDocArr[J].DocData[nDocMarried, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('CalcMarried').asString; 
        FEmbassyDocArr[J].DocData[nDocPosada, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('POSADA').asString; 
        FEmbassyDocArr[J].DocData[nDocNecessarySum, I] := Elem_ItsDocumVisaListQry.DB.FieldByName('CalcSum').asString; 

        with  Elem_ItsDocumVisaListQry.DB.FieldByName('FORIND') do
          if AsBoolean then FEmbassyDocArr[J].DocData[nDocInd, I] := Value;
        with Elem_ItsDocumVisaListQry.DB.FieldByName('FORADDMANUAL') do
          if AsBoolean then FEmbassyDocArr[J].DocData[nDocManual, I] := Value;
        with Elem_ItsDocumVisaListQry.DB.FieldByName('TRANSMIT') do
          if AsBoolean then FEmbassyDocArr[J].DocData[nDocTransmit, I] := Value;
        with Elem_ItsDocumVisaListQry.DB.FieldByName('RETURNED') do
          if AsBoolean then FEmbassyDocArr[J].DocData[nDocReturn, I] := Value;

        Elem_ItsDocumVisaListQry.DB.Next;
      end;              
      Inc(I);
      Elem_ItsKonsulQry.DB.Next;
    end;
    Elem_ItsKonsulQry.DB.Locate('CompanyId', EmbassyId, []);
    Elem_ItsKonsulQry.DB.EnableControls;
    //ItsKonsulSrc.OnDataChange := ItsKonsulSrcDataChange;
    Elem_ItsDocumVisaListQry.DB.EnableControls;
    //ItsKonsulSrcDataChange(nil, nil);
    Elem_ItsDocumVisaListQry.DB.Locate('VISADOCUMENTID', VisaDocId, []);
  end;
end;

procedure TEmbassyDocumDlg.ExportToExlActionExecute(Sender: TObject);
begin
  inherited;
  GetEmbassiesDocs;
  GetEmbassiesDocData;
  ExportToExcel;
end;

procedure TEmbassyDocumDlg.GetEmbassiesDocs;
var I: Integer;
begin
  SetLength(FEmbassyDocArr, Elem_AllDocQry.DBRecordCount);
  I := 0;
  Elem_AllDocQry.DB.First;

  while not Elem_AllDocQry.DB.Eof do
  begin
    FEmbassyDocArr[I].TypeDocId := Elem_AllDocQry.DB.FieldByName('TYPEDOCID').Value;
    FEmbassyDocArr[I].DocName := Format('%s (%s)', [Elem_AllDocQry.DB.FieldByName('NAME').Value , Elem_AllDocQry.DB.FieldByName('TYPENAME').Value ] );
    Inc(I);
    Elem_AllDocQry.DB.Next;
  end;

  Elem_AllDocQry.DBClose;
end;

procedure TEmbassyDocumDlg.ExportToExcel;
var 
  ExcelApp, Workbook, Range, Cell1, Cell2: Variant;
  BeginRow, BeginCol, RowCount, ColCount: Integer;
  EmbassyArrLength, I, J, N: Integer;
  ArrayData: Variant;
  procedure DrawThinLine(Range: Variant);
  begin
    Range.Borders[xlEdgeLeft].Weight := xlMedium;
    Range.Borders[xlEdgeTop].Weight := xlMedium;
    Range.Borders[xlEdgeBottom].Weight := xlMedium;
    Range.Borders[xlEdgeRight].Weight := xlMedium;
    Range.Borders[xlInsideVertical].Weight := xlThin;
    Range.Borders[xlInsideHorizontal].Weight := xlThin;
  end;  
begin
  EmbassyArrLength := Length(FEmbassyArr);
// Створюємо Excel
  ExcelApp := CreateOleObject('Excel.Application');

// Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;

//  Создаем Книгу (Workbook)          
  Workbook := ExcelApp.WorkBooks.Add(IncludeTrailingPathDelimiter(OptionSet.TemplateFolder) + 'Подачі.xls');

//вивід турів шапка
  BeginRow := 1;
  BeginCol := 3;
  RowCount := 1; 
  ColCount := EmbassyArrLength; // кількість консульств.
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);

  ArrayData := FEmbassyArr;
  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow , BeginCol + ColCount - 1];
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];

  Range.HorizontalAlignment := xlCenter;
  Range.VerticalAlignment := xlCenter;
  Range.Borders.Weight := xlThin;
  Range.Font.FontStyle := 'Bold';
  Range.Interior.Color := clSkyBlue;
  Range.WrapText := True;
  Range.ColumnWidth := 17.86;
  Range.Value := ArrayData;
//вивід документів та характеристик
  BeginCol := 2;
  ColCount := 1; 
  ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
  for J := Low(FEmbassyDocArr) to High(FEmbassyDocArr) do
  begin
    ArrayData := 'Документи';
    Cell1 := WorkBook.WorkSheets[1].Cells[1, 1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell1];
    Range.VerticalAlignment := xlCenter;
    Range.Font.FontStyle := 'Bold';
    Range.WrapText := True;
    Range.Value := ArrayData;
    ArrayData := 'Характеристики документів';
    Cell1 := WorkBook.WorkSheets[1].Cells[1, 2];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell1];
    Range.VerticalAlignment := xlCenter;
    Range.Font.FontStyle := 'Bold';
    Range.WrapText := True;
    Range.Value := ArrayData;

  //назва документа
    ArrayData := FEmbassyDocArr[J].DocName;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow + 1, BeginCol - 1];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + Length(NameDocArr), BeginCol - 1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.ColumnWidth := 26.57;
    Range.MergeCells := True;
    Range.VerticalAlignment := xlCenter;
    Range.Font.FontStyle := 'Bold';
    Range.WrapText := True;
    Range.Value := ArrayData;
//назви характеристик док.    
    for I := Low(NameDocArr) to High(NameDocArr) do
    begin
      ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
      ArrayData := NameDocArr[I];
      Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow + I, BeginCol];
      Range := WorkBook.WorkSheets[1].Range[Cell1, Cell1];
      Range.ColumnWidth := 26.57;
      Range.VerticalAlignment := xlCenter;
      Range.Borders.Weight := xlThin;
      Range.Font.FontStyle := 'Bold';
      Range.WrapText := True;
      Range.Value := ArrayData;
//характеристики док.
//      ArrayData := VarArrayCreate([1, RowCount, 1, EmbassyArrLength], varVariant);
//      ArrayData := FEmbassyDocArr[J].DocData[I];
      ArrayData := VarArrayCreate([1, 1, 1, 1], varVariant);
      for N := 0 to EmbassyArrLength - 1 do
      begin
        ArrayData := FEmbassyDocArr[J].DocData[I, N];
    
        Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow + I, BeginCol + 1 + N];
//        Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + I, BeginCol + EmbassyArrLength];
        Range := WorkBook.WorkSheets[1].Range[Cell1, Cell1];
        Range.VerticalAlignment := xlCenter;
        Range.Borders.Weight := xlThin;
        if FEmbassyDocArr[J].DocData[nDocIsUse, N] = 'F'
        then Range.Font.Color := clRed;
        Range.Font.FontStyle := 'Bold';
        Range.WrapText := True;
        Range.Value := ArrayData;      
      end;
    end;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow + 1, BeginCol];   
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + Length(NameDocArr), BeginCol];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    DrawThinLine(Range);

    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow + 1, BeginCol + 1];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow + Length(NameDocArr), BeginCol + EmbassyArrLength];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    DrawThinLine(Range);
   
    BeginRow := BeginRow + Length(NameDocArr);
  end;                                                      
//Закріплення області
  WorkBook.WorkSheets[1].Activate;
  WorkBook.WorkSheets[1].Range['C2:C2'].Select;
  ExcelApp.ActiveWindow.FreezePanes:= True;
  ExcelApp.Visible := True;
end;

procedure TEmbassyDocumDlg.SpeedButtonClick(Sender: TObject);
var aTag: Integer;
    aDB: TDataset;
begin
  inherited;
  aTag := (Sender as TSpeedButton).Tag;
  case aTag of
//   0: aDB := SelDocQry;
   1: aDB := Elem_TOURISTANKETTEMPLATES.DB;
  end;

  ExecuteAnketData((Sender as TSpeedButton).Tag);
  aDB.Locate('FieldName', aDB.FieldByName('FieldName').AsString, []);
  //UpdateDocQuery(aDB, FieldName);
end;
(*)
procedure TEmbassyDocumDlg.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
var FieldName: string;  
    aField: TField;
begin

end;
        *)
procedure TEmbassyDocumDlg.SelDocDBGridDblClick(Sender: TObject);
begin
 { inherited;
  case (Sender as TSvtDBGrid).Tag of
   1: FilingBtn.Click;
   2: PartnerBtn.Click;
  end;  }
end;

procedure TEmbassyDocumDlg.CopyOneSelDocBtnClick(Sender: TObject);
var CountryId: Integer;
    EmbassyListId, EmbassyName, DocName, CountryName: string;
    aTag: Integer;
begin
  inherited;
(*  aTag := (Sender as TSpeedButton).Tag;
  case aTag of
//   0,2: DocName := SelDocQryCalcFieldName.Value;
   1,3: DocName := FilingQryCalcFieldName.Value;
  end;     
  EmbassyName := Elem_ItsKonsulQry.DB.FieldByName('EMBASSYNAME').asString;
  if ExecuteCopyDocToKonsul(CountryId, EmbassyListId, EmbassyName, 
    CountryName, DocName, aTag in [0,1])
  then CopyField(EmbassyListId, EmbassyName, aTag);   *)
end;

procedure TEmbassyDocumDlg.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
var SelDocEn, FilingEn, SelRow: Boolean;
  
  function SelSameGroupActionEnabled: Boolean;
  var I, DocId: Integer;
  SETOFDOCUMENTInd:Integer;
  SameId:Variant;
  begin
   (* with UsedDocsDBGrid.SelectedRows do begin
      Result := False;
      if Count > 1 then begin
        DocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;
        DMServ.ItsDocumVisaListQry.DisableControls;
        {$WARN UNSAFE_TYPE OFF}
        DMServ.ItsDocumVisaListQry.GotoBookmark( Pointer( Items[0] ) );
        {$WARN UNSAFE_TYPE ON}
        SameId := Elem_ItsDocumVisaListQry.DB.FieldByName('SETOFDOCUMENT').asInteger;
        for I := 1 to Count - 1 do begin
          {$WARN UNSAFE_TYPE OFF}
          DMServ.ItsDocumVisaListQry.GotoBookmark( Pointer( Items[I] ) );
          {$WARN UNSAFE_TYPE ON}
          Result := not DMServ.ItsDocumVisaListQrySETOFDOCUMENT.IsNull
            and (Elem_ItsDocumVisaListQry.DB.FieldByName('SETOFDOCUMENT').asInteger <> SameId);
          if Result then Break;
        end;
        DMServ.ItsDocumVisaListQry.Locate('VISADOCUMENTID', DocId, []);
        DMServ.ItsDocumVisaListQry.EnableControls;
      end;
    end; *)
    Result := False;

    SETOFDOCUMENTInd := Elem_ItsDocumVisaListQry.View.GetColumnByFieldName('SETOFDOCUMENT').Index;
    SameId := Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[0].Values[SETOFDOCUMENTInd];

    for i:=0 to Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount - 1 do
    begin
      if ( Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[i].Values[SETOFDOCUMENTInd] <> null ) and
         ( Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[i].Values[SETOFDOCUMENTInd] <> SameId ) then
      begin
        result := True;
        Break;
      end;
    end;

  end;
begin
  inherited;
  FilingEn := Elem_TOURISTANKETTEMPLATES.DBRecordCount > 0;
  CopyOneFilingBtn.Enabled := FilingEn;
  CopyAllFilingBtn.Enabled := FilingEn;
  UnSelSameDocAction.Enabled := not Elem_ItsDocumVisaListQry.DB.FieldByName('SAMETYPEDOCID').IsNull;

  SelRow := Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount > 1;
  SelSameDocAction.Enabled := SelRow;

  if Action = SelSameGroupAction then SelSameGroupAction.Enabled := SelSameGroupActionEnabled
  else if Action = UnSelSameGroupAction then UnSelSameGroupAction.Enabled := SelSameGroupActionEnabled
  else if Action = MarkUnUseAction then MarkUnUseAction.Enabled := SelRow;
  UpdStatusPanel(Elem_ItsDocumVisaListQry.DB);
end;

procedure TEmbassyDocumDlg.CopyField(const EmbassyListId, EmbassyName: string; aTag: Integer);
const WarningOneField = 'Копіювати "%s" в %s?';
      WarningAllField = 'Копіювати всі документми в %s?';
      sAllEmbassy = 'у всі консульства';
  InsertOneField = 'insert into TouristAnketTemplates(EmbassyId, TypeId, FieldName) ' +
    'Values(%d, %d, ''%s'') ';
  DeleteAllDoc = 'Delete From TouristAnketTemplates where EmbassyId = %d and TypeId = %d';
  InsertAllDoc = 'insert into touristankettemplates(TypeId, FieldName, EmbassyId) ' +
    'select TypeId, FieldName, %d ' +
    'from touristankettemplates ' +
    'where EmbassyId = %d and TypeId = %d';
  SelOneField = 'Select Count(*) from TouristAnketTemplates ' +
    'where EmbassyId = %d and TypeId = %d and FieldName = ''%s'' ';
type TCopyProc = procedure(Id: Integer) of object;    

var aName: string;
    TypeId, Id: Integer;
    FieldName: string; 
    aDocQuery: TIBQuery;
 { procedure CopyOneField(Id: Integer);
  begin
    with DMServ.WorkIBQry do
    begin
      //if Transaction.Active then Transaction.Commit;

      SQL.Text := Format(SelOneField, [Id, TypeId, FieldName]);
      Open;
      if Fields[0].AsInteger = 0 then DMServ.WorkQueryExecute(Format(InsertOneField, [
       Id, TypeId, FieldName]), STourMainErrorUpdateTour);
      Close;
    end;
  end;
  procedure CopyAllField(FromId, ToId: Integer);
  begin
    DMServ.WorkQueryExecute(Format(DeleteAllDoc, [
      ToId, TypeId]), STourMainErrorUpdateTour);
    DMServ.WorkQueryExecute(Format(InsertAllDoc, [
      ToId, FromId, TypeId]), STourMainErrorUpdateTour);       
  end;
  procedure CopyToAllEmbassy;
  begin
    with DMServIB, ItsKonsulQry do begin
      Id := Elem_CNTREMBASSIES.DB.FieldByName('COMPANY_ID').asInteger;//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
      DisableControls;
      First;
      while not Eof do
      begin
        if Elem_CNTREMBASSIES.DB.FieldByName('COMPANY_ID').asInteger <> Id then     //Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger
        case aTag of
          0,1: CopyOneField(Elem_CNTREMBASSIES.DB.FieldByName('COMPANY_ID').asInteger);  //Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger
          2,3: CopyAllField(Id, Elem_CNTREMBASSIES.DB.FieldByName('COMPANY_ID').asInteger); //Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger
        end;
        Next;
      end;
      EnableControls;
      Locate('CompanyId', Id, []);
    end;  
  end;}
begin
(*  TypeId := 1;
  aDocQuery := FilingQry;
  
  if EmbassyId > 0 then aName := #39 + EmbassyName + #39 else aName := sAllEmbassy;
  if (aTag in [0,1]) and WarningFmtDlgYN(WarningOneField, [
    aDocQuery.FieldByName('CalcFieldName').Value, aName])
  then begin
    FieldName := aDocQuery.FieldByName('FIELDNAME').Value;
    if EmbassyId > 0 then CopyOneField(EmbassyId)
    else CopyToAllEmbassy;
  end else if (aTag in [2,3]) and WarningFmtDlgYN(WarningAllField, [aName])
  then begin
    if EmbassyId > 0 then CopyAllField(aDocQuery.FieldByName('EmbassyId').AsInteger, EmbassyId)
    else CopyToAllEmbassy
  end; 
  UpdateDocQuery(aDocQuery, FieldName)    *)
end;

procedure TEmbassyDocumDlg.UpdateDocQuery(aQuery: TIBQuery;
  FieldName: string);
begin
  //UpdateQuery(aQuery, True);
  if not aQuery.active  then aQuery.open;
  
  aQuery.Locate('FieldName', FieldName, []);
end;

procedure TEmbassyDocumDlg.RefreshBtnClick(Sender: TObject);
begin
  inherited;
  Elem_DocumVisaQry.Requery;
  //UpdateQueryEx(DocumVisaListQry);
end;

procedure TEmbassyDocumDlg.VisaCenterBtnClick(Sender: TObject);
begin
  inherited;
  with DMServIB do begin
    ExecuteVisaCenterSelForm;
    Elem_SelVisaCentersQry.DBOpen;
    //UpdateQueryAndLocate( SelVisaCentersQry, SelVisaCentersQryCntrEmbassyId, True);
  end;
end;
(*)
procedure TEmbassyDocumDlg.VisaCenterDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
const 
    ApplDateImg: array[0..1] of Integer = (117, 115);
begin
 { inherited;
  with DMServ, DMServIB, (Sender as TSvtDBGrid) do
  begin
    case  Column.Index of
    1: BrowseImgList.Draw(Canvas, (Rect.Left + Rect.Right) div 2 - 8, 0, 112);
    4: begin
         BrowseImgList.Draw(Canvas, (Rect.Left + Rect.Right) div 2 - 8, 0, 119);
         if SelVisaCentersQryAUTOFILLING.AsBoolean then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, 69);
       end;
    5: begin 
         BrowseImgList.Draw(Canvas, (Rect.Left + Rect.Right) div 2 - 8, 0, 120);
         if SelVisaCentersQryUSECODE.AsBoolean then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, 69);
       end;
    6: begin 
         BrowseImgList.Draw(Canvas, Rect.Right - 18, 1, 116);
         with SelVisaCentersQryOURFILING do if not IsNull then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, FilingImg[AsBoolean]);
       end; 
    7: begin
         BrowseImgList.Draw(Canvas, Rect.Right - 18, 0, 117);
         with SelVisaCentersQryAPPLTYPEDATE do if not IsNull  then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, ApplDateImg[Value]);
       end;
    8: begin 
         BrowseImgList.Draw(Canvas, Rect.Right - 18, 0, 51);
         if Elem_SelVisaCentersQry.DB.FieldByName('PERMTRANSFDOC').asInteger in [1, 3] then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, 69);
       end;
    9: begin 
         BrowseImgList.Draw(Canvas, Rect.Right - 18, 0, 113);
         if Elem_SelVisaCentersQry.DB.FieldByName('PERMTRANSFDOC').asInteger in [2..3] then
           BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, 69);
       end;
    end;
  end;}
end;     *)

procedure TEmbassyDocumDlg.SelSameDocActionExecute(Sender: TObject);
const UpdSameTypeDocumentSQL = 'Update VisaDocuments_New Set ' +
  'SameTypeDocId = %s, SetOfDocument = null where VisaDocumentId = %d';
var I, SameTypeDocId, DocId: Integer;
    VISADOCUMENTIDInd:Integer;
    UpdateValue: Variant;
begin
  inherited;
  SameTypeDocId := GetSameTypeDocId + 1;
  //with DMServ do
  //begin

    if (Sender as TAction).Tag = 0 then UpdateValue := SameTypeDocId
    else UpdateValue :=null;

    Elem_ItsDocumVisaListQry.SaveBookmark;
    VISADOCUMENTIDInd := Elem_ItsDocumVisaListQry.View.GetColumnByFieldName('VISADOCUMENTID').Index;

    for i:=0 to Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount - 1 do
    begin
      DocId := Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[i].Values[VISADOCUMENTIDInd];

      if Elem_ItsDocumVisaListQry.DB.Locate(Elem_ItsDocumVisaListQry.FieldKod,VISADOCUMENTIDInd,[]) then
      begin
        Elem_ItsDocumVisaListQry.DB.Edit;
        Elem_ItsDocumVisaListQry.DB.FieldByName('SameTypeDocId').Value := UpdateValue;
        Elem_ItsDocumVisaListQry.DB.FieldByName('SetOfDocument').Value := null;
        Elem_ItsDocumVisaListQry.DB.Post;
      end;
    end;
    Elem_ItsDocumVisaListQry.GotoBookmark;
end;

procedure TEmbassyDocumDlg.SelSetDocumentActionExecute(Sender: TObject);
const UpdSetOfDocumentIdSQL = 'Update VisaDocuments_New Set ' +
  'SameTypeDocId = null, SetOfDocument = %s where VisaDocumentId = %d';
var I, SetOfDocumentId, DocId: Integer;
    VISADOCUMENTIDInd:Integer;
    UpdateValue:Variant;
{  function GetSetOfDocumentId: Integer;
  begin
    with DMServ.WorkIBQry do begin
      Close;
      SQL.Text := 'select max(SetOfDocument) from VisaDocuments_New';
      Open;
      Result := Fields[0].AsInteger;
      Close;
    end;
  end;  }
begin
 {inherited;
  SetOfDocumentId := GetSetOfDocumentId + 1;
  DocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;

  if (Sender as TAction).Tag = 0 then UpdateValue := SetOfDocumentId
  else UpdateValue :=null;

  Elem_ItsDocumVisaListQry.SaveBookmark;
  VISADOCUMENTIDInd := Elem_ItsDocumVisaListQry.View.GetColumnByFieldName('VISADOCUMENTID').Index;

  for i:=0 to Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount - 1 do
  begin
    DocId := Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[i].Values[VISADOCUMENTIDInd];

    if Elem_ItsDocumVisaListQry.DB.Locate(Elem_ItsDocumVisaListQry.FieldKod,VISADOCUMENTIDInd,[]) then
    begin
      Elem_ItsDocumVisaListQry.DB.Edit;
      Elem_ItsDocumVisaListQry.DB.FieldByName('SameTypeDocId').Value := null;
      Elem_ItsDocumVisaListQry.DB.FieldByName('SetOfDocument').Value := UpdateValue;
      Elem_ItsDocumVisaListQry.DB.Post;
    end;
  end;
  Elem_ItsDocumVisaListQry.GotoBookmark;}

end;

procedure TEmbassyDocumDlg.SelSameGroupActionExecute(Sender: TObject);
const UpdSameTypeDocumentSQL = 'Update VisaDocuments_New Set ' +
  'SameTypeDocId = %s where VisaDocumentId = %d';
var I, SameTypeDocId, DocId: Integer;
    UpdateValue:Variant;
    VISADOCUMENTIDInd:Integer;
begin
  inherited;

  SameTypeDocId := GetSameTypeDocId + 1;
  DocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;

  if (Sender as TAction).Tag = 0 then UpdateValue := SameTypeDocId
  else UpdateValue :=null;

  Elem_ItsDocumVisaListQry.SaveBookmark;
  VISADOCUMENTIDInd := Elem_ItsDocumVisaListQry.View.GetColumnByFieldName('VISADOCUMENTID').Index;


  for i:=0 to Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount - 1 do
  begin
    DocId := Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[i].Values[VISADOCUMENTIDInd];
    if Elem_ItsDocumVisaListQry.DB.Locate( Elem_ItsDocumVisaListQry.FieldKod, DocId,[] ) then
    begin
      Elem_ItsDocumVisaListQry.DB.Edit;
      Elem_ItsDocumVisaListQry.DB.FieldByName('SameTypeDocId').Value := UpdateValue;
      Elem_ItsDocumVisaListQry.DB.Post;
    end;
  end;
  Elem_ItsDocumVisaListQry.GotoBookmark;

end;

function TEmbassyDocumDlg.GetSameTypeDocId: Integer;
var DBParam : TConnectDBParam;
    SQL : WideString;
    DB:TDataset;
    val:Variant;
begin
  DBParam := Elem_ItsDocumVisaListQry.DBGetParamConnect;
  SQL := 'select max(SameTypeDocId) mv from VisaDocuments_New';

  val := DBGetValue(DBParam,  SQL, 'mv' );
  {if ConDBParam.IBDatabaseConnection<>nil then
    val:=  UnitIBQuery.GetValueDB( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, SQL)
  else
  if ConDBParam.ADOConnection<>nil then
    val := UnitAdoQuery.GetValueDB( ConDBParam.ADOConnection, SQL );}

  if val <> null then result := val
  else result := 0;
end;

procedure TEmbassyDocumDlg.MarkUnUseActionExecute(Sender: TObject);
var EmbassyId, CountryId, DocId, I: Integer;
    VISADOCUMENTIDInd:Integer;
begin
  inherited;
  if WarningDlgYN('Помітити вибрані документи, як такі що не використовуються?') then
  begin
    Elem_VisaDocumentsQry.DBOpen;

    DocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;

    CountryId := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;
    EmbassyId := Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').Value;

    Elem_ItsDocumVisaListQry.SaveBookmark;
    VISADOCUMENTIDInd := Elem_ItsDocumVisaListQry.View.GetColumnByFieldName('VISADOCUMENTID').Index;

    for i:=0 to Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount - 1 do
    begin
      DocId := Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[i].Values[VISADOCUMENTIDInd];

      Elem_VisaDocumentsQry.DB.Locate('VISADOCUMENTID', DocId, []);
      Elem_VisaDocumentsQry.DB.Edit;
      Elem_VisaDocumentsQry.DB.FieldByName('ISUSE').AsBoolean := False;
      Elem_VisaDocumentsQry.DB.Post;

      UpdateDocEmbassy( EmbassyId, CountryId, True, 'F' );
    end;
    Elem_ItsDocumVisaListQry.GotoBookmark;
  end;
end;

procedure TEmbassyDocumDlg.DocCopySelectedToAll(CountryId: Integer;
  EmbassyListId, EmbassyName, CountryName: String);
var I: Integer;
    Msg, DocName: String;
//    SelRows: TSvtBookmarkList;
    DocId:Variant;
    VISADOCUMENTIDInd:Integer;
begin
  //Id := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;
  //SelRows := UsedDocsDBGrid.SelectedRows;

  if Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount > 1 then
    if EmbassyName = EmptyStr then Msg := Format(SVisaDocumentFrmConfirmDocCopySelected, [CountryName])
    else Msg := Format(SVisaDocumentFrmConfirmDocCopySelectedtoEmb, [EmbassyName])
  else
  begin
    DocName := Elem_ItsDocumVisaListQry.DB.FieldByName('VIEWNAME').asString;
    if EmbassyName = EmptyStr then Msg := Format(SVisaDocumentFrmConfirmDocCopy, [DocName, CountryName])
    else Msg := Format(SVisaDocumentFrmConfirmDocCopytoEmb, [DocName, EmbassyName]);
  end;

  if ConfirmDlgYN(Msg) then
  //with DMServ.ItsDocumVisaListQry do
  begin
    Elem_ItsDocumVisaListQry.SaveBookmark;
    FToall := True;
    //if SelRows.Count = 0 then SelRows.CurrentRowSelected := True;
    if Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount = 0 then
      Elem_ItsDocumVisaListQry.SetFocusOnView;

    VISADOCUMENTIDInd := Elem_ItsDocumVisaListQry.View.GetColumnByFieldName('VISADOCUMENTID').Index;
    for i:=0 to Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecordCount - 1 do
    begin
      DocId := Elem_ItsDocumVisaListQry.View.DataController.Controller.SelectedRecords[i].Values[VISADOCUMENTIDInd];
      if Elem_ItsDocumVisaListQry.DB.Locate( Elem_ItsDocumVisaListQry.FieldKod, DocId,[] ) then
        DocCopyOneToAll(CountryId, EmbassyListId, EmbassyName, CountryName);
    end;

    Elem_ItsDocumVisaListQry.GotoBookmark;
    FToAll := False;
  end;
end;

procedure TEmbassyDocumDlg.SameTypeImageClick(Sender: TObject);
begin
  inherited;
  InformDlg(sSameTypeDocInfrom);
end;

procedure TEmbassyDocumDlg.FormShow(Sender: TObject);
begin
  inherited;
  HideUnUseCheckBoxClick( nil );
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_UsedDocsDBGridCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var Fld: string;
begin
  FSelectedDoc := False;
  if Elem_ItsDocumVisaListQry.DBRecordCount > 0 then
    DocEditBtn.Click;
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_UsedDocsDBGridKeyPress(
  Sender: TObject; var Key: Char);
begin
   DocEditBtn.Click;
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_DocTypesDBGridCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  DocumSelectBtn.Click;
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_VisaCenterDBGridCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  VisaCenterBtn.Click;
end;

procedure TEmbassyDocumDlg.ViewFilingCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  FilingBtn.Click;
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_SelPartnerDBGridCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  PartnerBtn.Click;
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_EmbassyDBGridFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshDataControls;
end;

procedure TEmbassyDocumDlg.VisaCenterFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  UpdateBtn;
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_UsedDocsDBGridFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshDataControls;
end;

procedure TEmbassyDocumDlg.FRefreshDataControls;
begin
   Elem_SelPartnersQry.SetFilterOnView(['EMBASSYID'],[ Elem_CNTREMBASSIES.DB.FieldByName('COMPANYID').Value ],['=']);
   UpdateBtn;
end;

procedure TEmbassyDocumDlg.View_EmbassyDocumDlg_OneTypeDocDBGridCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var DocId :Integer;
begin
  inherited;
  DocId := Elem_OneTypeDocQry.DB.FieldByName('DOCID').asInteger;

  if not Elem_DocumVisaQry.DB.Locate('DOCID', DocID , []) then
  begin
    AllDocCheckBox.Checked := True;
    Elem_DocumVisaQry.DB.Locate('DOCID', DocID , [])
  end;
end;


procedure TEmbassyDocumDlg.DocTypesDBGridEnter(Sender: TObject);
begin
  inherited;
  FRefreshDataControls;
end;

end.
