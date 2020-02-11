unit ZTVwNGrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZTView, ImgList, ActnList, Menus, DB, StdCtrls, Buttons, ExtCtrls,
  Grids, SvtDBGrids, AzComboBox, IBDatabase, IBCustomDataSet, IBQuery;

type
  TZViewNewGridForm = class(TZViewForm)
    SumPanel: TPanel;
    SumLabel1: TLabel;
    SumLabel2: TLabel;
    SumCalcBtn: TSpeedButton;
    SumResultEdit: TEdit;
    PersonListDBGrid: TSvtDBGrid;
    ShowMemoBtn: TSpeedButton;
    RecordCountLabel: TLabel;
    ActiveRecordLabel: TLabel;
    SumCalcAction: TAction;
    SumColumnComboBox: TAzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure SumCalcActionExecute(Sender: TObject);
    procedure ShowMemoBtnClick(Sender: TObject);
    procedure DetailListQueryAfterOpen(DataSet: TDataSet);
    procedure DetailListQueryAfterScroll(DataSet: TDataSet);
    procedure DetailListQuerySrcStateChange(Sender: TObject);
    procedure PersonListDBGridDblClick(Sender: TObject);
    procedure PersonListDBGridTitleClick(Column: TSvtColumn);
    procedure PersonListDBGridKeyPress(Sender: TObject; var Key: Char);
    procedure PersonListDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);
  private
    FGridColumnMoved: Boolean;
    FGridHintedColumn: TField;
    FGridSortColumn: Integer;
    FMemoFieldName: string;
    FSumColumnIndex: Integer;
    procedure DoOrderGrid(Column: TSvtColumn);
    procedure DoCalcSum(Field: TField);
    procedure PrepareSumColumnComboBox;
    procedure SetSumColumnIndex(const Value: Integer);
  protected
    procedure CopyGrid; virtual;
    procedure DoCopy; override;
    procedure DoPrint; override;
    function GetActiveRecordLabel: string; virtual;
    function GetManagerName: String; virtual;
    function GetOrderColumns(Column: TSvtColumn): string; virtual;
    function GetRecordCountCaption: string; virtual;
    procedure PrintGrid(Print: Boolean = True); virtual;
    procedure ViewHint; override;
    procedure ViewMemo(Field: TField); override;
    property GridSortColumn: Integer read FGridSortColumn;
    property GridHintedColumn: TField read FGridHintedColumn write FGridHintedColumn;
    property ManagerName: String read GetManagerName;
    property MemoFieldName: string read FMemoFieldName write FMemoFieldName;
    property RecordCountCaption: string read GetRecordCountCaption;
    property SumColumnIndex: Integer read FSumColumnIndex write SetSumColumnIndex;
  end;

var
  ZViewNewGridForm: TZViewNewGridForm;

implementation

uses Printers, TourCmnlIf, TourConsts, PrntUn, TourStrMag;

{$R *.dfm}

{ TZViewNewGridForm }

const
  ftNumericFields =
    [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeint];

procedure TZViewNewGridForm.DoCalcSum(Field: TField);
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
    DetailListQuery.AfterScroll := nil;
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
      DetailListQuery.AfterScroll := DetailListQueryAfterScroll;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TZViewNewGridForm.DoOrderGrid(Column: TSvtColumn);
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

procedure TZViewNewGridForm.PrepareSumColumnComboBox;
var I: Integer;
begin
  SumColumnComboBox.Items.Clear;
  with PersonListDBGrid.Columns do
    for I := 0 to Count - 1 do
      if Items[I].Visible and (Items[I].Field.DataType in ftNumericFields) then
        SumColumnComboBox.Items.AddObject(Items[I].Title.Caption, Pointer(I));
  with SumColumnComboBox do
  begin
    SumColumnComboBox.Enabled := Items.Count > 0;
    if Enabled then
    begin
      if SumColumnIndex < 0 then
        SumColumnIndex := Items.Count - 1 else SumColumnIndex := SumColumnIndex;
    end;
  end;
end;

