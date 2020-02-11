unit UnitFunctSoapDll;

interface
uses
  Windows,
  UnitSoap1C,
  UnitTourSoup,
  SysUtils,
  Dialogs,
  Classes,
  SOAPHTTPClient,
  forms,
  iniFiles,
  IBQuery,
  IBDatabase,
  Math,
  DB,
  XSBuiltIns,
  SOAPHTTPTrans,
  DateUtils,
  cxEdit,
  Variants,
  IBUpdateSQL,
  Controls,
  cxStyles,
  UnitProc ,
  TourCmnlIf,
  IdHTTP,
  frmMergeLogSoap,
  cxGridDBTableView,
  cxGridTableView,
  Buttons,
  OptSet,
  FrmProgress,
  Graphics,
  UnitIBQuery,
  UnitADOQuery,
  ADODB,
  IBCustomDataSet,
  cxVGrid,
  core,
  UnitCompareDataGrid,ceflib,
  UnitSqlDB ;

const //DllSoap1c = 'Soap1C.dll';
      SoapUser = 'robot';
      SoapPassword = '1111111';

      TourSoapUser = '1CUSER';
      TourSoapPassword = 'Robot1111111';

      CaptionLeftPart = 'Дані з туристичної програми';
      CaptionRightPart = 'Дані з бухгалтерської програми 1C';

      CaptionLogMergeSoap1CAdmin = 'Журнал синхронізації 1C ( Адміністратор )';
      CaptionLogMergeSoap1CUser  = 'Журнал синхронізації 1C';

      CaptionSelectData ='Вибрати';
      CaptionNewCreateContragent ='Новий';

      CaptionCompareDataWindow ='Порівняння даних';
      CaptionSynchronize = 'Синхронізувати';
      CaptionButtRefresh = 'Оновити';
      CaptionUnLink = 'Розлінкувати';

      CaptionAskUnlink = 'Ви дійсно хочете розлінкувати контрагента з партнером?';
      //, 1200, DialogMaxHeight, 150, True,True, datClDB, datClSoap, 'Синхронізувати', '','Оновити'

      codeNumMedical=1;
      codeNumInsur=2;
      codeNumTourism=4;

type

  TParamConUrl = record
    defWSDL :String;
    defURL  :String;
    defSvc  :String;
    defPrt  :String;
  end;

  TValueArr = record
   FieldName:Widestring;
   Index:Integer;
   Value:Variant;
  end;



 TFunctCallSoap1C = class
    private
     FConDBParam:TConnectDBParam;

     FMarkDifStyle : TcxStyle;
     FCompareData:TCompareDataGrid;
     FCurrClientId :Integer;
     FCheckConnectToServer :Boolean;

     FViewLog:TcxGridDBTableView;
     FMenId:Integer;
     FIsAdmin:Boolean;
     DBMergeLog1C:TDataset;
     FShowWhenDifferent:boolean;
     FSearchInDeleted1C:Boolean;
     FWriteLog:Boolean;
     FShowMessageError:Boolean;
     AskForFonfirmAction:Boolean;
     AutoMergeForUpdate :Boolean;
     SkipWhenConfuse:Boolean;
     FShowLoadCursor:boolean;
     FParamConUrl : TParamConUrl;
     FParamConUrlTourSoap : TParamConUrl;
     FCanCreateNew:Boolean;
     FCanSelect:Boolean;
     
     FFontMessageInfo : TFont;

     procedure FShowMouseCursorDefault;
     procedure FShowMouseCursorLoad;

     function GetElementAddres(PData:PDatCli):Address;
     function GetElementContragent(PData:PDatCli):ContragentDTO;
     function GetElementContract( PData:PDatCon ) : ContractDTO;

     function FGetFunction( NameDll , NameFunction:PAnsiChar;var DLLInstance: THandle):pointer;
     function FCreateClientSoap( PData:PDatCli;ShowMessageError:Boolean =false ):Integer;
     function FUpdateClientSoap( PData:PDatCli;ShowMessageError:Boolean =false ):Integer;
     function FCreateContractSoap( PData:PDatCon;ShowMessageError:Boolean = false ):Integer;
     function FUpdateContractSoap( PData:PDatCon; ShowMessageError:Boolean = false ):Integer;

     function FCreateClient( id:Integer;  ShowMessageError:Boolean =false ):Integer;
     function FUpdateClient( id:Integer;  ifNotFoundCreate:Boolean = False; ShowMessageError:Boolean =false ):Integer;
     function FDeleteClient( id: Integer; ShowMessageError:Boolean =false ):Integer;

     function FCreateContractByClientId( id:Integer;  ShowMessageError:Boolean = false ): Integer;
     function FUpdateContractByClientId( id:Integer;  ShowMessageError:Boolean =false ): Integer;

     function FDeleteContract( const ContractID: Integer; ShowMessageError:Boolean =false  ): Integer;

     function FCreateContractByContractId(idClient, id:Integer;  ShowMessageError:Boolean = false ): Integer;
     function FUpdateContractByContractId(idClient, id:Integer;  ShowMessageError:Boolean =false ): Integer;

     function FConvertDataBank1CSoap(aData:TDatCliAccounts):UnitSoap1C.Bank;
     function FConvertDataBankTourSoap(aData:TDatCliAccounts):TBankSoap;

     function FConvertAccountsToElem(DataArr:TDatCliAccountsArr): AccountArray;
     function FUpdateClientAccountsSoap( DataArr:TDatCliAccountsArr;ShowMessageError:Boolean = false ):Integer;

     function  FGetClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer;isPrivate:Boolean;
                           Code1C,Name, Search1CByName:WideString; SearchInDeleted: Boolean;
                           var ResData:TDataCliArr;  ShowMessageError:Boolean =False  ):Integer;

     function  FGetClientAccounts(  EDRPOU: EDRPOU;ClientID: Integer;SearchInDeleted: Boolean;  var ResData:TDatCliAccountsArr;  ShowMessageError:Boolean =False ):Integer;

     procedure DestroyElemInvoiceDTO(Elem:InvoiceDTO);
     function  FConvertInvoiceToElem(aData:TDatInvoice;aOrderId:Integer): InvoiceDTO;
     function  FUpdateInvoice( PData:PDatInvoice;aOrderId:Integer; ShowMessageError:Boolean = False ):Integer;
     function  FUpdateInvoiceByOrderIdAndNumberInvoice(  OrderID, InvoiceNo:Integer;
                                                         var InvoiceId:Integer;IsFinaly:Boolean; ShowMessageError:Boolean =false ): Integer;

     Function  FInvoiceUpdateStatus( IdInvoice:Variant;StatusParam:Integer; ShowErrorMessage:Boolean=false ):Integer;                                                    
     Function  FInvoicePaymentCancel( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
     Function  FInvoicePaymentEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
     Function  FInvoicePaymentAllTimeEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
     Function  FInvoicePaymentProhibited( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;

     function  FUpdateInvoicePackegeStatus( ShowMessageError:Boolean =false ): Integer;
     function  FConvertPackedStatusInvoiceToElem(aData:TDatPackedStatusInvoiceArr ): InvoiceStatusArray;
     function  FUpdateStatusPackedInvoices( PData:PDatPackedStatusInvoiceArr; ShowMessageError:Boolean =False ):Integer;

     function  FGetElemCurrencyRateArr(aData:TDataCurrencyRateArr):CurrencyRateArray;
     procedure FFreeElemCurrencyRateArr(aElem:CurrencyRateArray);
     function  FUpdateCurrencyRate( CurrencyId:array of Integer;ForDate:TDateTime; var DatCurrRateArr:TDataCurrencyRateArr; ShowMessageError:Boolean =false ): Integer;
     function  FUpdateCurrencyRateSoap( PData:PDataCurrencyRateArr; ShowMessageError:Boolean =False ):Integer;

     Procedure FAddValueToConvertArr( var ArrDat:PDataValueArr;IndexArr:Integer; FieldName, Comment:Widestring; Value:Variant;ValueType:TFieldType;
                                      DisplayText:Widestring=''; Visible:Boolean=true;Compare:Boolean=true;
                                      ShowButtonEvent:PEditButProp=nil );

     Function  FCheckCountNotDeletedFromDavaValueArr(valueDataArr:TDataCliArr;var FirstIndexNotDeleted:Integer):Integer;
     Function  FUpdateDBDataClient( valueDataLeft,valueDataRight:PDataValueArr;  ShowMessageError:Boolean=false ):integer;

     Function  FUpdateDataClientAccountsDB(MenId:Integer; DatCli : TDatCliAccountsArr):Integer;

     Function  FLinkSoapDataToDBAndRefreshRepresentationData( DatCli,DatCliSoap : TDataCliArr; LinkWithNewCodeIC:Widestring;
                                                               ShowMessageError,SearchInDeleted:Boolean;CaptionSelectLeft,CaptionSelectRight:Widestring ):integer;

     Function  FUpdateSoapDataClient( valueDataLeft,valueDataRight:TDataValueParamArr;SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;
     Function  FUpdateDataClientAccounts( valueDataLeft,valueDataRight:TDataValueParamArr;SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;

     Function  FNewSoapDataClient( valueDataLeft,valueDataRight:TDataValueParamArr;SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;

     function  FgetValueByFieldFromValueArrByndex(dataArr: PDataValueArr; FieldName:string;IndexArr:Integer):TValueArr;
     function  FgetValueByFieldFromValueArr(dataArr: TDataValueArr;FieldName:string):Variant;
     function  FLink1CdataToDBData( CompanyID:Integer;NewCode1C:String ):integer;
     procedure FRefreshDataLeftPart(valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean);
     procedure FRefreshDataRightPart(valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean);
     function  FLink1CdataInvoiceToDBData( OrderID:Integer; BillingNo,NewCode1C:String ):integer;

     procedure FRefreshDataClientAccountsLeftPart(valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean);

     procedure FSetFocusedRowAfterRefresh(View:TcxGridDBTableView;TopRowIndex, CurrFocuseItemIndex:Integer);

     function  FUpdateLogMerge(IdOperation,TypeOperation, MenId, IsMerge, Reason:Integer):integer;
     //Function  FSynhronizationDBAnd1CurrLogMerge( View:TcxGridDBTableView; CurrLogMergeId,CurrOPERATIONID:Integer; MenId:Integer=-1; ShowWhenDifferent:boolean=True; SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false ):integer;
     Function  FSynhronizationDBAnd1CByViewLogMerge(View:TcxGridDBTableView;MenId:Integer=-1; ShowWhenDifferent:boolean=True; SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false ):integer;

     function  FViewMergeSoapCurrSynhronize(ShowWhenDifferent:boolean=True;WriteLog:Boolean=false ):integer;
     procedure FViewMergeSoap1CDblClick(Sender: TObject);
     procedure FButSynhronizeAllButClick(Sender: TObject);

     procedure FShowUserAllMergeLogBut(Sender: TObject);
     procedure FShowUserSelfMergeLogBut(Sender: TObject);

     procedure FShowAdminSynhrinizeMergeLogBut(Sender: TObject);
     procedure FShowAdminAllMergeLogBut(Sender: TObject);
     procedure FShowAdminNotSynhrinizeMergeLogBut(Sender: TObject);

     Function  FFirstRunRefresh(var DB:TDataset;MenId:Integer;IsAdmin:Boolean;frmMergeSoap1C:TfrmMergeSoap ):Integer;
     Procedure FRefreshDBLog1CAdmin(var DB:TDataset; Sql:String='');
     Function  FRefreshMegeLog1CUser(var DB:TDataset; MenId , ButTypeSynhronize:Integer):Integer;
     function  FRefreshMegeLog1CAdmin(var  DB:TDataset;DateIndex,ButTypeSynhronize:Integer):integer;

     function  FCheckOnCompareAccountsAndMFO(DataLeft,DataRight:PDataValueArr):Integer;
     function  FSortRecognizedAccount( aDataStore:PDataValueArr; DatForFind:PDataValueArr ):Integer;
     Procedure FChangePlaceData(dat : PDataValueArr; IndexFrom,IndexTo:Integer);
     Procedure FAdaptingDataValueForCompareLeftRightPart( datClDB, datClSoap : TDataValueArr );
     function  FCompareInform(resCode:Integer; datClDB:TDataValueArr;
                             datClSoap:TDataValueArr;
                             MessNotFoundFrom,MessNotFoundSoap:Widestring;ShowMessageError:Boolean =False ):Integer;
     procedure FFreeMemDataArr(PData:PDataValueArr);
     function  FCheckReasonId(Res:Integer):Integer;

     function  FGetBillingData(aData:TPaymentBillingDataRec) : TPaymentBillingData;
     function  FGetRealizationsByInvoice( Code1C:string;SearchInDelete, SearchInUnposted:Boolean; ShowMessageError:Boolean =False; CheckConnectToServer:Boolean=True  ):GetRealizationsResult;
     function  FUnlinkClient (const ContragentID: Integer; const ContragentCode: WideString):Integer;
     procedure FCodeRowEdit1CPropertiesButtonClick( Sender: TObject; AButtonIndex: Integer);
     procedure FCodeRowEditDBPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    public
     constructor Create( ConDBParam:TConnectDBParam; MarkDifStyle:TcxStyle;ShowLoadCursor:Boolean=true ); overload;
     destructor Close;
     function CheckSoapServer:Boolean;

     function ConvertCliToValueArr(DatCli : TDataCliArr):PDataValueArr;
     procedure ReadParamCon1C( Key:String );
     function ConvertCliAccountsToValueArr( DatCli : TDatCliAccountsArr ):PDataValueArr;

     procedure PrepareFuncUpdateForDataClient(  var datClDB:TDataValueArr;var datClSoap:TDataValueArr;CompareData:TCompareDataGrid;SearchInDeleted:boolean;  ShowMessageError:Boolean =false  );
     procedure PrepareFuncUpdateForDataClientAccounts(  var datClDB:TDataValueArr; var datClSoap:TDataValueArr;CompareData:TCompareDataGrid;SearchInDeleted:boolean; ShowMessageError:Boolean = false );


     function UpdateCurrencyRate( MenId:Integer; CurrencyId:array of Integer;ForDate:TDateTime;WriteLog:Boolean=false; ShowMessageError:Boolean =false ): Integer;
     function GetDataClientAccountDBForClientById( ClientID:Integer ):PDataValueArr;

     function GetDataDBForClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer ):PDataValueArr;
     function GetDataDBForClientById( id:Integer ):PDataValueArr;

     function GetDataSoapForClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer;isPrivate:Boolean;
                                    Code1C,Name,Search1CByName:WideString; SearchInDeleted: Boolean;
                                    var resCode:Integer;  ShowMessageError:Boolean =False;CaptionSelect:Widestring='' ):PDataValueArr;
     function GetDataSoapForClientAccount( EDRPOU: EDRPOU; ClientID: Integer; SearchInDeleted: Boolean;var resCode:Integer; ShowMessageError:Boolean =False ):PDataValueArr;

     Function ClientCreate(id:Integer; ShowErrorMessage:Boolean ):Integer;

     Function ClientDelete( id:Integer; ShowErrorMessage:Boolean ):Integer;
     Function ClientUpdate(id:Integer; ifNotFoundCreate:Boolean =false; ShowErrorMessage:Boolean=false ):Integer;

     Function ContractCreateByClientId(id:Integer; ShowErrorMessage:Boolean ):Integer;
     Function ContractUpdateByClientId(id:Integer; ShowErrorMessage:Boolean=false):Integer;

     Function ContractCreateByContractId(idClient, id:Integer; ShowErrorMessage:Boolean ):Integer;
     Function ContractUpdateByContractId(idClient, id:Integer; ShowErrorMessage:Boolean=false ):Integer;

     Function ContractDelete(id:Integer; ShowErrorMessage:Boolean ):Integer;
     procedure SynchronizePrivateByIDENTCodeAndName( aSkipWhenConfuse:Boolean; withIdentCode:Boolean );
     Function UpdateBillingData( aBank:PDatCliAccounts; aData:PPaymentBillingDataRec; ShowMessageError:Boolean = false ):Integer;

     function GetDataClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer; isPrivate:Boolean; Code1C,Name,ClientName:WideString; SearchInDeleted: Boolean;  var ResData:TDataCliArr;  ShowMessageError:Boolean =False ): integer;
     function ShowCompareClient(datClDB:TDataValueArr; datClSoap:TDataValueArr;SearchInDeleted:Boolean;
                                ShowMessageError:Boolean =False; ShowWhenDifferent:Boolean=true; ParamFindCheck:PParamFindCheck=nil;ParamMessageInfo : PParamMessageInfo=nil ):integer;
     function ShowCompareClientAccounts( datClDB:TDataValueArr; datClSoap:TDataValueArr;SearchInDeleted:Boolean;ShowMessageError:Boolean =False; ShowWhenDifferent:Boolean=true ):integer;


     function ShowCompareByClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer;isPrivate:Boolean;
                                   Code1C,Name,Search1CByName:WideString; SearchInDeleted: Boolean;
                                   var datClDB:TDataValueArr;var datClSoap:TDataValueArr; ShowMessageError:Boolean =false; ShowWhenDifferent:Boolean=true ):integer;

     function ShowCompareByClientAccounts( EDRPOU: EDRPOU; ClientID: Integer; SearchInDeleted: Boolean; var datClDB:TDataValueArr;
                                           var datClSoap:TDataValueArr; ShowMessageError:Boolean =false; ShowWhenDifferent:Boolean=true ):integer;

     function SynhronizationClientAndBankAccountsDBAnd1C( MenId , idClient:Integer; ShowWhenDifferent:boolean=True;
                                                          SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;

     function SynhronizationClientAndContractDBAnd1C( MenId , idClient:Integer; WriteLog:Boolean=false;
                                                      ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;

     function SynhronizationClientAndContractDBAnd1CByContractId( MenId , idClient, idContract:Integer; WriteLog:Boolean=false;
                                                                  ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;

     function SynhronizationBankAccountsDBAnd1C( MenId,idClient:Integer; ShowWhenDifferent:boolean=True;
                                                 SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false; AutoMerge:boolean=false ):Integer;

     function SynhronizationCompanyDBAnd1C(MenId, idClient:Integer;ShowWhenDifferent:boolean=True;
                                           SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false;AutoMerge:boolean=false;CreateIfNotFound:Boolean=True ):Integer;

     function SynhronizationClientAndInvoiceDBAnd1C( MenId, idClient, OrderID, InvoiceNo:Integer;
              SearchInDeleted1C:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false; AutoMerge:boolean=false ):Integer;

     function SynhronizationClientContractAndInvoiceDBAnd1C( MenId, idClient, idContract, OrderID, InvoiceNo:Integer;
              SearchInDeleted1C:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false; AutoMerge:boolean=false; IsFinal:Boolean=False ):Integer;

     function SynhronizationContractDBAnd1CByClientId( MenId , idClient:Integer; WriteLog:Boolean=false; ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;
     function SynhronizationContractDBAnd1CByContractId( MenId ,idClient, idContract:Integer; WriteLog:Boolean=false; ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;

     function SynhronizationFinalyInvoiceDBAnd1C( MenId , OrderID, InvoiceNo:Integer; WriteLog:Boolean=false;
                                                              ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;
     function SynhronizationInvoiceDBAnd1C( MenId , OrderID, InvoiceNo:Integer; WriteLog:Boolean=false; ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;
     Function InvoiceUpdateByOrderAndNumberInvoice(OrderID, InvoiceNo:Integer;var InvoiceId:Integer;IsFinaly:Boolean; ShowErrorMessage:Boolean=false ):Integer;
     Function InvoicePackedsUpdate( ShowErrorMessage:Boolean=false ):Integer;
     Function InvoicePaymentCancel( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
     Function InvoicePaymentEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
     Function InvoicePaymentAllTimeEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
     Function InvoicePaymentProhibited( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;

     function GetRealizationsByInvoice( Code1C:string;SearchInUnposted:Boolean; ShowMessageError:Boolean =False;CheckConnectToServer:Boolean=True ):GetRealizationsResult;
     //procedure DestroyElemRealizationsArray( ElemRealizationArr:RealizationsArray );

     function ShowFindMergeSoap1CLog(MenId:Integer;isAdmin:Boolean=False; ShowWhenDifferent:boolean=True; SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false;ShowWhenNotEmpty:Boolean=true ):Integer;

     function GetAllContractsForClientId( Id:Integer ):TDataset;
     procedure DestroyDSQuery(aDS:TDataset);

     published

     property ConDBParam:TConnectDBParam read FConDBParam;
     //property ConnectionStr:string read FConnectionStr ;
     //property LoginDB :string read FLoginDB;
     //property PasswordDB:string read FPasswordDB;


  end;
  var SoapOptionSet :TOptionSet;
  function ConvertArrValueToDatCliAccounts( valueData:PDataValueArr  ):TDatCliAccountsArr;
  function ConvertArrValueToDatCli( valueData:PDataValueArr  ):TDataCliArr;
  function ReadParamCon(FileIni:string;KeySec:String):TParamConUrl;
  function ReadParamConUrl1C(FileIni:String):TParamConUrl;
  function ReadParamConUrlTourSoap(FileIni:String):TParamConUrl;
  procedure FillCurrencyPackedByByDataset( pac:PDataCurrencyRateArr; DS:TDataset );
  function GetInvoiceByByDataset( DS, DSDetail:TDataset;IsFinaly:Boolean ):PDatInvoice;
  function GetInvoiceDataShortByDataset( DS:TDataset ):PDatInvoiceShort;
  function GetValueByFieldFromValueArr(dataArr: TDataValueArr; FieldName:string):Variant;
implementation

uses cxGridCustomTableView, InvokeRegistry ;


{ TFunctCallSoap1C }
//******************************************************************************
constructor TFunctCallSoap1C.Create( ConDBParam:TConnectDBParam; MarkDifStyle:TcxStyle;ShowLoadCursor:Boolean=true);
begin
  SkipWhenConfuse:=False;
  FConDBParam := ConDBParam;
  //FConnectionStr := ConnectToDB;
  //FLoginDB := Login;
  //FPasswordDB := Password;

  FMarkDifStyle:=MarkDifStyle;
  AskForFonfirmAction:=true;
  FShowLoadCursor:= ShowLoadCursor;
  SoapOptionSet := TOptionSet.Create;
  FParamConUrl := ReadParamConUrl1C( OptSet.IniFileName );
  FParamConUrlTourSoap := ReadParamConUrlTourSoap(OptSet.IniFileName);
  FCheckConnectToServer:=True;

  FFontMessageInfo:=TFont.Create;
  FFontMessageInfo.Color := clBlack;
  FFontMessageInfo.Style := [fsBold];
end;
//******************************************************************************
destructor TFunctCallSoap1C.Close;
begin
 SoapOptionSet.Free;
 FFontMessageInfo.Free;
end;
//******************************************************************************
procedure TFunctCallSoap1C.ReadParamCon1C( Key:String );
begin
  FParamConUrl := ReadParamCon( OptSet.IniFileName,Key );
end;
//******************************************************************************
function TFunctCallSoap1C.FGetFunction( NameDll , NameFunction:PAnsiChar;var DLLInstance: THandle):pointer;
begin
 result:=nil;
 if DLLInstance=0 then DLLInstance := LoadLibraryA(NameDll);
 if DLLInstance > 32 then
    result := GetProcAddress(DLLInstance, NameFunction)
end;
//******************************************************************************
function IsInteger(const S: String): Boolean;
var
  X: Double;
  E: Integer;
begin
  Val(S, X, E);
  Result := (E = 0) and (Trunc(X) = X);
end;
//******************************************************************************
function CreateDataSet( ConnectToDB, Login, Password:String; SQL:String='' ):TIBQuery;
var IBTransaction : TIBTransaction;
    IBDB : TIBDatabase;
begin
 try
   IBDB := TIBDatabase.Create(nil);
   IBDB.DatabaseName := ConnectToDB;
   IBDB.LoginPrompt  :=False;
   IBDB.Params.Values['user_name'] := Login;
   IBDB.Params.Values['password']  := Password;
   IBDB.Connected:=True;

   if IBDB.Connected then
   begin
     result := TIBQuery.Create(nil);
     IBTransaction := TIBTransaction.Create(nil);

     IBTransaction.DefaultDatabase := IBDB;
     result.Transaction := IBTransaction;
     if SQL<>'' then
     begin
      result.SQL.Text := SQL;
      result.Active := true;
     end; 
   end
    else
    begin
      IBDB.Free;
      result:=nil;
    end;
 finally

 end;
end;
//******************************************************************************
procedure DestroyDS( DS : TIBQuery );
begin
  if DS <> nil then
  begin
   if DS.Transaction <> nil then
   begin
     if DS.Transaction.DefaultDatabase <> nil then
        DS.Transaction.DefaultDatabase.Free;

     DS.Transaction.Free;
   end;
   DS.Free;
  end;
end;
//******************************************************************************
procedure readAddressClient( ConDBParam:TConnectDBParam; var aDataCli:PDatCli);
var DBAddres:TDataset;
begin
 try
   if ConDBParam.IBDatabaseConnection<>nil then
    DBAddres := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password,nil, GetSQLClientAddres( aDataCli.ContragentID ) );

   if ConDBParam.ADOConnection<>nil then
    DBAddres := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSQLClientAddres( aDataCli.ContragentID ) );

   if ( DBAddres<>nil ) and ( not DBAddres.IsEmpty ) then
     GetAddressClientByDataset( DBAddres ,aDataCli );

 finally
   DestroyDB( DBAddres );
 end;
end;
//******************************************************************************
function GetDataDBClientBySql(ConDBParam:TConnectDBParam; SQL:String):PDatCli;
var DS:TDataset;
begin
  try
  result:=nil;
  if ConDBParam.IBDatabaseConnection<>nil then
    DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, SQL );

  if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, SQL );

  if (DS <> nil) and( DS.RecordCount <>0 ) then
  begin
    result := GetDataDBClientByDataset( DS );
    readAddressClient( ConDBParam , result );
    //******************
  end;
 finally
   DestroyDB( DS );
 end;
end;
//******************************************************************************
function GetDataDBClientAccountBySql( ConDBParam:TConnectDBParam;SQL:String):PDatCliAccountsArr;
var DS:TDataset;
    i:integer;
begin
 try
   result:=nil;

   if ConDBParam.IBDatabaseConnection<>nil then
     DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, SQL );

   if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, SQL );

   if (DS <> nil) and( DS.RecordCount <>0 ) then
   begin
    DS.Last;
    DS.First;
    i:=0;
    New( result );
    SetLength( result^ , 0 );
    SetLength( result^ , DS.RecordCount );

    While not DS.Eof do
    begin
      result^[i].ContragentID:=DS.fieldByName('COMPANYID').AsInteger;
      result^[i].EDRPOU      :=DS.fieldByName('EDRPOU').AsString;

      result^[i].AccountID := DS.fieldByName('ACCOUNTID').AsInteger;
      result^[i].AccountNO := DS.fieldByName('ACCOUNTNO').AsString;
      result^[i].BankName  := DS.fieldByName('BANK_NAME').AsString;
      result^[i].BankMFO   := DS.fieldByName('BANK_MFO').AsString;
      result^[i].BankAddres:= DS.fieldByName('BANK_ADDRESS').AsString;
      result^[i].BankActive:= DS.fieldByName('BANK_ACTIVE').asInteger;
      result^[i].MarkedToDelete := DS.fieldByName('MarkedToDelete').AsBoolean;

      DS.Next;
      Inc(i);
    end;
   end;

 finally
   DestroyDB(DS);
 end;
end;
//******************************************************************************
function GetDataDBClientById( id:Integer; ConDBParam:TConnectDBParam ):PDatCli;
begin
 result:=GetDataDBClientBySql( ConDBParam,GetSQLClientForID( id ) );
end;
//******************************************************************************
function GetDataDBClient(  EDRPOU: EDRPOU;INN: INN;ClientID: Integer; ConDBParam:TConnectDBParam ):PDatCli;
begin
 //result:=GetDataDBClientBySql(  ConnectToDB, Login, Password,GetSQLClientForEDRPO( EDRPOU, INN, ClientID ) );
 result:=GetDataDBClientBySql(  ConDBParam, GetSQLClientForID( ClientID ) );
end;
//******************************************************************************
function GetClientIdByContractId(ContractId:Integer; ConDBParam:TConnectDBParam ):Integer;
var DS:TDataset;
begin
  try

   if ConDBParam.IBDatabaseConnection<>nil then
    DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, GetSqlForGetClientIdForContractId( ContractId ) );

   if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSqlForGetClientIdForContractId( ContractId ) );

   if (DS <> nil)and(DS.RecordCount<>0) then
     result := DS.FieldByName('COMPANYID').AsInteger
     else result:=-1;
  finally
    DestroyDB( DS );
  end;
end;
//******************************************************************************
function GetInvoiceDataByInvoiceId( InvoiceId:Integer; ConDBParam:TConnectDBParam ):PDatInvoiceShort;
var DS:TDataset;
begin
  try

  { if ConDBParam.IBDatabaseConnection<>nil then
    DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password,  GetSQLDataInvoiceByInvoiceId( InvoiceId ) );

   if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection,  GetSQLDataInvoiceByInvoiceId( InvoiceId ) ); }

   DS := DBCreate( GetSQLDataInvoiceByInvoiceId( InvoiceId ), nil, ConDBParam );

   if (DS <> nil)and ( DS.RecordCount <> 0) then
     result :=  GetInvoiceDataShortByDataset( DS )
   else result := nil;
  finally
    DestroyDB( DS );
  end;
