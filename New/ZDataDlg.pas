unit ZDataDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDlg, StdCtrls, Buttons, ExtCtrls, Db, DBCtrls;

type
  TInputErrorCode = (iecSuccess, iecSilentError, iecUnknown,
    iecName0IsNull, iecModelNameIsNull, iecSurNameIsNull, iecNameIsNull,
    iecSexIsNull, iecDateIsNull, iecDateLessNow,
    iecSerialNoIsNull, iecSimNoIsNull, iecPhoneAreaIsNull, iecPhoneNoIsNull,
    iecPinCode1IsNull, iecPinCode2IsNull, iecPukCode1IsNull, iecPukCode2IsNull,
    iecParthnerIsNull, iecNumberIsNull, iecContractNumberIsNull,
    iecMaxPersonIsNull, iecDayCountIsNull,
    iecGroupMaxLessMin, iecCurrencyIsNull,
    iecNetValIsNull, iecNetValLessZero,
    iecRateIsNull, iecRateLessZero, iecRateLessNet,
    iecGrpRateIsNull, iecGrpRateLessZero,
    iecAgentPayIsNull, iecAgentPayIsMore,
    iecCountryIsNull, iecManagerIsNull,
    iecTypeDocumentIsNull, iecCountCheckIsNull, iecCountIsNull,
    iecNecessarySumIsNull, iecNecessaryValSumIsNull, iecExpirePeriodIsNull,
    iecIssuedPeriodIsNull, iecAgeRestrictIsNull, iecNecessaryPeriodUnChecked,
    iecMisError, iecNecessaryUnChecked, iecFundingType,
    iecIssueDateIsNull, iecBeginPeriodDateIsNull,
    iecEndPeriodDateIsNull, iecDocForLastCountIsNull,
    iecDocForLastPeriodIsNull, iecUniqueShortTourName,
    iecInsurePayIsNull, iecDateDocTo,
    iecTypePromoIsNull, iecPromoFromDateIsNull,
    iecPromoTillDateIsNull, iecPromoNameIsNull,
    iecPromoLinkIsNull, iecPromoAdultCostIsNull,
    iecPromoChildCostIsNull, iecPromoNewAdultCostIsNull,
    iecPromoNewChildCostIsNull, iecPromoAdultCostAgentIsNull,
    iecPromoNewAdultCostAgentIsNull, iecPromoChildCostAgentIsNull,
    iecPromoNewChildCostAgentIsNull, iecPromoFromDateLesNow,
    iecPromoFromDateLesTillDate, iecShablonShablonIsNull);

