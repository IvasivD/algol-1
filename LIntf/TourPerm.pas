unit TourPerm;

interface

function GetPermItemName(Item: Integer): String;

implementation

uses TourDbUn;

const
  uspSDiction = 'Diction';
  uspSDictCountry = 'DictCountry';
  uspSDictCity = 'DictCity';
  uspSDictHotel = 'DictHotel';
  uspSDictHotelGrp = 'DictHotelGrp';
  uspSDictHotelCtg = 'DictHotelCtg';
  uspSDictCurrency = 'DictCurrency';
  uspSDictDrive = 'DictDrive';
  uspSDictRoomType = 'DictRoomType';
  uspSDictRoomView = 'DictRoomView';
  uspSDictService = 'DictService';
  uspSDictReklama = 'DictReklama';
  uspSDictCompany = 'DictCompany';
  uspSDictBank = 'DictBank';
  uspSDictOther = 'DictOther';
  uspSOrder = 'BrOrder';
  uspSTour = 'BrTour';
  uspSRoute = 'BrRoute';
  uspSTrip = 'BrTrip';
  uspSHotel = 'BrHotel';
  uspSInsure = 'BrInsure';
  uspSVisa = 'BrVisa';
  uspSMail = 'BrMail';
  uspSReport = 'BrReport';

function GetPermItemName(Item: Integer): String;
begin
  case Item of
    uspDiction: Result := uspSDiction;
    uspDictCountry: Result := uspSDictCountry;
    uspDictCity: Result := uspSDictCity;
    uspDictHotel: Result := uspSDictHotel;
    uspDictHotelGrp: Result := uspSDictHotelGrp;
    uspDictHotelCtg: Result := uspSDictHotelCtg;
    uspDictCurrency: Result := uspSDictCurrency;
    uspDictDrive: Result := uspSDictDrive;
    uspDictRoomType: Result := uspSDictRoomType;
    uspDictRoomView: Result := uspSDictRoomView;
    uspDictService: Result := uspSDictService;
    uspDictReklama: Result := uspSDictReklama;
    uspDictCompany: Result := uspSDictCompany;
    uspDictBank: Result := uspSDictBank;
    uspDictOther: Result := uspSDictOther;
    uspOrder: Result := uspSOrder;
    uspTour: Result := uspSTour;
    uspRoute: Result := uspSRoute;
    uspTrip: Result := uspSTrip;
    uspHotel: Result := uspSHotel;
    uspInsure: Result := uspSInsure;
    uspVisa: Result := uspSVisa;
    uspMail: Result := uspSMail;
    uspReport: Result := uspSReport;
    else Result := '';
  end;
end;

end.