end;
//******************************************************************************
function  GetCurrnecyDateByCurrencyCommerceId( CurrencyComerceId:Integer;ConDBParam:TConnectDBParam ):PDataCurrencyRateArr;
var DS:TDataset;
begin
  result := nil;
  try

    DS := DBCreate( GetSQLCurrecyDateByCurrencyCommerceId( CurrencyComerceId ), nil, ConDBParam );
   {if ConDBParam.IBDatabaseConnection<>nil then
    DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password,  GetSQLCurrecyDateByCurrencyCommerceId( CurrencyComerceId ) );

   if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection,  GetSQLCurrecyDateByCurrencyCommerceId( CurrencyComerceId ) ); }

   if (DS <> nil)and ( DS.RecordCount <> 0) then
   begin
     New( result );
     FillCurrencyPackedByByDataset( result, DS );
   end
   else result := nil;

  finally
    DestroyDB( DS );
  end;

end;
//******************************************************************************
function GetDataContractByDataset( DS:TDataset;idClient:Integer):PDatCon;
var DateContr:TDateTime;
    DateContEnd:TDateTime;
begin
  New(result);

  result.ContractID  := DS.FieldByName('COMPCONTRACTID').AsInteger;
  result.ContragentID := idClient;// DS.FieldByName('COMPANYID').AsInteger;
  result.Name := Trim(DS.FieldByName('NAME').AsString);
  result.PrintName := Trim(DS.FieldByName('NAME').AsString);
  result.Comment := Trim(DS.FieldByName('COMMENTS').AsString);
  result.ContractNumber := DS.FieldByName('NUMCONTRACT').AsString;
  result.ContractType   := DS.FieldByName('CONTTYPE').AsInteger;

  DateContr :=  DS.FieldByName('FROMDATE').AsDateTime;
  DateContEnd := DS.FieldByName('TILLDATE').AsDateTime;

  result.ContractPath := GetDocStoreFolder( SoapOptionSet.StoreFolder, [ result.ContragentID ], 6 );
  result.ContractStartDate := IntToStr(YearOf(DateContr))+
                              format( '%.2u',[ MonthOf(DateContr) ] ) +
                              format( '%.2u',[ DayOf(DateContr) ] );

  result.ContractEndDate   := IntToStr(YearOf(DateContEnd))+
                              format( '%.2u',[ MonthOf(DateContEnd) ] ) +
                              format( '%.2u',[ DayOf(DateContEnd) ] );
end;
//******************************************************************************
function GetInvoiceDataShortByDataset( DS:TDataset ):PDatInvoiceShort;
begin
  if not DS.IsEmpty then
  begin
    New(result);
    Result.InvoiceID := DS.FieldByName('INVOICEID').AsInteger;
    Result.OrderId := DS.FieldByName('ORDERID').AsInteger;
    Result.ContragentID := DS.FieldByName('CompanyId').AsInteger;
    Result.InvoiceNumber := DS.FieldByName('BILLINGNO').AsInteger;
    Result.ContractId :=  DS.FieldByName('compcontractid').AsInteger;
  end
  else Result := nil;
end;
//******************************************************************************
function GetCode1CByCodeTour( CodeFromTour:Integer ):Integer;
begin
  if CodeFromTour =  12 then result := codeNumMedical;
  if CodeFromTour =  13 then result := codeNumInsur;
  if CodeFromTour =   8 then result := codeNumTourism;

  // Code
  //1  Страхування медичне    12
	//2  Страхування від нещасних випадків  13
	//3  Туристичні послуги по Україні
	//4  Туристичні послуги закордоном   8
	//5  Послуга проїзд по Україні
	//6  Послуга проїзд закордоном
	//7  Послуга проживання в Україні
	//8  Послуга проживання за кордоном
	//9  Послуга екскурсія по Україні
  //10 Послуга екскурсія закордоном
  //11 Послуга віза
  //12 Авансовий платіж
end;
//******************************************************************************
procedure GetInvoiceDetailByDataset( DS,DSDetail:TDataset;var DatInvoice:PDatInvoice );
var len:Integer;
begin
  if DSDetail = nil then
  begin
    SetLength(DatInvoice.Goods,1);
    DatInvoice.Goods[0].Price   := DS.FieldByName('PAID').AsFloat + DS.FieldByName('DEBT').AsFloat;  // оплата + борг = сума рах.
    DatInvoice.Goods[0].TourID  := DS.FieldByName('TOURID').AsInteger;
    DatInvoice.Goods[0].GroupID := DS.FieldByName('TOURGROUPID').AsInteger;
    DatInvoice.Goods[0].Code    := 100; // 100 Авансовий платіж
  end
  else
  begin
    DSDetail.First;
    While not DSDetail.EOF do
    begin
      len := Length( DatInvoice.Goods );
      SetLength( DatInvoice.Goods, len+1);

      DatInvoice.Goods[len].Price:= DSDetail.FieldByName('Debt').AsFloat;
      DatInvoice.Goods[len].TourID:= DSDetail.FieldByName('TourId').AsInteger;
      DatInvoice.Goods[len].GroupID:= DSDetail.FieldByName('TourGroupId').AsInteger;
      DatInvoice.Goods[len].Code:= GetCode1CByCodeTour( DSDetail.FieldByName('SrvCode').AsInteger );

      DSDetail.Next;
    end;

  end;
end;
//******************************************************************************
function GetInvoiceByByDataset( DS, DSDetail:TDataset;IsFinaly:Boolean ):PDatInvoice;
var DateInvoice:TDateTime;
    DateInvoiceEnd:TDateTime;
    DateTourEnd:TDateTime;
    OrderID:Integer;
begin
  New(result);
  OrderID := DS.FieldByName('ORDERID').AsInteger;

  result.InvoiceID    := DS.FieldByName('INVOICEID').AsInteger;
  result.InvoiceNumber:=  DS.FieldByName('BILLINGNO').asInteger;

  if (not DS.FieldByName('PeymToAgency').AsBoolean) and
     (DS.FieldByName('TRADENAMEID').AsString <> '' ) and
     (DS.FieldByName('headofficeid').AsInteger <>0 ) then
  begin
    result.ContragentID := DS.FieldByName('headofficeid').AsInteger;
    result.ContractID   := DS.FieldByName('headcontractid').AsInteger;
  end
  else
  begin
    result.ContragentID := DS.FieldByName('CompanyId').AsInteger;
    result.ContractID   := DS.FieldByName('COMPCONTRACTID').AsInteger;
  end;

  //if IsFinaly then
  //  result.InvoiceNumberStr:= IntToStr(OrderID)
  //else
  result.InvoiceNumberStr:= IntToStr(OrderID) + '-' + DS.FieldByName('BILLINGNO').AsString;

  Result.OrderId      := OrderID;
  result.Final := IsFinaly;

  if not DS.FieldByName('ANNULDATE').IsNull then result.State := 4
  else if DS.FieldByName('STOPED').AsBoolean then result.State := 1
  else result.State := 2;

  DateInvoice         := DS.FieldByName('BILLINGDATE').AsDateTime;
  DateInvoiceEnd      := DS.FieldByName('EXPIRETO').AsDateTime;
  DateTourEnd         := DS.FieldByName('TourDateEnd').AsDateTime;


  result.Date         := IntToStr(YearOf(DateInvoice))+
                         format( '%.2u',[ MonthOf(DateInvoice) ] ) +
                         format( '%.2u',[ DayOf(DateInvoice) ] ) +
                         format( '%.2u',[ HourOf(DateInvoice)   ] ) +
                         format( '%.2u',[ MinuteOf(DateInvoice) ] ) +
                         format( '%.2u',[ SecondOf(DateInvoice) ] ) ;

  result.DateInvoiceExpire  := IntToStr(YearOf(DateInvoiceEnd))+
                            format( '%.2u',[ MonthOf(DateInvoiceEnd) ] ) +
                            format( '%.2u',[ DayOf(DateInvoiceEnd) ] );

  result.DateTourEnd        := IntToStr(YearOf(DateTourEnd))+
                            format( '%.2u',[ MonthOf(DateTourEnd) ] ) +
                            format( '%.2u',[ DayOf(DateTourEnd) ] );

  Result.DirectionID        := DS.FieldByName('PRIORCOUNTRY').AsInteger;

  GetInvoiceDetailByDataset( DS, DSDetail, result );

  {SetLength(result.Goods,1);
  result.Goods[0].Price   := DS.FieldByName('PAID').AsFloat + DS.FieldByName('DEBT').AsFloat;  // оплата + борг = сума рах.
  result.Goods[0].TourID  := DS.FieldByName('TOURID').AsInteger;
  result.Goods[0].GroupID := DS.FieldByName('TOURGROUPID').AsInteger;
  result.Goods[0].Code    := 100; // 100 Авансовий платіж}

end;
//******************************************************************************
function GetInvoicePackedByByDataset( DS:TDataset ):PDatPackedStatusInvoiceArr;
var len:Integer;
begin
  DS.First;
  New(result);
  While not DS.Eof do
  begin
    len:= Length(result^);
    SetLength(result^,len+1);
    result^[len].InvoiceID := DS.FieldByName('INVOICEID').Value;
    result^[len].PaymentStatus := 2 ;//DS.FieldByName('INVOICEID').Value;

    DS.Next;
  end;
end;
//******************************************************************************
function GetDataContractByClientId( id:Integer; ConDBParam:TConnectDBParam ):PDatCon;
var DS:TDataset;
    TypeContr:Integer;
begin
 try
  result:=nil;

  if ConDBParam.IBDatabaseConnection<>nil then
    DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, GetSQLContractFormClientId( id ) );

  if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSQLContractFormClientId( id ) );

  if ( DS <> nil )and( DS.RecordCount<>0 ) then
    result := GetDataContractByDataset( DS, id );

 finally
   DestroyDB( DS );
 end;
end;
//******************************************************************************
function GetDataContractByContractId(idClient, id:Integer; ConDBParam:TConnectDBParam ):PDatCon;
var DS:TDataset;
    TypeContr:Integer;
begin
  try
    result:=nil;

    DS:= DBCreate(GetSQLContractFormContractId( id ),nil,ConDBParam );
    {if ConDBParam.IBDatabaseConnection<>nil then
      DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, GetSQLContractFormContractId( id ) );

    if ConDBParam.ADOConnection<>nil then
      DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSQLContractFormContractId( id ) );}

    if (DS <> nil)and(DS.RecordCount<>0) then
      result := GetDataContractByDataset( DS,idClient );

  finally
    DestroyDB( DS );
  end;
end;
//******************************************************************************
function GetInvoiceByOrderIdAndNumberInvoice( OrderID, InvoiceNo:Integer;ConDBParam:TConnectDBParam; IsFinaly:Boolean ):PDatInvoice;
var DS:TDataset;
    DSDetail:TDataset;
begin
 try
  result:=nil;

  {if ConDBParam.IBDatabaseConnection<>nil then
    DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, GetSQLInvoice( OrderID, InvoiceNo ) )
  else
  if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSQLInvoice( OrderID, InvoiceNo ) );  }

  DS := DBCreate( GetSQLInvoice( OrderID, InvoiceNo ), nil, ConDBParam );

  if IsFinaly then
  begin

    DSDetail := DBCreate( GetSQLInvoiceFinalyDetail( OrderID, InvoiceNo ), nil, ConDBParam );
    {if ConDBParam.IBDatabaseConnection<>nil then
      DSDetail := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, GetSQLInvoiceFinalyDetail( OrderID, InvoiceNo ) );

    if ConDBParam.ADOConnection<>nil then
      DSDetail := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSQLInvoiceFinalyDetail( OrderID, InvoiceNo ) ); }

  end
  else DSDetail := nil;

  if (DS <> nil) and (DS.RecordCount <> 0) then
    result := GetInvoiceByByDataset( DS, DSDetail, IsFinaly );
 finally
    DestroyDB( DS );
    DestroyDB( DSDetail );
 end;
end;
//******************************************************************************
function GetInvoicePackeds( ConDBParam:TConnectDBParam ):PDatPackedStatusInvoiceArr;
var DS:TDataset;
begin
 try
  result:=nil;
  if ConDBParam.IBDatabaseConnection<>nil then
    DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, GetSQLAllPackedInvoices );

  if ConDBParam.ADOConnection<>nil then
    DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSQLAllPackedInvoices );

  if (DS <> nil)and(DS.RecordCount<>0) then
    result := GetInvoicePackedByByDataset( DS );

 finally
   DestroyDB ( DS );
 end;
end;
//******************************************************************************
procedure FillCurrencyPackedByByDataset( pac:PDataCurrencyRateArr; DS:TDataset );
var len:Integer;
    CommDate:TDateTime;
begin
  DS.First;
  While not DS.Eof do
  begin
    len:= Length(pac^);
    SetLength( pac^, len+1 );

    CommDate := DS.FieldByName('CommDate').Value;
    pac^[len].CurrencyComerceId :=DS.FieldByName('CURRENCYCOMMERCEID').Value;
    pac^[len].CurrencyId := DS.FieldByName('CURRENCYID').Value;
    pac^[len].CurrencyCode := DS.FieldByName('currencycode').Value;
    pac^[len].Rate := DS.FieldByName('Rate').Value;
    pac^[len].Zoom := DS.FieldByName('CommRateZoom').Value;
    pac^[len].aDateTime := DS.FieldByName('COMMDATE').AsDateTime;

    pac^[len].aDate := IntToStr(YearOf(CommDate))+
                              format( '%.2u',[ MonthOf(CommDate)  ] ) +
                              format( '%.2u',[ DayOf(CommDate)    ] ) +
                              format( '%.2u',[ HourOf(CommDate)   ] ) +
                              format( '%.2u',[ MinuteOf(CommDate) ] ) + 
                              format( '%.2u',[ SecondOf(CommDate) ] ) ;
    DS.Next;
  end;
end;
//******************************************************************************
function GetCurrencyPacked( ConDBParam:TConnectDBParam; IdCurrency:array of Integer; ForDate:TDateTime ):PDataCurrencyRateArr;
var i:Integer;
    DS:TDataset;
begin
  result:=nil;
  New(result);

  for i:=0 to Length(IdCurrency)-1 do
  begin
    try
      if ConDBParam.IBDatabaseConnection<>nil then
        DS := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, GetSQLForCurrency( IdCurrency[i] , ForDate ) );

      if ConDBParam.ADOConnection<>nil then
        DS := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, GetSQLForCurrency( IdCurrency[i] , ForDate ) );


      if (DS <> nil) and (DS.RecordCount<>0) then
      begin
        if result = nil  then New(result);
          FillCurrencyPackedByByDataset( Result, DS );
      end;

    finally
      DestroyDB( DS );
    end;
  end;
end;
//******************************************************************************
procedure SetParamHTTPRIO( HTTPRIO: THTTPRIO; aParamConUrl : TParamConUrl );
var port:string;
begin
  HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
  HTTPRIO.WSDLLocation := aParamConUrl.defWSDL;
  HTTPRIO.URL := aParamConUrl.defURL;
  HTTPRIO.Service := aParamConUrl.defSvc;
  HTTPRIO.Port := aParamConUrl.defPrt;

  HTTPRIO.HTTPWebNode.UserName := SoapUser;
  HTTPRIO.HTTPWebNode.Password := SoapPassword;
end;
//******************************************************************************
procedure SetParamHTTPRIOTourSoap( HTTPRIO: THTTPRIO; aParamConUrl : TParamConUrl );
var port:string;
begin
  HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
  HTTPRIO.WSDLLocation := aParamConUrl.defWSDL;
  HTTPRIO.URL := aParamConUrl.defURL;
  HTTPRIO.Service := aParamConUrl.defSvc;
  HTTPRIO.Port := aParamConUrl.defPrt;

  HTTPRIO.HTTPWebNode.UserName := TourSoapUser;
  HTTPRIO.HTTPWebNode.Password := TourSoapPassword;
end;
//******************************************************************************
function TFunctCallSoap1C.GetAllContractsForClientId( Id:Integer ):TDataset;
begin
  if self.FConDBParam.IBDatabaseConnection<>nil then
    result := UnitIBQuery.CreateDataSet( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password, nil, GetSQLContractFormClientId( id ) );

  if self.FConDBParam.ADOConnection<>nil then
    result := UnitAdoQuery.CreateDataSet( self.FConDBParam.ADOConnection, GetSQLContractFormClientId( id ) );
end;
//******************************************************************************
Procedure TFunctCallSoap1C.DestroyDSQuery(aDS:TDataset);
begin
  DestroyDB(aDS);
end;
//******************************************************************************
Procedure TFunctCallSoap1C.FAddValueToConvertArr( var ArrDat:PDataValueArr; IndexArr:Integer; FieldName, Comment:Widestring;
                           Value:Variant;ValueType:TFieldType;DisplayText:Widestring='';Visible:Boolean=true;Compare:Boolean=true;
                           ShowButtonEvent:PEditButProp=nil );
var len:Integer;
begin
  len:=Length(ArrDat[IndexArr]);
  SetLength( ArrDat[IndexArr] , Len+1);
  New(ArrDat[IndexArr][len]);
  ArrDat[IndexArr][len].FieldName := FieldName;
  ArrDat[IndexArr][len].Caption := Comment;
  ArrDat[IndexArr][len].Value := Value;
  if DisplayText='' then ArrDat[IndexArr][len].DisplayText:= string(Value)
  else ArrDat[IndexArr][len].DisplayText:= DisplayText;

  ArrDat[IndexArr][len].ValueType:= ValueType;
  ArrDat[IndexArr][len].Visible:= Visible;
  ArrDat[IndexArr][len].Compare:= Compare;
  ArrDat[IndexArr][len].ShowButtonEvent := ShowButtonEvent;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateDBDataClient( valueDataLeft,valueDataRight:PDataValueArr; ShowMessageError:Boolean=false ):integer;
var i,j:Integer;
    SQL:WideString;
    CuurSQL:WideString;
    CompanyID:Integer;
    Separ:string[1];
    RefreshDataDstTo : TDataValueArr;
