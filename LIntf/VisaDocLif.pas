unit VisaDocLif;

interface

function ExecutePersDocDlg(TypeDocId, ManagerId: Integer;
      var AAreChanges: Boolean; Review: Boolean = False;
      AddLeftDoc: Boolean = False): Boolean;     

implementation

uses Windows, Forms, TourCmnlIf, LIfConsts;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TExecutePaymentFunc =
    function(PersDocId, ManagerId: Integer; var AAreChanges: Boolean; 
  Review: Boolean = False; AddLeftDoc: Boolean = False; 
  CloseTransaction: Boolean = True): Boolean;
      
var
  AppHandle: Cardinal;
  LibHandle: THandle;
  OrderPayLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  ExecutePaymentFunc: TExecutePaymentFunc;

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
  LName = 'VisaDocLib.dll';

function LoadOrderPayLib(ShowFault: Boolean): Boolean;
begin
  LibHandle := LoadLibrary(LName);
  Result := LibHandle <> 0;
  OrderPayLoaded := Result;
  if not Result and ShowFault then ErrorDlg(SLibLoadOrderPayFatal);
end;

function IsOrderPayLibLoaded: Boolean;
begin
  if not OrderPayLoaded then
  begin
    LoadOrderPayLib(True);   
    if OrderPayLoaded then AssignLibHandle;
  end;
  Result := OrderPayLoaded;
end;
                           
function ExecutePersDocDlg(
      TypeDocId, ManagerId: Integer;
      var AAreChanges: Boolean; Review: Boolean = False;
      AddLeftDoc: Boolean = False): Boolean; //stdcall;
begin
  Result := False;
  if IsOrderPayLibLoaded then
  begin
    @ExecutePaymentFunc := GetProcAddress(LibHandle, 'ExecutePersDoc');
    if @ExecutePaymentFunc <> nil then
      Result := ExecutePaymentFunc(TypeDocId, ManagerId,
      AAreChanges, Review, AddLeftDoc);
  end;
end;


{$WARN UNSAFE_CODE ON}

procedure FreeOrderPayLib;
begin
  FreeLibrary(LibHandle);  
  OrderPayLoaded := False;
end;

initialization
  AppHandle := Application.Handle;
  OrderPayLoaded := False;
finalization
  if OrderPayLoaded then FreeOrderPayLib;
//  FreeLibrary(LibHandle);
//  OrderPayLoaded := False;
end.
