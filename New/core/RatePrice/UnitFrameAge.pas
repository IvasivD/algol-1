unit UnitFrameAge;

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
  cxPCdxBarPopupMenu, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit,
  cxImageComboBox, cxTextEdit, StdCtrls, cxRadioGroup, AzEdit, AzComboBox,
  ExtCtrls, cxPC, Buttons, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox,HeaderConfig_Form,RateTypes, cxDBExtLookupComboBox,cxGridDBTableView,cxFilter,
  cxCheckBox;

type
  VATValuePrc = record
    id :Integer;
    Value:Double;
  end;
  TVATValuePrcTable = array of VATValuePrc;

  TComboProperty = record
    KeyFieldName:String;
    ListFieldName:String;
    View:TcxGridDBTableView;
    FieldValue:String;
    CanChange:Boolean;
    idFilter:array of Variant;
  end;

  TFrameRangeAgePrice = class(TFrame)
    PanelMain: TPanel;
    PanelAge: TPanel;
    Panel5: TPanel;
    PanelTab: TPanel;
    PanelPrice: TPanel;
    NetCostLabel: TLabel;
    RateLabel: TLabel;
    AgentPercLabel: TLabel;
    AgentPayLabel: TLabel;
    TotalLb: TLabel;
    ForPay0Label: TLabel;
    Label1: TLabel;
    RateGroupBox: TGroupBox;
    Bevel1: TBevel;
    Bevel6: TBevel;
    PanelPriceDiscount: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    NetCostVatEdit: TcxCurrencyEdit;
    BrutCostVatEdit: TcxCurrencyEdit;
    Panel7: TPanel;
    Bevel7: TBevel;
    TotalLabel: TcxCurrencyEdit;
    ForPayLb: TcxCurrencyEdit;
    AgentPercEdit: TcxCurrencyEdit;
    AgentPayValEdit: TcxCurrencyEdit;
    TabControlAge: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    TabControlPeriod: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    RateComboBox: TcxExtLookupComboBox;
    butEditPeriod: TSpeedButton;
    butEditAge: TSpeedButton;
    CheckAllVal: TcxCheckBox;
    Label2: TLabel;
    PanelPriceDiscountSelect: TPanel;
    AgentPercRadioButton: TcxRadioButton;
    AgentAbsRadioButton: TcxRadioButton;
    procedure AgentPayCheckBoxClick(Sender: TObject);
    procedure BrutCostVatEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VatRateIdcComboBoxPropertiesEditValueChanged(
      Sender: TObject);
    procedure butEditPeriodClick(Sender: TObject);
    procedure CheckAllValClick(Sender: TObject);
    procedure RateComboBoxPropertiesChange(Sender: TObject);
  private
     FVATValuePrcTable : TVATValuePrcTable;
     FPropertyComboVal : TComboProperty;
     procedure Calc;
     function FValueEdit(Edit:TcxCurrencyEdit):Double;
     function FFindVatValueById( id:Integer):Double;
     function FGetValueVatPrc( Combo:TcxLookUpCombobox ):Double;
    procedure SetVATValuePrcTable(const Value: TVATValuePrcTable);
    procedure SetPropertyComboVal(const Value: TComboProperty);
    procedure FSetFilterCombo(Filter:Boolean);
    { Private declarations }
  public
    procedure RefreshControl;

    property VATValuePrcTable: TVATValuePrcTable read FVATValuePrcTable write SetVATValuePrcTable;
    property PropertyComboVal: TComboProperty read FPropertyComboVal write SetPropertyComboVal;
    { Public declarations }
  end;

implementation
uses Core,unitProc;
{$R *.dfm}

{ TFrame3 }

procedure TFrameRangeAgePrice.RefreshControl;
begin
  //PanelPriceDiscount.Enabled:= true;
  AgentPercEdit.Enabled:= AgentPercRadioButton.Enabled and AgentPercRadioButton.Checked;
  AgentPayValEdit.Enabled := AgentPercRadioButton.Enabled and AgentAbsRadioButton.Checked;
  
  //AgentPercRadioButton.Enabled := PanelPriceDiscount.Enabled;
  //AgentAbsRadioButton.Enabled := PanelPriceDiscount.Enabled ;
  //ForPayLabel.Caption := Format( ForPayLabel.Caption, [RateComboBox.Text]);
  //TotalVatLabel.Caption := Format( TotalVatLabel.Caption, [RateComboBox.Text]);

  NetCostVatEdit.Enabled  := (AgentPercRadioButton.Enabled) and (RateComboBox.EditValue <> null);
  BrutCostVatEdit.Enabled := (AgentPercRadioButton.Enabled) and (RateComboBox.EditValue <> null);

  FSetFilterCombo(not CheckAllVal.Checked);
  Calc;
