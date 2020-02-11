unit UnitVehiclePlace;

interface
uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls,Contnrs, Forms, Dialogs,Variants, cxGraphics , cxClasses , Math, cxGridTableView, cxStyles ,
   ImgList, ExtCtrls, ComCtrls, StdCtrls, ActnList , Buttons, cxRichEdit,cxEdit,cxGridBandedTableView,DB,DateUtils,cxGridCustomTableView ,cxGrid ,
   MyHint, UnitProc, UnitTimeLiner, Core,FrmProgress,cxFilter ;

Type
 TArrIndex = array of Integer;
 
 TDBShemaVehicleDetail = record
    Elem : TDBShema;
    FiedlPlace :string;
    FiedlDirection :string;
    FiedlCol :string;
    FieldType : string;
    FieldRow : string;
    FieldALEVEL : string;
    FieldUsedColor:string;
 end;

 TCellVehicleObj = Packed Record
    idDetail   : Integer;
    aType      : Integer;
    VehiclePlace : String;
    VehiclePlaceDirect : variant;

    IdUsed     :Variant;
    ColorUsed  :TColor;
 end;
 PCellVehicleObj = ^TCellVehicleObj;

 TCellObjectColor = record
    VehicleTypePlace : Variant;
    aColor : TColor;
    aName  : WideString;
    aHint  : WideString;

    ImageList : TImageList;
    DirectionIndex : array of Integer;
    DirectionImageIndex : array of Integer;
    ShowImageIndex : Integer;
 end;
 PCellObjectColor =  ^TCellObjectColor;

 TDampValueObj = record
    Col:Integer;
    Row:Integer;
    lev:Integer;
    Obj:PCellVehicleObj;
 end;
 TDampValueObjArr = array of TDampValueObj;
 TDampValueObjArrArr = array of TDampValueObjArr;

 TRowLevelCheck = record
  Row:Integer;
  Lev:Integer;
 end;
 TRowLevelCheckArr = array of TRowLevelCheck;

 TVehiclePlaceCheck = record
  Place:String;
 end;
 TTVehiclePlaceCheckArr = array of TVehiclePlaceCheck;
 TArrayOfArrInt = Array of array of Integer;

 TVehiclePlaceView = class
  private
    FView : TcxGridBandedTableView;
    FVehicleDB : TDBShemaVehicleDetail;
    FShowHint : Boolean;
    FShemaChange:Boolean;

    FCellColorObjectList :TList;
    PersonalDrawCell : TcxGridTableDataCellCustomDrawEvent;
    FHeightRow:Integer;

    FHintColor : TColor;
    FHintBorder :TColor;

    FLevelName : String;

    FDefColorText : TColor;
    FDefColorSelection : TColor;
    FDefColorFontSelection :TColor;
    FColumnWidth :Integer;

    FNumberOrChar :Integer;
    FByHorizont   :Boolean;

    FOpositDirection :boolean;
    FNumbOnLevel :Integer;
    FRenumberUpDown :boolean;

    FGroupColumn:TcxGridBandedColumn;
    FGroupCurrValue:Variant;
    FRefreshFunction : TNotifyEvent;

  procedure FDisposeCellMem;
  procedure FDisposeMemForBand( BandIndex:Integer );
  procedure FDisposeRowCellMem( Row, ColStart, ColEnd:Integer );
  Function  FAddRow:Integer;
  procedure ViewNameGetCellHint(
            Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
            ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
            var AHintText: TCaption; var AIsHintMultiLine: Boolean;
            var AHintTextRect: TRect );

  Function  FCreateColumn( aBand:TcxGridBand; aColLevel:Integer; Position:Integer = -1 ):TcxGridBandedColumn;
  function  FGetLevelName( aLevel:Integer ) : string;
  function  FFindBandByLevel( aLevel:Integer ):TcxGridBand;
  function  FMakeBandLevel( aLevel:Integer ):TcxGridBand;
  function  FCheckEmptyRow(RowIndex:Integer):Boolean;
  function  FDelEmptyRow:Boolean;
  procedure FReadDataDB( ByBand:Boolean=True );
  procedure FClearAll;
  procedure FClearEmptyBands;

  function  FGetRowIndex( RowValue:Integer ):Integer;
  function  FGetGroupRowCountByLev( lev:Integer ):Integer;
  function  FGetGroupRowIndex( lev,RowValue:Integer ):Integer;
  function  FGetColIndex( Band:TcxGridBand; ColValue:Integer ):TcxGridBandedColumn;
  function  FMakeCurrCellObj( VehicleDetail: TDBShemaVehicleDetail ) : PCellVehicleObj;
  function  FMakeCurrRow( VehicleDetail: TDBShemaVehicleDetail ) : Integer;
  procedure FViewFromDamp( Damp:TDampValueObjArr );
  function  FMakeCurrViewCell( alev,aRow,aCol:Integer; CellObj : PCellVehicleObj ) : Integer;
  procedure FSetFocuceCell( Col, Row:Integer; TopRowIndex:Integer=-1);
  function  FGetCol(Col:Integer):TcxGridBandedColumn;
  function  FFindViewCol( aBandIndex, aVehicleCol :Integer ):TcxGridBandedColumn;

  procedure ViewCustomDrawCell( Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);

  function  FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
  function  FGetColorSelection(Sender: TcxCustomGridTableView):TColor;
  function  FGetColorFontSelection(Sender: TcxCustomGridTableView):TColor;

  function  FCreateObjCell( idDetail : Integer; aType:Integer;
                            VehiclePlace:String;
                            VehiclePlaceDirect : variant; aColorUsed:TColor ) : PCellVehicleObj;

  procedure FDrawListTexT( ACanvas: TcxCanvas; AreaDrawText:TRect; VisibleWidth:Integer; aText:Widestring );
  function  FGetImageIndex( aImageList:TImageList; ArrValue,ArrImageIndex:array of integer;  CurrValue:variant ):Integer;
  procedure FDisposeMemCellColorObjectList;
  function  FGetColorObjectPlace( VehiclePlace:Variant ):PCellObjectColor;
  procedure FMakeSelectedTo( aType:Integer; VehicleTypePlace:String; Direction:variant  );
  procedure FMakeSelectedDirectionTo( Direction:Integer );
  function  FGeSelDirection:Integer;

  procedure FRenumberPlacesToBandByColumns( var StartNumber:Integer;var ChStart :Char;  Band:TcxGridBand; NumberOrChar:integer;OpositDirection:Boolean );
  procedure FRenumberWithCharPlacesToBandByRows( var StartNumber:Integer;var ChNumber:Integer; Band:TcxGridBand; NumberOrChar:integer;OpositDirection:Boolean );

  procedure FMakeTemplate( ForLevel, RowCount, ColCount:Integer );
  procedure FRenumberPlaces;
  procedure FReadDataToDampFromDB(var Damp:TDampValueObjArr);
  procedure FReadDataToDampFromView(var Damp: TDampValueObjArr);
  Function  FCountAllPlace( Damp:TDampValueObjArr;StartIndex:Integer=0 ):Integer;
  Function  FFindCountEmptyPlace( Damp:TDampValueObjArr;StartIndex:Integer=0 ):Integer;
  Function  FFindCountEmptyPlaceWithNoHole( Damp:TDampValueObjArr; StartIndex:Integer=0 ):Integer;
  Function  FfindRowDampIndexForPlaceWithHole( Damp:TDampValueObjArr;  IndexDamp:Integer=0 ):Integer;
  Function  FFindRowDampIndexForPlaceWithHoleAndFree( CountFree : Integer; Damp:TDampValueObjArr; CurrFindIndx:Integer=-1 ):Integer;
  Function  FFindDampIndexBy(Col,Row,lev:Integer; Damp:TDampValueObjArr):Integer;
  procedure FAddObjToDamp( aObj:TDampValueObj; var aTempDamp:TDampValueObjArr; ReservPlace:Boolean= false  );
  Function  FFindAllPlacesForCurrPlace(CurrIndexDamp:Integer; Damp:TDampValueObjArr; Revers:Boolean=True; FindInLine:Boolean=false ):TDampValueObjArr;

  Function  FFindIndexDampForObj(aTempDamp:TDampValueObj; Damp:TDampValueObjArr ):Integer;
  Procedure FAddToDamp( Lev, Col,Row:Integer; PObjCell : PCellVehicleObj; var Damp:TDampValueObjArr);

  Function FPlaceIsNearRow( IndexDampPlace,IndexDumpCheckPlace : Integer; Damp:TDampValueObjArr):Boolean;
  Function FPlaceIsNear( IndexDampPlace , IndexDumpCheckPlace : Integer; Damp:TDampValueObjArr ):Boolean;

  Function FFindPlacesNearFromTempDamp( StartIndexDump:Integer; TempDamp,Damp:TDampValueObjArr;JustPlaceWithHole:Boolean=False;CountFree:integer=-1 ): TDampValueObjArr;

  Function FCheckObjIsFree(aObj:TDampValueObj):Boolean;
  procedure FSetReservedObj(aObj:TDampValueObj);
  Function FCheckColRightHole( IndexDampPlace:Integer;  Damp:TDampValueObjArr ):Boolean;
  Function FCheckRowFoHole( Row, lev:Integer;  Damp:TDampValueObjArr ):Boolean;
  Function FCheckDampForRowNotHoleArr( TempDampAll:TDampValueObjArrArr; Damp:TDampValueObjArr ) : Integer;
  Function FCheckDampForRowNotHole( TempDamp,Damp:TDampValueObjArr ):Boolean;
  function FFindPrevColForIndexDump(IndexDamp:Integer; Damp:TDampValueObjArr ):Integer;
  function FFindNextColForIndexDump(IndexDamp:Integer; Damp:TDampValueObjArr ):Integer;
  function FFindLastColForIndexDump(IndexDamp:Integer; Damp:TDampValueObjArr ):Integer;
  Function FFindCountPlaceInRow(IndexDampPlace:Integer; Damp:TDampValueObjArr):Integer;
  Function FFindCountPlaceFreeInRow( IndexDampPlace:Integer; Damp:TDampValueObjArr):Integer;

  procedure FAddToResultDampArr( aDamp:TDampValueObjArr;var AllDamp:TDampValueObjArrArr );
  procedure FAddToResultDamp( aDampObj:TDampValueObj;var AllDamp:TDampValueObjArr;SetReserved:Boolean=False );

  procedure FFindPlaceForFreeAllParam( Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArr;StartIndexDump:Integer=0; JustPlaceWithHole:Boolean=False );
  procedure FFindPlaceForFree( FreePlace:Integer; Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArrArr; StartIndexDump:Integer=0 );
  procedure FFindPlaceForFreeNearHole( FreePlace:Integer; Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArrArr; StartIndexDump:Integer=0 );
  procedure FFindPlaceForFreeAll( Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArr;StartIndexDump:Integer=0);

  procedure FFindPlaceForFreeWithHole( FreePlace:Integer; Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArrArr; StartIndexDump:Integer=0 );
  function FCheckPlaceAfter( StartVehiclePlace,CurrVehiclePlace:String; Damp:TDampValueObjArr ):boolean;
  function FCheckPlaceAfterTempDamp( StartVehiclePlace:String; TempDamp, Damp:TDampValueObjArr ):boolean;

  function FCheckObjIsNearArrObj(  DampObj:TDampValueObj;ArrPlace:TDampValueObjArr; Damp:TDampValueObjArr ):Boolean;
  function FFindFreeObjIsNearInArrObj( FreePlace:Integer; ArrPlace:TDampValueObjArr; Damp:TDampValueObjArr ):TDampValueObjArr;

  function FCheckPlaceBeforeHole(DampObj:TDampValueObj;Damp:TDampValueObjArr ):Boolean;
  function FCheckPlaceOneOnPrevHole( DampObj:TDampValueObj;Damp:TDampValueObjArr; FreePlace:Integer ):Boolean;
  function FFindBestIndexDamp( StartIndexDump:Integer; ShemaDamp:TDampValueObjArrArr; Damp:TDampValueObjArr;Var CountDifRowMin:integer;FreePlace:Integer=-1 ):Integer;

  procedure FindPlaceForFreeInHole( AllFreePlace,CurrFreePlace, StartIndexDump:Integer; Damp:TDampValueObjArr; var ResultPlace:TDampValueObjArr  );
  procedure FStartFindPlaceForFree( FreePlace, StartIndexDump:Integer;Damp:TDampValueObjArr; var ResultPlace:TDampValueObjArr  );
  //function FGetCountDifRowForAllArrDamp(AllShemaDamp:TDampValueObjArrArr):Integer;
  function FFindIndexMapForVehiclePlace( aVehiclePlace:String; Damp:TDampValueObjArr  ):Integer;
  function FGetCountDifPlaceInShema( AllShemaDamp:TDampValueObjArrArr ):Integer;
  procedure FSaveDataToDB( Damp : TDampValueObjArr );
  procedure FSaveDataToDBBySql( Damp : TDampValueObjArr );
  procedure View1LeftPosChanged(Sender: TObject);

  function  FGetDelSql( id:Variant ):string;
  function  FGetUpdateSql( lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant ):string;
  function  FGetInsertSql(  lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant ):string;
  function  FAddToDBRowDetailCellValueSql( lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant ):String;
  function  FAddToDBRowDetailCellValue( lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant  ):Variant;

  public

  constructor Create( aView: TcxGridBandedTableView; VehicleDB : TDBShemaVehicleDetail;  aColumnWidth:Integer = 40; ShowHint:Boolean =True );
  destructor Destroy;

  procedure View;
  procedure ViewByGroupColumn;
  procedure ClearAll;
  procedure Repaint;
  procedure SetRefreshFunction(aRefreshFunction:TNotifyEvent);
  procedure RenumberPlaces(  NumberOrChar:integer; ByHorizont:Boolean; OpositDirection:Boolean= False; NumbOnLevel:Integer=0; UpDown:Boolean=False );

  procedure AddRow(Count:Integer=1);
  procedure FReindexColumnPosition;
  procedure AddCol(Count:Integer=1);
  procedure DelRows;
  procedure DelColumns;
  procedure ClearSelectedValue;

  procedure SaveData( TypeSave:Integer );
  procedure SetuseId( UseId:variant );
  procedure ViewByStrData( aLevel:Integer; aStr:String );
  function  GetSelectionDirect:Variant;
  procedure AddObjectPlaceColor(  VehicleTypePlace:Integer; VehicleCol : TColor; aName, aHint:widestring;
                                  aImageList : TImageList;
                                  aDirectionIndex, aDirectionImageIndex:array of Integer; aShowImageIndex:Integer=-1 );

  procedure SetHintParam( Color:TColor=clYellow; BorderColor:TColor=-1 );
  procedure SetLevelParam( NameLevel:string );
  procedure MakeSelectedToObject( aType:Integer; Direction:Integer=-1 );
  procedure InvertSelectedDirection;
  procedure SetDirectionForSelected(Direct:Integer);
  procedure AddLevel( RowCount, ColCount:Integer );
  function  CanExChangeLevelBySelectedColumn:Boolean;
  function  ExChangeLevelBySelectedColumn:Boolean;
  function  DeleteLevelBySelectedColumn:Boolean;
  Procedure RefreshLevelCaption;
  procedure FreeMemFromDamp( Damp:TDampValueObjArr );
  function  GetCountMaxColLevel:Integer;
  function  GetCountRow:Integer;
  function  ShemaIs:Boolean;
  function  FindPlaceForFree( FreePlace:Integer; StartPlace:String;SetReserved:Boolean ):TDampValueObjArr;
  procedure UnreservedPlace(aDamp:TDampValueObjArr);
  Function  CountAllPlaceFromView:Integer;
  function  ShemaIsChange:Boolean;
