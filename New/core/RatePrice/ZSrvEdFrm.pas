unit ZSrvEdFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDataDlg, DB, StdCtrls, Buttons, ExtCtrls, AzComboBox, Mask, DBCtrls,
  DBTables, Spin, AzEdit, ComCtrls, cxControls, cxPC, RateTypes,  DateUtils,
  StrUtils, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  cxPCdxBarPopupMenu, CheckTree;

type
  TZServDataDialog = class(TZDataDialog)
    MemoLabel: TLabel;
    SelCurrQry: TQuery;
    SelCurrQryCURRENCYID: TIntegerField;
    SelCurrQryCURRENCYSHORT: TStringField;
    VendorLabel: TLabel;
    GroupGroupBox: TGroupBox;
    GroupMinLabel: TLabel;
    GroupMaxLabel: TLabel;
    GroupMinDBEdit: TDBEdit;
    GroupMaxDBEdit: TDBEdit;
    VendorComboBox: TAzComboBox;
    RateCurrComboBox: TAzComboBox;
    BeginDayLabel: TLabel;
    BeginDayEdit: TSpinEdit;
    GratisGroupBox: TGroupBox;
    GratisPersonLabel: TLabel;
    GratisPersonEdit: TSpinEdit;
    GratisCheckBox: TCheckBox;
    GratisByVendorCheckBox: TCheckBox;
    HiddenDBCheckBox: TDBCheckBox;
    DataTopBevel: TBevel;
    DisabledDBCheckBox: TDBCheckBox;
    NetCheckDBCheckBox: TDBCheckBox;
    SelVatQuery: TQuery;
    SelVatQueryVATID: TIntegerField;
    SelVatQueryVATNAME: TStringField;
    SelVatQueryVATVALUE: TFloatField;
    SelVatQueryVATVALSTR: TStringField;
    WarningStaticText: TStaticText;
    SelAgeQry: TQuery;
    SelPeriodQry: TQuery;
    SelTourRatesQry: TQuery;
    SelAgeQryNAMEID: TIntegerField;
    SelAgeQryNAME: TStringField;
    SelAgeQryAGEID: TIntegerField;
    SelAgeQryAGEFROM: TIntegerField;
    SelAgeQryAGETILL: TIntegerField;
    SelPeriodQryPERIODID: TIntegerField;
    SelPeriodQryPERIODFROM: TIntegerField;
    SelPeriodQryPERIODTILL: TIntegerField;
    SelTourRatesQryV1_RATE: TFloatField;
    SelTourRatesQryV1_AGENTPAY: TFloatField;
    SelTourRatesQryV1_NETVAL: TFloatField;
    SelTourRatesQryV2_RATE: TFloatField;
    SelTourRatesQryV2_AGENTPAY: TFloatField;
    SelTourRatesQryV2_NETVAL: TFloatField;
    SelTourRatesQryV1_RATE2: TFloatField;
    SelTourRatesQryV1_AGENTPAY2: TFloatField;
    SelTourRatesQryV1_NETVAL2: TFloatField;
    SelTourRatesQryV2_RATE2: TFloatField;
    SelTourRatesQryV2_AGENTPAY2: TFloatField;
    SelTourRatesQryV2_NETVAL2: TFloatField;
    SelTourRatesQryPERIODID: TIntegerField;
    SelTourRatesQryAGEID: TIntegerField;
    SelTourRatesQryTOURRATEID: TIntegerField;
    AgeTabControl: TcxTabControl;
    PeriodBtn: TBitBtn;
    SelPeriodQryNAME: TStringField;
    SelPeriodQryFROMDATE: TDateTimeField;
    SelPeriodQryTILLDATE: TDateTimeField;
    PeriodTabControl: TcxTabControl;
    Panel1: TPanel;
    Rate2GroupBox: TGroupBox;
    Bevel2: TBevel;
    Bevel4: TBevel;
    Vat2Label: TLabel;
    ForPay2Label: TLabel;
    Bevel5: TBevel;
    Total2Label: TLabel;
    Total2VatLabel: TLabel;
    ForPay2Text: TLabel;
    Vat2Text: TLabel;
    AgentPay2CheckBox: TCheckBox;
    AgentPerc2RadioButton: TRadioButton;
    AgentAbs2RadioButton: TRadioButton;
    Vat1Perc2ComboBox: TAzComboBox;
    Vat2Perc2ComboBox: TAzComboBox;
    NetCost2Vat1Edit: TAzEdit;
    NetCost2Vat2Edit: TAzEdit;
    Rate2Vat2Edit: TAzEdit;
    Rate2Vat1Edit: TAzEdit;
    AgentPerc2Vat1Edit: TAzEdit;
    AgentPay2Vat1Edit: TAzEdit;
    AgentPerc2Vat2Edit: TAzEdit;
    AgentPay2Vat2Edit: TAzEdit;
    RateGroupBox: TGroupBox;
    Bevel1: TBevel;
    Bevel3: TBevel;
    VatLabel: TLabel;
    ForPayLabel: TLabel;
    Bevel6: TBevel;
    Total1Label: TLabel;
    TotalVatLabel: TLabel;
    ForPayText: TLabel;
    VatText: TLabel;
    AgentPayCheckBox: TCheckBox;
    AgentPercRadioButton: TRadioButton;
    AgentAbsRadioButton: TRadioButton;
    Vat1PercComboBox: TAzComboBox;
    Vat2PercComboBox: TAzComboBox;
    NetCostVat1Edit: TAzEdit;
    NetCostVat2Edit: TAzEdit;
    RateVat1Edit: TAzEdit;
    RateVat2Edit: TAzEdit;
    AgentPercVat1Edit: TAzEdit;
    AgentPayVat1Edit: TAzEdit;
    AgentPercVat2Edit: TAzEdit;
    AgentPayVat2Edit: TAzEdit;
    VatPercentLabel: TLabel;
    NetCostLabel: TLabel;
    RateLabel: TLabel;
    AgentPercLabel: TLabel;
    AgentPayLabel: TLabel;
    TotalLabel: TLabel;
    ForPay0Label: TLabel;
    PeriodGroupBox: TGroupBox;
    ExactRadioBtn: TRadioButton;
    RelativeRadioBtn: TRadioButton;
    SelAgeQryISBASEAGE: TStringField;
    StoreRateQry: TQuery;
    AgesBtn: TBitBtn;
    Total1Vat1Edit: TAzEdit;
    Total1Vat2Edit: TAzEdit;
    Total2Vat1Edit: TAzEdit;
    Total2Vat2Edit: TAzEdit;
    RateComboBox: TAzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BeginDayEditChange(Sender: TObject);
    procedure GratisCheckBoxClick(Sender: TObject);
    procedure RateCurrComboBoxChange(Sender: TObject);
    procedure Vat1PercComboBoxClick(Sender: TObject);
    procedure Vat2PercComboBoxClick(Sender: TObject);
    procedure Vat1Perc2ComboBoxClick(Sender: TObject);
    procedure Vat2Perc2ComboBoxClick(Sender: TObject);
    procedure RateDBEditChange(Sender: TObject);
    procedure Rate2DBEditChange(Sender: TObject);
    procedure AgentPayCheckBoxClick(Sender: TObject);
    procedure AgentPay2CheckBoxClick(Sender: TObject);
    procedure AgentPercRadioButtonClick(Sender: TObject);
    procedure AgentPerc2RadioButtonClick(Sender: TObject);
    procedure AgentPercDBEditChange(Sender: TObject);
    procedure AgentPerc2DBEditChange(Sender: TObject);
    procedure AgentPayDBEditChange(Sender: TObject);
    procedure AgentPay2DBEditChange(Sender: TObject);
    procedure AgentWhoRadioButtonClick(Sender: TObject);
    procedure AgentWho2RadioButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabControlChange(Sender: TObject);
    procedure TabControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure EditExit(Sender: TObject);
    procedure PeriodBtnClick(Sender: TObject);
    procedure RelativeRadioBtnClick(Sender: TObject);
    procedure AgesBtnClick(Sender: TObject);
  private
    FActivation: Boolean;
    FVat1Perc: Extended;
    FVat1Perc2: Extended;
    FVat2Perc: Extended;
    FVat2Perc2: Extended;

    FVat1Pay: Variant;
    FVat2Pay: Variant;
    FVat1Pay2: Variant;
    FVat2Pay2: Variant;
    FVat1Vat: Variant;
    FVat2Vat: Variant;
    FVat1Vat2: Variant;
    FVat2Vat2: Variant;

    FVat1PercField: TFloatField;
    FVat2PercField: TFloatField;
    FVat1Perc2Field: TFloatField;
    FVat2Perc2Field: TFloatField;
    FBrServKindId: Integer;
    FBrServiceId: Integer;
    FRates: TTypeRate;
    FTreeViewItems: array of TTreeNode;
    FVisibilityTreeView: TCheckTreeView;
    Periods: TRatePeriods;
    Ages: TAges;
    FLegalFrom: TDateTime;
    FIsChanged: boolean;                 // признак модифікації
    FMinPeriod: Integer;
    procedure CalcAgentPerc(
      PercOn: Boolean; RateEdit, AgentEdit, AgPrcEdit: TAzEdit); 
    procedure CalcAgentPay(RateEdit, AgentEdit, AgPrcEdit: TAzEdit); 
    procedure CalcPayValue(Agent, AgPerc: Boolean;
      VatPerc: Extended; RateEdit, AgentEdit, AgPrcEdit: TAzEdit;
      var PayField, VatField: Variant; aTag: Integer); 
    procedure CalcPayValue1;
    procedure CalcPayValue2;
    procedure CalcVat(PercComboBox: TAzComboBox;
      var PayField, VatField: Variant; var VatPerc: Extended);
    procedure CalcVatValue(VatPerc: Extended; var PayField, VatField: Variant;
      aTag: Integer);
    function CheckVatIsNull(RateEdit: TAzEdit; PercComboBox: TAzComboBox): Boolean; 
    function CheckVatPerc(Perc1ComboBox, Perc2ComboBox: TAzComboBox): Boolean;
    function GetEditDataSet: TDataSet;
    function GetIsGroupTemplate: Boolean;
    function GetVatPerc(PercComboBox: TAzComboBox): Extended;
    procedure LoadAgentFields(I, J: Integer);
    procedure LoadGratisFields;
    procedure LoadVat1Field(VatCombo: TAzComboBox; VatField: TFloatField);
    procedure LoadVat2Field(VatCombo: TAzComboBox; VatField: TFloatField);
    procedure LoadVatFields;
    procedure PrepareCurrencyQry;
    procedure PrepareVatCombo(VatList: TStrings; NonZero: Boolean);
    procedure StoreAgentFields;
    procedure StoreGratisFields;
    procedure StoreVatFields;
    procedure ToggleVat1Fields;
    procedure ToggleVat1Fields2;
    procedure ToggleVat2Fields;
    procedure ToggleVat2Fields2;
    procedure LoadServRates;
    procedure UpdateSelPeriodQry;
    procedure UpdateSelAgeQry;
    procedure UpdateTourRates;
    procedure UpdateRateQry(aQuery: TQuery);
    function GetBrServKindId: Integer;
    function GetBrServiceId: Integer;
    procedure FillRates;
    procedure FillRatesRec(i, j: Integer; SetNull: Boolean = False);
    procedure FillRecords;
    procedure FillPeriods;
    procedure FillAges;
    procedure SaveRates;
    procedure StoreRates;
    procedure AdjustPeriods;
    procedure AdjustAges;
    function PeriodName(ARange: TRatePeriodData; IsFirst: Boolean): string;
    function AgeName(ARange: TNameStatusRangeId): string;
    procedure ApplyPeriods(Sender: TObject);    
    procedure ModifyPeriods(Sender: TObject);
    procedure ModifyExactDate(Sender: TObject);
    procedure ApplyAges(Sender: TObject);    
    procedure ModifyAges(Sender: TObject);
    function GetRelativeDate: Boolean;
    procedure SetRelativeDate(const Value: Boolean);
    procedure FillPeriodTabControl;
    procedure FillAgesTabControl;
    procedure SetLegalFrom(const Value: TDateTime);
    procedure LoadRatesFields;
    procedure RateRefresh;
    function GetServiceId: Integer;
    procedure MakePeriodQuery;
    procedure MakeRateQuery;
  protected
    procedure ToggleAgentPayPerc(
      AgntOn, PercOn, VatOn: Boolean; PercEdit, PayEdit: TAzEdit); overload;
    procedure DataErrorLookup; override;
    procedure DataErrorSearch; override;
    function GetComboBox(const Index: Integer): TAzComboBox; virtual;
    function GetComboId(const Index: Integer): Integer;
    procedure GetComboField(Combo: TCustomComboBox; const FieldName: String);
    procedure SetComboField(Combo: TCustomComboBox; const FieldName: String);
    function GetDate(const Index: Integer): TDateTime; virtual;
    function GetDayCount: Integer; virtual;
    procedure LoadData; virtual;
    procedure LoadGroupData; virtual;
    procedure SetDate(const Index: Integer; const Value: TDateTime); virtual;
    procedure SetDayCount(const Value: Integer); virtual;
    procedure StoreData; virtual;
    procedure StoreGroupData; virtual;
    procedure ToggleGroupTemplate(IsGroup: Boolean); virtual;
    property DayCount: Integer read GetDayCount write SetDayCount;
    property EditDataSet: TDataSet read GetEditDataSet;
    property IsGroupTemplate: Boolean read GetIsGroupTemplate;
    property FromDate: TDateTime index 0 read GetDate write SetDate;
    property TillDate: TDateTime index 1 read GetDate write SetDate;
    property SelGroupCurrId: Integer index 0 read GetComboId;
    property SelRateCurrId: Integer index 1 read GetComboId;
    property SelVendorId: Integer index 2 read GetComboId;
  published
    procedure DayCountEditChange(Sender: TObject);
    property BrServKindId: Integer read GetBrServKindId write FBrServKindId;
    property BrServiceId: Integer read GetBrServiceId write FBrServiceId;
    property RelativeDate: Boolean read GetRelativeDate write SetRelativeDate;
    property LegalFrom : TDateTime read FLegalFrom write SetLegalFrom;
  end;

var
  ZServDataDialog: TZServDataDialog;

implementation

uses TourDbUn, VDlgs, TourCmnlIf, DataMod, TourConsts, OptSet, OrderUn,
  Math, HeaderConfig_Form, EditSeasonsRange_Form, StringConsts, 
  EditAgeRanges_Form;
