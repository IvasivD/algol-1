
unit TourMbplIf;

interface

uses Classes,Dialogs, IBDatabase,OptSet,TourConsts,ADODB,UnitADOQuery,UnitProc,Core;

type TKindDatabase = (optKindDBTourMan,optKindDBOffice);
     TKindConnect = (optKindConnectTest,optKindConnectWork,optKindConnectMySqlWork);

procedure ChangeLogStrings(Strs: TStrings);
procedure TermForm;
function AskBpLgStr: Boolean;
function ParBpLgStr: string;
function GetUsLgPerm(Level, Item: Integer): Integer;
function GetInfoServStr(const Inf: string): string;
function GetInfoServStrN(const Inf: string): string;
function SetInfoServStr(const Inf: string): string;
function SetInfoServStrN(const Inf: string): string;

procedure PrepareConnectDatabeseTourManTest(aDatabase:TIBDatabase;AutoConnect:Boolean=true);overload;
procedure PrepareConnectDatabeseTourManWork(aDatabase:TIBDatabase;AutoConnect:Boolean=true);overload;

procedure PrepareConnectDatabeseTourManTest(aDatabase:TADOConnection;AutoConnect:Boolean=true);overload;
procedure PrepareConnectDatabeseTourManWork(aDatabase:TADOConnection;AutoConnect:Boolean=true);overload;

procedure PrepareConnectDatabeseTourManMySqlWork(aDatabase:TADOConnection;AutoConnect:Boolean=true);overload;

procedure PrepareConnectDatabeseOfficeTest(aDatabase:TIBDatabase;AutoConnect:Boolean=true); overload;
procedure PrepareConnectDatabeseOfficeTest(aDatabase:TADOConnection;AutoConnect:Boolean=true);overload;
procedure PrepareConnectDatabeseOfficeWork(aDatabase:TIBDatabase;AutoConnect:Boolean=true); overload;
procedure PrepareConnectDatabeseOfficeWork(aDatabase:TADOConnection;AutoConnect:Boolean=true);overload;
procedure PrepareConnectDatabeseOfficeMySqlWork(aDatabase:TIBDatabase;AutoConnect:Boolean=true);

procedure PrepareConnectDatabaseByPathAndUserName( aDatabase:TIBDatabase; PathDB,UserName,Password:WideString; AutoConnect:Boolean=true ); overload;
procedure PrepareConnectDatabaseByPathAndUserName( aDatabase:TAdoConnection; PathDB,UserName,Password:WideString; AutoConnect:Boolean=true );  overload;
procedure SynchrConnectDatabaseIBAndAdo( aDatabase:TIBDatabase; aAdoCon:TAdoConnection; AutoConnect:Boolean=true );

function  IsTestDatabaseIB(aDatabase:TIBDatabase):Boolean;

implementation

uses SysUtils, Forms;          

var AppHandle: Cardinal;

const
  LName = 'Tmdbpl.dll';

{$WARN UNSAFE_TYPE OFF}
procedure TermFormL(Handle: Cardinal); external LName name 'TermForm';
function GetBpLgStr: PChar; external LName name 'GetBpLgStr';
function AskBpLgStrL(Handle: Cardinal): Boolean; external LName name 'AskBpLgStr';
function ParBpLgStrL: PChar; external LName name 'ParBpLgStr';
function GetUsLgPerm(Level, Item: Integer): Integer; external LName name 'AskBpLgStr';
{$WARN UNSAFE_TYPE ON}

procedure ChangeLogStrings(Strs: TStrings);
begin
  if Assigned(Strs) and (Strs.Count > 0) then
    //with Strs do Strings[Count - 1] := Strings[Count - 1] + GetBpLgStr;
    with Strs do Strings[Count - 1] := Trim(Strings[Count - 1]) + 'masterkey';

//  ShowMessage(Strs.Text);
end;

function ConnectParamToTestDB:String;
begin
  result :='masterkey';
end;

function ConnectParamToWorkDB:String;
begin
  result :=GetBpLgStr;
end;

procedure FPrepareConnectDatabaseByUserName( aDatabase:TIBDatabase; PathDB,UserName,Password:String; AutoConnect:Boolean=true );overload;
begin
   aDatabase.Connected:=false;

   aDatabase.LoginPrompt := False;

   aDatabase.DatabaseName := PathDB;
   aDatabase.Params.Values['password']:=  Password ;
   aDatabase.Params.Values['user_name']:= UserName;

   aDatabase.Connected := AutoConnect;
