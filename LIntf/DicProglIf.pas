unit DicProglIf;

interface
  function ExecDicProgFunc(AppHandle: Cardinal; 
    Id, ManId, TourTemplId, AnExecuteMode: Integer): Boolean; 
    external 'ProgTourLib.dll' name 'ShowExcursShablonEdit';
  
function ExecuteExcursShablonEdit(Id, ManId, TourTemplId, AnExecuteMode: Integer): Boolean; 


implementation

uses Windows, Forms, TourCmnlIf, LIfConsts, dialogs, Messages;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TExecuteDicProgFunc =
    function(AppHandle: Cardinal; Id, ManId, TourTemplId, AnExecuteMode: Integer): Boolean; //stdcall;
var
  AppHandle: Cardinal;
  LibHandle: THandle;
  DicProgLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  ExecuteDicProgFunc: TExecuteDicProgFunc;
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
  LName = 'ProgTourLib.dll';

function LoadProgTourLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  DicProgLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadOrderPayFatal);
end;

function IsProgTourLibLoaded: Boolean;
begin
  if not DicProgLoaded then
  begin
    LoadProgTourLib(True);
    if DicProgLoaded then AssignLibHandle;
  end;
  Result := DicProgLoaded;
end;

function ExecuteExcursShablonEdit(Id, ManId, TourTemplId, AnExecuteMode: Integer): Boolean; 
begin
  Result := False;
  if IsProgTourLibLoaded then                
  begin
    @ExecuteDicProgFunc := GetProcAddress(LibHandle, 'ShowExcursShablonEdit');
    if @ExecuteDicProgFunc <> nil then
      Result := ExecuteDicProgFunc(AppHandle, Id, ManId, TourTemplId, AnExecuteMode);
  end;  
end;   
  {$WARN UNSAFE_CODE ON}
 
procedure FreeProgTourLib;
begin
  FreeLibrary(LibHandle);
  DicProgLoaded := False;
end;  

initialization
  AppHandle := Application.Handle;
  DicProgLoaded := False;
finalization
  if DicProgLoaded then FreeProgTourLib;

end.
