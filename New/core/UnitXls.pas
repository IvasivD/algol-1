unit UnitXls;

interface
uses ComObj,Variants,Dialogs,Windows,sysUtils,PSApi ,Forms,cxGridTableView,cxMaskEdit,cxStandardMask,
    cxGridRows,Messages,cxFilter,Classes,Graphics,Printers,WinSpool,DB;

const                                                                                        
     xlEdgeLeft=7;
     xlEdgeTop=8;
     xlEdgeBottom=9;
     xlEdgeRight=10;

     xlContinuous=1;
     xlDash = -4115;
     xlDashDot = 4;
     xlDashDotDot = 5;
     xlDot = -4118;
     xlDouble = -4119;
     xlLineStyleNone = -4142;
     xlSlantDashDot = 13;

     xlHairline = 1;
     xlMedium   = -4138;
     xlThick    = 4;
     xlThin     = 2;

     xlAscending=1;
     xlDescending=2;

     xlCenter = -4108;
     xlLeft   = -4131;
     xlRight  = -4152;

     xlVBottom=-4107;
     xlVCenter=-4108;
     xlVDistributed=-4117;
     xlVJustify=-4130;
     xlVTop=-4160;

     xlNormal = -4143 ;
     xlNoChange = 1 ;
     xlShared = $00000002;
     xlUserResolution = 1;

     xlDefColorBG=16777215;
     xlPortrait=1;
     xlLandscape=2;


     xlDown=-4121;
     xlToLeft=-4159;
     xlToRight=-4161;
     xlUp=-4162;

type TclxAlihment=(clxNone,clxLeft,clxCenter,clxRight);
     TclxVerAlihment=(clxVNone,clxVTop,clxVCenter,clxVBottom);
     //TBorderCell=(clxBorderNone,clxBorderLeft,clxBorderRight,clxBorderTop,clxBorderBottom,clxBorderBoth);

  TMyCellProperty=record
     CellFormat:String;
     Text:string;
     FontSize:Integer;
     FontBold:Boolean;
     HorizontalAlignment:TclxAlihment;
  end;

  PMyCellBorder = ^TMyCellBorder ;
  TMyCellBorder=record
      BorderLeft:boolean;
      BorderTop:boolean;
      BorderBottom:boolean;
      BorderRight:boolean;

      LineStyle:integer;
      LineWidth:integer;
  end;

  TMyFieldDBAndColXls = record
     IndCol:integer;
     fieldName:string;
  end;
  TMyFieldDBAndColXlsArr = array of TMyFieldDBAndColXls;

  function  OpenXLS(AfileName:string;OpenExcel:Boolean;NewCountSheet:Integer=1):variant;
  procedure CreateNewFileXLS(AFileName:string;Excel:Variant;CountSheet:Integer=1);
  function  WorkBookIndex(Excel:Variant;WorkBookName: Ansistring;CompareWithPath:Boolean=true): integer;
  Procedure HideFocuseCellExcel(ExcelApp:Variant);
  procedure CloseXLS(Excel:Variant);
  Procedure ClosedWorkBooks(ExcelApp:Variant;AFileName:String);

  //procedure HideFocusAll(ExcelApp:Variant);
  Procedure SaveWorkBooks(ExcelApp:Variant;AFileName:String;aNewFileName:string='');
  Function  ReturnRealLastColInExcel(ExcelApp:variant;SheetNumber:Integer):integer;
  function  ReturnRealLastRowInExcel(ExcelApp:variant;SheetNumber:Integer;RealCol:Integer=-1):integer;
  Function  CloseFileExlIFOpen(FileExcel:String;ExcelApp:variant;CompareWithPath:Boolean=true):boolean;

  Function  GetMaxWidthTextIncolumn(ExcelApp:Variant;SheetNumber:integer;Column:integer):integer;
  Procedure ShowTotalSum(ExcelApp:variant; RowBegin,RowEnd,Col:integer;RowTotal:Integer;isBold:Boolean=false;Alignment:Integer=xlLeft;CellFormat:string='@');

  Procedure FormatRowsHeight(ExcelApp:Variant;SheetNumber:Integer;ExtHeight:integer=0);
  procedure FormatColumnWidth(ExcelApp:Variant;SheetNumber:Integer;ExtWidth:integer=0);
  Procedure SetWidthColumn(ExcelApp:Variant;SheetNumber,aColumn:integer;aWidth:real);
  Procedure SetHeightRow(ExcelApp:Variant;SheetNumber,aRow,aHeight:Integer);
  Procedure SetWidthAllColumn(ExcelApp:Variant;SheetNumber:integer;aWidth:real);
  Procedure SetMerge(Excel:variant;SheetNumber:integer;BeginRow,BeginCol,EndRow,EndCol:Integer;En:Boolean=true);

  Procedure SortXLSColumns(ExcelApp:variant;RowBegin,ColBegin,RowEnd,ColEnd, SortColumn:Integer; ASort:Integer);
  Procedure ShowBorderCell(ExcelApp:variant;SheetNumber:integer; Row,Col:Integer;BorderCell:TMyCellBorder);
  Procedure ShowBorderRange(ExcelApp:variant; Range:string;WorkSheet:Integer; BorderCell:TMyCellBorder;JastAroundVer:boolean=false;JastAroundHor:boolean=false);
  Function  GetCellBorder(ExcelApp:variant;WorkSheet,Col:integer):TMyCellBorder;

  Procedure SetNumberFormatForCol(ExcelApp:variant;WorkBookNumber:integer;aColNumber:Integer;NumberFormat:String);
  Procedure ShowBorders(ExcelApp:variant;SheetNumber, Row,ColBegin,ColEnd:integer;BorderCell:TMyCellBorder);
  Procedure ShowAllBorderds(ExcelApp:variant;SheetNumber,LineWidth,LineStyle:Integer;JustAroundVer:Boolean=false;JustAroundHor:Boolean=false);
  Procedure ShowTextXLS(ExcelApp:variant;SheetNumber:integer;aRow,aCol:Integer; Atext:String;FontSize:Integer=10; isBold:Boolean=false;Alignment:Integer=xlLeft;VAligment:integer=xlVTop;BorderCell:PMyCellBorder=nil);
  Function  GetTextXls(ExcelApp:variant;aRow,aCol:Integer):TMyCellProperty;
  Procedure SetPrinterName(ExcelApp:Variant;PrinterName:WideString);
  Procedure SetPrintPage(ExcelApp:Variant;SheetNumber,PageSize:integer);
  Procedure SetAreaPrintPage(ExcelApp:Variant;SheetNumber:integer; aTop,aLeft,aRight,aBottom:real);
  function  ConvertCellToColumnName(Row, Column: integer): string;
  Procedure BiuldHeaderViewExl(ExcelApp:Variant;SheetNumber,PosHeaderRow,PosHeaderCol:Integer;AcolCaption:array of String;FontSize:array of Integer;BorderCell:PMyCellBorder=nil);
  Procedure BiuldDataSelViewExl(ExcelApp:Variant;aView:TcxGRidTableView;PosDataRow,PosHeaderCol:Integer;AcolCaption:array of String;
            AColFont:array of Integer;AColBold:array of boolean;AColAlignment:array of integer; AColVerAlignment:array of integer; BorderCell:PMyCellBorder=nil);

  Procedure ExportSelectViewToExl(FileExcel:String;aView:TcxGRidTableView;PosHeaderRow,PosDataRow:Integer;
                                  AcolCaption:array of String;AColFont:array of integer; AColBold:array of boolean;AColAlignment,AColVerAlignment:array of integer);
  Procedure AddPageBreaks(ExcelApp:Variant;SheetNumber,PosDataRow:Integer);
  Procedure SetPageBreakForDifferentCol(ExcelApp:Variant;SheetNumber,aBeginRow,aColInd:integer);
  Procedure InsertRow(ExcelApp:Variant;SheetNumber,PosDataRow,CountCol,CountRow:Integer;BorderCell:PMyCellBorder=nil);
  Procedure InsertCol(ExcelApp:Variant;SheetNumber,PosDataCol,CountCol:Integer;BorderCell:PMyCellBorder=nil);
  Procedure SetEmptyRowsForDifferentCol(ExcelApp:Variant;SheetNumber,aBeginRow,aColInd,CountEmptyRow,CountCol:integer;BorderCell:PMyCellBorder=nil);
  Procedure PrintXLS(aFileName:String;ExcelOpen:Boolean);
  Procedure FilterColumnByCaptionColViewFromExl(FileExcel:String;aView:TcxGRidTableView;PosHeaderRow,PosDataRow:Integer;CaptView,CaptExl:String;CloseExcelAfterFinish:Boolean=true);
  procedure FormatAlingmentxls(ExcelApp:Variant;SheetNumber:integer;masColAlingment:array of TclxAlihment;HederAligment:TclxAlihment=clxNone;HederVerAligment:TclxVerAlihment=clxVNone);
  Procedure FormatFontXls(ExcelApp:Variant;MasColBold:array of Boolean;HederBold:Boolean;WorkBookNumber:Integer);
  Procedure FreezeRange(ExcelApp:Variant;SheetNumber:integer;Row,Col:Integer);
  function  AddNewSheet(Excel:Variant;Caption:widestring) : Variant;
  function  SetSheetActive(Excel:variant;NumList : integer):Variant;
  Procedure DeleteAllSheet(Excel:variant);
  Procedure CreateAllSheets(Excel:variant;CountSheet:integer);
  procedure SetNewNameSheet(Excel:variant;SheetNumber:integer;NewName:widestring);
  Procedure SetShrinkToFit(Excel:variant;SheetNumber:integer;BeginRow,BeginCol,EndRow,EndCol:Integer;Enabled:boolean);
  Procedure FormatAllShrinkToFit(Excel:variant;SheetNumber:integer;Enabled:boolean);
  Procedure FormatAllOrientation(Excel:variant;SheetNumber,Orientation:integer);
  Procedure SetFontToCells(Excel:variant;SheetNumber,BeginRow,BeginCol,EndRow,EndCol:Integer;aFont:TFont);
  Procedure SetBGColor(Excel:variant;SheetNumber,BeginRow,BeginCol,EndRow,EndCol:Integer;aColor:TColor);
  Procedure InsertSplitCol(ExcelApp:variant;SheetNumber,PosSplitCol,CountsplitCol:Integer;WidthSplitCol:Real);
  Function  GetCountPage(ExcelApp:variant;SheetNumber:Integer):integer;
  Procedure PageOrientation(Excel:variant;SheetNumber:integer; Orientation:integer);
  Function  GetCountHBreaks(ExcelApp:variant;SheetNumber:Integer):Integer;
  Function  GetFirstCellAfterHBreaks(ExcelApp:variant;SheetNumber,BreakNumber:Integer):Integer;
  Function  CheckRowIsHBreaks(ExcelApp:variant;SheetNumber,RowCheck:integer):Boolean;
  Procedure CopyRow(ExcelApp:variant;SheetNumber,CopyFromRow,CopyToRow:Integer;InsertRow:Boolean=true);
  Procedure ClearRows(ExcelApp:variant;SheetNumber:Integer;StartRow,EndRow:Integer;UnmErge:Boolean=true;UnBorder:boolean=true);
  PRocedure SaveAsPDF(ExcelApp:variant;SheetNumber:Integer;PdfFileName:String);
  procedure AddToShemaField( IndCol:Integer;FieldName:String;var ShemaFieldndex:TMyFieldDBAndColXlsArr );
  procedure ReadDataFromXLS(CationWaitProgres:Widestring; FileExcel:String;StartRow:Integer; Datatset:TDataset; ShemaFieldndex:TMyFieldDBAndColXlsArr);

  var WindowStateXLSOld:variant;
