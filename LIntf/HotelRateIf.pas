unit HotelRateIf;

interface

type THotelRateResult =
  (hrFunctionCallError,      // неможливо викликати функцію з DLL
   hrRateOk,                 // тариф нормально знайдено
   hrImposibleLayout,        // таке розміщення в даному номері неможливо
   hrRateNotFound,           // для даного готелю немає тарифу
   hrRateByParamNotFound);   // немає тарифу для заданих параметрів

// Визначає вартість проживання
// Повертає True якщо тариф знайдено
// Вхідні параметри:
  //  HotelId - ідентифікатор готелю
  //  RoomTypeId - ідентифікатор готельної кімнати
  //  HotelVendorId - ідентифікатор постачальника / 0 - якщо невідомий
  //  FromDate - дата поселення
  //  DayCount - к-сть діб проживання
  //  BirthDate - дата народження особи, що їде
  //  BerthType - ідентифікатор розміщення / 0 - якщо невідомий
  //  FeedType - ідентифікатор типу харчування
  //  ShowErrors - признак відображення діалогів з помилками
//Вихідні параметри
  //  RateU - значення тарифу у національній валюті
  //  RateV - значення тарифу у іноземній валюті
  //  DiscountU - значення максимальної знижки у національній валюті
  //  DiscountV - значення максимальної знижки у іноземній валюті
  //  AgentDiscountU - значення агентської знижки у національній валюті
  //  AgentDiscountV - значення агентської знижки у іноземній валюті
  //  CorporateDiscountU - значення корпоративної знижки у національній валюті
  //  CorporateDiscountV - значення корпоративної знижки у іноземній валюті
  //  PermClientDiscountU - значення знижки пост клієнтів у національній валюті
  //  PermClientDiscountV - значення знижки пост клієнтів у іноземній валюті
  //  VCurrencyId - ідентифікатор іноземної валюти
  //    Якщо суми немає то вказуєм :=0

function GetHotelRateValue(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  BerthType, FeedType: integer;
  ShowErrors : boolean;
  var RateU, RateV,
      DiscountU, DiscountV,
      AgentDiscountU, AgentDiscountV,
      CorporateDiscountU, CorporateDiscountV,
      PermClientDiscountU, PermClientDiscountV : Extended;
  var RateVCurrencyId: Integer): boolean;

// Визначає вартість проживання зі всіма парметрами
// Повертає True якщо тариф знайдено
// Вхідні параметри:
  //  HotelId - ідентифікатор готелю
  //  RoomTypeId - ідентифікатор готельної кімнати
  //  HotelVendorId - ідентифікатор постачальника
  //  FromDate - дата поселення
  //  DayCount - к-сть діб проживання
  //  BirthDate - дата народження особи, що їде
  //  BerthType - ідентифікатор розміщення
  //  FeedType - ідентифікатор типу харчування
  //  ShowErrors - признак відображення повідомлень про помилку;
//Вихідні параметри
  //  RateU - значення 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  RateV - значення 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  RateU2 - значення 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  RateV2 - значення 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  DiscountU - знижка 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  DiscountV - знижка 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  DiscountU2 - знижка 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  DiscountV2 - знижка 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  AgentDiscountU - агентська знижка 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  AgentDiscountV - агентська знижка 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  AgentDiscountU2 - агентська знижка 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  AgentDiscountV2 - агентська знижка 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  CorporateDiscountU - корпоративна знижка 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  CorporateDiscountV - корпоративна знижка 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  CorporateDiscountU2 - корпоративна знижка 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  CorporateDiscountV2 - корпоративна знижка 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  PermClientDiscountU - знижка пост клієнтів 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  PermClientDiscountV - знижка пост клієнтів 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  PermClientDiscountU2 - знижка пост клієнтів 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  PermClientDiscountV2 - знижка пост клієнтів 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  VCurrencyId - ідентифікатор іноземної валюти
  //  NettoU - значення вхідної ціни (у національній валюті)
  //  NettoV - значення вхідної ціни (у іноземній валюті)
  //  VAT_rate - розмір ставки першого ПДВ
  //  VAT2_rate - розмір ставки 2-го ПДВ
  //  VAT_id - ідентифікатор виду першого ПДВ
  //  VAT2_id - ідентифікатор виду 2-го ПДВ
  //  View_Id - ідентифікатор виду (оскільки вид вибирається, то потрібно його повертати)

