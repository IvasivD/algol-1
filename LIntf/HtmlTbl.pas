unit HtmlTbl;

interface

uses DB;

const
  sParagraphBeg = '<p>';
  sParagraphEnd = '</p>';

function HtmlOneTable(DataSet: TDataSet; MaxRows: Integer; ShowColumnHeader: Boolean): string;


implementation

uses SysUtils, OrdConsts;

const
  sEndRow = '</tr>';
  sEndTable = '</table>';
  sLineBr = #13#10;
  sAlign: array[THTMLCaptionAlignment] of string =
    ('>',
     ' Align="Top">',
     ' Align="Bottom">');

const
  nServHeaderWidth = 625; 
  nOrderTableHeight = 336;
  nPersonTableHeight = 366;

function HtmlFormatCell(
  DataSetHandler: TDataSetTableProducer; CellRow, CellColumn: Integer;
  CellData: string; const Tag: string; const BgColor: THTMLBgColor;
  Align: THTMLAlign; VAlign: THTMLVAlign; const Custom: string): string;
var
  CellAlign: THTMLAlign;
  CellVAlign: THTMLVAlign;
  CellBg: THTMLBgColor;
  CustomAttrs: string;
begin
  Result := Format('<%s', [Tag]);
  CellBg := BgColor;
  CellAlign := Align;
  CellVAlign := VAlign;
  CustomAttrs := Custom;
  with DataSetHandler do
    if Assigned(OnFormatCell) then
      OnFormatCell(DataSetHandler,
        CellRow, CellColumn, CellBg, CellAlign, CellVAlign, CustomAttrs, CellData);
  Result := Result + HTMLAlign[CellAlign];
  Result := Result + HTMLVAlign[CellVAlign];
  if CellBg <> '' then
    Result := Format('%s BgColor="%s"', [Result, CellBg]);
  if CustomAttrs <> '' then
    Result := Format('%s %s', [Result, CustomAttrs]);
  Result := Result + Format('>%s</%s>', [CellData, Tag]);
end;

function HtmlTableHeader(DataSetHandler: TDataSetTableProducer;
  PresetWidth: Integer = 0;
  ApplyCustom: Boolean = True; const PresetCustom: String = ''): string;
var
  ACaption: string;
  CaptionAlign: THTMLCaptionAlignment;
begin
  Result := '<table';
  with DataSetHandler.TableAttributes do
  begin
    if PresetWidth > 0 then
      Result := Format('%s width="%d"', [Result, PresetWidth])
    else if Width > 0 then
      Result := Format('%s width="%d%%"', [Result, Width]);
    Result := Result + HTMLAlign[Align];
    if CellSpacing > -1 then
      Result := Format('%s CellSpacing=%d', [Result, CellSpacing]);
    if CellPadding > -1 then
      Result := Format('%s CellPadding=%d', [Result, CellPadding]);
    if Border > -1 then
      Result := Format('%s border=%d', [Result, Border]);
    if BgColor <> '' then
      Result := Format('%s BgColor="%s"', [Result, BgColor]);
    if ApplyCustom and (Custom <> '') then
      Result := Format('%s %s', [Result, Custom])
    else if PresetCustom <> '' then
      Result := Format('%s %s', [Result, PresetCustom]);
  end;
  Result := Result + '>';
  ACaption := DataSetHandler.Caption;
  CaptionAlign := DataSetHandler.CaptionAlignment;
  with DataSetHandler do
    if Assigned(OnGetTableCaption) then
      OnGetTableCaption(DataSetHandler, ACaption, CaptionAlign);
  if ACaption <> '' then
    Result := Result +
      Format('<caption %s%s</caption>', [sAlign[CaptionAlign], ACaption]);
end;

function HtmlRowHeader(DataSetHandler: TDataSetTableProducer;
  ApplyCustom: Boolean = True): string;
begin
  Result := '<tr';
  with DataSetHandler.RowAttributes do
  begin
    Result := Result + HTMLAlign[Align];
    Result := Result + HTMLVAlign[VAlign];
    if BgColor <> '' then
      Result := Format('%s BgColor="%s"', [Result, BgColor]);
    if ApplyCustom and (Custom <> '') then
      Result := Format('%s %s', [Result, Custom]);
  end;
  Result := Result + '>';
