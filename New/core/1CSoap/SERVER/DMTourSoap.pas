{ SOAP WebModule }
unit DMTourSoap;

interface

uses
  SysUtils, Classes, HTTPApp, InvokeRegistry, WSDLIntf, TypInfo,
  WebServExp, WSDLBind, XMLSchema, WSDLPub, SOAPPasInv, SOAPHTTPPasInv,
  SOAPHTTPDisp, WebBrokerSOAP, IBDatabase, DB, UnitIBQuery,IBQuery,
  Variants, ActiveX, Forms,UnitProc,UnitPaymentBilling, TourSoupIntf,UnitGenerateSQL,
  Provider, ADODB, Types,ComObj,ADOInt,UnitADOQuery, UnitApiSite,UnitSQLData,cxDBTL,cxTL,UnitSqlDB;

const MesError='Error Connect to Database or wrong Sql';
type
   TDatCliAccounts = record
     ContragentID: Integer;
     EDRPOU:WideString;

     AccountID:Integer;
     AccountNO:WideString;
     BankName: WideString;
     BankMFO : WideString;
     BankAddres:WideString;
     BankActive:Integer;
     MarkedToDelete:Boolean;
   end;

 TUserAutParam = record
   Login:WideString;
   Password:WideString;
 end;


  TWebDM = class(TWebModule)
    HTTPSoapDispatcher: THTTPSoapDispatcher;
    HTTPSoapPascalInvoker: THTTPSoapPascalInvoker;
    WSDLHTMLPublish: TWSDLHTMLPublish;

    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModuleCreate(Sender: TObject);
  private
    function FgetSQlCheckInvoice( codeid1c:Widestring;PayDate:TDateTime ):Widestring;
    function FgetSQlCheckUserByEDRPOAndEmail(EDRPO,Email:Widestring):Widestring;

    Function FUpdateDataClientAccountsDB( MenId:Integer; UserName,Password :WideString;  DatCli : TDatCliAccounts ):Integer;
    function FRecordsetToByteDynArray(_rec:_Recordset):TByteDynArray;
    { Private declarations }
  public
    function GetPathDB:WideString;
    function GetPathWeb: WideString;
    function GetPathWebAllCountry: WideString;
    function GetPathWebDescriptCountry( idCountry, idLng:Integer ): WideString;

    function GetUserAutParamByKey(Key:widestring):TUserAutParam;
    function CheckInvoice( UserName,Password:WideString; codeid1c:Widestring;PayDate:TDateTime ):Integer;
    function UpdateBillingData( UserName,Password :WideString; PaymentBillingData: TPaymentBillingData ):integer;
    function UpdateBankData( MenId :Integer; UserName, Password :WideString; aBank : TBankSoap ):Integer;
    function UpdateUser( UserData:TTourUserData ):Integer;
    function CheckUserEmail(EDRPO,Email,Key:Widestring):Boolean;
    function GetBankXML:TByteDynArray;
    function GetBankXML2:String;
    function GetTourGroupRate( Login,Password:String; TourGrRateParam : TTourGroupRateInputParam;  FormatData : Integer ) : String;stdcall;
    function GetCountriesList( Login,Password:String; idLng:integer; FormatData:Integer ):string;stdcall;
    function GetCountryInfo( Login,Password:String; id,idLng:integer; FormatData : Integer ):String;
    function GetLanguages( Login,Password:String; idLng:integer; ActiveTranslate:integer; FormatData:Integer ):string;

    function GetRateTourGroupOnDate_Old( Login, Password:String; TourId,TouristAge:Integer; aDate:TDateTime; FormatData:Integer ):String;stdcall;
    function GetAllServicesRateTourGroupOnDate_Old( Login,Password:String; TourGroupId,Age:Integer; aDate:TDateTime;Hidden:Integer; FormatData:Integer ):String; stdcall;
    function GetClientData(  Login,Password:String; IdClient:Integer;  FormatData:Integer ):String;stdcall;
    function CheckClientByEDRPO( Login,Password:String; EDRPOU:Widestring; FormatData:Integer ):String; stdcall;
    { Public declarations }
  end;

var
  WebDM: TWebDM;

implementation

{$R *.dfm}

procedure TWebDM.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  WSDLHTMLPublish.ServiceInfo(Sender, Request, Response, Handled);
end;