end;

implementation

uses cxCustomData;

{ TVehiclePlaceView }

destructor TVehiclePlaceView.Destroy;
begin
  FDisposeCellMem;
  //FListShowFields.Free;
  FDisposeMemCellColorObjectList;
end;
//******************************************************************************
constructor TVehiclePlaceView.Create( aView: TcxGridBandedTableView; VehicleDB : TDBShemaVehicleDetail;  aColumnWidth:Integer = 40; ShowHint:Boolean =True  );
begin
  self.FView := aView;
  FShowHint := ShowHint;

  FVehicleDB := VehicleDB;
  self.FCellColorObjectList := TList.Create;

  FNumberOrChar := 0;
  FByHorizont := True;

  FOpositDirection := False;
  FRenumberUpDown := False;
  FNumbOnLevel:= 0;

  FDefColorText := clBlack;
  FDefColorSelection :=clHighlight;
  FDefColorFontSelection := clWhite;
  FColumnWidth  := aColumnWidth;

  FGroupColumn:=nil;
  FGroupCurrValue:=null;

  PersonalDrawCell:=aView.OnCustomDrawCell;
  aView.OnCustomDrawCell := ViewCustomDrawCell;
  aView.OnLeftPosChanged := View1LeftPosChanged;
  aView.OnTopRecordIndexChanged := View1LeftPosChanged;
  aView.OptionsView.NoDataToDisplayInfoText:=' ';
  FShemaChange:=False;
  FRefreshFunction := nil;
end;
//******************************************************************************
procedure TVehiclePlaceView.View1LeftPosChanged(Sender: TObject);
begin
  self.Repaint;
end;
//******************************************************************************
procedure TVehiclePlaceView.AddObjectPlaceColor( VehicleTypePlace:Integer; VehicleCol : TColor; aName, aHint : widestring;
                                                 aImageList : TImageList;
                                                 aDirectionIndex, aDirectionImageIndex:array of Integer; aShowImageIndex:Integer=-1 );
var i:Integer;
    CellObjColor : PCellObjectColor;
begin
  New(CellObjColor);

  CellObjColor^.VehicleTypePlace := VehicleTypePlace;
  CellObjColor^.aColor := VehicleCol;
  CellObjColor^.aName  := aName;
  CellObjColor^.aHint  := aHint;

  CellObjColor.ImageList := aImageList;
  CellObjColor.ShowImageIndex := aShowImageIndex;

  SetLength( CellObjColor.DirectionIndex , Length(aDirectionIndex) );
  SetLength( CellObjColor.DirectionImageIndex , Length(aDirectionIndex) );

  for i:=0 to Length( CellObjColor.DirectionIndex )-1 do
  begin
    CellObjColor.DirectionIndex[i] := aDirectionIndex[i];
    CellObjColor.DirectionImageIndex[i] := aDirectionImageIndex[i];
  end;

  FCellColorObjectList.Add( CellObjColor );
end;
//******************************************************************************
procedure TVehiclePlaceView.FDisposeMemCellColorObjectList;
var i : Integer;
begin
  for i := 0 to FCellColorObjectList.Count -1 do
    Dispose( PCellObjectColor(FCellColorObjectList.Items[i]) );

  FCellColorObjectList.Free;
end;
//******************************************************************************
function TVehiclePlaceView.FFindBandByLevel( aLevel:Integer ):TcxGridBand;
var i:Integer;
begin
  result := nil;
  for i:=0 to self.FView.Bands.Count - 1 do
  if self.FView.Bands.Items[i].Tag = aLevel then
  begin
    result := self.FView.Bands.Items[i];
    Break;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.FGetLevelName(aLevel:Integer):string;
begin
  result := Trim( self.FLevelName+' '+IntToStr( aLevel + 1 ) );
end;
//******************************************************************************
function TVehiclePlaceView.FMakeBandLevel( aLevel:Integer ):TcxGridBand;
begin
  result := FFindBandByLevel( aLevel );

  if result = nil then
  begin
    result := Self.FView.Bands.Add;
    result.Tag := aLevel;
  end;

  Result.Caption := FGetLevelName ( aLevel );
end;
//******************************************************************************
Procedure TVehiclePlaceView.RefreshLevelCaption;
var i : Integer;
begin
  for i := 0 to self.FView.Bands.Count - 1 do
  begin
    self.FView.Bands.Items[i].Caption := FGetLevelName( i ) ;
    self.FView.Bands.Items[i].Tag := i;
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FreeMemFromDamp( Damp:TDampValueObjArr );
var i:Integer;
begin
  for i:=0 to Length(Damp)-1 do
    Dispose( Damp[i].Obj );

  SetLength(Damp,0);
end;
//******************************************************************************
procedure TVehiclePlaceView.FDisposeRowCellMem( Row, ColStart, ColEnd:Integer );
var Col :Integer;
    CeilValue:Variant;
    PObjCell : PCellVehicleObj;
begin
  for Col := ColStart to ColEnd do
  begin
    CeilValue:= self.FView.DataController.Values[ Row, Col ];

    if ( self.FView.Columns[col].Tag >= 0 ) and
       ( CeilValue<>Null) and (CeilValue<>'')  then
    begin
      PObjCell:= PCellVehicleObj( Integer( CeilValue ) );
      Dispose(PObjCell);
      self.FView.DataController.Values[Row,Col] := null;
    end;
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FDisposeCellMem;
var Row:Integer;
begin
 try
   self.FView.BeginUpdate;

   for Row:=0 to self.FView.DataController.RecordCount-1 do
     FDisposeRowCellMem( Row, 0, self.FView.ColumnCount-1 );

 finally
   self.FView.EndUpdate;
 end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FDisposeMemForBand( BandIndex:Integer );
var Row , ColStart, ColEnd : integer;
begin
  ColStart := self.FView.Bands.Items[BandIndex].Columns[0].Position.Item.Index ;
  ColEnd := self.FView.Bands.Items[BandIndex].Columns[ self.FView.Bands.Items[BandIndex].ColumnCount-1 ].Position.Item.Index;

  for Row:=0 to self.FView.DataController.RecordCount - 1 do
    FDisposeRowCellMem( Row, ColStart, ColEnd );
end;
//******************************************************************************
procedure TVehiclePlaceView.ClearAll;
begin
  FClearAll;
end;
//******************************************************************************
function TVehiclePlaceView.FFindViewCol( aBandIndex, aVehicleCol :Integer ):TcxGridBandedColumn;
var i:Integer;
begin
  result := nil;

  if self.FView.Bands.Items[aBandIndex].ColumnCount -1 < aVehicleCol then Exit
  else result := self.FView.Bands.Items[aBandIndex].Columns[aVehicleCol];
end;
//******************************************************************************
function TVehiclePlaceView.FCreateObjCell( idDetail : Integer;  aType:Integer;
                                           VehiclePlace:String;
                                           VehiclePlaceDirect : variant; aColorUsed:TColor ):PCellVehicleObj;
begin
  New(result);

  Result.idDetail := idDetail;

  result.aType  := aType;
  result.VehiclePlace := VehiclePlace;

  result.IdUsed := null;
  Result.ColorUsed := aColorUsed;

  result.VehiclePlaceDirect := VehiclePlaceDirect;
end;
//******************************************************************************
Function TVehiclePlaceView.FAddRow:Integer;
begin
  result := Self.FView.DataController.AppendRecord;
  if FGroupColumn<> nil then
    Self.FView.DataController.Values[ result, FGroupColumn.Index]:= FGroupCurrValue;

  Self.FView.DataController.Post;
end;
//******************************************************************************
procedure TVehiclePlaceView.ViewNameGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
var PObjCell: PCellVehicleObj;
    aText:WideString;
    CellObjectColor : PCellObjectColor;
begin

  if ( ACellViewInfo.item.Tag>=0 ) and
     ( ACellViewInfo.Value <> null ) and
     ( ACellViewInfo.Value<>'' )and
     ( FShowHint ) then
  begin
    PObjCell:= PCellVehicleObj( Integer( ACellViewInfo.Value ) );

    CellObjectColor := FGetColorObjectPlace( PObjCell^.aType );
    if (CellObjectColor <> nil) then
    begin

      if CellObjectColor^.aHint <>'' then
        aText :=  CellObjectColor^.aHint +' '+ varToStr( PObjCell^.VehiclePlace )
      else aText := CellObjectColor^.aHint;

    end;

    AHintText:= ( aText );
  end;

end;
//******************************************************************************
procedure TVehiclePlaceView.SetRefreshFunction(aRefreshFunction:TNotifyEvent);
begin
  FRefreshFunction :=aRefreshFunction;
end;
//******************************************************************************
Function TVehiclePlaceView.FcreateColumn( aBand:TcxGridBand ; aColLevel:Integer; Position:Integer = -1 ):TcxGridBandedColumn;
begin
  result := Self.FView.CreateColumn();
  result.Position.BandIndex  := aBand.Index;
  result.HeaderAlignmentHorz := taCenter;
  result.Options.Filtering   := False;
  result.Options.Sorting     := False;
  result.Options.Moving      := False;
  result.MinWidth := Self.FColumnWidth;
  result.Width := Self.FColumnWidth;
  result.Tag := aColLevel;
  if Position <> -1 then result.Position.ColIndex := Position;

  result.OnGetCellHint  := self.ViewNameGetCellHint;
end;
//******************************************************************************
function TVehiclePlaceView.FGetCol(Col:Integer):TcxGridBandedColumn;
begin
  result := self.FView.Columns[Col];
  { for i:=0 to self.FView.ColumnCount-1 do
   if self.FView.Columns[i].Tag = Col then
   begin
     result :=self.FView.Columns[i];
     Break;
   end; }
end;
//******************************************************************************
procedure TVehiclePlaceView.FSetFocuceCell( Col, Row:Integer; TopRowIndex:Integer=-1);
begin
  FGetCol(Col).Selected := True;
  
  if not self.FView.IsUpdateLocked then
    FGetCol(Col).Focused := True;
  self.FView.DataController.FocusedRowIndex := Row ;

  if TopRowIndex <> -1 then
    self.FView.Controller.TopRowIndex:= TopRowIndex;
end;
//******************************************************************************
function TVehiclePlaceView.FGetRowIndex( RowValue:Integer ):Integer;
begin
  if RowValue >= self.FView.DataController.RecordCount then
    while RowValue > self.FView.DataController.RecordCount-1 do result := FAddRow
  else result := RowValue ;
end;
//******************************************************************************
function TVehiclePlaceView.FGetGroupRowCountByLev( lev:Integer ):Integer;
var i:Integer;
begin
  result:=0;
  for i:=0 to self.FView.DataController.RecordCount-1 do
    if ( self.FView.DataController.Values[i, self.FGroupColumn.Index] = FGetLevelName(Lev) ) then Inc(result);
end;
//******************************************************************************
function TVehiclePlaceView.FGetGroupRowIndex( lev,RowValue:Integer ):Integer;
var i:Integer;
    RowIndex:Integer;
begin
  Result:=-1;
  RowIndex := -1;
  if lev<0 then Exit;
  
  for i:=0 to self.FView.DataController.RecordCount-1 do
  begin
    if ( self.FView.DataController.Values[i, self.FGroupColumn.Index] = FGetLevelName(Lev) ) then Inc(RowIndex);

    if RowIndex = RowValue then
    begin
      result:=i;
      Break;
    end;
  end;

  if Result =-1 then
    while RowValue > FGetGroupRowCountByLev(lev)-1 do result := FAddRow;
end;
//******************************************************************************
function TVehiclePlaceView.FGetColIndex( Band:TcxGridBand; ColValue:Integer ):TcxGridBandedColumn;
begin
  result := FFindViewCol( Band.Index, ColValue );

  if result = nil then
  begin
    while ColValue>Band.ColumnCount-1  do
    begin
      result := FFindViewCol( Band.Index, ColValue );
      if result = nil then result := FcreateColumn( Band, 0 );
    end;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.FMakeCurrCellObj( VehicleDetail: TDBShemaVehicleDetail ) : PCellVehicleObj;
var Lev : Integer;
    ColorUsed:TColor;
    VehiclePlace : String;
    VehiclePlaceDirect : variant;
