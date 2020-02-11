unit UnitMergeDataBank;

interface

uses Windows,
  SysUtils,
  Dialogs,
  Classes,
  forms,
  variants,
  unitProc,
  IdHTTP,
  DB,
  IBDatabase,
  IBQuery,
  ComCtrls,
  Controls,
  DateUtils,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL,
  msxmldom, XMLDoc,ComObj, MSXML,ShellApi;

type

TInfoBank = record
   GLMFO:Widestring;
   MFO  :Widestring;
   OBLUPR:Widestring;
   FULLNAME:Widestring;
   SHORTNAME:Widestring;
   ADRESS:Widestring;
   TELEFON:Widestring;
   VID:Widestring;
   NP:Widestring;
   TNP:Widestring;
   KNB:Widestring;
   KU :variant;
   PRKB:Widestring;
   GLB:Widestring;
   NCKS:Widestring;
   ISEP:Widestring;
   D_OPEN:Widestring;
   D_CLOSE:Widestring;
end;
PInfoBank = ^TInfoBank;
TInfoBankArr = array of TInfoBank;

TInfoBankDetail = record
  NCKS:Widestring;
  DEPCODE:Widestring;
  PRKBParse:Integer;
  KNB:Widestring;
  Name:Widestring;
  MFO :Widestring;
  OPENDATE:Widestring;
  CLOSEDATE:Widestring;
end;
TInfoBankDetailArr = array of TInfoBankDetail;

TInfoBankAll = record
  bank:TInfoBank;
  Detail:TInfoBankDetailArr;
end;
TInfoBankAllArr = array of TInfoBankAll;

TFileUrl = record
 Title:Widestring;
 Format:Widestring;
 url:Widestring;
end;

TFileUrlBqank = record
 dataset_id:Widestring;
 changed:Widestring;
 files:array of TFileUrl;
end;

TCourseOfValue = record
 r030: Integer;
 txt: Widestring;
 cc: Widestring;
 rate:Double;
end;
TCourseOfValueArr = array of TCourseOfValue;

TMergeDataBankNBU = class
  private
    FTimeOut:Integer;
    FConnectToDB:Widestring;
    FLogin:Widestring;
    FPassword:Widestring;

    function FSendPostRequest( URL:Widestring;UseSSL:Boolean=false ):Widestring;
    function FparseOptionsNBUJson(aJsonStr: Widestring): TFileUrlBqank;
    procedure FDestroyDS( DS : TIBQuery );

    function FUpdateSql( ConnectToDB, Login, Password:String; SQL:String ):Integer;
    function FCreateDataSet( ConnectToDB, Login, Password:String; SQL:String ):TIBQuery;
    function UpdateSql( ConnectToDB, Login, Password:String; SQL:String ):Integer;

    function FparseNBUDetailXML(XMLStr:Widestring):TInfoBankDetailArr ;
    function FGetAllDetailForBank(PRKB:Widestring;BanksDetail:TInfoBankDetailArr):TInfoBankDetailArr;overload;
    function FGetAllDetailForBank(PRKB:Widestring;BanksDetail:TInfoBankArr):TInfoBankDetailArr; overload;
    function FFindMainOfficeByPRKB(PRKB:Widestring; Banks:TInfoBankAllArr ):Integer;
    function FFixDate(DateStr:WideString):String;
  public
    function parseNBUJson( aJsonStr:Widestring ):TInfoBankArr;
    function parseFromFileMainJson(fileName:String):TInfoBankArr;
    function parseFromFileDetailXML(fileName:String):TInfoBankDetailArr;
    function parseCourseOfValuteJson(aJsonStr: Widestring): TCourseOfValueArr;

    function parseNBUFromUrl(url:String):TInfoBankArr;
    function parseNBUDetailFromUrl(url:String):TInfoBankDetailArr;

    function parseLastNBU:TInfoBankArr;
    function parseLastNBUDetail:TInfoBankDetailArr;
    function parseLastAll(progres:TProgressBar=nil):TInfoBankAllArr;

    Function  ParseCourseOfValute(aDate:TDate ):TCourseOfValueArr;
    Function  ParseCourseOfValuteAndUpdate(aDate:TDate; progresUpdate:TProgressBar=nil   ):TCourseOfValueArr;

    procedure parseLastAndUpdate( progresParse:TProgressBar=nil;progresUpdate:TProgressBar=nil );
    constructor Create( ConnectToDB, Login, Password:String );
    destructor Close;
