unit UnitDM_WebSynchrStructTable;

interface

uses
  SysUtils, Classes,Core, DB, IBDatabase, IBCustomDataSet, IBQuery,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,Forms,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, Variants,
  UnitStructrureWebSoap,ComCtrls,Windows, DBClient , UnitProc,Math,
  cxCheckBox, cxTL, cxGridBandedTableView, cxGridCardView, cxTextEdit,UnitIBQuery,
  cxBlobEdit, DBTables, cxButtonEdit,OptSet,TourMbplIf,FrmProgress,UnitFunctWebSoap;

type

  TDM = class(TDataModule)
    SHEMA_WEB_SYNCHRONIZE: TIBQuery;
    DS_SHEMA_WEB_SYNCHRONIZE: TDataSource;
    IBDatabase: TIBDatabase;
    cxGridViewRepository: TcxGridViewRepository;
    ViewShemaSynchronizeTable: TcxGridDBTableView;
    IBTransaction: TIBTransaction;
    SHEMA_WEB_SYNCHRONIZEID: TIntegerField;
    SHEMA_WEB_SYNCHRONIZETABLENAME: TIBStringField;
    SHEMA_WEB_SYNCHRONIZESYNCHR_CONSTRAINT: TIntegerField;
    SHEMA_WEB_SYNCHRONIZEENABLED: TIntegerField;
    ViewShemaSynchronizeTableID: TcxGridDBColumn;
    ViewShemaSynchronizeTableTABLENAME: TcxGridDBColumn;
    ViewShemaSynchronizeTableSYNCHR_CONSTRAINT: TcxGridDBColumn;
    ViewShemaSynchronizeTableENABLED: TcxGridDBColumn;
    LSheet: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    cxStyle213: TcxStyle;
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    cxStyle216: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    SHEMA_WEB_SYNCHRONIZEORDER: TIntegerField;
    ViewShemaSynchronizeTableORDER: TcxGridDBColumn;
    SHEMA_WEB_SYNCHRONIZESQL_UPDATE: TBlobField;
    ViewShemaSynchronizeTableSQL_UPDATE: TcxGridDBColumn;
    MERGESOAPWEB: TIBQuery;
    MERGESOAPWEBDS: TDataSource;
    TMUser: TIBQuery;
    TMUserTMUSERID: TIntegerField;
    TMUserTMFULLNAME: TIBStringField;
    TMUserDS: TDataSource;
    SHEMA_WEB_SYNCHR_FILES: TIBQuery;
    DS_SHEMA_WEB_SYNCHR_FILES: TDataSource;
    SHEMA_WEB_SYNCHR_FILESID: TIntegerField;
    SHEMA_WEB_SYNCHR_FILESAORDER: TIntegerField;
    SHEMA_WEB_SYNCHR_FILESPATHFILES: TIBStringField;
    SHEMA_WEB_SYNCHR_FILESENABLED: TIntegerField;
    ViewShemaSynchronizeFilePath: TcxGridDBTableView;
    ViewShemaSynchronizeFilePathID: TcxGridDBColumn;
    ViewShemaSynchronizeFilePathAORDER: TcxGridDBColumn;
    ViewShemaSynchronizeFilePathPATHFILES: TcxGridDBColumn;
    ViewShemaSynchronizeFilePathENABLED: TcxGridDBColumn;
    SHEMA_WEB_SYNCHR_FILESAMASK: TIBStringField;
    ViewShemaSynchronizeFilePathAMASK: TcxGridDBColumn;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure ViewShemaSynchronizeTableDblClick(Sender: TObject);
    procedure ViewShemaSynchronizeTableKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure SHEMA_WEB_SYNCHRONIZEAfterInsert(DataSet: TDataSet);
    procedure ViewShemaSynchronizeFilePathPATHFILESPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ViewShemaSynchronizeFilePathDblClick(Sender: TObject);
  private


    procedure InitElements;
    function  FMakeSQLForSlect(  TableName,SQL:String; StartRow:Integer=0; EndRow:Integer=0 ):String;
    function  FGetCurrFilePath( RecIndex:Integer ):TCurrFilePath;
    function  FGetCurrentElement( RecIndex:Integer; DBParam : TConnectDBParam; StartRow:Integer=0; EndRow:Integer=0; DBActive:Boolean=True ):TDBShema;
    procedure FSynchronizeCurrentElementData(RecIndex:Integer; DBParam : TConnectDBParam  );

    procedure FSynchronizeCurrentPathFiles( RecIndex:Integer );
    function  FValidateFocusedRec:Boolean;
    function  FGetCountRecordCurrElem( i:integer; DBParam : TConnectDBParam ):Integer;
    { Private declarations }
  public
     procedure SynchronizeElements;
     procedure SynchronizeCurrentElement;

     procedure SynchronizeCurrentElementData;
     function  CreateCurrElementFormView( RecIndex:Integer; DBParam : TConnectDBParam ):TStructureSynchronizeSoapWeb;
     procedure SynchronizeAllElementData;
     procedure SynchronizeAllElementPathFiles;
     procedure SynchronizeAllElementDataByXML;
     procedure DBSaveCurrentElementToXML( ElemFunctCallSoapWeb:TFunctCallSoapWeb; i:Integer; Path:String; DBParam : TConnectDBParam;LimitRec:Integer=0  );
     procedure SynchronizeLoadAllTables;
    { Public declarations }
  end;

