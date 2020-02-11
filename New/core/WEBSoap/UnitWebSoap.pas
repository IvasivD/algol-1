// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://sc008.studio-creative.com.ua/soap/exchangeservice.wsdl.php
// Encoding : utf-8
// Version  : 1.0
// (19.03.2018 15:45:25 - 1.33.2.5)
// ************************************************************************ //

unit UnitWebSoap;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;
{const
  defWSDL = 'http://sc008.studio-creative.com.ua/soap/exchangeservice.wsdl.php';
  defURL  = 'http://sc008.studio-creative.com.ua/soap/exchangeservice.php';
  defSvc  = 'ExchangeService';
  defPrt  = 'ExchangeServicePort';  }
type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:integer         - "http://www.w3.org/2001/XMLSchema"
  // !:base64Binary    - "http://www.w3.org/2001/XMLSchema"

  TableValue           = class;                 { "algolExchange" }
  TableArray           = class;                 { "algolExchange"[A] }
  InsertRequest        = class;                 { "algolExchange" }
  insertData           = class;                 { "algolExchange" }
  Response             = class;                 { "algolExchange" }
  DeleteRequest        = class;                 { "algolExchange" }
  deleteData           = class;                 { "algolExchange" }
  FieldValue           = class;                 { "algolExchange" }
  FieldArray           = class;                 { "algolExchange"[A] }
  StructureRequest     = class;                 { "algolExchange" }
  structureData        = class;                 { "algolExchange" }
  KeyValue             = class;                 { "algolExchange" }
  KeyArray             = class;                 { "algolExchange"[A] }
  ConstraintRequest    = class;                 { "algolExchange" }
  constraintData       = class;                 { "algolExchange" }
  IndexValue           = class;                 { "algolExchange" }
  IndexArray           = class;                 { "algolExchange"[A] }
  TableIndexes         = class;                 { "algolExchange" }
  createIndex          = class;                 { "algolExchange" }
  getAttachmentFile    = class;                 { "algolExchange" }
  importXml            = class;                 { "algolExchange" }



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  TableValue = class(TRemotable)
  private
    Fcode: WideString;
    Fvalue: WideString;
    Fcoding: integer;
  published
    property code: WideString read Fcode write Fcode;
    property value: WideString read Fvalue write Fvalue;
    property coding: integer read Fcoding write Fcoding;
  end;

  tblvalue   = array of TableValue;             { "algolExchange" }


  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  TableArray = class(TRemotable)
  private
    Ftblvalue: tblvalue;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetTableValueArray(Index: Integer): TableValue;
    function   GetTableValueArrayLength: Integer;
    property   TableValueArray[Index: Integer]: TableValue read GetTableValueArray; default;
    property   Len: Integer read GetTableValueArrayLength;
  published
    property tblvalue: tblvalue read Ftblvalue write Ftblvalue;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  InsertRequest = class(TRemotable)
  private
    Fid: WideString;
    Ftblname: WideString;
    Ftblarray: TableArray;
  public
    destructor Destroy; override;
  published
    property id: WideString read Fid write Fid;
    property tblname: WideString read Ftblname write Ftblname;
    property tblarray: TableArray read Ftblarray write Ftblarray;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  insertData = class(TRemotable)
  private
    Finsrequest: InsertRequest;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property insrequest: InsertRequest read Finsrequest write Finsrequest;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  Response = class(TRemotable)
  private
    Fstatus: integer;
  public
    constructor Create; override;
  published
    property status: integer read Fstatus write Fstatus;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  DeleteRequest = class(TRemotable)
  private
    Fid: WideString;
    Ftblname: WideString;
  published
    property id: WideString read Fid write Fid;
    property tblname: WideString read Ftblname write Ftblname;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  deleteData = class(TRemotable)
  private
    Fdelrequest: DeleteRequest;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property delrequest: DeleteRequest read Fdelrequest write Fdelrequest;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  FieldValue = class(TRemotable)
  private
    Fname: WideString;
    Ftype_: WideString;
    Fsize: integer;
    Fdescription: WideString;
    Fisnull: integer;
  published
    property name: WideString read Fname write Fname;
    property type_: WideString read Ftype_ write Ftype_;
    property size: integer read Fsize write Fsize;
    property description: WideString read Fdescription write Fdescription;
    property isnull: integer read Fisnull write Fisnull;
  end;

  fldvalue   = array of FieldValue;             { "algolExchange" }


  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  FieldArray = class(TRemotable)
  private
    Ffldvalue: fldvalue;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetFieldValueArray(Index: Integer): FieldValue;
    function   GetFieldValueArrayLength: Integer;
    property   FieldValueArray[Index: Integer]: FieldValue read GetFieldValueArray; default;
    property   Len: Integer read GetFieldValueArrayLength;
  published
    property fldvalue: fldvalue read Ffldvalue write Ffldvalue;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  StructureRequest = class(TRemotable)
  private
    Ftblname: WideString;
    Fprimarykey: WideString;
    Ffldarray: FieldArray;
  public
    destructor Destroy; override;
  published
    property tblname: WideString read Ftblname write Ftblname;
    property primarykey: WideString read Fprimarykey write Fprimarykey;
    property fldarray: FieldArray read Ffldarray write Ffldarray;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  structureData = class(TRemotable)
  private
    Fstrucrequest: StructureRequest;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property strucrequest: StructureRequest read Fstrucrequest write Fstrucrequest;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  KeyValue = class(TRemotable)
  private
    Fname: WideString;
    Fmaintblname: WideString;
    Fmaintblfldname: WideString;
    Ftblname: WideString;
    Ftblfldname: WideString;
    Fcascadedelete: integer;
  published
    property name: WideString read Fname write Fname;
    property maintblname: WideString read Fmaintblname write Fmaintblname;
    property maintblfldname: WideString read Fmaintblfldname write Fmaintblfldname;
    property tblname: WideString read Ftblname write Ftblname;
    property tblfldname: WideString read Ftblfldname write Ftblfldname;
    property cascadedelete: integer read Fcascadedelete write Fcascadedelete;
  end;

  kyvalue    = array of KeyValue;               { "algolExchange" }


  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  KeyArray = class(TRemotable)
  private
    Fkyvalue: kyvalue;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetKeyValueArray(Index: Integer): KeyValue;
    function   GetKeyValueArrayLength: Integer;
    property   KeyValueArray[Index: Integer]: KeyValue read GetKeyValueArray; default;
    property   Len: Integer read GetKeyValueArrayLength;
  published
    property kyvalue: kyvalue read Fkyvalue write Fkyvalue;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  ConstraintRequest = class(TRemotable)
  private
    Fkyarray: KeyArray;
  public
    destructor Destroy; override;
  published
    property kyarray: KeyArray read Fkyarray write Fkyarray;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  constraintData = class(TRemotable)
  private
    Fconstrequest: ConstraintRequest;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property constrequest: ConstraintRequest read Fconstrequest write Fconstrequest;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  IndexValue = class(TRemotable)
  private
    FIndexName: WideString;
    FTableName: WideString;
    FDescription: WideString;
    FFieldName: WideString;
  published
    property IndexName: WideString read FIndexName write FIndexName;
    property TableName: WideString read FTableName write FTableName;
    property Description: WideString read FDescription write FDescription;
    property FieldName: WideString read FFieldName write FFieldName;
  end;

  ixvalue    = array of IndexValue;             { "algolExchange" }


  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoInlineArrays]
  // ************************************************************************ //
  IndexArray = class(TRemotable)
  private
    Fixvalue: ixvalue;
  public
    constructor Create; override;
    destructor Destroy; override;
    function   GetIndexValueArray(Index: Integer): IndexValue;
    function   GetIndexValueArrayLength: Integer;
    property   IndexValueArray[Index: Integer]: IndexValue read GetIndexValueArray; default;
    property   Len: Integer read GetIndexValueArrayLength;
  published
    property ixvalue: ixvalue read Fixvalue write Fixvalue;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  TableIndexes = class(TRemotable)
  private
    Fixarray: IndexArray;
  public
    destructor Destroy; override;
  published
    property ixarray: IndexArray read Fixarray write Fixarray;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // Serializtn: [xoLiteralParam]
  // ************************************************************************ //
  createIndex = class(TRemotable)
  private
    Fixrequest: TableIndexes;
  public
    constructor Create; override;
    destructor Destroy; override;
  published
    property ixrequest: TableIndexes read Fixrequest write Fixrequest;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  getAttachmentFile = class(TRemotable)
  private
    Ffilename: WideString;
    Fpath: WideString;
    Ffiles: TByteDynArray;
  published
    property filename: WideString read Ffilename write Ffilename;
    property path: WideString read Fpath write Fpath;
    property files: TByteDynArray read Ffiles write Ffiles;
  end;



  // ************************************************************************ //
  // Namespace : algolExchange
  // ************************************************************************ //
  importXml = class(TRemotable)
  private
    Ftblname: WideString;
    Fxmlcontent: TByteDynArray;
  published
    property tblname: WideString read Ftblname write Ftblname;
    property xmlcontent: TByteDynArray read Fxmlcontent write Fxmlcontent;
  end;


  // ************************************************************************ //
  // Namespace : algolExchange
  // soapAction: algolExchange#ExchangeWsdl:%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : ExchangeServiceBinding
  // service   : ExchangeService
  // port      : ExchangeServicePort
  // URL       : http://sc008.studio-creative.com.ua/soap/exchangeservice.php
  // ************************************************************************ //
  ExchangeServicePortType = interface(IInvokable)
  ['{D80D49B3-EF9A-A226-0D2F-FB73F251ECA5}']
    function  importXml(const Request: importXml): Response; stdcall;
    function  getAttachmentFile(const Request: getAttachmentFile): Response; stdcall;
    function  insertData(const Request: insertData): Response; stdcall;
    function  deleteData(const Request: deleteData): Response; stdcall;
    function  structureData(const Request: structureData): Response; stdcall;
    function  constraintData(const Request: constraintData): Response; stdcall;
    function  createIndex(const Request: createIndex): Response; stdcall;
  end;

function GetExchangeServicePortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ExchangeServicePortType;


implementation

function GetExchangeServicePortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ExchangeServicePortType;
const
  defWSDL = 'http://sc008.studio-creative.com.ua/soap/exchangeservice.wsdl.php';
  defURL  = 'http://sc008.studio-creative.com.ua/soap/exchangeservice.php';
  defSvc  = 'ExchangeService';
  defPrt  = 'ExchangeServicePort';
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
    Result := (RIO as ExchangeServicePortType);
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


constructor TableArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor TableArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Ftblvalue)-1 do
    if Assigned(Ftblvalue[I]) then
      Ftblvalue[I].Free;
  SetLength(Ftblvalue, 0);
  inherited Destroy;
end;

function TableArray.GetTableValueArray(Index: Integer): TableValue;
begin
  Result := Ftblvalue[Index];
end;

function TableArray.GetTableValueArrayLength: Integer;
begin
  if Assigned(Ftblvalue) then
    Result := Length(Ftblvalue)
  else
  Result := 0;
end;

destructor InsertRequest.Destroy;
begin
  if Assigned(Ftblarray) then
    Ftblarray.Free;
  inherited Destroy;
end;

constructor insertData.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor insertData.Destroy;
begin
  if Assigned(Finsrequest) then
    Finsrequest.Free;
  inherited Destroy;
