unit UnitEditInfoCountry;

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
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, ExtCtrls, StdCtrls, cxTextEdit, DBCtrls, Buttons,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGroupBox, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, ServModIB, 
  cxGridDBTableView, cxGrid, cxPC, UnitFrameMoveToTimeZone, AzComboBox, ListSelectForm,
  cxMemo, cxImageComboBox, cxRadioGroup,ServMod,UnitProc, dxmdaset,OptSet,Core,UnitSelectHoliday,
  ExtDlgs, EmbassyDocDlg, cxCalendar, cxTL, cxTLdxBarBuiltInMenu,IBQuery, UnitIBQuery,OrderUn,
  cxInplaceContainer, cxTLData, cxDBTL, OleCtrls, SHDocVw, Menus, Grids,ShellAPI, UnitLngTranslateEdit,
  DBGrids, ImgList,UnitTranslate, cefvcl,ceflib,ADODB, UnitFrameSearchCity,
  UnitFrameDescriptionWebHTML, UnitFrameDic, TypInfo;

const MessCannotChangeSectionName = 'Неможливо змінити розділ в якого вже створений хоча б один підрозділ.';
      MessSectionItemNotFound = 'Для вибраного розділу не знайдено підрозділів.';
      MessageErrorOnThisLevelAlredyFindSegmentItem ='На цьому рівні вже є такий розділ/підрозділ.';