type
  TZDataDialog = class(TZDialog)
    DataSource: TDataSource;
    WorkPanel: TPanel;
    Memo: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FBrowseDataSet: TDataSet;
    FGeneratorName: string;
    FInputErrorCode: TInputErrorCode;
    FKeyFieldName: string;
    FMemoFieldName: string;
    FMemoField: TMemoField;
    FViewOnly: Boolean;
    FBrowseKeyField: string;
    FNewRecord: Boolean;
    FFormCaption: string;
    //FEditEnabled: Boolean;    -- ViewOnly
    function CheckDataInput: Boolean;
    function GetBrowseKeyField: string;
    function GetEditDataSet: TDataSet;
    function GetIsNewRecord: Boolean;
    //procedure SetEditEnabled(const Value: Boolean);
    procedure SetMemoFieldName(const Value: string);
    procedure SetViewOnly(const Value: Boolean);
  protected
    procedure DataErrorLookup; virtual;
    procedure DataErrorSearch; virtual;
    function GetComboBoxId(ComboBox: TCustomComboBox): Integer;
    procedure GetComboFieldValue(Combo: TCustomComboBox; Field: TField);
    procedure LoadDataFields; virtual;
    procedure SetComboBoxId(ComboBox: TCustomComboBox; Value: Integer);
    procedure SetComboFieldValue(Combo: TCustomComboBox; Field: TField);
    procedure StoreDataFields; virtual;
    property EditDataSet: TDataSet read GetEditDataSet;
    property GeneratorName: string read FGeneratorName write FGeneratorName; 
    property InputErrorCode: TInputErrorCode read FInputErrorCode write FInputErrorCode;
    property IsNewRecord: Boolean read GetIsNewRecord;
    property MemoFieldName: string read FMemoFieldName write SetMemoFieldName;
    property MemoField: TMemoField read FMemoField; // write FMemoField;
  public
    function ExecuteEditor(
      BrowseSet: TDataSet; const BrowseKey, KeyName: string;
      AddNew: Boolean; Id: Integer; ReadOnly: Boolean = False): Boolean;
    function ExecuteViewer(
      BrowseSet: TDataSet; const BrowseKey, KeyName: string;
      AddNew: Boolean; Id: Integer): Boolean;
    function ShowEditor(AddNew: Boolean; Id: Integer): Boolean;
    property BrowseDataSet: TDataSet read FBrowseDataSet write FBrowseDataSet;
    property BrowseKeyField: string read GetBrowseKeyField write FBrowseKeyField;
    //property EditEnabled: Boolean read FEditEnabled write SetEditEnabled;
    property KeyFieldName: string read FKeyFieldName write FKeyFieldName;
    property NewRecord: Boolean read FNewRecord write FNewRecord;
    property ViewOnly: Boolean read FViewOnly write SetViewOnly;
    property FormCaption: string read FFormCaption write FFormCaption;
  published
    procedure DBNameExit(Sender: TObject);
    procedure DBPersonNameExit(Sender: TObject);
    procedure DBTitleExit(Sender: TObject);
    procedure DBSerialNoKeyPress(Sender: TObject; var Key: Char);
    procedure DBSerialNoExit(Sender: TObject);
    procedure DBDigitalKeyPress(Sender: TObject; var Key: Char);
    procedure DBNumberKeyPress(Sender: TObject; var Key: Char);
    procedure DBPassport0KeyPress(Sender: TObject; var Key: Char);
    procedure DBPassport1KeyPress(Sender: TObject; var Key: Char);
    procedure DBCyrNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBLatNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBEmailKeyPress(Sender: TObject; var Key: Char);
    procedure DBEmailExit(Sender: TObject);
    procedure DBPhoneNoKeyPress(Sender: TObject; var Key: Char);
    procedure DBPhoneNoExit(Sender: TObject);
    procedure DBDateKeyPress(Sender: TObject; var Key: Char);
    procedure DBDateExit(Sender: TObject);
    procedure DBTimeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBoxKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  end;

{var
  ZDataDialog: TZDataDialog;}

implementation

uses DBTables, IBQuery, IBTable,
  TourCmnlIf, TourConsts, TourDbUn, TourStrMag, VDlgs, AzComboBox,
  IBCustomDataSet, ADODB, IBDatabase;

{$R *.DFM}

const
  ftIntegerFields = [ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint];

{ TZDataDialog }

