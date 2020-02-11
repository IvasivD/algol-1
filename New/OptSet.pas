unit OptSet;

interface

uses Windows, Messages,Forms, SysUtils, Classes, IniFiles, Graphics, TourFiles,UnitProc;

{$DEFINE TourManP}

{$IFDEF TourManP}

const
  optViewGrids = 15;
  optColorCount = optViewGrids + 1; // size of Color array
  // inifile sections and keys
  iniSectVisaDocs = 'Visa\Documents';
  iniKeyNumberCounter = 'Count';
  iniKeyNumberItem = 'Item';

type
  TModuleWriteOptionsProc = procedure of object;

type
  TOptionSet = class
  private
    FColors: array[0..optColorCount] of TColor;
    FCurrencyInter: Integer;
    FReservTimeMax: Integer;
    FReservTimeMin: Integer;
    FExchangeDues: Double;
    FOrderReservTime: Integer;
    FOrderTimeBias: TDateTime;
    FWordDocTemplate: string;
    FMailAttachFolder: string;
    FHotelPictFolder: string;
    FPictureFolder: string;
    FPersonPictFolder: string;
    FDatabaseFolder: string;
    FDatabaseOffcFolder: string;
    FStoreFolder: string;
    FEmployeesPath:string;
    FHtmlEditor   : string;
    FWebSourcePath: string;
    FWebPathToImage: string;
    FWebPathToHtml: string;

    FExchange1cFolder: string;
    FDefaultCountry: Integer;
    FDefaultCurrency: Integer;
    FLocaleCountry: Integer;
    FLocaleCity: Integer;
    FLocaleCurrency: Integer;
    FInboxFolder: string;
    FOutboxFolder: string;
    FUseCtrlKeyWithAdd: Boolean;
    FTouristTemplateItem: Integer;
    FPassportExpireDuration: Integer;
    FPassportExpireCheckMonths: Integer;
    FLastUsedTourTemplate: Integer;
    FInsureMaxPersonPerPolice: Integer;
    FInsureMaxGroupPerPolice: Integer;
    FLastOpTMHotel: Integer;
    FLastOpTMCity: Integer;
    FLastOpTMRoute: Integer;
    FLastOpTMCountry: Integer;
    FLastOpTMFTrip: Integer;
    FLastOpTMBTrip: Integer;
    FLastOpDictCity: Integer;
    FLastOpDictHCity: Integer;
    FLastOpDictHotel: Integer;
    FLastOpDictCountry: Integer;
    FLastOpDictHCountry: Integer;
    FInsureMinBreakPayRest: Currency;
    FTemplateFolder: string;
    FInsureMaxMovePeriod: Integer;
    FInsureBreakPayRest: Currency;
    FPostExpireTime: Integer;
    FOrderHotReservTime: Integer;
    FPolicePrinterName: string;
    FLocaleCompany: Integer;
    FLastOpDictCompany: Integer;
    FLastOpDictProvCountry: Integer;
    FLastOpDictProvince: Integer;
    FLastOpDictResort: Integer;
    FLastOpDictResortCntr: Integer;
    FLastOpDictNaturObj: Integer;
    FLastOpDictNaturCntrObj: Integer;
    FLastOpDictInfraObj: Integer;
    FLastOpDictInfraCntrObj: Integer;
    FLastPriFilterDictCompany: Integer;
    FLastSecFilterDictCompany: Integer;
    FLastThirdFilterDictCompany: Integer;
    FLastCntryFilterDictCompany: Integer;
    FLocaleCompanySign: string;
    FMaxDocFileSize: Integer;
    FMaxImageFileSize: Integer;
    FModuleWriteOptions: TModuleWriteOptionsProc;
    FLastOpInsureGroup: Integer;
    FLastOpInsureGroupDate: TDateTime;
    FLastOpInsureTour: Integer;
    FLastOpVisaCountry: Integer;
    FLastOpVisaGroup: Integer;
    FLastOpVisaGrpDate: TdateTime;
    FLastOpVisaOrder: Integer;
    FLastOpVisaPersId: Integer;
    FLastOpVisaDate: TDateTime;
    FLastOpVisaSplit: Integer;
    FLastOpVisaTour: Integer;
    FLastOpRoomSplit1: Integer;
    FLastOpRoomSplit2: Integer;
    FRoomingViewShowAge: Boolean;
    FLastOpRoomingViewLang: Integer;
    FRoomingViewFromDate: TDateTime;
    FRoomingViewTillDate: TDateTime;
    FRoomingViewMonthCount: Integer;
    FRoomingViewPeriod: Boolean;
    FLastOpExcursGroup: Integer;
    FLastOpExcursCountry: Integer;
    FLastOpExcursCity: Integer;
    FLastOpExcursion: Integer;
    FLastOpExcursTour: Integer;
    FLastOpExcursGrpDate: TDateTime;
    FLastOpExcursSplit: Integer;
    FLastOpExcursDate: TDateTime;
    FLastOpDictInterest: Integer;
    FLastOpDictICity: Integer;
    FLastOpDictICountry: Integer;
    FLastOpTourGroup: Integer;
    FLastOpTourTour: Integer;
    FLastOpTourDate: TDateTime;
    FLastOpTourTempl: Integer;
    FLastSortTourGroup: Integer;
    FLastSortTourTempl: Integer;
    FLastTourModeAction: Integer;
    FLastDaysCountForPlahta: Integer;
    FLastSortTourTour: Integer;
    FLastSortTourDate: Integer;
    FLastFilterTourArhived: Boolean;
    FLastFilterTourPseudo: Boolean;
    FLastFilterTourUndefenced: Boolean;
    FLastFilterTourDisabled: Boolean;
    FLastOpRouteBTrip: Integer;
    FLastOpRouteFTrip: Integer;
    FLastOpRouteRoute: Integer;
    FLastOpRouteShed: Integer;
    FOrderPermanentCount: Integer;
    FLastOpInsureOrder: Integer;
    FLastOpInsurePolice: Integer;
    FLastOpInsurePerson: Integer;
    FLastOpInsureVendor: Integer;
    FLastOpNewOrderCustomer: Integer;
    FLastOpManager: Integer;
    FLastOpTourViewPlace: Boolean;
    function GetColors(Index: Integer): TColor;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetLastOpManager(const Value: Integer);
    procedure SetCurrencyInter(const Value: Integer);
    procedure SetExchangeDues(const Value: Double);
    procedure SetOrderReservTime(const Value: Integer);
    procedure SetOrderTimeBias(const Value: TDateTime);
    procedure SetReservTimeMax(const Value: Integer);
    procedure SetReservTimeMin(const Value: Integer);
    procedure SetPostExpireTime(const Value: Integer);
    procedure SetOrderHotReservTime(const Value: Integer);
    procedure SetPolicePrinterName(const Value: string);
  private
    FIniFile: TIniFile;
    procedure DefaultReadOptions(IniFile: TIniFile);
    procedure DefaultWriteOptions(IniFile: TIniFile);
  public
    constructor Create;
    destructor Destroy; override;
    function KeyReadString(const Section, Ident, Default: string): string;
    procedure KeyWriteString(const Section, Ident, Value: String);
    function KeyReadInteger(const Section, Ident: string; Default: Longint): Longint;
    procedure KeyWriteInteger(const Section, Ident: string; Value: Longint);
    function KeyReadBool(const Section, Ident: string; Default: Boolean): Boolean;
    procedure KeyWriteBool(const Section, Ident: string; Value: Boolean);
    function KeyReadDate(const Section, Ident: string; Default: TDateTime): TDateTime;
    function KeyReadDateTime(const Section, Ident: string; Default: TDateTime): TDateTime;
    function KeyReadFloat(const Section, Ident: string; Default: Double): Double;
    function KeyReadTime(const Section, Ident: string; Default: TDateTime): TDateTime;
    procedure KeyWriteDate(const Section, Ident: string; Value: TDateTime);
    procedure KeyWriteDateTime(const Section, Ident: string; Value: TDateTime);
    procedure KeyWriteFloat(const Section, Ident: string; Value: Double);
    procedure KeyWriteTime(const Section, Ident: string; Value: TDateTime);
    procedure ReadOptions;
    procedure WriteOptions;
    property Colors[Index: Integer]: TColor read GetColors write SetColors;
    property CurrencyInter: Integer read FCurrencyInter write SetCurrencyInter;
    property ExchangeDues: Double read FExchangeDues write SetExchangeDues;
    property ReservTimeMin: Integer read FReservTimeMin write SetReservTimeMin;
    property ReservTimeMax: Integer read FReservTimeMax write SetReservTimeMax;
    property OrderTimeBias: TDateTime read FOrderTimeBias write SetOrderTimeBias;
    property OrderReservTime: Integer read FOrderReservTime write SetOrderReservTime;
    property OrderHotReservTime: Integer read FOrderHotReservTime write SetOrderHotReservTime;
    property OrderPermanentCount: Integer read FOrderPermanentCount write FOrderPermanentCount;
    property PostExpireTime: Integer read FPostExpireTime write SetPostExpireTime;
    property DefaultCountry: Integer read FDefaultCountry write FDefaultCountry;
    property DefaultCurrency: Integer read FDefaultCurrency write FDefaultCurrency;
    property LocaleCountry: Integer read FLocaleCountry write FLocaleCountry;
    property LocaleCity: Integer read FLocaleCity write FLocaleCity;
    property LocaleCompany: Integer read FLocaleCompany write FLocaleCompany;
    property LocaleCurrency: Integer read FLocaleCurrency write FLocaleCurrency;
    property LocaleCompanySign: string read FLocaleCompanySign write FLocaleCompanySign;
    property WordDocTemplate: string read FWordDocTemplate write FWordDocTemplate;
    property DatabaseFolder: string read FDatabaseFolder write FDatabaseFolder;
    property DatabaseOffcFolder: string read FDatabaseOffcFolder write FDatabaseOffcFolder;
    property InboxFolder: string read FInboxFolder write FInboxFolder;
    property OutboxFolder: string read FOutboxFolder write FOutboxFolder;
    property TemplateFolder: string read FTemplateFolder write FTemplateFolder;
    property MailAttachFolder: string read FMailAttachFolder write FMailAttachFolder;
    property PictureFolder: string read FPictureFolder write FPictureFolder;
    property HotelPictFolder: string read FHotelPictFolder write FHotelPictFolder;
    property PersonPictFolder: string read FPersonPictFolder write FPersonPictFolder;
    property StoreFolder: string read FStoreFolder write FStoreFolder;

    property EmployeesPath:string read FEmployeesPath write FEmployeesPath;

    property HtmlEditor: string read FHtmlEditor write FHtmlEditor;
    property WebSourcePath: string read FWebSourcePath write FWebSourcePath;
    property WebPathToImage: string read FWebPathToImage write FWebPathToImage;
    property WebPathToHtml: string read FWebPathToHtml write FWebPathToHtml;
    property Exchange1cFolder: string read FExchange1cFolder write FExchange1cFolder;
    property MaxDocFileSize: Integer read FMaxDocFileSize write FMaxDocFileSize;
    property MaxImageFileSize: Integer read FMaxImageFileSize write FMaxImageFileSize;
    property PassportExpireDuration: Integer read FPassportExpireDuration write FPassportExpireDuration;
    property PassportExpireCheckMonths: Integer read FPassportExpireCheckMonths write FPassportExpireCheckMonths;
    property TouristTemplateItem: Integer read FTouristTemplateItem write FTouristTemplateItem;
    property UseCtrlKeyWithAdd: Boolean read FUseCtrlKeyWithAdd write FUseCtrlKeyWithAdd;
    property LastUsedTourTemplate: Integer read FLastUsedTourTemplate write FLastUsedTourTemplate;
    property InsureMaxPersonPerPolice: Integer read FInsureMaxPersonPerPolice write FInsureMaxPersonPerPolice;
    property InsureMaxGroupPerPolice: Integer read FInsureMaxGroupPerPolice write FInsureMaxGroupPerPolice;
    property InsureMaxMovePeriod: Integer read FInsureMaxMovePeriod write FInsureMaxMovePeriod;
    property InsureBreakPayRest: Currency read FInsureBreakPayRest write FInsureBreakPayRest;
    property InsureMinBreakPayRest: Currency read FInsureMinBreakPayRest write FInsureMinBreakPayRest;
    property PolicePrinterName: string read FPolicePrinterName write SetPolicePrinterName;
    property RoomingViewFromDate: TDateTime read FRoomingViewFromDate write FRoomingViewFromDate;
    property RoomingViewTillDate: TDateTime read FRoomingViewTillDate write FRoomingViewTillDate;
    property RoomingViewMonthCount: Integer read FRoomingViewMonthCount write FRoomingViewMonthCount;
    property RoomingViewPeriod: Boolean read FRoomingViewPeriod write FRoomingViewPeriod;
    property RoomingViewShowAge: Boolean read FRoomingViewShowAge write FRoomingViewShowAge;
    property LastOpRoomingViewLang: Integer read FLastOpRoomingViewLang write FLastOpRoomingViewLang;
    property LastOpTMCountry: Integer read FLastOpTMCountry write FLastOpTMCountry;
    property LastOpTMCity: Integer read FLastOpTMCity write FLastOpTMCity;
    property LastOpTMHotel: Integer read FLastOpTMHotel write FLastOpTMHotel;
    property LastOpTMRoute: Integer read FLastOpTMRoute write FLastOpTMRoute;
    property LastOpTMFTrip: Integer read FLastOpTMFTrip write FLastOpTMFTrip;
    property LastOpTMBTrip: Integer read FLastOpTMBTrip write FLastOpTMBTrip;
    property LastOpTourTour: Integer read FLastOpTourTour write FLastOpTourTour;
    property LastOpTourDate: TDateTime read FLastOpTourDate write FLastOpTourDate;
    property LastOpTourGroup: Integer read FLastOpTourGroup write FLastOpTourGroup;
    property LastOpTourTempl: Integer read FLastOpTourTempl write FLastOpTourTempl;
    property LastOpDictCountry: Integer read FLastOpDictCountry write FLastOpDictCountry;
    property LastOpDictCity: Integer read FLastOpDictCity write FLastOpDictCity;
    property LastOpDictHCountry: Integer read FLastOpDictHCountry write FLastOpDictHCountry;
    property LastOpDictHCity: Integer read FLastOpDictHCity write FLastOpDictHCity;
    property LastOpDictHotel: Integer read FLastOpDictHotel write FLastOpDictHotel;
    property LastOpDictICountry: Integer read FLastOpDictICountry write FLastOpDictICountry;
    property LastOpDictICity: Integer read FLastOpDictICity write FLastOpDictICity;
    property LastOpDictInterest: Integer read FLastOpDictInterest write FLastOpDictInterest;
    property LastOpDictCompany: Integer read FLastOpDictCompany write FLastOpDictCompany;
    property LastOpDictProvCountry: Integer read FLastOpDictProvCountry write FLastOpDictProvCountry;
    property LastOpDictProvince: Integer read FLastOpDictProvince write FLastOpDictProvince;
    property LastOpDictResort: Integer read FLastOpDictResort write FLastOpDictResort;
    property LastOpDictResortCntr: Integer read FLastOpDictResortCntr write FLastOpDictResortCntr;
    property LastOpDictNaturObj: Integer read FLastOpDictNaturObj write FLastOpDictNaturObj;
    property LastOpDictNaturCntrObj: Integer read FLastOpDictNaturCntrObj write FLastOpDictNaturCntrObj;
    property LastOpDictInfraObj: Integer read FLastOpDictInfraObj write FLastOpDictInfraObj;
    property LastOpDictInfraCntrObj: Integer read FLastOpDictInfraCntrObj write FLastOpDictInfraCntrObj;
    property LastPriFilterDictCompany: Integer read FLastPriFilterDictCompany write FLastPriFilterDictCompany;
    property LastSecFilterDictCompany: Integer read FLastSecFilterDictCompany write FLastSecFilterDictCompany;
    property LastThirdFilterDictCompany: Integer read FLastThirdFilterDictCompany write FLastThirdFilterDictCompany;
    property LastCntryFilterDictCompany: Integer read FLastCntryFilterDictCompany write FLastCntryFilterDictCompany;
    property LastOpRouteRoute: Integer read FLastOpRouteRoute write FLastOpRouteRoute;
    property LastOpRouteShed: Integer read FLastOpRouteShed write FLastOpRouteShed;
    property LastOpRouteFTrip: Integer read FLastOpRouteFTrip write FLastOpRouteFTrip;
    property LastOpRouteBTrip: Integer read FLastOpRouteBTrip write FLastOpRouteBTrip;
    property LastOpInsureTour: Integer read FLastOpInsureTour write FLastOpInsureTour;
    property LastOpInsureGroup: Integer read FLastOpInsureGroup write FLastOpInsureGroup;
    property LastOpInsureGroupDate: TDateTime read FLastOpInsureGroupDate write FLastOpInsureGroupDate;
    property LastOpInsureOrder: Integer read FLastOpInsureOrder write FLastOpInsureOrder;
    property LastOpInsurePerson: Integer read FLastOpInsurePerson write FLastOpInsurePerson;
    property LastOpInsurePolice: Integer read FLastOpInsurePolice write FLastOpInsurePolice;
    property LastOpInsureVendor: Integer read FLastOpInsureVendor write FLastOpInsureVendor;
    property LastOpVisaSplit: Integer read FLastOpVisaSplit write FLastOpVisaSplit;
    property LastOpVisaCountry: Integer read FLastOpVisaCountry write FLastOpVisaCountry;
    property LastOpVisaDate: TDateTime read FLastOpVisaDate write FLastOpVisaDate;
    property LastOpVisaTour: Integer read FLastOpVisaTour write FLastOpVisaTour;
    property LastOpVisaGroup: Integer read FLastOpVisaGroup write FLastOpVisaGroup;
    property LastOpVisaGrpDate: TDateTime read FLastOpVisaGrpDate write FLastOpVisaGrpDate;
    property LastOpVisaOrder: Integer read FLastOpVisaOrder write FLastOpVisaOrder;
    property LastOpVisaPersId: Integer read FLastOpVisaPersId write FLastOpVisaPersId;
    property LastOpRoomSplit1: Integer read FLastOpRoomSplit1 write FLastOpRoomSplit1;
    property LastOpRoomSplit2: Integer read FLastOpRoomSplit2 write FLastOpRoomSplit2;
    property LastOpExcursSplit: Integer read FLastOpExcursSplit write FLastOpExcursSplit;
    property LastOpExcursion: Integer read FLastOpExcursion write FLastOpExcursion;
    property LastOpExcursDate: TDateTime read FLastOpExcursDate write FLastOpExcursDate;
    property LastOpExcursTour: Integer read FLastOpExcursTour write FLastOpExcursTour;
    property LastOpExcursGrpDate: TDateTime read FLastOpExcursGrpDate write FLastOpExcursGrpDate;
    property LastOpExcursGroup: Integer read FLastOpExcursGroup write FLastOpExcursGroup;
    property LastOpExcursCountry: Integer read FLastOpExcursCountry write FLastOpExcursCountry;
    property LastOpExcursCity: Integer read FLastOpExcursCity write FLastOpExcursCity;
    property LastSortTourTour: Integer read FLastSortTourTour write FLastSortTourTour;
    property LastSortTourDate: Integer read FLastSortTourDate write FLastSortTourDate;
    property LastSortTourGroup: Integer read FLastSortTourGroup write FLastSortTourGroup;
    property LastSortTourTempl: Integer read FLastSortTourTempl write FLastSortTourTempl;
    property LastTourModeAction: Integer read FLastTourModeAction write FLastTourModeAction;
    property LastDaysCountForPlahta: Integer read FLastDaysCountForPlahta write FLastDaysCountForPlahta;
    property LastFilterTourArhived: Boolean read FLastFilterTourArhived write FLastFilterTourArhived;
    property LastFilterTourPseudo: Boolean read FLastFilterTourPseudo write FLastFilterTourPseudo;
    property LastFilterTourUndefenced: Boolean read FLastFilterTourUndefenced write FLastFilterTourUndefenced;
    property LastFilterTourDisabled: Boolean read FLastFilterTourDisabled write FLastFilterTourDisabled;
    property ModuleWriteOptions: TModuleWriteOptionsProc read FModuleWriteOptions write FModuleWriteOptions;
    property LastOpNewOrderCustomer: Integer read FLastOpNewOrderCustomer write FLastOpNewOrderCustomer;
    property LastOpManager: Integer read FLastOpManager write SetLastOpManager;
    property LastOpTourViewPlace: Boolean read FLastOpTourViewPlace write FLastOpTourViewPlace;
  end;