begin
  Result := nil;

  if VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FiedlCol ).AsInteger <0 then exit;
  if VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FieldALEVEL ).AsInteger < 0 then exit;
  Lev := VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FieldALEVEL ).AsInteger;
  VehiclePlace := VehicleDetail.Elem.DB.fieldByName( VehicleDetail.FiedlPlace ).asString;
  VehiclePlaceDirect := VehicleDetail.Elem.DB.fieldByName( VehicleDetail.FiedlDirection ).value;

  if VehicleDetail.FieldUsedColor<>'' then
    ColorUsed := VehicleDetail.Elem.DB.fieldByName( VehicleDetail.FieldUsedColor ).AsInteger
  else ColorUsed := -1;

  result := FCreateObjCell( VehicleDetail.Elem.GetValueId  ,
                             VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FieldType ).AsInteger,
                             VehiclePlace, VehiclePlaceDirect, ColorUsed );
end;
//******************************************************************************
function TVehiclePlaceView.FMakeCurrViewCell( alev,aRow,aCol:Integer; CellObj : PCellVehicleObj ) : Integer;
var aBand:TcxGridBand;
    Row : Integer;
    Col : TcxGridBandedColumn;
begin
  if aCol<0 then exit;
  if alev < 0 then exit;

  if FGroupColumn<> nil then
  begin
    self.FGroupCurrValue := FGetLevelName(alev);
    aBand := FMakeBandLevel( 0 );
    Row := FGetGroupRowIndex( alev, aRow );
  end
  else
  begin
    aBand := FMakeBandLevel( alev );
    Row := FGetRowIndex( aRow );
  end;
  Col := FGetColIndex( aBand, aCol );

  Self.FView.DataController.Values[ Row , Col.Index ]:= Integer( PCellVehicleObj( CellObj ) );
  self.FSetFocuceCell( Col.Index , Row );

  Result := Row;
end;
//******************************************************************************
function TVehiclePlaceView.FMakeCurrRow( VehicleDetail: TDBShemaVehicleDetail ) : Integer;
var aBand:TcxGridBand;
    Row : Integer;
    Col : integer;
    Lev : Integer;
    CellObj : PCellVehicleObj;
begin
  if VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FiedlCol ).AsInteger <0 then exit;
  if VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FieldALEVEL ).AsInteger < 0 then exit;

  Lev := VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FieldALEVEL ).AsInteger;
  Row := VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FieldRow ).AsInteger;
  Col := VehicleDetail.Elem.DB.FieldByName( VehicleDetail.FiedlCol ).AsInteger;

  CellObj := FMakeCurrCellObj( VehicleDetail );
  result  := FMakeCurrViewCell( lev,Row,Col,CellObj );

  Result := Row;
end;
//******************************************************************************
procedure TVehiclePlaceView.FViewFromDamp( Damp:TDampValueObjArr );
var i:Integer;
begin
  for i:=0 to Length(Damp)-1 do
    FMakeCurrViewCell( Damp[i].lev, Damp[i].Row, Damp[i].Col, Damp[i].Obj );
end;
//******************************************************************************
procedure TVehiclePlaceView.FClearAll;
begin
  self.FDisposeCellMem;

  while Self.FView.DataController.RecordCount<>0 do
   Self.FView.DataController.DeleteRecord(0);

  Self.FView.Bands.Clear;
  Self.FView.ClearItems;
  
  self.FShemaChange:=True;
  if @FRefreshFunction<>nil then FRefreshFunction(self);
end;
//******************************************************************************
procedure TVehiclePlaceView.FMakeTemplate( ForLevel, RowCount, ColCount:Integer );
var RowValue,Row, Col : Integer;
    ViewCol : TcxGridBandedColumn;
    aBand:TcxGridBand;
    PObjCell : PCellVehicleObj;
begin
  aBand := FFindBandByLevel( ForLevel );
  if aBand = nil then Exit;

  for Col:=0 to ColCount-1 do
  begin
    ViewCol := FcreateColumn( aBand, 0 );

    for RowValue:=0 to RowCount-1 do
    begin
      PObjCell := FCreateObjCell( -1, 0, '0', '0' , -1 );
      Row := FGetRowIndex( RowValue );

      Self.FView.DataController.Values[ Row , ViewCol.Index ]:= Integer( PObjCell );
    end;

  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.AddLevel(  RowCount, ColCount:Integer );
var aBand : TcxGridBand;
    NewBandIndex:Integer;
begin
  if self.FView.Bands.Count = 0 then NewBandIndex := 0
  else  NewBandIndex := self.FView.Bands.Count;

  aBand := FMakeBandLevel( NewBandIndex );
  FMakeTemplate( aBand.Index, RowCount, ColCount );

  self.FRenumberPlaces;
end;
//******************************************************************************
procedure TVehiclePlaceView.FReadDataToDampFromDB( var Damp:TDampValueObjArr );
var Lev:Integer;
    Col:Integer;
    Row:Integer;
    PObjCell : PCellVehicleObj;
begin
  self.FVehicleDB.Elem.DB.First;

  while not self.FVehicleDB.Elem.DB.Eof do
  begin
    Lev := self.FVehicleDB.Elem.DB.FieldByName( self.FVehicleDB.FieldALEVEL ).AsInteger;
    Col := self.FVehicleDB.Elem.DB.FieldByName( self.FVehicleDB.FiedlCol ).AsInteger;
    Row := self.FVehicleDB.Elem.DB.FieldByName( self.FVehicleDB.FieldRow ).AsInteger;
    PObjCell := FMakeCurrCellObj( self.FVehicleDB );

    FAddToDamp( Lev, Col, Row ,PObjCell, Damp );
    self.FVehicleDB.Elem.DB.Next;
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FReadDataToDampFromView( var Damp:TDampValueObjArr );
var CellObj:Variant;
    PObjCell : PCellVehicleObj;
    lev:Integer;
    Col :integer;
    CurrLevCol : Integer;
    Row :Integer;
begin

  for Row :=0 to self.FView.DataController.RecordCount-1 do
  begin
    for Col:=0 to self.FView.ColumnCount-1 do
    begin
      lev := self.FView.Columns[Col].Position.BandIndex;
      CurrLevCol :=self.FView.Columns[Col].Position.ColIndex;
      CellObj := Self.FView.DataController.Values[ Row , Col ];

      if ( CellObj <> null ) and (CellObj <> '') then
      begin
        PObjCell := PCellVehicleObj( Integer( CellObj ) );
        FAddToDamp( lev, CurrLevCol, Row , PObjCell,  Damp );
      end;

    end;
  end;

end;
//******************************************************************************
function TVehiclePlaceView.FCheckEmptyRow(RowIndex:Integer):Boolean;
var Col:Integer;
begin
  result:=True;
  for Col:=0 to self.FView.ColumnCount-1 do
  begin
    if (self.FView.DataController.Values[RowIndex,Col]<>null)and((FGroupColumn<>nil)and( Col <> self.FGroupColumn.Index)) then
    begin
      result:=False;
      Break;
    end;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.FDelEmptyRow:Boolean;
var Row:Integer;
begin
  result:=True;
  Row :=0;
  While Row <=self.FView.DataController.RecordCount-1 do
  begin
    if FCheckEmptyRow(Row) then
      self.FView.DataController.DeleteRecord(Row)
    else Inc(Row);
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FReadDataDB( ByBand:Boolean=True );
var aBand : TcxGridBand;
    GroupColumn:TcxGridBandedColumn;
    Damp:TDampValueObjArr;
begin
  try
    self.FView.BeginUpdate;
    self.FVehicleDB.Elem.DB.First;

    FClearAll;

    if not ByBand then
    begin
      aBand := FMakeBandLevel( -1 );

      FGroupColumn := FcreateColumn( aBand, -1 );
      FGroupColumn.MinWidth := 0;
      FGroupColumn.Width := 0;
      self.FView.OptionsView.BandHeaders := False;

      FGroupColumn.Visible := False;
    end
    else FGroupColumn :=nil;

    //********************************************
   { while not self.FVehicleDB.Elem.DB.Eof do
    begin
      FMakeCurrRow( self.FVehicleDB  );
      self.FVehicleDB.Elem.DB.Next;
    end;}
    //********************************************
    FReadDataToDampFromDB( Damp );
    FViewFromDamp( Damp );
    //********************************************
  finally
    if not ByBand then
    begin
      if FGroupColumn<>nil then
      begin
        FGroupColumn.GroupIndex:=0;
        aBand.Destroy;
      end;
      FDelEmptyRow;
    end;

    self.FView.EndUpdate;
    if FGroupColumn<>nil then self.FView.DataController.Groups.FullExpand;
  end;

  FShemaChange := False;
  if @FRefreshFunction<>nil then FRefreshFunction(self);
