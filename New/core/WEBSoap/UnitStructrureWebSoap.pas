unit UnitStructrureWebSoap;

interface
 uses Windows, SysUtils, Dialogs, Classes,ComCtrls, DB,IBQuery,UnitIBQuery,
   FrmProgress,UnitProc;

 const DefCaptionSynchronizeFile = 'Синхронізація файлів';
 Type

  TTableConstraint = record
     ConstraintName:WideString;
     ConstraintType:WideString;
     TableName:WideString;
     FieldName:WideString;
     ParentTable:WideString;
     ParentTableKey:WideString;
     IsCascadeDelete:Integer;
  end;
  TableConstraintArr = array of TTableConstraint;

  TTableIndexes = record
    IndexName :WideString;
    TableName :WideString;
    Description :WideString;
    FieldName :WideString;
    FieldIndex:Integer;
  end;

  TableIndexesArr = array of TTableIndexes;

  TTableField = record
     FieldName : WideString;
     FieldType : WideString;
     FieldSize : Integer;
     Description : WideString;
     isNull    : Integer;
  end;

  TStructureTable = record
     TableName : WideString;
     PrimariKeyFieldName:WideString;
     Fields : array of TTableField;
  end;
  PStructureTable = ^TStructureTable;

  TStructureSynchronizeSoapWeb = class
  private
    FTableName : String;
    FFieldKod : String;
    FConstraints_FK : TableConstraintArr;
    FIndexes_Tbl : TableIndexesArr;
    FFieldsSelfTable : TStringList;
    FConnectDBParam : TConnectDBParam;
    FData : PStructureTable;
    FConstraintCanSyn:Boolean;

    procedure FReadSelfForeignKeyFromDataset ( Dataset:TDataset );
    procedure FReadSelfIndexesFromDataset ( Dataset:TDataset );
    procedure FReadSelfForeignKey;
    procedure FReadSelfIndexes;
    procedure FReadSelfForeignKeyIB;
    procedure FReadSelfIndexesIB;

    procedure FReadStructureTableFields;
  public
    destructor  Close;
    constructor Create( TableName: String; ConnectDBParam: TConnectDBParam; ConstraintCanSyn:Boolean );
    function SynchroniceWebSoap( ShowMessageError:boolean; ShowLoadCursor:Boolean ):Integer;
    function SynchroniceConstraintWebSoap( ShowMessageError:boolean; ShowLoadCursor: Boolean ):Integer;
    function SynchroniceIndexesWebSoap( ShowMessageError:boolean; ShowLoadCursor: Boolean ):Integer;

   property    ConstraintCanSyn : boolean read FConstraintCanSyn;
   property    FieldKod : String read FFieldKod;
  end;


  TCurrFilePath = record
    FilePath:string;
    mask:string;
  end;

  TFilePathSynchronizeSoapWeb = class
  private
    FPathFiles:TCurrFilePath;
    function  FSynchronizeCurrentFileName( aFileName,aPathRoot:String ):Integer;
    procedure FSynchronizeCurrentPathFolder( aPath,aPathRoot:Widestring; aMask:String; Progres:TProgressFormProp );
  public
    constructor Create;
    destructor  Close;
    procedure  SyncronizeFilePath(PathFiles: TCurrFilePath;RottPath:Widestring);
  end;

procedure CloseAllSynchronizeElements;
Function SynchroniceWebSoapAll (ShowMessageError:boolean; aProges:TProgressBar; ifErrorBreak:Boolean = true) :Integer;
Function SynchroniceConstraintTableWebSoapAll ( ShowMessageError:boolean; aProges:TProgressBar; ifErrorBreak:Boolean = true ) : Integer;
Function SynchroniceIndexesTableWebSoapAll ( ShowMessageError:boolean; aProges:TProgressBar; ifErrorBreak:Boolean =False ) : Integer;

var AllElemntsStrWebSoap :TList;

implementation
uses UnitFunctWebSoap;
//******************************************************************************
Function SynchroniceWebSoapAll (ShowMessageError:boolean; aProges:TProgressBar; ifErrorBreak:Boolean) : Integer;
var i:integer;
    Res:Integer;
begin
  aProges.Max :=  AllElemntsStrWebSoap.Count;
  aProges.Position:=0;
  for i:=0 to AllElemntsStrWebSoap.Count-1 do
  begin
    res:=TStructureSynchronizeSoapWeb(AllElemntsStrWebSoap.Items[i]).SynchroniceWebSoap( ShowMessageError, false );
    aProges.Position := aProges.Position + 1;
    if (Res <> 0 ) and ( ifErrorBreak ) then break;
  end;
