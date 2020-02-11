unit InsPrntUn;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls, Dialogs;

type
  TPrintReportRec = record
    X, Y: Extended;
    HAlgn, VAlgn: Integer;
    AtPage: Integer;
    TextVal: String;
  end;
  TPrintReportArr = array of TPrintReportRec;
  TPrintReportBmp = record
    X, Y: Extended;
    W, H: Extended;
    FileName: String;
  end;
  TPrintReportBmpArr = array of TPrintReportBmp;

const
  kndMedical: Integer = 12;
  kndUnhappy: Integer = 13;
  kndGrnCard: Integer = 14;
  kndGrnCrdE: Integer = 118;
  nInsureMedical = 0;
  nInsureUnhappy = 1;
  nInsureGrnCard = 2;
  nInsureGrnCrdE = 3;
  taVTopAlign = TA_TOP;
  taVCenterAlign = TA_BASELINE;
  taVBottomAlign = TA_BOTTOM;

type
  TInsureEnum = nInsureMedical..nInsureGrnCrdE;

  TPersonInsurePremiumRec = record
    PersonId: Integer;
    PersonName: String;
    BirthDate: String;
    Passport: String;
    Address: String;
    Premium: Currency;
    PremUnh: Currency;
    Deductible: Currency;
    Icode: String;
    PersonInsurId: Integer;
    GroupId: integer;
    OrderId: integer;
    TourId: integer;
    InsurIdent: string;
    //PremDisc: Extended;
  end;
  TPersonInsurePremiums = array of TPersonInsurePremiumRec;

  TPersonInsurePremSumRec = record
    InsKind: Integer;
    Premium: Currency;
    Value: Currency;
    ValCurr: String;
    PremDisc: Extended;
    Deductible: Currency;
  end;
  TPersonInsurePremSums = array of TPersonInsurePremSumRec;

  TPoliceRangeListItem = class
  private
    FCount: Integer;
    FSerie: String;
    FFrstNo: String;
    FLastNo: String;
  protected
    property Count: Integer read FCount write FCount;
    property Serie: String read FSerie write FSerie;
    property FrstNo: String read FFrstNo write FFrstNo;
    property LastNo: String read FLastNo write FLastNo;
  public
    constructor Create(Cnt: Integer; const Ser, Frst, Last: String);
  end;

  TPoliceRangeList = class(TList)
  public
    destructor Destroy; override;
    procedure AddNewPolice(Cnt: Integer; const Ser, Frst, Last: String);
    procedure AddPolice(APolice: TPoliceRangeListItem);
  end;

var
  PersonInsurePremSums: TPersonInsurePremSums;

{ report printing utilities }
// fill a PrintReportRec record
procedure NewPrintReportItem(X, Y: Extended; HAlgn: TAlignment; VAlgn: Integer;
  const Txt: String; var Res: TPrintReportRec; AtPage: Integer = 0);
// print report from a TPrintReportArr array
function PrintReportForm(Prnt, CopyNo: Integer; Arr: TPrintReportArr;
  Bmp: TPrintReportBmpArr; DotMatrix: Boolean = True): Boolean;
// assign printer list to ComboBox and select item from this list
procedure AssignPrinterComboBox(ComboBox: TComboBox; const FindItem: String;
  SelectFlag: Boolean);
// print the return report
{procedure PrintReturnReport(const VendorName: String);}


implementation

uses Printers, Jpeg, SysUtils, TourConsts, VDlgs, TourCmnlIf;

procedure TextDrawIn(Canvas: TCanvas; HAlgn, VAlgn, PerInch: Integer;
  X, Y: Extended; const Text: String; Upper: Boolean = True; DotMatrix: Boolean = True);
const nAlgn: array[TAlignment] of Integer = (TA_LEFT, TA_RIGHT, TA_CENTER);
var
  Txt: String;
  Rct: TRect;
  Algn, PX, PY: Integer;