end;
//******************************************************************************
{procedure TVehiclePlaceView.FReadDataFromDamp( ByBand:Boolean=True );
begin
  FReadDataToDampFromDB
end;
//******************************************************************************}
function TVehiclePlaceView.ShemaIsChange:Boolean;
begin
  result := FShemaChange;
end;
//******************************************************************************
procedure TVehiclePlaceView.SetHintParam( Color:TColor=clYellow; BorderColor:TColor=-1 );
begin
  FHintColor := Color;
  FHintBorder := BorderColor;
end;
//******************************************************************************
procedure TVehiclePlaceView.SetLevelParam( NameLevel:string );
begin
  FLevelName := NameLevel;
end;
//******************************************************************************
procedure TVehiclePlaceView.View;
begin
  FReadDataDB;
end;
//******************************************************************************
procedure TVehiclePlaceView.ViewByGroupColumn;
begin
  FReadDataDB(false);
end;
//******************************************************************************
procedure TVehiclePlaceView.FDrawListTexT(ACanvas: TcxCanvas; AreaDrawText:TRect; VisibleWidth:Integer; aText:Widestring );
var StepTopShowText:Integer;
    CellText:Widestring;
    saVeFontColor:TColor;
begin
  StepTopShowText := Ceil( (AreaDrawText.Bottom - AreaDrawText.Top) / 1 );
  AreaDrawText.Bottom := AreaDrawText.Top + StepTopShowText;

  SaveFontColor:= ACanvas.Font.Color;

  CellText := PrepareTextToView( aText , ACanvas, VisibleWidth );

  ACanvas.DrawTexT( CellText , AreaDrawText, taCenter, vaCenter, false, false );
  AreaDrawText.Top    := AreaDrawText.Top + StepTopShowText;
  AreaDrawText.Bottom := AreaDrawText.Bottom + StepTopShowText ;

  ACanvas.Font.Color:= SaveFontColor;
end;
//******************************************************************************
function TVehiclePlaceView.FGetImageIndex( aImageList:TImageList; ArrValue, ArrImageIndex:array of integer; CurrValue:variant ):Integer;
var i : Integer;
begin
  result := -1;
  if CurrValue = null then Exit;

  for i:=0 to Length( ArrValue ) - 1 do
    if ArrValue[i] = CurrValue then
    begin
      Result := ArrImageIndex[i];
      Break;
    end;

end;
//******************************************************************************
function TVehiclePlaceView.FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
begin
  if TcxGRidBandedTableView(Sender).Styles.Selection<>nil then
    result:=TcxGRidBandedTableView(Sender).Styles.Selection
  else result:=nil;
end;
//******************************************************************************
function TVehiclePlaceView.FGetColorSelection(Sender: TcxCustomGridTableView):TColor;
var Style:TcxStyle;
begin
  Style := FGetSelectionColor(Sender);

  if Style<> nil then
    result := Style.Color
  else result := FDefColorSelection;
end;
//******************************************************************************
function TVehiclePlaceView.FGetColorFontSelection(Sender: TcxCustomGridTableView):TColor;
var Style:TcxStyle;
begin
  Style:= FGetSelectionColor(Sender);

  if Style<> nil then
    result := Style.TextColor
  else result := FDefColorFontSelection;
end;
//******************************************************************************
procedure TVehiclePlaceView.FMakeSelectedTo( aType:Integer; VehicleTypePlace:String; Direction:variant );
var Col, i:Integer;
    CellObj:Variant;
    PObjCell : PCellVehicleObj;
begin
  //************************************************
  for Col := 0 to self.FView.Controller.SelectedColumnCount-1 do
  begin

    for i:=0 to self.FView.Controller.SelectedRowCount-1 do
    begin

      CellObj := self.FView.Controller.SelectedRows[i].Values[ self.FView.Controller.SelectedColumns[Col].Index ];

      if ( CellObj <> null ) and (CellObj <> '') then
      begin

        PObjCell := PCellVehicleObj( Integer( CellObj ) );
        PObjCell^.aType := aType;
        PObjCell^.VehiclePlace := VehicleTypePlace;
        PObjCell^.VehiclePlaceDirect := Direction;

      end
      else
      begin

        PObjCell := FCreateObjCell(-1, aType,  VehicleTypePlace, Direction, -1 );
        Self.FView.DataController.Values[ self.FView.Controller.SelectedRows[i].RecordIndex , self.FView.Controller.SelectedColumns[Col].Index ] := Integer( PObjCell );

      end;
    end;

  end;
  self.Repaint;
  FShemaChange := True;

  if @FRefreshFunction<>nil then FRefreshFunction(self);
end;
//******************************************************************************
function TVehiclePlaceView.GetSelectionDirect:Variant;
var CellObj:Variant;
    PObjCell : PCellVehicleObj;
begin
  result := null;

  if ( self.FView.Controller.SelectedColumnCount>0) and
     ( self.FView.Controller.SelectedRowCount>0) then
  begin
    CellObj := self.FView.Controller.SelectedRows[0].Values[ self.FView.Controller.SelectedColumns[0].Index ];
    if CellObj <> null then
    begin
      PObjCell := PCellVehicleObj( Integer( CellObj ) );
      result := PObjCell.VehiclePlaceDirect;
    end;
  end

end;
//******************************************************************************
procedure TVehiclePlaceView.FMakeSelectedDirectionTo( Direction:Integer );
var Col, i:Integer;
    CellObj:Variant;
    PObjCell : PCellVehicleObj;
    CurrDirect : Variant;
begin

  for Col := 0 to self.FView.Controller.SelectedColumnCount-1 do
  begin

    for i:=0 to self.FView.Controller.SelectedRowCount-1 do
    begin
      CellObj := self.FView.Controller.SelectedRows[i].Values[ self.FView.Controller.SelectedColumns[Col].Index ];

      if ( CellObj <> null ) and (CellObj <> '') then
      begin

        PObjCell := PCellVehicleObj( Integer( CellObj ) );

        if Direction >= 0 then
          PObjCell^.VehiclePlaceDirect := Direction
        else
        begin
          CurrDirect := PObjCell^.VehiclePlaceDirect;
          if CurrDirect <> null then
            PObjCell^.VehiclePlaceDirect := CurrDirect;
        end;

      end;
    end;

  end;

  self.Repaint;
end;
//******************************************************************************
procedure TVehiclePlaceView.ClearSelectedValue;
var Col, Row:Integer;
    CellObj:Variant;
begin

  for Col := 0 to self.FView.Controller.SelectedColumnCount-1 do
  begin

    for Row:=0 to self.FView.Controller.SelectedRowCount - 1 do
    begin
      CellObj := self.FView.Controller.SelectedRows[Row].Values[ self.FView.Controller.SelectedColumns[Col].Index ];

      if ( CellObj <> null ) and (CellObj <> '') then
        FDisposeRowCellMem( self.FView.Controller.SelectedRows[Row].RecordIndex , self.FView.Controller.SelectedColumns[Col].Index, self.FView.Controller.SelectedColumns[Col].Index );
    end;

  end;

  FRenumberPlaces;
end;
//******************************************************************************
procedure TVehiclePlaceView.FClearEmptyBands;
var i:Integer;
begin
  i := 0;

  while i <= self.FView.Bands.Count-1 do
  begin
    if self.FView.Bands[i].ColumnCount = 0 then self.FView.Bands[i].Destroy
    else Inc(i);
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.DelRows;
begin
  //while self.FView.Controller.SelectedRowCount > 0 do
  //begin
    FDisposeRowCellMem( self.FView.Controller.SelectedRows[0].RecordIndex , 0, self.FView.ColumnCount-1 );
    self.FView.DataController.DeleteRecord( self.FView.Controller.SelectedRows[0].RecordIndex );
  //end;

  self.Repaint;
end;
//******************************************************************************
procedure TVehiclePlaceView.AddRow(Count:Integer=1);
var IndForInsertRow :Integer;
    i:Integer;
begin
  IndForInsertRow := self.FView.Controller.SelectedRows[0].Index;

  if IndForInsertRow<> -1 then
    for i:=0 to Count-1 do
      Self.FView.DataController.InsertRecord( IndForInsertRow+1 );
end;
//******************************************************************************
procedure TVehiclePlaceView.FReindexColumnPosition;
var i:Integer;
begin
  for i:=self.FView.ColumnCount-1 downto 0 do
    self.FView.Columns[i].Index := i;
end;
//******************************************************************************
procedure TVehiclePlaceView.AddCol(Count:Integer=1);
var i:Integer;
    BandIndex:Integer;
    IndForInsertCol : Integer;
begin
  IndForInsertCol := TcxGridBandedColumn(self.FView.Controller.SelectedColumns[0]).Position.ColIndex;
  BandIndex := TcxGridBandedColumn( self.FView.Controller.SelectedColumns[0] ).Position.BandIndex;

  for i:=0 to Count-1 do
    FcreateColumn( self.FView.Bands.Items[BandIndex], 0, IndForInsertCol+1 );

  self.FView.Site.Refresh;
  //FReindexColumnPosition;      // «робив функц≥ю €ка мала б пере≥ндексуати позиц≥ю колонки по пор€дку
end;
//******************************************************************************

procedure TVehiclePlaceView.DelColumns;
var Row : Integer;
begin
  //while self.FView.Controller.SelectedColumnCount > 0 do
  //begin
    //for Row := 0 to self.FView.Controller.SelectedRowCount - 1 do
    FDisposeRowCellMem( self.FView.Controller.SelectedRows[0].RecordIndex , self.FView.Controller.SelectedColumns[0].Index , self.FView.Controller.SelectedColumns[0].Index );
    self.FGetCol( self.FView.Controller.SelectedColumns[0].Index ).Destroy;
    //self.FView.Columns[self.FView.Controller.SelectedColumns[0].Index].Destroy;
  //end;

  self.FClearEmptyBands;
  self.RefreshLevelCaption;
  self.Repaint;
end;
//******************************************************************************
procedure TVehiclePlaceView.InvertSelectedDirection;
begin
  FMakeSelectedDirectionTo( -999 );
end;
//******************************************************************************
procedure TVehiclePlaceView.SetDirectionForSelected(Direct:Integer);
begin
  FMakeSelectedDirectionTo( Direct );
end;
//******************************************************************************
function TVehiclePlaceView.FGeSelDirection:Integer;
var AColIndex:Integer;
    CellObj:Variant;
    PObjCell : PCellVehicleObj;
begin

  AColIndex := self.FView.Controller.FocusedItemIndex;
  result := 0;

  CellObj := self.FView.Controller.SelectedRows[0].Values[AColIndex];
  if ( CellObj <> null ) and (CellObj <> '') then
  begin
    PObjCell := PCellVehicleObj( Integer( CellObj ) );
    result := PObjCell^.VehiclePlaceDirect;
  end;

end;
//******************************************************************************
procedure TVehiclePlaceView.MakeSelectedToObject( aType:Integer; Direction:Integer=-1 );
begin
  FMakeSelectedTo( aType, '', MyIfThen( Direction = -1,null, Direction) );
  self.FRenumberPlaces;
end;
//******************************************************************************
function TVehiclePlaceView.FGetColorObjectPlace( VehiclePlace:Variant ):PCellObjectColor;
var i:Integer;
begin
  result := nil;

  for i := 0 to FCellColorObjectList.Count -1 do
    if VarToStr( PCellObjectColor(FCellColorObjectList.Items[i])^.VehicleTypePlace ) = VarToStr(VehiclePlace) then
      result := PCellObjectColor(FCellColorObjectList.Items[i]);
end;
//******************************************************************************
procedure TVehiclePlaceView.ViewCustomDrawCell(Sender: TcxCustomGridTableView;
ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
var ADone: Boolean);
var PObjCell : PCellVehicleObj;
    ObjCell : TCellVehicleObj;
    aText : Widestring;
    currBGColor : TColor;
    OldColorBrash : TColor;
    ImgDerectIndex:Integer;
    CellObjectColor: PCellObjectColor;
begin

  if ( AViewInfo.Item.Tag >= 0 ) and
     ( AViewInfo.GridRecord.Values[AViewInfo.item.index] <> null ) and
     ( AViewInfo.GridRecord.Values[AViewInfo.item.index] <> '' ) then
  begin
    OldColorBrash := ACanvas.Brush.Color;

    PObjCell:= PCellVehicleObj( Integer(AViewInfo.GridRecord.Values[AViewInfo.item.index]) );
    ObjCell  := PObjCell^;

    CellObjectColor := FGetColorObjectPlace( ObjCell.aType );
    currBGColor := CellObjectColor^.aColor;

    if ObjCell.IdUsed <> null then
      if ObjCell.ColorUsed<>-1 then  currBGColor:= ObjCell.ColorUsed
      else currBGColor := clGreen;

    if ( CellObjectColor <> nil ) then
    begin

      if ( ObjCell.aType >=0 )  then
      begin

        if CellObjectColor^.aName <>'' then
          aText := CellObjectColor^.aName +' '+ VarToStr( ObjCell.VehiclePlace )
        else aText := VarToStr( ObjCell.VehiclePlace );

      end
      else aText := CellObjectColor^.aName;

      if aText ='' then aText :=' ';
    end else aText :=' ';

    if not AViewInfo.Selected then
    begin

      if currBGColor <> -1 then
        ACanvas.FillRect( AViewInfo.Bounds , currBGColor )
      else ACanvas.FillRect( AViewInfo.Bounds , OldColorBrash );

    end
    else
    begin
      ACanvas.FillRect( AViewInfo.Bounds , Self.FGetColorSelection( Sender ) );
      ACanvas.Font.Color:= self.FGetColorFontSelection( Sender );
    end;

    if ( CellObjectColor<>nil ) and( CellObjectColor^.ImageList <> nil ) then
    begin
      if  ( ObjCell.VehiclePlaceDirect <> null ) then
        ImgDerectIndex := FGetImageIndex( CellObjectColor^.ImageList, CellObjectColor^.DirectionIndex, CellObjectColor^.DirectionImageIndex, ObjCell.VehiclePlaceDirect )

      else ImgDerectIndex := CellObjectColor^.ShowImageIndex;

      if ImgDerectIndex <> -1 then
        ShowTextImageInCell( Sender, ACanvas, AViewInfo,
                             CellObjectColor^.ImageList, ImgDerectIndex, MyIfThen(aText=' ',OptImgPosCenter, OptImgPosRight), aText )
      else FDrawListTexT( ACanvas,  AViewInfo.Bounds,  AViewInfo.Bounds.Right -  AViewInfo.Bounds.Left ,  aText );
    end

    else FDrawListTexT( ACanvas,  AViewInfo.Bounds,  AViewInfo.Bounds.Right -  AViewInfo.Bounds.Left ,  aText );   //cellOnDisplayLast.Bounds.Right
    ADone := True;
  end;

  if (@PersonalDrawCell<>nil) then
    PersonalDrawCell(Sender, ACanvas, AViewInfo, ADone);
end;
//******************************************************************************
procedure TVehiclePlaceView.Repaint;
begin
  self.FView.Preview.GridView.LayoutChanged(true);
  self.FView.Site.Repaint;
end;
//******************************************************************************
procedure TVehiclePlaceView.FRenumberPlacesToBandByColumns( var StartNumber:Integer;var ChStart :Char; Band:TcxGridBand; NumberOrChar:integer; OpositDirection:Boolean );
var Col,Row:Integer;
    CeilValue : Variant;
    PObjCell : PCellVehicleObj;
    ChNumber:Integer;
    Ch:Char;
    //ChNumber:Integer;
    RowChNumber:Array of array of Integer;
    FindPlace:Boolean;
begin
  SetLength( RowChNumber, self.FView.ColumnCount );
  begin

    if not OpositDirection then Col:=0
    else Col :=Band.ColumnCount-1;

    While ((Col<=Band.ColumnCount-1)and(not OpositDirection))or
          ((Col>=0)and( OpositDirection)) do

    //for Col:=0 to Band.ColumnCount-1 do
    begin
      Ch := ChStart;
      ChNumber :=1;
      SetLength( RowChNumber[col],self.FView.DataController.RowCount );
      FindPlace:=False;

      for Row := 0 to self.FView.DataController.RowCount-1 do
      begin

        CeilValue := self.FView.DataController.Values[ Row, Band.Columns[Col].Index ];
        if ( CeilValue <> null ) and (CeilValue<>'') then
        begin
          PObjCell := PCellVehicleObj( Integer(CeilValue) );
          if PObjCell^.aType >=0 then
          begin
            //**************************
            if not OpositDirection then
            begin
              if Col <> 0 then
                RowChNumber[Col][row]:=RowChNumber[Col-1][Row]+1
              else RowChNumber[Col][Row]:= ChNumber;
            end
            else
            if Col <> Band.ColumnCount-1 then
              RowChNumber[Col][row]:= RowChNumber[Col+1][Row]+1
            else RowChNumber[Col][Row]:= ChNumber;
            //**************************

            if NumberOrChar =0 then PObjCell^.VehiclePlace := IntToStr( StartNumber );
            if NumberOrChar =1 then PObjCell^.VehiclePlace := Ch+IntToStr(RowChNumber[Col][Row]);

            ChNumber :=RowChNumber[Col][Row];

            Inc( StartNumber );
            FindPlace := True;
          end
          else
          begin
            if not OpositDirection then
            begin
              if Col<>0 then
                RowChNumber[Col][Row]:=RowChNumber[Col-1][Row]
              else RowChNumber[Col][Row]:= 1;
            end
            else
            begin
              if Col< Band.ColumnCount-1 then
                RowChNumber[Col][Row]:=RowChNumber[Col+1][Row];
            end;
          end;
        end;

        if FindPlace then Ch := Succ(Ch);
      end;

      if not OpositDirection then Inc(Col)
      else Dec(Col);
    end;
  end;

  ChStart:=Ch;
  self.Repaint;
end;
//******************************************************************************
procedure TVehiclePlaceView.FRenumberWithCharPlacesToBandByRows( var StartNumber:Integer;var ChNumber:Integer; Band:TcxGridBand; NumberOrChar:integer; OpositDirection:Boolean );
var Col,Row:Integer;
    CeilValue : Variant;
    PObjCell : PCellVehicleObj;
    Ch:Char;
    ChCol:Char;
    //RowChNumber:Array of array of Integer;
    FindPlace:Boolean;
    //StartNumberCol:Integer;
begin

  ChCol := 'A';

  //SetLength( RowChNumber, self.FView.DataController.RowCount );

  for Row := 0 to self.FView.DataController.RowCount-1 do
  begin
    Ch :='A';


    if not OpositDirection then Col:=0
    else Col :=Band.ColumnCount-1;

    //SetLength( RowChNumber[row], Band.ColumnCount );

    FindPlace:=False;
    While ((Col<=Band.ColumnCount-1)and(not OpositDirection))or
          ((Col>=0)and( OpositDirection)) do
    begin

      CeilValue := self.FView.DataController.Values[ Row, Band.Columns[Col].Index ];
      if ( CeilValue <> null ) and (CeilValue<>'') then
      begin

        PObjCell := PCellVehicleObj( Integer(CeilValue) );
        if PObjCell^.aType >=0 then
        begin

          if NumberOrChar =0 then PObjCell^.VehiclePlace := IntToStr( StartNumber );
          if NumberOrChar =1 then PObjCell^.VehiclePlace := {Ch+IntToStr(RowChNumber[Row][Col]);}Ch+IntToStr(ChNumber);

          Inc( StartNumber );

          Ch := Succ(Ch);
          FindPlace:=True;
        end;

      end;

      if not OpositDirection then Inc(Col)
      else Dec(Col);
    end;
    if FindPlace then inc( ChNumber );


    ChCol := Succ(ChCol);
  end;
end;
//******************************************************************************
function TVehiclePlaceView.CanExChangeLevelBySelectedColumn:Boolean;
begin
  result := False;

  if self.FView.Controller.SelectedColumnCount = 2 then
  begin
    if TcxGridBandedColumn( self.FView.Controller.SelectedColumns[0]).Position.BandIndex <>
    TcxGridBandedColumn( self.FView.Controller.SelectedColumns[1]).Position.BandIndex then Result := True;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.ExChangeLevelBySelectedColumn:Boolean;
var SaveBandIndex:Integer;
begin
  result := False;

  if CanExChangeLevelBySelectedColumn then
  begin
    SaveBandIndex:= TcxGridBandedColumn( self.FView.Controller.SelectedColumns[0]).Position.Band.Index;
    TcxGridBandedColumn( self.FView.Controller.SelectedColumns[0]).Position.Band.Index := TcxGridBandedColumn( self.FView.Controller.SelectedColumns[1]).Position.Band.Index;
    TcxGridBandedColumn( self.FView.Controller.SelectedColumns[1]).Position.Band.Index := SaveBandIndex;

    RefreshLevelCaption;
    result := True;

  end;
end;
//******************************************************************************
function TVehiclePlaceView.DeleteLevelBySelectedColumn:Boolean;
var i:integer;
    SaveLevel:array of Integer;
    CurrBand:TcxGridBand;
    len:Integer;
//*********************************************************
procedure AddToLevelBand( CurrLevel:Integer );
var i:Integer;
    Find:Boolean;
begin
  Find:=False;
  for i:=0 to Length(SaveLevel)-1 do
    if SaveLevel[i]=CurrLevel then Find:=True;

  if not Find then
  begin
    len := Length(SaveLevel);
    SetLength( SaveLevel, len+1 );
    SaveLevel[len] := CurrLevel;
  end;
end;
//*********************************************************
begin
  Result := False;
  for i:=0 to self.FView.Controller.SelectedColumnCount-1 do
   AddToLevelBand( TcxGridBandedColumn( self.FView.Controller.SelectedColumns[i] ).Position.Band.Index );
  //***********************************
  for i:= 0 to Length(SaveLevel)-1 do
  begin
    CurrBand := FFindBandByLevel( SaveLevel[i] );
    if CurrBand <> nil then CurrBand.Bands.Delete( CurrBand.Index );
  end;
  //***********************************
  RefreshLevelCaption;
  Result := True;
end;
//******************************************************************************
procedure TVehiclePlaceView.FRenumberPlaces;
begin
  RenumberPlaces( FNumberOrChar,FByHorizont, FOpositDirection,FNumbOnLevel );
end;
//******************************************************************************
procedure TVehiclePlaceView.RenumberPlaces(  NumberOrChar:integer; ByHorizont:Boolean; OpositDirection:Boolean= False; NumbOnLevel:Integer=0; UpDown:Boolean=False );
var Lev:Integer;
    StartNumber:Integer;
    ChNumber:Integer;
    Ch:Char;
procedure SetStartParam;
begin
  StartNumber := 1;
  ChNumber:=1;
  Ch :='A';
end;

begin
  FNumberOrChar := NumberOrChar;
  FByHorizont := ByHorizont;
  FOpositDirection := OpositDirection;
  FNumbOnLevel := NumbOnLevel;
  FRenumberUpDown := UpDown;

  SetStartParam;

  if FNumbOnLevel in [0,2] then Lev:=0
  else Lev := self.FView.Bands.Count-1;

  While ( (Lev<=self.FView.Bands.Count-1)and( FNumbOnLevel in [0,2]) )or
        ( (Lev>=0)and( FNumbOnLevel = 1 ) ) do
  begin
    if FNumbOnLevel = 2 then SetStartParam;

    if ByHorizont then
       FRenumberWithCharPlacesToBandByRows(StartNumber, ChNumber, self.FView.Bands.Items[lev], NumberOrChar, OpositDirection )
    else FRenumberPlacesToBandByColumns(StartNumber, Ch, self.FView.Bands.Items[lev], NumberOrChar, OpositDirection );

    if FNumbOnLevel in [0,2] then Inc(Lev)
    else Dec(Lev);

  end;

  self.Repaint;
  FShemaChange:=True;

  if @FRefreshFunction<>nil then FRefreshFunction(self);
end;
//******************************************************************************
{function TVehiclePlaceView.AddToDBRow( id:Variant; Row, Level:Integer ):variant;
var isNew:boolean;
begin
  if id = -1 then isNew :=True
  else  isNew := False;

  if  ( not isNew ) and
      ( not self.FVehicleDB.Elem.DB.Locate( self.FVehicleDB.Elem.FieldKod, id,[] ) )  then isNew := True;

  if isNew then self.FVehicleDB.Elem.DB.Insert
  else self.FVehicleDB.Elem.DB.Edit;

  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FieldRow).AsInteger := Row;
  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FieldALEVEL).AsInteger := Level;

  Result := self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.Elem.FieldKod).AsInteger;
  self.FVehicleDB.Elem.DB.Post;