end;
//******************************************************************************
Function SynchroniceConstraintTableWebSoapAll ( ShowMessageError:boolean; aProges:TProgressBar; ifErrorBreak:Boolean ) : Integer;
var i:integer;
    Res:Integer;
begin
  aProges.Max := AllElemntsStrWebSoap.Count;
  aProges.Position:=0;
  for i:=0 to AllElemntsStrWebSoap.Count-1 do
  begin
    if TStructureSynchronizeSoapWeb( AllElemntsStrWebSoap.Items[i] ).ConstraintCanSyn then
    begin
      res := TStructureSynchronizeSoapWeb( AllElemntsStrWebSoap.Items[i] ).SynchroniceConstraintWebSoap( ShowMessageError, false );
      if (Res <> 0 ) and(ifErrorBreak) then break;
    end;
    aProges.Position := aProges.Position + 1;
  end;
end;
//******************************************************************************
Function SynchroniceIndexesTableWebSoapAll ( ShowMessageError:boolean; aProges:TProgressBar; ifErrorBreak:Boolean=False ) : Integer;
var i:integer;
    Res:Integer;
begin
  aProges.Max := AllElemntsStrWebSoap.Count;
  aProges.Position:=0;
  for i:=0 to AllElemntsStrWebSoap.Count-1 do
  begin
    res := TStructureSynchronizeSoapWeb( AllElemntsStrWebSoap.Items[i] ).SynchroniceIndexesWebSoap( ShowMessageError, false );
    if (Res <> 0 ) and(ifErrorBreak) then break;
    aProges.Position := aProges.Position + 1;
  end;
end;
{ TStructureSynchronizeSoapWeb }
//******************************************************************************
procedure CloseAllSynchronizeElements;
var i:integer;
begin
  for i:=AllElemntsStrWebSoap.Count-1 downto 0 do
    TStructureSynchronizeSoapWeb( AllElemntsStrWebSoap.Items[i] ).Close;

  AllElemntsStrWebSoap.Clear;
end;
//******************************************************************************
constructor TStructureSynchronizeSoapWeb.Create( TableName: String; ConnectDBParam: TConnectDBParam; ConstraintCanSyn:Boolean );
begin
  New( FData );
  FConstraintCanSyn := ConstraintCanSyn;
  
  FTableName := TableName;
  FConnectDBParam := ConnectDBParam;
  SetLength( self.FConstraints_FK, 0 );
  FFieldsSelfTable := TStringList.Create;

  FFieldKod := GetFieldIdName( FConnectDBParam.PathDB, FConnectDBParam.UID, FConnectDBParam.Password, TableName );

  FData^.TableName :=FTableName;
  FData^.PrimariKeyFieldName:=FFieldKod;

  FReadStructureTableFields;
  FReadSelfForeignKey;
  FReadSelfIndexes;

  AllElemntsStrWebSoap.Add( self );
end;
//******************************************************************************
destructor TStructureSynchronizeSoapWeb.Close;
var IndMasAll:Integer;
begin
  IndMasAll := AllElemntsStrWebSoap.IndexOf( self );
  if IndMasAll <> -1 then
    AllElemntsStrWebSoap.Delete( IndMasAll );
    
  FFieldsSelfTable.Free;
  Dispose( FData );
end;
//******************************************************************************
procedure TStructureSynchronizeSoapWeb.FReadSelfForeignKeyFromDataset(Dataset:TDataset);
var len:Integer;
begin
  Dataset.First;
  while not Dataset.Eof do
  begin
    len := Length ( self.FConstraints_FK );
    SetLength( self.FConstraints_FK, len+1 );

    self.FConstraints_FK[len].ConstraintName := Trim( Dataset.FieldByName( 'constraint_name' ).AsString );

    self.FConstraints_FK[len].TableName :=  self.FTableName;
    self.FConstraints_FK[len].FieldName :=  Trim( Dataset.FieldByName( 'FieldName' ).AsString );
    self.FConstraints_FK[len].ParentTable :=  Trim( Dataset.FieldByName( 'ForeignTableName' ).AsString );
    self.FConstraints_FK[len].ParentTableKey :=  Trim( Dataset.FieldByName( 'ForeignFieldName' ).AsString );
    self.FConstraints_FK[len].ConstraintType :=  Trim( Dataset.FieldByName( 'Constraint_type' ).AsString );
    if CompareText( Trim(Dataset.FieldByName( 'DeleteRule' ).AsString) , 'CASCADE')=0 then
      self.FConstraints_FK[len].IsCascadeDelete:=1
    else
      self.FConstraints_FK[len].IsCascadeDelete:=0;
    Dataset.Next;
  end;
