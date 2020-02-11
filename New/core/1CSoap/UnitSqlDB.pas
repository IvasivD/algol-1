unit UnitSqlDB;

interface
  uses Windows, SysUtils, Dialogs, Classes,UnitProc,DateUtils,DB, UnitIBQuery, UnitAdoQuery;

  type

  TOptionSelectLog = (OptSelLogNotMerge,OptSelLogMerge,OptSelLogAll);
  TDataCliAddres = record
    Representation: WideString;
    //ZIP: WideString;
    //State: WideString;
    //Region: WideString;
    //District: WideString;
    //City: WideString;
    //Settlement: WideString;
    //Street: WideString;
    //House: WideString;
    //Building: WideString;
    //Appartment: WideString;
  end;

  TDatCli = record
    ContragentID: Integer;
    Name: Widestring;
    FullName: Widestring;
    Comment : Widestring;
    HeadContragentID: Integer;
    Legal: Boolean;
    INN: Widestring;
    INNSearch:WideString;
    EDRPOU: Widestring;
    ISPRIVATE:Boolean;
    ISFILIYA:Boolean;
    BranchNo:WideString;
    //VatLicence: Widestring;
    Resident: Boolean;
    UsedInAccounting: Boolean;
    Address:TDataCliAddres;
    Code:string;
    MarkedToDelete :Boolean;
    Search1CByName: WideString;
    CanUnlink1C:Boolean;
    CanUnlinkDB:Boolean;
 end;
 TDataCliArr = array of TDatCli;
 PDatCli = ^TDatCli;
 PDataCliArr = ^TDataCliArr;

 TDatCliAccounts = record
  ContragentID: Integer;
  EDRPOU : Widestring;
  AccountID:Integer;
  AccountNO:WideString;
  BankName: WideString;
  BankMFO : WideString;
  BankAddres:WideString;
  BankActive:Integer;
  MarkedToDelete:Boolean;
 end;

 TDatCliAccountsArr = array of TDatCliAccounts;
 PDatCliAccounts = ^TDatCliAccounts;
 PDatCliAccountsArr = ^TDatCliAccountsArr;

 TDatCon = record
   ContractID:Integer;
   ContragentID:Integer;
   Name :WideString;
   PrintName:WideString;
   Comment:WideString;
   ContractType:Integer;
   ContractNumber:Widestring;
   ContractStartDate:WideString;
   ContractEndDate:WideString;
   ContractPath:WideString;
   Code:WideString;
   MarkedToDelete :boolean;
 end;
 PDatCon = ^TDatCon;

 TDataGoods = record
   Code: Integer;
   Price: Double;
   TourID: Integer;
   GroupID: Integer;
 end;
 TDataGoodsArr = array of TDataGoods;

 TDatInvoice = record
   InvoiceID: Integer;
   ContragentID: Integer ;
   ContractID: Integer;
   InvoiceNumber: Integer;
   InvoiceNumberStr:WideString;
   Date: WideString;
   DateInvoiceExpire:WideString;
   DateTourEnd:WideString;
   Final :Boolean; // False - звичайний рах. True - Фінальний
   State:Integer;
   OrderId:Integer;

   Goods: TDataGoodsArr;
   Code:string;
   DirectionID:Integer;
 end;
 PDatInvoice = ^TDatInvoice;

 TDatInvoiceShort = record
   InvoiceID: Integer;
   ContragentID: Integer ;
   ContractId: Integer ;
   InvoiceNumber: Integer;
   OrderId:Integer;
 end;
 PDatInvoiceShort = ^TDatInvoiceShort;


 TDatPackedStatusInvoice = record
   InvoiceID: Integer;
   PaymentStatus:Integer;
 end;

 TDatPackedStatusInvoiceArr = array of TDatPackedStatusInvoice;
 PDatPackedStatusInvoiceArr = ^TDatPackedStatusInvoiceArr;

 TDataCurrencyRate = record
   CurrencyComerceId : Integer;
   CurrencyId : Integer;
   CurrencyCode:Widestring;
   aDate:Widestring;
   aDateTime:TDateTime;
   Rate:Single;
   Zoom:Integer;
 end;
 TDataCurrencyRateArr = array of TDataCurrencyRate;
 PDataCurrencyRateArr = ^TDataCurrencyRateArr;

 TPaymentBillingDataRec = record
  OrderId   : Integer;
  ExchCurrId: Integer;
  BillingNo : Integer;
  TotalSum  : Double;
  PayMethod : Integer;
  ManagerId : Integer;
  BillNo    : Widestring;// номер платіжного доручення
  BillDate  : TDateTime;
  DocTypeId : Integer;
 end;
 PPaymentBillingDataRec = ^TPaymentBillingDataRec;


  function GetSQLClient:String;
  function GetSQLForInvoiceDataByCODEID1C( CODEID1C:String ):string;
  function GetSQLForCurrency(CurrncyId:Integer;ForDate:TDateTime):Widestring;  // Ole Bas
  function GetSQLAllPackedInvoices : string;
  function GetSQLInvoiceFinalyDetail(OrderID, InvoiceNo:Integer):string;
  function GetSQLInvoice(OrderID, InvoiceNo:Integer ):string;
  function GetSQLDataInvoiceByInvoiceId(InvoiceID :Integer ):string;
  function GetSQLContractFormContractId(id:Integer):String;
  function GetSQLContractFormClientId(id:Integer):String;
  function GetSQLContract:String;
  function GetSQLCurrecyDateByCurrencyCommerceId(id:Integer):WideString;
  function GetSqlForGetClientIdForContractId(Id:Integer):string;
  function GetSQLClientAddres(COMPANYID:Integer):String;
  function GetSQLBilling(OrderId,BilingNo:Integer):String;
  function GetSQLClientBankAccounts(ClientID: Integer):string;
  function GetSQLClientForEDRPO(EDRPOU: Widestring; INN: Widestring; ClientID: Integer):String; overload;
  function GetSQLClientForEDRPO(EDRPOU: Widestring ):String;overload;
  function GetSqlFindClientForEDRPO(EDRPOU: Widestring ):String;
  function GetSQLClientForID(id:Integer):String;
  function GetSQLMergeSoap1C( MenId:Integer=-1;ShowForAllUsers:Boolean=false; TypeShowLog:TOptionSelectLog=OptSelLogNotMerge;TypeShowDate:Integer=-1  ):String;
  function GetSqlForDataIndex(DataFieldName:string;IndexData:Integer):string;
  //********************************
  function GetSqlLanguages( idLng:integer; ActTransl:integer ) : string;
  function GetSqlCountryInfo ( id, idLng:integer ):string;
  function SqtSqlCountrySection( idLng:integer ):string;
  function GetSQlRateTourGroupOnDate_Old( TourId,TouristAge : Integer; aDate:TDateTime ):string;
  function GetSQlAllServicesRateTourGroupOnDate_Old( TourGroupId, Age : Integer; aDate:TDateTime; Hidden:Integer ):string;
  function GetSQlCountriesList( idLng:integer ):string;
  //****************************************************************
  procedure GetAddressClientByDataset( DBAddres:TDataset; var aDataCli:PDatCli );
  function  GetDataDBClientByDataset( DBClient:TDataset ):PDatCli;