begin
  if DotMatrix then
  begin
    PX := Round(PerInch * X / 2.5 * 0.7895);
    PY := Round(PerInch * (Y - 1) / 2.54);
  end
  else begin
    PX := Round(PerInch * X / 2.54);
    PY := Round(PerInch * Y / 2.54);
  end;
  {Rct := Bounds(PX, PY, Canvas.TextWidth(Text) + 10, Canvas.TextHeight(Text) + 5);}
  Algn := nAlgn[TAlignment(HAlgn)];
  case Algn of
    TA_RIGHT:
      Rct := Bounds(
        PX - Canvas.TextWidth(Text) - 10, PY,
        Canvas.TextWidth(Text) + 10, Canvas.TextHeight(Text) + 5);
    TA_CENTER:
      Rct := Bounds(
        PX - Canvas.TextWidth(Text) div 2 - 5, PY,
        Canvas.TextWidth(Text) + 10, Canvas.TextHeight(Text) + 5);
    else Rct := Bounds(PX, PY, Canvas.TextWidth(Text) + 10, Canvas.TextHeight(Text) + 5);
  end;
  if Upper then Txt := AnsiUpperCase(Text) else Txt := Text;
  {$WARN UNSAFE_TYPE OFF}
  DrawText(Canvas.Handle,
    PChar(Txt), Length(Txt), Rct, nAlgn[TAlignment(HAlgn)] + VAlgn);
  {$WARN UNSAFE_TYPE ON}
end;

procedure ImageDrawIn(Canvas: TCanvas; PerInch: Integer;
  X, Y, W, H: Extended; const FileName: String);
var
  Jpg: TJpegImage;
  PX, PY, PW, PH: Integer;

begin
  if not FileExists(FileName) then
  begin
    ErrorFmtDlg(SDataModErrorTemplateNotExists, [FileName]);
    Exit;
  end;
  PX := Round(PerInch * X / 2.54);
  PY := Round(PerInch * Y / 2.54);
  PW := Round(PerInch * W / 2.54);
  PH := Round(PerInch * H / 2.54);
  Jpg := TJPEGImage.Create;
  try
    Jpg.LoadFromFile(FileName);
//    sleep(1500);
    Canvas.StretchDraw(Bounds(PX, PY, PW, PH), Jpg);
  finally
    Jpg.Free;
  end;
end;

procedure DrawPrintReportRec(Canvas: TCanvas; PageNo, PerInch: Integer;
  const Rec: TPrintReportRec; Upper: Boolean = True; DotMatrix: Boolean = True);
begin
  with Rec do
    if (AtPage <= 0) or (AtPage = PageNo) then
      TextDrawIn(Canvas, HAlgn, VAlgn, PerInch, X, Y, TextVal, Upper, DotMatrix);
end;

procedure DrawPrintReportBmp(Canvas: TCanvas; PageNo, PerInch: Integer;
  const Rec: TPrintReportBmp);
begin
  with Rec do
    //if (AtPage <= 0) or (AtPage = PageNo) then
      ImageDrawIn(Canvas, PerInch, X, Y, W, H, FileName);
end;

procedure AssignPrinterComboBox(ComboBox: TComboBox; const FindItem: String;
  SelectFlag: Boolean);
var I: Integer;
begin
  with ComboBox do
  begin
    Items.Assign(Printer.Printers);
    if FindItem <> '' then  // find item in printer list
      for I := 0 to Items.Count - 1 do
        if Pos(FindItem, Items[I]) > 0 then
        begin
          ItemIndex := I;
          Break;
        end;
    // if searched item not found then select first item if allowed
    if SelectFlag and (ItemIndex < 0) and (Items.Count > 0) then ItemIndex := 0;
  end;
end;

procedure NewPrintReportItem(X, Y: Extended; HAlgn: TAlignment; VAlgn: Integer;
  const Txt: String; var Res: TPrintReportRec; AtPage: Integer = 0);
