unit EmbassyDocEdtDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ExtCtrls, DB, DBTables, DBCtrls,
  Mask, ComCtrls, AzComboBox, StdActns, ActnList, Menus,
  AzEdit, ShellApi,IBTable, IBQuery, IBCustomDataSet,UnitProjectProc;

type
{  TVisaDocumentInfo = class
  private
    FCaption: String;
    FDocumentId: Integer;
    FVisaDocumentId: Integer;
    FObligatory: Boolean;
    FNeedCount: Integer;
    FAgeRestrict: Integer;
    FExpireMonth: Integer;
    FIssuedMonth: Integer;
  end; }
  TEmbassyDocEditDlg = class(TForm)
    Panel1: TPanel;
    NeedCountEdit: TSpinEdit;
    AgeRestrictCheckBox: TCheckBox;
    AgeRestrictGroupBox: TGroupBox;
    AgeRestrictYearLabel: TLabel;
    AgeBeforeRadioButton: TRadioButton;
    AgeAfterRadioButton: TRadioButton;
    AgeRestrictEdit: TSpinEdit;
    ExpireMonthCheckBox: TCheckBox;
    IssuedMonthCheckBox: TCheckBox;
    ExpireMonthEdit: TSpinEdit;
    IssuedMonthEdit: TSpinEdit;
    DocumVisaSrc: TDataSource;
    VisaDocumTable: TIBTable;
    VisaDocumTableVISADOCUMENTID: TIntegerField;
    VisaDocumTableCOUNTRYID: TIntegerField;
    VisaDocumTableEMBASSYID: TIntegerField;
    VisaDocumTableDOCID: TIntegerField;
    VisaDocumTableNEEDCOUNT: TIntegerField;
    VisaDocumTableAGERESTRICTION: TIntegerField;
    VisaDocumTableEXPIREMONTHS: TIntegerField;
    VisaDocumTableISSUEDMONTHS: TIntegerField;
    DocNameLabel: TLabel;
    NecessarySumCheckBox: TCheckBox;
    MemoLabel: TLabel;
    VisaDocumTableSUMMA: TFloatField;
    Label2: TLabel;
    TypeDocQry: TIBQuery;
    TypeDocQryID: TIntegerField;
    TypeDocQryNAME: TStringField;
    TypeDocComboBox: TAzComboBox;
    VisaDocumTablePERIOD: TIntegerField;
    VisaDocumTableISUSE: TStringField;
    IsUseCheckBox: TCheckBox;
    ExpirePeriodComboBox: TAzComboBox;
    IssuedPeriodComboBox: TAzComboBox;
    VisaDocumTableEXPIREPERIOD: TIntegerField;
    VisaDocumTableISSUESPERIOD: TIntegerField;
    VisaDocumTableTYPEVAL: TIntegerField;
    Memo1: TMemo;
    TypeDocTable: TIBTable;
    TypeDocTableVISATYPEDOCID: TIntegerField;
    TypeDocTableDOCID: TIntegerField;
    TypeDocTableTYPEID: TIntegerField;
    VisaDocumTableTYPEDOCID: TIntegerField;
    VisaDocumTableCOMMENTS: TMemoField;
    MARRIEDCheckBox: TCheckBox;
    PosadaCheckBox: TCheckBox;
    MarriedComboBox: TAzComboBox;
    PosadaComboBox: TAzComboBox;
    IndCheckBox: TCheckBox;
    ManualCheckBox: TCheckBox;
    VisaDocumTableFORADDMANUAL: TStringField;
    VisaDocumTableFORIND: TStringField;
    VisaDocumTablePOSADA: TIntegerField;
    VisaDocumTableMARRIEDSTATE: TIntegerField;
    PosadaQry: TIBQuery;
    PosadaQryPOSADANAMEID: TIntegerField;
    PosadaQryPOSADANAME: TStringField;
    PosadaQrySORTORDER: TIntegerField;
    VisaDocumTableFUNDING: TStringField;
    ReturnedCheckBox: TCheckBox;
    VisaDocumTableRETURNED: TStringField;
    VisaDocumTableTRANSMIT: TStringField;
    TransmitCheckBox: TCheckBox;
    CheckQry: TIBQuery;
    VisaDocumTableFUNDINGCOUNT: TIntegerField;
    FundingGroupBox: TGroupBox;
    GainRadioButton: TRadioButton;
    FundingRadioButton: TRadioButton;
    BankRadioButton: TRadioButton;
    WithOutSumCheckBox: TCheckBox;
    BeginDocCheckBox: TCheckBox;
    DocForLastCheckBox: TCheckBox;
    DocForLastEdit: TSpinEdit;
    DocForLastPeriodComboBox: TAzComboBox;
    VisaDocumTableBEGINDOC: TStringField;
    VisaDocumTableDOCFORLASTCOUNT: TIntegerField;
    VisaDocumTableDOCFORLASTPERIOD: TIntegerField;
    IssuedLabel: TLabel;
    BeginDocLabel: TLabel;
    ExpireDocLabel: TLabel;
    LinkBtn: TSpeedButton;
    BeforeFilingCheckBox: TCheckBox;
    BeforeFilingLabel: TLabel;
    BeforeFilingEdit: TSpinEdit;
    BeforeFilingComboBox: TAzComboBox;
    VisaDocumTableBEFOREFILING: TIntegerField;
    VisaDocumTableBEFOREFILINGPERIOD: TIntegerField;
    BankWithOutSumCheckBox: TCheckBox;
    VisaDocumTableBANKWITHOUTSUM: TStringField;
    FilingAtWorkCheckBox: TCheckBox;
    FilingAtWorkImage: TImage;
    VisaDocumTableFILINGATWORK: TStringField;
    VisaDocumTableFOROWNERVISA: TSmallintField;
    Label1: TLabel;
    ForComboBox: TAzComboBox;
    VisaDocumTableDOCFOR: TIntegerField;
    procedure NeedCountCheckBoxClick(Sender: TObject);
    procedure AgeRestrictCheckBoxClick(Sender: TObject);
    procedure ExpireMonthCheckBoxClick(Sender: TObject);
    procedure IssuedMonthCheckBoxClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NecessarySumCheckBoxClick(Sender: TObject);
    procedure NecessarySumMaskEditKeyPress(Sender: TObject; var Key: Char);
    procedure MARRIEDCheckBoxClick(Sender: TObject);
    procedure PosadaCheckBoxClick(Sender: TObject);
    procedure FundingRadioButtonClick(Sender: TObject);
    procedure DocForLastCheckBoxClick(Sender: TObject);
    procedure IssuedLabelClick(Sender: TObject);
    procedure WithOutSumCheckBoxClick(Sender: TObject);
    procedure LinkBtnClick(Sender: TObject);
    procedure BeforeFilingCheckBoxClick(Sender: TObject);
    procedure FilingAtWorkImageClick(Sender: TObject);
    procedure ForOwnerVisaCheckBoxClick(Sender: TObject);
    procedure PosadaComboBoxChange(Sender: TObject);
  private
    { Private declarations }