implementation


function GetSQLClient:String;
begin
 result:=' select C.COMPANYID , C.NAME, C.ISPRIVATE, C.ISFILIYA, C.FILIYACODE, '+
   'CASE '+
   ' WHEN C.orgforminname = ''T'' THEN C.NAME'+
   ' ELSE ORGFORMS.name ||'' "''|| C.NAME||''"'''+
   'END FULLNAME, '+

  ' HEADOFFICEID, C.MEMO as Comment , T.TaxPayCode as INN, '+
  ' case '+
  ' WHEN (ISENTERPR=''T'')THEN 1 '+
  ' ELSE 0 '+
  'END as Legal, '+
  'IDENTCODE as EDRPOU, '+
  'case '+
  ' WHEN ASRESIDENT =''T'' then 1'+
  ' ELSE 0 '+
  'END as Resident, '+
  'CodeId1C as Code, '+
  'Cast(null as Varchar(1) ) MarkedToDelete, '+
  ' CASE '+
  '  WHEN C.headofficeid is null '+
  '  THEN (select Count(CompanyId) from Companies cf where cf.headofficeid = C.CompanyId and cf.IsFiliya = ''T'' ) '+
  '  ELSE 0 '+
  ' END FiliyaCount '+

  'FROM COMPANIES C '+
  'left join CompTaxSystemLog T '+
  ' on T.CompanyId = C.CompanyId and T.FromDate < ''NOW'' and ((T.ToDate >= ''NOW'') or T.ToDate is null) '+
  ' left join ORGFORMS on ORGFORMS.id = C.orgformid ';
