unit UnitFrameCompanyPayState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,cxGridDBTableView,
  cxMaskEdit, cxCalendar, cxTextEdit, Buttons, StdCtrls,Core,UnitProc,UnitGridView;


const CaptionHistoryTaxLog = 'Історія систем оподаткування';

type
  TParamCompanyPayState = record
    ElemCompany : TDBShemaView;
    //ElemCompTaxLogMemTableEh : TDBShemaView;
    ElemCompTaxSystemLogQry: TDBShemaView;
    ElemTypeDocumQry : TDBShemaView;
    ElemSelCompAction: TDBShemaView;
    ElemSelTaxSystemQry:TDBShemaView;
    //DataParam:TRecCompanyParamDataArr;
  end;

  TFrameCompanyPayState = class(TFrame)
    TaxPayGroupBox: TGroupBox;
    SingleTaxGroupBox: TGroupBox;
    DateSingleTaxLabel: TLabel;
    TypeSingleTaxLabel: TLabel;
    DocSingleLabel: TLabel;
    TaxLabel: TLabel;
    TaxPayStateLabel: TLabel;
    TaxPayCodeLabel: TLabel;
    TypeDocLabel: TLabel;
    TaxPayRegDateLabel: TLabel;
    PDVLabel: TLabel;
    TaxPayLabel: TLabel;
    HistoryBtn: TSpeedButton;
    PPEdit: TcxTextEdit;
    PDVEdit: TcxTextEdit;
    SingleTaxDateDateEdit: TcxDateEdit;
    TaxPayRegDateDateEdit: TcxDateEdit;
    TaxPayCodeEdit: TcxTextEdit;
    TaxPayStateComboBox: TcxExtLookupComboBox;
    SingleTaxComboBox: TcxExtLookupComboBox;
    TaxPayTypeIdComboBox: TcxExtLookupComboBox;
    ReestrGroupBox: TGroupBox;
    ReestrDateLabel: TLabel;
    Label12: TLabel;
    IdentCodeLabel: TLabel;
    IdentCodeDBEdit: TcxTextEdit;
    ReestrDateDateEdit: TcxDateEdit;
    ReestrComboBox: TcxExtLookupComboBox;
    ItsActionComboBox: TcxExtLookupComboBox;
    procedure HistoryBtnClick(Sender: TObject);
  private
    { Private declarations }
    FElemCompanyParam:TParamCompanyPayState;
    FCanUpdate : Boolean;
    procedure FSetActualTaxSystem;
    procedure FReadCurrTaxSystem(setNull:Boolean=false);
    procedure FPrepare;

  public
    { Public declarations }
    procedure IntitFrame( ElemCompanyParam:TParamCompanyPayState; CanUpdate :Boolean );
    procedure ShowData;
    procedure SetUpdateDataToDBCompany;
    procedure RefreshControls( isEnterp,isResident:Boolean; CanUpdate:boolean);
    procedure SetEnabled( isEnterp,isResident:Boolean; CanUpdate:boolean );
  end;

implementation

{$R *.dfm}

procedure TFrameCompanyPayState.IntitFrame( ElemCompanyParam:TParamCompanyPayState; CanUpdate :Boolean );
begin
  FElemCompanyParam := ElemCompanyParam;
  FCanUpdate := CanUpdate;

  FPrepare;
end;