const
  nExactDate = 0;
  nRelativeDate = 1;
  TypePeriodArr: array[Boolean] of Integer = (nExactDate, nRelativeDate);

  PeriodSelSQL = 
  'select * from TR_Periods P ' +
    'where P.ServKindId = :ServKindId and P.ServiceId = :ServiceId and %s ' +
    'Order By PeriodFrom Desc, FromDate  nulls first ';
  ToruRateSelSQL =
  'Select R.TourRateId, P.PeriodId, P.PeriodFrom, P.PeriodTill, ' +
    'A.AgeId, A.AgeFrom, A.AgeTill,  ' +
    'R.V1_Rate, R.V1_AGENTPAY, R.V1_NETVAL, ' +
    'R.V2_Rate, R.V2_AGENTPAY, R.V2_NETVAL, ' +
    'R.V1_Rate2, R.V1_AGENTPAY2, R.V1_NETVAL2, ' +
    'R.V2_Rate2, R.V2_AGENTPAY2, R.V2_NETVAL2 ' +
  'from TR_Rates R, TR_Ages A, TR_Periods P ' +
  'where A.ServiceId = :ServiceId and A.ServKindId = :ServKindId ' +
    'and P.ServiceId = :ServiceId and P.ServKindId = :ServKindId ' +
    'and R.PeriodId = P.PeriodId and R.AgeId = A.AgeId and %s ' +
    'order by AgeFrom desc, PeriodFrom desc ';

  ExactWhere = 'PeriodFrom is Null and PeriodTill is null';
  RelativeWhere = 'FromDate is null and TillDate is null';
  WhereArr: array[Boolean] of string = (ExactWhere, RelativeWhere);
  
{$R *.dfm}

{ TZServDataDialog }

procedure TZServDataDialog.CalcAgentPay(RateEdit, AgentEdit, AgPrcEdit: TAzEdit);
begin
  AgentEdit.Text := FormatFloat('#0.00',
    SafeStrToFloat(RateEdit.Text) * SafeStrToFloat(AgPrcEdit.Text) / 100);
end;

procedure TZServDataDialog.CalcAgentPerc(PercOn: Boolean; RateEdit,
  AgentEdit, AgPrcEdit: TAzEdit);
var Rate: Extended;
begin
  if PercOn and (AgPrcEdit.Text = EmptySTr) then
  begin
    Rate := SafeStrToFloat(RateEdit.Text);
    with AgPrcEdit do
      if Rate = 0 then Text := EmptyStr
      else Text := FormatFloat('#0.00', SafeStrToFloat(AgentEdit.Text) / Rate * 100);
  end;
end;

procedure TZServDataDialog.CalcPayValue(Agent, AgPerc: Boolean;
  VatPerc: Extended; RateEdit, AgentEdit, AgPrcEdit: TAzEdit;
  var PayField, VatField: Variant; aTag: Integer);
var Rate: Extended;
begin
  Rate := SafeStrToFloat(RateEdit.Text);   
  if Rate = 0 then
  begin
    if AgPerc then AgPrcEdit.Text := EmptyStr else AgentEdit.Text := EmptyStr;
  end;
  if RateEdit.Text = EmptyStr then PayField := null
  else if Agent then
  begin
    if AgPerc then
      AgentEdit.Text := FormatFloat('#0.00', Rate * SafeStrToFloat(AgPrcEdit.Text) / 100);
    PayField := Rate - SafeStrToFloat(AgentEdit.Text);
  end
  else PayField := Rate;
  CalcVatValue(VatPerc, PayField, VatField, aTag);
end;

procedure TZServDataDialog.CalcPayValue1;
var Vat1Pay, Vat2Pay: Double;
begin
  CalcPayValue(AgentPayCheckBox.Checked, AgentPercRadioButton.Checked,
    FVat1Perc, RateVat1Edit, AgentPayVat1Edit, AgentPercVat1Edit,
    FVat1Pay, FVat1Vat, 0);
  CalcPayValue(AgentPayCheckBox.Checked, AgentPercRadioButton.Checked,
    FVat2Perc, RateVat2Edit, AgentPayVat2Edit, AgentPercVat2Edit,
    FVat2Pay, FVat2Vat, 0);

  if VarIsNull(FVat1Pay) then Vat1Pay := 0 else Vat1Pay := FVat1Pay;
  if VarIsNull(FVat2Pay) then Vat2Pay := 0 else Vat2Pay := FVat2Pay;
    
  with ForPayText do                   
  if VarIsNull(FVat1Pay) and VarIsNull(FVat2Pay) then Caption := EmptyStr
  else Caption := FormatFloat('#0.00', Vat1Pay + Vat2Pay);

  with Total1Vat1Edit do
  if VarIsNull(FVat1Pay) and (NetCostVat1Edit.Text = EmptyStr)
  then Text := EmptyStr
  else Text := FloatToStr(Vat1Pay - SafeStrToFloat(NetCostVat1Edit.Text));
  with Total1Vat2Edit do      
  if VarIsNull(FVat2Pay) and (NetCostVat2Edit.Text = EmptyStr)   
  then Text := EmptyStr
  else Text := FormatFloat('#0.00', Vat2Pay - SafeStrToFloat(NetCostVat2Edit.Text));
  Total1Label.Caption := FormatFloat('#0.00', 
    SafeStrToFloat(ForPayText.Caption) - SafeStrToFloat(NetCostVat1Edit.Text) - SafeStrToFloat(NetCostVat2Edit.Text));
end;

procedure TZServDataDialog.CalcPayValue2;
var Vat1Pay2, Vat2Pay2: Double;
begin
  CalcPayValue(AgentPay2CheckBox.Checked, AgentPerc2RadioButton.Checked,
    FVat1Perc2, Rate2Vat1Edit, AgentPay2Vat1Edit, AgentPerc2Vat1Edit,
    FVat1Pay2, FVat1Vat2, 1);
  CalcPayValue(AgentPay2CheckBox.Checked, AgentPerc2RadioButton.Checked,
    FVat2Perc2, Rate2Vat2Edit, AgentPay2Vat2Edit, AgentPerc2Vat2Edit,
    FVat2Pay2, FVat2Vat2, 1);
    
  if VarIsNull(FVat1Pay2) then Vat1Pay2 := 0 else Vat1Pay2 := FVat1Pay2;
  if VarIsNull(FVat2Pay2) then Vat2Pay2 := 0 else Vat2Pay2 := FVat2Pay2;

  with ForPay2Text do    
  if VarIsNull(FVat1Pay2) and VarIsNull(FVat2Pay2) then Caption := EmptyStr
  else Caption := FormatFloat('#0.00', Vat1Pay2 + Vat2Pay2);

  with Total2Vat1Edit do
  if VarIsNull(FVat1Pay2) and (NetCost2Vat1Edit.Text = EmptyStr)
  then Text := EmptyStr
  else Text := FloatToStr(Vat1Pay2 - SafeStrToFloat(NetCost2Vat1Edit.Text));
  with Total2Vat2Edit do      
  if VarIsNull(FVat2Pay2) and (NetCost2Vat2Edit.Text = EmptyStr)
  then Text := EmptyStr
  else Text := FloatToStr(Vat2Pay2 - SafeStrToFloat(NetCost2Vat2Edit.Text));
  Total2Label.Caption := FormatFloat('#0.00', 
    SafeStrToFloat(ForPay2Text.Caption) - SafeStrToFloat(NetCost2Vat1Edit.Text) - SafeStrToFloat(NetCost2Vat2Edit.Text));
end;

procedure TZServDataDialog.CalcVat(PercComboBox: TAzComboBox;
  var PayField, VatField: Variant; var VatPerc: Extended);
var Vat1Vat, Vat2Vat, Vat1Vat2, Vat2Vat2: Double;
begin    
  with PercComboBox do
    if (ItemId <= 0) or not DM.VatQuery.Locate('VATID', ItemId, [])
      or DM.VatQueryVATVALUE.IsNull
    then VatPerc := -1
    else VatPerc := DM.VatQueryVATVALUE.Value;
  CalcVatValue(VatPerc, PayField, VatField, PercComboBox.Tag);
  if VarIsNull(FVat1Vat) then Vat1Vat := 0 else Vat1Vat := FVat1Vat;
  if VarIsNull(FVat2Vat) then Vat2Vat := 0 else Vat2Vat := FVat2Vat;
  if VarIsNull(FVat1Vat2) then Vat1Vat2 := 0 else Vat1Vat2 := FVat1Vat2;
  if VarIsNull(FVat2Vat2) then Vat2Vat2 := 0 else Vat2Vat2 := FVat2Vat2;

  if (PercComboBox = Vat1PercComboBox) or (PercComboBox = Vat2PercComboBox) then
    with VatText do
      if VarIsNull(FVat1Vat) and VarIsNull(FVat2Vat) then Caption := EmptyStr
      else Caption := FormatFloat('#0.00', Vat1Vat + Vat2Vat)
  else
    with Vat2Text do
      if VarIsNull(FVat1Vat2) and VarIsNull(FVat2Vat2) then Caption := EmptyStr
      else Caption := FormatFloat('#0.00', Vat1Vat2 + Vat2Vat2);
end;

procedure TZServDataDialog.CalcVatValue(
  VatPerc: Extended; var PayField, VatField: Variant; aTag: Integer);
var Vat1Vat, Vat2Vat, Vat1Vat2, Vat2Vat2: Double;
begin
  if VatPerc < 0 then VatField := null
  else VatField := PayField * VatPerc / (100 + VatPerc);
            
//  if (VatField = FVat1VatField) or (VatField = FVat2VatField) then
  if VarIsNull(FVat1Vat) then Vat1Vat := 0 else Vat1Vat := FVat1Vat;
  if VarIsNull(FVat2Vat) then Vat2Vat := 0 else Vat2Vat := FVat2Vat;
  if VarIsNull(FVat1Vat2) then Vat1Vat2 := 0 else Vat1Vat2 := FVat1Vat2;
  if VarIsNull(FVat2Vat2) then Vat2Vat2 := 0 else Vat2Vat2 := FVat2Vat2;
  if aTag = 0 then
    with VatText do
      if VarIsNull(FVat1Vat) and VarIsNull(FVat2Vat) then Caption := EmptyStr
      else Caption := FormatFloat('#0.00', Vat1Vat + Vat2Vat)
  else
    with Vat2Text do
      if VarIsNull(FVat1Vat2) and VarIsNull(FVat2Vat2) then Caption := EmptyStr
      else Caption := FormatFloat('#0.00', Vat1Vat2 + Vat2Vat2);
end;

function TZServDataDialog.CheckVatIsNull(
  RateEdit: TAzEdit; PercComboBox: TAzComboBox): Boolean;
begin
  Result := (Trim(RateEdit.Text) = '') or (PercComboBox.ItemIndex >= 0);
  if not Result then
  begin
    ActiveControl := PercComboBox;
    ErrorDlg(SSrvPayDlgErrorVatIsNull);
  end;
end;

function TZServDataDialog.CheckVatPerc(
  Perc1ComboBox, Perc2ComboBox: TAzComboBox): Boolean;
var Vat1, Vat2: Extended;
begin
  if FActivation then
  begin
    Result := True;
    Exit;
  end;
  Vat1 := GetVatPerc(Perc1ComboBox);
  Vat2 := GetVatPerc(Perc2ComboBox);
  Result := (Vat1 > 0) and ((Vat2 = 0) or (Perc2ComboBox.ItemIndex < 0))
    or (Vat1 < 0);
  if not Result then
  begin
    ActiveControl := Perc2ComboBox;
    ErrorDlg(SSrvPayDlgErrorVatIncompatible);
  end;
end;

function TZServDataDialog.GetEditDataSet: TDataSet;
begin
  Result := DataSource.DataSet;
end;

function TZServDataDialog.GetIsGroupTemplate: Boolean;
begin
  Result := DM.TemplQryTOURGROUPID.Value > 0;
end;

function TZServDataDialog.GetVatPerc(PercComboBox: TAzComboBox): Extended;
begin
  with PercComboBox do
    if (ItemId <= 0) or not DM.VatQuery.Locate('VATID', ItemId, [])
      or DM.VatQueryVATVALUE.IsNull
    then Result := -1
    else Result := DM.VatQueryVATVALUE.Value;
end;

procedure TZServDataDialog.LoadAgentFields(I, J: Integer);
begin
//  with EditDataSet do
  begin
    AgentAbsRadioButton.Checked := FRates[I, J].AgentAbs;
    AgentPercRadioButton.Checked := not AgentAbsRadioButton.Checked;
//      FieldByName('V1_AGENTPERC').IsNull or FieldByName('V2_AGENTPERC').IsNull;
    AgentAbs2RadioButton.Checked := FRates[I, J].AgentAbs2;
    AgentPerc2RadioButton.Checked := not AgentAbs2RadioButton.Checked;
//      FieldByName('V1_AGENTPERC2').IsNull or FieldByName('V2_AGENTPERC2').IsNull;
    AgentPayCheckBox.Checked :=
      not VarIsNull(FRates[I, J].V1_AgentPay) or not VarIsNull(FRates[I, J].V2_AgentPay);
//      not FieldByName('V1_AGENTPAY').IsNull or not FieldByName('V2_AGENTPAY').IsNull;
    AgentPay2CheckBox.Checked :=
      not VarIsNull(FRates[I, J].V1_AgentPay2) or not VarIsNull(FRates[I, J].V2_AgentPay2);
//      not FieldByName('V1_AGENTPAY2').IsNull or not FieldByName('V2_AGENTPAY2').IsNull; 
    AgentPayCheckBoxClick(AgentPayCheckBox);
    AgentPay2CheckBoxClick(AgentPay2CheckBox);
  end;
end;

procedure TZServDataDialog.LoadGratisFields;
begin
  with EditDataSet do
  begin
    GratisPersonEdit.Value := FieldByName('GRATISPERSONCOUNT').AsInteger;
    GratisByVendorCheckBox.Checked := FieldByName('GRATISBYVENDOR').AsBoolean;
  end;
  with GratisCheckBox do
  begin
    Checked := GratisPersonEdit.Value > 0;
    //if not Checked then GratisByVendorCheckBox.Checked := False;
  end;
  GratisCheckBoxClick(nil);
end;

procedure TZServDataDialog.LoadVat1Field(
    VatCombo: TAzComboBox; VatField: TFloatField);
begin
  with VatCombo do
    if VatField.IsNull then ItemIndex := -1
    else if DM.VatQuery.Locate('VATVALSTR', VatField.AsString, []) then
      ItemId := DM.VatQueryVATID.Value
    else ItemIndex := -1;
end;

procedure TZServDataDialog.LoadVat2Field(
    VatCombo: TAzComboBox; VatField: TFloatField);
begin
  with VatCombo do
    if VatField.IsNull and DM.VatQuery.Locate('VATVALSTR', '', [])
      or not VatField.IsNull
        and DM.VatQuery.Locate('VATVALSTR', VatField.AsString, [])
    then ItemId := DM.VatQueryVATID.Value
    else ItemIndex := -1;
end;

procedure TZServDataDialog.LoadVatFields;
begin
  LoadVat1Field(Vat1PercComboBox, FVat1PercField);
  Vat1PercComboBoxClick(Self);
  LoadVat2Field(Vat2PercComboBox, FVat2PercField);
  Vat2PercComboBoxClick(Self);
  CalcPayValue1;
  LoadVat1Field(Vat1Perc2ComboBox, FVat1Perc2Field);
  Vat1Perc2ComboBoxClick(Self);
  LoadVat2Field(Vat2Perc2ComboBox, FVat2Perc2Field);
  Vat2Perc2ComboBoxClick(Self);
  CalcPayValue2;
end;

procedure TZServDataDialog.PrepareCurrencyQry;
begin
  with SelCurrQry do
  begin
    if Active then Close;
    Prepare;
    ParamByName('LocalCurrId').Value := OptionSet.LocaleCurrency;
    Open;
    Locate('CURRENCYID', OptionSet.DefaultCurrency, []);
  end;
