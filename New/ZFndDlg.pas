unit ZFndDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDlg, StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBGrids, SvtDBGrids, 
  cxGridDBTableView;

type
  TFindCallbackProc = procedure (Id: Integer; const Text: String) of object;

type
  TZFindDialog = class(TForm)
    PromptLabel: TLabel;
    TextComboBox: TComboBox;
    OptionRadioGroup: TRadioGroup;
    CaseSensityCheckBox: TCheckBox;
    Label1: TLabel;
    FieldComboBox: TComboBox;
    CtrlPanel: TPanel;
    CloseBtn: TBitBtn;
    FindNextBtn: TBitBtn;
    FindBtn: TBitBtn;
    OkBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure TextComboBoxChange(Sender: TObject);
    procedure TextComboBoxExit(Sender: TObject);
    procedure FindBtnClick(Sender: TObject);
    procedure FindNextBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FDataSet: TDataSet;
    FFindFields: TStrings;
    FFindLabels: TStrings;
    FHistory: TStrings;
    FHistSect: string;
    FFindSuccess: Boolean;
    FFindCallbackProc: TFindCallbackProc;
    FDataSetNameField: TField;
    FDataSetKeyField: TField;
    function GetHistSect: string;
    function IsFindText: Boolean;
    procedure LoadHistoryStrings;
    procedure SetHistSect(const Value: string);
    procedure StoreHistoryStrings;
  protected
    procedure AfterFind(Found: Boolean); virtual;
    function FindInDataSet(FindNext, ShowError: Boolean): Boolean; virtual;
    function GetFoundInform: string; virtual;
    property DataSet: TDataSet read FDataSet write FDataSet;
    property DataSetKeyField: TField read FDataSetKeyField write FDataSetKeyField;
    property DataSetNameField: TField read FDataSetNameField write FDataSetNameField;
    property FindCallbackProc: TFindCallbackProc read FFindCallbackProc write FFindCallbackProc;
    property FindFields: TStrings read FFindFields write FFindFields;
    property FindLabels: TStrings read FFindLabels write FFindLabels;
    property HistSect: string read GetHistSect write SetHistSect;
  public
    function Execute: Boolean;
    function ExecuteModal: Boolean;
  end;

var
  ZFindDialog: TZFindDialog;

function ExecuteFindInDataset(DSet: TDataSet; Flds, Lbls: TStrings;
  const AHistSect: string = ''): Boolean;