procedure TZViewNewGridForm.SetSumColumnIndex(const Value: Integer);
begin
  with SumColumnComboBox do
    if Enabled then
    begin
      if (Value >= -1) and (Value < Items.Count) then
        ItemIndex := Value else ItemIndex := Items.Count - 1;
      FSumColumnIndex := ItemIndex;
    end
    else FSumColumnIndex := Value;
end;

procedure TZViewNewGridForm.CopyGrid;
begin
  PrintGrid(False);
end;

procedure TZViewNewGridForm.DoCopy;
begin
  CopyGrid;
end;

procedure TZViewNewGridForm.DoPrint;
begin
  PrintGrid;
end;

function TZViewNewGridForm.GetActiveRecordLabel: string;
begin
  Result := '';
end;

function TZViewNewGridForm.GetManagerName: String;
begin
  Result := '';
end;

function TZViewNewGridForm.GetOrderColumns(Column: TSvtColumn): string;
begin
  Result := Column.FieldName;
  if Pos('Look', Result) = 1 then Result := ''
  else if Pos('Calc', Result) = 1 then System.Delete(Result, 1, 4);
end;

function TZViewNewGridForm.GetRecordCountCaption: string;
begin
  Result := CountLabelCaption(
    DetailListQuery.RecordCount, SDataModQueryRecordCountOne,
    SDataModQueryRecordCountTwo, SDataModQueryRecordCountMore);
end;

procedure TZViewNewGridForm.PrintGrid(Print: Boolean);
var
  RepCols, RepRows, Id: Integer;
  XPIn, YPIn, XMrg, YMrg, XMax, YMin, YMax, //XSize, YSize,
  Pg, PW, W, H, HH, XC, CWd, CWp, N, C, K, X, Y, I, J: Integer;
  Flags: Cardinal;
  Rct: TRect;
  TitleArr: array of string;
  FieldArr: array of string;
  AlignArr: array of Cardinal;
  WidthArr: array of Integer;
  VisArr: array of Boolean;
  DataArr: array of array of string;
  OneRow, Tourist, Addr1, Addr2: string;
  procedure PrintManager(Canvas: TCanvas);
  begin
    Canvas.Font.Color := clGray;
    Canvas.Font.Size := 8;
    PrintAlignedText(Canvas, Bounds(XMrg, YMax, PW, H),
      Format('%s %s', [ManagerName, FormatDateTime('dd.mm.yyyy hh:nn', Now)]), DT_LEFT);
    Canvas.Font.Color := clBlack;
    Canvas.Font.Size := 10;
  end;
  procedure PrintPageNo(Canvas: TCanvas);
  begin
    Rct := Bounds(XMrg, YMax, PW, H);   // print the page no
    PrintAlignedTextCalc(Canvas, Rct, Format(SVDlgsPageNo, [Pg]), DT_RIGHT);
    PrintManager(Canvas);
  end;
