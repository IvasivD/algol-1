unit TourUnts;

interface

uses Windows, IBDatabase, cxStyles;
const
  nParIdNew = 0;
  nParIdNone = -1;
  sOrderPayLibName = 'OrdrPayL.dll';
type
  TOrderPaymentParamDll = Record
    AppHandle: Cardinal;
    AOrderId: Integer;
    AManagerId: Integer;
    APosition: TPoint;
    AResult: Boolean;
  end;
  POrderPaymentParamDll = ^TOrderPaymentParamDll;
  TOrderPaymentNewDlg = function(AppHandle: Cardinal; OrderId, ManId: Integer;
    aPosition: TPoint): Boolean;
  
  TCreateFinalFactureParamDll = record
    AIBDatabase: TIBDatabase;
    AOrderId: Integer;  
    AManagerId: Integer; 
    aStyle: TcxStyle;
    aResult: Boolean;
  end;
  PCreateFinalFactureParamDll = ^TCreateFinalFactureParamDll;
  TCreateFinalFacture = function(aIBDatabase: TIBDatabase; OrderId, ManagerId: Integer; aStyle: TcxStyle): Boolean;  

function LaunchInsureBrowser(const Title: String; TourId, GroupId, OrderNo, ManId: Integer; TourDate: TDateTime = 0): LongWord;
function LaunchOrderBrowser(
  const Title: String; OrderNo, ManId: Integer; AdmAcs: Boolean = False): LongWord;
function LaunchOrderNew(const Title: String; TourId, GroupId, ManId{, VendorId}: Integer): LongWord;
function LaunchOrderPay(const Title: String; OrderNo, ManId: Integer): LongWord;
function LaunchRoomBrowser(const Title: String; OrderNo, ManId: Integer; Edit: Boolean): LongWord;
function LaunchRouteManager(const Title: String; RouteId, ShedId, TripId, ManId: Integer): LongWord;
function LaunchTourManager(const Title: String; TourId, GroupId, ManId: Integer): LongWord;
function LaunchTourExtraManager(const Title: String; TourId, GroupId, ManId: Integer;
  TourDate: TDateTime): LongWord;
function LaunchTripBrowser(const Title: String; OrderNo, ManId: Integer; Edit: Boolean): LongWord;
function LaunchVisaBrowser(const Title: String; TourId, GroupId, ManId: Integer;
          TourDate: TDateTime): LongWord;
function LaunchLogViewer(const Title: String; Category, ManId: Integer): LongWord;
function LaunchRateBrowser(const Title, MastSet: String; MastId, RateId, ManId: Integer): LongWord;
function LaunchCheckProgRun(FileName, PathUpdProg: string): Boolean;
function CheckUpdateProg(FileName, ExeName, Server_Name: string): Boolean;

function ExecuteOrderPaymentNewDlg_dll(aHandle: Cardinal; aOrderId, aManager: Integer; APosition: TPoint): Boolean;
function CreateFinalFactures_dll(aOrderId, aManager: Variant; aIBDatabase: TIBDatabase;
  aStyle: TcxStyle): Boolean;

implementation

uses SysUtils, TourCmnlIf, TourMbplIf, TourConsts, TourFiles, Dialogs, core;

const
  parNew = 'new';
  parOrder = 'order';
  parTour = 'tour';
  parTourDate = 'tdate';
  parGroup = 'group';
  parVendor = 'vendor';
  parRoute = 'route';
  parShed = 'shedule';
  parTrip = 'trip';
  parManager = 'man';
  parCateg = 'cat';
  parAdmAcs = 'AdmAcs';
  parEdit = 'Edit';
  parRate = 'rate';
  parMastSet = 'MastSet';
  parMastId = 'MastId';
  parTourGroup = 'groupdata';

function LaunchInsureBrowser(const Title: String; TourId, GroupId, OrderNo, ManId: Integer; 
  TourDate: TDateTime = 0): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if OrderNo > 0 then
    Params := Format('%s -%s%d', [Params, parOrder, OrderNo]);
  if TourId > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parTour, TourId]);
    if GroupId > 0 then Params := Format('%s -%s%d', [Params, parGroup, GroupId]);
    if TourDate > 0 then Params := Format('%s -%s%s', [Params, parTourGroup, DateToStr(TourDate)]);
  end;
  Result := ShellUtil(fShlBrwsInsure, Params, Title);
end;

function LaunchOrderBrowser(
  const Title: String; OrderNo, ManId: Integer; AdmAcs: Boolean = False): LongWord;