end; }
//******************************************************************************
function TVehiclePlaceView.FAddToDBRowDetailCellValue( lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant ):Variant;
var isNew:boolean;
begin
  if (Direction<>0)and(Direction = Unassigned) then Direction := null;

  if id = -1 then isNew :=True
  else  isNew := False;

  if ( not isNew ) and
     ( not self.FVehicleDB.Elem.DB.Locate( self.FVehicleDB.Elem.FieldKod , id, [] ) ) then isNew := True;

  if isNew then self.FVehicleDB.Elem.DB.Insert
  else self.FVehicleDB.Elem.DB.Edit;

  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FieldALEVEL).asInteger := lev;
  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FieldRow).asInteger := Row;
  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FiedlPlace).asString := Place;
  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FiedlDirection).value := Direction;
  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FiedlCol).AsInteger := Col;
  self.FVehicleDB.Elem.DB.FieldByName(self.FVehicleDB.FieldType).AsInteger := Atype;

  Result := self.FVehicleDB.Elem.DB.FieldByName( self.FVehicleDB.Elem.FieldKod ).AsInteger;
  self.FVehicleDB.Elem.DB.Post;

end;
//******************************************************************************
function TVehiclePlaceView.FGetInsertSql( lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant ):string;
begin
  result := 'INSERT INTO '+self.FVehicleDB.Elem.TableName+'('+self.FVehicleDB.FieldALEVEL+','+ self.FVehicleDB.FieldRow+','+self.FVehicleDB.FiedlPlace+','+self.FVehicleDB.FiedlDirection+','+self.FVehicleDB.FiedlCol+','+self.FVehicleDB.FieldType+','+self.FVehicleDB.Elem.FieldMainKod+ ')'+
            'VALUES ('+IntToStr(lev)+','+IntToStr(Row)+','+#39+Place+#39+','+MyIfThen(Direction<>null, VarToStr(Direction), 'null')+','+ IntToStr(Col)+','+IntToStr(Atype)+','+ self.FVehicleDB.Elem.MainElement.GetValueIdStr +')';
end;
//******************************************************************************
function TVehiclePlaceView.FGetUpdateSql( lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant ):string;
begin
  result := 'UPDATE '+self.FVehicleDB.Elem.TableName+' SET '+self.FVehicleDB.FieldALEVEL+'='+IntToStr(lev)+','+self.FVehicleDB.FieldRow+'='+IntToStr(Row)+','+self.FVehicleDB.FiedlPlace+'='+#39+Place+#39+','+
                      self.FVehicleDB.FiedlDirection+'='+MyIfThen(Direction<>null, VarToStr(Direction), 'null')+','+
                      self.FVehicleDB.FiedlCol+'='+IntToStr(Col)+','+self.FVehicleDB.FieldType+'='+IntToStr(Atype)+' where '+FVehicleDB.Elem.FieldKod+'='+ VarToStr(id);
end;
//******************************************************************************
function TVehiclePlaceView.FGetDelSql( id:Variant ):string;
begin
  result:='Delete from '+ self.FVehicleDB.Elem.TableName + ' where '+FVehicleDB.Elem.FieldKod+'='+ VarToStr(id);
end;
//******************************************************************************
function TVehiclePlaceView.FAddToDBRowDetailCellValueSql( lev, Row,Col,Atype:Integer; Place:String; id,Direction:Variant ):String;
var isNew:boolean;
begin
  if (Direction<>0)and(Direction = Unassigned) then Direction := null;

  if id = -1 then isNew :=True
  else  isNew := False;

  if ( not isNew ) and
     ( not self.FVehicleDB.Elem.DB.Locate( self.FVehicleDB.Elem.FieldKod , id, [] ) ) then isNew := True;

  if isNew then result := FGetInsertSql( lev, Row,Col,Atype, Place, id,Direction )
  else result := FGetUpdateSql( lev, Row,Col,Atype, Place, id,Direction );

end;
//******************************************************************************
function SaveIdDBToList( DB:TDataset; FieldIdName:string ):TStringList;
begin
  Result := TStringList.Create;

  try
    DB.DisableControls;
    DB.First;

    while not DB.Eof do
    begin
      Result.Add ( DB.FieldByName( FieldIdName ).AsString );
      DB.Next;
    end;

  finally
    DB.EnableControls;
  end;
end;
//******************************************************************************
function RemoveIdFromList( aList:TStringList;IdStr:String ):boolean;
var FindIndex:Integer;
begin
  FindIndex := aList.IndexOf( IdStr );
  if FindIndex <> -1 then
  begin
    aList.Delete( FindIndex );
    Result := True;
  end else Result := False;
end;
//******************************************************************************
procedure RemoveFromDBByIdList( Elem:TDBShema; FieldIdName:string; aList:TStringList );
var i:integer;
    SaveAsk :Boolean;
begin
  try
    SaveAsk := Elem.AskBeforeDelete;
    Elem.AskBeforeDelete := False;

    for i:=0 to aList.Count-1 do
    begin
      if Elem.DB.Locate( FieldIdName, aList[i],[] ) then
        Elem.DB.Delete;
    end;

  finally
    Elem.AskBeforeDelete := SaveAsk;
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FSaveDataToDB( Damp : TDampValueObjArr );
var i:integer;
    CurrRowId : Variant;
    CurridDetail : Variant;
    RowDetailDB_ID : TStringList;
    Progres : TProgressFormProp;
begin

  try
    Progres := ShowProgress( WaitFormCaption );

    self.FView.BeginUpdate;
    self.FVehicleDB.Elem.DB.DisableControls;

    RowDetailDB_ID := SaveIdDBToList( self.FVehicleDB.Elem.DB, self.FVehicleDB.Elem.FieldKod ); // «аповнити List з Detail вс≥х ID ≥ викидувати по одному т≥ €к≥ використовую все що залишитьс€ ¬идалити

    for i:=0 to Length(Damp) -1 do
    begin
      CurrRowId := Damp[i].Obj^.idDetail;
      if CurrRowId <> null then
      begin
        CurridDetail := FAddToDBRowDetailCellValue(Damp[i].lev, Damp[i].Row,Damp[i].col,Damp[i].Obj^.aType, Damp[i].Obj^.VehiclePlace, Damp[i].Obj^.idDetail, Damp[i].Obj^.VehiclePlaceDirect  );
        RemoveIdFromList( RowDetailDB_ID, CurrIDDetail );
        if Damp[i].Obj^.idDetail = -1 then Damp[i].Obj^.idDetail := CurridDetail;
      end;
    end;

  finally
    RemoveFromDBByIdList( self.FVehicleDB.Elem,  self.FVehicleDB.Elem.FieldKod, RowDetailDB_ID );
    RowDetailDB_ID.Free;
    self.FView.EndUpdate;
    self.FVehicleDB.Elem.DB.EnableControls;
    ClosedProgress( Progres.FormProgres );
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FSaveDataToDBBySql( Damp : TDampValueObjArr );
var i:integer;
    CurridDetail : Variant;
    RowDetailDB_ID : TStringList;
    RowSql:TStringList;
    Sql:string;
    Progres : TProgressFormProp;
begin
  try
    Progres := ShowProgress( WaitFormCaption );

    self.FView.BeginUpdate;
    self.FVehicleDB.Elem.DB.DisableControls;

    RowSql := TStringList.Create;
    RowDetailDB_ID := SaveIdDBToList( self.FVehicleDB.Elem.DB, self.FVehicleDB.Elem.FieldKod ); // «аповнити List з Detail вс≥х ID ≥ викидувати по одному т≥ €к≥ використовую все що залишитьс€ ¬идалити

    for i:=0 to Length(Damp) -1 do
    begin
      Sql := FAddToDBRowDetailCellValueSql( Damp[i].lev, Damp[i].Row,Damp[i].col,Damp[i].Obj^.aType, Damp[i].Obj^.VehiclePlace, Damp[i].Obj^.idDetail, Damp[i].Obj^.VehiclePlaceDirect  )+';';
      RowSql.Add( Sql );
      if Damp[i].Obj^.idDetail <> null then RemoveIdFromList( RowDetailDB_ID, VarToStr( Damp[i].Obj^.idDetail ) );
    end;

    for i:=0 to RowDetailDB_ID.Count -1 do
    begin
      if RowDetailDB_ID.Strings[i]<>'-1' then
      begin
        Sql := FGetDelSql( RowDetailDB_ID.Strings[i] )+';';
        RowSql.Add( Sql );
      end;
    end;

    DBUpdateList( RowSql, self.FVehicleDB.Elem.DBGetMainParamConnect  );
    //DBUpdate( RowSql.Text, self.FVehicleDB.Elem.DBGetParamConnect );


  finally
    RowSql.Free;
    //RemoveFromDBByIdList( self.FVehicleDB.Elem,  self.FVehicleDB.Elem.FieldKod, RowDetailDB_ID );
    RowDetailDB_ID.Free;
    self.FView.EndUpdate;
    self.FVehicleDB.Elem.DB.EnableControls;
    ClosedProgress( Progres.FormProgres );
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.SaveData( TypeSave:Integer );
var Damp : TDampValueObjArr;
begin
  FReadDataToDampFromView( Damp );
  if TypeSave = 0 then FSaveDataToDB( Damp );
  if TypeSave = 1 then FSaveDataToDBBySql( Damp );

  self.FShemaChange := False;
  if @FRefreshFunction<>nil then FRefreshFunction(self);
