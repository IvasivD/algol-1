unit TrstFndDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, Grids, DBGrids, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB,
  DBTables, AzComboBox, SvtDBGrids, DBCtrls, ImgList;

type
  TTouristSearchFunc = function (OrderId, GroupId, ServiceId, PersonId: Integer;
    FromDate: TDateTime; Addition: Variant): Boolean of object;

type
  TZTouristFindDlg = class(TZDialog)
    ChooseGroupBox: TGroupBox;
    OrderNoRadioButton: TRadioButton;
    ClientNameRadioButton: TRadioButton;
    OrderDateRadioButton: TRadioButton;
    OrderDatePicker: TDateTimePicker;
    TouristNameRadioButton: TRadioButton;
    SearchAcceptBtn: TBitBtn;
    FindBtn: TBitBtn;
    SearchTouristQry: TQuery;
    SearchTouristQrySrc: TDataSource;
    SearchTouristQryORDERID: TIntegerField;
    SearchTouristQryTOURGROUPID: TIntegerField;
    SearchTouristQryPERSONID: TIntegerField;
    SearchTouristQryTOURISTNAME: TStringField;
    SearchTouristQryBIRTHDATE: TDateTimeField;
    SearchTouristQryMANAGER: TStringField;
    SearchTouristQryFROMDATE: TDateTimeField;
    SearchTouristQryTILLDATE: TDateTimeField;
    SearchTouristQryORDERDATE: TDateTimeField;
    OrderNoComboBox: TAzComboBox;
    ClientNameComboBox: TAzComboBox;
    TouristNameComboBox: TAzComboBox;
    SearchTouristQryCLIENTNAME: TStringField;
    ExtraFindCheckBox: TCheckBox;
    TouristFoundDBGrid: TSvtDBGrid;
    SearchTouristQryORDERSTATE: TIntegerField;
    SearchTouristQryORDERSTATE2: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OrderRadioButtonClick(Sender: TObject);
    procedure OrderNoComboBoxChange(Sender: TObject);
    procedure OrderNoComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientNameComboBoxExit(Sender: TObject);
    procedure SearchAcceptBtnClick(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure TouristFoundDBGridSortedChange(Column: TSvtColumn;
      var ChangeEnabled: Boolean);
    procedure TouristFoundDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FFirstActivation: Boolean;
    FHistorySect: String;
    FLastSearch: Integer;
    FSearchBy: Integer;
    FTouristSearchFunc: TTouristSearchFunc;
    FServDetKeyField: TField;
    FServiceKeyField: TField;
    FServiceNameField: TField;
    FServDetKeyFieldName: String;
    FServiceKeyFieldName: String;
    FServiceNameFieldName: String;
    FSQLTableName: String;
    FEnableSimpleOrderSearch: Boolean;
    function FindRecord: Boolean;
    function GetField(const Index: Integer): TField;
    function GetFieldName(const Index: Integer): String;
    function GetHistory(const Index: Integer): TStrings;
    function GetHistorySect(Index: Integer): string;
    function GetOrderStatement: String;
    function GetSearchText: String;
    function GetWhereStatement: String;
    procedure LoadHistory;
    procedure LoadHistoryStrings(Index: Integer);
    procedure SetField(const Index: Integer; const Value: TField);
    procedure SetFieldName(const Index: Integer; const Value: String);
    procedure SetHistorySect(const Value: string);
    procedure SetSearchText(const Value: String);
    procedure StoreHistory;
    procedure StoreHistoryStrings(Index: Integer);
    procedure ToggleChooseRadioButtons;
    procedure ToggleFindBtn;
    procedure UpdateSearchTouristQry;
    function GetSimpleOrderSearch: Boolean;
  protected
    function GetOrderPayState: Integer; virtual;
    function GetQuerySelectStatement: String; virtual;
    function GetQuerySortOrder(Col: Integer): String; virtual;
    function MakeAdditionData: Variant; virtual;
    function MakeQueryText: String; virtual;
    property EnableSimpleOrderSearch: Boolean read FEnableSimpleOrderSearch write FEnableSimpleOrderSearch;
    property HistoryOrderNo: TStrings index 0 read GetHistory;
    property HistoryClient: TStrings index 1 read GetHistory;
    property HistoryTourist: TStrings index 2 read GetHistory;
    property HistorySect: String read FHistorySect write SetHistorySect;
    property HistorySectOrderNo: String index 0 read GetHistorySect;
    property HistorySectClient: String index 1 read GetHistorySect;
    property HistorySectTourist: String index 2 read GetHistorySect;
    property OrderPayState: Integer read GetOrderPayState;
    property QueryOrderStatement: String read GetOrderStatement;
    property QueryWhereStatement: String read GetWhereStatement;
    property SearchText: String read GetSearchText write SetSearchText;
    property ServDetKeyFieldName: String index 0 read GetFieldName write SetFieldName;
    property ServiceKeyFieldName: String index 1 read GetFieldName write SetFieldName;
    property ServiceNameFieldName: String index 2 read GetFieldName write SetFieldName;
    property ServDetKeyField: TField index 0 read GetField write SetField;
    property ServiceKeyField: TField index 1 read GetField write SetField;
    property ServiceNameField: TField index 2 read GetField write SetField;
    property SimpleOrderSearch: Boolean read GetSimpleOrderSearch;
  public
    property TouristSearchFunc: TTouristSearchFunc read FTouristSearchFunc write FTouristSearchFunc;
  end;

{var
  ZTouristFindDlg: TZTouristFindDlg;}

function ExecuteCommonTouristFindDlg(
  const Database, Service, ServDet, ServName, ServTitle, FromName: String; SearchFunc: TTouristSearchFunc): Boolean;


implementation

uses IniFiles,
  VDlgs, TourStrMag, TourConsts, TourFiles, TourDbUn, TourCmnlIf, OrderUn;

{$R *.dfm}

function ExecuteCommonTouristFindDlg(
  const Database, Service, ServDet, ServName, ServTitle, FromName: String; SearchFunc: TTouristSearchFunc): Boolean;
begin
  with TZTouristFindDlg.Create(Application) do
    try
      SearchTouristQry.DatabaseName := Database;
      ServDetKeyFieldName := ServDet;
      ServiceKeyFieldName := Service;
      ServiceNameFieldName := ServName;
      ServiceNameField.DisplayLabel := ServTitle;
      FSQLTableName := FromName;
      FTouristSearchFunc := SearchFunc;
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

const
  nSearcyByOrderId = 0;
  nSearcyByClient = 1;
  nSearcyByOrderDate = 2;
  nSearcyByTourist = 3;

const
  sHistorySect = 'LastUsed\';
  sDefaultSect = 'ServiceSearch';
  nHistoryItemCount = 9;
  nHistoryOrderId = 0;
  nHistoryClient = 1;
  nHistoryTourist = 2;
  sHistoryPart: array[nHistoryOrderId..nHistoryTourist] of String = (
    'OrderNo', 'Client', 'Tourist');


{ TZTouristFindDlg }

function TZTouristFindDlg.FindRecord: Boolean;
var ByOrd: Boolean;
begin
  with SearchTouristQry do
    ByOrd := not Active or (RecordCount = 0) and (FSearchBy = nSearcyByOrderId);
  Result := Assigned(FTouristSearchFunc) and (
    ByOrd and
      FTouristSearchFunc(SafeStrToInt(SearchText), 0, 0, 0, 0, MakeAdditionData)
    or FTouristSearchFunc(
      SearchTouristQryORDERID.Value, SearchTouristQryTOURGROUPID.Value,
        ServiceKeyField.AsInteger, SearchTouristQryPERSONID.Value,
        SearchTouristQryFROMDATE.Value, MakeAdditionData));
  if Result then FLastSearch := ServDetKeyField.AsInteger;
end;

function TZTouristFindDlg.GetField(const Index: Integer): TField;
begin
  case Index of
    0: if Assigned(FServDetKeyField) then Result := FServDetKeyField
       else Result := SearchTouristQry.FieldByName(FServDetKeyFieldName);
    1: if Assigned(FServiceKeyField) then Result := FServiceKeyField
       else Result := SearchTouristQry.FieldByName(FServiceKeyFieldName);
    2: if Assigned(FServiceNameField) then Result := FServiceNameField
       else Result := SearchTouristQry.FieldByName(FServiceNameFieldName);
  else Result := nil;
  end;
end;

function TZTouristFindDlg.GetFieldName(const Index: Integer): String;
begin
  case Index of
    0: if Assigned(FServDetKeyField) then Result := FServDetKeyField.FieldName
       else Result := FServDetKeyFieldName;
    1: if Assigned(FServiceKeyField) then Result := FServiceKeyField.FieldName
       else Result := FServiceKeyFieldName;
    2: if Assigned(FServiceNameField) then Result := FServiceNameField.FieldName
       else Result := FServiceNameFieldName;
  else Result := '';
  end;
end;

function TZTouristFindDlg.GetHistory(const Index: Integer): TStrings;
begin
  case Index of
    nHistoryOrderId: Result := OrderNoComboBox.Items;
    nHistoryClient: Result := ClientNameComboBox.Items;
    nHistoryTourist: Result := TouristNameComboBox.Items;
  else Result := nil;
  end;
end;

function TZTouristFindDlg.GetHistorySect(Index: Integer): string;
begin
  Result := sHistorySect + sHistoryPart[Index] + FHistorySect;
end;

function TZTouristFindDlg.GetOrderPayState: Integer;
begin
  Result := CalcOrderPaymentState(
    SearchTouristQryORDERSTATE.Value, SearchTouristQryORDERSTATE2.Value);
end;

function TZTouristFindDlg.GetOrderStatement: String;
const
  sOrder = 'order by ';
  sField: array[nSearcyByOrderId..nSearcyByTourist] of String = (
    'ORDERID, PERSONID',
    'CLIENTNAME, ORDERID, PERSONID',
    'ORDERDATE, ORDERID, PERSONID',
    'TOURISTNAME, BIRTHDATE, ORDERID');
begin
  Result := sOrder + sField[FSearchBy];
end;

function TZTouristFindDlg.GetSearchText: String;
begin
  case FSearchBy of
    nSearcyByOrderId: Result := Trim(OrderNoComboBox.Text);
    nSearcyByClient: Result := ClientNameComboBox.Text;
    nSearcyByOrderDate: Result := DateToStr(Int(OrderDatePicker.DateTime));
    nSearcyByTourist: Result := TouristNameComboBox.Text;
    else Result := '';
  end;
end;

function TZTouristFindDlg.GetSimpleOrderSearch: Boolean;
begin
  Result := (FSearchBy = nSearcyByOrderId) and EnableSimpleOrderSearch
    and (SearchText <> ''); 
end;

function TZTouristFindDlg.GetWhereStatement: String;
const
  sWhereLike = 'where locase(%s) like ''%s%%''';
  //sWhereLike = 'where %s like ''%s%%''';   //////////////
  sField: array[nSearcyByOrderId..nSearcyByTourist] of String = (
    'ORDERID', 'CLIENTNAME', 'ORDERDATE', 'TOURISTNAME');
var FieldName, LikeText: String;
begin
  FieldName := sField[FSearchBy];
  LikeText := GetSearchText;
  if (LikeText <> '') and ExtraFindCheckBox.Checked then LikeText := '%' + LikeText;
  if LikeText = '' then Result := 'where OrderId is null' // do search nothing
  else Result := Format(sWhereLike, [FieldName, LikeText]);
end;

procedure TZTouristFindDlg.LoadHistory;
var I: Integer;
begin
  for I := nHistoryOrderId to nHistoryTourist do LoadHistoryStrings(I);
end;

procedure TZTouristFindDlg.LoadHistoryStrings(Index: Integer);
var
  Hist: TStrings;
  Sect: String;
  V: string;
  I: Integer;
begin
  Sect := GetHistorySect(Index);
  Hist := GetHistory(Index);
  if Assigned(Hist) and (Sect <> '') then
    with TIniFile.Create(fIniFileName) do
    try
      if SectionExists(Sect) then
      begin
        Hist.Clear;
        for I := 0 to nHistoryItemCount - 1 do
          if ValueExists(Sect, 'Item' + IntToStr(I)) then
          begin
            V := ReadString(Sect, 'Item' + IntToStr(I), '');
            if V <> '' then Hist.Add(V);
          end
          else Break;
      end;
    finally
      Free;
    end;
end;

procedure TZTouristFindDlg.SetField(const Index: Integer; const Value: TField);
begin
  case Index of
    0: FServDetKeyField := Value;
    1: FServiceKeyField := Value;
    2: FServiceNameField := Value;
  end;
  SetFieldName(Index, Value.FieldName);
end;

procedure TZTouristFindDlg.SetFieldName(const Index: Integer; const Value: String);
begin
  case Index of
    0: if Assigned(FServDetKeyField) then FServDetKeyField.FieldName := Value
       else FServDetKeyFieldName := Value;
    1: if Assigned(FServiceKeyField) then FServiceKeyField.FieldName := Value
       else FServiceKeyFieldName := Value;
    2: if Assigned(FServiceNameField) then FServiceNameField.FieldName := Value
       else FServiceNameFieldName := Value;
  end;
end;

procedure TZTouristFindDlg.SetHistorySect(const Value: string);
begin
  if FHistorySect <> Value then FHistorySect := Value;
end;

procedure TZTouristFindDlg.SetSearchText(const Value: String);
begin
  case FSearchBy of
    nSearcyByOrderId: OrderNoComboBox.Text := Trim(Value);
    nSearcyByClient: ClientNameComboBox.Text := Value;
    nSearcyByOrderDate: OrderDatePicker.DateTime := SafeStrToDate(Value, Now);
    nSearcyByTourist: TouristNameComboBox.Text := Value;
  end;
end;

procedure TZTouristFindDlg.StoreHistory;
var I: Integer;
begin
  for I := nHistoryOrderId to nHistoryTourist do StoreHistoryStrings(I);
end;

procedure TZTouristFindDlg.StoreHistoryStrings(Index: Integer);
var
  Hist: TStrings;
  Sect: String;
  I: Integer;
begin
  Sect := GetHistorySect(Index);
  Hist := GetHistory(Index);
  if Assigned(Hist) and (Sect <> '') then
    with TIniFile.Create(fIniFileName) do
    try
      if SectionExists(Sect) then EraseSection(Sect);
      for I := 0 to Hist.Count - 1 do
        WriteString(Sect, 'Item' + IntToStr(I), Hist[I]);
    finally
      Free;
    end;
end;

procedure TZTouristFindDlg.ToggleChooseRadioButtons;
begin
  ToggleControlEnabled(OrderNoComboBox, OrderNoRadioButton.Checked);
  ToggleControlEnabled(ClientNameComboBox, ClientNameRadioButton.Checked);
  ToggleControlEnabled(OrderDatePicker, OrderDateRadioButton.Checked);
  ToggleControlEnabled(TouristNameComboBox, TouristNameRadioButton.Checked);
  case FSearchBy of
    nSearcyByOrderId: ActiveControl := OrderNoComboBox;
    nSearcyByClient: ActiveControl := ClientNameComboBox;
    nSearcyByOrderDate: ActiveControl := OrderDatePicker;
    nSearcyByTourist: ActiveControl := TouristNameComboBox;
  end;
  if (ActiveControl is TAzComboBox) then
    with ActiveControl as TAzComboBox do
      if Assigned(OnChange) then OnChange(ActiveControl);
end;

procedure TZTouristFindDlg.ToggleFindBtn;
begin
  FindBtn.Enabled :=
    SearchTouristQry.Active and (SearchTouristQry.RecordCount > 0)
    or EnableSimpleOrderSearch
      and (FSearchBy = nSearcyByOrderId) and (SearchText <> '');
  OkBtn.Enabled := FindBtn.Enabled;
end;

function TZTouristFindDlg.GetQuerySelectStatement: String;
const
  sSQLText = 'select OrderId, OrderDate, OrderState, OrderState2, ' +
    'ClientName, TourGroupId, %s, %s, ' +
    'PersonId, TouristName, BirthDate, FromDate, TillDate, %s, Manager ' +
    'from %s';
begin
  Result := Format(sSQLText, [ServiceKeyFieldName, ServDetKeyFieldName,
    ServiceNameFieldName, FSQLTableName]);
end;

function TZTouristFindDlg.GetQuerySortOrder(Col: Integer): String;
const sByTourist = 'TouristName, BirthDate desc';
begin
  case Col of
    0: Result := 'OrderId, ' + sByTourist;
    1: Result := 'OrderDate, OrderId, ' + sByTourist;
    2: Result := 'ClientName, OrderId, ' + sByTourist;
    3: Result := sByTourist + ', OrderId';
    4: Result := 'BirthDate, TouristName, OrderId';
    6: Result := 'FromDate, ' + sByTourist + ', OrderId';
    7: Result := 'TillDate, ' + sByTourist + ', OrderId';
  else Result :=
    TouristFoundDBGrid.Columns[Col].FieldName + ', OrderId, ' + sByTourist;
  end;
end;

procedure TZTouristFindDlg.UpdateSearchTouristQry;
begin
  with SearchTouristQry do
  begin
    Close;
    SQL.Text := MakeQueryText;
    Prepare;
    Open;
  end;
end;

function TZTouristFindDlg.MakeAdditionData: Variant;
begin
  Result := null;
end;

function TZTouristFindDlg.MakeQueryText: String;
begin
  Result := Format('%s %s %s', [
    GetQuerySelectStatement, QueryWhereStatement, QueryOrderStatement]);
end;

procedure TZTouristFindDlg.FormCreate(Sender: TObject);
begin
  inherited;
  Caption := SVDlgsSearchTitle;
  FEnableSimpleOrderSearch := False;
  FHistorySect := sDefaultSect;
  FLastSearch := 0;
  FSearchBy := nSearcyByClient;
  FFirstActivation := True;
end;

procedure TZTouristFindDlg.FormActivate(Sender: TObject);
begin
  inherited;
  if FFirstActivation then
  begin
    LoadHistory;
    FFirstActivation := False;
  end;
end;

procedure TZTouristFindDlg.OrderRadioButtonClick(Sender: TObject);
begin
  FSearchBy := (Sender as TComponent).Tag;
  ToggleChooseRadioButtons;
  SearchAcceptBtn.Enabled := OrderDateRadioButton.Checked;
  ToggleFindBtn;
end;

procedure TZTouristFindDlg.OrderNoComboBoxChange(Sender: TObject);
begin
  SearchAcceptBtn.Enabled := (Sender as TAzComboBox).Text <> '';
  ToggleFindBtn;
end;

procedure TZTouristFindDlg.OrderNoComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and SearchAcceptBtn.Enabled then
  begin
    with Sender as TAzComboBox do if Assigned(OnExit) then OnExit(Sender);
    SearchAcceptBtn.Click;
    Key := 0;
  end;
end;

procedure TZTouristFindDlg.ClientNameComboBoxExit(Sender: TObject);
begin
  with Sender as TAzComboBox do Text := AnsiLowerCase(Text);
end;

procedure TZTouristFindDlg.SearchAcceptBtnClick(Sender: TObject);
begin
  UpdateSearchTouristQry;
  TouristFoundDBGrid.Enabled := SearchTouristQry.RecordCount > 0;
  if TouristFoundDBGrid.Enabled then ActiveControl := TouristFoundDBGrid;
  ToggleFindBtn;
end;

procedure TZTouristFindDlg.FindBtnClick(Sender: TObject);
begin
  FindRecord;
end;

procedure TZTouristFindDlg.TouristFoundDBGridSortedChange(
  Column: TSvtColumn; var ChangeEnabled: Boolean);
begin
  if not ChangeQueryOrder(
    SearchTouristQry, ServDetKeyField.FullName, GetQuerySortOrder(Column.Index))
  then begin
    ChangeEnabled := False;
    ErrorFmtDlg(SZTBrwsQueryError + #13'%s', [Column.FieldName]);
  end;
end;

procedure TZTouristFindDlg.TouristFoundDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
begin
  if not (gdFixed in State) then
    with Sender as TSvtDBGrid, Canvas do
    begin
      if DataCol = 0 then
      begin
        Brush.Color := GetOrderStateColor(OrderPayState);
        FillRect(Rect);
        Font.Color := clWindowText;
      end;
      if SearchTouristQryORDERSTATE.Value = ordAnnuled then
        with Font do
        begin
          Color := clRed;
          Style := Style + [fsStrikeout];
        end;
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TZTouristFindDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (ModalResult = mrOk) and (
    (ServDetKeyField.AsInteger <> FLastSearch)
      or SimpleOrderSearch and (SafeStrToInt(SearchText) <> FLastSearch))
    and not FindRecord
  then ModalResult := mrCancel;
  if ModalResult <> mrNone then StoreHistory;
end;

end.
