unit PrintExcelReport;

interface
uses
  Excel2000, ExcelXP, DB, IBQuery, DBTables, MOSrvUtil, SysUtils, Variants, Windows;

procedure PrintExcursionAllList(PersonQry: TDataSet; 
  ExcelAppl: TExcelApplication; const TourName, TourTrip, TourGroup, GuideName: string; 
  TourDate: TDateTime);
procedure PrintExcursionAllListForGuide(PersonQry, ReportTourQry: TDataSet; 
  ExcelAppl: TExcelApplication; const TourName, TourTrip, TourGroup, GuideName: string;
  TourDate: TDateTime);

implementation

uses
  TourConsts, TourDbUn, TourStrMag, TourCmnlIf;

procedure PrintExcursionAllList(PersonQry: TDataSet; 
  ExcelAppl: TExcelApplication; const TourName, TourTrip, TourGroup, GuideName: string;
  TourDate: TDateTime);
const
  nFixedColCount = 6;
  nExcursColCount = 11;
  nReportColCount = nExcursColCount * 2 + nFixedColCount;
  nReportRowFirst = 9;
  nFirstRowHeights: array[1..nReportRowFirst] of Real = (
    17.25, 14.25, 15.25, 14.25, 14.25, 14.25, 14.25, 14.25, 25.5);
  nTotalRowHeight = 18.0;
  nCountColWidth = 2.57;
  nFixedColWidths: array[1..nFixedColCount] of Real = (
    6.43, 3.57, 23.57, 9.14, 3.0, 3.5);
  sFixedColTitles: array[1..nFixedColCount] of String = (
    SPlaceFrmPrintGuideTitle32, SPlaceFrmPrintGuideTitle0,
    SPlaceFrmPrintGuideTitle1,
    SPlaceFrmPrintGuideTitle8, SPlaceFrmPrintGuideTitle34, 
    SPlaceFrmPrintGuideTitle40);
  lcid = LOCALE_USER_DEFAULT;  
var
  IWorkbook: _Workbook;
  ISheet: Excel2000._Worksheet;
  CurRow, I, C: Integer; 
  CurrShort: string;
begin
  if PersonQry is TIBQuery then UpdateQuery(PersonQry as TIBQuery, False, True)
  else UpdateQuery(PersonQry as TQuery);
  try
    with ExcelAppl do
    begin
      Connect;
      Visible[xlLCID] := True;
      IWorkbook := Workbooks.Add(xlWBATWorksheet, xlLCID);
      IWorkbook.Title[xlLCID] := CyrString(TourName);
      ISheet := IWorkbook.Sheets[1] as Excel2000._Worksheet;
      ISheet.Name := FormatDateTime('dd.mm.yy hh.nn', TourDate);
      ExcelPageSetup(ISheet, xlPaperA4 {xlPaperA3}, xlLandscape);
      for I := 1 to nFixedColCount do
      begin
        ExcelSetColWidth(ISheet, I, nFixedColWidths[I]);
        ISheet.Range[ExcelCell(I, nReportRowFirst), EmptyParam].Value :=
          sFixedColTitles[I];
      end;
      for I := 1 to nReportRowFirst do
        ExcelSetRowHeight(ISheet, I, nFirstRowHeights[I]);

      ISheet.Range[ExcelCell(5, 1), EmptyParam].Value := 'Список по екскурсіях';       
      ISheet.Range[ExcelCell(2, 3), EmptyParam].Value := TourName;
      ISheet.Range[ExcelCell(2, 4), EmptyParam].Value := TourTrip;
      ISheet.Range[ExcelCell(2, 5), EmptyParam].Value := TourGroup;
      ISheet.Range[ExcelCell(2, 6), EmptyParam].Value :=
          FormatDateTime('Відправлення dd.mm.yyyy hh:nn', TourDate);
      ISheet.Range[ExcelCell(2, 7), EmptyParam].Value := 
          Format('Керівник групи: %s', [GuideName]);
      ISheet.Range[ExcelCell(2, 8), EmptyParam].Value := 
        Format(STourMainReportTouristCount, [PersonQry.RecordCount]);

      ISheet.Range[ExcelCell(5, 1), ExcelCell(5, 1)].Font.Bold := True;
      ISheet.Range[ExcelCell(5, 1), ExcelCell(5, 1)].Font.Size := 14;
      ISheet.Range[ExcelCell(2, 1), ExcelCell(2, Pred(nReportRowFirst))].Font.Bold := True;
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(2, 1), ExcelCell(2, Pred(nReportRowFirst)), xlLeft, xlCenter);
      with ISheet.Range[ExcelCell(1, nReportRowFirst), ExcelCell(nReportColCount, nReportRowFirst)] do
      begin
        HorizontalAlignment := xlCenter;
        VerticalAlignment := xlCenter;
        WrapText := True;
        Font.Bold := True;
      end;
      CurRow := nReportRowFirst + 1;
      while not PersonQry.Eof do
      begin
        if CurRow > nReportRowFirst + 1 then
          ISheet.Range[ExcelCell(1, CurRow), EmptyParam].Rows.Insert(xlDown);
        ISheet.Range[ExcelCell(1, CurRow), EmptyParam].Value := PersonQry.FieldByName('ORDERID').AsString;
        ISheet.Range[ExcelCell(2, CurRow), EmptyParam].Value := PersonQry.FieldByName('PLACENO').Value;
        ISheet.Range[ExcelCell(3, CurRow), EmptyParam].Value := PersonQry.FieldByName('TOURISTNAME').Value;
        with PersonQry.FieldByName('TOURISTBIRTHDATE') do
          if not IsNull then
          begin
            ISheet.Range[ExcelCell(4, CurRow), EmptyParam].Value := DisplayText;
            ISheet.Range[ExcelCell(5, CurRow), EmptyParam].Value :=
              YearAgeByDate(Value, TourDate);
          end;
