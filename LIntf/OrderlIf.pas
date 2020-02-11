unit OrderlIf;

interface

function CreateNewOrder(DefService, AManager: Integer;
  CreatePersons: Boolean; var AnOrder: Integer): Boolean;
function CreateNewTourOrder(ATour, AGroup, AManager{, AVendor}: Integer;
  CreatePersons: Boolean; var AnOrder: Integer): Boolean;

implementation

uses Windows, Forms, LIfConsts, TourCmnlIf;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TCreateOrderFunc = function(AppHandle: Cardinal;
    DefService, AManager: Integer;
    CreatePersons: Boolean; var AnOrder: Integer): Boolean;
  TCreateTrOrdFunc = function(AppHandle: Cardinal;
    ATour, AGroup, AManager{, AVendor}: Integer;
    CreatePersons: Boolean; var AnOrder: Integer): Boolean;

var
  AppHandle: Cardinal;
  LibHandle: THandle;
  OrderLibLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  CreateOrderFunc: TCreateOrderFunc;
  CreateTrOrdFunc: TCreateTrOrdFunc;
     
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
  LName = 'OrderLib.dll';

function LoadOrderLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  OrderLibLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadOrderNewFatal);
end;

function IsOrderLibLoaded: Boolean;
begin
  if not OrderLibLoaded then
  begin
    LoadOrderLib(True);
    if OrderLibLoaded then AssignLibHandle;
  end;
  Result := OrderLibLoaded;
end;

function CreateNewOrder(DefService, AManager: Integer;
  CreatePersons: Boolean; var AnOrder: Integer): Boolean;
begin
  Result := False;
  if IsOrderLibLoaded then
  begin
    @CreateOrderFunc := GetProcAddress(LibHandle, 'CreateNewOrder');
    if @CreateOrderFunc <> nil then
      Result := CreateOrderFunc(
        AppHandle, DefService, AManager, CreatePersons, AnOrder);
  end;
end;

function CreateNewTourOrder(ATour, AGroup, AManager{, AVendor}: Integer;
  CreatePersons: Boolean; var AnOrder: Integer): Boolean;
begin
  Result := False;
  if IsOrderLibLoaded then
  begin
    @CreateTrOrdFunc := GetProcAddress(LibHandle, 'CreateNewTourOrder');
    if @CreateTrOrdFunc <> nil then
      Result := CreateTrOrdFunc(
        AppHandle, ATour, AGroup, AManager, {AVendor,} CreatePersons, AnOrder);
  end;
end;

{$WARN UNSAFE_CODE ON}

procedure FreeOrderLib;
begin
  FreeLibrary(LibHandle);
  OrderLibLoaded := False;
end;

initialization
  AppHandle := Application.Handle;
  OrderLibLoaded := False;
finalization
  if OrderLibLoaded then FreeOrderLib;

end.