end;

implementation

uses
  uLkJSON;

{ TMergeDataBankNBU }
//******************************************************************************
constructor TMergeDataBankNBU.Create(ConnectToDB, Login, Password:String);
begin
  FTimeOut:=5000;
  FConnectToDB:= ConnectToDB;
  FLogin := Login;
  FPassword:=Password;
end;
//******************************************************************************
destructor TMergeDataBankNBU.Close;
begin

end;
//******************************************************************************
function TMergeDataBankNBU.FparseOptionsNBUJson(aJsonStr: Widestring): TFileUrlBqank;
var js:TlkJSONobject;
    filesCount:Integer;
    i:integer;
begin
 if aJsonStr = '' then
 begin
   result.dataset_id :='';
   result.changed :='';
   SetLength( result.files , 0 );
   
   exit;
 end;
 //***********************************
 try
  js := TlkJSON.ParseText(aJsonStr) as TlkJSONobject;
  result.dataset_id :=js.Field['dataset_id'].Value;
  result.changed :=js.Field['changed'].Value;

  filesCount:=js.Field['files'].Count;

  SetLength(result.files , filesCount);
  for i:=0 to filesCount-1 do
  begin
   result.files[i].Title:= js.Field['files'].Child[i].Field['title'].Value;
   result.files[i].Format:= js.Field['files'].Child[i].Field['format'].Value;
   result.files[i].url:= js.Field['files'].Child[i].Field['url'].Value;
  end;

 finally
  js.Free;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.parseNBUJson(aJsonStr: Widestring): TInfoBankArr;
var js:TlkJSONobject;
    CountItems:Integer;
    i:integer;
begin
 if aJsonStr = '' then
 begin
  SetLength( result, 0 );
  
  exit;
 end;
  //******************************************************
 try
  js := TlkJSON.ParseText(aJsonStr) as TlkJSONobject;
  CountItems:=js.Field['rcukru'].Field['rowrcukru'].Count;
  //******************************************************
  SetLength( result,CountItems );
  for i:=0 to CountItems-1 do
  begin
    result[i].GLMFO := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['GLMFO'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['GLMFO'].Value ,'');
    result[i].MFO := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['MFO'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['MFO'].Value ,'');
    result[i].OBLUPR := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['OBLUPR'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['OBLUPR'].Value ,'');
    result[i].FULLNAME :=MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['FULLNAME'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['FULLNAME'].Value ,'');
    result[i].SHORTNAME := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['SHORTNAME'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['SHORTNAME'].Value ,'');
    result[i].ADRESS := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['ADRESS'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['ADRESS'].Value ,'');
    result[i].TELEFON :=MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['TELEFON'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['TELEFON'].Value ,'');
    result[i].VID := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['VID'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['VID'].Value ,'');
    result[i].NP := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['NP'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['NP'].Value ,'');
    result[i].TNP := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['TNP'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['TNP'].Value ,'');
    result[i].PRKB := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['PRKB'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['PRKB'].Value ,'');
    result[i].GLB  := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['GLB'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['GLB'].Value ,'');
    result[i].ISEP  := MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['ISEP'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['ISEP'].Value ,'');



    result[i].KNB :=MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['KNB'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['KNB'].Value ,'');
    result[i].NCKS :=MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['NCKS'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['NCKS'].Value ,'');

    result[i].D_OPEN :=MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['D_OPEN'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['D_OPEN'].Value ,'');
    result[i].D_CLOSE :=MyIfThen( js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['D_CLOSE'].Value<>null , js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['D_CLOSE'].Value ,'');

    result[i].KU := js.Field['rcukru'].Field['rowrcukru'].Child[i].Field['KU'].Value;
  end;
  //******************************************************
 finally
  js.Free;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.parseCourseOfValuteJson(aJsonStr: Widestring): TCourseOfValueArr;