end;
//******************************************************************************
function GetSqlForDataIndex(DataFieldName:string;IndexData:Integer):string;
begin
 if IndexData = 0 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( Now ,1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 if IndexData = 1 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( IncDay(Now,-1),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 if IndexData = 2 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( IncDay(Now,-2),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';

 if IndexData = 3 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( StartOfTheWeek(Now),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 if IndexData = 4 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( IncWeek(StartOfTheWeek(Now),-1),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 if IndexData = 5 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( IncWeek(StartOfTheWeek(Now),-2),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';

 if IndexData = 6 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( StartOfTheMonth(Now) ,1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 if IndexData = 7 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( IncMonth(StartOfTheMonth(Now),-1),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 if IndexData = 8 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( IncMonth(StartOfTheMonth(Now),-2),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 if IndexData = 9 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( IncMonth(StartOfTheMonth(Now),-5),1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';

 if IndexData = 10 then Result := DataFieldName+' Between '+ ''''+ConvertDateTime( StartOfTheYear(Now) ,1 )+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
 //if IndexData = 11 then Result := DataFieldName+' Between '+ ''''+'01.01.'+IntToStr(YearOf(Now))+' 00:00:00' +''''+ ' and '+''''+ConvertDateTime( Now,1 )+' 23:59:59'+'''';
end;

//******************************************************************************

function GetSQLMergeSoap1C( MenId:Integer=-1;ShowForAllUsers:Boolean=false; TypeShowLog:TOptionSelectLog=OptSelLogNotMerge;TypeShowDate:Integer=-1  ):String;
var SqlWhere:String;
    SqlOptMerge:String;
    SqlByDate:string;
    //SqlByDate:
begin
 if not ShowForAllUsers then
   SqlWhere :='MENID='+IntToStr(MenId)+' and '
 else SqlWhere:='';

 if TypeShowLog = OptSelLogNotMerge then SqlOptMerge:=' MG.ISMERGE = 0 ';
 if TypeShowLog = OptSelLogMerge then SqlOptMerge:=' MG.ISMERGE = 1 ';
 if TypeShowLog = OptSelLogAll then SqlOptMerge:=' MG.ISMERGE in(0,1) ';

 if TypeShowDate>=0 then
    SqlByDate := GetSqlForDataIndex('ADATE',TypeShowDate)+' AND '
    else SqlByDate:= '';

 result:='SELECT MG.*, '+
 ' CASE '+
 //'  WHEN (TYPEOPERATION = 0 ) THEN (select NAME from COMPANIES where COMPANYID = MERGESOAP1C.OPERATIONID ) '+
 '  WHEN (TYPEOPERATION = 0 )or( (TYPEOPERATION = 1 ) and ( REASON=-3 ) ) THEN (select NAME from COMPANIES where COMPANYID = MG.OPERATIONID ) '+
 '  WHEN (TYPEOPERATION = 1 )and( ( REASON <> -3 ) ) THEN (select STRREPLACE(FILENAME, ''.doc'', '''') FROM COMPCONTRACTS where COMPCONTRACTID = MG.OPERATIONID) '+
 '  WHEN (TYPEOPERATION = 2 ) THEN (select NAME from COMPANIES where COMPANYID = MG.OPERATIONID  ) '+
 '  WHEN (TYPEOPERATION = 3 ) or (TYPEOPERATION = 5) THEN (select TOURNAME from BILLINGS left join ORDERS on BILLINGS.ORDERID = ORDERS.orderid left join TOURES on TOURES.id = ORDERS.TourID  where BILLINGS.BILLINGID = MG.OPERATIONID)' +
 '  WHEN (TYPEOPERATION = 4 ) THEN ( select CURRENCYNAME from CURRENCYCOMMERCE left join CURRENCY on CURRENCY.currencyid = CURRENCYCOMMERCE.currencyid where CURRENCYCOMMERCE.currencycommerceid = MG.OPERATIONID  ) '+

 '  ELSE ''UNCKNOWN'' '+
 ' END as OBJECTNAME ,'+
 ' GET_MANAGER(MG.menid) USERNAME, '+
 ' CASE WHEN (ISMERGE <> 1 and REASON is null) THEN -1 '+
 ' ELSE REASON '+
 ' END as CheckREASON' +
 //' FROM  MERGESOAP1C m WHERE  '+SqlWhere+SqlByDate+{' ADATE = ( select Max(ADATE) from MERGESOAP1C c where '+SqlWhere+' c.operationid = m.operationid ) '} ' AND '+
 ' FROM  MERGESOAP1C MG WHERE  '+SqlWhere+' ADATE = ( select Max(ADATE) from MERGESOAP1C c where '+SqlWhere+' c.operationid = MG.operationid )  AND '+ SqlByDate+

 SqlOptMerge + ' order by TYPEOPERATION, ADATE ';

end;
//******************************************************************************
function GetSQLClientForID(id:Integer):String;
begin
 result:=GetSQLClient + 'where C.COMPANYID = '+IntToStr(id);
end;
//******************************************************************************
function GetSQLClientForEDRPO(EDRPOU: Widestring; INN: Widestring; ClientID: Integer):String;
begin
 result:=GetSQLClient + 'where IDENTCODE = '''+EDRPOU+''''+' OR '+'T.TaxPayCode ='+''''+String( INN )+'''';
end;
//******************************************************************************
function GetSQLClientForEDRPO(EDRPOU: Widestring ):String;
begin
 result:=GetSQLClient + 'where IDENTCODE = '''+EDRPOU+'''';
end;
//******************************************************************************
function GetSqlFindClientForEDRPO(EDRPOU: Widestring ):String;
begin
  result := 'select COMPANYID from COMPANIES where IDENTCODE = '''+EDRPOU+'''';
end;
//******************************************************************************
function GetSQLClientBankAccounts(ClientID: Integer):string;
begin
 result:='SELECT COMPACCOUNTS.ACCOUNTID,COMPACCOUNTS.ACCOUNTNO,COMPACCOUNTS.COMPANYID,'+
 '(SELECT IDENTCODE FROM COMPANIES WHERE COMPANIES.COMPANYID = COMPACCOUNTS.COMPANYID  ) EDRPOU,'+
 'BANKS.NAME as BANK_NAME , '+
 'CASE WHEN (BANKS.MFO is NULL) THEN BANKS.GLMFO '+
 'ELSE BANKS.MFO '+
 'END as BANK_MFO,'+
 'CASE WHEN (BANKS.MFO is NULL) THEN (SELECT FIRST 1 B.ADDRESS FROM  BANKS B WHERE BANKS.GLMFO = B.GLMFO ) '+
 ' ELSE BANKS.ADDRESS '+
 'END as BANK_ADDRESS, '+
 'CASE WHEN (BANKS.D_CLOSE is NULL) THEN 1 '+
 'ELSE 0 '+
 'END as BANK_ACTIVE ,'+
 'Cast(null as Varchar(1) ) MarkedToDelete '+
 'FROM COMPACCOUNTS '+
 'LEFT JOIN BANKS on COMPACCOUNTS.bankid = BANKS.BANKID '+
 'WHERE COMPANYID = '+IntToStr(ClientID);
end;
//******************************************************************************
function GetSQLBilling(OrderId,BilingNo:Integer):String;
begin
  result:='select First 1 ORDERID , BILLINGNO, (select sum( DEBT * CURRENCYRATE ) from BILLINGS WHERE ORDERID = 110088 and BILLINGNO = 1 ) SDEBT,'+
          'BILLINGDATE,EXPIRETO from BILLINGS WHERE ORDERID = '+IntToStr(OrderId)+' and BILLINGNO = '+IntToStr(BilingNo);
end;
//******************************************************************************
function GetSQLClientAddres(COMPANYID:Integer):String;
begin
  result := 'SELECT get_city_path( COMPOFFICES.id_city_adm_unit,'''',1,448) CITYPATH, ZIPCODE ZIP,'+
  ' ( select name from COUNTRIES where COUNTRYID = COMPOFFICES.COUNTRYID ) State, '+
  ' KINDSTREET.NAME StreetKind, ADDRESS Street, House ,Cast( '''' as varchar(10) ) Building, TENEMENT Appartment from COMPOFFICES '+
  ' left join KINDSTREET on COMPOFFICES.STRKIND = KINDSTREET.id '+
  ' where COMPANYID = ' + IntToStr(COMPANYID);
end;
//******************************************************************************
function GetSqlForGetClientIdForContractId(Id:Integer):string;
begin
 result:='select COMPANYID from COMPCONTRACTS where COMPCONTRACTID = '+IntToStr(id);
end;
//******************************************************************************
function GetSQLCurrecyDateByCurrencyCommerceId(id:Integer):WideString;
begin
  result:='select r1.*, 1 CommRateZoom,  r1.CommerceRate / r1.CommRateZoom Rate, c1.currencycode from CURRENCYCOMMERCE r1 left join currency c1 on c1.currencyid = r1.currencyid '+
  'where r1.CURRENCYCOMMERCEID = '+IntToStr(id);
end;
//******************************************************************************
function GetSQLContract:String;
begin
  Result := 'select COMPCONTRACTID , COMPANYID ,  STRREPLACE(FILENAME, ''.doc'', '''') as NAME,'+
    ' case '+
    ' WHEN(CONTRACTTYPE = 180) THEN 2 '+   //4
    ' WHEN(CONTRACTTYPE = 182) THEN 1 '+
    ' WHEN(CONTRACTTYPE = 183) THEN 2 '+
    ' WHEN(CONTRACTTYPE = 000) THEN 3 '+
    ' ELSE 0 '+
    ' end as CONTTYPE, '+
    ' NUMCONTRACT,  COMMENTS, FROMDATE, '+
    ' case ' +
    ' WHEN (ISRCVORIG = ''T'') THEN TillDate '+
    ' ELSE RCVCOPYDATE '+
    ' END as TillDate, '+
    ' Cast('''' as Varchar(15) ) Code, '+
    ' Cast(null as Varchar(1) ) MarkedToDelete '+
    ' FROM COMPCONTRACTS ';
end;
//******************************************************************************
function GetSQLContractFormClientId(id:Integer):String;
begin
  Result := GetSQLContract + ' where FromDate <= ''NOW'' and ((FromDate >= ''NOW'') or TillDate is null) and COMPANYID = '+IntToStr(id);
end;
//******************************************************************************
function GetSQLContractFormContractId(id:Integer):String;
begin
 result := GetSQLContract + ' where COMPCONTRACTID = '+IntToStr(id);
end;
//******************************************************************************
function GetSQLDataInvoiceByInvoiceId(InvoiceID :Integer ):string;
begin
  result :=' select T.billingid INVOICEID, T.BILLINGNO, T.OrderId, '+
  ' coalesce(COMPANIES.headofficeid, COMPANIES.CompanyId) CompanyId, '+
  ' (Select First 1 CompContracts.compcontractid from CompContracts where CompContracts.COMPANYID = Clients.companyid and CompContracts.contracttype in ( 180, 182, 183 ) '+
  ' and FromDate <= ''NOW'' and (TillDate >= ''NOW'' or TillDate is null)  ) compcontractid '+
  ' From BILLINGS T '+
  ' left join ORDERS ON ORDERS.orderid = T.ORDERID '+
  ' left join Clients ON Clients.ClientId = ORDERS.ClientId '+
  ' left join COMPANIES ON COMPANIES.COMPANYID = Clients.companyid '+
  ' Where T.billingid = '+ IntToStr(InvoiceID);
end;
//******************************************************************************
function GetSQLInvoice(OrderID, InvoiceNo:Integer ):string;
var SqlField:String;
begin
  //if FinishBilling then SqlField :='( select Min(BILLINGID) from BILLINGS where BILLINGS.orderid = '+IntToStr(OrderID)+' and BILLINGS.BillingNo = '+IntToStr(InvoiceNo)+' )'
  //else  SqlField :='T.BILLINGID ';

  result :=' select  ( select Min(BILLINGID) from BILLINGS where BILLINGS.orderid = '+IntToStr(OrderID)+' and BILLINGS.BillingNo = '+IntToStr(InvoiceNo)+' ) as INVOICEID, '+
  ' T.BILLINGNO, T.BILLINGDATE, T.EXPIRETO, T.DELETED, T.DEBT, T.PAID, T.CURRENCYID, T.CURRENCYSHORT, T.ANNULDATE, T.STOPED, '+
  ' T.Manager, ORDERS.TOURID, ORDERS.TOURGROUPID,  ORDERS.ORDERID, '+
  ' TOURGROUPS.Tourdate , TOURGROUPS.tourdate + TOURGROUPS.daycount - 1 TourDateEnd, '+
  ' COMPANIES.headofficeid, HC.compcontractid headcontractid, ' +
  ' COMPANIES.CompanyId, CC.compcontractid compcontractid, ' +
  ' TradeNames.PeymToAgency, COMPANIES.TradeNameId, ' +
  ' TOURES.PRIORCOUNTRY'+
  ' From BILLING_SEL_PROC('+IntToStr(OrderID)+') T '+
  ' left join ORDERS ON ORDERS.orderid = '+IntToStr(OrderID)+
  ' left join Clients ON Clients.ClientId = ORDERS.ClientId '+
  ' left join COMPANIES ON COMPANIES.COMPANYID = Clients.companyid '+
  ' left join TradeNames on TradeNames.TradeNameId = COMPANIES.TradeNameId ' +
  ' left join TOURGROUPS on TOURGROUPS.TOURGROUPID = ORDERS.TOURGROUPID '+
  ' left join TOURES on TOURES.ID = TOURGROUPS.TOURID '+
  ' left join COMPCONTRACTS CC on CC.COMPANYID = COMPANIES.CompanyId and CC.FromDate < ''NOW'' and ((CC.FromDate >= ''NOW'') or CC.TillDate is null) '+
  ' left join COMPCONTRACTS HC on HC.COMPANYID = COMPANIES.headofficeid and HC.FromDate < ''NOW'' and ((HC.FromDate >= ''NOW'') or HC.TillDate is null) ' +
  ' Where T.BillingNo = '+IntToStr(InvoiceNo);
end;
//******************************************************************************
function GetSQLInvoiceFinalyDetail(OrderID, InvoiceNo:Integer):string;
begin
  result :=' select SrvCode, Debt, TourId, TourGroupId from Billings B '+
  ' left join Orders O on O.OrderId = B.OrderId ' +
  ' where B.OrderId = '+IntToStr(OrderID)+' and B.BillingNo = '+IntToStr(InvoiceNo);
end;
//******************************************************************************
function GetSQLAllPackedInvoices : string;
begin
  result:= 'SELECT  ( select Min(BILLINGID) from BILLINGS where BILLINGS.BillingID = Bil.BillingID ) as INVOICEID , Bil.* '+
   ' from BILLINGS Bil  where  EXPIRETO > ''05.08.2017'' ';
end;
//******************************************************************************
function GetSQLForCurrency(CurrncyId:Integer;ForDate:TDateTime):Widestring;  // Ole Bas
begin
 {result :=' SELECT r1.CURRENCYCOMMERCEID, case r1.CurrencyId when 37 then 75 else r1.CurrencyId end CurrencyId, ' +
 ' c1.currencycode, r1.CommDate, r1.CommerceRate, 1 CommRateZoom,  r1.CommerceRate / r1.CommRateZoom Rate '+
 ' FROM CurrencyCommerce r1 '+
 ' left join currency c1 on c1.currencyid = r1.currencyid '+
 ' WHERE r1.CurrencyId = '+IntToStr(CurrncyId)+' and '+
 ' r1.currencycommerceid = ( SELECT max(m1.currencycommerceid ) FROM CurrencyCommerce m1 WHERE m1.currencyid = '+
  IntToStr(CurrncyId)+' and m1.CommDate <= '+''''+DateTimeToStr(ForDate)+''''+' )'; }

 result :=' SELECT r1.CURRENCYCOMMERCEID, case r1.CurrencyId when 37 then 75 else r1.CurrencyId end CurrencyId, ' +
          ' case r1.CurrencyId when 37 then 980 else c1.currencycode end currencycode, ' +
          ' r1.CommDate, r1.CommerceRate, 1 CommRateZoom, r1.CommerceRate / r1.CommRateZoom Rate '+
          ' FROM CurrencyCommerce r1 '+
          ' left join currency c1 on c1.currencyid = r1.currencyid '+
          ' WHERE r1.CurrencyId = '+IntToStr(CurrncyId)+' and '+
          ' r1.currencycommerceid = ( SELECT max(m1.currencycommerceid ) FROM CurrencyCommerce m1 WHERE m1.currencyid = '+
          IntToStr(CurrncyId)+' and m1.CommDate <= '+''''+DateTimeToStr(ForDate)+''''+' )';
end;
//******************************************************************************
function GetSQLForInvoiceDataByCODEID1C( CODEID1C:String ):string;
begin
  result := 'select FIRST 1 * from BILLINGS  where CODEID1C ='+''''+CODEID1C+'''';
end;
//******************************************************************************
{function UpdateSql( ConnectToDB, Login, Password:String; SQL:String ):Integer;
var IBTransaction : TIBTransaction;
    IBDB : TIBDatabase;
    IBSQL : TIBQuery;
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
     try
       IBSQL := TIBQuery.Create(nil);
       IBTransaction := TIBTransaction.Create(nil);

       IBTransaction.DefaultDatabase := IBDB;
       IBSQL.Transaction := IBTransaction;
       IBSQL.SQL.Text := SQL;
       IBSQL.ExecSQL;
       IBSQL.Transaction.Commit;
       result:=0;
     except
      Result:=-1;
     end;
   end;
 finally
   IBDB.Free;
 end;
end; }
//******************************************************************************

function GetSqlLanguages( idLng:integer; ActTransl:integer ) : string;
begin
  result := ' select Languages.id,Languages.active_translate, Languages.ident, Languages.icon, Languages.name UkrName, languages_lng.name from Languages '+
            ' left join languages_lng on languages_lng.id_languages = Languages.id where languages_lng.id_lng = '+IntToStr(idLng);
  if ActTransl > 0 then
    result := result +' and Languages.active_translate = 1 ';
end;

function GetSQlRateTourGroupOnDate_Old( TourId , TouristAge: Integer; aDate:TDateTime ):string;
begin
   result := 'select * from GET_RATE_TG_ONDATE_NEW_PROC( '+IntToStr(TourId)+','''+ConvertDateTime( aDate, 0 )+''','+IntToStr(TouristAge)+' ) order by TourDate ';
end;

function GetSQlAllServicesRateTourGroupOnDate_Old( TourGroupId, Age : Integer; aDate:TDateTime; Hidden:Integer ):string;
begin
   result := 'select * from GET_ALL_SERVICE_RATE_FORTG_PROC( '+IntToStr(TourGroupId)+','''+
              ConvertDateTime( aDate, 0 )+''',' +IntToStr(Hidden)+','+IntToStr(Age)+ ' ) '+
             'order by Atype, CurrencyName nulls first, Rate Desc';
end;

function SqtSqlCountrySection( idLng:integer ):string;
begin
  result :=
  'select COUNTRY_SECT_DESCRIPTS.id, COUNTRY_SECT_DESCRIPTS.parent, COUNTRY_SECT_DESCRIPTS.AOrder, '+
  ' case '+
  '  WHEN (COUNTRY_SECT_DESCRIPTS.dictsectionid is not null) THEN (select first 1 DICTSECTIONS_lng.sectionname from DICTSECTIONS_lng where DICTSECTIONS_lng.id_dictsections = COUNTRY_SECT_DESCRIPTS.dictsectionid and DICTSECTIONS_lng.id_lng = '+IntToStr(idLng)+' ) '+
  '  WHEN (COUNTRY_SECT_DESCRIPTS.itemid is not null) THEN (select  first 1 DICTSECTION_ITEMS_LNG.itemname from DICTSECTION_ITEMS_LNG  where DICTSECTION_ITEMS_LNG.id_dictsection_items = COUNTRY_SECT_DESCRIPTS.itemid and DICTSECTION_ITEMS_LNG.id_lng = '+IntToStr(idLng)+' ) '+
  '  WHEN (COUNTRY_SECT_DESCRIPTS.name is not null) THEN (  select first 1  country_sect_desc_LNG.name from country_sect_desc_LNG where country_sect_desc_LNG.id_country_sect_descripts = COUNTRY_SECT_DESCRIPTS.id and  country_sect_desc_LNG.id_lng = '+IntToStr(idLng)+' ) '+
  ' ELSE '''' END NAME_ITEM , ' +

  ' case '+
  '   when (COUNTRY_SECT_DESCRIPTS.dictsectionid is not null) THEN ( select KEYNAME from DICTSECTIONS where DICTSECTIONS.dictsectionid = COUNTRY_SECT_DESCRIPTS.dictsectionid ) '+
  '   when (COUNTRY_SECT_DESCRIPTS.ITEMID is not null) THEN ( select KEYNAME from DICTSECTION_ITEMS where DICTSECTION_ITEMS.ITEMID = COUNTRY_SECT_DESCRIPTS.itemid ) '+
  ' ELSE '''' END KEYNAME ' +

  'from COUNTRY_SECT_DESCRIPTS order by AORDER ';
end;

function GetSqlCountryInfo ( id, idLng:Integer ):string;
begin
  result := ' select COUNTRIES_INFO.*,table_ind, COUNTRIES_TYPE_INFO_LNG.NAME, unit_measur.short unitmeasur, '+
            ' case '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 0 then '+
            '   ( select first 1 COUNTRIES_lng.name from COUNTRIES left join COUNTRIES_lng on COUNTRIES_lng.id_countries = COUNTRIES.countryid where COUNTRIES_lng.id_lng = COUNTRIES_TYPE_INFO_LNG.id_lng and COUNTRIES_lng.id_countries = COUNTRIES_INFO.id_value ) '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 1 then '+
            '   ( select first 1 city_adm_unit_lng.name from city_adm_unit left join city_adm_unit_lng on '+
            '     city_adm_unit_lng.id_city_adm_unit = city_adm_unit.id where city_adm_unit_lng.id_lng = COUNTRIES_TYPE_INFO_LNG.id_lng and city_adm_unit_lng.id_city_adm_unit = COUNTRIES_INFO.id_value ) '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 2 then '+
            '   ( select first 1 LANGUAGES_lng.name from LANGUAGES left join LANGUAGES_lng on LANGUAGES_lng.id_languages = LANGUAGES.id where LANGUAGES_lng.id_lng = COUNTRIES_TYPE_INFO_LNG.id_lng and LANGUAGES_lng.id_languages = COUNTRIES_INFO.id_value )'+
            '    when COUNTRIES_TYPE_INFO.table_ind = 4 then '+
            '   ( select first 1 CURRENCY_lng.currencyname from CURRENCY left join CURRENCY_lng on CURRENCY_lng.id_currency = CURRENCY.currencyid where CURRENCY_lng.id_lng = COUNTRIES_TYPE_INFO_LNG.id_lng and CURRENCY_lng.id_currency = COUNTRIES_INFO.id_value ) '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 5 then '+
            '   ( select first 1 POWER_VOLT_FREQ.avalue || unit_measur_lng.short  from POWER_VOLT_FREQ left join unit_measur on unit_measur.id = POWER_VOLT_FREQ.id_unit_measur  '+
            '    left join unit_measur_lng on unit_measur_lng.id_unit_measur = unit_measur.id '+
            '    where  POWER_VOLT_FREQ.id = COUNTRIES_INFO.id_value and unit_measur_lng.id_lng = COUNTRIES_TYPE_INFO_LNG.id_lng )  '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 6 then '+
            '    ( select first 1 TYPE_POW_SOCKETS.name from TYPE_POW_SOCKETS where TYPE_POW_SOCKETS.id = COUNTRIES_INFO.id_value)  '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 7 then '+
            '    ( select first 1 RELIGION_lng.name from RELIGION left join RELIGION_lng on RELIGION_lng.id_religion = RELIGION.id  '+
            '    where RELIGION_lng.id_lng = COUNTRIES_TYPE_INFO_LNG.id_lng and RELIGION_lng.id_religion = COUNTRIES_INFO.id_value ) '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 8 then '+
            '    ( select first 1 INTERNACIONAL_ORG_lng.name from INTERNACIONAL_ORG left join INTERNACIONAL_ORG_lng on '+
            '    INTERNACIONAL_ORG_lng.id_internacional_org = INTERNACIONAL_ORG.id where INTERNACIONAL_ORG_lng.id_lng = COUNTRIES_TYPE_INFO_LNG.id_lng and INTERNACIONAL_ORG_lng.id_internacional_org = COUNTRIES_INFO.id_value ) '+
            '    when COUNTRIES_TYPE_INFO.table_ind = 9 then( select first 1 TIME_ZONE.name from TIME_ZONE where TIME_ZONE.id = COUNTRIES_INFO.id_value ) '+

            ' end AddValue ' +

  ' from COUNTRIES_INFO '+
  ' left join COUNTRIES_TYPE_INFO on COUNTRIES_INFO.id_countries_type_info = COUNTRIES_TYPE_INFO.id '+
  ' left join COUNTRIES_TYPE_INFO_LNG on COUNTRIES_TYPE_INFO.id = COUNTRIES_TYPE_INFO_LNG.id_countries_type_info '+
  ' left join unit_measur on unit_measur.id = COUNTRIES_INFO.id_unit_measur '+

  ' where COUNTRIES_INFO.id_countries = '+IntToStr(id)+' and COUNTRIES_TYPE_INFO_LNG.id_lng = '+IntToStr(idLng);

end;


function GetSQlCountriesList( idLng:integer ):string;
begin
  result := ' select COUNTRIES.countryid id,countries_lng.name from COUNTRIES left join countries_lng on COUNTRIES.countryid = countries_lng.id_countries '+
            ' where countries_lng.id_lng = '+IntToStr(idLng);
end;

Function FormingAddresOffice(KindStreet,Street,House,Appartment, CITYPATH, ZIP, State:Widestring):Widestring;
begin
  if (KindStreet<>'')and(Street<>'')and
     ( AnsiPos(KindStreet,Street)=0 ) then Street := KindStreet +' '+ Street;
  if Trim(Street)<>'' then result := Street;
  if Trim(House)<>'' then result := result +',' +House;
  if Trim(Appartment)<>'' then result := result +',' +Appartment;
  if Trim(CITYPATH)<>'' then result := result +' ' +CITYPATH;
  if Trim(CITYPATH)<>'' then result := result +', ' +ZIP;
  if Trim(CITYPATH)<>'' then result := result +', ' +State;

end;

procedure GetAddressClientByDataset( DBAddres:TDataset; var aDataCli:PDatCli );
begin

  if ( DBAddres<>nil ) and ( not DBAddres.isEmpty ) then
  begin
    aDataCli.Address.Representation:= FormingAddresOffice( DBAddres.fieldByName('StreetKind').asString , DBAddres.fieldByName('Street').asString,
                                      DBAddres.fieldByName( 'House').asString , DBAddres.fieldByName('Appartment').asString,
                                      DBAddres.fieldByName( 'CITYPATH').asString, DBAddres.fieldByName('ZIP').asString, DBAddres.fieldByName('STATE').asString );

    {aDataCli.Address.ZIP:= DBAddres.fieldByName('ZIP').asString;
    aDataCli.Address.State:= DBAddres.fieldByName('State').asString;
    aDataCli.Address.Region:= DBAddres.fieldByName('Region').asString;
    aDataCli.Address.District:= DBAddres.fieldByName('District').asString;
    aDataCli.Address.City:= DBAddres.fieldByName('City').asString;
    aDataCli.Address.Settlement:= DBAddres.fieldByName('Settlement').asString;
    aDataCli.Address.Street:= DBAddres.fieldByName('Street').asString;
    aDataCli.Address.House:= DBAddres.fieldByName('House').asString;
    aDataCli.Address.Building:= DBAddres.fieldByName('Building').asString;
    aDataCli.Address.Appartment:= DBAddres.fieldByName('Appartment').asString;}
  end;

end;
//******************************************************************************
function GetDataDBClientByDataset( DBClient:TDataset ):PDatCli;
begin
  result:=nil;

  if (DBClient <> nil) and( not DBClient.isEmpty ) then
  begin
    New( result );

    result.ContragentID := DBClient.FieldByName('COMPANYID').AsInteger;
    result.Name     := DBClient.FieldByName('NAME').AsString;
    result.FullName := DBClient.FieldByName('FULLNAME').AsString;
    result.Comment  := DBClient.FieldByName('Comment').AsString;
    result.HeadContragentID := DBClient.FieldByName('HEADOFFICEID').AsInteger;   // 0
    result.Legal  := DBClient.FieldByName('Legal').AsInteger = 1;
    result.INN    := DBClient.FieldByName('INN').AsString;
    result.INNSearch :=DBClient.FieldByName('INN').AsString;
    result.EDRPOU := DBClient.FieldByName('EDRPOU').AsString;
    result.ISPRIVATE:= DBClient.FieldByName('ISPRIVATE').AsBoolean;
    result.ISFILIYA := DBClient.FieldByName('ISFILIYA').AsBoolean;
    result.BranchNo := DBClient.FieldByName('FILIYACODE').AsString;
    result.CanUnlink1C := False;
    result.CanUnlinkDB := True;

    //******************************
    if ( DBClient.FieldByName('ISFILIYA').AsBoolean ) or
       ( DBClient.FieldByName('FiliyaCount').AsInteger > 0 ) then result.INNSearch:='';

    if result.ISPRIVATE then
    begin
      result.Search1CByName:=result.Name;
      if DBClient.FieldByName('Code').AsString<>'' then result.Search1CByName:='';
    end
    else
      result.Search1CByName:='';
    //******************************
    result.Code           := DBClient.FieldByName('Code').AsString;
    result.MarkedToDelete := DBClient.FieldByName('MarkedToDelete').AsBoolean;

    result.Resident:= DBClient.FieldByName('Resident').AsInteger = 1;
    result.UsedInAccounting := True;
    //******************
  end;

end;
//******************************************************************************


end.