begin
  if Assigned(GridUniqueColumn) then
    Id := GridUniqueColumn.AsInteger else Id := 0;
  RepCols := PersonListDBGrid.Columns.Count;
  RepRows := DetailListQuery.RecordCount;
  SetLength(TitleArr, RepCols);
  SetLength(AlignArr, RepCols);
  SetLength(WidthArr, RepCols);
  SetLength(VisArr, RepCols);
  SetLength(FieldArr, RepCols);
  SetLength(DataArr, RepRows);
  for J := 0 to High(DataArr) do SetLength(DataArr[J], RepCols);
  CWd := PersonListDBGrid.Canvas.TextWidth('9');
  for I := 0 to RepCols - 1 do
    with PersonListDBGrid.Columns.Items[I] do
    begin
      TitleArr[I] := Title.Caption;
      FieldArr[I] := FieldName;
      case Alignment of
        taRightJustify: AlignArr[I] := DT_RIGHT;
        taCenter: AlignArr[I] := DT_CENTER;
        else AlignArr[I] := DT_LEFT;
      end;
      WidthArr[I] := Round(Width / CWd);
      VisArr[I] := Visible;
    end;
  J := 0;
  with DetailListQuery do
  begin
    Screen.Cursor := crHourGlass;
    DetailListQuery.AfterScroll := nil;
    DisableControls;
    try
      First;
      while not Eof do
      begin
        for I := 0 to RepCols - 1 do
          if FieldArr[I] = '' then DataArr[J, I] := ''
          else DataArr[J, I] :=
            StringWithoutCRLF(FieldByName(FieldArr[I]).DisplayText);
        Inc(J);
        Next;
      end;
      if Assigned(GridUniqueColumn) and (Id > 0) then
        Locate(GridUniqueColumn.FieldName, Id, []);
    finally
      EnableControls;
      DetailListQuery.AfterScroll := DetailListQueryAfterScroll;
      Screen.Cursor := crDefault;
    end;
  end;
  if not Print then
  begin
    with TMemo.Create(Application) do
    try
      Parent := Self;
      OneRow := '';
      for I := 0 to RepCols - 1 do
        if VisArr[I] then OneRow := OneRow + TitleArr[I] + #9;
      Lines.Add(OneRow);
      for J := 0 to RepRows - 1 do  // copy all rows for range of columns
      begin
        OneRow := '';
        for I := 0 to RepCols - 1 do
          if VisArr[I] then OneRow := OneRow + DataArr[J, I] + {#32}#9;
        if OneRow <> '' then
        begin
          System.Delete(OneRow, Length(OneRow), 1);
          Lines.Add(OneRow);
        end;
      end;
      SelectAll;
      CopyToClipboard;
    finally
      Free;
    end;
    Exit;
  end;
  Printer.BeginDoc;
  with Printer, Canvas do
  try
    XPIn := GetDeviceCaps(Handle, LOGPIXELSX); // horizontal device resolution
    YPIn := GetDeviceCaps(Handle, LOGPIXELSY); // vertical device resolution
    XMrg := MeterToPixel(10, XPIn);
    YMrg := MeterToPixel(10, YPIn);
    XMax := PageWidth - XMrg;    // right margin of page in pixels
    YMin := YMrg;                // top margin of page in pixels
    YMax := PageHeight - YMrg;   // bottom margin of page in pixels
    //XSize := MeterToPixel(GetDeviceCaps(Handle, HORZSIZE), XPIn);
    //YSize := MeterToPixel(GetDeviceCaps(Handle, VERTSIZE), YPIn);
    Pg := 1;    // page counter
    PW := PageWidth - XMrg * 2;  // page width without margins
    Rct := Bounds(XMrg, YMrg, PW, 0);
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    Font.Size := 12;
    PrintAlignedTextCalc(Canvas, Rct, Self.Caption, DT_CENTER); // print title
    Font.Style := [];
    Font.Size := 10;
    XC := XPIn div Screen.PixelsPerInch;  // X scale
    CWp := TextWidth('9');
    for I := 0 to RepCols - 1 do
      if VisArr[I] then WidthArr[I] := WidthArr[I] * CWp + 4
      else WidthArr[I] := 0;
    H := TextHeight('Yy') + 2; // row height
    HH := H * 2 + H div 8;
    YMrg := YMrg * 2;
    Rct := Bounds(XMrg, YMrg * 2, PW, 0);
    Flags := DT_BOTTOM + DT_NOCLIP; // drawing flag
    N := 0;  // last column no fot the current page
    C := 0;  // at which column ends the previous page
    while C < RepCols do
    begin
      W := 0;                     // calculate count of columns per current page
      for I := C to RepCols - 1 do
        if VisArr[I] then
        begin
          Inc(W, WidthArr[I]);
          if W > PW then Break;
          N := Succ(I);
        end;
      Y := YMrg + HH;
      for J := 0 to RepRows - 1 do  // print all rows for range of columns
      begin
        if Y + H > YMax then
        begin
          NewPage;
          Y := YMin;
          PrintPageNo(Canvas);
          Inc(Pg);
        end;
        X := XMrg;
        for I := C to N - 1 do
          if VisArr[I] then
          begin
            W := WidthArr[I];
            if J = 0 then         // print column title
              PrintBoundaryText(Canvas, 3, Bounds(X, YMrg, W, HH),
                TitleArr[I], DT_CENTER + DT_VCENTER); // + DT_WORDBREAK);
            PrintBoundaryText(    // print one cell
              Canvas, 1, Bounds(X, Y, W, H), DataArr[J, I], Flags + AlignArr[I]);
            Inc(X, W);
          end;
        Inc(Y, H);
      end;
      C := N;
      if C < RepCols then
      begin
        PrintPageNo(Canvas);
        Inc(Pg);
        NewPage;
      end;
    end;
    if Pg > 1 then PrintPageNo(Canvas) else PrintManager(Canvas);
  finally
    EndDoc;
    Screen.Cursor := crDefault;
  end;
end;

procedure TZViewNewGridForm.ViewHint;
begin
  if FGridHintedColumn <> nil then DoViewHint(FGridHintedColumn.AsString);
end;

procedure TZViewNewGridForm.ViewMemo(Field: TField);
begin
  if Field.FieldName = 'CalcMemo' then Field := DetailListQuery.FieldByName('Memo');
  inherited ViewMemo(Field);
end;

procedure TZViewNewGridForm.FormCreate(Sender: TObject);
begin
  inherited;
  ActiveRecordLabel.Caption := '';
  RecordCountLabel.Caption := '';
  FGridColumnMoved := False;
  FGridHintedColumn := nil;
  FGridSortColumn := -1;
  FMemoFieldName := 'Memo';
  FSumColumnIndex := -1;
  if SumPanel.Visible then PrepareSumColumnComboBox;
end;

procedure TZViewNewGridForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  SumCalcAction.Enabled := SumPanel.Visible and DetailListQuery.Active
    and (DetailListQuery.RecordCount > 0) and (SumColumnComboBox.Text <> '');
end;

procedure TZViewNewGridForm.SumCalcActionExecute(Sender: TObject);
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
  else if Fld.DataType in ftNumericFields then
    DoCalcSum(Fld)
  else ErrorFmtDlg(SDataModErrorFieldNotNumeric, [Fld.DisplayName]);
end;

procedure TZViewNewGridForm.ShowMemoBtnClick(Sender: TObject);
begin
  ViewMemo(DetailListQuery.FieldByName(MemoFieldName));
end;

procedure TZViewNewGridForm.DetailListQueryAfterOpen(DataSet: TDataSet);
begin
  RecordCountLabel.Caption :=
    Format(SDataModQueryRecordCount, [DetailListQuery.RecordCount, RecordCountCaption]);
  if (SumColumnComboBox.ItemIndex >= 0) then
    with SumCalcBtn do if Enabled then Click;
  //SumResultEdit.Clear;
end;

procedure TZViewNewGridForm.DetailListQueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  with ActiveRecordLabel do
  begin
    if not Visible then Visible := True;
    Caption := GetActiveRecordLabel;
  end;
end;

procedure TZViewNewGridForm.DetailListQuerySrcStateChange(Sender: TObject);
begin
  with ShowMemoBtn do
    if Visible then
      Enabled := DetailListQuery.Active and (DetailListQuery.RecordCount > 0)
        and (MemoFieldName <> '');
end;

procedure TZViewNewGridForm.PersonListDBGridDblClick(Sender: TObject);
//var Col: Integer;
begin
  {if DBGridDblClickIsValid(PersonListDBGrid, Col) then
    ViewMemo(PersonListDBGrid.Columns[Col].Field);}
end;

procedure TZViewNewGridForm.PersonListDBGridTitleClick(Column: TSvtColumn);
begin
  if FGridColumnMoved then FGridColumnMoved := False else DoOrderGrid(Column);
end;

procedure TZViewNewGridForm.PersonListDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Exit;
end;

procedure TZViewNewGridForm.PersonListDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
begin
  if not (gdFixed in State) and (FGridSortColumn = DataCol) then
    ImageList.Draw((Sender as TSvtDBGrid).Canvas, Rect.Left + 2, 2, 2);
  (Sender as TSvtDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