end;

procedure TZServDataDialog.PrepareVatCombo(VatList: TStrings; NonZero: Boolean);
const
  sVatSQL =
    'select VatId, VatName, VatValue, VatValStr from Vat_view ' +
    'where %s order by OrderInCategory';
  sSign: array[Boolean] of String = (
    '(VatValue = 0 or VatValue is null)', 'VatValue > 0');
begin
  with SelVatQuery do
  try
    if Active then Close;
    SQL.Text := Format(sVatSQL, [sSign[NonZero]]);
    Prepare;
    DataFieldToStrings(SelVatQueryVATNAME, SelVatQueryVATID, VatList);
  finally
    Close;
  end;
end;

procedure TZServDataDialog.StoreAgentFields;
begin
{  if (RateVat1DBEdit.Text = '') and (RateVat2DBEdit.Text = '')
    or not AgentPayCheckBox.Checked
  then begin
    AgentPayVat1DBEdit.Field.Clear;
    AgentPercVat1DBEdit.Field.Clear;
    AgentPayVat2DBEdit.Field.Clear;
    AgentPercVat2DBEdit.Field.Clear;
    EditDataSet.FieldByName('AGENTPAY').Clear;
  end
  else begin
    if AgentAbsRadioButton.Checked then
    begin
      AgentPercVat1DBEdit.Field.Clear;
      AgentPercVat2DBEdit.Field.Clear;
    end;
    EditDataSet.FieldByName('AGENTPAY').Value :=
      AgentPayVat1DBEdit.Field.AsFloat + AgentPayVat2DBEdit.Field.AsFloat;
  end;     
  if (Rate2Vat1DBEdit.Text = '') and (Rate2Vat2DBEdit.Text = '')
    or not AgentPay2CheckBox.Checked
  then begin
    AgentPay2Vat1DBEdit.Field.Clear;
    AgentPerc2Vat1DBEdit.Field.Clear;
    AgentPay2Vat2DBEdit.Field.Clear;
    AgentPerc2Vat2DBEdit.Field.Clear;
    EditDataSet.FieldByName('AGENTPAY2').Clear;
  end
  else begin
    if AgentAbs2RadioButton.Checked then
    begin
      AgentPerc2Vat1DBEdit.Field.Clear;
      AgentPerc2Vat2DBEdit.Field.Clear;
    end;
    EditDataSet.FieldByName('AGENTPAY2').Value :=
      AgentPay2Vat1DBEdit.Field.AsFloat + AgentPay2Vat2DBEdit.Field.AsFloat;
  end;  }
end;

procedure TZServDataDialog.StoreGratisFields;
begin
  GratisCheckBox.Checked := GratisPersonEdit.Value > 0;
  with EditDataSet do
    if GratisCheckBox.Checked then
    begin
      FieldByName('GRATISPERSONCOUNT').AsInteger := GratisPersonEdit.Value;
      FieldByName('GRATISBYVENDOR').AsBoolean := GratisByVendorCheckBox.Checked;
    end
    else begin
      FieldByName('GRATISPERSONCOUNT').Clear;
      FieldByName('GRATISBYVENDOR').Clear;
    end;
end;

procedure TZServDataDialog.StoreVatFields;
begin
  // locale
  with FVat1PercField do
    if RateVat1Edit.Text = EmptyStr then
    begin
//      FVat1PayField.Clear;
      Clear;
    end
    else if FVat1Perc < 0 then Clear
    else Value := FVat1Perc;
  with FVat2PercField do
    if RateVat2Edit.Text = EmptyStr then
    begin
//      FVat2PayField.Clear;
      Clear;
    end
    else if FVat2Perc < 0 then Clear
    else Value := FVat2Perc;
{  with FVat1VatField do if FVat1PercField.IsNull then Clear;
  with FVat2VatField do if FVat2PercField.IsNull then Clear;
  if ForPayDBText.Field.Text = '' then VatDBText.Field.Clear;
}  // foreign
  with FVat1Perc2Field do
    if Rate2Vat1Edit.Text = EmptyStr then
    begin
//      FVat1Pay2Field.Clear;
      Clear;
    end
    else if FVat1Perc2 < 0 then Clear
    else Value := FVat1Perc2;
  with FVat2Perc2Field do
    if Rate2Vat2Edit.Text = EmptyStr then
    begin
//      FVat2Pay2Field.Clear;
      Clear;
    end
    else if FVat2Perc2 < 0 then Clear
    else Value := FVat2Perc2;
{  with FVat1Vat2Field do if FVat1Perc2Field.IsNull then Clear;
  with FVat2Vat2Field do if FVat2Perc2Field.IsNull then Clear;
  if ForPay2DBText.Field.Text = '' then Vat2DBText.Field.Clear;    }
end;

procedure TZServDataDialog.ToggleVat1Fields;
var En: Boolean;
begin
  with Vat1PercComboBox do En := Enabled and (ItemId > 0);
  ToggleControlEnabled(RateVat1Edit, En);
  ToggleControlEnabled(NetCostVat1Edit, En);
  ToggleAgentPayPerc(
    AgentPayCheckBox.Checked, AgentPercRadioButton.Checked, En,
    AgentPercVat1Edit, AgentPayVat1Edit);
end;

procedure TZServDataDialog.ToggleVat2Fields;
var En: Boolean;
begin
  with Vat2PercComboBox do En := Enabled and (ItemId > 0);
  ToggleControlEnabled(RateVat2Edit, En);
  ToggleControlEnabled(NetCostVat2Edit, En);
  ToggleAgentPayPerc(
    AgentPayCheckBox.Checked, AgentPercRadioButton.Checked, En,
    AgentPercVat2Edit, AgentPayVat2Edit);
end;

procedure TZServDataDialog.ToggleVat1Fields2;
var En: Boolean;
begin
  with Vat1Perc2ComboBox do En := Enabled and (ItemId > 0);
  ToggleControlEnabled(Rate2Vat1Edit, En);
  ToggleControlEnabled(NetCost2Vat1Edit, En);
  ToggleAgentPayPerc(
    AgentPay2CheckBox.Checked, AgentPerc2RadioButton.Checked, En,
    AgentPerc2Vat1Edit, AgentPay2Vat1Edit);
end;

procedure TZServDataDialog.ToggleVat2Fields2;
var En: Boolean;
begin
  with Vat2Perc2ComboBox do En := Enabled and (ItemId > 0);
  ToggleControlEnabled(Rate2Vat2Edit, En);
  ToggleControlEnabled(NetCost2Vat2Edit, En);
  ToggleAgentPayPerc(
    AgentPay2CheckBox.Checked, AgentPerc2RadioButton.Checked, En,
    AgentPerc2Vat2Edit, AgentPay2Vat2Edit);
end;

procedure TZServDataDialog.DataErrorLookup;
  procedure FocusCostControl(Vat1Edit1, Vat2Edit1, Vat1Edit2, Vat2Edit2: TAzEdit;
    Vat1Cost1, Vat2Cost1, Vat1Cost2, Vat2Cost2: Extended);
  begin
    if (SafeStrToFloat(Vat1Edit1.Text, -1) < Vat1Cost1)
      or (SafeStrToFloat(Vat2Edit1.Text, -1) < Vat2Cost1)
    then begin
      if (SafeStrToFloat(Vat1Edit1.Text, -1) >= Vat1Cost1) or not Vat1Edit1.Enabled then
        ActiveControl := Vat2Edit1
      else ActiveControl := Vat1Edit1;
    end
    else if (SafeStrToFloat(Vat2Edit1.Text, -1) < Vat2Cost1)
      or (SafeStrToFloat(Vat2Edit2.Text, -1) < Vat2Cost2)
    then begin
      if (SafeStrToFloat(Vat1Edit2.Text, -1) >= Vat1Cost2) or not Vat1Edit2.Enabled then
        ActiveControl := Vat2Edit2
      else ActiveControl := Vat2Edit1;
    end;
  end;
begin
  case InputErrorCode of
    iecGroupMaxLessMin: ActiveControl := GroupMinDBEdit;
    iecNetValIsNull, iecNetValLessZero:
      FocusCostControl(NetCostVat1Edit, NetCostVat2Edit, NetCost2Vat1Edit, NetCost2Vat2Edit, 0, 0, 0, 0);
    iecRateLessNet:
      FocusCostControl(RateVat1Edit, RateVat2Edit, Rate2Vat1Edit, Rate2Vat2Edit,
        SafeStrToFloat(NetCostVat1Edit.Text, 0), SafeStrToFloat(NetCostVat2Edit.Text, 0),
        SafeStrToFloat(NetCost2Vat1Edit.Text, 0), SafeStrToFloat(NetCost2Vat2Edit.Text, 0));
    iecRateIsNull, iecRateLessZero:
      FocusCostControl(RateVat1Edit, RateVat2Edit, Rate2Vat1Edit, Rate2Vat2Edit, 0, 0, 0, 0);
    iecAgentPayIsMore:
      FocusCostControl(RateVat1Edit, RateVat2Edit, Rate2Vat1Edit, Rate2Vat2Edit,
        SafeStrToFloat(AgentPayVat1Edit.Text, 0), SafeStrToFloat(AgentPayVat2Edit.Text, 0),
        SafeStrToFloat(AgentPay2Vat1Edit.Text, 0), SafeStrToFloat(AgentPay2Vat2Edit.Text, 0));
  end;
end;

procedure TZServDataDialog.DataErrorSearch;
var
  N1v1, N2v1, N1v2, N2v2,
  R1v1, R2v1, R1v2, R2v2, A1v1, A2v1, A1v2, A2v2: Extended;
  NChk, N1Emp, N2Emp, R1Emp, R2Emp, A1Emp, A2Emp: Boolean;
begin
  NChk := NetCheckDBCheckBox.Checked;
  N1v1 := SafeStrToFloat(NetCostVat1Edit.Text);
  N1v2 := SafeStrToFloat(NetCostVat2Edit.Text);
  N2v1 := SafeStrToFloat(NetCost2Vat1Edit.Text);
  N2v2 := SafeStrToFloat(NetCost2Vat2Edit.Text);
  N1Emp := Trim(NetCostVat1Edit.Text + NetCostVat2Edit.Text) = '';
  N2Emp := Trim(NetCost2Vat1Edit.Text + NetCost2Vat2Edit.Text) = '';
  R1v1 := SafeStrToFloat(RateVat1Edit.Text);
  R1v2 := SafeStrToFloat(RateVat2Edit.Text);
  R2v1 := SafeStrToFloat(Rate2Vat1Edit.Text);
  R2v2 := SafeStrToFloat(Rate2Vat2Edit.Text);
  R1Emp := Trim(RateVat1Edit.Text + RateVat2Edit.Text) = '';
  R2Emp := Trim(Rate2Vat1Edit.Text + Rate2Vat2Edit.Text) = '';
  A1v1 := SafeStrToFloat(AgentPayVat1Edit.Text);
  A1v2 := SafeStrToFloat(AgentPayVat2Edit.Text);
  A2v1 := SafeStrToFloat(AgentPay2Vat1Edit.Text);
  A2v2 := SafeStrToFloat(AgentPay2Vat2Edit.Text);
  with AgentPayVat1Edit do A1Emp := not R1Emp and Enabled and (Trim(Text) = '');
  with AgentPayVat2Edit do A1Emp := A1Emp and Enabled and (Trim(Text) = '');
  with AgentPay2Vat1Edit do A2Emp := not R2Emp and Enabled and (Trim(Text) = '');
  with AgentPay2Vat2Edit do A2Emp := A2Emp and Enabled and (Trim(Text) = '');
  // error checking
  if SafeStrToInt(GroupMinDBEdit.Text) > SafeStrToInt(GroupMinDBEdit.Text)
    then InputErrorCode := iecGroupMaxLessMin
  else if NChk and (N1Emp and not R1Emp or N2Emp and not R2Emp) 
    then InputErrorCode := iecNetValIsNull
  else if NChk and ((N1v1 < 0) or (N1v2 < 0) or (N2v1 < 0) or (N2v2 < 0))
    then InputErrorCode := iecNetValLessZero
  else if R1Emp and R2Emp then InputErrorCode := iecRateIsNull    
  else if not R1Emp and (
        not CheckVatIsNull(RateVat1Edit, Vat1PercComboBox)
        or not CheckVatIsNull(RateVat2Edit, Vat2PercComboBox)
        or not CheckVatPerc(Vat1PercComboBox, Vat2PercComboBox))
      or not R2Emp and (
        not CheckVatIsNull(Rate2Vat1Edit, Vat1Perc2ComboBox)
        or not CheckVatIsNull(Rate2Vat2Edit, Vat2Perc2ComboBox)
        or not CheckVatPerc(Vat1Perc2ComboBox, Vat2Perc2ComboBox))
    then InputErrorCode := iecSilentError
  else if NChk and ((R1v1 < N1v1) or (R1v2 < N1v2) or (R2v1 < N2v1) or (R2v2 < N2v2))
    then InputErrorCode := iecRateLessNet
  else if (R1v1 < 0) or (R1v2 < 0) or (R2v1 < 0) or (R2v2 < 0)
    then InputErrorCode := iecRateLessZero
  else if (A1v1 > R1v1) or (A1v2 > R1v2) or (A2v1 > R2v1) or (A2v2 > R2v2)
    then InputErrorCode := iecAgentPayIsMore
  else if (R1v1 = 0) and (R1v2 = 0) and (R2v1 = 0) and (R2v2 = 0)
    and not WarningDlgYN(SZTDlgWarningRateZero)
  then begin
    ActiveControl := RateVat2Edit;
    InputErrorCode := iecSilentError;
  end
  else if A1Emp and not WarningDlgYN(SZTDlgWarningAgentPayIsNull) then
  begin
    ActiveControl := AgentPayVat1Edit;
    InputErrorCode := iecSilentError;
  end
  else if A2Emp and not WarningDlgYN(SZTDlgWarningAgentPayIsNull) then
  begin
    ActiveControl := AgentPay2Vat1Edit;
    InputErrorCode := iecSilentError;
  end
  else if (Vat2PercComboBox.ItemId > 0) and (Vat2PercComboBox.ItemId = Vat1PercComboBox.ItemId)
  then begin
    ErrorDlg(SSrvPayDlgErrorVatEqual);
    ActiveControl := Vat2PercComboBox;
    InputErrorCode := iecSilentError;
  end
  else if (Vat2Perc2ComboBox.ItemId > 0) and (Vat2Perc2ComboBox.ItemId = Vat1Perc2ComboBox.ItemId)
  then begin
    ErrorDlg(SSrvPayDlgErrorVatEqual);
    ActiveControl := Vat2Perc2ComboBox;
    InputErrorCode := iecSilentError;
  end
  else if (not N2Emp or not R2Emp) and (SelRateCurrId = 0)
    then InputErrorCode := iecCurrencyIsNull
  else inherited;
end;

function TZServDataDialog.GetComboBox(const Index: Integer): TAzComboBox;
begin
  case Index of
    1: Result := RateCurrComboBox;
    2: Result := VendorComboBox;
  else Result := nil;
  end;
end;

