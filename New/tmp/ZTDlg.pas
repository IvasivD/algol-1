unit ZTDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Db, StdActns, ActnList, Menus, ImgList,
  Grids, DBGrids, DBCtrls, AzComboBox;

type
  TInputErrorCode = (iecSuccess, iecSilentError, iecUnknown,
    iecSurNameIsNull, iecNameIsNull, iecShortNameIsNull, iecNameEngIsNull,
    iecBirthDateIsNull, iecBirthDateInvalid,
    iecPlaceCountUnderMin, iecDrivePlaceMapIsNull, iecImageIsNull,
    iecServiceNotAssigned, iecPhoneCodeUniNotEmpty,
    iecCompanyNotSubscribe, iecCompanyNotTyped,
    iecCompanyNameExists, iecNameGrammar,
    iecPhoneNumberIsNull, iecPhoneNumberExists, iecPhoneNumberNotSubscribe,
    iecEMailIsNull, iecWebSiteIsNull, iecBankAccountIsNull,
    iecCorrBankIsNull, iecCorrCurrIsNull, iecAllUnChecked,
    iecBadRoomMinimum, iecBadRoomAdditional, iecHotelKindIsNull,
    iesCountryIsNull, iesCityIsNull, iesAddressIsNull, iesHouseIsNull,
    iecCurrIsNull, iecBadServiceCostSelect);

const
  remStateEdit = 0;
  remStateAppend = 1;
  remStateCopy = 2;

type
  TZTourDialog = class(TForm)
    WorkPanel: TPanel;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    DataSrc: TDataSource;
    MemoPopupMenu: TPopupMenu;
    MemoPopupCutItem: TMenuItem;
    MemoPopupCopyItem: TMenuItem;
    MemoPopupPasteItem: TMenuItem;
    MemoPopupN6: TMenuItem;
    MemoPopupBoldItem: TMenuItem;
    MemoPopupItalicItem: TMenuItem;
    MemoPopupUnderlineItem: TMenuItem;
    MemoPopupFontItem: TMenuItem;
    ActionList: TActionList;
    FontBoldAction: TAction;
    FontItalicAction: TAction;
    FontUnderlineAction: TAction;
    FontSelectAction: TAction;
    EditCopyAction: TEditCopy;
    EditCutAction: TEditCut;
    EditPasteAction: TEditPaste;
    EditSelectAllAction: TEditSelectAll;
    EditUndoAction: TEditUndo;
    MemoPopupSelectAllItem: TMenuItem;
    RichEdit: TRichEdit;
    MemoPopupUndoItem: TMenuItem;
    MemoPopupN2: TMenuItem;
    MemoPopupN3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FontBoldActionExecute(Sender: TObject);
    procedure FontItalicActionExecute(Sender: TObject);
    procedure FontUnderlineActionExecute(Sender: TObject);
    procedure FontSelectActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FInputErrorCode: TInputErrorCode;
    FNameFieldName: String;
    FNameEditControl: TDBEdit;
    FRichEditControl: TCustomRichEdit;
    FMemoFieldName: String;
    FDictionPart: Integer;
    function GetEditorCaption(EditMode: Integer): String;
    procedure SetMemoFieldName(const Value: String);
    property EditorCaption[EditMode: Integer]: String read GetEditorCaption;
  protected
    procedure AfterExecute(AnExecuteMode: Integer); virtual;
    procedure BeforeExecute(AnExecuteMode: Integer); virtual;
    function CanBeEdited: Boolean; virtual;
    function CanBeInserted: Boolean; virtual;
    function DataChecking: Boolean; virtual;
    procedure GotoInputError; virtual; abstract;
    function InsertedExists: Boolean; virtual; // потреба під "?"
    procedure SearchInputError; virtual;
    procedure DBControlEnableChange(Sender: TObject);
    property DictionPart: Integer read FDictionPart write FDictionPart;
    property InputErrorCode: TInputErrorCode
      read FInputErrorCode write FInputErrorCode;
    property MemoFieldName: String read FMemoFieldName write SetMemoFieldName;
    property NameFieldName: String read FNameFieldName write FNameFieldName;
    property NameEditControl: TDBEdit
      read FNameEditControl write FNameEditControl;
    property RichEditControl: TCustomRichEdit
      read FRichEditControl write FRichEditControl;
  public
    function Execute(AnExecuteMode: Integer): Boolean;
    function ShowRecord(EditState: Integer): Boolean;
  published
    procedure DBNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBNameExit(Sender: TObject);
    procedure DBNameComboBoxExit(Sender: TObject);
    procedure DBTitleExit(Sender: TObject);
    procedure DBTitleComboBoxExit(Sender: TObject);
    procedure DBShortSignExit(Sender: TObject);
    procedure DBShortSignKeyPress(Sender: TObject; var Key: Char);
    procedure DBNumberKeyPress(Sender: TObject; var Key: Char);
    procedure DBDigitalKeyPress(Sender: TObject; var Key: Char);
    procedure DBCyrNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBLatNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBAddressKeyPress(Sender: TObject; var Key: Char);
    procedure DBURLAddrKeyPress(Sender: TObject; var Key: Char);
    procedure DBEmailKeyPress(Sender: TObject; var Key: Char);
    procedure DBEmailExit(Sender: TObject);
    procedure DBPhoneNoKeyPress(Sender: TObject; var Key: Char);
    procedure DBPhoneNoExit(Sender: TObject);
    procedure DBPhoneOnlyNoExit(Sender: TObject);
    procedure DBMoneyKeyPress(Sender: TObject; var Key: Char);
    procedure DBZipCodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBoxKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinButtonDownClick(Sender: TObject);
    procedure SpinButtonUpClick(Sender: TObject);
    procedure OtherDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  end;

