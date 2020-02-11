unit core;


interface                
uses                                                                                                            
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Contnrs, Forms,
  Dialogs, StdCtrls, jpeg, cxImage,ExtCtrls, RpBase, RpFiler, RpDefine, RpRender,
  RpRenderPDF,ShellAPI, OleCtrls, ComCtrls, Spin, ActiveX,ComObj,
  RpRave, OleServer, CheckLst, cxGraphics, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, Mask,
  DB, cxGrid, dxmdaset, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxButtonEdit,Provider, DBClient,
  cxDBLookupComboBox, Buttons, cxDBEdit, Grids, DBGrids, cxBlobEdit,  ADOInt,cxStorage,cxTL,cxHint,
  cxGridLevel, cxGridDBTableView, cxSpinEdit, cxGridCardView, cxCheckBox,cxCheckComboBox,cxLookAndFeelPainters,
  cxLookAndFeels, Menus, cxMemo, cxPC,Math, DBTables, ADODB, FileCtrl,cxVGrid, cxInplaceContainer ,cxStandardMask, FrmProgress,UnitEditText,
  ExtDlgs ,cxCalendar ,cxTimeEdit ,cxVariants,ClipBrd,IniFiles,TypInfo,cxDBTL,IBQuery,IBTable, IBDatabase,IBUpdateSQL,UnitIBQuery,IBStoredProc,
  UnitFunctWebSoap,dxGDIPlusClasses , UnitADOQuery,UnitProc,UnitUserPermission;


const MaskFormatPrice = ',0.00;-,0.00';
      DefMessForAskDelete = 'Ви дійсно хочете видалити цей запис?';
      MessageForRenumberViewData ='Віи дійсно хочете пронумерувати дані в гріді? ';
      DefMessRecordWasDeletedOtherUser = 'Цей запис був видалений іншим користувачем. Поновіть дані.';
      DefCaptionSynchronizeWeb = 'Синхронізація';
      UpdateFormCaptionInsert = 'Додати дані';
      UpdateFormCaptionEdit   = 'Редагувати дані';
      WaitFormCaption         = 'Зачекайте';
      ErrorLostConnectToServer = 'Пропав зв''язок з сервером';
      ErrorUpdateRecordCheckContraint = 'Перевірте на унікальність або на правильність вводу даних!';
      ErrorUpdateRecordDeleteForeignKeyContraint = 'Даний запис не можна видалити, так як він використовується!';
      AskChangeDataSave = 'Дані були змінені. Зберегти?';
      WarningSortColumnOrder = 'Для початку відсортуйте колонку № в порядку зростання.';
      MessagePermisInsert ='У вас немає права на додавання даних до цієї таблиці';
      MessagePermisUpdate ='У вас немає права на редагування даних в цій таблиці';
      MessagePermisDelete ='У вас немає права на видалення даних з цієї таблиці';
      MessagePermisAny = 'У вас немає жодних прав доступу до цієї таблиці';
type

  TImgTypes=(pfJpeg, pfBitmap, pfMeta, pfPng);
  TImageCellPosition = (OptImgPosLeft,OptImgPosRight,OptImgPosCenter);
  TActionLog = ( OptActionLogInsert, OptActionLogEdit, OptActionLogDelete );
  TOptAddTreeNode = ( OptTreeNodeAddInsert, OptTreeNodeAddLast, OptTreeNodeAddSub, OptTreeNodeAddNone );

  TDllFunct = function( DllFunc : Pointer; paramFun:Pointer ):boolean;
  TValidtateBeforePost = function(Dataset:TDataset) :Boolean;
  TOnFilterDB = procedure ( DataSet: TDataSet; var Accept: Boolean );
  TOnHintView = function( AViewInfo: TcxGridTableDataCellViewInfo ):Widestring;
  TRefreshDB  = procedure( MainShemaElem , ActiveElem: TObject );
  TGenIdFunct = function ( ):Variant;
  TFuncSelectInView = procedure ();
  TPrepareUpdateForm = procedure ( Sender:TObject );
  TUpdateFormGridView = procedure (isNew : boolean; CurManager:Integer );
  TUpdateFormTree = procedure ( OptAdd : TOptAddTreeNode; CurManager:Integer );
  TUpdateFilterView = procedure (Sender: TcxCustomGridTableView; Elem:TObject);
  //TUpdateSaveData = procedure ();

  TMyVariant = Variant;
  TUpdateValue = function ( Elem:TObject ):Boolean of object;
  TUpdateValueDetail = function ( Elem,ElemDetail:TObject ):Boolean of object;

  TFieldParam = record
    DataType : TDataType;
    Size :Integer;
    FieldName:string;
    Required : Boolean;
  end;

  TArrFieldsParam = array of TFieldParam;

  TTranslateOptions = record
     TableName : string;
     FieldIDName :string;
     FieldName : string;
     FieldIdParentName : string;
     FieldLndIdName : string;
     FieldChange : string;
     GenIdName   : string;
     IdLocalUpdate : Variant;
     WidthColum : Integer;
     IndTableTemplate:Integer;
  end;
  TTranslateOptionsArr = array of TTranslateOptions;

  TFieldValue =  record
     FieldName:string;
     Value:Variant;
  end;

  TFieldColumn =  record
     FieldName:string;
     Caption:Variant;
     BandIndex:Integer;
     Width :Integer;
     ColumnProperties : TcxCustomEditPropertiesClass;
  end;
  TFieldColumnArr = array of TFieldColumn;

  TfieldPackedValue = packed record
   FieldCaption : String[150];
   FieldName : String[50];
   Value : String[255];
  end;
  TFieldValuePackedArr = array of TfieldPackedValue;

  TTableFieldName = record
     TableName:string;
     FieldName:string;
     FieldId:string;
     ElemObj:TObject;
  end;
  TTableFieldsNameArr = array of TTableFieldName;

  TFieldAsociate = record
     FieldFrom:WideString;
     FieldTo:WideString;
  end;
  TFieldAsociateArr = array of TFieldAsociate;

  TParamSynchr = record
    DBParam: TConnectDBParam;
    MenId:Integer;
    ShowLoadCursor:Boolean;
    ShowWhenDiferent:Boolean;
    AutoMerge:Boolean;
    StyleMarked:TcxStyle;
    SearchInDelete:Boolean;
    WriteLog:Boolean;
    ShowMessageError:Boolean;
  end;
  PParamSynchr = ^TParamSynchr;

  TColumnPopUpMenuView = record
    //Column:TcxCustomGridTableItem;
    FieldName:String;
    PopUpMenu:TPopupMenu;
    TrigerMouseButton: TMouseButton;
  end;

  TColumnPopUpMenuTree = record
    Column:TcxTreeListColumn;
    PopUpMenu:TPopupMenu;
    TrigerMouseButton: TMouseButton;
  end;

  TFieldImageIndex = record
    ViewFieldName : WideString;
    ValueFieldName : WideString;
    ValueImage :Variant;
    ImageList:TImageList;
    ImageWidth:Integer;
    ImageIndex:Integer;
    ImagePos  :TImageCellPosition;
  end;
  TFieldImageIndexArr = array of TFieldImageIndex;

  TColMouseCursor = record
    Column:TcxCustomGridTableItem;
    cursor:TCursor;
  end;

  TColMouseCursorTree = record
    Column:TcxTreeListColumn;
    cursor:TCursor;
  end;

  TLevelTreeImageIndex = record
    Level:Integer;
    ColumnFieldName:String;
    ImageList:TImageList;
    ImageIndex:Integer;
    ImageWidth:Integer;
    PosImg:TImageCellPosition;
  end;

  TValueTreeImageIndex = record
    ColumnFieldName:String;
    ColumnFieldNameForValue:String;
    FieldValue:Variant;
    ImageList:TImageList;
    ImageWidth:Integer;
    ImageIndex:Integer;
    Level:Integer;
    PosImg:TImageCellPosition;
  end;

  TLogFields = record
     FieldID:WideString;
     FieldApplicationName:WideString;
     FieldTitleElem:WideString;
     FieldTableName:WideString;
     FieldKeyFieldId:WideString;
     FieldIDObject:WideString;
     FieldIDUser:WideString;
     FieldAction:WideString;
     FieldDATE:WideString;
     FieldFormName:WideString;
     FieldFormCaption:WideString;
     FieldDATA:WideString;
     FieldIconApplication:WideString;
  end;

  TConstraintFK = record
    ConstraintName:WideString;
    ConstraintType:WideString;
    FieldName:WideString;
    MainTale:WideString;
    MaintTableKey:WideString;
  end;
  TConstraintArr_FK = array of TConstraintFK;

  TMasCxColGrid=array of TcxGridColumn;
  TMasCxColTree=array of TcxTreeListColumn;

  TCellHintParamView = record
    FieldNameHint :String;
    HintColor : TColor;
    HintBorder : TColor;
    FunGetHintText:TOnHintView;
  end;
  TCheckViewColumn = record
    idValue:Variant;
    ItemColumn:TcxCustomGridTableItem;
  end;
  PCheckViewColumn = ^TCheckViewColumn;

  TSortViewColumn = record
    ItemColumn: TcxCustomGridTableItem;
    SortOrder : TcxDataSortOrder;
    SortIndex : Integer;
  end;

  TMasMaskTemplate = record
   FieldName : string;
   FieldOnElemSource:string;
   ElemeSource : TObject;
   FieldSourceTemplateName:string;
  end;

 TMasMaskTemplateArr = array of TMasMaskTemplate;
 TVarArrString = Array of string;
 TVarArr = array of WideString;
 TVarIntArr =  array of Integer;
 TVarArrVariant = array of Variant;
 TVarArrBool = array of TcxFilterBoolOperatorKind;

TTempDataShema = class
public
   id   :Variant;
   Key  : string;
   Value : Variant;
end;

TStatusBarInfo =  class
  private
     FStBar:TStatusBar;
     FStatusPanelItemIndex:Integer;
  public
     constructor Create( StBar:TStatusBar);
     destructor Close;
     procedure ShowInfo( StatusPanelItemIndex:Integer; InfoText:Widestring );
end;

TTimerPingServer =class
  private
    function  GetTimerEnabled: Boolean;
    procedure SetTimerEnabled(const Value: Boolean);
  protected
    FTmerPingServer : TTimer;
    FServerNameIP:String;
    procedure FTimerPingServerTimer(Sender: TObject);
    procedure FLockForms(Lock:Boolean);
  public
    constructor Create;
    destructor Close;
    procedure SetServerForPing( aServerNameIP:String;Interval:Integer;Active:Boolean  );
    procedure SetIBServerForPing( aDB: TIBDatabase; Interval:Integer;Active:Boolean   );overload;
    procedure SetIBServerForPing( aDB: TADOConnection; Interval:Integer;Active:Boolean );overload;

    property Enabled:Boolean read GetTimerEnabled write SetTimerEnabled ;
end;

TDBShema=class(TPersistent)

 private
     FIDElem:String;
     FMainDBParam: TConnectDBParam;
     FProgress : TProgressFormProp;
     //FIsLock : boolean;
     FTableName:WideString;
     FFieldKod:WideString;
     FFieldNumber:WideString;
     FFieldMainKod:WideString;
     FGenIdName:WideString;
     FPrevDeleteIndex : Integer;
     FFunctionGenId : TGenIdFunct;
     FShowNullDataset : Boolean;
     FSaveAndRestoreParamAfterChangeSql : boolean;
     FMainSQL:WideString;

     FfieldRelationTopKod:WideString;
     FAutoComitedIB :Boolean;
     FUpdateSqlIB:TIBUpdateSql;
     FFieldsSelfTable:TStringList;
     FMessageForDelete:WideString;
     FAskBeforeDelete :Boolean;
     FBeforeDeleteCheckFunct:WideString;

     FFunctionSQLRefreshData : TRefreshDB;
     FControlsDisabled :Boolean;

     FOriginalDB:TDataset;
     FDS  :TDataSource;
     FDB  :TDataset;


     FMainElem:TDBShema;
     FRelationTopElem:TDBShema;
     FBeforeStateAction:TActionLog;
     FBeforeUpdateValueID:Variant;

     FConteinerTempData:TList;
     FConteinerConstraintElements : TList;

     FTranslateOptions           :TTranslateOptionsArr;

     FInputVgrid                 : TcxVerticalGrid;
     FUniqFieldNames             : TStringList;
     FMasMaskTemplateArr         : TMasMaskTemplateArr;
     //******************************
     FMainImageList   : TImageList;
     FMainImageIndex  : Integer;
     FFieldImageIndex : TFieldImageIndexArr;
     //******************************
     FTranslationElem : TDBShema;
     FParamNameLangId : Widestring;
     FFieldNameTranslate : TFieldAsociateArr;
     //******************************
     FCanWebSynchronize : Boolean;
     FWebSynchronizeMergeLogElem: TObject;
     FFieldForSynchronize:Array of Widestring;
     //******************************
     FUserElem : TDBShema;
     FFieldUserName : WideString;
     FCurrUserId : Integer;
     //******************************
     FLogTableName :Widestring;
     FNeedSaveToLog :Boolean;
     FLogStoredProcName  : Widestring;
     FLogFieldNames  : TLogFields;
     FLogFieldPackedData:TFieldValuePackedArr;
     //******************************
     FPriorForCopyDefValue : Boolean;
     FMasDefValueFielsd:TVarArrString;
     FMasDefValueFiledsValue:TVarArrVariant;
     FCopyMasFieldNotInclude:TVarArrString;
     //******************************


     FActInsertDB:TUpdateValue;
     FActEditDB:TUpdateValue;
     FActViewDB:TUpdateValue;

     FCopyMasData:array of array of TFieldValue;
     FFlagUpdateValueAfterInsert:Boolean;

     FSaveMarkID                 :Variant;
     FIniDBSavePosition          :WideString;
     FEnableSavePosition         :Boolean;
     FFlagElementWasRestorePosition:Boolean;
     FName:string;
     FTitle:WideString;
     FStyleMarkLog               :TcxStyle;

     FCounterLockConflict        :Integer;
     FMaxCounterLockConflict     :Integer;
     FEnabled:Boolean;
     FLastInsertID               :Integer;

     PersonalBeforeCancel        :TDataSetNotifyEvent;
     PersonalAfterCancel         :TDataSetNotifyEvent;

     PersonalBeforeDelete        :TDataSetNotifyEvent;
     PersonalBeforeInsert        :TDataSetNotifyEvent;
     PersonalBeforePost          :TDataSetNotifyEvent;
     PersonalBeforeEdit          :TDataSetNotifyEvent;
     PersonalAfterEdit           :TDataSetNotifyEvent;

     PersonalAfterDelete         :TDataSetNotifyEvent;
     PersonalAfterInsert         :TDataSetNotifyEvent;
     PersonalAfterPost           :TDataSetNotifyEvent;

     PersonalAfterScroll         :TDataSetNotifyEvent;
     PersonalCalckFields         :TDataSetNotifyEvent;
     PersonalBeforeOpen          :TDataSetNotifyEvent;
     PersonalAfterOpen           :TDataSetNotifyEvent;
     PersonalBeforeClose         :TDataSetNotifyEvent;

     PersonalFilterRecord        :TFilterRecordEvent;



     PersonalDeleteError         :TDataSetErrorEvent;

     FDetailCount                : Integer;
     FFunctValidate              : TValidtateBeforePost;
     FFunctOnFilterDB            : TOnFilterDB;


     FBookmark                   : TBookMark;
     FDBParamsADO                : TParameters;
     FDBParamsIB                 : TParams;

     FAliesTable                 : String;
     FShowUpdateForm             : Boolean;
     FStafFieldValueForUpdate    : TFieldValue;
     FFunctionPrepareUpdateForm  : TPrepareUpdateForm;

     Procedure   FCloneAssign( var aElem:TDBShema ); overload;
     procedure   FClearParamDB(ADB:TDataset);

     procedure   FRestoreParamDB(ADB:TDataset);
     function    FGetCountDetail:integer;
     function    FGetDB: TDataset;
     function    FGetDS: TDatasource;
     function    FGetTitle:WideString;
     procedure   FSaveToLog(Action : TActionLog);
     function    FGetUserId:Variant;
     function    FGetAction:TActionLog;
     function    FGetIndexAction(aCurrActLog:TActionLog):Integer;
     function    FCreateStructDBRow:TFieldValuePackedArr;
     function    FFindObjIDFromStruct(aStruct:TFieldValuePackedArr):Variant;
     procedure   FAddLogIBSQLUpdate(   UserId:Integer; Action : TActionLog;
                                       ActiveFormName:WideString; ActiveFormCaption:WideString );
     procedure   FAddLogIB(UserId:Integer; Action : TActionLog );
     Procedure   FPreapareLogFieldPackedData;

     function    FGetCaptionField(aFieldName:Widestring):Widestring;
     procedure   FReadSelfMainTableFields;
     procedure   FSetStafFieldValue( aFieldValue:TFieldValue );
     function    FGetStafFieldValue : TFieldValue ;

     function    FGetIBDatabase:TIBDatabase;
     function    FIBConnect:Boolean;
     function    FGetDBParam:TConnectDBParam;
     procedure   FUpdateOrder( NewOrder:Integer ); virtual;

     function    FIsSetDefaultParam(aParamName:String):integer;

     Function    FDBDeleteAll:boolean;
     function    FGenIdIB:Variant;
     function    FGenIdADO:Variant;
     procedure   FPrepareDefaultValue(DataSet: TDataSet);

     procedure   AfterInsert(DataSet: TDataSet); virtual;
     procedure   BeforeInsert(DataSet: TDataSet);virtual;

     function    FConfirmBeforeDelete:Boolean;
     function    FPreapareMessageError(CurrErrMess:Widestring):Widestring;
     procedure   DBPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
     procedure   DBDeleteError( DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction );

     procedure   BeforeCancel(DataSet: TDataSet);
     procedure   AfterCancel(DataSet: TDataSet);

     procedure   BeforeDelete(DataSet: TDataSet);virtual;
     procedure   AfterDelete(DataSet: TDataSet); virtual;

     procedure   BeforePost(DataSet: TDataSet); virtual;
     procedure   AfterPost(DataSet: TDataSet);  virtual;

     procedure   BeforeOpen(DataSet: TDataSet);
     procedure   AfterOpen(DataSet: TDataSet);

     procedure   AfterScroll(DataSet: TDataSet);
     procedure   OnCalcFields(DataSet: TDataSet);

     procedure   AfterEdit(DataSet: TDataSet);virtual;
     procedure   BeforeEdit(DataSet: TDataSet);virtual;

     procedure   BeforeClose(DataSet: TDataSet); virtual;

     //Procedure   FRestorePersonalDB(aDB:TDataset);
     function    FGetLastInsertID:variant;
     procedure   FSetLastInsertID(value:Integer);
     procedure   FSetFunctionPrepareUpdateForm ( aFunction:TPrepareUpdateForm );
     function    FGetFunctionPrepareUpdateForm : TPrepareUpdateForm;
     procedure   FSetEnabled(En:Boolean);
     procedure   FSetTableName(aTable:Widestring);
     procedure   FSetFieldKod( aFieldKod:Widestring );
     procedure   FSetFieldMainKod( aFieldMainKod: Widestring );
     procedure   FSetFieldRelationTopKod( aFieldRelationTopKod: Widestring );
     procedure   FSetFieldNumber( aFieldNumber: Widestring );

     Procedure   FFSetMasterDetailADO(Destroy:boolean);
     Procedure   FFSetMasterDetailAdoQuery(Destroy:boolean);
     Procedure   FFSetMasterDetailIBQuery(Destroy:boolean);
     Procedure   FFSetMasterDetailIBTable(Destroy:boolean);

     procedure   FSetIBUpdateSql;
     Procedure   FRequeryCurrentRecordIB( UpdateSQL:Widestring ='' );
     Procedure   FRequeryIB(FetchAll:Boolean=False);
     procedure   FSetParamLangID(paramValue:Variant);
     procedure   OnFilterRecord(DataSet: TDataSet; var Accept: Boolean);

     function    FCheckId(idValueStr:String):boolean;
     function    FCheckBeforeDeleteTrigerFunct(ShowMesError:Boolean=true):Boolean;

     procedure   FAddMasFiledValues;
     procedure   FPasteFromMasFiledValues;
     procedure   FClearMasCopy;
     function    FGetMainSQL:Widestring;
     function    FIndCloneElementCountByIDElem( aIDElem:String ):Integer;
     function    FIndCloneElemtsCountByDataset( DB:TDataset ):Integer;
     procedure   FIndCloneElemAndLockDBEvents( aLock:Boolean );
     procedure   FClearShemaConteinerConstraintElements;

     function    FGetSqlWithoutAfterFrom:Widestring;
     Procedure   FPrepareUpdateObjectRefreshCurrentIB( UpdateSQL:Widestring ='');
     Procedure   FPrepareUpdateObjectUpdateCurrentIB( FixBlobNull:Boolean=false );
     Procedure   FPrepareUpdateObjectDeleteCurrentIB;
     Procedure   FPrepareUpdateObjectInsertCurrentIB;

     procedure   FSetAskBeforeDelete(const Value: Boolean);
     procedure   FSysError(MessError:Widestring);
     procedure   FSetCanWebSynchronize(const Value: Boolean);
     
     function    FCheckFieldForSynchronizeWeb(aFieldName:widestring):Boolean;
     function    FAddDataSynchronizeLogMerge( IncludeDetailElements:Boolean; Reason:Integer ):Integer;
     function    FFIndIndexValueFromTemp(aKey:String;Id:Variant):Integer;
     procedure   FButClickEditText(Sender: TObject;  AButtonIndex: Integer);

     function    FLoadSQLFromFileToText( FileNameSQL:String ):String;
     function    FSynchronizeDataDelRow(idDelRow:String):Integer;
     function    FSynchronizeDataRow( CheckConnectToServer:Boolean = true):Integer;
     procedure   setMainSQL(const Value: WideString);
     procedure   FAssingPersonalEvents( FromElem:TDBShema );
     procedure   FSaveDatasetPersonalEvents( ADB:TDataset );
     procedure   FPrepareDatasetPersonalEvents( ADB:TDataset );
     procedure   FPrepareDatasetEvents( ADB:TDataset );
     Procedure   FPrepareDB( ADB:TDataset );
     //procedure   FUpdateTranslateElem( ElemTranslate:TDBShema; Param:TTranslateOptions );
     procedure   FUpdateTranslateTable(Dataset:TDataset);
     procedure   FUpdateTranslateTableByFieldName( FieldName:String );
     Procedure   FRequery(IBFetchAll:Boolean=False); virtual;
     Procedure   FRequeryWait(BFetchAll:Boolean=False);
     Procedure   FSetUnRequiredAllFields;
     function    FSaveFieldsToArray : TArrFieldsParam;
     Procedure   FRestoreRequiredDBFields( arrField: TArrFieldsParam );

     function    FFindIbDatabase( DBParam:TConnectDBParam ):TIBDatabase;
     function    FCreateIBDatabase( DBParam:TConnectDBParam ):TIBDatabase;
     procedure   FDBExchangeonIB(ADB:TDataset);
     Function    FCheckConnectionComponentOnDB( ADB:TDataset ):boolean;
     Procedure   FDestroyDB;
     procedure   FDBBooleanSetValue( FieldName:String; value:Boolean );
     function    FDBBooleanGetValue( FieldName:String ):Boolean;

 public
      PersonalPostError           : TDataSetErrorEvent;

      DetailElem :TList;//array of TDBShema;
      procedure   FSaveParamDB(ADB:TDataset);
      procedure  FShowEmptyFilterDataset( aEmpty:Boolean );
      Procedure  SetDB(ADB:TDataset);
      Procedure  JustSetDB( ADB:TDataset );
      function   DBGetSQL:string;
      function   DBGetSQLWithoutAfterFrom:Widestring;
      procedure  SetDS(const Value: TDataSource);
      procedure  SetDBMasterSource(DS:TDatasource);
      procedure  SetTableAlies(aAlies:string);
      function   GetTableNameAlies:string;

      Function   CheckFieldOnSelf(FieldName:String):Boolean;
      Procedure  RequeryCurrentRecord(UpdateSQL:Widestring ='');
      Procedure  Requery(ShowWait:Boolean = False;IBFetchAll:Boolean=False ) ;
      Procedure  RequeryDetailCascade( JustDetail:Boolean=false );
      Procedure  DBOpen( IBFetchAll:Boolean=False ); virtual;
      procedure  DBOpenWait( IBFetchAll:Boolean=False ); virtual;
      procedure  DBReOpen( IBFetchAll:Boolean=False );
      procedure  DBClose;
      Procedure  DBFetchAllIB;
      procedure  DBQueryExecSQL;
      procedure  DBQuerySetParamValue( ParamName:String;ParamValue:Variant );
      function   DBQueryGetParamValue( ParamName:String ):Variant;
      procedure  DBSaveToFile( FileName:String;FormatFile: TDataPacketFormat=dfXMLUTF8 );
      procedure  CreateIBDynamicCloneDataset( aDataset:TDataset;FieldsAddToDataset:Boolean=true );
      procedure  LoadScriptsDBFromFile(aDB:TDataset; PathToScripts:string );
      Function   GetCurrentTypeConnection: TOptTypeConnect;
      //procedure  CreateBDEDynamicCloneDataset(aDataset:TIBQuery;FieldsAddToDataset:Boolean=true);

      procedure  LogOnOff( aEnabled:Boolean );
      function   GetIBDatabase : TIBDatabase;
      Procedure  CascadeDelete;
      procedure  DBAddSQLWhere(aWhere:Widestring;AutoOpen:Boolean=true);
      procedure  DBOpenMainSQL;
      function   DBSqlHaveWhere(aWhere:Widestring):Boolean;

      procedure  SetTitle(aTitle:Widestring);
      function   GotoMarkID:boolean; virtual;
      procedure  SaveMarkID;

      procedure  GotoBookmark;
      procedure  SaveBookmark;

      procedure  PrepareParam;
      procedure  ParamClearValue;
      procedure  DBQueryChangeSqlAfterFor(NewWhereSql:Widestring;IBFetchAll:Boolean=false);
      procedure  DBQueryChangeSql(NewSql:Widestring;Active:Boolean=True;IBFetchAll:Boolean=false);
      procedure  DBQueryRestoreFromMainSql( Active:Boolean=True;IBFetchAll:Boolean=false  );
      procedure  DBCommitedIB;

      procedure  DBLockCommitedIB;
      procedure  DBUnLockCommitedIB;
      
      procedure  DBScrollUnLock;
      procedure  DBScrollLock;
      procedure  DBReCalcFields;

      procedure  DBDelete( AskDelete:Boolean=true );
      procedure  DBPost;
      procedure  DBCancel;
      function   DBValue(FieldName:String):Variant;
      function   DBGetBooleanTrueValue( FieldName:String ):Variant;

      procedure  SetSavePositionDB( Endble: Boolean );
      Procedure  SaveDBPosition;virtual;
      function   GetElementIniFileName:string;
      Procedure  RestorePositionDBFromIni;virtual;
      procedure  SetMessageForAskDelete(aMessage:Widestring);
      procedure  AssignDBEvents(aFromDB,aToDB:TDataset);

      procedure  AddShemaElements( aElem:TDBShema; UseDetail:Boolean = True );
      procedure  ClearAllShemaElements;
      procedure  DeleteElementFromShemaElements(aElem:TDBShema);
      procedure  DBAddBlobFileData(fieldName,FileName:String);
      procedure  DBAddBlobData(fieldName:String;ValueStream:TMemoryStream);
      procedure  DBAddBlobDataString(fieldName:String;ValueStr:Widestring);
      function   DBLoadToImageFromBlobData(fieldName:String; ToImg:TImage; TypeImg:TImgTypes ):boolean;
      function   DBGetBlobData( fieldName:String ):TMemoryStream;
      function   DBGetBlobDataString( fieldName:String ):Widestring;
      function   GetValueByFieldName( fieldName:String ): Variant;
      function   GetValueByFieldNameStr( fieldName:String ): String;
      function   GetValueId:Variant;
      function   GetValueIdStr: String;
      function   DBGetAvailableIDForIB:Variant;
      procedure  SetActionInsertDBValue(Act:TUpdateValue);
      procedure  SetActionEditDBValue(Act:TUpdateValue);
      procedure  SetActionViewDBValue(Act:TUpdateValue);
      procedure  SetFunctionRefreshCurrData( aRefreshDB : TRefreshDB );

      procedure  AddFilterFunct( FilterAction : TOnFilterDB );
      procedure  ClearFilterFunct;
      procedure  Refilter;
      Procedure  DBAddValues(Fields:array of string;FieldValues:array of variant);
      procedure  SetAutoCommitedAfterPost(aAutoComited:Boolean);
      procedure  DBInsertCopyRow;
      procedure  DBSetStateToEdit;
      procedure  DBSetStateToInsert;
      function   DBLocate(const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions):boolean;
      function   DBLocateSimple( const KeyField: string; KeyValue: Variant ):boolean;
      function   DBLocateByKey(const KeyValues: Variant):boolean;
      procedure  DBDisableControls;
      procedure  DBEnableControls;
      function   DBGetParamConnect:TConnectDBParam;
      function   DBGetMainParamConnect:TConnectDBParam;

      Procedure  SetMasterDetail(Destroy:boolean=false);
      procedure  AddMainElem(AMailElem: TDBShema;afieldMainKod:String);
      procedure  AddDatailElem( ADetailElem:TDBShema );
      Procedure  DeleteDatailElem( ADetailElem:TDBShema );
      procedure  AddReletionTopElem(aReletionTopElem: TDBShema;afieldRelationTopKod:String);
      procedure  AddTranslationElem( aTranslateElem:TDBShema; ParamNameLangId:Widestring; FieldName,FieldNameTranslate:array of Widestring );
      procedure  DBChangeLanguage(IDLanguage:Variant);
      function   GetTranslationValue(FieldName:Widestring):Widestring;
      function   GetTranslationFiledName(FieldName:Widestring):Widestring;
      procedure  ViewActionValueDB;
      function   TestConnect:Boolean;

      procedure  SetValidateBeforePost( FunctValidate:TValidtateBeforePost );
      function   GetDBTableDescript:String;
      procedure  SetFieldNotUsedForCopy(aMasField:array of String);
      procedure  SetDefaultValue(  AMasField: array of String; aMasFieldValue: array of Variant; PriorForCopy:Boolean=false);
      Function   GetDefValue(aField:String):Variant;
      procedure  SetBeforeDeleteCheckFunct( aBeforeDeleteCheckFunct:Widestring );
      procedure  SetWebSynchronizeElem( aElem : TObject; aFieldForSynchronize:Array of Widestring; aFieldName:string; aCan:Boolean );
      procedure  SetUserElem( aElem : TDBShema; aFieldUserName:Widestring );
      procedure  SetLogTable( aTableNameLog, aStoredProcName : Widestring; aLogFieldNames : TLogFields;StyleMark:TcxStyle );

      procedure  AddIconToField( aViewFieldName,aValueFieldName:WideString;aValueImage:Variant; aImageList : TImageList; aImageWidth,aImageIndex:Integer; aImgPos:TImageCellPosition );
      procedure  SetMainIcon( aImageList : TImageList; aImageIndex:Integer );

      procedure  AddTranslateTable(TableName, FieldName, FieldIdParentName,FieldLndIdName,
                                   FieldChange: String; IdLocalUpdate:Variant;WidthColum:Integer=-1;IndTableTemplate:Integer=-1  );
      function   GetParamTranslateTableByFiedlName( FieldName:String ) : TTranslateOptions;
      function   GetParamsTranslateTable: TTranslateOptionsArr;
      procedure  AssignParamsTranslateTable(TranslateOptionsArr:TTranslateOptionsArr);
      function   GetMainParamTranslateTable:TTranslateOptions;
      function   DBRecordCount:Integer;
      procedure  WebSynchronizeCurrRowDB( CheckConnectToServer:Boolean = true; IncludeDetailElements:Boolean=false );
      procedure  WebSynchronizeDB( Progres:TProgressFormProp; CheckConnectToServer:Boolean = true; IncludeDetailElements:Boolean=false; MainShemaElem:TDBShema = nil );
      function   WebSynchronizeRow(CheckConnectToServer:Boolean = true; IncludeDetailElements:Boolean=false):Integer;
      procedure  SetUniqFieldNames( UniqFiedldNames:array of String );
      procedure  RemoveUniqFieldNames( UniqFiedldNames:array of String );
      //function   CheckRoleView(UserId:Integer):boolean;
      function   GetCurrManagerId:Integer;

      function   GetProgName(UsePath:Boolean=false):String;
      function   CheckRoleInsert( UserId:Integer=-1; ShowErrMess:Boolean = false ):boolean;
      function   CheckRoleUpdate( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
      function   CheckRoleDelete( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
      function   CheckRoleAny( UserId:Integer=-1; ShowErrMess:Boolean = false  ):boolean;

      //function   CheckRoleLogView(UserId:Integer):boolean;
      function   CheckRoleLogUpdate( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
      function   CheckRoleLogDelete( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
      function   CheckRoleLogAny( UserId:Integer=-1;ShowErrMess:Boolean = false  ):boolean;
      function   CheckRoleReadOnly( UserId:Integer=-1; ShowErrMess:Boolean = false ):boolean;

      procedure  RefreshPermisRole( UserId:Integer=-1;ShowErrMess:Boolean = false );
      procedure  WebSynchronizeDelRow( idDelRow:String; IncludeDetailElements:Boolean );

      procedure  ClearAllValueFromTemp;
      procedure  ClearAllValueFromTempByKey(aKey:string);

      procedure  DeleteValueFromTemp( aKey:string;IDValue:Integer = -1 );
      function   GetValueFromTemp( aKey:string; IDValue:Integer = -1 ):Variant;
      procedure  SetValueToTemp( aKey:string; Value:Variant; IDValue:Integer =-1 );
      procedure  InitializeTempValueByElement( aElem:TDBShema; aKey, aValueFieldName:String  );
      procedure  InitializeTempValueByElementByKeyField( aElem:TDBShema; aKeyFieldName, aValueFieldName:String );
      procedure  SetFunctionGenId( FunctionGenId:TGenIdFunct );
      procedure  SetShowUpdateForm(const Value: boolean);
      constructor Create(ADB: TDataset; ATableName, FieldKod:WideString; aGenIdName:String=''; aFieldNumber: String='');
      function   GetArrStafFieldArr:TVarArr; virtual;
      Destructor Close; virtual;
      function   Clone: TDBShema;overload;
      function   GetActiveCloneElem : TDBShema; overload;
      function   GetAllSameCloneObject : TList;

      property   OriginalDB:TDataset      read FOriginalDB  write FOriginalDB;
      property   DB:TDataset              read FGetDB       write SetDB;
      property   DS:TDatasource           read FGetDS       write SetDS;
      property   MainSQL:WideString       read FMainSQL     write setMainSQL;

      property   DetailCount:Integer      read FGetCountDetail ;
      property   Enabled:Boolean          read FEnabled    write FSetEnabled;
      property   TableName:WideString     read FTableName  write FSetTableName;
      property   FieldKod:WideString      read FFieldKod   write FSetFieldKod;
      property   FieldMainKod:Widestring  read FFieldMainKod write FSetFieldMainKod;
      property   FieldNumber:Widestring   read FFieldNumber write FSetFieldNumber;
      property   FieldRelationTopKod:Widestring read FfieldRelationTopKod write FSetFieldRelationTopKod;


      property   GeneratorIdName:Widestring   read FGenIdName;
      property   Name:string              read FName;
      property   MainElement:TDBShema     read FMainElem write FMainElem;
      property   RelationElement:TDBShema read FRelationTopElem ;
      property   TranslationElem:TDBShema read FTranslationElem;
      property   FieldNameTranslate:TFieldAsociateArr read FFieldNameTranslate;
      property   AskBeforeDelete :Boolean read FAskBeforeDelete write FSetAskBeforeDelete;
      property   WebSynchronize  :Boolean read FCanWebSynchronize write FSetCanWebSynchronize;
      property   Title           :WideString read FGetTitle;
      property   CurrUserId      :Integer read FCurrUserId write FCurrUserId;
      property   StyleMarkLog    :TcxStyle read FStyleMarkLog write FStyleMarkLog;
      property   DBBooleanValue[FieldName:String]  :Boolean  read FDBBooleanGetValue write FDBBooleanSetValue;
      property   UniqFieldNames : TStringList read FUniqFieldNames;
      property   UpdateForm : boolean read FShowUpdateForm write SetShowUpdateForm;
      //property   IsLock : boolean  read FIsLock write FIsLock;
      property   FunctionPrepareUpdateForm : TPrepareUpdateForm read FGetFunctionPrepareUpdateForm write FSetFunctionPrepareUpdateForm;

 end;

 TDBShemaView=class(TDBShema)
 private

   FCurrHitTest    : TcxCustomGridHitTest;
   FCurrHitTestCol : TcxCustomGridTableItem;
   FcxHintStyleController: TcxHintStyleController;
   FSortOrderCount : Integer;
   FCheckUniqFieldNames  : Boolean;
   FShowTotalGroupSummaryUnderColumn : Boolean;
   FGroupSummaryAlignmentUnderColumn : Integer;
   FGropuSummaryFontStyleUnderColumn : TFontStyles;

   FSaveColumnSort             : array of TSortViewColumn;
   FCellHintParamView          : array of TCellHintParamView;
   FButFirst:TButton;
   FButPrev:TButton;
   FButNext:TButton;
   FButLast:TButton;

   FSaveViewIndexRec           : Integer;
   FFunctSelectCheckInView     : TFuncSelectInView;
   FViewColumnCheck            : TList;
   FListExpandedGroup          : TStringList;
   FAutoRenomer                : Boolean;
   FCurrViewNumber             : Integer;
   FPrevDeleteIndex            : Integer;
   FView                       : TcxGridDBTableView;
   FViewList                   : TcxCustomGridTableView;

   FShowPrepareFormAfterInsert  :Boolean;
   FSearhTextByLikeInExtLUpCbox: Boolean;
   FSearhTextByAllColumnExtLUpCbox :Boolean;
   FDefNullValueExtLUpCbox      : Widestring;
   FShowDefNulValueWhenEmpty    : boolean;

   FPopUpMenuColumns           : array of TColumnPopUpMenuView;
   FColMouseCursor             : array of TColMouseCursor;

   PersonalCellDblClick        : TcxGridCellClickEvent;
   PersonalCellClick           : TcxGridCellClickEvent;
   PersonalViewMouseDown       : TMouseEvent;
   PersonalViewMouseMove       : TMouseMoveEvent;
   PersonalViewKeyDown         : TKeyEvent;
   PersonalFocusedRecordChanged: TcxGridFocusedRecordChangedEvent;
   PersonalCanFocusRecord      : TcxGridAllowRecordOperationEvent;
   PersonalDrawCell            : TcxGridTableDataCellCustomDrawEvent;
   PersonalEditValueChanged    : TcxGridCustomTableItemEvent;
   PersonalDrawColumnHeder     : TcxGridColumnCustomDrawHeaderEvent;
   PersonalDrawGroupSummary    : TcxGridGroupSummaryCellCustomDrawEvent;
   PersonlaColumnHeaderClick   : TcxGridColumnEvent;
   PersonlaFilterRecord        : TcxDataFilterRecordEvent;

   PersonalSortingChanged      : TNotifyEvent;
   PersonalFilterChange        : TNotifyEvent;

   PersonalExtLookupComboBoxListViewPropertiesEditValueChanged : TNotifyEvent;
   PersonalExtLookupComboBoxListViewPropertiesChange : TNotifyEvent;
   PersonalExtLookupComboBoxListViewPropertiesCloseUp : TNotifyEvent;
   PersonalExtLookupComboBoxListViewPropertiesInitPopup :TNotifyEvent;
   PersonalExtLookupComboBoxListPropertiesPopup:TNotifyEvent;

   FSelectedRecord             : array of integer;

   FShowDisabledGrid           : Boolean;
   FSaveBblClick               : TcxGridCellClickEvent;
   FCurrFocusRecChange         : TcxGridFocusedRecordChangedEvent;
   FFunctionFilterView         : TUpdateFilterView;
   procedure   FSetInputVgrid(aVGrid:TcxVerticalGrid);
   function    FGetInputVgrid:TcxVerticalGrid;
   Procedure   FCloneAssign( var aElem:TDBShemaView );overload;
   procedure   FSaveAndCorrectNumber;
   procedure   FViewRenomer;
   Procedure   FSavePosSelected;
   Procedure   FRestorePosSelected;

   procedure   AfterInsert(DataSet: TDataSet);  override;
   procedure   BeforeInsert(DataSet: TDataSet); override;
   procedure   BeforePost(DataSet: TDataSet); override;
   procedure   AfterPost(DataSet: TDataSet); override;
   procedure   BeforeEdit(DataSet: TDataSet); override;
   procedure   AfterEdit(DataSet: TDataSet); override;
   procedure   BeforeDelete(DataSet: TDataSet); override;
   procedure   AfterDelete(DataSet: TDataSet);  override;
   procedure   BeforeClose(DataSet: TDataSet); override;
   function    FGetViewGrid : TcxGrid;
   procedure   FUpdateOrder( NewOrder:Integer ); override;
   procedure   FPrepareViewPersonalEvent( Aview: TcxGridDBTableView );

   procedure   FReadPersonalEventsFromView( Aview: TcxGridDBTableView );
   procedure   FRestorePersonalEventsToView( Aview: TcxGridDBTableView );

   procedure   FPrepareView(Aview: TcxGridDBTableView);
   procedure   FPrepareOptionView( Aview: TcxCustomGridTableView );
   function    FGetPupMenuForColumn(Column:TcxCustomGridTableItem;MouseBut:TMouseButton):TPopupMenu;
   function    FGetMouseCursorForColumn(Column:TcxCustomGridTableItem):TCursor;
   function    FFindCheckColumnValueForRecord( item:TcxCustomGridTableItem; idValue:Variant ):Integer;

   procedure   FCheckColumViewCellClick( Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo );

   procedure   GridViewControllerSortingChanged(Sender: TObject);
   procedure   GridViewControllerFilterChanged(Sender: TObject);
   procedure   GridViewCanFocusRecord(
               Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; var AAllow: Boolean);
   procedure   GridViewFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord,
                                                      AFocusedRecord: TcxCustomGridRecord;ANewItemRecordFocusingChanged: Boolean);
   procedure   GridViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
                                             AShift: TShiftState; var AHandled: Boolean);

   procedure   GridViewCellClick( Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
                                 AShift: TShiftState; var AHandled: Boolean);

   function    FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
   procedure   FViewDrawFillRect(Sender: TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; ACanvas: TcxCanvas );
   function    FShowTextImageInCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
                                    ImageList:TImageList; ImageIndex:integer;PosImg:TImageCellPosition ):Boolean;

   procedure   FShowImageField(Sender: TcxCustomGridTableView;
               ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

   procedure   GridViewCustomDrawGroupSummaryCell(Sender: TObject;
               ACanvas: TcxCanvas; ARow: TcxGridGroupRow; AColumn: TcxGridColumn;
               ASummaryItem: TcxDataSummaryItem; AViewInfo: TcxCustomGridViewCellViewInfo; var ADone: Boolean);

   procedure   FSaveGroupExpanded;

   procedure   FSortingGroupedColumn( aSort: TcxDataSortOrder );

   procedure   GridViewDataControllerFilterRecord( ADataController: TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
   procedure   GridViewColumnHeaderClick(Sender: TcxGridTableView; AColumn: TcxGridColumn);
   procedure   GridViewCustomDrawCell( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
   procedure   GridViewCustomDrawColumnHeader( Sender: TcxGridTableView; ACanvas: TcxCanvas;
                                              AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
   procedure   GridViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   procedure   GridViewKeyEditKeyDown(Sender: TcxCustomGridTableView;
                                      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
                                      Shift: TShiftState);
   procedure   ViewMouseDown(Sender: TObject;Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
   procedure   ViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
   procedure   ViewMouseLeave(Sender: TObject);

   procedure   GridViewEditValueChanged( Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
   function    FUnselectAllFocusView( aView:TcxGridDBTableView = nil):Integer;
   procedure   FSetFocusRowView(IndFocusRow:Integer; aView:TcxGridDBTableView =nil );
   function    FFormingMasColsForAllColumns(IncludeNotVisible:Boolean):TMasCxColGrid;
   function    FFormingMasColByFieldNames( FieldNames:array of String ):TMasCxColGrid;
   Procedure   FSearchTextOnViewByColumns( AColName:TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false );

   procedure   FRemoveFieldFromFilterExtLookup( Sender: TObject );
   procedure   FExtLookupSerachLikeByFilter(Sender: TObject);
   procedure   FTourComboBoxPropertiesEditValueChanged( Sender: TObject );
   procedure   FExtLookupComboBoxListViewPropertiesChange( Sender: TObject);
   procedure   FExtLookupComboBoxListViewPropertiesCloseUp( Sender: TObject );
   procedure   FExtLookupComboBoxListViewPropertiesInitPopup( Sender: TObject );
   function    FSetNullValueForExtLookupComboBox(Sender: TObject ):Boolean;
   procedure   FExtLookupComboBoxListPropertiesPopup( Sender: TObject );

   Procedure   FAddfieldToVGrid( Column:TcxGridDBColumn; EditValue:Variant);
   procedure   FPrepareVGrid(aView:TcxGridDBTableView);
   Function    FUpdateForm( aView:TcxGridDBTableView; setPost:Boolean=true):boolean;

   function    FFindIndexCellHintByFieldName(FieldName:String):Integer;
   procedure   FPreparePersonalExtLookupComboBox;
   function    FFieldNumberIsSorted:Boolean;
   procedure   FPrepareFieldOrderColumnForUpdate;
   Procedure   FRequery(IBFetchAll:Boolean=False);override;

   Procedure   FCopyDataFromViewRecord(Arec:TcxCustomGridRecord;IndMas:Integer);
   procedure   FCopyRowFromView(Detail:boolean=false;AddMas:boolean=false);
   Function    FGetValueFromCopyMasForField(IndMas:Integer;aFieldName:String):Variant;
   function    FPasteDataToRow( AcceptField:Array of string;MyData:Array of TFieldValue ):String;
   procedure   FPasteRowToView(Detail:boolean=false);
   procedure   FSetAutoRenomer(const Value: Boolean);
   function    FCheckSameElem( aElem:TDBShemaView ):Boolean;
   function    FGetActiveCloneElem : TDBShemaView;
   function    FGetOwnerFormForView(aView:TcxGridDBTableView=nil):TForm;
 public
   FOwnerView      : TForm;

   procedure   FRestoreGroupExpanded;
   constructor Create(aDB: TDataset; aView: TcxGRidDBTableView; aTableName, aFieldKod:WideString; aGenIdName:String='';  aFieldNumber: String='');
   Destructor  Close; override;

   function    GetFocusedViewValue( FieldName:String; AViewInfo: TcxGridTableDataCellViewInfo  ):Variant;
   function    GetFocusedViewValueForFocusedItem:Variant;
   function    CopyClipboardFocusedViewValueForFocusedItem:Boolean;
   function    GetCountSortedColumn:Integer;
   Procedure   SaveDBPosition;override;
   procedure   ViewFocusRowIndex;
   Procedure   RestorePositionDBFromIni;override;
   function    FieldNumberIsSorted:Boolean;

   Procedure   SavePosSelected;
   Procedure   RestorePosSelected;

   procedure   SetCurrViewCellDblClickAndSavePrev( CurrDblClick:TcxGridCellClickEvent );
   procedure   RestoreViewCellDblClick;
   procedure   SetCurrViewCurrFocusRecChange( CurrFocusRecChange:TcxGridFocusedRecordChangedEvent );
   procedure   RestoreViewCurrFocusRecChange;

   Function    CloneView( Owner:TComponent; SetViewToElem:Boolean = True ) : TcxGridDBTableView;
   Function    CloneViewList( Owner:TComponent; SetViewToElem:Boolean = True ):TcxGridDBTableView;
   procedure   ShowStatusBarInfoRowCount;
   procedure   ViewSetEnabled( Enabled:Boolean );
   procedure   GridSetEnabled( aGrid:TcxGrid; Enabled:Boolean;LevelView:Integer = 0 );
   procedure   RefreshView;
   procedure   RepaintColumn( aColum: TcxGridColumn );

   procedure   ShowClearDetailData( aHide:Boolean) ;
   procedure   SaveDataFromInputForm( aView:TcxGridDBTableView; setPost:Boolean=true);
   procedure   AddFocusedRecordChanged(PersEvent: TcxGridFocusedRecordChangedEvent);
   function    ViewDBLocate(const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions): boolean;

   procedure   AddCellDblClick( PersEvent: TcxGridCellClickEvent);
   procedure   AddCellClick(PersEvent: TcxGridCellClickEvent);
   procedure   AddDrawCellView( PersEvent: TcxGridTableDataCellCustomDrawEvent);
   procedure   AddDrawColumnHeder( PersEvent: TcxGridColumnCustomDrawHeaderEvent );

   Procedure   VerticalGridPostValue;
   Function    GetVerticalGridFocusValue:variant;
   Function    GetVerticalGridGridByCaptionValue(CaptionRow:String):variant;
   Function    GetVerticalGridGridByFieldNameValue(FieldNameRow:String; aView:TcxGridDBtableView=nil;AutoPostValue:Boolean=true ):variant;
   procedure   UpdateVerticalGridByCaptionValue(Sender: TObject;CaptionRow:String;aValue:variant);
   procedure   UpdateVerticalGridByFieldNameValue(Sender: TObject;FieldNameRow:String;aValue:variant; aView:TcxGridDBtableView=nil);
   procedure   UpdateVerticalGridFocusValue(Sender: TObject;aValue:variant);
   procedure   UpdateVerticalGridFocusValueBlobFile( Sender: TObject; FileName:String );
   procedure   RefreshVerticalGridPrepareMaskField( aView:TcxGridDBtableView = nil);

   procedure   SetUpdateFilterView( aFunctionFilterView:TUpdateFilterView );
   function    GetVerticalFocusProperties:TcxEditorRow;
   procedure   SetFocusOnView( aView:TcxGridDBTableView = nil );
   procedure   UnFocusedOnView( aView:TcxGridDBTableView = nil );
   procedure   ViewSaveSortColumn;
   procedure   ViewRestoreSortColumn;
   procedure   ViewSetSortByField( aFieldName:String; Asc:Boolean=true );
   procedure   ShowEmptyDataOnView(En:boolean; aView:TcxGridDBTableView= nil);

   procedure   SetView(Aview: TcxGRidDBTableView );
   procedure   ClearView;
   procedure   FSetViewList( aView:TcxCustomGridTableView );
   procedure   SetFunctionSelectCheckInView( aFunct: TFuncSelectInView );
   function    GetView:TcxGRidDBTableView;
   procedure   DeleteRecordFromView;
   procedure   ViewShowFieldForTranslate(Show:Boolean);
   procedure   RefreshNavigationButton;
   procedure   ViewSelectAll;
   function    GotoMarkID:boolean; override;

   function    CheckColumnCanViewForSelect( ItemColumn: TcxCustomGridTableItem ):Boolean;
   procedure   AddCheckRecordBySelectColumn( Item:TcxCustomGridTableItem; idValue:Variant );
   procedure   ClearCheckRecordBySelectColumn( Item:TcxCustomGridTableItem );

   procedure   AddButtonToViewColumn( aFieldName:String; Act:TcxEditButtonClickEvent; ImageList:TImageList;ImageIndex:Integer=-1 );
   function    FindValueInView(FieldName:string;aValue:Variant):Integer;
   function    FindValuesInView(FieldName:array of string; aValue:array of Variant):Integer;
   function    MakeStrListForIdInView( FieldName:String ):TStringList;
   function    GetObjectCheckSelectedViewRow:TList;
   function    FindRecordIndexByIdValue(Id:Variant):Integer;
   function    FindFirstCheckSelectedColumn( aView:TcxGridDBTableView=nil ):TcxGridDBColumn;
   function    VisibleCheckColumn( aVisible:Boolean; aView:TcxGridDBTableView=nil ):boolean;
   function    VisibleOrderColumn( aVisible:Boolean ):boolean;
   function    CheckRecordBySelectColumn( Item:TcxCustomGridTableItem; idValue:Variant  ):boolean;
   Procedure   SearchTextOnViewByColumns( AColName:TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false );
   Procedure   SearchTextOnViewAllColumns( SearchText:Widestring; JustFromBeginStr:Boolean=false; SearchInNotVisibleColumn:Boolean=false );
   Procedure   SearchTextOnViewByFieldNames( FieldNames:array of String; SearchText:Widestring;JustFromBeginStr:Boolean=false );

   procedure   ViewScrollLock(IncludeDetailElements:Boolean);
   procedure   ViewScrollUnLock(IncludeDetailElements:Boolean);

   procedure   MoveDownRow;
   procedure   MoveUpRow;

   function    CheckMoveDownRow:Boolean;
   function    CheckMoveUpRow:Boolean;

   function    GetPupMenuForColumn(Column:TcxCustomGridTableItem;MouseBut:TMouseButton):TPopupMenu;
   Function    ShowUpdateForm(setPost:Boolean=true;aView:TcxGridDBTableView=nil):boolean;
   Function    ShowUpdateFormByViewList(setPost:Boolean=true):boolean;
   procedure   AddColumnHintParam( HintFieldName:string; FunGetHintText:TOnHintView );
   procedure   AddFieldMaskTemplate( MasMaskTemplate : TMasMaskTemplate );
   function    FindMaskTemplateFieldForField( aFieldName:string ):TMasMaskTemplate;
   function    GetMasMaskTemplateArr : TMasMaskTemplateArr;
   procedure   AddNavigationButton(ButFirts,ButPrev,ButNext,ButLast:TButton);
   procedure   ClearNavigationButton;
   Procedure   UpdateValuesForSelectRow(Fields:array of string; FieldValues:array of variant);
   procedure   AddPopUpMenuOnViewField(FieldName:string;PUpMenu:TPopUpMenu;MouseButton:TMouseButton);
   procedure   AddCursorOnMouseMoveColumn(FieldName:string;cursor:TCursor);
   procedure   SetFilterOnView( aFieldName:array of Widestring; aFilterValue:array of Variant;aUMOVA:array of Widestring;
               aBool: TcxFilterBoolOperatorKind=fboOr;AddFilter:Boolean=false );

   procedure   CopyRowsFromView(Detail:boolean=false;AddMas:boolean=false);
   procedure   PasteDataRowsToView(Detail:boolean=false);
   function    CanCopyDataRowsToView:Boolean;
   function    CanPasteDataRowsToView:Boolean;

   function    GetActiveCloneElemForInputVgrid:TDBShemaView;
   function    GetActiveCloneElem : TDBShemaView;overload;
   function    IsViewFocusedOnForm:Boolean;
   procedure   HideDataForFilterOnView(aHide:Boolean=True);
   procedure   ClearFilterOnView;
   function    IsFilterOnView:Boolean;
   procedure   SetShowFilterVisible(Filter:Boolean);
   procedure   SetShowDisabledGrid( ShowDisabled:Boolean );

   procedure   SetViewSummaryGroup(  ShowTotalUnderColumn: boolean=false;  AlignmentUnderColumn:Integer = cxAlignRight;FontStyle:TFontStyles=[] );
   procedure   ClearFilterOnViewList;
   procedure   SetFilterOnViewList( aFieldName:array of Widestring; aFilterValue:array of Variant;aUMOVA:array of Widestring;
               aBool: TcxFilterBoolOperatorKind=fboOr;AddFilter:Boolean=false );

   procedure   SetExtLookupComboBoxListView(aExtLupBox:TcxCustomExtLookupComboBox=nil; aListFieldName:String='';
                                            SearhTextByLike:Boolean=true; SearhTextByAllColumn:Boolean=false;
                                            ListView:TcxCustomGridTableView=nil;DefNullValue:Widestring='';
                                            ShowDefNulValueWhenEmpty:Boolean=false );
   procedure   FreeExtLookupComboBoxListView( aExtLupBox:TcxCustomExtLookupComboBox );
   function    GetArrStafFieldArr : TVarArr; override;
   function    Clone: TDBShemaView;overload;
   function    OwnerFormForView(aView:TcxGridDBTableView=nil):TForm;

   function    DBInsertByListView:Boolean;
   function    DBInsert( aUpdateForm:Boolean=False) : Boolean;
   function    DBEdit( aUpdateForm:Boolean=False  ): Boolean;
   Procedure   DBOpen( IBFetchAll:Boolean=False ); override;
   procedure   DBOpenWait( IBFetchAll:Boolean=False ); override;

   procedure   SaveViewIndexRow;
   procedure   GotoSavedViewIndexRow;

   property    View:TcxGRidDBTableView  read GetView     write SetView;
   property    ViewGrid:TcxGrid  read FGetViewGrid;
   property    ViewList:TcxCustomGridTableView  read FViewList     write FSetViewList;

   property    HitTest: TcxCustomGridHitTest read FCurrHitTest;
   property    HitTestCol:TcxCustomGridTableItem read FCurrHitTestCol;
   property    DBLastState: TActionLog read FBeforeStateAction;
   property    FocusedRecordChanged: TcxGridFocusedRecordChangedEvent read PersonalFocusedRecordChanged write PersonalFocusedRecordChanged;
   property    InputVgrid :TcxVerticalGrid  read FGetInputVgrid write FSetInputVgrid;
   property    AutoRenomer :boolean read FAutoRenomer write FSetAutoRenomer;
 end;
 //*****************************************************************************
 TDBShemaBandedView=class(TDBShemaView)
      function    GetView : TcxGRidDBBandedTableView;
      procedure   SetView( Aview: TcxGRidDBBandedTableView );
    public
      constructor Create(aDB: TDataset; aView: TcxGRidDBBandedTableView; aTableName, aFieldKod:WideString; aGenIdName:String='';  aFieldNumber: String='');

      property    View:TcxGRidDBBandedTableView  read GetView     write SetView;
 end;
 //*****************************************************************************
 TDBShemaTree=class(TDBShema)
 private

   FCurrHitTest   : TcxTreeListHitTest;
   FCurrHitTestCol: TcxTreeListColumn;
   FCurrHitNode   : TcxTreeListNode;
   FFieldParent   : WideString;
   FStyle         : TcxTreeListStyleSheet;
   FViewForClone  : TcxGridDBTableView;
   FAutoExpand    : Boolean;

   FLevelImageIndex     :array of TLevelTreeImageIndex;
   FValueTreeImageIndex :array of TValueTreeImageIndex;

   FTree:TcxDBTreeList;
   FShowGridPopUpMenuAsHitText : Boolean;
   FPopUpMenuColumns           : array of TColumnPopUpMenuTree;
   FColMouseCursor             : array of TColMouseCursorTree;

   FLockOnTreeChange           : boolean;
   FFieldShowImageIndex        : WideString;
   FOrderNumberForInsert       : Integer;

   procedure AfterInsert(DataSet: TDataSet);  override;
   procedure BeforeInsert(DataSet: TDataSet); override;
   procedure BeforePost(DataSet: TDataSet); override;
   procedure AfterPost(DataSet: TDataSet); override;
   procedure BeforeEdit(DataSet: TDataSet); override;
   procedure AfterEdit(DataSet: TDataSet); override;
   procedure BeforeDelete(DataSet: TDataSet); override;
   procedure AfterDelete(DataSet: TDataSet);  override;
   procedure BeforeClose(DataSet: TDataSet); override;

   procedure FUpdateOrder( NewOrder:Integer ); override;
   Function  FMoveNode(Node:TcxTreeListNode;Up:boolean):boolean;
   function  FGetOrderNumberForNode( Node:TcxTreeListNode ): integer;
   procedure FAddNode( OptAdd : TOptAddTreeNode; aParentIdDef:Variant  );

   function  FFieldNumberIsSorted:Boolean;
   function  FTreeGetValueIdNode(aNode:TcxTreeListNode):Variant;
   function  FLocateDBByID(ID:Variant):Boolean;

   function  FSetFreeSpaceForInsertNode( Node : TcxTreeListNode; IndexFree:Integer=2 ):integer;
   Function  FGetNextOrderForNode( Node:TcxTreeListNode):Integer;
   //procedure FReorderNode( aNode:TcxTreeListNode );

   Function  FUpdateForm( aView:TcxGridDBTableView; setPost:Boolean=true):boolean;
   procedure FReorderNodeLevel( aNode:TcxTreeListNode );
   function  FGetPupMenuForColumn(Column:TcxTreeListColumn;MouseBut:TMouseButton):TPopupMenu;
   procedure TreeTourSchedMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

   function  FGetSelectionColor(Sender: TcxCustomTreeList):TcxStyle;

   function  FShowTextImageInCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
                                 ImageList:TImageList;ImageWidth, ImageIndex:integer;PosImg:TImageCellPosition ):Boolean;

   function  FGetLevelImageIndexMas( FieldName:String; Level:Integer ):Integer;
   function  FGetFieldValueImageIndexMas( FieldName:String; Node:TcxTreeListNode ):Integer;
   procedure TreeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
   procedure FTreeDrawFillRect(Sender: TcxCustomTreeList; AViewInfo: TcxTreeListEditCellViewInfo; ACanvas: TcxCanvas );

   procedure FCustomDrawImageIndex(Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
   procedure FTreeDrawDataCell( Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean); virtual;
   procedure FTreeExit(Sender: TObject);
   function  FGetMouseCursorForColumn(Column:TcxTreeListColumn):TCursor;
   procedure TreeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
   function  FFormingMasColsForAllColumns( IncludeNotVisible:Boolean ):TMasCxColTree;
   function  FFormingMasColByFieldNames( FieldNames:array of String ):TMasCxColTree;
   Procedure FSearchTextOnTreeByColumns( AColName : TMasCxColTree; SearchText:Widestring; JustFromBeginStr:Boolean=false );
   procedure FPrepareVGrid( aTree:TcxDBTreeList; aView:TcxGridDBTableView );
   Procedure FAddfieldToVGrid( Column:TcxGridDBColumn; EditValue:Variant );
   function  FCheckSameElem( aElem:TDBShemaTree ):Boolean;
   function  FGetOwnerFormForTree( aTree:TcxDBTreeList=nil ):TForm;
   //*********Smart Check Column*********
   procedure FGetCheckFieldValueProperty( FieldCheck:String; var ValueCheck:Variant;var ValueUnCheck:Variant;var ValueGrayed:Variant );
   function  FGetCountChildCheckedForNode( aNode:TcxTreeListNode; FieldCheck:String; Checked:Variant ):Integer;
   procedure FCheckUncheckNode( wNode:TcxTreeListNode; FieldCheck:String; aChecked:Variant );
   procedure FCheckNodeAndChild( aNode:TcxTreeListNode; FieldCheck:String; Checked:Variant );

 public
   PersonalViewKeyDown         : TKeyEvent;
   PersonalTreeMouseDown       : TMouseEvent;
   PersonalCustomDrawCell      : TcxTreeListCustomDrawEditCellEvent;
   PersonalMouseMove           : TMouseMoveEvent;
   PersonalExitFromTree        : TNotifyEvent;


   constructor Create(ADB: TDataset; ATree:TcxDBTreeList; ATableName,aFieldKod:WideString;aGenIdName:String=''; aFieldNumber: String='');
   destructor  Close; override;

   Procedure  SaveDBPosition;override;
   Procedure  RestorePositionDBFromIni;override;
   procedure  SetFocusedTree(aNode:TcxTreeListNode=nil);
   procedure  TreeGotoFirst;
   procedure  TreeColapseAll;
   procedure  TreeExpandAll;

    function  FindLastElemForNode(Node:TcxTreeListNode):TcxTreeListNode;
   Function   ShowUpdateForm(setPost:Boolean=true):boolean;
   procedure  SaveDataFromInputForm( aView:TcxGridDBTableView; setPost:Boolean=true );
   function   DeleteNode(aNode:TcxTreeListNode;AskDelete:Boolean=true):Boolean;
   function   DeleteFocusedNode(AskDelete:Boolean=true):Boolean;
   function   TreeFocusedTopNode:TcxTreeListNode;
   function   TreeCountOnTopLevel:Integer;
   function   TreeNodeAllChildCount( aNode:TcxTreeListNode ):Integer;
   Procedure  SearchTextOnViewAllColumns( SearchText:Widestring; JustFromBeginStr:Boolean=false; SearchInNotVisibleColumn:Boolean=false );

   procedure  InsertNode;
   procedure  AppendNode;
   procedure  AddSubNode;
   procedure  AddNodeForParentId( ParentId:Variant );

   Function   CheckMoveNodeDown(Node:TcxTreeListNode=nil):boolean;
   Function   CheckMoveNodeUp(Node:TcxTreeListNode=nil):boolean;
   Function   MoveNodeDown(Node:TcxTreeListNode=nil):boolean;
   Function   MoveNodeUp(Node:TcxTreeListNode=nil):boolean;
   procedure  AddPopUpMenuOnTreeField(FieldName:string;PUpMenu:TPopUpMenu;MouseButton:TMouseButton);
   procedure  SetTree( aTree:TcxDBTreeList );
   function   FGetTree:TcxDBTreeList;
   procedure  RestorePersonalEventsToTree( aTree: TcxDBTreeList );
   procedure  ReadPersonalEventsFromtTree( aTree:TcxDBTreeList );

   function   GetFocusedTreeValueForFocusedItem:Variant;
   function   CopyClipboardFocusedViewValueForFocusedItem:Boolean;
   procedure  SetFieldColumnShowMainImage( aFieldName:String );
   procedure  AddCursorOnMouseMoveColumn(FieldName:string;cursor:TCursor);
   procedure  AddLevelImageIndexColumn(Level:Integer;FieldName:String;ImageList:TImageList;ImageWidth,ImageIndex:Integer;PosImg:TImageCellPosition=OptImgPosLeft);
   procedure  AddValueImageIndexColumn( FieldName,ColumnFieldNameForValue:String;Value:Variant; ImageList:TImageList;ImageWidth,ImageIndex:Integer;Level:Integer=-1; PosImg:TImageCellPosition=OptImgPosLeft );

   Procedure  SearchTextOnTreeByAllColumns( SearchText:Widestring;JustFromBeginStr:Boolean=false;SearchInNotVisibleColumn:Boolean=false);
   Procedure  SearchTextOnTreeByColumns( AColName : TMasCxColTree; SearchText:Widestring;JustFromBeginStr:Boolean=false );
   Procedure  SearchTextOnTreeByFieldNames(FieldNames:array of String; SearchText:Widestring;JustFromBeginStr:Boolean=false );

   procedure  CheckSmartNode( aNode:TcxTreeListNode; FieldCheck:String );overload;
   procedure  CheckSmartNode( aNode:TcxTreeListNode; FieldCheck:String;Value:Variant ); overload;
   procedure  CheckSmartFocusedNode( FieldCheck:String );
   procedure  RefreshSmartNode( aNode:TcxTreeListNode;FieldCheck:String );
   procedure  RefreshSmartNodesOnTree( FieldCheck:String );
   function   GetViewForClone:TcxGridDBTableView;
   function   GetActiveCloneElem:TDBShemaTree;overload;
   procedure  AddVirtualTreeParam( aFieldParent:String; aViewForClone:TcxGridDBTableView;
                                   aAutoExpand:Boolean; aStyle:TcxTreeListStyleSheet );

   procedure  AddDrawCellTree( PersEvent: TcxTreeListCustomDrawEditCellEvent );
   //function   GetDrawCellTree:TcxTreeListCustomDrawEditCellEvent;

   function   CheckCreateBand( aTree:TcxDBTreeList; IndexBand:Integer ):TcxTreeListBand;
   procedure  PreviewVirtualOnTree( aTree:TcxDBTreeList );
   procedure  DeactiveVirtualOnTree( aTree:TcxDBTreeList );

   procedure  HideDataForFilterOnTree(aHide:Boolean=True);
   procedure  ShowClearDetailData( aHide:Boolean ) ;
   Procedure  SetFilterOnTree( AFieldName:array of Widestring; FilterValue:array of variant;
                               UMOVA:array of Widestring; JustLevels: array of Integer; SetFilter:Boolean=true );
   Procedure  ClearFilterOnTree;
   function   FieldNumberIsSorted:Boolean;
   function   GetArrStafFieldArr:TVarArr;override;
   function   Clone: TDBShemaTree;overload;

   property   Tree:TcxDBTreeList read FGetTree write SetTree ;
   property   FieldParentTree:WideString read FFieldParent write FFieldParent;
   property   HitTestCol:TcxTreeListColumn read FCurrHitTestCol;
   property   AutoExpand:boolean read FAutoExpand write FAutoExpand;
 end;
 //****************************************************************************
 TDBShemaSynchronize = class(TDBShemaTRee)
 private
   FTableFieldsName : TTableFieldsNameArr;
   FElemFunctCallSoapWeb: TFunctCallSoapWeb;
   
   function  FIsSetTableFieldName(aTableName:String):integer;
   procedure FAddTableAndFieldName(aElem:TObject;  aTableName, aFieldId,aFieldName: WideString );
   function  FAddMergeDataToLog(aParentTable, aParentIdOperation, aTableName, aFieldNameId, IdOperationStr,UserIdStr:string; Reason:Integer):Integer;
   procedure FTreeDrawDataCell( Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);override;

 public
   constructor Create(aDB: TDataset; ATree:TcxDBTreeList; aTableName, aFieldKod:WideString; aGenIdName:String='';  aFieldNumber: String='');
   destructor Close;

   function  FindElemByTableName(aTableName:Widestring):TDBShema;
   procedure ShowMergeLog(isAdmin:Boolean=False; WriteLog:Boolean=false; ShowMessageError:Boolean = false; ShowWhenNotEmpty:Boolean=true);
   property  TableFieldsName:TTableFieldsNameArr  read FTableFieldsName;
 end;

 TShemaObj = record
     Elem :TDBShema;
     UseDetail:Boolean;
 end;
 PShemaObj = ^TShemaObj;

 TMergeClientTo1CByClientId = function ( ParamSynchr : PParamSynchr; ClientId:Integer ):Integer;stdcall;
 TShowMergeLog1C = procedure ( ParamSynchr : PParamSynchr; IsAdmin:Boolean );stdcall;

 var AllElemnts    :TList;
     ElemUserRole  : TRoleShema;
     IconApplication : TIcon;
     TimerPingServer : TTimerPingServer;
     StatusBarInfo   : TStatusBarInfo;
     progressPingServer : TProgressFormProp;
     ActiveFormBeforeEditData : TForm;
 IBDatabaseList : TList;// TIBDatabase;

 Procedure DestroyDB(aDB:TDataset);
 Function  PrepareFormatPrice( PriceValue:Double; CurrencyName:String ):String;
 procedure InitStatusBar( aStBar:TStatusBar );
 procedure DeactiveStatusBar;
 Function  CreateColumnOnView( aView:TcxGridDBTableView;FieldName:string; Position:Integer;aWidth:Integer=100;
                              Sorting:Boolean=True;Moving:Boolean=True ):TcxGridDBColumn;
 function  GetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
 Function  CreateBandedColumnOnView( aView:TcxGridDBBandedTableView;FieldName:string; BandedPosition, Position:Integer;aWidth:Integer=100;
                             Sorting:Boolean=True;Moving:Boolean=True ):TcxGridDBBandedColumn;
 procedure CloneAllFieldsDataset( FromDataset,ToDataset:TDataset; AddToDataset:Boolean );
 procedure CreateCalcField( NewNameField:String;Dataset:TDataset;DataType:TFieldType; Size:Integer; AddToDataset:Boolean );
 procedure AddFieldsToDataset(CurrDB:TDataset);
 procedure AddFieldsToDatasetFromArr( CurrDB:TDataset; ArrField:TArrFieldsParam );
 function  FieldsToArray( CurrDB:TDataset ):TArrFieldsParam;
 procedure CreateLookUpField(NewNameField:String;Dataset:TDataset;KeyField:String;
           LookUpDataset:Tdataset;LookUpKeyField:String;LookupResultField:String;DataType:TFieldType;Size:integer; AddToDataset:Boolean );
 procedure SetReadOnlyFieldOnDataset(CurrDB:TDataset;ReadOnly:Boolean);
 procedure DataSetToXML( DataSet  : TDataSet; const FileName:string; FormatFile: TDataPacketFormat=dfXMLUTF8 );
 function  GetValueFromRecord(FieldName:String;AView:TcxGRidDBTableView; IndRecord:Integer):Variant;
 function  PrepareTextToView(aText:WideString;Acanvas:TcxCanvas;WidthArea:Integer):WideString;
 procedure ViewDrawFillForRect(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; aRect: Trect; ACanvas: TcxCanvas );
 procedure ViewDrawFillRect(Sender: TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; ACanvas: TcxCanvas );
 procedure TreeDrawFillRect(Sender: TcxCustomTreeList; AViewInfo: TcxTreeListEditCellViewInfo; ACanvas: TcxCanvas );
 function  ShowTextImageInCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
                               ImageList:TImageList; ImageIndex:integer;PosImg:TImageCellPosition; aChangeOnText:Widestring='' ):Boolean;
 function  ShowTextImageInCellTree(Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
                                  ImageList:TImageList; ImageWidth, ImageIndex:integer;PosImg:TImageCellPosition ):Boolean;

 function  GetColumnFromViewByName(Aview:TcxGridDBTableView;ColumnName:TComponent):TcxGridDBColumn;
 function  ShowTextImageInCellFromFile( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
                                        var AViewInfo: TcxGridTableDataCellViewInfo; FileName:String;
                                        PosImg:TImageCellPosition;ShowText:Boolean=True; StretchToCell:Boolean=False  ):Boolean;
 function  ShowTextImageInCellFromBlobValue(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
                                     var AViewInfo: TcxGridTableDataCellViewInfo;
                                     ValuePicBin:string;PosImg:TImageCellPosition; ShowText:Boolean=True; StretchToCell:Boolean=False ):Boolean;

 Function  DBHaveWHere(CurrDB:TDataset):Boolean;
 Procedure RequeryOnePosRecordAdo(CurrDB:TDataset;aTableName,AliesTable,FieldKod:String;RequeryStr:String='');
 procedure CheckDBOnOpen;
 procedure SaveDBPositionElements;
 function  FindElementByDataset(aDataset:TDataset):TDBShema;
 function  FindElementByView( aView:TcxCustomGridView ) : TDBShemaView;
 function  FindElementByTree( aTree:TcxDBTreeList ) : TDBShemaTree;
 function  FindElementByVerticalGrid( aInputVgrid :TcxVerticalGrid  ) : TDBShema;
 function  FindElementByParentPreview( aPreview:TcxCustomGridView ) : TDBShema; overload;
 function  FindElementByParentPreview( aPreview:TcxDBTreeList ) : TDBShema; overload;

 function PreparePMenuForElementByParentPreview( aPreview:TcxCustomGridView; Act:TNotifyEvent ):boolean; overload;
 function PreparePMenuForElementByParentPreview( aPreview:TcxDBTreeList; Act:TNotifyEvent ):boolean; overload;
 procedure PreparePMenuForComponentForm( Owner:TWinControl; Act:TNotifyEvent; AcceptClassName:array of TClass ) ;

 procedure FreeAllElements;
 procedure SetLogForAllElements( ElemUser:TDBShema;FieldUserName,TableNameLog,ProcAddName:string; LogFieldNames : TLogFields; StyleMark:TcxStyle );
 Function  ExecFunctDLL( DllName, FunctonName:String; ParamFunct:TDllFunct; paramFun:Pointer ) : Variant;
 procedure SetFilterOnWievForManyColumns(Aview:TcxGridDBTableView;AFieldName:array of Widestring;FilterValue:array of variant; UMOVA:array of Widestring;
                                         aBool:array of TcxFilterBoolOperatorKind;BoolSection:TcxFilterBoolOperatorKind=fboOr; SetFilter:Boolean=true;AddFilter:Boolean=false);

 procedure SetFilterOnWievForAllColumns( aView:TcxGridDBTableView; FilterValue: Variant;  UMOVA:array of Widestring; IncludeNotVisible : boolean );                                        
 procedure SetFilterOnTreeForManyColumns( ATree:TcxDBTreeList;AFieldName:array of Widestring; FilterValue:array of variant;
                                          UMOVA:array of Widestring; JustLevels: array of Integer; SetFilter:Boolean=true );

 Function  GetIndexColByCaptionFromWiew(ACaption:String;AView:TcxGRidTableView):integer;
 function  CheckUniqFieldNames( Elem:TDBShema; aView:TcxGridDBTableView ) : Boolean;
 Procedure SearchTextOnViewByArrColumns( aView:TcxGridDBTableView; FieldNames : array of String; SearchText:Widestring;JustFromBeginStr:Boolean=false );
 Procedure ViewSearchTextByColumns( aView:TcxGridDBTableView; AColName : TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false );
 Procedure SearchTextOnViewByAllColumns( aView:TcxGridDBTableView; SearchText:Widestring;JustFromBeginStr:Boolean=false;IncludeNotVisible:Boolean=false );
 procedure UpdateLanguageFieldNameValue( ElemMain : TDBShema; TableTranslate,FieldIdParentName,FieldLndIdName,FieldName,FieldChange :string;
                                         ValueName:string;idMain, idLngUpdate:Variant; StatusChange:Integer );
 procedure ShowLogCore( DBParam: TConnectDBParam; aFormActive:TForm; MenId,ObjId:Integer; Tables:array of String; StyleMark:TcxStyle );
 function GetDBSql(CurrDB:TDataset):string;
 function GetDataBaseIBParam(CurrDataBaseIB:TIBDatabase):TConnectDBParam;
 function GetDBParam( aDB:TDataset):TConnectDBParam;
 function MakeDBParam( PathDB,UID,Password:string;DataBase:TDatabase;DataBaseIB:TIBDatabase;DataBaseADOCon:TADOConnection ):TConnectDBParam;
 function MakeDBParamIB(DataBaseIB:TIBDatabase):TConnectDBParam;
 procedure QueryChangeSQL(ADB:TDataset;NewSQL:Widestring);
 //function GetSubPathDependOnConnectionDatabase(aDB:TDataset):string;
 function DBGetValue(ConDBParam:TConnectDBParam; Sql, FieldResultName:string ):Variant;
 function DBCreate( Sql:string; DSMasterDetail:TDatasource; DBParam:TConnectDBParam; Active:Boolean=True ):TDataset;
 function DBUpdate( Sql:string; DBParam:TConnectDBParam ):Integer;
 procedure DBUpdateList( SLQList:TStringList; DBParam:TConnectDBParam );
 procedure DBSetParamValue( aDB:TDataset; ParamName:String;ParamValue:Variant );
 function  DBGetParamValue( aDB:TDataset; ParamName:String ):Variant;
 procedure SetMasterSource(aDB:TDataset; DS:TDatasource);
 function GetDBSqlPath(aDB:TDataset):string;
 function GetAliesTableFromSQL( Sql, TableName : Widestring ):string;
 Function DBRemoveWhereSql(var Sql:Widestring;KeyRemove:string='Where';All:Boolean=false  ):boolean;
 function GetCurrOptConnect(aDBParam:TConnectDBParam):TOptTypeConnect;
 Function GetTypeConnectionADO( aCon:TADOConnection ): TOptTypeConnect;
 function GetTypeConnectionADOStr(aConStr:String):TOptTypeConnect;
 Function GetTypeConnection(aDB:TDataset): TOptTypeConnect;
 Procedure AddToMemData( MD:TdxMemData; KeyData:TFieldValue;Values: array of TFieldValue );
 procedure SetViewEnabled( aView:TcxGridDBTableView; Enabled:Boolean );
 procedure SetGridEnabled( aGrid:TcxGrid; Enabled:Boolean; LevelView:Integer = 0 );
 function GetSqlWithoutAfterFrom(ADB:TDataset ):Widestring; overload;
 function GetSqlWithoutAfterFrom(aStr:Widestring; All:Boolean=false ):Widestring;overload;
 function  DBBooleanVariantValue( aValue :Variant ):Boolean;
 procedure DBBooleanSetValue( aDB:TDataset; FieldName:String; value:Boolean );
 function  DBBooleanGetValue( aDB:TDataset; FieldName:String):Boolean;
 function  DBBooleanTrueValue( aDB:TDataset;FieldName:String ):variant;
 function  FindValuesInViewByField( aView:TcxGridDBTableView; FieldName:array of string; aValue:array of Variant ):integer;
 function  CheckMoveUpRow(aElem:TDBShema):Boolean;
 function  CheckMoveDownRow(aElem:TDBShema):Boolean;
 procedure MoveDowRow(aElem:TDBShema);
 procedure MoveUpRow(aElem:TDBShema);

 function  FieldNumberIsSorted(aElem:TDBShema):Boolean;
 function  FieldColumnWidth(aElem:TDBShema;FieldColumn:String):Integer;
 function  FieldColumnVisible(aElem:TDBShema;FieldColumn:String):Boolean;
 function  FieldColumnCaption(aElem:TDBShema;FieldColumn:String):Widestring;
 procedure SetColumnExtLookupComboBoxPropertiesTree( Column:TcxDBTreeListColumn; KeyField, ListFieldName:String;
                                                     View:TcxGridDBTableView );
 procedure SetColumnExtLookupComboBoxPropertiesView( Column:TcxGridDBColumn; KeyField, ListFieldName:String;
                                                      View:TcxGridDBTableView );
 Function ShowUpdateFormForElem( aElem:TDBShema; aView:TcxGridDBTableView; setPost:Boolean=true):boolean;
 function TreeFindLastElemForNode( Node:TcxTreeListNode; JustVisible:boolean = True ):TcxTreeListNode;
 function TreeFindLevelElemForNode( Node:TcxTreeListNode; Level:Integer; JustVisible:boolean = True ):TcxTreeListNode;
 function TreeCompareNodesByFieldValue( Node1, Node2:TcxTreeListNode;FieldName1,FieldName2:String ):Boolean;
 function CreateSaveListId(AView:TCxGridDBTableView;FieldId:String):TStringList;
 procedure ViewRestorePositionDBFromIni( aView:TcxgridDBTableView; IniDBSavePosition:string );
 procedure ViewSavePositionDBToIni( aView:TcxgridDBTableView; IniDBSavePosition:string );
 Function ViewClone( Owner:TComponent; aView:TcxGridDBTableView ):TcxGridDBTableView;
 function GetStructRecLogFiles:TLogFields;
 function DBCreateStoredProcDataSet( DBParam:TConnectDBParam; StoredProcName:widestring;
                                    ParamInputName:array of Widestring; ParamInputFieldType:array of TFieldType ):TDataSet;
 procedure DBDestroyStorProc( DataSet  : TDataSet );
 procedure DBStoredProcExec( DataSet  : TDataSet );
 function  GetViewSelectedValue(aView:TcxGridDBTableView;FieldName:string;SelectedIndex:Integer):Variant;
 Procedure SetFilterOnWievForColumnsCX (Aview:TcxGridTableView;AColumnName:array of TcxGridColumn;FilterValue: array of Variant;UMOVA:array of Widestring;
                                        Bool:array of TcxFilterBoolOperatorKind;BoolSection:TcxFilterBoolOperatorKind=fboOr;SetFilter:Boolean=true;AddFilter:Boolean=false);

 procedure FindConInDBShemaText(TextPathFind:String);
 function CreateField( DataType:TFieldType; Size:Integer; Dataset:TDataset; NewNameField:String ):TField;
 procedure CopyElemNameForAdmin( ForComponent:TComponent );
 function GetUni: String;
 implementation

uses
  IBCustomDataSet,UnitInputData, Types, UnitFunctLog, UnitGenerateElementsCore;

{ TDBShema }
//******************************************************************************
function GetUni: String;
var id:TGUID;
begin
 if CoCreateGuid(Id) = s_OK then
    result := GUIDToString (Id)
     else result:='';
end;
//******************************************************************************
function GetStructRecLogFiles:TLogFields;
begin
  result.FieldID              := 'ID';
  result.FieldApplicationName := 'APLICATION';
  result.FieldIconApplication := 'APPLICATIONICON';
  result.FieldTitleElem       := 'TITLE';
  result.FieldTableName       := 'TABLENAME';
  result.FieldKeyFieldId      := 'KEYFIELDID';
  result.FieldIDObject        := 'OBJID';
  result.FieldIDUser          := 'USERID';
  result.FieldAction          := 'TYPEACTION';
  result.FieldDATE            := 'ADATE';
  result.FieldDATA            := 'ADATA';
  result.FieldFormName        := 'FORMNAME';
  result.FieldFormCaption     := 'FORMCAPTION';
end;
//******************************************************************************
procedure FindConInDBShemaText(TextPathFind:String);
var i:Integer;
begin
  for i:=0 to AllElemnts.count -1 do
  begin
     if TDBShema(AllElemnts.Items[i]) <> nil then
      if AnsiPos( TextPathFind, TDBShema(AllElemnts.Items[i]).DBGetParamConnect.PathDB )<> 0  then
        begin
          ShowMessage( TDBShema(AllElemnts.Items[i]).Name );
        end;
  end;
end;
//******************************************************************************
Function ViewClone( Owner:TComponent; aView:TcxGridDBTableView ):TcxGridDBTableView;
var i:Integer;
    aOlderView:TComponent;
    NewName:String;
    SaveActiveForm:TForm;
begin
  SaveActiveForm := ActiveFormBeforeEditData;
  try
    Randomize;
    NewName := aView.Name + '_Clone'+ IntToStr( Random(1000) );

    if Owner <> nil then
    begin
      aOlderView := Owner.FindComponent( NewName );
      if aOlderView <> nil then
        aOlderView.Free;
    end;

    Result := TcxGridDBTableView.Create( Owner );
    Result.Name := NewName;

    for i:=0 to aView.ColumnCount-1 do
      Result.CreateColumn.Assign( aView.Columns[i] );

    Result.DataController.DataSource:= aView.DataController.DataSource;
    Result.DataController.KeyFieldNames:= aView.DataController.KeyFieldNames;
    Result.DataController.MasterKeyFieldNames:= aView.DataController.MasterKeyFieldNames;

    Result.DataController.Assign( aView.DataController );
    Result.OptionsBehavior.Assign( aView.OptionsBehavior );
    Result.OptionsCustomize.Assign( aView.OptionsCustomize );
    Result.OptionsData.Assign( aView.OptionsData );
    Result.OptionsSelection.Assign( aView.OptionsSelection );
    Result.OptionsView.Assign( aView.OptionsView );
    Result.Styles.Assign( aView.Styles );
    Result.PopupMenu := aView.PopupMenu;
    Result.Preview := aView.Preview;
  
    if aView.DataController.Filter.Active then
      Result.DataController.Filter.Assign( aView.DataController.Filter );

    //Result.Assign( aView );  Я заремив - вилітало !!!
  finally
     ActiveFormBeforeEditData := SaveActiveForm;
  end;
end;
//******************************************************************************
procedure ViewRestorePositionDBFromIni( aView:TcxgridDBTableView; IniDBSavePosition:string );
var TopRowIndex:Integer;
    ValueStr:String;
begin
  if aView = nil  then exit;
  if not (aView.Site.Parent is TcxGrid) then exit;
  if ( aView.DataController.DataSource<>nil ) and (aView.DataController.DataSource.DataSet<>nil) and
    ( not aView.DataController.DataSource.DataSet.Active ) then exit;

  //ValueStr := ReadIniFile( IniDBSavePosition, 'PositionView', aView.Name );
  //if ( ValueStr<>'' ) and ( IsStrANumber( ValueStr , true ) ) then
    //aView.Controller.TopRowIndex := StrToInt(ValueStr);
  if aView.DataController.FocusedRecordIndex >=0 then
    aView.Controller.TopRowIndex := aView.DataController.GetRowIndexByRecordIndex( aView.DataController.FocusedRecordIndex, True );
end;
//******************************************************************************
procedure ViewSavePositionDBToIni( aView:TcxgridDBTableView; IniDBSavePosition:string );
begin
  if ( aView<>nil ) then
    CreateIniFile( IniDBSavePosition, 'PositionView', aView.Name, IntToStr(aView.Controller.TopRowIndex) );
end;
//******************************************************************************
function FieldColumnWidth(aElem:TDBShema;FieldColumn:String):Integer;
begin
  if aElem is TDBShemaView then Result := TDBShemaView(aElem).View.GetColumnByFieldName(FieldColumn).Width;
  if aElem is TDBShemaTree then Result := TDBShemaTree(aElem).Tree.GetColumnByFieldName(FieldColumn).Width;
end;
//******************************************************************************
function FieldColumnVisible(aElem:TDBShema;FieldColumn:String):Boolean;
begin
  if aElem is TDBShemaView then Result := TDBShemaView(aElem).View.GetColumnByFieldName(FieldColumn).Visible;
  if aElem is TDBShemaTree then Result := TDBShemaTree(aElem).Tree.GetColumnByFieldName(FieldColumn).Visible;
end;
//******************************************************************************
function FieldColumnCaption( aElem:TDBShema; FieldColumn:String ):Widestring;
begin
  if aElem is TDBShemaView then Result := TDBShemaView(aElem).View.GetColumnByFieldName(FieldColumn).Caption;
  if aElem is TDBShemaTree then Result := TDBShemaTree(aElem).Tree.GetColumnByFieldName(FieldColumn).Caption.Text;
end;
//******************************************************************************
function FieldNumberIsSorted(aElem:TDBShema):Boolean;
begin
  if aElem is TDBShemaView then Result := TDBShemaView(aElem).FieldNumberIsSorted;
  if aElem is TDBShemaTree then Result := TDBShemaTree(aElem).FieldNumberIsSorted;
end;
//******************************************************************************
function CheckMoveUpRow(aElem:TDBShema):Boolean;
begin
  if aElem is TDBShemaView then Result := TDBShemaView(aElem).CheckMoveUpRow;
  if aElem is TDBShemaTree then Result := TDBShemaTree(aElem).CheckMoveNodeUp;
end;
//******************************************************************************
function CheckMoveDownRow(aElem:TDBShema):Boolean;
begin
  if aElem is TDBShemaView then Result := TDBShemaView(aElem).CheckMoveDownRow;
  if aElem is TDBShemaTree then Result := TDBShemaTree(aElem).CheckMoveNodeDown;
end;
//******************************************************************************
procedure MoveUpRow(aElem:TDBShema);
begin
  if aElem is TDBShemaView then TDBShemaView(aElem).MoveUpRow;
  if aElem is TDBShemaTree then TDBShemaTree(aElem).MoveNodeUp;
end;
//******************************************************************************
procedure MoveDowRow(aElem:TDBShema);
begin
  if aElem is TDBShemaView then TDBShemaView(aElem).MoveDownRow;
  if aElem is TDBShemaTree then TDBShemaTree(aElem).MoveNodeDown;
end;
//******************************************************************************
procedure ShowLogCore( DBParam: TConnectDBParam; aFormActive:TForm; MenId, ObjId:Integer; Tables:array of String; StyleMark:TcxStyle );
var i : Integer;
    TableNames:TVarArr;
begin
  SetLength( TableNames, Length( Tables ) );
  for i:=0 to Length(Tables)-1 do TableNames[i] := Tables[i];

  LogShow( DBParam, aFormActive, MenId, ObjId, TableNames, StyleMark );
end;
//******************************************************************************
procedure InitStatusBar( aStBar:TStatusBar );
begin
  StatusBarInfo := TStatusBarInfo.Create( aStBar );
end;
//******************************************************************************
procedure DeactiveStatusBar;
begin
  if StatusBarInfo<>nil then StatusBarInfo.Close;
end;
//******************************************************************************
procedure InitTimerPingServer;
begin
  TimerPingServer := TTimerPingServer.Create;
end;
//******************************************************************************
procedure DeactiveTimerPingServer;
begin
  TimerPingServer.Close;
end;
//******************************************************************************
function GetSubPathDependOnConnectionDatabaseADOStr(aConStr:String):string;
begin
  if AnsiPos( UpperCase('Driver=Firebird'), UpperCase( aConStr) ) <> 0 then Result :='IB'
  else Result :='ADO';
end;
//******************************************************************************
function GetSubPathDependOnConnectionDatabaseADO(aCon:TADOConnection):string;
begin
  if aCon <> nil then
    result := GetSubPathDependOnConnectionDatabaseADOStr(aCon.ConnectionString)
  else result := '';
end;
//******************************************************************************
function GetSubPathDependOnConnectionDatabase(aDB:TDataset):string;
begin
  if aDB is TIBCustomDataSet then Result :='IB'
  else
  if aDB is TCustomADODataSet then
    result := GetSubPathDependOnConnectionDatabaseADO(TCustomADODataSet(aDB).Connection);
end;
//******************************************************************************
Function GetTypeConnectionADO(aCon:TADOConnection): TOptTypeConnect;
begin
  if GetSubPathDependOnConnectionDatabaseADO( aCon ) = 'IB' then result := optTypeConIB;
  if GetSubPathDependOnConnectionDatabaseADO( aCon ) = 'ADO' then result := optTypeConADO;
end;
//******************************************************************************
function GetTypeConnectionADOStr(aConStr:String):TOptTypeConnect;
begin
  if GetSubPathDependOnConnectionDatabaseADOStr( aConStr ) = 'IB' then result := optTypeConIB;
  if GetSubPathDependOnConnectionDatabaseADOStr( aConStr ) = 'ADO' then result := optTypeConADO;
end;
//******************************************************************************
Function GetTypeConnection(aDB:TDataset): TOptTypeConnect;
begin
  if GetSubPathDependOnConnectionDatabase( aDB ) = 'IB' then result := optTypeConIB
  else
    if GetSubPathDependOnConnectionDatabase( aDB ) = 'ADO' then result := optTypeConADO
    else result := optTypeConUnknown;
end;
//******************************************************************************
function MakeDBParam(PathDB,UID,Password:string;DataBase:TDatabase;DataBaseIB:TIBDatabase;DataBaseADOCon:TADOConnection ):TConnectDBParam;
begin
  result.PathDB := PathDB;
  result.UID := UID;
  result.Password := Password;
  result.DatabaseConnection := DataBase;
  result.IBDatabaseConnection := DataBaseIB;
  result.ADOConnection := DataBaseADOCon;
end;
//******************************************************************************
function MakeDBParamIB(DataBaseIB:TIBDatabase):TConnectDBParam;
var PathDB, UID, Password:String;
begin
  GetParamDatabaseIB( DataBaseIB, PathDB, UID, Password );
  result:= MakeDBParam(PathDB,UID,Password,nil, DataBaseIB,nil );
end;
//******************************************************************************
function GetDataBaseIBParam(CurrDataBaseIB:TIBDatabase):TConnectDBParam;
begin
  if CurrDataBaseIB<>nil then
  begin
    result.PathDB  :=CurrDataBaseIB.DatabaseName;
    Result.UID     :=CurrDataBaseIB.Params.Values['user_name'];
    result.Password:=CurrDataBaseIB.Params.Values['password'];
    Result.IBDatabaseConnection := CurrDataBaseIB;
  end;
end;
//******************************************************************************
function GetDBParam(aDB:TDataset):TConnectDBParam;
var CurrDataBase:TDatabase;
    CurrDataBaseIB:TIBDatabase;
    CurrDataBaseADOCon:TADOConnection;
    PatDB, UID, Password:String;
begin
  CurrDataBase:=nil;
  CurrDataBaseIB:=nil;
  Result.DatabaseConnection := nil;
  Result.IBDatabaseConnection := nil;
  Result.ADOConnection := nil;
  //********************************************************
  if aDB is TTable then CurrDataBase := TTable(aDB).Database;
  if aDB is TQuery then CurrDataBase := TQuery(aDB).Database;

  if aDB is TIBCustomDataSet then CurrDataBaseIB := TIBCustomDataSet(aDB).Database;
  if aDB is TCustomADODataSet then CurrDataBaseADOCon := TCustomADODataSet(aDB).Connection;

  Result.TypeConnect := GetTypeConnection(aDB);
  //********************************************************
  if CurrDataBase<>nil then
  begin
    result.PathDB   := CurrDataBase.Params.Values['SERVER NAME'];
    Result.UID      := CurrDataBase.Params.Values['user name'];
    result.Password := CurrDataBase.Params.Values['password'];
    Result.DatabaseConnection := CurrDataBase;
  end;
  //********************************************************
  if CurrDataBaseIB<>nil then result := GetDataBaseIBParam(CurrDataBaseIB);

  if CurrDataBaseADOCon<>nil then
  begin
    GetParamDatabaseADO( CurrDataBaseADOCon, PatDB, UID, Password );

    result.PathDB:= PatDB;
    result.UID := UID;
    result.Password := Password;
    Result.ADOConnection := CurrDataBaseADOCon;
  end;
end;
//******************************************************************************
function GetCurrOptConnect(aDBParam:TConnectDBParam):TOptTypeConnect;
begin
  if aDBParam.IBDatabaseConnection<>nil then result := optTypeConIB
  else result := optTypeConADO;
end;
//******************************************************************************
function GetDBSqlPath(aDB:TDataset):string;
var SubPath:String;
begin
  SubPath:=GetSubPathDependOnConnectionDatabase( aDB );
  if (aDB.Owner <> nil)and(SubPath<>'') then
    Result := ExtractFilePath( Application.ExeName )+'SCRIPTS\'+ SubPath+ '\'+ aDB.Owner.Name +'\'
  else Result :='';  
end;
//******************************************************************************
function DBRemoveProcFromSqlAfterFrom( Sql:Widestring ):Widestring;
var i:Integer;
    StartBrackets : Integer;
    EndBrackets : Integer;
    BeginProc:Integer;
    EndProc:Integer;
    ProcValue:WideString;
begin
  StartBrackets := AnsiPos('(', Sql);
  EndBrackets := AnsiPos(')', Sql);
  if (StartBrackets<>0)and(EndBrackets<>0) then
  begin
    for i:=StartBrackets downto 1 do
    begin
      BeginProc := i;
      if ( Ord(Sql[i]) in [ 32, 10 ])  then Break;
    end;

    for i:=EndBrackets to Length(Sql) do
    begin
      EndProc := i;
      if ( Ord(Sql[i]) in [ 32, 10 ])  then Break;
    end;

    ProcValue:= Copy(Sql, BeginProc,EndProc-BeginProc);
    ReplaseON(Sql,ProcValue,'');
  end;

  result := Sql;
end;
//******************************************************************************
function GetAliesTableFromSQL( Sql, TableName : Widestring ):string;
var StartFrom:Integer;
function GetStartIndexFrom( aSql:WideString ):Integer;
var i:Integer;
    CurrStrFrom:WideString;
begin
  result := -1;
  for i := Length(aSql) downto 1 do
  begin
    CurrStrFrom := LowerCase( Copy( aSql, i, LeNgth('from ') ));
    if ( CurrStrFrom='from ' ) then
    begin
      result:= i;

      if ( AnsiPos(LowerCase(TableName), LowerCase(Copy(aSql,i,Length(aSql)-1)) )<>0 ) then
        Break;
    end;
  end;
end;

function GetIndexAfterFrom( aSql:WideString ):Integer;
var i:Integer;
    CurrStrFrom:WideString;
begin
  result := -1;
  for i := Length(aSql) downto 1 do
  begin
    CurrStrFrom := LowerCase( Copy( aSql, i, LeNgth('from ') ));
    if ( CurrStrFrom='from ' ) then
    begin
      result:= i;
      Break;
    end;
  end;
end;

function GetPartSqlWithTable(aSql:String):String;
const keyWords :array[0..7] of string =(',','left join','right join','inner join','join','left outer','right outer','on');
var i:integer;
    StartInd:Integer;
    FindBlock:Integer;
begin
  FindBlock := 0;
  StartInd:=AnsiPos(LowerCase(TableName) + ' ', LowerCase(aSql));
  if StartInd = 0 then StartInd:= AnsiPos(LowerCase(TableName) + #13#10, LowerCase(Sql));

  result := LowerCase(aSql);
  if StartInd=0 then Exit;
  for i:=StartInd+Length(TableName) to Length(aSql) do
  begin
    if aSql[i]=')' then Dec(FindBlock);
    if aSql[i]='(' then Inc(FindBlock);

    if ( ChechInPartWordArr(aSql,keyWords,i ))and( FindBlock=0 ) then  
    begin
      result := Copy(aSql,StartInd,i-StartInd);
      break;
    end;
  end;
end;

begin
  Sql := GetSqlWithoutAfterFrom( Sql );

  StartFrom := GetStartIndexFrom(Sql);
  Sql := Copy( Sql,StartFrom, Length(Sql)-StartFrom+1 );

  ReplaseON(Sql,'from','');
  Sql := GetPartSqlWithTable(Sql);

 if AnsiPos('(', Sql)<>0 then
    Sql := DBRemoveProcFromSqlAfterFrom( Sql )
  else ReplaseON(Sql,TableName,'');

  result := Trim( Sql );
end;
//******************************************************************************
Function DBHaveWHereSql(Sql:Widestring):Boolean;
var i:integer;
    CurrStrWhere:string;
    CurrStrFrom:string;
begin
 result:=False;
 for i:=Length(Sql) downto 1 do
    begin
      CurrStrWhere := Copy(Sql,i,LeNgth('Where '));
      CurrStrFrom := Copy(Sql,i,LeNgth('From '));

      if (CompareText(CurrStrWhere,'Where ')=0) then
      begin
       result:=true;
       break;
      end;

      if (CompareText(CurrStrFrom,'From ')=0) then
          break;
    end;
end;
//******************************************************************************
Function SQLHaveJoin(Sql:Widestring):Boolean;
begin
   result:=false;
   if AnsiPos('join',Lowercase(Sql))<>0 then
      result:=true
       else result:=false;
end;
//******************************************************************************
function DBGetValue(ConDBParam:TConnectDBParam; Sql, FieldResultName:string ):Variant;
var DB:TDataSet;
begin
  try
    if ConDBParam.IBDatabaseConnection<>nil then
      DB := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, Sql )
    else
    if ConDBParam.ADOConnection<>nil then
      DB := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, Sql );

   result := DB.FieldByName( FieldResultName ).Value;

   DB.Close;
  finally
    DestroyDB( DB );
  end;
end;
//******************************************************************************
procedure DBSetParamValue( aDB:TDataset; ParamName:String;ParamValue:Variant );
begin
  if aDB is TQuery then
    TQuery(aDB).ParamByName(ParamName).Value:= ParamValue ;

  if aDB is TQuery then
    if TQuery(aDB).Params.FindParam(ParamName) <> nil then
      TQuery(aDB).ParamByName(ParamName).Value:= ParamValue ;

  if aDB is TIBQuery then
    if TIBQuery(aDB).Params.FindParam(ParamName) <> nil then
      TIBQuery(aDB).ParamByName(ParamName).Value:= ParamValue;

  if aDB is TIBStoredProc then
    if TIBStoredProc(aDB).Params.FindParam( ParamName ) <> nil then
      TIBStoredProc(aDB).ParamByName(ParamName).Value:= ParamValue;
  
  if aDB is TADODataSet then
    if TADODataSet(aDB).Parameters.FindParam(ParamName) <> nil then
      TADODataSet(aDB).Parameters.ParamByName(ParamName).Value:= ParamValue ;

  if aDB is TADOQuery then
    if TADOQuery(aDB).Parameters.FindParam(ParamName) <> nil then
      TADOQuery(aDB).Parameters.ParamByName(ParamName).Value:= ParamValue ;

  if aDB is TADOStoredProc then
    if TADOStoredProc(aDB).Parameters.FindParam(ParamName) <> nil then
      TADOStoredProc(aDB).Parameters.ParamByName(ParamName).Value:= ParamValue;
end;
//******************************************************************************
procedure DBSetParamStream( aDB:TDataset; ParamName:String; Stream: TStream; DataType: TDataType );
begin
  if aDB is TQuery then
    TQuery(aDB).ParamByName(ParamName).LoadFromStream(Stream, DataType) ;

  if aDB is TIBQuery then
    TIBQuery(aDB).ParamByName(ParamName).LoadFromStream(Stream, DataType)
  else
  if aDB is TIBStoredProc then
    TIBStoredProc(aDB).ParamByName(ParamName).LoadFromStream( Stream,DataType )
  else
  if aDB is TIBCustomDataSet then
    TIBDataset(aDB).ParamByName(ParamName).LoadFromStream( Stream );

  if aDB is TADODataSet then
    TADODataSet(aDB).Parameters.ParamByName(ParamName).LoadFromStream(Stream, DataType)  ;

  if aDB is TADOQuery then
    TADOQuery(aDB).Parameters.ParamByName(ParamName).LoadFromStream(Stream, DataType)  ;

  if aDB is TADOStoredProc then
    TADOStoredProc(aDB).Parameters.ParamByName(ParamName).LoadFromStream(Stream, DataType)
end;
//******************************************************************************
function DBGetParamValue( aDB:TDataset; ParamName:String ):Variant;
begin
  if aDB is TQuery then
    result := TQuery(aDB).ParamByName(ParamName).Value;

  if aDB is TIBQuery then
    result := TIBQuery(aDB).ParamByName(ParamName).Value;

  if aDB is TIBStoredProc then
    result := TIBStoredProc(aDB).ParamByName(ParamName).Value
  else
  if aDB is TIBCustomDataSet then
    result := TIBDataset(aDB).ParamByName(ParamName).Value ;

  if aDB is TADODataSet then
    result := TADODataSet(aDB).Parameters.ParamByName(ParamName).Value;

  if aDB is TADOQuery then
    result := TADOQuery(aDB).Parameters.ParamByName(ParamName).Value;

  if aDB is TADOStoredProc then
    result := TADOStoredProc(aDB).Parameters.ParamByName(ParamName).Value;
end;
//******************************************************************************
procedure SetMasterSource(aDB:TDataset; DS:TDatasource);
begin
  if aDB is TQuery then
    TQuery(aDB).DataSource := DS;

  if aDB is TIBQuery then
    TIBQuery(aDB).DataSource := DS;

  if aDB is TIBCustomDataSet then
    TIBDataset(aDB).DataSource :=DS;

  if aDB is TADODataSet then
    TADODataSet(aDB).DataSource :=DS;

  if aDB is TADOQuery then
    TADOQuery(aDB).DataSource :=DS;

  if aDB is TADOStoredProc then
    TADOStoredProc(aDB).DataSource :=DS;
end;
//******************************************************************************
function DBCreate( Sql:string; DSMasterDetail:TDatasource; DBParam:TConnectDBParam; Active:Boolean=True ):TDataset;
begin
  if DBParam.IBDatabaseConnection <> nil then
  begin
    result := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, nil, Sql, Active );
    TIBQuery(result).DataSource := DSMasterDetail;
  end
  else
  if (DBParam.TypeConnect = optTypeConADO) and (DBParam.ADOConnection<>nil) then
  begin
    result := UnitAdoQuery.CreateDataSet( DBParam.ADOConnection, Sql, cmdText, Active );
    TAdoDataset(result).DataSource := DSMasterDetail;
  end
  else result := nil;

  if result <> nil then result.Tag := -1;
end;
//******************************************************************************
function DBCreateStoredProcDataSet( DBParam:TConnectDBParam; StoredProcName:widestring;
                                    ParamInputName:array of Widestring; ParamInputFieldType:array of TFieldType ):TDataSet;
begin
  if DBParam.IBDatabaseConnection <> nil then
  begin
     result := UnitIBQuery.CreateStoredProcDataSet(DBParam.PathDB,DBParam.UID,DBParam.Password,StoredProcName, ParamInputName,ParamInputFieldType);
  end
  else
  if (DBParam.TypeConnect = optTypeConADO) and (DBParam.ADOConnection<>nil) then
  begin
    result := UnitAdoQuery.CreateStoredProcDataSet(DBParam.ADOConnection,StoredProcName,ParamInputName,ParamInputFieldType);
  end;
end;
//******************************************************************************
procedure DBDestroyStorProc( DataSet  : TDataSet );
begin
  if DataSet is TIBStoredProc then UnitIBQuery.DestroyStorProc( TIBStoredProc(DataSet) )
  else
  if DataSet is TAdoStoredProc then UnitAdoQuery.DestroyStorProc( TAdoStoredProc(DataSet) );
end;
//******************************************************************************
procedure DBStoredProcExec( DataSet  : TDataSet );
begin
  if DataSet is TIBStoredProc then TIBStoredProc(DataSet).ExecProc
  else
  if DataSet is TAdoStoredProc then TAdoStoredProc(DataSet).ExecProc;
end;
//******************************************************************************
function DBUpdate( Sql:string; DBParam:TConnectDBParam ):Integer;
begin
 if DBParam.IBDatabaseConnection <> nil then
    result := UnitIBQuery.UpdateSql( DBParam.PathDB, DBParam.UID, DBParam.Password, SQL )
 else
  if DBParam.ADOConnection <> nil then
    result := UnitADOQuery.UpdateSql( DBParam.ADOConnection, SQL );
end;
//******************************************************************************
procedure DBUpdateList( SLQList:TStringList; DBParam:TConnectDBParam );
var i:integer;
begin
  for i:=0 to SLQList.Count-1 do
    DBUpdate( SLQList.Strings[i], DBParam );
end;
//******************************************************************************
procedure DataSetToXML(DataSet  : TDataSet; const FileName:string; FormatFile: TDataPacketFormat=dfXMLUTF8 );
var
 LProvider : TDataSetProvider;
 LClient   : TClientDataSet;
begin
   LProvider:=TDataSetProvider.Create(nil);
   try
     LProvider.DataSet:=DataSet;
     LClient:=TClientDataSet.Create(nil);
     try
       DataSet.DisableControls;
       try
        if not DataSet.Active then
          DataSet.Active:=True;

        LClient.SetProvider(LProvider);
        LClient.Active:=True;
        LClient.SaveToFile(FileName, FormatFile);
       finally
         DataSet.EnableControls;
       end;
     finally
       LClient.Free;
     end;
   finally
     LProvider.Free;
   end;
end;
//******************************************************************************
procedure UpdateLanguageFieldNameValue(  ElemMain : TDBShema; TableTranslate,FieldIdParentName,FieldLndIdName,FieldName,FieldChange :string;
                                         ValueName:string;idMain, idLngUpdate:Variant; StatusChange:Integer );
var SQL : string;
    aDB : TDataset;
    ConParam:TConnectDBParam;
begin
  ConParam:=TDBShema(ElemMain).DBGetParamConnect;
  ValueName := Trim(ValueName);

  SQL := 'SELECT count(*) aCount from '+TableTranslate+' where '+FieldIdParentName+'='+VarToStr(idMain)+
         ' and '+FieldLndIdName+'='+VarToStr( idLngUpdate );
  if TDBShema(ElemMain).DB is TCustomADODataSet then aDB := UnitADOQuery.CreateDataSet( ConParam.ADOConnection,  SQL );
  if TDBShema(ElemMain).DB is TIBCustomDataSet then aDB := UnitIBQuery.CreateDataSet( ConParam.PathDB, ConParam.UID, ConParam.Password, nil, SQL );

  try
    if aDB.FieldByName('aCount').AsInteger =0 then
    begin
      SQL := 'INSERT INTO '+TableTranslate+' ('+FieldIdParentName+','+FieldName+','+FieldLndIdName+','+FieldChange+') '+
      'VALUES ('+ VarToStr(idMain)+','+ SetNormalValueForSql( ValueName )+','+VarToStr(idLngUpdate)+','+IntToStr(StatusChange)+')'
    end
    else
     begin
       if ValueName<>'' then
         SQL := 'UPDATE '+TableTranslate+' SET '+FieldName+'='+ SetNormalValueForSql( ValueName )+','+FieldChange+'='+IntToStr(StatusChange)+
         ' where '+FieldIdParentName+' = '+VarToStr(idMain)+' and '+FieldLndIdName+'='+VarToStr(idLngUpdate)
       else SQL :='DELETE FROM '+TableTranslate+' where '+FieldIdParentName+' = '+VarToStr(idMain) +' and '+FieldLndIdName+'='+VarToStr(idLngUpdate);
     end;

    if TDBShema(ElemMain).DB is TCustomADODataSet then UnitADOQuery.UpdateSql( ConParam.ADOConnection, SQL );
    if TDBShema(ElemMain).DB is TIBCustomDataSet then UnitIBQuery.UpdateSql( ConParam.PathDB, ConParam.UID, ConParam.Password, SQL );

  finally
     DestroyDB( aDB );
  end;
end;
//******************************************************************************
function CreateField( DataType:TFieldType; Size:Integer; Dataset:TDataset; NewNameField:String ):TField;
begin
  result := nil;

  case DataType of
       ftString  : begin result:=TStringField.Create(Dataset.Owner); result.Size:=Size;end;
       ftWideString:begin result:=TWideStringField.Create(Dataset.Owner); result.Size:=Size;end;
       ftFloat   : result:=TfloatField.Create(Dataset.Owner);
       ftCurrency: result:=TCurrencyField.Create(Dataset.Owner);
       ftInteger : result:=TIntegerField.Create(Dataset.Owner);
       ftSmallint: result:=TSmallintField.Create(Dataset.Owner);
       ftBoolean : result:=TBooleanField.Create(Dataset.Owner);
       ftLargeint: result:=TLargeintField.Create(Dataset.Owner);
       ftDateTime: result:=TDateTimeField.Create(Dataset.Owner);
       ftDate    : result:=TDateTimeField.Create(Dataset.Owner);
       ftTimeStamp : result:=TSQLTimeStampField.Create(Dataset.Owner);
       ftTime    : result:=TTimeField.Create(Dataset.Owner);
       ftBlob : result:=TBlobField.Create(Dataset.Owner);
       ftMemo : result:=TMemoField.Create(Dataset.Owner);
       ftGuid : result:=TGuidField.Create(Dataset.Owner);
  End;

  if result = nil then ShowMessage( 'Sys Error: Create Field '+NewNameField+' in '+Dataset.Name )
  else
  begin
    result.Name:=Dataset.Name + NewNameField;
    result.FieldName := NewNameField;
  end;
end;
//******************************************************************************
procedure CreateCalcField( NewNameField:String;Dataset:TDataset;DataType:TFieldType; Size:Integer; AddToDataset:Boolean );
var NewField:Tfield;
begin
  if DAtaset.FindField(NewNameField)<>nil then Exit;
  NewField:= CreateField( DataType, Size, Dataset, NewNameField );
  if NewField <> nil then
  begin
    NewField.FieldKind:=fkCalculated;
    //****************************************
    if AddToDataset then NewField.DataSet:=Dataset;
    // if ADDtoDataset then Dataset.Fields.Add( NewField );
  end;
End;
//******************************************************************************
procedure CreateLookUpField(NewNameField:String;Dataset:TDataset;KeyField:String;
          LookUpDataset:Tdataset;LookUpKeyField:String;LookupResultField:String;DataType:TFieldType;Size:integer; AddToDataset:Boolean );
var NewField:Tfield;
begin
  if DAtaset.FindField(NewNameField)<>nil then Exit;
  NewField:= CreateField( DataType, Size,Dataset, NewNameField );
  if NewField <> nil then
  begin
    NewField.FieldKind:=fkLookup;
    //****************************************
    NewField.KeyFields := KeyField;
    NewField.LookupDataSet := LookUpDataset;
    NewField.LookupKeyFields := LookUpKeyField;
    NewField.LookupResultField := LookupResultField;
    NewField.LookupCache := True;
    //****************************************
    if AddToDataset then NewField.DataSet:=Dataset;
    //if ADDtoDataset then Dataset.Fields.Add(NewField);
  end;
End;
//******************************************************************************
procedure CreateDataField( NewNameField:String;Dataset:TDataset;DataType:TFieldType; Size:Integer; AddToDataset:Boolean );
var NewField:Tfield;
begin
  if DAtaset.FindField(NewNameField)<>nil then Exit;
  NewField:= CreateField( DataType, Size, Dataset, NewNameField );
  if NewField <> nil then
  begin
    NewField.FieldKind:=fkData;
    //****************************************    
    if AddToDataset then NewField.DataSet:=Dataset;
    //if ADDtoDataset then Dataset.Fields.Add(NewField);
  end;
end;
//******************************************************************************
procedure CloneAllFieldsDataset( FromDataset,ToDataset:TDataset; AddToDataset:Boolean );
var i:Integer;
begin
  for i:=0 to FromDataset.FieldCount-1 do
  begin

    if FromDataset.Fields[i].FieldKind = fkData then
     CreateDataField(  FromDataset.Fields[i].FieldName, ToDataset, TIBQuery(FromDataset).Fields[i].DataType, FromDataset.Fields[i].Size, AddToDataset );

    if FromDataset.Fields[i].FieldKind = fkCalculated then
      CreateCalcField( FromDataset.Fields[i].FieldName, ToDataset,FromDataset.Fields[i].DataType, FromDataset.Fields[i].Size, AddToDataset );

    if FromDataset.Fields[i].FieldKind = fkLookup then
      CreateLookUpField( FromDataset.Fields[i].FieldName, ToDataset, FromDataset.Fields[i].KeyFields,
          FromDataset.Fields[i].LookupDataSet,FromDataset.Fields[i].LookupKeyFields,
          FromDataset.Fields[i].LookupResultField,FromDataset.Fields[i].DataType,FromDataset.Fields[i].Size,AddToDataset );

    if ToDataset.FindField( FromDataset.Fields[i].FieldName )<> nil then
    begin
     ToDataset.FieldByName( FromDataset.Fields[i].FieldName ).DisplayLabel := FromDataset.Fields[i].DisplayLabel;

     if FromDataset.Fields[i] is TCurrencyField then
       TCurrencyField( ToDataset.FieldByName( FromDataset.Fields[i].FieldName ) ).DisplayFormat  := TCurrencyField( FromDataset.Fields[i]).DisplayFormat;

     if FromDataset.Fields[i] is TIntegerField then
       TIntegerField( ToDataset.FieldByName( FromDataset.Fields[i].FieldName ) ).DisplayFormat  := TIntegerField( FromDataset.Fields[i]).DisplayFormat;

     if FromDataset.Fields[i] is TDateTimeField then
       TDateTimeField( ToDataset.FieldByName( FromDataset.Fields[i].FieldName ) ).DisplayFormat  := TDateTimeField( FromDataset.Fields[i]).DisplayFormat;

     if FromDataset.Fields[i] is TfloatField then
       TfloatField( ToDataset.FieldByName( FromDataset.Fields[i].FieldName ) ).DisplayFormat  := TfloatField( FromDataset.Fields[i]).DisplayFormat;

    end;

    if ToDataset.FindField( FromDataset.Fields[i].FieldName ) <> nil then
      ToDataset.FieldByName( FromDataset.Fields[i].FieldName ).Required := FromDataset.FieldByName( FromDataset.Fields[i].FieldName ).Required;

  end;
end;
//******************************************************************************
Procedure DestroyDB(aDB:TDataset);
begin
  if aDB is TIBQuery then UnitIBQuery.DestroyDS( TIBQuery( aDB ) )
  else
  if aDB is TADODataset then UnitAdoQuery.DestroyDS( TADODataset( aDB ) ) ;
end;
//******************************************************************************
procedure SetReadOnlyFieldOnDataset(CurrDB:TDataset;ReadOnly:Boolean);
var i:integer;
begin
  for i:=0 to CurrDB.FieldCount-1 do
    CurrDB.Fields[i].ReadOnly:=ReadOnly;
end;
//******************************************************************************
procedure SetColumnExtLookupComboBoxPropertiesView( Column:TcxGridDBColumn; KeyField, ListFieldName:String;
                                                    View:TcxGridDBTableView );
begin
  Column.PropertiesClass := TcxExtLookupComboBoxProperties;
  TcxExtLookupComboBoxProperties(Column.Properties).View :=View;
  TcxExtLookupComboBoxProperties(Column.Properties).KeyFieldNames := KeyField;
  TcxExtLookupComboBoxProperties(Column.Properties).ListFieldItem := View.GetColumnByFieldName(ListFieldName);
end;
//******************************************************************************
procedure SetColumnExtLookupComboBoxPropertiesTree( Column:TcxDBTreeListColumn; KeyField, ListFieldName:String;
                                                    View:TcxGridDBTableView );
begin
  Column.PropertiesClass := TcxExtLookupComboBoxProperties;
  TcxExtLookupComboBoxProperties(Column.Properties).View :=View;
  TcxExtLookupComboBoxProperties(Column.Properties).KeyFieldNames := KeyField;
  TcxExtLookupComboBoxProperties(Column.Properties).ListFieldItem := View.GetColumnByFieldName(ListFieldName);
end;
//******************************************************************************
procedure AddFieldsToDataset(CurrDB:TDataset);
var i:integer;
    Field: TField;
begin
 //******Add Field To Dataset*****
 if CurrDB.FieldDefs.Count = 0 then exit;
 try
   try
     CurrDB.FieldDefs.Update;
     for i:=0 to CurrDB.FieldDefs.Count-1 do
     begin
       if CurrDB.Fields.FindField( CurrDB.FieldDefs[I].Name ) = nil then
         Field := CurrDB.FieldDefs[I].CreateField( CurrDB );
     end;
   finally
     CurrDB.FieldDefs.EndUpdate;
   end;
 except
   ShowMessage('Sysy Error:'+CurrDB.Name+' '+IntToStr(i));
 end;
end;
//******************************************************************************
function FieldsToArray( CurrDB:TDataset ):TArrFieldsParam;
var i:Integer;
begin
  SetLength(Result,CurrDB.FieldDefs.Count);
  if CurrDB.FieldDefs.Count = 0 then exit;

  for i:=0 to CurrDB.Fields.Count-1 do
  begin
    Result[i].DataType := CurrDB.Fields[i].DataType;
    Result[i].Size := CurrDB.Fields[i].Size;
    Result[i].FieldName := CurrDB.Fields[i].FieldName;
    Result[i].Required := CurrDB.Fields[i].Required;
  end;
end;
//******************************************************************************
procedure AddFieldsToDatasetFromArr( CurrDB:TDataset; ArrField:TArrFieldsParam );
var i:Integer;
    NewField:TField;
begin
  for i:=0 to Length(ArrField)-1 do
  begin
    if CurrDB.Fields.FindField( ArrField[I].FieldName ) = nil then
    begin
      NewField := CreateField( ArrField[I].DataType, ArrField[I].Size, CurrDB,ArrField[I].FieldName );
      NewField.DataSet := CurrDB;
    end;
  end;
end;
//******************************************************************************
function GetDBSql(CurrDB:TDataset):string;
begin
  result := '';
  if CurrDB is TAdoDataset then
    result:=TAdoDataset(CurrDB).CommandText;

  if CurrDB is TAdoQuery then
    result:= TAdoQuery(CurrDB).SQL.Text ;

  if CurrDB is TIBQuery then
    result:=TIBQuery(CurrDB).SQL.Text;

  if CurrDB is TIBDataset then
    result:=TIBDataset(CurrDB).SelectSQL.Text;
end;
//******************************************************************************
Function DBHaveWhere(CurrDB:TDataset) : Boolean;
begin
  result := DBHaveWHereSql( GetDBSql(CurrDB) );
end;
//******************************************************************************
Function DBHaveJoin(CurrDB:TDataset) : Boolean;
begin
   result := SQLHaveJoin( GetDBSql(CurrDB) );
end;
//******************************************************************************
procedure QueryChangeSQL(ADB:TDataset;NewSQL:Widestring);
begin
  if ADB.Active then ADB.Close;
   
  if (ADB is TIBDataset) then TIBDataset(ADB).SelectSQL.Text := NewSql;
  if (ADB is TIBQuery) then TIBQuery(ADB).SQL.Text := NewSql;
  if (ADB is TQuery) then TQuery(ADB).SQL.Text := NewSql;
  if (ADB is TADOQuery) then TADOQuery(ADB).SQL.Text  := NewSql;
  if (ADB is TADODataset) then TADODataset(ADB).CommandText := NewSql;
end;
//******************************************************************************
Function DBRemoveWhereSql( var Sql:Widestring;KeyRemove:string='Where'; All:Boolean=false ):Boolean;
var i:integer;
    CurrStrWhere:string;
    CurrStrFrom:string;
    FindKeyWord:boolean;
    FindBlock:Integer;
begin
 FindKeyWord := AnsiPos( LowerCase(KeyRemove), LowerCase(Sql) )<>0;
 Result := false;
 FindBlock:=0;
 for i:=Length(Sql) downto 1 do
    begin
      CurrStrWhere:=Copy(Sql,i,LeNgth(KeyRemove));
      CurrStrFrom:=Copy(Sql,i,LeNgth('From '));
      if Sql[i]=')' then inc(FindBlock);
      if Sql[i]='(' then dec(FindBlock);

      if (CompareText(CurrStrWhere,KeyRemove)=0) and
         (( Ord(Sql[i-1]) in [ 32, 10 ] ) and (Length(Sql) >= i+Length(KeyRemove) ) and
         ( Ord(Sql[i+Length(KeyRemove)]) in [ 32, 10 ]) ) and ( FindBlock = 0 )  then
      begin
        Result := True;
        Sql:=Copy(Sql,1,i-1);
        if not All then break;
      end;

      if (CompareText(CurrStrFrom,'From ')=0)and(not FindKeyWord) then break;
    end;
end;
//******************************************************************************
function GetSqlWithoutAfterFrom(aStr:Widestring;All:Boolean=false):Widestring;
begin
  result:=aStr;
  if aStr <> '' then
  begin
    if not DBRemoveWhereSql( result,'Where',All ) then
    begin

      DBRemoveWhereSql( result,'Having',All );
      DBRemoveWhereSql( result,'Exists',All );

      DBRemoveWhereSql( result,'limit',All );
      DBRemoveWhereSql( result,'Order',All );
      DBRemoveWhereSql( result,'Group',All );
    end;
  end;
end;
//******************************************************************************
function GetSqlWithoutAfterFrom(ADB:TDataset):Widestring;
begin
  result :='';
  result := GetDBSql( ADB );

  if result <> '' then
  begin
    result := GetSqlWithoutAfterFrom(result);
    {result:=DBRemoveWhereSql( result,'Where' );
    result:=DBRemoveWhereSql( result,'Order' );
    result:=DBRemoveWhereSql( result,'Group' );
    result:=DBRemoveWhereSql( result,'Having' );}
  end;
end;
//******************************************************************************
procedure SetPropertiesADO( CurrDB:TDataset; aTableName:String );
begin
  if (CurrDB is TCustomADODataSet)and(aTableName<>'') then
  begin
    TCustomADODataSet(CurrDB).Properties['Update Criteria'].Value := adCriteriaKey;
    TCustomADODataSet(CurrDB).Properties['Update Resync'].Value := adResyncAll;
    TCustomADODataSet(CurrDB).Properties['Unique Table'].Value := aTableName;
  end;
end;
//******************************************************************************
Procedure RequeryOnePosRecordAdo(CurrDB:TDataset;aTableName,AliesTable, FieldKod:String;RequeryStr:String='');
var aMainSql:WideString;
    aRequeryStr:String;
    i:Integer;
   // B: OleVariant;
begin
  if CurrDB.IsEmpty then Exit;
  
  if CurrDB is TCustomADODataSet then
     begin
       //B:=TCustomADODataSet(CurrDB).Recordset.Bookmark;
       if CurrDB.State in [dsInsert,dsEdit] then CurrDB.Post;

        SetPropertiesADO( CurrDB, aTableName );

        if RequeryStr<>'' then aRequeryStr:=RequeryStr
        else aRequeryStr:='('+AliesTable+'.'+FieldKod+'=?'+')';//+' or '+'('+AliesTable+'.'+FieldKod+'='+#39+CurrDB.FieldByName(FieldKod).AsString+#39+')';

        aMainSql := GetDBSql( CurrDB );
        DBRemoveWhereSql( aMainSql, 'limit' );
        //aMainSql := DBRemoveWhereSql( aMainSql, 'Where' );
        //aMainSql := 'select * from '+aTableName;
        for i:=0 to TAdoDataset(CurrDB).Parameters.Count-1 do
          ReplaseON( aMainSql, ':'+TAdoDataset(CurrDB).Parameters.Items[i].Name, VarToStr ( TAdoDataset(CurrDB).Parameters.Items[i].Value ) );
        
        if DBHaveWHere(CurrDB) then
         TAdoDataset(CurrDB).Properties['Resync Command'].Value:= aMainSql+' AND ' + aRequeryStr
        else  TAdoDataset(CurrDB).Properties['Resync Command'].Value:= aMainSql+' Where ' + aRequeryStr;

        TCustomADODataSet(CurrDB).UpdateCursorPos;
        try
          TCustomADODataSet(CurrDB).Recordset.Resync(adAffectCurrent,adResyncAllValues );
          TCustomADODataSet(CurrDB).Resync([rmExact]);    //rmExact
         //TCustomADODataSet(CurrDB).Recordset.Bookmark:=B;
        except
           TCustomADODataSet(CurrDB).Resync([]);
        end;
     end;
end;
//******************************************************************************
Procedure ResyncCommandTable(CurrDB:TDataset;aTableName,AliesTable,FieldKod:String);
var SQLUpdate:widestring;
    SqlRefresh:WideString;
    aMainSql:WideString;
begin
  if (CurrDB is TCustomADODataSet) and ( DBHaveJoin(CurrDB ) ) then
  begin
    SetPropertiesADO( CurrDB, aTableName );
    SQLUpdate:= '('+ AliesTable+ '.'+ FieldKod + '=?'+')';//+' or '+'('+AliesTable+'.'+FieldKod+'='+#39+CurrDB.FieldByName(FieldKod).AsString+#39+')';

    aMainSql := GetDBSql( CurrDB );
    DBRemoveWhereSql( aMainSql, 'limit' );
    
    if DBHaveWHereSql( aMainSql ) then
      TAdoDataset(CurrDB).Properties['Resync Command'].Value:= aMainSql+' AND ' + SQLUpdate
    else  TAdoDataset(CurrDB).Properties['Resync Command'].Value:= aMainSql+' Where ' + SQLUpdate;

    //aMainSql := GetSqlWithoutAfterFrom(CurrDB);
    //aMainSql := 'select * from '+aTableName;
    //TCustomADODataSet(CurrDB).Properties['Resync Command'].Value:= aMainSql+ ' Where ' + SQLUpdate;
  end;
end;
//******************************************************************************
function DBBooleanVariantValue( aValue :Variant ):Boolean;
var StrVal:String;
begin
  result := False;
  if aValue <> null then
  begin
    StrVal := UpperCase( VarToStr( aValue ) );
    if ( StrVal = 'T' ) or (StrVal = '1') then result := True;
  end;
end;
//******************************************************************************
function DBBooleanGetValue( aDB:TDataset; FieldName:String):Boolean;
begin
  if aDB.FieldByName(FieldName).DataType = ftString then
    result := aDB.FieldByName(FieldName).AsString = 'T'
  else
  if aDB.FieldByName(FieldName).DataType in [ ftInteger, ftSmallint ] then
    result := aDB.FieldByName(FieldName).asInteger = 1
  else
  if aDB.FieldByName(FieldName).DataType = ftBoolean then
    result := aDB.FieldByName(FieldName).asBoolean;
end;
//******************************************************************************
procedure DBBooleanSetValue( aDB:TDataset; FieldName:String; value:Boolean );
begin
  if aDB.FieldByName(FieldName).DataType = ftString then
    aDB.FieldByName(FieldName).AsString := MyIfThen( value, 'T','F')
  else
  if aDB.FieldByName(FieldName).DataType in [ ftInteger, ftSmallint ] then
    aDB.FieldByName(FieldName).asInteger := MyIfThen( value, 1, 0 )
  else
  if aDB.FieldByName(FieldName).DataType = ftBoolean then
    aDB.FieldByName(FieldName).asBoolean := value;
end;
//******************************************************************************
function DBBooleanTrueValue( aDB:TDataset;FieldName:String ):Variant;
begin
  if aDB.FieldByName(FieldName).DataType = ftString then
    result := 'T'
  else
  if aDB.FieldByName(FieldName).DataType in [ ftInteger, ftSmallint ] then
    result := 1
  else
  if aDB.FieldByName(FieldName).DataType = ftBoolean then
    result := True;
end;
//******************************************************************************
function GetValueFromRecord(FieldName:String;AView:TcxGRidDBTableView; IndRecord:Integer):Variant;
begin
  result:=Aview.ViewData.Records[IndRecord].Values[AView.GetColumnByFieldName( FieldName ).Index];
end;
//******************************************************************************
function FormingMasColByFieldNames( aView:TcxGridDBTableView; FieldNames:array of String ):TMasCxColGrid;
var i:integer;
    len:integer;
begin
  for i:=0 to Length(FieldNames) - 1 do
  begin
    if aView.GetColumnByFieldName( FieldNames[i] )<>nil then
    begin
      len:=Length(result);
      SetLength(result,len+1);
      result[len] := aView.GetColumnByFieldName( FieldNames[i] );
    end;
  end;
end;
//******************************************************************************
Function PrepareFormatPrice( PriceValue:Double; CurrencyName:String ):String;
begin
  result := FormatFloat( MaskFormatPrice , PriceValue ) +' '+ CurrencyName;
end;
//******************************************************************************
function FormingMasColsForAllColumns(aView:TcxGridDBTableView;  IncludeNotVisible:Boolean ):TMasCxColGrid;
var i:integer;
    len:integer;
begin
  for i:=0 to aView.ColumnCount - 1 do
  begin
    if ((IncludeNotVisible) ) or
       (( not IncludeNotVisible )and(aView.Columns[i].Visible)) then
    begin
      len:=Length(result);
      SetLength(result,len+1);
      result[len]:=aView.Columns[i];
    end;
  end;
end;
//******************************************************************************
Procedure AddToMemData( MD:TdxMemData; KeyData:TFieldValue;Values: array of TFieldValue );
var i:Integer;
begin
  if not MD.Active then MD.Open;
  if not MD.Locate(KeyData.FieldName,KeyData.Value,[]) then
    MD.Append
  else MD.Insert;

  for i:=0 to Length(Values)-1 do
    MD.FieldByName( Values[i].FieldName ).Value := Values[i].Value;

  if MD.State in [dsEdit,dsInsert] then
    MD.Post;
end;
//******************************************************************************
Procedure ViewSearchTextByColumns( aView:TcxGridDBTableView; AColName : TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false );
var FocusedRowIndex:Integer;
//*******************************************************
Function SearchTextByFocus(CurrFocusRow:Integer):boolean;
var i,j:integer;
    CurrValue:variant;
    CurrValueStr:widestring;
begin
  SearchText:=AnsiLowerCase(SearchText);
  result:=false;
  for i:=CurrFocusRow to aView.ViewData.RecordCount-1 do
      begin
        for j:=0 to Length(AColName)-1 do
        begin
          CurrValue:=aView.ViewData.Records[i].DisplayTexts[ AColName[j].Index ];
          if CurrValue=null then CurrValueStr:=''
          else CurrValueStr:=CurrValue;

          CurrValueStr:=AnsiLowerCase(CurrValueStr);
          if (((not JustFromBeginStr)and(AnsiPos(SearchText,CurrValueStr)<>0))or
             ((JustFromBeginStr)and( CompareText(Copy(CurrValueStr,1,Length(SearchText)),SearchText)=0) ))  and(FocusedRowIndex<>i) then
          begin
            aView.DataController.Controller.ClearSelection;
            aView.DataController.FocusedRowIndex:=i;
            aView.ViewData.Records[i].Selected := True;

            result:=true;
            break;
          end;
        end;
        if result then break;
      end;
end;

begin
  FocusedRowIndex:=aView.DataController.FocusedRowIndex;
  if FocusedRowIndex<0 then FocusedRowIndex:=0;

  if not SearchTextByFocus(FocusedRowIndex) then    // cycle
     SearchTextByFocus(0);
end;
//******************************************************************************
Procedure SearchTextOnViewByArrColumns( aView:TcxGridDBTableView; FieldNames : array of String; SearchText:Widestring;JustFromBeginStr:Boolean=false );
begin
  ViewSearchTextByColumns( aView, FormingMasColByFieldNames(aView, FieldNames ),SearchText, JustFromBeginStr );
end;
//******************************************************************************
Procedure SearchTextOnViewByAllColumns( aView:TcxGridDBTableView; SearchText:Widestring;JustFromBeginStr:Boolean=false;IncludeNotVisible:Boolean=false );
begin
  ViewSearchTextByColumns( aView, FormingMasColsForAllColumns(aView,IncludeNotVisible),SearchText, JustFromBeginStr );
end;
//******************************************************************************
procedure SaveDBPositionElements;
var i:Integer;
begin
  for i := 0 to AllElemnts.Count - 1 do
  begin
   try
    if TDBShema(AllElemnts.Items[i]) <> nil then
      TDBShema(AllElemnts.Items[i]).SaveDBPosition;
   except
     ShowMessage('SysError '+ TDBShema(AllElemnts.Items[i]).name );
   end;
  end;
end;
//******************************************************************************
procedure CheckDBOnOpen;
var i:Integer;
    aList:TStringList;
    aProgres:TProgressFormProp;
begin                              
  try
    aProgres := ShowProgress( WaitFormCaption ,-1);

    aList:= TStringList.Create;
    for i := 0 to AllElemnts.Count - 1 do
    begin
       try
        if TDBShema(AllElemnts.Items[i]) <> nil then
          TDBShema(AllElemnts.Items[i]).DBOpen;
       except
         aList.Add( TDBShema(AllElemnts.Items[i]).DB.name );
         //ShowMessage('SysError '+ TDBShema(AllElemnts.Items[i]).name );
       end;
     end;
  finally
    aList.SaveToFile( ExtractFilePath(Application.ExeName)+'TestEllElem_ErrOpen.txt' );
    aList.Free;
    ShowMessage('Finish Check');
    ClosedProgress(aProgres.FormProgres);
  end;
end;
//******************************************************************************
procedure CloseAllTransaction(Database:TIBDatabase);
var i: Integer;
begin
  for i := 0 to Database.TransactionCount - 1 do
    if Database.Transactions[i].Active then  Database.Transactions[i].Commit;
end;
//******************************************************************************
function FindElementByDataset(aDataset:TDataset):TDBShema;
var i:Integer;
begin
  result:=nil;
  for i := 0 to AllElemnts.Count - 1 do
  begin
    if TDBShema(AllElemnts.Items[i]).OriginalDB = aDataset then
    begin
      result := TDBShema(AllElemnts.Items[i]);
      Break;
    end;
  end;
end;
//******************************************************************************
function FindElementByView( aView:TcxCustomGridView ) : TDBShemaView;
var i:Integer;
begin
  result:=nil;
  for i := 0 to AllElemnts.Count - 1 do
  begin
    if ( TDBShema( AllElemnts.Items[i] ) is TDBShemaView ) and
       ( ( TDBShemaView(AllElemnts.Items[i]).View = aView) or
         ( TDBShemaView(AllElemnts.Items[i]).ViewList = aView) ) then
    begin
      result := TDBShemaView(AllElemnts.Items[i]);
      Break;
    end;
  end;
end;
//******************************************************************************
function FindElementByVerticalGrid( aInputVgrid :TcxVerticalGrid  ) : TDBShema;
var i:Integer;
begin
  result:=nil;
  for i := 0 to AllElemnts.Count - 1 do
  begin
    if ( TDBShema( AllElemnts.Items[i] ).FInputVgrid <>nil ) and
       ( TDBShema( AllElemnts.Items[i] ).FInputVgrid = aInputVgrid ) then
    begin
      result := TDBShema( AllElemnts.Items[i] );
      Break;
    end;
  end;
end;


//******************************************************************************
function FindElementByTree( aTree:TcxDBTreeList ) : TDBShemaTree;
var i:Integer;
begin
  result:=nil;
  for i := 0 to AllElemnts.Count - 1 do
  begin
    if ( TDBShema( AllElemnts.Items[i] ) is TDBShemaTree ) and
       ( TDBShemaTree(AllElemnts.Items[i]).Tree = aTree) then
    begin
      result := TDBShemaTree(AllElemnts.Items[i]);
      Break;
    end;
  end;
end;
//******************************************************************************
function FindElementByParentPreview( aPreview:TcxDBTreeList ) : TDBShema;
begin
  result := FindElementByTree( aPreview );
end;
//******************************************************************************
function FindElementByParentPreview( aPreview:TcxCustomGridView ) : TDBShema;
begin
  result := FindElementByView( aPreview );
end;
//******************************************************************************

//******************************************************************************
function PreparePMenuForElementByParentPreview( aPreview:TcxCustomGridView; Act:TNotifyEvent ):boolean ;
var NewMenuItem:TmenuItem;
    PMenu:TPopUpMenu;
begin
  if aPreview.PopupMenu<>nil then PMenu := TPopUpMenu( aPreview.PopupMenu )
  else
   if aPreview.Site.Parent is TCxGrid then PMenu := TPopUpMenu(TCxGrid(aPreview.Site.Parent).PopupMenu);

  AddMItemToPopUpMenuOrToNewPopAp( aPreview.Owner, PMenu, 'SelfMenuItem_'+aPreview.Name , 'Скопіювати назву елемента', Act );

end;
//******************************************************************************
function PreparePMenuForElementByParentPreview( aPreview:TcxDBTreeList; Act:TNotifyEvent ):boolean ;
var NewMenuItem:TmenuItem;
begin
  //NewMenuItem :=
  AddMItemToPopUpMenuOrToNewPopAp( aPreview.Owner, TPopUpMenu(aPreview.PopupMenu),
                 'SelfMenuItem_'+aPreview.Name , 'Скопіювати назву елемента', Act );

end;
//******************************************************************************
{procedure TFrmEditInfoCountry.PMTestPopup(Sender: TObject);
var CurrControl:TControl;
    P: PPropInfo;
begin
  CurrControl := FindVCLWindow(Mouse.CursorPos) ;
  if CurrControl <> nil then
  begin
    if TButton(CurrControl).PopupMenu <> Sender then
    begin
       keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), 0, 0);
       keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), KEYEVENTF_KEYUP,0);

       //PostMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, 0);
       //PostMessage(Handle, WM_LBUTTONUP, MK_LBUTTON, 0);
    end;
  end;
end;}

procedure PreparePMenuForComponentForm( Owner:TWinControl; Act:TNotifyEvent; AcceptClassName:array of TClass ) ;
var i:integer;
    P: PPropInfo;
    NewButMenuItem:TMenuItem;
    Obj_PM:TObject;
begin
  for i:=0 to Owner.ComponentCount-1 do
  begin
    
    if Owner.Components[I].ClassInfo<>nil then//Owner.Components[i] is TWinControl then
    begin
      P := GetPropInfo( Owner.Components[I].ClassInfo, 'PopupMenu' );
      if P <> nil then
      begin
        if ( CheckOnClassName( TWinControl(Owner.Components[i]), AcceptClassName ) ) then
        begin
           //Obj_PM := GetObjectProp(Owner.Components[I],'PopupMenu');
           NewButMenuItem := AddMItemToPopUpMenuOrToNewPopAp( Owner, TButton( TWinControl( Owner.Components[I])).PopupMenu ,'SelfMenuItem_'+Owner.Components[I].Name,
                                           'Скопіювати назву елемента',Act );

           Obj_PM := GetObjectProp(Owner.Components[I],'PopupMenu');

           if ( Obj_PM = nil ) and ( NewButMenuItem<> nil ) then
           begin
             TypInfo.SetObjectProp( Owner.Components[I], P, TPopUpMenu( NewButMenuItem.Owner ) );
             TPopUpMenu( NewButMenuItem.Owner ).PopupComponent := Owner.Components[I];
             TPopUpMenu( NewButMenuItem.Owner ).ParentBiDiMode:=False;
            // TcxControl(Owner.Components[I]).PopupMenu := TPopUpMenu( NewButMenuItem.Owner );
           end;
        end;
      end;

    end;
  end;
end;
//******************************************************************************
Function GetElemNameForAdmin( ForComponent:TComponent ):String;
var ClickComponenet:TComponent;
    FindElem:TDBShema;
begin
  FindElem := nil;
  if ForComponent is TcxGrid then FindElem := FindElementByView( TcxGrid(ForComponent).Levels[0].GridView )
  else
    if ForComponent is TcxDBTreeList then FindElem := FindElementByTree( TcxDBTreeList(ForComponent) )
      else result := ForComponent.Owner.Name+'.'+ForComponent.Name;

  if FindElem<> nil then
  begin
    result := FindElem.TableName;
    if result='' then result := ForComponent.Owner.Name+'.'+ForComponent.Name;
  end;
end;

//******************************************************************************
procedure CopyElemNameForAdmin( ForComponent:TComponent );
begin
  Clipboard.AsText := GetElemNameForAdmin( ForComponent );
end;
//******************************************************************************
procedure FreeAllElements;
var i:Integer;
    DatabaseIB : TIBDatabase;
    IBConList:TList;
begin
  try
    IBConList:=TList.Create;
    i:=0;
    While AllElemnts.Count>0 do
    begin
      DatabaseIB:=nil;
      if (TDBShema(AllElemnts.Items[i]).DB is TIBQuery) then DatabaseIB := TIBQuery(TDBShema(AllElemnts.Items[i]).DB).Database;
      if (TDBShema(AllElemnts.Items[i]).DB is TIBTable) then DatabaseIB := TIBTable(TDBShema(AllElemnts.Items[i]).DB).Database;
      if (TDBShema(AllElemnts.Items[i]).DB is TIBDataset) then DatabaseIB := TIBDataset(TDBShema(AllElemnts.Items[i]).DB).Database;

      if ( DatabaseIB<>nil ) and( IBConList.IndexOf(DatabaseIB)=-1 ) then
        IBConList.Add( DatabaseIB );

      TDBShema(AllElemnts.Items[i]).Close;
    end;

  finally
    IBConList.Free;
  end;

  if ElemUserRole <>nil then ElemUserRole.Close;
end;  
//******************************************************************************
procedure SetLogForAllElements( ElemUser:TDBShema;FieldUserName, TableNameLog,ProcAddName:string; LogFieldNames : TLogFields; StyleMark:TcxStyle );
var i:Integer;
begin
  for i:=0 to AllElemnts.Count-1 do
  begin
    TDBShema(AllElemnts.Items[i]).SetUserElem( ElemUser, FieldUserName  );
    TDBShema(AllElemnts.Items[i]).SetLogTable( TableNameLog,ProcAddName,  LogFieldNames, StyleMark );
  end;
end;
//******************************************************************************
Function ColumnInFilters(Aview:TcxGridTableView;AColumn:TcxGridColumn):Boolean;
var CrItem:TcxFilterCriteriaItem;
begin
 CrItem:=Aview.DataController.Filter.Root.Criteria.FindItemByItemLink(AColumn);
 result:=CrItem<>nil;
end;
//******************************************************************************
Procedure RemoveFilterForColumns( Aview:TcxGridTableView;AColumns:array of TcxGridColumn );
var i:integer;
    CrItem:TcxFilterCriteriaItem;
begin
  for i:=0 to Length(AColumns)-1 do
  begin
   CrItem:=Aview.DataController.Filter.Root.Criteria.FindItemByItemLink(AColumns[i]);
   if CrItem<>nil then
      Aview.DataController.Filter.Root.Criteria.RemoveItemByItemLink(AColumns[i]);
  end;
end;
//******************************************************************************
function CreateSaveListId(AView:TCxGridDBTableView;FieldId:String):TStringList;
var i:integer;
    indIdCol:Integer;
begin
  indIdCol := AView.GetColumnByFieldName(FieldId).Index;
  result:=TStringList.Create;
  for i:=0 to AView.DataController.RowCount-1 do
    result.Add( VarToStr( AView.ViewData.Rows[i].Values[indIdCol]));
end;
//******************************************************************************
function PrepareVarArrToStr(FilterValue: Variant):String;
var i:integer;
    LDimCount:Integer;
    SafeArray: PSafeArray;
    Len:Integer;
begin

   if VarIsArray(FilterValue) then
   begin
     SafeArray := PSafeArray(TVarData(FilterValue).VArray);
     Len:=SafeArray^.rgsabound[0].CElements;
     if Len = 0 then exit;

     result:='';
     for i:=0 to Len -1 do
     result :=result + VarToStr( FilterValue[i] )+',';

     if result[ Length(result) ]=',' then delete( result ,Length(result),1);
   end
    else Result:='';

end;
//******************************************************************************
procedure SetViewEnabled( aView:TcxGridDBTableView; Enabled:Boolean );
begin
  if aView = nil then exit;

  if Enabled  then
    aView.Styles.Background := aView.Styles.Content
  else
    aView.Styles.Background := aView.Styles.Footer;
end;
//******************************************************************************
procedure SetGridEnabled( aGrid:TcxGrid; Enabled:Boolean; LevelView:Integer = 0 );
begin
  if aGrid = nil then exit;
  if aGrid.Levels[LevelView].GridView = nil then exit;

  aGrid.Enabled := Enabled;
  SetViewEnabled( TcxGridDBTableView( aGrid.Levels[LevelView].GridView), Enabled );
end;
//******************************************************************************
function FindValuesInViewByField( aView:TcxGridDBTableView; FieldName:array of string; aValue:array of Variant ):integer;
var i,j:Integer;
    CountFind:Integer;
//*************************************************
function CheckCurrValue(IndMas, RecInd:Integer ):Boolean;
var j:Integer;
    indColSearch:Integer;
begin
  result := False;
  indColSearch:= aView.GetColumnByFieldName( FieldName[IndMas] ).Index;
  if aView.ViewData.Rows[RecInd].Values[ indColSearch ] = aValue[IndMas] then
    result := True;
end;
//*************************************************
begin
  result:=-1;
  for i:=0 to aView.ViewData.RowCount-1 do
  begin
     CountFind := 0;
     for j:=0 to Length(FieldName)-1 do
       if CheckCurrValue( j, i ) then Inc(CountFind)
        else Break;
     //***************************************
     if CountFind = Length(FieldName) then
     begin
       result := i;
       Break;
     end;
     //***************************************     
  end;
end;
//******************************************************************************
Function PrepareFilterValue( Column:TcxGridColumn; FilterValue: Variant; DisplayValue:Boolean=False):Variant;
var i:integer;
    FindTireLine:integer;
    ValueStr:Widestring;
begin
 try
  if Column=nil then exit;
  if Column.PropertiesClass=nil then exit;

  if Column.PropertiesClass=TcxMaskEditProperties then
  begin
    if AnsiPos('-',TcxMaskEditProperties(Column.Properties).EditMask)<>0 then
    begin
      ValueStr:=FilterValue;
      ReplaseOn(ValueStr,'-','');
      FilterValue:=ValueStr;
    end;
  end;

 finally
   if not VarIsArray(FilterValue) then
   begin
     if VarIsStr(FilterValue)and(FilterValue='null') then FilterValue:=null;
     if DisplayValue then
     begin
       result := VarToStr( FilterValue );
       if FilterValue=null then result:='null';
     end
     else
     result := FilterValue;
   end
    else
    begin
      if not DisplayValue then result:= FilterValue
      else result:= PrepareVarArrToStr(FilterValue);
    end;
 end;
end;
//******************************************************************************
function CheckUniqFieldNames( Elem:TDBShema; aView:TcxGridDBTableView ) : Boolean;
var i , j:integer;
    IndUniqCol:Integer;
    CurrIdFromView:Variant;
begin
   result := True;
   if aView = nil then exit;

   for i:=0 to aView.DataController.RecordCount -1 do
   begin

     CurrIdFromView := aView.DataController.Values[ i, aView.GetColumnByFieldName(Elem.FieldKod).Index ];
     for j:=0 to Elem.UniqFieldNames.Count - 1 do
     begin

       if aView.GetColumnByFieldName( Elem.UniqFieldNames.Strings[j] )<> nil then
         IndUniqCol:= aView.GetColumnByFieldName( Elem.UniqFieldNames.Strings[j] ).Index
       else IndUniqCol := -1;

       if IndUniqCol <> -1 then
       begin

         if   ( {( Elem.DB.State = dsEdit) and }(Elem.GetValueId <> CurrIdFromView ) ) {OR ( Elem.DB.State = dsInsert) ) }AND
              (aView.DataController.Values[ i, IndUniqCol ] = Elem.DB.FieldByName( Elem.UniqFieldNames.Strings[j] ).Value ) then
         begin
         
            MyShowMessageDlg('В колонці "'+aView.GetColumnByFieldName( Elem.UniqFieldNames.Strings[j] ).Caption + '"'+
                             ' значення повинно бути унікальним!', mtError, but_OK );

            result := False;
            exit;

         end;

       end;
     end;
   end;
end;
//******************************************************************************
Procedure SetFilterOnWievForColumnsCX(Aview:TcxGridTableView;AColumnName:array of TcxGridColumn;FilterValue:
                                        array of Variant;UMOVA:array of Widestring;
                                        Bool:array of TcxFilterBoolOperatorKind;BoolSection:TcxFilterBoolOperatorKind=fboOr;SetFilter:Boolean=true;AddFilter:Boolean=false);
var i,j,k:integer;
    Column:TcxGridColumn;
    FL: TcxFilterCriteriaItemList;
    FI:TcxFilterCriteriaItem;

function GetOperatorKind(Ind:Integer):TcxFilterOperatorKind;
var CurUm:String;
begin
 result:=foEqual;
 if Ind<=Length(UMOVA)-1 then CurUm:=UMOVA[ind]
    else CurUm:=UMOVA[0];
       if CurUm='='  then result := foEqual;
       if CurUm='<>' then result := foNotEqual;
       if CurUm='<'  then result := foLess;
       if CurUm='>'  then result := foGreater;
       if(CurUm='<=')or(CurUm='=<') then result := foLessEqual;
       if(CurUm='>=')or(CurUm='=>') then result := foGreaterEqual;
       if CurUm='like' then result := foLike;
       if CurUm='notlike' then result := foNotLike;
       if CurUm='in' then result := foInList;
       if CurUm='NotIn' then result := foNotInList;
end;
//************************************************
function GetValue(Ind:integer):Variant;
var CurVal:Variant;
begin
  if Ind<=Length(FilterValue)-1 then result:=FilterValue[ind]
    else result:=FilterValue[0];

  if (GetOperatorKind(I)=foLike)or(GetOperatorKind(I)=foNotLike) then
  begin
    Aview.DataController.Filter.Options:=[fcoCaseInsensitive];
    result:='%'+result+'%';
  end
  else Aview.DataController.Filter.Options:=[];
end;
//************************************************
function GetBool( ind:Integer ):TcxFilterBoolOperatorKind;
begin
  if Ind<=Length(Bool)-1 then result:=Bool[ind]
  else
   if Length(Bool)>0 then Result := Bool[0]
   else Result := BoolSection;
end;
//************************************************
begin
 Aview.DataController.Filter.Active := false;
 if not AddFilter then Aview.DataController.Filter.Root.Clear
    else RemoveFilterForColumns(Aview, AColumnName);
 //*****************************
 if Length(FilterValue) <> 0 then
    begin
       if Length(AColumnName) <> Length(FilterValue) then
          begin
              FL := Aview.DataController.Filter.Root.AddItemList( BoolSection );
              for i:=0 to Length(AColumnName)-1 do
                 begin
                   for j:=0 to Length(FilterValue)-1 do
                       begin
                         Column:= AColumnName[i];
                         FL.AddItem( Column, GetOperatorKind(I) , PrepareFilterValue( Column , GetValue(j)) , PrepareFilterValue( Column , GetValue(j),True ) );
                       end;
                 end;
              //****************************************
          end
           else
             begin
               Aview.DataController.Filter.Root.BoolOperatorKind := BoolSection ;
               FL := Aview.DataController.Filter.Root.AddItemList( GetBool(i) );
               
               for i:=0 to Length(AColumnName)-1 do
               begin
                 Column:= AColumnName[i];
                 FI := FL.AddItem( Column, GetOperatorKind(I) ,PrepareFilterValue( Column, GetValue(i) ), PrepareFilterValue( Column, GetValue(i), True ));
                 //FI.Parent.BoolOperatorKind := GetBool(i);

               end;
             end;
    end;
  Aview.Filtering.Visible :=  fvNever;//fvNonEmpty;
  Aview.DataController.Filter.Options:= Aview.DataController.Filter.Options + [fcoCaseInsensitive];
  Aview.DataController.Filter.Active := SetFilter;
  //ShowMessage( Aview.DataController.Filter.FilterText );
end;
//******************************************************************************
procedure SetFilterOnWievForManyColumns(Aview:TcxGridDBTableView;AFieldName:array of Widestring;FilterValue:array of variant; UMOVA:array of Widestring;
                                        aBool:array of TcxFilterBoolOperatorKind;BoolSection:TcxFilterBoolOperatorKind=fboOr; SetFilter:Boolean=true;AddFilter:Boolean=false);
var AColumnName:array of TcxGridColumn;
    i:integer;
    CurrIndcol:integer;
begin
  for i:=0 to Length(AFieldName)-1 do
  begin
    CurrIndcol:=Aview.GetColumnByFieldName(AFieldName[i]).Index;
    Setlength(AColumnName,Length(AColumnName)+1);
    AColumnName[Length(AColumnName)-1]:=AView.Columns[CurrIndcol];
  end;

  SetFilterOnWievForColumnsCX(Aview, AColumnName, FilterValue , UMOVA, aBool, BoolSection, SetFilter,AddFilter );
end;
//******************************************************************************
procedure SetFilterOnWievForAllColumns( aView:TcxGridDBTableView; FilterValue: Variant;  UMOVA:array of Widestring; IncludeNotVisible : boolean );
var Allcol : TMasCxColGrid;
begin
  Allcol := FormingMasColsForAllColumns( aView, IncludeNotVisible );
  SetFilterOnWievForColumnsCX(Aview, Allcol, [FilterValue], UMOVA, [fboOr] );
end;
//******************************************************************************
procedure SetFilterOnTreeForManyColumns( ATree:TcxDBTreeList;AFieldName:array of Widestring; FilterValue:array of variant;
                           UMOVA:array of Widestring; JustLevels: array of Integer; SetFilter:Boolean=true );
var i,j: Integer;
    ANode: TcxTreeListNode;
    ItemIndex:Integer;
    FilterFind:Integer;
    lenFilter:Integer;
function GetValue(ind:Integer):Variant;
begin
 if Ind<=Length(FilterValue)-1 then result:=FilterValue[ind]
    else result:=FilterValue[0];
end;
//********************************************
function GetField(ind:Integer):String;
begin
  if Ind<=Length(AFieldName)-1 then result:=AFieldName[ind]
  else result:= AFieldName[0];
end;
//********************************************
function GetUmova(ind:Integer):String;
begin
 if Ind<=Length(UMOVA)-1 then result:=UMOVA[ind]
    else result:=UMOVA[0];
end;
//********************************************
function CheckLevels(aLevel:Integer):Boolean;
var i:integer;
begin
  result := False;
  if Length( JustLevels ) = 0 then result := true;
  for i := 0 to Length(JustLevels)-1 do
    if aLevel = JustLevels[i] then
    begin
      result:=True;
      Break;
    end;
end;
//********************************************
function CheckInValues( TreeValue, FilterValue:Variant) : Boolean;
var i:integer;
    SafeArray: PSafeArray;
    Len:Integer;
begin
  result := false;

  SafeArray := PSafeArray(TVarData(FilterValue).VArray);
  Len:=SafeArray^.rgsabound[0].CElements;

  if Len = 0 then exit;
  for i:=0 to Len - 1 do
   if (TreeValue = FilterValue[i]) then
   begin
     result := true;
     break;
   end;
end;
//********************************************
function CompareValue(TreeValue, FilterValue:Variant;Umova:String ):Boolean;
var TreeValueStr,FilterValueStr:String;
begin
  result:=false;
 { if TreeValue<>null then TreeValueStr := VarToStrEx(TreeValue)
  else TreeValueStr:='';

  if FilterValue<>null then FilterValueStr := VarToStrEx(FilterValue)
  else FilterValue:='';  }

  if (Umova = '=')and(TreeValue = FilterValue ) then Result := True;
  if (Umova = '<>')and(TreeValue <> FilterValue ) then Result := True;
  if (Umova = '>')and(TreeValue > FilterValue ) then Result := True;
  if (Umova = '<')and(TreeValue < FilterValue ) then Result := True;
  if (Umova = '<=')and(TreeValue <= FilterValue ) then Result := True;
  if (Umova = '>')and(TreeValue >= FilterValue ) then Result := True;
  if (Umova = 'like') and ( AnsiPos( FilterValue, TreeValueStr ) <> 0 ) then Result := True;
  if (Umova = 'notlike') and ( AnsiPos( FilterValue, TreeValueStr ) = 0 ) then Result := True;
  if (Umova = 'in') and ( CheckInValues( TreeValue, FilterValue) ) then Result := True;
end;
//********************************************
begin
  for I := 0 to ATree.AbsoluteCount - 1 do
  begin
    ANode := ATree.AbsoluteItems[I];
    if ANode <> ATree.Root then
    begin
      FilterFind:=0;

      if CheckLevels(ANode.Level) then
      begin
        if Length(AFieldName) >= Length(FilterValue) then
          lenFilter:=Length(AFieldName)
        else lenFilter := Length(FilterValue);

        for j:=0 to lenFilter -1 do
        begin
          ItemIndex := ATree.GetColumnByFieldName(  GetField(j) ).ItemIndex;
          if CompareValue( ANode.Values[ItemIndex], GetValue( j ), GetUmova(j) ) then
            Inc(FilterFind)
          else Break;
        end;
        
        if SetFilter then
          ANode.Visible := ( FilterFind = lenFilter )
        else ANode.Visible:= True;
      end
       else ANode.Visible:= True;
    end;
  end;
end;
//******************************************************************************
procedure GetFieldNamesFromViewVisibleColumns( Aview:TcxGridDBTableView; var FieldsForomColumn:TVarArr );
var i:integer;
    len:integer;
begin
   for i:=0 to Aview.ColumnCount-1 do
   begin
     if  Aview.Columns[i].Visible then
     begin
       len := Length(FieldsForomColumn);
       SetLength( FieldsForomColumn, len+1);

       FieldsForomColumn[len]:=  Aview.Columns[i].DataBinding.FieldName;
     end;
   end;
end;
//******************************************************************************
function GetColumnFromViewByName(Aview:TcxGridDBTableView;ColumnName:TComponent):TcxGridDBColumn;
var i:integer;
    len:integer;
begin
   for i:=0 to Aview.ColumnCount-1 do
   begin
     if  Aview.Columns[i].Name = ColumnName.Name then
     begin
       Result :=Aview.Columns[i];
       Break;
     end;
   end;
end;
//******************************************************************************
function PrepareTextToView(aText:WideString;Acanvas:TcxCanvas;WidthArea:Integer):WideString;
const continie='...';
var i:Integer;
    k:integer;
    SaveText:WideString;
begin
  k:=Length(continie); 
  if Acanvas.TextWidth(aText)>WidthArea then
  begin
    for i:=1 to Length(aText) do
    begin
      if ( Acanvas.TextWidth( Copy(aText, 1, i )+ continie ) > WidthArea ) then
      begin

       if SaveText<>'' then
         result := SaveText
       else result:='...';

       break;
      end;
     SaveText:= Copy(aText, 1, i )+ continie;
    end;
  end
   else result:= aText
end;
//******************************************************************************
procedure PrepareOptionView( Aview: TcxCustomGridTableView; FieldOrder:string='' );  //
var ColKey:TcxGridDBColumn;
    ColOrder:TcxGridDBColumn;
begin
  AView.OptionsView.NoDataToDisplayInfoText:=' ';
  Aview.OptionsData.Deleting := false;
  Aview.OptionsData.DeletingConfirmation := false;
  Aview.OptionsData.Inserting := False;
  Aview.OptionsData.Editing  := False;
  Aview.Filtering.Visible := fvNever;
  if Aview is TcxGridDBTableView then
  begin
    ColKey := TcxGridDBTableView(Aview).GetColumnByFieldName(TcxGridDBTableView(Aview).DataController.KeyFieldNames);
    if ( ColKey <> nil) and (not ColKey.Visible ) then
    begin
      ColKey.Caption :='ID';
      ColKey.Width := 42;
      ColKey.Options.HorzSizing := false;
    end;
    //*************************************
    if FieldOrder <> '' then
    begin
      ColOrder := TcxGridDBTableView(Aview).GetColumnByFieldName( FieldOrder );
      if (ColOrder <> nil)and(ColOrder.Visible) then
      begin
        ColOrder.PropertiesClass := TcxTextEditProperties;
        TcxTextEditProperties(ColOrder.Properties).Alignment.Horz := taCenter;
        TcxTextEditProperties(ColOrder.Properties).Alignment.Vert := taVCenter;
        ColOrder.Width := 36;
        ColOrder.Options.HorzSizing := false;
        {try
          if TcxGridDBTableView(Aview).Name = 'ViewUserCategory' then ShowMessage('asdasd');
          ColOrder.SortOrder := soAscending;
        Except
         ShowMessage(Aview.Name);
        end;}

      end;
    end;
    //*************************************    
  end;
end;
//******************************************************************************
Function CreateColumnOnView( aView:TcxGridDBTableView;FieldName:string; Position:Integer;aWidth:Integer=100;
                             Sorting:Boolean=True;Moving:Boolean=True ):TcxGridDBColumn;
begin
  result := aView.CreateColumn;
  result.DataBinding.FieldName := FieldName;
  result.Index := Position;
  result.HeaderAlignmentHorz:= taCenter;
  result.Options.Filtering := False;
  result.Options.Sorting   := Sorting;
  result.Options.Moving    := False;
  result.Width := aWidth;
end;
//******************************************************************************
Function CreateBandedColumnOnView( aView:TcxGridDBBandedTableView;FieldName:string; BandedPosition, Position:Integer;aWidth:Integer=100;
                             Sorting:Boolean=True;Moving:Boolean=True ):TcxGridDBBandedColumn;
begin
  result := aView.CreateColumn;
  result.DataBinding.FieldName := FieldName;
  result.Position.BandIndex := BandedPosition;
  result.Index := Position;
  result.HeaderAlignmentHorz:= taCenter;
  result.Options.Filtering := False;
  result.Options.Sorting   := Sorting;
  result.Options.Moving    := False;
  result.Width := aWidth;
end;
//******************************************************************************
function GetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
begin

 if  Sender.Focused then
 begin
   if Sender.Styles.Selection<>nil then
     result:=Sender.Styles.Selection
   else
     result:=nil;
 end
 else
    if Sender.Styles.Inactive<>nil then
     result:=Sender.Styles.Inactive
   else
     result:=nil;
end;
//******************************************************************************
function GetSelectionColorTree(Sender: TcxCustomTreeList):TcxStyle;
begin

 if  Sender.IsFocused then
 begin
   if Sender.Styles.Selection<>nil then
     result:=Sender.Styles.Selection
   else
     result:=nil;
 end
 else
   if Sender.Styles.Inactive<>nil then
     result:=Sender.Styles.Inactive
   else
     result:=nil;
end;
//******************************************************************************
Function GetIndexColByCaptionFromWiew(ACaption:String;AView:TcxGRidTableView):integer;
var i:integer;
begin
  result:=-1;
  for i:=0 to AView.ColumnCount-1 do
  begin
  if (CompareText( AView.Columns[i].Caption, ACaption )=0) then
  begin
    result:=i;
    break;
  end;
  end;
end;
//******************************************************************************
procedure ViewDrawFillForRect(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; aRect: Trect; ACanvas: TcxCanvas );
var FocusedStyle:TcxStyle;
begin

 if ( AViewInfo.Focused )and( AViewInfo.Selected ) then
  begin
    FocusedStyle:= GetSelectionColor( Sender );
    if FocusedStyle <> nil then
    begin
      ACanvas.Font.Color := FocusedStyle.TextColor;
      ACanvas.FillRect( aRect , FocusedStyle.Color );
    end;
  end
  else
    ACanvas.FillRect( aRect , ACanvas.Brush.Color );
end;
//******************************************************************************
procedure ViewDrawFillRect(Sender: TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; ACanvas: TcxCanvas );
var FocusedStyle:TcxStyle;
begin

 if ( AViewInfo.Focused )and( AViewInfo.Selected ) then
  begin
     FocusedStyle:= GetSelectionColor( Sender );
     ACanvas.Font.Color := FocusedStyle.TextColor;
     ACanvas.FillRect( AViewInfo.Bounds , FocusedStyle.Color );
  end
  else
    ACanvas.FillRect( AViewInfo.Bounds , ACanvas.Brush.Color );
end;
//******************************************************************************
function TreeFindLastElemForNode( Node:TcxTreeListNode; JustVisible:boolean = True ):TcxTreeListNode;
var UntilLevel:Integer;
begin
  result := Node;
  if Node = nil  then Exit;
  UntilLevel := Node.Level;

  while (Node<>nil) do
  begin
    result := Node;
    if JustVisible then Node := Node.GetNextVisible
    else Node := Node.GetNext;

    if ( Node <> nil ) and ( Node.Level <= UntilLevel ) then break;
  end;
end;
//******************************************************************************
function TreeFindLevelElemForNode( Node:TcxTreeListNode; Level:Integer; JustVisible:boolean = True ):TcxTreeListNode;
var UntilLevel:Integer;
begin
  result := Node;
  if Node = nil  then Exit;
  UntilLevel := Node.Level;

  while (Node<>nil) do
  begin
    result := Node;
    if JustVisible then Node := Node.GetNextVisible
    else Node := Node.GetNext;
    if (Node <> nil) and (Node.Level = Level) then
    begin
      result := Node;
      Break;
    end;

    if ( Node <> nil ) and ( Node.Level <= UntilLevel ) then break;
  end;
end;
//******************************************************************************
function TreeCompareNodesByFieldValue( Node1, Node2:TcxTreeListNode;FieldName1,FieldName2:String ):Boolean;
var IndCol1:Integer;
    IndCol2:Integer;
    CountAll:Integer;
    CountTrue:Integer;
    SaveLevel : Integer;
    DecLevel  : Integer;
begin
  Result := False;
  CountTrue := 0;
  CountAll  := 0;

  if (Node1 = nil)or(Node2 = nil) then Exit;
  SaveLevel :=  Node1.Level;
  DecLevel  :=  SaveLevel;

  IndCol1 := TcxDBTreeList(Node1.TreeList).GetColumnByFieldName( FieldName1 ).ItemIndex;
  IndCol2 := TcxDBTreeList(Node2.TreeList).GetColumnByFieldName( FieldName2 ).ItemIndex;

  while ( Node1<>nil ) and ( Node2<>nil )  do
  begin
    if Node1.Values[ IndCol1 ] = Node2.Values[ IndCol2 ] then
      inc(CountTrue)
    else Break;

    inc( CountAll );
    Dec(DecLevel);
    if DecLevel<0 then
    begin
      Node1 := nil;
      Node2 := nil;
      break;
    end;

    Node1 := Node1.Parent;
    Node2 := Node2.Parent;
  end;

 Result := (CountTrue = CountAll) and (( Node1 = nil ) and (Node2 = nil ));
end;
//******************************************************************************
procedure TreeDrawFillRect(Sender: TcxCustomTreeList; AViewInfo: TcxTreeListEditCellViewInfo; ACanvas: TcxCanvas );
var FocusedStyle:TcxStyle;
    Rect:TRect;
begin
 Rect:= AViewInfo.BoundsRect;
 //****************************************************
 if Sender.OptionsView.GridLines <> tlglNone then
 begin
   Rect.Top := Rect.Top + 1;
   Rect.Bottom := Rect.Bottom - 1;
   Rect.Left:= Rect.Left + 1;
   Rect.Right:= Rect.Right - 1;
 end;
 //****************************************************
 if ( AViewInfo.Focused )and( AViewInfo.Selected ) then
  begin
    FocusedStyle := GetSelectionColorTree( Sender );
    ACanvas.Font.Color := FocusedStyle.TextColor;
    ACanvas.FillRect( Rect , FocusedStyle.Color );
  end
  else
    ACanvas.FillRect( Rect , ACanvas.Brush.Color );
end;
//******************************************************************************
procedure ViewDrawGroupSummaryItem( Sender: TObject; aColumn:TcxGridDBColumn; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridViewCellViewInfo; Alignment:Integer; FontStyle:TFontStyles; var ADone: Boolean  );
var Rect:TRect;
    aView : TcxGridDBTableView;
begin
  aView := TcxGridDBTableView(Sender);
  Rect := AViewInfo.RealBounds;

  Rect.Left := aView.ViewInfo.HeaderViewInfo.Items[ aColumn.VisibleIndex ].ContentBounds.Left;
  if Alignment = cxAlignRight then Rect.Left:=Rect.Left-4;
  Rect.Right := Rect.Left +  aColumn.Width;

  ACanvas.Font.Color:=clBlack;
  ACanvas.Font.Style := ACanvas.Font.Style + FontStyle;
  ACanvas.DrawTexT( AViewInfo.Text, Rect , Alignment or cxAlignVCenter );
  ADone := true;
end;
//******************************************************************************
function GetGraphicFromFile(FileName:String):Graphics.TGraphic;
var FileExt:string;
begin
  FileExt := ExtractFileExt( FileName );
  if FileExt = '.bmp' then result := TBitmap.Create;
  if FileExt = '.png' then result := TdxPNGImage.Create;
  if (FileExt = '.jpg')or (FileExt = '.jpeg') then result := TJpegImage.Create;
end;
//******************************************************************************
function ShowTextImageInCellFromGraphic(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
                                     var AViewInfo: TcxGridTableDataCellViewInfo;
                                     Graphic : Graphics.TGraphic; PosImg:TImageCellPosition; ShowText:Boolean=True; StretchToCell:Boolean=False ):Boolean;
const WidthPic = 16;
      HeightPic = 16;

var TextRect:TRect;
begin
  result := False;
  TextRect := AViewInfo.Bounds;
  ViewDrawFillRect( Sender, AViewInfo, ACanvas );

  if PosImg = OptImgPosLeft then
  begin
    ACanvas.Draw( AViewInfo.Bounds.Left+1, AViewInfo.Bounds.Top + (( AViewInfo.Bounds.Bottom - AViewInfo.Bounds.Top - HeightPic) div 2)  , Graphic );
    TextRect.Left:=TextRect.Left + WidthPic + 1;
  end;

  if PosImg = OptImgPosRight then
  begin
    ACanvas.Draw( AViewInfo.Bounds.Right-WidthPic-2, AViewInfo.Bounds.Top + (( AViewInfo.Bounds.Bottom - AViewInfo.Bounds.Top - HeightPic) div 2) , Graphic );
    TextRect.Right:=TextRect.Right- WidthPic - 2;
  end;

  if PosImg = OptImgPosCenter then
  begin
    if StretchToCell then ACanvas.Canvas.StretchDraw( AViewInfo.Bounds ,Graphic )
    else
     ACanvas.Draw( AViewInfo.Bounds.left+((AViewInfo.Bounds.Right - AViewInfo.Bounds.left) div 2 )-8 , AViewInfo.Bounds.Top ,Graphic );
  end;

  if ShowText then ACanvas.DrawTexT( AViewInfo.Text, TextRect, 0, True );
  result := true;
end;
//******************************************************************************
function ShowTextImageInCellFromBlobValue(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
                                     var AViewInfo: TcxGridTableDataCellViewInfo;
                                     ValuePicBin:String;PosImg:TImageCellPosition; ShowText:Boolean=True; StretchToCell:Boolean=False ):Boolean;
var Coor: Integer;
    FImage:TJPEGImage;
    Stream : TMemoryStream;
    Graphic : Graphics.TGraphic;
    TextRect:TRect;
begin
  result := False;
  if ValuePicBin = '' then Exit;
  try
    Stream := TMemoryStream.Create;
    Stream.Position := 0;
    StringToBinaryStream( ValuePicBin, Stream );

    Graphic:=Graphics.TBitMap.Create;
    Graphic.LoadFromStream( Stream );
    Graphic.Transparent:=true;
    Result := ShowTextImageInCellFromGraphic(Sender, ACanvas, AViewInfo, Graphic, PosImg, ShowText, StretchToCell );
 finally
    Graphic.free;
    Stream.Free;
 end;
end;
//******************************************************************************
function ShowTextImageInCellFromFile(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
                                     var AViewInfo: TcxGridTableDataCellViewInfo; FileName:String;
                                     PosImg:TImageCellPosition; ShowText:Boolean=True; StretchToCell:Boolean=False ):Boolean;
var Graphic : Graphics.TGraphic;
begin
  result := False;
  if not FileExists(FileName) then Exit;

  try
    Graphic := GetGraphicFromFile(FileName);
    Graphic.LoadFromFile( FileName );

    Graphic.Transparent:=true;
    Result := ShowTextImageInCellFromGraphic(Sender, ACanvas, AViewInfo, Graphic, PosImg, ShowText, StretchToCell );

  finally
    Graphic.Free
  end;
  
end;
//******************************************************************************
function ShowTextImageInCell( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
                              ImageList:TImageList; ImageIndex:integer;PosImg:TImageCellPosition; aChangeOnText:Widestring='' ):Boolean;
Const SpaceIconTextLeft = 2;
      SpaceIconTextRight = 2;
var BoundsRect:TRect;
    AlignmentHorz: TAlignment;
    AlignmentVertical: TcxAlignmentVert;
    CurrViewText:WideString;
    TextWidthMinusImg:Integer;
    CurrDisplayValue:Widestring;
    PaintRect:TRect;
begin
  result:=false;
  if ImageList <> nil then
    begin
      //ViewDrawFillRect( Sender, AViewInfo, ACanvas );
      BoundsRect:=AViewInfo.EditBounds;

      BoundsRect.Top := BoundsRect.Top + 2;
      BoundsRect.Left := BoundsRect.Left + 1;
      
      AlignmentHorz := AViewInfo.Properties.Alignment.Horz;
      AlignmentVertical := vaCenter;//AViewInfo.Properties.Alignment.Vert;

      if AViewInfo.Text<>'' then CurrDisplayValue := VarToStr(AViewInfo.Text);
      if aChangeOnText <>'' then CurrDisplayValue := aChangeOnText;
      ViewDrawFillForRect(Sender,AViewInfo, AViewInfo.Bounds, ACanvas );
      //*****************************************************
      if PosImg = OptImgPosLeft then
      begin
        PaintRect := AViewInfo.Bounds;
        PaintRect.Left:=AViewInfo.Bounds.left + 1;
        PaintRect.Right :=PaintRect.Left + 16;
        ViewDrawFillForRect(Sender,AViewInfo, PaintRect, ACanvas );
        BoundsRect.Left:= BoundsRect.Left + 16 + SpaceIconTextLeft;

        CurrViewText := PrepareTextToView( CurrDisplayValue, ACanvas, BoundsRect.Right - BoundsRect.Left);
        ACanvas.DrawTexT( CurrViewText ,BoundsRect , AlignmentHorz , AlignmentVertical, False, False);
        ACanvas.DrawImage(ImageList , AViewInfo.Bounds.left + 1 , AViewInfo.Bounds.Top ,ImageIndex ,true);

        result:=True;
      end;
      //*****************************************************
      if PosImg = OptImgPosRight then
      begin
        PaintRect := AViewInfo.Bounds;
        PaintRect.left:=AViewInfo.Bounds.Right - 16 - 3;
        ViewDrawFillForRect(Sender,AViewInfo, PaintRect, ACanvas );

        TextWidthMinusImg:=0;
        if AlignmentHorz = taRightJustify then BoundsRect.Right:=BoundsRect.Right - 16 - SpaceIconTextRight
        else TextWidthMinusImg := 16;

        CurrViewText := PrepareTextToView( CurrDisplayValue, Acanvas, BoundsRect.Right - TextWidthMinusImg - BoundsRect.Left );
        ACanvas.DrawTexT( CurrViewText ,BoundsRect , AlignmentHorz , AlignmentVertical, False, False);
        ACanvas.DrawImage(ImageList , AViewInfo.Bounds.Right - 16 - 3 , AViewInfo.Bounds.Top ,ImageIndex , true);

        result:=True;
      end;
      //*****************************************************
      if PosImg = OptImgPosCenter then
      begin
        ACanvas.DrawImage(ImageList , AViewInfo.Bounds.left+((AViewInfo.Bounds.Right - AViewInfo.Bounds.left) div 2 )-8 , AViewInfo.Bounds.Top ,ImageIndex ,true);
        result:=True;
      end;
    end;

end;
//******************************************************************************
function ShowTextImageInCellTree(Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
                                            ImageList:TImageList; ImageWidth, ImageIndex:integer;PosImg:TImageCellPosition ):Boolean;
Const SpaceIconTextLeft = 2;
      SpaceIconTextRight = 2;
var BoundsRect:TRect;
    AlignmentHorz: TAlignment;
    AlignmentVertical: TcxAlignmentVert;
    CurrViewText:WideString;
    TextWidthMinusImg:Integer;
begin
  result:=false;

  if ImageList <> nil then
    begin

      CurrViewText := AViewInfo.Node.Texts[AViewInfo.Column.ItemIndex];
      TreeDrawFillRect( Sender, AViewInfo, ACanvas );
      BoundsRect:=AViewInfo.BoundsRect;
      BoundsRect.Top := BoundsRect.Top + 2;
      BoundsRect.Left := BoundsRect.Left + 3;
      AlignmentHorz := AViewInfo.EditViewInfo.EditProperties.Alignment.Horz;
      //*****************************************************
      if PosImg = OptImgPosLeft then
      begin
        BoundsRect.Left:= BoundsRect.Left + ImageWidth + SpaceIconTextLeft;

        CurrViewText := PrepareTextToView( CurrViewText, ACanvas, BoundsRect.Right - BoundsRect.Left );
        ACanvas.Canvas.TextOut( BoundsRect.Left, BoundsRect.Top, CurrViewText );
        ACanvas.DrawImage( ImageList , AViewInfo.BoundsRect.left - 0, BoundsRect.Top, ImageIndex, true );

        result:=True;
      end;
      //*****************************************************
      if PosImg = OptImgPosRight then
      begin
        TextWidthMinusImg:=0;
        if AlignmentHorz = taRightJustify then BoundsRect.Right := BoundsRect.Right - ImageWidth - SpaceIconTextRight
        else TextWidthMinusImg := ImageWidth;

        CurrViewText := PrepareTextToView( CurrViewText, Acanvas, BoundsRect.Right - TextWidthMinusImg - BoundsRect.Left );
        ACanvas.Canvas.TextOut( BoundsRect.Left, BoundsRect.Top, CurrViewText );
        ACanvas.DrawImage(ImageList , AViewInfo.BoundsRect.Right - ImageWidth - 8 , BoundsRect.Top, ImageIndex, true);

        result:=True;
      end;
      //*****************************************************
      if PosImg = OptImgPosCenter then
      begin
        ACanvas.DrawImage(ImageList , AViewInfo.BoundsRect.left+((AViewInfo.BoundsRect.Right - AViewInfo.BoundsRect.left) div 2 )-8 , BoundsRect.Top ,ImageIndex ,true);
        result:=True;
      end;
    end;
end;
//******************************************************************************
Function ExecFunctDLL( DllName, FunctonName:String; ParamFunct:TDllFunct; paramFun:Pointer ):Variant;
var
  DllFunc:Pointer;
  HLib:THandle;
  N:integer;
begin
  HLib:=0;
  try
    HLib:=LoadLibrary( PChar(DllName) );
    if HLib>HINSTANCE_ERROR then
    begin
      DllFunc:=GetProcAddress(HLib, PAnsiChar( FunctonName ) );
      if Assigned( DllFunc ) then
        ParamFunct( DllFunc , paramFun)
      else
        MyShowMessageDlg('Dll Function '+FunctonName+' not found' , mtError, but_OK );
    end
     else
       MyShowMessageDlg('Can not load library '+DllName, mtError, but_OK );
  finally
    if HLib > HINSTANCE_ERROR then FreeLibrary(HLib);
  end;
end;
//******************************************************************************
procedure RenomerView(AView:TcxCustomGridView;FFieldNom:String);
var CurrNumber:INteger;
    currCod:String;
    i:integer;
    SaveBmk:Tbookmark;
    arrBmk:array of TBookmark;
    ShortView:TcxGRidDBTableView;
    DB_Local:TDataset;
    MySort:TcxDataSortOrder;
    SortEnable:Boolean;
begin
 if FFieldNom='' then exit;
 try
  if AView is TcxGRidDBBandedTableView then
     ShortView:= TcxGRidDBTableView(AView);

  if AView is TcxGRidDBTableView then
     ShortView:= TcxGRidDBTableView(AView);

  if ShortView=nil then exit;

  DB_Local:=ShortView.DataController.DataSource.DataSet;
  //DB_Local.AfterScroll:=nil;
  SaveBmk:=DB_Local.GetBookmark;
  if ShortView.GetColumnByFieldName(FFieldNom)<>nil then
     MySort:=ShortView.GetColumnByFieldName(FFieldNom).SortOrder;

  SortEnable :=ShortView.OptionsCustomize.ColumnSorting;
  if (ShortView<>nil)and(FFieldNom<>'') then
     begin
      ShortView.BeginUpdate;
      ShortView.DataController.GotoFirst;

      SetLength(arrBmk,ShortView.DataController.RecordCount);
      //************************************************************************
      ShortView.GetColumnByFieldName(FFieldNom).SortOrder:=soAscending;
      //************************************************************************
      for i:=0 to ShortView.ViewData.RowCount-1 do 
          begin
              arrBmk[i]:=ShortView.DataController.DataSet.GetBookmark;
              ShortView.DataController.GotoNext;
          end;
      //************************************************************************
      ShortView.GetColumnByFieldName(FFieldNom).SortOrder:=cxCustomData.soNone;
      try
        DB_Local.DisableControls;
        for i:=0 to Length(arrBmk)-1 do
            begin
              if arrBmk[i]<>nil then
                 begin
                   DB_Local.GotoBookmark(arrBmk[i]);
                   DB_Local.Edit;
                   DB_Local.FieldByName(FFieldNom).AsInteger:=i+1;
                   DB_Local.Post;
                 end;
            end;
      finally
       DB_Local.EnableControls;
      end;
      //**************************
      ShortView.GetColumnByFieldName(FFieldNom).SortOrder:=MySort;
     end;
  //************************************************************************
 finally
  if (ShortView<>nil)and(ShortView.GetColumnByFieldName(FFieldNom)<>nil) then
      ShortView.GetColumnByFieldName(FFieldNom).SortOrder:=MySort;

  DB_Local.GotoBookmark(SaveBmk);
  DB_Local.FreeBookmark(SaveBmk);
  ShortView.OptionsCustomize.ColumnSorting:=SortEnable;
  if ShortView.Controller.FocusedRow<>nil then
     ShortView.Controller.FocusedRow.Selected:=true;
  ShortView.EndUpdate;
 end;
end;
//******************************************************************************
procedure UpDownElem(AView:TcxCustomGridView;FFieldNom:String; Up: boolean);
var bmk:TBookmark;
    OldNumb:Integer;
    NewNumb:Integer;
    DB_Local:TDataset;
    ShortView:TcxGRidDBTableView;
    I:integer;
begin
  if FFieldNom<>'' then
     begin
      try
       if AView is TcxGRidDBBandedTableView then
       ShortView:= TcxGRidDBTableView(AView);

       if AView is TcxGRidDBTableView then
       ShortView:= TcxGRidDBTableView(AView);

       if ShortView=nil then exit;

       DB_Local:=ShortView.DataController.DataSource.DataSet;
       //DB_Local.AfterScroll :=nil;
       DB_Local.DisableControls;
       //****************************************
       if  ShortView<>nil then
           begin
             for i:=0 to ShortView.ColumnCount-1 do
               ShortView.Columns[i].SortOrder:=soNone;

             ShortView.GetColumnByFieldName(FFieldNom).SortOrder:=soAscending;
             ShortView.BeginUpdate;
           end;
       //****************************************
       bmk:= DB_Local.GetBookmark;
       OldNumb :=DB_Local.FieldByName(FFieldNom).AsInteger;
       //****************************************

       if Up then
          if DB_Local.FieldByName(FFieldNom).AsInteger>1 then
             begin //1
              ShortView.DataController.GotoPrev;
              //******************************
              NewNumb :=DB_Local.FieldByName(FFieldNom).AsInteger;
              DB_Local.Edit;
              DB_Local.FieldByName(FFieldNom).AsInteger:=OldNumb;
              //******************************
              DB_Local.Post;
              //******************************
              DB_Local.GotoBookmark(bmk);
              //******************************
              DB_Local.Edit;
              DB_Local.FieldByName(FFieldNom).AsInteger:=NewNumb;
              DB_Local.Post;
              //******************************
             end; //1
       //****************************************
       if not Up then
          if DB_Local.FieldByName(FFieldNom).AsInteger<DB_Local.RecordCount then
             begin
              ShortView.DataController.GotoNext;

              //******************************
              NewNumb :=DB_Local.FieldByName(FFieldNom).AsInteger;
              DB_Local.Edit;
              DB_Local.FieldByName(FFieldNom).AsInteger:=OldNumb;
              DB_Local.Post;
              //******************************
              DB_Local.GotoBookmark(bmk);
              //******************************
              DB_Local.Edit;
              DB_Local.FieldByName(FFieldNom).AsInteger:=NewNumb;
              DB_Local.Post;
             end;
       //****************************************
      finally
       if ShortView<>nil then
          ShortView.EndUpdate;
          DB_Local.EnableControls;
      end;
     end;
end;
//******************************************************************************
function GetViewSelectedValue(aView:TcxGridDBTableView;FieldName:string;SelectedIndex:Integer):Variant;
var Col:TcxGridDBColumn;
begin
  Col := aView.GetColumnByFieldName(FieldName);
  if Col<> nil then
    result := aView.DataController.Controller.SelectedRecords[SelectedIndex].Values[Col.Index]
  else Result := null;
end;
//******************************************************************************
Function UpDownElemSelect(AView:TcxCustomGridView;FFieldNom:String; Up: boolean):boolean;
var i:integer;
    ShortView:TcxGRidDBTableView;
    DB_Local:TDataset;
    UpdateLock:Boolean;
Function IsFirst:Boolean;
begin
 result:=ShortView.DataController.Controller.SelectedRecords[i].IsFirst;
end;
//*******************************
Function IsLast:Boolean;
begin
 result:=ShortView.DataController.Controller.SelectedRecords[i].IsLast;
end;
begin
  if AView=nil then exit;
  ShortView:=TcxGRidDBTableView(AView);
  DB_Local:=ShortView.DataController.DataSource.DataSet;
  //**********************************
  UpdateLock:=ShortView.IsUpdateLocked;
  result:=true;
  if ShortView.DataController.Controller.SelectedRecordCount=0 then exit;
  if Up then
  begin
   for i:=0 to ShortView.DataController.Controller.SelectedRecordCount-1 do
    begin
      if ShortView.DataController.Controller.SelectedRecords[i].IsFirst then
      begin
        result:=false;
        break;
      end;
      //*******************
      ShortView.DataController.Controller.SelectedRecords[i].Focused:=true;
      try
       if not UpdateLock then ShortView.BeginUpdate;
       UpDownElem(ShortView,FFieldNom, Up);
      finally
       if not UpdateLock then ShortView.EndUpdate;
      end;
      //******************
      if ShortView.DataController.Controller.SelectedRecords[i].IsFirst then
      begin
        result:=false;
        break;
      end;
    end;
  end
  else
  begin
    for i:=ShortView.DataController.Controller.SelectedRecordCount-1 downto 0  do
    begin
      if ShortView.DataController.Controller.SelectedRecords[i].IsLast then
      begin
       result:=false;
       break;
      end;
      //********************
      ShortView.DataController.Controller.SelectedRecords[i].Focused:=true;
      try
       if not UpdateLock then ShortView.BeginUpdate;
       UpDownElem(ShortView,FFieldNom, Up);
      finally
       if not UpdateLock then ShortView.EndUpdate;
      end;
      //********************
      if ShortView.DataController.Controller.SelectedRecords[i].IsLast then
      begin
       result:=false;
       break;
      end;
    end;
  end;
end;
//******************************************************************************
constructor TDBShema.Create(ADB: TDataset;
  ATableName, FieldKod:WideString; aGenIdName:String=''; aFieldNumber: String='');
var ADBName:string;
begin
 try
    //FIsLock := False;
    FMessageForDelete := DefMessForAskDelete;
    FAskBeforeDelete  := True;
    FBeforeDeleteCheckFunct:= '';
    FMainImageList  := nil;
    FMainImageIndex := -1;
    FFunctionGenId  := nil;
    FFunctionPrepareUpdateForm := nil;
    FSaveAndRestoreParamAfterChangeSql := false;
    //***************************
    FEnabled := False;
    FSaveMarkID :=null;
    FAutoComitedIB := True;
    FFieldsSelfTable := TStringList.Create;
    FEnableSavePosition := True;
    FFlagElementWasRestorePosition := false;
    FIniDBSavePosition  := GetFileNameOptionIni('ElemnetsDB');
    //***************************
    self.FTableName:= ATableName;
    self.FAliesTable := '';
    self.FFieldKod := FieldKod;
    self.FFieldNumber:= aFieldNumber;
    self.FGenIdName  := aGenIdName;
    @FFunctValidate  := nil;

    FActInsertDB:=nil;
    FActEditDB:=nil;
    if ADB<>nil then ADBName:=ADB.Name
    else ADBName:='NoDB';

    self.FName:='Obj_'+ADBName+InTToStr( AllElemnts.Count+1 );

    FFlagUpdateValueAfterInsert:=False;
    FConteinerTempData:=TList.Create;
    FConteinerConstraintElements := TList.Create;
    FUniqFieldNames := TStringList.Create;
    DetailElem :=TList.Create;

    if ADB.Tag <> -10 then
    begin
      SetDB(ADB);
      FIDElem := GetUni;
    end;

    self.FTitle := ATableName;
    //***************************
    AllElemnts.Add( self );

    FCounterLockConflict        :=0;
    FMaxCounterLockConflict     :=10;
    FControlsDisabled := false;
    FFunctOnFilterDB  := nil;

    FNeedSaveToLog := True;
  except
   FSysError('Create Element ('+ self.DB.Name+')' );
  end;
end;
//******************************************************************************
{function TDBShema.CheckRoleView(UserId:Integer):boolean;
begin
  if ElemUserRole <> nil then
    result := ElemUserRole.Permission(self.TableName,UserId).CanView
  else result:= True;
end;}
//******************************************************************************
function TDBShema.GetCurrManagerId:Integer;
begin
 if (self.FUserElem<>nil)and(self.FUserElem.DB.Active) then
   result := VarToInt( self.FUserElem.GetValueId )
 else result := 0;
end;
//******************************************************************************
function TDBShema.GetProgName(UsePath:Boolean=false):String;
begin
  if not UsePath then result:= ExtractFileName( Application.ExeName )
  else result := Application.ExeName;
end;
//******************************************************************************
function TDBShema.CheckRoleInsert( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil)and(self.FUserElem<>nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.Permission( self.FTableName, UserId ).CanInsert;
    if (ShowErrMess)and(not result) then MyShowMessageDlg( MessagePermisInsert, mtError, but_OK );
  end
  else result:= True;
end;
//******************************************************************************
function TDBShema.CheckRoleUpdate( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil)and(self.FUserElem<>nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.Permission(self.TableName, UserId ).CanUpdate;
    if (ShowErrMess)and(not result) then MyShowMessageDlg( MessagePermisUpdate, mtError, but_OK);
  end
  else result:= True;
end;
//******************************************************************************
function TDBShema.CheckRoleDelete( UserId:Integer=-1; ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil) and (self.FUserElem <> nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.Permission( self.TableName, UserId ).CanDelete;
    if (ShowErrMess)and(not result) then MyShowMessageDlg( MessagePermisDelete, mtError, but_OK);
  end
  else result:= True;
end;
//******************************************************************************
function TDBShema.CheckRoleAny(UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil) and (self.FUserElem <> nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.CheckPermisAny( self.TableName, UserId );

   if (ShowErrMess) and (not result) then MyShowMessageDlg( MessagePermisAny, mtError, but_OK);
  end
  else result:= True;
end;
//******************************************************************************
function TDBShema.CheckRoleLogAny(UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil) and (self.FUserElem <> nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.CheckPermisAny( self.FLogTableName, UserId );

    if (ShowErrMess) and (not result) then MyShowMessageDlg( MessagePermisAny, mtError, but_OK );
  end
  else result:= True;
end;
//******************************************************************************
function TDBShema.CheckRoleLogUpdate( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil) and (self.FUserElem <> nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.Permission( self.FLogTableName, UserId ).CanUpdate;
    
   if (ShowErrMess) and (not result) then MyShowMessageDlg( MessagePermisUpdate, mtError, but_OK );
  end
  else result:= True;
end;
//******************************************************************************
function TDBShema.CheckRoleLogDelete( UserId:Integer=-1;ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil) and (self.FUserElem <> nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.Permission( self.FLogTableName, UserId ).CanDelete;

   if (ShowErrMess) and (not result) then MyShowMessageDlg( MessagePermisDelete, mtError, but_OK );
  end
  else result:= True;
end;
//******************************************************************************
function TDBShema.CheckRoleReadOnly( UserId:Integer=-1; ShowErrMess:Boolean = false ):boolean;
begin
  if (ElemUserRole <> nil) and (self.FUserElem <> nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    result := ElemUserRole.CheckPermisReadOnly( self.FLogTableName, USerId );

    if (ShowErrMess) and (not result) then MyShowMessageDlg( MessagePermisDelete, mtError, but_OK );
  end
  else result:= True;
end;
//******************************************************************************
procedure TDBShema.RefreshPermisRole(UserId:Integer=-1;ShowErrMess:Boolean = false );
begin
  if (ElemUserRole <> nil) and (self.FUserElem <> nil) then
  begin
    if UserId = -1 then UserId := self.FUserElem.GetValueId;
    ElemUserRole.RefreshRole( UserId, self.FGetDBParam );
  end;
end;
//******************************************************************************
{function TDBShema.CheckRoleLogView(UserId:Integer):boolean;
begin
  if ElemUserRole <> nil then
    result := ElemUserRole.Permission(self.TableName,UserId).CanDelete
  else result:= True;
end;}
//******************************************************************************
procedure TDBShema.SetUniqFieldNames( UniqFiedldNames:array of String );
var i : integer;
begin
  for i:= 0 to Length(UniqFiedldNames)-1 do
  begin
    if FUniqFieldNames.IndexOf( UniqFiedldNames[i] ) = - 1 then
      FUniqFieldNames.Add( UniqFiedldNames[i] );
  end;
end;
//******************************************************************************
procedure TDBShema.RemoveUniqFieldNames( UniqFiedldNames:array of String );
var i : integer;
    indList:Integer;
begin
  for i:= 0 to Length(UniqFiedldNames)-1 do
  begin
    indList:= FUniqFieldNames.IndexOf( UniqFiedldNames[i] );
    if indList <> - 1 then
      FUniqFieldNames.Delete( indList );
  end;
end;
//******************************************************************************
function TDBShema.FFIndIndexValueFromTemp(aKey:String; Id:Variant):Integer;
var i:Integer;
begin
  result:=-1;
  if Id = null then Exit;
  //********************
  for i:=0 to FConteinerTempData.Count-1 do
  if (CompareText(  TTempDataShema(FConteinerTempData.Items[i]).Key , aKey ) = 0)and
     (TTempDataShema(FConteinerTempData.Items[i]).id = Id) then
  begin
    result:=i;
    Break;
  end;
end;
//******************************************************************************
procedure TDBShema.ClearAllValueFromTemp;
var i:Integer;
begin
  for i:=FConteinerTempData.Count-1 downto 0 do
    TTempDataShema(FConteinerTempData.Items[i]).Free;

  FConteinerTempData.Clear;
end;
//******************************************************************************
procedure TDBShema.FClearShemaConteinerConstraintElements;
var i:integer;
begin
  if FConteinerConstraintElements = nil then exit;
  
  for i:= FConteinerConstraintElements.Count-1 downto 0 do
   if PShemaObj(FConteinerConstraintElements[i])<> nil  then
     Dispose( PShemaObj(FConteinerConstraintElements[i]) );

  FConteinerConstraintElements.Free;   
end;
//******************************************************************************
procedure TDBShema.ClearAllValueFromTempByKey(aKey:string);
var i:Integer;
begin
  i:=0;
  while i < FConteinerTempData.Count-1 do
  begin
    if (CompareText(  TTempDataShema(FConteinerTempData.Items[i]).Key , aKey ) = 0) then
    begin
      TTempDataShema(FConteinerTempData.Items[i]).Free;
      FConteinerTempData.Delete(i);
    end
     else Inc(i);
  end;
end;
//******************************************************************************
procedure TDBShema.DeleteValueFromTemp( aKey:string; IDValue:Integer = -1 );
var indValue:Integer;
begin

  if IDValue = -1 then IDValue:=Self.GetValueId;
  indValue := FFIndIndexValueFromTemp( aKey , self.GetValueId );

  if indValue<>-1 then
  begin
    TTempDataShema( FConteinerTempData.Items[indValue] ).Free;
    FConteinerTempData.Delete( indValue );
  end;
end;
//******************************************************************************
function  TDBShema.GetValueFromTemp( aKey:string; IDValue:Integer = -1 ):Variant;
var indValue:Integer;
begin
  result:=null;
  if IDValue = -1 then IDValue:=Self.GetValueId;
  
  indValue := FFIndIndexValueFromTemp( aKey, IDValue  );
  
  if indValue<>-1 then
   result := TTempDataShema( FConteinerTempData.Items[indValue] ).Value;
end;
//******************************************************************************
procedure TDBShema.SetValueToTemp(aKey:string; Value:Variant; IDValue:Integer = -1  );
var i:Integer;
    indValue:Integer;
    ObjTemp:TTempDataShema;
begin
  if IDValue = -1 then IDValue :=self.GetValueId;
  
  indValue := FFIndIndexValueFromTemp( aKey, IDValue );
  if indValue <> -1 then
    TTempDataShema(FConteinerTempData.Items[indValue]).Value := Value
  else
  begin
    ObjTemp:=TTempDataShema.Create;

    ObjTemp.id := IDValue;
    ObjTemp.Key := aKey;
    ObjTemp.Value :=  Value;
    FConteinerTempData.Add( ObjTemp );
  end;
end;
//******************************************************************************
procedure TDBShema.SetFunctionRefreshCurrData( aRefreshDB : TRefreshDB );
begin
  FFunctionSQLRefreshData := aRefreshDB;
end;
//******************************************************************************
procedure TDBShema.InitializeTempValueByElement( aElem:TDBShema; aKey, aValueFieldName:String );
var i:Integer;
begin
 try
   aElem.SaveMarkID;
   aElem.DBDisableControls;
   aElem.DB.First;

   while not aElem.DB.Eof do
   begin
     self.SetValueToTemp( aKey, aElem.DB.FieldByName(aValueFieldName).Value , aElem.GetValueId );
     aElem.DB.Next;
   end;

 finally
  aElem.GotoMarkID;
  aElem.DBEnableControls;
 end;
end;
//******************************************************************************
procedure TDBShema.InitializeTempValueByElementByKeyField( aElem:TDBShema; aKeyFieldName, aValueFieldName:String );
var i:Integer;
begin
 try
   aElem.SaveMarkID;
   aElem.DBDisableControls;
   aElem.DB.First;

   while not aElem.DB.Eof do
   begin
     self.SetValueToTemp( aElem.DB.FieldByName(aKeyFieldName).Value, aElem.DB.FieldByName(aValueFieldName).Value , aElem.GetValueId );
     aElem.DB.Next;
   end;

 finally
   aElem.GotoMarkID;
   aElem.DBEnableControls;
 end;
end;
//******************************************************************************
destructor TDBShema.Close;
begin
  if FIndCloneElementCountByIDElem( Self.FIDElem ) = 0 then
  begin
    if self.FUpdateSqlIB<>nil then
      self.FUpdateSqlIB.Free;
    if FDB<>nil then SetDB(nil);
  end;

  FFieldsSelfTable.Free;

  ClearAllValueFromTemp;
  FConteinerTempData.Free;
  FUniqFieldNames.Free;

  FClearShemaConteinerConstraintElements;

  if ( self.MainElement <>nil )and( Assigned( self.MainElement ) ) and
     ( self.MainElement.name<> '' )  then
     self.MainElement.DeleteDatailElem( self );

  if ( self.RelationElement<>nil) and (Assigned( self.RelationElement ) ) and
     ( self.RelationElement.name <>'') then
    self.RelationElement.DeleteDatailElem( self );

  DetailElem.Free;
  AllElemnts.Remove( Self );
end;
//******************************************************************************
Procedure TDBShema.FCloneAssign(var aElem:TDBShema);
var i:Integer;
begin
  aElem.FIDElem := self.FIDElem;
  aElem.JustSetDB( self.DB );
  aElem.MainElement := self.MainElement;
  aElem.FieldMainKod := self.FieldMainKod;
  aElem.AddReletionTopElem( self.RelationElement, self.FieldRelationTopKod );
  aElem.AssignParamsTranslateTable( self.GetParamsTranslateTable );
  aElem.SetUserElem( self.FUserElem, Self.FFieldUserName );
  aElem.SetLogTable( self.FLogTableName, self.FLogStoredProcName, self.FLogFieldNames, FStyleMarkLog );
  aElem.SetMainIcon( self.FMainImageList, Self.FMainImageIndex );
  aElem.FFunctValidate := self.FFunctValidate;
  aElem.FFieldImageIndex := self.FFieldImageIndex;
  aElem.SetTableAlies(Self.FAliesTable);
  aElem.AskBeforeDelete := self.AskBeforeDelete;
  //aElem.FAssingPersonalEvents( self );   // скопіювати всі пересональні Event
  //aElem.FUpdateSqlIB := self.FUpdateSqlIB;

  for i:= 0 to FConteinerConstraintElements.Count-1 do
    aElem.AddShemaElements( PShemaObj(self.FConteinerConstraintElements.Items[i]).Elem,PShemaObj(self.FConteinerConstraintElements.Items[i]).UseDetail );

  aElem.FFieldsSelfTable.Clear;
  for i:=0 to FFieldsSelfTable.Count-1 do
    aElem.FFieldsSelfTable.Add( FFieldsSelfTable.Strings[i] );

  {SetLength( aElem.DetailElem,Length( self.DetailElem) );
  for i:=0 to Length( self.DetailElem )-1 do
    aElem.DetailElem[i]:= self.DetailElem[i];}
  for i:=0 to self.DetailElem.Count-1 do
    aElem.AddDatailElem( self.DetailElem[i] );

  aElem.UniqFieldNames.Clear;
  for i:=0 to Self.UniqFieldNames.Count-1 do
   aElem.UniqFieldNames.Add( Self.UniqFieldNames.Strings[i] );

  aElem.FMasDefValueFielsd := self.FMasDefValueFielsd;
  aElem.FMasDefValueFiledsValue := Self.FMasDefValueFiledsValue;
  aElem.FunctionPrepareUpdateForm := Self.FunctionPrepareUpdateForm;
end;
//******************************************************************************
function TDBShema.Clone : TDBShema;
var SaveTag:Integer;
begin
  try
    SaveTag := self.DB.Tag;
    self.DB.Tag:=-10;

    Result := TDBShema.Create( nil, self.TableName, self.FieldKod, self.GeneratorIdName, self.FieldNumber );
    FCloneAssign( Result );
  finally
    self.DB.Tag := SaveTag;
  end;
end;
//******************************************************************************
function TDBShema.FGetDB: TDataset;
begin
  result := nil;
  if self = nil then exit;
  try
    result := self.FDB;
  except
    self.FSysError( 'Element not found ');
  end;
end;
//******************************************************************************
procedure TDBShema.FSetStafFieldValue( aFieldValue: TFieldValue );
begin
  FStafFieldValueForUpdate := aFieldValue;
end;
//******************************************************************************
function TDBShema.FGetStafFieldValue : TFieldValue ;
begin
  result := Self.FStafFieldValueForUpdate;
  FStafFieldValueForUpdate.FieldName :='';
  FStafFieldValueForUpdate.Value := null;
end;
//******************************************************************************
function TDBShema.TestConnect:Boolean;
var CurrIBDatabase:TIBDatabase;
begin
  CurrIBDatabase := FGetIBDatabase;
  if CurrIBDatabase <> nil then
   result := CurrIBDatabase.Connected
  else result := True;
end;
//******************************************************************************
function TDBShema.GetValueByFieldName( fieldName:String ): Variant;
begin
  if not TestConnect then exit;
  
  if self.DB.FindField( fieldName ) <> nil  then
    result:=Self.DB.FieldByName( fieldName ).Value
  else FSysError('Field '+fieldName+' not found on Dataset '+FDB.Name);
end;
//******************************************************************************
function TDBShema.GetValueByFieldNameStr( fieldName:String ): String;
begin
  if GetValueByFieldName( fieldName ) = null then result:=''
  else result := VarToStr(GetValueByFieldName( fieldName ));
end;
//******************************************************************************
function TDBShema.GetValueId: Variant;
begin
  Result := null;
  if not TestConnect then exit;
  if not self.FDB.Active then exit;
  try
    if self.DB.FindField( self.FFieldKod ) <> nil  then
      result:=Self.DB.FieldByName(Self.FFieldKod).Value
    else FSysError('Field '+self.FFieldKod+' not found on Dataset '+FDB.Name);
  except
    if not Self.DB.active then FSysError('Dataset '+Self.DB.Name+' not Active ');
  end;
end;
//******************************************************************************
function TDBShema.GetValueIdStr: String;
begin
  result :='';
  if not TestConnect then exit;
  if not self.FDB.Active then exit;

  if self.DB.FindField( self.FFieldKod ) <> nil then 
    result := Self.DB.FieldByName( self.FFieldKod ).asString
  else FSysError( 'Field '+self.FFieldKod+' not found on Dataset '+FDB.Name );
end;
//******************************************************************************
procedure TDBShema.SetAutoCommitedAfterPost(aAutoComited:Boolean);
begin
 FAutoComitedIB := aAutoComited;
end;
//******************************************************************************
procedure TDBShema.SetMessageForAskDelete(aMessage:Widestring);
begin
  FMessageForDelete:=aMessage;
end;
//******************************************************************************
Procedure TDBShema.SaveDBPosition;
begin
 try
   if self.DB = nil then exit;
   if not DB.Active then exit;

   if self.DB.FindField( self.FFieldKod ) <> nil then
     if (FEnableSavePosition)and( self.GetValueIdStr <> '' ) then
       CreateIniFile( FIniDBSavePosition,'PositionDB', self.Name, self.GetValueIdStr );
 except
   self.FSysError('SaveDBPosition '+self.name);
 end;
end;
//******************************************************************************
function TDBShema.GetElementIniFileName:string;
begin
  result := FIniDBSavePosition;
end;
//******************************************************************************
procedure TDBShema.SetSavePositionDB( Endble: Boolean );
begin
 FEnableSavePosition:=Endble;
end;
//******************************************************************************
procedure TDBShema.DBDelete( AskDelete:Boolean=true );
var SaveAskDel:Boolean;
begin
  if Self.DB.IsEmpty then exit;

  try
    SaveAskDel := self.AskBeforeDelete;
    self.AskBeforeDelete := AskDelete;
    Self.DB.Delete;
  finally
    self.AskBeforeDelete := SaveAskDel;
  end;
end;
//******************************************************************************
procedure TDBShema.DBPost;
begin
  if self.DB.State in [dsInsert,DsEdit] then self.DB.Post;
end;
//******************************************************************************
procedure TDBShema.DBCancel;
begin
  if self.DB.State in [dsInsert,DsEdit] then self.DB.Cancel;
end;
//******************************************************************************
function TDBShema.DBValue(FieldName:String):Variant;
begin
  result := self.FDB.FieldByName(FieldName).value;
end;
//******************************************************************************
function TDBShema.FDBBooleanGetValue(FieldName:String):Boolean;
begin
  result := DBBooleanGetValue(self.FDB, FieldName );
end;
//******************************************************************************
procedure TDBShema.FDBBooleanSetValue( FieldName:String; value:Boolean );
begin
  DBBooleanSetValue( self.FDB, FieldName, value);
end;
//******************************************************************************
function TDBShema.DBGetBooleanTrueValue( FieldName:String ):Variant;
begin
  result := DBBooleanTrueValue( self.FDB, FieldName )
end;
//******************************************************************************
Procedure TDBShema.RestorePositionDBFromIni;
var AcurrID:String;
begin
  if not FEnableSavePosition then exit;
  if not Db.Active then exit;
  if self.FDB.IsEmpty then exit;

  if not TestConnect then exit;

  try
    self.DBDisableControls;
    AcurrID := ReadIniFile( FIniDBSavePosition, 'PositionDB', self.Name );

    if AcurrID<>'' then
      self.DBLocate( self.FieldKod, AcurrID, [] )
    else

    if ( self is TDBShemaView ) and ( TDBShemaView(self).View <> nil ) then
    begin
      TDBShemaView(Self).View.DataController.GotoFirst;
      TDBShemaView(Self).SetFocusOnView;
    end;
    
  finally
    self.DBEnableControls;
  end;
end;
//******************************************************************************
procedure TDBShema.DBAddBlobData(fieldName:String;ValueStream:TMemoryStream);
begin
  if not TestConnect then exit;
  
  if FDb.FieldByName(fieldName).IsBlob then
    TBlobField(FDb.FieldByName(fieldName)).LoadFromStream( ValueStream );
end;
//******************************************************************************
procedure TDBShema.DBAddBlobFileData(fieldName,FileName:String);
var ValueStream:TMemoryStream;
begin
   if FDb.FieldByName(fieldName).IsBlob then
   begin
     try
       ValueStream := TMemoryStream.Create;
       ValueStream.LoadFromFile( FileName );
       DBAddBlobData(fieldName, ValueStream );
     finally
       ValueStream.Free;
     end;
   end;
end;
//******************************************************************************
procedure TDBShema.DBAddBlobDataString(fieldName:String;ValueStr:Widestring);
var StremStr:TStringStream;
begin
  if not TestConnect then exit;
  
  if FDb.FieldByName(fieldName).IsBlob then
  begin
    try
     StremStr := TStringStream.Create( Trim(ValueStr) );
     TBlobField(FDb.FieldByName(fieldName)).LoadFromStream( StremStr );
    finally
     StremStr.Free;
    end;
  end;
end;
//******************************************************************************
procedure TDBShema.AddShemaElements( aElem:TDBShema; UseDetail:Boolean = True );
var ShemaObj : PShemaObj;
begin
  New(ShemaObj);
  ShemaObj.Elem := aElem;

  ShemaObj.UseDetail:= UseDetail;
  FConteinerConstraintElements.add( ShemaObj );
end;
//******************************************************************************
procedure TDBShema.ClearAllShemaElements;
begin
  FConteinerConstraintElements.Clear;
end;
//******************************************************************************
procedure TDBShema.DeleteElementFromShemaElements(aElem:TDBShema);
var indList:Integer;
begin
  indList:= FConteinerConstraintElements.IndexOf(aElem);
  if indList <> -1 then
    FConteinerConstraintElements.Delete( indList );
end;
//******************************************************************************
function TDBShema.DBLoadToImageFromBlobData(fieldName:String; ToImg:TImage; TypeImg:TImgTypes ):boolean;
var BlStream:TMemoryStream;
    bm: Graphics.Tbitmap;
    Graphic: Graphics.TGraphic;
begin
  result := False;
  BlStream := DBGetBlobData( fieldName );
  if BlStream = nil then Exit;
 try
    bm := Graphics.Tbitmap.Create;
    if TypeImg = pfBitmap then Graphic := TBitmap.Create;
    if TypeImg = pfPng then Graphic := TdxPNGImage.Create;
    if TypeImg = pfJpeg then Graphic := TJpegImage.Create;

    try
      BlStream.Seek(0, soFromBeginning);
      Graphic.LoadFromStream(BlStream);

      bm.Assign(Graphic);
      ToImg.Picture.Assign(bm);
      result := True;
    except
    end;

  finally
    bm.Free;
  end;
end;
//******************************************************************************
function TDBShema.DBGetBlobData( fieldName:String ):TMemoryStream;
begin
  result := nil;
  if not TestConnect then exit;

  result:=TMemoryStream.create;
  if FDb.FieldByName(fieldName).IsBlob then
  begin
     TBlobField(FDb.FieldByName(fieldName)).SaveToStream( result );
     result.Position:=0;
  end;
end;
//******************************************************************************
function TDBShema.DBGetBlobDataString( fieldName:String ):Widestring;
var BlStream:TMemoryStream;
begin
  Result := '';
  if not TestConnect then exit;

  try
   BlStream:= DBGetBlobData( fieldName );
   SetString(Result, PChar(BlStream.Memory), BlStream.Size div SizeOf(Char));
  finally
   BlStream.Free;
  end;
end;
//******************************************************************************
procedure TDBShema.SetTitle(aTitle:Widestring);
begin
  if aTitle<>'' then self.FTitle := aTitle
  else self.FTitle := self.FTableName;
end;
//******************************************************************************
procedure TDBShema.DBCommitedIB;
var aTransaction: TIBTransaction;
begin
  if not TestConnect then exit;

  aTransaction:=nil;
  if self.FDB is TIBCustomDataSet then aTransaction := TIBCustomDataSet(self.FDB).Transaction;  
  if (aTransaction <> nil) and (aTransaction.Active) then aTransaction.CommitRetaining;
  
end;
//******************************************************************************
procedure TDBShema.DBLockCommitedIB;
begin
  FAutoComitedIB:=False;
end;
//******************************************************************************
procedure TDBShema.DBUnLockCommitedIB;
begin
  FAutoComitedIB:=True;
  DBCommitedIB;
end;
//******************************************************************************
procedure TDBShema.FSetIBUpdateSql;
begin
  if FDB = nil then Exit;
  if not TestConnect then exit;

  //*****************************
  if ( FDB is TIBCustomDataSet )  then
    begin
      if (self.FUpdateSqlIB = nil) then
      begin
        self.FUpdateSqlIB := TIBUpdateSql.Create(FDB.owner);
        self.FUpdateSqlIB.Name := 'UpdateObject_' + self.Name;
      end;
      
      TIBCustomDataSet(FDB).UpdateObject := self.FUpdateSqlIB;

      FPrepareUpdateObjectRefreshCurrentIB;
      FPrepareUpdateObjectDeleteCurrentIB;
      FPrepareUpdateObjectUpdateCurrentIB;
      FPrepareUpdateObjectInsertCurrentIB;
    end;
  //*****************************
end;
//******************************************************************************
procedure TDBShema.FPrepareDatasetPersonalEvents( ADB:TDataset );
begin
  ADB.BeforeCancel := self.PersonalBeforeCancel ;
  ADB.AfterCancel := self.PersonalAfterCancel ;
  ADB.BeforeDelete := self.PersonalBeforeDelete ;
  ADB.BeforeInsert := self.PersonalBeforeInsert ;
  ADB.BeforePost := self.PersonalBeforePost;
  ADB.BeforeEdit := self.PersonalBeforeEdit;
  ADB.AfterEdit := self.PersonalAfterEdit;

  ADB.OnDeleteError := self.PersonalDeleteError;
  ADB.OnPostError := self.PersonalPostError;

  ADB.AfterDelete := self.PersonalAfterDelete ;
  ADB.AfterInsert := self.PersonalAfterInsert ;
  ADB.AfterPost := self.PersonalAfterPost;
  ADB.AfterScroll := self.PersonalAfterScroll;
  ADB.OnCalcFields := self.PersonalCalckFields;
  ADB.AfterOpen := self.PersonalAfterOpen;
  ADB.BeforeOpen := self.PersonalBeforeOpen;
  ADB.BeforeClose := self.PersonalBeforeClose;
  ADB.OnFilterRecord := self.PersonalFilterRecord;
end;
//******************************************************************************
procedure TDBShema.FSaveDatasetPersonalEvents( ADB:TDataset );
begin
  self.PersonalBeforeCancel := ADB.BeforeCancel ;
  self.PersonalAfterCancel  := ADB.AfterCancel;
  self.PersonalBeforeDelete := ADB.BeforeDelete;
  self.PersonalBeforeInsert := ADB.BeforeInsert;
  self.PersonalBeforePost   := ADB.BeforePost;
  self.PersonalBeforeEdit   := ADB.BeforeEdit;
  self.PersonalAfterEdit    := ADB.AfterEdit;
  self.PersonalDeleteError := ADB.OnDeleteError;
  self.PersonalPostError   := ADB.OnPostError;
  self.PersonalAfterDelete := ADB.AfterDelete;
  self.PersonalAfterInsert := ADB.AfterInsert;
  self.PersonalAfterPost   := ADB.AfterPost;
  self.PersonalAfterScroll := ADB.AfterScroll;
  self.PersonalCalckFields:= ADB.OnCalcFields;
  self.PersonalAfterOpen := ADB.AfterOpen;
  self.PersonalBeforeOpen  := ADB.BeforeOpen;
  self.PersonalBeforeClose:= ADB.BeforeClose;
  self.PersonalFilterRecord:= ADB.OnFilterRecord;
end;
//******************************************************************************
procedure TDBShema.FAssingPersonalEvents( FromElem:TDBShema );
begin
  self.PersonalBeforeCancel := FromElem.PersonalBeforeCancel ;
  self.PersonalAfterCancel  := FromElem.PersonalAfterCancel;
  self.PersonalBeforeDelete := FromElem.PersonalBeforeDelete;
  self.PersonalBeforeInsert := FromElem.PersonalBeforeInsert;
  self.PersonalBeforePost   := FromElem.PersonalBeforePost;
  self.PersonalBeforeEdit   := FromElem.PersonalBeforeEdit;
  self.PersonalAfterEdit    := FromElem.PersonalAfterEdit;
  self.PersonalDeleteError  := FromElem.PersonalDeleteError;
  self.PersonalPostError    := FromElem.PersonalPostError;
  self.PersonalAfterDelete := FromElem.PersonalAfterDelete;
  self.PersonalAfterInsert := FromElem.PersonalAfterInsert ;
  self.PersonalAfterPost   := FromElem.PersonalAfterPost;
  self.PersonalAfterScroll := FromElem.PersonalAfterScroll;
  self.PersonalCalckFields:= FromElem.PersonalCalckFields;
  self.PersonalAfterOpen := FromElem.PersonalAfterOpen;
  self.PersonalBeforeOpen  := FromElem.PersonalBeforeOpen;
  self.PersonalBeforeClose:= FromElem.PersonalBeforeClose;
  self.PersonalFilterRecord:= FromElem.PersonalFilterRecord;
end;
//******************************************************************************
procedure TDBShema.FPrepareDatasetEvents( ADB:TDataset );
begin
  if ( ADB = nil )and ( FDB<>nil ) then
  begin
    FPrepareDatasetPersonalEvents( FDB );
    //FDB.Tag :=0;
    //if FDB.Tag = -1 then
    //  DestroyDS( TIBQuery(self.FDB) );
  end
  else
  if ( ADB<>nil ) then
  begin
    FSaveDatasetPersonalEvents( ADB );
    //ADB.Tag :=1;
  end;
end;
//******************************************************************************
procedure TDBShema.AssignDBEvents( aFromDB, aToDB : TDataset );
begin
  aToDB.BeforeInsert := aFromDB.BeforeInsert;
  aToDB.AfterInsert  := aFromDB.AfterInsert;
  aToDB.BeforeDelete := aFromDB.BeforeDelete;
  aToDB.AfterDelete  := aFromDB.AfterDelete;
  aToDB.AfterScroll  := aFromDB.AfterScroll;
  aToDB.OnCalcFields := aFromDB.OnCalcFields;
  aToDB.AfterPost    := aFromDB.AfterPost;
  aToDB.BeforePost   := aFromDB.BeforePost;
  aToDB.BeforeEdit   := aFromDB.BeforeEdit;
  aToDB.AfterEdit    := aFromDB.AfterEdit;
  aToDB.AfterOpen    := aFromDB.AfterOpen;
  aToDB.BeforeOpen   := aFromDB.BeforeOpen;
  aToDB.OnFilterRecord := aFromDB.OnFilterRecord;
  aToDB.OnDeleteError := aFromDB.OnDeleteError;
  aToDB.OnPostError   := aFromDB.OnPostError;
  aToDB.OnNewRecord   := aFromDB.OnNewRecord;
end;
//******************************************************************************
Procedure TDBShema.FPrepareDB( ADB:TDataset );
begin
  if ADB = nil then exit;
  if (ADB<>nil) and (FDB<>nil) and (ADB<>FDB) then FPrepareDatasetEvents( nil );
  FPrepareDatasetEvents( ADB );
  //***************************************
  ADB.BeforeInsert := self.BeforeInsert;
  ADB.AfterInsert  := self.AfterInsert;
  ADB.BeforeDelete := self.BeforeDelete;
  ADB.AfterDelete  := self.AfterDelete;
  ADB.AfterScroll  := self.AfterScroll;
  ADB.OnCalcFields := self.OnCalcFields;
  ADB.AfterPost    := self.AfterPost;
  ADB.BeforePost   := self.BeforePost;
  ADB.BeforeEdit   := self.BeforeEdit;
  ADB.AfterEdit    := self.AfterEdit;
  ADB.AfterOpen    := self.AfterOpen;
  ADB.BeforeOpen   := self.BeforeOpen;
  ADB.OnFilterRecord := self.OnFilterRecord;
  ADB.OnDeleteError := self.DBDeleteError;
  ADB.OnPostError   := self.DBPostError;
end;
//******************************************************************************
procedure TDBShema.FClearParamDB(ADB:TDataset);
begin
  if ADB is TAdoQuery then TAdoQuery(ADB).Parameters.Clear;
  if ADB is TAdoDataset then TAdoDataset(ADB).Parameters.Clear;
  if ADB is TIBQuery then TIBQuery(ADB).Params.Clear;
end;
//******************************************************************************
procedure TDBShema.FSaveParamDB(ADB:TDataset);
var i:integer;
    Params:TParameters;
    ParamIB:TParams;
begin
   Params := nil;
   if ADB is TAdoQuery then Params := TAdoQuery(ADB).Parameters;
   if ADB is TAdoDataset then Params := TAdoDataset(ADB).Parameters;
   if ADB is TIBQuery then ParamIB := TIBQuery(ADB).Params;

   if Params<> nil then
   begin
     FDBParamsADO := TParameters.Create( Params.Owner, Params.ItemClass );
     FDBParamsADO.Assign( Params );
   end;

   if ParamIB<> nil then
   begin
      FDBParamsIB := TParams.Create( ParamIB.ItemClass );
      FDBParamsIB.Assign( ParamIB );
   end;

end;
//******************************************************************************
procedure TDBShema.FRestoreParamDB(ADB:TDataset);
begin
  if  FDBParamsADO <> nil then
  begin
     if ADB is TAdoQuery then TAdoQuery(ADB).Parameters.Assign( FDBParamsADO );
     if ADB is TAdoDataset then TAdoDataset(ADB).Parameters.Assign( FDBParamsADO );
    // FDBParamsADO.Free;
    // FDBParamsADO:=nil;
  end;

  if FDBParamsIB <> nil then
  begin
    if ADB is TIBQuery then TIBQuery(ADB).Params.Assign(FDBParamsIB) ;
  end;

end;
//******************************************************************************
function TDBShema.FLoadSQLFromFileToText( FileNameSQL:String ):String;
var aDS:TADOQuery;
begin
  aDS := TADOQuery.Create(nil);
  aDS.SQL.LoadFromFile( FileNameSQL );
  result := aDS.SQL.Text;
  aDS.Free;
end;
//******************************************************************************
procedure TDBShema.LoadScriptsDBFromFile( aDB:TDataset; PathToScripts:string );
var FileScript:string;
    SqlTextStr:Widestring;
    WasActive:Boolean;
begin
  WasActive := aDB.Active;
  FileScript := PathToScripts;

  if FileScript = '' then Exit;
  if not FileExists(FileScript) then Exit;

  if FileExists( FileScript ) then
  begin
    if aDB.Active then aDB.Close;

    try
    
      FSaveAndRestoreParamAfterChangeSql:= True;
      self.DBQueryChangeSql( FLoadSQLFromFileToText(FileScript),False );

    finally
      FSaveAndRestoreParamAfterChangeSql:=False;
    end;
    if WasActive then ADB.Active:=True;
  end;
end;
//******************************************************************************
function TDBShema.FCreateIBDatabase( DBParam:TConnectDBParam ):TIBDatabase;
begin
  if IBDatabaseList = nil then IBDatabaseList := TList.Create;

  result := CreateIBDatabase( DBParam.PathDB,DBParam.UID,DBParam.Password );
  IBDatabaseList.Add( result );
end;
//******************************************************************************
function TDBShema.FFindIBDatabase( DBParam:TConnectDBParam ):TIBDatabase;
var i:Integer;
begin
  result := nil;
  if IBDatabaseList <> nil then
    for i:=0 to IBDatabaseList.count-1 do
    begin
      if (CompareText( TIBDatabase(IBDatabaseList[i]).DatabaseName, DBParam.PathDB) =0 ) and
         (CompareText( TIBDatabase(IBDatabaseList[i]).Params.Values['user_name'], DBParam.UID) =0 ) and
         (CompareText( TIBDatabase(IBDatabaseList[i]).Params.Values['password'], DBParam.Password) =0 ) then
      begin
        result := TIBDatabase(IBDatabaseList[i]);
      end;
    end;
  if result = nil then result := FCreateIBDatabase( DBParam );
  
end;
//******************************************************************************
procedure TDBShema.FDBExchangeOnIB(ADB:TDataset);
var CurrDS:TDataSource;
    ConIBDatabase: TIBDatabase;
begin
  ConIBDatabase := FFindIBDatabase( GetDBParam( ADB ) );

  FDB := UnitIBQuery.CreateDataSet( ConIBDatabase, nil, GetDBSql( ADB ), False );
  try
    Randomize;
    FDB.Name := ADB.Name+'_IB';
    CloneAllFieldsDataset( ADB, FDB, True );
  except
     ShowMessage( 'Dataset '+ FDB.Owner.Name+'.'+FDB.Name+' already created' );
  end;
  {if ADB.Name = 'ExcursQry' then
  begin
    if  FDB.FieldByName('NAME').DataType = ftString then ShowMessage( 'String' );
    if  FDB.FieldByName('NAME').DataType = ftWideString then ShowMessage( 'WideString' );
  end;}
  FDB.AutoCalcFields := True;
  AssignDBEvents( ADB, FDB );

  FDB.Tag := ADB.Tag;
  TIBQuery(FDB).DataSource := ADB.DataSource;

  CurrDS := FindDatasourceByDataset( ADB );
  if CurrDS <> nil then
   CurrDS.DataSet := FDB;
end;
//******************************************************************************
Function TDBShema.FCheckConnectionComponentOnDB( ADB:TDataset ):Boolean;
begin
  result:=True;
  if (ADB is TIBCustomDataSet)and(TIBCustomDataSet(ADB).Database=nil) then result := False;
  if (ADB is TCustomADODataSet)and(TCustomADODataSet(ADB).Connection=nil) then result := False;
  if not Result then
    FSysError('Connection not found for '+ADB.Owner.Name+'.'+ADB.name);
end;
//******************************************************************************
Procedure TDBShema.FDestroyDB;
begin
  if ( self.DB <> nil ) and( self.DB.Tag = -1 ) then
    DestroyDB( self.DB );
end;
//******************************************************************************
Procedure TDBShema.JustSetDB( ADB:TDataset );
begin
  FDB := ADB;
end;
//******************************************************************************
Procedure TDBShema.SetDB( ADB:TDataset );
var PathToScripts:string;
begin
  if ADB<>nil then
  begin
    //if (ADB.DataSource<>nil)and(ADB.DataSource.Name ='UsersSrc') then ShowMessage(self.name);
    //if ADB.Name  = 'VISADOCTYPEQry' then ShowMessage('fff');

    self.FMainDBParam := GetDBParam( ADB );
    self.OriginalDB := ADB;
    if not FCheckConnectionComponentOnDB( ADB ) then exit;

    if ( GetDBParam( ADB ).TypeConnect = optTypeConIB ) and
       ( not ( ADB is TIBCustomDataSet) ) then
      FDBExchangeOnIB(ADB)
    else FDB:= ADB;

    PathToScripts := GetDBSqlPath( ADB )+ aDB.Name+'.sql';

    if ADB.Tag<>-1 then
    begin
      LoadScriptsDBFromFile( FDB, PathToScripts );
      FPrepareDB(FDB);
    end;

    self.FMainSQL := FGetMainSQL;
    FReadSelfMainTableFields;

    if Self.FTableName<>'' then
    begin
      //if ADB.name='TuristQry' then ShowMessage('dd');
      
      self.FAliesTable := GetAliesTableFromSQL(  self.FMainSQL, Self.FTableName );
      if ( FDB is TIBCustomDataSet ) then FSetIBUpdateSql;
      if AnsiPos(' ',Self.FAliesTable )<>0 then FSysError('Problem with Table Alies on '+self.name );
    end;
  end
  else
   begin
    if (self.FDB<>nil) then
      FPrepareDatasetEvents( ADB );

    FDestroyDB;
    self.FDB:=nil;
   end;
end;
//******************************************************************************
function TDBShema.DBGetSQL:string;
begin
  result := GetDBSql(FDB);
end;
//******************************************************************************
function TDBShema.FGetMainSQL:Widestring;
begin
  if FDB is TIBQuery then
    result := TIBQuery(FDB).SQL.Text;

  if FDB is TADOQuery then
    result := TADOQuery(FDB).SQL.Text;

  if FDB is TADODataset then
    result := TADODataset(FDB).CommandText;
end;
//******************************************************************************
procedure TDBShema.DBAddSQLWhere( aWhere:Widestring; AutoOpen:Boolean=true );
begin
  self.DBClose;
  if FDB is TIBQuery then TIBQuery(FDB).SQL.Text := self.FMainSQL+' '+aWhere;
  if FDB is TADODataSet then TADODataSet(FDB).CommandText := self.FMainSQL+' '+aWhere;
  if FDB is TADOQuery then TADOQuery(FDB).SQL.Text := self.FMainSQL+' '+aWhere;

  if AutoOpen then self.DBOpen;
end;
//******************************************************************************
procedure TDBShema.DBOpenMainSQL;
begin
  if FDB is TIBQuery then
  begin
    self.DBClose;
    //TIBQuery(FDB).Prepare;
    TIBQuery(FDB).SQL.Text := Trim(self.FMainSQL);
  end;

  self.DBOpen;
end;
//******************************************************************************
function TDBShema.DBSqlHaveWhere(aWhere:Widestring):Boolean;
begin
  result:=false;
  if FDB is TIBQuery then result := AnsiPos( aWhere, TIBQuery(FDB).SQL.Text ) <> 0;
  if FDB is TADODataSet then result := AnsiPos( aWhere, TADODataSet(FDB).CommandText ) <> 0;
  if FDB is TADOQuery then result := AnsiPos( aWhere, TADOQuery(FDB).SQL.Text ) <> 0;
end;
//******************************************************************************
function TDBShema.FGetDS: TDatasource;
begin
  result:=Self.FDS;
end;
//******************************************************************************
procedure TDBShema.SetDS(const Value: TDatasource);
begin
  Self.FDS:=Value;
end;
//******************************************************************************
function TDBShema.FIBConnect:Boolean;
begin
  result:=false;
  if not TestConnect then exit;

  if FDB is TTable then result := CompareText( TTable(FDB).Database.DriverName, 'INTRBASE' ) = 0;
  if FDB is TQuery then result := CompareText( TQuery(FDB).Database.DriverName, 'INTRBASE' ) = 0;

  if FDB is TIBQuery then result := true;
  if FDB is TIBTable then result := true;
end;
//******************************************************************************
procedure TDBShema.SetDBMasterSource(DS:TDatasource);
begin
  self.ParamClearValue;
  
  if FDB is TAdoQuery then begin TAdoQuery(FDB).DataSource := DS; end;
  if FDB is TAdoDataSet then  begin  TAdoDataSet(FDB).DataSource := DS;  end;
  if FDB is TIBQuery then begin  TIBQuery(FDB).DataSource := DS; end;
end;
//******************************************************************************
function TDBShema.FGetIBDatabase:TIBDatabase;
begin
  result := nil;
  if FDB is TIBQuery then result := TIBQuery(FDB).Database;
  if FDB is TIBTable then result := TIBTable(FDB).Database;
  if FDB is TIBDataset then result := TIBDataset(FDB).Database;
end;
//******************************************************************************
function TDBShema.GetIBDatabase : TIBDatabase;
begin
  result := FGetIBDatabase;
end;
//******************************************************************************
function TDBShema.FGetDBParam:TConnectDBParam;
begin
  Result.PathDB := '';
  Result.UID := '';
  Result.Password := '';

  if not TestConnect then exit;
  Result := GetDBParam( FDB );
end;
//******************************************************************************
function TDBShema.DBGetParamConnect:TConnectDBParam;
begin
  result := FGetDBParam;
end;
//******************************************************************************
function TDBShema.DBGetMainParamConnect:TConnectDBParam;
begin
  result := FMainDBParam;
end;
//******************************************************************************
procedure TDBShema.FUpdateOrder( NewOrder:Integer );
var SaveShowUpdate:Boolean;
begin
  if not TestConnect then exit;
  if self.FFieldNumber ='' then exit;
  
  try
    SaveShowUpdate := self.UpdateForm;
    self.UpdateForm := False;
    DB.Edit;
    DB.FieldByName( self.FFieldNumber ).AsInteger:=NewOrder;
    DB.Post;
  finally
    self.UpdateForm := SaveShowUpdate;
  end;
end;
//******************************************************************************
procedure TDBShema.DBQuerySetParamValue( ParamName:String;ParamValue:Variant );
begin
  if not TestConnect then exit;
  if FDB.Active then self.DBClose;

  DBSetParamValue( FDB, ParamName, ParamValue );
end;
//******************************************************************************
function TDBShema.DBQueryGetParamValue( ParamName:String ):Variant;
begin
  result := DBGetParamValue( FDB, ParamName );
end;
//******************************************************************************
procedure TDBShema.DBQueryExecSQL;
begin
  if self.DB is TIBQuery then TIBQuery(self.DB).ExecSQL
  else
  if self.DB is TAdoQuery then TAdoQuery(self.DB).ExecSQL
  else
  if self.DB is TIBStoredProc then TIBStoredProc(self.DB).ExecProc
  else
  if self.DB is TAdoStoredProc then TAdoStoredProc(self.DB).ExecProc;
end;
//******************************************************************************
procedure TDBShema.CreateIBDynamicCloneDataset( aDataset:TDataset; FieldsAddToDataset:Boolean=true );
var VirtualQry : TDataset;
    DBParam:TConnectDBParam;
begin
 { DBParam := FGetDBParam;

  if (self.DB<>nil) and (self.DB.tag = -1) then
    DestroyDB(self.DB);

  if aDataset is TIBCustomDataSet then
    VirtualQry := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, GetDBSql(aDataset), False );

  if aDataset is TCustomADODataSet then
    VirtualQry := UnitAdoQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, GetDBSql(aDataset), cmdText, False );

  CloneAllFieldsDataset( aDataset, VirtualQry, FieldsAddToDataset );
  VirtualQry.AutoCalcFields := True;
  //VirtualQry.OnNewRecord := aDataset.OnNewRecord;
  //VirtualQry.OnCalcFields:= aDataset.OnCalcFields;

  if aDataset is TIBCustomDataSet then TIBQuery(VirtualQry).DataSource  := aDataset.DataSource;
  if aDataset is TCustomADODataSet then
  begin
    if aDataset is TAdoDataset then TAdoDataset(VirtualQry).DataSource  := aDataset.DataSource;
    if aDataset is TAdoQuery then TAdoQuery(VirtualQry).DataSource  := aDataset.DataSource;
  end;

  Self.AssignDBEvents( aDataset,VirtualQry );
  VirtualQry.Name :='Virtual_'+aDataset.Name;

  if aDataset is TIBCustomDataSet then TIBCustomDataSet(VirtualQry).UpdateObject := self.FUpdateSqlIB;//aDataset.UpdateObject;
  VirtualQry.Tag := -1;
  self.FDB := VirtualQry; }
end;
//******************************************************************************
{procedure TDBShema.CreateBDEDynamicCloneDataset(aDataset:TIBQuery;FieldsAddToDataset:Boolean=true);
var VirtualQry:TQuery;
    DBParam:TConnectDBParam;
begin
  DBParam := FGetDBParam;      

  if (self.DB<>nil) and (self.DB.tag = -1) then
    if self.DB is TIBQuery then DestroyDS( TIBQuery(self.DB) );

  VirtualQry := CreateDataSetBDE( DBParam.PathDB, DBParam.UID, DBParam.Password, aDataset.SQL.Text, False );
  CloneAllFieldsDataset( aDataset, VirtualQry, FieldsAddToDataset );
  VirtualQry.AutoCalcFields := True;
  VirtualQry.OnNewRecord := aDataset.OnNewRecord;
  VirtualQry.OnCalcFields:= aDataset.OnCalcFields;
  VirtualQry.DataSource  := aDataset.DataSource;
  Self.AssignDBEvents( aDataset,VirtualQry );

  VirtualQry.Name :='Virtual_'+aDataset.Name;

  //VirtualQry.UpdateObject := self.FUpdateSqlIB;//aDataset.UpdateObject;
  VirtualQry.Tag := -1;
  self.FDB := VirtualQry;
end; }
//******************************************************************************
procedure TDBShema.FReadSelfMainTableFields;
var i:integer;
    ConParam:TConnectDBParam;
    IbFieldQuery:TIBQuery;
begin
  ConParam:=FGetDBParam;
  if not TestConnect then exit;

  if (self.FTableName = '')or( self.FFieldKod = '' ) then exit;

  //if self.DB.Name = 'BuildsQry' then ShowMessage('BuildQry');

  try
    FFieldsSelfTable.Clear;

    if ( FDB <> nil ) and ( FDB is TIBCustomDataSet ) then
      UnitIBQuery.GetSelfFieldsForTable( ConParam.PathDB, ConParam.UID, ConParam.Password, self.FTableName, self.FFieldKod, FFieldsSelfTable )
    else
    if ( FDB <> nil ) and ( FDB is TCustomADODataSet ) then
      UnitAdoQuery.GetSelfFieldsForTable( TCustomADODataSet(FDB).Connection, self.FTableName, self.FFieldKod, FFieldsSelfTable );

  except
    FSysError('Read self Main Table Fields ('+ self.DB.Owner.Name+'.'+ self.DB.Name+')' );
  end;
end;
//******************************************************************************
Function TDBShema.CheckFieldOnSelf(FieldName:String):Boolean;
var i:Integer;
begin
  result := False;

  for i:=0 to FFieldsSelfTable.Count-1 do
  begin
    if CompareText( FFieldsSelfTable[i], FieldName )=0 then
    begin
      result := True;
      Exit;
    end;
  end;
end;
//******************************************************************************
function TDBShema.GetDBTableDescript:String;
var ConDBParam:TConnectDBParam;
begin
  ConDBParam := self.DBGetParamConnect;
  result :='';
  
  if Trim(self.FTableName)='' then exit;

  if ConDBParam.IBDatabaseConnection<>nil then
    result := GetDescriptForTable( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, self.FTableName )
  else
  if ConDBParam.ADOConnection<>nil then
    result := 'Write Function get Comment from TableName';
end;
//******************************************************************************
function TDBShema.FIsSetDefaultParam(aParamName:String):integer;
var i:integer;
begin
 Result:=-1;
 for i:=0 to Length(self.FMasDefValueFielsd)-1 do
 begin
  if CompareText(self.FMasDefValueFielsd[i], aParamName)=0 then
  begin
    result:=i;
    exit;
  end;
 end;
end;
//******************************************************************************
procedure TDBShema.SetDefaultValue( AMasField: array of String; aMasFieldValue: array of Variant; PriorForCopy:Boolean=false);
var len:Integer;
    i:integer;
    curInd:integer;
begin
  FPriorForCopyDefValue:=PriorForCopy;
  for i:=0 to Length(AMasField)-1 do
  begin
    curInd:=FIsSetDefaultParam(AMasField[i]);
    if curInd=-1 then
    begin
      Len:= length( FMasDefValueFielsd );
      SetLength( FMasDefValueFielsd, Len+1 );
      SetLength( FMasDefValueFiledsValue, Len+1 );

      FMasDefValueFielsd[Len] := AMasField[i];
      FMasDefValueFiledsValue[Len] := aMasFieldValue[i];
    end
    else
      FMasDefValueFiledsValue[curInd] := aMasFieldValue[i];
  end;
end;
//******************************************************************************
Function TDBShema.GetDefValue(aField:String):Variant;
var i:integer;
begin
  result:= EmptyParam;
  for i:=0 to Length(FMasDefValueFielsd)-1 do       // setDef Value
  if LowerCase(FMasDefValueFielsd[i])=LowerCase(aField) then
    result:= FMasDefValueFiledsValue[i];
end;
//******************************************************************************
procedure TDBShema.SetFieldNotUsedForCopy(aMasField:array of String);
var i:integer;
begin
  setLength(FCopyMasFieldNotInclude,length(aMasField));
  for i:=0 to length(aMasField)-1 do
    FCopyMasFieldNotInclude[i]:=aMasField[i];
end;
//******************************************************************************
procedure TDBShema.SetBeforeDeleteCheckFunct( aBeforeDeleteCheckFunct:Widestring );
begin
 FBeforeDeleteCheckFunct := aBeforeDeleteCheckFunct;
end;
//******************************************************************************
function TDBShema.FCheckBeforeDeleteTrigerFunct(ShowMesError:Boolean=true):Boolean;
var DBParam:TConnectDBParam;
    ErrMesage:WideString;
begin
  result := True;
  if self.FBeforeDeleteCheckFunct = ''  then exit;
  
  DBParam:=FGetDBParam;
  ErrMesage := CheckFunctBeforeDelete( FBeforeDeleteCheckFunct,  DBParam.PathDB, DBParam.UID, DBParam.Password, self.GetValueId );
  if  ErrMesage <> '' then
  begin
    result := False;
    if ShowMesError then
      MyShowMessageDlg( ErrMesage, mtError, but_OK );
  end;
end;
//******************************************************************************
function TDBShema.FGenIdIB:Variant;
var DBParam:TConnectDBParam;
begin
  result:=null;
  if self.FGenIdName='' then Exit;
  if not TestConnect then exit;
  
  //*******************************
  DBParam := FGetDBParam;
  result  := UnitIBQuery.IDGenId( self.FGenIdName, DBParam.PathDB, DBParam.UID, DBParam.Password );

  if @self.FFunctionGenId <> nil then
  result :=  self.FFunctionGenId;
end;
//******************************************************************************
function TDBShema.FGenIdADO:Variant;
begin
  Result := UnitADOQuery.IDGenId(self.TableName, FGetDBParam.ADOConnection);
end;
//******************************************************************************
procedure TDBShema.SetFunctionGenId( FunctionGenId:TGenIdFunct) ;
begin
  self.FFunctionGenId := FunctionGenId;
end;
//******************************************************************************
function TDBShema.FGetTitle: WideString;
begin
 if FTitle='' then result:=FTableName
 else result:= FTitle;
end;
//******************************************************************************
function TDBShema.DBGetAvailableIDForIB:Variant;
begin
  result:=FGenIdIB;
end;
//******************************************************************************
procedure TDBShema.AfterDelete(DataSet: TDataSet);
var i:Integer;
begin
  //if FIsLock then Exit;
  //********************************

  if @PersonalAfterDelete<>nil then PersonalAfterDelete(DataSet);

  if self.FLogStoredProcName <> '' then
   FSaveToLog( self.FBeforeStateAction );

  if FAutoComitedIB then
  begin
   self.DBCommitedIB;
   if FBeforeUpdateValueID <> null then
     WebSynchronizeDelRow( FBeforeUpdateValueID, false );
  end;
end;
//******************************************************************************
procedure TDBShema.FPrepareDefaultValue(DataSet: TDataSet);
var i,j:Integer;
begin
  if not TestConnect then exit;
  
  for i:=0 to DataSet.Fields.Count-1 do
  begin
    for j:=0 to Length(Self.FMasDefValueFielsd)-1 do       // setDef Value
      if LowerCase(FMasDefValueFielsd[j])=LowerCase(DataSet.Fields[i].FieldName) then
        DataSet.Fields[i].Value := Self.FMasDefValueFiledsValue[j];
  end;
end;
//******************************************************************************
procedure TDBShema.DBSetStateToInsert;
var SaveActDB:TUpdateValue;
begin
  if not TestConnect then exit;
  
  try
    SaveActDB:=FActInsertDB;
    FActInsertDB:=nil;
    DB.Insert;
  finally
    FActInsertDB := SaveActDB;
  end;
end;
//******************************************************************************
procedure TDBShema.DBSetStateToEdit;
var SaveActDB:TUpdateValue;
begin
  try
    SaveActDB:=FActEditDB;
    FActEditDB := nil;
    DB.Edit;
  finally
    FActEditDB := SaveActDB;
  end;
end;
//******************************************************************************
Function TDBShema.GetCurrentTypeConnection: TOptTypeConnect;
begin
  result := GetTypeConnection( self.FDB );
end;
//******************************************************************************
procedure TDBShema.AfterInsert(DataSet: TDataSet);
var  CurrStafFieldValueUpdate: TFieldValue;
begin
  //if FIsLock then Exit;
  //********************************

  if self.FMainelem<>nil then
   DataSet.FieldByName(self.FFieldMainKod).Value:= self.FMainelem.DB.FieldByName(self.FMainelem.FFieldKod).Value;

  if self.FRelationTopElem<>nil then
   DataSet.FieldByName(self.FfieldRelationTopKod).Value:= self.FRelationTopElem.DB.FieldByName(self.FRelationTopElem.FFieldKod).Value;
  //**********************

  if (DataSet.FieldByName(self.FFieldKod).DataType in [ ftAutoInc, ftSmallint, ftInteger ] ) and (self.FGenIdName<>'') and
     (GetCurrentTypeConnection = optTypeConIB) then DataSet.FieldByName(self.FFieldKod).AsVariant := self.FGenIdIB;
  //***************************

  if (DataSet.FieldByName(self.FFieldKod).DataType in [ ftAutoInc, ftSmallint, ftInteger ] ) and (self.FGenIdName<>'') and
     (GetCurrentTypeConnection = optTypeConADO) then
    DataSet.FieldByName(self.FFieldKod).AsInteger := 0;
  //**********************
  FPrepareDefaultValue(DataSet);
  if FFlagUpdateValueAfterInsert then FPasteFromMasFiledValues;
  //**********************
  if @FActInsertDB <> nil then
    if not FActInsertDB( self ) then
    begin
      DataSet.Cancel;
      Exit;
    end;

  if @PersonalAfterInsert<>nil then PersonalAfterInsert(DataSet);

  self.FSetLastInsertID( DataSet.FieldByName(self.FFieldKod).AsInteger );
end;
//******************************************************************************
procedure TDBShema.FSetLastInsertID(value:Integer);
begin
  self.GetActiveCloneElem.FLastInsertID := value;
end;
//******************************************************************************
function TDBShema.FGetLastInsertID:variant;
begin
  result := self.GetActiveCloneElem.FLastInsertID;
end;
//******************************************************************************
procedure TDBShema.AfterOpen(DataSet: TDataSet);
begin
  //if FIsLock then Exit;
  //********************************
  try
   if AllElemnts.IndexOf( self )= -1 then exit;
   if Self.name ='' then exit;

   if not FFlagElementWasRestorePosition then
    RestorePositionDBFromIni;

   FFlagElementWasRestorePosition := True;
   SetPropertiesADO( DataSet, Self.FTableName );

   if (DataSet is TCustomADODataSet)and(Self.FFieldKod<>'') then
   begin
     TCustomADODataSet(DataSet).FieldByName(Self.FFieldKod).ProviderFlags:= [pfInUpdate,pfInWhere];
     TCustomADODataSet(DataSet).FieldByName(Self.FFieldKod).ReadOnly := False;
   end;

   if @PersonalAfterOpen<>nil then PersonalAfterOpen(DataSet);

   DBReCalcFields;
  except
   //ShowMessage('1 '+ Self.name );
  end;
end;
//******************************************************************************
function TDBShema.FGetUserId:Variant;
begin
  if not TestConnect then exit;
  
  Result := null;
  if self.FUserElem <> nil then
    Result := self.FUserElem.GetValueId;
end;
//******************************************************************************
function TDBShema.FCreateStructDBRow:TFieldValuePackedArr;
var i:integer;
    Len:Integer;
begin
  for i:=0 to self.FFieldsSelfTable.Count-1 do
  begin
    if (self.DB.FindField( self.FFieldsSelfTable.Strings[i] )<> nil ) and
      ( not self.DB.FieldByName( self.FFieldsSelfTable.Strings[i] ).IsBlob ) then
    begin
      Len:= Length(Result);
      SetLength(Result,Len+1);

      Result[Len].FieldCaption:= self.DB.FieldByName( self.FFieldsSelfTable.Strings[i] ).DisplayLabel;
      Result[Len].FieldName := self.FFieldsSelfTable.Strings[i];
      Result[Len].Value     := self.DB.FieldByName( self.FFieldsSelfTable.Strings[i] ).AsString;
    end;
  end;
end;
//******************************************************************************
function TDBShema.FFindObjIDFromStruct(aStruct:TFieldValuePackedArr):Variant;
var i:Integer;
begin
  for i:=0 to Length(aStruct)-1 do
  begin
    if CompareText( aStruct[i].FieldName , self.FFieldKod ) = 0 then
    begin
      result:= aStruct[i].Value;
      Break;
    end;
  end;
end;
//******************************************************************************
procedure TDBShema.DBSaveToFile( FileName:String; FormatFile: TDataPacketFormat = dfXMLUTF8 );
begin
  DataSetToXML( self.DB, FileName,FormatFile );
end;
//******************************************************************************
procedure TDBShema.FAddLogIBSQLUpdate( UserId:Integer; Action : TActionLog;
                                       ActiveFormName:WideString; ActiveFormCaption:WideString);
var SQL:WideString;
    DBparam:TConnectDBParam;
    StoredProc:TDataset;
    Stm: TMemoryStream;
    StmIcon:TMemoryStream;
    CurrIDObj:Variant;
    Len:Integer;
begin
 DBParam  := FGetDBParam;
 if not TestConnect then exit;
 //if self.IsLock then Exit;
 //**************************
 try
  CurrIDObj := FFindObjIDFromStruct(FLogFieldPackedData);

  StoredProc:= DBCreateStoredProcDataSet( DBParam, self.FLogStoredProcName ,
                                        [self.FLogFieldNames.FieldApplicationName, self.FLogFieldNames.FieldTitleElem,
                                        self.FLogFieldNames.FieldTableName,  self.FLogFieldNames.FieldKeyFieldId, self.FLogFieldNames.FieldIDObject,
                                        self.FLogFieldNames.FieldIDUser,self.FLogFieldNames.FieldAction,
                                        self.FLogFieldNames.FieldDATE,self.FLogFieldNames.FieldFormName,
                                        self.FLogFieldNames.FieldFormCaption,self.FLogFieldNames.FieldDATA,self.FLogFieldNames.FieldIconApplication ],
                                        [ftString,ftString,ftString,ftString,ftInteger,ftInteger,ftInteger, ftDateTime,ftString,ftString,ftBlob,ftBlob] );

  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldApplicationName, ExtractFileName( Application.ExeName ) );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldTitleElem, self.FTitle );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldTableName, self.TableName );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldKeyFieldId, self.FFieldKod );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldIDObject, CurrIDObj );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldIDUser, UserId );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldAction, FGetIndexAction(Action) );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldDATE, ConvertDateTime(Now) );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldFormName, ActiveFormName );
  DBSetParamValue( StoredProc, self.FLogFieldNames.FieldFormCaption, ActiveFormCaption );

  {StoredProc:= UnitIBQuery.CreateStoredProcDataSet( DBParam.PathDB,DBParam.UID,DBParam.Password, self.FLogStoredProcName ,
                                      [self.FLogFieldNames.FieldApplicationName, self.FLogFieldNames.FieldTitleElem,
                                      self.FLogFieldNames.FieldTableName,  self.FLogFieldNames.FieldKeyFieldId, self.FLogFieldNames.FieldIDObject,
                                      self.FLogFieldNames.FieldIDUser,self.FLogFieldNames.FieldAction,
                                      self.FLogFieldNames.FieldDATE,self.FLogFieldNames.FieldFormName,
                                      self.FLogFieldNames.FieldFormCaption,self.FLogFieldNames.FieldDATA,self.FLogFieldNames.FieldIconApplication ],
                                      [ftString,ftString,ftString,ftString,ftInteger,ftInteger,ftInteger, ftDateTime,ftString,ftString,ftBlob,ftBlob] );}

  {TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldApplicationName).Value := ExtractFileName( Application.ExeName );
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldTitleElem).Value := self.FTitle;
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldTableName).Value := self.TableName;
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldKeyFieldId).Value:= self.FFieldKod;
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldIDObject).Value  := CurrIDObj;
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldIDUser).Value    := UserId;
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldAction).Value    := FGetIndexAction(Action);
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldDATE).Value      := ConvertDateTime(Now);
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldFormName).Value  := ActiveFormName;
  TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldFormCaption).Value := ActiveFormCaption;}

  StmIcon   := TMemoryStream.Create;
  try
    IconApplication.SaveToStream( StmIcon );
    DBSetParamStream( StoredProc, self.FLogFieldNames.FieldIconApplication, StmIcon, ftBlob );
    //TIBStoredProc(StoredProc).ParamByName(self.FLogFieldNames.FieldIconApplication).LoadFromStream( StmIcon, ftBlob );
  finally
    FreeAndNil(StmIcon);
  end;

  Stm := TMemoryStream.Create( );
  try
    Len := Length(FLogFieldPackedData);

    Stm.Write( Len, Sizeof(Len) );
    Stm.Write( FLogFieldPackedData[0], Len*SizeOf(TfieldPackedValue) );

    DBSetParamStream( StoredProc, self.FLogFieldNames.FieldDATA, Stm, ftBlob );
    //TIBStoredProc(StoredProc).ParamByName( self.FLogFieldNames.FieldDATA ).LoadFromStream( Stm, ftBlob );
    
  finally
    FreeAndNil(Stm);
  end;

  DBStoredProcExec( StoredProc );
  //TIBStoredProc(StoredProc).ExecProc;
 finally
   SetLength( FLogFieldPackedData , 0 );
   //DestroyStorProc( StoredProc )
   DBDestroyStorProc( StoredProc );
 end;
end;
//******************************************************************************
function TDBShema.FGetCaptionField(aFieldName:Widestring):Widestring;
begin
 if not TestConnect then exit;
 
 if (self is TDBShemaView)and( TDBShemaView(self).View<>nil )and(TDBShemaView(self).View.GetColumnByFieldName(aFieldName)<>nil ) then
   result:= TDBShemaView(self).View.GetColumnByFieldName(aFieldName).Caption
 else
   if FDB.FindField(aFieldName)<>nil then
     result := FDB.FieldByName(aFieldName).DisplayLabel
      else result:='';
end;
//******************************************************************************
procedure TDBShema.FAddLogIB( UserId:Integer; Action : TActionLog );
var DBparam:TConnectDBParam;
    ActiveFormName:WideString;
    ActiveFormCaption:WideString;
begin
  if (screen<>nil)and(screen.ActiveForm <> nil) then
  begin
    ActiveFormName := screen.ActiveForm.Name;
    ActiveFormCaption := screen.ActiveForm.Caption;
  end
  else
  begin
    ActiveFormName := '';
    ActiveFormCaption := '';
  end;
  
  FAddLogIBSQLUpdate( UserId, Action, ActiveFormName, ActiveFormCaption );
end;
//******************************************************************************
procedure TDBShema.LogOnOff( aEnabled:Boolean );
begin
  FNeedSaveToLog := aEnabled;
end;
//******************************************************************************
procedure TDBShema.FSaveToLog( Action : TActionLog );
var CurrUserId :Variant;
begin
  if self.FLogStoredProcName = '' then Exit;
  if not FNeedSaveToLog then exit;
  CurrUserId := FGetUserId;

  if CurrUserId = null then
  begin
    self.FSysError( 'Set user element for '+self.Name+' or for Log Element ' );
    exit;
  end;

  if ( FDB is TIBQuery ) or ( FDB is TIBDataset ) then FAddLogIB( CurrUserId, Action );
end;
//******************************************************************************
function TDBShema.FGetAction:TActionLog;
begin
  if Self.DB.State = dsEdit   then result := OptActionLogEdit;
  if Self.DB.State = dsInsert then result := OptActionLogInsert;
end;
//******************************************************************************
function TDBShema.FGetIndexAction(aCurrActLog:TActionLog):Integer;
begin
  if aCurrActLog = OptActionLogInsert then result:=0;
  if aCurrActLog = OptActionLogEdit then result:=1;
  if aCurrActLog = OptActionLogDelete then result:=2;
end;
//******************************************************************************
procedure TDBShema.SetTableAlies(aAlies:string);
begin
  self.FAliesTable := aAlies;
end;
//******************************************************************************
function TDBShema.GetTableNameAlies:string;
begin
  if Trim( self.FAliesTable) ='' then Result:=self.TableName
  else result := self.FAliesTable;
end;
 //******************************************************************************
procedure TDBShema.AfterPost(DataSet: TDataSet);
var i:Integer;
begin
  //if FIsLock then Exit;
  //********************************
  if FDB is TCustomADODataSet then Self.RequeryCurrentRecord;

  if self.FLogStoredProcName <> '' then
  begin
    FPreapareLogFieldPackedData;
    FSaveToLog( Self.FBeforeStateAction );
  end;

  //*********************************************************
  if @PersonalAfterPost<>nil then PersonalAfterPost(DataSet);
  if FAutoComitedIB then self.DBCommitedIB;
  //********************************************************* 
  FUpdateTranslateTable( Dataset );
  self.WebSynchronizeRow;
  FIndCloneElemAndLockDBEvents(False);
end;
//******************************************************************************
procedure TDBShema.DBDisableControls;
begin
  self.FDB.DisableControls;
  FControlsDisabled:=true;
end;
//******************************************************************************
procedure TDBShema.DBEnableControls;
begin
  self.FDB.EnableControls;
  FControlsDisabled:=False;
  self.DBReCalcFields;
end;
//******************************************************************************
function TDBShema.DBLocateByKey(const KeyValues: Variant):boolean;
begin
  result := DBLocate( self.FFieldKod, KeyValues, []);
end;
//******************************************************************************
function TDBShema.DBLocate(const KeyFields: string; const KeyValues: Variant;
  Options: TLocateOptions):boolean;
begin
  if not TestConnect then exit;

  try
    //self.DBDisableControls;  Не працювало
    result := self.DB.Locate( KeyFields , KeyValues, Options );
  finally
    //self.DBEnableControls;
  end;
end;
//******************************************************************************
function TDBShema.DBLocateSimple( const KeyField: string; KeyValue: Variant ):boolean;
begin
  if not TestConnect then exit;
  //*************************************
  if self.DB.FieldByName(KeyField).Value = KeyValue then
  begin
    result := True;
    exit;
  end;
  //*************************************
  try
    result:=False;
    self.DB.DisableControls;
    self.DB.First;
    while not self.DB.Eof do
    begin
      if self.DB.FieldByName(KeyField).Value = KeyValue then
      begin
        result := True;
        break;
      end;
      self.DB.Next;
    end;
  finally
    self.DB.EnableControls;
  end;
end;
//******************************************************************************
procedure TDBShema.SetActionInsertDBValue(Act:TUpdateValue);
begin
  FActInsertDB := Act;
end;
//******************************************************************************
procedure TDBShema.SetActionEditDBValue(Act:TUpdateValue);
begin
  FActEditDB := Act;
end;
//******************************************************************************
procedure TDBShema.SetActionViewDBValue(Act:TUpdateValue);
begin
  FActViewDB := Act;
end;
//******************************************************************************
procedure TDBShema.ViewActionValueDB;
begin
  if @FActViewDB<>nil then
    FActViewDB( self );
end;
//******************************************************************************
procedure TDBShema.FAddMasFiledValues;
var i:Integer;
    len:Integer;
    DeFValue:variant;
    CurrValue:Variant;
begin
  len:= Length(FCopyMasData);
  SetLength(FCopyMasData,Len+1);
  SetLength(FCopyMasData[len],DB.FieldCount);

  if not TestConnect then exit;

  for i:=0 to DB.FieldCount-1 do
  begin
   if Db.Fields[i].FieldKind = fkData then
     CurrValue:= DB.FieldByName(Db.Fields[i].FieldName).Value
   else CurrValue:=null;

   FCopyMasData[len][i].FieldName:=Db.Fields[i].FieldName;
   FCopyMasData[len][i].Value    :=CurrValue;
  end;
end;
//******************************************************************************
procedure TDBShema.FPasteFromMasFiledValues;
var Row,I:Integer;
    len:Integer;
    DeFValue:variant;
    CurrValue:Variant;
begin
  if not TestConnect then exit;

  len:= Length(FCopyMasData);
  for row:=0 to Length(FCopyMasData)-1 do
  begin
    for i:=0 to Length(FCopyMasData[row]) -1 do
      DB.FieldByName(FCopyMasData[row][i].FieldName).Value := FCopyMasData[row][i].Value;
  end;
end;
//******************************************************************************
procedure TDBShema.FClearMasCopy;
begin
  SetLength(FCopyMasData,0);
end;
//******************************************************************************
procedure TDBShema.DBInsertCopyRow;
begin
 if not TestConnect then exit;
 
 try
  FAddMasFiledValues;
  FFlagUpdateValueAfterInsert:=true;
  DB.Insert;
 finally
   FClearMasCopy;
   FFlagUpdateValueAfterInsert:=false;
 end;
end;
//******************************************************************************
function TDBShema.FPreapareMessageError(CurrErrMess:Widestring):Widestring;
var I:Integer;
    FindExceptionPosInd:Integer;
    ListMeess:TStringList;
begin
  try
   ListMeess := TStringList.Create;
   ListMeess.Text := CurrErrMess;
   FindExceptionPosInd:=-1;

   for i:=0 to ListMeess.Count-1 do
     if AnsiPos( 'exception', LowerCase( ListMeess.Strings[i] ) ) <> 0 then
     begin
       FindExceptionPosInd:=i;
       Break;
     end;
   //*******************************
   i:=0;
   if FindExceptionPosInd <> -1 then
   begin
     while i <= FindExceptionPosInd do
     begin
       ListMeess.Delete(0);
       Inc(i);
     end;
   end;
   //*******************************
   result:=ListMeess.Text; 
  finally
    ListMeess.Free;
  end;
end;
//******************************************************************************
procedure TDBShema.DBPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  //if FIsLock then Exit;
  //********************************

  if (AnsiPos( 'lock conflict', E.Message )<>0) {or
    (AnsiPos( 'Update Failed', E.Message )<>0) }then
  begin
   if FCounterLockConflict < FMaxCounterLockConflict then
   begin
     Action := daRetry;
     inc(FCounterLockConflict);
     exit;
   end
    else
    begin
     FCounterLockConflict:=0;
     Action:= daAbort;
    end;
  end;

  if  AnsiPos( 'Update Failedt', E.Message )<>0 then Exit;
  
  //if @PersonalPostError <> nil then PersonalPostError( DataSet, E, Action )
  //else
  begin
     if AnsiPos( 'CHECK constraint', E.Message )<>0 then
       MyShowMessageDlg( ErrorUpdateRecordCheckContraint , mtError, but_OK )
     else
      MyShowMessageDlg( FPreapareMessageError(E.Message) , mtError, but_OK );
  end;
  self.DB.Cancel;
  Abort;
end;
//******************************************************************************
procedure TDBShema.setMainSQL(const Value: WideString);
begin
  FMainSQL := Value;
end;
//******************************************************************************
procedure TDBShema.SetValidateBeforePost( FunctValidate:TValidtateBeforePost );
begin
  self.FFunctValidate:= FunctValidate;
end;
//******************************************************************************
procedure TDBShema.DBDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  //if FIsLock then Exit;
  //********************************

  if @PersonalDeleteError <> nil then PersonalDeleteError( DataSet, E, Action )
  else
    begin
      if AnsiPos( 'FOREIGN KEY constraint', E.Message )<>0 then
         MyShowMessageDlg( ErrorUpdateRecordDeleteForeignKeyContraint , mtError, but_OK )
      else
        MyShowMessageDlg( FPreapareMessageError(E.Message) , mtError, but_OK );
    end;
  Abort;
end;
//******************************************************************************
function TDBShema.FConfirmBeforeDelete:Boolean;
begin
  if (FAskBeforeDelete)and(FMessageForDelete<>'')  then
    result:= MyShowMessageDlg( FMessageForDelete, mtConfirmation, but_YES_NO ) = Res_YES
  else result:=True;
end;
//******************************************************************************
Function TDBShema.FDBDeleteAll:boolean;
var FSaveAskBeforeDel:Boolean;
begin
  if not TestConnect then exit;

  try
    FSaveAskBeforeDel:= self.FAskBeforeDelete;
    self.FAskBeforeDelete := False;
    while not self.FDB.Eof do
      self.FDB.Delete;

    result:=self.DBRecordCount = 0;
  finally
    FAskBeforeDelete := FSaveAskBeforeDel;
  end;
end;
//******************************************************************************
Procedure TDBShema.CascadeDelete;
var i:Integer;
    FSaveAskBeforeDel:Boolean;
begin
  if not TestConnect then exit;

  try
    FSaveAskBeforeDel:= self.FAskBeforeDelete;
    self.FAskBeforeDelete := False;

    for i:=0 to self.DetailElem.Count-1 {Length(self.DetailElem)-1} do
    begin

      if ( TDBShema(self.DetailElem[i]).DBRecordCount<>0) then
        begin
          if ( TDBShema(self.DetailElem[i]).DetailCount <> 0 ) then
            TDBShema(self.DetailElem[i]).CascadeDelete;

          if not TDBShema(self.DetailElem[i]).FDBDeleteAll then Break;
        end

    end;
    
    Self.DB.Delete;
  finally
    FAskBeforeDelete := FSaveAskBeforeDel;
  end;
end;
//******************************************************************************
procedure TDBShema.SetShowUpdateForm(const Value: boolean);
begin
  FShowUpdateForm := Value;
end;
//******************************************************************************
Procedure TDBShema.FPreapareLogFieldPackedData;
var i:Integer;
begin
  if FLogStoredProcName <>'' then
    FLogFieldPackedData := FCreateStructDBRow;
end;
//******************************************************************************
procedure TDBShema.BeforeCancel(DataSet: TDataSet);
begin
  //if FIsLock then Exit;
  //*******************
  if @PersonalBeforeCancel<>nil then PersonalBeforeCancel(DataSet);
end;
//******************************************************************************
procedure TDBShema.AfterCancel(DataSet: TDataSet);
begin
  //if FIsLock then Exit;
  //*******************
  FIndCloneElemAndLockDBEvents(False);
  if @PersonalAfterCancel<>nil then PersonalAfterCancel(DataSet);
end;
//******************************************************************************
procedure TDBShema.BeforeDelete(DataSet: TDataSet);
begin
  //if FIsLock then Exit;
  FIndCloneElemAndLockDBEvents(True);
  //if FIsLock then Exit;
  if not CheckRoleDelete( -1 , True ) then Abort;
  //*******************
  if (self.FBeforeDeleteCheckFunct <> '')and( not FCheckBeforeDeleteTrigerFunct ) then Abort;

  if not FConfirmBeforeDelete then Abort;

  if ( not FCheckId(DataSet.FieldByName(self.FFieldKod).AsString) ) then
  begin
    MyShowMessageDlg( DefMessRecordWasDeletedOtherUser, mtInformation, but_OK );
    abort;
  end;
  //********************************
  ResyncCommandTable( FDB, self.TableName, GetTableNameAlies, self.FFieldKod );
  FPrepareUpdateObjectDeleteCurrentIB;
  FPreapareLogFieldPackedData;
  self.FBeforeStateAction   := OptActionLogDelete;
  self.FBeforeUpdateValueID := Self.GetValueId;
  //********************************
  if self is TDBShemaView then
    if (TDBShemaView(self).View<>nil)and(TDBShemaView(self).View.Controller.FocusedRow<>nil) then
      TDBShemaView(self).FPrevDeleteIndex := TDBShemaView(self).View.Controller.FocusedRow.Index - 1;
  //********************************
  if @PersonalBeforeDelete<>nil then PersonalBeforeDelete(DataSet);

end;
//******************************************************************************
procedure TDBShema.BeforeInsert(DataSet: TDataSet);
begin
  //if FIsLock then Exit;
  FIndCloneElemAndLockDBEvents(True);
  //if FIsLock then Exit;

  if not self.CheckRoleInsert( -1, True ) then Abort;

  FCounterLockConflict :=0;
  FPrepareUpdateObjectInsertCurrentIB;
  if self.FMainelem <> nil then
   if (self.FMainelem.DB.State in [dsInsert,dsEdit]) then self.FMainelem.DB.post;

  if self.FRelationTopElem <> nil then
   if (self.FRelationTopElem.DB.State in [dsInsert,dsEdit]) then
     self.FRelationTopElem.DB.post;

  if @PersonalBeforeInsert<>nil then PersonalBeforeInsert(DataSet);
end;
//******************************************************************************
procedure TDBShema.BeforeOpen(DataSet: TDataSet);
begin
  //if FIsLock then Exit
  //********************************
  if AllElemnts.IndexOf( self )= -1 then exit;

  try
    if @PersonalBeforeOpen<>nil then PersonalBeforeOpen(DataSet);
  except
    ShowMessage( DataSet.Name);
    ShowMessage( self.Name);
  end;
end;
//******************************************************************************
procedure TDBShema.BeforeClose(DataSet: TDataSet);
begin
  //if FIsLock then Exit;
  //********************************

  if not TestConnect then Abort;
  if @PersonalBeforeClose<>nil then PersonalBeforeClose(DataSet);
end;
//******************************************************************************
procedure TDBShema.BeforePost(DataSet: TDataSet);
begin
  //if FIsLock then Exit;

  self.FBeforeStateAction := FGetAction;
  self.FBeforeUpdateValueID := Self.GetValueId;

  self.FPrepareUpdateObjectUpdateCurrentIB(True);
  ResyncCommandTable( FDB, self.TableName, GetTableNameAlies, self.FFieldKod );
  if @PersonalBeforePost<>nil then PersonalBeforePost(DataSet);
end;
//******************************************************************************
procedure TDBShema.AfterScroll(DataSet: TDataSet);
var Accept:Boolean;
begin
  //if FIsLock then Exit;
  //********************************
  if AllElemnts.IndexOf( self )= -1 then exit;

  if FControlsDisabled then exit;
  if @PersonalAfterScroll<>nil then PersonalAfterScroll(DataSet);
end;
//******************************************************************************
procedure TDBShema.OnCalcFields( DataSet: TDataSet );
begin
  //if FIsLock then Exit;
  //********************************

  if FControlsDisabled then exit; 
  if @PersonalCalckFields<>nil then PersonalCalckFields( DataSet );
end;
//******************************************************************************
procedure TDBShema.DBReCalcFields;
begin
  if not TestConnect then exit;
  if self.FDB = nil then exit;
  
  if (not self.FDB.Active) or (self.FDB.IsEmpty) then Exit;
  self.FDB.Resync([]);
end;
//******************************************************************************
procedure TDBShema.BeforeEdit(DataSet: TDataSet);
begin
  FIndCloneElemAndLockDBEvents(True);
  //if FIsLock then Exit;

  if not self.CheckRoleUpdate( -1, True ) then Abort;

  FCounterLockConflict:=0;
  ResyncCommandTable( FDB, self.TableName, GetTableNameAlies, self.FFieldKod );
  if @PersonalBeforeEdit<>nil then PersonalBeforeEdit(DataSet);
end;
//******************************************************************************
procedure TDBShema.AfterEdit(DataSet: TDataSet);
begin
  //if FIsLock then Exit;
  //********************************
  if @FActEditDB<>nil then
  if not FActEditDB( self) then
  begin
    DataSet.Cancel;
    Exit;
  end;
 //**************************
 if @PersonalAfterEdit<>nil then PersonalAfterEdit(DataSet);
end;
//******************************************************************************
function TDBShema.FIndCloneElemtsCountByDataset( DB:TDataset ):Integer;
var i:Integer;
begin
  result:=0;
  for i:=0 to AllElemnts.Count-1 do
  begin
    if (TDBShema(AllElemnts.Items[i]).DB = DB ) and
       (TDBShema(AllElemnts.Items[i]) <> Self ) then
      result := result + 1;
  end;
end;
//******************************************************************************
function TDBShema.FIndCloneElementCountByIDElem( aIDElem:String ):Integer;
var i:Integer;
begin
  result:=0;
  for i:=0 to AllElemnts.Count-1 do
  begin
    if (TDBShema(AllElemnts.Items[i]).FIDElem = aIDElem ) and
       (TDBShema(AllElemnts.Items[i]) <> Self ) then
      result := result + 1;
  end;
end;
//******************************************************************************
procedure TDBShema.FIndCloneElemAndLockDBEvents( aLock:Boolean );
var i:Integer;
begin
  {for i:=0 to AllElemnts.Count-1 do
  begin
    if (TDBShema(AllElemnts.Items[i]).DB = self.DB) and
       (TDBShema(AllElemnts.Items[i]) <> Self ) then
      TDBShema(AllElemnts.Items[i]).IsLock := aLock;
  end;}
end;
//******************************************************************************
procedure TDBShema.FSetEnabled(En: Boolean);
begin
 self.FEnabled := En;
end;
//******************************************************************************
function TDBShema.FCheckId(idValueStr:String):boolean;
var DBParam:TConnectDBParam;
begin
  if not TestConnect then exit;
  if ( FDB is TIBQuery ) or ( FDB is TIBTable ) or ( FDB is TIBDataset ) then
  begin
    DBParam:=FGetDBParam;
    result := UnitIBQuery.IDCheckIS(self.FTableName, self.FFieldKod, DBParam.PathDB, DBParam.UID, DBParam.Password, idValueStr );
  end
  else
  if ( FDB is TCustomADODataSet )  then
    result := UnitADOQuery.IDCheckIS( FGetDBParam.ADOConnection, self.FTableName, self.FFieldKod, idValueStr )
  else
  result := True;
end;
//******************************************************************************
function TDBShema.FGetSqlWithoutAfterFrom:Widestring;
begin
  result := GetSqlWithoutAfterFrom(FDB);
end;
//******************************************************************************
function TDBShema.DBGetSQLWithoutAfterFrom:Widestring;
begin
  result := FGetSqlWithoutAfterFrom;
end;
//******************************************************************************
Procedure TDBShema.FPrepareUpdateObjectRefreshCurrentIB( UpdateSQL:Widestring ='' );
var SqlRefresh:WideString;
    KeyField:WideString;
    aMainSql:WideString;
begin
  if self.FUpdateSqlIB = nil then exit;
  if not TestConnect then exit;
  if not (self.FDB is TIBCustomDataSet) then exit;

  if (FDB is TIBQuery)or(FDB is TIBDataset) then
  begin
    if UpdateSQL='' then
    begin

     SqlRefresh := FGetSqlWithoutAfterFrom;
     if self.GetTableNameAlies<>'' then KeyField:= self.GetTableNameAlies+'.'+self.FieldKod
     else KeyField:= self.FieldKod;

     {aMainSql := GetDBSql( self.FDB );

     if DBHaveWHereSql( aMainSql ) then
      SqlRefresh:= aMainSql+' AND ' + KeyField + '=:'+self.FieldKod
     else  SqlRefresh:= aMainSql+' Where ' + KeyField + '=:'+self.FieldKod; }

     SqlRefresh := SqlRefresh+' Where ' + KeyField + '=:'+self.FieldKod;
    end
     else SqlRefresh := UpdateSQL;
     
    if self.FUpdateSqlIB <> nil then
      self.FUpdateSqlIB.RefreshSQL.Text := ( SqlRefresh );
  end;
end;
//******************************************************************************
Procedure TDBShema.FPrepareUpdateObjectDeleteCurrentIB;
begin
  if not (self.FDB is TIBCustomDataSet) then exit;
  if self.FUpdateSqlIB <> nil then
    self.FUpdateSqlIB.DeleteSQL.Text :=  'delete from '+self.TableName+' where '+self.TableName+'.'+self.FieldKod+'=:OLD_'+self.FieldKod;
end;
//******************************************************************************
procedure TDBShema.AddTranslateTable( TableName, FieldName, FieldIdParentName,FieldLndIdName,
                                      FieldChange: String; IdLocalUpdate:Variant; WidthColum:Integer=-1; IndTableTemplate:Integer=-1 );
var len : Integer;
begin
  len := Length(FTranslateOptions);
  SetLength( FTranslateOptions,len+1 );
  FTranslateOptions[len].TableName := TableName;

  FTranslateOptions[len].FieldName := FieldName;
  FTranslateOptions[len].FieldIdParentName := FieldIdParentName;
  FTranslateOptions[len].FieldLndIdName := FieldLndIdName;
  FTranslateOptions[len].FieldChange := FieldChange;
  FTranslateOptions[len].IdLocalUpdate := IdLocalUpdate;
  FTranslateOptions[len].WidthColum := WidthColum;
  FTranslateOptions[len].IndTableTemplate := IndTableTemplate;
end;
//******************************************************************************
function TDBShema.GetParamTranslateTableByFiedlName( FieldName:String ):TTranslateOptions;
var i:Integer;
begin
  result.TableName :='';
  result.FieldName :='';
  result.FieldChange :='';
  result.FieldIdParentName := '';

  for i:=0 to Length(FTranslateOptions)-1 do
  begin
    if CompareText( FTranslateOptions[i].FieldName,FieldName) = 0 then
    begin
      result := FTranslateOptions[i];
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShema.GetParamsTranslateTable:TTranslateOptionsArr;
begin
  result := FTranslateOptions;
end;
//******************************************************************************
procedure TDBShema.AssignParamsTranslateTable( TranslateOptionsArr:TTranslateOptionsArr );
var i:Integer;
begin
  SetLength(FTranslateOptions,0);
  for i:=0 to Length( TranslateOptionsArr )-1 do
    AddTranslateTable( TranslateOptionsArr[i].TableName,  TranslateOptionsArr[i].FieldName,  TranslateOptionsArr[i].FieldIdParentName,
                       TranslateOptionsArr[i].FieldLndIdName,  TranslateOptionsArr[i].FieldChange, TranslateOptionsArr[i].IdLocalUpdate,
                       TranslateOptionsArr[i].WidthColum, TranslateOptionsArr[i].IndTableTemplate );
end;
//******************************************************************************
function TDBShema.GetMainParamTranslateTable:TTranslateOptions;
begin
  if Length(FTranslateOptions)<>0 then
    Result:=FTranslateOptions[0]
  else
  begin
    result.TableName :='';
    result.FieldName :='';
    result.FieldChange :='';
    result.FieldIdParentName := '';
  end;
end;
//******************************************************************************
procedure TDBShema.FUpdateTranslateTableByFieldName( FieldName:String );
var SQL:string;
    CurrParam:TTranslateOptions;
    aDB:TIBQuery;
begin
  CurrParam := GetParamTranslateTableByFiedlName( FieldName );
  if (CurrParam.TableName <>'')and(CurrParam.FieldIdParentName<>'') then
  begin
    SQL := 'UPDATE '+CurrParam.TableName+' SET '+CurrParam.FieldChange+'=1 where '+CurrParam.FieldIdParentName+'='+self.GetValueIdStr;

    if self.DBGetParamConnect.IBDatabaseConnection <> nil then
      UnitIBQuery.UpdateSql( self.DBGetParamConnect.PathDB, self.DBGetParamConnect.UID, self.DBGetParamConnect.Password, SQL );

    if self.DBGetParamConnect.ADOConnection <> nil then
      UnitADOQuery.UpdateSql( self.DBGetParamConnect.ADOConnection, SQL );

    UpdateLanguageFieldNameValue( self, CurrParam.TableName,CurrParam.FieldIdParentName,
                                  CurrParam.FieldLndIdName, CurrParam.FieldName,CurrParam.FieldChange ,
                                  Self.DB.FieldByName( CurrParam.FieldName).asString, self.GetValueId, CurrParam.IdLocalUpdate, 0 );
  end;
end;
//******************************************************************************
procedure TDBShema.FUpdateTranslateTable( Dataset:TDataset );
var i:Integer;
begin
  for i:=0 to Length(FTranslateOptions)-1 do
  begin
    if (Dataset.FindField( FTranslateOptions[i].FieldName ) <> nil)and
       ( Dataset.FindField( FTranslateOptions[i].FieldName ).OldValue <>
         Dataset.FindField( FTranslateOptions[i].FieldName ).Value ) then
      FUpdateTranslateTableByFieldName( FTranslateOptions[i].FieldName );
  end;
end;
//******************************************************************************
Procedure TDBShema.FPrepareUpdateObjectUpdateCurrentIB( FixBlobNull:Boolean=false );
var i:Integer;
    SqlUpdateFields:TStringList;
    SqlUpdateFieldsText:WideString;
    SplFields:String[1];
    CurrUpdateParam:WideString;
    // aAlies:string;
begin
  if self.FUpdateSqlIB = nil then exit;
  if self.FFieldsSelfTable.Count = 0  then exit;
  if not TestConnect then exit;
  if not (self.FDB is TIBCustomDataSet) then exit;

  try
    SqlUpdateFields:=TStringList.Create;
    SqlUpdateFields.Add( 'UPDATE '+Self.TableName+' '+self.FAliesTable+ ' SET ' ); //' '+self.GetTableNameAlies+

    SplFields:=',';
    SqlUpdateFieldsText:='';
    //if self.FAliesTable<>'' then aAlies:=self.FAliesTable+'.'
    //else aAlies := '';
    
    for i:=0 to self.FFieldsSelfTable.Count-1 do
    begin
      if (CompareText(self.FFieldsSelfTable.Strings[i], self.FFieldKod )<>0)and
         (self.FDB.FindField( self.FFieldsSelfTable.Strings[i] )<>nil)or(self.FDB.Fields.Count=0) then
      begin
        if ( FixBlobNull )and
           ( self.FDB.FieldByName( self.FFieldsSelfTable.Strings[i] ).IsBlob ) and ( self.FDB.FieldByName(self.FFieldsSelfTable.Strings[i]).AsString='' ) then
          CurrUpdateParam:='null'
        else
          CurrUpdateParam:=':'+self.FFieldsSelfTable.Strings[i];

        SqlUpdateFieldsText:=SqlUpdateFieldsText+' '+self.FFieldsSelfTable.Strings[i]+' = '+ CurrUpdateParam +SplFields;
      end;
    end;
    //*************************
    if (SqlUpdateFieldsText<>'')and(SqlUpdateFieldsText[Length(SqlUpdateFieldsText)]=',') then
      Delete(SqlUpdateFieldsText,Length(SqlUpdateFieldsText),1);
    //*************************

    SqlUpdateFields.Add( SqlUpdateFieldsText );
    SqlUpdateFields.Add( ' where '+GetTableNameAlies+'.'+self.FieldKod+'=:OLD_'+self.FieldKod ); ///self.TableName+'.'+
    if self.FUpdateSqlIB <> nil then
      self.FUpdateSqlIB.ModifySQL := SqlUpdateFields;
  finally
    SqlUpdateFields.Free;
  end;
end;
//******************************************************************************
Procedure TDBShema.FPrepareUpdateObjectInsertCurrentIB;
var i:Integer;
    SplFields:string[1];
    SqlFields:WideString;
    SqlValuesFileds:WideString;
    SqlUpdateFields:TStringList;
begin
  if self.FFieldsSelfTable.Count = 0  then exit;
  if not TestConnect then exit;
  if not (self.FDB is TIBCustomDataSet) then exit;

  try
    SqlUpdateFields:=TStringList.Create;
    SqlUpdateFields.Add( 'INSERT INTO ' + self.TableName );

    SplFields:=',';
    
    for i:=0 to self.FFieldsSelfTable.Count-1 do
    begin
      if (self.FDB.FindField( self.FFieldsSelfTable.Strings[i])<>nil)or(self.FDB.Fields.Count=0) then
      begin
        SqlFields := SqlFields + self.FFieldsSelfTable.Strings[i] + SplFields;
        SqlValuesFileds := SqlValuesFileds + ':'+self.FFieldsSelfTable.Strings[i] + SplFields;
      end;
    end;

    //*************************
    if (SqlFields<>'')and(SqlFields[Length(SqlFields)]=',') then
      Delete(SqlFields,Length(SqlFields),1);

    if (SqlValuesFileds<>'')and(SqlValuesFileds[Length(SqlValuesFileds)]=',') then
      Delete(SqlValuesFileds,Length(SqlValuesFileds),1);
    //*************************

    SqlUpdateFields.Add(' ( '+ SqlFields+' ) ');
    SqlUpdateFields.Add(' values ( '+ SqlValuesFileds+' ) ');

    if self.FUpdateSqlIB <> nil then
      self.FUpdateSqlIB.InsertSQL := SqlUpdateFields;
  finally
    SqlUpdateFields.Free;
  end;
end;
//******************************************************************************
Procedure TDBShema.FRequeryCurrentRecordIB( UpdateSQL:Widestring ='' );
begin
  if not TestConnect then exit;

  FPrepareUpdateObjectRefreshCurrentIB( UpdateSQL );

  try
    TIBQuery(FDB).Refresh;
  except
    ShowMessage('Insert:' + self.FUpdateSqlIB.InsertSQL.text );
    ShowMessage('Update:' + self.FUpdateSqlIB.ModifySQL.text );
  end;
end;
//******************************************************************************
Procedure TDBShema.FRequeryIB(FetchAll:Boolean=False);
var SaveFlagElementWasRestorePosition:Boolean;
begin
 if not TestConnect then exit;

 try
   SaveFlagElementWasRestorePosition:= FFlagElementWasRestorePosition;
   FFlagElementWasRestorePosition := false;
   DBReopen(FetchAll);
 finally
   FFlagElementWasRestorePosition:= SaveFlagElementWasRestorePosition;
 end;
end;
//******************************************************************************
Procedure TDBShema.RequeryCurrentRecord( UpdateSQL:Widestring ='' );
begin
  if not TestConnect then exit;

  try
    Screen.Cursor := crHourGlass;
    if FDB.State in [dsInsert,DsEdit] then FDB.Post;
    
    if ( FDB is TIBCustomDataSet ) then
      FRequeryCurrentRecordIB( UpdateSQL );

    if FDB is TCustomADODataSet then
      RequeryOnePosRecordAdo( self.DB,self.TableName, GetTableNameAlies, self.FieldKod, UpdateSQL );

  finally
    Screen.Cursor := crDefault;
  end;
end;
//******************************************************************************
Procedure TDBShema.FSetUnRequiredAllFields;  //TArrFieldsParam
var i:Integer;
begin
  for i:=0 to self.FDB.FieldCount-1 do
    self.FDB.Fields[i].Required := false;
end;
//******************************************************************************
function TDBShema.FSaveFieldsToArray:TArrFieldsParam;
begin
  result := FieldsToArray( self.FDB );
end;
//******************************************************************************
Procedure TDBShema.FRestoreRequiredDBFields( arrField: TArrFieldsParam );
var i:Integer;
begin
  for i:=0 to Length( arrField )-1 do
    if self.FDB.FindField( arrField[i].FieldName ) <> nil then
      self.FDB.FieldByName( arrField[i].FieldName ).Required := arrField[i].Required;
end;
//******************************************************************************
Procedure TDBShema.FRequeryWait(BFetchAll:Boolean=False);
var Progres : TProgressFormProp;
begin
 try
   Progres := ShowProgress( WaitFormCaption );
   self.FRequery(BFetchAll);
 finally
   ClosedProgress( Progres.FormProgres );
 end;
end;
//******************************************************************************
Procedure TDBShema.FRequery(IBFetchAll:Boolean=False);
begin
  if not TestConnect then exit;

  self.SaveMarkID;

  try
    if (FDB is TIBCustomDataSet ) then
      FRequeryIB(IBFetchAll);

    if (FDB is TCustomADODataSet ) then
    begin
      if FDB.Active then
        TCustomADODataSet(FDB).Requery
      else self.DBOpen;
    end;

  finally
    self.GotoMarkID;
  end;
end;
//******************************************************************************
Procedure TDBShema.Requery( ShowWait:Boolean = False; IBFetchAll:Boolean=False );
begin
  if self = nil then exit;
  if ShowWait then FRequeryWait
  else self.FRequery(IBFetchAll);
end;
//******************************************************************************
Procedure TDBShema.RequeryDetailCascade( JustDetail:Boolean=false );
var i:Integer;
begin
  if not TestConnect then exit;

  if not JustDetail then self.Requery;
  if @self.FFunctionSQLRefreshData <> nil then self.FFunctionSQLRefreshData( self.MainElement, self );

  for i:=0 to DetailElem.Count - 1 do
   TDBShema(self.DetailElem[i]).RequeryDetailCascade;
end;
//******************************************************************************
procedure TDBShema.FSetTableName(aTable: Widestring);
begin
  self.FTableName := aTable;
end;
//******************************************************************************
procedure TDBShema.FSetFieldKod(aFieldKod: Widestring);
begin
  self.FFieldKod := aFieldKod;
end;
//******************************************************************************
procedure TDBShema.FSetFieldMainKod( aFieldMainKod: Widestring );
begin
  self.FFieldMainKod := aFieldMainKod;
end;
//******************************************************************************
procedure TDBShema.FSetFieldNumber( aFieldNumber: Widestring );
begin
 self.FFieldNumber := aFieldNumber;
end;
//******************************************************************************
procedure  TDBShema.FSetFieldRelationTopKod( aFieldRelationTopKod: Widestring );
begin
  self.FFieldRelationTopKod := aFieldRelationTopKod;
end;
//******************************************************************************
procedure TDBShema.DBScrollLock;
begin
  DBDisableControls;
  FDB.AfterScroll:=nil;
end;
//******************************************************************************
procedure TDBShema.DBScrollUnLock;
begin
  DBEnableControls;
  FDB.AfterScroll:= self.AfterScroll;
end;
//******************************************************************************
Procedure TDBShema.DBFetchAllIB;
begin
  if self.FDB is TIBCustomDataSet then TIBCustomDataSet(self.FDB).FetchAll;
end;
//******************************************************************************
procedure TDBShema.DBOpen( IBFetchAll:Boolean=False );
begin
  if not TestConnect then exit;
  if self.FDB.Active then exit;

  try
    self.DBDisableControls;
    //try
      if (self.FDB <> nil) then
      begin
        self.FDB.Open;
        if (IBFetchAll) then DBFetchAllIB;
      end;
    //except
      //FSysError('Open Dataset '+self.FDB.Name );
    //end;

  finally
    self.DBEnableControls;
  end;
end;
//******************************************************************************
procedure TDBShema.DBOpenWait( IBFetchAll:Boolean=False );
var Progres : TProgressFormProp;
begin
  if self.FDB = nil then exit;

  if self.FDB.Active then exit;
  try
    Progres := ShowProgress( WaitFormCaption );
    //Application.ProcessMessages;
    self.DBOpen( IBFetchAll );
  finally
    ClosedProgress( Progres.FormProgres );
  end;
end;
//******************************************************************************
function PrepareSQLToChange(aDB:TADOQuery;aSQL:String ):string;
var SQLList:TStringList;
    i:Integer;
begin
  //#10
  try
    aDB.SQL.Clear;
    SQLList := TStringList.Create;
    SQLList.Text := aSQL;
    aDB.SQL.Assign( SQLList );
    //for i:=0 to SQLList.Count-1 do
    //  aDB.SQL.Add( Trim( SQLList.Strings[i] ) + #10+' ' );
      //SQLList.Strings[i]:= SQLList.Strings[i]+#10;

   // Result := SQLList.Text;
  finally
    SQLList.Free;
  end;
end;
//******************************************************************************
procedure TDBShema.PrepareParam;
begin
  FSaveParamDB(FDB);
  FClearParamDB(FDB);
  FRestoreParamDB(FDB);
end;
//******************************************************************************
procedure TDBShema.ParamClearValue;
var i:integer;
    aDBParamsADO : TParameters;
    aDBParamsIB  : TParams;
begin
  aDBParamsADO := nil;
  aDBParamsIB := nil;
  if FDB is TAdoQuery then aDBParamsADO := TAdoQuery(FDB).Parameters;
  if FDB is TAdoDataset then aDBParamsADO := TAdoDataset(FDB).Parameters;
  if FDB is TIBQuery then aDBParamsIB := TIBQuery(FDB).Params;

  if aDBParamsADO <> nil then
    for i:=0 to aDBParamsADO.Count-1 do
      aDBParamsADO.Items[i].Value := Unassigned;

  if aDBParamsIB <> nil then
    for i:=0 to aDBParamsIB.Count-1 do
      aDBParamsIB.Items[i].Value := Unassigned;
end;

//******************************************************************************
procedure TDBShema.DBQueryChangeSql(NewSql:Widestring; Active:Boolean=True;IBFetchAll:Boolean=false);
var DBWasActive:Boolean;
begin
 if not TestConnect then exit;

 if (FDB is TIBCustomDataSet) or (FDB is TQuery) or
    (FDB is TCustomADODataSet ) then
 begin
   try
     DBWasActive := FDB.Active;
     SaveMarkID;
     if FDB.Active then FDB.Close;

     if FSaveAndRestoreParamAfterChangeSql then FSaveParamDB(FDB);
     QueryChangeSQL( FDB, NewSQL);
     if FSaveAndRestoreParamAfterChangeSql then FRestoreParamDB(FDB);
     
     if Active then self.DBOpen( IBFetchAll );
   finally
     if (FDB.Active)and(DBWasActive) then GotoMarkID;
   end;
 end;
end;
//******************************************************************************
procedure TDBShema.DBQueryChangeSqlAfterFor(NewWhereSql:Widestring;IBFetchAll:Boolean=false);
var Sql:Widestring;
begin
  Sql := FGetSqlWithoutAfterFrom;
  Sql := Sql + NewWhereSql;
  if Sql <> '' then
    DBQueryChangeSql(Sql, FDB.Active,IBFetchAll );
end;
//******************************************************************************
procedure TDBShema.DBQueryRestoreFromMainSql( Active:Boolean=True;IBFetchAll:Boolean=false );
begin
   DBQueryChangeSql( self.MainSQL, Active,IBFetchAll );
end;
//******************************************************************************
procedure TDBShema.SaveMarkID;
begin
  if not TestConnect then exit;

  if (self.FFieldKod<>'')and(self.FDB<>nil)and(self.FDB.Active) then
    FSaveMarkID:=self.GetValueId
  else FSaveMarkID:=null;
end;
//******************************************************************************
function TDBShema.GotoMarkID:boolean;
begin
  result := False;
  if not TestConnect then exit;

  if ( FSaveMarkID <> null ) and ( self.FFieldKod<>'' )and
     ( self.FDB<>nil)and(self.FDB.Active) then
     result := DBLocateSimple( self.FFieldKod, FSaveMarkID );
    //self.DB.Locate( self.FFieldKod,FSaveMarkID, [] );

  FSaveMarkID:=null;
end;
//******************************************************************************
procedure TDBShema.GotoBookmark;
begin
  if not TestConnect then exit;

  if db.BookmarkValid( self.FBookmark ) then
  begin
    DB.GotoBookmark( self.FBookmark );
    DB.FreeBookmark( self.FBookmark );
    if (self is TDBShemaView )and( TDBShemaView(Self).View<>nil ) then
      TDBShemaView(Self).SetFocusOnView;
  end;
end;
//******************************************************************************
procedure TDBShema.SaveBookmark;
begin
  if not TestConnect then exit;

  self.FBookmark:=db.GetBookmark;
end;
//******************************************************************************
procedure TDBShema.DBClose;
begin
  self.FDB.Close;
  DBCommitedIB;
end;
//******************************************************************************
procedure TDBShema.DBReOpen( IBFetchAll:Boolean=False);
begin
  if not TestConnect then exit;

  if not self.FDB.Active then self.FDB.Open
  else
  begin
   try
     self.DBDisableControls;
     SaveMarkID;
     self.DBClose;
     self.FDB.Open;
     if IBFetchAll then self.DBFetchAllIB;
   finally
     self.DBEnableControls;
     GotoMarkID;
   end;
  end;

end;
//******************************************************************************
Procedure TDBShema.DBAddValues(Fields:array of string;FieldValues:array of variant);
var i:Integer;
begin
  if Length(Fields)<>Length(FieldValues) then
  begin
    FSysError('Count Fields not equal count Values!');
    exit;
  end;
  //************************************
  if not TestConnect then exit;

  self.FDB.Append;
  for i:=0 to Length(Fields)-1 do
    if self.FDB.FindField( Fields[i] )<> nil then
      self.FDB.FieldByName(Fields[i]).Value := FieldValues[i]
    else
    begin
      FSysError('Field '+Fields[i]+' not found on Dataset '+FDB.Name);
      self.FDB.Cancel;
      Exit;
    end;
    
  self.FDB.Post;
end;
//******************************************************************************
Procedure TDBShema.FFSetMasterDetailADO(Destroy:boolean);
begin
  TADODataset(Self.DB).DataSource     :=nil;
  TADODataset(Self.DB).IndexFieldNames:='';
  TADODataset(Self.DB).MasterFields   :='';
  //***************************************************
  if not Destroy then
  begin //2
    TADODataset(Self.DB).MasterFields   :=self.FMainElem.FFieldKod;
    TADODataset(Self.DB).IndexFieldNames:=self.FFieldMainKod;
    TADODataset(Self.DB).DataSource     :=self.FMainElem.FDS;
  end  //2
end;
//******************************************************************************
Procedure TDBShema.FFSetMasterDetailAdoQuery(Destroy:boolean);
begin
  if not TestConnect then exit;

  TAdoQuery(Self.DB).DataSource :=nil;
  if not Destroy then
    TAdoQuery(Self.DB).DataSource:= self.FMainElem.FDS;
end;
//******************************************************************************
Procedure TDBShema.FFSetMasterDetailIBQuery(Destroy:boolean);
begin
  if not TestConnect then exit;

  TIBQuery(Self.DB).DataSource :=nil;
  if not Destroy then
    TIBQuery(Self.DB).DataSource:= self.FMainElem.FDS;
end;
//******************************************************************************
Procedure TDBShema.FFSetMasterDetailIBTable(Destroy:boolean);
begin
  if not TestConnect then exit;

  TIBTable(Self.DB).MasterSource:=nil;
  if not Destroy then
  begin
    TIBTable(Self.DB).MasterFields   := self.FMainElem.FFieldKod;
    TIBTable(Self.DB).IndexFieldNames:= self.FFieldMainKod;
    TIBTable(Self.DB).MasterSource   := self.FMainElem.FDS;
  end;
end;
//******************************************************************************
Procedure TDBShema.SetMasterDetail(Destroy:boolean);
var Controls:Boolean;
begin
 if self.FMainElem=nil then exit;
 if not TestConnect then exit;

 if (Self.DB is TADODataset) then FFSetMasterDetailADO( Destroy );
 if (Self.DB is TADOQuery) then FFSetMasterDetailADOQuery( Destroy );
 if (Self.DB is TIBQuery) or (Self.DB is TIBDataset) then FFSetMasterDetailIBQuery( Destroy );
 if (Self.DB is TIBTable) then FFSetMasterDetailIBTable( Destroy );
end;
//******************************************************************************
procedure TDBShema.AddFilterFunct( FilterAction : TOnFilterDB );
begin
  FFunctOnFilterDB := FilterAction;
end;
//******************************************************************************
procedure TDBShema.ClearFilterFunct;
begin
  FFunctOnFilterDB:= nil;
end;
//******************************************************************************
procedure TDBShema.Refilter;
begin
  self.DB.Filtered:=False;
  self.DB.Filtered:=True;
end;
//******************************************************************************
procedure TDBShema.OnFilterRecord(DataSet: TDataSet; var Accept: Boolean);
begin
  //if FIsLock then Exit;
  //********************************

  if not TestConnect then exit;

  if FShowNullDataset then
    Accept := False
  else
    if @FFunctOnFilterDB <> nil then
      FFunctOnFilterDB( DataSet, Accept );
end;
//******************************************************************************
procedure TDBShema.FShowEmptyFilterDataset( aEmpty:Boolean );
begin
  FShowNullDataset := aEmpty;
  self.FDB.Filtered := aEmpty;
end;
//******************************************************************************
procedure TDBShema.AddDatailElem( ADetailElem:TDBShema );
begin

  if ADetailElem <> nil then
  begin
    if DetailElem.IndexOf(ADetailElem)=-1 then
      DetailElem.Add( ADetailElem );
      
    //Setlength( DetailElem,Length(DetailElem)+1 );
    //DetailElem[Length(DetailElem)-1] := ADetailElem;
  end
  else
    FSysError('Detail Element Not Found for '+self.Name);
end;
//******************************************************************************
Procedure TDBShema.DeleteDatailElem( ADetailElem:TDBShema );
var FindIndex: integer;
begin
  FindIndex := DetailElem.IndexOf( ADetailElem );
  if FindIndex <> -1 then DetailElem.Delete(FindIndex);
end;
//******************************************************************************
procedure TDBShema.AddMainElem( AMailElem: TDBShema; afieldMainKod:String );
begin
  if AMailElem <> nil then
  begin
    self.FMainElem := AMailElem;
    self.FFieldMainKod := afieldMainKod;
    self.FMainElem.AddDatailElem( self );
  end;
end;
//******************************************************************************
procedure TDBShema.AddReletionTopElem( aReletionTopElem: TDBShema; afieldRelationTopKod:String );
begin
  if aReletionTopElem <> nil then
  begin
    self.FRelationTopElem := aReletionTopElem;
    self.FfieldRelationTopKod := afieldRelationTopKod;
    self.FRelationTopElem.AddDatailElem( self );
  end;
end;
//******************************************************************************
function TDBShema.GetTranslationFiledName(FieldName:Widestring):Widestring;
var i:Integer;
begin
  result:='';
  for i:=0 to Length(self.FFieldNameTranslate)-1 do
  begin
    if CompareText(  self.FFieldNameTranslate[i].FieldFrom , FieldName )=0 then
    begin
      result:= self.FFieldNameTranslate[i].FieldTo;
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShema.GetTranslationValue(FieldName:Widestring):Widestring;
var FieldTranslater:WideString;
begin
  FieldTranslater := GetTranslationFiledName( FieldName );
  if ( FieldTranslater<>'' ) and (self.DB.FindField( FieldTranslater )<>nil) then
    result:= self.DB.fieldByName( FieldTranslater ).AsString;
end;
//******************************************************************************
procedure TDBShema.FSysError(MessError:Widestring);
begin
  MyShowMessageDlg( 'Sys Error: '+MessError, mtError, but_OK );
end;
//******************************************************************************
procedure TDBShema.AddTranslationElem( aTranslateElem:TDBShema; ParamNameLangId:Widestring; FieldName,FieldNameTranslate:array of Widestring );
var i:Integer;
begin
  if Length( FieldName ) <> Length( FieldNameTranslate ) then
  begin
    FSysError('Count Fields not equal count Values!');
    Exit;
  end;
  //*******************************
  FTranslationElem := aTranslateElem;
  FParamNameLangId := ParamNameLangId;
  //*******************************
  FSetParamLangID( 0 );
  //*******************************
  SetLength( FFieldNameTranslate , Length(FieldNameTranslate));
  for i:=0 to Length(FieldName)-1 do
  begin
    FFieldNameTranslate[i].FieldFrom := FieldName[i];
    FFieldNameTranslate[i].FieldTo   := FieldNameTranslate[i];
  end;
end;
//******************************************************************************
function TDBShema.GetArrStafFieldArr:TVarArr;
begin
  SetLength(Result,3);
  Result[0] :=self.FieldKod;
  Result[1] :=self.FieldMainKod;
  Result[2] :=self.FieldRelationTopKod;
end;
//******************************************************************************
procedure TDBShema.FSetAskBeforeDelete(const Value: Boolean);
var i:integer;
    SameCloneObject:TList;
begin
  try
    SameCloneObject := GetAllSameCloneObject;
    for i:=0 to SameCloneObject.Count-1 do
      TDBShema(SameCloneObject.Items[i]).FAskBeforeDelete := Value;
  finally
    SameCloneObject.Free;
  end;
end;
//******************************************************************************
procedure TDBShemaView.FSetAutoRenomer(const Value: Boolean);
var i:integer;
    SameCloneObject:TList;
begin
  try
    SameCloneObject := GetAllSameCloneObject;

    for i:=0 to SameCloneObject.Count-1 do
      TDBShemaView(SameCloneObject.Items[i]).FAutoRenomer := Value;

  finally
    SameCloneObject.Free;
  end;
end;
//******************************************************************************
procedure TDBShema.FSetParamLangID(paramValue:Variant);
begin
   if not TestConnect then exit;

   if (FDB is TIBQuery) or ( Self.DB is TIBDataset ) then
   begin
     if TIBQuery(FDB).Params.FindParam(FParamNameLangId) <> nil then
       TIBQuery(FDB).ParamByName(FParamNameLangId).Value := paramValue;
   end;
   //***********************
   if (FDB is TQuery) then
   begin
     if TQuery(FDB).Params.FindParam(FParamNameLangId) <> nil then
       TQuery(FDB).ParamByName(FParamNameLangId).Value := paramValue;
   end;
   //***********************
   if (FDB is TADODataSet) then
   begin
     if TADODataSet(FDB).Parameters.FindParam(FParamNameLangId) <> nil then
       TADODataSet(FDB).Parameters.ParamByName(FParamNameLangId).Value := paramValue;
   end;
   //***********************
   if (FDB is TADOQuery) then
   begin
     if TADOQuery(FDB).Parameters.FindParam(FParamNameLangId) <> nil then
       TADOQuery(FDB).Parameters.ParamByName(FParamNameLangId).Value := paramValue;
   end;
   //***********************
end;
//******************************************************************************
procedure TDBShema.DBChangeLanguage(IDLanguage:Variant);
begin
  if not TestConnect then exit;

  try
     SaveMarkID;
     if FDB.Active then FDB.Close;
     //***********************
     FSetParamLangID( IDLanguage );
     //***********************
     FDB.Open;
   finally
     GotoMarkID;
   end;
end;
//******************************************************************************
procedure TDBShema.FSetCanWebSynchronize(const Value: Boolean);
begin
  FCanWebSynchronize := Value;
end;
//******************************************************************************
procedure TDBShema.SetWebSynchronizeElem( aElem : TObject; aFieldForSynchronize:Array of Widestring; aFieldName:string; aCan:Boolean );
var i:Integer;
begin
 self.FWebSynchronizeMergeLogElem := aElem;
 
 if aElem <> nil  then
   TDBShemaSynchronize(aElem).FAddTableAndFieldName( self, self.TableName, Self.FFieldKod, aFieldName );

 SetLength(FFieldForSynchronize, Length( aFieldForSynchronize ) );
 
 for i:=0 to Length( aFieldForSynchronize )-1 do
   FFieldForSynchronize[i] := aFieldForSynchronize[i];

 Self.FCanWebSynchronize := aCan;
end;
//******************************************************************************
function TDBShemaView.GetView: TcxGRidDBTableView;
begin
  result := self.GetActiveCloneElem.FView;  //
end;
//******************************************************************************
procedure TDBShema.SetUserElem( aElem : TDBShema;aFieldUserName:Widestring );
begin
  self.FUserElem := aElem;
  self.FFieldUserName := aFieldUserName;
end;
//******************************************************************************
procedure TDBShema.SetLogTable( aTableNameLog, aStoredProcName : Widestring; aLogFieldNames : TLogFields; StyleMark:TcxStyle );
begin
  self.FLogTableName := aTableNameLog;
  self.FLogStoredProcName := aStoredProcName;
  self.FLogFieldNames := aLogFieldNames;
  FStyleMarkLog := StyleMark;
end;
//******************************************************************************
procedure TDBShema.AddIconToField( aViewFieldName, aValueFieldName:WideString; aValueImage:Variant;
                                    aImageList : TImageList; aImageWidth, aImageIndex:Integer; aImgPos:TImageCellPosition );
var len:Integer;
begin
  len:=Length(FFieldImageIndex);
  SetLength(FFieldImageIndex,len+1);

  FFieldImageIndex[len].ViewFieldName  := aViewFieldName;
  FFieldImageIndex[len].ValueFieldName := aValueFieldName;
  FFieldImageIndex[len].ValueImage     := aValueImage;
  FFieldImageIndex[len].ImageWidth     := aImageWidth;

  FFieldImageIndex[len].ImageList      := aImageList;
  FFieldImageIndex[len].ImageIndex     := aImageIndex;
  FFieldImageIndex[len].ImagePos       := aImgPos;
end;
//******************************************************************************
procedure TDBShema.SetMainIcon(aImageList: TImageList; aImageIndex: Integer);
begin
  FMainImageList  := aImageList;
  FMainImageIndex := aImageIndex;
end;
//******************************************************************************
function TDBShema.FCheckFieldForSynchronizeWeb(aFieldName:widestring):Boolean;
var i:Integer;
begin
  if Length(FFieldForSynchronize)<>0 then
  begin
    result:=False;

    for i:=0 to Length(FFieldForSynchronize)-1 do
    if CompareText(aFieldName,FFieldForSynchronize[i]) = 0 then
    begin
      result:=True;
      Break;
    end;
  end else result:=True;
end;
//******************************************************************************
function TDBShema.FAddDataSynchronizeLogMerge( IncludeDetailElements:Boolean; Reason:Integer ):Integer;
var SQL:String;
    DBParam:TConnectDBParam;
    ParentTable:WideString;
    ParentValueId:WideString;
begin
  if FWebSynchronizeMergeLogElem = nil then exit;
  if FUserElem = nil  then
  begin
    FSysError('Set please user element for '+self.FName);
    exit;
  end;

  if FWebSynchronizeMergeLogElem is TDBShemaSynchronize then
  begin
    if (Self.MainElement<>nil)and(IncludeDetailElements) then
    begin
      ParentTable := Self.MainElement.TableName;
      ParentValueId := Self.MainElement.GetValueIdStr;

      {if FRelationTopElem <> nil then
      begin
        ParentTableRel := self.FRelationTopElem.TableName;
        ParentValueRelId := self.FRelationTopElem.GetValueIdStr;
      end
       else ParentTableRel := ''; }
    end
     else
     begin
       ParentTable:='';
       ParentValueId:='null';
     end;

    result:= TDBShemaSynchronize(FWebSynchronizeMergeLogElem).FAddMergeDataToLog( ParentTable, ParentValueId, Self.FTableName,self.FFieldKod, self.GetValueIdStr, self.FUserElem.GetValueIdStr, Reason);
    //if ParentTableRel <> '' then
    //  result:= TDBShemaSynchronize(FWebSynchronizeMergeLogElem).FAddMergeDataToLog( ParentTableRel, ParentValueRelId, Self.FTableName,self.FFieldKod, self.GetValueIdStr, self.FUserElem.GetValueIdStr, Reason);
  end;

end;
//******************************************************************************
function TDBShema.FSynchronizeDataRow( CheckConnectToServer:Boolean = true ):Integer;
begin
  result:=0;
  if FWebSynchronizeMergeLogElem = nil then exit;

  if FWebSynchronizeMergeLogElem is TDBShemaSynchronize then
    result := TDBShemaSynchronize(FWebSynchronizeMergeLogElem).FElemFunctCallSoapWeb.UpdateData( DB,self.TableName, self.FFieldKod, self.FFieldsSelfTable, FFieldForSynchronize, CheckConnectToServer, true );
end;
//******************************************************************************
function TDBShema.WebSynchronizeRow( CheckConnectToServer:Boolean = true; IncludeDetailElements:Boolean=false ):Integer;
var ResCode:Integer;
begin
  result:=0;
  if ( FWebSynchronizeMergeLogElem <> nil ) and ( self.FCanWebSynchronize ) then
  begin
    ResCode := FSynchronizeDataRow( CheckConnectToServer );
    //ResCode := 2; //!!!!!!!!!!!!!!!!!
    if ResCode <> 0  then
    begin
      self.FUserElem.DBOpen;
      FAddDataSynchronizeLogMerge( IncludeDetailElements, ResCode );
    end;
    result:= ResCode;
  end;
end;
//******************************************************************************
function TDBShema.FSynchronizeDataDelRow( idDelRow:String ):Integer;
begin
  result:=0;
  if FWebSynchronizeMergeLogElem = nil then exit;

  if FWebSynchronizeMergeLogElem is TDBShemaSynchronize then
    result := TDBShemaSynchronize(FWebSynchronizeMergeLogElem).FElemFunctCallSoapWeb.DelData(self.TableName,idDelRow,true);
end;
//******************************************************************************
procedure TDBShema.WebSynchronizeDelRow( idDelRow:String; IncludeDetailElements:Boolean );
var ResCode:Integer;
begin
  if ( FWebSynchronizeMergeLogElem <> nil ) {and ( self.FCanWebSynchronize )} then
  begin
    ResCode := FSynchronizeDataDelRow(idDelRow);
    if ResCode <> 0  then  FAddDataSynchronizeLogMerge( IncludeDetailElements, ResCode );
  end;
end;
//******************************************************************************
function TDBShema.DBRecordCount:Integer;
begin
  result := -1;
  if not TestConnect then exit;
  if FDB = nil then exit;

  if FDB is TIBDataset then TIBDataset(FDB).FetchAll;
  if FDB is TIBQuery then TIBQuery(FDB).FetchAll;
  if FDB is TIBTable then TIBTable(FDB).FetchAll;

  result := FDB.RecordCount;
end;
//******************************************************************************
function TDBShema.FGetCountDetail:integer;
begin
  Result := self.DetailElem.Count;
end;
//******************************************************************************
procedure TDBShema.WebSynchronizeDB( Progres:TProgressFormProp; CheckConnectToServer:Boolean = true; IncludeDetailElements:Boolean=false; MainShemaElem:TDBShema=nil  );
var  i:Integer;
     //Progres:TProgressFormProp;
     CanProgres:Boolean;
     SaveCanWebSynchronize :Boolean;
     ShemaObj : PShemaObj;
begin
 if not TestConnect then exit;

 try
    if not FDB.Active then FDB.Open;
    self.SaveMarkID;
    SaveCanWebSynchronize := self.FCanWebSynchronize;
    self.FCanWebSynchronize := True;

    {if FormProgres = nil then
    begin
      Progres := ShowProgress( DefCaptionSynchronizeWeb , self.DBRecordCount );
      CanProgres := True;
      if self is TDBShemaView then TDBShemaView(self).ViewScrollLock( IncludeDetailElements );
    end
      else CanProgres:= False;  }
    if self is TDBShemaView then TDBShemaView(self).ViewScrollLock( IncludeDetailElements );
    //********************************
    if @self.FFunctionSQLRefreshData <> nil then self.FFunctionSQLRefreshData( MainShemaElem, self );
    //********************************

    if FDB.Active then FDB.First;
  
    while not FDB.Eof do
    begin
      if Progres.FormProgres<>nil then
        ShangeTitleProgres( DefCaptionSynchronizeWeb+' ('+self.Title+')', Progres.FormProgres );

      if self.FWebSynchronizeMergeLogElem <> nil then
        //if  WebSynchronizeRow( CheckConnectToServer, IncludeDetailElements )<> 0 then exit;
         WebSynchronizeRow( CheckConnectToServer, IncludeDetailElements );

      if IncludeDetailElements then
      begin

        for i:=0 to self.FConteinerConstraintElements.Count - 1 do
        begin
          ShemaObj := PShemaObj( self.FConteinerConstraintElements.Items[i] );
          ShemaObj^.Elem.WebSynchronizeDB( Progres, CheckConnectToServer, IncludeDetailElements and ShemaObj^.UseDetail, self );
        end;

      end;

     { if CanProgres then
      begin
       Progres.ProgressBar.Position := Progres.ProgressBar.Position+1;
       Progres.ProgressCaption.Repaint;
      end;}
      FDB.Next;
  end;
  //********************************
 finally
   self.FCanWebSynchronize := SaveCanWebSynchronize;
   self.GotoMarkID;
  { if CanProgres then
   begin
     ClosedProgress( Progres.FormProgres );
     if self is TDBShemaView then TDBShemaView(self).ViewScrollUnLock( IncludeDetailElements );
   end; }
   if self is TDBShemaView then TDBShemaView(self).ViewScrollUnLock( IncludeDetailElements ); 
 end;
end;
//******************************************************************************
procedure TDBShema.WebSynchronizeCurrRowDB( CheckConnectToServer:Boolean = true; IncludeDetailElements:Boolean=false );
var i:integer;
    Progres:TProgressFormProp;
    SaveCanWebSynchronize : boolean;
    UseShemaDetail:Boolean;
begin
  if not TestConnect then exit;

  try
   Progres := ShowProgress( DefCaptionSynchronizeWeb , self.DBRecordCount );
   ShangeTitleProgres( DefCaptionSynchronizeWeb+' ('+self.Title+')',Progres.FormProgres );

   SaveCanWebSynchronize := self.FCanWebSynchronize;
   self.FCanWebSynchronize := True;

   if self.FWebSynchronizeMergeLogElem <> nil then
     WebSynchronizeRow( CheckConnectToServer, IncludeDetailElements );

   if IncludeDetailElements then
   begin
     for i:=0 to self.FConteinerConstraintElements.Count - 1 do
     begin
       UseShemaDetail := PShemaObj( self.FConteinerConstraintElements.Items[i] )^.UseDetail;
       TDBShema( PShemaObj(self.FConteinerConstraintElements.Items[i]).Elem ).WebSynchronizeDB( Progres, CheckConnectToServer, IncludeDetailElements and UseShemaDetail );
     end;
   end;

  finally
    self.FCanWebSynchronize := SaveCanWebSynchronize;
    ClosedProgress(Progres.FormProgres);
  end;
end;
//******************************************************************************
procedure TDBShemaView.FRestorePersonalEventsToView( Aview: TcxGridDBTableView );
begin
  if Aview <> nil then
  begin
    Aview.OnKeyDown               :=self.PersonalViewKeyDown;
    Aview.OnFocusedRecordChanged  :=self.PersonalFocusedRecordChanged;
    Aview.OnCanFocusRecord        :=self.PersonalCanFocusRecord;
    Aview.OnCellDblClick          :=self.PersonalCellDblClick;
    Aview.OnCellClick             :=self.PersonalCellClick;
    Aview.OnCustomDrawCell        :=self.PersonalDrawCell;
    Aview.OnCustomDrawColumnHeader:=self.PersonalDrawColumnHeder;
    Aview.OnMouseDown             :=self.PersonalViewMouseDown;
    Aview.OnMouseMove             :=self.PersonalViewMouseMove;
    Aview.OnEditValueChanged      :=self.PersonalEditValueChanged;
    Aview.DataController.OnSortingChanged := self.PersonalSortingChanged;
    Aview.DataController.Filter.OnChanged := self.PersonalFilterChange;
    Aview.OnCustomDrawGroupSummaryCell := self.PersonalDrawGroupSummary;
    Aview.OnColumnHeaderClick:=  self.PersonlaColumnHeaderClick;
    Aview.DataController.OnFilterRecord := self.PersonlaFilterRecord;
  end;
end;
//******************************************************************************
procedure TDBShemaView.FReadPersonalEventsFromView( Aview: TcxGridDBTableView );
begin
  self.PersonalViewKeyDown := Aview.OnKeyDown;
  self.PersonalFocusedRecordChanged := Aview.OnFocusedRecordChanged;
  self.PersonalCanFocusRecord := Aview.OnCanFocusRecord;
  self.PersonalCellDblClick := Aview.OnCellDblClick ;
  self.PersonalCellClick := Aview.OnCellClick ;
  self.PersonalDrawCell := Aview.OnCustomDrawCell;
  self.PersonalDrawColumnHeder := Aview.OnCustomDrawColumnHeader;
  self.PersonalViewMouseDown := Aview.OnMouseDown;
  self.PersonalViewMouseMove := Aview.OnMouseMove;
  self.PersonalEditValueChanged := Aview.OnEditValueChanged;
  self.PersonalSortingChanged := Aview.DataController.OnSortingChanged;
  self.PersonalFilterChange := Aview.DataController.Filter.OnChanged;
  self.PersonalDrawGroupSummary := Aview.OnCustomDrawGroupSummaryCell ;
  self.PersonlaColumnHeaderClick := Aview.OnColumnHeaderClick;
  self.PersonlaFilterRecord := Aview.DataController.OnFilterRecord;
end;
//******************************************************************************
procedure TDBShemaView.FPrepareViewPersonalEvent( Aview: TcxGridDBTableView );
begin
  if (AView = nil)and( FView<>nil ) then
    FRestorePersonalEventsToView( FView )
  else
  if (Aview<>nil) then FReadPersonalEventsFromView( Aview );
end;
//******************************************************************************
procedure TDBShemaView.FPrepareOptionView( Aview: TcxCustomGridTableView );
begin
  PrepareOptionView( Aview, self.FFieldNumber );
end;
//******************************************************************************
procedure TDBShemaView.FPrepareView( Aview: TcxGridDBTableView );
begin
  if Aview = nil then exit;
  if (Aview<>nil) and (Fview<>nil) and (Aview<>Fview) then FPrepareViewPersonalEvent( nil );
  FPrepareViewPersonalEvent( Aview );
  //***************************************
  Aview.OnFocusedRecordChanged  :=self.GridViewFocusedRecordChanged;
  Aview.OnCanFocusRecord        :=self.GridViewCanFocusRecord;
  Aview.OnCellDblClick          :=self.GridViewCellDblClick;
  Aview.OnCellClick             :=self.GridViewCellClick;
  Aview.OnCustomDrawCell        :=self.GridViewCustomDrawCell;
  Aview.OnCustomDrawGroupSummaryCell := GridViewCustomDrawGroupSummaryCell;
  Aview.OnColumnHeaderClick     := GridViewColumnHeaderClick;
  Aview.DataController.OnSortingChanged := GridViewControllerSortingChanged;
  Aview.DataController.Filter.OnChanged := GridViewControllerFilterChanged;
  Aview.DataController.OnFilterRecord   := GridViewDataControllerFilterRecord;

  Aview.OnCustomDrawColumnHeader:=GridViewCustomDrawColumnHeader;
  Aview.OnKeyDown               :=GridViewKeyDown;
  Aview.OnEditKeyDown           :=GridViewKeyEditKeyDown;
  Aview.OnEditValueChanged      :=GridViewEditValueChanged;
  Aview.OnMouseDown             :=ViewMouseDown;
  Aview.OnMouseMove             :=ViewMouseMove;
  Aview.OnMouseLeave            :=ViewMouseLeave;
  //***************************************
  FPrepareOptionView( Aview );
end;
//******************************************************************************
procedure TDBShemaView.ClearView;
begin
  FView := nil;
end;
//******************************************************************************
procedure TDBShemaView.SetView( Aview: TcxGRidDBTableView );
begin
  if Aview = FView then Exit;

  if Aview<>nil then
  begin
    FPrepareView(Aview);
    if ( self.FDB<>nil )and( CompareText( Aview.ClassName, 'TcxGridDBTableView' ) = 0 ) then
     self.FDS := Aview.DataController.DataSource;

    self.FView:=Aview;
  end
  else
  begin
    if ( self.FView <> nil) then
      FPrepareViewPersonalEvent( Aview );

    self.FView:=nil;
  end;
end;
//******************************************************************************
procedure TDBShemaView.FSetViewList( aView:TcxCustomGridTableView );
begin
  FPrepareOptionView( aView );
  FViewList := aView;
end;
//******************************************************************************
procedure TDBShemaView.ViewScrollLock( IncludeDetailElements:Boolean );
var i:integer;
begin
  if self.View<>nil then self.View.BeginUpdate;

  if IncludeDetailElements then
    for i:=0 to self.DetailElem.Count - 1 do
      if TDBShema(self.DetailElem[i]) is TDBShemaView then
        TDBShemaView(self.DetailElem[i]).ViewScrollLock( IncludeDetailElements ) ;
end;
//******************************************************************************
procedure TDBShemaView.ViewScrollUnLock(IncludeDetailElements:Boolean);
var i:integer;
begin
  if self.View<>nil then self.View.EndUpdate;

  if IncludeDetailElements then
    for i:=0 to self.DetailElem.Count - 1 do
      if TDBShema(self.DetailElem[i]) is TDBShemaView then
        TDBShemaView(self.DetailElem[i]).ViewScrollUnLock ( IncludeDetailElements ) ;
end;
//******************************************************************************
procedure TDBShemaView.SetFilterOnView( aFieldName:array of Widestring; aFilterValue:array of Variant;aUMOVA:array of Widestring;
                       aBool: TcxFilterBoolOperatorKind=fboOr;AddFilter:Boolean=false );
begin
  try
    self.View.BeginUpdate;
    SetFilterOnWievForManyColumns( Self.View, AFieldName, aFilterValue, aUMOVA, [], aBool , True, AddFilter );
  finally
    self.View.EndUpdate;
  end;
end;
//******************************************************************************
procedure TDBShemaView.ClearFilterOnView;
begin
  SetFilterOnWievForManyColumns( Self.View, [], [], [], [], fboOr, False, false );
end;
//******************************************************************************
function TDBShemaView.IsFilterOnView:Boolean;
begin
  if (self.View<>nil) then
    result := self.View.DataController.Filter.Active
  else result:= False;
end;
//******************************************************************************
procedure TDBShemaView.HideDataForFilterOnView(aHide:Boolean=True);
begin
   if aHide then
     SetFilterOnWievForManyColumns( Self.View, [self.FFieldKod], [null], ['='], [], fboAnd , True, True )
   else
   if ColumnInFilters( Self.View, Self.View.GetColumnByFieldName(self.FFieldKod) ) then
     RemoveFilterForColumns(Self.View, [ Self.View.GetColumnByFieldName(self.FFieldKod) ] );
end;
//******************************************************************************
procedure TDBShemaView.SetFilterOnViewList( aFieldName:array of Widestring; aFilterValue:array of Variant;aUMOVA:array of Widestring;
                       aBool: TcxFilterBoolOperatorKind=fboOr;AddFilter:Boolean=false );
begin
  if ( Self.ViewList<>nil ) and( Self.ViewList is TcxGridDBTableView ) then
    SetFilterOnWievForManyColumns( TcxGridDBTableView(self.ViewList), AFieldName, aFilterValue, aUMOVA, [], aBool , True, AddFilter );
end;
//******************************************************************************
procedure TDBShemaView.SetExtLookupComboBoxListView( aExtLupBox:TcxCustomExtLookupComboBox=nil; aListFieldName:String='';
                                                     SearhTextByLike:Boolean=true; SearhTextByAllColumn:Boolean=false;
                                                     ListView:TcxCustomGridTableView=nil; DefNullValue:Widestring=''; ShowDefNulValueWhenEmpty:Boolean=false );
begin
  if ListView<>nil then self.FViewList := ListView;
  if self.FViewList = nil then exit;

  FSearhTextByLikeInExtLUpCbox := SearhTextByLike;
  FSearhTextByAllColumnExtLUpCbox := SearhTextByAllColumn;
  FDefNullValueExtLUpCbox := DefNullValue;
  FShowDefNulValueWhenEmpty := ShowDefNulValueWhenEmpty;

  if (self.FViewList is TcxGridDBTableView)and(aExtLupBox <> nil)and(aListFieldName<>'') then
    SetPropInCxColumnExtLookupComboBox( aExtLupBox.Properties,TcxGridDBTableView(self.FViewList),aListFieldName, self.FFieldKod, True, false );

  if aExtLupBox <> nil then
  begin
    PersonalExtLookupComboBoxListViewPropertiesEditValueChanged := aExtLupBox.Properties.OnEditValueChanged;
    PersonalExtLookupComboBoxListViewPropertiesChange  := aExtLupBox.Properties.OnChange;
    PersonalExtLookupComboBoxListViewPropertiesCloseUp := aExtLupBox.Properties.OnCloseUp;
    PersonalExtLookupComboBoxListViewPropertiesInitPopup := aExtLupBox.Properties.OnInitPopup;
    PersonalExtLookupComboBoxListPropertiesPopup:= aExtLupBox.Properties.OnPopup;

    aExtLupBox.Properties.OnEditValueChanged := FTourComboBoxPropertiesEditValueChanged;
    aExtLupBox.Properties.OnChange  := FExtLookupComboBoxListViewPropertiesChange;
    aExtLupBox.Properties.OnCloseUp := FExtLookupComboBoxListViewPropertiesCloseUp;
    aExtLupBox.Properties.OnInitPopup := FExtLookupComboBoxListViewPropertiesInitPopup;
    aExtLupBox.Properties.OnPopup := FExtLookupComboBoxListPropertiesPopup;

    aExtLupBox.Properties.DropDownListStyle := lsEditList;
    aExtLupBox.Properties.IncrementalFiltering := false;
    FSetNullValueForExtLookupComboBox( aExtLupBox );
  end
  else FPreparePersonalExtLookupComboBox;
end;
//******************************************************************************
procedure TDBShemaView.FreeExtLookupComboBoxListView( aExtLupBox:TcxCustomExtLookupComboBox );
begin
  aExtLupBox.Properties.OnEditValueChanged :=PersonalExtLookupComboBoxListViewPropertiesEditValueChanged;
  aExtLupBox.Properties.OnChange := PersonalExtLookupComboBoxListViewPropertiesChange;
  aExtLupBox.Properties.OnCloseUp := PersonalExtLookupComboBoxListViewPropertiesCloseUp;
  aExtLupBox.Properties.OnInitPopup := PersonalExtLookupComboBoxListViewPropertiesInitPopup;
  aExtLupBox.Properties.OnPopup := PersonalExtLookupComboBoxListPropertiesPopup;

  FPreparePersonalExtLookupComboBox;
end;
//******************************************************************************
procedure TDBShemaView.FPreparePersonalExtLookupComboBox;
begin
  PersonalExtLookupComboBoxListViewPropertiesEditValueChanged := nil;
  PersonalExtLookupComboBoxListViewPropertiesChange := nil;
  PersonalExtLookupComboBoxListViewPropertiesCloseUp := nil;
  PersonalExtLookupComboBoxListViewPropertiesInitPopup := nil;
  PersonalExtLookupComboBoxListPropertiesPopup:=nil;
end;
//******************************************************************************
Procedure TDBShemaView.FCopyDataFromViewRecord( Arec:TcxCustomGridRecord; IndMas:Integer );
var i:integer;
    DeFValue:variant;
    CurrValue:Variant;
begin
  for i:=0 to DB.FieldCount-1 do
  begin
    if Db.Fields[i].FieldKind = fkData then
    begin
      if self.View.GetColumnByFieldName(Db.Fields[i].FieldName)<>nil then
        CurrValue := self.View.ViewData.Rows[Arec.Index].Values[ self.View.GetColumnByFieldName(Db.Fields[i].FieldName).Index ]
      else CurrValue:=null;
    end
    else CurrValue:=null;

    FCopyMasData[IndMas][i].Value := CurrValue;
    FCopyMasData[IndMas][i].FieldName := Db.Fields[i].FieldName;
  end;
end;
//******************************************************************************
procedure TDBShemaView.CopyRowsFromView(Detail:boolean=false;AddMas:boolean=false);
begin
  FCopyRowFromView( Detail, AddMas );
end;
//******************************************************************************
procedure TDBShemaView.PasteDataRowsToView(Detail:boolean=false);
begin
  FPasteRowToView(Detail);
end;
//******************************************************************************
function TDBShemaView.CanPasteDataRowsToView:Boolean;
begin
  Result := Length(FCopyMasData) <>0 ;
end;
//******************************************************************************
function TDBShemaView.CanCopyDataRowsToView:Boolean;
begin
  Result:= self.View.DataController.Controller.SelectedRecordCount <>0;
end;
//******************************************************************************
procedure TDBShemaView.FCopyRowFromView(Detail:boolean=false;AddMas:boolean=false);
var i:integer;
    j:integer;
    StartInd:integer;
begin
 if not AddMas then
    begin
     SetLength( FCopyMasData, self.View.DataController.Controller.SelectedRecordCount );
     StartInd:=0;
    end
     else
      begin
       StartInd:=Length(FCopyMasData);
       SetLength( FCopyMasData,Length(FCopyMasData) + self.View.DataController.Controller.SelectedRecordCount);
      end;
 try
   self.SaveBookmark;
   self.FSavePosSelected;
   for i:=0 to self.View.DataController.Controller.SelectedRecordCount-1 do
   begin
     SetLength( FCopyMasData[StartInd],DB.Fields.Count );
     FCopyDataFromViewRecord( self.View.DataController.Controller.SelectedRecords[i], StartInd );

     if Detail then
     for j:=0 to self.DetailElem.Count-1 do
     begin
       if (TDBShema(self.DetailElem[j]) is TDBShemaView) and
          (TDBShemaView(self.DetailElem[j]).View<>nil) then
       begin
         self.View.DataController.Controller.SelectedRecords[i].Focused:=true;
         TDBShemaView(self.DetailElem[j]).View.DataController.SelectAll;
         TDBShemaView(self.DetailElem[j]).FCopyRowFromView(Detail ,true);
       end;
     end;

     inc(StartInd);
   end;

  finally
   self.GotoBookmark;
   self.FRestorePosSelected;
  end;
end;
//******************************************************************************
function TDBShemaView.FPasteDataToRow( AcceptField:Array of string;MyData:Array of TFieldValue ):String;
var i:integer;
    oldNumber:Integer;
    DeFValue:variant;

Function CopyField(CurrField:String):Boolean;
var i:Integer;
begin
  result := True;
  for i:=0 to Length(AcceptField)-1 do
  if CompareText( AcceptField[i], CurrField )=0 then
  begin
    result := False;
    break;
  end;
end;

begin
 DB.Append;
 if not (DB.State in [dsInsert,dsEdit]) then DB.Edit;
 //********************************************************
 for i:=0 to Length(MyData)-1 do
   if CopyField( MyData[i].FieldName ) then
     DB.FieldByName( MyData[i].FieldName ).Value := MyData[i].Value;
 //********************************************************
 if DB.State in [dsInsert,dsEdit] then DB.Post;
end;
//******************************************************************************
Function TDBShemaView.FGetValueFromCopyMasForField(IndMas:Integer;aFieldName:String):Variant;
var i:integer;
    CurrFieldName:widestring;
begin
 result:=null;
 for i:=0 to Length( FCopyMasData[IndMas] )-1 do
 begin
   if CompareText( FCopyMasData[IndMas][i].FieldName, aFieldName ) = 0 then
   begin
     result := FCopyMasData[IndMas][i].Value;
     Break;
   end;
 end;
end;
//******************************************************************************
procedure TDBShemaView.FPasteRowToView(Detail:boolean=false);
var i:integer;
    j:integer;
    MasFieldNotInclude:array of string;
    saveShowPrepareForm:Boolean;
    EnProgres:boolean;
    CurrOldId:string;
    CurrMainOldId:string;
    CurrMainNewId:string;
    ind:integer;
begin
 //**********************************************************
 try
   saveShowPrepareForm:=self.FShowPrepareFormAfterInsert;
   self.FShowPrepareFormAfterInsert:=false;
   //**************************************
   setLength(MasFieldNotInclude,Length( FCopyMasFieldNotInclude )+Length( self.GetArrStafFieldArr) );

   for i:=0 to Length( self.GetArrStafFieldArr)-1 do
       MasFieldNotInclude[i]:=GetArrStafFieldArr[i];

   for i:=0 to Length(FCopyMasFieldNotInclude)-1 do
       MasFieldNotInclude[ i + Length( self.GetArrStafFieldArr) ] := FCopyMasFieldNotInclude[i];
   //*************************************
   FProgress := ShowProgress( WaitFormCaption );
   //*************************************
   for i:=0 to Length(FCopyMasData)-1 do
   begin
     CurrOldId:= FGetValueFromCopyMasForField(i,self.FieldKod);
     if (self.MainElement<>nil)and(self.MainElement.DB.FieldByName(self.MainElement.FieldKod).AsString<>'') then
     begin

       CurrMainOldId:=FGetValueFromCopyMasForField(i,self.FieldMainKod);
       FPasteDataToRow( MasFieldNotInclude, FCopyMasData[i] );

       if Detail then
       for j:=0 to self.DetailElem.Count-1 do
       begin
         if TDBShema(self.DetailElem[j]) is TDBShemaView then
           TDBShemaView(self.DetailElem[j]).FPasteRowToView(Detail);
       end;

       FProgress.ProgressBar.Position:=FProgress.ProgressBar.Position+1;
       FProgress.ProgressCaption.Repaint;
     end;
   end;
 finally
   ClosedProgress( FProgress.FormProgres );
   self.FShowPrepareFormAfterInsert:=saveShowPrepareForm;
 end;
 //**********************************************************
 FClearMasCopy;
 //**********************************************************
 self.SetFocusOnView;
end;
//******************************************************************************
procedure TDBShemaView.GridViewDataControllerFilterRecord(
  ADataController: TcxCustomDataController; ARecordIndex: Integer; var Accept: Boolean);
begin
  if @PersonlaFilterRecord <> nil then
    PersonlaFilterRecord( ADataController, ARecordIndex, Accept );
end;
//******************************************************************************
Procedure TDBShemaView.FRequery(IBFetchAll:Boolean=False);
var TopIndex:Integer;
begin
  try
    if self.View <> nil then
    begin
      TopIndex := self.View.Controller.TopRowIndex;
      self.View.BeginUpdate;
    end;

    inherited;
    
  finally
    if self.View <> nil then
    begin
      self.View.Controller.TopRowIndex := TopIndex;
      self.View.EndUpdate;
    end;
  end;
end;
//******************************************************************************
Function TDBShemaView.CloneView( Owner:TComponent; SetViewToElem:Boolean = True ):TcxGridDBTableView;
begin
  Result := ViewClone( Owner, self.View );

  FRestorePersonalEventsToView( Result );
  if SetViewToElem then
  begin
    Self.SetView( nil );
    Self.SetView(Result);
  end;

  ViewRestorePositionDBFromIni( Result, FIniDBSavePosition );
  SetFocusOnView( Result );
end;
//******************************************************************************
Function TDBShemaView.CloneViewList( Owner:TComponent; SetViewToElem:Boolean = True ):TcxGridDBTableView;
begin
  if self.ViewList is TcxgridDBtableView then
  begin
    Result := ViewClone( Owner, TcxgridDBtableView(self.FViewList) );
    Result.OnCustomDrawCell := self.FViewList.OnCustomDrawCell;

    if SetViewToElem then
      Self.ViewList:= Result;
  end;

end;
//******************************************************************************
procedure TDBShemaView.FExtLookupSerachLikeByFilter( Sender: TObject );
var FieldsForomColumn:TVarArr;
begin
  if FSearhTextByLikeInExtLUpCbox then
  begin

    if FSearhTextByAllColumnExtLUpCbox then
      GetFieldNamesFromViewVisibleColumns( TcxGridDBTableView( TcxExtLookupComboBox(Sender).Properties.View ), FieldsForomColumn )
    else
    begin
      SetLength(FieldsForomColumn,1);
      FieldsForomColumn[0]:= TcxExtLookupComboBox(sender).Properties.ListField.FieldName;
    end;

    self.SetFilterOnViewList( FieldsForomColumn, [TcxExtLookupComboBox(Sender).EditingText], ['like'], fboAnd, True );

    if (Sender as TcxExtLookupComboBox).EditingText = '' then
    begin
      TcxExtLookupComboBox( Sender ).DroppedDown := False;
      TcxExtLookupComboBox( Sender ).DroppedDown := True;
    end;

  end;
end;
//******************************************************************************
procedure TDBShemaView.FRemoveFieldFromFilterExtLookup( Sender: TObject );
var aColumn:TcxGridColumn;
begin
  aColumn := TcxGridDBTableView(TcxExtLookupComboBox(sender).Properties.View).GetColumnByFieldName( TcxExtLookupComboBox(sender).Properties.ListField.FieldName );
  RemoveFilterForColumns( TcxGridDBTableView(TcxExtLookupComboBox(sender).Properties.View), aColumn );
end;
//******************************************************************************
procedure TDBShemaView.FTourComboBoxPropertiesEditValueChanged( Sender: TObject );
begin
  if TcxGridDBTableView( TcxExtLookupCombobox(Sender).Properties.View).DataController.DataSet.FieldByName(TcxExtLookupCombobox(Sender).Properties.KeyFieldNames).Value<>TcxExtLookupCombobox(Sender).EditValue then
  try
    TcxGridDBTableView( TcxExtLookupCombobox(Sender).Properties.View).DataController.DataSet.DisableControls;
    TcxGridDBTableView( TcxExtLookupCombobox(Sender).Properties.View).DataController.DataSet.Locate(
                        TcxExtLookupCombobox(Sender).Properties.KeyFieldNames,TcxExtLookupCombobox(Sender).EditValue,[] );
  finally
    TcxGridDBTableView( TcxExtLookupCombobox(Sender).Properties.View).DataController.DataSet.EnableControls;
  end;

  FRemoveFieldFromFilterExtLookup( Sender );

  if @PersonalExtLookupComboBoxListViewPropertiesEditValueChanged <> nil then
    PersonalExtLookupComboBoxListViewPropertiesEditValueChanged ( Sender );
end;
//******************************************************************************
function TDBShemaView.FSetNullValueForExtLookupComboBox(Sender: TObject ):Boolean;
begin
  result := False;
 
  if ((TcxExtLookupComboBox(Sender).EditValue = Null) OR (TcxExtLookupComboBox(Sender).Text = '') ) AND
     ( not TcxExtLookupComboBox( Sender ).DroppedDown ) then
  begin
    try
      TcxExtLookupComboBox(Sender).Properties.OnChange := nil;
      TcxExtLookupComboBox(Sender).Properties.OnEditValueChanged := nil;
      TcxExtLookupComboBox(Sender).EditValue:= Null;

      if FShowDefNulValueWhenEmpty then TcxExtLookupComboBox(Sender).Text := FDefNullValueExtLUpCbox
      else TcxExtLookupComboBox(Sender).Text := FDefNullValueExtLUpCbox;

      result := true;

    finally
      TcxExtLookupComboBox(Sender).Properties.OnChange := FExtLookupComboBoxListViewPropertiesChange;
      TcxExtLookupComboBox(Sender).Properties.OnEditValueChanged := FTourComboBoxPropertiesEditValueChanged;
    end;
  end
end;
//******************************************************************************
procedure TDBShemaView.FExtLookupComboBoxListViewPropertiesChange( Sender: TObject );
begin
  if not FSetNullValueForExtLookupComboBox( Sender ) then
   FExtLookupSerachLikeByFilter( Sender );

 if @PersonalExtLookupComboBoxListViewPropertiesChange<> nil then
   PersonalExtLookupComboBoxListViewPropertiesChange( Sender );
end;
//******************************************************************************
procedure TDBShemaView.FExtLookupComboBoxListViewPropertiesInitPopup( Sender: TObject );
begin
  //if TcxExtLookupComboBox(Sender).EditValue = null then TcxExtLookupComboBox(Sender).Text :='';

  if @PersonalExtLookupComboBoxListViewPropertiesInitPopup<> nil then
    PersonalExtLookupComboBoxListViewPropertiesInitPopup( Sender );
end;
//******************************************************************************
procedure TDBShemaView.FExtLookupComboBoxListPropertiesPopup( Sender: TObject );
begin
 if (TcxExtLookupComboBox(Sender).Text = FDefNullValueExtLUpCbox)and(FDefNullValueExtLUpCbox<>'') then
   TcxExtLookupComboBox(Sender).Text :='';

 if @PersonalExtLookupComboBoxListPropertiesPopup<> nil then
   PersonalExtLookupComboBoxListPropertiesPopup( Sender );  
end;
//******************************************************************************
procedure TDBShemaView.FExtLookupComboBoxListViewPropertiesCloseUp( Sender: TObject );
begin
  FRemoveFieldFromFilterExtLookup( Sender );

  if @PersonalExtLookupComboBoxListViewPropertiesCloseUp <> nil then
    PersonalExtLookupComboBoxListViewPropertiesCloseUp( Sender );
end;
//******************************************************************************
procedure TDBShemaView.ClearFilterOnViewList;
begin
  if (Self.ViewList<>nil)and(Self.ViewList is TcxGridDBTableView) then
    SetFilterOnWievForManyColumns( TcxGridDBTableView(self.ViewList), [], [], [], [], fboOr, False, false );
end;
//******************************************************************************
procedure TDBShemaView.SetShowFilterVisible(Filter:Boolean);
begin
  if Filter then FView.Filtering.Visible := fvNonEmpty
  else FView.Filtering.Visible := fvNever;
end;
//******************************************************************************
procedure TDBShemaView.FSetFocusRowView(IndFocusRow:Integer; aView:TcxGridDBTableView =nil );
begin
  if aView = nil then aView := self.View;

  if (aView<>nil)and(aView.ViewData.RowCount<>0) then
   begin
      if aView.ViewData.Rows[IndFocusRow].visible then
      begin
        aView.ViewData.Rows[IndFocusRow].Focused:=true;
        aView.ViewData.Records[IndFocusRow].Selected:=true;
      end;
   end;
end;
//******************************************************************************
procedure TDBShemaView.SetFocusOnView( aView:TcxGridDBTableView );
var IndRow:Integer;
begin
  if self=nil then exit;
  if aView = nil  then aView := self.View;
  if aView=nil then exit;

  IndRow := self.FUnselectAllFocusView( aView );
  FSetFocusRowView( IndRow, aView );
end;
//******************************************************************************
procedure TDBShemaView.UnFocusedOnView( aView:TcxGridDBTableView = nil );
begin
  if aView =  nil then aView := self.View;
  self.FUnselectAllFocusView( aView );
end;
//******************************************************************************
procedure TDBShemaView.ViewSaveSortColumn;
var i:integer;
    Len:Integer;
begin
  SetLength( self.FSaveColumnSort, 0);

  for i:=0 to Self.View.ColumnCount-1 do
  if Self.View.Columns[i].SortOrder<>soNone then
  begin
    Len:=Length(self.FSaveColumnSort);
    SetLength(self.FSaveColumnSort,Len+1);
    self.FSaveColumnSort[Len].ItemColumn := Self.View.Columns[i];
    self.FSaveColumnSort[Len].SortOrder := Self.View.Columns[i].SortOrder;
    self.FSaveColumnSort[Len].SortIndex := Self.View.Columns[i].SortIndex;
  end;
end;
//******************************************************************************
function TDBShemaView.ViewDBLocate(const KeyFields: string;
  const KeyValues: Variant; Options: TLocateOptions): boolean;
begin
  if self.DBLocate( KeyFields,  KeyValues,Options ) then
    if ( View <>nil ) and ( View.Site<>nil ) and ( View.Site.Parent<>nil ) then
    begin
      TcxGrid( View.Site.Parent ).SetFocus;
      GridViewFocusedRecordChanged( View, nil, View.DataController.Controller.FocusedRecord, False);
      self.SetFocusOnView;
    end;
end;
//******************************************************************************
procedure TDBShemaView.ViewRestoreSortColumn;
var i:integer;
begin
  ViewSetSortByField('');

  for i:=0 to Length(self.FSaveColumnSort)-1 do
  begin
    self.FSaveColumnSort[i].ItemColumn.SortIndex := self.FSaveColumnSort[i].SortIndex;
    self.FSaveColumnSort[i].ItemColumn.SortOrder := self.FSaveColumnSort[i].SortOrder;
  end;
  
  SetLength( self.FSaveColumnSort, 0);
end;
//******************************************************************************
procedure TDBShemaView.ViewSetSortByField( aFieldName:String; Asc:Boolean=true );
var i:integer;
begin
  for i:=0 to Self.View.ColumnCount-1 do
    Self.View.Columns[i].SortOrder := soNone;

  if aFieldName<>'' then
  begin
    if Self.View.GetColumnByFieldName(aFieldName)<>nil then
    begin
      if Asc then Self.View.GetColumnByFieldName(aFieldName).SortOrder := soAscending
      else Self.View.GetColumnByFieldName(aFieldName).SortOrder := soDescending
    end;
  end;

end;
//******************************************************************************
procedure TDBShemaView.ShowEmptyDataOnView(En:boolean; aView:TcxGridDBTableView= nil );
begin
  if aView = nil then aView := Self.View;

  if aView <> nil then
  begin
    if En then
      SetFilterOnWievForManyColumns( aView, [self.FFieldKod], [null],['='], [] )
    else RemoveFilterForColumns( aView, [ aView.GetColumnByFieldName(self.FFieldKod) ] );
  end;
end;
//******************************************************************************
procedure TDBShemaView.DeleteRecordFromView;
var i:integer;
    IndColumnKod:Integer;
    PrevIndexRow:integer;
    SaveAskForDel:Boolean;
    ListDelBmk : Tlist;
begin
 if not TestConnect then exit;
 if not FConfirmBeforeDelete then Exit;

 try
  if (View=nil) then exit;

  ListDelBmk := Tlist.Create;
  SaveAskForDel := FAskBeforeDelete;

  AskBeforeDelete := False;
  AutoRenomer := false;

  IndColumnKod:=View.GetColumnByFieldName( self.FFieldKod ).Index;

  for i:=0 to View.DataController.Controller.SelectedRecordCount-1 do
     if View.DataController.DataSet.Locate(self.FFieldKod, View.DataController.Controller.SelectedRecords[i].Values[IndColumnKod],[])then
       ListDelBmk.Add( View.DataController.DataSet.GetBookmark );
  //*********************************
  for i:=0 to ListDelBmk.Count-1 do
  begin
    View.DataController.DataSet.GotoBookmark( TBookMark(ListDelBmk.Items[i]) );
    View.DataController.DataSet.Delete;
  end;
  //*********************************
  if self.FPrevDeleteIndex >= 0 then
   begin
     if View.ViewData.RecordCount-1>self.FPrevDeleteIndex then
       PrevIndexRow:=self.FPrevDeleteIndex+1
     else  PrevIndexRow := View.ViewData.RecordCount-1;

     self.FUnselectAllFocusView;
     if PrevIndexRow>=0 then View.ViewData.Rows[PrevIndexRow].Focused:=true;
     if PrevIndexRow>=0 then View.ViewData.Rows[PrevIndexRow].Selected:=true;
   end;

  FPrevDeleteIndex:=-1;
  self.FViewRenomer;
  //*********************************
 finally
   AskBeforeDelete := SaveAskForDel;
   AutoRenomer := true;
 end;
end;
//******************************************************************************
function TDBShemaView.FUnselectAllFocusView( aView:TcxGridDBTableView=nil ):Integer;
var i:integer;
    EventViewRecCh:TcxGridFocusedRecordChangedEvent;
begin
  result:=0;
  try
    if aView = nil then aView := self.FView;
    
    EventViewRecCh := aView.OnFocusedRecordChanged;
    aView.OnFocusedRecordChanged := nil;

    for i:=0 to aView.ViewData.RowCount-1 do
     begin
       if (aView.ViewData.Rows[i].Focused) then Result:=i;
       aView.ViewData.Rows[i].Focused:=false;
       aView.ViewData.Rows[i].Selected:=false;
     end;
     
  finally
    aView.OnFocusedRecordChanged := EventViewRecCh;
  end;
end;
//******************************************************************************
procedure TDBShemaView.ViewShowFieldForTranslate(Show:Boolean);
var i:integer;
    currColOriginal:TcxGridDBColumn;
    currColTransl:TcxGridDBColumn;
begin
  if self.TranslationElem = nil  then Exit;
  if FView = nil then Exit;

  try

    FView.BeginUpdate;
    for i:=0 to Length( self.FieldNameTranslate )-1 do
    begin
      currColOriginal:=FView.GetColumnByFieldName(  self.FieldNameTranslate[i].FieldFrom );
      currColTransl  :=FView.GetColumnByFieldName(  self.FieldNameTranslate[i].FieldTo );

      if ( currColOriginal<>nil ) and ( currColTransl<>nil ) then
        if currColOriginal.Visible then currColTransl.Visible := Show;
    end;

  finally
    FView.EndUpdate;
  end;
end;
//******************************************************************************
procedure TDBShemaView.SetViewSummaryGroup( ShowTotalUnderColumn: boolean=false;  AlignmentUnderColumn:Integer = cxAlignRight; FontStyle:TFontStyles=[]  );
begin
  FShowTotalGroupSummaryUnderColumn := ShowTotalUnderColumn;
  FGroupSummaryAlignmentUnderColumn := AlignmentUnderColumn;
  FGropuSummaryFontStyleUnderColumn := FontStyle;
end;
//******************************************************************************
procedure TDBShemaView.AddDrawCellView(
  PersEvent: TcxGridTableDataCellCustomDrawEvent);
begin
  self.PersonalDrawCell := PersEvent;
end;
//******************************************************************************
procedure TDBShemaView.AddFocusedRecordChanged( PersEvent: TcxGridFocusedRecordChangedEvent );
begin
  if self = nil then Exit;
  self.PersonalFocusedRecordChanged := PersEvent;
end;
//******************************************************************************
{function TDBShemaView.GetPersonalFocusedRecordChanged : TcxGridFocusedRecordChangedEvent;
begin
  result := self.PersonalFocusedRecordChanged;
end; }
//******************************************************************************
procedure TDBShemaView.AddDrawColumnHeder( PersEvent: TcxGridColumnCustomDrawHeaderEvent );
begin
  self.PersonalDrawColumnHeder:=PersEvent;
end;
//******************************************************************************
procedure TDBShemaView.AddCellDblClick(PersEvent: TcxGridCellClickEvent);
begin
 self.PersonalCellDblClick:=PersEvent;
end;
//******************************************************************************
procedure TDBShemaView.SetFunctionSelectCheckInView(
  aFunct: TFuncSelectInView);
begin
  FFunctSelectCheckInView:= aFunct;
end;
//******************************************************************************
procedure TDBShemaView.AddCellClick( PersEvent: TcxGridCellClickEvent );
begin
 self.PersonalCellClick := PersEvent;
end;
//******************************************************************************
Function TDBShemaView.GetVerticalGridFocusValue:variant;
begin
  result:=null;

  if self.InputVgrid<>nil then
   result := TcxEditorRow(self.InputVgrid.FocusedRow).Properties.Value;
end;
//******************************************************************************
procedure TDBShema.FSetFunctionPrepareUpdateForm( aFunction:TPrepareUpdateForm );
begin
  FFunctionPrepareUpdateForm := aFunction;
end;
//******************************************************************************
function TDBShema.FGetFunctionPrepareUpdateForm : TPrepareUpdateForm;
begin
  result := FFunctionPrepareUpdateForm;
end;
//******************************************************************************
procedure TDBShemaView.UpdateVerticalGridFocusValue( Sender: TObject; aValue:variant );
begin
  if self.InputVgrid<>nil then
  begin
    TcxEditorRow(self.InputVgrid.FocusedRow).Properties.Value := aValue;

    self.InputVgrid.OptionsData.Editing:=false;
    self.InputVgrid.OptionsData.Editing:=true;
  end;
end;
//******************************************************************************
procedure TDBShemaView.RefreshVerticalGridPrepareMaskField( aView:TcxGridDBtableView );
begin
  if aView = nil then aView := self.View;
  if aView <> nil then
    PrepareMaskField( self.InputVgrid, aView, self );
end;
//******************************************************************************
procedure TDBShemaView.UpdateVerticalGridFocusValueBlobFile( Sender: TObject; FileName:String );
begin
{  if self.FInputVgrid<>nil then
  begin
   self.FInputVgrid.OptionsData.Editing:=false;
   self.FInputVgrid.OptionsData.Editing:=true;
  end;}
end;
//******************************************************************************
function TDBShemaView.GetVerticalFocusProperties:TcxEditorRow;
begin
  result := TcxEditorRow( self.InputVgrid.FocusedRow);
end;
//******************************************************************************
Procedure TDBShemaView.VerticalGridPostValue;
begin
  if self.InputVgrid.IsEditing then
    self.InputVgrid.HideEdit;
end;
//******************************************************************************
Function TDBShemaView.GetVerticalGridGridByCaptionValue(CaptionRow:String):variant;
begin
  result:=null;
  if self.InputVgrid <> nil then
    result := TcxEditorRow( self.InputVgrid.RowByCaption(CaptionRow) ).Properties.Value;
end;
//******************************************************************************
Function TDBShemaView.GetVerticalGridGridByFieldNameValue(FieldNameRow:String;aView:TcxGridDBtableView=nil;AutoPostValue:Boolean=true ):variant;
var CurIndRow:Integer;
begin

  if aView = nil then aView := self.View;
  try
    if AutoPostValue then VerticalGridPostValue;
    CurIndRow := aView.GetColumnByFieldName(FieldNameRow).Index;

    if CurIndRow <> -1 then
      Result := TcxEditorRow( self.InputVgrid.Rows.Items[CurIndRow] ).Properties.Value
    else Result := null;

  except
    FSysError('Column with field name '+FieldNameRow+' in view '+aView.Name+' not found.');
  end;

end;
//******************************************************************************
procedure TDBShemaView.UpdateVerticalGridByCaptionValue(Sender: TObject;CaptionRow:String;aValue:variant);
begin
  if self.InputVgrid<>nil then
    if self.InputVgrid.RowByCaption(CaptionRow)<>nil then
      TcxEditorRow(self.InputVgrid.RowByCaption(CaptionRow)).Properties.Value := aValue;
end;
//******************************************************************************
procedure TDBShemaView.UpdateVerticalGridByFieldNameValue(Sender: TObject;FieldNameRow:String;aValue:variant;aView:TcxGridDBtableView=nil );
var CurIndRow:Integer;
begin
  if aView = nil then aView := self.View;
  if self.InputVgrid<>nil then
  begin
    CurIndRow := aView.GetColumnByFieldName(FieldNameRow).Index;
    if (CurIndRow<>-1)and(self.InputVgrid.Rows.Items[CurIndRow]<>nil) then
    begin
      VerticalGridPostValue;
      TcxEditorRow(self.InputVgrid.Rows.Items[CurIndRow]).Properties.Value:= aValue;
      VerticalGridPostValue;
    end;
  end;
end;
//******************************************************************************
constructor TDBShemaView.Create(aDB: TDataset; aView: TcxGRidDBTableView;
  aTableName, aFieldKod:WideString; aGenIdName:String='';  aFieldNumber: String='');
begin
  TDBShema(self).Create( aDB, aTableName, aFieldKod,aGenIdName, aFieldNumber );

  self.SetView(aView);
  self.SetViewSummaryGroup;
  self.FcxHintStyleController := TcxHintStyleController.Create(nil);
  self.FcxHintStyleController.LookAndFeel.NativeStyle:=false;
  FcxHintStyleController.LookAndFeel.Kind:= lfStandard;

  SetLength( FPopUpMenuColumns, 0 );
  SetLength( FColMouseCursor, 0 );
  SetLength( FCellHintParamView, 0 );
  ClearNavigationButton;
  FShowUpdateForm:=false;
  FAutoRenomer := true;

  FViewColumnCheck := TList.Create;
  FListExpandedGroup := TStringList.Create;
  FCheckUniqFieldNames := true;
  FSortOrderCount := 0;
  FSaveViewIndexRec :=-1;
  FFunctionFilterView := nil;
end;
//******************************************************************************
destructor TDBShemaView.Close;
begin
  SetView(nil);
  FcxHintStyleController.Free;
  FListExpandedGroup.Free;
  FViewColumnCheck.Free;
  inherited;

end;
//******************************************************************************
function TDBShemaView.FFindCheckColumnValueForRecord( item:TcxCustomGridTableItem; idValue:Variant ):Integer;
var i:integer;
begin
  result:=-1;
  for i:=0 to FViewColumnCheck.Count-1 do
  begin
    if ( PCheckViewColumn(FViewColumnCheck.Items[i])^.ItemColumn = item ) and
       ( PCheckViewColumn(FViewColumnCheck.Items[i])^.idValue  = idValue ) then
    begin
      result:=i;
      break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaView.FindFirstCheckSelectedColumn( aView:TcxGridDBTableView=nil ):TcxGridDBColumn;
var i:Integer;
begin
  Result := nil;
  if aView= nil then aView := self.View;

  for i:=0 to aView.ColumnCount-1 do
    if CheckColumnCanViewForSelect( aView.Columns[i] ) then
    begin
      Result := aView.Columns[i];
      Break;
    end;
end;
//******************************************************************************
function TDBShemaView.VisibleCheckColumn( aVisible:Boolean; aView:TcxGridDBTableView=nil ):boolean;
var ChColumn:TcxGridDBColumn;
begin
  ChColumn := FindFirstCheckSelectedColumn( aView );
  if ChColumn <> nil then
  begin
    Result := ChColumn.Visible;
    ChColumn.Visible := aVisible;
  end
  else Result:=False;
end;
//******************************************************************************
function TDBShemaView.VisibleOrderColumn( aVisible:Boolean ):boolean;
begin
   if self.FieldNumber <> '' then
     if self.View.GetColumnByFieldName( self.FieldNumber )<> nil then
       self.View.GetColumnByFieldName( self.FieldNumber ).Visible := aVisible;
end;
//******************************************************************************
function TDBShemaView.FindRecordIndexByIdValue( Id:Variant ):Integer;
begin
  if self.FView.DataController.LocateByKey( Id ) then
    result := self.FView.DataController.FocusedRecordIndex
  else result :=-1;
end;
//******************************************************************************
function TDBShemaView.GetObjectCheckSelectedViewRow:TList;
begin
  Result := FViewColumnCheck;
end;
//******************************************************************************
function TDBShemaView.FindValueInView(FieldName:string;aValue:Variant):Integer;
var i:Integer;
    indColSearch:Integer;
begin
  result:=-1;
  indColSearch:= self.FView.GetColumnByFieldName( FieldName ).Index;
  for i:=0 to self.FView.DataController.RowCount-1 do
  begin
    if self.FView.ViewData.Rows[i].Values[indColSearch] = aValue then
    begin
      result := i;
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaView.FindValuesInView(FieldName:array of string; aValue:array of Variant):Integer;
begin
  Result := FindValuesInViewByField( self.FView, FieldName, aValue );
end;
//******************************************************************************
function TDBShemaView.MakeStrListForIdInView( FieldName:String ):TStringList;
var i:Integer;
    indColSearch:Integer;
begin
  result := TStringList.Create;
  indColSearch:= self.FView.GetColumnByFieldName( FieldName ).Index;
  
  for i:=0 to self.FView.DataController.RowCount-1 do
    result.Add(  VarToStr( self.FView.ViewData.Rows[i].Values[indColSearch] ) );
end;
//******************************************************************************
function TDBShemaView.CheckRecordBySelectColumn( Item:TcxCustomGridTableItem; idValue:Variant ):boolean;
begin
  Result := FFindCheckColumnValueForRecord( Item, idValue ) <> -1;
end;
//******************************************************************************
function TDBShemaView.CheckColumnCanViewForSelect( ItemColumn: TcxCustomGridTableItem ):Boolean;
begin
  if ( ItemColumn is TcxGridDBColumn )and
     ( TcxGridDBColumn(ItemColumn).DataBinding.FieldName='' ) and
     ( TcxGridDBColumn(ItemColumn).DataBinding.ValueType = 'Boolean' )  then Result:=True
  else result := false;
end;
//******************************************************************************
procedure TDBShemaView.FCheckColumViewCellClick( Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo );
var AGridRecord: TcxCustomGridRecord;
    indColId:integer;
    PObj:PCheckViewColumn;
    IndFindList:Integer;
begin
  if FView = nil then exit;
  if FView.DataController.KeyFieldNames = '' then exit;

  indColId :=FView.GetColumnByFieldName(FView.DataController.KeyFieldNames).Index;
  AGridRecord := TcxGRidDBTableView(Sender).DataController.Controller.FocusedRecord;
  if ( AGridRecord <> nil ) and
     ( CheckColumnCanViewForSelect( ACellViewInfo.Item ) ) and
     ( ACellViewInfo.EditViewInfo is TcxCustomCheckBoxViewInfo ) then
  begin
    IndFindList:= FFindCheckColumnValueForRecord( ACellViewInfo.Item, AGridRecord.Values[indColId] );
    if IndFindList <> -1 then
    begin
      PObj := FViewColumnCheck.Items[IndFindList];
      self.FViewColumnCheck.Delete( IndFindList );
      Dispose( PObj );

      AGridRecord.Values[ACellViewInfo.Item.Index] := False;

      if @FFunctSelectCheckInView<>nil then FFunctSelectCheckInView;
      Abort;
    end
    else
    begin

      AddCheckRecordBySelectColumn( ACellViewInfo.Item, AGridRecord.Values[indColId] );
      AGridRecord.Values[ACellViewInfo.Item.Index] := True;

      if @FFunctSelectCheckInView<>nil then FFunctSelectCheckInView;
      Abort;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaView.AddCheckRecordBySelectColumn( Item:TcxCustomGridTableItem; idValue:Variant );
var IndFindList:Integer;
    PObj:PCheckViewColumn;
begin
  IndFindList:= FFindCheckColumnValueForRecord( Item, idValue );
  if IndFindList = -1 then
  begin
    New(PObj);
    PObj^.idValue := idValue;
    PObj^.ItemColumn := Item;

    FViewColumnCheck.Add( PObj );
  end;
end;
//******************************************************************************
procedure TDBShemaView.AddButtonToViewColumn( aFieldName:String; Act:TcxEditButtonClickEvent; ImageList:TImageList;ImageIndex:Integer=-1 );
var AButton:TcxEditButton;
begin
  AButton := self.View.GetColumnByFieldName( aFieldName ).Properties.Buttons.Add;
  self.View.GetColumnByFieldName( aFieldName ).Properties.Images := ImageList;
  View.GetColumnByFieldName(aFieldName).Properties.OnButtonClick := Act;
  if ImageIndex <> -1 then
  begin
    AButton.ImageIndex := ImageIndex;
    AButton.Kind := bkGlyph;
  end;
end;
//******************************************************************************
procedure TDBShemaView.ClearCheckRecordBySelectColumn( Item:TcxCustomGridTableItem );
var i:Integer;
    PObj:PCheckViewColumn;
begin
  i:=0;
  While i<FViewColumnCheck.Count do
  begin
    if ( PCheckViewColumn(FViewColumnCheck.Items[i])^.ItemColumn = item ) then
    begin
      PObj := FViewColumnCheck.Items[i];
      self.FViewColumnCheck.Delete( i );
      Dispose( PObj );
    end
    else Inc(i);
  end;
end;
//******************************************************************************
procedure TDBShemaView.GridViewCellClick( Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 try
   FCheckColumViewCellClick( Sender, ACellViewInfo );
 finally
   if @self.PersonalCellClick<>nil then self.PersonalCellClick( Sender, ACellViewInfo, AButton, AShift, AHandled );
 end; 
end;
//******************************************************************************
procedure TDBShemaView.ViewSelectAll;
begin
 if FView <> nil then
   FView.DataController.Controller.SelectAll;
end;
//******************************************************************************
procedure TDBShemaView.GridViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  i : Integer;
begin
  i := ACellViewInfo.Item.VisibleIndex;
  if @PersonalCellDblClick<>nil then PersonalCellDblClick( Sender, ACellViewInfo, AButton, AShift, AHandled );
  
  if ( @FActEditDB<>nil ) and ( AButton = mbLeft ) then
    FActEditDB(Self)
  else
    if FEnabled then
    begin
      Sender.OptionsData.Editing:=true;

      Sender.VisibleItems[i].FocusWithSelection;
      Sender.VisibleItems[i].Editing := True;
    end;  
end;
//******************************************************************************
function TDBShemaView.FShowTextImageInCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
                                            ImageList:TImageList; ImageIndex:integer;PosImg:TImageCellPosition ):Boolean;
begin
  ShowTextImageInCell(Sender, ACanvas, AViewInfo, ImageList, ImageIndex, PosImg );
end;
//******************************************************************************
procedure TDBShemaView.GridSetEnabled( aGrid:TcxGrid; Enabled:Boolean;LevelView:Integer = 0 );
begin
   SetGridEnabled( aGrid, Enabled, LevelView );
end;
//******************************************************************************
procedure TDBShemaView.ViewSetEnabled( Enabled:Boolean  );
begin
  SetViewEnabled( View, Enabled );
end;
//******************************************************************************
procedure TDBShemaView.RefreshView;
begin
  if View = nil then exit;
  if View.Site.Parent = nil then exit;

  ViewSetEnabled( TcxGrid( View.Site.Parent ).Enabled );
  self.View.ViewData.Site.Repaint;
end;
//******************************************************************************
procedure TDBShemaView.RepaintColumn( aColum: TcxGridColumn );
begin
  self.View.Invalidate(False);
  if self.View.Controller.FocusedRecord <> nil then
  begin
    self.View.Controller.FocusedRecord.Invalidate;
    self.View.Controller.FocusedRecord.Invalidate( aColum );
  end;
end;
//******************************************************************************
function TDBShemaView.FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
begin
  result:=GetSelectionColor(Sender);
end;
//******************************************************************************
procedure TDBShemaView.FViewDrawFillRect(Sender: TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; ACanvas: TcxCanvas );
begin
  ViewDrawFillRect(Sender, AViewInfo, ACanvas );
end;
//******************************************************************************
procedure TDBShemaView.FShowImageField(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var i:Integer;
  TextRect:TRect;
  indColmValue:Integer;
begin
  for i:=0 to Length(FFieldImageIndex)-1 do
  begin
     indColmValue := FView.GetColumnByFieldName( FFieldImageIndex[i].ValueFieldName ).Index;

     if (CompareText( TcxGridDBColumn(AViewInfo.Item).DataBinding.FieldName , FFieldImageIndex[i].ViewFieldName ) = 0 ) and
        (FFieldImageIndex[i].ValueImage = AViewInfo.GridRecord.Values[indColmValue] )  then
     begin
       FShowTextImageInCell( Sender,  ACanvas, AViewInfo,  FFieldImageIndex[i].ImageList, FFieldImageIndex[i].ImageIndex, FFieldImageIndex[i].ImagePos );
       ADone:=true;
     end;

  end;
end;
//******************************************************************************
Procedure TDBShemaView.FSearchTextOnViewByColumns( AColName : TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false );
begin
  ViewSearchTextByColumns( FView, AColName, SearchText, JustFromBeginStr );
end;
//******************************************************************************
function TDBShemaView.FFormingMasColByFieldNames( FieldNames:array of String ):TMasCxColGrid;
begin
  result := FormingMasColByFieldNames( FView, FieldNames );
end;
//******************************************************************************
function TDBShemaView.FFormingMasColsForAllColumns( IncludeNotVisible:Boolean ):TMasCxColGrid;
begin
  result := FormingMasColsForAllColumns( FView,  IncludeNotVisible );
end;
//******************************************************************************
Procedure TDBShemaView.SearchTextOnViewByColumns( AColName:TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false );
begin
  FSearchTextOnViewByColumns( AColName , SearchText, JustFromBeginStr );
end;
//******************************************************************************
Procedure TDBShemaView.SearchTextOnViewByFieldNames( FieldNames:array of String; SearchText:Widestring;JustFromBeginStr:Boolean=false );
begin
  FSearchTextOnViewByColumns( FFormingMasColByFieldNames( FieldNames ), SearchText, JustFromBeginStr );
end;
//******************************************************************************
Procedure TDBShemaView.SearchTextOnViewAllColumns( SearchText:Widestring; JustFromBeginStr:Boolean=false; SearchInNotVisibleColumn:Boolean=false );
begin
  FSearchTextOnViewByColumns( FFormingMasColsForAllColumns( SearchInNotVisibleColumn ), SearchText, JustFromBeginStr );
end;
//******************************************************************************
procedure TDBShemaView.SetShowDisabledGrid(ShowDisabled: Boolean);
begin
  FShowDisabledGrid:=ShowDisabled;
end;
//******************************************************************************
//procedure TDBShemaView.SaveView
//******************************************************************************
procedure TDBShemaView.GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var IndColId:Integer;
begin
  if self = nil then exit;
  if Sender = nil then exit;
  if Sender is TcxGridDBTableView then
  begin

    if (TcxGridDBTableView(Sender).DataController.KeyFieldNames<>'')and
       (TcxGridDBTableView(Sender).GetColumnByFieldName(TcxGridDBTableView(Sender).DataController.KeyFieldNames)<>nil) then
    begin
      IndColId := TcxGridDBTableView(Sender).GetColumnByFieldName(TcxGridDBTableView(Sender).DataController.KeyFieldNames).Index;

      if ( CheckColumnCanViewForSelect( AViewInfo.Item ) ) and
        ( AViewInfo.EditViewInfo is TcxCustomCheckBoxViewInfo )  then
        TcxCustomCheckBoxViewInfo(AViewInfo.EditViewInfo).State := TcxCheckBoxState( FFindCheckColumnValueForRecord( AViewInfo.Item, AViewInfo.GridRecord.Values[IndColId] ) <> -1 );
    end;

    // Disabled Grid on Color clMenu
    if ( TcxGridDBTableView(Sender).Site.Parent <> nil ) and
       ( not  AViewInfo.Focused ) and ( not AViewInfo.Selected ) and
       ( ( not ( TcxGrid( TcxGridDBTableView(Sender).Site.Parent ) ).Enabled ) or (FShowDisabledGrid) )  then
      ACanvas.Brush.Color := clMenu;
  end;

  FShowImageField(Sender, ACanvas, AViewInfo, ADone);

  if (@PersonalDrawCell<>nil) then
    PersonalDrawCell(Sender, ACanvas, AViewInfo, ADone);
end;
//******************************************************************************
procedure TDBShemaView.GridViewCustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  if @PersonalDrawColumnHeder<>nil then PersonalDrawColumnHeder(Sender, ACanvas, AViewInfo, ADone);
end;
//******************************************************************************
procedure TDBShemaView.GridViewCustomDrawGroupSummaryCell( Sender: TObject;
  ACanvas: TcxCanvas; ARow: TcxGridGroupRow; AColumn: TcxGridColumn;
  ASummaryItem: TcxDataSummaryItem;
  AViewInfo: TcxCustomGridViewCellViewInfo; var ADone: Boolean);
var rect:TRect;
    i:integer;
    Column:TcxGridDBColumn;
begin
  if self.View.DataController.Summary.DefaultGroupSummaryItems.Count = 0 then exit;
  if not self.FShowTotalGroupSummaryUnderColumn then exit;

  for i:=0 to self.View.DataController.Summary.DefaultGroupSummaryItems.Count-1 do
  begin
    if self.View.DataController.Summary.DefaultGroupSummaryItems[i].Position = spGroup then
    begin
      if AColumn = TcxGridDBColumn( TcxGridDBTableSummaryItem( self.View.DataController.Summary.DefaultGroupSummaryItems[i] ).Column ) then
        ViewDrawGroupSummaryItem( Sender, TcxGridDBColumn( TcxGridDBTableSummaryItem( self.View.DataController.Summary.DefaultGroupSummaryItems[i] ).Column ),
                                  ACanvas,AViewInfo, self.FGroupSummaryAlignmentUnderColumn, FGropuSummaryFontStyleUnderColumn,  ADone  );
    end;
  end;

  if @PersonalDrawGroupSummary <> nil then PersonalDrawGroupSummary(Sender,ACanvas,ARow,AColumn,ASummaryItem,AViewInfo,ADone);
end;
//******************************************************************************
procedure TDBShemaView.GridViewColumnHeaderClick(Sender: TcxGridTableView; AColumn: TcxGridColumn );
var i:Integer;
begin
   FSortOrderCount :=0;
   View.BeginSortingUpdate;
   FSaveGroupExpanded;
   for i:=0 to self.View.DataController.Summary.DefaultGroupSummaryItems.Count-1 do
   begin
     if AColumn = TcxGridDBColumn( TcxGridDBTableSummaryItem( self.View.DataController.Summary.DefaultGroupSummaryItems[i] ).Column ) then
       self.View.DataController.Summary.DefaultGroupSummaryItems[i].Sorted := True
     else self.View.DataController.Summary.DefaultGroupSummaryItems[i].Sorted := False;
   end;

   if AColumn.SortOrder = soAscending then
     FSortingGroupedColumn( soDescending )
   else FSortingGroupedColumn( soAscending );

  if @PersonlaColumnHeaderClick <> nil then PersonlaColumnHeaderClick( Sender, AColumn );

  View.EndSortingUpdate;
end;
//******************************************************************************
Procedure TDBShemaView.FSortingGroupedColumn(aSort: TcxDataSortOrder);
var i:integer;
begin
  if View = nil then exit;

  for i:=0 to self.View.GroupedColumnCount-1 do
  begin
    View.GroupedColumns[i].SortOrder:= aSort ;
    View.GroupedColumns[i].GroupIndex:= 0;
  end;
end;
//******************************************************************************
procedure TDBShemaView.FSaveGroupExpanded;
var i:integer;
begin
  FListExpandedGroup.Clear;

  for i := 0 to View.ViewData.RowCount - 1 do
  begin
    if not View.ViewData.Rows[i].IsData then
    begin
      if View.ViewData.Rows[i].Expanded then
        FListExpandedGroup.Add( String( View.ViewData.Rows[i].DisplayTexts[Self.View.GetColumnByFieldName(Self.View.DataController.KeyFieldNames).Index]) );
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaView.FRestoreGroupExpanded;
var i:integer;
    Row:TcxCustomGridRow;
    CurrKey:WideString;
//****************************************
function CheckKey(Key:WideString):Boolean;
var i:integer;
begin
  result := False;
  for i := 0 to FListExpandedGroup.Count - 1 do
  begin
    if CompareText ( FListExpandedGroup.Strings[i],Key) =0  then
    begin
      result := true;
      break;
    end;
  end;
end;
begin

  try
    self.FView.ViewData.Collapse(true);
    View.BeginUpdate;

    for i := View.ViewData.RowCount - 1 downto 0 do
    begin

      if not View.ViewData.Rows[i].IsData then
      begin
        CurrKey := String( View.ViewData.Rows[i].DisplayTexts[Self.View.GetColumnByFieldName(Self.View.DataController.KeyFieldNames).Index] );

        if CheckKey(CurrKey) then
          View.ViewData.Rows[i].Expand(False);
      end;

    end;
    View.EndUpdate;
  finally
    FListExpandedGroup.Clear;
  end;

end;
//******************************************************************************
procedure TDBShemaView.GridViewControllerSortingChanged(Sender: TObject);
var i:integer;
begin
   if FSortOrderCount = self.GetCountSortedColumn-1 then
   begin
     self.FRestoreGroupExpanded;
     FSortOrderCount :=0;
   end
    else Inc(FSortOrderCount);

 if @PersonalSortingChanged <> nil then PersonalSortingChanged( Sender );
end;
//******************************************************************************
procedure TDBShemaView.GridViewControllerFilterChanged(Sender: TObject);
begin
  if @PersonalFilterChange <> nil then PersonalFilterChange( Sender );
end;
//******************************************************************************
procedure TDBShemaView.ShowClearDetailData( aHide:Boolean ) ;
var i:Integer;
begin
   for i:=0 to self.DetailElem.Count - 1 do
   begin
     if (TDBShema(self.DetailElem[i]) is TDBShemaView)and( TDBShemaView(self.DetailElem[i]).View<>nil ) then
       TDBShemaView(self.DetailElem[i]).HideDataForFilterOnView( aHide )
     else
       TDBShema(self.DetailElem[i]).FShowEmptyFilterDataset( aHide );
   end;
end;
//******************************************************************************
procedure TDBShemaView.GridViewEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  if @PersonalEditValueChanged<>nil then PersonalEditValueChanged(Sender,AItem);
end;
//******************************************************************************
function TDBShemaView.GetCountSortedColumn:Integer;
var i:integer;
begin
  result:=0;
  for i:=0 to self.View.ColumnCount-1 do
    if self.View.Columns[i].SortIndex<>-1 then inc(result);
end;
//******************************************************************************
procedure TDBShemaView.RefreshNavigationButton;
begin
 if FButFirst<> nil then FButFirst.Enabled :=not self.View.DataController.IsBOF;
 if FButPrev <> nil then FButPrev.Enabled  :=not self.View.DataController.IsBOF;
 if FButNext <> nil then FButNext.Enabled  :=not self.View.DataController.IsEOF;
 if FButLast <> nil then FButLast.Enabled  :=not self.View.DataController.IsEOF;
end;
//******************************************************************************
procedure TDBShemaView.ShowStatusBarInfoRowCount;
var Str:WideString;
begin
  if ( StatusBarInfo <> nil ) and ( self.View<>nil ) then
  begin
    Str := IntToStr( self.View.DataController.RowCount );
    if self.View.DataController.Controller.SelectedRecordCount>1 then
      Str := Str + ' / '+IntToStr( self.View.DataController.Controller.SelectedRecordCount );

    StatusBarInfo.ShowInfo( 1, Str );
  end;
end;
//******************************************************************************
procedure TDBShemaView.SetUpdateFilterView( aFunctionFilterView:TUpdateFilterView );
begin
  FFunctionFilterView:=aFunctionFilterView;
  
  if Self.View.DataController.Controller.FocusedRecord <> nil then
    GridViewFocusedRecordChanged(Self.View, Self.View.DataController.Controller.FocusedRecord ,
                                 Self.View.DataController.Controller.FocusedRecord , True );
end;
//******************************************************************************
procedure TDBShemaView.GridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var i : Integer;
begin
   if self.View.DataController.Controller.SelectedRecordCount =0 then
     Self.SetFocusOnView;

   if @PersonalFocusedRecordChanged<>nil then
     PersonalFocusedRecordChanged( Sender, APrevFocusedRecord, AFocusedRecord, ANewItemRecordFocusingChanged );

   for i:=0 to self.DetailElem.Count - 1 do
   begin

     if (TDBShema(self.DetailElem[i]) is TDBShemaView)and
        (TDBShemaView(self.DetailElem[i]).View <> nil) then
     begin
       TDBShemaView(self.DetailElem[i]).View.DataController.GotoFirst;
       TDBShemaView(self.DetailElem[i]).SetFocusOnView;
       //if Self.View.DataController.RowCount=0 then
       //TDBShemaView(self.DetailElem[i]).ShowClearDetailData( Self.View.ViewData.RowCount = 0 );
     end;

     if ( TDBShema(self.DetailElem[i]) is TDBShemaTree )and
        ( TDBShemaTree(self.DetailElem[i]).Tree <> nil ) then TDBShemaTree( self.DetailElem[i] ).Tree.DataController.GotoFirst;

   end;

   if @FFunctionFilterView<>nil then FFunctionFilterView( Sender, Self);
   if not Sender.IsControlFocused then exit;
   RefreshNavigationButton;

   //*************************
   //ShowStatusBarInfoRowCount;
end;
//******************************************************************************
procedure TDBShemaView.GridViewCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
  if @PersonalCanFocusRecord <> nil then
    PersonalCanFocusRecord( Sender, ARecord, AAllow );
  //*************************
  ShowStatusBarInfoRowCount;
end;
//******************************************************************************
procedure TDBShemaView.GridViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Self.View = nil then exit;
  
  if @PersonalViewKeyDown<>nil then PersonalViewKeyDown( Sender, Key, Shift );

  if (Key = VK_F11)and (ssCtrl in Shift  )and(ssShift in Shift) then
  begin
    if FView.GetColumnByFieldName( self.FFieldKod ) <> nil then
      FView.GetColumnByFieldName(  self.FFieldKod).Visible := not FView.GetColumnByFieldName(  self.FFieldKod ).Visible;
  end;

  if ( Key = VK_F10 )and ( ssCtrl in Shift  ) and ( ssShift in Shift ) and
     ( self.FFieldNumber <> '' ) and (Self.View.GetColumnByFieldName(self.FFieldNumber) <> nil ) then
  begin
    if MyShowMessageDlg( MessageForRenumberViewData, mtConfirmation, but_YES_NO ) = Res_YES then
      Self.FViewRenomer;
  end;

  if (Key = VK_F11)and (ssCtrl in Shift  )and(ssShift in Shift)and(ssAlt in Shift) then ShowFindAllDataset;

  if (ssCtrl in Shift  ) and(Key = VK_UP)  then
  begin
    self.MoveUpRow;
    abort;
  end;

  if (ssCtrl in Shift  ) and(Key = VK_Down) then
  begin
    self.MoveDownRow;
    abort;
  end;
  
end;
//******************************************************************************
procedure TDBShemaView.GridViewKeyEditKeyDown(Sender: TcxCustomGridTableView;
  AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
  Shift: TShiftState);
begin
  if self.View=nil then exit;
  if Key = VK_TAB then Key:=VK_Return;
end;
//******************************************************************************
function TDBShema.GetActiveCloneElem:TDBShema;
var i:Integer;
begin
  result := self;
  for i:=0 to AllElemnts.Count-1 do
  begin
    if ( TDBShemaView(AllElemnts.Items[i]).ClassType = self.ClassType ) and
       ( TDBShemaView(AllElemnts.Items[i]).DB = self.DB ) then
    begin
      result:=TDBShema(AllElemnts.Items[i]);
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaView.OwnerFormForView(aView:TcxGridDBTableView=nil):TForm;
begin
  if aView = nil then aView := self.FView;
  
  result := FGetOwnerFormForView( aView );
end;
//******************************************************************************
function TDBShemaView.FGetOwnerFormForView(aView:TcxGridDBTableView=nil):TForm;
begin
  result := nil;
  if aView = nil then exit;

  if (aView.Site<>nil) and (aView.site.Parent<>nil) and (aView.site.Parent.Owner<>nil) then
  begin
     result:= GetFormForComponent( aView.site.Parent );
    { if aView.site.Parent.Owner is TForm then result := TForm(aView.site.Parent.Owner)
     else
     if (aView.site.Parent.Owner is TFrame)and(aView.site.Parent.Owner.owner is TForm ) then
       result := TForm( aView.site.Parent.Owner.Owner );  }
  end;
end;
//******************************************************************************
function TDBShemaView.FCheckSameElem( aElem:TDBShemaView ):Boolean;
begin
 result := ( aElem.ClassType = self.ClassType ) and
           ( aElem.DB = self.DB ) and
           ( aElem.FView <> nil ) and
           ( aElem.FView.Site<>nil )and
           ( aElem.FView.Site.Parent<>nil )and
           ( aElem.FView.Site.Parent is TcxGrid );
end;
//******************************************************************************
function TDBShemaView.FGetActiveCloneElem : TDBShemaView;
var i:Integer;
    isFound:Boolean;
    aOwnerForm : TForm;
begin
  result := nil;

  for i:=0 to AllElemnts.Count-1 do
  begin
    if TDBShema(AllElemnts.Items[i]) is TDBShemaView then
    begin
      aOwnerForm := FGetOwnerFormForView( TDBShemaView(AllElemnts.Items[i]).FView );

      if ( FCheckSameElem( TDBShemaView(AllElemnts.Items[i])  ) ) and (aOwnerForm<>nil) and
         ( (ActiveFormBeforeEditData= nil)and(aOwnerForm = Screen.ActiveForm) or
           (ActiveFormBeforeEditData <> nil)and(aOwnerForm = ActiveFormBeforeEditData ) ) then
      begin
        result := TDBShemaView( AllElemnts.Items[i] );
        Break;
      end;
    end;
  end;

end;
//******************************************************************************
function TDBShemaView.GetActiveCloneElem:TDBShemaView;
begin
  result := FGetActiveCloneElem;
  if result = nil then
   result := self;
end;
//******************************************************************************
function TDBShemaView.GetActiveCloneElemForInputVgrid:TDBShemaView;
var i:integer;
begin
  for i:=0 to AllElemnts.Count-1 do
  begin
    if ( TDBShema(AllElemnts.Items[i]).FIDElem = self.FIDElem)and
       ( TDBShema(AllElemnts.Items[i]).FInputVgrid <>nil  ) then
    begin
      result := TDBShemaView( AllElemnts.Items[i] );
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaView.IsViewFocusedOnForm:Boolean;
var i:integer;
begin
  result := False;
  if self.FView = nil then exit;

  result:= self.FView.IsControlFocused;
  if result then exit;

  for i:=0 to self.DetailElem.Count - 1 do
  begin
    if ( TDBShema(self.DetailElem[i]) is TDBShemaView ) and
       ( TDBShemaView(self.DetailElem[i]).FView <> nil ) and
       ( TDBShemaView(self.DetailElem[i]).FView.IsControlFocused ) then
    begin
      result := True;
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShema.GetAllSameCloneObject:TList;
var i:Integer;
begin
  result := TList.Create;
  for i:=0 to AllElemnts.Count-1 do
  begin
    if ( TDBShemaView(AllElemnts.Items[i]).ClassType = self.ClassType ) and
       ( TDBShemaView(AllElemnts.Items[i]).DB = self.DB ) then
      result.add( AllElemnts.Items[i] );
  end;
end;
//******************************************************************************
procedure TDBShemaView.AddPopUpMenuOnViewField( FieldName:string; PUpMenu:TPopUpMenu; MouseButton:TMouseButton );
var len:Integer;
begin
 if self.FView.GetColumnByFieldName(FieldName)<>nil then
 begin
   len:= Length(FPopUpMenuColumns);
   SetLength( FPopUpMenuColumns,len+1 );
   FPopUpMenuColumns[len].FieldName  := FieldName;
   FPopUpMenuColumns[len].PopUpMenu:= PUpMenu;
   FPopUpMenuColumns[len].TrigerMouseButton := MouseButton;
 end;
end;
//******************************************************************************
procedure TDBShemaView.AddCursorOnMouseMoveColumn(FieldName:string;cursor:TCursor);
var len:Integer;
begin
 if self.FView.GetColumnByFieldName(FieldName)<>nil then
 begin
   len:= Length(FColMouseCursor);
   SetLength(FColMouseCursor,len+1);
   FColMouseCursor[len].Column :=self.FView.GetColumnByFieldName(FieldName);
   FColMouseCursor[len].cursor := cursor;
 end;
end;
//******************************************************************************
function TDBShemaView.GetPupMenuForColumn(Column:TcxCustomGridTableItem;MouseBut:TMouseButton):TPopupMenu;
begin
  result := FGetPupMenuForColumn(Column,MouseBut);
end;
//******************************************************************************
function TDBShemaView.FGetPupMenuForColumn(Column:TcxCustomGridTableItem;MouseBut:TMouseButton):TPopupMenu;
var i:Integer;
begin
  result:=nil;
  if (Column.ClassType <> TcxGridDBColumn) and (Column.ClassType <> TcxGridDBBandedColumn) then Exit;

  for i:=0 to Length(FPopUpMenuColumns)-1 do
  begin
    if (FPopUpMenuColumns[i].FieldName = TcxGridDBColumn(Column).DataBinding.FieldName)and(FPopUpMenuColumns[i].TrigerMouseButton = MouseBut ) then
    begin
      result:=FPopUpMenuColumns[i].PopUpMenu;
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaView.FGetMouseCursorForColumn(Column:TcxCustomGridTableItem):TCursor;
var i:Integer;
begin
  result:=-1;
  for i:=0 to Length(FColMouseCursor)-1 do
  begin
    if (FColMouseCursor[i].Column = Column) then
    begin
      result:=FColMouseCursor[i].Cursor;
      Break;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaView.ViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var Mouse:TPoint;
    currPopUpMenu:TPopupMenu;
    IndexIdColum:Integer;
begin
  if self.View=nil then exit;
  FCurrHitTest := TcxGridTableView(TcxGridSite(Sender).GridView).GetHitTest(X,Y);

  if (FCurrHitTest is TcxGridRecordCellHitTest )then
    begin
      (*if TcxGridRecordHitTest( FCurrHitTest ).GridRecord <> nil then
      begin
        {if self.View.GetColumnByFieldName(self.FieldKod)<> nil then
        begin
          IndexIdColum := self.View.GetColumnByFieldName(self.FieldKod).Index;
          //if TcxGridRecordHitTest( FCurrHitTest ).GridView.DataController. GridRecord. :=0;// Values[IndexIdColum]<> self.GetValueId then
          // self.DBLocate( self.FieldKod,TcxGridRecordHitTest( FCurrHitTest ).GridRecord.Values[IndexIdColum],[]);
        end; }

        //TcxGridRecordHitTest( FCurrHitTest ).GridRecord.Focused := true;
      end; *)

      FCurrHitTestCol := TcxGridRecordCellHitTest( FCurrHitTest ).Item;
      currPopUpMenu := FGetPupMenuForColumn( FCurrHitTestCol, Button );
      if currPopUpMenu <> nil then
      begin
        GetCursorPos(Mouse);
        currPopUpMenu.Popup( Mouse.X , Mouse.Y );
      end;  
    end;
 //************************
  if @PersonalViewMouseDown<>nil then PersonalViewMouseDown(Sender, Button, Shift, X, Y );
end;
//******************************************************************************
procedure TDBShemaView.ViewMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var Mouse:TPoint;
    CurrCursor:TCursor;
    IndexHint:Integer;
    AHintText:Widestring;
begin
  if self.View=nil then exit;
  if Sender is TcxGridSite then
    FCurrHitTest :=TcxGridTableView(TcxGridSite(Sender).GridView).GetHitTest(X,Y);  //

  if Sender is TcxGridTableView then
    FCurrHitTest :=TcxGridTableView(Sender).Site.GridView.GetHitTest(X,Y);; // TcxGridTableView(TcxGridSite(Sender).GridView).GetHitTest(X,Y);

  if (FCurrHitTest is TcxGridRecordCellHitTest )then
    begin
      //*******************************************************
      FCurrHitTestCol := TcxGridRecordCellHitTest( FCurrHitTest ).Item;
      IndexHint := FFindIndexCellHintByFieldName( TcxGridDBColumn(FCurrHitTestCol).DataBinding.FieldName );
      if IndexHint<> -1 then
      begin
        AHintText:= FCellHintParamView[IndexHint].FunGetHintText( TcxGridTableDataCellViewInfo(FCurrHitTest.ViewInfo) );
        if AHintText <> '' then
        begin
           with self.View.Site.ClientToScreen( Point(X,Y) ) do
           FcxHintStyleController.ShowHint(X, Y + 20, '', AHintText);
        end
        else FcxHintStyleController.HideHint;
      end
      else FcxHintStyleController.HideHint;
      //*******************************************************
      CurrCursor:= FGetMouseCursorForColumn( FCurrHitTestCol );
      if CurrCursor<>-1 then
       Screen.Cursor:= CurrCursor
      else
       Screen.Cursor:= crDefault ;
      //*******************************************************
    end
    else FcxHintStyleController.HideHint;

  if @PersonalViewMouseMove<>nil then PersonalViewMouseMove( Sender, Shift, X, Y );
end;
//******************************************************************************
procedure TDBShemaView.ViewMouseLeave(Sender: TObject);
begin
  FcxHintStyleController.HideHint;
end;
//******************************************************************************
function TDBShemaView.GetFocusedViewValueForFocusedItem:Variant;
begin
  if ( FCurrHitTestCol <>nil )and(FCurrHitTestCol.FocusedCellViewInfo<>nil) then
    result := FCurrHitTestCol.FocusedCellViewInfo.Text
  else result := null;  
end;
//******************************************************************************
function TDBShemaView.CopyClipboardFocusedViewValueForFocusedItem:Boolean;
var aValue : variant;
begin
  aValue := GetFocusedViewValueForFocusedItem;
  if aValue <>null then
  begin
    ChangeKeyBoardLayout( klUkrainian );
    Clipboard.AsText := VarToStr( aValue );
  end;
end;
//******************************************************************************
function TDBShemaView.GetFocusedViewValue( FieldName:String; AViewInfo: TcxGridTableDataCellViewInfo ):Variant;
var IndColumn:Integer;
begin
  IndColumn:= TcxGridDBTableView(AViewInfo.GridView).GetColumnByFieldName(fieldName).Index;
  if IndColumn <> -1 then
    result := AViewInfo.GridRecord.Values[IndColumn]
  else
  begin
    result:=null;
    self.FSysError('Column by field Name '+fieldName+' in View '+AViewInfo.GridView.Name+' not found');
  end;
end;
//******************************************************************************
procedure TDBShemaView.UpdateValuesForSelectRow(Fields: array of string;
  FieldValues: array of variant);
var i:integer;
    j:Integer;
begin
  if Length(Fields)<>Length(FieldValues) then
  begin
    FSysError('Count Fields not equal count Values!');
    exit;
  end;
  //************************************
  for i:=0 to self.FView.DataController.Controller.SelectedRecordCount-1 do
   begin
      self.FView.DataController.Controller.SelectedRecords[i].Focused:=true;
      self.FView.DataController.DataSource.DataSet.Edit;

      for j:=0 to Length(Fields)-1 do
      if self.FDB.FindField( Fields[j] ) <> nil then
        self.FDB.FieldByName(Fields[j]).Value := FieldValues[j]
      else
      begin
        FSysError('Field '+Fields[j]+' not found on Dataset '+FDB.Name);
        self.FDB.Cancel;
        Exit;
      end;

      self.FView.DataController.DataSource.DataSet.Post;
   end;

end;
//******************************************************************************
procedure TDBShemaView.FUpdateOrder(NewOrder: Integer);
begin
  inherited;
end;
{ TDBShemaTree }
procedure TDBShemaTree.AddPopUpMenuOnTreeField(FieldName: string;
  PUpMenu: TPopUpMenu; MouseButton: TMouseButton);
var len:Integer;
begin
 if self.Tree.GetColumnByFieldName(FieldName)<>nil then
 begin
   len:= Length(FPopUpMenuColumns);
   SetLength( FPopUpMenuColumns, len+1 );
   FPopUpMenuColumns[len].Column  := self.Tree.GetColumnByFieldName(FieldName);
   FPopUpMenuColumns[len].PopUpMenu := PUpMenu;
   FPopUpMenuColumns[len].TrigerMouseButton := MouseButton;
 end;
end;
//******************************************************************************
procedure TDBShemaView.AddNavigationButton(ButFirts, ButPrev, ButNext,
  ButLast: TButton);
begin
  FButFirst := ButFirts;
  FButPrev  := ButPrev;
  FButNext  := ButNext;
  FButLast  := ButLast;
  
  self.RefreshNavigationButton;
end;
//******************************************************************************
function TDBShemaView.FFindIndexCellHintByFieldName( FieldName:String ):Integer;
var i:integer;
begin
  result :=-1;
  for i:=0 to Length(FCellHintParamView) - 1 do
  begin
    if CompareText ( FCellHintParamView[i].FieldNameHint , FieldName ) = 0 then
    begin
      result:=i;
      break;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaView.AddColumnHintParam( HintFieldName:string; FunGetHintText:TOnHintView  );
var Index:Integer;
begin
  Index := FFindIndexCellHintByFieldName( HintFieldName );
  if Index = -1 then
  begin
    Index :=Length( FCellHintParamView );
    SetLength( FCellHintParamView , Index +1 );
  end;
  //*************************************************
  FCellHintParamView[Index].FieldNameHint  := HintFieldName;
  FCellHintParamView[Index].FunGetHintText := FunGetHintText;
end;
//******************************************************************************
procedure TDBShemaView.AddFieldMaskTemplate( MasMaskTemplate : TMasMaskTemplate );
var i:Integer;
    len: Integer;
begin
  len := Length(FMasMaskTemplateArr);
  SetLength( FMasMaskTemplateArr, len +1 );
  FMasMaskTemplateArr[len] := MasMaskTemplate;
end;
//******************************************************************************
function TDBShemaView.FindMaskTemplateFieldForField( aFieldName:string ):TMasMaskTemplate;
var i:Integer;
begin
  result.FieldName := '';
  result.ElemeSource := nil;
  for i:=0 to Length(FMasMaskTemplateArr)-1 do
  begin
    if CompareText(FMasMaskTemplateArr[i].FieldName, aFieldName ) = 0 then
    begin
      result := FMasMaskTemplateArr[i];
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaView.GetMasMaskTemplateArr : TMasMaskTemplateArr;
begin
  result := FMasMaskTemplateArr;
end;
//******************************************************************************
procedure TDBShemaView.ClearNavigationButton;
begin
  FButFirst:= nil;
  FButPrev := nil;
  FButNext := nil;
  FButLast := nil;
end;
//******************************************************************************
function TDBShemaView.GotoMarkID:boolean;
begin
  Result := inherited GotoMarkID;

  if self.FView <> nil then
    self.SetFocusOnView;
end;
//******************************************************************************
procedure TDBShemaView.SaveViewIndexRow;
begin
  self.FSaveViewIndexRec :=FView.DataController.FocusedRecordIndex;
end;
//******************************************************************************
procedure TDBShemaView.GotoSavedViewIndexRow;
begin
  if FSaveViewIndexRec <> -1 then
    if self.FView.DataController.RecordCount>FSaveViewIndexRec then
      self.FView.DataController.FocusedRecordIndex := FSaveViewIndexRec;

  FSaveViewIndexRec := -1;
  self.SetFocusOnView;
end;
//******************************************************************************
procedure TDBShemaView.ViewFocusRowIndex;
begin
  self.SetFocusOnView;
  if View.DataController.FocusedRecordIndex >=0 then
    View.Controller.TopRowIndex := View.DataController.GetRowIndexByRecordIndex( View.DataController.FocusedRecordIndex, True );
end;
//******************************************************************************
procedure TDBShemaView.RestorePositionDBFromIni;
begin
  inherited;
  if not FEnableSavePosition then exit;

  ViewRestorePositionDBFromIni( FView, FIniDBSavePosition );
  {if aView = nil  then exit;
  if not (aView.Site.Parent is TcxGrid) then exit;
  if not DB.Active then exit;

  ValueStr:=ReadIniFile( FIniDBSavePosition, 'PositionView', self.Name );
  if (ValueStr<>'') and (IsStrANumber( ValueStr , true )) then
    aView.Controller.TopRowIndex :=StrToInt(ValueStr);}
  self.SetFocusOnView;
end;
//******************************************************************************
procedure TDBShemaView.SaveDBPosition;
begin
  inherited;
  if not DB.Active then exit;

  //if FEnableSavePosition then
  //  ViewSavePositionDBToIni( self.FView, FIniDBSavePosition );
end;
//******************************************************************************
procedure TDBShema.FButClickEditText(Sender: TObject;  AButtonIndex: Integer);
var Atext:Widestring;
begin
  if self.FInputVgrid.FocusedRow=nil then exit;
  //************************************************************
  if TcxEditorRow(self.FInputVgrid.FocusedRow).Properties.Value <> null then
     Atext:=TcxEditorRow(self.FInputVgrid.FocusedRow).Properties.Value
  else Atext:='';
  //************************************************************
  Atext := ShowEditText( self.DB.Name, Atext );
  //************************************************************
  if Atext <> '^' then
  begin
    TcxEditorRow(self.FInputVgrid.FocusedRow).Properties.Value:=Atext;
    if self.FInputVgrid.IsEditing then self.FInputVgrid.HideEdit;
    self.FInputVgrid.OptionsData.Editing:=false;
    self.FInputVgrid.OptionsData.Editing:=true;
  end;
end;
//******************************************************************************
Procedure TDBShemaView.FAddfieldToVGrid( Column:TcxGridDBColumn; EditValue:Variant );
var CurrRow:TcxEditorRow;
begin
  if (CompareText(Column.DataBinding.FieldName,self.FieldKod)=0)and(Column.Tag=0) then Column.Tag:=-1;
  if (CompareText(Column.DataBinding.FieldName, self.FFieldMainKod)=0)and(Column.Tag=0)and
     (self.FFieldMainKod<>'') then Column.Tag:=-1;

  CurrRow := AddfieldToVGrid( InputVgrid, Column, EditValue, self.FFieldNumber );

  if (Column.PropertiesClass=TcxButtonEditProperties) then
  begin
    if (Column.Tag=3) then
      TcxButtonEditProperties(CurrRow.Properties.EditProperties).OnButtonClick:= FButClickEditText;
  end;
end;
//******************************************************************************
procedure TDBShemaView.FPrepareVGrid( aView:TcxGridDBTableView );
var I:integer;
begin
  InputVgrid.ClearRows;

  for i:=0 to aView.ColumnCount-1 do
    FAddfieldToVGrid( aView.Columns[i], aView.Columns[i].EditValue );

end;
//******************************************************************************
Function TDBShemaView.ShowUpdateForm(setPost:Boolean=true;aView:TcxGridDBTableView=nil):boolean;
begin
  if aView = nil then aView := self.FView;
  Result := FUpdateForm( aView, setPost);
end;
//******************************************************************************
Function TDBShemaView.ShowUpdateFormByViewList(setPost:Boolean=true):boolean;
begin
  Result := FUpdateForm( TcxGridDBTableView(self.ViewList), setPost);
end;
//******************************************************************************
Function ShowUpdateFormForElem( aElem:TDBShema; aView:TcxGridDBTableView; setPost:Boolean=true):boolean;
var AcaptionOnPrepareForm:Widestring;
begin
 try

   ActiveFormBeforeEditData := Screen.ActiveForm;
   Application.CreateForm(TFrmInputData, FrmInputData);
   
   if aElem is TDBShemaView then TDBShemaView(aElem).InputVgrid := FrmInputData.VGrid;
   if aElem is TDBShemaTree then TDBShemaTree(aElem).FInputVgrid := FrmInputData.VGrid;

   FrmInputData.Elem := aElem;
   FrmInputData.FunctValidate := aElem.FFunctValidate;
   FrmInputData.View := aView;

   if @aElem.FunctionPrepareUpdateForm <> nil then
     aElem.FunctionPrepareUpdateForm( aElem );
   //if aElem is TDBShemaView then FrmInputData.MasMaskTemplate := TDBShemaView(aElem).GetMasMaskTemplateArr;

   FrmInputData.ButShowLog.Visible := aElem.FLogStoredProcName<>'' ;

   if aElem.DB.State = dsInsert then AcaptionOnPrepareForm := UpdateFormCaptionInsert
   else AcaptionOnPrepareForm := UpdateFormCaptionEdit;

   FrmInputData.Caption:=AcaptionOnPrepareForm;
   //**********************************
   if aElem is TDBShemaView then
   begin
     TDBShemaView(aElem).FPrepareVGrid( aView );
     TDBShemaView(aElem).RefreshVerticalGridPrepareMaskField( aView );
   end;  
   if aElem is TDBShemaTree then TDBShemaTree(aElem).FPrepareVGrid( TDBShemaTree(aElem).Tree, aView );

   if FrmInputData.ShowModal = mrOk then
   begin
     result:=true;
     if aElem is TDBShemaView then TDBShemaView(aElem).SaveDataFromInputForm( aView, setPost );
     if aElem is TDBShemaTree then TDBShemaTree(aElem).SaveDataFromInputForm( aView, setPost );
   end
   else
   begin
     result:=false;
     if aElem.DB.State in [dsEdit,dsInsert] then aElem.DB.Cancel;
   end;

 finally
   freeAndnil(FrmInputData);
   ActiveFormBeforeEditData := nil;
 end;
end;
//******************************************************************************
Function TDBShemaView.FUpdateForm( aView:TcxGridDBTableView; setPost:Boolean=true):boolean;
var AcaptionOnPrepareForm:Widestring;
begin
 if not TestConnect then exit;

  result := ShowUpdateFormForElem( Self, aView, setPost );
end;
//******************************************************************************
function TDBShemaView.GetArrStafFieldArr:TVarArr;
begin
  Result := inherited GetArrStafFieldArr;
end;
//******************************************************************************
Procedure TDBShemaView.FCloneAssign( var aElem:TDBShemaView );
var i:Integer;
begin
  FCloneAssign( TDBShema(aElem) );

  SetLength( TDBShemaView(aElem).FCellHintParamView, Length(self.FCellHintParamView) );
  for i:=0 to Length(self.FCellHintParamView)-1 do
  begin
    TDBShemaView(aElem).FCellHintParamView[i].FieldNameHint := self.FCellHintParamView[i].FieldNameHint  ;
    TDBShemaView(aElem).FCellHintParamView[i].FunGetHintText := self.FCellHintParamView[i].FunGetHintText;
  end;

  TDBShemaView(aElem).FPopUpMenuColumns := self.FPopUpMenuColumns;

end;
//******************************************************************************
function TDBShemaView.Clone: TDBShemaView;
var aView:TcxGridDBTableView;
    SaveTag:Integer;
begin
  try
    aView := self.CloneView(nil,False);
    SaveTag := self.DB.Tag;
    self.DB.Tag:=-10;

    result := TDBShemaView.Create( self.DB, aView, self.TableName, self.FieldKod, self.GeneratorIdName, self.FieldNumber );
    FCloneAssign( Result );
  finally
    self.DB.Tag := SaveTag;
  end;
end;
//******************************************************************************
procedure TDBShemaView.SaveDataFromInputForm( aView:TcxGridDBTableView; setPost:Boolean=true );
var i:integer;
    CurrFiled:String;
    CurrValue:Variant;
    SaveShowUpdateForm:Boolean;
begin
 if self.InputVgrid = nil then exit;
 if not TestConnect then exit;

 try
   SaveShowUpdateForm := self.FShowUpdateForm;
   self.FShowUpdateForm := false;

   SaveVDataToDB( self.InputVgrid, aView, GetArrStafFieldArr );

   if setPost then aView.DataController.DataSet.Post;
 finally
   self.FShowUpdateForm := SaveShowUpdateForm;
 end;
end;
//******************************************************************************
procedure TDBShemaView.FSaveAndCorrectNumber;
var i:integer;
    IndColumnKey:integer;
    currId:String;
    SaveShowUpdateForm:Boolean;
begin
 if self.FFieldNumber='' then exit;
 if not TestConnect then exit;

 try
  self.FCheckUniqFieldNames := false;

  if self.MainElement<>nil then
     self.MainElement.SaveBookmark;

  self.SaveBookmark;
  self.DB.DisableControls;

  SaveShowUpdateForm := self.FShowUpdateForm;
  self.FShowUpdateForm := false;

  IndColumnKey :=View.GetColumnByFieldName(self.FFieldKod).Index;

  for i:=View.ViewData.RowCount-1 downto 0 do
  begin
   currId:=View.ViewData.Rows[i].Values[IndColumnKey];
   if View.DataController.DataSet.Locate(self.FieldKod,currId,[]) then
   begin
     View.DataController.DataSet.Edit;
     View.DataController.DataSet.FieldByName(self.FFieldNumber).AsInteger := View.DataController.DataSet.FieldByName(self.FFieldNumber).AsInteger*2;
     View.DataController.DataSet.Post;
   end;
  end;

 finally
   self.GotoBookmark;
   db.EnableControls;
   if self.MainElement<>nil then
    self.MainElement.GotoBookmark;

   self.FShowUpdateForm := SaveShowUpdateForm;
   self.FCheckUniqFieldNames := True;
 end;
end;
//******************************************************************************
function TDBShemaView.FGetViewGrid: TcxGrid;
begin
  result:=nil;
  if ( self.View<>nil )and( self.View.Site.Parent<>nil ) and ( self.View.Site.Parent is TcxGrid ) then
    result:= TcxGrid( self.View.Site.Parent );
end;
//******************************************************************************
procedure TDBShemaView.BeforeInsert(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  if (self.FFieldNumber<>'') then
  begin
    FPrepareFieldOrderColumnForUpdate;
    FCurrViewNumber := DataSet.FieldByName(self.FFieldNumber).AsInteger;
    FSaveAndCorrectNumber;
    FIndCloneElemAndLockDBEvents(True);
  end
  else FCurrViewNumber:=-1;
end;
//******************************************************************************
procedure TDBShemaView.BeforeDelete(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  if (View<>nil)and(View.Controller.FocusedRow<>nil) then
    self.FPrevDeleteIndex:= View.Controller.FocusedRow.Index;
end;
//******************************************************************************
procedure TDBShemaView.AfterDelete(DataSet: TDataSet);
var PrevIndexRow:Integer;
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  if (self.FFieldNumber<>'')and(self.View<>nil) then
  begin
    if FAutoRenomer then FViewRenomer;
    //*********************************
    if self.FPrevDeleteIndex>=0 then
     begin
      if View.ViewData.RecordCount-1 > self.FPrevDeleteIndex then PrevIndexRow := self.FPrevDeleteIndex
      else PrevIndexRow:=View.ViewData.RecordCount-1;

      if PrevIndexRow>=0 then self.View.ViewData.Rows[PrevIndexRow].Focused:=true;
      if PrevIndexRow>=0 then self.View.ViewData.Rows[PrevIndexRow].Selected:=true;
     end;
    //*********************************
  end;
end;
//******************************************************************************
procedure TDBShemaView.MoveDownRow;
var SaveUpdateForm:Boolean;
begin
 if not TestConnect then exit;

 try
   self.SaveBookmark;
   SaveUpdateForm := self.FShowUpdateForm;
   self.FShowUpdateForm := false;

   UpDownElemSelect(self.View,self.FFieldNumber, false );
 finally
   FDB.GotoBookmark(self.FBookmark);
   self.FShowUpdateForm := SaveUpdateForm;
 end;
end;
//******************************************************************************
procedure TDBShemaView.MoveUpRow;
var SaveUpdateForm:Boolean;
begin                                                                  
 if not TestConnect then exit;

 try
   self.SaveBookmark;
   SaveUpdateForm := self.FShowUpdateForm;
   self.FShowUpdateForm := false;
   UpDownElemSelect(self.View,self.FFieldNumber, True);
 finally
   FDB.GotoBookmark(self.FBookmark);
   self.FShowUpdateForm := SaveUpdateForm;
 end;
end;
//******************************************************************************
function TDBShemaView.FFieldNumberIsSorted:Boolean;
begin
  result := True;

  if (self.FView <> nil)and( self.FFieldNumber <> '')and(Self.View.GetColumnByFieldName(self.FFieldNumber)<>nil ) then
  begin
    if ( Self.View.GetColumnByFieldName(self.FFieldNumber).SortIndex =0 )and
       ( Self.View.GetColumnByFieldName(self.FFieldNumber).SortOrder = soAscending ) then result := True
    else  result := False;
  end;

end;
//******************************************************************************
function TDBShemaView.FieldNumberIsSorted:Boolean;
begin
  result := FFieldNumberIsSorted;
end;
//******************************************************************************
function TDBShemaView.FGetInputVgrid:TcxVerticalGrid;
begin
  result := self.GetActiveCloneElemForInputVgrid.FInputVgrid;
end;
//******************************************************************************
procedure TDBShemaView.FSetInputVgrid( aVGrid:TcxVerticalGrid );
begin
  self.GetActiveCloneElem.FInputVgrid  := aVGrid ;
end;
//******************************************************************************
procedure TDBShemaView.FPrepareFieldOrderColumnForUpdate;
begin
  if not self.FFieldNumberIsSorted then
  begin
    if (self.FView <> nil)and( self.FFieldNumber <> '')and(Self.View.GetColumnByFieldName(self.FFieldNumber)<>nil ) then
    begin
      Self.View.GetColumnByFieldName(self.FFieldNumber).SortIndex := 0;
      Self.View.GetColumnByFieldName(self.FFieldNumber).SortOrder := soAscending ;
    end;
  end;
end;
//******************************************************************************
function TDBShemaView.CheckMoveUpRow:Boolean;
begin
  //( self.View.DataController.Controller.SelectedRecords[0].Index<>0 )and
  //  ( self.View.DataController.Controller.FocusedRecord.Selected ) and
  if ( self.View <> nil ) and ( self.View.DataController.Controller.SelectedRecordCount <> 0 ) and
     ( not self.View.DataController.Controller.FocusedRecord.IsFirst ) and
     ( FFieldNumberIsSorted ) then result:= True
  else result:= False;
end;
//******************************************************************************
function TDBShemaView.CheckMoveDownRow:Boolean;
begin
  {if ( self.View <> nil)and(self.View.DataController.Controller.SelectedRecordCount<>0)and
     ( not View.DataController.Controller.SelectedRecords[0].IsLast ) and
     ( FFieldNumberIsSorted ) then result:= True
  else result:= False;}

  if ( self.View <> nil ) and ( self.View.DataController.Controller.SelectedRecordCount <> 0 )and
     ( not self.View.DataController.Controller.FocusedRecord.IsLast ) and
     ( FFieldNumberIsSorted ) then result:= True
  else result:= False;

end;
//******************************************************************************
function TDBShemaView.DBInsert( aUpdateForm:Boolean=False):Boolean;
begin
  try
    DB.Append;
    if (not self.UpdateForm) and (aUpdateForm) then
    begin
      if not ShowUpdateForm( True, self.FView ) then
      begin
        if self.DB.State <> dsBrowse then
        begin
         self.DB.Cancel;
         result := False;
        end
        else
        if self.FGetLastInsertID = self.GetValueId then self.DBDelete(False);
      end
      else result := True;
    end
    else
     result := True;
  finally
  end;
end;
//******************************************************************************
function TDBShemaView.DBInsertByListView:Boolean;
begin
  result := false;
  DB.Insert;
  if (not self.UpdateForm) and (not ShowUpdateFormByViewList) then
  begin
    if self.DB.State <> dsBrowse then
    begin
     self.DB.Cancel;
     result := False;
    end;
  end
  else result := True;
end;
//******************************************************************************
function TDBShemaView.DBEdit( aUpdateForm:Boolean=False):Boolean;
begin
  try
    FIndCloneElemAndLockDBEvents(True);
    DB.Edit;
    if (not self.UpdateForm) and (aUpdateForm) then
    begin
      if not ShowUpdateForm(True, self.FView ) then
      begin
        if self.DB.State <> dsBrowse then
        begin
         self.DB.Cancel;
         result := False;
        end;
      end
      else result := True;
    end else result := True;
  finally
    FIndCloneElemAndLockDBEvents(False);
  end;
end;
//******************************************************************************
procedure TDBShemaView.AfterInsert(DataSet: TDataSet);
var ArrFieldsParam : TArrFieldsParam;
    aWasPost:Boolean;
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  
  if self.View =  nil then exit;
  aWasPost := False;
  if ( FFieldNumber<>'' ) then
    begin

      try
        ArrFieldsParam := self.FSaveFieldsToArray ; // Save Required Param for DB
        self.FSetUnRequiredAllFields;               // Set UnRequired for All Fields DB

        self.FCheckUniqFieldNames := false;
        if DataSet.State in [dsBrowse] then DataSet.Edit;
        DataSet.FieldByName( self.FFieldNumber ).AsInteger := FCurrViewNumber * 2 + 1;

        DataSet.Post;
        aWasPost := True;
        FViewRenomer;
        self.FRestoreRequiredDBFields( ArrFieldsParam );

      finally
        self.FCheckUniqFieldNames := True;
        Self.FIndCloneElemAndLockDBEvents( True );
      end;

      FUnselectAllFocusView;
      SetFocusOnView;
      FCurrViewNumber:=-1;

    end;
  //**********************
  
  if FShowUpdateForm then
    if not ShowUpdateForm then
    begin
      if self.DB.State <> dsBrowse then self.DB.Cancel
      else
      if aWasPost then self.DBDelete(False);
    end
end;
//******************************************************************************
procedure TDBShemaView.BeforePost(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  
  if self.View = nil then exit;
  if ( self.FCheckUniqFieldNames )and ( not CheckUniqFieldNames( self , self.View ) ) then Abort;
end;
//******************************************************************************
procedure TDBShemaView.AfterPost(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  if self.View =  nil then exit;
  // далі буде
end;
//******************************************************************************
Procedure TDBShemaView.FSavePosSelected;
var i:integer;
    indSeleRec:Integer;
    Len:Integer;
begin
  if self.View =  nil then exit;
  for i:=0 to self.View.DataController.Controller.SelectedRecordCount-1 do
  begin
    indSeleRec:=self.View.DataController.Controller.SelectedRecords[i].Index;
    begin
      len:=Length(FSelectedRecord);
      SetLength(FSelectedRecord,Len+1);
      FSelectedRecord[len]:=indSeleRec;
    end;
  end;
end;
//******************************************************************************
Procedure TDBShemaView.FRestorePosSelected;
var i:integer;
begin
  if self.View =  nil then exit;
  self.FUnselectAllFocusView;
  for i:=0 to Length(FSelectedRecord)-1 do
    self.View.ViewData.Records[FSelectedRecord[i]].selected:=true;

  SetLength( FSelectedRecord, 0 );
end;
//******************************************************************************
Procedure TDBShemaView.SavePosSelected;
begin
  FSavePosSelected;
end;
//******************************************************************************
Procedure TDBShemaView.RestorePosSelected;
begin
  FRestorePosSelected;
end;
//******************************************************************************
procedure TDBShemaView.SetCurrViewCellDblClickAndSavePrev( CurrDblClick:TcxGridCellClickEvent );
begin
  FSaveBblClick := self.View.OnCellDblClick;
  self.View.OnCellDblClick :=  CurrDblClick ;
end;
//******************************************************************************
procedure TDBShemaView.RestoreViewCellDblClick;
begin
  self.View.OnCellDblClick :=FSaveBblClick;
end;
//******************************************************************************
procedure TDBShemaView.SetCurrViewCurrFocusRecChange( CurrFocusRecChange:TcxGridFocusedRecordChangedEvent );
begin
  self.FCurrFocusRecChange := self.View.OnFocusedRecordChanged;
  self.View.OnFocusedRecordChanged := CurrFocusRecChange;
end;
//******************************************************************************
procedure TDBShemaView.RestoreViewCurrFocusRecChange;
begin
  self.View.OnFocusedRecordChanged := self.FCurrFocusRecChange;
end;
//******************************************************************************
procedure TDBShemaView.FViewRenomer;
var SaveShowUpdateForm:Boolean;
begin
 if not TestConnect then exit;

 try
   if self.DB = nil then  exit;
   if self.View = nil then exit;

   if (self.ViewGrid<>nil) then
   begin
     Self.FSavePosSelected;
     self.ViewGrid.LockScrollBars;
     self.ViewGrid.BeginUpdate;
   end;

   SaveShowUpdateForm := self.FShowUpdateForm;
   self.FShowUpdateForm := false;
   RenomerView(self.View, self.FFieldNumber);

 finally
   if self.ViewGrid<>nil then
   begin
     self.ViewGrid.UnlockScrollBars;
     self.ViewGrid.EndUpdate;
     Self.FRestorePosSelected;
   end;
   self.FShowUpdateForm := SaveShowUpdateForm;
 end;
end;
//******************************************************************************
procedure TDBShemaView.AfterEdit(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  if (FShowUpdateForm)and( FrmInputData = nil) then
    if not ShowUpdateForm then self.DB.Cancel;
end;
//******************************************************************************
procedure TDBShemaView.BeforeEdit(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
procedure TDBShemaView.DBOpen( IBFetchAll:Boolean=False );
var aDS:TDataSource;
    dbWasActive:Boolean;
begin
  if self.View <> nil then
  begin
    dbWasActive := self.DB.Active;
    self.View.BeginUpdate;
    aDS := self.View.DataController.DataSource;
    //self.View.DataController.DataSource:=nil;
  end
  else aDS:=nil;
  inherited;

  if self.View <> nil then
  begin
    if not dbWasActive then RestorePositionDBFromIni;
    self.View.EndUpdate;
  end;
end;
//******************************************************************************
procedure TDBShemaView.DBOpenWait( IBFetchAll:Boolean=False );
begin
  inherited;
end;
//******************************************************************************
procedure TDBShemaTree.ReadPersonalEventsFromtTree( aTree:TcxDBTreeList );
begin
  self.PersonalTreeMouseDown := aTree.OnMouseDown;
  self.PersonalCustomDrawCell:= aTree.OnCustomDrawDataCell;
  self.PersonalMouseMove     := aTree.OnMouseMove;
  self.PersonalExitFromTree  := aTree.OnExit;
  self.PersonalViewKeyDown   := aTree.OnKeyDown;
end;
//******************************************************************************
procedure TDBShemaTree.RestorePersonalEventsToTree( aTree: TcxDBTreeList );
begin
  if aTree <> nil then
  begin
    aTree.OnMouseDown := self.PersonalTreeMouseDown;
    aTree.OnCustomDrawDataCell := self.PersonalCustomDrawCell;
    aTree.OnMouseMove := self.PersonalMouseMove;
    aTree.OnExit      := self.PersonalExitFromTree;
    aTree.OnKeyDown   := self.PersonalViewKeyDown;
  end;
end;
//******************************************************************************
function TDBShemaTree.FGetTree:TcxDBTreeList;
begin
  result:= self.GetActiveCloneElem.FTree;
end;
//******************************************************************************
procedure TDBShemaTree.SetTree( aTree:TcxDBTreeList );
begin
  if self=nil then exit;
  if aTree<>nil then
  begin
    ReadPersonalEventsFromtTree( aTree );

    aTree.OnMouseDown := TreeTourSchedMouseDown;
    aTree.OnKeyDown   := TreeKeyDown;
    aTree.OnCustomDrawDataCell := FTreeDrawDataCell;
    aTree.OnMouseMove          := TreeMouseMove;
    aTree.OnExit               := self.FTreeExit;
    if (aTree.DataController.DataSet = nil)and(self.DS<>nil) then
     aTree.DataController.DataSource := self.DS;
  end
   else
   begin
     if FTree <> nil then
     begin
       RestorePersonalEventsToTree( FTree );
       SaveDBPosition;
     end;
   end;
   
  Ftree := aTree;
  if self.FStyle <> nil then
    if Ftree <> nil then
      Ftree.Styles.StyleSheet := FStyle;
  
  if ( FTree<>nil ) and ( ( FDB is TIBQuery ) or ( FDB is TIBDataset ) ) then
  begin
    if FUpdateSqlIB<>nil then
      TIBQuery(FTree.DataController.DataSet).UpdateObject := FUpdateSqlIB;
  end;
end;
//******************************************************************************
function TDBShemaTree.FGetPupMenuForColumn(Column:TcxTreeListColumn;MouseBut:TMouseButton):TPopupMenu;
var i:Integer;
begin
  result:=nil;
  for i:=0 to Length(FPopUpMenuColumns)-1 do
  begin
    if (FPopUpMenuColumns[i].Column = Column)and(FPopUpMenuColumns[i].TrigerMouseButton = MouseBut ) then
    begin
      result:=FPopUpMenuColumns[i].PopUpMenu;
      Break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaTree.GetFocusedTreeValueForFocusedItem:Variant;
begin
  if ( FCurrHitTestCol <>nil )and(FCurrHitNode<>nil) then result := FCurrHitTestCol.DisplayTexts[FCurrHitNode];
end;
//******************************************************************************
function TDBShemaTree.CopyClipboardFocusedViewValueForFocusedItem:Boolean;
var aValue : variant;
begin
  aValue := GetFocusedTreeValueForFocusedItem;
  if aValue <>null then
  begin
    ChangeKeyBoardLayout( klUkrainian );
    Clipboard.AsText := VarToStr( aValue );
  end;
end;
//******************************************************************************
procedure TDBShemaTree.TreeTourSchedMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Mouse:TPoint;
    aPopMenuCurrentShow:TPopupMenu;
begin
  if self.Tree=nil then exit;
  FCurrHitNode:=TcxDBTreeList(sender).GetNodeAt(X,Y);

  FCurrHitTest:=TcxTreeList(sender).HitTest;
  FCurrHitTestCol:= FCurrHitTest.HitColumn;

  if @PersonalTreeMouseDown<>nil then PersonalTreeMouseDown(Sender,Button,Shift, X, Y);
  //************************************************************
  if ( FCurrHitTest.HitAtNode )and( FCurrHitTest.HitAtColumn ) then
  begin
    FCurrHitNode.Focused:=True;
    FCurrHitNode.Selected:=True;

    aPopMenuCurrentShow:= FGetPupMenuForColumn( self.Tree.Columns[ FCurrHitTest.HitColumn.ItemIndex ], Button );
    if aPopMenuCurrentShow <> nil then
    begin
      GetCursorPos(Mouse);
      aPopMenuCurrentShow.Popup( Mouse.X , Mouse.Y );
    end;
  end;
end;
//******************************************************************************
destructor TDBShemaTree.Close;
begin
  SetTree( nil );
  inherited;
end;
//******************************************************************************
constructor TDBShemaTree.Create(ADB: TDataset; ATree:TcxDBTreeList; aTableName,aFieldKod:Widestring;aGenIdName:String='';  aFieldNumber: String='');
begin
  TDBShema(self).Create( ADB, aTableName, aFieldKod, aGenIdName, aFieldNumber );
  self.FTree:= ATree;
  FLockOnTreeChange:=false;
  SetLength(FPopUpMenuColumns,0);
  SetLength(FColMouseCursor,0);
  SetLength(FLevelImageIndex,0);
  SetLength(FValueTreeImageIndex,0);

  FStyle         := nil;
  FViewForClone  := nil;
  FAutoExpand    := false;
end;
//******************************************************************************
function TDBShemaTree.FGetOrderNumberForNode( Node:TcxTreeListNode ): integer;
begin
  if ( Node <> nil ) and( self.FFieldNumber<>'' ) then
  begin
   if Node.Values[ Tree.GetColumnByFieldName( self.FFieldNumber ).ItemIndex ] <> null then
     result:= Node.Values[ Tree.GetColumnByFieldName( self.FFieldNumber ).ItemIndex ]
   else result:=-1;
  end
  else result:=-1;
end;
//******************************************************************************
Function TDBShemaTree.FMoveNode(Node:TcxTreeListNode;Up:boolean):boolean;
var PrevOrder:Integer;
    FirstNode: TcxTreeListNode;
    SecNode:TcxTreeListNode;
    OrderSec:Integer;
begin
 result:=false;
 if not TestConnect then Exit;
 if Node = nil then Exit;
 
 try
   self.Tree.BeginUpdate;

   if Up then
   begin
     FirstNode:= Node.getPrevSibling;
     if FirstNode = nil then exit;
     SecNode:= Node;
     OrderSec:= FGetOrderNumberForNode( FirstNode );

     FirstNode.Focused := True;
     FUpdateOrder( FGetOrderNumberForNode( SecNode ) );

     SecNode.Focused:= true;
     FUpdateOrder( OrderSec );
     result := True;
   end
   else
   begin
     FirstNode:= Node;
     SecNode:= Node.getNextSibling;
     if SecNode = nil then exit;
     OrderSec:= FGetOrderNumberForNode( SecNode );

     SecNode.Focused:=True;
     FUpdateOrder( FGetOrderNumberForNode( FirstNode ) );

     FirstNode.Focused:=True;
     FUpdateOrder( OrderSec );

     result:=True;
   end;
    
   Node.Focused:=True;
 finally
   self.Tree.EndUpdate;
 end;
end;
//******************************************************************************
procedure TDBShemaTree.FReorderNodeLevel( aNode:TcxTreeListNode );
var ChildNodes:array of TcxTreeListNode;
    IndNode:Integer;
    EventOnChangeNode:TNotifyEvent;
    EventTreeNodeChange:TcxTreeListFocusedNodeChangedEvent;
    SaveNode:TcxTreeListNode;
begin
  if aNode =  nil then exit;
  if not TestConnect then exit;

  try
    FLockOnTreeChange:=true;
    EventTreeNodeChange:=FTree.OnFocusedNodeChanged;
    FTree.OnFocusedNodeChanged := nil;

    SetLength(ChildNodes , aNode.ChildVisibleCount);

    aNode := aNode.getFirstChild;
    IndNode :=0;

    while aNode <> nil do
    begin
      ChildNodes[IndNode]:= aNode;
      aNode := aNode.getNextSibling;
      inc(IndNode);
    end;

  try
    SaveNode := self.FTree.FocusedNode;
    for IndNode:=0 to Length(ChildNodes)-1 do
    begin
      ChildNodes[IndNode].Focused:=True;
      Self.FUpdateOrder( IndNode + 1 );
    end;
  finally
    SaveNode.Focused:=True;
  end;

  finally
   FTree.OnFocusedNodeChanged := EventTreeNodeChange;
   FLockOnTreeChange:=false;
  end;
end;
//******************************************************************************
Function TDBShemaTree.CheckMoveNodeUp(Node:TcxTreeListNode):boolean;
begin
  result := false;
  if Self.FTree = nil then exit;

  if Node = nil then Node := Self.FTree.FocusedNode;
  if Node <> nil then
    result:= (Node.getPrevSibling<>nil) {and (Node.Level <> 0)};
end;
//******************************************************************************
Function TDBShemaTree.CheckMoveNodeDown(Node:TcxTreeListNode):boolean;
begin
  result := false;
  if Self.FTree = nil then exit;
  if Node = nil then Node := Self.FTree.FocusedNode;
  if Node <> nil then
    Result:= (Node.getNextSibling<>nil) {and (Node.Level <> 0)};
end;
//******************************************************************************
Function TDBShemaTree.MoveNodeUp(Node:TcxTreeListNode):boolean;
begin
  result := false;
  if Self.FTree = nil then exit;

  if Node = nil then Node := Self.FTree.FocusedNode;
  if Node <> nil then
    result := FMoveNode(Node, True);
end;
//******************************************************************************
Function TDBShemaTree.MoveNodeDown(Node:TcxTreeListNode):boolean;
begin
  result := false;
  if Self.FTree = nil then exit;

  if Node = nil then Node := Self.FTree.FocusedNode;
  if Node <> nil then
    result := FMoveNode(Node, false);
end;
//******************************************************************************
Function TDBShemaTree.FGetNextOrderForNode(Node:TcxTreeListNode):Integer;
begin
 if Node<>nil then
    result := Node.ChildVisibleCount + 1
  else result:=1;
end;
//******************************************************************************
{procedure TDBShemaTree.FReorderNode( aNode:TcxTreeListNode );
var ChildNodes:array of TcxTreeListNode;
    IndNode:Integer;
    EventOnChangeNode:TNotifyEvent;
begin
 if aNode =  nil then exit;
 try
  FLockOnViewChange:=true;
  DisabledChangeTreeControl;

  SetLength(ChildNodes , aNode.ChildVisibleCount);
  //***********************************************
  aNode := aNode.getFirstChild;
  IndNode :=0;
  //***********************************************
  while aNode <> nil do
  begin
   ChildNodes[IndNode]:= aNode;
   NodeaNodeDay := aNode.getNextSibling;
   inc(IndNode);
  end;
  //***********************************************
  for IndNode:=0 to Length(ChildNodes)-1 do
  begin
    ChildNodes[IndNode].Focused:=True;
    FTree.DataController.DataSet.Edit;
    FTree.DataController.DataSet.FieldByName( self.FFieldNumber ).AsInteger:= IndNode + 1;
    FTree.DataController.DataSet.Post;
  end;
  //***********************************************
 finally
   EnabledChangeTreeControl;
   FLockOnViewChange:=false;
 end;
end;  }
//******************************************************************************
function TDBShemaTree.FSetFreeSpaceForInsertNode( node : TcxTreeListNode; IndexFree:Integer=2 ):integer;
var currNode:TcxTreeListNode;
    currOrder:Variant;
    SaveNode:TcxTreeListNode;
begin
  result := -1;
  if node = nil then exit;
  if node.GetNext = nil then
  begin
    result := FGetNextOrderForNode( Node.Parent );
    exit;
  end;
  if self.FFieldNumber = '' then Exit;
  
  currNode:=node.GetNext;

  if currNode.Level = node.Level then result:= FGetOrderNumberForNode( currNode )
  else
  begin
   if currNode.Level > node.Level then result := 2;
   if currNode.Level < node.Level then result := FGetNextOrderForNode( Node.Parent );
  end;

  Try
    SaveNode:=self.FTree.FocusedNode;
    while ( currNode<>nil )and( currNode.Level = node.Level ) do
    begin
      currNode.Focused := True;
      currOrder:= currNode.Values[ FTree.GetColumnByFieldName( self.FFieldNumber ).ItemIndex ];
      if currOrder = null then currOrder:=1;

      self.FDB.Edit;
      self.FDB.FieldByName(self.FFieldNumber).AsInteger := currOrder * IndexFree;;
      self.FDB.Post;

      currNode.Values[ FTree.GetColumnByFieldName( self.FFieldNumber ).ItemIndex ] := currOrder * IndexFree;
      currNode:=currNode.GetNext;
    end;
  finally
    SaveNode.Focused:= True;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.FUpdateOrder(NewOrder: Integer);
begin
  inherited;

end;
//******************************************************************************
procedure TDBShemaTree.SetFocusedTree(aNode:TcxTreeListNode=nil);
begin
  if aNode = nil  then aNode:=FTree.FocusedNode;
  if aNode <> nil  then
  begin
  
    aNode.Focused:=True;
    aNode.Selected:=True;

    if Self.FDB.FieldByName(self.FFieldKod).Value <> aNode.Values[ FTree.GetColumnByFieldName(self.FFieldKod).ItemIndex ] then
      FLocateDBByID(Self.FDB.FieldByName(self.FFieldKod).Value );
  end;
end;
//******************************************************************************
procedure TDBShemaTree.TreeGotoFirst;
begin
 if self.FTree<>nil then SetFocusedTree( self.FTree.TopNode );
end;
//******************************************************************************
procedure TDBShemaTree.TreeExpandAll;
begin
 if self.FTree<>nil then self.FTree.FullExpand;
end;
//******************************************************************************
procedure TDBShemaTree.TreeColapseAll;
begin
  if self.FTree<>nil then self.FTree.FullCollapse;
end;
//******************************************************************************
procedure TDBShemaTree.TreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F11)and (ssCtrl in Shift  )and(ssShift in Shift) then
  begin
    if FTree.GetColumnByFieldName( self.FFieldKod ) <> nil then
      FTree.GetColumnByFieldName(  self.FFieldKod).Visible := not FTree.GetColumnByFieldName(  self.FFieldKod ).Visible;
  end;
  if @self.PersonalViewKeyDown <> nil then self.PersonalViewKeyDown(Sender, Key,Shift);
end;
//******************************************************************************
function TDBShemaTree.FFieldNumberIsSorted:Boolean;
begin
  result := True;

  if (self.FTree <> nil)and( self.FFieldNumber <> '')and(Self.FTree.GetColumnByFieldName(self.FFieldNumber)<>nil ) then
  begin
    if ( Self.FTree.GetColumnByFieldName(self.FFieldNumber).SortIndex =0 )and
       ( Self.FTree.GetColumnByFieldName(self.FFieldNumber).SortOrder = soAscending ) then result := True
    else  result := False;
  end;

end;
//******************************************************************************
function TDBShemaTree.FieldNumberIsSorted:Boolean;
begin
  result := FFieldNumberIsSorted;
end;
//******************************************************************************
function TDBShemaTree.FindLastElemForNode( Node:TcxTreeListNode ):TcxTreeListNode;
begin
  result := TreeFindLastElemForNode( Node );
end;
//******************************************************************************
function TDBShemaTree.FLocateDBByID(ID:Variant):Boolean;
begin
  result := false;
  if not TestConnect then exit;

  result := FTree.DataController.DataSet.Locate(self.FFieldKod, ID, []);
  DBReCalcFields;
end;
//******************************************************************************
function TDBShemaTree.FTreeGetValueIdNode(aNode:TcxTreeListNode):Variant;
begin
  result := aNode.Values[ FTree.GetColumnByFieldName(self.FFieldKod).ItemIndex ];
end;
//******************************************************************************
function TDBShemaTree.DeleteNode( aNode:TcxTreeListNode; AskDelete:Boolean=true): Boolean;
var saveAsk:Boolean;
    aPrevNode:TcxTreeListNode;
    aNodeLevel:Integer;
begin
 if aNode = nil then exit;
 
 try
   result:=False;
   saveAsk:= self.AskBeforeDelete;
   aPrevNode := aNode.GetPrev;

   if (( AskDelete) and (FConfirmBeforeDelete )) or ( not AskDelete ) then
   begin
     aNodeLevel := aNode.Level;
     self.AskBeforeDelete := False;
     self.FPrepareUpdateObjectDeleteCurrentIB;
     aNode.Delete;
     result:=True;
     aNode:=aPrevNode;
     if aNode <> nil then
       aNode.Focused:=True;
     //******************************************
     if (aNode <> nil)and(aNode.Parent<>nil) then
     begin
       if aNodeLevel=aNode.Level then
         self.FReorderNodeLevel( aNode.Parent )
       else
         self.FReorderNodeLevel( aNode );
     end;
   end;

 finally
   self.AskBeforeDelete := saveAsk;
 end;
end;
//******************************************************************************
Procedure TDBShemaTree.SearchTextOnViewAllColumns( SearchText:Widestring; JustFromBeginStr:Boolean=false; SearchInNotVisibleColumn:Boolean=false );
begin
  FSearchTextOnTreeByColumns( FFormingMasColsForAllColumns( SearchInNotVisibleColumn ), SearchText, JustFromBeginStr );
end;
//******************************************************************************
function TDBShemaTree.DeleteFocusedNode(AskDelete:Boolean=true): Boolean;
begin
  result := DeleteNode(FTree.FocusedNode,AskDelete);
end;
//******************************************************************************
function TDBShemaTree.TreeFocusedTopNode:TcxTreeListNode;
var aNode: TcxTreeListNode;
begin
 aNode:=nil;

 if ( FTree <> nil ) and ( FTree.FocusedNode<>nil ) then
   aNode:=FTree.FocusedNode
 else exit;

 while ( aNode<>nil ) and ( aNode.Level>0 ) do
   aNode := aNode.Parent;
   
 result := aNode;
end;
//******************************************************************************
function TDBShemaTree.TreeCountOnTopLevel:Integer;
var aNode: TcxTreeListNode;
begin
  result:=0;
  if FTree = nil then exit;
  //***********************
  aNode := FTree.TopNode;
  while aNode<>nil do
  begin
    Inc(result);
    aNode:=aNode.getNextSibling;
  end;
end;
//******************************************************************************
function TDBShemaTree.TreeNodeAllChildCount( aNode:TcxTreeListNode ):Integer;
var UntilLevel:Integer;
begin
  result:=0;
  if FTree = nil then exit;
  if aNode = nil then exit;
  if not aNode.HasChildren then exit;
  UntilLevel := aNode.Level;

  aNode:=aNode.GetFirstChildVisible;
  //***********************
  while aNode<>nil do
  begin
    if aNode.Visible then
      Inc(result);

    aNode:=aNode.GetNext;
    if ( aNode <> nil ) and ( aNode.Level <= UntilLevel ) then break;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.FGetCheckFieldValueProperty( FieldCheck:String;
  var ValueCheck:Variant;var ValueUnCheck:Variant;var ValueGrayed:Variant );
begin
  if FTree.GetColumnByFieldName(FieldCheck).Properties is TcxCheckBoxProperties then
  begin
    ValueCheck := TcxCheckBoxProperties(FTree.GetColumnByFieldName(FieldCheck).Properties).ValueChecked;
    ValueUnCheck := TcxCheckBoxProperties(FTree.GetColumnByFieldName(FieldCheck).Properties).ValueUnchecked;
    ValueGrayed := TcxCheckBoxProperties(FTree.GetColumnByFieldName(FieldCheck).Properties).ValueGrayed;
  end
   else
   begin
     ValueCheck := 1;
     ValueUnCheck := 0;
     ValueGrayed := null;
   end;
end;
//******************************************************************************
function TDBShemaTree.FGetCountChildCheckedForNode( aNode:TcxTreeListNode; FieldCheck:String; Checked:Variant ):Integer;
var UntilLevel:Integer;
    IndColCheck:Integer;
begin
  result := 0;
  if aNode = nil then exit;
  IndColCheck := FTree.GetColumnByFieldName( FieldCheck ).ItemIndex;
  
  UntilLevel := aNode.Level;
  aNode := aNode.GetFirstChildVisible;

  while aNode <> nil do
  begin
    if (aNode.Visible) and ( aNode.Values[ IndColCheck ] = Checked ) then Inc( result );

    aNode:=aNode.GetNext;
    if ( aNode <> nil ) and ( aNode.Level <= UntilLevel ) then break;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.FCheckUncheckNode( wNode:TcxTreeListNode; FieldCheck:String; aChecked:Variant );
var IndColCheck:Integer;
begin
  IndColCheck := Tree.GetColumnByFieldName( FieldCheck ).ItemIndex;
  if wNode.Values[IndColCheck] <> aChecked then
  begin
    wNode.Focused:=true;
    wNode.Values[IndColCheck]:= aChecked;
    TcxDBTreeList(wNode.TreeList).DataController.DataSet.Edit;
    TcxDBTreeList(wNode.TreeList).DataController.DataSet.FieldByName(FieldCheck).value:=aChecked;
    TcxDBTreeList(wNode.TreeList).DataController.DataSet.Post;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.FCheckNodeAndChild( aNode:TcxTreeListNode; FieldCheck:String; Checked:Variant );
var SaveNode:TcxTreeListNode;
    UntilLevel:Integer;
    CountChildChecked:Integer;
    ValueCheck:Variant;
    ValueUnCheck:Variant;
    ValueGrayed:Variant;
begin
  if self.Tree = nil then exit;
  if aNode = nil then exit;

  FGetCheckFieldValueProperty( FieldCheck, ValueCheck, ValueUnCheck, ValueGrayed );

  SaveNode:=aNode;
  CountChildChecked :=0;
  UntilLevel := aNode.Level;
  FCheckUncheckNode(aNode, FieldCheck, Checked );

  try
    TcxDBTreeList(SaveNode.TreeList).BeginUpdate;
    aNode := aNode.GetFirstChildVisible;

    while aNode<>nil do
    begin
      if aNode.Visible then
      begin
        FCheckUncheckNode( aNode, FieldCheck, Checked );
        Inc( CountChildChecked );
      end;

      aNode := aNode.GetNext;
      if ( aNode <> nil ) and (aNode.Visible)and ( aNode.Level <= UntilLevel ) then break;
    end;

    aNode := SaveNode.Parent;
    self.RefreshSmartNode( aNode, FieldCheck );

  finally
    SaveNode.Focused:=true;
    TcxDBTreeList(SaveNode.TreeList).EndUpdate;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.AddVirtualTreeParam( aFieldParent:String; aViewForClone:TcxGridDBTableView; aAutoExpand:Boolean; aStyle:TcxTreeListStyleSheet );
begin
  self.FFieldParent := aFieldParent;
  FViewForClone := aViewForClone;
  FAutoExpand := aAutoExpand;
  PrepareOptionView( FViewForClone,self.FFieldNumber );
  FStyle := aStyle;
end;
//******************************************************************************
function TDBShemaTree.GetViewForClone:TcxGridDBTableView;
begin
  Result := FViewForClone;
end;
//******************************************************************************
function TDBShemaTree.CheckCreateBand( aTree:TcxDBTreeList; IndexBand:Integer ):TcxTreeListBand;
begin
  if aTree.Bands.Count<=IndexBand then
    result := aTree.Bands.Add
  else result := aTree.Bands.Items[IndexBand];
end;
//******************************************************************************
function TDBShemaTree.FGetOwnerFormForTree( aTree:TcxDBTreeList=nil ):TForm;
begin
  result := nil;
  if aTree = nil then exit;

  if (aTree <>nil) and (aTree.Owner<>nil) then
  begin
     if aTree.Owner is TForm then result := TForm(aTree.Owner)
     else
     if (aTree.Owner is TFrame)and( aTree.Owner.Owner is TForm ) then
       result := TForm( aTree.Owner.Owner );
  end;
end;
//******************************************************************************
function TDBShemaTree.FCheckSameElem( aElem:TDBShemaTree ):Boolean;
begin
 result := ( aElem.ClassType = self.ClassType ) and
           ( aElem.FDB = self.FDB ) and
           ( aElem.FTree <> nil );
end;
//******************************************************************************
function TDBShemaTree.GetActiveCloneElem:TDBShemaTree;
var i:Integer;
    aOwnerForm:TForm;
begin
  result := self;
  
  for i:=0 to AllElemnts.Count-1 do
  begin
    if TDBShema(AllElemnts.Items[i]) is TDBShemaTree then
    begin
      aOwnerForm := FGetOwnerFormForTree( TDBShemaTree(AllElemnts.Items[i]).FTree );

      if ( FCheckSameElem( TDBShemaTree(AllElemnts.Items[i]) ) ) and ( aOwnerForm<>nil ) and
         ( (ActiveFormBeforeEditData= nil)and(aOwnerForm = Screen.ActiveForm) or
           (ActiveFormBeforeEditData <> nil)and(aOwnerForm = ActiveFormBeforeEditData ) ) then
      begin
        result := TDBShemaTree(AllElemnts.Items[i]);
        Break;
      end;
    end;
  end;

end;
//******************************************************************************
procedure TDBShemaTree.PreviewVirtualOnTree( aTree:TcxDBTreeList );
var i:Integer;
    aCol: TcxDBTreeListColumn;
    CurrIndFieldColumn:Integer;
begin
  if self.FViewForClone = nil then Exit;

  aTree.BeginUpdate;
  RestorePersonalEventsToTree( aTree );
  try
    aTree.DataController.KeyField := self.FFieldKod;
    aTree.DataController.ParentField := self.FFieldParent;
    aTree.OptionsData.Editing := self.FViewForClone.OptionsData.Editing;
    aTree.OptionsView.ColumnAutoWidth :=self.FViewForClone.OptionsView.ColumnAutoWidth;
    aTree.OptionsCustomizing.ColumnMoving := self.FViewForClone.OptionsCustomize.ColumnMoving ;
    aTree.OptionsCustomizing.ColumnHorzSizing := self.FViewForClone.OptionsCustomize.ColumnHorzSizing ;
    aTree.DeleteAllColumns;
    
    for i:= 0 to self.FViewForClone.ColumnCount - 1  do
    begin
      aCol := TcxDBTreeListColumn( aTree.CreateColumn( nil ) );
      aCol.Width := self.FViewForClone.Columns[i].Width;
      aCol.Visible := self.FViewForClone.Columns[i].Visible;
      aCol.DataBinding.FieldName := self.FViewForClone.Columns[i].DataBinding.FieldName;

      aCol.PropertiesClass:=self.FViewForClone.Columns[i].PropertiesClass;
      if aCol.PropertiesClass <> nil then
        aCol.Properties.Assign( self.FViewForClone.Columns[i].Properties );

      aCol.Caption.Text := self.FViewForClone.Columns[i].Caption;
      aCol.Options.Sizing := self.FViewForClone.Columns[i].Options.HorzSizing;
      aCol.Options.Editing := self.FViewForClone.Columns[i].Options.Editing;

      aCol.Caption.AlignHorz := self.FViewForClone.Columns[i].HeaderAlignmentHorz;
      aCol.Caption.AlignVert := self.FViewForClone.Columns[i].HeaderAlignmentVert;
      aCol.Options.Sorting   := self.FViewForClone.Columns[i].Options.Sorting;
      aCol.SortOrder   := self.FViewForClone.Columns[i].SortOrder;
      aCol.SortIndex   := self.FViewForClone.Columns[i].SortIndex;
    end;
    
  finally
    aTree.EndUpdate;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.DeactiveVirtualOnTree( aTree:TcxDBTreeList );
begin
  aTree.DataController.KeyField := '';
  aTree.DataController.ParentField := '';
  aTree.DataController.DataSource := nil;
  aTree.Styles.StyleSheet := nil;
end;
//******************************************************************************
function TDBShemaTree.Clone: TDBShemaTree;
var SaveTag:integer;
begin
  try
    SaveTag := self.DB.Tag;
    self.DB.Tag:=-10;
    result := TDBShemaTree.Create( self.DB, self.FTree, self.TableName, self.FieldKod, self.GeneratorIdName, self.FieldNumber );
    FCloneAssign( TDBShema(Result) );
  
    result.AddVirtualTreeParam( self.FFieldParent, self.FViewForClone,self.FAutoExpand, self.FStyle );
  finally
    self.DB.Tag := SaveTag;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.RefreshSmartNode( aNode:TcxTreeListNode; FieldCheck:String );
var aCheck:variant;
    ValueCheck:Variant;
    ValueUnCheck:Variant;
    ValueGrayed:Variant;
begin
  FGetCheckFieldValueProperty( FieldCheck, ValueCheck, ValueUnCheck, ValueGrayed );
  aNode := self.FindLastElemForNode( aNode );
  aCheck := aNode.Values[Tree.GetColumnByFieldName(FieldCheck).ItemIndex];

  while ( aNode <> nil ) and (aNode <> self.Tree.Root) do
  begin
    if aNode.Visible then
    begin
      if ( self.TreeNodeAllChildCount( aNode ) = FGetCountChildCheckedForNode( aNode, FieldCheck, aCheck ) ) then
        FCheckUncheckNode( aNode, FieldCheck, aCheck )
      else
        FCheckUncheckNode( aNode, FieldCheck, ValueGrayed );
    end;
    aNode := aNode.Parent;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.RefreshSmartNodesOnTree( FieldCheck:String );
var aNode:TcxTreeListNode;
begin
  aNode := Tree.TopNode;
  while aNode <> nil do
  begin
    if aNode.Visible then
      self.RefreshSmartNode(aNode, FieldCheck);

    aNode := aNode.GetNextSibling;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.CheckSmartNode( aNode:TcxTreeListNode; FieldCheck:String );
var aCheck:variant;
    ValueCheck:Variant;
    ValueUnCheck:Variant;
    ValueGrayed:Variant;
begin
  FGetCheckFieldValueProperty( FieldCheck, ValueCheck, ValueUnCheck, ValueGrayed );

  aCheck := aNode.Values[ Tree.GetColumnByFieldName(FieldCheck).ItemIndex ];
  if aCheck = ValueCheck then aCheck := ValueUnCheck
  else aCheck := ValueCheck;

  FCheckNodeAndChild( aNode, FieldCheck, aCheck );
end;
//******************************************************************************
procedure TDBShemaTree.CheckSmartNode( aNode:TcxTreeListNode; FieldCheck:String;Value:Variant );
begin
   FCheckNodeAndChild( aNode, FieldCheck, Value );
end;
//******************************************************************************
Procedure TDBShemaTree.FAddfieldToVGrid( Column:TcxGridDBColumn; EditValue:Variant );
var CurrRow:TcxEditorRow;
begin
  if CompareText(Column.DataBinding.FieldName,self.FieldKod)=0     then Column.Tag:=-1;
  if (CompareText(Column.DataBinding.FieldName, self.FFieldMainKod)=0) and
     (self.FFieldMainKod<>'') then Column.Tag:=-1;

  CurrRow := AddfieldToVGrid( FInputVgrid, Column, EditValue, self.FFieldNumber );

  if (Column.PropertiesClass=TcxButtonEditProperties) then
  begin
    if (Column.Tag=3) then
      TcxButtonEditProperties(CurrRow.Properties.EditProperties).OnButtonClick := FButClickEditText;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.FPrepareVGrid( aTree:TcxDBTreeList; aView:TcxGridDBTableView );
var I:integer;
begin
  FInputVgrid.ClearRows;

  for i:=0 to aView.ColumnCount-1 do
    FAddfieldToVGrid( aView.Columns[i], self.FTree.GetColumnByFieldName(aView.Columns[i].DataBinding.FieldName).EditValue );

end;
//******************************************************************************
procedure TDBShemaTree.CheckSmartFocusedNode( FieldCheck:String );
begin
  if Ftree = nil then exit;
  if Ftree.FocusedNode = nil then exit;

  CheckSmartNode( Ftree.FocusedNode, FieldCheck );
end;
//******************************************************************************
procedure TDBShemaTree.SetFieldColumnShowMainImage( aFieldName:String );
begin
  FFieldShowImageIndex := aFieldName;
end;
//******************************************************************************
function TDBShemaTree.FGetSelectionColor(Sender: TcxCustomTreeList):TcxStyle;
begin
  result := GetSelectionColorTree( Sender );
end;
//******************************************************************************
procedure TDBShemaTree.FTreeDrawFillRect(Sender: TcxCustomTreeList; AViewInfo: TcxTreeListEditCellViewInfo; ACanvas: TcxCanvas );
var FocusedStyle:TcxStyle;
    Rect:TRect;
begin
 Rect:= AViewInfo.BoundsRect;
 //****************************************************
 if Sender.OptionsView.GridLines <> tlglNone then
 begin
   Rect.Top := Rect.Top + 1;
   Rect.Bottom := Rect.Bottom - 1;
   Rect.Left:= Rect.Left + 1;
   Rect.Right:= Rect.Right - 1;
 end;
 //****************************************************
 if ( AViewInfo.Focused )and( AViewInfo.Selected ) then
  begin
    FocusedStyle:= FGetSelectionColor( Sender );
    ACanvas.Font.Color := FocusedStyle.TextColor;
    ACanvas.FillRect( Rect , FocusedStyle.Color );
  end
  else
    ACanvas.FillRect( Rect , ACanvas.Brush.Color );
end;
//******************************************************************************
function TDBShemaTree.FShowTextImageInCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
                                            ImageList:TImageList; ImageWidth, ImageIndex:integer;PosImg:TImageCellPosition ):Boolean;
begin
  result := ShowTextImageInCellTree(Sender, ACanvas, AViewInfo, ImageList,ImageWidth, ImageIndex,PosImg );
end;
//******************************************************************************
function TDBShemaTree.FGetLevelImageIndexMas(fieldName:String; Level:Integer):Integer;
var i:integer;
begin
  result:=-1;

  for i:=0 to Length(self.FLevelImageIndex)-1 do
  begin
    if ( self.FLevelImageIndex[i].Level = Level ) and
       ( CompareText( self.FLevelImageIndex[i].ColumnFieldName , fieldName) = 0 ) then
    begin
      result:=i;
      break;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.SaveDataFromInputForm( aView:TcxGridDBTableView; setPost:Boolean=true );
var i:integer;
    CurrFiled:String;
    CurrValue:Variant;
    SaveShowUpdateForm:Boolean;
begin
 if self.FInputVgrid = nil then exit;
 if not TestConnect then exit;

 try
   SaveShowUpdateForm := self.FShowUpdateForm;
   self.FShowUpdateForm := false;

   SaveVDataToDB( self.FInputVgrid, aView, self.GetArrStafFieldArr );

   if setPost then aView.DataController.DataSet.Post;
 finally
   self.FShowUpdateForm := SaveShowUpdateForm;
 end;
end;
//******************************************************************************
function TDBShemaTree.FGetFieldValueImageIndexMas( FieldName:String; Node:TcxTreeListNode ):Integer;
var i:integer;
begin
  result:=-1;
  
  for i:=0 to Length(self.FValueTreeImageIndex)-1 do
  begin
    if (self.FValueTreeImageIndex[i].Level = -1)and
       ( self.FValueTreeImageIndex[i].FieldValue = Node.Values[Ftree.GetColumnByFieldName(self.FValueTreeImageIndex[i].ColumnFieldNameForValue).ItemIndex] ) and
       ( CompareText( self.FValueTreeImageIndex[i].ColumnFieldName , fieldName ) = 0 ) then
    begin
      result:=i;
      break;
    end;

    if (self.FValueTreeImageIndex[i].Level = Node.Level ) and
       ( self.FValueTreeImageIndex[i].FieldValue = Node.Values[ Ftree.GetColumnByFieldName(self.FValueTreeImageIndex[i].ColumnFieldNameForValue).ItemIndex ] ) and
       ( CompareText( self.FValueTreeImageIndex[i].ColumnFieldName , fieldName ) = 0 ) then
    begin
      result:=i;
      break;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.FCustomDrawImageIndex( Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
var indImageLevel:Integer;
begin

   indImageLevel:=FGetLevelImageIndexMas( TcxDBTreeListColumn(AViewInfo.Column).DataBinding.FieldName, AViewInfo.Node.Level );
   if indImageLevel <> -1 then
   begin
     FShowTextImageInCell(Sender, ACanvas,  AViewInfo, self.FLevelImageIndex[indImageLevel].ImageList,
                          self.FLevelImageIndex[indImageLevel].ImageWidth, self.FLevelImageIndex[indImageLevel].ImageIndex,  self.FLevelImageIndex[indImageLevel].PosImg );
     ADone:=true;
   end
    else
     begin
       indImageLevel:=FGetFieldValueImageIndexMas( TcxDBTreeListColumn(AViewInfo.Column).DataBinding.FieldName,  AViewInfo.Node );
       if indImageLevel <> -1 then
       begin
         FShowTextImageInCell(Sender, ACanvas,  AViewInfo, self.FValueTreeImageIndex[indImageLevel].ImageList,
                              self.FValueTreeImageIndex[indImageLevel].ImageWidth, self.FValueTreeImageIndex[indImageLevel].ImageIndex, self.FValueTreeImageIndex[indImageLevel].PosImg );
         ADone:=true;
       end;
     end;
end;
//******************************************************************************
procedure TDBShemaTree.FTreeDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
  if @PersonalCustomDrawCell <> nil  then PersonalCustomDrawCell( Sender, ACanvas, AViewInfo, ADone );
  FCustomDrawImageIndex(Sender, ACanvas,  AViewInfo, ADone );
end;
//******************************************************************************
function TDBShemaTree.FGetMouseCursorForColumn(Column:TcxTreeListColumn):TCursor;
var i:Integer;
begin
  result:=-1;
  for i:=0 to Length(FColMouseCursor)-1 do
  begin
    if (FColMouseCursor[i].Column = Column) then
    begin
      result:=FColMouseCursor[i].Cursor;
      Break;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.AddCursorOnMouseMoveColumn(FieldName:string;cursor:TCursor);
var len:Integer;
begin
 if self.FTree <> nil then
 begin
   if self.FTree.GetColumnByFieldName(FieldName)<>nil then
   begin
     len:= Length(FColMouseCursor);
     SetLength(FColMouseCursor,len+1);
     FColMouseCursor[len].Column  :=self.FTree.GetColumnByFieldName(FieldName);
     FColMouseCursor[len].cursor := cursor;
   end;
 end
  else FSysError('Set Tree for Element '+self.Name);
end;
//******************************************************************************
procedure TDBShemaTree.TreeMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var Mouse:TPoint;
    CurrCursor:TCursor;
    HitNode:TcxTreeListNode;
begin
  if self.Tree=nil then exit;
  HitNode:=TcxDBTreeList(sender).GetNodeAt(X,Y);
  FCurrHitTest:=TcxTreeList(sender).HitTest;
  FCurrHitTestCol:= FCurrHitTest.HitColumn;

  //************************************************************
  if ( FCurrHitTest.HitAtNode )and( FCurrHitTest.HitAtColumn ) then
    begin
      CurrCursor:= FGetMouseCursorForColumn( FCurrHitTestCol );

      if CurrCursor<>-1 then
       Screen.Cursor:= CurrCursor                  
      else
      Screen.Cursor:= crDefault ;
    end;

  if @PersonalMouseMove<>nil then PersonalMouseMove( Sender, Shift, X, Y );
end;
//******************************************************************************
procedure TDBShemaTree.AddLevelImageIndexColumn(Level:Integer;FieldName:String;ImageList:TImageList;ImageWidth,ImageIndex:Integer;PosImg:TImageCellPosition=OptImgPosLeft);
var len:Integer;
begin
  len:=length( FLevelImageIndex );
  SetLength(FLevelImageIndex,len+1);

  FLevelImageIndex[len].Level:=Level;
  FLevelImageIndex[len].ColumnFieldName:=FieldName;
  FLevelImageIndex[len].ImageList:=ImageList;
  FLevelImageIndex[len].ImageWidth:=ImageWidth;
  FLevelImageIndex[len].ImageIndex:=ImageIndex;
  FLevelImageIndex[len].PosImg:=PosImg;
end;
//******************************************************************************
procedure TDBShemaTree.AddValueImageIndexColumn( FieldName,ColumnFieldNameForValue:String;Value:Variant; ImageList:TImageList;ImageWidth,ImageIndex:Integer;Level:Integer=-1; PosImg:TImageCellPosition=OptImgPosLeft );
var len:Integer;
begin
  len:=length( FValueTreeImageIndex );
  SetLength(FValueTreeImageIndex,len+1);

  FValueTreeImageIndex[len].ColumnFieldName:=FieldName;

  FValueTreeImageIndex[len].ColumnFieldNameForValue:=ColumnFieldNameForValue;
  FValueTreeImageIndex[len].FieldValue:=Value;
  FValueTreeImageIndex[len].ImageList:=ImageList;
  FValueTreeImageIndex[len].ImageWidth:=ImageWidth;
  FValueTreeImageIndex[len].ImageIndex:=ImageIndex;
  FValueTreeImageIndex[len].Level := Level;
  FValueTreeImageIndex[len].PosImg:=PosImg;
end;
//******************************************************************************
Procedure TDBShemaTree.FSearchTextOnTreeByColumns( AColName : TMasCxColTree; SearchText:Widestring;JustFromBeginStr:Boolean=false );
Function SearchTextByFocus(FromNode:TcxTreeListNode):boolean;
var i,j:integer;
    CurrValue:variant;
    CurrValueStr:widestring;
    aNode:TcxTreeListNode;
begin
  SearchText:=AnsiLowerCase(SearchText);
  result:=false;
  aNode:=FromNode ;

  while aNode<>nil do
  begin

    for j:=0 to Length(AColName)-1 do
    begin
      CurrValue:= aNode.Texts[ AColName[j].ItemIndex ];
     // CurrValue:=aNode.Values[ AColName[j].ItemIndex ];
      if CurrValue=null then CurrValueStr:=''
        else CurrValueStr:=CurrValue;

      CurrValueStr:=AnsiLowerCase(CurrValueStr);
      if (((not JustFromBeginStr)and(AnsiPos(SearchText,CurrValueStr)<>0))or
         ((JustFromBeginStr)and( CompareText(Copy(CurrValueStr, 1, Length(SearchText)), SearchText) = 0 )) )  and( aNode <> FromNode ) then
      begin
        aNode.Focused:=true;
        result:=true;
        break;
      end;

    end;

    if result then break;
    aNode:=aNode.GetNext;
  end;
end;
begin
  if not SearchTextByFocus( FTree.FocusedNode ) then    // cycle
    SearchTextByFocus(Ftree.TopNode);
end;
//******************************************************************************
function TDBShemaTree.FFormingMasColByFieldNames( FieldNames:array of String ):TMasCxColTree;
var i:integer;
    len:integer;
begin
  for i:=0 to Length(FieldNames) - 1 do
  begin
    if FTree.GetColumnByFieldName( FieldNames[i] )<>nil then
    begin
      len:=Length(result);
      SetLength(result,len+1);
      result[len] := FTree.GetColumnByFieldName( FieldNames[i] );
    end;
  end;
end;
//******************************************************************************
function TDBShemaTree.FFormingMasColsForAllColumns( IncludeNotVisible:Boolean ):TMasCxColTree;
var i:integer;
    len:integer;
begin
  for i:=0 to FTree.ColumnCount - 1 do
  begin
    if ((IncludeNotVisible) ) or
       (( not IncludeNotVisible )and(FTree.Columns[i].Visible)) then
    begin
      len:=Length(result);
      SetLength(result,len+1);
      result[len]:=FTree.Columns[i];
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.HideDataForFilterOnTree(aHide:Boolean=True);
begin
  if Self.Tree = nil then exit;
  try
    Self.Tree.BeginUpdate;
    SetFilterOnTreeForManyColumns( Self.Tree, [self.FFieldKod], [null], ['='], [], aHide  );
  finally
    Self.Tree.EndUpdate;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.ShowClearDetailData( aHide:Boolean ) ;
var i:Integer;
begin
   for i:=0 to self.DetailElem.Count - 1 do
   begin
     if ( TDBShema(self.DetailElem[i]) is TDBShemaTree ) and
        ( TDBShemaTree(self.DetailElem[i]).Tree<>nil ) then
       TDBShemaTree( self.DetailElem[i] ).HideDataForFilterOnTree( aHide );
   end;
end;
//******************************************************************************
Procedure TDBShemaTree.SetFilterOnTree( AFieldName:array of Widestring; FilterValue:array of variant;
                                        UMOVA:array of Widestring; JustLevels: array of Integer; SetFilter:Boolean=true );
begin
  SetFilterOnTreeForManyColumns( self.FTree, AFieldName, FilterValue, UMOVA,JustLevels, SetFilter );
end;
//******************************************************************************
Procedure TDBShemaTree.ClearFilterOnTree;
begin
  SetFilterOnTreeForManyColumns(self.FTree, [], [], [], [], False );
end;
//******************************************************************************
Procedure TDBShemaTree.SearchTextOnTreeByColumns( AColName : TMasCxColTree; SearchText:Widestring;JustFromBeginStr:Boolean=false );
begin
  FSearchTextOnTreeByColumns( AColName, SearchText, JustFromBeginStr );
end;
//******************************************************************************
Procedure TDBShemaTree.SearchTextOnTreeByAllColumns( SearchText:Widestring;JustFromBeginStr:Boolean=false;SearchInNotVisibleColumn:Boolean=false);
begin
  FSearchTextOnTreeByColumns( FFormingMasColsForAllColumns( SearchInNotVisibleColumn ), SearchText, JustFromBeginStr );
end;
//******************************************************************************
Procedure TDBShemaTree.SearchTextOnTreeByFieldNames(FieldNames:array of String; SearchText:Widestring;JustFromBeginStr:Boolean=false );
begin
  FSearchTextOnTreeByColumns( FFormingMasColByFieldNames( FieldNames ), SearchText, JustFromBeginStr );
end;
//******************************************************************************
procedure TDBShemaTree.RestorePositionDBFromIni;
var TopRowIndex:Integer;
    ValueStr:String;
begin
  inherited;
  if not FEnableSavePosition then exit;
  if self.FTree = nil  then exit;
  if not Db.Active then exit;

  ValueStr:=ReadIniFile( FIniDBSavePosition, 'PositionTree', self.Name );
  if (ValueStr<>'') and (IsStrANumber( ValueStr , true )) then
  begin
    if ( self.FTree.TopVisibleNode <> nil ) and (self.FTree.AbsoluteVisibleCount >  StrToInt(ValueStr) ) then
      self.FTree.TopVisibleNode := self.FTree.AbsoluteVisibleItems[ StrToInt(ValueStr) ];
  end;
end;
//******************************************************************************
procedure TDBShemaTree.SaveDBPosition;
begin
  inherited;
  if not DB.Active then exit;
  
  if ( FEnableSavePosition )and( self.FTree <> nil )and( self.FTree.Owner <> nil )and
     ( self.FTree.DataController<>nil) and (self.FTree.TopVisibleNode<>nil) then
    CreateIniFile( FIniDBSavePosition,'PositionTree', self.Name, IntToStr( self.FTree.TopVisibleNode.VisibleIndex ) );
end;
//******************************************************************************
procedure TDBShemaTree.FTreeExit(Sender: TObject);
begin
  if FTree=nil then exit;
  if FTree.FocusedNode=nil then exit;

  FTree.FocusedNode.MakeVisible;
  if @self.PersonalExitFromTree <> nil then PersonalExitFromTree( Sender );
end;
//******************************************************************************
procedure TDBShemaTree.FAddNode( OptAdd : TOptAddTreeNode; aParentIdDef:Variant );
var FOrderNumberForInsert : Integer;
    ParentId:Variant;
    IndColFieldId:Integer;
    SaveNode:TcxTreeListNode;
    SaveShowUpdateForm:Boolean;
    aTree:TcxDBTreeList;
begin
  aTree := self.Tree;
  if aTree = nil then exit;

  IndColFieldId := aTree.GetColumnByFieldName( aTree.DataController.KeyField).ItemIndex;
  if ( aTree.FocusedNode<>nil)and( aTree.FocusedNode.Parent <> nil) then
  begin
    if OptAdd in [OptTreeNodeAddInsert, OptTreeNodeAddLast] then ParentId := aTree.FocusedNode.Parent.Values[IndColFieldId];
    if OptAdd = OptTreeNodeAddSub then ParentId := aTree.FocusedNode.Values[IndColFieldId];
    if OptAdd = OptTreeNodeAddNone then ParentId := aParentIdDef;
  end
  else ParentId :=null;

  try
    SaveShowUpdateForm:= Self.FShowUpdateForm;

    aTree.BeginUpdate;
    Self.FShowUpdateForm := False;

    if OptAdd in [ OptTreeNodeAddSub, OptTreeNodeAddLast ] then
      FOrderNumberForInsert:= FGetNextOrderForNode( aTree.FocusedNode )
    else FOrderNumberForInsert := FSetFreeSpaceForInsertNode( aTree.FocusedNode );

   { FieldValueParent.FieldName := self.FTree.DataController.ParentField;
    FieldValueParent.Value := ParentId;

    FSetStafFieldValue( FieldValueParent );  }
    self.SaveBookmark;
    
    self.DB.Insert;
    if self.DB.FieldByName( aTree.DataController.ParentField ).Value = null then
      self.DB.FieldByName( aTree.DataController.ParentField ).Value := ParentId;

    if ( FOrderNumberForInsert <> -1 )and( self.FFieldNumber<>'' ) then
    begin
      try
        self.DB.FieldByName( self.FFieldNumber ).AsInteger := FOrderNumberForInsert;
        self.DB.Post;
        FReorderNodeLevel( aTree.FocusedNode.Parent );

      finally
        self.DB.Edit;
      end;
    end;

   if SaveShowUpdateForm then
    if not ShowUpdateForm then
    begin
      if self.DB.State <> dsBrowse then self.DB.Cancel;
      self.GotoBookmark;
    end;

  finally
    aTree.EndUpdate;
    Self.FShowUpdateForm := SaveShowUpdateForm;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.InsertNode;
begin
  FAddNode( OptTreeNodeAddInsert, null );
end;
//******************************************************************************
procedure TDBShemaTree.AppendNode;
begin
  FAddNode( OptTreeNodeAddLast, null );
end;
//******************************************************************************
procedure TDBShemaTree.AddSubNode;
begin
  FAddNode( OptTreeNodeAddSub, null );
end;
//******************************************************************************
procedure TDBShemaTree.AddNodeForParentId( ParentId:Variant );
begin
  FAddNode( OptTreeNodeAddNone, ParentId );
end;
//******************************************************************************
procedure TDBShemaTree.AfterInsert(DataSet: TDataSet);
var OrderIndex:Integer;
begin
  //if self.IsLock then Exit;
  //**********************

  inherited;
 { if self.FTree<> nil then
  begin
    if (FOrderNumberForInsert<>-1)and(self.FFieldNumber<>'') then
      DataSet.FieldByName( self.FFieldNumber ).AsInteger := FOrderNumberForInsert;
  end; }

  if FShowUpdateForm then
  if not ShowUpdateForm then
     if self.DB.State <> dsBrowse then self.DB.Cancel;
end;
//******************************************************************************
procedure TDBShemaTree.BeforeInsert(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
 { if self.FTree<> nil then
    FOrderNumberForInsert := FSetFreeSpaceForInsertNode( self.FTree.FocusedNode );}
end;
//******************************************************************************
procedure TDBShemaView.BeforeClose(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
procedure TDBShemaTree.BeforeDelete(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
procedure TDBShemaTree.AfterDelete(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
Function TDBShemaTree.FUpdateForm( aView:TcxGridDBTableView; setPost:Boolean=true):boolean;
var AcaptionOnPrepareForm:Widestring;
begin
 if not TestConnect then exit;

  result := ShowUpdateFormForElem( Self, aView, setPost );
end;
//******************************************************************************
Function TDBShemaTree.ShowUpdateForm( setPost:Boolean=true ):boolean;
begin
  if self.FViewForClone <> nil then
    Result := FUpdateForm( self.FViewForClone, setPost);
end;
//******************************************************************************
procedure TDBShemaTree.AfterEdit(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
  if (FShowUpdateForm)and( FrmInputData = nil) then
  begin
    try
      if self.FTree <> nil then self.FTree.BeginUpdate;
      if not ShowUpdateForm then self.DB.Cancel;
    finally
      if self.FTree <> nil then self.FTree.EndUpdate;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaTree.AfterPost(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
procedure TDBShemaTree.BeforeClose(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
procedure TDBShemaTree.BeforeEdit(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
procedure TDBShemaTree.BeforePost(DataSet: TDataSet);
begin
  //if self.IsLock then Exit;
  //**********************
  inherited;
end;
//******************************************************************************
{ TDBShemaSynchize }
constructor TDBShemaSynchronize.Create(aDB: TDataset; ATree:TcxDBTreeList; aTableName, aFieldKod:WideString; aGenIdName:String='';  aFieldNumber: String='');
var DBParam:TConnectDBParam;
begin
  TDBShemaTree(self).Create( ADB,ATree, aTableName, aFieldKod, aGenIdName, aFieldNumber );
  DBParam:= FGetDBParam;
  FElemFunctCallSoapWeb:= TFunctCallSoapWeb.Create( Self, DBParam ) ;
  FFieldShowImageIndex:='';
end;
//******************************************************************************
function TDBShemaSynchronize.FIsSetTableFieldName(aTableName:String):integer;
var i:integer;
begin
  Result:=-1;
  for i:=0 to Length(self.FTableFieldsName)-1 do
  begin
    if CompareText( self.FTableFieldsName[i].TableName, aTableName ) = 0 then
    begin
      result:=i;
      exit;
    end;
  end;
end;
//******************************************************************************
procedure TDBShemaSynchronize.FAddTableAndFieldName(aElem:TObject; aTableName, aFieldId,aFieldName: WideString);
var i:Integer;
    Len:Integer;
    curInd:Integer;
begin
  curInd:= Self.FIsSetTableFieldName(aTableName);
  if curInd=-1 then
  begin
    Len:= length( FTableFieldsName );
    SetLength( FTableFieldsName, Len+1 );
    SetLength( FTableFieldsName, Len+1 );

    FTableFieldsName[Len].TableName := aTableName;
    FTableFieldsName[Len].FieldId   := aFieldId;
    FTableFieldsName[Len].FieldName := aFieldName;
    FTableFieldsName[Len].ElemObj   := aElem;
  end
  else
  begin
    FTableFieldsName[curInd].FieldId   := aFieldId;
    FTableFieldsName[curInd].FieldName := aFieldName;
    FTableFieldsName[curInd].ElemObj   := aElem;
  end;
end;
//******************************************************************************
function TDBShemaSynchronize.FindElemByTableName(aTableName:Widestring):TDBShema;
var i:integer;
begin
  result:=nil; 
  for i:=0 to Length(self.FTableFieldsName)-1 do
  begin
    if CompareText( self.FTableFieldsName[i].TableName , aTableName)=0 then
    begin
      result:=TDBShema(self.FTableFieldsName[i].ElemObj);
      break;
    end;
  end;
end;
//******************************************************************************
function TDBShemaSynchronize.FAddMergeDataToLog( aParentTable, aParentIdOperation, aTableName, aFieldNameId, IdOperationStr,UserIdStr:string; Reason:Integer ):Integer;
var SQL:String;
begin
  if IdOperationStr <> '' then
  begin
    SQL :='EXECUTE PROCEDURE SET_UPDATE_MERGE_WEB('+''''+aParentTable+''''+','+aParentIdOperation+','+''''+aTableName+''''+','+''''+aFieldNameId+''''+','+IdOperationStr+','+UserIdStr+','+''''+ConvertDateTime(Now)+''''+','+IntToStr(Reason)+')';

    if Self.DBGetParamConnect.IBDatabaseConnection<> nil then
      result := UnitIBQuery.UpdateSql( Self.DBGetParamConnect.PathDB, Self.DBGetParamConnect.UID, Self.DBGetParamConnect.Password, SQL );

    if Self.DBGetParamConnect.IBDatabaseConnection<> nil then
      result := UnitADOQuery.UpdateSql( Self.DBGetParamConnect.ADOConnection, SQL );
  end
   else result := 0;
end;
//******************************************************************************
procedure TDBShemaSynchronize.ShowMergeLog(isAdmin, WriteLog,
  ShowMessageError, ShowWhenNotEmpty: Boolean);
begin
  Self.FElemFunctCallSoapWeb.ShowFindMergeSoap1CLog( self.FUserElem.GetValueId, isAdmin, WriteLog, ShowMessageError, ShowWhenNotEmpty );
end;
//******************************************************************************
destructor TDBShemaSynchronize.Close;
begin
  FElemFunctCallSoapWeb.Free;
  inherited; 
end;
//******************************************************************************
procedure TDBShemaSynchronize.FTreeDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
const SpaceIcon = 4;

var IndColTableName:Integer;
    ValueTableName:Variant;
    SynchrElemObj:TDBShema;
    TextRect:TRect;
begin
  inherited;
  
  if (FFieldShowImageIndex<>'') and
     (AViewInfo.Column = TcxDBTreeList(Sender).GetColumnByFieldName(FFieldShowImageIndex) ) then
  begin
    IndColTableName:=TcxDBTreeList(Sender).GetColumnByFieldName('TABLENAME').ItemIndex;
    ValueTableName := AViewInfo.Node.Values[ IndColTableName ];

    if ( AViewInfo.Node<>nil )and(ValueTableName<>null) then
    begin
      SynchrElemObj:=FindElemByTableName(ValueTableName);


      TextRect:= AViewInfo.BoundsRect;
      TextRect.Left:=TextRect.Left+16+SpaceIcon+1;

      FTreeDrawFillRect(Sender, AViewInfo, ACanvas );
      if (SynchrElemObj <> nil)and(SynchrElemObj.FMainImageList<>nil)and(SynchrElemObj.FMainImageIndex<>-1) then
        ACanvas.DrawImage(SynchrElemObj.FMainImageList, AViewInfo.BoundsRect.Left + SpaceIcon  , AViewInfo.BoundsRect.Top , SynchrElemObj.FMainImageIndex, true);

      ACanvas.DrawTexT( ValueTableName , TextRect, 0, true );
      Adone:=true;

    end;
  end;

  if @PersonalCustomDrawCell <> nil  then PersonalCustomDrawCell(Sender,ACanvas,AViewInfo,ADone);
end;
//******************************************************************************
function TDBShemaTree.GetArrStafFieldArr: TVarArr;
begin
  Result := inherited GetArrStafFieldArr;
  SetLength(Result,4);
  Result[3] := self.FFieldParent;
end;

procedure TDBShemaTree.AddDrawCellTree( PersEvent: TcxTreeListCustomDrawEditCellEvent );
begin
  self.PersonalCustomDrawCell := PersEvent;
end;

{function TDBShemaTree.GetDrawCellTree : TcxTreeListCustomDrawEditCellEvent;
begin
  result := self.PersonalCustomDrawCell;
end; }

{ TTimerPingServer }
constructor TTimerPingServer.Create;
begin
  FServerNameIP := '';
  FTmerPingServer := TTimer.Create( nil );
  FTmerPingServer.OnTimer := FTimerPingServerTimer;
end;
//******************************************************************************
destructor TTimerPingServer.Close;
begin
  FTmerPingServer.Free;
end;
//******************************************************************************
procedure TTimerPingServer.FLockForms( Lock: Boolean );
var i:integer;
begin
  for i:=0 to Application.ComponentCount-1 do
  begin
    if ( Application.Components[i] is TForm ) and(not (Application.Components[i] is TFormProgres) ) then
      TForm(Application.Components[i]).Enabled := not Lock;
  end;
end;
//******************************************************************************
procedure TTimerPingServer.FTimerPingServerTimer(Sender: TObject);
begin
  if FServerNameIP = '' then exit;
  try
    self.FTmerPingServer.Enabled := false;

    Application.ProcessMessages;
    if not Ping( FServerNameIP, 10000 ) then
    begin
      FLockForms( True );
      if progressPingServer.FormProgres = nil then
        progressPingServer := ShowProgress( ErrorLostConnectToServer,-1 );//ShowLockForm(ErrorLostConnectToServer); //ShowProgress( ErrorLostConnectToServer, -1 );          // ShowLockForm( ErrorLostConnectToServer ); //
    end
     else
      begin
        if progressPingServer.FormProgres <> nil then
        begin
          Sleep(3000);
          FLockForms( False );

          if progressPingServer.FormProgres<> nil then
          begin
            ClosedProgress( progressPingServer.FormProgres );
            progressPingServer.FormProgres := nil;
          end;
        end;
      end;

  finally
    self.FTmerPingServer.Enabled:=True;
  end;
end;
//******************************************************************************
procedure TTimerPingServer.SetServerForPing( aServerNameIP:String; Interval:Integer; Active:Boolean );
begin
  self.FTmerPingServer.Interval := Interval;
  self.FServerNameIP := aServerNameIP;
  self.FTmerPingServer.Enabled := Active;
end;
//******************************************************************************
procedure TTimerPingServer.SetIBServerForPing( aDB: TIBDatabase; Interval:Integer; Active:Boolean  );
var ServerName:String;
begin
  ServerName:= aDB.DatabaseName;
  ServerName := Copy(ServerName,1,AnsiPos(':',ServerName)-1);

  SetServerForPing( ServerName, Interval  , Active );
end;
//******************************************************************************
procedure TTimerPingServer.SetIBServerForPing( aDB: TADOConnection; Interval:Integer; Active:Boolean  );
var ServerName:String;
begin
  ServerName:= aDB.DefaultDatabase;
  ServerName := Copy(ServerName,1,AnsiPos(':',ServerName)-1);

  SetServerForPing( ServerName, Interval  , Active );
end;
//******************************************************************************
function TTimerPingServer.GetTimerEnabled: Boolean;
begin
  result := self.FTmerPingServer.Enabled;
end;
//******************************************************************************
procedure TTimerPingServer.SetTimerEnabled(const Value: Boolean);
begin
  self.FTmerPingServer.Enabled := Value;
end;
//******************************************************************************
{ TStatusBarInfo }
constructor TStatusBarInfo.Create( StBar: TStatusBar );
begin
  FStBar := StBar;
end;
//******************************************************************************
destructor TStatusBarInfo.Close;
begin

end;
//******************************************************************************
procedure TStatusBarInfo.ShowInfo(StatusPanelItemIndex: Integer;
  InfoText: Widestring);
begin
  FStBar.Panels[StatusPanelItemIndex].Text := InfoText;
end;
//******************************************************************************
{ TDBShemaBandedView }

constructor TDBShemaBandedView.Create(aDB: TDataset;
  aView: TcxGRidDBBandedTableView; aTableName, aFieldKod: WideString;
  aGenIdName, aFieldNumber: String);
begin
  TDBShemaView(self).Create( aDB, TcxGRidDBTableView(aView), aTableName, aFieldKod,aGenIdName, aFieldNumber );
end;
//******************************************************************************
function TDBShemaBandedView.GetView : TcxGRidDBBandedTableView;
begin
  result := TcxGRidDBBandedTableView(TDBShemaView(self).View);
end;
//******************************************************************************
procedure TDBShemaBandedView.SetView( Aview: TcxGRidDBBandedTableView );
begin
  self.FView := TcxGRidDBTableView( Aview );


end;
//******************************************************************************
initialization
  ActiveFormBeforeEditData := nil;
  DecimalSeparator :='.';
  InitTimerPingServer;
  AllElemnts := TList.Create;
  IconApplication := GetIconFomApplication(false);

finalization
 DeactiveTimerPingServer;
 AllElemnts.Free;
 IconApplication.Free;
 if IBDatabaseList<> nil then IBDatabaseList.Free;

end.

 //aDelNode.Free;
 {result:=false;
 aNode := FFindLastElemForNode( aDelNode );
 AskBeforeDelete := False;
 IsDelNode:=False;
 //*************************************************
  while (aNode<>nil) do
  begin
    aPrevNode:= aNode.GetPrev;
    if aNode = aDelNode then IsDelNode:=True;
    self.SetFocusedTree( aNode );

    if FLocateDBByID( FTreeGetValueIdNode(aNode) ) then
    begin
      FDB.Delete;
    end;
    if not IsDelNode then
      aNode:=aPrevNode
    else aNode := nil;
  end;
  Requery;
  FTree.FullRefresh;
  result:=true;}



    //StoredProc.ParamByName(self.FLogFieldNames.FieldDATA).SetBlobData( @StrFieldData, sizeof(StrFieldData) );
   {  Stm := TMemoryStream.Create( );
    try

      Stm.Write(StrFieldData,SizeOf(StrFieldData)) ;
      StoredProc.ParamByName(self.FLogFieldNames.FieldDATA).LoadFromStream( Stm, ftBlob);;
    finally
      FreeAndNil(Stm);
    end;  }


     {SQL:='INSERT INTO '+self.FLogTableName+'('+
 self.FLogFieldNames.FieldID+','+
 self.FLogFieldNames.FieldApplicationName+','+
 self.FLogFieldNames.FieldTableName+','+
 self.FLogFieldNames.FieldTitleElem+','+
 self.FLogFieldNames.FieldIDObject+','+
 self.FLogFieldNames.FieldIDUser+','+
 self.FLogFieldNames.FieldAction +','+
 self.FLogFieldNames.FieldDATA+','+
 self.FLogFieldNames.FieldFormName+','+
 self.FLogFieldNames.FieldFormCaption+
 ') VALUES ('+
 IntToStr( IdLog )+','+
 ''''+ExtractFileName( Application.ExeName )+''''+','+
 ''''+self.TableName+''''+','+
 ''''+self.FTitle+''''+','+
 self.GetValueIdStr+','+
 IntToStr( UserId )+','+
 IntToStr( FGetIndexAction(Action))+','+
 ''''+ConvertDateTime(Now)+''''+ ','+
 ''''+ActiveFormName+''''+','+
 ''''+ActiveFormCaption+''''+
 ')' ;  }

 //UpdateSql( DBParam.PathDB, DBParam.UID, DBParam.Password, SQL );