//    FDocumentInfo: TVisaDocumentInfo;
    FDOCID: Integer;
    FTypeDocID: Integer;
    FVisaDocumentId: Integer;
    FMEMO: String;
    FSelectDoc: Boolean;
    FDefNeedCount: Integer;
    FDefIsUseCheckBox: Boolean;
    FDefAgeRestrictCheckBox: Boolean;
    FDefAgeBeforeRadioButton: Boolean;
    FDefAgeRestrictEdit: Integer;
    FDefMARRIEDCheckBox: Boolean;
    FDefMarriedComboBox: Integer;
    FDefPosadaCheckBox: Boolean;
    FDefPosadaComboBox: Integer;
    FDefNecessarySumCheckBox: Boolean;
    FDefIndCheckBox: Boolean;
    FDefManualCheckBox: Boolean;
    FInputErrorCodeStr :string;
    FLink: string;
    procedure LoadDocumentInfo;
    procedure RememberDocInfo;
    function DataInfoChanged: Boolean;
  protected
    procedure SearchInputError;
    procedure GotoInputError;
    procedure PrepareDataFields;
    procedure LoadDataFields;
  end;
function ExecuteEmbassyDocEdit(var EmbassyDocId: Integer; DocumName: String;
  SelectDoc: Boolean; DocId, TypeDocId: Integer;
  MEMO: String; var DataChanged: Boolean; Link: TField): Boolean;
{var
  EmbassyDocEditDlg: TEmbassyDocEditDlg;}

implementation

uses  TourConsts, TourCmnlIf, ServMod, OrderUn,
  ServModIB;

{$R *.dfm}
function ExecuteEmbassyDocEdit(var EmbassyDocId:Integer; DocumName: String;
  SelectDoc: Boolean; DocId, TypeDocId: Integer;
  MEMO: string; var DataChanged: Boolean; Link: TField): Boolean;
begin
  with TEmbassyDocEditDlg.Create(Application) do
    try
      with VisaDocumTable do
      begin
        Open;
        if not SelectDoc then Locate('VISADOCUMENTID', EmbassyDocId, [])
      end;
      with PosadaQry do if not Active then Open;
      if SelectDoc then Caption := Caption + ' - ' + SZTDlgCaptionAppend
      else Caption := Caption + ' - ' + SZTDlgCaptionEdit;
      TypeDocQry.Open;
      DocNameLabel.Caption := DocumName;
      FDOCID := DocId;
      FTypeDocID := TypeDocId;
      FMEMO := Memo;
      FSelectDoc := SelectDoc;
      if Assigned(Link) then
      begin
        LinkBtn.Visible := not LINK.IsNull;
        if not LINK.IsNull then FLink := Link.Value;
      end;
      Result := ShowModal = mrOk;
    finally
      EmbassyDocId := FVisaDocumentId;
      DataChanged := DataInfoChanged;
      Free;
    end;