implementation

uses UnitProc, cxGridCustomTableView, FrmProgress;
//******************************************************************************
function ConvertCellToColumnName(Row, Column: integer): string;

begin
// Max - 2 chars
  Column := Column - 1;
  if Column < 26 then
    Result := Chr(Ord('A') + Column)
  else
    Result := Chr(Ord('A') + (Column div 26) - 1) + Chr(Ord('A') + (Column mod 26));
  Result := Result + IntToStr(Row);
end;
//******************************************************************************
procedure CreateNewFileXLS(AFileName:string;Excel:Variant;CountSheet:Integer=1);
var Fh:integer;
    InsideCreate:Boolean;
begin
  if VarIsEmpty(Excel) = true then
     begin
      Excel := CreateOleObject('Excel.Application');
      InsideCreate:=true;
     end
      else   InsideCreate:=false;
   //***************************************************
   Excel.SheetsInNewWorkbook := CountSheet;
   Excel.WorkBooks.Add;
   Excel.WorkBooks[Excel.WorkBooks.Count].SaveAs(AfileName);
   if VarIsEmpty(Excel) then
   //***************************************************
   if InsideCreate then
      Excel:=unassigned;
end;
//******************************************************************************
procedure AddWorkBook(WorkBookName: Ansistring;Excel:Variant);
var
  k: integer;
begin
  if VarIsEmpty(Excel) = true then
  begin
    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := true;
  end;
  k := WorkBookIndex(Excel,WorkBookName);
  if k = 0 then
  begin
    Excel.Workbooks.Add;
    Excel.ActiveWorkbook.SaveCopyAs(FileName := WorkBookName);
    Excel.ActiveWorkbook.Close;
    Excel.Workbooks.Open(WorkBookName);
  end;
  //else
  //  MessageDlg('Book Allrady exists.', mtWarning, [mbOk], 0);
end;
//******************************************************************************
function WorkBookIndex(Excel:Variant;WorkBookName: Ansistring;CompareWithPath:Boolean=true): integer;
var
  i, n: integer;
begin
  //проверка на наличие книги с этим именем
  n := 0;
  if VarIsEmpty(Excel) = false then
    for i := 1 to Excel.WorkBooks.Count do
      if (CompareWithPath)and(CompareText(Excel.WorkBooks[i].FullName,WorkBookName)=0) or
         (not CompareWithPath)and(CompareText(Excel.WorkBooks[i].Name,ExtractFileName(WorkBookName))=0) then
          begin
            n := i;
            break;
          end;
  WorkBookIndex := n;
end;
//******************************************************************************
Function MyFindHandleWindow(ExeName,ClassName:String):THandle;
var
 hWnd: THandle;
 szClassName: array[0..MAX_PATH] of Char;
 szFilePath: array[0..MAX_PATH] of Char;
 hProcess,dwID: THandle;
begin
   hWnd := GetWindow(GetDesktopWindow, GW_CHILD);
  // hWnd := FindWindow(nil,'ABBYY Screenshot Reader');
repeat
   result:=0;
   GetWindowThreadProcessId(hWnd,dwId);
   hProcess := OpenProcess(PROCESS_ALL_ACCESS, True, dwID);
   GetModuleFileNameEx(hProcess,0, szFilePath, MAX_PATH);
   CloseHandle (hProcess);
   GetClassName(hWnd, szClassName, MAX_PATH);
   if (ExtractFileName(szFilePath)=ExeName) and (szClassName=ClassName)
     then
       begin
        result:=hWnd;
        break;
       end;
   hWnd := GetNextWindow(hWnd,GW_HWNDNEXT);
until hWnd=0;
end;
//******************************************************************************
Procedure HideFocuseCellExcel(ExcelApp:Variant);
var //JustFileame:WideString;
    ExcelHandle:dword;
begin
   //JustFileame:= ExtractFileName(AFileName);
   //ReplaseOn(JustFileame,ExtractFileExt(AFileName),'');
  // if FileIsOpen(AFileName) then
       begin
        ExcelHandle:=MyFindHandleWindow('EXCEL.EXE','XLMAIN');
        if ExcelHandle<>0 then
           begin
             PostMessage(ExcelHandle, WM_KEYDOWN, VK_ESCAPE, 0);
             PostMessage(ExcelHandle, WM_KEYUP, VK_ESCAPE, 0);
           end;
       end;
end;
{OfficeTooltip
IME
MsoCommandBarPopup
MsoCommandBarShadow
MsoCommandBarShadow
XLMAIN
ActiveClipBoard
MsoStdCompMgr
OleDdeWndClass
ThunderMain
ComboLBox
GDI+ Hook Window Class}
//******************************************************************************
procedure CloseXLS(Excel:Variant);
begin
  Excel.WindowState:=WindowStateXLSOld;
  Excel.ActiveWorkbook.Close;
  //Excel.Quit;
  //Excel:=unassigned;
end;
//******************************************************************************
Procedure ClosedWorkBooks(ExcelApp:Variant;AFileName:String);
var i:integer;
begin
  try
    for i:=1 to ExcelApp.WorkBooks.Count do
        if CompareText(ExcelApp.WorkBooks.Item[i].FullName,AfileName)=0 then
           begin
             ExcelApp.WorkBooks.Item[i].Close;
             break;
           end;
  except
  end;
end;
//******************************************************************************
Procedure SaveWorkBooks(ExcelApp:Variant;AFileName:String;aNewFileName:string='');
var i:integer;
begin
  try          
    for i:=1 to ExcelApp.WorkBooks.Count do
        if CompareText(ExcelApp.WorkBooks.Item[i].FullName,AfileName)=0 then
           begin
             if aNewFileName='' then ExcelApp.WorkBooks.Item[i].save
                else
                  //ExcelApp.WorkBooks.Item[i].SaveAs(aNewFileName, xlNormal,'','',false,false,xlShared,xlUserResolution,false,EmptyParam,EmptyParam,EmptyParam);
                  ExcelApp.WorkBooks.Item[i].SaveAs(aNewFileName, xlNormal, EmptyParam, EmptyParam, EmptyParam, EmptyParam, xlNoChange, EmptyParam, EmptyParam, EmptyParam);
             break;
           end;
  except
  end;
end;
//******************************************************************************
function OpenXLS(AfileName:string;OpenExcel:Boolean;NewCountSheet:Integer=1):variant;
var ExcelApp:variant;
    k:integer;
    IsNewOpen:Boolean;
    i:integer;
    SaveVisible:Boolean;
