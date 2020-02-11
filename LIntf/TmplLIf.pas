unit TmplLIf;

interface

uses Classes, Forms;

function LoadTemplateLib(ShowFault: boolean): boolean;
procedure AssignTemplateLibHandle;
procedure FreeTemplateLib;
function GetTemplateDatabaseFileName(const Exe: String): String;
procedure ShowDatabaseImageForm(DataMod: TDataModule);

resourcestring
  SLoadTemplateFatal = 'Помилка при завантаженні бібліотеки шаблонів';


implementation

uses Windows, SysUtils, Dialogs;

type
  TAssignAppProc = procedure (AppHandle: Cardinal);
  TWithoutParamsProc = procedure ;
  {$WARN UNSAFE_TYPE OFF}
  TTemplDatabaseImageFunc = function (InStr, OutStr: PChar; OutSize: Integer): PChar; stdcall;
  {$WARN UNSAFE_TYPE ON}
  TShowDatabaseImageFormProc = procedure (AppHandle: Cardinal; DataMod: TDataModule);

var
  AssignAppProc: TAssignAppProc;
  ShowDatabaseImageFormProc: TShowDatabaseImageFormProc;

var
  AppHandle: Cardinal;
  TemplHandle: THandle;
  TemplLibLoaded: Boolean;

const
  TemplName = 'Templatl.dll';

function GetTemplateDatabaseFileName(const Exe: String): String;
begin
  Result := ChangeFileExt(Exe, '.tdd');
end;

procedure AssignTemplateLibHandle;
begin
  if TemplHandle <> 0 then
  begin
    {$WARN UNSAFE_CODE OFF}
    @AssignAppProc := GetProcAddress(TemplHandle, 'AssignAppHandle');
    if @AssignAppProc <> nil then AssignAppProc(Application.MainForm.Handle);
    {$WARN UNSAFE_CODE ON}
  end;
end;

function LoadTemplateLib(ShowFault: boolean): boolean;
begin
  TemplHandle := LoadLibrary(TemplName);
  Result := TemplHandle <> 0;
  TemplLibLoaded := Result;
  if not Result and ShowFault then
    MessageDlg(SLoadTemplateFatal, mtError, [mbOk], 0);
end;

function IsTemplateLibLoaded: Boolean;
begin
  if not TemplLibLoaded then
  begin
    LoadTemplateLib(True);
    if TemplLibLoaded then AssignTemplateLibHandle;
  end;
  Result := TemplLibLoaded;
end;

procedure ShowDatabaseImageForm(DataMod: TDataModule);
begin
  if IsTemplateLibLoaded then
  begin
    {$WARN UNSAFE_CODE OFF}
    @ShowDatabaseImageFormProc := GetProcAddress(TemplHandle, 'ShowDatabaseImageForm');
    if @ShowDatabaseImageFormProc <> nil then
      ShowDatabaseImageFormProc(AppHandle, DataMod);
    {$WARN UNSAFE_CODE ON}
  end;
end;

procedure FreeTemplateLib;
begin
  FreeLibrary(TemplHandle);
  TemplLibLoaded := False;
end;

initialization
  AppHandle := Application.Handle;
  TemplLibLoaded := False;
finalization
  if TemplLibLoaded then FreeTemplateLib;

end.
