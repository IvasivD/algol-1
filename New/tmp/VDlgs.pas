unit VDlgs;

interface

uses
  Windows, Messages, Classes, Controls, StdCtrls, Grids, Graphics, ComCtrls,
  DB, DBCtrls, DBGrids, TourConsts, ToolWin{, AlgolDBGrid};

const
  // scale constants
  gNormalPixelsPerInch = 96;
  gPixelsPerInch: Integer = gNormalPixelsPerInch;
  // colors
  clEditControlColors: array[Boolean] of TColor = (clBtnFace, clInfoBk);
  // inifile sections and keys
  iniSectVisaDocs = 'Visa\Documents';
  iniKeyNumberCounter = 'Count';
  iniKeyNumberItem = 'Item';

{ status message show and hide }

const
  wm_TourManCustom = WM_USER + 151;
  wm_MyStatusMsg = wm_TourManCustom;
  wm_FreeAllForms = wm_TourManCustom + 1;
  dm_DriveQryScrolled = wm_TourManCustom + 2;
  //dm_HotelQryScrolled = wm_TourManCustom + 3;
  dm_HotelTblScrolled = wm_TourManCustom + 4;
  dm_RouteTblScrolled = wm_TourManCustom + 5;
  dm_TripsQryScrolled = wm_TourManCustom + 6;
  dm_VisasQryScrolled = wm_TourManCustom + 7;

type
  TMyStatusMsg = record
    Msg: Cardinal;
    Symb: PChar;
    Result: Longint;
  end;
  TDataScrollMsg = record
    Msg: Cardinal;
    KeyId: Longint;
    Result: Longint;
  end;

var
  MainFormHandle: Integer;
  // sizes of SDI windows
  xClientWindow: Integer = 0;
  yClientWindow: Integer = 90;
  hClientWindow: Integer = 467;
  wClientWindow: Integer = 800;
  xBrowseWindow: Integer = 0;
  yBrowseWindow: Integer = 90;


procedure ResourceToStrings(Strings: TStrings; Res: array of Pointer);
procedure SendMyStatusMsg(const Msg: string);
procedure ClearMyStatusMsg;

{ Phone dial utility }
function PhoneDialNumber(
  WndHandle: Integer; EditControl: TCustomEdit; const OpenDoc: string): Boolean;

{ list view and image fields management routines }
procedure AddImageFromField(ImgList: TImageList; ImgField: TGraphicField);
procedure SetListViewStyle(ListView: TListView; ATag: Integer);

{ place map drawing }
function ShowPlaceMap(
  const AMap: string; AGrid: TStringGrid; Purely: Boolean): Boolean;

{ message dialogs calls }
function VInputDlg(const ACaption, APrompt, ADefault: string): string;
function VInputQuery(const ACaption, APrompt: string; var AValue: string): Boolean;

{ number as string formatting routines }
function MoneyAsString(Money: Currency): string;
procedure StrDecodeDate(ADate: TDate; var SY, SM, SD: string);

{ convert the given value to string or empty string if zero }
function IntToNonZero(Value: Longint): string;
function DurationToNonZero(Duration: Double): string;

{ address string routines }
procedure CityIdentsToStrings(Strings: TStrings);
procedure StreetIdentsToStrings(Strings: TStrings);
function CityIdent(Id: Integer): string;
function StreetIdent(Id: Integer): string;

{ family and relative naming }
procedure RelativeIdentsToStrings(Strings: TStrings);
function RelativeIdent(Id: Integer): string;
procedure MarriedIdentsToStrings(Ua, Male: Boolean; Strings: TStrings);
function MarriedIdent(Ua, Male: Boolean; Id: Integer): string;
function StrSexIsMale(const Sex: string): Boolean;
function StrChildIsMale(const Chld: string): Boolean;

{ pay method names}
function PayMethodIdent(Id: Integer): string;
function PayMethodDocumentIdent(Id: Integer): string;
procedure PayMethodIdentsToStrings(Strings: TStrings);

{ other operations with TStrings }
 //declared into OptSet.pas: procedure LoadRegistryStrings(const Key: String; Strings: TStrings; Addits: TStrings = nil);
procedure DelimitedToStrings(const Delimit: string; Strings: TStrings);
function StringsToDelimited(Strings: TStrings): string;

{ historing the string }
procedure AddComboBoxHistory(DBCombo: TDBComboBox; const AddTo: string);
procedure AddToHistory(History: TStrings; const AddTo: string);

{ making caption string routines }
procedure PhoneLabelsCaption(IsCompany: Boolean; Label1, Label2: TLabel);

{working with group boxes}
procedure ToggleControlEnabled(Control: TControl; Enable: Boolean);
procedure ToggleGroupControls(GroupBox: TCustomControl; Enable: Boolean);

{ window scale, arrange and position calculation }
//scales DBGrid for large sysfont and return the calculated columns DBGrid`s width
function ScaleDBGridColumns(DBGrid: TDBGrid): Integer;
procedure ScaleDrawGridColumns(DrawGrid: TDrawGrid); //scales DrawGrid
procedure ArrangeRightSides(ArControl, ByControl: TControl);
function CalcBrowseTop(MinHeight: Integer): Integer;
function CalcBrowseLeft(MinWidth: Integer): Integer;
procedure CalcNextBrowseOrigin(NextOrigin: TPoint);
function DBGridDblClickIsValid(DBGrid: TCustomGrid; var ColumnIndex: Integer): Boolean;

{ picture support }

procedure DrawStretchImage(Canvas: TCanvas; Rect: TRect; Graph: TGraphic);
function DrawPhotoFile(var FileName, ErrMsg: string; Canvas: TCanvas; Rect: TRect): Boolean;
function CreateImageFileFromClipboard(const FileName: string;
  Quality: Integer; ProgrEnc: Boolean): Boolean;

{ print support routines }