end;
//******************************************************************************
procedure TVehiclePlaceView.SetUseId( UseId:variant );
var CellObj : Variant;
    PObjCell : PCellVehicleObj;
    Col,i:Integer;
begin
  CellObj := self.FView.Controller.SelectedRows[0].Values[ self.FView.Controller.SelectedColumns[0].Index ];
  if UseId = '' then UseId := null;

  for Col := 0 to self.FView.Controller.SelectedColumnCount-1 do
  begin

    for i:=0 to self.FView.Controller.SelectedRowCount-1 do
    begin

      CellObj := self.FView.Controller.SelectedRows[i].Values[ self.FView.Controller.SelectedColumns[Col].Index ];
      if ( CellObj <> null ) and (CellObj <> '') then
      begin
        PObjCell := PCellVehicleObj( Integer( CellObj ) );
        PObjCell^.IdUsed := UseId;
      end;
    end;
  end;

end;
//******************************************************************************
function TVehiclePlaceView.FFindPrevColForIndexDump(IndexDamp:Integer; Damp:TDampValueObjArr ):Integer;
var i:Integer;
begin
   result := IndexDamp;

   for i:=IndexDamp downto 0 do
   begin
     if ( Damp[i].lev  = Damp[IndexDamp].lev ) and
        ( Damp[i].Row  = Damp[IndexDamp].Row ) and
        ( Damp[i].Obj <> nil ) and
        ( Damp[i].Obj^.aType = 0 )then result := Damp[i].Col
     else Break;
   end;
end;
//******************************************************************************
function TVehiclePlaceView.FFindNextColForIndexDump(IndexDamp:Integer; Damp:TDampValueObjArr ):Integer;
var i:Integer;
begin
   result := IndexDamp;

   for i:=IndexDamp to Length(Damp)-1 do
   begin
     if ( Damp[i].lev  = Damp[IndexDamp].lev ) and
        ( Damp[i].Row  = Damp[IndexDamp].Row ) and
        ( Damp[i].Obj <> nil )and
        ( Damp[i].Obj^.aType = 0 )then result := Damp[i].Col
     else Break;
   end;
end;
//******************************************************************************
function TVehiclePlaceView.FFindLastColForIndexDump(IndexDamp:Integer; Damp:TDampValueObjArr ):Integer;
var i:Integer;
begin
   result := IndexDamp;

   for i:=IndexDamp to Length(Damp)-1 do
   begin
     if ( Damp[i].lev  = Damp[IndexDamp].lev ) and
        ( Damp[i].Row  = Damp[IndexDamp].Row ) and
        ( Damp[i].Obj <> nil ) then result := Damp[i].Col
     else Break;
   end;
end;
//******************************************************************************
Function TVehiclePlaceView.FPlaceIsNearRow( IndexDampPlace, IndexDumpCheckPlace : Integer; Damp:TDampValueObjArr):Boolean;
var StartCol:Integer;
    LastCol:Integer;
begin
  StartCol := FFindPrevColForIndexDump( IndexDampPlace, Damp );
  LastCol:= FFindNextColForIndexDump( IndexDampPlace, Damp );

  result := False;
  if ( ( Damp[IndexDampPlace].Col >= StartCol) and (Damp[IndexDampPlace].Col <= LastCol) ) and
     ( ( Damp[IndexDumpCheckPlace].Col >= StartCol) and (Damp[IndexDumpCheckPlace].Col <= LastCol) ) and
     ( Damp[IndexDampPlace].Row = Damp[IndexDumpCheckPlace].Row )and
     ( Damp[IndexDampPlace].lev = Damp[IndexDumpCheckPlace].lev ) then result := True;
end;
//******************************************************************************
Function TVehiclePlaceView.FPlaceIsNear( IndexDampPlace , IndexDumpCheckPlace : Integer; Damp:TDampValueObjArr ):Boolean;
var StartCol:Integer;
    LastCol:Integer;
begin
  StartCol := FFindPrevColForIndexDump( IndexDampPlace, Damp );
  LastCol := FFindNextColForIndexDump( IndexDampPlace, Damp );

  result := False;
  if ( ( Damp[IndexDampPlace].Col >= StartCol) and (Damp[IndexDampPlace].Col <= LastCol) ) and
   ( ( Damp[IndexDumpCheckPlace].Col >= StartCol) and (Damp[IndexDumpCheckPlace].Col <= LastCol) ) and
   ( ( Damp[IndexDampPlace].Row = Damp[IndexDumpCheckPlace].Row ) or
     ( Damp[IndexDampPlace].Row <= Damp[IndexDumpCheckPlace].Row+1 ) or
     ( Damp[IndexDampPlace].Row >= Damp[IndexDumpCheckPlace].Row-1 )  ) and
     ( Damp[IndexDampPlace].lev = Damp[IndexDumpCheckPlace].lev ) then result := True;

end;
//******************************************************************************
Function TVehiclePlaceView.FCheckColRightHole( IndexDampPlace:Integer;  Damp:TDampValueObjArr ):Boolean;
var i:Integer;
    Row:Integer;
    lev:Integer;
    col:Integer;
begin
  Row := Damp[IndexDampPlace].Row;
  lev := Damp[IndexDampPlace].lev;
  col := Damp[IndexDampPlace].Col;

  result := False;
  if FCheckRowFoHole( Row, lev,  Damp )  then
  begin
    for i:=IndexDampPlace to  Length(Damp)-1 do
    begin
      if ( Damp[i].Obj.aType <> 0 ) and
         ( Damp[i].Row = Row ) and ( Damp[i].lev = lev ) then
      begin
        result := True;
        break;
      end;
    end;
  end
  else
    if col< ( self.FView.Bands[lev].ColumnCount/2) then result:= True;
end;
//******************************************************************************
Function TVehiclePlaceView.FCheckRowFoHole( Row, lev:Integer;  Damp:TDampValueObjArr ):Boolean;
var i:Integer;
begin
  result := False;

  for i:=0 to  Length(Damp)-1 do
  begin
    if ( Damp[i].Obj.aType <> 0 ) and
       ( Damp[i].Row = Row ) and ( Damp[i].lev = lev ) then
    begin
      result := True;
      break;
    end;
  end;
end;
//******************************************************************************
Function TVehiclePlaceView.FCheckDampForRowNotHole( TempDamp,Damp:TDampValueObjArr ):Boolean;
var i : integer;
begin
  result := True;
  for i:=0 to Length( TempDamp )-1 do
  if not FCheckRowFoHole( TempDamp[i].Row ,TempDamp[i].lev,  Damp )  then
  begin
    result := False;
    Break;
  end;

end;
//******************************************************************************
Function TVehiclePlaceView.FCheckDampForRowNotHoleArr( TempDampAll:TDampValueObjArrArr; Damp:TDampValueObjArr ):integer;
var i : integer;
begin
  result := 0;
  for i:=0 to Length( TempDampAll )-1 do
  if not FCheckDampForRowNotHole( TempDampAll[i], Damp ) then
    Inc( result );
end;
//******************************************************************************
Function TVehiclePlaceView.FFindCountPlaceInRow( IndexDampPlace:Integer; Damp:TDampValueObjArr):Integer;
var i:Integer;
begin
  result :=0;
  for i:=0 to  Length(Damp)-1 do
  begin
    if ( Damp[i].Obj.aType = 0 ) and
       ( FPlaceIsNearRow( IndexDampPlace, i, Damp ) ) then inc(result);
  end;
end;
//******************************************************************************
Function TVehiclePlaceView.FCheckObjIsFree(aObj:TDampValueObj):Boolean;
begin
  result := aObj.Obj^.IdUsed = null;
end;
//******************************************************************************
procedure TVehiclePlaceView.FSetReservedObj(aObj:TDampValueObj);
begin
  aObj.Obj^.IdUsed := '*';
end;
//******************************************************************************
Function TVehiclePlaceView.FFindCountPlaceFreeInRow( IndexDampPlace:Integer; Damp:TDampValueObjArr):Integer;
var i:Integer;
begin
  result :=0;
  for i:=0 to  Length(Damp)-1 do
  begin
    if ( Damp[i].Obj.aType = 0 ) and
       ( Damp[i].Obj.idUsed = null ) and
       ( FPlaceIsNearRow( IndexDampPlace, i, Damp ) ) then inc(result);
  end;
end;
//******************************************************************************
Function TVehiclePlaceView.FFindPlacesNearFromTempDamp( StartIndexDump:Integer; TempDamp, Damp:TDampValueObjArr; JustPlaceWithHole:Boolean=False; CountFree:integer=-1): TDampValueObjArr;
var i : Integer;
    len : Integer;
    CheckPlaceAfter:Boolean;
begin
  SetLength( Result, 0 );

  for i:=0 to Length(TempDamp)-1 do
  begin
    CheckPlaceAfter := FCheckPlaceAfter( Damp[StartIndexDump].Obj^.VehiclePlace,TempDamp[i].Obj^.VehiclePlace, Damp );

    if ( TempDamp[i].Obj.aType = 0 ) and
       ( TempDamp[i].Obj.IdUsed = null )and ( CheckPlaceAfter ) and
       ( ( ( JustPlaceWithHole ) and ( FCheckRowFoHole( TempDamp[i].Row , TempDamp[i].lev,  Damp ) ) ) or
         (not JustPlaceWithHole) and ( not FCheckRowFoHole( TempDamp[i].Row , TempDamp[i].lev,  Damp ) ) )  then
    begin
      len:= Length( Result );
      SetLength( Result, Len+1 );
      Result[len] := TempDamp[i];
    end;

    if (CountFree<>-1)and(Length(Result) = CountFree) then break;
  end;
end;
//******************************************************************************
Procedure TVehiclePlaceView.FAddToDamp( Lev, Col, Row : Integer; PObjCell : PCellVehicleObj; var Damp:TDampValueObjArr );
var Len:Integer;
begin
  Len:= Length(Damp);
  SetLength( Damp , Len+1 );
  
  Damp[len].Lev := Lev;
  Damp[len].Col := Col;
  Damp[len].Row := Row;
  Damp[len].Obj := PObjCell;
end;
//******************************************************************************
Function TVehiclePlaceView.FCountAllPlace( Damp:TDampValueObjArr;StartIndex:Integer=0 ):Integer;
var j:integer;
begin
  result :=0;
  for j:=StartIndex to Length(Damp)-1 do
    if ( Damp[j].Obj^.aType = 0 ) then Inc( result );
end;
//******************************************************************************
Function TVehiclePlaceView.CountAllPlaceFromView:Integer;
var Damp:TDampValueObjArr;
begin
  FReadDataToDampFromView( Damp );
  result := FCountAllPlace( Damp );
end;
//******************************************************************************
Function TVehiclePlaceView.FFindCountEmptyPlace( Damp:TDampValueObjArr;StartIndex:Integer=0 ):Integer;
var j:integer;
begin
  result :=0;
  for j:=StartIndex to Length(Damp)-1 do
    if ( Damp[j].Obj^.aType = 0 ) and
       ( Damp[j].Obj^.IdUsed <> '*' ) and
       ( Damp[j].Obj^.IdUsed = null ) then Inc( result );
end;
//******************************************************************************
Function TVehiclePlaceView.FFindCountEmptyPlaceWithNoHole( Damp:TDampValueObjArr; StartIndex:Integer=0 ):Integer;
var j:integer;
begin
  result :=0;
  for j:=StartIndex to Length(Damp)-1 do
    if ( Damp[j].Obj^.aType = 0 ) and
       ( Damp[j].Obj^.IdUsed <> '*' ) and
       ( Damp[j].Obj^.IdUsed = null ) and
       ( not FCheckRowFoHole( Damp[j].Row , Damp[j].lev,  Damp ) ) then Inc( result );
end;
//******************************************************************************
Function TVehiclePlaceView.FFindRowDampIndexForPlaceWithHole( Damp:TDampValueObjArr; IndexDamp:Integer=0 ):Integer;
var i:Integer;
    CountFreePlaceInRow:Integer;
    CountPlaceInRow:Integer;
begin
  result := -1;
  for i:=IndexDamp to Length(Damp)-1 do
  begin
    CountPlaceInRow := FFindCountPlaceInRow(i, Damp);
    CountFreePlaceInRow := FFindCountPlaceFreeInRow( i, Damp);

    if ( CountFreePlaceInRow<>0 )and(CountPlaceInRow <> CountFreePlaceInRow) then
    begin
      Result := i;
      Break;
    end;
  end;
end;
//******************************************************************************
Function TVehiclePlaceView.FFindDampIndexBy(Col,Row,lev:Integer; Damp:TDampValueObjArr ):Integer;
var i:Integer;
begin
  Result := -1;
  for i:=0 to Length(Damp)-1 do
  begin
    if ( Damp[i].Col = Col ) and
       ( Damp[i].Row = Row ) and
       ( Damp[i].lev = lev) then
    begin
      result := i;
      Break;
    end;
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FAddObjToDamp( aObj:TDampValueObj; var aTempDamp:TDampValueObjArr; ReservPlace:Boolean= false );
var len:Integer;
begin
  len:=Length(aTempDamp);
  SetLength(aTempDamp,len+1);
  aTempDamp[len] := aObj;

  if ReservPlace then aTempDamp[len].Obj^.IdUsed :='*';
end;
//******************************************************************************
Function TVehiclePlaceView.FFindAllPlacesForCurrPlace( CurrIndexDamp:Integer; Damp:TDampValueObjArr; Revers:Boolean=True; FindInLine:Boolean=false ):TDampValueObjArr;
var CurrObj:TDampValueObj;
    CurrLevel:Integer;
    Col:Integer;
    StartCol:Integer;
    LastCol:Integer;
    RowWithHole:Boolean;
//***********************************************
Procedure AddObjToResult( Col, Row, lev:Integer );
var CurrIndex:Integer;
begin
  CurrIndex := FFindDampIndexBy( Col,Row,lev, Damp );
  if (CurrIndex <> -1)and(Damp[CurrIndex].Obj^.aType=0)and(Damp[CurrIndex].lev = CurrLevel) then
    FAddObjToDamp( Damp[CurrIndex], result );
