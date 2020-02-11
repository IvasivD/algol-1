unit UnitGenerateElementsCore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxCheckBox, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  dxmdaset, cxGrid, ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  StdCtrls, DBTables, IBCustomDataSet, IBQuery,ADODB, IBTable,
  cxPCdxBarPopupMenu, cxPC, cxMemo, cxTextEdit, cxBlobEdit,FrmProgress,Core,UnitProc,
  ComCtrls,UnitADOQuery, UnitIBQuery, MemTableEh;

type
  TRecMyElem = record
   FormName:String;
   DatasetName:String;
   TableName:String;
   KeyField:String;
   ViewName:string;
  end;

  TFrmFindAllElements = class(TForm)
    Panel1: TPanel;
    cxGridViewRepository1: TcxGridViewRepository;
    MemData: TdxMemData;
    MemDataDatasetName: TStringField;
    MemDataFormName: TStringField;
    MemDataTableName: TStringField;
    MemDataKeyFieldName: TStringField;
    MemDataCheckElem: TBooleanField;
    ViewElements: TcxGridDBTableView;
    DSMemData: TDataSource;
    ViewElementsRecId: TcxGridDBColumn;
    ViewElementsDatasetName: TcxGridDBColumn;
    ViewElementsFormName: TcxGridDBColumn;
    ViewElementsTableName: TcxGridDBColumn;
    ViewElementsKeyFieldName: TcxGridDBColumn;
    ViewElementsCheckElem: TcxGridDBColumn;
    ViewElementsN: TcxGridDBColumn;
    Button1: TButton;
    ADOConnection1: TADOConnection;
    GetKeyFieldName: TADODataSet;
    MemDataViewName: TStringField;
    ViewElementsViewName: TcxGridDBColumn;
    Button2: TButton;
    ADOTest: TADODataSet;
    MemDataGenIdName: TStringField;
    ViewElementsGenIdName: TcxGridDBColumn;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    ADOGetTrigers: TADODataSet;
    ADOGetTrigersRDBTRIGGER_NAME: TStringField;
    ADOGetTrigersRDBRELATION_NAME: TStringField;
    ADOGetTrigersRDBTRIGGER_SOURCE: TMemoField;
    Panel2: TPanel;
    Button3: TButton;
    ViewTrigers: TcxGridDBTableView;
    DS_Trigers: TDataSource;
    ViewTrigersRDBTRIGGER_NAME: TcxGridDBColumn;
    ViewTrigersRDBRELATION_NAME: TcxGridDBColumn;
    ViewTrigersRDBTRIGGER_SOURCE: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    ADOGetTrigersCalTrigerSource: TStringField;
    Button4: TButton;
    cxTabSheet3: TcxTabSheet;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    ViewProcedures: TcxGridDBTableView;
    ADOProcedures: TADODataSet;
    DS_Procedures: TDataSource;
    ADOProceduresRDBPROCEDURE_NAME: TStringField;
    ADOProceduresRDBPROCEDURE_ID: TSmallintField;
    ADOProceduresRDBPROCEDURE_INPUTS: TSmallintField;
    ADOProceduresRDBPROCEDURE_OUTPUTS: TSmallintField;
    ADOProceduresRDBDESCRIPTION: TMemoField;
    ADOProceduresRDBPROCEDURE_SOURCE: TMemoField;
    ADOProceduresRDBPROCEDURE_BLR: TBlobField;
    ADOProceduresRDBSECURITY_CLASS: TStringField;
    ADOProceduresRDBOWNER_NAME: TStringField;
    ADOProceduresRDBRUNTIME: TBlobField;
    ADOProceduresRDBSYSTEM_FLAG: TSmallintField;
    MemDataProc: TdxMemData;
    DS_MemDataProc: TDataSource;
    MemDataProcPROC_NAME: TStringField;
    ViewProceduresRecId: TcxGridDBColumn;
    ViewProceduresPROC_NAME: TcxGridDBColumn;
    ViewProceduresPROC_CODE: TcxGridDBColumn;
    MemDataProcUSE_IN: TStringField;
    ViewProceduresUSE_IN: TcxGridDBColumn;
    Panel3: TPanel;
    Button5: TButton;
    ViewProceduresUSE_IN_Project: TcxGridDBColumn;
    MemDataProcUSE_IN_Project: TStringField;
    EditPath: TEdit;
    Button6: TButton;
    Button7: TButton;
    ADOGetAllTrigers: TADODataSet;
    ADOGetAllTrigersRDBTRIGGER_NAME: TStringField;
    ADOGetAllTrigersRDBRELATION_NAME: TStringField;
    ADOGetAllTrigersRDBTRIGGER_SEQUENCE: TSmallintField;
    ADOGetAllTrigersRDBTRIGGER_TYPE: TSmallintField;
    ADOGetAllTrigersRDBTRIGGER_SOURCE: TMemoField;
    ADOGetAllTrigersRDBTRIGGER_BLR: TBlobField;
    ADOGetAllTrigersRDBDESCRIPTION: TMemoField;
    ADOGetAllTrigersRDBTRIGGER_INACTIVE: TSmallintField;
    ADOGetAllTrigersRDBSYSTEM_FLAG: TSmallintField;
    ADOGetAllTrigersRDBFLAGS: TSmallintField;
    Button8: TButton;
    MemDataProcUSE_IN_Trigers: TStringField;
    ViewProceduresUSE_IN_Trigers: TcxGridDBColumn;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    ADOGetTrigersProblem: TADODataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    MemoField1: TMemoField;
    DS_ADOGetTrigersProblem: TDataSource;
    ADOGetTrigersProblemRDBTRIGGER_SEQUENCE: TSmallintField;
    ADOGetTrigersProblemRDBTRIGGER_BLR: TBlobField;
    ADOGetTrigersProblemRDBDESCRIPTION: TMemoField;
    ADOGetTrigersProblemRDBTRIGGER_INACTIVE: TSmallintField;
    ADOGetTrigersProblemRDBSYSTEM_FLAG: TSmallintField;
    ADOGetTrigersProblemRDBFLAGS: TSmallintField;
    ADOView: TADODataSet;
    ADOViewDS: TDataSource;
    ADOViewDESCRIPT: TMemoField;
    ADOViewVIEW_SOURCE: TMemoField;
    ADOViewTABLE_NAME: TStringField;
    ADOViewFIELD_ID: TSmallintField;
    ADOViewOWNER_NAME: TStringField;
    ADOViewRDBSYSTEM_FLAG: TSmallintField;
    MemDataProcUSE_IN_View: TStringField;
    Button13: TButton;
    ViewProceduresUSE_IN_View: TcxGridDBColumn;
    Button14: TButton;
    MemDataProcPROC_CODE: TStringField;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    ADOTable: TADODataSet;
    MemoField2: TMemoField;
    MemoField3: TMemoField;
    StringField3: TStringField;
    SmallintField1: TSmallintField;
    StringField4: TStringField;
    SmallintField2: TSmallintField;
    ADOTableSrc: TDataSource;
    ViewProceduresColumn1: TcxGridDBColumn;
    MemDataProcUse_In_Table: TBooleanField;
    Button19: TButton;
    ADOGetTrigersProblemRDBTRIGGER_TYPE: TLargeintField;
    ADOGetTrigersProblemRDBVALID_BLR: TSmallintField;
    ADOGetTrigersProblemRDBDEBUG_INFO: TBlobField;
    ADOGetTrigersProblemRDBENGINE_NAME: TWideStringField;
    ADOGetTrigersProblemRDBENTRYPOINT: TStringField;
    Button20: TButton;

    procedure ViewElementsNGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ADOGetTrigersCalcFields(DataSet: TDataSet);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
  private
    FPrefixSave:String;
    function FFindViewNameByDataset(Dataset:TDataset):Widestring;

    function FGetRecElemForComTIBTable(aTable:TIBTable):TRecMyElem;
    function FGetRecElemForComTTable(aTable:TTable):TRecMyElem;
    function FGetRecElemForComTQuery(aTable:TQuery):TRecMyElem;
    function FGetRecElemForComTIBQuery(aTable:TIBQuery):TRecMyElem;
    function FGetRecElemForComTADOQuery(aTable:TADOQuery):TRecMyElem;

    function FParseTableNameFromSql(Sql:String):String;
    function FGetKeyFieldNameByTableName(TableName:String):string;

    procedure FAddToTableElem(recElem:TRecMyElem);
    procedure FAddToTable( recElem:TRecMyElem;CheckElem:Boolean );
    procedure FCheckOnDatasetAndAddToGrid(aCom:TComponent);
    procedure FindAllElements;
    procedure FindDatasetInModule(ModuleCom:TComponent);
    Function  FindGenIdName( TableName:Widestring; DBParam:TConnectDBParam  ):Widestring;

    function FindUseProcNameInView(ProcName:String):string;
    function FindUseProcNameInTrigers(ProcName:String):string;
    function FindUseProcName(ProcName:String):string;
    function FindUseProcNameInTable(AtableName:String):string;

    procedure FillMemDataProc;
    procedure FillMemDataView;
    procedure FillMemDataTable;
    function  FindUseProcNameInFiles(ProcName:String;ProgressBar:TProgressBar ):string;
    function  FindUseProcNameInDirFiles(Path:string;ProcName:String):string;
    procedure ExtractScriptsFromForm(aCom:TComponent);
    Function  FindInKeyWordInSource( DB:TDataset; FiedlName,FieldSource:String; KeyWords:array of wideString ):TStringList;
    Function  FindInTrigerKeyWord(KeyWords:array of wideString):TStringList;
    Function  FindInProcedureKeyWord( KeyWords:array of wideString ):TStringList;
    Function  FindInViewKeyWord( KeyWords:array of wideString ):TStringList;
    procedure FPrepraeSource(var Source:Widestring);
    { Private declarations }
  public
    procedure AllTest;
    procedure GenerateAllElements(SaveToFile:String);
    procedure FixTrigers( SaveList:TStringList);
    procedure FixGenerateValue( ConnectToDB, Login, Password :String );
    { Public declarations }
  end;

 Procedure ShowFindAllDataset;
 procedure FindDifFieldType( FormName:String; aDbServer,aDbClient:TDataset; var DifField:TStringList);
 procedure FindDatasetProblemField( ConnectToDB, Login,Password:string );
 procedure FindDatasetNotInElem;


