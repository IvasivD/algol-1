unit UnitFunctWebSoap;

interface

uses Windows,
  SysUtils,
  Dialogs,
  Classes,
  SOAPHTTPClient,
  forms,
  iniFiles,
  IBQuery,
  ADODB,
  IBDatabase,
  Math,
  DB,
  SOAPHTTPTrans,
  DateUtils,
  Variants,
  IBUpdateSQL,
  Controls,
  cxStyles,
  UnitProc ,
  IdHTTP,
  frmMergeLogSoap,
  cxGridDBTableView,
  cxGridTableView,
  Buttons,
  cxTL,
  cxDBTL,
  FrmProgress,
  UnitIBQuery,
  UnitWebSoap,
  InvokeRegistry,
  OPConvert,
  Types,
  OptSet,
  UnitADOQuery,
  UnitSqlDB,

  UnitStructrureWebSoap;
const
      SoapUser = '';
      SoapPassword = '';

      CaptionLogMergeSoapWebAdmin = 'Журнал веб. синхронізації ( Адміністратор )';
      CaptionLogMergeSoapWebUser  = 'Журнал веб. синхронізації';
type

 
  TParamConUrl = record
    defWSDL :String;
    defURL  :String;
    defSvc  :String;
    defPrt  :String;
  end;

  TFieldValue = record
     FieldName:WideString;
     Value:WideString;
     Coding:Integer;
     DataType : TFieldType;
  end;
  TFieldValueArr = array of TFieldValue;

  TDatTable = record
    ID: WideString;
    TableName: WideString;
    FieldValues: TFieldValueArr;
  end;
  PDatTableArr = ^TDatTable;

  TDatTableDel = record
    ID: WideString;
    TableName: WideString;
  end;
  PDatTableDel = ^TDatTableDel;

 { TTableConstraint = record
     ConstraintName : WideString;
     TableName : WideString;
     FieldConstraintParentID : WideString;
  end;

  TTableField = record
     IsKey     : Integer;
     FieldName : WideString;
     FieldType : TFieldType;
     FieldSize : Integer;
     Description : WideString;
     Constraints : TTableConstraint;
  end;

  TStructureTable = record
     TableName : String;
     Fields : array of TTableField;
  end;
  PStructureTable = ^TStructureTable; }

  TFunctCallSoapWeb = class
    private
     //FConnectionStr : String;
     //FLoginDB : String;
     //FPasswordDB : String;

     FConnectDBParam : TConnectDBParam;

     FCurrClientId :Integer;
     FElemMergeLog : TObject;
     FTreeLog: TcxDBTreeList;
     FMenId :Integer;
     FWriteLog :Boolean;
     FShowMessageError:Boolean;
     FShowLoadCursor:Boolean;
     FParamConUrl : TParamConUrl;

     function  FFileByteDynArr( FileName:String ):TByteDynArray;
     function  FGetWebPathFile( fileName,RootPath:WideString ):Widestring;
     function  FGetAttacmentFile(fileName,RootPath:WideString):getAttachmentFile;
     Procedure FRefreshDBLog1CAdmin( DB:TDataset; Sql:String='');
     Function  FFirstRunRefresh( DB:TDataset;MenId:Integer;IsAdmin:Boolean;frmMergeSoap1C:TfrmMergeSoap ):Integer;
     function  FRefreshMegeLogAdmin( DB:TDataset; DateIndex,ButTypeSynhronize:Integer):integer;
     Function  FRefreshMegeLogUser( DB:TDataset; MenId , ButTypeSynhronize:Integer):Integer;

     procedure FButSynhronizeAllButClick(Sender: TObject);
     procedure FShowUserSelfMergeLogBut(Sender: TObject);
     procedure FShowUserAllMergeLogBut(Sender: TObject);

     procedure FShowAdminAllMergeLogBut(Sender: TObject);
     procedure FPrepareTreeToView( aFrmMergeSoap : TfrmMergeSoap );
     function  FSynhronizationTree(var Node:TcxTreeListNode; aDBParam:TConnectDBParam; Progres:TProgressFormProp; CheckConnectToServer:Boolean = true; ShowMessageError:Boolean = false ):Integer;
     function  FViewMergeSoapCurrSynhronize( Progres:TProgressFormProp; WriteLog:Boolean=false ):integer;
     function  FSynchronizeFile( fileName,RootPath:Widestring; ShowMessageError:Boolean = false ):Integer;

     function  FGetElemFileXML( TableName, FileXml:Widestring ):importXml;
     function  FSynchronizeDBXMLFile( TableName, FileXml:Widestring; ShowMessageError:Boolean = false ):Integer;
     Function  FSynhronizationDBAndByViewLogMerge( aTree:TcxDBTreeList; MenId:Integer=-1; WriteLog:Boolean=false; ShowMessageError:Boolean = false ):integer;
     procedure FDisposeElemInsert( aElemInsert:InsertData);
     function  FGetElementInsert(PData:PDatTableArr):InsertData;

     procedure FDisposeElemStructureRequest( aCurrElem:structureData );
     procedure FDisposeElemConstraintRequest( CurrElem:ConstraintData );
     procedure FDisposeElemDelete( aElemDelete:DeleteData );
     function  FGetElementDelete(PData:PDatTableDel):deleteData;

     function  FInsertData( PData:PDatTableArr;CheckConnectToServer:Boolean = true; ShowMessageError:Boolean = false  ):Integer;
     function  FDeleteData( PData:PDatTableDel; ShowMessageError:Boolean = false ):Integer;
     function  FSynchronizeStructureTable( PData:PStructureTable; ShowMessageError:Boolean = false ):Integer;
     function  FSynchronizeConstraints( FConstraintsData : TableConstraintArr; ShowMessageError:Boolean = false ):Integer;
     function  FSynchronizeIndexes( FIndexes : TableIndexesArr; ShowMessageError:boolean ):Integer;

     procedure FShowMouseCursorLoad;
     procedure FShowMouseCursorDefault;

     function  FGetElementStructure( PData:PStructureTable ):structureData;
     function  FGetStructDataTable( aData: TStructureTable ):PStructureTable;
     function  FGetStrValueForField(aField:TField):WideString;
     function  FGetRowDataTableArr(DataSet:TDataset;TableName,FieldIdName:String;aFieldsSelfTable:TStringList; FieldForSynch:array of Widestring):PDatTableArr;
     function  FGetRowDataTableDelArr( TableName,FieldIdValue:String ): PDatTableDel;
     function  FGetElementConstraints (aConstraintsData : TableConstraintArr) :ConstraintData;
     function  FGetElementIndexes ( aIndexesData : TableIndexesArr) :createIndex;
     procedure FDisposeElemIndexesRequest(CurrElem:createIndex);
   public
     destructor Close;
     constructor Create( aElemMergeLog : TObject; aConnectDBParam : TConnectDBParam; ShowLoadCursor:Boolean=true );

     function UpdateData(  DataSet:TDataset;TableName,FieldIdName:String; aFieldsSelfTable:TStringList; FieldForSynch:array of Widestring; CheckConnectToServer:Boolean = true; ShowMessageError:Boolean = false  ):Integer;
     function DelData( TableName,FieldIdValue:String; ShowMessageError:Boolean = false ) : Integer;
     function SynchronizeStructureTable( PData:PStructureTable; ShowMessageError:Boolean = false ):Integer;
     function SynchronizeConstraint( FConstraints_FK : TableConstraintArr; ShowMessageError:boolean ):Integer;
     function SynchronizeIndexes( FIndexes : TableIndexesArr; ShowMessageError:boolean ):Integer;
     function SynchronizeFile( fileName,RootPath:Widestring; ShowMessageError:Boolean = false ):Integer;
     function SynchronizeDBXMLFile( TableName, FileXml:Widestring; ShowMessageError:Boolean = false ):Integer;

     function CheckSoapServer:Boolean;
     Function ShowFindMergeSoap1CLog(  MenId:Integer; isAdmin:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false; ShowWhenNotEmpty:Boolean=true ):Integer;
 end;
 function ReadParamConUrl(FileIni:String):TParamConUrl;