end;

procedure FPrepareConnectDatabaseByUserName( aDatabase:TADOConnection; PathDB,UserName,Password:String; AutoConnect:Boolean=true );overload;
begin
   aDatabase.Connected:=false;
   aDatabase.LoginPrompt := False;
   if AnsiPos('.GDB',PathDB)<>0 then aDatabase.ConnectionString := CreateConnectionString(PathDB, UserName, Password)
   else
   begin
     if GetTypeConnectionADOStr( PathDB ) = optTypeConADO then
     begin
       aDatabase.ConnectionString := PathDB;
       aDatabase.DefaultDatabase := 'algol';
     end;
     //****************
     if GetTypeConnectionADOStr( PathDB ) = optTypeConIB then
       aDatabase.ConnectionString := CreateConnectionString(PathDB, UserName, Password);
   end;
   //aDatabase.ConnectionString := CreateConnectionString(PathDB, UserName, Password);
   {if GetTypeConnectionADO( aDatabase ) = optTypeConADO then
   begin
     aDatabase.ConnectionString := CreateConnectionStringMySQL('algol', 'USERALGOL', 'HonzOKey' );
     aDatabase.DefaultDatabase := 'algol';
   end else  aDatabase.ConnectionString := CreateConnectionString(PathDB, UserName, Password); }

   aDatabase.Connected:=AutoConnect;
end;

procedure FGetParamConnect( TypeDB:TKindDatabase; TypeConnect:TKindConnect;var PathDB, Password:String );
var aOptionSet : TOptionSet;
begin
  try
    aOptionSet := TOptionSet.Create;
    if TypeDB = optKindDBTourMan then PathDB := aOptionSet.DatabaseFolder;
    if TypeDB = optKindDBOffice then PathDB := aOptionSet.DatabaseOffcFolder;

    if TypeConnect = optKindConnectTest then Password := ConnectParamToTestDB;
    if TypeConnect = optKindConnectWork then Password := ConnectParamToWorkDB;
    if TypeConnect = optKindConnectMySqlWork then
    begin
      Password := ConnectParamToWorkDB;
      PathDB := CreateConnectionStringMySQL('algol', 'USERALGOL', Password );
    end;

  finally
     FreeAndNil(aOptionSet);
  end;
end;

procedure FPrepareConnectDatabase( aDatabase:TIBDatabase; TypeDB:TKindDatabase; TypeConnect:TKindConnect; AutoConnect:Boolean=true );overload;
var PathDB : String;
    UserName : String;
    Password : String;
begin
   aDatabase.Connected := False;
   UserName :=  aDatabase.Params.Values['user_name'];
   FGetParamConnect( TypeDB, TypeConnect,PathDB, Password );

   FPrepareConnectDatabaseByUserName( aDatabase, PathDB, UserName,Password, AutoConnect );
end;

procedure FPrepareConnectDatabase( aDatabase:TADOConnection; TypeDB:TKindDatabase; TypeConnect:TKindConnect; AutoConnect:Boolean=true );overload;
var PathDB : String;
    UserName : String;
    Password : String;
begin
  // UserName :=  aDatabase.Params.Values['user_name'];
  { if TypeConnect = optKindConnectMySqlWork then
  begin
   aDatabase.ConnectionString := CreateConnectionStringMySQL('algol', 'USERALGOL', 'HonzOKey' );
   aDatabase.DefaultDatabase := 'algol';
  end;  }

  UserName :=  aDatabase.Properties['User ID'].Value;
  FGetParamConnect( TypeDB, TypeConnect,PathDB, Password );

  FPrepareConnectDatabaseByUserName( aDatabase, PathDB, UserName,Password, AutoConnect );
end;

procedure PrepareConnectDatabeseTourManTest(aDatabase:TIBDatabase;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBTourMan, optKindConnectTest , AutoConnect );
end;

procedure PrepareConnectDatabeseTourManTest(aDatabase:TADOConnection;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBTourMan, optKindConnectTest , AutoConnect );
end;

procedure PrepareConnectDatabeseTourManWork(aDatabase:TIBDatabase;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBTourMan,optKindConnectWork, AutoConnect );
end;

procedure PrepareConnectDatabeseTourManWork(aDatabase:TADOConnection;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBTourMan,optKindConnectWork, AutoConnect );
end;

