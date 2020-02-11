unit ZTDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, Db, StdActns, ActnList, Menus, ImgList,
  DBCtrls, SvtDBGrids, DBTables, AzComboBox, AzMaskEdit, AzDBAddress, 
  Spin, AzEdit, cxTextEdit, cxCalendar, cxDBEdit, AzIBAddress;

type
  TInputErrorCode = (iecSuccess, iecSilentError, iecUnknown,
    iecSurNameIsNull, iecNameIsNull, iecBirthDateIsNull,
    iecBirthDateInvalid, iecRelativeIsNull,
    iecDrivePlaceMapIsNull, iecImageIsNull, iecServiceNotAssigned,
    iecDriveIsNull, iecPlaceCountUnderMin,
    iecPhoneCodeUniNotEmpty, iecEmailInvalid,
    iecTouristIsNull, iecTouristNameIsNull, iecResortNameIsNull,
    iecDateRangeInvalid, iecServNameIsNull,
    iecNetValIsNull, iecNetValLessZero, iecCurrencyIsNull,
    iecRateIsNull, iecRateLessZero,
    iecRateLessNet, iecPayLessPaid, iecPayLessDebt,
    iecAgentPayIsMore, iecAgentPayIsNull,
    iecDateLessNow, iecInsureVendIsNull, iecInsureKindIsNull,
    iecInsureValueIsNull, iecInsurePayIsNull,
    iecRoomTypeIsNull, iecFeedTypeIsNull,
    iecStartPointIsNull, iecStopPointIsNull, iecStopOrder,
    iecCityNameIsNull, iecDriveKindIsNull,
    iecSecondNameIsNull, iecFirstNameIsNull,
    iecCountryIsNull, iecCityIsNull, iecSheduleIsNull,
    iecDepartTimeIsZero, iecArriveTimeIsZero,
    iecInsureIsPolice, iecWriteDateInvalid,
    iecExcursNotSelected,
    iecRefuseByIsNull, iecManagerIsNull,
    iecPassportNoIsNull, iecPassportNoExists,
    iecServiceVisaIsAdd, iecServiceDateIsNull, iecServiceTripIsNull,
    iecServiceTripWagonNoIsNull, iecServiceTripNoIsNull, 
    iecServiceInsureIsAdd, iecServiceOtherIsAdd);

