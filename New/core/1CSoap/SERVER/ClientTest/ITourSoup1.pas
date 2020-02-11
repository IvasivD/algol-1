// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost/TourSoap/TourSoap.dll/wsdl/ITourSoup
// Encoding : utf-8
// Version  : 1.0
// (21.08.2017 12:22:30 - 1.33.2.5)
// ************************************************************************ //

unit ITourSoup1;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;
const
  defWSDL = 'http://192.168.0.4:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
  defURL  = 'http://192.168.0.4:10080/TourSoap/TourSoap.dll/soap/ITourSoup';
  defSvc  = 'ITourSoupservice';
  defPrt  = 'ITourSoupPort';
type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"

  TBankSoap            = class;                 { "urn:TourSoupIntf" }
  TTourUserLegal       = class;                 { "urn:TourSoupIntf" }
  TTourUserDataAddres  = class;                 { "urn:TourSoupIntf" }
  TTourUserData        = class;                 { "urn:TourSoupIntf" }
  TPaymentBillingData  = class;                 { "TPaymentBillingData" }
  TToutInvoiceDTO      = class;                 { "TToutInvoiceDTO" }
  TTourGroupRateInputParam = class;             { "TTourGroupRateInputParam" }

  { "urn:TourSoupIntf" }
  TOptAddresType = (main, legal, mailing);



  // ************************************************************************ //
  // Namespace : urn:TourSoupIntf
  // ************************************************************************ //
  TBankSoap = class(TRemotable)
  private
    FAccountID: Integer;
    FContragentID: Integer;
    FMFO: WideString;
    FName: WideString;
    FCorrAccount: WideString;
    FCity: WideString;
    FAddress: WideString;
    FPhones: WideString;
    FEDRPOU: WideString;
  published
    property AccountID: Integer read FAccountID write FAccountID;
    property ContragentID: Integer read FContragentID write FContragentID;
    property MFO: WideString read FMFO write FMFO;
    property Name: WideString read FName write FName;
    property CorrAccount: WideString read FCorrAccount write FCorrAccount;
    property City: WideString read FCity write FCity;
    property Address: WideString read FAddress write FAddress;
    property Phones: WideString read FPhones write FPhones;
    property EDRPOU: WideString read FEDRPOU write FEDRPOU;
  end;



  // ************************************************************************ //
  // Namespace : urn:TourSoupIntf
  // ************************************************************************ //
  TTourUserLegal = class(TRemotable)
  private
    Fcommercial_name: WideString;
    Forg_type: Integer;
    Forg_name: WideString;
    Flegal_doc_type: Integer;
    Flegal_doc: Integer;
    Flegal_number: WideString;
    Flegal_doc_date: TXSDateTime;
    Ftax_system: Integer;
    Ftax_doc: Integer;
    Ftax_date_from: TXSDateTime;
    Ftax_pdv_ipnumber: WideString;
    Ftax_pdv_doc: Integer;
    Ftax_pdv_date_from: TXSDateTime;
    Fsignatory_firstname: WideString;
    Fsignatory_surname: WideString;
    Fsignatory_middlename: WideString;
    Fsignatory_position: WideString;
    Fsignatory_attorney_doc_num: WideString;
    Fsignatory_attorney_doc_date: TXSDateTime;
    Fsignatory_attorney_doc_by: WideString;
  public
    destructor Destroy; override;
  published
    property commercial_name: WideString read Fcommercial_name write Fcommercial_name;
    property org_type: Integer read Forg_type write Forg_type;
    property org_name: WideString read Forg_name write Forg_name;
    property legal_doc_type: Integer read Flegal_doc_type write Flegal_doc_type;
    property legal_doc: Integer read Flegal_doc write Flegal_doc;
    property legal_number: WideString read Flegal_number write Flegal_number;
    property legal_doc_date: TXSDateTime read Flegal_doc_date write Flegal_doc_date;
    property tax_system: Integer read Ftax_system write Ftax_system;
    property tax_doc: Integer read Ftax_doc write Ftax_doc;
    property tax_date_from: TXSDateTime read Ftax_date_from write Ftax_date_from;
    property tax_pdv_ipnumber: WideString read Ftax_pdv_ipnumber write Ftax_pdv_ipnumber;
    property tax_pdv_doc: Integer read Ftax_pdv_doc write Ftax_pdv_doc;
    property tax_pdv_date_from: TXSDateTime read Ftax_pdv_date_from write Ftax_pdv_date_from;
    property signatory_firstname: WideString read Fsignatory_firstname write Fsignatory_firstname;
    property signatory_surname: WideString read Fsignatory_surname write Fsignatory_surname;
    property signatory_middlename: WideString read Fsignatory_middlename write Fsignatory_middlename;
    property signatory_position: WideString read Fsignatory_position write Fsignatory_position;
    property signatory_attorney_doc_num: WideString read Fsignatory_attorney_doc_num write Fsignatory_attorney_doc_num;
    property signatory_attorney_doc_date: TXSDateTime read Fsignatory_attorney_doc_date write Fsignatory_attorney_doc_date;
    property signatory_attorney_doc_by: WideString read Fsignatory_attorney_doc_by write Fsignatory_attorney_doc_by;
  end;



  // ************************************************************************ //
  // Namespace : urn:TourSoupIntf
  // ************************************************************************ //
  TTourUserDataAddres = class(TRemotable)
  private
    Faddress_type: TOptAddresType;
    Fcountry: Integer;
    Fzip: WideString;
    Fprovince: Integer;
    Ftownship: Integer;
    Fcity: Integer;
    Fstreet_type: Integer;
    Fstreet: WideString;
    Fbuilding: Integer;
    Fapartment_type: Integer;
    Fapartment: WideString;
  published
    property address_type: TOptAddresType read Faddress_type write Faddress_type;
    property country: Integer read Fcountry write Fcountry;
    property zip: WideString read Fzip write Fzip;
    property province: Integer read Fprovince write Fprovince;
    property township: Integer read Ftownship write Ftownship;
    property city: Integer read Fcity write Fcity;
    property street_type: Integer read Fstreet_type write Fstreet_type;
    property street: WideString read Fstreet write Fstreet;
    property building: Integer read Fbuilding write Fbuilding;
    property apartment_type: Integer read Fapartment_type write Fapartment_type;
    property apartment: WideString read Fapartment write Fapartment;
  end;

  TTourUserDataAddresArr = array of TTourUserDataAddres;   { "urn:TourSoupIntf" }


  // ************************************************************************ //
  // Namespace : urn:TourSoupIntf
  // ************************************************************************ //
  TTourUserData = class(TRemotable)
  private
    Fid: Integer;
    Fstatus: Integer;
    Fverify: Boolean;
    Fcreated: TXSDateTime;
    Fupdated: TXSDateTime;
    Faddres: TTourUserDataAddresArr;
    FLegal: TTourUserLegal;
  public
    destructor Destroy; override;
  published
    property id: Integer read Fid write Fid;
    property status: Integer read Fstatus write Fstatus;
    property verify: Boolean read Fverify write Fverify;
    property created: TXSDateTime read Fcreated write Fcreated;
    property updated: TXSDateTime read Fupdated write Fupdated;
    property addres: TTourUserDataAddresArr read Faddres write Faddres;
    property Legal: TTourUserLegal read FLegal write FLegal;
  end;



  // ************************************************************************ //
  // Namespace : TPaymentBillingData
  // ************************************************************************ //
  TPaymentBillingData = class(TRemotable)
  private
    FOrderId: Integer;
    FExchCurrId: Integer;
    FBillingNo: Integer;
    FTotalSum: Double;
    FPayMethod: Integer;
    FManagerId: Integer;
    FBillNo: WideString;
    FBillDate: TXSDateTime;
    FDocTypeId: Integer;
  public
    destructor Destroy; override;
  published
    property OrderId: Integer read FOrderId write FOrderId;
    property ExchCurrId: Integer read FExchCurrId write FExchCurrId;
    property BillingNo: Integer read FBillingNo write FBillingNo;
    property TotalSum: Double read FTotalSum write FTotalSum;
    property PayMethod: Integer read FPayMethod write FPayMethod;
    property ManagerId: Integer read FManagerId write FManagerId;
    property BillNo: WideString read FBillNo write FBillNo;
    property BillDate: TXSDateTime read FBillDate write FBillDate;
    property DocTypeId: Integer read FDocTypeId write FDocTypeId;
  end;



  // ************************************************************************ //
  // Namespace : TToutInvoiceDTO
  // ************************************************************************ //
  TToutInvoiceDTO = class(TRemotable)
  private
    FCode: Integer;
    FDescription: WideString;
  published
    property Code: Integer read FCode write FCode;
    property Description: WideString read FDescription write FDescription;
  end;



  // ************************************************************************ //
  // Namespace : TTourGroupRateInputParam
  // ************************************************************************ //
  TTourGroupRateInputParam = class(TRemotable)
  private
    FisAgent: Boolean;
    FDateStart: TXSDateTime;
    FDateEnd: TXSDateTime;
    FDatePay: TXSDateTime;
    FidLng: Integer;
    FCategoryOrder: Integer;
    FAge: Integer;
    FIdTour: Integer;
    FJustWithRate: Integer;
    FStartRec: Integer;
    FCountRec: Integer;
  public
    destructor Destroy; override;
  published
    property isAgent: Boolean read FisAgent write FisAgent;
    property DateStart: TXSDateTime read FDateStart write FDateStart;
    property DateEnd: TXSDateTime read FDateEnd write FDateEnd;
    property DatePay: TXSDateTime read FDatePay write FDatePay;
    property idLng: Integer read FidLng write FidLng;
    property CategoryOrder: Integer read FCategoryOrder write FCategoryOrder;
    property Age: Integer read FAge write FAge;
    property IdTour: Integer read FIdTour write FIdTour;
    property JustWithRate: Integer read FJustWithRate write FJustWithRate;
    property StartRec: Integer read FStartRec write FStartRec;
    property CountRec: Integer read FCountRec write FCountRec;
  end;


  // ************************************************************************ //
  // Namespace : urn:TourSoupIntf-ITourSoup
  // soapAction: urn:TourSoupIntf-ITourSoup#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITourSoupbinding
  // service   : ITourSoupservice
  // port      : ITourSoupPort
  // URL       : http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup
  // ************************************************************************ //
  ITourSoup = interface(IInvokable)
  ['{7A01CE4D-E3B0-F113-916A-B62D114869FD}']
    function  UpdateBillingData(const MenId: Integer; const UserName: WideString; const Password: WideString; const aBank: TBankSoap; const PaymentBillingData: TPaymentBillingData): Integer; stdcall;
    function  CheckInvoice(const UserName: WideString; const Password: WideString; const codeid1c: WideString; const PayDate: TXSDateTime): TToutInvoiceDTO; stdcall;
    function  CheckInvoice1(const UserName: WideString; const Password: WideString; const codeid1c: WideString; const PayDate: WideString): TToutInvoiceDTO; stdcall;
    function  CreateUserSoap(const UserData: TTourUserData; const AccesKey: WideString): Integer; stdcall;
    function  CheckUserEmeil(const EDRPO: WideString; const Email: WideString; const Key: WideString): Boolean; stdcall;
    function  DBBanks: TByteDynArray; stdcall;
    function  DBBanks2: WideString; stdcall;
    function  GetPathDB: WideString; stdcall;
    function  GetTourGroupRate(const Login: WideString; const Password: WideString; const TourGrRateParam: TTourGroupRateInputParam; const FormatData: Integer): WideString; stdcall;
    function  GetCountriesList(const Login: WideString; const Password: WideString; const idLng: Integer; const FormatData: Integer): WideString; stdcall;
    function  GetCountryInfo(const Login: WideString; const Password: WideString; const id: Integer; const idLng: Integer; const FormatData: Integer): WideString; stdcall;
    function  GetLanguages(const Login: WideString; const Password: WideString; const idLng: Integer; const ActiveTranslate: Integer; const FormatData: Integer): WideString; stdcall;
    function  GetRateTourGroupOnDate_Old(const Login: WideString; const Password: WideString; const TourId: Integer; const TouristAge: Integer; const aDate: TXSDateTime; const FormatData: Integer): WideString; stdcall;
    function  GetAllServicesRateTourGroupOnDate_Old(const Login: WideString; const Password: WideString; const TourGroupId: Integer; const Age: Integer; const aDate: TXSDateTime; const Hidden: Integer; const FormatData: Integer): WideString; stdcall;
    function  GetClientData(const Login: WideString; const Password: WideString; const IdClient: Integer; const FormatData: Integer): WideString; stdcall;
    function  CheckClientByEDRPO(const Login: WideString; const Password: WideString; const EDRPOU: WideString; const FormatData: Integer): WideString; stdcall;
  end;

