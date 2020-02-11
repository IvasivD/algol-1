unit ZTBrws;

interface

{$DEFINE DictionExe}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Grids, DBGrids, ExtCtrls, Buttons, ActnList, ComCtrls, ToolWin,
  DB, DBTables, ImgList, ZTDlg, StdCtrls, VDlgs, DBActns, Menus, StdActns;

type
  TGetZTourDialog = function: TZTourDialog;

  TZTourBrowseForm = class(TForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    DetailPanel: TPanel;
    SeparatorTBtn1: TToolButton;
    AppendTbtn: TToolButton;
    EditTbtn: TToolButton;
    SeparatorTBtn2: TToolButton;
    DeleteTbtn: TToolButton;
    DataSrc: TDataSource;
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    MasterPanel: TPanel;
    DBGrid: TDBGrid;
    MasterSplitter: TSplitter;
    SeparatorTBtn4: TToolButton;
    ViewMemosTBtn: TToolButton;
    SeparatorTBtn3: TToolButton;
    ActionList: TActionList;
    ViewMemosAction: TAction;
    EditMemosAction: TAction;
    SearchTBtn: TToolButton;
    RecordSearchAction: TAction;
    DataSetFirstAction: TDataSetFirst;
    DataSetPriorAction: TDataSetPrior;
    DataSetNextAction: TDataSetNext;
    DataSetLastAction: TDataSetLast;
    RecordEditAction: TAction;
    RecordAppendAction: TAction;
    RecordDeleteAction: TAction;
    PopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    EditCopyAction: TEditCopy;
    EditCutAction: TEditCut;
    EditPasteAction: TEditPaste;
    EditSelectAllAction: TEditSelectAll;
    EditUndoAction: TEditUndo;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    CopyTBtn: TToolButton;
    RecordCopyAction: TAction;
    DatasetPrintBtn: TToolButton;
    DatasetPrintAction: TAction;
    SaveDialog: TSaveDialog;
    DataSetFirstBtn: TToolButton;
    DataSetPriorBtn: TToolButton;
    DataSetNextBtn: TToolButton;
    DataSetLastBtn: TToolButton;
    DataSetRefreshBtn: TToolButton;
    DataSetRefreshAction: TAction;
    MasterDBRichEdit: TDBRichEdit;
    ListingAddAction: TAction;
    ListingAddBtn: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure RecordEditActionExecute(Sender: TObject);
    procedure RecordSearchActionExecute(Sender: TObject);
    procedure RecordDeleteActionExecute(Sender: TObject);
    procedure ListingAddActionExecute(Sender: TObject);
    procedure ViewMemosActionExecute(Sender: TObject);
    procedure EditMemosActionExecute(Sender: TObject);
    procedure DatasetPrintActionExecute(Sender: TObject);
    procedure DataSetRefreshActionExecute(Sender: TObject);
    procedure DataSrcDataChange(Sender: TObject; Field: TField);
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    FEditForm: TZTourDialog;
    FDetailBrowseKey: TIntegerField;
    FDetailEditKey: TIntegerField;
    FDetailSearchHint: String;
    FSearchText: String;
    function GetDetailEditSet: TTable;
    function GetDetailFieldName: String;
    function IsListingEnabled(Lst: TStrings): Boolean;
  protected
    procedure AddToListing(Lst: TStrings); virtual;
    procedure ApplyCashedUpdates(Apply: Boolean); virtual;
    function CanAccessView: Boolean; virtual;
    function CanAccessEdit: Boolean; virtual;
    function CanAccessPrnt: Boolean; virtual;
    function CanAccessAdmn: Boolean; virtual;
    function CanCopyRecord: Boolean; virtual;
    function ChangeOrderColumn(Column: TColumn; IdxFld: TField): Boolean; virtual;
    function DataSetCanDelete(DSet: TDataSet): Boolean; virtual;
    procedure DataSetDeleteRecord(var UpdSet: TDataSet); virtual;
    function DeleteDataSetRecord(
      BrSet, EdSet: TDataSet; const Key, Text: String): Boolean;
    procedure ExecuteEditAction;
    function GetAssignedEditForm: Boolean; virtual;
    function GetDataSetHasMemo: Boolean; virtual;
    function GetOrderByColumns(Index: Integer): String; virtual;
    function GetSearchHint: String; virtual;
    procedure InitDataSet(DSet: TDataSet; const KeyName: String;
      KeyField: TIntegerField);
    procedure InitDataSets; virtual;
    procedure PrepareDBGridTitles(Grid: TDBGrid);
    procedure PrintDataSet(DSet: TDataSet); virtual;
    procedure SearchInGrid(Grid: TDBGrid);
    function ShowEditor(EditState: Integer): Boolean; virtual;
    procedure UpdateDataSets; virtual;
    procedure UpdateToolButtons; virtual;
    procedure ToggleMemo(MemoCtrl: TCustomMemo);
    procedure ToggleMemos; virtual;
    procedure ViewMemos; virtual;
    property AssignedEditForm: Boolean read GetAssignedEditForm;
    property EditForm: TZTourDialog read FEditForm write FEditForm;
    property DataSetHasMemo: Boolean read GetDataSetHasMemo;
    property DetailBrowseKey: TIntegerField read FDetailBrowseKey write FDetailBrowseKey;
    property DetailEditKey: TIntegerField read FDetailEditKey write FDetailEditKey;
    property DetailEditSet: TTable read GetDetailEditSet;
    property DetailFieldName: String read GetDetailFieldName;
    property DetailSearchHint: String read FDetailSearchHint write FDetailSearchHint;
    property OrderByColumns[Index: Integer]: String read GetOrderByColumns;
    property SearchText: String read FSearchText write FSearchText;
  public
    function ShowBrowseModal: Boolean;
    function ShowSelect: Boolean;  
    procedure UpdateToolActions;
    procedure WMFreeAllForms(var Msg: TMyStatusMsg); message wm_FreeAllForms;
  end;

var
  ZTourBrowseForm: TZTourBrowseForm;

implementation

uses Math, OptSet, TourConsts, DataMod, {TxtPrevw,} Finder, {HlpConsts,}
  {$IFDEF DictionExe}
//  StatForm,
  {$ENDIF}
  TourCmnlIf, ZFndDlg, TourDbUn, TxtPrvwDlg;

{$R *.DFM}

function TZTourBrowseForm.GetDetailEditSet: TTable;
begin
  Result := EditForm.DataSrc.DataSet as TTable;
end;

function TZTourBrowseForm.GetDetailFieldName: String;
begin
  Result := DetailEditKey.FieldName;
end;

function TZTourBrowseForm.IsListingEnabled(Lst: TStrings): Boolean;
begin
  Result := Lst.Count < 160;
end;

procedure TZTourBrowseForm.AddToListing(Lst: TStrings);
var
  S: String;
  I: Integer;
begin
  S := '';
  with DBGrid.Columns do
  begin
    Lst.Add(Items[0].Field.DisplayText);
    for I := 1 to Count - 1 do S := S + #9 + Items[I].Field.DisplayText;
  end;
  if S <> '' then Lst.Add(S);
  Lst.Add('');
end;

procedure TZTourBrowseForm.ApplyCashedUpdates(Apply: Boolean);
begin
  if DetailEditSet.CachedUpdates then
    DM.DatabaseApplyUpdates([DetailEditSet], Apply)
  else DetailEditSet.Refresh;
end;

function TZTourBrowseForm.CanAccessView: Boolean;
begin
  Result := AssignedEditForm; // not DBGrid.ReadOnly;
end;

function TZTourBrowseForm.CanAccessEdit: Boolean;
begin
  Result := CanAccessView and GetUspLevelPerm(DM.CurManagerPlev, uspLevelEdit);
end;

function TZTourBrowseForm.CanAccessPrnt: Boolean;
begin
  Result := CanAccessAdmn;
end;

function TZTourBrowseForm.CanAccessAdmn: Boolean;
begin
  Result := GetUspCanAdmin(DM.CurManagerPlev);
//  DM.CurManagerPerm in [8, 10];
end;

function TZTourBrowseForm.CanCopyRecord: Boolean;
begin
  Result := False;
end;

function TZTourBrowseForm.ChangeOrderColumn(Column: TColumn; IdxFld: TField): Boolean;
var
  S: String;
  Id: Integer;
begin
  Result := True;
  with Column.Field do
  begin
    S := FieldName;
    if FieldKind = fkCalculated then
      S := Copy(S, Pos('Calc', S) + 4, Length(S))
    else if FieldKind = fkLookup then
      begin
        Result := False;
        Exit;
      end;
    Id := IdxFld.AsInteger;
    try
      if DataSet is TTable then
        with DataSet as TTable do IndexName := TableName + 'By' + S
      else if DataSet is TQuery then
        DM.SetQueryOrderBy(
          DataSrc.DataSet as TQuery, OrderByColumns[Column.Index], true);
      DataSrc.DataSet.Open;
      DataSrc.DataSet.Locate(IdxFld.FieldName, Id, []);
    except
      Result := False;
    end;
  end;
end;

function TZTourBrowseForm.DataSetCanDelete(DSet: TDataSet): Boolean;
begin
  Result := False;
end;

procedure TZTourBrowseForm.DataSetDeleteRecord(var UpdSet: TDataSet);
var Tbl: TTable;
begin
  if UpdSet is TTable then UpdSet.Delete
  else if UpdSet is TQuery then
  begin
    Tbl := DetailEditSet;
    if Tbl.Locate(DetailFieldName, DetailBrowseKey.Value, []) then Tbl.Delete;
    UpdSet := Tbl;
  end;
end;

function TZTourBrowseForm.DeleteDataSetRecord(
  BrSet, EdSet: TDataSet; const Key, Text: String): Boolean;
begin
  Result := WarningFmtDlgYC(SZTBrwsConfirmDelete, [Text])
    and DM.DataSetDeleteRecord(BrSet, EdSet, Key, Text);
  {if not Result then Exit;
  with EdSet do
  begin
    if not Active then Open;
    Result := Locate(Key, BrSet.FieldByName(Key).Value, []);
    if Result then Delete
    else begin
      ErrorFmtDlg(SZTBrwsErrorRocordNotFound, [Text]);
      Exit;
    end;
  end;
  if EdSet is TTable then (EdSet as TTable).Refresh;
  if BrSet is TTable then (BrSet as TTable).Refresh
  else if BrSet is TQuery then UpdateQuery(BrSet as TQuery);}
end;

procedure TZTourBrowseForm.ExecuteEditAction;
begin
  if RecordEditAction.Enabled then RecordEditAction.Execute
    else if RecordAppendAction.Enabled then RecordAppendAction.Execute;
end;

function TZTourBrowseForm.GetAssignedEditForm: Boolean;
begin
  Result := Assigned(EditForm);
end;

function TZTourBrowseForm.GetDataSetHasMemo: Boolean;
begin
  Result := Assigned(MasterDBRichEdit.DataSource);
end;

function TZTourBrowseForm.GetOrderByColumns(Index: Integer): String;
begin
  if Index <= 0 then Result := '1' else Result := IntToStr(Index);
end;

function TZTourBrowseForm.GetSearchHint: String;
begin
  Result := FDetailSearchHint;
end;

procedure TZTourBrowseForm.InitDataSet(DSet: TDataSet; const KeyName: String;
  KeyField: TIntegerField);
begin
  with DSet do
  begin
    if not Active then Open;
    Locate(KeyName, KeyField.Value, []);
  end;
end;

procedure TZTourBrowseForm.InitDataSets;
begin
  //InitDataSet(DBGrid.DataSource.DataSet, DetailFieldName, DetailEditKey);
end;

procedure TZTourBrowseForm.PrepareDBGridTitles(Grid: TDBGrid);
var I: Integer;
begin
  with Grid.Columns do
    for I := 0 to Count - 1 do with Items[I].Title do Caption := ' ' + Caption;
end;

procedure TZTourBrowseForm.PrintDataSet(DSet: TDataSet);
var
  Lst: TStrings;
  S: String;
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
  Lst := TStringList.Create;
  try
    with DSet do
      try
        DisableControls;
        First;
        while not Eof do
        begin
          S := '';
          for I := 0 to Fields.Count - 1 do
            if Fields[I].Visible then S := S + Fields[I].DisplayText + #9;
          Lst.Add(S);
          Next;
        end;
      finally
        EnableControls;
        Screen.Cursor := crDefault;
      end;
    if SaveDialog.Execute then Lst.SaveToFile(SaveDialog.FileName);
  finally
    Lst.Free;
  end; 
end;

procedure TZTourBrowseForm.SearchInGrid(Grid: TDBGrid);
var H: String;
begin
  H := GetSearchHint;
  if H = '' then
    with Grid.DataSource do
      if DataSet is TTable then H := (DataSet as TTable).TableName;
  ShowFindInGrid(Grid, H);
end;

function TZTourBrowseForm.ShowEditor(EditState: Integer): Boolean;
var ResKey: Integer;
begin
  if Assigned(DetailBrowseKey) then
    ResKey := DetailBrowseKey.AsInteger else ResKey := DetailEditKey.AsInteger;
  with DetailEditSet do if not Active then Open;
  if Assigned(DetailBrowseKey) and (DetailBrowseKey.Value <> DetailEditKey.Value)
  then DetailEditSet.Locate(DetailFieldName, DetailBrowseKey.Value, []);
  with DataSrc.DataSet do
    try
      Result := Assigned(FEditForm) and FEditForm.ShowRecord(EditState);
      if (EditState = remStateAppend) and Result then
        ResKey := DetailEditKey.AsInteger;
      ApplyCashedUpdates(Result);
    finally
      if DataSrc.DataSet is TTable then Refresh;
    end;
  if DetailEditKey <> DetailBrowseKey then DM.DataSetRefresh(DataSrc.DataSet);
  with DataSrc.DataSet do
    if RecordCount > 0 then Locate(DetailFieldName, ResKey, []);
end;

procedure TZTourBrowseForm.UpdateDataSets;
var Id: Integer;
begin
  if DataSrc.DataSet.Active then Id := DetailBrowseKey.AsInteger else Id := 0;
  UpdateQuery(DataSrc.DataSet as TQuery);
  if Id <> 0 then DataSrc.DataSet.Locate(DetailBrowseKey.FieldName, Id, []);
end;

procedure TZTourBrowseForm.UpdateToolButtons;
const
  nImg: array[Boolean] of Integer = (53, 1);
  pTtl: array[Boolean] of Pointer = (@SZTBrwsTitleView, @SZTBrwsTitleEdit);
  pHnt: array[Boolean] of Pointer = (@SZTBrwsHintView, @SZTBrwsHintEdit);
var Assgnd, EdAccs, NtEmpty, VwAccs: Boolean;
begin
  if Visible then
  begin
    Assgnd := DataSrc.DataSet.Active;    // data set assigned
    VwAccs := CanAccessView;             // data set can by viewed
    EdAccs := VwAccs and CanAccessEdit;  // data set can by edited
    NtEmpty := Assgnd and (DataSrc.DataSet.RecordCount > 0); // if isn't empty
    DataSetRefreshAction.Enabled := Assgnd;
    RecordSearchAction.Enabled := NtEmpty;
    RecordDeleteAction.Enabled := EdAccs and NtEmpty;
    RecordAppendAction.Enabled := EdAccs and AssignedEditForm;
    with RecordEditAction do
    begin
      Enabled := NtEmpty and VwAccs and AssignedEditForm;
      ImageIndex := nImg[EdAccs];
      Caption := LoadResString(pTtl[EdAccs]);
      Hint := LoadResString(pHnt[EdAccs]);
    end;
    RecordCopyAction.Enabled :=
      EdAccs and CanCopyRecord and RecordEditAction.Enabled;
    ListingAddAction.Enabled := Assgnd and CanAccessPrnt;
  end;
end;

procedure TZTourBrowseForm.ToggleMemo(MemoCtrl: TCustomMemo);
begin
  {with MemoCtrl as TDBRichEdit do
  begin
    ReadOnly := not EditMemosAction.Checked;
    Color := clEditControlColors[ReadOnly];
  end;}
  ToggleControlEnabled(MemoCtrl as TDBRichEdit, not EditMemosAction.Checked);
end;

procedure TZTourBrowseForm.ToggleMemos;
begin
  ToggleMemo(MasterDBRichEdit);
end;

procedure TZTourBrowseForm.ViewMemos;
begin
  MasterDBRichEdit.Visible := ViewMemosAction.Checked;
  MasterSplitter.Top := MasterDBRichEdit.Top;
end;

function TZTourBrowseForm.ShowBrowseModal: Boolean;
begin
  if Visible then Hide;
  Result := ShowModal = mrOk;
end;

function TZTourBrowseForm.ShowSelect: Boolean;
begin
  if Visible then Hide;
  ModalPanel.Show;
  Result := ShowModal = mrOk;
  ModalPanel.Hide;
end;

procedure TZTourBrowseForm.UpdateToolActions;
begin
  UpdateToolButtons;
end;

procedure TZTourBrowseForm.WMFreeAllForms(var Msg: TMyStatusMsg);
begin
  Close;
end;

procedure TZTourBrowseForm.FormCreate(Sender: TObject);
var
  Scale: Extended;
  H: Integer;
begin
  SaveDialog.InitialDir := OptionSet.OutboxFolder;
  if gPixelsPerInch <> gNormalPixelsPerInch then
  begin
    Scale := gPixelsPerInch / gNormalPixelsPerInch;
    Height := Round(longint(Height) * Scale);
    Width := Round(longint(Width) * Scale);
  end;
  Top := yClientWindow;
  Left := xClientWindow + 80;
  with Constraints do
  begin
    MinWidth := Width;
    MinHeight := Height;
    MaxHeight := hClientWindow;
    MaxWidth := Width + 10;
  end;
  ScaleDBGridColumns(DBGrid);
  H := DBGrid.Canvas.TextHeight('Wg') + 5;
  while DBGrid.Height mod H > 1 do Height := Height + 1;
  Height := Height + 5;
  with DBGrid do
    if Assigned(DataSource) then DataSrc.DataSet := DataSource.DataSet;
  with DataSrc, DataSet do
    if Assigned(DataSet) and not Active then Open;
  PrepareDBGridTitles(DBGrid);
  ViewMemosTBtn.Enabled := Assigned(MasterDBRichEdit.DataSource);
  ActiveControl := DBGrid;
  SearchText := '';
end;

procedure TZTourBrowseForm.FormShow(Sender: TObject);
var YNom: Integer;
begin
  with Constraints do
  begin
    Top := CalcBrowseTop(MinHeight);
    Left := CalcBrowseLeft(MinWidth);
  end;
  YNom := yClientWindow + hClientWindow - Height;
  if Top > YNom then Top := Max(yClientWindow, YNom);
  CalcNextBrowseOrigin(ClientOrigin);
end;

procedure TZTourBrowseForm.FormActivate(Sender: TObject);
begin
  InitDataSets;
  DBGrid.Color := OptionSet.Colors[optViewGrids];
  UpdateToolButtons;
end;

procedure TZTourBrowseForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  //UpdateToolButtons;
end;

procedure TZTourBrowseForm.RecordEditActionExecute(Sender: TObject);
begin
  ShowEditor((Sender as TComponent).Tag);
end;

procedure TZTourBrowseForm.RecordSearchActionExecute(Sender: TObject);
begin
  SearchInGrid(DBGrid);
end;

procedure TZTourBrowseForm.RecordDeleteActionExecute(Sender: TObject);
var UpdSet: TDataSet;
begin
  UpdSet := DataSrc.DataSet;
  if not DataSetCanDelete(UpdSet) then ErrorDlg(SDataModDeleteNotAllowed)
  else if WarningFmtDlgYC(SZTBrwsConfirmDelete, [SZTBrwsRecord]) then
  begin
    DataSetDeleteRecord(UpdSet);
    if (UpdSet as TDBDataSet).CachedUpdates then
      DM.DatabaseApplyUpdates([UpdSet as TDBDataSet], True);
    if DataSrc.DataSet is TQuery then
      UpdateQuery(DataSrc.DataSet as TQuery);
  end;
end;

procedure TZTourBrowseForm.ListingAddActionExecute(Sender: TObject);
begin
  try
    TextPreviewDlg.Show;
  except
    TextPreviewDlg := TTextPreviewDlg.Create(Application);
    TextPreviewDlg.TextCaption := Caption;
    TextPreviewDlg.Show;
  end;
  if IsListingEnabled(TextPreviewDlg.RichEdit.Lines) then
    AddToListing(TextPreviewDlg.RichEdit.Lines)
  else ErrorDlg(SZTBrwsErrorListingIsFull);
end;

procedure TZTourBrowseForm.ViewMemosActionExecute(Sender: TObject);
begin
  with ViewMemosAction do
  begin
    Checked := not Checked;
    ViewMemosTBtn.Down := Checked;
  end;
  ViewMemos;
end;

procedure TZTourBrowseForm.EditMemosActionExecute(Sender: TObject);
begin
  with EditMemosAction do
  begin
    Checked := not Checked;
  end;
  ToggleMemos;
end;

procedure TZTourBrowseForm.DatasetPrintActionExecute(Sender: TObject);
begin
  PrintDataSet(DataSrc.DataSet);
end;

procedure TZTourBrowseForm.DataSetRefreshActionExecute(Sender: TObject);
begin
  if DataSrc.DataSet is TTable then DataSrc.DataSet.Refresh
  else if DataSrc.DataSet is TQuery then UpdateDataSets;
end;

procedure TZTourBrowseForm.DataSrcDataChange(Sender: TObject; Field: TField);
begin
  UpdateToolButtons;
end;

procedure TZTourBrowseForm.DBGridTitleClick(Column: TColumn);
begin
  ChangeOrderColumn(Column, DetailBrowseKey);
end;

procedure TZTourBrowseForm.DBGridDblClick(Sender: TObject);
var Col: Integer;
begin
  if DBGridDblClickIsValid(Sender as TDBGrid, Col) then ExecuteEditAction;
end;

procedure TZTourBrowseForm.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ADD) and (not OptionSet.UseCtrlKeyWithAdd
    or OptionSet.UseCtrlKeyWithAdd and (ssCtrl in Shift))
  then AppendTbtn.Click;
