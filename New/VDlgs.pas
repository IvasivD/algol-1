unit VDlgs;
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, Classes, Controls, StdCtrls, Grids, Graphics, ComCtrls,
  DB, DBCtrls, DBGrids,
  //SvtDBGrids,
  TourConsts, Mask, cxImageComboBox,
  cxHyperLinkEdit, cxDBEdit, DBCtrlsEh, SHFolder, ShellAPI, Core, UnitProc,IdHTTP,
  Variants,
  AdvDateTimePicker, cxCalendar;

var
  // sizes of SDI windows
  xClientWindow: Integer = 0;
  yClientWindow: Integer = 74;
  hClientWindow: Integer = 467;
  wClientWindow: Integer = 800;
  xBrowseWindow: Integer = 0;
  yBrowseWindow: Integer = 90;

// scale constants
const
  gNormalPixelsPerInch = 96;
var
  gPixelsPerInch: Integer = gNormalPixelsPerInch;

const
  // colors
  clEditControlColors: array[Boolean] of TColor = (clBtnFace, clInfoBk);

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
{$WARN UNSAFE_TYPE OFF}
  TMyStatusMsg = record
    Msg: Cardinal;
    Symb: PChar;
    Result: Longint;
  end;
{$WARN UNSAFE_TYPE ON}
  TDataScrollMsg = record
    Msg: Cardinal;
    KeyId: Longint;
    Result: Longint;
  end;

var
  MainFormHandle: Integer;

procedure SendMyStatusMsg(const Msg: string);
procedure ClearMyStatusMsg;

{ Phone dial utility }
function PhoneDialNumber(
  WndHandle: Integer; EditControl: TCustomEdit; const OpenDoc: string): Boolean;
function GetSpecialFolderPath(folder : integer) : string;
function Phone3cxDialNumber(
  WndHandle: Integer; const Param: string): Boolean;
function PhoneJitsiDialNumber(
  WndHandle: Integer; const Param: string): Boolean;

{ list view and image fields management routines }
procedure AddImageFromField(ImgList: TImageList; ImgField: TBlobField);
procedure SetListViewStyle(ListView: TListView; ATag: Integer);

{ place map operating and drawing }

type
  TPlaceMapArr = array of array of String;

function ScatterPlaceMap(const MapRec: String;
  var MapWidth, MapHeight: Integer; var MapArr: TPlaceMapArr): Boolean;
function ShowPlaceMap(
  const AMap: string; AGrid: TStringGrid; Purely: Boolean): Boolean;
function PlaceMapToDelimit(const AMap: string): string;

{ message dialogs calls }
function VInputDlg(const ACaption, APrompt, ADefault: string): string;
function VInputQuery(const ACaption, APrompt: string; var AValue: string): Boolean;

{ number as string formatting routines }
procedure StrDecodeDate(ADate: TDate; var SY, SM, SD: string);

{ convert the given value to string or empty string if zero }
function IntToNonZero(Value: Longint): string;
function DurationToNonZero(Duration: Double): string;

{ other operations with TStrings }
 //declared into OptSet.pas: procedure LoadRegistryStrings(const Key: String; Strings: TStrings; Addits: TStrings = nil);
procedure DelimitedToStrings(const Delimit: string; Strings: TStrings);
function StringsToDelimited(Strings: TStrings): string;
procedure StringsDeleteExisted(Strings, CompareWith: TStrings);

{ historing the string }
procedure AddComboBoxHistory(Combo: TCustomComboBox; const AddTo: string);
procedure AddToHistory(History: TStrings; const AddTo: string);

{ making caption string routines }
procedure PhoneLabelsCaption(IsCompany: Boolean; Label1, Label2: TLabel);

{working with group boxes}
function GetControlHighlightColor(Predefined, Enable: Boolean): TColor;
procedure ToggleControlEnabled(Control: TControl; Enable: Boolean);
procedure ToggleGroupControls(GroupBox: TCustomControl; Enable: Boolean);
procedure ToggleControlReadOnly(Control: TControl; ROnly: Boolean);
procedure ToggleGroupReadOnly(GroupBox: TCustomControl; ROnly: Boolean);

