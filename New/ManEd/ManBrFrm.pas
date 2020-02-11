unit ManBrFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBActns, ActnList, ImgList, ComCtrls, ToolWin, Grids, DBGrids, Db;

type
  TManagerBrowseForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList: TImageList;
    ActionList: TActionList;
    DataSetFirstAction: TDataSetFirst;
    DataSetPriorAction: TDataSetPrior;
    DataSetNextAction: TDataSetNext;
    DataSetLastAction: TDataSetLast;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ManagerDBGrid: TDBGrid;
    DataSetRefreshAction: TAction;
    DatasetAddAction: TAction;
    DatasetEditAction: TAction;
    DatasetFindAction: TAction;
    DatasetDeleteAction: TAction;
    PermissionEditAction: TAction;
    PermissionKeyAction: TAction;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    StatusBar: TStatusBar;
    DataSource: TDataSource;
    CloseAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StatusBarHint(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DatasetFindActionExecute(Sender: TObject);
    procedure DatasetEditActionExecute(Sender: TObject);
    procedure DataSetRefreshActionExecute(Sender: TObject);
    procedure PermissionKeyActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure ManagerDBGridDblClick(Sender: TObject);
    procedure ManagerDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
  private
    FActivation: Boolean;
    procedure CheckY;
    function EditManager(AddNew: Boolean): Boolean;
    function GetManagerName: String;
    procedure SetMainWindowSize;
    procedure UpdateManagerName;
    procedure UpdateToolButtons;
  end;

var
  ManagerBrowseForm: TManagerBrowseForm;

procedure ShowManagerBrowseForm;


implementation

uses DataMod, TourDbUn, ManPwFrm, ZFndDlg, MngrDlg, VDlgs,
  TourConsts;

{$R *.DFM}

procedure ShowManagerBrowseForm;
begin
  with TManagerBrowseForm.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

{ TManagerBrowseForm }

procedure TManagerBrowseForm.CheckY;
var ManId: Integer;
begin
  if DM.CurManager = 0 then
  begin
    ManId := DM.CurManager;
    if not ExecuteManagerDlg(Elem_UsersQry.DBGetParamConnect, Caption, ManId)
      or not DM.CheckCanWork(ManId)
    then Application.Terminate
    else begin
      DM.CurManager := ManId;
      UpdateManagerName;
      UpdateToolButtons;
    end;
  end;
end;

function TManagerBrowseForm.EditManager(AddNew: Boolean): Boolean;
begin
//  Result := ExecuteManagerEditDlg(AddNew);
end;

function TManagerBrowseForm.GetManagerName: String;
begin
  if DM.CurManager = 0 then Result := '' else
    Result := Format('%s: %s', [SOrderFrmDocManager, DM.CurManagerName]);
end;

procedure TManagerBrowseForm.SetMainWindowSize;
var R: TRect;
begin
  if not SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0) then
    R := Bounds(0, 0, Screen.Width div 2 + Width, Screen.Height div 2 + Height);
  Left := R.Right - Width;
  Top := R.Bottom - Height;
end;

procedure TManagerBrowseForm.UpdateManagerName;
begin
  StatusBar.Panels[0].Text := GetManagerName;
end;

procedure TManagerBrowseForm.UpdateToolButtons;
var NotEmpty, RAccs, ZAccs: Boolean;
begin
  with Elem_UsersQry do NotEmpty := DB.Active and (DBRecordCount > 0);
  ZAccs := True; //DM.CurManPerm in [8, 10];
  RAccs := ZAccs or NotEmpty and (Elem_UsersQry.GetValueId = DM.CurManager);
  DatasetAddAction.Enabled := False; // в Кадрах
    //ZAccs and (DataSetFirstAction.Enabled or DataSetLastAction.Enabled);
  DatasetEditAction.Enabled := False; // в Кадрах //NotEmpty and ZAccs;
  DatasetFindAction.Enabled := False; // немає що шукати //NotEmpty;
  DatasetDeleteAction.Enabled := False; // в Кадрах //NotEmpty and ZAccs;
  PermissionEditAction.Enabled := False; // в Кадрах //NotEmpty and ZAccs;
  PermissionKeyAction.Enabled := NotEmpty and RAccs;
end;

procedure TManagerBrowseForm.FormCreate(Sender: TObject);
begin
  SetMainWindowSize;
  Application.OnHint := StatusBarHint;
  CheckY;
  FActivation := True;
end;

procedure TManagerBrowseForm.FormActivate(Sender: TObject);
begin
  if FActivation then
  begin
    DM.UpdateManagerQry;
    FActivation := False;
  end;
end;

procedure TManagerBrowseForm.StatusBarHint(Sender: TObject);
begin
  with StatusBar, Panels do
    if SimplePanel then SimpleText := GetLongHint(Application.Hint)
    else Items[Count - 1].Text := GetLongHint(Application.Hint);
end;

procedure TManagerBrowseForm.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 0 then
  begin
    StatusBar.Canvas.Font.Style := [fsBold];
    StatusBar.Canvas.Font.Color := clNavy;
    StatusBar.Canvas.TextRect(Rect, Rect.Left + 4, Rect.Top, Panel.Text);
  end;
end;

procedure TManagerBrowseForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  UpdateToolButtons;
end;

procedure TManagerBrowseForm.DatasetFindActionExecute(Sender: TObject);
begin
  ShowFindInGrid(ManagerDBGrid);
end;

procedure TManagerBrowseForm.DatasetEditActionExecute(Sender: TObject);
begin
  if EditManager((Sender as TComponent).Tag <> 0) then DM.UpdateManagerQry;
end;

procedure TManagerBrowseForm.DataSetRefreshActionExecute(Sender: TObject);
begin
  DM.UpdateManagerQry;
end;

procedure TManagerBrowseForm.PermissionKeyActionExecute(Sender: TObject);
begin
  if ExecuteManagerPasswDlg(Elem_UsersQry.GetValueId) then
    DM.UpdateManagerQry;
end;

procedure TManagerBrowseForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TManagerBrowseForm.ManagerDBGridDblClick(Sender: TObject);
var Col: Integer;
begin
  if DBGridDblClickIsValid(ManagerDBGrid, Col) then
  begin
    if DatasetEditAction.Enabled then DatasetEditAction.Execute
    else if DatasetAddAction.Enabled then DatasetAddAction.Execute
    else if PermissionKeyAction.Enabled then PermissionKeyAction.Execute;
  end;
end;

procedure TManagerBrowseForm.ManagerDBGridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    if DatasetEditAction.Enabled then DatasetEditAction.Execute
    else if DatasetAddAction.Enabled then DatasetAddAction.Execute
    else if PermissionKeyAction.Enabled then PermissionKeyAction.Execute;
  end;                                                             
end;

procedure TManagerBrowseForm.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  with StatusBar.Panels[1] do
    if not Elem_UsersQry.DB.Active then Text := ''
    else Text := IntToStr(Elem_UsersQry.DBRecordCount);
end;

end.