end;

function HtmlColumnHeader(DataSetHandler: TDataSetTableProducer): string;
var
  I: Integer;
  DisplayText: string;
  Field: TField;
  Column: THTMLTableColumn;
begin
  Result := '';
  for I := 0 to DataSetHandler.Columns.Count - 1 do
  begin
    Column := DataSetHandler.Columns[I];
    Field := Column.Field;
    if Column.Title.Caption <> '' then
      DisplayText := Column.Title.Caption
    else if Field <> nil then
      DisplayText := Field.DisplayLabel
    else DisplayText := Column.DisplayName;
    with Column.Title do
      Result := Result + HtmlFormatCell(DataSetHandler, 0, I, DisplayText, 'th',
        BgColor, Align, VAlign, Custom);
  end;
end;

function HtmlTableRows(
  MasterHandler, DetailHandler: TDataSetTableProducer;
  MaxRows: Integer; ShowMstColumnHeader, ShowDetColumnHeader: Boolean): string;
var
  I, J: Integer;
  DisplayText, RowHeader: string;
  Field: TField;
  Column: THTMLTableColumn;
  DataSet: TDataSet;
begin
  DataSet := MasterHandler.DataSet;
  RowHeader := HtmlRowHeader(MasterHandler);
  if ShowMstColumnHeader then
    Result := RowHeader + HtmlColumnHeader(MasterHandler) + sEndRow + sLineBr
  else Result := '';
  if DataSet.State = dsBrowse then
  begin
    J := 1;
    DataSet.First;
    while not DataSet.Eof do
    begin
      Result := Result + RowHeader;
      for I := 0 to MasterHandler.Columns.Count - 1 do
      begin
        Column := MasterHandler.Columns[I];
        Field := Column.Field;
        if Field <> nil then DisplayText := Field.DisplayText
        else DisplayText := '';
        with Column do
          Result := Result + HtmlFormatCell(MasterHandler,
            J, I, DisplayText, 'td', BgColor, Align, VAlign, Custom);
      end;
      Result := Result + sEndRow +  sLineBr;
      if Assigned(DetailHandler) then
        Result := Result +
          HtmlTableRows(DetailHandler, nil, MaxRows, ShowDetColumnHeader, False);
      DataSet.Next;
      Dec(MaxRows);
      Inc(J);
    end;
  end;
end;

function HtmlOneTable(DataSetHandler: TDataSetTableProducer;
  MaxRows: Integer; ShowColumnHeader: Boolean): string;
var
  DataRowHeader: string;
  DataSet: TDataSet;
begin
  DataSet := DataSetHandler.DataSet;
  DataRowHeader := HtmlRowHeader(DataSetHandler);
  if DataSet.RecordCount = 0 then
  begin
    Result := '';
    Exit;
  end;
  Result := HtmlTableHeader(DataSetHandler) + sLineBr +
    HtmlTableRows(DataSetHandler, nil, MaxRows, ShowColumnHeader, False) +
    sEndTable;
  with DataSetHandler.Header do
    if Text <> '' then Result := Text + sLineBr + Result;
  with DataSetHandler.Footer do
    if Text <> '' then Result := Result + sLineBr + Text;
end;


function HtmlScrolledTable(DataSetHandler: TDataSetTableProducer;
  HeaderWidth: Integer; TableHeight: Integer; const TableDivId: String;
  WithDetails: Boolean): string;
const
  sScrlTableHead =
    '<table width="100%%" border="0"><tr><td>%s</td></tr></table>';
  sScrlTableDiv =
    '<div style="overflow:scroll; overflow-x: hidden; width:642px; height:%dpx; border:1px solid #006699;">' +
    sLineBr + '%s' + sLineBr + '</div>';
  sSDetTableDiv =
    '<div align="center" id="%s"></div>';
  sTableCustom = 'class="data_table"';
var
  RowHeader: string;
  DataSet: TDataSet;
