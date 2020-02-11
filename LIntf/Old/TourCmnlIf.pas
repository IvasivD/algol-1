unit TourCmnlIf;

interface

uses Windows, Classes, Graphics, Forms, ActnList;

{$DEFINE UseDialogs}
{$DEFINE UseInputHist}

{ message dialog calls }

{$IFDEF UseDialogs}
function ConfirmDlg(const Msg: string): Integer;
function ConfirmDlgYC(const Msg: string): Boolean;
function ConfirmDlgYN(const Msg: string): Boolean;
function ConfirmFmtDlg(const Msg: string; const Args: array of const): Integer;
function ConfirmFmtDlgYC(const Msg: string; const Args: array of const): Boolean;
function ConfirmFmtDlgYN(const Msg: string; const Args: array of const): Boolean;
function ErrorDlg(const Msg: string): Boolean;
function ErrorFmtDlg(const Msg: string; const Args: array of const): Boolean;
function ErrorHlpDlg(const Msg: string; Ctx: Integer): Boolean;
function ErrorFmtHlpDlg(const Msg: string; const Args: array of const; Ctx: Integer): Boolean;
function InformDlg(const Msg: string): Boolean;
function InformFmtDlg(const Msg: string; const Args: array of const): Boolean;
function WarningDlg(const Msg: string): Integer;
function WarningDlgY(const Msg: string): Boolean;
function WarningDlgYC(const Msg: string): Boolean;
function WarningDlgYN(const Msg: string): Boolean;
function WarnErrDlgYN(const Msg: string): Boolean;
function WarningFmtDlg(const Msg: string; const Args: array of const): Integer;
function WarningFmtDlgY(const Msg: string; const Args: array of const): Boolean;
function WarningFmtDlgYC(const Msg: string; const Args: array of const): Boolean;
function WarningFmtDlgYN(const Msg: string; const Args: array of const): Boolean;
function TrInputDlg(const ACaption, APrompt, ADefault: string): string;
function TrInputQuery(const ACaption, APrompt: string; var AValue: string): Boolean;
function SplashPromptForm(ACaption, APrompt: string): TForm;
{$ENDIF}
{$IFDEF UseInputHist}
function InputHistDlg(const ACaption, APrompt: string; var AValue: string;
  const AHistSect: string = ''): Boolean;
{$ENDIF}


{ additional math routines }

procedure IntDivision(Value, Divide: Integer; var IntPart, FracPart: Integer); external 'TourCmnl.dll';

{ additional date routines }

type
  TDateOrder = (doMDY, doDMY, doYMD);

function SelectDateFromPicker(ADate: TDateTime): TDateTime; external 'TourCmnl.dll';
function SelectTimeFromPicker(ATime: TDateTime): TDateTime; external 'TourCmnl.dll';
// Int(ADate) + Frac(ATime)
function SumDateAndTime(ADate, ATime: TDateTime): TDateTime; external 'TourCmnl.dll';
// age in years by date of birth
function YearAge(Value: TDateTime): Integer; external 'TourCmnl.dll';
function YearAgeByDate(Value, ByDate: TDateTime): Integer; external 'TourCmnl.dll';
// arithmetic date and time changind
function DateAddMonth(Value: TDateTime; ByMonth: Integer): TDateTime; external 'TourCmnl.dll';
function DateAddYear(Value: TDateTime; ByYear: Integer): TDateTime; external 'TourCmnl.dll';
function TimeAddSecond(Value: TDateTime; BySecond: Integer): TDateTime; external 'TourCmnl.dll';
function TimeAddMinute(Value: TDateTime; ByMinute: Integer): TDateTime; external 'TourCmnl.dll';
function TimeAddHour(Value: TDateTime; ByHour: Integer): TDateTime; external 'TourCmnl.dll';
{ convert Duration value in seconds to TTime value }
function DurationToTime(Duration: Integer): TDateTime; external 'TourCmnl.dll';
{ return first and last day of last month in FromDate and TillDate parameters }
procedure GetInitialReportPeriod(var FromDate, TillDate: TDateTime); external 'TourCmnl.dll';
{ check if a day of a month is valid }
function CheckMonthDay(Day, Month: Integer; Leap: Boolean): Boolean;
{ get order of fields in the date string - copied from SysUtils unit }
function GetDateOrder(const DateFormat: string): TDateOrder;
function GetFirstWorkDay(Value: TDateTime): TDateTime;

{ safe String convertors }

function SafeStrToBool(const Value: string; Excpt: Boolean): Boolean;
function SafeStrToInt(const Value: string; Excpt: Longint = 0): Longint;
function SafeStrToFloat(const Value: string; Excpt: Extended = 0): Extended;
function SafeStrToDate(const Value: string; Excpt: TDateTime): TDateTime;
function SafeStrToTime(const Value: string; Excpt: TDateTime): TDateTime;
function SafeStrToDateTime(const Value: string; Excpt: TDateTime): TDateTime;
function SafeVarToBool(V: Variant): Boolean;
function SafeVarToStr(V: Variant): string;
function SafeVarToInt(V: Variant): Integer;
function SafeVarToFloat(V: Variant): Extended;
function SafeVarToDateTime(Value: Variant): TDateTime;
function SafeVarToDateTimeFormat(Value: Variant; const aFormat: string): string;
function IsEmptyVarStr(V: Variant): Boolean;
function FormatCurrency(const Value: Currency): string;
function TimestampToStr(ts:variant):string;

