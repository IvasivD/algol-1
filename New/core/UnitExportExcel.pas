unit UnitExportExcel;

interface
uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, cxTL,Dialogs,
  cxGridTableView, cxGridBandedTableView, cxStyles, cxGridCardView,
  cxClasses, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxCalendar, cxTextEdit, cxGridCustomTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, dxmdaset, ComCtrls,Forms,
  UnitPreviewFiles, Controls ,TourCmnlIf, UnitFunctSoapDll ,
  //SvtDBGrids,
  core,ComObj, Graphics, Variants, cxDBTL, cxTLData, cxGridDBDataDefinitions;

procedure PrepareAndExportExel(ExportElement: TDBShemaView; SheetName: string = '');
procedure PrepareAndExportExelSeveralView(ExportElements: array of TDBShema; SheetNames: array of string);

implementation

var Workbook, ExcelApp: Variant;

procedure CreateExcelApp(wBookCount: Integer = 1);
var I: Integer;
begin
// Створюємо Excel
  ExcelApp := CreateOleObject('Excel.Application');

// Відключаєм реакцию Excel на події, чтоб пришвидшити вивід інформації
  ExcelApp.Application.EnableEvents := false;
  
  Workbook := ExcelApp.WorkBooks.Add;
  for I := Workbook.WorkSheets.Count to wBookCount do
  Workbook.WorkSheets.Add;  
end;

//******************************************************************************
function StringToFloat(aString: string): Extended;
var str: string;
begin
  str := StringReplace(aString, ' ', '', [rfReplaceAll]);
  Result := StrToFloatDef(str, 0);
end;
//******************************************************************************
procedure ExportInExel(const DataArr: Variant;
  const RowCount, ColCount: Integer; SheetName: string = ''; SheetId: Integer = 1);
var 
  BeginRow, BeginCol: Variant;
  Range, Cell1, Cell2: Variant;
  I, J: Integer;
begin
                             
//  Створюємо Книгу (Workbook)          
  BeginRow := 1;
  BeginCol := 1;

// Ліва верхня ячейка області, в яку будемо виводити дані
  Cell1 := WorkBook.WorkSheets[SheetId].Cells[BeginRow, BeginCol];

// Права нижня ячейка області, в яку будемо виводити дані
  Cell2 := WorkBook.WorkSheets[SheetId].Cells[BeginRow  + RowCount, BeginCol + ColCount - 1];

// Область, в яку будемо виводити дані
  Range := WorkBook.WorkSheets[SheetId].Range[Cell1, Cell2];
// Вивід даних
  Range.Value := DataArr;
  Range.EntireColumn.AutoFit;  

  if VarIsArray(DataArr) then 
    for I := VarArrayLowBound(DataArr, 1) to VarArrayHighBound(DataArr, 1) do
      for J := VarArrayLowBound(DataArr, 2) to VarArrayHighBound(DataArr, 2) do
        if VarIsFloat( VarArrayGet(DataArr, [I, J]) ) then 
        begin
          Cell1 := WorkBook.WorkSheets[SheetId].Cells[ I, J];
          WorkBook.WorkSheets[SheetId].Range[Cell1, Cell1].NumberFormat := Format('# ##0%s00', [Sysutils.DecimalSeparator]);
        end;
      
  Cell1 := WorkBook.WorkSheets[SheetId].Cells[BeginRow, BeginCol];
  Cell2 := WorkBook.WorkSheets[SheetId].Cells[BeginRow, BeginCol + ColCount - 1];
  Range := WorkBook.WorkSheets[SheetId].Range[Cell1, Cell2];
  Range.HorizontalAlignment := $FFFFEFF4;
  Range.Interior.Color := clSkyBlue;
//Закріплення області
  WorkBook.WorkSheets[SheetId].Activate;
  WorkBook.WorkSheets[SheetId].Range['A2:A2'].Select;
  ExcelApp.ActiveWindow.FreezePanes := True;
  if SheetName <> EmptyStr then WorkBook.WorkSheets[SheetId].Name := SheetName;
end;
//******************************************************************************
procedure PrepareAndExportExel(ExportElement: TDBShemaView; SheetName: string = '');
var 
  RowCount,  I, J, K, R, ColVisible: Integer;
  DataArr: Variant;