type
  TZTourDialog = class(TForm)
    WorkPanel: TPanel;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    DataSrc: TDataSource;
    MemoPopupMenu: TPopupMenu;
    EditCutPopupItem: TMenuItem;
    EditCopyPopupItem: TMenuItem;
    EditPastePopupItem: TMenuItem;
    MemoPopupSplitter: TMenuItem;
    FontBoldPopupItem: TMenuItem;
    FontItalicPopupItem: TMenuItem;
    FontUnderlinePopupItem: TMenuItem;
    FontSelectPopupItem: TMenuItem;
    ActionList: TActionList;
    BoldFontAction: TAction;
    ItalicFontAction: TAction;
    UnderlinedFontAction: TAction;
    SelectFontAction: TAction;
    EditCopyAction: TEditCopy;
    EditCutAction: TEditCut;
    EditPasteAction: TEditPaste;
    EditUndoAction: TAction;
    ApplyAllQry: TQuery;
    ApplyAllBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure BoldFontActionExecute(Sender: TObject);
    procedure ItalicFontActionExecute(Sender: TObject);
    procedure UnderlinedFontActionExecute(Sender: TObject);
    procedure SelectFontActionExecute(Sender: TObject);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditCutActionExecute(Sender: TObject);
    procedure EditPasteActionExecute(Sender: TObject);
    procedure EditUndoActionExecute(Sender: TObject);
    procedure ApplyAllBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FInputErrorCode: TInputErrorCode;
    FNameFieldName: string;
    FNameEditControl: TDBEdit;
    FMemoEditControl: TMemo;
    FRichEditControl: TCustomRichEdit;
    FMemoFieldName: String;
    FViewOnlyMode: Boolean;
    FRecordIsNew: Boolean;
    function GetEditorCaption(InsertMode: Boolean): string;
    function GetRecordIsNew: Boolean;
    property EditorCaption[InsertMode: Boolean]: string read GetEditorCaption;
    procedure SetMemoFieldName(const Value: String);
    procedure SetViewOnlyMode(const Value: Boolean);
    procedure SetRecordIsNew(const Value: Boolean);
  protected
    procedure ApplyForAllRecords; virtual; abstract;
    procedure AfterExecute(AnExecuteMode: Integer); virtual;
    procedure BeforeExecute(AnExecuteMode: Integer); virtual;
    function CanBeInserted: Boolean; virtual;
    function DataChecking(CheckRate: Boolean = True): Boolean; virtual;
    procedure DBControlEnableChange(Sender: TObject);
    procedure GetComboFieldValue(Combo: TCustomComboBox; Field: TStringField);
    procedure GetComboLookupValue(Combo: TCustomComboBox; Field: TIntegerField);
    procedure GetDateFieldValue(Edit: TAzMaskEdit; Field: TDateTimeField);
    procedure GotoInputError; virtual; abstract;
    procedure HighlightDBAddress(Ctrl: TAzDBAddress; En: Boolean); overload;
    procedure HighlightDBAddress(Ctrl: TAzIBAddress; En: Boolean); overload;
    procedure HighlightDBComboBox(Ctrl: TDBComboBox; En: Boolean);
    procedure HighlightDBCheckBox(Ctrl: TDBCheckBox; En: Boolean);
    procedure HighlightAzEdit(Ctrl: TAzMaskEdit; En: Boolean); overload;
    procedure HighlightAzEdit(Ctrl: TAzEdit; En: Boolean); overload;
    procedure HighlightDBEdit(Ctrl: TDBEdit; En: Boolean);
    procedure HighlightDBDateEdit(Ctrl: TcxDBDateEdit; En: Boolean);
    procedure HighlightDateEdit(Ctrl: TDateTimePicker; En: Boolean); overload;
    procedure HighlightDateEdit(Ctrl: TcxDateEdit; En: Boolean); overload;
    procedure HighlightDBEditEn(Ctrl: TDBEdit; En: Boolean);
    procedure HighlightDBGrid(Ctrl: TSvtDBGrid; En: Boolean);
    procedure HighlightDBLookupComboBox(Ctrl: TDBLookupComboBox; En: Boolean);
    procedure HighlightMemo(Ctrl: TMemo; En: Boolean);
    procedure HighlightDBMemo(Ctrl: TDBMemo; En: Boolean);
    procedure HighlightComboBox(Ctrl: TComboBox; En: Boolean);
    procedure HighlightAzComboBox(Ctrl: TAzComboBox; En: Boolean);
    procedure HighlightSpinEdit(Ctrl: TSpinEdit; En: Boolean);
    procedure HighlightEditAsDefault;
    procedure HighlightControl(Ctrl: TWinControl; En: Boolean);
    function InsertedExists: Boolean; virtual;
    procedure SearchInputError(CheckRate: Boolean = True); virtual;
    procedure SetComboFieldValue(Combo: TCustomComboBox; Field: TStringField);
    procedure SetComboLookupValue(Combo: TCustomComboBox; Field: TIntegerField);
    procedure SetDateFieldValue(Edit: TAzMaskEdit; Field: TDateTimeField);
    property InputErrorCode: TInputErrorCode read FInputErrorCode write FInputErrorCode;
    property MemoFieldName: String read FMemoFieldName write SetMemoFieldName;
    property MemoEditControl: TMemo read FMemoEditControl write FMemoEditControl;
    property NameFieldName: string read FNameFieldName write FNameFieldName;
    property NameEditControl: TDBEdit read FNameEditControl write FNameEditControl;
    property RichEditControl: TCustomRichEdit read FRichEditControl write FRichEditControl;
    property RecordIsNew: Boolean read GetRecordIsNew write SetRecordIsNew;
    property ViewOnlyMode: Boolean read FViewOnlyMode write SetViewOnlyMode;
  public
    function Execute(AnExecuteMode: Integer): Boolean;
    function ShowRecord(AsNew: Boolean): Boolean;
  published
    procedure DBNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNameExit(Sender: TObject);
    procedure DBPersonNameExit(Sender: TObject);
    procedure DBComboBoxExit(Sender: TObject);
    procedure DBNameComboBoxExit(Sender: TObject);
    procedure DBTitleExit(Sender: TObject);
    procedure DBPersonNameComboBoxExit(Sender: TObject);
    procedure DBNumberKeyPress(Sender: TObject; var Key: Char);
    procedure DBDigitalKeyPress(Sender: TObject; var Key: Char);
    procedure DBCyrNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBLatNameKeyPress(Sender: TObject; var Key: Char);
    procedure DBIdentKeyPress(Sender: TObject; var Key: Char);
    procedure DBURLAddrKeyPress(Sender: TObject; var Key: Char);
    procedure DBEMailKeyPress(Sender: TObject; var Key: Char);
    procedure DBEmailExit(Sender: TObject);
    procedure DBIdentExit(Sender: TObject);
    procedure DBPhoneNoKeyPress(Sender: TObject; var Key: Char);
    procedure DBPhoneNoExit(Sender: TObject);
    procedure DBPhoneNoComboExit(Sender: TObject);
    procedure DBDateKeyPress(Sender: TObject; var Key: Char);
    procedure DBTimeKeyPress(Sender: TObject; var Key: Char);
    procedure DBMoneyKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpinButtonDownClick(Sender: TObject);
    procedure SpinButtonUpClick(Sender: TObject);
  end;

