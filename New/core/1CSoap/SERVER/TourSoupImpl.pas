{ Invokable implementation File for TTourSoup which implements ITourSoup }

unit TourSoupImpl;

interface

uses InvokeRegistry, TourSoupIntf,Classes,EncdDecd,SysUtils,Dialogs,
     UnitPaymentBilling,DMSoapData,Types,UnitProc,cxDBTL,cxTL;


type
  TTourDTO  = class(TRemotable)
    private
      FFieldName:WideString;
      FFieldValue:Variant;
    public
      property FieldName: WideString read FFieldName;
      property FieldValue: Variant read FFieldValue;
    end;

  TTourData       = array of TTourDTO;               { "algol1c" }



  { TTourSoup }
  TTourSoup = class(TInvokableClass, ITourSoup)
  private

    //FTableName:WideString;
    //FIDFielldName:WideString;
    //FLogin :WideString;
    //FPassword:WideString;
    //FConnectDB:WideString;

    //FData: TTourData;
    //procedure SetTableName(const Value: WideString);
    //procedure SetIDFielldName(const Value: WideString);
    //procedure SetLogin(const Value: WideString);
    //procedure SetPassword(const Value: WideString);
    //procedure SetConnectDB(const Value: WideString);

    function FGetDescriptionErrorByCode(codeError:Integer):Widestring;
  public
    function CheckInvoice(UserName,Password:WideString; codeid1c:Widestring;PayDate:TDateTime):TToutInvoiceDTO;stdcall;
    function CheckInvoice1( UserName, Password:WideString; codeid1c:Widestring; PayDate:Widestring ) : TToutInvoiceDTO; stdcall;
    function GetPathDB:Widestring;stdcall;
    function CreateUserSoap( UserData:TTourUserData;  AccesKey:Widestring ) : Integer; stdcall;
    function CheckUserEmail( EDRPO, Email, Key:Widestring ):Boolean; stdcall;
    //function CreateUserSoap( UserName, Password:WideString; AccesKey:Widestring ) : Integer;
    //function TestTSoap(const Value1,Value2:Integer):Integer; stdcall;
    //function TestCopyFile(FileBaseCode: String):integer;stdcall;
    function GetAttachmentFile( files: TSoapAttachment): Integer;stdcall;
    function UpdateBillingData( MenId:Integer; UserName,Password :WideString; aBank:TBankSoap; PaymentBillingData: TPaymentBillingData ):integer;stdcall;

    function DBBanks: TByteDynArray; stdcall;
    function DBBanks2: String;stdcall;
    function GetTourGroupRate( Login,Password:String; TourGrRateParam : TTourGroupRateInputParam;  FormatData : Integer ) : String; stdcall;
    function GetCountriesList( Login, Password:String; idLng:integer; FormatData : Integer ):String; stdcall;
    function GetCountryInfo( Login,Password:String; id, idLng:integer; FormatData : Integer ):String; stdcall;
    function GetLanguages( Login,Password:String; idLng:integer; ActiveTranslate:integer; FormatData:Integer ):string; stdcall;
    function GetClientData(  Login,Password:String; IdClient:Integer; FormatData:Integer ):String;stdcall;
    function CheckClientByEDRPO(  Login,Password:String; EDRPOU:Widestring; FormatData:Integer ):String;stdcall;

    function GetRateTourGroupOnDate_Old( Login,Password:String; TourId,TouristAge:Integer; aDate:TDateTime; FormatData:Integer ):String; stdcall;
    function GetAllServicesRateTourGroupOnDate_Old( Login,Password:String; TourGroupId,Age:Integer; aDate:TDateTime;Hidden:Integer; FormatData:Integer ):String;stdcall;
    //function DBBanks:OleVariant;stdcall;
    //function UpdateDataTable(TableName,IDFiedl:string; Data:TTourData):Integer; stdcall;

    //property Data: TTourData read FData write FData;
    //property TableName:WideString read FTableName write SetTableName;
    //property IDFielldName:WideString read FIDFielldName write SetIDFielldName;
    //property Login:WideString read FLogin write SetLogin;
    //property Password:WideString read FPassword write SetPassword;
   // property ConnectDB:WideString read FConnectDB write SetConnectDB;
  end;

implementation
uses  DMTourSoap;

procedure ConvertBase64ToFile( CodeStrBase64:Widestring; SaveToFileName:String);
var
  Fs : TFileStream;
  S : AnsiString;
begin
  Fs := TFileStream.Create(SaveToFileName, fmCreate);
  S := DecodeString( Trim(CodeStrBase64) );
  try
    Fs.Write(S[1], Length(S));
  finally
    FreeAndNil(Fs);
  end;