begin
  with ExportElement do
  begin
    ColVisible:=View.VisibleColumnCount;
    RowCount := View.DataController.RecordCount;
    DataArr := VarArrayCreate([ 1, RowCount + 1, 1, ColVisible ], varVariant);

    K := 0;
    for J := 0 to ColVisible - 1 do
      if TcxGridDBColumn(View.VisibleColumns[J]).DataBinding.FieldName<>'' then
        DataArr[1, J + 1 - K] := View.VisibleColumns[J].Caption else Inc(K);

    I := 2;
    for R := 0 to RowCount - 1 do
    begin
      K := 0;
      for J := 0 to ColVisible - 1 do
      begin
                           
        if TcxGridDBColumn(View.VisibleColumns[j]).DataBinding.FieldName<>'' then
        begin
          if TcxGridItemDBDataBinding(View.VisibleColumns[J].DataBinding).Field.DataType in [ftFloat, ftCurrency] then
            DataArr[I, J + 1 - K] := StringToFloat(View.DataController.DisplayTexts[R, View.VisibleColumns[J].Index])
          else
            DataArr[I, J + 1 - K] := View.DataController.DisplayTexts[R, View.VisibleColumns[J].Index]
        end
        else Inc(K);
      end;
      Inc(I);
    end;
    CreateExcelApp;
    ExportInExel(DataArr, RowCount, ColVisible, SheetName);
    ExcelApp.Visible := True;
  end
end;
//******************************************************************************
procedure ExportShemaView(aElement: TDBShemaView; SheetName: string; SheetId: Integer);
var 
  RowCount, I, J, K, R, ColVisible: Integer;
  DataArr: Variant;
begin
  with aElement do
  begin
    ColVisible := View.VisibleColumnCount;
    RowCount := View.DataController.RecordCount;
    DataArr := VarArrayCreate([ 1, RowCount + 1, 1, ColVisible ], varVariant);

    K := 0;
    for J := 0 to ColVisible - 1 do
      if TcxGridDBColumn(View.VisibleColumns[J]).DataBinding.FieldName<>'' then
        DataArr[1, J + 1 - K] := View.VisibleColumns[J].Caption else Inc(K);

    I := 2;
    for R := 0 to RowCount - 1 do
    begin
      K := 0;
      for J := 0 to ColVisible - 1 do
      begin

        if TcxGridDBColumn(View.VisibleColumns[j]).DataBinding.FieldName<>'' then
          if TcxGridItemDBDataBinding(View.VisibleColumns[J].DataBinding).Field.DataType in [ftFloat, ftCurrency] then
            DataArr[I, J + 1 - K] := StringToFloat(View.DataController.DisplayTexts[R, View.VisibleColumns[J].Index])
          else
            DataArr[I, J + 1 - K] := View.DataController.DisplayTexts[R, View.VisibleColumns[J].Index]
        else Inc(K);
      end;
      Inc(I);
    end;  

    ExportInExel(DataArr, RowCount, ColVisible, SheetName, SheetId);
  end     
end;
//******************************************************************************
procedure ExportShemaTree(aElement: TDBShemaTree; SheetName: string; SheetId: Integer);
var 
  RowCount, I, J, K, R, ColVisible: Integer;
  DataArr: Variant;
  aNode: TcxTreeListNode;
begin          
  with aElement do
  begin
    ColVisible := Tree.VisibleColumnCount;
    aElement.Tree.FullExpand;
    //aElement.Tree.AbsoluteCount
    RowCount := aElement.Tree.AbsoluteVisibleCount;//Tree.DataController.RecordCount;
    DataArr := VarArrayCreate([ 1, RowCount + 1, 1, ColVisible ], varVariant);

    K := 0;
    for J := 0 to ColVisible - 1 do
      if TcxDBTreeListColumn(Tree.VisibleColumns[J]).DataBinding.FieldName<>'' then
        DataArr[1, J + 1 - K] := Tree.VisibleColumns[J].Caption.Text else Inc(K);

    I := 2;     
    aNode := Tree.TopNode;
    while aNode <> nil do
    begin
      for J := 0 to ColVisible - 1 do
      begin                                                            
        if TcxDBTreeListColumn(Tree.VisibleColumns[j]).DataBinding.FieldName<>'' then
          if TcxDBItemDataBinding(Tree.VisibleColumns[J].DataBinding).Field.DataType in [ftFloat, ftCurrency] then
            DataArr[I, J + 1 - K] := StringToFloat(aNode.Texts[Tree.Columns[J].ItemIndex])
          else
            DataArr[I, J + 1 - K] := aNode.Texts[Tree.Columns[J].ItemIndex] 
        else Inc(K);
      end;
      Inc(I);
    
      aNode := aNode.GetNext;
    end; 

    ExportInExel(DataArr, RowCount, ColVisible, SheetName, SheetId);
  end     
end;
//******************************************************************************

procedure PrepareAndExportExelSeveralView(ExportElements: array of TDBShema; SheetNames: array of string);
var I, ElementCount: Integer;
begin
  if Length(ExportElements) = 0 then Exit;

  ElementCount := Length(ExportElements);  
  CreateExcelApp(ElementCount);
  
  for I := 0 to ElementCount - 1 do
  begin
    if ExportElements[I] is TDBShemaView then 
      ExportShemaView(TDBShemaView(ExportElements[I]), SheetNames[I], I + 1);
    if ExportElements[I] is TDBShemaTree then 
      ExportShemaTree(TDBShemaTree(ExportElements[I]), SheetNames[I], I + 1);
  end;
  
  ExcelApp.Visible := True;
end;
//******************************************************************************

end.

 