var
  DM: TDM;
  Elem_TMUSer : TDBShema;
  Elem_ShemaWebSynchronize :TDBShemaView;
  Elem_ShemaWebSynchronizeFiles:TDBShemaView;

  Elem_MERGESOAPWEB : TDBShemaSynchronize;
implementation
uses Dialogs, cxGridDBDataDefinitions;

{$R *.dfm}


procedure TDM.InitElements;
var LogFieldNames : TLogFields;
begin
  Elem_TMUSer := TDBShema.Create( TMUser, 'TMUSERS', 'TMUSERID' );
  Elem_TMUSer.DBOpen;

  LogFieldNames.FieldID              := 'ID';
  LogFieldNames.FieldApplicationName := 'APLICATION';
  LogFieldNames.FieldIconApplication := 'APPLICATIONICON';
  LogFieldNames.FieldTitleElem       := 'TITLE';
  LogFieldNames.FieldTableName       := 'TABLENAME';
  LogFieldNames.FieldKeyFieldId      := 'KEYFIELDID';
  LogFieldNames.FieldIDObject        := 'OBJID';
  LogFieldNames.FieldIDUser          := 'USERID';
  LogFieldNames.FieldAction          := 'TYPEACTION';
  LogFieldNames.FieldDATE            := 'ADATE';
  LogFieldNames.FieldDATA            := 'ADATA';
  LogFieldNames.FieldFormName        := 'FORMNAME';
  LogFieldNames.FieldFormCaption     := 'FORMCAPTION';
  //*********************************

  IBDatabase.Connected :=true;
  Elem_ShemaWebSynchronize := TDBShemaView.Create( SHEMA_WEB_SYNCHRONIZE, ViewShemaSynchronizeTable, 'SHEMA_WEB_SYNCHRONIZE', 'ID', 'gen_shema_web_synchronize_id', 'AORDER' );
  Elem_ShemaWebSynchronize.UpdateForm := true;
  Elem_ShemaWebSynchronize.SetDefaultValue( ['SYNCHR_CONSTRAINT','ENABLED'], [ 1, 1 ] );
  Elem_ShemaWebSynchronize.SetUniqFieldNames( ['TABLENAME'] );
  Elem_ShemaWebSynchronize.DBOpen;

  Elem_ShemaWebSynchronizeFiles := TDBShemaView.Create( SHEMA_WEB_SYNCHR_FILES, ViewShemaSynchronizeFilePath, 'SHEMA_WEB_SYNCHR_FILES', 'ID', 'gen_shema_web_synchr_files_id', 'AORDER' );
  Elem_ShemaWebSynchronizeFiles.UpdateForm := true;
  Elem_ShemaWebSynchronizeFiles.SetDefaultValue( ['ENABLED'], [ 1 ] );
  Elem_ShemaWebSynchronizeFiles.SetUniqFieldNames( ['PATHFILES'] );
  Elem_ShemaWebSynchronizeFiles.DBOpen;

  Elem_MERGESOAPWEB := TDBShemaSynchronize.Create( MERGESOAPWEB, nil, 'MERGESOAPWEB', 'ID','gen_mergesoapweb_id' );
  Elem_MERGESOAPWEB.SetTitle('Журнал веб. синхронізацій');
  Elem_MERGESOAPWEB.SetUserElem(Elem_TMUSer, 'TMFULLNAME');
  Elem_MERGESOAPWEB.SetLogTable('LOG_ADD',  LogFieldNames ,cxStyle216);
  Elem_MERGESOAPWEB.SetFieldColumnShowMainImage('TABLENAME');
  Elem_MERGESOAPWEB.DBOpen;
  //***************************************************************************
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FreeAllElements;
  IBDatabase.Connected :=false;
  OptionSet.Free;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var aProgres:TProgressFormProp;
