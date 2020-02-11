unit TourIbUn;

interface

uses Classes, DB, IBDatabase, IBQuery, IBTable, DBCtrls;

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


{ apply the Filter property value to dataset without loss of focus }
procedure ApplyDataSetFilter(DataSet: TDataSet; Key: TField; const Fltr: string);

{ change the 'order by' statement in the query SQL text }
function ChangeQueryOrder(Qry: TIBQuery; const KeyName, NewOrder: String): Boolean;

{ read dataset field into strings }
procedure DataFieldToStrings(Field, Key: TField; Strings: TStrings; Cleanup: Boolean = True);
{ TDataSet records to TStrings }
procedure DataSetToStrings(DataSet: TDataSet; KeyFld, ListFld: TField;
  Clean: Boolean; Strings: TStrings);

{ open closed dataset (if it is not opened) }
procedure OpenDataSet(DSet: TDataSet);
{ refresh query by close and open }
procedure UpdateQuery(Qry: TIBQuery; OnlyUpdate: Boolean = False);

{procedure SelectQueryToStrings(ADatabase: TDatabase;
  const Table, Where, Order, Id, List: String;
  Sort, Clean: Boolean; Strings: TStrings);}

{ store program log message }

const
  nLogCategoryNone = 0;
  nLogCategoryOrder = 1;
  nLogCategoryTrip = 2;
  nLogCategoryVisa = 3;
  nLogCategoryInsure = 4;
  nLogSubCategOrderChgClient = 1;
  nLogSubCategOrderDelService = 2;
  nLogSubCategOrderAnnulate = 3;
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
  nLogActionNone = 0;
  nLogActionAppend = 1;
  nLogActionModify = 2;
  nLogActionDelete = 3;

var
  LogDataSet: TIBTable = nil;
  //LogFieldDateTime: TDateTimeField = nil;
  LogFieldCategory: TIntegerField = nil;
  LogFieldSubCateg: TIntegerField = nil;
  LogFieldAction: TIntegerField = nil;
  LogFieldLogUser: TIntegerField = nil;
  LogFieldPrompt: TMemoField = nil;

procedure LogDataChanging(
  Category, SubCategory, Action, User: Integer; const Prompt: string);

{ repository }

const
  nReposSrcDstKindOrder = 0;    // ---
  nReposSrcDstKindManager = 1;  // менеджер
  nReposSrcDstKindWorker = 2;   // інший працівник
  nReposSrcDstKindClient = 3;   // замовник
  nReposSrcDstKindVendor = 4;   // постачальник
  nReposSrcDstKindAgent = 5;    // агент
  nReposSrcDstKindReturn = 6;   // ---
  nReposSrcDstKindExchg = 7;    //   обмін
  nReposSrcDstKindKeeper = 8;   //   каса
  nReposSrcDstKindErrand = 9;   // ---
  nReposSrcDstKindOffice = 10;  // ---
  nReposSrcDstKindReport = 11;  // під звіт
  nReposSrcDstKindOther = 12;   // інша особа
  nReposSrcDstKindLast = nReposSrcDstKindOther;
  nReposSrcDstKindNeedConfirm = [
    nReposSrcDstKindWorker,
    nReposSrcDstKindClient..nReposSrcDstKindAgent, //nReposSrcDstKindReturn,
    nReposSrcDstKindErrand..nReposSrcDstKindOther];

function GetReposSrcDstKind(Kind: Integer): String;

{ database routines }

var
  BDEDecimalSeparator: Char;

function GetDatabaseErrorCategory(ErrCat: Byte): string;
function GetBDEDecimalSeparator: Char;

