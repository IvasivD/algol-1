unit ZTIBVwGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTIBView, Grids, SvtDBGrids, ActnList, Menus, Db, DBTables, StdCtrls, Buttons,
  ExtCtrls, ImgList, Variants, ComObj;

type
  TZViewGridForm = class(TZViewForm)
    PersonListDBGrid: TSvtDBGrid;
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
    BitBtn1: TBitBtn;
    ExportToExelAction: TAction;
    TouristLatCheckBox: TCheckBox;
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
    procedure PersonListDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure PersonListDBGridColumnMoved(Sender: TObject;
      FromIndex, ToIndex: Integer);
    procedure ExportToExelActionExecute(Sender: TObject);
    procedure TouristLatCheckBoxClick(Sender: TObject);
  private
    FGridColumnMoved: Boolean;
    FGridHintedColumn: TField;
    FGridSortColumn: Integer;
    FMemoFieldName: string;
    FSumColumnIndex: Integer;
    FTouristCol: Integer;
    procedure DoCalcSum(Field: TField);
    procedure DoOrderGrid(Column: TSvtColumn);
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
    procedure ExportInExel(const DataArr: Variant; const RowCount, ColCount: Integer); virtual;
    property GridSortColumn: Integer read FGridSortColumn;
    property GridHintedColumn: TField read FGridHintedColumn write FGridHintedColumn;
    property ManagerName: String read GetManagerName;
    property MemoFieldName: string read FMemoFieldName write FMemoFieldName;
    property RecordCountCaption: string read GetRecordCountCaption;
    property SumColumnIndex: Integer read FSumColumnIndex write SetSumColumnIndex;
    property TouristCol: Integer read FTouristCol write FTouristCol;
  end;

var
  ZViewGridForm: TZViewGridForm;

implementation

uses Printers, VDlgs, TourCmnlIf, TourConsts, PrntUn, TourStrMag, PrntGrd;

{$R *.DFM}

const
  ftNumericFields =
    [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftLargeint];
  sTouristNameArr: array[Boolean] of string = ('TOURISTNAME', 'TOURISTNAMELAT');

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

procedure TZViewGridForm.DoOrderGrid(Column: TSvtColumn);
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
  with {DetailListQuery} Column.Field.DataSet as TQuery do
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
    if (GridUniqueColumn <> nil) and (Id <> 0)
      and (Column.Field.DataSet = DetailListQuery)
    then Locate(GridUniqueColumn.FieldName, Id, []);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TZViewGridForm.PrepareSumColumnComboBox;
var I: Integer;
begin
  SumColumnComboBox.Items.Clear;
  with PersonListDBGrid.Columns do
    for I := 0 to Count - 1 do
      if Items[I].Visible and (Items[I].Field.DataType in ftNumericFields) then
        {$WARN UNSAFE_TYPE OFF}
        SumColumnComboBox.Items.AddObject(Items[I].Title.Caption, Pointer(I));
        {$WARN UNSAFE_TYPE ON}
  with SumColumnComboBox do
  begin
    ToggleControlEnabled(SumColumnComboBox, Items.Count > 0);
    if Enabled then
    begin
      if SumColumnIndex < 0 then
        SumColumnIndex := Items.Count - 1 else SumColumnIndex := SumColumnIndex;
    end;
  end;
end;

procedure TZViewGridForm.SetSumColumnIndex(const Value: Integer);
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

procedure TZViewGridForm.CopyGrid;
begin
  PrintGrid(False);
end;

procedure TZViewGridForm.DoCopy;
begin
  CopyGrid;
end;

procedure TZViewGridForm.DoPrint;
begin
  PrintGrid;
end;

function TZViewGridForm.GetActiveRecordLabel: string;
begin
  Result := '';
end;

function TZViewGridForm.GetManagerName: String;
begin
  Result := '';
end;

function TZViewGridForm.GetOrderColumns(Column: TSvtColumn): string;
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

{procedure TZViewGridForm.PrintGrid(Print: Boolean = True);
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
          if VisArr[I] then OneRow := OneRow + DataArr[J, I] + #9;//#32;
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
end;}
procedure TZViewGridForm.PrintGrid(Print: Boolean = True);
var
  RepCols, RepRows, Id, CWd, I, J: Integer;
  OneRow: string;
  TitleArr, FieldArr: array of string;
  DataArr: array of array of string;
  AlignArr: array of Cardinal;
  WidthArr: array of Integer;
  VisArr, DelArr: array of Boolean;
begin
  if Print then
    PrntGrd.PrintGrid(DocumentTitle, ManagerName, DocumentHeader, DocumentFooter,
      False, PersonListDBGrid, GridUniqueColumn, GridRefuseColumn,
      'Calibri', 10, PrintDialog)
  else begin
    if Assigned(GridUniqueColumn) then Id := GridUniqueColumn.AsInteger
    else Id := 0;
    RepCols := PersonListDBGrid.Columns.Count;
    RepRows := DetailListQuery.RecordCount;
    SetLength(TitleArr, RepCols);
    SetLength(AlignArr, RepCols);
    SetLength(WidthArr, RepCols);
    SetLength(VisArr, RepCols);
    SetLength(FieldArr, RepCols);
    SetLength(DataArr, RepRows);
    SetLength(DelArr, RepRows);
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
          DelArr[J] := (GridRefuseColumn <> nil) and GridRefuseColumn.AsBoolean;
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
  FGridColumnMoved := False;
  FGridHintedColumn := nil;
  FGridSortColumn := -1;
  FMemoFieldName := 'Memo';
  FSumColumnIndex := -1;
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
  {$WARN UNSAFE_CAST OFF}
  with SumColumnComboBox do Idx := Integer(Items.Objects[ItemIndex]);
  {$WARN UNSAFE_CAST ON}
  with PersonListDBGrid.Columns do
    if (Idx >= 0) and (Idx < Count) then Fld := Items[Idx].Field else Fld := nil;
  if Fld = nil then SumResultEdit.Clear
  else if Fld = GridUniqueColumn then
    SumResultEdit.Text := IntToStr(DetailListQuery.RecordCount)
  else if Fld.DataType in ftNumericFields then
    DoCalcSum(Fld)
  else ErrorFmtDlg(SDataModErrorFieldNotNumeric, [Fld.DisplayName]);