function TZServDataDialog.GetComboId(const Index: Integer): Integer;
begin
  Result := GetComboBoxId(GetComboBox(Index));
end;

procedure TZServDataDialog.GetComboField(Combo: TCustomComboBox;
  const FieldName: String);
begin
  GetComboFieldValue(Combo, EditDataSet.FieldByName(FieldName));
end;

function TZServDataDialog.GetDate(const Index: Integer): TDateTime;
begin
  Result := 0;
end;

function TZServDataDialog.GetDayCount: Integer;
begin
  Result := 0;
end;

procedure TZServDataDialog.LoadData;
var IsGrp: Boolean;
begin
  BeginDayEdit.Value := EditDataSet.FieldByName('BEGINDAY').AsInteger;
  GetComboField(VendorComboBox, 'VENDORID');
  LoadGratisFields;
  GetComboField(RateCurrComboBox, 'RATECURRID');
  with EditDataSet.FieldByName('PeriodType') do 
  if not IsNull then begin
    ExactRadioBtn.Checked := AsInteger = nExactDate;
    RelativeRadioBtn.Checked := EditDataSet.FieldByName('PeriodType').AsInteger = nRelativeDate;
  end else RelativeRadioBtn.Checked := True;
  ToggleGroupControls(PeriodGroupBox, Length(Periods) = 1);
  IsGrp := GetIsGroupTemplate;
  if IsGrp then LoadGroupData;
  ToggleGroupTemplate(IsGrp);
  with HiddenDBCheckBox do if Field.IsNull then Checked := False;
  with DisabledDBCheckBox do if Field.IsNull then Checked := False;
  with NetCheckDBCheckBox do if Field.IsNull then Checked := True;
end;

procedure TZServDataDialog.LoadGroupData;
begin
end;

procedure TZServDataDialog.SetComboField(Combo: TCustomComboBox;
  const FieldName: String);
begin
  SetComboFieldValue(Combo, EditDataSet.FieldByName(FieldName));
end;

procedure TZServDataDialog.SetDate(const Index: Integer; const Value: TDateTime);
begin
end;

procedure TZServDataDialog.SetDayCount(const Value: Integer);
begin
end;

procedure TZServDataDialog.StoreData;
begin
  EditDataSet.FieldByName('BEGINDAY').AsInteger := BeginDayEdit.Value;
  with EditDataSet.FieldByName('PERIODTYPE') do
  if ExactRadioBtn.Checked then AsInteger := nExactDate else AsInteger := nRelativeDate;
  if (NetCost2Vat1Edit.Text = '') and (NetCost2Vat1Edit.Text = '')
    and (Rate2Vat1Edit.Text = '') and (Rate2Vat2Edit.Text = '')
  then RateCurrComboBox.ItemIndex := -1;
  SetComboField(VendorComboBox, 'VENDORID');
  StoreGratisFields;
  SetComboField(RateCurrComboBox, 'RATECURRID');
  StoreAgentFields;
  StoreVatFields;
  
{  with EditDataSet do
  begin
    if (ForPayText.Text = EmptyStr) then
    begin
      FieldByName('RATE').Clear;
      FieldByName('NETVAL').Clear;
    end
    else begin
      FieldByName('RATE').Value :=
        RateVat1DBEdit.Field.AsFloat + RateVat2DBEdit.Field.AsFloat;
      FieldByName('NETVAL').Value :=
        NetCostVat1DBEdit.Field.AsFloat + NetCostVat2DBEdit.Field.AsFloat;
    end;
    if ForPay2DBText.Field.IsNull then
    begin
      FieldByName('RATE2').Clear;
      FieldByName('NETVAL2').Clear;
    end
    else begin
      FieldByName('RATE2').Value :=
        Rate2Vat1DBEdit.Field.AsFloat + Rate2Vat2DBEdit.Field.AsFloat;
      FieldByName('NETVAL2').Value :=
        NetCost2Vat1DBEdit.Field.AsFloat + NetCost2Vat2DBEdit.Field.AsFloat;
    end;
  end;      }
  if GetIsGroupTemplate then StoreGroupData;
  StoreRates;
end;

procedure TZServDataDialog.StoreGroupData;
begin
end;

procedure TZServDataDialog.ToggleGroupTemplate(IsGroup: Boolean);
begin
end;

procedure TZServDataDialog.FormCreate(Sender: TObject);
begin
  inherited;
  FActivation := True;
  LegalFrom := Now;
  FMinPeriod := 0;
  MemoFieldName := 'MEMO';
  PrepareCurrencyQry;
  with RateCurrComboBox do
  begin
    DataFieldToStrings(SelCurrQryCURRENCYSHORT, SelCurrQryCURRENCYID, Items);
    RateComboBox.ItemIndex := 0;
  end;
  with Vat1PercComboBox do
  begin
    PrepareVatCombo(Items, True);
    Vat1Perc2ComboBox.Items.Assign(Items);
  end;
  with Vat2PercComboBox do
  begin
    PrepareVatCombo(Items, False);
    Vat2Perc2ComboBox.Items.Assign(Items);
  end;
  UpdateQuery(DM.VatQuery);
  with EditDataSet do
  begin
{    FVat1PayField := FieldByName('V1_PAY') as TFloatField;
    FVat2PayField := FieldByName('V2_PAY') as TFloatField;
    FVat1Pay2Field := FieldByName('V1_PAY2') as TFloatField;
    FVat2Pay2Field := FieldByName('V2_PAY2') as TFloatField;}
    FVat1PercField := FieldByName('V1_VATPERC') as TFloatField;
    FVat2PercField := FieldByName('V2_VATPERC') as TFloatField;
    FVat1Perc2Field := FieldByName('V1_VATPERC2') as TFloatField;
    FVat2Perc2Field := FieldByName('V2_VATPERC2') as TFloatField;
{    FVat1VatField := FieldByName('V1_VAT') as TFloatField;
    FVat2VatField := FieldByName('V2_VAT') as TFloatField;
    FVat1Vat2Field := FieldByName('V1_VAT2') as TFloatField;
    FVat2Vat2Field := FieldByName('V2_VAT2') as TFloatField;}
  end;
end;

procedure TZServDataDialog.FormActivate(Sender: TObject);
begin
  inherited;
  FBrServiceId := EditDataSet.FieldByName(BrowseKeyField).AsInteger;
  LoadData;
  FActivation := False;
  AgeTabControl.TabIndex := 0;
  PeriodTabControl.TabIndex := 0;
end;

procedure TZServDataDialog.BeginDayEditChange(Sender: TObject);
begin
  if GetIsGroupTemplate then
  begin
    FromDate := DM.TemplQryTOURDATE.Value + BeginDayEdit.Value - 1;
    DayCountEditChange(nil);
  end;
end;

procedure TZServDataDialog.DayCountEditChange(Sender: TObject);
begin
  if DayCount <= 0 then TillDate := FromDate
  else TillDate := FromDate + DayCount - 1;
end;

procedure TZServDataDialog.GratisCheckBoxClick(Sender: TObject);
begin
  ToggleGroupControls(GratisGroupBox, GratisCheckBox.Checked);
end;

procedure TZServDataDialog.RateCurrComboBoxChange(Sender: TObject);
begin
  ForPay2Label.Caption := Format(SSrvPayDlgPay2Label, [RateCurrComboBox.Text]);
  Total2VatLabel.Caption := Format(SSrvPayDlgPay2Label, [RateCurrComboBox.Text]);
end;

procedure TZServDataDialog.Vat1PercComboBoxClick(Sender: TObject);
begin
  CalcVat(Vat1PercComboBox, FVat1Pay, FVat1Vat, FVat1Perc);
  ToggleVat1Fields;
end;

procedure TZServDataDialog.Vat2PercComboBoxClick(Sender: TObject);
begin
  CalcVat(Vat2PercComboBox, FVat2Pay, FVat2Vat, FVat2Perc);
  ToggleVat2Fields;
end;

procedure TZServDataDialog.Vat1Perc2ComboBoxClick(Sender: TObject);
begin
  CalcVat(Vat1Perc2ComboBox, FVat1Pay2, FVat1Vat2, FVat1Perc2);
  ToggleVat1Fields2;
end;

procedure TZServDataDialog.Vat2Perc2ComboBoxClick(Sender: TObject);
begin
  CalcVat(Vat2Perc2ComboBox, FVat2Pay2, FVat2Vat2, FVat2Perc2);
  ToggleVat2Fields2;
end;

procedure TZServDataDialog.RateDBEditChange(Sender: TObject);
begin
  if Active and not FActivation then CalcPayValue1;
end;

procedure TZServDataDialog.Rate2DBEditChange(Sender: TObject);
begin
  if Active and not FActivation then CalcPayValue2;
end;

procedure TZServDataDialog.AgentPayCheckBoxClick(Sender: TObject);
var Agnt: Boolean;
begin
  Agnt := AgentPayCheckBox.Checked;
  ToggleControlEnabled(AgentPercRadioButton, Agnt);
  ToggleControlEnabled(AgentAbsRadioButton, Agnt);
  AgentPercRadioButtonClick(Self);
end;

procedure TZServDataDialog.AgentPay2CheckBoxClick(Sender: TObject);
var Agnt: Boolean;
begin
  Agnt := AgentPay2CheckBox.Checked;
  ToggleControlEnabled(AgentPerc2RadioButton, Agnt);
  ToggleControlEnabled(AgentAbs2RadioButton, Agnt);
  AgentPerc2RadioButtonClick(Self);
end;

procedure TZServDataDialog.AgentPercRadioButtonClick(Sender: TObject);
var PercOn: Boolean;
begin
  PercOn := AgentPercRadioButton.Checked;
  ToggleAgentPayPerc(
    AgentPayCheckBox.Checked, PercOn, Vat1PercComboBox.ItemId > 0,
    AgentPercVat1Edit, AgentPayVat1Edit);
  ToggleAgentPayPerc(
    AgentPayCheckBox.Checked, PercOn, Vat2PercComboBox.ItemId > 0,
    AgentPercVat2Edit, AgentPayVat2Edit);
  CalcAgentPerc(PercOn, RateVat1Edit, AgentPayVat1Edit, AgentPercVat1Edit);
  CalcAgentPerc(PercOn, RateVat2Edit, AgentPayVat2Edit, AgentPercVat2Edit);
  CalcPayValue1;
end;

procedure TZServDataDialog.AgentPerc2RadioButtonClick(Sender: TObject);
var PercOn: Boolean;
begin
  PercOn := AgentPerc2RadioButton.Checked;
  ToggleAgentPayPerc(
    AgentPay2CheckBox.Checked, PercOn, Vat1Perc2ComboBox.ItemId > 0,
    AgentPerc2Vat1Edit, AgentPay2Vat1Edit);
  ToggleAgentPayPerc(
    AgentPay2CheckBox.Checked, PercOn, Vat2Perc2ComboBox.ItemId > 0,
    AgentPerc2Vat2Edit, AgentPay2Vat2Edit);
  CalcAgentPerc(PercOn, Rate2Vat1Edit, AgentPay2Vat1Edit, AgentPerc2Vat1Edit);
  CalcAgentPerc(PercOn, Rate2Vat2Edit, AgentPay2Vat2Edit, AgentPerc2Vat2Edit);
  CalcPayValue2;
end;

procedure TZServDataDialog.AgentPercDBEditChange(Sender: TObject);
begin
  if ActiveControl = Sender then
  begin
    if ActiveControl.Enabled then
    begin
      if ActiveControl = AgentPercVat1Edit then
        CalcAgentPay(RateVat1Edit, AgentPayVat1Edit, AgentPercVat1Edit)
      else
        CalcAgentPay(RateVat2Edit, AgentPayVat2Edit, AgentPercVat2Edit);
      CalcPayValue1;
    end;
  end;
end;

procedure TZServDataDialog.AgentPerc2DBEditChange(Sender: TObject);
begin
  if ActiveControl = Sender then
  begin
    if ActiveControl.Enabled then
    begin
      if ActiveControl = AgentPerc2Vat1Edit then
        CalcAgentPay(Rate2Vat1Edit, AgentPay2Vat1Edit, AgentPerc2Vat1Edit)
      else
        CalcAgentPay(Rate2Vat2Edit, AgentPay2Vat2Edit, AgentPerc2Vat2Edit);
      CalcPayValue2;
    end;
  end;
end;

procedure TZServDataDialog.AgentPayDBEditChange(Sender: TObject);
begin
  if ActiveControl = Sender then CalcPayValue1;
end;

procedure TZServDataDialog.AgentPay2DBEditChange(Sender: TObject);
begin
  if ActiveControl = Sender then CalcPayValue2;
end;

procedure TZServDataDialog.AgentWhoRadioButtonClick(Sender: TObject);
begin
  CalcPayValue1;
end;

procedure TZServDataDialog.AgentWho2RadioButtonClick(Sender: TObject);
begin
  CalcPayValue2;
end;

procedure TZServDataDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if ModalResult = mrOk then 
  begin 
    StoreData;
    SetLength(FRates, 0, 0);
  end 
  else if CanClose and FIsChanged then
  case WarningFmtDlg(AskBeforeClose,[Caption]) of
    mrYes : StoreData;
    mrCancel : CanClose := false;
  end;  
end;

procedure TZServDataDialog.ToggleAgentPayPerc(AgntOn, PercOn,
  VatOn: Boolean; PercEdit, PayEdit: TAzEdit);
begin
  ToggleControlEnabled(PercEdit, VatOn and AgntOn and PercOn);
  ToggleControlEnabled(PayEdit, VatOn and AgntOn and not PercOn);
end;

procedure TZServDataDialog.LoadServRates;
begin
  UpdateSelAgeQry;
  UpdateSelPeriodQry;
  UpdateTourRates;
end;

procedure TZServDataDialog.UpdateSelAgeQry;
begin
  UpdateRateQry(SelAgeQry);
  FillAges;
end;

function TZServDataDialog.GetBrServKindId: Integer;
begin
  Result := FBrServKindId;
end;

function TZServDataDialog.GetBrServiceId: Integer;
begin
  Result := FBrServiceId;
end;

procedure TZServDataDialog.UpdateSelPeriodQry;
begin
  MakePeriodQuery;
  UpdateRateQry(SelPeriodQry);
  FillPeriods;
end;

procedure TZServDataDialog.UpdateTourRates;
begin
  MakeRateQuery;
  UpdateRateQry(SelTourRatesQry);
  FillRates;
end;

procedure TZServDataDialog.UpdateRateQry(aQuery: TQuery);
begin
  with aQuery do
  begin
    Close;
    ParamByName('ServKindId').Value := BrServKindId;
    ParamByName('ServiceId').Value := BrServiceId;
    SetQueryParam(Params.FindParam('PeriodType'), ftInteger, TypePeriodArr[RelativeDate]);
    Open;
  end;
end;

procedure TZServDataDialog.FillRates;
var 
  AgeLengthArr, PeriodLengthArr, I, J: Integer;
  AgeId: Integer;
