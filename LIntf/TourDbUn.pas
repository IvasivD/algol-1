unit TourDbUn;

interface

uses Classes, DB, TourCmnlIf, DBTables, DBCtrls, IBDatabase, IBQuery, Controls,
     ListActns, VDlgs, DateUtils, MemTableEh, cxImageComboBox, Graphics, jpeg, 
     Types, Dialogs, StrUtils, ADODB, dxmdaset;

const
  // edit dialog modes
  remStateEdit = 0;
  remStateAppend = 1;
  remStateCopy = 2;

  // reklama source preset types
  nReklamaPresetAgent = 1;
  nReklamaPresetRecidive = 2;

  // Send By constants
  nSendByEmail = 1;
  nSendByFax = 2;
  nSendByPhone = 3;

  // phone number kinds
  nPhoneKindNone = -1;
  nPhoneKindHome = 0;
  nPhoneKindWork = 1;
  nPhoneKindMobil = 2;
  //
  nRowNotModify = 0;  
  nRowAdd = 1;
  nRowDel = 2;
  nRowModify = 3;

{ apply the Filter property value to dataset without loss of focus }
procedure ApplyDataSetFilter(DataSet: TDataSet; Key: TField; const Fltr: string);

{ change the 'order by' statement in the query SQL text }
function ChangeQueryOrder(Qry: TQuery; const KeyName, NewOrder: String): Boolean; overload;
function ChangeQueryOrder(Qry: TIBQuery; const KeyName, NewOrder: String): Boolean; overload;
function ChangeQueryOrder(Qry: TADODataSet; const KeyName, NewOrder: String): Boolean; overload;

{ read dataset field into strings }
procedure DataFieldToStrings(
  Field, Key: TField; Strings: TStrings; Cleanup: Boolean = True; 
  BoolField: TField = nil);
{ TDataSet records to TStrings }
procedure DataSetToStrings(DataSet: TDataSet; KeyFld, ListFld: TField;
  Clean: Boolean; Strings: TStrings);
procedure GetMistakeList(aDatabase: TIBDatabase; 
  aListId: string; Strings: TStrings);
{ }
procedure DataSetToListItems(
  Field, Key, ImgFile: TField; const ImgPath: String;
  Items: TListControlItems; Images: TImageList; Cleanup: Boolean = True;
  AddExt: String = '');
procedure DataSetToImageListItems(
  ImgFile, Field, Key: TField; const ImgPath: String; 
  Images: TImageList; ImageItems: TcxImageComboBoxItems;
  Cleanup: Boolean = True; AddExt: String = '');

{ open closed dataset (if it is not opened) }
procedure OpenDataSet(DSet: TDataSet; ReOpen: Boolean = False);
{ refresh query by close and open }
procedure UpdateQuery(Qry: TQuery; OnlyUpdate: Boolean = False); overload;
procedure UpdateQueryEx(Qry: TQuery; OnlyUpdate: Boolean = False); overload;
procedure UpdateQueryEx(Qry: TIBQuery; OnlyUpdate: Boolean = False); overload;
procedure UpdateQueryEx(Qry: TCustomADODataSet ); overload;
procedure UpdateQuery(Qry: TIBQuery; Commited: Boolean = False; aFetchAll: Boolean = False); overload;
procedure UpdateQuery(Qry: TCustomADODataSet); overload;
procedure UpdateQueryAndLocate(Qry: TQuery; KeyField: TField; OnlyUpdate: Boolean = False); overload;
procedure UpdateQueryAndLocate(Qry: TIBQuery; KeyField: TField; Commited: Boolean = False); overload;
procedure UpdateQueryAndLocate(Qry: TCustomADODataSet; KeyField: TField; Commited: Boolean = False);overload;
procedure UpdateMemTable(MTable: TMemTableEh); overload;
procedure UpdateMemTable(MTable: TdxMemData); overload;

procedure CreateFieldMemTable(AMemData: TDataSet; AFieldName: string; AFieldType: TFieldType);

{ locate query and return current field value }
procedure QueryCheckLocate(Query: TIBQuery; const Field: string; var Id: Integer);
{ try locate query if needed and return if lacated }
function QueryCheckLocated(Query: TIBQuery; const Field: string; Value: Integer): Boolean;

{ check if the Dataset is assigned, opened and not empty }
function DataSetNotEmpty(DataSet: TDataSet): Boolean;
function DataSourceNotEmpty(DataSource: TDataSource): Boolean;

{ set the query parameter value or clear it }
procedure SetQueryParam(
  Param: TParam; AType: TFieldType; AValue: Variant; Condition: Boolean = True); overload;
procedure SetQueryParam(
  Param: TParameter; AType: TFieldType; AValue: Variant; Condition: Boolean = True); overload;
procedure SetQueryParamEx(
  Query: TIBQuery; const AParam: String; AType: TFieldType; AValue: Variant; Condition: Boolean = True);
procedure ClearQueryParam(Param: TParam; AType: TFieldType);

{ SQL routines }
function SQLWhereStatementAdd(const Where, Add: String): String;
function SQLWhereStatementOr(const Where, Add: String): String;

{ store string field value or clear field is value is empty string }
procedure StoreStringField(Field: TField; const Value: String);

{procedure SelectQueryToStrings(ADatabase: TDatabase;
  const Table, Where, Order, Id, List: String;
  Sort, Clean: Boolean; Strings: TStrings);}

{ get Interbase generator value }
function GetGeneratorValue(Database: TIBDatabase; const Generator: String): Integer; overload;
function GetGeneratorValue(ADatabase: TDatabase; const Generator: String): Integer; overload;
function CalcAverageSum(FGainSum: Real; FPeriod, FGainCount: Integer): Real;
function CalcAverageMonth(Count, Period: Integer): Integer;
function RezDate(ADate: TDateTime; Period, Anumber: Integer): TDateTime;
{ The Interbase Database transactions close }
procedure IBDatabaseCloseTransactions(
  Database: TIBDatabase; CloseCommitted: Boolean = True);

{ store program log message }

const
  nLogCategoryNone = 0;
  nLogCategoryOrder = 1;
  nLogCategoryTrip = 2;
  nLogCategoryVisa = 3;
  nLogCategoryInsure = 4;
  nLogCategoryHotel = 5;
  nLogCategoryTourist = 6;
  nLogCategoryDict = 7;
  nLogSubCategOrderChgClient = 1;
  nLogSubCategOrderDelService = 2;
  nLogSubCategOrderAnnul = 3;
  nLogSubCategOrderRestore = 4;
  nLogSubCategTripPlaceMove = 5;
  nLogSubCategTripPlaceFree = 6;
  nLogSubCategVisaDocumState = 7;
  nLogSubCategInsurePoliceTrash = 8;
  nLogSubCategInsurePoliceRereg = 9;
  nLogSubCategTripPlaceEdit = 10;
  nLogSubCategVisaRefuse = 11;
  nLogSubCategTripRouteDelete = 12;
  nLogSubCategTripSheduleDelete = 13;
  nLogSubCategTripTripDelete = 14;
  nLogSubCategHotelPlaceAdd = 15;
  nLogSubCategHotelPlaceEdit = 16;
  nLogSubCategHotelPlaceChng = 17;
  nLogSubCategHotelPlaceMove = 18;
  nLogSubCategHotelPlaceFree = 19;
  nLogSubCategHotelBatchMove = 20;
  nLogSubCategHotelOrderFree = 21;
  nLogSubCategHotelPlaceQueue = 22;
  nLogSubCategTripPlaceQueue = 23;
  nLogSubCategHotelBatchCopy = 24;
  nLogSubCategOrderApplyTempl = 25;
  nLogSubCategOrderMoveToOther = 26;
  nLogSubCategOrderPrsnRefused = 27;
  nLogSubCategTripPlaceChange = 28;
  nLogSubCategOrderPrsnDelete = 29;
  nLogSubCategTouristNameChange = 30;
  nLogSubCategTouristBirthChange = 31;
  nLogSubCategDictContractCreate = 32;
  nLogSubCategDictContractSent = 33;
  nLogSubCategDictContractCopyAttach = 34;
  nLogSubCategDictContractPrint = 35;
  nLogSubCategDictContractUsSign = 36;
  nLogSubCategDictContractSentOrig = 37;
  nLogSubCategDictContractPartnerSign = 38;
  nLogSubCategDictContractReestr = 39;
  nLogSubCategDictContractExtend = 40;
  nLogSubCategDictContractReReestr = 41;
  nLogSubCategDictContractSuspend = 42;
  nLogSubCategDictContractCancel = 43;
  nLogSubCategDictContractRestore = 44;
  nLogSubCategDictContractEnd = 45;
  nLogSubCategDictContractRepair = 46;
  nLogSubCategDictContractFinish = 47;
  nLogSubCategDictContractPermReReestr = 48;
  nLogSubCategDictContractPromiseRcvOrg = 49;
  nLogSubCategVisaFiilingDate = 50;
  nLogSubCategVisaFillingWho = 51;
  nLogSubCategVisaBioDate = 52;
  nLogSubCategVisaGivingDate = 53;
  nLogSubCategDictContractLast = nLogSubCategDictContractPromiseRcvOrg;
  nLogActionNone = 0;
  nLogActionAppend = 1;
  nLogActionModify = 2;
  nLogActionDelete = 3;

  nContractCreate = 0;
  nContractSendMail = 1;
  nContractPrint = 2;
  nContractSign = 3;
  nContractRcvCopy = 4;
  nContractSentOrig = 5;
  nContractRcvOrig = 6;
  nContractReestr = 7;
  nContractExtend = 8;  
  nContractReReestr = 9;
  nContractFinish = 10;
  nContractPermReReestr = 11;
  nContractPromiseRcvOrg = 12;

  nTourServiceTrip = 0;
  nTourServiceHotel = 1;
  nTourServiceInsure = 2;
  nTourServiceVisa = 3;
  nTourServiceExcurs = 4;
  nTourServiceResort = 5;
  nTourServiceOther = 6;
  
type
  nLogSubCategDictContractArr = nLogSubCategDictContractCreate..nLogSubCategDictContractLast;
  
var
  LogDataSet: TTable = nil;
  LogIBQuery: TIBQuery = nil;
  LogQuery: TQuery = nil;
  //LogFieldDateTime: TDateTimeField = nil;
  LogFieldCategory: TIntegerField = nil;
  LogFieldSubCateg: TIntegerField = nil;
  LogFieldAction: TIntegerField = nil;
  LogFieldOrderId: TIntegerField = nil;
  LogFieldKeyId: TIntegerField = nil;
  LogFieldLogUser: TIntegerField = nil;
  LogFieldPrompt: TMemoField = nil;

procedure LogDataChanging(
  Category, SubCategory, Action, OrderId, KeyId, User: Integer;
  const Prompt: string);

{ repository }

const
  nReposSrcDstKindOrder = 0;    // оплата замовлення  ---
  nReposSrcDstKindManager = 1;  // менеджер  ---
  nReposSrcDstKindWorker = 2;   // інший працівник
  nReposSrcDstKindClient = 3;   // замовник
  nReposSrcDstKindVendor = 4;   // постачальник
  nReposSrcDstKindAgent = 5;    // агент
  nReposSrcDstKindReturn = 6;   // повернення замовлення ---
  nReposSrcDstKindExchg = 7;    //   обмін  ---
  nReposSrcDstKindKeeper = 8;   //   каса немає --- 
  nReposSrcDstKindErrand = 9;   // немає ---
  nReposSrcDstKindOffice = 10;  // немає ---
  nReposSrcDstKindReport = 11;  // під звіт
  nReposSrcDstKindOther = 12;   // інша особа немає ---
  nReposSrcDstKindLast = nReposSrcDstKindOther;
  nReposSrcDstKindNeedConfirm = [
    nReposSrcDstKindWorker,
    nReposSrcDstKindClient..nReposSrcDstKindAgent, //nReposSrcDstKindReturn,
    nReposSrcDstKindErrand..nReposSrcDstKindOther];