{ window scale, arrange and position calculation }
//scales DBGrid for large sysfont and return the calculated columns DBGrid`s width
function ScaleDBGridColumns(DBGrid: TDBGrid): Integer; overload;
function ScaleDBGridColumns(DBGrid: TSvtDBGrid): Integer; overload;
procedure ScaleDrawGridColumns(DrawGrid: TDrawGrid); //scales DrawGrid
procedure ArrangeRightSides(ArControl, ByControl: TControl);
function CalcBrowseTop(MinHeight: Integer): Integer;
function CalcBrowseLeft(MinWidth: Integer): Integer;
procedure CalcNextBrowseOrigin(NextOrigin: TPoint);
function DBGridDblClickIsValid(DBGrid: TDBGrid; var ColumnIndex: Integer): Boolean;
function SvtDBGridDblClickIsValid(DBGrid: TSvtDBGrid; var ColumnIndex: Integer): Boolean;
procedure DBGridDrawNotActive(DBGrid: TDBGrid; IsActive: Boolean;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState); overload;
procedure DBGridDrawNotActive(DBGrid: TSvtDBGrid; IsActive: Boolean;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState); overload;
procedure SetDBGridSortedColIndex(DBGrid: TSvtDBGrid; NewColIndex: Integer);

{ picture support }

procedure DrawListImage(ImageList: TImageList; Canvas: TCanvas; X, Y, ImageIndex: Integer);
procedure DrawNonStretchImage(Canvas: TCanvas; Rect: TRect; Graph: TGraphic);
procedure DrawStretchImage(Canvas: TCanvas; Rect: TRect; Graph: TGraphic);
function DrawPhotoFile(var FileName, ErrMsg: string; Canvas: TCanvas; Rect: TRect): Boolean;
function CreateImageFileFromClipboard(const FileName: string;
  Quality: Integer; ProgrEnc: Boolean): Boolean;

function CallLink( aHandle:THandle; UserNameValue, WebLink:WideString):boolean;
function GetPhoneCodeCountryForOfficeId( ConDBParam:TConnectDBParam; idOffice:Variant):Variant;
Procedure UpdatePrefixCountryCode( Sender:TObject; Elem:TDBShemaView; OfficeId:Variant );
{ routes and trips management }

type
  TDirection = 0..1; // route directions (forward = 0, backward = 1)
  TRouteTimeLinkTo = (tlDepartCity, tlArriveCity); //route time calculating prop

{ currency constants }

const // Currency IDs
  crncyUAH = 0;
  crncyUSD = 1;
  crncyUAHId = 75;

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
  sCurrencyIdent: array[crncyUAH..crncyUSD] of Pointer =
  (@SPayDlgUAH, @SPayDlgUSD);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}

{ Service kinds constants }

const
  servKindDrive = 0;
  servKindHotel = 1;
  servKindExcurs = 4;
  servKindInterest = 9;

{ special error messages }
procedure ErrorInsurePerson(const Tourist, Error: string);

{ create folder }
function CreateFolder(const DirName: String; Hidden: Boolean = False): Boolean;
{ set attributes for file or folder }
procedure SetFileAttrib(const DocName: String; Hide, Read: Boolean; IsFolder: Boolean = False);
procedure SetFileHidden(const DocName: String; IsFolder: Boolean = False);


implementation

uses SysUtils, Math, Forms, Dialogs, Buttons, ActnList, Spin, Jpeg, Clipbrd,
  CheckLst, AzComboBox, TourCmnlIf, AdvEdit, AzEdit;

const
  fPhoneDialer = 'DIALER.EXE' platform; // phone dialer executable
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

function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0])) 
  then Result := path
  else Result := '';
end;

