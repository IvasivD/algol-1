unit RateTypes;

interface

uses CalkGrid, Controls, UnitIBQuery;

type
  TValuteMode = (vmBoth, vmUAH, vmValute);
  TChangeStatus = (stUnchanged, stModified, stInserted);
  TFormulaMode = (fmEqual, fmAdd, fmSubst);
  TFormulaValueMode = (vmAbsolute, vmPercent);

{  TInsureProgram = (aTravel, aMultiTravel);
  TInsurePlace = (aShengen, aEuropa, aWorld);
  TInsureSport = (aSportNone, aSportAV, aSportNS, aSportPSB);}
  
  TRoomTypes = record
    Name : string;
    ShortName : string;
    Capacity : integer;
    Status : TChangeStatus;
    Archive : boolean;      // признак що дана кімната є архівною - тобто в даний момент її немає
    DataEmpty : boolean;    // визначити чи дана кімната містить дані чи тариф неї пустий.
    Id : Integer;
  end;

  TNameId = record
    Name : string;
    Id : Integer;
  end;

  TNameStatusId = record
    Name : string;
    Status : TChangeStatus;
    Id : Integer;
  end;

  TNameStatusRangeId = record
    Name : string;
    NameId : integer;
    Status : TChangeStatus;
    Id : Integer;
    From : Integer;
    Till : Integer;
    MainAge : boolean;
  end;

  TDataItem = record
    Value : double;
    IsNull : boolean;
  end;


  TAges = array of TNameStatusRangeId;  //вікові категорії

  TRatePeriodData = record
    Name : string;
    Status : TChangeStatus;
    Id : Integer;
    FromDate : TDateTime;
    TillDate : TDateTime;
    PeriodFrom : Integer;
    PeriodTill : Integer;
  end;

  TRatePeriods =  array of TRatePeriodData;           // преріоди
  
  TTypeRateRec = record
    RateId: Integer;
    AgentAbs: Boolean;
    AgentAbs2: Boolean;
    V1_Rate: Variant;
    V1_AgentPay: Variant;
    V1_NetVal: Variant;
    V2_Rate: Variant;
    V2_AgentPay: Variant;
    V2_NetVal: Variant;
    V1_Rate2: Variant;
    V1_AgentPay2: Variant;
    V1_NetVal2: Variant;
    V2_Rate2: Variant;
    V2_AgentPay2: Variant;
    V2_NetVal2: Variant;
  end;
  TTypeRateArr = array of TTypeRateRec; //періоди
  TTypeRate = array of TTypeRateArr; //вікові групи


  TJoinedTours =       // масив котрий містить список повязаних тарифів
              array of TNameId;

  TRateRangeData = record
    Caption: string;
    From   : Integer;
    Till   : Integer;
    Option : Integer; {val1 - AgeIdName integer; val2 - MainAge boolean; result:=val1 + (val2 shl 16);  val1:= value and $FFFF; val2 := (value shr 16) and $FFFF;}
    Control: TWinControl;
  end;

  TRateRange =  array of TRateRangeData;           // преріоди

{  TInsureData = record
    InsureAge: Integer;
    InsureProgram: TInsureProgram;
    InsurePlace: TInsurePlace;
    InsureSport: TInsureSport;
  end;}
  TInsureData = record
    InsureAge: Integer;
    InsureProgram: Integer;
    InsurePlace: Integer;
    InsureSport: Integer;
  end;
const
  EnableSeasonStr        = 'Зробити доступним';
  DisableSeasonStr       = 'Зробити недоступним';
  RemoveSeasonStr        = 'Ця операція знищить існуючі тарифи сезону "%s".'#13'Продовжити ?';
  EnableAgeStr           = 'Зробити доступною';
  DisableAgeStr          = 'Зробити недоступною';
  RemoveAgeStr           = 'Ця операція знищить існуючі тарифи вікової групи "%s".'#13'Продовжити ?';
  SOneDayLess = 'дня';
  SOneDay = 'день';
  STwoDays = 'дні';
  SnDays = 'днів';
  SOneNight = 'ніч';
  STwoNights = 'ночі';
  SnNights = 'ночей';
  SOneWeek = 'тиждень';
  STwoWeeks = 'тижні';
  SnWeeks = 'тижнів';
  nDay = 0;
  nNight = 1;
  nWeek = 2;
  nDayLess = 3;
  nUnitLast = nDayLess;

{  arInsureSport: array[TInsureSport] of Integer = (0, 1, 2, 3);
  arInsurePlace: array[TInsurePlace] of Integer = (0, 2, 1);
  arProgInsur: array[TInsureProgram] of Integer = (1, 2); }

function ChangeDayLabel(DayCount: Integer; UnitOfTime: Integer = 0): String;
function PeriodName(ARange: TRateRangeData{; IsFirst: Boolean}): string;
function AgeName(ARange: TRateRangeData): string;
function CodeInsure(aInsureData: TInsureData): string;              
function DeCodeInsure(aInsure: string): TInsureData;

implementation

uses
  SysUtils, Dialogs, StrUtils;


