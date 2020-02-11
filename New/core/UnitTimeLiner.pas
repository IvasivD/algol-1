unit UnitTimeLiner;

interface
uses                                                                                                            
   Windows, Messages, SysUtils, Classes, Graphics, Controls,Contnrs, Forms, Dialogs,Variants, cxGraphics , cxClasses , Math, cxGridTableView, cxStyles ,
   ImgList, ExtCtrls, ComCtrls, StdCtrls, ActnList , Buttons, cxRichEdit,cxEdit,cxGridBandedTableView,DB,DateUtils,cxGridCustomTableView ,cxGrid , MyHint,cxTextEdit,
   UnitProc ;

const MasMonthEng:array[1..12] of string = ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
const MasMonthRus:array[1..12] of string = ('января', 'февраля', 'марта', 'апреля','мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября','декабря');
const MasMonthUkr:array[1..12] of string = ('Січень', 'Лютий', 'Березень', 'Квітень','Травень', 'Червень', 'Липень', 'Серпень', 'Вересень', 'Жовтень', 'Листопад','Грудень');

const DayNamesEng    : array[1..7] of string =('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'  );
const DayNamesRus    : array[1..7] of string =('Понедельник','Вторник','Среда','Четверг','Пятница','Субота','Воскресение' );
const DayNamesUkr    : array[1..7] of string =('Понеділок','Вівторок','Середа','Четверг','П''ятниця','Субота','Неділя' );

const DayNamesShortEn  :array[1..7] of string = ('mo','tu','we','th','fr','sa','su');
const DayNamesShortUkr  :array[1..7] of string = ('пн','вт','ср','чт','пт','сб','нд');
const DayNamesShortRus  :array[1..7] of string = ('пн','вт','ср','чт','пт','сб','вс');

const MergeTopLeft = 2;
      CpecSymbMerge = '#@#';