end;

procedure TEmbassyDocEditDlg.NeedCountCheckBoxClick(Sender: TObject);
begin
  inherited;
//  ToggleControlEnabled(NeedCountEdit, NeedCountCheckBox.Checked);
end;

procedure TEmbassyDocEditDlg.AgeRestrictCheckBoxClick(Sender: TObject);
begin
  inherited;
  ToggleGroupControls(AgeRestrictGroupBox, AgeRestrictCheckBox.Checked);
  if not (AgeBeforeRadioButton.Checked or AgeAfterRadioButton.Checked)
  then AgeBeforeRadioButton.Checked := AgeRestrictCheckBox.Checked
end;

procedure TEmbassyDocEditDlg.ExpireMonthCheckBoxClick(Sender: TObject);
begin
  inherited;
  ToggleControlEnabled(ExpireMonthEdit, ExpireMonthCheckBox.Checked);
  ToggleControlEnabled(ExpirePeriodComboBox, ExpireMonthCheckBox.Checked);
end;

procedure TEmbassyDocEditDlg.IssuedMonthCheckBoxClick(Sender: TObject);
begin
  inherited;
  ToggleControlEnabled(IssuedMonthEdit, IssuedMonthCheckBox.Checked);
  ToggleControlEnabled(IssuedPeriodComboBox, IssuedMonthCheckBox.Checked);
end;

procedure TEmbassyDocEditDlg.LoadDocumentInfo;
begin
  ToggleControlEnabled(TypeDocComboBox, FSelectDoc);
  if not FSelectDoc then
  begin
   with TypeDocTable do
   begin
    if not Active then Open;
    Locate('VISATYPEDOCID', FTypeDocID, [] );
    with TypeDocComboBox do
    ItemIndex := Items.IndexOfObject(Pointer(TypeDocTableTYPEID.AsInteger));
   end;
  with VisaDocumTableNEEDCOUNT do
  begin
    NeedCountEdit.Value := Value;
    NeedCountCheckBoxClick(nil);
  end;
  ForComboBox.ItemId := VisaDocumTableDOCFOR.Value;
  with VisaDocumTableAGERESTRICTION do
  begin
    if Value < 0 then AgeBeforeRadioButton.Checked := True;
    if Value > 0 then AgeAfterRadioButton.Checked := True;
    AgeRestrictEdit.Value := Abs(Value);
    AgeRestrictCheckBox.Checked := Value <> 0;
    AgeRestrictCheckBoxClick(nil);
  end;

  with VisaDocumTableEXPIREMONTHS do
  begin
    ExpireMonthEdit.Value := Value;
    ExpireMonthCheckBox.Checked := not IsNull;
    ExpireMonthCheckBoxClick(nil);
  end;
  with VisaDocumTableEXPIREPERIOD do
  if not IsNull then
    ExpirePeriodComboBox.ItemIndex := Value;

  with VisaDocumTableISSUEDMONTHS do
  begin
    IssuedMonthEdit.Value := Value;
    IssuedMonthCheckBox.Checked := not IsNull;
    IssuedMonthCheckBoxClick(nil);
  end;
  with VisaDocumTableISSUESPERIOD do
  if not IsNull then IssuedPeriodComboBox.ItemIndex := Value;

  with VisaDocumTableDOCFORLASTCOUNT do
  begin
    DocForLastEdit.Value := Value;
    DocForLastCheckBox.Checked := not IsNull;
    DocForLastCheckBoxClick(nil);
  end;
  with VisaDocumTableDOCFORLASTPERIOD do
  if not IsNull then DocForLastPeriodComboBox.ItemIndex := Value;

  with VisaDocumTableBEGINDOC do BeginDocCheckBox.Checked := not IsNull;
//************
  with VisaDocumTableBEFOREFILING do
  begin
    BeforeFilingEdit.Value := Value;
    BeforeFilingCheckBox.Checked := not IsNull;
    BeforeFilingCheckBoxClick(nil);
  end;
  with VisaDocumTableBEFOREFILINGPERIOD do
  if not IsNull then BeforeFilingComboBox.ItemIndex := Value;