begin
  try //1
   IsNewOpen:=false;
   ExcelApp := GetActiveOleObject('Excel.Application');
  except //1
   try //2
    ExcelApp := CreateOleObject('Excel.Application');
    IsNewOpen:=true;
    //ExcelApp.Application.EnableEvents := false;
   except //2
    raise Exception.Create('Can+'+#39+'t run Excel');
   end; //2
  end; //1
 //**************************************************
  if not IsNewOpen then
     begin
      HideFocuseCellExcel(ExcelApp);
      SaveWorkBooks(ExcelApp, AFileName);
     end;
 //**************************************************
  try
   if FileExists(AfileName) then
      ExcelApp.Workbooks.Open(AfileName)
       else
           CreateNewFileXLS(AFileName,ExcelApp,NewCountSheet);
  Except

  End;
 //**************************************************
  HideFocuseCellExcel(ExcelApp);

  ExcelApp.DisplayAlerts :=true;       //const xlMaximized = $FFFFEFD7 (или -4137) - развернуть Excel на весь экран.
  WindowStateXLSOld:=ExcelApp.WindowState;
  if OpenExcel then
     begin
        ExcelApp.WindowState :=-4137;//$FFFFEFD4;      //const xlNormal = $FFFFEFD1 (или -4143) - восстановить Excel.
                                      //const xlMinimized = $FFFFEFD4 (или -4140) - свернуть Excel на панель задач.
                                      
        ExcelApp.WorkSheets[1].Activate;
        ExcelApp.Visible:=true;
     end;
 result:=ExcelApp;
end;
//******************************************************************************
Function GetWoorkBookByFileName(ExcelApp:variant;FileExcel:String):variant;
var i:integer;
begin
 result:=null;
 for i := 1 to ExcelApp.workbooks.Count do
       if CompareText(FileExcel,ExcelApp.workbooks[i].FullName)=0 then
          begin
           result:=ExcelApp.workbooks[i];
           break;
          end;
end;
//******************************************************************************
Function CloseFileExlIFOpen(FileExcel:String;ExcelApp:variant;CompareWithPath:Boolean=true):boolean;
var //ExcelApp:variant;
    IsNewOpen:boolean;
    WorkBookOpened:Variant;
    n:Integer;
    InsideCreate:Boolean;
begin
 try
    if VarIsEmpty(ExcelApp) = true then
       begin
        try //1
         IsNewOpen:=false;
         ExcelApp := GetActiveOleObject('Excel.Application');
        except //1
         try //2
          ExcelApp := CreateOleObject('Excel.Application');
          IsNewOpen:=true;
         except //2
          raise Exception.Create('Can+'+#39+'t run Excel');
         end; //2
        end; //1
        InsideCreate:=true;
       end
        else InsideCreate:=false;
   //***************************************************
   HideFocuseCellExcel(ExcelApp);
   n:=WorkBookIndex(ExcelApp, FileExcel,CompareWithPath);
   if n<>0 then
      begin
       ExcelApp.DisplayAlerts :=true;
       ExcelApp.WorkBooks.Item[n].save;
       ExcelApp.WorkBooks.Item[n].close;
      end;
   //***************************************************
 finally
  if InsideCreate then ExcelApp:=unassigned;
 end;
end;
//******************************************************************************
function ReturnRealLastRowInExcel(ExcelApp:variant;SheetNumber:Integer;RealCol:Integer=-1):integer;
var i:integer;
    str1:string;
    str2:string;
    Irow:integer;
    LastRowNumber:integer;
begin
  result:=0;
  //LastRowNumber:=ExcelApp.Cells.SpecialCells(11, EmptyParam).Row;
  LastRowNumber:=ExcelApp.WorkSheets[SheetNumber].UsedRange.Rows.Count;
  if RealCol<>-1 then
     begin
      for IRow:=LastRowNumber Downto 1 do
          begin
            str1:= ExcelApp.Cells[IRow,RealCol].Text;
            str2:= ExcelApp.Cells[IRow,RealCol+1].Text;
            if (Str1<>'') or (Str2<>'') then
                begin
                  result:=Irow;
                  break;
                end;
          end;
     end
      else result:=LastRowNumber;
end;
//******************************************************************************
Function ReturnRealLastColInExcel(ExcelApp:variant;SheetNumber:Integer):integer;
var LastColNumber:integer;
    ICol:Integer;
    str1:string;
    str2:string;
    //LastRowNumber:integer;
begin
  LastColNumber:=ExcelApp.WorkSheets[SheetNumber].UsedRange.Columns.Count;
  //LastRowNumber:=ExcelApp.Cells.SpecialCells(11, EmptyParam).Row;
  //LastColNumber:=ExcelApp.Cells.SpecialCells(11, EmptyParam).Column;

  (*for Icol:=LastColNumber downTo 1 do
      begin
         str1:= ExcelApp.Cells[LastRowNumber,Icol].Text;
         //str2:= ExcelApp.Cells[2,Icol].Text;
         if (Str1<>'') {or (Str2<>'') }then
            begin
              result:=Icol;
              break;
            end;
      end; *)
 result:=LastColNumber;
end;
//******************************************************************************
Procedure FormatRowsHeight(ExcelApp:Variant;SheetNumber:Integer;ExtHeight:integer=0);
var LastColNumber:integer;
    J:Integer;
    Sheet:Variant;
begin
 Sheet:=ExcelApp.WorkSheets[SheetNumber];
 LastColNumber:=ReturnRealLastColInExcel(ExcelApp,SheetNumber);//ExcelApp.Cells.SpecialCells(11, EmptyParam).Column;
 //*******************************************
 for j:=1 to LastColNumber  do
     ExcelApp.Cells[1,J].EntireRow.AutoFit;
 //*******************************************
 if ExtHeight<>0 then
    for j:=1 to LastColNumber  do
        Sheet.Columns[j].RowHeight:=Sheet.Columns[j].RowHeight +ExtHeight;
end;
//******************************************************************************
procedure FormatColumnWidth(ExcelApp:Variant;SheetNumber:Integer;ExtWidth:integer=0);
var LastColNumber:integer;
    J:Integer;
    Sheet:Variant;
begin
 Sheet:=ExcelApp.WorkSheets[SheetNumber];
 LastColNumber:=ReturnRealLastColInExcel(ExcelApp,SheetNumber);//ExcelApp.Cells.SpecialCells(11, EmptyParam).Column;
 //*******************************************
 for j:=1 to LastColNumber  do
     ExcelApp.Cells[1,J].EntireColumn.AutoFit;
 //*******************************************
 if ExtWidth<>0 then
    for j:=1 to LastColNumber  do
        Sheet.Columns[j].ColumnWidth:=Sheet.Columns[j].ColumnWidth +ExtWidth;
end;
//******************************************************************************
Procedure SetMerge(Excel:variant;SheetNumber:integer;BeginRow,BeginCol,EndRow,EndCol:Integer;En:Boolean=true);
var Sheet:variant;
    Range:variant;
begin
 Sheet:=Excel.WorkSheets[SheetNumber];
 Range:=Sheet.Range[Sheet.Cells[BeginRow,BeginCol],Sheet.Cells[EndRow,EndCol]];
 if En then Range.merge
    else Range.Unmerge;
end;
//******************************************************************************
Procedure SetShrinkToFit(Excel:variant;SheetNumber:integer;BeginRow,BeginCol,EndRow,EndCol:Integer;Enabled:boolean);
var Sheet:variant;
    Range:variant;
begin
 Sheet:=Excel.WorkSheets[SheetNumber];
 Range:=Sheet.Range[Sheet.Cells[BeginRow,BeginCol],Sheet.Cells[EndRow,EndCol]];
 Range.ShrinkToFit:=Enabled;
end;
//******************************************************************************
Procedure FormatAllShrinkToFit(Excel:variant;SheetNumber:integer;Enabled:boolean);
var LastColNumber:integer;
    LastRowNumber:Integer;
begin
 LastColNumber:=ReturnRealLastColInExcel(Excel,SheetNumber);
 LastRowNumber:=ReturnRealLastRowInExcel(Excel,SheetNumber);
 SetShrinkToFit(Excel,SheetNumber,1,1,LastRowNumber,LastColNumber,Enabled);
end;
//******************************************************************************
Procedure SetFontToCells(Excel:variant;SheetNumber,BeginRow,BeginCol,EndRow,EndCol:Integer;aFont:TFont);
var Sheet:variant;
    Range:variant;
begin
 Sheet:=Excel.WorkSheets[SheetNumber];
 Range:=Sheet.Range[Sheet.Cells[BeginRow,BeginCol],Sheet.Cells[EndRow,EndCol]];
 Range.font.name:=aFont.name;
 Range.font.size:=aFont.Size;
 Range.font.Bold:=fsBold in aFont.Style;
 Range.font.italic:=fsItalic in aFont.Style;
 Range.font.Underline:=fsUnderline in aFont.Style;
 Range.font.Strikethrough:=fsStrikeOut in aFont.Style;
 Range.font.color:=aFont.Color;
end;
//******************************************************************************
Procedure SetBGColor(Excel:variant;SheetNumber,BeginRow,BeginCol,EndRow,EndCol:Integer;aColor:TColor);
var Sheet:variant;
    Range:variant;
begin
 Sheet:=Excel.WorkSheets[SheetNumber];
 Range:=Sheet.Range[Sheet.Cells[BeginRow,BeginCol],Sheet.Cells[EndRow,EndCol]];
 Range.Interior.Color:=aColor;
end;
//******************************************************************************
Function GetBGColorCell(Excel:variant;aRow,aCol:Integer):TColor;
var Sheet:variant;
    Range:variant;
begin
 //Sheet:=Excel.WorkSheets[SheetNumber];
 //Range:=Sheet.Range[Sheet.Cells[Row,Col],Sheet.Cells[EndRow,EndCol]];
 result:=Excel.Cells[aRow,aCol].Interior.Color;
end;
//******************************************************************************
Procedure SetOrientation(Excel:variant;SheetNumber,BeginRow,BeginCol,EndRow,EndCol:Integer;Orientation:integer);
var Sheet:variant;
    Range:variant;
begin
 Sheet:=Excel.WorkSheets[SheetNumber];
 Range:=Sheet.Range[Sheet.Cells[BeginRow,BeginCol],Sheet.Cells[EndRow,EndCol]];
 Range.Orientation:=Orientation;
End;
//******************************************************************************
Procedure FormatAllOrientation(Excel:variant;SheetNumber,Orientation:integer);
var LastColNumber:integer;
    LastRowNumber:Integer;
begin
 LastColNumber:=ReturnRealLastColInExcel(Excel,SheetNumber);
 LastRowNumber:=ReturnRealLastRowInExcel(Excel,SheetNumber);
 SetOrientation(Excel,SheetNumber,1,1,LastRowNumber,LastColNumber,Orientation);
end;
//******************************************************************************
Procedure SetWidthColumn(ExcelApp:Variant;SheetNumber,aColumn:Integer;aWidth:real);
var Sheet:Variant;
begin
 Sheet:=ExcelApp.WorkSheets[SheetNumber];
 Sheet.Columns[aColumn].ColumnWidth:=aWidth;
end;
//******************************************************************************
Procedure SetHeightRow(ExcelApp:Variant;SheetNumber,aRow,aHeight:Integer);
var Sheet:Variant;
begin
 Sheet:=ExcelApp.WorkSheets[SheetNumber];
 Sheet.Rows[aRow].RowHeight:=aHeight;
end;
//******************************************************************************
Procedure SetWidthAllColumn(ExcelApp:Variant;SheetNumber:integer;aWidth:real);
var Sheet:Variant;
    LastColNumber:integer;
    j:integer;
begin
 LastColNumber:=ReturnRealLastColInExcel(ExcelApp,SheetNumber);
 //LastColNumber:=ExcelApp.WorkSheets[SheetNumber].Cells.SpecialCells(11, EmptyParam).Column;
 //ExcelApp.Cells(1, ExcelApp.WorkSheets[SheetNumber].UsedRange.Columns.Count).End(xlToLeft).Column;
 Sheet:=ExcelApp.WorkSheets[SheetNumber];
 for j:=1 to LastColNumber do
     Sheet.Columns[j].ColumnWidth:=aWidth;
end;
//******************************************************************************
Procedure FormatFontXls(ExcelApp:Variant;MasColBold:array of Boolean;HederBold:Boolean;WorkBookNumber:Integer);
var J:integer;
    Sheet:Variant;
begin
  Sheet:=ExcelApp.WorkSheets[WorkBookNumber];
  for j:=0 to Length(MasColBold)-1 do
      Sheet.Columns[j+1].Font.Bold := MasColBold[j];
  //********************************
  Sheet.Rows[1].Font.Bold :=HederBold;
end;
//******************************************************************************
procedure FormatAlingmentxls(ExcelApp:Variant;SheetNumber:integer;masColAlingment:array of TclxAlihment;HederAligment:TclxAlihment=clxNone;HederVerAligment:TclxVerAlihment=clxVNone);
var I,j:integer;
    LastRowNumber:integer;
    currAlign:integer;
    currVerAlign:integer;
//***********************************************************    
function returnXlsAlign(Aling:TclxAlihment):integer;
begin
 if Aling=clxLeft   then result:=-4131;
 if Aling=clxCenter then result:=-4108;
 if Aling=clxRight  then result:=-4152;
end;
//***********************************************************
Function returnXlsVerAlign(Aling:TclxVerAlihment):integer;
begin
 if Aling=clxVTop   then result:=-4160;
 if Aling=clxVCenter then result:=-4108;
 if Aling=clxVBottom  then result:=-4107;
end;
//***********************************************************
begin
  LastRowNumber:=ReturnRealLastRowInExcel(ExcelApp,SheetNumber);
  for J:=0 to Length(masColAlingment)-1 do
      begin
        if masColAlingment[j]<>clxNone then
           begin
            currAlign:=returnXlsAlign(masColAlingment[j]);
            ExcelApp.Columns[j+1].HorizontalAlignment := currAlign;
           end;
        //*********************************
      end;
  //*********************************
  if HederAligment<>clxNone then
     begin
      currAlign:=returnXlsAlign(HederAligment);
      for J:=0 to Length(masColAlingment)-1 do
          ExcelApp.Cells[1,J+1].HorizontalAlignment:=currAlign;
     end;
  //*********************************
   if HederVerAligment<>clxVNone then
      begin
        currVerAlign:=returnXlsVerAlign(HederVerAligment);
        for J:=0 to Length(masColAlingment)-1 do
            ExcelApp.Cells[1,J+1].VerticalAlignment:=currVerAlign;
     end;
 // Format Cells
 // xlBottom = -4107;
 // xlLeft = -4131;
 // xlRight = -4152;
 // xlTop = -4160;
 // Text Alignment
 // xlHAlignCenter = -4108;
 // xlVAlignCenter = -4108;
end;
//******************************************************************************
Function GetMaxWidthTextIncolumn(ExcelApp:Variant;SheetNumber:integer;Column:integer):integer;
var LastRowNumber:integer;
    i:integer;
    max:integer;
begin
  max:=0;
  LastRowNumber:=ReturnRealLastRowInExcel(ExcelApp,SheetNumber);
  for i:=1 to LastRowNumber do
      if max<=ExcelApp.Cells[i,Column].ColumnWidth then max:=ExcelApp.Cells[i,Column].ColumnWidth;
  result:=max;
end;
//******************************************************************************
Procedure ShowTextXLS(ExcelApp:variant;SheetNumber:integer;aRow,aCol:Integer; Atext:String;FontSize:Integer=10; isBold:Boolean=false;Alignment:Integer=xlLeft;VAligment:integer=xlVTop;BorderCell:PMyCellBorder=nil);
begin
   if CompareText(Atext,'#Empty')<>0 then
      begin
       ExcelApp.Cells[aRow,aCol].NumberFormat:= '@';
       ExcelApp.Cells(aRow,aCol):=Atext;
      end;
   if FontSize<>-1 then
      begin
       ExcelApp.Cells[aRow,aCol].Font.size:=FontSize;
       ExcelApp.Cells[aRow,aCol].Font.Bold:=isBold;
      end;
   //****************
   ExcelApp.Cells[aRow,aCol].HorizontalAlignment:=Alignment;
   ExcelApp.Cells[aRow,aCol].VerticalAlignment:=VAligment;
   //****************   
   if BorderCell<>nil then
      ShowBorderCell(ExcelApp,SheetNumber, aRow,aCol,BorderCell^);  // ^.BorderCell, BorderCell^.LineStyle, BorderCell^.LineWidth
end;
//******************************************************************************
Procedure SetNumberFormatForCol(ExcelApp:variant;WorkBookNumber:integer;aColNumber:Integer;NumberFormat:String);
var Sheet:variant;
begin
  Sheet:=ExcelApp.WorkSheets[WorkBookNumber];
  Sheet.Columns[aColNumber].NumberFormat:=NumberFormat;
end;
//******************************************************************************
Procedure ShowPackageTexttoXLS(ExcelApp:variant;FData,FFontSize,FFontBold,FAlign,FVAlign:variant;
                               WorkBookNumber,BeginRow,BeginCol:Integer; BorderCell:PMyCellBorder=nil);
var Sheet:variant;
    Range:variant;
    Range1,Range2:String;
    Len:Integer;
    i:integer;
begin
 len:=VarArrayHighBound(FData,1);

 Sheet:=ExcelApp.WorkSheets[WorkBookNumber];
 Range:=Sheet.Range[Sheet.Cells[BeginRow,BeginCol],Sheet.Cells[BeginRow+len-1,VarArrayHighBound(FData,2)]];

 Range.NumberFormat :='@';
 Range.value:=FData;

 for i:=BeginCol to VarArrayHighBound(FData,2) do
     begin
       Range1:=ConvertCellToColumnName(BeginRow,i);
       Range2:=ConvertCellToColumnName(BeginRow+len-1,i);
       if FFontSize[1,i]<>-1 then
          begin
           Sheet.Range[Range1+':'+Range2].font.size:=FFontSize[1,i];
           Sheet.Range[Range1+':'+Range2].font.Bold:=FFontBold[1,i];
          end;

       Sheet.Range[Range1+':'+Range2].HorizontalAlignment:=FAlign[1,i];
       Sheet.Range[Range1+':'+Range2].VerticalAlignment:=FVAlign[1,i];

       if BorderCell<>nil then
          ShowBorderRange(ExcelApp, Range1+':'+Range2,WorkBookNumber, BorderCell^);
     end;
  //*************************

end;
//******************************************************************************
Function GetTextXls(ExcelApp:variant;aRow,aCol:Integer):TMyCellProperty;
var value:variant;
begin
  value:=ExcelApp.Cells[aRow,aCol].NumberFormat;
  if value<>null then
     result.CellFormat:= value;
  //***********************************************
  value:=ExcelApp.Cells[aRow,aCol].Value;
  if value<>null then
     result.Text      := value;
  //***********************************************
  value:=ExcelApp.Cells[aRow,aCol].Font.size;
  if value<>null then
     result.FontSize  :=value;
  //***********************************************
  value:=ExcelApp.Cells[aRow,aCol].Font.Bold;
  if value<>null then
     result.FontBold  :=value;
  //***********************************************
  value:=ExcelApp.Cells[aRow,aCol].HorizontalAlignment;
  if value<>null then
     result.HorizontalAlignment:=value;
end;
//******************************************************************************
Procedure SortXLSColumns(ExcelApp:variant;RowBegin,ColBegin,RowEnd,ColEnd, SortColumn:Integer; ASort:integer);
begin
 //ExcelApp.Range['A2:B100'].Sort(ExcelApp.Range['B2', EmptyParam], 2);
 //**************************************************
 ExcelApp.Range[ ExcelApp.Cells[RowBegin,ColBegin] , ExcelApp.Cells[RowEnd,ColEnd]].Sort(ExcelApp.Cells[RowBegin,SortColumn] , ASort) ;

 //ExcelApp.Range[ColumnBegin+IntToStr(RowBegin)+':'+ColumnEnd+IntToStr(RowEnd)].Sort(ExcelApp.Range[SortColumn+IntToStr(RowBegin), EmptyParam], SortType);
 //**************************************************
end;
//******************************************************************************
Procedure ShowBorderRange(ExcelApp:variant; Range:string;WorkSheet:Integer; BorderCell:TMyCellBorder;JastAroundVer:boolean=false;JastAroundHor:boolean=false);
var PlaceBorder:Integer;
    //TBorderCell=(clxBorderNone,clxBorderLeft,clxBorderRight,clxBorderTop,clxBorderBottom,clxBoth);
    i:integer;
    LineStyle:integer;
    LineWidth:integer;
    Sheet:Variant;
//*************************************************************    
Procedure PrepareCellBorder(CurrPlace:Integer;aLineStyle,aLineWidth:integer);
begin
  //if not (CurrPlace in [11,12]) then
  Sheet.Range[Range].Borders[CurrPlace].LineStyle := aLineStyle;
  if aLineWidth<>-1 then
     Sheet.Range[Range].Borders[CurrPlace].Weight := aLineWidth;
end;
//*************************************************************
begin
 try
  Sheet:=ExcelApp.WorkSheets[WorkSheet];
    //*******************************
  if BorderCell.LineStyle<>-1 then
     LineStyle:=BorderCell.LineStyle else LineStyle:=xlContinuous;
  //********
  if BorderCell.LineWidth<>-1 then
     LineWidth:=BorderCell.LineWidth else LineWidth:=xlMedium;
  //*******************************
  if BorderCell.BorderLeft   then PrepareCellBorder(7,BorderCell.LineStyle,BorderCell.LineWidth)
     else PrepareCellBorder(7,xlLineStyleNone,-1);
  if BorderCell.BorderTop    then PrepareCellBorder(8,BorderCell.LineStyle,BorderCell.LineWidth)
     else PrepareCellBorder(8,xlLineStyleNone,-1);
  if BorderCell.BorderBottom then PrepareCellBorder(9,BorderCell.LineStyle,BorderCell.LineWidth)
     else PrepareCellBorder(9,xlLineStyleNone,-1);
  if BorderCell.BorderRight then PrepareCellBorder(10,BorderCell.LineStyle,BorderCell.LineWidth)
     else PrepareCellBorder(10,xlLineStyleNone,-1);

  if (not JastAroundVer){and((BorderCell.BorderLeft)or(BorderCell.BorderRight))} then PrepareCellBorder(11,BorderCell.LineStyle,BorderCell.LineWidth)
     else PrepareCellBorder(11,xlLineStyleNone,-1);
  if (not JastAroundHor){and((BorderCell.BorderTop)or(BorderCell.BorderBottom))}  then PrepareCellBorder(12,BorderCell.LineStyle,BorderCell.LineWidth)
     else PrepareCellBorder(12,xlLineStyleNone,-1);

  //*******************************
 finally

 end;

end;
//******************************************************************************}
Procedure ShowBorderCell(ExcelApp:variant;SheetNumber:integer; Row,Col:Integer;BorderCell:TMyCellBorder);
var Range:String;
    Range1:String;
begin
  Range1:=ConvertCellToColumnName(Row,Col);
  Range:=Range1+':'+Range1;
  ShowBorderRange(ExcelApp, Range,1,BorderCell);
end;
//******************************************************************************
Function GetCellBorder(ExcelApp:variant;WorkSheet,Col:integer):TMyCellBorder;
var Sheet:variant;
    Range:variant;
    LastRowNumber:integer;
//*****************************************
Procedure GetstyleLine(aBorder:Integer);
begin
   if aBorder<>-1 then
      begin
       result.LineStyle:=Range.Borders[aBorder].LineStyle;
       result.LineWidth:=Range.Borders[aBorder].Weight;
      end
       else
        begin
         result.LineStyle:=xlLineStyleNone;
         result.LineWidth:=-1;
        end;
end;
//*****************************************
begin
   LastRowNumber:=ReturnRealLastRowInExcel(ExcelApp,WorkSheet);
   Sheet:=ExcelApp.WorkSheets[WorkSheet];
   Range:=Sheet.Range[Sheet.Cells[1,Col],Sheet.Cells[LastRowNumber,Col]];
   //*************************
                  
   result.BorderLeft:=Range.Borders[7].LineStyle<>xlLineStyleNone;
   result.BorderTop:=Range.Borders[8].LineStyle<>xlLineStyleNone;
   result.BorderBottom:=Range.Borders[9].LineStyle<>xlLineStyleNone;
   result.BorderRight:=Range.Borders[10].LineStyle<>xlLineStyleNone;
   //*************************
   if result.BorderLeft then GetstyleLine(7)
      else
       if result.BorderTop then GetstyleLine(8)
          else
             if result.BorderBottom then GetstyleLine(9)
                else
                   if result.BorderRight then GetstyleLine(10)
                      else GetstyleLine(-1);
end;
//******************************************************************************
Procedure ShowBorders(ExcelApp:variant;SheetNumber, Row,ColBegin,ColEnd:integer;BorderCell:TMyCellBorder);
var i:integer;
begin
 for i:=ColBegin to ColEnd do
     begin
      ShowBorderCell(ExcelApp,SheetNumber, Row,i,BorderCell);
     end;
end;
//******************************************************************************
Procedure ShowAllBorderds(ExcelApp:variant;SheetNumber,LineWidth,LineStyle:Integer;JustAroundVer:Boolean=false;JustAroundHor:Boolean=false);
var LastColNumber:integer;
    LastRowNumber:Integer;
    Sheet:variant;
    Range:variant;
    BorderTitle:PMyCellBorder;
begin
 LastColNumber:=ReturnRealLastColInExcel(ExcelApp,SheetNumber);
 LastRowNumber:=ReturnRealLastRowInExcel(ExcelApp,SheetNumber);
 //*********************************************
 try
   New(BorderTitle);
   BorderTitle^.BorderBottom:=true;
   BorderTitle^.BorderTop:=true;
   BorderTitle^.BorderRight:=true;
   BorderTitle^.BorderLeft:=true;

   BorderTitle^.LineWidth:=LineWidth;//xlMedium;
   BorderTitle^.LineStyle:=LineStyle;//xlContinuous;

   ShowBorderRange(ExcelApp,ConvertCellToColumnName(1,1)+':'+ConvertCellToColumnName(LastRowNumber, LastColNumber),SheetNumber,BorderTitle^,JustAroundVer,JustAroundHor);
 finally
  Dispose(BorderTitle);
 end;
end;
//******************************************************************************
function IsStrANumber(const S: string): Boolean;
var
  P: PChar;
begin
  P      := PChar(S);
  Result := False;
  while P^ <> #0 do
  begin
    //************************
    if not (P^ in ['0'..'9',DecimalSeparator]) then
       begin
         Result := False;
         Exit;
       end;
    //************************
    Inc(P);
    Result := True;
  end;
end;
//******************************************************************************
Procedure ShowTotalSum(ExcelApp:variant; RowBegin,RowEnd,Col:integer;RowTotal:Integer;isBold:Boolean=false;Alignment:Integer=xlLeft;CellFormat:string='@');
var I:integer;
    Sum:real;
    CurrValue:string;
begin
 Sum:=0;
 for i:=RowBegin to RowEnd do
     begin
      CurrValue:=ExcelApp.Cells[i,Col];
      if IsStrANumber(CurrValue) then
         Sum:=Sum+StrToFloat(CurrValue);
     end;
 ExcelApp.Cells(RowTotal,Col):= Sum;
 ExcelApp.Cells[RowTotal,Col].Font.Bold:=isBold;
 ExcelApp.Cells[RowTotal,Col].HorizontalAlignment:=Alignment;
 ExcelApp.Cells[RowTotal,Col].NumberFormat:=CellFormat;
 //ExcelApp.Cells[aRow,aCol].NumberFormat:= '@';
end;
//******************************************************************************
Function GetIndexColByCaptionFromWiew(ACaption:String;AView:TcxGRidTableView):integer;
var i:integer;
begin
   result:=-1;
  for i:=0 to AView.ColumnCount-1 do
      begin
        if (CompareText(AView.Columns[i].Caption,ACaption)=0) then
           begin
            result:=i;
            break;
           end;
      end;
end;
//******************************************************************************
Procedure BiuldHeaderViewExl(ExcelApp:Variant;SheetNumber,PosHeaderRow,PosHeaderCol:Integer;AcolCaption:array of String;FontSize:array of Integer;BorderCell:PMyCellBorder=nil);
var i:integer;
    FData:variant;
    FFontSize:variant;
    FFontBold:variant;
    FAlign:variant;
    CurrValue:String;
begin
 FData:=VarArrayCreate([1,1,1,length(AcolCaption)],varVariant);
 FFontSize:=VarArrayCreate([1,1,1,length(AcolCaption)],varVariant);
 FFontBold:=VarArrayCreate([1,1,1,length(AcolCaption)],varVariant);
 FAlign:=VarArrayCreate([1,1,1,length(AcolCaption)],varVariant);;

 for i:=0 to length(AcolCaption)-1 do
     begin
      ShowTextXLS(ExcelApp,SheetNumber, PosHeaderRow,PosHeaderCol+i,AcolCaption[i],FontSize[i], true, xlCenter,xlVCenter, BorderCell);
     end;
end;
//******************************************************************************
Procedure BiuldDataSelViewExl(ExcelApp:Variant;aView:TcxGRidTableView;PosDataRow,PosHeaderCol:Integer;AcolCaption:array of String;
          AColFont:array of Integer;AColBold:array of boolean;
          AColAlignment:array of integer;
          AColVerAlignment:array of integer;
          BorderCell:PMyCellBorder=nil);
var i,j:integer;
    CurrIndCol:Integer;
    CurrValue:string;
    Progres:TProgressFormProp;
    VisibleIndex:Integer;
    Count:Integer;
    CurrMask:String;
    FData:variant;
    FFontSize:variant;
    FFontBold:variant;
    FAlign:variant;
    FVAlign:variant;
begin
 try
  Progres:=ShowProgress('Wait:',aView.Controller.SelectedRowCount);
  //создаем вариантный массив
  FData:=VarArrayCreate([1,aView.Controller.SelectedRowCount,1,length(AcolCaption)],varVariant);
  FFontSize:=VarArrayCreate([1,aView.Controller.SelectedRowCount,1,length(AcolCaption)],varVariant);
  FFontBold:=VarArrayCreate([1,aView.Controller.SelectedRowCount,1,length(AcolCaption)],varVariant);
  FAlign:=VarArrayCreate([1,aView.Controller.SelectedRowCount,1,length(AcolCaption)],varVariant);
  FVAlign:=VarArrayCreate([1,aView.Controller.SelectedRowCount,1,length(AcolCaption)],varVariant);
  //заполняем массив данными из StringGrid
  for i:=0 to aView.Controller.SelectedRowCount-1 do
      begin
        for j:=0 to length(AcolCaption)-1 do
            begin
              if AcolCaption[j][1]<>'#' then
                 begin
                  CurrIndCol:=GetIndexColByCaptionFromWiew(AcolCaption[j], aView );
                  CurrValue:=aView.Controller.SelectedRows[i].DisplayTexts[CurrIndCol];
                  if (aView.Columns[CurrIndCol].Properties is TcxMaskEditProperties)and
                     (TcxMaskEditProperties(aView.Columns[CurrIndCol].Properties).editMask<>'') then
                      CurrValue:=FormatText(CurrValue,TcxMaskEditProperties(aView.Columns[CurrIndCol].Properties).editMask,' ');
                  //*************************
                  CurrValue:=Trim(CurrValue);
                 end
                  else
                   begin
                    if CompareText(AcolCaption[j],'#Line')=0 then CurrValue:=IntToStr(i+1);
                    if CompareText(AcolCaption[j],'#Empty')=0 then CurrValue:='';
                   end;
               try
                //FData[PosDataRow+i,PosHeaderCol+j]:=CurrValue;
                FData[i+1,j+1]:=CurrValue;
                FFontSize[i+1,j+1]:=AColFont[j];
                FFontBold[i+1,j+1]:=AColBold[j];
                FAlign[i+1,j+1]:=AColAlignment[j];
                FVAlign[i+1,j+1]:=AColVerAlignment[j];
               except

               end;
               //ShowTextXLS(ExcelApp, PosDataRow+i,PosHeaderCol+j,CurrValue,AColFont[j], AColBold[j], AColAlignment[j],BorderCell);
            end;


        Progres.ProgressBar.Position:=Progres.ProgressBar.Position+1;
        Progres.ProgressCaption.Repaint;
      end;
      ShowPackageTexttoXLS(ExcelApp,FData,FFontSize,FFontBold,FAlign,FVAlign, 1,PosDataRow,PosHeaderCol,BorderCell);
 finally
   ClosedProgress;
 end;
end;
//******************************************************************************
Procedure ExportSelectViewToExl(FileExcel:String;aView:TcxGRidTableView;PosHeaderRow,PosDataRow:Integer;
AcolCaption:array of String;AColFont:array of integer; AColBold:array of boolean;AColAlignment,AColVerAlignment:array of integer);
var ExcelApp:Variant;
begin
 try
  if FileExcel<>'' then
     begin
      CloseFileExlIFOpen(FileExcel,unassigned);
      if FileExists(FileExcel)
         then DeleteFile(FileExcel);
     end;
  //*****************************
  ExcelApp:=OpenXLS(FileExcel,true);

  BiuldHeaderViewExl(ExcelApp,1, PosHeaderRow,1, AcolCaption,AColFont);
  BiuldDataSelViewExl(ExcelApp, aView,PosDataRow,1, AcolCaption,AColFont, AColBold,AColAlignment,AColVerAlignment );
  //*****************************
 finally
  FormatColumnWidth(ExcelApp,1);
  if FileExcel<>'' then
     SaveWorkBooks(ExcelApp,FileExcel);
  ExcelApp:=unassigned;
 end;
end;
//******************************************************************************
Function FindColExlByCaption(ExcelApp:Variant;PosHeaderRow:integer;CaptExl:string):Integer;
var LastColNumber:integer;
    i:integer;
    CellProperty:TMyCellProperty;
begin
 result:=-1;
 LastColNumber:=ExcelApp.Cells.SpecialCells(11, EmptyParam).Column;
 for i:=1 to LastColNumber do
     begin
       CellProperty:=GetTextXls(ExcelApp,PosHeaderRow,i);
       if CompareText(CellProperty.Text,CaptExl)=0 then
          begin
           result:=i;
           break;
          end;
     end;
end;
//******************************************************************************
Procedure FilterColumnByCaptionColViewFromExl(FileExcel:String;aView:TcxGRidTableView;PosHeaderRow,PosDataRow:Integer;CaptView,CaptExl:String;CloseExcelAfterFinish:Boolean=true);
var ExcelApp:Variant;
    Sheet:Variant;
    ColExlKey:integer;
    LastRow:Integer;
    len:integer;
    WorkBookNumber:integer;
    Range1:String;
    Range2:String;
    FData:variant;
    i:integer;
    FL: TcxFilterCriteriaItemList;
    Column:TcxGridColumn;
    IndFilterColView:integer;
    CurrValueFilter:String;
    Progres:TProgressFormProp;

begin
  try
   WorkBookNumber:=1;
   ExcelApp:=OpenXLS(FileExcel,true);
   Sheet:=ExcelApp.WorkSheets[WorkBookNumber];

   ColExlKey:=FindColExlByCaption(ExcelApp,PosHeaderRow,CaptExl);
   if ColExlKey=-1 then
      begin
         MessageDlg('Column '+CaptExl+' not found', mtError, [mbOk], 0);
         exit;
      end;
   //********************************************
  IndFilterColView:=GetIndexColByCaptionFromWiew(CaptView,aView);
  if IndFilterColView=-1 then exit;
   //********************************************
  LastRow:=ReturnRealLastRowInExcel(ExcelApp,WorkBookNumber);

  len:=LastRow-PosDataRow+1;
  Range1:=ConvertCellToColumnName(PosDataRow,ColExlKey);
  Range2:=ConvertCellToColumnName(PosDataRow+len-1,ColExlKey);

  FData:=VarArrayCreate([1,len,1,1],varVariant);
  FData:=Sheet.Range[Range1+':'+Range2].value;
  //*********************************************
  // Set Filter Column
  aView.BeginUpdate;
  aView.DataController.Filter.Active:=false;
  aView.DataController.Filter.Root.Clear;
  FL := Aview.DataController.Filter.Root.AddItemList(fboOr);

  Progres:=ShowProgress('Wait:',Len);
  Column:=aView.Columns[IndFilterColView];
  for i:=1 to len do
      begin
        Application.ProcessMessages;
        if len>1 then
           CurrValueFilter:=FData[i,1]
            else CurrValueFilter:=FData;
            
        if trim(CurrValueFilter)<>'' then
           FL.AddItem(Column, foEqual , CurrValueFilter , CurrValueFilter);

        Progres.ProgressBar.Position:=Progres.ProgressBar.Position+1;
        Progres.ProgressCaption.Repaint;
      end;

  aView.DataController.Filter.Options:= aView.DataController.Filter.Options+[fcoCaseInsensitive];
  aView.DataController.Filter.Active := true;
  //*********************************************
  finally
   aView.EndUpdate;
   if CloseExcelAfterFinish then CloseXLS(ExcelApp);
   ExcelApp:=unassigned;
   ClosedProgress;
  end;
end;
//******************************************************************************
Procedure SetPageBreakForDifferentCol(ExcelApp:Variant;SheetNumber,aBeginRow,aColInd:integer);
var LastRow:Integer;
    MyCell:TMyCellProperty;
    LastValue:string;
    i:integer;
begin
 LastRow:=ReturnRealLastRowInExcel(ExcelApp,SheetNumber);
 LastValue:='';
 for i:=aBeginRow to LastRow+1 do
     begin
      MyCell:=GetTextXls(ExcelApp,i,aColInd);
      if i=aBeginRow then
         LastValue:=MyCell.Text;
      //***************************************
      if CompareText(LastValue,MyCell.Text)<>0 then
         begin
          AddPageBreaks(ExcelApp,SheetNumber, i);
          LastValue:=MyCell.Text;
         end;
     end;
end;
//******************************************************************************
Procedure InsertRow(ExcelApp:Variant;SheetNumber,PosDataRow,CountCol,CountRow:Integer;BorderCell:PMyCellBorder=nil);
var i,j:integer;
    SaveTop:boolean;
    SaveBottom:boolean;
    FromExcelBolderCell:TMyCellBorder;
begin
 if BorderCell<>nil then
    begin
     SaveTop:=BorderCell^.BorderTop;
     SaveBottom:=BorderCell^.BorderBottom;
    end;
 //*************************************
 for i:=1 to CountRow do
     begin
      ExcelApp.WorkSheets[SheetNumber].Rows[PosDataRow+i-1].Insert();
      if BorderCell<>nil then
         begin
           if (i=1) then
              begin
                FromExcelBolderCell:=GetCellBorder(ExcelApp,PosDataRow+i-1,1);
                if BorderCell<>nil then
                   begin
                    BorderCell^.BorderTop:=FromExcelBolderCell.BorderTop;
                    BorderCell^.BorderBottom:=false;
                   end; 
              end
              else
               begin
                 if BorderCell<>nil then
                    BorderCell^.BorderTop:=SaveTop;
               end;
           //*************************************
           if BorderCell<>nil then
              begin
                 if (i=CountRow) then
                     BorderCell.BorderBottom:=FromExcelBolderCell.BorderBottom
                      else BorderCell^.BorderBottom:=SaveBottom;
              end;        
           //*************************************
           if ((i=1)or(i=CountRow))and(BorderCell<>nil )
               then ShowBorders(ExcelApp,SheetNumber,PosDataRow+i-1,1,CountCol,BorderCell^);
         end;
     end;
 if BorderCell<>nil then
    begin
     BorderCell^.BorderBottom:=SaveBottom;
     BorderCell^.BorderTop:=SaveTop;
    end; 
end;
//******************************************************************************
Procedure SetEmptyRowsForDifferentCol(ExcelApp:Variant;SheetNumber,aBeginRow,aColInd,CountEmptyRow,CountCol:integer;BorderCell:PMyCellBorder=nil);
var LastRow:Integer;
    MyCell:TMyCellProperty;
    LastValue:string;
    i:integer;
begin
 LastRow:=ReturnRealLastRowInExcel(ExcelApp,SheetNumber);
 LastValue:='';
 i:=aBeginRow;
 While i<=LastRow do
 //for i:=aBeginRow to LastRow do
     begin
      MyCell:=GetTextXls(ExcelApp,i,aColInd);
      //if LastValue='###' then
      if i=aBeginRow then
         LastValue:=MyCell.Text;
      //***************************************
      if CompareText(LastValue,MyCell.Text)<>0 then
         begin
          InsertRow(ExcelApp,SheetNumber, i,CountCol,CountEmptyRow,BorderCell);
          if i<LastRow then
             begin
               LastRow:=LastRow+CountEmptyRow;
               
             end
              else
               begin
                LastRow:=i+CountEmptyRow+1;
               end;
          i:=i+CountEmptyRow;
          LastValue:=MyCell.Text;
         end;
      inc(i);
     end;
end;
//******************************************************************************
Procedure InsertCol(ExcelApp:Variant;SheetNumber,PosDataCol,CountCol:Integer;BorderCell:PMyCellBorder=nil);
var i,j:integer;
    SaveLeft:boolean;
    SaveRight:boolean;
    FromExcelBolderCell:TMyCellBorder;
begin
 if BorderCell<>nil then
    begin
     SaveLeft:=BorderCell^.BorderLeft;
     SaveRight:=BorderCell^.BorderRight;
    end;
 //*************************************
 for i:=1 to CountCol do
     begin
      ExcelApp.WorkSheets[SheetNumber].Columns[PosDataCol+i-1].Insert();
      if BorderCell<>nil then
         begin
           if (i=1) then
              begin
                FromExcelBolderCell:=GetCellBorder(ExcelApp,PosDataCol+i-1,1);
                if BorderCell<>nil then
                   begin
                    BorderCell^.BorderLeft:=FromExcelBolderCell.BorderLeft;
                    BorderCell^.BorderRight:=false;
                   end; 
              end
              else
               begin
                 if BorderCell<>nil then
                    BorderCell^.BorderLeft:=SaveLeft;
               end;
           //*************************************
           if BorderCell<>nil then
              begin
                 if (i=CountCol) then
                     BorderCell.BorderRight:=FromExcelBolderCell.BorderRight
                      else BorderCell^.BorderRight:=SaveRight;
              end;        
           //*************************************
           if ((i=1)or(i=CountCol))and(BorderCell<>nil )
               then ShowBorders(ExcelApp,SheetNumber,PosDataCol+i-1,1,CountCol,BorderCell^);
         end;
     end;
 if BorderCell<>nil then
    begin
     BorderCell^.BorderRight:=SaveRight;
     BorderCell^.BorderLeft:=SaveLeft;
    end; 
end;
//******************************************************************************
Procedure PrintXLS(aFileName:String;ExcelOpen:Boolean);
var ExcelApp:variant;
begin
 try
  ExcelApp:=OpenXLS(aFileName,ExcelOpen);
  ExcelApp.WorkSheets.PrintOut;
 finally
  CloseXLS(ExcelApp);
 end;
end;
//******************************************************************************
Procedure FreezeRange(ExcelApp:Variant;SheetNumber:integer;Row,Col:Integer);
var Sheet:Variant;
begin
  if Row>0 then Row:=Row+1 else Row:=1;
  if Col>0 then Col:=Col+1 else Col:=1;
  //*****************************
  Sheet:=ExcelApp.WorkSheets[SheetNumber];
  Sheet.Cells.Item[Row,Col].select;
  ExcelApp.ActiveWindow.FreezePanes:= True;
end;
//******************************************************************************
function AddNewSheet(Excel:Variant;Caption:widestring) : Variant;
var aSheet: variant;
begin
  Result:=UnAssigned;
  if not VarIsEmpty(Excel) then begin
     begin
      Result:= Excel.ActiveWorkbook.Worksheets.Add;
      Result.Name:=Caption;
     end;
  end;
end;
//******************************************************************************
function SetSheetActive(Excel:variant;NumList : integer):variant;
begin
  Result:=UnAssigned;
  if not VarIsEmpty(Excel) then begin
     if NumList>0 then begin
        if NumList<=Excel.WorkSheets.Count then begin
           Result:=Excel.ActiveWorkbook.WorkSheets[NumList];
           Result.Select;
        end;
     end;
  end;
end;
//******************************************************************************
function DeleleSheet(Excel:variant;NumList:integer):boolean;
var Sheet:variant;
begin
 Excel.DisplayAlerts := false;
 Sheet:=Excel.ActiveWorkbook.WorkSheets[NumList];
 if not VarIsEmpty(Sheet) then
    begin
     Sheet.delete;
     result:=true;
    end
     else result:=false;
end;
//******************************************************************************
Procedure DeleteAllSheet(Excel:variant);
var i:integer;
begin
  while Excel.ActiveWorkbook.Sheets.Count>1 do
        DeleleSheet(Excel,Excel.ActiveWorkbook.Sheets.Count);
end;
//******************************************************************************
Procedure CreateAllSheets(Excel:variant;CountSheet:integer);
var i:integer;
begin
 Excel.ActiveWorkbook.Sheets.Add(,,CountSheet,EmptyParam);
end;
//******************************************************************************
procedure SetNewNameSheet(Excel:variant;SheetNumber:integer;NewName:widestring);
var CurrSheet:Variant;
begin
 CurrSheet:=Excel.ActiveWorkbook.WorkSheets[SheetNumber];
 if not VarIsEmpty(CurrSheet) then
    CurrSheet.name:=NewName;
end;
//******************************************************************************
Procedure PrintOutByPrinterName(ExcelApp:Variant;SheetNumber:Integer;PrinterName:WideString);
begin
 ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].printout(EmptyParam,EmptyParam,EmptyParam,False,PrinterName);
end;
//******************************************************************************
Function GetVersionExcel(ExcelApp:Variant):real;
var VEr:WideString;
begin
 Ver:=ExcelApp.Version;
 ReplaseOn(Ver,'.','*REPLACE_VALUE*');
 ReplaseOn(Ver,',','*REPLACE_VALUE*');
 ReplaseOn(Ver,'*REPLACE_VALUE*',DecimalSeparator);
 Result:=StrToFloat(Ver);
end;
//******************************************************************************
Procedure SetPrinterName(ExcelApp:Variant;PrinterName:WideString);
begin
  ExcelApp.ActivePrinter:=ConVertNamePrinterToXLS(PrinterName,GetVersionExcel(ExcelApp))
end;
//******************************************************************************
Procedure SetPrintPage(ExcelApp:Variant;SheetNumber,PageSize:integer);
begin
 ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].PageSetup.PaperSize:=PageSize;