//        ISheet.Range[ExcelCell(6, CurRow), EmptyParam].Value := PersonQry.FieldByName('TRIPCOUNT').AsString;
        if PersonQry.FindField('GarantCurrId') <> nil then 
          case PersonQry.FieldByName('GarantCurrId').AsInteger of
          8:  CurrShort := ' $'; 
          37: CurrShort := ' Є';  
          end;                   
        if PersonQry.FindField('GARANTPAY') <> nil then 
          ISheet.Range[ExcelCell(6, CurRow), EmptyParam].Value := 
            PersonQry.FieldByName('GARANTPAY').AsString + CurrShort;
        Inc(CurRow);
        PersonQry.Next;
      end;
      ISheet.Range[ExcelCell(1, CurRow), EmptyParam].Value := STourMainReportTouristCount1;
      ISheet.Range[ExcelCell(1, CurRow + 1), EmptyParam].Value := STourMainReportAllSum;
      ISheet.Range[ExcelCell(1, CurRow), ExcelCell(1, CurRow + 1)].Font.Bold := True;
      ExcelSetRowHeight(ISheet, CurRow, nTotalRowHeight);
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(1, CurRow), ExcelCell(2, CurRow + 1), xlRight, xlCenter);
      for I := 1 to nExcursColCount do
      begin
        C := I * 2 + nFixedColCount - 1;
        ExcelSetColWidth(ISheet, C, nCountColWidth);
        ExcelMergeCells(ISheet,
          ExcelCell(C, nReportRowFirst), ExcelCell(Succ(C), nReportRowFirst));
        ExcelMergeCells(ISheet, ExcelCell(C, CurRow), ExcelCell(Succ(C), CurRow));
        ExcelMergeCells(ISheet, ExcelCell(C, CurRow + 1), ExcelCell(Succ(C), CurRow + 1));
      end;
      ExcelMergeCells(ISheet, ExcelCell(1, CurRow), ExcelCell(3, CurRow));
      ExcelMergeCells(ISheet, ExcelCell(1, CurRow + 1), ExcelCell(3, CurRow + 1));
      ExcelMergeCells(ISheet, ExcelCell(4, CurRow), ExcelCell(5, CurRow));
      ExcelMergeCells(ISheet, ExcelCell(4, CurRow + 1), ExcelCell(5, CurRow + 1));
      ExcelDrawBordersAll(ISheet,
         ExcelCell(1, nReportRowFirst), ExcelCell(nReportColCount, CurRow + 1));
      ISheet.Range[ExcelCell(1, nReportRowFirst), ExcelCell(nReportColCount, CurRow + 1)].Font.Size := 10;
