unit OrdPaylIf;

interface
uses Windows;

function ExecuteOrderPaymentDlg(OrderId, ManId: Integer): Boolean; stdcall;
function ExecuteOrderPaymentNewDlg(OrderId, ManId: Integer; aPosition: TPoint): Boolean; //stdcall;


implementation

uses Forms, TourCmnlIf, LIfConsts;

type
  TAssignAppProc = procedure(AppHandle: Cardinal);
  TExecutePaymentFunc =
    function(AppHandle: Cardinal; OrderId, ManId: Integer): Boolean;
  TExecutePaymentFuncNew =
    function(AppHandle: Cardinal; OrderId, ManId: Integer; aPosition: TPoint): Boolean; //stdcall;
var
  AppHandle: Cardinal;
  LibHandle: THandle;
  OrderPayLoaded: Boolean;
  AssignAppProc: TAssignAppProc;
  ExecutePaymentFunc: TExecutePaymentFunc;
  ExecutePaymentFuncNew: TExecutePaymentFuncNew;

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
  LName = 'OrdrPayL.dll';

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

{function ExecuteOrderPayment(AppHandle: Cardinal; OrderId, ManId: Integer): Boolean; //stdcall;
  external LName;}

function ExecuteOrderPaymentDlg(OrderId, ManId: Integer): Boolean; stdcall;
begin
  Result := False;
  if IsOrderPayLibLoaded then
  begin
    @ExecutePaymentFunc := GetProcAddress(LibHandle, 'ExecuteOrderPayment');
    if @ExecutePaymentFunc <> nil then
      Result := ExecutePaymentFunc(AppHandle, OrderId, ManId);
  end;
end;

function ExecuteOrderPaymentNewDlg(OrderId, ManId: Integer; aPosition: TPoint): Boolean; //stdcall;
begin
  Result := False;
  if IsOrderPayLibLoaded then
  begin
    @ExecutePaymentFuncNew := GetProcAddress(LibHandle, 'ExecuteOrderPaymentNew');
    if @ExecutePaymentFuncNew <> nil then
      Result := ExecutePaymentFuncNew(AppHandle, OrderId, ManId, aPosition);
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

end.