type

 TPointMonth = record
    month:Integer;
    day:Integer;
  end;

 TlinerFieldRow = record
    FieldCaptionRow :string;
    FieldRowCount:string;
    AddIndex : Boolean;
    isTemplate : Boolean;
 end;
 TlinerFieldRowArr = array of TlinerFieldRow;

 TLinerField = record
   Caption : string;
   FieldName : string;
   FieldKod : string;
   ColWidth : Integer;
   FieldTemplateColor : String;
   Visible : Boolean;
   VisibleWhenAllSame :Boolean;
   FieldByMergeRow: String;
   ShowFocused:Boolean;
 end;

 TLinerVarArrString = Array of TLinerField;

 TFieldText = Packed record
  FieldName:WideString;
  ColorFiledName:WideString;
  FontStyles:TFontStyles;
  Color:TColor;
  Text:Widestring;
 end;

 PFieldText = ^TFieldText;

 TFieldValue =  record
   FieldName : string;
   Value : Variant;
 end;

 TFiedlAddIdArr = array of TFieldValue;
 TVarArrString = Array of string;

 TCellObj = Packed Record
  id : Variant;
  TextList :TList;
  CountDay :Integer;
  StartColIndex :Integer;
  FinishColIndex :Integer;
  //RowIndex:Integer;   // Не використовувати так як Динамічно змінюються рядки в гріді
  BGColor:TColor;

  FiedlAddId : TFiedlAddIdArr ;
  Hint :WideString;
 end;
 PCellObj = ^TCellObj;

 TCellPivotObj = Packed Record
   id : Variant;
   FieldName:Variant;
   TextList : TList;
   BGColor  : TColor;
   TemplateColor : TColor;
   GroupByMergeRow : variant;
   ShowFocused : Boolean;
 end;
 PCellPivotObj = ^TCellPivotObj;

 TDataDB = record
   id:variant;
   Text:TList;
   BgroundColor:TColor;
   CountCol:Integer;
   Hint:WideString;
   ColumnIndex:Integer;
   FontStyles : TFontStyles;
   AddFieldValue : TFiedlAddIdArr;
 end;
 PDataDB = ^TDataDB;


 TEventSelectCell = procedure (id:Variant) of object;
 TEventUpdateValue = procedure (id:Variant; FieldName:string;Value:Variant ) of object;

 TDragAndDropFunct = function( Col, Row:Integer; CellObj : PCellObj ):boolean;

 TTimeLinerView=class
 private

  FDragAndDropFunct : TDragAndDropFunct;
  FClearAllBefore : Boolean;
  FView:TcxGridBandedTableView;
  FDB:TDataSet;
  FMasMonth : array[1..12] of String;
  FMasDayWeek : array[1..7] of String;

  FStartDate : TDateTime;
  FEndDate : TDateTime;
  FSeekDay1 : Integer;
  FSeekDay2 : Integer;

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
  FListShowFields : TList;
  FMasFields : TVarArrString;

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

  FSelfStartDragPObjCell  : PCellObj;
  FCurrDragOverHitTextRowIndex : Integer;

  FPersonalStartDrag : TStartDragEvent;
  FPersonalDragOver  : TDragOverEvent;
  FPersonalDragDrop  : TDragDropEvent;

  FEventSelectCell : TEventSelectCell;
  FEvaentUpdateValue: TEventUpdateValue;
  FHint :TMyHint;
  FSaveFocusedRow:Integer;
  FSaveFocusedCol:Integer;
  FTopRowIndex:Integer;
  FStyleHeaderSelection : TcxStyle;
  FStyleHeaderDragOver  : TcxStyle;
  FTestLabel :TLabel;

  function  FGetTextFromList(aList:Tlist):Widestring;
  //function  SetPoint(month,day:Integer): Integer;
  //function  GetPoint(value: Integer): TPointMonth;

  procedure FClearBandAndCol;
  Procedure FBuildBundMonth;
  procedure FBuildBundDaysForMonth(aMonthBand:TcxGridBand;Year, Month , DayStartForMonth ,DayEndForMonth:Integer );
  Function  FcreateColumn(PrefixName:string; aDayBand:TcxGridBand):TcxGridBandedColumn;

  procedure FAutoBandWidth(aBand:TcxGridBand);
  procedure FBuildBundBeforeAfterDaysForDay(aDayBand:TcxGridBand);
  function  FFindMonthDayBand(Year, Month, Day:Integer):TcxGridBand;
  function  FindTypeDayBand( DayBand:TcxGridBand; TypeDay:Integer ):TcxGridBandedColumn;
  procedure FBuildData(StartRow:Integer=0); 

  function  FGetDataCurrFromDB(aDB:TDataSet;  ForInsertToCell:Boolean=False ):PDataDB;
  function  FgetShowText( aDB:TDataSet ):TList;
  function  FCalculateColumnCellCountDay(CountDay,TypeDayStart, TypeDayArriv:Integer):Integer;
  procedure FDisposeCellMem;
  procedure FDisposeMemoryTextList(var aText:TList);
  procedure FDisposeMemoryCellObj( aCol, aRow:Integer; var PObjCell:PCellObj; EmptyTextList:Boolean=true );
  procedure FDisposeRowCellMem(Row,ColStart,ColEnd:Integer;EmptyTextList:Boolean=true);
  function  FCreateObjCell( id:Variant; Text: TList;BgroundColor:TColor;
                            CountColumnCell, StartColIndex: Integer;aHint:Widestring; FiedlAddId : TFiedlAddIdArr):PCellObj;
  Function  FFindDataForCell( Row, Col, CountColCell:Integer; ExcceptCellObj: PCellObj=nil  ):Boolean; virtual;
  procedure FSetObjCellToGrid( Row :Integer; CellObj:PCellObj; Focused:Boolean=true );
  procedure FAddTextToRow( id:Variant; aText:TList;BgroundColor:TColor;
                          StartRow,Col,CountColCell:Integer;aHint:Widestring; FiedlAddId : TFiedlAddIdArr ); virtual;
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
  procedure FShowFocusHeader;
  procedure FRefreshPositionData;
  function  FGetDisplayColumnRect(aView:TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer):TRect;

  procedure ViewCustomDrawCell( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean); virtual;

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
  procedure ShowBorder(ACanvas: TcxCanvas; aRect: Trect; ColorBorder:TColor  );
  function  ColIsFocused(Sender: TcxCustomGridTableView; StartColIndex , FinishColIndex:Integer):Boolean;
  procedure FInsertEmptyRows;

  function  FGetColorFontSelection(Sender: TcxCustomGridTableView):TColor;
  function  FGetColorSelection(Sender: TcxCustomGridTableView):TColor;
  function  FFindCellById( id: Variant; var FindRow:Integer ):PCellObj;
  procedure FSetFocuceCell(Col,Row:Integer;TopRowIndex:Integer=-1); overload;
  function  FSetFocuceCell(CellObj: PCellObj; FindRow:Integer ): boolean; overload;

  procedure ViewMouseUp(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
  procedure ViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  function  FFindCellForDataField(FieldName: string; Value: Variant): PCellObj;
  procedure FUpdateCellByFieldName(CellObj:PCellObj; FieldName:string;Value:Variant );
  procedure FUpdateFocusedCellsByFieldName(PObjCell:PCellObj; FieldName:string;Value:Variant );
  procedure FDeleteCell( Row:integer;  CellObj : PCellObj );
  procedure FDeleteEmptyRows;
  Function  FGetFocusedValueCell:Variant;
  procedure ViewGridTimeLinerDragOver( Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean );
  procedure ViewGridTimeLinerDragDrop( Sender, Source: TObject; X, Y: Integer ); overload;
  procedure ViewGridTimeLinerStartDrag( Sender: TObject; var DragObject: TDragObject );
  //procedure ViewGridTimeLinerMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  procedure FPrepareGridView( En:Boolean );
  procedure FGetHitText( Sender:TObject; X, Y: Integer;
                        var aCurrHitTestCol : TcxCustomGridTableItem;
                        var aCurrHitTextRow : TcxCustomGridRecord; JustVisible:Boolean = True );
  function  FReplaceObjTo( Row, Col:Integer; CellObj : PCellObj;FromRow:Integer ):Boolean;overload;
  function  FMoveToObj( Row,Col:Integer; CellObj : PCellObj; TypeDay:integer ):Boolean;
  function  FMoveToDateObj( Row:Integer; Date:TDateTime; CellObj : PCellObj; TypeDay:integer ):Boolean;
 public

  constructor Create(aView:TcxGridBandedTableView;aDB:TDataSet;aFieldDate,aFieldContDay,aFieldArriveTime:string; aMasMonth , aMasDay:array of String ); overload;
  destructor  Destroy; virtual;
  procedure   View(aStartDate,aEndDate:TDateTime;ShowSplitLine:boolean=false;
                   ColorSplitLine:TColor=clSilver;HeightSplitLine:Integer=8;
                   ShowColor:Boolean=false; SeekDay1:Integer=0; SeekDay2:Integer=0 );
  Function  AddRow( ToIndex:Integer=-1 ):Integer;
  procedure SetStyleHeaderSelection ( aStyle:TcxStyle );
  procedure SetStyleHeaderDragOver ( aStyle:TcxStyle );
  function  FindColumn(Year, Month, Day, TypeDay:Integer):TcxGridBandedColumn;
  function  GetTypeDay(aTime:TTime):integer;
  procedure SetWidthColumn (aWidth:Integer);
  procedure SetCaptionColumn( ColBeforeDay , ColAfterDay:Widestring );

  procedure SetBorder( BorderColor:Integer );
  procedure SetDefBgroundColorCell(aColor:TColor);
  procedure SetColorSunday ( aColor:TColor );
  procedure SetShowFields( idFieldName , FieldBgroundColor:string; masFields:array of string; masColorFields:array of String;masFontStyle:array of TFontStyles; HeightRow:Integer=21 );
  procedure SetAddFields( masFields:array of string  );
  procedure SetHintParam( HintFieldName:string; Color:TColor=clYellow; BorderColor:TColor=-1 );
  procedure Repaint;
  procedure ShowFocusHeader;
  procedure ShowFocusHeaderDragOver( Col:TcxGridBandedColumn );
  procedure ClearAllRows;
  procedure UpdateData(FieldName:string; Value:Variant; Repaint:Boolean=true ); overload;
  procedure UpdateData; overload;

  function  GetFocuseValueByFieldName(FieldName:String):Variant;
  function  MoveToDate(Date:TDateTime; CountDay:Integer=-1 ):Boolean;
  procedure SetEventSelectCell(Event : TEventSelectCell);
  procedure SetEventUpdateValue(Event: TEventUpdateValue);
  function  FocusCellById( id:Variant ):boolean;
  function  GetFocusedValueByMouseCoordinate(X,Y:Integer):Variant;
  Function  GetDBValueByID(FieldName:String;IdValue:Variant):Variant;
  Function  GetDBFocusedValueByID(FieldName:String):Variant;
  procedure SetShowDataOutRange(aShow: Boolean);
  Function  IsCellFocused:Boolean;
  procedure SaveFocuseCell(SaveRow:Integer=-1; SaveCol:Integer=-1);
  procedure RestoreFocuseCell;
  procedure RefreshById( id:Variant );
  procedure SetLableForTest(aLb:TLabel);
  function  CanAcceptDragOver( Sender:TObject; X, Y: Integer; CountDay:Integer;var CountCol:integer ):Boolean; overload;
  function  CanAcceptDragOver( Sender:TObject; X, Y: Integer;CellObj: PCellObj;var CountCol:integer ):Boolean; overload;
  procedure SetFunctionDragAndDrop( aDragAndDropFunct : TDragAndDropFunct);overload;

  property  GetView : TcxGridBandedTableView read FView;

end;

 TPivotLeftHeader = record
    DB:TDataSet;
    FieldMainHeader : string;
    Fields : TLinerVarArrString;
 end;

 TTimeLinerPivotView=class(TTimeLinerView)
  private
    FPivotBandIndex : Integer;
    FBgHeaderColor : TColor;
    FBorderLeftHeaderColor : TColor;
    FPivotLeftHeader : TPivotLeftHeader;
    FShowTimeLinerTemplateColor : Boolean;
    function  FCheckColumnForAllSameValue(Col:TcxGridBandedColumn):Boolean;
    procedure FHideVirtualAllSameValueCols;
    function  FIsVirtualRow( Row:Integer;var TemplateColor:TColor ):Boolean;
    procedure FExangeNewValueFromLeftHeader( Row:Integer;  aCellObj : PCellObj );
    procedure ViewGridTimeLinerDragDrop( Sender, Source: TObject; X, Y: Integer ); overload;
    Function  FFindDataForCell( Row,Col,CountColCell:Integer ;  ExcceptCellObj: PCellObj=nil ):Boolean; override;
    function  FFindRowByFieldsArr( var StartRow :Integer; FiedlAddId : TFiedlAddIdArr; BandIndex:Integer ):Integer;
    function  FgetShowPivotText( FieldName, aText:string ):TList;
    procedure FAddMainBandPivotHeader( Text:String; BandIndex:Integer=0 );
    function  FCreateObjPivotCell(FieldName:string; id:Variant; Text:TList;BgroundColor:TColor;
                                  aHint:Widestring; TemplateColor:TColor; GroupByMergeRow:variant; ShowFocused:Boolean ):PCellPivotObj;
    procedure FAddMainDataForAddRow( Row,FromRow:Integer; BandIndex:Integer; TemplateColor:TColor );
    function  FBuildPivotCurrRowLeftHeader( DB:TDataset; BandIndex:Integer =0 ):integer;
    function  FAddPivotColumn( aCaption:String; BandIndex:Integer ):TcxGridBandedColumn;

    function  FFindPivotColByCaption(Header:String; BandIndex:Integer ):TcxGridBandedColumn;
    procedure FShowVertMergeBorder( ACanvas: TcxCanvas; aRect: Trect; ColorBorder : TColor );

    function  FGetFirstVisibleRow(Sender: TcxCustomGridTableView):Integer;
    function  FGetLastVisibleRow(Sender: TcxCustomGridTableView):Integer;
    function  FGetNearVisibleRow( Sender: TcxCustomGridTableView; CurrRow:Integer ):Integer;
    procedure FDisposeMemoryPCellPivotObj( aCol,aRow:Integer; var PPivotCell:PCellPivotObj; EmptyTextList:Boolean=true );
    procedure FDisposeRowPivotCellMem( Row:Integer; EmptyTextList:Boolean=true );
    procedure FDisposePivotCellMem;
    procedure FShowSelectedPivotLeftHeader( Sender: TcxCustomGridTableView; aStyleHeaderSelection : TcxStyle;
                                            ACanvas: TcxCanvas;AViewInfo: TcxGridTableDataCellViewInfo; JustFocused:Boolean );
    procedure FFindStartAndFinishMergeCell(Sender: TcxCustomGridTableView;AViewInfo: TcxGridTableDataCellViewInfo;
                                           CurrObjPivotCell :TCellPivotObj; CurrRowIndex,CurrColIndex:Integer;
                                           var StartRowCell,FinishRowCell,MidleRowCell:TcxGridTableDataCellViewInfo );
    procedure ViewCustomDrawCell( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);override;
    procedure FAddTextToRow( id:Variant; aText:TList; BgroundColor:TColor;
                             StartRow, Col, CountColCell: Integer; aHint:Widestring; FiedlAddId : TFiedlAddIdArr ); override;
    procedure FFindVirtualRows( Row:Integer;var StartRow:Integer;var ToRows:Integer );
    procedure FAddRowsFromVirtual(Row:Integer);
    procedure FMakeRealRowFromVirtual( Row, RowVirt:Integer; GroupByMergeRow:Variant );
    function  FReplaceObjTo( Row, Col:Integer; CellObj : PCellObj;FromRow:Integer ):Boolean;overload;
  public
    constructor Create( aView: TcxGridBandedTableView; aDB: TDataSet;aFieldDate,aFieldContDay,aFieldArriveTime:string;aMasMonth , aMasDay:array of String );
    destructor  Destroy; override;
    procedure SetLeftHeaderProperty( BgHeaderColor:TColor; BorderColor:Integer );
    function  PreparePivotRowLeftHeader( DB:TDataset; FieldMainHeader:string; FieldsPivot : TLinerVarArrString ):TPivotLeftHeader;
    procedure ViewPivot( PivotLeftHeader : TPivotLeftHeader; aStartDate,aEndDate:TDateTime;
                         {ShowSplitLine:boolean=false;ColorSplitLine:TColor = clSilver;
                         HeightSplitLine:Integer=8;}ShowColor:Boolean=false; ShowTimeLinerTemplateColor:Boolean=True; SeekDay1:Integer=0; SeekDay2:Integer=0 );
    function InsertObjCell( Sender: TObject;  X, Y: Integer; DB:TDataSet ):boolean;
 end;

 function PrepareTextToView(aText:WideString;Acanvas:TcxCanvas;WidthArea:Integer):WideString;

implementation

uses  Types, cxCustomData, cxGridCustomView, cxControls;

//MyEventProc:TPrepareAndOpenImage
// MyEventProc(OldImageADS1)
{ TTimeLinerView }
//******************************************************************************
function PrepareTextToView(aText:WideString;Acanvas:TcxCanvas;WidthArea:Integer):WideString;
const continie='...';
var i:Integer;
    k:integer;
    SaveText:WideString;
begin

  k:=Length(continie);
  if Acanvas.TextWidth(aText) > WidthArea then
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
constructor TTimeLinerView.Create( aView: TcxGridBandedTableView; aDB: TDataSet;aFieldDate,aFieldContDay,aFieldArriveTime:string;aMasMonth , aMasDay:array of String );
var i:Integer;
begin
  self.FView:=aView;
  self.FDB  :=aDB;
  FClearAllBefore := True;
  
  for i:=1 to Length(aMasMonth) do
    FMasMonth[i] := aMasMonth[i-1];

  for i:=1 to Length(aMasDay) do
     FMasDayWeek[i]:=aMasDay[i-1];


  self.FFieldNameDate := aFieldDate;
  self.FFieldNameCountDay := aFieldContDay;
  self.FFieldNameArriveTime := aFieldArriveTime;
  self.FColumnWidth := 50;

  FListShowFields := TList.Create;
  SetLength(FMasFields,0);

  self.FBorderWidth := 1;
  self.FBorderColor := -1;
  self.FSaveFocusedRow := -1;
  self.FSaveFocusedCol := -1;
  self.FTopRowIndex := -1;
  FStyleHeaderSelection:=nil;
  FStyleHeaderDragOver :=nil;
  FCurrDragOverHitTextRowIndex :=-1;

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
  FSelfStartDragPObjCell := nil;

  FColorSunday :=-1 ;

  FShowDataOutRangeDate := false;
  FShowSplitLine := false;
  FEventSelectCell := nil;
  FEvaentUpdateValue:=nil;
  
  FHint := TMyHint.Create(aView.Owner);
  
  self.FView.OptionsCustomize.BandMoving :=False;
  self.FView.OptionsCustomize.BandSizing :=False;
  self.FView.OptionsCustomize.ColumnMoving :=False;
  self.FView.OptionsCustomize.ColumnVertSizing:=False;
  self.FView.OptionsCustomize.ColumnHorzSizing:=False;

  FPrepareGridView(True);
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
  FPrepareGridView(False);
end;
//******************************************************************************
procedure TTimeLinerView.FPrepareGridView( En:Boolean );
begin
  if (self.FView <> nil)  then
  begin
    if En then
    begin
      FPersonalStartDrag := FView.OnStartDrag;
      FPersonalDragOver  := FView.OnDragOver;
      FPersonalDragDrop  := FView.OnDragDrop;
      PersonalDrawCell   := FView.OnCustomDrawCell;
      PersonalMouseUp := FView.OnMouseUp;

      FView.OnLeftPosChanged := View1LeftPosChanged;
      FView.OnTopRecordIndexChanged := View1LeftPosChanged;
      FView.OnCustomDrawCell := ViewCustomDrawCell;
      FView.OnGetCellHeight  := ViewGetCellHeight;
      FView.OnFocusedItemChanged :=self.ViewFocusedItemChanged;
      FView.OnFocusedRecordChanged:=self.ViewFocusedRecordChanged;
      FView.OnMouseUp := ViewMouseUp;
      FView.OnKeyDown := ViewKeyDown;
      FView.OnDragDrop := ViewGridTimeLinerDragDrop;
      FView.OnDragOver := ViewGridTimeLinerDragOver;
      FView.OnStartDrag := ViewGridTimeLinerStartDrag;
      //FView.OnMouseMove :=  ViewGridTimeLinerMouseMove;
    end
    else
    begin
      FView.OnDragDrop := FPersonalDragDrop;
      FView.OnDragOver := FPersonalDragOver;
      FView.OnStartDrag := FPersonalStartDrag;
      FView.OnMouseMove := nil;
    end;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.FDisposeMemoryTextList(var aText:TList);
var i:Integer;
begin
  for i:=0 to aText.Count - 1 do
   Dispose( PFieldText(aText[i]) );

  aText.Free;
  aText:=nil;
end;
//******************************************************************************
procedure TTimeLinerView.FDisposeMemoryCellObj(aCol,aRow:Integer; var PObjCell:PCellObj; EmptyTextList:Boolean=true );
var i:Integer;
begin
  if ( aCol = PObjCell^.StartColIndex)and(EmptyTextList)  then  // dispose Memory for Text
   FDisposeMemoryTextList(PObjCell^.TextList);

  for i:= PObjCell^.StartColIndex to  PObjCell^.FinishColIndex do
    if i<self.FView.ColumnCount then
      self.FView.DataController.Values[ aRow, i ]:=null;

  Dispose(PObjCell);
end;
//******************************************************************************
procedure TTimeLinerView.FDisposeRowCellMem( Row, ColStart, ColEnd:Integer;EmptyTextList:Boolean=true);
var PObjCell:PCellObj;
    CeilValue:Variant;
    Col , i:Integer;
begin
  try
    self.FView.BeginUpdate;

    for Col:=ColStart to ColEnd do
    begin
      //if Col=1 then ShowMessage('dd');
      CeilValue:= self.FView.DataController.Values[Row,Col];

      if (CeilValue<>Null) and (CeilValue<>'')  then
      begin
        if (self.FView.Columns[Col].Tag >0) then
        begin
          PObjCell:= PCellObj( Integer( CeilValue ) );
          FDisposeMemoryCellObj(Col,Row, PObjCell, EmptyTextList );
          self.FView.DataController.Values[Row,Col]:=null;
        end;
      end;
    end;

  finally
    self.FView.EndUpdate;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.FDisposeCellMem;
var Row:Integer;
begin
  for Row:=0 to self.FView.DataController.RecordCount-1 do
    FDisposeRowCellMem(Row, 0, self.FView.ColumnCount-1 );
end;
//******************************************************************************
procedure TTimeLinerView.SetWidthColumn (aWidth:Integer);
begin
  self.FColumnWidth:= aWidth;
end;
//******************************************************************************
function TTimeLinerView.FCreateObjCell( id:Variant; Text:TList;BgroundColor:TColor;
                                       CountColumnCell, StartColIndex: Integer;
                                       aHint:Widestring; FiedlAddId : TFiedlAddIdArr ):PCellObj;
var FinishColIndex:Integer;
begin
  New(result);

  FinishColIndex := StartColIndex + CountColumnCell -1;

  if (FinishColIndex >= Self.FView.ColumnCount) then
  FinishColIndex := Self.FView.ColumnCount-1;

  Result.id := id;
  result.TextList := Text;
  result.CountDay := CountColumnCell;
  result.StartColIndex  := StartColIndex;
  result.FinishColIndex := StartColIndex + CountColumnCell -1; //FinishColIndex;
  result.BGColor := BgroundColor;
  result.FiedlAddId := FiedlAddId;
  result.Hint := aHint;
end;
//******************************************************************************
Function TTimeLinerView.FFindDataForCell( Row, Col, CountColCell : Integer; ExcceptCellObj: PCellObj=nil ):Boolean;
var Len : Integer;
    i : Integer;
    CeilValue : Variant;
begin
  result:=False;

  if self.FView.ColumnCount <= Col then exit;
  if self.FView.DataController.RecordCount =0 then self.AddRow;
  
  CeilValue := self.FView.DataController.Values[ Row, Col ];

  for i:= Col to Col + CountColCell-1 do
  begin
    if self.FView.ColumnCount > i then
    begin
      CeilValue := self.FView.DataController.Values[ Row, i ];
      if (CeilValue <> Null)  then
      begin
        if ( ExcceptCellObj=nil ) or ( (ExcceptCellObj<>nil)and( PCellObj(Integer(CeilValue)) <>ExcceptCellObj ) )then
        begin
        
          result:=true;
          Break;

        end;
      end;
    end;
  end;
end;
//******************************************************************************
Function TTimeLinerView.FFindCellForDataField( FieldName:string; Value:Variant ):PCellObj;
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

         for i:=0 to PObjCell^.TextList.Count - 1 do
         begin
            if (PFieldText(PObjCell^.TextList[i]).FieldName = FieldName) and
               (PFieldText(PObjCell^.TextList[i]).Text = Value ) then
            begin
             //PObjCell^.RowIndex :=Row;
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
//function TTimeLinerView.FGet
//CeilValue := self.FView.DataController.Values[ self.FView.Controller.FocusedRowIndex , self.FView.Controller.FocusedColumn.Index ];
//******************************************************************************
procedure TTimeLinerView.FDeleteCell( Row:integer;  CellObj : PCellObj );
var i:Integer;
begin
  FDisposeRowCellMem( Row, CellObj^.StartColIndex , CellObj^.FinishColIndex , false);
end;
//******************************************************************************
function TTimeLinerView.FReplaceObjTo( Row, Col:Integer;  CellObj : PCellObj; FromRow:Integer ):Boolean;
var i:Integer;
    CeilValue:Variant;
    aRow:Integer;
begin
  result := False;
  try
    self.FView.BeginUpdate;
    CeilValue:= self.FView.DataController.Values[ FromRow, CellObj^.StartColIndex ];

    for i:= CellObj^.StartColIndex to CellObj^.FinishColIndex do
      self.FView.DataController.Values[ FromRow, i ]:= null; //PCellObj(Integer(CeilValue))^.RowIndex

    //PCellObj( Integer(CeilValue) )^.RowIndex := Row;
    PCellObj( Integer(CeilValue) )^.StartColIndex := Col;
    PCellObj( Integer(CeilValue) )^.FinishColIndex := Col+CellObj^.CountDay-1;

    for i:= Col to Col+CellObj^.CountDay-1 do
    begin
      self.FView.DataController.Values[ Row, i ]:= CeilValue;//PCellObj(Integer(CeilValue))^.RowIndex
    end;

    result := True;
    self.FSetFocuceCell( CellObj, Row );
  finally
    self.FView.EndUpdate;
  end;


end;
//******************************************************************************
function TTimeLinerView.FMoveToObj( Row, Col:Integer; CellObj : PCellObj; TypeDay:integer ):Boolean;
var  SaveShowSplit:Boolean;
    SaveId:Variant;
    SaveList:TList;
    SaveCountDay:Integer;
    SaveHint:Widestring;
    SaveBGColor:TColor;
    FiedlAddId : TFiedlAddIdArr ;
begin
  try
    result := False;

    self.FView.BeginUpdate;

    try

      SaveShowSplit:=self.FShowSplitLine;
      FDeleteEmptyRows;

      SaveId := CellObj^.id;
      SaveList := CellObj^.TextList;
      SaveCountDay := CellObj^.CountDay;
      SaveHint := CellObj^.Hint;
      SaveBGColor := CellObj^.BGColor;
      FiedlAddId := CellObj.FiedlAddId;
      FDeleteCell( Row,  CellObj );

      FAddTextToRow( SaveId , SaveList, SaveBGColor , 0, Col, SaveCountDay ,  SaveHint, FiedlAddId );
      result := True;

    finally
      self.FShowSplitLine:=SaveShowSplit;
      if self.FShowSplitLine then self.FInsertEmptyRows;
    end;

  finally
    self.FView.EndUpdate;
    self.Repaint;
    FocusCellById( SaveId );
  end;
end;
//******************************************************************************
function TTimeLinerView.FMoveToDateObj( Row:Integer; Date:TDateTime; CellObj : PCellObj; TypeDay:integer ):Boolean;
var currBandColumn:TcxGridBandedColumn;
    SaveShowSplit:Boolean;
    SaveId:Variant;
    SaveList:TList;
    SaveCountDay:Integer;
    SaveHint:Widestring;
    SaveBGColor:TColor;
    FiedlAddId : TFiedlAddIdArr ;
begin
  currBandColumn :=self.FindColumn( YearOf(Date), MonthOf(Date) ,DayOf(Date), TypeDay );
  if currBandColumn<>nil then
    result := FMoveToObj( Row, currBandColumn.Index, CellObj , TypeDay );
end;
//******************************************************************************
function TTimeLinerView.MoveToDate( Date:TDateTime; CountDay:Integer=-1 ):Boolean;
var currBandColumn:TcxGridBandedColumn;
    CeilValue:Variant;
    CellObj : PCellObj;
    CountCol:Integer;
    SaveShowSplit:Boolean;
    i:Integer;
    TypeDayStart:Integer;
    TypeDayArrive:integer;
begin
  result := false;

  CeilValue := self.FView.DataController.Values[ self.FView.Controller.FocusedRowIndex , self.FView.Controller.FocusedColumn.Index ];
  if ( CeilValue <> null ) and ( CeilValue<>'' ) then
  begin
    CellObj := PCellObj( Integer( CeilValue ) );
    TypeDayStart := GetTypeDay( TimeOf(Date) );
    TypeDayArrive := GetTypeDay( TimeOf( FDB.fieldByName( self.FFieldNameArriveTime ).AsDateTime ) );

    if CountDay <> -1 then
      CellObj^.CountDay := FCalculateColumnCellCountDay( CountDay, TypeDayStart, TypeDayArrive );


    result := FMoveToDateObj( self.FView.Controller.FocusedRowIndex, Date,  CellObj, TypeDayStart );///self.FView.Controller.FocusedColumn.Tag
  end;

end;
//******************************************************************************
function  TTimeLinerView.FFindMonthDayBand( Year, Month, Day:Integer):TcxGridBand;
var i:Integer;
    CurrDate:TDateTime;
    aYear:Word;
    aMonth:Word;
    aDay:Word;
begin
 result:=nil;

 for i:=0 to self.FView.Bands.Count-1 do
 begin
   CurrDate := UnixToDateTime( self.FView.Bands[i].Tag );
   DecodeDate( CurrDate , aYear, aMonth, aDay );

   if (aYear = Year)and( aMonth =Month ) and (aDay = Day) then
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
function TTimeLinerView.FindColumn( Year, Month, Day, TypeDay:Integer):TcxGridBandedColumn;
var MonthBand:TcxGridBand;
    DayBand:TcxGridBand;
begin
  result:=nil;
  DayBand := FFindMonthDayBand(Year, Month , Day);
  if (DayBand<> nil) then
    Result:= FindTypeDayBand( DayBand, TypeDay );
end;
//******************************************************************************
Function TTimeLinerView.FcreateColumn( PrefixName:string; aDayBand:TcxGridBand):TcxGridBandedColumn;
begin
  result := Self.FView.CreateColumn();
  result.Position.BandIndex := aDayBand.Index;
  result.HeaderAlignmentHorz:= taCenter;
  result.Options.Filtering := False;
  result.Options.Sorting  := False;
  result.Options.Moving  := False;
  result.MinWidth := Self.FColumnWidth;
  result.Width := Self.FColumnWidth;
  result.OnGetCellHint := self.ViewNameGetCellHint;
  result.Name :=  Self.FView.Name +'_'+ PrefixName+IntToStr( result.Index );
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
  col := FcreateColumn('Columns_1_', aDayBand );
  col.Caption:= self.FColBeforeDay;
  col.Tag:=1;

  col := FcreateColumn('Columns_2_', aDayBand );
  col.Caption:= self.FColAfterDay;
  col.Tag:=2;

  FAutoBandWidth(aDayBand);
end;
//******************************************************************************
{function TTimeLinerView.SetPoint(month,day:Integer): Integer;
begin
  result:= month + (day shl 16);
end;
//******************************************************************************
function TTimeLinerView.GetPoint(value: Integer): TPointMonth;
begin
  result.month := value and $FFFF;
  result.day := (value shr 16) and $FFFF;
end;  }
//******************************************************************************
procedure TTimeLinerView.FBuildBundDaysForMonth( aMonthBand:TcxGridBand; Year, Month, DayStartForMonth, DayEndForMonth:Integer );
var i:Integer;
    DayBand:TcxGridBand;
    DayNameBand:TcxGridBand;
    CurrDate:TDateTime;
begin
   for i:=DayStartForMonth to DayEndForMonth do
   begin
     CurrDate := EncodeDate(Year,Month,i);
     DayBand:= Self.FView.Bands.Add;
     DayBand.Caption := Copy( self.FMasMonth[Month],1,3 )+' '+IntToStr(i);

     if aMonthBand<> nil then
       DayBand.Position.BandIndex := aMonthBand.Index ;

     DayNameBand := Self.FView.Bands.Add;
     DayNameBand.Position.BandIndex := DayBand.Index ;
     DayNameBand.Caption := AnsiLowerCase( self.FMasDayWeek[ DayOfTheWeek(  CurrDate ) ] ); //Copy( self.FMasDayWeek[ DayOfWeek(EncodeDate(Year,Month,i)) ],1,3 ) );

     FBuildBundBeforeAfterDaysForDay( DayNameBand );

     DayBand.Tag := DateTimeToUnix(CurrDate);
     DayNameBand.Tag := DateTimeToUnix(CurrDate); 
     
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
procedure TTimeLinerView.FClearBandAndCol;
begin
  Self.FView.Bands.Clear;
  Self.FView.ClearItems;
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
     if (MonthOf(CurrDate) = MontStart) and (YearOf(CurrDate) = YearOf(FStartDate)) then
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
    PDBData := FGetDataCurrFromDB( self.FDB );
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
    FindRow:Integer;
begin
  PObjCell := self.FFindCellById( id, FindRow );
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
procedure TTimeLinerView.FSetObjCellToGrid( Row :Integer; CellObj:PCellObj; Focused:Boolean=true );
var i:Integer;

    Col:Integer;
begin
  Col := CellObj^.StartColIndex;

  for i := CellObj^.StartColIndex to Col + CellObj^.CountDay -1 do
  begin
    if Self.FView.ColumnCount > i  then
      Self.FView.DataController.Values[ Row , i ]:= Integer( PCellObj( CellObj ) );
  end;

  if Focused then
    self.FSetFocuceCell( Col , Row );
end;

//******************************************************************************
procedure TTimeLinerView.FAddTextToRow( id:Variant; aText:TList; BgroundColor:TColor;
                                        StartRow, Col, CountColCell: Integer; aHint:Widestring;
                                        FiedlAddId : TFiedlAddIdArr );
var i:Integer;
    CellObj:PCellObj;
begin
  if not FFindDataForCell( StartRow, Col, CountColCell ) then
  begin


    CellObj := FCreateObjCell( id, aText, BgroundColor,  CountColCell,  Col,   aHint, FiedlAddId );
    //CellObj.RowIndex := StartRow;

    FSetObjCellToGrid( StartRow, CellObj, true );
  end
  else
  begin
    if StartRow+1 > Self.FView.DataController.RecordCount-1 then
     AddRow;

    FAddTextToRow( id, aText, BgroundColor,  StartRow+1, Col, CountColCell ,aHint,FiedlAddId );
  end;
end;
//******************************************************************************
function  TTimeLinerView.FCalculateColumnCellCountDay( CountDay , TypeDayStart , TypeDayArriv:Integer ):Integer;
begin
 result:= CountDay * 2;

 if TypeDayStart=2 then result:=result + FSeekDay2;//- 1;
 if TypeDayArriv=1 then result:=result + FSeekDay1;//- 1;
end;
//******************************************************************************
function TTimeLinerView.FgetShowText( aDB:TDataSet ) : TList;
var i : Integer;
    ObjText : PFieldText;
begin
  Result := TList.Create;

  for i:=0 to self.FListShowFields.Count-1 do
  begin
    New(ObjText);

    ObjText.FieldName:= PFieldText( self.FListShowFields[i] )^.FieldName;
    ObjText.Text:= Trim( aDB.FieldByName( ObjText.FieldName ).AsString );

    if PFieldText(self.FListShowFields[i])^.ColorFiledName <> '' then
      ObjText.Color := aDB.FieldByName( PFieldText(self.FListShowFields[i] )^.ColorFiledName ).AsVariant
    else ObjText.Color:=FDefColorText;

    ObjText.FontStyles :=PFieldText( self.FListShowFields[i] ).FontStyles;
    Result.Add( ObjText );
  end;
end;
//******************************************************************************
procedure TTimeLinerView.ClearAllRows;
begin
  try
    Self.FView.BeginUpdate;

    self.FDisposeCellMem;
    while Self.FView.DataController.RecordCount<>0 do
     Self.FView.DataController.DeleteRecord(0);
     
  finally
    Self.FView.EndUpdate;
  end;
end;
//******************************************************************************
Function TTimeLinerView.AddRow( ToIndex:Integer=-1 ):Integer;
begin
  if ToIndex = -1 then
  begin
    Self.FView.DataController.AppendRecord;
    result:=Self.FView.DataController.RecordCount-1;
  end
  else
  begin
    Self.FView.DataController.InsertRecord( ToIndex );
    result := ToIndex;
  end;

  Self.FView.DataController.Post;
end;
//******************************************************************************
function TTimeLinerView.FGetDataCurrFromDB( aDB:TDataSet; ForInsertToCell:Boolean=False ):PDataDB;
var currDate:TDateTime;
    currMonth:Integer;
    currYear:Integer;
    currDay:Integer;
    CurrTypeDayStart:Integer;
    CurrTypeDayArrive:Integer;
    currBandColumn:TcxGridBandedColumn;
    currHint:Widestring;
    currBgroundColor:TColor;
    countDay:Integer;
    currStyle:TFontStyles;
    i:Integer;
begin
  currDate := aDB.fieldByName(self.FFieldNameDate).AsDateTime;
  currYear := YearOf( aDB.fieldByName(self.FFieldNameDate).AsDateTime );
  currMonth:= MonthOf( aDB.fieldByName(self.FFieldNameDate).AsDateTime );
  currDay  := DayOf( aDB.fieldByName(self.FFieldNameDate).AsDateTime);

  if ((not FShowDataOutRangeDate) and(currDate >= FStartDate)and(currDate <= FEndDate))or( FShowDataOutRangeDate ) then
  begin
    New(result);

    result.id   := aDB.fieldByName( Self.FFieldNameID ).AsVariant;

    //************************************
    if Self.FFieldBgroundColor<>'' then
    begin
      if aDB.fieldByName( Self.FFieldBgroundColor ).AsVariant <>null then
        currBgroundColor := aDB.fieldByName( Self.FFieldBgroundColor ).AsVariant
      else currBgroundColor := -1;
    end
     else currBgroundColor := -1;
    //************************************
    if self.FFieldNameHint <> '' then
       currHint := aDB.fieldByName( self.FFieldNameHint ).AsString
        else currHint:='';
    //************************************
    CurrTypeDayStart:= GetTypeDay( TimeOf( aDB.fieldByName(self.FFieldNameDate).AsDateTime) );
    countDay   := aDB.fieldByName( self.FFieldNameCountDay ).AsInteger;

    CurrTypeDayArrive := GetTypeDay( TimeOf( aDB.fieldByName( self.FFieldNameArriveTime ).AsDateTime ) );

    result.Text:= self.FgetShowText( aDB );

    SetLength( result.AddFieldValue , Length(FmasFields) );
    for i:=0 to Length(FmasFields)-1 do
    begin
      result.AddFieldValue[i].FieldName := FmasFields[i];
      result.AddFieldValue[i].Value := aDB.fieldByName( FmasFields[i] ).Value ;
    end;

    if currDate < FStartDate then
    begin
      currYear := YearOf(FStartDate);
      currMonth:= MonthOf(FStartDate);
      currDay  := DayOf(FStartDate);
      CountDay := countDay - DaysBetween(  DateOf(FStartDate) , DateOf(currDate) );
      CurrTypeDayStart :=1;
    end;

    result.CountCol := FCalculateColumnCellCountDay( CountDay , CurrTypeDayStart  , CurrTypeDayArrive );
    result.BgroundColor := currBgroundColor;
    result.Hint :=currHint;

    if not ForInsertToCell then
    begin

      //****************************
      currBandColumn :=self.FindColumn( currYear, currMonth , currDay, CurrTypeDayStart );
      //****************************
      if currBandColumn <> nil then
         begin

          Result.ColumnIndex := currBandColumn.Index;
         end
       else
       begin
        Dispose(result);
        result:=nil;
       end;
    end;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.FBuildData( StartRow:Integer=0 );
var currText:TList;
    CountCol:Integer;
    currId:Integer;
    PDBData : PDataDB;
begin
  try
    self.FDB.DisableControls;
    if self.FClearAllBefore then ClearAllRows;

    //if Self.FView.DataController.RecordCount = 0 then AddRow;
    self.FDB.First;

    while not self.FDB.Eof do
    begin

      try

        try
          PDBData := FGetDataCurrFromDB( self.FDB );

          if PDBData <> nil then
            FAddTextToRow( PDBData^.id, PDBData^.Text, PDBData^.BgroundColor , StartRow, PDBData^.ColumnIndex, PDBData^.CountCol, PDBData^.Hint, PDBData^.AddFieldValue );

        except
          ShowMessage( 'Error for read id:' +VarToStr( PDBData^.id ) );
        end;

      finally
       if PDBData<> nil then Dispose(PDBData);
      end;

      self.FDB.Next;
      
    end;

  finally
    self.FDB.EnableControls;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.UpdateData(FieldName:string; Value:Variant; Repaint:Boolean=true );
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
procedure TTimeLinerView.UpdateData;
var i:integer;
    CurrFieldName:String;
begin
  for i:=0 to self.FListShowFields.Count-1 do
  begin
    CurrFieldName:= PFieldText( self.FListShowFields[i] )^.FieldName;
    if FDB.FindField(CurrFieldName)<>nil then
      UpdateData( CurrFieldName, FDB.FieldByName(CurrFieldName).asString, False );
  end;

  FRefreshPositionData;
  self.Repaint;
end;
//******************************************************************************
procedure TTimeLinerView.FRefreshPositionData;
var CurrFocusData:Variant;
begin
 { CurrFocusData := GetDBValueByID( self.FFieldNameDate, IdValue:Variant);

  CurrFocusData := GetFocuseValueByFieldName( self.FFieldNameID );
  if FDB.Locate( self.FFieldNameID, CurrFocusData, [] ) then
  begin
    if CurrFocusData <> null then
  end; }

  self.MoveToDate( FDB.FieldByName( self.FFieldNameDate ).AsDateTime, FDB.FieldByName( self.FFieldNameCountDay ).asInteger  );
end;
//******************************************************************************
procedure TTimeLinerView.FShowFocusHeader;
var i:Integer;
    CellValue:Variant;
    PObjCell: PCellObj;
begin
  for i:=0 to self.FView.ColumnCount -1 do self.FView.Columns[i].Styles.Header:=nil;

  CellValue := FGetFocusedValueCell;
  if ( CellValue <> null ) and ( CellValue <>'' ) then
  begin
    PObjCell:= PCellObj( Integer( CellValue ) );
    for i := PObjCell^.StartColIndex to PObjCell^.FinishColIndex do
      self.FView.Columns[i].Styles.Header := FStyleHeaderSelection;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.ShowFocusHeader;
begin

 try
   self.FView.BeginUpdate ;
   FShowFocusHeader;
 finally
  self.FView.EndUpdate ;
 end;
 
end;
//******************************************************************************
procedure TTimeLinerView.ShowFocusHeaderDragOver( Col:TcxGridBandedColumn );
begin
  try

    self.FView.BeginUpdate ;
    FShowFocusHeader;
    Col.Styles.Header := FStyleHeaderDragOver;

  finally
    self.FView.EndUpdate;
  end;

  self.Repaint;
  self.FView.Site.Repaint;
end;
//******************************************************************************
procedure TTimeLinerView.Repaint;
begin
  if self = nil then exit;
  
  self.FView.Preview.GridView.LayoutChanged(true);
  self.FHint.Hide;
end;
//******************************************************************************
procedure TTimeLinerView.View(aStartDate,aEndDate:TDateTime;ShowSplitLine:boolean=false;
                              ColorSplitLine:TColor=clSilver;HeightSplitLine:Integer=8;ShowColor:Boolean=false; SeekDay1:Integer=0; SeekDay2:Integer=0   );
begin
 try
 
   if self.FView.DataController.RowCount <> 0 then
     self.SaveFocuseCell
   else self.SaveFocuseCell(0,0);
  
   Self.FView.BeginUpdate;
   Self.FView.OptionsView.DataRowHeight := Self.FHeightRow;

   FStartDate := aStartDate ;
   FEndDate := aEndDate;
   FSeekDay1 := SeekDay1;
   FSeekDay2 := SeekDay2;

   FBuildBundMonth;
   FBuildData;

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

 if self.FView.DataController.RecordCount <> 0 then
   self.FView.Controller.TopRowIndex :=0;
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

  if (SaveCol = -1) and (self.FView.Controller.FocusedColumn<>nil) then
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

     if cellOnDisplay <> nil then
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
    if i< TcxGridBandedTableView(Sender).ColumnCount then
    begin
      cellOnDisplay:= AViewInfo.RecordViewInfo.GetCellViewInfoByItem( aView.Columns[i] );
      if  cellOnDisplay <> nil then
      begin
        result:=i;
        Break;
      end;
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
    if i< TcxGridBandedTableView(Sender).ColumnCount then
    begin
      cellOnDisplay:= AViewInfo.RecordViewInfo.GetCellViewInfoByItem( aView.Columns[i] );
      if (cellOnDisplay<>nil) then
      result:= result + (cellOnDisplay.Bounds.Right - cellOnDisplay.Bounds.Left);
    end;  
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
     result := cellOnDisplay.EditBounds;
end;
//******************************************************************************
function TTimeLinerView.FPrepareTextToView(aText:WideString;Acanvas:TcxCanvas;WidthArea:Integer):WideString;
const continie='...';
var i:Integer;
    k:integer;
    SaveText:WideString;
begin
  result := PrepareTextToView(aText,Acanvas,WidthArea);
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
procedure TTimeLinerView.FDrawListTexT(ACanvas: TcxCanvas; AreaDrawText:TRect; VisibleWidth:Integer; TextList:TList );
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

    ACanvas.Font.Style := PFieldText(TextList[i])^.FontStyles;

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
    if i<aView.ColumnCount then
      if aView.Columns[i].Focused then
      begin
        result:=true;
        Break;
      end;
end;
//******************************************************************************
procedure TTimeLinerView.ShowBorder(ACanvas: TcxCanvas; aRect: Trect; ColorBorder:TColor );
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

  if (FColorSunday<>-1) and ( not AViewInfo.Selected ) and (TcxGridBandedColumn(AViewInfo.Item).Position.Band.Caption = AnsiLowerCase(FMasDayWeek[7])) then
    ACanvas.FillRect( ASelectRect, FColorSunday);


  if ( AViewInfo.Item.Tag >0 ) and (AViewInfo.GridRecord.Values[AViewInfo.item.index] <> null ) and
     ( AViewInfo.GridRecord.Values[AViewInfo.item.index]<>'' ) then
    begin
      PObjCell:= PCellObj( Integer(AViewInfo.GridRecord.Values[AViewInfo.item.index]) );
      ObjCell  := PObjCell^;
      TextList := ObjCell.TextList;
      currBGColor := ObjCell.BGColor;

      StartColIndex  := ObjCell.StartColIndex;
      FinishColIndex := ObjCell.FinishColIndex;

      if CheckColumn(StartColIndex , FinishColIndex )  then
      begin
        StartDisplayColIndex := self.FindFistColumnOnDisplay( Sender, AViewInfo, StartColIndex, FinishColIndex, cellOnDisplay );
        LastDisplayColumn := self.FindLastColumnOnDisplay( Sender, AViewInfo, ObjCell.StartColIndex, ObjCell.FinishColIndex, cellOnDisplayLast );

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

        ACanvas.Pen.Width := FBorderWidth;
        if self.FBorderColor <> -1 then
          ShowBorder(ACanvas, ASelectRect ,  Self.FBorderColor );
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
procedure TTimeLinerView.SetStyleHeaderDragOver ( aStyle:TcxStyle );
begin
  self.FStyleHeaderDragOver := aStyle;
end;
//******************************************************************************
procedure TTimeLinerView.SetFunctionDragAndDrop( aDragAndDropFunct: TDragAndDropFunct );
begin
  self.FDragAndDropFunct := aDragAndDropFunct;
end;
//******************************************************************************
procedure TTimeLinerView.SetHintParam( HintFieldName:string; Color:TColor=clYellow; BorderColor:TColor=-1 );
begin
  FFieldNameHint := HintFieldName;
  FHintColor := Color;
  FHintBorder := BorderColor;
end;
//******************************************************************************
procedure TTimeLinerView.SetShowFields(idFieldName , FieldBgroundColor:string; masFields:array of string;
                                       masColorFields:array of String;masFontStyle:array of TFontStyles; HeightRow:Integer=21 );
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
    PFieldObj.FontStyles := getFontStyleFieldName( i ) ;
    self.FListShowFields.Add( PFieldObj );
  end;
end;
//******************************************************************************
procedure TTimeLinerView.SetAddFields( masFields:array of string );
var i:integer;
begin
  SetLength( FmasFields, Length(masFields) );
  for i:=0 to Length(masFields)-1 do
  begin
    FmasFields[i]:= masFields[i];
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
 if not Self.FShowSplitLine then Exit;
 
 try

   Self.FView.BeginUpdate;
   Self.FView.OptionsSelection.MultiSelect := True;
   i := self.FView.DataController.RowCount-1;
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
   Self.FView.OptionsSelection.MultiSelect := false;
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
function TTimeLinerView.FFindCellById( id: Variant; var FindRow:Integer ):PCellObj;
var Row:Integer;
    Col:Integer;
    CeilValue:Variant;
begin
  result:=nil;
  FindRow := -1;
  for Row:=0 to self.FView.DataController.RecordCount -1 do
  begin
    for Col:=0 to self.FView.ColumnCount -1 do
    begin
      if self.FView.Columns[Col].Tag > 0 then
      begin
        CeilValue:=self.FView.DataController.Values[Row,Col];
        if (CeilValue <> null)and(CeilValue<>'') then
        begin
          if PCellObj( Integer( CeilValue ) )^.id = id then
          begin
            result:= PCellObj( Integer( CeilValue ) );
            FindRow := Row;
            exit;
          end;
        end;

      end;
    end;
  end;
end;
//******************************************************************************
procedure TTimeLinerView.FSetFocuceCell( Col, Row:Integer; TopRowIndex:Integer=-1);
begin
  if self.FView.ColumnCount<=Col then exit;

  self.FView.Columns[Col].Selected:=True;

  if not self.FView.IsUpdateLocked then
    self.FView.Columns[Col].Focused:=True;

  if self.FView.DataController.RowCount> Row then
    self.FView.DataController.FocusedRowIndex:= Row ;

  if TopRowIndex <> -1 then
    self.FView.Controller.TopRowIndex:= TopRowIndex;
end;
//******************************************************************************
function TTimeLinerView.FSetFocuceCell( CellObj: PCellObj; FindRow:Integer ): boolean;
begin
  if CellObj<>nil then
  begin
    FSetFocuceCell( CellObj^.StartColIndex , FindRow );
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
var CellObj: PCellObj;
    FindRow:Integer;
begin
  CellObj := FFindCellById( id,FindRow );
  if CellObj <> nil then
    result := FSetFocuceCell( CellObj, FindRow );
end;
//******************************************************************************
procedure TTimeLinerView.SetLableForTest(aLb:TLabel);
begin
  FTestLabel:= aLb;
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
     if (HitTest is TcxGridRecordCellHitTest) then
      begin

        if ( CellValue <> null ) and ( CellValue<>'' )and (itemCol.Tag >0) then
        begin
         PObjCell:= PCellObj( Integer( CellValue ) );
         ObjCell :=PObjCell^;

         aRecCellArea:=FGetDisplayColumnRect(FView, TcxGridTableDataCellViewInfo(HitTest.ViewInfo),  ObjCell.StartColIndex, ObjCell.FinishColIndex);
         Text := ObjCell.Hint;
         FHint.Parent := TcxGrid(self.FView.Site.Parent);//TcxGrid( FView.Site.Parent );
         HeightHint := self.FHint.TextExtent( Text ).cy ;

         if TForm(TcxGrid(self.FView.Site.Parent).Owner).ClientRect.Bottom >=
            aRecCellArea.Bottom + HeightHint + GetSystemMetrics(SM_CYVSCROLL) + 25 then
           aRecCellArea.Top:= aRecCellArea.Top + aRecCellArea.Bottom - aRecCellArea.Top

         else
         begin
          aRecCellArea.Top:= aRecCellArea.Top - HeightHint;//(aRecCellArea.Bottom - aRecCellArea.Top);//aRecCellArea.Top - HeightHint;
          aRecCellArea.Bottom:= aRecCellArea.Top+HeightHint;
         end;
         
         if Text <> '' then
         begin
           self.FHint.SetHintRect( aRecCellArea ,true);
           self.FHint.ShowHintText( Text , Self.FHintColor , self.FHintBorder );
         end;
        end;
      end;
    end;

   if itemCol.Tag >0 then FActionChangeCell( CellValue );

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
    result := result + PFieldText(aList[i]).Text+#13;
  result := Trim(result);
end;
//******************************************************************************
function TTimeLinerView.FGetDisplayColumnRect( aView:TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo; FromCol,ToCol:Integer ):TRect;
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
  if ( ACellViewInfo.Item.Tag > 0 ) and( ACellViewInfo.Value <> null ) and ( ACellViewInfo.Value<>'' ) then
  begin
   PObjCell:= PCellObj( Integer( ACellViewInfo.Value ) );

   ASelectRect:=FGetDisplayColumnRect(Sender.GridView ,ACellViewInfo,  PObjCell^.StartColIndex,  PObjCell^.FinishColIndex );
   if not FCheckCorrectVisibleTextOnRect(self.FView.Site.Canvas,  ASelectRect, PObjCell^.TextList ) then
     AHintText:= FGetTextFromList(PObjCell^.TextList);
  end;
end;
//******************************************************************************
Function TTimeLinerView.GetDBValueByID( FieldName:String; IdValue:Variant ):Variant;
begin
 try
   result := null;
  
   self.FDB.DisableControls;
   if self.FDB.Locate(self.FFieldNameID,IdValue ,[]) then
   result := self.FDB.FieldByName( FieldName ).AsVariant;
  
 finally
   self.FDB.EnableControls;
 end;
end;
//******************************************************************************
Function TTimeLinerView.IsCellFocused : Boolean;
begin
  if (self.FView.Controller.FocusedRowIndex<>-1 )and (self.FView.Controller.FocusedColumn.Index<>-1) then
    result:=True
  else result:=False;
end;
//******************************************************************************
Function TTimeLinerView.FGetFocusedValueCell:Variant;
begin
  if ( self.FView.Controller.FocusedRowIndex<>-1 ) and
     ( self.FView.Controller.FocusedColumn <> nil )and
     ( self.FView.Controller.FocusedColumn.Tag >0 )and
     ( self.FView.Controller.FocusedColumn.Index <>-1 ) then
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

    result := GetDBValueByID( FieldName , PObjCell^.id );
  end;
end;
//******************************************************************************
procedure TTimeLinerView.SetShowDataOutRange(aShow: Boolean);
begin
 FShowDataOutRangeDate := aShow;
end;
//******************************************************************************
procedure TTimeLinerView.ViewGridTimeLinerStartDrag( Sender: TObject; var DragObject: TDragObject );
var SelValue:Variant;
    FocusedItemIndex:Integer;
begin
  self.FSelfStartDragPObjCell:=nil;

  if TcxGridBandedTableView(TcxGridSite(Sender).GridView).Controller.FocusedColumn.tag >0 then
  begin
    FocusedItemIndex := TcxGridBandedTableView(TcxGridSite(Sender).GridView).FindItemByName(TcxGridBandedTableView(TcxGridSite(Sender).GridView).Controller.FocusedColumn.Name).Index;
    SelValue := TcxGridBandedTableView(TcxGridSite(Sender).GridView).DataController.Values[ TcxGridBandedTableView(TcxGridSite(Sender).GridView).Controller.FocusedRowIndex, FocusedItemIndex ];

    if SelValue <> null then
      self.FSelfStartDragPObjCell:= PCellObj( Integer( SelValue ) );

    if @FPersonalStartDrag <> nil then FPersonalStartDrag( Sender, DragObject );
  end;
end;
//******************************************************************************
procedure TTimeLinerView.ViewGridTimeLinerDragOver( Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean );
var aCurrHitTestCol : TcxCustomGridTableItem;
    aCurrHitTextRow : TcxCustomGridRecord;
    SelValue : Variant;
    CountCol:integer;
    FocusedItemIndex:Integer;
    CellObj: PCellObj;
begin
  //FCurrDragOverHitTextRow := nil;

  FGetHitText( Sender, X, Y, aCurrHitTestCol , aCurrHitTextRow );
  if self.FSelfStartDragPObjCell <> nil then
  begin

    if ( aCurrHitTestCol <> nil ) and ( aCurrHitTextRow <> nil ) and ( aCurrHitTestCol.Tag > 0 )  then
    begin

      SelValue := TcxGridBandedTableView( TcxGridSite(Sender).GridView ).DataController.Values[ aCurrHitTextRow.Index , aCurrHitTestCol.Index ];
      Accept := self.CanAcceptDragOver( Sender, X, Y, self.FSelfStartDragPObjCell, CountCol );
      ShowFocusHeaderDragOver( TcxGridBandedColumn( aCurrHitTestCol ) );

      FCurrDragOverHitTextRowIndex := aCurrHitTextRow.Index;
    end
    else Accept := False;
    
  end
  else
  begin
    Accept := False;
    if @FPersonalDragOver <> nil then FPersonalDragOver( Sender, Source, X, Y,State,Accept);
  end;
  
end;
//******************************************************************************
procedure TTimeLinerView.ViewGridTimeLinerDragDrop( Sender, Source: TObject; X, Y: Integer);
var aCurrHitTestCol : TcxCustomGridTableItem;
    aCurrHitTextRow : TcxCustomGridRecord;
    CurrRow:Integer;
    CurrCol:Integer;
    ResultValue : Variant;
    ResultObj:PCellObj;
begin
  FGetHitText( Sender, X, Y, aCurrHitTestCol , aCurrHitTextRow );

  if ( aCurrHitTestCol <> nil )and (aCurrHitTextRow <> nil)and ( aCurrHitTestCol.Tag>0 ) then
  begin

    CurrRow :=aCurrHitTextRow.Index;
    CurrCol :=aCurrHitTestCol.Index;
    
    if self.FSelfStartDragPObjCell <> nil then  // if move from self Grid
    begin
      FReplaceObjTo( CurrRow, aCurrHitTestCol.Index, self.FSelfStartDragPObjCell, self.FView.Controller.FocusedRowIndex );

      if @FDragAndDropFunct<> nil then
      begin
        ResultValue :=self.FView.DataController.Values[ CurrRow, CurrCol ];
        if ResultValue <> null then
        begin
          ResultObj := PCellObj( Integer( ResultValue ) );
          FDragAndDropFunct( CurrCol , CurrRow,  ResultObj );
        end;
      end;
    end
    else
    if @FPersonalDragDrop <> nil then FPersonalDragDrop( Sender, Source, X, Y );
  end;

  self.FSelfStartDragPObjCell  := nil;
  FCurrDragOverHitTextRowIndex := -1;
  self.FShowFocusHeader;
end;
//******************************************************************************
procedure TTimeLinerView.FGetHitText( Sender:TObject; X, Y: Integer;
                                      var aCurrHitTestCol : TcxCustomGridTableItem;
                                      var aCurrHitTextRow : TcxCustomGridRecord; JustVisible:Boolean = True );
var FCurrHitTest : TcxCustomGridHitTest;
begin
  FCurrHitTest := TcxGridSite(Sender).ViewInfo.GetHitTest( X, Y );
  if (FCurrHitTest is TcxGridRecordCellHitTest )then
  begin
    aCurrHitTestCol := TcxGridRecordCellHitTest( FCurrHitTest ).Item;
    aCurrHitTextRow := TcxGridRecordHitTest( FCurrHitTest ).GridRecord;

    if JustVisible then
    begin
      if not aCurrHitTestCol.Visible then aCurrHitTestCol:=nil;
      if not aCurrHitTextRow.Visible then aCurrHitTextRow:=nil;
    end;
  end
  else
  begin
    aCurrHitTestCol:=nil;
    aCurrHitTextRow:=nil;
  end;


end;
//******************************************************************************
function TTimeLinerView.CanAcceptDragOver( Sender:TObject; X, Y: Integer; CountDay:Integer;var CountCol:integer ):Boolean;
var aCurrHitTestCol : TcxCustomGridTableItem;
    aCurrHitTextRow : TcxCustomGridRecord;
begin
  result := False;

  FGetHitText( Sender, X, Y, aCurrHitTestCol , aCurrHitTextRow );
  if ( aCurrHitTestCol <> nil )and (aCurrHitTextRow <> nil)and(aCurrHitTestCol.Tag>0) then
  begin
    CountCol := FCalculateColumnCellCountDay( CountDay , aCurrHitTestCol.Tag  , aCurrHitTestCol.Tag );
    result:= not FFindDataForCell( aCurrHitTextRow.Index, aCurrHitTestCol.Index, CountCol );
  end;

end;
//******************************************************************************
function TTimeLinerView.CanAcceptDragOver( Sender:TObject; X, Y: Integer;CellObj: PCellObj; var CountCol:integer ):Boolean;
var aCurrHitTestCol : TcxCustomGridTableItem;
    aCurrHitTextRow : TcxCustomGridRecord;
begin
  result := False;

  FGetHitText( Sender, X, Y, aCurrHitTestCol , aCurrHitTextRow );
  if ( aCurrHitTestCol <> nil )and (aCurrHitTextRow <> nil)and(aCurrHitTestCol.Tag>0) then
  begin
    CountCol := CellObj^.CountDay;
    result:= not FFindDataForCell( aCurrHitTextRow.Index, aCurrHitTestCol.Index, CountCol, CellObj );
  end;

end;
//******************************************************************************
constructor TTimeLinerPivotView.Create(aView: TcxGridBandedTableView;
  aDB: TDataSet; aFieldDate, aFieldContDay, aFieldArriveTime: string;
  aMasMonth, aMasDay: array of String );
begin

  FBorderLeftHeaderColor := clBlack;
  FBgHeaderColor := clMenu;
  FPivotBandIndex:= 0;
  TTimeLinerView(Self).Create( aView, aDB, aFieldDate ,aFieldContDay, aFieldArriveTime, aMasMonth , aMasDay );
  FView.OnDragDrop := ViewGridTimeLinerDragDrop;
  //FView.OptionsSelection.MultiSelect := True;
end;
//******************************************************************************
function TTimeLinerPivotView.FFindPivotColByCaption( Header:String; BandIndex:Integer ):TcxGridBandedColumn;
var i:Integer;
begin
  Result := nil;

  for i:=0 to self.FView.Bands.Items[ BandIndex ].ColumnCount - 1 do
  begin
    if ( self.FView.Bands.Items[ BandIndex ].Columns[i].Tag = 0 ) and
       ( CompareText( self.FView.Bands.Items[ BandIndex ].Columns[i].Caption, Header ) = 0 ) then
    begin
      Result := self.FView.Bands.Items[ BandIndex ].Columns[i];
      Break;
    end;
  end;

end;
//******************************************************************************
function TTimeLinerPivotView.FAddPivotColumn( aCaption:String; BandIndex:Integer ):TcxGridBandedColumn;
var HeaderBand : TcxGridBand;
begin
  HeaderBand := self.FView.Bands.Items[ BandIndex ];
  result := FcreateColumn('ColumnsPivot_0_', HeaderBand );
  result.Tag := 0;
  result.Caption := aCaption;
  result.Options.CellMerging:=True;
end;
//******************************************************************************
procedure TTimeLinerPivotView.FAddMainBandPivotHeader( Text:String; BandIndex:Integer=0 );
var HeaderBand : TcxGridBand;
    col:TcxGridBandedColumn;
begin
  HeaderBand := Self.FView.Bands.Add;
  HeaderBand.Index := BandIndex;
  HeaderBand.Caption := Text;
  HeaderBand.FixedKind := fkLeft;
end;
//******************************************************************************
function TTimeLinerPivotView.FgetShowPivotText( FieldName, aText:string ):TList;
var i:Integer;
    ObjText:PFieldText;
begin
  Result := TList.Create;

  New(ObjText);
  ObjText.FieldName:= FieldName;
  ObjText.Text:= Trim( aText );
  ObjText.Color := self.FDefColorText;

  ObjText.FontStyles := [];
  Result.Add( ObjText );
end;
//******************************************************************************
function TTimeLinerPivotView.FCreateObjPivotCell( FieldName:string; id:Variant; Text:TList; BgroundColor:TColor;
                                                  aHint:Widestring; TemplateColor:TColor; GroupByMergeRow:variant; ShowFocused:Boolean ):PCellPivotObj;
begin
  New(result);

  Result.id := id;
  result.FieldName := FieldName;
  result.TextList := Text ;

  if BgroundColor <> null then
   result.BGColor := BgroundColor
  else result.BGColor := -1;

  if TemplateColor <> -1 then
   result.TemplateColor := TemplateColor
  else result.TemplateColor := -1;

  Result.GroupByMergeRow := GroupByMergeRow;
  Result.ShowFocused := ShowFocused;
end;
//******************************************************************************
procedure TTimeLinerPivotView.FAddMainDataForAddRow( Row, FromRow:Integer; BandIndex:Integer; TemplateColor:TColor );
var i:Integer;
    Col:TcxGridBandedColumn;
    CellPivotObjP : PCellPivotObj;
begin
  for i:=0 to Length( FPivotLeftHeader.Fields )-1 do
  begin
    Col := FFindPivotColByCaption( FPivotLeftHeader.Fields[i].Caption, BandIndex );

    if ( Col <> nil ) and ( self.FView.DataController.Values[ FromRow, Col.Index ] <> null ) then
    begin
      CellPivotObjP := PCellPivotObj( Integer( self.FView.DataController.Values[ FromRow, Col.Index ] ) );
      if TemplateColor = -2 then  CellPivotObjP^.TemplateColor := -1;
      self.FView.DataController.Values[ Row, Col.Index ]:= Integer( CellPivotObjP );
    end;
    
  end;
end;
//******************************************************************************
function TTimeLinerPivotView.FFindRowByFieldsArr( var StartRow :Integer; FiedlAddId : TFiedlAddIdArr; BandIndex:Integer ):integer;
var r , i:Integer;
    ObjPivotCellP : PCellPivotObj;
    CountTrue:Integer;
    CurrValue:Variant;
//**************************************************************
Function CheckField( FieldName:string; Valueid:variant):Boolean;
var i:Integer;
begin
  result:= False;
  for i:=0 to Length( FiedlAddId ) -1 do
  begin
    if ( CompareText( FieldName, FiedlAddId[i].FieldName ) =0 ) and
       ( FiedlAddId[i].Value = Valueid ) then
    begin
      result:= True;
      Break;
    end;
  end;
end;
//**************************************************************
begin
  result := -1;

  for r:=StartRow to self.FView.DataController.RecordCount-1 do
  begin

    CountTrue :=0;
    for i:=0 to self.FView.Bands[ BandIndex ].ColumnCount -1 do
    begin
      CurrValue := self.FView.DataController.Values[ r, self.FView.Bands[ BandIndex ].Columns[i].Index ];

      if CurrValue <> null then
      begin
        ObjPivotCellP := PCellPivotObj( Integer( CurrValue ) );
        if CheckField( ObjPivotCellP^.FieldName, ObjPivotCellP^.id ) then
        begin
          inc(CountTrue);
          if CountTrue = self.FView.Bands[ BandIndex ].ColumnCount{Length(FiedlAddId)} then
          begin
            result := R;
            Exit;
          end;
        end;
      end;

    end;
    
  end;
end;
//******************************************************************************
function TTimeLinerPivotView.FBuildPivotCurrRowLeftHeader( DB:TDataset; BandIndex:Integer =0 ):integer;
var i :integer;
    CurrRowInd:Integer;
    Col:TcxGridBandedColumn;
    BandWidth:Integer;
    CellPivotObjP : PCellPivotObj;
    MainCurrRowInd:Integer;
    aBgColorVar:Variant;
    aTemplateColor:TColor;
    GroupByMergeRow : Variant;
begin
  CurrRowInd := self.AddRow;
  for i:=0 to Length(FPivotLeftHeader.Fields)-1 do
  begin

    Col := FFindPivotColByCaption( FPivotLeftHeader.Fields[i].Caption, BandIndex );
    if Col = nil then
    begin
      Col := FAddPivotColumn( FPivotLeftHeader.Fields[i].Caption, BandIndex );

      Col.MinWidth := FPivotLeftHeader.Fields[i].ColWidth;
      Col.Width := Col.MinWidth;
      Col.Visible := FPivotLeftHeader.Fields[i].Visible;

      Col.PropertiesClass := TcxTextEditProperties;
      TcxTextEditProperties( Col.Properties ).Alignment.Horz := taCenter;

      BandWidth := BandWidth + Col.Width;
    end;

    aBgColorVar := self.FDB.fieldByName( Self.FFieldBgroundColor ).AsVariant;
    if aBgColorVar = null then aBgColorVar := -1;

    if (FPivotLeftHeader.Fields[i].FieldTemplateColor <>'')and
       ( not self.FDB.fieldByName( FPivotLeftHeader.Fields[i].FieldTemplateColor).IsNull ) then
      aTemplateColor := self.FDB.fieldByName( FPivotLeftHeader.Fields[i].FieldTemplateColor).asVariant
    else aTemplateColor:= -1;

    if FPivotLeftHeader.Fields[i].FieldByMergeRow = '' then GroupByMergeRow := CpecSymbMerge
    else GroupByMergeRow:= FPivotLeftHeader.DB.FieldByName( FPivotLeftHeader.Fields[i].FieldByMergeRow ).Value;

    CellPivotObjP := FCreateObjPivotCell( FPivotLeftHeader.Fields[i].FieldKod,
                                          FPivotLeftHeader.DB.FieldByName( FPivotLeftHeader.Fields[i].FieldKod ).Value,
                                          FGetShowPivotText( FPivotLeftHeader.Fields[i].FieldName,  FPivotLeftHeader.DB.FieldByName( FPivotLeftHeader.Fields[i].FieldName ).AsString ),
                                          aBgColorVar, '', aTemplateColor, GroupByMergeRow, FPivotLeftHeader.Fields[i].ShowFocused );

    self.FView.DataController.Values[CurrRowInd, Col.Index ] := Integer( CellPivotObjP );
    MainCurrRowInd := CurrRowInd;

  end;
  result := CurrRowInd;
end;
//******************************************************************************
function TTimeLinerPivotView.PreparePivotRowLeftHeader( DB:TDataset; FieldMainHeader:string; FieldsPivot:TLinerVarArrString ):TPivotLeftHeader;
begin
  Result.DB := DB;
  Result.FieldMainHeader := FieldMainHeader;
  Result.Fields := FieldsPivot;
end;
//******************************************************************************
procedure TTimeLinerPivotView.SetLeftHeaderProperty( BgHeaderColor:TColor; BorderColor:Integer );
begin
  self.FBgHeaderColor:= BgHeaderColor;
  self.FBorderLeftHeaderColor := BorderColor;
end;
//******************************************************************************
procedure TTimeLinerPivotView.ViewPivot( PivotLeftHeader:TPivotLeftHeader; aStartDate,aEndDate:TDateTime;
                                         ShowColor:Boolean=false; ShowTimeLinerTemplateColor:Boolean=True; SeekDay1:Integer=0; SeekDay2:Integer=0  );
begin
  FPivotLeftHeader := PivotLeftHeader;
  FShowTimeLinerTemplateColor := ShowTimeLinerTemplateColor;

  try
    self.FView.BeginUpdate;
    
    FDisposePivotCellMem; // Очистити Память Для Pivot FDisposePivotCellMem
    ClearAllRows;
    FClearBandAndCol;

  finally
    self.FView.EndUpdate;
  end;

  FAddMainBandPivotHeader( FPivotLeftHeader.DB.FieldByName( FPivotLeftHeader.FieldMainHeader).AsString , 0 ) ;

  FClearAllBefore := False;
  FShowColor := ShowColor;

  self.View( aStartDate, aEndDate, False, clSilver, 18, ShowColor, SeekDay1, SeekDay2 );
  self.FHideVirtualAllSameValueCols;
end;
//******************************************************************************
procedure TTimeLinerPivotView.FAddTextToRow( id:Variant; aText:TList; BgroundColor:TColor;
                                             StartRow, Col, CountColCell: Integer; aHint:Widestring; FiedlAddId : TFiedlAddIdArr );
var i:Integer;
    k:Integer;
    CellObj:PCellObj;
    FindRowPivot:Integer;
    MainRowPivot:Integer;
begin
  FindRowPivot := FFindRowByFieldsArr( StartRow, FiedlAddId , self.FPivotBandIndex );

  if FindRowPivot <>-1 then
  begin
    MainRowPivot := FindRowPivot;
    StartRow := FindRowPivot;
  end
  else
  begin
    StartRow := FBuildPivotCurrRowLeftHeader( FDB, self.FPivotBandIndex );
    FindRowPivot:=StartRow;
  end;

  if (FindRowPivot <> -1) and ( not FFindDataForCell( StartRow, Col, CountColCell ) ) then
  begin
    k := 0;

    CellObj := FCreateObjCell( id, aText, BgroundColor,  CountColCell,  Col,  aHint, FiedlAddId );
    //CellObj.RowIndex := StartRow;

    FSetObjCellToGrid( StartRow, CellObj, true );
  end
  else FAddTextToRow( id, aText, BgroundColor,  StartRow+1, Col, CountColCell, aHint, FiedlAddId );
end;
//******************************************************************************
procedure TTimeLinerPivotView.FShowVertMergeBorder( ACanvas: TcxCanvas; aRect: Trect; ColorBorder : TColor );
begin
 ACanvas.Pen.Color:= ColorBorder;
 ACanvas.Pen.Width := 2;
 //Top Lile
 ACanvas.MoveTo( aRect.TopLeft.X  ,aRect.TopLeft.Y );
 ACanvas.LineTo( aRect.TopLeft.X + aRect.Right - aRect.Left -  Ceil( (FBorderWidth-1) / 2) -1 , aRect.TopLeft.Y);
 //Left Lile

 ACanvas.MoveTo( aRect.TopLeft.X + (aRect.Right - aRect.Left)-1  , aRect.TopLeft.Y );
 ACanvas.LineTo( aRect.TopLeft.X + (aRect.Right - aRect.Left)-1  , aRect.TopLeft.Y + ( aRect.Bottom  ) ); // - aRect.Top

 //Right Lile
 //ACanvas.MoveTo( aRect.TopLeft.X  ,aRect.TopLeft.Y );
 //ACanvas.LineTo( aRect.TopLeft.X  , aRect.TopLeft.Y + aRect.Bottom - aRect.Top );
 //Bottom Lile
 //ACanvas.MoveTo( aRect.TopLeft.X  ,aRect.TopLeft.Y+ (aRect.Bottom - aRect.Top) ); // - aRect.Top
 //ACanvas.LineTo( aRect.TopLeft.X + aRect.Right - aRect.Left - Ceil( (FBorderWidth-1) / 2)   , aRect.TopLeft.Y +( aRect.Bottom - aRect.Top) );    //- aRect.Top
end;
//******************************************************************************
function TTimeLinerPivotView.FGetFirstVisibleRow(Sender: TcxCustomGridTableView):Integer;
var r:Integer;
begin
  for r:=0 to TcxGridBandedTableView(Sender).ViewData.RowCount-1 do
  if TcxGridBandedTableView(Sender).ViewData.Records[r].Visible then
  begin
    result := r;
    break;
  end;
end;
//******************************************************************************
function TTimeLinerPivotView.FGetLastVisibleRow(Sender: TcxCustomGridTableView):Integer;
var r:Integer;
begin
  for r:=TcxGridBandedTableView(Sender).ViewData.RowCount-1 downto 0 do
  if TcxGridBandedTableView(Sender).ViewData.Records[r].Visible then
  begin
    result := r;
    break;
  end;
end;
//******************************************************************************
function TTimeLinerPivotView.FGetNearVisibleRow( Sender: TcxCustomGridTableView; CurrRow:Integer ):Integer;
var rUp,rDown:Integer;
begin
  rUp := CurrRow;
  rDown := CurrRow;

  while True do
  begin
    if ( rUp >= 0 )  and
       ( TcxGridBandedTableView(Sender).ViewData.Records[rUp].Visible ) then
    begin
      Result := rUp;
      Break;
    end;
    //********************
    if ( rDown < TcxGridBandedTableView(Sender).ViewData.RowCount )  and
       ( TcxGridBandedTableView(Sender).ViewData.Records[rDown].Visible ) then
    begin
      Result := rDown;
      Break;
    end;
    //********************
    rUp := rUp - 1;
    rDown := rDown + 1;

    if ( rUp < 0 ) and ( rDown >= TcxGridBandedTableView(Sender).ViewData.RowCount ) then
    begin
      Result:= FGetFirstVisibleRow( Sender );
      Break;
    end;
  end;

end;
//******************************************************************************
procedure TTimeLinerPivotView.FFindStartAndFinishMergeCell( Sender: TcxCustomGridTableView; AViewInfo: TcxGridTableDataCellViewInfo;
                              CurrObjPivotCell :TCellPivotObj;CurrRowIndex,CurrColIndex:Integer;
                              var StartRowCell,FinishRowCell,MidleRowCell:TcxGridTableDataCellViewInfo );
var r:Integer;
    aValue:Variant;
    StartRow:Integer;
    FinisRow:Integer;
    MidleRow:Integer;
//**************************************************************
function CheckSameCell( aCellPivotObj:TCellPivotObj ):Boolean;
var Str1:string;
    Str2:string;
begin
  Str1:= VarToStr(aCellPivotObj.GroupByMergeRow);
  Str2:= VarToStr(CurrObjPivotCell.GroupByMergeRow);
  if CompareText( Str1 , Str2 ) = 0 then
    result := True
  else result := False;
end;
//**************************************************************
begin
  StartRow :=0;
  StartRowCell := TcxGridBandedTableView(Sender).ViewData.Records[ FGetFirstVisibleRow(Sender)].ViewInfo.GetCellViewInfoByItem( AViewInfo.Item );

  for r:= CurrRowIndex downto FGetFirstVisibleRow(Sender) do
  begin
    aValue := TcxGridBandedTableView(Sender).ViewData.Records[r].Values[ CurrColIndex ];

    if ( TcxGridBandedTableView(Sender).ViewData.Records[r].Visible )and(aValue<>null) then
      if ( CheckSameCell( PCellPivotObj( Integer( aValue) )^ )) then
      begin
        StartRowCell := TcxGridBandedTableView(Sender).ViewData.Records[r].ViewInfo.GetCellViewInfoByItem( AViewInfo.Item );
        StartRow := r;
      end
      else Break;
  end;

  FinisRow := 0;
  FinishRowCell := TcxGridBandedTableView(Sender).ViewData.Records[ FGetLastVisibleRow(Sender)].ViewInfo.GetCellViewInfoByItem( AViewInfo.Item );

  for r:= CurrRowIndex to FGetLastVisibleRow(Sender) do
  begin
    aValue := TcxGridBandedTableView(Sender).ViewData.Records[r].Values[ CurrColIndex ];
    
    if ( TcxGridBandedTableView(Sender).ViewData.Records[r].Visible ) then
      if (aValue<>null) and ( CheckSameCell( PCellPivotObj( Integer( aValue) )^ )) then
      begin
        FinishRowCell := TcxGridBandedTableView(Sender).ViewData.Records[r].ViewInfo.GetCellViewInfoByItem( AViewInfo.Item );
        FinisRow := r;
      end
    else Break;
  end;

  MidleRow := StartRow + ( FinisRow - StartRow ) div 2;

  if ( MidleRow<= FGetLastVisibleRow(Sender) )and
     ( MidleRow>= 0 )and(TcxGridBandedTableView(Sender).ViewData.Records[MidleRow].Visible) then
    MidleRowCell := TcxGridBandedTableView(Sender).ViewData.Records[MidleRow].ViewInfo.GetCellViewInfoByItem( AViewInfo.Item )
  else
  begin
    StartRow :=FGetNearVisibleRow( Sender,StartRow );
    MidleRowCell := TcxGridBandedTableView(Sender).ViewData.Records[ StartRow ].ViewInfo.GetCellViewInfoByItem( AViewInfo.Item );
  end;

end;
//******************************************************************************
procedure TTimeLinerPivotView.FShowSelectedPivotLeftHeader( Sender: TcxCustomGridTableView; aStyleHeaderSelection : TcxStyle;
                                                            ACanvas: TcxCanvas;AViewInfo: TcxGridTableDataCellViewInfo; JustFocused:Boolean );
var ColorSelection:TColor;
    OldColorBrash:TColor;
    OldColorFont:TColor;
    ASelectRect:TRect;
begin
  OldColorBrash:= ACanvas.Brush.Color;
  OldColorFont := ACanvas.Font.Color;

  if aStyleHeaderSelection<> nil then             
    ColorSelection:= aStyleHeaderSelection.Color
  else ColorSelection := clMenu;

  if (AViewInfo<>nil) then
    if ( (JustFocused) and (AViewInfo.GridRecord.Focused)) or( not JustFocused )  then
    begin
      ASelectRect := AViewInfo.GridRecord.ViewInfo.Bounds;
      ASelectRect.Top := ASelectRect.Top + 1;
      ASelectRect.Left := ASelectRect.Left + 1;
      ASelectRect.Bottom := ASelectRect.Bottom;

      if JustFocused then ACanvas.Font.Color:= self.FGetColorFontSelection( Sender )
      else  ACanvas.Font.Color:=  aStyleHeaderSelection.TextColor;

      ACanvas.FillRect( ASelectRect , ColorSelection );
    end;
end;
//******************************************************************************
procedure TTimeLinerPivotView.ViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var CelValueIsEmpty : Boolean;
    PrevObjPivotCellP:PCellPivotObj;
    PrevPivotCell :TCellPivotObj;
    ObjPivotCellP:PCellPivotObj;
    ObjPivotCell :TCellPivotObj;
    TextList:TList;
    currBGColor:TColor;
    PrevValue : Variant;
    StartRowCell,FinishRowCell, MidleRowCell:TcxGridTableDataCellViewInfo;
    ASelectRect:TRect;
    ADrawText :TRect;
    FocusedItemIndex:Integer;
begin

  inherited;

  if ( AViewInfo.GridRecord.Values[AViewInfo.item.index] <> null ) and
     ( AViewInfo.GridRecord.Values[AViewInfo.item.index] <> '' ) then
  begin

    if ( AViewInfo.Item.Tag = 0 ) then
    begin

      ObjPivotCellP:= PCellPivotObj( Integer( AViewInfo.GridRecord.Values[AViewInfo.item.index]) );
      ObjPivotCell  := ObjPivotCellP^;

      TextList := ObjPivotCell.TextList;
      currBGColor := FBgHeaderColor;

      if ObjPivotCell.TemplateColor <> -1 then
        currBGColor := ObjPivotCell.TemplateColor;

      ACanvas.FillRect( AViewInfo.Bounds , currBGColor );
      FFindStartAndFinishMergeCell( Sender, AViewInfo, ObjPivotCell, AViewInfo.GridRecord.Index, AViewInfo.item.index, StartRowCell, FinishRowCell, MidleRowCell );

      if ( StartRowCell <> nil ) and ( FinishRowCell <> nil )  then
      begin
         AViewInfo.Borders :=  [ ];

         FocusedItemIndex := TcxGridBandedTableView(Sender).FindItemByName(TcxGridBandedTableView(Sender).Controller.FocusedColumn.Name).Index;

         if ( ObjPivotCell.ShowFocused ) and
            ( TcxGridBandedTableView(Sender).DataController.DisplayTexts[ TcxGridBandedTableView(Sender).Controller.FocusedRowIndex,FocusedItemIndex ] <> '' ) then
           FShowSelectedPivotLeftHeader( Sender, FStyleHeaderSelection, ACanvas, AViewInfo, True );

         if ( ObjPivotCell.ShowFocused ) and
            ( FCurrDragOverHitTextRowIndex <> -1) and (AViewInfo.GridRecord.Index = FCurrDragOverHitTextRowIndex )  then
           FShowSelectedPivotLeftHeader( Sender, self.FStyleHeaderDragOver, ACanvas, AViewInfo, False );

         ADrawText := AViewInfo.Bounds;

         if varToStr( ObjPivotCell.GroupByMergeRow ) <> CpecSymbMerge then
         begin

           ASelectRect.Left:= StartRowCell.Bounds.Left;
           ASelectRect.Top := StartRowCell.Bounds.Top;
           ASelectRect.Bottom := FinishRowCell.Bounds.Bottom;
           ASelectRect.Right  := StartRowCell.Bounds.Right;
           self.FShowVertMergeBorder( ACanvas , ASelectRect , FBorderLeftHeaderColor );

         end
         else self.FShowVertMergeBorder( ACanvas , ADrawText , FBorderLeftHeaderColor );

         ADrawText.Top := ADrawText.Top + 1;
         ADrawText.left := ADrawText.left + 2;

         if ( ( AViewInfo = MidleRowCell )and( varToStr( ObjPivotCell.GroupByMergeRow ) <> CpecSymbMerge ) ) or
            ( varToStr( ObjPivotCell.GroupByMergeRow ) = CpecSymbMerge ) then
           FDrawListTexT( ACanvas, ADrawText , AViewInfo.Bounds.Right - AViewInfo.Bounds.Left , TextList );
      end;

      ADone := True;
    end
  end;

  if  (FShowTimeLinerTemplateColor) and ( AViewInfo.Item.Tag > 0 ) and
      ( Self.FIsVirtualRow(AViewInfo.GridRecord.Index, currBGColor ) ) and  ( not AViewInfo.Selected ) then
  begin
    ACanvas.FillRect( AViewInfo.Bounds , currBGColor );
    ADone := True;
  end;

end;

function TTimeLinerPivotView.FFindDataForCell( Row, Col, CountColCell: Integer;  ExcceptCellObj: PCellObj=nil ): Boolean;
begin
  result := inherited FFindDataForCell( Row, Col, CountColCell, ExcceptCellObj );
end;
//******************************************************************************
procedure TTimeLinerPivotView.FDisposeMemoryPCellPivotObj( aCol,aRow:Integer; var PPivotCell:PCellPivotObj; EmptyTextList:Boolean=true );
begin
  if EmptyTextList then FDisposeMemoryTextList( PPivotCell^.TextList );   // dispose Memory for Text
  self.FView.DataController.Values[ aRow, aCol ]:=null;

  Dispose( PPivotCell );
end;
//******************************************************************************
procedure TTimeLinerPivotView.FDisposeRowPivotCellMem( Row:Integer; EmptyTextList:Boolean=true );
var PPivotCell:PCellPivotObj;
    CeilValue:Variant;
    Col :Integer;
begin

  for Col:=0 to self.FView.Bands.Items[ self.FPivotBandIndex ].ColumnCount - 1 do
  begin
    if ( self.FView.Bands.Items[ self.FPivotBandIndex ].Columns[ Col ].Tag = 0 )  then
    begin
      CeilValue:= self.FView.DataController.Values[ Row, self.FView.Bands.Items[ self.FPivotBandIndex ].Columns[ Col ].Index ];
      if ( CeilValue <> null ) and ( CeilValue <> '' ) then
      begin
        PPivotCell := PCellPivotObj( Integer (CeilValue) );
        FDisposeMemoryPCellPivotObj( self.FView.Bands.Items[ self.FPivotBandIndex ].Columns[ Col ].Index, Row,  PPivotCell, EmptyTextList );
      end;
    end;
  end;

end;
//******************************************************************************
procedure TTimeLinerPivotView.FDisposePivotCellMem;
var Row:Integer;
begin
  for Row:=0 to self.FView.DataController.RecordCount-1 do
   FDisposeRowPivotCellMem( Row );
end;
//******************************************************************************
destructor TTimeLinerPivotView.Destroy;
begin
  inherited;
  FDisposePivotCellMem;
end;
//******************************************************************************
function TTimeLinerPivotView.FCheckColumnForAllSameValue(Col:TcxGridBandedColumn):boolean;
var Row:integer;
    Str1:string;
    Str2:string;
    FirstCellPivotObjP : PCellPivotObj;
    CurrCellPivotObjP : PCellPivotObj;
begin
  result := True;
  
  for Row:=0 to self.FView.DataController.RowCount-1 do
  begin
    if Row = 0 then
      FirstCellPivotObjP := PCellPivotObj( Integer( self.FView.DataController.Values[ Row, Col.Index ] ) );

    CurrCellPivotObjP := PCellPivotObj( Integer( self.FView.DataController.Values[ Row, Col.Index ] ) );

    Str1 := VarToStr( FirstCellPivotObjP.GroupByMergeRow );
    Str2:= VarToStr( CurrCellPivotObjP.GroupByMergeRow);
    if CompareText( Str1 , Str2 ) <> 0 then
    begin
      result := False;
      break;
    end;
  end;
 { Str1:= VarToStr(aCellPivotObj.GroupByMergeRow);
  Str2:= VarToStr(CurrObjPivotCell.GroupByMergeRow);
  if CompareText( Str1 , Str2 ) = 0 then
    result := True
  else result := False; }
end;
//******************************************************************************
procedure TTimeLinerPivotView.FHideVirtualAllSameValueCols;
var i:integer;
    Col:TcxGridBandedColumn;
begin
  for i:=0 to Length( self.FPivotLeftHeader.Fields )-1 do
  begin
    Col := FFindPivotColByCaption( FPivotLeftHeader.Fields[i].Caption, self.FPivotBandIndex );
    if ( Col <> nil) and (not FPivotLeftHeader.Fields[i].VisibleWhenAllSame) then
      if FCheckColumnForAllSameValue( Col ) then Col.Visible := False;
  end;
end;
//******************************************************************************
function TTimeLinerPivotView.FIsVirtualRow( Row:Integer; var TemplateColor:TColor  ):Boolean;
var i:Integer;
    CellPivotObjP : PCellPivotObj;
    Col:TcxGridBandedColumn;
begin
  result := False;
  if  self.FView.DataController.RecordCount <= Row then Exit;

  for i:=0 to Length( self.FPivotLeftHeader.Fields )-1 do
  begin
    Col := FFindPivotColByCaption( FPivotLeftHeader.Fields[i].Caption, self.FPivotBandIndex );
    if Col <> nil then
    begin
      CellPivotObjP := PCellPivotObj( Integer( self.FView.DataController.Values[ Row, Col.Index ] ) );
      if ( CellPivotObjP^.TemplateColor<> -1 ) and ( CellPivotObjP^.id = null  ) then
      begin
        TemplateColor := CellPivotObjP^.TemplateColor;
        Result := True;
        Break;
      end;
    end;
  end;
end;
//******************************************************************************
procedure TTimeLinerPivotView.FExangeNewValueFromLeftHeader( Row:Integer;  aCellObj : PCellObj );
var i:integer;
    CellPivotObjP : PCellPivotObj;
    Col:TcxGridBandedColumn;
//***********************************************************
function ReplaseValue( aCellPivotObj:TCellPivotObj ):Boolean;
var i:Integer;
begin
  for i:=0 to Length( aCellObj^.FiedlAddId )-1 do
    if CompareText( aCellObj^.FiedlAddId[i].FieldName, aCellPivotObj.FieldName ) = 0 then
    begin
      aCellObj^.FiedlAddId[i].Value := aCellPivotObj.id;
      Break;
    end;
end;
//***********************************************************
begin
  try
  
    self.FView.BeginUpdate;
    for i:=0 to Length( self.FPivotLeftHeader.Fields )-1 do
    begin
      Col := FFindPivotColByCaption( FPivotLeftHeader.Fields[i].Caption, self.FPivotBandIndex );
      if Col <> nil then
      begin
        CellPivotObjP := PCellPivotObj( Integer( self.FView.DataController.Values[ Row, Col.Index ] ) );
        ReplaseValue( CellPivotObjP^ ); // замінити дані з лівої таблиці в дані ячейки яку переміщаєм
      end;
    end;

  finally
    self.FView.EndUpdate;
  end;

end;
//******************************************************************************
function TTimeLinerPivotView.InsertObjCell( Sender: TObject;  X, Y: Integer; DB:TDataSet ):boolean;
var aText: TList;
    CellObj : PCellObj;
    PDBData : PDataDB;
    aCurrHitTestCol : TcxCustomGridTableItem;
    aCurrHitTextRow : TcxCustomGridRecord;
    TemplateColor : TColor;
    Row, Col:Integer;
begin
  result := False;

  FGetHitText( Sender, X, Y, aCurrHitTestCol , aCurrHitTextRow );
  if ( aCurrHitTestCol <> nil ) and ( aCurrHitTextRow <> nil ) then
  begin

    Row := aCurrHitTextRow.Index;
    Col := aCurrHitTestCol.Index;

    PDBData := FGetDataCurrFromDB( DB, True );
    CellObj := FCreateObjCell( PDBData^.id, PDBData^.Text, PDBData^.BgroundColor, PDBData^.CountCol,
                               Col, PDBData^.Hint, PDBData^.AddFieldValue );
    CellObj.StartColIndex := Col;

    if FIsVirtualRow( Row, TemplateColor ) then FAddRowsFromVirtual( Row );

    FExangeNewValueFromLeftHeader( Row, CellObj );
    FSetObjCellToGrid( Row , CellObj, True );
    result := True;
    self.Repaint;

  end;
end;
//******************************************************************************
procedure TTimeLinerPivotView.FFindVirtualRows( Row:Integer;var StartRow:Integer;var ToRows:Integer );
var FindStart,FindTo:Integer;
    TemplateColor : TColor;
begin
  if FIsVirtualRow( Row, TemplateColor ) then
  begin
    StartRow :=Row;
    ToRows   :=Row;
  end
  else
  begin
    StartRow :=-1;
    ToRows   :=-1;
  end;
  //*****************************************************************
  FindStart := StartRow;
  FindTo := ToRows;

  While (FindStart<>-1)or(FindTo<>-1) do
  begin

    if  ( FindStart <>-1 ) and ( FIsVirtualRow( StartRow -1, TemplateColor ) ) then
    begin
      Dec(StartRow);
      FindStart := StartRow;
    end
    else FindStart:=-1;

    if  ( FindTo <>-1 ) and ( FIsVirtualRow( ToRows +1, TemplateColor ) ) then
    begin
      Inc(ToRows);
      FindTo :=ToRows;
    end
    else FindTo:=-1;

  end;
end;
//******************************************************************************
procedure TTimeLinerPivotView.FMakeRealRowFromVirtual( Row, RowVirt:Integer; GroupByMergeRow:Variant );
var I:Integer; Col:Integer;
    PPivotCell : PCellPivotObj;
    PNewPivotCell : PCellPivotObj;
    CeilValue :Variant;
    aText:TList;
    CurrGroupMergeRow:Variant;

begin
  Row := self.AddRow(Row);
  RowVirt := RowVirt + 1;

  for i:= 0 to self.FView.Bands.Items[ self.FPivotBandIndex ].ColumnCount - 1 do
  begin
    Col :=self.FView.Bands.Items[ self.FPivotBandIndex ].Columns[ i ].Index;
    if ( self.FView.Bands.Items[ self.FPivotBandIndex ].Columns[ i ].Tag = 0 )  then
    begin

      CeilValue:= self.FView.DataController.Values[ RowVirt, Col ];

      if ( CeilValue <> null ) and ( CeilValue <> '' ) then
      begin
        PPivotCell := PCellPivotObj( Integer (CeilValue) );
        aText := FgetShowPivotText( PFieldText(PPivotCell^.TextList[0])^.FieldName, PFieldText(PPivotCell^.TextList[0])^.Text );

        if PPivotCell^.TemplateColor <> -1 then // для шаблону підмінити Індекс Групування
          CurrGroupMergeRow := GroupByMergeRow
        else CurrGroupMergeRow := PPivotCell^.GroupByMergeRow;

        PNewPivotCell := FCreateObjPivotCell( PPivotCell^.FieldName, PPivotCell^.id, aText, PPivotCell^.BGColor,
                                              '',  -1, CurrGroupMergeRow, PPivotCell^.ShowFocused );   //PPivotCell^.GroupByMergeRow

        self.FView.DataController.Values[ Row, Col] :=  Integer( PNewPivotCell );
      end;

    end;
  end;
end;
//******************************************************************************
procedure TTimeLinerPivotView.FAddRowsFromVirtual(Row:Integer);
var i:Integer;
    StartRow : Integer;
    ToRows : Integer;
    GroupByMergeRow:Integer;
begin
  FFindVirtualRows( Row, StartRow, ToRows );
  Randomize;
  GroupByMergeRow := Random(1000);

  for i:= ToRows downto StartRow do
    FMakeRealRowFromVirtual( StartRow , ToRows , GroupByMergeRow);
end;
//******************************************************************************
function TTimeLinerPivotView.FReplaceObjTo(Row, Col: Integer; CellObj: PCellObj; FromRow:Integer ): Boolean;
var i:Integer;
    CeilValue:Variant;
    TemplateColor : TColor;
begin
  result := False;
  
  try

    self.FView.BeginUpdate;
    CeilValue:= self.FView.DataController.Values[ FromRow, CellObj^.StartColIndex ];

    for i:= CellObj^.StartColIndex to CellObj^.FinishColIndex do
      self.FView.DataController.Values[ FromRow, i ]:= null;

    if FIsVirtualRow( Row, TemplateColor ) then FAddRowsFromVirtual( Row );

    PCellObj( Integer(CeilValue) )^.StartColIndex := Col;
    PCellObj( Integer(CeilValue) )^.FinishColIndex := Col+CellObj^.CountDay-1;

    for i:= Col to Col+CellObj^.CountDay-1 do
      self.FView.DataController.Values[ Row, i ]:= CeilValue;

    result := True;
    self.FSetFocuceCell( CellObj, Row );

  finally
    self.FView.EndUpdate;
  end;
end;
//******************************************************************************
procedure TTimeLinerPivotView.ViewGridTimeLinerDragDrop(Sender, Source: TObject; X, Y: Integer);
var aCurrHitTestCol : TcxCustomGridTableItem;
    aCurrHitTextRow : TcxCustomGridRecord;
    CurrRow:Integer;
    CurrCol:Integer;
    ResultValue : Variant;
    ResultObj:PCellObj;
begin
  FGetHitText( Sender, X, Y, aCurrHitTestCol , aCurrHitTextRow );

  if ( aCurrHitTestCol <> nil )and ( aCurrHitTextRow <> nil )and ( aCurrHitTestCol.Tag > 0 ) then
  begin

    CurrRow := aCurrHitTextRow.Index;
    CurrCol := aCurrHitTestCol.Index;
    
    if self.FSelfStartDragPObjCell <> nil then  // if move from self Grid
    begin

      FReplaceObjTo( CurrRow, CurrCol, self.FSelfStartDragPObjCell, self.FView.Controller.FocusedRowIndex );
      FExangeNewValueFromLeftHeader( CurrRow, self.FSelfStartDragPObjCell );
      FSetObjCellToGrid( CurrRow , self.FSelfStartDragPObjCell, True );

      if @FDragAndDropFunct<> nil then
      begin

        ResultValue :=self.FView.DataController.Values[ CurrRow, CurrCol ];
        if ResultValue <> null then
        begin
          ResultObj := PCellObj( Integer( ResultValue ) );
          FDragAndDropFunct( CurrCol , CurrRow,  ResultObj );
        end;

      end;
    end
    else
    if @FPersonalDragDrop <> nil then FPersonalDragDrop( Sender, Source, X, Y );

  end;

  self.FSelfStartDragPObjCell  := nil;
  FCurrDragOverHitTextRowIndex := -1;
  self.ShowFocusHeader;
  self.Repaint;
end;
//******************************************************************************


end.