begin
  AgeLengthArr := SelAgeQry.RecordCount;
  PeriodLengthArr := SelPeriodQry.RecordCount;
  if AgeLengthArr = 0 then AgeLengthArr := 1;
  if PeriodLengthArr = 0 then PeriodLengthArr := 1;
  SetLength(FRates, AgeLengthArr, PeriodLengthArr);
  for i := 0 to AgeLengthArr - 1 do
   for j := 0 to PeriodLengthArr - 1 do
   FillRatesRec(i, j, True);
  AgeId := SelTourRatesQryAGEID.Value;  
  I := 0;
  J := 0;
  with SelTourRatesQry do 
  while not Eof do
  begin
    if AgeId <> SelTourRatesQryAGEID.Value then 
    begin 
      Inc(I); J := 0; 
      AgeId := SelTourRatesQryAGEID.Value;
    end;    
    FillRatesRec(i, j);
    Inc(J);
    Next;
  end;
  FillRecords;
end;                                                   

procedure TZServDataDialog.FillRatesRec(i, j: Integer; SetNull: Boolean = False);
begin
  with FRates[I, J] do
  begin
    RateId := IfThen(SetNull, -1, SelTourRatesQryTOURRATEID.AsInteger);
    If SetNull Then V1_Rate := null else V1_Rate := SelTourRatesQryV1_RATE.AsVariant;
    If SetNull Then V1_AgentPay := null else V1_AgentPay := SelTourRatesQryV1_AGENTPAY.AsVariant;
    If SetNull Then V1_NetVal := null else V1_NetVal := SelTourRatesQryV1_NETVAL.AsVariant;
    If SetNull Then V2_Rate := null else V2_Rate := SelTourRatesQryV2_RATE.AsVariant;  
    If SetNull Then V2_AgentPay := null else V2_AgentPay := SelTourRatesQryV2_AGENTPAY.AsVariant;
    If SetNull Then V2_NetVal := null else V2_NetVal := SelTourRatesQryV2_NETVAL.AsVariant;
    If SetNull Then V1_Rate2 := null else V1_Rate2 := SelTourRatesQryV1_RATE2.AsVariant;
    If SetNull Then V1_AgentPay2 := null else V1_AgentPay2 := SelTourRatesQryV1_AGENTPAY2.AsVariant;
    If SetNull Then V1_NetVal2 := null else V1_NetVal2 := SelTourRatesQryV1_NETVAL2.AsVariant;
    If SetNull Then V2_Rate2 := null else V2_Rate2 := SelTourRatesQryV2_RATE2.AsVariant;
    If SetNull Then V2_AgentPay2 := null else V2_AgentPay2 := SelTourRatesQryV2_AGENTPAY2.AsVariant;
    If SetNull Then V2_NetVal2 := null else V2_NetVal2 := SelTourRatesQryV2_NETVAL2.AsVariant;
    AgentAbs := not VarIsNull(V1_AgentPay) or not VarIsNull(V2_AgentPay);
    AgentAbs2 := not VarIsNull(V1_AgentPay2) or not VarIsNull(V2_AgentPay2);
  end;
end;

procedure TZServDataDialog.TabControlChange(Sender: TObject);
begin
  inherited;
  if FRates <> nil then FillRecords;
end;

procedure TZServDataDialog.FillRecords;
var I, J: Integer;
begin
  I := AgeTabControl.TabIndex;
  J := PeriodTabControl.TabIndex;
  if (I < 0) or (J < 0) then Exit;
  with NetCostVat1Edit do if VarIsNull(FRates[I, J].V1_NetVal) then Text := EmptyStr
  else Text := FormatFloat('#0.00', FRates[I, J].V1_NetVal);
  with NetCostVat2Edit do if VarIsNull(FRates[I, J].V2_NetVal) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V2_NetVal);
  with RateVat1Edit do if VarIsNull(FRates[I, J].V1_Rate) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V1_Rate);
  with RateVat2Edit do if VarIsNull(FRates[I, J].V2_Rate) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V2_Rate);
  with AgentPayVat1Edit do if VarIsNull(FRates[I, J].V1_AgentPay) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V1_AgentPay);
  with AgentPayVat2Edit do if VarIsNull(FRates[I, J].V2_AgentPay) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V2_AgentPay);
  with NetCost2Vat1Edit do if VarIsNull(FRates[I, J].V1_NetVal2) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V1_NetVal2);
  with NetCost2Vat2Edit do if VarIsNull(FRates[I, J].V2_NetVal2) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V2_NetVal2);
  with Rate2Vat1Edit do if VarIsNull(FRates[I, J].V1_Rate2) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V1_Rate2);     
  with Rate2Vat2Edit do if VarIsNull(FRates[I, J].V2_Rate2) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V2_Rate2);
  with AgentPay2Vat1Edit do if VarIsNull(FRates[I, J].V1_AgentPay2) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V1_AgentPay2);
  with AgentPay2Vat2Edit do if VarIsNull(FRates[I, J].V2_AgentPay2) then Text := EmptyStr  
  else Text := FormatFloat('#0.00', FRates[I, J].V2_AgentPay2);
  FVat1Pay := null;
  FVat2Pay := null;
  FVat1Pay2 := null;
  FVat2Pay2 := null;
  FVat1Vat := null;
  FVat2Vat := null;
  FVat1Vat2 := null;
  FVat2Vat2 := null;   
  LoadAgentFields(I, J);  
end;

procedure TZServDataDialog.TabControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if FRates <> nil then SaveRates;
end;

procedure TZServDataDialog.SaveRates;
var I, J: Integer;
begin
  I := AgeTabControl.TabIndex;
  J := PeriodTabControl.TabIndex;
  with NetCostVat1Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V1_NetVal := null
  else FRates[I, J].V1_NetVal := SafeStrToFloat(Text);
  with NetCostVat2Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V2_NetVal := null
  else FRates[I, J].V2_NetVal := SafeStrToFloat(Text);
  with RateVat1Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V1_Rate := null
  else FRates[I, J].V1_Rate := SafeStrToFloat(Text);
  with RateVat2Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V2_Rate := null
  else FRates[I, J].V2_Rate := SafeStrToFloat(Text);
  with AgentPayVat1Edit do
  if not AgentPayCheckBox.Checked or (Text = EmptyStr) then FRates[I, J].V1_AgentPay := null
  else FRates[I, J].V1_AgentPay := SafeStrToFloat(Text);
  with AgentPayVat2Edit do
  if not AgentPayCheckBox.Checked or (Text = EmptyStr) then FRates[I, J].V2_AgentPay := null
  else FRates[I, J].V2_AgentPay := SafeStrToFloat(Text);

  FRates[I, J].AgentAbs := AgentAbsRadioButton.Checked;

  with NetCost2Vat1Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V1_NetVal2 := null
  else FRates[I, J].V1_NetVal2 := SafeStrToFloat(Text);
  with NetCost2Vat2Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V2_NetVal2 := null
  else FRates[I, J].V2_NetVal2 := SafeStrToFloat(Text);
  with Rate2Vat1Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V1_Rate2 := null
  else FRates[I, J].V1_Rate2 := SafeStrToFloat(Text);
  with Rate2Vat2Edit do
  if not Enabled or (Text = EmptyStr) then FRates[I, J].V2_Rate2 := null
  else FRates[I, J].V2_Rate2 := SafeStrToFloat(Text);
  with AgentPay2Vat1Edit do
  if not AgentPay2CheckBox.Checked or (Text = EmptyStr) then FRates[I, J].V1_AgentPay2 := null
  else FRates[I, J].V1_AgentPay2 := SafeStrToFloat(Text);
  with AgentPay2Vat2Edit do
  if not AgentPay2CheckBox.Checked or (Text = EmptyStr) then FRates[I, J].V2_AgentPay2 := null
  else FRates[I, J].V2_AgentPay2 := SafeStrToFloat(Text);

  FRates[I, J].AgentAbs2 := AgentAbs2RadioButton.Checked;
end;

procedure TZServDataDialog.EditExit(Sender: TObject);
begin
  inherited;
  (Sender as TAzEdit).Refresh;
end;

procedure TZServDataDialog.StoreRates;
const 
  UpdateTourRatesSQL = 'Update TR_Rates Set ' +
    'V1_NetVal = :V1_NetVal, V2_NetVal = :V2_NetVal, ' +
    'V1_Rate = :V1_Rate, V2_Rate = :V2_Rate, ' +
    'V1_AgentPay = :V1_AgentPay, V2_AgentPay = :V2_AgentPay, ' +
    'V1_NetVal2 = :V1_NetVal2, V2_NetVal2 = :V2_NetVal2, ' +
    'V1_Rate2 = :V1_Rate2, V2_Rate2 = :V2_Rate2, ' +
    'V1_AgentPay2 = :V1_AgentPay2, V2_AgentPay2 = :V2_AgentPay2 ' +
    'where TourRateId = :TourRateId ';
  DeleteRatesSQL = 'Delete from TR_Rates R where R.PeriodId in ( ' +
    'Select P.PeriodId from TR_Periods P ' +
    'where P.ServiceId = %d and P.ServKindId = %d ) ';
var I, J, J1, AId, AgeCount, PeriodCount: Integer;
    Finded: Boolean;
    ADelList : TList;
    V1_Rate, V1_AgentPay, V1_NetVal,  
    V2_Rate, V2_AgentPay, V2_NetVal,
    V1_Rate2, V1_AgentPay2, V1_NetVal2,
    V2_Rate2, V2_AgentPay2, V2_NetVal2: string;
begin
  ADelList := TList.Create;
  SaveRates;
  // вилучення тарифів
  StoreRateQry.SQL.Clear;
  StoreRateQry.SQL.Add(Format(DeleteRatesSQL,[BrServiceId, BrServKindId]));
  StoreRateQry.ExecSQL;
  // вилучення видалених вікових категорій з БД
  StoreRateQry.SQL.Clear;
  StoreRateQry.SQL.Add(format('select AgeId from TR_Ages where ServKindId = %d and ServiceID = %d',[BrServKindId, BrServiceId]));
  StoreRateQry.Open;
  StoreRateQry.First;
  for j:=1 to StoreRateQry.RecordCount do
  begin
    AId := Integer(StoreRateQry.FieldValues['AgeId']);
    Finded := False;
    for j1 := 0 to High(Ages) do
     Finded := Finded or (AId = Ages[j1].Id);
    if not Finded then ADelList.Add(Pointer(AId));
    StoreRateQry.Next;
  end;
  StoreRateQry.Close;
  if NewRecord then BrServiceId := GetServiceId;
  for j:=0 to ADelList.Count-1 do
  begin
    StoreRateQry.SQL.Clear;
    StoreRateQry.SQL.Add(format('delete from TR_Ages where AgeID = %d',[Integer(ADelList[j])]));
    StoreRateQry.ExecSQL;
  end;
  // зміна модифікованих вікових категорій в БД
  for j1 := 0 to High(Ages) do
  if Ages[j1].Status = stModified then
  begin
    StoreRateQry.SQL.Clear;
    StoreRateQry.SQL.Add(format('update TR_Ages set NameId = %d, AgeFrom = %d, AgeTill = %s, IsBaseAge = %s where AgeId = %d',
      [Ages[j1].NameId, Ages[j1].From, ifthen(Ages[j1].Till = -1, 'null', intToStr(Ages[j1].Till)), ifthen(Ages[j1].MainAge,'"T"','"F"'), Ages[j1].id]));      
    StoreRateQry.ExecSQL;
    Ages[j1].Status := stUnchanged;
  end;
  // додавання доданих вікових категорій до БД
  for j1 := 0 to High(Ages) do
  if Ages[j1].Status = stInserted then
  begin
    StoreRateQry.SQL.Clear;
    StoreRateQry.SQL.Add('select GEN_ID(GEN_TR_AGES_ID, 1) from rdb$database');
    StoreRateQry.Open;
    AId:=StoreRateQry.Fields[0].AsInteger;
    StoreRateQry.Close;
    StoreRateQry.SQL.Clear;
    StoreRateQry.SQL.Add(format('insert into TR_Ages (AgeId, ServKindId, ServiceId, NameId, AgeFrom, AgeTill, IsBaseAge) ' +
      'values (%d, %d, %d, %d, %d, %s, %s)',[AId, BrServKindId, BrServiceId, Ages[j1].NameId, Ages[j1].From, 
      ifthen(Ages[j1].Till=-1,'null',intToStr(Ages[j1].Till)), 
      ifthen(Ages[j1].MainAge,'"T"','"F"')]));
    StoreRateQry.ExecSQL;
    Ages[j1].Id := AId;
    Ages[j1].Status := stUnchanged;
  end;
  ADelList.Clear; 
  // вилучення видалених сезонів з БД
  StoreRateQry.SQL.Clear;
  StoreRateQry.SQL.Add(format('select PeriodId from TR_Periods where ServKindId = %d and ServiceID = %d',[BrServKindId, BrServiceId]));
  StoreRateQry.Open;
  StoreRateQry.First;
  for j := 1 to StoreRateQry.RecordCount do
  begin
    AId := Integer(StoreRateQry.FieldValues['PeriodId']);
    Finded := false;
    for j1 := 0 to High(Periods) do
      Finded := Finded or (AId = Periods[j1].Id);
    if not Finded then ADelList.Add(Pointer(AId));
    StoreRateQry.Next;
  end;
  StoreRateQry.Close;
  for j:=0 to ADelList.Count-1 do
  begin
    StoreRateQry.SQL.Clear;
    StoreRateQry.SQL.Add(format('delete from TR_Periods where PeriodID = %d', [Integer(ADelList[j])]));
    StoreRateQry.ExecSQL;
  end;
  // зміна модифікованих періодів в БД
  for j1 := 0 to High(Periods) do
    if Periods[j1].Status = stModified then
    begin
      StoreRateQry.SQL.Clear;
      StoreRateQry.SQL.Add(
        format('update TR_Periods '+
               'set Name = %s, '+
               'FromDate = %s, '+
               'TillDate = %s, '+
               'PeriodFrom = %s, '+
               'PeriodTill = %s '+
               'where PeriodId = %d',
          [ifthen(Periods[j1].Name = EmptyStr, 'null', '"' + Periods[j1].Name + '"'),
           ifthen(Periods[j1].FromDate = -1 ,'null', '"' + DateToStr(Periods[j1].FromDate) + '"'),
           ifthen(Periods[j1].TillDate = -1 ,'null', '"' + DateToStr(Periods[j1].TillDate) + '"'),
           ifthen(Periods[j1].PeriodFrom = -1, 'null', IntToStr(Periods[j1].PeriodFrom)),
           ifthen(Periods[j1].PeriodTill = - 1,'null', IntToStr(Periods[j1].PeriodTill)),
           Periods[j1].id]));
      StoreRateQry.ExecSQL;
      Periods[j1].Status := stUnchanged;
    end;
  // додавання доданих сезонів до БД
    for j1 := 0 to High(Periods) do
    if Periods[j1].Status = stInserted then
    begin
      StoreRateQry.SQL.Clear;
      StoreRateQry.SQL.Add('select GEN_ID(GEN_TR_PERIODS_ID,1) from rdb$database');
      StoreRateQry.Open;
      AId:=StoreRateQry.Fields[0].AsInteger;
      StoreRateQry.Close;
      StoreRateQry.SQL.Clear;
      StoreRateQry.SQL.Add(
        format('insert into TR_Periods ('+
          'PeriodId, ServKindId, ServiceId, Name, '+
          'FromDate, TillDate, PeriodFrom, PeriodTill) ' +
          'values (%d, %d, %d, %s, %s, %s, %s , %s)',
          [AId, BrServKindId, BrServiceId, 
           ifthen(Periods[j1].Name = EmptyStr, 'null', '"' + Periods[j1].Name + '"'),
           ifthen(Periods[j1].FromDate = -1 ,'null', '"' + DateToStr(Periods[j1].FromDate) + '"'),
           ifthen(Periods[j1].TillDate = -1 ,'null', '"' + DateToStr(Periods[j1].TillDate) + '"'),
           ifthen(Periods[j1].PeriodFrom = -1, 'null', IntToStr(Periods[j1].PeriodFrom)),
           ifthen(Periods[j1].PeriodTill = - 1,'null', IntToStr(Periods[j1].PeriodTill))]));
      StoreRateQry.ExecSQL;
      Periods[j1].Id := AId;
      Periods[j1].Status := stUnchanged;
    end;
  ADelList.Free;             

  for j:= Low(FRates) to High(FRates) do //вік
   for j1 := Low(FRates[j]) to High(FRates[j]) do //періоди
   begin
     StoreRateQry.SQL.Clear;
     StoreRateQry.SQL.Add(
       'insert into TR_Rates (AgeId, PeriodID, ' +
       'V1_Rate, V1_AgentPay, V1_NetVal, ' +
       'V2_Rate, V2_AgentPay, V2_NetVal, ' +
       'V1_Rate2, V1_AgentPay2, V1_NetVal2, ' +
       'V2_Rate2, V2_AgentPay2, V2_NetVal2) ' );
       V1_Rate := 'NULL';
       V1_AgentPay := 'NULL';
       V1_NetVal := 'NULL';
       V2_Rate := 'NULL';
       V2_AgentPay := 'NULL';
       V2_NetVal := 'NULL';
       V1_Rate2 := 'NULL';
       V1_AgentPay2 := 'NULL';
       V1_NetVal2 := 'NULL';
       V2_Rate2 := 'NULL';
       V2_AgentPay2 := 'NULL';
       V2_NetVal2 := 'NULL';
       if not VarIsNull(Frates[j,j1].V1_Rate) then V1_Rate := AnsiReplaceStr(formatFloat('',Frates[j,j1].V1_Rate),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V1_AgentPay) then V1_AgentPay := AnsiReplaceStr(formatFloat('',Frates[j,j1].V1_AgentPay),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V1_NetVal) then V1_NetVal := AnsiReplaceStr(formatFloat('',Frates[j,j1].V1_NetVal),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V2_Rate) then V2_Rate := AnsiReplaceStr(formatFloat('',Frates[j,j1].V2_Rate),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V2_AgentPay) then V2_AgentPay := AnsiReplaceStr(formatFloat('',Frates[j,j1].V2_AgentPay),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V2_NetVal) then V2_NetVal := AnsiReplaceStr(formatFloat('',Frates[j,j1].V2_NetVal),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V1_Rate2) then V1_Rate2 := AnsiReplaceStr(formatFloat('',Frates[j,j1].V1_Rate2),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V1_AgentPay2) then V1_AgentPay2 := AnsiReplaceStr(formatFloat('',Frates[j,j1].V1_AgentPay2),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V1_NetVal2) then V1_NetVal2 := AnsiReplaceStr(formatFloat('',Frates[j,j1].V1_NetVal2),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V2_Rate2) then V2_Rate2 := AnsiReplaceStr(formatFloat('',Frates[j,j1].V2_Rate2),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V2_AgentPay2) then V2_AgentPay2 := AnsiReplaceStr(formatFloat('',Frates[j,j1].V2_AgentPay2),DecimalSeparator, BDEDecimalSeparator);
       if not VarIsNull(Frates[j,j1].V2_NetVal2) then V2_NetVal2 := AnsiReplaceStr(formatFloat('',Frates[j,j1].V2_NetVal2),DecimalSeparator, BDEDecimalSeparator);

     StoreRateQry.SQL.Add(format(
       'values (%d, %d, '+
       '%s, %s, %s, '+
       '%s, %s, %s, '+
       '%s, %s, %s, '+
       '%s, %s, %s )',
        [Ages[j].Id, Periods[j1].Id,          
         V1_Rate, V1_AgentPay, V1_NetVal,
         V2_Rate, V2_AgentPay, V2_NetVal,
         V1_Rate2, V1_AgentPay2, V1_NetVal2,
         V2_Rate2, V2_AgentPay2, V2_NetVal2]));
     StoreRateQry.ExecSQL;     
   end;


