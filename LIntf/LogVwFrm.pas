unit LogVwFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZTView, ImgList, ActnList, Menus, DB, DBTables, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, AzComboBox, DBCtrls;

type
  TLogDataViewForm = class(TZViewForm)
    PersonListDBGrid: TDBGrid;
    FromDateCheckBox: TCheckBox;
    TillDateCheckBox: TCheckBox;
    FromDatePicker: TDateTimePicker;
    TillDatePicker: TDateTimePicker;
    CategoryComboBox: TAzComboBox;
    CategoryCheckBox: TCheckBox;
    SubCategoryCheckBox: TCheckBox;
    SubCategoryComboBox: TAzComboBox;
    ActionCheckBox: TCheckBox;
    ActionComboBox: TAzComboBox;
    UserCheckBox: TCheckBox;
    UserComboBox: TAzComboBox;
    DetailListQueryPROGRAMLOGID: TIntegerField;
    DetailListQueryLOGDATETIME: TDateTimeField;
    DetailListQueryMANAGER: TStringField;
    DetailListQueryLOGPROMPT: TMemoField;
    DetailListQueryCalcLogPrompt: TStringField;
    LogPromptDBMemo: TDBMemo;
    FilterBtn: TBitBtn;
    SelCategoryQry: TQuery;
    SelSubCategQry: TQuery;
    SelActionQry: TQuery;
    SelUserQry: TQuery;
    SelCategoryQryITEMNAME: TStringField;
    SelCategoryQryINTVALUE: TIntegerField;
    SelSubCategQryITEMNAME: TStringField;
    SelSubCategQryINTVALUE: TIntegerField;
    SelActionQryITEMNAME: TStringField;
    SelActionQryINTVALUE: TIntegerField;
    SelUserQryTMUSERID: TIntegerField;
    SelUserQryMANAGER: TStringField;
    DetailListQueryLOGCATEGORY: TIntegerField;
    DetailListQuerySUBCATEGORY: TIntegerField;
    DetailListQueryLOGACTION: TIntegerField;
    DetailListQueryUSERID: TIntegerField;
    DetailListQueryCATEGORYNAME: TStringField;
    DetailListQuerySUBCATEGNAME: TStringField;
    DetailListQueryACTIONNAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DetailListQueryCalcFields(DataSet: TDataSet);
    procedure FromDateCheckBoxClick(Sender: TObject);
    procedure FromDatePickerChange(Sender: TObject);
    procedure TillDateCheckBoxClick(Sender: TObject);
    procedure CategoryCheckBoxClick(Sender: TObject);
    procedure SubCategoryCheckBoxClick(Sender: TObject);
    procedure ActionCheckBoxClick(Sender: TObject);
    procedure UserCheckBoxClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
  private
    FGridSortColumn: Integer;
    FGridHintedColumn: TField;
    procedure ConnectDatabase(const Database: String);
    procedure DoFilterQuery;
    function GetComboBoxItemId(ComboBox: TCustomComboBox): Integer;
    function GetLogAction: Integer;
    function GetLogActUser: Integer;
    function GetLogCategory: Integer;
    function GetLogSubCateg: Integer;
    procedure PrepareDatePickers;
    procedure SetComboBoxItemId(
      CheckBox: TCheckBox; ComboBox: TCustomComboBox; Value: Integer);
    procedure SetLogAction(const Value: Integer);
    procedure SetLogActUser(const Value: Integer);
    procedure SetLogCategory(const Value: Integer);
    procedure SetLogSubCateg(const Value: Integer);
    procedure SetWindowSize;
    procedure ToggleComboBoxEnable(ComboBox: TCustomComboBox; Enable: Boolean);
  protected
    procedure DoPrint; override;
    function GetOrderColumns(Column: TColumn): string; virtual;
    procedure PrintGrid; virtual;
    procedure ViewHint; override;
    procedure ViewMemo(Field: TField); override;
    property GridSortColumn: Integer read FGridSortColumn;
    property GridHintedColumn: TField read FGridHintedColumn write FGridHintedColumn;
    property LogCategory: Integer read GetLogCategory write SetLogCategory;
    property LogSubCateg: Integer read GetLogSubCateg write SetLogSubCateg;
    property LogAction: Integer read GetLogAction write SetLogAction;
    property LogActUser: Integer read GetLogActUser write SetLogActUser;
  end;