end;
//******************************************************************************
Procedure PageOrientation(Excel:variant;SheetNumber:integer;Orientation:integer);
var CurrSheet:Variant;
begin
  CurrSheet:=Excel.ActiveWorkbook.WorkSheets[SheetNumber];
  if Orientation in [xlPortrait,xlLandscape] then CurrSheet.PageSetup.Orientation:=Orientation;
End;
//******************************************************************************
Procedure SetAreaPrintPage(ExcelApp:Variant;SheetNumber:integer; aTop,aLeft,aRight,aBottom:real);
begin
 if aLeft<>-1 then ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].PageSetup.LeftMargin := ExcelApp.Application.InchesToPoints(aLeft);
 if aTop<>-1   then ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].PageSetup.TopMargin := ExcelApp.Application.InchesToPoints(aTop);
 if aRight<>-1  then ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].PageSetup.RightMargin := ExcelApp.Application.InchesToPoints(aRight);
 if aBottom<>-1  then ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].PageSetup.BottomMargin := ExcelApp.Application.InchesToPoints(aBottom);
end;
//******************************************************************************
Procedure AddPageBreaks(ExcelApp:Variant;SheetNumber,PosDataRow:Integer);
begin
 ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].HPageBreaks.Add(ExcelApp.WorkSheets[SheetNumber].Cells[PosDataRow,1]);
