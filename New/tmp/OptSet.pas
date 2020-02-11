unit OptSet;

interface

uses Windows, Messages, SysUtils, Classes, Graphics;

{$DEFINE TourManP}

{$IFDEF TourManP}

const
  optViewGrids = 12;
  optColorCount = optViewGrids + 1; // size of Color array

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
    function GetColors(Index: Integer): TColor;
    procedure SetColors(Index: Integer; Value: TColor);
    procedure SetCurrencyInter(const Value: Integer);
    procedure SetExchangeDues(const Value: Double);
    procedure SetOrderReservTime(const Value: Integer);
    procedure SetOrderTimeBias(const Value: TDateTime);
    procedure SetReservTimeMax(const Value: Integer);
    procedure SetReservTimeMin(const Value: Integer);
    procedure SetPostExpireTime(const Value: Integer);
    procedure SetOrderHotReservTime(const Value: Integer);
    procedure SetPolicePrinterName(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    property Colors[Index: Integer]: TColor read GetColors write SetColors;
    property CurrencyInter: Integer read FCurrencyInter write SetCurrencyInter;
    property ExchangeDues: Double read FExchangeDues write SetExchangeDues;
    property ReservTimeMin: Integer read FReservTimeMin write SetReservTimeMin;
    property ReservTimeMax: Integer read FReservTimeMax write SetReservTimeMax;
    property OrderTimeBias: TDateTime read FOrderTimeBias write SetOrderTimeBias;
    property OrderReservTime: Integer read FOrderReservTime write SetOrderReservTime;
    property OrderHotReservTime: Integer read FOrderHotReservTime write SetOrderHotReservTime;
    property PostExpireTime: Integer read FPostExpireTime write SetPostExpireTime;
    property DefaultCountry: Integer read FDefaultCountry write FDefaultCountry;
    property DefaultCurrency: Integer read FDefaultCurrency write FDefaultCurrency;
    property LocaleCountry: Integer read FLocaleCountry write FLocaleCountry;
    property LocaleCity: Integer read FLocaleCity write FLocaleCity;
    property LocaleCurrency: Integer read FLocaleCurrency write FLocaleCurrency;
    property WordDocTemplate: string read FWordDocTemplate write FWordDocTemplate;
    property DatabaseFolder: string read FDatabaseFolder write FDatabaseFolder;
    property InboxFolder: string read FInboxFolder write FInboxFolder;
    property OutboxFolder: string read FOutboxFolder write FOutboxFolder;
    property TemplateFolder: string read FTemplateFolder write FTemplateFolder;
    property MailAttachFolder: string read FMailAttachFolder write FMailAttachFolder;
    property PictureFolder: string read FPictureFolder write FPictureFolder;
    property HotelPictFolder: string read FHotelPictFolder write FHotelPictFolder;
    property PersonPictFolder: string read FPersonPictFolder write FPersonPictFolder;
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
    property LastOpTMCountry: Integer read FLastOpTMCountry write FLastOpTMCountry;
    property LastOpTMCity: Integer read FLastOpTMCity write FLastOpTMCity;
    property LastOpTMHotel: Integer read FLastOpTMHotel write FLastOpTMHotel;
    property LastOpTMRoute: Integer read FLastOpTMRoute write FLastOpTMRoute;
    property LastOpTMFTrip: Integer read FLastOpTMFTrip write FLastOpTMFTrip;
    property LastOpTMBTrip: Integer read FLastOpTMBTrip write FLastOpTMBTrip;
    property LastOpDictCountry: Integer read FLastOpDictCountry write FLastOpDictCountry;
    property LastOpDictCity: Integer read FLastOpDictCity write FLastOpDictCity;
    property LastOpDictHCountry: Integer read FLastOpDictHCountry write FLastOpDictHCountry;
    property LastOpDictHCity: Integer read FLastOpDictHCity write FLastOpDictHCity;
    property LastOpDictHotel: Integer read FLastOpDictHotel write FLastOpDictHotel;
    procedure ReadOptions;
    procedure WriteOptions;
  end;

var
  OptionSet: TOptionSet;

{$ENDIF}

function GetMainOptions: Boolean;
function GetDatabaseFolderName: string;
function IniFileName: string;
procedure LoadRegistryStrings(const Key: string; Strings: TStrings; Addits: TStrings = nil);


implementation

uses IniFiles, Controls,
{$IFDEF TourManP}
  VDlgs, TourConsts,
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
  sPassport = 'Passport';
  sLastUsed = 'LastUsed';
  sBrowsers = 'Browsers';
  sInsure = 'Insure';
  sLastOpTourman = 'LastOpened\Tourman';
  sLastOpDiction = 'LastOpened\Diction';
  kViewGrids = 'ViewGrids';
  kExchangeDues = 'ExchangeDues';
  kCurrencyRate = 'CurrencyRate';
  kReservTime = 'ReservTime';
  kOrderTimeBias = 'OrderTimeBias';
  kOrderReservTime = 'OrderReservTime';
  kPostExpireTime = 'PostExpireTime';
  kDesign = 'Design';
  kDatabase = 'Database';
  kLocale = 'Locale';
  kDefault = 'Default';
  kCurrency = 'Currency';
  kCountry = 'Country';
  kCity = 'City';
  kHotel = 'Hotel';
  kRoute = 'Route';
  kFTrip = 'FrwTrip';
  kBTrip = 'BkwTrip';
  kWordDocTemp = 'WordDocTemp';
  kInbox = 'Inbox';
  kOutbox = 'Outbox';
  kMailAttach = 'MailAttach';
  kTemplFolder = 'TemplFolder';

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

{$IFDEF TourManP}

{ TOptionSet }

constructor TOptionSet.Create;
begin
  inherited Create;
  ReadOptions;
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

procedure TOptionSet.ReadOptions;
var
  S: string;
  I, N: Integer;
begin
  with TIniFile.Create(IniFileName) do
  try
    // Order
    ReservTimeMin := ReadInteger(sOrders, kReservTime + 'Min', 2);
    ReservTimeMax := ReadInteger(sOrders, kReservTime + 'Max', 240);
    OrderTimeBias := SafeStrToTime(
      ReadString(sOrders, kOrderTimeBias, '00:15'), StrToTime('00:15'));
    OrderReservTime := ReadInteger(sOrders, kOrderReservTime, 24);
    OrderHotReservTime := ReadInteger(sOrders, kOrderReservTime + 'Hot', 1);
    PostExpireTime := ReadInteger(sOrders, kPostExpireTime, 14);
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
    DefaultCurrency := ReadInteger(sCommon, kDefault + kCurrency, 8);
    DefaultCountry := ReadInteger(sCommon, kDefault + kCountry, 0);
    LocaleCurrency := ReadInteger(sCommon, kLocale + kCurrency, 75);
    LocaleCountry := ReadInteger(sCommon, kLocale + kCountry, 0);
    LocaleCity := ReadInteger(sCommon, kLocale + kCity, 0);
    WordDocTemplate := ReadString(sApplications, kWordDocTemp, 'Normal');
    // Folders
    DatabaseFolder := ReadString(sFolders, kDatabase, '');
    InboxFolder := ReadString(sFolders, kInbox, '');
    OutboxFolder := ReadString(sFolders, kOutbox, '');
    MailAttachFolder := ReadString(sFolders, kMailAttach, '');
    TemplateFolder := ReadString(sFolders, kTemplFolder, '');
    PictureFolder := ReadString(sFolders, 'Pictures', '');
    HotelPictFolder := ReadString(sFolders, 'HotelPictures', '');
    PersonPictFolder := ReadString(sFolders, 'PersonPictures', '');
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
    // Last Used
    LastUsedTourTemplate := ReadInteger(sLastUsed, 'TourTemplate', 0);
    LastOpTMCountry := ReadInteger(sLastOpTourman, kCountry, 0);
    LastOpTMCity := ReadInteger(sLastOpTourman, kCity, 0);
    LastOpTMHotel := ReadInteger(sLastOpTourman, kHotel, 0);
    LastOpTMRoute := ReadInteger(sLastOpTourman, kRoute, 0);
    LastOpTMFTrip := ReadInteger(sLastOpTourman, kFTrip, 0);
    LastOpTMBTrip := ReadInteger(sLastOpTourman, kBTrip, 0);
    LastOpDictCountry := ReadInteger(sLastOpDiction, kCountry, 0);
    LastOpDictCity := ReadInteger(sLastOpDiction, kCity, 0);
    LastOpDictHCountry := ReadInteger(sLastOpDiction, kHotel + kCountry, 0);
    LastOpDictHCity := ReadInteger(sLastOpDiction, kHotel + kCity, 0);
    LastOpDictHotel := ReadInteger(sLastOpDiction, kHotel, 0);
  finally
    Free;
  end;
end;

procedure TOptionSet.SetColors(Index: Integer; Value: TColor);
begin
  FColors[Index] := Value;
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
var
  S: string;
  I, N: Integer;
begin
  with TIniFile.Create(IniFileName) do
  try
    for I := 0 to optViewGrids - 1 do
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
    WriteString(sApplications, kWordDocTemp, WordDocTemplate);
    WriteString(sFolders, kDatabase, DatabaseFolder);
    WriteString(sFolders, kInbox, InboxFolder);
    WriteString(sFolders, kOutbox, OutboxFolder);
    WriteString(sFolders, kMailAttach, MailAttachFolder);
    WriteString(sFolders, kTemplFolder, TemplateFolder);
    WriteString(sFolders, 'Pictures', PictureFolder);
    WriteString(sFolders, 'HotelPictures', HotelPictFolder);
    WriteString(sFolders, 'PersonPictures', PersonPictFolder);
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
    WriteInteger(sLastOpDiction, kCountry, LastOpDictCountry);
    WriteInteger(sLastOpDiction, kCity, LastOpDictCity);
    WriteInteger(sLastOpDiction, kHotel + kCountry, LastOpDictHCountry);
    WriteInteger(sLastOpDiction, kHotel + kCity, LastOpDictHCity);
    WriteInteger(sLastOpDiction, kHotel, LastOpDictHotel);
  finally
    Free;
  end;
end;

{$ENDIF}

end.
