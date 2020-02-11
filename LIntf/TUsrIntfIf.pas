unit TUsrIntfIf;

interface

function ExecuteManagerPasswDlg(ManagerId: Integer): Boolean;

implementation

uses Windows, Forms, LIfConsts, TourCmnlIf;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TExecuteManagerPasswFunc =
    function (AppHandle: Cardinal; ManId: Integer): Boolean;

var
  AppHandle: Cardinal;
  LibHandle: THandle;
  LibLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  ExecuteManagerPasswFunc: TExecuteManagerPasswFunc;

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
  LName = 'TUsrIntf.dll';

function LoadTUsrLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  LibLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadDictionFatal);
end;

function IsLibLoaded: Boolean;
begin
  if not LibLoaded then
  begin
    LoadTUsrLib(True);
    if LibLoaded then AssignLibHandle;
  end;
  Result := LibLoaded;
end;

function ExecuteManagerPasswDlg(ManagerId: Integer): Boolean;
begin
  Result := False;
  if IsLibLoaded then
  begin
    {$WARN UNSAFE_CODE OFF}
    @ExecuteManagerPasswFunc := GetProcAddress(LibHandle, 'ExecuteManagerPasswDlg');
    if @ExecuteManagerPasswFunc <> nil then
      Result := ExecuteManagerPasswFunc(AppHandle, ManagerId);
    {$WARN UNSAFE_CODE ON}
  end;
end;

procedure FreeTUsrLib;
begin
  FreeLibrary(LibHandle);
  LibLoaded := False;
end;

initialization
  AppHandle := Application.Handle;
  LibLoaded := False;
finalization
  if LibLoaded then FreeTUsrLib;

end.