begin
 //if (ShowMessageError)and( not ConfirmDlgYN('Ви дійсно хочете прийняти дані з бух.програми 1С ?') )then exit;
 if (ShowMessageError)and( MyShowMessageDlg('Синхронізація пройшла успішно.', mtConfirmation, but_YES_NO ) <> res_YES )then exit;

 SQL:='';
 Separ:=',';
 
 for i:=0 to Length(valueDataRight)-1 do
 begin
  if CompareText( valueDataRight[0][i].FieldName , 'Legal') = 0 then
  begin
    if (valueDataRight[0][i].Value = true) then CuurSQL:='ISENTERPR=''T'',ISBSMAN=''F'' '
    else CuurSQL:='ISENTERPR=''F'',ISBSMAN=''T'' ';
  end
  else
  if (CompareText(valueDataRight[0][i].FieldName , 'INN') =0 ) then
  begin
    if (valueDataRight[0][i].Value<>null) and (valueDataRight[0][i].Value<>0) then
      CuurSQL:='TaxPayCode='''+String(valueDataRight[0][i].Value)+'''';
  end
  else
  if (CompareText( valueDataRight[0][i].FieldName , 'EDRPOU') = 0 )  then
  begin
    if ( valueDataRight[0][i].Value<>null)and(valueDataRight[0][i].Value<>0 ) then
      CuurSQL:='IDENTCODE='''+String(valueDataRight[0][i].Value)+'''';
  end
  else
  if CompareText( valueDataRight[0][i].FieldName , 'Resident') = 0 then
  begin
    if valueDataRight[0][i].Value=true then CuurSQL:='ASRESIDENT=''T'' '
    else CuurSQL:='ASRESIDENT=''F'' ';
  end
  else
  if CompareText( valueDataRight[0][i].FieldName , 'NAME') = 0 then
    CuurSQL:='NAME='''+String(valueDataRight[0][i].Value)+''''
  else
  if CompareText(valueDataRight[0][i].FieldName , 'FULLNAME') = 0 then
    CuurSQL:='FULLNAME='''+String(valueDataRight[0][i].Value)+''''
  else
  if CompareText( valueDataRight[0][i].FieldName , 'Comment') = 0  then
    CuurSQL:='MEMO='''+String(valueDataRight[0][i].Value)+''''
  else
  if CompareText( valueDataRight[0][i].FieldName , 'HeadContragentID') = 0 then
    CuurSQL:='HEADOFFICEID='+String(valueDataRight[0][i].Value)
  else
  if CompareText( valueDataRight[0][i].FieldName , 'UsedInAccounting') = 0 then
    CuurSQL:=''
  else
  if CompareText(valueDataRight[0][i].FieldName , 'COMPANYID') = 0 then
  begin
    if valueDataRight[0][i].Value<>0 then
      CompanyID:= valueDataRight[0][i].Value
    else CompanyID :=valueDataLeft[0][i].Value;
  end;
  
  if CuurSQL<>'' then Separ:=','
  else Separ:='';

  SQL := SQL +CuurSQL+ Separ;
  CuurSQL:='';
 end;

 if SQL[Length(SQL)]=',' then
   Delete( SQL ,Length(SQL),1);

 SQL:='UPDATE COMPANIES SET '+ SQL +' WHERE COMPANYID='+IntToStr( CompanyID );

 if self.FConDBParam.IBDatabaseConnection <> nil then
   result :=UnitIBQuery.UpdateSql( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password, SQL  );

 if self.FConDBParam.ADOConnection <> nil then
   result :=UnitADOQuery.UpdateSql( self.FConDBParam.ADOConnection, SQL  );
 //*****************************Representation New Data********************
 if FCompareData <> nil then
  begin
    RefreshDataDstTo.param.data := self.GetDataDBForClientById(  CompanyID );
    FCompareData.RefreshLeftData( RefreshDataDstTo );
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateLogMerge( IdOperation,TypeOperation, MenId, IsMerge, Reason:Integer):integer;
var SQLUpdate:String;
begin
  SQLUpdate:= 'EXECUTE PROCEDURE SET_UPDATE_MERGE_LOG_1C('+IntToStr(IdOperation)+','+IntToStr(TypeOperation)+','+
    IntToStr(MenId)+','+ ''''+ConvertDateTime(Now)+'''' +','+ IntToStr(IsMerge)+','+IntToStr(Reason)+ ' )';

  if self.FConDBParam.IBDatabaseConnection <> nil then
    result := UnitIBQuery.UpdateSql( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password, SQLUpdate );

  if self.FConDBParam.ADOConnection <> nil then
    result := UnitADOQuery.UpdateSql( self.FConDBParam.ADOConnection, SQLUpdate );
end;
//******************************************************************************
function TFunctCallSoap1C.FLink1CdataToDBData( CompanyID:Integer;NewCode1C:String ):integer;
var SQLUpdate:WideString;
begin
  if NewCode1C='' then NewCode1C:='null'
  else NewCode1C := #39+NewCode1C+#39;

  SQLUpdate := 'UPDATE COMPANIES SET CodeId1C='+NewCode1C+' WHERE COMPANYID='+IntToStr( CompanyID );

  if self.FConDBParam.IBDatabaseConnection <> nil then
     result := UnitIBQuery.UpdateSql( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password, SQLUpdate );

  if self.FConDBParam.ADOConnection <> nil then
    result := UnitADOQuery.UpdateSql( self.FConDBParam.ADOConnection, SQLUpdate );
end;
//******************************************************************************
function TFunctCallSoap1C.FLink1CdataInvoiceToDBData( OrderID:Integer; BillingNo, NewCode1C:String ):integer;
var SQLUpdate:WideString;
begin
  if NewCode1C='' then NewCode1C:='null'
  else NewCode1C:=''''+NewCode1C+'''';

  SQLUpdate := 'UPDATE BILLINGS SET CodeId1C= '+NewCode1C+' WHERE ORDERID='+IntToStr( OrderID )+' and BILLINGNO = '''+BillingNo+'''';
  if self.FConDBParam.IBDatabaseConnection <> nil then
    result := UnitIBQuery.UpdateSql( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password, SQLUpdate );

  if self.FConDBParam.ADOConnection <> nil then
    result := UnitADOQuery.UpdateSql( self.FConDBParam.ADOConnection, SQLUpdate );
end;
//******************************************************************************
Function CheckCountNotDeletedFromDavaValueArr(valueDataArr:TDataCliArr;var FirstIndexNotDeleted:Integer):Integer;
var i,j:Integer;
begin
  result:=0;
  FirstIndexNotDeleted:=-1;
  for i:=0 to Length(valueDataArr)-1 do
  begin
    if (not valueDataArr[i].MarkedToDelete) then
    begin
     Inc(result);
     if FirstIndexNotDeleted =-1 then FirstIndexNotDeleted:=i;
    end;
  end;
end;
//******************************************************************************
Function TFunctCallSoap1C.FCheckCountNotDeletedFromDavaValueArr(valueDataArr:TDataCliArr;var FirstIndexNotDeleted:Integer):Integer;
begin
  Result := CheckCountNotDeletedFromDavaValueArr( valueDataArr, FirstIndexNotDeleted );
end;
//******************************************************************************
Function TFunctCallSoap1C.FLinkSoapDataToDBAndRefreshRepresentationData( DatCli,DatCliSoap : TDataCliArr;
                                                                         LinkWithNewCodeIC:Widestring; ShowMessageError,SearchInDeleted:Boolean; CaptionSelectLeft,CaptionSelectRight:Widestring ):Integer;
var RefreshDataDstTo : TDataValueArr;
    RefreshDataDstFrom : TDataValueArr;
begin
  if FLink1CdataToDBData( DatCli[0].ContragentID, LinkWithNewCodeIC )<>0 then
  begin
    if (ShowMessageError) then MyShowMessageDlg('Помилка з''єднання даних бух.програми з туристичною програмою.', mtError, but_OK);
    Exit;
  end;
  //*****************************Representation New Data********************

  if FCompareData <> nil then
  begin
    RefreshDataDstFrom.param.data :=self.GetDataDBForClientById( DatCli[0].ContragentID );
    RefreshDataDstFrom.param.CaptionSelect :=CaptionSelectLeft;
    RefreshDataDstFrom.param.SearchInDeleted := SearchInDeleted;
    RefreshDataDstFrom.param.ShowErrorMessage := ShowMessageError;

    RefreshDataDstTo.param.data := self.GetDataSoapForClient( DatCli[0].EDRPOU, DatCli[0].INN, DatCli[0].ContragentID, DatCli[0].ISPRIVATE,
                                                              DatCli[0].Code, DatCli[0].Name, DatCli[0].Search1CByName, SearchInDeleted, result, ShowMessageError );
    RefreshDataDstTo.param.CaptionSelect := CaptionSelectRight;
    RefreshDataDstTo.param.SearchInDeleted:=SearchInDeleted;
    RefreshDataDstTo.param.ShowErrorMessage := ShowMessageError;

    FRefreshDataLeftPart( RefreshDataDstFrom.param , RefreshDataDstTo.param, SearchInDeleted, ShowMessageError);
    //FCompareData.RefreshBothData( RefreshDataDstFrom, RefreshDataDstTo );
  end;
end;
//******************************************************************************
Function TFunctCallSoap1C.FUpdateSoapDataClient( valueDataLeft,valueDataRight:TDataValueParamArr;SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;
var DatCli : TDataCliArr;
    DatCliSoap : TDataCliArr;
    PDat: PDatCli;
    CountClientNotDeleted1C:Integer;
    FirstIndexNotDeleted:Integer;
    CodeId1CFromDB:Widestring;
    CodeId1C:Widestring;
    RefreshDataDstTo : TDataValueArr;
    RefreshDataDstFrom : TDataValueArr;
    resCode:Integer;
    LinkBaseId :Widestring;
    FindSelectedIndex:Integer;
    IndexSoapSynchronize:Integer;
begin
  DatCli := ConvertArrValueToDatCli( valueDataLeft.data );
  DatCliSoap := ConvertArrValueToDatCli( valueDataRight.data );
  CountClientNotDeleted1C := FCheckCountNotDeletedFromDavaValueArr( DatCliSoap, FirstIndexNotDeleted );

  FindSelectedIndex := self.FCompareData.FindSelectedDataByFocusRowAndFieldNameRight( 'Code' );
  IndexSoapSynchronize := 0;

  if (Length(DatCliSoap)> 1)  then
  //if CountClientNotDeleted1C > 1 then
  begin
    if FindSelectedIndex=-1 then
    begin
      MyShowMessageDlg('Синхронізанія не є можливою,так як в бух. програмі знайдено більше одного ('+IntToStr(Length(DatCliSoap))+') активного контрагента!',mtError,but_OK);
      Exit;
    end
    else
      IndexSoapSynchronize := FindSelectedIndex;
  end;
  //**********************************
  if ( Length(DatCliSoap)=1 )and( CountClientNotDeleted1C = 0 ) then
  begin
    MyShowMessageDlg('Синхронізанія не є можливою,так як в бух. програмі контрагента позначено на видалення!', mtError, but_OK);
    Exit;
  end;
  //**********************************
  if CountClientNotDeleted1C = 0 then
  //if FirstIndexNotDeleted=-1 then
  begin
    MyShowMessageDlg( 'Незнайдено жодного активного контрагента в бух. програмі з такими даними', mtError, but_OK);
    Exit;
  end;
  //**********************************
  if ( Length(DatCliSoap)=1 )and(( DatCliSoap[0].Code <> DatCli[0].Code ) and ( DatCli[0].Code<>'' )) and ( AskForFonfirmAction ) and (FindSelectedIndex=-1) then
  begin
    if MyShowMessageDlg('В туристичній програмі код ID з бух.програми ('+DatCli[0].Code+') відрізняється від ID існуючого контрагента в 1С.('+DatCliSoap[0].Code+')'+#13#10+
                        'Ви дійсно хочете синхронізувати дані з новим контрагентом ?', mtConfirmation, but_YES_NO ) <> res_YES then exit;
  end
  else
  if ( Length(DatCliSoap)=1 )and( ( DatCliSoap[0].INN <> DatCli[0].INN ) and ( DatCli[0].INN<>'' ) ) and ( AskForFonfirmAction ) and (FindSelectedIndex=-1)  then
  begin
    if MyShowMessageDlg('В туристичній програмі код ІПН з бух.програми ('+DatCli[0].INN+') відрізняється від ІПН існуючого контрагента в 1С.('+DatCliSoap[0].INN+')'+#13#10+
                        'Ви дійсно хочете синхронізувати дані з новим контрагентом ?', mtConfirmation, but_YES_NO ) <> res_YES then exit;
  end
  else
  if ( Length(DatCliSoap)=1 )and( ( DatCliSoap[0].ContragentID <> 0 ) and ( DatCliSoap[0].ContragentID <> DatCli[0].ContragentID )) and ( AskForFonfirmAction ) and (FindSelectedIndex=-1)  then
  begin

    if MyShowMessageDlg('В бухгалтерскій програмі код ID тур. програми ('+IntToStr(DatCliSoap[0].ContragentID)+') відрізняється від ID партнера в тур. програмі ('+IntToStr(DatCli[0].ContragentID)+')'+#13#10+
                        'Ви дійсно хочете синхронізувати дані з цим партнером ?', mtConfirmation, but_YES_NO ) <> res_YES then exit;

  end
  else
  if (AskForFonfirmAction) and (MyShowMessageDlg( 'Ви дійсно хочете синхронізувати дані тур.програми та бух.програмою 1С ?',mtConfirmation, but_YES_NO ) <> res_YES) then Exit;

  //**********************************
  DatCli[0].Code := DatCliSoap[IndexSoapSynchronize].Code;
  New(PDat);
  try
    PDat^ := DatCli[0];
    result:= FUpdateClientSoap( PDat, ShowMessageError );
    if result <> 0  then exit;
    LinkBaseId:= PDat^.Code;
  finally
    Dispose(PDat);
  end;

  result := FLinkSoapDataToDBAndRefreshRepresentationData( DatCli,DatCliSoap, LinkBaseId, ShowMessageError,SearchInDeleted, valueDataLeft.CaptionSelect, valueDataRight.CaptionSelect );
end;
//******************************************************************************
Function TFunctCallSoap1C.FNewSoapDataClient( valueDataLeft, valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;
var DatCli : TDataCliArr;
    DatCliSoap : TDataCliArr;
    PDat: PDatCli;
    LinkBaseId:Widestring;
begin
  DatCli := ConvertArrValueToDatCli( valueDataLeft.data );
  DatCliSoap := ConvertArrValueToDatCli( valueDataRight.data );

  if (AskForFonfirmAction) and (MyShowMessageDlg( 'Ви дійсно хочете створити нового контрагента в бух.програмі 1С ?',mtConfirmation, but_YES_NO ) <> res_YES) then Exit;

  New(PDat);
  
  try
    PDat^ := DatCli[0];
    result:= FCreateClientSoap( PDat, ShowMessageError );
    if result <> 0  then exit;
    LinkBaseId:= PDat^.code;
  finally
    Dispose(PDat);
  end;
  
  result := FLinkSoapDataToDBAndRefreshRepresentationData( DatCli, DatCliSoap, LinkBaseId, ShowMessageError,
                                                           SearchInDeleted, valueDataLeft.CaptionSelect, valueDataRight.CaptionSelect  );
end;
//******************************************************************************
Function TFunctCallSoap1C.FUpdateDataClientAccountsDB(MenId:Integer; DatCli : TDatCliAccountsArr ):Integer;
var i:Integer;
    SQL:WideString;
    ResCount:Integer;
    CurrRes:Integer;
begin
  ResCount:=0;
  for i:=0 to Length(DatCli)-1 do
  begin

   SQL:='EXECUTE PROCEDURE SET_UPDATE_CLIENT_ACCOUNT('+MyIfThen(DatCli[i].AccountID<>0, IntToStr( DatCli[i].AccountID),'null')+','+IntToStr( DatCli[i].ContragentID )+','+
              ''''+DatCli[i].AccountNO+''''+','+ ''''+DatCli[i].BankName+''''+','+''''+DatCli[i].BankMFO+''''+','+''''+DatCli[i].BankAddres+''''+','+IntToStr(MenId)+')';

   if self.FConDBParam.IBDatabaseConnection <> nil then
    CurrRes := UnitIBQuery.UpdateSql( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password, SQL );

   if self.FConDBParam.ADOConnection <> nil then
    CurrRes := UnitADOQuery.UpdateSql( self.FConDBParam.ADOConnection, SQL );

   if CurrRes <> - 1 then Inc(ResCount);
  end;

  Result := MyIfThen( ResCount = Length(DatCli) , 0, -1 );
end;
//******************************************************************************
 Function TFunctCallSoap1C.FUpdateDataClientAccounts(valueDataLeft,valueDataRight:TDataValueParamArr;SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;
var i:integer;
    DatCli : TDatCliAccountsArr;
    DatCliSoap : TDatCliAccountsArr;
    RefreshDataDstTo : TDataValueArr;
    RefreshDataDstFrom : TDataValueArr;
    resCode:Integer;
    FindIndex:Integer;
    LeftFindMFO:TValueArr;
    RightFindMFO:TValueArr;
    NeedRefresh:Boolean;
begin
  try
    NeedRefresh:=true;
    FindIndex:=FCheckOnCompareAccountsAndMFO( valueDataLeft.data , valueDataRight.data );
    if FindIndex <>-1  then
    begin
      if FCompareData <> nil then
      begin
        LeftFindMFO:= FgetValueByFieldFromValueArrByndex(valueDataLeft.data, 'BANK_MFO', FindIndex);
        RightFindMFO:=FgetValueByFieldFromValueArrByndex(valueDataRight.data, 'BANK_MFO', FindIndex);
        FCompareData.SetLFocusRow('BANK_MFO',LeftFindMFO.Value );
        FCompareData.SetRFocusRow('BANK_MFO',RightFindMFO.Value );
      end;
      //ErrorDlg( 'Синхронізація не є можливою, так як знайдено одинакові рахунки з різними МФО.' );
      MyShowMessageDlg('Синхронізація не є можливою, так як знайдено одинакові рахунки з різними МФО.', mtError, but_OK);
      NeedRefresh:=false;
      exit;
    end;

    DatCliSoap := ConvertArrValueToDatCliAccounts( valueDataRight.data );
    for i:=0 to Length(DatCliSoap)-1 do
      DatCliSoap[i].ContragentID:= Self.FCurrClientId;

    //if (AskForFonfirmAction) and (not ConfirmDlgYN( 'Ви дійсно хочете синхронізувати дані тур.програми та бух.програмою 1С ?' )) then Exit;
    if (AskForFonfirmAction) and (MyShowMessageDlg( 'Ви дійсно хочете синхронізувати дані тур.програми та бух.програмою 1С ?' ,mtConfirmation, but_YES_NO ) <> res_YES) then Exit;

    //*******************Update Bank Accounts**to DB**************

    valueDataLeft.data := GetDataClientAccountDBForClientById( self.FCurrClientId );
    DatCli:= ConvertArrValueToDatCliAccounts( valueDataLeft.data );

    if FUpdateClientAccountsSoap( DatCli , false) <> 0 then
    begin
     //if (ShowMessageError) then ErrorDlg( 'Помилка синхронізації даних в бух. програму 1С' );
     if (ShowMessageError) then  MyShowMessageDlg('Помилка синхронізації даних в бух. програму 1С' , mtError, but_OK);
     Exit;
    end;
    
  finally
    //*****************************Representation New Data********************
    if (NeedRefresh)and(FCompareData <> nil) then
      FRefreshDataClientAccountsLeftPart( valueDataLeft ,valueDataRight , SearchInDeleted, ShowMessageError);
  end;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FRefreshDataLeftPart(valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean);
var RefreshDataDstFrom : TDataValueArr;
    DatCli : TDataCliArr;
begin
  if valueDataLeft.data<>nil then
  begin
    DatCli:= ConvertArrValueToDatCli( valueDataLeft.data );
    RefreshDataDstFrom.param.data := self.GetDataDBForClientById( Self.FCurrClientId );
    RefreshDataDstFrom.param.SearchInDeleted := SearchInDeleted;
    RefreshDataDstFrom.param.CaptionSelect := valueDataLeft.CaptionSelect;

    if FCompareData<>nil then
      FCompareData.RefreshLeftData( RefreshDataDstFrom );
  end;

  FRefreshDataRightPart( valueDataLeft, valueDataRight, SearchInDeleted, ShowMessageError );
end;
//******************************************************************************
procedure TFunctCallSoap1C.FRefreshDataRightPart( valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean );
var RefreshDataDstFrom : TDataValueArr;
    RefreshDataDstTo : TDataValueArr;

    DatCliSoap : TDataCliArr;
    EDRPO:EDRPOU;
    INNN:INN;
    Search1CByName:WideString;
    Name:WideString;
    resCode:Integer;
    Code1CStr:WideString;
    ISPRIVATE:Boolean;
begin
  if valueDataRight.data<>nil then
  begin
   RefreshDataDstFrom.param.data :=self.GetDataDBForClientById( Self.FCurrClientId );

   EDRPO := FgetValueByFieldFromValueArr( RefreshDataDstFrom, 'EDRPOU' );
   INNN  := FgetValueByFieldFromValueArr( RefreshDataDstFrom, 'INNSearch' );
   Name  := FgetValueByFieldFromValueArr( RefreshDataDstFrom, 'NAME' );
   Search1CByName:=FgetValueByFieldFromValueArr( RefreshDataDstFrom, 'Search1CByName' );
   Code1CStr:=FgetValueByFieldFromValueArr( RefreshDataDstFrom, 'Code' );
   ISPRIVATE:=FgetValueByFieldFromValueArr( RefreshDataDstFrom, 'ISPRIVATE' );

   RefreshDataDstTo.param.data := self.GetDataSoapForClient( EDRPO , INNN , Self.FCurrClientId ,ISPRIVATE, Code1CStr, Name, Search1CByName, SearchInDeleted, resCode, ShowMessageError );
   RefreshDataDstTo.param.CaptionSelect := valueDataRight.CaptionSelect;
   RefreshDataDstTo.param.ShowErrorMessage := valueDataRight.ShowErrorMessage;
   RefreshDataDstTo.param.SearchInDeleted := valueDataRight.SearchInDeleted;

   if FCompareData<>nil then
     FCompareData.RefreshRightData( RefreshDataDstTo );
  end;
end;
//******************************************************************************
procedure TFunctCallSoap1C.PrepareFuncUpdateForDataClient(  var datClDB:TDataValueArr; var datClSoap:TDataValueArr;CompareData:TCompareDataGrid;SearchInDeleted:boolean; ShowMessageError:Boolean = false );
begin
  FCompareData := CompareData;

  datClDB.AcceptAct   := self.FUpdateSoapDataClient;
  datClSoap.AcceptAct := nil;

  datClDB.RefreshAct  := FRefreshDataLeftPart;
  datClSoap.RefreshAct:= nil; //FRefreshDataRightPart;

  datClDB.NewAct      := FNewSoapDataClient;
  datClSoap.NewAct    := nil;

  datClDB.param.SearchInDeleted := SearchInDeleted;
  datClSoap.param.SearchInDeleted := SearchInDeleted;
  datClDB.param.ShowErrorMessage := ShowMessageError;
  datClSoap.param.ShowErrorMessage := ShowMessageError;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FRefreshDataClientAccountsLeftPart(valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean);
var RefreshDataDstFrom : TDataValueArr;
    RefreshDataDstTo : TDataValueArr;
    DatCliAccounts : TDatCliAccountsArr;
    DatCliAccountsSoap:TDatCliAccountsArr;
    Res:Integer;
begin
  if valueDataLeft.data<>nil then
  begin
    DatCliAccounts:= ConvertArrValueToDatCliAccounts( valueDataLeft.data );
    RefreshDataDstFrom.param.data :=self.GetDataClientAccountDBForClientById( Self.FCurrClientId );
    RefreshDataDstFrom.param.SearchInDeleted:=SearchInDeleted;

    Res := FGetClientAccounts( DatCliAccounts[0].EDRPOU, DatCliAccounts[0].ContragentID, SearchInDeleted, DatCliAccountsSoap, ShowMessageError);

    RefreshDataDstTo.param.data := ConvertCliAccountsToValueArr( DatCliAccountsSoap );
    RefreshDataDstTo.param.SearchInDeleted:=SearchInDeleted;
    FAdaptingDataValueForCompareLeftRightPart( RefreshDataDstFrom, RefreshDataDstTo );

    FCompareData.RefreshBothData( RefreshDataDstFrom, RefreshDataDstTo )
  end;
end;
//******************************************************************************
procedure TFunctCallSoap1C.PrepareFuncUpdateForDataClientAccounts(  var datClDB:TDataValueArr; var datClSoap:TDataValueArr;CompareData:TCompareDataGrid;SearchInDeleted:boolean; ShowMessageError:Boolean = false );
begin
  FCompareData := CompareData;

  datClDB.AcceptAct := self.FUpdateDataClientAccounts;
  datClSoap.AcceptAct := nil;

  datClDB.RefreshAct:= FRefreshDataClientAccountsLeftPart;
  datClSoap.RefreshAct:=nil;//FRefreshDataRightPart;

  datClDB.NewAct      := FNewSoapDataClient;
  datClSoap.NewAct    := nil;
end;
//******************************************************************************
function ConvertArrValueToDatCli( valueData:PDataValueArr  ):TDataCliArr;
var i,j:integer;
begin
  SetLength(Result , 0);
  SetLength(Result , Length(valueData));
  for i:=0 to Length(valueData)-1 do
  begin
    for j:=0 to Length(valueData[i])-1 do
    begin
      if CompareText('COMPANYID' , valueData[i][j].FieldName )=0 then result[i].ContragentID:=valueData[i][j].Value;
      if CompareText('NAME' , valueData[i][j].FieldName )=0 then result[i].NAME:=valueData[i][j].Value;
      if CompareText('FULLNAME' , valueData[i][j].FieldName )=0 then result[i].FULLNAME:=valueData[i][j].Value;
      if CompareText('Comment' , valueData[i][j].FieldName )=0 then result[i].Comment:=valueData[i][j].Value;
      if CompareText('HeadContragentID' , valueData[i][j].FieldName )=0 then result[i].HeadContragentID:=valueData[i][j].Value;
      if CompareText('Legal' , valueData[i][j].FieldName )=0 then result[i].Legal:=valueData[i][j].Value;
      if CompareText('INN' , valueData[i][j].FieldName )=0 then result[i].INN:=valueData[i][j].Value;
      if CompareText('EDRPOU' , valueData[i][j].FieldName )=0 then result[i].EDRPOU:=valueData[i][j].Value;
      if CompareText('FILIYACODE' , valueData[i][j].FieldName )=0 then result[i].BranchNo:=valueData[i][j].Value;
      if CompareText('Resident' , valueData[i][j].FieldName )=0 then result[i].Resident:=valueData[i][j].Value;
      if CompareText('UsedInAccounting' , valueData[i][j].FieldName )=0 then result[i].UsedInAccounting:=valueData[i][j].Value;
      if CompareText('Code' , valueData[i][j].FieldName )=0 then result[i].Code:=valueData[i][j].Value;
      if CompareText('MarkedToDelete' , valueData[i][j].FieldName )=0 then result[i].MarkedToDelete:=valueData[i][j].Value;
      if CompareText('Search1CByName' , valueData[i][j].FieldName )=0 then result[i].Search1CByName:=valueData[i][j].Value;
      if CompareText('ISPRIVATE' , valueData[i][j].FieldName )=0 then result[i].ISPRIVATE:=valueData[i][j].Value;
      if CompareText('INNSearch' , valueData[i][j].FieldName )=0 then result[i].INNSearch:=valueData[i][j].Value;

      //******************************
      if CompareText('Representation' , valueData[i][j].FieldName )=0 then result[i].Address.Representation:=valueData[i][j].Value;
      {if CompareText('ZIP' , valueData[i][j].FieldName )=0 then result[i].Address.ZIP:=valueData[i][j].Value;
      if CompareText('State' , valueData[i][j].FieldName )=0 then result[i].Address.State:=valueData[i][j].Value;
      if CompareText('Region' , valueData[i][j].FieldName )=0 then result[i].Address.Region:=valueData[i][j].Value;
      if CompareText('District' , valueData[i][j].FieldName )=0 then result[i].Address.District:=valueData[i][j].Value;
      if CompareText('City' , valueData[i][j].FieldName )=0 then result[i].Address.City:=valueData[i][j].Value;
      if CompareText('Settlement' , valueData[i][j].FieldName )=0 then result[i].Address.Settlement:=valueData[i][j].Value;
      if CompareText('Street' , valueData[i][j].FieldName )=0 then result[i].Address.Street:=valueData[i][j].Value;
      if CompareText('House' , valueData[i][j].FieldName )=0 then result[i].Address.House:=valueData[i][j].Value;
      if CompareText('Building' , valueData[i][j].FieldName )=0 then result[i].Address.Building:=valueData[i][j].Value;
      if CompareText('Appartment' , valueData[i][j].FieldName )=0 then result[i].Address.Appartment:=valueData[i][j].Value;}
      //******************************      
    end;
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUnlinkClient (const ContragentID: Integer; const ContragentCode: WideString):Integer;
var Res : OperationResult;
    HTTPRIO : THTTPRIO;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );
    SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );
    try
      FShowMouseCursorLoad;

      if (ContragentID<>-1)and(ContragentCode<>'') then
      begin
        Res:=nil;
        Res := (HTTPRIO as AlgolPortType).UnlinkClient( ContragentID, ContragentCode );
        Result := Res.Code;
        if ( Res.Code <> 205 ){ and ( ShowMessageError )} then
        begin
          case Res.Code of

           504:MyShowMessageDlg('Не знайдено контрагента прилінкованого до ID з турпрограми', mtError, but_OK); //ErrorDlg('Контрагент з таким ID вже є в базі 1С');
           503:MyShowMessageDlg('Не знайдено контрагента з таким кодом 1С', mtError, but_OK);//ErrorDlg('Контрагент з таким ЄДРПОУ вже є в базі 1С');
           599:MyShowMessageDlg( Res.Description, mtError, but_OK );
          end;
        end
        else
         if Res.Code= 205 then result := 0;
      end
       else Result := -1;
    finally

      if Res<>nil then Res.Free;
      HTTPRIO := nil;
      FShowMouseCursorDefault;
    end;
  end
   else result:=-2;
end;
//******************************************************************************
function CheckDataOnNull(aDValue:TRowVGridDataPram):Boolean;
begin
  result := False;
  if (aDValue.Value=null)or(aDValue.Value='0')or(aDValue.Value=0) then
    MyShowMessageDlg(aDValue.Caption+ ' є пустим', mtError, but_OK)
  else result := True;
end;
//**************************************************
procedure TFunctCallSoap1C.FCodeRowEdit1CPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var ContraGentCode:TRowVGridDataPram;
    ContragentId:TRowVGridDataPram;
begin
  ContragentId := FCompareData.GetFocusedRValue;
  ContraGentCode := FCompareData.FindValueFromFocusRRowToDown( 'Code' );

  if not CheckDataOnNull(ContraGentCode) then exit;
  if not CheckDataOnNull(ContragentId) then exit;

   if MyShowMessageDlg( CaptionAskUnlink, mtConfirmation, but_YES_NO ) <> Res_YES then exit;
  if FUnlinkClient( ContragentId.Value, ContraGentCode.Value )=0  then
    FCompareData.ButLRefesh;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FCodeRowEditDBPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var //ContraGentCode : TRowVGridDataPram;
    ContragentId : TRowVGridDataPram;
begin
   //ContraGentCode := FCompareData.GetFocusedLValue;
   ContragentId := FCompareData.FindValueFromLFocusRowToUp( 'COMPANYID' );

   if not CheckDataOnNull(ContragentId) then exit;
   if MyShowMessageDlg( CaptionAskUnlink, mtConfirmation, but_YES_NO ) <> Res_YES then exit;

   if FLink1CdataToDBData( ContragentId.Value, '' )= 0 then
     FCompareData.ButLRefesh;
end;
//******************************************************************************
function TFunctCallSoap1C.ConvertCliToValueArr( DatCli : TDataCliArr ):PDataValueArr;
var i:Integer;
    ShowButtonEvent1C:PEditButProp;
    ShowButtonEventDB:PEditButProp;
procedure PrepareButtonEvent(var CurrEdProp:PEditButProp;ButtonEvent:TcxEditButtonClickEvent );
begin
   New(CurrEdProp);
   CurrEdProp.ButtonEvent:=ButtonEvent;

   if frmMergeSoap = nil then
   begin
     CurrEdProp.ListImage := nil;
     {try
       Application.CreateForm( TfrmMergeSoap, frmMergeSoap);
       frmMergeSoap.Name :='MergeSoapReadImage';
     finally
       CurrEdProp.ListImage:= frmMergeSoap.ImageListOther;
       frmMergeSoap.Free;
     end; }
   end
    else CurrEdProp.ListImage:= frmMergeSoap.ImageListOther;

   CurrEdProp.ImageIndex:= 0;
   CurrEdProp.Hint := CaptionUnLink;
end;
//*****************************************************
begin
 SetLength(Result , 0);
 SetLength( Result , Length(DatCli));
 for i:=0 to Length(DatCli)-1 do
 begin
   if (DatCli[i].CanUnlink1C) then
     PrepareButtonEvent( ShowButtonEvent1C, FCodeRowEdit1CPropertiesButtonClick )
   else ShowButtonEvent1C := nil;

   if (DatCli[i].CanUnlinkDB) then
     PrepareButtonEvent( ShowButtonEventDB, FCodeRowEditDBPropertiesButtonClick )
   else ShowButtonEventDB := nil;

   FAddValueToConvertArr( Result ,i, 'COMPANYID','ID в Туристичній програмі', DatCli[i].ContragentID, ftInteger, '', True, True, ShowButtonEvent1C );
   FAddValueToConvertArr( Result, i, 'Code', 'ID в Бух. Програмі', DatCli[i].Code, ftString,'', True, True, ShowButtonEventDB );

   FAddValueToConvertArr( Result ,i, 'HeadContragentID', 'Код гол.контрагента', DatCli[i].HeadContragentID ,ftInteger , '', true);
   //if DatCli[i].ISFILIYA then
   FAddValueToConvertArr( Result, i, 'FILIYACODE', 'Номер Філії', DatCli[i].BranchNo, ftString );

   FAddValueToConvertArr( Result ,i, 'NAME','Ім''я', DatCli[i].Name,  ftString );
   FAddValueToConvertArr( Result ,i, 'FULLNAME','Повна назва', DatCli[i].FullName, ftString  );

   FAddValueToConvertArr( Result ,i, 'Comment','Коментар', DatCli[i].Comment, ftString, '', false);

   FAddValueToConvertArr( Result ,i, 'Legal', 'Юридична чи фізична особа', DatCli[i].Legal , ftBoolean , MyIfThen( DatCli[i].Legal, 'Юридична', 'Фізична') );

   if DatCli[i].Legal then
     FAddValueToConvertArr( Result,i,'EDRPOU', 'ЄДРПО', DatCli[i].EDRPOU, ftString)
   else
     FAddValueToConvertArr( Result,i,'EDRPOU', 'Ідентифікаційний код', DatCli[i].EDRPOU, ftString );

   FAddValueToConvertArr( Result ,i, 'INN', 'ІПН', DatCli[i].INN , ftString );

   FAddValueToConvertArr( Result,  i,'Resident', 'Резидент', DatCli[i].Resident, ftBoolean);
   FAddValueToConvertArr( Result,  i,'UsedInAccounting', 'Бух. обл.', DatCli[i].UsedInAccounting, ftBoolean );

   FAddValueToConvertArr( Result ,i, 'Representation','Адреса', DatCli[i].Address.Representation, ftString, '', True, true );
   {FAddValueToConvertArr( Result ,i, 'ZIP','Поштовий індекс', DatCli[i].Address.ZIP, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'State','Країна', DatCli[i].Address.State, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'Region','Область', DatCli[i].Address.Region, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'District','Район', DatCli[i].Address.District, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'City','Місто', DatCli[i].Address.City, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'Settlement','Населений пункт', DatCli[i].Address.Settlement, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'Street','Вулиця', DatCli[i].Address.Street, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'House','Будинок', DatCli[i].Address.House, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'Building','Корпус', DatCli[i].Address.Building, ftString, '', true);
   FAddValueToConvertArr( Result ,i, 'Appartment','Офіс/кімн/кв.', DatCli[i].Address.Appartment, ftString, '', true); }

   FAddValueToConvertArr( Result,  i,'MarkedToDelete', 'Видалений', DatCli[i].MarkedToDelete, ftBoolean );
   FAddValueToConvertArr( Result,  i,'Search1CByName', 'Search1CByName', DatCli[i].Search1CByName, ftString,'', false, false);
   FAddValueToConvertArr( Result,  i,'ISPRIVATE', 'ISPRIVATE', DatCli[i].ISPRIVATE, ftString,'', false, false);
   FAddValueToConvertArr( Result,  i,'INNSearch', 'INNSearch', DatCli[i].INNSearch, ftString,'', false, false);

 end;
end;
//******************************************************************************
function ConvertArrValueToDatCliAccounts( valueData:PDataValueArr  ):TDatCliAccountsArr;
var i,j:Integer;
begin
  SetLength(Result , 0);
  SetLength(Result , Length(valueData));
  for i:=0 to Length(valueData)-1 do
  begin
    for j:=0 to Length(valueData[i])-1 do
    begin
      if CompareText('COMPANYID' , valueData[i][j].FieldName )=0 then result[i].ContragentID:=valueData[i][j].Value;

      if CompareText('ACCOUNTID' , valueData[i][j].FieldName )=0 then result[i].AccountID:=valueData[i][j].Value;
      if CompareText('EDRPOU' , valueData[i][j].FieldName )=0 then result[i].EDRPOU:=valueData[i][j].Value;

      if CompareText('ACCOUNTNO' , valueData[i][j].FieldName )=0 then result[i].AccountNO:=valueData[i][j].Value;
      if CompareText('BANK_NAME' , valueData[i][j].FieldName )=0 then result[i].BankName:=valueData[i][j].Value;
      if CompareText('BANK_MFO' , valueData[i][j].FieldName )=0 then result[i].BankMFO:=valueData[i][j].Value;
      if CompareText('BANK_ADDRESS' , valueData[i][j].FieldName )=0 then result[i].BankAddres:=valueData[i][j].Value;
      if CompareText('BANK_ACTIVE' , valueData[i][j].FieldName )=0 then result[i].BankActive:=valueData[i][j].Value;

      if CompareText('MarkedToDelete' , valueData[i][j].FieldName )=0 then result[i].MarkedToDelete:=valueData[i][j].Value;

    end;
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.ConvertCliAccountsToValueArr( DatCli : TDatCliAccountsArr ):PDataValueArr;
var i:Integer;
begin
 SetLength( Result , 0 );
 SetLength( Result , Length(DatCli));
 for i:=0 to Length(DatCli)-1 do
 begin
   FAddValueToConvertArr( Result ,i,  'COMPANYID','ID Компанії в тур. програмі', DatCli[i].ContragentID, ftInteger, '', true,true);
   FAddValueToConvertArr( Result ,i,  'ACCOUNTID','ID рахунку в тур. програмі', DatCli[i].AccountID, ftInteger, '', true,true);
   FAddValueToConvertArr( Result ,i,  'EDRPOU','ЄДРПО', DatCli[i].EDRPOU, ftString, '', false,false);
   FAddValueToConvertArr( Result ,i,  'ACCOUNTNO','Рахунок', DatCli[i].AccountNO, ftString, '', true,true);
   FAddValueToConvertArr( Result ,i,  'BANK_MFO','МФО', DatCli[i].BankMFO, ftString, '', true,true);
   FAddValueToConvertArr( Result ,i,  'BANK_NAME','Банк', DatCli[i].BankName , ftString, '', true,false);
   FAddValueToConvertArr( Result ,i,  'BANK_ADDRESS','Адреса банку', DatCli[i].BankAddres , ftString, '', false,false);
   FAddValueToConvertArr( Result ,i,  'BANK_ACTIVE','Банк є активний', DatCli[i].BankActive , ftInteger, '', false,false);
   FAddValueToConvertArr( Result, i,  'MarkedToDelete', 'Видалений',   DatCli[i].MarkedToDelete, ftBoolean );
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.GetDataDBForClientById( id:Integer ):PDataValueArr;
var DatCliP : PDatCli;
    DatCli : TDataCliArr;
begin

  DatCliP := GetDataDBClientById( id ,  Self.FConDBParam );

  if DatCliP <> nil then
  begin
   try
     SetLength(DatCli,1);
     DatCli[0] := DatCliP^ ;
     Result := ConvertCliToValueArr( DatCli );

     FCanCreateNew := DatCliP^.ISPRIVATE ;
     FCanSelect := DatCliP^.ISPRIVATE;

   finally
     Dispose(DatCliP);
   end; 
  end
   else
     SetLength(Result,0);
end;
//******************************************************************************
function TFunctCallSoap1C.GetDataDBForClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer ):PDataValueArr;
var DatCliP : PDatCli;
    DatCli : TDataCliArr;
begin

  DatCliP := GetDataDBClient( EDRPOU ,INN,ClientID, self.FConDBParam );
  if DatCliP<> nil then
  begin
    SetLength(DatCli,1);
    DatCli[0] := DatCliP^;
    Result := ConvertCliToValueArr( DatCli );
  end
   else
     SetLength(Result,0);
end;
//******************************************************************************
function TFunctCallSoap1C.GetDataClientAccountDBForClientById( ClientID:Integer ):PDataValueArr;
var DatCliAccountArrP : PDatCliAccountsArr;
    DatCliAccount  : TDatCliAccountsArr;
begin
 DatCliAccountArrP :=GetDataDBClientAccountBySql( self.FConDBParam, GetSQLClientBankAccounts(ClientID) );
 if DatCliAccountArrP <> nil then
 begin
   result := ConvertCliAccountsToValueArr( DatCliAccountArrP^ );
   Dispose(DatCliAccountArrP);
 end
  else SetLength(Result,0);
end;
//******************************************************************************
function TFunctCallSoap1C.GetDataSoapForClient( EDRPOU: EDRPOU; INN: INN; ClientID: Integer;isPrivate:Boolean; Code1C,Name,Search1CByName:WideString;
                                                 SearchInDeleted: Boolean;var resCode:Integer; ShowMessageError:Boolean =False;CaptionSelect:Widestring='' ):PDataValueArr;
var DatCli : TDataCliArr;
begin
  resCode := FGetClient( EDRPOU, INN, ClientID,isPrivate, Code1C,  Name, Search1CByName,  SearchInDeleted, DatCli, ShowMessageError );

  if resCode = 0  then
    Result := ConvertCliToValueArr( DatCli )
     else SetLength( Result, 0 );
end;
//******************************************************************************
function TFunctCallSoap1C.GetDataSoapForClientAccount( EDRPOU: EDRPOU; ClientID: Integer; SearchInDeleted: Boolean;var resCode:Integer; ShowMessageError:Boolean =False ):PDataValueArr;
var DatCli : TDatCliAccountsArr;
begin
  resCode := FGetClientAccounts( EDRPOU, ClientID, SearchInDeleted, DatCli, ShowMessageError );

  if resCode = 0  then
    Result := ConvertCliAccountsToValueArr( DatCli )
     else SetLength( Result, 0 );
end;
//******************************************************************************
function TFunctCallSoap1C.GetElementAddres(PData:PDatCli):Address;
begin
  result:=Address.Create;
  result.Representation :=PData.Address.Representation;
  {result.ZIP :=PData.Address.ZIP;
  result.State :=PData.Address.State;
  result.Region :=PData.Address.Region;
  result.District :=PData.Address.District;
  result.City :=PData.Address.City;
  result.Settlement :=PData.Address.Settlement;
  result.Street :=PData.Address.Street;
  result.House :=PData.Address.House;
  result.Building :=PData.Address.Building;
  result.Appartment :=PData.Address.Appartment;}
end;
//******************************************************************************
function TFunctCallSoap1C.GetElementContragent(PData:PDatCli):ContragentDTO;
begin
  result := ContragentDTO.Create;
  result.Address:= GetElementAddres(PData);
  result.ContragentID :=PData^.ContragentID;
  result.Name := PData^.Name;
  Result.FullName := PData^.FullName;
  Result.Comment :='';
  Result.HeadContragentID := PData^.HeadContragentID;
  Result.Legal := PData^.Legal;
  Result.INN := PData^.INN;
  Result.EDRPOU := PData^.EDRPOU;
  Result.VatLicence := '0';
  Result.Resident := PData^.Resident;
  Result.UsedInAccounting := PData^.UsedInAccounting;
  Result.BranchNo := PData^.BranchNo;
  Result.Code := PData^.Code;
end;
//******************************************************************************
function TFunctCallSoap1C.GetElementContract( PData:PDatCon ) : ContractDTO;
begin
  result := ContractDTO.Create;
  result.ContractID := PData^.ContractID;
  result.ContragentID := PData^.ContragentID;
  result.Name := PData^.Name;
  Result.PrintName := PData^.PrintName;
  Result.Comment := PData^.Comment;
  Result.ContractType := PData^.ContractType;
  Result.ContractNumber := PData^.ContractNumber;
  Result.ContractStartDate := PData^.ContractStartDate;
  Result.ContractEndDate := PData^.ContractEndDate;
  Result.ContractPath := PData^.ContractPath;
end;
//******************************************************************************
function TFunctCallSoap1C.CheckSoapServer:Boolean;
var FidHTTP:TIdHTTP;
begin
  result:=true;
  if not FCheckConnectToServer then Exit;

  FidHTTP:=TIdHTTP.Create(nil);

  try
   FShowMouseCursorLoad;

   FidHTTP.Request.BasicAuthentication:=true;
   FidHTTP.Request.Username:=SoapUser;
   FidHTTP.Request.Password:=SoapPassword;
   FidHTTP.Request.ContentType:='application/soap+xml';
   FidHTTP.Request.ContentEncoding:='windows-1251';
   //FidHTTP.ConnectTimeout:=50000;
   FidHTTP.Connect(50000);

  try
    FidHTTP.Get( self.FParamConUrl.defWSDL );
    result:=true;
  except
    result:=false;
  end;
  
  finally
    FidHTTP.free;
    FShowMouseCursorDefault;
  end;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FShowMouseCursorLoad;
begin
 if FShowLoadCursor then
   Screen.Cursor := crHourGlass;
 Application.ProcessMessages;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FShowMouseCursorDefault;
begin
 Screen.Cursor := crDefault;
 Application.ProcessMessages;
end;
//******************************************************************************
function TFunctCallSoap1C.FCreateClientSoap( PData:PDatCli;ShowMessageError:Boolean = false ):Integer;
var Res : OperationResult;
    HTTPRIO : THTTPRIO;
    CurrElemContragent:ContragentDTO;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );

    try
      FShowMouseCursorLoad;
      SetParamHTTPRIO( HTTPRIO , self.FParamConUrl );

      if PData <> nil then
      begin
        CurrElemContragent := GetElementContragent(PData);

        Res:=nil;
        Res := (HTTPRIO as AlgolPortType).CreateClient( CurrElemContragent );
        Result := Res.Code;
        if ( Res.Code <> 201 ) and ( ShowMessageError ) then
        begin
          case Res.Code of

           501:MyShowMessageDlg('Контрагент з таким ID вже є в базі 1С', mtError, but_OK); //ErrorDlg('Контрагент з таким ID вже є в базі 1С');
           502:MyShowMessageDlg('Контрагент з таким ЄДРПОУ вже є в базі 1С', mtError, but_OK);//ErrorDlg('Контрагент з таким ЄДРПОУ вже є в базі 1С');
           599:MyShowMessageDlg('Помилка при створенні контрагента'+ #13+ Res.Description, mtError, but_OK);//ErrorDlg('Помилка при створенні контрагента'+ #13+ Res.Description);
          end;
        end
        else
         if Res.Code= 201 then result := 0;
         if result=0 then PData^.code:= Res.BaseID;
      end
       else Result := -1;
    finally
      if CurrElemContragent <> nil then
        CurrElemContragent.Free;

      if Res<>nil then Res.Free;
      HTTPRIO := nil;
      FShowMouseCursorDefault;
    end;
  end
   else result:=-2;
end;
//******************************************************************************
function TFunctCallSoap1C.FCreateClient( id:Integer; ShowMessageError:Boolean = false ):Integer;
var PData : PDatCli;
begin
   try
    PData := GetDataDBClientById( id,  self.FConDBParam );
    result := FCreateClientSoap( PData, ShowMessageError);
   finally
    if PData<>nil then
      Dispose(PData);
   end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateClientSoap( PData:PDatCli; ShowMessageError:Boolean =false ):Integer;
var Res : OperationResult;
    HTTPRIO : THTTPRIO;
    CurrElemContragent:ContragentDTO;
begin
  if CheckSoapServer then
  begin
    HTTPRIO := THTTPRIO.Create( nil );

    try
     FShowMouseCursorLoad;
     SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );

     if PData <> nil then
      begin
        CurrElemContragent := GetElementContragent(PData);

        Res:=nil;
        Res := (HTTPRIO as AlgolPortType).UpdateClient( CurrElemContragent );

       { Res := (HTTPRIO as AlgolPortType).UpdateClient( PData^.Code, PData^.ContragentID , PData^.Name, PData^.FullName, '',
                                                        PData^.HeadContragentID, IfThen( PData^.Legal, 1, 0) , PData^.INN ,
                                                        PData^.EDRPOU, '0' , IfThen( PData^.Resident,1,0) , IfThen( PData^.UsedInAccounting,1,0), CurrElemAddres, PData^.BranchNo );}

        {Res := (HTTPRIO as AlgolPortType).UpdateClient( '000000632', -1 , PData^.Name, PData^.FullName, '',
                                                        PData^.HeadContragentID, IfThen( PData^.Legal, 1, 0) , PData^.INN ,
                                                        PData^.EDRPOU, '0' , IfThen( PData^.Resident,1,0) , IfThen( PData^.UsedInAccounting,1,0),CurrElemAddres ); }


        Result := Res.Code;
        if ( not (Res.Code in [ 201, 202 ] ) ) and (ShowMessageError) then
        begin
          case Res.Code of

           //- Update Error
           599:MyShowMessageDlg('Помилка при редагуванні даних контрагента' + #13 + Res.Description, mtError, but_OK); //ErrorDlg('Помилка при редагуванні даних контрагента' + #13 + Res.Description);
           //- Create Error

           501:MyShowMessageDlg('Контрагент з таким ID вже є в базі 1С', mtError, but_OK); //ErrorDlg('Контрагент з таким ID вже є в базі 1С');
           502:MyShowMessageDlg('Контрагент з таким ЄДРПОУ вже є в базі 1С', mtError, but_OK);//ErrorDlg('Контрагент з таким ЄДРПОУ вже є в базі 1С');

          end;
        end
      else
      if Res.Code in [201,202] then result := 0;
      if result=0 then PData^.code:= Res.BaseID;
     end
      else Result := -1;

    finally
      if CurrElemContragent <> nil then
        CurrElemContragent.Free;
      
      if Res<>nil then Res.Free;
      HTTPRIO := nil;
      FShowMouseCursorDefault;
    end;
  end
   else result:=-2;   
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateClient( id:Integer; ifNotFoundCreate:Boolean = False; ShowMessageError:Boolean =false ):Integer;
var PData : PDatCli;
begin
 try
  PData := GetDataDBClientById( id, self.FConDBParam );
  result:= FUpdateClientSoap( PData, ShowMessageError );
 finally
  if PData<>nil then
    Dispose(PData);
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.FDeleteClient( id: Integer; ShowMessageError:Boolean =false ):Integer;
var Res : OperationResult;
    HTTPRIO : THTTPRIO;
begin
   if CheckSoapServer then
    begin

     HTTPRIO := THTTPRIO.Create( nil );
     try
      FShowMouseCursorLoad;

      SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );

      //HTTPRIO.HTTPWebNode.UserName := SoapUser;
      //HTTPRIO.HTTPWebNode.Password := SoapPassword;
      Res:=nil;
      Res := (HTTPRIO as AlgolPortType).DeleteClient( id );

      Result := Res.Code;

      if ( Res.Code <> 203 ) and ( ShowMessageError ) then
      begin
        case Res.Code of

         505:MyShowMessageDlg('Контрагент має активні договори. Потрібно попередньо їх видалити.', mtError, but_OK); //ErrorDlg('Контрагент має активні договори. Потрібно попередньо їх видалити.');
         599:MyShowMessageDlg('Помилка при видаленні контрагента'+ #13+ Res.Description, mtError, but_OK);//ErrorDlg('Помилка при видаленні контрагента'+ #13+ Res.Description);
        end;
      end
      else
      if Res.Code= 203 then result := 0;

     finally
      if Res<>nil then Res.Free;
      HTTPRIO := nil;

      self.FShowMouseCursorDefault;
     end;
    end
     else result:=-2; 
end;
//******************************************************************************
function TFunctCallSoap1C.FCreateContractSoap( PData:PDatCon;ShowMessageError:Boolean = false ):Integer;
var HTTPRIO : THTTPRIO;
    Res : OperationResult;
    CurrElemContract: ContractDTO;
begin
  if CheckSoapServer then
    begin
      HTTPRIO := THTTPRIO.Create(nil);
      try
        FShowMouseCursorLoad;
        SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );

        if PData <> nil then
          begin
            Res:=nil;
            CurrElemContract := GetElementContract( PData ) ;
            Res := (HTTPRIO as AlgolPortType).CreateContract( CurrElemContract );
            
            {Res := (HTTPRIO as AlgolPortType).CreateContract( PData^.ContractID, PData^.ContragentID,  PData^.Name,
                                                              PData^.PrintName , PData^.Comment, PData^.ContractType,
                                                              PData^.ContractNumber, PData^.ContractStartDate, PData^.ContractEndDate ,PData^.ContractPath  ); }
            Result := Res.Code;
            if (Res.Code <> 201) and (ShowMessageError) then
            begin
              case Res.Code of
               501:MyShowMessageDlg('Договір з таким ID вже є в базі 1С', mtError, but_OK); //ErrorDlg('Договір з таким ID вже є в базі 1С');
               503:MyShowMessageDlg('Контрагент, до якого прив''язується договір, не існує в базі 1С', mtError, but_OK);//ErrorDlg('Контрагент, до якого прив''язується договір, не існує в базі 1С');
               506:MyShowMessageDlg('Неправильний формат дати заключення договору', mtError, but_OK);//ErrorDlg('Неправильний формат дати заключення договору');
               599:MyShowMessageDlg('Помилка при створенні договору'+ #13+ Res.Description, mtError, but_OK);//ErrorDlg('Помилка при створенні договору'+ #13+ Res.Description);
              end;
            end
            else
             if Res.Code= 201 then result := 0;
          end
           else Result := -1;

      finally
       if CurrElemContract <> nil then
         CurrElemContract.Free;

       if Res<>nil then Res.Free;
       HTTPRIO := nil;

       self.FShowMouseCursorDefault;
      end;
    end
     else result:=-2;
end;
//******************************************************************************
function TFunctCallSoap1C.FCreateContractByClientId( id:Integer;  ShowMessageError:Boolean = false ): Integer;
var PData : PDatCon;
begin
   try
    PData := GetDataContractByClientId( id,  self.FConDBParam );

    if PData<> nil then
      result:= FCreateContractSoap( PData , ShowMessageError )
    else result := -3; // -3 Contract not Fount

   finally
    if PData<>nil then
      Dispose(PData);
   end;
end;
//******************************************************************************
function TFunctCallSoap1C.FCreateContractByContractId(idClient, id:Integer;  ShowMessageError:Boolean = false ): Integer;
var PData : PDatCon;
begin
   try
    PData := GetDataContractByContractId(idClient, id,  self.FConDBParam );

    if PData<> nil then
      result:= FCreateContractSoap( PData , ShowMessageError )
    else result := -3; // -3 Contract not Fount

   finally
    if PData<>nil then
      Dispose(PData);
   end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateContractSoap( PData:PDatCon; ShowMessageError:Boolean = false ):Integer;
var HTTPRIO : THTTPRIO;
    Res : OperationResult;
    CurrElemContract: ContractDTO;
begin
 if CheckSoapServer then
    begin
    
     HTTPRIO := THTTPRIO.Create(nil);
      try
        FShowMouseCursorLoad;
        SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );

        Res:=nil;
        if PData <> nil then
        begin
         CurrElemContract := GetElementContract( PData ) ;

         Res := (HTTPRIO as AlgolPortType).UpdateContract( CurrElemContract );

         {Res := (HTTPRIO as AlgolPortType).UpdateContract( PData^.ContractID, PData^.ContragentID, PData^.Name ,
                                                           PData^.PrintName , PData^.Comment, PData^.ContractType ,
                                                           PData^.ContractNumber , PData^.ContractStartDate ,PData^.ContractEndDate ,PData^.ContractPath );}
         Result := Res.Code;

         if ( not (Res.Code in [201,202,203]) ) and ( ShowMessageError ) then
         begin
           case Res.Code of

             503:MyShowMessageDlg('Контрагент, до якого прив''язується договір, не існує в базі 1С', mtError, but_OK);
             506:MyShowMessageDlg('Неправильний формат дати заключення договору при снхронізації з 1С', mtError, but_OK);
             599:MyShowMessageDlg('Помилка при синхронізації даних договору з 1С'+ #13 + Res.Description, mtError, but_OK);
           end;
         end
         else
          if Res.Code in [201,202,203] then result := 0;
        end
         else Result := -1;

      finally
         if CurrElemContract <> nil then
         CurrElemContract.Free;

         if Res<>nil then Res.Free;
         HTTPRIO := nil;

       self.FShowMouseCursorDefault;
      end;
      
    end
     else
      result:=-2;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateContractByClientId( id:Integer;  ShowMessageError:Boolean =false ): Integer;
var PData : PDatCon;
begin
   try

    PData := GetDataContractByClientId( id,  self.FConDBParam );

    if PData<> nil then
      result:= FUpdateContractSoap( PData , ShowMessageError )
    else result := -3; // -3 Contract not Fount

    if result = 504 then result := 2;

   finally
    if PData<>nil then Dispose(PData);
   end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateContractByContractId(idClient, id:Integer;  ShowMessageError:Boolean =false ): Integer;
var PData : PDatCon;
begin
   try
    PData := GetDataContractByContractId(idClient, id,  self.FConDBParam );
    if PData <> nil then
      result:= FUpdateContractSoap( PData, ShowMessageError )
    else Result := -3; // Contract not found

    if result = 504 then result := 2;
   finally
    if PData<>nil then Dispose(PData);
   end;
end;
//******************************************************************************
function TFunctCallSoap1C.FDeleteContract( const ContractID: Integer; ShowMessageError:Boolean = false  ): Integer;
var Res : OperationResult;
    HTTPRIO : THTTPRIO;
begin
  if CheckSoapServer then
    begin

     HTTPRIO := THTTPRIO.Create(nil);
     try
      FShowMouseCursorLoad;

      SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );

      //HTTPRIO.HTTPWebNode.UserName := SoapUser;
      //HTTPRIO.HTTPWebNode.Password := SoapPassword;
      Res:=nil;
      Res := (HTTPRIO as AlgolPortType).DeleteContract( ContractID );

      Result := Res.Code;

      if ( Res.Code <> 203 ) and ( ShowMessageError ) then
      begin
        case Res.Code of
         504:MyShowMessageDlg('Договір з таким ID не існує в базі 1С', mtError, but_OK); //ErrorDlg('Договір з таким ID не існує в базі 1С');
         599:MyShowMessageDlg('Помилка при видаленні договору' + #13 + Res.Description, mtError, but_OK);//ErrorDlg('Помилка при видаленні Договору' + #13 + Res.Description);
        end;
      end
      else
      if Res.Code= 203 then result := 0;

     finally
      if Res<>nil then Res.Free;
      HTTPRIO := nil;
      self.FShowMouseCursorDefault;
     end;

    end
     else result:=-2;
end;
//******************************************************************************
function TFunctCallSoap1C.FConvertDataBank1CSoap(aData:TDatCliAccounts):UnitSoap1C.Bank;
begin
  result := UnitSoap1C.Bank.Create;
  result.MFO := aData.BankMFO;
  result.Address :=aData.BankAddres;
  result.Name := aData.BankName;
end;
//******************************************************************************
function TFunctCallSoap1C.FConvertDataBankTourSoap(aData:TDatCliAccounts):TBankSoap;
begin
  result := TBankSoap.Create;
  result.MFO := aData.BankMFO;
  result.Address :=aData.BankAddres;
  result.Name := aData.BankName;
end;
//******************************************************************************
function TFunctCallSoap1C.FConvertAccountsToElem(DataArr:TDatCliAccountsArr): AccountArray;
var i:integer;
    CurrBank : UnitSoap1C.Bank;
    CurrACounts:Account;
    CurrElemDTO:AccountDTO;
begin
  result:= AccountArray.Create;
  CurrACounts:=result.Account;

  SetLength( CurrACounts , Length(DataArr) );

  for i:=0 to Length( DataArr )-1 do
  begin
   CurrACounts[i] := AccountDTO.Create ;

   CurrACounts[i].Code:='';
   CurrACounts[i].ContragentID := DataArr[i].ContragentID;
   CurrACounts[i].AccountID    := DataArr[i].AccountID;
   CurrACounts[i].AccountNumber:= DataArr[i].AccountNO;
   CurrACounts[i].Active       := True;

   CurrBank := FConvertDataBank1CSoap(DataArr[i]);
   CurrACounts[i].Bank := CurrBank;

  end;
  result.Account:= CurrACounts;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateClientAccountsSoap( DataArr:TDatCliAccountsArr; ShowMessageError:Boolean = false ):Integer;
var i:Integer;
    Res : OperationResult;
    HTTPRIO : THTTPRIO;
    ArrayAccounts:AccountArray;
begin
  if CheckSoapServer then
    begin
      HTTPRIO := THTTPRIO.Create(nil);
     try
      FShowMouseCursorLoad;

      SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );
      //HTTPRIO.HTTPWebNode.UserName := SoapUser;
      //HTTPRIO.HTTPWebNode.Password := SoapPassword;
      Res:=nil;

      ArrayAccounts := FConvertAccountsToElem(DataArr);

      Res:= (HTTPRIO as AlgolPortType).UpdateAccount( ArrayAccounts );
      result := Res.Code;
      //********************************
      if ( Res.Code <> 202 ) and ( ShowMessageError ) then
      begin
        case Res.Code of
          206: MyShowMessageDlg('Проблема з деякими банк. рахунками при синхронізації. ', mtError, but_OK);//ErrorDlg('Проблема з деякими рахунками при синхронізації. ');
        end;
      end
      else
      if Res.Code = 202 then result := 0;
      //********************************
     finally
      if Res <> nil then Res.Free;
      if ArrayAccounts <> nil then
      begin

        for i:=0 to Length(ArrayAccounts.Account)-1 do
        begin
          ArrayAccounts.Account[i].Bank.Free;
          ArrayAccounts.Account[i].Bank := nil ;

          ArrayAccounts.Account[i].free;
          ArrayAccounts.Account[i]:=nil;
        end;
        
        ArrayAccounts.Free;
      end;

      HTTPRIO := nil;
      self.FShowMouseCursorDefault;

     end;

    end
    else result:=-2;
end;
//******************************************************************************
function PrepareResultClient( Res: ContragentArray; ClientID:Integer ):TDataCliArr;
var i:Integer;
    ArrIndNotDel:Array Of Integer;
    Len:Integer;
//****************************************************    
procedure AddBlock(IndBlock:Integer);
var Len:Integer;
begin
 Len:=Length(result);
 SetLength(result , Len+1);
 result[Len].ContragentID := Res.ContragentDTOArray[IndBlock].ContragentID;
 result[Len].Name := Res.ContragentDTOArray[IndBlock].Name;
 result[Len].FullName := Res.ContragentDTOArray[IndBlock].FullName;
 result[Len].Comment  := Res.ContragentDTOArray[IndBlock].Comment;
 result[Len].HeadContragentID  := Res.ContragentDTOArray[IndBlock].HeadContragentID;
 result[Len].Legal  := Res.ContragentDTOArray[IndBlock].Legal;
 result[Len].INN    := MyIfThen( Res.ContragentDTOArray[IndBlock].INN<>'0', Res.ContragentDTOArray[IndBlock].INN , '');
 result[Len].EDRPOU  := Res.ContragentDTOArray[IndBlock].EDRPOU;
 result[Len].BranchNo    := Res.ContragentDTOArray[IndBlock].BranchNo;
 result[Len].Resident    := Res.ContragentDTOArray[IndBlock].Resident;
 result[Len].UsedInAccounting  := Res.ContragentDTOArray[IndBlock].UsedInAccounting;
 result[Len].Code :=Res.ContragentDTOArray[IndBlock].Code;
 result[Len].MarkedToDelete :=Res.ContragentDTOArray[IndBlock].MarkedToDelete;
 result[Len].CanUnlink1C := True;
 result[Len].CanUnlinkDB := False;
 // ************* Adres *************
 if Res.ContragentDTOArray[IndBlock].Address <> nil then
 begin
   result[Len].Address.Representation :=Res.ContragentDTOArray[IndBlock].Address.Representation;
   {result[Len].Address.ZIP :=Res.ContragentDTOArray[IndBlock].Address.ZIP;
   result[Len].Address.State :=Res.ContragentDTOArray[IndBlock].Address.State;
   result[Len].Address.Region :=Res.ContragentDTOArray[IndBlock].Address.Region;
   result[Len].Address.District :=Res.ContragentDTOArray[IndBlock].Address.District;
   result[Len].Address.City :=Res.ContragentDTOArray[IndBlock].Address.City;
   result[Len].Address.Settlement :=Res.ContragentDTOArray[IndBlock].Address.Settlement;
   result[Len].Address.Street :=Res.ContragentDTOArray[IndBlock].Address.Street;
   result[Len].Address.House :=Res.ContragentDTOArray[IndBlock].Address.House;
   result[Len].Address.Building :=Res.ContragentDTOArray[IndBlock].Address.Building;
   result[Len].Address.Appartment :=Res.ContragentDTOArray[IndBlock].Address.Appartment; }
 end;
end;
//****************************************************
Function CheckIndInArrNotDeleted(Ind:Integer):Boolean;
var i:integer;
begin
  Result:=false;
  for i:=0 to Length(ArrIndNotDel)-1 do
  if ArrIndNotDel[i] =  Ind then
  begin
    Result:=true;
    Break;
  end;
end;
//***************************************************
function FindSychronizeContragentsInSoap(forIdClient:Integer):Boolean;
var i:Integer;
begin
  Result := False;
  for i:=0 to Res.Len-1 do
  if (Res.ContragentDTOArray[i].ContragentID = forIdClient) and
     (not Res.ContragentDTOArray[i].MarkedToDelete) then
  begin
    Result := True;
    break;
  end;
end;
//***************************************************
begin
  //*************************************************
  for i:=0 to Res.Len-1 do
  begin
    if not Res.ContragentDTOArray[i].MarkedToDelete then
    begin
      len:=Length( ArrIndNotDel );
      SetLength( ArrIndNotDel , len + 1 );
      ArrIndNotDel[len]:= i;
    end;
  end;
  //*******************Add*Not Deleted**************
  for i:=0 to Length(ArrIndNotDel)-1 do
    AddBlock(ArrIndNotDel[i]);
  //******************Add All*Deleted***************
  if not FindSychronizeContragentsInSoap( ClientID ) then // if Syncronize Contragents Not Found then Add in Block All Deleted
  for i:=0 to Res.Len - 1 do
  begin
    if not CheckIndInArrNotDeleted(i) then
      AddBlock( i );
  end;
end;
//******************************************************************************
function PrepareResultClientAccounts( Res: AccountArray ):TDatCliAccountsArr;
var i:Integer;
    ArrIndNotDel:Array Of Integer;
    Len:Integer;
procedure AddBlock(IndBlock:Integer);
var Len:Integer;
begin
 if Res.AccountDTOArray[IndBlock].AccountID<>0 then
 begin
   Len:=Length(result);
   SetLength(result , Len+1);
   
   result[Len].ContragentID := Res.AccountDTOArray[IndBlock].ContragentID;
   result[Len].AccountID := Res.AccountDTOArray[IndBlock].AccountID;
   result[Len].AccountNO := Res.AccountDTOArray[IndBlock].AccountNumber;

   result[Len].BankName  := Trim(Res.AccountDTOArray[IndBlock].Bank.Name);
   result[Len].BankMFO  := Trim( Res.AccountDTOArray[IndBlock].Bank.MFO );
   result[Len].BankAddres := Trim(Res.AccountDTOArray[IndBlock].Bank.Address);
   result[Len].MarkedToDelete := Res.AccountDTOArray[IndBlock].MarkedToDelete;
 end;
end;
//***************************************************
Function CheckIndInArrNotDeleted(Ind:Integer):Boolean;
var i:integer;
begin
  Result:=false;
  for i:=0 to Length(ArrIndNotDel)-1 do
  if ArrIndNotDel[i] =  Ind then
  begin
    Result:=true;
    Break;
  end;
end;
//***************************************************

begin
 for i:=0 to Res.Len-1 do
 begin
    if not Res.AccountDTOArray[i].MarkedToDelete then
    begin
      len:=Length( ArrIndNotDel );
      SetLength( ArrIndNotDel , len + 1 );
      ArrIndNotDel[len]:= i;
    end;
 end;
 //*******************Add*Not Deleted**************
 for i:=0 to Length(ArrIndNotDel)-1 do
   AddBlock(ArrIndNotDel[i]);

 //******************Add All*Deleted***************
 for i:=0 to Res.Len-1 do
 begin
   if not CheckIndInArrNotDeleted(i) then
     AddBlock( i );
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.FGetClient(  EDRPOU: EDRPOU;INN: INN;ClientID: Integer; isPrivate:Boolean;
                                       Code1C, Name, Search1CByName:WideString; SearchInDeleted: Boolean;
                                       var ResData:TDataCliArr;  ShowMessageError:Boolean =False ):Integer;
var Res:ContragentArray;
    HTTPRIO: THTTPRIO;
    k:integer;
begin

   if CheckSoapServer then
    begin
     HTTPRIO := THTTPRIO.Create(nil);
     try

      FShowMouseCursorLoad;

      SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );
      result := -1;

      Res:=nil;

      Res :=(HTTPRIO as AlgolPortType).GetClient( EDRPOU, INN, ClientID, SearchInDeleted, Search1CByName, Code1C );
     
      if ( isPrivate ) and ( Res.Len <=0 ) and ( Search1CByName='' ) then
      begin
        Res.free;
        Res :=(HTTPRIO as AlgolPortType).GetClient( EDRPOU, INN, ClientID, SearchInDeleted, Name, Code1C );
      end;

      if ( Res.Len <=0 ) then
      begin
        exit;
      end
      else
       result := 0;

      if result=0 then
        ResData := PrepareResultClient( Res, ClientID );

     finally
       if Res<>nil then Res.Free;
       HTTPRIO := nil;
       self.FShowMouseCursorDefault;
     end;
    end
    else result:=-2;
end;
//******************************************************************************
function TFunctCallSoap1C.FGetClientAccounts(  EDRPOU: EDRPOU;ClientID: Integer;SearchInDeleted: Boolean;  var ResData:TDatCliAccountsArr;  ShowMessageError:Boolean =False ):Integer;
var Res:AccountArray;
    HTTPRIO: THTTPRIO;
    k:integer;
begin
   if CheckSoapServer then
    begin
     HTTPRIO := THTTPRIO.Create(nil);
     try
      FShowMouseCursorLoad;

      SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );
      result := -1;

      //HTTPRIO.HTTPWebNode.UserName := SoapUser;
      //HTTPRIO.HTTPWebNode.Password := SoapPassword;

      Res:=nil;
      Res :=(HTTPRIO as AlgolPortType).GetAccount( 0, ClientID, EDRPOU, SearchInDeleted );

      if ( Res.Len <=0 ) {and ( ShowMessageError )} then
      begin
        //ErrorDlg('Такого контрагента не знадено в 1C бухгалтерії');
        exit;
      end
      else
       result := 0;

      if result=0 then
        ResData :=PrepareResultClientAccounts( Res );

     finally
      if Res <> nil then Res.Free;
      HTTPRIO := nil;
      self.FShowMouseCursorDefault;
     end;
    end
    else result:=-2;
end;
//******************************************************************************
function TFunctCallSoap1C.FConvertInvoiceToElem(aData:TDatInvoice;aOrderId:Integer): InvoiceDTO;
var i:integer;
    CurrBank:Bank;
    CurrACounts:Account;
    CurrElemDTO:GoodsDTO;
    ElemArray:GoodsArray;
    MyGood:Good;
begin
  result:= InvoiceDTO.Create;
  result.InvoiceID := aData.InvoiceID;
  result.ContragentID := aData.ContragentID;
  result.ContractID   := aData.ContractID;
  result.InvoiceNumber     := aData.InvoiceNumberStr;
  result.Date              := aData.Date;
  result.InvoiceExpireDate := aData.DateInvoiceExpire;
  result.TourEndDate       := aData.DateTourEnd;
  result.OrderID           := aOrderId;
  result.Final             := aData.Final;
  Result.DirectionID       := aData.DirectionID;

  result.PaymentStatus     := aData.State;     // 1 2 3 4    // 1- оплата заборонена,
                                              // 2 - оплата дозволена,
                                             // 3 - оплата завжди дозволена (не зважаючи на протермінування рахунку).
                                            // 4 - рахунок анульований  .. позначити на видалення
  SetLength( MyGood, Length( aData.Goods ));
  
  for i:=0 to Length( aData.Goods )-1 do
  begin
    CurrElemDTO := GoodsDTO.Create;
    CurrElemDTO.Price := aData.Goods[i].Price;
    CurrElemDTO.TourID := aData.Goods[i].TourID;
    CurrElemDTO.GroupID := aData.Goods[i].GroupID;
    CurrElemDTO.Code    := aData.Goods[i].Code;


    MyGood[i] := CurrElemDTO;
    //ElemArray.Good :=  MyGood;
    //ElemArray.Good[0] := CurrElemDTO;
  end;

  ElemArray := GoodsArray.Create;
  ElemArray.Good:=  MyGood;
  result.Goods := ElemArray;
end;
//******************************************************************************
procedure TFunctCallSoap1C.DestroyElemInvoiceDTO(Elem:InvoiceDTO);
var i:integer;
begin
  if Elem <> nil then
  begin

    for i:=0 to Length(Elem.Goods.Good)-1 do
    begin
      Elem.Goods.Good[i].Free;
      Elem.Goods.Good[i]:=nil;
    end;

    Elem.Goods.Free;
    Elem.Goods:=nil;
    Elem.Free;
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateInvoice( PData:PDatInvoice; aOrderId:Integer; ShowMessageError:Boolean = False ):Integer;
var Res:OperationResult;
    HTTPRIO : THTTPRIO;
    DataInvoiceDTO : InvoiceDTO;
begin
   if CheckSoapServer then
    begin
     HTTPRIO := THTTPRIO.Create(nil);
     try
       FShowMouseCursorLoad;

       SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );
       result := -1;

       //HTTPRIO.HTTPWebNode.UserName := SoapUser;
       //HTTPRIO.HTTPWebNode.Password := SoapPassword;

       Res:=nil;
       DataInvoiceDTO := nil;
       if PData <> nil then
       begin
        DataInvoiceDTO := FConvertInvoiceToElem( PData^, aOrderId );

        Res := (HTTPRIO as AlgolPortType).UpdateInvoice( DataInvoiceDTO );
        Result := Res.Code;

        if ( not (Res.Code in [201,202]) ) and ( ShowMessageError ) then
        begin
         case Res.Code of
           501:MyShowMessageDlg('Рахунок з номером '+PData^.InvoiceNumberStr+' вже існує.', mtError, but_OK);
           507:MyShowMessageDlg('В табличній частині вказано номенклатуру з неіснуючим кодом.', mtError, but_OK);
           506:MyShowMessageDlg('Неправильний формат дати у відповідних полях', mtError, but_OK);
           510:MyShowMessageDlg('По даному рахунку вже існує акт виконаних робіт.', mtError, but_OK);
           599:MyShowMessageDlg('Помилка при синхронізації даних рахунку з 1С'+ #13 + Res.Description, mtError, but_OK);
         end;
        end
        else
          if Res.Code= 201 then result := 0;
          if result=0 then PData^.code:= Res.BaseID;
       end
       else Result := -1;

     finally
       DestroyElemInvoiceDTO( DataInvoiceDTO );

       if Res <> nil then Res.Free;
       HTTPRIO := nil;
       self.FShowMouseCursorDefault;
     end;
    end
    else result:=-2;
end;
//******************************************************************************
function TFunctCallSoap1C.FConvertPackedStatusInvoiceToElem(aData:TDatPackedStatusInvoiceArr ): InvoiceStatusArray;
var i:integer;
    len:integer;
    arrInvoiceStatus:InvoiceStatus;
    currInvoiceStatus:InvoiceStatusDTO;
begin
  len := Length(aData);
  result := InvoiceStatusArray.Create;
  SetLength( arrInvoiceStatus , len );
  for i:=0 to len - 1 do
  begin
    currInvoiceStatus := InvoiceStatusDTO.Create;
    currInvoiceStatus.InvoiceID := aData[i].InvoiceID;
    currInvoiceStatus.PaymentStatus := aData[i].PaymentStatus;
    arrInvoiceStatus[i]:= currInvoiceStatus;
  end;
  result.InvoiceStatus := arrInvoiceStatus;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateStatusPackedInvoices( PData:PDatPackedStatusInvoiceArr; ShowMessageError:Boolean =False ):Integer;
var Res:OperationResult;
    HTTPRIO: THTTPRIO;
    PackedStatusInvoiceArr: InvoiceStatusArray;
    i:integer;
begin
 if CheckSoapServer then
  begin
   HTTPRIO := THTTPRIO.Create(nil);
   try
    FShowMouseCursorLoad;

    SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );
    result := -1;

    Res:=nil;
    PackedStatusInvoiceArr := FConvertPackedStatusInvoiceToElem( PData^ );

    Res := (HTTPRIO as AlgolPortType).UpdateInvoiceStatus( PackedStatusInvoiceArr );
    Result := Res.Code;

    if ( not (Res.Code in [201,202]) ) and ( ShowMessageError ) then
    begin
     case Res.Code of
       510:MyShowMessageDlg('По даному рахунку вже існує акт виконаних робіт.', mtError, but_OK);
       206:MyShowMessageDlg('Не всім рахункам було змінено статус'+ #13 + Res.Description, mtError, but_OK);
     end;
     Result := -1;
    end
    else
      if Res.Code in [201,202]  then result := 0
      else Result := -1;

   finally
     for i:=0 to Length( PackedStatusInvoiceArr.InvoiceStatus)-1 do
     begin
       PackedStatusInvoiceArr.InvoiceStatus[i].Free;
       PackedStatusInvoiceArr.InvoiceStatus[i]:=nil;
     end;
     PackedStatusInvoiceArr.InvoiceStatus:=nil;
     PackedStatusInvoiceArr.Free;
     PackedStatusInvoiceArr:=nil;

     if Res <> nil then Res.Free;
     HTTPRIO := nil;
     self.FShowMouseCursorDefault;
   end;
  end else result := -2;
end;
//******************************************************************************
{procedure TFunctCallSoap1C.DestroyElemRealizationsArray( ElemRealizationArr:RealizationsArray );
var i,j:Integer;
begin
  for i:=0 to Length(ElemRealizationArr)-1do
  begin
    for j:=0 to Length(ElemRealizationArr[i].Goods)-1 do
      ElemRealizationArr[i].Goods[j].Free;
    ElemRealizationArr[i].
  end;
end;
//******************************************************************************}
function TFunctCallSoap1C.FGetRealizationsByInvoice( Code1C:string;SearchInDelete, SearchInUnposted:Boolean; ShowMessageError:Boolean =False;CheckConnectToServer:Boolean=True ):GetRealizationsResult;
var HTTPRIO : THTTPRIO;
begin
   FCheckConnectToServer := CheckConnectToServer;
   if CheckSoapServer then
    begin
     HTTPRIO := THTTPRIO.Create(nil);

     try
       FShowMouseCursorLoad;

       SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );

       result := (HTTPRIO as AlgolPortType).GetRealizationsByInvoice( Code1C, SearchInDelete, SearchInUnposted );
       if ( result.Elements.Len =0 ) and ( ShowMessageError ) then
         MyShowMessageDlg('Не знайдено рахунок з кодом '+Code1C, mtError, but_OK);

     finally
       HTTPRIO := nil;
       self.FShowMouseCursorDefault;
     end;
    end;
end;
//******************************************************************************
function TFunctCallSoap1C.GetRealizationsByInvoice( Code1C:string;SearchInUnposted:Boolean; ShowMessageError:Boolean =False;CheckConnectToServer:Boolean=True ):GetRealizationsResult;
begin
  Result := FGetRealizationsByInvoice( Code1C, False, SearchInUnposted, ShowMessageError,CheckConnectToServer );
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateInvoiceByOrderIdAndNumberInvoice(  OrderID, InvoiceNo:Integer;
                                                                    var InvoiceId:Integer;
                                                                    IsFinaly:Boolean; ShowMessageError:Boolean =false ): Integer;
var PData : PDatInvoice;
begin
 try

   PData := GetInvoiceByOrderIdAndNumberInvoice( OrderID, InvoiceNo,  Self.FConDBParam, IsFinaly );
   result:= FUpdateInvoice( PData, OrderID, ShowMessageError );
   if PData <>nil then
     InvoiceId := PData^.InvoiceID
   else result :=-1;

   if Result = 0 then
     FLink1CdataInvoiceToDBData( OrderID , IntToStr( PData^.InvoiceNumber) , PData^.Code );
 finally
   if PData<>nil then Dispose(PData);
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateInvoicePackegeStatus(  ShowMessageError:Boolean =false ): Integer;
var PData : PDatPackedStatusInvoiceArr;
begin
 try
   PData := GetInvoicePackeds( Self.FConDBParam );
   result:= FUpdateStatusPackedInvoices( PData, ShowMessageError );
 finally
   if PData<>nil then Dispose(PData);
 end;
end;
//******************************************************************************
Function TFunctCallSoap1C.FInvoiceUpdateStatus( IdInvoice:Variant;StatusParam:Integer; ShowErrorMessage:Boolean=false ):Integer;
var PData : PDatPackedStatusInvoiceArr;
begin
  New(PData);
  try
    SetLength( PData^, 1 );
    PData^[0].InvoiceID := IdInvoice;
    PData^[0].PaymentStatus := StatusParam ; //
    result:= FUpdateStatusPackedInvoices( PData, ShowErrorMessage );
  finally
   if PData<>nil then Dispose(PData);
  end;
end;
//******************************************************************************
Function TFunctCallSoap1C.FInvoicePaymentProhibited( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  Result := FInvoiceUpdateStatus( IdInvoice, 1, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.FInvoicePaymentEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  Result := FInvoiceUpdateStatus( IdInvoice, 2, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.FInvoicePaymentAllTimeEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  Result := FInvoiceUpdateStatus( IdInvoice, 3, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.FInvoicePaymentCancel( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  Result := FInvoiceUpdateStatus( IdInvoice, 4, ShowErrorMessage );
end;
//******************************************************************************
function TFunctCallSoap1C.FGetElemCurrencyRateArr( aData:TDataCurrencyRateArr ):CurrencyRateArray;
var i:integer;
    ArrRate:RateArray;
    ElemArr:CurrencyRateDTO;
begin
  result := CurrencyRateArray.Create;

  SetLength( ArrRate, Length(aData) );

  for i:=0 to Length( aData )-1 do
  begin
    ElemArr := CurrencyRateDTO.Create;
    ElemArr.CurrencyID := aData[i].CurrencyCode;

    ElemArr.Date := aData[i].aDate;
    ElemArr.Rate := aData[i].Rate;
    ElemArr.Zoom := aData[i].Zoom;
    ArrRate[i]:= ElemArr;
  end;
  result.RateArray := ArrRate;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FFreeElemCurrencyRateArr( aElem:CurrencyRateArray );
var i:Integer;
begin
  for i:=0 to Length( aElem.RateArray )-1 do
  begin
    aElem.RateArray[i].Free;
    aElem.RateArray[i]:= nil;
  end;
  aElem.Free;
  aElem:=nil;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateCurrencyRateSoap( PData:PDataCurrencyRateArr; ShowMessageError:Boolean =False ):Integer;
var Res:OperationResult;
    HTTPRIO: THTTPRIO;
    ElemCurrencyRateArr: CurrencyRateArray;
    i:integer;
begin
 if CheckSoapServer then
  begin
   HTTPRIO := THTTPRIO.Create(nil);
   try
    FShowMouseCursorLoad;

    SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );
    result := -1;

    Res:=nil;
    if PData <> nil then
    begin
      ElemCurrencyRateArr := FGetElemCurrencyRateArr( PData^ );

      Res := (HTTPRIO as AlgolPortType).UpdateCurrencyRate( ElemCurrencyRateArr );
      Result := Res.Code;

      if ( not (Res.Code = 202) ) and ( ShowMessageError ) then
          MyShowMessageDlg('Помилка при оновленні курсів валют в 1С'+ #13 + Res.Description, mtError, but_OK)
      else

      if Res.Code = 202 then result := 0
      else Result := -1;
    end;

   finally
     FFreeElemCurrencyRateArr( ElemCurrencyRateArr );

     if Res <> nil then Res.Free;
     HTTPRIO := nil;
     self.FShowMouseCursorDefault;
   end;
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.FUpdateCurrencyRate( CurrencyId:array of Integer;ForDate:TDateTime; var DatCurrRateArr:TDataCurrencyRateArr; ShowMessageError:Boolean =false ): Integer;
var PData : PDataCurrencyRateArr;
begin
 try
   PData := GetCurrencyPacked(self.FConDBParam, CurrencyId, ForDate );
   if PData<>nil then
   begin
     DatCurrRateArr := PData^;
     result:= FUpdateCurrencyRateSoap( PData, ShowMessageError );
   end;
 finally
   if PData<>nil then Dispose(PData);
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.UpdateCurrencyRate( MenId:Integer; CurrencyId:array of Integer;ForDate:TDateTime;WriteLog:Boolean=false; ShowMessageError:Boolean =false ): Integer;
var i:Integer;
    Res:Integer;
    DatCurrRateArr:TDataCurrencyRateArr;
begin
  try

   res := FUpdateCurrencyRate( CurrencyId, ForDate, DatCurrRateArr, ShowMessageError );
   result := Res;

  finally
    if ( result <> -1 )and( WriteLog ) then
    begin
      for i:=0 to Length(DatCurrRateArr)-1 do
        self.FUpdateLogMerge( DatCurrRateArr[i].CurrencyComerceId , 4, MenId, MyIfThen( result = 0, 1, 0 ), FCheckReasonId(Result) ); // 4 - Type Operation Synhronize Currency
    end;
  end;
  
end;
//******************************************************************************
Function TFunctCallSoap1C.ClientCreate(id:Integer; ShowErrorMessage:Boolean ):Integer;
begin

  result := FCreateClient( id, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.ClientDelete( id:Integer; ShowErrorMessage:Boolean ):Integer;
begin
  result := self.FDeleteClient( id , ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.ClientUpdate(id:Integer; ifNotFoundCreate:Boolean =false; ShowErrorMessage:Boolean=false ):Integer;
begin
  result := self.FUpdateClient(id, ifNotFoundCreate ,  ShowErrorMessage  );
end;
//******************************************************************************
Function TFunctCallSoap1C.ContractCreateByClientId(id:Integer; ShowErrorMessage:Boolean ):Integer;
begin
  result := Self.FCreateContractByClientId( id, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.ContractUpdateByClientId( id:Integer; ShowErrorMessage:Boolean=false ):Integer;
begin
  result := self.FUpdateContractByClientId( id, ShowErrorMessage  );
end;
//******************************************************************************
Function TFunctCallSoap1C.ContractDelete( id:Integer; ShowErrorMessage:Boolean ):Integer;
begin
  Result := self.FDeleteContract( id, ShowErrorMessage);
end;
//******************************************************************************
Function TFunctCallSoap1C.ContractCreateByContractId(idClient, id:Integer; ShowErrorMessage:Boolean ):Integer;
begin
  result := Self.FCreateContractByContractId(idClient, id,  ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.ContractUpdateByContractId(idClient, id:Integer; ShowErrorMessage:Boolean=false ):Integer;
begin
  result := self.FUpdateContractByContractId(idClient, id, ShowErrorMessage  );
end;
//******************************************************************************
function TFunctCallSoap1C.GetDataClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer;isPrivate:Boolean; Code1C, Name, ClientName:WideString; SearchInDeleted: Boolean; var ResData:TDataCliArr; ShowMessageError:Boolean =False ): integer;
begin
  Result := self.FGetClient( EDRPOU, INN, ClientID,isPrivate, Code1C, Name, ClientName, SearchInDeleted, ResData, ShowMessageError );
end;
//******************************************************************************
Function TFunctCallSoap1C.InvoiceUpdateByOrderAndNumberInvoice(OrderID, InvoiceNo:Integer;var InvoiceId:Integer;IsFinaly:Boolean; ShowErrorMessage:Boolean=false ):Integer;
begin
  result := self.FUpdateInvoiceByOrderIdAndNumberInvoice(OrderID, InvoiceNo, InvoiceId,IsFinaly, ShowErrorMessage  );
end;
//******************************************************************************
Function TFunctCallSoap1C.InvoicePackedsUpdate( ShowErrorMessage:Boolean=false ):Integer;
begin
  result := self.FUpdateInvoicePackegeStatus(  ShowErrorMessage  );
end;
//******************************************************************************
Function TFunctCallSoap1C.InvoicePaymentCancel( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  result := self.FInvoicePaymentCancel( IdInvoice, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.InvoicePaymentProhibited( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  result := self.FInvoicePaymentProhibited( IdInvoice, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.InvoicePaymentEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  Result := FInvoicePaymentEnabled( IdInvoice, ShowErrorMessage );
end;
//******************************************************************************
Function TFunctCallSoap1C.InvoicePaymentAllTimeEnabled( IdInvoice:Variant; ShowErrorMessage:Boolean=false ):Integer;
begin
  Result := FInvoicePaymentAllTimeEnabled( IdInvoice, ShowErrorMessage );
end;
//******************************************************************************
function TFunctCallSoap1C.ShowCompareClient( datClDB:TDataValueArr; datClSoap:TDataValueArr;SearchInDeleted:Boolean;
         ShowMessageError:Boolean =False; ShowWhenDifferent:Boolean=true; ParamFindCheck:PParamFindCheck=nil; ParamMessageInfo : PParamMessageInfo=nil ):integer;
var CompareData: TCompareDataGrid;
    DialogMaxHeight:Integer;
    FirstIndexNotDeleted:integer;
    NewButtonCaption:WideString;
begin
 try
   CompareData := TCompareDataGrid.Create(True);
   self.PrepareFuncUpdateForDataClient( datClDB , datClSoap , CompareData, SearchInDeleted, ShowMessageError );

   datClDB.param.CaptionGrid := CaptionLeftPart;
   datClSoap.param.CaptionGrid := CaptionRightPart;

   datClDB.param.CaptionSelect := '';
   if self.FCanSelect then
     datClSoap.param.CaptionSelect := CaptionSelectData
   else datClSoap.param.CaptionSelect:='';

   //DatCliSoap := ConvertArrValueToDatCli( datClSoap.data );
   //CountNonDelSoap := FCheckCountNotDeletedFromDavaValueArr(DatCliSoap , FirstIndexNotDeleted );
   //if ( ShowWhenDifferent ) and ( Length(datClDB.data) = CountNonDelSoap )and( CompareData.isEqual(datClDB , datClSoap) = True ) then        // Compare Just by Not Deleted

   if ( ShowWhenDifferent ) and ( ( Length(datClSoap.param.data) = 1 ) and (Length(datClDB.param.data) = Length(datClSoap.param.data)) )and
      ( CompareData.isEqual(datClDB , datClSoap) = True ) then   // Compare By All
   begin
     result:=10;// Data is Equal
     Exit;
   end;  
   //**************************************
   DialogMaxHeight := 980;
   //**************************************
   if  ( AutoMergeForUpdate ) and ( Length(datClDB.param.data) = Length(datClSoap.param.data) ) then
   begin
     AskForFonfirmAction := false;
     datClDB.AcceptAct( datClDB.param, datClSoap.param, SearchInDeleted, True );

     AskForFonfirmAction := True;
     if CompareData.isEqual(CompareData.DataFrom , CompareData.DataTo) then
     begin
       result:=10;// Data is Equal
       Exit;
     end;
   end;
   //**************************************
   if SkipWhenConfuse then
   begin
     result := 11;
     exit;
   end;
   //**************************************
   if Self.FCanCreateNew then NewButtonCaption := CaptionNewCreateContragent
   else NewButtonCaption :='';
   //**************************************

   CompareData.Show( CaptionCompareDataWindow, 1200, DialogMaxHeight, 150, True,True, datClDB, datClSoap,
                     CaptionSynchronize, '',CaptionButtRefresh,'',NewButtonCaption,'', self.FMarkDifStyle, nil, ParamFindCheck, ParamMessageInfo );

   if CompareData.isEqualViewData then
     result:=0
   else result:=11;

 finally
   CompareData.free;
 end;
end;
//******************************************************************************
Procedure TFunctCallSoap1C.FChangePlaceData( dat : PDataValueArr; IndexFrom,IndexTo:Integer );
var i,j:Integer;
    SaveDatFirst:PDataValueArr;
begin
  SetLength( SaveDatFirst ,1 );
  SetLength( SaveDatFirst[0] , Length(dat[IndexFrom]) );
  for i:=0 to Length(dat[IndexFrom])-1 do      // Copy Data From Index
    SaveDatFirst[0][i]:= dat[IndexFrom][i];
  //************************
   for i:=0 to Length(dat[IndexFrom])-1 do
     dat[IndexFrom][i]:=dat[IndexTo][i];      // Set To
  //************************
   for i:=0 to Length(SaveDatFirst[0])-1 do
     dat[IndexTo][i]:=SaveDatFirst[0][i];    // Set From Copy
  //************************
end;
//******************************************************************************
function TFunctCallSoap1C.FCheckOnCompareAccountsAndMFO(DataLeft,DataRight:PDataValueArr):Integer;
var i,j:Integer;
    CurrAccountLeft:Variant;
    CurrMFOLeft:Variant;

    CurrAccountRight:Variant;
    CurrMFORight:Variant;
begin
  Result:=-1;
  //*******************************
  for i:=0 to Length(DataLeft)-1 do
  begin
    CurrAccountLeft := FgetValueByFieldFromValueArrByndex(DataLeft, 'ACCOUNTNO', i).Value;
    CurrMFOLeft := FgetValueByFieldFromValueArrByndex(DataLeft, 'BANK_MFO', i).Value;

    CurrAccountRight := FgetValueByFieldFromValueArrByndex(DataRight, 'ACCOUNTNO', i).Value;
    CurrMFORight := FgetValueByFieldFromValueArrByndex(DataRight, 'BANK_MFO', i).Value;

    if (CurrAccountLeft <> null)and(CurrMFOLeft <> null)and(CurrMFORight <> null)and
       (CurrAccountLeft = CurrAccountRight) and (CurrMFOLeft <> CurrMFORight ) then
    begin
     Result:=i;
     break;
    end;
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.FSortRecognizedAccount( aDataStore:PDataValueArr; DatForFind:PDataValueArr ):Integer;
var i,j, k:Integer;
    max:Integer;
    CurrCountFind:Integer;
Function CheckValueCountInArr(Index:Integer; FildName:string;Value:Variant):Integer;
var i:Integer;
begin
  result:=-1;
  for i:=0 to Length(DatForFind[Index]) - 1 do
  begin
   if ( DatForFind[Index][i].Compare ) and
      ( CompareText( DatForFind[Index][i].FieldName , 'ACCOUNTNO' ) = 0 )and       // Compare for Number Account
      ( DatForFind[Index][i].Value = Value ) then

   Inc(Result);
  end;
end;
//*********************************************
begin
 try
  max:=0;
  result:=0;
  for i:=0 to Length(aDataStore)-1 do
  begin
    for j:=0 to Length(aDataStore[i])-1 do
    begin
      if aDataStore[i][j].Compare then
      begin
        for k:=0 to Length( DatForFind )-1 do
        begin
          CurrCountFind := CheckValueCountInArr( k ,  aDataStore[i][j].FieldName ,  aDataStore[i][j].Value );
          if CurrCountFind<> - 1 then
            FChangePlaceData( DatForFind, i, k );
        end;
      end;
    end;
  end;
 except
  //ShowMessage( IntToStr(i)+' ' +IntToStr(j) );
 end;
end;
//******************************************************************************
Procedure TFunctCallSoap1C.FAdaptingDataValueForCompareLeftRightPart( datClDB, datClSoap : TDataValueArr );
var IndexCorrect:Integer;
begin
 if Length(datClDB.param.data)<=Length(datClSoap.param.data) then
   FSortRecognizedAccount( datClDB.param.data, datClSoap.param.data )
 else
   FSortRecognizedAccount(  datClSoap.param.data , datClDB.param.data);
end;
//******************************************************************************
function TFunctCallSoap1C.ShowCompareClientAccounts( datClDB:TDataValueArr; datClSoap:TDataValueArr; SearchInDeleted:Boolean; ShowMessageError:Boolean =False; ShowWhenDifferent:Boolean=true ):integer;
var CompareData: TCompareDataGrid;
    DialogHeight:Integer;
begin
 try
   CompareData := TCompareDataGrid.Create(True);
   FAdaptingDataValueForCompareLeftRightPart( datClDB, datClSoap );
   self.PrepareFuncUpdateForDataClientAccounts( datClDB , datClSoap , CompareData, SearchInDeleted, ShowMessageError );

   datClDB.param.CaptionGrid := CaptionLeftPart;
   datClSoap.param.CaptionGrid := CaptionRightPart;

   if ( ShowWhenDifferent ) and ( (Length(datClDB.param.data) = Length(datClSoap.param.data)) ) and ( CompareData.isFindEqualFromInTo(datClDB , datClSoap) = True ) then //( CompareData.isEqual(datClDB , datClSoap) = True ) then
   begin
    result:=10;// Data is Equal        isFindEqualFromInTo
    Exit;
   end;

   if AutoMergeForUpdate then
   begin
     AskForFonfirmAction :=false;
     datClDB.AcceptAct( datClDB.param,datClSoap.param, SearchInDeleted, True);
     AskForFonfirmAction :=True;
     if CompareData.isFindEqualFromInTo( CompareData.DataFrom , CompareData.DataTo ) then
     begin
       result:=10;// Data is Equal
       Exit;
     end;
   end;


   DialogHeight:=833;

   CompareData.Show( 'Порівняння даних', 1200, DialogHeight, 150, True, False, datClDB, datClSoap, 'Синхронізувати', '','Оновити','','Новий','', self.FMarkDifStyle );
   if CompareData.isEqualViewData then
     result:=0
   else result:=11;

 finally
   CompareData.free;
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.FCompareInform(resCode:Integer; datClDB:TDataValueArr;
                                         datClSoap:TDataValueArr;
                                         MessNotFoundFrom,MessNotFoundSoap:Widestring;ShowMessageError:Boolean =False ):Integer;
begin
  result:=resCode;
  if resCode = -2 then
  begin
    //if ShowMessageError then ErrorDlg('Синхронізація є не доступною. Немає зв''язку з сервером 1С.');
    if ShowMessageError then MyShowMessageDlg('Синхронізація є не доступною. Немає зв''язку з сервером 1С.', mtError, but_OK );
    result:=-2;
    exit;
  end;
  //*********************************
  if Length(datClDB.param.data) = 0  then
  begin
    //if ShowMessageError then ErrorDlg(MessNotFoundFrom);
    result:= 1;  // Data DB not Found
    Exit;
  end;
  //*********************************
  //DatCliSoap := ConvertArrValueToDatCli( datClSoap.data );
  //  FCheckCountNotDeletedFromDavaValueArr(DatCliSoap , FirstIndexNotDeleted ) = 0 then // Якщо немає жодного з //  Активних(Не видалених) клієнтів в 1С
  if (resCode = -1)or(Length(datClSoap.param.data)=0) THEN
  begin
    //if ShowMessageError then ErrorDlg(MessNotFoundSoap);
    result:= 2;  // Data Soap 1C not Found
    Exit;
  end;
  //*********************************
end;
//******************************************************************************
function FindSameCode1CInDataValue( DatSoap:TDataCliArr;Code1CForFind:String ):Integer;
var i:Integer;
    NotFound:Integer;
begin
  NotFound :=0;
  Result :=-1;
  
  for i:=0 to Length(DatSoap)-1 do
  begin
    if Trim( DatSoap[i].Code) = '' then Inc(NotFound);

    if (Trim(Code1CForFind)<>'') and (CompareText( DatSoap[i].Code,Code1CForFind ) =0 )  then
    begin
      result := 0;
      Break;
    end;
  end;

  if (NotFound = Length(DatSoap)) then Result :=-2;
end;
//******************************************************************************
function FindCode1CinDataValue( DatSoap:TDataCliArr ) :Integer;
var i:Integer;
begin
  result :=0;
  for i:=0 to Length(DatSoap)-1 do
  begin
    if Trim( DatSoap[i].Code) <> '' then Inc(result);
  end;
end;
//******************************************************************************
function FindDeletedInDataValue(DatSoap:TDataCliArr):Integer;
var i:Integer;
begin
  Result:=0;
  for i:=0 to Length(DatSoap)-1 do
  begin
     if DatSoap[i].MarkedToDelete then
       Result := Result +1;
  end;
end;
//******************************************************************************
function PrepareMessageInfoHelp( DataLeft,DataRight:TDataValueArr ): Widestring;
var IDLeft : Variant;
    IDRight : Variant;

    IDContragentLeft : Variant;
    IDContragentRight : Variant;

    EDRPOLeft : Variant;
    EDRPORight : Variant;

    IPNLeft : Variant;
    IPNRight : Variant;
    //IsPrivateLeft:Variant;

    DatCli:TDataCliArr;
    DatCliSoap:TDataCliArr;
    CountClientNotDeleted1C:Integer;
    FirstIndexNotDeleted:Integer;
    CompareData : TCompareDataGrid;
begin
  //result :='Acid Help';
  //IsPrivateLeft := GetValueByFieldFromValueArr( DataLeft, 'ISPRIVATE' );
  try
    CompareData:=TCompareDataGrid.Create(True);
    DatCli := ConvertArrValueToDatCli( DataLeft.param.data );
    DatCliSoap := ConvertArrValueToDatCli( DataRight.param.data );

    CountClientNotDeleted1C := CheckCountNotDeletedFromDavaValueArr( DatCliSoap, FirstIndexNotDeleted );

    //IsPrivateRight:= GetValueByFieldFromValueArr( DataRight, 'ISPRIVATE' );

    if (DatCli[0].Code = '') then    // для Не Синхронызованого контрагента
    begin
      if ( Length(DatCliSoap) = 1 )and( CompareData.isEqual( DataLeft , DataRight) <> True )  then
        result:= 'Увага! В програмі 1С для партнера знайдено контрагента. Щоб продовжити виконання синхронізації натисніть на кнопку "Синхронізувати".'+
               'Щоб зупинити виконання синхронізації натисніть на кнопку "Відміна"' //2
      else
      if ( Length(DatCliSoap) = 1 )and(DatCliSoap[0].MarkedToDelete)and(DatCliSoap[0].Code='') then
        result:= '  Увага! В програмі 1С для партнера знайдено контрагента, який помічений на видалення. Синхронізація не є можливою! '+
                 'Для усунення конфлікту натисніть на кнопку "Відміна" та зверніться до Бухгалтера з проханням зняти з контрагента помітку "На видалення"' //3
      else
      if Length(DatCliSoap)  > 1 then
      begin
        result:= '  Увага! В програмі 1С для партнера знайдено декілька контрагентів. Для усунення конфлікту натисніть на кнопку "Відміна" '+
                 'та зверніться до Бухгалтера з проханням видалити контрагентів-двійників';    //4

        if ( DatCli[0].ISPRIVATE ) then
          Result := result+', або виберіть одного (правильного) із списку і натисніть кнопку синхронізувати.'
        else Result := result+',або об''єднати їх в одного контрагента за допомогою групової обробки "Заміна контрагента".' //5
      end
      else
       if (Length(DatCliSoap) = 1)and(DatCliSoap[0].Code<>'')and(DatCliSoap[0].ContragentID<>DatCli[0].ContragentID) then
         Result :='  Увага! Знайдений в 1С синхронізований контрагент містить ID іншого партнера! Перевірте правильність даних партнера, '+
                  'що синхронізується. Для усунення конфлікту натисніть на кнопку "Відміна" та зверніться до Адміністратора програми." '//6
      else
       if (Length(DatCliSoap)>1 )and(DatCli[0].ISPRIVATE) then
         result:='  Увага! В програмі 1С для партнера знайдено декілька контрагентів. Якщо відповідний партнеру контрагент серед них відсутній, '+
                 'натисніть на кнопку "Створити". Якщо є лише один відповідний партнеру контрагент, виберіть цього контрагента та натисніть на кнопку "Синхронізувати". '+
                 'Якщо є декілька відповідних партнеру контрагентів, натисніть на кнопку "Відміна" та зверніться до бухгалтера з проханням видалити контрагентів-двійників '+
                 'або об''єднати їх в одного контрагента за допомогою групової обробки "Заміна контрагента"';   // 6
    end;
    //**********************************************
    if (DatCli[0].Code <> '') then    // для Синхронізованого контрагента
    begin
      {if (DatCli[0].Code <> '')and ( FindSameCode1CInDataValue(DatCliSoap, DatCli[0].Code)<>0 ) then
        Result :='Увага! В програмі 1С для партнера відсутній синхронізований контрагент. З''ясуйте причину його відсутності в Бухгалтера та повідомте '+
                 'про цей випадок Адміністратора. Щоб продовжити виконання синхронізації натисніть на кнопку "Створити". Щоб зупинити виконання синхронізації '+
                 'натисніть на кнопку "Відміна"' // 1
      else }
      if (Length(DatCliSoap)=1)and(DatCliSoap[0].Code='')and(FindDeletedInDataValue(DatCliSoap)=0) then
        Result :='  Увага! В програмі 1С для партнера відсутній синхронізований контрагент. З''ясуйте причину його відсутності в Бухгалтера та повідомте '+
                 'про цей випадок Адміністратора. Щоб продовжити виконання синхронізації натисніть на кнопку "Синхронізувати". Щоб зупинити виконання синхронізації '+
                 'натисніть на кнопку "Відміна"."'  //2
      else
      if (Length(DatCliSoap)=1)and(DatCliSoap[0].Code='')and(FindDeletedInDataValue(DatCliSoap)>0) then
        Result :='  Увага! В програмі 1С для партнера відсутній синхронізований контрагент, але знайдено контрагента, який помічений на видалення.'+
                 'Синхронізація не є можливою! Для усунення конфлікту натисніть на кнопку "Відміна" та зверніться до Бухгалтера з проханням зняти з '+
                 'контрагента помітку "На видалення"." '  //3
      else
      if ( FindSameCode1CInDataValue( DatCliSoap, DatCli[0].Code ) = -2 )and (Length(DataRight.param.data) > 1 ) then
        result:= '  Увага! В програмі 1С для партнера відсутній синхронізований контрагент. З''ясуйте причину його відсутності в Бухгалтера '+
                 'та повідомте про цей випадок Адміністратора. Для усунення конфлікту натисніть на кнопку "Відміна" та зверніться до Бухгалтера '+
                 'з проханням видалити контрагентів-двійників або об''єднати їх в одного контрагента за допомогою групової обробки "Заміна контрагента".' //4
      else
      if (Length(DatCliSoap)=1) and ( CompareText( DatCliSoap[0].Code, DatCli[0].Code)=0 )and(DatCliSoap[0].MarkedToDelete) then
        Result := '  Увага! В програмі 1С для партнера знайдено синхронізованого контрагента, який помічений на видалення! '+
                  'Синхронізація не є можливою! Для усунення конфлікту натисніть на кнопку "Відміна" та зверніться до бухгалтера з проханням '+
                  'зняти з контрагента помітку "На видалення".'  //6
      else
      if (Length(DatCliSoap)=1) and ( CompareText( DatCliSoap[0].Code, DatCli[0].Code)=0 ) then
        Result :='  Увага! Потрібно з''ясувати причину відмінності даних в партнера та в контрагента. Якщо неправильні дані в партнера, '+
                 'натисніть на кнопку "Відміна", виправіть його дані в довіднику "Партнери" та повторно синхронізуйте його. '+
                 'Якщо неправильні дані в контрагента, натисніть на кнопку "Синхронізувати".' //7
      else
      if (Length(DatCliSoap)=1) and ( CompareText( DatCliSoap[0].Code, DatCli[0].Code)=0 )and(DatCli[0].ContragentID <> DatCliSoap[0].ContragentID) then
        Result :='  Увага! Знайдений в 1С синхронізований контрагент містить ID іншого партнера! Перевірте правильність даних обох партнерів. '+
                 'Для усунення конфлікту натисніть на кнопку "Відміна" та зверніться до Адміністратора програми'  //8
      else
      if (Length(DatCliSoap)=1) and ( CompareText( DatCliSoap[0].Code, DatCli[0].Code)<>0 )and(DatCli[0].ContragentID = DatCliSoap[0].ContragentID) then
        Result :='  Увага! Знайдений в 1С синхронізований контрагент містить інше ID контрагента! Повідомте про цю проблему Адміністратора програми. '+
                 'Щоб продовжити виконання синхронізації натисніть на кнопку "Синхронызувати". Щоб зупинити виконання синхронізації натисніть на кнопку "Відміна".' //9
      else
      if (FindSameCode1CInDataValue( DatCliSoap, DatCli[0].Code )=0)and(Length(DatCliSoap)>1)and(FindCode1CinDataValue( DatCliSoap) >1) then
        result := '  Увага! В програмі 1С для партнера знайдено декілька синхронізованих контрагентів з неправильними даними - можливий збій '+
                  'бази даних туристичної програми або програми 1С. Для усунення конфлікту натисніть на кнопку "Відміна" та зверніться до бухгалтера '+
                  'та Адміністратора ';  //10
    end;

    {if Length(DataRight.param.data) > 1 then
    begin
      result:= 'Синхронізанія не є можливою, так як в бух. програмі знайдено більше одного ('+IntToStr(Length(DataRight.param.data))+')'+#13#10+
               'активного контрагента, для вирішення конфлікту зверніться до бухгалтера';
      if ( DatCli[0].ISPRIVATE ) then
        result :=result+', або виберіть одного (правильного) із списку і натисніть кнопку синхронізувати.';
    end;

    if ( Length(DataRight.param.data)=1 )and( CountClientNotDeleted1C = 0 ) then
      result:= 'Синхронізанія не є можливою,так як в бух. програмі контрагента позначено на видалення! Для вирішення конфлікту зверніться до бухгалтера.'
    else
    if ( Length(DatCliSoap) = 1 )and( ( DatCliSoap[0].Code <> DatCli[0].Code ) and ( DatCli[0].Code<>'' ) ) then
      result:= 'В туристичній програмі код ID з бух.програми ('+DatCli[0].Code+') відрізняється від ID існуючого контрагента в 1С.('+DatCliSoap[0].Code+').' +#13#10+
               'Для уточнення даних зверніться до розробників прграми, або якщо ви впевнені в правильності даних, підтвердіть синхронізацію з новою ID натиснувши кнопку синхронізувати.'
    else
    if ( Length(DatCliSoap)=1 )and ( ( DatCliSoap[0].INN <> DatCli[0].INN ) and ( DatCli[0].INN<>'' ) ) then
      result:= 'В туристичній програмі код ІПН з бух.програми ('+DatCli[0].INN+') відрізняється від ІПН існуючого контрагента в 1С.('+DatCliSoap[0].INN+')'+#13#10+
               'Для уточнення даних зверніться до бухгалтера, або якщо ви впевнені в правильності даних, підтвердіть синхронізацію з новим ІПН натиснувши кнопку синхронізувати.'
    else
    if ( Length(DataRight.param.data)=1 )and(CompareData.isEqual( DataLeft , DataRight) <> True)  then
      result:= 'Для синхронізації натисніть кнопку синхронізувати.'; }
  finally
    CompareData.Close;
  end;

end;
//******************************************************************************
function TFunctCallSoap1C.ShowCompareByClient( EDRPOU: EDRPOU;INN: INN;ClientID: Integer; isPrivate:Boolean; Code1C, Name, Search1CByName:WideString; SearchInDeleted: Boolean; var datClDB:TDataValueArr;
                                              var datClSoap:TDataValueArr; ShowMessageError:Boolean =false; ShowWhenDifferent:Boolean=true ):integer;
var FirstIndexNotDeleted:Integer;
    DatCliSoap : TDataCliArr;
    ParamFindCheck : PParamFindCheck;
    ParamMessageInfo : PParamMessageInfo;
    aFontMessageInfo:TFont;
    resCode:Integer;
begin
 //datClDB.data := self.GetDataDBForClient( EDRPOU, INN, ClientID );
  datClSoap.param.data := self.GetDataSoapForClient( EDRPOU, INN, ClientID, isPrivate, Code1C, Name, Search1CByName, SearchInDeleted, resCode,  ShowMessageError );
  result := FCompareInform(resCode , datClDB, datClSoap ,
               'Такого кліента не знадено в туристучній програмі',
               'Такого контрагента не знадено в 1C бухгалтерії',ShowMessageError );
  //if Length(datClSoap.data)=0 then result:=2;
  if result <>0 then exit;
  //*********************************
  New(ParamFindCheck);
  New(ParamMessageInfo);
  try
    ParamFindCheck^.KeyFieldName := 'CompanyId';
    ParamFindCheck^.ValueForKeyFieldName := ClientID;

    ParamMessageInfo.HeightArea := 32;
    ParamMessageInfo.GetInfoMessageFunc := PrepareMessageInfoHelp;
    ParamMessageInfo.Font := FFontMessageInfo;

    ParamMessageInfo.ColorBg := clYellow;
    result := ShowCompareClient( datClDB, datClSoap, SearchInDeleted, ShowMessageError, ShowWhenDifferent, ParamFindCheck, ParamMessageInfo );
  finally
    Dispose( ParamMessageInfo );
    Dispose( ParamFindCheck );
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.ShowCompareByClientAccounts( EDRPOU: EDRPOU; ClientID: Integer; SearchInDeleted: Boolean; var datClDB:TDataValueArr;
                                              var datClSoap:TDataValueArr; ShowMessageError:Boolean =false; ShowWhenDifferent:Boolean=true ):integer;
var resCode:Integer;
begin
 datClSoap.param.data := self.GetDataSoapForClientAccount( EDRPOU, ClientID, SearchInDeleted, resCode,  ShowMessageError );
 result := FCompareInform(resCode , datClDB, datClSoap ,
               'Для кліента не знадено рахунків в туристучній програмі',
               'Для контрагента не знадено рахунків в 1C бухгалтерії', ShowMessageError );
 if result <> 0 then exit;
 //*********************************
 Result := ShowCompareClientAccounts( datClDB, datClSoap, SearchInDeleted, ShowMessageError, ShowWhenDifferent);
end;
//******************************************************************************
function TFunctCallSoap1C.FgetValueByFieldFromValueArrByndex(dataArr: PDataValueArr; FieldName:string;IndexArr:Integer):TValueArr;
var j:Integer;
begin
  result.Index:=-1;
  result.FieldName:='';
  result.Value:=Null;
  //*****************************************
  if Length( dataArr ) <= IndexArr then exit;
  
  for j:=0 to Length(dataArr[IndexArr])-1 do
  begin
    if CompareText( dataArr[IndexArr][j].FieldName , FieldName ) = 0 then
    begin
      Result.index:= j;
      result.FieldName:=FieldName;
      result.value:=dataArr[IndexArr][j].Value;
      Break;
    end;
  end;
  //end;
end;
//******************************************************************************
function GetValueByFieldFromValueArr(dataArr: TDataValueArr; FieldName:string):Variant;
var i,j:Integer;
begin
  result:=Null;
  for i:=0 to Length(dataArr.param.data)-1 do
  begin
    for j:=0 to Length(dataArr.param.data[i])-1 do
    begin
      if CompareText( dataArr.param.data[i][j].FieldName , FieldName )= 0 then
      begin
        result:=dataArr.param.data[i][j].Value;
        Break;
      end;
    end;
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.FgetValueByFieldFromValueArr(dataArr: TDataValueArr; FieldName:string):Variant;
var i,j:Integer;
begin
  result := GetValueByFieldFromValueArr( dataArr, FieldName );
  {result:=Null;
  for i:=0 to Length(dataArr.param.data)-1 do
  begin
    for j:=0 to Length(dataArr.param.data[i])-1 do
    begin
      if CompareText( dataArr.param.data[i][j].FieldName , FieldName )= 0 then
      begin
        result:=dataArr.param.data[i][j].Value;
        Break;
      end;
    end;
  end; }
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationBankAccountsDBAnd1C( MenId , idClient:Integer; ShowWhenDifferent:boolean=True;
                                                             SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false; AutoMerge:boolean=false ):Integer;
var Res:Integer;
    datClDB:TDataValueArr;
    datClSoap:TDataValueArr;
    EDRPO:Variant;
    DatCliAccountsDB: TDatCliAccountsArr;
    DatCliAccountsSoap: TDatCliAccountsArr;
    VarCode:Integer;
label
 GotoLabelShowCompareAccount;
begin
 try
  FCurrClientId:= idClient;
  GotoLabelShowCompareAccount:
  datClDB.param.data := GetDataClientAccountDBForClientById( idClient );
  EDRPO := FgetValueByFieldFromValueArr( datClDB, 'EDRPOU' );
  FMenId := MenId;
  AskForFonfirmAction := True;
  AutoMergeForUpdate  := AutoMerge;

  if ( EDRPO = null ) then EDRPO:=0;

  Res   := ShowCompareByClientAccounts( EDRPO, idClient, SearchInDeleted1C, datClDB, datClSoap, ShowMessageError, ShowWhenDifferent );
  VarCode:=Res;
  {if Res = 1 then   // Update to DB
  begin
    DatCliAccountsDB := ConvertArrValueToDatCliAccounts( datClSoap.data );
    Res:=FUpdateDataClientAccountsDB( MenId , DatCliAccountsDB );// <> 0 then
  end;  }

  if Res = 2 then   // Update Just 1C
  begin
    DatCliAccountsSoap := ConvertArrValueToDatCliAccounts( datClDB.param.data );
    Res := FUpdateClientAccountsSoap( DatCliAccountsSoap , ShowMessageError);
  end;


  if ( VarCode in [1,2] )and(Res=0)and(not ShowWhenDifferent) then Goto GotoLabelShowCompareAccount;
  
  if ( Length( datClDB.param.data ) = 0 ) and ( Length( datClSoap.param.data ) = 0 ) then Res:=-1;

  if Res = 10 then Res:=0; // Data is Equal
  if Res = 11 then Res:=1; // Data is not Equal

  Result:=Res;
 finally
  if (Res<>-1)and(WriteLog) then self.FUpdateLogMerge(idClient , 2, MenId , MyIfThen( Res = 0, 1, 0 ),  FCheckReasonId(Res) );  // 2 -  Type Operation - Синхронізація банк рах;  Причина. 0 - Відсітнсть зв'язку; 1 - Чекає на узгодження менеджера

  FFreeMemDataArr(datClDB.param.data);
  FFreeMemDataArr(datClSoap.param.data);
 end;

end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationInvoiceDBAnd1C( MenId , OrderID, InvoiceNo:Integer; WriteLog:Boolean=false;
                                                        ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;
var Res:Integer;
    InvoiceId:Integer;
begin
 AutoMergeForUpdate := AutoMerge;

 try
  Res := self.InvoiceUpdateByOrderAndNumberInvoice( OrderID, InvoiceNo, InvoiceId, False, ShowMessageError );
  result:=Res;

 finally
  if (result<>-1)and( WriteLog ) then self.FUpdateLogMerge( InvoiceId, 3, MenId, MyIfThen( result = 0, 1, 0 ), FCheckReasonId(Result) ); // 3 - Type Operation Synhronize Invoice
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationFinalyInvoiceDBAnd1C( MenId , OrderID, InvoiceNo:Integer; WriteLog:Boolean=false;
                                                              ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;
var Res:Integer;
    InvoiceId:Integer;
begin
 AutoMergeForUpdate := AutoMerge;

 try
  Res := self.InvoiceUpdateByOrderAndNumberInvoice( OrderID, InvoiceNo, InvoiceId, True, ShowMessageError );
  result:=Res;

 finally
  if (result<>-1)and( WriteLog ) then self.FUpdateLogMerge( InvoiceId, 5, MenId, MyIfThen( result = 0, 1, 0 ), FCheckReasonId(Result) ); // 5 - Type Operation Synhronize Invoice Final
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationClientAndBankAccountsDBAnd1C( MenId , idClient:Integer; ShowWhenDifferent:boolean=True;
                          SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false; AutoMerge:boolean=false ):Integer;
var Res:Integer;
begin
  Res:=Self.SynhronizationCompanyDBAnd1C( MenId, idClient, true, true, true, true, AutoMerge );
  if Res = 0 then
    Result:=self.SynhronizationBankAccountsDBAnd1C( MenId , idClient, ShowWhenDifferent, SearchInDeleted1C, WriteLog, ShowMessageError, AutoMerge )
     else result:=-1;
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationClientAndContractDBAnd1C( MenId , idClient:Integer; WriteLog:Boolean=false;
                                                                  ShowMessageError:Boolean = false; AutoMerge:boolean=false ):Integer;
var Res:Integer;
begin
  Res:=Self.SynhronizationCompanyDBAnd1C( MenId, idClient, true, true, true, true, AutoMerge );
  if Res = 0 then
     result:=SynhronizationContractDBAnd1CByClientId( MenId , idClient, WriteLog, ShowMessageError, AutoMerge );
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationClientAndContractDBAnd1CByContractId( MenId ,idClient, idContract:Integer;
                                                                              WriteLog:Boolean=false; ShowMessageError:Boolean = false;AutoMerge:boolean=false ):Integer;
var Res:Integer;
begin
  Res:=0;
  if idClient <> -1 then Res:=Self.SynhronizationCompanyDBAnd1C( MenId, idClient, true, true, true, true,AutoMerge );
  if Res = 0 then
     result:=SynhronizationContractDBAnd1CByContractId( MenId , idClient , idContract, WriteLog, ShowMessageError,AutoMerge );
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationClientAndInvoiceDBAnd1C( MenId, idClient, OrderID, InvoiceNo:Integer;
  SearchInDeleted1C:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false; AutoMerge:boolean=false ):Integer;
var Res:Integer;
begin
  Res:=Self.SynhronizationCompanyDBAnd1C( MenId, idClient, true, true, true, true, AutoMerge );
  if Res = 0 then
    Res := self.SynhronizationInvoiceDBAnd1C( MenId,  OrderID, InvoiceNo, true, ShowMessageError )
  else Res :=-1;

  result := Res;
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationClientContractAndInvoiceDBAnd1C( MenId, idClient, idContract, OrderID, InvoiceNo:Integer;
        SearchInDeleted1C:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false; AutoMerge:boolean=false; IsFinal:Boolean=False ):Integer;
var Res:Integer;
begin
  Res:=Self.SynhronizationClientAndContractDBAnd1CByContractId( MenId, idClient, idContract, WriteLog, ShowMessageError, AutoMerge );
  if Res = 0 then
  begin
    if IsFinal then Res := self.SynhronizationFinalyInvoiceDBAnd1C( MenId,  OrderID, InvoiceNo, WriteLog, ShowMessageError )
    else Res := self.SynhronizationInvoiceDBAnd1C( MenId,  OrderID, InvoiceNo, WriteLog, ShowMessageError );
  end
  else res :=-1;

  result := Res;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FFreeMemDataArr(PData:PDataValueArr);
var i,j:Integer;
begin
  for i:=0 to Length(PData)-1 do
   for j:=0 to Length(PData[i])-1 do
   begin
     if (PData[i][j].ShowButtonEvent<>nil) then Dispose(PData[i][j].ShowButtonEvent);
     Dispose( PData[i][j] );
   end;
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationCompanyDBAnd1C( MenId, idClient:Integer; ShowWhenDifferent:boolean=True;
                          SearchInDeleted1C:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false;
                          AutoMerge:boolean=false;CreateIfNotFound:Boolean=True ):Integer;
var Res:Integer;
    datClDB:TDataValueArr;
    datClSoap:TDataValueArr;
    EDRPO:EDRPOU;
    INNN:INN;
    Search1CByName : WideString;
    Name : WideString;
    DatCli:TDataCliArr;
    DatSoap:TDataCliArr;
    PDat:PDatCli;
    Code1CStr:WideString;
    isPrivate:Boolean;
label
  GotoLabelShowCompare;

begin
 try
    AutoMergeForUpdate := AutoMerge;
    FCurrClientId:= idClient;
    GotoLabelShowCompare : datClDB.param.data := self.GetDataDBForClientById( idClient );

    EDRPO := FgetValueByFieldFromValueArr( datClDB, 'EDRPOU' );
    INNN  := FgetValueByFieldFromValueArr( datClDB, 'INNSearch' );
    Name := FgetValueByFieldFromValueArr( datClDB, 'NAME' );
    Search1CByName := FgetValueByFieldFromValueArr( datClDB, 'Search1CByName' );

    Code1CStr := FgetValueByFieldFromValueArr( datClDB, 'Code' );
    isPrivate := FgetValueByFieldFromValueArr( datClDB, 'ISPRIVATE' );

    Res   := ShowCompareByClient( EDRPO, INNN, idClient, isPrivate, Code1CStr, Name, Search1CByName, SearchInDeleted1C, datClDB, datClSoap, ShowMessageError, ShowWhenDifferent );
    if ( Res = 2 ) then // Contragent not found in 1C
    begin

      if ( CreateIfNotFound ) then
      begin
        DatCli:= ConvertArrValueToDatCli( datClDB.param.data );
        New(PDat);

        try

          PDat^ := DatCli[0];
          Res   := FCreateClientSoap( PDat, ShowMessageError );

          if Res = 0 then
            FLink1CdataToDBData( DatCli[0].ContragentID, PDat^.Code );// = 0 then     // Set link Code ID from 1C to DB Company

        finally
          Dispose(PDat);
        end;

        if ( Res = 0)and(not ShowWhenDifferent) then Goto GotoLabelShowCompare;
      end
      else
      begin
        res:=0;
        WriteLog := False;
      end;

    end;

  if Res = 10 then Res:=0; // Data is Equal
  if Res = 11 then Res:=1; // Data is not Equal

  Result:=Res;
 finally

  if WriteLog then self.FUpdateLogMerge( idClient, 0, MenId , MyIfThen( Res = 0, 1, 0 ), FCheckReasonId(Res) ); // 0 -  Type Operation - Синхронізація Компнії;  Причина. 0 - Відсітнсть зв'язку; 1 - Чекає на узгодження менеджера

  FFreeMemDataArr(datClDB.param.data);
  FFreeMemDataArr(datClSoap.param.data);
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationContractDBAnd1CByClientId( MenId , idClient:Integer; WriteLog:Boolean=false;
                                                                   ShowMessageError:Boolean = false;AutoMerge:Boolean=false ):Integer;
var Res:Integer;
begin
 AutoMergeForUpdate := AutoMerge;

 try
  Res := self.ContractUpdateByClientId( idClient , false );
  result:=Res;
  if ( res = 2 ) then                                  // if not found Create
    result := self.ContractCreateByClientId( idClient , ShowMessageError  );

 finally
  if  (result<>-1)and( WriteLog ) then self.FUpdateLogMerge( idClient, 1, MenId, MyIfThen( result = 0, 1, 0 ), FCheckReasonId(Result) ); // 1 - TypeOperation Synhronize Contract
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.FCheckReasonId( Res:Integer ):Integer;
begin
  if Res = -2 then result:=0   // Not Connected
  else
  if (res<500)and(Res>0) then result:=1   // Wait Action From Manager
  else
  if Res=-3 then Result := -3
  else
  result:=-1;          // Uncknown Error
end;
//******************************************************************************
function TFunctCallSoap1C.SynhronizationContractDBAnd1CByContractId( MenId , idClient, idContract:Integer; WriteLog:Boolean=false;
                                                                     ShowMessageError:Boolean = false;AutoMerge:Boolean=false ):Integer;
var Res:Integer;
begin
 AutoMergeForUpdate := AutoMerge;

 try
   Res := self.ContractUpdateByContractId( idClient, idContract , ShowMessageError );
   result:=Res;
   if ( res = 2 ) then                                  // if not found Create
     result := self.ContractCreateByContractId(idClient, idContract , ShowMessageError  );

   if result = -3 then idContract := idClient;
 finally
   if (result<>-1)and( WriteLog ) then self.FUpdateLogMerge( idContract, 1, MenId, MyIfThen( result = 0, 1, 0 ), FCheckReasonId(Result) ); // 1 - TypeOperation Synhronize Contract
 end;
end;
//******************************************************************************
function TFunctCallSoap1C.FViewMergeSoapCurrSynhronize(ShowWhenDifferent:boolean=True;WriteLog:Boolean=false ):integer;
var Res:Integer;
    ColIndxOPERATIONID:Integer;
    ColIndxTypeOPERATION:Integer;
    ColIndxCheckReason:Integer;
    CurrOPERATIONID:Integer;
    CurrTypeOPERATION:Integer;
    CurrFocuseItemIndex:Integer;
    CurrReason:Variant;
    idCompany:Integer;
    CurrDataCurrencyRateArr:PDataCurrencyRateArr ;
    DatInvoice:PDatInvoiceShort;
begin
  ColIndxOPERATIONID := FViewLog.GetColumnByFieldName('OPERATIONID').Index;
  ColIndxTypeOPERATION := FViewLog.GetColumnByFieldName('TYPEOPERATION').Index;
  ColIndxCheckReason   := FViewLog.GetColumnByFieldName('CheckREASON').Index;

  CurrFocuseItemIndex:= FViewLog.Controller.FocusedRow.Index;
  CurrOPERATIONID := FViewLog.Controller.FocusedRow.Values[ ColIndxOPERATIONID ];
  CurrTypeOPERATION := FViewLog.Controller.FocusedRow.Values[ ColIndxTypeOPERATION ];
  CurrReason        := FViewLog.Controller.FocusedRow.Values[ ColIndxCheckReason ];
  Res:=-1;
  //if CurrReason = null then WriteLog := False;
  //****************************************************
  if (CurrTypeOPERATION = 0) then  // Synhronize Client
    Res := self.SynhronizationCompanyDBAnd1C( FMenId, CurrOPERATIONID, ShowWhenDifferent , FSearchInDeleted1C, WriteLog, FShowMessageError );
  //****************************************************
  if (CurrTypeOPERATION = 1) then  // Synhronize Contract
  begin
    if ( VarToInt(CurrReason) <> -3 ) then
    begin
      idCompany := GetClientIdByContractId( CurrOPERATIONID , Self.FConDBParam );
      Res := self.SynhronizationClientAndContractDBAnd1CByContractId( FMenId, idCompany, CurrOPERATIONID, WriteLog, FShowMessageError );
    end
    else Res := SynhronizationContractDBAnd1CByClientId( FMenId , CurrOPERATIONID, WriteLog, FShowMessageError );
  end;
  //****************************************************
  if CurrTypeOPERATION = 2 then  // Synhronize Bank Account
    Res := self.SynhronizationClientAndBankAccountsDBAnd1C( FMenId, CurrOPERATIONID, ShowWhenDifferent, FSearchInDeleted1C, WriteLog, FShowMessageError );
  //****************************************************
  if CurrTypeOPERATION = 3 then  // Synhronize Invoice
  begin
    DatInvoice := GetInvoiceDataByInvoiceId( CurrOPERATIONID , Self.FConDBParam  );

    try
      if DatInvoice <>nil then
        Res := self.SynhronizationClientContractAndInvoiceDBAnd1C(FMenId, DatInvoice^.ContragentID, DatInvoice^.ContractId, DatInvoice^.OrderId, DatInvoice^.InvoiceNumber, FSearchInDeleted1C, WriteLog, FShowMessageError, false, False );
      //Res := self.SynhronizationClientAndInvoiceDBAnd1C( FMenId, DatInvoice^.ContragentID,DatInvoice^.OrderId,DatInvoice^.InvoiceNumber, FSearchInDeleted1C, WriteLog, FShowMessageError  );

    finally
      if DatInvoice <> nil then Dispose(DatInvoice);
    end;
  end;
  //****************************************************
  if CurrTypeOPERATION = 4 then  // Synhronize Currency
  begin
    CurrDataCurrencyRateArr := GetCurrnecyDateByCurrencyCommerceId(CurrOPERATIONID, Self.FConDBParam );
    try
      if CurrDataCurrencyRateArr <> nil then
        Res:= self.UpdateCurrencyRate( FMenId, [CurrDataCurrencyRateArr^[0].CurrencyId], CurrDataCurrencyRateArr^[0].aDateTime, WriteLog, FShowMessageError );
    finally
      if CurrDataCurrencyRateArr<>nil then Dispose(CurrDataCurrencyRateArr);
    end;
  end;
  //****************************************************
  if CurrTypeOPERATION = 5 then  // Synhronize Invoice final
  begin
    DatInvoice := GetInvoiceDataByInvoiceId( CurrOPERATIONID , Self.FConDBParam  );

    try
    if DatInvoice <>nil then  //SynhronizationFinalyInvoiceDBAnd1C
      Res := self.SynhronizationClientContractAndInvoiceDBAnd1C( FMenId, DatInvoice^.ContragentID, DatInvoice^.ContractId, DatInvoice^.OrderId, DatInvoice^.InvoiceNumber, FSearchInDeleted1C, WriteLog, FShowMessageError, false, True );
      //Res := self.SynhronizationClientAndInvoiceDBAnd1C( FMenId, DatInvoice^.ContragentID,DatInvoice^.OrderId,DatInvoice^.InvoiceNumber, FSearchInDeleted1C, WriteLog, FShowMessageError  );

    finally
      if DatInvoice <> nil then Dispose(DatInvoice);
    end;
  end;
  //****************************************************
  result:=Res;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FSetFocusedRowAfterRefresh(View:TcxGridDBTableView; TopRowIndex , CurrFocuseItemIndex:Integer);
begin
  if CurrFocuseItemIndex <= View.DataController.RecordCount then
   begin
    View.Controller.FocusedRowIndex:=CurrFocuseItemIndex;//  View.DataController.RecordCount-1;
    View.DataController.SelectRows(View.Controller.FocusedRowIndex , View.Controller.FocusedRowIndex);
    FViewLog.Controller.TopRowIndex := TopRowIndex;
   end;
end;
//*******************************************************
procedure TFunctCallSoap1C.FViewMergeSoap1CDblClick(Sender: TObject);
var Res:Integer;
    CurrFocuseItemIndex:Integer;
    CurrTopRowIndex:Integer;
begin
  if FViewLog = nil then Exit;

  CurrTopRowIndex:= FViewLog.Controller.TopRecordIndex;
  CurrFocuseItemIndex:= FViewLog.Controller.FocusedRow.Index;

  Res := FViewMergeSoapCurrSynhronize( false , true );
  if (Res = -1) or (Res = 0) then
  begin
    if FViewLog.DataController.DataSource.DataSet is TIbQuery then
      TIbQuery(FViewLog.DataController.DataSource.DataSet).Transaction.Commit;

    FViewLog.DataController.DataSource.DataSet.Open;
    FSetFocusedRowAfterRefresh( FViewLog, CurrTopRowIndex , CurrFocuseItemIndex );
  end;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FShowUserSelfMergeLogBut(Sender: TObject);
begin
  FRefreshMegeLog1CUser( DBMergeLog1C , FMenId, 0 );
  TSpeedButton(Sender).Down:=True;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FShowUserAllMergeLogBut(Sender: TObject);
begin
  FRefreshMegeLog1CUser( DBMergeLog1C , FMenId, 1 );
  TSpeedButton(Sender).Down:=True;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FShowAdminSynhrinizeMergeLogBut(Sender: TObject);
begin
 FRefreshMegeLog1CAdmin( DBMergeLog1C , TfrmMergeSoap(TSpeedButton(Sender).Owner).ImComboBoxForDateIndex.EditValue , 0 );
 TSpeedButton(Sender).Down:=True;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FShowAdminNotSynhrinizeMergeLogBut(Sender: TObject);
begin
 FRefreshMegeLog1CAdmin( DBMergeLog1C , TfrmMergeSoap(TSpeedButton(Sender).Owner).ImComboBoxForDateIndex.EditValue , 1 );
 TSpeedButton(Sender).Down:=True;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FShowAdminAllMergeLogBut(Sender: TObject);
begin
 FRefreshMegeLog1CAdmin( DBMergeLog1C , TfrmMergeSoap(TSpeedButton(Sender).Owner).ImComboBoxForDateIndex.EditValue , 2 );
 TSpeedButton(Sender).Down:=True;
end;
//******************************************************************************
procedure TFunctCallSoap1C.FButSynhronizeAllButClick(Sender: TObject);
begin
 FSynhronizationDBAnd1CByViewLogMerge( FViewLog, FMenId, FShowWhenDifferent, FSearchInDeleted1C, FWriteLog, FShowMessageError)
end;
//******************************************************************************
Function TFunctCallSoap1C.FSynhronizationDBAnd1CByViewLogMerge( View:TcxGridDBTableView;MenId:Integer=-1; ShowWhenDifferent:boolean=True; SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false ):integer;
var i:integer;
    Res:Integer;
    CurrFocuseItemIndex:Integer;
    TopRowIndex:Integer;
//*******************************************************
begin
  CurrFocuseItemIndex:= View.Controller.FocusedRow.Index;
  TopRowIndex := View.Controller.TopRecordIndex;

  FSetFocusedRowAfterRefresh( View,TopRowIndex, CurrFocuseItemIndex );
  //****************************************
  While View.Controller.FocusedRow<>nil do
  begin
    Res := FViewMergeSoapCurrSynhronize(ShowWhenDifferent,WriteLog);

    if Res = 0 then
    begin
      TIbQuery(View.DataController.DataSource.DataSet).Transaction.Commit;
      View.DataController.DataSource.DataSet.Open;
    end
      else Break;

    FSetFocusedRowAfterRefresh( View, TopRowIndex , CurrFocuseItemIndex );
  end;
  //********************************************
  if ( View.DataController.RecordCount = 0 ) then
    MyShowMessageDlg('Синхронізація пройшла успішно.', mtInformation, but_OK );
end;
//******************************************************************************
Procedure TFunctCallSoap1C.FRefreshDBLog1CAdmin(var DB:TDataset; Sql:String='');
begin
  if (DB.Active)and(DB is TIBCustomDataSet) then
    TIBCustomDataSet(DB).Transaction.Commit;

  if Sql<>'' then
    QueryChangeSQL(DB,Sql);

  DB.Open;
end;
//******************************************************************************
function TFunctCallSoap1C.FRefreshMegeLog1CAdmin(var DB:TDataset; DateIndex,ButTypeSynhronize:Integer):integer;
var Sql:string;
    OptSel:TOptionSelectLog;
begin
  result:= -1;
  OptSel := OptSelLogAll;
  if ButTypeSynhronize = 0 then OptSel := OptSelLogMerge;
  if ButTypeSynhronize = 1 then OptSel := OptSelLogNotMerge;
  if ButTypeSynhronize = 2 then OptSel := OptSelLogAll;

  Sql:=GetSQLMergeSoap1C( -1 , True, OptSel, DateIndex );
  FRefreshDBLog1CAdmin(DB, Sql);
  Result := ButTypeSynhronize;
end;
//******************************************************************************
Function TFunctCallSoap1C.FRefreshMegeLog1CUser( var DB:TDataset; MenId , ButTypeSynhronize:Integer):Integer;
var Sql:string;
    ShowForAllUsers:Boolean;
begin
   result:=-1;
   Sql := GetSQLMergeSoap1C( -1 , True  );
   ShowForAllUsers:= ButTypeSynhronize = 1;

   Sql := GetSQLMergeSoap1C( MenId, ShowForAllUsers );
   FRefreshDBLog1CAdmin(DB, Sql);
   result:= ButTypeSynhronize;
end;
//******************************************************************************
Function TFunctCallSoap1C.FFirstRunRefresh(var DB:TDataset;MenId:Integer;IsAdmin:Boolean;frmMergeSoap1C:TfrmMergeSoap ):Integer;
function GetRecCount:Integer;
begin
  if not DB.Active then result := 0
  else result :=DB.RecordCount;
end;

var i:integer;
begin
  i:=0;

  if (not IsAdmin) then
   begin
     while GetRecCount = 0 do
     begin
       result:= FRefreshMegeLog1CUser(DB, MenId, i );
       Inc(i);
       if i>1 then Break;
     end;
   end
   else
   begin
    while GetRecCount = 0 do
    begin
     result := FRefreshMegeLog1CAdmin( DB , frmMergeSoap1C.ImComboBoxForDateIndex.ItemIndex , i);
     Inc(i);
     if i>2 then Break;
    end;
   end;
end;
//******************************************************************************
Function TFunctCallSoap1C.ShowFindMergeSoap1CLog( MenId:Integer; isAdmin:Boolean=False; ShowWhenDifferent:boolean=True; SearchInDeleted1C:Boolean=False;WriteLog:Boolean=false; ShowMessageError:Boolean = false;ShowWhenNotEmpty:Boolean=true ):Integer;
var frmMergeSoap1C:TfrmMergeSoap;
    DB: TDataset;
    Res:Integer;
    CurrOPERATIONID:Integer;
    ColIndxOPERATIONID:Integer;
    CurrButTypeSynhronize:Integer;
begin
  try
   Application.CreateForm( TfrmMergeSoap, frmMergeSoap);

   if self.FConDBParam.IBDatabaseConnection <> nil then
     DB:= UnitIbQuery.CreateDataSet( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password,nil, '');
   if self.FConDBParam.ADOConnection <> nil then
    DB:=UnitADOQuery.CreateDataSet( self.FConDBParam.ADOConnection, '',cmdText, False );

   DBMergeLog1C:=DB;

   //*****************************************
   CurrButTypeSynhronize := FFirstRunRefresh(DBMergeLog1C, MenId,isAdmin, frmMergeSoap );
   //*****************************************
   FViewLog := frmMergeSoap.ViewMergeSoap1C ;
   FMenId   := MenId;
   FIsAdmin := isAdmin;
   FShowWhenDifferent := ShowWhenDifferent;
   FSearchInDeleted1C := SearchInDeleted1C;
   FWriteLog := WriteLog;
   FShowMessageError  := ShowMessageError;
   //*****************************************
   if isAdmin then frmMergeSoap.Caption :=  CaptionLogMergeSoap1CAdmin
   else frmMergeSoap.Caption :=  CaptionLogMergeSoap1CUser;

   frmMergeSoap.GridLogMergeSoap.Levels[0].GridView := frmMergeSoap.ViewMergeSoap1C;
   frmMergeSoap.PageControlView.ActivePage := frmMergeSoap.TabView;
   frmMergeSoap.PageControlView.HideTabs   := True; 
   frmMergeSoap.DSMergeSoap.DataSet := DBMergeLog1C;
   frmMergeSoap.ButSynhronizeAll.OnClick   := FButSynhronizeAllButClick;
   frmMergeSoap.ViewMergeSoap1C.OnDblClick := FViewMergeSoap1CDblClick;
   frmMergeSoap.ButSelfMergeLog.OnClick    := FShowUserSelfMergeLogBut;
   frmMergeSoap.ButAllMergeLog.OnClick     := FShowUserAllMergeLogBut;

   frmMergeSoap.ButShowJustSynhronize.OnClick   := FShowAdminSynhrinizeMergeLogBut ;
   frmMergeSoap.ButShowJustNotSynhronize.OnClick:= FShowAdminNotSynhrinizeMergeLogBut;
   frmMergeSoap.ButShowJustAll.OnClick          := FShowAdminAllMergeLogBut;
   frmMergeSoap.ResreshButDown( isAdmin, CurrButTypeSynhronize );
   //*****************************************
   if ((ShowWhenNotEmpty) {and (DBMergeLog1C.RecordCount <> 0)}) or(not ShowWhenNotEmpty) then
     frmMergeSoap.ShowModal;
   //*****************************************     
  finally
    DestroyDB( DB );

    frmMergeSoap.Free;
  end;
end;
//******************************************************************************
function TFunctCallSoap1C.FGetBillingData( aData:TPaymentBillingDataRec ) : TPaymentBillingData;
var aDateTime:TXSDateTime;
begin
  aDateTime:= TXSDateTime.Create;
  aDateTime.AsDateTime := aData.BillDate;

  result := TPaymentBillingData.Create;
  result.OrderId   := aData.OrderId;     // id замовлення
  result.ExchCurrId:= aData.ExchCurrId;  // id валюти
  result.BillingNo := aData.BillingNo;   // Номер рахунку
  result.TotalSum  := aData.TotalSum;    // Сума
  result.PayMethod := aData.PayMethod;   // метод оплати
  result.ManagerId := aData.ManagerId;   // id Manager
  result.BillNo    := aData.BillNo;      // номер платіжного доручення
  result.BillDate  := aDateTime;         // дата і час оплати
  result.DocTypeId := aData.DocTypeId;   // 0
end;
//******************************************************************************
{function GetInvoiceDataPackedByByDataset( DS:TDataset ) : PPaymentBillingDataRec;
begin
  result:= nil;
  if DS.IsEmpty then Exit;
  New(result);
  result^.OrderId := DS.fieldByName('ORDERID').AsInteger;
  result^.ExchCurrId := DS.fieldByName('ORDERID').AsInteger;
end;
//******************************************************************************}
{function GetInvoiceDataDBClientByCODE1CId(CODEID1C:string):PPaymentBillingDataRec;
var DS:TIBQuery;
begin
  try
    result:=nil;
    DS:=CreateDataSet( ConnectToDB, Login, Password, GetSQLForInvoiceDataByCODEID1C(CODEID1C) );
    if (DS <> nil)and(DS.RecordCount<>0) then
      result := GetInvoiceDataPackedByByDataset( DS );

  finally
    DestroyDS( DS );
  end;
end;
//******************************************************************************}
Function TFunctCallSoap1C.UpdateBillingData( aBank:PDatCliAccounts; aData:PPaymentBillingDataRec; ShowMessageError:Boolean = false ):Integer;
var ElemBank:TBankSoap;
    BillingData:TPaymentBillingData;
    HTTPRIO : THTTPRIO;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   SetParamHTTPRIOTourSoap( HTTPRIO, self.FParamConUrlTourSoap );
   if aData<> nil then
   begin
     try
       if aBank <> nil then
         ElemBank:= FConvertDataBankTourSoap( aBank^ )
       else ElemBank := nil;

       BillingData := FGetBillingData( aData^ );

       result := (HTTPRIO as ITourSoup).UpdateBillingData( aData^.ManagerId, TourSoapUser, TourSoapPassword, ElemBank,  BillingData );
       if result = -1 then

       if ( result <> 0 ) and ( ShowMessageError ) then
       begin
       
         case result of
          -1 : MyShowMessageDlg( 'Нема зв''язку з сервером або логін чи пароль введено не вірно', mtError, but_OK);
           1 : MyShowMessageDlg( 'Помилка при оплаті', mtError, but_OK );
         end;

       end;

     finally
       BillingData.Free;
       BillingData := nil;
       HTTPRIO:= nil;
     end;
   end;
end;
//******************************************************************************

const
SQLPrivateClientWithIdentCode = ' select distinct c.companyid,  c.identcode from TourGroups g '+
        ' left join orders o on o.tourgroupid = g.tourgroupid '+
        ' left join clients cl on cl.clientid = o.clientid '+
        ' left join companies c on c.companyid = cl.companyid '+

        ' where TourDate > ''01.01.2013'' and o.state <> 5 and c.isprivate = ''T'' '+
        ' and privateid is not null and c.identcode is not null ' ;

SQLPrivateClientNoIdentCode = ' select distinct c.companyid,  t.identcode from TourGroups g '+
    ' left join orders o on o.tourgroupid = g.tourgroupid '+
    ' left join clients cl on cl.clientid = o.clientid '+
    ' left join companies c on c.companyid = cl.companyid '+
    ' left join touristankets t on t.touristid = c.privateid '+
    ' left join tourist tr on tr.clientid = c.privateid '+

    ' where TourDate > ''01.01.2013'' and o.state <> 5 and c.isprivate = ''T'' ' +
    ' and privateid is not null and (t.identcode is null or t.identcode = '''') ';

