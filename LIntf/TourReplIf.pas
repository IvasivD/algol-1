unit TourReplIf;

interface

procedure ShowOrderConfirmReport(OrderId: Integer; ForClient: Boolean);

implementation

uses Windows, Forms, LIfConsts, TourCmnlIf;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TShowReportProc = procedure(AppHandle: Cardinal; KeyId: Integer; ForClient: Boolean);

var
  AppHandle: Cardinal;
  LibHandle: THandle;
  ReportLibLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  ShowReportProc: TShowReportProc;

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

const
  LName = 'TourRepl.dll';

function LoadReportLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  ReportLibLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadReportFatal);
end;

function IsReportLibLoaded: Boolean;
begin
  if not ReportLibLoaded then
  begin
    LoadReportLib(True);
    if ReportLibLoaded then AssignLibHandle;
  end;
  Result := ReportLibLoaded;
end;

procedure ShowOrderConfirmReport(OrderId: Integer; ForClient: Boolean);
begin
  if IsReportLibLoaded then
  begin
    {$WARN UNSAFE_CODE OFF}
    @ShowReportProc := GetProcAddress(LibHandle, 'ShowOrderConfirmReport');
    if @ShowReportProc <> nil then ShowReportProc(AppHandle, OrderId, ForClient);
    {$WARN UNSAFE_CODE ON}
  end;
end;

procedure FreeReportLib;
begin
  FreeLibrary(LibHandle);
  ReportLibLoaded := False;
end;

initialization
  AppHandle := Application.Handle;
  ReportLibLoaded := False;
finalization
  if ReportLibLoaded then FreeReportLib;

end.
