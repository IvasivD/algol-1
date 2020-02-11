unit HotelRateIf;

interface

type THotelRateResult =
  (hrFunctionCallError,      // ��������� ��������� ������� � DLL
   hrRateOk,                 // ����� ��������� ��������
   hrImposibleLayout,        // ���� ��������� � ������ ����� ���������
   hrRateNotFound,           // ��� ������ ������ ���� ������
   hrRateByParamNotFound);   // ���� ������ ��� ������� ���������

// ������� ������� ����������
// ������� True ���� ����� ��������
// ����� ���������:
  //  HotelId - ������������� ������
  //  RoomTypeId - ������������� �������� ������
  //  HotelVendorId - ������������� ������������� / 0 - ���� ��������
  //  FromDate - ���� ���������
  //  DayCount - �-��� �� ����������
  //  BirthDate - ���� ���������� �����, �� ���
  //  BerthType - ������������� ��������� / 0 - ���� ��������
  //  FeedType - ������������� ���� ����������
  //  ShowErrors - ������� ����������� ������ � ���������
//������ ���������
  //  RateU - �������� ������ � ����������� �����
  //  RateV - �������� ������ � �������� �����
  //  DiscountU - �������� ����������� ������ � ����������� �����
  //  DiscountV - �������� ����������� ������ � �������� �����
  //  AgentDiscountU - �������� ��������� ������ � ����������� �����
  //  AgentDiscountV - �������� ��������� ������ � �������� �����
  //  CorporateDiscountU - �������� ������������ ������ � ����������� �����
  //  CorporateDiscountV - �������� ������������ ������ � �������� �����
  //  PermClientDiscountU - �������� ������ ���� �볺��� � ����������� �����
  //  PermClientDiscountV - �������� ������ ���� �볺��� � �������� �����
  //  VCurrencyId - ������������� �������� ������
  //    ���� ���� ���� �� ������ :=0

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

// ������� ������� ���������� � ���� ����������
// ������� True ���� ����� ��������
// ����� ���������:
  //  HotelId - ������������� ������
  //  RoomTypeId - ������������� �������� ������
  //  HotelVendorId - ������������� �������������
  //  FromDate - ���� ���������
  //  DayCount - �-��� �� ����������
  //  BirthDate - ���� ���������� �����, �� ���
  //  BerthType - ������������� ���������
  //  FeedType - ������������� ���� ����������
  //  ShowErrors - ������� ����������� ���������� ��� �������;
//������ ���������
  //  RateU - �������� 1-� ������� ������ (� ����������� �����, ���1)
  //  RateV - �������� 1-� ������� ������ (� �������� �����, ���1)
  //  RateU2 - �������� 2-� ������� ������ (� ����������� �����, ���2)
  //  RateV2 - �������� 2-� ������� ������ (� �������� �����, ���2)
  //  DiscountU - ������ 1-� ������� ������ (� ����������� �����, ���1)
  //  DiscountV - ������ 1-� ������� ������ (� �������� �����, ���1)
  //  DiscountU2 - ������ 2-� ������� ������ (� ����������� �����, ���2)
  //  DiscountV2 - ������ 2-� ������� ������ (� �������� �����, ���2)
  //  AgentDiscountU - ��������� ������ 1-� ������� ������ (� ����������� �����, ���1)
  //  AgentDiscountV - ��������� ������ 1-� ������� ������ (� �������� �����, ���1)
  //  AgentDiscountU2 - ��������� ������ 2-� ������� ������ (� ����������� �����, ���2)
  //  AgentDiscountV2 - ��������� ������ 2-� ������� ������ (� �������� �����, ���2)
  //  CorporateDiscountU - ������������ ������ 1-� ������� ������ (� ����������� �����, ���1)
  //  CorporateDiscountV - ������������ ������ 1-� ������� ������ (� �������� �����, ���1)
  //  CorporateDiscountU2 - ������������ ������ 2-� ������� ������ (� ����������� �����, ���2)
  //  CorporateDiscountV2 - ������������ ������ 2-� ������� ������ (� �������� �����, ���2)
  //  PermClientDiscountU - ������ ���� �볺��� 1-� ������� ������ (� ����������� �����, ���1)
  //  PermClientDiscountV - ������ ���� �볺��� 1-� ������� ������ (� �������� �����, ���1)
  //  PermClientDiscountU2 - ������ ���� �볺��� 2-� ������� ������ (� ����������� �����, ���2)
  //  PermClientDiscountV2 - ������ ���� �볺��� 2-� ������� ������ (� �������� �����, ���2)
  //  VCurrencyId - ������������� �������� ������
  //  NettoU - �������� ������ ���� (� ����������� �����)
  //  NettoV - �������� ������ ���� (� �������� �����)
  //  VAT_rate - ����� ������ ������� ���
  //  VAT2_rate - ����� ������ 2-�� ���
  //  VAT_id - ������������� ���� ������� ���
  //  VAT2_id - ������������� ���� 2-�� ���
  //  View_Id - ������������� ���� (������� ��� ����������, �� ������� ���� ���������)

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

