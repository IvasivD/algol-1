{ Invokable interface ITourSoup }

unit TourSoupIntf;

interface

uses InvokeRegistry,IdMultipartFormData,UnitPaymentBilling,Types,cxDBTL,cxTL;

type
  TOptAddresType = ( main, legal, mailing );

  TBankSoap = class(TRemotable)
  private
    FAccountID :Integer;
    FContragentID :Integer;

    FMFO: WideString;
    FName: WideString;
    FCorrAccount: WideString;
    FCity: WideString;
    FAddress: WideString;
    FPhones: WideString;
    FEDRPOU: WideString;
  published
    property AccountID :Integer read FAccountID write FAccountID;
    property ContragentID :Integer read FContragentID write FContragentID;

    property MFO: WideString read FMFO write FMFO;
    property Name: WideString read FName write FName;
    property CorrAccount: WideString read FCorrAccount write FCorrAccount;
    property City: WideString read FCity write FCity;
    property Address: WideString read FAddress write FAddress;
    property Phones: WideString read FPhones write FPhones;
    property EDRPOU: WideString read FEDRPOU write FEDRPOU;
  end;
  
  TTourUserLegal = class(TRemotable)
  private
    Fcommercial_name: WideString;
    Forg_type : Integer;
    Forg_name : WideString;
    Flegal_doc_type : Integer;
    Flegal_doc : Integer;
    Flegal_number : WideString;
    Flegal_doc_date : TDateTime;
    Ftax_system : Integer;
    Ftax_doc : Integer;
    Ftax_date_from : TDateTime;
    Ftax_pdv_ipnumber : Widestring;
    Ftax_pdv_doc : Integer;
    Ftax_pdv_date_from : TDateTime;
    Fsignatory_firstname: WideString;
    Fsignatory_surname: WideString;
    Fsignatory_middlename: WideString;
    Fsignatory_position: WideString;
    Fsignatory_attorney_doc_num : WideString;
    Fsignatory_attorney_doc_date: TDateTime;
    Fsignatory_attorney_doc_by : WideString;
  private
  published
    property commercial_name: WideString read Fcommercial_name write Fcommercial_name;
    property org_type : Integer read Forg_type write Forg_type;
    property org_name : WideString read Forg_name write Forg_name;
    property legal_doc_type : Integer read Flegal_doc_type write Flegal_doc_type;
    property legal_doc : Integer read Flegal_doc write Flegal_doc;
    property legal_number : WideString read Flegal_number write Flegal_number;
    property legal_doc_date : TDateTime read Flegal_doc_date write Flegal_doc_date;
    property tax_system : Integer read Ftax_system write Ftax_system;
    property tax_doc : Integer read Ftax_doc write Ftax_doc;
    property tax_date_from : TDateTime read Ftax_date_from write Ftax_date_from;
    property tax_pdv_ipnumber : Widestring read Ftax_pdv_ipnumber write Ftax_pdv_ipnumber;
    property tax_pdv_doc : Integer read Ftax_pdv_doc write Ftax_pdv_doc;
    property tax_pdv_date_from : TDateTime read Ftax_pdv_date_from write Ftax_pdv_date_from;
    property signatory_firstname: WideString read Fsignatory_firstname write Fsignatory_firstname;
    property signatory_surname: WideString read Fsignatory_surname write Fsignatory_surname;
    property signatory_middlename: WideString read Fsignatory_middlename write Fsignatory_middlename;
    property signatory_position: WideString read Fsignatory_position write Fsignatory_position;
    property signatory_attorney_doc_num : WideString read Fsignatory_attorney_doc_num write Fsignatory_attorney_doc_num;
    property signatory_attorney_doc_date: TDateTime read Fsignatory_attorney_doc_date write Fsignatory_attorney_doc_date;
    property signatory_attorney_doc_by : WideString read Fsignatory_attorney_doc_by write Fsignatory_attorney_doc_by;
  end;

  TTourUserDataAddres = class (TRemotable)
  private
    Faddress_type : TOptAddresType;
    Fcountry: Integer;
    Fzip : Widestring;
    Fprovince : Integer;
    Ftownship : Integer;
    Fcity : Integer;
    Fstreet_type : Integer;
    Fstreet : Widestring;
    Fbuilding : Integer;
    Fapartment_type : Integer;
    Fapartment : Widestring;
  published
    property address_type : TOptAddresType read Faddress_type write Faddress_type;
    property country: Integer read Fcountry write Fcountry;
    property zip: WideString read Fzip write Fzip;
    property province: Integer read Fprovince write Fprovince;
    property township: Integer read Ftownship write Ftownship;
    property city: Integer read Fcity write Fcity;
    property street_type: Integer read Fstreet_type write Fstreet_type;
    property street: WideString read Fstreet write Fstreet;
    property building : Integer read Fbuilding write Fbuilding;
    property apartment_type : Integer read Fapartment_type write Fapartment_type;
    property apartment : Widestring read Fapartment write Fapartment;
  end;
  
  TTourUserDataAddresArr = array of TTourUserDataAddres;

  TTourUserData = class (TRemotable)
    private
      Fid: Integer;
      Fstatus: Integer;
      Fverify: Boolean;
      Fcreated: TDateTime;
      Fupdated: TDateTime;
      Faddres : TTourUserDataAddresArr;
      FLegal  : TTourUserLegal;
    published
      property id: Integer read Fid write Fid;
      property status: Integer read Fstatus write Fstatus;
      property verify: Boolean read Fverify write Fverify;
      property created: TDateTime read Fcreated write Fcreated;
      property updated: TDateTime read Fupdated write Fupdated;
      property addres : TTourUserDataAddresArr read Faddres write Faddres;
      property Legal  : TTourUserLegal read FLegal write FLegal;
  end;

  TToutInvoiceDTO = class(TRemotable)
  private
    FCode : Integer;
    FDescription : WideString;
  public
    //constructor create(ID:INTEGER;NAME:STRING);
  published
     property Code: Integer read FCode write FCode;
     property Description : Widestring read FDescription write FDescription;
     //property PayRes: Boolean read FPayRes write FPayRes;
  end;

  TTourGroupRateInputParam = class (TRemotable)
   private
     FisAgent : Boolean;
     FDateStart : TDateTime;
     FDateEnd : TDateTime;
     FDatePay : TDateTime;
     FidLng : Integer;
     FCategoryOrder : Integer;
     FAge : Integer;
     FIdTour : Integer;
     FJustWithRate : Integer;
     FStartRec :Integer;
     FCountRec :Integer;
   public
     constructor Create;
   published
     property isAgent: Boolean read FisAgent write FisAgent;
     property DateStart: TDateTime read FDateStart write FDateStart;
     property DateEnd: TDateTime read FDateEnd write FDateEnd;
     property DatePay: TDateTime read FDatePay write FDatePay;
     property idLng: Integer read FidLng write FidLng;
     property CategoryOrder: Integer read FCategoryOrder write FCategoryOrder;
     property Age: Integer read FAge write FAge;
     property IdTour: Integer read FIdTour write FIdTour;
     property JustWithRate :Integer read FJustWithRate write FJustWithRate;
     property StartRec : integer read FStartRec write FStartRec;
     property CountRec : integer read FCountRec write FCountRec;
 end;

  { Invokable interfaces must derive from IInvokable }
  ITourSoup = interface(IInvokable)
  ['{98DB509F-CC3D-4619-A5BD-A25BBC2EBC1D}']

    function UpdateBillingData( MenId :Integer; UserName,Password :WideString; aBank:TBankSoap; PaymentBillingData: TPaymentBillingData ):integer; stdcall;
    function CheckInvoice( UserName, Password:WideString; codeid1c:Widestring; PayDate:TDateTime ) : TToutInvoiceDTO; stdcall;
    function CheckInvoice1( UserName, Password:WideString; codeid1c:Widestring; PayDate:Widestring ) : TToutInvoiceDTO; stdcall;
    function CreateUserSoap( UserData:TTourUserData;  AccesKey:Widestring ) : Integer; stdcall;
    function CheckUserEmail( EDRPO, Email, Key:Widestring ):Boolean; stdcall;

    function DBBanks: TByteDynArray; stdcall;
    function DBBanks2: String; stdcall;
    function GetPathDB:Widestring; stdcall;
    function GetTourGroupRate( Login, Password:String; TourGrRateParam : TTourGroupRateInputParam;  FormatData : Integer ) : String; stdcall;
    function GetCountriesList( Login, Password:String; idLng:integer; FormatData : Integer  ):String; stdcall;
    function GetCountryInfo( Login, Password:String; id, idLng:integer; FormatData : Integer ):String; stdcall;
    function GetLanguages( Login,Password:String; idLng:integer; ActiveTranslate:integer; FormatData:Integer ):string; stdcall;

    function GetRateTourGroupOnDate_Old( Login, Password:String; TourId,TouristAge:Integer; aDate:TDateTime; FormatData : Integer ):String; stdcall;
    function GetAllServicesRateTourGroupOnDate_Old( Login,Password:String; TourGroupId,Age:Integer; aDate:TDateTime;Hidden:Integer; FormatData:Integer ):string; stdcall;
    function GetClientData( Login, Password:String; IdClient:Integer; FormatData:Integer ):String;stdcall;
    function CheckClientByEDRPO(  Login,Password:String; EDRPOU:Widestring; FormatData:Integer ):String; stdcall;
    //function TestCopyFile(FileBaseCode: String):integer;stdcall;
    //function GetAttachmentFile(files: TSoapAttachment): Integer;stdcall;
  end;

implementation
{ TTourGroupRateInputParam }

constructor TTourGroupRateInputParam.Create;
begin
  FidLng :=448;
  FCategoryOrder :=0;
  FAge :=-1;
  FIdTour :=-1;
  FJustWithRate := 0;
  FStartRec :=-1;
  FCountRec :=-1;
end;

initialization

  { Invokable interfaces must be registered }

  InvRegistry.RegisterInterface( TypeInfo(ITourSoup) );
  RemClassRegistry.RegisterXSClass( TToutInvoiceDTO,'TToutInvoiceDTO' );
  RemClassRegistry.RegisterXSClass( TPaymentBillingData,'TPaymentBillingData' );
  RemClassRegistry.RegisterXSClass( TTourGroupRateInputParam, 'TTourGroupRateInputParam' );
  //InvRegistry.RegisterInterface( TypeInfo(IDMSoapDic) );
  //InvRegistry.RegisterInterface( TypeInfo(ISoapDM) );
  //InvRegistry.RegisterReturnParamNames();
  //RemClassRegistry.RegisterXSInfo( TypeInfo(TToutInvoice) );

end.
 