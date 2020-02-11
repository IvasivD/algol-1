unit ServUn;

interface

{ service cost }

const
  nHotelServiceCostUnknown = -1;
  nHotelServiceCostPrepaid = 0;
  nHotelServiceCostNonZero = 1;
  nHotelServiceCostPartial = 2;
  nHotelServiceCostNotPaid = 3;
  nServiceTabHotel = 0;
  nServiceTabBuild = 1;
  nServiceTabRooms = 2;
  nServiceTabProps = [nServiceTabBuild, nServiceTabRooms];

type
  THotelServiceCost = nHotelServiceCostUnknown..nHotelServiceCostNotPaid;

function GetHotelServiceHaveCostInfo(HaveCost: Integer): string;

{ enterprise name generate }

function MakeHotelEnterpriseName(const Kind, Name, City, Cntry: string): string;


implementation

uses SysUtils, TourConsts;

{ service cost }

function GetHotelServiceHaveCostInfo(HaveCost: Integer): string;
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const
  nHotelServiceHaveCostInfo: array[THotelServiceCost] of Pointer = (
    @SHtlServDlgHaveCostUnknown,
    @SHtlServDlgHaveCostInclude, @SHtlServDlgHaveCostExclude,
    @SHtlServDlgHaveCostPartial, @SHtlServDlgHaveCostNotPaid);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
begin
  Result := LoadResString(nHotelServiceHaveCostInfo[HaveCost]);
end;

{ enterprise name generate }

function MakeHotelEnterpriseName(const Kind, Name, City, Cntry: string): string;
const sNameFmt = '%s %s / %s, %s';
begin
  Result := Trim( Format(sNameFmt, [Kind, Name, City, Cntry]) );
end;

end.
