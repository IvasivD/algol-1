unit TourStrMag;

interface

{ string input magic routines }

{ string conversation: ALL Words Except 'i' Begin from LaRGe ChaRacter }
function CapitalName(const Name: string): string;
{ string conversation: All Words Except 'i' Begin from Large Character }
function CapitalBegin(const Name: string): string;

function CapitalBeginSynb(const Name: string): string;
{ string conversation: String look as sentence}
function Sentence(const Name: string): string;
{ string conversation: write ukrainian text by english characters }
function UkraineToEnglish(const Ukr: string): string;
{}
function EncodeSubj(instr:string):string;
function TwiceEncodeSubj(instr:string):string;
{ �������� ����������� ����� (������� ����� � �����) }
function CheckNameGrammar(const Txt: string): Boolean;
{ ��������� ��� ������ }
function StringWithoutSpace(const Txt: string): string;
{ ��������� ��� ������ }
function StringWithoutHiphen(const Txt: string): string;
{ ��������� ��� �������� ����� }
function StringWithoutCRLF(const Txt: string): string;
{ ����������� �� ���������� � ������ ����������� ���������� }
function StringDecimalCorrect(const Txt: string): string;
{ phone number formatting }
function FormatPhoneNumber(const PhoneNo: String): String;

function MoneyAsString(Money: Currency; const CurrName: String = ''): string;
function NumberAsString(Number: Integer; IncNum: Boolean = False): string;

function ExtractFirstCompanyName(const CompanyName: string): string;

function SymbolEntersCount(s: string; ch: char): integer;
function CreateErrMessage(const aMessage, FieldName: string): string;

{ keyboard charset emulation routines }

{ emulate ukrainian keyboard locale }
function EmulateCyrylicCharset(Key: Char): Char;
{ emulate ukrainian keyboard locale with large characters }
function EmulateCyrylicUpperCharset(Key: Char): Char;
{ emulate english keyboard locale }
function EmulateEnglishCharset(Key: Char): Char;
{ emulate english keyboard locale with large characters }
function EmulateEnglishUpperCharset(Key: Char): Char;
{ aplly EmulateEnglishCharset function to all characters in string }
function CyrString(const Value: string): string;
{ aplly EmulateCyrylicCharset function to all characters in string }
function LatString(const Value: string): string;
{ aplly EmulateRussianCharset function to all characters in string }
function RusString(const Value: string): string;
{ generate random string }
function RandString(MinLen, MaxLen: Integer): string;
{ generate random string }
function RandOlnyNumb(MinLen, MaxLen: Integer): string;

{ keyboard entering checking }

