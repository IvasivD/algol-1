unit ZDataBr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, DBActns, ActnList, Db, Grids, DBGrids, StdCtrls,
  DBCtrls, ExtCtrls;

type
  TEditDlgExecuteFunc = function(BrowseSet: TDataSet; const KeyName: string;
    AddNew: Boolean; Id: Integer): Boolean;

type
  TZDataBrowseForm = class(TForm)
    ToolBar: TToolBar;
    DataSetFirstBtn: TToolButton;
    ActionList: TActionList;
    DataSource: TDataSource;
    DataSetFirstAction: TDataSetFirst;
    DataSetPriorAction: TDataSetPrior;
    DataSetNextAction: TDataSetNext;
    DataSetLastAction: TDataSetLast;
    DataSetRefreshAction: TAction;
    DataSetPriorBtn: TToolButton;
    DataSetNextBtn: TToolButton;
    DataSetLastBtn: TToolButton;
    DataSetRefreshBtn: TToolButton;
    ToolButton6: TToolButton;
    RecordAddBtn: TToolButton;
    RecordEditBtn: TToolButton;
    RecordFindBtn: TToolButton;
    ToolButton10: TToolButton;
    RecordDeleteBtn: TToolButton;
    RecordFindAction: TAction;
    RecordAddAction: TAction;
    RecordEditAction: TAction;
    RecordDeleteAction: TAction;
    ViewMemoAction: TAction;
    ToolButton12: TToolButton;
    ViewMemoBtn: TToolButton;
    DBGrid: TDBGrid;
    DBMemo: TDBMemo;
    Splitter: TSplitter;
    procedure FormActivate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataSetRefreshActionExecute(Sender: TObject);
    procedure RecordFindActionExecute(Sender: TObject);
    procedure RecordEditActionExecute(Sender: TObject);
    procedure RecordDeleteActionExecute(Sender: TObject);
    procedure ViewMemoActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridDblClick(Sender: TObject);
  private
    FDataKeyField: TField;
    FEditDataSet: TDataSet;
    FEditDlgExecute: TEditDlgExecuteFunc;
    function GetBrowseDataSet: TDataSet;
  protected
    function DoDeleteRecord: Boolean; virtual;
    function DoEditRecord(AddNew: Boolean): Boolean; virtual;
    function DoFindRecord: Boolean; virtual;
    procedure UpdateBrowseDataSet; virtual;
    property BrowseDataSet: TDataSet read GetBrowseDataSet;
    property DataKeyField: TField read FDataKeyField write FDataKeyField;
    property EditDataSet: TDataSet read FEditDataSet write FEditDataSet;
    property EditDlgExecute: TEditDlgExecuteFunc read FEditDlgExecute write FEditDlgExecute;
  public
    { Public declarations }
  end;

var
  ZDataBrowseForm: TZDataBrowseForm;

implementation

uses DBTables, DataMod, TourDbUn, TourCmnlIf, TourConsts, VDlgs, ZFndDlg;

{$R *.DFM}

{ TZDataBrowseForm }

function TZDataBrowseForm.GetBrowseDataSet: TDataSet;
begin
  Result := DataSource.DataSet;
end;

function TZDataBrowseForm.DoDeleteRecord: Boolean;
var Mrk: TBookmark;
begin
  with EditDataSet do
  begin
    if not Active then Open;
    Result := Locate(FDataKeyField.FieldName, FDataKeyField.Value, []);
    if Result then
    begin
      Delete;
      Refresh;
    end
    else ErrorFmtDlg(SZTBrwsErrorRecordNotFound, [FDataKeyField.AsString]);
  end;
  if Result then
    with BrowseDataSet do
    begin
      Mrk := GetBookmark;
      try
        UpdateQuery(BrowseDataSet as TQuery);
        if RecordCount > 1 then
        try
          GotoBookmark(Mrk);
        except
          Last;
        end;
      finally
        FreeBookmark(Mrk);
      end;
    end;
end;

function TZDataBrowseForm.DoEditRecord(AddNew: Boolean): Boolean;
begin
  if Assigned(EditDlgExecute) then
    Result := EditDlgExecute(
      BrowseDataSet, FDataKeyField.FieldName, AddNew, FDataKeyField.AsInteger)
  else Result := False;
end;

function TZDataBrowseForm.DoFindRecord: Boolean;
begin
  Result := ShowFindInGrid(DBGrid);
end;

procedure TZDataBrowseForm.UpdateBrowseDataSet;
begin
  if BrowseDataSet is TQuery then UpdateQuery(BrowseDataSet as TQuery)
  else with BrowseDataSet do if Active then Refresh else Open;
end;

procedure TZDataBrowseForm.FormActivate(Sender: TObject);
begin
  UpdateBrowseDataSet;
  ViewMemoAction.Enabled := DBMemo.DataField <> '';
end;

procedure TZDataBrowseForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
var Ass, Act, Emp: Boolean;
begin
  Ass := Assigned(DataSource.DataSet);
  Act := Ass and BrowseDataSet.Active;
  Emp := not Act or (BrowseDataSet.RecordCount = 0);
  DataSetRefreshAction.Enabled := Ass;
  RecordFindAction.Enabled := Act;
  RecordAddAction.Enabled := Act;
  RecordEditAction.Enabled := not Emp;
  RecordDeleteAction.Enabled := not Emp;
end;

procedure TZDataBrowseForm.DataSetRefreshActionExecute(Sender: TObject);
begin
  UpdateBrowseDataSet;
end;

procedure TZDataBrowseForm.RecordFindActionExecute(Sender: TObject);
begin
  DoFindRecord;
end;

procedure TZDataBrowseForm.RecordEditActionExecute(Sender: TObject);
begin
  DoEditRecord((Sender as TComponent).Tag <> 0);
end;

procedure TZDataBrowseForm.RecordDeleteActionExecute(Sender: TObject);
begin
  if WarningDlgYC(SZTBrwsConfirmDelete) then DoDeleteRecord;
end;

procedure TZDataBrowseForm.ViewMemoActionExecute(Sender: TObject);
begin
  with ViewMemoAction do
  begin
    Checked := not Checked;
    DBMemo.Visible := Checked;
  end;
  Splitter.Top := DBMemo.Top;
end;

procedure TZDataBrowseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TZDataBrowseForm.DBGridDblClick(Sender: TObject);
var Col: Integer;
begin
  if DBGridDblClickIsValid(Sender as TDBGrid, Col) then
  begin
    if RecordEditAction.Enabled then RecordEditAction.Execute
    else if RecordAddAction.Enabled then RecordAddAction.Execute;
  end;
end;

end.
