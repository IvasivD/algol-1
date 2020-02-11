// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost/TourSoap/TourSoap.dll/wsdl/ITourSoup
// Encoding : utf-8
// Version  : 1.0
// (21.08.2017 12:22:30 - 1.33.2.5)
// ************************************************************************ //

unit UnitTourSoup;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;
const
  defWSDL = 'http://localhost/TourSoap/TourSoap.dll/wsdl/ITourSoup';
  defURL  = 'http://localhost/TourSoap/TourSoap.dll/soap/ITourSoup';
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
  // !:double          - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"

  TBankSoap            = class;                 { "urn:TourSoupIntf" }
  TPaymentBillingData  = class;                 { "TPaymentBillingData" }
  TToutInvoiceDTO      = class;                 { "TToutInvoiceDTO" }



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
  published
    property Code: Integer read FCode write FCode;
  end;


  // ************************************************************************ //
  // Namespace : urn:TourSoupIntf-ITourSoup
  // soapAction: urn:TourSoupIntf-ITourSoup#%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ITourSoupbinding
  // service   : ITourSoupservice
  // port      : ITourSoupPort
  // URL       : http://192.168.0.4:10080/TourSoap/TourSoap.dll/soap/ITourSoup
  // ************************************************************************ //
  ITourSoup = interface(IInvokable)
  ['{7A01CE4D-E3B0-F113-916A-B62D114869FD}']
    function  UpdateBillingData(const MenId: Integer; const UserName: WideString; const Password: WideString; const aBank: TBankSoap; const PaymentBillingData: TPaymentBillingData): Integer; stdcall;
    function  CheckInvoice(const UserName: WideString; const Password: WideString; const codeid1c: WideString; const PayDate: TXSDateTime): TToutInvoiceDTO; stdcall;
    function  GetPathDB: WideString; stdcall;
  end;

function GetITourSoup(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ITourSoup;


implementation

function GetITourSoup(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ITourSoup;
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
end;


destructor TPaymentBillingData.Destroy;
begin
  if Assigned(FBillDate) then
    FBillDate.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ITourSoup), 'urn:TourSoupIntf-ITourSoup', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ITourSoup), 'urn:TourSoupIntf-ITourSoup#%operationName%');
  RemClassRegistry.RegisterXSClass(TBankSoap, 'urn:TourSoupIntf', 'TBankSoap');
  RemClassRegistry.RegisterXSClass(TPaymentBillingData, 'TPaymentBillingData', 'TPaymentBillingData');
  RemClassRegistry.RegisterXSClass(TToutInvoiceDTO, 'TToutInvoiceDTO', 'TToutInvoiceDTO');

end.