type
  TOptAddSection = ( optSectDescr, optSectItemDescr, optSectNameDescr );
  TRecDataInfo = record
     id:Variant;
     id_TYPE_INFO:Variant;
     name :WideString;
     TableInd:Integer;
     IdValue :Integer;
     idUnitMeasur :Integer;
     aValue:WideString;
     AddValue:WideString;
  end;
  TRecDataInfoArr = array of TRecDataInfo;

  TFrmEditInfoCountry = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    ChShwOnWeb: TcxCheckBox;
    MemDatOficialLng: TdxMemData;
    MemDataWidespreadlLng: TdxMemData;
    MemDatReligia: TdxMemData;
    MemDatOficialLngSrc: TDataSource;
    MemDataWidespreadlLngSrc: TDataSource;
    MemDatReligiaSrc: TDataSource;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewMemDatOficialLng: TcxGridDBTableView;
    MemDatOficialLngid: TIntegerField;
    MemDatOficialLngname: TStringField;
    MemDataWidespreadlLngid: TIntegerField;
    MemDataWidespreadlLngname: TStringField;
    MemDatReligiaid: TIntegerField;
    MemDatReligianame: TStringField;
    ViewMemDatOficialLngRecId: TcxGridDBColumn;
    ViewMemDatOficialLngid: TcxGridDBColumn;
    ViewMemDatOficialLngname: TcxGridDBColumn;
    ViewMemDatWidespreadlLng: TcxGridDBTableView;
    ViewMemDatWidespreadlLngRecId: TcxGridDBColumn;
    ViewMemDatWidespreadlLngid: TcxGridDBColumn;
    ViewMemDatWidespreadlLngname: TcxGridDBColumn;
    ViewMemDatReligia: TcxGridDBTableView;
    ViewMemDatReligiaRecId: TcxGridDBColumn;
    ViewMemDatReligiaid: TcxGridDBColumn;
    ViewMemDatReligianame: TcxGridDBColumn;
    MemDatInternacionalOrg: TdxMemData;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    MemDatInternacionalOrgSrc: TDataSource;
    ViewMemDataInternacionalOrg: TcxGridDBTableView;
    ViewMemDataInternacionalOrgRecId: TcxGridDBColumn;
    ViewMemDataInternacionalOrgid: TcxGridDBColumn;
    ViewMemDataInternacionalOrgname: TcxGridDBColumn;
    ViewMemDatTimeZone: TcxGridDBTableView;
    MemDataTimeZone: TdxMemData;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    MemDataTimeZoneSrc: TDataSource;
    ViewMemDatTimeZoneRecId: TcxGridDBColumn;
    ViewMemDatTimeZoneid: TcxGridDBColumn;
    ViewMemDatTimeZonename: TcxGridDBColumn;
    ViewMemDataInternacionalOrgDateIn: TcxGridDBColumn;
    MemDatInternacionalOrgAVALUE: TDateTimeField;
    PageControlCounry: TcxPageControl;
    TabCountryInfo: TcxTabSheet;
    TabCountryDescript: TcxTabSheet;
    Label12: TLabel;
    ImgFlag: TImage;
    ImgGerb: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    ButClearFlag: TSpeedButton;
    ButClearGerb: TSpeedButton;
    ButCountryLng: TSpeedButton;
    ButCountryOficialLng: TSpeedButton;
    EdOficialName: TcxTextEdit;
    EdName: TcxTextEdit;
    EdCurrencyShort: TcxTextEdit;
    CmbFormGovernment: TcxExtLookupComboBox;
    CmbCurrency: TcxExtLookupComboBox;
    EdAlfa2: TcxTextEdit;
    EdAlfa3: TcxTextEdit;
    EdNumeric: TcxTextEdit;
    EdCarCode: TcxTextEdit;
    EdDomen: TcxTextEdit;
    EdPhoneCode: TcxTextEdit;
    CbBoxNeedVisa: TcxCheckBox;
    PageControlCountryInfo: TcxPageControl;
    TabStatistic: TcxTabSheet;
    LengthLabelNS: TLabel;
    LengthLabelWE: TLabel;
    LengthLabel1: TLabel;
    PopulationYearLabel: TLabel;
    PopulationDateLabel: TLabel;
    PopulationLabel: TLabel;
    SquareLabel: TLabel;
    LengthCoastlineLabel: TLabel;
    LengthBoundaryLabel: TLabel;
    LengthLabel2: TLabel;
    ButClearLengthBoundary: TSpeedButton;
    butLengthCoastline: TSpeedButton;
    butClearTerritoryLengthWE: TSpeedButton;
    butClearTerritoryLengthNS: TSpeedButton;
    butClearSquareCountry: TSpeedButton;
    butClearPeople: TSpeedButton;
    EdSquareCountry: TcxTextEdit;
    EdPeople: TcxTextEdit;
    EdPeopleForYear: TcxTextEdit;
    EdTerritoryLengthWE: TcxTextEdit;
    EdTerritoryLengthNS: TcxTextEdit;
    EdLengthBoundary: TcxTextEdit;
    EdLengthCoastline: TcxTextEdit;
    CmbUnitMeasurPeople: TcxExtLookupComboBox;
    CmbUnitMeashureLengthBoundary: TcxExtLookupComboBox;
    CmbUnitMearhureLengthCoastline: TcxExtLookupComboBox;
    CmbUnitMeashureTerritoryLengthWE: TcxExtLookupComboBox;
    CmbxUnitMeashureTerritoryLengthNS: TcxExtLookupComboBox;
    CmbUnitMeasurSquare: TcxExtLookupComboBox;
    TabInternOrg: TcxTabSheet;
    Panel23: TPanel;
    butEditInternacionalOrg: TSpeedButton;
    butAddInternacionalOrg: TSpeedButton;
    butDelInternacionalOrg: TSpeedButton;
    butShowProvinciesDict: TSpeedButton;
    Bevel1: TBevel;
    GridInternacionalOrg: TcxGrid;
    cxGridDBTableView10: TcxGridDBTableView;
    cxGridLevel10: TcxGridLevel;
    TabLngAndReligion: TcxTabSheet;
    Panel11: TPanel;
    GridReligia: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    butEditReligia: TSpeedButton;
    Label13: TLabel;
    butDicReligions: TSpeedButton;
    Panel12: TPanel;
    GridOficialLng: TcxGrid;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    Panel13: TPanel;
    butEditOficialLng: TSpeedButton;
    Label14: TLabel;
    butDicLanguages: TSpeedButton;
    Panel14: TPanel;
    GridWidespreadlLng: TcxGrid;
    cxGridDBTableView7: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    Panel15: TPanel;
    butEditWidespreadLng: TSpeedButton;
    Label15: TLabel;
    butDicLanguages2: TSpeedButton;
    TabHolidays: TcxTabSheet;
    Panel10: TPanel;
    butAddCelebration: TSpeedButton;
    butEditCelebration: TSpeedButton;
    butDelCelebration: TSpeedButton;
    Label11: TLabel;
    GridCelebration: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    TabTimeZone: TcxTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    butEditTimeZone: TSpeedButton;
    butTimeZone: TSpeedButton;
    GridTimeZone: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel6: TPanel;
    Panel7: TPanel;
    ChBoxSelectSammerTimeUsed: TcxCheckBox;
    GroupBoxSammer: TcxGroupBox;
    FrameMoveToTimeZoneSummer: TFrameMoveToTimeZone;
    GroupBoxStandart: TcxGroupBox;
    FrameMoveToTimeZoneStandart: TFrameMoveToTimeZone;
    TabAddInfo: TcxTabSheet;
    PowerVoltageLabel: TLabel;
    PowerFrequencyLabel: TLabel;
    Label7: TLabel;
    butDicPowerVolt: TSpeedButton;
    butDicFreg: TSpeedButton;
    CmbPowerVoltage: TcxExtLookupComboBox;
    CmbPowerFrequency: TcxExtLookupComboBox;
    CmbPowerTypePlug: TcxExtLookupComboBox;
    Panel24: TPanel;
    ImgPowerPlug: TImage;
    TabRoadTrafic: TcxTabSheet;
    Panel5: TPanel;
    RoadTrafficLabel: TLabel;
    Label9: TLabel;
    butClearLicensePlate: TSpeedButton;
    CmbRoadTraffic: TcxImageComboBox;
    Panel25: TPanel;
    ImgLicensePlate: TImage;
    Panel8: TPanel;
    butAddLimitSpeed: TSpeedButton;
    butEditLimitSpeed: TSpeedButton;
    butDelLimitSpeed: TSpeedButton;
    Label10: TLabel;
    Bevel2: TBevel;
    butDicCarType: TSpeedButton;
    GridLimitSpeed: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    TabAmbasada: TcxTabSheet;
    GridEmbassies: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    Panel9: TPanel;
    butEditEmbassies: TSpeedButton;
    PageControlAmbassy: TcxPageControl;
    TabEmbassyUkraineInCountry: TcxTabSheet;
    TabEmbassyCountryInUkraine: TcxTabSheet;
    TabConsulate: TcxTabSheet;
    Panel26: TPanel;
    GridEmbassiesInUkraine: TcxGrid;
    GridEmbassiesInUkraineDBTableView1: TcxGridDBTableView;
    GridEmbassiesInUkraineLevel1: TcxGridLevel;
    GridRegionEmbassies: TcxGrid;
    cxGridDBTableView11: TcxGridDBTableView;
    cxGridLevel11: TcxGridLevel;
    Panel27: TPanel;
    GridCheckRegionEmbassies: TcxGrid;
    cxGridDBTableView12: TcxGridDBTableView;
    cxGridLevel12: TcxGridLevel;
    TabVisa: TcxTabSheet;
    GridEmbassiesVisa: TcxGrid;
    GridEmbassiesVisaDBTableView1: TcxGridDBTableView;
    GridEmbassiesVisaLevel1: TcxGridLevel;
    GridVisaCenter: TcxGrid;
    cxGridDBTableView13: TcxGridDBTableView;
    cxGridLevel13: TcxGridLevel;
    Panel1: TPanel;
    DocumVisaBtn: TSpeedButton;
    Label6: TLabel;
    GroupBoxPhoneCode: TcxGroupBox;
    ChPhoneCode: TcxCheckBox;
    RbCheckNotHavePhoneCode: TcxRadioButton;
    RbCheckJoinPhoneCode: TcxRadioButton;
    EdJoinPhoneCode: TcxTextEdit;
    PanelLeft: TPanel;
    TreeTemplateDecript: TcxDBTreeList;
    Panel19: TPanel;
    TreeTemplateDecriptcxDBTreeListNAME_ITEM: TcxDBTreeListColumn;
    butAddCountrySectionitem: TSpeedButton;
    butEditCountryTypeSectionitem: TSpeedButton;
    butDelCountryTypeSectionitem: TSpeedButton;
    butDicCountrySectionitem: TSpeedButton;
    PmEditCountryDescrSectionItem: TPopupMenu;
    butNewSection: TMenuItem;
    butNewSectionItem: TMenuItem;
    cxGridViewRepositoryDescript: TcxGridViewRepository;
    ViewDicSections: TcxGridDBTableView;
    ViewDicSectionsID: TcxGridDBColumn;
    ViewDicSectionsDICTSECTIONID: TcxGridDBColumn;
    ViewDicSectionsItems: TcxGridDBTableView;
    ViewDicSectionsItemsID: TcxGridDBColumn;
    ViewDicSectionsItemsDICTSECTIONID: TcxGridDBColumn;
    ViewDicSectionsItemsITEMID: TcxGridDBColumn;
    ViewDicSectionsItemsNAME: TcxGridDBColumn;
    ViewSectionName: TcxGridDBTableView;
    ViewSectionNameID: TcxGridDBColumn;
    ViewSectionNameDICTSECTIONID: TcxGridDBColumn;
    ViewSectionNameITEMID: TcxGridDBColumn;
    ViewSectionNameNAME: TcxGridDBColumn;
    BevelMainSpliterMoveRows: TBevel;
    butMoveUpSectionitem: TSpeedButton;
    butMoveDownSectionitem: TSpeedButton;
    Bevel3: TBevel;
    butRefreshSectionitem: TSpeedButton;
    Bevel4: TBevel;
    TreeTemplateDecriptcxDBTreeListORder: TcxDBTreeListColumn;
    MDCountryDescrSection: TdxMemData;
    MDCountryDescrSectionid: TIntegerField;
    MDCountryDescrSectiondictsectionid: TIntegerField;
    MDCountryDescrSectionitemid: TIntegerField;
    MDCountryDescrSectionNAME: TStringField;
    MDCountryDescrSectionDS: TDataSource;
    TreeTemplateDecriptcxDBTreeListID: TcxDBTreeListColumn;
    N1: TMenuItem;
    butDelSectionItem: TMenuItem;
    butEditSectionItem: TMenuItem;
    N4: TMenuItem;
    butRefreshCounryDesript: TMenuItem;
    N6: TMenuItem;
    butMoveUpSection: TMenuItem;
    butMoveDownSection: TMenuItem;
    TreeTemplateDecriptcxDBTreeListDICTSECTIONID: TcxDBTreeListColumn;
    TreeTemplateDecriptcxDBTreeListITEMID: TcxDBTreeListColumn;
    TreeTemplateDecriptcxDBTreePARENT: TcxDBTreeListColumn;
    GridMDCountryDescriptInvisibleDBTableView1: TcxGridDBTableView;
    GridMDCountryDescriptInvisibleLevel1: TcxGridLevel;
    GridMDCountryDescriptInvisible: TcxGrid;
    ImageListTreeCounry: TImageList;
    PMAddCountryDescriptSectItem: TPopupMenu;
    butNewSection2: TMenuItem;
    butNewSectionItem2: TMenuItem;
    Splitter1: TSplitter;
    PMEditDecript: TPopupMenu;
    N2: TMenuItem;
    TreeTemplateDecriptcxDBTreeListNAME: TcxDBTreeListColumn;
    ButShowLog: TSpeedButton;
    FrameSearchCityCapital: TFrameSearchCity;
    ButCountrySecDescrLng: TSpeedButton;
    FrameCountryDescriptionWebHTML: TFrameDescriptionWebHTML;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ChBoxSelectSammerTimeUsedClick(Sender: TObject);
    procedure ChPhoneCodeClick(Sender: TObject);
    procedure CmbCurrencyPropertiesChange(Sender: TObject);
    procedure CmbPowerVoltagePropertiesInitPopup(Sender: TObject);
    procedure CmbPowerFrequencyPropertiesInitPopup(Sender: TObject);
    procedure butEditOficialLngClick(Sender: TObject);
    procedure butEditWidespreadLngClick(Sender: TObject);
    procedure butEditReligiaClick(Sender: TObject);
    procedure butEditTimeZoneClick(Sender: TObject);
    procedure butEditInternacionalOrgClick(Sender: TObject);
    procedure butAddCelebrationClick(Sender: TObject);
    procedure butEditCelebrationClick(Sender: TObject);
    procedure butDelCelebrationClick(Sender: TObject);
    procedure CmbPowerTypePlugPropertiesChange(Sender: TObject);
    procedure butClearLicensePlateClick(Sender: TObject);
    procedure butAddLimitSpeedClick(Sender: TObject);
    procedure butEditLimitSpeedClick(Sender: TObject);
    procedure butDelLimitSpeedClick(Sender: TObject);
    procedure butEditEmbassiesClick(Sender: TObject);
    procedure TabEmbassyUkraineInCountryShow(Sender: TObject);
    procedure TabEmbassyCountryInUkraineShow(Sender: TObject);
    procedure ImgLicensePlateDblClick(Sender: TObject);
    procedure ButClearFlagClick(Sender: TObject);
    procedure ButClearGerbClick(Sender: TObject);
    procedure ImgFlagDblClick(Sender: TObject);
    procedure ImgGerbDblClick(Sender: TObject);
    procedure butClearSquareCountryClick(Sender: TObject);
    procedure butClearTerritoryLengthWEClick(Sender: TObject);
    procedure butClearTerritoryLengthNSClick(Sender: TObject);
    procedure butClearPeopleClick(Sender: TObject);
    procedure ButClearLengthBoundaryClick(Sender: TObject);
    procedure butLengthCoastlineClick(Sender: TObject);
    procedure EdSquareCountryKeyPress(Sender: TObject; var Key: Char);

    procedure ViewInternacionalOrgCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
    procedure ViewMemDatOficialLngCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ViewMemDatWidespreadlLngCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ViewMemDatReligiaCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure ViewCountriesHolidaysCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure ViewMemDatTimeZoneCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure ViewMemDataInternacionalOrgCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure ViewCountriesCarSpeedInfoCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
      
    procedure ViewCountryEMBASSIESCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);

    procedure ViewCountryEMBASSIESInUkraineForRepresentFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TabVisaShow(Sender: TObject);
    procedure TabAmbasadaShow(Sender: TObject);
    procedure DocumVisaBtnClick(Sender: TObject);
    procedure ExtLookupTranslateLngDescriptPropertiesInitPopup(
      Sender: TObject);
    procedure ExtLookupTranslateLngDescriptPropertiesCloseUp(
      Sender: TObject);
    procedure ButCountryLngClick(Sender: TObject);
    procedure ButCountryOficialLngClick(Sender: TObject);
    procedure butAddInternacionalOrgClick(Sender: TObject);
    procedure butDelInternacionalOrgClick(Sender: TObject);
    procedure butShowProvinciesDictClick(Sender: TObject);
    procedure butDicLanguagesClick(Sender: TObject);
    procedure butDicReligionsClick(Sender: TObject);
    procedure butTimeZoneClick(Sender: TObject);
    procedure butDicPowerVoltClick(Sender: TObject);
    procedure butDicFregClick(Sender: TObject);
    procedure butDicCarTypeClick(Sender: TObject);
    procedure butDicCountrySectionitemClick(Sender: TObject);
    procedure butDelCountryTypeSectionitemClick(Sender: TObject);
    procedure butEditCountryTypeSectionitemClick(Sender: TObject);
    procedure butRefreshSectionitemClick(Sender: TObject);
    procedure butNewSectionClick(Sender: TObject);
    procedure butNewSectionItemClick(Sender: TObject);
    procedure butMoveUpSectionClick(Sender: TObject);
    procedure butMoveDownSectionClick(Sender: TObject);
    procedure butDelSectionItemClick(Sender: TObject);
    procedure butRefreshCounryDesriptClick(Sender: TObject);
    procedure butMoveUpSectionitemClick(Sender: TObject);
    procedure butMoveDownSectionitemClick(Sender: TObject);
    procedure butAddCountrySectionitemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeTemplateDecriptDblClick(Sender: TObject);
    procedure butNewSection2Click(Sender: TObject);
    procedure butNewSectionItem2Click(Sender: TObject);

    procedure TreeTemplateDecriptGetNodeImageIndex(
      Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
      AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure TreeTemplateDecriptFocusedNodeChanged(
      Sender: TcxCustomTreeList; APrevFocusedNode,
      AFocusedNode: TcxTreeListNode);
    procedure butEditSectionItemClick(Sender: TObject);
    procedure TreeTemplateDecriptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButShowLogClick(Sender: TObject);
    procedure TabConsulateShow(Sender: TObject);
    procedure ButCountrySecDescrLngClick(Sender: TObject);

    procedure CheckElemClick(Sender: TObject);
    procedure PMTestPopup(Sender: TObject);

  private
    FPathToImage:string;
    FPathToHtml:string;
    FLngIdent : TLngIdentArr;
    FCanUpdate : Boolean;
    FElem_MemDatInternacionalOrg:TDBShemaView;
    FElem_MDCountryDescrSection:TDBShemaView;
    FCurrManager : integer;

    function  FGetAllPathToHTMLDescriptFileForNode( Node:TcxTreeListNode ):TStringList;
    function  FCheckFindFileTranslateForLngId( LngId:variant;FileName:String;MessageError:Boolean=true ):Boolean;
    procedure FGetListIdLng;
    procedure FRunEditHtmlDescription(Sender: TObject);
    procedure FPrepareCmbSelectLng( CmbLng:TcxImageComboBox;aLngIdent : TLngIdentArr );
    function  FCheckSelectedLNGForDescriptCountry(ShowMessage:Boolean):Boolean;
    function  FGetFolderIdLng(IdLng:Variant):String;
    function  FGetRootCurrentPathToCountryDescriptHTML:String;
    function  FGetCurrentPathToCountryDescriptIMAGES:Widestring;
    function  FCheckPossibleUpdate:Boolean;
    function  FCheckPossibleAddSubItem( OptAddToTree : TOptAddTreeNode ):Boolean;
    procedure FSyncronizePositionCounrtyDecrSection;
    Function  FGetOptSectionForLevel(aLevel:Integer):TOptAddSection;
    procedure FAddItemSec( OptAddToTree:TOptAddTreeNode );
    procedure FAddItemSection(  OptAddToTree : TOptAddTreeNode; OptAddSect:TOptAddSection );
    procedure FEditItemSection(aNode:TcxTreeListNode);
    function  FShowInsertSectionItem(Elem: TObject): Boolean;
    procedure FUpdateCountryDecript;
    procedure FPrepareMemDataCountryDescript;
    procedure FPRepareElemSectionView( OptAddSect:TOptAddSection );
    procedure FAddValueToMemDataset( aMemDataset:TdxMemData; id:Variant;Name:Variant; AVALUE:Variant );
    procedure FPrepareControlInfo( FieldValue:string;EdValue:TcxCustomTextEdit;EdMeashure:TcxCustomTextEdit=nil );
    procedure FShowDataInf(aData:TRecDataInfoArr);
    procedure FPrepare( aNew:Boolean );
    procedure FDeactive;
    procedure FPrepareCountriesMoveTime;
    procedure FSaveCountriesMoveTime;
    procedure FSaveImageToInfo(IdTypeInfo:Integer; aImg:TImage; aFileName:string; IdValue:Variant );
    procedure FSaveMemDataToInfo( IdTypeInfo:Integer; MemData:TDxMemData );
    procedure FAddValueCountryInfo( IdTypeInfo:Variant; aValue,IdValue,idUnitMeasur:Variant );
    procedure FSaveData(aNew:Boolean);
    procedure FSaveBRCountries(aNew:Boolean);
    function  FSavePrevIdForCountryInfoFor(IdTypeInfo:Integer):TStringList;
    procedure FDeleteFromCountryInfFor( IdTypeInfo:Integer; ListId:TStringList );

    procedure FClearBoxData(MainData:TCxTextEdit; aMeasur:TcxExtLookupCombobox);
    procedure FClearImageinTImage(aImage:TImage);
    procedure FLoadImageinTImage(aImage:TImage);
    procedure RefreshProvinceClick;
    procedure EditSelectedByViewLanguage( Caption:string; ToView:TcxGridDBTableView );
    procedure EditSelectedByViewReligions( Caption:string; ToView:TcxGridDBTableView );
    procedure EditSelectedByViewTimeZone( Caption:string; ToView:TcxGridDBTableView);

    { Private declarations }
  public
    procedure RefreshControls;
    procedure SetParamDescriptElement;
    procedure RefreshControlCountryDescript;
    { Public declarations }
  end;
 procedure LoadImageInf( aImg:TImage; aFileName:string );
 procedure ReadDataCountryInf( var aData:TRecDataInfoArr );
 function  FindDataCountryInfByTypeInf( aData:TRecDataInfoArr;idTypeInfo:Integer ):TRecDataInfoArr;
 procedure SynchoronizeRegionOfUkraineAndAmbasedRegion;
 Procedure ShowEditCountryInfo(aNew:Boolean;PathToImageGountry,PathToHtmlCountry:String; CurrManager:Integer; CanUpdate : Boolean);
 procedure EditSelectedByView( aCaption:WideString; Elem:TDBShemaView;FieldElemName:string; ToView:TcxGridDBTableView; idFieldName,NameField:string; WidthForm:Integer);
var
  FrmEditInfoCountry: TFrmEditInfoCountry;

implementation
uses TestMain, ServModDic;

{$R *.dfm}
Procedure ShowEditCountryInfo(aNew:Boolean;PathToImageGountry,PathToHtmlCountry:String; CurrManager:Integer; CanUpdate : Boolean );
begin
  try
    try
      {Elem_BrCountryQry.View.BeginUpdate;
      Elem_City_Admin_Unit.Tree.BeginUpdate;}
      Elem_City_Admin_Unit.SaveMarkID;
      Elem_BrCountryQry.SaveMarkID;

      Screen.Cursor := crHourGlass;

      Application.CreateForm(TFrmEditInfoCountry, FrmEditInfoCountry);
      FrmEditInfoCountry.FPathToImage := PathToImageGountry;
      FrmEditInfoCountry.FPathToHtml  := PathToHtmlCountry;
      FrmEditInfoCountry.FCanUpdate   := CanUpdate;
      FrmEditInfoCountry.FCurrManager := CurrManager;
      FrmEditInfoCountry.FPrepare( aNew );
    finally
      Screen.Cursor := crDefault;
    end;

    if FrmEditInfoCountry.ShowModal = mrOk then
    begin
      FrmEditInfoCountry.FSaveData(aNew);
      Elem_BrCountryQry.RequeryCurrentRecord;
    end;

  finally
    {Elem_BrCountryQry.View.EndUpdate;
    Elem_City_Admin_Unit.Tree.EndUpdate; }

   // Elem_BrCountryQry.GotoMarkID;
   // Elem_City_Admin_Unit.GotoMarkID;

    //FrmEditInfoCountry.FDeactive;
    FreeAndNil( FrmEditInfoCountry );
  end;
end;

procedure TFrmEditInfoCountry.SetParamDescriptElement;
begin
{  Elem_CountrySectDescrQry.DBClose;
  Elem_CountrySectDescrQry.DBQuerySetParamValue( 'CountryId', Elem_BrCountryQry.GetValueId );
  Elem_CountrySect_ItemDescrQry.DBQuerySetParamValue( 'CountryId', Elem_BrCountryQry.GetValueId);
  Elem_CountrySectDescrQry.DBOpen;
  Elem_CountrySect_ItemDescrQry.DBOpen;
  //UpdateDescriptBtn; }
end;

procedure TFrmEditInfoCountry.FormCreate(Sender: TObject);
 const
  CSSHeader = 'data:text/css;charset=utf-8;base64,';
  CSSBase64 = 'Ym9keSB7YmFja2dyb3VuZC1jb2xvcjpibGFjazt9';
begin

end;

procedure TFrmEditInfoCountry.FPrepareControlInfo( FieldValue:string;EdValue:TcxCustomTextEdit;EdMeashure:TcxCustomTextEdit=nil );
begin
  EdValue.EditValue :=  Elem_COUNTRIES_INFO.DB.FieldByName(FieldValue).Value;
  if EdMeashure <> nil then
    EdMeashure.EditValue := Elem_COUNTRIES_INFO.DB.FieldByName('ID_UNIT_MEASUR').Value;
end;

procedure TFrmEditInfoCountry.FAddValueToMemDataset( aMemDataset:TdxMemData; id:Variant; Name:Variant; AVALUE:Variant );
begin
  if not aMemDataset.Active then aMemDataset.Open;
  if not aMemDataset.Locate('id', id, []) then aMemDataset.Insert
  else aMemDataset.Edit;

  if aMemDataset.FindField('AVALUE')<>nil then
    aMemDataset.FieldByName('AVALUE').Value := AVALUE;
    
  aMemDataset.FieldByName('id').value := id;
  aMemDataset.FieldByName('Name').Value := Name;
  aMemDataset.Post;
end;

procedure LoadImageInf( aImg:TImage; aFileName:string );
begin
  if FileExists(aFileName) then aImg.Picture.LoadFromFile( aFileName );
end;

procedure SaveImage( aImg:TImage; aFileName:string );
begin
  if FileExists(aFileName) then DeleteFile(aFileName);
  aImg.Picture.SaveToFile( aFileName );
end;

procedure ReadDataCountryInf( var aData:TRecDataInfoArr );
var Len:Integer;
begin
  Elem_COUNTRIES_INFO.DB.First;

  while not Elem_COUNTRIES_INFO.DB.Eof do
  begin
    Len := Length(aData);
    SetLength(aData,len+1);
    aData[len].id:= Elem_COUNTRIES_INFO.GetValueId;
    aData[len].id_TYPE_INFO:= Elem_COUNTRIES_INFO.DB.FieldByName('ID_COUNTRIES_TYPE_INFO').AsInteger;
    aData[len].name:= Elem_COUNTRIES_INFO.DB.FieldByName('NAME').asString;
    aData[len].TableInd:= Elem_COUNTRIES_INFO.DB.FieldByName('TABLE_IND').AsInteger;
    aData[len].IdValue:= Elem_COUNTRIES_INFO.DB.FieldByName('ID_VALUE').AsInteger;
    aData[len].idUnitMeasur:= Elem_COUNTRIES_INFO.DB.FieldByName('ID_UNIT_MEASUR').AsInteger;
    aData[len].aValue:= Elem_COUNTRIES_INFO.DB.FieldByName('AVALUE').asString;
    aData[len].AddValue := Elem_COUNTRIES_INFO.DB.FieldByName('ADDVALUE').asString;

    Elem_COUNTRIES_INFO.DB.Next;
  end;
end;

function FindDataCountryInfByTypeInf( aData:TRecDataInfoArr;idTypeInfo:Integer ):TRecDataInfoArr;
var i:Integer;
    Len:Integer;
begin
  SetLength(result, 0);
  for i:=0 to Length(aData)-1 do
  begin
    if aData[i].id_TYPE_INFO = idTypeInfo then
    begin
      Len := Length(result);
      SetLength(result,len+1);
      result[len] := aData[i];
    end;
  end;
end;

procedure TFrmEditInfoCountry.FShowDataInf( aData:TRecDataInfoArr );
var i:Integer;
    AVAlue:Variant;
begin
  ChPhoneCode.Checked := False;
  Elem_COUNTRIES_INFO.DB.First;
  for i:=0 to Length(aData)-1 do
  begin
    if aData[i].id_TYPE_INFO = 1 then
      LoadImageInf( ImgGerb, FPathToImage+'GERB\'+  aData[i].aValue );

    if aData[i].id_TYPE_INFO = 2 then
      LoadImageInf( ImgFlag, FPathToImage+'FLAG\' + aData[i].aValue  );

    if aData[i].id_TYPE_INFO = 3 then EdOficialName.EditValue := aData[i].aValue;
    if aData[i].id_TYPE_INFO = 4 then FrameSearchCityCapital.SetValue( aData[i].IdValue ); //CmbCapitalCity.EditValue := aData[i].IdValue;
    if aData[i].id_TYPE_INFO = 5 then CmbFormGovernment.EditValue := aData[i].IdValue;
    if aData[i].id_TYPE_INFO = 6 then
    begin
      CmbCurrency.EditValue := aData[i].IdValue;
      EdCurrencyShort.Text := aData[i].AddValue;
    end;

    if aData[i].id_TYPE_INFO = 7 then
    begin
      EdPeople.EditValue := aData[i].aValue;
      CmbUnitMeasurPeople.EditValue := aData[i].idUnitMeasur;
    end;

    if aData[i].id_TYPE_INFO = 9 then
    begin
      EdSquareCountry.EditValue := aData[i].aValue;
      CmbUnitMeasurSquare.EditValue := aData[i].idUnitMeasur;
    end;

    if aData[i].id_TYPE_INFO = 10 then EdCarCode.EditValue := aData[i].aValue;
    if aData[i].id_TYPE_INFO = 11 then EdDomen.EditValue := aData[i].aValue;

    if aData[i].id_TYPE_INFO = 12 then
      FAddValueToMemDataset( MemDataTimeZone, aData[i].IdValue, aData[i].AddValue, null ); 

    if aData[i].id_TYPE_INFO = 13 then EdPeopleForYear.EditValue := aData[i].aValue;
    if aData[i].id_TYPE_INFO = 14 then EdPhoneCode.EditValue := aData[i].aValue;
    if aData[i].id_TYPE_INFO = 15 then
    begin
      ChPhoneCode.Checked := True;
      if aData[i].aValue = null then RbCheckNotHavePhoneCode.Checked:=True
      else
      begin
        RbCheckJoinPhoneCode.Checked := True;
        EdJoinPhoneCode.EditValue := aData[i].aValue;
      end;
    end;

    if aData[i].id_TYPE_INFO = 16 then CmbPowerVoltage.EditValue := aData[i].IdValue;
    if aData[i].id_TYPE_INFO = 17 then CmbPowerFrequency.EditValue := aData[i].IdValue;
    if aData[i].id_TYPE_INFO = 18 then CmbPowerTypePlug.EditValue := aData[i].IdValue;
    if aData[i].id_TYPE_INFO = 19 then
    begin
      if aData[i].aValue <> '' then AVAlue := StrToDate( aData[i].aValue )
      else AVAlue := null;

      FAddValueToMemDataset( MemDatInternacionalOrg, aData[i].IdValue, aData[i].AddValue, AVAlue );
    end;

    if aData[i].id_TYPE_INFO = 20 then
      FAddValueToMemDataset( MemDatOficialLng, aData[i].IdValue, aData[i].AddValue, null );
    if aData[i].id_TYPE_INFO = 21 then
      FAddValueToMemDataset( MemDataWidespreadlLng, aData[i].IdValue, aData[i].AddValue, null);
    if aData[i].id_TYPE_INFO = 22 then
      FAddValueToMemDataset( MemDatReligia, aData[i].IdValue, aData[i].AddValue, null );
    if aData[i].id_TYPE_INFO = 23 then
    begin
      EdTerritoryLengthWE.EditValue := aData[i].aValue;
      CmbUnitMeashureTerritoryLengthWE.EditValue := aData[i].idUnitMeasur;
    end;

    if aData[i].id_TYPE_INFO = 24 then
    begin
      EdTerritoryLengthNS.EditValue := aData[i].aValue;
      CmbxUnitMeashureTerritoryLengthNS.EditValue := aData[i].idUnitMeasur;
    end;
    if aData[i].id_TYPE_INFO = 25 then
      LoadImageInf( ImgLicensePlate, FPathToImage+'CARNUMBER\'+ aData[i].aValue  );

    if aData[i].id_TYPE_INFO = 26 then CmbRoadTraffic.EditValue := aData[i].aValue;
    if aData[i].id_TYPE_INFO = 27 then
    begin
      EdLengthBoundary.EditValue := aData[i].aValue;
      CmbUnitMeashureLengthBoundary.EditValue := aData[i].idUnitMeasur;
    end;

    if aData[i].id_TYPE_INFO = 28 then
    begin
      EdLengthCoastline.EditValue := aData[i].aValue;
      CmbUnitMeashureLengthBoundary.EditValue := aData[i].idUnitMeasur;
    end;
    Elem_COUNTRIES_INFO.DB.Next;
  end;

end;

procedure TFrmEditInfoCountry.FAddValueCountryInfo( IdTypeInfo:Variant; aValue, IdValue, idUnitMeasur:Variant );
begin

  if ( aValue = null ) and ( IdValue=null ) then
  begin
    if Elem_COUNTRIES_INFO.DB.Locate('ID_COUNTRIES_TYPE_INFO',IdTypeInfo,[]) then
      Elem_COUNTRIES_INFO.DBDelete(false);

    Exit;
  end;
  //***********************************
  if (aValue <> null) then
  begin
    if Elem_COUNTRIES_INFO.DB.Locate('ID_COUNTRIES_TYPE_INFO',IdTypeInfo,[]) then
      Elem_COUNTRIES_INFO.DB.Edit
    else Elem_COUNTRIES_INFO.DB.Insert;
  end;
  //***********************************
  if (IdValue <> null) then
  begin
    if Elem_COUNTRIES_INFO.DB.Locate('ID_COUNTRIES_TYPE_INFO;ID_VALUE', VarArrayOf( [ IdTypeInfo, IdValue ] ),[]) then
      Elem_COUNTRIES_INFO.DB.Edit
    else Elem_COUNTRIES_INFO.DB.Insert;
  end;
  //***********************************
  if Elem_COUNTRIES_INFO.DB.State in [dsInsert,dsEdit] then
  begin
    Elem_COUNTRIES_INFO.DB.FieldByName('ID_COUNTRIES_TYPE_INFO').Value := IdTypeInfo;
    Elem_COUNTRIES_INFO.DB.FieldByName('AVALUE').Value := aValue;
    Elem_COUNTRIES_INFO.DB.FieldByName('ID_VALUE').Value := IdValue;
    Elem_COUNTRIES_INFO.DB.FieldByName('ID_UNIT_MEASUR').Value := idUnitMeasur;
    Elem_COUNTRIES_INFO.DB.Post;
  end;
end;

procedure TFrmEditInfoCountry.FSaveImageToInfo( IdTypeInfo:Integer; aImg:TImage; aFileName:string; IdValue:Variant );
begin
  SaveImage( aImg, aFileName );
  FAddValueCountryInfo( IdTypeInfo, ExtractFileName(aFileName), IdValue,null );
end;

function TFrmEditInfoCountry.FSavePrevIdForCountryInfoFor( IdTypeInfo:Integer ):TStringList;
begin
  result := TStringList.Create;
  try

    Elem_COUNTRIES_INFO.SaveBookmark;
    Elem_COUNTRIES_INFO.DB.DisableControls;
    Elem_COUNTRIES_INFO.DB.First;
    While not Elem_COUNTRIES_INFO.DB.Eof do
    begin
      if Elem_COUNTRIES_INFO.DB.FieldByName('ID_COUNTRIES_TYPE_INFO').AsInteger = IdTypeInfo then
        result.Add( Elem_COUNTRIES_INFO.DB.FieldByName('ID_VALUE').AsString );

      Elem_COUNTRIES_INFO.DB.Next;
    end;
  finally
    Elem_COUNTRIES_INFO.GotoBookmark;
    Elem_COUNTRIES_INFO.DB.EnableControls;
  end;
end;

procedure TFrmEditInfoCountry.FDeleteFromCountryInfFor( IdTypeInfo:Integer; ListId:TStringList );
var i:Integer;
begin
 try
    Elem_COUNTRIES_INFO.SaveBookmark;
    Elem_COUNTRIES_INFO.DB.DisableControls;
    Elem_COUNTRIES_INFO.DB.First;
    for i:=0 to ListId.Count-1 do
    begin
      if Elem_COUNTRIES_INFO.DB.Locate('ID_COUNTRIES_TYPE_INFO;ID_VALUE', VarArrayOf( [ IdTypeInfo, ListId.Strings[i] ] ),[]) then
        Elem_COUNTRIES_INFO.DBDelete(false);
    end;
  finally
    Elem_COUNTRIES_INFO.GotoBookmark;
    Elem_COUNTRIES_INFO.DB.EnableControls;
  end;
end;

procedure TFrmEditInfoCountry.FSaveMemDataToInfo( IdTypeInfo:Integer; MemData:TDxMemData );
var i:Integer;
    SaveId:TStringList;
    FindInd:Integer;
    AValue:Variant;
begin
  if not MemData.Active then exit;
  MemData.First;
  try
    SaveId := FSavePrevIdForCountryInfoFor( IdTypeInfo );

    While not MemData.Eof do
    begin

      if MemData.FindField('AVALUE')<>nil then
        AValue := MemData.FieldByName('AVALUE').Value
      else AValue:=null;

      FAddValueCountryInfo( IdTypeInfo, AValue, MemData.FieldByName('id').Value, null );
      FindInd := SaveId.IndexOf( MemData.FieldByName('id').AsString );
      if FindInd<> -1 then
        SaveId.Delete( FindInd );
      MemData.Next;
    end;

    FDeleteFromCountryInfFor( IdTypeInfo, SaveId );
  finally
    SaveId.Free;
  end;
end;

procedure TFrmEditInfoCountry.FSaveBRCountries(aNew:Boolean);
begin
  if not aNew then Elem_BrCountryQry.DB.Edit
  else Elem_BrCountryQry.DB.Insert;

  Elem_BrCountryQry.DB.FieldByName('NAME').AsString := EdName.Text;
  Elem_BrCountryQry.DB.FieldByName('SHOWWEB').AsBoolean := ChShwOnWeb.Checked;
  Elem_BrCountryQry.DB.FieldByName('NEEDVISA').AsBoolean := CbBoxNeedVisa.Checked;
  Elem_BrCountryQry.DB.Post;
end;

procedure TFrmEditInfoCountry.FSaveData(aNew:Boolean);
var ImgTemplateFile:string;
    CurrValue:Variant;
begin
  FSaveBRCountries( aNew );

  ImgTemplateFile :=  AddNolForLengthNumber( Elem_BrCountryQry.GetValueIdStr,4);
  FSaveImageToInfo( 1, ImgGerb, FPathToImage+'GERB\'+  'G'+ImgTemplateFile+'.png',null );
  FSaveImageToInfo( 2, ImgFlag, FPathToImage+'FLAG\' + 'F'+ImgTemplateFile+'.png',null );

  FAddValueCountryInfo( 3, EdOficialName.EditValue, null,null );
  FAddValueCountryInfo( 4, null, FrameSearchCityCapital.EditValue, null );
  FAddValueCountryInfo( 5, null, CmbFormGovernment.EditValue,null );
  FAddValueCountryInfo( 6, null, CmbCurrency.EditValue,null );
  FAddValueCountryInfo( 7, EdPeople.EditValue, null,  CmbUnitMeasurPeople.EditValue);
  FAddValueCountryInfo( 9, EdSquareCountry.EditValue, null,  CmbUnitMeasurSquare.EditValue);
  FAddValueCountryInfo( 10, EdCarCode.EditValue, null, null);
  FAddValueCountryInfo( 11, EdDomen.EditValue, null, null);
  FSaveMemDataToInfo( 12, MemDataTimeZone);

  FAddValueCountryInfo( 13, EdPeopleForYear.EditValue, null, null);
  FAddValueCountryInfo( 14, EdPhoneCode.EditValue, null, null);

  if ( ChPhoneCode.Checked ) and ( RbCheckJoinPhoneCode.Checked ) then CurrValue:=EdJoinPhoneCode.EditValue
  else CurrValue := null;
  FAddValueCountryInfo( 15, CurrValue, null, null);

  FAddValueCountryInfo( 16, null, CmbPowerVoltage.EditValue,null );
  FAddValueCountryInfo( 17, null, CmbPowerFrequency.EditValue,null );
  FAddValueCountryInfo( 18, null, CmbPowerTypePlug.EditValue,null );
  FSaveMemDataToInfo( 19, MemDatInternacionalOrg);
  FSaveMemDataToInfo( 20, MemDatOficialLng);
  FSaveMemDataToInfo( 21, MemDataWidespreadlLng);
  FSaveMemDataToInfo( 22, MemDatReligia);
  FAddValueCountryInfo( 23, EdTerritoryLengthWE.EditValue, null, CmbUnitMeashureTerritoryLengthWE.EditValue );
  FAddValueCountryInfo( 24, EdTerritoryLengthNS.EditValue, null, CmbxUnitMeashureTerritoryLengthNS.EditValue );
  FSaveImageToInfo( 25, ImgLicensePlate, FPathToImage+'CARNUMBER\'+  'LP'+ImgTemplateFile+'.png',null );
  FAddValueCountryInfo( 26, CmbRoadTraffic.EditValue, null, null);
  FAddValueCountryInfo( 27, EdLengthBoundary.EditValue, null, CmbUnitMeashureLengthBoundary.EditValue );
  FAddValueCountryInfo( 28, EdLengthCoastline.EditValue, null, CmbUnitMearhureLengthCoastline.EditValue );

  FSaveCountriesMoveTime;
end;

procedure TFrmEditInfoCountry.FPrepareCountriesMoveTime;
begin
  FrameMoveToTimeZoneSummer.Prepare(Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('MONTH_1').Value,
                                    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('TYPEMOVED_1').Value,
                                    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('AVALUE_1').Value);

  FrameMoveToTimeZoneStandart.Prepare(Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('MONTH_2').Value,
                                      Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('TYPEMOVED_2').Value,
                                      Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('AVALUE_2').Value);

  ChBoxSelectSammerTimeUsed.Checked := not Elem_COUNTRIES_MOVE_TIME.DB.IsEmpty;
end;

procedure TFrmEditInfoCountry.FSaveCountriesMoveTime;
begin
  if ChBoxSelectSammerTimeUsed.Checked then
  begin
    if Elem_COUNTRIES_MOVE_TIME.DB.IsEmpty then
      Elem_COUNTRIES_MOVE_TIME.DB.Insert
    else Elem_COUNTRIES_MOVE_TIME.DB.Edit;

    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('MONTH_1').Value :=FrameMoveToTimeZoneSummer.GetValue.Month;
    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('TYPEMOVED_1').Value :=FrameMoveToTimeZoneSummer.GetValue.TypeSelect;
    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('AVALUE_1').Value :=FrameMoveToTimeZoneSummer.GetValue.Value;

    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('MONTH_2').Value :=FrameMoveToTimeZoneStandart.GetValue.Month;
    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('TYPEMOVED_2').Value :=FrameMoveToTimeZoneStandart.GetValue.TypeSelect;
    Elem_COUNTRIES_MOVE_TIME.DB.FieldByName('AVALUE_2').Value :=FrameMoveToTimeZoneStandart.GetValue.Value;

    Elem_COUNTRIES_MOVE_TIME.DB.Post;
  end
   else
    if not Elem_COUNTRIES_MOVE_TIME.DB.IsEmpty then
      Elem_COUNTRIES_MOVE_TIME.DBDelete(False);
end;

procedure TFrmEditInfoCountry.FPrepare(aNew:Boolean);
var DataInf:TRecDataInfoArr;
    PropCountryInf : TPropertyDescriptWeb;
begin
  Elem_COUNTRIES_CAR_SPEED_INFO.UpdateForm :=True;
  Elem_Language.DBOpen;
  Elem_Religion.DBOpen;
  Elem_UNIT_MEASUR.DBOpen;
  Elem_Form_Government.DBOpen;
  Elem_Country_Holidays.DBOpen;
  Elem_Power_Volt_Freq.DBOpen;
  Elem_TypePowSockets.DBOpen;
  Elem_CurrencyQry.DBOpen;
  Elem_TIME_ZONE.DBOpen;
  Elem_COUNTRIES_MOVE_TIME.DBOpen;
  Elem_InternacionalOrg.DBOpen;
  Elem_DictSectQry.DBOpen;
  Elem_DictSect_ItemQry.DBOpen;

  Elem_CountrySectDescrQry.DBOpen;

  Elem_CAR_TYPE_INFO.DBOpen;
  Elem_COUNTRIES_CAR_SPEED_INFO.DBOpen;
  Elem_EmbassyList.DBOpen;
  Elem_CNTREMBASSIES.DBOpen;
  Elem_CNTREMBASSIESRepresent.DBOpen; // Dataset Same as Elem_CNTREMBASSIES Elements
  Elem_CNTREMBAS_INPROVINCE.DBOpen;
  Elem_ProvinceOfUkraineQry.DBOpen;
  Elem_SelVisaCentersQry.DBOpen;

  SetParamDescriptElement;

  Elem_InternacionalOrg.AddCellDblClick( ViewInternacionalOrgCellDblClick );
  Elem_Country_Holidays.AddCellDblClick( ViewCountriesHolidaysCellDblClick );
  Elem_COUNTRIES_CAR_SPEED_INFO.AddCellDblClick( ViewCountriesCarSpeedInfoCellDblClick );
  Elem_CNTREMBASSIES.AddCellDblClick( ViewCountryEMBASSIESCellDblClick );

  Elem_CNTREMBASSIESRepresent.AddFocusedRecordChanged( ViewCountryEMBASSIESInUkraineForRepresentFocusedRecordChanged );

  Elem_ProvinceOfUkraineQry.SetFunctionSelectCheckInView( SynchoronizeRegionOfUkraineAndAmbasedRegion );
  Elem_CountrySectDescrQry.SetTree( TreeTemplateDecript );

  FElem_MDCountryDescrSection := TDBShemaView.Create( MDCountryDescrSection, nil, 'MDCountryDescrSection', 'ID','' );
  FElem_MDCountryDescrSection.DBOpen;

  Elem_COUNTRIES_INFO.Requery;

  SetPropInCxExtLookupComboBox( CmbFormGovernment, TcxGridDBTableView( Elem_Form_Government.ViewList) ,'NAME',Elem_Form_Government.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbUnitMeasurSquare,TcxGridDBTableView( Elem_UNIT_MEASUR.ViewList) ,'SHORT',Elem_UNIT_MEASUR.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbUnitMeashureTerritoryLengthWE,TcxGridDBTableView( Elem_UNIT_MEASUR.ViewList ),'SHORT',Elem_UNIT_MEASUR.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbxUnitMeashureTerritoryLengthNS,TcxGridDBTableView( Elem_UNIT_MEASUR.ViewList ),'SHORT',Elem_UNIT_MEASUR.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbUnitMeasurPeople,TcxGridDBTableView( Elem_UNIT_MEASUR.ViewList ),'SHORT',Elem_UNIT_MEASUR.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbUnitMeashureLengthBoundary,TcxGridDBTableView( Elem_UNIT_MEASUR.ViewList ),'SHORT',Elem_UNIT_MEASUR.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbUnitMearhureLengthCoastline,TcxGridDBTableView( Elem_UNIT_MEASUR.ViewList ) ,'SHORT',Elem_UNIT_MEASUR.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbCurrency,TcxGridDBTableView( Elem_CurrencyQry.ViewList ) ,'CURRENCYNAME',Elem_CurrencyQry.FieldKod,True,false );

  SetPropInCxExtLookupComboBox( CmbPowerVoltage,TcxGridDBTableView( Elem_Power_Volt_Freq.ViewList ) ,'MEASURNAME',Elem_Power_Volt_Freq.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbPowerFrequency,TcxGridDBTableView( Elem_Power_Volt_Freq.ViewList ) ,'MEASURNAME',Elem_Power_Volt_Freq.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbPowerTypePlug,TcxGridDBTableView( Elem_TypePowSockets.ViewList ) ,'NAME',Elem_TypePowSockets.FieldKod,True,false );
  //SetPropInCxExtLookupComboBox( CmbCapitalCity,TcxGridDBTableView( Elem_City_Admin_Unit.ViewList ) ,'NAME',Elem_City_Admin_Unit.FieldKod,True,false );
  //SetPropInCxExtLookupComboBox( ExtLookupTranslateLngDescript,TcxGridDBTableView( Elem_Language.ViewList ) ,'NAME',Elem_Language.FieldKod,True,false );
  FrameSearchCityCapital.Prepare( Elem_BrCountryQry,False, self.FCanUpdate, FrameSearchCityCapital.Width * 2,nil, nil, Elem_BrCountryQry.View.Styles );
  FrameSearchCityCapital.EdSearchCity.Enabled := not aNew;
  PropCountryInf := PepareFrameDesription( Elem_CountrySectDescrQry, FGetRootCurrentPathToCountryDescriptHTML,FGetCurrentPathToCountryDescriptIMAGES, Elem_BrCountryQry.View.Styles );

  FrameCountryDescriptionWebHTML.Prepare( PropCountryInf );

  if not aNew then
  begin
    EdName.Text :=  Elem_BrCountryQry.DB.fieldByName('name').AsString;
    EdAlfa2.Text :=  Elem_BrCountryQry.DB.fieldByName('code2').AsString;
    EdAlfa3.Text :=  Elem_BrCountryQry.DB.fieldByName('code3').AsString;
    EdNumeric.Text :=  Elem_BrCountryQry.DB.fieldByName('ccode').AsString;
    CbBoxNeedVisa.Checked := Elem_BrCountryQry.DB.fieldByName('NEEDVISA').AsBoolean;

    ReadDataCountryInf( DataInf );
    FShowDataInf( DataInf );
    FPrepareCountriesMoveTime;
  end;

  FElem_MemDatInternacionalOrg := TDBShemaView.Create( MemDatInternacionalOrg, ViewMemDataInternacionalOrg, 'MemDatInternacionalOrg', 'RecId', '' );
  FElem_MemDatInternacionalOrg.UpdateForm :=True;
  FElem_MemDatInternacionalOrg.DBOpen;

  PageControlCounry.ActivePage := TabCountryInfo;
  PageControlCountryInfo.ActivePage := TabStatistic;
end;

procedure TFrmEditInfoCountry.FDeactive;
begin
  Elem_InternacionalOrg.AddCellDblClick( nil );
  Elem_Country_Holidays.AddCellDblClick( nil );
  Elem_COUNTRIES_CAR_SPEED_INFO.AddCellDblClick( nil );
  Elem_CNTREMBASSIES.AddCellDblClick( nil );

  Elem_CNTREMBASSIESRepresent.ClearFilterOnView;
  Elem_CNTREMBASSIESRepresent.AddFocusedRecordChanged( nil );

  //SetFilterOnWievForManyColumns( TcxGridDBTableView(GridEmbassiesInUkraine.Levels[0].GridView),['FOROWNERVISA','OUREMBASSY'],['T','T'],['<>','<>'],[fboAnd,fboAnd],fboOr, False);
end;

procedure TFrmEditInfoCountry.RefreshControls;
begin
  SetEnabledChildControls( GroupBoxPhoneCode, ChPhoneCode.Checked, [ChPhoneCode], []);

  FrameMoveToTimeZoneSummer.SetEnabled( ChBoxSelectSammerTimeUsed.Checked );
  FrameMoveToTimeZoneStandart.SetEnabled( ChBoxSelectSammerTimeUsed.Checked );

end;

procedure TFrmEditInfoCountry.FormShow(Sender: TObject);
begin
  RefreshControls;
  RefreshProvinceClick;
  RefreshControlCountryDescript;
  TreeTemplateDecript.FullExpand;
end;

procedure TFrmEditInfoCountry.ChBoxSelectSammerTimeUsedClick(
  Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmEditInfoCountry.ChPhoneCodeClick(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmEditInfoCountry.CmbCurrencyPropertiesChange(Sender: TObject);
begin
  EdCurrencyShort.EditValue := Elem_CurrencyQry.DB.FieldByName('CURRENCYSHORT').AsString;
end;

procedure TFrmEditInfoCountry.CmbPowerVoltagePropertiesInitPopup(
  Sender: TObject);
begin
  Elem_Power_Volt_Freq.SetFilterOnViewList(['ID_CITY_ADM_UNT_ITEMS_TYPE'],[0],['='],fboOr);
end;

procedure TFrmEditInfoCountry.CmbPowerFrequencyPropertiesInitPopup(
  Sender: TObject);
begin
  Elem_Power_Volt_Freq.SetFilterOnViewList(['ID_CITY_ADM_UNT_ITEMS_TYPE'],[1],['='],fboOr);
end;

procedure ReadSynchronizeFromMemDataWithView( Elem:TDBShemaView; ToView:TcxGridDBTableView; idFieldName:String );
var i:Integer;
    FirstColForSelect:TcxGridDBColumn;
    indColSel:Integer;
    indIdCol:Integer;
    CurrRecordIndex:Integer;
    currId:Variant;
begin
  FirstColForSelect :=Elem.FindFirstCheckSelectedColumn;
  indColSel := FirstColForSelect.Index;
  indIdCol  := ToView.GetColumnByFieldName(idFieldName).Index;

  Elem.ClearCheckRecordBySelectColumn(FirstColForSelect);

  for i:=0 to ToView.DataController.RowCount-1 do
  begin
    currId:=ToView.ViewData.Rows[i].Values[indIdCol];
    if Elem.DB.locate(Elem.FieldKod,currId,[]) then
     Elem.AddCheckRecordBySelectColumn( Elem.View.Columns[indColSel], currId );
  end;
end;

procedure EditSelectedByView( aCaption:WideString; Elem:TDBShemaView;FieldElemName:string; ToView:TcxGridDBTableView; idFieldName,NameField:string; WidthForm:Integer);
var i:Integer;
    FirstColForSelect:TcxGridDBColumn;
    indColSel:Integer;
    indColId:Integer;
    indColName:Integer;
    currId:Variant;
    CurrName:Variant;
    FindIndSave:Integer;
    SaveIdBefore:TStringList;
    ToDataset:TDataset;
begin
  if not ToView.DataController.DataSet.Active then ToView.DataController.DataSet.Open;
  try
    SaveIdBefore := CreateSaveListId( ToView, idFieldName );
    ReadSynchronizeFromMemDataWithView( Elem, ToView, idFieldName );
    
    if not ShowSelect(aCaption, Elem.View, 'Ok','Відмінити',WidthForm)<>null then
    begin
      try
        ToView.BeginUpdate;
        ToDataset := ToView.DataController.DataSet;
        Elem.SaveBookmark;
        Elem.DB.DisableControls;
        FirstColForSelect :=Elem.FindFirstCheckSelectedColumn;
        indColSel := FirstColForSelect.Index;
        indColId := Elem.View.GetColumnByFieldName(Elem.FieldKod).Index;
        indColName := Elem.View.GetColumnByFieldName(FieldElemName).Index;

        if indColSel <> -1 then
        for i:=0 to Elem.GetObjectCheckSelectedViewRow.Count-1 do
        begin
          currId:= PCheckViewColumn( Elem.GetObjectCheckSelectedViewRow.Items[i] ).idValue;
          if Elem.DB.locate( Elem.FieldKod,currId ,[] ) then
          begin
            CurrName := Elem.DB.FieldByName(FieldElemName).AsString;
            if not ToDataset.Locate(idFieldName,currId,[]) then
            begin
              ToDataset.Append;
              ToDataset.FieldByName(idFieldName).value :=  currId;
            end
            else
            begin
              ToDataset.Edit;
              FindIndSave:=SaveIdBefore.IndexOf( VarToStr( currId ) );
              if FindIndSave <> -1 then SaveIdBefore.Delete(FindIndSave);
            end;

            ToDataset.FieldByName(NameField).AsString :=  CurrName;
            ToDataset.Post;
          end;
        end;
        //**********Delete***Unchecked******************
        for i:=0 to SaveIdBefore.Count-1 do
          if ToDataset.Locate(idFieldName, SaveIdBefore.Strings[i],[] ) then ToDataset.Delete;
        //**********Goto First in View******************
        if ToView.ViewData.RowCount<>0 then
        begin
          ToView.DataController.GotoFirst;
          ToView.ViewData.Rows[0].Focused:=True;
          ToView.ViewData.Rows[0].Selected:=True;
        end;
        //**********************************************
      finally

        Elem.GotoBookmark;
        Elem.DB.EnableControls;
        ToView.EndUpdate;
      end;
    end;

  finally
    SaveIdBefore.Free;
  end;

end;

procedure TFrmEditInfoCountry.EditSelectedByViewLanguage(Caption:string; ToView:TcxGridDBTableView);
var aView:TcxGridDBTableView;
    FSaveCellDblClick: TcxGridCellClickEvent;
begin
  try
    aView := Elem_Language.View;
    FSaveCellDblClick := aView.OnCellDblClick;
    Elem_Language.SetView( DMServDic.ViewLanguage );
    EditSelectedByView( Caption, Elem_Language, 'name', ToView,'id','name', 300 );
  finally
    Elem_Language.SetView( aView );
    aView.OnCellDblClick := FSaveCellDblClick;
  end;
end;

procedure TFrmEditInfoCountry.EditSelectedByViewReligions( Caption:string; ToView:TcxGridDBTableView);
var aView:TcxGridDBTableView;
    FSaveCellDblClick: TcxGridCellClickEvent;
begin
  try
    aView := Elem_Religion.View;
    FSaveCellDblClick := aView.OnCellDblClick;
    Elem_Religion.SetView( DMServDic.ViewReligion );
    EditSelectedByView( Caption, Elem_Religion, 'name', ToView,'id','name', 300 );
  finally
    Elem_Religion.SetView( aView );
    aView.OnCellDblClick := FSaveCellDblClick;
  end;
end;

procedure TFrmEditInfoCountry.EditSelectedByViewTimeZone( Caption:string; ToView:TcxGridDBTableView);
var aView:TcxGridDBTableView;
    FSaveCellDblClick: TcxGridCellClickEvent;
begin
  try
    aView := Elem_TIME_ZONE.View;
    FSaveCellDblClick := aView.OnCellDblClick;
    Elem_TIME_ZONE.SetView( DMServDic.ViewTimeZone );
    EditSelectedByView( Caption, Elem_TIME_ZONE, 'name', ToView,'id','name', 300 );
  finally
    Elem_TIME_ZONE.SetView( aView );
    aView.OnCellDblClick := FSaveCellDblClick;
  end;
end;

procedure TFrmEditInfoCountry.butEditOficialLngClick(Sender: TObject);
var aView:TcxGridDBTableView;
begin
  EditSelectedByViewLanguage('Вибір офіціних мов',ViewMemDatOficialLng);
end;

procedure TFrmEditInfoCountry.butEditWidespreadLngClick(Sender: TObject);
begin
  EditSelectedByViewLanguage('Вибір поширених мов',ViewMemDatWidespreadlLng);
end;

procedure TFrmEditInfoCountry.butEditReligiaClick(Sender: TObject);
begin
  EditSelectedByViewReligions('Вибір основних релігій',ViewMemDatReligia );
end;

procedure TFrmEditInfoCountry.butEditTimeZoneClick(Sender: TObject);
begin
  EditSelectedByViewTimeZone('Вибір часових зон', ViewMemDatTimeZone );
end;

procedure TFrmEditInfoCountry.butEditInternacionalOrgClick(
  Sender: TObject);
begin
  FElem_MemDatInternacionalOrg.DB.Edit;
end;

procedure TFrmEditInfoCountry.butAddInternacionalOrgClick(Sender: TObject);
begin
  FElem_MemDatInternacionalOrg.DB.Insert;
end;

procedure TFrmEditInfoCountry.butDelInternacionalOrgClick(Sender: TObject);
begin
  FElem_MemDatInternacionalOrg.DB.Delete;
end;

procedure TFrmEditInfoCountry.butAddCelebrationClick(Sender: TObject);
begin
  ShowSelectHoliday( True, Elem_Country_Holidays);
end;

procedure TFrmEditInfoCountry.butEditCelebrationClick(Sender: TObject);
begin
  ShowSelectHoliday( False, Elem_Country_Holidays);
end;

procedure TFrmEditInfoCountry.butDelCelebrationClick(Sender: TObject);
begin
  Elem_Country_Holidays.DB.Delete;
end;

procedure TFrmEditInfoCountry.CmbPowerTypePlugPropertiesChange(
  Sender: TObject);
begin
  Elem_TypePowSockets.DBLoadToImageFromBlobData('ICON', ImgPowerPlug, pfPng );
end;

procedure TFrmEditInfoCountry.FClearImageinTImage(aImage:TImage);
begin
  if aImage.Picture <> nil then
   if MyShowMessageDlg('Ви дійсно хочете видалити картинку?',mtConfirmation,but_OK_CANCEL)= res_OK then
     aImage.Picture:=nil;
end;

procedure TFrmEditInfoCountry.FClearBoxData( MainData:TCxTextEdit; aMeasur:TcxExtLookupCombobox );
begin
  if ( MainData.EditValue <> null ) or ( (aMeasur<>nil)and(aMeasur.EditValue<> null) ) then
    if MyShowMessageDlg('Ви дійсно хочете видалити дані?',mtConfirmation,but_OK_CANCEL)= res_OK then
    begin
      MainData.Clear;
      if aMeasur <> nil then aMeasur.Clear;
    end;
end;

procedure TFrmEditInfoCountry.FLoadImageinTImage(aImage:TImage);
begin
  MyLoadImageFromSelectFile('','*.png;*.gif;*.jpg;*.jpeg;*.bmp)|*.png;*.gif;*.jpg;*.jpeg;*.bmp',aImage);
end;

procedure TFrmEditInfoCountry.butClearLicensePlateClick(Sender: TObject);
begin
  FClearImageinTImage( ImgLicensePlate );
end;

procedure TFrmEditInfoCountry.butAddLimitSpeedClick(Sender: TObject);
begin
  Elem_COUNTRIES_CAR_SPEED_INFO.DB.Insert;
end;

procedure TFrmEditInfoCountry.butEditLimitSpeedClick(Sender: TObject);
begin
 Elem_COUNTRIES_CAR_SPEED_INFO.DB.Edit;
end;

procedure TFrmEditInfoCountry.butDelLimitSpeedClick(Sender: TObject);
begin
 Elem_COUNTRIES_CAR_SPEED_INFO.DB.Delete;
end;

procedure TFrmEditInfoCountry.butEditEmbassiesClick(Sender: TObject);
var DefValue:string[1];
    CurrCountryId:Variant;
begin
  if PageControlAmbassy.ActivePage = TabEmbassyUkraineInCountry then begin DefValue:='T'; CurrCountryId:=Elem_BrCountryQry.GetValueId;  end;
  if PageControlAmbassy.ActivePage = TabEmbassyCountryInUkraine then begin DefValue:='F'; CurrCountryId:=OptionSet.LocaleCountry; end;

  Elem_CNTREMBASSIES.SetDefaultValue( ['OUREMBASSY'],[ DefValue ] );

  Elem_EmbassyList.SetFilterOnView( ['OFFICECOUNTRY'],[CurrCountryId],['='],fboAnd );
  try
    Elem_CNTREMBASSIES.AskBeforeDelete := false;
    Elem_CNTREMBASSIESRepresent.AskBeforeDelete := false;
    EditSelectedByView( PageControlAmbassy.ActivePage.Caption, Elem_EmbassyList, 'EMBASSYNAME', Elem_CNTREMBASSIES.View, 'COMPANYID', 'EMBASSYNAME', 500 );

  finally
    Elem_CNTREMBASSIES.AskBeforeDelete := True;
    Elem_CNTREMBASSIESRepresent.AskBeforeDelete := True;
  end;
end;

procedure TFrmEditInfoCountry.TabEmbassyUkraineInCountryShow(
  Sender: TObject);
begin
  Elem_CNTREMBASSIES.View.GetColumnByFieldName('FOROWNERVISA').Visible := false;
  Elem_CNTREMBASSIES.SetFilterOnView(['OUREMBASSY'],['T'],['='],fboOr);
end;

procedure TFrmEditInfoCountry.TabEmbassyCountryInUkraineShow(
  Sender: TObject);
begin
  Elem_CNTREMBASSIES.View.GetColumnByFieldName('FOROWNERVISA').Visible := True;
  Elem_CNTREMBASSIES.SetFilterOnView(['OUREMBASSY'],['F'],['='],fboOr);
end;

procedure TFrmEditInfoCountry.ImgLicensePlateDblClick(Sender: TObject);
begin
  FLoadImageinTImage( ImgLicensePlate );
end;

procedure TFrmEditInfoCountry.ButClearFlagClick(Sender: TObject);
begin
  FClearImageinTImage( ImgFlag );
end;

procedure TFrmEditInfoCountry.ButClearGerbClick(Sender: TObject);
begin
  FClearImageinTImage( ImgGerb );
end;

procedure TFrmEditInfoCountry.ImgFlagDblClick(Sender: TObject);
begin
  FLoadImageinTImage( ImgFlag );
end;

procedure TFrmEditInfoCountry.ImgGerbDblClick(Sender: TObject);
begin
 FLoadImageinTImage( ImgGerb );
end;

procedure TFrmEditInfoCountry.butClearSquareCountryClick(Sender: TObject);
begin
  FClearBoxData( EdSquareCountry, CmbUnitMeasurSquare );
end;

procedure TFrmEditInfoCountry.butClearTerritoryLengthWEClick(
  Sender: TObject);
begin
  FClearBoxData( EdTerritoryLengthWE, CmbUnitMeashureTerritoryLengthWE );
end;

procedure TFrmEditInfoCountry.butClearTerritoryLengthNSClick(
  Sender: TObject);
begin
  FClearBoxData( EdTerritoryLengthNS, CmbxUnitMeashureTerritoryLengthNS );
end;

procedure TFrmEditInfoCountry.butClearPeopleClick(Sender: TObject);
begin
  FClearBoxData( EdPeople, CmbUnitMeasurPeople );
end;

procedure TFrmEditInfoCountry.ButClearLengthBoundaryClick(Sender: TObject);
begin
  FClearBoxData( EdLengthBoundary, CmbUnitMeashureLengthBoundary );
end;

procedure TFrmEditInfoCountry.butLengthCoastlineClick(Sender: TObject);
begin
  FClearBoxData( EdLengthCoastline, CmbUnitMearhureLengthCoastline );
end;

procedure TFrmEditInfoCountry.EdSquareCountryKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key := EnableInputJustNumber(Sender, Key, false);
end;

procedure TFrmEditInfoCountry.ViewInternacionalOrgCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditInternacionalOrg.Click;
end;

procedure TFrmEditInfoCountry.ViewMemDatOficialLngCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditOficialLng.Click;
end;

procedure TFrmEditInfoCountry.ViewMemDatWidespreadlLngCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditWidespreadLng.Click;
end;

procedure TFrmEditInfoCountry.ViewMemDatReligiaCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditReligia.Click;
end;

procedure TFrmEditInfoCountry.ViewCountriesHolidaysCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditCelebration.Click;
end;

procedure TFrmEditInfoCountry.ViewMemDatTimeZoneCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditTimeZone.Click;
end;

procedure TFrmEditInfoCountry.ViewMemDataInternacionalOrgCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditInternacionalOrg.Click;
end;

procedure TFrmEditInfoCountry.ViewCountriesCarSpeedInfoCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditLimitSpeed.Click;
end;

procedure TFrmEditInfoCountry.ViewCountryEMBASSIESCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if PageControlCountryInfo.ActivePage = TabAmbasada then
    butEditEmbassies.Click;

  if PageControlCountryInfo.ActivePage = TabVisa then
    DocumVisaBtn.Click;
end;

procedure TFrmEditInfoCountry.RefreshProvinceClick;
var i:integer;
    indIdProvinceCol:Integer;
    CurrValueProvince:Variant;
    aColumnCheck:TcxGridDBColumn;
begin
  aColumnCheck := Elem_ProvinceOfUkraineQry.FindFirstCheckSelectedColumn;
  Elem_ProvinceOfUkraineQry.ClearCheckRecordBySelectColumn( aColumnCheck );
  indIdProvinceCol:= Elem_CNTREMBAS_INPROVINCE.View.GetColumnByFieldName('id_city_adm_unit').Index;
  Elem_ProvinceOfUkraineQry.ClearCheckRecordBySelectColumn( aColumnCheck );

  For i:=0 to Elem_CNTREMBAS_INPROVINCE.View.DataController.RowCount - 1 do
  begin
    CurrValueProvince := Elem_CNTREMBAS_INPROVINCE.View.ViewData.Rows[i].Values[indIdProvinceCol];
    Elem_ProvinceOfUkraineQry.AddCheckRecordBySelectColumn( aColumnCheck, CurrValueProvince );
  end;

  Elem_ProvinceOfUkraineQry.RepaintColumn( aColumnCheck );
end;

procedure TFrmEditInfoCountry.ViewCountryEMBASSIESInUkraineForRepresentFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshProvinceClick;
end;

procedure AddEmbassInprovince( idProvinceId:Variant );
begin
  Elem_CNTREMBAS_INPROVINCE.DB.Insert;
  Elem_CNTREMBAS_INPROVINCE.DB.FieldByName('id_city_adm_unit').Value := idProvinceId;
  Elem_CNTREMBAS_INPROVINCE.DB.Post;
end;

procedure SynchoronizeRegionOfUkraineAndAmbasedRegion;
var i:Integer;
    currIdValue:Variant;
    FindInd:Integer;
    IndSaveList:Integer;
    SaveList:TStringList;
begin
  try
    SaveList := Elem_CNTREMBAS_INPROVINCE.MakeStrListForIdInView( 'id_city_adm_unit' );

    for i:=0 to Elem_ProvinceOfUkraineQry.GetObjectCheckSelectedViewRow.Count-1 do
    begin
       currIdValue:= PCheckViewColumn( Elem_ProvinceOfUkraineQry.GetObjectCheckSelectedViewRow.Items[i] ).idValue;
       FindInd := Elem_CNTREMBAS_INPROVINCE.FindValueInView( 'id_city_adm_unit' ,currIdValue );
       if FindInd = -1 then AddEmbassInprovince( currIdValue )
       else
       begin
         IndSaveList := SaveList.IndexOf( VarToStr( currIdValue ) );
         if IndSaveList <> -1 then SaveList.Delete( IndSaveList );
       end;
    end;

    //*************************************
    for i:=0 to SaveList.Count-1 do
      if Elem_CNTREMBAS_INPROVINCE.DB.Locate('id_city_adm_unit',SaveList.Strings[i],[]) then Elem_CNTREMBAS_INPROVINCE.DBDelete(false);

  finally
    Elem_CNTREMBAS_INPROVINCE.Requery;
  end;
end;

procedure TFrmEditInfoCountry.TabVisaShow(Sender: TObject);
begin
  Elem_CNTREMBASSIES.SetFilterOnView(['OUREMBASSY'],['F'],['='],fboOr);
  GridEmbassiesVisa.Levels[0].GridView := Elem_CNTREMBASSIES.View;
end;

procedure TFrmEditInfoCountry.TabAmbasadaShow(Sender: TObject);
begin
  GridEmbassies.Levels[0].GridView := Elem_CNTREMBASSIES.View;
  PageControlAmbassy.ActivePage :=  TabEmbassyUkraineInCountry;
end;

procedure TFrmEditInfoCountry.DocumVisaBtnClick(Sender: TObject);
begin
  if Elem_CNTREMBASSIES.View.DataController.RowCount<>0 then
  begin
    Elem_ItsKonsulQry.DBOpen;
    ExecuteEmbassyDocumEdit;
  end;
end;

procedure TFrmEditInfoCountry.ExtLookupTranslateLngDescriptPropertiesInitPopup(
  Sender: TObject);
begin
  Elem_Language.SetFilterOnViewList( ['ACTIVE_TRANSLATE'], [1], ['='], fboOr );
end;

procedure TFrmEditInfoCountry.ExtLookupTranslateLngDescriptPropertiesCloseUp(
  Sender: TObject);
begin
  Elem_Language.ClearFilterOnViewList;
end;

procedure TFrmEditInfoCountry.ButCountryLngClick(Sender: TObject);
begin
  ShowTranslateLng( Elem_BrCountryQry, EdName.Text,  'NAME', 'uk', Elem_BrCountryQry.View.Styles );
end;

procedure TFrmEditInfoCountry.ButCountryOficialLngClick(Sender: TObject);
begin
  if CheckOnOriginalText( EdOficialName.Text ) then
  begin
    FAddValueCountryInfo( 3, EdOficialName.Text, null, null );
    ShowTranslateLng( Elem_COUNTRIES_INFO, EdOficialName.Text,  'AVALUE', 'uk', Elem_BrCountryQry.View.Styles );
  end;
end;

procedure TFrmEditInfoCountry.butShowProvinciesDictClick(Sender: TObject);
begin
  ShowDicInternacionalOrg( FormMenuTop.butInternacionalOrg.Caption );
end;

procedure TFrmEditInfoCountry.butDicLanguagesClick(Sender: TObject);
begin
  ShowDicLanguages( FormMenuTop.butLanguages.Caption );
end;

procedure TFrmEditInfoCountry.butDicReligionsClick(Sender: TObject);
begin
  ShowDicReligions( FormMenuTop.butReligions.Caption );
end;

procedure TFrmEditInfoCountry.butTimeZoneClick(Sender: TObject);
begin
  ShowDicTimeZone( FormMenuTop.butDicTimeZone.Caption );
end;

procedure TFrmEditInfoCountry.butDicPowerVoltClick(Sender: TObject);
begin
  ShowDicPowerVolt( FormMenuTop.butDicVoltType.Caption );
end;

procedure TFrmEditInfoCountry.butDicFregClick(Sender: TObject);
begin
  ShowDicFregType( FormMenuTop.butDicFregType.Caption );
end;

procedure TFrmEditInfoCountry.butDicCarTypeClick(Sender: TObject);
begin
  ShowDicCarTypeInfo( FormMenuTop.butDicKindCar.Caption );
end;

procedure TFrmEditInfoCountry.butDicCountrySectionitemClick(Sender: TObject);
begin
  ShowDicDictSectItem( FormMenuTop.butDicTypeSectionItem.Caption ); 
end;

function TFrmEditInfoCountry.FShowInsertSectionItem(Elem: TObject): Boolean;
begin

end;

function CheckUpdateCountrySection( Dataset:TDataset ):Boolean;
var SectionId:Variant;
    ItemId:Variant;
    NameValue:Variant;
    aNode:TcxTreeListNode;
    IndColSectionId:Integer;
    IndColItemId:Integer;
    IndColName :Integer;
    CheckLevel:Integer;
    CurrValueForCheckOnTree:Variant;
    CurrValueForCheckInputed:Variant;
begin
  result := True;
  if Elem_CountrySectDescrQry.Tree.FocusedNode = nil then exit;

  SectionId := Dataset.FieldByName('dictsectionid').AsVariant;
  ItemId := Dataset.FieldByName('itemid').AsVariant;
  NameValue := Dataset.FieldByName('name').AsVariant;

  IndColSectionId := Elem_CountrySectDescrQry.Tree.GetColumnByFieldName('DICTSECTIONID').ItemIndex;
  IndColItemId := Elem_CountrySectDescrQry.Tree.GetColumnByFieldName('ITEMID').ItemIndex;
  IndColName  := Elem_CountrySectDescrQry.Tree.GetColumnByFieldName('name').ItemIndex;

  if Dataset.Tag = 0 then// add on Leven
  begin
    if Elem_CountrySectDescrQry.Tree.FocusedNode.Parent <> nil then
      aNode := Elem_CountrySectDescrQry.Tree.FocusedNode.Parent.getFirstChild
    else aNode := Elem_CountrySectDescrQry.Tree.TopNode;
  end
  else
  if Dataset.Tag = 1 then // add on sub Level
    aNode := Elem_CountrySectDescrQry.Tree.FocusedNode.getFirstChild;

  if aNode <> nil then CheckLevel := aNode.Level;

  while aNode<>nil do
  begin
    //if Elem_CountrySectDescrQry.GetValueId <> TcxDBTreeListNode(aNode).Values[Elem_CountrySectDescrQry.Tree.GetColumnByFieldName(Elem_CountrySectDescrQry.FieldKod).ItemIndex] then
    begin
      if CheckLevel=0 then begin CurrValueForCheckOnTree := aNode.Values[IndColSectionId];CurrValueForCheckInputed:=SectionId;end;
      if CheckLevel=1 then begin CurrValueForCheckOnTree := aNode.Values[IndColItemId];CurrValueForCheckInputed := ItemId;end;
      if CheckLevel>1 then begin CurrValueForCheckOnTree := aNode.Values[IndColName];CurrValueForCheckInputed := NameValue;end;

      if CurrValueForCheckInputed = CurrValueForCheckOnTree then
      begin
        result:=false;
        Break;
      end;
    end;

    aNode := aNode.getNextSibling;
  end;

  if not result then MyShowMessageDlg(MessageErrorOnThisLevelAlredyFindSegmentItem,mtError,but_OK);
end;

procedure TFrmEditInfoCountry.FPRepareElemSectionView( OptAddSect:TOptAddSection );
var aView:TcxGridDBTableView;
    aLevel:Integer;
    aDB:TADOQuery;
    ConParam:TConnectDBParam;
    SQL :string;
begin
  if OptAddSect = optSectDescr then aView := ViewDicSections;
  if OptAddSect = optSectItemDescr then aView := ViewDicSectionsItems;
  if OptAddSect = optSectNameDescr then aView := ViewSectionName;

  FElem_MDCountryDescrSection.SetView( nil );
  FElem_MDCountryDescrSection.SetView( aView );
  FElem_MDCountryDescrSection.UpdateForm := True;
  GridMDCountryDescriptInvisible.Levels[0].GridView := aView;
  FElem_MDCountryDescrSection.SetValidateBeforePost( CheckUpdateCountrySection );

  While not FElem_MDCountryDescrSection.DB.Eof do
   FElem_MDCountryDescrSection.DBDelete( False );

end;

procedure TFrmEditInfoCountry.FUpdateCountryDecript;
begin
  if FElem_MDCountryDescrSection.DB.isEmpty then exit;
  
  if Elem_CountrySectDescrQry.DB.State = dsBrowse then
    Elem_CountrySectDescrQry.DB.Edit;

  Elem_CountrySectDescrQry.DB.FieldByName('dictsectionid').Value := FElem_MDCountryDescrSection.DB.FieldByName('dictsectionid').Value;
  Elem_CountrySectDescrQry.DB.FieldByName('itemid').Value := FElem_MDCountryDescrSection.DB.FieldByName('itemid').Value;
  Elem_CountrySectDescrQry.DB.FieldByName('NAME').Value   := FElem_MDCountryDescrSection.DB.FieldByName('NAME').Value;
  Elem_CountrySectDescrQry.DB.Post;
end;

procedure TFrmEditInfoCountry.FPrepareMemDataCountryDescript;
begin
 try
   FElem_MDCountryDescrSection.UpdateForm := False;
   
   FElem_MDCountryDescrSection.DB.Insert;
   FElem_MDCountryDescrSection.DB.FieldByName('dictsectionid').Value := Elem_CountrySectDescrQry.DB.FieldByName('dictsectionid').Value;
   FElem_MDCountryDescrSection.DB.FieldByName('itemid').Value := Elem_CountrySectDescrQry.DB.FieldByName('itemid').Value;
   FElem_MDCountryDescrSection.DB.FieldByName('NAME').Value := Elem_CountrySectDescrQry.DB.FieldByName('NAME').Value;
   FElem_MDCountryDescrSection.DB.Post;
   
 finally
   FElem_MDCountryDescrSection.UpdateForm := True;
 end;
end;

procedure TFrmEditInfoCountry.FAddItemSection( OptAddToTree : TOptAddTreeNode; OptAddSect:TOptAddSection );
var ParentId:Variant;
begin
  FPrepareElemSectionView( OptAddSect );

  if not FCheckPossibleAddSubItem( OptAddToTree ) then Exit;

  if OptAddToTree in [OptTreeNodeAddInsert,OptTreeNodeAddLast] then FElem_MDCountryDescrSection.DB.Tag:=0
  else
  if OptAddToTree in [OptTreeNodeAddSub] then FElem_MDCountryDescrSection.DB.Tag:=1;

  FElem_MDCountryDescrSection.DB.Insert;

  if not FElem_MDCountryDescrSection.DB.IsEmpty then
  begin
    if OptAddToTree = OptTreeNodeAddInsert then Elem_CountrySectDescrQry.InsertNode;
    if OptAddToTree = OptTreeNodeAddLast then Elem_CountrySectDescrQry.AppendNode;
    if OptAddToTree = OptTreeNodeAddSub then Elem_CountrySectDescrQry.AddSubNode;

    FUpdateCountryDecript;
  end;
end;

procedure TFrmEditInfoCountry.FEditItemSection( aNode:TcxTreeListNode );
var aElem:TDBShemaView;
    OptAddSect:TOptAddSection;
begin
  try
    if Elem_CountrySectDescrQry.Tree.FocusedNode = nil then exit;

    OptAddSect := FGetOptSectionForLevel( Elem_CountrySectDescrQry.Tree.FocusedNode.Level );
    FPRepareElemSectionView( OptAddSect );
    FPrepareMemDataCountryDescript;

    FElem_MDCountryDescrSection.DB.Edit;
    FUpdateCountryDecript;
  finally
    Elem_CountrySectDescrQry.RequeryCurrentRecord;
  end;
end;

Function TFrmEditInfoCountry.FGetOptSectionForLevel(aLevel:Integer):TOptAddSection;
begin
  if aLevel = 0 then result := optSectDescr
  else
   if aLevel = 1 then result := optSectItemDescr
   else
     result := optSectNameDescr;
end;

procedure TFrmEditInfoCountry.FAddItemSec( OptAddToTree:TOptAddTreeNode );
var aDB:TDataset;
    OptAddSect:TOptAddSection;
    aLevel:Integer;
begin
  try
    if (Elem_CountrySectDescrQry.Tree.FocusedNode= nil) then
       aLevel := 0;

    if (OptAddToTree = OptTreeNodeAddInsert)and
       (Elem_CountrySectDescrQry.Tree.FocusedNode<>nil) then
      aLevel:= Elem_CountrySectDescrQry.Tree.FocusedNode.Level;

    if OptAddToTree = OptTreeNodeAddSub then
      aLevel:= Elem_CountrySectDescrQry.Tree.FocusedNode.Level + 1;

    OptAddSect := FGetOptSectionForLevel( aLevel );
    FAddItemSection( OptAddToTree, OptAddSect );

  finally
    Elem_CountrySectDescrQry.RequeryCurrentRecord;
  end;
end;

function TFrmEditInfoCountry.FCheckPossibleUpdate:Boolean;
begin
  result := True;
  if (Elem_CountrySectDescrQry.Tree.FocusedNode.Level=0)and
     (Elem_CountrySectDescrQry.Tree.FocusedNode.HasChildren) then
  begin
    MyShowMessageDlg( MessCannotChangeSectionName, mtError, but_Ok );
    result := False;
  end;
end;

function TFrmEditInfoCountry.FCheckPossibleAddSubItem( OptAddToTree : TOptAddTreeNode ):Boolean;
begin
  result := True;
  if (OptAddToTree = OptTreeNodeAddSub ) and
     (Elem_DictSect_ItemQry.DBRecordCount = 0 ) then
     //(Elem_DictSect_ItemQry.ViewList.Datacontroller.RowCount = 0 ) then
  begin
    MyShowMessageDlg( MessSectionItemNotFound, mtError, but_Ok );
    result := False;
  end;
end;

procedure TFrmEditInfoCountry.butEditCountryTypeSectionitemClick(Sender: TObject);
begin
  butEditSectionItem.Click;
end;

function TFrmEditInfoCountry.FGetAllPathToHTMLDescriptFileForNode( Node:TcxTreeListNode ):TStringList;
var i:Integer;
    indColId:Integer;
    CurrIdValue:Variant;
    CurrPath:string;
    UntilLevel:Integer;
begin
  result := TStringList.Create;

  if Node =  nil then exit;

  UntilLevel := Node.Level;
  indColId :=TreeTemplateDecript.GetColumnByFieldName( Elem_CountrySectDescrQry.FieldKod ).ItemIndex;

  while (Node<>nil) do
  begin
    CurrIdValue := Node.Values[indColId];
    for i:=0 to Length( self.FLngIdent )-1 do
    begin
      CurrPath := FGetRootCurrentPathToCountryDescriptHTML + FGetFolderIdLng( self.FLngIdent[i].id )+'\'+AddNolForLengthNumber( VarToStr( CurrIdValue) ,4 ) + '.php';
      result.Add( CurrPath );
    end;

    Node := Node.GetNext;
    if ( Node <> nil ) and ( Node.Level <= UntilLevel ) then break;
  end;

end;

procedure TFrmEditInfoCountry.butDelCountryTypeSectionitemClick(Sender: TObject);
var DelFilesHTML:TStringList;
begin
  try
    DelFilesHTML := FGetAllPathToHTMLDescriptFileForNode( Elem_CountrySectDescrQry.Tree.FocusedNode );

    if Elem_CountrySectDescrQry.DeleteNode( Elem_CountrySectDescrQry.Tree.FocusedNode ) then
       MyDeleteFilesByListNames( DelFilesHTML );

    RefreshControlCountryDescript;
  finally
    FreeAndNil( DelFilesHTML );
  end;
end;

procedure TFrmEditInfoCountry.butRefreshSectionitemClick(Sender: TObject);
begin
  butRefreshCounryDesript.Click;
end;

procedure TFrmEditInfoCountry.FSyncronizePositionCounrtyDecrSection;
var IndColDirectionId:Integer;
    DirectionId:Variant;
begin
  IndColDirectionId := Elem_CountrySectDescrQry.Tree.GetColumnByFieldName('DICTSECTIONID').ItemIndex;

  if ( Elem_CountrySectDescrQry.Tree.FocusedNode=nil) then
    DirectionId := null;

  if ( Elem_CountrySectDescrQry.Tree.FocusedNode<>nil) then
  begin
    if ( Elem_CountrySectDescrQry.Tree.FocusedNode.Level = 0 )  then
      DirectionId := Elem_CountrySectDescrQry.Tree.FocusedNode.Values[ IndColDirectionId ];

    if ( Elem_CountrySectDescrQry.Tree.FocusedNode.Level = 1 )and
       ( Elem_CountrySectDescrQry.Tree.FocusedNode.Parent <> nil ) then
      DirectionId := Elem_CountrySectDescrQry.Tree.FocusedNode.Parent.Values[ IndColDirectionId ];
  end;

  if DirectionId<> null then
    Elem_DictSectQry.DB.Locate( 'DICTSECTIONID', DirectionId, [] );
end;

procedure TFrmEditInfoCountry.butNewSectionClick(Sender: TObject);
begin
  FSyncronizePositionCounrtyDecrSection;
  FAddItemSec( OptTreeNodeAddInsert );
  RefreshControlCountryDescript;
end;

procedure TFrmEditInfoCountry.butNewSectionItemClick(Sender: TObject);
begin
  FSyncronizePositionCounrtyDecrSection;
  FAddItemSec( OptTreeNodeAddSub );
  RefreshControlCountryDescript;
end;

procedure TFrmEditInfoCountry.butMoveUpSectionClick(Sender: TObject);
begin
  Elem_CountrySectDescrQry.MoveNodeUp;
  RefreshControlCountryDescript;
end;

procedure TFrmEditInfoCountry.butMoveDownSectionClick(Sender: TObject);
begin
  Elem_CountrySectDescrQry.MoveNodeDown;
  RefreshControlCountryDescript;
end;

procedure TFrmEditInfoCountry.butDelSectionItemClick(Sender: TObject);
begin
  butDelCountryTypeSectionitem.Click;
end;

procedure TFrmEditInfoCountry.RefreshControlCountryDescript;
begin
   if (PageControlCounry.ActivePage = TabCountryDescript)and(Self.Showing) then
     FrameCountryDescriptionWebHTML.RefreshShowCurrDescription;

   butMoveUpSectionitem.Enabled := Elem_CountrySectDescrQry.CheckMoveNodeUp;
   butMoveDownSectionitem.Enabled := Elem_CountrySectDescrQry.CheckMoveNodeDown;
   butDelCountryTypeSectionitem.Enabled := (Elem_CountrySectDescrQry.Tree<>nil) and (Elem_CountrySectDescrQry.Tree.FocusedNode <> nil);
   butEditCountryTypeSectionitem.Enabled := (Elem_CountrySectDescrQry.Tree<>nil) and (Elem_CountrySectDescrQry.Tree.FocusedNode <> nil);
   butNewSection.Enabled := True;
   butNewSectionItem.Enabled := (Elem_CountrySectDescrQry.Tree<>nil) and (Elem_CountrySectDescrQry.Tree.FocusedNode <> nil);

   butNewSection2.Enabled := True;
   butNewSectionItem2.Enabled :=(Elem_CountrySectDescrQry.Tree<>nil) and (Elem_CountrySectDescrQry.Tree.FocusedNode <> nil);

   butMoveUpSection.Enabled := butMoveUpSectionitem.Enabled;
   butMoveDownSection.Enabled := butMoveDownSectionitem.Enabled;
   butEditSectionItem.Enabled := butEditCountryTypeSectionitem.Enabled;
   butDelSectionItem.Enabled := butDelCountryTypeSectionitem.Enabled;
end;

procedure TFrmEditInfoCountry.butRefreshCounryDesriptClick(Sender: TObject);
begin
  Elem_CountrySectDescrQry.Requery;
  RefreshControlCountryDescript;
end;

procedure TFrmEditInfoCountry.butMoveUpSectionitemClick(Sender: TObject);
begin
  butMoveUpSection.Click;
end;

procedure TFrmEditInfoCountry.butMoveDownSectionitemClick(Sender: TObject);
begin
  butMoveDownSection.Click;
end;

procedure TFrmEditInfoCountry.butAddCountrySectionitemClick(
  Sender: TObject);
begin
  PMAddCountryDescriptSectItem.Popup(TControl(Sender).ClientOrigin.X , TControl(Sender).ClientOrigin.Y+TControl(Sender).Height);
end;

procedure TFrmEditInfoCountry.FGetListIdLng;
begin
  FLngIdent := GetListIdLng(  Elem_BrCountryQry.DBGetParamConnect )
end;

procedure TFrmEditInfoCountry.FormDestroy(Sender: TObject);
begin
  Elem_Power_Volt_Freq.ClearFilterOnViewList;
  Elem_EmbassyList.ClearFilterOnView;
  Elem_CNTREMBASSIES.ClearFilterOnView;
  Elem_CNTREMBASSIESRepresent.ClearFilterOnView;

  if FElem_MemDatInternacionalOrg<> nil then
    FElem_MemDatInternacionalOrg.Close;

  if FElem_MDCountryDescrSection<> nil then
    FElem_MDCountryDescrSection.Close;

  Elem_CountrySectDescrQry.SetTree( nil );
  FDeactive;
end;

procedure TFrmEditInfoCountry.TreeTemplateDecriptDblClick(Sender: TObject);
begin
  butEditCountryTypeSectionitem.Click;
end;

procedure TFrmEditInfoCountry.butNewSection2Click(Sender: TObject);
begin
  butNewSection.click;
end;

procedure TFrmEditInfoCountry.butNewSectionItem2Click(Sender: TObject);
begin
  butNewSectionItem.Click;
end;

procedure TFrmEditInfoCountry.TreeTemplateDecriptGetNodeImageIndex(
  Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
  AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
begin
  if ANode.Level = 0 then AIndex := 6;
  if ANode.Level = 1 then AIndex := 7;
  if ANode.Level > 1 then AIndex := 8;
end;

procedure TFrmEditInfoCountry.TreeTemplateDecriptFocusedNodeChanged(
  Sender: TcxCustomTreeList; APrevFocusedNode,
  AFocusedNode: TcxTreeListNode);
begin
  //if (PageControlCounry.ActivePage = TabCountryDescript)and(Self.Showing) then
  //  FrameCountryDescriptionWebHTML.RefreshShowCurrDescription;

  RefreshControlCountryDescript;
end;

procedure TFrmEditInfoCountry.butEditSectionItemClick(Sender: TObject);
begin
  if not FCheckPossibleUpdate then Exit;
  FSyncronizePositionCounrtyDecrSection;
  FEditItemSection( Elem_CountrySectDescrQry.Tree.FocusedNode );
  RefreshControlCountryDescript;
end;

function TFrmEditInfoCountry.FCheckSelectedLNGForDescriptCountry(ShowMessage:Boolean):Boolean;
begin

end;

function TFrmEditInfoCountry.FGetFolderIdLng( IdLng:Variant ):String;
begin
  if IdLng<> null then
    result := AddNolForLengthNumber( IdLng, 4 )
  else result :='';
end;


function TFrmEditInfoCountry.FGetRootCurrentPathToCountryDescriptHTML:String;
begin
  result := self.FPathToHtml +'DESCRIPTION\'+AddNolForLengthNumber( Elem_BrCountryQry.GetValueIdStr, 4 ) + '\';
end;

function TFrmEditInfoCountry.FGetCurrentPathToCountryDescriptIMAGES:Widestring;
begin
  result := self.FPathToImage +'DESCRIPTION\'+ AddNolForLengthNumber( Elem_BrCountryQry.GetValueIdStr, 4 ) + '\';
end;


procedure TFrmEditInfoCountry.TreeTemplateDecriptKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (ssCtrl in Shift  ) and(Key = VK_UP) and (Elem_CountrySectDescrQry.CheckMoveNodeUp)  then
 begin
   Elem_CountrySectDescrQry.MoveNodeUp;
   abort;
 end;

 if (ssCtrl in Shift  ) and(Key = VK_Down) and (Elem_CountrySectDescrQry.CheckMoveNodeDown)  then
 begin
   Elem_CountrySectDescrQry.MoveNodeDown;
   abort;
 end;
end;

function TFrmEditInfoCountry.FCheckFindFileTranslateForLngId( LngId:variant;FileName:String;MessageError:Boolean=true ):Boolean;
var CurSelLngObj:TLngIdent;
begin
  if LngId <> null then
  begin
    CurSelLngObj := GetObjLngById( self.FLngIdent, LngId );
    if not FileExists( FileName ) then
    begin
      if MessageError then MyShowMessageDlg( MessFileTranslateForLngNotFound+' "'+CurSelLngObj.lngName+'"', mtError,but_OK);
      result := False;
      exit;
    end
    else result := True;
  end;
end;

procedure TFrmEditInfoCountry.FRunEditHtmlDescription(Sender: TObject);
begin

end;

procedure TFrmEditInfoCountry.FPrepareCmbSelectLng( CmbLng:TcxImageComboBox; aLngIdent : TLngIdentArr );
begin
  PrepareCmbSelectLng( CmbLng, aLngIdent, nLocalLang );
end;

//initialization
  {CefCache := 'N:\ТурМенеджер - Документи\WEB\IMAGES\CONTENTS\COUNTRIES\DESCRIPTION\0001\';
  CefLocale := 'N:\ТурМенеджер - Документи\WEB\IMAGES\CONTENTS\COUNTRIES\DESCRIPTION\0001\';
  CefLogFile := 'N:\ТурМенеджер - Документи\WEB\IMAGES\CONTENTS\COUNTRIES\DESCRIPTION\0001\';
  CefResourcesDirPath := 'N:\ТурМенеджер - Документи\WEB\IMAGES\CONTENTS\COUNTRIES\DESCRIPTION\0001\';
  CefLocalesDirPath := 'N:\ТурМенеджер - Документи\WEB\IMAGES\CONTENTS\COUNTRIES\DESCRIPTION\0001\';  }
procedure TFrmEditInfoCountry.ButShowLogClick(Sender: TObject);
begin
  ShowLog( self,Elem_BrCountryQry.DBGetParamConnect,Elem_BrCountryQry.GetCurrManagerId,  -1, [] );
end;

procedure TFrmEditInfoCountry.TabConsulateShow(Sender: TObject);
begin
  Elem_CNTREMBASSIESRepresent.SetFilterOnView( ['FOROWNERVISA','OUREMBASSY'], ['T','T'], ['<>','<>'], fboAnd );
  RefreshProvinceClick;
end;

procedure TFrmEditInfoCountry.ButCountrySecDescrLngClick(Sender: TObject);
begin
 ShowLngDic( Elem_CountrySectDescrQry, self.FCurrManager, 600, 'NAME is not null' );
end;

procedure TFrmEditInfoCountry.CheckElemClick(Sender: TObject);
begin
  CopyElemNameForAdmin(  TPopUpMenu(TMenuItem(Sender).Owner).PopupComponent);
end;

procedure TFrmEditInfoCountry.PMTestPopup(Sender: TObject);
var CurrControl:TControl;
    P: PPropInfo;
    a:TWMNCRButtonDown;

begin

 { CurrControl := FindVCLWindow(Mouse.CursorPos) ;
  if CurrControl <> nil then
  begin
    if TButton(CurrControl).PopupMenu <> Sender then
    begin
       keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), 0, 0);
       keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), KEYEVENTF_KEYUP,0);

       //PostMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, 0);
       //PostMessage(Handle, WM_LBUTTONUP, MK_LBUTTON, 0);
    end;
  end; }
end;

end.

+
    '$("img").attr("src",function(index,attr){ return attr.replace(''IMAGES\'',''N:\ТурМенеджер - Документи\WEB\IMAGES\''); }); )'

доступ по FTP Site
ftp://algol:nJN8<Sqj`8@136.243.144.33



 { try
    PMenu.Items.Clear;
    
    aElemLanguages:= MakeElemActiveLng( Elem_BrCountryQry.DBGetParamConnect );
    aLngIdent := GetListIdLng( aElemLanguages );
    for i:=0 to Length(aLngIdent)-1 do
      CreteMenuItem( PMenu, 'butPm_'+aLngIdent[i].Ident, FRunEditHtmlDescription, aLngIdent[i].lngName );
  finally
    aElemLanguages.Close;
  end; }


  //aDB :=Elem_CountrySectDescrQry.DB;
  //Elem_CountrySectDescrQry.SetDB(nil);
  SQL := Elem_CountrySectDescrQry.MainSQL;
  SQL := SQL+' and '+Elem_CountrySectDescrQry.TableName+'.ID = '+Elem_CountrySectDescrQry.GetValueIdStr;

  ConParam := Elem_CountrySectDescrQry.DBGetParamConnect;
  aDB := CreateDataSet( ConParam.PathDB, ConParam.UID, ConParam.Password, SQL );
  result := TDBShemaView.Create( aDB, aView, Elem_CountrySectDescrQry.TableName,
                                 Elem_CountrySectDescrQry.FieldKod,Elem_CountrySectDescrQry.GeneratorIdName,Elem_CountrySectDescrQry.FieldNumber );

  result.SetActionInsertDBValue(FShowInsertSectionItem);
  //result.UpdateForm := True;
  result.AddMainElem(Elem_BrCountryQry,'COUNTRYID' );
