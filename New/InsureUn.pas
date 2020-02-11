unit InsureUn;

interface

type 
  TInsureDataItem = record
    FromDate: TDateTime;
    KindId: Integer; 
    VendorId: Integer;
    DayCount: Integer; 
    InsureDay: Integer;
    Dedic: String;
    InsVal: String;
  end;
  
function AppliedIncrease(InsureIdent: string): Boolean;
function AppliedIncreaseWork(InsureIdent: string): Boolean;
function AppliedIncreaseSport1(InsureIdent: string): Boolean;
function AppliedIncreaseSport2(InsureIdent: string): Boolean;
function AppliedIncreaseSport3(InsureIdent: string): Boolean;

function AppliedDiscount(InsureIdent: string): Boolean;
function AppliedDiscountFamily(InsureIdent: string): Boolean;
function AppliedDiscountGroup1(InsureIdent: string): Boolean;
function AppliedDiscountGroup2(InsureIdent: string): Boolean;
function AppliedDiscountGroup3(InsureIdent: string): Boolean;
function AppliedDiscountGroup4(InsureIdent: string): Boolean;

function TravelInsureProgram(InsureIdent: string): Boolean;
function MultiTravelInsureProgram(InsureIdent: string): Boolean;

function InsureAreaShengen(InsureIdent: string): Boolean;
function InsureAreaWorld(InsureIdent: string): Boolean;
function InsureAreaEuropa(InsureIdent: string): Boolean;

function InsureCountryId(InsureIdent: string): Integer;

implementation

uses
  SysUtils;

function AppliedIncrease(InsureIdent: string): Boolean;
begin
  Result := AppliedIncreaseWork(InsureIdent) or
            (copy(InsureIdent, 6, 1) <> '0') and 
            ( InsureIdent <> EmptyStr );
end;

function AppliedIncreaseWork(InsureIdent: string): Boolean;
begin 
  Result := copy(InsureIdent, 4, 1) = '1';
end;

function AppliedIncreaseSport1(InsureIdent: string): Boolean;
begin 
  Result := copy(InsureIdent, 6, 1) = '1';
end;

function AppliedIncreaseSport2(InsureIdent: string): Boolean;
begin 
  Result := copy(InsureIdent, 6, 1) = '2';
end;

function AppliedIncreaseSport3(InsureIdent: string): Boolean;
begin 
  Result := copy(InsureIdent, 6, 1) = '3';
end;

function AppliedDiscount(InsureIdent: string): Boolean;
begin 
  Result := AppliedDiscountFamily(InsureIdent) or
            (copy(InsureIdent, 10, 1) <> '0') and 
            (InsureIdent <> '' );
end;

function AppliedDiscountFamily(InsureIdent: string): Boolean;
begin                 
  Result := copy(InsureIdent, 8, 1) = '1';
end;

function AppliedDiscountGroup1(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 10, 1) = '1';
end;

function AppliedDiscountGroup2(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 10, 1) = '2';
end;

function AppliedDiscountGroup3(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 10, 1) = '3';
end;

function AppliedDiscountGroup4(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 10, 1) = '4';
end;

function TravelInsureProgram(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 14, 1) = '1';
end;

function MultiTravelInsureProgram(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 14, 1) = '2';
end;

function InsureAreaShengen(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 12, 1) = '0';
end;

function InsureAreaWorld(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 12, 1) = '1';
end;

function InsureAreaEuropa(InsureIdent: string): Boolean;
begin
  Result := copy(InsureIdent, 12, 1) = '2';
end;

function InsureCountryId(InsureIdent: string): Integer;
begin
  Result := 0;
  if copy(InsureIdent,16,3) <> '' then Result := StrToInt( copy(InsureIdent, 16, 3) )
end;

end.