procedure TFunctCallSoap1C.SynchronizePrivateByIDENTCodeAndName( aSkipWhenConfuse:Boolean; withIdentCode:Boolean );
var DS:TDataset;
    SQL :string;
    Res:Integer;
    Progres:TProgressFormProp;
begin
  if withIdentCode then SQL := SQLPrivateClientWithIdentCode
  else SQL := SQLPrivateClientNoIdentCode;
  //*********************************************************
  try
    self.SkipWhenConfuse:=aSkipWhenConfuse;

    if self.FConDBParam.IBDatabaseConnection <> nil then
    begin
      DS:=UnitIBQuery.CreateDataSet( self.FConDBParam.PathDB, self.FConDBParam.UID, self.FConDBParam.Password, nil, SQL );
      TIBQuery(DS).FetchAll;
    end;

    if self.FConDBParam.ADOConnection <> nil then
      DS:= UnitADOQuery.CreateDataSet( self.FConDBParam.ADOConnection, SQL );

    DS.First;
    Progres := ShowProgress( 'Зачекайте' , DS.RecordCount );

    while not DS.Eof do
    begin

      Res := self.SynhronizationCompanyDBAnd1C( 1, DS.FieldByName('companyid').AsInteger, False, true, true, true,true, false );
      DS.Next;

      Progres.ProgressBar.Position := Progres.ProgressBar.Position + 1;
      Progres.ProgressBar.Repaint;
      Progres.ProgressCaption.Repaint;

    end;

  finally
    ClosedProgress( Progres.FormProgres );
    DestroyDB( DS );
  end;