end;

procedure TZViewGridForm.ShowMemoBtnClick(Sender: TObject);
begin
  ViewMemo(DetailListQuery.FieldByName(MemoFieldName));
end;

procedure TZViewGridForm.DetailListQueryAfterOpen(DataSet: TDataSet);
begin
  RecordCountLabel.Caption :=
    Format(SDataModQueryRecordCount, [DetailListQuery.RecordCount, RecordCountCaption]);
  if (SumColumnComboBox.ItemIndex >= 0) then
    with SumCalcBtn do if Enabled then Click;
  //SumResultEdit.Clear;
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
      Enabled := DetailListQuery.Active and (DetailListQuery.RecordCount > 0)
        and (MemoFieldName <> '');
end;

procedure TZViewGridForm.PersonListDBGridDblClick(Sender: TObject);
begin
  with Sender as TSvtDBGrid do Self.ViewMemo(Columns[MouseColumn].Field);
end;

procedure TZViewGridForm.PersonListDBGridTitleClick(Column: TSvtColumn);
begin
  if FGridColumnMoved then FGridColumnMoved := False else DoOrderGrid(Column);
end;

procedure TZViewGridForm.PersonListDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Exit;
end;

procedure TZViewGridForm.PersonListDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
begin
  with Sender as TSvtDBGrid do
  begin
    if not (gdFixed in State) and Assigned(GridRefuseColumn) then
      with Canvas.Font do
        if GridRefuseColumn.AsBoolean then
        begin
          Color := clRed;
          Style := Style + [fsStrikeout];
        end
        else Style := Style - [fsStrikeout];
    if not (gdFixed in State) and (FGridSortColumn = DataCol) then
      ImageList.Draw(Canvas, Rect.Left + 2, 2, 2);
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TZViewGridForm.PersonListDBGridColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  FGridColumnMoved := True;
end;

procedure TZViewGridForm.ExportToExelActionExecute(Sender: TObject);
var 
  Mrk: TBookmark;
  RowCount, ColCount, I, J, K, ColVisible: Integer;
  DataArr: Variant;
begin
  inherited;
  with DetailListQuery do
  begin
    Mrk := GetBookmark;
    try
      DisableControls;
      FetchAll; 
      First;     
      ColCount := PersonListDBGrid.Columns.Count;
      ColVisible := 0;
      for I := 0 to PersonListDBGrid.Columns.Count - 1 do
      if PersonListDBGrid.Columns[I].Visible then Inc(ColVisible);
      RowCount := RecordCount;
      DataArr := VarArrayCreate([1, RowCount + 1, 1, ColVisible], varVariant);
      K := 0;
      for J := 0 to ColCount - 1 do
      with PersonListDBGrid.Columns[J] do
      if Visible then DataArr[1, J + 1 - K] := Title.Caption else Inc(K);

      I := 2;
      while not Eof do
      begin
        K := 0;
        for J := 0 to ColCount - 1 do
        with PersonListDBGrid.Columns[J] do
        if Visible then DataArr[I, J + 1 - K] := Field.Value else Inc(K);
        Inc(I);
        Next;
      end;
      ExportInExel(DataArr, RowCount, ColVisible);
      EnableControls;
      GotoBookmark(Mrk);
    finally
      FreeBookmark(Mrk);
    end;
  end;
end;

var 
  BeginRow, BeginCol: Variant;
  ExcelApp, Workbook, Range, Cell1, Cell2: Variant;
  
procedure TZViewGridForm.ExportInExel(const DataArr: Variant;
  const RowCount, ColCount: Integer);
begin
// Створюємо Excel
  ExcelApp := CreateOleObject('Excel.Application');

// Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;
                             
//  Створюємо Книгу (Workbook)          
  Workbook := ExcelApp.WorkBooks.Add;//('N:\ТурМенеджер - Документи\Templates\Tours\report.xls');
  BeginRow := 1;
  BeginCol := 1;

// Ліва верхня ячейка області, в яку будемо виводити дані
  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];

// Права нижня ячейка області, в яку будемо виводити дані
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow  + RowCount, BeginCol + ColCount - 1];

// Область, в яку будемо виводити дані
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
// Вивід даних
  Range.Value := DataArr;
  Range.EntireColumn.AutoFit;

  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol + ColCount - 1];
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
  Range.HorizontalAlignment := $FFFFEFF4;
  Range.Interior.Color := clSkyBlue;
//Закріплення області
  WorkBook.WorkSheets[1].Activate;
  WorkBook.WorkSheets[1].Range['A2:A2'].Select;
  ExcelApp.ActiveWindow.FreezePanes:= True;
  
  ExcelApp.Visible := true;
end;

procedure TZViewGridForm.TouristLatCheckBoxClick(Sender: TObject);
begin
  inherited;
  with Sender as TCheckBox do  
  PersonListDBGrid.Columns[TouristCol].FieldName := sTouristNameArr[Checked]; 
end;

end.
