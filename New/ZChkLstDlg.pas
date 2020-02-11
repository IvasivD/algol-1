unit ZChkLstDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls;

const
  nCheckListKindNone = -1;
  nCheckListKindExecutable = 0;
  nCheckListKindLast = nCheckListKindExecutable;
  nCheckListStateNone = -1;
  nCheckListStatePassedOk = 0;
  nCheckListStateSkipped = 1;
  nCheckListStateStopped = 2;
  nCheckListStateWarning = 3;
  nCheckListStateQuestion = 4;
  nCheckListStateRunning = 5;
  nCheckListStateLast = nCheckListStateRunning;
  nCheckListPassedStates = [
    nCheckListStatePassedOk, nCheckListStateSkipped,
    nCheckListStateStopped, nCheckListStateWarning];
  nCheckListRunnedStates = [
    nCheckListStateQuestion, nCheckListStateRunning];

type
  TCheckListKind = nCheckListKindNone..nCheckListKindLast;
  TCheckListState = nCheckListStateNone..nCheckListStateLast;
  TCheckListStep = TListItem;
  TCheckListSteps = TListItems;
  TCheckListFunc =
    function (Step: TCheckListStep; var ResState: TCheckListState): Boolean of object;

type
  TZCheckListDialog = class(TZDialog)
    WorkPanel: TPanel;
    CheckListView: TListView;
    StateImageList: TImageList;
    ImageList: TImageList;
    ExecuteBtn: TBitBtn;
    ViewPanel: TPanel;
    CheckImage: TImage;
    procedure CheckListViewResize(Sender: TObject);
    procedure ExecuteBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FFinishCaption: String;
    FFinishSuccessed: Boolean;
    function CheckAllPassed: Boolean;
    function CheckNoRunning: Boolean;
    function GetFinishCaption: String;
    function GetSelecedIndex: Integer;
    function GetSelecedState: TCheckListState;
    function GetSelecedStep: TCheckListStep;
    function GetState(Index: Integer): TCheckListState;
    function GetStepCount: Integer;
    function GetStepKind(Index: Integer): TCheckListKind;
    function GetSteps: TCheckListSteps;
    function GetWarningCount: Integer;
    procedure SetFinishSuccessed(const Value: Boolean);
    procedure SetSelecedState(const Value: TCheckListState);
  protected
    procedure AddError(const ErrorMessage: String);
    procedure AddFinish(Success: Boolean);
    procedure AddStep(
      const ATitle: String; AState: TCheckListState = nCheckListStateNone;
      AKind: TCheckListKind = nCheckListKindNone);
    procedure ClearSteps;
    function Execute: Boolean;
    function ExecuteStep(Index: Integer; Func: TCheckListFunc): Boolean;
    function ExecuteSteps: Boolean; virtual;
    function ExecuteNewStep(const StepTitle: String; Func: TCheckListFunc): Boolean;
    procedure PrepareDialog; override;
    procedure ToggleModalButtons; virtual;
    property FinishCaption: String read GetFinishCaption write FFinishCaption;
    property FinishSuccessed: Boolean read FFinishSuccessed write SetFinishSuccessed;
    property StepCount: Integer read GetStepCount;
    property StepKind[Index: Integer]: TCheckListKind read GetStepKind;
    property Steps: TCheckListSteps read GetSteps;
    property StepState[Index: Integer]: TCheckListState read GetState;
    property SelecedIndex: Integer read GetSelecedIndex;
    property SelecedState: TCheckListState read GetSelecedState write SetSelecedState;
    property SelecedStep: TCheckListStep read GetSelecedStep;
    property WarningCount: Integer read GetWarningCount;
  end;

var
  ZCheckListDialog: TZCheckListDialog;

implementation

uses TourConsts, TourCmnlIf;

{$R *.dfm}

{ TZCheckListDialog }

procedure TZCheckListDialog.AddError(const ErrorMessage: String);
begin
  AddStep(Format(SZChkLstDlgResError, [ErrorMessage]),
    nCheckListStateWarning, nCheckListKindNone);
  ErrorDlg(ErrorMessage);
end;

procedure TZCheckListDialog.AddFinish(Success: Boolean);
var S: String;
begin
  if not Success then S := SZChkLstDlgResStopped
  else if GetWarningCount > 0 then S := SZChkLstDlgResExecWarn
  else S := SZChkLstDlgResExecuted;
  AddStep(
    Format(S, [FinishCaption]), nCheckListStateNone, nCheckListKindExecutable);
  FinishSuccessed := FinishSuccessed or Success;
end;

procedure TZCheckListDialog.AddStep(
  const ATitle: String; AState: TCheckListState = nCheckListStateNone;
  AKind: TCheckListKind = nCheckListKindNone);
begin
  with Steps.Add do
  begin
    Caption := ATitle;
    ImageIndex := AKind;
    StateIndex := AState;
    Selected := True;
  end;
  ToggleModalButtons;
end;

function TZCheckListDialog.CheckAllPassed: Boolean;
var I: Integer;
begin
  Result := StepCount > 0;
  if Result then
    for I := 0 to StepCount - 1 do
      if (StepKind[I] = nCheckListKindExecutable)
        and (StepState[I] <> nCheckListStateNone)
        and not (StepState[I] in nCheckListPassedStates)
      then begin
        Result := False;
        Break;
      end;
