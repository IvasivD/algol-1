unit UnitIBQuery;

interface
uses Windows,IBQuery,IBDatabase,IBStoredProc,IBCustomDataSet,SysUtils,DB,Classes,DBTables,UnitProc,ShellApi,Dialogs,Variants;

  function UpdateSql( ConnectToDB, Login, Password:String; SQL:String ):Integer;
  function CreateIBDatabase( ConnectToDB,Login,Password:string;AutoConnect:Boolean=True ):TIBDatabase;
  function CreateDataSet( ConnectToDB, Login, Password:String; Owner:TComponent=nil; SQL:String=''; Active:Boolean=True ):TIBQuery;overload;
  function CreateDataSet( IBDB:TIBDatabase; Owner:TComponent; SQL:String=''; Active:Boolean=True ):TIBQuery; overload;
  function CreateStoredProcDataSet( ConnectToDB, Login, Password:String; StoredProcName:widestring;
                                    ParamInputName:array of Widestring; ParamInputFieldType:array of TFieldType ):TIBStoredProc;

  procedure DestroyDS( DS : TIBCustomDataSet );
  procedure DestroyStorProc( STProc : TIBStoredProc );

  Function  IDGenId(GenName,ConnectToDB, Login, Password :String):Integer;
  Function  IDCheckIS(TableName,FieldId, ConnectToDB, Login, Password :String; IdValue:String):Boolean;
  Function  CheckFunctBeforeDelete(FunctiongName, ConnectToDB, Login, Password :String; IdValue:String):Widestring;
  Function  GetConstraintsForTable(ConnectToDB, Login, Password :String; TableName:String):TIBQuery;
  Function  GetFieldIdName(ConnectToDB, Login, Password :String; TableName:String):String;
  Function  GetFieldName(ConnectToDB, Login, Password :String; TableName:String):TIBQuery;
  Function  GetIndexesForTable( ConnectToDB, Login, Password :String; TableName:String ):TIBQuery;
  function  GetAllTables( ConnectToDB, Login, Password :String ):TIBQuery;
  procedure GetParamDatabaseIB( Database:TIBDatabase; var PathDB, UID, Password:String );
  procedure GetSelfFieldsForTable(PathDB, UID, Password:String; aTableName,aFieldKod:String; var aListSelfField:TStringList );
  //**************************************
  procedure DestroyDataSetBDE( DB:TQuery );
  function  GetCounrRecordDB( ConnectToDB, Login, Password:String; SQL:Widestring ):Integer;
  function  GetValueDB( ConnectToDB, Login, Password:String; SQL:Widestring ):Variant;
  function  CreateDataSetBDE( ConnectToDB, Login, Password:String; SQL:String=''; Active:Boolean=True ):TQuery;
  //**************************************
  function CreateDataSet( DB:TDatabase; SQL:String=''; Active:Boolean=True ):TQuery; overload;
  function ConsoleAddUser(GSecPath, DatabaseSecurityPath, Login, Password:String; NewUserLogin,NewPassword:string;NewFName:string='';NewLName:string=''):Integer;
  function GetDescriptForTable(ConnectToDB, Login, Password,TableName :String):String;
implementation

//******************************************************************************
function UpdateSql( ConnectToDB, Login, Password:String; SQL:String ):Integer;
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
       try
         IBSQL := TIBQuery.Create(nil);
         IBTransaction := TIBTransaction.Create(nil);
         IBTransaction.Params.Add('read_committed');
         IBTransaction.Params.Add('rec_version');
         IBTransaction.Params.Add('nowait');

         IBTransaction.DefaultDatabase := IBDB;
         IBSQL.Transaction := IBTransaction;
         IBSQL.SQL.Text := SQL;
         IBSQL.ExecSQL;
         IBSQL.Transaction.Commit;
         result:=0;
       finally
        DestroyDS( IBSQL );
       end;
     except
      Result:=-1;
     end;
   end;
 finally
   //IBDB.Free;
 end;
end;
//******************************************************************************
function CreateStoredProcDataSet( ConnectToDB, Login, Password:String; StoredProcName:widestring;
                                  ParamInputName:array of Widestring; ParamInputFieldType:array of TFieldType ):TIBStoredProc;
