unit MOSrvUtil;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses Windows, Excel2000;

const xlLCID = LOCALE_USER_DEFAULT;

function ExcelCell(X, Y: Integer): string;
procedure ExcelDrawDataCell(TheSheet: _Worksheet; const ACell, Value: string);
procedure ExcelDrawBordersAll(TheSheet: _Worksheet; const FromCell, TillCell: String);
procedure ExcelMergeCells(TheSheet: _Worksheet; const FromCell, TillCell: String);
procedure ExcelPageSetup(TheSheet: _Worksheet; APaperSize, AnOrientation: Cardinal);
procedure ExcelSetColWidth(TheSheet: _Worksheet; ACol: Integer; AWidth: Real);
procedure ExcelSetRowHeight(TheSheet: _Worksheet; ARow: Integer; AHeight: Real);
procedure ExcelSetRangeAlignment(TheSheet: _Worksheet;
  const FromCell, TillCell: String; Horizontal, Vertical: Cardinal);
procedure ExcelSetRangeWrapText(TheSheet: _Worksheet;
  const FromCell, TillCell: String);


implementation

uses SysUtils, Variants;

function ExcelGetRange(TheSheet: _Worksheet; const FromCell, TillCell: String): ExcelRange;
var From, Till: OleVariant;
begin
  if FromCell = '' then From := EmptyParam else From := FromCell;
  if TillCell = '' then Till := EmptyParam else Till := TillCell;
  Result := TheSheet.Range[From, Till];
end;

function ExcelCell(X, Y: Integer): string;
var HiPart, LoPart: Integer;
begin
  Result := '';
  HiPart := X;
  repeat
    LoPart := Pred(HiPart) mod 26;
    HiPart := Pred(HiPart) div 26;
    Result := Char(Ord('A') + LoPart) + Result;
  until HiPart = 0;
  Result := Result + IntToStr(Y);
end;

procedure ExcelDrawDataCell(TheSheet: _Worksheet; const ACell, Value: string);
begin
  TheSheet.Range[ACell, EmptyParam].Value := Value;
  TheSheet.Range[ACell, EmptyParam].VerticalAlignment := xlTop;
  TheSheet.Range[ACell, EmptyParam].HorizontalAlignment := xlLeft;
end;

procedure ExcelDrawBordersAll(TheSheet: _Worksheet; const FromCell, TillCell: String);
begin
  with ExcelGetRange(TheSheet, FromCell, TillCell) do
  begin
    Borders[xlDiagonalDown].LineStyle := xlNone;
    Borders[xlDiagonalUp].LineStyle := xlNone;
    Borders[xlEdgeLeft].LineStyle := xlContinuous;
    Borders[xlEdgeLeft].Weight := xlThin;
    Borders[xlEdgeLeft].ColorIndex := xlAutomatic;
    Borders[xlEdgeTop].LineStyle := xlContinuous;
    Borders[xlEdgeTop].Weight := xlThin;
    Borders[xlEdgeTop].ColorIndex := xlAutomatic;
    Borders[xlEdgeBottom].LineStyle := xlContinuous;
    Borders[xlEdgeBottom].Weight := xlThin;
    Borders[xlEdgeBottom].ColorIndex := xlAutomatic;
    Borders[xlEdgeRight].LineStyle := xlContinuous;
    Borders[xlEdgeRight].Weight := xlThin;
    Borders[xlEdgeRight].ColorIndex := xlAutomatic;
    Borders[xlInsideVertical].LineStyle := xlContinuous;
    Borders[xlInsideVertical].Weight := xlThin;
    Borders[xlInsideVertical].ColorIndex := xlAutomatic;
    Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    Borders[xlInsideHorizontal].Weight := xlThin;
    Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;
  end;
end;

procedure ExcelMergeCells(TheSheet: _Worksheet; const FromCell, TillCell: String);
begin
  with ExcelGetRange(TheSheet, FromCell, TillCell) do MergeCells := True;
end;

procedure ExcelPageSetup(TheSheet: _Worksheet; APaperSize, AnOrientation: Cardinal);
begin
  with TheSheet.PageSetup do
  begin
    PrintTitleRows := '';
    PrintTitleColumns := '';
    PrintArea := '';
    LeftHeader := '';
    CenterHeader := '';
    RightHeader := '';
    LeftFooter := '';
    CenterFooter := '';
    RightFooter := '';
    LeftMargin := TheSheet.Application.InchesToPoints(0.78740157480315, 0);
    RightMargin := TheSheet.Application.InchesToPoints(0.393700787401575, 0);
    TopMargin := TheSheet.Application.InchesToPoints(0.196850393700787, 0);
    BottomMargin := TheSheet.Application.InchesToPoints(0.196850393700787, 0);
    HeaderMargin := TheSheet.Application.InchesToPoints(0, 0);
    FooterMargin := TheSheet.Application.InchesToPoints(0, 0);
    PrintHeadings := False;
    PrintGridlines := False;
    PrintComments := xlPrintNoComments;
    //PrintQuality := 600;
    CenterHorizontally := False;
    CenterVertically := False;
    Orientation := AnOrientation;
    Draft := False;
    PaperSize := APaperSize;
    //FirstPageNumber := xlAutomatic;
    Order := xlDownThenOver;
    BlackAndWhite := False;
    Zoom := 100;
  end;
end;

procedure ExcelSetColWidth(TheSheet: _Worksheet; ACol: Integer; AWidth: Real);
begin
  TheSheet.Range[ExcelCell(ACol, 1), EmptyParam].Columns.ColumnWidth := AWidth;
end;

procedure ExcelSetRowHeight(TheSheet: _Worksheet; ARow: Integer; AHeight: Real);
begin
  TheSheet.Range[ExcelCell(1, ARow), EmptyParam].Rows.RowHeight := AHeight;
end;

procedure ExcelSetRangeAlignment(TheSheet: _Worksheet;
  const FromCell, TillCell: String; Horizontal, Vertical: Cardinal);
begin
  with ExcelGetRange(TheSheet, FromCell, TillCell) do
  begin
    HorizontalAlignment := Horizontal;
    VerticalAlignment := Vertical;
  end;
end;

procedure ExcelSetRangeWrapText(TheSheet: _Worksheet;
  const FromCell, TillCell: String);
begin
  with ExcelGetRange(TheSheet, FromCell, TillCell) do
    WrapText := True;
end;

end.