var
  ZTourDialog: TZTourDialog;
implementation

uses Clipbrd, VDlgs, TourConsts, DataMod, TourCmnlIf, TourStrMag, TourDbUn;

{$R *.DFM}

{ TZTourDialog }

function TZTourDialog.GetEditorCaption(InsertMode: Boolean): string;
var P: Integer;
begin
  Result := Caption;
  P := Pos(' - ', Result);
  if P > 0 then Result := Copy(Result, 1, P - 1);
  if InsertMode then Result := Result + ' - ' + SZTDlgCaptionAppend
  else if ViewOnlyMode then Result := Result + ' - ' + SZTDlgCaptionView
  else Result := Result + ' - ' + SZTDlgCaptionEdit;
end;

function TZTourDialog.GetRecordIsNew: Boolean;
begin
  Result := FRecordIsNew;
end;

procedure TZTourDialog.SetMemoFieldName(const Value: String);
begin
  FMemoFieldName := Value;
  if Assigned(FMemoEditControl) then FMemoEditControl.Enabled := Value <> '';
end;

procedure TZTourDialog.SetViewOnlyMode(const Value: Boolean);
begin
  FViewOnlyMode := Value;
end;

procedure TZTourDialog.AfterExecute(AnExecuteMode: Integer);
begin
end;

procedure TZTourDialog.BeforeExecute(AnExecuteMode: Integer);
begin
  RecordIsNew := AnExecuteMode = remStateAppend;
  Caption := EditorCaption[RecordIsNew];
end;

function TZTourDialog.CanBeInserted: Boolean;
begin
  Result := not InsertedExists
    or WarningFmtDlgYN(SZTDlgWarnInsertedExists, [NameEditControl.Text]);
end;

