unit UnitSQLData;

interface
uses SysUtils,UnitProc,TourSoupIntf;

function GetSQlTourGroupsRate( TourGrRateParam : TTourGroupRateInputParam ):string;

implementation

function GetSQlTourGroupsRate( TourGrRateParam : TTourGroupRateInputParam ):string;
var SqlLimited:string;
    SqlJustWithRate :String;
begin
   result :=' select * from GET_TOUR_GROUPS_RATE('+IntToStr(TourGrRateParam.idLng)+','+IntToStr( TourGrRateParam.CategoryOrder )+','+
                                                 ''''+ConvertDateTime( TourGrRateParam.DateStart, 0 )+''''+','+
                                                 ''''+ConvertDateTime( TourGrRateParam.DateEnd, 0 )+''''+','+''''+ConvertDateTime( TourGrRateParam.DatePay, 0 )+''''+','+
                                                 IntToStr(TourGrRateParam.Age)+','+IntToStr(TourGrRateParam.IdTour)+','+IntToStr(TourGrRateParam.StartRec)+','+IntToStr(TourGrRateParam.CountRec)+','+
                                                 IntToStr(TourGrRateParam.JustWithRate)+')';
end;

end.