var
  OptionSet: TOptionSet;

{$ENDIF}

function GetMainOptions: Boolean;
function GetDatabaseFolderName: string;
function IniFileName: string;
{$IFDEF TourManP}
procedure LoadHistoryStrings(
  const HistSect: String; HistSize: Integer; HistList: TStrings; CleanUp: Boolean = True);
procedure LoadRegistryStrings(const Key: string; Strings: TStrings; Addits: TStrings = nil);
procedure LoadMainFormRect(
  const FormName: String; var Width, Height: Integer; var Maximized: Boolean);
procedure StoreHistoryStrings(const HistSect: String; HistList: TStrings);
procedure StoreMainFormRect(
  const FormName: String; Width, Height: Integer; Maximized: Boolean);
function IsLocaleCountry(CountryId: Integer): Boolean;
{$ENDIF}

const
  sOptSetLastOp = 'LastOpened\';
  sOptSetLastOpTourman = sOptSetLastOp + 'Tourman';
  sOptSetLastOpDiction = sOptSetLastOp + 'Diction';
  sOptSetLastOpInsure = sOptSetLastOp + 'Insure';
  sOptSetLastOpVisa = sOptSetLastOp + 'Visa';
  sOptSetLastOpRoom = sOptSetLastOp + 'Room';
  sOptSetLastOpRoute = sOptSetLastOp + 'RoutMast';
  sOptSetLastOpExcurs = sOptSetLastOp + 'Excurs';
  sOptSetLastFormSize = 'LastFormSize';
  sOptSetLastSortTourman = sOptSetLastOpTourman + '\Sort';
  sOptSetLastTourXtra = sOptSetLastOp + '\';
  sOptSetLastNewOrderCustomer = sOptSetLastOp + 'NewOrderCustomer';
  kOptSetTourTour = 'TourTour';
  kOptSetTourDate = 'TourDate';
  kOptSetTourGroup = 'TourGroup';
  kOptSetTourTempl = 'TourTempl';
  kOptSetTourModeAction = 'ModeAction';
  kOptSetDaysCountForPlahta = 'DaysForPlahta';
  kOptSetRouteRoute = 'RouteRoute';
  kOptSetRouteShed = 'RouteShed';
  kOptSetRouteFTrip = 'RouteFTrip';
  kOptSetRouteBTrip = 'RouteBTrip';
  kOptSetFilterTourArhived = 'FilterArhived';
  kOptSetFilterTourPseudo = 'FilterPseudo';
  kOptSetFilterTourUndefenced = 'FilterUndefenced';
  kOptSetFilterTourDisabled = 'FilterDisabled';
  kCustomer = 'Customer';
  kRoomLanguage = 'RoomLanguage';
  kOptSetLastManager = 'Manager';