begin
  Application.ProcessMessages;
  //TourMan DB
  //PrepareConnectDatabeseTourManTest( IBDatabase, True );
  PrepareConnectDatabeseTourManWork(IBDatabase,True);

  OptionSet := TOptionSet.Create;
  InitElements;
end;

procedure TDM.ViewShemaSynchronizeTableDblClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronize.DB.Edit;
end;

function TDM.CreateCurrElementFormView( RecIndex:Integer; DBParam : TConnectDBParam ):TStructureSynchronizeSoapWeb;
var IndexColTableName:Integer;
    IndexColEnConstraint:Integer;
    IndexColEnabled:Integer;
    CurrTableName:Variant;
    CurrEnConstraint:Variant;
    CurrEnabled:Variant;
    CanConstrSynchronize:Boolean;
begin
  result := nil;

  IndexColTableName := Elem_ShemaWebSynchronize.View.GetColumnByFieldName('TABLENAME').Index;
  IndexColEnConstraint := Elem_ShemaWebSynchronize.View.GetColumnByFieldName('SYNCHR_CONSTRAINT').Index;
  IndexColEnabled := Elem_ShemaWebSynchronize.View.GetColumnByFieldName('ENABLED').Index;

  CurrTableName := Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColTableName];
  CurrEnConstraint :=Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColEnConstraint];
  CurrEnabled :=Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColEnabled];

  if ( CurrEnConstraint <> null) and ( CurrEnConstraint = 1 ) then
    CanConstrSynchronize := true
  else
    CanConstrSynchronize := false;

  if (CurrTableName<>null)and(CurrEnabled<>null)and(CurrEnabled= 1 ) then
    result:=  TStructureSynchronizeSoapWeb.Create( UpperCase(CurrTableName), DBParam, CanConstrSynchronize );
end;

procedure TDM.SynchronizeElements;
var i:integer;
    DBParam : TConnectDBParam;
    PathDB, UID, Password : String;
    Progres : TProgressFormProp;
begin
  GetParamDatabaseIB( IBDatabase, PathDB, UID, Password );

  DBParam.PathDB := PathDB;
  DBParam.UID := UID;
  DBParam.Password := Password;

  try
   Progres := ShowProgress('Синхронізація структури', Elem_ShemaWebSynchronize.View.DataController.RecordCount);
   Progres.ProgressCaption.Caption :='Підготовка';

   for i:=0 to Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecordCount -1 do
     CreateCurrElementFormView( i, DBParam );

   Progres.ProgressCaption.Caption :='таблиць';
   Progres.ProgressCaption.Repaint;
   SynchroniceWebSoapAll ( true, Progres.ProgressBar );

   Progres.ProgressCaption.Caption :='ключів';
   Progres.ProgressCaption.Repaint;
   SynchroniceConstraintTableWebSoapAll ( true, Progres.ProgressBar );

   Progres.ProgressCaption.Caption :='Індексів';
   Progres.ProgressCaption.Repaint;
   SynchroniceIndexesTableWebSoapAll ( True, Progres.ProgressBar );

  finally
    CloseAllSynchronizeElements;
    ClosedProgress(Progres.FormProgres);
  end;
