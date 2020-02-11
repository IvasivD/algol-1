unit PrntGrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, CheckLst, ExtCtrls, Grids, DB, DBGrids, SvtDBGrids;

type
  TPrintGridPropertyDlg = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    TitleEdit: TEdit;
    CheckListBox: TCheckListBox;
    CheckAllBtn: TSpeedButton;
    UncheckAllBtn: TSpeedButton;
    procedure CheckAllBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure FillColumns(Grid: TCustomGrid; ColVis: array of Boolean);
    procedure FillVisibility(var ColVis: array of Boolean);
  end;

var
  PrintGridPropertyDlg: TPrintGridPropertyDlg;

// print contents of TDBGrid component
procedure PrintGrid(
  const DocTitle, ManagerName: String; Header: TStrings; ShowDlg: Boolean;
  Grid: TCustomGrid; UniqueColumn: TField; RefuseColumn: TField;
  const FontName: String; FontSize: Integer; SetupDlg: TPrintDialog);
  overload;
procedure PrintGrid(
  const DocTitle, ManagerName: String; Header, Footer: TStrings; ShowDlg: Boolean;
  Grid: TCustomGrid; UniqueColumn: TField; RefuseColumn: TField;
  const FontName: String; FontSize: Integer; SetupDlg: TPrintDialog);
  overload;
procedure PrintGrid(
  const DocTitle, ManagerName: String; Header, Footer: TStrings; ShowDlg: Boolean;
  Grid: TCustomGrid; UniqueColumn: TField; RefuseColumn: TField;
  const FontName: String; FontSize: Integer; SetupDlg: TPrintDialog;
  ColScale: array of Integer; ColVis: array of Boolean); overload;

implementation

uses Printers, PrntUn, TourConsts, TourStrMag;

{$R *.dfm}

{ function ExecutePrintGridPropertyDlg }

function ExecutePrintGridPropertyDlg(var PrintTitle: String;
  Grid: TCustomGrid; var ColVis: array of Boolean): Boolean;
begin
  with TPrintGridPropertyDlg.Create(Application) do
    try
      TitleEdit.Text := PrintTitle;
      FillColumns(Grid, ColVis);
      Result := ShowModal = mrOk;
      if Result then
      begin
        FillVisibility(ColVis);
        PrintTitle := TitleEdit.Text;
      end;
    finally
      Free;
    end;
end;

{ recognize the value type }

function CheckStrAsNumber(const Str: String): Boolean;
begin
  try
    StrToFloat(Str);
    Result := True;
  except
    Result := False;
  end;
end;

function CheckStrAsFloat(const Str: String): Boolean;
begin
  Result := CheckStrAsNumber(Str);
end;

function CheckStrAsInteger(const Str: String): Boolean;
begin
  try
    StrToInt(Str);
    Result := True;
  except
    Result := False;
  end;
end;

function CheckStrAsDateTime(const Str: String): Boolean;
begin
  try
    StrToDateTime(Str);
    Result := True;
  except
    Result := False;
  end;
end;

{ procedure PrintGrid }

function GetGridCanvas(Grid: TCustomGrid): TCanvas;
begin
  if Grid is TSvtDBGrid then Result := (Grid as TSvtDBGrid).Canvas
  else if Grid is TDBGrid then Result := (Grid as TDBGrid).Canvas
  else if Grid is TStringGrid then Result := (Grid as TStringGrid).Canvas
  else Result := nil;
end;

function GetGridColumnCount(Grid: TCustomGrid): Integer;
begin
  if Grid is TSvtDBGrid then Result := (Grid as TSvtDBGrid).Columns.Count
  else if Grid is TDBGrid then Result := (Grid as TDBGrid).Columns.Count
  else if Grid is TStringGrid then Result := (Grid as TStringGrid).ColCount
  else Result := 0;
end;

function GetGridDataSet(Grid: TCustomGrid): TDataSet;
begin
  if Grid is TSvtDBGrid then Result := (Grid as TSvtDBGrid).DataSource.DataSet
  else if Grid is TDBGrid then Result := (Grid as TDBGrid).DataSource.DataSet
  else Result := nil;
end;

procedure PrintGrid(
  const DocTitle, ManagerName: String; Header: TStrings; ShowDlg: Boolean;
  Grid: TCustomGrid; UniqueColumn: TField; RefuseColumn: TField;
  const FontName: String; FontSize: Integer; SetupDlg: TPrintDialog);