var
  ZTourDialog: TZTourDialog;

implementation

uses Clipbrd, Spin, DBTables, DataMod, VDlgs, TourConsts, TourCmnlIf,
  TourStrMag, TourDbUn;

{$R *.DFM}

function TZTourDialog.GetEditorCaption(EditMode: Integer): String;
const pC: array[0..2] of Pointer = (
  @SZTDlgCaptionEdit, @SZTDlgCaptionAppend, @SZTDlgCaptionCopy);
var P: Integer;
begin
  Result := Caption;
  P := Pos(' - ', Result);
  if P > 0 then Result := Copy(Result, 1, P - 1);
  Result := Result + ' - ' + LoadResString(pC[EditMode]);
end;

procedure TZTourDialog.SetMemoFieldName(const Value: String);
begin
  FMemoFieldName := Value;
  RichEdit.Visible := Value <> '';
end;

procedure TZTourDialog.AfterExecute(AnExecuteMode: Integer);
begin
end;

procedure TZTourDialog.BeforeExecute(AnExecuteMode: Integer);
begin
end;

function TZTourDialog.CanBeEdited: Boolean;
begin
  Result := GetUspCanEdit(DM.CurManagerPlev);
end;

function TZTourDialog.CanBeInserted: Boolean;
begin
  Result := not InsertedExists
    or WarningDlgYN(Format(SZTDlgWarnInsertedExists, [NameEditControl.Text]));
end;

