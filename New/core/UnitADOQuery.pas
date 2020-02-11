unit UnitADOQuery;

interface
uses ADODB,DB,Classes,variants;
   function  CreateDataSet( ConnectToDB, Login, Password:String; CommandText:String='';CmdType:TCommandType=cmdText; Active:Boolean=True ):TADODataset;overload;
   function  CreateDataSet( ConnectionString:String; CommandText:String='';CmdType:TCommandType=cmdText; Active:Boolean=True ):TADODataset; overload;
   function  CreateDataSet( ADOCon:TAdoConnection; CommandText:String='';CmdType:TCommandType=cmdText; Active:Boolean=True ):TADODataset; overload;
   function  CreateConnectionString(ConnectToDB, Login, Password:String):string;
   function  CreateConnectionStringMySQL( NameDB, Login, Password:String):string;
   function  UpdateSql( ADOCon:TADOConnection; CommandText:String='' ):Integer; overload;
   function  UpdateSql(  ConnectToDB, Login, Password:String; CommandText:String='' ):Integer; overload;
   procedure GetParamDatabaseADO( AdoConnection:TAdoConnection;var PatDB, UID, Password:String );
   Function  IDCheckIS( ADOCon:TAdoConnection; TableName:string;FieldId,IdValue:String ):Boolean;
   procedure GetSelfFieldsForTable( ADOCon:TAdoConnection; aTableName,aFieldKod:String; var aListSelfField:TStringList );
   Function  IDGenId( TableName:string;ADOCon:TAdoConnection ):Variant;
   procedure DestroyDS( DS : TCustomADODataSet );
   function  GetCounrRecordDB( ADOCon:TAdoConnection; SQL:Widestring ):Integer;
   function  GetValueDB( ADOCon:TAdoConnection; SQL:Widestring ):Variant;
   function  CreateStoredProcDataSet( ADOCon:TAdoConnection; StoredProcName:widestring;
                                      ParamInputName:array of Widestring; ParamInputFieldType:array of TFieldType ):TADOStoredProc;
   procedure DestroyStorProc( STProc : TAdoStoredProc );                                      
implementation

function CreateConnectionString(ConnectToDB, Login, Password:String):string;
begin
  result :='Provider=MSDASQL.1;Password='+Password+';Persist Security Info=True;User ID='+Login+
                            ';Extended Properties="Driver=Firebird/InterBase(r) driver;Dbname='+ConnectToDB+';PWD='+Password+';UID='+Login+';"';
end;

function CreateConnectionStringMySQL( NameDB, Login, Password:String):string;
begin
  //result := 'Provider=MSDASQL.1;Persist Security Info=False;User ID='+Login+';'+'Password='+Password+';Data Source=MySqlSource;Initial Catalog='+NameDB;

  //result := 'Provider=MSDASQL.1; Password='+Password+'; Persist Security Info=True; User ID='+Login+';'+'Password='+Password+
  //          'Extended Properties="DRIVER={MySQL ODBC 5.3 ANSI Driver};'+
  //          'OPTION=3; UID='+Login+';PWD='+Password+';"Initial Catalog='+NameDB+';stmt=set names utf8;';


  result := 'Provider=MSDASQL.1; Password='+Password+';Persist Security Info=True; User ID='+Login+';'+'Password='+Password+
            ';Extended Properties="DSN=MySqlSource;DRIVER={MySQL ODBC 5.1 ANSI Driver};UID='+Login+';PORT:3306;Password='+Password+';";Initial Catalog='+NameDB+';OPTION=3;';

 // result := 'Provider=MSDASQL.1;Extended Properties="DRIVER=SQLite3 ODBC Driver;Database='+Password+';LongNames=0;Timeout=1000;NoTXN=0;SyncPragma=NORMAL;StepAPI=0;"';


            //'Data Source=MySqlSource;UID='+Login+';PWD='+Password+';";Initial Catalog='+NameDB+';OPTION=3;';    //stmt=set names cp1251;     OPTION=1048579

  //Result := 'Provider=MSDASQL.1;Password=HonzOKey;Persist Security Info=True;User ID=USERALGOL;Extended Properties="DSN=MySqlSource;DRIVER={MSDASQL.1};UID=USERALGOL;PWD=HonzOKey;OPTION=3;PORT:3306;Password=HonzOKey;";Initial Catalog=algol;';

  //SERVER=192.168.0.97;PORT=3306
  //{MySQL ODBC 5.1 Driver}
end;

function CreateDataSet( ConnectToDB, Login, Password:String; CommandText:String='';CmdType:TCommandType=cmdText; Active:Boolean=True ):TADODataset;overload;
var ADOCon:TAdoConnection;
begin
  ADOCon := TAdoConnection.Create(nil);
  ADOCon.LoginPrompt:= False;
  ADOCon.ConnectionString := CreateConnectionString( ConnectToDB, Login, Password );

  try
    ADOCon.Connected:=True;
    result := TADODataset.create(nil);
    result.Connection := ADOCon;
    result.CommandType := CmdType;
    result.CommandText := CommandText;
    if (Active)and(CommandText<>'') then result.Open;

  except
    result := nil;
  end;

end;

function CreateDataSet( ConnectionString:String; CommandText:String='';CmdType:TCommandType=cmdText; Active:Boolean=True ):TADODataset; overload;
var ADOCon:TAdoConnection;
begin
  ADOCon:=TAdoConnection.Create(nil);
  ADOCon.LoginPrompt:= False;
  ADOCon.ConnectionString := ConnectionString;
  ADOCon.DefaultDatabase := ADOCon.Properties['Initial Catalog'].Value;

  try
    ADOCon.Connected:=True;
    result :=TADODataset.create(nil);
    result.Connection := ADOCon;
    result.CommandType := CmdType;
    result.CommandText := CommandText;
    if (Active)and(CommandText<>'') then result.Open;

  except
    result := nil;
  end;

