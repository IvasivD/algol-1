unit ZTVwGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTView, Grids, DBGrids, ActnList, Menus, Db, DBTables, StdCtrls, Buttons,
  ExtCtrls, ImgList;

type
  TZViewGridForm = class(TZViewForm)
    PersonListDBGrid: TDBGrid;
    ShowMemoBtn: TSpeedButton;
    ActiveRecordLabel: TLabel;
    SumPanel: TPanel;
    SumLabel1: TLabel;
    SumLabel2: TLabel;
    SumColumnComboBox: TComboBox;
    SumCalcBtn: TSpeedButton;
    SumResultEdit: TEdit;
    SumCalcAction: TAction;
    RecordCountLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure SumCalcActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure ShowMemoBtnClick(Sender: TObject);
    procedure DetailListQueryAfterOpen(DataSet: TDataSet);
    procedure DetailListQueryAfterScroll(DataSet: TDataSet);
    procedure DetailListQuerySrcStateChange(Sender: TObject);
    procedure PersonListDBGridDblClick(Sender: TObject);
    procedure PersonListDBGridTitleClick(Column: TColumn);
    procedure PersonListDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure PersonListDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FGridSortColumn: Integer;
    //FGridUniqueColumn: TField;
    FGridHintedColumn: TField;
    FMemoFieldName: string;
    procedure DoOrderGrid(Column: TColumn);
    procedure DoCalcSum(Field: TField);
    procedure PrepareSumColumnComboBox;
  protected
    function GetActiveRecordLabel: string; virtual;
    function GetOrderColumns(Column: TColumn): string; virtual;
    function GetRecordCountCaption: string; virtual;
    procedure PrintGrid; virtual;
    procedure ViewHint; override;
    procedure ViewMemo(Field: TField); override;
    property GridSortColumn: Integer read FGridSortColumn;
    property GridHintedColumn: TField read FGridHintedColumn write FGridHintedColumn;
    property MemoFieldName: string read FMemoFieldName write FMemoFieldName;
    property RecordCountCaption: string read GetRecordCountCaption;
  end;

var
  ZViewGridForm: TZViewGridForm;

implementation

uses Printers, VDlgs, TourCmnlIf, TourConsts;

{$R *.DFM}

procedure TZViewGridForm.DoOrderGrid(Column: TColumn);
var
  ColName, SortStr: string;
  Id: Integer;
begin
  ColName := GetOrderColumns(Column);
  if ColName = '' then Exit;
  Screen.Cursor := crHourGlass;
  try
    Id := GridUniqueColumn.AsInteger;
  except
    Id := 0;
  end;
  with DetailListQuery do
  try
    Close;
    SortStr := SQL[SQL.Count - 1];
    try
      SQL[SQL.Count - 1] := 'order by ' + ColName;
      Prepare;
      Open;
      FGridSortColumn := Column.Index;
    except
      ErrorDlg(SZTBrwsQueryError);
      SQL[SQL.Count - 1] := SortStr;
      Prepare;
      Open;
      FGridSortColumn := -1;
    end;
    if (GridUniqueColumn <> nil) and (Id <> 0) then
      Locate(GridUniqueColumn.FieldName, Id, []);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TZViewGridForm.DoCalcSum(Field: TField);
var
  Sum: Extended;
  Id: Integer;
begin
  Sum := 0;
  SumResultEdit.Clear;
  if GridUniqueColumn <> nil then Id := GridUniqueColumn.AsInteger else Id := 0;
  Screen.Cursor := crHourGlass;
  with DetailListQuery do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        Sum := Sum + Field.AsFloat;
        Next;
      end;
      if Id <> 0 then Locate(GridUniqueColumn.FieldName, Id, []);
      with SumResultEdit do
        if Field.DataType in [ftSmallint, ftInteger, ftWord] then
          Text := IntToStr(Round(Sum))
        else if (Field as TFloatField).DisplayFormat <> '' then
          Text := FormatFloat((Field as TFloatField).DisplayFormat, Sum)
        else Text := FloatToStr(Sum);
    finally
      EnableControls;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TZViewGridForm.PrepareSumColumnComboBox;
var I: Integer;
begin
  SumColumnComboBox.Items.Clear;
  with PersonListDBGrid.Columns do
    for I := 0 to Count - 1 do
      if Items[I].Visible then
        SumColumnComboBox.Items.AddObject(Items[I].Title.Caption, Pointer(I));
  with SumColumnComboBox do
  begin
    ToggleControlEnabled(SumColumnComboBox, Items.Count > 0);
    if Enabled then ItemIndex := Items.Count - 1;
  end;
end;

function TZViewGridForm.GetActiveRecordLabel: string;
begin
  Result := '';
end;

function TZViewGridForm.GetOrderColumns(Column: TColumn): string;
begin
  Result := Column.FieldName;
  if Pos('Look', Result) = 1 then Result := ''
  else if Pos('Calc', Result) = 1 then System.Delete(Result, 1, 4);
end;

function TZViewGridForm.GetRecordCountCaption: string;
begin
  Result := CountLabelCaption(
    DetailListQuery.RecordCount, SDataModQueryRecordCountOne,
    SDataModQueryRecordCountTwo, SDataModQueryRecordCountMore);
end;