implementation

uses Controls,
{$IFDEF TourManP}
  TourConsts,
{$ENDIF}
  TourCmnlIf;

const
  oColorCount = 12;
  sCommon = 'Common';
  sColors = 'Colors';
  sMoney = 'Money';
  sOrders = 'Orders';
  sApplications = 'Applications';
  sFolders = 'Folders';
  sDocuments = 'Documents';
  sPassport = 'Passport';
  sLastUsed = 'LastUsed';
  sBrowsers = 'Browsers';
  sInsure = 'Insure';
  sRooming = 'Rooming';
  kStore = 'Store';
  kViewGrids = 'ViewGrids';
  kExchangeDues = 'ExchangeDues';
  kCurrencyRate = 'CurrencyRate';
  kReservTime = 'ReservTime';
  kOrderTimeBias = 'OrderTimeBias';
  kOrderReservTime = 'OrderReservTime';
  kPostExpireTime = 'PostExpireTime';
  kOrderPermanentCount = 'OrderPermanentCount';
  kDesign = 'Design';
  kDatabase = 'Database';
  kDatabaseOffc = 'DatabaseOffc';
  kLocale = 'Locale';
  kDefault = 'Default';
  kCurrency = 'Currency';
  kCountry = 'Country';
  kCity = 'City';
  kProvCountry = 'ProvCountry';  
  kProvince = 'Province';  
  kCompany = 'Company';  
  kResort = 'Resort';
  kResortCntr = 'ResortCntr';
  kNaturObj = 'NaturObj';
  kNaturCntrObj = 'NaturCntrObj';
  kInfraObj = 'InfraObj'; 
  kInfraCntrObj = 'InfraCntrObj';
  kCompSign = 'CompSign';
  kHotel = 'Hotel';
  kRoute = 'Route';
  kFTrip = 'FrwTrip';
  kBTrip = 'BkwTrip';
  kTourView = 'TourView';
  kPriFilter = 'PriFilter';
  kSecFilter = 'SecFilter';
  kThirdFilter = 'ThirdFilter';
  kCntryFilter = 'CntryFilter';
  kInsureTour = 'InsureTour';
  kInsureGroup = 'InsureGroup';
  kInsureGroupDate = 'InsureGroupDate';
  kInsureOrder = 'InsureOrder';
  kInsurePerson = 'InsurePerson';
  kInsurePolice = 'InsurePolice';
  kInsureVendor = 'InsureVendor';
  kVisaSplit = 'VisaSplit';
  kVisaCountry = 'VisaCountry';
  kVisaDate = 'VisaDate';
  kVisaTour = 'VisaTour';
  kVisaGroup = 'VisaGroup';
  kVisaGrpDate = 'VisaGrpDate';
  kVisaOrder = 'VisaOrder';
  kVisaPersId = 'VisaPersId';
  kExcursSplit = 'ExcursSplit';
  kExcursCountry = 'ExcursCountry';
  kExcursCity = 'ExcursCity';
  kExcursDate = 'ExcursDate';
  kExcursTour = 'ExcursTour';
  kExcursGroup = 'ExcursGroup';
  kExcursGrpDate = 'ExcursGrpDate';
  kExcursion = 'Excursion';
  kRoomSplit1 = 'RoomSplit';
  kRoomSplit2 = 'BookSplit';
  kWordDocTemp = 'WordDocTemp';
  kInbox = 'Inbox';
  kOutbox = 'Outbox';
  kMailAttach = 'MailAttach';
  kTemplFolder = 'TemplFolder';
  kMaximize = 'Maximized';
  kWidth = 'Width';
  kHeight = 'Height';

  // trip place states, !!! declared in the VDlgs unit
  plcFree = 0;
  plcTimeOut = 1;
  plcUsed = 2;
  plcPartPay = 3;
  plcPaid = 4;
  plcQueue = 5;
  plcOverPay = 6;
  plcReserve = 7;
  plcInaccessible = 8;
  plcPlacePayStates: array[plcFree..plcInaccessible] of string = (
    'plcFree', 'plcTimeOut', 'plcUsed', 'plcPartPay', 'plcPaid',
    'plcQueue', 'plcOverPay', 'plcReserve', 'plcInaccessible');

