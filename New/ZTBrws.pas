unit ZTBrws;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, Grids, DBGrids, ExtCtrls, Buttons, ActnList, ComCtrls, ToolWin,
  DB, DBTables, ImgList, ZTDlg, StdCtrls;

type
  TGetZTourDialog = function: TZTourDialog;

  TZTourBrowseForm = class(TForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    DBNavigator: TDBNavigator;
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
    MasterDBRichEdit: TDBRichEdit;
    SeparatorTBtn4: TToolButton;
    ViewMemosTBtn: TToolButton;
    SeparatorTBtn3: TToolButton;
    ActionList: TActionList;
    ViewMemosAction: TAction;
    EditMemosAction: TAction;
    DatasetAppendAction: TAction;
    DatasetEditAction: TAction;
    DatasetDeleteAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DatasetEditActionExecute(Sender: TObject);
    procedure DatasetDeleteActionExecute(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DataSrcDataChange(Sender: TObject; Field: TField);
    procedure DBGridKeyPress(Sender: TObject; var Key: Char);
    procedure EditMemosTBtnClick(Sender: TObject);
    procedure ViewMemosActionExecute(Sender: TObject);
    procedure EditMemosActionExecute(Sender: TObject);
  private
    FEditForm: TZTourDialog;
    FDetailBrowseKey: TIntegerField;
    FDetailEditKey: TIntegerField;
    function GetDetailEditSet: TTable;
    function GetDetailFieldName: String;
    procedure RedrawColumnTitles(Column: TColumn);
  protected
    function GetAssignedEditForm: Boolean; virtual;
    function GetDataSetHasMemo: Boolean; virtual;
    procedure ApplyCashedUpdates(Apply: Boolean); virtual;
    function ChangeOrderColumn(Column: TColumn): Boolean; virtual;
    function DataSetCanDelete(DSet: TDataSet): Boolean; virtual;
    procedure InitDataSet(DSet: TDataSet; const KeyName: String;
      KeyField: TIntegerField);
    procedure InitDataSets; virtual;
    procedure PrepareDBGridTitles(Grid: TDBGrid);
    procedure ShowEditor(AsNew: Boolean); virtual;
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
  public
    function ShowBrowseModal: Boolean;
    function ShowSelect: Boolean;
  end;

var
  ZTourBrowseForm: TZTourBrowseForm;

implementation

uses Math, VDlgs, OptSet, TourConsts, DataMod, TxtPrevw, TourCmnlIf;

{$R *.DFM}

function TZTourBrowseForm.GetAssignedEditForm: Boolean; 
begin
  Result := Assigned(EditForm);
end;

function TZTourBrowseForm.GetDataSetHasMemo: Boolean;
begin
  Result := Assigned(MasterDBRichEdit.DataSource);
end;

function TZTourBrowseForm.GetDetailEditSet: TTable;
begin
  Result := EditForm.DataSrc.DataSet as TTable;
end;

function TZTourBrowseForm.GetDetailFieldName: String;
begin
  Result := DetailEditKey.FieldName;
end;

procedure TZTourBrowseForm.RedrawColumnTitles(Column: TColumn);
const SortOrderMark: Char = #149;
var
  I: integer;
  Grid: TDBGrid;
  S, T: String;
begin
  Grid := TDBGrid(Column.Grid);
  {T := Column.Title.Caption;
  if T[1] = SortOrderMark then System.Delete(T, 1, 1);
  with Grid.Columns do
    for I := 0 to Count - 1 do
      with Items[I].Title do
      begin
        S := Caption;
        if (S[1] = SortOrderMark) or (S[1] = ' ') then System.Delete(S, 1, 1);
        if T = S then Caption := SortOrderMark + S else Caption := ' ' + S;
      end;}
  T := Column.Title.Caption;
  with Grid.Columns do
    for I := 0 to Count - 1 do
      with Items[I].Title do
      begin
        S := Caption;
        if T = S then S[1] := SortOrderMark else S[1] := ' ';
        Caption := S;
      end;
end;

procedure TZTourBrowseForm.ApplyCashedUpdates(Apply: Boolean);
begin
  if DetailEditSet.CachedUpdates then
    DM.DatabaseApplyUpdates([DetailEditSet], Apply) else DetailEditSet.Refresh;
end;

function TZTourBrowseForm.ChangeOrderColumn(Column: TColumn): Boolean; 
var S: String;
begin
  Result := True;
  with DataSrc.DataSet as TTable do
  begin
    S := Column.FieldName;
    with Column.Field do
      if FieldKind = fkCalculated then
        S := Copy(S, Pos('Calc', S) + 4, Length(S))
      else if FieldKind = fkLookup then
        begin
          ErrorDlg(SZTBrwsQueryError);
          Result := False;
          Exit;
        end;
    try
      IndexName := TableName + 'By' + S;
    except
      ErrorDlg(SZTBrwsQueryError);
      Result := False;
    end;
  end;
end;

function TZTourBrowseForm.DataSetCanDelete(DSet: TDataSet): Boolean;
begin
  Result := False;
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
    for I := 0 to Count - 1 do
      with Items[I].Title do Caption := ' ' + Caption;
end;

procedure TZTourBrowseForm.ShowEditor(AsNew: Boolean);
var
  EdRes: Boolean;
  ResKey: Longint;
begin
  ResKey := DetailEditKey.AsInteger;
  with DataSrc.DataSet do
  begin
    try
      EdRes := Assigned(FEditForm) and FEditForm.ShowRecord(AsNew);
      if AsNew and EdRes then ResKey := DetailEditKey.AsInteger;
      ApplyCashedUpdates(EdRes);
    finally
      Refresh;
      if RecordCount > 0 then Locate(DetailFieldName, ResKey, []);
    end;
  end;
end;

procedure TZTourBrowseForm.UpdateToolButtons;
var En: Boolean;
begin
  if Active then
    with DBGrid do
    begin
      En := Assigned(DataSrc.DataSet) and DataSrc.DataSet.Active;
      DatasetDeleteAction.Enabled := En and (DataSrc.DataSet.RecordCount > 0);
      DatasetAppendAction.Enabled := En and not ReadOnly and AssignedEditForm;
      DatasetEditAction.Enabled :=
        DatasetDeleteAction.Enabled and DatasetAppendAction.Enabled;
      {EditMemosAction.Enabled := ViewMemosAction.Enabled
        and DataSetHasMemo and DatasetDeleteAction.Enabled;}
    end;
end;

procedure TZTourBrowseForm.ToggleMemo(MemoCtrl: TCustomMemo);
begin
  with MemoCtrl as TDBRichEdit do
  begin
    ReadOnly := not EditMemosAction.Checked;
    Color := clEditControlColors[ReadOnly];
  end;
end;

procedure TZTourBrowseForm.ToggleMemos;
begin
  ToggleMemo(MasterDBRichEdit);
end;

procedure TZTourBrowseForm.ViewMemos;
begin
  MasterDBRichEdit.Visible := ViewMemosAction.Checked;
  MasterSplitter.Top := MasterDBRichEdit.Top;
  MasterSplitter.Visible := MasterDBRichEdit.Visible;
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

procedure TZTourBrowseForm.FormCreate(Sender: TObject);
var Scale: Extended;
begin
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
  end;
  ScaleDBGridColumns(DBGrid);
  with DBGrid do
    if Assigned(DataSource) then DataSrc.DataSet := DataSource.DataSet;
  {with DataSrc do
    if not DataSet.Active then
    begin
      if DataSet is TTable then DataSet.Open
      else if DataSet is TQuery then DM.UpdateQuery(DataSet as TQuery);
    end;}
  PrepareDBGridTitles(DBGrid);
  ViewMemosAction.Enabled := Assigned(MasterDBRichEdit.DataSource);
end;

procedure TZTourBrowseForm.FormShow(Sender: TObject);
var yNom: integer;
begin
  with Constraints do
  begin
    Top := CalcBrowseTop(MinHeight);
    Left := CalcBrowseLeft(MinWidth);
  end;
  yNom := yClientWindow + hClientWindow - Height;
  if Top > yNom then Top := Max(yClientWindow, yNom);
  CalcNextBrowseOrigin(ClientOrigin);
end;

procedure TZTourBrowseForm.FormActivate(Sender: TObject);
begin
  InitDataSets;
  DBGrid.Color := OptionSet.Colors[optViewGrids];
  UpdateToolButtons;
end;

procedure TZTourBrowseForm.DatasetEditActionExecute(Sender: TObject);
begin
  ShowEditor((Sender as TToolButton).Tag = 1);
end;

procedure TZTourBrowseForm.DatasetDeleteActionExecute(Sender: TObject);
begin
  with DataSrc do
    if not DataSetCanDelete(DataSet) then ErrorDlg(SDataModDeleteNotAllowed)
    else if WarningDlgYC(SZTBrwsConfirmDelete) then DataSet.Delete;
  with DM.Database do
    if InTransaction then ApplyUpdates([DataSrc.DataSet as TDBDataSet]);
end;

procedure TZTourBrowseForm.DataSrcDataChange(Sender: TObject; Field: TField);
begin
  UpdateToolButtons;
end;

procedure TZTourBrowseForm.DBGridTitleClick(Column: TColumn);
begin
  if ChangeOrderColumn(Column) then RedrawColumnTitles(Column);
end;

procedure TZTourBrowseForm.DBGridDblClick(Sender: TObject);
var Col: Integer;
begin
  if DBGridDblClickIsValid(Sender as TDBGrid, Col) then
  begin
    if DatasetEditAction.Enabled then DatasetEditAction.Execute
    else if DatasetAppendAction.Enabled then DatasetAppendAction.Execute;
  end;
end;

procedure TZTourBrowseForm.DBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Grid: TDBGrid;
  Fld: String;
begin
  Grid := Sender as TDBGrid;
  if Grid.DataSource.DataSet is TTable then
    try
      Fld := (Grid.DataSource.DataSet as TTable).IndexName;
      if Copy(Fld, 3, Length(Fld)) = Column.FieldName then
        DM.BrowseImgList.Draw(Grid.Canvas, Rect.Left + 1, 4, 7);
    finally
      (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
end;

procedure TZTourBrowseForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with DBGrid.DataSource.DataSet do
    if State in dsEditModes then
      case ConfirmDlg(SZTBrwsConfirmUpdate) of
        mrYes: Post;
        mrNo: Cancel;
        mrCancel: CanClose := False;
      end;
end;

procedure TZTourBrowseForm.DBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DBGridDblClick(Sender as TDBGrid);
    Key := #0;
  end;
end;

procedure TZTourBrowseForm.EditMemosTBtnClick(Sender: TObject);
begin
  {if DataSetHasMemo then
  begin
    TextPreviewForm := TTextPreviewForm.Create(Application);
    with TextPreviewForm do
    try
      DBRichEdit.DataSource := DataSrc;
      DBRichEdit.DataField := 'Memo';
      ShowModal;
    finally
      Free;
    end;
  end;}
end;

procedure TZTourBrowseForm.ViewMemosActionExecute(Sender: TObject);
begin
  with ViewMemosAction do
  begin
    Checked := not Checked;
    ViewMemosTBtn.Down := Checked;
    //EditMemosTBtn.Enabled := Checked;
  end;
  ViewMemos;
end;

procedure TZTourBrowseForm.EditMemosActionExecute(Sender: TObject);
begin
  with EditMemosAction do
  begin
    Checked := not Checked;
    //EditMemosTBtn.Down := Checked;
  end;
  ToggleMemos;
end;

end.