begin
  Res.X := X;
  Res.Y := Y;
  Res.HAlgn := Integer(HAlgn);
  Res.VAlgn := VAlgn;
  Res.TextVal := Txt;
  Res.AtPage := AtPage;
end;

function PrintReportForm(Prnt, CopyNo: Integer; Arr: TPrintReportArr;
  Bmp: TPrintReportBmpArr; DotMatrix: Boolean = True): Boolean;
var PInch, I, J: Integer;
begin
  Result := True;
  Screen.Cursor := crHourglass;
  with Printer do
    try
      PrinterIndex := Prnt;
      BeginDoc;
      with Canvas.Font do
      begin
        Name := 'Arial Cyr';
        Size := 6;//7; //10;
        PInch := PixelsPerInch;
        Style := [fsBold];
      end;
      try
        for J := Low(Bmp) to High(Bmp) do
          begin
          DrawPrintReportBmp(Canvas, 0, PInch, Bmp[J]);
          end;
        for I := Low(Arr) to High(Arr) do
          DrawPrintReportRec(Canvas, CopyNo, PInch, Arr[I], False, DotMatrix);
      finally
        EndDoc;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

{function PrintAssignedList(Capt: PChar; Frm, Prnt: Integer; Arr: TPrintReportArr): Boolean;
var PInch, I: Integer;
begin
  Result := True;
  Screen.Cursor := crHourglass;
  with Printer do
    try
      PrinterIndex := -1;
      PrinterIndex := PrinterIndex;
      BeginDoc;
      with Canvas.Font do
      begin
        Name := 'Arial Cyr';
        Size := 10;
        PInch := PixelsPerInch;
      end;
      try
        for I := Low(Arr) to High(Arr) do
          DrawPrintReportRec(Canvas, 0, PInch, Arr[I], False);
      finally
        EndDoc;
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;}

{ print from TPoliceList }

{procedure PrintReturnReport(const VendorName: String);
var Rct: TRect;
begin
  Printer.PrinterIndex := -1;
  Printer.PrinterIndex := Printer.PrinterIndex;
  SetPrinterOrientation(1);
  with Printer, Canvas do
    try
      BeginDoc;
      Font.Name := 'Arial Black';
      Font.Size := 24;
      Font.Style := [fsBold];
      Rct := Bounds(0, 0, PageWidth, 0);
      PrintAlignedTextCalc(Canvas, Rct, SPolicOpDlgReturnRepTitle0, DT_CENTER);
      Font.Name := 'Arial';
      Font.Size := 14;
      Rct := Bounds(0, Rct.Bottom, PageWidth, 0);
      PrintAlignedTextCalc(Canvas, Rct, SPolicOpDlgReturnRepTitle0, DT_CENTER);
      Font.Size := 14;
      Font.Style := [];
      //
    finally
      EndDoc;
    end;
end;}

{ TPoliceRangeListItem }

constructor TPoliceRangeListItem.Create(Cnt: Integer; const Ser, Frst, Last: String);
begin
  FCount := Cnt;
  FSerie := Ser;
  FFrstNo := Frst;
  if Last = Frst then FLastNo := '' else FLastNo := Last;
end;

{ TPoliceRangeList }

procedure TPoliceRangeList.AddNewPolice(Cnt: Integer; const Ser, Frst, Last: String);
begin
  Add(TPoliceRangeListItem.Create(Cnt, Ser, Frst, Last));
end;

procedure TPoliceRangeList.AddPolice(APolice: TPoliceRangeListItem);
begin
  Add(TPoliceRangeListItem(APolice));
end;

destructor TPoliceRangeList.Destroy;
var I: Integer;
begin
  {$WARN UNSAFE_CAST OFF}
  for I := 0 to Count - 1 do
    if Assigned(Items[I]) then TPoliceRangeListItem(Items[I]).Free;
  {$WARN UNSAFE_CAST ON}
  inherited Destroy;
end;

end.