function GetReposSrcDstKind(Kind: Integer; Take: Boolean): String;

{ database routines }

//var
//  BDEDecimalSeparator: Char;

function GetDatabaseErrorCategory(ErrCat: Byte): string;
function GetBDEDecimalSeparator: Char;

{ company office }
procedure GetOfficeAddress(Address: TStrings; // address -> TStrings
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
function GetOfficeAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
procedure GetHomeAddress(Address: TStrings;
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
function GetHomeAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
function GetOldAddressString(// address -> string
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
function GetShortAddress(SKnd, Addr, House, Ten: TField): string;
function GetPhoneNumber(// phoneno -> string
  Cntry, Area, Number, Ext: TField; Frmt: Boolean = False): string; overload;
function GetPhoneNumber(// phoneno -> string
  Cntry, Area, Number, Ext: Variant; Frmt: Boolean = False): string; overload;

{ otherway make addresses strings }
function MakeAddress(const Department, Address, House, Tenement: String): String;
function MakeAddressCity(
  const Country, City, Department, Province, Township: String;
  Kind: Integer = 0): String;
function MakeCityName(
  const Country, City, Province, Township: String; Kind: Integer = 0): String;
function MakeCityWithZip(
  const Country, Zip, City, Department, Province, Township: String): String;
function MakeFullAddress(
  const Country, City, Department, Province, Township,
  Address, House, Tenement: String): String;
function MakeFullAddressWithZip(
  const Country, Zip, City, Department, Province, Township,
  Address, House, Tenement: String): String;
function MakePhoneNo(
  const CntryCode, AreaCode, PhoneNo: String; const PhoneExt: String = '';
  AddPrefix: Boolean = False; const FmtStr: String = ''): String;
function MakeStreetName(const StreetName: String; StrKind: Integer = -1): String;

{ Company: private person or enterprise }
function CompanyIdent(IsEnterpr: Boolean): string;

{ additional address string routines }
procedure CityIdentsToStrings(Strings: TStrings);
procedure StreetIdentsToStrings(Strings: TStrings);
function CityIdent(Id: Integer): string;
function StreetIdent(Id: Integer): string;
//function CheckZipCode(const Zip: string): Boolean;

{ family and relative naming }
procedure RelativeIdentsToStrings(Strings: TStrings);
function RelativeIdent(Id: Integer): string;
procedure MarriedIdentsToStrings(Ua, Male: Boolean; Strings: TStrings);
function MarriedIdent(Ua, Male: Boolean; Id: Integer): string;
function StrSexIsMale(const Sex: string): Boolean;
function StrChildIsMale(const Chld: string): Boolean;
function StrSexInEng(const Sex: string): string;

{ manager permissions }
function GetUsLgPerm(ADatabase: TDatabase; Level, Item: Integer): Integer;
function GetUsLgPLev(ADatabase: TDatabase; ManId, Item: Integer): Integer;

{ convert float field edit control value to String }
function FloatFieldToString(Field: TField): string;

{ NameList table Common_Params_view constants }

const
  // NameList table categories
  nNameListCategoryPayBySponsor = 21;
  nNameListCategoryPayAsWinner = 22;
  // Common_Params_view params
  sCommonParamBillIdentExchFluctuation = 'BillIdentExchangeFluctuation';
  sCommonParamBonusProgramBillIdent = 'BonusProgramBillIdent';
  sCommonParamBillingKindDefault = 'BillingKindDefault';
  sCommonParamBillingKindCanChange = 'BillingKindCanChange';
  sCommonParamLocalManConfIdent = 'LocalManConfIdent';

{ permisions }

const
  uspDiction = 0;
  uspDictCountry = 1;
  uspDictCity = 2;
  uspDictHotel = 3;
  uspDictHotelGrp = 4;
  uspDictHotelCtg = 5;
  uspDictCurrency = 6;
  uspDictDrive = 7;
  uspDictRoomType = 8;
  uspDictRoomView = 9;
  uspDictFeedType = 10;
  uspDictService = 11;
  uspDictReklama = 12;
  uspDictCompany = 13;
  uspDictBank = 14;
  uspDictHotelBld = 15;
  uspDictInterest = 16;
  uspDictOther = 17;
  uspOrder = 256;
  uspTour = 257;
  uspRoute = 258;
  uspTrip = 259;
  uspHotel = 260;
  uspInsure = 261;
  uspVisa = 262;
  uspMail = 263;
  uspReport = 264;
  uspMPhone = 265;
  upsDevelopId = 7;
  
  uspLevelNone = $000;
  uspLevelBrowse = $001;     //           0001
  uspLevelView = $002;       //           0010
  uspLevelEdit = $004;       //           0100
  uspLevelDelete = $008;     //           1000
  uspLevelManage = $100;     // 0001
  uspLevelReport = $200;     // 0010
  uspLevelPrint = $400;      // 0100
  uspLevelChart = $800;      // 1000
  uspLevelOrderEdit = $010;  //      0001
  uspLevelOrderCash = $020;  //      0010
  uspLevelOrderBook = $040;  //      0100
  uspLevelOrderRate = $080;  //      1000
  uspLevelDictSEdit = $010;  //      0001
  uspLevelTourCreate = $010; //      0001
  uspLevelTourManage = $020; //      0010
  uspLevelTourDelete = $040; //      0100
  uspLevelTourReport = $080; //      1000
  uspLevelTripManage = $070; //      0111
  uspLevelInsrPolUse = $010; //      0001
  uspLevelInsrPolMan = $020; //      0010
  uspLevelInsrPolRep = $040; //      0100
  uspLevelInsrPolAll = $070; //      0111
  uspLevelInsrPolXtra = $080; //     1000
  uspLevelInsrPolAdm = $0F0; //      1111
  uspLevelAdmin = $F00; //uspLevelChart + uspLevelPrint + uspLevelReport + uspLevelManage
  uspLevelManSale = 1095;      //$447;   0100 0100 0111
  uspLevelManDict = 1639;      //$667;   0110 0110 0111
  uspLevelManWork = 1647;      //$66F;   0110 0110 1111
  uspLevelKeeper = 1919;       //$77F;   0111 0111 1111
  uspLevelOrderCasher = 547;   //$223;   0010 0010 0011
  uspLevelOrderSaler = 1591;   //$637;   0110 0011 0111
  uspLevelOrderKeeper = 1651;  //$673;   0110 0111 0011
  uspLevelOrderManager = 1727; //$6BF;   0110 1011 1111
  uspLevelOrderMarket = 3587;  //$E03;   1110 0000 0011
  uspLevelInsurManager = 1559; //$617;   0110 0001 0111
  uspLevelInsurHeadMan = 1919; //$77F;   0111 0111 1111
  uspLevelInsurXtraMan = 2047; //$7FF;   0111 1111 1111
  uspLevelTourCommon = 1539;   //$603;   0110 0000 0011
  uspLevelTourManager = 1583;  //$62F;   0110 0010 1111
  uspLevelTourHeadMan = 1663;  //$67F;   0110 0111 1111
  uspLevelTourAdmin = 4095;    //$FFF;   1111 1111 1111
  uspLevelAll = 4095;          //$FFF;   1111 1111 1111

{ check permission in user permission level }
function GetUspLevelPerm(Level, Perm: Cardinal): Boolean;
function GetUspCanAccess(Level: Cardinal): Boolean;
function GetUspCanAdmin(Level: Cardinal): Boolean;
function GetUspCanAdd(Level: Cardinal): Boolean;
function GetUspCanEdit(Level: Cardinal): Boolean;
function GetUspCanDelete(Level: Cardinal): Boolean;
function GetUspCanManage(Level: Cardinal): Boolean;
function GetUspCanPrint(Level: Cardinal): Boolean;
function GetUspCanView(Level: Cardinal): Boolean;

{Order}
function NeedQueryToString(Qry: TDataset; DataSrc: TDataSource): String;
function QueryToString(Qry, MisQry: TDataset; DataSrc: TDataSource;
  IsReturn: Boolean = False; ForManager: Boolean = False; OnlyBadDoc: Boolean = False): String;
function GetLocationDoc(Qry: TDataset): string;
function GetBonusProgram(DataSt: TDataSet): string;
procedure DrawSpecialDateImg(Canvas: TCanvas; Rct: TRect; 
      DataSt: TDataSet; aImage: TJpegImage);
  
function CheckTouristPassportExpire(
  IssuedDate, ExpireDate, aTourDate: TDateTime; 
  aDayCount, aPassMonth: Integer;
  VisaFromDate, VisaToDate: TField): Boolean;
  
implementation

uses BDE, SysUtils, Forms, IBSQL,  TourConsts,
  IBCustomDataSet, OrderHtmlConst, OrderUn, Math, Variants;

procedure ApplyDataSetFilter(DataSet: TDataSet; Key: TField; const Fltr: string);
var Id: Integer;
begin
  with DataSet do
  begin
    if Active and (RecordCount > 0) then Id := Key.AsInteger else Id := 0;
    Filter := Fltr;
    if Active and (RecordCount > 0) and (Id > 0) and (Id <> Key.AsInteger) then
      Locate(Key.FieldName, Id, []);
  end;
end;

function ChangeQueryOrder(Qry: TQuery; const KeyName, NewOrder: String): Boolean;
const sOrd = 'order by';
var
  OldSQL, NewSQL, Id, Ord: string;
  P: Integer;
begin
  Result := True;
  Screen.Cursor := crHourGlass;
  with Qry do
    try
      if Active and (KeyName <> '') then Id := FieldByName(KeyName).AsString
      else Id := '';
      Close;
      OldSQL := SQL.Text;
      P := Pos(sOrd, OldSQL);
      if P > 0 then NewSQL := Copy(OldSQL, 1, P + Length(sOrd) - 1)
      else NewSQL := OldSQL + #32 + sOrd;
      if NewOrder <> '' then Ord := NewOrder
      else if KeyName <> '' then Ord := KeyName
      else Ord := '1';
      SQL.Text := NewSQL + #32 + Ord;
      try
        Prepare;
        Open;
      except
        Result := False;
        SQL.Text := OldSQL;
        Prepare;
        Open;
      end;
      if (Id <> '') and (KeyName <> '') then Locate(KeyName, Id, []);
    finally
      Screen.Cursor := crDefault;
    end;
end;

function ChangeQueryOrder(Qry: TIBQuery; const KeyName, NewOrder: String): Boolean;
const sOrd = 'order by';
var
  Old, S, Id, Ord: string;
  P: Integer;
begin
  Result := True;
  Screen.Cursor := crHourGlass;
  with Qry do
    try
      if Active and (KeyName <> '') then Id := FieldByName(KeyName).AsString
      else Id := '';
      Close;
      Old := SQL.Text;
      P := Pos(sOrd, Old);
      if P > 0 then S := Copy(Old, 1, P + Length(sOrd) - 1)
        else S := Old + #32 + sOrd;
      if NewOrder <> '' then Ord := NewOrder
      else if KeyName <> '' then Ord := KeyName
      else Ord := '1';
      SQL.Text := S + #32 + Ord;
      try
        Prepare;
        Open;
      except
        Result := False;
        SQL.Text := Old;
        Prepare;
        Open;
      end;
      if (Id <> '') and (KeyName <> '') then Locate(KeyName, Id, []);
    finally
      Screen.Cursor := crDefault;
    end;
end;

function ChangeQueryOrder(Qry: TADODataSet; const KeyName, NewOrder: String): Boolean; overload;
const sOrd = 'order by';
var
  Old, S, Id, Ord: string;
  P: Integer;
begin
  Result := True;
  Screen.Cursor := crHourGlass;
  with Qry do
    try
      if Active and (KeyName <> '') then Id := FieldByName(KeyName).AsString
      else Id := '';
      Close;
      Old := CommandText;
      P := Pos(sOrd, Old);
      if P > 0 then S := Copy(Old, 1, P + Length(sOrd) - 1)
        else S := Old + #32 + sOrd;
      if NewOrder <> '' then Ord := NewOrder
      else if KeyName <> '' then Ord := KeyName
      else Ord := '1';
      CommandText := S + #32 + Ord;
      try
        Open;
      except
        Result := False;
        CommandText := Old;
        Open;
      end;
      if (Id <> '') and (KeyName <> '') then Locate(KeyName, Id, []);
    finally
      Screen.Cursor := crDefault;
    end;
end;


procedure DataFieldToStrings(Field, Key: TField; Strings: TStrings; 
  Cleanup: Boolean = True; BoolField: TField = nil);
{$WARN UNSAFE_TYPE OFF}
var
  Calc: TDataSetNotifyEvent;
  Mrk: TBookmark;
  StrVal: String;
begin
  if Cleanup then Strings.Clear;
  with Field, DataSet do
  begin
    if not Active then Open;
    Mrk := GetBookmark;
    Calc := OnCalcFields;
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if not IsNull and (not Assigned(BoolField) or not BoolField.AsBoolean) then
        begin
          if DataType in [ftDate, ftTime, ftDateTime] then StrVal := DisplayText
          else StrVal := AsString;
          if Assigned(Key) then
            Strings.AddObject(StrVal, Pointer(Key.AsInteger))
          else Strings.AddObject(StrVal, Pointer(GetBookmark));
        end;
        Next;
      end;
    finally
      OnCalcFields := Calc;
      GotoBookmark(Mrk);
      FreeBookmark(Mrk);
      EnableControls;
    end;
  end;
{$WARN UNSAFE_TYPE ON}
end;

procedure DataSetToStrings(DataSet: TDataSet; KeyFld, ListFld: TField;
  Clean: Boolean; Strings: TStrings);
begin
  DataSet.First;
  with Strings do
  begin
    if Clean then Clear;
    while not DataSet.Eof do
    begin
      if Assigned(KeyFld) and (KeyFld is TIntegerField) then
      {$WARN UNSAFE_TYPE OFF}
        AddObject(ListFld.AsString, Pointer(KeyFld.AsInteger))
      {$WARN UNSAFE_TYPE ON}
      else Add(ListFld.AsString);
      DataSet.Next;
    end;
  end;
end;

procedure GetMistakeList(aDatabase: TIBDatabase; 
  aListId: string; Strings: TStrings);
const MisSQL = 'Select V.MismatchName, V.MismatchId ' +
    'From Mismatch_View V ' +
    'Where MismatchId in (%s) ' +
    'Order by MismatchName';
begin
  with TIBQuery.Create(aDatabase.Owner) do 
  try
    Transaction := aDatabase.DefaultTransaction;
    aListId := StringReplace(aListId, ';', ',', [rfReplaceAll]);
    System.Delete(aListId, Length(aListId), 1);
    SQL.Text := Format(MisSQL, [aListId]);
    Open;
    DataFieldToStrings(FieldByName('MISMATCHNAME'), FieldByName('MismatchId'), Strings);
    Close;
  finally
    Free;
  end;
end;

procedure DataSetToListItems(
  Field, Key, ImgFile: TField; const ImgPath: String;
  Items: TListControlItems; Images: TImageList; Cleanup: Boolean = True;
  AddExt: String = '');
{$WARN UNSAFE_TYPE OFF}
var
  Calc: TDataSetNotifyEvent;
  Mrk: TBookmark;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
  FN: String;
  Rct: TRect;
begin
  if Cleanup then
  begin
    Items.Clear;
    Images.Clear;
  end;
  Jpg := TJPEGImage.Create;
  Bmp := TBitmap.Create;
  with Field, DataSet do
  try
    Bmp.Width := Images.Width;
    Bmp.Height := Images.Height;
    if not Active then Open;
    Mrk := GetBookmark;
    Calc := OnCalcFields;
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if not IsNull then
          with Items.Add do
          begin
            Caption := AsString;
            if Assigned(Key) then Data := Pointer(Key.AsInteger);
            if Assigned(ImgFile) then
            begin
              FN := IncludeTrailingPathDelimiter(ImgPath) + ImgFile.AsString + AddExt;
              if FileExists(FN) then
              begin
                Jpg.LoadFromFile(FN);
                Rct := Bmp.Canvas.ClipRect;
                Bmp.Canvas.StretchDraw(Rct, Jpg);
                ImageIndex := Images.AddMasked(Bmp, clInfoBk);
              end
              else ImageIndex := -1;
            end;
          end;
        Next;
      end;
    finally
      OnCalcFields := Calc;
      GotoBookmark(Mrk);
      FreeBookmark(Mrk);
      EnableControls;
    end;
  finally
    Bmp.Free;
    Jpg.Free;
  end;
{$WARN UNSAFE_TYPE ON}
end;

procedure DataSetToImageListItems(
  ImgFile, Field, Key: TField; const ImgPath: String; 
  Images: TImageList; ImageItems: TcxImageComboBoxItems;
  Cleanup: Boolean = True; AddExt: String = '');
{$WARN UNSAFE_TYPE OFF}
var
  Calc: TDataSetNotifyEvent;
  Mrk: TBookmark;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
  FN: String;
  Rct: TRect;
  ImageColItem: TCollectionItem;
  I: Integer;
begin
  if Cleanup then Images.Clear;
  Jpg := TJPEGImage.Create;
  Bmp := TBitmap.Create;
  I := 0;
  with ImgFile, DataSet do
  try
    Bmp.Width := Images.Width;
    Bmp.Height := Images.Height;
    if not Active then Open;
    Mrk := GetBookmark;
    Calc := OnCalcFields;
    ImageItems.BeginUpdate;
    try
      ImageItems.Clear;
      DisableControls;
      First;
      while not Eof do
      begin
        if not IsNull then
        begin
          ImageItems.Add;          
          with ImageItems[I] do
            if Assigned(ImgFile) then
            begin
              FN := IncludeTrailingPathDelimiter(ImgPath) + ImgFile.AsString + AddExt;
              Description := Field.Value;
              Value := Key.Value;
              if FileExists(FN) then
              begin
                Jpg.LoadFromFile(FN);
                Rct := Bmp.Canvas.ClipRect;
                Bmp.Canvas.StretchDraw(Rct, Jpg);
                ImageIndex := Images.AddMasked(Bmp, clInfoBk);
              end else ImageIndex := -1;
            end;
          Inc(I);  
        end;
        Next;
      end;
    finally
      OnCalcFields := Calc;
      GotoBookmark(Mrk);
      FreeBookmark(Mrk);
      EnableControls;
    end;
  finally
    Bmp.Free;
    Jpg.Free;
  end;
{$WARN UNSAFE_TYPE ON}
end;

procedure OpenDataSet(DSet: TDataSet; ReOpen: Boolean = False);
begin
  with DSet do begin
    if ReOpen then Close;
    if not Active then
    begin
      if DSet is TQuery then UpdateQuery(DSet as TQuery) else Open;
    end;
  end;
end;

procedure SelectQueryToStrings(ADatabase: TDatabase;
  const Table, Where, Order, Id, List: string;
  Sort, Clean: Boolean; Strings: TStrings);
var Lst, Ord: string;
begin
  if Clean then Strings.Clear;
  with TQuery.Create(ADatabase.Owner) do
  try
    DatabaseName := ADatabase.DatabaseName;
    Lst := StringReplace(List, ';', ' || '' № '' || ', [rfReplaceAll]);
    SQL.Add(Format('select %s, %s from %s', [Id, Lst, Table]));
    if Where <> '' then SQL.Add('where ' + Where);
    if Order = '' then
      Ord := StringReplace(List, ';', ', ', [rfReplaceAll]) else Ord := Order;
    if Sort then SQL.Add(Format('order by %s', [Ord]));
    Prepare;
    Open;
    while not Eof do
    begin
      {$WARN UNSAFE_TYPE OFF}
      Strings.AddObject(
        Fields[1].DisplayText, Pointer(FieldByName(Id).AsInteger));
      {$WARN UNSAFE_TYPE ON}
      Next;
    end;
    Close;
  finally
    Free;
  end;
end;

procedure UpdateQuery(Qry: TQuery; OnlyUpdate: Boolean = False);
begin
  //Application.ProcessMessages;
  Screen.Cursor := crHourglass;
  with Qry do
  try
    //if not OnlyUpdate then DisableControls;
    Close;
    Prepare;
    Open;
  finally
    Screen.Cursor := crDefault;
    if not OnlyUpdate then
    begin
      EnableControls;
    end;
  end;
end;

procedure UpdateQuery(Qry: TIBQuery; Commited: Boolean = False; aFetchAll: Boolean = False);
begin
  Screen.Cursor := crHourglass;
  with Qry do
  try
//    if not OnlyUpdate then DisableControls;
    if Commited and Transaction.Active then Transaction.Commit;
    Close;
    Prepare;
    Open;
    if aFetchAll then FetchAll;
  finally
    Screen.Cursor := crDefault;
{    if not OnlyUpdate then
    begin
      EnableControls;
    end;}
  end;
end;

procedure UpdateQuery(Qry: TCustomADODataSet);
begin
  Screen.Cursor := crHourglass;
  try
    if Qry.Active then Qry.Requery else Qry.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end; 

{$WARN UNSAFE_TYPE OFF}
procedure UpdateQueryEx(Qry: TQuery; OnlyUpdate: Boolean = False);
var Mrk: TBookmark;
begin
  with Qry do
  begin
    Mrk := GetBookmark;
    try
      UpdateQuery(Qry, OnlyUpdate);
      try
        GotoBookmark(Mrk);
      except;
      end;
    finally
      FreeBookmark(Mrk);
    end;
  end;
end;

procedure UpdateQueryEx(Qry: TIBQuery; OnlyUpdate: Boolean = False);
var Mrk: TBookmark;
begin
  with Qry do
  begin
    Mrk := GetBookmark;
    try
      UpdateQuery(Qry, OnlyUpdate);
      try
        GotoBookmark(Mrk);
      except;
      end;
    finally
      FreeBookmark(Mrk);
    end;
  end;
end;

procedure UpdateQueryEx(Qry: TCustomADODataSet );
var Mrk: TBookmark;
begin
  with Qry do
  begin
    Mrk := GetBookmark;
    try
      UpdateQuery( Qry);
      try
        GotoBookmark(Mrk);
      except;
      end;
    finally
      FreeBookmark(Mrk);
    end;
  end;
end;

{$WARN UNSAFE_TYPE ON}
procedure UpdateQueryAndLocate(Qry: TQuery; KeyField: TField; OnlyUpdate: Boolean = False);
var Id: Integer;
begin
  if Qry.Active and Assigned(KeyField) then Id := KeyField.AsInteger
  else Id := 0;
  UpdateQuery(Qry);
  if Id > 0 then Qry.Locate(KeyField.FieldName, Id, []);
end;

procedure UpdateQueryAndLocate(Qry: TIBQuery; KeyField: TField; Commited: Boolean = False);
var Id: Integer;
begin
  if Qry.Active and Assigned(KeyField) then Id := KeyField.AsInteger
  else Id := 0;
  UpdateQuery(Qry, Commited);
  if Id > 0 then Qry.Locate(KeyField.FieldName, Id, []);
end;

procedure UpdateQueryAndLocate(Qry: TCustomADODataSet; KeyField: TField; Commited: Boolean = False);
var Id: Integer;
begin
  if Qry.Active and Assigned(KeyField) then Id := KeyField.AsInteger
  else Id := 0;
  UpdateQuery( Qry );
  if Id > 0 then Qry.Locate(KeyField.FieldName, Id, []);
end;

procedure UpdateMemTable(MTable: TMemTableEh);
begin
  with MTable do
  begin
    if Active then EmptyTable//DestroyTable; 
    else CreateDataSet;
    Open;
  end;
end;

procedure UpdateMemTable(MTable: TdxMemData); 
begin
  if MTable.Active then MTable.Close;
  MTable.Open;
end; 
{ locate query and return current field value }

procedure QueryCheckLocate(Query: TIBQuery; const Field: string; var Id: Integer);
begin
  if (Id = 0) or not Query.Locate(Field, Id, []) then
    Id := Query.FieldByName(Field).AsInteger;
end;

{ try locate query if needed and return if lacated }

function QueryCheckLocated(Query: TIBQuery; const Field: string; Value: Integer): Boolean;
begin
  with Query do
    Result := (FieldByName(Field).AsInteger = Value) or Locate(Field, Value, []);
end;

{ check if the Dataset object is assigned, opened and not empty }

function DataSetNotEmpty(DataSet: TDataSet): Boolean;
begin
  if not Assigned(DataSet) then Result := False
  else with DataSet do Result := Active and (RecordCount > 0);
end;

function DataSourceNotEmpty(DataSource: TDataSource): Boolean;
begin
  Result := Assigned(DataSource) and DataSetNotEmpty(DataSource.DataSet);
end;

{ set the query parameter value or clear it }

procedure SetQueryParam(
  Param: TParameter; AType: TFieldType; AValue: Variant; Condition: Boolean = True);
begin
  if Param <> nil then
    with Param do
    begin
      DataType := AType;
      if Condition then
        case AType of
          ftMemo, ftBlob:
          begin
            DataType := ftBlob;
            Value := AValue;
          end;
        else Value := AValue;
        end
      else 
        Value := null;
    end;
end;

procedure SetQueryParam(
  Param: TParam; AType: TFieldType; AValue: Variant; Condition: Boolean = True); 
begin
  if Param <> nil then
    with Param do
    begin
      DataType := AType;
      if Condition then
        case AType of
          ftDateTime, ftDate, ftTime:
            AsDateTime := AValue;
          ftMemo, ftBlob:
          begin
            DataType := ftBlob;
            Clear;
            AsMemo := AValue;
          end;
        else Value := AValue;
        end
      else begin
        Clear;
        Bound := True; //False;
      end;
    end;
end;


procedure SetQueryParamEx(
  Query: TIBQuery; const AParam: String; AType: TFieldType; AValue: Variant; Condition: Boolean = True);
begin
  SetQueryParam(Query.Params.FindParam(AParam), AType, AValue, Condition);
end;

procedure ClearQueryParam(Param: TParam; AType: TFieldType);
begin
  SetQueryParam(Param, AType, varNull, False);
end;   

{ SQL routines }

function SQLWhereStatementAdd(const Where, Add: String): String;
begin     // adding condition to Where statement
  if Trim(Add) = '' then Result := Where
  else if Trim(Where) = '' then Result := Add
  else Result := Where + ' and ' + Add;
end;

function SQLWhereStatementOr(const Where, Add: String): String;
begin     // adding 'or' condition to Where statement
  if Trim(Add) = '' then Result := Where
  else if Trim(Where) = '' then Result := Add
  else Result := Where + ' or ' + Add;
end;

{ store string field value or clear field is value is empty string }

procedure StoreStringField(Field: TField; const Value: String);
begin
  if Value = '' then Field.Clear else Field.AsString := Value;
end;

{ get Interbase generator value }

const sGeneratorSQL = 'SELECT GEN_ID(%s, 1) FROM RDB$DATABASE';

function GetGeneratorValue(Database: TIBDatabase; const Generator: String): Integer;
begin
  if Generator = '' then Result := 0
  else
    with TIBSQL.Create(Database) do
    try
      Transaction := Database.DefaultTransaction;
      with Transaction do if not Active then Active := True;
      SQL.Text := Format(sGeneratorSQL, [Generator]);
      ExecQuery;
      Result := Current.Vars[0].AsInteger;
      Close;
    finally
      Free;
    end;
end;

function GetGeneratorValue(ADatabase: TDatabase; const Generator: String): Integer; overload;
begin
  if Generator = '' then Result := 0
  else
    with TQuery.Create(ADatabase.Owner) do
    try
      DatabaseName := ADatabase.DatabaseName;
      SQL.Text := Format(sGeneratorSQL, [Generator]);
      Prepare;
      Open;
      Result := Fields[0].AsInteger;
      Close;
    finally
      Free;
    end;
end;

{ The Interbase Database transactions close }

procedure IBDatabaseCloseTransactions(
  Database: TIBDatabase; CloseCommitted: Boolean = True);
var I: Integer;
begin
  with Database do
    for I := 0 to TransactionCount - 1 do
      with Transactions[I] do
        if Active then
        begin
          if CloseCommitted then Commit else Rollback;
        end;
end;

{ store program log message }

const
  sLogAddSQL = 'insert into ProgramLog (' +
    'LogCategory, SubCategory, LogAction, OrderId, KeyId, UserId, LogPrompt) values(' +
    ':LogCategory, :SubCategory, :LogAction, :OrderId, :KeyId, :UserId, :Prompt)';

procedure LogDataChanging(
  Category, SubCategory, Action, OrderId, KeyId, User: Integer;
  const Prompt: string);
begin
  if (Category = nLogCategoryNone) or (Action = nLogActionNone) or (Prompt = '')
    or not (
      Assigned(LogIBQuery)
      or Assigned(LogQuery)
      or Assigned(LogDataSet) and Assigned(LogFieldLogUser)
        and Assigned(LogFieldCategory) and Assigned(LogFieldSubCateg)
        and Assigned(LogFieldAction) and Assigned(LogFieldPrompt))
  then Exit;
  if Assigned(LogIBQuery) then
    with LogIBQuery do
    begin
      with Transaction do if Active then Commit;
      SetQueryParam(ParamByName('LogCategory'), ftInteger, Category);
      SetQueryParam(ParamByName('SubCategory'), ftInteger, SubCategory,
        SubCategory <> nLogCategoryNone);
      SetQueryParam(ParamByName('LogAction'), ftInteger, Action);
      SetQueryParam(ParamByName('OrderId'), ftInteger, OrderId, OrderId > 0);
      SetQueryParam(ParamByName('KeyId'), ftInteger, KeyId);
      SetQueryParam(ParamByName('UserId'), ftInteger, User);
      SetQueryParam(ParamByName('LogPrompt'), ftMemo, Prompt);
      Prepare;
      ExecSQL;
      Transaction.Commit;
    end
  else if Assigned(LogQuery) then
    with LogQuery do
    try
      if Active then Close;
      SetQueryParam(ParamByName('LogCategory'), ftInteger, Category);
      SetQueryParam(ParamByName('SubCategory'), ftInteger, SubCategory,
        SubCategory <> nLogCategoryNone);
      SetQueryParam(ParamByName('LogAction'), ftInteger, Action);
      SetQueryParam(ParamByName('OrderId'), ftInteger, OrderId, OrderId > 0);
      SetQueryParam(ParamByName('KeyId'), ftInteger, KeyId);
      SetQueryParam(ParamByName('UserId'), ftInteger, User);
      SetQueryParam(ParamByName('LogPrompt'), ftMemo, Prompt);
      Prepare;

      ExecSQL;
    finally
      Close;
    end
  else
    with LogDataSet do
    begin
      if not Active then Open;
      Append;
      LogFieldCategory.Value := Category;
      if SubCategory <> nLogCategoryNone then LogFieldSubCateg.Value := SubCategory;
      LogFieldAction.Value := Action;
      if Assigned(LogFieldOrderId) then LogFieldOrderId.Value := OrderId;
      if Assigned(LogFieldKeyId) then LogFieldKeyId.Value := KeyId;
      LogFieldLogUser.Value := User;
      LogFieldPrompt.AsString := Prompt;
      Post;
      Refresh;
    end;
end;

{ repository }

function GetReposSrcDstKind(Kind: Integer; Take: Boolean): String;
const sKnd: array[0..nReposSrcDstKindLast] of String = (
  STourDbUnReposKindOrder, STourDbUnReposKindManager, STourDbUnReposKindWorker,
  STourDbUnReposKindClient, STourDbUnReposKindVendor, STourDbUnReposKindAgent,
  STourDbUnReposKindReturn, STourDbUnReposKindExchg, STourDbUnReposKindKeeper,
  STourDbUnReposKindErrand, STourDbUnReposKindOffice, STourDbUnReposKindReport,
  STourDbUnReposKindOther);
begin
  Result := sKnd[Kind];
  if Take and (Result = STourDbUnReposKindReport) then
    Result := STourDbUnReposKindReportTake;
end;

{ database error messages }

function GetDatabaseErrorCategory(ErrCat: Byte): string;
begin
  case ErrCat of
    ERRCAT_SYSTEM: Result := SDataModExceptCatSystem;
    ERRCAT_NOTFOUND: Result := SDataModExceptCatNotFound;
    ERRCAT_DATACORRUPT: Result := SDataModExceptCatDataCorrupt;
    ERRCAT_IO: Result := SDataModExceptCatIOError;
    ERRCAT_LIMIT: Result := SDataModExceptCatLimit;
    ERRCAT_INTEGRITY: Result := SDataModExceptCatIntegrity;
    ERRCAT_INVALIDREQ: Result := SDataModExceptCatInvalidRequest;
    ERRCAT_LOCKCONFLICT: Result := SDataModExceptCatLockConflict;
    ERRCAT_SECURITY: Result := SDataModExceptCatSecurity;
    ERRCAT_INVALIDCONTEXT: Result := SDataModExceptCatInvalidContext;
    ERRCAT_OS: Result := SDataModExceptCatOSorIdapi;
    ERRCAT_NETWORK: Result := SDataModExceptCatNetwork;
    ERRCAT_OPTPARAM: Result := SDataModExceptCatOptParam;
    ERRCAT_QUERY: Result := SDataModExceptCatQuery;
    ERRCAT_VERSION: Result := SDataModExceptCatVersion;
    ERRCAT_CAPABILITY: Result := SDataModExceptCatCapability;
    ERRCAT_CONFIG: Result := SDataModExceptCatConfig;
    ERRCAT_WARNING: Result := SDataModExceptCatWarning;
    ERRCAT_OTHER: Result := SDataModExceptCatOther;
    ERRCAT_COMPATIBILITY: Result := SDataModExceptCatCompatibility;
    ERRCAT_REPOSITORY: Result := SDataModExceptCatRepository;
    ERRCAT_DRIVER: Result := SDataModExceptCatDriver;
    ERRCAT_RC: Result := SDataModExceptCatInternal;
    else Result := '';
  end;
end;

function GetBDEDecimalSeparator: Char;
var BDENumberFormat: FMTNumber;
begin
  if DbiGetNumberFormat(BDENumberFormat) = DBIERR_NONE then
    Result := BDENumberFormat.cDecimalSeparator else Result := DecimalSeparator;
end;

{Company: private person or enterprise}

function CompanyIdent(IsEnterpr: Boolean): string;
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const pP: array[Boolean] of Pointer = (@SClientDlgPrivate, @SClientDlgEnterpr);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
begin
  Result := LoadResString(pP[IsEnterpr]);
end;

{ address string routines }

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const
  pCityIdents: array[0..7] of Pointer = (@SVDlgsCity0, @SVDlgsCity1,
    @SVDlgsCity2, @SVDlgsCity3, @SVDlgsCity4, @SVDlgsCity5, @SVDlgsCity6, @SVDlgsCity7);
  pStreetIdents: array[0..13] of Pointer = (@SVDlgsStreet0, @SVDlgsStreet1,
    @SVDlgsStreet2, @SVDlgsStreet3, @SVDlgsStreet4, @SVDlgsStreet5,
    @SVDlgsStreet6, @SVDlgsStreet7, @SVDlgsStreet8, @SVDlgsStreet9,
    @SVDlgsStreet10, @SVDlgsStreet11, @SVDlgsStreet12, @SVDlgsStreet13);
  pRelativeIdents: array[0..3] of Pointer = (
    @SVDlgsRelative0, @SVDlgsRelative1, @SVDlgsRelative2, @SVDlgsRelative3);
  pMarriedMUaIdents: array[0..4] of Pointer = (@SVDlgsMarriedMUa0,
    @SVDlgsMarriedMUa1, @SVDlgsMarriedMUa2, @SVDlgsMarriedMUa3, @SVDlgsMarriedMUa4);
  pMarriedFUaIdents: array[0..4] of Pointer = (@SVDlgsMarriedFUa0,
    @SVDlgsMarriedFUa1, @SVDlgsMarriedFUa2, @SVDlgsMarriedFUa3, @SVDlgsMarriedFUa4);
  pMarriedMEnIdents: array[0..4] of Pointer = (@SVDlgsMarriedMEn0,
    @SVDlgsMarriedMEn1, @SVDlgsMarriedMEn2, @SVDlgsMarriedMEn3, @SVDlgsMarriedMEn4);
  pMarriedFEnIdents: array[0..4] of Pointer = (@SVDlgsMarriedFEn0,
    @SVDlgsMarriedFEn1, @SVDlgsMarriedFEn2, @SVDlgsMarriedFEn3, @SVDlgsMarriedFEn4);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}

procedure CityIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pCityIdents);
end;

procedure StreetIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pStreetIdents);
end;

