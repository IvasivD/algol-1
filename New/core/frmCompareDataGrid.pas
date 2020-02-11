unit frmCompareDataGrid;

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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxStyles, cxEdit,
  cxTimeEdit, cxTL, cxGridTableView, cxGridBandedTableView, cxGridCardView,
  cxClasses, ExtCtrls, cxVGrid, cxInplaceContainer, StdCtrls, cxTextEdit,
  Buttons, ImgList, cxContainer, cxLabel, cxButtonEdit;

type
  TFrmCompareData = class(TForm)
    PanelLeft: TPanel;
    VGridLeft: TcxVerticalGrid;
    VGridLeftEditorRow1: TcxEditorRow;
    VGridLeftEditorRow2: TcxEditorRow;
    VGridLeftEditorRow3: TcxEditorRow;
    PanelRight: TPanel;
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
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    VGridRight: TcxVerticalGrid;
    cxEditorRow1: TcxEditorRow;
    cxEditorRow2: TcxEditorRow;
    cxEditorRow3: TcxEditorRow;
    PanelBottomRight: TPanel;
    PanelBottomLeft: TPanel;
    ButAcceptRight: TSpeedButton;
    ButAcceptLeft: TSpeedButton;
    panelCaptionFrom: TPanel;
    panelCaptionTo: TPanel;
    CloseBtn: TBitBtn;
    VGridLeftEditorRow4: TcxEditorRow;
    VGridLeftEditorRow5: TcxEditorRow;
    VGridLeftEditorRow6: TcxEditorRow;
    VGridLeftEditorRow7: TcxEditorRow;
    VGridLeftEditorRow8: TcxEditorRow;
    VGridLeftEditorRow9: TcxEditorRow;
    VGridLeftEditorRow10: TcxEditorRow;
    VGridLeftEditorRow11: TcxEditorRow;
    VGridLeftEditorRow12: TcxEditorRow;
    ButRefreshLeft: TSpeedButton;
    ButRefreshRight: TSpeedButton;
    ButNewLeft: TSpeedButton;
    ButNewRight: TSpeedButton;
    cxStyle216: TcxStyle;
    cxStyle217: TcxStyle;
    TextDescriptHelp: TStaticText;
    procedure FormResize(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure VGridLeftDrawRowHeader(Sender: TObject; ACanvas: TcxCanvas;
      APainter: TcxvgPainter; AHeaderViewInfo: TcxCustomRowHeaderInfo;
      var Done: Boolean);
    procedure VGridRightTopRowIndexChanged(Sender: TObject);
    procedure VGridLeftKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VGridLeftMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FStyleSplitAndSelect:TcxStyle;
    { Private declarations }
  public
  published
  property StyleSplitAndSelect:TcxStyle read FStyleSplitAndSelect write FStyleSplitAndSelect;
    { Public declarations }
  end;

var
  FrmCompareData: TFrmCompareData;

implementation

{$R *.dfm}

procedure TFrmCompareData.FormResize(Sender: TObject);
begin
  if VGridRight.Parent.Visible then PanelLeft.Width := (self.Width div 2) - 17
  else PanelLeft.Width := self.Width - 16;
end;

procedure TFrmCompareData.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCompareData.VGridLeftDrawRowHeader(Sender: TObject;
  ACanvas: TcxCanvas; APainter: TcxvgPainter;
  AHeaderViewInfo: TcxCustomRowHeaderInfo; var Done: Boolean);
var CaptRect:TRect;
begin
  CaptRect := AHeaderViewInfo.CaptionsInfo[0].CaptionRect;
  CaptRect.Left:= 0;

  ACanvas.FillRect( CaptRect, clBtnFace);

  if (not AHeaderViewInfo.Focused) then
  begin
    ACanvas.FillRect( CaptRect, clBtnFace);
    ACanvas.Font       := TcxVerticalGrid(Sender).Styles.Header.Font;
    ACanvas.Font.Color := TcxVerticalGrid(Sender).Styles.Header.TextColor;

    if ( AHeaderViewInfo.Row.Tag = -10 ) and ( FStyleSplitAndSelect <> nil ) then
    begin
      ACanvas.FillRect( CaptRect, FStyleSplitAndSelect.Color );
      ACanvas.Font := FStyleSplitAndSelect.Font;
    end;
  end
  else
   begin
     if (AHeaderViewInfo.Focused)and(TcxVerticalGrid(Sender).IsFocused) then
     begin
       ACanvas.Font       := TcxVerticalGrid(Sender).Styles.Selection.Font;
       ACanvas.Font.Color := TcxVerticalGrid(Sender).Styles.Selection.TextColor;
       ACanvas.FillRect( CaptRect, TcxVerticalGrid(Sender).Styles.Selection.Color );
     end
      else
      begin
        ACanvas.Font       := TcxVerticalGrid(Sender).Styles.Inactive.Font;
        ACanvas.Font.Color := TcxVerticalGrid(Sender).Styles.Inactive.TextColor;
        ACanvas.FillRect( CaptRect, TcxVerticalGrid(Sender).Styles.Inactive.Color );
      end;
   end;

  if AHeaderViewInfo.Row.Tag = -10 then
    ACanvas.Font.Style := [fsBold];

  CaptRect.Left:=5;
  ACanvas.DrawTexT( AHeaderViewInfo.CaptionsInfo[0].Caption , CaptRect, taLeftJustify , vaCenter ,False,false );

  Done:=true;
end;

procedure TFrmCompareData.VGridRightTopRowIndexChanged(Sender: TObject);
begin
  if VGridLeft.Parent.Visible then  VGridLeft.TopVisibleRowIndex:= TcxVerticalGrid(Sender).TopVisibleRowIndex;
  if VGridRight.Parent.Visible then VGridRight.TopVisibleRowIndex:= TcxVerticalGrid(Sender).TopVisibleRowIndex;
end;

procedure TFrmCompareData.VGridLeftKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  VGridRightTopRowIndexChanged( Sender );
end;

procedure TFrmCompareData.VGridLeftMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if VGridRight.Parent.Visible then VGridRight.SetFocus;
end;

procedure TFrmCompareData.FormActivate(Sender: TObject);
begin
  if VGridLeft.Parent.Visible then VGridLeft.SetFocus;
  if VGridRight.Parent.Visible then VGridRight.SetFocus;
end;


procedure TFrmCompareData.FormCreate(Sender: TObject);
begin
  FStyleSplitAndSelect:=nil;
  //TcxButtonEditProperties(cxEditorRow3.Properties.EditProperties).Buttons.Items[0].ImageIndex
end;

end.