function TZDataDialog.CheckDataInput: Boolean;
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const pInputErrorMsgs: array[TInputErrorCode] of Pointer = (nil, nil,
    @SZTDlgErrUnknown, @SZTDlgErrName0IsNull,
    @SZTDlgErrModelNameIsNull, @SZTDlgErrSurNameIsNull, @SZTDlgErrNameIsNull,
    @SZTDlgErrSexIsNull, @SZTDlgErrDateIsNull, @SZTDlgErrDateLessNow,
    @SZTDlgErrSerialNoIsNull, @SZTDlgErrSimNoIsNull,
    @SZTDlgErrPhoneNumberIsNull, @SZTDlgErrPhoneAreaIsNull,
    @SZTDlgErrPinCode1IsNull, @SZTDlgErrPinCode2IsNull,
    @SZTDlgErrPukCode1IsNull, @SZTDlgErrPukCode2IsNull,
    @SZTDlgErrParthnerIsNull,
    @SZTDlgErrNumberIsNull, @SZTDlgErrContractNumberIsNull,
    @SZTDlgErrMaxPersonIsNull, @SZTDlgErrDayCountIsNull,
    @SZTDlgErrGroupMaxLessMin, @SZTDlgErrCurrencyIsNull,
    @SZTDlgErrNetValIsNull, @SZTDlgErrNetValLessZero,
    @SZTDlgErrRateIsNull, @SZTDlgErrRateLessZero, @SZTDlgErrRateLessNet,
    @SZTDlgErrGrpRateIsNull, @SZTDlgErrGrpRateLessZero,
    @SZTDlgErrAgentPayIsNull, @SZTDlgErrAgentPayIsMore,
    @SZTDlgErrCountryIsNull, @SZTDlgErrManagerIsNull,
    @SZTDlgErrTypeDocumentIsNull, @SZTDlgErrCountCheckIsNull, @SZTDlgErrCountIsNull, @SZTDlgErrNecessarySumIsNull,
    @SZTDlgErrNecessaryValSumIsNull, @SZTDlgErrExpirePeriodIsNull, @SZTDlgErrIssuedPeriodIsNull,
    @SZTDlgErrAgeRestrictIsNull, @SZTDlgErrNecessaryPeriodUnChecked,
    @SZTDlgErrMisError, @SZTDlgErrNecessaryUnChecked, @SZTDlgErrFundingType,
    @SZTDlgErrIssueDateIsNull, @SZTDlgErrBeginPeriodDateIsNull,
    @SZTDlgErrEndPeriodDateIsNull, @SZTDlgErrDocForLastCountIsNull,
    @SZTDlgErrDocForLastPeriodIsNull, @SZTDlgErrNotUniqueShortTourName,
    @SZTDlgErrInsurePayIsNull, @SZTDlgErrDateDocTo,
    @SZTDlgErrTypePromoIsNull, @SZTDlgErrPromoFromDateIsNull,
    @SZTDlgErrPromoTillDateIsNull, @SZTDlgErrPromoNameIsNull,
    @SZTDlgErrPromoLinkIsNull, @SZTDlgErrPromoAdultCostIsNull,
    @SZTDlgErrPromoChildCostIsNull, @SZTDlgErrPromoNewAdultCostIsNull,
    @SZTDlgErrPromoNewChildCostIsNull, @SZTDlgErrPromoAdultCostAgentIsNull,
    @SZTDlgErrPromoNewAdultCostAgentIsNull, @SZTDlgErrPromoChildCostAgentIsNull,
    @SZTDlgErrPromoNewChildCostAgentIsNull, @SZTDlgErrPromoFromDateLesNow,
    @SZTDlgErrPromoFromDateLesTillDate, @SZTDlgErrShablonShablonIsNull);