end;

function TDM.FValidateFocusedRec:Boolean;
begin
  result := true;
  if Elem_ShemaWebSynchronize.View.DataController.Controller.FocusedRecord.Index =-1 then
  begin
    result := false;
    MyShowMessageDlg('Не вибрано жодної таблиці', mtError, but_OK );
    exit;
  end;
end;

procedure TDM.SynchronizeCurrentElement;
var DBParam : TConnectDBParam;
    PathDB, UID, Password : String;
    Progres : TProgressFormProp;
    StrSynhrWeb : TStructureSynchronizeSoapWeb;
begin
  if not FValidateFocusedRec then exit;
  
  GetParamDatabaseIB( IBDatabase, PathDB, UID, Password );

  DBParam.PathDB := PathDB;
  DBParam.UID := UID;
  DBParam.Password := Password;

  try
    StrSynhrWeb := CreateCurrElementFormView( 0, DBParam );
    StrSynhrWeb.SynchroniceWebSoap( true, true );
    StrSynhrWeb.SynchroniceConstraintWebSoap( true, true );
    
  finally
    StrSynhrWeb.Close;
  end;
end;

function TDM.FMakeSQLForSlect( TableName,SQL:String; StartRow:Integer=0; EndRow:Integer=0 ):String;
var LimitSql:Widestring;
begin

  if StartRow=0 then LimitSql :=''
  else LimitSql := ' FIRST '+IntToStr(StartRow)+' SKIP '+IntToStr(EndRow);
  if SQL='' then SQL :='select * from '+ TableName;

  result := StringReplace(SQL, ' * ', LimitSql+' * ' , []);
  //result := 'select '+LimitSql+' * from '+ TableName;
end;

function TDM.FGetCurrentElement( RecIndex:Integer; DBParam : TConnectDBParam; StartRow:Integer=0; EndRow:Integer=0; DBActive:Boolean=True ):TDBShema;
var IndexColTableName:Integer;
    IndexColEnabled:Integer;
    IndexColSQL:Integer;
    CurrTableName:Variant;
    CurrEnConstraint:Variant;
    CurrEnabled:Variant;
    CurrSqlUpdate:Variant;
    CanConstrSynchronize:Boolean;
    StructWebSynhr: TStructureSynchronizeSoapWeb;
    DB: TIBQuery;
    CurrSql :String;
begin
  result := nil;

  IndexColTableName := Elem_ShemaWebSynchronize.View.GetColumnByFieldName('TABLENAME').Index;
  IndexColEnabled := Elem_ShemaWebSynchronize.View.GetColumnByFieldName('ENABLED').Index;
  IndexColSQL     := Elem_ShemaWebSynchronize.View.GetColumnByFieldName('SQL_UPDATE').Index;

  CurrTableName := Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColTableName];
  CurrEnabled   := Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColEnabled];
  CurrSqlUpdate := Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColSQL];
  if (CurrTableName<>null)and(CurrEnabled<>null)and(CurrEnabled= 1 ) then
  begin
    if CurrSqlUpdate <> null then CurrSql :=  FMakeSQLForSlect( CurrTableName,CurrSqlUpdate, StartRow, EndRow )
    else CurrSql := FMakeSQLForSlect( CurrTableName,'', StartRow, EndRow );

    DB := CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, CurrSql, DBActive );

    StructWebSynhr:=  TStructureSynchronizeSoapWeb.Create( CurrTableName, DBParam, CanConstrSynchronize  );
    result := TDBShema.Create( DB, CurrTableName, StructWebSynhr.FieldKod );
  end;