begin
  DataSet := DataSetHandler.DataSet;
  if DataSet.RecordCount = 0 then
  begin
    Result := '';
    Exit;
  end;
  RowHeader := HtmlRowHeader(DataSetHandler, False);
  Result :=
    Format(sScrlTableHead, [
      HtmlTableHeader(DataSetHandler, HeaderWidth, False, sTableCustom) +
      RowHeader + HtmlColumnHeader(DataSetHandler) + sEndRow +
      sEndTable + sLineBr +
      Format(sScrlTableDiv, [
        TableHeight,
        HtmlOneTable(DataSetHandler, DataSetHandler.MaxRows, False)])]);
  if WithDetails then
    Result := Result + sLineBr + Format(sSDetTableDiv, [TableDivId]);
  with DataSetHandler.Header do
    if Text <> '' then Result := Text + sLineBr + Result;
  with DataSetHandler.Footer do
    if Text <> '' then Result := Result + sLineBr + Text;
end;

function HtmlOrderTable(DataSetHandler: TDataSetTableProducer): string;
begin
  Result :=
    HtmlScrolledTable(DataSetHandler,
      nServHeaderWidth, nOrderTableHeight, 'OrderListTable', False);
end;

function HtmlPersonTable(DataSetHandler: TDataSetTableProducer): string;
begin
  Result :=
    HtmlScrolledTable(DataSetHandler,
      nServHeaderWidth, nPersonTableHeight, 'PersonListTable', False);
end;

function HtmlServTable(DataSetHandler: TDataSetTableProducer;
  HeaderWidth: Integer;
  TableHeight: Integer; WithDetails: Boolean): string;
const
  sServTableHead =
    '<table width="100%%" border="0"><tr><td>%s</td></tr></table>';
  sServTableDiv =
    '<div style="overflow:scroll; overflow-x: hidden; width:642px; height:%dpx; border:1px solid #006699;">' +
    sLineBr + '%s' + sLineBr + '</div>';
  sSDetTableDiv =
    '<div align="center" id="%sTableServiceData"></div>';
  sTableCustom = 'class="data_table"';
var
  ServTableId, RowHeader: string;
  DataSet: TDataSet;
begin
  DataSet := DataSetHandler.DataSet;
  ServTableId := GetServiceItem(DataSetHandler.Tag);
  if DataSet.RecordCount = 0 then
  begin
    Result := '';
    Exit;
  end;
  RowHeader := HtmlRowHeader(DataSetHandler, False);
  Result :=
    Format(sServTableHead, [
      HtmlTableHeader(DataSetHandler, HeaderWidth, False, sTableCustom) +
      RowHeader + HtmlColumnHeader(DataSetHandler) + sEndRow +
      sEndTable + sLineBr +
      Format(sServTableDiv, [
        TableHeight,
        HtmlOneTable(DataSetHandler, DataSetHandler.MaxRows, False)])]);
  if WithDetails then
    Result := Result + sLineBr + Format(sSDetTableDiv, [ServTableId]);
  with DataSetHandler.Header do
    if Text <> '' then Result := Text + sLineBr + Result;
  with DataSetHandler.Footer do
    if Text <> '' then Result := Result + sLineBr + Text;
end;

function HtmlServMastTable(DataSetHandler: TDataSetTableProducer): string;
begin
  Result := HtmlServTable(DataSetHandler, nServHeaderWidth, 100, True);
end;

function HtmlServDetTable(DataSetHandler: TDataSetTableProducer): string;
begin
  Result := HtmlServTable(DataSetHandler, nServHeaderWidth, 248, False);
end;

function HtmlSuperTable(
  MasterHandler, DetailHandler: TDataSetTableProducer;
  MaxRows: Integer; ShowMstColumnHeader, ShowDetColumnHeader: Boolean): string;
var MasterRowHeader, DetailRowHeader: string;
begin
  MasterRowHeader := HtmlRowHeader(MasterHandler);
  DetailRowHeader := HtmlRowHeader(DetailHandler);
  if MasterHandler.DataSet.RecordCount = 0 then
  begin
    Result := '';
    Exit;
  end;
  Result := HtmlTableHeader(MasterHandler) + sLineBr +
    HtmlTableRows(MasterHandler, DetailHandler,
      MaxRows, ShowMstColumnHeader, ShowDetColumnHeader) +
    sEndTable;
  with MasterHandler.Header do
    if Text <> '' then Result := Text + sLineBr + Result;
  with MasterHandler.Footer do
    if Text <> '' then Result := Result + sLineBr + Text;
end;

end.