end;
//******************************************************************************
Procedure InsertSplitCol(ExcelApp:variant;SheetNumber,PosSplitCol,CountsplitCol:Integer;WidthSplitCol:Real);
var LastRowNumber:integer;
    RangeSplit:string;
    FromExcelBolderCell:TMyCellBorder;
    BorderCellSpliter:TMyCellBorder;
    DefColor:TColor;
begin
 if PosSplitCol=0 then exit;

 InsertCol(ExcelApp,SheetNumber,PosSplitCol,CountsplitCol,nil);
 SetWidthColumn(ExcelApp,SheetNumber,PosSplitCol,WidthSplitCol);

 LastRowNumber:=ReturnRealLastRowInExcel(ExcelApp,SheetNumber);
 RangeSplit:=ConvertCellToColumnName(1,PosSplitCol)+':'+ConvertCellToColumnName(LastRowNumber, PosSplitCol);

 FromExcelBolderCell:=GetCellBorder(ExcelApp,SheetNumber,PosSplitCol);

 BorderCellSpliter.LineStyle:=FromExcelBolderCell.LineStyle;
 BorderCellSpliter.LineWidth:=FromExcelBolderCell.LineWidth;
 BorderCellSpliter.BorderLeft:=true;
 BorderCellSpliter.BorderRight:=true;
 BorderCellSpliter.BorderTop:=false;
 BorderCellSpliter.BorderBottom:=false;
 ShowBorderRange(ExcelApp, RangeSplit,SheetNumber, BorderCellSpliter,true,true);
 //***************
 SetBGColor(ExcelApp,SheetNumber,1,PosSplitCol,LastRowNumber,PosSplitCol,xlDefColorBG);