end;

function TDM.FGetCurrFilePath( RecIndex:Integer ):TCurrFilePath;
var IndexColPathFile:Integer;
    IndexColEnabled:Integer;
    IndexColMask :Integer;
    CurrValue:Variant;
begin
  IndexColPathFile := Elem_ShemaWebSynchronizeFiles.View.GetColumnByFieldName('PATHFILES').Index;
  IndexColEnabled := Elem_ShemaWebSynchronizeFiles.View.GetColumnByFieldName('ENABLED').Index;
  IndexColMask := Elem_ShemaWebSynchronizeFiles.View.GetColumnByFieldName('AMASK').Index;

  if Elem_ShemaWebSynchronizeFiles.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColEnabled] = 1 then
  begin
    result.FilePath := Elem_ShemaWebSynchronizeFiles.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColPathFile];
    result.mask := VarToStr( Elem_ShemaWebSynchronizeFiles.View.DataController.Controller.SelectedRecords[RecIndex].Values[IndexColMask] );
  end
  else
  begin
    result.FilePath := '';
    result.mask := '';
  end;
end;


procedure TDM.FSynchronizeCurrentElementData( RecIndex:Integer; DBParam : TConnectDBParam );
var CanConstrSynchronize:Boolean;
    StructWebSynhr: TStructureSynchronizeSoapWeb;
    DB: TIBQuery;
    CurrSql :String;
    ElemShema:TDBShema;
    Progres:TProgressFormProp;
begin
  begin
    try
      ElemShema := FGetCurrentElement( RecIndex, DBParam );
      StructWebSynhr:=  TStructureSynchronizeSoapWeb.Create( ElemShema.TableName, DBParam, CanConstrSynchronize );
      DB := TIBQuery( ElemShema.DB );

      ElemShema.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
      ElemShema.SetWebSynchronizeElem( Elem_MERGESOAPWEB, [], '', True );

      Progres := ShowProgress( DefCaptionSynchronizeWeb , ElemShema.DBRecordCount );
      ElemShema.WebSynchronizeDB( Progres, false,false);

    finally
      ClosedProgress( Progres.FormProgres );
      ElemShema.Close;
      DestroyDS( DB );
      StructWebSynhr.Close;
    end;
  end;
end;

procedure TDM.SynchronizeAllElementData;
var i:integer;
    DBParam : TConnectDBParam;
    PathDB, UID, Password : String;
begin
  GetParamDatabaseIB( IBDatabase, PathDB, UID, Password );

  DBParam.PathDB := PathDB;
  DBParam.UID    := UID;
  DBParam.Password := Password;

  for i:=0 to Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecordCount - 1 do
    FSynchronizeCurrentElementData( i, DBParam );
end;

procedure TDM.FSynchronizeCurrentPathFiles( RecIndex:Integer );
var i:Integer;
    CurrFilePath:TCurrFilePath;
    CurrMask:string;
    ListDir:TStringList;
    FilePathSynchronizeSoapWeb : TFilePathSynchronizeSoapWeb;
begin
  CurrFilePath := FGetCurrFilePath( RecIndex );
  if CurrFilePath.FilePath <> '' then
  begin
    try
      FilePathSynchronizeSoapWeb := TFilePathSynchronizeSoapWeb.Create;
      FilePathSynchronizeSoapWeb.SyncronizeFilePath( CurrFilePath, OptionSet.StoreFolder );
    finally
      FilePathSynchronizeSoapWeb.Close;
    end;
  end;
end;
//******************************************************************************
procedure TDM.SynchronizeAllElementPathFiles;
var i:integer;
begin
  for i:=0 to Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecordCount - 1 do
    FSynchronizeCurrentPathFiles( i );