function ShowFindInDataset(DSet: TDataSet; Flds, Lbls: TStrings;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean;
function ShowFindInGrid(Grid: TDBGrid;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean; overload;
function ShowFindInGrid(Grid: TSvtDBGrid;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean; overload;
function ShowFindInGrid(Grid: TcxGridDBTableView;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean; overload;

implementation

uses IniFiles, TourCmnlIf, Finder, TourConsts, TourFiles;

{$R *.DFM}

const
  sDefltSct = 'InputQuery';
  sHistSect = 'LastUsed\';

function ExecuteFindInDataset(DSet: TDataSet; Flds, Lbls: TStrings;
  const AHistSect: string = ''): Boolean;
begin
  Result := ShowFindInDataset(DSet, Flds, Lbls, AHistSect, True);
end;

function ShowFindInDataset(DSet: TDataSet; Flds, Lbls: TStrings;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean;
begin
  with TZFindDialog.Create(Application) do
  try
    FDataSet := DSet;
    if AHistSect = '' then HistSect := sDefltSct else HistSect := AHistSect;
    FindFields.Assign(Flds);
    FindLabels.Assign(Lbls);
    FieldComboBox.ItemIndex := 0;
    if Modal then Result := ExecuteModal else Result := Execute;
  finally
    Free;
  end;
end;

function ShowFindInGrid(Grid: TDBGrid;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean;
var
  Flds, Lbls: TStrings;
  I: Integer;
begin
  Flds := TStringList.Create;
  Lbls := TStringList.Create;
  try
    with Grid.Columns do
      for I := 0 to Count - 1 do
        with Items[I] do
          if Width > 0 then
          begin
            Flds.Add(FieldName);
            Lbls.Add(Title.Caption);
          end;
    Result := (Flds.Count > 0) and
      ShowFindInDataset(Grid.DataSource.DataSet, Flds, Lbls, AHistSect, Modal);
  finally
    Lbls.Free;
    Flds.Free;
  end;
end;

function ShowFindInGrid(Grid: TSvtDBGrid;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean;
var
  Flds, Lbls: TStrings;
  I: Integer;
begin
  Flds := TStringList.Create;
  Lbls := TStringList.Create;
  try
    with Grid.Columns do
      for I := 0 to Count - 1 do
        with Items[I] do
          if Width > 0 then
          begin
            Flds.Add(FieldName);
            Lbls.Add(Title.Caption);
          end;
    Result := (Flds.Count > 0) and
      ShowFindInDataset(Grid.DataSource.DataSet, Flds, Lbls, AHistSect, Modal);
  finally
    Lbls.Free;
    Flds.Free;
  end;
end;

function ShowFindInGrid(Grid: TcxGridDBTableView;
  const AHistSect: string = ''; Modal: Boolean = False): Boolean; 
var
  Flds, Lbls: TStrings;
  I: Integer;
begin
  Flds := TStringList.Create;
  Lbls := TStringList.Create;
  try
    with Grid do
      for I := 0 to ColumnCount - 1 do
        with Columns[I] do
          if Width > 0 then
          begin
            Flds.Add(DataBinding.FieldName);
            Lbls.Add(Caption);
          end;          
    Result := (Flds.Count > 0) and
      ShowFindInDataset(Grid.DataController.DataSet, Flds, Lbls, AHistSect, Modal);
  finally
    Lbls.Free;
    Flds.Free;
  end;
end;

{ TZFindDialog }

procedure TZFindDialog.AfterFind(Found: Boolean);
begin
  if Found then
  begin
    if Assigned(FFindCallbackProc)
      and Assigned(FDataSetKeyField) and Assigned(FDataSetNameField)
    then
      FFindCallbackProc(FDataSetKeyField.AsInteger, FDataSetNameField.AsString);
    if OkBtn.Visible then InformDlg(GetFoundInform);
  end;
end;

function TZFindDialog.FindInDataSet(FindNext, ShowError: Boolean): Boolean;
var
  FindText, Err: string;
  CIns: Boolean;
begin
  FindText := TextComboBox.Text;
  CIns := CaseSensityCheckBox.Checked;
  if CIns then FindText := AnsiUpperCase(FindText);
  if ShowError then Err := SZTBrwsSearchNotFound else Err := '';
  Result := FindInFieldEx(FDataSet, FindFields[FieldComboBox.ItemIndex],
    FindText, Err, False, not FindNext, CIns, OptionRadioGroup.ItemIndex, 0);
  AfterFind(Result);
end;

function TZFindDialog.GetFoundInform: string;
var I: Integer;
begin
  Result := '';
  for I := 0 to FFindLabels.Count - 1 do
    Result := Result + Format('%s = %s'#13, [
      FFindLabels[I], FDataSet.FieldByName(FFindFields[I]).AsString]);
end;

function TZFindDialog.GetHistSect: string;
begin
  Result := sHistSect + FHistSect;
end;

function TZFindDialog.IsFindText: Boolean;
begin
  Result := Trim(TextComboBox.Text) <> '';
end;

procedure TZFindDialog.LoadHistoryStrings;
var
  V: string;
  I: Integer;
begin
  with TIniFile.Create(fIniFileName) do
  try
    if SectionExists(HistSect) then
    begin
      FHistory.Clear;
      for I := 0 to TextComboBox.DropDownCount - 1 do
        if ValueExists(HistSect, 'Item' + IntToStr(I)) then
        begin
          V := ReadString(HistSect, 'Item' + IntToStr(I), '');
          if V <> '' then FHistory.Add(V);
        end
        else Break;
        {for I := TextComboBox.DropDownCount - 1 downto 0 do
          if ValueExists(HistSect, 'Item' + IntToStr(I)) then
          begin
            V := ReadString(HistSect, 'Item' + IntToStr(I), '');
            if V <> '' then FHistory.Add(V);
          end;}
    end;
  finally
    Free;
  end;
end;

procedure TZFindDialog.SetHistSect(const Value: string);
begin
  if FHistSect <> Value then
  begin
    FHistSect := Value;
    LoadHistoryStrings;
  end;
end;

procedure TZFindDialog.StoreHistoryStrings;
var I: Integer;
begin
  with TIniFile.Create(fIniFileName) do
  try
    if SectionExists(HistSect) then EraseSection(HistSect);
    for I := 0 to FHistory.Count - 1 do
      WriteString(HistSect, 'Item' + IntToStr(I), FHistory[I]);
  finally
    Free;
  end;
end;

function TZFindDialog.Execute: Boolean;
begin
  OkBtn.Visible := False;
  FindBtn.Default := True;
  ShowModal;
  Result := FFindSuccess;
end;

function TZFindDialog.ExecuteModal: Boolean;
begin
  OkBtn.Visible := True;
  FindBtn.Default := False;
  Result := (ShowModal = mrOk) and (FFindSuccess or FindInDataSet(False, False));
end;

procedure TZFindDialog.FormCreate(Sender: TObject);
begin
  FFindFields := TStringList.Create;
  FFindLabels := FieldComboBox.Items;
  FHistory := TextComboBox.Items;
  FHistSect := '';
  FFindSuccess := True;
end;

procedure TZFindDialog.TextComboBoxChange(Sender: TObject);
var En: Boolean;
begin
  FFindSuccess := False;
  En := IsFindText and (FieldComboBox.ItemIndex >= 0);
  with OkBtn do if Visible then Enabled := En;
  with FindBtn do if Visible then Enabled := En;
  with FindNextBtn do if Visible then Enabled := False;
end;

procedure TZFindDialog.TextComboBoxExit(Sender: TObject);
begin
  {with TextComboBox do
    if IsFindText and (Items.IndexOf(Text) < 0) then Items.Insert(0, Text);}
  with FHistory do
    if IsFindText and (IndexOf(TextComboBox.Text) < 0) then
      Insert(0, TextComboBox.Text);
end;

procedure TZFindDialog.FindBtnClick(Sender: TObject);
begin
  FFindSuccess := FindInDataSet(False, True);
  FindNextBtn.Enabled := FFindSuccess;
  if FFindSuccess then ActiveControl := FindNextBtn;
end;

procedure TZFindDialog.FindNextBtnClick(Sender: TObject);
begin
  FindInDataSet(True, True);
end;

procedure TZFindDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (ModalResult = mrCancel) or IsFindText;
  if not CanClose then ModalResult := mrNone
  else begin
    TextComboBoxExit(Self);
    StoreHistoryStrings;
  end;
end;

procedure TZFindDialog.FormDestroy(Sender: TObject);
begin
  FFindFields.Free;
end;

end.
