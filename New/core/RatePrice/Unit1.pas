unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxClasses, cxCustomData, cxStyles, cxEdit, cxCustomPivotGrid,
  cxPivotGrid, dxLayoutContainer, dxLayoutControl, cxButtonEdit, cxFilter,
  cxData, cxDataStorage, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxGridLevel, cxGridCustomView, cxGridDBTableView,
  ExtCtrls, cxGridBandedTableView, cxTL, cxGridCardView, UnitFrameAge,
  IBCustomDataSet, IBQuery, IBDatabase,UnitPeriodAgeRange,
  cxPCdxBarPopupMenu, cxPC, StdCtrls,Core;

type
  TForm1 = class(TForm)
    cxGridViewRepository1: TcxGridViewRepository;
    ViewHeader: TcxGridTableView;
    ViewHeaderColumn1: TcxGridColumn;
    ViewHeaderColumn2: TcxGridColumn;
    ViewHeaderColumn3: TcxGridColumn;
    ViewHeaderColumn4: TcxGridColumn;
    ViewHeaderColumn5: TcxGridColumn;
    ViewHeaderColumn6: TcxGridColumn;
    ViewHederColumn: TcxGridTableView;
    ViewHederColumnAge1: TcxGridColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    Panel3: TPanel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    ViewData: TcxGridTableView;
    ViewDataColumn1: TcxGridColumn;
    ViewDataColumn2: TcxGridColumn;
    ViewDataColumn3: TcxGridColumn;
    ViewDataColumn4: TcxGridColumn;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    ViewDataColumnH: TcxGridColumn;
    ViewHeaderColumn7: TcxGridColumn;
    RATE_LINE_SERV_DETAILSrc: TDataSource;
    RATE_LINE_SERV_DETAIL: TIBQuery;
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    Currency: TIBQuery;
    CurrencySrc: TDataSource;
    CurrencyCURRENCYID: TIntegerField;
    CurrencyCURRENCYSHORT: TIBStringField;
    Vat: TIBQuery;
    VatSrc: TDataSource;
    VatVATID: TIntegerField;
    VatVATNAME: TIBStringField;
    VatVATVALUE: TFloatField;
    VatVATVALSTR: TIBStringField;
    Button1: TButton;
    RATE_LINE_SERV: TIBQuery;
    RATE_LINE_SERVSrc: TDataSource;
    ViewValuta: TcxGridDBTableView;
    ViewValutaCURRENCYID: TcxGridDBColumn;
    ViewValutaCURRENCYSHORT: TcxGridDBColumn;
    FrameRangeAgePrice: TFrameRangeAgePrice;
    RATE_LINE_SERV_DETAILID: TIntegerField;
    RATE_LINE_SERV_DETAILID_RATE_LINE_SERV: TIntegerField;
    RATE_LINE_SERV_DETAILID_RATE_LINE_CATEGORY: TIntegerField;
    RATE_LINE_SERV_DETAILPERIOD_CAPTON: TIBStringField;
    RATE_LINE_SERV_DETAILPERIOD_FROM: TIntegerField;
    RATE_LINE_SERV_DETAILPERIOD_TO: TIntegerField;
    RATE_LINE_SERV_DETAILPERIOD_ORDER: TIntegerField;
    RATE_LINE_SERV_DETAILAGE_CAPTION: TIBStringField;
    RATE_LINE_SERV_DETAILAGE_FROM: TIntegerField;
    RATE_LINE_SERV_DETAILAGE_TO: TIntegerField;
    RATE_LINE_SERV_DETAILAGE_ORDER: TIntegerField;
    RATE_LINE_SERV_DETAILNETVAL: TFloatField;
    RATE_LINE_SERV_DETAILRATE: TFloatField;
    RATE_LINE_SERV_DETAILAGENTPAY: TFloatField;
    RATE_LINE_SERVID: TIntegerField;
    RATE_LINE_SERVID_RATE_LINE_DATE: TIntegerField;
    RATE_LINE_SERVID_SERVICE: TIntegerField;
    RATE_LINE_SERVTYPE_SERVICE: TIntegerField;
    RATE_LINE_SERVID_CURRENCY: TIntegerField;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGridViewRepository2: TcxGridViewRepository;
    ViewRateLineServ: TcxGridDBTableView;
    ViewRateLineServID: TcxGridDBColumn;
    ViewRateLineServID_RATE_LINE_DATE: TcxGridDBColumn;
    ViewRateLineServID_SERVICE: TcxGridDBColumn;
    ViewRateLineServTYPE_SERVICE: TcxGridDBColumn;
    ViewRateLineServID_CURRENCY: TcxGridDBColumn;
    Button2: TButton;
    RATE_LINE_SERV_DETAILPERIOD_OPTION: TIntegerField;
    RATE_LINE_SERV_DETAILAGE_OPTION: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure ViewHeaderColumnHeaderClick(Sender: TcxGridTableView;
      AColumn: TcxGridColumn);
    procedure ViewHeaderCustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure ViewDataCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RATE_LINE_SERVAfterScroll(DataSet: TDataSet);
  private
     PriceTabPivot : TPriceTabPivot;
     procedure InitFrameRatePrice;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ElemRATE_LINE_SERV: TDBShemaView;
  ElemRATE_LINE_SERV_DETAIL: TDBShemaView;