function GetMainOptions: Boolean;
begin
  with TIniFile.Create(IniFileName) do
  try
    Result := ReadBool(sCommon, kDesign, False);
  finally
    Free;
  end;
end;

function GetDatabaseFolderName: string;
begin
  with TIniFile.Create(IniFileName) do
  try
    Result := ReadString(sFolders, kDatabase, '');
  finally
    Free;
  end;
end;

function IniFileName: string;
begin
  Result := fIniFileName;
end;

{$IFDEF TourManP}

procedure LoadHistoryStrings(
  const HistSect: String; HistSize: Integer; HistList: TStrings; Cleanup: Boolean = True);
var
  V: string;
  I: Integer;
begin
  with TIniFile.Create(IniFileName) do
  try
    if SectionExists(HistSect) then
    begin
      if Cleanup then HistList.Clear;
      for I := 0 to HistSize - 1 do
        if ValueExists(HistSect, 'Item' + IntToStr(I)) then
        begin
          V := ReadString(HistSect, 'Item' + IntToStr(I), '');
          if V <> '' then HistList.Add(V);
        end
        else Break;
    end;
  finally
    Free;
  end;
end;

procedure LoadRegistryStrings(const Key: string; Strings: TStrings; Addits: TStrings = nil);
var
  I, N, P: Integer;
  S, A: string;