//         ExcelCell(1, nReportRowFirst), ExcelCell(nReportColCount, CurRow + 1));
    end;
  finally
    PersonQry.Close;
  end;
end;

procedure PrintExcursionAllListForGuide(PersonQry, ReportTourQry: TDataSet; 
  ExcelAppl: TExcelApplication; const TourName, TourTrip, TourGroup, GuideName: string;
  TourDate: TDateTime);
const
  nFixedColCount = 14;
  nReportRowFirst = 9;
  nFirstRowHeights: array[1..nReportRowFirst] of Real = (
    17.25, 14.25, 15.25, 14.25, 14.25, 14.25, 14.25, 14.25, 25.5);
  nTotalRowHeight = 18.0;
  nCountColWidth = 2.57;
  nFixedColWidths: array[1..nFixedColCount] of Real = (
    6.43, 3.57, 23.57, 9.14, 3.0, 3.5, 8.43, 14, 8.43, 11.43, 17.14, 8.43, 8.43, 53.43);
  sFixedColTitles: array[1..nFixedColCount] of String = (
    SPlaceFrmPrintGuideTitle32, SPlaceFrmPrintGuideTitle0,
    SPlaceFrmPrintGuideTitle1, SPlaceFrmPrintGuideTitle8, 
    SPlaceFrmPrintGuideTitle34, SPlaceFrmPrintGuideTitle35, 
    SPlaceFrmPrintGuideTitle9, SPlaceFrmPrintGuideTitle36,
    SPlaceFrmPrintGuideTitle37, SPlaceFrmPrintGuideTitle38,
    SPlaceFrmPrintGuideTitle6, SPlaceFrmPrintGuideTitle23,
    SPlaceFrmPrintGuideTitle39, SPlaceFrmPrintGuideTitle14);
var
  IWorkbook: _Workbook;
  ISheet: Excel2000._Worksheet;
  CurRow, I, C, OrderId: Integer; 
  BeginMarge, TourId: Integer;
  PhoneNo: string;
  DebtUAH, DebtEuro: Double;
