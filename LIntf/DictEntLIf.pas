unit DictEntLIf;

interface

function EditClientProperty(var Id: Integer; EditState: Integer;
  var ContactId, OfficeId, HomeId, WorkId, MobileId, FaxId, EMailId, PagerId: Integer;
  Man: Integer): Boolean;
function EditVendorProperty(
  var VendId: Integer; ServKind: Integer; Man: Integer): Boolean;

implementation

uses Windows, Forms, LIfConsts, TourCmnlIf;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TEditClientPropertyFunc = function (
    AppHandle: Cardinal; var Id: Integer; EditState: Integer; var ContactId,
    OfficeId, HomeId, WorkId, MobileId, FaxId, EMailId, PagerId: Integer;
    Man: Integer): Boolean;
  TEditVendorFunc = function(AppHandle: Cardinal;
    var VendId: Integer; ServKind: Integer; Man: Integer): Boolean;

var
  AppHandle: Cardinal;
  LibHandle: THandle;
  DictLibLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  EditClientPropertyFunc: TEditClientPropertyFunc;
  EditVendorFunc: TEditVendorFunc;

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
  LName = 'DictEntl.dll';

function LoadDictLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  DictLibLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadDictionFatal);
end;

function IsDictLibLoaded: Boolean;
begin
  if not DictLibLoaded then
  begin
    LoadDictLib(True);
    if DictLibLoaded then AssignLibHandle;
  end;
  Result := DictLibLoaded;
end;

function EditClientProperty(var Id: Integer; EditState: Integer;
  var ContactId, OfficeId, HomeId, WorkId, MobileId, FaxId, EMailId, PagerId: Integer;
  Man: Integer): Boolean;
begin
  Result := False;
  if IsDictLibLoaded then
  begin
    {$WARN UNSAFE_CODE OFF}
    @EditClientPropertyFunc := GetProcAddress(LibHandle, 'EditClientProperty');
    if @EditClientPropertyFunc <> nil then
      Result := EditClientPropertyFunc(
        AppHandle, Id, EditState, ContactId, OfficeId,
        HomeId, WorkId, MobileId, FaxId, EMailId, PagerId, Man);
    {$WARN UNSAFE_CODE ON}
  end;
end;

function EditVendorProperty(
  var VendId: Integer; ServKind: Integer; Man: Integer): Boolean;
begin
  Result := IsDictLibLoaded;
  if Result then
  begin
    {$WARN UNSAFE_CODE OFF}
    @EditVendorFunc := GetProcAddress(LibHandle, 'EditVendorProperty');
    if @EditVendorFunc = nil then Result := False
    {$WARN UNSAFE_CODE ON}
    else Result := EditVendorFunc(AppHandle, VendId, ServKind, Man);
  end;
end;

procedure FreeDictLib;
begin
  FreeLibrary(LibHandle);
  DictLibLoaded := False;
end;

initialization
  AppHandle := Application.Handle;
  DictLibLoaded := False;
finalization
  if DictLibLoaded then FreeDictLib;

end.