var Footer: TStrings;
begin
  Footer := nil;
  PrintGrid(
    DocTitle, ManagerName, Header, Footer, ShowDlg,
    Grid, UniqueColumn, RefuseColumn, FontName, FontSize, SetupDlg);
end;

procedure PrintGrid(
  const DocTitle, ManagerName: String; Header, Footer: TStrings; ShowDlg: Boolean;
  Grid: TCustomGrid; UniqueColumn: TField; RefuseColumn: TField;
  const FontName: String; FontSize: Integer; SetupDlg: TPrintDialog);
var
  ColScale: array of Integer;
  ColVis: array of Boolean;
  Cols, I: Integer;
begin
  Cols := GetGridColumnCount(Grid);
  if Cols = 0 then Exit;
  SetLength(ColScale, Cols);
  SetLength(ColVis, Cols);
  for I := 0 to High(ColVis) do
  begin
    ColScale[I] := 90;
    ColVis[I] := I < 18{16};
  end;
  PrintGrid(DocTitle, ManagerName, Header, Footer, ShowDlg,
    Grid, UniqueColumn, RefuseColumn,
    FontName, FontSize, SetupDlg, ColScale, ColVis);
end;

procedure PrintGrid(
  const DocTitle, ManagerName: String; Header, Footer: TStrings; ShowDlg: Boolean;
  Grid: TCustomGrid; UniqueColumn: TField; RefuseColumn: TField;
  const FontName: String; FontSize: Integer; SetupDlg: TPrintDialog;
  ColScale: array of Integer; ColVis: array of Boolean);
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
  DelArr: array of Boolean;
  DocTtl, SubTtl, Tourist, Addr1, Addr2, S: string;
  DataSet: TDataSet;
  DataSetAfterScroll: TDataSetNotifyEvent;
  GridCanvas: TCanvas;
  procedure PrintManager(Canvas: TCanvas);
  begin
    Canvas.Font.Color := clGray;
    Canvas.Font.Size := 8;
    PrintAlignedText(Canvas, Bounds(XMrg, YMax, PW, H),
      Format('%s %s', [ManagerName, FormatDateTime('dd.mm.yyyy hh:nn', Now)]), DT_RIGHT);
    Canvas.Font.Color := clBlack;
    Canvas.Font.Size := FontSize;
  end;
  procedure PrintPageNo(Canvas: TCanvas);
  begin
    Rct := Bounds(XMrg, YMax, PW, H);   // print the page no
    PrintAlignedTextCalc(Canvas, Rct, Format(SVDlgsPageNo, [Pg]), DT_RIGHT);
    PrintManager(Canvas);
  end;
  procedure PrintHeader(Canvas: TCanvas);
  var I: Integer;
  begin
    Rct := Bounds(XMrg, YMin, PW, 0);
    with Canvas.Font do
    begin
      Style := [fsBold];
      Size := 14;
    end;
    PrintAlignedTextCalc(Canvas, Rct, DocTtl, DT_CENTER); // print title
    if Assigned(Header) and (Header.Count > 0) then   // print header lines
    begin
      Canvas.Font.Size := 11;
      for I := 0 to Header.Count - 1 do
      begin
        Rct.Top := Rct.Bottom;
        PrintAlignedTextCalc(Canvas, Rct, Header[I], DT_LEFT);
      end;
    end;
    with Canvas.Font do
    begin
      Style := [];
      Size := FontSize;
    end;
    YMrg := Rct.Bottom + Canvas.TextHeight('Yy') div 3;
  end;
  procedure PrintFooter(Canvas: TCanvas);
  var I: Integer;
  begin
    Inc(Y, H);
    for I := 0 to Footer.Count - 1 do  // print footer lines
    begin
      if Y + H > YMax then
      begin
        PrintPageNo(Canvas);
        Printer.NewPage;
        Y := YMin;
        Inc(Pg);
      end;
      Rct := Bounds(XMrg, Y, PW, 0);
      PrintAlignedTextCalc(Canvas, Rct, Footer[I], DT_LEFT); 
      Inc(Y, H);
    end;
  end;