end;
//******************************************************************************
procedure TStructureSynchronizeSoapWeb.FReadSelfIndexesFromDataset(Dataset:TDataset);
var len:Integer;
begin
  Dataset.First;
  while not Dataset.Eof do
  begin
    len := Length ( self.FIndexes_Tbl );
    SetLength( self.FIndexes_Tbl, len+1 );

    self.FIndexes_Tbl[len].IndexName := Trim( Dataset.FieldByName( 'INDEX_NAME' ).AsString );
    self.FIndexes_Tbl[len].TableName := self.FTableName;
    self.FIndexes_Tbl[len].Description := Trim( Dataset.FieldByName( 'DESCRIPTION' ).AsString );
    self.FIndexes_Tbl[len].FieldName := Trim( Dataset.FieldByName( 'FIELD_NAME' ).AsString );
    self.FIndexes_Tbl[len].FieldIndex := Dataset.FieldByName( 'FIELD_POSITION' ).asInteger;

    Dataset.Next;
  end;
end;
//******************************************************************************
procedure TStructureSynchronizeSoapWeb.FReadSelfForeignKeyIB;
var ConstraintDB:TIBQuery;
begin
  try
    ConstraintDB:= GetConstraintsForTable( FConnectDBParam.PathDB, FConnectDBParam.UID, FConnectDBParam.Password, self.FTableName );
    FReadSelfForeignKeyFromDataset( ConstraintDB );
  finally
    DestroyDS(ConstraintDB);
  end;
end;
//******************************************************************************
procedure TStructureSynchronizeSoapWeb.FReadSelfIndexesIB;
var IndexesDB : TIBQuery;
begin
  try
    IndexesDB := GetIndexesForTable( FConnectDBParam.PathDB, FConnectDBParam.UID, FConnectDBParam.Password, self.FTableName );
    FReadSelfIndexesFromDataset( IndexesDB );
  finally
    DestroyDS(IndexesDB);
  end;
end;
//******************************************************************************
procedure TStructureSynchronizeSoapWeb.FReadSelfForeignKey;
begin
  FReadSelfForeignKeyIB;
end;
//******************************************************************************
procedure TStructureSynchronizeSoapWeb.FReadSelfIndexes;
begin
  FReadSelfIndexesIB;
end;
//******************************************************************************
procedure TStructureSynchronizeSoapWeb.FReadStructureTableFields;
var i:integer;
    len:integer;
    IbFieldQuery:TIBQuery;
begin
  if (self.FTableName = '')or( self.FFieldKod = '' ) then exit;

  IbFieldQuery:= GetFieldName( FConnectDBParam.PathDB, FConnectDBParam.UID, FConnectDBParam.Password, self.FTableName );
  try
    while not IbFieldQuery.Eof do
    begin
      len := Length( FData.Fields );
      SetLength( FData.Fields , Len+1);

      FData.Fields[len].FieldName := Trim( IbFieldQuery.FieldByName( 'fieldName' ).AsString );
      FData.Fields[len].Description := Trim( IbFieldQuery.FieldByName( 'Description' ).AsString );
      FData.Fields[len].FieldSize := IbFieldQuery.FieldByName( 'fieldSize' ).AsInteger ;
      FData.Fields[len].FieldType := Trim( IbFieldQuery.FieldByName( 'fieldType' ).AsString );
      FData.Fields[len].isNull    := IbFieldQuery.FieldByName( 'ISNULL' ).AsInteger ;

      IbFieldQuery.Next;
    end;
  finally
    DestroyDS( IbFieldQuery );
  end;
end;
//******************************************************************************
function TStructureSynchronizeSoapWeb.SynchroniceWebSoap( ShowMessageError:boolean; ShowLoadCursor: Boolean ):Integer;
var FunCallSoapWeb:TFunctCallSoapWeb;
begin
  try
   FunCallSoapWeb := TFunctCallSoapWeb.Create( nil, self.FConnectDBParam, ShowLoadCursor );
   result := FunCallSoapWeb.SynchronizeStructureTable( self.FData, ShowMessageError );

  finally
   FunCallSoapWeb.Close;
  end;
end;
//******************************************************************************
function TStructureSynchronizeSoapWeb.SynchroniceConstraintWebSoap( ShowMessageError:boolean; ShowLoadCursor: Boolean ):Integer;
var FunCallSoapWeb:TFunctCallSoapWeb;
begin
  try
   FunCallSoapWeb := TFunctCallSoapWeb.Create( nil, self.FConnectDBParam, ShowLoadCursor );
   result := FunCallSoapWeb.SynchronizeConstraint( self.FConstraints_FK, ShowMessageError );
   
  finally
   FunCallSoapWeb.Close;
  end;