function GetHotelRateValueEx(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  BerthType, FeedType: integer;
  ShowErrors : boolean;
  var RateU, RateV, RateU2, RateV2,
      DiscountU, DiscountV, DiscountU2, DiscountV2,
      AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
      CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
      PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2 : Extended;
  var VCurrencyId: Integer;
  var NettoU, NettoV: extended;
  var VAT_rate, VAT2_rate : extended;
  var VAT_id, VAT2_id, View_Id: integer) : boolean;

// Визначає вартість проживання для групи осіб
// Повертає True якщо тариф знайдено
// Вхідні параметри:
  //  HotelId - ідентифікатор готелю
  //  RoomTypeId - ідентифікатор готельної кімнати
  //  HotelVendorId - ідентифікатор постачальника
  //  FromDate - дата поселення
  //  DayCount - к-сть діб проживання
  //  BirthDates - масив дат народження осіб, що їдуть
  //  FeedType - ідентифікатор типу харчування
  //  ShowErrors - признак відображення повідомлень про помилку
//Вихідні параметри
  //  BerthTypes - масив ідентифікаторів розміщення (повинен бути ініціалізованим і по розміру співпадати з BirthDates)
  //  RateU - значення тарифу у національній валюті
  //  RateV - значення тарифу у іноземній валюті
  //  DiscountU - значення максимальної знижки у національній валюті
  //  DiscountV - значення максимальної знижки у іноземній валюті
  //  AgentDiscountU - значення агентської знижки у національній валюті
  //  AgentDiscountV - значення агентської знижки у іноземній валюті
  //  CorporateDiscountU - значення корпоративної знижки у національній валюті
  //  CorporateDiscountV - значення корпоративної знижки у іноземній валюті
  //  PermClientDiscountU - значення знижки пост клієнтів у національній валюті
  //  PermClientDiscountV - значення знижки пост клієнтів у іноземній валюті
  //  VCurrencyId - ідентифікатор іноземної валюти
  //    Якщо якоїсь суми немає то повертається 0

function GetHotelRateMultPersonValue(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer;
  BirthDays : array of TDateTime;
  FeedType: integer;
  ShowErrors : boolean;
  var BerthTypes : array of integer;
  var RateU, RateV,
      DiscountU, DiscountV,
      AgentDiscountU, AgentDiscountV,
      CorporateDiscountU, CorporateDiscountV,
      PermClientDiscountU, PermClientDiscountV : Extended;
  var VCurrencyId: Integer): boolean;

// Визначає вартість проживання групи осіб зі всіма парметрами
// Повертає True якщо тариф знайдено
// Вхідні параметри:
  //  HotelId - ідентифікатор готелю
  //  RoomTypeId - ідентифікатор готельної кімнати
  //  HotelVendorId - ідентифікатор постачальника
  //  FromDate - дата поселення
  //  DayCount - к-сть діб проживання
  //  BirthDates - масив дат народження осіб, що їдуть
  //  FeedType - ідентифікатор типу харчування
  //  ShowErrors - признак відображення повідомлень про помилку
