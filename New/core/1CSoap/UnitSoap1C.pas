// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://192.168.0.101/Algol/ws/Algol?wsdl
// Encoding : UTF-8
// Codegen  : [wfDebug,wfUseSerializerClassForAttrs]
// Version  : 1.0
// (21.09.2017 12:24:33 - 1.33.2.5)
// ************************************************************************ //

unit UnitSoap1C;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;
{const
  defWSDL = 'http://B2/AlgolProd/ws/Algol?wsdl';
  defURL  = 'http://B2/AlgolProd/ws/Algol ';
  defSvc  = 'ExchangeService';
  defPrt  = 'ExchangeServicePort';

  Test
  defWSDL=http://192.168.0.101/Algol/ws/Algol?wsdl
  defURL=http://192.168.0.101/Algol/ws/Algol
}
type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:String12        - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"
  // !:float           - "http://www.w3.org/2001/XMLSchema"

  OperationResult      = class;                 { "algol1c" }
  Address              = class;                 { "algol1c" }
  ContragentDTO        = class;                 { "algol1c" }
  ContragentArray      = class;                 { "algol1c"[A] }
  GetContragentResult  = class;                 { "algol1c" }
  Bank                 = class;                 { "algol1c" }
  AccountDTO           = class;                 { "algol1c" }
  AccountArray         = class;                 { "algol1c"[A] }
  GoodsDTO             = class;                 { "algol1c" }
  GoodsArray           = class;                 { "algol1c"[A] }
  InvoiceDTO           = class;                 { "algol1c" }
  InvoiceStatusDTO     = class;                 { "algol1c" }
  InvoiceStatusArray   = class;                 { "algol1c"[A] }
  CurrencyRateDTO      = class;                 { "algol1c" }
  CurrencyRateArray    = class;                 { "algol1c"[A] }
  RealizationDTO       = class;                 { "algol1c" }
  RealizationsArray    = class;                 { "algol1c"[A] }
  GetRealizationsResult = class;                { "algol1c" }
  ContractDTO          = class;                 { "algol1c" }

  EDRPOU          =  type WideString;      { "algol1c" }
  String12        =  type WideString;      { "algol1c" }
  INN             =  String12;             { "algol1c" }


  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  OperationResult = class(TRemotable)
  private
    FCode: Integer;
    FDescription: WideString;
    FBaseID: WideString;
  published
    property Code: Integer read FCode write FCode;
    property Description: WideString read FDescription write FDescription;
    property BaseID: WideString read FBaseID write FBaseID;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  Address = class(TRemotable)
  private
    FRepresentation: WideString;
    FZIP: WideString;
    FState: WideString;
    FRegion: WideString;
    FDistrict: WideString;
    FCity: WideString;
    FSettlement: WideString;
    FStreet: WideString;
    FHouse: WideString;
    FBuilding: WideString;
    FAppartment: WideString;
  published
    property Representation: WideString read FRepresentation write FRepresentation;
    property ZIP: WideString read FZIP write FZIP;
    property State: WideString read FState write FState;
    property Region: WideString read FRegion write FRegion;
    property District: WideString read FDistrict write FDistrict;
    property City: WideString read FCity write FCity;
    property Settlement: WideString read FSettlement write FSettlement;
    property Street: WideString read FStreet write FStreet;
    property House: WideString read FHouse write FHouse;
    property Building: WideString read FBuilding write FBuilding;
    property Appartment: WideString read FAppartment write FAppartment;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  ContragentDTO = class(TRemotable)
  private
    FContragentID: Integer;
    FName: WideString;
    FFullName: WideString;
    FComment: WideString;
    FHeadContragentID: Integer;
    FLegal: Boolean;
    FINN: String12;
    FEDRPOU: EDRPOU;
    FResident: Boolean;
    FUsedInAccounting: Boolean;
    FCode: String12;
    FMarkedToDelete: Boolean;
    FAddress: Address;
    FBranchNo: WideString;
    FVatLicence: String12;
  public
    destructor Destroy; override;
  published
    property ContragentID: Integer read FContragentID write FContragentID;
    property Name: WideString read FName write FName;
    property FullName: WideString read FFullName write FFullName;
    property Comment: WideString read FComment write FComment;
    property HeadContragentID: Integer read FHeadContragentID write FHeadContragentID;
    property Legal: Boolean read FLegal write FLegal;
    property INN: String12 read FINN write FINN;
    property EDRPOU: EDRPOU read FEDRPOU write FEDRPOU;
    property Resident: Boolean read FResident write FResident;
    property UsedInAccounting: Boolean read FUsedInAccounting write FUsedInAccounting;
    property Code: String12 read FCode write FCode;
    property MarkedToDelete: Boolean read FMarkedToDelete write FMarkedToDelete;
    property Address: Address read FAddress write FAddress;
    property BranchNo: WideString read FBranchNo write FBranchNo;
    property VatLicence: String12 read FVatLicence write FVatLicence;
  end;

  Contragent = array of ContragentDTO;          { "algol1c" }


  // ************************************************************************ //
  // Namespace : algol1c
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  ContragentArray = class(TRemotable)
  private
    FContragent: Contragent;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetContragentDTOArray(Index: Integer): ContragentDTO;
    function   GetContragentDTOArrayLength: Integer;
    property   ContragentDTOArray[Index: Integer]: ContragentDTO read GetContragentDTOArray; default;
    property   Len: Integer read GetContragentDTOArrayLength;
  published
    property Contragent: Contragent read FContragent write FContragent;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  GetContragentResult = class(TRemotable)
  private
    FCode: Integer;
    FDescription: WideString;
    FElements: ContragentArray;
  public
    destructor Destroy; override;
  published
    property Code: Integer read FCode write FCode;
    property Description: WideString read FDescription write FDescription;
    property Elements: ContragentArray read FElements write FElements;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  Bank = class(TRemotable)
  private
    FMFO: WideString;
    FName: WideString;
    FCorrAccount: WideString;
    FCity: WideString;
    FAddress: WideString;
    FPhones: WideString;
    FEDRPOU: WideString;
  published
    property MFO: WideString read FMFO write FMFO;
    property Name: WideString read FName write FName;
    property CorrAccount: WideString read FCorrAccount write FCorrAccount;
    property City: WideString read FCity write FCity;
    property Address: WideString read FAddress write FAddress;
    property Phones: WideString read FPhones write FPhones;
    property EDRPOU: WideString read FEDRPOU write FEDRPOU;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  AccountDTO = class(TRemotable)
  private
    FAccountID: Integer;
    FContragentID: Integer;
    FAccountNumber: WideString;
    FBank: Bank;
    FActive: Boolean;
    FMarkedToDelete: Boolean;
    FCode: String12;
  public
    destructor Destroy; override;
  published
    property AccountID: Integer read FAccountID write FAccountID;
    property ContragentID: Integer read FContragentID write FContragentID;
    property AccountNumber: WideString read FAccountNumber write FAccountNumber;
    property Bank: Bank read FBank write FBank;
    property Active: Boolean read FActive write FActive;
    property MarkedToDelete: Boolean read FMarkedToDelete write FMarkedToDelete;
    property Code: String12 read FCode write FCode;
  end;

  Account    = array of AccountDTO;             { "algol1c" }


  // ************************************************************************ //
  // Namespace : algol1c
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  AccountArray = class(TRemotable)
  private
    FAccount: Account;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetAccountDTOArray(Index: Integer): AccountDTO;
    function   GetAccountDTOArrayLength: Integer;
    property   AccountDTOArray[Index: Integer]: AccountDTO read GetAccountDTOArray; default;
    property   Len: Integer read GetAccountDTOArrayLength;
  published
    property Account: Account read FAccount write FAccount;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  GoodsDTO = class(TRemotable)
  private
    FCode: Integer;
    FPrice: Single;
    FTourID: Integer;
    FGroupID: Integer;
  published
    property Code: Integer read FCode write FCode;
    property Price: Single read FPrice write FPrice;
    property TourID: Integer read FTourID write FTourID;
    property GroupID: Integer read FGroupID write FGroupID;
  end;

  Good       = array of GoodsDTO;               { "algol1c" }


  // ************************************************************************ //
  // Namespace : algol1c
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  GoodsArray = class(TRemotable)
  private
    FGood: Good;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetGoodsDTOArray(Index: Integer): GoodsDTO;
    function   GetGoodsDTOArrayLength: Integer;
    property   GoodsDTOArray[Index: Integer]: GoodsDTO read GetGoodsDTOArray; default;
    property   Len: Integer read GetGoodsDTOArrayLength;
  published
    property Good: Good read FGood write FGood;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  InvoiceDTO = class(TRemotable)
  private
    FInvoiceID: Integer;
    FContragentID: Integer;
    FContractID: Integer;
    FOrderID: Integer;
    FInvoiceNumber: WideString;
    FDate: WideString;
    FTourEndDate: WideString;
    FInvoiceExpireDate: WideString;
    FPaymentStatus: Integer;
    FFinal: Boolean;
    FGoods: GoodsArray;
    FDirectionID: Integer;
  public
    destructor Destroy; override;
  published
    property InvoiceID: Integer read FInvoiceID write FInvoiceID;
    property ContragentID: Integer read FContragentID write FContragentID;
    property ContractID: Integer read FContractID write FContractID;
    property OrderID: Integer read FOrderID write FOrderID;
    property InvoiceNumber: WideString read FInvoiceNumber write FInvoiceNumber;
    property Date: WideString read FDate write FDate;
    property TourEndDate: WideString read FTourEndDate write FTourEndDate;
    property InvoiceExpireDate: WideString read FInvoiceExpireDate write FInvoiceExpireDate;
    property PaymentStatus: Integer read FPaymentStatus write FPaymentStatus;
    property Final: Boolean read FFinal write FFinal;
    property Goods: GoodsArray read FGoods write FGoods;
    property DirectionID: Integer read FDirectionID write FDirectionID;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  InvoiceStatusDTO = class(TRemotable)
  private
    FInvoiceID: Integer;
    FPaymentStatus: Integer;
  published
    property InvoiceID: Integer read FInvoiceID write FInvoiceID;
    property PaymentStatus: Integer read FPaymentStatus write FPaymentStatus;
  end;

  InvoiceStatus = array of InvoiceStatusDTO;    { "algol1c" }


  // ************************************************************************ //
  // Namespace : algol1c
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  InvoiceStatusArray = class(TRemotable)
  private
    FInvoiceStatus: InvoiceStatus;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetInvoiceStatusDTOArray(Index: Integer): InvoiceStatusDTO;
    function   GetInvoiceStatusDTOArrayLength: Integer;
    property   InvoiceStatusDTOArray[Index: Integer]: InvoiceStatusDTO read GetInvoiceStatusDTOArray; default;
    property   Len: Integer read GetInvoiceStatusDTOArrayLength;
  published
    property InvoiceStatus: InvoiceStatus read FInvoiceStatus write FInvoiceStatus;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  CurrencyRateDTO = class(TRemotable)
  private
    FCurrencyID: WideString;
    FDate: WideString;
    FRate: Single;
    FZoom: Integer;
  published
    property CurrencyID: WideString read FCurrencyID write FCurrencyID;
    property Date: WideString read FDate write FDate;
    property Rate: Single read FRate write FRate;
    property Zoom: Integer read FZoom write FZoom;
  end;

  RateArray  = array of CurrencyRateDTO;        { "algol1c" }


  // ************************************************************************ //
  // Namespace : algol1c
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  CurrencyRateArray = class(TRemotable)
  private
    FRateArray: RateArray;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetCurrencyRateDTOArray(Index: Integer): CurrencyRateDTO;
    function   GetCurrencyRateDTOArrayLength: Integer;
    property   CurrencyRateDTOArray[Index: Integer]: CurrencyRateDTO read GetCurrencyRateDTOArray; default;
    property   Len: Integer read GetCurrencyRateDTOArrayLength;
  published
    property RateArray: RateArray read FRateArray write FRateArray;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  RealizationDTO = class(TRemotable)
  private
    FInvoiceID: Integer;
    FContragentID: Integer;
    FContractID: Integer;
    FOrderID: Integer;
    FRealizationNumber: WideString;
    FDate: WideString;
    FMarkedToDelete: Boolean;
    FPosted: Boolean;
    FGoods: GoodsArray;
  public
    destructor Destroy; override;
  published
    property InvoiceID: Integer read FInvoiceID write FInvoiceID;
    property ContragentID: Integer read FContragentID write FContragentID;
    property ContractID: Integer read FContractID write FContractID;
    property OrderID: Integer read FOrderID write FOrderID;
    property RealizationNumber: WideString read FRealizationNumber write FRealizationNumber;
    property Date: WideString read FDate write FDate;
    property MarkedToDelete: Boolean read FMarkedToDelete write FMarkedToDelete;
    property Posted: Boolean read FPosted write FPosted;
    property Goods: GoodsArray read FGoods write FGoods;
  end;

  Realization = array of RealizationDTO;        { "algol1c" }


  // ************************************************************************ //
  // Namespace : algol1c
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  RealizationsArray = class(TRemotable)
  private
    FRealization: Realization;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetRealizationDTOArray(Index: Integer): RealizationDTO;
    function   GetRealizationDTOArrayLength: Integer;
    property   RealizationDTOArray[Index: Integer]: RealizationDTO read GetRealizationDTOArray; default;
    property   Len: Integer read GetRealizationDTOArrayLength;
  published
    property Realization: Realization read FRealization write FRealization;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  GetRealizationsResult = class(TRemotable)
  private
    FCode: Integer;
    FDescription: WideString;
    FElements: RealizationsArray;
  public
    destructor Destroy; override;
  published
    property Code: Integer read FCode write FCode;
    property Description: WideString read FDescription write FDescription;
    property Elements: RealizationsArray read FElements write FElements;
  end;



  // ************************************************************************ //
  // Namespace : algol1c
  // ************************************************************************ //
  ContractDTO = class(TRemotable)
  private
    FContractID: Integer;
    FContragentID: Integer;
    FName: WideString;
    FPrintName: WideString;
    FComment: WideString;
    FContractType: Integer;
    FContractNumber: WideString;
    FContractStartDate: WideString;
    FContractEndDate: WideString;
    FContractPath: WideString;
  published
    property ContractID: Integer read FContractID write FContractID;
    property ContragentID: Integer read FContragentID write FContragentID;
    property Name: WideString read FName write FName;
    property PrintName: WideString read FPrintName write FPrintName;
    property Comment: WideString read FComment write FComment;
    property ContractType: Integer read FContractType write FContractType;
    property ContractNumber: WideString read FContractNumber write FContractNumber;
    property ContractStartDate: WideString read FContractStartDate write FContractStartDate;
    property ContractEndDate: WideString read FContractEndDate write FContractEndDate;
    property ContractPath: WideString read FContractPath write FContractPath;
  end;


  // ************************************************************************ //
  // Namespace : algol1c
  // soapAction: algol1c#Algol:%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : AlgolSoapBinding
  // service   : Algol
  // port      : AlgolSoap
  // URL       : http://192.168.0.101/Algol/ws/Algol
  // ************************************************************************ //
  AlgolPortType = interface(IInvokable)
  ['{163F6706-29F6-9A90-EEAC-D3347DB04BC0}']
    function  DeleteClient(const ContragentID: Integer): OperationResult; stdcall;
    function  DeleteContract(const ContractID: Integer): OperationResult; stdcall;
    function  GetClient(const EDRPOU: EDRPOU; const INN: INN; const ClientID: Integer; const SearchInDeleted: Boolean; const Name: WideString; const ContragentID: WideString): ContragentArray; stdcall;
    function  GetClientByID(const ID: Integer): GetContragentResult; stdcall;
    function  LinkClient(const ContragentID: Integer; const ContragentCode: WideString): OperationResult; stdcall;
    function  GetAccount(const ID: Integer; const ClientID: Integer; const EDRPOU: EDRPOU; const SearchInDeleted: Boolean): AccountArray; stdcall;
    function  UpdateAccount(const Array_: AccountArray): OperationResult; stdcall;
    function  CreateInvoice(const Invoice: InvoiceDTO): OperationResult; stdcall;
    function  UpdateInvoice(const Invoice: InvoiceDTO): OperationResult; stdcall;
    function  UpdateInvoiceStatus(const InvoiceStatusArray: InvoiceStatusArray): OperationResult; stdcall;
    function  UpdateCurrencyRate(const CurrencyRateArray: CurrencyRateArray): OperationResult; stdcall;
    function  GetRealizationsByInvoice(const BaseID: WideString; const SearchInDeleted: Boolean; const SearchInUnposted: Boolean): GetRealizationsResult; stdcall;
    function  CreateClient(const Client: ContragentDTO): OperationResult; stdcall;
    function  UpdateClient(const Client: ContragentDTO): OperationResult; stdcall;
    function  CreateContract(const Contract: ContractDTO): OperationResult; stdcall;
    function  UpdateContract(const Contract: ContractDTO): OperationResult; stdcall;
    function  UnlinkClient(const ContragentID: Integer; const ContragentCode: WideString): OperationResult; stdcall;
  end;

function GetAlgolPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): AlgolPortType;


implementation

function GetAlgolPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): AlgolPortType;
{const
  defWSDL = 'http://192.168.0.101/Algol/ws/Algol?wsdl';
  defURL  = 'http://192.168.0.101/Algol/ws/Algol';
  defSvc  = 'Algol';
  defPrt  = 'AlgolSoap';}
var
  RIO: THTTPRIO;
begin
  Result := nil;
  {if (Addr = '') then
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
    Result := (RIO as AlgolPortType);
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
  end;}
end;


destructor ContragentDTO.Destroy;
begin
  if Assigned(FAddress) then
    FAddress.Free;
  inherited Destroy;
end;

constructor ContragentArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor ContragentArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FContragent)-1 do
    if Assigned(FContragent[I]) then
      FContragent[I].Free;
  SetLength(FContragent, 0);
  inherited Destroy;
end;

function ContragentArray.GetContragentDTOArray(Index: Integer): ContragentDTO;
begin
  Result := FContragent[Index];
end;

function ContragentArray.GetContragentDTOArrayLength: Integer;
begin
  if Assigned(FContragent) then
    Result := Length(FContragent)
  else
  Result := 0;
end;

destructor GetContragentResult.Destroy;
begin
  if Assigned(FElements) then
    FElements.Free;
  inherited Destroy;