//************

  with VisaDocumTableFUNDING do
  begin
    NecessarySumCheckBox.Checked := not IsNull;
    FundingRadioButton.Checked := (Value = 'T') or (Value = 'W');
    GainRadioButton.Checked := Value = 'F' ;
    BankRadioButton.Checked := Value = 'B';
    WithOutSumCheckBox.Checked := Value = 'W'
  end;
  BankWithOutSumCheckBox.Checked := VisaDocumTableBANKWITHOUTSUM.AsBoolean;
  NecessarySumCheckBoxClick(nil);
  FundingRadioButtonClick(nil);

  Memo1.Text := VisaDocumTableCOMMENTS.Value;
  end else Memo1.Text := FMemo;
  IsUseCheckBox.Checked := ( VisaDocumTableIsUse.Value = 'T' ) or FSelectDoc;
  with VisaDocumTableFORIND do
    IndCheckBox.Checked := Value = 'T';
  with VisaDocumTableFORADDMANUAL do
    ManualCheckBox.Checked := Value = 'T';
  with VisaDocumTableTRANSMIT do
    TransmitCheckBox.Checked := Value = 'T';
  MarriedIdentsToStrings(True, True, MarriedComboBox.Items);
  with VisaDocumTableMARRIEDSTATE do
  begin
    MARRIEDCheckBox.Checked := not IsNull;
    if IsNull then MarriedComboBox.ItemIndex := -1
    else MarriedComboBox.ItemIndex := Value;
  end;
  with VisaDocumTablePOSADA do
  begin
    PosadaCheckBox.Checked := not IsNull;
    if IsNull then PosadaComboBox.ItemIndex := -1
    else PosadaComboBox.ItemId := Value;
  end;
  ReturnedCheckBox.Checked := VisaDocumTableRETURNED.AsBoolean;
//  ForOwnerVisaCheckBox.Checked := not VisaDocumTableFOROWNERVISA.IsNull;
//  OnlyVisaCheckBox.Checked := VisaDocumTableFOROWNERVISA.Value = 2;
  with FilingAtWorkCheckBox do begin
    Visible := Elem_CNTREMBASSIES.DB.fieldByName('FILINGPLACEWORK').asBoolean; //DMServIB.ItsKonsulQryFILINGPLACEWORK.AsBoolean;
    FilingAtWorkImage.Visible := Visible;
    if Visible then Checked := VisaDocumTableFILINGATWORK.AsBoolean;
  end;
end;

procedure TEmbassyDocEditDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var VisaTypeDocId, TypeDoc, VisaDocId: Integer;
const RezBool: array[boolean] of string = ('F', 'T');
      WarnPeriod = 'В полі "%s" вказано 0.'#13;
  function CheckPeriod: Boolean;
  var Warn: String;
  begin
    Result := True;
    Warn := '';
    if ExpireMonthEdit.Enabled and ( ExpireMonthEdit.Value = 0 ) then
      Warn := Format( WarnPeriod, [ExpireDocLabel.Caption]);
    if IssuedMonthEdit.Enabled and ( IssuedMonthEdit.Value = 0 ) then
      Warn := Warn + Format( WarnPeriod, [IssuedLabel.Caption]);
    if BeforeFilingEdit.Enabled and ( BeforeFilingEdit.Value = 0 ) then
      Warn := Warn + Format( WarnPeriod, [BeforeFilingLabel.Caption]);
    if Warn <> '' then
      Result := WarningDlgYN(Warn + 'Підтверджуєте?');
    CanClose := Result;
  end;
  function CheckDataDoc(VisaTypeDocId, VisaDocId: Integer): Boolean;
  const CheckAgeSQL = 'Select min(AGERESTRICTION), max(AGERESTRICTION) ' +
          'from VISADOCUMENTS_NEW ' +
          'where CountryId = %d and TypeDocId = %d ' +
          'and VisaDocumentId <> %d and IsUse = ''T'' ';
        CheckFundingSQL = 'Select * ' +
          'from VISADOCUMENTS_NEW V ' +
          'where EmbassyId = %d and '+
          'Posada %s ' +
          'and Funding = ''F'' and Summa > 0 ' +
          'and TypeDocId = %d ' +
          'and VisaDocumentId <> %d and IsUse = ''T''  ';
        CheckMarriedSQL = 'Select * ' +
          'from VISADOCUMENTS_NEW ' +
          'where CountryId = %d and ' +
          'TypeDocId = %d ' +
          'and VisaDocumentId <> %d and IsUse = ''T''  ' +
          'and (MARRIEDSTATE %s )';
        CheckPosadaSQL = 'Select * ' +
          'from VISADOCUMENTS_NEW ' +
          'where CountryId = %d and ' +
          'TypeDocId = %d ' +
          'and VisaDocumentId <> %d and IsUse = ''T''  ' +
          'and (Posada %s )';
        WarnCheckText = 'Увага!'#13#13 +
              'В документі "%s"'#13 +
              'значення поля "%s"'#13 +
              'відрізняється від його значення в такому ж документі'#13 +
              'в інших консульствах (іншому консульстві) країни %s:';
        WarnCheckAge = 'Увага!'#13#13 +
              'В документі "%s"'#13 +
              'в полі "%s"'#13 +
              'значення варіанту "%s"'#13 +
              'відрізняється від його значення в такому ж документі'#13 +
              'в інших консульствах (іншому консульстві) країни %s:';
        WarnCheckFunding = 'Увага!'#13#13 +
              'Документ "Про основний дохід"'#13 +
              'для посади "%s"'#13 +
              'вже існує в межах консульства.';

  var 
      CheckFunding{, CheckAge, CheckMarried, CheckPosada}: Boolean;
      Posada, CntryName, VariantAge: String;
      MariedId, PosadaId: string;
  begin
    Result := True;
    with CheckQry do
    begin
      //перевірка на вік в межах країни