(*  if not NewRecord then 
  with DM.WorkQry do 
  begin
    Close;
    SQL.Text := UpdateTourRatesSQL;
    AgeCount := Length(Ages);
    PeriodCount := Length(Periods);    
    for I := 0 to AgeCount - 1 do
     for J := 0 to PeriodCount - 1 do      
     with FRates[I, J] do
      begin
        ParamByName('TourRateId').Value := RateId;
        if VarIsNull(V1_NetVal) then ParamByName('V1_NetVal').DataType := ftFloat
        else ParamByName('V1_NetVal').Value := V1_NetVal;
        if VarIsNull(V2_NetVal) then ParamByName('V2_NetVal').DataType := ftFloat
        else ParamByName('V2_NetVal').Value := V2_NetVal;
        if VarIsNull(V1_Rate) then ParamByName('V1_Rate').DataType := ftFloat
        else ParamByName('V1_Rate').Value := V1_Rate;
        if VarIsNull(V2_Rate) then ParamByName('V2_Rate').DataType := ftFloat
        else ParamByName('V2_Rate').Value := V2_Rate;
        if VarIsNull(V1_AgentPay) then ParamByName('V1_AgentPay').DataType := ftFloat
        else ParamByName('V1_AgentPay').Value := V1_AgentPay;
        if VarIsNull(V2_AgentPay) then ParamByName('V2_AgentPay').DataType := ftFloat
        else ParamByName('V2_AgentPay').Value := V2_AgentPay;
        if VarIsNull(V1_NetVal2) then ParamByName('V1_NetVal2').DataType := ftFloat
        else ParamByName('V1_NetVal2').Value := V1_NetVal2;
        if VarIsNull(V2_NetVal2) then ParamByName('V2_NetVal2').DataType := ftFloat
        else ParamByName('V2_NetVal2').Value := V2_NetVal2;
        if VarIsNull(V1_Rate2) then ParamByName('V1_Rate2').DataType := ftFloat
        else ParamByName('V1_Rate2').Value := V1_Rate2;
        if VarIsNull(V2_Rate2) then ParamByName('V2_Rate2').DataType := ftFloat
        else ParamByName('V2_Rate2').Value := V2_Rate2;
        if VarIsNull(V1_AgentPay2) then ParamByName('V1_AgentPay2').DataType := ftFloat
        else ParamByName('V1_AgentPay2').Value := V1_AgentPay2;
        if VarIsNull(V2_AgentPay2) then ParamByName('V2_AgentPay2').DataType := ftFloat
        else ParamByName('V2_AgentPay2').Value := V2_AgentPay2;
        ExecSQL;
        SelTourRatesQry.Next;
      end;
  end;  *)
end;


procedure TZServDataDialog.PeriodBtnClick(Sender: TObject);
begin
  inherited;
  AdjustPeriods;
  ToggleGroupControls(PeriodGroupBox, Length(Periods) = 1);
end;                              

procedure TZServDataDialog.AdjustPeriods;
var i : integer;
begin
  with TForm_HeaderConfig.Create(Application) do
  try
    if RelativeDate then Caption := 'Періоди' else Caption := 'Точні дати';
    CheckTreeView_Items.Items.Clear;
    CheckTreeView_Items.CheckBoxesAlowed := False;
    setLength(FTreeViewItems,High(Periods) + 1);
    FVisibilityTreeView := CheckTreeView_Items;
    for i := Low(Periods) to High(Periods) do
      FTreeViewItems[i] := CheckTreeView_Items.Items.Add(nil, PeriodName(Periods[i], I = High(Periods)));
    CheckTreeView_Items.ShowRoot := False;
    CheckTreeView_Items.CheckBoxesAlowed := True;
    Action_Add.Visible := False;
    if RelativeDate then Action_Modify.OnExecute := ModifyPeriods
    else Action_Modify.OnExecute := ModifyExactDate;
    Action_Remove.Visible := False;
    Action_Apply.OnExecute := ApplyPeriods;
    // відобразити на екрані
    ShowModal;
  finally
    setLength(FTreeViewItems,0);
    FVisibilityTreeView:=nil;
    Free;
  end; 
end;

function TZServDataDialog.PeriodName(ARange : TRatePeriodData; IsFirst: Boolean) : string;
const DateTimeFormatStr = 'dd.mm.yyyy';
      MorePeriod = '%d %s і більше';
      LessPeriod = 'Менше %d тижнів';
begin
  Result := EmptyStr;
  if RelativeDate then 
  begin
    Result := Format(MorePeriod , [ARange.PeriodFrom, ChangeDayLabel(ARange.PeriodFrom, 2)]);
    if IsFirst and (ARange.PeriodTill > 0) and (ARange.PeriodFrom = 0) 
    then Result := Format(LessPeriod, [ARange.PeriodTill])
  end else 
  begin
    if ARange.FromDate <> -1 then Result := FormatDateTime(DateTimeFormatStr, ARange.FromDate) + ' - '
    else Result := 'від початку тарифу - ';
    if ARange.TillDate <> -1 then
      Result := Result + FormatDateTime(DateTimeFormatStr, ARange.TillDate)
    else Result := Result + 'до початку туру';
  end;
  if ARange.Name <> EmptyStr then Result := ARange.Name;// + ':' + Result;
end;

procedure TZServDataDialog.ApplyPeriods(Sender: TObject);
begin
//  ShowMessage('Дана фіча поки не працює.');
end;

procedure TZServDataDialog.ModifyPeriods(Sender: TObject);
var i, j, insertedIndex, NewItemsCount, l1, l2, LastPeriod: integer;
    NewPeriodsArray : TRatePeriods;
    NewDataArray : TTypeRateArr;
begin
  with TForm_EditPeriodRanges.Create(Application) do
  try    
    MinPeriod := FMinPeriod;
    InsertedIndex := 0;
    SetLength(PeriodRangesArray, 0);
    LastPeriod := High(Periods);
    if Periods[LastPeriod].PeriodFrom > 0 then
    begin
      SetLength(PeriodRangesArray, Length(PeriodRangesArray) + 1);
      PeriodRangesArray[InsertedIndex].PeriodFrom := 0;
      PeriodRangesArray[InsertedIndex].PeriodTill := Periods[LastPeriod].PeriodFrom;
      PeriodRangesArray[InsertedIndex].FromDate := -1;
      PeriodRangesArray[InsertedIndex].TillDate := -1;
      PeriodRangesArray[InsertedIndex].TillRestricted := True;
      PeriodRangesArray[InsertedIndex].Id := -1;
      PeriodRangesArray[InsertedIndex].Modified := False;
      PeriodRangesArray[InsertedIndex].Hole := True;
      PeriodRangesArray[InsertedIndex].Marker := EmptyStr;
      inc(InsertedIndex);
    end;

    for i := High(Periods) downto low(Periods) do
    begin
      SetLength(PeriodRangesArray, Length(PeriodRangesArray) + 1);
      PeriodRangesArray[InsertedIndex].FromDate := DateOf(Periods[i].FromDate);
      PeriodRangesArray[InsertedIndex].TillDate := DateOf(Periods[i].TillDate);
      PeriodRangesArray[InsertedIndex].PeriodFrom := Periods[i].PeriodFrom;
      PeriodRangesArray[InsertedIndex].PeriodTill := Periods[i].PeriodTill;
      if Periods[i].PeriodTill = -1 then
        PeriodRangesArray[InsertedIndex].TillRestricted := False
      else PeriodRangesArray[InsertedIndex].TillRestricted := True;
      PeriodRangesArray[InsertedIndex].Id := i;
      PeriodRangesArray[InsertedIndex].Modified := False;
      PeriodRangesArray[InsertedIndex].Hole := False;
      PeriodRangesArray[InsertedIndex].Marker := Periods[i].Name;
      inc(InsertedIndex);
      // додати проміжок, якщо він є між сезонами і дана категорія не є останньою
{      if  (I < High(Periods)) and (DateOf(Periods[i+1].FromDate) - DateOf(Periods[i].TillDate) > 1) then
      begin
        setLength(PeriodRangesArray,Length(PeriodRangesArray)+1);
        PeriodRangesArray[InsertedIndex].FromDate := PeriodRangesArray[InsertedIndex-1].TillDate + 1;
        PeriodRangesArray[InsertedIndex].TillDate := Periods[i+1].FromDate - 1;
        PeriodRangesArray[InsertedIndex].TillRestricted := True;
        PeriodRangesArray[InsertedIndex].Id:=-1;
        PeriodRangesArray[InsertedIndex].Modified:=false;
        PeriodRangesArray[InsertedIndex].Hole := True;
        PeriodRangesArray[InsertedIndex].Marker := EmptyStr;
        inc(InsertedIndex);
      end;  }
    end;
    // якщо останній діапазон є закритим додати відкриту діру
    if PeriodRangesArray[InsertedIndex-1].TillRestricted then
    begin
      setLength(PeriodRangesArray,length(PeriodRangesArray)+1);
      PeriodRangesArray[InsertedIndex].PeriodFrom := PeriodRangesArray[InsertedIndex-1].PeriodTill;// + 1;
      PeriodRangesArray[InsertedIndex].PeriodTill := MaxInt;      
      PeriodRangesArray[InsertedIndex].FromDate := -1;
      PeriodRangesArray[InsertedIndex].TillDate := -1;
      PeriodRangesArray[InsertedIndex].TillRestricted := False;
      PeriodRangesArray[InsertedIndex].Id := -1;
      PeriodRangesArray[InsertedIndex].Modified := False;
      PeriodRangesArray[InsertedIndex].Hole := True;
      PeriodRangesArray[InsertedIndex].Marker := EmptyStr;
    end;     

    if ShowModal = mrOk then
    begin
      NewItemsCount := 0;
      for i:=0 to High(PeriodRangesArray) do // визначити нову довжину масиву
        if not PeriodRangesArray[i].Hole then inc(NewItemsCount);
      // переставляємо елементи на їх нові місця
      SetLength(NewPeriodsArray,0);
      SetLength(NewPeriodsArray,NewItemsCount);
      l1 := 0;