procedure TWebDM.WebModuleCreate(Sender: TObject);
begin
  //TourMan DB
  //ConfigurationSettings.AppSettings.Get(´postgresconn.ConnectionString´);
  //PrepareConnectDatabeseTourManTest ( IBDatabase, True );
  //PrepareConnectDatabeseTourManWork(IBDatabase,True);
end;

function TWebDM.FgetSQlCheckInvoice( codeid1c:Widestring; PayDate:TDateTime ):Widestring;
begin
  result :='select * from CHECK_INVOICE_PROC('+''''+codeid1c+''''+','+''''+DateTimeToStr(PayDate)+''''+')';
  //result := 'select * from CHECK_INVOICE_PROC(1,'+'''01.02.2018'+''')';
end;

function TWebDM.FgetSQlCheckUserByEDRPOAndEmail(EDRPO,Email:Widestring):Widestring;
begin
  result :='select COMPANIES.identcode, E.CompanyId, E.OfficeId, E.EmailId, E.LinkEmailId,'+
  ' Emails .Email, Emails .Alias, Emails .IsEnabled, Emails .IsEnabled2, E.IsDefault from COMPANIES '+
  ' left join CompEmails E on E.companyid = COMPANIES.companyid '+
  ' left join Emails on Emails.emailid = E.linkemailid '+
  ' where E.IsDefault =''T'' and Emails.Email='''+Email+''' and COMPANIES.identcode = '''+EDRPO+'''';
end;

function TWebDM.GetPathDB: WideString;
var PathToWebConfig:WideString;
begin
  PathToWebConfig := MyGetModulePath+'web.config';
  result := GetParamWebConfig( PathToWebConfig, 'appSettings','Database' );
end;

function TWebDM.GetPathWeb: WideString;
var PathToWebConfig:WideString;
begin
  result := MyGetModulePath;
end;

function TWebDM.GetPathWebAllCountry: WideString;
begin
  result := GetPathWeb+'WEB\TEMPLATE\CONTENTS\COUNTRIES\DESCRIPTION\';
end;

function TWebDM.GetPathWebDescriptCountry( idCountry, idLng:Integer ): WideString;
begin
  result := GetPathWebAllCountry + AddNolForLengthNumber( IntToStr( idCountry ), 4 )+ '\'+
                                   AddNolForLengthNumber( IntToStr( idLng ), 4 )+'\' ;
end;

function TWebDM.GetUserAutParamByKey(Key:widestring):TUserAutParam;
var PathToWebConfig:WideString;
begin
  PathToWebConfig := MyGetModulePath + 'web.config';
  result.Login := GetParamWebConfig( PathToWebConfig, 'appSettings','User_' + Key );
  result.Password := GetParamWebConfig( PathToWebConfig, 'appSettings','Password_' + Key );
end;

function TWebDM.CheckInvoice( UserName, Password:WideString; codeid1c:Widestring; PayDate:TDateTime ):Integer;
var PathDB:WideString;
    DB:TIBQuery;
begin
  PathDB := GetPathDB;
  //PrepareConnectDatabaseByPathAndUserName( IBDatabase,GetPathDB, UserName,Password, True );
  result := -1;
  try
   //try
    //result :=2;
    DB := UnitIBQuery.CreateDataSet( PathDB, UserName, Password, FgetSQlCheckInvoice( codeid1c, PayDate ) );
    //DB := CreateDataSet( PathDB, 'SYSDBA', 'masterkey', FgetSQlCheckInvoice( codeid1c, PayDate ) );
    //if DB.Active then result :=2;

    if (DB.Active) and (DB.FieldCount<>0) then
      result:= DB.Fields[0].AsInteger;
   //except
   // result := -5;
   //end;
  finally
    UnitIBQuery.DestroyDS( DB );
  end;
end;

function TWebDM.UpdateBillingData( UserName,Password :WideString; PaymentBillingData: TPaymentBillingData ):integer;
var PathDB:string;
begin
  PathDB := GetPathDB;
  result := PaymentBilling( PathDB, UserName, Password, PaymentBillingData );
end;

Function TWebDM.FUpdateDataClientAccountsDB( MenId:Integer; UserName,Password :WideString;  DatCli : TDatCliAccounts ):Integer;
var i:Integer;
    SQL:WideString;
    ResCount:Integer;
    CurrRes:Integer;
    PathDB:string;
begin
  ResCount:=0;
  PathDB := GetPathDB;

  SQL:='EXECUTE PROCEDURE SET_UPDATE_CLIENT_ACCOUNT('+MyIfThen(DatCli.AccountID<>0, IntToStr( DatCli.AccountID),'null')+','+IntToStr( DatCli.ContragentID )+','+
              ''''+DatCli.AccountNO+''''+','+ ''''+DatCli.BankName+''''+','+''''+DatCli.BankMFO+''''+','+''''+DatCli.BankAddres+''''+','+IntToStr(MenId)+')';

  Result := UpdateSql( PathDB, UserName, Password, SQL  );
  Result := CurrRes;
end;
//******************************************************************************
function TWebDM.UpdateBankData( MenId :Integer; UserName, Password :WideString; aBank : TBankSoap ):Integer;
var DatCli : TDatCliAccounts;
begin
  DatCli.AccountID := aBank.AccountID;
  DatCli.ContragentID := aBank.ContragentID;

  DatCli.BankMFO:= aBank.MFO;
  DatCli.BankName:= aBank.Name;
  //DatCli.CorrAccount:= aBank.CorrAccount;
  //DatCli.City:= aBank.City;
  DatCli.BankAddres:=aBank.Address;
  //DatCli.Phones:= aBank.Phones;
  DatCli.EDRPOU:= aBank.EDRPOU;

  result := FUpdateDataClientAccountsDB( MenId, UserName, Password, DatCli );
end;
//******************************************************************************
//function TWebDM.FGetIdComercialNameById()
//******************************************************************************
function TWebDM.CheckUserEmail( EDRPO, Email, Key:Widestring ):Boolean;
var PathDB :string;
    AutParamByKey : TUserAutParam;
    Sql : WideString;
    DB : TIBQuery;
begin
  PathDB := GetPathDB;
  AutParamByKey := GetUserAutParamByKey( Key );
  Sql := FgetSQlCheckUserByEDRPOAndEmail( EDRPO, Email );
  DB := UnitIBQuery.CreateDataSet( PathDB, AutParamByKey.Login, AutParamByKey.Password, Sql );

  try
    Result := not DB.IsEmpty;
  finally
    UnitIBQuery.DestroyDS( DB );
  end;
end;
//******************************************************************************
function TWebDM.UpdateUser( UserData:TTourUserData ):Integer;
var SqlGenObj:TSqlGenerate;
    SqlAddresObj:TSqlGenerate;
begin
  try
    //UserData.Legal.legal_doc
    SqlGenObj := TSqlGenerate.create('COMPANIES');
    SqlAddresObj := TSqlGenerate.create('COMPOFFICES');   //  TRADENAMES
    // UserData.Legal.commercial_name
    //UserData.addres[0].
    SqlGenObj.AddFieldValue( 'COMPANYID', IntToStr( UserData.id ) );
    SqlGenObj.AddFieldValue( 'ADDDATE',   DateToStr( UserData.created ) );
    SqlGenObj.AddFieldValue( 'NAME', UserData.Legal.org_name );
    SqlGenObj.AddFieldValue( 'TaxPayCode',  UserData.Legal.legal_number );
    SqlGenObj.AddFieldValue( 'TAXPAYREGNO', UserData.Legal.tax_pdv_ipnumber );
    //SqlGenObj.AddFieldValue( '',  UserData.Legal.signatory_firstname );
    SqlGenObj.AddFieldValue( 'ORGFORMID', IntToStr( UserData.Legal.org_type ) );
    
    //UserData.Legal.signatory_attorney_doc_date
    //UserData.Legal.signatory_attorney_doc_by
  finally
    SqlGenObj.Free;
  end;
 // UserData.id
 // SqlMain := 'Update COMPANIES set '
end;
//******************************************************************************
function TWebDM.FRecordsetToByteDynArray( _rec:_Recordset ):TByteDynArray;
var XML:string;
begin
  XML := RecordsetToXML( _rec );
  SetLength(result, Length(XML) * sizeof(Char));
  Move(PChar(XML)^, PByte(result)^, Length(result));
end;
//******************************************************************************
function TWebDM.GetBankXML:TByteDynArray;
var xmlContent:TByteDynArray;
    PathDB:string;
    DB:TAdoDataset;
begin
  PathDB := GetPathDB;
  DB := UnitADOQuery.CreateDataSet(PathDB,'SYSDBA','masterkey','select * from BANKS');
  try
   Result := FRecordsetToByteDynArray(  DB.Recordset );
  finally
    UnitADOQuery.DestroyDS( DB );
  end;
end;
//******************************************************************************
function TWebDM.GetBankXML2:String;
var xmlContent:TByteDynArray;
    aStr:Widestring;
    Recordset: _Recordset;
    RS: Variant;
    Stream: TStringStream;
    DB:TAdoDataset;
    PathDB:string;
  //aStr := RecordsetToXML( ADOBank.Recordset );
begin
  PathDB := GetPathDB;
  DB := UnitADOQuery.CreateDataSet(PathDB,'SYSDBA','masterkey','select * from BANKS');

  try
    Result := RecordsetToXML(  DB.Recordset );
  finally
    UnitADOQuery.DestroyDS( DB );
  end;

end;
//******************************************************************************
function TWebDM.GetTourGroupRate( Login,Password:String; TourGrRateParam : TTourGroupRateInputParam;  FormatData : Integer ) : String;
var PathDB:string;
    DB:TAdoDataset;
    Sql:string;
    ApiSite : TApiSite;
    //AList:TstringList;
begin
  PathDB := GetPathDB;
  Sql := GetSQlTourGroupsRate( TourGrRateParam );
  //AList:=TstringList.Create;
  //AList.Add( Sql );
  //AList.SaveToFile( MyGetModulePath +'Sql.txt');
  try

    DB := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
    ApiSite := TApiSite.Create;

    if DB <> nil then
    begin
      if FormatData = 0 then Result := ApiSite.MakeJsonToursAndRates( DB, TourGrRateParam.isAgent ); // JSon
      if FormatData = 1 then Result := ApiSite.MakeXMLToursAndRates ( DB, TourGrRateParam.isAgent ); //Xml
      if FormatData = 999 then Result := RecordsetToXML(  DB.Recordset ); // Xml Dataset
    end
    else result := MesError;

  finally
    ApiSite.Free;
    UnitADOQuery.DestroyDS( DB );
  end;
end;
//******************************************************************************
function TWebDM.GetCountriesList( Login,Password:String; idLng:integer; FormatData:Integer ):string;
var PathDB:string;
    DB:TAdoDataset;
    Sql:string;
    ApiSite : TApiSite;
    var ADOCon:TAdoConnection;
begin
  PathDB := GetPathDB;
  Sql := GetSQlCountriesList( idLng );

  try
    try
      DB := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
      ApiSite := TApiSite.Create;

      if DB <> nil then
      begin
        if FormatData = 0 then Result := ApiSite.MakeJsonCountries( DB ); // JSon
      end
      else result := MesError;

    except on E: exception do
      result := e.Message;
    end;

  finally
    ApiSite.Free;
    UnitADOQuery.DestroyDS( DB );
  end;
end;
//******************************************************************************
function TWebDM.GetCountryInfo( Login,Password:String; id,idLng:integer; FormatData : Integer ):String;
var PathDB:string;
    DB:TAdoDataset;
    DBSection:TAdoDataset;
    Sql:string;
    SqlSection:string;
    ApiSite : TApiSite;
begin
  PathDB := GetPathDB;
  Sql :=  GetSqlCountryInfo ( id, idLng );
  SqlSection := SqtSqlCountrySection( idLng );

  try
    try
      DB := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
      DBSection := UnitADOQuery.CreateDataSet( PathDB, Login, Password, SqlSection );

      ApiSite := TApiSite.Create;
      if DB <> nil then
      begin
        if FormatData in [0,1] then result := ApiSite.MakeJsonCountryInfo( GetPathWebDescriptCountry( id, idLng ), DB, DBSection );
      end
      else result := MesError;

      //if DB = nil then result :='nil';
      //if DBSection = nil then result := SqlSection;
      //result := SqlSection;

    finally
      ApiSite.Free;
      UnitADOQuery.DestroyDS( DB );
      UnitADOQuery.DestroyDS( DBSection );
    end;

  except on E: exception do
    begin
      result := e.Message;
      Exit;
    end;
  end;
end;
//******************************************************************************
function TWebDM.GetRateTourGroupOnDate_Old( Login,Password:String; TourId,TouristAge:Integer; aDate:TDateTime; FormatData:Integer ):String;
var PathDB:string;
    Sql:string;
    DB:TAdoDataset;
    ApiSite : TApiSite;
begin
  PathDB := GetPathDB;

  Sql := GetSQlRateTourGroupOnDate_Old( TourId, TouristAge, aDate );
  DB := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
  try
    ApiSite := TApiSite.Create;
    if DB <> nil then
    begin
      if FormatData in [ 0,1 ] then result := ApiSite.MakeJsonRateTourGroupOnDate_Old( DB );
    end
    else result := MesError +'  '+ Sql;

  finally
    ApiSite.Free;
    UnitADOQuery.DestroyDS( DB );
  end;
end;
//******************************************************************************
function TWebDM.GetAllServicesRateTourGroupOnDate_Old(  Login,Password:String; TourGroupId,Age:Integer; aDate:TDateTime;Hidden:Integer; FormatData:Integer  ):String;
var PathDB:string;
    Sql:string;
    DB:TAdoDataset;
    ApiSite : TApiSite;
begin
  PathDB := GetPathDB;

  Sql := GetSQlAllServicesRateTourGroupOnDate_Old( TourGroupId,Age, aDate, Hidden );
  DB := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
  try
    ApiSite := TApiSite.Create;
    if DB <> nil then
    begin
      if FormatData in [ 0, 1 ] then result := ApiSite.MakeJsonAllServicesRateTourGroupOnDate_Old( DB );
    end
    else result := MesError +'  '+ Sql;

  finally
    ApiSite.Free;
    UnitADOQuery.DestroyDS( DB );
  end;
end;
//******************************************************************************
function TWebDM.GetClientData(  Login,Password:String; IdClient:Integer; FormatData:Integer ):String;
var PathDB:string;
    Sql:string;
    DBClient:TAdoDataset;
    DBCliAddres:TAdoDataset;

    ApiSite : TApiSite;
begin
  PathDB := GetPathDB;

  //DBCliAddres := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
  //if DBCliAddres = nil  then begin result := MesError +'A/  '+ Sql;exit;  end;

  Sql := GetSQLClientForID( IdClient );
  DBClient := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );

  try
    ApiSite := TApiSite.Create;
    if DBClient <> nil then
    begin
      if FormatData in [ 0, 1 ] then
      begin

        try

          Sql :=  GetSQLClientAddres( IdClient );
          DBCliAddres := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
          if DBCliAddres = nil then
            result := MesError +'  ADDRES: '+ Sql
          else result := ApiSite.MakeJsonClientData( DBClient, DBCliAddres );

        finally
          UnitADOQuery.DestroyDS(DBCliAddres);
        end;

      end;
    end
    else result := MesError +'Client:  '+ Sql;

  finally
    ApiSite.Free;
    UnitADOQuery.DestroyDS( DBClient );
  end;
end;
//******************************************************************************
function TWebDM.CheckClientByEDRPO(  Login,Password:String; EDRPOU:Widestring; FormatData:Integer ):String;
var Sql:Widestring;
    PathDB:string;
    DBClient:TAdoDataset;
    ApiSite : TApiSite;
begin
  PathDB := GetPathDB;

  Sql := GetSqlFindClientForEDRPO(EDRPOU );
  DBClient := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
  
  try
    ApiSite := TApiSite.Create;
    if DBClient <> nil then
    begin
      if FormatData in [ 0, 1 ] then
        result := ApiSite.MakeJsonCheckClient( DBClient );
    end
    else result := MesError +'Client:  '+ Sql;

  finally
    UnitADOQuery.DestroyDS( DBClient );
  end;
end;
//******************************************************************************
function TWebDM.GetLanguages( Login,Password:String; idLng:integer; ActiveTranslate:integer; FormatData:Integer ):string;
var PathDB:string;
    Sql:string;
    DB:TAdoDataset;
    ApiSite : TApiSite;
begin
   PathDB := GetPathDB;
   Sql := GetSqlLanguages( idLng, ActiveTranslate );
   DB := UnitADOQuery.CreateDataSet( PathDB, Login, Password, Sql );
   
   try
     ApiSite := TApiSite.Create;
     if DB <> nil then
     begin
       if FormatData in [0,1] then result :=  ApiSite.MakeJsonLanguages( DB );
     end
     else result := MesError;
   finally
     ApiSite.Free;
     UnitADOQuery.DestroyDS( DB );
   end;
end;
//******************************************************************************
end.