end;
//***********************************************
begin
  SetLength( result,0 );
  if CurrIndexDamp = -1 then exit;
  try
    CurrObj := Damp[CurrIndexDamp];
    CurrLevel := CurrObj.lev;

    StartCol := FFindPrevColForIndexDump( CurrIndexDamp, Damp );
    if not FindInLine then LastCol := FFindNextColForIndexDump( CurrIndexDamp, Damp )
    else LastCol:= FFindLastColForIndexDump(CurrIndexDamp, Damp);

    RowWithHole := FCheckRowFoHole( CurrObj.Row , CurrObj.lev,  Damp );
    if RowWithHole then
    begin

      if not Revers then
      begin
        for col:=StartCol to LastCol do
          AddObjToResult( Col,CurrObj.Row, CurrObj.lev );
        for col:=StartCol to LastCol do
          AddObjToResult( Col,CurrObj.Row-1, CurrObj.lev );
        for col:=StartCol to LastCol do
          AddObjToResult( Col,CurrObj.Row+1, CurrObj.lev );
      end
      else
      begin
        for col:=LastCol downto StartCol do
          AddObjToResult( Col,CurrObj.Row, CurrObj.lev );
        for col:=LastCol downto StartCol do
          AddObjToResult( Col,CurrObj.Row-1, CurrObj.lev );
        for col:=LastCol downto StartCol do
          AddObjToResult( Col,CurrObj.Row+1, CurrObj.lev );
      end;

    end
    else
    begin
       AddObjToResult( CurrObj.Col, CurrObj.Row, CurrObj.lev );
       AddObjToResult( CurrObj.Col, CurrObj.Row-1, CurrObj.lev );
       AddObjToResult( CurrObj.Col, CurrObj.Row+1, CurrObj.lev );
       if not Revers then
       begin
         AddObjToResult( CurrObj.Col-1,CurrObj.Row, CurrObj.lev );
         AddObjToResult( CurrObj.Col-1,CurrObj.Row-1, CurrObj.lev );
         AddObjToResult( CurrObj.Col-1,CurrObj.Row+1, CurrObj.lev );

         AddObjToResult( CurrObj.Col+1,CurrObj.Row, CurrObj.lev );
         AddObjToResult( CurrObj.Col+1,CurrObj.Row-1, CurrObj.lev );
         AddObjToResult( CurrObj.Col+1,CurrObj.Row+1, CurrObj.lev );
       end
       else
       begin
         AddObjToResult( CurrObj.Col+1,CurrObj.Row, CurrObj.lev );
         AddObjToResult( CurrObj.Col+1,CurrObj.Row-1, CurrObj.lev );
         AddObjToResult( CurrObj.Col+1,CurrObj.Row+1, CurrObj.lev );

         AddObjToResult( CurrObj.Col-1,CurrObj.Row, CurrObj.lev );
         AddObjToResult( CurrObj.Col-1,CurrObj.Row-1, CurrObj.lev );
         AddObjToResult( CurrObj.Col-1,CurrObj.Row+1, CurrObj.lev );
       end;
    end;

  except
    ShowMessage(IntToStr(CurrIndexDamp));
  end;
end;
//******************************************************************************
Function TVehiclePlaceView.FFindIndexDampForObj(aTempDamp:TDampValueObj; Damp:TDampValueObjArr ):Integer;
var i:Integer;
begin
  result := -1;
  for i:=0 to Length(Damp)-1 do
  begin
    if Damp[i].Obj = aTempDamp.Obj then
    begin
      result :=i;
      Break;
    end;
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FFindPlaceForFreeWithHole( FreePlace:Integer; Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArrArr; StartIndexDump:Integer=0 );
var TempDump:TDampValueObjArr;
    StartFind : Integer;
    TempResult : TDampValueObjArr;
    CheckPlaceAfter:Boolean;
begin
  SetLength( TempResult, 0 );
  StartFind := StartIndexDump;

  StartFind := FFindRowDampIndexForPlaceWithHoleAndFree( FreePlace, Damp, StartIndexDump );
  if StartFind = -1 then StartFind := StartIndexDump;

  while (StartFind<>-1) do
  //for i:= StartFind to Length(Damp)-1 do
  begin
    if Damp[StartFind].Obj^.aType = 0 then
    begin
      if not ( FCheckObjIsNearArrObj(  Damp[StartFind], TempResult, Damp )) then  SetLength( TempResult, 0 );
      
      TempDump := FFindAllPlacesForCurrPlace( StartFind, Damp, not FCheckColRightHole( StartFind,  Damp ) );
      if Length(TempDump)<>0 then
      begin
        TempResult := FFindPlacesNearFromTempDamp( StartIndexDump, TempDump,Damp, True, FreePlace );
        if Length( TempResult) <> 0 then
          FAddToResultDampArr( TempResult, AllShemaDamp );
      end;

      if FreePlace = Length(AllShemaDamp) then exit;
      StartFind := StartFind + 1;

      StartFind := FFindRowDampIndexForPlaceWithHoleAndFree( FreePlace, Damp, StartFind );
    end;

  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FAddToResultDampArr( aDamp:TDampValueObjArr;var AllDamp:TDampValueObjArrArr );
var len:Integer;
begin
  len:=Length(AllDamp);
  SetLength(AllDamp,len+1);
  AllDamp[len]:=aDamp;
end;
//****************************************************
procedure TVehiclePlaceView.FAddToResultDamp( aDampObj:TDampValueObj;var AllDamp:TDampValueObjArr; SetReserved:Boolean=False );
var i:Integer;
    len:Integer;
    find:Boolean;
begin
  find := false;
  for i:=0 to Length( AllDamp )-1 do
   if AllDamp[i].Obj = aDampObj.Obj then begin find:= True; Break; end;

  if not find then
  begin
    len:=Length(AllDamp);
    SetLength(AllDamp,len+1);
    AllDamp[len]:=aDampObj;
    if SetReserved then self.FSetReservedObj( aDampObj );
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FFindPlaceForFreeAllParam( Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArr;StartIndexDump:Integer=0; JustPlaceWithHole:Boolean=False );
var i,j:Integer;
    TempDump:TDampValueObjArr;
    TempResult : TDampValueObjArr;
    TempResultWithoutHole: TDampValueObjArr;
begin

  for i:= StartIndexDump to Length(Damp)-1 do
  begin
    if Damp[i].Obj^.aType = 0 then
    begin
      TempDump := FFindAllPlacesForCurrPlace( i, Damp, not FCheckColRightHole( i,  Damp ) );
      if Length(TempDump)<>0 then
      begin
        TempResult := FFindPlacesNearFromTempDamp( StartIndexDump, TempDump, Damp, JustPlaceWithHole  );

        if ( Length(TempResult)<>0 )  and
           ( FFindIndexDampForObj( TempDump[0], TempResult ) <> -1 ) then
        begin
          for j:=0 to Length(TempResult)-1 do
            FAddToResultDamp( TempResult[j], AllShemaDamp );
        end;
        //  FAddToResultDampArr( TempResult, AllShemaDamp );
      end;
    end;

  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FFindPlaceForFreeAll( Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArr;StartIndexDump:Integer=0 );
var i:Integer;
    TempDump:TDampValueObjArr;
    TempResult : TDampValueObjArr;
    TempResultWithoutHole: TDampValueObjArr;
begin
  FFindPlaceForFreeAllParam( Damp, AllShemaDamp,StartIndexDump,True );
  FFindPlaceForFreeAllParam( Damp, AllShemaDamp,StartIndexDump,False );
end;
//******************************************************************************
procedure TVehiclePlaceView.FFindPlaceForFree( FreePlace:Integer; Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArrArr; StartIndexDump:Integer=0 );
var i:Integer;
    TempDump:TDampValueObjArr;
    TempResult : TDampValueObjArr;
begin

  for i:= StartIndexDump to Length(Damp)-1 do
  begin
    if Damp[i].Obj^.aType = 0 then
    begin
      TempDump := FFindAllPlacesForCurrPlace( i, Damp, not FCheckColRightHole( i,  Damp ) );
      if Length(TempDump)<>0 then
      begin
        TempResult := FFindPlacesNearFromTempDamp( StartIndexDump, TempDump, Damp, True,FreePlace );

        if {( CheckPlaceAfter ) and }( Length ( TempResult )= FreePlace) and
           ( FFindIndexDampForObj( TempDump[0], TempResult ) <> -1 ) then
           FAddToResultDampArr( TempResult, AllShemaDamp );
      end;
    end;

  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FFindPlaceForFreeNearHole( FreePlace:Integer; Damp:TDampValueObjArr; var AllShemaDamp:TDampValueObjArrArr; StartIndexDump:Integer=0 );
var i:Integer;
    TempDump:TDampValueObjArr;
    TempResult : TDampValueObjArr;
begin

  for i:= StartIndexDump to Length(Damp)-1 do
  begin
    if Damp[i].Obj^.aType = 0 then
    begin
      TempDump := FFindAllPlacesForCurrPlace( i, Damp, not FCheckColRightHole( i,  Damp ), True );
      if Length(TempDump)<>0 then
      begin
        TempResult := FFindPlacesNearFromTempDamp( StartIndexDump, TempDump, Damp, True,FreePlace );

        if ( Length ( TempResult ) = FreePlace) and
           ( FFindIndexDampForObj( Damp[i], TempResult ) <> -1 ) then
           FAddToResultDampArr( TempResult, AllShemaDamp );
      end;
    end;

  end;
end;
//******************************************************************************
Function TVehiclePlaceView.FFindRowDampIndexForPlaceWithHoleAndFree( CountFree : Integer; Damp:TDampValueObjArr; CurrFindIndx:Integer=-1 ):Integer;
var TempDamp : TDampValueObjArr;
begin
  result := -1;
  if CurrFindIndx = -1 then CurrFindIndx:=0;
  while CurrFindIndx <> -1 do
  begin
    CurrFindIndx := FFindRowDampIndexForPlaceWithHole( Damp, CurrFindIndx );
    if CurrFindIndx = -1 then Break;

    TempDamp := FFindAllPlacesForCurrPlace( CurrFindIndx, Damp );

    if (FFindIndexDampForObj( Damp[CurrFindIndx], TempDamp )<>-1) then
    begin
      result := CurrFindIndx;
      break;
    end
    else CurrFindIndx:= CurrFindIndx+1;
  end;
end;
//******************************************************************************
function  TVehiclePlaceView.FGetCountDifPlaceInShema( AllShemaDamp:TDampValueObjArrArr ):Integer;
var i,j:Integer;
    DifPlace:TTVehiclePlaceCheckArr;
//***********************************************
procedure Add( aPlace:String );
var j:Integer;
    find:boolean;
    len:Integer;
begin
  find :=False;
  for j:=0 to Length(DifPlace)-1 do
    if ( DifPlace[j].Place = aPlace) then find:=True;

  if not find then
  begin
    len:=Length( DifPlace );
    SetLength( DifPlace, len+1 );
    DifPlace[len].Place := aPlace;
  end;
end;
//***********************************************
begin
  SetLength(DifPlace,0);

  for i:=0 to Length(AllShemaDamp)-1 do
  for j:=0 to Length(AllShemaDamp[i])-1 do
    Add( AllShemaDamp[i][j].Obj^.VehiclePlace );

  result := Length( DifPlace );
end;
//******************************************************************************
function TVehiclePlaceView.FCheckPlaceAfter( StartVehiclePlace,CurrVehiclePlace:String; Damp:TDampValueObjArr ):boolean;
var i:Integer;
    StartCheck:Boolean;
begin
  result := False;
  StartCheck := False;

  for i:=0 to Length(Damp)-1 do
  begin

    if CompareText( Damp[i].Obj^.VehiclePlace,StartVehiclePlace ) = 0 then StartCheck := True;

    if (CompareText( Damp[i].Obj^.VehiclePlace,CurrVehiclePlace ) = 0)and
       ( StartCheck ) then
    begin
      result := True;
      break;
    end;

  end;
end;
//******************************************************************************
function TVehiclePlaceView.FCheckPlaceAfterTempDamp( StartVehiclePlace:String; TempDamp, Damp:TDampValueObjArr ):boolean;
var i:Integer;
begin
  result := True;

  for i:=0 to Length(TempDamp)-1 do
  begin
    if not FCheckPlaceAfter( StartVehiclePlace,TempDamp[i].Obj^.VehiclePlace, Damp ) then
    begin
      Result := False;
      Break;
    end;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.FCheckPlaceBeforeHole( DampObj:TDampValueObj;Damp:TDampValueObjArr ):Boolean;
var IndexDump:Integer;
begin
  Result := False;
  IndexDump := Self.FFindDampIndexBy( DampObj.Col, DampObj.Row+1, DampObj.lev, Damp );
  if (IndexDump<>-1)and(Damp[IndexDump].Obj^.aType<>0 ) then Result := True;
end;
//******************************************************************************
function TVehiclePlaceView.FCheckPlaceOneOnPrevHole( DampObj:TDampValueObj;Damp:TDampValueObjArr; FreePlace:Integer ):Boolean;
begin
  result:= (FreePlace = 1)and(FCheckPlaceBeforeHole( DampObj,Damp ) );
end;
//******************************************************************************
function TVehiclePlaceView.FFindBestIndexDamp( StartIndexDump:Integer; ShemaDamp:TDampValueObjArrArr; Damp:TDampValueObjArr;Var CountDifRowMin:integer; FreePlace:Integer=-1 ):Integer;
var i,j : Integer;
    DampHole:Boolean;
    DampHoleAllShema:Integer;
    CheckPlaceAfter:Boolean;
    DifRow:TRowLevelCheckArr;
    MinCountPlace:Integer;
    MaxRow,MinRow:Integer;
    MaxMinCurrRow:Integer;
    OnePlaceBeforeHole:Boolean;
//***********************************************
procedure AddDifRow(aRow,aLev:Integer);
var j:Integer;
    find:boolean;
    len:Integer;