(*      with AgeBeforeRadioButton do
      if Enabled then
      begin
        SQL.Text := Format(CheckAgeSQL, [FCountryId, VisaTypeDocId, VisaDocId{FDocId}]);
        Open;
        if Checked then CheckAge := FieldByName('Max').AsInteger <= 0
        else CheckAge := FieldByName('Min').AsInteger >= 0;
        Close;
      end else CheckAge := True;   
      // перевірка - документ одного типу з матрим.станом має бути один в межах країни
      with MarriedComboBox do
      begin
        if not Enabled then MariedId := 'is not Null'
        else MariedId := '<>' + IntTosTr(MarriedComboBox.ItemIndex) +
              ' or MARRIEDSTATE is  null';

        SQL.Text := Format(CheckMarriedSQL, [FCountryId, VisaTypeDocId, VisaDocId,//FDocId,
                          MariedId]);
        Open;
        CheckMarried := RecordCount = 0;
        Close;
      end;    
      // перевірка - документ одного типу з посадою має бути один в межах країни
      with PosadaComboBox do
      begin
        if not Enabled then PosadaId := 'Is not Null'
        else PosadaId := '<>' + IntTosTr(PosadaComboBox.ItemId) +
              ' or Posada Is Null';
        SQL.Text := Format(CheckPosadaSQL, [FCountryId, VisaTypeDocId, VisaDocId,//FDocId,
                          PosadaId]);
        Open;
        CheckPosada := RecordCount = 0;
        Close;
      end;    *)
      // перевірка - документ про дохід має бути один в межах консульства
      with GainRadioButton do
      if Enabled and Checked then
      begin
        if PosadaComboBox.Enabled then Posada := '=' + IntToStr(PosadaComboBox.ItemId)
        else Posada := 'is Null';
        SQL.Text := Format(CheckFundingSQL, [ Elem_CNTREMBASSIES.DB.fieldByName('COMPANYID').Value , {FDocId,}             // Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger
                          Posada, VisaTypeDocId{FDocId}, VisaDocId]);
        Open;
        CheckFunding := RecordCount = 0;
        Close;
      end else CheckFunding := True;
    end;
    CntryName := Elem_BrCountryQry.DB.FieldByName('NAME').asString;
    if AgeBeforeRadioButton.Checked then
      VariantAge := AgeBeforeRadioButton.Caption
    else if AgeAfterRadioButton.Checked then
      VariantAge := AgeAfterRadioButton.Caption;
{    if not CheckAge then ErrorDlg(Format(WarnCheckAge,
      [DocNameLabel.Caption, 'Обмеження по віку', VariantAge, CntryName]))
    else} if not CheckFunding then ErrorDlg(Format(WarnCheckFunding,
      [PosadaComboBox.Text]));
{    else if not CheckMarried then ErrorDlg(Format(WarnCheckText,
      [DocNameLabel.Caption, 'Сімейний стан', CntryName]))
    else if not CheckPosada then ErrorDlg(Format(WarnCheckText,
      [DocNameLabel.Caption, 'Посада', CntryName]));}
    Result := CheckFunding;// and CheckAge and CheckMarried and CheckPosada;
    CanClose := Result;
  end;
begin
  inherited;
  with VisaDocumTable do
  try
  if (ModalResult = mrOk) and CheckPeriod then
  begin
/////
  with TypeDocTable do
  begin
   if not Active then Open;
   TypeDoc := TypeDocComboBox.ItemId;
   if not Locate('DOCID;TYPEID',VarArrayOf([FDocId, TypeDoc ]), [] ) then
      begin
        Append;
        TypeDocTableDOCID.Value := FDocId;
        TypeDocTableTYPEID.Value := TypeDoc;
        Post;
        Refresh;
        Last;
      end;
   VisaTypeDocId :=  TypeDocTableVISATYPEDOCID.Value;
   VisaDocId := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;
  end;
