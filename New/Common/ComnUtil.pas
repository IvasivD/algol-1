unit ComnUtil;

interface

{ additional math routines }
procedure IntDivision(Value, Divide: Integer; var IntPart, FracPart: Integer);

{ additional date routines }
function SumDateAndTime(ADate, ATime: TDateTime): TDateTime; // date + time correct!
function DateAddMonth(Value: TDateTime; ByMonth: Integer): TDateTime;
function DateAddYear(Value: TDateTime; ByYear: Integer): TDateTime;
function YearAge(Value: TDateTime): Integer;
function YearAgeByDate(Value, ByDate: TDateTime): Integer;
function TimeAddSecond(Value: TDateTime; BySecond: Integer): TDateTime;
function TimeAddMinute(Value: TDateTime; ByMinute: Integer): TDateTime;
function TimeAddHour(Value: TDateTime; ByHour: Integer): TDateTime;
function DurationToTime(Duration: Integer): TDateTime;
procedure GetInitialReportPeriod(var FromDate, TillDate: TDateTime);

{ additional string routines }
function AzCountString(NumberOf: Integer; One, Two, More: PChar): PChar;
function AzDayCountString(NumberOfDays: Integer): PChar;
function AzNightCountString(NumberOfNights: Integer): PChar;
function AzMonthCountString(NumberOfMonths: Integer): PChar;
function AzYearCountString(NumberOfYears: Integer): PChar;
function AzChooseCaptionString(Switch: Boolean; STrue, SFalse: PChar): PChar;

{ check input string with regular expression mask }
function AzCheckEmailAddress(Address: PChar): Boolean;
function AzCheckHttpAddress(Address: PChar): Boolean;
function AzCheckFtpAddress(Address: PChar): Boolean;
function AzCheckRegularExpression(Input, Expr: PChar): Boolean;


implementation

uses SysUtils, LibConsts, RegExpr;

{ additional math routines }

procedure IntDivision(Value, Divide: Integer; var IntPart, FracPart: Integer);
begin
  IntPart := Value div Divide;
  FracPart := Value mod Divide;
end;

{ additional date routines }

function SumDateAndTime(ADate, ATime: TDateTime): TDateTime;
begin
  Result := Int(ADate) + Frac(ATime);
end;

function DateAddMonth(Value: TDateTime; ByMonth: Integer): TDateTime;
var
  Y, M, D: Word;
  CY, CM: Integer;
begin
  case Abs(ByMonth) of
    0: Result := Value;
    1..11:
      begin
        DecodeDate(Value, Y, M, D);
        CM := M + ByMonth;
        if CM <= 0 then
        begin
          M := CM + 12;
          Dec(Y);
        end
        else if CM > 12 then
        begin
          M := CM - 12;
          Inc(Y);
        end
        else M := Abs(CM);
        try
          Result := SumDateAndTime(EncodeDate(Y, M, D), Value);
        except
          Result := SumDateAndTime(EncodeDate(Y, M, Pred(D)), Value);
        end;
      end;
    else
      begin
        IntDivision(ByMonth, 12, CY, CM);
        Result := DateAddYear(DateAddMonth(Value, CM), CY);
      end;
  end;
end;

function DateAddYear(Value: TDateTime; ByYear: Integer): TDateTime;
var Y, M, D: Word;
begin
  DecodeDate(Value, Y, M, D);
  try
    Result := SumDateAndTime(EncodeDate(Y + ByYear, M, D), Value);
  except
    Result := SumDateAndTime(EncodeDate(Y + ByYear, M, Pred(D)), Value);
  end;
end;

function YearAge(Value: TDateTime): Integer;
begin
  Result := YearAgeByDate(Value, Date);
end;

function YearAgeByDate(Value, ByDate: TDateTime): Integer;
var YT, MT, DT, YA, MA, DA: Word;
begin
  DecodeDate(ByDate, YT, MT, DT);
  DecodeDate(Value, YA, MA, DA);
  Result := YT - YA;
  if MT * 32 + DT < MA * 32 + DA then Dec(Result);
end;

function TimeAddSecond(Value: TDateTime; BySecond: Integer): TDateTime;
var
  H, M, S, C: Word;
  CM, CS: Integer;
  NextDay: Boolean;
begin
  Result := Value;
  case Abs(BySecond) of
    0: Result := Value;
    1..59:
      begin
        NextDay := False;
        DecodeTime(Value, H, M, S, C);
        CS := S + BySecond;
        CM := M;
        if CS < 0 then
        begin
          S := CS + 60;
          Dec(CM);
          if CM < 0 then
          begin
            Inc(CM, 60);
            Dec(H);
          end;
        end
        else if CS > 59 then
        begin
          S := CS - 60;
          Inc(CM);
          if CM > 59 then
          begin
            Dec(CM, 60);
            Inc(H);
            if H > 23 then
            begin
              NextDay := True;
              H := H - 24;
            end;
          end;
        end
        else S := Abs(CS);
        ReplaceTime(Result, EncodeTime(H, CM, S, C));
        if NextDay then Result := Result + 1;
      end;
    else
      begin
        IntDivision(BySecond, 60, CM, CS);
        Result := TimeAddSecond(TimeAddMinute(Result, CM), CS);
      end;
  end;
end;

function TimeAddMinute(Value: TDateTime; ByMinute: Integer): TDateTime;
var
  H, M, S, C: Word;
  CH, CM: Integer;