{ additional String routines }

{ choose One, Two or More text in case of NumberOf value }
function CountLabelCaption(NumberOf: Integer; const One, Two, More: string): string;
{ choose One, Two or More text in case of NumberOf value }
function CountPromptCaption(NumberOf: Integer; const One, Two, More: string): string;
{ use CountLabelCaption to Number Of Days }
function DayCountString(NumberOfDays: Integer): string;
{ use CountLabelCaption to Number Of Nights }
function NightCountString(NumberOfNights: Integer): string;
{ use CountLabelCaption to Number Of Months }
function MonthCountString(NumberOfMonths: Integer): string;
{ use CountLabelCaption to Number Of Years }
function YearCountString(NumberOfYears: Integer): string;
{ choose STrue or SFalse text in case of Switch boolean value }
function ChooseCaptionString(Switch: Boolean; const STrue, SFalse: string): string;
{ indicate that SubStr exists in Str }
function PosSubString(const SubStr, Str: string): Integer;
function FoundSubString(
  const SubStr, Str: string; CaseSensitive: Boolean = False): Boolean;
{ replace #13#10 and #13 with #32 }
function DropLineBreaks(const Str: string): string;
{ replace unsupported in Unix ukrainian characters }
//function UnixFriendTransliterate(const Str: string): string;
{ extract string list from resourcestring constants set }
{$WARN UNSAFE_TYPE OFF}
procedure ResourceToStrings(Strings: TStrings; Res: array of Pointer; AddAsObject: Boolean = False);
{$WARN UNSAFE_TYPE ON}
procedure ChangeViewActionCaption(Action: TCustomAction);

{ system routines }

function GetSystemWorkArea(var WorkRect: TRect): Boolean;

{ graphic routines }

type
  TViewZoomStyle = (zmZoomCustom, zmZoomTo100, zmZoomToFit, zmZoomToWidth);

{ JPEG format properties ( quality and progress encoding ) set dialog }
function ExecuteJpegImageFormatDlg(var Quality: Integer; var ProgrEnc: Boolean): Boolean;
function JpegCopyCreate(const SrcName, DstName: String; CopyWidth, CopyHeight: Integer): Boolean;

{ System shell, file system and environment routines }

{ execute Command on document named DocName using ShellExecute function }
function ShellLaunchDocument(const DocName, Command: string): Boolean;
{ open document named DocName using ShellExecute function }
function ShellOpenDocument(const DocName: string): Boolean;
{ open program named ExeName using ShellExecute function }
function ShellOutward(const ExeName, Params, ExePath, Title: string;
  ShowCommand: Integer): Boolean;
{ open program named ExeName using ShellExecute function with ExePath = '' }
function ShellUtil(const ExeName, Params, Title: string): LongWord;
procedure ShellUtility(const ExeName, Params, Title: string);
{ call send mail window of default mail program }
function EMailSend(
  const Address, Copies, Subject, Text, Attachements: string): Boolean;
{ call default Web browser }
function WebBrowse(const WebAddress: string; const WebTitle: string = ''): Boolean;
//function FaxSendDocument();
//function PhoneDialNumber();
{ always return UNC file name, for local files too }
function GetUNCFileName(const FileName: string): string;
{ extract URL address from URL link file (with .url extension) }
function GetURLLinkAddress(const LinkFile: string): string;
{ convert local file name if FileName locates at locale host }
function GetLocalFileName(const FileName: string): string;
{ not work properly }
function FileAssociatedIcon(const FileName: string; Icon32, Icon16: TIcon): Boolean;
{ get Environment variable values }
function EnvironmentVariable(const EnvName: string): string;
function GetEnvironmentTempPath: string;
{ check if file is JPEG image (by extension) }
function FileIsJpeg(const FileName: string): Boolean;
{ get name of current user in system }
function GetCurrentUserName: string;
{ get file size in KB }
function GetFileSize(const FileName: String): Integer;
{ open connection to network shared folder }
function OpenNetworkConnection(const FolderName, UserName, Password: String): Boolean;
{ close connection to network shared folder }
function CloseNetworkConnection(const FolderName: String): Boolean;

{ make the DocStore path and the file name, create folders if need }
function GetDocStoreFolder(const StorePath: String; OrderId: Integer;
  const TypeFolder: Integer = 0): String;
function MakeDocStoreFileName(var StorePath, DocName: String; 
  OrderId: Integer; const TypeFolder: Integer = 0): Boolean;
function GetDocumentStoreFolderArhiv(const StoreFolder: string; OrderId: Integer;
  const TypeFolder: Integer = 0): string;
function MakePersonDocStoreFolder(var StorePath, DocName: String; 
  ReferId, PersonId: Integer; const TypeFolder: Integer = 0): Boolean; {...\DocStore\PersonDocs\}
function GetOrderDocumentStoreFolder(const StoreFolder: string; OrderId: Integer): string;

{ check input string with regular expression mask }
function IsValidDate(const DateStr: String): Boolean;
function IsValidTime(const TimeStr: String): Boolean;
function IsValidEmailAddress(const Address: String): Boolean;
function IsValidHttpAddress(const Address: String): Boolean;
function IsValidFtpAddress(const Address: String): Boolean;
function IsValidWebSiteAddress(const Address: String): Boolean; // 'http://' + Address
function IsValidRegularExpression(const Input, Expr: String): Boolean;


{ document processing states }

type
  TDocumentProcessingState = (
    dpsProcessNone,
    dpsReadFromScaner, dpsPrintToPrinter,
    dpsExportToWord, dpsExportToExcel,
    dpsSendToMail, dpsSendToFax,
    dpsReadFromFile, dpsSaveToFile,
    dpsShowReport,
    dpsClipboardCopy, dpsClipboardPaste);

var
  nDocumentProcessingImages: array[TDocumentProcessingState] of Integer = (
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1);


{ service browser modules filters }

const
  byNullSelect = 0;
  byDateSelect = 1;
  byTourSelect = 2;
  byOrdrSelect = 3;
  byTourDateSelect = 4;
  sSQLWhere: array[byNullSelect..byOrdrSelect] of string = (
    '(TourGroupId is null or TourGroupId = 0)',
    'FromDate >= :Par and FromDate < :Par1',
    'TourGroupId = :Par',
    'OrderId = :Par');


implementation

uses SysUtils, Variants, ShellAPI, IniFiles, Controls,
  {$IFDEF UseInputHist}
  InptHistDlg,
  {$ENDIF}
  TourConsts, DateUtils, UnitProc;

const
  sTourCmnlDLL = 'TourCmnl.dll';

{$IFDEF UseDialogs}

{$WARN UNSAFE_TYPE OFF}
function AzConfirmDlg(Handle: LongWord; Msg: PChar): Integer; external sTourCmnlDLL;
function AzConfirmDlgYC(Handle: LongWord; Msg: PChar): Boolean; external sTourCmnlDLL;
function AzConfirmDlgYN(Handle: LongWord; Msg: PChar): Boolean; external sTourCmnlDLL;
function AzConfirmFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer; external sTourCmnlDLL;
function AzConfirmFmtDlgYC(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean; external sTourCmnlDLL;
function AzConfirmFmtDlgYN(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean; external sTourCmnlDLL;
function AzErrorDlg(Handle: LongWord; Msg: PChar): Boolean; external sTourCmnlDLL;
function AzErrorFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean; external sTourCmnlDLL;
function AzErrorHlpDlg(Handle: LongWord; Msg: PChar; HlpFile: PChar; Ctx: Integer): Boolean; external sTourCmnlDLL;
function AzErrorFmtHlpDlg(Handle: LongWord; Msg: PChar; const Args: array of const; HlpFile: PChar; Ctx: Integer): Boolean; external sTourCmnlDLL;
function AzInformDlg(Handle: LongWord; Msg: PChar): Integer; external sTourCmnlDLL;
function AzInformFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer; external sTourCmnlDLL;
function AzWarningDlg(Handle: LongWord; Msg: PChar): Integer; external sTourCmnlDLL;
function AzWarningDlgY(Handle: LongWord; Msg: PChar): Boolean; external sTourCmnlDLL;
function AzWarningDlgYC(Handle: LongWord; Msg: PChar): Boolean; external sTourCmnlDLL;
function AzWarningDlgYN(Handle: LongWord; Msg: PChar): Boolean; external sTourCmnlDLL;
function AzWarnErrDlgYN(Handle: LongWord; Msg: PChar): Boolean; external sTourCmnlDLL;
function AzWarningFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer; external sTourCmnlDLL;
function AzWarningFmtDlgY(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean; external sTourCmnlDLL;
function AzWarningFmtDlgYC(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean; external sTourCmnlDLL;
function AzWarningFmtDlgYN(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean; external sTourCmnlDLL;
function AzInputDlg(Handle: LongWord; ACaption, APrompt, ADefault: PChar): PChar; external sTourCmnlDLL;
function AzInputQuery(Handle: LongWord; ACaption, APrompt: PChar; AValue: PChar): Boolean; external sTourCmnlDLL;
function AzSplashPromptForm(Handle: LongWord; ACaption, APrompt: PChar): TForm; external sTourCmnlDLL;


function ConfirmDlg(const Msg: string): Integer;
begin
  Result := AzConfirmDlg(Application.Handle, PChar(Msg));
end;

function ConfirmDlgYC(const Msg: string): Boolean;
begin
  Result := AzConfirmDlgYC(Application.Handle, PChar(Msg));
end;

function ConfirmDlgYN(const Msg: string): Boolean;
begin
  Result := AzConfirmDlgYN(Application.Handle, PChar(Msg));
end;

function ConfirmFmtDlg(const Msg: string; const Args: array of const): Integer;
begin
  Result := AzConfirmFmtDlg(Application.Handle, PChar(Msg), Args);
end;

function ConfirmFmtDlgYC(const Msg: string; const Args: array of const): Boolean;
begin
  Result := AzConfirmFmtDlgYC(Application.Handle, PChar(Msg), Args);
end;

function ConfirmFmtDlgYN(const Msg: string; const Args: array of const): Boolean;
begin
  Result := AzConfirmFmtDlgYN(Application.Handle, PChar(Msg), Args);
end;

function ErrorDlg(const Msg: string): Boolean;
begin
  Result := AzErrorDlg(Application.Handle, PChar(Msg));
end;

function ErrorFmtDlg(const Msg: string; const Args: array of const): Boolean;
begin
  Result := AzErrorFmtDlg(Application.Handle, PChar(Msg), Args);
end;

function ErrorHlpDlg(const Msg: string; Ctx: Integer): Boolean;
begin
  Result := AzErrorHlpDlg(Application.Handle, PChar(Msg), PChar(Application.HelpFile), Ctx);
end;

function ErrorFmtHlpDlg(const Msg: string; const Args: array of const; Ctx: Integer): Boolean;
begin
  Result := AzErrorFmtHlpDlg(Application.Handle, PChar(Msg), Args, PChar(Application.HelpFile), Ctx);
end;

function InformDlg(const Msg: string): Boolean;
begin
  AzInformDlg(Application.Handle, PChar(Msg));
  Result := True;
end;

function InformFmtDlg(const Msg: string; const Args: array of const): Boolean;
begin
  AzInformFmtDlg(Application.Handle, PChar(Msg), Args);
  Result := True;
end;

function WarningDlg(const Msg: string): Integer;
begin
  Result := AzWarningDlg(Application.Handle, PChar(Msg));
end;

//yura-----------------------------------------------------------------------
function WarningDlgY(const Msg: string): Boolean;
begin
  AzWarningDlgY(Application.Handle, PChar(Msg));
  Result := True;//AzWarningDlgY(Application.Handle, PChar(Msg));
end;
//---------------------------------------------------------------------------

function WarningDlgYC(const Msg: string): Boolean;
begin
  Result := AzWarningDlgYC(Application.Handle, PChar(Msg));
end;

function WarningDlgYN(const Msg: string): Boolean;
begin
  Result := AzWarningDlgYN(Application.Handle, PChar(Msg));
end;

//yura-----------------------------------------------------------------------
function WarnErrDlgYN(const Msg: string): Boolean;
begin
  Result := AzWarnErrDlgYN(Application.Handle, PChar(Msg));
end;
//---------------------------------------------------------------------------

function WarningFmtDlg(const Msg: string; const Args: array of const): Integer;
begin
  Result := AzWarningFmtDlg(Application.Handle, PChar(Msg), Args);
end;

//yura------------------------------------------------------------------------
function WarningFmtDlgY(const Msg: string; const Args: array of const): Boolean;
begin
  AzWarningFmtDlgY(Application.Handle, PChar(Msg), Args);
  Result := True;//AzWarningFmtDlgY(Application.Handle, PChar(Msg), Args);
end;
//----------------------------------------------------------------------------

function WarningFmtDlgYC(const Msg: string; const Args: array of const): Boolean;
begin
  Result := AzWarningFmtDlgYC(Application.Handle, PChar(Msg), Args);
end;

function WarningFmtDlgYN(const Msg: string; const Args: array of const): Boolean;
begin
  Result := AzWarningFmtDlgYN(Application.Handle, PChar(Msg), Args);
end;

function TrInputDlg(const ACaption, APrompt, ADefault: string): string;
begin
  Result := AzInputDlg(Application.Handle, PChar(ACaption), PChar(APrompt), PChar(ADefault));
end;

function TrInputQuery(const ACaption, APrompt: string; var AValue: string): Boolean;
begin
  Result := AzInputQuery(Application.Handle, PChar(ACaption), PChar(APrompt), PChar(AValue));
end;

function SplashPromptForm(ACaption, APrompt: string): TForm;
begin
  Result := AzSplashPromptForm(Application.Handle, PChar(ACaption), PChar(APrompt));
end;
{$WARN UNSAFE_TYPE ON}

{$ENDIF}

{$IFDEF UseInputHist}
function InputHistDlg(const ACaption, APrompt: string; var AValue: string;
  const AHistSect: string = ''): Boolean;
begin
  Result := ExecuteInputHistory(ACaption, APrompt, AValue, AHistSect);
end;
{$ENDIF}

{ check if a day of a month is valid }
function CheckMonthDay(Day, Month: Integer; Leap: Boolean): Boolean;
begin
  case Month of
    1, 3, 5, 7, 8, 10, 12: Result := Day in [1..31];
    2: Result := (Day in [1..28]) or Leap and (Day = 29);
    4, 6, 9, 11: Result := Day in [1..30];
  else Result := False;
  end;
end;

{ get order of fields in the date string }
{ copied from SysUtils unit }
function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := doMDY;
  I := 1;
  while I <= Length(DateFormat) do
  begin
    case Chr(Ord(DateFormat[I]) and $DF) of
      'E': Result := doYMD;
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := doMDY;
end;
{First work day}
function GetFirstWorkDay(Value: TDateTime): TDateTime;
begin
  Result := IncDay(Value);
  case DayOfTheWeek(Result) of
  6: Result := IncDay(Result, 2);
  7: Result := IncDay(Result);
  end;
end;
{ safe String convertors }

function SafeStrToBool(const Value: string; Excpt: Boolean): Boolean;
begin
  Result := (Value = 'True') or (Value = 'T')
    or (Value = 'Yes') or (Value = 'Y') or (Value = '1');
end;

function SafeStrToInt(const Value: string; Excpt: Longint = 0): Longint;
begin
  if IsStrANumber(Value, True) then Result := StrToInt(Value)
  else Result := Excpt;
(*  try Result := StrToInt(Value);

  except Result := Excpt;
  end;*)
end;

function SafeStrToFloat(const Value: string; Excpt: Extended): Extended;
begin
  try Result := StrToFloat(Value);
  except
    on EConvertError do Result := Excpt;
  else Result := Excpt;
  end;
end;

function SafeStrToDate(const Value: string; Excpt: TDateTime): TDateTime;
begin
  try Result := StrToDate(Value);
  except Result := Excpt;
  end;
end;

function SafeStrToTime(const Value: string; Excpt: TDateTime): TDateTime;
begin
  try Result := StrToTime(Value);
  except Result := Excpt;
  end;
end;

function SafeStrToDateTime(const Value: string; Excpt: TDateTime): TDateTime;
begin
  try Result := StrToDateTime(Value);
  except Result := Excpt;
  end;
end;

function SafeVarToBool(V: Variant): Boolean;
var S: String;
begin
  if VarIsNull(V) then Result := False
  else begin
    S := SafeVarToStr(V);
    Result := (Length(S) > 0) and (S[1] in ['T', 't', 'Y', 'y']);
  end;
end;

function SafeVarToStr(V: Variant): string;
begin
  if VarIsNull(V) then Result := '' else Result := V;
end;

function SafeVarToInt(V: Variant): Integer;
begin
  if VarIsNull(V) then Result := 0 else Result := V;
end;

function SafeVarToFloat(V: Variant): Extended;
begin
  if VarIsNull(V) then Result := 0 else Result := V;
end;

function SafeVarToDateTime(Value: Variant): TDateTime;
begin
  if VarIsNull(Value) then Result := 0 else Result := Value;
end;

function SafeVarToDateTimeFormat(Value: Variant; const aFormat: string): string;
begin
  if VarIsNull(Value) then Result := EmptyStr 
  else Result := FormatDateTime(aFormat, Value);
end;

function IsEmptyVarStr(V: Variant): Boolean;
begin
  Result := VarIsNull(V) or (V = '');
end;

function FormatCurrency(const Value: Currency): string;
begin
  Result := FormatCurr('0.00;-0.00;0', Value);
end;

function TimestampToStr(ts:variant):string;
var i:integer;
    b:byte;
    s1:string;
begin
  if varisnull(ts) then
  begin
    result:='0x0000000000000000';
    exit;
  end;
  s1:='0x';
  for i:=0 to 7 do
  begin
    b:=ts[i];
    s1:=s1+inttohex(b,2);
  end;
  result:=s1;
end;
{ additional String routines }

{$WARN UNSAFE_TYPE OFF}
function AzCountString(NumberOf: Integer; One, Two, More: PChar): PChar; external sTourCmnlDLL;
function AzDayCountString(NumberOfDays: Integer): PChar; external sTourCmnlDLL;
function AzNightCountString(NumberOfNights: Integer): PChar; external sTourCmnlDLL;
function AzMonthCountString(NumberOfMonths: Integer): PChar; external sTourCmnlDLL;
function AzYearCountString(NumberOfYears: Integer): PChar; external sTourCmnlDLL;
function AzChooseCaptionString(Switch: Boolean; STrue, SFalse: PChar): PChar; external sTourCmnlDLL;

function CountLabelCaption(NumberOf: Integer; const One, Two, More: string): string;
begin
  Result := AzCountString(NumberOf, PChar(One), PChar(Two), PChar(More));
end;

function CountPromptCaption(NumberOf: Integer; const One, Two, More: string): string;
begin
  Result := IntToStr(NumberOf) + #32 +
    AzCountString(NumberOf, PChar(One), PChar(Two), PChar(More));
end;
{$WARN UNSAFE_TYPE ON}

function DayCountString(NumberOfDays: Integer): string;
begin
  Result := AzDayCountString(NumberOfDays);
end;

function NightCountString(NumberOfNights: Integer): string;
begin
  Result := AzNightCountString(NumberOfNights);
end;

function MonthCountString(NumberOfMonths: Integer): string;
begin
  Result := AzMonthCountString(NumberOfMonths);
end;

function YearCountString(NumberOfYears: Integer): string;
begin
  Result := AzYearCountString(NumberOfYears);
end;

function ChooseCaptionString(Switch: Boolean; const STrue, SFalse: string): string;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := AzChooseCaptionString(Switch, PChar(STrue), PChar(SFalse));
{$WARN UNSAFE_TYPE ON}
end;

function PosSubString(const SubStr, Str: string): Integer;
begin
  Result := Pos(AnsiUpperCase(SubStr), AnsiUpperCase(Str));
end;

function FoundSubString(
  const SubStr, Str: string; CaseSensitive: Boolean = False): Boolean;
begin
  if CaseSensitive then Result := Pos(SubStr, Str) > 0
  else Result := PosSubString(SubStr, Str) > 0;
end;

function DropLineBreaks(const Str: string): string;
begin
  Result := StringReplace(
    StringReplace(Str, sLineBreak, #32, [rfReplaceAll]), #13, #32, [rfReplaceAll]);
end;

{ replace unsupported in Unix ukrainian characters }
function UnixFriendTransliterate(const Str: string): string;
begin
  Result := Str; // stub
    {StringReplace(
      StringReplace(
        StringReplace(
          StringReplace(
            StringReplace(
              StringReplace(
                Str, 'º', 'e', [rfReplaceAll]),
              'ª', 'E', [rfReplaceAll]),
            '¿', 'i', [rfReplaceAll]),
          '¯', 'I', [rfReplaceAll]),
        '³', 'i', [rfReplaceAll]),
      '²', 'I', [rfReplaceAll]);}
end;

{ extract string list from resourcestring constants set }
{$WARN UNSAFE_TYPE OFF}
procedure ResourceToStrings(Strings: TStrings; Res: array of Pointer; AddAsObject: Boolean = False);
var I: Integer;
begin
  if Assigned(Strings) then
    with Strings do
    begin
      Clear;
      for I := 0 to High(Res) do
        if AddAsObject then AddObject(LoadResString(Res[I]), Pointer(I))
        else Add(LoadResString(Res[I]));
    end;
end;
{$WARN UNSAFE_TYPE ON}

procedure ChangeViewActionCaption(Action: TCustomAction);
var
  S: String;
  P: Integer;
begin
  with Action do
  begin
    S := Caption;
    P := Pos(#32, S);
    if P = 0 then S := '' else S := Copy(S, P, Length(S) - P + 1);
    if Checked then S := SVDlgsActionHide + S else S := SVDlgsActionShow + S;
    Caption := S;
    Hint := S + '|' + GetLongHint(Hint);
  end;
end;

{ system routines }

function GetSystemWorkArea(var WorkRect: TRect): Boolean;
begin
  {$WARN UNSAFE_CODE OFF}
  Result := SystemParametersInfo(SPI_GETWORKAREA, 0, @WorkRect, 0);
  {$WARN UNSAFE_CODE ON}
end;

{ graphic routines }

function ExecuteJpegImageFormatDlg(
  var Quality: Integer; var ProgrEnc: Boolean): Boolean; external sTourCmnlDLL;

{$WARN UNSAFE_TYPE OFF}
procedure JpegSizedCopyCreate(
  SrcName, DstName: PChar; MaxWidth, MaxHeight: Integer); external sTourCmnlDLL;

function JpegCopyCreate(
  const SrcName, DstName: String; CopyWidth, CopyHeight: Integer): Boolean;
begin
  JpegSizedCopyCreate(PChar(SrcName), PChar(DstName), CopyWidth, CopyHeight);
  Result := FileExists(DstName);
end;
{$WARN UNSAFE_TYPE ON}

{ Shell routines }

{$WARN UNSAFE_TYPE OFF}
function AzShellOutward(Handle: LongWord;
  ExeName, Params, ExePath, Capture: PChar; ShowCommand: Integer): Boolean; external sTourCmnlDLL;
function AzShellUtil(Handle: LongWord;
  ExeName, Params, Capture: PChar; ShowCommand: Integer): LongWord; external sTourCmnlDLL;
function AzEMailSend(Handle: LongWord;
  Address, Copies, Subject, Text, Attachements: PChar): Boolean; external sTourCmnlDLL;
function AzWebBrowse(Handle: LongWord; WebAddress: PChar): Boolean; external sTourCmnlDLL;
{$WARN UNSAFE_TYPE ON}

function GetUtilityFileName(const Utility: string): string;
begin
  Result := Utility + '.EXE';
end;

function ShellLaunchDocument(const DocName, Command: string): Boolean;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := ShellExecute(Application.Handle, PChar(Command), PChar(DocName), '', '', SW_NORMAL) > 32;
{$WARN UNSAFE_TYPE ON}
{$IFDEF UseDialogs}
  if not Result then ErrorFmtDlg('Error: %s'#13'"%s"', [Command, DocName]);
    //ErrorFmtDlg(SVDlgsShellExecuteFatal, [DocName]);
{$ENDIF}
end;

function ShellOpenDocument(const DocName: string): Boolean;
begin
  Result := ShellOutward(DocName, '', '', '', SW_NORMAL);
end;

function ShellOutward(const ExeName, Params, ExePath, Title: string;
  ShowCommand: Integer): Boolean;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := AzShellOutward(Application.Handle, PChar(ExeName), PChar(Params),
    PChar(ExePath), PChar(Title), ShowCommand);
{$WARN UNSAFE_TYPE ON}
end;

function ShellUtil(const ExeName, Params, Title: string): LongWord;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := AzShellUtil(Application.Handle,
    PChar(ExeName), PChar(Params), PChar(Title), SW_SHOWNORMAL);
{$WARN UNSAFE_TYPE ON}
end;

procedure ShellUtility(const ExeName, Params, Title: string);
begin
  ShellOutward(GetUtilityFileName(ExeName), Params,
    ExtractFilePath(Application.ExeName), Title, SW_SHOWNORMAL);
end;

function EMailSend(const Address, Copies, Subject, Text, Attachements: string): Boolean;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := AzEMailSend(Application.Handle, PChar(Address), PChar(Copies),
    PChar(Subject), PChar(Text), PChar(Attachements));
{$WARN UNSAFE_TYPE ON}
end;

function WebBrowse(const WebAddress: string; const WebTitle: string = ''): Boolean;
var Addr: string;
begin
  if Pos('://', WebAddress) = 0 then Addr := 'http://' + WebAddress
    else Addr := WebAddress;
  {$WARN UNSAFE_TYPE OFF}
  Result := AzWebBrowse(Application.Handle, PChar(Addr));
  {$WARN UNSAFE_TYPE ON}
end;

function GetUNCFileName(const FileName: string): string;
var
  Comp: array[0..255] of Char;
  N: Cardinal;
begin
  Result := ExpandUNCFileName(FileName);
  if (Length(Result) > 1) and (Result[2] = ':') then // local file name
  begin
    GetComputerName(Comp, N);
    System.Delete(Result, 2, 1);
    Result := '\\' + Comp + '\' + Result;
  end;
end;

function GetURLLinkAddress(const LinkFile: string): string;
begin
  with TIniFile.Create(LinkFile) do
  try
    Result := ReadString('InternetShortcut', 'URL', '');
  finally
    Free;
  end;
end;

function GetLocalFileName(const FileName: string): string;
var
  Comp: array[0..255] of Char;
  SComp: string;
  N: Cardinal;
begin
  Result := FileName;
//  Result := ExpandUNCFileName(FileName);
  if (Length(Result) > 1) and (Result[2] <> ':') // UNC file name
    and GetComputerName(Comp, N)
    then begin
    SComp := AnsiUpperCase(Comp);
    if AnsiUpperCase(Copy(Result, 3, N)) = SComp then
    begin // file allocate on locale computer
      System.Delete(Result, 1, N + 3);
      Result := Result[1] + ':' + Copy(Result, 2, Length(Result));
    end;
  end;
end;

function FileAssociatedIcon(const FileName: string; Icon32, Icon16: TIcon): Boolean;
var
  FN: array[0..255] of Char;
  Icn, I16, I32: HICON;
  I: Word;
begin
  FillChar(FN, SizeOf(FN), 0);
{$WARN UNSAFE_TYPE OFF}
  StrCopy(FN, PChar(FileName));
{$WARN UNSAFE_TYPE ON}
  Icn := ExtractAssociatedIcon(Application.Handle, FN, I);
  if Icn > 1 then
    Icn := ExtractIconEx(FN, I, I32, I16, 2);
  Result := Icn > 1;
  if Result then
  begin
    if Assigned(Icon32) then Icon32.Handle := I32;
    if Assigned(Icon16) then Icon16.Handle := I16;
  end;
{var
  FileInfo: TSHFileInfo;
  Flags: Integer;
begin
  Flags := SHGFI_PIDL or SHGFI_SYSICONINDEX;
  if Assigned(Icon32) then Flags := Flags or SHGFI_LARGEICON
  else Flags := Flags or SHGFI_SMALLICON;
  SHGetFileInfo(PChar(FileName),
                0,
                FileInfo,
                SizeOf(FileInfo),
                Flags);
  Result := True;
    if Assigned(Icon32) then Icon32.Handle := FileInfo.HIcon;
    if Assigned(Icon16) then Icon16.Handle := FileInfo.HIcon;}
end;

function EnvironmentVariable(const EnvName: string): string;
begin
  Result := GetEnvironmentVariable(EnvName);
end;

function GetEnvironmentTempPath: string;
begin
  Result := GetEnvironmentVariable('TMP');
  if Result = '' then Result := GetEnvironmentVariable('TEMP');
  if Result = '' then Result := GetCurrentDir;
  Result := IncludeTrailingPathDelimiter(Result);
end;

function FileIsJpeg(const FileName: string): Boolean;
var Ext: string;
begin
  Ext := AnsiLowerCase(ExtractFileExt(FileName));
  Result := (Ext = '.jpg') or (Ext = '.jpeg');
end;

function GetCurrentUserName: string;
var
  PNme: array[0..127] of Char;
  Size: DWord;
begin
  Size := SizeOf(PNme);
  GetUserName(PNme, Size);
  Result := PNme;
end;

{ get file size in KB }
function GetFileSize(const FileName: String): Integer;
var
  FindHndl: THandle;
  FileData: TWIN32FindData;
begin
{$WARN UNSAFE_TYPE OFF}
  FindHndl := FindFirstFile(PChar(FileName), FileData);
{$WARN UNSAFE_TYPE ON}
  if FindHndl = INVALID_HANDLE_VALUE then Result := 0
  else with FileData do Result := nFileSizeHigh shl 16 or nFileSizeLow shr 10;
  Windows.FindClose(FindHndl);
end;

{ open connection to network shared folder }

function OpenNetworkConnection(const FolderName, UserName, Password: String): Boolean;
var
  NetResource: TNetResource;
  ErrorCode: Cardinal;
begin
  {$WARN UNSAFE_TYPE OFF}
  with NetResource do
  begin
    dwType := RESOURCETYPE_DISK;
    lpLocalName := '';
    lpRemoteName := PChar(FolderName);
    lpProvider := '';
  end;
  Result :=
    WNetAddConnection2(NetResource, PChar(Password), PChar(UserName), 0) <> NO_ERROR;
  {$WARN UNSAFE_TYPE ON}
  if not Result then
  begin
    ErrorCode := GetLastError;
    Result := ErrorCode = ERROR_IO_PENDING;
    if not Result then
      ErrorFmtDlg(SHtlImgDlgErrorImageFolderAccess , [ErrorCode]);
  end;
end;

{ close connection to network shared folder }

function CloseNetworkConnection(const FolderName: String): Boolean;
begin
  {$WARN UNSAFE_TYPE OFF}
  Result := WNetCancelConnection2(PChar(FolderName), 0, False) <> NO_ERROR;
  {$WARN UNSAFE_TYPE ON}
  //if not Result then ErrorFmtDlg('Error user logoff: %d' , [GetLastError]);
end;

{ make the DocStore path and the file name, create folders if need }

function GetDocStoreFolder(const StorePath: String; OrderId: Integer;
  const TypeFolder: Integer = 0): String;
const
  sFldrDocs = 'DocStore';
  sFldr: array[0..7] of string = ('Orders', 'Groups', 'VisaDocs', 'PartnersDocs', 
    'Trips', 'PersVisaDocs', 'Contracts', 'PersonDocs');
var RefOrd: Boolean;
begin
  RefOrd := OrderId > 0;
  Result := IncludeTrailingPathDelimiter(
    IncludeTrailingPathDelimiter(StorePath) + sFldrDocs);
  if RefOrd then
    Result := IncludeTrailingPathDelimiter(
      IncludeTrailingPathDelimiter(Result + sFldr[TypeFolder]{sFldrOrdr}) + IntToStr(OrderId));
end;


function MakeDocStoreFileName(var StorePath, DocName: String; 
  OrderId: Integer; const TypeFolder: Integer = 0): Boolean;
const
  sMailExt = '.eml';
  sTimeMrk = 'yyyy-mm-dd hh-nn-ss ';
  {sFldrDocs = 'DocStore';
  sFldrOrdr = 'Orders';}
var
  Fldr: String;
  RefOrd: Boolean;
begin
  RefOrd := OrderId > 0;
  Fldr := GetDocStoreFolder(StorePath, OrderId, TypeFolder);
  Result := (Fldr <> '') and (DirectoryExists(Fldr) or ForceDirectories(Fldr))
    {temporary stub->} and RefOrd {<-temporary stub};
  if Result then
  begin
    StorePath := Fldr;
    DocName := FormatDateTime(sTimeMrk, Now) +
      StringReplace(
        StringReplace(
          StringReplace(DocName, '"', '_', [rfReplaceAll]), 
            '.', '_', [rfReplaceAll]),
              ':', '_', [rfReplaceAll]);
    DocName := DocName + sMailExt;
  end;
end;

function GetDocumentStoreFolderArhiv(const StoreFolder: string; OrderId: Integer;
  const TypeFolder: Integer = 0): string;
const sArhiv = ' (Àðõ³â)';
var SFolter: string;
begin
  SFolter := StoreFolder + sArhiv;
  Result := GetDocStoreFolder(SFolter, OrderId, TypeFolder);
end;

function GetOrderDocumentStoreFolder(const StoreFolder: string; OrderId: Integer): string;
begin
  Result := GetDocumentStoreFolderArhiv(StoreFolder, OrderId);
  if (Result = EmptyStr) or not DirectoryExists(Result)
  then Result := GetDocStoreFolder(StoreFolder, OrderId);
  if not DirectoryExists(Result)
    and ConfirmDlgYN(SOrderFrmConfirmForceDocumentFolder)
  then ForceDirectories(Result);
end;

function MakePersonDocStoreFolder(var StorePath, DocName: String; 
  ReferId, PersonId: Integer; const TypeFolder: Integer = 0): Boolean;
begin
  MakeDocStoreFileName(StorePath, DocName, ReferId, TypeFolder);
  StringReplace(StorePath, DocName, EmptyStr, [rfReplaceAll]);
  StorePath := StorePath + IntToStr(PersonId) + PathDelim;
  ForceDirectories(StorePath);
  StorePath := StorePath + DocName;
  Result := StorePath <> EmptyStr;  
end;
{ check input string with regular expression mask }

{$WARN UNSAFE_TYPE OFF}
function AzCheckEmailAddress(Address: PChar): Boolean; external sTourCmnlDLL;
function AzCheckHttpAddress(Address: PChar): Boolean; external sTourCmnlDLL;
function AzCheckFtpAddress(Address: PChar): Boolean; external sTourCmnlDLL;
function AzCheckRegularExpression(Input, Expr: PChar): Boolean; external sTourCmnlDLL;
{$WARN UNSAFE_TYPE ON}

function IsValidEmailAddress(const Address: String): Boolean;
begin
  {$WARN UNSAFE_TYPE OFF}
  Result := AzCheckEmailAddress(PChar(Trim(Address)));
  {$WARN UNSAFE_TYPE ON}
end;

function IsValidHttpAddress(const Address: String): Boolean;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := AzCheckHttpAddress(PChar(Trim(Address)));
{$WARN UNSAFE_TYPE ON}
end;

function IsValidFtpAddress(const Address: String): Boolean;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := AzCheckFtpAddress(PChar(Trim(Address)));
{$WARN UNSAFE_TYPE ON}
end;

function IsValidWebSiteAddress(const Address: String): Boolean;
begin
  Result := IsValidHttpAddress('http://' + Address);
end;

function IsValidRegularExpression(const Input, Expr: String): Boolean;
begin
{$WARN UNSAFE_TYPE OFF}
  Result := AzCheckRegularExpression(PChar(Trim(Input)), PChar(Expr));
{$WARN UNSAFE_TYPE ON}
end;

function IsValidDate(const DateStr: String): Boolean;
begin
  Result := True;
  try
    StrToDate(DateStr);
  except
    Result := False;
  end;
end;

function IsValidTime(const TimeStr: String): Boolean;
begin
  Result := True;
  try
    StrToTime(TimeStr);
  except
    Result := False;
  end;
end;

end.