function ChangeDayLabel(DayCount: Integer; UnitOfTime: Integer = 0): String;
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const OneDayNight: array[nDay..nUnitLast] of string = (SOneDay, SOneNight, SOneWeek, SOneDayLess);
      TwoDayNight: array[nDay..nUnitLast] of string = (STwoDays, STwoNights, STwoWeeks, SnDays);
      nDayNight: array[nDay..nUnitLast] of string = (SnDays, SnNights, SnWeeks, SnDays);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
begin
  if ( DayCount mod 100 ) in [11..14] then Result := nDayNight[UnitOfTime]
  else case DayCount mod 10 of
  1:    Result := OneDayNight[UnitOfTime];
  2..4: Result := TwoDayNight[UnitOfTime];
  else  Result := nDayNight[UnitOfTime];
  end
end;

function PeriodName(ARange: TRateRangeData{; IsFirst: Boolean}): string;
const 
      MorePeriod = '%d %s і >';
      LessPeriod = '> %d %s';
begin
  Result := EmptyStr;
  Result := Format(MorePeriod , [ARange.From, ChangeDayLabel(ARange.From, nDay)]);
  if {IsFirst and} (ARange.Till > 0) and (ARange.From = 0) 
  then Result := Format(LessPeriod, [ARange.Till, ChangeDayLabel(ARange.Till, nDayLess)]);
  if ARange.Caption <> EmptyStr then Result := ARange.Caption;
end;

function AgeName(ARange: TRateRangeData): string;
begin
  if ARange.Till <> -1 then Result := ARange.Caption + ' (' + (IntToStr(ARange.From)+' - '+IntToStr(ARange.Till)) + ')'
  else Result := ARange.Caption + (' > ' + IntToStr(ARange.From));
  if ARange.Caption <> EmptyStr then Result := ARange.Caption;
end;
(*
function InsureAgeDisc(DAge: Integer): Integer;
begin
  case DAge of
   0 :  Result := 0;
   1..3: Result := 1; //1..4: Result := 1;
   60..65 : Result := 3; //60..69 : Result := 3;
   66..75 : Result := 4; //70..74 : Result := 4;
   76..80 : Result := 5; //75..79 : Result := 5;
   81..85 : Result := 6; //80..84 : Result := 6;
   else Result := 2;
  end
end;  *)

function CodeInsure(aInsureData: TInsureData): string;
var aAge: Integer;
begin
  if aInsureData.InsureAge < 0 then aAge := 2 else aAge := aInsureData.InsureAge;
  Result := Format('A%dW%dS%dF%dG%dT%dP%dN%d',[aAge, 0,
    aInsureData.InsureSport, 0, 0, aInsureData.InsurePlace, aInsureData.InsureProgram, 0 ]);            
end;

function DeCodeInsure(aInsure: string): TInsureData;
var aPos: Integer;
begin
//  Result.InsureAge := 2;
  {віковий коефіцієнт}
  aPos := Pos('A', aInsure);
  Result.InsureAge := StrToInt(Copy(aInsure, aPos + 1, 1));
  {програма страхування}
  aPos := Pos('P', aInsure);
  Result.InsureProgram := StrToInt(Copy(aInsure, aPos + 1, 1));
  {місце страхування}
  aPos := Pos('T', aInsure);
  Result.InsurePlace := StrToInt(Copy(aInsure, aPos + 1, 1));
  {коефіцієнт спорт}
  aPos := Pos('S', aInsure);
  Result.InsureSport := StrToInt(Copy(aInsure, aPos + 1, 1));
end;

end.



(*  
function CodeInsure(aInsureData: TInsureData): string;
var dSport, dWorld, dProgInsur, dAge: Integer;
begin
  dAge := InsureAgeDisc(aInsureData.InsureAge);
  dSport := arInsureSport[aInsureData.InsureSport];
  dWorld := arInsurePlace[aInsureData.InsurePlace];
  dProgInsur := arProgInsur[aInsureData.InsureProgram];
  Result := Format('A%dW%dS%dF%dG%dT%dP%dN%d',[dAge, 0,
    dSport, 0, 0, dWorld, dProgInsur, 0 ]);            
end;

function DeCodeInsure(aInsure: string): TInsureData;

case arData of
  1: Result.InsureProgram := aTravel;
  2: Result.InsureProgram := aMultiTravel;
  end;
  {місце страхування}
  aPos := Pos('T', aInsure);
  arData := StrToInt(Copy(aInsure, aPos + 1, 1));
  case arData of
  0: Result.InsurePlace := aShengen;
  1: Result.InsurePlace := aWorld;
  2: Result.InsurePlace := aEuropa;
  end;
  {місце страхування}
  aPos := Pos('S', aInsure);
  arData := StrToInt(Copy(aInsure, aPos + 1, 1));
  case arData of
  0: Result.InsureSport := aSportNone;
  1: Result.InsureSport := aSportAV;
  2: Result.InsureSport := aSportNS;
  3: Result.InsureSport := aSportPSB;
  end;   *)