var
  LogDataViewForm: TLogDataViewForm;

procedure ShowLogDataViewForm(const Database: string; Category, User: Integer);


implementation

uses Types, VDlgs, TourDbUn; //, DataMod;

{$R *.dfm}

procedure ShowLogDataViewForm(const Database: string; Category, User: Integer);
begin
  with LogDataViewForm {TLogDataViewForm.Create(Application) }do
    try
      ConnectDatabase(Database);
      //UpdateDetailListQuery;
      LogCategory := Category;
      LogActUser := User;
      DoFilterQuery;
      Show; //ShowModal;
    finally
      //Free;
    end;
end;

{ TLogDataViewForm }

procedure TLogDataViewForm.ConnectDatabase(const Database: String);
begin
  DetailListQuery.DatabaseName := Database;
  SelCategoryQry.DatabaseName := Database;
  SelSubCategQry.DatabaseName := Database;
  SelActionQry.DatabaseName := Database;
  SelUserQry.DatabaseName := Database;
  DataFieldToStrings(
    SelCategoryQryITEMNAME, SelCategoryQryINTVALUE, CategoryComboBox.Items);
  DataFieldToStrings(
    SelSubCategQryITEMNAME, SelSubCategQryINTVALUE, SubCategoryComboBox.Items);
  DataFieldToStrings(
    SelActionQryITEMNAME, SelActionQryINTVALUE, ActionComboBox.Items);
  DataFieldToStrings(
    SelUserQryMANAGER, SelUserQryTMUSERID, UserComboBox.Items);
end;

procedure TLogDataViewForm.DoFilterQuery;
const
  sAnd = ' and ';
  sFrom = 'LogDateTime >= ''%s''';
  sTill = 'LogDateTime < ''%s''';
  sCatg = 'LogCategory = %d';
  sSCat = 'SubCategory = %d';
  sActn = 'LogAction = %d';
  sUser = 'UserId = %d';
var Fltr: String;
begin
  if FromDateCheckBox.Checked then
    Fltr := Format(sFrom, [DateToStr(Int(FromDatePicker.DateTime))])
  else Fltr := '';
  if TillDateCheckBox.Checked then
  begin
    if Fltr <> '' then Fltr := Fltr + sAnd;
    Fltr := Fltr + Format(sTill, [DateToStr(Int(TillDatePicker.DateTime) + 1)]);
  end;
  if CategoryCheckBox.Checked then
  begin
    if Fltr <> '' then Fltr := Fltr + sAnd;
    Fltr := Fltr + Format(sCatg, [LogCategory]);
  end;
  if SubCategoryCheckBox.Checked then
  begin
    if Fltr <> '' then Fltr := Fltr + sAnd;
    Fltr := Fltr + Format(sSCat, [LogSubCateg]);
  end;
  if ActionCheckBox.Checked then
  begin
    if Fltr <> '' then Fltr := Fltr + sAnd;
    Fltr := Fltr + Format(sActn, [LogAction]);
  end;
  if UserCheckBox.Checked then
  begin
    if Fltr <> '' then Fltr := Fltr + sAnd;
    Fltr := Fltr + Format(sUser, [LogActUser]);
  end;
  DetailListQuery.Filter := Fltr;
end;

function TLogDataViewForm.GetComboBoxItemId(ComboBox: TCustomComboBox): Integer;
begin
  with ComboBox do
    if Enabled and (ItemIndex >= 0) then
      Result := Integer(Items.Objects[ItemIndex])
    else Result := 0;
end;

function TLogDataViewForm.GetLogAction: Integer;
begin
  Result := GetComboBoxItemId(ActionComboBox);
end;

function TLogDataViewForm.GetLogActUser: Integer;
begin
  Result := GetComboBoxItemId(UserComboBox);
end;

function TLogDataViewForm.GetLogCategory: Integer;
begin
  Result := GetComboBoxItemId(CategoryComboBox);
end;

function TLogDataViewForm.GetLogSubCateg: Integer;
begin
  Result := GetComboBoxItemId(SubCategoryComboBox);
end;

procedure TLogDataViewForm.PrepareDatePickers;
begin
  FromDatePicker.DateTime := Int(Now);
  FromDatePickerChange(FromDatePicker);
end;