end;
//******************************************************************************
Function GetCountHBreaks(ExcelApp:variant;SheetNumber:Integer):Integer;
begin
 Result:=ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].HPageBreaks.count+1;
end;
//******************************************************************************
Procedure ClearRows(ExcelApp:variant;SheetNumber:Integer;StartRow,EndRow:Integer;UnmErge:Boolean=true;UnBorder:boolean=true);
var i:integer;
    LastCol:integer;
    Sheet:variant;
    Range:variant;
    BorderCell:TMyCellBorder;
    FromExcelBolderCell:TMyCellBorder;
begin
  LastCol:=ReturnRealLastColInExcel(ExcelApp,SheetNumber);
  SetBGColor(ExcelApp,SheetNumber,StartRow,1,EndRow,LastCol,xlDefColorBG);

  Sheet:=ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber];
  Range:=ExcelApp.WorkSheets[SheetNumber].Range[Sheet.Cells[StartRow,1],Sheet.Cells[EndRow,LastCol]];
  Range.value:='';
  if UnmErge then SetMerge(ExcelApp,SheetNumber,StartRow,1,EndRow,LastCol,false);
  if UnBorder then
     begin
       FromExcelBolderCell:=GetCellBorder(ExcelApp,SheetNumber,1);

       BorderCell.BorderBottom:=FromExcelBolderCell.BorderTop;
       BorderCell.BorderTop:=FromExcelBolderCell.BorderTop;
       BorderCell.BorderRight:=false;
       BorderCell.BorderLeft:=false;
       //**********************************          
       if CheckRowIsHBreaks(ExcelApp,SheetNumber,EndRow) then
          BorderCell.BorderBottom:=false;
       //**********************************
       BorderCell.LineWidth:=FromExcelBolderCell.LineWidth;
       BorderCell.LineStyle:=FromExcelBolderCell.LineStyle;

       ShowBorderRange(ExcelApp, ConvertCellToColumnName(StartRow,1)+':'+ConvertCellToColumnName(EndRow, LastCol),SheetNumber,BorderCell,true,true);
     end;