begin
  if PersonQry is TIBQuery then UpdateQuery(PersonQry as TIBQuery, False, True)
  else UpdateQuery(PersonQry as TQuery);
  if ReportTourQry <> nil then
    if ReportTourQry is TIBQuery then UpdateQuery(ReportTourQry as TIBQuery)
    else UpdateQuery(ReportTourQry as TQuery);
  
  try
    with ExcelAppl do
    begin
      Connect;
      Visible[xlLCID] := True;
      IWorkbook := Workbooks.Add(xlWBATWorksheet, xlLCID);
      IWorkbook.Title[xlLCID] := CyrString(TourName);
      ISheet := IWorkbook.Sheets[1] as Excel2000._Worksheet;
      ISheet.Name := FormatDateTime('dd.mm.yy hh.nn', TourDate);
      ExcelPageSetup(ISheet, xlPaperA4{xlPaperA3}, xlLandscape);
      for I := 1 to nFixedColCount do
      begin
        ExcelSetColWidth(ISheet, I, nFixedColWidths[I]);
        ISheet.Range[ExcelCell(I, nReportRowFirst), EmptyParam].Value :=
          sFixedColTitles[I];
      end;
      for I := 1 to nReportRowFirst do
        ExcelSetRowHeight(ISheet, I, nFirstRowHeights[I]);
      ISheet.Range[ExcelCell(5, 1), EmptyParam].Value := 'Список для керівника групи';
      ISheet.Range[ExcelCell(2, 3), EmptyParam].Value := TourName;
      ISheet.Range[ExcelCell(2, 4), EmptyParam].Value := TourTrip;
      ISheet.Range[ExcelCell(2, 5), EmptyParam].Value := TourGroup;
      ISheet.Range[ExcelCell(2, 6), EmptyParam].Value :=
          FormatDateTime('Відправлення dd.mm.yyyy hh:nn', TourDate);
      ISheet.Range[ExcelCell(2, 7), EmptyParam].Value := 
          Format('Керівник групи: %s', [GuideName]);
      ISheet.Range[ExcelCell(2, 8), EmptyParam].Value := 
        Format(STourMainReportTouristCount, [PersonQry.RecordCount]);

      ISheet.Range[ExcelCell(5, 1), ExcelCell(5, 1)].Font.Bold := True;
      ISheet.Range[ExcelCell(5, 1), ExcelCell(5, 1)].Font.Size := 14;
      ISheet.Range[ExcelCell(2, 1), ExcelCell(2, Pred(nReportRowFirst))].Font.Bold := True;
      
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(2, 1), ExcelCell(2, Pred(nReportRowFirst)), xlLeft, xlCenter);
      with ISheet.Range[ExcelCell(1, nReportRowFirst), ExcelCell(nFixedColCount, nReportRowFirst)] do
      begin
        HorizontalAlignment := xlCenter;
        VerticalAlignment := xlCenter;
        WrapText := True;
        Font.Bold := True;
      end;
      CurRow := nReportRowFirst + 1;
      OrderId := 0;      
      BeginMarge := CurRow;
      DebtUAH := 0;
      DebtEuro := 0;
      TourId := 0;
      while not PersonQry.Eof do
      begin
        if CurRow > nReportRowFirst + 1 then
          ISheet.Range[ExcelCell(1, CurRow), EmptyParam].Rows.Insert(xlDown);
        if OrderId <> PersonQry.FieldByName('ORDERID').AsInteger then begin
          ISheet.Range[ExcelCell(1, CurRow), EmptyParam].Value := PersonQry.FieldByName('ORDERID').AsString;
          if PersonQry.Fields.FindField('TOURGROUPID') <> nil then 
            ISheet.Range[ExcelCell(9, CurRow), EmptyParam].Value := PersonQry.FieldByName('TOURGROUPID').AsString;
          if PersonQry.Fields.FindField('SHORTTOURNAME') <> nil then 
            ISheet.Range[ExcelCell(10, CurRow), EmptyParam].Value := PersonQry.FieldByName('SHORTTOURNAME').AsString;
          ISheet.Range[ExcelCell(11, CurRow), EmptyParam].Value := PersonQry.FieldByName('CLIENTNAME').AsString;          
          with PersonQry.FieldByName('CalcOrderDebtUAH') do
          if AsFloat > 0 then begin 
            ISheet.Range[ExcelCell(12, CurRow), EmptyParam].Value :=  AsFloat;          
            DebtUAH := DebtUAH + AsFloat;
          end;
          with PersonQry.FieldByName('CalcOrderDebtEURO') do
          if AsFloat > 0 then begin
            ISheet.Range[ExcelCell(13, CurRow), EmptyParam].Value := AsFloat;          
            DebtEURO := DebtEURO + AsFloat;
          end;
          ISheet.Range[ExcelCell(14, CurRow), EmptyParam].Value := PersonQry.FieldByName('ORDERHIDDENMEMO').AsString;          
          OrderId := PersonQry.FieldByName('ORDERID').AsInteger;
          if BeginMarge <> CurRow then begin
            ExcelMergeCells(ISheet, ExcelCell(1, BeginMarge), ExcelCell(1, CurRow - 1));
            ExcelMergeCells(ISheet, ExcelCell(9, BeginMarge), ExcelCell(9, CurRow - 1));
            ExcelMergeCells(ISheet, ExcelCell(10, BeginMarge), ExcelCell(10, CurRow - 1));
            ExcelMergeCells(ISheet, ExcelCell(11, BeginMarge), ExcelCell(11, CurRow - 1));
            ExcelMergeCells(ISheet, ExcelCell(12, BeginMarge), ExcelCell(12, CurRow - 1));
            ExcelMergeCells(ISheet, ExcelCell(13, BeginMarge), ExcelCell(13, CurRow - 1));
            ExcelMergeCells(ISheet, ExcelCell(14, BeginMarge), ExcelCell(14, CurRow - 1));
          end;
          BeginMarge := CurRow;
        end;
        ISheet.Range[ExcelCell(2, CurRow), EmptyParam].Value := PersonQry.FieldByName('PLACENO').Value;
        ISheet.Range[ExcelCell(3, CurRow), EmptyParam].Value := PersonQry.FieldByName('TOURISTNAME').Value;
        with PersonQry.FieldByName('TOURISTBIRTHDATE') do
          if not IsNull then
          begin
            ISheet.Range[ExcelCell(4, CurRow), EmptyParam].Value := DisplayText;
            ISheet.Range[ExcelCell(5, CurRow), EmptyParam].Value :=
              YearAgeByDate(Value, TourDate);
          end;
        ISheet.Range[ExcelCell(6, CurRow), EmptyParam].Value := PersonQry.FieldByName('TRIPCOUNT').AsString;
        ISheet.Range[ExcelCell(7, CurRow), EmptyParam].Value := PersonQry.FieldByName('TOURISTPASSPORT').AsString;

        PhoneNo := EmptyStr;
        with PersonQry, FieldByName('ADDITPHONE') do
        if AsString <> EmptyStr then
          PhoneNo := MakePhoneNo(
              FieldByName('ADDITCNTRYCODE').AsString, FieldByName('ADDITAREACODE').AsString, AsString);
        ISheet.Range[ExcelCell(8, CurRow), EmptyParam].Value := PhoneNo;
        
        Inc(CurRow);
        PersonQry.Next;
      end;