function TZTourDialog.DataChecking(CheckRate: Boolean = True): Boolean;
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const
  pSErrMsgs: array[TInputErrorCode] of Pointer = (nil, nil, @SZTDlgErrUnknown,
    @SZTDlgErrSurNameIsNull, @SZTDlgErrNameIsNull, @SZTDlgErrBirthDateIsNull,
    @SZTDlgErrBirthDateInvalid, @SZTDlgErrRelativeIsNull,
    @SZTDlgErrDrivePlaceMapIsNull, @SZTDlgErrImageIsNull, @SZTDlgErrServiceNotAssigned,
    @SZTDlgErrDriveIsNull, @SZTDlgErrPlaceCountUnderMin,
    @SZTDlgErrPhoneCodeUniNotEmpty, @SZTDlgErrEmailInvalid,
    @SZTDlgErrTouristIsNull, @SZTDlgErrTouristIsNull, @SZTDlgErrResortNameIsNull,
    @SZTDlgErrDateRangeInvalid, @SZTDlgErrServNameIsNull,
    @SZTDlgErrNetValIsNull, @SZTDlgErrNetValLessZero, @SZTDlgErrCurrencyIsNull,
    @SZTDlgErrRateIsNull, @SZTDlgErrRateLessZero,
    @SZTDlgErrRateLessNet, @SZTDlgErrPayLessPaid, @SZTDlgErrPayLessDebt,
    @SZTDlgErrAgentPayIsMore, @SZTDlgErrAgentPayIsNull,
    @SZTDlgErrDateLessNow, @SZTDlgErrInsureVendIsNull, @SZTDlgErrInsureKindIsNull,
    @SZTDlgErrInsureValueIsNull, @SZTDlgErrInsurePayIsNull,
    @SZTDlgErrRoomTypeIsNull, @SZTDlgErrFeedTypeIsNull,
    @SPlcEdDlgErrorStartPointIsNull, @SPlcEdDlgErrorStopPointIsNull, @SPlcEdDlgErrorStopOrder,
    @SZTDlgErrCityNameIsNull, @SZTDlgErrDriveKindIsNull,
    @SZTDlgErrSecondNameIsNull, @SZTDlgErrFirstNameIsNull,
    @SZTDlgErrCountryIsNull, @SZTDlgErrCityIsNull, @SZTDlgErrSheduleIsNull,
    @SZTDlgErrDepartTimeIsZero, @SZTDlgErrArriveTimeIsZero,
    @SZTDlgErrInsureIsPolice, @SZTDlgErrWriteDateInvalid,
    @SZTDlgErrExcursNotSelected,
    @SZTDlgErrRefuseByIsNull, @SZTDlgErrManagerIsNull,
    @SZTDlgErrPassportNoIsNull, @SZTDlgErrPassportNoExists,
    @SZTDlgErrServiceVisaIsAdd, @SZTDlgErrServiceDateIsNull, @SZTDlgErrServiceTripIsNull,
    @SZTDlgErrServiceTripWagonNoIsNull, @SZTDlgErrServiceTripNoIsNull, 
    @SZTDlgErrServiceInsureIsAdd, @SZTDlgErrServiceOtherIsAdd);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
begin
  SearchInputError(CheckRate);
  Result := FInputErrorCode = iecSuccess;
  if not Result and (FInputErrorCode <> iecSilentError) then
  begin
    ErrorDlg(LoadResString(pSErrMsgs[FInputErrorCode]));
    GotoInputError;
  end;
end;

procedure TZTourDialog.DBControlEnableChange(Sender: TObject);
begin
  with Sender as TDBEdit do Color := clEditControlColors[Enabled];
end;

procedure TZTourDialog.GetComboFieldValue(Combo: TCustomComboBox; Field: TStringField);
begin
  if Combo is TAzComboBox then
  begin
    with Combo as TAzComboBox do
      if Style = csDropDownList then ItemIndex := Items.IndexOf(Field.AsString)
      else Text := Field.AsString;
  end
  else if Combo is TComboBox then
  begin
    with Combo as TComboBox do
      if Style = csDropDownList then ItemIndex := Items.IndexOf(Field.AsString)
      else Text := Field.AsString;
  end;
end;

procedure TZTourDialog.GetComboLookupValue(Combo: TCustomComboBox; Field: TIntegerField);
begin
  if Combo is TAzComboBox then (Combo as TAzComboBox).ItemId := Field.AsInteger
  else if Combo is TComboBox then
  {$WARN UNSAFE_TYPE OFF}
  begin
    with Combo as TComboBox do
      ItemIndex := Items.IndexOfObject(Pointer(Field.AsInteger));
  end;
  {$WARN UNSAFE_TYPE ON}