var
  FrmFindAllElements: TFrmFindAllElements;

implementation

{$R *.dfm}

Procedure ShowFindAllDataset;
begin
  try
    Application.CreateForm(TFrmFindAllElements, FrmFindAllElements);
    //FrmFindAllElements.FindAllElements;
    FrmFindAllElements.ShowModal;
  finally
    FrmFindAllElements.Free;
  end;
end;

procedure TFrmFindAllElements.ViewElementsNGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin

 AText:= IntToStr(  ARecord.Index+1 );
end;

function TFrmFindAllElements.FGetKeyFieldNameByTableName(TableName:String):string;
begin
  result:='';
  if TableName='' then  exit;
  try
   //GetKeyFieldName.Parameters.ParamByName('TABLENAME').Value:=UPPERCase(Trim( TableName) );


  GetKeyFieldName.CommandText:='  select s.RDB$FIELD_NAME '+
  '  from rdb$indices i '+
  '  left join rdb$index_segments s on i.rdb$index_name = s.rdb$index_name '+
  '  left join rdb$relation_constraints r on r.rdb$index_name = s.rdb$index_name '+
  ' where ( i.RDB$RELATION_NAME = '''+UPPERCase(Trim( TableName) )+'''  ) and (rdb$unique_flag = 1) '+
  '   and RDB$constraint_type = ''PRIMARY KEY'' ';


   GetKeyFieldName.Open;
   result:=Trim( GetKeyFieldName.Fields[0].AsString );
  finally
   GetKeyFieldName.Close;
  end;
end;

procedure TFrmFindAllElements.FAddToTable( recElem:TRecMyElem;CheckElem:Boolean );
begin
 MemData.Append;
 MemData.FieldByName('FormName').AsString:=recElem.FormName ;
 MemData.FieldByName('DatasetName').AsString:= recElem.DatasetName;
 MemData.FieldByName('TableName').AsString  := recElem.TableName;
 MemData.FieldByName('KeyFieldName').AsString:= recElem.KeyField;
 MemData.FieldByName('ViewName').AsString   := recElem.ViewName;

 MemData.FieldByName('CheckElem').AsBoolean := CheckElem;
 MemData.Post;
end;

procedure TFrmFindAllElements.FAddToTableElem(recElem:TRecMyElem);
begin
 FAddToTable( recElem, recElem.KeyField<>'' );
end;


function TFrmFindAllElements.FParseTableNameFromSql(Sql:String):String;
var i:Integer;
    IndFrom:Integer;
    findPr:Boolean;

begin
  Sql:=LowerCase(Sql);
  IndFrom := AnsiPos('from ',LowerCase(Sql));
  result:='';
  findPr:=false;
  for i:=IndFrom+4 to Length(Sql) do
  begin

    if findPr then result:=result+Sql[i];
    if Sql[i] in [' ',#13] then
    begin
       if not findPr then findPr:=True
       else Break;
    end;
  end;
  result:=UpperCase ( Trim(result));
end;

function TFrmFindAllElements.FFindViewNameByDataset(Dataset:TDataset):Widestring;
var i:Integer;
begin
 result:='';
 for i:=0 to Dataset.Owner.ComponentCount-1 do
 begin
   if Dataset.Owner.Components[i] is TcxGridDBTableView then
   begin
     if TcxGridDBTableView(Dataset.Owner.Components[i]).DataController.DataSet = Dataset then
     begin
        result:= Dataset.Owner.Components[i].Name;
        Break;
     end;
   end;
 end;
end;

function TFrmFindAllElements.FGetRecElemForComTTable(aTable:TTable):TRecMyElem;
begin
 Result.FormName := aTable.Owner.Name;
 Result.DatasetName := UpperCase( aTable.Name );
 Result.TableName   := aTable.TableName;
 Result.KeyField    := FGetKeyFieldNameByTableName( aTable.TableName);
 Result.ViewName    := FFindViewNameByDataset(aTable);
end;

function TFrmFindAllElements.FGetRecElemForComTIBTable(aTable:TIBTable):TRecMyElem;
begin
 Result.FormName := aTable.Owner.Name;
 Result.DatasetName := UpperCase( aTable.Name );
 Result.TableName   := aTable.TableName;
 Result.KeyField    := FGetKeyFieldNameByTableName( aTable.TableName);
 Result.ViewName    := FFindViewNameByDataset(aTable);
end;

function TFrmFindAllElements.FGetRecElemForComTQuery(aTable:TQuery):TRecMyElem;
begin
 Result.FormName := aTable.Owner.Name;
 Result.DatasetName := aTable.Name;
 Result.TableName   := FParseTableNameFromSql( aTable.SQL.Text );
 Result.KeyField    := FGetKeyFieldNameByTableName( Result.TableName );
 Result.ViewName    := FFindViewNameByDataset(aTable);
end;

function TFrmFindAllElements.FGetRecElemForComTIBQuery(aTable:TIBQuery):TRecMyElem;
begin
 Result.FormName := aTable.Owner.Name;
 Result.DatasetName := aTable.Name;
 Result.TableName   := FParseTableNameFromSql( aTable.SQL.Text );
 Result.KeyField      := FGetKeyFieldNameByTableName( Result.TableName );
 Result.ViewName    := FFindViewNameByDataset(aTable);
end;

function TFrmFindAllElements.FGetRecElemForComTADOQuery(aTable:TADOQuery):TRecMyElem;
begin
 //if aTable.name = 'TillDateQry' then ShowMessage('dd');

 Result.FormName := aTable.Owner.Name;
 Result.DatasetName := aTable.Name;
 Result.TableName   := FParseTableNameFromSql( aTable.SQL.Text );
 Result.KeyField      := FGetKeyFieldNameByTableName( Result.TableName );
 Result.ViewName    := FFindViewNameByDataset(aTable);
end;

procedure TFrmFindAllElements.FCheckOnDatasetAndAddToGrid(aCom:TComponent);
begin
  if aCom is TTable then FAddToTableElem( FGetRecElemForComTTable(TTable(aCom)) );
  if aCom is TIBTable then FAddToTableElem( FGetRecElemForComTIBTable(TIBTable(aCom)) );
  
  if aCom is TQuery then FAddToTableElem( FGetRecElemForComTQuery(TQuery(aCom)) );
  if aCom is TIBQuery then FAddToTableElem( FGetRecElemForComTIBQuery(TIBQuery(aCom)) );
  if aCom is TADOQuery then FAddToTableElem( FGetRecElemForComTADOQuery( TADOQuery(aCom) ) );
end;

procedure TFrmFindAllElements.FindDatasetInModule(ModuleCom:TComponent);
var i:Integer;
begin
 for i:=0 to ModuleCom.ComponentCount -1 do
   FCheckOnDatasetAndAddToGrid( ModuleCom.Components[i] );
end;

procedure TFrmFindAllElements.FindAllElements;
var i:integer;
begin
 if not MemData.Active then MemData.Open;
 for i:=0 to Application.ComponentCount-1 do
  begin
    if ( Application.Components[i] is TDataModule) then
      FindDatasetInModule(Application.Components[i]);
  end;
end;


procedure TFrmFindAllElements.GenerateAllElements(SaveToFile:String);
var i:Integer;
    DatasetName:string;
    FormName:string;
    TableName:string;
    ViewName:string;
    KeyFieldName:string;
    GenInName:string;
    CheckElem:variant;
    CurrStr:string;
    ListVar:TStringList;
    ListElem:TStringList;
begin
 try
   ListVar :=TStringList.Create;
   ListElem:=TStringList.Create;

   ListElem.Add('procedure InitElements; ');
   ListElem.Add('begin');

   for i:=0 to ViewElements.DataController.RecordCount -1 do
   begin

     DatasetName:=ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('DatasetName').Index ];
     FormName   :=ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('FormName').Index ];
     TableName  :=ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('TableName').Index ];
     KeyFieldName:=ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('KeyFieldName').Index ];
     ViewName   := ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('ViewName').Index ];
     GenInName  := ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('GenIdName').Index ];

     CheckElem:=ViewElements.DataController.Values[i, ViewElements.GetColumnByFieldName('CheckElem').Index ];
     if CheckElem = null then CheckElem:=false;
     if ViewName='' then ViewName:='nil';

     if CheckElem then
     begin
       if GenInName<>'' then GenInName:=', '+#39+GenInName+#39;

       CurrStr:='  Elem_'+DatasetName+' := TDBShemaView.Create( '+DatasetName+', '+ViewName+', '+#39+TableName+#39+', '+#39+KeyFieldName+#39 + GenInName+ ' );';
       ListElem.Add( CurrStr );

       ListVar.Add('  Elem_'+DatasetName+' : TDBShemaView;');
     end;
   end;
   ListElem.Add('end;');


   ListVar.Insert(0,'var ');
   ListElem.Insert(0, ListVar.Text);

   ListElem.SaveToFile( SaveToFile );
 finally
   ListElem.Free;
   ListVar.Free;
 end;
end;

procedure TFrmFindAllElements.Button1Click(Sender: TObject);
begin
 GenerateAllElements( ExtractFilePath(Application.ExeName) +'Elements.pas' );
end;

Function TFrmFindAllElements.FindGenIdName( TableName:Widestring;  DBParam:TConnectDBParam ):Widestring;

function CheckGenName(GenName:Widestring):Widestring;
var Sql:string;
    Res:Variant;
begin
  Sql := 'select RDB$GENERATOR_NAME from RDB$GENERATORS where RDB$GENERATOR_NAME ='+#39+ GenName +#39;

  {ADOTest.Close;
  ADOTest.CommandText:='select * from RDB$GENERATORS where RDB$GENERATOR_NAME ='+#39+ GenName +#39;
  ADOTest.Open;
  if not ADOTest.IsEmpty then result:= GenName
  else result:='';
  ADOTest.Close; }

  Res := UnitIBQuery.GetValueDB( DBParam.PathDB, DBParam.UID, DBParam.Password, Sql );
  if Res = null then result:=''
  else result := TRim( Res );
end;

begin
  TableName := UpperCase( TableName );

  result:=CheckGenName('GEN_'+ TableName +'_ID');
  if result<>'' then Exit;

  result:=CheckGenName('GEN_'+ TableName );
  if result<>'' then Exit;

  result:=CheckGenName( TableName + '_GEN');
  if result<>'' then Exit;

  result:=CheckGenName( TableName + '_ID_GEN');
  if result<>'' then Exit;

  
  result:=CheckGenName( TableName + '_GEN_ID');
  if result<>'' then Exit;
  
end;

procedure TFrmFindAllElements.AllTest;
var CheckElem:Variant;
    KeyFieldName:WideString;
    TableName:WideString;
    GenIdName:WideString;
    i:Integer;
    DBParam:TConnectDBParam;
begin
  DBParam:= GetDBParam( ADOTest );

  for i:=0 to ViewElements.DataController.RecordCount -1 do
  begin
     ViewElements.DataController.FocusedRecordIndex:=i;
     TableName  :=ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('TableName').Index ];
     KeyFieldName:=ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('KeyFieldName').Index ];
     CheckElem:=ViewElements.DataController.Values[i, ViewElements.GetColumnByFieldName('CheckElem').Index ];
     if CheckElem = null then CheckElem:=false;
     if CheckElem then
     begin
       try
        ADOTest.Close;
        ADOTest.CommandText:='select '+KeyFieldName+' from '+TableName;
        ADOTest.Open;
        ADOTest.Close;
       except
        ShowMessage( 'Wrong table Name '+TableName+' or Key field name '+KeyFieldName);
       end;
     end;
     //*************************
     GenIdName:=FindGenIdName(TableName,DBParam );
     if GenIdName <>'' then
     begin
       MemData.Edit;
       MemData.FieldByName('GenIdName').AsString:=GenIdName;
       MemData.Post;
     end;
  end;

end;
procedure TFrmFindAllElements.Button2Click(Sender: TObject);
begin
 AllTest;
end;

procedure TFrmFindAllElements.FixTrigers( SaveList:TStringList);
var i:Integer;
    TrigerName :WideString;
    TableName: WideString;
    SourceTriger:WideString;
    PosBegin:Integer;
    posEqual:Integer;
    CheckStr:WideString;
begin
   for i:=0 to ViewTrigers.DataController.RecordCount -1 do
   begin
     TrigerName:=ViewTrigers.DataController.DisplayTexts[i, ViewTrigers.GetColumnByFieldName('RDB$TRIGGER_NAME').Index ];
     TableName   :=ViewTrigers.DataController.DisplayTexts[i, ViewTrigers.GetColumnByFieldName('RDB$RELATION_NAME').Index ];
     SourceTriger  :=ViewTrigers.DataController.DisplayTexts[i, ViewTrigers.GetColumnByFieldName('CalTrigerSource').Index ];

     PosBegin:=AnsiPos('BEGIN',UpperCase(SourceTriger) );
     posEqual:=AnsiPos('=',SourceTriger );
     if (PosBegin <> - 1)and(posEqual<>-1) then
     begin
      PosBegin:=PosBegin+Length('BEGIN')+1;
      CheckStr:= Copy (SourceTriger,PosBegin,posEqual-PosBegin);
      CheckStr:=Trim(CheckStr);
      
      Insert(' if ( '+CheckStr+' is null or ('+CheckStr+' = 0) ) then ', SourceTriger, PosBegin );
      
      SaveList.Add('SET TERM ^ ;');

      SaveList.Add(' CREATE OR ALTER trigger '+ TrigerName+' for '+TableName );
      SaveList.Add('  active before insert position 0 ');
      SaveList.Add('   '+ SourceTriger );

      SaveList.Add('^ ');
      SaveList.Add('SET TERM ; ^ ');
     end; 

   end;
end;

procedure TFrmFindAllElements.Button3Click(Sender: TObject);
var SaveList:TStringList;
begin
 ADOGetTrigers.Open;
 SaveList:=TStringList.create;

 FixTrigers( SaveList );
 SaveList.SaveToFile('d:\FixTrigers.Sql');
 SaveList.free;
end;

procedure TFrmFindAllElements.ADOGetTrigersCalcFields(DataSet: TDataSet);
begin
 DataSet.FieldByName('CalTrigerSource').AsString := DataSet.FieldByName('RDB$TRIGGER_SOURCE').AsString;
end;

procedure TFrmFindAllElements.Button4Click(Sender: TObject);
var i:Integer;
    TableName:Variant;
    CheckElem:Variant;
    aListTable:TStringList;
    aListView:TStringList;
begin
  aListTable:=TStringList.Create;
  aListView:=TStringList.Create;
  for i:=0 to ViewElements.DataController.RecordCount -1 do
   begin
     TableName  :=ViewElements.DataController.DisplayTexts[i, ViewElements.GetColumnByFieldName('TableName').Index ];
     CheckElem:=ViewElements.DataController.Values[i, ViewElements.GetColumnByFieldName('CheckElem').Index ];

     if (TableName <> null)and(CheckElem = True) then
     begin
       aListTable.Add( TableName );
     end
     else if TableName <> null then aListView.Add( TableName );

   end;

   aListTable.SaveToFile( ExtractFilePath(Application.ExeName)+'TableNames.txt' );
   aListView.SaveToFile( ExtractFilePath(Application.ExeName)+'ViewNames.txt' );

   aListTable.Free;
   aListView.Free;
end;

function TFrmFindAllElements.FindUseProcName(ProcName:String):string;
var i:integer;
    indColProcName:Integer;
    indColSql:Integer;
    StrSql:WideString;
    Source:WideString;
begin
  Result :='';
  ProcName:=Trim(ProcName);

  if FPrefixSave ='StoredProc' then
  begin

  indColProcName := ViewProcedures.GetColumnByFieldName('PROC_NAME').Index;
  indColSql := ViewProcedures.GetColumnByFieldName('PROC_CODE').Index;

  for i:=0 to ViewProcedures.ViewData.RecordCount-1 do
  begin
    StrSql := ViewProcedures.ViewData.Rows[i].Values[indColSql];
    FPrepraeSource( StrSql );
    if AnsiPos( LowerCase( ProcName ) , LowerCase( StrSql) )<>0 then
      Result := Result + ViewProcedures.ViewData.Rows[i].Values[ indColProcName ]+';';
  end;
  end
  else
  begin
    if not ADOProcedures.Active then ADOProcedures.Open;


    try
      ViewProcedures.BeginUpdate;
      ADOProcedures.First;

      while not ADOProcedures.Eof do
      begin
        Source :=Trim( ADOProcedures.FieldByName('RDB$PROCEDURE_SOURCE').AsString );
        FPrepraeSource( Source );

        if AnsiPos(LowerCase( ProcName ), LowerCase( Source ) )<>0 then
           Result := Result + Trim( ADOProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString)+';';

        ADOProcedures.Next;
      end;
    finally
      ViewProcedures.EndUpdate;
    end;
  end;

end;


function TFrmFindAllElements.FindUseProcNameInTrigers(ProcName:String):string;
var i:integer;
    indColProcName:Integer;
    indColSql:Integer;
    StrSql:string;
    Source:widestring;
begin
  if not ADOGetAllTrigers.Active then
    ADOGetAllTrigers.Open;

  Result :='';
  ProcName:=Trim(ProcName);
  ADOGetAllTrigers.First;

  //ADOGetAllTrigers.Locate('RDB$TRIGGER_NAME','PERSONS_BU0',[]);

  while not ADOGetAllTrigers.Eof do
  begin
    Source :=Trim( ADOGetAllTrigers.FieldByName('RDB$TRIGGER_SOURCE').AsString );
    FPrepraeSource( Source );

    if AnsiPos(LowerCase( ProcName ), LowerCase( Source ) )<>0 then
       Result := Result + Trim( ADOGetAllTrigers.FieldByName('RDB$TRIGGER_NAME').AsString)+';';

    ADOGetAllTrigers.Next;
  end;

end;

function TFrmFindAllElements.FindUseProcNameInView(ProcName:String):string;
var i:integer;
    indColProcName:Integer;
    indColSql:Integer;
    StrSql:string;
    Source:widestring;
begin
  if not ADOView.Active then
    ADOView.Open;

  Result :='';
  ProcName:=Trim(ProcName);
  ADOView.First;
  while not ADOView.Eof do
  begin
    Source :=Trim( ADOView.FieldByName('VIEW_SOURCE').AsString );
    FPrepraeSource( Source );

    if AnsiPos(LowerCase( ProcName ), LowerCase( Source ) ) <>0 then
       Result := Result + Trim( ADOView.FieldByName('TABLE_NAME').AsString)+';';

    ADOView.Next;
  end;

end;


function TFrmFindAllElements.FindUseProcNameInTable(AtableName:String):string;
var i:integer;
    indColProcName:Integer;
    indColSql:Integer;
    StrSql:string;
    SourceTableName:widestring;
begin
  if not ADOTable.Active then
    ADOTable.Open;

  Result :='';
  AtableName:=Trim(AtableName);
  ADOTable.First;
  while not ADOTable.Eof do
  begin
    SourceTableName :=Trim( ADOView.FieldByName('TABLE_NAME').AsString );
    FPrepraeSource( SourceTableName );

    if AnsiPos( LowerCase( AtableName ), LowerCase( SourceTableName ) ) <>0 then
       Result := Result + Trim( ADOView.FieldByName('TABLE_NAME').AsString)+';';

    ADOTable.Next;
  end;

end;


procedure TFrmFindAllElements.FillMemDataProc;
begin
  if not ADOProcedures.Active then ADOProcedures.open;
  if not MemDataProc.Active then MemDataProc.Open;
  while not MemDataProc.Eof do MemDataProc.Delete;

  ViewProcedures.BeginUpdate;
  ADOProcedures.First;
  while not ADOProcedures.Eof do
  begin
    MemDataProc.Append;
    MemDataProc.FieldByName('PROC_NAME').AsString :=  Trim( ADOProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString );
    MemDataProc.FieldByName('PROC_CODE').AsString :=  ADOProcedures.FieldByName('RDB$PROCEDURE_SOURCE').AsString;
    MemDataProc.Post;

    ADOProcedures.Next;
  end;

  ViewProcedures.EndUpdate;
end;

procedure TFrmFindAllElements.FillMemDataView;
begin
  if not ADOView.Active then ADOView.open;
  if not MemDataProc.Active then MemDataProc.Open;
  while not MemDataProc.Eof do MemDataProc.Delete;

  ViewProcedures.BeginUpdate;
  ADOView.First;
  while not ADOView.Eof do
  begin
    MemDataProc.Append;
    MemDataProc.FieldByName('PROC_NAME').AsString :=  Trim( ADOView.FieldByName('TABLE_NAME').AsString );
    MemDataProc.FieldByName('PROC_CODE').AsString :=  ADOView.FieldByName('VIEW_SOURCE').AsString;
    MemDataProc.Post;

    ADOView.Next;
  end;

  ViewProcedures.EndUpdate;
end;


procedure TFrmFindAllElements.FillMemDataTable;
begin
  if not ADOTable.Active then ADOTable.open;
  if not MemDataProc.Active then MemDataProc.Open;
  while not MemDataProc.Eof do MemDataProc.Delete;

  ViewProcedures.BeginUpdate;
  ADOTable.First;
  while not ADOTable.Eof do
  begin
    MemDataProc.Append;
    MemDataProc.FieldByName('PROC_NAME').AsString :=  Trim( ADOTable.FieldByName('TABLE_NAME').AsString );
    //MemDataProc.FieldByName('PROC_CODE').AsString :=  ADOView.FieldByName('VIEW_SOURCE').AsString;
    MemDataProc.Post;

    ADOTable.Next;
  end;

  ViewProcedures.EndUpdate;
end;

procedure TFrmFindAllElements.Button5Click(Sender: TObject);
var i:Integer;
    Progres : TProgressFormProp;
begin
  MemDataProc.First;

  try
    Progres := ShowProgress( WaitFormCaption, MemDataProc.RecordCount );
    while not MemDataProc.Eof do
    begin
      MemDataProc.edit;
      MemDataProc.FieldByName('USE_IN_DB').AsString := FindUseProcName( MemDataProc.FieldByName('PROC_NAME').AsString );
      MemDataProc.Post;

      MemDataProc.Next;
      Progres.ProgressBar.Position :=  Progres.ProgressBar.Position + 1;
    end;
 finally
    ClosedProgress( Progres.FormProgres );
 end;
end;

function TFrmFindAllElements.FindUseProcNameInDirFiles(Path:string;ProcName:String):string;
begin

end;

function TFrmFindAllElements.FindUseProcNameInFiles(ProcName:String;ProgressBar:TProgressBar ):string;
var i:integer;
    indColProcName:Integer;
    indColSql:Integer;
    StrSql:string;
    aListFiles:TStringList;
    aListTextFile:String;
begin
  Result :='';
  ProcName:=Trim(ProcName);

  indColProcName := ViewProcedures.GetColumnByFieldName('PROC_NAME').Index;
  indColSql := ViewProcedures.GetColumnByFieldName('PROC_CODE').Index;

  aListFiles:=TStringList.Create;

  FindSubDirFiles( EditPath.Text,'*.dfm',aListFiles );
  FindSubDirFiles( EditPath.Text,'*.pas',aListFiles );

  ProgressBar.Position := 0;
  ProgressBar.Max := aListFiles.Count;
  for i:=0 to aListFiles.Count -1 do
  begin
    if FileExists( aListFiles.Strings[i] ) then
    begin
      aListTextFile := GetStringFromFileByByte( aListFiles.Strings[i] );
      if Pos( LowerCase( ProcName ) , LowerCase( aListTextFile ) )<>0 then
        result := result + ParsePath(aListFiles.Strings[i],3,True)+';';  
    end;

    ProgressBar.Position := ProgressBar.Position+1;
  end;
  aListFiles.Free;
end;

procedure TFrmFindAllElements.Button6Click(Sender: TObject);
var i:Integer;
    Progres : TProgressFormProp;
    ListStoredProcName:TStringList;

begin
  MemDataProc.First;

  try
    Progres := ShowProgress( WaitFormCaption, MemDataProc.RecordCount );
    ListStoredProcName:=TStringList.Create;
    while not MemDataProc.Eof do
    begin

      Progres.ProgressCaption.Caption :=MemDataProc.FieldByName('PROC_NAME').AsString;
      Progres.ProgressCaption.Repaint;


      MemDataProc.edit;
      MemDataProc.FieldByName('USE_IN_Project').AsString := MemDataProc.FieldByName('USE_IN_Project').AsString +','+ FindUseProcNameInFiles( MemDataProc.FieldByName('PROC_NAME').AsString,  Progres.ProgressBar );
      MemDataProc.Post;


      MemDataProc.Next;
      //Progres.ProgressBar.Position :=  Progres.ProgressBar.Position + 1;
    end;
 finally
    ListStoredProcName.Free;
    ClosedProgress( Progres.FormProgres );
 end;


end;

procedure TFrmFindAllElements.Button7Click(Sender: TObject);
var  i : Integer;
    indColUseInDB : Integer;
    indColUseInProject : Integer;
    indColUseInTriger : Integer;
    indColUseInView :Integer;
    SaveList:TStringList;
    SaveListUseByProc:TStringList;
    SaveListUseByProject:TStringList;
    SaveListUseByTriger:TStringList;
    indColProcName:Integer;
begin
  indColProcName := ViewProcedures.GetColumnByFieldName('PROC_NAME').Index;
  indColUseInDB := ViewProcedures.GetColumnByFieldName('USE_IN_DB').Index;
  indColUseInProject := ViewProcedures.GetColumnByFieldName('USE_IN_Project').Index;
  indColUseInTriger  := ViewProcedures.GetColumnByFieldName('USE_IN_Trigers').Index;
  indColUseInView  := ViewProcedures.GetColumnByFieldName('USE_IN_View').Index;


  SaveList:=TStringList.Create;
  SaveListUseByProc:=TStringList.Create;
  SaveListUseByProject:=TStringList.Create;
  SaveListUseByTriger:=TStringList.Create;

  for i:=0 to ViewProcedures.ViewData.RecordCount-1 do
  begin
    if  ( VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInDB ] ) = '') and
        ( VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInProject ] ) = '') and
        ( VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInTriger ] ) = '')  and
        ( VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInView ] ) = '')  then
    SaveList.Add(  VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColProcName ] ) );

    if ( VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInDB ] )<>'')  then
      SaveListUseByProc.Add(  VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColProcName ] )+'   '+ VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInDB ] ) );

    if ( VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInProject ] )<>'')  then
      SaveListUseByProject.Add(  VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColProcName ] )+'   '+ VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInProject ] ) );

    if ( VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInTriger ] )<>'')  then
      SaveListUseByTriger.Add(  VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColProcName ] )+'   '+ VarToStr( ViewProcedures.ViewData.Rows[i].Values[ indColUseInTriger ] ) );
  end;

  SaveList.SaveToFile(ExtractFilePath(Application.ExeName) + FPrefixSave + '_NotUsed.txt');
  SaveListUseByProc.SaveToFile(ExtractFilePath(Application.ExeName) + FPrefixSave + '_UsedBySql.txt');
  SaveListUseByProject.SaveToFile(ExtractFilePath(Application.ExeName) + FPrefixSave + '_UsedByProject.txt');
  SaveListUseByTriger.SaveToFile(ExtractFilePath(Application.ExeName) + FPrefixSave + '_UsedByTrieger.txt');

  SaveList.Free;
  SaveListUseByProc.Free;
  SaveListUseByProject.Free;
  SaveListUseByTriger.Free;

end;

procedure TFrmFindAllElements.Button8Click(Sender: TObject);
var i:Integer;
    Progres : TProgressFormProp;
begin
  MemDataProc.First;

  try
    Progres := ShowProgress( WaitFormCaption, MemDataProc.RecordCount );
    while not MemDataProc.Eof do
    begin
      MemDataProc.edit;
      MemDataProc.FieldByName('USE_IN_Trigers').AsString := FindUseProcNameInTrigers( MemDataProc.FieldByName('PROC_NAME').AsString );
      MemDataProc.Post;

      MemDataProc.Next;
      Progres.ProgressBar.Position :=  Progres.ProgressBar.Position + 1;
    end;
 finally
    ClosedProgress( Progres.FormProgres );
 end;
end;

procedure TFrmFindAllElements.Button13Click(Sender: TObject);
var i:Integer;
    Progres : TProgressFormProp;
begin
  MemDataProc.First;

  try
    Progres := ShowProgress( WaitFormCaption, MemDataProc.RecordCount );
    while not MemDataProc.Eof do
    begin
      MemDataProc.edit;
      MemDataProc.FieldByName('USE_IN_View').AsString := FindUseProcNameInView( MemDataProc.FieldByName('PROC_NAME').AsString );
      MemDataProc.Post;

      MemDataProc.Next;
      Progres.ProgressBar.Position :=  Progres.ProgressBar.Position + 1;
    end;
 finally
    ClosedProgress( Progres.FormProgres );
 end;

end;

procedure FixDatasetInFields( aFile:String; aModuleForm:TComponent );
const splits : array[0..4] of string = ( ',', ';', ' ', '(', ')' );
var i:Integer;
    j:Integer;
    k:Integer;
    FileText:TStringList;
    TextField:WideString;
    Dataset:TDataSet;
    isChanged:Boolean;
    CurrElem : TDBShema;
    PosFind:Integer;
    StrForRreplase:WideString;
    SpliterIndex:Integer;
    //LContext: TRttiContext;
begin
  //if LowerCase( ExtractFileName( aFile) ) = LowerCase('FundingFrm.pas') then ShowMessage('dd');

  try
    FileText:=TStringList.Create;
    FileText.LoadFromFile( aFile );
    TextField := FileText.Text;
    isChanged := False;

    for j:=0 to aModuleForm.ComponentCount-1 do
    begin
      //if (aModuleForm.Components[j].name = 'SelectZoomQry')and
      //   (ExtractFileName(aFile)='LibDMod.pas' ) then ShowMessage('dd');

      if ( aModuleForm.Components[j] is TIBQuery ) or ( aModuleForm.Components[j] is TIBTable ) or
         ( aModuleForm.Components[j] is TQuery ) or ( aModuleForm.Components[j] is TTable ) or
         ( aModuleForm.Components[j] is TADOQuery )or ( aModuleForm.Components[j] is TMemTableEh )  or  ( aModuleForm.Components[j] is TdxMemData ) then
      begin
        Dataset := TDataset(aModuleForm.Components[j]);
        CurrElem := FindElementByDataset(Dataset);

        for i:=0 to Dataset.FieldCount-1 do
        begin
          PosFind := AnsiPos( LowerCase( Dataset.Name+Dataset.Fields[i].FieldName+'.'), LowerCase(TextField) );

          if (PosFind <> 0)and ( not (  Char(TextField[PosFind-1]) in ['A'..'Z', 'a'..'z', '_'] )) then
          begin
            //ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName, Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType) );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.value', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType) );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.asInteger', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').asInteger' );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.asString', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').asString' );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.asFloat', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').asFloat' );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.asVariant', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType) );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.DisplayText', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').DisplayText' );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.IsNull', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').IsNull' );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.Clear', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').Clear' );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.asBoolean', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').asBoolean' );
            ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+'.asDateTime', Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').asDateTime');

            //ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+':', 'Marker_declaration_Field' );
            //ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName, Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''')' );
            //ReplaseON(TextField, 'Marker_declaration_Field', Dataset.Name+Dataset.Fields[i].FieldName+':' );

            for SpliterIndex:=0 to Length(splits)-1 do
               ReplaseON(TextField, Dataset.Name+Dataset.Fields[i].FieldName+splits[SpliterIndex], Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''')'+splits[SpliterIndex] );

            isChanged:=True;
          end;
          //**************************************
          if CurrElem <> nil then
          begin
            //if (LowerCase( CurrElem.db.Name) = LowerCase( 'BrCountryQry') ) and ( LowerCase( ExtractFileName( aFile) ) = LowerCase('FundingFrm.pas') ) then
            //  ShowMessage('dd');
            PosFind :=-1;
            while PosFind <> 0 do
            begin
              StrForRreplase := LowerCase(Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType) );
              PosFind:= AnsiPos( StrForRreplase, LowerCase(TextField) );
              if PosFind <> 0 then
              begin
                 ReplaceONJustFromPosition( TextField, Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType),
                                            'Elem_'+Dataset.Name+'.DB'+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType), PosFind);
                //TextField := Copy(TextField,1,PosFind-1)+'Elem_'+Dataset.Name+'.DB'+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType+
                //Length(StrForRreplase
                {ReplaseON( TextField, Dataset.Name+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType) ,
                                      'Elem_'+Dataset.Name+'.DB'+'.FieldByName('''+Dataset.Fields[i].FieldName+''').'+ConvertFieldTypeToString(Dataset.Fields[i].DataType) ) ;}

                if TextField[PosFind-1]='.' then
                begin
                  for k:= PosFind-1 downto 1 do
                  begin
                    if Char(TextField[k]) in [',',';',' ','!','?','-','_','+','&','^','@','#','$','*','(',')','/','\','[',']','{','}'] then
                    begin
                      Delete(TextField,k+1,PosFind-k-1);
                      break;
                    end;
                  end;
                end;
                isChanged:=True;
              end;
            end;
            //*******************************
            PosFind:= AnsiPos( LowerCase(Dataset.Name+'.open' ), LowerCase( TextField ) );
            if (PosFind<>0)and (Char(TextField[PosFind-1]) in [',',';',' ','!','?','-','_','+','&','^','@','#','$','*','(',')'] ) then
            begin
              ReplaseON( TextField, TextField[PosFind-1] + Dataset.Name +'.open', TextField[PosFind-1]+'Elem_'+Dataset.Name+'.DBOpen');
              isChanged:=True;
            end;
          end;
          //**************************************
        end;

      end;
    end;

    if isChanged then
    begin
      FileText.Text:=TextField;
      FileText.SaveToFile( aFile );
    end;

  finally
    FileText.Free;
  end;
end;

procedure FixDatasetFieldOnDataset( AllFiles:TStringList; aMainForm:TComponent );
var i:Integer;
begin
  for i:=0 to AllFiles.Count-1 do
  begin
    if FileExists(  AllFiles.strings[i] ) then
      FixDatasetInFields( AllFiles.strings[i] , aMainForm );
  end;
end;

procedure FixDatasetFieldOnForm(Path:string; aModuleForm:TComponent );
var i:Integer;
    AllFiles:TStringList;
begin
  try
    AllFiles := TStringList.Create;

    FindSubDirFiles(Path,'*.pas',AllFiles);
    FixDatasetFieldOnDataset( AllFiles, aModuleForm );
  finally
    AllFiles.free;
  end;
end;



procedure TFrmFindAllElements.Button20Click(Sender: TObject);
var i:integer;
    ClassesList:TStringList;
    Path:String;
    MakeFile:TStringList;
begin
  try
    MakeFile := TStringList.Create;
    Path := ExtractFilePath( Application.ExeName );
    ClassesList := FindAllClassFrom( Path );
    for i:= 0 to ClassesList.Count-1 do
      MakeFile.Add( '  RegisterClass( '+ ClassesList.Strings[i] +' ); ');
    
    MakeFile.SaveToFile( Path+'RegisterClass.txt' );
  finally
    MakeFile.free;
    ClassesList.Free;
  end;
end;

function GetCreatedFormByClassName(aName:String ):TForm;
var i:integer;
    AFindFormClass:TFormClass;
    aFindClass:TPersistentClass;
begin
  result := nil;
  
  for i:= 0 to Application.ComponentCount -1 do
  begin
    if CompareText( Application.Components[i].ClassName, aName ) = 0 then
    begin
      result := TForm( Application.Components[i]);
      break;
    end;
  end;
                
  if result=nil then
  begin
    try
      aFindClass := FindClass(aName);

      AFindFormClass := TFormClass( aFindClass );
      if AFindFormClass<>nil then
      begin
        result := AFindFormClass.Create(Application.MainForm);
        TForm(result).Tag := -1;
      end;

    except
      ShowMessage('Class '+aName+' is not registered.');
    end;
  end;
end;

procedure TFrmFindAllElements.Button9Click(Sender: TObject);
var i:Integer;
    Path : string;
    ClassesList:TStringList;
    NotFoundClasses:TStringList;

    aFormComponents : TComponent;
begin
   try
     NotFoundClasses := TStringList.Create;

     Path := ExtractFilePath( Application.ExeName );
     ClassesList := FindAllClassFrom( Path );
     for i:=0 to ClassesList.Count-1 do
     begin
       aFormComponents := GetCreatedFormByClassName( ClassesList.Strings[i] );
       if aFormComponents <> nil then
       begin
         FixDatasetFieldOnForm( Path , aFormComponents );
         if aFormComponents.Tag = -1 then aFormComponents.Free;
       end
       else NotFoundClasses.Add( ClassesList.Strings[i] );
     end;

   finally
     NotFoundClasses.SaveToFile( ExtractFilePath( Application.ExeName ) + 'ClassFormNotUsed.txt' );
     NotFoundClasses.Free;
   end;
     {for i:=0 to Application.ComponentCount -1 do
     begin
       FixDatasetFieldOnForm( Path , Application.Components[i] );
     end;}
     Showmessage('Finish');
end;

procedure ExtractSQLToFile( aCom:TDataset );
var Sql:TStringList;
    DBParam:TConnectDBParam;
    Path:string;
begin
  try
    Sql := TStringList.Create;

    DBParam := GetDBParam(TDataset(aCom));
    Sql.Text := GetDBSql(TDataset(aCom));

    if ( Trim(Sql.Text)<>'' ) then
    begin
      Path := GetDBSqlPath(aCom);
      if Path <> '' then
      begin
        ExistsDir( Path ) ;
        Sql.SaveToFile( Path + TDataset(aCom).Name+'.sql' );
      end;
    end;
  finally
    Sql.Free;
  end;

end;

procedure TFrmFindAllElements.ExtractScriptsFromForm( aCom:TComponent );
var j:Integer;
begin
  if aCom <> Self then
  for j:=0 to aCom.ComponentCount-1 do
  begin
    if aCom.Components[j] is TDataSet then
      ExtractSQLToFile( TDataSet( aCom.Components[j] ) );

    if aCom.Components[j] is TFrame then
      ExtractScriptsFromForm( aCom.Components[j] );
  end;
end;

procedure TFrmFindAllElements.Button10Click(Sender: TObject);
var i,j:Integer;
    Path : string;
begin
   Path := ExtractFilePath( Application.ExeName )+'SCRIPTS\';
   for i:=0 to Application.ComponentCount -1 do
   begin
     if Application.Components[i] <> Self then 
       ExtractScriptsFromForm( Application.Components[i] );
       {for j:=0 to Application.Components[i].ComponentCount-1 do
       begin
         if Application.Components[i].Components[j] is TDataSet then
           ExtractSQLToFile( TDataSet( Application.Components[i].Components[j] ) );
       end;}
   end;
   Showmessage('Finish');
end;

procedure TFrmFindAllElements.Button11Click(Sender: TObject);
begin
  FindAllElements;
end;


function GetSqlFieldId(TableName:String):string;
begin
  Result := 'select sg.rdb$field_name as field_name from '+
   ' rdb$indices ix '+
   ' left join rdb$index_segments sg on ix.rdb$index_name = sg.rdb$index_name '+
   ' left join rdb$relation_constraints rc on rc.rdb$index_name = ix.rdb$index_name '+
   ' where rc.rdb$constraint_type = ''PRIMARY KEY'' and rc.rdb$relation_name ='+#39+TableName+#39;
end;

function CheckFieldUpdate(SourceTriger:string;ListSelfField:TStringList ):Boolean;
var i,j:integer;
    ListSource:TStringList;
begin
  result := False;

  ListSource:=TStringList.Create;
  ListSource.Text :=SourceTriger;
  for i:=0 to ListSource.Count-1 do
   for j:=0 to ListSelfField.Count-1 do
   begin
     if (( (AnsiPos( LowerCase('new.'+ListSelfField[j]+'='),LowerCase( ListSource[i]) )<>0) or
          (AnsiPos( LowerCase('new.'+ListSelfField[j]+' ='),LowerCase( ListSource[i]) )<>0 ) ) and

         (AnsiPos(LowerCase('IF'),LowerCase( ListSource[i]) )=0 ) ) then
     begin
       result := True;
       exit;
     end;

     if ( (AnsiPos( LowerCase('then new.'+ListSelfField[j]+' ='),LowerCase( ListSource[i]) )<>0 ) ) then
     begin
       result := True;
       exit;
     end;
   end;

   ListSource.Free;
end;

procedure TFrmFindAllElements.FPrepraeSource(var Source:Widestring);
begin
   ReplaseOn(Source,#13#10,' ');
   ReplaseOn(Source,#$A,' ');
end;

Function TFrmFindAllElements.FindInKeyWordInSource( DB:TDataset; FiedlName,FieldSource:String; KeyWords:array of wideString ):TStringList;
var i:integer;
    Source:Widestring;
    aName:string;
    CurrFind:TStringList;
    Progres : TProgressFormProp;
    StrFindKeyWord:String;
begin
  try
    Progres := ShowProgress( WaitFormCaption, -1 );
    result :=TStringList.Create;

    DB.First;
    while not DB.Eof do
    begin
      Source := Trim( DB.FieldByName(FieldSource).AsString );
      aName:= Trim( DB.FieldByName(FiedlName).AsString);

      FPrepraeSource( Source );

      try
        CurrFind:= FindArrKeyWordInStr( KeyWords, Source, ' ',' ' );
        StrFindKeyWord:='';
        for i:=0 to CurrFind.Count-1 do StrFindKeyWord:=StrFindKeyWord+CurrFind.strings[i]+', ';
        if StrFindKeyWord<>'' then
        begin
          Delete(StrFindKeyWord,length(StrFindKeyWord)-1,2);
          result.Add( aName +' ( '+StrFindKeyWord +' ) ' );
        end;

          //result.add( TrigerName + ' ( '+  CurrFind.strings[i]+' )' );
      finally
        CurrFind.Free;
      end;

      DB.Next;
    end;

  finally
    ClosedProgress( Progres.FormProgres );
  end;
end;


Function TFrmFindAllElements.FindInTrigerKeyWord( KeyWords:array of wideString ):TStringList;
begin
  result := FindInKeyWordInSource( ADOGetTrigersProblem, 'RDB$TRIGGER_NAME','RDB$TRIGGER_SOURCE', KeyWords );
end;

Function TFrmFindAllElements.FindInProcedureKeyWord( KeyWords:array of wideString ):TStringList;
begin
  result := FindInKeyWordInSource( ADOProcedures, 'RDB$PROCEDURE_NAME','RDB$PROCEDURE_SOURCE', KeyWords );
end;

Function TFrmFindAllElements.FindInViewKeyWord( KeyWords:array of wideString ):TStringList;
begin
  result := FindInKeyWordInSource( ADOView, 'TABLE_NAME','VIEW_SOURCE', KeyWords );
end;

procedure TFrmFindAllElements.Button12Click(Sender: TObject);
const KeyWords:array[0..25] of wideString  =('CITIES','CITIES_LNG','PROVINCES','TOWNSHIPS','TMUSERS','ADDRESS','RESORT','RESORTCITYLNK','RESORTLINKS','TOURNAMES','INFRAIMAGES','INFRASTRUCTURES','INFRATYPEGROUPS',
                                     'INFRATYPELINKS','INFRATYPES','NATUROBJCTIMAGES','NATUROBJECTS','NATUROBJECTTYPE','OBJECTLINKS','COMPEMAILS','COMPPHONES','COMPWEBSITES','TR_RATES','TYPENOTE',
                                     'TOURVARIANTS','TMUSERPERMS' );
var ListProblemProcedure:TStringList;
    ListProblemTriger:TStringList;
    ListProblemView:TStringList;
    aType:Integer;
    SourceTriger:string;
    TableName:string;
    TrigerName:string;
    Path:String;
    FieldIdName:variant;
    i:Integer;
    indUpdate:Integer;
    FindUpdateField:Integer;
begin
  if not ADOGetTrigersProblem.Active then ADOGetTrigersProblem.Open;
  if not ADOProcedures.Active  then ADOProcedures.Open;
  if not ADOView.Active then ADOView.Open;

  ListProblemProcedure:= TStringList.Create;
  ListProblemTriger:=TStringList.Create;
  ListProblemView := TStringList.Create;

  Path := ExtractFilePath( Application.ExeName );

  ListProblemTriger := FindInTrigerKeyWord( KeyWords );
  ListProblemProcedure := FindInProcedureKeyWord( KeyWords );
  ListProblemView := FindInViewKeyWord( KeyWords );

  ListProblemTriger.SaveToFile( Path + 'TrigerKeyWord.txt' );
  ListProblemProcedure.SaveToFile( Path + 'ProcedureKeyWord.txt' );
  ListProblemView.SaveToFile( Path + 'ViewKeyWord.txt' );

  
  ListProblemTriger.Free;
  ListProblemProcedure.Free;
  ListProblemView.Free;
end;

procedure TFrmFindAllElements.Button14Click(Sender: TObject);
var aList:TStringList;
begin
  FindUseProcNameInTrigers( MemDataProc.FieldByName('PROC_NAME').AsString );


  //aList := TStringList.Create;

  //if ADOProcedures.Locate( 'RDB$PROCEDURE_NAME', MemDataProc.FieldByName('PROC_NAME').AsString,[] ) then
  //  aList.Text:=  ADOProcedures.fieldByName('RDB$PROCEDURE_SOURCE').AsString;
  //ShowMessage( IntToStr ( aList.Count ) );

  //aList.Text:= MemDataProc.FieldByName('PROC_CODE').AsString;
  //ShowMessage( aList.Text );
  //ShowMessage( IntToStr ( aList.Count ) );

  FindUseProcName( MemDataProc.FieldByName('PROC_NAME').AsString );

  //aList.Free;
end;

procedure TFrmFindAllElements.Button15Click(Sender: TObject);
const KeyWords:array[0..0] of wideString  =('NameLists');
var ListProblemView:TStringList;
    Path:String;
begin
  if not ADOView.Active then ADOView.Open;
  Path := ExtractFilePath( Application.ExeName );

  ListProblemView := FindInViewKeyWord( KeyWords );
  ListProblemView.SaveToFile( Path + 'ViewNamList.txt' );
  ListProblemView.Free;
end;

procedure TFrmFindAllElements.Button16Click(Sender: TObject);
begin
  FPrefixSave:='StoredProc';
  FillMemDataProc;
end;

procedure TFrmFindAllElements.Button17Click(Sender: TObject);
begin
  FPrefixSave:='View';
  FillMemDataView;
end;

procedure TFrmFindAllElements.Button18Click(Sender: TObject);
begin
  FPrefixSave:='Table';
  FillMemDataTable;
end;

procedure FindDifFieldType( FormName:String; aDbServer,aDbClient:TDataset; var DifField:TStringList);
var i:integer;
    CurrFieldServer:TField;
    CurrDifField:String;
    NewField:TField;
begin

  CurrDifField :='';
  i:=0;
  try
    if aDbClient.Active then aDbClient.Close;
    //aDbClient.FieldDefs.Update;

    while i<=aDbClient.FieldCount-1 do
    begin
       CurrFieldServer:= aDbServer.FindField( aDbClient.Fields[i].FieldName );
       if ( CurrFieldServer <> nil ) then
       begin

         if ( CurrFieldServer.DataType <> aDbClient.Fields[i].DataType  ) then
         begin
            CurrDifField := CurrDifField + aDbClient.Fields[i].FieldName+ ',';
            aDbClient.Fields[i].Free;

            NewField := CreateField( CurrFieldServer.DataType, CurrFieldServer.Size, aDbClient, CurrFieldServer.FieldName );
            NewField.FieldKind := fkData;
            NewField.DataSet := aDbClient;
            NewField.Index  := i;
         end
       end;
       inc(i);
    end;

    if CurrDifField<>'' then
    begin
      Delete(CurrDifField,Length(CurrDifField),1);
      DifField.Add( FormName+'.'+aDbClient.Name+' ( '+ CurrDifField +' ) ');
    end;
  except
    //ShowMessage( aDbClient.Fields[i].FieldName );
    //aDbClient.FieldDefs.EndUpdate;
  end;

end;

procedure FindDatasetProblemField( ConnectToDB, Login,Password:string );
var i,j:integer;
    DBParam:TConnectDBParam;
    Sql:String;
    CurrIBDs:TIBQuery;
    DifField:TStringList;
    Progres : TProgressFormProp;
begin
  try
    Progres := ShowProgress( WaitFormCaption, -1 );
    DifField:=TStringList.Create;

    for i:=0 to Application.ComponentCount-1 do
    begin
       if not (Application.Components[i] is TFrmFindAllElements) then
       begin

         for j:=0 to Application.Components[i].ComponentCount-1 do
         begin
           try
             if ( ( Application.Components[i].Components[j] is TIBQuery ) or
                ( Application.Components[i].Components[j] is TAdoQuery ) or
                ( Application.Components[i].Components[j] is TQuery) )  then
             begin
               DBParam:= GetDBParam( TDataset( Application.Components[i].Components[j] ) );
               Sql := Trim( GetDBSql( TDataset( Application.Components[i].Components[j] ) ) );

               //if Application.Components[i].Components[j].Name = 'PbxAccntQry' then ShowMessage('11');
               if (SQL <> '') and (AnsiPos('group by', LowerCase(SQL)) = 0) then
                 Sql := GetSqlWithoutAfterFrom(Sql) +' where null = null';

               if Sql <>'' then
               begin
                 try

                  try
                   CurrIBDs := UnitIBQuery.CreateDataSet(ConnectToDB, Login,Password, nil, Sql );
                   FindDifFieldType( Application.Components[i].Name, CurrIBDs, TDataset( Application.Components[i].Components[j] ), DifField );
                  except
                    ShowMessage( Application.Components[i].Components[j].Name );
                  end;
                 finally
                   UnitIBQuery.DestroyDS(CurrIBDs);
                 end;
               end;

             end;
           except
           end;
         end;
       end;
    end;

    DifField.SaveToFile( ExtractFilePath( Application.ExeName ) + 'DatasetFieldDif.txt' );
  finally
    DifField.free;
    ClosedProgress( Progres.FormProgres );
  end;
end;

procedure FindDatasetNotInElem;
var i,j:integer;
    Progres : TProgressFormProp;
    CurrElem:TDBShema;
    DsNotUsed : TStringList;

begin
  try
    Progres := ShowProgress( WaitFormCaption, -1 );
    DsNotUsed := TStringList.Create;
    for i:=0 to Application.ComponentCount-1 do
    begin
       if not (Application.Components[i] is TFrmFindAllElements) then
       begin

         for j:=0 to Application.Components[i].ComponentCount-1 do
         begin

           if ( Application.Components[i].Components[j] is TDataset ) then
           begin
              CurrElem := FindElementByDataset( TDataset(Application.Components[i].Components[j]) );
              if CurrElem = nil then
                DsNotUsed.Add( Application.Components[i].Name+'.'+TDataset(Application.Components[i].Components[j]).Name );
           end;

         end;
       end;
    end;

     DsNotUsed.SaveToFile( ExtractFilePath( Application.ExeName ) + 'DatasetNotInElement.txt' );
  finally

    DsNotUsed.Free;
    ClosedProgress( Progres.FormProgres );

  end;
end;

procedure TFrmFindAllElements.FixGenerateValue( ConnectToDB, Login, Password :String );
var AllTable : TIBQuery;
    MaxValue:variant;
    SqlMaxValue:String;
    FieldIdName:string;
    TableName:String;
    GenNameFroTable:string;
    TableHaveNoGenerate : TStringList;
    Progres : TProgressFormProp;
    DBParam:TConnectDBParam;
begin
   DBParam.UID := Login;
   DBParam.Password:= Password;
   DBParam.PathDB :=ConnectToDB;

   try
     Progres := ShowProgress( WaitFormCaption, -1 );
     TableHaveNoGenerate := TStringList.Create;

     AllTable := UnitIBQuery.GetAllTables( ConnectToDB, Login, Password );
     while not AllTable.Eof do
     begin
       try

         TableName := Trim( AllTable.fieldByName('TABLE_NAME').asString );
         if TableName = 'CITY_ADM_UNT_ITEMS_TYPE_LNG' then ShowMessage('ddd');

         FieldIdName := GetFieldIdName(ConnectToDB, Login, Password , TableName );

         if FieldIdName <>'' then
         begin
           SqlMaxValue := 'select max('+FieldIdName+') from ' + TableName;
           MaxValue := GetValueDB( ConnectToDB, Login, Password, SqlMaxValue );
           if MaxValue = null then MaxValue:=0;

           GenNameFroTable := FindGenIdName( TableName, DBParam  );

           if GenNameFroTable<>'' then
             UnitIBQuery.UpdateSql( ConnectToDB, Login, Password, 'SET GENERATOR '+GenNameFroTable+' TO '+IntToStr(MaxValue))
           else TableHaveNoGenerate.Add('No Generator : '+ TableName );
         end
         else TableHaveNoGenerate.Add('No ID : '+ TableName );
         
       except
         showMessage( TableName );
       end;

       AllTable.Next;
     end;

     TableHaveNoGenerate.SaveToFile( ExtractFilePath( Application.ExeName ) + 'TableHaveNoTriger.txt' );

   finally
     TableHaveNoGenerate.Free;
     UnitIBQuery.DestroyDS(AllTable);
     ClosedProgress( Progres.FormProgres );
   end;
end;

procedure TFrmFindAllElements.Button19Click(Sender: TObject);
begin
   //FixGenerateValue( 'troll:D:\_Apollo\_TOURIB_TEST.GDB','SYSDBA','masterkey' );
   FixGenerateValue( 'homePC:D:\Firebird\_TOURIB_TEST.GDB','SYSDBA','masterkey' );
end;



end.

//Work
//Provider=MSDASQL.1;Password=HonzOKey;Persist Security Info=True;User ID=sysdba;Mode=ReadWrite;Extended Properties="DSN=IBADO;Driver=Firebird/InterBase(r) driver;Dbname=Apollo:D:\TourMn\NetTour\TOURIB.GDB;CHARSET=WIN1251;PWD=HonzOKey;UID=sysdba;Client=C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll;"

//Test
//Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True;User ID=sysdba;Mode=ReadWrite;Extended Properties="DSN=IBADO;Driver=Firebird/InterBase(r) driver;Dbname=alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB;CHARSET=WIN1251;PWD=HonzOKey;UID=sysdba;Client=C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll;"

//Test Troll
//Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True;User ID=SYSDBA;Extended Properties="Driver=Firebird/InterBase(r) driver;Dbname=troll:D:\_Apollo\_TOURIB_TEST.GDB;PWD=masterkey;UID=SYSDBA;"

