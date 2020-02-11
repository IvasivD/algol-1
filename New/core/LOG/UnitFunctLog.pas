unit UnitFunctLog;

interface

uses
  Windows,
  SysUtils,
  Dialogs,
  Classes,
  SOAPHTTPClient,
  forms,
  iniFiles,
  IBQuery,
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
  UnitAdOQuery,
  cxGridCustomTableView,
  cxGraphics,
  Graphics,
  cxClasses,
  cxImage,
  core,
  UnitCompareDataGrid,
  IBCustomDataSet,
  ADODB,
  UnitSqlDB;

 const   CaptionLogAdmin = 'Журнал дій  користувача ( Адміністратор )';
         CaptionLogUser  = 'Журнал дій  користувача';


         CaptionUpdateLeftPart  = 'Дані після зміни';
         CaptionUpdateRightPart = 'Поточні дані';

         CaptionDeleteLeftPart  = 'Дані  до видалення';
type

  TTableFieldName = record
     TableName:string;
     FieldName:string;
     FieldId:string;
     ElemObj:TObject;
  end;
  TTableFieldsNameArr = array of TTableFieldName;

   TFunctLog = class
    private
     //FConnectionStr : String;
     //FLoginDB : String;
     //FPasswordDB : String;
     FDBParam: TConnectDBParam;

     FCurrClientId :Integer;
     FElemMergeLog : TObject;
     FViewLog:TcxGridDBTableView;
     FMenId :Integer;
     FIsAdmin:Boolean;
     FWriteLog :Boolean;
     FShowMessageError:Boolean;
     AskForFonfirmAction:Boolean;
     FCompareData: TCompareDataGrid;
     
     DBMergeLog1C : TDataset;
     FMarkDifStyle : TcxStyle;
     FActiveForm : TForm;
     FActiveId : Integer;
     FActiveTableNames :TVarArr;

     Procedure FRefreshDBLog1CAdmin( DB:TDataset; Sql:String='');
     Function  FFirstRunRefresh( DB:TDataset;MenId:Integer;IsAdmin:Boolean;frmMergeSoap1C:TfrmMergeSoap ):Integer;
     function  FRefreshMegeLogAdmin( DB:TDataset; DateIndex:Integer):integer;


     procedure FButSynhronizeAllButClick(Sender: TObject);
     procedure FShowUserSelfMergeLogBut(Sender: TObject);

     //function  FConvertCliToValueArr( DatCli : TDataCliArr ):PDataValueArr;
     procedure FViewShowCompareDblClick(Sender: TObject);
     procedure FShowAllMergeLogBut(Sender: TObject);
     procedure FPrepareView;
     procedure FUnplugView;
     function  FViewDataLog( idLog,Action:Integer; TableName,FieldNameId:String;IdObject:Variant  ): integer;
     Procedure FAddValueToConvertArr( var ArrDat:PDataValueArr; IndexArr:Integer; FieldName, Comment:Widestring; Value:Variant;ValueType:TFieldType;DisplayText:Widestring='';Visible:Boolean=true;Compare:Boolean=true );
     function  FConvertCliToValueArrReal(  DB:TDataset; StrFieldData:TFieldValuePackedArr ):PDataValueArr;
     function  FConvertCliToValueArrBlobLog(  DB:TDataset;var StrFieldData:TFieldValuePackedArr ):PDataValueArr;

     procedure FViewLogCustomDrawCell( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
     function  FShowCompareData( datLogDB, datCurrDB:TDataValueArr;Action:Integer ):integer;
     procedure FFreeMemDataArr(PData:PDataValueArr);


     procedure FRefreshDBPartData(var valueDataDB :PDataValueArr;TableName,FieldNameId:string;IdObject:Variant);
     function  FRestoreDataFromLog(aDataLog:PDataValueArr):Integer;

     procedure FRefreshDataLOG(valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean);
     Function  FUpdateDataLog(valueDataLeft,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;
     procedure FPrepareFuncUpdateForDataLOG(  var datClDB:TDataValueArr; var datClSoap:TDataValueArr;CompareData:TCompareDataGrid);
   public
     destructor  Close;
     constructor Create( DBParam: TConnectDBParam; ShowLoadCursor:Boolean=true);
     procedure   ShowLogPrograms( MenId: Integer; ActiveForm:TForm; ObjectId:Integer; TableNames:TVarArr; MarkDifStyle:TcxStyle);
 end;

 procedure LogShow( DBParam: TConnectDBParam; aFormActive:TForm; UserId, ObjId:Integer; TableNames:TVarArr; aStyleMark:TcxStyle );

implementation

{ TFunctLog }

destructor TFunctLog.Close;
begin

end;

constructor TFunctLog.Create( DBParam: TConnectDBParam; ShowLoadCursor: Boolean);
begin
  FDBParam := DBParam;
end;

procedure TFunctLog.FButSynhronizeAllButClick(Sender: TObject);
begin

end;

function GetSQLMergeSoap( MenId:Integer; aActiveForm:TForm; ObjId:Integer; TableNames:TVarArr; ShowForAllUsers:Boolean; TypeShowDate:Integer  ):String;
var i:integer;
    Separ:string;
    SqlWhere:String;
    SqlOptMerge:String;
    SqlByDate:string;
    CurrTableNameObjectName:string;
    ApplicationName:WideString;
    FormName:WideString;
    SqlByDetailAppAndForm:Widestring;
    SqlByObjectId:WideString;
    SqlTableNames:WideString;
begin
 if not ShowForAllUsers then
   SqlWhere :='USERID='+IntToStr(MenId)+''
 else SqlWhere:='';
 //***********************************************
 if TypeShowDate>=0 then
    SqlByDate := GetSqlForDataIndex('ADATE',TypeShowDate)
    else SqlByDate:= '';
 //***********************************************
 if aActiveForm<>nil then
 begin
   ApplicationName:= ExtractFileName(Application.ExeName);
   FormName       := aActiveForm.Name;
   SqlByDetailAppAndForm := 'APLICATION = '+''''+ApplicationName+''''+' and FORMNAME ='+''''+FormName+'''';
 end
  else SqlByDetailAppAndForm:='';
 //***********************************************
 if ObjId <> -1 then
   SqlByObjectId := 'LOG.objid = '+IntToStr(ObjId)
 else SqlByObjectId :='';
 //***********************************************
 if Length(TableNames)<>0 then
 begin
   SqlTableNames :='';
   Separ:=' OR ';
   for i:=0 to Length(TableNames)-1 do
   begin
     if i = Length(TableNames)-1 then Separ := '';
     SqlTableNames := SqlTableNames + 'LOG.tablename = '+''''+TableNames[i]+''''+Separ;
   end;
   SqlTableNames:='('+SqlTableNames+')';

 end
 else
   SqlTableNames:='';
 //***********************************************

 SqlWhere := MyIfThen( (SqlWhere<>'')and(SqlByDate<>''),SqlWhere+' AND ','') + SqlByDate +
             MyIfThen(SqlByDetailAppAndForm<>'',' AND '+SqlByDetailAppAndForm, '' ) +
             MyIfThen(SqlByObjectId<>'', ' AND '+SqlByObjectId, '' )+
             MyIfThen(SqlTableNames<>'', ' AND '+SqlTableNames, '' );

 {result:='SELECT LOG.ID,LOG.aplication,LOG.title,LOG.tablename,LOG.KEYFIELDID, LOG.objid, LOG.userid,LOG.typeaction,LOG.adate,LOG.formname,LOG.formcaption,LOG.applicationicon, '+
 ' (select TMFULLNAME from TMUSERS where LOG.USERID = TMUSERS.TMUSERID ) USERNAME '+
 ' FROM  LOG '+MyIfThen(SqlWhere<>'',' Where '+SqlWhere,'') + }

 result:=' SELECT LOG.ID,LOG.aplication,LOG.title,LOG.tablename,LOG.KEYFIELDID, LOG.objid, LOG.userid,LOG.typeaction,LOG.adate,LOG.formname,LOG.formcaption,LOG.applicationicon, '+
 ' GET_MANAGER(LOG.USERID) USERNAME '+
 ' FROM  LOG '+MyIfThen(SqlWhere<>'',' Where '+SqlWhere,'') +' order by ADATE DESC';

end;
//******************************************************************************
function TFunctLog.FFirstRunRefresh(DB: TDataset; MenId: Integer;
  IsAdmin: Boolean; frmMergeSoap1C: TfrmMergeSoap): Integer;
begin
  FRefreshMegeLogAdmin(DB , frmMergeSoap1C.ImComboBoxForDateIndex.ItemIndex );
end;
//******************************************************************************
procedure TFunctLog.FPrepareView;
begin
 FViewLog.OnCustomDrawCell :=FViewLogCustomDrawCell;
 FViewLog.OnDblClick := FViewShowCompareDblClick;
end;
//******************************************************************************
procedure TFunctLog.FViewShowCompareDblClick(Sender: TObject);
begin
  FViewDataLog( DBMergeLog1C.FieldByName('ID').AsInteger, DBMergeLog1C.FieldByName('TYPEACTION').AsInteger,
                DBMergeLog1C.FieldByName('TABLENAME').AsString,DBMergeLog1C.FieldByName('KEYFIELDID').asString, DBMergeLog1C.FieldByName('OBJID').Value );
end;
//******************************************************************************
procedure TFunctLog.FUnplugView;
begin
  FViewLog.OnDblClick       :=nil;
  FViewLog.OnCustomDrawCell :=nil;
end;
//******************************************************************************
procedure TFunctLog.FRefreshDBLog1CAdmin( DB: TDataset; Sql: String );
begin
  if (DB.Active)and(DB is TIBCustomDataSet) then
    TIBCustomDataSet(DB).Transaction.Commit;

  if Sql<>'' then
    QueryChangeSQL( DB, Sql);

  DB.Open;
end;
//******************************************************************************
function TFunctLog.FRefreshMegeLogAdmin(DB: TDataset; DateIndex:Integer): integer;
var Sql:string;
begin
  Sql := GetSQLMergeSoap(  FMenId, FActiveForm, FActiveId, FActiveTableNames, FIsAdmin, DateIndex );
  FRefreshDBLog1CAdmin(DB, Sql);
end;
//******************************************************************************
procedure TFunctLog.FShowAllMergeLogBut(Sender: TObject);
begin
  FRefreshMegeLogAdmin( Self.DBMergeLog1C , TfrmMergeSoap(TSpeedButton(Sender).Owner).ImComboBoxForDateIndex.EditValue  );
  TSpeedButton(Sender).Down:=True;
end;
//******************************************************************************
procedure TFunctLog.FShowUserSelfMergeLogBut(Sender: TObject);
begin

end;
//******************************************************************************
Procedure TFunctLog.FAddValueToConvertArr( var ArrDat:PDataValueArr; IndexArr:Integer; FieldName, Comment:Widestring; Value:Variant;ValueType:TFieldType;DisplayText:Widestring='';Visible:Boolean=true;Compare:Boolean=true );
var len:Integer;
begin
  len:=Length(ArrDat[IndexArr]);
  SetLength( ArrDat[IndexArr] , Len+1);
  New(ArrDat[IndexArr][len]);
  ArrDat[IndexArr][len].FieldName := FieldName;
  ArrDat[IndexArr][len].Caption := Comment;
  ArrDat[IndexArr][len].Value := Value;

  if Value=NUll then Value:='';
  if DisplayText='' then ArrDat[IndexArr][len].DisplayText:= string(Value)
  else ArrDat[IndexArr][len].DisplayText:= DisplayText;

  ArrDat[IndexArr][len].ValueType:= ValueType;
  ArrDat[IndexArr][len].Visible:= Visible;
  ArrDat[IndexArr][len].Compare:= Compare;
  ArrDat[IndexArr][len].ShowButtonEvent := nil;
end;
//******************************************************************************
function TFunctLog.FConvertCliToValueArrReal(  DB:TDataset; StrFieldData:TFieldValuePackedArr ):PDataValueArr;
var i:Integer;
function CheckField(aFieldName:String):Boolean;
var i:Integer;
begin
 result:=False;
 for i:=0 to Length(StrFieldData)-1 do
  if CompareText( StrFieldData[i].FieldName,  aFieldName) = 0 then
  begin
    result:=True;
    break;
  end;
end;
//*********************************************
function FindCaptionField(aFieldName:String):Widestring;
var i:Integer;
begin
 result:=aFieldName;
 for i:=0 to Length(StrFieldData)-1 do
  if CompareText( StrFieldData[i].FieldName,  aFieldName) = 0 then
  begin
    result:=StrFieldData[i].FieldCaption;
    break;
  end;
end;
//*********************************************
begin
  if DB.RecordCount <> 0 then
  begin
    SetLength(Result , 1);

    for i:=0 to DB.FieldCount-1 do
      if CheckField(DB.Fields[i].FieldName) then
        FAddValueToConvertArr( Result,0, DB.Fields[i].FieldName, FindCaptionField(DB.Fields[i].FieldName), DB.Fields[i].Value, ftString,'',True,True );
  end
   else SetLength(Result , 0);
end;
//******************************************************************************
function TFunctLog.FConvertCliToValueArrBlobLog(  DB:TDataset; var StrFieldData:TFieldValuePackedArr ):PDataValueArr;
var i,L:Integer;
    Stream : TMemoryStream;

begin
 try
   Stream := TMemoryStream.Create;
   TBlobField(DB.FieldByName('ADATA')).SaveToStream( Stream );

   Stream.Position :=0;
   Stream.Read(L, SizeOf(L));
   SetLength(StrFieldData, L);
   Stream.Read( Pointer(StrFieldData)^, L * SizeOf(TfieldPackedValue));

   SetLength(Result , 1);

   for i:=0 to Length(StrFieldData)-1 do
     FAddValueToConvertArr( Result, 0, StrFieldData[i].FieldName, StrFieldData[i].FieldCaption, StrFieldData[i].Value, ftString );
      
 finally
   Stream.Free;
 end;
end;
//******************************************************************************
function TFunctLog.FViewDataLog( idLog,Action:Integer; TableName,FieldNameId:String;IdObject:Variant ): integer;
var datLogDB:TDataValueArr;
    datRealDB:TDataValueArr;
    StrFieldData:TFieldValuePackedArr;
    FDBLog:TDataset;
    FDBReal:TDataset;
begin
  try
    if self.FDBParam.IBDatabaseConnection <> nil then
    begin
      FDBLog := UnitIBQuery.CreateDataSet( self.FDBParam.PathDB, self.FDBParam.UID, self.FDBParam.Password, nil,  ' SELECT ADATA from LOG WHERE ID = '+IntToStr(idLog) );
      FDBReal := UnitIBQuery.CreateDataSet( self.FDBParam.PathDB, self.FDBParam.UID, self.FDBParam.Password, nil, ' SELECT * From '+TableName+' WHERE '+FieldNameId+' = '+IntToStr(IdObject) );
    end;
    //***********************
    if self.FDBParam.ADOConnection <> nil then
    begin
      FDBLog := UnitAdOQuery.CreateDataSet( self.FDBParam.ADOConnection,  ' SELECT ADATA from LOG WHERE ID = '+IntToStr(idLog) );
      FDBReal := UnitAdOQuery.CreateDataSet( self.FDBParam.ADOConnection,  ' SELECT * From '+TableName+' WHERE '+FieldNameId+' = '+IntToStr(IdObject) );
    end;
    //***********************
    datLogDB.param.data := FConvertCliToValueArrBlobLog( FDBLog ,StrFieldData);
    datRealDB.param.data := FConvertCliToValueArrReal( FDBReal ,StrFieldData);

    FShowCompareData( datLogDB, datRealDB, Action );
  finally
    FFreeMemDataArr(datLogDB.param.data);
    FFreeMemDataArr(datRealDB.Param.data);

    DestroyDB( FDBLog );
    DestroyDB( FDBReal );
  end;
end;
//******************************************************************************
procedure TFunctLog.ShowLogPrograms( MenId: Integer; ActiveForm:TForm; ObjectId:Integer; TableNames:TVarArr; MarkDifStyle:TcxStyle );
var
    frmMergeSoap : TfrmMergeSoap;
    DB: TDataset;
    Res:Integer;
    CurrOPERATIONID:Integer;
    ColIndxOPERATIONID:Integer;
    CurrButTypeSynhronize:Integer;
begin
  try
   Application.CreateForm( TfrmMergeSoap, frmMergeSoap);
   //*****************************************
   if self.FDBParam.IBDatabaseConnection <> nil then
      DB := UnitIBQuery.CreateDataSet( self.FDBParam.PathDB, self.FDBParam.UID, self.FDBParam.Password, nil, '');

   if self.FDBParam.ADOConnection <> nil then
      DB := UnitADOQuery.CreateDataSet( self.FDBParam.ADOConnection, '');

   DBMergeLog1C:=DB;
   //*****************************************
   FMenId   := MenId;
   FIsAdmin := true;
   FViewLog := frmMergeSoap.ViewLog;
   FMarkDifStyle := MarkDifStyle;
   FActiveForm := ActiveForm;
   FActiveId   := ObjectId;
   FActiveTableNames := TableNames;

   CurrButTypeSynhronize := FFirstRunRefresh( DBMergeLog1C, MenId, FIsAdmin, frmMergeSoap );
   //*****************************************
   if FIsAdmin then frmMergeSoap.Caption :=  CaptionLogAdmin
   else frmMergeSoap.Caption :=  CaptionLogUser;

   frmMergeSoap.PageControlView.ActivePage := frmMergeSoap.TabView;
   frmMergeSoap.GridLogMergeSoap.Levels[0].GridView := frmMergeSoap.ViewLog;
   frmMergeSoap.DSMergeSoap.DataSet := DBMergeLog1C;
   self.FPrepareView;
   frmMergeSoap.PageControlView.HideTabs   := True;

   frmMergeSoap.ButSynhronizeAll.OnClick   := FButSynhronizeAllButClick;
   frmMergeSoap.ButSelfMergeLog.OnClick    := FShowUserSelfMergeLogBut;
   frmMergeSoap.ButShowJustAll.OnClick     := FShowAllMergeLogBut;
   frmMergeSoap.ResreshButDown( True  , CurrButTypeSynhronize );
   frmMergeSoap.ButShowJustAll.Down        := True;

   frmMergeSoap.ButShowJustSynhronize.Visible:=False;
   frmMergeSoap.ButShowJustNotSynhronize.Visible:=False;
   frmMergeSoap.ButShowJustAll.Visible:=False;
   frmMergeSoap.ButSynhronizeAll.Visible:=False;
   //*****************************************
   frmMergeSoap.ShowModal;
   //*****************************************     
  finally
    FUnplugView;
    DestroyDB(DB);
    frmMergeSoap.Free;
  end;
end;

procedure TFunctLog.FFreeMemDataArr(PData:PDataValueArr);
var i,j:Integer;
begin
  for i:=0 to Length(PData)-1 do
   for j:=0 to Length(PData[i])-1 do
    Dispose( PData[i][j] );
end;
//******************************************************************************
function TFunctLog.FRestoreDataFromLog(aDataLog:PDataValueArr):Integer;
var i : Integer;
    SQL:WideString;
    currValue:Widestring;
begin
 result:=-1;
 if Length(aDataLog)=0 then Exit;

 SQL:='';
 for i:=0 to Length( aDataLog[0] )-1 do
 begin
   currValue:=String(aDataLog[0][i].Value);
   if currValue = '' then currValue:='null'
   else currValue:=''''+currValue+'''';
   
   SQL := SQL + aDataLog[0][i].FieldName+'='+currValue+',';

 end;

 if (SQL<>'')and(SQL[Length(SQL)]=',') then
   Delete( SQL, Length(SQL), 1 );

 SQL := ' Update '+DBMergeLog1C.FieldByName('TABLENAME').AsString+' SET '+SQL+' WHERE '+DBMergeLog1C.FieldByName('KEYFIELDID').asString+'='+DBMergeLog1C.FieldByName('OBJID').AsString;
 if self.FDBParam.IBDatabaseConnection <> nil then
   result:= UnitIBQuery.UpdateSql( self.FDBParam.PathDB, self.FDBParam.UID, self.FDBParam.Password,  SQL );

 if self.FDBParam.ADOConnection <> nil then
   result:= UnitADOQuery.UpdateSql( self.FDBParam.ADOConnection, SQL );

end;
//******************************************************************************
procedure TFunctLog.FRefreshDataLOG(valueDataLeft ,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean);
var  RefreshDataLeft : TDataValueArr;
     RefreshDataRight : TDataValueArr;
begin
 FRefreshDBPartData(valueDataRight.data, DBMergeLog1C.FieldByName('TABLENAME').AsString,DBMergeLog1C.FieldByName('KEYFIELDID').asString,DBMergeLog1C.FieldByName('OBJID').AsString);
 RefreshDataLeft.param := valueDataLeft;
 RefreshDataRight.param := valueDataRight;

 FCompareData.RefreshBothData( RefreshDataLeft, RefreshDataRight );
end;
//******************************************************************************
procedure TFunctLog.FRefreshDBPartData(var valueDataDB :PDataValueArr;TableName,FieldNameId:string;IdObject:Variant);
var i:integer;
    aDBReal:TDataset;
    Sql :string;
begin
  try
   Sql := ' SELECT * From '+TableName+' WHERE '+FieldNameId+' = '+IntToStr(IdObject);
   if self.FDBParam.IBDatabaseConnection <> nil then
     aDBReal := UnitIBQuery.CreateDataSet( self.FDBParam.PathDB, self.FDBParam.UID, self.FDBParam.Password, nil, Sql  );

   if self.FDBParam.ADOConnection <> nil then
     aDBReal :=UnitADOQuery.CreateDataSet( self.FDBParam.ADOConnection, Sql );

   if Length(valueDataDB)>0 then
     for i:=0 to Length(valueDataDB[0])-1 do
     begin
       if aDBReal.FindField( valueDataDB[0][i].FieldName )<>nil then
       begin
         valueDataDB[0][i].Value:= aDBReal.FieldByName( valueDataDB[0][i].FieldName  ).Value;
         valueDataDB[0][i].DisplayText := aDBReal.FieldByName( valueDataDB[0][i].FieldName  ).asString;
       end;
     end;
  finally
    DestroyDB ( aDBReal );
  end;
end;
//******************************************************************************
Function TFunctLog.FUpdateDataLog(valueDataLeft,valueDataRight:TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError:Boolean=false ):integer;
//var  RefreshDataLeft : TDataValueArr;
//     RefreshDataRight : TDataValueArr;
begin
 if (AskForFonfirmAction) and (MyShowMessageDlg( 'Ви дійсно хочете відновити дані з логу ?',mtConfirmation, but_YES_NO ) <> res_YES) then Exit;

 if FRestoreDataFromLog(valueDataLeft.data)=0 then
 begin
     if FCompareData <> nil then
      begin
        FRefreshDataLOG(valueDataLeft, valueDataRight, SearchInDeleted, ShowMessageError);
       { FRefreshDBPartData(valueDataRight, DBMergeLog1C.FieldByName('TABLENAME').AsString,DBMergeLog1C.FieldByName('KEYFIELDID').asString,DBMergeLog1C.FieldByName('OBJID').AsString);
        RefreshDataLeft.data := valueDataLeft;
        RefreshDataRight.data := valueDataRight;
        
        FCompareData.RefreshBothData( RefreshDataLeft, RefreshDataRight );}
      end;
 end;
end;
//******************************************************************************
procedure TFunctLog.FPrepareFuncUpdateForDataLOG(  var datClDB:TDataValueArr; var datClSoap:TDataValueArr;CompareData:TCompareDataGrid);
begin
  FCompareData:=CompareData;
  datClDB.AcceptAct := self.FUpdateDataLog;
  datClSoap.AcceptAct := nil;

  datClDB.RefreshAct:= FRefreshDataLOG;
  datClSoap.RefreshAct:=nil;
end;
//******************************************************************************
function TFunctLog.FShowCompareData( datLogDB, datCurrDB:TDataValueArr; Action:Integer ):integer;
var CompareData: TCompareDataGrid;
    DialogHeight:Integer;
    ButtRestoreCapt :WideString;
    ButtRefreshCapt :WideString;

begin
 try
   AskForFonfirmAction:=True;
   CompareData := TCompareDataGrid.Create(True);
   FPrepareFuncUpdateForDataLOG( datLogDB , datCurrDB , CompareData );

   if Action in [0,1] then
   begin
     datLogDB.param.CaptionGrid := CaptionUpdateLeftPart;
     datCurrDB.param.CaptionGrid := CaptionUpdateRightPart;
     ButtRestoreCapt:= 'Відновити';
     ButtRefreshCapt:= 'Поновити';
   end;
   //*************************************************
   if Action = 2 then
   begin
     datLogDB.param.CaptionGrid := CaptionDeleteLeftPart;
     ButtRestoreCapt := '';
     ButtRefreshCapt := '';
   end;
   //*************************************************
   DialogHeight:=833;
   CompareData.Show( 'Порівняння даних', 1200, DialogHeight, 150, True, False, datLogDB, datCurrDB, ButtRestoreCapt,'',ButtRefreshCapt,'','','', self.FMarkDifStyle );

 finally
   CompareData.free;
 end;
end;

procedure TFunctLog.FViewLogCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
Const SpaceIconTextLeft = 2;
var indColmValue:Integer;
    ImageRect:TRect;
    Picture : TPicture;
    BoundsRect:TRect;
    CurrViewText:WideString;
    AlignmentHorz: TAlignment;
    AlignmentVertical: TcxAlignmentVert;
begin
  indColmValue := TcxGridDBTableView(Sender).GetColumnByFieldName('APPLICATIONICON' ).Index;
  if ( CompareText( TcxGridDBColumn(AViewInfo.Item).DataBinding.FieldName , 'APLICATION' ) = 0 ) then
  begin
     try
       ImageRect:=AViewInfo.Bounds;
       Picture := TPicture.Create;
       LoadPicture(Picture, TIcon , AViewInfo.GridRecord.Values[indColmValue] );
       ViewDrawFillRect( Sender, AViewInfo, ACanvas );
       AlignmentHorz := AViewInfo.Properties.Alignment.Horz;
       AlignmentVertical := vaCenter;
       BoundsRect:=AViewInfo.EditBounds;
       BoundsRect.Top := BoundsRect.Top + 2;
       BoundsRect.Left:= BoundsRect.Left + 16 + SpaceIconTextLeft;

       ImageRect.Left:= ImageRect.Left + 2;
       CurrViewText := PrepareTextToView(VarToStr(AViewInfo.DisplayValue), ACanvas, BoundsRect.Right - BoundsRect.Left);
       ACanvas.DrawTexT( CurrViewText ,BoundsRect , AlignmentHorz , AlignmentVertical, False, False);
       ACanvas.Draw( ImageRect.Left, ImageRect.Top + (ImageRect.Bottom - ImageRect.Top - 16) div 2 , Picture.Graphic );

       ADone:=true;
     finally
       Picture.free;
     end;
  end;
end;

procedure LogShow( DBParam: TConnectDBParam; aFormActive:TForm; UserId, ObjId:Integer; TableNames:TVarArr; aStyleMark:TcxStyle );
var LogView:TFunctLog;
begin
  try
   LogView := TFunctLog.Create( DBParam ) ;
   LogView.ShowLogPrograms( UserId, aFormActive, ObjId, TableNames, aStyleMark );

  finally
   LogView.Close;
  end;
end;

end.
