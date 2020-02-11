unit FundingFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, AzComboBox, AzEdit, Buttons, ExtCtrls, DB,
  DBTables, StrUtils, IBCustomDataSet, IBQuery;

type
  TFundingDlg = class(TForm)
    CommCurrQry: TIBQuery;
    CommCurrQryRATE: TFloatField;
    PersFundingQry: TIBQuery;
    PersFundingQrySUMAFUNDING: TFloatField;
    PersFundingQrySUMAORIGIN: TFloatField;
    PersFundingQrySUMABANK: TFloatField;
    PersFundingQrySUMABANKORIGIN: TFloatField;
    PersFundingQryONTOURSUM: TFloatField;
    Sel_Pers_HaveFDocQry: TIBQuery;
    Sel_Pers_HaveFDocQryPERSVISAID: TIntegerField;
    Sel_Pers_HaveFDocQryEMBASSYID: TIntegerField;
    Sel_Pers_HaveFDocQryTOURDAYCOUNT: TIntegerField;
    FundingCondPanel: TPanel;
    Label1: TLabel;
    NecessarySumMaskEdit: TAzEdit;
    CurrComboBox: TAzComboBox;
    FundingCountEdit: TSpinEdit;
    PeriodComboBox: TAzComboBox;
    Label3: TLabel;
    Label2: TLabel;
    BankSumEdit: TAzEdit;
    BankCurrComboBox: TAzComboBox;
    BankCountEdit: TSpinEdit;
    BankPeriodComboBox: TAzComboBox;
    Label4: TLabel;
    OnTourCheckBox: TCheckBox;
    OnTourSumEdit: TAzEdit;
    ServPanel: TPanel;
    ServCheckBox: TCheckBox;
    Image1: TImage;
    ServCostEdit: TAzEdit;
    ServCostValComboBox: TAzComboBox;
    Panel7: TPanel;
    PayServEdit: TAzEdit;
    ValSerComboBox: TAzComboBox;
    Panel3: TPanel;
    ReadyToDaysEdit: TAzEdit;
    Label7: TLabel;
    CalendarRadioButton: TRadioButton;
    JobRadioButton: TRadioButton;
    Panel4: TPanel;
    AutoFilingLabel: TLabel;
    AutoFilingCheckBox: TCheckBox;
    UseCodeCheckBox: TCheckBox;
    FilingPanel: TPanel;
    Label10: TLabel;
    Image3: TImage;
    OurFilingRadioButton: TRadioButton;
    TouristRadioButton: TRadioButton;
    Image5: TImage;
    Image4: TImage;
    OutherPanel: TPanel;
    Label9: TLabel;
    FilingDateRadioButton: TRadioButton;
    PrintDateRadioButton: TRadioButton;
    Image6: TImage;
    Image7: TImage;
    Label5: TLabel;
    PermAlgolCheckBox: TCheckBox;
    PermOtherCheckBox: TCheckBox;
    Image9: TImage;
    Image8: TImage;
    Panel6: TPanel;
    BankPayCheckBox: TCheckBox;
    Panel1: TPanel;
    WorkFilingCheckBox: TCheckBox;
    Label6: TLabel;
    Image2: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    TypeFundingComboBox: TAzComboBox;
    Label8: TLabel;
    CommentPanel: TPanel;
    Label11: TLabel;
    Memo: TMemo;
    procedure SumMaskEditExit(Sender: TObject);
    procedure SumMaskEditKeyPress(Sender: TObject; var Key: Char);
    procedure OnTourCheckBoxClick(Sender: TObject);
    procedure ServCheckBoxClick(Sender: TObject);
    procedure AutoFilingLabelClick(Sender: TObject);
    procedure BankPayCheckBoxClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TypeFundingComboBoxChange(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure ImageClick(Sender: TObject);
  private
    { Private declarations }
    FCurrArr: array[0..2] of Real;
    FDataQuery: TDataset;
    FAsVisaCenter: Boolean;
    procedure UpdatePersDocFunding(FundingSum, BankSum, OnTourSum: Real);
    procedure LoadEmbassyData(FundingSum: Real; 
          BankSum: Real; BankVal, BankCount, BankPeriod,
          PermTransfer: Integer);
    procedure SetEmbassyData(CompanyId: Integer);
    procedure UpdatePersDoc;
    function PersFunding(PersVisaId, CntrId, EmbassyId: Integer;
            var SumaBank, SumaFundingOrig, SumaBankOrig, OnTourSum: Real): Real;
    function GetReadyToRB: string;
    function GetAppltypeDate: string;
    function CheckSumOnTour: Boolean;
    function CheckServCost: Boolean;
    function CheckBankPay: Boolean;
    function CheckReadyToDays: Boolean;
    function CheckFiling: Boolean;
    function CheckApplDate: Boolean;
    function CheckFundingSum: Boolean;
    procedure PrepareCondition;
    procedure PrepareTypeFunding;
  public
    { Public declarations }
  end;

function ExecuteEmbassyFunding(aQuery: TDataset; AsVisaCenter: Boolean = False):Boolean;
{var
  FundingDlg: TFundingDlg;
 }
implementation

uses
  TourCmnlIf, ServMod;

const 
  UpdCntrEmbassSQL =
   'Update CntrEmbassies ' +
   'Set FundingSum = %s, FundingVal = %s, ' +
   'FundingCount = %s, FundingPeriod = %s, ' +
   'BankSum = %s,  BankVal = %s, ' +
   'BankCount = %s, BankPeriod = %s, ' +
   'OnTourSum = %s, ' +
   'PermTransfDoc = %s, ' +
   'PayBankServ = %s, CurrServ = %s, ' +
   'ReadyToDays = %s, ReadyToType = %s, AutoFilling = %s, ' +
   'UseCode = %s, OurFiling = %s, ApplTypeDate = %s, ' +
   'ServCost = %s, ServCostVal = %s, ' +
   'FilingPlaceWork = %s, FullFunding = %s, TypeFunding = %s, ' +
   'Comments = :Comments ' +
   'Where CountryID = %d and EmbassyID = %d';

{$R *.dfm}
function ExecuteEmbassyFunding(aQuery: TDataset; AsVisaCenter: Boolean = False):Boolean;
var OnTourSum: Real;
    BankPeriod, BankCount, BankVal, PermTransfer: Integer;
    FundingSum, BankSum: Real;
begin                                    
  with TFundingDlg.Create(Application) do
  try
    FDataQuery := aQuery;
    FAsVisaCenter := AsVisaCenter;
    FundingSum := FDataQuery.FieldByName('FUNDINGSUM').AsFloat;
    with FDataQuery.FieldByName('BANKPERIOD') do if IsNull then BankPeriod := -1 
    else BankPeriod := AsInteger;
    BankCount := FDataQuery.FieldByName('BANKCOUNT').AsInteger;
    with FDataQuery.FieldByName('BANKVAL') do if IsNull then BankVal := -1
    else BankVal := AsInteger;
    BankSum := FDataQuery.FieldByName('BANKSUM').AsFloat;   
    PermTransfer := FDataQuery.FieldByName('PERMTRANSFDOC').AsInteger;
    PrepareTypeFunding;
    LoadEmbassyData(FundingSum, 
        BankSum, BankVal, BankCount, BankPeriod, PermTransfer);
    OnTourSum := FDataQuery.FieldByName('ONTOURSUM').AsFloat;
    PrepareCondition;
    Result := ShowModal = mrOk;
    if Result then
    begin
     SetEmbassyData(FDataQuery.FieldByName('COMPANYID').Value);
     if not FAsVisaCenter then UpdatePersDocFunding(FundingSum, BankSum, OnTourSum);
    end;
  finally
    Free;
  end;
end;

procedure TFundingDlg.SumMaskEditExit(Sender: TObject);
begin
  inherited;
  with (Sender as TazEdit) do if Trim(Text) = '' then Text := '0'
end;

procedure TFundingDlg.SumMaskEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if Key = '.' then Key := ',';
  if not (Key in ['0'..'9',#8{,','}]) then Key := #0;
end;

procedure TFundingDlg.OnTourCheckBoxClick(Sender: TObject);
begin
  inherited;
  OnTourSumEdit.Enabled := OnTourCheckBox.Checked;
end;

procedure TFundingDlg.UpdatePersDocFunding(FundingSum, BankSum, OnTourSum: real);
var nOnTourSum, nNecessarySum, nBankSum: Double;
begin                                 
  with OnTourSumEdit do
  if Enabled then TryStrToFloat(OnTourSumEdit.Text, nOnTourSum)
  else nOnTourSum := 0;
  TryStrToFloat(NecessarySumMaskEdit.Text, nNecessarySum);
  TryStrToFloat(BankSumEdit.Text, nBankSum);
  if (FundingSum <> nNecessarySum) or (BankSum <> nBankSum)
    or (OnTourSum <> nOnTourSum)
  then UpdatePersDoc
end;

procedure TFundingDlg.LoadEmbassyData(FundingSum: Real; 
          BankSum: Real; BankVal, BankCount, BankPeriod,
          PermTransfer: Integer);
begin                      
  NecessarySumMaskEdit.Text := FloatToStr(FundingSum);
  BankSumEdit.Text := FloatToStr(BankSum);
  with FDataQuery.FieldByName('FUNDINGVAL') do 
  if IsNull then CurrComboBox.ItemIndex := -1
  else CurrComboBox.ItemIndex := Value;
  BankCurrComboBox.ItemIndex := BankVal;
  FundingCountEdit.Value := FDataQuery.FieldByName('FUNDINGCOUNT').AsInteger;
  BankCountEdit.Value := BankCount;

  with FDataQuery.FieldByName('FUNDINGPERIOD') do 
  if IsNull then PeriodComboBox.ItemIndex := -1
  else PeriodComboBox.ItemIndex := Value;
              
  BankPeriodComboBox.ItemIndex := BankPeriod;
  PermAlgolCheckBox.Checked := PermTransfer in [1, 3];
  PermOtherCheckBox.Checked := PermTransfer in [2, 3];
  PayServEdit.Text := FDataQuery.FieldByName('PAYBANKSERV').AsString;
  BankPayCheckBox.Checked := not FDataQuery.FieldByName('PAYBANKSERV').IsNull;
  ReadyToDaysEdit.Text := FDataQuery.FieldByName('READYTODAYS').AsString;
  AutoFilingCheckBox.Checked := FDataQuery.FieldByName('AUTOFILLING').AsBoolean;
  UseCodeCheckBox.Checked := FDataQuery.FieldByName('USECODE').AsBoolean;
  WorkFilingCheckBox.Checked := FDataQuery.FieldByName('FilingPlaceWork').AsBoolean;
  TypeFundingComboBox.ItemId := FDataQuery.FieldByName('TypeFunding').AsInteger;
//  FullFundingCheckBox.Checked := FDataQuery.FieldByName('FullFunding').AsBoolean;
  with FDataQuery.FieldByName('OURFILING') do 
  if not IsNull then begin
    OurFilingRadioButton.Checked := AsBoolean;
    TouristRadioButton.Checked := not AsBoolean;
  end;
  with FDataQuery.FieldByName('READYTOTYPE') do 
  if not IsNull then begin
    CalendarRadioButton.Checked := Value = 0;
    JobRadioButton.Checked := Value = 1;
  end;                    
  with FDataQuery.FieldByName('APPLTYPEDATE') do 
  if not IsNull then begin
    FilingDateRadioButton.Checked := Value = 0;
    PrintDateRadioButton.Checked := Value = 1;
  end;

  ServCheckBox.Checked := not FDataQuery.FieldByName('SERVCOST').IsNull;
  with FDataQuery.FieldByName('SERVCOSTVAL') do
  if IsNull then ServCostValComboBox.ItemIndex := -1
  else ServCostValComboBox.ItemIndex := Value;
  ServCostEdit.Text := FDataQuery.FieldByName('SERVCOST').AsString;
  ServCheckBoxClick(nil);
        
  if not FDataQuery.FieldByName('CURRSERV').IsNull
  then ValSerComboBox.ItemIndex := FDataQuery.FieldByName('CURRSERV').Value
  else ValSerComboBox.ItemIndex := -1;
  with OnTourCheckBox do
  begin
    Checked := FDataQuery.FieldByName('ONTOURSUM').AsFloat > 0;
    if Checked then
      OnTourSumEdit.Text := FDataQuery.FieldByName('ONTOURSUM').AsString;
  end;
  Memo.Lines.Assign(FDataQuery.FieldByName('COMMENTS'));
  BankPayCheckBoxClick(nil);
end;

procedure TFundingDlg.SetEmbassyData(CompanyId: Integer);
var PermTrans, ReadyToDays: string;
    SetBankSum, SetFundingSum: Boolean;
    st: TStringStream;
begin
 { with DMServ.UpdQry do
  begin                       
    if PermAlgolCheckBox.Checked and PermOtherCheckBox.Checked then PermTrans := '3'
    else if PermAlgolCheckBox.Checked then PermTrans := '1'
    else if PermOtherCheckBox.Checked then PermTrans := '2'
    else PermTrans := 'Null'; 

    if Trim(ReadyToDaysEdit.Text) = EmptyStr then ReadyToDays := 'null'
    else ReadyToDays := ReadyToDaysEdit.Text;
    SetBankSum := SafeStrToFloat(BankSumEdit.Text) > 0;
    SetFundingSum := SafeStrToFloat(NecessarySumMaskEdit.Text) > 0;

    SQL.Text := Format(UpdCntrEmbassSQL,
     [
     IfThen(SetFundingSum, NecessarySumMaskEdit.Text, 'null'),
     IfThen(SetFundingSum, IntToStr(CurrComboBox.ItemIndex), 'null'),
     IfThen(SetFundingSum, IntToStr(FundingCountEdit.Value), 'null'),
     IfThen(SetFundingSum, IntToStr(PeriodComboBox.ItemIndex), 'null'),
     
     IfThen(SetBankSum, BankSumEdit.Text, 'null'),
     IfThen(SetBankSum, IntToStr(BankCurrComboBox.ItemIndex), 'null'),
     IfThen(SetBankSum, BankCountEdit.Text, 'null'),
     IfThen(SetBankSum, IntToStr(BankPeriodComboBox.ItemIndex), 'null'),
     IfThen(OnTourCheckBox.Checked, OnTourSumEdit.Text, 'null'),
     PermTrans,

     IfThen(BankPayCheckBox.Checked, PayServEdit.Text, 'null'),
     IfThen(BankPayCheckBox.Checked, IntToStr(ValSerComboBox.ItemIndex), 'null'),
     ReadyToDays, GetReadyToRB,
     IfThen(AutoFilingCheckBox.Checked, #39'T'#39, 'null'),
     IfThen(UseCodeCheckBox.Checked, #39'T'#39, 'null'),
     IfThen(OurFilingRadioButton.Checked, #39'T'#39, #39'F'#39),
     GetAppltypeDate,
     IfThen(ServCheckBox.Checked, ServCostEdit.Text, 'null'),
     IfThen(ServCheckBox.Checked, IntToStr(ServCostValComboBox.ItemIndex), 'null'),
     IfThen(WorkFilingCheckBox.Checked, #39'T'#39, 'null'),
     IfThen(TypeFundingComboBox.ItemId = 4, #39'T'#39, 'null'),
     IfThen(TypeFundingComboBox.ItemId > 0, IntToStr(TypeFundingComboBox.ItemId), 'null'),
     Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger, CompanyId]);
    try
      st := TStringStream.Create(Trim(Memo.Lines.Text));
      DMServ.UpdQry.Parameters.ParamByName('COMMENTS').LoadFromStream(st, ftBlob);
    finally
      st.Free;
    end;
    ExecSQL;
  end;  }
end;

procedure TFundingDlg.UpdatePersDoc;
const
    UpdSQL = 'Update PersVisas ' +
       'Set COMPAREEMBASSYDOC = ''%s'', FundingIsGood = ''%s'' ' +
       'Where PersVisaId = %d and DocumState < 6';
    sSet: array[Boolean] of string = ('F', 'T');
var SumaTotal, SumaBank, SumaFundingOrig,
    SumaBankOrig, OnTourSum: Real;
    PersVisaId, CntryId, EmbassyId: Integer;
    TourDayCount: Integer;
    CompareDoc, GoodFunding: string;
  function CommCurr(CurrId: Real): Real;
  begin
    with CommCurrQry do
    begin
      Close;
      ParamByName('CurrId').Value := CurrId;
      Open;
      Last;
      Result := CommCurrQryRATE.Value;
      Close;
    end;
  end;
begin
 (* FCurrArr[0] := 1; //UAH
  FCurrArr[1] := CommCurr(8); //USD
  FCurrArr[2] := CommCurr(37); //EURO
  CntryId := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;
  with Sel_Pers_HaveFDocQry do
  begin
    ParamByName('CountryId').Value := CntryId;
    Open;
    while not Eof do
    begin
      PersVisaId := Sel_Pers_HaveFDocQryPERSVISAID.Value;
      EmbassyId := Sel_Pers_HaveFDocQryEMBASSYID.Value;
      SumaTotal := PersFunding(PersVisaId, CntryId, EmbassyId, SumaBank,
        SumaFundingOrig, SumaBankOrig, OnTourSum);
      TourDayCount  := Sel_Pers_HaveFDocQryTOURDAYCOUNT.Value;

      if (SumaFundingOrig > SumaTotal)
         and (( SumaBankOrig = 0 )
          or ( SumaBankOrig  > (SumaBank - OnTourSum)/ TourDayCount ))
      then CompareDoc := 'T'
      else CompareDoc := 'F';
      if Sel_Pers_HaveFDocQryEMBASSYID.IsNull and (CompareDoc = 'T')
      then CompareDoc := 'D';
      GoodFunding := sSet[( SumaFundingOrig <= SumaTotal )
           or ( SumaBankOrig <= (SumaBank - OnTourSum) / TourDayCount )] ;
      DMServ.WorkQuery.SQL.Text := Format(UpdSQL, [CompareDoc, GoodFunding,{AreDoc,} PersVisaId]);
      DMServ.WorkQuery.ExecSQL;
      Next;
    end;
    Close;
  end;  *)
end;

function TFundingDlg.PersFunding(PersVisaId, CntrId, EmbassyId: Integer;
            var SumaBank, SumaFundingOrig, SumaBankOrig, OnTourSum: Real): Real;
const Param: array[1..2] of string = ('G', 'T');
begin
  SumaBank := 0;
  with PersFundingQry do
  begin
    ParamByName('EmbassyId').Value := EmbassyId;
    ParamByName('CntryId').Value := CntrId;
    ParamByName('PersVisaId').Value := PersVisaId;
    ParamByName('RateUsd').Value := FCurrArr[1];
    ParamByName('RateEuro').Value := FCurrArr[2];
    Open;
    Result := PersFundingQrySumaFunding.Value;
    SumaBank := PersFundingQrySumaBank.Value;
    SumaFundingOrig := PersFundingQrySumaOrigin.Value;
    SumaBankOrig := PersFundingQrySumaBankOrigin.Value;
    OnTourSum := PersFundingQryOnTourSum.Value;
    Close;
  end;
end;

procedure TFundingDlg.ServCheckBoxClick(Sender: TObject);
begin
  inherited;
  ServCostEdit.Enabled := ServCheckBox.Checked;
  ServCostValComboBox.Enabled := ServCheckBox.Checked;
end;

procedure TFundingDlg.AutoFilingLabelClick(Sender: TObject);
begin
  inherited;
  with AutoFilingCheckBox do Checked := not Checked;
end;

function TFundingDlg.GetReadyToRB: string;
begin
  if CalendarRadioButton.Checked then Result := '0'
  else if JobRadioButton.Checked then Result := '1'
  else Result := 'null';
end;

function TFundingDlg.GetAppltypeDate: string;
begin
  if FilingDateRadioButton.Checked then Result := '0'
  else if PrintDateRadioButton.Checked then Result := '1'
  else Result := 'null';
end;

procedure TFundingDlg.BankPayCheckBoxClick(Sender: TObject);
begin
  inherited;
  PayServEdit.Enabled := BankPayCheckBox.Checked;
  ValSerComboBox.Enabled := BankPayCheckBox.Checked;
end;

procedure TFundingDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ModalResult = mrOk then CanClose := CheckSumOnTour
    and CheckFundingSum and CheckServCost and CheckBankPay 
    and CheckReadyToDays and CheckFiling and CheckApplDate;
end;

function TFundingDlg.CheckSumOnTour: Boolean;
begin
  Result := not OnTourCheckBox.Checked or (SafeStrToInt(OnTourSumEdit.Text) > 0);
  if not Result then begin
    ErrorDlg('Не вказана сума на весь тур!');
    ActiveControl := OnTourSumEdit;
  end;
end;

function TFundingDlg.CheckServCost: Boolean;
begin
  Result := not FAsVisaCenter;
  if not Result then begin
    Result := not ServCheckBox.Checked or (SafeStrToInt(ServCostEdit.Text) > 0);
    if not Result then begin
      ErrorDlg('Не вказана сума послуг візового центру!');
      ActiveControl := ServCostEdit;    
      Exit;
    end;
    Result := not ServCheckBox.Checked or (ServCostValComboBox.ItemIndex >= 0);
    if not Result then begin
      ErrorDlg('Не вказана валюта послуг візового центру!');
      ActiveControl := ServCostValComboBox;    
      Exit;
    end;
  end;
end;

function TFundingDlg.CheckBankPay: Boolean;
begin
  Result := not FAsVisaCenter;
  if not Result then begin
    Result := not BankPayCheckBox.Checked or (SafeStrToInt(PayServEdit.Text) > 0);
    if not Result then begin
      ErrorDlg('Не вказана сума послуг банку!');
      ActiveControl := PayServEdit;    
      Exit;
    end;
    Result := not BankPayCheckBox.Checked or (ValSerComboBox.ItemIndex >= 0);
    if not Result then begin
      ErrorDlg('Не вказана валюта послуг банку!');
      ActiveControl := ValSerComboBox;    
      Exit;
    end;
  end;
end;

function TFundingDlg.CheckReadyToDays: Boolean;
begin
  Result := not FAsVisaCenter;
  if not Result then begin
    Result :=  SafeStrToInt(ReadyToDaysEdit.Text) > 0;
    if not Result then begin
      ErrorDlg('Не вказано термін розгляду документів!');
      ActiveControl := ReadyToDaysEdit;    
      Exit;  
    end;
    Result := CalendarRadioButton.Checked or JobRadioButton.Checked;
    if not Result then begin
      ErrorDlg('Не вказано тип розгляду документів!');
      ActiveControl := ReadyToDaysEdit;    
      Exit;  
    end;
  end;
end;

function TFundingDlg.CheckFiling: Boolean;
begin
  Result := not FAsVisaCenter or OurFilingRadioButton.Checked or TouristRadioButton.Checked;
  if not Result then ErrorDlg('Не вказано ким подаються документи!');
end;

function TFundingDlg.CheckApplDate: Boolean;
begin
  Result := not FAsVisaCenter or FilingDateRadioButton.Checked or PrintDateRadioButton.Checked;
  if not Result then ErrorDlg('Не вказано "Дата подачі на аплікаційній формі"!');
end;

function TFundingDlg.CheckFundingSum: Boolean;
begin
  Result := SafeStrToFloat(NecessarySumMaskEdit.Text) = 0;
  if Result then Exit;
  Result := CurrComboBox.ItemIndex >= 0;
  if not Result then begin
    ErrorDlg('Не вказано валюту доходу!');
    ActiveControl := CurrComboBox;
    Exit;  
  end;
  Result := FundingCountEdit.Value > 0;
  if not Result then begin
    ErrorDlg('Не вказано період доходу!');
    ActiveControl := FundingCountEdit;    
    Exit;  
  end;  
  Result := PeriodComboBox.ItemIndex >= 0;
  if not Result then begin
    ErrorDlg('Не вказано тип періоду доходу!');
    ActiveControl := PeriodComboBox;    
    Exit;  
  end;  
end;

procedure TFundingDlg.PrepareTypeFunding;
begin
  with Elem_ANKETTEMPQry.DB do begin
    if not Active then Open;
    Locate('CountryId', Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger, []);
    if  Elem_ANKETTEMPQry.DB.FieldByName('GAINSUM').AsBoolean and Elem_ANKETTEMPQry.DB.FieldByName('BANKSUM').AsBoolean then begin
      TypeFundingComboBox.Items.AddObject('Основний дохід або банк', Pointer(3));
      TypeFundingComboBox.Items.AddObject('Основний дохід і банк', Pointer(4));
    end else if Elem_ANKETTEMPQry.DB.FieldByName('GAINSUM').AsBoolean
    then TypeFundingComboBox.Items.AddObject('Тільки основний дохід', Pointer(1))
    else if Elem_ANKETTEMPQry.DB.FieldByName('BANKSUM').AsBoolean
    then TypeFundingComboBox.Items.AddObject('Тільки банк', Pointer(2));

  end;
  TypeFundingComboBoxChange(nil);
end;

procedure TFundingDlg.TypeFundingComboBoxChange(Sender: TObject);
var EnBank, EnFunding: Boolean;    
begin
  inherited;  
  with TypeFundingComboBox do begin
    EnFunding := (ItemId > 0) and (ItemId <> 2);
    EnBank := (ItemId > 0) and (ItemId <> 1);
  end;
 { ToggleControlEnabled(NecessarySumMaskEdit, EnFunding);
  ToggleControlEnabled(CurrComboBox, EnFunding);
  ToggleControlEnabled(FundingCountEdit, EnFunding);
  ToggleControlEnabled(PeriodComboBox, EnFunding);

  ToggleControlEnabled(BankSumEdit, EnBank);
  ToggleControlEnabled(BankCurrComboBox, EnBank);
  ToggleControlEnabled(BankCountEdit, EnBank);
  ToggleControlEnabled(BankPeriodComboBox, EnBank);
  ToggleControlEnabled(OnTourCheckBox, EnBank);
  ToggleControlEnabled(OnTourSumEdit, EnBank);  }
end;

procedure TFundingDlg.PrepareCondition;
begin
  if FAsVisaCenter then Height := Height - FundingCondPanel.Height
  else Height := Height - ServPanel.Height - OutherPanel.Height;// - FilingPanel.Height;
  FundingCondPanel.Visible := not FAsVisaCenter;
  ServPanel.Visible := FAsVisaCenter;
//  FilingPanel.Visible := FAsVisaCenter;
  OutherPanel.Visible := FAsVisaCenter;
end;

procedure TFundingDlg.Label6Click(Sender: TObject);
begin
  inherited;
  with WorkFilingCheckBox do Checked := not Checked;
end;

procedure TFundingDlg.ImageClick(Sender: TObject);
begin
  inherited;
  case (Sender as TImage).Tag of 
  0: InformDlg('Дохід:'#13#10 +
    'а) основний (зарплата, дохід підприємця, пенсія):'#13#10 +
    '    - відмічається чек-бокс "основний дохід"'#13#10 +
    '    - проставляється "посада"'#13#10 +
    '    - не проставляється "група"'#13#10 +
    'б) додаткове фінансування власне - додається до суми власного основного, якщо її бракує:'#13#10 +
    '    - відмічається чек-бокс "додаткове фінансування"'#13#10 +
    '    - проставляється "посада"'#13#10 +
    '    - проставляється 5-а група'#13#10 +
    '    - проставляється відповідна до посади підгрупа'#13#10 +
    'в) додаткове фінансування від інших осіб - додається до суми власного фінансування, якщо її бракує:'#13#10 +
    '    - відмічається чек-бокс "додаткове фінансування"'#13#10 +
    '    - проставляється 1-а, 2-а, 3-я або 4-а група залежно від того, хто фінансує');
  1: InformDlg('Банк:'#13#10 +
    'а) власний основний:'#13#10 +
    '    - відмічається чек-бокс "банк"'#13#10 +
    '    - не проставляється "група"'#13#10 +
    'б) власний додатковий - додається до суми власного основного, якщо її бракує:'#13#10 +
    '    - відмічається чек-бокс "банк"'#13#10 +
    '    - проставляється 5-а "група"'#13#10 +
    'в) від інших осіб - додається до суми власних банків, якщо її бракує:'#13#10 +
    '    - відмічається чек-бокс "банк"'#13#10 +
    '    - проставляється 1-а, 2-а, 3-я або 4-а група залежно від того, хто фінансує'#13#10#13#10 + 
    'Логіка відбору документів:'#13#10 +
    '1. В анкеті туриста на закладці "Робота" незалежно від того, чи проставлено консульство чи ні,'#13#10 +
    '    але поки не прийнято відповідного документу "Банк", є доступним чек-бокс "Банк відповідає вимогам".'#13#10 +
    '2. Якщо проставлено консульство - проставлення чек-боксу відсортовує документи.'#13#10 +
    '3. Факт проставлення консульства, поки не прийнято відповідного документу "Банк", не знімає чек-бокс.'#13#10 +
    '4. Прийняття відповідного документу "Банк", незалежно від вказаної в ньому суми:'#13#10 +
    '   - відсортовує документи'#13#10 +
    '   - знімає чек-бокс "Банк відповідає вимогам".'#13#10 +
    '5. Повернення будь-якої кількості документів "Банк" не відмічає чек-бокс.'#13#10 +
    '6. Перенесення на інший тур туриста без жодного прийнятого документу "Банк" знімає чек-бокс'#13#10 +
    '7. Перенесення на інший тур туриста хоча б з одним прийнятим документом "Банк"- відсортовує документи.');
  end;
end;

end.