//      for i:= Low(PeriodRangesArray) to High(PeriodRangesArray) do 
      for i:= High(PeriodRangesArray) downto Low(PeriodRangesArray) do 
        if (not PeriodRangesArray[i].Hole) then
        begin
          if PeriodRangesArray[i].Id <> -1 then
          begin
            NewPeriodsArray[l1] := Periods[PeriodRangesArray[i].Id];
            NewPeriodsArray[l1].Name := PeriodRangesArray[i].Marker;
            NewPeriodsArray[l1].FromDate := PeriodRangesArray[i].FromDate;
            NewPeriodsArray[l1].PeriodFrom := PeriodRangesArray[i].PeriodFrom;
            NewPeriodsArray[l1].Status := Periods[PeriodRangesArray[i].Id].Status;
            if PeriodRangesArray[i].TillRestricted 
            then begin 
              NewPeriodsArray[l1].TillDate := PeriodRangesArray[i].TillDate;
              NewPeriodsArray[l1].PeriodTill := PeriodRangesArray[i].PeriodTill;
            end else begin 
              NewPeriodsArray[l1].TillDate := -1;
              NewPeriodsArray[l1].PeriodTill := -1;
            end;
            if (NewPeriodsArray[l1].Name <> Periods[PeriodRangesArray[i].Id].Name) or
               (NewPeriodsArray[l1].FromDate <> DateOf(Periods[PeriodRangesArray[i].Id].FromDate)) or
               (NewPeriodsArray[l1].TillDate <> DateOf(Periods[PeriodRangesArray[i].Id].TillDate)) or
               (NewPeriodsArray[l1].PeriodFrom <> Periods[PeriodRangesArray[i].Id].PeriodFrom) or 
               (NewPeriodsArray[l1].PeriodTill <> Periods[PeriodRangesArray[i].Id].PeriodTill)
            then
            begin
              if NewPeriodsArray[l1].Status <> stInserted 
              then NewPeriodsArray[l1].Status := stModified;
              FIsChanged := True;
            end;
          end
          else
          begin
            FIsChanged := True;
            NewPeriodsArray[l1].Name := PeriodRangesArray[i].Marker;
            NewPeriodsArray[l1].Status := stInserted;
            NewPeriodsArray[l1].Id := -1;
            NewPeriodsArray[l1].FromDate := PeriodRangesArray[i].FromDate;
            NewPeriodsArray[l1].PeriodFrom := PeriodRangesArray[i].PeriodFrom;
            if PeriodRangesArray[i].TillRestricted 
            then begin 
              NewPeriodsArray[l1].TillDate := PeriodRangesArray[i].TillDate;
              NewPeriodsArray[l1].PeriodTill := PeriodRangesArray[i].PeriodTill;
            end else begin 
              NewPeriodsArray[l1].TillDate := -1;
              NewPeriodsArray[l1].PeriodTill := -1;
            end;
          end;
          inc(l1);
        end;
      Periods := NewPeriodsArray;
      //Заповнюємо тарифи
      for j:= 0 to High(Ages) do
        begin
          //встановлюємо розмірності нового масиву
          SetLength(NewDataArray,0);
          SetLength(NewDataArray,NewItemsCount);
          for l1:=0 to High(NewDataArray) do
          begin
            NewDataArray[l1].V1_Rate := null;
            NewDataArray[l1].V1_AgentPay := null;
            NewDataArray[l1].V1_NetVal := null;
            NewDataArray[l1].V2_Rate := null;
            NewDataArray[l1].V2_AgentPay := null;
            NewDataArray[l1].V2_NetVal := null;
            NewDataArray[l1].V1_Rate2 := null;
            NewDataArray[l1].V1_AgentPay2 := null;
            NewDataArray[l1].V1_NetVal2 := null;
            NewDataArray[l1].V2_Rate2 := null;
            NewDataArray[l1].V2_AgentPay2 := null;
            NewDataArray[l1].V2_NetVal2 := null;
          end;
          l2 := 0;
          for l1 := High(PeriodRangesArray) downto 0 do // копіювання даних з основного масиву відповідно до змін періодів
            if (not PeriodRangesArray[l1].Hole) then
            begin
              if PeriodRangesArray[l1].Id <> -1 then
                NewDataArray[l2] := FRates[j, PeriodRangesArray[l1].Id];
              inc(l2);
            end;
          FRates[j]:=NewDataArray;
        end;
      RateRefresh; // відтворити тариф

      FVisibilityTreeView.Items.Clear;
      FVisibilityTreeView.CheckBoxesAlowed := False;
      setLength(FTreeViewItems,High(Periods) + 1);
      for i:=0 to High(Periods) do
      begin
        FTreeViewItems[i] := FVisibilityTreeView.Items.Add(nil,PeriodName(Periods[i], I = High(Periods)));
        FTreeViewItems[i].StateIndex:=2;
      end;
      FVisibilityTreeView.ShowRoot := False;
      FVisibilityTreeView.CheckBoxesAlowed := True;      
    end;
  finally
    Free;
  end;
end;

procedure TZServDataDialog.FillPeriods;
var I, RecCount: Integer;
begin
  I := 0;
  SetLength(Periods, 0);
  RecCount := SelPeriodQry.RecordCount;
  if RecCount > 0 then begin
    SetLength(Periods, RecCount);
    for I := Low(Periods) to High(Periods) do
    begin
      Periods[I].Name := SelPeriodQryNAME.Value;
      Periods[I].Id := SelPeriodQryPERIODID.Value;
      with SelPeriodQryFROMDATE do Periods[I].FromDate := IfThen(IsNull or RelativeRadioBtn.Checked, -1, AsdateTime);
      with SelPeriodQryTILLDATE do Periods[I].TillDate := IfThen(IsNull or RelativeRadioBtn.Checked, -1, AsdateTime);
      with SelPeriodQryPERIODFROM do Periods[I].PeriodFrom := IfThen(IsNull or ExactRadioBtn.Checked, -1, AsInteger);
      with SelPeriodQryPERIODTILL do Periods[I].PeriodTill := IfThen(IsNull or ExactRadioBtn.Checked, -1, AsInteger);
      Periods[I].Status := stUnchanged;
      SelPeriodQry.Next;
    end;
  end else begin
    SetLength(Periods, 1);
    Periods[I].Name := EmptyStr;
    Periods[I].Id := -1;
    Periods[I].FromDate := -1;//LegalFrom;
    Periods[I].TillDate := -1;
    Periods[I].PeriodFrom := 0;
    Periods[I].PeriodTill  := -1; {0}
    Periods[I].Status := stInserted;  
  end;
  FillPeriodTabControl;
end;

function TZServDataDialog.GetRelativeDate: Boolean;
begin
  Result := EditDataSet.FieldByName('PeriodType').AsInteger = nRelativeDate;
end;

procedure TZServDataDialog.SetRelativeDate(const Value: Boolean);
begin
  with EditDataSet.FieldByName('PeriodType') do
  if Value = nRelativeDate then Value := nRelativeDate else Value := nExactDate;  
end;

procedure TZServDataDialog.FillPeriodTabControl;
var I: Integer;
    TabName: string;
begin  
  PeriodTabControl.Tabs.Clear;
//  for I := High(Periods) downto Low(Periods) do
  for I := Low(Periods) to High(Periods) do
  begin 
    if Periods[I].Name <> EmptyStr then TabName := Periods[I].Name 
    else TabName := PeriodName(Periods[I], I = High(Periods));
    PeriodTabControl.Tabs.Add(TabName);    
  end;
  PeriodTabControl.TabIndex := 0;  
end;

procedure TZServDataDialog.SetLegalFrom(const Value: TDateTime);
begin
  FLegalFrom := Value;
end;

procedure TZServDataDialog.RelativeRadioBtnClick(Sender: TObject);
begin
  inherited;
  RelativeDate := (Sender as TRadioButton).Tag = nRelativeDate;
  EditDataSet.FieldByName('PeriodType').Value := (Sender as TRadioButton).Tag;
  LoadRatesFields;
end;

procedure TZServDataDialog.LoadRatesFields;
begin
  LoadServRates;
  LoadVatFields;
  with Vat1PercComboBox do
    if not (RateVat1Edit.Text = EmptyStr) and (ItemIndex = -1) then
    begin
      ItemIndex := 0;
      Vat1PercComboBoxClick(Vat1PercComboBox);
    end;
  with Vat2PercComboBox do
    if not (RateVat2Edit.Text = EmptyStr) and (ItemIndex = -1) then
    begin
      ItemIndex := 0;
      Vat2PercComboBoxClick(Vat2PercComboBox);
    end;
  with Vat1Perc2ComboBox do
    if not (Rate2Vat1Edit.Text = EmptyStr) and (ItemIndex = -1) then
    begin
      ItemIndex := 0;
      Vat1Perc2ComboBoxClick(Vat1Perc2ComboBox);
    end;
  with Vat2Perc2ComboBox do
    if not (Rate2Vat2Edit.Text = EmptyStr) and (ItemIndex = -1) then
    begin
      ItemIndex := 0;
      Vat2Perc2ComboBoxClick(Vat2Perc2ComboBox);
    end;
end;

procedure TZServDataDialog.FillAges;
var I, RecCount: Integer;
begin
  I := 0;
  SetLength(Ages, 0);
  RecCount := SelAgeQry.RecordCount;
  if RecCount > 0 then begin
    SetLength(Ages, RecCount);
    for I := Low(Ages) to High(Ages) do
    begin
      Ages[I].Name := SelAgeQryNAME.asString;
      Ages[I].NameId := SelAgeQryNAMEID.AsInteger;
      Ages[I].Id := SelAgeQryAGEID.AsInteger;
      Ages[I].From := SelAgeQryAGEFROM.Value;
      Ages[I].Till := IfThen(SelAgeQryAGETILL.IsNull, -1, SelAgeQryAGETILL.AsInteger);
      Ages[I].Status := stUnchanged;
      Ages[I].MainAge := SelAgeQryISBASEAGE.AsBoolean;
      SelAgeQry.Next;
    end;
  end else begin
    SetLength(Ages, 1);
    Ages[I].Name := EmptyStr;
    Ages[I].NameId := -1;
    Ages[I].Id := -1;
    Ages[I].From := 0;
    Ages[I].Till := -1;
    Ages[I].MainAge := False;
    Ages[I].Status := stInserted;  
  end;
  FillAgesTabControl;
end;

procedure TZServDataDialog.FillAgesTabControl;
var I: Integer;
begin  
  AgeTabControl.Tabs.Clear;
//  for I := High(Ages) downto Low(Ages) do 
  for I := Low(Ages) to High(Ages) do 
  AgeTabControl.Tabs.Add(AgeName(Ages[I]));    

  AgeTabControl.TabIndex := 0;
end;

function TZServDataDialog.AgeName(ARange: TNameStatusRangeId): string;
begin
  if ARange.Till <> -1 then Result := ARange.Name + ' (' + (IntToStr(ARange.From)+' - '+IntToStr(ARange.Till)) + ')'
  else Result := ARange.Name + (' > ' + IntToStr(ARange.From));
end;

procedure TZServDataDialog.RateRefresh;
begin
  FillPeriodTabControl;
  FillAgesTabControl;
  if FRates <> nil then FillRecords;
end;

procedure TZServDataDialog.AdjustAges;
var I: Integer;
begin
  with TForm_HeaderConfig.Create(Application) do
  try    
    DM.AgeNamesQry.Open;      
    Caption := AgesStr;
    CheckTreeView_Items.Items.Clear;
    CheckTreeView_Items.CheckBoxesAlowed:=false;
    setLength(FTreeViewItems,High(Ages)+1);
    FVisibilityTreeView := CheckTreeView_Items;
    for i:=0 to High(Ages) do
      FTreeViewItems[i] := CheckTreeView_Items.Items.Add(nil, AgeName(Ages[i]));
    CheckTreeView_Items.ShowRoot:=false;
    CheckTreeView_Items.CheckBoxesAlowed:=true;
    Action_Add.Visible := False;
    Action_Modify.OnExecute := ModifyAges;
    Action_Remove.Visible := False;
    Action_Apply.OnExecute := ApplyAges;
    // відобразити на екрані
    ShowModal;
  finally
    setLength(FTreeViewItems,0);
    FVisibilityTreeView:=nil;
    DM.AgeNamesQry.Close;
    Free;
  end;
end;

procedure TZServDataDialog.ApplyAges(Sender: TObject);
begin
//
end;

procedure TZServDataDialog.ModifyAges(Sender: TObject);
var i, j, insertedIndex, NewItemsCount, l1, l2: integer;
    NewAgesArray : TAges;
    NewDataArray : TTypeRate;
begin
  with TForm_EditAgeRanges.Create(Application) do
  try
    insertedIndex:=0;
    setLength(AgeRangesArray,0);
    if Ages[High(Ages)].From > 0 then
    begin
      setLength(AgeRangesArray,length(AgeRangesArray)+1);
      AgeRangesArray[InsertedIndex].From:=0;
      AgeRangesArray[InsertedIndex].Till:=Ages[High(Ages)].From;
      AgeRangesArray[InsertedIndex].TillRestricted:=true;
      AgeRangesArray[InsertedIndex].Id:=-1;
      AgeRangesArray[InsertedIndex].Modified:=false;
      AgeRangesArray[InsertedIndex].Hole:=true;
      AgeRangesArray[InsertedIndex].Marker:='';
      AgeRangesArray[InsertedIndex].MarkerId:=0;
      AgeRangesArray[InsertedIndex].MainAge:=false;
      inc(InsertedIndex);
    end;
    for i := High(Ages) downto low(Ages) do
//    for i:=0 to High(Ages) do
    begin
      setLength(AgeRangesArray,Length(AgeRangesArray)+1);
      AgeRangesArray[InsertedIndex].From:=Ages[i].From;
      if Ages[i].Till = -1 then
        AgeRangesArray[InsertedIndex].TillRestricted:=false
      else
      begin
        AgeRangesArray[InsertedIndex].TillRestricted:=true;
        AgeRangesArray[InsertedIndex].Till:=Ages[i].Till;
      end;
      AgeRangesArray[InsertedIndex].Id:=i;
      AgeRangesArray[InsertedIndex].Modified:=false;
      AgeRangesArray[InsertedIndex].Hole:=false;
      AgeRangesArray[InsertedIndex].Marker:=Ages[i].Name;
      AgeRangesArray[InsertedIndex].MarkerId:=Ages[i].NameId;
      AgeRangesArray[InsertedIndex].MainAge:=Ages[i].MainAge;
      inc(InsertedIndex);
      // додати проміжок, якщо він є між вік категоріями і дана категорія не є останньою
(*   if (i < High(Ages)) and (Ages[i-{+}1].From - Ages[i].Till > 1) then
      begin
        setLength(AgeRangesArray,length(AgeRangesArray)+1);
        AgeRangesArray[InsertedIndex].From:=AgeRangesArray[InsertedIndex-1].Till;
        AgeRangesArray[InsertedIndex].Till:=Ages[i-{+}1].From;
        AgeRangesArray[InsertedIndex].TillRestricted:=true;
        AgeRangesArray[InsertedIndex].Id:=-1;
        AgeRangesArray[InsertedIndex].Modified:=false;
        AgeRangesArray[InsertedIndex].Hole:=true;
        AgeRangesArray[InsertedIndex].Marker:='';
        AgeRangesArray[InsertedIndex].MarkerId:=0;
        AgeRangesArray[InsertedIndex].MainAge:=false;
        inc(InsertedIndex);
      end;  *)
    end;
    // якщо останній діапазон є закритим додати відкриту діру
    if AgeRangesArray[InsertedIndex-1].TillRestricted then
    begin
      setLength(AgeRangesArray,length(AgeRangesArray)+1);
      AgeRangesArray[InsertedIndex].From:=AgeRangesArray[InsertedIndex-1].Till+1;
      AgeRangesArray[InsertedIndex].Till:=200;
      AgeRangesArray[InsertedIndex].TillRestricted:=false;
      AgeRangesArray[InsertedIndex].Id:=-1;
      AgeRangesArray[InsertedIndex].Modified:=false;
      AgeRangesArray[InsertedIndex].Hole:=true;
      AgeRangesArray[InsertedIndex].Marker:='';
      AgeRangesArray[InsertedIndex].MarkerId:=0;
      AgeRangesArray[InsertedIndex].MainAge:=false;
    end;
    if ShowModal = mrOk then
    begin
      NewItemsCount := 0;
      for i:=0 to High(AgeRangesArray) do // визначити нову довжину масиву
        if not AgeRangesArray[i].Hole then inc(NewItemsCount);
      // переставляємо елементи на їх нові місця
      SetLength(NewAgesArray,NewItemsCount);
      l1 := 0;