function MeterToPixel(Meter: Extended; PInch: Integer): Integer;
function MeterToRect(MLeft, MTop: Extended; Width, Height, XPIn, YPIn: Integer): TRect;
function MeterToRect2(MLeft, MTop, MWidth, MHeight: Extended; XPIn, YPIn: Integer): TRect;
procedure PrintBoundaryEdge(Canvas: TCanvas; Borders: TEdgeBorders; var Rect: TRect);
procedure PrintBoundaryRect(Canvas: TCanvas; Width: Integer; Rect: TRect);
procedure PrintBoundaryText(Canvas: TCanvas; Width: Integer; Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintAlignedText(Canvas: TCanvas; Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintAlignedTextCalc(Canvas: TCanvas; var Rect: TRect; const Txt: string; Align: Cardinal);
procedure PrintPageNo(Canvas: TCanvas; PageNo: Integer; Align: Cardinal);
procedure PrintParagraph(Canvas: TCanvas; var Rect: TRect;
  const Title: string; Body: array of string);
procedure PrintParagraphToPrinter(var Rect: TRect;
  YMin, YMax: Integer; const Title: string; Body: array of string);
procedure PrintTitleSign(Canvas: TCanvas; XPIn, YPIn: Integer);
procedure SetPrinterOptions(AnOrientation: Integer;
  ACopies: Integer = 1; ADuplex: Integer = 1; APaperA3: Boolean = False);
//procedure GetPrinterPapers(PaperList: TStrings);

{ routes and trips management }

type
  TDirection = 0..1; // route directions (forward = 0, backward = 1)
  TRouteTimeLinkTo = (tlDepartCity, tlArriveCity); //route time calculating prop

{ order payment state support}

const
  ordFinished = 0;
  ordTimeOut = 1;
  ordNotPaid = 2;
  ordPartPay = 3;
  ordPaid = 4;
  ordAnnulled = 5;
  ordOverPay = 6;
  ordNullPay = 7;
  plcFree = 0;
  plcTimeOut = 1;
  plcUsed = 2;
  plcPartPay = 3;
  plcPaid = 4;
  plcQueue = 5;
  plcOverPay = 6;
  plcInaccessible = 7;
  insDiscountCalcClient = 0;
  insDiscountCalcOur = 1;
  insDiscountCalcNone = 2;

type
  TOrderPaymentState = ordFinished..ordNullPay;
  TPlacePayState = plcFree..plcInaccessible;
  TDiscountCalcType = insDiscountCalcClient..insDiscountCalcNone;

const
  ordPaidStates = [ordPartPay, ordPaid, ordOverPay];
  plcPlacePayStates: array[TPlacePayState] of string = (
    'plcFree', 'plcTimeOut', 'plcUsed', 'plcPartPay', 'plcPaid',
    'plcQueue', 'plcOverPay', 'plcInaccessible');

function GetOrderPaymentStateName(State: Integer): string;
function GetPlacePayStateName(State: Integer): string;
//function GetPlacePayStateIdent(State: integer): String;
procedure AssignDiscountCalcTypes(DiscTypeList: TStrings);

{ service cost }

const
  nHotelServiceCostUnknown = -1;
  nHotelServiceCostIsZero = 0;
  nHotelServiceCostNonZero = 1;
  nServiceTabHotel = 0;
  nServiceTabBuild = 1;
  nServiceTabRooms = 2;

type
  THotelServiceCost = nHotelServiceCostUnknown..nHotelServiceCostNonZero;

function GetHotelServiceHaveCostInfo(HaveCost: Integer): string;

{ currency constants }

const // Currency IDs
  crncyUAH = 0;
  crncyUSD = 1;
  crncyUAHId = 75;

  sCurrencyIdent: array[crncyUAH..crncyUSD] of Pointer =
  (@SPayDlgUAH, @SPayDlgUSD);

{ cost values of order tiles }

const
  ordOrderTrip = 0;
  ordOrderHotel = 1;
  ordOrderTransfer = 2;
  ordOrderInsure = 3;
  ordOrderExcurs = 4;
  ordOrderVisa = 5;
  ordOrderResort = 6;
  ordOrderOther = 7;

type
  TOrderServices = set of ordOrderTrip..ordOrderOther; //TOrderService;

{ special error messages }
procedure ErrorInsurePerson(const Tourist, Error: string);

{ database routines }

function GetDatabaseErrorCategory(ErrCat: Byte): string;
function GetBDEDecimalSeparator: Char;


implementation

uses BDE, SysUtils, IniFiles, Math, Printers, Forms, Dialogs, Spin, Jpeg,
  Clipbrd, TourCmnlIf;

const
  fPhoneDialer = 'DIALER.EXE'; // phone dialer executable

{ status message show and hide }

procedure SendMyStatusMsg(const Msg: string);
begin
  SendMessage(MainFormHandle, WM_MYSTATUSMSG, Longint(Msg), 0);
end;

procedure ClearMyStatusMsg;
begin
  SendMyStatusMsg('');
end;

{ ShellAPI interface utilities }

function PhoneDialNumber(
  WndHandle: Integer; EditControl: TCustomEdit; const OpenDoc: string): Boolean;
var DocumentName: string;
begin
  if Assigned(EditControl) then
    with EditControl do
    begin
      SelectAll;
      CopyToClipboard;
    end;
  if OpenDoc = '#' then
    with TOpenDialog.Create(Application) do
    try
      if Execute then DocumentName := FileName;
    finally
      Free;
    end
  else DocumentName := OpenDoc;
  Result :=
    ShellOutward(fPhoneDialer, DocumentName, '', '', SW_SHOWNORMAL);
end;

{ list view and image fields management routines }

procedure AddImageFromField(ImgList: TImageList; ImgField: TGraphicField);
var Bitmap, Image: TBitmap;
begin
  Bitmap := TBitmap.Create;
  Image := TBitmap.Create;
  try
    Bitmap.Width := ImgList.Width;
    Bitmap.Height := ImgList.Height;
    if not ImgField.IsNull then //Bitmap.Assign(ImgField);
    begin
      Image.Assign(ImgField);
      Bitmap.Canvas.StretchDraw(Bitmap.Canvas.ClipRect, Image);
    end;
    ImgList.Add(Bitmap, nil);
  finally
    Image.Free;
    Bitmap.Free;
  end;
end;

procedure SetListViewStyle(ListView: TListView; ATag: Integer);
begin
  with ListView do
    case ATag of
      1: ViewStyle := vsIcon;
      2: ViewStyle := vsSmallIcon;
      3: ViewStyle := vsList;
      4: ViewStyle := vsReport;
    end;
end;

{ draw the drive place map }

function ShowPlaceMap(
  const AMap: string; AGrid: TStringGrid; Purely: Boolean): Boolean;
var
  S, C: string;
  I, J, P: Integer;
begin
  Result := True;
  S := AMap;
  with AGrid do
  begin
    P := Pos(',', S);
    try
      ColCount := StrToInt(Copy(S, 1, P - 1)); //get ColCount
    except
      ColCount := 5; //if error
      Result := False;
    end;
    S := Copy(S, P + 1, Length(S)); //truncate
    P := Pos(',', S);
    try
      RowCount := StrToInt(Copy(S, 1, P - 1)); //get RowCount
    except
      RowCount := 5; //if error
      Result := False;
    end;
    S := Copy(S, P + 1, Length(S)); //truncate
    for J := 0 to RowCount - 1 do // reading the place mapping grid
      for I := 0 to ColCount - 1 do
      begin
        P := Pos(',', S);
        if P = 0 then //if is never more comma in the place map imaging string
        begin
          Break;
          Result := False;
        end;
        C := Copy(S, 1, P - 1);
        if Purely and (C = '*') then Cells[I, J] := '' else Cells[I, J] := C;
        S := Copy(S, P + 1, Length(S));
      end;
  end;
end;

function VConfirmDlg(const Msg: string): Integer;
begin
  Result := ConfirmDlg(Msg);
end;

function VConfirmDlgYC(const Msg: string): Boolean;
begin
  Result := ConfirmDlgYC(Msg);
end;

function VConfirmDlgYN(const Msg: string): Boolean;
begin
  Result := ConfirmDlgYN(Msg);
end;

function VErrorDlg(const Msg: string): Boolean;
begin
  Result := ErrorDlg(Msg);
end;

function VInformDlg(const Msg: string): Boolean;
begin
  Result := InformDlg(Msg);
end;

function VWarningDlg(const Msg: string): Integer;
begin
  Result := WarningDlg(Msg);
end;

function VWarningDlgYC(const Msg: string): Boolean;
begin
  Result := WarningDlgYC(Msg);
end;

function VWarningDlgYN(const Msg: string): Boolean;
begin
  Result := WarningDlgYN(Msg);
end;

function VConfirmFmtDlg(const Msg: string; const Args: array of const): Integer;
begin
  Result := ConfirmFmtDlg(Msg, Args);
end;

function VConfirmFmtDlgYC(const Msg: string; const Args: array of const): Boolean;
begin
  Result := ConfirmFmtDlgYC(Msg, Args);
end;

function VConfirmFmtDlgYN(const Msg: string; const Args: array of const): Boolean;
begin
  Result := ConfirmFmtDlgYN(Msg, Args);
end;

function VErrorFmtDlg(const Msg: string; const Args: array of const): Boolean;
begin
  Result := ErrorFmtDlg(Msg, Args);
end;

function VInformFmtDlg(const Msg: string; const Args: array of const): Boolean;
begin
  Result := InformFmtDlg(Msg, Args);
end;

function VWarningFmtDlg(const Msg: string; const Args: array of const): Integer;
begin
  Result := WarningFmtDlg(Msg, Args);
end;

function VWarningFmtDlgYC(const Msg: string; const Args: array of const): Boolean;
begin
  Result := WarningFmtDlgYC(Msg, Args);
end;

function VWarningFmtDlgYN(const Msg: string; const Args: array of const): Boolean;
begin
  Result := WarningFmtDlgYN(Msg, Args);
end;

function VInputDlg(const ACaption, APrompt, ADefault: string): string;
begin
  Result := ADefault;
  VInputQuery(ACaption, APrompt, Result);
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

function VInputQuery(const ACaption, APrompt: string; var AValue: string): Boolean;
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  HorzMargin, VertMargin, VertSpacing, PromptWidth, PromptHeight,
    ButtonTop, ButtonWidth, ButtonHeight, ButtonSpacing, X: Integer;
  TextRect: TRect;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
  try
    BiDiMode := Application.BiDiMode;
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    BorderStyle := bsDialog;
    Caption := ACaption;
    Position := poScreenCenter;
    HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
    VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
    VertSpacing := MulDiv(mcVertSpacing, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(mcButtonWidth, DialogUnits.X, 4);
    ButtonHeight := MulDiv(mcButtonHeight, DialogUnits.Y, 8);
    ButtonSpacing := MulDiv(mcButtonSpacing, DialogUnits.X, 4);
    SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
    DrawText(Canvas.Handle, PChar(APrompt), Length(APrompt), TextRect,
      DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or
      DrawTextBiDiModeFlagsReadingOnly);
    PromptWidth := TextRect.Right;
    PromptHeight := TextRect.Bottom;
    Prompt := TLabel.Create(Form);
    with Prompt do
    begin
      Parent := Form;
      WordWrap := True;
      Caption := APrompt;
      BoundsRect := TextRect;
      BiDiMode := Application.BiDiMode;
      SetBounds(HorzMargin, VertMargin, PromptWidth, PromptHeight);
    end;
    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Prompt.Left;
      Top := VertMargin + PromptHeight;
      Width := Max(MulDiv(164, DialogUnits.X, 4), PromptWidth);
      MaxLength := 255;
      Text := AValue;
      Color := clInfoBk;
      SelectAll;
    end;
    ButtonTop := Edit.Top + Edit.Height + VertSpacing;
    ClientWidth := Max(PromptWidth, Edit.Width) + HorzMargin * 2;
    ClientHeight := ButtonTop + ButtonHeight + VertMargin * 2;
    X := ClientWidth - (ButtonWidth + ButtonSpacing) * 2 - HorzMargin;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := SVDlgsMsgDlgOk;
      ModalResult := mrOk;
      Default := True;
      SetBounds(X, ButtonTop, ButtonWidth, ButtonHeight);
    end;
    Inc(X, ButtonWidth + ButtonSpacing);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := SVDlgsMsgDlgCancel;
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(X, ButtonTop, ButtonWidth, ButtonHeight);
    end;
    if ShowModal = mrOk then
    begin
      AValue := Edit.Text;
      Result := True;
    end;
  finally
    Form.Free;
  end;
end;

{ string input magic routines }

function CapitalName(const Name: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Name) do
    if (I = 1) or (Name[I - 1] = '-') or
      (Name[I - 1] = #32) and not ((Name[I] = '³') and (I < Length(Name)) and (Name[I + 1] = #32))
      then Result := Result + AnsiUpperCase(Name[I])
    else Result := Result + Name[I];
end;

function Sentence(const Name: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Name) do
    if I = 1 then
      Result := Result + AnsiUpperCase(Name[I]) else Result := Result + Name[I];
end;

function UkrCharToEngChar(Chr: Char): string;
begin
  case Chr of
    'à': Result := 'a';
    'á': Result := 'b';
    'â': Result := 'v';
    'ã': Result := 'h';
    'ä': Result := 'd';
    'å': Result := 'e';
    'º': Result := 'ye';
    'æ': Result := 'zh';
    'ç': Result := 'z';
    'è': Result := 'y';
    '³': Result := 'i';
    '¿': Result := 'i';
    'é': Result := 'y';
    'ê': Result := 'k';
    'ë': Result := 'l';
    'ì': Result := 'm';
    'í': Result := 'n';
    'î': Result := 'o';
    'ï': Result := 'p';
    'ð': Result := 'r';
    'ñ': Result := 's';
    'ò': Result := 't';
    'ó': Result := 'u';
    'ô': Result := 'f';
    'õ': Result := 'kh';
    'ö': Result := 'ts';
    '÷': Result := 'ch';
    'ø': Result := 'sh';
    'ù': Result := 'shch';
    'þ': Result := 'yu';
    'ÿ': Result := 'ya';
    'À': Result := 'A';
    'Á': Result := 'B';
    'Â': Result := 'V';
    'Ã': Result := 'H';
    'Ä': Result := 'D';
    'Å': Result := 'E';
    'ª': Result := 'Ye';
    'Æ': Result := 'Zh';
    'Ç': Result := 'Z';
    'È': Result := 'Y';
    '²': Result := 'I';
    '¯': Result := 'I';
    'É': Result := 'Y';
    'Ê': Result := 'K';
    'Ë': Result := 'L';
    'Ì': Result := 'M';
    'Í': Result := 'N';
    'Î': Result := 'O';
    'Ï': Result := 'P';
    'Ð': Result := 'R';
    'Ñ': Result := 'S';
    'Ò': Result := 'T';
    'Ó': Result := 'U';
    'Ô': Result := 'F';
    'Õ': Result := 'Kh';
    'Ö': Result := 'Ts';
    '×': Result := 'Ch';
    'Ø': Result := 'Sh';
    'Ù': Result := 'Shch';
    'Þ': Result := 'Yu';
    'ß': Result := 'Ya';
    'ý': Result := 'e';
    'û': Result := 'y';
    'Ý': Result := 'E';
    'Û': Result := 'Y';
    ' '..'~': Result := Chr;
  else Result := '';
  end;
end;

function UkraineToEnglish(const Ukr: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Ukr) do Result := Result + UkrCharToEngChar(Ukr[I]);
end;

{ keyboard charset emulation routines }

function EmulateCyrylicCharset(Key: Char): Char;
begin
  case Key of
    'A': Result := 'Ô';
    'B': Result := 'È';
    'C': Result := 'Ñ';
    'D': Result := 'Â';
    'E': Result := 'Ó';
    'F': Result := 'À';
    'G': Result := 'Ï';
    'H': Result := 'Ð';
    'I': Result := 'Ø';
    'J': Result := 'Î';
    'K': Result := 'Ë';
    'L': Result := 'Ä';
    'M': Result := 'Ü';
    'N': Result := 'Ò';
    'O': Result := 'Ù';
    'P': Result := 'Ç';
    'Q': Result := 'É';
    'R': Result := 'Ê';
    'S': Result := '²';
    'T': Result := 'Å';
    'U': Result := 'Ã';
    'V': Result := 'Ì';
    'W': Result := 'Ö';
    'X': Result := '×';
    'Y': Result := 'Í';
    'Z': Result := 'ß';
    'a': Result := 'ô';
    'b': Result := 'è';
    'c': Result := 'ñ';
    'd': Result := 'â';
    'e': Result := 'ó';
    'f': Result := 'à';
    'g': Result := 'ï';
    'h': Result := 'ð';
    'i': Result := 'ø';
    'j': Result := 'î';
    'k': Result := 'ë';
    'l': Result := 'ä';
    'm': Result := 'ü';
    'n': Result := 'ò';
    'o': Result := 'ù';
    'p': Result := 'ç';
    'q': Result := 'é';
    'r': Result := 'ê';
    's': Result := '³';
    't': Result := 'å';
    'u': Result := 'ã';
    'v': Result := 'ì';
    'w': Result := 'ö';
    'x': Result := '÷';
    'y': Result := 'í';
    'z': Result := 'ÿ';
    '`', '~', '¸', '¨': Result := '''';
  else Result := Key;
  end;
end;

function EmulateCyrylicUpperCharset(Key: Char): Char;
begin
  case Key of
    'A', 'a': Result := 'Ô';
    'B', 'b': Result := 'È';
    'C', 'c': Result := 'Ñ';
    'D', 'd': Result := 'Â';
    'E', 'e': Result := 'Ó';
    'F', 'f': Result := 'À';
    'G', 'g': Result := 'Ï';
    'H', 'h': Result := 'Ð';
    'I', 'i': Result := 'Ø';
    'J', 'j': Result := 'Î';
    'K', 'k': Result := 'Ë';
    'L', 'l': Result := 'Ä';
    'M', 'm': Result := 'Ü';
    'N', 'n': Result := 'Ò';
    'O', 'o': Result := 'Ù';
    'P', 'p': Result := 'Ç';
    'Q', 'q': Result := 'É';
    'R', 'r': Result := 'Ê';
    'S', 's': Result := '²';
    'T', 't': Result := 'Å';
    'U', 'u': Result := 'Ã';
    'V', 'v': Result := 'Ì';
    'W', 'w': Result := 'Ö';
    'X', 'x': Result := '×';
    'Y', 'y': Result := 'Í';
    'Z', 'z': Result := 'ß';
    '`', '~', '¸', '¨': Result := '''';
  else Result := Key;
  end;
end;

function EmulateEnglishCharset(Key: Char): Char;
begin
  case Key of
    'À': Result := 'F';
    'Â': Result := 'D';
    'Ã': Result := 'U';
    'Ä': Result := 'L';
    'Å': Result := 'T';
    'Ç': Result := 'P';
    'È': Result := 'B';
    '²', 'Û': Result := 'S';
    'É': Result := 'Q';
    'Ê': Result := 'R';
    'Ë': Result := 'K';
    'Ì': Result := 'V';
    'Í': Result := 'Y';
    'Î': Result := 'J';
    'Ï': Result := 'G';
    'Ð': Result := 'H';
    'Ñ': Result := 'C';
    'Ò': Result := 'N';
    'Ó': Result := 'E';
    'Ô': Result := 'A';
    'Ö': Result := 'W';
    '×': Result := 'X';
    'Ø': Result := 'I';
    'Ù': Result := 'O';
    'ß': Result := 'Z';
    'Ü': Result := 'M';
    'à': Result := 'f';
    'â': Result := 'd';
    'ã': Result := 'u';
    'ä': Result := 'l';
    'å': Result := 't';
    'ç': Result := 'p';
    'è': Result := 'b';
    '³', 'û': Result := 's';
    'é': Result := 'q';
    'ê': Result := 'r';
    'ë': Result := 'k';
    'ì': Result := 'v';
    'í': Result := 'y';
    'î': Result := 'j';
    'ï': Result := 'g';
    'ð': Result := 'h';
    'ñ': Result := 'c';
    'ò': Result := 'n';
    'ó': Result := 'e';
    'ô': Result := 'a';
    'ö': Result := 'w';
    '÷': Result := 'x';
    'ø': Result := 'i';
    'ù': Result := 'o';
    'ÿ': Result := 'z';
    'ü': Result := 'm';
    '¸': Result := '`';
    'õ': Result := '[';
    '¿', 'ú': Result := ']';
    'æ': Result := ';';
    'º', 'ý': Result := '''';
    'á': Result := ',';
    'þ': Result := '.';
    '¨': Result := '~';
    'Õ': Result := '{';
    '¯', 'Ú': Result := '}';
    'Æ': Result := ':';
    'ª', 'Ý': Result := '"';
    'Á': Result := '<';
    'Þ': Result := '>';
  else Result := Key;
  end;
end;

function EmulateRussianCharset(Key: Char): Char;
begin
  case Key of
    'Å': Result := 'Ý';
    'È': Result := 'Û';
    '²': Result := 'È';
    'ª': Result := 'Å';
    '¯': Result := 'È';
    'å': Result := 'ý';
    'è': Result := 'û';
    '³': Result := 'è';
    'º': Result := 'å';
    '¿': Result := 'è';
  else Result := Key;
  end;
end;

function EmulateEnglishUpperCharset(Key: Char): Char;
begin
  case Key of
    'À', 'à': Result := 'F';
    'Â', 'â': Result := 'D';
    'Ã', 'ã': Result := 'U';
    'Ä', 'ä': Result := 'L';
    'Å', 'å': Result := 'T';
    'Ç', 'ç': Result := 'P';
    'È', 'è': Result := 'B';
    '²', '³', 'Û', 'û': Result := 'S';
    'É', 'é': Result := 'Q';
    'Ê', 'ê': Result := 'R';
    'Ë', 'ë': Result := 'K';
    'Ì', 'ì': Result := 'V';
    'Í', 'í': Result := 'Y';
    'Î', 'î': Result := 'J';
    'Ï', 'ï': Result := 'G';
    'Ð', 'ð': Result := 'H';
    'Ñ', 'ñ': Result := 'C';
    'Ò', 'ò': Result := 'N';
    'Ó', 'ó': Result := 'E';
    'Ô', 'ô': Result := 'A';
    'Ö', 'ö': Result := 'W';
    '×', '÷': Result := 'X';
    'Ø', 'ø': Result := 'I';
    'Ù', 'ù': Result := 'O';
    'ß', 'ÿ': Result := 'Z';
    'Ü', 'ü': Result := 'M';
  else Result := Key;
  end;
end;

function LatString(const Value: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    Result := Result + EmulateEnglishCharset(Value[I]);
end;

function RusString(const Value: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    Result := Result + EmulateRussianCharset(Value[I]);
end;

{ number as string formatting routines }

const
  mT: array[1..9] of Pointer = (@SVDlgsMoneyT1, @SVDlgsMoneyT2, @SVDlgsMoneyT3,
    @SVDlgsMoneyT4, @SVDlgsMoneyT5, @SVDlgsMoneyT6, @SVDlgsMoneyT7,
    @SVDlgsMoneyT8, @SVDlgsMoneyT9);
  mH: array[2..9] of Pointer = (
    @SVDlgsMoneyH2, @SVDlgsMoneyH3, @SVDlgsMoneyH4, @SVDlgsMoneyH5,
    @SVDlgsMoneyH6, @SVDlgsMoneyH7, @SVDlgsMoneyH8, @SVDlgsMoneyH9);
  mH1: array[0..9] of Pointer = (@SVDlgsMoneyH10, @SVDlgsMoneyH11,
    @SVDlgsMoneyH12, @SVDlgsMoneyH13, @SVDlgsMoneyH14, @SVDlgsMoneyH15,
    @SVDlgsMoneyH16, @SVDlgsMoneyH17, @SVDlgsMoneyH18, @SVDlgsMoneyH19);
  mD: array[1..9] of Pointer = (@SVDlgsMoneyD1, @SVDlgsMoneyD2, @SVDlgsMoneyD3,
    @SVDlgsMoneyD4, @SVDlgsMoneyD5, @SVDlgsMoneyD6, @SVDlgsMoneyD7,
    @SVDlgsMoneyD8, @SVDlgsMoneyD9);

function MoneyAsString(Money: Currency): string;
var
  Coins, Notes, T, H, D: Integer;
  ST, SH, SD: string;
begin
  Notes := Trunc(Int(Money));
  Coins := Round(Frac(Money) * 100);
  T := Notes div 100;
  H := Notes mod 100;
  D := H mod 10;
  H := H div 10;
  if T in [1..9] then ST := LoadResString(mT[T]) else ST := '';
  case H of
    0: SH := '';
    1: SH := LoadResString(mH1[D]);
    2..9: SH := LoadResString(mH[H]);
  else SH := '';
  end;
  if (H = 1) or (D = 0) then SD := '' else
    if D in [1..9] then SD := LoadResString(mD[D]) else SD := '';
  Result := Trim(Format('%s %s %s %s %2.2d %s',
    [ST, SH, SD, SPayDlgUAH, Coins, SPayDlgCoins]));
end;

procedure StrDecodeDate(ADate: TDate; var SY, SM, SD: string);
var Y, M, D: word;
begin
  DecodeDate(ADate, Y, M, D);
  SD := Format(' %2.2d ', [D]);
  SM := Format(' %2.2d ', [M]);
  SY := Format(' %4.4d ', [Y]);
end;

function IntToNonZero(Value: Longint): string;
begin
  if Value = 0 then Result := '' else Result := IntToStr(Value);
end;

function DurationToNonZero(Duration: Double): string;
begin
  if Duration = 0 then Result := ''
  else Result := IntToStr(Trunc(Duration)) + FormatDateTime(' hh:nn', Duration);
end;

{ address string routines }

const
  pCityIdents: array[0..5] of Pointer = (@SVDlgsCity0, @SVDlgsCity1,
    @SVDlgsCity2, @SVDlgsCity3, @SVDlgsCity4, @SVDlgsCity5);
  pStreetIdents: array[0..9] of Pointer = (@SVDlgsStreet0, @SVDlgsStreet1,
    @SVDlgsStreet2, @SVDlgsStreet3, @SVDlgsStreet4, @SVDlgsStreet5,
    @SVDlgsStreet6, @SVDlgsStreet7, @SVDlgsStreet8, @SVDlgsStreet9);
  pRelativeIdents: array[0..3] of Pointer = (
    @SVDlgsRelative0, @SVDlgsRelative1, @SVDlgsRelative2, @SVDlgsRelative3);

  pMarriedMUaIdents: array[0..4] of Pointer = (@SVDlgsMarriedMUa0,
    @SVDlgsMarriedMUa1, @SVDlgsMarriedMUa2, @SVDlgsMarriedMUa3, @SVDlgsMarriedMUa4);

  pMarriedFUaIdents: array[0..4] of Pointer = (@SVDlgsMarriedFUa0,
    @SVDlgsMarriedFUa1, @SVDlgsMarriedFUa2, @SVDlgsMarriedFUa3, @SVDlgsMarriedFUa4);

  pMarriedMEnIdents: array[0..4] of Pointer = (@SVDlgsMarriedMEn0,
    @SVDlgsMarriedMEn1, @SVDlgsMarriedMEn2, @SVDlgsMarriedMEn3, @SVDlgsMarriedMEn4);

  pMarriedFEnIdents: array[0..4] of Pointer = (@SVDlgsMarriedFEn0,
    @SVDlgsMarriedFEn1, @SVDlgsMarriedFEn2, @SVDlgsMarriedFEn3, @SVDlgsMarriedFEn4);

procedure ResourceToStrings(Strings: TStrings; Res: array of Pointer);
var I: integer;
begin
  if Assigned(Strings) then
    with Strings do
    begin
      Clear;
      for I := 0 to High(Res) do Add(LoadResString(Res[I]));
    end;
end;

procedure CityIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pCityIdents);
end;

procedure StreetIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pStreetIdents);
end;

function CityIdent(Id: Integer): string;
begin
  if Id = 0 then Result := '' else Result := LoadResString(pCityIdents[Id]);
end;

function StreetIdent(Id: Integer): string;
begin
  Result := LoadResString(pStreetIdents[Id]);
end;

{ family and relative naming }

procedure RelativeIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pRelativeIdents);
end;

function RelativeIdent(Id: Integer): string;
begin
  if Id < 0 then Result := '' else Result := LoadResString(pRelativeIdents[Id]);
end;

procedure MarriedIdentsToStrings(Ua, Male: Boolean; Strings: TStrings);
begin
  if Ua then
    case Male of
      False: ResourceToStrings(Strings, pMarriedFUaIdents);
      True: ResourceToStrings(Strings, pMarriedMUaIdents);
    end
  else
    case Male of
      False: ResourceToStrings(Strings, pMarriedFEnIdents);
      True: ResourceToStrings(Strings, pMarriedMEnIdents);
    end;
end;

function MarriedIdent(Ua, Male: Boolean; Id: Integer): string;
begin
  if Id < 0 then Result := ''
  else if Ua then
    case Male of
      False: Result := LoadResString(pMarriedFUaIdents[Id]);
      True: Result := LoadResString(pMarriedMUaIdents[Id]);
    end
  else
    case Male of
      False: Result := LoadResString(pMarriedFEnIdents[Id]);
      True: Result := LoadResString(pMarriedMEnIdents[Id]);
    end;
end;

function StrSexIsMale(const Sex: string): Boolean;
begin
  Result := (Sex = SVDlgsSexMaleEn) or (Sex = SVDlgsSexMaleUa);
end;

function StrChildIsMale(const Chld: string): Boolean;
begin
  Result := (AnsiUpperCase(Chld) = AnsiUpperCase(SVDlgsChildSonEn))
    or (AnsiUpperCase(Chld) = AnsiUpperCase(SVDlgsChildSonUa));
end;

{ pay method name}

const
  pRstrPayMethod: array[0..2] of Pointer = (
    @SPayDlgMethod0, @SPayDlgMethod1, @SPayDlgMethod2);
  pRstrPayMethDoc: array[0..2] of Pointer = (
    @SPayDlgMethDoc0, @SPayDlgMethDoc1, @SPayDlgMethDoc2);

function PayMethodIdent(Id: Integer): string;
begin
  Result := LoadResString(pRstrPayMethod[Id]);
end;

function PayMethodDocumentIdent(Id: Integer): string;
begin
  Result := LoadResString(pRstrPayMethDoc[Id]);
end;

procedure PayMethodIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pRstrPayMethod);
end;

{ other operations with TStrings }

procedure DelimitedToStrings(const Delimit: string; Strings: TStrings);
var
  S: string;
  Pos: Integer;
begin
  if not Assigned(Strings) then Exit;
  Pos := 1;
  while Pos <= Length(Delimit) do
  begin
    S := ExtractFieldName(Delimit, Pos);
    if S <> '' then Strings.Add(S);
  end;
end;

function StringsToDelimited(Strings: TStrings): string;
var I: Integer;
begin
  Result := '';
  if Assigned(Strings) then
    for I := 0 to Strings.Count - 1 do Result := Result + Strings[I] + ';';
  if Length(Result) > 0 then System.Delete(Result, Length(Result), 1);
end;


{ manipulating with controls }

procedure AddComboBoxHistory(DBCombo: TDBComboBox; const AddTo: string);
begin
  AddToHistory(DBCombo.Items, AddTo);
end;

procedure AddToHistory(History: TStrings; const AddTo: string);
begin
  if Trim(AddTo) <> '' then
    with History do if IndexOf(AddTo) < 0 then Insert(0, AddTo);
end;


{ making caption string routines }

procedure PhoneLabelsCaption(IsCompany: Boolean; Label1, Label2: TLabel);
begin
  if IsCompany then
  begin
    Label1.Caption := SOrderFrmChangeCompanyPhoneWork;
    Label2.Caption := SOrderFrmChangeCompanyPhoneHome;
  end
  else begin
    Label1.Caption := SOrderFrmChangeTouristPhoneWork;
    Label2.Caption := SOrderFrmChangeTouristPhoneHome;
  end;
end;

{working with group boxes}

procedure ToggleControlEnabled(Control: TControl; Enable: Boolean);
begin
  Control.Enabled := Enable;
  if Control is TEdit then
    (Control as TEdit).Color := clEditControlColors[Enable]
  else if Control is TDBEdit then
    (Control as TDBEdit).Color := clEditControlColors[Enable]
  else if Control is TComboBox then
    (Control as TComboBox).Color := clEditControlColors[Enable]
  else if Control is TDBComboBox then
    (Control as TDBComboBox).Color := clEditControlColors[Enable]
  else if Control is TDBLookupComboBox then
    (Control as TDBLookupComboBox).Color := clEditControlColors[Enable]
  else if Control is TListBox then
    (Control as TListBox).Color := clEditControlColors[Enable]
  else if Control is TDBLookupListBox then
    (Control as TDBLookupListBox).Color := clEditControlColors[Enable]
  else if Control is TDateTimePicker then
    (Control as TDateTimePicker).Color := clEditControlColors[Enable]
  else if Control is TSpinEdit then
    (Control as TSpinEdit).Color := clEditControlColors[Enable]
  else if Control is TDBGrid then
    (Control as TDBGrid).Color := clEditControlColors[Enable];
end;

procedure ToggleGroupControls(GroupBox: TCustomControl; Enable: Boolean);
var I: Integer;
begin
  with GroupBox do
    for I := 0 to ControlCount - 1 do
    begin
      ToggleControlEnabled(Controls[I], Enable);
      {Controls[I].Enabled := Enable;
      if (Controls[I] is TEdit) then
        (Controls[I] as TEdit).Color := clEditControlColors[Enable]
      else if (Controls[I] is TDBEdit) then
        (Controls[I] as TDBEdit).Color := clEditControlColors[Enable]
      else if (Controls[I] is TComboBox) then
        (Controls[I] as TComboBox).Color := clEditControlColors[Enable]
      else if (Controls[I] is TDBComboBox) then
        (Controls[I] as TDBComboBox).Color := clEditControlColors[Enable]
      else if (Controls[I] is TDBLookupComboBox) then
        (Controls[I] as TDBLookupComboBox).Color := clEditControlColors[Enable]
      else if (Controls[I] is TListBox) then
        (Controls[I] as TListBox).Color := clEditControlColors[Enable]
      else if (Controls[I] is TDBLookupListBox) then
        (Controls[I] as TDBLookupListBox).Color := clEditControlColors[Enable]
      else if (Controls[I] is TDateTimePicker) then
        (Controls[I] as TDateTimePicker).Color := clEditControlColors[Enable]
      else if (Controls[I] is TSpinEdit) then
        (Controls[I] as TSpinEdit).Color := clEditControlColors[Enable];}
    end;
end;

{ window scale, arrange and position calculation }

function ScaleDBGridColumns(DBGrid: TDBGrid): Integer;
var
  Scale: Extended;
  I: Integer;
begin
  Result := 0;
  Scale := gPixelsPerInch / gNormalPixelsPerInch;
  with DBGrid.Columns do
    for I := 0 to Count - 1 do
      with Items[I] do
      begin
        if gPixelsPerInch <> gNormalPixelsPerInch then
          Width := Trunc(longint(Width) * Scale);
        Result := Result + Width;
      end;
  Result := Result + 20; // plus scrollbar width
end;

procedure ScaleDrawGridColumns(DrawGrid: TDrawGrid);
var
  I: integer;
  Scale: Extended;
begin
  Scale := gPixelsPerInch / gNormalPixelsPerInch;
  if Scale <> 1 then
    with DrawGrid do
      for I := 0 to ColCount - 1 do
        ColWidths[I] := Trunc(longint(ColWidths[I]) * Scale);
end;

procedure ArrangeRightSides(ArControl, ByControl: TControl);
begin
  with ArControl do Left := ByControl.Left + ByControl.Width - Width;
end;

function CalcBrowseTop(MinHeight: Integer): Integer;
begin
  if yBrowseWindow + MinHeight > hClientWindow then
    yBrowseWindow := yClientWindow;
  Result := yBrowseWindow;
end;

function CalcBrowseLeft(MinWidth: Integer): Integer;
begin
  if xBrowseWindow + MinWidth > wClientWindow then
    xBrowseWindow := xClientWindow + 80;
  Result := xBrowseWindow;
end;

procedure CalcNextBrowseOrigin(NextOrigin: TPoint);
begin
  Inc(xBrowseWindow, NextOrigin.y - yBrowseWindow);
  yBrowseWindow := NextOrigin.y;
end;

function DBGridDblClickIsValid(DBGrid: TCustomGrid; var ColumnIndex: Integer): Boolean;
var
  Coord: TGridCoord;
  P: TPoint;
begin
  Result := false;
  ColumnIndex := -1;
  P := DBGrid.ScreenToClient(Mouse.CursorPos);
  Coord := DBGrid.MouseCoord(P.X, P.Y);
  if (DBGrid is TDBgrid) then begin
    with Coord do
      Result := ((Y > 0) or (Y = 0) and not (dgTitles in (DBGrid as TDBGrid).Options))
        and ((X > 0) or (X = 0) and not (dgIndicator in (DBGrid as TDBGrid).Options));
  end;
  {if (DBGrid is TAlgolDBGrid) then begin
    with Coord do
      Result := (Y >= (DBGrid as TAlgolDBGrid).FixedRows)
        and (X >= 0);
  end;}
  if Result then ColumnIndex := Coord.X else ColumnIndex := -1;
end;

{ stretch draw support }

procedure DrawStretchImage(Canvas: TCanvas; Rect: TRect; Graph: TGraphic);
var DrawRect: TRect;
begin
  DrawRect := Rect;
  Canvas.Brush.Color := clBtnFace;
  Canvas.FillRect(DrawRect);
  with DrawRect do
    if (Graph.Width > Right - Left) or (Graph.Height > Bottom - Top) then
    begin
      if Graph.Width > Graph.Height then
        Bottom := Top + MulDiv(Graph.Height, Right - Left, Graph.Width)
      else
        Right := Left + MulDiv(Graph.Width, Bottom - Top, Graph.Height);
      Canvas.StretchDraw(DrawRect, Graph);
    end
    else
      with DrawRect do
        Canvas.Draw(Left + (Right - Left - Graph.Width) div 2,
          Top + (Bottom - Top - Graph.Height) div 2, Graph);
end;

function DrawPhotoFile(var FileName, ErrMsg: string; Canvas: TCanvas; Rect: TRect): Boolean;
var Graph: TGraphic;
begin
  Result := False;
  if FileName = '' then
  begin
    ErrMsg := SZTPhDlgErrorImageNotExists;
    Exit;
  end;
  FileName := GetUNCFileName(FileName);
  if not FileExists(FileName) then
  begin
    ErrMsg := Format(SZTPhDlgErrorImageNotFound, [FileName]);
    Exit;
  end;
  if FileIsJpeg(FileName) then
    Graph := TJpegImage.Create else Graph := TBitmap.Create;
  try
    Graph.LoadFromFile(FileName);
    Result := Graph.Width > 0;
    if Result then DrawStretchImage(Canvas, Rect, Graph);
  finally
    Graph.Free;
  end;
end;

function CreateImageFileFromClipboard(const FileName: string;
  Quality: Integer; ProgrEnc: Boolean): Boolean;
var
  Pict: TPicture;
  Graph: TGraphic;
begin
  //Result := False;
  Graph := TJPEGImage.Create;
  Pict := TPicture.Create;
  try
    Pict.Assign(Clipboard);
    //Pict.SaveToFile(FileName);
    with Graph as TJPEGImage do
    begin
      Assign(Pict.Graphic);
      ProgressiveEncoding := ProgrEnc;
      CompressionQuality := Quality;
      SaveToFile(FileName);
    end;
    Result := True;
  finally
    Graph.Free;
    Pict.Free;
  end;
  {OpenClipboard(Application.MainForm.Handle);
  Graph := TJPEGImage.Create;
  try
    Format := EnumClipboardFormats(0);
    while Format <> 0 do
    begin
      if TPicture.SupportsClipboardFormat(Format) then
      begin
        Data := GetClipboardData(Format);
        Palette := GetClipboardData(CF_PALETTE);
        (Graph as TJPEGImage).LoadFromClipboardFormat(Format, Data, Palette);
        Graph.SaveToFile(FileName);
        Result := True;
        Exit;
      end;
      Format := EnumClipboardFormats(Format);
    end;
  finally
    Graph.Free;
    CloseClipboard;
  end;}
end;

{ print support routines }

const MmPIn = 25.4; // milimeters per inch

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

procedure PrintBoundaryRect(Canvas: TCanvas; Width: Integer; Rect: TRect);
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

procedure PrintBoundaryText(Canvas: TCanvas; Width: Integer; Rect: TRect; const Txt: string; Align: Cardinal);
var Rct: TRect;
begin
  PrintBoundaryRect(Canvas, Width, Rect);
  Rct := Rect;
  InflateRect(Rct, -Width, -Width);
  PrintAlignedText(Canvas, Rct, Txt, Align);
end;

procedure PrintAlignedText(Canvas: TCanvas; Rect: TRect; const Txt: string; Align: Cardinal);
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
      H := DrawText(Handle, PChar(Txt), Length(Txt), Rect, Align + DT_CALCRECT);
      Rect.Bottom := Rect.Top + H;
    end;
    DrawText(Handle, PChar(Txt), Length(Txt), Rect, Align);
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
    DrawText(Handle, PChar(Txt), Length(Txt), Rct, Align); //DT_BOTTOM + DT_RIGHT);
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

procedure PrintParagraphToPrinter(var Rect: TRect;
  YMin, YMax: Integer; const Title: string; Body: array of string);
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
  Y := Rct.Bottom + H;
  Rct := Bounds(X, Y, W, H);
  for I := 0 to High(Body) do
  begin
    PrintAlignedTextCalc(Printer.Canvas, Rct, Body[I], DT_LEFT + DT_WORDBREAK);
    Rct.Top := Rct.Bottom;
    Rct.Right := Rct.Left + W;
    if Rct.Top + H * 6 > YMax then
    begin
      Rct.Top := YMin;
      Rct.Bottom := YMin + H;
      Printer.NewPage;
    end;
  end;
  Rect.Bottom := Rct.Bottom;
end;

procedure PrintTitleSign(Canvas: TCanvas; XPIn, YPIn: Integer);
const pSgn: array[0..4] of Pointer = (
    @SVDlgsSign0, @SVDlgsSign1, @SVDlgsSign2, @SVDlgsSign3, @SVDlgsSign4);
var
  Rct: TRect;
  Y, W, H, I: Integer;
  Txt: string;
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  LgRes, LgSize: Integer;
  LgResP: Pointer;
  LgMem: TMemoryStream;
begin
  Application.ProcessMessages;
  Bmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    LgRes := FindResource(HInstance, 'TMDOWLG', RT_RCDATA);
    if LgRes <> 0 then
    begin
      LgSize := SizeofResource(HInstance, LgRes);
      LgRes := LoadResource(HInstance, LgRes);
      if LgRes <> 0 then
      begin
        LgResP := LockResource(LgRes);
        if LgResP <> nil then
        begin
          LgMem := TMemoryStream.Create;
          with LgMem do
          try
            Write(LgResP^, LgSize);
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
        DrawText(Handle, PChar(Txt), Length(Txt), Rct, TA_RIGHT + TA_BOTTOM);
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

procedure SetPrinterOptions(AnOrientation: Integer;
  ACopies: Integer = 1; ADuplex: Integer = 1; APaperA3: Boolean = False);
var
  Device: array[0..cchDeviceName - 1] of Char;
  Driver: array[0..(MAX_PATH - 1)] of Char;
  Port: array[0..32] of Char;
  hDMode: THandle;
  pDMode: PDevMode;
  Fields: LongWord;
begin
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  if hDMode <> 0 then
  begin
    pDMode := GlobalLock(hDMode);
    if pDMode <> nil then
    begin
      case APaperA3 of
        False:
          if AnOrientation = 2 then pDMode^.dmPaperSize := DMPAPER_A4
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

{function DeviceCapabilities(pDriverName, pDeviceName, pPort: PChar;
  iIndex: Integer; pOutput: PChar; DevMode: PDeviceMode): Integer; stdcall;
  external 'winspool.drv' name 'DeviceCapabilities';

procedure GetPrinterPapers(PaperList: TStrings);
var
  Device: array[0..cchDeviceName - 1] of Char;
  Driver: array[0..(MAX_PATH - 1)] of Char;
  Port: array[0..32] of Char;
  Names: array[0..63] of array[0..63] of Char;
  hDMode: THandle;
  pDMode: PDevMode;
  I: Integer;
begin
  Printer.PrinterIndex := Printer.PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDMode);
  if hDMode <> 0 then
  begin
    pDMode := GlobalLock(hDMode);
    if pDMode <> nil then
    begin
      PaperList.Clear;
      if DeviceCapabilities(Driver, Device, Port, DC_PAPERNAMES, @Names, pDMode) >= 0 then
        for I := Low(Names) to High(Names) do
          PaperList.Add(Names[I]);
      GlobalUnlock(hDMode);
      Printer.PrinterIndex := Printer.PrinterIndex;
    end;
  end;
end;}

{ order payment state support}

const
  pOrderPaymentStateNames: array[TOrderPaymentState] of Pointer =
  (@SVDlgsStateNameFinished, @SVDlgsStateNameTimeOut, @SVDlgsStateNameNotPaid,
    @SVDlgsStateNamePartPaid, @SVDlgsStateNamePaid, @SVDlgsStateNameAnnulled,
    @SVDlgsStateNameOverPaid, @SVDlgsStateNameNullPay);
  pPlacePayStateNames: array[TPlacePayState] of Pointer =
  (@SPlaceFrmStateNmFree, @SPlaceFrmStateNmTimeOut, @SPlaceFrmStateNmNotPaid,
    @SPlaceFrmStateNmPartPaid, @SPlaceFrmStateNmPaid, @SPlaceFrmStateNmInQueue,
    @SPlaceFrmStateNmOverPaid, @SPlaceFrmStateNmInaccessible);
  pDiscountCalcTypes: array[TDiscountCalcType] of Pointer =
  (@SOrderFrmDiscountCalcClient, @SOrderFrmDiscountCalcOur, @SOrderFrmDiscountCalcNone);
  {pPlacePayStateIdents: array[TPlacePayState] of Pointer =
    (@SPlaceFrmStateIdFree, @SPlaceFrmStateIdTimeOut, @SPlaceFrmStateIdNotPaid,
     @SPlaceFrmStateIdPartPaid, @SPlaceFrmStateIdPaid, @SPlaceFrmStateIdInQueue,
     @SPlaceFrmStateIdInaccessible);}

function GetOrderPaymentStateName(State: Integer): string;
begin
  Result := LoadResString(pOrderPaymentStateNames[State]);
end;

function GetPlacePayStateName(State: Integer): string;
begin
  Result := LoadResString(pPlacePayStateNames[State]);
end;

{function GetPlacePayStateIdent(State: integer): String;
begin
  Result := LoadResString(pPlacePayStateIdents[State]);
end;}

procedure AssignDiscountCalcTypes(DiscTypeList: TStrings);
var I: Integer;
begin
  DiscTypeList.Clear;
  for I := Low(TDiscountCalcType) to High(TDiscountCalcType) do
    DiscTypeList.Add(LoadResString(pDiscountCalcTypes[I]));
end;

{ service cost }

const
  nHotelServiceHaveCostInfo: array[THotelServiceCost] of Pointer = (
    @SHtlServDlgHaveCostUnknown,
    @SHtlServDlgHaveCostInclude, @SHtlServDlgHaveCostExclude);

function GetHotelServiceHaveCostInfo(HaveCost: Integer): string;
begin
  Result := LoadResString(nHotelServiceHaveCostInfo[HaveCost]);
end;

{ special error messages }

procedure ErrorInsurePerson(const Tourist, Error: string);
begin
  ErrorFmtDlg('%s:'#13'%s.', [Tourist, Error]);
end;

{ database error messages }

function GetDatabaseErrorCategory(ErrCat: Byte): string;
begin
  case ErrCat of
    ERRCAT_SYSTEM: Result := SDataModExceptCatSystem;
    ERRCAT_NOTFOUND: Result := SDataModExceptCatNotFound;
    ERRCAT_DATACORRUPT: Result := SDataModExceptCatDataCorrupt;
    ERRCAT_IO: Result := SDataModExceptCatIOError;
    ERRCAT_LIMIT: Result := SDataModExceptCatLimit;
    ERRCAT_INTEGRITY: Result := SDataModExceptCatIntegrity;
    ERRCAT_INVALIDREQ: Result := SDataModExceptCatInvalidRequest;
    ERRCAT_LOCKCONFLICT: Result := SDataModExceptCatLockConflict;
    ERRCAT_SECURITY: Result := SDataModExceptCatSecurity;
    ERRCAT_INVALIDCONTEXT: Result := SDataModExceptCatInvalidContext;
    ERRCAT_OS: Result := SDataModExceptCatOSorIdapi;
    ERRCAT_NETWORK: Result := SDataModExceptCatNetwork;
    ERRCAT_OPTPARAM: Result := SDataModExceptCatOptParam;
    ERRCAT_QUERY: Result := SDataModExceptCatQuery;
    ERRCAT_VERSION: Result := SDataModExceptCatVersion;
    ERRCAT_CAPABILITY: Result := SDataModExceptCatCapability;
    ERRCAT_CONFIG: Result := SDataModExceptCatConfig;
    ERRCAT_WARNING: Result := SDataModExceptCatWarning;
    ERRCAT_OTHER: Result := SDataModExceptCatOther;
    ERRCAT_COMPATIBILITY: Result := SDataModExceptCatCompatibility;
    ERRCAT_REPOSITORY: Result := SDataModExceptCatRepository;
    ERRCAT_DRIVER: Result := SDataModExceptCatDriver;
    ERRCAT_RC: Result := SDataModExceptCatInternal;
  else Result := '';
  end;
end;

function GetBDEDecimalSeparator: Char;
var BDENumberFormat: FMTNumber;
begin
  if DbiGetNumberFormat(BDENumberFormat) = DBIERR_NONE then
    Result := BDENumberFormat.cDecimalSeparator else Result := DecimalSeparator;
end;

{ !!! stubs !!! }

{function PrintReportForm(Capt: PChar; Frm, Prnt: Integer; Arr: TPrintReportArr): Boolean;
begin
  Result := False;  // MUST BE USED BY TEMPLATES !
end;}

end.

