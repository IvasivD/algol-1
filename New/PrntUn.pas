unit PrntUn;

interface

uses
  Windows, Graphics, ToolWin;

{ print support routines }

function MeterToPixel(Meter: Extended; PInch: Integer): Integer;
function MeterToRect(MLeft, MTop: Extended; Width, Height, XPIn, YPIn: Integer): TRect;
function MeterToRect2(MLeft, MTop, MWidth, MHeight: Extended; XPIn, YPIn: Integer): TRect;
procedure PrintBoundaryEdge(Canvas: TCanvas; Borders: TEdgeBorders; var Rect: TRect);
procedure PrintBoundaryRect(Canvas: TCanvas; Width: Integer; const Rect: TRect);
procedure PrintBoundaryText(Canvas: TCanvas;
  Width: Integer; const Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintText(
  Canvas: TCanvas; Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintAlignedText(Canvas: TCanvas;
  const Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintAlignedTextCalc(Canvas: TCanvas;
  var Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintAlignedTextCalcOnly(Canvas: TCanvas;
  var Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintPageNo(Canvas: TCanvas; PageNo: Integer; Align: Cardinal);
procedure PrintParagraph(Canvas: TCanvas; var Rect: TRect;
  const Title: string; Body: array of string);
procedure PrintParagraphToPrinter(var Rect: TRect; YMin, YMax: Integer;
  const Title: string; Body: array of string; Bold: array of Boolean);
procedure PrintTitleSign(Canvas: TCanvas; XPIn, YPIn: Integer);
// sets options for currently selected printer:
//   AnOrientaion: 1 = Portrait; 2 = Landscape;
//   ADuplex:      DMDUP_SIMPLEX (default), DMDUP_HORIZONTAL, DMDUP_VERTICAL
procedure SetPrinterOptions(DefaultPrinter: Boolean; AnOrientation: Integer;
  ACopies: Integer = 1; ADuplex: Integer = DMDUP_SIMPLEX; APaperA3: Boolean = False);
procedure SetPrinterOptionsEx(
  APaperSize, APaperWidth, APaperHeight, AnOrientation: Integer;
  ACopies: Integer = 1; ADuplex: Integer = 1; ABin: Integer = DMBIN_AUTO);
//procedure GetPrinterPapers(PaperList: TStrings);


implementation

uses Classes, SysUtils, Printers, Forms, Jpeg, WinSpool, Controls, TourConsts;

{ print support routines }

const MmPIn = 25.4; // milimeters per inch

// translate milimeters (Meter) into pixels (Result) by pixels per inch (PInch)
function MeterToPixel(Meter: Extended; PInch: Integer): Integer;
begin
  Result := Round(Meter / MmPIn * PInch);
end;

function MeterToRect(MLeft, MTop: Extended; Width, Height, XPIn, YPIn: Integer): TRect;
begin
  Result := Bounds(
    MeterToPixel(MLeft, XPIn), MeterToPixel(MTop, YPIn), Width, Height);
end;

function MeterToRect2(MLeft, MTop, MWidth, MHeight: Extended; XPIn, YPIn: Integer): TRect;
begin
  Result := Bounds(MeterToPixel(MLeft, XPIn), MeterToPixel(MTop, YPIn),
    MeterToPixel(MWidth, XPIn), MeterToPixel(MHeight, YPIn));
end;

function DrawCanvasText(Canvas: TCanvas; const Text: String; var Rect: TRect; Format: Cardinal): Integer;
begin
  {$WARN UNSAFE_TYPE OFF}
  Result := DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Format);
  {$WARN UNSAFE_TYPE ON}
end;

procedure PrintBoundaryEdge(Canvas: TCanvas; Borders: TEdgeBorders; var Rect: TRect);
begin
  with Canvas do
  begin
    if ebLeft in Borders then
    begin
      MoveTo(Rect.Left, Rect.Top);
      LineTo(Rect.Left, Rect.Bottom);
    end;
    if ebTop in Borders then
    begin
      MoveTo(Rect.Left, Rect.Top);
      LineTo(Rect.Right, Rect.Top);
    end;
    if ebRight in Borders then
    begin
      MoveTo(Rect.Right, Rect.Top);
      LineTo(Rect.Right, Rect.Bottom);
    end;
    if ebBottom in Borders then
    begin
      MoveTo(Rect.Left, Rect.Bottom);
      LineTo(Rect.Right, Rect.Bottom);
    end;
  end;
end;

procedure PrintBoundaryRect(Canvas: TCanvas; Width: Integer; const Rect: TRect);
var
  Rct: TRect;
  BCl: TColor;
  BSt: TBrushStyle;
  I: Integer;
begin
  Rct := Rect;
  with Canvas do
  begin
    BCl := Brush.Color;
    BSt := bsSolid;
    Brush.Color := clBlack;
    Brush.Style := bsSolid;
    for I := 1 to Width do
    begin
      FrameRect(Rct);
      InflateRect(Rct, -1, -1);
    end;
    Brush.Color := BCl;
    Brush.Style := BSt;
  end;
end;

procedure PrintBoundaryText(Canvas: TCanvas;
  Width: Integer; const Rect: TRect; const Txt: string; Align: Cardinal);
var Rct: TRect;
begin
  PrintBoundaryRect(Canvas, Width, Rect);
  Rct := Rect;
  InflateRect(Rct, -Width - 4, -Width);
  PrintAlignedText(Canvas, Rct, Txt, Align);
end;

procedure PrintText(
  Canvas: TCanvas; Rect: TRect; const Txt: string; Align: Cardinal);
begin
  DrawCanvasText(Canvas, Txt, Rect, Align);
end;

procedure PrintAlignedText(Canvas: TCanvas;
  const Rect: TRect; const Txt: string; Align: Cardinal);
var Rct: TRect;
begin
  Rct := Rect;
  PrintAlignedTextCalc(Canvas, Rct, Txt, Align);
end;

procedure PrintAlignedTextCalc(Canvas: TCanvas; var Rect: TRect; const Txt: string; Align: Cardinal);
var H: Integer;
begin
  with Canvas do
  begin
    if Rect.Right = Rect.Left then Rect.Right := Rect.Left + TextWidth(Txt) + 3;
    if Rect.Bottom = Rect.Top then Rect.Bottom := Rect.Top + TextHeight('Yy') + 3;
    if (DT_WORDBREAK and Align) <> 0 then
    begin
      H := DrawCanvasText(Canvas, Txt, Rect, Align + DT_CALCRECT);
      Rect.Bottom := Rect.Top + H;
    end;
    DrawCanvasText(Canvas, Txt, Rect, Align);
  end;
end;

procedure PrintAlignedTextCalcOnly(Canvas: TCanvas; var Rect: TRect; const Txt: string; Align: Cardinal);
var H: Integer;
begin
  with Canvas do
  begin
    if Rect.Right = Rect.Left then Rect.Right := Rect.Left + TextWidth(Txt) + 3;
    if Rect.Bottom = Rect.Top then Rect.Bottom := Rect.Top + TextHeight('Yy') + 3;
    if (DT_WORDBREAK and Align) <> 0 then
    begin
      H := DrawCanvasText(Canvas, Txt, Rect, Align + DT_CALCRECT);
      Rect.Bottom := Rect.Top + H;
    end;
  end;
end;

procedure PrintPageNo(Canvas: TCanvas; PageNo: Integer; Align: Cardinal);
var
  Rct: TRect;
  Txt: string;
  XMrg: Integer;
begin
  Txt := Format(SVDlgsPageNo, [PageNo]);
  with Canvas do
  begin
    Rct := ClipRect;
    XMrg := TextWidth('h');
    Rct.Left := Rct.Left + XMrg * 2;
    Rct.Right := Rct.Right - XMrg * 2;
    {if Rct.Right = Rct.Left then Rct.Right := Rct.Left + TextWidth(Txt) + 3;
    if Rct.Bottom = Rct.Top then Rct.Bottom := Rct.Top + TextHeight(Txt) + 3;}
    DrawCanvasText(Canvas, Txt, Rct, Align); //DT_BOTTOM + DT_RIGHT);
  end;
end;

procedure PrintParagraph(Canvas: TCanvas; var Rect: TRect;
  const Title: string; Body: array of string);
var
  Rct: TRect;
  X, Y, W, H, I: Integer;
begin
  Rct := Rect;
  Canvas.Font.Style := [fsBold];
  PrintAlignedTextCalc(Canvas, Rct, Title, DT_CENTER);
  Canvas.Font.Style := [];
  X := Rct.Left;
  W := Rct.Right - X;
  H := Rct.Bottom - Rct.Top;
  Y := Rct.Bottom + H;
  Rct := Bounds(X, Y, W, H);
  for I := 0 to High(Body) do
  begin
    PrintAlignedTextCalc(Canvas, Rct, Body[I], DT_LEFT + DT_WORDBREAK);
    Rct.Top := Rct.Bottom;
    Rct.Right := Rct.Left + W;
  end;
  Rect.Bottom := Rct.Bottom;
end;

procedure PrintParagraphToPrinter(var Rect: TRect; YMin, YMax: Integer;
  const Title: string; Body: array of string; Bold: array of Boolean);
var
  Rct: TRect;
  X, Y, W, H, I: Integer;
begin
  Rct := Rect;
  Printer.Canvas.Font.Style := [fsBold];
  PrintAlignedTextCalc(Printer.Canvas, Rct, Title, DT_CENTER);
  Printer.Canvas.Font.Style := [];
  X := Rct.Left;
  W := Rct.Right - X;
  H := Rct.Bottom - Rct.Top;
  Y := Rct.Bottom + H div 2;
  Rct := Bounds(X, Y, W, H);
  for I := 0 to High(Body) do
  begin
    with Printer.Canvas.Font do
      if (High(Bold) < I) or not Bold[I] then Style := []
      else Style := [fsBold];
    PrintAlignedTextCalcOnly(Printer.Canvas, Rct, Body[I], DT_LEFT + DT_WORDBREAK);
    if Rct.Bottom > YMax then
    begin
      Rct.Top := YMin;
      Rct.Bottom := YMin + H;
      Printer.NewPage;
    end;
    PrintAlignedTextCalc(Printer.Canvas, Rct, Body[I], DT_LEFT + DT_WORDBREAK);
    Rct.Top := Rct.Bottom;
    Rct.Right := Rct.Left + W;
  end;
  Rect.Bottom := Rct.Bottom;
end;

procedure PrintTitleSign(Canvas: TCanvas; XPIn, YPIn: Integer);
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const pSgn: array[0..4] of Pointer = (
    @SVDlgsSign0, @SVDlgsSign1, @SVDlgsSign2, @SVDlgsSign3, @SVDlgsSign4);
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
var
  Rct: TRect;
  Y, W, H, I: Integer;
  Txt: string;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  LgRes, LgSize: Integer;
  {$WARN UNSAFE_TYPE OFF}
  LgResP: Pointer;
  {$WARN UNSAFE_TYPE ON}
  LgMem: TMemoryStream;
begin
  Application.ProcessMessages;
  Bmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    {$WARN UNSAFE_TYPE OFF}
    LgRes := FindResource(HInstance, 'TMDOWLG', RT_RCDATA);
    {$WARN UNSAFE_TYPE ON}
    if LgRes <> 0 then
    begin
      LgSize := SizeofResource(HInstance, LgRes);
      LgRes := LoadResource(HInstance, LgRes);
      if LgRes <> 0 then
      begin
        {$WARN UNSAFE_TYPE OFF}
        LgResP := LockResource(LgRes);
        if LgResP <> nil then
        {$WARN UNSAFE_TYPE ON}
        begin
          LgMem := TMemoryStream.Create;
          with LgMem do
          try
            {$WARN UNSAFE_TYPE OFF}
            Write(LgResP^, LgSize);
            {$WARN UNSAFE_TYPE ON}
            Seek(0, soFromBeginning);
            Jpg.LoadFromStream(LgMem);
          finally
            Free;
          end;
          UnlockResource(LgRes);
        end;
        FreeResource(LgRes);
      end;
    end;
    with Canvas do
    begin
      Font.Name := 'Arial Cyr';
      Font.Size := 11;
      Font.Style := [fsItalic];
      W := TextWidth('Yy') * 2;
      H := TextHeight('Yy') + 2;
      Y := MeterToPixel(10, YPIn);
      for I := Low(pSgn) to High(pSgn) do
      begin
        Txt := LoadResString(pSgn[I]);
        Rct := Rect(ClipRect.Left + W, Y, ClipRect.Right - W, Y + H);
        DrawCanvasText(Canvas, Txt, Rct, TA_RIGHT + TA_BOTTOM);
        Inc(Y, H);
      end;
      try
        Bmp.Assign(Jpg);
        Draw(MeterToPixel(10, XPIn), MeterToPixel(5, YPIn), Bmp);
      except
      end;
      Rct := Rect(ClipRect.Left + W, Y + 10, ClipRect.Right - W, Y + 20);
      Brush.Color := clBlack;
      Rectangle(Rct);
      Brush.Color := clWhite;
      MoveTo(Rct.Left, Rct.Bottom + 10);
      LineTo(Rct.Right, Rct.Bottom + 10);
    end;
  finally
    Jpg.Free;
    Bmp.Free;
  end;
end;

procedure SetPrinterOptions(DefaultPrinter: Boolean; AnOrientation: Integer;
  ACopies: Integer = 1; ADuplex: Integer = DMDUP_SIMPLEX; APaperA3: Boolean = False);
var
  Device: array[0..cchDeviceName - 1] of Char;
  Driver: array[0..(MAX_PATH - 1)] of Char;
  Port: array[0..32] of Char;
  hDMode: THandle;
  pDMode: PDevMode;
  Fields: LongWord;
begin
  if DefaultPrinter then Printer.PrinterIndex := -1;
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  if hDMode <> 0 then
  begin
    pDMode := GlobalLock(hDMode);
    if pDMode <> nil then
    begin
      case APaperA3 of
        False:
          if AnOrientation = DMORIENT_LANDSCAPE then pDMode^.dmPaperSize := DMPAPER_A4
          else pDMode^.dmPaperSize := DMPAPER_A4_TRANSVERSE;
        True: pDMode^.dmPaperSize := DMPAPER_A3;
          {if AnOrientation = 2 then pDMode^.dmPaperSize := DMPAPER_A3
            else pDMode^.dmPaperSize := DMPAPER_A3_TRANSVERSE;}
      end;
      pDMode^.dmOrientation := AnOrientation;
      Fields := DM_PAPERSIZE or DM_ORIENTATION;
      if ACopies > 1 then
      begin
        pDMode^.dmCopies := ACopies;
        Fields := Fields or DM_COPIES;
      end;
      if ADuplex <> DMDUP_SIMPLEX then
      begin
        pDMode^.dmDuplex := ADuplex;
        Fields := Fields or DM_DUPLEX;
      end;
      pDMode^.dmFields := pDMode^.dmFields or Fields;
      GlobalUnlock(hDMode);
      Printer.PrinterIndex := Printer.PrinterIndex;
    end;
  end;
end;

{$IFDEF WIN32}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
procedure UpdateForm(PrinterHandle: THandle; const aFormName: String; aDimensions: TPoint; aPrintArea: TRect);
const FormLevel: Byte = 1;
var
  liSizeOfInfo: Cardinal;
  lFormInfo: TFormInfo1;
  lpNewFormInfo, lpCurrentFormInfo: PFormInfo1;
begin
  if not (Win32Platform = VER_PLATFORM_WIN32_NT) then Exit;
  {initialize the FormInfo data structure}
  with lFormInfo do
  begin
    Flags   := 0; {indicates form is not built-in}
    pName   := PChar(aFormName);
    Size.cx := aDimensions.X;
    Size.cy := aDimensions.Y;
    ImageableArea.Left   := aPrintArea.Left;
    ImageableArea.Top    := aPrintArea.Top;
    ImageableArea.Right  := aPrintArea.Right;
    ImageableArea.Bottom := aPrintArea.Bottom;
  end;
  lpNewFormInfo := @lFormInfo;
  liSizeOfInfo := 0;
  {get size of PrinterInfo buffer needed }
  GetForm(PrinterHandle, PChar(aFormName), FormLevel, nil, 0, liSizeOfInfo);
  {allocate required memory}
  GetMem(lpCurrentFormInfo, liSizeOfInfo);
  try
    {get form info}
    if GetForm(PrinterHandle, PChar(aFormName), FormLevel, lpCurrentFormInfo, liSizeOfInfo, liSizeOfInfo) then
      {set existing form's dimensions}
      Winspool.SetForm(PrinterHandle, PChar(aFormName), FormLevel, lpNewFormInfo)
    else
      {add a new form with required dimensions }
      Winspool.AddForm(PrinterHandle, FormLevel, lpNewFormInfo);
  finally
    FreeMem(lpCurrentFormInfo, liSizeOfInfo);
  end; {try, finally}
end; {procedure, UpdateForm}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
{$ENDIF}

procedure SetPrinterOptionsEx(
  APaperSize, APaperWidth, APaperHeight, AnOrientation: Integer;
  ACopies: Integer = 1; ADuplex: Integer = 1; ABin: Integer = DMBIN_AUTO);
var
  lPaperDimensions: TPoint;
  lImageableArea: TRect;
  Device: array[0..cchDeviceName - 1] of Char;
  Driver: array[0..(MAX_PATH - 1)] of Char;
  Port: array[0..32] of Char;
  hDMode: THandle;
{$IFDEF WIN32}
  lPDevMode: PDeviceMode;
{$ELSE}
  lPDevMode: ^TDevMode;
{$ENDIF}
  PrinterHandle: THandle;
begin
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  if hDMode = 0 then Exit;
  lPDevMode := GlobalLock(hDMode);
  if lPDevMode = nil then Exit;
  if AnOrientation = DMORIENT_PORTRAIT then
  begin
   lPaperDimensions.X  := APaperWidth;
   lPaperDimensions.Y  := APaperHeight;
  end
  else begin
    lPaperDimensions.X  := APaperHeight;
    lPaperDimensions.Y  := APaperWidth;
  end;
{$IFDEF WIN32}
  {for Custom size paper on WinNT, need to add/modify a Form named Custom}
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and (APaperSize = 256) then
    begin
      lImageableArea.Left   := 0;
      lImageableArea.Top    := 0;
      lImageableArea.Right  := lPaperDimensions.X;
      lImageableArea.Bottom := lPaperDimensions.Y;
      PrinterHandle := LoadLibrary(Driver);
      if PrinterHandle <= 16 then PrinterHandle := 0;
      UpdateForm(PrinterHandle, 'Custom', lPaperDimensions, lImageableArea);
      StrPCopy(lPDevMode^.dmFormName, 'Custom');
    end;
{$ENDIF}
  {set dmFields}
  lPDevMode^.dmFields := DM_COPIES or DM_DUPLEX or DM_ORIENTATION or DM_PAPERSIZE;
  lPDevMode^.dmCopies  := ACopies;
  {set duplex & orientation}
  lPDevMode^.dmDuplex      := ADuplex;
  lPDevMode^.dmOrientation := Ord(AnOrientation) + 1;
  {set paper size}
  lPDevMode^.dmPaperSize := APaperSize;
  {if custom, set PaperLength, PaperWidth}
  if (lPDevMode^.dmPaperSize >= 256) then
  begin
    lPDevMode^.dmFields := lPDevMode^.dmFields or DM_PAPERLENGTH or DM_PAPERWIDTH;
    lPDevMode^.dmPaperWidth  := lPaperDimensions.X;
    lPDevMode^.dmPaperLength := lPaperDimensions.Y;
  end;
  {set paper bin, if needed}
  if ABin <> DMBIN_AUTO then
  begin
    lPDevMode^.dmDefaultSource := DMBIN_AUTO;
    lPDevMode^.dmFields := lPDevMode^.dmFields or DM_DEFAULTSOURCE;
  end;
  GlobalUnlock(hDMode);
  Printer.PrinterIndex := Printer.PrinterIndex;
end;

end.