end;

constructor Response.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

constructor deleteData.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor deleteData.Destroy;
begin
  if Assigned(Fdelrequest) then
    Fdelrequest.Free;
  inherited Destroy;
end;

constructor FieldArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor FieldArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Ffldvalue)-1 do
    if Assigned(Ffldvalue[I]) then
      Ffldvalue[I].Free;
  SetLength(Ffldvalue, 0);
  inherited Destroy;
end;

function FieldArray.GetFieldValueArray(Index: Integer): FieldValue;
begin
  Result := Ffldvalue[Index];
end;

function FieldArray.GetFieldValueArrayLength: Integer;
begin
  if Assigned(Ffldvalue) then
    Result := Length(Ffldvalue)
  else
  Result := 0;
end;

destructor StructureRequest.Destroy;
begin
  if Assigned(Ffldarray) then
    Ffldarray.Free;
  inherited Destroy;
end;

constructor structureData.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor structureData.Destroy;
begin
  if Assigned(Fstrucrequest) then
    Fstrucrequest.Free;
  inherited Destroy;
end;

constructor KeyArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor KeyArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fkyvalue)-1 do
    if Assigned(Fkyvalue[I]) then
      Fkyvalue[I].Free;
  SetLength(Fkyvalue, 0);
  inherited Destroy;
end;

function KeyArray.GetKeyValueArray(Index: Integer): KeyValue;
begin
  Result := Fkyvalue[Index];
end;

function KeyArray.GetKeyValueArrayLength: Integer;
begin
  if Assigned(Fkyvalue) then
    Result := Length(Fkyvalue)
  else
  Result := 0;
end;

destructor ConstraintRequest.Destroy;
begin
  if Assigned(Fkyarray) then
    Fkyarray.Free;
  inherited Destroy;
end;