function TZTourDialog.DataChecking: Boolean;
const
  pSErrMsgs: array[TInputErrorCode] of Pointer = (nil, nil, @SZTDlgErrUnknown,
    @SZTDlgErrSurNameIsNull, @SZTDlgErrNameIsNull,
    @SZTDlgErrShortNameIsNull, @SZTDlgErrNameEngIsNull,
    @SZTDlgErrBirthDateIsNull, @SZTDlgErrBirthDateInvalid,
    @SZTDlgErrPlaceCountUnderMin, @SZTDlgErrDrivePlaceMapIsNull,
    @SZTDlgErrImageIsNull, @SZTDlgErrServiceNotAssigned,
    @SZTDlgErrPhoneCodeUniNotEmpty,
    @SZTDlgErrCompanyNotSubscribe, @SZTDlgErrCompanyNotTyped,
    @SZTDlgErrCompanyNameExists,  @SZTDlgErrNameGrammar,
    @SZTDlgErrPhoneNumberIsNull, @SZTDlgErrPhoneNumberExists,
    @SZTDlgErrPhoneNumberNotSubscribe,
    @SZTDlgErrEmailIsNull, @SZTDlgErrWebSiteIsNull, @SZTDlgErrBankAccountIsNull,
    @SZTDlgErrCorrBankIsNull, @SZTDlgErrCorrCurrIsNull, @SZTDlgErrAllUnChecked,
    @SZTDlgErrBadRoomMinimum, @SZTDlgErrBadRoomAdditional,
    @SZTDlgErrHotelKindIsNull,
    @SZTDlgErrCountryIsNull, @SZTDlgErrCityIsNull, @SZTDlgErrAddressIsNull,
    @SZTDlgErrHouseIsNull,
    @SZTDlgErrCurrIsNull, @SZTDlgErrBadServiceCostSelect);
begin
  if OkBtn.Enabled then ActiveControl := OkBtn
    else if CancelBtn.Enabled then ActiveControl := CancelBtn;
  SearchInputError;
  Result := FInputErrorCode = iecSuccess;
  if not Result and (FInputErrorCode <> iecSilentError) then
  begin
    ErrorDlg(LoadResString(pSErrMsgs[FInputErrorCode]));
    GotoInputError;
  end;
end;

function TZTourDialog.InsertedExists: Boolean;
begin
  Result := False;{DataSrc.DataSet.Locate(
    NameFieldName, NameEditControl.Text, [loCaseInsensitive]);}
end;

procedure TZTourDialog.SearchInputError;
begin
  FInputErrorCode := iecSuccess;
end;

procedure TZTourDialog.DBControlEnableChange(Sender: TObject);
begin
  with Sender as TDBEdit do Color := clEditControlColors[Enabled];
end;

function TZTourDialog.Execute(AnExecuteMode: Integer): Boolean;
begin
  BeforeExecute(AnExecuteMode);
  Result := ShowModal = mrOk;
  AfterExecute(AnExecuteMode);
end;

function TZTourDialog.ShowRecord(EditState: Integer): Boolean;
var AsNew, IsMemo: Boolean;
begin
  Result := Assigned(DataSrc.DataSet);
  if not Result then Exit;
  AsNew := EditState = remStateAppend;
  Caption := EditorCaption[EditState];
  with DataSrc.DataSet do   // edit or append
  begin
    if not Active then Open;
    if AsNew and (State <> dsInsert) then Append else if not AsNew then Edit;
  end;
  if Assigned(RichEditControl) then
    ToggleControlEnabled(RichEditControl, not AsNew);
  with DataSrc.DataSet do                // read memo
  begin
    IsMemo := (MemoFieldName <> '') and Assigned(FieldByName(MemoFieldName));
    if IsMemo then 
      //RichEdit.Lines.Text := FieldByName(MemoFieldName).AsString;
      RichEdit.Lines.Assign(FieldByName(MemoFieldName));
  end;
  Result := ShowModal = mrOk;            // show dialog
  with DataSrc.DataSet do
    if not Result then Cancel
    else begin
      if IsMemo then                     // store memo
        FieldByName(FMemoFieldName).AsString := RichEdit.Lines.Text;
      case State of                      // post or cancel
        dsInsert: if CanBeInserted then Post else Cancel;
        dsEdit: Post;
        else Cancel;
      end;
    end;
  if DataSrc.DataSet is TTable then DataSrc.DataSet.Refresh;
end;

procedure TZTourDialog.FormCreate(Sender: TObject);
begin
  FDictionPart := 0;
  NameFieldName := 'Name';
  MemoFieldName := '';
end;