begin
  with TIniFile.Create(IniFileName) do
  try
    N := ReadInteger(Key, iniKeyNumberCounter, 0);
    if N > 0 then
    begin
      Strings.Clear;
      if Addits <> nil then Addits.Clear;
      for I := 0 to N - 1 do
      begin
        S := ReadString(Key, iniKeyNumberItem + IntToStr(I), '');
        if S <> '' then
        begin
          P := Pos(';', S);
          A := '';
          if P > 0 then
          begin
            A := Copy(S, Succ(P), Length(S));
            S := Copy(S, 1, Pred(P));
          end;
          Strings.Add(S);
          if Addits <> nil then Addits.Add(A);
        end;
      end;
    end;
  finally
    Free;
  end;
end;

procedure LoadMainFormRect(
  const FormName: String; var Width, Height: Integer; var Maximized: Boolean);
var Sect: String;
begin
  Sect := IncludeTrailingPathDelimiter(sOptSetLastFormSize) + FormName;
  with TIniFile.Create(IniFileName) do
  try
    Width := ReadInteger(Sect, kWidth, 0);
    Height := ReadInteger(Sect, kHeight, 0);
    Maximized := ReadBool(Sect, kMaximize, False);
  finally
    Free;
  end;
end;

procedure StoreHistoryStrings(const HistSect: String; HistList: TStrings);
var I: Integer;
begin
  with TIniFile.Create(IniFileName) do
  try
    if SectionExists(HistSect) then EraseSection(HistSect);
    for I := 0 to HistList.Count - 1 do
      WriteString(HistSect, 'Item' + IntToStr(I), HistList[I]);
  finally
    Free;
  end;
end;

procedure StoreMainFormRect(
  const FormName: String; Width, Height: Integer; Maximized: Boolean);
var Sect: String;
begin
  Sect := IncludeTrailingPathDelimiter(sOptSetLastFormSize) + FormName;
  with TIniFile.Create(IniFileName) do
  try
    WriteBool(Sect, kMaximize, Maximized);
    if not Maximized then
    begin
      WriteInteger(Sect, kWidth, Width);
      WriteInteger(Sect, kHeight, Height);
    end;
  finally
    Free;
  end;
end;

function IsLocaleCountry(CountryId: Integer): Boolean;
begin
  Result := CountryId = OptionSet.LocaleCountry;
end;

{ TOptionSet }

constructor TOptionSet.Create;
begin
  inherited Create;
  ReadOptions;
end;

procedure TOptionSet.DefaultReadOptions(IniFile: TIniFile);
var
  S: string;
  I, N: Integer;