end;

destructor AccountDTO.Destroy;
begin
  if Assigned(FBank) then
    FBank.Free;
  inherited Destroy;
end;

constructor AccountArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor AccountArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FAccount)-1 do
    if Assigned(FAccount[I]) then
      FAccount[I].Free;
  SetLength(FAccount, 0);
  inherited Destroy;
end;

function AccountArray.GetAccountDTOArray(Index: Integer): AccountDTO;
begin
  Result := FAccount[Index];
end;

function AccountArray.GetAccountDTOArrayLength: Integer;
begin
  if Assigned(FAccount) then
    Result := Length(FAccount)
  else
  Result := 0;
end;

constructor GoodsArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor GoodsArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FGood)-1 do
    if Assigned(FGood[I]) then
      FGood[I].Free;
  SetLength(FGood, 0);
  inherited Destroy;
end;

function GoodsArray.GetGoodsDTOArray(Index: Integer): GoodsDTO;
begin
  Result := FGood[Index];
end;

function GoodsArray.GetGoodsDTOArrayLength: Integer;
begin
  if Assigned(FGood) then
    Result := Length(FGood)
  else
  Result := 0;
end;

destructor InvoiceDTO.Destroy;
begin
  if Assigned(FGoods) then
    FGoods.Free;
  inherited Destroy;