begin
  Result := Value;
  case Abs(ByMinute) of
    0: Result := Value;
    1..59:
      begin
        DecodeTime(Value, H, M, S, C);
        CM := M + ByMinute;
        CH := H;
        if CM < 0 then
        begin
          M := CM + 60;
          Dec(CH);
          if CH < 0 then
          begin
            Inc(CH, 24);
            Result := Result - 1;
          end;
        end
        else if CM >= 60 then
        begin
          M := CM - 60;
          Inc(CH);
          if CH > 23 then
          begin
            Dec(CH, 24);
            Result := Result + 1;
          end;
        end
        else M := Abs(CM);
        ReplaceTime(Result, EncodeTime(CH, M, S, C));
      end;
    else
      begin
        IntDivision(ByMinute, 60, CH, CM);
        Result := TimeAddMinute(TimeAddHour(Result, CH), CM);
      end;
  end;
end;

function TimeAddHour(Value: TDateTime; ByHour: Integer): TDateTime;
var
  H, M, S, C: Word;
  CH, D: Integer;
begin
  case Abs(ByHour) of
    0: Result := Value;
    1..23:
      begin
        Result := Value;
        DecodeTime(Value, H, M, S, C);
        CH := H + ByHour;
        if CH < 0 then
        begin
          H := CH + 24;
          Result := Result - 1;
        end
        else if CH >= 24 then
        begin
          H := CH - 24;
          Result := Result + 1;
        end
        else H := Abs(CH);
        ReplaceTime(Result, EncodeTime(H, M, S, C));
      end;
    else
      begin
        IntDivision(ByHour, 24, D, CH);
        Result := TimeAddHour(Result + D, CH);
      end;
  end;
end;

{ convert Duration value in seconds to TTime value }
function DurationToTime(Duration: Integer): TDateTime;
var H, M, S: Word;
begin
  M := Duration div 60;
  H := M div 60;
  M := M mod 60;
  S := Duration mod 60;
  Result := EncodeTime(H, M, S, 0);
end;

{ return first and last day of last month in FromDate and TillDate parameters }
procedure GetInitialReportPeriod(var FromDate, TillDate: TDateTime);
var Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  if Day <= 15 then
  begin
    FromDate := IncMonth(EncodeDate(Year, Month, 1), -1);
    TillDate := EncodeDate(Year, Month, 1) - 1;
  end
  else begin
    FromDate := EncodeDate(Year, Month, 1);
    TillDate := IncMonth(EncodeDate(Year, Month, 1), +1) - 1;
  end;
end;

{ additional string routines }

function AzCountString(NumberOf: Integer; One, Two, More: PChar): PChar;
var N: Integer;
begin
  N := NumberOf mod 100;
  Result := More;
  if (N div 10) <> 1 then
    case N mod 10 of
      1: Result := One;
      2..4: Result := Two;
    end;
end;

function AzDayCountString(NumberOfDays: Integer): PChar;
begin
  Result := AzCountString(NumberOfDays,
    PChar(SComnUtilOneDay), PChar(SComnUtilTwoDays), PChar(SComnUtilDays));
end;

function AzNightCountString(NumberOfNights: Integer): PChar;
begin
  Result := AzCountString(NumberOfNights,
    PChar(SComnUtilOneNight), PChar(SComnUtilTwoNights), PChar(SComnUtilNights));
end;

function AzMonthCountString(NumberOfMonths: Integer): PChar;
begin
  Result := AzCountString(NumberOfMonths,
    PChar(SComnUtilOneMonth), PChar(SComnUtilTwoMonths), PChar(SComnUtilMonths));
end;

function AzYearCountString(NumberOfYears: Integer): PChar;
begin
  Result := AzCountString(NumberOfYears,
    PChar(SComnUtilOneYear), PChar(SComnUtilTwoYears), PChar(SComnUtilYears));
end;

function AzChooseCaptionString(Switch: Boolean; STrue, SFalse: PChar): PChar;
begin
  if Switch then Result := STrue else Result := SFalse;
end;

{ check input string with regular expression mask }

const
  reEmail = '([_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+)';
  reFtp = '([Ff][Tt][Pp])://([_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+))((/[ _a-zA-Z\d\-\\\.]+)+)*';
  reHttp = '([Hh][Tt][Tt][Pp])://([_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+))((/[ _a-zA-Z\d\-\\\.]+)+)*';
  reWeb = '([Ff][Tt][Pp]|[Hh][Tt][Tt][Pp])://([_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+))((/[ _a-zA-Z\d\-\\\.]+)+)*';

{ checks email address }
function AzCheckEmailAddress(Address: PChar): Boolean;
begin
  Result := AzCheckRegularExpression(Address, reEmail);
end;

{ checks HTTP address }
function AzCheckHttpAddress(Address: PChar): Boolean;
begin
  Result := ExecRegExpr(reHttp, Address);
end;

{ checks FTP address }
function AzCheckFtpAddress(Address: PChar): Boolean;
begin
  Result := ExecRegExpr(reFtp, Address);
end;

{ checks web address }
function AzCheckWebAddress(Address: PChar): Boolean;
begin
  Result := ExecRegExpr(reWeb, Address);
end;

{ checks input string with regular expression mask }
function AzCheckRegularExpression(Input, Expr: PChar): Boolean;
begin
  Result := ExecRegExpr(Expr, Input);
end;

end.