var i:Integer;
    IBTransaction : TIBTransaction;
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
     result := TIBStoredProc.Create(nil);
     IBTransaction := TIBTransaction.Create(nil);
     IBTransaction.Params.Add('read_committed');
     IBTransaction.Params.Add('rec_version');
     IBTransaction.Params.Add('nowait');

     IBTransaction.DefaultDatabase := IBDB;
     result.Transaction := IBTransaction;
     result.StoredProcName := StoredProcName;

     for i:=0 to Length(ParamInputName)-1 do
       result.Params.CreateParam( ParamInputFieldType[i], ParamInputName[i], ptInput);
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
function CreateIBDatabase( ConnectToDB,Login,Password:string;AutoConnect:Boolean=True ):TIBDatabase;
begin
  result := TIBDatabase.Create(nil);
  result.DatabaseName := ConnectToDB;
  result.LoginPrompt  :=False;
  result.Params.Values['user_name'] := Login;
  result.Params.Values['password']  := Password;
  result.Connected:=AutoConnect;
end;
//******************************************************************************
function CreateDataSet( IBDB:TIBDatabase; Owner:TComponent; SQL:String=''; Active:Boolean=True ):TIBQuery;
var IBTransaction : TIBTransaction;
begin
   if IBDB.Connected then
   begin
     result := TIBQuery.Create(Owner);
     IBTransaction := TIBTransaction.Create(nil);
     IBTransaction.Params.Add('read_committed');
     IBTransaction.Params.Add('rec_version');
     IBTransaction.Params.Add('nowait');

     IBTransaction.DefaultDatabase := IBDB;
     result.Transaction := IBTransaction;
     if SQL<>'' then
     begin
      result.SQL.Text := SQL;
      result.Active := Active;
     end;
   end
    else
    begin
      IBDB.Free;
      result:=nil;
    end;
end;
//******************************************************************************
function CreateDataSet( ConnectToDB, Login, Password:String;Owner:TComponent=nil; SQL:String=''; Active:Boolean=True ):TIBQuery;
var IBTransaction : TIBTransaction;
    IBDB : TIBDatabase;
begin
  IBDB := CreateIBDatabase( ConnectToDB,Login,Password );
  result := CreateDataSet( IBDB, Owner, SQL , Active );
end;
//******************************************************************************
procedure DestroyDS( DS : TIBCustomDataSet );
begin
  if DS <> nil then
  begin
   if DS.Transaction <> nil then
   begin
     if DS.Transaction.DefaultDatabase <> nil then
        DS.Transaction.DefaultDatabase.Free;

     if (DS.Transaction <> nil) and DS.Transaction.Active then DS.Transaction.Commit;
     if (DS.Transaction <> nil) then DS.Transaction.Free;
   end;
   DS.Free;
   DS:=nil;
  end;
end;
//******************************************************************************
procedure DestroyStorProc( STProc : TIBStoredProc );
begin
  if STProc <> nil then
  begin
   if STProc.Transaction <> nil then
   begin
     if STProc.Transaction.DefaultDatabase <> nil then
        STProc.Transaction.DefaultDatabase.Free;

     if STProc.Transaction.Active then STProc.Transaction.Commit;
     STProc.Transaction.Free;
   end;
   STProc.Free;
   STProc:= nil;
  end;
end;
//******************************************************************************
Function IDGenId(GenName,ConnectToDB, Login, Password :String):Integer;
var SQL:String;
    IBDS:TIBQuery;
begin
 SQL:='SELECT GEN_ID( '+GenName+', 1) FROM RDB$DATABASE';
 IBDS:= CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
 try
  result:=IBDS.Fields[0].AsInteger;
 finally
  DestroyDS( IBDS );
 end;
end;
//******************************************************************************
Function IDCheckIS(TableName,FieldId, ConnectToDB, Login, Password :String; IdValue:String):Boolean;
var SQL:String;
    IBDS:TIBQuery;
begin
 SQL:='SELECT '+FieldId+' from '+TableName+' where '+TableName+'.'+FieldId+'='+''''+IdValue+'''';
 IBDS:= CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
 try
  result:=not IBDS.IsEmpty;
 finally
  DestroyDS( IBDS );
 end;
