unit RateDlls;

interface

uses Windows;

type
t1=record
 RateBrutto,DiscBrutto,RateNet,DiscNet: real;
end;

TRouteRate = record
 RouteId, DriveClass, PlaceClass,StartId,StopId,IntCurCode,PersonId: integer;
 TripDate: TDateTime;
 BirthDate: TDate;
 LocalCur,IntCur: array[0..2] of t1;
end;

function GetHotelRate(Locale: boolean; HotelId, RoomTypeId, RoomViewId: longint;
  DateFrom, DateTo, BirthDate: TDateTime): Extended; //external 'RatesLib.dll';
function GetRouteRate(Locale: boolean;
  RouteId, DriveId, StartId, StopId: longint; Dir, PlaceClass: integer;
  TripDate, BirthDate: TDateTime): Extended; //external 'RatesLib.dll';

procedure GetRouteRateNew(var a: array of TRouteRate);

implementation

{ !!! stub !!! }

uses Dialogs, SysUtils, VDlgs, TourConsts, DataMod;

function GetRate(Locale: boolean; const ACaption, APrompt: string): Extended;
var S: String;
const L: array[boolean] of String = ('валюта', 'грн.');
begin
  S := '';
  repeat
    S := VInputDlg(ACaption,
      APrompt + Format(#13'Вкажіть вартість'#13'(%s)', [L[Locale]]), S);
    try
      Result := StrToFloat(Trim(S));
    except
      Result := -1;
    end;
    if Result < 0 then VErrorDlg(SPayDlgInputErrEmpty);
  until Result >= 0;
end;

function GetHotelRate(Locale: boolean; HotelId, RoomTypeId, RoomViewId: longint;
  DateFrom, DateTo, BirthDate: TDateTime): Extended;
begin
  with DM do
    Result := GetRate(Locale,
      Format('Вартість проживання в готелі %s', ['A', 'B']),
      Format('з %s по %s ( = %d дн.),'#13'дата народження %s', [
        FormatDateTime('dd.mm.yyyy, hh:nn', DateFrom),
        FormatDateTime('dd.mm.yyyy, hh:nn', DateTo), Trunc(DateTo - DateFrom),
        FormatDateTime('dd.mm.yyyy', BirthDate)]));
end;

function GetRouteRate(Locale: boolean;
  RouteId, DriveId, StartId, StopId: longint;
  Dir, PlaceClass: integer; TripDate, BirthDate: TDateTime): Extended;
var S: String;
begin
  case Dir of
    0: S := 'тільки ТУДИ';
    1: S := 'тільки НАЗАД';
  else S := 'в ОБИДВА боки';
  end;
  with DM do
    Result := GetRate(Locale,
      Format('Вартість проїзду %s - %s', ['A', 'B']),
      Format('виїзд %s %s, місце %d'#13'дата народження %s', [
        FormatDateTime('dd.mm.yyyy, hh:nn', TripDate), S, PlaceClass,
        FormatDateTime('dd.mm.yyyy', BirthDate)]));
end;


procedure GetRouteRateNew(var a: array of TRouteRate);
var
s: string;
i: integer;
RoutRateWasClosed, DetWasClosed: Boolean;

   procedure GetRateDet(LocalCurrency: Boolean);
   var
   k: integer;
   begin
     with dmRuteRates, taDetails do
     begin
       Filter := Format('(RateId=%d) and (AgeFrom <= %d) and (AgeTo >= %d)'+
          ' and (DateFrom <= %s) and (DateTo >= %s) and (DriveClass=%d) and (PlaceClass=%d)',
          [dmRuteRates.taRouteRatesRateId.AsInteger,
           DateTimeToStr(int(Now)-a[i].BirthDate),
           DateTimeToStr(a[i].TripDate),
           a[i].DriveClass,
           a[i].PlaceClass]);

       first;
       if RecordCount > 0 then
       while not eof do
         begin
           k := dmRuteRates.taDetailsDirection.AsInteger;
           if LocalCurrency then
             begin
               a[i].LocalCur.Dir[k].RateBrutto := taDetailsRateBrutto.AsCurrency;
               a[i].LocalCur.Dir[k].DiscBrutto := taDetailsDiscBrutto.AsCurrency;
               a[i].LocalCur.Dir[k].RateNet := taDetailsRateNetto.AsCurrency;
               a[i].LocalCur.Dir[k].DiscNet := taDetailsDiscNetto.AsCurrency;
             end;
           else
             begin
               a[i].IntCurCode := taRouteRatesCurrency.AsInteger;

               a[i].IntCur.Dir[k].RateBrutto := taDetailsRateBrutto.AsCurrency;
               a[i].IntCur.Dir[k].DiscBrutto := taDetailsDiscBrutto.AsCurrency;
               a[i].IntCur.Dir[k].RateNet := taDetailsRateNetto.AsCurrency;
               a[i].IntCur.Dir[k].DiscNet := taDetailsDiscNetto.AsCurrency;
             end;
           next;
         end;
     end;
   end;

begin
with dmRuteRates do
begin
 RoutRateWasClosed := not taRouteRates.Active;
 if RoutRateWasClosed then taRouteRates.Open;
 DetWasClosed := not taDetails.Active;
 if DetWasClosed then taDetails.Open;

  with taRouteRates do
  for i := 0 to High(a) do
  begin
    for j := 0 to 2 do
    begin
      a[i].LocalCur.Dir[j].RateBrutto := -1;
      a[i].LocalCur.Dir[j].DiscBrutto := -1;
      a[i].LocalCur.Dir[j].RateNet := -1;
      a[i].LocalCur.Dir[j].DiscNet := -1;

      a[i].IntCurCode := -1;
      a[i].IntCur.Dir[j].RateBrutto := -1;
      a[i].IntCur.Dir[j].DiscBrutto := -1;
      a[i].IntCur.Dir[j].RateNet := -1;
      a[i].IntCur.Dir[j].DiscNet := -1;
    end;

    s := Format('(RouteId=%d) and (LegalFrom <= %s) and ((LegalTo >= %s) or ((LegalTo = ""))',
    [a[i].RouteId, DateTimeToStr(Now),DateTimeToStr(Now)]);

    s1 := s + ' and currency = 3';
    Filter := s1;
    if RecordCount > 0 then GetRateDet(True);

    s1 := s + ' and currency <> 3';
    Filter := s1;
    if RecordCount > 0 then GetRateDet(False);
  end;

 if RoutRateWasClosed then taRouteRates.Close;
 if DetWasClosed then taDetails.Close;
end;

end.