{ company office }
procedure GetOfficeAddress(Address: TStrings; // address -> TStrings
  Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
function GetOfficeAddressString(
  Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
procedure GetHomeAddress(Address: TStrings;
  Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
function GetOldAddressString(// address -> string
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
function GetShortAddress(SKnd, Addr, House, Ten: TField): string;
function GetPhoneNumber(// phoneno -> string
  Cntry, Area, Number, Ext: TField; Frmt: Boolean = False): string;

{ Company: private person or enterprise }
function CompanyIdent(IsEnterpr: Boolean): string;

{ address string routines }
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

{ manager permissions }
function GetUsLgPerm(ADatabase: TIBDatabase; Level, Item: Integer): Integer;
function GetUsLgPLev(ADatabase: TIBDatabase; ManId, Item: Integer): Integer;

{ convert float field edit control value to String }
function FloatFieldToString(Field: TField): string;

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
  uspDictOther = 16;
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
  uspLevelTourCreate = $010; //      0001
  uspLevelTourManage = $020; //      0010
  uspLevelTourDelete = $040; //      0100
  uspLevelTourReport = $080; //      1000
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
  uspLevelTourCommon = 1539;   //$603;   0110 0000 0011
  uspLevelTourManager = 1583;  //$62F;   0110 0010 1111
  uspLevelTourAdmin = 4095;    //$E03;   1111 1111 1111
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


implementation

uses BDE, SysUtils, Controls, Forms, TourCmnlIf, TourConsts;

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

function ChangeQueryOrder(Qry: TIBQuery; const KeyName, NewOrder: String): Boolean;
const sOrd = 'order by';
var
  Old, S, Ord: string;
  Id, P: Integer;
begin
  Result := True;
  Screen.Cursor := crHourGlass;
  with Qry do
    try
      if Active then Id := FieldByName(KeyName).AsInteger else Id := 0;
      Close;
      Old := SQL.Text;
      P := Pos(sOrd, Old);
      if P > 0 then S := Copy(Old, 1, P + Length(sOrd) - 1)
        else S := Old + #32 + sOrd;
      if NewOrder = '' then Ord := KeyName else Ord := NewOrder;
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
      Locate(KeyName, Id, []);
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure DataFieldToStrings(Field, Key: TField; Strings: TStrings; Cleanup: Boolean = True);
var
  Calc: TDataSetNotifyEvent;
  Mrk: TBookmark;
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
        if not IsNull then
        begin
          if Assigned(Key) then
            Strings.AddObject(AsString, Pointer(Key.AsInteger))
          else Strings.AddObject(AsString, Pointer(GetBookmark));
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
        AddObject(ListFld.AsString, Pointer(KeyFld.AsInteger))
      else Add(ListFld.AsString);
      DataSet.Next;
    end;
  end;
end;

procedure OpenDataSet(DSet: TDataSet);
begin
  with DSet do
    if not Active then
    begin
      if DSet is TIBQuery then UpdateQuery(DSet as TIBQuery) else Open;
    end;
end;

procedure SelectQueryToStrings(ADatabase: TIBDatabase;
  const Table, Where, Order, Id, List: string;
  Sort, Clean: Boolean; Strings: TStrings);
var Lst, Ord: string;
begin
  if Clean then Strings.Clear;
  with TIBQuery.Create(ADatabase.Owner) do
  try
    Database := ADatabase;
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
      Strings.AddObject(
        Fields[1].DisplayText, Pointer(FieldByName(Id).AsInteger));
      Next;
    end;
    Close;
  finally
    Free;
  end;
end;

procedure UpdateQuery(Qry: TIBQuery; OnlyUpdate: Boolean = False);
{const
  pMsg: array[0..10] of Pointer = (@SDataModUpdateQryUnknown,
    @SDataModUpdateQryTrip, @SDataModUpdateQryPlaceCount,
    @SDataModUpdateQryPlaceList, @SDataModUpdateQryDriveFloorTotal,
    @SDataModUpdateQryPlaceByOrder, @SDataModUpdateQryPlaceUpdate,
    @SDataModUpdateQryInsTrip, @SDataModUpdateQryOrderCntry,
    @SDataModUpdateQryHotelServ, @SDataModUpdateQryRoomServ);
var T: Integer;}
begin
  {T := Qry.Tag;
  if not (T in [1..7]) then T := 0;
  if not OnlyUpdate then SendMyStatusMsg(LoadResString(pMsg[T]));}
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
      {ClearMyStatusMsg;}
      EnableControls;
    end;
  end;
end;

{ store program log message }

procedure LogDataChanging(
  Category, SubCategory, Action, User: Integer; const Prompt: string);
begin
  if (Category = nLogCategoryNone) or (Action = nLogActionNone) or (Prompt = '')
    or not Assigned(LogDataSet) or not Assigned(LogFieldLogUser)
    or not Assigned(LogFieldCategory) or not Assigned(LogFieldSubCateg)
    or not Assigned(LogFieldAction) or not Assigned(LogFieldPrompt)
  then Exit;
  with LogDataSet do
  begin
    if not Active then Open;
    Append;
    LogFieldCategory.Value := Category;
    if SubCategory <> nLogCategoryNone then LogFieldSubCateg.Value := SubCategory;
    LogFieldAction.Value := Action;
    LogFieldLogUser.Value := User;
    LogFieldPrompt.AsString := Prompt;
    Post;
    Refresh;
  end;
end;

{ repository }

function GetReposSrcDstKind(Kind: Integer): String;
const pKnd: array[0..nReposSrcDstKindLast] of Pointer = (
  @STourDbUnReposKindOrder, @STourDbUnReposKindManager, @STourDbUnReposKindWorker,
  @STourDbUnReposKindClient, @STourDbUnReposKindVendor, @STourDbUnReposKindAgent,
  @STourDbUnReposKindReturn, @STourDbUnReposKindExchg, @STourDbUnReposKindKeeper,
  @STourDbUnReposKindErrand, @STourDbUnReposKindOffice, @STourDbUnReposKindReport,
  @STourDbUnReposKindOther);
begin
  Result := LoadResString(pKnd[Kind]);
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

{ company office }

procedure GetAddressToStrings(Address: TStrings;
  Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  IsOffice, Clean: Boolean);
const
  pTn: array[Boolean] of Pointer = (@SVDlgsAddressTenmnt, @SVDlgsAddressOffice);
var Adr: string;
begin
  Adr := House.AsString; // hause
  with Ten do // + tenement
    if AsString <> '' then
      Adr := Format('%s %s %s', [Adr, LoadResString(pTn[IsOffice]), AsString]);
  with Address do
  begin
    if Clean then Clear;
    with Addr do // address
      if Trim(Adr) = '' then
        Adr := AsString else Adr := Format('%s, %s', [AsString, Adr]);
    Add(Adr);
    Adr := CityIdent(CKnd.AsInteger) + #32 + City.AsString; // city
    with TShp do
      if AsString <> '' then Adr := Adr + #32 + AsString; // + township
    Add(Trim(Adr));
    with Prov do if AsString <> '' then Add(AsString); // province
    Adr := Zip.AsString;
    if Assigned(Cntry) then Adr := Adr + '  ' + Cntry.AsString; // country
    Add(Trim(Adr));
  end;
end;

procedure GetOfficeAddress(Address: TStrings;
  Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
var Adr: string;
begin
  Adr := House.AsString; // hause
  if Assigned(Ten) then
    with Ten do // + tenement
      if AsString <> '' then Adr := Format('%s, %s', [Adr, AsString]);
  with Address do
  begin
    if Clean then Clear;
    with Addr do // address
      if Trim(Adr) = '' then
        Adr := AsString else Adr := Format('%s, %s', [AsString, Adr]);
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
  Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
var
  Address: TStrings;
  I: Integer;
begin
  Result := '';
  Address := TStringList.Create;
  try
    GetOfficeAddress(Address,
      Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry);
    with Address do
      for I := 0 to Count - 1 do
        if Strings[I] <> '' then Result := Result + Strings[I] + #32;
  finally
    Address.Free;
  end;

end;

procedure GetHomeAddress(Address: TStrings;
  Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
begin
  GetAddressToStrings(Address,
    Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry, False, Clean);
end;

function GetOldAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
var Adr: string;
begin
  Result := GetShortAddress(SKnd, Addr, House, Ten);
  Adr := City.AsString; // city
  if Assigned(CKnd) then Adr := CityIdent(CKnd.AsInteger) + #32 + Adr;
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
  if Assigned(SKnd) and (Trim(Result) <> '') then
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
  Result := Format(sFrmt[Frmt], [Result, Number.AsString]);
  if Assigned(Ext) and (Ext.AsString <> '') then
    Result := Result + '-' + Ext.AsString;
end;

{Company: private person or enterprise}

function CompanyIdent(IsEnterpr: Boolean): string;
const pP: array[Boolean] of Pointer = (@SClientDlgPrivate, @SClientDlgEnterpr);
begin
  Result := LoadResString(pP[IsEnterpr]);
end;

{ address string routines }

const
  pCityIdents: array[0..6] of Pointer = (@SVDlgsCity0, @SVDlgsCity1,
    @SVDlgsCity2, @SVDlgsCity3, @SVDlgsCity4, @SVDlgsCity5, @SVDlgsCity6, @SVDlgsCity7);
  pStreetIdents: array[0..9] of Pointer = (@SVDlgsStreet0, @SVDlgsStreet1,
    @SVDlgsStreet2, @SVDlgsStreet3, @SVDlgsStreet4, @SVDlgsStreet5,
    @SVDlgsStreet6, @SVDlgsStreet7, @SVDlgsStreet8, @SVDlgsStreet9);
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

function GetUsLgPerm(ADatabase: TIBDatabase; Level, Item: Integer): Integer;
var PermItem: string;
begin
  Result := uspLevelNone;
  PermItem := GetPermItemName(Item);
  if (PermItem <> '') then
    with TIBQuery.Create(ADatabase.Owner) do
    try
      Database := ADatabase;
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

function GetUsLgPLev(ADatabase: TIBDatabase; ManId, Item: Integer): Integer;
const
  sSQL = 'select P.%s from TmUsers U, TmUserPerms P ' +
    'where U.TmUserId = %d and P.TmPermLevel = U.TmPermLevel';
var PermItem: string;
begin
  Result := uspLevelNone;
  PermItem := GetPermItemName(Item);
  if (PermItem <> '') then
    with TIBQuery.Create(ADatabase.Owner) do
    try
      Database := ADatabase;
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
  else Result := StringReplace(FloatToStr(Field.AsCurrency),
      DecimalSeparator, BDEDecimalSeparator, [rfReplaceAll]);
end;

{ check permission in user permission level }

function GetUspLevelPerm(Level, Perm: Cardinal): Boolean;
begin
  Result := Level and Perm = Perm; //<> 0;
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

end.