{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
begin
  DataErrorSearch;
  Result := FInputErrorCode = iecSuccess;
  if not Result and (FInputErrorCode <> iecSilentError) then
  begin
    DataErrorLookup;
    ErrorDlg(LoadResString(pInputErrorMsgs[FInputErrorCode]));
  end;
end;

function TZDataDialog.GetBrowseKeyField: string;
begin
  if FBrowseKeyField = '' then Result := KeyFieldName
  else Result := FBrowseKeyField;
end;

function TZDataDialog.GetEditDataSet: TDataSet;
begin
  Result := DataSource.DataSet;
end;

function TZDataDialog.GetIsNewRecord: Boolean;
begin
  Result :=
    Assigned(DataSource.DataSet) and (DataSource.DataSet.State = dsInsert);
end;

{procedure TZDataDialog.SetEditEnabled(const Value: Boolean);
begin
  FEditEnabled := Value;
  OkBtn.Enabled := EditEnabled;
end;}

procedure TZDataDialog.SetMemoFieldName(const Value: string);
begin
  FMemoFieldName := Value;
  if (Value = '') or not Assigned(DataSource.DataSet) then FMemoField := nil
  else
    with DataSource.DataSet do
      if not Assigned(FieldByName(FMemoFieldName))
        or not (FieldByName(FMemoFieldName).DataType in [ftMemo, ftFmtMemo])
        then FMemoField := nil
      else FMemoField := FieldByName(FMemoFieldName) as TMemoField;
  Memo.Visible := Assigned(MemoField);
end;

procedure TZDataDialog.SetViewOnly(const Value: Boolean);
begin
  if Value <> FViewOnly then
  begin
    ToggleGroupReadOnly(WorkPanel, Value);
    OkBtn.Enabled := not Value;
    FViewOnly := Value;
  end;
end;

procedure TZDataDialog.DataErrorLookup;
begin
end;

procedure TZDataDialog.DataErrorSearch;
begin
  FInputErrorCode := iecSuccess;
end;

function TZDataDialog.GetComboBoxId(ComboBox: TCustomComboBox): Integer;
begin
  if not Assigned(ComboBox) then Result := 0
  else if ComboBox is TAzComboBox then
    Result := (ComboBox as TAzComboBox).ItemId
  else if ComboBox is TComboBox then
  begin
    with ComboBox as TComboBox do
      if ItemIndex < 0 then Result := 0
      {$WARN UNSAFE_CAST OFF}
      else Result := Integer(Items.Objects[ItemIndex]);
      {$WARN UNSAFE_CAST ON}
  end
  else Result := 0;
end;

procedure TZDataDialog.GetComboFieldValue(Combo: TCustomComboBox; Field: TField);
begin
  if Combo is TAzComboBox then
  begin
    with Combo as TAzComboBox do
      if Field.DataType in ftIntegerFields then ItemId := Field.AsInteger
      else begin
        if Style = csDropDownList then ItemIndex := Items.IndexOf(Field.AsString)
        else Text := Field.AsString;
      end;
  end
  else if Combo is TComboBox then
  begin
    with Combo as TComboBox do
      if Field.DataType in ftIntegerFields then
        {$WARN UNSAFE_TYPE OFF}
        ItemIndex := Items.IndexOfObject(Pointer(Field.AsInteger))
        {$WARN UNSAFE_TYPE ON}
      else begin
        if Style = csDropDownList then ItemIndex := Items.IndexOf(Field.AsString)
        else Text := Field.AsString;
      end;
  end;
end;

procedure TZDataDialog.LoadDataFields;
begin
end;

procedure TZDataDialog.SetComboBoxId(ComboBox: TCustomComboBox; Value: Integer);
begin
  if Assigned(ComboBox) then Exit
  else if ComboBox is TAzComboBox then
  begin
    with ComboBox as TAzComboBox do
      if Value <= 0 then ItemIndex := -1
      {$WARN UNSAFE_TYPE OFF}
      else ItemIndex := Items.IndexOfObject(Pointer(Value));
      {$WARN UNSAFE_TYPE ON}
  end
  else if ComboBox is TComboBox then
  begin
    with ComboBox as TComboBox do
      if Value <= 0 then ItemIndex := -1
      {$WARN UNSAFE_TYPE OFF}
      else ItemIndex := Items.IndexOfObject(Pointer(Value));
      {$WARN UNSAFE_TYPE ON}
  end;
end;

procedure TZDataDialog.SetComboFieldValue(Combo: TCustomComboBox; Field: TField);
var
  Txt: String;
  Id: Integer;
begin
  if Field.DataType in ftIntegerFields then
  begin
    if Combo is TAzComboBox then
      Id := (Combo as TAzComboBox).ItemId
    {$WARN UNSAFE_CAST OFF}
    else if Combo is TComboBox then
      with Combo as TComboBox do
        if ItemIndex < 0 then Id := 0
        else Id := Integer(Items.Objects[ItemIndex])
    else Id := 0;
    {$WARN UNSAFE_CAST ON}
    with Field as TIntegerField do if Id = 0 then Clear else Value := Id;
  end
  else begin
    if Combo is TAzComboBox then Txt := (Combo as TAzComboBox).Text
    else if Combo is TComboBox then Txt := (Combo as TComboBox).Text;
    with Field do if Txt = '' then Clear else AsString := Txt;
  end;
end;

procedure TZDataDialog.StoreDataFields;
begin
end;

function TZDataDialog.ExecuteEditor(
  BrowseSet: TDataSet; const BrowseKey, KeyName: string;
  AddNew: Boolean; Id: Integer; ReadOnly: Boolean = False): Boolean;
begin
  BrowseDataSet := BrowseSet;
  BrowseKeyField := BrowseKey;
  KeyFieldName := KeyName;
  ViewOnly := ReadOnly;
  Result := ShowEditor(AddNew, Id);
end;

function TZDataDialog.ExecuteViewer(
  BrowseSet: TDataSet; const BrowseKey, KeyName: string;
  AddNew: Boolean; Id: Integer): Boolean;
begin
  Result := ExecuteEditor(BrowseSet, BrowseKey, KeyName, AddNew, Id, True);
end;

function TZDataDialog.ShowEditor(AddNew: Boolean; Id: Integer): Boolean;
const sCapt: array[Boolean] of String = (SZTDlgCaptionEdit, SZTDlgCaptionAppend);
var BrId: Integer;
begin
  if Assigned(DataSource.DataSet) then
  begin
    with EditDataSet do if not Active
     then Open;
    Result := AddNew or DataSource.DataSet.Locate(KeyFieldName, Id, []);
  end
  else Result := False;
  if not Result then
  begin
    ErrorFmtDlg(SZTBrwsErrorRecordNotFound, [KeyFieldName]);
    Exit;
  end;
  FormCaption := Caption;
  Caption := Format('%s - %s', [Caption, sCapt[AddNew]]);
  with EditDataSet do if AddNew then Append else Edit;
  try     
    FNewRecord := AddNew;
    if Memo.Visible then // read into or clear memo if exists memo field
      case AddNew of
        False: Memo.Text := MemoField.AsString;
        True: Memo.Clear;
      end;
    Result := ShowModal = mrOk;
    if Memo.Visible then // store or clear memo field if exists one
    begin
      if Memo.Lines.Count = 0 then MemoField.Clear
      else MemoField.AsString := Memo.Text;
    end;
    with EditDataSet do if Result then Post else Cancel;
  finally
    with EditDataSet do if State in [dsInsert, dsEdit] then Cancel;
  end;
  EditDataSet.Refresh;
  if Result then
  begin
    BrId := EditDataSet.FieldByName(FKeyFieldName).AsInteger;
    if EditDataSet is TIBTable then
      with (EditDataSet as TIBTable).Transaction do if Active then CommitRetaining;
    if FBrowseDataSet is TIBQuery then
    begin
      UpdateQuery(FBrowseDataSet as TIBQuery);
{      if AddNew then
        BrId := GetGeneratorValue((FBrowseDataSet as TIBQuery).Database, FGeneratorName);}
      FBrowseDataSet.Locate(BrowseKeyField, BrId, []);
    end
    else if FBrowseDataSet is TQuery then
    begin
      UpdateQuery(FBrowseDataSet as TQuery);
      FBrowseDataSet.Locate(BrowseKeyField,
        {EditDataSet.FieldByName(FKeyFieldName).Value}BrId, []);
    end
    else FBrowseDataSet.Refresh;
  end;
end;

procedure TZDataDialog.FormCreate(Sender: TObject);
begin
  inherited;
  FViewOnly := False;
  FGeneratorName := '';
  //FEditEnabled := True;
end;

procedure TZDataDialog.FormActivate(Sender: TObject);
begin
  inherited;
  LoadDataFields;
  if ActiveControl is TDBEdit then
    with ActiveControl as TDBEdit do
      if Visible and Enabled and not Field.IsNull then
      begin
        SelStart := Length(Text);
        SelLength := 0;
      end;
end;

procedure TZDataDialog.DBNameExit(Sender: TObject);
begin
  if Sender is TDBEdit then
    with Sender as TDBEdit do Field.Text := CapitalName(Text)
  else if Sender is TEdit then
    with Sender as TEdit do Text := CapitalName(Text)
  else if Sender is TDBComboBox then
    with Sender as TDBComboBox do Field.Text := CapitalName(Text)
  else if Sender is TAzComboBox then
    with Sender as TAzComboBox do Text := CapitalName(Text)
  else if Sender is TComboBox then
    with Sender as TComboBox do Text := CapitalName(Text);
end;

procedure TZDataDialog.DBPersonNameExit(Sender: TObject);
begin
  if Sender is TDBEdit then
    with (Sender as TDBEdit).Field do Text := CapitalBegin(Text)
  else if Sender is TDBComboBox then
    with (Sender as TDBComboBox).Field do Text := CapitalBegin(Text);
end;

procedure TZDataDialog.DBTitleExit(Sender: TObject);
begin
  with Sender as TDBEdit do Field.Text := Sentence(Trim(Text));
end;

procedure TZDataDialog.DBSerialNoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['à'..'ÿ', 'A'..'ß'] then Key := EmulateEnglishUpperCharset(Key);
  if not (Key in ['A'..'Z', 'a'..'z', '0'..'9', '-', #8]) then Key := #0;
end;

procedure TZDataDialog.DBSerialNoExit(Sender: TObject);
begin
  with Sender as TDBEdit do Field.Text := AnsiUpperCase(Text);
end;

procedure TZDataDialog.DBDigitalKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8, #13: ;
    else Key := #0;
  end;
end;

procedure TZDataDialog.DBNumberKeyPress(Sender: TObject; var Key: Char);
var CanTypeDecimal, CanTypeNegative: Boolean;
begin
  with Sender as TCustomEdit do
  begin
    CanTypeDecimal := Pos(DecimalSeparator, Text) = 0;
    CanTypeNegative := (Pos('-', Text) = 0) and (SelStart = 0);
  end;
  case Key of
    '0'..'9', #8, #13: ;
    '.', ',': if CanTypeDecimal then Key := DecimalSeparator else Key := #0;
    '-': if not CanTypeNegative then Key := #0;
    else Key := #0;
  end;
end;

procedure TZDataDialog.DBPassport0KeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateCyrylicUpperCharset(Key);
  if not (Key in PasportLiteral) then Key := #0;
end;

procedure TZDataDialog.DBPassport1KeyPress(Sender: TObject; var Key: Char);
begin                                    
  Key := EmulateEnglishUpperCharset(Key);
  if not (Key in PasportLiteral) then Key := #0;
end;

procedure TZDataDialog.DBCyrNameKeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateCyrylicCharset(Key);
  if not (Key in CyrNameLiteral) then Key := #0;
end;

procedure TZDataDialog.DBLatNameKeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateEnglishCharset(Key);
  if not (Key in LatNameLiteral + ['0'..'9']) then Key := #0;
end;

procedure TZDataDialog.DBEmailKeyPress(Sender: TObject; var Key: Char);
var CanTypeAt: boolean;
begin
  if Sender is TCustomEdit then
    CanTypeAt := Pos('@', (Sender as TCustomEdit).Text) = 0
  else if Sender is TComboBox then
    CanTypeAt := Pos('@', (Sender as TComboBox).Text) = 0
  else if Sender is TDBComboBox then
    CanTypeAt := Pos('@', (Sender as TDBComboBox).Text) = 0
  else CanTypeAt := True;
  case Key of
    '"': if CanTypeAt then Key := '@' else Key := #0;
    ',': Key := '.';
    else Key := EmulateEnglishCharset(Key);
  end;
  if not (Key in EmailLiteral) then Key := #0;
end;

procedure TZDataDialog.DBEmailExit(Sender: TObject);
  function ExtractEmail(const EmailStr: String): String;
  begin
    Result := StringReplace(StringReplace(StringReplace(
      Trim(EmailStr), '<', '', [rfReplaceAll]), '>', '', [rfReplaceAll]),
        'mailto:', '', [rfReplaceAll, rfIgnoreCase]);
  end;
begin
  if Sender is TEdit then
    with Sender as TEdit do Text := ExtractEmail(Text)
  else if Sender is TDBEdit then
    with Sender as TDBEdit do Text := ExtractEmail(Text)
  else if Sender is TComboBox then
    with Sender as TComboBox do Text := ExtractEmail(Text)
  else if Sender is TAzComboBox then
    with Sender as TAzComboBox do Text := ExtractEmail(Text)
  else if Sender is TDBComboBox then
    with Sender as TDBComboBox do Text := ExtractEmail(Text);
end;

procedure TZDataDialog.DBPhoneNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in PhoneNoLiteral) then Key := #0;
  if Key = '-' then Key := #32;
end;

procedure TZDataDialog.DBPhoneNoExit(Sender: TObject);
var S: String;
begin
  if (Sender as TDBEdit).Text <> '' then
  begin
    S := Trim((Sender as TDBEdit).Text);
    S := StringReplace(S, '-', #32, [rfReplaceAll]);
    if Pos('810', S) = 1 then S := Copy(S, 4, Length(S))
    else if Pos('8 10', S) = 1 then S := Copy(S, 5, Length(S))
    else if Pos('8', S) = 1 then S := Copy(S, 2, Length(S));
    (Sender as TDBEdit).Text := Trim(S);
  end;
end;

procedure TZDataDialog.DBDateKeyPress(Sender: TObject; var Key: Char);
var CanTypeSeparator, CanTypeCipher: Boolean;
begin
  with Sender as TCustomEdit do
  begin
    CanTypeSeparator := (SelStart in [2, 5]); // Pos(DateSeparator, Text) < 2;
    CanTypeCipher := (SelStart in [0, 1, 3, 4, 6..9]); //True; //(Pos('-', Text) = 0) and (SelStart = 0);
  end;
  case Key of
    #8: ;
    '.', ',', '\', '/', '-':
      if CanTypeSeparator then Key := DateSeparator else Key := #0;
    '0'..'9': if not CanTypeCipher then Key := #0;
    else Key := #0;
  end;
end;

procedure TZDataDialog.DBDateExit(Sender: TObject);
begin
  if (Sender as TCustomEdit).Text <> '' then
  try
    StrToDate(Trim((Sender as TCustomEdit).Text));
  except
    ActiveControl := Sender as TWinControl;
    raise Exception.Create(SZTDlgExceptDateNotValid);
  end;
end;

procedure TZDataDialog.DBTimeKeyPress(Sender: TObject; var Key: Char);
var CanTypeSeparator, CanTypeCipher: Boolean;
begin
  with Sender as TCustomEdit do
  begin
    CanTypeSeparator := Pos(TimeSeparator, Text) < 2;
    CanTypeCipher := True; //(Pos('-', Text) = 0) and (SelStart = 0);
  end;
  case Key of
    #8: ;
    ':', ';': if CanTypeSeparator then Key := TimeSeparator else Key := #0;
    '0'..'9': if not CanTypeCipher then Key := #0;
    else Key := #0;
  end;
end;

procedure TZDataDialog.DBLookupComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  CurFieldName: string;
  CurDataDataSrc: TDataSource;
begin
  if (Key = VK_DELETE) and (Shift = []) then
  begin
    with Sender as TDBLookupComboBox do
    begin
      CurDataDataSrc := DataSource;
      CurFieldName := DataField;
    end;
    if (CurDataDataSrc <> nil) and (CurDataDataSrc.DataSet <> nil)
      and (CurFieldName <> '')
      then CurDataDataSrc.DataSet.FieldByName(CurFieldName).Clear;
  end;
end;

procedure TZDataDialog.ComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = []) then
  begin
    if Sender is TComboBox then
      with Sender as TComboBox do
      begin
        ItemIndex := -1;
        Text := '';
      end
    else if Sender is TAzComboBox then
      with Sender as TAzComboBox do
      begin
        ItemIndex := -1;
        //Text := '';
      end;
  end;
end;

procedure TZDataDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if OkBtn.Enabled then ActiveControl := OkBtn else ActiveControl := CancelBtn;
  if ModalResult = mrOk then CanClose := CheckDataInput;
  inherited;
  if ModalResult = mrOk then StoreDataFields;
end;

end.