////
   if  CheckDataDoc(VisaTypeDocId, VisaDocId) then
   begin
    if not FSelectDoc then Edit else Append;
    with VisaDocumTableNEEDCOUNT do
     if NeedCountEdit.Enabled
     then Value := NeedCountEdit.Value
     else Value := 0;
    VisaDocumTableDOCFOR.Value := ForComboBox.ItemId;
    with VisaDocumTableAGERESTRICTION do
     if not AgeRestrictCheckBox.Checked then Value := 0
     else if AgeBeforeRadioButton.Checked then Value := -AgeRestrictEdit.Value
     else if AgeAfterRadioButton.Checked then Value := AgeRestrictEdit.Value
     else Value := 0;

    with VisaDocumTableEXPIREMONTHS do
     if ExpireMonthEdit.Enabled then Value := ExpireMonthEdit.Value
     else Clear;
    with VisaDocumTableEXPIREPERIOD do
     if ExpirePeriodComboBox.Enabled
     then Value := ExpirePeriodComboBox.ItemIndex
     else Clear;

    with VisaDocumTableISSUESPERIOD do
     if IssuedPeriodComboBox.Enabled
     then Value := IssuedPeriodComboBox.ItemIndex
     else Clear;
    with VisaDocumTableISSUEDMONTHS do
     if IssuedMonthEdit.Enabled then Value := IssuedMonthEdit.Value
     else Clear;

    with VisaDocumTableDOCFORLASTPERIOD do
     if DocForLastPeriodComboBox.Enabled
     then Value := DocForLastPeriodComboBox.ItemIndex
     else Clear;
    with VisaDocumTableDOCFORLASTCOUNT do
     if DocForLastEdit.Enabled then Value := DocForLastEdit.Value else Clear;

    with VisaDocumTableBEGINDOC do
     if BeginDocCheckBox.Checked then Value := 'T' else Clear;

    with VisaDocumTableISUSE do
     if IsUseCheckBox.Checked then Value := 'T' else Value := 'F';

    with VisaDocumTableBEFOREFILINGPERIOD do
    if not BeforeFilingComboBox.Enabled then Clear
    else Value := BeforeFilingComboBox.ItemIndex;
    with VisaDocumTableBEFOREFILING do
    if not BeforeFilingEdit.Enabled then Clear
    else Value := BeforeFilingEdit.Value;

    VisaDocumTableCOMMENTS.Value := Memo1.Text;
    VisaDocumTableTYPEDOCID.Value := VisaTypeDocId;
    if FSelectDoc then
    begin
      VisaDocumTableVISADOCUMENTID.Value := 1;
      VisaDocumTableCOUNTRYID.Value := Elem_BrCountryQry.GetValueId;// Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;
      VisaDocumTableEMBASSYID.Value := Elem_CNTREMBASSIES.DB.fieldByName('COMPANYID').Value; //Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
    end;
   VisaDocumTableFORIND.Value := RezBool[IndCheckBox.Checked];
   VisaDocumTableFORADDMANUAL.Value := RezBool[ManualCheckBox.Checked];
   VisaDocumTableTRANSMIT.Value := RezBool[TransmitCheckBox.Checked];
   VisaDocumTableRETURNED.Value := RezBool[ReturnedCheckBox.Checked];
   VisaDocumTableFILINGATWORK.Value := RezBool[FilingAtWorkCheckBox.Checked];
{   with VisaDocumTableFOROWNERVISA do 
   if OnlyVisaCheckBox.Checked then Value := 2
   else if ForOwnerVisaCheckBox.Checked then Value := 1
   else Clear;}
   with VisaDocumTableMARRIEDSTATE do
     if MARRIEDCheckBox.Checked and
          (MarriedComboBox.ItemIndex >= 0) 
     then Value := MarriedComboBox.ItemIndex
     else Clear;
   with VisaDocumTablePOSADA do
     if PosadaCheckBox.Checked and
          (PosadaComboBox.ItemIndex >= 0) 
     then Value := PosadaComboBox.ItemId
     else Clear;
  with VisaDocumTableFUNDING do
  if not NecessarySumCheckBox.Checked then begin 
    Clear;
    VisaDocumTableBANKWITHOUTSUM.Clear;
  end else  
    if FundingRadioButton.Checked then
      if WithOutSumCheckBox.Checked then Value := 'W'
      else Value :='T'
    else if BankRadioButton.Checked then begin 
      Value :='B';
      VisaDocumTableBANKWITHOUTSUM.Value := sBool[BankWithOutSumCheckBox.Checked]; 
    end else Value := 'F';
  end;
  end;
  finally
    if (ModalResult = mrOk) and CanClose then
    begin
      Post;
      if FSelectDoc then Last;
      FVisaDocumentId := VisaDocumTableVISADOCUMENTID.Value;
    end;
  end;
  TypeDocQry.Close;
end;

procedure TEmbassyDocEditDlg.NecessarySumCheckBoxClick(Sender: TObject);
begin
  inherited;
  ToggleGroupControls(FundingGroupBox, NecessarySumCheckBox.Checked);
  FundingRadioButtonClick(nil);
end;