const
  AddressLiteral: set of Char = [#32, '-', '�'..'�', '�', '�', '�', '�', '�', '�', '''', '0'..'9', '/', '.', #8, #13];
  CyrNameLiteral: set of Char = [#32, '-', '�'..'�', '�', '�', '�', '�', '�', '�', '''', #8, #13];
  LatNameLiteral: set of Char = [#32, '-', 'A'..'Z', 'a'..'z', '''', #8, #13];
  PasportLiteral: set of Char = [#32, '-', '0'..'9', 'A'..'Z', '�'..'�', '�', '�', '�', '�', #8, #13];
  EmailLiteral: set of Char = ['0'..'9', '.', '@', '_', '-', 'A'..'Z', 'a'..'z', #8];
  URLAddrLiteral: set of Char = ['A'..'Z', 'a'..'z', '0'..'9', '~', '-', '_', '.', ';', '/', '?', ':', '@', '=', '&', '#', #8];
  PhoneNoLiteral: set of Char = ['0'..'9', {#32,} #8]; {',', 'W', 'P', '-', '(', ')', '+', }
  IdentLiteral: set of Char = ['A'..'Z', '0'..'9', #8, #13];
  SwiftLiteral: set of Char = ['A'..'Z', '0'..'9', #32, #8, #13];
  DigitalLiteral: set of Char = ['0'..'9', #8, #13];
  ABCLiteral: set of Char = ['A'..'Z', 'a'..'z', '�'..'�', '�'..'�', '�', '�', '�', '�', '�', '�', ''''];

function NumberKeyPressCheck(const Check: string; Key: Char): Char;


implementation

uses SysUtils, Math, TourConsts, TourCmnlIf, IdCoderMIME, IdHashMessageDigest;

function AnsiUpperChar(Chr: Char): Char;
var S: string;
begin
  S := AnsiUpperCase(Chr);
  Result := S[1];
end;

{ string input magic routines }

function CapitalName(const Name: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Name) do
    if (I = 1) or (Name[I - 1] = '-') or (Name[I - 1] = '/') or
      (Name[I - 1] = #32) and not (
        (Name[I] in ['�', '�', '�', '�', '�'])
        and (I < Length(Name)) and (Name[I + 1] = #32))
    then Result := Result + AnsiUpperCase(Name[I])
    else Result := Result + Name[I];
end;

function CapitalBegin(const Name: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Name) do
    if (I = 1) or (Name[I - 1] = '-') or
      (Name[I - 1] = #32) and not ((Name[I] = '�') and (I < Length(Name)) and (Name[I + 1] = #32))
    then Result := Result + AnsiUpperCase(Name[I])
    else Result := Result + AnsiLowerCase(Name[I]);
end;

function CapitalBeginSynb(const Name: string): string;
var I: Integer;
begin
  Result := EmptyStr;                 
  for I := 1 to Length(Name) do
    if I = 1 then Result := Result + AnsiUpperCase(Name[I])
    else Result := Result + Name[I];//AnsiLowerCase(Name[I]);
end;

function Sentence(const Name: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Name) do
    if (I = 1) or (I > 1) and (Name[Pred(I)] = '.') then
      Result := Result + AnsiUpperCase(Name[I]) else Result := Result + Name[I];
end;

function UkrCharToEngChar(Chr: Char): string;
begin
  case Chr of
    '�': Result := 'a';
    '�': Result := 'b';
    '�': Result := 'v';
    '�': Result := 'h';
    '�': Result := 'd';
    '�': Result := 'e';
    '�': Result := 'ye';
    '�': Result := 'zh';
    '�': Result := 'z';
    '�': Result := 'y';
    '�': Result := 'i';
    '�': Result := 'i';
    '�': Result := 'y';
    '�': Result := 'k';
    '�': Result := 'l';
    '�': Result := 'm';
    '�': Result := 'n';
    '�': Result := 'o';
    '�': Result := 'p';
    '�': Result := 'r';
    '�': Result := 's';
    '�': Result := 't';
    '�': Result := 'u';
    '�': Result := 'f';
    '�': Result := 'kh';
    '�': Result := 'ts';
    '�': Result := 'ch';
    '�': Result := 'sh';
    '�': Result := 'shch';
    '�': Result := 'yu';
    '�': Result := 'ya';
    '�': Result := 'A';
    '�': Result := 'B';
    '�': Result := 'V';
    '�': Result := 'H';
    '�': Result := 'D';
    '�': Result := 'E';
    '�': Result := 'Ye';
    '�': Result := 'Zh';
    '�': Result := 'Z';
    '�': Result := 'Y';
    '�': Result := 'I';
    '�': Result := 'I';
    '�': Result := 'Y';
    '�': Result := 'K';
    '�': Result := 'L';
    '�': Result := 'M';
    '�': Result := 'N';
    '�': Result := 'O';
    '�': Result := 'P';
    '�': Result := 'R';
    '�': Result := 'S';
    '�': Result := 'T';
    '�': Result := 'U';
    '�': Result := 'F';
    '�': Result := 'Kh';
    '�': Result := 'Ts';
    '�': Result := 'Ch';
    '�': Result := 'Sh';
    '�': Result := 'Shch';
    '�': Result := 'Yu';
    '�': Result := 'Ya';
    '�': Result := 'e';
    '�': Result := 'y';
    '�': Result := 'E';
    '�': Result := 'Y';
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

function EncodeSubj(instr:string):string;
var
  IdEncoderMIME: TIdEncoderMIME;
begin
  IdEncoderMIME := TIdEncoderMIME.Create(nil);
  Result := '=?'+'Windows-1251'+'?B?'+IdEncoderMIME.Encode(instr)+'?=';
  IdEncoderMIME.Free;
end;

function TwiceEncodeSubj(instr:string):string;
var
  IdEncoderMIME: TIdEncoderMIME;
begin
  IdEncoderMIME := TIdEncoderMIME.Create(nil);
  Result := IdEncoderMIME.Encode(RandString(4,4) + IdEncoderMIME.Encode(RandOlnyNumb(10, 10) + 
    instr + RandOlnyNumb(10, 10)));
  IdEncoderMIME.Free;
end;

function CheckNameGrammar(const Txt: string): Boolean;
var InvertedCommas, OpenParentheses, CloseParentheses, I: Integer;
begin
  InvertedCommas := 0;
  OpenParentheses := 0;
  CloseParentheses := 0;
  for I := 1 to Length(Txt) do
    case Txt[I] of
      '"': Inc(InvertedCommas);
      '(': Inc(OpenParentheses);
      ')': Inc(CloseParentheses);
    end;
  Result := not Odd(InvertedCommas) and (OpenParentheses = CloseParentheses);
end;

function StringWithoutSpace(const Txt: string): string;
begin
  Result := StringReplace(Trim(Txt), #32, '', [rfReplaceAll]);
end;

function StringWithoutHiphen(const Txt: string): string;
begin
  Result := StringReplace(Trim(Txt), '-', '', [rfReplaceAll]);
end;

function StringWithoutCRLF(const Txt: string): string;
begin
  Result := Trim(
    StringReplace(
      StringReplace(
        StringReplace(
          StringReplace(Txt, #10#13, #32, [rfReplaceAll]),
          #13#10, #32, [rfReplaceAll]),
        #10, #32, [rfReplaceAll]),
      #13, #32, [rfReplaceAll]));
end;

function StringDecimalCorrect(const Txt: string): string;
begin
  Result := StringReplace(
    StringReplace(Txt, ',', DecimalSeparator, []), '.', DecimalSeparator, []);
end;

function FormatPhoneNumber(const PhoneNo: String): String;
begin
  Result := Trim(PhoneNo);
  if Result <> '' then
  begin
    Result := StringReplace(Result, '-', #32, [rfReplaceAll]);
    if Pos('810', Result) = 1 then Result := Copy(Result, 4, Length(Result))
    else if Pos('8 10', Result) = 1 then Result := Copy(Result, 5, Length(Result))
    else if Pos('8', Result) = 1 then Result := Copy(Result, 2, Length(Result));
  end;
end;

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
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
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}

function MoneyAsString(Money: Currency; const CurrName: String = ''): string;
var
  Coins, Notes: Integer;
  CurrN: String;
begin
  Notes := Trunc(Int(Money));
  Coins := Round(Frac(Money) * 100);
  if (CurrName = '') or (CurrName = 'UAH') then CurrN := SPayDlgUAH else CurrN := CurrName;
  Result := Trim(Format('%s %s %2.2d %s',
    [NumberAsString(Notes), CurrN, Coins, SPayDlgCoins]));
end;

function NumberAsString(Number: Integer; IncNum: Boolean = False): string;
var
  M, N, T, H, D: Integer;
  SM, ST, SH, SD: string;
begin
  M := Number div 1000;
  if M = 0 then SM := ''
  else SM := NumberAsString(M) + #32 +
    CountLabelCaption(M, SVDlgsMoneyM1, SVDlgsMoneyM2, SVDlgsMoneyM3);
  N := Number mod 1000;
  T := N div 100;
  H := N mod 100;
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
  Result := Trim(Format('%s %s %s %s', [SM, ST, SH, SD]));
  if IncNum then Result := Format('%d (%s)', [Number, Result]);
end;

{ }

function ExtractFirstCompanyName(const CompanyName: string): string;
var P: Integer;
begin
  P := Pos('/', CompanyName);
  if P = 0 then Result := CompanyName
  else Result := Trim(Copy(CompanyName, 1, Pred(P)));
end;

{ keyboard charset emulation routines }

function EmulateCyrylicCharset(Key: Char): Char;
begin
  case Key of
    'A': Result := '�';
    'B': Result := '�';
    'C': Result := '�';
    'D': Result := '�';
    'E': Result := '�';
    'F': Result := '�';
    'G': Result := '�';
    'H': Result := '�';
    'I': Result := '�';
    'J': Result := '�';
    'K': Result := '�';
    'L': Result := '�';
    'M': Result := '�';
    'N': Result := '�';
    'O': Result := '�';
    'P': Result := '�';
    'Q': Result := '�';
    'R': Result := '�';
    'S': Result := '�';
    'T': Result := '�';
    'U': Result := '�';
    'V': Result := '�';
    'W': Result := '�';
    'X': Result := '�';
    'Y': Result := '�';
    'Z': Result := '�';
    'a': Result := '�';
    'b': Result := '�';
    'c': Result := '�';
    'd': Result := '�';
    'e': Result := '�';
    'f': Result := '�';
    'g': Result := '�';
    'h': Result := '�';
    'i': Result := '�';
    'j': Result := '�';
    'k': Result := '�';
    'l': Result := '�';
    'm': Result := '�';
    'n': Result := '�';
    'o': Result := '�';
    'p': Result := '�';
    'q': Result := '�';
    'r': Result := '�';
    's': Result := '�';
    't': Result := '�';
    'u': Result := '�';
    'v': Result := '�';
    'w': Result := '�';
    'x': Result := '�';
    'y': Result := '�';
    'z': Result := '�';
    '`', '~', '�', '�': Result := '''';
    else Result := Key;
  end;
end;

function EmulateCyrylicUpperCharset(Key: Char): Char;
begin
  case Key of
    'A', 'a': Result := '�';
    'B', 'b': Result := '�';
    'C', 'c': Result := '�';
    'D', 'd': Result := '�';
    'E', 'e': Result := '�';
    'F', 'f': Result := '�';
    'G', 'g': Result := '�';
    'H', 'h': Result := '�';
    'I', 'i': Result := '�';
    'J', 'j': Result := '�';
    'K', 'k': Result := '�';
    'L', 'l': Result := '�';
    'M', 'm': Result := '�';
    'N', 'n': Result := '�';
    'O', 'o': Result := '�';
    'P', 'p': Result := '�';
    'Q', 'q': Result := '�';
    'R', 'r': Result := '�';
    'S', 's': Result := '�';
    'T', 't': Result := '�';
    'U', 'u': Result := '�';
    'V', 'v': Result := '�';
    'W', 'w': Result := '�';
    'X', 'x': Result := '�';
    'Y', 'y': Result := '�';
    'Z', 'z': Result := '�';
    '`', '~', '�', '�': Result := '''';
    else Result := AnsiUpperChar(Key);
  end;
end;

function EmulateEnglishCharset(Key: Char): Char;
begin
  case Key of
    '�': Result := 'F';
    '�': Result := 'D';
    '�': Result := 'U';
    '�': Result := 'L';
    '�': Result := 'T';
    '�': Result := 'P';
    '�': Result := 'B';
    '�', '�': Result := 'S';
    '�': Result := 'Q';
    '�': Result := 'R';
    '�': Result := 'K';
    '�': Result := 'V';
    '�': Result := 'Y';
    '�': Result := 'J';
    '�': Result := 'G';
    '�': Result := 'H';
    '�': Result := 'C';
    '�': Result := 'N';
    '�': Result := 'E';
    '�': Result := 'A';
    '�': Result := 'W';
    '�': Result := 'X';
    '�': Result := 'I';
    '�': Result := 'O';
    '�': Result := 'Z';
    '�': Result := 'M';
    '�': Result := 'f';
    '�': Result := 'd';
    '�': Result := 'u';
    '�': Result := 'l';
    '�': Result := 't';
    '�': Result := 'p';
    '�': Result := 'b';
    '�', '�': Result := 's';
    '�': Result := 'q';
    '�': Result := 'r';
    '�': Result := 'k';
    '�': Result := 'v';
    '�': Result := 'y';
    '�': Result := 'j';
    '�': Result := 'g';
    '�': Result := 'h';
    '�': Result := 'c';
    '�': Result := 'n';
    '�': Result := 'e';
    '�': Result := 'a';
    '�': Result := 'w';
    '�': Result := 'x';
    '�': Result := 'i';
    '�': Result := 'o';
    '�': Result := 'z';
    '�': Result := 'm';
    '�': Result := '`';
    '�': Result := '[';
    '�', '�': Result := ']';
    '�': Result := ';';
    '�', '�': Result := '''';
    '�': Result := ',';
    '�': Result := '.';
    '�': Result := '~';
    '�': Result := '{';
    '�', '�': Result := '}';
    '�': Result := ':';
    '�', '�': Result := '"';
    '�': Result := '<';
    '�': Result := '>';
    else Result := Key;
  end;
end;

function EmulateRussianCharset(Key: Char): Char;
begin
  case Key of
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    '�': Result := '�';
    else Result := Key;
  end;
end;

function EmulateEnglishUpperCharset(Key: Char): Char;
begin
  case Key of
    '�', '�': Result := 'F';
    '�', '�': Result := 'D';
    '�', '�': Result := 'U';
    '�', '�': Result := 'L';
    '�', '�': Result := 'T';
    '�', '�': Result := 'P';
    '�', '�': Result := 'B';
    '�', '�', '�', '�': Result := 'S';
    '�', '�': Result := 'Q';
    '�', '�': Result := 'R';
    '�', '�': Result := 'K';
    '�', '�': Result := 'V';
    '�', '�': Result := 'Y';
    '�', '�': Result := 'J';
    '�', '�': Result := 'G';
    '�', '�': Result := 'H';
    '�', '�': Result := 'C';
    '�', '�': Result := 'N';
    '�', '�': Result := 'E';
    '�', '�': Result := 'A';
    '�', '�': Result := 'W';
    '�', '�': Result := 'X';
    '�', '�': Result := 'I';
    '�', '�': Result := 'O';
    '�', '�': Result := 'Z';
    '�', '�': Result := 'M';
    else Result := AnsiUpperChar(Key);
  end;
end;

function CyrString(const Value: string): string;
var I: Integer;
begin
  Result := '';
  for I := 1 to Length(Value) do
    Result := Result + EmulateCyrylicCharset(Value[I]);
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

function RandString(MinLen, MaxLen: Integer): string;
const S = 'MNBVCXZASDFGHJKLPOIUYTREWQmnbvcxzasdfghjklpoiuytrewq1234567890-_';
var Len, N, I: Integer;
begin
  Result := '';
  N := Length(S);
  Randomize;
  Len := RandomRange(MinLen, MaxLen);
  for I := 1 to Len do Result := Result + S[RandomRange(1, N)];
end;

function RandOlnyNumb(MinLen, MaxLen: Integer): string;
const S = '1234567890';
var Len, N, I: Integer;
begin
  Result := '';
  N := Length(S);
  Randomize;
  Len := RandomRange(MinLen, MaxLen);
  for I := 1 to Len do Result := Result + S[RandomRange(1, N)];
end;

{ keyboard entering checking }

function NumberKeyPressCheck(const Check: string; Key: Char): Char;
var CanTypeDecimal: Boolean;
begin
  CanTypeDecimal := Pos(DecimalSeparator, Check) = 0;
  case Key of
    '-', '0'..'9', #8, #13: Result := Key;
    '.', ',':
      if CanTypeDecimal then Result := DecimalSeparator else Result := #0;
    else Result := #0;
  end;
end;

function SymbolEntersCount(s: string; ch: char): integer;
var
  i: integer;
begin
  Result := 0;
  if Trim(s) <> '' then
    for i := 1 to Length(s) do
      if s[i] = ch then
        inc(Result);
end;

function CreateErrMessage(const aMessage, FieldName: string): string;
begin
  if aMessage = EmptyStr then Result := SZTDlgErrFieldsIsNull + FieldName
  else Result := aMessage + #13 + FieldName;  
end;

end.
