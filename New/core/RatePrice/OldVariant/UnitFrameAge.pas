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
  cxDBLookupComboBox,HeaderConfig_Form,RateTypes;

type
  VATValuePrc = record
    id :Integer;
    Value:Double;
  end;
  TVATValuePrcTable = array of VATValuePrc;

  TFrameRangeAgePrice = class(TFrame)
    PanelMain: TPanel;
    PanelAge: TPanel;
    Panel5: TPanel;
    TabControlAge: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    PanelTab: TPanel;
    PanelPrice: TPanel;
    VatPercentLabel: TLabel;
    NetCostLabel: TLabel;
    RateLabel: TLabel;
    AgentPercLabel: TLabel;
    AgentPayLabel: TLabel;
    TotalLb: TLabel;
    ForPay0Label: TLabel;
    Label1: TLabel;
    Rate2GroupBox: TGroupBox;
    Bevel2: TBevel;
    Bevel5: TBevel;
    AgentPayCheckBox2: TCheckBox;
    PanelPrice2: TPanel;
    AgentPercRadioButton2: TcxRadioButton;
    AgentAbsRadioButton2: TcxRadioButton;
    RateGroupBox: TGroupBox;
    Bevel1: TBevel;
    Bevel6: TBevel;
    AgentPayCheckBox: TCheckBox;
    PanelPrice1: TPanel;
    AgentPercRadioButton: TcxRadioButton;
    AgentAbsRadioButton: TcxRadioButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    TabControlPeriod: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    butEditPeriod: TSpeedButton;
    Panel4: TPanel;
    butEditAge: TSpeedButton;
    NetCostVatEdit: TcxCurrencyEdit;
    BrutCostVatEdit: TcxCurrencyEdit;
    NetCostVatEdit2: TcxCurrencyEdit;
    BrutCostVatEdit2: TcxCurrencyEdit;
    AgentPercEdit: TcxCurrencyEdit;
    AgentPayValEdit: TcxCurrencyEdit;
    AgentPercEdit2: TcxCurrencyEdit;
    AgentPayValEdit2: TcxCurrencyEdit;
    RateComboBox: TcxLookupComboBox;
    VatRateIdcComboBox: TcxLookupComboBox;
    RateComboBox2: TcxLookupComboBox;
    VatRateIdcComboBox2: TcxLookupComboBox;
    Panel7: TPanel;
    TotalVatLabel: TLabel;
    Bevel7: TBevel;
    ForPayLabel: TLabel;
    VatLabel: TLabel;
    Panel6: TPanel;
    Bevel3: TBevel;
    TotalVatLabel2: TLabel;
    ForPayLabel2: TLabel;
    VatLabel2: TLabel;
    TotalLabel2: TcxCurrencyEdit;
    TotalLabel: TcxCurrencyEdit;
    ForPayLb: TcxCurrencyEdit;
    ForPayLb2: TcxCurrencyEdit;
    VatLb: TcxCurrencyEdit;
    VatLb2: TcxCurrencyEdit;
    procedure AgentPayCheckBoxClick(Sender: TObject);
    procedure BrutCostVatEditKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure VatRateIdcComboBoxPropertiesEditValueChanged(
      Sender: TObject);
    procedure butEditPeriodClick(Sender: TObject);
  private
     FVATValuePrcTable : TVATValuePrcTable;
     procedure Calc;
     function FValueEdit(Edit:TcxCurrencyEdit):Double;
     function FFindVatValueById( id:Integer):Double;
     function FGetValueVatPrc( Combo:TcxLookUpCombobox ):Double;
    procedure SetVATValuePrcTable(const Value: TVATValuePrcTable);
    { Private declarations }
  public
    procedure RefreshControl;

    property VATValuePrcTable: TVATValuePrcTable read FVATValuePrcTable write SetVATValuePrcTable;
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrame3 }

procedure TFrameRangeAgePrice.RefreshControl;
begin
  PanelPrice1.Enabled:= AgentPayCheckBox.Checked;
  PanelPrice2.Enabled:= AgentPayCheckBox2.Checked;

  AgentPercEdit.Enabled:= PanelPrice1.Enabled and AgentPercRadioButton.Checked;
  AgentPayValEdit.Enabled := PanelPrice1.Enabled and AgentAbsRadioButton.Checked;
  AgentPercRadioButton.Enabled := PanelPrice1.Enabled;
  AgentAbsRadioButton.Enabled := PanelPrice1.Enabled ;

  AgentPercEdit2.Enabled:= PanelPrice2.Enabled and AgentPercRadioButton2.Checked;
  AgentPayValEdit2.Enabled := PanelPrice2.Enabled and AgentAbsRadioButton2.Checked;
  AgentPercRadioButton2.Enabled := PanelPrice2.Enabled ;
  AgentAbsRadioButton2.Enabled := PanelPrice2.Enabled ;


  ForPayLabel.Caption := Format( ForPayLabel.Caption, [RateComboBox.Text]);
  ForPayLabel2.Caption := Format(ForPayLabel2.Caption, [RateComboBox2.Text]);

  TotalVatLabel.Caption := Format( TotalVatLabel.Caption, [RateComboBox.Text]);
  TotalVatLabel2.Caption := Format(TotalVatLabel2.Caption, [RateComboBox2.Text]);

  NetCostVatEdit.Enabled := VatRateIdcComboBox.EditValue <> null;
  BrutCostVatEdit.Enabled := VatRateIdcComboBox.EditValue <> null;

  NetCostVatEdit2.Enabled := VatRateIdcComboBox2.EditValue <> null;
  BrutCostVatEdit2.Enabled := VatRateIdcComboBox2.EditValue <> null;
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

  if not AgentPercRadioButton2.Checked then
    AgentPercEdit2.EditValue := CalcPrcAgent( FValueEdit( BrutCostVatEdit2 ) ,FValueEdit( AgentPayValEdit2 ) )
  else AgentPayValEdit2.EditValue := CalcValAgent( FValueEdit( BrutCostVatEdit2 ), FValueEdit( AgentPercEdit2 ) );


  ForPayLb.EditValue := CalcVsogo(FValueEdit( BrutCostVatEdit ) ,FValueEdit( AgentPayValEdit ), AgentPayCheckBox.Checked);
  ForPayLb2.EditValue := CalcVsogo(FValueEdit( BrutCostVatEdit2 ) ,FValueEdit( AgentPayValEdit2 ), AgentPayCheckBox2.Checked);

  TotalLabel.EditValue :=  CalcPrybutok(FValueEdit( BrutCostVatEdit ) , FValueEdit( NetCostVatEdit ),FValueEdit( AgentPayValEdit ),  AgentPayCheckBox.Checked );
  TotalLabel2.EditValue := CalcPrybutok(FValueEdit( BrutCostVatEdit2 ) , FValueEdit( NetCostVatEdit2 ),FValueEdit( AgentPayValEdit2 ),  AgentPayCheckBox2.Checked );

  VatLb.EditValue :=  CalcVAT( FValueEdit( ForPayLb ),FGetValueVatPrc(VatRateIdcComboBox ) );
  VatLb2.EditValue := CalcVAT( FValueEdit( ForPayLb2 ),FGetValueVatPrc(VatRateIdcComboBox2 ) );

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

end.