end;

constructor InvoiceStatusArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor InvoiceStatusArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FInvoiceStatus)-1 do
    if Assigned(FInvoiceStatus[I]) then
      FInvoiceStatus[I].Free;
  SetLength(FInvoiceStatus, 0);
  inherited Destroy;
end;

function InvoiceStatusArray.GetInvoiceStatusDTOArray(Index: Integer): InvoiceStatusDTO;
begin
  Result := FInvoiceStatus[Index];
end;

function InvoiceStatusArray.GetInvoiceStatusDTOArrayLength: Integer;
begin
  if Assigned(FInvoiceStatus) then
    Result := Length(FInvoiceStatus)
  else
  Result := 0;
end;

constructor CurrencyRateArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor CurrencyRateArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FRateArray)-1 do
    if Assigned(FRateArray[I]) then
      FRateArray[I].Free;
  SetLength(FRateArray, 0);
  inherited Destroy;
end;

function CurrencyRateArray.GetCurrencyRateDTOArray(Index: Integer): CurrencyRateDTO;
begin
  Result := FRateArray[Index];
end;

function CurrencyRateArray.GetCurrencyRateDTOArrayLength: Integer;
begin
  if Assigned(FRateArray) then
    Result := Length(FRateArray)
  else
  Result := 0;