end;
//******************************************************************************
function TTourSoup.GetAttachmentFile(files: TSoapAttachment): Integer;
begin
  result:=-1;
  try
    files.SaveToFile( 'D:\TEST\'+files.ContentType );
    if files<>nil then result :=0;
  finally
    files.Free;
  end;
end;

function TTourSoup.FGetDescriptionErrorByCode(codeError:Integer):Widestring;
begin
  if codeError =-1 then result :='Нема Зв''язку з сервером (або Логін чи пароль введено не вірно)';
  if codeError = 0 then result :='Можна оплачувати';
  if codeError = 1 then result :='Не можна Оплатити';
  if codeError = 2 then result :='Не знайдено Рахунку по id з 1С ';
  if codeError = 3 then result :='Невірний формат дати і часу ';
end;

function TTourSoup.CheckInvoice(UserName,Password:WideString; codeid1c:Widestring; PayDate:TDateTime ):TToutInvoiceDTO;stdcall;
begin
  result := TToutInvoiceDTO.Create;
  if PayDate <> -1 then
    result.Code := WebDM.CheckInvoice( UserName, Password, codeid1c, PayDate )
  else
    result.Code := 3;

  result.Description := FGetDescriptionErrorByCode( result.Code );  
end;

function TTourSoup.CheckInvoice1(UserName, Password, codeid1c, PayDate: Widestring): TToutInvoiceDTO; stdcall;
var NewPayDate :TDateTime;
begin
  NewPayDate := ParseDateTimeFromStr( PayDate );
  result := CheckInvoice( UserName, Password, codeid1c, NewPayDate )
end;

function TTourSoup.GetPathDB:Widestring;stdcall;
begin
  result := WebDM.GetPathDB;
end;

function TTourSoup.UpdateBillingData( MenId:Integer; UserName, Password: WideString; aBank:TBankSoap;
  PaymentBillingData: TPaymentBillingData): integer;   stdcall;
begin
  if aBank <> nil then
    WebDM.UpdateBankData(MenId, UserName, Password, aBank );
    
  result := WebDM.UpdateBillingData( UserName, Password, PaymentBillingData );
end;

function TTourSoup.CheckUserEmail( EDRPO, Email, Key: Widestring ) : Boolean;
begin
  result:= WebDM.CheckUserEmail( EDRPO, Email, Key );
end;

function TTourSoup.CreateUserSoap( UserData: TTourUserData; AccesKey: Widestring ): Integer;
begin
  //*****************
end;

function TTourSoup.DBBanks: TByteDynArray;stdcall;
begin
  result := WebDM.GetBankXML;
end;

function TTourSoup.DBBanks2: String;stdcall;
begin
  result := WebDM.GetBankXML2;
end;

function TTourSoup.GetTourGroupRate( Login,Password:String; TourGrRateParam : TTourGroupRateInputParam;  FormatData : Integer ): String;
begin
  result := WebDM.GetTourGroupRate( Login, Password, TourGrRateParam, FormatData ) ;
end;

function TTourSoup.GetCountriesList( Login, Password:String; idLng:Integer; FormatData : Integer ):string;
begin
  Result := WebDM.GetCountriesList( Login,Password, idLng, FormatData );
end;

function TTourSoup.GetCountryInfo( Login, Password:String; id,idLng:integer; FormatData : Integer ):string;
begin
  Result := WebDM.GetCountryInfo( Login,Password, id, idLng, FormatData );
end;

function TTourSoup.GetRateTourGroupOnDate_Old( Login, Password:String; TourId,TouristAge:Integer; aDate:TDateTime; FormatData : Integer ):String;
begin
  Result := WebDM.GetRateTourGroupOnDate_Old( Login, Password, TourId,TouristAge, aDate, FormatData );
end;

function TTourSoup.GetAllServicesRateTourGroupOnDate_Old( Login,Password:String; TourGroupId, Age:Integer; aDate:TDateTime; Hidden:Integer; FormatData:Integer ):String;
begin
  Result := WebDM.GetAllServicesRateTourGroupOnDate_Old( Login, Password, TourGroupId, Age, aDate, Hidden, FormatData );
end;

function TTourSoup.GetClientData(  Login,Password:String; IdClient:Integer;  FormatData:Integer ):String;
begin
  Result := WebDM.GetClientData( Login,Password, IdClient, FormatData );
end;

function TTourSoup.CheckClientByEDRPO(  Login,Password:String; EDRPOU:Widestring; FormatData:Integer ):String;
begin
  Result := WebDM.CheckClientByEDRPO( Login,Password, EDRPOU, FormatData );
end;

function TTourSoup.GetLanguages(Login, Password: String; idLng,
  ActiveTranslate, FormatData: Integer): string;
begin
  Result := WebDM.GetLanguages(Login, Password,  idLng, ActiveTranslate, FormatData );
end;

initialization
  { Invokable classes must be registered }
  InvRegistry.RegisterInvokableClass( TTourSoup );

end.
 