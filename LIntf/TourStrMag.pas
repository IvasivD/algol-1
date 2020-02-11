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
{ перевірка правильності назви (парність лапок і дужок) }
function CheckNameGrammar(const Txt: string): Boolean;
{ видаляння всіх пробілів }
function StringWithoutSpace(const Txt: string): string;
{ видаляння всіх дефісів }
function StringWithoutHiphen(const Txt: string): string;
{ видаляння всіх переводів рядка }
function StringWithoutCRLF(const Txt: string): string;
{ конвертація до прийнятого в системі десяткового роздільника }
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
  AddressLiteral: set of Char = [#32, '-', 'А'..'я', 'є', 'Є', 'ї', 'Ї', 'і', 'І', '''', '0'..'9', '/', '.', #8, #13];
  CyrNameLiteral: set of Char = [#32, '-', 'А'..'я', 'є', 'Є', 'ї', 'Ї', 'і', 'І', '''', #8, #13];
  LatNameLiteral: set of Char = [#32, '-', 'A'..'Z', 'a'..'z', '''', #8, #13];
  PasportLiteral: set of Char = [#32, '-', '0'..'9', 'A'..'Z', 'А'..'Я', 'Є', 'Ї', 'І', '№', #8, #13];
  EmailLiteral: set of Char = ['0'..'9', '.', '@', '_', '-', 'A'..'Z', 'a'..'z', #8];
  URLAddrLiteral: set of Char = ['A'..'Z', 'a'..'z', '0'..'9', '~', '-', '_', '.', ';', '/', '?', ':', '@', '=', '&', '#', #8];
  PhoneNoLiteral: set of Char = ['0'..'9', {#32,} #8]; {',', 'W', 'P', '-', '(', ')', '+', }
  IdentLiteral: set of Char = ['A'..'Z', '0'..'9', #8, #13];
  SwiftLiteral: set of Char = ['A'..'Z', '0'..'9', #32, #8, #13];
  DigitalLiteral: set of Char = ['0'..'9', #8, #13];
  ABCLiteral: set of Char = ['A'..'Z', 'a'..'z', 'А'..'Я', 'а'..'я', 'є', 'Є', 'ї', 'Ї', 'і', 'І', ''''];

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
        (Name[I] in ['і', 'в', 'у', 'з', 'й'])
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
      (Name[I - 1] = #32) and not ((Name[I] = 'і') and (I < Length(Name)) and (Name[I + 1] = #32))
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
    'а': Result := 'a';
    'б': Result := 'b';
    'в': Result := 'v';
    'г': Result := 'h';
    'д': Result := 'd';
    'е': Result := 'e';
    'є': Result := 'ye';
    'ж': Result := 'zh';
    'з': Result := 'z';
    'и': Result := 'y';
    'і': Result := 'i';
    'ї': Result := 'i';
    'й': Result := 'y';
    'к': Result := 'k';
    'л': Result := 'l';
    'м': Result := 'm';
    'н': Result := 'n';
    'о': Result := 'o';
    'п': Result := 'p';
    'р': Result := 'r';
    'с': Result := 's';
    'т': Result := 't';
    'у': Result := 'u';
    'ф': Result := 'f';
    'х': Result := 'kh';
    'ц': Result := 'ts';
    'ч': Result := 'ch';
    'ш': Result := 'sh';
    'щ': Result := 'shch';
    'ю': Result := 'yu';
    'я': Result := 'ya';
    'А': Result := 'A';
    'Б': Result := 'B';
    'В': Result := 'V';
    'Г': Result := 'H';
    'Д': Result := 'D';
    'Е': Result := 'E';
    'Є': Result := 'Ye';
    'Ж': Result := 'Zh';
    'З': Result := 'Z';
    'И': Result := 'Y';
    'І': Result := 'I';
    'Ї': Result := 'I';
    'Й': Result := 'Y';
    'К': Result := 'K';
    'Л': Result := 'L';
    'М': Result := 'M';
    'Н': Result := 'N';
    'О': Result := 'O';
    'П': Result := 'P';
    'Р': Result := 'R';
    'С': Result := 'S';
    'Т': Result := 'T';
    'У': Result := 'U';
    'Ф': Result := 'F';
    'Х': Result := 'Kh';
    'Ц': Result := 'Ts';
    'Ч': Result := 'Ch';
    'Ш': Result := 'Sh';
    'Щ': Result := 'Shch';
    'Ю': Result := 'Yu';
    'Я': Result := 'Ya';
    'э': Result := 'e';
    'ы': Result := 'y';
    'Э': Result := 'E';
    'Ы': Result := 'Y';
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
    'A': Result := 'Ф';
    'B': Result := 'И';
    'C': Result := 'С';
    'D': Result := 'В';
    'E': Result := 'У';
    'F': Result := 'А';
    'G': Result := 'П';
    'H': Result := 'Р';
    'I': Result := 'Ш';
    'J': Result := 'О';
    'K': Result := 'Л';
    'L': Result := 'Д';
    'M': Result := 'Ь';
    'N': Result := 'Т';
    'O': Result := 'Щ';
    'P': Result := 'З';
    'Q': Result := 'Й';
    'R': Result := 'К';
    'S': Result := 'І';
    'T': Result := 'Е';
    'U': Result := 'Г';
    'V': Result := 'М';
    'W': Result := 'Ц';
    'X': Result := 'Ч';
    'Y': Result := 'Н';
    'Z': Result := 'Я';
    'a': Result := 'ф';
    'b': Result := 'и';
    'c': Result := 'с';
    'd': Result := 'в';
    'e': Result := 'у';
    'f': Result := 'а';
    'g': Result := 'п';
    'h': Result := 'р';
    'i': Result := 'ш';
    'j': Result := 'о';
    'k': Result := 'л';
    'l': Result := 'д';
    'm': Result := 'ь';
    'n': Result := 'т';
    'o': Result := 'щ';
    'p': Result := 'з';
    'q': Result := 'й';
    'r': Result := 'к';
    's': Result := 'і';
    't': Result := 'е';
    'u': Result := 'г';
    'v': Result := 'м';
    'w': Result := 'ц';
    'x': Result := 'ч';
    'y': Result := 'н';
    'z': Result := 'я';
    '`', '~', 'ё', 'Ё': Result := '''';
    else Result := Key;
  end;
end;

function EmulateCyrylicUpperCharset(Key: Char): Char;
begin
  case Key of
    'A', 'a': Result := 'Ф';
    'B', 'b': Result := 'И';
    'C', 'c': Result := 'С';
    'D', 'd': Result := 'В';
    'E', 'e': Result := 'У';
    'F', 'f': Result := 'А';
    'G', 'g': Result := 'П';
    'H', 'h': Result := 'Р';
    'I', 'i': Result := 'Ш';
    'J', 'j': Result := 'О';
    'K', 'k': Result := 'Л';
    'L', 'l': Result := 'Д';
    'M', 'm': Result := 'Ь';
    'N', 'n': Result := 'Т';
    'O', 'o': Result := 'Щ';
    'P', 'p': Result := 'З';
    'Q', 'q': Result := 'Й';
    'R', 'r': Result := 'К';
    'S', 's': Result := 'І';
    'T', 't': Result := 'Е';
    'U', 'u': Result := 'Г';
    'V', 'v': Result := 'М';
    'W', 'w': Result := 'Ц';
    'X', 'x': Result := 'Ч';
    'Y', 'y': Result := 'Н';
    'Z', 'z': Result := 'Я';
    '`', '~', 'ё', 'Ё': Result := '''';
    else Result := AnsiUpperChar(Key);
  end;
end;

function EmulateEnglishCharset(Key: Char): Char;
begin
  case Key of
    'А': Result := 'F';
    'В': Result := 'D';
    'Г': Result := 'U';
    'Д': Result := 'L';
    'Е': Result := 'T';
    'З': Result := 'P';
    'И': Result := 'B';
    'І', 'Ы': Result := 'S';
    'Й': Result := 'Q';
    'К': Result := 'R';
    'Л': Result := 'K';
    'М': Result := 'V';
    'Н': Result := 'Y';
    'О': Result := 'J';
    'П': Result := 'G';
    'Р': Result := 'H';
    'С': Result := 'C';
    'Т': Result := 'N';
    'У': Result := 'E';
    'Ф': Result := 'A';
    'Ц': Result := 'W';
    'Ч': Result := 'X';
    'Ш': Result := 'I';
    'Щ': Result := 'O';
    'Я': Result := 'Z';
    'Ь': Result := 'M';
    'а': Result := 'f';
    'в': Result := 'd';
    'г': Result := 'u';
    'д': Result := 'l';
    'е': Result := 't';
    'з': Result := 'p';
    'и': Result := 'b';
    'і', 'ы': Result := 's';
    'й': Result := 'q';
    'к': Result := 'r';
    'л': Result := 'k';
    'м': Result := 'v';
    'н': Result := 'y';
    'о': Result := 'j';
    'п': Result := 'g';
    'р': Result := 'h';
    'с': Result := 'c';
    'т': Result := 'n';
    'у': Result := 'e';
    'ф': Result := 'a';
    'ц': Result := 'w';
    'ч': Result := 'x';
    'ш': Result := 'i';
    'щ': Result := 'o';
    'я': Result := 'z';
    'ь': Result := 'm';
    'ё': Result := '`';
    'х': Result := '[';
    'ї', 'ъ': Result := ']';
    'ж': Result := ';';
    'є', 'э': Result := '''';
    'б': Result := ',';
    'ю': Result := '.';
    'Ё': Result := '~';
    'Х': Result := '{';
    'Ї', 'Ъ': Result := '}';
    'Ж': Result := ':';
    'Є', 'Э': Result := '"';
    'Б': Result := '<';
    'Ю': Result := '>';
    else Result := Key;
  end;
end;

function EmulateRussianCharset(Key: Char): Char;
begin
  case Key of
    'Е': Result := 'Э';
    'И': Result := 'Ы';
    'І': Result := 'И';
    'Є': Result := 'Е';
    'Ї': Result := 'И';
    'е': Result := 'э';
    'и': Result := 'ы';
    'і': Result := 'и';
    'є': Result := 'е';
    'ї': Result := 'и';
    else Result := Key;
  end;
end;

function EmulateEnglishUpperCharset(Key: Char): Char;
begin
  case Key of
    'А', 'а': Result := 'F';
    'В', 'в': Result := 'D';
    'Г', 'г': Result := 'U';
    'Д', 'д': Result := 'L';
    'Е', 'е': Result := 'T';
    'З', 'з': Result := 'P';
    'И', 'и': Result := 'B';
    'І', 'і', 'Ы', 'ы': Result := 'S';
    'Й', 'й': Result := 'Q';
    'К', 'к': Result := 'R';
    'Л', 'л': Result := 'K';
    'М', 'м': Result := 'V';
    'Н', 'н': Result := 'Y';
    'О', 'о': Result := 'J';
    'П', 'п': Result := 'G';
    'Р', 'р': Result := 'H';
    'С', 'с': Result := 'C';
    'Т', 'т': Result := 'N';
    'У', 'у': Result := 'E';
    'Ф', 'ф': Result := 'A';
    'Ц', 'ц': Result := 'W';
    'Ч', 'ч': Result := 'X';
    'Ш', 'ш': Result := 'I';
    'Щ', 'щ': Result := 'O';
    'Я', 'я': Result := 'Z';
    'Ь', 'ь': Result := 'M';
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