procedure TEmbassyDocEditDlg.SearchInputError;
var IsUse: Boolean;
begin
  inherited;
  IsUse := IsUseCheckBox.Checked;
  if TypeDocComboBox.ItemId = 0
  then FInputErrorCodeStr := SZTDlgErrTypeDocumentIsNull
  else if (NeedCountEdit.Value = 0) and IsUse
  then FInputErrorCodeStr := SZTDlgErrCountIsNull
  else if (ForComboBox.ItemId = 0) and IsUse
  then begin
    FInputErrorCodeStr := 'Вкажіть для кого призначено документ.';
    ActiveControl := ForComboBox;
  end else if NecessarySumCheckBox.Checked and not GainRadioButton.Checked
       and not FundingRadioButton.Checked and not BankRadioButton.Checked
  then FInputErrorCodeStr := SZTDlgErrFundingIsNull
  else if ExpireMonthEdit.Enabled and (ExpirePeriodComboBox.ItemIndex < 0 )
  then FInputErrorCodeStr := SZTDlgErrExpirePeriodIsNull
  else if IssuedMonthEdit.Enabled and (IssuedPeriodComboBox.ItemIndex < 0)
  then FInputErrorCodeStr := SZTDlgErrIssuedPeriodIsNull
  else if DocForLastEdit.Enabled and (DocForLastEdit.Value = 0)
  then FInputErrorCodeStr := SZTDlgErrDocForLastEditIsNull
  else if DocForLastEdit.Enabled and (DocForLastPeriodComboBox.ItemIndex < 0)
  then FInputErrorCodeStr := SZTDlgErrDocForLastIsNull
  else if AgeRestrictEdit.Enabled and not AgeBeforeRadioButton.Checked and
    not AgeAfterRadioButton.Checked
  then FInputErrorCodeStr := SZTDlgErrIssuedAgeRestrictUnChecked
  else if GainRadioButton.Checked and GainRadioButton.Enabled and
    not PosadaComboBox.Enabled
  then FInputErrorCodeStr := SZTDlgErrPosadaIsNull
  else FInputErrorCodeStr := '';
end;

procedure TEmbassyDocEditDlg.GotoInputError;
begin
  inherited;

  if FInputErrorCodeStr = SZTDlgErrTypeDocumentIsNull then ActiveControl := TypeDocComboBox;
  if FInputErrorCodeStr = SZTDlgErrCountIsNull then ActiveControl := NeedCountEdit;
  if FInputErrorCodeStr = SZTDlgErrFundingIsNull then ActiveControl := FundingGroupBox;//GainRadioButton;
  if FInputErrorCodeStr = SZTDlgErrExpirePeriodIsNull then ActiveControl := ExpirePeriodComboBox;
  if FInputErrorCodeStr = SZTDlgErrIssuedPeriodIsNull then ActiveControl := IssuedPeriodComboBox;
  if FInputErrorCodeStr = SZTDlgErrDocForLastIsNull then ActiveControl := DocForLastPeriodComboBox;
  if FInputErrorCodeStr = SZTDlgErrDocForLastEditIsNull then ActiveControl := DocForLastEdit;
  if FInputErrorCodeStr = SZTDlgErrIssuedAgeRestrictUnChecked then ActiveControl := AgeRestrictEdit;
  if FInputErrorCodeStr = SZTDlgErrPosadaIsNull then ActiveControl := PosadaCheckBox;
end;

