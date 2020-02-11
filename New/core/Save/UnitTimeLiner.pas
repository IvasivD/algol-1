unit UnitTimeLiner;

interface
uses                                                                                                            
   Windows, Messages, SysUtils, Classes, Graphics, Controls,Contnrs, Forms, Dialogs,Variants, cxGraphics , cxClasses , Math, cxGridTableView, cxStyles ,
   ImgList, ExtCtrls, ComCtrls, StdCtrls, ActnList , Buttons, cxRichEdit,cxEdit,cxGridBandedTableView,DB,DateUtils,cxGridCustomTableView ,cxGrid , MyHint,UnitProc ;

const MasMonthEng:array[1..12] of string = ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
const MasMonthRus:array[1..12] of string = ('января', 'февраля', 'марта', 'апреля','мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября','декабря');
const MasMonthUkr:array[1..12] of string = ('Січень', 'Лютий', 'Березень', 'Квітень','Травень', 'Червень', 'Липень', 'Серпень', 'Вересень', 'Жовтень', 'Листопад','Грудень');

const DayNamesEng    : array[1..7] of string =('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'  );
const DayNamesRus    : array[1..7] of string =('Понедельник','Вторник','Среда','Четверг','Пятница','Субота','Воскресение' );
const DayNamesUkr    : array[1..7] of string =('Понеділок','Вівторок','Середа','Четвер','П''ятниця','Субота','Неділя' );

const DayNamesShortEn  :array[1..7] of string = ('mo','tu','we','th','fr','sa','su');
const DayNamesShortUkr  :array[1..7] of string = ('пн','вт','ср','чт','пт','сб','нд');
const DayNamesShortRus  :array[1..7] of string = ('пн','вт','ср','чт','пт','сб','вс');

const MergeTopLeft = 2;