var js:TlkJSONlist;
    CountItems:Integer;
    i:integer;
begin
 if aJsonStr = '' then
 begin
  SetLength( result, 0 );
  exit;
 end;
 try
  js := TlkJSON.ParseText(aJsonStr) as TlkJSONlist;
  CountItems:=js.Count;
  SetLength( Result , CountItems );

  for i:=0 to js.Count-1 do
  begin
    Result[i].r030 := js.Child[i].Field['r030'].Value;
    Result[i].txt := js.Child[i].Field['txt'].Value;
    Result[i].rate := js.Child[i].Field['rate'].Value;
    Result[i].cc := js.Child[i].Field['cc'].Value;
  end;

 finally
  js.Free;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.FparseNBUDetailXML(XMLStr:Widestring):TInfoBankDetailArr;
var
  xml: IXMLDOMDocument;
  nodes_row: IXMLDomNodeList;
  i : Integer;
begin
  try
  xml := CreateOleObject('Microsoft.XMLDOM') as IXMLDOMDocument;
  xml.async := False;
  xml.loadXML(XMLStr);
  
  if xml.parseError.errorCode <> 0 then
    raise Exception.Create('XML Load error:' + xml.parseError.reason);
  //*****************************************
  nodes_row:= xml.documentElement.getElementsByTagName( 'rowdptlist' );
  SetLength( Result , nodes_row.length );
  //*****************************************
  for i:=0 to nodes_row.length-1 do
  begin
    Result[i].NCKS := nodes_row.item[i].selectSingleNode('NCKS').text;
    Result[i].DEPCODE := nodes_row.item[i].selectSingleNode('DEPCODE').text;
    Result[i].PRKBParse:=StrToInt(Copy(Result[i].DEPCODE,1,3));

    Result[i].KNB     := utf8toansi( nodes_row.item[i].selectSingleNode('KNB').text );
    Result[i].Name    := utf8toansi( nodes_row.item[i].selectSingleNode('NAMEF').text );

    Result[i].OPENDATE := MyIfThen( nodes_row.item[i].selectSingleNode('OPENDATE').text<>'null', nodes_row.item[i].selectSingleNode('OPENDATE').text,'');
    Result[i].CLOSEDATE:= MyIfThen( nodes_row.item[i].selectSingleNode('CLOSEDATE').text<>'null', nodes_row.item[i].selectSingleNode('CLOSEDATE').text,'');
  end;
 finally
  xml:=nil;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.parseFromFileMainJson(fileName:String):TInfoBankArr;
var JSonStrList:TStringList;
begin
  JSonStrList := TStringList.Create;
  try
    if FileExists( fileName ) then
    begin
     JSonStrList.LoadFromFile( fileName );
     result := parseNBUJson( JSonStrList.Text );
    end;
  finally
    JSonStrList.Free;
  end;
end;
//******************************************************************************
function TMergeDataBankNBU.FSendPostRequest( URL:Widestring; UseSSL:Boolean=false ):Widestring;
var Myhttp:TIdHTTP;
    LHandler : TIdSSLIOHandlerSocket;
begin
 try
   Myhttp:=TIdHTTP.Create(nil);
   Myhttp.ReadTimeout:=FTimeOut;
   Myhttp.HandleRedirects:=true;

   if UseSSL then
   begin
     LHandler := TIdSSLIOHandlerSocket.Create(nil);
     LHandler.SSLOptions.Method:= sslvTLSv1;
     Myhttp.IOHandler:=LHandler;
   end;

   Myhttp.Request.UserAgent:='Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.102 Safari/537.36';
   result := Myhttp.Get( URL );

 finally
   FreeAndNIl(Myhttp);
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.parseNBUFromUrl(url:String):TInfoBankArr;
var JSonStr:Widestring;
begin
  JSonStr:=  FSendPostRequest( URL );
  result :=  parseNBUJson( JSonStr );
end;
//******************************************************************************
function TMergeDataBankNBU.parseNBUDetailFromUrl(url:String):TInfoBankDetailArr;
var XMLStr:Widestring;
begin
  XMLStr:=  FSendPostRequest( URL );
  result:=  FparseNBUDetailXML( XMLStr );