end;
//******************************************************************************
Function CheckFunctBeforeDelete(FunctiongName, ConnectToDB, Login, Password :String; IdValue:String):Widestring;
var SQL:String;
    IBDS:TIBQuery;
begin
 SQL:='SELECT AcceptMessage from '+FunctiongName+'('+''''+IdValue+''''+')';
 IBDS:= CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
 try
  result := Trim( IBDS.FieldByName('AcceptMessage').AsString );
 finally
  DestroyDS( IBDS );
 end;
end;
//******************************************************************************
Function GetConstraintsForTable(ConnectToDB, Login, Password :String; TableName:String):TIBQuery;
var SQL:String;
begin
  SQL := 'select distinct Con.rdb$constraint_name constraint_name, '+
  'Rel.rdb$relation_name TableName ,Rel.rdb$field_name FieldName, '+
  'FCon.rdb$Relation_Name ForeignTableName, FIseg.rdb$Field_Name ForeignFieldName , '+
  'Con.rdb$constraint_type Constraint_type, ConUpdate.RDB$DELETE_RULE DeleteRule '+
  'from rdb$relation_fields Rel '+
  'inner join rdb$relation_constraints Con on (Con.rdb$relation_name = Rel.rdb$relation_name ) '+
  'inner join rdb$ref_constraints ConUpdate on ( ConUpdate.RDB$CONSTRAINT_NAME = Con.rdb$constraint_name ) '+
  'inner join rdb$indices IDX on (IDX.rdb$index_name = Con.rdb$index_name) '+
  'inner join rdb$index_segments ISeg on (ISeg.rdb$index_name = Idx.rdb$index_name and ISeg.rdb$Field_Name = Rel.rdb$field_name) '+
  'inner join rdb$Relation_Constraints FCon on (FCon.rdb$index_name = Idx.rdb$Foreign_Key) '+
  'inner join rdb$index_segments FIseg on (FISeg.rdb$index_name = Idx.rdb$Foreign_key and FISeg.rdb$Field_Position = ISeg.rdb$Field_Position) '+
  'where Rel.rdb$relation_name = '''+TableName+'''';

  result := CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
end;
//******************************************************************************
Function GetFieldIdName(ConnectToDB, Login, Password :String; TableName:String):String;
var SQL:String;
    IBDS:TIBQuery;
begin
  SQL := 'select '+
  '  ix.rdb$index_name as index_name,'+
  '  sg.rdb$field_name as field_name, '+
  '  rc.rdb$relation_name as table_name  '+
  ' from  '+
  '  rdb$indices ix '+
  '  left join rdb$index_segments sg on ix.rdb$index_name = sg.rdb$index_name '+
  '  left join rdb$relation_constraints rc on rc.rdb$index_name = ix.rdb$index_name '+
  ' where rc.rdb$constraint_type = ''PRIMARY KEY'' and rc.rdb$relation_name ='''+TableName+'''';

  try
    IBDS := CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
    result:= Trim( IBDS.fieldByName('field_name').AsString);

  finally
    DestroyDS( IBDS );
  end;
end;
//******************************************************************************
Function GetFieldName(ConnectToDB, Login, Password :String; TableName:String):TIBQuery;
var SQL:String;
begin
  SQL := 'SELECT b.RDB$FIELD_NAME fieldName , d.RDB$TYPE_NAME fieldType, '+
  ' c.RDB$FIELD_LENGTH fieldSize, b.RDB$NULL_FLAG IsNull,'+
  ' b.rdb$Description Description '+
  ' FROM   RDB$RELATIONS a '+
  ' INNER JOIN RDB$RELATION_FIELDS b '+
  ' ON     a.RDB$RELATION_NAME = b.RDB$RELATION_NAME '+
  ' INNER JOIN RDB$FIELDS c '+
  ' ON     b.RDB$FIELD_SOURCE = c.RDB$FIELD_NAME '+
  ' INNER JOIN RDB$TYPES d  '+
  ' ON     c.RDB$FIELD_TYPE = d.RDB$TYPE '+
  ' WHERE  a.RDB$SYSTEM_FLAG = 0 '+
  '  AND  d.RDB$FIELD_NAME = ''RDB$FIELD_TYPE'' AND b.RDB$RELATION_NAME='''+TableName+''''+
  ' ORDER BY a.RDB$RELATION_NAME, b.RDB$FIELD_ID ';

 result := CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
end;
//******************************************************************************
function GetIndexesForTable( ConnectToDB, Login, Password :String; TableName:String ):TIBQuery;
var SQL:string;
begin

  SQL:= ' SELECT RDB$INDICES.RDB$INDEX_NAME INDEX_NAME, '+
      ' RDB$INDICES.RDB$RELATION_NAME RELATION_NAME,'+
      ' RDB$INDICES.RDB$UNIQUE_FLAG UNIQUE_FLAG,'+
      ' RDB$INDICES.RDB$DESCRIPTION DESCRIPTION, '+
      ' RDB$INDICES.RDB$SEGMENT_COUNT SEGMENT_COUNT, '+
      ' RDB$INDICES.RDB$INDEX_INACTIVE INDEX_INACTIVE, '+
      ' RDB$INDICES.RDB$INDEX_TYPE INDEX_TYPE,'+
      ' RDB$INDICES.RDB$STATISTICS STAT, '+
      ' RDB$INDEX_SEGMENTS.RDB$FIELD_NAME FIELD_NAME,'+
      ' RDB$INDEX_SEGMENTS.RDB$FIELD_POSITION FIELD_POSITION'+
      ' FROM RDB$INDICES  '+
      '   INNER JOIN RDB$INDEX_SEGMENTS ON '+
      '          (RDB$INDICES.RDB$INDEX_NAME =  '+
      '              RDB$INDEX_SEGMENTS.RDB$INDEX_NAME)'+
      ' WHERE ( NOT (RDB$INDICES.RDB$INDEX_NAME STARTING WITH ''RDB$'') '+
      '      and (RDB$INDICES.RDB$RELATION_NAME = '''+TableName+''''+' ) )' +
      ' ORDER BY RDB$INDICES.RDB$INDEX_NAME, '+
      '         RDB$INDEX_SEGMENTS.RDB$FIELD_POSITION  ';

      result := CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
end;
//******************************************************************************
function GetAllTables( ConnectToDB, Login, Password :String ):TIBQuery;
var SQL:string;
begin
  SQL := ' SELECT RDB$RELATIONS.RDB$DESCRIPTION DESCRIPT, '+
         ' RDB$RELATIONS.RDB$VIEW_SOURCE VIEW_SOURCE, '+
         ' RDB$RELATIONS.RDB$RELATION_NAME TABLE_NAME,'+
         ' RDB$RELATIONS.RDB$FIELD_ID FIELD_ID, '+
         ' RDB$RELATIONS.RDB$OWNER_NAME OWNER_NAME'+
  ' FROM RDB$RELATIONS  '+
  ' WHERE (RDB$RELATIONS.RDB$SYSTEM_FLAG = 0)  and '+
  '     (RDB$RELATIONS.RDB$VIEW_SOURCE IS NULL ) '+
  ' ORDER BY RDB$RELATIONS.RDB$RELATION_NAME';

  result := CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
end;
//******************************************************************************
function GetDescriptForTable(ConnectToDB, Login, Password,TableName :String):String;
var SQL:string;
    DB:TIBQuery;
begin
  SQL := ' SELECT RDB$RELATIONS.RDB$DESCRIPTION DESCRIPT, '+
         ' RDB$RELATIONS.RDB$VIEW_SOURCE VIEW_SOURCE, '+
         ' RDB$RELATIONS.RDB$RELATION_NAME TABLE_NAME,'+
         ' RDB$RELATIONS.RDB$FIELD_ID FIELD_ID, '+
         ' RDB$RELATIONS.RDB$OWNER_NAME OWNER_NAME'+
  ' FROM RDB$RELATIONS  '+
  ' WHERE (RDB$RELATIONS.RDB$SYSTEM_FLAG = 0)  and '+
  '     (RDB$RELATIONS.RDB$VIEW_SOURCE IS NULL ) and lower( RDB$RELATIONS.RDB$RELATION_NAME ) = '+#39+LowerCase( TableName )+#39;

  DB := CreateDataSet( ConnectToDB, Login, Password, nil, SQL );
  try
    result := Utf8ToAnsi (  Trim( DB.fieldByName('DESCRIPT').asSTring ) );

  finally
    DestroyDS( DB );
  end;

end;
//******************************************************************************
procedure GetParamDatabaseIB( Database:TIBDatabase; var PathDB, UID, Password:String );
begin
 if Database<>nil then
  begin
    PathDB := Database.DatabaseName;
    UID := Database.Params.Values['user_name'];
    Password := Database.Params.Values['password'];
  end;
end;
//******************************************************************************
procedure GetSelfFieldsForTable(PathDB, UID, Password:String; aTableName,aFieldKod:String; var aListSelfField:TStringList );
var i:Integer;
    IbFieldQuery:TIBQuery;
begin
  IbFieldQuery := CreateDataSet( PathDB, UID, Password, nil, 'select * from '+aTableName +' where '+aFieldKod+' is null');
  try
   for i:=0 to IbFieldQuery.Fields.Count-1 do
     aListSelfField.Add( IbFieldQuery.Fields[i].FieldName );

  finally
    DestroyDS(IbFieldQuery);
  end;
end;
//******************************************************************************
function CreateDataSetBDE( ConnectToDB, Login, Password:String; SQL:String=''; Active:Boolean=True ):TQuery;
var BDEDB: TDatabase;
begin
  BDEDB := TDatabase.Create(nil);

  BDEDB.LoginPrompt  := False;
  BDEDB.DriverName   :='INTRBASE';
  BDEDB.Params.Values['SERVER NAME']:= ConnectToDB;
  BDEDB.Params.Values['user name'] := Login;
  BDEDB.Params.Values['password']  := Password;
  BDEDB.DatabaseName := 'virt';
  BDEDB.Connected:=True;

  result := TQuery.Create(nil);
  result.SQL.Text := SQL;
  result.DatabaseName := BDEDB.DatabaseName;
  result.Active := Active;
end;
//******************************************************************************
procedure DestroyDataSetBDE( DB:TQuery );
begin
  //DB.Database.Connected:=False;
  DB.Database.Free;
  DB.Destroy;
end;
//******************************************************************************
function  GetValueDB( ConnectToDB, Login, Password:String; SQL:Widestring ):Variant;
var DB:TIBQuery;
begin
  try
    DB := CreateDataSet( ConnectToDB, Login, Password, nil, SQL);
    Result := DB.Fields[0].value;
  finally
    DestroyDS( DB );
  end;
end;
//******************************************************************************
function GetCounrRecordDB( ConnectToDB, Login, Password:String; SQL:Widestring ):Integer;
var val:Integer;
begin
  val := GetValueDB( ConnectToDB, Login, Password, SQL );
  if val <> null then result := val;
end;
//******************************************************************************
function ConsoleAddUser(GSecPath, DatabaseSecurityPath, Login, Password:String; NewUserLogin,NewPassword:string;NewFName:string='';NewLName:string=''):Integer;
var StrCmd:string;
    rc:Cardinal;
    ResStr:string;
begin
  StrCmd := '"'+GSecPath+'" -user '+Login+' -password '+Password+' -database'+' "'+DatabaseSecurityPath+'" '+
            '-add '+NewUserLogin+' -pw '+NewPassword+' -fname '+NewFName+' -lname '+NewLName;

  ResStr:= GetDosOutput( StrCmd, CheckLastSleshOnPath(MyGetModulePath,True), rc );
  if ResStr = '' then result :=0  // no error
  else if AnsiPos('duplicate value',ResStr)<>0 then result := 1    // Dublicate User
  else if AnsiPos('Invalid user name',ResStr)<>0 then result := 2 // Invalid user name
  else if AnsiPos('maximum 8 significant',ResStr)<>0 then result := 3 // Invalid password max 8 characters
  else if AnsiPos('invalid parameter',ResStr)<>0 then result := 4   // Invalid parameters
  else result :=-1 // Uncknown Error
end;
//******************************************************************************
function CreateDataSet( DB:TDatabase; SQL:String=''; Active:Boolean=True ):TQuery;
begin
   if DB.Connected then
   begin
     result := TQuery.Create(nil);
     
     result.DatabaseName := DB.DatabaseName;
     if SQL<>'' then
     begin
      result.SQL.Text := SQL;
      result.Active := Active;
     end;
   end
    else
    begin
      DB.Free;
      result:=nil;
    end;
end;
//******************************************************************************
end.