end;

function CalcVsogo(Brutto,AgentPayVal:Double;AgentIs:Boolean):Double;
begin
  if AgentIs then result:= Brutto - AgentPayVal
  else result:= Brutto;
end;

function CalcPrcAgent( Brutto, AgentPayVal:Double ):Double;
begin
  if Brutto <> 0 then
    result:= AgentPayVal * 100 / Brutto
  else result:=0;
end;

function CalcValAgent( Brutto, AgentPrc:Double ):Double;
begin
  if Brutto <> 0 then
    result:= AgentPrc * Brutto / 100 
  else result:=0;
end;

function CalcPrybutok(Brutto,Netto,AgentPayVal:Double;AgentIs:Boolean ):Double;
begin
  if AgentIs then
    result := Brutto - Netto - AgentPayVal
  else result:= Brutto - Netto;
end;

function CalcVAT( Suma, VatPrc :Double):Double;
begin
  result:= (Suma * VatPrc) / (100 + VatPrc);
end;

function TFrameRangeAgePrice.FValueEdit(Edit:TcxCurrencyEdit):Double;
begin
  if Edit.Value = null then result:=0
  else result:= Edit.Value;
end;

function TFrameRangeAgePrice.FFindVatValueById( id:Integer):Double;
var i:integer;
begin
  result:=0;
  for i:=0 to Length( FVATValuePrcTable )-1 do
  begin
    if FVATValuePrcTable[i].id = id then
    begin
      result:= FVATValuePrcTable[i].Value;
      break;
    end;
  end;
end;

function TFrameRangeAgePrice.FGetValueVatPrc( Combo:TcxLookUpCombobox ):Double;
begin
  if Combo.EditValue <> null then
    result:= FFindVatValueById( Combo.EditValue )
  else result:=0;
end;

procedure TFrameRangeAgePrice.Calc;
begin
  if not AgentPercRadioButton.Checked then
    AgentPercEdit.EditValue := CalcPrcAgent( FValueEdit( BrutCostVatEdit ) ,FValueEdit( AgentPayValEdit ) )
  else AgentPayValEdit.EditValue := CalcValAgent( FValueEdit( BrutCostVatEdit ), FValueEdit( AgentPercEdit ) );

  ForPayLb.EditValue := CalcVsogo(FValueEdit( BrutCostVatEdit ) ,FValueEdit( AgentPayValEdit ), true );
  TotalLabel.EditValue :=  CalcPrybutok(FValueEdit( BrutCostVatEdit ) , FValueEdit( NetCostVatEdit ),FValueEdit( AgentPayValEdit ),  true );

  if TotalLabel.EditValue >= 0 then TotalLabel.StyleDisabled.TextColor:=clBlack
  else TotalLabel.StyleDisabled.TextColor:=clRed;

end;

procedure TFrameRangeAgePrice.AgentPayCheckBoxClick(Sender: TObject);
begin
  RefreshControl;
end;

procedure TFrameRangeAgePrice.BrutCostVatEditKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  Calc;
end;

procedure TFrameRangeAgePrice.SetVATValuePrcTable(
  const Value: TVATValuePrcTable);
begin
  self.FVATValuePrcTable := Value;
end;

procedure TFrameRangeAgePrice.VatRateIdcComboBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
   RefreshControl;
end;

procedure TFrameRangeAgePrice.butEditPeriodClick(Sender: TObject);
var aRange: TRateRange;
begin
  ExecuteHeaderConfigPeriodForm(aRange);
end;

procedure TFrameRangeAgePrice.SetPropertyComboVal(
  const Value: TComboProperty);
begin
  FPropertyComboVal := Value;
end;

procedure TFrameRangeAgePrice.FSetFilterCombo(Filter:Boolean);
begin
  if FPropertyComboVal.View <> nil then
    SetFilterOnWievForManyColumns( FPropertyComboVal.View, [RateComboBox.Properties.KeyFieldNames], FPropertyComboVal.idFilter, ['='], [fboAnd],fboOr,Filter );
end;

procedure TFrameRangeAgePrice.CheckAllValClick(Sender: TObject);
begin
 RefreshControl;
end;

procedure TFrameRangeAgePrice.RateComboBoxPropertiesChange(
  Sender: TObject);
begin
  RefreshControl;
end;

end.