function CityIdent(Id: Integer): string;
begin
  if Id = 0 then Result := '' else Result := LoadResString(pCityIdents[Id]);
end;

function StreetIdent(Id: Integer): string;
begin
  Result := LoadResString(pStreetIdents[Id]);
end;

{ company office }

procedure GetAddressToStrings(Address: TStrings;
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  IsOffice, Clean: Boolean);
const
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
  pTn: array[Boolean] of Pointer = (@SVDlgsAddressTenmnt, @SVDlgsAddressOffice);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
var Adr: string;
begin
  Adr := EmptyStr;
  if Assigned(House) then Adr := House.AsString; // hause
  with Ten do // + tenement
    if Assigned(Ten) and (AsString <> '') then
      Adr := Format('%s %s %s', [Adr, LoadResString(pTn[IsOffice]), AsString]);
  with Address do
  begin
    if Clean then Clear;
    
    with Addr do // address
    if Assigned(Addr) then Adr := IfThen(Trim(Adr) = '', AsString, Format('%s, %s', [AsString, Adr]));
    if Assigned(SKnd) and not SKnd.IsNull then
      Adr := StreetIdent(SKnd.AsInteger) + #32 + Adr;
    Add(Adr);
    if Assigned(CKnd) then Adr := CityIdent(CKnd.AsInteger);
    Adr := Adr + #32 + City.AsString; // city
    with TShp do
      if AsString <> '' then Adr := Adr + #32 + AsString; // + township
    Add(Trim(Adr));
    with Prov do if AsString <> '' then Add(AsString); // province
    Adr := '';
    if Assigned(Zip) then Adr := Zip.AsString;
    if Assigned(Cntry) then Adr := Adr + '  ' + Cntry.AsString; // country
    Add(Trim(Adr));
  end;