var Ttl, Params: String;
begin
  if OrderNo = 0 then
  begin
    Result := 0;
    Exit;
  end;
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if OrderNo = nParIdNew then Params := Format('%s -%s', [Params, parNew])
  else if OrderNo > 0 then Params := Format('%s -%s%d', [Params, parOrder, OrderNo]);
  if AdmAcs then Params := Format('%s -%s', [Params, parAdmAcs]);
  if Title = '' then
    Ttl := SOrderFrmOrderNumber + IntToStr(OrderNo) else Ttl := Title;
  Result := ShellUtil(fShlBrwsOrder, Params, Ttl);
end;

function LaunchOrderNew(const Title: String; TourId, GroupId, ManId{, VendorId}: Integer): LongWord;
var Ttl, Params: String;
begin
  Params := Format('%s -%s -%s%d', [ParBpLgStr, parNew, parManager, ManId]);
  if TourId > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parTour, TourId]);
    if GroupId > 0 then Params := Format('%s -%s%d', [Params, parGroup, GroupId]);
//    if VendorId > 0 then Params := Format('%s -%s%d', [Params, parVendor, VendorId]);
  end;
  if Title = '' then Ttl := SOrderFrmCaptionNewOrder else Ttl := Title;
  Result := ShellUtil(fShlBrwsOrder, Params, Ttl);
end;

function LaunchOrderPay(const Title: String; OrderNo, ManId: Integer): LongWord;
var Ttl, Params: String;
begin
  Result := 0;
  if (OrderNo <= 0) or (OrderNo = nParIdNew) then Exit;
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  Params := Format('%s -%s%d', [Params, parOrder, OrderNo]);
  if Title = '' then
    Ttl := SOrdPayDlgLaunchTitle + IntToStr(OrderNo) else Ttl := Title;
  Result := ShellUtil(fShlPaymOrder, Params, Ttl);
end;

function LaunchRoomBrowser(const Title: String; OrderNo, ManId: Integer; Edit: Boolean): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if OrderNo > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parOrder, OrderNo]);
    if Edit then Params := Format('%s -%s', [Params, parEdit]);
  end;
  Result := ShellUtil(fShlBrwsRoom, Params, Title);
end;

function LaunchRouteManager(const Title: String; RouteId, ShedId, TripId, ManId: Integer): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if RouteId > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parRoute, RouteId]);
    if ShedId > 0 then Params := Format('%s -%s%d', [Params, parShed, ShedId]);
    if TripId > 0 then Params := Format('%s -%s%d', [Params, parTrip, TripId]);
  end;
  Result := ShellUtil(fShlMastRoute, Params, Title);
end;

function LaunchTourManager(const Title: String; TourId, GroupId, ManId: Integer): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if TourId > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parTour, TourId]);
    if GroupId > 0 then Params := Format('%s -%s%d', [Params, parGroup, GroupId]);
  end;
  Result := ShellUtil(fShlAdminTour, Params, Title);
end;

function LaunchTourExtraManager(const Title: String; TourId, GroupId, ManId: Integer;
  TourDate: TDateTime): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if TourId > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parTour, TourId]);
    if GroupId > 0 then Params := Format('%s -%s%d', [Params, parGroup, GroupId]);
    if TourDate > 0 then Params := Format('%s -%s%s', [Params, parTourDate, DateToStr(TourDate)]);
  end;
  Result := ShellUtil(fShlBrwsTours, Params, Title);
end;

function LaunchTripBrowser(const Title: String; OrderNo, ManId: Integer; Edit: Boolean): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if OrderNo > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parOrder, OrderNo]);
    if Edit then Params := Format('%s -%s', [Params, parEdit]);
  end;
  Result := ShellUtil(fShlBrwsTrip, Params, Title);
end;

function LaunchVisaBrowser(const Title: String; TourId, GroupId, ManId: Integer;
          TourDate: TDateTime): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if TourId > 0 then
  begin
    Params := Format('%s -%s%d', [Params, parTour, TourId]);
    if GroupId > 0 then Params := Format('%s -%s%d', [Params, parGroup, GroupId]);
    if TourDate > 0 then Params := Format('%s -%s%s', [Params, parTourDate, DateToStr(TourDate)]);
  end;
  Result := ShellUtil(fShlBrwsVisa, Params, Title);
end;

function LaunchLogViewer(const Title: String; Category, ManId: Integer): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if Category > 0 then Params := Format('%s -%s%d', [Params, parCateg, Category]);
  Result := ShellUtil(fShlBrwsLog, Params, Title);
end;

function LaunchRateBrowser(const Title, MastSet: String; MastId, RateId, ManId: Integer): LongWord;
var Params: String;
begin
  Params := Format('%s -%s%d', [ParBpLgStr, parManager, ManId]);
  if MastSet <> '' then Params :=
    Format('%s -%s%s -%s%d', [Params, parMastSet, MastSet, parMastId, MastId]);
  if RateId > 0 then Params := Format('%s -%s%d', [Params, parRate, RateId]);
  Result := ShellUtil(fShlRateHotel, Params, Title);