begin
  with IniFile do
  begin
    // Order
    ReservTimeMin := ReadInteger(sOrders, kReservTime + 'Min', 2);
    ReservTimeMax := ReadInteger(sOrders, kReservTime + 'Max', 240);
    OrderTimeBias := SafeStrToTime(
      ReadString(sOrders, kOrderTimeBias, '00:15'), StrToTime('00:15'));
    OrderReservTime := ReadInteger(sOrders, kOrderReservTime, 24);
    OrderHotReservTime := ReadInteger(sOrders, kOrderReservTime + 'Hot', 1);
    PostExpireTime := ReadInteger(sOrders, kPostExpireTime, 14);
    OrderPermanentCount := ReadInteger(sOrders, kOrderPermanentCount, 3);
    // colors
    for I := 0 to optViewGrids - 1 do
    begin
      if I > plcInaccessible then N := I - plcInaccessible else N := I;
      S := plcPlacePayStates[N];
      if I > plcInaccessible then S := S + 'This';
      Colors[I] := ReadInteger(sColors, S, clWhite);
    end;
    Colors[optViewGrids] := ReadInteger(sColors, kViewGrids, clInfoBk);
    Colors[optViewGrids + 1] := ReadInteger(sColors, kViewGrids + '1', $00C6DABC);
    // Currency
    CurrencyString := ReadString(sMoney, 'CurrencyString', '');
    CurrencyFormat := ReadInteger(sMoney, 'CurrencyFormat', 1);
    NegCurrFormat := ReadInteger(sMoney, 'NegCurrFormat', 5);
    CurrencyDecimals := ReadInteger(sMoney, 'CurrencyDecimals', 2);
    CurrencyInter := ReadInteger(sMoney, kCurrencyRate, 8);
    ExchangeDues :=
      SafeStrToFloat(ReadString(sMoney, kExchangeDues, '16.67'), 16.67);
    // common
    DefaultCurrency := ReadInteger(sCommon, kDefault + kCurrency, 37);
    DefaultCountry := ReadInteger(sCommon, kDefault + kCountry, 0);
    LocaleCurrency := ReadInteger(sCommon, kLocale + kCurrency, 75);
    LocaleCountry := ReadInteger(sCommon, kLocale + kCountry, 0);
    LocaleCity := ReadInteger(sCommon, kLocale + kCity, 0);
    LocaleCompany := ReadInteger(sCommon, kLocale + kCompany, 180);
    LocaleCompanySign := ReadString(sCommon, kLocale + kCompSign, 'Algol ltd.');
    WordDocTemplate := ReadString(sApplications, kWordDocTemp, 'Normal');
    // Folders
    DatabaseFolder := ReadString(sFolders, kDatabase, '');
    DatabaseOffcFolder := ReadString(sFolders, kDatabaseOffc, '');
    StoreFolder     := ReadString(sFolders, kStore, '');

    EmployeesPath   :=CheckLastSleshOnPath( StoreFolder,True)+'CompPersons\';

    HtmlEditor      := ExtractFilePath(Application.ExeName)+'HTMLEditor\HTMLEditor.exe';
    WebSourcePath   := CheckLastSleshOnPath( StoreFolder,True)+'WEB\';
    WebPathToImage  := WebSourcePath+'IMAGES\CONTENTS\';
    WebPathToHtml   := WebSourcePath+'TEMPLATE\CONTENTS\';

    InboxFolder := ReadString(sFolders, kInbox, '');
    OutboxFolder := ReadString(sFolders, kOutbox, '');
    MailAttachFolder := ReadString(sFolders, kMailAttach, '');
    TemplateFolder := ReadString(sFolders, kTemplFolder, '');
    PictureFolder := ReadString(sFolders, 'Pictures', '');
    HotelPictFolder := ReadString(sFolders, 'HotelPictures', '');
    PersonPictFolder := ReadString(sFolders, 'PersonPictures', '');
    Exchange1cFolder := ReadString(sFolders, 'Exchange1c', GetEnvironmentTempPath);
    // Documents
    MaxDocFileSize := ReadInteger(sDocuments, 'MaxDocFileSize', 128);
    MaxImageFileSize := ReadInteger(sDocuments, 'MaxImageFileSize', 128);
    // Tourist
    PassportExpireDuration := ReadInteger(sPassport, 'PassportExpireDuration', 10);
    PassportExpireCheckMonths := ReadInteger(sPassport, 'PassportExpireCheckMonths', 120);
    TouristTemplateItem := ReadInteger(sLastUsed, 'TouristTemplate', 0);
    // Dictionary
    UseCtrlKeyWithAdd := ReadBool(sBrowsers, 'FUseCtrlKeyWithAdd', True);
    // Insure
    InsureMaxPersonPerPolice := ReadInteger(sInsure, 'MaxPersonPerPolice', 5);
    InsureMaxGroupPerPolice := ReadInteger(sInsure, 'MaxGroupPerPolice', 50);
    InsureMaxMovePeriod := ReadInteger(sInsure, 'MaxMovePeriod', 91);
    InsureBreakPayRest :=
      SafeStrToFloat(ReadString(sInsure, 'BreakPayRest', '15'), 15);
    InsureMinBreakPayRest :=
      SafeStrToFloat(ReadString(sInsure, 'MinBreakPayRest', '1'), 1);
    PolicePrinterName := ReadString(sInsure, 'PolicePrinterName', 'Epson');
    // Rooming
    RoomingViewPeriod := ReadBool(sRooming, 'Period', False);
    RoomingViewMonthCount := ReadInteger(sRooming, 'MonthCount', 3);
    RoomingViewFromDate := ReadDateTime(sRooming, 'FromDate', Int(Now));
    RoomingViewTillDate :=
      ReadDateTime(sRooming, 'TillDate', Int(IncMonth(Now, RoomingViewMonthCount)));
    RoomingViewShowAge := ReadBool(sRooming, 'ShowAge', False);
    FLastOpRoomingViewLang :=  ReadInteger(sOptSetLastOpRoom, kRoomLanguage, 0);
    // Last Used
    LastUsedTourTemplate := ReadInteger(sLastUsed, 'TourTemplate', 0);
    LastOpTMCountry := ReadInteger(sOptSetLastOpTourman, kCountry, 0);
    LastOpTMCity := ReadInteger(sOptSetLastOpTourman, kCity, 0);
    LastOpTMHotel := ReadInteger(sOptSetLastOpTourman, kHotel, 0);
    LastOpTMRoute := ReadInteger(sOptSetLastOpTourman, kRoute, 0);
    LastOpTMFTrip := ReadInteger(sOptSetLastOpTourman, kFTrip, 0);
    LastOpTMBTrip := ReadInteger(sOptSetLastOpTourman, kBTrip, 0);
    LastOpManager := ReadInteger(sOptSetLastOpTourman, kOptSetLastManager, 0);
    LastOpTourViewPlace := ReadBool(sOptSetLastOpTourman, kTourView, False);
    LastOpTourTour := ReadInteger(sOptSetLastOpTourman, kOptSetTourTour, 0);
    LastOpTourDate := ReadDateTime(sOptSetLastOpTourman, kOptSetTourDate, 0);
    LastOpTourGroup := ReadInteger(sOptSetLastOpTourman, kOptSetTourGroup, 0);
    LastOpTourTempl := ReadInteger(sOptSetLastOpTourman, kOptSetTourTempl, 0);
    LastOpDictCountry := ReadInteger(sOptSetLastOpDiction, kCountry, 0);
    LastOpDictCity := ReadInteger(sOptSetLastOpDiction, kCity, 0);
    LastOpDictProvCountry := ReadInteger(sOptSetLastOpDiction, kProvCountry, 0);
    LastOpDictProvince := ReadInteger(sOptSetLastOpDiction, kProvince, 0);
    LastOpDictHCountry := ReadInteger(sOptSetLastOpDiction, kHotel + kCountry, 0);
    LastOpDictHCity := ReadInteger(sOptSetLastOpDiction, kHotel + kCity, 0);
    LastOpDictHotel := ReadInteger(sOptSetLastOpDiction, kHotel, 0);
    LastOpDictCompany := ReadInteger(sOptSetLastOpDiction, kCompany, 0);
    LastOpDictResort := ReadInteger(sOptSetLastOpDiction, kResort, 0);
    LastOpDictResortCntr := ReadInteger(sOptSetLastOpDiction, kResortCntr, 0);
    LastOpDictNaturObj := ReadInteger(sOptSetLastOpDiction, kNaturObj, 0);
    LastOpDictNaturCntrObj := ReadInteger(sOptSetLastOpDiction, kNaturCntrObj, 0);
    LastOpDictInfraObj := ReadInteger(sOptSetLastOpDiction, kInfraObj, 0);
    LastOpDictInfraCntrObj := ReadInteger(sOptSetLastOpDiction, kInfraCntrObj, 0);
    LastPriFilterDictCompany := ReadInteger(sOptSetLastOpDiction, kPriFilter, 0);
    LastSecFilterDictCompany := ReadInteger(sOptSetLastOpDiction, kSecFilter, 0);
    LastThirdFilterDictCompany := ReadInteger(sOptSetLastOpDiction, kThirdFilter, 0);
    LastCntryFilterDictCompany := ReadInteger(sOptSetLastOpDiction, kCntryFilter, 0);
    LastOpRouteRoute := ReadInteger(sOptSetLastOpRoute, kOptSetRouteRoute, 0);
    LastOpRouteShed := ReadInteger(sOptSetLastOpRoute, kOptSetRouteShed, 0);
    LastOpRouteFTrip := ReadInteger(sOptSetLastOpRoute, kOptSetRouteFTrip, 0);
    LastOpRouteBTrip := ReadInteger(sOptSetLastOpRoute, kOptSetRouteBTrip, 0);
    LastOpInsureTour  := ReadInteger(sOptSetLastOpInsure, kInsureTour, 0);
    LastOpInsureGroup := ReadInteger(sOptSetLastOpInsure, kInsureGroup, 0);
    LastOpInsureGroupDate := ReadDateTime(sOptSetLastOpInsure, kInsureGroupDate, 0);
    LastOpInsureOrder := ReadInteger(sOptSetLastOpInsure, kInsureOrder, 0);
    LastOpInsurePerson := ReadInteger(sOptSetLastOpInsure, kInsurePerson, 0);
    LastOpInsurePolice := ReadInteger(sOptSetLastOpInsure, kInsurePolice, 0);
    LastOpInsureVendor := ReadInteger(sOptSetLastOpInsure, kInsureVendor, 0);
    LastOpVisaSplit := ReadInteger(sOptSetLastOpVisa, kVisaSplit, 0);
    LastOpVisaCountry := ReadInteger(sOptSetLastOpVisa, kVisaCountry, 0);
    LastOpVisaDate := ReadDateTime(sOptSetLastOpVisa, kVisaDate, 0);
    LastOpVisaTour := ReadInteger(sOptSetLastOpVisa, kVisaTour, 0);
    LastOpVisaGroup := ReadInteger(sOptSetLastOpVisa, kVisaGroup, 0);
    LastOpVisaGrpDate := ReadDateTime(sOptSetLastOpVisa, kVisaGrpDate, 0);
    LastOpVisaOrder := ReadInteger(sOptSetLastOpVisa, kVisaOrder, 0);
    LastOpVisaPersId := ReadInteger(sOptSetLastOpVisa, kVisaPersId, 0);
    LastOpRoomSplit1 := ReadInteger(sOptSetLastOpRoom, kRoomSplit1, 0);
    LastOpRoomSplit2 := ReadInteger(sOptSetLastOpRoom, kRoomSplit2, 0);
    LastOpRouteRoute := ReadInteger(sOptSetLastOpRoute, kOptSetRouteRoute, 0);
    LastOpRouteFTrip := ReadInteger(sOptSetLastOpTourman, kFTrip, 0);
    LastOpRouteBTrip := ReadInteger(sOptSetLastOpTourman, kBTrip, 0);
    LastSortTourTour := ReadInteger(sOptSetLastSortTourman, kOptSetTourTour, 0);
    LastSortTourDate := ReadInteger(sOptSetLastSortTourman, kOptSetTourDate, 0);
    LastSortTourGroup := ReadInteger(sOptSetLastSortTourman, kOptSetTourGroup, 0);
    LastSortTourTempl := ReadInteger(sOptSetLastSortTourman, kOptSetTourTempl, 0);
    LastTourModeAction := ReadInteger(sOptSetLastOpTourman, kOptSetTourModeAction, 0);
    LastDaysCountForPlahta := ReadInteger(sOptSetLastOpTourman, kOptSetDaysCountForPlahta, 0);
    LastFilterTourArhived := ReadBool(sOptSetLastOpTourman, kOptSetFilterTourArhived, False);
    LastFilterTourPseudo := ReadBool(sOptSetLastOpTourman, kOptSetFilterTourPseudo, False);
    LastFilterTourUndefenced := ReadBool(sOptSetLastOpTourman, kOptSetFilterTourUndefenced, False);
    LastFilterTourDisabled := ReadBool(sOptSetLastOpTourman, kOptSetFilterTourDisabled, False);
    LastOpNewOrderCustomer := ReadInteger(sOptSetLastNewOrderCustomer, kCustomer, 1);
    LastOpExcursSplit := ReadInteger(sOptSetLastOpExcurs, kExcursSplit, 0);
    LastOpExcursTour := ReadInteger(sOptSetLastOpExcurs, kExcursTour, 0);
    LastOpExcursGrpDate := ReadDateTime(sOptSetLastOpExcurs, kExcursGrpDate, 0);
    LastOpExcursGroup := ReadInteger(sOptSetLastOpExcurs, kExcursGroup, 0);
    LastOpExcursCountry := ReadInteger(sOptSetLastOpExcurs, kExcursCountry, 0);
    LastOpExcursCity := ReadInteger(sOptSetLastOpExcurs, kExcursCity, 0);
    LastOpExcursion := ReadInteger(sOptSetLastOpExcurs, kExcursion, 0);
    LastOpExcursDate := ReadDateTime(sOptSetLastOpExcurs, kExcursDate, 0);
  end;