//      ISheet.Range[ExcelCell(1, CurRow), EmptyParam].Value :=
//        Format(STourMainReportTouristCount, [CurRow - nReportRowFirst - 1]);
      ISheet.Range[ExcelCell(11, CurRow), EmptyParam].Value := STourMainReportAllDebt;
      ISheet.Range[ExcelCell(1, CurRow), ExcelCell(11, CurRow)].Font.Bold := True;
      if DebtUAH > 0 then ISheet.Range[ExcelCell(12, CurRow), EmptyParam].Value := DebtUAH;
      if DebtEURO > 0 then ISheet.Range[ExcelCell(13, CurRow), EmptyParam].Value := DebtEURO;         

      ExcelSetRowHeight(ISheet, CurRow, nTotalRowHeight);
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(1, CurRow), ExcelCell(2, CurRow), xlRight, xlCenter);
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(1, nReportRowFirst + 1), ExcelCell(13, CurRow), xlCenter, xlTop);
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(3, nReportRowFirst + 1), ExcelCell(3, CurRow), xlLeft, xlTop);
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(11, nReportRowFirst + 1), ExcelCell(11, CurRow), xlLeft, xlTop);
{      ExcelSetRangeAlignment(ISheet,
        ExcelCell(9, nReportRowFirst + 1), ExcelCell(13, CurRow), xlCenter, xlCenter);}
      ExcelSetRangeAlignment(ISheet,
        ExcelCell(11, CurRow), ExcelCell(11, CurRow), xlCenter, xlCenter);

      ExcelMergeCells(ISheet, ExcelCell(1, CurRow), ExcelCell(3, CurRow));
      ExcelMergeCells(ISheet, ExcelCell(4, CurRow), ExcelCell(10, CurRow));
      ExcelDrawBordersAll(ISheet,
         ExcelCell(1, nReportRowFirst), ExcelCell(nFixedColCount, CurRow));
      ISheet.Range[ExcelCell(1, nReportRowFirst), ExcelCell(nFixedColCount, CurRow)].Font.Size := 10;

      ExcelSetRangeWrapText(ISheet,
        ExcelCell(11, nReportRowFirst + 1), ExcelCell(11, CurRow - 1));
      ExcelSetRangeWrapText(ISheet,      
        ExcelCell(14, nReportRowFirst + 1), ExcelCell(14, CurRow - 1));
      CurRow := CurRow + 2;
      if ReportTourQry <> nil then
        while not ReportTourQry.Eof do begin
         ISheet.Range[ExcelCell(1, CurRow), EmptyParam].Value := ReportTourQry.FieldByName('ShortTourName').AsString;
         ISheet.Range[ExcelCell(3, CurRow), EmptyParam].Value := ReportTourQry.FieldByName('TourName').AsString;
         Inc(CurRow);
         ReportTourQry.Next;
        end;        
    end;
  finally
    PersonQry.Close;
    if ReportTourQry <> nil then ReportTourQry.Close;
  end;
end;

end.
 