end;

procedure GetOfficeAddress(Address: TStrings;
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
var Adr: string;
begin
  Adr := House.AsString; // hause
  if Assigned(Ten) then
    with Ten do // + tenement
      if AsString <> '' then Adr := Format('%s, офіс %s', [Adr, AsString]);
  with Address do
  begin
    if Clean then Clear;
    with Addr do // address
      if Trim(Adr) = '' then
        Adr := AsString else Adr := Format('%s, %s', [AsString, Adr]);
    if Assigned(SKnd) and not SKnd.IsNull then
      Adr := StreetIdent(SKnd.AsInteger) + #32 + Adr;
    Add(Adr);
    Adr := City.AsString; // city
    if Assigned(CKnd) then Adr := CityIdent(CKnd.AsInteger) + #32 + Adr;
    if Assigned(TShp) then
      with TShp do
        if AsString <> '' then Adr := Adr + #32 + AsString; // + township
    Add(Trim(Adr));
    if Assigned(Prov) then
      with Prov do if AsString <> '' then Add(AsString); // province
    if Assigned(Zip) then Adr := Zip.AsString else Adr := ''; // zip code
    if Assigned(Cntry) then Adr := Adr + '  ' + Cntry.AsString; // country
    if Adr <> '' then Add(Trim(Adr));
  end;
end;

function GetOfficeAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
var
  Address: TStrings;
  I: Integer;
begin
  Result := '';
  Address := TStringList.Create;
  try
    GetOfficeAddress(Address,
      SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry);
    with Address do
      for I := 0 to Count - 1 do
        if Strings[I] <> '' then Result := Result + Strings[I] + #32;
  finally
    Address.Free;
  end;
end;

procedure GetHomeAddress(Address: TStrings;
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
begin
  GetAddressToStrings(Address,
    SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry, False, Clean);
end;

function GetHomeAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
var
  Address: TStrings;
  I: Integer;
begin
  Result := '';
  Address := TStringList.Create;
  try
    GetHomeAddress(Address,
      SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry);
    with Address do
      for I := 0 to Count - 1 do
        if Strings[I] <> '' then Result := Result + Strings[I] + #32;
  finally
    Address.Free;
  end;
end;

function GetOldAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
var Adr: string;
begin
  Result := GetShortAddress(SKnd, Addr, House, Ten);
  Adr := City.AsString; // city
  if Assigned(CKnd) and not CKnd.IsNull then
    Adr := CityIdent(CKnd.AsInteger) + #32 + Adr;
  if Assigned(TShp) and (TShp.AsString <> '') then // + township
    Adr := TShp.AsString + ','#32 + Adr;
  if Trim(Result) <> '' then Adr := Adr + ','; // city + address
  Result := Trim(Adr) + #32 + Result;
  if Assigned(Prov) and (Prov.AsString <> '') then
    Result := Prov.AsString + ','#32 + Result; // province + address
  if Assigned(Zip) and (Zip.AsString <> '') then // zip code
    Adr := Zip.AsString + ',' else Adr := '';
  Result := Adr + #32 + Result;   // zip + address
  if Assigned(Cntry) then
    Result := Cntry.AsString + #32 + Result; // country + address
end;

function GetShortAddress(SKnd, Addr, House, Ten: TField): string;
begin
  if not Assigned(House) or (House.AsString = '') then Result := ''
  else begin
    Result := House.AsString; // house
    if Assigned(Ten) and (Ten.AsString <> '') then // + tenement
      Result := Format('%s / %s', [Result, Ten.AsString]);
  end;
  if not Assigned(Addr) then Exit; // only house and tenement
  with Addr do
    if Trim(Result) = '' then Result := AsString // address
    else Result := Format('%s, %s', [AsString, Result]);
  if Assigned(SKnd) and not SKnd.IsNull and (Trim(Result) <> '') then
    Result := StreetIdent(SKnd.AsInteger) + #32 + Result;
end;

function GetPhoneNumber(
  Cntry, Area, Number, Ext: TField; Frmt: Boolean = False): string; 
const sFrmt: array[Boolean] of string = ('%s %s', '+(%s) %s');
begin
  //Result := Trim(Cntry.AsString + #32 + Area.AsString);
  Result := Trim(Area.AsString);
  if (Trim(Cntry.AsString) = '380') and (Result = '') then
    Result := Trim(Cntry.AsString + #32'322')
  else if (Trim(Cntry.AsString) = '380') and (Result[1] = '0') then
    Result := Trim(Cntry.AsString + #32 + Copy(Result, 2, Length(Result)))
  else Result := Trim(Cntry.AsString + #32 + Result);
  Result := Trim(Format(sFrmt[Frmt], [Result, Number.AsString]));
  if Assigned(Ext) and (Ext.AsString <> '') then
    Result := Result + '-' + Ext.AsString;
end;

function GetPhoneNumber(
  Cntry, Area, Number, Ext: Variant; Frmt: Boolean = False): string; 
const sFrmt: array[Boolean] of string = ('%s %s', '+(%s) %s');
var aCntry: Variant;
begin
  //Result := Trim(Cntry.AsString + #32 + Area.AsString);
  Result := Trim( VarToStr( Area ) );
  aCntry := Trim( VarToStr( Cntry ) );
  if (aCntry = '380') and (Result = '') then
    Result := aCntry + #32'322'
  else if (aCntry = '380') and (Result[1] = '0') then
    Result := Trim(aCntry + #32 + Copy(Result, 2, Length(Result)))
  else Result := Trim(aCntry + #32 + Result);
  Result := Trim(Format(sFrmt[Frmt], [Result, VarToStr( Number )]));
  if ( Ext <> null ) and (VarToStr( Ext ) <> '') then
    Result := Result + '-' + VarToStr( Ext );
end;
{ otherway make addresses strings }

function MakeAddress(const Department, Address, House, Tenement: String): String;
begin
  if Department = '' then Result := Address
  else Result := Department + ', ' + Address;
  if House <> '' then
  begin
    Result := Result + ', ' + House;
    //if Tenement <> '' then Result := Result + '/' + Tenement;
    if Tenement <> '' then
      Result := Result + #32 + SVDlgsTenement + Tenement;
  end;
  if Trim(Result) = ',' then Result := '';
end;

function MakeAddressCity(
  const Country, City, Department, Province, Township: String;
  Kind: Integer = 0): String;
begin
  Result := City;
  if (Result <> '') and (Kind > 0) then
    Result := Result + #32 + Trim(CityIdent(Kind));
  if Township <> '' then Result := Result + ', ' + Township
  else if Department <> '' then Result := Result + ', ' + Department;
  if Province <> '' then Result := Result + ', ' + Province;
  if Country <> '' then Result := Result + ', ' + Country;
end;

function MakeCityName(
  const Country, City, Province, Township: String; Kind: Integer = 0): String;
begin
  Result := MakeAddressCity(Country, City, '', Province, Township, Kind);
end;

function MakeCityWithZip(
  const Country, Zip, City, Department, Province, Township: String): String;
begin
  Result := MakeAddressCity('', City, Department, Province, Township);
  if Zip <> '' then Result := Zip + #32 + Result;
  if Country <> '' then Result := Country + ', ' + Result;
end;

function MakeFullAddress(
  const Country, City, Department, Province, Township,
  Address, House, Tenement: String): String;
begin
  Result :=
    MakeAddressCity(Country, City, Department, Province, Township) + ', ' +
    MakeAddress('', Address, House, Tenement);
  if Trim(Result) = ',' then Result := '';
end;

function MakeFullAddressWithZip(
  const Country, Zip, City, Department, Province, Township,
  Address, House, Tenement: String): String;
begin
  Result :=
    MakeCityWithZip(Country, Zip, City, Department, Province, Township) + ', ' +
    MakeAddress('', Address, House, Tenement);
  if Trim(Result) = ',' then Result := '';
end;

function MakePhoneNo(
  const CntryCode, AreaCode, PhoneNo: String; const PhoneExt: String = '';
  AddPrefix: Boolean = False; const FmtStr: String = ''): String;
var
  CalcArea: String;
  LeadZero: Boolean;
begin
  LeadZero := CntryCode = '380';  // stub - may be found in the Countries table
  if LeadZero and (AreaCode <> '') and (AreaCode[1] = '0') then
    CalcArea := Copy(AreaCode, 2, Length(AreaCode))
  else CalcArea := AreaCode;
  if FmtStr = '' then
  begin
    Result := Trim(CntryCode + #32 + CalcArea + #32 + PhoneNo);
    if PhoneExt <> '' then Result := Trim(Result + #32 + PhoneExt);
    if AddPrefix and (Result <> '') and (CntryCode <> '') then
      Result := '+' + Result;
  end
  else Result := Format(FmtStr, [CntryCode, CalcArea, PhoneNo, PhoneExt]);
end;

function MakeStreetName(const StreetName: String; StrKind: Integer = -1): String;
begin
  Result := StreetName;
  if (Result <> '') and (StrKind <> -1) then
    Result := StreetIdent(StrKind) + #32 + Result;
end;

{function CheckZipCode(const Zip, Mask: string): Boolean;
begin
end;}

{ family and relative naming }

procedure RelativeIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pRelativeIdents);
end;

function RelativeIdent(Id: Integer): string;
begin
  if Id < 0 then Result := '' else Result := LoadResString(pRelativeIdents[Id]);
end;

procedure MarriedIdentsToStrings(Ua, Male: Boolean; Strings: TStrings);
begin
  if Ua then
    case Male of
      False: ResourceToStrings(Strings, pMarriedFUaIdents);
      True: ResourceToStrings(Strings, pMarriedMUaIdents);
    end
  else
    case Male of
      False: ResourceToStrings(Strings, pMarriedFEnIdents);
      True: ResourceToStrings(Strings, pMarriedMEnIdents);
    end;
end;

function MarriedIdent(Ua, Male: Boolean; Id: Integer): string;
begin
  if Id < 0 then Result := ''
  else if Ua then
    case Male of
      False: Result := LoadResString(pMarriedFUaIdents[Id]);
      True: Result := LoadResString(pMarriedMUaIdents[Id]);
    end
  else
    case Male of
      False: Result := LoadResString(pMarriedFEnIdents[Id]);
      True: Result := LoadResString(pMarriedMEnIdents[Id]);
    end;
end;

function StrSexIsMale(const Sex: string): Boolean;
begin
  Result := (Sex = SVDlgsSexMaleEn) or (Sex = SVDlgsSexMaleUa);
end;

function StrSexInEng(const Sex: string): string;
begin
  if StrSexIsMale(Sex) then Result := SVDlgsSexMaleEn
  else Result := SVDlgsSexFemaleEn;
end;

function StrChildIsMale(const Chld: string): Boolean;
begin
  Result := (AnsiUpperCase(Chld) = AnsiUpperCase(SVDlgsChildSonEn))
    or (AnsiUpperCase(Chld) = AnsiUpperCase(SVDlgsChildSonUa));
end;

{ manager permissions }

const
  uspSDiction = 'Diction';
  uspSDictCountry = 'DictCountry';
  uspSDictCity = 'DictCity';
  uspSDictHotel = 'DictHotel';
  uspSDictHotelGrp = 'DictHotelGrp';
  uspSDictHotelCtg = 'DictHotelCtg';
  uspSDictCurrency = 'DictCurrency';
  uspSDictDrive = 'DictDrive';
  uspSDictRoomType = 'DictRoomType';
  uspSDictRoomView = 'DictRoomView';
  uspSDictService = 'DictService';
  uspSDictReklama = 'DictReklama';
  uspSDictCompany = 'DictCompany';
  uspSDictBank = 'DictBank';
  uspSDictHotelBld = 'DictHotelBld';
  uspSDictOther = 'DictOther';
  uspSOrder = 'BrOrder';
  uspSTour = 'BrTour';
  uspSRoute = 'BrRoute';
  uspSTrip = 'BrTrip';
  uspSHotel = 'BrHotel';
  uspSInsure = 'BrInsure';
  uspSVisa = 'BrVisa';
  uspSMail = 'BrMail';
  uspSReport = 'BrReport';

function GetPermItemName(Item: Integer): string;
begin
  case Item of
    uspDiction: Result := uspSDiction;
    uspDictCountry: Result := uspSDictCountry;
    uspDictCity: Result := uspSDictCity;
    uspDictHotel: Result := uspSDictHotel;
    uspDictHotelGrp: Result := uspSDictHotelGrp;
    uspDictHotelCtg: Result := uspSDictHotelCtg;
    uspDictCurrency: Result := uspSDictCurrency;
    uspDictDrive: Result := uspSDictDrive;
    uspDictRoomType: Result := uspSDictRoomType;
    uspDictRoomView: Result := uspSDictRoomView;
    uspDictService: Result := uspSDictService;
    uspDictReklama: Result := uspSDictReklama;
    uspDictCompany: Result := uspSDictCompany;
    uspDictBank: Result := uspSDictBank;
    uspDictHotelBld: Result := uspSDictHotelBld;
    uspDictOther: Result := uspSDictOther;
    uspOrder: Result := uspSOrder;
    uspTour: Result := uspSTour;
    uspRoute: Result := uspSRoute;
    uspTrip: Result := uspSTrip;
    uspHotel: Result := uspSHotel;
    uspInsure: Result := uspSInsure;
    uspVisa: Result := uspSVisa;
    uspMail: Result := uspSMail;
    uspReport: Result := uspSReport;
    else Result := '';
  end;
end;

function GetUsLgPerm(ADatabase: TDatabase; Level, Item: Integer): Integer;
var PermItem: string;
begin
  Result := uspLevelNone;
  PermItem := GetPermItemName(Item);
  if (PermItem <> '') then
    with TQuery.Create(ADatabase.Owner) do
    try
      DatabaseName := ADatabase.DatabaseName;
      SQL.Text := 'select * from tmuserperms P order by tmpermlevel';
      Prepare;
      Open;
      if Locate('TMPERMLEVEL', Level, []) then
        Result := FieldByName(PermItem).AsInteger;
      Close;
    finally
      Free;
    end;
end;

function GetUsLgPLev(ADatabase: TDatabase; ManId, Item: Integer): Integer;
const
  sSQL = 'select P.%s from TmUsers U, TmUserPerms P ' +
    'where U.TmUserId = %d and P.TmPermLevel = U.TmPermLevel';
var PermItem: string;
begin
  Result := uspLevelNone;
  PermItem := GetPermItemName(Item);
  if (PermItem <> '') then
    with TQuery.Create(ADatabase.Owner) do
    try
      DatabaseName := ADatabase.DatabaseName;
      SQL.Text := Format(sSQL, [PermItem, ManId]);
      Prepare;
      Open;
      if RecordCount > 0 then
        Result := FieldByName(PermItem).AsInteger;
      Close;
    finally
      Free;
    end;
end;

{ convert float field edit control`s value to String }

function FloatFieldToString(Field: TField): string;
begin
  if Field.IsNull then Result := 'null'
  else Result := FloatToStr(Field.AsCurrency);
//  else Result := StringReplace(FloatToStr(Field.AsCurrency),
//      DecimalSeparator, BDEDecimalSeparator, [rfReplaceAll]);
end;

{ check permission in user permission level }

function GetUspLevelPerm(Level, Perm: Cardinal): Boolean;
begin
  Result := True //Level and Perm = Perm;; //<> 0;
end;

function GetUspCanAccess(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelBrowse + uspLevelView);
end;

function GetUspCanAdmin(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelAdmin);
end;

function GetUspCanAdd(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelEdit);
end;

function GetUspCanEdit(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelEdit);
end;

function GetUspCanDelete(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelDelete);
end;

function GetUspCanManage(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelManage + uspLevelReport + uspLevelPrint);
end;

function GetUspCanPrint(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelPrint);
end;

function GetUspCanView(Level: Cardinal): Boolean;
begin
  Result := GetUspLevelPerm(Level, uspLevelView);
end;

function CalcAverageSum(FGainSum: Real; FPeriod, FGainCount: Integer): Real;
var GainCount: Integer;
begin
  if FGainCount = 0 then GainCount := 1 else GainCount := FGainCount;
  if FPeriod = 0 then Result := FGainSum / GainCount * 30
  else if FPeriod = 1 then Result := FGainSum / (GainCount * 7) * 30
  else if FPeriod = 2 then Result := FGainSum / GainCount
  else if FPeriod = 3 then Result := FGainSum / (GainCount * 12);
end;

function CalcAverageMonth(Count, Period: Integer): Integer;
begin
  Result := 0;
  if Period = 0 then Result := Count
  else if Period = 1 then Result := Count * 7
  else if Period = 2 then Result := Count * 30
  else if Period = 3 then Result := Count * 365;
end;

function RezDate(ADate: TDateTime; Period, Anumber: Integer): TDateTime;
begin
  case Period of
   0: Result := IncDay(ADate, ANumber);
   1: Result := IncWeek(ADate, ANumber);
   2: Result := IncMonth(ADate, ANumber);
   3: Result := IncYear(ADate, ANumber);
  end;
end;

function NeedQueryToString(Qry: TDataset; DataSrc: TDataSource): String;
var
    BlockFund, BlockGroup1, BlockGroup2,
    BlockGroup3, BlockGroup4, BlockGroup5: Boolean;
    Id, OneTypeDoc, OldPosadaId, SubGroup, OneSetOfDoc:Integer;
    ListId, St: string;
    ExtraFunding, BankFunding: Boolean;
    BeginPimpa: Boolean;
    DocID: Integer;
  function OneItem: string;
  var MisStr: String;
  begin
    with Qry do
    begin
      if FieldByName('NewDoc').Value = 'T'
      then if MisStr = '' then MisStr := 'Новий документ, що вимагає консульство'
      else MisStr := MisStr + '; ' + 'Новий документ, що вимагає консульство';
      if FieldByName('IsUse').Value = 'F'
      then if MisStr = '' then MisStr := 'Цього документу більше не потрібно - консульство його відмінило'
      else MisStr := MisStr + '; ' + 'Цього документу більше не потрібно - консульство його відмінило';
      if MisStr <> ''
      then MisStr := Format(sMismatch, [MisStr]);
      if not FieldByName('LINK').IsNull
      then Result := Format(sOneItemWithLink, [FieldByName('LINK').AsString,
            FieldByName('DOCNAME').AsString,
            FieldByName('TYPENAME').AsString + '%s',
            FieldByName('NEEDCOUNT').AsString]) + MisStr
      else Result := Format(sOneItem, [FieldByName('DOCNAME').AsString,
            FieldByName('TYPENAME').AsString + '%s',
            FieldByName('NEEDCOUNT').AsString]) + MisStr;
    end;
  end;
begin
  Result := '';
  ListId := '';
  BlockFund := False;
  BlockGroup1 := False;
  BlockGroup2 := False;
  BlockGroup3 := False;
  BlockGroup4 := False;
  BlockGroup5 := False;
  ExtraFunding := False;
  BankFunding := False;
  OldPosadaId := 0;
  SubGroup := 0;
  BeginPimpa := False;
  with Qry do
  begin
    if not Active then
    begin
      if Qry is TQuery then TQuery(Qry).DataSource := DataSrc;
      if Qry is TIBQuery then TIBQuery(Qry).DataSource := DataSrc;

      Open;
    end;
    First;
    while not Eof do
    begin
       if FieldByName('SameTypeDocId').IsNull
        and FieldByName('Funding').IsNull
        and FieldByName('PosadaId').IsNull
        and FieldByName('GroupSortOrder').IsNull
        and not RegExpp(FieldByName('PersDocId').Value, ListId)
       then begin 
         if Result = '' then
         begin
           Result := sGeneralDocs;
           BeginPimpa := True;
         end; 
         Id := FieldByName('PersDocId').Value;
         DocID := FieldByName('DocId').Value;
         ListId := ListId + ';' + FieldByName('PersDocId').AsString;
         st := OneItem;
         Next;
         while not Eof do
         begin
           if DocID = FieldByName('DocId').Value
           then begin 
            St := Format(St, ['<strong> та </strong>' + FieldByName('TYPENAME').AsString]); 
            ListId := ListId + ';' + FieldByName('PersDocId').AsString;
           end;
           Next;
         end;         
         Result := Result + Format(sPimpa, [st]);
         Locate('PersDocId', Id, []);
       end;

       if not FieldByName('SameTypeDocId').IsNull
          and FieldByName('Funding').IsNull
          and FieldByName('GroupSortOrder').IsNull
          and FieldByName('PosadaId').IsNull
          and not RegExpp(FieldByName('PersDocId').Value, ListId)
       then
       begin
         OneTypeDoc := FieldByName('SameTypeDocId').Value;
         with FieldByName('SetOfDocument') do OneSetOfDoc := IfThen(AsInteger > 0, AsInteger, -1);
         DocID := FieldByName('DocId').Value;
         Id := FieldByName('PersDocId').Value;
         ListId := ListId + ';' + FieldByName('PersDocId').AsString;
         St := OneItem;
         Next;
         while not Eof do
         begin
           if OneTypeDoc = FieldByName('SameTypeDocId').Value
           then begin 
             if DocID = FieldByName('DocId').Value 
             then St := Format(St, ['<strong> та </strong>' + FieldByName('TYPENAME').AsString])
             else St := Format(St, [EmptyStr]) + Format(sOr, [aOrAnd[OneSetOfDoc = FieldByName('SetOfDocument').AsInteger]]) + OneItem;
             ListId := ListId + ';' + FieldByName('PersDocId').AsString;
           end;
//           DocID := FieldByName('DocId').Value;
           Next;
         end;
         Result := Result + Format(sPimpa, [St]);
         Locate('PersDocId', Id, []);
       end;

       if not FieldByName('Funding').IsNull
        or not FieldByName('PosadaId').IsNull
        or not FieldByName('GroupSortOrder').IsNull
       then
       begin
        if not BlockFund
           and ( (FieldByName('Funding').Value = 'F')
           or (FieldByName('VisaDocGroupId').IsNull
           or not FieldByName('PosadaId').IsNull) )
        then
        begin
          if BeginPimpa then
          begin
            Result := Result + '</ul>';
            BeginPimpa := False;
          end;
          Result := Result + sMainFunding;
          BlockFund := True;
        end;

        if not FieldByName('VisaDocGroupId').IsNull then
        begin
         if (FieldByName('VisaDocGroupId').Value <> nVisaDocGroup5)
           and not ExtraFunding then
         begin
           if BeginPimpa then Result := Result + '</ul>'
           else BeginPimpa := True;
           Result := Result + sExtraFunding;
           ExtraFunding := True;
         end;
         case FieldByName('VisaDocGroupId').Value of
         nVisaDocGroup1:
            if not BlockGroup1 then
              begin
                if BeginPimpa then Result := Result + '</ul>'
                else BeginPimpa := True;
                Result := Result + sGroup1;
                BlockGroup1 := True;
                BankFunding := False;
              end;
         nVisaDocGroup2:
            if not BlockGroup2 then
              begin
                if BeginPimpa then Result := Result + '</ul>'
                else BeginPimpa := True;
                Result := Result + sGroup2;
                BlockGroup2 := True;
                BankFunding := False;
              end;
         nVisaDocGroup3:
            if not BlockGroup3 then
              begin
                if BeginPimpa then Result := Result + '</ul>'
                else BeginPimpa := True;
                Result := Result + sGroup3;
                BlockGroup3 := True;
                BankFunding := False;
              end;
         nVisaDocGroup4:
            if not BlockGroup4 then
              begin
                if BeginPimpa then Result := Result + '</ul>'
                else BeginPimpa := True;
                Result := Result + sGroup4;
                BlockGroup4 := True;
                BankFunding := False;
              end;
         nVisaDocGroup5:
            if not BlockGroup5 then
              begin
                if BeginPimpa then Result := Result + '</ul>'
                else BeginPimpa := True;
                Result := Result + sGroup5;
                BlockGroup5 := True;
                BankFunding := False;
              end;
         end;
        end;
        if FieldByName('PosadaId').IsNull then OldPosadaId := 0
        else if (OldPosadaId <> FieldByName('PosadaId').Value)
        then
        begin
          if BeginPimpa then Result := Result + '</ul>'
          else BeginPimpa := True;         
          Result := Result + Format(sPosada, [GetPosadaName(FieldByName('PosadaId').Value)]);
          OldPosadaId := FieldByName('PosadaId').Value;
        end;

        if FieldByName('SubGroupId').IsNull then SubGroup := 0
        else if (SubGroup <> FieldByName('SubGroupId').Value)
        then
        begin
          if BeginPimpa then Result := Result + '</ul>'
          else BeginPimpa := True;
          Result := Result + Format(sPosada, [FieldByName('SubGroupName').AsString]);
          SubGroup := FieldByName('SubGroupId').Value;
        end;

{        if not BankFunding
           and (FieldByName('Funding').Value = 'B')
           and (FieldByName('VisaDocGroupId').Value <> nVisaDocGroup5)
        then
        begin
          if BeginPimpa then Result := Result + '</ul>'
          else BeginPimpa := True;
          Result := Result + sExtraDoc;
          BankFunding := True;
        end;   }

         if FieldByName('SameTypeDocId').IsNull
            and not RegExpp(FieldByName('PersDocId').Value, ListId)
         then begin 
//          Result := Result + Format(sPimpa, [OneItem]);
           Id := FieldByName('PersDocId').Value;
           DocID := FieldByName('DocId').Value;
           ListId := ListId + ';' + FieldByName('PersDocId').AsString;
           st := OneItem;
           Next;
           while not Eof do
           begin
             if DocID = FieldByName('DocId').Value
             then begin 
              St := Format(St, ['<strong> та </strong>' + FieldByName('TYPENAME').AsString]); 
              ListId := ListId + ';' + FieldByName('PersDocId').AsString;
             end;
             Next;
           end;         
           Result := Result + Format(sPimpa, [st]);
           Locate('PersDocId', Id, []);

         end;

        if not FieldByName('SameTypeDocId').IsNull
           and not RegExpp(FieldByName('PersDocId').Value, ListId)
        then
        begin
          OneTypeDoc := FieldByName('SameTypeDocId').Value;
          with FieldByName('SetOfDocument') do OneSetOfDoc := IfThen(AsInteger > 0, AsInteger, -1);
          DocID := FieldByName('DocId').Value;
          Id := FieldByName('PersDocId').Value;
          ListId := ListId + ';' + FieldByName('PersDocId').AsString;
          St := OneItem;
          Next;
          while not Eof do
          begin
            if OneTypeDoc = FieldByName('SameTypeDocId').Value
            then begin 
              if DocID = FieldByName('DocId').Value 
              then St := Format(St, ['<strong> та </strong>' + FieldByName('TYPENAME').AsString])
              else St := Format(St, [EmptyStr]) + Format(sOr, [aOrAnd[OneSetOfDoc = FieldByName('SetOfDocument').AsInteger]]) + OneItem;
              ListId := ListId + ';' + FieldByName('PersDocId').AsString;
            end;
//            DocID := FieldByName('DocId').Value;
            Next;
          end;
          Result := Result + Format(sPimpa, [St]);
          Locate('PersDocId', Id, []);
        end;
       end;
       Result := StringReplace(Result, '%s', '', [rfReplaceAll]);
     Next;
    end;
    if BeginPimpa then Result := Result + '</ul>';
    Close;
  end;
end;

function QueryToString(Qry, MisQry: TDataset; DataSrc: TDataSource;
  IsReturn: Boolean = False; ForManager: Boolean = False; OnlyBadDoc: Boolean = False): String;
var MisStr, OfficeName, DocName, TypeName, DocLink, DocCount, CommonMisStr: String;
    DocId: Integer;
    ItNeedDocQry: Boolean;
  function SetDocHtml(const sLine: string): string;
  begin
    Result := EmptyStr;
    if CommonMisStr <> '' then CommonMisStr := Format(sMismatch, [CommonMisStr]);//[Copy(CommonMisStr, 0, Length(CommonMisStr)-1)]);  //Format(sMis, [MisStr])]);
    if OnlyBadDoc and (CommonMisStr <> '') or 
       not OnlyBadDoc and (CommonMisStr = '') {or 
       (Qry.Name = 'TakeDocQry')}
    then begin
      if DocLink <> EmptyStr
      then Result := {Result +} Format(sPimpa, [Format(sOneItemWithLink, [
        DocLink, DocName, TypeName, DocCount])])
      else                        
       Result := {Result +} Format(sPimpa, [ 
         Format(sOneItem, [DocName, TypeName, DocCount])]);
                  
      if ForManager and (Qry.Name = 'GetDocQry') then OfficeName := GetLocationDoc(Qry);        
      Result := Result + CommonMisStr + OfficeName; 
    end;  
    Result := Result + sLine;
    CommonMisStr := EmptyStr;
  end;
begin
  Result := '';
  if not MisQry.Active then MisQry.Open;
  
  with Qry do
  begin
    if not Active then
    begin
      if (Qry is TQuery) then TQuery(Qry).DataSource:= DataSrc;
      if (Qry is TIBQuery) then TIBQuery(Qry).DataSource:= DataSrc;
      //DataSource := DataSrc;
      Open;
    end;
    First;
    ItNeedDocQry := Qry.Name = 'NeedDocQry';
    
    DocId := 0;//FieldByName('DocId').AsInteger;
    DocName := FieldByName('DOCNAME').AsString;
    if ItNeedDocQry then TypeName := EmptyStr else TypeName := FieldByName('TYPENAME').AsString;
    DocCount := FieldByName('NEEDCOUNT').AsString;
    DocLink := FieldByName('LINK').AsString;
    CommonMisStr := EmptyStr;
    while not Eof do
    begin
       
      MisQry.First;
      MisStr := '';
      while not MisQry.Eof do
      begin  
        if not FieldByName('MISMATCH').IsNull and
         RegExpp(MisQry.FieldByName('MISMATCHID').AsString, FieldByName('MISMATCH').Value)
        then MisStr := IfThen(MisStr = '', '', ';') + MisQry.FieldByName('MISMATCHNAME').AsString;

       (* if MisStr = '' then MisStr := MisQry.FieldByName('MISMATCHNAME').AsString
        else MisStr := MisStr + '; ' + MisQry.FieldByName('MISMATCHNAME').AsString;*)
        MisQry.Next;
      end;
       
      with FieldByName('CalcCompareDoc') do
      if Value <> '' then MisStr := IfThen(MisStr = '', '', MisStr + ';') + AsString; //if MisStr = '' then MisStr := AsString else MisStr := MisStr + ';' + AsString;
      with FieldByName('COMMENTS') do
      if not IsNull then MisStr := IfThen(MisStr = '', '', MisStr + ';') + AsString; //if MisStr = '' then MisStr := AsString else MisStr := MisStr + ';' + AsString;

      if not ItNeedDocQry then begin
        CommonMisStr := IfThen(CommonMisStr <> EmptyStr, CommonMisStr + '; ', '') + MisStr;
        DocId := FieldByName('DocId').AsInteger;
        DocName := FieldByName('DOCNAME').AsString;
        TypeName := FieldByName('TYPENAME').AsString;
        DocCount := FieldByName('NEEDCOUNT').AsString;
        DocLink := FieldByName('LINK').AsString;      
        Result := SetDocHtml(Result);
      end else if (DocId <> FieldByName('DocId').AsInteger)
      then begin  
        //Result := SetDocHtml(Result);
        DocId := FieldByName('DocId').AsInteger;
        DocName := FieldByName('DOCNAME').AsString;
        TypeName := FieldByName('TYPENAME').AsString;
        DocCount := FieldByName('NEEDCOUNT').AsString;
        DocLink := FieldByName('LINK').AsString;
        CommonMisStr := IfThen(CommonMisStr <> EmptyStr, CommonMisStr + '; ', '') + MisStr;
        Result := SetDocHtml(Result);
      end else begin 
        TypeName := IfThen(TypeName <> EmptyStr, TypeName + '<strong> та </strong>', EmptyStr) + FieldByName('TYPENAME').AsString;
        CommonMisStr := IfThen(CommonMisStr <> EmptyStr, CommonMisStr + '; ', '') + MisStr;
      end;        
      Next;
    end;
//    if (Result <> '') and ItNeedDocQry then Result := SetDocHtml(Result); 
    Result := IfThen(Result <> EmptyStr, Result + sBreak, '');
    Close;
  end;
end;

(*function QueryToString(Qry, MisQry: TQuery; DataSrc: TDataSource; wSum: String; 
  IsReturn: Boolean = False; ForManager: Boolean = False; OnlyBadDoc: Boolean = False): String;
var MisStr, OfficeName, HaveScan: String;
    DocId: Integer;
begin
  Result := '';
  DocId := 0;
  HaveScan := EmptyStr;
  if not MisQry.Active then MisQry.Open;
  with Qry do
  begin
    if not Active then
    begin
      DataSource := DataSrc;
      Open;
    end;
    First;
    while not Eof do
    begin
      if OnlyBadDoc and ((FieldByName('CalcCompareDoc').AsString <> EmptyStr) or not FieldByName('MISMATCH').IsNull) or
         not OnlyBadDoc and ((FieldByName('CalcCompareDoc').AsString = EmptyStr) and FieldByName('MISMATCH').IsNull)
      then begin
        MisQry.First;
        MisStr := '';
        while not MisQry.Eof do
         begin
           if not FieldByName('MISMATCH').IsNull and
            RegExpp(MisQry.FieldByName('MISMATCHID').AsString, FieldByName('MISMATCH').Value)
           then if MisStr = '' then MisStr := MisQry.FieldByName('MISMATCHNAME').AsString
           else MisStr := MisStr + '; ' + MisQry.FieldByName('MISMATCHNAME').AsString;
           MisQry.Next;
         end;
        with FieldByName('CalcCompareDoc') do
        if Value <> '' then if MisStr = '' then MisStr := AsString
        else MisStr := MisStr + ';' + AsString;
        with FieldByName('COMMENTS') do
        if not IsNull then if MisStr = '' then MisStr := AsString
        else MisStr := MisStr + ';' + AsString;

        if MisStr <> '' then MisStr := Format(sMismatch, [Copy(MisStr, 0, Length(MisStr)-1)]);  //Format(sMis, [MisStr])]);

        if (Qry.Name <> 'NeedDocQry') or (DocId <> FieldByName('DocId').AsInteger)
//          or (HaveScan = FieldByName('HaveScan').AsString)
        then begin                                             
          if Qry.Name = 'NeedDocQry' 
          then begin 
          DocId := FieldByName('DocId').AsInteger;
          HaveScan := FieldByName('HaveScan').AsString;
          end;
          Result := StringReplace(Result, '%s', '', [rfReplaceAll]);
          if not FieldByName('LINK').IsNull
          then Result := Result + Format(sPimpa, [Format(sOneItemWithLink, [FieldByName('LINK').AsString,
              FieldByName('DOCNAME').AsString,
              FieldByName('TYPENAME').AsString + '%s',
              FieldByName('NEEDCOUNT').AsString])])
          else                        
           Result := Result + Format(sPimpa, [ 
             Format(sOneItem, [
              FieldByName('DOCNAME').AsString,
              FieldByName('TYPENAME').AsString + '%s',
              FieldByName('NEEDCOUNT').AsString])]);
        end else Result := Format(Result, ['<strong> та </strong>' + FieldByName('TYPENAME').AsString]);
          
        if ForManager and (Qry.Name = 'GetDocQry') 
        then OfficeName := GetLocationDoc(Qry);
          
        if not IsReturn then Result := Result + MisStr + OfficeName; 
  //     else if FieldByName('RETURNED').Value = 'T'
  //     then Result := Result + sBreak;
      end;
      Next;
    end;
    if ( Qry.Name = 'GetDocQry' ) and ( wSum <> '' ) and not IsReturn
    then Result := Result + wSum;
    Result := StringReplace(Result, '%s', '', [rfReplaceAll]) + sBreak;
    Close;
  end;
end;*)

function GetLocationDoc(Qry: TDataset): string;
begin
  with Qry do
  if not FieldByName('TRANSFERTOOFFICEID').IsNull
  then Result := Format(sTransferToOfficeName, [FieldByName('TRANSFOFFICENAME').AsString])
  else if not FieldByName('OFFICENAME').IsNull
  then Result := Format(sOfficeName, [FieldByName('OFFICENAME').AsString])
  else Result := EmptyStr;
end;

function GetBonusProgram(DataSt: TDataSet): string;
const sBonusProg = 'Програма: %s'#13'з дати %s';
      sShowDate: array[Boolean] of string = ('', ' показується на сайті');
begin
  with DataSt do
  begin
    Result := Format(sBonusProg, [FieldByName('ProgramName').AsString, 
      FieldByName('BONUSFromDate').AsString]);
    Result := Result + sShowDate[FieldByName('BONUSFROMSHOWWEB').AsBoolean];
    if not FieldByName('BONUSTILLDATE').IsNull
    then begin
      Result := Result + #13 + Format('по дату %s', [FieldByName('BonusTillDate').AsString]);
      Result := Result + sShowDate[FieldByName('BONUSTILLSHOWWEB').AsBoolean];
    end;
  end;
end;

procedure DrawSpecialDateImg(Canvas: TCanvas; Rct: TRect;
  DataSt: TDataSet; aImage: TJpegImage);
var Coor: Integer;
begin
  if FileExists(GetSpecDateLogoFileName(DataSt.FieldByName('SPECIALDATEID').AsString + '.jpg'))//DM.TourQrySPECIALDATEID.AsString + '.jpg'))
  then begin
    aImage.LoadFromFile(
      GetSpecDateLogoFileName(DataSt.FieldByName('SPECIALDATEID').AsString + '.jpg'));//DM.TourQrySPECIALDATEID.AsString + '.jpg'));
    Coor := (Rct.Left + Rct.Right) div 2;
    Rct.Right := Coor + 9;
    Rct.Left := Coor - 9;
    Canvas.StretchDraw(Rct, aImage);
  end;
end;

procedure CreateFieldMemTable(AMemData: TDataSet; AFieldName: string; AFieldType: TFieldType);
begin
  if (AMemData = nil) or (AFieldName = '') then
    Exit;
  with AMemData.FieldDefs.AddFieldDef do
  begin
    Name := AFieldName;
    DataType := AFieldType;
    CreateField(AMemData);
  end;
end;

function CheckTouristPassportExpire(
  IssuedDate, ExpireDate, aTourDate: TDateTime; 
  aDayCount, aPassMonth: Integer;
  VisaFromDate, VisaToDate: TField): Boolean;
var
  NEEDVISA: Boolean;
  PersVisaQry_ST,  Locate_visa: Boolean;
  Country, new_msg: String;
  nach_pass, kon_pass, nach_viza, kon_viza, nach_tour, kon_tour: TDate;
  kol_mes, viza_stat, net_zakaz_viza, day_pass_visa, day_pass_tour: Byte;
  str_need_pass_expire_visa, str_need_pass_expire_tour: String;
  TourDate: TDateTime;
  DayCount, PASSPORTEXPIREMONTHS: Integer;
  pass_stat: Boolean;
begin
 if (ExpireDate = 0) or (IssuedDate = 0) 
 then Result := True
 else
   begin
    Locate_visa := not VISAFROMDATE.IsNull;
    TourDate := aTourDate;//GroupQryTOURDATE.Value;
    DayCount := aDayCount;//GroupQryDAYCOUNT.Value;
    PASSPORTEXPIREMONTHS := aPassMonth;//PersonQryPASSPORTEXPIREMONTHS.AsInteger;
  //_______________________________________________
    NEEDVISA:= True;
    nach_tour:= Trunc(TourDate);
    kon_tour:= nach_tour + DayCount - 1;
    nach_pass:= Trunc(IssuedDate);
    kon_pass:= Trunc(ExpireDate);
    nach_viza:= Trunc(VISAFROMDATE.AsDateTime);
    kon_viza:= Trunc(VISATODATE.AsDateTime);
    kol_mes:= PASSPORTEXPIREMONTHS;
    str_need_pass_expire_visa:= DateToStr(DateAddMonth(kon_viza, kol_mes));
    str_need_pass_expire_tour:= DateToStr(DateAddMonth(kon_tour, kol_mes));
    day_pass_visa:= Trunc(DateAddMonth(kon_viza, kol_mes)) - Trunc(kon_pass);
    day_pass_tour:= Trunc(DateAddMonth(kon_tour, kol_mes)) - Trunc(kon_pass);
    new_msg:= '';
    Result := (kon_pass - nach_tour) > 0;
    //proverka okonchaniya pasporta
    if NEEDVISA then
     if Locate_visa
      then
       begin
        viza_stat := 7;
        if kon_pass > DateAddMonth(kon_viza, kol_mes) then viza_stat := 0
         else
          if kon_pass = DateAddMonth(kon_viza, kol_mes) then viza_stat := 1
           else
            if kon_pass > kon_viza then viza_stat:= 2
             else
              if kon_pass = kon_viza then viza_stat:= 3
               else
                if kon_pass > nach_viza then viza_stat:= 4
                 else
                  if kon_pass = nach_viza then viza_stat:= 5
                   else if kon_pass < nach_viza then viza_stat:= 6;

       end
     else
       begin
        net_zakaz_viza := 7;
        if kon_pass > DateAddMonth(kon_tour, kol_mes) then net_zakaz_viza := 0
         else
          if kon_pass = DateAddMonth(kon_tour, kol_mes) then net_zakaz_viza := 1
           else
            if kon_pass > kon_tour then net_zakaz_viza:= 2
             else
              if kon_pass = kon_tour then net_zakaz_viza:= 3
               else
                if kon_pass > nach_tour then net_zakaz_viza:= 4
                 else
                  if kon_pass = nach_tour then net_zakaz_viza:= 5
                   else
                    if kon_pass < nach_tour then net_zakaz_viza:= 6;
       end;
    pass_stat := False;
    if not(kon_pass > kon_tour)then pass_stat := True;
    Result := ( viza_stat in [1..6] ) or ( net_zakaz_viza in [1..6] ) or pass_stat;

   end;
end;

end.