end;
//******************************************************************************
Function GetFirstCellAfterHBreaks(ExcelApp:variant;SheetNumber,BreakNumber:Integer):Integer;
begin
 try
   ExcelApp.ActiveWindow.View := 2;       // разметка страниц
   Result:=ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].HPageBreaks[BreakNumber].Location.Row;
 finally
  ExcelApp.ActiveWindow.View := 1;      // normal Wiew
 end;
 //ExcelApp.ActiveWindow.View := 2;       // разметка страниц
 //ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber].HPageBreaks[1].DragOff(Direction:=1,RegionIndex:=1);
 //ExcelApp.ActiveWindow.View := 1;      // normal Wiew
end;
//******************************************************************************
Function CheckRowIsHBreaks(ExcelApp:variant;SheetNumber,RowCheck:integer):Boolean;
var CountHBreaks:integer;
    PosLastPage:Integer;
    i:integer;
begin
 result:=false;
 CountHBreaks:=GetCountHBreaks(ExcelApp,SheetNumber);
 for i:=1 to CountHBreaks-1 do
     begin
      PosLastPage:=GetFirstCellAfterHBreaks(ExcelApp,SheetNumber,i)-1;
      if PosLastPage=RowCheck then
         begin
          result:=true;
          break;
         end;
     end;