//      for i:=0 to High(AgeRangesArray) do //
      for i:= High(AgeRangesArray) downto Low(AgeRangesArray) do 
        if (not AgeRangesArray[i].Hole) then
        begin
          if AgeRangesArray[i].Id <> -1 then
          begin
            NewAgesArray[l1] := Ages[AgeRangesArray[i].Id];
            NewAgesArray[l1].Name := AgeRangesArray[i].Marker;
            NewAgesArray[l1].NameId := AgeRangesArray[i].MarkerId;
            NewAgesArray[l1].From := AgeRangesArray[i].From;
            NewAgesArray[l1].MainAge := AgeRangesArray[i].MainAge;
            NewAgesArray[l1].Status := Ages[AgeRangesArray[i].Id].Status;
            if AgeRangesArray[i].TillRestricted then NewAgesArray[l1].Till:=AgeRangesArray[i].Till else NewAgesArray[l1].Till:=-1;
            if (NewAgesArray[l1].Name <> Ages[AgeRangesArray[i].Id].Name) or
              (NewAgesArray[l1].From <> Ages[AgeRangesArray[i].Id].From) or
              (NewAgesArray[l1].MainAge <> Ages[AgeRangesArray[i].Id].MainAge) or
              (NewAgesArray[l1].Till <> Ages[AgeRangesArray[i].Id].Till) then
              begin
                if NewAgesArray[l1].Status <> stInserted
                then NewAgesArray[l1].Status := stModified;
                FIsChanged:=true;
              end;
          end
          else
          begin
            FIsChanged := true;
            NewAgesArray[l1].Name := AgeRangesArray[i].Marker;
            NewAgesArray[l1].NameId := AgeRangesArray[i].MarkerId;
            NewAgesArray[l1].Status := stInserted;
            NewAgesArray[l1].Id := -1;
            NewAgesArray[l1].From := AgeRangesArray[i].From;
            NewAgesArray[l1].MainAge := AgeRangesArray[i].MainAge;
            if AgeRangesArray[i].TillRestricted then NewAgesArray[l1].Till := AgeRangesArray[i].Till else NewAgesArray[l1].Till:=-1;
          end;
          inc(l1);
        end;
      Ages := NewAgesArray;
      // перепис даних в основному масиві
      //Заповнюємо тарифи
      //встановлюємо розмірності нового масиву
      SetLength(NewDataArray, 0);
      SetLength(NewDataArray, NewItemsCount, Length(Periods));
      for j:= 0 to High(Periods) do
        begin
          for l1 := 0 to NewItemsCount - 1 do
          begin
            NewDataArray[l1, j].V1_Rate := null;
            NewDataArray[l1, j].V1_AgentPay := null;
            NewDataArray[l1, j].V1_NetVal := null;
            NewDataArray[l1, j].V2_Rate := null;
            NewDataArray[l1, j].V2_AgentPay := null;
            NewDataArray[l1, j].V2_NetVal := null;
            NewDataArray[l1, j].V1_Rate2 := null;
            NewDataArray[l1, j].V1_AgentPay2 := null;
            NewDataArray[l1, j].V1_NetVal2 := null;
            NewDataArray[l1, j].V2_Rate2 := null;
            NewDataArray[l1, j].V2_AgentPay2 := null;
            NewDataArray[l1, j].V2_NetVal2 := null;
          end;
          l2 := 0;
          for l1 := High(AgeRangesArray) downto 0 do // копіювання даних з основного масиву відповідно до змін періодів
            if (not AgeRangesArray[l1].Hole) then
            begin
              if AgeRangesArray[l1].Id <> -1 then
                NewDataArray[l2, j] := FRates[AgeRangesArray[l1].Id, j];
              inc(l2);
            end;
        end;
      FRates := NewDataArray;
      RateRefresh; // відтворити тариф

      FVisibilityTreeView.Items.Clear;
      FVisibilityTreeView.CheckBoxesAlowed := False;
      setLength(FTreeViewItems,High(Ages) + 1);
      for i:=0 to High(Ages) do
      begin
        FTreeViewItems[i] := FVisibilityTreeView.Items.Add(nil, AgeName(Ages[i]));
        FTreeViewItems[i].StateIndex:=2;
      end;
      FVisibilityTreeView.ShowRoot := False;
      FVisibilityTreeView.CheckBoxesAlowed := True;      
    end;
  finally
    Free;
  end;
end;

procedure TZServDataDialog.AgesBtnClick(Sender: TObject);
begin
  inherited;
  AdjustAges;
end;

function TZServDataDialog.GetServiceId: Integer;
begin
  with StoreRateQry do
  begin 
    SQL.Clear;
    case BrServKindId of
      ordOrderTrip:     SQL.Add('select GEN_ID(TOURTRIP_GEN, 0) from rdb$database');
      ordOrderHotel:    SQL.Add('select GEN_ID(TOURROOM_GEN, 0) from rdb$database');
      ordOrderInsure:   SQL.Add('select GEN_ID(TOURINSURES_GEN, 0) from rdb$database');
      ordOrderExcurs:   SQL.Add('select GEN_ID(TOUREXCURS_GEN, 0) from rdb$database');
      ordOrderVisa:     SQL.Add('select GEN_ID(TOURVISAS_GEN, 0) from rdb$database');
      ordOrderOther:    SQL.Add('select GEN_ID(TOUROTHER_GEN, 0) from rdb$database');
    end;
    Open;
    Result := Fields[0].AsInteger + 1;
  end;
end;

procedure TZServDataDialog.MakePeriodQuery;
begin
  SelPeriodQry.Close;
  SelPeriodQry.SQL.Text := Format(PeriodSelSQL, [WhereArr[RelativeRadioBtn.Checked]]);
end;

procedure TZServDataDialog.MakeRateQuery;
begin 
  SelTourRatesQry.Close;
  SelTourRatesQry.SQL.Text := Format(ToruRateSelSQL, [WhereArr[RelativeRadioBtn.Checked]]);
end;

procedure TZServDataDialog.ModifyExactDate(Sender: TObject);
var i, j, insertedIndex, NewItemsCount, l1, l2: integer;
    NewPeriodsArray : TRatePeriods;
    NewDataArray : TTypeRateArr;
begin
  with TForm_EditExactDateRanges.Create(Application) do
  try    
    MinDate := DateOf(LegalFrom);
    InsertedIndex := 0;
    SetLength(ExactDateRangesArray, 0);
//      if DateOf(Periods[LastPeriod].FromDate) > MinDate then
      if DateOf(Periods[0].FromDate) > MinDate then
      begin
        SetLength(ExactDateRangesArray, Length(ExactDateRangesArray) + 1);
        ExactDateRangesArray[InsertedIndex].FromDate := MinDate;
//        ExactDateRangesArray[InsertedIndex].TillDate := DateOf(Periods[LastPeriod].FromDate - 1);
        ExactDateRangesArray[InsertedIndex].TillDate := DateOf(Periods[0].FromDate - 1);
        ExactDateRangesArray[InsertedIndex].PeriodFrom := -1;
        ExactDateRangesArray[InsertedIndex].PeriodTill := -1;
        ExactDateRangesArray[InsertedIndex].TillRestricted := True;
        ExactDateRangesArray[InsertedIndex].Id := -1;
        ExactDateRangesArray[InsertedIndex].Modified := False;
        ExactDateRangesArray[InsertedIndex].Hole := True;
        ExactDateRangesArray[InsertedIndex].Marker := EmptyStr;
        inc(InsertedIndex);
      end ;

//    for i := High(Periods) downto low(Periods) do
    if Periods[0].FromDate > 0 then MinDate := DateOf(Periods[0].FromDate);
    for i := low(Periods) to High(Periods) do
    begin
      SetLength(ExactDateRangesArray, Length(ExactDateRangesArray) + 1);
      ExactDateRangesArray[InsertedIndex].FromDate := DateOf(Periods[i].FromDate);
      ExactDateRangesArray[InsertedIndex].TillDate := DateOf(Periods[i].TillDate);
      ExactDateRangesArray[InsertedIndex].PeriodFrom := Periods[i].PeriodFrom;
      ExactDateRangesArray[InsertedIndex].PeriodTill := Periods[i].PeriodTill;
      if Periods[i].TillDate = -1 then
        ExactDateRangesArray[InsertedIndex].TillRestricted := False
      else ExactDateRangesArray[InsertedIndex].TillRestricted := True;
      ExactDateRangesArray[InsertedIndex].Id := i;
      ExactDateRangesArray[InsertedIndex].Modified := False;
      ExactDateRangesArray[InsertedIndex].Hole := False;
      ExactDateRangesArray[InsertedIndex].Marker := Periods[i].Name;
      inc(InsertedIndex);
    end;
    // якщо останній діапазон є закритим додати відкриту діру
    if ExactDateRangesArray[InsertedIndex-1].TillRestricted then
    begin
      setLength(ExactDateRangesArray,length(ExactDateRangesArray)+1);
      ExactDateRangesArray[InsertedIndex].FromDate := ExactDateRangesArray[InsertedIndex-1].TillDate + 1;
      ExactDateRangesArray[InsertedIndex].TillDate := DateOf(MaxDateTime);
      ExactDateRangesArray[InsertedIndex].PeriodFrom := -1;
      ExactDateRangesArray[InsertedIndex].PeriodTill := -1;
      ExactDateRangesArray[InsertedIndex].TillRestricted := False;
      ExactDateRangesArray[InsertedIndex].Id := -1;
      ExactDateRangesArray[InsertedIndex].Modified := False;
      ExactDateRangesArray[InsertedIndex].Hole := True;
      ExactDateRangesArray[InsertedIndex].Marker := EmptyStr;
    end;     

    if ShowModal = mrOk then
    begin
      NewItemsCount := 0;
      for i:=0 to High(ExactDateRangesArray) do // визначити нову довжину масиву
        if not ExactDateRangesArray[i].Hole then inc(NewItemsCount);
      // переставляємо елементи на їх нові місця
      SetLength(NewPeriodsArray,0);
      SetLength(NewPeriodsArray, NewItemsCount);
      l1 := 0;
      for i:= Low(ExactDateRangesArray) to High(ExactDateRangesArray) do 
//      for i:= High(ExactDateRangesArray) downto Low(ExactDateRangesArray) do 
        if (not ExactDateRangesArray[i].Hole) then
        begin
          if ExactDateRangesArray[i].Id <> -1 then
          begin
            NewPeriodsArray[l1] := Periods[ExactDateRangesArray[i].Id];
            NewPeriodsArray[l1].Name := ExactDateRangesArray[i].Marker;
            NewPeriodsArray[l1].FromDate := ExactDateRangesArray[i].FromDate;
            NewPeriodsArray[l1].Status := Periods[ExactDateRangesArray[i].Id].Status;
            NewPeriodsArray[l1].PeriodFrom := -1;
            NewPeriodsArray[l1].PeriodTill := -1;
            if ExactDateRangesArray[i].TillRestricted 
            then NewPeriodsArray[l1].TillDate := ExactDateRangesArray[i].TillDate
            else NewPeriodsArray[l1].TillDate := -1;
            if (NewPeriodsArray[l1].Name <> Periods[ExactDateRangesArray[i].Id].Name) or
               (NewPeriodsArray[l1].FromDate <> DateOf(Periods[ExactDateRangesArray[i].Id].FromDate)) or
               (NewPeriodsArray[l1].TillDate <> DateOf(Periods[ExactDateRangesArray[i].Id].TillDate)) 
            then
            begin
              if NewPeriodsArray[l1].Status <> stInserted 
              then NewPeriodsArray[l1].Status := stModified;
              FIsChanged := True;
            end;
          end
          else
          begin
            FIsChanged := True;
            NewPeriodsArray[l1].Name := ExactDateRangesArray[i].Marker;
            NewPeriodsArray[l1].Status := stInserted;
            NewPeriodsArray[l1].Id := -1;
            NewPeriodsArray[l1].FromDate := ExactDateRangesArray[i].FromDate;
            NewPeriodsArray[l1].PeriodFrom := -1;
            NewPeriodsArray[l1].PeriodTill := -1;
            if ExactDateRangesArray[i].TillRestricted 
            then NewPeriodsArray[l1].TillDate := ExactDateRangesArray[i].TillDate
            else NewPeriodsArray[l1].TillDate := -1;
          end;
          inc(l1);
        end;
      Periods := NewPeriodsArray;
      //Заповнюємо тарифи
      for j:= 0 to High(Ages) do
        begin
          //встановлюємо розмірності нового масиву
          SetLength(NewDataArray,0);
          SetLength(NewDataArray,NewItemsCount);
          for l1:=0 to High(NewDataArray) do
          begin
            NewDataArray[l1].V1_Rate := null;
            NewDataArray[l1].V1_AgentPay := null;
            NewDataArray[l1].V1_NetVal := null;
            NewDataArray[l1].V2_Rate := null;
            NewDataArray[l1].V2_AgentPay := null;
            NewDataArray[l1].V2_NetVal := null;
            NewDataArray[l1].V1_Rate2 := null;
            NewDataArray[l1].V1_AgentPay2 := null;
            NewDataArray[l1].V1_NetVal2 := null;
            NewDataArray[l1].V2_Rate2 := null;
            NewDataArray[l1].V2_AgentPay2 := null;
            NewDataArray[l1].V2_NetVal2 := null;
          end;
          l2 := 0;
          for l1 := High(ExactDateRangesArray) downto 0 do // копіювання даних з основного масиву відповідно до змін періодів
            if (not ExactDateRangesArray[l1].Hole) then
            begin
              if ExactDateRangesArray[l1].Id <> -1 then
                NewDataArray[l2] := FRates[j, ExactDateRangesArray[l1].Id];
              inc(l2);
            end;
          FRates[j]:=NewDataArray;
        end;
      RateRefresh; // відтворити тариф

      FVisibilityTreeView.Items.Clear;
      FVisibilityTreeView.CheckBoxesAlowed := False;
      setLength(FTreeViewItems,High(Periods) + 1);
      for i:=0 to High(Periods) do
      begin
        FTreeViewItems[i] := FVisibilityTreeView.Items.Add(nil,PeriodName(Periods[i], I = High(Periods)));
        FTreeViewItems[i].StateIndex:=2;
      end;
      FVisibilityTreeView.ShowRoot := False;
      FVisibilityTreeView.CheckBoxesAlowed := True;      
    end;
  finally
    Free;
  end;
end;

end.