procedure TZTourDialog.FormActivate(Sender: TObject);
var I: integer;
begin
  with WorkPanel do
    for I := 0 to ControlCount - 1 do
      if (Controls[I] is TWinControl)
        and ((Controls[I] as TWinControl).TabOrder = 0)
        and Controls[I].Visible and Controls[I].Enabled
      then begin
        Self.ActiveControl := Controls[I] as TWinControl;
        Break;
      end;
  if Assigned(FNameEditControl) then
    with FNameEditControl do
      if Visible and Enabled and not Field.IsNull then
      begin
        SelStart := Length(Text);
        SelLength := 0;
      end;
  OkBtn.Enabled := CanBeEdited;
  OkBtn.Default := OkBtn.Enabled;
  CancelBtn.Default := not OkBtn.Enabled;
end;

procedure TZTourDialog.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
var RichEditAssigned: Boolean;
begin
  RichEditAssigned := Assigned(RichEditControl) and (Action is TEditAction)
    and ((Action as TEditAction).Control = RichEditControl);
  FontBoldAction.Visible := RichEditAssigned;
  FontItalicAction.Visible := RichEditAssigned;
  FontUnderlineAction.Visible := RichEditAssigned;
  FontSelectAction.Visible := RichEditAssigned;
  {with EditPasteAction do
    if Visible then Enabled := Clipboard.HasFormat(CF_TEXT);}
  if RichEditAssigned then
    with RichEditControl.SelAttributes do
    begin
      FontBoldAction.Checked := fsBold in Style;
      FontItalicAction.Checked := fsItalic in Style;
      FontUnderlineAction.Checked := fsUnderline in Style;
    end;
end;

procedure TZTourDialog.FontBoldActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then
    with FontBoldAction do
    begin
      Checked := not Checked;
      with RichEditControl.SelAttributes do
        if Checked then Style := Style + [fsBold]
        else Style := Style - [fsBold];
    end;
end;

procedure TZTourDialog.FontItalicActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then
    with FontItalicAction do
    begin
      Checked := not Checked;
      with RichEditControl.SelAttributes do
        if Checked then Style := Style + [fsItalic]
        else Style := Style - [fsItalic];
    end;
end;

procedure TZTourDialog.FontUnderlineActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then
    with FontUnderlineAction do
    begin
      Checked := not Checked;
      with RichEditControl.SelAttributes do
        if Checked then Style := Style + [fsUnderline]
        else Style := Style - [fsUnderline];
    end;
end;

procedure TZTourDialog.FontSelectActionExecute(Sender: TObject);
begin
  if not Assigned(RichEditControl) then Exit;
  //FontDialog.Font.Assign(FRichEditControl.SelAttributes);
  if DM.FontDialog.Execute then
    RichEditControl.SelAttributes.Assign(DM.FontDialog.Font);
end;

procedure TZTourDialog.DBNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    with OkBtn do if Enabled then Click;
  end;
end;