constructor constraintData.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor constraintData.Destroy;
begin
  if Assigned(Fconstrequest) then
    Fconstrequest.Free;
  inherited Destroy;
end;

constructor IndexArray.Create;
begin
  inherited Create;
  FSerializationOptions := [xoInlineArrays];
end;

destructor IndexArray.Destroy;
var
  I: Integer;
begin
  for I := 0 to Length(Fixvalue)-1 do
    if Assigned(Fixvalue[I]) then
      Fixvalue[I].Free;
  SetLength(Fixvalue, 0);
  inherited Destroy;
end;

function IndexArray.GetIndexValueArray(Index: Integer): IndexValue;
begin
  Result := Fixvalue[Index];
end;

function IndexArray.GetIndexValueArrayLength: Integer;
begin
  if Assigned(Fixvalue) then
    Result := Length(Fixvalue)
  else
  Result := 0;
end;

destructor TableIndexes.Destroy;
begin
  if Assigned(Fixarray) then
    Fixarray.Free;
  inherited Destroy;
end;

constructor createIndex.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

destructor createIndex.Destroy;
begin
  if Assigned(Fixrequest) then
    Fixrequest.Free;
  inherited Destroy;
end;

initialization
  InvRegistry.RegisterInterface(TypeInfo(ExchangeServicePortType), 'algolExchange', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ExchangeServicePortType), 'algolExchange#ExchangeWsdl:%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ExchangeServicePortType), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(ExchangeServicePortType), ioLiteral);
  RemClassRegistry.RegisterXSClass(TableValue, 'algolExchange', 'TableValue');
  RemClassRegistry.RegisterXSInfo(TypeInfo(tblvalue), 'algolExchange', 'tblvalue');
  RemClassRegistry.RegisterXSClass(TableArray, 'algolExchange', 'TableArray');
  RemClassRegistry.RegisterSerializeOptions(TableArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(InsertRequest, 'algolExchange', 'InsertRequest');
  RemClassRegistry.RegisterXSClass(insertData, 'algolExchange', 'insertData');
  RemClassRegistry.RegisterSerializeOptions(insertData, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(Response, 'algolExchange', 'Response');
  RemClassRegistry.RegisterSerializeOptions(Response, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(DeleteRequest, 'algolExchange', 'DeleteRequest');
  RemClassRegistry.RegisterXSClass(deleteData, 'algolExchange', 'deleteData');
  RemClassRegistry.RegisterSerializeOptions(deleteData, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(FieldValue, 'algolExchange', 'FieldValue');
  RemClassRegistry.RegisterExternalPropName(TypeInfo(FieldValue), 'type_', 'type');
  RemClassRegistry.RegisterXSInfo(TypeInfo(fldvalue), 'algolExchange', 'fldvalue');
  RemClassRegistry.RegisterXSClass(FieldArray, 'algolExchange', 'FieldArray');
  RemClassRegistry.RegisterSerializeOptions(FieldArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(StructureRequest, 'algolExchange', 'StructureRequest');
  RemClassRegistry.RegisterXSClass(structureData, 'algolExchange', 'structureData');
  RemClassRegistry.RegisterSerializeOptions(structureData, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(KeyValue, 'algolExchange', 'KeyValue');
  RemClassRegistry.RegisterXSInfo(TypeInfo(kyvalue), 'algolExchange', 'kyvalue');
  RemClassRegistry.RegisterXSClass(KeyArray, 'algolExchange', 'KeyArray');
  RemClassRegistry.RegisterSerializeOptions(KeyArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(ConstraintRequest, 'algolExchange', 'ConstraintRequest');
  RemClassRegistry.RegisterXSClass(constraintData, 'algolExchange', 'constraintData');
  RemClassRegistry.RegisterSerializeOptions(constraintData, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(IndexValue, 'algolExchange', 'IndexValue');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ixvalue), 'algolExchange', 'ixvalue');
  RemClassRegistry.RegisterXSClass(IndexArray, 'algolExchange', 'IndexArray');
  RemClassRegistry.RegisterSerializeOptions(IndexArray, [xoInlineArrays]);
  RemClassRegistry.RegisterXSClass(TableIndexes, 'algolExchange', 'TableIndexes');
  RemClassRegistry.RegisterXSClass(createIndex, 'algolExchange', 'createIndex');
  RemClassRegistry.RegisterSerializeOptions(createIndex, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(getAttachmentFile, 'algolExchange', 'getAttachmentFile');
  RemClassRegistry.RegisterXSClass(importXml, 'algolExchange', 'importXml');

end.