implementation

uses Types;

{$R *.dfm}

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

procedure ViewDrawFillRect(Sender: TcxCustomGridTableView; AViewInfo: TcxGridColumnHeaderViewInfo; ACanvas: TcxCanvas );
var FocusedStyle:TcxStyle;
begin

 if ( AViewInfo.Column.Focused )and( AViewInfo.Column.Selected ) then
  begin
     FocusedStyle:= GetSelectionColor( Sender );
     ACanvas.Font.Color := FocusedStyle.TextColor;
     ACanvas.FillRect( AViewInfo.Bounds , FocusedStyle.Color );
  end
  else
    ACanvas.FillRect( AViewInfo.Bounds , ACanvas.Brush.Color );
end;
//******************************************************************************

procedure FDrawHeaderForAll(StyleHeader:TcxStyle; ACanvas: TcxCanvas;
                                              AlignmentHorz: TAlignment;
                                              AlignmentVertical: TcxAlignmentVert;
                                              HeaderGlyph:TBitMap;ColumnText:string; Bounds,BoudsText:TRect;
                                              SortOrder:TcxDataSortOrder );
var ASortMarkBounds: TRect;
    ASortMarkBoundsPlace: TRect;
    HeaderColor:TColor;
    TextColor:TColor;
    HeaderFont:TFont;
begin

  if StyleHeader <> nil then
  begin

    HeaderColor := ACanvas.Brush.Color;//StyleHeader.Color;
    TextColor := ACanvas.Font.Color; //StyleHeader.TextColor;
    HeaderFont := StyleHeader.Font;
  end
   else
   begin
     HeaderColor:=  ACanvas.Brush.Color;//clMenu;
     TextColor:=ACanvas.Font.Color; //clBlack;
     HeaderFont:=nil;
   end;

  ACanvas.Canvas.Brush.Color := HeaderColor;
  if HeaderFont<>nil then ACanvas.Canvas.Font := HeaderFont;
  ACanvas.Canvas.Font.Color  := TextColor;

  //if HeaderGlyph <> nil then
  //  ACanvas.DrawGlyph( Bounds.Left + (( Bounds.Right - Bounds.Left) div 2) -  (HeaderGlyph.Width div 2), Bounds.top , HeaderGlyph , true, HeaderColor);

  ACanvas.FillRect(Bounds, HeaderColor);
  ACanvas.DrawTexT( ColumnText, BoudsText, AlignmentHorz , AlignmentVertical ,False,false );

  // ACanvas.DrawComplexFrame(Bounds, clWhite, $00A0A0A0, [bRight, bBottom], 2);
  //ACanvas.DrawComplexFrame(Bounds, clWhite, clBlack, [bLeft, bTop, bRight, bBottom], 1);
  
 {if ( @EventSortMark <> nil ) and (SortOrder <> soNone) then
  begin
    ASortMarkBounds.Top := Bounds.Top + 2;
    ASortMarkBounds.Bottom := Bounds.Bottom - 5;
    ASortMarkBounds.Left := Bounds.Right - 16;
    ASortMarkBounds.Right := Bounds.Right - 6;

    ASortMarkBoundsPlace:=ASortMarkBounds;
    ASortMarkBoundsPlace.Bottom:= Bounds.Bottom - 2;
    ASortMarkBoundsPlace.Left:=Bounds.Right-18;
    ASortMarkBoundsPlace.Right:= Bounds.Right-2;

    ACanvas.FillRect(ASortMarkBoundsPlace , HeaderColor );
    EventSortMark( ACanvas, ASortMarkBounds, SortOrder = soAscending );
  end; }
end;
//******************************************************************************
procedure FDrawHeader3DView( StyleHeader:TcxStyle; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridViewCellViewInfo);
var ASortMarkBounds: TRect;
    ASortMarkBoundsPlace: TRect;
    HitTest: TcxCustomGridHitTest;
    itemCol:TcxCustomGridTableItem;
    Column:TcxGridColumn;
    AlignmentHorz: TAlignment;
    AlignmentVertical: TcxAlignmentVert;
    HeaderGlyph:TBitMap;