end;
//******************************************************************************
function TMergeDataBankNBU.parseLastNBU:TInfoBankArr;
Const Url = 'http://data.gov.ua/view-dataset/dataset.json?dataset-id='+'962846a2-4c2e-4483-84da-f024e3be6435';
var JSonStr:Widestring;
    OptionBank:TFileUrlBqank;
begin
 JSonStr:=  FSendPostRequest( url );
 OptionBank := self.FparseOptionsNBUJson( JSonStr );

 if Length(OptionBank.files)<>0 then
 begin
  result:=parseNBUFromUrl( OptionBank.files[1].url);
 end
  else SetLength( result , 0 );      
end;
//******************************************************************************
function TMergeDataBankNBU.parseLastNBUDetail:TInfoBankDetailArr;
Const Url = 'http://data.gov.ua/view-dataset/dataset.json?dataset-id='+'962846a2-4c2e-4483-84da-f024e3be6435';
var JSonStr:Widestring;
    OptionBank:TFileUrlBqank;
begin
 JSonStr:=  FSendPostRequest( url );
 OptionBank := self.FparseOptionsNBUJson( JSonStr );

 if Length(OptionBank.files)<>0 then
 begin
  result:=parseNBUDetailFromUrl( OptionBank.files[3].url);
 end
  else SetLength( result , 0 );      
end;
//******************************************************************************
function TMergeDataBankNBU.FGetAllDetailForBank(PRKB:Widestring;BanksDetail:TInfoBankDetailArr):TInfoBankDetailArr;
var i:integer;
    PRKBCurr:Integer;
    len:integer;
begin
 SetLength(result , 0);
 if not IsStrANumber(PRKB) then
   exit
  else PRKBCurr:=StrToInt(PRKB);
 //***********************************
 for i:=0 to Length(BanksDetail)-1 do
 begin
   if BanksDetail[i].PRKBParse = PRKBCurr then
   begin
     len:= Length(result);
     SetLength(result,len+1);
     result[len] := BanksDetail[i];
   end;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.FGetAllDetailForBank(PRKB:Widestring;BanksDetail:TInfoBankArr):TInfoBankDetailArr;
var i:integer;
    len:integer;
begin
 SetLength(result , 0);
 if not IsStrANumber(PRKB) then exit;
 //***********************************
 for i:=0 to Length(BanksDetail)-1 do
 begin
   if (CompareText(BanksDetail[i].PRKB,PRKB) = 0 )and(CompareText(BanksDetail[i].PRKB,BanksDetail[i].GLB)<>0) then
   begin
     len:= Length(result);
     SetLength( result, len+1 );
     result[len].Name := BanksDetail[i].FULLNAME;
     result[len].NCKS := '';
     result[len].OPENDATE  := BanksDetail[i].D_OPEN;
     result[len].CLOSEDATE := BanksDetail[i].D_CLOSE;
     result[len].MFO       := BanksDetail[i].MFO;
   end;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.FFindMainOfficeByPRKB(PRKB:Widestring;Banks:TInfoBankAllArr ):Integer;
var i:integer;
begin
 result:=-1;
 for i:=0 to Length(Banks)-1 do
 begin
   if (CompareText(Banks[i].bank.PRKB,PRKB)=0) and (CompareText(Banks[i].bank.GLB,PRKB)=0) then
   begin
     result:= i;
     break;
   end;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.parseLastAll(progres:TProgressBar=nil):TInfoBankAllArr;
var i:integer;
    Banks:TInfoBankArr;
    CurrBank:TInfoBankAll;
    BanksDetail:TInfoBankDetailArr;
    Len:Integer;
    IndBank:Integer;