end;

procedure TZTourBrowseForm.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    ExecuteEditAction;
    Key := #0;
  end;
end;

procedure TZTourBrowseForm.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  DSet: TDataSet;
  FldN: String;
begin
  with Sender as TDBGrid do
    try
      DSet := DataSource.DataSet;
      FldN := AnsiUpperCase(Column.FieldName);
      if Pos('CALC', FldN) = 1 then
        FldN := Copy(FldN, 5, Length(FldN));
      if (DSet is TTable) and (Pos(FldN, (DSet as TTable).IndexName) > 0)
        or (DSet is TQuery) and (Pos(FldN, DM.GetQueryOrderBy(DSet as TQuery)) > 0)
      then DM.BrowseImgList.Draw(Canvas, Rect.Left + 2, 4, 7);
    finally
{      DBGridDrawNotActive(
        Sender as TDBGrid, ActiveControl = Sender, Rect, DataCol, Column, State);
}
      DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TZTourBrowseForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {with DBGrid.DataSource.DataSet do
    if State in dsEditModes then
      case VConfirmDlg(SZTBrwsConfirmUpdate) of
        mrYes: Post;
        mrNo: Cancel;
        mrCancel: CanClose := False;
      end;}
end;

procedure TZTourBrowseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TZTourBrowseForm.FormDestroy(Sender: TObject);
begin
  if Assigned(EditForm) then
  begin
    EditForm.Free;
    EditForm := nil;
  end;
end;

end.