//Вихідні параметри
  //  BerthTypes - масив ідентифікаторів розміщення (повинен бути ініціалізованим і по розміру співпадати з BirthDates)
  //  RateU - значення 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  RateV - значення 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  RateU2 - значення 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  RateV2 - значення 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  DiscountU - знижка 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  DiscountV - знижка 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  DiscountU2 - знижка 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  DiscountV2 - знижка 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  AgentDiscountU - агентська знижка 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  AgentDiscountV - агентська знижка 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  AgentDiscountU2 - агентська знижка 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  AgentDiscountV2 - агентська знижка 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  CorporateDiscountU - корпоративна знижка 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  CorporateDiscountV - корпоративна знижка 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  CorporateDiscountU2 - корпоративна знижка 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  CorporateDiscountV2 - корпоративна знижка 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  PermClientDiscountU - знижка пост клієнтів 1-ї частини тарифу (у національній валюті, ПДВ1)
  //  PermClientDiscountV - знижка пост клієнтів 1-ї частини тарифу (у іноземній валюті, ПДВ1)
  //  PermClientDiscountU2 - знижка пост клієнтів 2-ї частини тарифу (у національній валюті, ПДВ2)
  //  PermClientDiscountV2 - знижка пост клієнтів 2-ї частини тарифу (у іноземній валюті, ПДВ2)
  //  VCurrencyId - ідентифікатор іноземної валюти
  //  NettoU - значення вхідної ціни (у національній валюті)
  //  NettoV - значення вхідної ціни (у іноземній валюті)
  //  VAT_rate - розмір ставки першого ПДВ
  //  VAT2_rate - розмір ставки 2-го ПДВ
  //  VAT_id - ідентифікатор виду першого ПДВ
  //  VAT2_id - ідентифікатор виду 2-го ПДВ
  //  View_Id - ідентифікатор виду (оскільки вид вибирається, то потрібно його повертати)

function GetHotelRateMultPersonValueEx(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer;
  BirthDays: array of TDateTime;
  FeedType: integer;
  ShowErrors : boolean;
  var BerthTypes : array of integer;
  var RateU, RateV, RateU2, RateV2,
      DiscountU, DiscountV, DiscountU2, DiscountV2,
      AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
      CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
      PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2 : Extended;
  var VCurrencyId: Integer;
  var NettoU, NettoV: extended;
  var VAT_rate, VAT2_rate : extended;
  var VAT_id, VAT2_id, View_Id: integer) : boolean;

// Змінна котра містить останню рзультат отримання тарифу
var LastHotelRateResult : THotelRateResult;

implementation

uses Windows, Forms, TourCmnlIf, Dialogs, SysUtils, LIfConsts;

type
  TAssignAppProc = procedure(AppHandle: LongWord);

  TGetHotelRateValueExFunc = function(AppHandle: LongWord;
    HotelId, RoomTypeId, HotelVendorId: Integer;
    FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
    BerthType, FeedType: integer;
    ShowErrors : boolean;
    var RateU, RateV, RateU2, RateV2,
        DiscountU, DiscountV, DiscountU2, DiscountV2,
        AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
        CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
        PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2 : Extended;
    var VCurrencyId: Integer;
    var NettoU, NettoV: extended;
    var VAT_rate, VAT2_rate : extended;
    var VAT_id, VAT2_id, View_Id : integer): THotelRateResult;

  TGetHotelRateValueFunc = function(AppHandle: LongWord;
    HotelId, RoomTypeId, HotelVendorId: Integer;
    FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
    BerthType, FeedType: integer;
    ShowErrors : boolean;
    var RateU, RateV,
        DiscountU, DiscountV,
        AgentDiscountU, AgentDiscountV,
        CorporateDiscountU, CorporateDiscountV,
        PermClientDiscountU, PermClientDiscountV : Extended;
    var VCurrencyId: Integer): THotelRateResult;

  TGetHotelRateMultPersonValueExFunc = function(AppHandle: LongWord;
    HotelId, RoomTypeId, HotelVendorId: Integer;
    FromDate: TDateTime; DayCount: Integer;
    BirthDays: array of TDateTime;
    FeedType: integer;
    ShowErrors : boolean;
    var BerthTypes : array of integer;
    var RateU, RateV, RateU2, RateV2,
        DiscountU, DiscountV, DiscountU2, DiscountV2,
        AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
        CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
        PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2 : Extended;
    var VCurrencyId: Integer;
    var NettoU, NettoV: extended;
    var VAT_rate, VAT2_rate : extended;
    var VAT_id, VAT2_id, View_Id : integer): THotelRateResult;

  TGetHotelRateMultPersonValueFunc = function(AppHandle: LongWord;
    HotelId, RoomTypeId, HotelVendorId: Integer;
    FromDate: TDateTime; DayCount: Integer;
    BirthDays : array of TDateTime;
    FeedType: integer;
    ShowErrors : boolean;
    var BerthTypes : array of integer;
    var RateU, RateV,
        DiscountU, DiscountV,
        AgentDiscountU, AgentDiscountV,
        CorporateDiscountU, CorporateDiscountV,
        PermClientDiscountU, PermClientDiscountV : Extended;
    var VCurrencyId: Integer): THotelRateResult;