type
 TPointMonth=record
    month:Integer;
    day:Integer;
  end;

 TFieldText = Packed record
  FieldName:WideString;
  ColorFiledName:WideString;
  FontStyles:TFontStyles;
  Color:TColor;
  Text:Widestring;
 end;

 PFieldText = ^TFieldText;

 TCellObj=Packed Record
  id : Variant;
  TextList :TList;
  CountDay :Integer;
  StartColIndex :Integer;
  FinishColIndex :Integer;
  RowIndex:Integer;
  BGColor:TColor;

  Hint :WideString;
 end;
 PCellObj = ^TCellObj;

 TDataDB = record
   id:variant;
   Text:TList;
   BgroundColor:TColor;
   CountCol:Integer;
   Hint:WideString;
   ColumnIndex:Integer;
   FontStyles:TFontStyles;
 end;
 PDataDB = ^TDataDB;


 TEventSelectCell = procedure (id:Variant) of object;
 TEventUpdateValue = procedure (id:Variant; FieldName:string;Value:Variant ) of object;

 TTimeLinerView=class
 private

  FView:TcxGridBandedTableView;
  FDB:TDataSet;
  FMasMonth:array[1..12] of String;
  FMasDayWeek:array[1..7] of String;

  FStartDate : TDateTime;
  FEndDate : TDateTime;

  FFieldNameID:string;
  FFieldBgroundColor:string;
  FFieldNameDate:string;
  FFieldNameCountDay:string;
  FFieldNameArriveTime:string;
  FFieldNameHint :String;

  FShowDataOutRangeDate:boolean;
  FColumnWidth:integer;

  FBorderWidth:Integer;
  FBorderColor:TColor;
  FListShowFields:TList;

  PersonalDrawCell: TcxGridTableDataCellCustomDrawEvent;
  PersonalMouseUp : TMouseEvent;
   
  FColBeforeDay: Widestring;
  FColAfterDay : Widestring;
  FHeightRow:Integer;
  FShowSplitLine:boolean;
  FColorSplitLIne:TColor;
  FHeightSplitLine:Integer;
  FCanvas:TcxCanvas;
  FShowColor:boolean;
  FDefColorSelection : TColor;
  FDefColorFontSelection: TColor;
  FDefColorText:TColor;
  FDefBgroundColorCell:TColor;
  FColorSunday:TColor;
  FColorHeaderSelection:TColor;
  
  FChangeFocuse:Boolean;

  FHintColor :TColor;
  FHintBorder :TColor;

  FEventSelectCell : TEventSelectCell;
  FEvaentUpdateValue: TEventUpdateValue;
  FHint :TMyHint;
  FSaveFocusedRow:Integer;
  FSaveFocusedCol:Integer;
  FTopRowIndex:Integer;
  FStyleHeaderSelection:TcxStyle;
  //FSearchEmptySpace:Boolean;

  function  FGetTextFromList(aList:Tlist):Widestring;
  function  SetPoint(month,day:Integer): Integer;
  function  GetPoint(value: Integer): TPointMonth;
  Procedure FBuildBundMonth;
  procedure FBuildBundDaysForMonth(aMonthBand:TcxGridBand;Year, Month , DayStartForMonth ,DayEndForMonth:Integer );
  Function  FcreateColumn(aDayBand:TcxGridBand):TcxGridBandedColumn;
  procedure FAutoBandWidth(aBand:TcxGridBand);
  procedure FBuildBundBeforeAfterDaysForDay(aDayBand:TcxGridBand);
  function  FFindMonthDayBand(Month, Day:Integer):TcxGridBand;
  function  FindTypeDayBand( DayBand:TcxGridBand; TypeDay:Integer ):TcxGridBandedColumn;
  procedure FBuildData(Add:Boolean = false);
  Function  AddRow:Integer;
  function  FGetDataCurrFromDB:PDataDB;
  function  FgetShowText:TList;
  function  FCalculateColumnCellCountDay(CountDay,TypeDayStart, TypeDayArriv:Integer):Integer;
  procedure FDisposeCellMem;
  procedure FDisposeRowCellMem(Row,ColStart,ColEnd:Integer;EmptyTextList:Boolean=true);
  function  FCreateObjCell( id:Variant; Text: TList;BgroundColor:TColor; CountColumnCell, StartColIndex,FinishColIndex: Integer;aHint:Widestring):PCellObj;
  Function  FFindDataForCell(Row,Col,CountColCell:Integer):Boolean;
  procedure FAddTextToRow(id:Variant; aText:TList;BgroundColor:TColor; StartRow,Col,CountColCell:Integer;aHint:Widestring; AddNewRowNotSearchEmptySpace:Boolean=false );
  procedure FUpdateTextRow( id:Variant; aText:TList; BgroundColor:TColor; aHint:Widestring );
  function  FCalculateWithAreaColumn(StartCol,EndCol:Integer):Integer;

  function  FindFistColumnOnDisplay(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer;var cellOnDisplay:TcxGridTableDataCellViewInfo):Integer;
  function  FindFistColumnOnDisplayRect(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer ):TRect;
  function  FindLastColumnOnDisplay(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer;var cellOnDisplay:TcxGridTableDataCellViewInfo):Integer;

  function  FGetWidthAreaBetweenColumns(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer):Integer;
  function  FPrepareTextToView(aText:WideString;Acanvas:TcxCanvas;WidthArea:Integer):WideString;
  function  FPrepareListTextToView(aList:TStringLIst;Acanvas:TcxCanvas;WidthArea:Integer):Widestring;
  procedure FDrawListTexT( ACanvas: TcxCanvas;AreaDrawText:TRect;VisibleWidth:Integer;TextList:TList );
  function  FCheckCorrectVisibleTextOnRect(ACanvas: TcxCanvas;AreaDrawText:TRect; TextList:TList):Boolean;
  procedure View1LeftPosChanged(Sender: TObject);
  function  FGetStyleFont:TFont;
  function  FGetDisplayColumnRect(aView:TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer):TRect;
  procedure ViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
  
  procedure ViewGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);

  procedure ViewNameGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);

  procedure ViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);

  procedure ViewFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);

  procedure FActionChangeCell( vlaue:Variant );
  function  FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
  procedure FShowCellFocus(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; FocusRect:TRect);
  procedure ShowBorder(ACanvas: TcxCanvas; aRect: Trect;CurrColumnIndex,StartColIndex , FinishColIndex:Integer; ColorBorder:TColor  );
  function  ColIsFocused(Sender: TcxCustomGridTableView; StartColIndex , FinishColIndex:Integer):Boolean;
  procedure FInsertEmptyRows;

  function  FGetColorFontSelection(Sender: TcxCustomGridTableView):TColor;
  function  FGetColorSelection(Sender: TcxCustomGridTableView):TColor;
  function  FFindCellById( id: Variant ):PCellObj;
  procedure FSetFocuceCell(Col,Row:Integer;TopRowIndex:Integer=-1); overload;
  function  FSetFocuceCell(CellObj: PCellObj): boolean; overload;

  procedure ViewMouseUp(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
  procedure ViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  function  FFindCellForDataField(FieldName: string; Value: Variant): PCellObj;
  procedure FUpdateCellByFieldName(CellObj:PCellObj; FieldName:string;Value:Variant );
  procedure FUpdateFocusedCellsByFieldName(PObjCell:PCellObj; FieldName:string;Value:Variant );
  procedure FDeleteCell( Row:integer;  CellObj : PCellObj );
  procedure FDeleteEmptyRows;
  Function  FGetFocusedValueCell:Variant;
 public


  constructor Create(aView:TcxGridBandedTableView;aDB:TDataSet;aFieldDate,aFieldContDay,aFieldArriveTime:string; aMasMonth , aMasDay:array of String ); overload;
  destructor  Destroy;
  procedure  View(aStartDate,aEndDate:TDateTime;ShowSplitLine:boolean=false;ColorSplitLine:TColor=clSilver;HeightSplitLine:Integer=8;ShowColor:Boolean=false;Add:Boolean =false);
  procedure ShowEmptyRows(ShowSplitLine:boolean=false;ColorSplitLine:TColor=clSilver;HeightSplitLine:Integer=8);
  procedure SetStyleHeaderSelection ( aStyle:TcxStyle );
  function  FindColumn(Month, Day, TypeDay:Integer):TcxGridBandedColumn;
  function  GetTypeDay(aTime:TTime):integer;
  procedure SetWidthColumn (aWidth:Integer);
  procedure SetCaptionColumn( ColBeforeDay , ColAfterDay:Widestring );

  procedure SetBorder( BorderColor:Integer );
  procedure SetDefBgroundColorCell(aColor:TColor);
  procedure SetColorSunday ( aColor:TColor );
  procedure SetShowDataOutRange(aShow:Boolean);
  procedure SetShowFields(idFieldName , FieldBgroundColor:string; masFields:array of string; masColorFields:array of String;masFontStyle:array of TFontStyles; HeightRow:Integer=21 );
  procedure SetHintParam( HintFieldName:string; Color:TColor=clYellow; BorderColor:TColor=-1 );
  procedure Repaint;
  procedure ShowFocusHeader;
  procedure ClearAllRows;
  procedure UpdateData(FieldName:string; Value:Variant);
  function  GetFocuseValueByFieldName(FieldName:String):Variant;
  function  MoveToDate(Date:TDateTime):Boolean;
  procedure SetEventSelectCell(Event : TEventSelectCell);
  procedure SetEventUpdateValue(Event: TEventUpdateValue);
  function  FocusCellById( id:Variant ):boolean;
  function  GetFocusedValueByMouseCoordinate(X,Y:Integer):Variant;
  Function  GetDBValueByID(FieldName:String;IdValue:Variant):Variant;
  Function  GetDBFocusedValueByID(FieldName:String):Variant;
  Function  IsCellFocused:Boolean;
  procedure SaveFocuseCell(SaveRow:Integer=-1; SaveCol:Integer=-1);
  procedure RestoreFocuseCell;
  procedure RefreshById( id:Variant );
end;



implementation

uses  Types, cxCustomData, cxGridCustomView, cxControls;

//MyEventProc:TPrepareAndOpenImage
// MyEventProc(OldImageADS1)
{ TTimeLinerView }
//******************************************************************************
constructor TTimeLinerView.Create( aView: TcxGridBandedTableView; aDB: TDataSet;aFieldDate,aFieldContDay,aFieldArriveTime:string;aMasMonth , aMasDay:array of String );
var i:Integer;
begin
  self.FView:=aView;
  self.FDB  :=aDB;
  for i:=1 to 12 do
    FMasMonth[i]:=aMasMonth[i-1];

  for i:=1 to 7 do
     FMasDayWeek[i]:=aMasDay[i-1];

  PersonalDrawCell:=aView.OnCustomDrawCell;
  PersonalMouseUp :=aView.OnMouseUp;

  self.FFieldNameDate := aFieldDate;
  self.FFieldNameCountDay := aFieldContDay;
  self.FFieldNameArriveTime := aFieldArriveTime;
  self.FColumnWidth := 50;

  aView.OnLeftPosChanged := View1LeftPosChanged;
  aView.OnTopRecordIndexChanged := View1LeftPosChanged;

  aView.OnCustomDrawCell := ViewCustomDrawCell;
  aView.OnGetCellHeight  := ViewGetCellHeight;
  aView.OnFocusedItemChanged :=self.ViewFocusedItemChanged;
  aView.OnFocusedRecordChanged:=self.ViewFocusedRecordChanged;
  aView.OnMouseUp := ViewMouseUp;
  aView.OnKeyDown := ViewKeyDown;

  FListShowFields := TList.Create;
  self.FBorderWidth := 1;
  self.FBorderColor := -1;
  self.FSaveFocusedRow := -1;
  self.FSaveFocusedCol := -1;
  self.FTopRowIndex := -1;
  FStyleHeaderSelection:=nil;

  FColBeforeDay :='';
  FColAfterDay  :='';

  FChangeFocuse := false;
  FDefColorSelection :=clHighlight;
  FDefColorFontSelection :=clWhite;
  FDefColorText :=clBlack;
  FDefBgroundColorCell:=clSilver;

  FFieldNameHint :='';
  FHintColor :=clYellow;
  FHintBorder :=-1;

  FColorSunday :=-1 ;

  FShowDataOutRangeDate:=false;
  FShowSplitLine := false;
  FEventSelectCell := nil;
  FEvaentUpdateValue:=nil;
  
  FHint := TMyHint.Create(aView.Owner);
  
  self.FView.OptionsCustomize.BandMoving :=False;
  self.FView.OptionsCustomize.BandSizing :=False;
  self.FView.OptionsCustomize.ColumnMoving :=False;
  self.FView.OptionsCustomize.ColumnVertSizing:=False;
  self.FView.OptionsCustomize.ColumnHorzSizing:=False;
end;
//******************************************************************************
destructor TTimeLinerView.Destroy;
var i:Integer;
begin
 for i:=0 to FListShowFields.Count-1 do
     Dispose(PFieldText(FListShowFields.Items[i]));

 FListShowFields.Free;
 if FHint.Parent<> nil then
   FHint.free;

 FDisposeCellMem;
end;
//******************************************************************************
procedure TTimeLinerView.FDisposeRowCellMem(Row, ColStart, ColEnd:Integer;EmptyTextList:Boolean=true);
var PObjCell:PCellObj;
    CeilValue:Variant;
    Col , i:Integer;
begin
  for Col:=ColStart to ColEnd do //self.FView.ColumnCount-1 do
    begin
      CeilValue:=self.FView.DataController.Values[Row,Col];

      if (CeilValue<>Null) and (CeilValue<>'') then
      begin
         PObjCell:= PCellObj( Integer( CeilValue ) );

         if (Col = PObjCell^.StartColIndex)and(EmptyTextList)  then  // dispose Memory for Text
           begin
             for i:=0 to PObjCell^.TextList.Count - 1 do
               Dispose( PFieldText(PObjCell^.TextList[i]) );

             PObjCell^.TextList.Free;
           end;

         for i:= PObjCell^.StartColIndex to  PObjCell^.FinishColIndex do
           self.FView.DataController.Values[Row,i]:=null;

         Dispose(PObjCell);
      end;
      self.FView.DataController.Values[Row,Col]:=null;
    end;
end;
//******************************************************************************
procedure TTimeLinerView.FDisposeCellMem;
var Col, Row, i:Integer;
    PObjCell:PCellObj;
    PObjFieldText:PFieldText;
    PObjFieldTextList:TList;
    CeilValue:Variant;
begin
 try
   self.FView.BeginUpdate;

   for Row:=0 to self.FView.DataController.RecordCount-1 do
     FDisposeRowCellMem(Row, 0, self.FView.ColumnCount-1 );
 finally
  self.FView.EndUpdate;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.SetWidthColumn (aWidth:Integer);
begin
 self.FColumnWidth:= aWidth;
end;
//******************************************************************************
function TTimeLinerView.FCreateObjCell(id:Variant; Text:TList;BgroundColor:TColor;  CountColumnCell, StartColIndex, FinishColIndex: Integer; aHint:Widestring):PCellObj;
begin
 New(result);

 if (FinishColIndex >= Self.FView.ColumnCount) then
 FinishColIndex := Self.FView.ColumnCount-1;

 Result.id := id;
 result.TextList := Text;
 result.CountDay := CountColumnCell;
 result.StartColIndex  := StartColIndex;
 result.FinishColIndex := FinishColIndex;
 result.BGColor := BgroundColor;
 
 result.Hint := aHint;
end;
//******************************************************************************
Function TTimeLinerView.FFindDataForCell(Row,Col,CountColCell:Integer):Boolean;
var Len:Integer;
    i:Integer;
    CeilValue:Variant;
begin
  result:=False;

  if self.FView.ColumnCount <= Col then exit;
  
  CeilValue:=self.FView.DataController.Values[Row,Col];
  //if CeilValue=Null then exit;
  //if CeilValue='' then exit;

  for i:=Col to Col + CountColCell-1 do
  begin
    if self.FView.ColumnCount > i then
    begin
      CeilValue := self.FView.DataController.Values[Row,i];
      if CeilValue <> Null then
      begin
        result:=true;
        Break;
      end;
    end;
  end;
end;
//******************************************************************************
Function TTimeLinerView.FFindCellForDataField(FieldName:string;Value:Variant):PCellObj;
var Row,Col,i:Integer;
    CeilValue:Variant;
    PObjCell:PCellObj;
begin
 result:=nil;
 for Row:=0 to self.FView.DataController.RecordCount-1 do
 begin
    for Col:=0 to self.FView.ColumnCount-1 do
    begin
      CeilValue:=self.FView.DataController.Values[Row,Col];

      if (CeilValue<>Null)and(CeilValue<>'') then
      begin
         PObjCell:= PCellObj( Integer( CeilValue ) );
         //PObjCell^.TextList
         for i:=0 to PObjCell^.TextList.Count - 1 do
         begin
            if (PFieldText(PObjCell^.TextList[i]).FieldName = FieldName) and
               (PFieldText(PObjCell^.TextList[i]).Text = Value ) then
            begin
             PObjCell^.RowIndex :=Row;
             result:=PObjCell;
             exit;
            end;
         end;
      end;
   end;
 end;

end;
//******************************************************************************
procedure TTimeLinerView.FUpdateCellByFieldName(CellObj:PCellObj; FieldName:string;Value:Variant );
var i:integer;
begin
  for i:=0 to CellObj^.TextList.Count - 1 do
     begin
       if (PFieldText(CellObj^.TextList[i]).FieldName = FieldName) then
       begin
         PFieldText(CellObj^.TextList[i]).Text:=Value;
         break;
       end;
     end;
end;
//******************************************************************************
procedure TTimeLinerView.FUpdateFocusedCellsByFieldName(PObjCell:PCellObj; FieldName:string; Value:Variant );
var i:integer;
    CellObj:PCellObj;
    CeilValue:Variant;
begin
  for i:= PObjCell^.StartColIndex to PObjCell^.FinishColIndex do
  begin
    CeilValue := self.FView.DataController.Values[ self.FView.Controller.FocusedRowIndex , i ];
    if ( CeilValue <> null ) and ( CeilValue<>'' ) then
    begin
      CellObj := PCellObj( Integer( CeilValue ) );
      self.FUpdateCellByFieldName( CellObj, FieldName, Value );
    end;
  end;
end;
//******************************************************************************
function TTimeLinerView.GetFocuseValueByFieldName(FieldName:String):Variant;
var CeilValue:Variant;
    CellObj:PCellObj;
    i:Integer;
begin
 CeilValue := self.FView.DataController.Values[ self.FView.Controller.FocusedRowIndex , self.FView.Controller.FocusedColumn.Index ];
 if ( CeilValue <> null ) and ( CeilValue<>'' ) then
    begin
      CellObj := PCellObj( Integer( CeilValue ) );
      for i:=0 to CellObj^.TextList.Count - 1 do
        if ( PFieldText(CellObj^.TextList[i]).FieldName = FieldName ) then
        begin
          result:=PFieldText(CellObj^.TextList[i]).Text;
          Break;
        end;
    end;
end;
//******************************************************************************
procedure TTimeLinerView.FDeleteCell( Row:integer;  CellObj : PCellObj );
var i:Integer;
begin
 FDisposeRowCellMem( Row, CellObj^.StartColIndex , CellObj^.FinishColIndex , false);
end;
//******************************************************************************
function TTimeLinerView.MoveToDate( Date:TDateTime ):Boolean;
var currBandColumn:TcxGridBandedColumn;
    CeilValue:Variant;
    CellObj : PCellObj;
    CountCol:Integer;
    SaveShowSplit:Boolean;
    //SavePosRow:Integer;
    i:Integer;
    SaveId:Variant;
    SaveList:TList;
    SaveCountDay:Integer;
    SaveHint:Widestring;
    SaveBGColor:TColor;
begin
 result := false;
 self.FView.BeginUpdate;
 try
   CeilValue := self.FView.DataController.Values[ self.FView.Controller.FocusedRowIndex , self.FView.Controller.FocusedColumn.Index ];
   if ( CeilValue <> null ) and ( CeilValue<>'' ) then
   begin
     CellObj := PCellObj( Integer( CeilValue ) );
     currBandColumn :=self.FindColumn(MonthOf(Date) ,DayOf(Date), self.FView.Controller.FocusedColumn.Tag );

     if currBandColumn<>nil then
     begin
      try

       SaveShowSplit:=self.FShowSplitLine;
       FDeleteEmptyRows;

       SaveId := CellObj^.id;
       SaveList := CellObj^.TextList;
       SaveCountDay := CellObj^.CountDay;
       SaveHint := CellObj^.Hint;
       SaveBGColor:=CellObj^.BGColor;

       FDeleteCell( self.FView.Controller.FocusedRowIndex,  CellObj );

       FAddTextToRow( SaveId , SaveList ,SaveBGColor , 0, currBandColumn.Index, SaveCountDay ,  SaveHint );
       result := True;
      finally

       self.FShowSplitLine:=SaveShowSplit;
       if self.FShowSplitLine then self.FInsertEmptyRows;
      end;
      FocusCellById( SaveId );
     end;
   end;
 finally
  self.FView.EndUpdate;
 end;
end;
//******************************************************************************
function  TTimeLinerView.FFindMonthDayBand(Month, Day:Integer):TcxGridBand;
var i:Integer;
begin
 result:=nil;
 
 for i:=0 to self.FView.Bands.Count-1 do
 begin
   if ( self.GetPoint( self.FView.Bands[i].Tag ).Month = Month ) and
      ( self.GetPoint( self.FView.Bands[i].Tag ).Day = Day ) then
   begin
     result:=self.FView.Bands[i];
     break;
   end;
 end;
end;
//******************************************************************************
function TTimeLinerView.FindTypeDayBand( DayBand:TcxGridBand; TypeDay:Integer ) :TcxGridBandedColumn;
var i:Integer;
begin
 DayBand := DayBand.ChildBands[0];
 for i:=0 to DayBand.ColumnCount-1 do
 begin
   if (DayBand.Columns[i].Tag = TypeDay ) then
   begin
     result:=DayBand.Columns[i];
     break;
   end;
 end;
end;
//******************************************************************************
function TTimeLinerView.FindColumn(Month, Day, TypeDay:Integer):TcxGridBandedColumn;
var MonthBand:TcxGridBand;
    DayBand:TcxGridBand;
begin
  result:=nil;
  DayBand := FFindMonthDayBand(Month , Day);
  if (DayBand<> nil) then
    Result:= FindTypeDayBand( DayBand, TypeDay );
end;
//******************************************************************************
Function TTimeLinerView.FcreateColumn(aDayBand:TcxGridBand):TcxGridBandedColumn;
begin
  result := Self.FView.CreateColumn();
  result.Position.BandIndex := aDayBand.Index;
  result.HeaderAlignmentHorz:= taCenter;
  result.Options.Filtering := False;
  result.Options.Sorting   := false;
  result.Options.Moving    := False;
  result.MinWidth:=Self.FColumnWidth;
  result.Width := Self.FColumnWidth;
  result.OnGetCellHint  := self.ViewNameGetCellHint;
end;
//******************************************************************************
procedure TTimeLinerView.FAutoBandWidth(aBand:TcxGridBand);
var i:Integer;
    aWidth:Integer;
begin
  aWidth:=0;
  for i:=0 to aBand.ColumnCount-1 do
    aWidth := aWidth + aBand.Columns[i].Width;

  aBand.Width := aWidth;
end;
//******************************************************************************
procedure TTimeLinerView.FBuildBundBeforeAfterDaysForDay(aDayBand:TcxGridBand);
var col:TcxGridBandedColumn;
begin
  col := FcreateColumn( aDayBand );
  col.Caption:= self.FColBeforeDay;
  col.Tag:=1;
  
  col := FcreateColumn( aDayBand );
  col.Caption:= self.FColAfterDay;
  col.Tag:=2;

  FAutoBandWidth(aDayBand);
end;
//******************************************************************************
function TTimeLinerView.SetPoint(month,day:Integer): Integer;
begin
 result:=month + (day shl 16);
end;
//******************************************************************************
function TTimeLinerView.GetPoint(value: Integer): TPointMonth;
begin
 result.month := value and $FFFF;
 result.day := (value shr 16) and $FFFF;
end;
//******************************************************************************
procedure TTimeLinerView.FBuildBundDaysForMonth( aMonthBand:TcxGridBand; Year, Month, DayStartForMonth, DayEndForMonth:Integer );
var i:Integer;
    DayBand:TcxGridBand;
    DayNameBand:TcxGridBand;
begin
   for i:=DayStartForMonth to DayEndForMonth do
   begin
     DayBand:= Self.FView.Bands.Add;
     DayBand.Caption := Copy( self.FMasMonth[Month],1,3 )+' '+IntToStr(i);

     if aMonthBand<> nil then
       DayBand.Position.BandIndex:=aMonthBand.Index ;

     DayNameBand := Self.FView.Bands.Add;
     DayNameBand.Position.BandIndex:=DayBand.Index ;
     DayNameBand.Caption:=AnsiLowerCase( self.FMasDayWeek[ DayOfTheWeek(EncodeDate(Year,Month,i))] );//Copy( self.FMasDayWeek[ DayOfWeek(EncodeDate(Year,Month,i)) ],1,3 ) );

     FBuildBundBeforeAfterDaysForDay( DayNameBand );

     DayBand.Tag := SetPoint( Month , i );
     DayNameBand.Tag := SetPoint( Month , i );
   end;
end;
//******************************************************************************
function ConvertSameTextToColor(aText:Widestring):TColor;
var i:integer;
begin
  result:=0;
  for i:=1 to Length(aText) do
    result:=result + Ord( aText[i]) + 1500;
end;
//******************************************************************************
procedure TTimeLinerView.FBuildBundMonth;
var i,CountMonth:Integer;
    MonthBand:TcxGridBand;
    MontStart:Integer;
    MonthEnd:Integer;
    DayStartForMonth:Integer;
    DayEndForMonth:Integer;
    CurrDate:TDate;
    currBandWidth:Integer;
begin
 try
   Self.FView.BeginUpdate;
   Self.FView.Bands.BeginUpdate;
   Self.FView.Bands.Clear;
   Self.FView.ClearItems;
   //****************************
   MontStart:= MonthOf( FStartDate );
   MonthEnd := MonthOf( FEndDate );
   CurrDate := FStartDate;
   MonthBand:=nil;

   CountMonth:=GetMonthsBetween(FStartDate,FEndDate) + 1;
   for i:=1 to CountMonth do 
   begin
     if MonthOf(CurrDate) = MontStart then
     begin
       DayStartForMonth:=DayOf(FStartDate);
       DayEndForMonth:=DaysInAMonth( YearOf(FStartDate), MonthOf(CurrDate) );
     end
      else
        if MonthOf(CurrDate) = MonthEnd then
        begin
          DayStartForMonth:=1;
          DayEndForMonth:=DayOf(FEndDate);
        end
         else
          begin
            DayStartForMonth:=1;
            DayEndForMonth:=DaysInAMonth( YearOf(FStartDate), MonthOf(CurrDate) );
          end;
     FBuildBundDaysForMonth( nil , YearOf(CurrDate), MonthOf(CurrDate) ,DayStartForMonth , DayEndForMonth );

     CurrDate:=IncMonth(CurrDate);
   end;
 finally
  Self.FView.Bands.EndUpdate;
  Self.FView.EndUpdate;
 end;
end;
//******************************************************************************
function TTimeLinerView.GetTypeDay(aTime:TTime):integer;
begin
 if HourOf( aTime ) < 12 then result := 1
 else result:=2;
end;
//******************************************************************************
function TTimeLinerView.FCalculateWithAreaColumn(StartCol,EndCol:Integer):Integer;
var i:integer;
begin
 result:=0;
 
 for i:=StartCol to EndCol do
  if Self.FView.ColumnCount > i  then
    result := result + Self.FView.Columns[i].Width;
end;
//******************************************************************************
procedure TTimeLinerView.RefreshById( id:Variant );
var PDBData:PDataDB;
begin
 try
  self.FDB.DisableControls;
  if self.FDB.Locate(Self.FFieldNameID, id ,[] ) then
  begin
   PDBData := FGetDataCurrFromDB;
   FUpdateTextRow( PDBData^.id, PDBData^.Text, PDBData^.BgroundColor,  PDBData^.Hint );
  end; 
 finally
  self.FDB.EnableControls;
  self.Repaint;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.FUpdateTextRow( id:Variant; aText:TList; BgroundColor:TColor; aHint:Widestring );
var PObjCell:PCellObj;
begin
  PObjCell := self.FFindCellById( id );
  if PObjCell <> nil then
  begin
     PObjCell^.id := id;

     if PObjCell^.TextList<>nil then
       PObjCell^.TextList.Free;

     PObjCell^.TextList := aText;
     PObjCell^.BGColor := BgroundColor;
     PObjCell^.Hint := aHint;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.FAddTextToRow( id:Variant; aText:TList; BgroundColor:TColor; StartRow, Col, CountColCell: Integer; aHint:Widestring; AddNewRowNotSearchEmptySpace:Boolean );
var i:Integer;
    k:Integer;
    CellObj:PCellObj;
begin
 if (not AddNewRowNotSearchEmptySpace)and(not self.FFindDataForCell( StartRow, Col, CountColCell )) then
 begin
    k:=0;

    CellObj :=FCreateObjCell(id, aText, BgroundColor,  CountColCell,  Col,  Col + CountColCell -1, aHint );
    for i := Col to Col+CountColCell-1 do
    begin

    if Self.FView.ColumnCount > i  then
    begin
      Self.FView.DataController.Values[ StartRow , i ]:= Integer( PCellObj( CellObj ) );
      inc(k);
    end;
    end;

    self.FSetFocuceCell( Col , StartRow );
 end
  else
   begin
    if StartRow+1 > Self.FView.DataController.RecordCount-1 then
      AddRow;

    FAddTextToRow( id, aText, BgroundColor,  StartRow+1, Col, CountColCell ,aHint  );
   end;
end;
//******************************************************************************
function  TTimeLinerView.FCalculateColumnCellCountDay( CountDay , TypeDayStart , TypeDayArriv:Integer ):Integer;
begin
 result := CountDay * 2;
 
 if TypeDayStart=2 then result := result - 1;
 if TypeDayArriv=1 then result := result - 1;
end;
//******************************************************************************
function TTimeLinerView.FgetShowText:TList;
var i:Integer;
    ObjText:PFieldText;
begin
  Result:=TList.Create;

  for i:=0 to self.FListShowFields.Count-1 do
    begin
      New(ObjText);
      ObjText.FieldName:= PFieldText(self.FListShowFields[i])^.FieldName;
      ObjText.Text:= Trim( self.FDB.FieldByName( ObjText.FieldName).AsString );

      if PFieldText(self.FListShowFields[i])^.ColorFiledName <> '' then
      ObjText.Color := self.FDB.FieldByName( PFieldText(self.FListShowFields[i])^.ColorFiledName).AsVariant
      else ObjText.Color:=FDefColorText;

      ObjText.FontStyles :=PFieldText(self.FListShowFields[i]).FontStyles;
      Result.Add( ObjText );
    end;
end;
//******************************************************************************
procedure TTimeLinerView.ClearAllRows;
begin
  self.FDisposeCellMem;
  while Self.FView.DataController.RecordCount<>0 do
   Self.FView.DataController.DeleteRecord(0);
end;
//******************************************************************************
Function TTimeLinerView.AddRow:Integer;
begin
 Self.FView.DataController.AppendRecord;
 Self.FView.DataController.Post;
 
 result:=Self.FView.DataController.RecordCount-1;
end;
//******************************************************************************
function TTimeLinerView.FGetDataCurrFromDB:PDataDB;
var currDate:TDateTime;
    currMonth:Integer;
    currDay:Integer;
    CurrTypeDay:Integer;
    currBandColumn:TcxGridBandedColumn;
    currHint:Widestring;
    currBgroundColor:TColor;
    countDay:Integer;
    ariveTime:TTime;
    currStyle:TFontStyles;
begin
  //FStartDate := aStartDate ;
  //FEndDate := aEndDate;
  currDate := self.FDB.fieldByName(self.FFieldNameDate).AsDateTime;
  currMonth:= MonthOf( self.FDB.fieldByName(self.FFieldNameDate).AsDateTime );
  currDay  := DayOf( self.FDB.fieldByName(self.FFieldNameDate).AsDateTime);
  //************************************
  if Self.FFieldBgroundColor<>'' then
  begin
    if self.FDB.fieldByName( Self.FFieldBgroundColor ).AsVariant <>null then
      currBgroundColor := self.FDB.fieldByName( Self.FFieldBgroundColor ).AsVariant
    else
      currBgroundColor := -1;
  end
   else currBgroundColor := -1;
 //************************************
  if self.FFieldNameHint <> '' then
     currHint := self.FDB.fieldByName( self.FFieldNameHint ).AsString
      else currHint:='';

  CurrTypeDay:= GetTypeDay( TimeOf( self.FDB.fieldByName(self.FFieldNameDate).AsDateTime) );
  countDay   := self.FDB.fieldByName( self.FFieldNameCountDay ).AsInteger;
  ariveTime  := TimeOf(self.FDB.fieldByName( self.FFieldNameArriveTime ).AsDateTime);

  if ((not FShowDataOutRangeDate)and(currDate >= FStartDate)and(currDate <= FEndDate))or( FShowDataOutRangeDate ) then
  begin
    New(result);
    result.id   := self.FDB.fieldByName( Self.FFieldNameID ).AsVariant;
    result.Text := self.FgetShowText;
    //******************************
    if currDate < FStartDate then
    begin
      currMonth:= MonthOf(FStartDate);
      currDay  := DayOf(FStartDate);
      CountDay := countDay - DaysBetween(  DateOf(FStartDate) , DateOf(currDate) );
      CurrTypeDay :=1;
    end;
    //******************************
    currBandColumn :=self.FindColumn(currMonth ,currDay, CurrTypeDay );

    if currBandColumn <> nil then
       begin
        result.CountCol := FCalculateColumnCellCountDay( CountDay , CurrTypeDay , GetTypeDay(ariveTime));
        result.BgroundColor := currBgroundColor;
        result.Hint :=currHint;
        Result.ColumnIndex := currBandColumn.Index;
       end
     else
      begin
        if result<>nil then Dispose(result);
        result:=nil;
      end;
  end
   else result:=nil; 

end;
//******************************************************************************
procedure TTimeLinerView.FBuildData(Add:Boolean);
var currText:TList;
    CountCol:Integer;
    currId:Integer;
    PDBData : PDataDB;
    StartRow:Integer;
    isFirst:Boolean;
begin
try
 self.FDB.DisableControls;
 if not Add then
 begin
  ClearAllRows;
  StartRow:=0;
 end
  else StartRow:=Self.FView.DataController.RecordCount;

 isFirst:=true;
 self.FDB.First;
 
 while not self.FDB.Eof do
 begin
   try
     PDBData := FGetDataCurrFromDB;
     if PDBData <> nil then
     begin
       if isFirst then  AddRow;

       FAddTextToRow( PDBData^.id, PDBData^.Text, PDBData^.BgroundColor, StartRow, PDBData^.ColumnIndex, PDBData^.CountCol, PDBData^.Hint );
       isFirst:=false;
     end;
   finally
    if PDBData <> nil then Dispose(PDBData);
   end;

  self.FDB.Next;
 end;

finally
 self.FDB.EnableControls;
end;
end;
//******************************************************************************
procedure TTimeLinerView.UpdateData(FieldName:string; Value:Variant);
var CellObj:PCellObj;
    PObjCell:PCellObj;
    UpdateCountColumn:Integer;
    CeilValue:Variant;
    i:integer;
begin
 CeilValue:=self.FView.DataController.Values[ self.FView.Controller.FocusedRowIndex , self.FView.Controller.FocusedColumn.Index ];

 if (CeilValue<>Null)and(CeilValue<>'') then
 begin
   PObjCell := PCellObj( Integer( CeilValue ) );
   FUpdateFocusedCellsByFieldName(PObjCell,  FieldName,  Value );

   if @FEvaentUpdateValue <> nil then
     FEvaentUpdateValue(PObjCell^.id , FieldName , Value);

   self.Repaint;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.ShowFocusHeader;
var i:Integer;
    CellValue:Variant;
    PObjCell: PCellObj;
begin
 try
   self.FView.BeginUpdate ;
   for i:=0 to self.FView.ColumnCount -1 do self.FView.Columns[i].Styles.Header:=nil;

   CellValue := FGetFocusedValueCell;
   if ( CellValue <> null ) and ( CellValue <>'' ) then
    begin
     PObjCell:= PCellObj( Integer( CellValue ) );
     for i:=PObjCell^.StartColIndex to PObjCell^.FinishColIndex do self.FView.Columns[i].Styles.Header := FStyleHeaderSelection;
    end;
 finally
  self.FView.EndUpdate ;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.Repaint;
begin
  self.FView.Preview.GridView.LayoutChanged(true);
  self.FHint.Hide;
end;
//******************************************************************************
procedure TTimeLinerView.View(aStartDate,aEndDate:TDateTime;ShowSplitLine:boolean=false;ColorSplitLine:TColor=clSilver;HeightSplitLine:Integer=8;ShowColor:Boolean=false; Add:Boolean =false);
begin
 try
  if self.FView.DataController.RowCount <> 0 then
  begin
    self.SaveFocuseCell;
    if not Add then FDisposeCellMem;
  end
  else
    self.SaveFocuseCell(0,0);

  FStartDate := aStartDate ;
  FEndDate := aEndDate;

  if not Add then FBuildBundMonth;

  Self.FView.BeginUpdate;
  Self.FView.OptionsView.DataRowHeight := Self.FHeightRow;
  
  FBuildData( Add );

  self.FShowSplitLine := ShowSplitLine;
  self.FColorSplitLIne:= ColorSplitLine;
  self.FHeightSplitLine := HeightSplitLine;
  self.FShowColor := ShowColor;
   
  if FShowSplitLine then
    FInsertEmptyRows;

  Self.Repaint;
 finally
  Self.FView.EndUpdate;
  RestoreFocuseCell;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.ShowEmptyRows(ShowSplitLine:boolean=false;ColorSplitLine:TColor=clSilver;HeightSplitLine:Integer=8);
begin
  self.FShowSplitLine := ShowSplitLine;
  self.FColorSplitLIne:= ColorSplitLine;
  self.FHeightSplitLine := HeightSplitLine;
  FInsertEmptyRows;
end;
//******************************************************************************
procedure TTimeLinerView.View1LeftPosChanged(Sender: TObject);
begin
  self.Repaint;
end;
//******************************************************************************
procedure TTimeLinerView.SaveFocuseCell(SaveRow:Integer=-1; SaveCol:Integer=-1);
begin
  if SaveRow = -1 then
    FSaveFocusedRow := self.FView.Controller.FocusedRowIndex
  else FSaveFocusedRow := SaveRow;

  FTopRowIndex:= self.FView.Controller.TopRowIndex;
  
  if (SaveCol = -1)and(self.FView.Controller.FocusedColumn<>nil) then
    FSaveFocusedCol := self.FView.Controller.FocusedColumn.Index
  else FSaveFocusedCol := SaveCol;
end;
//******************************************************************************
procedure TTimeLinerView.RestoreFocuseCell;
begin
  if ( FSaveFocusedRow <> -1 )and( FSaveFocusedCol <> -1 ) then
  begin
   self.FSetFocuceCell(FSaveFocusedCol , FSaveFocusedRow , FTopRowIndex );
   FSaveFocusedCol:=-1;
   FSaveFocusedRow:=-1;
   FTopRowIndex:=-1;
  end;
end;
//******************************************************************************
function TTimeLinerView.FindFistColumnOnDisplay(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer;var cellOnDisplay:TcxGridTableDataCellViewInfo):Integer;
var aView:TcxGridBandedTableView;
    i:integer;
begin
  aView:= TcxGridBandedTableView (Sender);
  cellOnDisplay:=nil;

  for i:=FromCol to ToCol do
  begin
     cellOnDisplay:= AViewInfo.RecordViewInfo.GetCellViewInfoByItem( aView.Columns[i] );
     if  cellOnDisplay <> nil then
     begin
      result:=i;
      Break;
     end;
  end;
end;
//******************************************************************************
function TTimeLinerView.FindLastColumnOnDisplay(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol , ToCol:Integer; var cellOnDisplay:TcxGridTableDataCellViewInfo):Integer;
var aView:TcxGridBandedTableView;
    i:integer;
begin
  aView:= TcxGridBandedTableView (Sender);
  cellOnDisplay:=nil;

  for i:=ToCol downto FromCol do
  begin
     cellOnDisplay:= AViewInfo.RecordViewInfo.GetCellViewInfoByItem( aView.Columns[i] );
     if  cellOnDisplay <> nil then
     begin
      result:=i;
      Break;
     end;
  end;
end;
//******************************************************************************
function TTimeLinerView.FGetWidthAreaBetweenColumns(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer):Integer;
var i:Integer;
    aView:TcxGridBandedTableView;
    cellOnDisplay:TcxGridTableDataCellViewInfo;
begin
  result:=0;

  aView:= TcxGridBandedTableView (Sender);
  for i:=FromCol to ToCol do
  begin
    cellOnDisplay:= AViewInfo.RecordViewInfo.GetCellViewInfoByItem( aView.Columns[i] );
    if (cellOnDisplay<>nil) then
    result:= result + (cellOnDisplay.Bounds.Right - cellOnDisplay.Bounds.Left);
  end;
end;
//******************************************************************************
function TTimeLinerView.FindFistColumnOnDisplayRect(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo; FromCol, ToCol:Integer ):TRect;
var aView:TcxGridBandedTableView;
    i:integer;
    cellOnDisplay:TcxGridTableDataCellViewInfo;
begin
  FindFistColumnOnDisplay(Sender, AViewInfo,  FromCol,ToCol, cellOnDisplay);
  if cellOnDisplay<>nil then
     result:=cellOnDisplay.EditBounds;
end;
//******************************************************************************
function TTimeLinerView.FPrepareTextToView(aText:WideString;Acanvas:TcxCanvas;WidthArea:Integer):WideString;
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
function TTimeLinerView.FPrepareListTextToView(aList:TStringLIst;Acanvas:TcxCanvas;WidthArea:Integer):Widestring;
var i:integer;
begin
 result:='';
 for i:=0 to aList.Count - 1 do
 result:= result+FPrepareTextToView( aList[i] , ACanvas , WidthArea ) + #13;
end;
//******************************************************************************
function TTimeLinerView.FCheckCorrectVisibleTextOnRect( ACanvas :TcxCanvas; AreaDrawText :TRect; TextList :TList ):Boolean;
var VisibleWidth:Integer;
    i:Integer;
    CellText:WideString;
begin
 VisibleWidth := AreaDrawText.Right - AreaDrawText.Left;

 result:=True;
 for i:=0 to TextList.Count-1 do
 begin
   CellText := FPrepareTextToView( PFieldText(TextList[i])^.Text , ACanvas, VisibleWidth );
   if CellText <> PFieldText(TextList[i])^.Text then
   begin
     result:=False;
     break;
   end;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.FDrawListTexT(ACanvas: TcxCanvas; AreaDrawText:TRect; VisibleWidth:Integer; TextList:TList);
var i:Integer;
    StepTopShowText:Integer;
    CellText:Widestring;
    saVeFontColor:TColor;
begin
  StepTopShowText:= Ceil( (AreaDrawText.Bottom - AreaDrawText.Top) / TextList.Count );
  AreaDrawText.Bottom := AreaDrawText.Top + StepTopShowText;
  SaveFontColor:= ACanvas.Font.Color;

  for i:=0 to TextList.Count-1 do
  begin
    CellText := FPrepareTextToView( PFieldText(TextList[i])^.Text , ACanvas, VisibleWidth );

    if ( SaveFontColor <> clWhite ) then
    ACanvas.Font.Color := PFieldText(TextList[i])^.Color
    else
     if (PFieldText(TextList[i])^.Color<>self.FDefColorText ) then
       ACanvas.Font.Color := PFieldText(TextList[i])^.Color
     else
       ACanvas.Font.Color := SaveFontColor;

    //if PFieldText(TextList[i])^.FontStyles<>null then
    ACanvas.Font.Style:=PFieldText(TextList[i])^.FontStyles;

    ACanvas.DrawTexT( CellText , AreaDrawText, taLeftJustify, vaTop, false, false );
    AreaDrawText.Top    := AreaDrawText.Top + StepTopShowText;
    AreaDrawText.Bottom := AreaDrawText.Bottom + StepTopShowText ;
  end;

  ACanvas.Font.Color:= SaveFontColor;
end;
//******************************************************************************
function TTimeLinerView.FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
begin
 if TcxGRidBandedTableView(Sender).Styles.Selection<>nil then
   result:=TcxGRidBandedTableView(Sender).Styles.Selection
 else
   result:=nil;
end;
//******************************************************************************
function TTimeLinerView.FGetColorSelection(Sender: TcxCustomGridTableView):TColor;
var Style:TcxStyle;
begin
 Style:=FGetSelectionColor(Sender);
 if Style<> nil then
   result := Style.Color
    else result := FDefColorSelection;
end;
//******************************************************************************
function TTimeLinerView.FGetColorFontSelection(Sender: TcxCustomGridTableView):TColor;
var Style:TcxStyle;
begin
 Style:=FGetSelectionColor(Sender);
 if Style<> nil then
   result:=Style.TextColor
    else result := FDefColorFontSelection;
end;
//******************************************************************************
procedure TTimeLinerView.FShowCellFocus(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;FocusRect:TRect );
var ColorSelection:TColor;
    ColorFontSelection:TColor;
    OldColorBrash:TColor;
    OldColorFont:TColor;
    StyleSelect:TcxStyle;
begin
  OldColorBrash:= ACanvas.Brush.Color;
  OldColorFont := ACanvas.Font.Color;

  if (AViewInfo<>nil) then
    if (AViewInfo.GridRecord.Focused) and (AViewInfo.Item.Focused)  then
    begin

      ColorSelection:=FGetColorSelection( Sender );
      ColorFontSelection :=FGetColorFontSelection( Sender );
      
      if (OldColorBrash = ACanvas.Brush.Color) then ACanvas.Brush.Color := ColorSelection;
      if (OldColorFont = ACanvas.Font.Color)   then ACanvas.Font.Color  := clWhite;

      ACanvas.FillRect( FocusRect );
    end;
end;
//******************************************************************************
function TTimeLinerView.ColIsFocused(Sender: TcxCustomGridTableView; StartColIndex , FinishColIndex:Integer):Boolean;
var i:Integer;
    aView: TcxGridBandedTableView;
begin
  aView:= TcxGridBandedTableView (Sender);
  result:=False;

  for i:=StartColIndex to FinishColIndex do
  if aView.Columns[i].Focused then
  begin
    result:=true;
    Break;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.ShowBorder(ACanvas: TcxCanvas; aRect: Trect;CurrColumnIndex,StartColIndex , FinishColIndex:Integer; ColorBorder:TColor );
begin
 ACanvas.Pen.Color:=ColorBorder;
  //Top Lile
 ACanvas.MoveTo(aRect.TopLeft.X  ,aRect.TopLeft.Y );
 ACanvas.LineTo( aRect.TopLeft.X + aRect.Right - aRect.Left -  Ceil( (FBorderWidth-1) / 2) , aRect.TopLeft.Y);
  //Left Lile
 ACanvas.MoveTo( aRect.TopLeft.X + (aRect.Right - aRect.Left)-2  , aRect.TopLeft.Y );
 ACanvas.LineTo( aRect.TopLeft.X + (aRect.Right - aRect.Left)-2  , aRect.TopLeft.Y + (aRect.Bottom - aRect.Top) );
 //Bottom Lile
 ACanvas.MoveTo( aRect.TopLeft.X  ,aRect.TopLeft.Y+ aRect.Bottom - aRect.Top -2);
 ACanvas.LineTo( aRect.TopLeft.X + aRect.Right - aRect.Left - Ceil( (FBorderWidth-1) / 2)   , aRect.TopLeft.Y + aRect.Bottom - aRect.Top -2);
 //Right Lile
 ACanvas.MoveTo( aRect.TopLeft.X  ,aRect.TopLeft.Y );
 ACanvas.LineTo( aRect.TopLeft.X  , aRect.TopLeft.Y + aRect.Bottom - aRect.Top );
end;
//******************************************************************************
function TTimeLinerView.FGetStyleFont:TFont;
begin
  if self.FView.Styles.Content <>nil then
     result:=self.FView.Styles.Content.Font
     else
     result:= TcxGrid(self.FView.Site.Parent).Font;
end;
//******************************************************************************
procedure TTimeLinerView.ViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var ARectOnDisplay: TRect;
    ASelectRect:TRect;
    ADrawTextRect:TRect;
    TextList:TList;
    StartDisplayColIndex:Integer;
    LastDisplayColumn:Integer;
    StartColIndex:Integer;
    FinishColIndex:Integer;
    PObjCell:PCellObj;
    ObjCell:TCellObj;
    cellOnDisplay:TcxGridTableDataCellViewInfo;
    cellOnDisplayLast:TcxGridTableDataCellViewInfo;
    OldColorBrash:TColor;
    i:Integer;
    StepTopShowText:Integer;
    currBGColor:TColor;
//************************************
function CheckColumn(colFrom , colEnd:Integer):boolean;
begin
 if (AViewInfo.Item.Index >= colFrom ) and (AViewInfo.Item.Index <= colEnd ) then result:=true
 else result:=false;
end;
//************************************
begin
  OldColorBrash := ACanvas.Brush.Color;

  if (FShowSplitLine) and (AViewInfo.GridRecord.Index mod 2 <>0 ) then
      begin
       ACanvas.FillRect( AViewInfo.Bounds , self.FColorSplitLIne );
       AViewInfo.Borders :=[bTop, bBottom];
      end
       else ACanvas.FillRect( ASelectRect , OldColorBrash );

  if (FColorSunday<>-1) and(TcxGridBandedColumn(AViewInfo.Item).Position.Band.Caption = AnsiLowerCase(FMasDayWeek[7])) then
    ACanvas.FillRect( ASelectRect, FColorSunday);

  if (AViewInfo.GridRecord.Values[AViewInfo.item.index]<>null) and (AViewInfo.GridRecord.Values[AViewInfo.item.index]<>'') then
    begin
      PObjCell:= PCellObj( Integer(AViewInfo.GridRecord.Values[AViewInfo.item.index]) );
      ObjCell  := PObjCell^;
      TextList := ObjCell.TextList;
      currBGColor:=ObjCell.BGColor;

      StartColIndex  := ObjCell.StartColIndex;
      FinishColIndex := ObjCell.FinishColIndex;

      if CheckColumn(StartColIndex , FinishColIndex )  then
      begin
       StartDisplayColIndex:=self.FindFistColumnOnDisplay( Sender, AViewInfo, StartColIndex, FinishColIndex, cellOnDisplay );
       LastDisplayColumn:=self.FindLastColumnOnDisplay( Sender, AViewInfo, ObjCell.StartColIndex, ObjCell.FinishColIndex, cellOnDisplayLast );

       if AViewInfo.item.index = StartDisplayColIndex then
         AViewInfo.Borders :=  [bLeft, bTop, bBottom]
       else
       if AViewInfo.item.index = LastDisplayColumn then
         AViewInfo.Borders :=  [ bTop, bBottom, bRight]
       else
         AViewInfo.Borders :=  [ bTop, bBottom];

       ASelectRect.Left:= cellOnDisplay.Bounds.Left;
       ASelectRect.Top := cellOnDisplay.Bounds.Top;
       ASelectRect.Bottom := cellOnDisplay.Bounds.Bottom;
       ASelectRect.Right  := cellOnDisplayLast.Bounds.Right;

       if ( ColIsFocused(Sender,  StartColIndex, FinishColIndex) ) and (AViewInfo.GridRecord.Focused ) then     //StartDisplayColIndex , LastDisplayColumn
       begin
         ACanvas.Font.Color:= self.FGetColorFontSelection( Sender );
         ACanvas.FillRect( ASelectRect , Self.FGetColorSelection( Sender ) );
       end
       else
       begin
         if FShowColor then
         begin
           if currBGColor = -1 then
             currBGColor := FDefBgroundColorCell;

           ACanvas.FillRect( ASelectRect , currBGColor )
         end
         else ACanvas.FillRect( ASelectRect );

         ACanvas.Font := FGetStyleFont;
       end;
       //********************************
       ADrawTextRect := ASelectRect;
       if ADrawTextRect.Left < 0 then ADrawTextRect.Left := MergeTopLeft
       else ADrawTextRect.Left := ADrawTextRect.Left + MergeTopLeft;

       FDrawListTexT( ACanvas, ADrawTextRect, cellOnDisplayLast.Bounds.Right - ADrawTextRect.Left ,  TextList );   //cellOnDisplayLast.Bounds.Right

       ACanvas.Pen.Width:=FBorderWidth;
       if self.FBorderColor <> -1 then
         ShowBorder( ACanvas, ASelectRect , AViewInfo.item.index, StartColIndex , FinishColIndex , Self.FBorderColor );
      end;
      ADone:= true;
   end;
   
   if (@PersonalDrawCell<>nil) then
   PersonalDrawCell(Sender, ACanvas, AViewInfo, ADone);
end;
//******************************************************************************
procedure TTimeLinerView.ViewGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
 AHeight:=self.FHeightRow;
 if not FShowSplitLine then Exit;

 if ARecord.Index mod 2 <> 0 then
   AHeight:=self.FHeightSplitLine;
end;
//******************************************************************************
procedure TTimeLinerView.SetBorder( BorderColor:Integer );
begin
  self.FBorderColor := BorderColor;
end;
//******************************************************************************
procedure TTimeLinerView.SetDefBgroundColorCell( aColor:TColor );
begin
  self.FDefBgroundColorCell := aColor;
end;
//******************************************************************************
procedure TTimeLinerView.SetColorSunday ( aColor:TColor );
begin
 self.FColorSunday := aColor;
end;
//******************************************************************************
procedure TTimeLinerView.SetStyleHeaderSelection ( aStyle:TcxStyle );
begin
 self.FStyleHeaderSelection := aStyle;
end;
//******************************************************************************
procedure TTimeLinerView.SetHintParam( HintFieldName:string; Color:TColor=clYellow; BorderColor:TColor=-1 );
begin
  FFieldNameHint := HintFieldName;
  FHintColor := Color;
  FHintBorder := BorderColor;
end;
//******************************************************************************
procedure TTimeLinerView.SetShowFields(idFieldName , FieldBgroundColor:string; masFields:array of string; masColorFields:array of String;masFontStyle:array of TFontStyles; HeightRow:Integer=21 );
var i:integer;
    FieldObj:TFieldText;
    PFieldObj:PFieldText;
//**************************************
function getColorFieldName(index:Integer):String;
begin
 if Length(masColorFields) > index then
   result := masColorFields[index]
   else
   result:='';
end;
//**************************************
function getFontStyleFieldName(index:Integer):TFontStyles;
begin
 if Length(masFontStyle) > index then
   result := masFontStyle[index]
   else
   result:=[];
end;
//**************************************
begin
  self.FHeightRow:=HeightRow;
  self.FListShowFields.Clear;
  self.FFieldNameID := idFieldName;
  self.FFieldBgroundColor := FieldBgroundColor;

  for i:=0 to Length(masFields)-1 do
  begin
   New(PFieldObj);

   PFieldObj.FieldName := masFields[i];
   PFieldObj.ColorFiledName := getColorFieldName( i );
   PFieldObj.FontStyles :=getFontStyleFieldName(i) ;
   self.FListShowFields.Add( PFieldObj );
  end;
end;
//******************************************************************************
procedure TTimeLinerView.SetCaptionColumn( ColBeforeDay, ColAfterDay: Widestring );
begin
  FColBeforeDay:= ColBeforeDay;
  FColAfterDay := ColAfterDay;
end;
//******************************************************************************
procedure TTimeLinerView.FInsertEmptyRows;
var i:Integer;
    CountRec:Integer;
begin
  i:=0;
  CountRec:=self.FView.DataController.RecordCount;
  try
    while i<=CountRec do
    begin
      if i mod 2 <> 0  then
      begin
        self.FView.DataController.FocusedRowIndex:=i;
        self.FView.DataController.InsertRecord(i);
        self.FView.DataController.Post;
        Inc(CountRec);
      end;
      inc(i);
    end;
  finally
  end;  
end;
//******************************************************************************
procedure TTimeLinerView.FDeleteEmptyRows;
var i:Integer;
begin
 try
  Self.FView.BeginUpdate;
  Self.FView.OptionsSelection.MultiSelect:=True;
  i:=self.FView.DataController.RowCount-1;
  Self.FView.Controller.ClearSelection;
  while i >=0 do
  begin
    if i mod 2 <> 0  then
       Self.FView.DataController.SelectRows(i,i);
    dec(i);
  end;

  self.FView.DataController.DeleteSelection;
  self.FShowSplitLine:=false;
  self.Repaint;
 finally
  Self.FView.OptionsSelection.MultiSelect:=false;
  Self.FView.EndUpdate;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.FActionChangeCell( vlaue:Variant );
var PObjCell:PCellObj;
begin
 if (vlaue<>null)and(vlaue<>'') then
 begin
   PObjCell:= PCellObj( Integer(vlaue ) );
   if @FEventSelectCell<>nil then
     FEventSelectCell( PObjCell^.id );
 end;
end;
//******************************************************************************
function TTimeLinerView.FFindCellById( id: Variant ):PCellObj;
var Row:Integer;
    Col:Integer;
    CeilValue:Variant;
begin
 result:=nil;
 for Row:=0 to self.FView.DataController.RecordCount-1 do
 begin
    for Col:=0 to self.FView.ColumnCount-1 do
    begin
      CeilValue:=self.FView.DataController.Values[Row,Col];
      if (CeilValue <> null)and(CeilValue<>'') then
      begin
        if PCellObj( Integer( CeilValue ) )^.id = id then
        begin
          result:= PCellObj( Integer( CeilValue ) );
          result^.RowIndex := Row;
          exit;
        end;
      end;
    end;
 end;
end;
//******************************************************************************
procedure TTimeLinerView.FSetFocuceCell( Col, Row:Integer; TopRowIndex:Integer=-1);
begin
  self.FView.Columns[Col].Selected:=True;
  if not self.FView.IsUpdateLocked then
    self.FView.Columns[Col].Focused:=True;
  self.FView.DataController.FocusedRowIndex:= Row ;

  if TopRowIndex <> -1 then
    self.FView.Controller.TopRowIndex:= TopRowIndex;
end;
//******************************************************************************
function TTimeLinerView.FSetFocuceCell(CellObj: PCellObj): boolean;
begin
  if CellObj<>nil then
  begin
    FSetFocuceCell( CellObj^.StartColIndex , CellObj^.RowIndex );
    result := true;
  end
   else
   begin
    self.FView.DataController.FocusedRecordIndex:=-1;
    result:=false;
   end;
end;
//******************************************************************************
function TTimeLinerView.FocusCellById(id: Variant): boolean;
begin
  result:=FSetFocuceCell( FFindCellById( id ) );
end;
//******************************************************************************
procedure TTimeLinerView.ViewFocusedItemChanged(
  Sender: TcxCustomGridTableView; APrevFocusedItem,
  AFocusedItem: TcxCustomGridTableItem);
begin
 ShowFocusHeader;

 self.Repaint;
 if AFocusedItem <> nil then
   FActionChangeCell( FGetFocusedValueCell );
end;
//******************************************************************************
procedure TTimeLinerView.ViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  ShowFocusHeader;
  self.Repaint;
end;
//******************************************************************************
procedure TTimeLinerView.SetEventSelectCell(Event: TEventSelectCell);
begin
 self.FEventSelectCell := Event;
end;
//******************************************************************************
procedure TTimeLinerView.SetEventUpdateValue(Event: TEventUpdateValue);
begin
 self.FEvaentUpdateValue := Event;
end;
//******************************************************************************
function TTimeLinerView.GetFocusedValueByMouseCoordinate(X,Y:Integer):Variant;
var HitTest: TcxCustomGridHitTest;
    itemCol:TcxCustomGridTableItem;
    itemRow:TcxCustomGridRecord;
begin
  Result:=null; 
  HitTest := FView.ViewData.GridView.ViewInfo.GetHitTest(X, Y);
  if HitTest is TcxGridRecordCellHitTest then
    begin
      itemCol := TcxGridRecordCellHitTest(HitTest).Item;
      itemRow := TcxGridRecordCellHitTest(HitTest).GridRecord;
      Result := FView.DataController.Values[ itemRow.Index , itemCol.Index ];
    end;
end;
//******************************************************************************
procedure TTimeLinerView.ViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var aRecCellArea:TRect;
    ObjCell:TCellObj;
    HitTest: TcxCustomGridHitTest;
    itemCol:TcxCustomGridTableItem;
    itemRow:TcxCustomGridRecord;
    StartDisplayColIndex:integer;
    LastDisplayColumn:Integer;
    CellValue:Variant;
    PObjCell: PCellObj;
    cellOnDisplay:TcxGridTableDataCellViewInfo;
    cellOnDisplayLast:TcxGridTableDataCellViewInfo;
    WidthColumnsCell :Integer;
    WidthNoDisplayColumn:Integer;
    Text:WideString;
    HeightHint:Integer;
begin
 self.FHint.Hide;
 HitTest := FView.ViewData.GridView.ViewInfo.GetHitTest(X, Y);
 if ( HitTest<>nil )and( HitTest is TcxGridRecordCellHitTest ) then
 begin
   itemCol := TcxGridRecordCellHitTest(HitTest).Item;
   itemRow := TcxGridRecordCellHitTest(HitTest).GridRecord;
   CellValue := FView.DataController.Values[ itemRow.Index , itemCol.Index ];

   if Button = mbLeft then
   begin
     if HitTest is TcxGridRecordCellHitTest then
      begin

        if ( CellValue <> null ) and ( CellValue<>'' ) then
        begin
         PObjCell:= PCellObj( Integer( CellValue ) );
         ObjCell :=PObjCell^;

         aRecCellArea:=FGetDisplayColumnRect(FView, TcxGridTableDataCellViewInfo(HitTest.ViewInfo),  ObjCell.StartColIndex, ObjCell.FinishColIndex);
         Text := ObjCell.Hint;
         FHint.Parent := TcxGrid(self.FView.Site.Parent);//TcxGrid( FView.Site.Parent );
         HeightHint := self.FHint.TextExtent( Text ).cy ;

         if TForm(TcxGrid(self.FView.Site.Parent).Owner).ClientRect.Bottom>=
            aRecCellArea.Bottom + HeightHint+GetSystemMetrics(SM_CYVSCROLL)+25 then
           aRecCellArea.Top:= aRecCellArea.Top + aRecCellArea.Bottom - aRecCellArea.Top

         else
         begin
          aRecCellArea.Top:= aRecCellArea.Top - HeightHint;//(aRecCellArea.Bottom - aRecCellArea.Top);//aRecCellArea.Top - HeightHint;
          aRecCellArea.Bottom:= aRecCellArea.Top+HeightHint;
         end;
         self.FHint.SetHintRect( aRecCellArea ,true);
         self.FHint.ShowHintText( Text , Self.FHintColor , self.FHintBorder );
        end;
      end;
    end;

  FActionChangeCell( CellValue );

 end;
  //******************************

  if @PersonalMouseUp<>nil then
    PersonalMouseUp(Sender,Button,Shift,X,Y);
end;
//******************************************************************************
procedure TTimeLinerView.ViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FActionChangeCell( FGetFocusedValueCell );
end;
//******************************************************************************
function TTimeLinerView.FGetTextFromList(aList:Tlist):Widestring;
var i:Integer;
begin
  result:='';
  for i:=0 to aList.Count-1 do
    result:=result + PFieldText(aList[i]).Text+#13;
  result:=Trim(result);
end;
//******************************************************************************
function TTimeLinerView.FGetDisplayColumnRect(aView:TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer):TRect;
var cellOnDisplay:TcxGridTableDataCellViewInfo;
    cellOnDisplayLast:TcxGridTableDataCellViewInfo;
begin
 self.FindFistColumnOnDisplay( aView ,AViewInfo, FromCol, ToCol, cellOnDisplay );
 self.FindLastColumnOnDisplay( aView , AViewInfo, FromCol, ToCol, cellOnDisplayLast );

 result.Left:= cellOnDisplay.Bounds.Left;
 result.Top := cellOnDisplay.Bounds.Top;
 result.Bottom := cellOnDisplay.Bounds.Bottom;
 result.Right  := cellOnDisplayLast.Bounds.Right;

 if result.Left < 0 then result.Left := MergeTopLeft
 else result.Left := result.Left + MergeTopLeft;
end;
//******************************************************************************
procedure TTimeLinerView.ViewNameGetCellHint(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  ACellViewInfo: TcxGridTableDataCellViewInfo; const AMousePos: TPoint;
  var AHintText: TCaption; var AIsHintMultiLine: Boolean;
  var AHintTextRect: TRect);
var PObjCell: PCellObj;
    ASelectRect:TRect;
    cellOnDisplay:TcxGridTableDataCellViewInfo;
    cellOnDisplayLast:TcxGridTableDataCellViewInfo;
begin
    if ( ACellViewInfo.Value <> null ) and ( ACellViewInfo.Value<>'' ) then
    begin
     PObjCell:= PCellObj( Integer( ACellViewInfo.Value ) );

     ASelectRect:=FGetDisplayColumnRect(Sender.GridView ,ACellViewInfo,  PObjCell^.StartColIndex,  PObjCell^.FinishColIndex );
     if not FCheckCorrectVisibleTextOnRect(self.FView.Site.Canvas,  ASelectRect, PObjCell^.TextList ) then
       AHintText:= FGetTextFromList(PObjCell^.TextList);
    end;
end;
//******************************************************************************
Function TTimeLinerView.GetDBValueByID(FieldName:String;IdValue:Variant):Variant;
begin
 try
  result := null;
  
  self.FDB.DisableControls;
  if self.FDB.Locate(self.FFieldNameID,IdValue ,[]) then
  result := self.FDB.FieldByName(FieldName).AsVariant;
  
 finally
  self.FDB.EnableControls;  
 end;
end;
//******************************************************************************
Function TTimeLinerView.IsCellFocused : Boolean;
begin
  if (self.FView.Controller.FocusedRowIndex<>-1 )and (self.FView.Controller.FocusedColumn.Index<>-1) then
    result:=True
    else
     result:=False;
end;
//******************************************************************************
Function TTimeLinerView.FGetFocusedValueCell:Variant;
begin
  if (self.FView.Controller.FocusedRowIndex<>-1) and (self.FView.Controller.FocusedColumn<>nil)and
     (self.FView.Controller.FocusedColumn.Index <>-1) then
  result := self.FView.DataController.Values[self.FView.Controller.FocusedRowIndex , self.FView.Controller.FocusedColumn.Index ]
 else result:='';
end;
//******************************************************************************
Function TTimeLinerView.GetDBFocusedValueByID( FieldName:String ):Variant;
var CellValue:Variant;
    PObjCell: PCellObj;
begin
   result:=null;
   if not IsCellFocused then Exit;

   CellValue := FGetFocusedValueCell;
   if ( CellValue <> null ) and ( CellValue <>'' ) then
    begin
     PObjCell:= PCellObj( Integer( CellValue ) );

     result:= GetDBValueByID(FieldName , PObjCell^.id );
    end;
end;
//******************************************************************************
procedure TTimeLinerView.SetShowDataOutRange(aShow: Boolean);
begin
 FShowDataOutRangeDate := aShow;
end;

end.



     //WidthColumnsCell := FCalculateWithAreaColumn( ObjCell.StartColIndex , ObjCell.FinishColIndex );
     //StartDisplayColIndex:=self.FindFistColumnOnDisplay( FView ,TcxGridTableDataCellViewInfo(HitTest.ViewInfo), ObjCell.StartColIndex, ObjCell.FinishColIndex, cellOnDisplay );
     //LastDisplayColumn:=self.FindLastColumnOnDisplay( FView , TcxGridTableDataCellViewInfo(HitTest.ViewInfo), ObjCell.StartColIndex, ObjCell.FinishColIndex, cellOnDisplayLast );

     //WidthNoDisplayColumn := FCalculateWithAreaColumn( cellOnDisplay.Item.Index , cellOnDisplayLast.Item.Index);

     //aRecCellArea := cellOnDisplay.Bounds;
     //if aRecCellArea.Left<0 then aRecCellArea.Left:=1;

     //if (cellOnDisplayLast<>nil)and(cellOnDisplayLast.Item.Index <>ObjCell.FinishColIndex) then
     //aRecCellArea.Left:=aRecCellArea.Left - WidthNoDisplayColumn;

     //aRecCellArea.Top:= aRecCellArea.Top + aRecCellArea.Bottom - aRecCellArea.Top;
     //aRecCellArea.Right:= aRecCellArea.left + WidthColumnsCell;