begin

  if AViewInfo is TcxGridColumnHeaderViewInfo then
  begin
    AlignmentHorz:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderAlignmentHorz;
    AlignmentVertical:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderAlignmentVert;

    if TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderGlyph.Handle <> 0 then
      HeaderGlyph:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderGlyph
    else HeaderGlyph:=nil;

    FDrawHeaderForAll( StyleHeader, ACanvas, AlignmentHorz, AlignmentVertical, HeaderGlyph, AViewInfo.Text, AViewInfo.Bounds, AViewInfo.TextBounds,
                      TcxGridColumnHeaderViewInfo(AViewInfo).Column.SortOrder  )
  end

  { Else

    if AViewInfo is TcxGridBandHeaderViewInfo then
    begin
      AlignmentHorz:=TcxGridBandHeaderViewInfo(AViewInfo).Band.HeaderAlignmentHorz;
      AlignmentVertical:= TcxGridBandHeaderViewInfo(AViewInfo).Band.HeaderAlignmentVert;

      HeaderGlyph:= nil;

      FDrawHeaderForAll( StyleHeader, ACanvas, AlignmentHorz, AlignmentVertical, HeaderGlyph, AViewInfo.Text, AViewInfo.Bounds,AViewInfo.TextBounds, soNone, nil);
    end;}
end;
//******************************************************************************
function FGetStyleHeaderView(Sender: TcxCustomGridTableView):TcxStyle;
begin
  if TcxGridTableView(Sender).Styles.Header<>nil then
      result := TcxGridTableView(Sender).Styles.Header
    else
      result := nil;
end;
//******************************************************************************
procedure TForm1.InitFrameRatePrice;
var FieldTabNames:TFieldTabNames;
    DefValue:TDefTabValue;
begin

   FieldTabNames.FieldMainTableId :='ID';
   FieldTabNames.FieldMainCurrencyID :='ID_CURRENCY';
   FieldTabNames.FieldMainServiceId :='ID_SERVICE';
   FieldTabNames.FieldMainServiceType :='TYPE_SERVICE';

   FieldTabNames.FieldId := 'ID';
   FieldTabNames.FieldPeriodCaption := 'PERIOD_CAPTON';
   FieldTabNames.FieldFromPeriod := 'PERIOD_FROM';
   FieldTabNames.FieldToPeriod := 'PERIOD_TO';
   FieldTabNames.FieldPeriodOrder:='PERIOD_ORDER';
   FieldTabNames.FieldPeriodOptions:='PERIOD_OPTIONS';

   FieldTabNames.FieldAgeCaption:='AGE_CAPTION';
   FieldTabNames.FieldFromAge:='AGE_FROM';
   FieldTabNames.FieldToAge:='AGE_TO';
   FieldTabNames.FieldAgeOrder:='AGE_ORDER';
   FieldTabNames.FieldAgeOptions:='AGE_OPTIONS';

   FieldTabNames.FieldData.FieldNameCostNetto:='NETVAL';
   FieldTabNames.FieldData.FieldNameCostBrutto:='RATE';
   FieldTabNames.FieldData.FieldNameDiscount:='AGENTPAY';

   PriceTabPivot:= TPriceTabPivot.Create( FrameRangeAgePrice, RATE_LINE_SERV, RATE_LINE_SERV_DETAIL, FieldTabNames );

   PriceTabPivot.AddPropertyRateCmb(ViewValuta, 'CURRENCYID', 'CURRENCYSHORT', '', [75,37], true );

   DefValue.ValId := 75;
   PriceTabPivot.SetDefDataValueForEmptyData( DefValue );
   
   PriceTabPivot.SetReadOnly( false );
   PriceTabPivot.PrepareFrame;
end;
//******************************************************************************
procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
    A:TList;
begin
  IBDatabase.Connected:=true;

  ElemRATE_LINE_SERV := TDBShemaView.Create( RATE_LINE_SERV, nil, 'RATE_LINE_SERV', 'ID','gen_rate_line_serv_id' );
  ElemRATE_LINE_SERV_DETAIL:= TDBShemaView.Create( RATE_LINE_SERV_DETAIL, nil, 'RATE_LINE_SERV_DETAIL', 'ID','gen_rate_line_serv_detail_id' );
  ElemRATE_LINE_SERV_DETAIL.AddMainElem( ElemRATE_LINE_SERV, 'ID_RATE_LINE_SERV' );
  ElemRATE_LINE_SERV_DETAIL.AskBeforeDelete :=false;

  Currency.Open;
  Vat.Open;

  ElemRATE_LINE_SERV.DBOpen;
  ElemRATE_LINE_SERV_DETAIL.DBOpen;

  InitFrameRatePrice;