procedure TFrameCompanyPayState.FPrepare;
begin
  SetPropInCxExtLookupComboBox( ReestrComboBox,TcxGridDBTableView( self.FElemCompanyParam.ElemTypeDocumQry.ViewList ) ,'NAME', self.FElemCompanyParam.ElemTypeDocumQry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( SingleTaxComboBox,TcxGridDBTableView( self.FElemCompanyParam.ElemTypeDocumQry.ViewList ) ,'NAME', self.FElemCompanyParam.ElemTypeDocumQry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( TaxPayTypeIdComboBox,TcxGridDBTableView( self.FElemCompanyParam.ElemTypeDocumQry.ViewList ) ,'NAME', self.FElemCompanyParam.ElemTypeDocumQry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( TaxPayStateComboBox,TcxGridDBTableView( self.FElemCompanyParam.ElemSelTaxSystemQry.ViewList ), 'CalcNameTax', self.FElemCompanyParam.ElemSelTaxSystemQry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( ItsActionComboBox, TcxGridDBTableView( self.FElemCompanyParam.ElemSelCompAction.ViewList ), 'NAME', self.FElemCompanyParam.ElemSelCompAction.FieldKod , True, False );

  FElemCompanyParam.ElemCompTaxSystemLogQry.DBOpen;
  FElemCompanyParam.ElemTypeDocumQry.DBOpen;
  FElemCompanyParam.ElemSelCompAction.DBOpen;
  FElemCompanyParam.ElemSelTaxSystemQry.DBOpen;

  self.ShowData;
end;

procedure TFrameCompanyPayState.ShowData;
begin
  if ItsActionComboBox.Visible then ItsActionComboBox.EditValue := self.FElemCompanyParam.ElemCompany.DB.FieldByName('ACTIONID').value
  else ItsActionComboBox.EditValue:=null;

  if ReestrComboBox.Enabled then
    ReestrComboBox.EditValue := self.FElemCompanyParam.ElemCompany.DB.FieldByName('GOVREESTRTYPEID').value
  else ReestrComboBox.EditValue := null;

  IdentCodeDBEdit.EditValue := self.FElemCompanyParam.ElemCompany.DB.FieldByName('IDENTCODE').value;
  if self.FElemCompanyParam.ElemCompany.DB.FieldByName('GOVREESTRDATE').IsNull then
    ReestrDateDateEdit.Clear
  else ReestrDateDateEdit.Date := self.FElemCompanyParam.ElemCompany.DB.FieldByName('GOVREESTRDATE').Value;

  FSetActualTaxSystem;
end;

procedure TFrameCompanyPayState.HistoryBtnClick(Sender: TObject);
var PanelEdit:TPanelEdit;
    TaxPayStateId:Variant;
    butOk:TButModalProperty;
begin
  butOk := GetDefButModProperty('');

  PanelEdit := GetEmptyPanelEdit( [True, True, False] );
  PanelEdit.WidthForm := 1100;

  ShowGridView( CaptionHistoryTaxLog, self.FElemCompanyParam.ElemCompTaxSystemLogQry,  PanelEdit, butOk, GetDefButModProperty('Закрити') );
  FSetActualTaxSystem;
end;

procedure TFrameCompanyPayState.FReadCurrTaxSystem(setNull:Boolean=false);
begin
  if not setNull then
  begin
    TaxPayStateComboBox.EditValue := self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('TAXDETAILID').Value;
    SingleTaxComboBox.EditValue := self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('SINGLETAXTYPEID').Value;
    TaxPayTypeIdComboBox.EditValue := self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('TAXPAYTYPEID').Value;
    TaxPayCodeEdit.EditValue := self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('TAXPAYCODE').Value;
    PPEdit.EditValue := self.FElemCompanyParam.ElemSelTaxSystemQry.DB.FieldByName('CalcIncomTax').asString;

    PDVEdit.EditValue := null;
    if not self.FElemCompanyParam.ElemSelTaxSystemQry.DB.FieldByName('PDVSUM').IsNull then
      PDVEdit.Text := self.FElemCompanyParam.ElemSelTaxSystemQry.DB.FieldByName('PDVSUM').asString+' % ';

    if self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('FROMDATE').IsNull then
      SingleTaxDateDateEdit.Clear
    else SingleTaxDateDateEdit.Date := self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('FROMDATE').AsDateTime;

    if self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('TAXPAYREGDATE').IsNull then
      TaxPayRegDateDateEdit.Clear
    else TaxPayRegDateDateEdit.Date := self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('TAXPAYREGDATE').AsDateTime;
  end
  else
  begin
    TaxPayStateComboBox.EditValue := null;
    SingleTaxComboBox.EditValue := null;
    TaxPayTypeIdComboBox.EditValue := null;
    TaxPayCodeEdit.EditValue := null;
    PPEdit.EditValue := null;
    PDVEdit.EditValue := null;
    SingleTaxDateDateEdit.Clear;
    TaxPayRegDateDateEdit.Clear;
  end;
end;

procedure TFrameCompanyPayState.FSetActualTaxSystem;
begin
  try
    FReadCurrTaxSystem(True);
    self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.DisableControls;

    self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.First;
    while not self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.Eof do
    begin

      if (self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('FROMDATE').AsDateTime <= Now )and
         ( ( (self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('TODATE')).IsNull) or
           (self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.FieldByName('TODATE').AsDateTime > now ) ) then
      begin
        FReadCurrTaxSystem;
        Break;
      end;

      self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.Next;
    end;

  finally
    self.FElemCompanyParam.ElemCompTaxSystemLogQry.DB.EnableControls;
  end;
end;

procedure TFrameCompanyPayState.SetUpdateDataToDBCompany;
begin

  if ItsActionComboBox.Visible then self.FElemCompanyParam.ElemCompany.DB.FieldByName('ACTIONID').value := ItsActionComboBox.EditValue
  else self.FElemCompanyParam.ElemCompany.DB.FieldByName('ACTIONID').value:=null;

  if ReestrComboBox.Enabled then
    self.FElemCompanyParam.ElemCompany.DB.FieldByName('GOVREESTRTYPEID').value := ReestrComboBox.EditValue
  else self.FElemCompanyParam.ElemCompany.DB.FieldByName('GOVREESTRTYPEID').value := null;

  if ReestrDateDateEdit.Enabled then
    self.FElemCompanyParam.ElemCompany.DB.FieldByName('GOVREESTRDATE').Value := null
  else
  if ReestrDateDateEdit.EditValue <> null then
    self.FElemCompanyParam.ElemCompany.DB.FieldByName('GOVREESTRDATE').Value := ReestrDateDateEdit.Date;

  if SingleTaxComboBox.Enabled then
    self.FElemCompanyParam.ElemCompany.DB.FieldByName('SINGLETAXTYPEID').Value := SingleTaxComboBox.EditValue
  else self.FElemCompanyParam.ElemCompany.DB.FieldByName('SINGLETAXTYPEID').Value := null;

  if TaxPayTypeIdComboBox.Enabled then
    self.FElemCompanyParam.ElemCompany.DB.FieldByName('TAXPAYTYPEID').Value := TaxPayTypeIdComboBox.EditValue
  else self.FElemCompanyParam.ElemCompany.DB.FieldByName('TAXPAYTYPEID').Clear;

  self.FElemCompanyParam.ElemCompany.DB.FieldByName('TAXPAYSTATEID').Value := TaxPayStateComboBox.EditValue;
end;

procedure TFrameCompanyPayState.RefreshControls( isEnterp,isResident:Boolean; CanUpdate:boolean );
begin
  ItsActionComboBox.Enabled := ( isResident ) and ( CanUpdate );
  ItsActionComboBox.Enabled := ( isResident ) and ( CanUpdate );
  ReestrComboBox.Enabled := ( isResident )and ( CanUpdate );
  IdentCodeDBEdit.Enabled := ( isResident )and ( CanUpdate );
  ReestrDateDateEdit.Enabled := ( isResident )and ( CanUpdate );
  HistoryBtn.Enabled :=  ( isResident ) and  ( FCanUpdate );

  ItsActionComboBox.Visible := isEnterp;
  if not isEnterp then IdentCodeLabel.Caption := 'Ідентифікаційний код'
  else
  if isEnterp then IdentCodeLabel.Caption := 'ЄДРПОУ';

  ItsActionComboBox.Enabled := CanUpdate;
  ReestrComboBox.Enabled := CanUpdate;
  IdentCodeDBEdit.Enabled := CanUpdate;
  ReestrDateDateEdit.Enabled := CanUpdate;
end;

procedure TFrameCompanyPayState.SetEnabled( isEnterp,isResident:Boolean; CanUpdate:boolean );
begin
  FCanUpdate := CanUpdate;
  RefreshControls( isEnterp, isResident, CanUpdate );
end;

end.