end;
//******************************************************************************
Procedure CopyRow(ExcelApp:variant;SheetNumber,CopyFromRow,CopyToRow:Integer;InsertRow:Boolean=true);
var CurrSheet:variant;
begin
 CurrSheet:=ExcelApp.ActiveWorkbook.WorkSheets[SheetNumber];
 if InsertRow then CurrSheet.Rows[CopyToRow].Insert();
 CurrSheet.Rows[CopyFromRow].Copy(CurrSheet.Rows[CopyToRow]);
end;
//******************************************************************************
Function GetCountPage(ExcelApp:variant;SheetNumber:Integer):integer;
var i:integer;
    H:integer;
    SumPages:integer;
    V:integer;
begin
  SumPages:=0;
  for i := 1 to ExcelApp.WorkBooks[SheetNumber].Sheets.Count do
     begin
        H := ExcelApp.WorkBooks[SheetNumber].Worksheets[i].HPageBreaks.Count+1;
        if H = 0 then H := 1;
        V := ExcelApp.WorkBooks[SheetNumber].Worksheets[i].VPageBreaks.Count+1;
        if V = 0 then V := 1;
        SumPages := SumPages + V*H;
     end;
//****************************
  Result:= SumPages;
end;
//**********************************************
PRocedure SaveAsPDF(ExcelApp:variant;SheetNumber:Integer;PdfFileName:String);
begin
  ClosePDF(PdfFileName);
  ExcelApp.WorkBooks[SheetNumber].ExportAsFixedFormat(0,PdfFileName,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam,EmptyParam);
end;
//******************************************************************************
procedure AddToShemaField( IndCol:Integer;FieldName:String;var ShemaFieldndex:TMyFieldDBAndColXlsArr );
var len:Integer;
begin
  len:=Length(ShemaFieldndex);
  SetLength(ShemaFieldndex,Len+1);
  ShemaFieldndex[len].IndCol:=IndCol;
  ShemaFieldndex[len].FieldName:=FieldName;
end;
//******************************************************************************
procedure ReadDataFromXLS(CationWaitProgres:Widestring; FileExcel:String;StartRow:Integer; Datatset:TDataset; ShemaFieldndex:TMyFieldDBAndColXlsArr);
var Row,i:integer;
    ExcelApp:Variant;
    LastRow:Integer;
    CurrValue:TMyCellProperty;
    Progres:TProgressFormProp;
begin
  try
    if not Datatset.Active then Datatset.Open;
    
    ExcelApp:=OpenXLS(FileExcel,true);
    LastRow:= ReturnRealLastRowInExcel(ExcelApp,1);

    Progres:=ShowProgress(CationWaitProgres ,LastRow);
    for Row:=StartRow to LastRow do
    begin
       Datatset.Append;
       for i:=0 to Length(ShemaFieldndex)-1 do
       begin
         CurrValue:=GetTextXls( ExcelApp, Row, ShemaFieldndex[i].IndCol );
         if CurrValue.Text<>'' then Datatset.FieldByName( ShemaFieldndex[i].fieldName ).Value := CurrValue.Text;
       end;
       Datatset.Post;
       Progres.ProgressBar.Position:= Progres.ProgressBar.Position+1;
       Progres.ProgressCaption.Repaint;
    end;

  finally
    ClosedProgress;
    ExcelApp:=unassigned;
  end;
end;

end.


// текст по вертикали - сверху вниз
WordApplication1.Selection.Orientation:=wdTextOrientationDownward;


 