procedure PrepareConnectDatabeseTourManMySqlWork(aDatabase:TADOConnection;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBTourMan,optKindConnectMySqlWork, AutoConnect );
end;

procedure PrepareConnectDatabeseOfficeTest(aDatabase:TIBDatabase;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBOffice,optKindConnectTest, AutoConnect );
end;

procedure PrepareConnectDatabeseOfficeTest(aDatabase:TADOConnection;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBOffice,optKindConnectTest, AutoConnect );
end;

procedure PrepareConnectDatabeseOfficeWork(aDatabase:TIBDatabase;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBOffice, optKindConnectWork, AutoConnect );
end;

procedure PrepareConnectDatabeseOfficeWork(aDatabase:TADOConnection;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBOffice, optKindConnectWork, AutoConnect );
end;

procedure PrepareConnectDatabeseOfficeMySqlWork(aDatabase:TIBDatabase;AutoConnect:Boolean=true);
begin
  FPrepareConnectDatabase(aDatabase, optKindDBOffice, optKindConnectMySqlWork, AutoConnect );
end;

procedure PrepareConnectDatabaseByPathAndUserName( aDatabase:TIBDatabase; PathDB,UserName,Password:WideString; AutoConnect:Boolean=true );
begin
  FPrepareConnectDatabaseByUserName( aDatabase, PathDB,UserName,Password, AutoConnect );
end;

procedure PrepareConnectDatabaseByPathAndUserName( aDatabase:TAdoConnection; PathDB,UserName,Password:WideString; AutoConnect:Boolean=true );
begin
  FPrepareConnectDatabaseByUserName( aDatabase, PathDB,UserName,Password, AutoConnect );
end;

procedure SynchrConnectDatabaseIBAndAdo( aDatabase:TIBDatabase; aAdoCon:TAdoConnection; AutoConnect:Boolean=true );
begin
  PrepareConnectDatabaseByPathAndUserName( aAdoCon, aDatabase.DatabaseName,aDatabase.Params.Values['user_name'],aDatabase.Params.Values['password'], AutoConnect );
end;

function isTestDatabaseIB(aDatabase:TIBDatabase):Boolean;
begin
  result:= AnsiPos( SPathTestBase, UpperCase(aDatabase.DatabaseName))<>0;
end;

procedure TermForm;
begin
  TermFormL(AppHandle);
end;

function AskBpLgStr: Boolean;
begin
  Result := AskBpLgStrL(AppHandle);
end;

function ParBpLgStr: string;
begin
  Result := ParBpLgStrL;
end;

const
  nMaxInfoService = 23;
  nMaxInfoServic1 = 95;
  nMaxInfoServic2 = 9;
  nMaxInfoServic3 = 19;
  sInfoServNone = '---';

type
  TInfoServiceChar0 = array[0..nMaxInfoService] of Char;
  TInfoServiceChar1 = array[0..nMaxInfoServic1] of Char;
  TInfoServiceChar2 = array[0..nMaxInfoServic2] of Char;
  TInfoServiceChar3 = array[0..nMaxInfoServic3] of Char;

{$WARN UNSAFE_TYPE OFF}
function GetInfoServL(Txt: PChar): TInfoServiceChar0; external LName name 'GetInfoServ';
function SetInfoServL(Txt: PChar): TInfoServiceChar1; external LName name 'SetInfoServ';

function GetInfoServStr(const Inf: string): string;
begin
  Result := GetInfoServL(PChar(Inf));
end;
{$WARN UNSAFE_TYPE ON}

function GetInfoServStrN(const Inf: string): string;
begin
  if Inf = '' then Result := ''
  else begin
    Result :=  GetInfoServStr(Inf);
    if Result = sInfoServNone then Result := '';
  end;
end;

{$O-}
function SetInfoServStr(const Inf: string): string;
var
  Arr: TInfoServiceChar1;
  I: Integer;
begin
{$WARN UNSAFE_TYPE OFF}
  Arr := SetInfoServL(PChar(Inf));
{$WARN UNSAFE_TYPE ON}
  Result := '';
  for I := 0 to nMaxInfoServic1 do Result := Result + Arr[I];
end;
{$O+}

function SetInfoServStrN(const Inf: string): string;
begin
  if Inf = '' then Result := SetInfoServStr(sInfoServNone)
  else Result := SetInfoServStr(Inf);
end;

initialization
  AppHandle := Application.Handle;
end.
