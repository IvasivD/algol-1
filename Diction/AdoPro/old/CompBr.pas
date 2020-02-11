unit CompBr;

interface

uses
  SKYPE4COMLib_TLB,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTBrws, ActnList, Db, StdCtrls, ComCtrls, DBCtrls, Grids, DBGrids,
  ExtCtrls, Buttons, ToolWin, Mask, DBActns, Menus, StdActns, AzComboBox,
  SvtDBGrids, DBTables,
  AzEdit, OfficeXP, ExcelXP, WordXP, jpeg, ShellAPI, Clipbrd, ShellCtrls,
  cxControls, cxNavigator, cxDBNavigator, StrUtils, ImgList, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, dximctrl,
  dxdbtrel, IniFiles, DragDrop, DropTarget, DragDropText, DragDropFile,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer,IBQuery, IBCustomDataSet, core , 
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxCheckBox,cxGridDBDataDefinitions,
  cxCalendar, cxDBTL, cxTLData, dxBevel, FrmProgress;

type
 TCrackDBGrid = class(TSvtDBGrid)
end;
type
  TCompanyBrowseForm = class(TZTourBrowseForm)
    QuickFilterPanel: TPanel;
    N14: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label17: TLabel;
    ExportAddressAction: TAction;
    ExportAddressBtn: TToolButton;
    LocateOurselvesBtn: TToolButton;
    LocateOurselvesAction: TAction;
    FilterOffBtn: TToolButton;
    FilterOffAction: TAction;
    OfficeDataSource: TDataSource;
    FilterManagerAction: TAction;
    AccountDataSource: TDataSource;
    CorrAccntDataSource: TDataSource;
    Export1cAction: TAction;
    Export1cBtn: TToolButton;
    ContractDataSource: TDataSource;
    FilterDismissedAction: TAction;
    FilterDismissedBtn: TToolButton;
    SeparatorTBtn16: TToolButton;
    SeparatorTBtn15: TToolButton;
    ClientPropsAction: TAction;
    ClientPropsBtn: TToolButton;
    SeparatorTBtn17: TToolButton;
    MaillistBtn: TToolButton;
    MaillistAction: TAction;
    btn_review: TToolButton;
    ToolButton2: TToolButton;
    act_review: TAction;
    tbtn_review_check: TToolButton;
    ReestrFormBtn: TToolButton;
    ReestrFormPopupMenu: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    ReestrFornAction: TAction;
    ShowReestrFormAction: TAction;
    SendReestrFormAction: TAction;
    FindTimer: TTimer;
    NoteAddAction: TAction;
    NoteViewAction: TAction;
    CompanySrc: TDataSource;
    ContractSignAction: TAction;
    ContractSendAction: TAction;
    ContractRcvOrAction: TAction;
    ObdzvinPopupMenu: TPopupMenu;
    TourExpAction: TAction;
    ourExpAction1: TMenuItem;
    PromiseAction: TAction;
    Action11: TMenuItem;
    PromiseBtn: TToolButton;
    ListingExportToWordBtn: TToolButton;
    ListingExportToWordAction: TAction;
    ContractRcvCopyAction: TAction;
    ContractSendMailAction: TAction;
    ContractPrintAction: TAction;
    ContractTempDaysAction: TAction;
    ContractExtendAction: TAction;
    Label24: TLabel;
    ContractImageList: TImageList;
    ExportTourImageList: TImageList;
    AllTimeCheckBox: TCheckBox;
    N17: TMenuItem;
    AddFiliyaAction: TAction;
    N18: TMenuItem;
    PopupMenu1: TPopupMenu;
    N19: TMenuItem;
    N20: TMenuItem;
    ContractSelAction: TAction;
    ContractReRestrAction: TAction;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    SubCategoryComboBox: TcxImageComboBox;
    ContractAgentAction: TAction;
    DropTextTarget: TDropTextTarget;
    DataFormatAdapterFile: TDataFormatAdapter;
    DataFormatAdapterStream: TDataFormatAdapter;
    CopyPathPopupMenu: TPopupMenu;
    CopyMenuItem: TMenuItem;
    OpenMenuItem: TMenuItem;
    GridDropTextTarget: TDropTextTarget;
    GridDataFormatAdapterFile: TDataFormatAdapter;
    GridDataFormatAdapterStream: TDataFormatAdapter;
    SecondaryTreeView2: TcxTreeList;
    SecondaryTreeView2Column1: TcxTreeListColumn;
    SecondaryPopupEdit: TcxPopupEdit;
    N21: TMenuItem;
    GridCompanyDBTableView1: TcxGridDBTableView;
    GridCompanyLevel1: TcxGridLevel;
    GridCompany: TcxGrid;
    EdiFindCmpanyByName: TcxTextEdit;
    ClearSearchCompany: TSpeedButton;
    TypeNameCheckBox: TcxCheckBox;
    ComboxStatusSelect: TcxImageComboBox;
    ThirdSelectComboBox: TcxImageComboBox;
    ButClearComboxStatusSelect: TSpeedButton;
    ButClearSecondaryPopupEdit: TSpeedButton;
    ButClearThirdSelectComboBox: TSpeedButton;
    Label18: TLabel;
    Label30: TLabel;
    ButClearCompanyCountry: TSpeedButton;
    ButClearCompanyCity: TSpeedButton;
    ButSearch: TSpeedButton;
    CmbxCompanyCountry: TcxExtLookupComboBox;
    CmbxCompanyCity: TcxExtLookupComboBox;
    dxBevel1: TdxBevel;
    CmbxManager: TcxExtLookupComboBox;
    butClearManager: TSpeedButton;
    butClearStatus: TSpeedButton;
    CmbxCategory: TcxImageComboBox;
    butClearSubCategory: TSpeedButton;
    GridPersonDBTableView1: TcxGridDBTableView;
    GridPersonLevel1: TcxGridLevel;
    GridPerson: TcxGrid;
    PanelTab: TPanel;
    PageControl: TPageControl;
    OfficeTabSheet: TTabSheet;
    PrevOfficeBtn: TSpeedButton;
    NextOfficeBtn: TSpeedButton;
    DialUpBtn: TSpeedButton;
    FaxUpBtn: TSpeedButton;
    OfficePhonesLabel: TLabel;
    OfficeFaxesLabel: TLabel;
    Label16: TLabel;
    OfficeEmailLabel: TLabel;
    OfficeWebSiteLabel: TLabel;
    WebSiteBtn: TSpeedButton;
    MailUpBtn: TSpeedButton;
    AddressEditBtn: TSpeedButton;
    AddressPrintBtn: TSpeedButton;
    MainAddressLabel: TLabel;
    HeadOfficeLabel: TLabel;
    MailAddressLabel: TLabel;
    OfficeCountLabel: TLabel;
    AddressMemo: TMemo;
    GridEmail: TcxGrid;
    GridEmailDBTableView1: TcxGridDBTableView;
    GridEmailLevel1: TcxGridLevel;
    GridWebsite: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    GridPhone: TcxGrid;
    GridPhoneDBTableView1: TcxGridDBTableView;
    GridPhoneLevel1: TcxGridLevel;
    GridFax: TcxGrid;
    GridFaxDBTableView1: TcxGridDBTableView;
    GridFaxLevel1: TcxGridLevel;
    AccountTabSheet: TTabSheet;
    PrevAccountBtn: TSpeedButton;
    NextAccountBtn: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Bevel2: TBevel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    PrevForeignBtn: TSpeedButton;
    NextForeignBtn: TSpeedButton;
    IdentCodeLabel: TLabel;
    BankCountLabel: TLabel;
    AccCountLabel: TLabel;
    DBTaxPayCode: TDBEdit;
    DBTaxPayRegNo: TDBEdit;
    DBBankName: TDBEdit;
    DBBankMFO: TDBEdit;
    DBAccount1: TDBEdit;
    DBAccount2: TDBEdit;
    DBCorrSWIFT: TDBEdit;
    DBCorrName: TDBEdit;
    DBCorrAccount: TDBEdit;
    DBCorrAddress: TDBEdit;
    DBBankSWIFT: TDBEdit;
    DBBankAddress: TDBEdit;
    DBCorrCurency: TDBEdit;
    IdentCodeDBEdit: TDBEdit;
    ProfileTabSheet: TTabSheet;
    Label21: TLabel;
    Label32: TLabel;
    DBAsCmptr: TDBCheckBox;
    DBAsBuild: TDBCheckBox;
    DBAsStnry: TDBCheckBox;
    DBIsGovern: TDBCheckBox;
    DBAsCommc: TDBCheckBox;
    DBAsReklm: TDBCheckBox;
    DBAsPetrl: TDBCheckBox;
    DBAsKomun: TDBCheckBox;
    DBAsFurnt: TDBCheckBox;
    DBAsGuard: TDBCheckBox;
    DBAsMedia: TDBCheckBox;
    DBAsUrist: TDBCheckBox;
    DBAsBanks: TDBCheckBox;
    DBAsConsl: TDBCheckBox;
    DBAsOther: TDBCheckBox;
    DBAsGoods: TDBCheckBox;
    DBAsLease: TDBCheckBox;
    DBAsDrive: TDBCheckBox;
    DBAsHotel: TDBCheckBox;
    DBAsExcrs: TDBCheckBox;
    DBAsInsur: TDBCheckBox;
    DBAsVisas: TDBCheckBox;
    DBAsAmbas: TDBCheckBox;
    DBAsTickt: TDBCheckBox;
    DBAsTours: TDBCheckBox;
    DBAsEmpls: TDBCheckBox;
    DBAsAPair: TDBCheckBox;
    DBAsScoll: TDBCheckBox;
    DBAsExtrm: TDBCheckBox;
    DBAsFoods: TDBCheckBox;
    DBAsRecre: TDBCheckBox;
    DBAsMedic: TDBCheckBox;
    DBAsXhibt: TDBCheckBox;
    DBAsMusem: TDBCheckBox;
    DBAsMastr: TDBCheckBox;
    DBAsGuide: TDBCheckBox;
    DBAsParsl: TDBCheckBox;
    DBAsParse: TDBCheckBox;
    DBBus17: TDBCheckBox;
    DBAsAuPair: TDBCheckBox;
    DBAsNetAgent: TDBCheckBox;
    DBHeadOff: TDBCheckBox;
    PersonTabSheet: TTabSheet;
    PrevPersonBtn: TSpeedButton;
    NextPersonBtn: TSpeedButton;
    MobilPhone1Label: TLabel;
    HomePhoneLabel: TLabel;
    PersonEmailLabel: TLabel;
    Label27: TLabel;
    WorkPhoneLabel: TLabel;
    WorkFaxLabel: TLabel;
    MailUpBtn1: TSpeedButton;
    DialUpBtn1: TSpeedButton;
    DialUpBtn4: TSpeedButton;
    DialUpBtn5: TSpeedButton;
    FaxUpBtn1: TSpeedButton;
    WordUpBtn: TSpeedButton;
    Label1: TLabel;
    PersonDBText: TDBText;
    MobilPhone2Label: TLabel;
    DialUpBtn3: TSpeedButton;
    WorkIcqLabel: TLabel;
    WorkIcqBtn: TSpeedButton;
    HomeIcqLabel: TLabel;
    HomeIcqBtn: TSpeedButton;
    Label23: TLabel;
    DialUpBtn2: TSpeedButton;
    Label22: TLabel;
    MailUpBtn2: TSpeedButton;
    WorkSkypeLabel: TLabel;
    HomeSkypeLabel: TLabel;
    WorkSkypeBtn: TSpeedButton;
    HomeSkypeBtn: TSpeedButton;
    MobilPhone2DBEdit: TDBEdit;
    HomePhoneDBEdit: TDBEdit;
    OccupationDBEdit: TDBEdit;
    EmailDBEdit: TDBEdit;
    PhoneDBEdit: TDBEdit;
    FaxDBEdit: TDBEdit;
    DBRichEdit: TDBRichEdit;
    MobilPhone1DBEdit: TDBEdit;
    WorkIcqDBEdit: TDBEdit;
    HomeIcqDBEdit: TDBEdit;
    Phone2DBEdit: TDBEdit;
    HomeEmailDBEdit: TDBEdit;
    WorkSkypeDBEdit: TDBEdit;
    HomeSkypeDBEdit: TDBEdit;
    ContractTabSheet: TTabSheet;
    ContractOpenDocBtn: TSpeedButton;
    ContractAddRegBtn: TSpeedButton;
    ContractAddNewBtn: TSpeedButton;
    ContractSendDocBtn: TSpeedButton;
    ContractEditBtn: TSpeedButton;
    ActionContractBtn: TSpeedButton;
    SpeedButton1: TSpeedButton;
    AgentContractBtn: TSpeedButton;
    GridContract: TcxGrid;
    GridContractDBTableView1: TcxGridDBTableView;
    GridContractLevel1: TcxGridLevel;
    GridContractLog: TcxGrid;
    GridContractLogDBTableView1: TcxGridDBTableView;
    GridContractLogLevel1: TcxGridLevel;
    OrderTabSheet: TTabSheet;
    GridOrderList: TcxGrid;
    GridOrderListDBTableView1: TcxGridDBTableView;
    GridOrderListLevel1: TcxGridLevel;
    NoteTabSheet: TTabSheet;
    NoteToolBar: TToolBar;
    NoteAddBtn: TToolButton;
    NoteSeparatorBtn1: TToolButton;
    NoteDeleteBtn: TToolButton;
    GridNotes: TcxGrid;
    GridNotesDBTableView1: TcxGridDBTableView;
    GridNotesLevel1: TcxGridLevel;
    DocumentTabSheet: TTabSheet;
    GridDoc: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    GridFiles: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    ButShowLog: TSpeedButton;
    N22: TMenuItem;
    N23: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationIdle(Sender: TObject; var Done: Boolean);    
    procedure DataSrcDataChange(Sender: TObject; Field: TField);
    procedure RecordEditActionExecute(Sender: TObject);
    procedure RecordDeleteActionExecute(Sender: TObject);
    procedure CntrySelectComboBoxClick(Sender: TObject);
    procedure SelectComboBoxClick(Sender: TObject);
    procedure DBGridEnter(Sender: TObject);
    procedure DBGridExit(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure PersonDBGrid_DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure PageControlChange(Sender: TObject);
    procedure OfficeTabSheetEnter(Sender: TObject);
    procedure OfficeTabSheetShow(Sender: TObject);
    procedure PrevOfficeBtnClick(Sender: TObject);
    procedure NextOfficeBtnClick(Sender: TObject);
    procedure AddressEditBtnClick(Sender: TObject);
    procedure AddressMemoEnter(Sender: TObject);
    procedure AddressMemoChange(Sender: TObject);
    procedure AddressPrintBtnClick(Sender: TObject);
    procedure FaxUpBtnClick(Sender: TObject);
    procedure MailUpBtnClick(Sender: TObject);
    procedure WebSiteBtnClick(Sender: TObject);
    procedure WordUpBtnClick(Sender: TObject);
    procedure PrevAccountBtnClick(Sender: TObject);
    procedure NextAccountBtnClick(Sender: TObject);
    procedure DBBankNameEnter(Sender: TObject);
    procedure PrevForeignBtnClick(Sender: TObject);
    procedure NextForeignBtnClick(Sender: TObject);
    procedure DBCorrNameEnter(Sender: TObject);
    procedure DBClassCodeEnter(Sender: TObject);
    procedure PersonTabSheetEnter(Sender: TObject);
    procedure PrevPersonBtnClick(Sender: TObject);
    procedure NextPersonBtnClick(Sender: TObject);
    procedure ProfileTabSheetShow(Sender: TObject);
    procedure EmailDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure FaxDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure ExportAddressActionExecute(Sender: TObject);
    procedure PersonDataSourceDataChange(Sender: TObject; Field: TField);
    procedure CitySelectComboBoxClick(Sender: TObject);
    procedure LocateOurselvesActionExecute(Sender: TObject);
    procedure FilterOffActionExecute(Sender: TObject);
    procedure CntrySelectComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure CitySelectComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure AddressMemoKeyPress(Sender: TObject; var Key: Char);
    procedure OfficeDataSourceDataChange(Sender: TObject; Field: TField);
    procedure RecordSearchActionExecute(Sender: TObject);
    procedure AccountTabSheetEnter(Sender: TObject);
    procedure AccountDataSourceDataChange(Sender: TObject; Field: TField);
    procedure Export1cActionExecute(Sender: TObject);
    procedure ClientPropsActionExecute(Sender: TObject);
    procedure ContractTabSheetEnter(Sender: TObject);
    procedure ContractDataSourceDataChange(Sender: TObject; Field: TField);
    procedure ContractAddBtnClick(Sender: TObject);
    procedure ContractOpenDocBtnClick(Sender: TObject);
    procedure AccountTabSheetShow(Sender: TObject);
    procedure FilterDismissedActionExecute(Sender: TObject);
    procedure WorkIcqBtnClick(Sender: TObject);
    procedure MaillistActionExecute(Sender: TObject);
    procedure act_reviewExecute(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure DBGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBGridTitleClick(Column: TSvtColumn);
    procedure ReestrFornActionExecute(Sender: TObject);
    procedure ShowReestrFormActionExecute(Sender: TObject);
    procedure FindTimerTimer(Sender: TObject);

    procedure SkypeBtnClick(Sender: TObject);
    procedure OrderListGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);
    procedure OrderTabSheetShow(Sender: TObject);
    procedure OrderTabSheetHide(Sender: TObject);
    procedure OrderListGridDblClick(Sender: TObject);
    procedure NoteAddActionExecute(Sender: TObject);
    procedure NoteTabSheetShow(Sender: TObject);
    procedure NoteTabSheetHide(Sender: TObject);
    procedure NotesDBGridDblClick(Sender: TObject);
    procedure ContractTabSheetShow(Sender: TObject);
    procedure ContractTabSheetHide(Sender: TObject);
    procedure DocumentTabSheetShow(Sender: TObject);
    procedure CompanySrcDataChange(Sender: TObject; Field: TField);
    procedure ContractEditBtnClick(Sender: TObject);
    procedure ContractActionExecute(Sender: TObject);
    procedure TourExpActionExecute(Sender: TObject);
    procedure tbtn_review_checkClick(Sender: TObject);
    procedure PromiseActionExecute(Sender: TObject);
    procedure LogDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure AccountTabSheetHide(Sender: TObject);
    procedure ListingExportToWordActionExecute(Sender: TObject);
    procedure NotesDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure ContractTempDaysActionExecute(Sender: TObject);
    procedure NotesDBGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SubCategoryComboBoxClick(Sender: TObject);
    procedure AddFiliyaActionExecute(Sender: TObject);
    procedure ContractSelActionExecute(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure ContractReRestrActionExecute(Sender: TObject);
    procedure DialUpBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ContractAgentActionExecute(Sender: TObject);
    procedure DropTextTargetDrop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure CopyMenuItemClick(Sender: TObject);
    procedure ContractRcvCopyActionExecute(Sender: TObject);
    procedure LogDBGridDblClick(Sender: TObject);
    procedure GridDropTextTargetDragOver(Sender: TObject;
      ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
    procedure SecondaryTreeView2DblClick(Sender: TObject);
    procedure SecondaryPopupEditPropertiesCloseUp(Sender: TObject);
    procedure SecondaryPopupEditPropertiesInitPopup(Sender: TObject);
    procedure SecondaryTreeView2KeyPress(Sender: TObject; var Key: Char);
    procedure N21Click(Sender: TObject);
    procedure ClearSearchCompanyClick(Sender: TObject);
    procedure ButClearCompanyCountryClick(Sender: TObject);
    procedure ButClearCompanyCityClick(Sender: TObject);
    procedure CmbxCompanyCityPropertiesInitPopup(Sender: TObject);
    procedure CmbxCompanyCountryPropertiesChange(Sender: TObject);
    procedure ButClearComboxStatusSelectClick(Sender: TObject);
    procedure ButClearSecondaryPopupEditClick(Sender: TObject);
    procedure ButClearThirdSelectComboBoxClick(Sender: TObject);
    procedure EdiFindCmpanyByNameKeyPress(Sender: TObject; var Key: Char);
    procedure TypeNameCheckBoxClick(Sender: TObject);
    procedure ButSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CmbxCompanyCityPropertiesChange(Sender: TObject);
    procedure CmbxCompanyCountryExit(Sender: TObject);
    procedure ComboxStatusSelectPropertiesChange(Sender: TObject);
    procedure SecondaryPopupEditPropertiesChange(Sender: TObject);
    procedure ThirdSelectComboBoxPropertiesChange(Sender: TObject);
    procedure butClearManagerClick(Sender: TObject);
    procedure CmbxManagerPropertiesChange(Sender: TObject);
    procedure CmbxCategoryPropertiesChange(Sender: TObject);
    procedure butClearStatusClick(Sender: TObject);
    procedure butClearSubCategoryClick(Sender: TObject);
    procedure SubCategoryComboBoxPropertiesChange(Sender: TObject);
    procedure EdiFindCmpanyByNamePropertiesChange(Sender: TObject);
    procedure DataSetRefreshActionExecute(Sender: TObject);
    procedure ButShowLogClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure N23Click(Sender: TObject);

  private
    FCompanyCity: Integer;
    FCompanyCountry: Integer;
    FCompanyPrimary: Integer;
    FCompanySecondary: Integer;
    FFind: Boolean;
    FOffRecNo: Integer;
    FAccRecNo: Integer;
    FCorrRecNo: Integer;
    FPersRecNo: Integer;
    FExportDocum: _Document;
    FnRow: Integer;
    FnCol: Integer;
    FOldCoord: TGridCoord;
    FOldHint: string;
    FOrderByColumn: string;
    FId0, FId1: Integer;
    FCategoryComboBoxChange: Boolean;
    FItsShortMenu: Boolean;
    FOnClick: Boolean;
    FChangeCategotyFilter: Boolean;
    FImage: TJpegImage;
    FCompanyId: Integer;
    procedure FPrepareControls;
    procedure FDestroyControls;
    procedure AddCompanyTitleList(Lst: TStrings);
    procedure AddCompanyToList(Lst: TStrings);
    procedure AddCompanyToListing(Lst: TStrings);
    procedure AddPersonTitleList(Lst: TStrings);
    procedure AddPersonToList(Lst: TStrings);
    procedure AddPersonToListing(Lst: TStrings);
    procedure ChangeCompanyAddressFilter(Country, City: Integer);
    procedure ChangeCompanyIsInterpr;
    procedure ChangeCompanyProfiles;
    procedure ChangeOfficeLabel(Labl: TLabel; aQry: TIBQuery);
    procedure ChangeOfficeLabels;
    procedure ClearFax;
    procedure ClearPhone;
    procedure ClearContract;
    procedure EditAccountTable(ActionTag: Integer);
    procedure EditCorrespondTable(ActionTag: Integer);
    procedure EditContractTable(ActionTag: Integer);
    procedure EditOfficeTable(ActionTag: Integer);
    procedure EditPersonTable(ActionTag: Integer);
    procedure EditEmailTable(ActionTag: Integer);
    procedure EditFaxTable(ActionTag: Integer);
    procedure EditPhoneTable(ActionTag: Integer);
    procedure EditWebSiteTable(ActionTag: Integer);
    procedure Export1c;
    function GetFilterFields: String;
    procedure LocateCompanyTable;
    function LocateOurselves: Boolean;
    function MakeClientProps: Boolean;
    procedure NewCompanyTable(IsFiliya: Boolean = False);
    procedure PrepareProfiles(AddTour, AddWork: Boolean);
    procedure RefreshBankAccount;
    procedure RefreshContract;
    procedure RefreshCorrAccount;
    procedure SetCompanyCity(const Value: Integer);
    procedure SetCompanyCountry(const Value: Integer);
    procedure UpdateCompanyCities;
    procedure UpdateCompanyCountries;
    property CompanyCountry: Integer read FCompanyCountry write SetCompanyCountry;
    property CompanyCity: Integer read FCompanyCity write SetCompanyCity;
    function PrepareReestrForm(ShowReestrForm: Boolean): string;
    function GetTemplFile: string;
    function GetTemplFolder: string;
    procedure FillReestrForm;
    function GetCompanyZipCode: string;
    function GetCompRegAddress: string;
    procedure UpdateAddressMemo;
    function GetPhoneNo(const Index: Integer): string;
    procedure ExecuteSendMail(FileName: string = ''); 
    procedure DrawImg(ACanvas: TCanvas; Rct: TRect;
      Afile: string; OnLeft: Boolean = False);
    procedure RegistrCall;
    procedure RegistrExtraAgent;
    procedure ToggleDocumentListView;
//    procedure UpdateComboBox;
//    procedure SetSizeColumn;
//    procedure UpdateRenameBtn;
    procedure RefreshFilterBtn;
    procedure PrepareEmailsPhoneFilter;
    procedure PrepareCompCount;
    procedure UpdateContractQry;
    procedure UpdateCompContracts(ContractId, CompanyId, aTag: Integer; 
      SetText: string);
    procedure UpdateSubCategoryComboBox(CategoryId: Integer);
    procedure SetSecondDefData(IsFirst: Boolean = False);
    procedure UpdateContractBtn(Enabled: Boolean);
    function CheckCompanyData: Boolean;
    function ExportCompanyAddress: string;
    function GetTemplFileForAddress: string;
    function FillWordTable: Boolean;
    function TypeName: integer;
    function GetCategoryFilter(const Pri: string): string;
    function GetCategoryAllTimeFilter(const Pri: string): string;    
    procedure ComplCountryAnCity(CompId, CntryId: Integer; CompName: string);
    procedure AddHeadOfficeAddress(HeadCompId, CompId: Integer);
    procedure AddBankAccount(HeadCompId, CompId: Integer);
    function FillDocument(TypeTempl: Integer): Boolean;    
    procedure UpdateCompanyProperties;
    function GetContractType: Integer;
    procedure ContractAgentSendMail(const FileName: string);
    procedure StoreContractRcv;
    procedure CopyFileProc(FileName: string);
    procedure UpdateGridDrop(APage: TTabSheet);
    function CompanyAreLicenseDoc: Boolean;

  protected

    procedure ViewCompanyFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);

    procedure ViewCompanyCOMPANYNAMEGetDisplayText(
              Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
              var AText: String);

    procedure PrepareValueFromField( FieldName:String; var MasFieldName:TVarArr;
                                     var MasValue:TVarArrVariant; var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                     ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );

    procedure PrepareValueFromMas(  MasField:array of String;IndMas:Integer; var MasFieldName:TVarArr;
                                     var MasValue:TVarArrVariant; var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                     ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );

    procedure PrepareFilterManager(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    procedure PrepareFilterCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    procedure PrepareFilterSubCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    procedure PrepareFilterStatus(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
    procedure PrepareFilterStatusKindActivity(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
    procedure PrepareFilterOrgForm( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );

    function  PrepareFilterCountryCity:Boolean;
    procedure PrepareFilterCompanyName( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    function  GetCurrFieldCompanyName:Widestring;

    procedure SetFilterCompanyCountryDB;
    procedure SetFilterCompanyView;
    procedure SetComercialCompanyView(isComercial:Boolean);


    procedure AddTitleList(Lst: TStrings); override;
    procedure AddToList(Lst: TStrings); override;
    procedure AddToListing(Lst: TStrings); override;
    function CanAccessEdit: Boolean; override;
    function CanAccessPrnt: Boolean; override;
    function DataSetCanDelete(DSet: TDataSet): Boolean; override;
    function GetOrderByColumns(Index: Integer): String; override;
    function ShowEditor(EditState: Integer): Boolean; override;
    procedure UpdateDataSets; override;
    procedure UpdateToolButtons; override;    
    property CompPhoneNo: string index 0 read GetPhoneNo;
    property CompFaxNo: string index 1 read GetPhoneNo;
    property CompEmail: string index 2 read GetPhoneNo;
    property CompWeb: string index 3 read GetPhoneNo;
  public
  end;

var
  CompanyBrowseForm: TCompanyBrowseForm;
//  IniFile: TIniFile;
//  IniFileName: TFileName;
//const
//  IniName = 'ini.ini';
//  WM_MYMESSAGE = WM_USER+1;

procedure ShowCompanyBrowse(MId, DId, Man: Integer);
function SelectCompanyBrowse(var MId, DId: Integer; Man: Integer): WordBool;


implementation

uses Variants, VDlgs, ServMod, CompFrm, ZTDlg, AddrDlg, EmailFrm, PhoneDlg,
  WebDlg, AccntFrm, AccCrFrm, PrsnFrm, TourConsts, TourCmnlIf, TourDbUn, OptSet,
  EnvPrnDlg, TourStrMag, MailSndFrm, CompFndDlg, Pay1cUn, CntrctFrm,
  ClntPrpDlg, OleCntnr, frm_review, DocFileUn, AzStrMag, ReestrDataFrm,
  OrderUn, TourUnts, NoteEdDlg, ObdzvinFrm, ExtraAgentDlg, PromiseDlg,
  Math, StatForm, RcvOrigContractDlg, TourFiles, ServModIB, UnitPreviewFiles,
  CityBr, UnitProc, CompTaxLogFrm;

{$R *.DFM}
const

  DogCategoryName: array[0..nContrCategoryCount] of string =('',
   'Не є агентом', 'Закінчився термін дії угоди', 
   'Передзвонити після "дати"', 'Дату дзвінка протерміновано', 
   'Документи надійдуть до "дати"', 'Дату надходження док. протерміновано', 
   'Внесено всі реквізити', 'Угоду згенеровано', 
   'Дозволено перереєстрацію угоди', 'Перегенерована угода', 
   'Угоду надіслано мейлом', 'Копію угоди приєднано',
   'Термін роботи з копією угоди продовжено',
   'Угоду роздруковано', 'Угоду підписано',
   'Угоду надіслано поштою', 'Оригінал не отримано більше 3 тижнів',
   'Оригінал надішлють до "дати"', 'Дату надходження оригіналу протерміновано', 
   'Зареєстровано отримання оригіналу',
   'Відмова партнера укладати угоду'); 
  DocCategoryItem: array[0..nContrCategoryCount] of Integer = (-2,
    -1, 0, 1, 101, 2, 102, 3, 4, 5, 6, 7, 12, 17, 18, 19, 20, 21, 22, 122, 23, 24); 
//    -1, 0, 1, 2, 21, 3, 31, 4, 5, 9, 13, 14, 15, 16, 17, 18); 

  ExportCategoryName: array[0..nExportCategoryCount] of string =('',
   'Не є нашим агентом або є агентом і не має сайту', 'Агент, є сайт, не було експорту',
   'Передзвонити після "дати"', 'Дату дзвінка протерміновано',
   'Розмістять тури до "дати"', 'Дату розміщення турів протерміновано', 
   'Агент зняв з сайту наші тури', 'Наші тури розміщені на сайті агента', 
   'Відправили мейл із переліком недоліків',
   'Виправлять недоліки до "дати"', 'Дату виправлення недоліків протерміновано', 
   'Агент має додаткові 4%', 'Агент не хоче додаткові 4%',
   'Агент зняв наші тури та відмовився їх розміщувати', 
   'Агент відмовився розміщувати наші тури'); 
  ExportCategoryItem: array[0..nExportCategoryCount] of Integer = (
    -1, 0, 100, 1, 101, 2, 102, 3, 4, 5, 6, 106, 7, 8, 9, 10); 
  nAllCategory = 0;
  nOrderCategory = 1;
  nCntrCategory = 2;
  nExportCategory = 3;
{var 
    EventHandle : THandle;}
  
procedure ShowCompanyBrowse(MId, DId, Man: Integer);
var Id0, Id1: Integer;
begin
  {  EventHandle := OpenEvent(EVENT_ALL_ACCESS, false,  CompEventName);
  if EventHandle = 0 then EventHandle := CreateEvent(nil, false, false, CompEventName);}
  //if not CheckActionLevel( EnCompanyBrowseShow ) then Exit; //EnCompanyBrowseShow

  with DMServ do
  begin
    CurManager := Man;
    if MId > 0 then Id0 := MId else
    if Elem_COMPANYQRY.DB.Active then Id0 := Elem_COMPANYQRY.DB.FieldByName(Elem_COMPANYQRY.FieldKod).AsInteger// GetValueId
      else Id0 := OptionSet.LastOpDictCompany;

    if DId > 0 then Id1 := DId else if PersonQry.Active then
      Id1 := Elem_PersonQry.DB.FieldByName('PERSONID').asInteger
    else Id1 := 0;
  end;

  try

  if not Assigned(CompanyEditForm) then
     Application.CreateForm( TCompanyEditForm, CompanyEditForm );

  if not Assigned(CompanyBrowseForm) then
     Application.CreateForm( TCompanyBrowseForm, CompanyBrowseForm );

     
    CompanyBrowseForm.EditForm := CompanyEditForm;
    CompanyBrowseForm.FId0 := Id0;
    CompanyBrowseForm.FId1 := Id1;
    CompanyBrowseForm.Show;
  except
    CompanyEditForm:=nil;
    CompanyBrowseForm :=nil;
    Application.CreateForm(TCompanyEditForm, CompanyEditForm);
    Application.CreateForm(TCompanyBrowseForm, CompanyBrowseForm);
    CompanyBrowseForm.EditForm := CompanyEditForm;
    CompanyBrowseForm.FId0 := Id0;  
    CompanyBrowseForm.FId1 := Id1;
    CompanyBrowseForm.Show;
  end;
end;

function SelectCompanyBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := CheckActionLevel(EnEditVendorProp);
  if not Result then Exit;
  //ShowSelectDetail
  Result := False;
end;

const
//  nPriCount = 7;
  nPriCount = 5;
  nSecCount = 20;
  nTrdCount = 4;
{  sPriFlds: array[0..nPriCount] of String = ('',
    'ISCLIENT', 'ISVENDOR', 'ISAGENT', 'ISPROPS', 'ISPOTENT', 'ISOTHER', 'FORWORK');}
  sPriFlds: array[0..nPriCount] of String = ('',
    'ISAGENT', 'ISCLIENT', 'ISVENDOR', 'ISTOUROPER', 'ISOTHER');
  sSecFlds: array[0..nSecCount * 2] of String = ('',
    'ASTOURS', 'ASHOTEL', 'ISHOTEL', 'ASDRIVE', 'ASTICKT', 'ASVISAS',
    'ASEXCRS', 'ASGUIDE', 'ASMUSEM', 'ASEXTRM', 'ASFOODS', 'ASRECRE',
    'ASMEDIC', 'ASINSUR', 'ASSCOLL', 'ASEMPLS', 'ASXHIBT', 'ASAMBAS',
    'ASPARSE', 'ASAPAIR',
    'ASCOMMC', 'ASCMPTR', 'ASSTNRY', 'ASFURNT', 'ASGOODS', 'ASPETRL',
    'ASMEDIA', 'ASREKLM', 'ASLEASE', 'ASURIST', 'ASCONSL', 'ASGUARD',
    'ASBANKS', 'ISGOVERN', 'ASKOMUN', 'ASBUILD', 'ASMASTR', 'ASPARSL',
    'BUS17', 'ASOTHER');
  sTrdFlds: array[0..nTrdCount] of String = ('',
    'ISENTERPR', 'ISBUDGET', 'ISPRIVATE', 'ISBSMAN');
  sSecFldsNew: array[0..nSecCount*2] of String = (
    'ASTOURS', 'ASNETAGENT', 'ASHOTEL', 'ASDRIVE', 
    'ASFOODS', 'ASTICKT', 'ASVISAS', 'ASEXCRS', 
    'ASGUIDE', 'ASMEDIC', 'ASINSUR', 'ASRECRE',
    'ASMUSEM', 'ASEXTRM', 'ASSCOLL', 'ASAUPAIR',
    'ASEMPLS', 'ASPARSE', 'ASXHIBT', 'ASAMBAS',
    'ASAPAIR',
    'ASCOMMC', 'ASCMPTR', 'ASSTNRY', 'ASFURNT', 'ASGOODS', 'ASPETRL',
    'ASMEDIA', 'ASREKLM', 'ASLEASE', 'ASURIST', 'ASCONSL', 'ASGUARD',
    'ASBANKS', 'ISGOVERN', 'ASKOMUN', 'ASBUILD', 'ASMASTR', 'ASPARSL',
    'BUS17', 'ASOTHER');
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CODE OFF}                                  
  pTourNew: array[0..nSecCount] of Pointer = (
    @SCompBrAsTours, @SCompBrAsNetAgent, @SCompBrAsHotel, @SCompBrAsDrive,
    @SCompBrAsFoods, @SCompBrAsTickt, @SCompBrAsVisas, @SCompBrAsExcrs, 
    @SCompBrAsGuide, @SCompBrAsMedic, @SCompBrAsInsur, @SCompBrAsRecre,
    @SCompBrAsMusem, @SCompBrAsExtrm, @SCompBrAsScool, @SCompBrAsAuPair,
    @SCompBrAsEmpls, @SCompBrAsParse, @SCompBrAsXhibt, @SCompBrAsAmbas,  
    @SCompBrAsAPair);
  pWorkNew: array[0..nSecCount - 1] of Pointer = (
    @SCompBrAsCommc, @SCompBrAsCmptr, @SCompBrAsStnry, @SCompBrAsFurnt,
    @SCompBrAsGoods, @SCompBrAsPetrl, @SCompBrAsMedia, @SCompBrAsReklm,
    @SCompBrAsLease, @SCompBrAsUrist, @SCompBrAsConsl, @SCompBrAsGuard,
    @SCompBrAsBanks, @SCompBrAsGovrn, @SCompBrAsKomun, @SCompBrAsBuild,
    @SCompBrAsMastr, @SCompBrAsParsl, @SCompBrWkBus17, @SCompBrAsOther);
  pTour: array[0..nSecCount - 1] of Pointer = (
    @SCompBrAsTours, @SCompBrAsHotel, @SCompBrIsHotel, @SCompBrAsDrive,
    @SCompBrAsTickt, @SCompBrAsVisas, @SCompBrAsExcrs, @SCompBrAsGuide,
    @SCompBrAsMusem, @SCompBrAsExtrm, @SCompBrAsFoods, @SCompBrAsRecre,
    @SCompBrAsMedic, @SCompBrAsInsur, @SCompBrAsScool, @SCompBrAsEmpls,
    @SCompBrAsXhibt, @SCompBrAsAmbas, @SCompBrAsParse, @SCompBrAsAPair);
  pWork: array[0..nSecCount - 1] of Pointer = (
    @SCompBrAsCommc, @SCompBrAsCmptr, @SCompBrAsStnry, @SCompBrAsFurnt,
    @SCompBrAsGoods, @SCompBrAsPetrl, @SCompBrAsMedia, @SCompBrAsReklm,
    @SCompBrAsLease, @SCompBrAsUrist, @SCompBrAsConsl, @SCompBrAsGuard,
    @SCompBrAsBanks, @SCompBrAsGovrn, @SCompBrAsKomun, @SCompBrAsBuild,
    @SCompBrAsMastr, @SCompBrAsParsl, @SCompBrWkBus17, @SCompBrAsOther);
  pHTur: array[0..nSecCount - 1] of Pointer = (
    @SCompBrHintAsTours, @SCompBrHintAsHotel, @SCompBrHintIsHotel, @SCompBrHintAsDrive,
    @SCompBrHintAsTickt, @SCompBrHintAsVisas, @SCompBrHintAsExcrs, @SCompBrHintAsGuide,
    @SCompBrHintAsMusem, @SCompBrHintAsExtrm, @SCompBrHintAsFoods, @SCompBrHintAsRecre,
    @SCompBrHintAsMedic, @SCompBrHintAsInsur, @SCompBrHintAsScool, @SCompBrHintAsEmpls,
    @SCompBrHintAsXhibt, @SCompBrHintAsAmbas, @SCompBrHintAsParse, @SCompBrHintAsAPair);
  pHWrk: array[0..nSecCount - 1] of Pointer = (
    @SCompBrHintAsCommc, @SCompBrHintAsCmptr, @SCompBrHintAsStnry, @SCompBrHintAsFurnt,
    @SCompBrHintAsGoods, @SCompBrHintAsPetrl, @SCompBrHintAsMedia, @SCompBrHintAsReklm,
    @SCompBrHintAsLease, @SCompBrHintAsUrist, @SCompBrHintAsConsl, @SCompBrHintAsGuard,
    @SCompBrHintAsBanks, @SCompBrHintAsGovrn, @SCompBrHintAsKomun, @SCompBrHintAsBuild,
    @SCompBrHintAsMastr, @SCompBrHintAsParsl, @SCompBrHintWkBus17, @SCompBrHintAsOther);
  {$WARN UNSAFE_CODE ON}
  {$WARN UNSAFE_TYPE ON}

{ CompanyBrowseForm }

procedure TCompanyBrowseForm.AddCompanyTitleList(Lst: TStrings);
begin
  with DMServ do
  begin
    Lst.Add(Elem_COMPANYQRY.DB.FieldByName('NAME').DisplayName);
    Lst.Add(Elem_COMPANYQRY.DB.FieldByName('COMPKIND').DisplayName);
    Lst.Add(OfficeQryCOUNTRY.DisplayName);
    Lst.Add(OfficeQryZIPCODE.DisplayName);
    Lst.Add(OfficeQryCITY.DisplayName);
    Lst.Add(OfficeQryTOWNSHIP.DisplayName);
    Lst.Add(OfficeQryPROVINCE.DisplayName);
    Lst.Add(OfficeQryADDRESS.DisplayName);
    Lst.Add(OfficeQryHOUSE.DisplayName);
    Lst.Add(OfficeQryTENEMENT.DisplayName);
    Lst.Add(SCompBrTitlePhone);
    Lst.Add(SCompBrTitleFax);
    Lst.Add(EmailQryEMAIL.DisplayName);
    Lst.Add(WebSiteQryWEBSITE.DisplayName);
    if ViewMemosAction.Checked then Lst.Add(Elem_COMPANYQRY.DB.FieldByName('MEMO').DisplayName);
  end;
end;

procedure TCompanyBrowseForm.AddCompanyToList(Lst: TStrings);
var
  S: String;
  Id, N: Integer;
  CityFld: TField;
begin
  with DMServ do
  begin
    Lst.Add(Elem_COMPANYQRY.DB.FieldByName('NAME').Value);
    Lst.Add(Elem_COMPANYQRY.DB.FieldByName('COMPKIND').value);
    Lst.Add(Elem_OfficeQry.DB.FieldByName('COUNTRY_ENG').asString);
    Lst.Add(Elem_OfficeQry.DB.FieldByName('ZIPCODE').asString);
    if OfficeQryLATNAME.AsBoolean then CityFld := OfficeQryCITY_ENG
    else CityFld := OfficeQryCITY;
    Lst.Add(CityFld.AsString);
    Lst.Add(Elem_OfficeQry.DB.FieldByName('TOWNSHIP').asString);
    Lst.Add(Elem_OfficeQry.DB.FieldByName('PROVINCE').asString);
    Lst.Add(Elem_OfficeQry.DB.FieldByName('ADDRESS').asString);
    Lst.Add(Elem_OfficeQry.DB.FieldByName('HOUSE').asString);
    Lst.Add(Elem_OfficeQry.DB.FieldByName('TENEMENT').asString);
    S := '';
    N := 0;
    with PhoneQry do if RecordCount > 0 then
      try
        Id := Elem_PhoneQry.DB.FieldByName('PHONEID').asInteger;
        DisableControls;
        First;
        while not Eof do
        begin
          S := S + GetPhoneNumber(PhoneQryCNTRYCODE,
            PhoneQryAREACODE, PhoneQryPHONENO, PhoneQryEXTENTION) + ';'#32#32#32;
          Inc(N);
          if N = 4 then Break;
          Next;
        end;
        Locate('PHONEID', Id, []);
      finally
        EnableControls;
      end;
    Lst.Add(S);
    S := '';
    N := 0;
    with FaxQry do if RecordCount > 0 then
      try
        Id := Elem_FaxQry.DB.FieldByName('PHONEID').asInteger;
        DisableControls;
        First;
        while not Eof do
        begin
          S := S + GetPhoneNumber(FaxQryCNTRYCODE,
            FaxQryAREACODE, FaxQryPHONENO, FaxQryEXTENTION) + ';'#32#32#32;
          Inc(N);
          if N = 4 then Break;
          Next;
        end;
        Locate('PHONEID', Id, []);
      finally
        EnableControls;
      end;
    Lst.Add(S);

    Lst.Add(Elem_EmailQry.DB.FieldByName('EMAIL').asString);
    Lst.Add(Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString);
    if ViewMemosAction.Checked then Lst.Add(StringWithoutCRLF( Elem_COMPANYQRY.DB.FieldByName('MEMO').asString ) );
  end;
end;

procedure TCompanyBrowseForm.AddCompanyToListing(Lst: TStrings);
var
  S: String;
  L :TStrings;
  I, Id, N: Integer;
  CityFld, CntrFld: TField;
begin
  with DMServ do
  begin
    S := Elem_COMPANYQRY.DB.FieldByName('NAME').AsString;
    with Elem_COMPANYQRY.DB.FieldByName('COMPKIND') do if Value <> '' then S := S + ', ' + Value;
    with Elem_COMPANYQRY.DB.FieldByName('VCARDNO') do if Value > 0 then S := S + #9'(' + AsString + ')';
    Lst.Add(S);
    L := TStringList.Create;
    try
      if OfficeQryLATNAME.AsBoolean then 
      begin
        CityFld := OfficeQryCITY_ENG;
        CntrFld := OfficeQryCOUNTRY_ENG;
      end else 
      begin
        CityFld := OfficeQryCITY;
        CntrFld := OfficeQryCOUNTRY;
      end;
      GetOfficeAddress(L, OfficeQrySTRKIND, OfficeQryADDRESS,
        OfficeQryHOUSE, OfficeQryTENEMENT, OfficeQryCITYKIND, CityFld,
        OfficeQryTOWNSHIP, OfficeQryPROVINCE, OfficeQryZIPCODE, CntrFld);
      with L do
        if Count > 2 then
        begin
          Strings[Count - 2] := Strings[Count - 2] + #32#32 + Strings[Count - 1];
          Delete(Count - 1);
        end;
      for I := 0 to L.Count - 1 do if Trim(L[I]) <> '' then Lst.Add(#9 + L[I]);
    finally
      L.Free;
    end;
        
    Lst.Add(#9 + OfficePhonesLabel.Caption + ':');
    S := '';
    N := 0;
    with PhoneQry do if RecordCount > 0 then
      try
        Id := Elem_PhoneQry.DB.FieldByName('PHONEID').asInteger;
        DisableControls;
        First;
        while not Eof do
        begin
          S := S + GetPhoneNumber(PhoneQryCNTRYCODE,
            PhoneQryAREACODE, PhoneQryPHONENO, PhoneQryEXTENTION) + ';'#32#32#32;
          Inc(N);
          if N = 4 then
          begin
            if S <> '' then Lst.Add(#9 + Copy(S, 1, Length(S) - 4));
            N := 0;
            S := '';
          end;
          Next;
        end;
        Locate('PHONEID', Id, []);
      finally
        EnableControls;
      end;
    if S <> '' then Lst.Add(#9 + Copy(S, 1, Length(S) - 4));
    S := '';
    N := 0;
    with FaxQry do if RecordCount > 0 then
      try
        Lst.Add(#9 + OfficeFaxesLabel.Caption + ':');
        Id := Elem_FaxQry.DB.FieldByName('PHONEID').asInteger;
        DisableControls;
        First;
        while not Eof do
        begin
          S := S + GetPhoneNumber(FaxQryCNTRYCODE,
            FaxQryAREACODE, FaxQryPHONENO, FaxQryEXTENTION) + ';'#32#32#32;
          Inc(N);
          if N = 4 then
          begin
            if S <> '' then Lst.Add(#9 + Copy(S, 1, Length(S) - 4));
            N := 0;
            S := '';
          end;
          Next;
        end;
        Locate('PHONEID', Id, []);
      finally
        EnableControls;
      end;
    if S <> '' then Lst.Add(#9 + Copy(S, 1, Length(S) - 4));

    //Lst.Add(#9 + OfficeEmailLabel.Caption + ':'#9 + Elem_EmailQry.DB.FieldByName('EMAIL').asString);
    N := 0;
    with EmailQry do if RecordCount > 0 then
      try
        Id := Elem_EmailQry.DB.FieldByName('EMAILID').asInteger;
        DisableControls;
        First;
        while not Eof do
        begin
          S := Elem_EmailQry.DB.FieldByName('EMAIL').asString;
          Inc(N);
          if N = 1 then
            S := #9 + OfficeEmailLabel.Caption + ':'#9 + S else S := #9#9#9 + S;
          Lst.Add(S);
          Next;
        end;
        Locate('EMAILID', Id, []);
      finally
        EnableControls;
      end;
    //Lst.Add(#9 + OfficeWebSiteLabel.Caption + ':'#9 + Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString);
    with WebSiteQry do if RecordCount > 0 then
      try
        N := 0;
        Id := Elem_WebSiteQry.DB.FieldByName('WEBSITEID').asInteger;
        DisableControls;
        First;
        while not Eof do
        begin
          S := Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString;
          Inc(N);
          if N = 1 then
            S := #9 + OfficeWebSiteLabel.Caption + ':'#9 + S else S := #9#9#9 + S;
          Lst.Add(S);
          Next;
        end;
        Locate('WEBSITEID', Id, []);
      finally
        EnableControls;
      end;
    if ViewMemosAction.Checked then
      Lst.Add(#9 + ViewMemosAction.Caption + ':'#9 + Elem_COMPANYQRY.DB.FieldByName('MEMO').asString);
    Lst.Add('');
  end;
end;

procedure TCompanyBrowseForm.AddPersonTitleList(Lst: TStrings);
begin
  with DMServ do
  begin
    Lst.Add(PersonQryFULLNAME.DisplayName);
    Lst.Add(PersonQryOCCUPATION.DisplayName);
    Lst.Add( Elem_COMPANYQRY.DB.FieldByName('NAME').DisplayName );
    Lst.Add(PersonQryPHONE1.DisplayName);
    Lst.Add(PersonQryPHONE2.DisplayName);
    Lst.Add(PersonQryFAX.DisplayName);
    Lst.Add(PersonQryMOBILPHONE.DisplayName);
    Lst.Add(PersonQryMOBILHONE.DisplayName);
    Lst.Add(PersonQryHOMEPHONE.DisplayName);
    Lst.Add(PersonQryE_MAIL.DisplayName);
    Lst.Add(EmailQryEMAIL.DisplayName);
    Lst.Add(WebSiteQryWEBSITE.DisplayName);
    Lst.Add(PersonQryMEMO.DisplayName);
  end;
end;

procedure TCompanyBrowseForm.AddPersonToList(Lst: TStrings);
var S: String;
begin
  with DMServ do
  begin
    Lst.Add(Elem_PersonQry.DB.FieldByName('FULLNAME').asString);
    Lst.Add(Elem_PersonQry.DB.FieldByName('OCCUPATION').asString);
    S := Elem_COMPANYQRY.DB.FieldByName('NAME').asString;

    with Elem_COMPANYQRY.DB.FieldByName('COMPKIND') do if Value <> '' then S := S + ', ' + Value;
    Lst.Add(S);
    Lst.Add(Elem_PersonQry.DB.FieldByName('PHONE1').asString);
    Lst.Add(Elem_PersonQry.DB.FieldByName('PHONE2').asString);
    Lst.Add(Elem_PersonQry.DB.FieldByName('FAX').asString);
    Lst.Add(Elem_PersonQry.DB.FieldByName('MOBILPHONE').asString);
    Lst.Add(Elem_PersonQry.DB.FieldByName('MOBILHONE').asString);
    Lst.Add(Elem_PersonQry.DB.FieldByName('HOMEPHONE').asString);
    Lst.Add(Elem_PersonQry.DB.FieldByName('E_MAIL').asString);
    Lst.Add(Elem_EmailQry.DB.FieldByName('EMAIL').asString);
    Lst.Add(Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString);
    Lst.Add(StringWithoutCRLF(Elem_PersonQry.DB.FieldByName('MEMO').AsVariant));
  end;
end;

procedure TCompanyBrowseForm.AddPersonToListing(Lst: TStrings);
var S: String;
begin
  with DMServ do
  begin
    S := Elem_PersonQry.DB.FieldByName('FULLNAME').asString;
    with PersonQryOCCUPATION do if Value <> '' then S := S + ', ' + Value;
    with PersonTableVCARDNO do if Value > 0 then S := S + #9'(' + AsString + ')';
    Lst.Add(S);
    S := Elem_COMPANYQRY.DB.FieldByName('NAME').AsString;
    with  Elem_COMPANYQRY.DB.FieldByName('COMPKIND') do if Value <> '' then S := S + ', ' + Value;
    Lst.Add(#9 + S);
    if Elem_PersonQry.DB.FieldByName('PHONE1').asString <> '' then
      Lst.Add(#9 + WorkPhoneLabel.Caption + ': '#9 + Elem_PersonQry.DB.FieldByName('PHONE1').asString);

    if Elem_PersonQry.DB.FieldByName('PHONE2').asString <> '' then
      Lst.Add(#9#9'  '#9#9 + Elem_PersonQry.DB.FieldByName('PHONE2').asString);

    if Elem_PersonQry.DB.FieldByName('FAX').asString <> '' then
      Lst.Add(#9#9 + WorkFaxLabel.Caption + ': '#9#9 + Elem_PersonQry.DB.FieldByName('FAX').asString);

    if Elem_PersonQry.DB.FieldByName('MOBILPHONE').asString <> '' then
      Lst.Add(#9 + MobilPhone1Label.Caption + ': '#9 + Elem_PersonQry.DB.FieldByName('MOBILPHONE').asString);

    if Elem_PersonQry.DB.FieldByName('MOBILHONE').asString <> '' then
      Lst.Add(#9 + MobilPhone2Label.Caption + ': '#9 + Elem_PersonQry.DB.FieldByName('MOBILHONE').asString);

    if Elem_PersonQry.DB.FieldByName('HOMEPHONE').asString <> '' then
      Lst.Add(#9 + HomePhoneLabel.Caption + ': '#9 + Elem_PersonQry.DB.FieldByName('HOMEPHONE').asString);

    if Elem_PersonQry.DB.FieldByName('E_MAIL').asString <> '' then
      Lst.Add(#9 + PersonEmailLabel.Caption + ': '#9 + Elem_PersonQry.DB.FieldByName('E_MAIL').asString);

    Lst.Add(#9 + OfficeEmailLabel.Caption + ':'#9 + Elem_EmailQry.DB.FieldByName('EMAIL').asString);
    Lst.Add(#9 + OfficeWebSiteLabel.Caption + ':'#9 + Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString);
    Lst.Add('');
  end;
end;

procedure TCompanyBrowseForm.ChangeCompanyAddressFilter(Country, City: Integer);
{var Where: String;}
begin
(*  if (Country = 0) or (FCompanyCountry = 0) or (City <> FCompanyCity)
  then DMServ.UpdateCompanyQry(0, Country, City, TypeName);*)
  {begin
    if Country = 0 then Where := '' else
    begin
      if City = 0 then Where := ''
      else Where := Format(sCompSQLfc, [CitySelectComboBox.ItemId]);
      Where := Format(sCompSQLf, [Where]);
    end;
    with DMServ.CompanyQry do
      try
        DisableControls;
        Close;
        SQL.Text := Format(sCompSQL0, [Where]);
        Prepare;
        Open;
      finally
        EnableControls;
      end;
  end;}
end;

procedure TCompanyBrowseForm.ChangeCompanyIsInterpr;
//var Ent: Boolean;
begin
  {Ent := DMServ.CompanyQryISENTERPR.AsBoolean;
  DBClassCode.Enabled := Ent;
  ClassCodeLabel.Enabled := Ent;
  IdentCodeDBEdit.Enabled := not Ent;
  IdentCodeLabel.Enabled := not Ent;}
end;

procedure TCompanyBrowseForm.ChangeCompanyProfiles;
begin

  with DBAsTours do if Field.IsNull then Checked := False;
  with DBAsHotel do if Field.IsNull then Checked := False;
//  with DBIsHotel do if Field.IsNull then Checked := False;
  with DBAsDrive do if Field.IsNull then Checked := False;
  with DBAsTickt do if Field.IsNull then Checked := False;
  with DBAsVisas do if Field.IsNull then Checked := False;
  with DBAsExcrs do if Field.IsNull then Checked := False;
  with DBAsGuide do if Field.IsNull then Checked := False;
  with DBAsMusem do if Field.IsNull then Checked := False;
  with DBAsExtrm do if Field.IsNull then Checked := False;
  with DBAsFoods do if Field.IsNull then Checked := False;
  with DBAsRecre do if Field.IsNull then Checked := False;
  with DBAsMedic do if Field.IsNull then Checked := False;
  with DBAsInsur do if Field.IsNull then Checked := False;
  with DBAsScoll do if Field.IsNull then Checked := False;
  with DBAsEmpls do if Field.IsNull then Checked := False;
  with DBAsXhibt do if Field.IsNull then Checked := False;
  with DBAsAmbas do if Field.IsNull then Checked := False;
  with DBAsAPair do if Field.IsNull then Checked := False;
  with DBAsCommc do if Field.IsNull then Checked := False;
  with DBAsCmptr do if Field.IsNull then Checked := False;
  with DBAsStnry do if Field.IsNull then Checked := False;
  with DBAsFurnt do if Field.IsNull then Checked := False;
  with DBAsGoods do if Field.IsNull then Checked := False;
  with DBAsPetrl do if Field.IsNull then Checked := False;
  with DBAsMedia do if Field.IsNull then Checked := False;
  with DBAsReklm do if Field.IsNull then Checked := False;
  with DBAsLease do if Field.IsNull then Checked := False;
  with DBAsUrist do if Field.IsNull then Checked := False;
  with DBAsConsl do if Field.IsNull then Checked := False;
  with DBAsGuard do if Field.IsNull then Checked := False;
  with DBAsBanks do if Field.IsNull then Checked := False;
  with DBIsGovern do if Field.IsNull then Checked := False;
  with DBAsKomun do if Field.IsNull then Checked := False;
  with DBAsBuild do if Field.IsNull then Checked := False;
  with DBAsMastr do if Field.IsNull then Checked := False;
  with DBAsParsl do if Field.IsNull then Checked := False;
  with DBAsOther do if Field.IsNull then Checked := False;
  with DBAsParse do if Field.IsNull then Checked := False;
  with DBBus17 do if Field.IsNull then Checked := False;
  with DBAsNetAgent do if Field.IsNull then Checked := False;  
  with DBAsAuPair do if Field.IsNull then Checked := False;
  with DBHeadOff do if Field.IsNull then Checked := False; 
  DMServ.SetVisibleCheckBox(ProfileTabSheet);
  DBHeadOff.Visible := not DBAsNetAgent.Checked;
  DBAsNetAgent.Visible := not DBHeadOff.Checked;
end;

procedure TCompanyBrowseForm.ChangeOfficeLabel(Labl: TLabel; aQry: TIBQuery);
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const pLbl: array[0..4] of Pointer = (nil,
  @SCompBrLabelEMail, @SCompBrLabelWeb, @SCompBrLabelPhone, @SCompBrLabelFax);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
var PersCount: Integer;
begin
  with Labl do
  if aQry.Active and (Tag in [1..4]) then
    begin
      PersCount := aQry.RecordCount;
      Caption := LoadResString(pLbl[Tag]);
      if PersCount > 0 then Caption := Format('%s  (%d)', [Caption, PersCount]);
    end;
end;

procedure TCompanyBrowseForm.ChangeOfficeLabels;
begin
  UpdateAddressMemo;
  ChangeOfficeLabel(OfficeEmailLabel, DMServ.EmailQry);
  ChangeOfficeLabel(OfficeWebSiteLabel, DMServ.WebSiteQry);
  ChangeOfficeLabel(OfficePhonesLabel, DMServ.PhoneQry);
  ChangeOfficeLabel(OfficeFaxesLabel, DMServ.FaxQry);
end;

procedure TCompanyBrowseForm.ClearFax;
var
  Number: String;
  Id: Integer;
begin
  Elem_FaxQry.DBOpen;

  Number := GetPhoneNumber(
    Elem_FaxQry.DB.FieldByName('CNTRYCODE'), Elem_FaxQry.DB.FieldByName('AREACODE'),
    Elem_FaxQry.DB.FieldByName('PHONENO'), Elem_FaxQry.DB.FieldByName('EXTENTION'), True);

  Id := Elem_FaxQry.DB.FieldByName('PHONEID').asInteger;
  if WarningFmtDlgYC(SZTBrwsConfirmDelete, [Number]) then
  begin
    //if not Active then Open;
    if not Elem_FaxQry.DB.Locate('PHONEID', Id, []) then
      ErrorFmtDlg(SZTBrwsErrorRecordNotFound, [Number])
    else
    begin

      if not ((Elem_FaxQry.DBRecordCount < 2) or not Elem_FaxQry.DB.FieldByName('ISDEFFAX').AsBoolean ) then
      begin
        ErrorDlg(SServModErrorDeleteDefaultPhone);
        Exit;
      end;

      if Elem_FaxQry.DB.FieldByName('ISMOB').AsBoolean or
         Elem_FaxQry.DB.FieldByName('ISPHN').AsBoolean or
         Elem_FaxQry.DB.FieldByName('ISPGR').AsBoolean then
      begin
        Elem_FaxQry.DB.Edit;
        Elem_FaxQry.DB.FieldByName('ISFAX').AsBoolean := False;
        Elem_FaxQry.DB.Post;

        Elem_FaxQry.RequeryCurrentRecord;
        //UpdateQuery(FaxQry);
        Self.SyncronizeEdit(Id, False, 'where=compphones');
      end
      else
      Elem_FaxQry.DB.Delete;
      {if DataSetDeleteRecord( Elem_FaxQry.DB, Elem_FaxQry.DB, 'PHONEID', Number ) and
         ( Elem_COMPANYQRY.DB.FieldByName('ASAMBAS').AsBoolean ) then
        Self.SyncronizeDelete(Id, 'where=compphones'); }

      Elem_PhoneQry.Requery;
      Elem_PhoneQry.DB.Locate( 'PHONEID', Elem_FaxQry.DB.FieldByName('PHONEID').asInteger, [] );
    end;
  end;
end;

procedure TCompanyBrowseForm.ClearPhone;
var
  Number: String;
  Id: Integer;
begin
  with DMServ do
  begin
    Elem_PhoneQry.DBOpen;
    Number := GetPhoneNumber(PhoneQryCNTRYCODE,
      PhoneQryAREACODE, PhoneQryPHONENO, PhoneQryEXTENTION, True);
    Id := Elem_PhoneQry.DB.FieldByName('PHONEID').asInteger;

    if WarningFmtDlgYC(SZTBrwsConfirmDelete, [Number]) then
    begin

      if not Elem_PhoneQry.DB.Locate('PHONEID', Id, []) then
        ErrorFmtDlg(SZTBrwsErrorRecordNotFound, [Number])
      else begin
        if not ((PhoneQry.RecordCount < 2) or not PhoneQryISDEFPHN.AsBoolean) then
        begin
          ErrorDlg(SServModErrorDeleteDefaultPhone);
          Exit;
        end;


        if Elem_PhoneQry.DB.FieldByName('ISMOB').AsBoolean or
           Elem_PhoneQry.DB.FieldByName('ISFAX').AsBoolean or
           Elem_PhoneQry.DB.FieldByName('ISPGR').AsBoolean then
        begin
          Elem_PhoneQry.DB.Edit;
          Elem_PhoneQry.DB.FieldByName('ISPHN').AsBoolean:= False;
          Elem_PhoneQry.DB.Post;
          Elem_PhoneQry.RequeryCurrentRecord;

          Self.SyncronizeEdit(Id, False, 'where=compphones');
        end
        else
        if DataSetDeleteRecord(PhoneQry,  Elem_PhoneQry.DB, 'PHONEID', Number) and
          Elem_COMPANYQRY.DB.FieldByName('ASAMBAS').AsBoolean then
          Self.SyncronizeDelete(Id, 'where=compphones');
        Elem_FaxQry.DBOpen;
        FaxQry.Locate('PHONEID', Elem_PhoneQry.DB.FieldByName('PHONEID').asInteger, []);

      end;
    end;
  end;
end;

procedure TCompanyBrowseForm.EditAccountTable(ActionTag: Integer);
begin
  ExecuteCompAccountEditForm(DMServ.AccountQry, ActionTag);
end;

procedure TCompanyBrowseForm.EditCorrespondTable(ActionTag: Integer);
begin
  ExecuteCompCorrAccntEditForm(DMServ.CorrAccntQry, ActionTag);
end;

procedure TCompanyBrowseForm.EditContractTable(ActionTag: Integer);
begin
  if ContractEditBtn.Enabled then
    if ExecuteContractEditForm(DMServ.ContractQry, ActionTag, False, False)
    then UpdateContractQry;
end;

procedure TCompanyBrowseForm.EditOfficeTable(ActionTag: Integer);
var IsDef, IsHead, IsPost: Boolean;
begin
  with DMServ do
  begin
    //OpenDataSet(OfficeTable);
    Elem_OfficeQry.SaveMarkID;

    IsDef := Elem_OfficeQry.DB.Locate('COMPANYID;ISDEFAULT', VarArrayOf([ Elem_COMPANYQRY.GetValueId, 'T']), []);
    IsHead := Elem_OfficeQry.DB.Locate('COMPANYID;HEADOFFICE', VarArrayOf([ Elem_COMPANYQRY.GetValueId, 'T']), []);
    IsPost := Elem_OfficeQry.DB.Locate('COMPANYID;ITSMAILADDRESS', VarArrayOf([ Elem_COMPANYQRY.GetValueId, 'T']), []);

    //if (ActionTag <> remStateAppend) and not Elem_OfficeQry.DB.Locate('OFFICEID', Elem_OfficeQry.GetValueID , []) then Exit;
    if (ActionTag <> remStateAppend) then Elem_OfficeQry.GotoMarkID;
  end;

  with TAddressDlg.Create(Application) do
    try
      DataSrc.DataSet := Elem_OfficeQry.DB;
      MakeDefault := not IsDef;
      MakeHeadOffice := not IsHead;
      MakeMailOffice := not IsPost;
      PrivateAddress := Elem_COMPANYQRY.DB.FieldByName('ISPRIVATE').AsBoolean;

      if ShowRecord(ActionTag) then
      begin
        //UpdateQuery(DMServ.OfficeQry);
        //with DMServ do OfficeQry.Locate('OFFICEID', OfficeTableOFFICEID.Value, []);
        //Elem_OfficeQry.DBOpen;

        UpdateAddressMemo;
        if Elem_COMPANYQRY.DB.FieldByName('ASAMBAS').AsBoolean then
          Self.SyncronizeEdit( Elem_COMPANYQRY.DB.FieldByName('OFFICEID').Value, ActionTag = remStateAppend, 'where=compoffices');

        //if DMServ.CompanyTableASAMBAS.AsBoolean then
        //  Self.SyncronizeEdit( DMServ.OfficeTableOFFICEID.Value, ActionTag = remStateAppend, 'where=compoffices');
      end;
    finally
      Free;
    end;
end;

procedure TCompanyBrowseForm.EditPersonTable(ActionTag: Integer);
begin
  ExecutePersonClientEditForm(DMServ.PersonQry, DMServ.EmailQry, ActionTag);
end;

procedure TCompanyBrowseForm.EditEmailTable(ActionTag: Integer);
begin
  ExecuteEmailAddressEditFrm(
    DMServ.EmailQry, Elem_OfficeQry.DB.FieldByName('OFFICEID').asInteger, ActionTag = remStateAppend);
end;

procedure TCompanyBrowseForm.EditFaxTable(ActionTag: Integer);
begin

  //with DMServ do
    if ExecutePhoneNumberEditDlg( Elem_FaxQry.DB, Elem_FaxQry.DB, Elem_PhoneQry.DB, ActionTag) and
       Elem_COMPANYQRY.DB.FieldByName('ASAMBAS').AsBoolean then//CompanyTableASAMBAS.AsBoolean
      Self.SyncronizeEdit( Elem_FaxQry.DB.FieldByName('PHONEID').asInteger, ActionTag = remStateAppend, 'where=compphones' );
end;

procedure TCompanyBrowseForm.EditPhoneTable(ActionTag: Integer);
begin

  with DMServ do
    if ExecutePhoneNumberEditDlg( Elem_PhoneQry.DB, Elem_PhoneQry.DB, FaxQry, ActionTag)and
       Elem_COMPANYQRY.DB.FieldByName('ASAMBAS').AsBoolean then     //  and CompanyTableASAMBAS.AsBoolean
      Self.SyncronizeEdit( Elem_PhoneQry.DB.FieldByName('PHONEID').asInteger, ActionTag = remStateAppend, 'where=compphones' );
end;

procedure TCompanyBrowseForm.EditWebSiteTable(ActionTag: Integer);
begin
  with DMServ do
    if ExecuteWebSiteEditDlg(WebSiteQry, ActionTag)and Elem_COMPANYQRY.DB.FieldByName('ASAMBAS').AsBoolean then //  and CompanyTableASAMBAS.AsBoolean
      Self.SyncronizeEdit( Elem_WebSiteQry.DB.FieldByName('WEBSITEID').asInteger, ActionTag = remStateAppend, 'where=compwebsites' );
end;

procedure TCompanyBrowseForm.Export1c;
var DefAddress, HeadAddress, Director, BookKeeper, Contact, TaxState: String;
begin
  Create1cExchangeFile;
  Write1cExchangeHeader(cmdCreateFirm);
  with DMServ do
  begin
    if not OfficeQryISDEFAULT.AsBoolean then
      OfficeQry.Locate('ISDEFAULT', 'T', []);
    DefAddress :=
      GetOldAddressString(
        nil, OfficeQryADDRESS, OfficeQryHOUSE, OfficeQryTENEMENT,
        OfficeQryCITYKIND, OfficeQryCITY, OfficeQryTOWNSHIP, OfficeQryPROVINCE,
        OfficeQryZIPCODE, OfficeQryCOUNTRY);
    if OfficeQryHEADOFFICE.AsBoolean then
      HeadAddress := DefAddress
    else begin
      OfficeQry.Locate('HEADOFFICE', 'T', []);
      HeadAddress :=
        GetOldAddressString(
          nil, OfficeQryADDRESS, OfficeQryHOUSE, OfficeQryTENEMENT,
          OfficeQryCITYKIND, OfficeQryCITY, OfficeQryTOWNSHIP, OfficeQryPROVINCE,
          OfficeQryZIPCODE, OfficeQryCOUNTRY);
    end;
    Contact := Elem_PersonQry.DB.FieldByName('FULLNAME').asString;
    Director := FindEmployee( Elem_COMPANYQRY.GetValueId, 1); 
    BookKeeper := FindEmployee( Elem_COMPANYQRY.GetValueId, 2);
    TaxState := '';
    {    if not CompanyQryTAXPAYSTATEID.IsNull then
      with NameListTable do
      begin
        if not Active then Open;
        if Locate('NAMEID', CompanyQry.FieldByName('TAXPAYSTATEID').asInteger, []) then
          TaxState := Elem_NameListTable.DB.FieldByName('ITEMNAME').asString;
      end;}
    Write1cExchangeClientInfo( Elem_COMPANYQRY.GetValueIdStr,
      ExtractFirstCompanyName(Elem_COMPANYQRY.DB.FieldByName('NAME').asString), Elem_COMPANYQRY.DB.FieldByName('FULLNAME').asString ,
      DefAddress, HeadAddress,
      GetPhoneNumber(PhoneQryCNTRYCODE, PhoneQryAREACODE, PhoneQryPHONENO, nil),
      GetPhoneNumber(FaxQryCNTRYCODE, FaxQryAREACODE, FaxQryPHONENO, nil),
      Director, BookKeeper, Contact,

      Elem_COMPANYQRY.DB.FieldByName('IDENTCODE').Value, Elem_COMPANYQRY.DB.FieldByName('TAXPAYCODE').Value ,
      TaxState, Elem_COMPANYQRY.DB.FieldByName('TAXPAYREGNO').Value, '', Elem_AccountQry.DB.FieldByName('BANKNAME').asString, Elem_AccountQry.DB.FieldByName('BANKMFO').asString, Elem_AccountQry.DB.FieldByName('ACCOUNTNO').asString);
  end;
  Write1cExchangeFooter;
  Close1cExchangeFile;
end;

function TCompanyBrowseForm.GetFilterFields: String;
//var Sec, Trd: String;
begin
  {Result := sPriFlds[PrimarySelectComboBox.ItemIndex];
  Sec := sSecFlds[FCompanySecondary];
  Trd := sTrdFlds[ThirdSelectComboBox.ItemIndex];
  if Sec <> '' then
    Result := ChooseCaptionString(Result = '', Sec, Result + ';' + Sec);
  if Trd <> '' then
    Result := ChooseCaptionString(Result = '', Trd, Result + ';' + Trd);}
  //Result := sTrdFlds[ThirdSelectComboBox.ItemIndex];
  Result := sTrdFlds[ThirdSelectComboBox.ItemIndex];
end;

procedure TCompanyBrowseForm.LocateCompanyTable;
var
  Comp: Integer;
  Pri, Sec, Trd: String;
begin
 { Elem_CompanyQry.DBOpen;
  Comp :=  Elem_CompanyQry.GetValueId; //DMServ.CompanyTableCOMPANYID.Value;
  //UpdateQuery(DMServ.CompanyQry);
  if not DMServ.CompanyQry.Locate('COMPANYID', Comp, []) then
  begin
    Pri := sPriFlds[PrimarySelectComboBox.ItemIndex];
//    Sec := sSecFlds[FCompanySecondary];
    Sec := IfThen(FCompanySecondary < 0, EmptyStr, sSecFldsNew[FCompanySecondary]);
    Trd := sTrdFlds[ThirdSelectComboBox.ItemIndex];
    if (Pri <> '') and not Elem_CompanyQry.DB.FieldByName(Pri).AsBoolean //DMServ.CompanyTable.FieldByName(Pri).AsBoolean
    then  PrimarySelectComboBox.ItemIndex := 0;
    if (Sec <> '') and not Elem_CompanyQry.DB.FieldByName(Sec).AsBoolean//DMServ.CompanyTable.FieldByName(Sec).AsBoolean
    then SetSecondDefData;
    if (Trd <> '') and not Elem_CompanyQry.DB.FieldByName(Trd).AsBoolean//DMServ.CompanyTable.FieldByName(Trd).AsBoolean
    then ThirdSelectComboBox.ItemIndex := 0;

    SelectComboBoxClick(Self);

    if ( CompanyCountry > 0) and ((DMServ.OfficeTableCOMPANYID.Value <> Elem_CompanyQry.GetValueId ) or
       ( CompanyCountry <> DMServ.OfficeTableCOUNTRYID.Value ) )
    then begin                       
      CntrySelectComboBox.ItemIndex := 0;
      CntrySelectComboBoxClick(Self);
    end;

    if not DMServ.CompanyQry.Locate( 'COMPANYID', Comp, [] ) and (CompanyCity > 0) then
    begin
      CitySelectComboBox.ItemIndex := 0;
      CitySelectComboBoxClick(Self);
      DMServ.CompanyQry.Locate('COMPANYID', Comp, []);
    end;
  end; }
end;

function TCompanyBrowseForm.LocateOurselves: Boolean;
begin
  Result := Elem_CompanyQry.DB.Locate('COMPANYID', OptionSet.LocaleCompany, []);
end;

function TCompanyBrowseForm.MakeClientProps: Boolean;
{var
  InfoFrm: TForm;
  CompId, N: Integer;
  L, P: String;}
begin
  Result := False;
  {Result := ExecuteClientPropsDlg(DMServ.CompanyQry.FieldByName('COMPANYID').asInteger);
  Result := True;
  Screen.Cursor := crHourGlass;
  InfoFrm := SplashPromptForm(Application.Title, SEmplDataModSplashBoardSync);
  try
    if Assigned(InfoFrm) then InfoFrm.Show;
    with DMServ do
    try
      CompId := CompanyQry.FieldByName('COMPANYID').asInteger;
      L := CompanyQry.FieldByName('NAME').asString;
      N := Pos(#32, L);
      if N > 1 then L := Copy(L, 1, Pred(N));
      L := UkraineToEnglish(L) + IntToStr(CompId * 3 + 17);
      P := RandString(10, 16);
      BoardHTTP.Get(sPath + Format(sParams, [sAction, CompId, L, P]));
      Database.StartTransaction;
      try
        with WorkQuery do
        begin
          if Active then Close;
          SQL.Text := Format(sUpdSQL, [L, P, CompId]);
          Prepare;
          ExecSQL;
          Close;
        end;
        Database.Commit;
      except
        Database.Rollback;
        Result := False;
      end;
    except
      Result := False;
    end;
  finally
    if Assigned(InfoFrm) then InfoFrm.Free;
    Screen.Cursor := crDefault;
  end;}
end;

procedure TCompanyBrowseForm.NewCompanyTable(IsFiliya: Boolean = False);
var
  HeadCompId, CompId, CntryId: Integer;
  CompName, Fltr: String;
  AsEmbas: Boolean;
begin          
  if (ComboxStatusSelect.ItemIndex > 0) or (SecondaryTreeView2.FocusedNode <> nil) or (ThirdSelectComboBox.ItemIndex > 0) then
    Fltr := GetFilterFields else Fltr := '';
  HeadCompId := Elem_COMPANYQRY.GetValueId;// DMServ.CompanyQry.FieldByName('COMPANYID').asInteger;

  with DMServ do
  if CompanyEditForm.NewCompany(Fltr, IsFiliya) then
  begin
    CompId := Elem_COMPANYQRY.GetValueId; //CompanyTableCOMPANYID.Value;
    CompName := Elem_COMPANYQRY.DB.fieldByName('NAME').Value; //CompanyTableNAME.Value;
    AsEmbas := Elem_COMPANYQRY.DB.fieldByName('ASAMBAS').AsBoolean;//DMServ.CompanyTableASAMBAS.AsBoolean;
    CntryId := CompanyCountry;
//    if IsFiliya then
    if not Elem_COMPANYQRY.DB.FieldByName('ASNETAGENT').AsBoolean and Elem_COMPANYQRY.DB.FieldByName('ASTOURS').AsBoolean then
    //if not CompanyTableASNETAGENT.AsBoolean and CompanyTableASTOURS.AsBoolean then
      SaveNote(EmptyStr, sDictPartnerAllFullData, ContractTypeNote, CompId, nObdzvinNone, 0);
    
    if IsFiliya then
    begin
      AddHeadOfficeAddress(HeadCompId, CompId);
      AddBankAccount(HeadCompId, CompId);
    end;
   // else
    //if (CntryId > 0) and ConfirmFmtDlgYN( SCompBrConfirmFillAddressCountry, [CompName, CntrySelectComboBox.Text] ) then
    //  ComplCountryAnCity(CompId, CntryId, CompName);

    //LocateCompanyTable;

    if Elem_COMPANYQRY.DB.FieldByName('ASNETAGENT').AsBoolean  and not Elem_COMPANYQRY.DB.FieldByName('PEYMTOAGENCY').AsBoolean then
      AddCompanyNote(Format(sDictSubContractSuspend, [ Elem_COMPANYQRY.DB.FieldByName('HEADOFFICENAME').asString ]), ContractTypeNote, nContractSuspend, CompId, 0);
    
    if AsEmbas then SyncronizeEdit(CompId, True, 'where=companies');
  end;
end;

procedure TCompanyBrowseForm.PrepareProfiles(AddTour, AddWork: Boolean);
var I: Integer;
  ParentItem: TTreeNode; 
  ParentItemNew: TcxTreeListNode;
begin
  with SecondaryTreeView2 do
  begin
    Clear;  
    ParentItemNew := Root.AddChild;                 
    ParentItemNew.Texts[0] := SCompBrAsAll;
    if AddTour then
    begin
      ParentItemNew := Root.AddChild; 
      ParentItemNew.Texts[0] := SCompBrAsTourism;
      for I := 0 to nSecCount do ParentItemNew.AddChild.Texts[0] := LoadResString(pTourNew[I]);      
    end;
    if AddWork then 
    begin
      ParentItemNew := Root.AddChild; 
      ParentItemNew.Texts[0] := SCompBrAsFarm;
      for I := 0 to nSecCount - 1 do ParentItemNew.AddChild.Texts[0] := LoadResString(pWorkNew[I]);      
    end;
  end;
end;

procedure TCompanyBrowseForm.RefreshBankAccount;
begin
  if AccountDataSource.DataSet.Active then
  try
    with DBBankName do Text := Field.AsString;
    with DBBankMFO do Text := Field.AsString;
    with DBBankSWIFT do Text := Field.AsString;
    with DBBankAddress do Text := Field.AsString;
    with DBAccount1 do Text := Field.AsString;
    with DBAccount2 do Text := Field.AsString;
//    with TemplVerDBText do Text := Field.AsString;
//    with CreatorDBText do Text := Field.AsString;
//    with SenderDBText do Text := Field.AsString;
//    with CopyRecverDBText do Text := Field.AsString;
//    with OrigRecverDBText do Text := Field.AsString;
  except
  end;
end;

procedure TCompanyBrowseForm.RefreshContract;
var 
  TempDay: Real;
begin
  if ContractDataSource.DataSet.Active then
  begin
    with DMServ, ActionContractBtn do
    try
      Action := nil;
      Glyph.Assign(Nil);
      if ContractQryISRCVORIG.IsNull
      then if not ContractQryISSENDORIG.IsNull then Action := ContractSelAction// ContractRcvOrAction
      else if not ContractQryISSIGN.IsNull then Action := ContractSendAction
      else if not ContractQryISPRINTED.IsNull then Action := ContractSignAction
      else Action := ContractPrintAction;
      Visible := Assigned(Action);

    except
    end;            
    with DMServ, ContractSendDocBtn do
    try
      Action := nil;
      Glyph.Assign(nil);
      with ContractQryRCVCOPYDATE do
      if not IsNull 
      then TempDay := Int(Value + nMaxPermDay - Date);

      if ContractQryISRCVORIG.IsNull
      then if not ContractQryISEXTEND.IsNull then Action := ContractTempDaysAction
      else if not ContractQryISRCVCOPY.IsNull and (TempDay > 0) 
      then Action := ContractTempDaysAction
      else if not ContractQryISRCVCOPY.IsNull then Action := ContractExtendAction
      else if not ContractQryISSEND.IsNull then Action := ContractRcvCopyAction
      else Action := ContractSendMailAction;
      if Assigned(Action) and (Action.Tag in [0, 12]) 
      then Action.Execute;
      Visible := Assigned(Action);
    except
    end;                
  end 
end;           

procedure TCompanyBrowseForm.RefreshCorrAccount;
begin
  if CorrAccntDataSource.DataSet.Active then
  try
    with DBCorrCurency do Text := Field.AsString;
    with DBCorrName do Text := Field.AsString;
    with DBCorrAddress do Text := Field.AsString;
    with DBCorrSWIFT do Text := Field.AsString;
    with DBCorrAccount do Text := Field.AsString;
  except
  end;
end;

procedure TCompanyBrowseForm.SetCompanyCity(const Value: Integer);
var Id: Integer;
begin
 { Id := DMServ.CompanyQry.FieldByName('COMPANYID').asInteger;
  if Value <> FCompanyCity then
  begin                                
    with CitySelectComboBox do if Enabled then
      DMServ.CompCityQry.Locate('CITYID', ItemId, []);
    ChangeCompanyAddressFilter(FCompanyCountry, Value);
    FCompanyCity := Value;
  end;
  if Id <> 0 then DMServ.CompanyQry.Locate('COMPANYID', Id, []);  }
end;

procedure TCompanyBrowseForm.SetCompanyCountry(const Value: Integer);
var Id: Integer;
begin
 { Id := DMServ.CompanyQry.FieldByName('COMPANYID').asInteger;
  if Value <> FCompanyCountry then
  begin
    with CntrySelectComboBox do
      DMServ.CompCntryQry.Locate('COUNTRYID', ItemId, []);
    if CitySelectComboBox.Enabled then UpdateCompanyCities;
    ChangeCompanyAddressFilter(Value, FCompanyCity);
    FCompanyCountry := Value;
  end;
  if Id <> 0 then DMServ.CompanyQry.Locate('COMPANYID', Id, []); }
end;

procedure TCompanyBrowseForm.UpdateCompanyCities;
begin
 { with CitySelectComboBox do
  begin
    UpdateQuery(DMServ.CompCityQry);
    DataFieldToStrings(
      DMServ.CompCityQryCalcCity, DMServ.CompCityQryCITYID, Items);
    Items.Insert(0, SCompBrAllCities);
    ItemIndex := 0;
    CitySelectComboBoxClick(Self);
  end;   }
end;

procedure TCompanyBrowseForm.UpdateCompanyCountries;
var Index, CompId: Integer;
begin
{  with CntrySelectComboBox do
  begin
    Index := ItemIndex;
    DataFieldToStrings(SelCompCntryQryNAME, SelCompCntryQryCOUNTRYID, Items);
    Items.Insert(0, SCompBrAllCountries);
    if Index < 0 then ItemIndex := 0 else ItemIndex := Index;
    CntrySelectComboBoxClick(Self);
  end; }
end;

procedure TCompanyBrowseForm.AddTitleList(Lst: TStrings);
begin
  if DataSrc.DataSet = DMServ.PersonQry then AddPersonTitleList(Lst)
  else AddCompanyTitleList(Lst);
end;

procedure TCompanyBrowseForm.AddToList(Lst: TStrings);
begin
  if DataSrc.DataSet = DMServ.PersonQry then AddPersonToList(Lst)
  else AddCompanyToList(Lst);
end;

procedure TCompanyBrowseForm.AddToListing(Lst: TStrings);
begin
  if DataSrc.DataSet = DMServ.PersonQry then AddPersonToListing(Lst)
  else AddCompanyToListing(Lst);
end;

function TCompanyBrowseForm.CanAccessEdit: Boolean;
begin
  Result := (DataSrc.DataSet <> DMServ.CorrAccntQry) and inherited CanAccessEdit;
    {CanAccessView
    and GetUspLevelPerm(DMServ.CurManagerPerms[uspDictCompany], uspLevelEdit);}
end;

function TCompanyBrowseForm.CanAccessPrnt: Boolean;
begin
  Result := inherited CanAccessPrnt;
    {CanAccessEdit
    and GetUspLevelPerm(DMServ.CurManagerPerms[uspDictCompany], uspLevelPrint);}
end;

function TCompanyBrowseForm.DataSetCanDelete(DSet: TDataSet): Boolean;
begin
  Result := (DSet = Elem_COMPANYQRY.DB ) and Elem_COMPANYQRY.DB.FieldByName('ISHOTEL').AsBoolean;
end;

function TCompanyBrowseForm.ShowEditor(EditState: Integer): Boolean;
var Id, CompanyId: Integer;
  AsTours, AllDataFilled, OldAllDataFilled, IsNotWork: Boolean;
begin
  with DMServ do
  begin
    CompanyId := Elem_COMPANYQRY.GetValueId;
    AsTours := Elem_COMPANYQRY.DB.FieldByName('ASTOURS').AsBoolean;
    IsNotWork :=  Elem_COMPANYQRY.DB.FieldByName('NotWork').AsBoolean;
    OldAllDataFilled := not  Elem_COMPANYQRY.DB.FieldByName('ORGFORMID').IsNull
      and (not Elem_COMPANYQRY.DB.FieldByName('ISENTERPR').IsNull or not Elem_COMPANYQRY.DB.FieldByName('ACTIONID').IsNull )
      and not Elem_COMPANYQRY.DB.FieldByName('GOVREESTRTYPEID').IsNull and not Elem_COMPANYQRY.DB.FieldByName('IDENTCODE').IsNull
      and not Elem_COMPANYQRY.DB.FieldByName('GOVREESTRDATE').IsNull and not Elem_COMPANYQRY.DB.FieldByName('TAXPAYSTATEID').IsNull ;

  end;
  try
    Result := Assigned(EditForm) and EditForm.ShowRecord(EditState);
    if Result then
      DMServIB.MergeClientTo1C( Elem_COMPANYQRY.GetValueId );
  finally
  end;
  //ApplyCashedUpdates(Result);
  if Result then
    with DMServ do
    begin
      AllDataFilled := not Elem_CompanyQry.DB.FieldByName('ORGFORMID').IsNull
      and (not Elem_CompanyQry.DB.FieldByName('ISENTERPR').IsNull or not Elem_CompanyQry.DB.FieldByName('ACTIONID').IsNull)
      and not Elem_CompanyQry.DB.FieldByName('GOVREESTRTYPEID').IsNull and not Elem_CompanyQry.DB.FieldByName('IDENTCODE').IsNull
      and not Elem_CompanyQry.DB.FieldByName('GOVREESTRDATE').IsNull {and not Elem_CompanyQry.DB.FieldByName('CalcTaxPayStateId').IsNull};

      if not Elem_CompanyQry.DB.FieldByName('ASNETAGENT').AsBoolean and Elem_CompanyQry.DB.FieldByName('ASTOURS').AsBoolean
        and not OldAllDataFilled and AllDataFilled
        and not IsNotWork and not  Elem_CompanyQry.DB.FieldByName('NOTWORK').AsBoolean then
      SaveNote( EmptyStr, sDictPartnerAllFullData, ContractTypeNote, CompanyId, nObdzvinNone, 0 );

      {AllDataFilled := not CompanyTableORGFORMID.IsNull
        and (not CompanyTableISENTERPR.IsNull or not CompanyTableACTIONID.IsNull)
        and not CompanyTableGOVREESTRTYPEID.IsNull and not CompanyTableIDENTCODE.IsNull
        and not CompanyTableGOVREESTRDATE.IsNull and not CompanyTableCalcTaxPayStateId.IsNull;
      
      if not CompanyTableASNETAGENT.AsBoolean and CompanyTableASTOURS.AsBoolean
        and not OldAllDataFilled and AllDataFilled
        and not IsNotWork and not CompanyTableNOTWORK.AsBoolean
      then SaveNote(EmptyStr, sDictPartnerAllFullData, ContractTypeNote, CompanyId, nObdzvinNone, 0); }

//      if EditState = remStateAppend then begin  
        Id := Elem_CompanyQry.GetValueId; //CompanyTableCOMPANYID.Value;
        //UpdateQuery(CompanyQry);
        //CompanyQry.Locate('COMPANYID', Id, []);

       if Elem_CompanyQry.DB.FieldByName('ASAMBAS').AsBoolean then
      //if CompanyTableASAMBAS.AsBoolean then
        Self.SyncronizeEdit(Id, EditState = remStateAppend, 'where=companies')
      else Self.SyncronizeDelete(Id, 'where=companies');
    end;
end;

procedure TCompanyBrowseForm.UpdateAddressMemo;
var CityFld, CntryFld: TField;
begin
  with DMServ do
  begin
    if OfficeQryLATNAME.AsBoolean then 
    begin
      CityFld := OfficeQryCITY_ENG;
      CntryFld := OfficeQryCOUNTRY_ENG
    end else 
    begin
    CityFld := OfficeQryCITY;
    CntryFld := OfficeQryCOUNTRY;
    end;
    GetOfficeAddress(AddressMemo.Lines, OfficeQrySTRKIND, OfficeQryADDRESS,
      OfficeQryHOUSE, OfficeQryTENEMENT, OfficeQryCITYKIND, CityFld,
      OfficeQryTOWNSHIP, OfficeQryPROVINCE, OfficeQryZIPCODE, CntryFld);
    with OfficeQryOFFICENAME do if Value <> '' then
      AddressMemo.Lines.Insert(0, Value);
  end;
  AddressMemo.SelStart := 0;
  MainAddressLabel.Visible := DMServ.OfficeQryISDEFAULT.AsBoolean;
  HeadOfficeLabel.Visible := DMServ.OfficeQryHEADOFFICE.AsBoolean;
  MailAddressLabel.Visible := DMServ.OfficeQryITSMAILADDRESS.AsBoolean;
  //EmailDBGrid.Refresh;  // refresh IsDefault value for current office
end;

procedure TCompanyBrowseForm.UpdateDataSets;
begin
  inherited;
  UpdateCompanyCountries;
end;

procedure TCompanyBrowseForm.UpdateToolButtons;
var
  Lev, I: Integer;
  Off, Acc, Corr, Pers, Cntr: Boolean;
  OffCount, AccCount, CorrCount, 
  PersCount: Integer;
  AreWeb, AtiveCntrct, SetSecondaryFilter: Boolean;
//  SelectedItem: TTreeNode;
  SelectedItem: TcxTreeListNode;
begin
  inherited;
  if DataSrc.DataSet = DMServ.OfficeQry then
  begin
    DMServ.OfficeQry.FetchAll;

    with RecordAppendAction do
      Enabled := Enabled and
      (not DMServ.OfficeQryCOUNTRY.IsNull or not DMServ.OfficeQryCITY.IsNull);
    with RecordDeleteAction do
      Enabled := Enabled and (DMServ.OfficeQry.RecordCount > 1);
  end else if (DataSrc.DataSet = DMServ.AccountQry)
    or (DataSrc.DataSet = DMServ.EmailQry)
    or (DataSrc.DataSet = DMServ.WebSiteQry)
  then RecordDeleteAction.Enabled := DMServ.CurManager > 0;    

  Lev := DMServ.CurManagerPerms[uspDictCompany];
  ExportAddressAction.Enabled := GetUspLevelPerm(Lev, uspLevelKeeper);
  ClientPropsAction.Enabled := CanAccessAdmn;
  CmbxManager.Enabled := CanAccessEdit;//GetUspCanAdmin(Lev);
  CmbxCategory.Enabled := CanAccessEdit;
  SubCategoryComboBox.Enabled := CanAccessEdit and (CmbxCategory.EditValue > nOrderCategory);
  //FilterToolBtn.Enabled := CanAccessEdit;
  AllTimeCheckBox.Enabled := CanAccessEdit;
  NoteAddAction.Enabled := CanAccessEdit;
  CopyMenuItem.Enabled := CanAccessEdit;
  if DMServ.ContractQry.Active then
  begin
    with DMServ.ContractQryTILLDATE do
    AtiveCntrct := IsNull or (Value > Date);

    DMServ.ContractQry.FetchAll;
    Cntr := DMServ.ContractQry.RecordCount > 0;
    ContractOpenDocBtn.Enabled := not DMServ.ContractQryFILENAME.IsNull
      and CanAccessEdit;
    ContractOpenDocBtn.Visible := Cntr;
    ContractEditBtn.Visible := Cntr;

    ContractAddNewBtn.Enabled := (not Elem_COMPANYQRY.DB.FieldByName('ASNETAGENT').AsBoolean or Elem_COMPANYQRY.DB.FieldByName('PEYMTOAGENCY').AsBoolean ) and CanAccessEdit;
    ContractSendDocBtn.Visible := Cntr and Elem_ContractQry.DB.FieldByName('INVALID').ISNull and AtiveCntrct;
    ActionContractBtn.Visible := Cntr and Elem_ContractQry.DB.FieldByName('INVALID').ISNull and AtiveCntrct;
    ContractAgentAction.Enabled := CanAccessEdit;
    UpdateContractBtn(CanAccessEdit);
  end;
  AddressEditBtn.Enabled := CanAccessEdit;
  if Active then MailUpBtn.Enabled := Elem_EmailQry.DBRecordCount > 0;

  if Active then WebSiteBtn.Enabled := Elem_WebSiteQry.DBRecordCount > 0;

  if Active then DialUpBtn.Enabled := Elem_PhoneQry.DBRecordCount > 0;

  if Active then FaxUpBtn.Enabled := Elem_FaxQry.DBRecordCount > 0;

  if Active then AddressPrintBtn.Enabled := Elem_OfficeQry.DBRecordCount > 0;

  if Active then WordUpBtn.Enabled := Elem_PersonQry.DBRecordCount > 0;

  DialUpBtn1.Enabled := Trim(PhoneDBEdit.Text) <> EmptyStr;
  DialUpBtn2.Enabled := Trim(Phone2DBEdit.Text) <> EmptyStr;
  DialUpBtn3.Enabled := Trim(MobilPhone1DBEdit.Text) <> EmptyStr;
  DialUpBtn4.Enabled := Trim(MobilPhone2DBEdit.Text) <> EmptyStr;
  DialUpBtn5.Enabled := Trim(HomePhoneDBEdit.Text) <> EmptyStr;
  FaxUpBtn1.Enabled := Trim(FaxDBEdit.Text) <> EmptyStr;
  MailUpBtn1.Enabled := Trim(EmailDBEdit.Text) <> EmptyStr;
  WorkIcqBtn.Enabled := Trim(WorkIcqDBEdit.Text) <> EmptyStr;
  HomeIcqBtn.Enabled := Trim(HomeIcqDBEdit.Text) <> EmptyStr;
  WorkSkypeBtn.Enabled := Trim(WorkSkypeDBEdit.Text) <> EmptyStr;
  HomeSkypeBtn.Enabled := Trim(HomeSkypeDBEdit.Text) <> EmptyStr;  
  with DMServ do
  begin
    with Elem_OfficeQry do if DB.Active then OffCount :=  DBRecordCount;
    with Elem_PersonQry do if DB.Active then PersCount := DBRecordCount;

    Off := OffCount > 1;
    Pers := PersCount > 1;
    PrevOfficeBtn.Enabled := Off and (FOffRecNo > 1);
    NextOfficeBtn.Enabled := Off and (FOffRecNo < OffCount);
    PrevPersonBtn.Enabled := Pers and (FPersRecNo > 1);
    NextPersonBtn.Enabled := Pers and (FPersRecNo < PersCount);
    with OfficeCountLabel do
    if OffCount = 0 then Caption := EmptyStr
    else Caption := Format('%d/%d', [FOffRecNo, OffCount]);
    MaillistAction.Enabled := CanAccessAdmn;
    if AccountQry.Active then
    begin
      AccountQry.FetchAll;
      AccCount := AccountQry.RecordCount;

      CorrAccntQry.FetchAll;
      CorrCount := CorrAccntQry.RecordCount;
      Acc := AccCount > 1;
      Corr := CorrCount > 1;
      PrevAccountBtn.Enabled := Acc and (FAccRecNo > 1);
      NextAccountBtn.Enabled := Acc and (FAccRecNo < AccCount);
      PrevForeignBtn.Enabled := Corr and (FCorrRecNo > 1);
      NextForeignBtn.Enabled := Corr and (FCorrRecNo < CorrCount); 
      with BankCountLabel do
      if AccCount = 0 then Caption := EmptyStr
      else Caption := Format('%d/%d', [FAccRecNo, AccCount]);
      with AccCountLabel do
      if CorrCount = 0 then Caption := EmptyStr
      else Caption := Format('%d/%d', [FCorrRecNo, CorrCount]);
    end;
                   
    //    act_review.Enabled := CanAccessAdmn;
    with TourExpAction do
    begin
      AreWeb := Elem_COMPANYQRY.DB.FieldByName('AREWEB').AsBoolean;
      Enabled := Elem_COMPANYQRY.DB.Active and CanAccessEdit and ( Elem_COMPANYQRY.DB.FieldByName('ASTOURS').AsBoolean or Elem_COMPANYQRY.DB.FieldByName('ASAPAIR').AsBoolean ) and AreWeb;
      if AreWeb then Hint := 'Зареєструвати дзвінок по експорту турів'  
      else Hint := 'В партнера відсутній сайт.';
    end;


    with Elem_COMPANYQRY.DB.FieldByName('AREAGENTCONTRACT') do
    PromiseAction.Enabled := not AsBoolean or (AsBoolean and not Elem_COMPANYQRY.DB.FieldByName('TILLDATE').IsNull and (Elem_COMPANYQRY.DB.FieldByName('DOCTODATE').Value <> Elem_COMPANYQRY.DB.FieldByName('TILLDATE').Value));
    ReestrFormBtn.Enabled :=  Elem_COMPANYQRY.DB.Active and CanAccessEdit;
    //Export1cAction.Enabled := CompanyQry.Active and CanAccessAdmn;

    NoteAddAction.Enabled :=  Elem_COMPANYQRY.DB.Active and CanAccessEdit;
    AddFiliyaAction.Visible :=  Elem_COMPANYQRY.DB.FieldByName('ISENTERPR').AsBoolean and not Elem_COMPANYQRY.DB.FieldByName('ISFILIYA').AsBoolean and DBGrid.Focused;
  end;            

  SelectedItem := SecondaryTreeView2.FocusedNode;
  SetSecondaryFilter := False;
  if SelectedItem <> nil then SetSecondaryFilter := SelectedItem.Parent.Index > 0;
  FilterOffAction.Enabled := (CmbxManager.EditValue<>null)
    or (CmbxCategory.EditValue > 0) or (ComboxStatusSelect.ItemIndex > 0)
    or SetSecondaryFilter
    or (ThirdSelectComboBox.ItemIndex > 0) or (CmbxCompanyCity.EditValue <> null);
  //FilterToolBtn.Enabled := FChangeCategotyFilter;
  //ClearSearchCompany.Enabled := Trim(EdiFindCmpanyByName.Text) <> EmptyStr;
  UpdateGridDrop(PageControl.ActivePage);
end;

procedure TCompanyBrowseForm.ViewCompanyCOMPANYNAMEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var IndName:Integer;
    IndTradeName:Integer;
    VarStr1:WideString;
    VarStr2:WideString;
    Separ:String;
begin
   IndName  := TcxGridDBTableView( Sender.GridView ).GetColumnByFieldName('NAME').Index;
   IndTradeName  := TcxGridDBTableView( Sender.GridView ).GetColumnByFieldName('TRADENAME').Index;

   VarStr1 :=Trim( ARecord.DisplayTexts[IndName]);
   VarStr2 :=Trim( ARecord.DisplayTexts[IndTradeName]);
   if (VarStr1<>'')and(VarStr2<>'') then Separ:=' / '
   else Separ :='';

   if not TypeNameCheckBox.Checked then
     AText:=  VarStr1 + Separ + VarStr2
   else
     AText:=  VarStr2 + Separ + VarStr1;
end;


procedure TCompanyBrowseForm.FPrepareControls;
begin

  Elem_CountryCompQry.DBOpen;
  Elem_CityCompanyQry.DBOpen;

  Elem_UsersQry.SetExtLookupComboBoxListView(CmbxManager,'MANAGER',True,False,nil,'Всі');
  Elem_CountryCompQry.SetExtLookupComboBoxListView(CmbxCompanyCountry,'NAME',True,False,nil,'Всі країни');
  Elem_CityCompanyQry.SetExtLookupComboBoxListView(CmbxCompanyCity,'NAME',True,False,nil,'Всі міста');

  Elem_COMPANYQRY.View.OnDblClick  := RecordEditActionExecute;
  Elem_PersonQry.View.OnDblClick   := RecordEditActionExecute;
  Elem_ContractQry.View.OnDblClick := RecordEditActionExecute;
  Elem_LogQry.View.OnDblClick      := RecordEditActionExecute;
  Elem_CompNoteQry.View.OnDblClick := NotesDBGridDblClick;     
  Elem_OrderListQry.View.OnDblClick := OrderListGridDblClick;
  Elem_EMailQry.View.OnDblClick := RecordEditActionExecute;
  Elem_WebSiteQry.View.OnDblClick := RecordEditActionExecute;
  Elem_PhoneQry.View.OnDblClick := RecordEditActionExecute;
  Elem_FaxQry.View.OnDblClick := RecordEditActionExecute;

  Elem_COMPANYQRY.View.GetColumnByFieldName('NAME').OnGetDisplayText:= ViewCompanyCOMPANYNAMEGetDisplayText;
  Elem_COMPANYQRY.AddFocusedRecordChanged( ViewCompanyFocusedRecordChanged );

  DataSrc.DataSet := Elem_COMPANYQRY.DB;
end;


procedure TCompanyBrowseForm.ViewCompanyFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (Elem_CompanyDocsQry<> nil)and(Elem_CompanyDocsQry.DB.Active) then
    Elem_CompanyDocsQry.DB.Resync([]);

  PrepareEmailsPhoneFilter;
  PrepareCompCount;
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.FDestroyControls;
begin
  Elem_UsersQry.FreeExtLookupComboBoxListView( CmbxManager );
  Elem_CountryCompQry.FreeExtLookupComboBoxListView( CmbxCompanyCountry );
  Elem_CityCompanyQry.FreeExtLookupComboBoxListView( CmbxCompanyCity );

  Elem_PhoneQry.View. OnDblClick := nil;
  Elem_FaxQry.View.OnDblClick := nil;
end;

procedure TCompanyBrowseForm.FormCreate(Sender: TObject);
var LastItem: Integer;
    aProgres:TProgressFormProp;
    i:integer;
begin

  try
    aProgres := ShowProgress( WaitFormCaption , -1 );
    Application.ProcessMessages;

    //TIBQuery( Elem_COMPANYQRY.DB ).FetchAll;

    Elem_OfficeQry.DBOpen;

    FPrepareControls;

    with DMServ do
    begin
      PageControl.TabIndex := 0;
      PrepareProfiles(True, True);
      UpdateCompanyCountries;

      LastItem := OptionSet.LastPriFilterDictCompany;
      if LastItem < 0 then LastItem := 0;
      ComboxStatusSelect.ItemIndex := LastItem;
      SetSecondDefData(True);
      LastItem := OptionSet.LastThirdFilterDictCompany;
      if LastItem < 0 then LastItem := 0;
      ThirdSelectComboBox.ItemIndex := LastItem;
      LastItem := OptionSet.LastCntryFilterDictCompany;
      if LastItem < 0 then LastItem := 0;
      //CntrySelectComboBox.ItemIndex := LastItem;
      SelectComboBoxClick(Self);

      Elem_PersonQry.DBOpen;
      Elem_OfficeQry.DBOpen;
      Elem_PhoneQry.DBOpen;
      Elem_FaxQry.DBOpen;
      Elem_EmailQry.DBOpen;
      Elem_WebSiteQry.DBOpen;
    end;

    inherited;

    Application.OnIdle := ApplicationIdle;
    FCompanyCountry := 0;
    FCompanyCity := 0;
    FCompanyPrimary := 0;
    FCompanySecondary := -1;
    FOrderByColumn := EmptyStr;
    EditForm := CompanyEditForm;
    DetailBrowseKey := Elem_COMPANYQRY.DB.FieldByName(Elem_COMPANYQRY.FieldKod);
    DetailEditKey := Elem_COMPANYQRY.DB.FieldByName(Elem_COMPANYQRY.FieldKod);
    DetailSearchHint := 'Company';  
    FCategoryComboBoxChange := False;
    FChangeCategotyFilter := False;
    FItsShortMenu := False;

    CmbxCategory.EditValue := nAllCategory;
    FOnClick := True;
    FImage := TJPEGImage.Create;

  finally
    ClosedProgress(aProgres.FormProgres);
  end;
end;

procedure TCompanyBrowseForm.DataSrcDataChange(Sender: TObject; Field: TField);
begin
  with DataSrc do
    if ( DataSet = Elem_COMPANYQRY.DB ) then  
    begin
      if PageControl.ActivePage = OfficeTabSheet then ChangeOfficeLabels
      else if PageControl.ActivePage = ProfileTabSheet then ChangeCompanyProfiles
      else if PageControl.ActivePage = AccountTabSheet then ChangeCompanyIsInterpr;
    end
    //else if DataSet = DMServ.OfficeQry then UpdateAddressMemo
    else if DataSet = DMServ.EmailQry then
      ChangeOfficeLabel(OfficeEmailLabel, DMServ.EmailQry)
    else if DataSet = DMServ.WebSiteQry then
      ChangeOfficeLabel(OfficeWebSiteLabel, DMServ.WebSiteQry)
    else if DataSet = DMServ.PhoneQry then
      ChangeOfficeLabel(OfficePhonesLabel, DMServ.PhoneQry)
    else if DataSet = DMServ.FaxQry then
      ChangeOfficeLabel(OfficeFaxesLabel, DMServ.FaxQry);
  inherited;
end;

procedure TCompanyBrowseForm.RecordEditActionExecute(Sender: TObject);
var T: Integer;
begin
  DBGridEnter( Sender );
  
  if  sender is TcxGridSite then
    if TcxGridSite(sender).GridView is TcxGridDBTableView then
      if  TcxGridDBTableView(TcxGridSite(sender).GridView).DataController.RowCount = 0 then Exit;
  
  T := (Sender as TComponent).Tag;

  with DataSrc do
  begin
    if DataSet = Elem_COMPANYQRY.DB then
    begin
        //Elem_COMPANYQRY.RequeryCurrentRecord( 'select COMPANIES.* from SEL_COMPANIES_PROC(0) COMPANIES where COMPANIES.COMPANYID=:COMPANYID') ;
      try
        Elem_COMPANYQRY.View.BeginUpdate;

        Elem_COMPANYQRY.RequeryCurrentRecord;
        if T = remStateAppend then NewCompanyTable
        else
        inherited

        RecordEditActionExecute(Sender);
        ActiveControl := GridCompany;
        Elem_COMPANYQRY.RequeryCurrentRecord;
     finally
        Elem_COMPANYQRY.View.EndUpdate;
        Elem_COMPANYQRY.SetFocusOnView;
     end;
     Abort;
    end
    else
    if DataSet = DMServ.PersonQry then
    begin
      if (  Elem_COMPANYQRY.GetValueId = OptionSet.LocaleCompany) and (T <> 0) then
        ErrorFmtDlg(SCompBrErrorAddYourSelfPerson, [ Elem_COMPANYQRY.DB.FieldByName('NAME').AsString ])
      else
        EditPersonTable(T);

      ActiveControl := GridPerson;
    end
    else if DataSet = DMServ.OfficeQry then EditOfficeTable(T)
    else if DataSet = DMServ.PhoneQry then EditPhoneTable(T)
    else if DataSet = DMServ.FaxQry then EditFaxTable(T)
    else if DataSet = DMServ.EmailQry then EditEmailTable(T)
    else if DataSet = DMServ.WebSiteQry then EditWebSiteTable(T)
    else if DataSet = DMServ.AccountQry then EditAccountTable(T)
    else if DataSet = DMServ.CorrAccntQry then EditCorrespondTable(T)
    else if DataSet = DMServ.ContractQry then EditContractTable(T);
  end;
end;

procedure TCompanyBrowseForm.RecordDeleteActionExecute(Sender: TObject);
var
  Id: Integer;
  EntKind: String;
begin
  with DMServ do
    if (DataSrc.DataSet = Elem_COMPANYQRY.DB)   then
    begin
      Id := Elem_COMPANYQRY.GetValueId;
      if CheckCompanyAsEnterprise(Id, EntKind) then
        ErrorFmtDlg(SCompBrErrorDeleteEnterprise, [EntKind])
      else
      //if DeleteDataSetRecord( CompanyQry, CompanyTable, 'COMPANYID', CompanyQry.FieldByName('NAME').asString)
      //then Self.SyncronizeDelete(Id, 'where=companies');
      if DeleteDataSetRecord( Elem_COMPANYQRY.DB, Elem_COMPANYQRY.DB, 'COMPANYID', Elem_COMPANYQRY.DB.FieldByName('NAME').AsString ) then   
        Self.SyncronizeDelete(Id, 'where=companies');
    end
    else
    if DataSrc.DataSet = OfficeQry then
    begin
      Id := Elem_OfficeQry.DB.FieldByName('OFFICEID').asInteger;
      if DeleteDataSetRecord( OfficeQry, Elem_OfficeQry.DB, 'OFFICEID', SCompBrTitleOffice) and Elem_COMPANYQRY.DB.FieldByName('ASAMBAS').AsBoolean then  //CompanyTableASAMBAS.AsBoolean
        Self.SyncronizeDelete(Id, 'where=compoffices');
    end
    else
    if DataSrc.DataSet = PersonQry then
      DeleteDataSetRecord( PersonQry, PersonTable, 'PERSONID', Elem_PersonQry.DB.FieldByName('FULLNAME').asString )
    else
    if DataSrc.DataSet = AccountQry then
      DeleteDataSetRecord( AccountQry, CompAccountTable, 'ACCOUNTID', SCompBrTitleBankAccnt )
    else
    if DataSrc.DataSet = CorrAccntQry then
      DeleteDataSetRecord( CorrAccntQry, CompCorrAccntTable, 'ACCOUNTID', SCompBrTitleCorrAccnt )
    else if DataSrc.DataSet = EmailQry then DeleteEmailRecord(EmailQry)
    else if DataSrc.DataSet = WebSiteQry then
    begin
      Id := Elem_WebSiteQry.DB.FieldByName('WEBSITEID').asInteger;
      if DeleteDataSetRecord(
        WebSiteQry, WebSiteTable, 'WEBSITEID', Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString)
      then Self.SyncronizeDelete(Id, 'where=compwebsites');
    end
    else if DataSrc.DataSet = PhoneQry then ClearPhone
    else if DataSrc.DataSet = FaxQry then ClearFax
    else if (DataSrc.DataSet = ContractQry) and CanAccessAdmn then ClearContract
    else ErrorFmtDlg('%s:'#13'%s', [DataSrc.DataSet.Name, SDataModDeleteNotAllowed]);
end;

procedure TCompanyBrowseForm.CntrySelectComboBoxClick(Sender: TObject);
begin
 { with CntrySelectComboBox do
  begin
    if DroppedDown then Exit;
    CitySelectComboBox.Enabled := ItemIndex > 0;
    CompanyCountry := ItemId;
  end;
  with CitySelectComboBox do if not Enabled then ItemIndex := -1; }
end;

procedure TCompanyBrowseForm.CitySelectComboBoxClick(Sender: TObject);
begin
{  if not CitySelectComboBox.DroppedDown then
    CompanyCity := CitySelectComboBox.ItemId; }
end;

procedure TCompanyBrowseForm.SelectComboBoxClick(Sender: TObject);
var
  Pri, Sec, Trd, CompName, Fn: String;
  Id, A, B, N: Integer;
//  SelectedItem: TTreeNode;
  SelectedItem: TcxTreeListNode;
begin  (*
  if PrimarySelectComboBox.DroppedDown
    or ThirdSelectComboBox.DroppedDown
    or AddManComboBox.DroppedDown
  then Exit;
  case PrimarySelectComboBox.ItemIndex of
    1..6: A := 1;
//    7: A := 2;
    else A := 0;
  end;

  SelectedItem := SecondaryTreeView2.FocusedNode;
  B := -1;
  if SelectedItem <> nil then 
  case SelectedItem.Parent.Index of
    1: B := SelectedItem.Index;
    2: B := SelectedItem.Index + nSecCount + 1;
  end; 
    
  if PrimarySelectComboBox.ItemIndex = 0 then Pri := ''
  else Pri := sPriFlds[PrimarySelectComboBox.ItemIndex] + ' = ''T''';

  if B = -1 then Sec := '' else Sec := sSecFldsNew[B] + ' = ''T''';

//////
  if ThirdSelectComboBox.ItemIndex = 0 then Trd := ''
  else Trd := sTrdFlds[ThirdSelectComboBox.ItemIndex] + ' = ''T''';
  if ThirdSelectComboBox.ItemIndex = 3 
  then Trd := Trd + ' and ((IsBsman = ''F'') or IsBsman is Null) '; // для приватних осіб виключити підприємців
  
  if Sec <> '' then Pri := ChooseCaptionString(Pri = '', Sec, Pri + ' and ' + Sec);
  if Trd <> '' then Pri := ChooseCaptionString(Pri = '', Trd, Pri + ' and ' + Trd);

  if AllTimeCheckBox.Checked then Pri := GetCategoryAllTimeFilter(Pri)
  else Pri := GetCategoryFilter(Pri);
  
  Fn := AnsiLowerCase(Trim(FindEdit.Text));
  if Fn <> EmptyStr then 
  begin
    CompName := Format('(Locase(Name) like (''%%%s%%'') or Locase(TradeName) like (''%%%s%%''))', 
      [Fn, Fn]);
    Pri := ChooseCaptionString(Pri = '', CompName, Pri + ' and ' + CompName);
  end; 
  
  with DMServ, CompanyQry do
  begin
    if Active then Id := CompanyQry.FieldByName('COMPANYID').asInteger else Id := 0;
    if FCompanyId > 0 then Id := FCompanyId;
    {Filter := Pri;}
    CompanyQryFilter := Pri;
    UpdateCompanyQry(0, FCompanyCountry, FCompanyCity, TypeName, FOrderByColumn);
    if Active and (Id <> 0) then Locate('COMPANYID', Id, []);
  end;
  FCompanyPrimary := A;
  FCompanySecondary := B;
  UpdateToolButtons;   *)
end;

procedure TCompanyBrowseForm.DBGridEnter(Sender: TObject);
var I: integer;
begin
  if Sender =  nil then exit;
  
  if Sender is TSvtDBGrid then
    DataSrc.DataSet := TSvtDBGrid(Sender).DataSource.DataSet;

  if (Sender is TcxGrid)and (TcxGrid(Sender).FocusedView<>nil) then
    DataSrc.DataSet := TcxDBDataController( TcxGrid(Sender).FocusedView.DataController).DataSet;

end;

procedure TCompanyBrowseForm.DBGridExit(Sender: TObject);
var I: Integer;
begin
  if Sender is TSvtDBGrid then
  begin
    if (TSvtDBGrid(Sender).DataSource.DataSet = DMServ.PhoneQry) or (TSvtDBGrid(Sender).DataSource.DataSet = DMServ.FaxQry) then I := 2
    else I := 0;

    with TSvtDBGrid(Sender).Columns.Items[I].Title.Font do Style := Style - [fsBold];
  end;
end;

procedure TCompanyBrowseForm.DBGridDblClick(Sender: TObject);
var
  Col: Integer;
  Link: string;
  AreSait: Boolean;
begin
  DBGridEnter(Sender);
  Col := DBGrid.MouseColumn;
  Link := SOurTourSomeoneWebLink + Elem_COMPANYQRY.GetValueIdStr;
  AreSait := DMServ.WebSiteQry.RecordCount > 0;

  if (Col = 5 ) and ( DBGrid.Columns[Col].FieldName = 'ISOBDZVIN' ) then
    if not AreSait then ErrorDlg('В реквізитах фірми відсутня адреса сайту.')
  else
    ShellExecute(0, 'Open', PChar(Link), nil, nil, SW_SHOW)
  else
    inherited;
end;

procedure TCompanyBrowseForm.EmailDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
const nImg: array[Boolean] of Integer = (-1, 15);
begin
  if not (gdFixed in State) then
  begin
    with (Sender as TSvtDBGrid).Canvas, Font do
    begin
      if DMServ.EmailQryISDEFAULT.AsBoolean then
        Style := Style + [fsBold] else Style := Style - [fsBold];
      if Elem_EmailQry.DB.FieldByName('OFFICEID').asInteger = 0 //<> Elem_OfficeQry.DB.FieldByName('OFFICEID').asInteger
      then begin
        if (gdSelected in State) and (Self.ActiveControl = Sender) 
        then Color := clYellow else Color := clHighlight;
      end
      else if not (gdSelected in State) then Color := clWindowText
      else if Self.ActiveControl = Sender then Color := clHighlightText
      else Color := clBtnFace;
      Brush.Style := bsSolid;
      if (Self.ActiveControl = Sender) and (gdSelected in State)
        then Brush.Color := clHighlight
      else if gdSelected in State then Brush.Color := clBtnShadow
      else if not Enabled then Brush.Color := clBtnFace
      else Brush.Color := Column.Color;
      FrameRect(Rect);
    end;
  end;
  (Sender as TSvtDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  if not (gdFixed in State) and (DataCol = 0) then
    with DMServ do
      BrowseImgList.Draw((Sender as TSvtDBGrid).Canvas, Rect.Right - 17, Rect.Top + 1,
        nImg[EmailQryISENABLED.AsBoolean and EmailQryISENABLED2.AsBoolean]);
end;

procedure TCompanyBrowseForm.FaxDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
const nImg: array[Boolean] of Integer = (-1, 15);
begin

end;

procedure TCompanyBrowseForm.PersonDBGrid_DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
var Dismiss: Boolean;
begin
  if not (gdFixed in State) then
    with (Sender as TSvtDBGrid), Canvas.Font do
    begin
      Dismiss := DMServ.PersonQryDISMISSED.AsBoolean;
      if not Dismiss then
        Style := Style - [fsStrikeout]
      else begin
        Style := Style + [fsStrikeout];
        Color := clRed;
      end;
      if not Dismiss and DMServ.PersonQryNOTACCESSED.AsBoolean then
      begin
        if (Self.ActiveControl = Sender) and (gdSelected in State) then
          Color := clYellow
        else Color := clMaroon;
      end;
    end;
  (Sender as TSvtDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TCompanyBrowseForm.PageControlChange(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    0: AddressMemoEnter(Self); //ActiveControl := AddressMemo;
    1: DBClassCodeEnter(Self);
       {if DBClassCode.Enabled then ActiveControl := DBClassCode
       else ActiveControl := IdentCodeDBEdit;}
    //2: ActiveControl := DBAsTours;
    3: PersonTabSheetEnter(Self); //ActiveControl := DBOccupation;
  end;
  GridPerson.Invalidate;
end;

procedure TCompanyBrowseForm.OfficeTabSheetEnter(Sender: TObject);
begin
  DataSrc.DataSet := DMServ.OfficeQry;
end;

procedure TCompanyBrowseForm.OfficeTabSheetShow(Sender: TObject);
begin
  UpdateAddressMemo;
  ChangeOfficeLabels;
end;

procedure TCompanyBrowseForm.PrevOfficeBtnClick(Sender: TObject);
begin
  DMServ.OfficeQry.Prior;
  PrepareEmailsPhoneFilter;
  Dec(FOffRecNo);
  UpdateAddressMemo;
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.PrepareEmailsPhoneFilter;
begin
  Elem_EmailQry.SetFilterOnView(['OFFICEID'],[null,Elem_OfficeQry.GetValueId],['=']);
  Elem_PhoneQry.SetFilterOnView(['OFFICEID'],[null,Elem_OfficeQry.GetValueId],['=']);
end;

procedure TCompanyBrowseForm.NextOfficeBtnClick(Sender: TObject);
begin
  Elem_OfficeQry.DB.Next;
  PrepareEmailsPhoneFilter;
  Inc(FOffRecNo);
  UpdateAddressMemo;
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.AddressEditBtnClick(Sender: TObject);
begin
  EditOfficeTable(0);
  ActiveControl := AddressMemo;
end;

procedure TCompanyBrowseForm.AddressMemoEnter(Sender: TObject);
begin
  DataSrc.DataSet := DMServ.OfficeQry;
end;

procedure TCompanyBrowseForm.AddressMemoChange(Sender: TObject);
var H: Integer;
begin
  with AddressMemo do
  begin
    H := Canvas.TextHeight('Yy');
    if H * Lines.Count > Height then
      ScrollBars := ssVertical else ScrollBars := ssNone;
  end;
end;

procedure TCompanyBrowseForm.AddressPrintBtnClick(Sender: TObject);
var
  Local: Boolean;
  CName, Phone: String;
begin
  Local := IsLocaleCountry( Elem_OfficeQry.DB.FieldByName('COUNTRYID').asInteger );
  CName := ExtractFirstCompanyName( Elem_COMPANYQRY.DB.FieldByName('NAME').AsString );
  if Local and Elem_COMPANYQRY.DB.FieldByName('ISENTERPR').AsBoolean then
    CName := '"' + CName + '"';

  with DMServ do
    if PhoneQry.RecordCount = 0 then Phone := ''
    else Phone := GetPhoneNumber(PhoneQryCNTRYCODE, PhoneQryAREACODE, PhoneQryPHONENO, nil);

  ExecuteEnvelopePrintDlg(Local, nil, AddressMemo.Lines, CName, Phone);
end;

procedure TCompanyBrowseForm.FaxUpBtnClick(Sender: TObject);
begin
  with DMServ, WinFaxSendForm do
  begin
    ClearRecepients;
    RecepientCompany := Elem_COMPANYQRY.DB.FieldByName('NAME').AsString;
    if Sender = FaxUpBtn then
    begin
      RecepientName := Elem_COMPANYQRY.DB.FieldByName('NAME').AsString;
      RecepientCountryCode := Elem_FaxQry.DB.FieldByName('CNTRYCODE').asString;
      RecepientAreaCode := Elem_FaxQry.DB.FieldByName('AREACODE').asString;
      RecepientNumber := Elem_FaxQry.DB.FieldByName('PHONENO').asString;
      RecepientExtension := Elem_FaxQry.DB.FieldByName('EXTENTION').asString;
    end
    else
    begin
      RecepientName := Elem_PersonQry.DB.FieldByName('FULLNAME').asString;
      RecepientCountryCode := Elem_PersonQry.DB.FieldByName('FAXCNTRY').asString;
      RecepientAreaCode := Elem_PersonQry.DB.FieldByName('FAXAREA').asString;
      RecepientNumber := Elem_PersonQry.DB.FieldByName('FAXNUMBER').asString;
      RecepientExtension := Elem_PersonQry.DB.FieldByName('FAXEXT').asString;
    end;
    AddRecepient;
    Send;
  end;
end;

procedure TCompanyBrowseForm.MailUpBtnClick(Sender: TObject);
begin
  ExecuteSendMail;
end;

procedure TCompanyBrowseForm.WebSiteBtnClick(Sender: TObject);
begin
  WebBrowse( Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString );  
end;

procedure TCompanyBrowseForm.WordUpBtnClick(Sender: TObject);
begin
  DMServ.LaunchWordNewDocument;
end;

procedure TCompanyBrowseForm.MaillistActionExecute(Sender: TObject);
begin
  ExecuteMailSendToList(
    '', '', SVDlgsEmail, nil, nil, nil, CanAccessAdmn);
end;

procedure TCompanyBrowseForm.AccountTabSheetShow(Sender: TObject);
begin
  UpdateQuery(DMServ.AccountQry);
  UpdateQuery(DMServ.CorrAccntQry);
  RefreshBankAccount;
  RefreshCorrAccount;
end;

procedure TCompanyBrowseForm.AccountTabSheetEnter(Sender: TObject);
begin
  AccountDataSourceDataChange(AccountDataSource, nil);
  AccountDataSourceDataChange(CorrAccntDataSource, nil);
end;

procedure TCompanyBrowseForm.AccountDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if PageControl.ActivePage = AccountTabSheet then
  begin
    if Sender = AccountDataSource then RefreshBankAccount
    else RefreshCorrAccount;
  end;
end;

procedure TCompanyBrowseForm.DBClassCodeEnter(Sender: TObject);
begin
  DataSrc.DataSet := Elem_COMPANYQRY.DB;
end;

procedure TCompanyBrowseForm.DBBankNameEnter(Sender: TObject);
begin
  DataSrc.DataSet := DMServ.AccountQry;
end;

procedure TCompanyBrowseForm.DBCorrNameEnter(Sender: TObject);
begin
  DataSrc.DataSet := DMServ.CorrAccntQry;
end;

procedure TCompanyBrowseForm.PrevAccountBtnClick(Sender: TObject);
begin
  DBBankNameEnter(Sender);
  DMServ.AccountQry.Prior;
  Dec(FAccRecNo);
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.NextAccountBtnClick(Sender: TObject);
begin
  DBBankNameEnter(Sender);        
  DMServ.AccountQry.Next;         
  Inc(FAccRecNo);                 
  UpdateToolButtons;              
end;

procedure TCompanyBrowseForm.PrevForeignBtnClick(Sender: TObject);
begin
  DMServ.CorrAccntQry.Prior;
  Dec(FCorrRecNo);
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.NextForeignBtnClick(Sender: TObject);
begin
  DMServ.CorrAccntQry.Next;
  Inc(FCorrRecNo);
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.PersonTabSheetEnter(Sender: TObject);
begin
  DataSrc.DataSet := DMServ.PersonQry;
  PersonDataSourceDataChange(nil, nil);
end;

procedure TCompanyBrowseForm.PrevPersonBtnClick(Sender: TObject);
begin
  DMServ.PersonQry.Prior;
  Dec(FPersRecNo);
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.NextPersonBtnClick(Sender: TObject);
begin
  DMServ.PersonQry.Next;
  Inc(FPersRecNo);
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.ProfileTabSheetShow(Sender: TObject);
begin
  ChangeCompanyProfiles;
end;

procedure TCompanyBrowseForm.AddressMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) and RecordEditAction.Enabled then RecordEditAction.Execute;
end;

procedure TCompanyBrowseForm.ExportAddressActionExecute(Sender: TObject);
begin
  if ConfirmDlgYC(SCompBrConfirmExtractAddress) then
    DMServ.ExportCompanyAddresses;
end;

procedure TCompanyBrowseForm.PersonDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if PageControl.ActivePage = PersonTabSheet then
  try
    with PersonDBText do Caption := Field.AsString;
    with OccupationDBEdit do Text := Field.AsString;
    with PhoneDBEdit do Text := Field.AsString;
    with Phone2DBEdit do Text := Field.AsString;
    with FaxDBEdit do Text := Field.AsString;
    with MobilPhone1DBEdit do Text := Field.AsString;
    with MobilPhone2DBEdit do Text := Field.AsString;
    with HomePhoneDBEdit do Text := Field.AsString;
    with EmailDBEdit do Text := Field.AsString;
    with WorkIcqDBEdit do Text := Field.AsString;
    with HomeIcqDBEdit do Text := Field.AsString;
    with DBRichEdit do Text := Field.AsString;
  except
  end;
end;

procedure TCompanyBrowseForm.LocateOurselvesActionExecute(Sender: TObject);
begin
  if not LocateOurselves then
  begin
    FilterOffActionExecute(nil);
    LocateOurselves;
  end;
end;

procedure TCompanyBrowseForm.FilterOffActionExecute(Sender: TObject);
begin
  EdiFindCmpanyByName.Text := EmptyStr;
  ComboxStatusSelect.ItemIndex := 0;
  SetSecondDefData;
  ThirdSelectComboBox.ItemIndex := 0;
  //CntrySelectComboBox.ItemIndex := 0;
  //AddManComboBox.ItemIndex := 0;
  CmbxCategory.EditValue := nAllCategory;
  CmbxCategoryPropertiesChange(Self);
  SelectComboBoxClick(Self);
  CntrySelectComboBoxClick(Self);
end;

procedure TCompanyBrowseForm.FilterDismissedActionExecute(Sender: TObject);
var Id: Integer;
begin
  with FilterDismissedAction do Checked := not Checked;
  with DMServ, PersonQry do
  begin
    if Active and (RecordCount > 0) then Id := Elem_PersonQry.DB.FieldByName('PERSONID').asInteger
      else Id := 0;
    Filtered := FilterDismissedAction.Checked;
    if Active and (Id > 0) then PersonQry.Locate('PERSONID', Id, []);
  end;
end;

const FCntrySrch: String = '';

procedure TCompanyBrowseForm.CntrySelectComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then CntrySelectComboBoxClick(Sender);
end;

procedure TCompanyBrowseForm.CitySelectComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then CitySelectComboBoxClick(Sender);
end;

procedure TCompanyBrowseForm.OfficeDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  ChangeOfficeLabels;
end;

function TCompanyBrowseForm.GetOrderByColumns(Index: Integer): String;
begin
 { Result := inherited GetOrderByColumns(Index);
  if ActiveControl = DBGrid then
  begin
    case Index of
      0: Result := 'Co.CompanyName';
      1: Result := 'Co.PersCount nulls first, Co.CompanyName';
      2: Result := 'Co.OrderCount nulls first, Co.CompanyName';
      3: Result := 'Co.LASTDATECRORDER nulls first, Co.CompanyName';
      4: Result := 'Co.SORTBYCONTRACT, Co.DocToDate DESC, Co.CompanyName';
      5: Result := 'Co.Obdzvin, Co.AreWeb, Co.ObdzvinAgreeDate, Co.CompanyName';
      6..8: Result := 'Co.CompanyName';
    end;
    FOrderByColumn := Result;
  end                                      
  else if ActiveControl = PersonDBGrid then
    case Index of
      0: Result := 'Pe.FullName';
      1: Result := 'Pe.Occupation';
      2: Result := 'N1.CntryCode, N1.AreaCode, N1.PhoneNo';
    end
  else if (ActiveControl = PhoneDBGrid) or (ActiveControl = FaxDBGrid) then
    case Index of
      0: Result := 'P.CntryCode, P.AreaCode, P.PhoneNo, P.Extention';
      1: Result := 'P.AreaCode, P.PhoneNo, P.Extention, P.CntryCode';
      2: Result := 'P.PhoneNo, P.Extention, P.CntryCode, P.AreaCode';
      3: Result := 'P.Extention, P.CntryCode, P.AreaCode, P.PhoneNo';
    end; }
end;

procedure TCompanyBrowseForm.RecordSearchActionExecute(Sender: TObject);
begin
  ExecuteFindInDataset('COMPANIES', BrowseDatasetHistory);
end;

procedure TCompanyBrowseForm.Export1cActionExecute(Sender: TObject);
begin
  DMServIB.MergeAllForCurrentCompany;
end;

procedure TCompanyBrowseForm.ClientPropsActionExecute(Sender: TObject);
begin
  if not Elem_COMPANYQRY.DB.FieldByName('ISAGENT').AsBoolean or (DMServ.ContractQry.RecordCount = 0) then
  ErrorDlg(SClntPrpDlgErrorNotApplicable)
  else MakeClientProps;
end;

procedure TCompanyBrowseForm.ContractTabSheetEnter(Sender: TObject);
begin
  ContractDataSourceDataChange(nil, nil);
end;

procedure TCompanyBrowseForm.ContractDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  if PageControl.ActivePage = ContractTabSheet then RefreshContract;
end;

procedure TCompanyBrowseForm.ContractAddBtnClick(Sender: TObject);
var T, ActionTag: Integer;
begin
  T := (Sender as TComponent).Tag;
  if T = 2 then ActionTag := remStateAppend else ActionTag := T;
  if CheckCompanyData and ExecuteContractEditForm( TIBQuery(Elem_ContractQry.DB), ActionTag, T = 2, False )
  then UpdateContractQry;
end;

procedure TCompanyBrowseForm.ContractOpenDocBtnClick(Sender: TObject);
var FName, PDFFile: String;
begin
  with DMServ do
  FName := GetPathContractFile(Elem_ContractQry.DB.FieldByName('FILENAME').asString);
  if ExtractFileExt(FName) = '.doc' then PDFFile := ChangeFileExt(FName, '.pdf');
  if FileExists(PDFFile) then ShellOpenDocument(PDFFile)
  else ShellOpenDocument(DMServ.GetPDFContract(ExtractFileName(FName)));
end;

procedure TCompanyBrowseForm.WorkIcqBtnClick(Sender: TObject);
begin
  WebBrowse('http://go.icq.com/icqgo/web/0,,,00.html', 'Web ICQ');
end;

procedure TCompanyBrowseForm.act_reviewExecute(Sender: TObject);
var APOST:boolean;
begin
  inherited;
  APOST:=ShowReview;

{  if APOST then
  begin//post
  with DmServ.CompanyTable do

  begin//end
    if not Active then Open;

    if Locate('COMPANYID', DmServ.CompanyQry.FieldByName('COMPANYID').asinteger,[])
    then

    begin
      Edit;
        FieldByName('OBDZVIN').AsBoolean := true;
      Post;
      DmServ.CompanyQry.DisableControls;
      DmServ.CompanyQry.close;
      DmServ.CompanyQry.open;
      DmServ.CompanyQry.Locate('COMPANYID', DmServ.CompanyTable.FieldByName('COMPANYID').asinteger,[]);
      DmServ.CompanyQry.EnableControls;
    end;
  end;//with
  end;//post   }
end;

procedure TCompanyBrowseForm.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
var 
  Obdzvin, ImgId, ImgIdLeft, LeftPos, RightPos: Integer;
  ColName: string;
  ActiveContract, ACWithTDate, ACWithOutTDate: Boolean;
begin
//  inherited;
  Exit;
 {
  with DMServ, (Sender as TSvtDBGrid) do
  begin
    ColName := UpperCase(Column.FieldName);
    if (ColName = 'COMPANYNAME') then
    begin

      if Elem_COMPANYQRY.DB.FieldByName('ISHEADOFFICE').AsBoolean then Canvas.Font.Style := [fsBold];
      if Elem_COMPANYQRY.DB.FieldByName('NOTWORK').AsBoolean then
      begin 
        Canvas.Font.Style := Canvas.Font.Style + [fsStrikeOut];
        Canvas.Font.Color := clRed;
      end;
      DefaultDrawColumnCell(Rect, DataCol, Column, State);

      DrawImg(Canvas, Rect, GetNetAgencyFileName( Elem_COMPANYQRY.DB.FieldByName('AGENCYLOGO').value ), True);

    end
    else
    if ColName = 'ISOBDZVIN' then
    begin
      Canvas.Brush.Color := clInfoBk;
      Obdzvin := Elem_COMPANYQRY.DB.FieldByName('OBDZVIN').value

      if (Obdzvin in [nObdzvinPromise, nObdzvinNeedCall]) 
        and (CompanyQry.FieldByName('OBDZVINAGREEDATE').asDateTime >= Date)
      then Canvas.Brush.Color := clYellow
      else if ((Obdzvin in [nObdzvinPromise, nObdzvinNeedCall]) 
        and (CompanyQry.FieldByName('OBDZVINAGREEDATE').asDateTime < Date))
        or (Obdzvin = nObdzvinTakeTour)
      then Canvas.Brush.Color := clRed
      else if (Obdzvin = nObdzvinNone) and CompanyQryAreWeb.AsBoolean
      then Canvas.Brush.Color := clRed
      else if (Obdzvin = nObdzvinNeedChangeTour) 
        and (CompanyQry.FieldByName('FIXDEFECTTODATE').asDateTime >= Date)
      then Canvas.Brush.Color := clYellow
      else if (Obdzvin = nObdzvinNeedChangeTour) 
        and (CompanyQry.FieldByName('FIXDEFECTTODATE').asDateTime < Date)
      then Canvas.Brush.Color := clRed
      else if Obdzvin = nObdzvinPermExtraAgent
      then Canvas.Brush.Color := clLime
      else if Obdzvin = nObdzvinToBanExtraAgent
      then Canvas.Brush.Color := clRed
      else if Obdzvin = nObdzvinSendMail
      then Canvas.Brush.Color := clRed; 
    
      Brush.Style := bsSolid;
      Canvas.FillRect(Rect);
      Canvas.Font.Color := clBlack;
      
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
      if Obdzvin > nObdzvinNeedCall then
      begin
        ImgId := StrToInt(ObdzvinArr[Obdzvin]);
        if ImgId > 0 then
        BrowseImgList.Draw( Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, ImgId);
      end;

      ImgId := 0;
      case Obdzvin of
        nObdzvinTakenAndRefuse: ImgId := 80;
      end;
      if ImgId > 0 then
      BrowseImgList.Draw(
          Canvas, (Rect.Left + Rect.Right) div 2, Rect.Top + 1, ImgId); 

    end else
    if ColName = 'CALCDATECONTRACT' then
    begin
      Canvas.Brush.Color := clInfoBk;
      if not CompanyQrySortByContract.IsNull then
      case CompanyQry.FieldByName('SORTBYCONTRACT').asInteger of
       SortByContractNotCntr: 
        Canvas.Brush.Color := clRed;     
       SortByContractNeedCall, 
       SortByContractSendDoc, 
       SortByContractTakeOrgn: 
        if CompanyQry.FieldByName('DOCTODATE').asDateTime > Date then Canvas.Brush.Color := clYellow
        else Canvas.Brush.Color := clRed;
       SortByContractFillData: 
        Canvas.Brush.Color := clYellow; 
       SortByContractNotRcv,
       SortByContractNotRcv1,
       SortByContractNotRcv2: Canvas.Brush.Color := clRed;    
      end;

      Canvas.FillRect(Rect);
      Canvas.Font.Color := clBlack;

      DefaultDrawColumnCell(Rect, DataCol, Column, State);
      //Є діюча або підписана, або нема угоди
      ImgId := 0;
      ImgIdLeft := 0;
      with CompanyQrySortByContract do
      if not IsNull and (Value >= 0) then begin 
        ImgId := SortByContractImgArr[Value];
        if Value in SortByContractLeftImgArr then ImgIdLeft := SortByContractImgArr2[Value];
      end;
      LeftPos := (Rect.Left + Rect.Right) div 2 - 8; 
      RightPos := LeftPos;
      if (ImgIdLeft > 0) and (ImgId > 0)
      then begin
        LeftPos := LeftPos - 10;
        RightPos := RightPos + 10;
      end;
//друк лівої
      if ImgIdLeft > 0 then BrowseImgList.Draw(Canvas, LeftPos, Rect.Top + 1, ImgIdLeft);
//друк правої          
      if ImgId > 0 then BrowseImgList.Draw(Canvas, RightPos, Rect.Top + 1, ImgId);       
    end;   
  end;}
end;

procedure TCompanyBrowseForm.DBGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
{const
  sDictHint: array[SortByContractAreCntr..SortByContractRcvOrgn] of Pointer = (
    @sDictHintContractCreate, @sDictHintContractPermReReeestr, 
    @sDictHintContractReReestr, @sDictHintContractSendEMail,  
    @sDictHintContractSendEMailAndPrint, @sDictHintContractSendEMailAndSign,
    @sDictHintContractSendEMailAndMail, 
    @sDictHintContractSendEMailAndMail, @sDictHintContractRcvCopy, 
    @sDictHintContractRcvCopyAndPrint, @sDictHintContractRcvCopyAndSign,
    @sDictHintContractRcvCopyAndMail, 
    @sDictHintContractRcvCopyAndMail, @sDictHintContractExtend,
    @sDictHintContractPrint, @sDictHintContractSign, 
    @sDictHintContractMail, 
    @sDictHintContractMail,
    @sDictHintContractEmpty, @sDictHintContractRcvOrig);   
var Coord: TGridCoord;
    CurRec, Obdzvin, SortByContract: Integer;
    aGrid: TCrackDBGrid;
    RowChng, sAgreeDate, ColName: string;
    AgreeDate: TDateTime; }
begin
 {aGrid := TCrackDBGrid(Sender);
 with aGrid do
 if Assigned(DataLink) then
 begin            
   Coord:=MouseCoord(x,y);   
   with Coord do
     if (Y < 1) or (X < 0) or (X > Columns.Count) then  Exit;
   CurRec := DataLink.ActiveRecord;
   if (FOldCoord.X <> Coord.X) or (FOldCoord.Y <> Coord.Y) then
   begin
     DataLink.ActiveRecord := Coord.Y-1;
     ColName := Columns.Items[MouseColumn].FieldName;     
     with aGrid.DataSource.DataSet do
     begin
       if (ColName = 'COMPANYNAME') and (DMServ.CurManager = 72)
       then Hint := FieldByName('COMPANYID').AsString
       else if (ColName = 'COMPANYNAME') and FieldByName('ISHEADOFFICE').AsBoolean 
       then Hint := 'Головний офіс мережі'
       else if (ColName = 'COMMONNOTEADDDATE') and not FieldByName('COMMONNOTEADDDATE').IsNull
       then Hint := FieldByName('COMMONNOTE').AsString
       else if ColName = 'ISOBDZVIN' then
       begin
         Obdzvin := FieldByName('OBDZVIN').AsInteger;
         if Obdzvin > nObdzvinNone then 
         begin
           AgreeDate := FieldByName('OBDZVINAGREEDATE').AsDateTime;
           RowChng := Format( 'Змінено: %s, Менеджер: %s',
                     [FieldByName('DATEOBDZVIN').AsString, FieldByName('EXPNOTEMANAGER').AsString]);
           if AgreeDate > 0 then sAgreeDate := FormatDateTime('dd.mm.yyyy',AgreeDate);
           Hint := FieldByName('EXPTOURCOMPNOTE').AsString + #13 + RowChng;
         end else if FieldByName('AreWeb').AsBoolean
         then Hint := 'В агента існує сайт.';
       end
       else
       if ColName = 'CalcDateContract'
       then begin
         SortByContract := FieldByName('SortByContract').AsInteger;
         case SortByContract of
           SortByContractNotAgent: Hint := EmptyStr;
           SortByContractNotCntr: Hint := 'Відсутня агентська угода.';       
           SortByContractSendDoc: 
            begin
              Hint := FieldByName('CONTRACTCOMPNOTE').AsString;
              if FieldByName('DocToDate').AsDateTime < Now
              then Hint := 'ПРОСРОЧЕНО!'#13 + Hint;
            end;
           SortByContractNeedCall,
           SortByContractFillData, 
           SortByContractRefuse: Hint := FieldByName('CONTRACTCOMPNOTE').AsString;
           SortByContractTakeOrgn: Hint := FieldByName('CONTRACTPROMPT').AsString
           else Hint := LoadResString(sDictHint[SortByContract]);
         end;
         if SortByContract in [SortByContractNotRcv1, SortByContractNotRcv2, SortByContractNotRcv] 
         then Hint := Hint + sDictHintContractOutTime;
       end else Hint := EmptyStr;    
     end;
     DataLink.ActiveRecord:=CurRec;
     FOldCoord := Coord;
     FOldHint := Hint;     
   end;
 end; }
end;

procedure TCompanyBrowseForm.DBGridTitleClick(Column: TSvtColumn);
//var Col: string;
//    CompId: Integer;
begin
 // if not FOnClick then FOnClick := True else inherited;
  
{  Col := UpperCase(Column.FieldName);
//  CompId := DMServ.CompanyQry.FieldByName('COMPANYID').asInteger;
  DMServ.CompanyQry.DisableControls;
  with DMServ.CompanyQry do
  if Col = 'NAME' then
  begin
  end
  else if Col = 'ISOBDZVIN' then
   ;
  DMServ.CompanyQry.EnableControls;  }
end;

procedure TCompanyBrowseForm.ReestrFornActionExecute(Sender: TObject);
begin
  inherited;
  ReestrFormBtn.CheckMenuDropdown
end;

procedure TCompanyBrowseForm.ShowReestrFormActionExecute(Sender: TObject);
var
  FileName: string;
begin
  inherited;
  with Sender as TAction do
  begin
    FileName := PrepareReestrForm(Tag = 0);
    if Tag = 1 then ExecuteSendMail(FileName);
  end;
end;

function TCompanyBrowseForm.PrepareReestrForm(ShowReestrForm: Boolean): string;
var
  Template, NewTemplate, DocType, Vis: OleVariant;
  TemplName: string;
begin
  TemplName := GetTemplFile;
  Template := TemplName;
  NewTemplate := False;
  DocType := 0;
  Vis := False;
  DMServ.WordApplicOpen(TemplName, Template, NewTemplate, DocType, Vis);
  FillReestrForm;
  DMServ.WordApplic.Visible := ShowReestrForm;
  Result := TemplName;
end;

function TCompanyBrowseForm.GetTemplFile: string;
const
  sTemplFile = 'Реєстраційна форма.dot';
begin
  Result := IncludeTrailingPathDelimiter(GetTemplFolder) + sTemplFile;
end;

function TCompanyBrowseForm.GetTemplFolder: string;
begin
  Result := IncludeTrailingPathDelimiter(OptionSet.TemplateFolder) + sContracts;
end;

procedure TCompanyBrowseForm.FillReestrForm;
var
  BuhId, BossId, nRow: Integer;
  WordTable: Table;
  BeforeRow: OleVariant;
begin
  with DMServ do
  begin    
    SetWordBookmark('FullName', Elem_COMPANYQRY.DB.FieldByName('SHORTNAME').AsString + ' ' + Elem_COMPANYQRY.DB.FieldByName('NAME').AsString );
    SetWordBookmark('OrgForm', Elem_COMPANYQRY.DB.FieldByName('ORGFORMNAME').AsString );
    SetWordBookmark('TourLicenseNo', Elem_COMPANYQRY.DB.FieldByName('LICENSENO').value  );
    SetWordBookmark('IdentCode', Elem_COMPANYQRY.DB.FieldByName('IDENTCODE').value );
    SetWordBookmark('TaxPayState', Elem_COMPANYQRY.DB.FieldByName('TAXNAME').AsString );
    SetWordBookmark('TaxPayCode', Elem_COMPANYQRY.DB.FieldByName('TAXPAYCODE').Value );
    SetWordBookmark('TaxPayRegNo', Elem_COMPANYQRY.DB.FieldByName('TAXPAYREGNO').Value );
    SetWordBookmark('TaxPayFromDate', Elem_COMPANYQRY.DB.FieldByName('TAXPAYREGDATE').Value);
    SetWordBookmark('ZipCode', GetCompanyZipCode);
    SetWordBookmark('AddressActual', AddressMemo.Text);  
    SetWordBookmark('AddressRegistered', GetCompRegAddress);
    SetWordBookmark('PhoneNo', CompPhoneNo);  
    SetWordBookmark('FaxNo', CompFaxNo);  
    SetWordBookmark('Email', CompEmail);  
    SetWordBookmark('Web', CompWeb);  
    SetWordBookmark('Messenger', '');
    if ExecuteReestrDataSel(BossId, BuhId) then
    with SelItsPersonQry do
    begin
      if Locate('PersonId', BossId, []) then
      begin
        SetWordBookmark('BossName', Elem_SelItsPersonQry.DB.FieldByName('SECONDNAME').asString);
        SetWordBookmark('BossFirstName', Elem_SelItsPersonQry.DB.FieldByName('NAME').asString);      
      end;
      if Locate('PersonId', BuhId, []) then
      begin
        SetWordBookmark('BuhName', Elem_SelItsPersonQry.DB.FieldByName('SECONDNAME').asString);
        SetWordBookmark('BuhFirstName', Elem_SelItsPersonQry.DB.FieldByName('NAME').asString);
        SetWordBookmark('BuhPhone', Elem_SelItsPersonQry.DB.FieldByName('CalcPhoneNo').asString);      
      end;
      Close;      
    end;
    nRow := 2;
    WordTable := WordDocum.Tables.Item(2);
    with AccountQry do
    begin
      BeforeRow := EmptyParam;
      First;
      while not Eof do
      begin
        if nRow > 2 then WordTable.Rows.Add(BeforeRow);
        WordTable.Cell(nRow, 1).Range.InsertAfter(Elem_AccountQry.DB.FieldByName('BANKNAME').asString);
        WordTable.Cell(nRow, 2).Range.InsertAfter(Elem_AccountQry.DB.FieldByName('BANKMFO').asString);
        WordTable.Cell(nRow, 3).Range.InsertAfter(Elem_AccountQry.DB.FieldByName('ACCOUNTNO').asString);
        Next;
        Inc(nRow);
      end;
    end;            
  end;
end;

function TCompanyBrowseForm.GetCompanyZipCode: string;
begin
  with DMServ do
  if OfficeQry.Locate('ISDEFAULT', 'T', [])
  then Result := Elem_OfficeQry.DB.FieldByName('ZIPCODE').asString
  else Result := EmptyStr;
  UpdateAddressMemo;
  UpdateToolButtons;  
end;

function TCompanyBrowseForm.GetCompRegAddress: string;
begin
  with DMServ do
  if OfficeQry.Locate('HEADOFFICE', 'T', [])
  then begin
    UpdateAddressMemo;
    UpdateToolButtons;  
    Result := AddressMemo.Text;
  end else Result := EmptyStr;
end;

function TCompanyBrowseForm.GetPhoneNo(const Index: Integer): string;
begin
  with DMserv do
  case Index of
  0: begin
      PhoneQry.Locate('ISDEFPHN', 'T', []);
      Result := GetPhoneNumber(PhoneQryCNTRYCODE,
            PhoneQryAREACODE, PhoneQryPHONENO, PhoneQryEXTENTION)
     end;
  1: begin
      FaxQry.Locate('ISDEFFAX', 'T', []);
      Result := GetPhoneNumber(FaxQryCNTRYCODE,
            FaxQryAREACODE, FaxQryPHONENO, FaxQryEXTENTION)
     end; 
  2: begin
      EmailQry.Locate('ISDEFAULT', 'T', []);
      Result := Elem_EmailQry.DB.FieldByName('EMAIL').asString;
     end; 
  3: Result := Elem_WebSiteQry.DB.FieldByName('WEBSITE').asString;
  end;
end;

procedure TCompanyBrowseForm.ExecuteSendMail(FileName: string = '');
var 
  Addr, Fldr, ASubject: String;
  Attach: TStrings;
  TmplName: OleVariant;
begin
{  case (Sender as TComponent).Tag of
    0: Addr := EMailDBGrid.SelectedField.AsString;
    1: Addr := EMailDBEdit.Field.AsString;
  else Addr := '';
  end;}
  Addr := Elem_EmailQry.DB.fieldByName('EMAIL').AsString; //EMailDBGrid.SelectedField.AsString;
  Attach := TStringList.Create;
  try
    ASubject := EmptyStr;
    if FileName <> EmptyStr then 
    begin
      Fldr := IncludeTrailingPathDelimiter(GetCurrentDir);
      TmplName := Fldr + ChangeFileExt(ExtractFileName(FileName), '.doc');      
      DMServ.WordDocum.SaveAs(TmplName); 
      DMServ.WordClose;
//      DMServ.WordApplic.Quit;
      FileName := TmplName;
      Attach.Add(FileName);   
      ASubject := 'Реєстраційна форма';
    end;
    if not ExecuteMailSendText(Addr, '', ASubject, '', SVDlgsEmail, 
      False, EmptyStr, False, 0, Attach)
    then ErrorFmtDlg(STripAnlzFrmErrorSendMail, [Addr]);
  finally
    DeleteFile(FileName);
    Attach.Free;
  end;    
end;

procedure TCompanyBrowseForm.FindTimerTimer(Sender: TObject);
var Fn, CompName: string;
begin
  inherited;
  FindTimer.Enabled := False;
  Fn := CapitalName(EdiFindCmpanyByName.Text);
  FCompanyId :=  Elem_COMPANYQRY.GetValueId; 
  with Elem_COMPANYQRY.DB do
  begin
    if Fn <> EmptyStr then begin
      DMServ.FCompanyFilter := AnsiUpperCase(Fn);
      Filtered := True; 
    end else Filtered := False;
    Locate('CompanyId', FCompanyId, []);
  end;
  if not Elem_COMPANYQRY.DB.FieldByName(Elem_COMPANYQRY.FieldKod).IsNull then FCompanyId := Elem_COMPANYQRY.DB.FieldByName(Elem_COMPANYQRY.FieldKod).Value;
end;



procedure TCompanyBrowseForm.SkypeBtnClick(Sender: TObject);
var Skype: TSkype;
  NumberSkype: string;
begin
  with Sender as TSpeedButton do
  case Tag of
   1: NumberSkype := WorkSkypeDBEdit.Text;
   2: NumberSkype := HomeSkypeDBEdit.Text;
  end;
  if NumberSkype <> EmptyStr then
  begin
    Skype:=TSkype.Create(nil);
    with Skype, Client do
    begin
      if not IsRunning then Start(True,True);
      Attach(6,True);
      Chat[NumberSkype].OpenWindow;
      Focus;
    end;
    FreeAndNil(Skype);
  end;
end;

procedure TCompanyBrowseForm.OrderListGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
var
  OrderState, OrderState2: Integer;
  ColName: string;
begin
 { ColName := Column.FieldName;
  with DMServ, (Sender as TSvtDBGrid), Canvas do
  begin
    if not (gdFixed in State) then
    begin
      OrderState := Elem_OrderListQry.DB.FieldByName('STATE').asInteger;
      OrderState2 := Elem_OrderListQry.DB.FieldByName('STATE2').asInteger;

      with Canvas.Font do
      begin
        Style := Style - [fsStrikeout];
        if OrderState = ordAnnuled
        then begin
          Color := clRed;
          Style := Style + [fsStrikeout];
        end;
      end;

      if ColName = 'CalcState' then
      begin
        Brush.Style := bsSolid;
        Brush.Color := GetOrderStateColor(OrderState);
        FillRect(Rect);
        if State = [] then Font.Style := [] else Font.Style := [fsBold];
        Font.Color := clWindowText;
      end
      else if ColName = 'CalcState2' then
      begin
        Brush.Style := bsSolid;
        Brush.Color := GetOrderStateColor(OrderState2);
        FillRect(Rect);
        if State = [] then Font.Style := [] else Font.Style := [fsBold];
        Font.Color := clWindowText;
      end
    end;  
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
    if (ColName = 'SPECIALDATEID') and not OrderListQrySPECIALDATEID.IsNull
    then begin
      Canvas.Brush.Style := bsSolid;
      Canvas.FillRect(Rect);
      DrawImg(Canvas, Rect, 
        GetGroupLogoFileName(Elem_OrderListQry.DB.FieldByName('SPECIALDATEID').asInteger + '.jpg'))  
    end;
  end; }
end;

procedure TCompanyBrowseForm.DrawImg(ACanvas: TCanvas; Rct: TRect;
  AFile: string; OnLeft: Boolean = False);
var Coor: Integer;
begin
  try
  FImage := TJPEGImage.Create;
  if FileExists(AFile)
  then begin
    FImage.LoadFromFile(AFile);
    if not OnLeft then Coor := (Rct.Left + Rct.Right) div 2
    else Coor := Rct.Right - 8;
    Rct.Right := Coor + 9;
    Rct.Left := Coor - 9;
    ACanvas.StretchDraw(Rct, FImage);
  end;
  finally
    FImage.Free
  end;
end;


procedure TCompanyBrowseForm.OrderTabSheetShow(Sender: TObject);
begin
  inherited;
  UpdateQuery(DMServ.OrderListQry);
  DMServ.OrderListQry.Last;
end;

procedure TCompanyBrowseForm.OrderTabSheetHide(Sender: TObject);
begin
  inherited;
  DMServ.OrderListQry.Close;
end;

procedure TCompanyBrowseForm.OrderListGridDblClick(Sender: TObject);
begin
  inherited;
  with DMServ do
  if CurManager <> 0 then
  LaunchOrderBrowser('', Elem_OrderListQry.DB.FieldByName('ORDERID').asInteger, CurManager)
end;

procedure TCompanyBrowseForm.NoteAddActionExecute(Sender: TObject);
begin
  ExecuteExpNoteEditDlg((Sender as TComponent).Tag);
end;

procedure TCompanyBrowseForm.NoteTabSheetShow(Sender: TObject);
begin
  inherited;
  UpdateQuery(DMServ.CompNoteQry);
  DMServ.CompNoteQry.Last;
end;

procedure TCompanyBrowseForm.NoteTabSheetHide(Sender: TObject);
begin
  inherited;
  DMServ.CompNoteQry.Close;
end;

procedure TCompanyBrowseForm.RegistrCall;
var 
  sNote, ContactName: string;
  NewDateObdz: TDateTime;
  NewObdzvin: Integer;
begin
  with DMServ do
  if ExecuteObdzvinForm(ContactName, sNote, NewDateObdz, NewObdzvin) then    
    SaveNote(ContactName, sNote, ExportTypeNote, Elem_COMPANYQRY.GetValueId, NewObdzvin, NewDateObdz);
end;

procedure TCompanyBrowseForm.NotesDBGridDblClick(Sender: TObject);
begin
  inherited;
  NoteViewAction.Execute;
end;

procedure TCompanyBrowseForm.ContractTabSheetShow(Sender: TObject);
begin
  inherited;
  with DMServ do
  begin
//    ParamByName('CompContractId').Value := Elem_ContractQry.DB.FieldByName('COMPCONTRACTID').asInteger;
    UpdateQuery(LogQry);      
    UpdateQueryEx(ContractQry);
    if not ContractQry.Locate('ContractType; TillDate', VarArrayOf([180, Null]), [])
    then ContractQry.Last;
    RefreshContract;
    UpdateToolButtons;
    UpdateGridDrop(ContractTabSheet);
  end;
end;

procedure TCompanyBrowseForm.ContractTabSheetHide(Sender: TObject);
begin
  inherited;
  DMServ.LogQry.Close;
  DMServ.ContractQry.Close;
end;

function TCompanyBrowseForm.CheckCompanyData: Boolean;
begin
  Result :=  Elem_COMPANYQRY.DB.FieldByName('ALLDATAFILL').AsBoolean;
  if not Result then ErrorDlg('Незаповнені всі обов`язкові дані партнера.')
  else Result := CompanyAreLicenseDoc;
end;

procedure TCompanyBrowseForm.DocumentTabSheetShow(Sender: TObject);
begin
  inherited;
  ToggleDocumentListView;
  UpdateQueryEx(DMServIB.CompanyDocsQry);
  UpdateGridDrop(DocumentTabSheet);
//  UpdateComboBox;
//  UpdateRenameBtn;
end;

procedure TCompanyBrowseForm.ToggleDocumentListView;
var
  Fldr: String;
  En: Boolean;
begin
  Fldr := DMServ.GetPartners_DocsStoreFolder( Elem_COMPANYQRY.GetValueIdStr );     
  En := (Fldr <> '') and DirectoryExists(Fldr);
  with DocumentTabSheet do
  begin
    TabVisible := True;
    En := En and TabVisible;
    //if TabVisible and En then DocumentShellListView.Root := Fldr;
  end;
end;
(*
procedure TCompanyBrowseForm.UpdateComboBox;
begin
  with DMServ, ListNameComboBox do
  begin
    Items.Clear;
    UpdateQuery(TypeDocumQry);
    Items.Add('Реєстраційна форма');
    if not CompanyQryGOVREESTRTYPEID.IsNull then 
    begin
      TypeDocumQry.Locate('TYPEDOCUMID', CompanyQry.FieldByName('GOVREESTRTYPEID').asInteger, []);
      Items.Add(Format('%s про державну реєстрацію', [TypeDocumQry.FieldByName('TYPENAME').asString]));
    end;
    if not CompanyQrySINGLETAXTYPEID.IsNull then 
    begin
      TypeDocumQry.Locate('TYPEDOCUMID', CompanyQry.FieldByName('SINGLETAXTYPEID').asInteger, []);
      Items.Add(Format('%s про сплату єдиного податку', [TypeDocumQry.FieldByName('TYPENAME').asString]));
    end;
    if not CompanyQryTAXPAYTYPEID.IsNull then 
    begin
      TypeDocumQry.Locate('TYPEDOCUMID', CompanyQry.FieldByName('TAXPAYTYPEID').asInteger, []);
      Items.Add(Format('%s про сплату ПДВ', [TypeDocumQry.FieldByName('TYPENAME').asString]));
    end;
    if not CompanyQryWARRANTYSUM.IsNull then Items.Add('Банківська гарантія');
    if not CompanyQryLICENSENO.IsNull then Items.Add('Туристична ліцензія');
  end;
end;   *)
(*
procedure TCompanyBrowseForm.RenameBtnClick(Sender: TObject);
var remFile: string;
begin
  inherited;
  with DocumentShellListView.SelectedFolder do
  if not IsFolder then 
  begin 
    remFile := DisplayName;
    if ExtractFileExt(remFile) <> EmptyStr 
    then remFile := ListNameComboBox.Text + ExtractFileExt(remFile)
    else remFile := ListNameComboBox.Text;
    Rename(remFile);  
  end;
  SetSizeColumn;
end;

procedure TCompanyBrowseForm.SetSizeColumn;
begin
  with DocumentShellListView do
  begin
    Columns[0].Width := 250;
    Columns[3].Width := 100;
  end;
end;*)
(*
procedure TCompanyBrowseForm.UpdateRenameBtn;
begin    
  RenameBtn.Enabled := (ListNameComboBox.ItemIndex >= 0)
    and (DocumentShellListView.ItemIndex >= 0);  
end;  *)

procedure TCompanyBrowseForm.CompanySrcDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  case PageControl.ActivePageIndex of
  4: with DMServ.ContractQry do if Active then Last;
  5: with DMServ.OrderListQry do if Active then Last;
  6: with DMServ.CompNoteQry do if Active then Last;
  7: begin
      ToggleDocumentListView;
//      UpdateComboBox;
     end;
  end;
  PrepareCompCount;
end;

procedure TCompanyBrowseForm.ContractEditBtnClick(Sender: TObject);
begin
  inherited;
  if ContractEditBtn.Enabled then EditContractTable(remStateEdit);
end;

procedure TCompanyBrowseForm.ContractActionExecute(Sender: TObject);
var
  SetText: string;
  ContractId, CompanyId, aTag: Integer;
  DoAction: Boolean;
begin
  inherited;

  DoAction := False;
  aTag := (Sender as TAction).Tag;
  with DMServ do
  begin
    case aTag of
      nContractPrint: begin
        DoAction := WarningDlgYN('Друкувати угоду?') and DoPrintContract;
        SetText := 'ISPRINTED = ''T'' ';
      end;
      nContractSign: begin 
        SetText := 'ISSIGN = ''T''';
        DoAction := WarningDlgYN('Позначити угоду як пропечатану?');
      end;
      nContractSentOrig: begin
       SetText := 'ISSENDORIG = ''T''';
        DoAction := WarningDlgYN('Відмітити, що відправлено оригінал?');
      end;
      nContractSendMail: begin
        DoAction := WarningDlgYN('Надіслати підписану угоду?') and ContractSendMail;
        SetText := 'ISSEND = ''T'' ';
      end;
      nContractRcvCopy: begin
//        DoAction := CheckRcvDoc;
        DoAction := True;
        SetText := Format('ISRCVCOPY = ''T'', RCVCOPYMANID =%d, RCVCOPYDATE =''NOW'' ',
          [CurManager]);
      end;
      nContractExtend: begin
        DoAction := WarningDlgYN(sDictContractContractExtend);
        SetText := 'IsExtend = ''T'', RCVCOPYDATE = ''NOW'' ';
      end;
      nContractRcvOrig: begin
        SetText := Format('ISRCVORIG =''T'', RCVORIGMANID = %d, RCVORIGDATE = ''NOW'', IsExtend = NULL ',
          [CurManager]);
        DoAction := WarningDlgYN('Відмітити, що отримано оригінал?');
      end;
    end;
    ContractId :=  Elem_ContractQry.DB.FieldByName('COMPCONTRACTID').Value;
    CompanyId := Elem_COMPANYQRY.DB.FieldByName('COMPIDFORCNTRCT').Value;
    if DoAction then
    begin
      SendMailPartnerAboutContract(aTag);
      UpdateCompContracts(ContractId, CompanyId, aTag, SetText);
      //UpdateQuery(CompanyQry);
      Elem_COMPANYQRY.RequeryCurrentRecord;

//      Elem_COMPANYQRY.DB.Locate('CompanyId', CompanyId, []);
      Elem_ContractQry.DB.Locate('COMPCONTRACTID', ContractId, []);
      //*******************************
      DMServIB.CheckForMargeContract(aTag);
    end;
  end;
end;

procedure TCompanyBrowseForm.RegistrExtraAgent;
var ContactName, sNote: string;
  NewDateObdz: TDateTime;
  NewObdzvin: Integer;
begin
  with DMServ do
  if ExecuteExtraAgentEdit(ContactName, sNote, NewDateObdz, NewObdzvin) then
    SaveNote(ContactName, sNote, ExportTypeNote, Elem_COMPANYQRY.GetValueId, NewObdzvin, NewDateObdz);
end;

procedure TCompanyBrowseForm.PrepareCompCount;
begin
  FOffRecNo := 1;
  FAccRecNo := 1;  
  FCorrRecNo := 1;
  FPersRecNo := 1;
end;

procedure TCompanyBrowseForm.TourExpActionExecute(Sender: TObject);
begin
  inherited;
  if not (Elem_COMPANYQRY.DB.FieldByName('OBDZVIN').asInteger in arrTourOnSite) then RegistrCall
  else RegistrExtraAgent;
end;

procedure TCompanyBrowseForm.tbtn_review_checkClick(Sender: TObject);
begin
  inherited;
  tbtn_review_check.CheckMenuDropdown
end;

procedure TCompanyBrowseForm.PromiseActionExecute(Sender: TObject);
var 
  sNote, ContactName: string;
  NewDocToDate: TDateTime;
  NewStanDoc: Integer;
begin
  inherited;
  with DMServ do
  if ExecutePromiseEditForm(ContactName, sNote, NewDocToDate, NewStanDoc) then
    SaveNote( ContactName, sNote, ContractTypeNote, Elem_COMPANYQRY.GetValueId, NewStanDoc, NewDocToDate );
end;

procedure TCompanyBrowseForm.LogDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
const ImgArr: array[nLogSubCategDictContractArr] of 
  Integer = (8, 90, 40, 49, 89, 84, 62, 1, 91, 102, 96, 100, 94, 80, 98, 100, 101, 62);
var
  ImgId : Integer;
  ColName: string;
begin
  inherited;
  ColName := UpperCase(Column.FieldName);
  with DMServ, (Sender as TSvtDBGrid) do
  if ContractQryINVALID.AsBoolean or 
    (not ContractQryTILLDATE.IsNull and (Elem_ContractQry.DB.FieldByName('TILLDATE').asDateTime < Now))
  then begin
    Canvas.Font.Color := clRed;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
  with DMServ, (Sender as TSvtDBGrid) do
  if ColName = 'SUBCATEGORY' then
  begin
    if Elem_LogQry.DB.FieldByName('LOGCATEGORY').asInteger = nLogSubCategDictContractPromiseRcvOrg
    then Canvas.Brush.Color := clYellow
    else Canvas.Brush.Color := clInfoBk;
    Canvas.FillRect(Rect);
    ImgId := Elem_LogQry.DB.FieldByName('LOGCATEGORY').asInteger;
    BrowseImgList.Draw(
      Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, ImgArr[ImgId]);
  end else if (ColName = 'LOGDATETIME') and not LogQryFILENAME.IsNull then 
    BrowseImgList.Draw(
      Canvas, Rect.Right - 17, Rect.Top + 1, 90);  
end;

procedure TCompanyBrowseForm.AccountTabSheetHide(Sender: TObject);
begin
  inherited;
  DMServ.CorrAccntQry.Close;
  DMServ.AccountQry.Close;
end;

procedure TCompanyBrowseForm.UpdateContractQry;
//var ContractId: Integer;
begin
  {with DMServ do
  begin
    ContractId := Elem_ContractQry.DB.FieldByName('COMPCONTRACTID').asInteger;
    //UpdateQueryAndLocate(CompanyQry, Elem_COMPANYQRY.GetValueId );
    ContractQry.Locate('COMPCONTRACTID', ContractId, []);
  end;  }
  Elem_ContractQry.RequeryCurrentRecord;
  Elem_LogQry.Requery;
end;


function TCompanyBrowseForm.ExportCompanyAddress: string;
var
  S: String;
  L :TStrings;
  I, Id, N: Integer;
  CityFld, CntrFld: TField;
begin
  with DMServ do
  begin
    S := Elem_COMPANYQRY.DB.FieldByName('NAME').asString;
    with Elem_COMPANYQRY.DB.FieldByName('COMPKIND') do if Value <> '' then S := S + ', ' + Value;
    with Elem_COMPANYQRY.DB.FieldByName('VCARDNO') do if Value > 0 then S := S + #9'(' + AsString + ')';
    Result := S;
    L := TStringList.Create;
    try
      if OfficeQryLATNAME.AsBoolean then 
      begin
        CityFld := OfficeQryCITY_ENG;
        CntrFld := OfficeQryCOUNTRY_ENG;
      end else 
      begin
        CityFld := OfficeQryCITY;
        CntrFld := OfficeQryCOUNTRY;
      end;
      GetOfficeAddress(L, OfficeQrySTRKIND, OfficeQryADDRESS,
        OfficeQryHOUSE, OfficeQryTENEMENT, OfficeQryCITYKIND, CityFld,
        OfficeQryTOWNSHIP, OfficeQryPROVINCE, OfficeQryZIPCODE, CntrFld);
      with L do
        if Count > 2 then
        begin
          Strings[Count - 2] := Strings[Count - 2] + #32#32 + Strings[Count - 1];
          Delete(Count - 1);
        end;
      for I := 0 to L.Count - 1 do if Trim(L[I]) <> '' then Result := Result + #13 + L[I];
    finally
      L.Free;
    end;
  end;
end;

procedure TCompanyBrowseForm.ListingExportToWordActionExecute(
  Sender: TObject);
var
  Template, NewTemplate, DocType, Vis, I, NotSave: OleVariant;
  TemplName: string;
begin
  TemplName := GetTemplFileForAddress;
  Template := TemplName;
  NewTemplate := False;
  DocType := 0;
  Vis := True;
  I := 1;
  with DMServ do                  
  begin            
    if not Assigned(FExportDocum) then
    begin
      WordApplicOpen(TemplName, Template, NewTemplate, DocType, Vis, True);
      FExportDocum := WordApplic.Documents.Item(I) as _Document;
      FnRow := 1;
      FnCol := 0;
    end;
    if FillWordTable then WordApplic.Visible := True
    else begin
      NotSave := False;
      FExportDocum.Close(NotSave, EmptyParam, EmptyParam);
      WordApplic.Disconnect;
    end;
  end;
end;

function TCompanyBrowseForm.GetTemplFileForAddress: string;
const
  sTemplFile = 'Заготовка на адреси агентів.dot';
begin
  Result := IncludeTrailingPathDelimiter(OptionSet.TemplateFolder) + sTemplFile;
end;

function TCompanyBrowseForm.FillWordTable: Boolean;
var
  wTable: Table;
  BeforeRow: OleVariant;
  ColCount, I, CompanyId: Integer;
  CurrAddress: string;
begin
  try
  Result := FExportDocum.Tables.Count > 0;
  if not Result then ErrorDlg('В шаблоні нема таблиці.')
  else begin
    wTable := FExportDocum.Tables.Item(1);
    BeforeRow := EmptyParam;
    ColCount := wTable.Columns.Count;
    CompanyId :=  Elem_COMPANYQRY.GetValueId;
    Elem_COMPANYQRY.DB.DisableControls;
    with DBGrid.SelectedRows do
    begin
      if Count = 0 then CurrentRowSelected := True;
      for I := 0 to Count - 1 do
      begin
       {$WARN UNSAFE_TYPE OFF}
        Elem_COMPANYQRY.DB.GotoBookmark(Pointer(Items[I]));
       {$WARN UNSAFE_TYPE ON} 
//       DMServ.OfficeQry.Locate('ItsMailAddress', 'T', []);
        CurrAddress := ExportCompanyAddress;
        if FnCol < ColCount then Inc(FnCol)
        else begin 
          FnCol := 1; 
          Inc(FnRow); 
          wTable.Rows.Add(BeforeRow); 
        end;
        wTable.Cell(FnRow, FnCol).Range.InsertAfter(CurrAddress);
      end;
    end;
     Elem_COMPANYQRY.DB.Locate('CompanyId', CompanyId, []);
     Elem_COMPANYQRY.DB.EnableControls;
  end;
  except
    FExportDocum := nil;
    ListingExportToWordAction.Execute;
    Result := True;
  end;
end;

procedure TCompanyBrowseForm.UpdateCompContracts(ContractId,
  CompanyId, aTag: Integer; SetText: string);
begin
  with DMServ, WorkQuery do
  begin
    SQL.Text := Format('Update CompContracts Set %s where CompContractId = %d', 
      [SetText, ContractId]);
    ExecSQL; 
    Transaction.CommitRetaining;   
    case aTag of
      nContractSign: LogContractDataChanging(
        nLogSubCategDictContractUsSign, ContractId, CompanyId, 
        CurManager, 'Підписано нами');
      nContractSentOrig: LogContractDataChanging(
        nLogSubCategDictContractSentOrig, 
        ContractId, CompanyId, CurManager, 'Надіслано оригінал');      
      nContractRcvOrig: LogContractDataChanging(
        nLogSubCategDictContractPartnerSign, 
        ContractId, CompanyId, CurManager, 'Отримано оригінал');
      nContractSendMail: LogContractDataChanging(
        nLogSubCategDictContractSent, 
        ContractId, CompanyId, CurManager, 'Надіслано копію угоди');        
      nContractRcvCopy: LogContractDataChanging(
        nLogSubCategDictContractCopyAttach, 
        ContractId, CompanyId, CurManager, 'Отримано копію');
      nContractPrint: LogContractDataChanging(
        nLogSubCategDictContractPrint, 
        ContractId, CompanyId, CurManager, 'Роздуковано угоду');  
      nContractExtend: LogContractDataChanging(
        nLogSubCategDictContractExtend, 
        ContractId, CompanyId, CurManager, 'Додатковий дозвіл на створення замовлень на 2 тижні');        
    end;
  end;
end;

procedure TCompanyBrowseForm.ClearContract;
var Id: Integer;
  NContract: string;
begin
  with DMServ do
  if WarningDlgYN(sDictContractWarnDelete) //and WarningDlgYN(sDictContractWarnDelete2)
  then begin
    Id := Elem_ContractQry.DB.FieldByName('COMPCONTRACTID').asInteger;
    NContract := Format('угоду № %s', [Elem_ContractQry.DB.FieldByName('NUMCONTRACT').asString]);
    DeleteDataSetRecord( ContractQry, Elem_ContractQry.DB, 'COMPCONTRACTID', NContract ); 
    //UpdateQueryAndLocate( Elem_COMPANYQRY.DB, Elem_COMPANYQRY.DB.FieldByName(Elem_COMPANYQRY.FieldKod)  );
  end;
end;

procedure TCompanyBrowseForm.NotesDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
var
  ColName: string;  
  Obdzvin, ImgId, CatCntrNote: Integer;
begin
 { inherited;
  ColName := UpperCase(Column.FieldName);
  with DMServ, Sender as TSvtDBGrid do
  if ColName = 'CALCCATEGORYNOTE' then
  begin
    Canvas.Brush.Color := clInfoBk;
    if Elem_CompNoteQry.DB.FieldByName('TYPENOTE').asInteger = ExportTypeNote then
    begin
      Obdzvin := Elem_CompNoteQry.DB.FieldByName('CATEGORYNOTE').asInteger;
      if Obdzvin = nObdzvinPermExtraAgent
      then Canvas.Brush.Color := clLime
      else if Obdzvin = nObdzvinToBanExtraAgent
      then Canvas.Brush.Color := clRed
      else if Obdzvin = nObdzvinSendMail
      then Canvas.Brush.Color := clYellow;      
    end;
    if (Elem_CompNoteQry.DB.FieldByName('TYPENOTE').asInteger = ExportTypeNote)
      or (Elem_CompNoteQry.DB.FieldByName('TYPENOTE').asInteger = ContractTypeNote)
    then if not CompNoteQryNDATE.IsNull
    then begin
      if (Elem_CompNoteQry.DB.FieldByName('NDATE').asDateTime > Date) or CompNoteQryFIXNDATE.AsBoolean 
      then Canvas.Brush.Color := clYellow
      else Canvas.Brush.Color := clRed;
    end else if CompNoteQryCATEGORYNOTE.IsNull
    then Canvas.Brush.Color := clYellow;
     
    Canvas.Brush.Style := bsSolid;
    Canvas.Font.Color := clBlack;
    Canvas.FillRect(Rect);
      
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
    
    ImgId := 0;
    with DMServ do
    if Elem_CompNoteQry.DB.FieldByName('TYPENOTE').asInteger = CommonTypeNote
    then begin
      with CompNoteQryCATEGORYNOTE do
      if IsNull then ImgId := 9 else ImgId := nCommonNoteArr[Value];

    end else if Elem_CompNoteQry.DB.FieldByName('TYPENOTE').asInteger = ExportTypeNote 
    then begin
       if Obdzvin > nObdzvinNeedCall then
       begin
         ImgId := StrToInt(ObdzvinArr[Obdzvin]);
         if ImgId > 0 then
         BrowseImgList.Draw(
           Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, ImgId);
       end;

       ImgId := 0;
       case Obdzvin of
         nObdzvinTakenAndRefuse: ImgId := 80;
       end;                      
       if ImgId > 0 then
       BrowseImgList.Draw(
           Canvas, (Rect.Left + Rect.Right) div 2, Rect.Top + 1, ImgId);     
    end else if (Elem_CompNoteQry.DB.FieldByName('TYPENOTE').asInteger = ContractTypeNote) 
      and not CompNoteQryCATEGORYNOTE.IsNull
    then ImgId := nContractStateArr[Elem_CompNoteQry.DB.FieldByName('CATEGORYNOTE').asInteger];
    if ImgId > 0 then BrowseImgList.Draw(
      Canvas, (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, ImgId);
  end; }
end;

procedure TCompanyBrowseForm.ContractTempDaysActionExecute(
  Sender: TObject);
var
  TempDay: Real;
begin
  inherited;
  with DMServ.ContractQryRCVCOPYDATE do
  if not IsNull then begin 
    TempDay := Int(Value + nMaxPermDay - Date);  
    with (Sender as TAction) do
    if TempDay >= 0 then Caption := FloatToStr(TempDay)
    else Caption := '0';
  end;
end;

function TCompanyBrowseForm.TypeName: integer;
begin
  if TypeNameCheckBox.Checked then Result := 1 else Result := 0;
end;

procedure TCompanyBrowseForm.NotesDBGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var Coord: TGridCoord;
    CurRec, TypeNote, GategoryNote :Integer;
    aGrid: TCrackDBGrid;    
begin
 aGrid := TCrackDBGrid(Sender);
 with aGrid do
 if Assigned(DataLink) then
 begin            
   Coord:=MouseCoord(x,y);
   with Coord do
     if (Y < 1) or (X < 1) or (X > Columns.Count) then  Exit;
   if (FOldCoord.X <> Coord.X) or (FOldCoord.Y <> Coord.Y) then
   begin
     CurRec := DataLink.ActiveRecord;
     DataLink.ActiveRecord := Coord.Y-1;
     TypeNote := aGrid.DataSource.DataSet.FieldByName('TypeNote').AsInteger;
     GategoryNote := aGrid.DataSource.DataSet.FieldByName('CATEGORYNOTE').AsInteger;
     with DMServ do
     if (Columns.Items[MouseColumn].FieldName = 'CalcCategoryNote') 
     then begin
      if (TypeNote = ExportTypeNote) and (GategoryNote > nObdzvinNone)
      then Hint := 'Нотатка по експорту турів'//LoadResString(pObdzvinState[GategoryNote])
      else if TypeNote = ContractTypeNote then Hint := 'Нотатка по угоді'
      else if TypeNote = CommonTypeNote then Hint := 'Загальна нотатка';
     end;
     DataLink.ActiveRecord:=CurRec;
     FOldCoord := Coord;
     FOldHint := Hint;
   end;
 end;
end;

procedure TCompanyBrowseForm.UpdateSubCategoryComboBox(CategoryId: Integer);
var 
  I, LengthArr, CutImgs, Id: Integer;
  cxImageComboBoxItem: TcxImageComboBoxItem;
  CurImageList: TImageList; 
  pName: ^string;
  pItem: ^Integer; 
  ItsShortMenu: Boolean;
begin
  ItsShortMenu := AllTimeCheckBox.Checked or (CmbxManager.EditValue <> null);
  if ItsShortMenu then CutImgs := 3 else CutImgs := 0;

  if FItsShortMenu and ItsShortMenu then ItsShortMenu := False
  else FItsShortMenu := ItsShortMenu;

  case CategoryId of 
   nCntrCategory:
    begin
      CurImageList := ContractImageList;
      LengthArr := nContrCategoryCount;
      pName := @DogCategoryName[CutImgs];
      pItem := @DocCategoryItem[CutImgs];
    end;
   nExportCategory: 
    begin
      CurImageList := ExportTourImageList;
      LengthArr := nExportCategoryCount;
      pName := @ExportCategoryName[CutImgs];
      pItem := @ExportCategoryItem[CutImgs];
    end;   
  end;               
  //with SubCategoryComboBox do
  begin
    if (ItsShortMenu and ((SubCategoryComboBox.ItemIndex < CutImgs) or (SubCategoryComboBox.ItemIndex in [7, 8]))) or FCategoryComboBoxChange
    then id := pItem^
    else
    begin
     if SubCategoryComboBox.EditValue <> null then id := StrToInt((SubCategoryComboBox.EditValue))
     else id:=0;
    end;
    FCategoryComboBoxChange := False;

    SubCategoryComboBox.Properties.Items.BeginUpdate;
    try
      SubCategoryComboBox.Properties.Items.Clear;
      SubCategoryComboBox.Properties.Images := CurImageList;
      for I := CutImgs to LengthArr do
      begin
        if not (FItsShortMenu and (CategoryId = nExportCategory)) or not (I in [7, 8]) then
        begin
          SubCategoryComboBox.Properties.Items.Add;
          cxImageComboBoxItem := SubCategoryComboBox.Properties.Items[I - CutImgs];

          cxImageComboBoxItem.ImageIndex := I;
          if pName<>nil then
          begin
            cxImageComboBoxItem.Description := pName^;
            cxImageComboBoxItem.Value := pItem^;
          end;

        end else Inc(CutImgs);
        Inc(pName);
        Inc(pItem);
      end;
    finally
      SubCategoryComboBox.Properties.Items.EndUpdate;
    end;  
    SubCategoryComboBox.EditValue := Id;
  end;
end;

function TCompanyBrowseForm.GetCategoryFilter(const Pri: string): string;
var
  SubCategory: Integer;
  ContSubCategory, ContCategory, Man: string;
begin
  (*Result := Pri;
  ContCategory := EmptyStr;
  ContSubCategory := EmptyStr;
  if CategoryComboBox.ItemIndex = nAllCategory then
  begin                                       
    with AddManComboBox do
    if not Enabled or (ItemIndex = 0) then Man := EmptyStr
    else Man := Format('AddManId = %d', [ItemId]);
    if Man <> EmptySTr then Result := ChooseCaptionString(Pri = '', Man, Pri + ' and ' + Man);
  end else if CategoryComboBox.ItemIndex = nOrderCategory then        
  begin 
    with AddManComboBox do 
    ContCategory := 'LASTDATECRORDER is not null ' + IfThen(ItemIndex = 0, EmptyStr, 
       ' and WorkManId = ' + IntToStr(ItemId));
    Result := ChooseCaptionString(Pri = '', ContCategory, Pri + ' and ' + ContCategory);
  end else if CategoryComboBox.ItemIndex = nCntrCategory then 
  with SubCategoryComboBox do
  begin
    SubCategory := StrToInt(VarToStr(EditValue));
    if SubCategory > -2
    then begin 
      if SubCategory in [SortByContractNeedCall, SortByContractSendDoc, SortByContractTakeOrgn]
      then ContSubCategory := ' and DOCTODATE > "NOW"';      
      if SubCategory in [101, 102, 122]{[21, 31]} then 
      begin
        SubCategory := SubCategory - 100; //div 10;
        ContSubCategory := 'and DOCTODATE <= "NOW"';
      end else if SubCategory = SortByContractSendEmail
      then ContSubCategory := 'or SORTBYCONTRACT in (8,9,10,11)'
      else if SubCategory = SortByContractRcvCopy
      then ContSubCategory := 'or SORTBYCONTRACT in (13,14,15,16)';
      
      with AddManComboBox do
      ContSubCategory := Format('(SORTBYCONTRACT = %d %s) %s', 
        [SubCategory, ContSubCategory, IfThen(ItemIndex = 0, EmptyStr, 
         ' and CntrEditManId = ' + IntToStr(ItemId))]);      
      Result := ChooseCaptionString(Pri = '', ContSubCategory, Pri + ' and ' + ContSubCategory);     
    end;
  end else if CategoryComboBox.ItemIndex = nExportCategory then      
  with SubCategoryComboBox do
  begin
    SubCategory := StrToInt(VarToStr(EditValue));
    if SubCategory > -1 then 
    begin
      if SubCategory = 0 then ContSubCategory := ' and AreWeb = ''F'' '
      else if SubCategory in [1, 2] then ContSubCategory := ' and ObdzvinAgreeDate > "NOW" '
      else if SubCategory = 6 then ContSubCategory := ' and FixDefectToDate > "NOW" '
      else if SubCategory in [100, 101, 102, 106]
      then begin
        SubCategory := SubCategory - 100;
        if SubCategory = 0 then ContSubCategory := ' and AreWeb = ''T'' '
        else if SubCategory in [1, 2] then ContSubCategory := ' and ObdzvinAgreeDate <= "NOW" '
        else if SubCategory = 6 then ContSubCategory := ' and FixDefectToDate <= "NOW" ';
      end;
      with AddManComboBox do
      ContSubCategory := Format('Obdzvin = %d %s %s', 
        [SubCategory, ContSubCategory, IfThen(ItemIndex = 0, EmptyStr, 
         ' and NoteAddManId = ' + IntToStr(ItemId))]);
      Result := ChooseCaptionString(Pri = '', ContSubCategory, Pri + ' and ' + ContSubCategory);
    end;      
  end;
  *)
end;

function TCompanyBrowseForm.GetCategoryAllTimeFilter(
  const Pri: string): string;
const
  AllTimeCntrFilter =
   'CompanyId in (Select CompanyId From ContractLog L ' +
   'join CompContracts Cc on Cc.CompContractId = L.ContractId ' +
   'where L.LogCategory = %d and (Cc.TillDate is Null or (Cc.TillDate > ''NOW''))' +
   '%s and (Cc.Invalid is null or (Cc.TillDate is Null)) )';
  AllTimeFilter = 
   'CompanyId in (select CompanyId from CompNotes ' +
   'where TypeNote = %d and CategoryNote %s %s)';
  ManFilter = 'and AddManId = %d';
  UserFilter = 'and L.UserId = %d';
  SubCategoryCntrArr: array[SortByContractAreCntr..SortByContractRcvOrgn] of Integer = (
    nLogSubCategDictContractCreate, nLogSubCategDictContractPermReReestr, 
    nLogSubCategDictContractReReestr, nLogSubCategDictContractSent,
    0, 0, 0, 0, 
    nLogSubCategDictContractCopyAttach, 0, 0, 0, 0,
    nLogSubCategDictContractExtend,
    nLogSubCategDictContractPrint, nLogSubCategDictContractUsSign, 
    nLogSubCategDictContractSentOrig,
    nLogSubCategDictContractSentOrig, nLogSubCategDictContractPromiseRcvOrg,
    nLogSubCategDictContractPartnerSign);
  SubCategoryArr: array[SortByContractNeedCall..SortByContractSendDoc] of Integer = (
    nContractNeedCall, nContractSendDoc);
var sFilter, sSubCategoty, Man: string;
  SubCategory: Integer;
begin
 { SubCategory := SubCategoryComboBox.EditValue;
  
  if CmbxManager.EditValue = null then Man := Emptystr
  else Man := Format(ManFilter, [AddManComboBox.ItemId]);

  if CategoryComboBox.ItemIndex = nCntrCategory then
  begin
    if SubCategory = 122 then SubCategory := SubCategory - 100;
    if SubCategory in [SortByContractAreCntr..SortByContractRcvOrgn] 
    then begin
      if Man <> EmptyStr then Man := StringReplace(Man, 'AddManId', 'L.UserId', [rfIgnoreCase]);
      sFilter := Format(AllTimeCntrFilter, [SubCategoryCntrArr[SubCategory], Man])
    end else begin
      case SubCategory of 
       SortByContractFillData : sSubCategoty := 'is Null';
       SortByContractRefuse   : sSubCategoty := '= ' + IntToStr(nContractRefuse);      
      else begin
          if SubCategory in [101, 102] then SubCategory := SubCategory - 100;
          sSubCategoty := '= ' + IntToStr(SubCategoryArr[SubCategory]);
        end;
      end;
      sFilter := Format(AllTimeFilter, [DMServ.ContractTypeNote, 
        sSubCategoty, Man]);   
    end
  end
  else if CategoryComboBox.ItemIndex = nExportCategory then
  begin
    SubCategory := SubCategoryComboBox.EditValue;
    if SubCategory in [100, 101, 102, 106] 
    then SubCategory := SubCategory - 100;
    sSubCategoty := '= ' + IntToStr(SubCategory); 
    sFilter := Format(AllTimeFilter, [DMServ.ExportTypeNote, 
      sSubCategoty, Man]);   
  end;
  Result := ChooseCaptionString(Pri = '', sFilter, Pri + ' and ' + sFilter); }
end;

procedure TCompanyBrowseForm.SetSecondDefData(IsFirst: Boolean = False);
var SecId, ParId: Integer;
//  SelectedItem: TTreeNode;
  SelectedItem: TcxTreeListNode;
const SecondFilter: array[0..2] of Pointer = (@SCompBrAsAll, @SCompBrAsTourism, @SCompBrAsFarm);
begin
  ParId := 0;
  SecId := 0;
  if IsFirst then begin
    SecId := OptionSet.LastSecFilterDictCompany;
    ParId := SecId div 100;
    SecId := SecId mod 100;
  end;
  SelectedItem := SecondaryTreeView2.Root.Items[ParId];
  if ParId > 0 then SelectedItem := SelectedItem.Items[SecId];
  SelectedItem.Selected := True;
  SecondaryPopupEdit.Text := SelectedItem.Texts[0];
 
{  SelectedItem := SecondaryTreeView2.GetTreeNodeByText(nil, LoadResString(SecondFilter[ParId]), True);
  if ParId > 0 then SelectedItem := SelectedItem.Root.Items[SecId];
  SelectedItem.Selected := True;
  SecondaryTreeView.Text := SelectedItem.Text;  }  
end;

procedure TCompanyBrowseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var ParentIndex: Integer;
  SelectedItem: TcxTreeListNode;     
begin
  //обнуление хэндла в ини файле
  (*IniFile:=TIniFile.Create(IniFileName);
  IniFile.WriteInteger('Program','CompHandle',0);
  IniFile.Free;*)
  FDestroyControls;
  
  //Application.OnIdle := nil;
  with OptionSet do
  begin
    ParentIndex := -1;
    LastPriFilterDictCompany := ComboxStatusSelect.ItemIndex;
    SelectedItem := SecondaryTreeView2.FocusedNode;
    if SelectedItem.Parent <> nil then ParentIndex := SelectedItem.Parent.Index;
    LastSecFilterDictCompany := IfThen(ParentIndex < 0, 0, 100 * ParentIndex + SelectedItem.Index);
    LastThirdFilterDictCompany := ThirdSelectComboBox.ItemIndex;
    if CmbxCompanyCity.EditValue <> null then
      LastCntryFilterDictCompany := CmbxCompanyCity.EditValue;
  end;
  //inherited;
end;

procedure TCompanyBrowseForm.ApplicationIdle(Sender: TObject;
  var Done: Boolean);
var SelRowCount: Integer;
begin
  exit;
  SelRowCount := DBGrid.SelectedRows.Count;
  with StatusBarForm.StatusBar.Panels[1] do
  if (dgMultiSelect in DBGrid.Options) and (SelRowCount > 1)
  then Text := Format(SVDlgsOneFromAmount, [ SelRowCount, Elem_COMPANYQRY.DBRecordCount ]);
  sleep(5);
end;

procedure TCompanyBrowseForm.SubCategoryComboBoxClick(Sender: TObject);
begin
  inherited;
  FChangeCategotyFilter := True;
  UpdateToolButtons;
end;

procedure TCompanyBrowseForm.AddFiliyaActionExecute(Sender: TObject);
begin
  inherited;
  NewCompanyTable(True);
  ActiveControl := DBGrid;
end;

procedure TCompanyBrowseForm.UpdateContractBtn(Enabled: Boolean);
var CntrIsActive: Boolean;
begin                       
  with DMServ.ContractQryTILLDATE do CntrIsActive := (IsNull or (Value > Now)) and Enabled;
  ContractSignAction.Enabled := CntrIsActive;
  ContractSendAction.Enabled := CntrIsActive;
  ContractRcvOrAction.Enabled := CntrIsActive;
  ContractRcvCopyAction.Enabled := CntrIsActive;
  ContractSendMailAction.Enabled := CntrIsActive;
  ContractPrintAction.Enabled := CntrIsActive;
  ContractExtendAction.Enabled := CntrIsActive;
  ContractTempDaysAction.Enabled := CntrIsActive;
  ContractReRestrAction.Visible := CntrIsActive and DMServ.ContractQryPERMREREESTR.AsBoolean;

  ContractEditBtn.Enabled := Enabled;
  ContractSelAction.Enabled := Enabled;
end;

procedure TCompanyBrowseForm.RefreshFilterBtn;
begin
  ButSearch.Enabled := CmbxCompanyCountry.EditValue<>null;
end;

procedure TCompanyBrowseForm.ComplCountryAnCity(CompId, CntryId: Integer;
  CompName: string);
var CityId: Integer;
  CityName: string;
begin
// підстановка країни і міста в адресу нової фірми по знач. фільтра
  if Elem_OfficeQry.DB.Locate('COMPANYID', CompId, []) then Elem_OfficeQry.DB.Edit
  else Elem_OfficeQry.DB.Append;

  if not Elem_OfficeQry.DB.Locate('ISDEFAULT', 'T', []) then
   Elem_OfficeQry.DB.FieldByName('ISDEFAULT').AsBoolean := True;

  if CntryId > 0 then
  begin
    Elem_OfficeQry.DB.FieldByName('COUNTRYID').Value := CntryId;
    CityId := CompanyCity;
    CityName := CmbxCompanyCity.Text;
    if (CityId > 0)
      and ConfirmFmtDlgYN(SCompBrConfirmFillAddressCity, [CompName, CityName]) then
    begin
      Elem_OfficeQry.DB.FieldByName('CITYID').Value := CityId;
      Elem_OfficeQry.DB.FieldByName('CITY').Value := CityName;
    end;
  end;
  Elem_OfficeQry.DB.Post;
  Elem_OfficeQry.DB.Refresh;
end;

procedure TCompanyBrowseForm.AddHeadOfficeAddress(HeadCompId, CompId: Integer);
const AddHeadOffAddressSQL = 
  'insert into CompOffices(CompanyId, CityKind, StrKind, House, Tenement, CountryId, ' +
  'City, CityId, Address, Province, IsDefault, AddManId, ZipCode, HeadOffice, ' +
  'OfficeName, ItsMailAddress) ' +
  'select :NewCompanyId, CityKind, StrKind, House, Tenement, CountryId, ' +
  'City, CityId, Address, Province, IsDefault, AddManId, ZipCode, HeadOffice, ' +
  'OfficeName, ''T'' ' +
  'from CompOffices ' +
  'where CompanyId = :CompanyId and HeadOffice = ''T'' ';
begin
  with DMServ, WorkQuery do
  begin
    Close;
    SQL.Text := AddHeadOffAddressSQL;
    ParamByName('CompanyId').Value := HeadCompId;
    ParamByName('NewCompanyId').Value := CompId;
    ExecSQL;
  end;
end;

procedure TCompanyBrowseForm.AddBankAccount(HeadCompId, CompId: Integer);
const AddAccountSQL = 'insert into CompAccounts(CompanyId, BankId, IsCorresp, ' +
  'AddManId, AccountNo, AccountNo2) ' +
  'select :CompanyId, BankId, IsCorresp, :AddManId, AccountNo, AccountNo2 ' +
  'from CompAccounts ' +
  'where CompanyId = :HeadCompId and IsCorresp <> ''T'' ';
begin
  with DMServ, WorkQuery do
  begin
    Close;
    SQL.Text := AddAccountSQL;
    ParamByName('CompanyId').Value := CompId;
    ParamByName('HeadCompId').Value := HeadCompId;
    ParamByName('AddManId').Value := CurManager;
    ExecSQL;
  end;
end;

procedure TCompanyBrowseForm.ContractSelActionExecute(Sender: TObject);
var P: TPoint;
begin
  inherited;
  P := GetClientOrigin;
  PopupMenu1.Popup(P.X+DetailPanel.Left+ActionContractBtn.Left + 24,
    P.Y+DetailPanel.Top+PageControl.Top+ActionContractBtn.Top + 46);        
end;

procedure TCompanyBrowseForm.N20Click(Sender: TObject);
var ContactName, sNote: string;
begin
  inherited;
  //if ExecuteRcvOrigCntrctDlg then 
  //  with DMServ do UpdateQueryAndLocate(CompanyQry, CompanyQryCOMPANYID)
end;

procedure TCompanyBrowseForm.ContractReRestrActionExecute(Sender: TObject);
begin
  inherited;
  if WarningDlgYN(sDictContractContractReReestr) 
      and WarningDlgYN(sDictContractContractReReestr2)
      and ExecuteContractEditForm(DMServ.ContractQry, remStateEdit, False, True)
  then UpdateContractQry;  
end;

procedure TCompanyBrowseForm.DialUpBtnClick(Sender: TObject);
var Id: Integer;
    Ctrl: string;
begin
  inherited;
  Id := (Sender as TComponent).Tag;
  case Id of
    1: Ctrl := PhoneDBEdit.Text;
    2: Ctrl := Phone2DBEdit.Text;
    3: Ctrl := MobilPhone1DBEdit.Text;
    4: Ctrl := FaxDBEdit.Text;
    5: Ctrl := HomePhoneDBEdit.Text;
    6: Ctrl := MobilPhone2DBEdit.Text;
    11:Ctrl := Elem_PhoneQry.DB.FieldByName('CalcPhoneNo').asString;
    else Ctrl := EmptyStr;
  end;
  Phone3cxDialNumber(Handle, Ctrl);  
end;

procedure TCompanyBrowseForm.FormDestroy(Sender: TObject);
begin
  inherited;
  //CloseHandle(EventHandle);
end;

procedure TCompanyBrowseForm.ContractAgentActionExecute(Sender: TObject);
const sDocName = 'Шаблон угоди із замовником.doc';
var
  FName: String;
  FillProc: TFillWordDocProcNew;
begin  
  inherited;
//  FName := DMServ.GetPathContractFile(sDocName);  
  FName := IncludeTrailingPathDelimiter(GetCurrentDir) + sDocName;
  if FileExists(FName) then DeleteFile(FName);
  FillProc := FillDocument;
  if DMServ.NewPrintWordDocument(GetContractType, FillProc, FName, True, True, True)
  then ContractAgentSendMail(sDocName) 
end;

function TCompanyBrowseForm.FillDocument(TypeTempl: Integer): Boolean;
const
  SelCntrTemplSQL = 'select Pp.RDB$DESCRIPTION DESCRIPT, T.* ' +
    'from ContractTemplates T ' +
    'LEFT OUTER JOIN RDB$PROCEDURE_PARAMETERS Pp ON Pp.RDB$PROCEDURE_NAME = T.sourcetable  ' +
    'and Pp.RDB$PARAMETER_NAME = T.requiredfield and Pp.rdb$PROCEDURE_NAME = T.SourceTable  ' +
    'where Pp.RDB$PARAMETER_TYPE = 1 and Pp.RDB$DESCRIPTION is not null';
  sWhereContract = ' and ContractId = :ContractId';
  sWhereHead = ' and ContractType = :ContractType';
var
  curBookmarkWork, curBookmark, currField, SQLText: string; 
  BookmarkNotFound: string;
  I, UseCount: Integer;
  function GetItsCompanyType: Integer;
  begin
    with DMServ.CompHeadPropQry do
    if FieldByName('ISENTERPR').AsBoolean then Result := 0
    else
    if FieldByName('ISBSMAN').AsBoolean then Result := 1
    else Result := 2;
  end;
  
begin 
  UpdateCompanyProperties;
  BookmarkNotFound := EmptyStr;
  with DMServ, SelCntrTemplQry do
  begin
    Close;
    SQLText := IfThen(TypeTempl = 0, sWhereContract, sWhereHead);
    SQL.Text := SelCntrTemplSQL + SQLText;
    if TypeTempl = 0 then ParamByName('ContractId').Value := GetContractType
    else if TypeTempl = 1 then ParamByName('ContractType').Value := GetItsCompanyType
    else if TypeTempl = 3 then ParamByName('ContractType').Value := TypeTempl;
    Open;
    while not Eof do
    begin
      curBookmark := SelCntrTemplQry.FieldByName('BOOKMARK').asString;
      currField := SelCntrTemplQry.FieldByName('REQUIREDFIELD').asString;

      if currField = 'HEADADDRESS' then currField := DMServ.GetItsHeadAddress
      else if currField = 'PHONENO' then currField := DMServ.GetItsHeadPhone
      else if currField = 'FAXNO' then currField := DMServ.GetItsHeadFax
      else if currField = 'TAXPAYCODE' then currField := DMServ.GetItsCompanyTaxPayData
      else currField := CompHeadPropQry.FieldByName(currField).AsString;
      UseCount := IfThen(SelCntrTemplQry.FieldByName('USECOUNT').asInteger = 0, 1, SelCntrTemplQry.FieldByName('USECOUNT').asInteger);
      for I := 1 to UseCount do begin
        curBookmarkWork := curBookmark + IfThen(I > 1, IntToStr(I), EmptyStr);
        if not DMServ.SetWordBookmark(curBookmarkWork, currField, False)
        then BookmarkNotFound := BookmarkNotFound + curBookmarkWork + #13;
      end;
      Next;
    end;
    Result := BookmarkNotFound = EmptyStr;
    if not Result then ErrorFmtDlg(SDataModErrorWordBookmarksNotFound, [BookmarkNotFound]);
  end;
end;

procedure TCompanyBrowseForm.UpdateCompanyProperties;
begin
  with DMServ.CompHeadPropQry do
  begin
    if Active then Close;
    ParamByName('CompanyId').Value :=  Elem_COMPANYQRY.GetValueId;
    ParamByName('OurPersonId').Value := Elem_COMPANYQRY.DB.FieldByName('OURPERSONID').Value;
    ParamByName('ItsPersonId').Value := Elem_COMPANYQRY.DB.FieldByName('ITSPERSONID').Value;
    ParamByName('varNumContract').Value := Elem_COMPANYQRY.DB.FieldByName('NumContract').Value;
    ParamByName('varWriteDate').Value :=  Elem_COMPANYQRY.DB.FieldByName('SignDate').Value;
    Prepare;
    Open;
  end;                   
end;

function TCompanyBrowseForm.GetContractType: Integer;
const nAgentContractId = 1128;
begin
  Result := nAgentContractId;
end;

procedure TCompanyBrowseForm.ContractAgentSendMail(const FileName: string);
var Attach: TStrings;
  DocName, Subject, eMail, aText: string;
begin
  inherited;
  Attach := TStringList.Create;
  with DMServ do
  try
    DocName := GetPathContractFile(FileName);
    DocName := ChangeFileExt(DocName, '.pdf');    
    Subject := 'Алголь. Шаблон угоди із замовником';
    Attach.Add(DocName);
    eMail := GetDefMail;
    aText := Format(sDictTextSendContractToAgent, [ Elem_COMPANYQRY.DB.FieldByName('NUMCONTRACT').AsString ,
      FormatDateTime('dd.mm.yyyy року.', Elem_COMPANYQRY.DB.FieldByName('SIGNDATE').Value ), CurManagerName]);

    if not ExecuteMailSendText(eMail, '', Subject, aText, '', False, '', False, Elem_COMPANYQRY.GetValueId, Attach, False, {nPartnerDocFolder,} nContractFolder, myStoreFileName) then
      ErrorFmtDlg(STripAnlzFrmErrorSendMail, [eMail])
    else
    try
      DeleteFile(DocName);
    except
      ErrorDlg('Помилка видалення файлу:'#13#13 + DocName);
    end;
  finally
    Attach.Free;
  end;
end;

procedure TCompanyBrowseForm.DropTextTargetDrop(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
begin
  with DMServIb do
  if Sender = GridDropTextTarget then begin
    if GridDropTextTarget.Target = GridContract then StoreContractRcv
    else if GridDropTextTarget.Target = GridDoc then begin 
      GridDoc.SetFocus;
      ViewFlesDocs.CopyDragDropFileStream( GridDataFormatAdapterStream );
      ViewFlesDocs.CopyDragDropFile( GridDataFormatAdapterFile ); 
    end;
  end else if Sender = DropTextTarget then begin
    GridFiles.SetFocus;
    ViewFlesDocs.CopyDragDropFileStream( DataFormatAdapterStream );
    ViewFlesDocs.CopyDragDropFile( DataFormatAdapterFile );
  end;   
  UpdateQueryEx(DMServIB.CompanyDocsQry);
  DMServIb.DraggedFile := False;
end;

procedure TCompanyBrowseForm.CopyMenuItemClick(Sender: TObject);
begin
  inherited;
  if Sender = CopyMenuItem then DMServ.GetPatchPartnersDoc    
  else if Sender = OpenMenuItem then WinExec(PChar('EXPLORER ' + DMServ.GetPatchPartnersDoc), SW_SHOW);
end;

procedure TCompanyBrowseForm.StoreContractRcv;
var StoreFolder: string;
begin
  if WarningDlgYN('Приєднати підписану сканкопію угоди?') then begin
    StoreFolder := DMServ.GetPartners_ContractDocsStoreFolder( Elem_COMPANYQRY.GetValueIdStr );
    CopyDropFile( GridDataFormatAdapterFile , StoreFolder , CopyFileProc );
    CopyDropFileStream( GridDataFormatAdapterStream , StoreFolder , CopyFileProc );
    ContractActionExecute(ContractRcvCopyAction);
  end;
end;

procedure TCompanyBrowseForm.CopyFileProc(FileName: string);
begin
  myCopyFile(FileName, DMServ.GetPartners_ContractDocsStoreFolder( Elem_COMPANYQRY.GetValueIdStr ));
end;

procedure TCompanyBrowseForm.ContractRcvCopyActionExecute(Sender: TObject);
begin
  inherited;
  InformDlg('Щоб отримати копію угоди, перетягніть всі її файли на відповідну угоду.'#13 + 
    'Якщо якісь файли угоди не перетягнули, це можна зробити на закладці "Документи".');
end;

procedure TCompanyBrowseForm.LogDBGridDblClick(Sender: TObject);
var
  Col: Integer;
  function GetPathToFile: string;
  begin
    Result := IncludeTrailingBackslash(
      GetDocStoreFolder(OptionSet.StoreFolder, [ Elem_COMPANYQRY.GetValueId ], nContractFolder)) +
      Elem_LogQry.DB.FieldByName('FILENAME').asString;
  end;
begin
  inherited;
  {Col := GridContractLog.MouseColumn;
  if (Col = 2) and (Elem_LogQry.DB.FieldByName('FILENAME').asString <> EmptyStr) 
  then ShellExecute(0, 'Open', PChar(GetPathToFile), nil, nil, SW_SHOW) }
end;

procedure TCompanyBrowseForm.GridDropTextTargetDragOver(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
begin
  inherited;
  if (Sender as TDropTextTarget).Target = GridDoc then begin
    DMServIB.DraggedFile := True;
    DMServIB.ViewCompanyDocs.OnMouseMove( DMServIB.ViewCompanyDocs.Site, [], APoint.X, APoint.Y);
    DMServIB.DraggedFile := False;
  end;
end;

procedure TCompanyBrowseForm.UpdateGridDrop(APage: TTabSheet);
begin
  if APage = ContractTabSheet then begin
    GridDropTextTarget.Target := GridContract;
    if ContractSendDocBtn.Visible and (ContractSendDocBtn.Action = ContractRcvCopyAction)
    then GridDropTextTarget.DragTypes := [dtCopy, dtlink]
    else GridDropTextTarget.DragTypes := [];
  end else if APage = DocumentTabSheet then begin 
    GridDropTextTarget.Target := GridDoc;
    GridDropTextTarget.DragTypes := [dtCopy, dtlink]
  end;
end;

procedure TCompanyBrowseForm.SecondaryTreeView2DblClick(Sender: TObject);
begin
  inherited;
  if SecondaryTreeView2.FocusedNode = nil then Exit;
  if SecondaryTreeView2.FocusedNode.HasChildren then Exit;
  SecondaryPopupEdit.DroppedDown := False;
  SecondaryPopupEdit.Text := SecondaryTreeView2.FocusedNode.Texts[0]; 
end;

procedure TCompanyBrowseForm.SecondaryPopupEditPropertiesCloseUp(
  Sender: TObject);
begin
  inherited;
  SelectComboBoxClick(Self)
end;

procedure TCompanyBrowseForm.SecondaryPopupEditPropertiesInitPopup(
  Sender: TObject);
begin
  inherited;
  FOnClick := False;
end;

procedure TCompanyBrowseForm.SecondaryTreeView2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #27 then begin 
    FOnClick := True;
    SecondaryPopupEdit.DroppedDown := False;
    Abort;
  end;
end;

procedure TCompanyBrowseForm.N21Click(Sender: TObject);
begin
  inherited;
(*  with DMServ do UpdateCompanyQry(0, FCompanyCountry, FCompanyCity, TypeName, 'RcvOrigDate');*)
end;

function TCompanyBrowseForm.CompanyAreLicenseDoc: Boolean;
begin

  Result := GetCountFilesForPath(
    GetDocStoreFolder(OptionSet.StoreFolder, [ Elem_COMPANYQRY.GetValueId, nPartnerLicenseDocFolder],
      nPartnerDocFolder), '*.*') > 0;
  if not Result then ErrorDlg('Не приєднані скан копії банківської гарантії в папку документів партнера!');      
end;

procedure TCompanyBrowseForm.ClearSearchCompanyClick(Sender: TObject);
begin
  inherited;
  EdiFindCmpanyByName.Text :='';  
end;

procedure TCompanyBrowseForm.ButClearCompanyCountryClick(Sender: TObject);
begin
  inherited;
  CmbxCompanyCountry.EditValue := null;
  SetFilterCompanyCountryDB;
end;

procedure TCompanyBrowseForm.ButClearCompanyCityClick(Sender: TObject);
begin
  inherited;
  CmbxCompanyCity.EditValue := null;
end;

procedure TCompanyBrowseForm.CmbxCompanyCityPropertiesInitPopup(
  Sender: TObject);
begin
  //inherited;
  if CmbxCompanyCountry.EditValue = null then Abort;
  InitLocateDBKeyValueInCxExtLookupComboBox( CmbxCompanyCountry );
end;

procedure TCompanyBrowseForm.CmbxCompanyCountryPropertiesChange(
  Sender: TObject);
begin
  CmbxCompanyCity.EditValue:=null;
  RefreshFilterBtn;
end;

procedure TCompanyBrowseForm.ButClearComboxStatusSelectClick(
  Sender: TObject);
begin
  ComboxStatusSelect.EditValue:=-1;
end;

procedure TCompanyBrowseForm.ButClearSecondaryPopupEditClick(
  Sender: TObject);
begin
  inherited;
  SecondaryTreeView2.TopNode.Focused:=true;
  SecondaryPopupEdit.EditValue := SecondaryTreeView2.TopNode.Texts[0];
end;

procedure TCompanyBrowseForm.ButClearThirdSelectComboBoxClick(
  Sender: TObject);
begin
  inherited;
  ThirdSelectComboBox.EditValue := 0;
end;

function TCompanyBrowseForm.GetCurrFieldCompanyName:Widestring;
begin
  if TypeNameCheckBox.Checked then result :='COMPANYTRADENAME'
  else result :='COMPANYNAME';
end;

procedure TCompanyBrowseForm.SetComercialCompanyView(isComercial:Boolean);
var aColumn:TcxGridDBColumn;
begin
  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').Visible:= not isComercial;
  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').Visible:= isComercial;
  if isComercial then
  begin
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').Width := Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').Width;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortOrder :=  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortOrder;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortIndex :=  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortIndex;
  end
  else
  begin
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').Width := Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').Width ;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortOrder:=Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortOrder;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortIndex:=Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortIndex;
  end;
end;

procedure TCompanyBrowseForm.PrepareValueFromField( FieldName:String; var MasFieldName:TVarArr;
                                                    var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                                    ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );
var Len:INteger;
begin
  Len:=Length(MasFieldName);
  SetLength(MasFieldName,Len+1);
  MasFieldName[Len]:= FieldName;

  Len:=Length(MasValue);
  SetLength(MasValue,Len+1);
  MasValue[Len]:= ValueTrue;

  Len:=Length(MasEqual);
  SetLength(MasEqual,Len+1);
  MasEqual[Len]:= Equal;

  Len:=Length(MasBool);
  SetLength(MasBool,Len+1);
  MasBool[Len]:= ValueBool;
end;

procedure TCompanyBrowseForm.PrepareValueFromMas( MasField:array of String;IndMas:Integer; var MasFieldName:TVarArr;
                                                   var MasValue:TVarArrVariant; var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                                   ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );
begin
  if IndMas < Length(MasField) then
    PrepareValueFromField( MasField[ Integer( IndMas ) ], MasFieldName, MasValue, MasEqual,MasBool, ValueTrue,Equal,ValueBool);
end;

procedure TCompanyBrowseForm.PrepareFilterStatus(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
begin
  if ComboxStatusSelect.EditValue <> -1 then
    PrepareValueFromMas( sPriFlds, Integer( ComboxStatusSelect.EditValue),  MasFieldName, MasValue, MasEqual, MasBool, 'T' );
end;

procedure TCompanyBrowseForm.PrepareFilterManager(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
begin
  if CmbxManager.EditValue <> null then
    PrepareValueFromField( 'ADDMANID',  MasFieldName, MasValue, MasEqual, MasBool, IntToStr( CmbxManager.EditValue)  );
end;

procedure TCompanyBrowseForm.PrepareFilterCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
begin
  if CmbxCategory.EditValue=nOrderCategory then
  begin
    PrepareValueFromField( 'LASTDATECRORDER',  MasFieldName, MasValue, MasEqual, MasBool, null,'<>' );

    if CmbxManager.EditValue <> null then
      PrepareValueFromField( 'WORKMANID',  MasFieldName, MasValue, MasEqual, MasBool,  IntToStr( CmbxManager.EditValue),'=' );
  end;
end;

procedure TCompanyBrowseForm.PrepareFilterSubCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
var SubCategory:Integer;
    V_SortByContract: Variant;
begin
  if SubCategoryComboBox.EditValue <> null then
  begin
    SubCategory := SubCategoryComboBox.EditValue ;
    if SubCategory > -2 then
    begin
      if SubCategory in [SortByContractNeedCall, SortByContractSendDoc, SortByContractTakeOrgn] then
        PrepareValueFromField( 'DOCTODATE',  MasFieldName, MasValue, MasEqual, MasBool,  Date,'>' );

      if SubCategory in [101, 102, 122] then
      begin
        SubCategory := SubCategory - 100;
        PrepareValueFromField( 'DOCTODATE',  MasFieldName, MasValue, MasEqual, MasBool,  Date,'<=' );
      end
      else
      if SubCategory = SortByContractSendEmail then
      begin
         V_SortByContract := VarArrayCreate([0, 4], varVariant);
         V_SortByContract[0]:=8;
         V_SortByContract[1]:=9;
         V_SortByContract[2]:=10;
         V_SortByContract[3]:=11;
         V_SortByContract[4]:=SortByContractSendEmail;

         PrepareValueFromField( 'SORTBYCONTRACT',  MasFieldName, MasValue, MasEqual, MasBool,  V_SortByContract,'in' );
      end
      else
      if SubCategory = SortByContractRcvCopy then
      begin
         V_SortByContract := VarArrayCreate([0, 4], varVariant);
         V_SortByContract[0]:=13;
         V_SortByContract[1]:=14;
         V_SortByContract[2]:=15;
         V_SortByContract[3]:=16;
         V_SortByContract[4]:=SortByContractRcvCopy;
         
         PrepareValueFromField( 'SORTBYCONTRACT',  MasFieldName, MasValue, MasEqual, MasBool,  V_SortByContract,'in' );
      end;
    end;
  end;
end;

procedure TCompanyBrowseForm.PrepareFilterStatusKindActivity( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
var B:Integer;
begin
  B := -1;
  if SecondaryTreeView2.FocusedNode <> nil then
  case SecondaryTreeView2.FocusedNode.Parent.Index of
    1: B := SecondaryTreeView2.FocusedNode.Index;
    2: B := SecondaryTreeView2.FocusedNode.Index + nSecCount + 1;
  end;

  if B <> -1 then
    PrepareValueFromMas( sSecFldsNew, B,  MasFieldName, MasValue, MasEqual, MasBool,'T' );
end;

procedure TCompanyBrowseForm.PrepareFilterOrgForm( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
var B:Integer;
begin
   if ThirdSelectComboBox.ItemIndex > 0 then
   begin
     B := ThirdSelectComboBox.ItemIndex;
     PrepareValueFromMas( sTrdFlds, B,  MasFieldName, MasValue, MasEqual,MasBool, 'T' );

     if ThirdSelectComboBox.ItemIndex = 3 then
      PrepareValueFromField( 'IsBsman', MasFieldName, MasValue, MasEqual,MasBool, 'T','<>' );
   end;
end;

function TCompanyBrowseForm.PrepareFilterCountryCity:Boolean;

Const WhereFilterCountry = 'where exists (select * from compoffices o where COMPANIES.companyid = o.companyid and o.CountryId = :CountryId )';        //or o.cityid = :cityid       :CountryId
Const WhereFilterCity = 'where exists (select * from compoffices o where COMPANIES.companyid = o.companyid and o.cityid = :cityid )';        //:cityid
var DS:TDataset;
begin
  result := false;
  try
    Elem_COMPANYQRY.DB.DisableControls;

    if CmbxCompanyCountry.EditValue<>null then
    begin
      Elem_COMPANYQRY.DB.Close;
      DMServ.PrepareCompanyQuery;
      DataSrc.DataSet := Elem_COMPANYQRY.DB;
      DMServ.PrepareMainSqlCompanyQuery;

      if CmbxCompanyCity.EditValue<>null then
      begin
        Elem_COMPANYQRY.DBAddSQLWhere( WhereFilterCity, False );
        Elem_COMPANYQRY.DBQuerySetParamValue('cityid',CmbxCompanyCity.EditValue);
      end
      else
      begin
        Elem_COMPANYQRY.DBAddSQLWhere( WhereFilterCountry, False );
        Elem_COMPANYQRY.DBQuerySetParamValue('CountryId',CmbxCompanyCountry.EditValue);
      end;

      Elem_COMPANYQRY.DB.Open;
      result:=True;
    end
    else
    if DBHaveWHere( Elem_COMPANYQRY.DB ) then
    begin
      Elem_COMPANYQRY.DBClose;
      DMServ.PrepareCompanyQuery;
      DataSrc.DataSet := Elem_COMPANYQRY.DB;
      DMServ.PrepareMainSqlCompanyQuery;

      Elem_COMPANYQRY.DB.Open;
      result :=True;
    end;
  finally
    Elem_COMPANYQRY.DB.EnableControls;
  end;
end;

procedure TCompanyBrowseForm.PrepareFilterCompanyName( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
var CurrFieldCompanyName:Widestring;
begin
  if EdiFindCmpanyByName.Text<>'' then
    PrepareValueFromField( GetCurrFieldCompanyName, MasFieldName, MasValue, MasEqual, MasBool, EdiFindCmpanyByName.Text ,'like' );
end;

procedure TCompanyBrowseForm.SetFilterCompanyView;
var MasFieldName:TVarArr;
    MasValue:TVarArrVariant;
    MasEqual:TVarArr;
    MasBool :TVarArrBool;
begin
   try
    Screen.Cursor := crHourGlass;
    GridCompany.BeginUpdate;
    Elem_COMPANYQRY.View.BeginUpdate;

    PrepareFilterManager( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterCategory( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterSubCategory( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterStatus( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterStatusKindActivity( MasFieldName, MasValue, MasEqual,MasBool );
    PrepareFilterOrgForm( MasFieldName, MasValue, MasEqual,MasBool );
    PrepareFilterCompanyName( MasFieldName, MasValue,MasEqual,MasBool );

    if Length(MasFieldName)<>0 then
      SetFilterOnWievForManyColumns( Elem_COMPANYQRY.View, MasFieldName, MasValue, MasEqual, MasBool, fboAnd , True, False )
    else Elem_COMPANYQRY.ClearFilterOnView;

  finally
    Elem_COMPANYQRY.View.EndUpdate;
    if Elem_COMPANYQRY.View.DataController.RowCount = 0 then
    begin
      Elem_COMPANYQRY.ShowClearDetailData( true );
      PageControl.ActivePage := OfficeTabSheet;
      AddressMemo.Clear;
      PanelTab.Repaint;
      LockControl(PanelTab, True );
    end
    else
    begin
      Elem_COMPANYQRY.ShowClearDetailData( False );
      PanelTab.Repaint;
      LockControl(PanelTab, False );
    end;
    GridCompany.EndUpdate;
    Screen.Cursor:=crDefault;
  end; 
end;

procedure TCompanyBrowseForm.SetFilterCompanyCountryDB;
var Progres : TProgressFormProp;
begin
  try
    Progres := ShowProgress( WaitFormCaption );
    GridCompany.BeginUpdate;
    Elem_COMPANYQRY.View.BeginUpdate;
    
    Progres.ProgressCaption.Repaint;
    if PrepareFilterCountryCity then
      TIBQuery(Elem_COMPANYQRY.DB).FetchAll;
      
  finally
    Elem_COMPANYQRY.View.EndUpdate;
    GridCompany.EndUpdate;
    ClosedProgress( Progres.FormProgres );
  end;
end;

procedure TCompanyBrowseForm.EdiFindCmpanyByNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = Chr(VK_Return) then
  SetFilterCompanyView;
end;

procedure TCompanyBrowseForm.TypeNameCheckBoxClick(Sender: TObject);
begin
  inherited;
  SetComercialCompanyView( TypeNameCheckBox.Checked );
end;

procedure TCompanyBrowseForm.ButSearchClick(Sender: TObject);
begin
  inherited;
  SetFilterCompanyCountryDB;
  SetFilterCompanyView;  
end;

procedure TCompanyBrowseForm.FormShow(Sender: TObject);
begin
  inherited;

  //if FId0 > 0 then DMServ.CompanyQry.Locate('COMPANYID', FId0, []);
  if FId1 > 0 then DMServ.PersonQry.Locate('PERSONID', FId1, []);  
  FId0 := 0;
  FId1 := 0;
  ChangeOfficeLabels;
  ChangeCompanyIsInterpr;
  PrepareCompCount;
  FCompanyId := 0;
  RefreshFilterBtn;
  OkBtn.Left := CancelBtn.Left;
  OkBtn.Caption := 'Закрити';
  Elem_COMPANYQRY.SetFocusOnView;
end;

procedure TCompanyBrowseForm.FormActivate(Sender: TObject);
begin
  //inherited;
end;

procedure TCompanyBrowseForm.CmbxCompanyCityPropertiesChange(
  Sender: TObject);
begin
  inherited;
  RefreshFilterBtn;
end;

procedure TCompanyBrowseForm.CmbxCompanyCountryExit(Sender: TObject);
begin
  inherited;
  RefreshFilterBtn;
end;

procedure TCompanyBrowseForm.ComboxStatusSelectPropertiesChange(
  Sender: TObject);
begin
  inherited;
  SetFilterCompanyView;
end;

procedure TCompanyBrowseForm.SecondaryPopupEditPropertiesChange(
  Sender: TObject);
begin
  inherited;
  SetFilterCompanyView;
end;

procedure TCompanyBrowseForm.ThirdSelectComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  SetFilterCompanyView;
end;

procedure TCompanyBrowseForm.CmbxManagerPropertiesChange(Sender: TObject);
begin
  inherited;
  SetFilterCompanyView;
end;

procedure TCompanyBrowseForm.butClearManagerClick(Sender: TObject);
begin
  inherited;
  CmbxManager.EditValue := null;
end;

procedure TCompanyBrowseForm.CmbxCategoryPropertiesChange(Sender: TObject);
var CategoryId: Integer;
begin
  inherited;
  FChangeCategotyFilter := True;
  if {(Sender is TcxImageCombobox) and }((Sender as TcxImageCombobox).Tag = 1) then
  begin
    FCategoryComboBoxChange := True;
  end;
  CategoryId := TcxImageCombobox(Sender).EditValue;

  SubCategoryComboBox.Enabled := CategoryId > nOrderCategory;
  if CategoryId > nOrderCategory then UpdateSubCategoryComboBox(CategoryId);
  UpdateToolButtons;
  SetFilterCompanyView; 
end;

procedure TCompanyBrowseForm.butClearStatusClick(Sender: TObject);
begin
  inherited;
  CmbxCategory.EditValue:=0;
  butClearSubCategory.Click;
end;

procedure TCompanyBrowseForm.butClearSubCategoryClick(Sender: TObject);
begin
  inherited;
  SubCategoryComboBox.EditValue:=null;
end;

procedure TCompanyBrowseForm.SubCategoryComboBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  SetFilterCompanyView;
end;

procedure TCompanyBrowseForm.EdiFindCmpanyByNamePropertiesChange(
  Sender: TObject);
begin
  inherited;
  if EdiFindCmpanyByName.Text='' then SetFilterCompanyView;

end;

procedure TCompanyBrowseForm.DataSetRefreshActionExecute(Sender: TObject);
var DS:TDataSource;
begin
  //inherited;
  Elem_COMPANYQRY.View.BeginUpdate;
  //Elem_COMPANYQRY.SetFilterOnView([Elem_COMPANYQRY.FieldKod],[0],['=']);
  Elem_COMPANYQRY.DBReOpen(True);// Requery(True,True);
  //Elem_COMPANYQRY.DBOpen(True);
  //Elem_COMPANYQRY.ClearFilterOnView;
  Elem_COMPANYQRY.View.EndUpdate;

  {DS := Elem_COMPANYQRY.View.DataController.DataSource ;
  Elem_COMPANYQRY.View.DataController.DataSource := nil;
  Elem_COMPANYQRY.DBClose;
  DMServ.PrepareCompanyQuery;
  DataSrc.DataSet := Elem_COMPANYQRY.DB;
  DMServ.PrepareMainSqlCompanyQuery;
  Elem_COMPANYQRY.DB.Open; }

end;

procedure TCompanyBrowseForm.ButShowLogClick(Sender: TObject);
begin
  inherited;
  DMServIB.ShowLog( self, -1, [] );
end;

procedure TCompanyBrowseForm.OkBtnClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TCompanyBrowseForm.N23Click(Sender: TObject);
begin
  inherited;
  TIBQuery(Elem_CompTaxSystemLogQry.DB).ParamByName('CompanyId').Value := Elem_COMPANYQRY.GetValueId;
  Elem_CompTaxSystemLogQry.Requery;
  DMServIB.Prepare_CompTaxLogMemTable;

  ExecuteCompTaxBrowseForm( Elem_COMPANYQRY.DB.FieldByName('ISENTERPR').AsBoolean, 
    Elem_COMPANYQRY.DB.FieldByName('GOVREESTRDATE').AsDateTime );
  DMServIB.StoreTaxSystemLog(False, nil);
end;

end.