procedure TEmbassyDocEditDlg.NecessarySumMaskEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = '.' then Key := ',';
  if not (Key in ['0'..'9',#8,',']) then Key := #0;
end;

procedure TEmbassyDocEditDlg.MARRIEDCheckBoxClick(Sender: TObject);
begin
  inherited;
    ToggleControlEnabled(MARRIEDComboBox, MARRIEDCheckBox.Checked);
end;

procedure TEmbassyDocEditDlg.PosadaCheckBoxClick(Sender: TObject);
begin
  inherited; 
  ToggleControlEnabled(PosadaComboBox, PosadaCheckBox.Checked);
  PosadaComboBoxChange(nil);
//  ToggleControlEnabled(FilingAtWorkCheckBox, PosadaCheckBox.Checked);
end;

procedure TEmbassyDocEditDlg.FundingRadioButtonClick(Sender: TObject);
begin
  inherited;
  with WithOutSumCheckBox do
  begin
    Enabled := FundingRadioButton.Checked and FundingRadioButton.Enabled;
    Checked := Checked and FundingRadioButton.Checked
  end;
  with BankWithOutSumCheckBox do
  begin
    Enabled := BankRadioButton.Checked and BankRadioButton.Enabled;
    Checked := Checked and BankRadioButton.Checked
  end;
end;

procedure TEmbassyDocEditDlg.RememberDocInfo;
begin
  FDefIsUseCheckBox := IsUseCheckBox.Checked;
  FDefNeedCount := NeedCountEdit.Value;
  FDefAgeRestrictCheckBox := AgeRestrictCheckBox.Checked;
  FDefAgeBeforeRadioButton := AgeBeforeRadioButton.Checked;
  FDefAgeRestrictEdit := AgeRestrictEdit.Value;
  FDefMARRIEDCheckBox := MARRIEDCheckBox.Checked;
  FDefMarriedComboBox := MarriedComboBox.ItemId;
  FDefPosadaCheckBox := PosadaCheckBox.Checked;
  FDefPosadaComboBox := PosadaComboBox.ItemId;
  FDefNecessarySumCheckBox := NecessarySumCheckBox.Checked;
  FDefIndCheckBox := IndCheckBox.Checked;
  FDefManualCheckBox := ManualCheckBox.Checked;
end;

function TEmbassyDocEditDlg.DataInfoChanged: Boolean;
begin
  Result := (FDefIsUseCheckBox <> IsUseCheckBox.Checked)
    or (FDefNeedCount <> NeedCountEdit.Value)
    or (FDefAgeRestrictCheckBox <> AgeRestrictCheckBox.Checked)
    or (FDefAgeBeforeRadioButton <> AgeBeforeRadioButton.Checked)
    or (FDefAgeRestrictEdit <> AgeRestrictEdit.Value)
    or (FDefMARRIEDCheckBox <> MARRIEDCheckBox.Checked)
    or (FDefMarriedComboBox <> MarriedComboBox.ItemId)
    or (FDefPosadaCheckBox <> PosadaCheckBox.Checked)
    or (FDefPosadaComboBox <> PosadaComboBox.ItemId)
    or (FDefNecessarySumCheckBox <> NecessarySumCheckBox.Checked)
    or (FDefIndCheckBox <> IndCheckBox.Checked)
    or (FDefManualCheckBox <> ManualCheckBox.Checked)
end;

procedure TEmbassyDocEditDlg.DocForLastCheckBoxClick(Sender: TObject);
begin
  inherited;
  ToggleControlEnabled(DocForLastEdit, DocForLastCheckBox.Checked);
  ToggleControlEnabled(DocForLastPeriodComboBox, DocForLastCheckBox.Checked);
end;

procedure TEmbassyDocEditDlg.IssuedLabelClick(Sender: TObject);
begin
  inherited;
  case (Sender as TLabel).Tag of
    1: with IssuedMonthCheckBox do Checked := not Checked;
    2: with BeginDocCheckBox do Checked := not Checked;
    3: with ExpireMonthCheckBox do Checked := not Checked;
    4: with BeforeFilingCheckBox do Checked := not Checked;
  end;
end;

procedure TEmbassyDocEditDlg.WithOutSumCheckBoxClick(Sender: TObject);
begin
  inherited;
  with Sender as TCheckBox do
  case Tag of 
    0: if WithOutSumCheckBox.Checked then Checked := True;
    1: if BankWithOutSumCheckBox.Checked then Checked := True;
  end;
end;

procedure TEmbassyDocEditDlg.LinkBtnClick(Sender: TObject);
begin
  inherited;
  ShellExecute(0, 'Open', PChar(FLink), nil, nil, SW_SHOW)
end;

procedure TEmbassyDocEditDlg.BeforeFilingCheckBoxClick(Sender: TObject);
begin
  inherited;
  ToggleControlEnabled(BeforeFilingEdit, BeforeFilingCheckBox.Checked);
  ToggleControlEnabled(BeforeFilingComboBox, BeforeFilingCheckBox.Checked);
end;

procedure TEmbassyDocEditDlg.FilingAtWorkImageClick(Sender: TObject);
begin
  inherited;
  with FilingAtWorkCheckBox do if Enabled then Checked := not Checked;
end;

procedure TEmbassyDocEditDlg.ForOwnerVisaCheckBoxClick(Sender: TObject);
begin
  inherited;
{  with OnlyVisaCheckBox do begin 
    Checked := Checked and ForOwnerVisaCheckBox.Checked;
    Enabled := ForOwnerVisaCheckBox.Checked;
  end;}
end;

procedure TEmbassyDocEditDlg.PrepareDataFields;
begin
  inherited;
  DataFieldToStrings(
    TypeDocQryNAME, TypeDocQryID, TypeDocComboBox.Items);
  DataFieldToStrings(
    PosadaQryPOSADANAME, PosadaQryPOSADANAMEID, PosadaComboBox.Items);
  //DMServ.SelectQueryToStrings(
  //  'DocFor_View', '', 'OrderInCategory', 'DocForId', 'ForName', True, True, ForComboBox.Items);
end;

procedure TEmbassyDocEditDlg.LoadDataFields;
begin
  inherited;
  LoadDocumentInfo;
  RememberDocInfo;
end;

procedure TEmbassyDocEditDlg.PosadaComboBoxChange(Sender: TObject);
var En: Boolean;
begin
  inherited;
  with PosadaComboBox do En := (ItemId = nStudentId) or (ItemId = nWorkingId) or (ItemId = nSchoolBoyId);
  FilingAtWorkCheckBox.Enabled := En; 
end;

end.