end;

function ExecAndWait(const FileName,
                     Params: ShortString;
                     const WinState: Word): boolean; export; 
var 
  StartInfo: TStartupInfo; 
  ProcInfo: TProcessInformation; 
  CmdLine: ShortString; 
begin 
  { Помещаем имя файла между кавычками, с соблюдением всех пробелов в именах Win9x } 
  CmdLine := '"' + Filename + '" ' + Params; 
  FillChar(StartInfo, SizeOf(StartInfo), #0); 
  with StartInfo do 
  begin 
    cb := SizeOf(StartInfo); 
    dwFlags := STARTF_USESHOWWINDOW; 
    wShowWindow := WinState; 
  end; 
  Result := CreateProcess(nil, PChar( String( CmdLine ) ), nil, nil, false, 
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil, 
                          PChar(ExtractFilePath(Filename)),StartInfo,ProcInfo); 
  { Ожидаем завершения приложения } 
  if Result then 
  begin 
    WaitForSingleObject(ProcInfo.hProcess, INFINITE); 
    { Free the Handles } 
    CloseHandle(ProcInfo.hProcess); 
    CloseHandle(ProcInfo.hThread); 
  end; 
end;

function LaunchCheckProgRun(FileName, PathUpdProg: string): Boolean;
var DirPath: string;
    Params: string;
begin
  Result := True;
  Params := FileName + ' ' + PathUpdProg;
//  ExecAndWait(fShlUpdProg, Params, SW_SHOWNORMAL);
  ShellUtil(fShlUpdProg, Params, '');
end;

function CheckUpdateProg(FileName, ExeName, Server_Name: string): Boolean;
const PathUpdProg = 'N:\Deploy\TourMan\';
  function GetFileAge(FName: string): LongInt;
  begin
    Result := FileAge(FName);
    if Result = -1 then Result := 0
  end;
begin
  Result := False;    
  if ( UpperCase(ExtractFileName(Server_Name)) = 'TOURIB.GDB' ) and
     ( FileAge(ExeName) < GetFileAge(PathUpdProg + FileName ) )
  then
  begin
     WarningDlgY('Існує нова версія програми ' + FileName + #13'зараз відбудеться оновлення!');
     Result := LaunchCheckProgRun(FileName, PathUpdProg);
   end;
end;

  function OrderPaymentNewDllFunc( DllFunc : Pointer; paramFun:Pointer ): Boolean;
  begin
    Result := TOrderPaymentNewDlg(DllFunc)(POrderPaymentParamDll(paramFun)^.AppHandle,
      POrderPaymentParamDll(paramFun)^.AOrderId,
      POrderPaymentParamDll(paramFun)^.AManagerId, 
      POrderPaymentParamDll(paramFun)^.APosition);
  end;


  function FinalFactureNewDllFunc( DllFunc : Pointer; paramFun:Pointer ): Boolean;
  begin
    PCreateFinalFactureParamDll(paramFun).AResult := 
      TCreateFinalFacture(DllFunc)(PCreateFinalFactureParamDll(paramFun)^.AIBDatabase,
        PCreateFinalFactureParamDll(paramFun)^.AOrderId,
        PCreateFinalFactureParamDll(paramFun)^.AManagerId, 
        PCreateFinalFactureParamDll(paramFun)^.aStyle);
  end;

function ExecuteOrderPaymentNewDlg_dll(aHandle: Cardinal; aOrderId, aManager: Integer; APosition: TPoint): Boolean;
var param: POrderPaymentParamDll;
begin
  try
    new(param);           
    param.AppHandle  := aHandle;
    param.AOrderId   := aOrderId;
    param.AManagerId := aManager;
    param.APosition := APosition; //PersonPayDBGrid.ClientOrigin;    
    ExecFunctDLL(sOrderPayLibName, 'ExecuteOrderPaymentNew',  OrderPaymentNewDllFunc, param );
    Result := True;//param.AResult;
  finally
    Dispose(param);
  end;    
end;

function CreateFinalFactures_dll(aOrderId, aManager: Variant; aIBDatabase: TIBDatabase;
  aStyle: TcxStyle): Boolean;
var param: PCreateFinalFactureParamDll;
begin
  try
    new(param);
    param.AIBDatabase := aIBDatabase;
    param.AOrderId   := aOrderId;
    param.AManagerId := aManager;
    param.aStyle := aStyle;    
    ExecFunctDLL(sOrderPayLibName, 'CreateFinalFactures',  FinalFactureNewDllFunc, param );
    Result := param.AResult;
  finally
    Dispose(param);
  end;    
end;


end.