begin
  find :=False;
  for j:=0 to Length(DifRow)-1 do
    if ( DifRow[j].Row =aRow )and
       ( DifRow[j].Lev = aLev ) then find:=True;

  if not find then
  begin
    len:=Length( DifRow );
    SetLength( DifRow, len+1 );
    DifRow[len].Row := aRow;
    DifRow[len].Lev := aLev;
  end;
end;
//***********************************************
begin
  CountDifRowMin :=0;
  result := -1;
  MinCountPlace := 0;
  MaxMinCurrRow := 0;

  MaxRow := 0;
  MinRow := 0;
  //****************************************************
  DampHoleAllShema:= FCheckDampForRowNotHoleArr( ShemaDamp, Damp);

  for i:=0 to Length(ShemaDamp)-1 do
  begin
    //if (( FreePlace<> -1 )and( Length( ShemaDamp[i] ) >=FreePlace)) or ( FreePlace =-1) then
    begin
      SetLength( DifRow, 0 );

      DampHole := FCheckDampForRowNotHole( ShemaDamp[i], Damp );
      CheckPlaceAfter := FCheckPlaceAfterTempDamp( Damp[StartIndexDump].Obj^.VehiclePlace, ShemaDamp[i], Damp );

      if (CheckPlaceAfter) and ( ( DampHole ) or ( DampHoleAllShema = Length(ShemaDamp) ) )  then
      begin

        for j:=0 to Length( ShemaDamp[i] )-1 do
        begin
          AddDifRow( ShemaDamp[i][j].Row, ShemaDamp[i][j].lev );

          if (ShemaDamp[i][j].Row>MaxRow)or (MaxRow=0) then MaxRow:=ShemaDamp[i][j].Row;
          if (ShemaDamp[i][j].Row<MinRow)or (MinRow=0) then MinRow:=ShemaDamp[i][j].Row;

        end;

        if (Length( ShemaDamp[i] )=1)and(FCheckPlaceOneOnPrevHole( ShemaDamp[i][0],Damp, FreePlace )) then OnePlaceBeforeHole:=True
        else OnePlaceBeforeHole := False;

        if (( CountDifRowMin > Length(DifRow))  or (CountDifRowMin=0) ) and
           (( MaxMinCurrRow > abs(MaxRow - MinRow)) or (MaxMinCurrRow = 0) ) and
           (( MinCountPlace <= Length( ShemaDamp[i] )) or (MinCountPlace=0)) and (not OnePlaceBeforeHole) then
        begin
          MinCountPlace := Length( ShemaDamp[i] );
          CountDifRowMin := Length(DifRow);
          MaxMinCurrRow := abs(MaxRow - MinRow);
          result := i;
        end;

      end;
    end;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.FCheckObjIsNearArrObj( DampObj:TDampValueObj;ArrPlace:TDampValueObjArr; Damp:TDampValueObjArr  ):Boolean;
var IndexDump:Integer;
    TempDamp:TDampValueObjArr;
    i,j:Integer;
    CurrIndexPlace:Integer;
    RightHolePlace:Boolean;

    CurrIndexTemp:Integer;
    RightHoleTemp:Boolean;
begin
  IndexDump := Self.FFindIndexDampForObj(DampObj,Damp);
  TempDamp := FFindAllPlacesForCurrPlace( IndexDump, Damp, not FCheckColRightHole( IndexDump,  Damp ) );

  result := False;
  for i:=0 to Length(ArrPlace)-1 do
  begin
     CurrIndexPlace := Self.FFindIndexDampForObj(ArrPlace[i],Damp);
     RightHolePlace := FCheckColRightHole( IndexDump,  Damp );

     for j:=0 to Length( TempDamp )-1 do
     begin
       CurrIndexTemp := Self.FFindIndexDampForObj( TempDamp[j],Damp);
       RightHoleTemp := FCheckColRightHole( CurrIndexTemp,  Damp );
       if ( ArrPlace[i].Obj = TempDamp[j].Obj)and(RightHoleTemp=RightHolePlace) then
       begin
         result:=True;
         Exit;
       end;
     end;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.FFindFreeObjIsNearInArrObj( FreePlace:Integer; ArrPlace:TDampValueObjArr; Damp:TDampValueObjArr ):TDampValueObjArr;
var i,j:Integer;
begin
 try
   for i:=0 to Length(ArrPlace)-1 do
   begin
     SetLength(result,0);

     for j:=0 to Length(ArrPlace)-1 do
     begin

       if ( (FCheckObjIsNearArrObj( ArrPlace[j], result, Damp  )) or
          ( Length(result)=0) ) and
          ( FCheckObjIsFree( ArrPlace[j]) ) then
        self.FAddToResultDamp( ArrPlace[j], result, false );

       if Length(Result) >= FreePlace then exit;

     end;
   end;
 finally
   for i:=0 to Length(Result)-1 do
    FSetReservedObj(  Result[i] );
 end;
 
end;
//******************************************************************************
procedure TVehiclePlaceView.FindPlaceForFreeInHole( AllFreePlace,CurrFreePlace, StartIndexDump:Integer; Damp:TDampValueObjArr; var ResultPlace:TDampValueObjArr );
var I:Integer;
    AllShemaDampWithHole:TDampValueObjArr;
    TempResult : TDampValueObjArr;
begin

  FFindPlaceForFreeAll( Damp, AllShemaDampWithHole, StartIndexDump );
  TempResult := FFindPlacesNearFromTempDamp( StartIndexDump, AllShemaDampWithHole, Damp, False );
  try
    if Length( ResultPlace)<>0 then
    begin
      for i:=0 to Length(AllShemaDampWithHole)-1 do
      if  ( FCheckObjIsNearArrObj( AllShemaDampWithHole[i], ResultPlace, Damp )or
          ( Length(ResultPlace)=0) ) then
      begin
        self.FAddToResultDamp( AllShemaDampWithHole[i], ResultPlace, False );
        if AllFreePlace = Length(ResultPlace) then Break;
      end;
    end
    else ResultPlace := FFindFreeObjIsNearInArrObj( CurrFreePlace, TempResult, Damp );

    if AllFreePlace <> Length(ResultPlace) then
     for i:=0 to Length(AllShemaDampWithHole)-1 do
     begin
       self.FAddToResultDamp( AllShemaDampWithHole[i], ResultPlace, False );
       if AllFreePlace = Length(ResultPlace) then Break;
     end;

     //***********************
  finally
     for i:=0 to Length(ResultPlace)-1 do
      FSetReservedObj(  ResultPlace[i] );
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.FStartFindPlaceForFree( FreePlace, StartIndexDump:Integer;Damp:TDampValueObjArr; var ResultPlace:TDampValueObjArr  );
var AllShemaDamp:TDampValueObjArrArr;
    j:Integer;
    BestIndexDump1:Integer;
    OldFreePlace:Integer;
    CountDifRowMin1:integer;
    FindPlace:Integer;
    DampHoleAllShema:integer;
    CountFreePlace:Integer;
    CountFreePlaceWithNoHole:Integer;
    SaveFreePlace:Integer;
    AddPlace:Integer;
begin
  if FreePlace = 0  then exit;

  SetLength( AllShemaDamp, 0 );

  AddPlace := 0;
  SaveFreePlace :=FreePlace;
  CountFreePlace := -1;

  while ((FreePlace > 0)or(AddPlace<>0))and(CountFreePlace<>0) do
  begin
    CountFreePlace := FFindCountEmptyPlace( Damp,StartIndexDump );
    CountFreePlaceWithNoHole := FFindCountEmptyPlaceWithNoHole( Damp, StartIndexDump);

    if (FreePlace <= 0) and (AddPlace>0) then
    begin
      FreePlace := AddPlace;
      AddPlace  := 0;
    end;

    SetLength(AllShemaDamp,0);
    if FreePlace mod 2 <>0 then
      FFindPlaceForFreeWithHole( FreePlace, Damp, AllShemaDamp, StartIndexDump ); // пошук непарних де Ї дири

    DampHoleAllShema:= FCheckDampForRowNotHoleArr( AllShemaDamp, Damp);
    FindPlace := FGetCountDifPlaceInShema( AllShemaDamp );

    if ( FindPlace < FreePlace ) then SetLength(AllShemaDamp,0);

    if ( Length(AllShemaDamp ) =0 )or ( DampHoleAllShema >0 )or ( FreePlace mod 2 =0 ) then
    begin
      FFindPlaceForFree( FreePlace, Damp, AllShemaDamp, StartIndexDump );
      if Length(AllShemaDamp) = 0 then
        FFindPlaceForFreeNearHole( FreePlace, Damp, AllShemaDamp, StartIndexDump  );
    end;

    DampHoleAllShema:= FCheckDampForRowNotHoleArr( AllShemaDamp, Damp);

    if CountFreePlace = CountFreePlaceWithNoHole then // €кщо Ї м≥сц€ лише на бамбетл€х (в р€дах без проходу)
      FindPlaceForFreeInHole( SaveFreePlace,FreePlace, StartIndexDump, Damp, ResultPlace )
    else //€кщо знайдено разом м≥сц€
    begin
      if ( Length(AllShemaDamp) <> 0)and( (DampHoleAllShema=0)or(DampHoleAllShema=Length(AllShemaDamp))) then
      begin
        BestIndexDump1 := FFindBestIndexDamp( StartIndexDump, AllShemaDamp, Damp, CountDifRowMin1, FreePlace  );

        for j:=0 to Length( AllShemaDamp[BestIndexDump1] )-1 do
          self.FAddToResultDamp( AllShemaDamp[BestIndexDump1][j], ResultPlace, true );

        FreePlace :=FreePlace-Length(AllShemaDamp[BestIndexDump1]);
      end
      else
      begin
        if Length(ResultPlace)<>SaveFreePlace then
        begin // якщо знайдено м≥сц€ разом алене потр≥бну к≥ьк≥сть тому зменшуЇм пошук к≥лькост≥ м≥сць -1
          OldFreePlace := FreePlace;
          if FreePlace mod 2 <> 0 then
            FreePlace := FreePlace-1
          else FreePlace := FreePlace div 2;

          AddPlace := AddPlace + OldFreePlace - FreePlace;
        end;
      end;
    end;

    if (SaveFreePlace = Length(ResultPlace)) then break;
  end;

end;
//******************************************************************************
function TVehiclePlaceView.FFindIndexMapForVehiclePlace( aVehiclePlace:String; Damp:TDampValueObjArr ):Integer;
var i:Integer;
begin
  result := -1;

  for i:=0 to Length(Damp)-1 do
  begin
    if CompareText( Damp[i].Obj^.VehiclePlace, aVehiclePlace ) = 0 then
    begin
      result := i;
      Break;
    end;
  end;
end;
//******************************************************************************
procedure TVehiclePlaceView.UnreservedPlace( aDamp:TDampValueObjArr );
var i:Integer;
begin
  for i:=0 to Length(aDamp)-1 do
    if aDamp[i].Obj^.IdUsed ='*' then
      aDamp[i].Obj^.IdUsed := null;
end;
//******************************************************************************
function TVehiclePlaceView.FindPlaceForFree( FreePlace:Integer; StartPlace:String; SetReserved:Boolean ):TDampValueObjArr;
var Damp:TDampValueObjArr;
    ResultPlace:TDampValueObjArr;
    StartIndexDump:Integer;
    CountFree:Integer;
begin
  FReadDataToDampFromView( Damp );
  StartIndexDump := FFindIndexMapForVehiclePlace( StartPlace, Damp );
  if StartIndexDump = -1 then StartIndexDump:=0;

  CountFree := FFindCountEmptyPlace( Damp, StartIndexDump );

  if CountFree < FreePlace then
  begin
    FreePlace := CountFree;
    SetReserved := False;
  end;

  FStartFindPlaceForFree( FreePlace, StartIndexDump, Damp, ResultPlace );

  if not SetReserved then UnreservedPlace( ResultPlace );

  result := ResultPlace;
end;
//******************************************************************************
function TVehiclePlaceView.GetCountMaxColLevel:Integer;
var i:Integer;
begin
  result := 0;
  for i := 0 to self.FView.Bands.Count - 1 do
  begin
    if ( self.FView.Bands[i].ColumnCount > result)or(result=0) then
      result:= self.FView.Bands[i].ColumnCount;
  end;
end;
//******************************************************************************
function TVehiclePlaceView.GetCountRow:Integer;
begin
  result := self.FView.DataController.RecordCount;
end;
//******************************************************************************
function TVehiclePlaceView.ShemaIs:Boolean;
begin
  result:= self.FView.DataController.RecordCount<>0;
end;
//******************************************************************************
procedure TVehiclePlaceView.ViewByStrData( aLevel:Integer; aStr:String );
var aList:TStringList;
    Col , Row : Integer;
    ColCount:Integer;
    RowCount:Integer;
    Band : TcxGridBand;
    StartRedIndex:Integer;
    CurrChar:String;
    PObjCell:PCellVehicleObj;

    CeilValue:Variant;
begin
  aList := SplitToWordsBySpliters( aStr,[','] );
  ColCount := StrToInt( aList[0] );
  RowCount := StrToInt( aList[1] );
  aList.Delete(0);
  aList.Delete(0);
  Band := FMakeBandLevel( aLevel );
  
  self.FMakeTemplate( aLevel, RowCount,ColCount );

  StartRedIndex := 0;

  for Row := 0 to RowCount-1 do
  begin

    for Col:=0 to Band.ColumnCount-1 do
    begin

      CeilValue := self.FView.DataController.Values[ Row, Band.Columns[Col].Index ];
      if ( CeilValue <> null ) and (CeilValue<>'') then
      begin
        CurrChar := aList.Strings[StartRedIndex];

        PObjCell := PCellVehicleObj( Integer(CeilValue) );

        if CurrChar='*' then
        begin
          PObjCell^.aType :=-2;
          PObjCell^.VehiclePlace := '';
        end
        else
        begin
          PObjCell^.aType := 0;
          PObjCell^.VehiclePlace := CurrChar;
        end;
      end;

      Inc(StartRedIndex);
    end;
  end;

end;

end.
 