end;
//******************************************************************************
procedure TDM.SynchronizeLoadAllTables;
var ConParam : TConnectDBParam;
    DB : TIBQuery;
    CurrTableName : WideString;
    Progres:TProgressFormProp;
begin
  ConParam := Elem_ShemaWebSynchronize.DBGetParamConnect;
  DB := GetAllTables( ConParam.PathDB, ConParam.UID, ConParam.Password );
  DB.FetchAll;
  
  try
   Elem_ShemaWebSynchronize.UpdateForm :=False;
   Elem_ShemaWebSynchronize.View.DataController.GotoLast;
   Progres := ShowProgress( WaitFormCaption , DB.RecordCount );

   while not DB.Eof do
   begin
     CurrTableName := Trim( DB.FieldByName('TABLE_NAME').AsString );

     if not Elem_ShemaWebSynchronize.DB.Locate( 'TABLENAME', CurrTableName, [] ) then
     begin
       Elem_ShemaWebSynchronize.DB.Append;
       if Elem_ShemaWebSynchronize.DB.State = dsBrowse then
         Elem_ShemaWebSynchronize.DB.Edit;

       Elem_ShemaWebSynchronize.DB.FieldByName('TABLENAME').AsString := CurrTableName;
       Elem_ShemaWebSynchronize.DB.Post;
     end;
     Progres.ProgressBar.Position := Progres.ProgressBar.Position + 1;
     DB.Next;
   end;
  finally
    Elem_ShemaWebSynchronize.UpdateForm :=True;
    ClosedProgress( Progres.FormProgres );
  end;
end;
//******************************************************************************
function TDM.FGetCountRecordCurrElem( i:integer; DBParam:TConnectDBParam ):Integer;
var SQL :WideString;
    ElemShema:TDBShema;
begin
  try
    ElemShema := FGetCurrentElement( i, DBParam, 0, 0, False  );

    SQL := ElemShema.MainSQL;
    ReplaseON(SQL,' * ',' count(*) ');

    result := GetCounrRecordDB( DBParam.PathDB, DBParam.UID, DBParam.Password, SQL );

  finally
    ElemShema.Close;
  end;
end;
//******************************************************************************
procedure TDM.DBSaveCurrentElementToXML( ElemFunctCallSoapWeb:TFunctCallSoapWeb; i:Integer; Path:String; DBParam : TConnectDBParam; LimitRec:Integer=0 );
var ElemShema:TDBShema;
    StartRow:Integer;
    EndRow:Integer;
    DBEmpty:Boolean;
    IndexFile:Integer;
    BDEDB:TQuery;
    FileTempSave:Widestring;
    Progres:TProgressFormProp;
    res : Integer;
    MaxRec:Integer;
    CountAll:Integer;
begin
  DBEmpty := False;
  StartRow := LimitRec;
  EndRow   := 0;
  IndexFile:= 0;
  CountAll := 0;
  try
    //**********************************************************
    MaxRec := FGetCountRecordCurrElem( i, DBParam );

    Progres := ShowProgress( DefCaptionSynchronizeWeb , ceil( MaxRec / LimitRec ) );
    While not DBEmpty do
    begin
      try

        ElemShema := FGetCurrentElement( i, DBParam, StartRow, EndRow, False  );
        Progres.ProgressCaption.Caption :=DefCaptionSynchronizeWeb+' ('+ElemShema.TableName+')';

        FileTempSave := CheckLastSleshOnPath( Path, True) + ElemShema.TableName+'_'+AddNolForLengthNumber( IntToStr(IndexFile),4 )+'.xml';
        BDEDB := CreateDataSetBDE( DBParam.PathDB, DBParam.UID, DBParam.Password, ElemShema.MainSQL );

        if not BDEDB.IsEmpty  then
        begin
          DataSetToXML( BDEDB, FileTempSave, dfXMLUTF8 );

          res := ElemFunctCallSoapWeb.SynchronizeDBXMLFile( ElemShema.TableName, FileTempSave, True );
          if res <> 0 then Break;
        end;

        DBEmpty := BDEDB.IsEmpty;
        CountAll := CountAll + BDEDB.RecordCount;//ElemShema.DBRecordCount;

      finally
        DestroyDataSetBDE( BDEDB );
        ElemShema.Close;
      end;

      Progres.ProgressBar.Position := Progres.ProgressBar.Position +1;
      Progres.ProgressCaption.Repaint;

      EndRow := EndRow + LimitRec;
      Inc( IndexFile );
    end;
  finally
    //ShowMessage( IntToStr( CountAll ) );
    ClosedProgress( Progres.FormProgres );
  end;