end;

//******************************************************************************
function ReadParamCon(FileIni:string;KeySec:String):TParamConUrl;
begin
  result.defWSDL:= ReadIniFile(FileIni, KeySec,'WSDL');
  result.defURL := ReadIniFile(FileIni, KeySec,'URL');
  result.defSvc := ReadIniFile(FileIni, KeySec,'Svc');
  result.defPrt := ReadIniFile(FileIni, KeySec,'Prt');
end;
//******************************************************************************
function ReadParamConUrl1C(FileIni:String):TParamConUrl;
begin
  result := ReadParamCon(FileIni,'SOAP1C');
end;
//******************************************************************************
function ReadParamConUrlTourSoap(FileIni:String):TParamConUrl;
begin
  result := ReadParamCon(FileIni,'SOAPTOUR');
end;
//******************************************************************************

end.


 //function GetClientByID(iid: Integer;var ResData:TDatCli; ShowMessageError:Boolean =false):integer;stdcall;external DllSoap1c;
 //function GetClientByID( id: Integer; var ResData:PRes; ShowMessageError:Boolean =false ):Integer; stdcall; external DllSoap1c;

 {CreateClient = function ( id:Integer; ConnectToDB, Login, Password:String; ShowMessageError:Boolean =false  ):Integer; stdcall;
 UpdateClient = function ( id:Integer; ConnectToDB, Login, Password:String; ifNotFoundCreate:Boolean = False; ShowMessageError:Boolean =false ):Integer; stdcall;
 DeleteClient = function ( id: Integer; ShowMessageError:Boolean =false ):Integer; stdcall;

 CreateContract = function( id:Integer; ConnectToDB, Login, Password:String; ShowMessageError:Boolean =False ): Integer; stdcall;
 UpdateContract = function( id:Integer; ConnectToDB, Login, Password:String; ifNotFoundCreate:Boolean =False ; ShowMessageError:Boolean =false ): Integer; stdcall;
 DeleteContract = function( ContractID: Integer; ShowMessageError:Boolean ): Integer; stdcall;

 // ClientByEDRPOU = function( Edrpo: Int64; ShowMessageError:Boolean = false ):Integer; stdcall;  //var ResData:TDatCli;
  GetClientByID  = function ( id: Integer; var ResData:TRes; ShowMessageError:Boolean =false ):Integer; stdcall;
  }


// function CreateClient(id:Integer; ConnectToDB, Login, Password:String; ShowMessageError:Boolean =false  ):Integer;  stdcall;   external 'Soap1C.dll';
// function DeleteClient(const ContragentID: Integer; ShowMessageError:Boolean =false ):Integer;   stdcall;   external 'Soap1C.dll';
// function UpdateClient( id:Integer; ConnectToDB, Login, Password:String; ifNotFoundCreate:Boolean = False; ShowMessageError:Boolean =false ):Integer; stdcall;   external 'Soap1C.dll';

// function CreateContract( id:Integer; ConnectToDB, Login, Password:String; ShowMessageError:Boolean =false ): Integer; stdcall; external 'Soap1C.dll';
// function UpdateContract(id:Integer; ConnectToDB, Login, Password:String; ifNotFoundCreate:Boolean = False; ShowMessageError:Boolean =false ): Integer; stdcall; external 'Soap1C.dll';
// function DeleteContract(const ContractID: Integer; ShowMessageError:Boolean ): Integer; stdcall;   external 'Soap1C.dll'