// ������� ������� ���������� ��� ����� ���
// ������� True ���� ����� ��������
// ����� ���������:
  //  HotelId - ������������� ������
  //  RoomTypeId - ������������� �������� ������
  //  HotelVendorId - ������������� �������������
  //  FromDate - ���� ���������
  //  DayCount - �-��� �� ����������
  //  BirthDates - ����� ��� ���������� ���, �� �����
  //  FeedType - ������������� ���� ����������
  //  ShowErrors - ������� ����������� ���������� ��� �������
//������ ���������
  //  BerthTypes - ����� �������������� ��������� (������� ���� ������������� � �� ������ ��������� � BirthDates)
  //  RateU - �������� ������ � ����������� �����
  //  RateV - �������� ������ � �������� �����
  //  DiscountU - �������� ����������� ������ � ����������� �����
  //  DiscountV - �������� ����������� ������ � �������� �����
  //  AgentDiscountU - �������� ��������� ������ � ����������� �����
  //  AgentDiscountV - �������� ��������� ������ � �������� �����
  //  CorporateDiscountU - �������� ������������ ������ � ����������� �����
  //  CorporateDiscountV - �������� ������������ ������ � �������� �����
  //  PermClientDiscountU - �������� ������ ���� �볺��� � ����������� �����
  //  PermClientDiscountV - �������� ������ ���� �볺��� � �������� �����
  //  VCurrencyId - ������������� �������� ������
  //    ���� ����� ���� ���� �� ����������� 0

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

// ������� ������� ���������� ����� ��� � ���� ����������
// ������� True ���� ����� ��������
// ����� ���������:
  //  HotelId - ������������� ������
  //  RoomTypeId - ������������� �������� ������
  //  HotelVendorId - ������������� �������������
  //  FromDate - ���� ���������
  //  DayCount - �-��� �� ����������
  //  BirthDates - ����� ��� ���������� ���, �� �����
  //  FeedType - ������������� ���� ����������
  //  ShowErrors - ������� ����������� ���������� ��� �������
//������ ���������
  //  BerthTypes - ����� �������������� ��������� (������� ���� ������������� � �� ������ ��������� � BirthDates)
  //  RateU - �������� 1-� ������� ������ (� ����������� �����, ���1)
  //  RateV - �������� 1-� ������� ������ (� �������� �����, ���1)
  //  RateU2 - �������� 2-� ������� ������ (� ����������� �����, ���2)
  //  RateV2 - �������� 2-� ������� ������ (� �������� �����, ���2)
  //  DiscountU - ������ 1-� ������� ������ (� ����������� �����, ���1)
  //  DiscountV - ������ 1-� ������� ������ (� �������� �����, ���1)
  //  DiscountU2 - ������ 2-� ������� ������ (� ����������� �����, ���2)
  //  DiscountV2 - ������ 2-� ������� ������ (� �������� �����, ���2)
  //  AgentDiscountU - ��������� ������ 1-� ������� ������ (� ����������� �����, ���1)
  //  AgentDiscountV - ��������� ������ 1-� ������� ������ (� �������� �����, ���1)
  //  AgentDiscountU2 - ��������� ������ 2-� ������� ������ (� ����������� �����, ���2)
  //  AgentDiscountV2 - ��������� ������ 2-� ������� ������ (� �������� �����, ���2)
  //  CorporateDiscountU - ������������ ������ 1-� ������� ������ (� ����������� �����, ���1)
  //  CorporateDiscountV - ������������ ������ 1-� ������� ������ (� �������� �����, ���1)
  //  CorporateDiscountU2 - ������������ ������ 2-� ������� ������ (� ����������� �����, ���2)
  //  CorporateDiscountV2 - ������������ ������ 2-� ������� ������ (� �������� �����, ���2)
  //  PermClientDiscountU - ������ ���� �볺��� 1-� ������� ������ (� ����������� �����, ���1)
  //  PermClientDiscountV - ������ ���� �볺��� 1-� ������� ������ (� �������� �����, ���1)
  //  PermClientDiscountU2 - ������ ���� �볺��� 2-� ������� ������ (� ����������� �����, ���2)
  //  PermClientDiscountV2 - ������ ���� �볺��� 2-� ������� ������ (� �������� �����, ���2)
  //  VCurrencyId - ������������� �������� ������
  //  NettoU - �������� ������ ���� (� ����������� �����)
  //  NettoV - �������� ������ ���� (� �������� �����)
  //  VAT_rate - ����� ������ ������� ���
  //  VAT2_rate - ����� ������ 2-�� ���
  //  VAT_id - ������������� ���� ������� ���
  //  VAT2_id - ������������� ���� 2-�� ���
  //  View_Id - ������������� ���� (������� ��� ����������, �� ������� ���� ���������)

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

// ����� ����� ������ ������� �������� ��������� ������
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