function Phone3cxDialNumber(
  WndHandle: Integer; const Param: string): Boolean;
const LvivCod = '380322';  
var PFPaht, PhoneNo: string;
begin
  PFPaht := GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\3CXPhone\3CXPhone.exe';    
  PhoneNo := StringReplace(Param, ' ', EmptyStr, [rfReplaceAll]);
  if Pos(LvivCod, PhoneNo) = 1 
  then PhoneNo := StringReplace(PhoneNo, LvivCod, '2', []);
  Result := 
    ShellExecute(WndHandle, PChar('open'), 
      PChar(PFPaht), PChar('dial:' + PhoneNo), '', SW_NORMAL) > 32;
end;

function PhoneJitsiDialNumber(
  WndHandle: Integer; const Param: string): Boolean;
const LvivCod = '380322';  
var PFPaht, PhoneNo: string;
begin
  PFPaht := GetSpecialFolderPath(CSIDL_PROGRAM_FILES) + '\Jitsi\Jitsi.exe';    
  PhoneNo := StringReplace(Param, ' ', EmptyStr, [rfReplaceAll]);
  if Pos(LvivCod, PhoneNo) = 1 
  then PhoneNo := StringReplace(PhoneNo, LvivCod, '2', []);
  Result := 
    ShellExecute(WndHandle, PChar('open'), 
      PChar(PFPaht), PChar('sip:' + PhoneNo), '', SW_NORMAL) > 32;
end;
{ list view and image fields management routines }

procedure AddImageFromField(ImgList: TImageList; ImgField: TBlobField);
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

{ drive place map routines}

const
  nDefPlaceMapWidth = 5;
  nDefPlaceMapHeight = 5;

procedure ClearPlaceMap(var MapArr: TPlaceMapArr; MapWidth, MapHeight: Integer);
var I, J: Integer;
begin
  SetLength(MapArr, MapHeight);
  for J := 0 to MapHeight - 1 do
  begin
    SetLength(MapArr[J], MapWidth);
    for I := 0 to MapWidth - 1 do MapArr[J, I] := '';
  end;
end;

function DecodePlaceMap(const MapRec: String;
  var MapWidth, MapHeight: Integer; var MapBody: String): Boolean;
var
  S: string;
  P: Integer;
begin
  Result := True;
  S := MapRec;
  P := Pos(',', S);
  try
    MapWidth := StrToInt(Copy(S, 1, P - 1));  // get MapWidth
  except
    MapWidth := nDefPlaceMapWidth;  // if error
    Result := False;
  end;
  S := Copy(S, P + 1, Length(S)); // truncate
  P := Pos(',', S);
  try
    MapHeight := StrToInt(Copy(S, 1, P - 1)); // get MapHeight
  except
    MapHeight := nDefPlaceMapHeight; // if error
    Result := False;
  end;
  MapBody := Copy(S, P + 1, Length(S)); // truncate the place map imaging string
end;

function ScatterPlaceMap(const MapRec: String;
  var MapWidth, MapHeight: Integer; var MapArr: TPlaceMapArr): Boolean;
var
  S: string;
  I, J, P: Integer;