end;

procedure TOptionSet.DefaultWriteOptions(IniFile: TIniFile);
{var
  S: string;
  I, N: Integer;}
begin
  with IniFile do
  begin
    {for I := 0 to optViewGrids - 1 do
    begin
      if I > plcInaccessible then N := I - plcInaccessible else N := I;
      S := plcPlacePayStates[N];
      if I > plcInaccessible then S := S + 'This';
      WriteInteger(sColors, S, Colors[I]);
    end;
    WriteInteger(sColors, kViewGrids, Colors[optViewGrids]);
    WriteInteger(sColors, kViewGrids + '1', Colors[optViewGrids + 1]);
    WriteInteger(sMoney, kCurrencyRate, FCurrencyInter);
    WriteString(sMoney, kExchangeDues, FormatCurr('0.00', ExchangeDues));
    WriteInteger(sOrders, kReservTime + 'Min', ReservTimeMin);
    WriteInteger(sOrders, kReservTime + 'Max', ReservTimeMax);
    WriteString(sOrders, kOrderTimeBias, TimeToStr(OrderTimeBias));
    WriteInteger(sOrders, kOrderReservTime, OrderReservTime);
    WriteInteger(sOrders, kOrderReservTime + 'Hot', OrderHotReservTime);
    WriteInteger(sOrders, kPostExpireTime, PostExpireTime);
    WriteInteger(sCommon, kDefault + kCountry, DefaultCountry);
    WriteInteger(sCommon, kDefault + kCurrency, DefaultCurrency);
    WriteInteger(sCommon, kLocale + kCountry, LocaleCountry);
    WriteInteger(sCommon, kLocale + kCurrency, LocaleCurrency);
    WriteInteger(sCommon, kLocale + kCity, LocaleCity);
    WriteInteger(sCommon, kLocale + kCompany, LocaleCompany);
    WriteString(sCommon, kLocale + kCompSign, LocaleCompanySign);
    WriteString(sApplications, kWordDocTemp, WordDocTemplate);
    WriteString(sFolders, kDatabase, DatabaseFolder);
    WriteString(sFolders, kStore, StoreFolder);
    WriteString(sFolders, kInbox, InboxFolder);
    WriteString(sFolders, kOutbox, OutboxFolder);
    WriteString(sFolders, kMailAttach, MailAttachFolder);
    WriteString(sFolders, kTemplFolder, TemplateFolder);
    WriteString(sFolders, 'Pictures', PictureFolder);
    WriteString(sFolders, 'HotelPictures', HotelPictFolder);
    WriteString(sFolders, 'PersonPictures', PersonPictFolder);
    WriteString(sFolders, 'Exchange1c', Exchange1cFolder);
    WriteInteger(sDocuments, 'MaxDocFileSize', MaxDocFileSize);
    WriteInteger(sDocuments, 'MaxImageFileSize', MaxImageFileSize);
    WriteInteger(sPassport, 'PassportExpireDuration', PassportExpireDuration);
    WriteInteger(sPassport, 'PassportExpireCheckMonths', PassportExpireCheckMonths);
    WriteInteger(sLastUsed, 'TouristTemplate', TouristTemplateItem);
    WriteBool(sBrowsers, 'FUseCtrlKeyWithAdd', UseCtrlKeyWithAdd);
    WriteInteger(sLastUsed, 'TourTemplate', LastUsedTourTemplate);
    WriteInteger(sInsure, 'MaxPersonPerPolice', InsureMaxPersonPerPolice);
    WriteInteger(sInsure, 'MaxGroupPerPolice', InsureMaxGroupPerPolice);
    WriteInteger(sInsure, 'MaxMovePeriod', InsureMaxMovePeriod);
    WriteString(sInsure, 'BreakPayRest', FormatCurr('0.00', InsureBreakPayRest));
    WriteString(sInsure, 'MinBreakPayRest', FormatCurr('0.00', InsureMinBreakPayRest));
    WriteString(sInsure, 'PolicePrinterName', PolicePrinterName);
    WriteInteger(sLastOpTourman, kCountry, LastOpTMCountry);
    WriteInteger(sLastOpTourman, kCity, LastOpTMCity);
    WriteInteger(sLastOpTourman, kHotel, LastOpTMHotel);
    WriteInteger(sLastOpTourman, kRoute, LastOpTMRoute);
    WriteInteger(sLastOpTourman, kFTrip, LastOpTMFTrip);
    WriteInteger(sLastOpTourman, kBTrip, LastOpTMBTrip);
    WriteInteger(sLastOpTourman, kTourTour, LastOpTourTour);
    WriteInteger(sLastOpTourman, kTourGroup, LastOpTourGroup);
    WriteInteger(sLastOpDiction, kCountry, LastOpDictCountry);
    WriteInteger(sLastOpDiction, kCity, LastOpDictCity);
    WriteInteger(sLastOpDiction, kHotel + kCountry, LastOpDictHCountry);
    WriteInteger(sLastOpDiction, kHotel + kCity, LastOpDictHCity);
    WriteInteger(sLastOpDiction, kHotel, LastOpDictHotel);
    WriteInteger(sLastOpDiction, kCompany, LastOpDictCompany);}
  end;