procedure TZViewGridForm.PrintGrid;
var
  XPIn, YPIn, XMrg, YMrg, YMin, YMax, PW, W, H, Y, I, J: Integer;
  Rct: TRect;
  TitleArr: array of string;
  FieldArr: array of string;
  VisArr: array of Boolean;
  DataArr: array of array of string;
  Tourist, Addr1, Addr2: string;
begin
  Screen.Cursor := crHourGlass;
  SetLength(TitleArr, PersonListDBGrid.Columns.Count);
  SetLength(VisArr, PersonListDBGrid.Columns.Count);
  SetLength(FieldArr, PersonListDBGrid.Columns.Count);
  for I := 0 to PersonListDBGrid.Columns.Count - 1 do
  begin
    //
  end;                                            
  SetLength(DataArr, DetailListQuery.RecordCount);
  for J := 0 to High(DataArr) do
    SetLength(DataArr[J], PersonListDBGrid.Columns.Count);
  //
  Printer.BeginDoc;
  with Printer, Canvas do
  try
    XPIn := GetDeviceCaps(Handle, LOGPIXELSX);
    YPIn := GetDeviceCaps(Handle, LOGPIXELSY);
    XMrg := MeterToPixel(15, XPIn);
    YMrg := MeterToPixel(15, YPIn);
    YMin := YMrg;
    YMax := PageHeight - YMrg;
    PW := PageWidth - XMrg * 2;
    Rct := Bounds(XMrg, YMrg, PW, 0);
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    Font.Size := 12;
    PrintAlignedTextCalc(Canvas, Rct, Self.Caption, DT_CENTER);
    Font.Size := 10;
    W := TextWidth('H');
    H := TextHeight('Yy') + 2;
    Y := YMrg * 2;
    Rct := Bounds(XMrg, YMrg * 2, PW, 0);
    //
  finally
    EndDoc;
    Screen.Cursor := crDefault;
  end;
end;

procedure TZViewGridForm.ViewHint;
begin
  if FGridHintedColumn <> nil then DoViewHint(FGridHintedColumn.AsString);
end;

procedure TZViewGridForm.ViewMemo(Field: TField);
begin
  if Field.FieldName = 'CalcMemo' then Field := DetailListQuery.FieldByName('Memo');
  inherited ViewMemo(Field);
end;

procedure TZViewGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  ActiveRecordLabel.Caption := '';
  RecordCountLabel.Caption := '';
  FGridSortColumn := -1;
  FGridHintedColumn := nil;
  FMemoFieldName := 'Memo';
  if SumPanel.Visible then PrepareSumColumnComboBox;
end;

procedure TZViewGridForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  SumCalcAction.Enabled := SumPanel.Visible and DetailListQuery.Active
    and (DetailListQuery.RecordCount > 0) and (SumColumnComboBox.Text <> '');
end;

procedure TZViewGridForm.SumCalcActionExecute(Sender: TObject);
var
  Fld: TField;
  Idx: Integer;
begin
  with SumColumnComboBox do Idx := Integer(Items.Objects[ItemIndex]);
  with PersonListDBGrid.Columns do
    if (Idx >= 0) and (Idx < Count) then Fld := Items[Idx].Field else Fld := nil;
  if Fld = nil then SumResultEdit.Clear
  else if Fld = GridUniqueColumn then
    SumResultEdit.Text := IntToStr(DetailListQuery.RecordCount)
  else if Fld.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency] then
    DoCalcSum(Fld)
  else ErrorFmtDlg(SDataModErrorFieldNotNumeric, [Fld.DisplayName]);
end;

procedure TZViewGridForm.PrintActionExecute(Sender: TObject);
begin
  Printer.PrinterIndex := -1;
  Printer.PrinterIndex := Printer.PrinterIndex;
  SetPrinterOptions(1);
  if PrintDialog.Execute then PrintGrid;
end;

procedure TZViewGridForm.ShowMemoBtnClick(Sender: TObject);
begin
  ViewMemo(DetailListQuery.FieldByName(MemoFieldName));
end;

procedure TZViewGridForm.DetailListQueryAfterOpen(DataSet: TDataSet);
begin
  RecordCountLabel.Caption := 
    Format(SDataModQueryRecordCount, [DetailListQuery.RecordCount, RecordCountCaption]);
end;

procedure TZViewGridForm.DetailListQueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with ActiveRecordLabel do
  begin
    if not Visible then Visible := True;
    Caption := GetActiveRecordLabel;
  end;
end;

procedure TZViewGridForm.DetailListQuerySrcStateChange(Sender: TObject);
begin
  with ShowMemoBtn do
    if Visible then
      Enabled := DetailListQuery.Active and (DetailListQuery.RecordCount > 0);
end;

procedure TZViewGridForm.PersonListDBGridDblClick(Sender: TObject);
var Col: Integer;
begin
  if DBGridDblClickIsValid(PersonListDBGrid, Col) then
    ViewMemo(PersonListDBGrid.Columns[Col].Field);
end;

procedure TZViewGridForm.PersonListDBGridTitleClick(Column: TColumn);
begin
  DoOrderGrid(Column);
end;

procedure TZViewGridForm.PersonListDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Exit;
end;

procedure TZViewGridForm.PersonListDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdFixed in State) and (FGridSortColumn = DataCol) then
    ImageList.Draw((Sender as TDBGrid).Canvas, Rect.Left + 2, 2, 2);
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