var
  AppHandle: LongWord;
  LibHandle: THandle;
  RateLibLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  GetHotelRateValueFunc: TGetHotelRateValueFunc;
  GetHotelRateValueExFunc: TGetHotelRateValueExFunc;
  GetHotelRateMultPersonValueFunc: TGetHotelRateMultPersonValueFunc;
  GetHotelRateMultPersonValueExFunc: TGetHotelRateMultPersonValueExFunc;

{$WARN UNSAFE_CODE OFF}

procedure AssignLibHandle;
begin
  if LibHandle <> 0 then
  begin
    @AssignAppProc := GetProcAddress(LibHandle, 'AssignAppHandle');
    if @AssignAppProc <> nil then AssignAppProc(Application.MainForm.Handle);
  end;
end;

const
  LName = 'HotelRates.dll';

function LoadRateLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  RateLibLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadHotelRateFatal);
end;

function IsRateLibLoaded: Boolean;
begin
  if not RateLibLoaded then
  begin
    LoadRateLib(True);
    if RateLibLoaded then AssignLibHandle;
  end;
  Result := RateLibLoaded;
end;

function GetHotelRateValueEx(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  BerthType, FeedType: integer;
  ShowErrors : boolean;
  var RateU, RateV, RateU2, RateV2,
      DiscountU, DiscountV, DiscountU2, DiscountV2,
      AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
      CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
      PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2 : Extended;
  var VCurrencyId: Integer;
  var NettoU, NettoV: extended;
  var VAT_rate, VAT2_rate : extended;
  var VAT_id, VAT2_id, View_id : integer) : boolean;
begin
  LastHotelRateResult := hrFunctionCallError;
  if IsRateLibLoaded then
  begin
    @GetHotelRateValueExFunc := GetProcAddress(LibHandle, 'GetHotelRateValueEx');
    if @GetHotelRateValueExFunc <> nil then
      LastHotelRateResult := GetHotelRateValueExFunc(AppHandle, HotelId, RoomTypeId,
        HotelVendorId, FromDate, DayCount, BirthDay, BerthType, FeedType,
        ShowErrors,
        RateU,
        RateV, RateU2, RateV2,
        DiscountU, DiscountV, DiscountU2, DiscountV2,
        AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
        CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
        PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2,
        VCurrencyId, NettoU, NettoV, VAT_rate, VAT2_rate,
        VAT_id, VAT2_id, View_id);
  end;
  Result := LastHotelRateResult = hrRateOk;
end;

function GetHotelRateValue(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  BerthType, FeedType: integer;
  ShowErrors : boolean;
  var RateU, RateV,
      DiscountU, DiscountV,
      AgentDiscountU, AgentDiscountV,
      CorporateDiscountU, CorporateDiscountV,
      PermClientDiscountU, PermClientDiscountV : Extended;
  var RateVCurrencyId: Integer): boolean;
