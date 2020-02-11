unit InsRateIf;

interface

// Повертає розмір страхового платежа
function GetInsureRateValue(
  InsureTypeId, InsureVendorId, InsureSubTypeId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  var Rate, Rate2: Extended; var Rate2CurrencyId: Integer): Boolean;

// Повертає розмір страхового платежа зі всіма парметрами
function GetInsureRateValueEx(
  InsureTypeId, InsureVendorId, InsureSubTypeId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  var Rate, Rate2: Extended; var Rate2CurrencyId: Integer;
  var NumYear, NumMonth, NumDay: Integer;
  var IncludeValue: Boolean;
  var RateId, RateValueId: Integer): Boolean;

// Параметри:
  //  InsureTypeId - ідентифікатор типу страхування
  //  InsureVendorId - ідентифікатор постачальника тарифу
  //  InsureSubTypeId - ідентифікатор страхової суми, або типу авто
  //  FromDate - дата початку терміну страхування
  //  DayCount - к-сть днів на які страхується особа
  //  Rate - значення страхового платежу(у національній валюті)
  //  Rate2 - значення страхового платежу(у іноземній валюті)
  //  Rate2CurrencyId - ідентифікатор іноземної валюти
  //    Якщо страхової суми немає то вказуєм :=0
  //    якщо немає значення в іноземній валюті то поверне  Rate2:=0, Rate2CurrencyId:=0
  //    якщо немає значення в національній валюті то поверне  Rate:=0
  //  NumYear - на скільки років страхується
  //  NumMonth - на скільки місяців страхується
  //  NumDay - на скільки днів страхується
  //  IncludeValue - чи враховувати кінцеву дату чи ні
  //  RateId - ідентифікатор тарифу
  //  RateValueId - ідентифікатор значення тарифу

implementation

uses Windows, Forms, LIfConsts, TourCmnlIf;

type
  TAssignAppProc = procedure(AppHandle: LongWord);
  TGetInsureRateValueExFunc = function(AppHandle: LongWord;
    InsureTypeId, InsureVendorId, InsureSubTypeId: Integer;
    FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
    var Rate, Rate2: Extended; var Rate2CurrencyId: Integer;
    var NumYear, NumMonth, NumDay: Integer;
    var IncludeValue: Boolean;
    var RateId, RateValueId: Integer): Boolean;
  TGetInsureRateValueFunc = function(AppHandle: LongWord;
    InsureTypeId, InsureVendorId, InsureSubTypeId: Integer;
    FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
    var Rate, Rate2: Extended; var Rate2CurrencyId: Integer): Boolean;

var
  AppHandle: LongWord;
  LibHandle: THandle;
  RateLibLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  GetInsureRateValueExFunc: TGetInsureRateValueExFunc;
  GetInsureRateValueFunc: TGetInsureRateValueFunc;

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
  LName = 'InsRates.dll';

function LoadRateLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  RateLibLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadInsureRateFatal);
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

function GetInsureRateValueEx(
  InsureTypeId, InsureVendorId, InsureSubTypeId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  var Rate, Rate2: Extended; var Rate2CurrencyId: Integer;
  var NumYear, NumMonth, NumDay: Integer;
  var IncludeValue: Boolean;
  var RateId, RateValueId: Integer): Boolean;
begin
  Result := False;
  if IsRateLibLoaded then
  begin
    @GetInsureRateValueExFunc := GetProcAddress(LibHandle, 'GetInsureRateValueEx');
    if @GetInsureRateValueExFunc <> nil then
      Result := GetInsureRateValueExFunc(
        AppHandle, InsureTypeId, InsureVendorId, InsureSubTypeId,
        FromDate, DayCount, BirthDay, Rate, Rate2, Rate2CurrencyId,
        NumYear, NumMonth, NumDay, IncludeValue, RateId, RateValueId);
  end;
end;

function GetInsureRateValue(
  InsureTypeId, InsureVendorId, InsureSubTypeId: Integer;
  FromDate: TDateTime; DayCount: Integer; BirthDay: TDateTime;
  var Rate, Rate2: Extended; var Rate2CurrencyId: Integer): Boolean;
begin
  Result := False;
  if IsRateLibLoaded then
  begin
    @GetInsureRateValueFunc := GetProcAddress(LibHandle, 'GetInsureRateValue');
    if @GetInsureRateValueFunc <> nil then
      Result := GetInsureRateValueFunc(
        AppHandle, InsureTypeId, InsureVendorId, InsureSubTypeId,
        FromDate, DayCount, BirthDay, Rate, Rate2, Rate2CurrencyId);
  end;
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