end;

function CreateDataSet( ADOCon:TAdoConnection; CommandText:String='';CmdType:TCommandType=cmdText; Active:Boolean=True ):TADODataset; overload;
begin
  try
    ADOCon.Connected:=True;
    result := TADODataset.create(nil);
    result.Connection :=ADOCon;
    result.CommandType := CmdType;
    result.CommandText := CommandText;
    if (Active)and(CommandText<>'') then result.Open;

  except
    result := nil;
  end;

end;
//******************************************************************************
function UpdateSql( ADOCon:TADOConnection; CommandText:String='' ):Integer;
var DBQuery:TADOQuery;
begin
  try
    try

      ADOCon.Connected:=True;
      DBQuery := TADOQuery.create(nil);
      DBQuery.Connection := ADOCon;
      DBQuery.SQL.Text := CommandText;
      result := DBQuery.ExecSQL;

    finally
      DBQuery.Free;
    end;
  except
    if DBQuery<> nil then
      DBQuery.Free;
    result := -1;
  end;
end;
//******************************************************************************
function UpdateSql(  ConnectToDB, Login, Password:String; CommandText:String='' ):Integer;
var ADOCon:TAdoConnection;
begin
  ADOCon:=TAdoConnection.Create(nil);
  ADOCon.LoginPrompt:= False;
  ADOCon.ConnectionString := CreateConnectionString( ConnectToDB, Login, Password);
  Result := UpdateSql( ADOCon, CommandText );
end;
//******************************************************************************
procedure GetParamDatabaseADO( AdoConnection:TAdoConnection;var PatDB, UID, Password:String );
begin
  UID := AdoConnection.Properties['User ID'].Value;
  Password :=ADOConnection.Properties['Password'].Value;
  PatDB := ADOConnection.DefaultDatabase;
end;
//******************************************************************************
procedure DestroyDS( DS : TCustomADODataSet );
begin
  if DS <> nil then
  begin
    if (DS.Connection.Owner=nil)and(DS.Connection.Name='') then
      DS.Connection.Free;
    DS.Free;
  end;
end;
//******************************************************************************
Function IDCheckIS( ADOCon:TAdoConnection; TableName:string;FieldId,IdValue:String):Boolean;
var SQL:String;
    ADODB:TAdoDataset;
begin
 SQL:='SELECT '+FieldId+' from '+TableName+' where '+TableName+'.'+FieldId+'='+''''+IdValue+'''';
 ADODB:= CreateDataSet( ADOCon,  SQL );
 try
  result:=not ADODB.IsEmpty;
 finally
  DestroyDS( ADODB );
 end;
end;
//******************************************************************************
procedure GetSelfFieldsForTable( ADOCon:TAdoConnection; aTableName,aFieldKod:String; var aListSelfField:TStringList );
var i:Integer;
    AdoFieldQuery:TADODataset;
begin
  AdoFieldQuery:=CreateDataSet( ADOCon, 'select * from '+aTableName +' where '+aFieldKod+' is null');
  try
   for i:=0 to AdoFieldQuery.Fields.Count-1 do
     aListSelfField.Add( AdoFieldQuery.Fields[i].FieldName );

  finally
    DestroyDS(AdoFieldQuery);
  end;
end;
//******************************************************************************
Function IDGenId( TableName:string; ADOCon:TAdoConnection ):Variant;
var SQL:String;
    ADODS : TADODataset;
begin
  SQL:='SELECT AUTO_INCREMENT FROM information_schema.tables WHERE table_name = '+#39+TableName+#39+' AND table_schema = DATABASE()';
  ADODS:= CreateDataSet( ADOCon, SQL );
  try
    result:=ADODS.Fields[0].asVariant;
  finally
    DestroyDS( ADODS );
  end;
end;
//******************************************************************************
function  GetValueDB( ADOCon:TAdoConnection; SQL:Widestring ):Variant;
var DB:TADODataset;
begin
  try
    DB := CreateDataSet( ADOCon, SQL);
    Result := DB.Fields[0].value;
  finally
    DestroyDS( DB );
  end;
end;
//******************************************************************************
function GetCounrRecordDB( ADOCon:TAdoConnection; SQL:Widestring ):Integer;
var val:Integer;
begin
  val := GetValueDB( ADOCon, SQL );
  if val <> null then result := val;
end;
//******************************************************************************
function CreateStoredProcDataSet( ADOCon:TAdoConnection; StoredProcName:widestring;
                                  ParamInputName:array of Widestring; ParamInputFieldType:array of TFieldType ):TADOStoredProc;
var i:Integer;
begin
 try
   if ADOCon.Connected then
   begin
     result := TADOStoredProc.Create(nil);
     result.ProcedureName := StoredProcName;

     for i:=0 to Length(ParamInputName)-1 do
       result.Parameters.CreateParameter( ParamInputName[i], ParamInputFieldType[i], pdInput,0,null );
   end
    else
      result:=nil;
 finally

 end;
end;
//******************************************************************************
procedure DestroyStorProc( STProc : TAdoStoredProc );
begin
  if STProc <> nil then
  begin
    STProc.Free;
    STProc:= nil;
  end;
end;


end.
 