end;

procedure TDM.SynchronizeAllElementDataByXML;
var i:integer;
    PathDB, UID, Password : String;
    Progres : TProgressFormProp;
    PathTemp:string;
    DBParam : TConnectDBParam;
    ElemFunctCallSoapWeb:TFunctCallSoapWeb;
begin
  GetParamDatabaseIB( IBDatabase, PathDB, UID, Password );

  DBParam.PathDB := PathDB;
  DBParam.UID    := UID;
  DBParam.Password := Password;
  ElemFunctCallSoapWeb:= TFunctCallSoapWeb.Create( Self, DBParam ) ;

  PathTemp := ExtractFilePath(Application.ExeName)+'~TempData\';
  ExistsDir( PathTemp );

  try
    for i:=0 to Elem_ShemaWebSynchronize.View.DataController.Controller.SelectedRecordCount - 1 do
      DBSaveCurrentElementToXML( ElemFunctCallSoapWeb, i, PathTemp, DBParam , 30000 );

  finally
    DelDir( PathTemp, '*.*' );
    ElemFunctCallSoapWeb.Free;
  end;
end;

procedure TDM.SynchronizeCurrentElementData;
var i:integer;
    DBParam : TConnectDBParam;
    PathDB, UID, Password : String;
    Progres : TProgressFormProp;
begin
  if not FValidateFocusedRec then exit;

  GetParamDatabaseIB( IBDatabase, PathDB, UID, Password );

  DBParam.PathDB := PathDB;
  DBParam.UID    := UID;
  DBParam.Password := Password;

  FSynchronizeCurrentElementData( 0, DBParam );
end;

procedure TDM.ViewShemaSynchronizeTableKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (ssCtrl in Shift  ) and(Key = VK_UP)  then
 begin
   Elem_ShemaWebSynchronize.MoveUpRow;
   abort;
 end;

 if (ssCtrl in Shift  ) and(Key = VK_Down)  then
 begin
   Elem_ShemaWebSynchronize.MoveDownRow;
   abort;
 end;
end;

procedure TDM.SHEMA_WEB_SYNCHRONIZEAfterInsert(DataSet: TDataSet);
begin
  //Elem_ShemaWebSynchronize.DBAddBlobDataString('SQL_UPDATE','SELECT * FROM '+Elem_ShemaWebSynchronize.TableName);
end;

procedure TDM.ViewShemaSynchronizeFilePathPATHFILESPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var CurrPath:Variant;
    SelPath:WideString;
begin
  if ( Elem_ShemaWebSynchronizeFiles.GetVerticalGridFocusValue<>null ) and
     ( Elem_ShemaWebSynchronizeFiles.GetVerticalGridFocusValue<>'') then
    CurrPath := Elem_ShemaWebSynchronizeFiles.GetVerticalGridFocusValue
  else CurrPath := OptionSet.WebSourcePath;
  //*************************************
  SelPath := BrowseForFolder( 'Шлях до папки', CurrPath );
  if SelPath <> '' then
  begin
    SelPath := CheckLastSleshOnPath( SelPath, True );
    Elem_ShemaWebSynchronizeFiles.UpdateVerticalGridFocusValue( Sender, SelPath );
  end;
end;

procedure TDM.ViewShemaSynchronizeFilePathDblClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.DB.Edit;
end;

end.

