unit TourCurlIf;

interface

function GetCurrencyCommerceByDate(CurrId: Integer; var ByDate: TDateTime; var Zoom: Integer; var Rate: Extended): Extended;
function GetCurrencyCommerceActual(CurrId: Integer): Extended;
function IsCurrencyCommerceActual(CurrId: Integer): Boolean;
procedure SetCurrencyCommerceToday(CurrId: Integer; Zoom: Integer; Rate: Extended);
function CheckCurrencyCommerceValue(CurrId: Integer; Zoom: Integer; Value: Extended): Boolean;

implementation

uses Windows, Forms, SysUtils, LIfConsts, TourCmnlIf;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TCurrencyCommerceDateFunc = function(CurrId: Integer; var ByDate: TDateTime; var Zoom: Integer; var Rate: Extended): Extended;
  TCurrencyCommerceTodayProc = procedure(CurrId: Integer; Zoom: Integer; Rate: Extended);
  TCheckCurrencyCommerceFunc = function(CurrId: Integer; Zoom: Integer; Value: Extended): Boolean;

var
  CurrencyLibLoaded: Boolean;
  LibHandle: THandle;
  AssignAppProc: TAssignAppProc;
  CurrencyCommerceDateFunc: TCurrencyCommerceDateFunc;
  CurrencyCommerceTodayProc: TCurrencyCommerceTodayProc;
  CheckCurrencyCommerceFunc: TCheckCurrencyCommerceFunc;

function GetCurrencyCommerceActual(CurrId: Integer): Extended;
var
  ByDate: TDateTime;
  Zoom: Integer;
  Rate: Extended;
begin
  ByDate := Now;
  Result := GetCurrencyCommerceByDate(CurrId, ByDate, Zoom, Rate);
end;

function IsCurrencyCommerceActual(CurrId: Integer): Boolean;
var
  ByDate: TDateTime;
  Zoom: Integer;
  Rate, Rate1: Extended;
begin
  ByDate := Now;
  Rate1 := GetCurrencyCommerceByDate(CurrId, ByDate, Zoom, Rate);
  Result := (Rate1 > 0) and (ByDate >= Int(Now));
end;

procedure AssignLibHandle;
begin
  if LibHandle <> 0 then
  begin
    {$WARN UNSAFE_CODE OFF}
    @AssignAppProc := GetProcAddress(LibHandle, 'AssignAppHandle');
    if @AssignAppProc <> nil then AssignAppProc(Application.MainForm.Handle);
    {$WARN UNSAFE_CODE ON}
  end;
end;

function LoadCurrencyLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary('TourCurl.dll');
  Result := LibHandle <> 0;
  CurrencyLibLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadCurrencyFatal);
end;

function IsCurrencyLibLoaded: Boolean;
begin
  if not CurrencyLibLoaded then
  begin
    LoadCurrencyLib(True);
    if CurrencyLibLoaded then AssignLibHandle;
  end;
  Result := CurrencyLibLoaded;
end;

function GetCurrencyCommerceByDate(CurrId: Integer; var ByDate: TDateTime; var Zoom: Integer; var Rate: Extended): Extended;
begin
  Result := 0;
  if IsCurrencyLibLoaded then
  begin
    {$WARN UNSAFE_CODE OFF}
    @CurrencyCommerceDateFunc := GetProcAddress(LibHandle, 'GetCurrencyCommerceByDate');
    if @CurrencyCommerceDateFunc <> nil then
      Result := CurrencyCommerceDateFunc(CurrId, ByDate, Zoom, Rate);
    {$WARN UNSAFE_CODE ON}
  end;
end;

procedure SetCurrencyCommerceToday(CurrId: Integer; Zoom: Integer; Rate: Extended);
begin
  if IsCurrencyLibLoaded then
  begin                   
    {$WARN UNSAFE_CODE OFF}
    @CurrencyCommerceTodayProc := GetProcAddress(LibHandle, 'SetCurrencyCommerceToday');
    if @CurrencyCommerceTodayProc <> nil then
      CurrencyCommerceTodayProc(CurrId, Zoom, Rate);
    {$WARN UNSAFE_CODE ON}
  end;
end;

function CheckCurrencyCommerceValue(CurrId: Integer; Zoom: Integer; Value: Extended): Boolean;
begin
  Result := False;
  if IsCurrencyLibLoaded then
  begin                   
    {$WARN UNSAFE_CODE OFF}
    @CheckCurrencyCommerceFunc := GetProcAddress(LibHandle, 'CheckCurrencyCommerceValue');
    if @CheckCurrencyCommerceFunc <> nil then
      Result := CheckCurrencyCommerceFunc(CurrId, Zoom, Value);
    {$WARN UNSAFE_CODE ON}
  end;
end;

procedure FreeCurrencyLib;
begin
  FreeLibrary(LibHandle);
  CurrencyLibLoaded := False;
end;

initialization
  CurrencyLibLoaded := False;
finalization
  if CurrencyLibLoaded then FreeCurrencyLib;
end.
