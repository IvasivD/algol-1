unit ZSelDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, SvtDBGrids, Spin, ComCtrls;

type
  TZSelectDlg = class(TForm)
    BottomPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    SelQry: TQuery;
    SelSrc: TDataSource;
    DatePanel: TPanel;
    FromDateLabel: TLabel;
    FromDatePicker: TDateTimePicker;
    Label2: TLabel;
    DaysEdit: TSpinEdit;
    TillDateLabel: TLabel;
    TillDateValueLabel: TLabel;
    FromTimePicker: TDateTimePicker;
    SelDBGrid: TSvtDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DaysEditClick(Sender: TObject);
    procedure SelDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure SelDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FKeyImage: string;
    FKeyField: TField;
    FKeyValue: Integer;
    FLastTime: Cardinal;
    function GetDayCount: Integer;
    procedure SetDayCount(const Value: Integer);
  protected
    function CheckSelection: Boolean; virtual;
    function GetRangeDate(const Index: Integer): TDateTime; virtual;
    procedure PrepateDialog; virtual;
    procedure PrepateSelectQuery; virtual;
    procedure SetRangeDate(const Index: Integer; const Value: TDateTime); virtual;
    procedure SetSelectQueryParams; virtual;
    procedure UpdateSelectQuery; virtual;
    property KeyValue: Integer read FKeyValue write FKeyValue;
    property KeyField: TField read FKeyField write FKeyField;
    property FromDate: TDateTime index 0 read GetRangeDate write SetRangeDate;
    property TillDate: TDateTime index 1 read GetRangeDate write SetRangeDate;
    property DateTime: TDateTime index 2 read GetRangeDate write SetRangeDate;
    property DayCount: Integer read GetDayCount write SetDayCount;
  end;

{var
  ZSelectDlg: TZSelectDlg;}

implementation

uses DataMod, TourCmnlIf;

{$R *.DFM}

{ TZSelectDlg }

function TZSelectDlg.GetDayCount: Integer;
begin
  Result := DaysEdit.Value;
end;

procedure TZSelectDlg.SetDayCount(const Value: Integer);
begin
  if DaysEdit.Value <> Value then DaysEdit.Value := Value;
end;

function TZSelectDlg.CheckSelection: Boolean;
begin
  Result := True;
end;

function TZSelectDlg.GetRangeDate(const Index: Integer): TDateTime;
begin
  case Index of
    0: Result := FromDatePicker.DateTime;
    1: Result := FromDatePicker.DateTime + DaysEdit.Value - 1;
    2: Result := SumDateAndTime(FromDatePicker.DateTime, FromTimePicker.DateTime);
  else Result := 0;
  end;
end;

procedure TZSelectDlg.PrepateDialog;
begin
  with FromDatePicker do
  begin
    MinDate := Int(Now);
    if DateTime < MinDate then DateTime := MinDate;
  end;
  DaysEditClick(Self);
end;

procedure TZSelectDlg.PrepateSelectQuery;
begin
  UpdateSelectQuery;
  if Assigned(FKeyField) then SelQry.Locate(FKeyField.FieldName, KeyValue, []);
end;

procedure TZSelectDlg.SetRangeDate(const Index: Integer; const Value: TDateTime);
begin
  case Index of
    0, 2:
      begin
        if FromDatePicker.DateTime <> Value then FromDatePicker.DateTime := Value;
        FromTimePicker.DateTime := FromDatePicker.DateTime;
      end;
    1:
      if TillDate <> Value then
        DaysEdit.Value := Round(Int(Value) - Int(FromDatePicker.DateTime) + 1);
  end;
end;

procedure TZSelectDlg.SetSelectQueryParams;
begin
end;

procedure TZSelectDlg.UpdateSelectQuery;
begin
  Screen.Cursor := crHourGlass;
  try
    SelQry.Close;
    SetSelectQueryParams;
    SelQry.Prepare;
    SelQry.Open;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TZSelectDlg.FormCreate(Sender: TObject);
begin
  inherited;
  FKeyImage := '';
  FKeyValue := 0;
  FLastTime := 0;
  PrepateDialog;
end;

procedure TZSelectDlg.FormActivate(Sender: TObject);
begin
  PrepateSelectQuery;
  DaysEditClick(Self);
end;

procedure TZSelectDlg.DaysEditClick(Sender: TObject);
begin
  TillDateValueLabel.Caption := DateToStr(TillDate);
end;

procedure TZSelectDlg.SelDBGridKeyPress(Sender: TObject; var Key: Char);
var S: string;
begin
  if GetTickCount - FLastTime >= 500 then FKeyImage := '';
  FLastTime := GetTickCount;
  if FKeyImage = '' then
  begin
    S := Key;
    S := AnsiUpperCase(S);
    Key := S[1];
  end;
  if Key <> #8 then FKeyImage := FKeyImage + Key
  else if Length(FKeyImage) > 0 then Delete(FKeyImage, Length(FKeyImage), 1);
  if FKeyImage <> '' then
    with SelDBGrid, DataSource.DataSet do
      Locate(Columns[0].FieldName,
        AnsiUpperCase(FKeyImage), [loCaseInsensitive, loPartialKey]);
end;

procedure TZSelectDlg.SelDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
begin
  (Sender as TSvtDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TZSelectDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := (ModalResult = mrCancel) or CheckSelection;
  if CanClose then
    case ModalResult of
      mrOk: FKeyValue := FKeyField.AsInteger;
      mrCancel: FKeyValue := 0;
    end;
end;

end.