begin
  Banks:= parseLastNBU;
  BanksDetail:= parseLastNBUDetail;
  //********************************
  //SetLength(result, Length(Banks));
  if progres<>nil then
    progres.Max :=Length(Banks);
  //********************************
  for i:=0 to Length(Banks)-1 do
  begin
    if CompareText( Banks[i].GLB , Banks[i].PRKB )=0 then // Main Office
    begin
      Len:=Length(result);
      SetLength(result,Len+1);
      result[Len].bank  :=Banks[i];
      result[Len].Detail:=FGetAllDetailForBank(Banks[i].GLB, BanksDetail);
    end;
  end;
  //********************************
  for i:=0 to Length(Banks)-1 do
  begin
    if CompareText( Banks[i].GLB , Banks[i].PRKB )<>0 then // Filial Office
    begin
       if Banks[i].GLB = '0' then
       begin
        IndBank:= FFindMainOfficeByPRKB( Banks[i].PRKB, result  );
        if IndBank<>-1 then
          result[IndBank].Detail:= FGetAllDetailForBank( Banks[i].PRKB, Banks )
         else  ShowMessage('Not Found '+Banks[i].FULLNAME );
       end;
    end;
    if progres<>nil then
      progres.Position:=progres.Position +1;
  end;
end;
//******************************************************************************
function TMergeDataBankNBU.parseFromFileDetailXML(fileName:String):TInfoBankDetailArr;
var XMLStrList:TStringList;
begin
  XMLStrList := TStringList.Create;
  try
    if FileExists( fileName ) then
    begin
     XMLStrList.LoadFromFile( fileName );
     result := FparseNBUDetailXML( XMLStrList.Text );
    end;
  finally
    XMLStrList.Free;
  end;
end;
//******************************************************************************
function TMergeDataBankNBU.FCreateDataSet( ConnectToDB, Login, Password:String; SQL:String ):TIBQuery;
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
     result.SQL.Text := SQL;
     result.Active := true;
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
function TMergeDataBankNBU.UpdateSql( ConnectToDB, Login, Password:String; SQL:String ):Integer;
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
       
       IBSQL.Params.Clear;
       IBSQL.ParamCheck := False;
       IBSQL.SQL.Clear;

       IBSQL.SQL.Text := SQL;
       IBSQL.ExecSQL;

       result:=0;
     except
      Result:=-1;
     end;
   end;
 finally
   IBDB.Free;
 end;
end;
//******************************************************************************
function TMergeDataBankNBU.FUpdateSql( ConnectToDB, Login, Password:String; SQL:String ):Integer;
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

       result:=0;
     except
      Result:=-1;
     end;
   end;
 finally
   IBDB.Free;
 end;
end;
//******************************************************************************
procedure TMergeDataBankNBU.FDestroyDS( DS : TIBQuery );
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
function TMergeDataBankNBU.FFixDate(DateStr:WideString):String;
var SaveFormatDate:String;
    CurrDate:TDateTime;
begin
  Result:='';
  if DateStr='' then exit;

  CurrDate:=MyStrToDate(DateStr, 'yyyy-mm-dd hh24:mm:ss');
  Result:=ConvertDateTime(CurrDate,0);
end;
//******************************************************************************
procedure TMergeDataBankNBU.parseLastAndUpdate( progresParse:TProgressBar=nil;progresUpdate:TProgressBar=nil );
var Res:TInfoBankAllArr;
    i,j:integer;
    aListLog:TStringList;