end;

procedure TZTourDialog.HighlightComboBox(Ctrl: TComboBox; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightAzComboBox(Ctrl: TAzComboBox; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then //Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBAddress(Ctrl: TAzDBAddress; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then EditColor := clBtnFace
    else EditColor := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBAddress(Ctrl: TAzIBAddress; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then EditColor := clBtnFace
    else EditColor := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBComboBox(Ctrl: TDBComboBox; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
    SelLength := 0;
  end;
end;

procedure TZTourDialog.HighlightDBCheckBox(Ctrl: TDBCheckBox; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBEdit(Ctrl: TDBEdit; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightAzEdit(Ctrl: TAzMaskEdit; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBEditEn(Ctrl: TDBEdit; En: Boolean);
begin // do not indicates Enable propery value
  with Ctrl do
  begin
    Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBGrid(Ctrl: TSvtDBGrid; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBLookupComboBox(Ctrl: TDBLookupComboBox;
  En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightMemo(Ctrl: TMemo; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDBMemo(Ctrl: TDBMemo; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightEditAsDefault;
var I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TComboBox then
      HighlightComboBox(Components[I] as TComboBox, True)
    else if Components[I] is TDBComboBox then
      HighlightDBComboBox(Components[I] as TDBComboBox, True)
    else if Components[I] is TDBEdit then
      HighlightDBEdit(Components[I] as TDBEdit, True)
    else if Components[I] is TSvtDBGrid then
      HighlightDBGrid(Components[I] as TSvtDBGrid, True)
    else if Components[I] is TDBLookupComboBox then
      HighlightDBLookupComboBox(Components[I] as TDBLookupComboBox, True);
end;

function TZTourDialog.InsertedExists: Boolean;
begin
  Result := False; {DataSrc.DataSet.Locate(
    NameFieldName, NameEditControl.Text, [loCaseInsensitive]);}
end;

procedure TZTourDialog.SearchInputError(CheckRate: Boolean = True);
begin
  FInputErrorCode := iecSuccess;
end;

procedure TZTourDialog.SetComboFieldValue(Combo: TCustomComboBox; Field: TStringField);
var Txt: string;
begin
  if Combo is TAzComboBox then Txt := (Combo as TAzComboBox).Text
  else if Combo is TComboBox then Txt := (Combo as TComboBox).Text;
  with Field do if Txt = '' then Clear else Value := Txt;
end;

procedure TZTourDialog.SetComboLookupValue(Combo: TCustomComboBox;
  Field: TIntegerField);
var Id: Integer;
begin
  if Combo is TAzComboBox then Id := (Combo as TAzComboBox).ItemId
  {$WARN UNSAFE_CAST OFF}
  else if Combo is TComboBox then
    with Combo as TComboBox do
      if ItemIndex < 0 then Id := 0 else Id := Integer(Items.Objects[ItemIndex])
  else Id := 0;
  {$WARN UNSAFE_CAST ON}
  with Field do if Id = 0 then Clear else Value := Id;  
end;

function TZTourDialog.Execute(AnExecuteMode: Integer): Boolean;
begin
  BeforeExecute(AnExecuteMode);
  Result := ShowModal in [mrOk, mrAll];//= mrOk;
  AfterExecute(AnExecuteMode);
end;

function TZTourDialog.ShowRecord(AsNew: Boolean): Boolean;
var
  Res: Integer;
  IsMemo: Boolean;
begin
  Result := Assigned(DataSrc.DataSet);
  if not Result then Exit;
  Caption := EditorCaption[AsNew];
  with DataSrc.DataSet do
  begin
    if AsNew and (State <> dsInsert) then Append else if not AsNew then Edit;
    IsMemo := Assigned(FMemoEditControl) and FMemoEditControl.Enabled
      and Assigned(FieldByName(FMemoFieldName));
    if IsMemo then FMemoEditControl.Lines.Assign(FieldByName(FMemoFieldName));
  end;
  RecordIsNew := DataSrc.State = dsInsert;
  Res := ShowModal;
  Result := Res in [mrOk, mrAll];
  with DataSrc.DataSet do
    if Res <> mrOk then Cancel
    else begin
      if IsMemo then
        FieldByName(FMemoFieldName).Assign(FMemoEditControl.Lines);
      case State of
        dsInsert: if CanBeInserted then Post else Cancel;
        dsEdit: Post;
        else Cancel;
      end;
//      Refresh;
    end;
end;

procedure TZTourDialog.FormCreate(Sender: TObject);
begin
  NameFieldName := 'Name';
  FViewOnlyMode := False;
end;

procedure TZTourDialog.FormActivate(Sender: TObject);
var I: Integer;
begin
  with WorkPanel do
    for I := 0 to ControlCount - 1 do
      if (Controls[I] is TWinControl)
        and ((Controls[I] as TWinControl).TabOrder = 0)
        and (Controls[I] as TWinControl).Visible
        and (Controls[I] as TWinControl).Enabled
        then begin
        Self.ActiveControl := Controls[I] as TWinControl;
        Break;
      end;
  with ApplyAllBtn do
    if Visible then Enabled := Enabled and not RecordIsNew;//Assigned(DataSrc.DataSet) and (DataSrc.DataSet.State = dsEdit);
  if ActiveControl is TDBEdit then
    with ActiveControl as TDBEdit do
    begin
      SelStart := Length(Text);
      SelLength := 0;
    end;
end;

procedure TZTourDialog.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
var RichEditAssigned: Boolean;
begin
  RichEditAssigned := Assigned(RichEditControl);
  BoldFontAction.Visible := RichEditAssigned;
  ItalicFontAction.Visible := RichEditAssigned;
  UnderlinedFontAction.Visible := RichEditAssigned;
  SelectFontAction.Visible := RichEditAssigned;
  with EditPasteAction do
    if Visible then Enabled := Clipboard.HasFormat(CF_TEXT);
  if RichEditAssigned then
    with RichEditControl.SelAttributes do
    begin
      BoldFontAction.Checked := fsBold in Style;
      ItalicFontAction.Checked := fsItalic in Style;
      UnderlinedFontAction.Checked := fsUnderline in Style;
    end;
end;

procedure TZTourDialog.BoldFontActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then
    with BoldFontAction do
    begin
      Checked := not Checked;
      with RichEditControl.SelAttributes do
        if Checked then Style := Style + [fsBold] else Style := Style - [fsBold];
    end;
end;

procedure TZTourDialog.ItalicFontActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then
    with ItalicFontAction do
    begin
      Checked := not Checked;
      with RichEditControl.SelAttributes do
        if Checked then
          Style := Style + [fsItalic] else Style := Style - [fsItalic];
    end;
end;

procedure TZTourDialog.UnderlinedFontActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then
    with UnderlinedFontAction do
    begin
      Checked := not Checked;
      with RichEditControl.SelAttributes do
        if Checked then
          Style := Style + [fsUnderline] else Style := Style - [fsUnderline];
    end;
end;

procedure TZTourDialog.SelectFontActionExecute(Sender: TObject);
begin
  if not Assigned(RichEditControl) then Exit;
  //FontDialog.Font.Assign(FRichEditControl.SelAttributes);
  if DM.FontDialog.Execute then
    RichEditControl.SelAttributes.Assign(DM.FontDialog.Font);
end;

procedure TZTourDialog.EditCopyActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then RichEditControl.CopyToClipboard;
end;

procedure TZTourDialog.EditCutActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then RichEditControl.CutToClipboard;
end;

procedure TZTourDialog.EditPasteActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then RichEditControl.PasteFromClipboard;
end;

procedure TZTourDialog.EditUndoActionExecute(Sender: TObject);
begin
  if Assigned(RichEditControl) then
    with RichEditControl do
      if HandleAllocated then SendMessage(Handle, EM_UNDO, 0, 0);
end;

procedure TZTourDialog.DBNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    OkBtn.Click;
  end;
end;

procedure TZTourDialog.DBNameExit(Sender: TObject);
begin
  if Sender is TDBEdit then
    with (Sender as TDBEdit).Field do Text := CapitalName(Text)
  else if Sender is TDBComboBox then
    with (Sender as TDBComboBox).Field do Text := CapitalName(Text)
  else if Sender is TAzComboBox then
    with Sender as TAzComboBox do Text := CapitalName(Text);
end;

procedure TZTourDialog.DBPersonNameExit(Sender: TObject);
begin
  if Sender is TDBEdit then
    with (Sender as TDBEdit).Field do Text := CapitalBegin(Text)
  else if Sender is TDBComboBox then
    with (Sender as TDBComboBox).Field do Text := CapitalBegin(Text);
end;

procedure TZTourDialog.DBComboBoxExit(Sender: TObject);
begin
  if Sender is TDBComboBox then
    with (Sender as TDBComboBox).Field do
    begin
      Text := Trim(Text);
      AddComboBoxHistory(Sender as TDBComboBox, Text);
    end
  else if Sender is TAzComboBox then
    with Sender as TAzComboBox do
    begin
      Text := Trim(Text);
      AddComboBoxHistory(Sender as TAzComboBox, Text);
    end;
end;

procedure TZTourDialog.DBNameComboBoxExit(Sender: TObject);
begin
  DBNameExit(Sender);
  DBComboBoxExit(Sender);
end;

procedure TZTourDialog.DBPersonNameComboBoxExit(Sender: TObject);
begin
  DBPersonNameExit(Sender);
  DBComboBoxExit(Sender);
end;

procedure TZTourDialog.DBTitleExit(Sender: TObject);
begin
  with Sender as TDBEdit do Field.Text := Sentence(Trim(Text));
end;

procedure TZTourDialog.DBNumberKeyPress(Sender: TObject; var Key: Char);
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

procedure TZTourDialog.DBIdentKeyPress(Sender: TObject; var Key: Char);
begin
  Key := EmulateEnglishUpperCharset(Key);
  if not (Key in IdentLiteral) then Key := #0;
end;

procedure TZTourDialog.DBURLAddrKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in URLAddrLiteral) then Key := #0;
end;

procedure TZTourDialog.DBEMailKeyPress(Sender: TObject; var Key: Char);
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

procedure TZTourDialog.DBIdentExit(Sender: TObject);
begin
  if Sender is TEdit then with Sender as TEdit do Text := Trim(Text)
  else if Sender is TDBEdit then with Sender as TDBEdit do Text := Trim(Text)
  else if Sender is TComboBox then with Sender as TComboBox do Text := Trim(Text)
  else if Sender is TAzComboBox then with Sender as TAzComboBox do Text := Trim(Text)
  else if Sender is TDBComboBox then with Sender as TDBComboBox do Text := Trim(Text);
end;

procedure TZTourDialog.DBPhoneNoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in PhoneNoLiteral) then Key := #0;
  if Key = '-' then Key := #32;
end;

procedure TZTourDialog.DBPhoneNoExit(Sender: TObject);
begin
  if Sender is TDBEdit then
    with Sender as TDBEdit do Text := FormatPhoneNumber(Text)
  else if Sender is TEdit then
    with Sender as TEdit do Text := FormatPhoneNumber(Text)
  else if Sender is TComboBox then
    with Sender as TComboBox do Text := FormatPhoneNumber(Text)
  else if Sender is TAzComboBox then
    with Sender as TAzComboBox do Text := FormatPhoneNumber(Text)
  else if Sender is TDBComboBox then
    with Sender as TDBComboBox do Text := FormatPhoneNumber(Text);
end;

procedure TZTourDialog.DBPhoneNoComboExit(Sender: TObject);
begin
  DBPhoneNoExit(Sender);
  DBComboBoxExit(Sender);
end;

procedure TZTourDialog.DBDateKeyPress(Sender: TObject; var Key: Char);
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

procedure TZTourDialog.DBTimeKeyPress(Sender: TObject; var Key: Char);
var CanTypeSemicolon, CanTypeCipher: Boolean;
begin
  with Sender as TCustomEdit do
  begin
    CanTypeSemicolon := Pos(TimeSeparator, Text) < 2;
    CanTypeCipher := True; //(Pos('-', Text) = 0) and (SelStart = 0);
  end;
  case Key of
    #8: ;
    ':', ';': if CanTypeSemicolon then Key := TimeSeparator else Key := #0;
    '0'..'9': if not CanTypeCipher then Key := #0;
    else Key := #0;
  end;
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

procedure TZTourDialog.DBLookupComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CurFieldName: string;
  CurDataSrc: TDataSource;
  InEditState: Boolean;
begin
  if (Key = VK_DELETE) and (Shift = []) then
  begin
    with Sender as TDBLookupComboBox do
    begin
      CurDataSrc := DataSource;
      CurFieldName := DataField;
    end;
    if (CurDataSrc <> nil) and (CurDataSrc.DataSet <> nil)
      and (CurFieldName <> '')
    then
      with CurDataSrc.DataSet do
      begin
        InEditState := State = dsEdit;
        if not InEditState then Edit;
        FieldByName(CurFieldName).Clear;
        if not InEditState then Post;
      end;
  end;
end;

procedure TZTourDialog.ComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = []) then
    with Sender as TCustomComboBox do ItemIndex := -1;
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

procedure TZTourDialog.ApplyAllBtnClick(Sender: TObject);
begin
  ApplyForAllRecords;
end;

procedure TZTourDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  case ModalResult of
    mrAll, mrOk: if not DataChecking then ModalResult := mrNone;
  end;
end;

procedure TZTourDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrNone then Action := caNone;
end;

procedure TZTourDialog.GetDateFieldValue(Edit: TAzMaskEdit; Field: TDateTimeField);
begin
  with Field do if IsNull then Edit.Text := '' else Edit.AsDateTime := Value;
end;

procedure TZTourDialog.SetDateFieldValue(Edit: TAzMaskEdit; Field: TDateTimeField);
begin
  with Edit do
    if not (MaskKind in meMaskEditDateKinds) then Exit
    else if not Enabled or (AsDateTime = 0) then Field.Clear
    else Field.Value := AsDateTime;
end;

procedure TZTourDialog.HighlightDBDateEdit(Ctrl: TcxDBDateEdit;
  En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightSpinEdit(Ctrl: TSpinEdit; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.SetRecordIsNew(const Value: Boolean);
begin
  FRecordIsNew := Value;
end;

procedure TZTourDialog.HighlightDateEdit(Ctrl: TDateTimePicker;
  En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightDateEdit(Ctrl: TcxDateEdit; En: Boolean);
begin
  inherited;
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightAzEdit(Ctrl: TAzEdit; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZTourDialog.HighlightControl(Ctrl: TWinControl; En: Boolean);
begin     
  if Ctrl is TDBEdit then
  with Ctrl as TDBEdit do begin if Enabled and En then Color := clYellow; end
  else if Ctrl is TAzComboBox then
  with Ctrl as TAzComboBox do begin if Enabled and En then Color := clYellow; end
  else if Ctrl is TAzMaskEdit then
  with Ctrl as TAzMaskEdit do begin if Enabled and En then Color := clYellow; end
  else if Ctrl is TcxDBDateEdit then
  with Ctrl as TcxDBDateEdit do begin if Enabled and En then Color := clYellow; end
  else if Ctrl is TDBComboBox then
  with Ctrl as TDBComboBox do begin if Enabled and En then Color := clYellow; end
  else if Ctrl is TAzDBAddress then
  with Ctrl as TAzDBAddress do begin if Enabled and En then EditColor := clYellow; end
end;

end.