procedure TZTourDialog.DBNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (GetKeyboardLayout(0) and $000000FF = LANG_UKRAINIAN)
    and (Key in ['ё', '~', 'Ё', '`'])
  then Key := '''';
end;

procedure TZTourDialog.DBNameExit(Sender: TObject);
begin
  with Sender as TDBEdit do Field.Text := CapitalName(Trim(Text));
end;

procedure TZTourDialog.DBNameComboBoxExit(Sender: TObject);
begin
  with Sender as TDBComboBox do Field.Text := CapitalName(Trim(Text));
end;

procedure TZTourDialog.DBTitleExit(Sender: TObject);
begin
  with Sender as TDBEdit do Field.Text := Sentence(Trim(Text));
end;

procedure TZTourDialog.DBTitleComboBoxExit(Sender: TObject);
begin
  with Sender as TDBComboBox do Field.Text := Sentence(Trim(Text));
end;

procedure TZTourDialog.DBShortSignExit(Sender: TObject);
begin
  with Sender as TDBEdit do Field.Text := AnsiUpperCase(Text);
end;

procedure TZTourDialog.DBShortSignKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['а'..'я', 'A'..'Я'] then Key := EmulateEnglishUpperCharset(Key);
  if not (Key in ['A'..'Z', 'a'..'z', #8]) then Key := #0;
end;

procedure TZTourDialog.DBNumberKeyPress(Sender: TObject; var Key: Char);
var CanTypeDecimal, CanTypeNegative: boolean;
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

procedure TZTourDialog.DBDigitalKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    '0'..'9', #8, #13: ;
    else Key := #0;
  end;
end;

procedure TZTourDialog.DBCyrNameKeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateCyrylicCharset(Key);
  if not (Key in CyrNameLiteral) then Key := #0;
end;

procedure TZTourDialog.DBLatNameKeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateEnglishCharset(Key);
  if not (Key in LatNameLiteral) then Key := #0;
end;

procedure TZTourDialog.DBAddressKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in AddressLiteral) then Key := #0;
end;

procedure TZTourDialog.DBURLAddrKeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateEnglishCharset(Key);
  if not (Key in URLAddrLiteral) then Key := #0;
end;

procedure TZTourDialog.DBEmailKeyPress(Sender: TObject; var Key: Char);
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

procedure TZTourDialog.DBEmailExit(Sender: TObject);
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

procedure TZTourDialog.DBPhoneNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in PhoneNoLiteral) then Key := #0;
  if Key = '-' then Key := #32;
end;

procedure TZTourDialog.DBPhoneNoExit(Sender: TObject);
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

procedure TZTourDialog.DBPhoneOnlyNoExit(Sender: TObject);
begin
  if Sender is TDBEdit then
    with Sender as TDBEdit do
      Text := StringWithoutHiphen(StringWithoutSpace(Text))
  else if Sender is TEdit then
    with Sender as TEdit do
      Text := StringWithoutHiphen(StringWithoutSpace(Text));
end;

procedure TZTourDialog.DBMoneyKeyPress(Sender: TObject; var Key: Char);
var CanTypeDecimal, CanTypeNegative: Boolean;
begin
  with Sender as TCustomEdit do
  begin
    CanTypeDecimal := Pos(DecimalSeparator, Text) = 0;
    CanTypeNegative := (Pos('-', Text) = 0) and (SelStart = 0);
  end;
  case Key of
    '0'..'9', #8: ;
    '.', ',': if CanTypeDecimal then Key := DecimalSeparator else Key := #0;
    '-': if not CanTypeNegative then Key := #0;
  else Key := #0;
  end;
end;

procedure TZTourDialog.DBZipCodeKeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateEnglishCharset(Key);
  if not (Key in IdentLiteral + ['-', '/']) then Key := #0;
end;

procedure TZTourDialog.DBLookupComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  CurFieldName: String;
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
    then
      with CurDataDataSrc.DataSet do
      begin
        //Edit;
        FieldByName(CurFieldName).Clear;
        //Post;
      end;
  end;
end;

procedure TZTourDialog.ComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = []) then
    with Sender as TCustomComboBox do
    begin
      ItemIndex := -1;
      Text := '';
    end;
end;

procedure TZTourDialog.SpinButtonDownClick(Sender: TObject);
begin
  try
    with ((Sender as TSpinButton).FocusControl as TDBEdit).Field do
      if AsInteger > 0 then AsInteger := AsInteger - 1;
  except
  end;
end;

procedure TZTourDialog.SpinButtonUpClick(Sender: TObject);
begin
  try
    with ((Sender as TSpinButton).FocusControl as TDBEdit).Field do
      AsInteger := AsInteger + 1;
  except
  end;
end;

procedure TZTourDialog.OtherDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var C: TColor;
begin
  if gdSelected in State then
  begin
    if gdFocused in State then C := clHighlight else C := clBtnShadow;
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := C;
      FillRect(Rect);
    end;
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TZTourDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then if not DataChecking then ModalResult := mrNone;
end;

procedure TZTourDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then Action := caNone;
end;
{
  if Assigned(RichEditControl) then RichEditControl.CopyToClipboard;
  if Assigned(RichEditControl) then RichEditControl.CutToClipboard;
  if Assigned(RichEditControl) then RichEditControl.PasteFromClipboard;
  if Assigned(RichEditControl) then
    with RichEditControl do
      if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
}

end.