end;

destructor TOptionSet.Destroy;
begin
  WriteOptions;
  inherited Destroy;
end;

function TOptionSet.GetColors(Index: Integer): TColor;
begin
  Result := FColors[Index];
end;

function TOptionSet.KeyReadBool(const Section, Ident: string;
  Default: Boolean): Boolean;
begin
  if not Assigned(FIniFile) then Result := Default
  else Result := FIniFile.ReadBool(Section, Ident, Default);
end;

function TOptionSet.KeyReadDate(const Section, Ident: string;
  Default: TDateTime): TDateTime;
begin
  if not Assigned(FIniFile) then Result := Default
  else Result := FIniFile.ReadDate(Section, Ident, Default);
end;

function TOptionSet.KeyReadDateTime(const Section, Ident: string;
  Default: TDateTime): TDateTime;
begin
  if not Assigned(FIniFile) then Result := Default
  else Result := FIniFile.ReadDateTime(Section, Ident, Default);
end;

function TOptionSet.KeyReadFloat(const Section, Ident: string;
  Default: Double): Double;
begin
  if not Assigned(FIniFile) then Result := Default
  else Result := FIniFile.ReadFloat(Section, Ident, Default);
end;

function TOptionSet.KeyReadInteger(const Section, Ident: string;
  Default: Integer): Longint;
begin
  if not Assigned(FIniFile) then Result := Default
  else Result := FIniFile.ReadInteger(Section, Ident, Default);
end;

function TOptionSet.KeyReadString(const Section, Ident, Default: string): string;
begin
  if not Assigned(FIniFile) then Result := Default
  else Result := FIniFile.ReadString(Section, Ident, Default);
end;

function TOptionSet.KeyReadTime(const Section, Ident: string; Default: TDateTime): TDateTime;
begin
  if not Assigned(FIniFile) then Result := Default
  else Result := FIniFile.ReadTime(Section, Ident, Default);
end;

procedure TOptionSet.KeyWriteBool(const Section, Ident: string;
  Value: Boolean);
begin
  if Assigned(FIniFile) then FIniFile.WriteBool(Section, Ident, Value);
end;

procedure TOptionSet.KeyWriteDate(const Section, Ident: string; Value: TDateTime);
begin
  if Assigned(FIniFile) then FIniFile.WriteDate(Section, Ident, Value);
end;

procedure TOptionSet.KeyWriteDateTime(const Section, Ident: string;
  Value: TDateTime);
begin
  if Assigned(FIniFile) then FIniFile.WriteDateTime(Section, Ident, Value);
end;

procedure TOptionSet.KeyWriteFloat(const Section, Ident: string;
  Value: Double);
begin
  if Assigned(FIniFile) then FIniFile.WriteFloat(Section, Ident, Value);
end;

procedure TOptionSet.KeyWriteInteger(const Section, Ident: string; Value: Integer);
begin
  if Assigned(FIniFile) then FIniFile.WriteInteger(Section, Ident, Value);
end;

procedure TOptionSet.KeyWriteString(const Section, Ident, Value: String);
begin
  if Assigned(FIniFile) then FIniFile.WriteString(Section, Ident, Value);
end;

procedure TOptionSet.KeyWriteTime(const Section, Ident: string; Value: TDateTime);
begin
  if Assigned(FIniFile) then FIniFile.WriteTime(Section, Ident, Value);
end;

procedure TOptionSet.ReadOptions;
begin
  FIniFile := TIniFile.Create(IniFileName);
  try
    DefaultReadOptions(FIniFile);
  finally
    FIniFile.Free;
    FIniFile := nil;
  end;
end;

procedure TOptionSet.SetColors(Index: Integer; Value: TColor);
begin
  FColors[Index] := Value;
end;

procedure TOptionSet.SetLastOpManager(const Value: Integer);
begin
  FLastOpManager := Value;
  CreateIniFile(IniFileName,sOptSetLastOpTourman,kOptSetLastManager,IntToStr( FLastOpManager ) );
end;

procedure TOptionSet.SetCurrencyInter(const Value: Integer);
begin
  FCurrencyInter := Value;
end;

procedure TOptionSet.SetExchangeDues(const Value: Double);
begin
  FExchangeDues := Value;
end;

procedure TOptionSet.SetOrderHotReservTime(const Value: Integer);
begin
  FOrderHotReservTime := Value;
end;

procedure TOptionSet.SetOrderReservTime(const Value: Integer);
begin
  FOrderReservTime := Value;
end;

procedure TOptionSet.SetOrderTimeBias(const Value: TDateTime);
begin
  FOrderTimeBias := Value;
end;

procedure TOptionSet.SetPolicePrinterName(const Value: string);
begin
  FPolicePrinterName := Value;
end;

procedure TOptionSet.SetPostExpireTime(const Value: Integer);
begin
  FPostExpireTime := Value;
end;

procedure TOptionSet.SetReservTimeMax(const Value: Integer);
begin
  FReservTimeMax := Value;
end;

procedure TOptionSet.SetReservTimeMin(const Value: Integer);
begin
  FReservTimeMin := Value;
end;

procedure TOptionSet.WriteOptions;
begin
  FIniFile := TIniFile.Create(IniFileName);
  try
    if Assigned(ModuleWriteOptions) then ModuleWriteOptions
    else DefaultWriteOptions(FIniFile);
  finally
    FIniFile.Free;
    FIniFile := nil;
  end;
end;

{$ENDIF}

end.