begin
  if Assigned(UniqueColumn) then Id := UniqueColumn.AsInteger else Id := 0;
  RepCols := GetGridColumnCount(Grid);
  DataSet := GetGridDataSet(Grid);
  if Assigned(DataSet) then RepRows := DataSet.RecordCount
  else if Grid is TStringGrid then RepRows := (Grid as TStringGrid).RowCount
  else Exit;
  SetLength(TitleArr, RepCols);
  SetLength(AlignArr, RepCols);
  SetLength(WidthArr, RepCols);
  SetLength(VisArr, RepCols);
  SetLength(FieldArr, RepCols);
  SetLength(DataArr, RepRows);  
  SetLength(DelArr, RepRows);
  GridCanvas := GetGridCanvas(Grid);
  for J := 0 to High(DataArr) do SetLength(DataArr[J], RepCols);
  CWd := GridCanvas.TextWidth('9');
  DocTtl := DocTitle; // may be changed in a TPrintGridPropertyDlg dialog
  for I := 0 to RepCols - 1 do
    if Grid is TSvtDBGrid then
      with (Grid as TSvtDBGrid).Columns.Items[I] do
      begin
        TitleArr[I] := Title.Caption;
        FieldArr[I] := FieldName;
        case Alignment of
          taRightJustify: AlignArr[I] := DT_RIGHT;
          taCenter: AlignArr[I] := DT_CENTER;
          else AlignArr[I] := DT_LEFT;
        end;
        try
          WidthArr[I] := Round(Width * ColScale[I] / CWd / 100);
        except
          WidthArr[I] := Round(Width / CWd);
        end;
        if ShowDlg then VisArr[I] := Visible
        else
          try
            VisArr[I] := Visible and ColVis[I];
          except
            VisArr[I] := Visible;
          end;
      end
    else if Grid is TDBGrid then
      with (Grid as TDBGrid).Columns.Items[I] do
      begin
        TitleArr[I] := Title.Caption;
        FieldArr[I] := FieldName;
        case Alignment of
          taRightJustify: AlignArr[I] := DT_RIGHT;
          taCenter: AlignArr[I] := DT_CENTER;
          else AlignArr[I] := DT_LEFT;
        end;
        try
          WidthArr[I] := Round(Width * ColScale[I] / CWd / 100);
        except
          WidthArr[I] := Round(Width / CWd);
        end;
        if ShowDlg then VisArr[I] := Visible
        else
          try
            VisArr[I] := Visible and ColVis[I];
          except
            VisArr[I] := Visible;
          end;
      end
    else if Grid is TStringGrid then
      with Grid as TStringGrid do
      begin
        TitleArr[I] := Cells[I, 0];
        FieldArr[I] := '';
        AlignArr[I] := DT_LEFT;
        for J := 1 to RowCount - 1 do  // підібрати вирівнювання для колонок
          if AlignArr[I] = DT_LEFT then
          begin
            S := Cells[I, J];
            if CheckStrAsDateTime(S) then AlignArr[I] := DT_CENTER
            else if CheckStrAsNumber(S) then AlignArr[I] := DT_RIGHT;
          end;
        try
          WidthArr[I] := Round(ColWidths[I] * ColScale[I] / CWd / 100);
        except
          WidthArr[I] := Round(ColWidths[I] / CWd);
        end;
        VisArr[I] := ColVis[I];
      end;
  if ShowDlg and not ExecutePrintGridPropertyDlg(DocTtl, Grid, VisArr) then
    Exit;
  J := 0;
  if Assigned(DataSet) then
    with DataSet do
    begin
      Screen.Cursor := crHourGlass;
      DataSetAfterScroll := AfterScroll;
      AfterScroll := nil;
      DisableControls;
      try
        First;
        while not Eof do
        begin
          for I := 0 to RepCols - 1 do
            if FieldArr[I] = '' then DataArr[J, I] := ''
            else DataArr[J, I] :=
              StringWithoutCRLF(FieldByName(FieldArr[I]).DisplayText);
          DelArr[J] := Assigned(RefuseColumn)
            and (RefuseColumn <> nil) and RefuseColumn.AsBoolean;
          Inc(J);
          Next;
        end;
        if Assigned(UniqueColumn) and (Id > 0) then
          Locate(UniqueColumn.FieldName, Id, []);
      finally
        EnableControls;
        AfterScroll := DataSetAfterScroll;
        Screen.Cursor := crDefault;
      end;
    end
  else if Grid is TStringGrid then
    with Grid as TStringGrid do
      for J := 1 to RowCount - 1 do
        for I := 0 to ColCount - 1 do
          DataArr[J, I] := Cells[I, J];
  if Assigned(SetupDlg) and not SetupDlg.Execute then Exit;
  Printer.Title := DocTitle;
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
    Pg := 1;    // page counter
    PW := PageWidth - XMrg * 2;  // page width without margins
    if FontName = '' then  Font.Name := 'Arial' else Font.Name := FontName;
    PrintHeader(Canvas);
    XC := XPIn div Screen.PixelsPerInch;  // X scale
    CWp := TextWidth('9');
    for I := 0 to RepCols - 1 do
      if VisArr[I] then WidthArr[I] := WidthArr[I] * CWp + 4
      else WidthArr[I] := 0;
    H := TextHeight('Yy') + 2; // row height
    HH := H * 2 + H div 8;
    YMin := YMin + HH; //YMrg := YMrg * 2;
    Flags := DT_BOTTOM + DT_NOCLIP; // drawing flag
    N := 0;  // last column no fot the current page
    C := 0;  // at which column ends the previous page
    while C < RepCols do
    begin
      W := 0;                     // calculate count of columns per current page
      for I := C to RepCols - 1 do
      begin
        if VisArr[I] then
        begin
          Inc(W, WidthArr[I]);
          if W > PW then Break;
        end;
        N := Succ(I);
      end;
      Y := YMrg + HH;
      for J := 0 to RepRows - 1 do  // print all rows for range of columns
      begin
        if Y + H > YMax then
        begin
          PrintPageNo(Canvas);
          NewPage;
          Y := YMin;
          Inc(Pg);
        end;
        X := XMrg;
        for I := C to N - 1 do
          if VisArr[I] then
          begin
            W := WidthArr[I];
            if (J = 0) or (Y = YMin) then         // print column title
              PrintBoundaryText(Canvas, 3, Bounds(X, {YMrg}Y - HH, W, HH),
                TitleArr[I], DT_CENTER + DT_VCENTER); // + DT_WORDBREAK);
            with Canvas.Font do
              if DelArr[J] then Style := Style + [fsStrikeOut]
              else Style := Style - [fsStrikeOut];
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
    if Assigned(Footer) then PrintFooter(Canvas);
    if Pg > 1 then PrintPageNo(Canvas) else PrintManager(Canvas);
  finally
    EndDoc;
    Screen.Cursor := crDefault;
  end;