//function GetITourSoup(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITourSoup;


implementation

{function GetITourSoup(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITourSoup;
const
  defWSDL = 'http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/wsdl/ITourSoup';
  defURL  = 'http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';
  defSvc  = 'ITourSoupservice';
  defPrt  = 'ITourSoupPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ITourSoup);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;}


destructor TTourUserLegal.Destroy;
begin
  if Assigned(Flegal_doc_date) then
    Flegal_doc_date.Free;
  if Assigned(Ftax_date_from) then
    Ftax_date_from.Free;
  if Assigned(Ftax_pdv_date_from) then
    Ftax_pdv_date_from.Free;
  if Assigned(Fsignatory_attorney_doc_date) then
    Fsignatory_attorney_doc_date.Free;
  inherited Destroy;
end;

destructor TTourUserData.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Faddres)-1 do
    if Assigned(Faddres[I]) then
      Faddres[I].Free;
  SetLength(Faddres, 0);
  if Assigned(Fcreated) then
    Fcreated.Free;
  if Assigned(Fupdated) then
    Fupdated.Free;
  if Assigned(FLegal) then
    FLegal.Free;
  inherited Destroy;
end;

destructor TPaymentBillingData.Destroy;
begin
  if Assigned(FBillDate) then
    FBillDate.Free;
  inherited Destroy;
end;

destructor TTourGroupRateInputParam.Destroy;
begin
  if Assigned(FDateStart) then
    FDateStart.Free;
  if Assigned(FDateEnd) then
    FDateEnd.Free;
  if Assigned(FDatePay) then
    FDatePay.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ITourSoup), 'urn:TourSoupIntf-ITourSoup', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITourSoup), 'urn:TourSoupIntf-ITourSoup#%operationName%');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TOptAddresType), 'urn:TourSoupIntf', 'TOptAddresType');
  RemClassRegistry.RegisterXSClass(TBankSoap, 'urn:TourSoupIntf', 'TBankSoap');
  RemClassRegistry.RegisterXSClass(TTourUserLegal, 'urn:TourSoupIntf', 'TTourUserLegal');
  RemClassRegistry.RegisterXSClass(TTourUserDataAddres, 'urn:TourSoupIntf', 'TTourUserDataAddres');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TTourUserDataAddresArr), 'urn:TourSoupIntf', 'TTourUserDataAddresArr');
  RemClassRegistry.RegisterXSClass(TTourUserData, 'urn:TourSoupIntf', 'TTourUserData');
  RemClassRegistry.RegisterXSClass(TPaymentBillingData, 'TPaymentBillingData', 'TPaymentBillingData');
  RemClassRegistry.RegisterXSClass(TToutInvoiceDTO, 'TToutInvoiceDTO', 'TToutInvoiceDTO');
  RemClassRegistry.RegisterXSClass(TTourGroupRateInputParam, 'TTourGroupRateInputParam', 'TTourGroupRateInputParam');

end.