end;

function TZCheckListDialog.CheckNoRunning: Boolean;
var I: Integer;
begin
  Result := True;
  for I := 0 to StepCount - 1 do
    if StepState[I] = nCheckListStateRunning then
    begin
      Result := False;
      Break;
    end;
end;

procedure TZCheckListDialog.ClearSteps;
begin
  Steps.Clear;
  ToggleModalButtons;
end;

function TZCheckListDialog.Execute: Boolean;
begin
  ClearSteps;
  Result := ExecuteSteps;
  AddFinish(Result);
end;

function TZCheckListDialog.ExecuteStep(Index: Integer; Func: TCheckListFunc): Boolean;
var
  Step: TCheckListStep;
  Res: TCheckListState;
begin
  Step := Steps[Index];
  Result := Assigned(Step) and (Step.StateIndex = nCheckListStateNone);
  if Result then
  begin
    Step.Selected := True;
    if Assigned(Func) then
    try
      Res := nCheckListStateRunning;
      Step.StateIndex := Res;
      Result := Func(Step, Res);
      if Result and (Res in nCheckListRunnedStates) then
        Res := nCheckListStatePassedOk;
      if Step.StateIndex <> Res then Step.StateIndex := Res;
    except
      on E: Exception do
      begin
        AddError(E.Message);
        Step.StateIndex := nCheckListStateStopped;
        Result := False;
      end;
    end
    else begin
      Step.StateIndex := nCheckListStateSkipped;
      Result := False;
    end;
  end;
  ToggleModalButtons;
end;

function TZCheckListDialog.ExecuteSteps: Boolean;
begin
  Result := True;
end;

function TZCheckListDialog.ExecuteNewStep(
  const StepTitle: String; Func: TCheckListFunc): Boolean;
begin
  AddStep(StepTitle, nCheckListStateNone, nCheckListKindExecutable);
  Result := ExecuteStep(GetSelecedIndex, Func);
end;

function TZCheckListDialog.GetFinishCaption: String;
begin
  if FFinishCaption = '' then Result := Caption else Result := FFinishCaption;
end;

function TZCheckListDialog.GetSelecedIndex: Integer;
begin
  Result := Steps.IndexOf(GetSelecedStep);
end;

function TZCheckListDialog.GetSelecedState: TCheckListState;
var Step: TCheckListStep;
begin
  Step := GetSelecedStep;
  if Assigned(Step) then
    Result := Step.StateIndex
  else
    Result := nCheckListStateNone;
end;

function TZCheckListDialog.GetSelecedStep: TCheckListStep;
var I: Integer;
begin
  Result := nil;
  for I := 0 to GetStepCount - 1 do
    if Steps[I].Selected then
    begin
      Result := Steps[I];
      Break;
    end;
end;

function TZCheckListDialog.GetState(Index: Integer): TCheckListState;
begin
  Result := Steps[Index].StateIndex;
end;

function TZCheckListDialog.GetStepCount: Integer;
begin
  Result := Steps.Count;
end;

function TZCheckListDialog.GetStepKind(Index: Integer): TCheckListKind;
begin
  Result := Steps[Index].ImageIndex;
end;

function TZCheckListDialog.GetSteps: TCheckListSteps;
begin
  Result := CheckListView.Items;
end;

function TZCheckListDialog.GetWarningCount: Integer;
var I: Integer;
begin
  Result := 0;
  for I := 0 to GetStepCount - 1 do
    if Steps[I].StateIndex = nCheckListStateWarning then Inc(Result);
end;

procedure TZCheckListDialog.SetFinishSuccessed(const Value: Boolean);
begin
  FFinishSuccessed := Value;
  ToggleModalButtons;
end;

procedure TZCheckListDialog.SetSelecedState(const Value: TCheckListState);
var Step: TCheckListStep;
begin
  Step := GetSelecedStep;
  if Assigned(Step) then
  begin
    Step.StateIndex := Value;
    ToggleModalButtons;
  end;
end;

procedure TZCheckListDialog.ToggleModalButtons;
begin
  ExecuteBtn.Enabled := StepCount = 0;
  OkBtn.Enabled := (StepCount > 0) and CheckAllPassed and FinishSuccessed;
  CancelBtn.Enabled := (StepCount > 0) or CheckNoRunning or not FinishSuccessed;
end;

procedure TZCheckListDialog.PrepareDialog;
begin
  inherited;
  FinishCaption := '';
  FinishSuccessed := False;
  ClearSteps;
end;

procedure TZCheckListDialog.CheckListViewResize(Sender: TObject);
begin
  with Sender as TListView do
    if Columns.Count = 1 then Columns[0].Width := Width - 20;
end;

procedure TZCheckListDialog.ExecuteBtnClick(Sender: TObject);
begin
  if Execute then ToggleModalButtons;
end;

procedure TZCheckListDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := (ModalResult = mrOk) and CheckAllPassed
    or (ModalResult <> mrOk) and CheckNoRunning;
  inherited;
end;

end.