begin
  {Result := True;
  S := MapRec;
  P := Pos(',', S);
  try
    MapWidth := StrToInt(Copy(S, 1, P - 1));  // get MapWidth
  except
    MapWidth := nDefPlaceMapWidth;  // if error
    Result := False;
  end;
  S := Copy(S, P + 1, Length(S)); // truncate
  P := Pos(',', S);
  try
    MapHeight := StrToInt(Copy(S, 1, P - 1)); // get MapHeight
  except
    MapHeight := nDefPlaceMapHeight; // if error
    Result := False;
  end;
  S := Copy(S, P + 1, Length(S)); // truncate the place map imaging string}
  Result := DecodePlaceMap(MapRec, MapWidth, MapHeight, S);
  ClearPlaceMap(MapArr, MapWidth, MapHeight);
  for J := 0 to MapHeight - 1 do  // reading from place map imaging string
    for I := 0 to MapWidth - 1 do
    begin
      P := Pos(',', S);
      if P = 0 then // if is never more comma in the place map imaging string
      begin
        Break;
        Result := False;
      end;
      MapArr[J, I] := Copy(S, 1, P - 1);
      S := Copy(S, P + 1, Length(S));
    end;
end;

function PlaceMapToDelimit(const AMap: string): string;
var MapWidth, MapHeight: Integer;
begin
  if DecodePlaceMap(AMap, MapWidth, MapHeight, Result) then
    Result := StringReplace(Result, ',', ';', [rfReplaceAll])
  else Result := '';
end;

{ draw the drive place map }

function ShowPlaceMap(
  const AMap: string; AGrid: TStringGrid; Purely: Boolean): Boolean;
var
  MapArr: TPlaceMapArr;
  W, H, I, J: Integer;
  C: string;
begin
  Result := ScatterPlaceMap(AMap, W, H, MapArr);
  with AGrid do
  begin
    ColCount := W;
    RowCount := H;
    for J := 0 to RowCount - 1 do // reading the place mapping grid
      for I := 0 to ColCount - 1 do
        if Result then
        begin
          C := MapArr[J, I];
          if Purely and (C = '*') then Cells[I, J] := '' else Cells[I, J] := C;
        end
        else Cells[I, J] := '';
  end;
end;

{function ShowPlaceMap(
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
end;}

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
{$WARN UNSAFE_CAST OFF}
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
{$WARN UNSAFE_CAST ON}
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
    {$WARN UNSAFE_TYPE OFF}
    DrawText(Canvas.Handle, PChar(APrompt), Length(APrompt), TextRect,
      DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or
      DrawTextBiDiModeFlagsReadingOnly);
    {$WARN UNSAFE_TYPE ON}
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

{ number as string formatting routines }

procedure StrDecodeDate(ADate: TDate; var SY, SM, SD: string);
var Y, M, D: Word;
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

procedure StringsDeleteExisted(Strings, CompareWith: TStrings);
var I: Integer;
begin
  with Strings do
    for I := Count - 1 downto 0 do
      if CompareWith.IndexOf(Strings[I]) >= 0 then Delete(I);
end;

{ manipulating with controls }

procedure AddComboBoxHistory(Combo: TCustomComboBox; const AddTo: string);
begin
  if Combo is TDBComboBox then
    AddToHistory((Combo as TDBComboBox).Items, AddTo)
  else if Combo is TAzComboBox then
    AddToHistory((Combo as TAzComboBox).Items, AddTo)
  else if Combo is TComboBox then
    AddToHistory((Combo as TComboBox).Items, AddTo);
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

function GetControlHighlightColor(Predefined, Enable: Boolean): TColor;
const
  hldbcNormalColors: array[Boolean] of TColor = ($00E7CEFF, clInfoBk);
  hldbcPredefColors: array[Boolean] of TColor = ($00E7CEFF, clBtnFace);
begin
  if Predefined then Result := hldbcPredefColors[Enable]
  else Result := hldbcNormalColors[Enable];
end;

procedure ToggleControlEnabled(Control: TControl; Enable: Boolean);
begin
  if (Control is TSpeedButton) and Assigned(Control.Action) then
    (Control.Action as TCustomAction).Enabled := Enable
  else if not (Control is TLabel) or Assigned((Control as TLabel).FocusControl)
  then Control.Enabled := Enable;
  if Control is TEdit then
    with Control as TEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBEdit then
    with Control as TDBEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TComboBox then
    (Control as TComboBox).Color := clEditControlColors[Enable]
  else if Control is TAzComboBox then
    (Control as TAzComboBox).Color := clEditControlColors[Enable]
  else if Control is TDBComboBox then
    with Control as TDBComboBox do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBLookupComboBox then
    with Control as TDBLookupComboBox do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TListBox then
    (Control as TListBox).Color := clEditControlColors[Enable]
  else if Control is TCheckListBox then
    (Control as TCheckListBox).Color := clEditControlColors[Enable]
  else if Control is TDBLookupListBox then
    with Control as TDBLookupListBox do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDateTimePicker then
    (Control as TDateTimePicker).Color := clEditControlColors[Enable]
  else if Control is TSpinEdit then
    with Control as TSpinEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBGrid then
    with Control as TDBGrid do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDrawGrid then
    (Control as TDrawGrid).Color := clEditControlColors[Enable]
  else if Control is TMemo then
    with Control as TMemo do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBMemo then
    with Control as TDBMemo do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TRichEdit then
    with Control as TRichEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBRichEdit then
    with Control as TDBRichEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TMaskEdit then
    with Control as TMaskEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TcxHyperLinkEdit then
    with Control as TcxHyperLinkEdit do
      Style.Color := clEditControlColors[Enabled and not Properties.ReadOnly]
  else if Control is TDBDateTimeEditEh then
    with Control as TDBDateTimeEditEh do
      Color := clEditControlColors[Enabled and not ReadOnly]      
  else if Control is TAdvDateTimePicker then
    with Control as TAdvDateTimePicker do Color := clEditControlColors[Enabled]      
  else if Control is TComboBoxEx then
    (Control as TComboBoxEx).Color := clEditControlColors[Enable]
end;

procedure ToggleGroupControls(GroupBox: TCustomControl; Enable: Boolean);
var I: Integer;
begin
  with GroupBox do
  begin
    Enabled := Enable;
    for I := 0 to ControlCount - 1 do
    begin
      ToggleControlEnabled(Controls[I], Enable);
      if (Controls[I] is TCustomControl)
        and ((Controls[I] as TCustomControl).ControlCount > 0)
        then ToggleGroupControls(Controls[I] as TCustomControl, Enable);
    end;
  end;
end;

procedure ToggleControlReadOnly(Control: TControl; ROnly: Boolean);
var I, J: Integer;
begin
  if (Control is TSpeedButton) then
  begin
    if Assigned(Control.Action) then
      (Control.Action as TCustomAction).Enabled := not ROnly
    else (Control as TSpeedButton).Enabled := not ROnly
  end
  else
  if (Control is TBitBtn) then
  begin
    if Assigned(Control.Action) then
      (Control.Action as TCustomAction).Enabled := not ROnly
    else (Control as TBitBtn).Enabled := not ROnly
  end
  else if Control is TCheckBox then
    (Control as TCheckBox).Enabled := not ROnly
  else if Control is TDBCheckBox then
    (Control as TDBCheckBox).ReadOnly := ROnly
  else if Control is TRadioButton then
    (Control as TRadioButton).Enabled := not ROnly
  else if Control is TEdit then
    with Control as TEdit do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDBEdit then
    with Control as TDBEdit do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TComboBox then
    with Control as TComboBox do
    begin
      Enabled := not ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TAzComboBox then
    with Control as TAzComboBox do
    begin
      Enabled := not ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TAzEdit then
    with Control as TAzEdit do
    begin
      Enabled := not ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDBComboBox then
    with Control as TDBComboBox do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDBLookupComboBox then
    with Control as TDBLookupComboBox do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TListBox then
    with Control as TListBox do
    begin
      Enabled := not ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDBLookupListBox then
    with Control as TDBLookupListBox do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TCheckBox then
    with Control as TCheckBox do Enabled := not ROnly
  else if Control is TDBCheckBox then
    with Control as TDBCheckBox do ReadOnly := ROnly
  else if Control is TDateTimePicker then
    with Control as TDateTimePicker do
    begin
      Enabled := not ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TSpinEdit then
    with Control as TSpinEdit do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDBGrid then
    with Control as TDBGrid do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDrawGrid then
    with Control as TDrawGrid do
    begin
      Enabled := not ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TMemo then
    with Control as TMemo do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDBMemo then
    with Control as TDBMemo do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TRichEdit then
    with Control as TRichEdit do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TDBRichEdit then
    with Control as TDBRichEdit do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TPageControl then
    with Control as TPageControl do
      for I := 0 to PageCount - 1 do
        with Pages[I] do
          for J := 0 to ControlCount - 1 do
            ToggleControlReadOnly(Controls[J], ROnly)
  else if Control is TcxDBHyperLinkEdit then
    with Control as TcxDBHyperLinkEdit do
    begin
      Properties.ReadOnly := ROnly;
      Style.Color := clEditControlColors[not ROnly];
    end
  else if Control is TcxDBDateEdit then
    with Control as TcxDBDateEdit do
    begin
      Properties.ReadOnly := ROnly;
      Style.Color := clEditControlColors[not ROnly];
    end
  else if Control is TcxDBCheckBox then
    with Control as TcxDBCheckBox do
      Properties.ReadOnly := ROnly
  else if Control is TcxDateEdit then
    with Control as TcxDateEdit do
    begin
      Properties.ReadOnly := ROnly;
      Style.Color := clEditControlColors[not ROnly];
    end    
  else if Control is TDBDateTimeEditEh then
    with Control as TDBDateTimeEditEh do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TAdvEdit then
    with Control as TAdvEdit do
    begin
      ReadOnly := ROnly;
      Color := clEditControlColors[not ROnly];
    end
  else if Control is TcxImageComboBox then
    with Control as TcxImageComboBox do
    begin
      Properties.ReadOnly := ROnly;
      Style.Color := clEditControlColors[not ROnly];
    end
end;

procedure ToggleGroupReadOnly(GroupBox: TCustomControl; ROnly: Boolean);
var I: Integer;
begin
  with GroupBox do
    for I := 0 to ControlCount - 1 do
    begin
      ToggleControlReadOnly(Controls[I], ROnly);
      if (Controls[I] is TCustomControl)
        and ((Controls[I] as TCustomControl).ControlCount > 0)
        then ToggleGroupReadOnly(Controls[I] as TCustomControl, ROnly);
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
          Width := Trunc(Longint(Width) * Scale);
        Result := Result + Width;
      end;
  Result := Result + 20; // plus scrollbar width
end;

function ScaleDBGridColumns(DBGrid: TSvtDBGrid): Integer;
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
          Width := Trunc(Longint(Width) * Scale);
        Result := Result + Width;
      end;
  Result := Result + 20; // plus scrollbar width
end;

procedure ScaleDrawGridColumns(DrawGrid: TDrawGrid);
var
  I: Integer;
  Scale: Extended;
begin
  Scale := gPixelsPerInch / gNormalPixelsPerInch;
  if Scale <> 1 then
    with DrawGrid do
      for I := 0 to ColCount - 1 do
        ColWidths[I] := Trunc(Longint(ColWidths[I]) * Scale);
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

function DBGridDblClickIsValid(DBGrid: TDBGrid; var ColumnIndex: Integer): Boolean;
var
  Coord: TGridCoord;
  P: TPoint;
begin
  P := DBGrid.ScreenToClient(Mouse.CursorPos);
  Coord := DBGrid.MouseCoord(P.X, P.Y);
  with Coord do
    Result := ((Y > 0) or (Y = 0) and not (dgTitles in DBGrid.Options))
      and ((X > 0) or (X = 0) and not (dgIndicator in DBGrid.Options));
  if Result then ColumnIndex := Coord.X else ColumnIndex := -1;
end;

function SvtDBGridDblClickIsValid(DBGrid: TSvtDBGrid; var ColumnIndex: Integer): Boolean;
var
  Coord: TGridCoord;
  P: TPoint;
begin
  P := DBGrid.ScreenToClient(Mouse.CursorPos);
  Coord := DBGrid.MouseCoord(P.X, P.Y);
  with Coord do
    Result := ((Y > 0) or (Y = 0) and not (dgTitles in DBGrid.Options))
      and ((X > 0) or (X = 0) and not (dgIndicator in DBGrid.Options));
  if Result then ColumnIndex := Coord.X else ColumnIndex := -1;
end;

procedure DBGridDrawNotActive(DBGrid: TDBGrid; IsActive: Boolean;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Index: Integer;
  MultiSel: Boolean;
begin
  if not (gdFixed in State) then
    with DBGrid, Canvas do
    begin
      MultiSel := (dgMultiSelect in Options) and Datasource.Dataset.Active and
        SelectedRows.Find(DataSource.Dataset.Bookmark, Index);
      Brush.Style := bsSolid;
      if IsActive and (gdSelected in State) then Brush.Color := clHighlight
      else if MultiSel and not (gdSelected in State)
        then Brush.Color := clBtnFace
      else if {MultiSel or }(gdSelected in State) and (dgAlwaysShowSelection in Options)
        then Brush.Color := clBtnShadow
      else if not Enabled then Brush.Color := clBtnFace
      else Brush.Color := Column.Color;
      FrameRect(Rect);
      case Brush.Color of
        clBtnShadow:
          if MultiSel and not (gdSelected in State) then Font.Color := clWindowText
          else Font.Color := clHighlightText;
        clHighlight: Font.Color := clHighlightText;
        else Font.Color := Column.Font.Color; //clWindowText;
      end;
    end;
end;

procedure DBGridDrawNotActive(DBGrid: TSvtDBGrid; IsActive: Boolean;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState); overload;
var
  Index: Integer;
  MultiSel: Boolean;
begin
  if not (gdFixed in State) then
    with DBGrid, Canvas do
    begin
      MultiSel := (dgMultiSelect in Options) and Datasource.Dataset.Active and
        SelectedRows.Find(DataSource.Dataset.Bookmark, Index);
      Brush.Style := bsSolid;
      if IsActive and (gdSelected in State) then Brush.Color := clHighlight
      else if MultiSel and not (gdSelected in State)
        then Brush.Color := clBtnFace
      else if {MultiSel or }(gdSelected in State) and (dgAlwaysShowSelection in Options)
        then Brush.Color := clBtnShadow
      else if not Enabled then Brush.Color := clBtnFace
      else Brush.Color := Column.Color;
      FrameRect(Rect);
      case Brush.Color of
        clBtnShadow:
          if MultiSel and not (gdSelected in State) then Font.Color := clWindowText
          else Font.Color := clHighlightText;
        clHighlight: Font.Color := clHighlightText;
        else Font.Color := Column.Font.Color; //clWindowText;
      end;
    end;
end;

procedure SetDBGridSortedColIndex(DBGrid: TSvtDBGrid; NewColIndex: Integer);
begin
  with DBGrid do SortedColIndex := Min(SortedColIndex, NewColIndex);
end;

{ picture and drawing support }

procedure DrawListImage(ImageList: TImageList; Canvas: TCanvas; X, Y, ImageIndex: Integer);
begin
  if ImageIndex <> -1 then ImageList.Draw(Canvas, X, Y, ImageIndex);
end;

procedure DrawNonStretchImage(Canvas: TCanvas; Rect: TRect; Graph: TGraphic);
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
      //Canvas.ClipRect := 
      Canvas.Draw(0, 0, Graph);
    end
    else
      with DrawRect do
        Canvas.Draw(Left + (Right - Left - Graph.Width) div 2,
          Top + (Bottom - Top - Graph.Height) div 2, Graph);
end;

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
  FileName := FileName;//GetUNCFileName(FileName);
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

{ special error messages }

procedure ErrorInsurePerson(const Tourist, Error: string);
begin
  ErrorFmtDlg('%s:'#13'%s.', [Tourist, Error]);
end;

{ set hiddenn attribute for file or folder }

procedure SetFileAttrib(const DocName: String; Hide, Read: Boolean; IsFolder: Boolean = False);
var Attr: Integer;
begin
  Attr := 0;
  if Read then Attr := Attr + faReadOnly;
  if Hide then Attr := Attr + faHidden;
  if IsFolder then Attr := Attr + faArchive;
  FileSetAttr(DocName, Attr);
end;

procedure SetFileHidden(const DocName: String; IsFolder: Boolean = False);
begin
  if IsFolder then FileSetAttr(DocName, faHidden)
  else FileSetAttr(DocName, faHidden + faArchive);
end;

{ create folder }

function CreateFolder(const DirName: String; Hidden: Boolean = False): Boolean;
begin
  Result := CreateDir(IncludeTrailingBackslash(DirName));
  if not Result then ErrorFmtDlg(SVDlgsDirCreateFatal, [DirName])
  else if Hidden then SetFileHidden(DirName, True);
end;

function CallLink( aHandle:THandle; UserNameValue, WebLink:WideString):boolean;
var FidHTTP:TIdHTTP;
    ACource:TStrings;
    CurrLink:String;
begin
  if Trim( WebLink )<>'' then
  begin
    ReplaseON( WebLink,'#username',UserNameValue);
    ReplaseON( WebLink,'#PROGRAM_FILES', GetSpecialFolderPath(CSIDL_PROGRAM_FILES) );

    CurrLink := WebLink;
    ShellExecute(aHandle, 'open',PChar(CurrLink),nil,nil, SW_SHOWNORMAL);

    result := True;
  end
  else Result :=  false;
end;

function GetPhoneCodeCountryForOfficeId( ConDBParam:TConnectDBParam; idOffice:Variant):Variant;
var Sql : WideString;
begin
  result := '';
  if idOffice = null then Exit;

  Sql := ' select COUNTRIES_INFO.avalue from COMPOFFICES '+
         ' left join city_adm_unit on city_adm_unit.id = COMPOFFICES.id_city_adm_unit '+
         ' left join COUNTRIES_INFO on COUNTRIES_INFO.id_countries = city_adm_unit.id_country '+
         ' where COMPOFFICES.officeid = '+VarToStr( idOffice) +' and COUNTRIES_INFO.id_countries_type_info =14 ';
  result := DBGetValue(ConDBParam,  SQL, 'avalue' );
end;

Procedure UpdatePrefixCountryCode( Sender:TObject; Elem:TDBShemaView; OfficeId:Variant );
var DisplayText:variant;
    UseCountryCode:Integer;
    CurrPhoneCode:Variant;
    CaptionRow : widestring;
    MaskTemplate : TMasMaskTemplate;
begin
   if OfficeId = null then Exit;

   CaptionRow:=Elem.View.GetColumnByFieldName('AVALUE').Caption;
   DisplayText := Elem.GetVerticalGridGridByCaptionValue( CaptionRow );
   MaskTemplate := Elem.FindMaskTemplateFieldForField( 'AVALUE' );
   UseCountryCode := TDBShema(MaskTemplate.ElemeSource).DB.FieldByName('USECODECOUNTRY').AsInteger;

   if (Elem.DB.State in [dsInsert])and
      ( (DisplayText=null)or(DisplayText =  Unassigned)or(DisplayText = '+') ) then
   begin
     if ( UseCountryCode = 1 ) then // 1 - Prefix Code Country
     begin
       CurrPhoneCode := GetPhoneCodeCountryForOfficeId( Elem.DBGetParamConnect,OfficeId );
       if CurrPhoneCode <> null then
         Elem.UpdateVerticalGridByCaptionValue( Sender, CaptionRow, CurrPhoneCode);
     end
     else Elem.UpdateVerticalGridByCaptionValue( Sender, CaptionRow, '');
   end;
end;

{ !!! stubs !!! }

{function PrintReportForm(Capt: PChar; Frm, Prnt: Integer; Arr: TPrintReportArr): Boolean;
begin
  Result := False;  // MUST BE USED BY TEMPLATES !
end;}

end.