end;

{ TPrintGridPropertyDlg }

procedure TPrintGridPropertyDlg.FillColumns(Grid: TCustomGrid; ColVis: array of Boolean);
var
  Vis: Boolean;
  I: Integer;
begin
  CheckListBox.Clear;
  if Grid is TSvtDBGrid then
    with Grid as TSvtDBGrid do
      for I := 0 to Columns.Count - 1 do
        CheckListBox.AddItem(Columns[I].Title.Caption, Columns[I])
  else if Grid is TDBGrid then
    with Grid as TDBGrid do
      for I := 0 to Columns.Count - 1 do
        CheckListBox.AddItem(Columns[I].Title.Caption, Columns[I])
  else Exit;
  with CheckListBox, Items do
    for I := 0 to Count - 1 do
    begin
      if Grid is TSvtDBGrid then Vis := (Objects[I] as TSvtColumn).Visible
      else Vis := (Objects[I] as TColumn).Visible;
      try
        Checked[I] := Vis and ColVis[I];
      except
        Checked[I] := Vis;
      end;
    end;
end;

procedure TPrintGridPropertyDlg.FillVisibility(var ColVis: array of Boolean);
var I: Integer;
begin
  with CheckListBox, Items do
  try
    //SetLength(ColVis, Count);
    for I := 0 to Count - 1 do ColVis[I] := Checked[I];
  except
  end;
end;

procedure TPrintGridPropertyDlg.CheckAllBtnClick(Sender: TObject);
var
  I: Integer;
  B: Boolean;
begin
  B := (Sender as TComponent).Tag <> 0;
  with CheckListBox do for I := 0 to Items.Count - 1 do Checked[I] := B;
end;

procedure TPrintGridPropertyDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not CanClose then ModalResult := mrNone;
end;

end.