procedure TLogDataViewForm.SetComboBoxItemId(
  CheckBox: TCheckBox; ComboBox: TCustomComboBox; Value: Integer);
begin
  if Value = 0 then
  begin
    with CheckBox do if Checked then Checked := False;
    ComboBox.ItemIndex := -1;
    ToggleComboBoxEnable(ComboBox, False);
  end
  else begin
    with CheckBox do if not Checked then Checked := True;
    ToggleComboBoxEnable(ComboBox, True);
    with ComboBox do ItemIndex := Items.IndexOfObject(Pointer(Value));
  end;
end;

procedure TLogDataViewForm.SetLogAction(const Value: Integer);
begin
  SetComboBoxItemId(ActionCheckBox, ActionComboBox, Value);
end;

procedure TLogDataViewForm.SetLogActUser(const Value: Integer);
begin
  SetComboBoxItemId(UserCheckBox, UserComboBox, Value);
end;

procedure TLogDataViewForm.SetLogCategory(const Value: Integer);
begin
  SetComboBoxItemId(CategoryCheckBox, CategoryComboBox, Value);
end;

procedure TLogDataViewForm.SetLogSubCateg(const Value: Integer);
begin
  SetComboBoxItemId(SubCategoryCheckBox, SubCategoryComboBox, Value);
end;

procedure TLogDataViewForm.SetWindowSize;
var R: TRect;
begin
  if SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0) then
  begin // correct heights and widths in order of Work area
    Top := R.Top;
    Left := R.Left;
    Width := R.Right - R.Left;
    Height := R.Bottom - R.Top - Top;
  end;
end;

procedure TLogDataViewForm.ToggleComboBoxEnable(ComboBox: TCustomComboBox;
  Enable: Boolean);
begin
  with ComboBox do
  begin
    Enabled := Enable;
    if Enabled and (ItemIndex < 0) then ItemIndex := 0;
  end;
end;

procedure TLogDataViewForm.DoPrint;
begin
  PrintGrid;
end;

function TLogDataViewForm.GetOrderColumns(Column: TColumn): string;
begin
end;

procedure TLogDataViewForm.PrintGrid;
begin
  //
end;

procedure TLogDataViewForm.ViewHint;
begin
  if FGridHintedColumn <> nil then DoViewHint(FGridHintedColumn.AsString);
end;

procedure TLogDataViewForm.ViewMemo(Field: TField);
begin
end;

procedure TLogDataViewForm.FormCreate(Sender: TObject);
begin
  inherited;
  SetWindowSize;
  PrepareDatePickers;
end;

procedure TLogDataViewForm.DetailListQueryCalcFields(DataSet: TDataSet);
begin
  DetailListQueryCalcLogPrompt.Value := DetailListQueryLOGPROMPT.AsString;
end;

procedure TLogDataViewForm.FromDateCheckBoxClick(Sender: TObject);
begin
  ToggleControlEnabled(FromDatePicker, FromDateCheckBox.Checked);
end;

procedure TLogDataViewForm.FromDatePickerChange(Sender: TObject);
begin
  with TillDatePicker do
  begin
    if DateTime < FromDatePicker.DateTime then
      DateTime := FromDatePicker.DateTime;
    MinDate := FromDatePicker.DateTime;
  end;
end;

procedure TLogDataViewForm.TillDateCheckBoxClick(Sender: TObject);
begin
  ToggleControlEnabled(TillDatePicker, TillDateCheckBox.Checked);
end;

procedure TLogDataViewForm.CategoryCheckBoxClick(Sender: TObject);
begin
  ToggleComboBoxEnable(CategoryComboBox, CategoryCheckBox.Checked);
end;

procedure TLogDataViewForm.SubCategoryCheckBoxClick(Sender: TObject);
begin
  ToggleComboBoxEnable(SubCategoryComboBox, SubCategoryCheckBox.Checked);
end;

procedure TLogDataViewForm.ActionCheckBoxClick(Sender: TObject);
begin
  ToggleComboBoxEnable(ActionComboBox, ActionCheckBox.Checked);
end;

procedure TLogDataViewForm.UserCheckBoxClick(Sender: TObject);
begin
  ToggleComboBoxEnable(UserComboBox, UserCheckBox.Checked);
end;

procedure TLogDataViewForm.FilterBtnClick(Sender: TObject);
begin
  DoFilterQuery;
end;

end.
