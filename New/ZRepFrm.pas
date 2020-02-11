unit ZRepFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, ExtCtrls, Menus,
  ActnList;

type
  TZReportListForm = class(TForm)
    ReportListDBGrid: TDBGrid;
    Panel7: TPanel;
    CloseBtn: TBitBtn;
    RepListQuerySrc: TDataSource;
    RepListQuery: TQuery;
    PopupMenu: TPopupMenu;
    CloseItem: TMenuItem;
    PrintBtn: TSpeedButton;
    N1: TMenuItem;
    PrintItem: TMenuItem;
    ActionList: TActionList;
    CloseAction: TAction;
    PrintAction: TAction;
    procedure ReportListDBGridDblClick(Sender: TObject);
    procedure ReportListDBGridCellClick(Column: TColumn);
    procedure ReportListDBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PrintActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
  protected
    procedure PrintReport; virtual;
    procedure ViewHint; virtual;
    procedure ViewMemo; virtual;
  end;

{var
  TripDetailPersonListForm: TTripDetailPersonListForm;}

//procedure ShowTripDetailPersonList(ARect: TRect);


implementation

uses DataMod, VDlgs;

{$R *.DFM}

{procedure ShowTripDetailPersonList(ARect: TRect);
begin
  with TTripDetailPersonListForm.Create(Application) do
    try
      BoundsRect := ARect;
      Caption := Format(Caption, [
        DM.TripQueryCalcFrom.AsString, DM.TripQueryCalcArrive.AsString,
        DM.TripQueryLeaveDate.DisplayText]);
      if ShowModal = mrOk then ;
        //DM.PersonQry.Locate('TouristId', DetailListQueryCLIENTID.Value, []);
    finally
      Free;
    end;
end;}

{ TTripDetailPersonListForm }

procedure TZReportListForm.PrintReport;
begin
  //
end;

procedure TZReportListForm.ViewHint;
begin
end;

procedure TZReportListForm.ViewMemo;
const
  xSize = 200;
  ySize = 160;
var
  Field: TField;
  VwFrm: TForm;
  Col: Integer;
  M: TPoint;
begin
  M := Mouse.CursorPos;
  if DBGridDblClickIsValid(ReportListDBGrid, Col) then
  begin
    Field := ReportListDBGrid.Columns[Col].Field;
    if ((Field.DataType = ftMemo) or (Field.DataType = ftFmtMemo)) then
    begin
      VwFrm := TForm.Create(Application);
      with VwFrm do
        try
          if M.X + xSize <= Screen.Width then
            Left := M.X + 1 else Left := M.X - xSize - 1;
          if M.Y + ySize <= Screen.Height then
            Top := M.Y + 1 else Top := M.Y - ySize - 1;
          Width := xSize;
          Height := ySize;
          BorderIcons := [biSystemMenu];
          BorderStyle := bsSizeToolWin;
          with TMemo.Create(VwFrm) do
          begin
            Parent := VwFrm;
            Align := alClient;
            ScrollBars := ssVertical;
            WordWrap := True;
            Color := clInfoBk;
            Text := Field.AsString;
            ReadOnly := True;
          end;
          KeyPreview := True;
          Caption := Field.DisplayName;
          OnKeyPress := FormKeyPress;
          ShowModal;
        finally
          Free;
        end;
    end;
  end;
end;

procedure TZReportListForm.FormActivate(Sender: TObject);
begin
  {with RepListQuery do
  begin
    Close;
    Prepare;
    Open;
  end;}
end;

procedure TZReportListForm.ReportListDBGridCellClick(Column: TColumn);
begin
  ViewHint;
end;

procedure TZReportListForm.ReportListDBGridDblClick(Sender: TObject);
begin
  ViewMemo;
end;

procedure TZReportListForm.ReportListDBGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  ViewHint;
end;

procedure TZReportListForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    CloseAction.Execute;
  end;
end;

procedure TZReportListForm.PrintActionExecute(Sender: TObject);
begin
  PrintReport;
end;

procedure TZReportListForm.CloseActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TZReportListForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CanClose then ClearMyStatusMsg;
end;

end.