implementation
uses Core ;
{ TFunctCallSoapWeb }

constructor TFunctCallSoapWeb.Create( aElemMergeLog : TObject;  aConnectDBParam : TConnectDBParam; ShowLoadCursor: Boolean);
begin
  //self.FConnectionStr := ConnectToDB;
  //self.FLoginDB := Login;
  //self.FPasswordDB := Password;
  self.FConnectDBParam := aConnectDBParam ;

  FElemMergeLog := aElemMergeLog;
  FShowLoadCursor:= ShowLoadCursor;
  self.FParamConUrl := ReadParamConUrl( OptSet.IniFileName );
end;
//******************************************************************************
function GetSqlFieldName(aFielsName:TTableFieldName ; optTypeConn:TOptTypeConnect ):String;
begin
  if aFielsName.FieldName <> '' then
  begin
    if AnsiPos('select ', LowerCase(aFielsName.FieldName) )=0 then
       result:= ' select '+aFielsName.FieldName+' from '+aFielsName.TableName+' where '+aFielsName.FieldId+' = MERGESOAPWEB.OPERATIONID '
    else
       result := aFielsName.FieldName;
  end
   else
    begin
      if optTypeConn = optTypeConIB then result :=  ''''+TDBShema( aFielsName.ElemObj ).Title+''''+' ||'' ''||''(id=''|| MERGESOAPWEB.OPERATIONID ||'')''' ;
      if optTypeConn = optTypeConADO then result :=  'concat( '''+TDBShema( aFielsName.ElemObj ).Title+''''+','' '',''(id='', MERGESOAPWEB.OPERATIONID,'')'')' ;
    end;
end;
//******************************************************************************
function GetSQLMergeSoap(TableFieldName:TTableFieldsNameArr; MenId:Integer=-1;ShowForAllUsers:Boolean=false; TypeShowDate:Integer=-1;optTypeConn:TOptTypeConnect = optTypeConIB  ):String;
var i:integer;
    SqlWhere:String;
    SqlOptMerge:String;
    SqlByDate:string;
    SqlTableName:string;
    CurrTableNameObjectName:string;
begin
 if not ShowForAllUsers then
   SqlWhere :='MENID='+IntToStr(MenId)+''
 else SqlWhere:='';

 if TypeShowDate>=0 then
    SqlByDate := GetSqlForDataIndex('ADATE',TypeShowDate)
    else SqlByDate:= '';

 SqlTableName:= ' CASE ';
 for i:=0 to Length(TableFieldName)-1 do
 begin

   {if TableFieldName[i].FieldName <> '' then
      CurrTableNameObjectName:= '  WHEN (TABLENAME = '''+TableFieldName[i].TableName+''' ) THEN (select '+TableFieldName[i].FieldName+' from '+TableFieldName[i].TableName+' where '+TableFieldName[i].FieldId+' = MERGESOAPWEB.OPERATIONID ) '
   else
     CurrTableNameObjectName:= '  WHEN (TABLENAME = '''+TableFieldName[i].TableName+''' ) THEN ( '+''''+TDBShema(TableFieldName[i].ElemObj).Title+''''+' ||'' ''||''(id=''|| MERGESOAPWEB.OPERATIONID ||'')'' )';

   SqlTableName := SqlTableName + CurrTableNameObjectName; }
   SqlTableName := SqlTableName + '  WHEN (TABLENAME = '''+TableFieldName[i].TableName+''' ) THEN ('+GetSqlFieldName( TableFieldName[i], optTypeConn )+')';

 end;

 if Length(TableFieldName)<>0 then SqlTableName:=SqlTableName+'  ELSE ''UNKNOWN'' '+ ' END as OBJECTNAME , '
 else SqlTableName :='';

 SqlWhere := MyIfThen( (SqlWhere<>'')and(SqlByDate<>''),SqlWhere+' AND ','') + SqlByDate ;

 result:='SELECT MERGESOAPWEB.*, '+
 SqlTableName +
 ' GET_MANAGER(MERGESOAPWEB.menid) USERNAME '+
 ' FROM  MERGESOAPWEB '+MyIfThen(SqlWhere<>'','Where '+SqlWhere,'');// +
 //' order by TABLENAME, ADATE ';

end;
//******************************************************************************
Procedure TFunctCallSoapWeb.FRefreshDBLog1CAdmin( DB:TDataset; Sql:String='');
begin
  //if DB.Active then
  //  DB.Transaction.Commit;
  DB.Close;

  if Sql<>'' then
  begin
    if DB is TIBQuery then TIBQuery(DB).SQL.Text := Sql;
    if DB is TADOQuery then TADOQuery(DB).SQL.Text := Sql;
    if DB is TADODataset then TADODataset(DB).CommandText := Sql;
  end;

  DB.Open;
end;
//******************************************************************************
function TFunctCallSoapWeb.FRefreshMegeLogAdmin(DB:TDataset; DateIndex,ButTypeSynhronize:Integer):integer;
var Sql:string;
    List:TStringList;
begin
 result:= -1;
 if self.FElemMergeLog = nil  then exit;

 Sql:=GetSQLMergeSoap( TDBShemaSynchronize(self.FElemMergeLog ).TableFieldsName, -1 , True, DateIndex,  GetCurrOptConnect(self.FConnectDBParam) );
 List:=TStringList.Create;
 List.Text := Sql;
 List.SaveToFile('D:\MERGEWEBSOAP.txt');
 FRefreshDBLog1CAdmin(DB, Sql);

 Result := ButTypeSynhronize;
end;
//******************************************************************************
Function TFunctCallSoapWeb.FRefreshMegeLogUser(DB:TDataset; MenId , ButTypeSynhronize:Integer):Integer;
var Sql:string;
    ShowForAllUsers:Boolean;
begin
   result:=-1;
   if self.FElemMergeLog = nil  then exit;
   
   ShowForAllUsers:= ButTypeSynhronize = 1;

   Sql := GetSQLMergeSoap( TDBShemaSynchronize(self.FElemMergeLog ).TableFieldsName, MenId, ShowForAllUsers, -1, GetCurrOptConnect(self.FConnectDBParam) );
   FRefreshDBLog1CAdmin( DB, Sql);
   result:= ButTypeSynhronize;
end;
//******************************************************************************
Function TFunctCallSoapWeb.FFirstRunRefresh( DB:TDataset;MenId:Integer;IsAdmin:Boolean;frmMergeSoap1C:TfrmMergeSoap ):Integer;
begin
  if (not IsAdmin) then
    result:= FRefreshMegeLogUser(DB, MenId, 0 )
  else
    result := FRefreshMegeLogAdmin( DB , frmMergeSoap1C.ImComboBoxForDateIndex.ItemIndex , 0);
end;
//******************************************************************************
Function TFunctCallSoapWeb.ShowFindMergeSoap1CLog( MenId:Integer; isAdmin:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false; ShowWhenNotEmpty:Boolean=true ):Integer;
var Res:Integer;
    CurrOPERATIONID:Integer;
    ColIndxOPERATIONID:Integer;
    CurrButTypeSynhronize:Integer;
begin
  try
   Application.CreateForm( TfrmMergeSoap, frmMergeSoap);
   //*****************************************
   CurrButTypeSynhronize := FFirstRunRefresh( (TDBShemaSynchronize(FElemMergeLog).DB) , MenId,isAdmin, frmMergeSoap );
   //*****************************************

   FTreeLog := frmMergeSoap.TreeLogMergeSoapWeb ;
   FMenId   := MenId;
   FWriteLog:= WriteLog;
   FShowMessageError  := ShowMessageError;
   //*****************************************
   if isAdmin then frmMergeSoap.Caption :=  CaptionLogMergeSoapWebAdmin
   else frmMergeSoap.Caption :=  CaptionLogMergeSoapWebUser;

   if self.FElemMergeLog <> nil then
   begin
     frmMergeSoap.DSMergeSoap.DataSet := TDBShemaSynchronize(FElemMergeLog).DB;
     TDBShemaSynchronize(FElemMergeLog).SetTree( FTreeLog );
     frmMergeSoap.PageControlView.ActivePage := frmMergeSoap.TabTree;
     FPrepareTreeToView( frmMergeSoap );
   end;

   frmMergeSoap.PageControlView.HideTabs   := True;

   frmMergeSoap.ButSynhronizeAll.OnClick   := FButSynhronizeAllButClick;
   frmMergeSoap.ButSelfMergeLog.OnClick    := FShowUserSelfMergeLogBut;
   frmMergeSoap.ButAllMergeLog.OnClick     := FShowUserAllMergeLogBut;

   frmMergeSoap.ButShowJustAll.OnClick     := FShowAdminAllMergeLogBut;

   frmMergeSoap.ResreshButDown( isAdmin, CurrButTypeSynhronize );
   frmMergeSoap.ButShowJustAll.Down:=True;

   frmMergeSoap.ButShowJustSynhronize.Visible:=False;
   frmMergeSoap.ButShowJustNotSynhronize.Visible:=False;
   frmMergeSoap.ButShowJustAll.Visible:=False;
   
   //*****************************************
   if ((ShowWhenNotEmpty)and(self.FElemMergeLog <> nil)and(TDBShemaSynchronize(FElemMergeLog).DBRecordCount <> 0)) or(not ShowWhenNotEmpty) then
     frmMergeSoap.ShowModal;
   //*****************************************     
  finally
    // TDBShemaSynchronize(FElemMergeLog).SetDB( nil );
    // TDBShemaSynchronize(FElemMergeLog).SetDB( SaveElemDB );
    if self.FElemMergeLog <> nil then TDBShemaSynchronize(FElemMergeLog).SetTree( nil );
    frmMergeSoap.Free;
  end;
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FPrepareTreeToView( aFrmMergeSoap : TfrmMergeSoap );
begin
   aFrmMergeSoap.DSMergeSoap.DataSet := TDBShemaSynchronize( FElemMergeLog ).DB;
   TDBShemaSynchronize(FElemMergeLog).Tree.FullRefresh;
   TDBShemaSynchronize(FElemMergeLog).TreeGotoFirst;
   TDBShemaSynchronize(FElemMergeLog).TreeColapseAll;
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FButSynhronizeAllButClick(Sender: TObject);
begin
 FSynhronizationDBAndByViewLogMerge( FTreeLog, FMenId,  FWriteLog, FShowMessageError)
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FShowUserSelfMergeLogBut(Sender: TObject);
begin
 FRefreshMegeLogUser( TDBShemaSynchronize(FElemMergeLog).DB , FMenId, 0 );

 TSpeedButton(Sender).Down:=True;
 FPrepareTreeToView( TfrmMergeSoap(TSpeedButton(Sender).Owner) );
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FShowUserAllMergeLogBut(Sender: TObject);
begin
 FRefreshMegeLogUser( TDBShemaSynchronize(FElemMergeLog).DB , FMenId, 1 );
 TSpeedButton(Sender).Down:=True;
 FPrepareTreeToView( TfrmMergeSoap(TSpeedButton(Sender).Owner) );
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FShowAdminAllMergeLogBut(Sender: TObject);
begin
 FRefreshMegeLogAdmin( TDBShemaSynchronize(FElemMergeLog).DB , TfrmMergeSoap(TSpeedButton(Sender).Owner).ImComboBoxForDateIndex.EditValue , 2 );
 TSpeedButton(Sender).Down:=True;
 FPrepareTreeToView( TfrmMergeSoap(TSpeedButton(Sender).Owner) );
end;
//******************************************************************************
Function TFunctCallSoapWeb.FSynhronizationDBAndByViewLogMerge( aTree:TcxDBTreeList; MenId:Integer=-1; WriteLog:Boolean=false; ShowMessageError:Boolean = false ):integer;
var i:integer;
    Res:Integer;
    CurrFocuseItemIndex:Integer;
    TopRowIndex:Integer;
    TopNode:TcxTreeListNode;
    RecContBefore:Integer;
    Progres:TProgressFormProp;
//*******************************************************
begin
  try
    RecContBefore := TDBShemaSynchronize(FElemMergeLog).TreeCountOnTopLevel;
    TDBShemaSynchronize(FElemMergeLog).DBLockCommitedIB;
    Progres:= ShowProgress(DefCaptionSynchronizeWeb ,RecContBefore);
    
    TDBShemaSynchronize(FElemMergeLog).DB.DisableControls;
    TopNode := TDBShemaSynchronize(FElemMergeLog).TreeFocusedTopNode;

    TDBShemaSynchronize(FElemMergeLog).SetFocusedTree( TopNode );
    try
      While ( TopNode <> nil) and ( not TopNode.Deleting ) do
      begin

        Res := FViewMergeSoapCurrSynhronize( Progres, WriteLog );

        if Res = 0 then
          TDBShemaSynchronize(FElemMergeLog).DeleteFocusedNode(False)
        else
        begin
          TopNode:=TopNode.getNextSibling;
          TDBShemaSynchronize(FElemMergeLog).SetFocusedTree( TopNode );
        end;
      
        TopNode:=TDBShemaSynchronize(FElemMergeLog).TreeFocusedTopNode;

        Progres.ProgressBar.Position :=Progres.ProgressBar.Position +1;
        Progres.ProgressCaption.Repaint;
      end;

    except
       MyShowMessageDlg('При синхронізації виникла помилка.', mtError, but_OK );
    end;
  finally
    TDBShemaSynchronize(FElemMergeLog).DB.EnableControls;
    TDBShemaSynchronize(FElemMergeLog).DBUnLockCommitedIB;
    ClosedProgress(Progres.FormProgres);
  end;
  //****************************************************
  if( TDBShemaSynchronize(FElemMergeLog).TreeCountOnTopLevel = 0 )and(RecContBefore<>0) then
    MyShowMessageDlg('Синхронізація пройшла успішно.', mtInformation, but_OK );

  if (RecContBefore=0) then
    MyShowMessageDlg('Немає даних для синхронізації.', mtInformation, but_OK );
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FShowMouseCursorLoad;
begin
 if FShowLoadCursor then
   Screen.Cursor := crHourGlass;
 Application.ProcessMessages;
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FShowMouseCursorDefault;
begin
 Screen.Cursor := crDefault;
 Application.ProcessMessages;
end;
//******************************************************************************
function TFunctCallSoapWeb.CheckSoapServer:Boolean;
var FidHTTP:TIdHTTP;
begin
  FidHTTP:=TIdHTTP.Create(nil);

  try
   FShowMouseCursorLoad;

   FidHTTP.Request.BasicAuthentication:=true;
  //  FidHTTP.Request.Username:=SoapUser;
  //  FidHTTP.Request.Password:=SoapPassword;
   FidHTTP.Request.ContentType:='application/soap+xml';
   FidHTTP.Request.ContentEncoding:='utf-8';//'windows-1251';
   //FidHTTP.ConnectTimeout:=1000;
   FidHTTP.Connect(1000);

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
procedure SetParamHTTPRIO( HTTPRIO: THTTPRIO; aParamConUrl : TParamConUrl );
var port:string;
begin
  HTTPRIO.HTTPWebNode.ConnectTimeout := 2000;
  HTTPRIO.HTTPWebNode.SendTimeout := 3000000;
  HTTPRIO.HTTPWebNode.ReceiveTimeout := 3000000;
  HTTPRIO.WSDLLocation := aParamConUrl.defWSDL;
  HTTPRIO.URL := aParamConUrl.defURL;
  HTTPRIO.Service := aParamConUrl.defSvc;
  HTTPRIO.Port := aParamConUrl.defPrt;

  //HTTPRIO.HTTPWebNode.UserName := SoapUser;
  //HTTPRIO.HTTPWebNode.Password := SoapPassword;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetElementInsert( PData:PDatTableArr ):InsertData;
var i:integer;
    CurrTableFieldArrElem: TableArray;
    CurrTableValueArr: tblvalue;
    a:WideString;
begin
  result :=  InsertData.Create;
  result.insrequest := InsertRequest.Create;

  result.insrequest.id := PData^.ID;
  result.insrequest.tblname := PData^.TableName;
  CurrTableFieldArrElem := TableArray.Create;

  SetLength( CurrTableValueArr, Length(PData^.FieldValues) );

  for i:=0 to Length( PData^.FieldValues ) - 1 do
  begin
    CurrTableValueArr[i] :=  TableValue.Create;
    CurrTableValueArr[i].code := PData^.FieldValues[i].FieldName;
    CurrTableValueArr[i].value := PData^.FieldValues[i].Value;
    //a:= CurrTableValueArr[i].value;
    //ReplaseON(a,',','.');
    //CurrTableValueArr[i].value := a;
    CurrTableValueArr[i].Coding:= PData^.FieldValues[i].Coding;
  end;
  CurrTableFieldArrElem.tblvalue := CurrTableValueArr;
  result.insrequest.tblarray := CurrTableFieldArrElem;
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FDisposeElemInsert( aElemInsert:InsertData );
var i:integer;
begin
  if aElemInsert = nil  then exit;
  
  for i:=0 to Length( aElemInsert.insrequest.tblarray.tblvalue ) - 1 do
    FreeAndNIl( aElemInsert.insrequest.tblarray.tblvalue[i] );

  aElemInsert.insrequest.tblarray.Free;
  aElemInsert.insrequest.tblarray := nil;
  aElemInsert.insrequest.Free;
  aElemInsert.insrequest := nil;

  aElemInsert.Free;
  aElemInsert:=nil;
end;
//******************************************************************************
function TFunctCallSoapWeb.FInsertData( PData:PDatTableArr;CheckConnectToServer:Boolean = true; ShowMessageError:Boolean = false ):Integer;
var Res : Response;
    HTTPRIO : THTTPRIO;
    lStockQuotePortType: ExchangeServicePortType;
    CurrElemInsert:InsertData;
    Hdr: TSOAPHeaders;

begin
  if (CheckConnectToServer and CheckSoapServer) or (not CheckConnectToServer) then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );

    try
     FShowMouseCursorLoad;
     SetParamHTTPRIO( HTTPRIO ,self.FParamConUrl );
     CurrElemInsert:=nil;

      if PData <> nil then
      begin
        CurrElemInsert := FGetElementInsert(PData);

        Res := (HTTPRIO as ExchangeServicePortType).insertData( CurrElemInsert );
        Result := Res.status;

        if ( Result <> 0 ) and ( ShowMessageError ) then
        begin
          case Result of
           1:MyShowMessageDlg('Помилка, пустий запит синхронізації', mtError, but_OK);
           2:MyShowMessageDlg('Помилка з''єднання з веб сервером', mtError, but_OK);
           3:MyShowMessageDlg('Помилка SQL синхронізації на веб сервері', mtError, but_OK);
          end;
        end;

      end
       else Result := -1;
    finally
      FDisposeElemInsert( CurrElemInsert );
      HTTPRIO := nil;
      FShowMouseCursorDefault;
      Res.Free;
    end;
  end
   else result:=-2;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetStrValueForField(aField:TField):WideString;
var BlStream:TMemoryStream;
begin

  if (aField.IsBlob) then
  begin

    try
      BlStream:=TMemoryStream.create;
      TBlobField(aField).SaveToStream( BlStream );
      result := BinaryStreamToString( BlStream );
      
    finally
      BlStream.Free;
    end;
    
  end
   else
   begin
    if (aField.DataType <> ftDateTime)and(aField.DataType <> ftTime) then
    begin
      result := aField.AsString;

      if aField.DataType in [ftFloat,ftBCD] then
        replaseOn(result,',','.');
    end
    else
      result := ConvertDateTime(aField.asDateTime,7,'-'); 

   end;

end;
//******************************************************************************
function TFunctCallSoapWeb.FGetRowDataTableArr(DataSet:TDataset;TableName,FieldIdName:String; aFieldsSelfTable:TStringList; FieldForSynch:array of Widestring):PDatTableArr;
var i:integer;
    len:integer;
//******************************    
function CheckFieldName(aFieldName:Widestring):Boolean;
var i:integer;
begin
  if Length(FieldForSynch)=0 then result:=true
  else result:=false;
  //**************************
  for i:=0 to Length(FieldForSynch)-1 do
  begin
    if CompareText( FieldForSynch[i] , aFieldName) = 0  then
    begin
      result:=true;
      break;
    end;
  end;
end;
//******************************
begin
  result:=nil;
  if DataSet.RecordCount =0 then exit;

  New( result );
  result^.ID := DataSet.fieldByName(FieldIdName).AsString;
  result^.TableName := TableName;

  for i:=0 to DataSet.FieldCount-1 do
  begin
    if ( CheckFieldName( DataSet.Fields[i].FieldName )) and ( aFieldsSelfTable.IndexOf(DataSet.Fields[i].FieldName)<>-1 ) then
    begin
      len := Length(result^.FieldValues);
      SetLength( result^.FieldValues ,len+1 );


      result^.FieldValues[len].DataType := DataSet.Fields[i].DataType;
      result^.FieldValues[len].FieldName := DataSet.Fields[i].FieldName ;
      result^.FieldValues[len].Value  := FGetStrValueForField( DataSet.Fields[i] );
      if DataSet.Fields[i].IsBlob then
        result^.FieldValues[len].Coding := 1
      else
        result^.FieldValues[len].Coding := 0;
    end;
  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.UpdateData( DataSet:TDataset;TableName,FieldIdName:String; aFieldsSelfTable:TStringList; FieldForSynch:array of Widestring; CheckConnectToServer:Boolean = true; ShowMessageError:Boolean = false ) : Integer;
var i:integer;
    PData:PDatTableArr;
begin
  result:=-1;
  PData:= FGetRowDataTableArr( DataSet, TableName, FieldIdName, aFieldsSelfTable ,FieldForSynch  );
  try
    if PData <> nil then
      result:= FInsertData( PData , CheckConnectToServer , ShowMessageError );
  finally
    if PData <> nil then Dispose(PData);
  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetRowDataTableDelArr( TableName, FieldIdValue:String ): PDatTableDel;
begin
  New( result );
  result^.ID:= FieldIdValue;
  result^.TableName:= TableName;
end;
//******************************************************************************
function TFunctCallSoapWeb.DelData( TableName,FieldIdValue:String; ShowMessageError:Boolean = false ) : Integer;
var i:integer;
    PData:PDatTableDel;
begin
  result:=-1;
  PData:= FGetRowDataTableDelArr( TableName, FieldIdValue );
  try
    if PData <> nil then
      result:= FDeleteData( PData , ShowMessageError );
  finally
    if PData <> nil then Dispose(PData);
  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetElementDelete(PData:PDatTableDel):deleteData;
begin
  result:=deleteData.Create;
  result.delrequest:=DeleteRequest.Create;
  result.delrequest.id :=  PData^.ID;
  result.delrequest.tblname :=  PData^.TableName;
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FDisposeElemDelete( aElemDelete:DeleteData );
var i:integer;
begin
  if aElemDelete = nil  then exit;

  aElemDelete.delrequest.Free;
  aElemDelete.delrequest:= nil;

  aElemDelete.Free;
  aElemDelete:=nil;
end;
//******************************************************************************
function TFunctCallSoapWeb.FDeleteData( PData:PDatTableDel; ShowMessageError:Boolean = false ):Integer;
var Res : Response;
    HTTPRIO : THTTPRIO;
    CurrElemDelete:DeleteData;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );

    try
     FShowMouseCursorLoad;

     SetParamHTTPRIO( HTTPRIO,self.FParamConUrl );
     HTTPRIO.HTTPWebNode.UserName := SoapUser;
     HTTPRIO.HTTPWebNode.Password := SoapPassword;

     CurrElemDelete:=nil;

      if PData <> nil then
      begin
        CurrElemDelete := FGetElementDelete(PData);

        Res := (HTTPRIO as ExchangeServicePortType).deleteData( CurrElemDelete );
        Result := Res.status;

        if ( Result <> 0 ) and ( ShowMessageError ) then
        begin
          case Result of
           1:MyShowMessageDlg('Помилка, пустий запит синхронізації', mtError, but_OK);
           2:MyShowMessageDlg('Помилка з''єднання з веб сервером', mtError, but_OK);
           3:MyShowMessageDlg('Помилка SQL синхронізації на веб сервері', mtError, but_OK);
          end;
        end;

      end
       else Result := -1;
    finally
      Res.Free;
      FDisposeElemDelete( CurrElemDelete );

      HTTPRIO := nil;
      FShowMouseCursorDefault;
    end;
  end
   else result:=-2;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetStructDataTable( aData:TStructureTable ):PStructureTable;
var i:integer;
begin
  if (aData.TableName <>'')and( Length( aData.Fields )<>0 ) then
  begin
    New(Result);
    Result^.TableName:= aData.TableName;
    Result^.Fields := aData.Fields;
  end;

end;
//******************************************************************************
function TFunctCallSoapWeb.FGetElementStructure( PData:PStructureTable ):structureData;
var i:integer;
    ElemFields  : FieldArray;
    FieldArr: fldvalue;
    ElemFieldValue:FieldValue;
begin
  result := structureData.Create;
  result.strucrequest:= StructureRequest.Create;

  result.strucrequest.tblname := PData^.TableName;;
  result.strucrequest.primarykey := PData^.PrimariKeyFieldName;
  ElemFields := FieldArray.Create;

  SetLength( FieldArr, 0 );
  SetLength( FieldArr, Length( PData^.Fields ) );

  for i:=0 to Length(FieldArr)-1 do
  begin
    ElemFieldValue := FieldValue.Create;
    ElemFieldValue.name := PData^.Fields[i].FieldName;
    ElemFieldValue.type_ := PData^.Fields[i].FieldType;
    ElemFieldValue.size  := PData^.Fields[i].FieldSize;
    ElemFieldValue.isnull := PData^.Fields[i].isNull;
    ElemFieldValue.description := PData^.Fields[i].Description;

    FieldArr[i] := ElemFieldValue;
  end;
  ElemFields.fldvalue := FieldArr;
  result.strucrequest.fldarray := ElemFields;

end;
//******************************************************************************
procedure TFunctCallSoapWeb.FDisposeElemStructureRequest( aCurrElem:structureData );
var i:integer;
begin
  for i:=0 to Length( aCurrElem.strucrequest.fldarray.fldvalue ) - 1 do
    FreeAndNIl( aCurrElem.strucrequest.fldarray.fldvalue[i] );

  aCurrElem.strucrequest.fldarray.Free;
  aCurrElem.strucrequest.fldarray := nil;

  aCurrElem.strucrequest.Free;
  aCurrElem.strucrequest:=nil;

  aCurrElem.Free;
  aCurrElem:=nil;
end;
//******************************************************************************
function TFunctCallSoapWeb.FSynchronizeStructureTable( PData:PStructureTable; ShowMessageError:Boolean = false ):Integer;
var Res : Response;
    HTTPRIO : THTTPRIO;
    CurrElem:structureData;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );

    try
     FShowMouseCursorLoad;

     SetParamHTTPRIO( HTTPRIO,self.FParamConUrl );
     //HTTPRIO.HTTPWebNode.UserName := SoapUser;
     //HTTPRIO.HTTPWebNode.Password := SoapPassword;

     //CurrElemDelete:=nil;

      if PData <> nil then
      begin
        CurrElem := FGetElementStructure( PData );

      //try
        Res := (HTTPRIO as ExchangeServicePortType).structureData( CurrElem );
        Result := Res.status;
        //except
        // ShowMessage( IntToStr( Res ) );
        //end;

        if ( Result <> 0 ) and ( ShowMessageError ) then
        begin
          case Result of
           1:MyShowMessageDlg('Помилка, пустий запит синхронізації', mtError, but_OK);
           2:MyShowMessageDlg('Помилка з''єднання з веб сервером', mtError, but_OK);
           3:MyShowMessageDlg('Помилка SQL синхронізації на веб сервері', mtError, but_OK);
          end;
        end;

      end
       else Result := -1;
    finally
      res.Free;
      FDisposeElemStructureRequest( CurrElem );

      HTTPRIO := nil;
      FShowMouseCursorDefault;
    end;

  end;
end;

//******************************************************************************
function TFunctCallSoapWeb.SynchronizeStructureTable( PData:PStructureTable; ShowMessageError:Boolean = false ):Integer;
begin
  result:=-1;
  if PData <> nil then
    result:= FSynchronizeStructureTable( PData , ShowMessageError );
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetElementConstraints ( aConstraintsData : TableConstraintArr) :ConstraintData;
var i:integer;
    ElemArrKeys : KeyArray;
    ArrKeys : kyvalue;
    ElemCurrKey : KeyValue;
begin
  result := ConstraintData.Create;
  result.constrequest := ConstraintRequest.Create;
  ElemArrKeys := KeyArray.Create;

  SetLength( ArrKeys, Length( aConstraintsData ) );

  for i:=0 to Length(aConstraintsData)-1 do
  begin
    ElemCurrKey := KeyValue.Create;
    ElemCurrKey.name := aConstraintsData[i].ConstraintName;
    ElemCurrKey.maintblname := aConstraintsData[i].TableName;
    ElemCurrKey.maintblfldname := aConstraintsData[i].FieldName;

    ElemCurrKey.tblname := aConstraintsData[i].ParentTable;
    ElemCurrKey.tblfldname := aConstraintsData[i].ParentTableKey;
    ElemCurrKey.cascadedelete := aConstraintsData[i].IsCascadeDelete;

    ArrKeys[i] := ElemCurrKey;
  end;
  ElemArrKeys.kyvalue := ArrKeys;
  result.constrequest.kyarray :=ElemArrKeys;
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FDisposeElemConstraintRequest( CurrElem:ConstraintData );
var i:integer;
begin
  for i:=0 to Length( CurrElem.constrequest.kyarray.kyvalue ) - 1 do
    FreeAndNIl( CurrElem.constrequest.kyarray.kyvalue[i] );

  CurrElem.constrequest.kyarray.Free;
  CurrElem.constrequest.kyarray := nil;

  CurrElem.constrequest.Free;
  CurrElem.constrequest:=nil;

  CurrElem.Free;
  CurrElem := nil;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetElementIndexes ( aIndexesData : TableIndexesArr) :createIndex;
var i:Integer;
    //IndArr:IndexArray;
    ElemArrIndexes:IndexArray;
    IndValueElem:IndexValue;
    IndArr: ixvalue;
begin
  result := createIndex.Create;
  result.ixrequest := TableIndexes.Create;
  ElemArrIndexes := IndexArray.Create;

  //IndArr := IndexArray.Create;


  SetLength( IndArr, Length(aIndexesData) );
  for i:=0 to Length(aIndexesData)-1 do
  begin
    IndValueElem := IndexValue.Create;

    IndValueElem.IndexName := aIndexesData[i].IndexName;
    IndValueElem.TableName := aIndexesData[i].TableName;
    IndValueElem.Description := aIndexesData[i].Description;
    IndValueElem.FieldName := aIndexesData[i].FieldName;

    IndArr[i] := IndValueElem;
  end;
  ElemArrIndexes.ixvalue := IndArr;
  result.ixrequest.ixarray := ElemArrIndexes;
end;
//******************************************************************************
procedure TFunctCallSoapWeb.FDisposeElemIndexesRequest(CurrElem:createIndex);
var i:integer;
begin
  for i:=0 to Length( CurrElem.ixrequest.ixarray.ixvalue ) - 1 do
    FreeAndNIl( CurrElem.ixrequest.ixarray.ixvalue[i] );

  CurrElem.ixrequest.ixarray.Free;
  CurrElem.ixrequest.ixarray := nil;

  CurrElem.ixrequest.Free;
  CurrElem.ixrequest:=nil;

  CurrElem.Free;
  CurrElem := nil;
end;
//******************************************************************************
function TFunctCallSoapWeb.FSynchronizeConstraints( FConstraintsData : TableConstraintArr; ShowMessageError:Boolean = false ):Integer;
var Res : Response;
    HTTPRIO : THTTPRIO;
    CurrElem:ConstraintData;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );

    try
     FShowMouseCursorLoad;

     SetParamHTTPRIO( HTTPRIO,self.FParamConUrl );
     HTTPRIO.HTTPWebNode.UserName := SoapUser;
     HTTPRIO.HTTPWebNode.Password := SoapPassword;

     //CurrElemDelete:=nil;

      if Length(FConstraintsData) <> 0 then
      begin
        CurrElem := FGetElementConstraints( FConstraintsData );

        Res := (HTTPRIO as ExchangeServicePortType).constraintData( CurrElem );
        Result := Res.status;

        if ( Result <> 0 ) and ( ShowMessageError ) then
        begin
          case Result of
           1:MyShowMessageDlg('Помилка, пустий запит синхронізації', mtError, but_OK);
           2:MyShowMessageDlg('Помилка з''єднання з веб сервером', mtError, but_OK);
           3:MyShowMessageDlg('Помилка SQL синхронізації на веб сервері', mtError, but_OK);
          end;
        end;

      end
       else Result := -1;
    finally

      FDisposeElemConstraintRequest( CurrElem );
      res.Free;

      HTTPRIO := nil;
      FShowMouseCursorDefault;
    end;

  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.FSynchronizeIndexes( FIndexes : TableIndexesArr; ShowMessageError:boolean ):Integer;
var Res : Response;
    HTTPRIO : THTTPRIO;
    CurrElem:createIndex;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );

    try
     FShowMouseCursorLoad;

     SetParamHTTPRIO( HTTPRIO,self.FParamConUrl );
     HTTPRIO.HTTPWebNode.UserName := SoapUser;
     HTTPRIO.HTTPWebNode.Password := SoapPassword;

     //CurrElemDelete:=nil;

      if Length(FIndexes) <> 0 then
      begin
        CurrElem := FGetElementIndexes( FIndexes );

        Res := (HTTPRIO as ExchangeServicePortType).createIndex( CurrElem );
        Result := Res.status;

        if ( Result <> 0 ) and ( ShowMessageError ) then
        begin
          case Result of
           1:MyShowMessageDlg('Помилка, пустий запит синхронізації', mtError, but_OK);
           2:MyShowMessageDlg('Помилка з''єднання з веб сервером', mtError, but_OK);
           3:MyShowMessageDlg('Помилка SQL синхронізації на веб сервері', mtError, but_OK);
          end;
        end;

      end
       else Result := -1;
    finally

      FDisposeElemIndexesRequest( CurrElem );
      res.Free;

      HTTPRIO := nil;
      FShowMouseCursorDefault;
    end;

  end;

end;
//******************************************************************************
function TFunctCallSoapWeb.SynchronizeConstraint( FConstraints_FK : TableConstraintArr; ShowMessageError:boolean ):Integer;
begin
  result := 0;
  if Length(FConstraints_FK)<>0 then
    result := FSynchronizeConstraints( FConstraints_FK, ShowMessageError);
end;
//******************************************************************************
function TFunctCallSoapWeb.SynchronizeIndexes( FIndexes : TableIndexesArr; ShowMessageError:boolean ):Integer;
begin
  result := 0;
  if Length(FIndexes)<>0 then
    result := FSynchronizeIndexes( FIndexes, ShowMessageError);
end;
//******************************************************************************
function TFunctCallSoapWeb.FSynhronizationTree( var Node:TcxTreeListNode;  aDBParam:TConnectDBParam; Progres:TProgressFormProp; CheckConnectToServer:Boolean = true; ShowMessageError:Boolean = false ):Integer;
var ColIndxOPERATIONID : variant;
    ColIndxTypeTABLENAME : Integer;
    ColIndxCheckReason : Integer;
    ColIndxTypeKeyFieldNameID : Integer;

    CurrTableName   : Variant;
    CurrKeyFieldNameID : Variant;
    CurrOPERATIONID : Variant;

    CurrReason:Variant;
    aDBIB : TIBQuery;
    aDBADO: TADODataset;

    aListSelfField:TStringList;
    res:Integer;
begin
  ColIndxOPERATIONID   := FTreeLog.GetColumnByFieldName('OPERATIONID').ItemIndex;
  ColIndxTypeTABLENAME := FTreeLog.GetColumnByFieldName('TABLENAME').ItemIndex;
  ColIndxTypeKeyFieldNameID := FTreeLog.GetColumnByFieldName('KEYFIELD_ID').ItemIndex;
  ColIndxCheckReason   := FTreeLog.GetColumnByFieldName('REASON').ItemIndex;
  //*******************

  While Node<>nil do
  begin
    try
      aListSelfField := TStringList.Create;

      CurrOPERATIONID := Node.Values[ ColIndxOPERATIONID ];
      CurrTableName   := Node.Values[ ColIndxTypeTABLENAME ];
      CurrKeyFieldNameID :=  Node.Values[ ColIndxTypeKeyFieldNameID ];
      CurrReason      := Node.Values[ ColIndxCheckReason ];

      ShangeTitleProgres( DefCaptionSynchronizeWeb+' ('+CurrTableName+')', Progres.FormProgres );

      if aDBParam.IBDatabaseConnection<> nil then
      begin
        aDBIB:=UnitIBQuery.CreateDataSet( aDBParam.PathDB, aDBParam.UID, aDBParam.Password, nil, 'select * from '+CurrTableName +' where '+CurrKeyFieldNameID + '=' + String(CurrOPERATIONID) );
        UnitIBQuery.GetSelfFieldsForTable( aDBParam.PathDB, aDBParam.UID, aDBParam.Password,  CurrTableName,CurrKeyFieldNameID,  aListSelfField );
        res:= self.UpdateData( aDBIB, CurrTableName,CurrKeyFieldNameID, aListSelfField, [], CheckConnectToServer,  ShowMessageError );
      end else aDBIB := nil;


      if aDBParam.ADOConnection<> nil then
      begin
        aDBADO:=UnitADOQuery.CreateDataSet( aDBParam.ADOConnection, 'select * from '+CurrTableName +' where '+CurrKeyFieldNameID + '=' + String(CurrOPERATIONID) );
        UnitADOQuery.GetSelfFieldsForTable( aDBParam.ADOConnection,  CurrTableName,CurrKeyFieldNameID,  aListSelfField );
        res:= self.UpdateData( aDBADO, CurrTableName,CurrKeyFieldNameID, aListSelfField, [], CheckConnectToServer,  ShowMessageError );
      end else aDBADO := nil;


    finally
      aListSelfField.Free;
      if aDBIB<> nil then UnitIBQuery.DestroyDS (aDBIB);
      if aDBADO<> nil then UnitADOQuery.DestroyDS (aDBADO);
    end;
    //*******************************
    if res = 0 then
    begin

      if Node.GetNext <> nil then
      begin
        Node := Node.GetNext;
        FSynhronizationTree( Node, aDBParam, Progres, CheckConnectToServer, ShowMessageError );
        //Node := Node.getNextSibling;
      end
       else
        Node := nil;
      {else
        if Node.getNextSibling <> nil then
        begin
          //Node := Node.getNextSibling;
          FSynhronizationTree( Node.getNextSibling, PathDB, UID, Password,Progres, CheckConnectToServer, ShowMessageError );
        end; }
         //; else
         //   Node := nil;
        //Node := Node.getNextSibling;
    end
    else Node := Node.GetNext;
  end;

end;
//******************************************************************************
function TFunctCallSoapWeb.FViewMergeSoapCurrSynhronize(Progres:TProgressFormProp; WriteLog:Boolean=false ):integer;
var Node:TcxTreeListNode;
begin
  Node := self.FTreeLog.TopNode;
  result := FSynhronizationTree( Node,  self.FConnectDBParam,Progres, False, true );
end;
//******************************************************************************
function GetBinaryFile(fileName:String): TSOAPAttachment;
var
  FileStream: TMemoryStream;
begin
  Result := TSOAPAttachment.Create;
  Result.SetSourceFile(fileName);
  Result.ContentType:=ExtractFileName(fileName);
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetWebPathFile( FileName, RootPath : WideString ):Widestring;
begin
  RootPath := CheckLastSleshOnPath( RootPath,False);
  ReplaseON( FileName, RootPath,'' );
  result := FileName;
end;
//******************************************************************************
function TFunctCallSoapWeb.FFileByteDynArr( FileName:String ):TByteDynArray;
var F: File;
    Arr : TByteDynArray;
    Size : Integer;
begin
  Try
    AssignFile(F, FileName);
    Reset( F, 1 );
    Size := FileSize( F );
    SetLength( Arr, Size);
    BlockRead( F, Pointer( Arr )^, Size);
    CloseFile( F );

    result := Arr;
  except
    result :=null;
  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetAttacmentFile( fileName, RootPath : WideString ) : getAttachmentFile;
var Arr : TByteDynArray;
    aPath:WideString;
begin
  result:=getAttachmentFile.Create;
  result.filename := ExtractFileName(fileName);
  aPath:=  FGetWebPathFile( ExtractFilePath(FileName), RootPath );
  ReplaseOn(aPath,'\','/');

  result.path := aPath;
  Arr :=  FFileByteDynArr( FileName );
  if Arr <> null then
    result.files:= FFileByteDynArr( FileName )
  else
  begin
   Result.Free;
   result:= nil;
  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.FSynchronizeFile( fileName,RootPath:Widestring; ShowMessageError:Boolean = false ):Integer;
var Res : Response;
    HTTPRIO : THTTPRIO;
    FileAtt : getAttachmentFile;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );
    Result := -1;
    try
     FShowMouseCursorLoad;

     SetParamHTTPRIO( HTTPRIO,self.FParamConUrl );
     //HTTPRIO.HTTPWebNode.UserName := SoapUser;
     //HTTPRIO.HTTPWebNode.Password := SoapPassword;

      if FileExists(fileName) then
      begin
        FileAtt := FGetAttacmentFile( fileName,RootPath );
        //FSoapAtt:= GetBinaryFile(fileName);
        if FileAtt <> nil then
        begin
         Res := (HTTPRIO as ExchangeServicePortType).getAttachmentFile( FileAtt );
         Result := Res.status;

          if ( Result <> 0 ) and ( ShowMessageError ) then
          begin
            case Result of
             1:MyShowMessageDlg('Помилка, пустий запит синхронізації', mtError, but_OK);
             2:MyShowMessageDlg('Помилка з''єднання з веб сервером', mtError, but_OK);
             3:MyShowMessageDlg('Помилка SQL синхронізації на веб сервері', mtError, but_OK);
            end;
          end;

        end
        else Result := -1;
      end
       else Result := 0;
    finally
      FileAtt.Free;

      HTTPRIO := nil;
      FShowMouseCursorDefault;
      Res.Free;
    end;

  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.FGetElemFileXML( TableName,FileXml:Widestring ):importXml;
var xmlContent:TByteDynArray;
begin
  Result := importXml.Create;
  Result.tblname :=TableName;
  Result.xmlcontent:= FFileByteDynArr( FileXml );
end;
//******************************************************************************
function TFunctCallSoapWeb.SynchronizeFile( fileName, RootPath: Widestring;
  ShowMessageError: Boolean ): Integer;
begin
  result := FSynchronizeFile( fileName,RootPath, ShowMessageError );
end;
//******************************************************************************
function TFunctCallSoapWeb.FSynchronizeDBXMLFile( TableName, FileXml:Widestring; ShowMessageError:Boolean = false ):Integer;
var Res : Response;
    HTTPRIO : THTTPRIO;
    ElemImportXml : importXml;
begin
  if CheckSoapServer then
  begin
    //*******************************************
    HTTPRIO := THTTPRIO.Create( nil );
    Result := -1;
    try
     FShowMouseCursorLoad;
     SetParamHTTPRIO( HTTPRIO, self.FParamConUrl );

     if FileExists( FileXml ) then
     begin
       ElemImportXml := FGetElemFileXML( TableName, FileXml );
       Res := (HTTPRIO as ExchangeServicePortType).importXml( ElemImportXml );

       if Res <> nil then    // if Nil - time out 
       begin
         Result := Res.status;

         if ( Result <> 0 ) and ( ShowMessageError ) then
         begin
           case Result of
            1:MyShowMessageDlg('Помилка, пустий запит синхронізації', mtError, but_OK);
            2:MyShowMessageDlg('Помилка з''єднання з веб сервером', mtError, but_OK);
            3:MyShowMessageDlg('Помилка SQL синхронізації на веб сервері', mtError, but_OK);
           end;
         end;
       end
       else Result := 0;

     end
     else Result := -1;
      // end;
    finally
      ElemImportXml.Free;
      ElemImportXml:=nil;

      HTTPRIO := nil;
      FShowMouseCursorDefault;
      Res.Free;
    end;

  end;
end;
//******************************************************************************
function TFunctCallSoapWeb.SynchronizeDBXMLFile( TableName, FileXml:Widestring; ShowMessageError:Boolean = false ):Integer;
begin
  result := FSynchronizeDBXMLFile( TableName, FileXml, ShowMessageError );
end;
//******************************************************************************
destructor TFunctCallSoapWeb.Close;
begin
  if FElemMergeLog <> nil then
    TDBShemaSynchronize(FElemMergeLog).Tree.DataController.DataSource := nil;
end;
//******************************************************************************
function ReadParamConUrl(FileIni:String):TParamConUrl;
begin
  result.defWSDL := ReadIniFile(FileIni,'SOAPWEB','WSDL');
  result.defURL := ReadIniFile(FileIni, 'SOAPWEB','URL');
  result.defSvc := ReadIniFile(FileIni, 'SOAPWEB','Svc');
  result.defPrt := ReadIniFile(FileIni, 'SOAPWEB','Prt');
end;
//******************************************************************************

end.



<soap:Envelope xmlns:soap="http://www.w3.org/2003/05/soap-envelope" xmlns:alg="algolExchange">
   <soap:Header/>
   <soap:Body>
      <alg:insertData>
         <alg:InsertCommit>
            <!--Zero or more repetitions:-->
            <alg:insertRequest>

               <alg:id>1</alg:id>
               <alg:tableName>test_table</alg:tableName>

               <alg:tableValue>
                  <alg:code>id</alg:code>
                  <alg:value>1</alg:value>
               </alg:tableValue>

               <alg:id>1</alg:id>
               <alg:tableName>test_table</alg:tableName>

               <alg:tableValue>
                  <alg:code>name</alg:code>
                  <alg:value>acid_test1</alg:value>
               </alg:tableValue>

               <alg:id>1</alg:id>
               <alg:tableName>test_table</alg:tableName>

               <alg:tableValue>
                 <alg:code>avalue</alg:code>
                 <alg:value>acid_value1</alg:value>
               </alg:tableValue>

            </alg:insertRequest>
         </alg:InsertCommit>
      </alg:insertData>
   </soap:Body>
</soap:Envelope>