Function UpdateBank( GLMFO,MFO,NAME,D_OPEN,D_CLOSE,ADDRESS,DEPCODE:Widestring ):boolean;
var SQlUpdate:Widestring;
begin
 D_OPEN:=FFixDate(D_OPEN);
 D_CLOSE:=FFixDate(D_CLOSE);

 ReplaseON(NAME,'''','@#@#@');
 ReplaseON(NAME,'@#@#@',#39#39);

 ReplaseON(ADDRESS,#39,'@#@#@');
 ReplaseON(ADDRESS,'@#@#@',#39#39);

 SQlUpdate := 'EXECUTE PROCEDURE SET_UPDATE_NEW_BANK('+#39+GLMFO+#39+','+#39+MFO+#39+','+#39+NAME+#39+','+#39+D_OPEN+#39+','+
               MyIfThen(D_CLOSE='', 'null', #39+D_CLOSE+#39)+','+#39+ADDRESS+#39+','+MyIfThen(DEPCODE='','null', #39+DEPCODE+#39)+')';
 UpdateSql( FConnectToDB, FLogin, FPassword, SQlUpdate );
end;
//******************************************************************************
begin
  Res:= self.parseLastAll(progresParse);
  try
    aListLog:=TStringList.Create;
    if progresUpdate<> nil then progresUpdate.Max := Length(Res);

    for i:=0 to Length(Res)-1 do
    begin
      if Res[i].bank.ISEP<>'' then
      begin

        UpdateBank(Res[i].bank.GLMFO,Res[i].bank.MFO,Res[i].bank.FULLNAME,Res[i].bank.D_OPEN,Res[i].bank.D_CLOSE, Res[i].bank.TNP+' '+Res[i].bank.NP+' '+Res[i].bank.ADRESS,'' );
        for j:=0 to Length(Res[i].Detail)-1 do
          UpdateBank(Res[i].bank.GLMFO, Res[i].Detail[j].MFO,Res[i].Detail[j].Name, Res[i].Detail[j].OPENDATE, Res[i].Detail[j].CLOSEDATE, '', Res[i].Detail[j].DEPCODE );

      end;
      if progresUpdate<> nil then progresUpdate.Position:= progresUpdate.Position + 1;
    end;
  finally
   aListLog.SaveToFile( ExtractFilePath(Application.ExeName)+'MFONotFound.Log' );
   aListLog.Free;
  end;
end;
//******************************************************************************
Function TMergeDataBankNBU.ParseCourseOfValute( aDate:TDate ):TCourseOfValueArr;
const url = 'https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?';//date=20170428&json
var JSonStr:Widestring;
    CurrDateStr:Widestring;
begin
 CurrDateStr:=ConvertDateTime( aDate, 4  );
 ReplaseOn(CurrDateStr,'.','');
 JSonStr:=  FSendPostRequest( url+'date='+CurrDateStr+'&json',True );
 
 Result := self.parseCourseOfValuteJSon( JSonStr );
end;
//******************************************************************************
Function TMergeDataBankNBU.ParseCourseOfValuteAndUpdate(aDate:TDate; progresUpdate:TProgressBar=nil ):TCourseOfValueArr;
var i:integer;
    CourseOfValueArr:TCourseOfValueArr;
    SqlUpdate:Widestring;
    Currr030:String;
    CurrDate:String;
    CurrRate:Widestring;
begin
  CourseOfValueArr:= ParseCourseOfValute(aDate  );

  if progresUpdate <> nil  then
  begin
   progresUpdate.Position:=0;
   progresUpdate.Max:= Length(CourseOfValueArr);
  end;
  for i:=0 to Length(CourseOfValueArr)-1 do
  begin
    Currr030:=AddNolForLengthNumber( IntToStr( CourseOfValueArr[i].r030), 3, '0' );
    CurrDate:=ConvertDateTime(aDate, 1)+' 00:00:00';
    CurrRate:=FloatToStr(CourseOfValueArr[i].rate);
    ReplaseON( CurrRate , ',','.');

    SqlUpdate:=' EXECUTE PROCEDURE SET_UPDATE_NEW_CURRENCY('''+ Currr030+''''+','+''''+ CurrDate+''''+' ,1,' + CurrRate +' )';
    self.FUpdateSql( self.FConnectToDB, self.FLogin, self.FPassword, SqlUpdate);

    if progresUpdate <> nil  then progresUpdate.Position:= progresUpdate.Position + 1;
  end;
end;
end.

//if exists( SELECT BANKID FROM BANKS WHERE MFO='300001' ) then
// SELECT  * FROM BANKS WHERE MFO='300001'
//end if;



//******************************************************************************    
{Function CheckIs(Bank,MFO:Widestring):Boolean;
var SQLPresent:Widestring;
    DS:TIBQuery;
begin
 SQLPresent:= 'SELECT * from BANKS where MFO='''+ MFO+'''';

 Result:=false;

 DS := FCreateDataSet( ConnectToDB, Login, Password, SQLPresent);
 try
   if DS.RecordCount=0 then
     aListLog.Add( Bank +' '+ MFO )
   else result:=true;

 finally
  FDestroyDS( DS );
 end;
end;}
//******************************************************************************