begin
  LastHotelRateResult := hrFunctionCallError;
  if IsRateLibLoaded then
  begin
    @GetHotelRateValueFunc := GetProcAddress(LibHandle, 'GetHotelRateValue');
    if @GetHotelRateValueFunc <> nil then
      LastHotelRateResult := GetHotelRateValueFunc( AppHandle,
        HotelId, RoomTypeId, HotelVendorId, FromDate, DayCount, BirthDay,
        BerthType, FeedType,
        ShowErrors,
        RateU, RateV,
        DiscountU, DiscountV,
        AgentDiscountU, AgentDiscountV,
        CorporateDiscountU, CorporateDiscountV,
        PermClientDiscountU, PermClientDiscountV,
        RateVCurrencyId);
  end;
  Result := LastHotelRateResult = hrRateOk;
end;

function GetHotelRateMultPersonValueEx(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer;
  BirthDays: array of TDateTime;
  FeedType: integer;
  ShowErrors : boolean;
  var BerthTypes : array of integer;
  var RateU, RateV, RateU2, RateV2,
      DiscountU, DiscountV, DiscountU2, DiscountV2,
      AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
      CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
      PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2 : Extended;
  var VCurrencyId: Integer;
  var NettoU, NettoV: extended;
  var VAT_rate, VAT2_rate : extended;
  var VAT_id, VAT2_id, View_Id: integer) : boolean;

begin
  LastHotelRateResult := hrFunctionCallError;
  if IsRateLibLoaded then
  begin
    @GetHotelRateMultPersonValueExFunc := GetProcAddress(LibHandle, 'GetHotelRateValueMultPersonEx');
    if @GetHotelRateMultPersonValueExFunc <> nil then
      LastHotelRateResult := GetHotelRateMultPersonValueExFunc(AppHandle, HotelId, RoomTypeId,
        HotelVendorId, FromDate, DayCount, BirthDays, FeedType,
        ShowErrors,
        BerthTypes,
        RateU, RateV, RateU2, RateV2,
        DiscountU, DiscountV, DiscountU2, DiscountV2,
        AgentDiscountU, AgentDiscountV, AgentDiscountU2, AgentDiscountV2,
        CorporateDiscountU, CorporateDiscountV, CorporateDiscountU2, CorporateDiscountV2,
        PermClientDiscountU, PermClientDiscountV, PermClientDiscountU2, PermClientDiscountV2,
        VCurrencyId, NettoU, NettoV, VAT_rate, VAT2_rate,
        VAT_id, VAT2_id, View_id);
  end;
  Result := LastHotelRateResult = hrRateOk;
end;

function GetHotelRateMultPersonValue(
  HotelId, RoomTypeId, HotelVendorId: Integer;
  FromDate: TDateTime; DayCount: Integer;
  BirthDays: array of TDateTime;
  FeedType: integer;
  ShowErrors : boolean;
  var BerthTypes : array of integer;
  var RateU, RateV,
      DiscountU, DiscountV,
      AgentDiscountU, AgentDiscountV,
      CorporateDiscountU, CorporateDiscountV,
      PermClientDiscountU, PermClientDiscountV : Extended;
  var VCurrencyId: Integer): boolean;
begin
  LastHotelRateResult := hrFunctionCallError;
  if IsRateLibLoaded then
  begin
    @GetHotelRateMultPersonValueFunc := GetProcAddress(LibHandle, 'GetHotelRateValueMultPerson');
    if @GetHotelRateMultPersonValueFunc <> nil then
      LastHotelRateResult := GetHotelRateMultPersonValueFunc( AppHandle,
        HotelId, RoomTypeId, HotelVendorId, FromDate, DayCount, BirthDays,
        FeedType,
        ShowErrors,
        BerthTypes, RateU, RateV,
        DiscountU, DiscountV,
        AgentDiscountU, AgentDiscountV,
        CorporateDiscountU, CorporateDiscountV,
        PermClientDiscountU, PermClientDiscountV,
        VCurrencyId);
  end;
  Result := LastHotelRateResult = hrRateOk;
end;

{$WARN UNSAFE_CODE ON}

procedure FreeRateLib;
begin
  FreeLibrary(LibHandle);
  RateLibLoaded := False;
end;

initialization
  AppHandle := Application.Handle;
  RateLibLoaded := False;
finalization
  if RateLibLoaded then FreeRateLib;
end.