end;

procedure TForm1.ViewHeaderColumnHeaderClick(Sender: TcxGridTableView;
  AColumn: TcxGridColumn);
begin
  AColumn.Focused := true;
  AColumn.Visible := false;
  AColumn.Visible := true;
  AColumn.Focused := true;
end;

Function CalculatePosText( Canvas:TCanvas; Text:String;Rect:TRect;aLignHor:TAlignment; aLignVert:TcxAlignmentVert ):TPoint;
begin
  if aLignHor = taLeftJustify then  result.X:= Rect.Left ;
  if aLignHor = taCenter then result.X:= Rect.Left + ((Rect.Right - Rect.Left) div 2) - Canvas.TextWidth( Text ) div 2;
  if aLignHor = taRightJustify then  result.X:= Rect.Right - Canvas.TextWidth( Text )  ;

  if aLignVert= vaCenter then result.Y:= Rect.Top + ((Rect.Bottom - Rect.Top) div 2) - Canvas.TextHeight( Text ) div 2;
  if aLignVert= vaTop then result.Y:= Rect.Top;
  if aLignVert= vaBottom then result.Y:= Rect.Bottom - Canvas.TextHeight( Text );
end;

procedure TForm1.ViewHeaderCustomDrawColumnHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var aFlag:integer;
    BoundsRect:TRect;
    TextRect:TPoint;
    HeaderColor:TColor;
    HeaderFontColor:TColor;
    AlignmentHorz: TAlignment;
    AlignmentVertical: TcxAlignmentVert;
begin

 //ViewDrawFillRect(Sender,  AViewInfo, ACanvas );
   AViewInfo.DrawPressed := false;
  { BoundsRect:=AViewInfo.Bounds;
   BoundsRect.Top:=BoundsRect.Top+1;
   BoundsRect.Left:=BoundsRect.Left+1;
   BoundsRect.Right:=BoundsRect.Right-1;
   BoundsRect.Bottom:=BoundsRect.Bottom-1;  }


  //ACanvas.Brush.Color:=clMenu;


  if ( AViewInfo.Column.Focused ){and( AViewInfo.Column.Selected )} then
  begin
    //ACanvas.FillRect( AViewInfo.Bounds , clRed);
    HeaderColor:= clHighlight;
    HeaderFontColor:= clWhite;
  end
   else
   begin
     HeaderColor:= clMenu;
     HeaderFontColor:= clBlack;
   end;
     //  ACanvas.FillRect( AViewInfo.Bounds ,  clYellow );

  ACanvas.Canvas.Brush.Color := HeaderColor;
  //if HeaderFont<>nil then ACanvas.Canvas.Font := HeaderFont;


  //if HeaderGlyph <> nil then
  //  ACanvas.DrawGlyph( Bounds.Left + (( Bounds.Right - Bounds.Left) div 2) -  (HeaderGlyph.Width div 2), Bounds.top , HeaderGlyph , true, HeaderColor);

  AlignmentHorz:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderAlignmentHorz;
  AlignmentVertical:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderAlignmentVert;

  ACanvas.FillRect( AViewInfo.Bounds, HeaderColor);

  ACanvas.Font.Color  := HeaderFontColor;

  TextRect:=CalculatePosText(ACanvas.Canvas, AViewInfo.Text, AViewInfo.Bounds, taCenter , vaBottom);
  ACanvas.Canvas.TextOut( TextRect.X,TextRect.Y, AViewInfo.Text );
  
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, clWhite, $00A0A0A0, [bRight, bBottom], 2);
  ACanvas.DrawComplexFrame(AViewInfo.Bounds, clWhite, clBlack, [bLeft, bTop, bRight, bBottom], 1);

  ADone := true;
end;

procedure TForm1.ViewDataCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
 if  AViewInfo.Item = ViewDataColumnH then  ACanvas.Brush.Color:= clMenu;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  PriceTabPivot.Close;

  ElemRATE_LINE_SERV.Close;
  ElemRATE_LINE_SERV_DETAIL.Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 PriceTabPivot.DBSaveData(true,48,0);
end;

procedure TForm1.RATE_LINE_SERVAfterScroll(DataSet: TDataSet);
begin
 if PriceTabPivot <> nil  then
 PriceTabPivot.RefreshDataFromDB;
end;

end.