end;

destructor RealizationDTO.Destroy;
begin
  if Assigned(FGoods) then
    FGoods.Free;
  inherited Destroy;
end;

constructor RealizationsArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor RealizationsArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(FRealization)-1 do
    if Assigned(FRealization[I]) then
      FRealization[I].Free;
  SetLength(FRealization, 0);
  inherited Destroy;
end;

function RealizationsArray.GetRealizationDTOArray(Index: Integer): RealizationDTO;
begin
  Result := FRealization[Index];
end;

function RealizationsArray.GetRealizationDTOArrayLength: Integer;
begin
  if Assigned(FRealization) then
    Result := Length(FRealization)
  else
  Result := 0;
end;

destructor GetRealizationsResult.Destroy;
begin
  if Assigned(FElements) then
    FElements.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(AlgolPortType), 'algol1c', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(AlgolPortType), 'algol1c#Algol:%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(AlgolPortType), ioDocument);
  InvRegistry.RegisterExternalParamName(TypeInfo(AlgolPortType), 'UpdateAccount', 'Array_', 'Array');
  RemClassRegistry.RegisterXSInfo(TypeInfo(EDRPOU), 'algol1c', 'EDRPOU');
  RemClassRegistry.RegisterXSInfo(TypeInfo(INN), 'algol1c', 'INN');
  RemClassRegistry.RegisterXSInfo(TypeInfo(String12), 'algol1c', 'String12');
  RemClassRegistry.RegisterXSClass(OperationResult, 'algol1c', 'OperationResult');
  RemClassRegistry.RegisterXSClass(Address, 'algol1c', 'Address');
  RemClassRegistry.RegisterXSClass(ContragentDTO, 'algol1c', 'ContragentDTO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Contragent), 'algol1c', 'Contragent');
  RemClassRegistry.RegisterXSClass(ContragentArray, 'algol1c', 'ContragentArray');
  RemClassRegistry.RegisterSerializeOptions(ContragentArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(GetContragentResult, 'algol1c', 'GetContragentResult');
  RemClassRegistry.RegisterXSClass(Bank, 'algol1c', 'Bank');
  RemClassRegistry.RegisterXSClass(AccountDTO, 'algol1c', 'AccountDTO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Account), 'algol1c', 'Account');
  RemClassRegistry.RegisterXSClass(AccountArray, 'algol1c', 'AccountArray');
  RemClassRegistry.RegisterSerializeOptions(AccountArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(GoodsDTO, 'algol1c', 'GoodsDTO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Good), 'algol1c', 'Good');
  RemClassRegistry.RegisterXSClass(GoodsArray, 'algol1c', 'GoodsArray');
  RemClassRegistry.RegisterSerializeOptions(GoodsArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(InvoiceDTO, 'algol1c', 'InvoiceDTO');
  RemClassRegistry.RegisterXSClass(InvoiceStatusDTO, 'algol1c', 'InvoiceStatusDTO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(InvoiceStatus), 'algol1c', 'InvoiceStatus');
  RemClassRegistry.RegisterXSClass(InvoiceStatusArray, 'algol1c', 'InvoiceStatusArray');
  RemClassRegistry.RegisterSerializeOptions(InvoiceStatusArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(CurrencyRateDTO, 'algol1c', 'CurrencyRateDTO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(RateArray), 'algol1c', 'RateArray');
  RemClassRegistry.RegisterXSClass(CurrencyRateArray, 'algol1c', 'CurrencyRateArray');
  RemClassRegistry.RegisterSerializeOptions(CurrencyRateArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(RealizationDTO, 'algol1c', 'RealizationDTO');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Realization), 'algol1c', 'Realization');
  RemClassRegistry.RegisterXSClass(RealizationsArray, 'algol1c', 'RealizationsArray');
  RemClassRegistry.RegisterSerializeOptions(RealizationsArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(GetRealizationsResult, 'algol1c', 'GetRealizationsResult');
  RemClassRegistry.RegisterXSClass(ContractDTO, 'algol1c', 'ContractDTO');

end. 