end;
//******************************************************************************
function TStructureSynchronizeSoapWeb.SynchroniceIndexesWebSoap( ShowMessageError:boolean; ShowLoadCursor: Boolean ):Integer;
var FunCallSoapWeb:TFunctCallSoapWeb;
begin
  try

   FunCallSoapWeb := TFunctCallSoapWeb.Create( nil, self.FConnectDBParam, ShowLoadCursor );

   result := FunCallSoapWeb.SynchronizeIndexes( self.FIndexes_Tbl, ShowMessageError );
  finally
   FunCallSoapWeb.Close;
  end;
end;
//******************************************************************************
{ TFilePathSynchronizeSoapWeb }

destructor TFilePathSynchronizeSoapWeb.Close;
begin
 //******
end;

constructor TFilePathSynchronizeSoapWeb.Create;
begin
  self.FPathFiles.FilePath := '';
  self.FPathFiles.mask := '';
end;

function TFilePathSynchronizeSoapWeb.FSynchronizeCurrentFileName( aFileName, aPathRoot:String ):Integer;
var FunCallSoapWeb:TFunctCallSoapWeb;
    aDBConnNull:TConnectDBParam;
begin
  try
    aDBConnNull.UID:='';
    aDBConnNull.Password:='';
    aDBConnNull.PathDB:='';
    aDBConnNull.ADOConnection:=nil;
    aDBConnNull.IBDatabaseConnection:=nil;
    aDBConnNull.DatabaseConnection:=nil;

    FunCallSoapWeb := TFunctCallSoapWeb.Create( nil, aDBConnNull, True );
    result := FunCallSoapWeb.SynchronizeFile( aFileName,aPathRoot, True );
   
  finally
   FunCallSoapWeb.Close;
  end;
end;

procedure TFilePathSynchronizeSoapWeb.FSynchronizeCurrentPathFolder( aPath, aPathRoot:Widestring; aMask:String; Progres:TProgressFormProp );
var i:Integer;
    aList:TStringList;
    resAction:Integer;
begin
  try
    aList := TStringList.Create;
    FindSubDirFiles( aPath, aMask, aList, True, 1 );
    Progres.ProgressBar.Max := aList.Count;
    for i:=0 to aList.Count-1 do
    begin
      if ( ExtractFileName( aList.Strings[i] ) <> '')and
         ( CompareText( ExtractFileName( aList.Strings[i]), 'Thumbs.db' )<>0 ) then
        resAction := FSynchronizeCurrentFileName( aList.Strings[i], aPathRoot );

      Progres.ProgressBar.Position := Progres.ProgressBar.Position + 1;
      Progres.ProgressCaption.Repaint;
    end;
  finally
    aList.Free;
  end;
end;

procedure  TFilePathSynchronizeSoapWeb.SyncronizeFilePath(PathFiles: TCurrFilePath;RottPath:Widestring);
var i:Integer;
    ListDir : TStringList;
    CurrMask: String;
    Progres : TProgressFormProp;
begin
  Progres := ShowProgress( DefCaptionSynchronizeFile , 0 );

  try
    if DirectoryExists( PathFiles.FilePath ) then
    begin
      try
        if PathFiles.mask<>'' then
          CurrMask :=PathFiles.mask
        else CurrMask :='*.*';

        ListDir:=TStringList.Create;
        FindSubDirFiles( PathFiles.FilePath, CurrMask, ListDir, True, 0 );
        //ListDir.SaveToFile('D:\Save.txt');
        for i:=0 to ListDir.Count-1 do
        begin
          if (ListDir.Strings[i]<>'.') and (ListDir.Strings[i]<>'..') then
            FSynchronizeCurrentPathFolder( ListDir.Strings[i],RottPath, CurrMask, Progres );
        end;
      finally
        ListDir.Free;
      end;
    end;
    
  finally
    ClosedProgress(Progres.FormProgres);
  end;
end;  


initialization
  AllElemntsStrWebSoap:=TList.Create;

finalization
  AllElemntsStrWebSoap.Free;
end.

  FieldType : WideString;

  VARYING  -  String
  BLOB     -  Blob      (8)
  TIMESTAMP - DataTime  (8)
  SHORT     - SmallInt  (2)
  LONG      - Integer   (4)
  DOUBLE   -  Double    (8)
  TEXT     -  Char      (1)
