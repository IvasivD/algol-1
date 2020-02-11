unit UnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls , ITourSoup1, SOAPHTTPClient,EncdDecd,  InvokeRegistry,
  SOAPHTTPTrans,IdMultipartFormData,XSBuiltIns, UnitADOQuery,UnitApiSite, UnitSQLData,
  DateUtils, DB, DBClient, Provider, Grids, DBGrids, SOAPConn, ADODB,Types,UnitProc,Clipbrd,UnitSqlDB,
  UnitIBQuery;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ClientDBBank: TClientDataSet;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSetProvider1: TDataSetProvider;
    SoapConnection1: TSoapConnection;
    ADODataBank: TADODataSet;
    Button9: TButton;
    Button10: TButton;
    Memo1: TMemo;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    ADODataSet1: TADODataSet;
    ADOConnection: TADOConnection;
    Button19: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Res:integer;
    HTTPRIO : THTTPRIO;
begin
   HTTPRIO := THTTPRIO.Create( nil );

   //HTTPRIO.HTTPWebNode.UserName := 'Guest';
   //HTTPRIO.HTTPWebNode.Password := 'Soap1234567';
   HTTPRIO.URL:='http://localhost/TourSoap/TourSoap.dll/soap/ITourSoup';
   //Res:= (HTTPRIO as ITourSoup).TestTSoap( 10 , 5 );
   //Res:= Res+(HTTPRIO as ITourSoup).UpadteBankAccount( '2221323424', '345673');
   HTTPRIO.Free;
   ShowMessage( IntToStr(Res));
end;

procedure TForm1.Button3Click(Sender: TObject);
var Res:integer;
    HTTPRIO : THTTPRIO;
    ResSoap : TToutInvoiceDTO;
    aDateTime : TXSDateTime;
    Code:WideString;
begin
   HTTPRIO := THTTPRIO.Create( nil );

   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.HTTPWebNode.UserName := 'SYSDBA';
   //HTTPRIO.HTTPWebNode.Password := 'masterkey';
   //http://192.168.0.97:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';

   aDateTime:= TXSDateTime.Create;
   {aDateTime.Year:=2018;
   aDateTime.Month:=5;
   aDateTime.Day:=22;
   aDateTime.Hour := 23;
   aDateTime.Minute := 59;
   aDateTime.Second := 59;  }

   aDateTime.AsDateTime := StrToDateTime('22.05.2018 23:59:59');//'';Now;

  // ResSoap := (HTTPRIO as ITourSoup).CheckInvoice( '1CUSER', 'Robot1111111', '04f15bac-5a74-11e8-9533-5404a6b20278', aDateTime );   //Robot1111111

   ShowMessage( IntToStr( ResSoap.Code ) );

   aDateTime.Free;
   ResSoap.Free;
   HTTPRIO:= nil;
end;

procedure TForm1.Button5Click(Sender: TObject);
var HTTPRIO : THTTPRIO;
    ResSoap:WideString;
begin
  HTTPRIO := THTTPRIO.Create( nil );
  HTTPRIO.HTTPWebNode.UserName := '1CUSER';
  HTTPRIO.HTTPWebNode.Password := 'Robot1111111';

  //HTTPRIO.URL:='http://192.168.0.97:10080/TourSoap/TourSoap.dll/soap/ITourSoup';
  HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';
  ResSoap := (HTTPRIO as ITourSoup).GetPathDB;
  ShowMessage( ResSoap );
  HTTPRIO:= nil;
end;

Function ConvertFileToBase64(FileName:String):Widestring;
var
  Fs : TFileStream;
  S : AnsiString;
  ExtFile:WideString;
begin
  if not FileExists(FileName) then Exit;

  Fs := TFileStream.Create(FileName, fmOpenRead + fmShareDenyWrite);
  try
    SetLength(S, Fs.Size);
    Fs.Read(S[1], Fs.Size);
  finally
    FreeAndNil(Fs);
  end;
 
  result := EncodeString(S);
  {if ForHtml then
  begin
   ExtFile:=ExtractFileExt(FileName);
   replaseOn( ExtFile, '.','');
   result:= 'data:image/'+ ExtFile+';base64,'+result;
  end;}
end;
//******************************************************************************

procedure TForm1.Button2Click(Sender: TObject);
var fileName:String;
    FileCodeBase64:String;
    Res:integer;
    HTTPRIO : THTTPRIO;
begin
   fileName :='D:\TEST\test2.mp4';
   FileCodeBase64 := 'xsd:base64Binary,'+ConvertFileToBase64( FileName );
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.URL:='http://localhost/TourSoap/TourSoap.dll/soap/ITourSoup';



   //Res:= (HTTPRIO as ITourSoup).TestCopyFile( FileCodeBase64 );
   HTTPRIO.Free;
   ShowMessage( IntToStr(Res));

end;

function GetBinaryFile(fileName:String): TSOAPAttachment; stdcall;
var
  FileStream: TMemoryStream;
begin
  Result := TSOAPAttachment.Create;
  Result.SetSourceFile(fileName);
  Result.ContentType:=ExtractFileName(fileName);
  //Result.SourceString := ExtractFileName(fileName);
  // Result.ContentType := 'image/png';
end;

procedure TForm1.Button4Click(Sender: TObject);
var fileName:String;
    Res:integer;
    HTTPRIO : THTTPRIO;
    att:TSOAPAttachment;
    FileStream : TFileStream;
begin
 try
  if OpenDialog1.Execute then
  begin
    fileName :=OpenDialog1.FileName; //'D:\TEST\testе.mp4';       // test2.mp4

    HTTPRIO := THTTPRIO.Create( nil );
    HTTPRIO.URL:='http://localhost/TourSoap/TourSoap.dll/soap/ITourSoup';

    att:= GetBinaryFile( fileName );
    //Res:= (HTTPRIO as ITourSoup).GetAttachmentFile( att );//GetBinaryFile(fileName)
    ShowMessage(IntToStr(Res));
  end;
 finally
  //att.Free;
  HTTPRIO.Free;
 end;
end;


function GetBillingData :TPaymentBillingData;
var aDateTime:TXSDateTime;
begin
  aDateTime:= TXSDateTime.Create;
  aDateTime.AsDateTime := Now;

  result:=TPaymentBillingData.Create;
  result.OrderId := 171960;
  result.ExchCurrId := 75;
  result.BillingNo := 1;
  result.TotalSum :=  12345.89;
  result.PayMethod := 1;
  result.ManagerId := 1;
  result.BillNo :=  '555';// номер платіжного доручення
  result.BillDate := aDateTime;
  result.DocTypeId := 0;
end;


procedure TForm1.Button6Click(Sender: TObject);
var BillingData:TPaymentBillingData;
   HTTPRIO : THTTPRIO;

   res:Integer;
begin
   HTTPRIO := THTTPRIO.Create( nil );

   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoap/TourSoap.dll/soap/ITourSoup';

   try
     BillingData := GetBillingData;

     //res := (HTTPRIO as ITourSoup).UpdateBillingData(0, '1CUSER', 'Robot1111111', BillingData );
   finally

     BillingData.Free;
     BillingData := nil;
   end;
   HTTPRIO:= nil;

   //ShowMessage( IntToStr( res ) );
end;

procedure TForm1.Button7Click(Sender: TObject);
var BillingData:TPaymentBillingData;
   HTTPRIO : THTTPRIO;

   res:Boolean;
begin
   HTTPRIO := THTTPRIO.Create( nil );

   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://192.168.0.4:10080/TourSoap/TourSoap.dll/soap/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';

   //HTTPRIO.URL:='http://194.44.223.214:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   //HTTPRIO.URL:='http://localhost/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   //HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/soap/ITourSoup';

   try
     BillingData := GetBillingData;

     res := (HTTPRIO as ITourSoup).CheckUserEmeil( '31363710', 'green@piligrim.lviv.net', 'e3e7d8e835d3a86f29d72df3' );
     if res then ShowMessage('is Ok');

   finally
     BillingData.Free;
     BillingData := nil;
   end;
   HTTPRIO:= nil;

   //ShowMessage( IntToStr( res ) );
end;

function ConvertDynArrToString(P: TByteDynArray): string;
var
  Buffer: AnsiString;
begin
  //SetLength(Buffer, Length(P));
  //System.Move(P[0], Buffer[1], Length(P));
  //Result := EncodeString(Buffer);
  SetString(result, PAnsiChar(@P[0]), Length(P));
end;

procedure TForm1.Button8Click(Sender: TObject);
var BillingData:TPaymentBillingData;
   HTTPRIO : THTTPRIO;

   aDataArr:TByteDynArray;
   Str:String;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/soap/ITourSoup';

   try
     BillingData := GetBillingData;

     //aDataArr := (HTTPRIO as ITourSoup).DBBanks;

     aDataArr := (HTTPRIO as ITourSoup).DBBanks;
     ADODataBank.Recordset :=  RecordsetFromXML( ConvertDynArrToString( aDataArr ) );
     DataSource1.DataSet := ADODataBank;
   finally
     BillingData.Free;
     BillingData := nil;
   end;
   HTTPRIO:= nil;

end;

procedure TForm1.Button9Click(Sender: TObject);
var DB:TADODataset;
begin
   DB := UnitADOQuery.CreateDataSet('alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB','SYSDBA','masterkey','select * from BANKS');
   DataSource1.DataSet := DB;
   //UnitADOQuery.DestroyDS(DB);
end;

procedure TForm1.Button10Click(Sender: TObject);
var BillingData:TPaymentBillingData;
   HTTPRIO : THTTPRIO;

   aDataArr:TByteDynArray;
   param:TTourGroupRateInputParam;
   Str:String;
   aListSave:TStringList;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/soap/ITourSoup';

   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';

   {HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoap/TourSoap.dll/soap/ITourSoup'; }

   try
     param := TTourGroupRateInputParam.Create;
     param.isAgent := True;

     param.DateStart := TXSDateTime.create;
     param.DateStart.AsDateTime := EncodeDate(2018, 08, 08); //StrToDate('08.08.2018 00:00:00');

     param.DateEnd := TXSDateTime.create;
     param.DateEnd.AsDateTime := EncodeDate(2019, 08, 08);

     param.DatePay := TXSDateTime.create;
     param.DatePay.AsDateTime := EncodeDate(2018, 08, 08);

     param.JustWithRate := 0;
     param.idLng := 448;
     param.CategoryOrder := 0;
     param.Age := -1;
     param.IdTour := -1;
     param.StartRec := 1;
     param.CountRec := 30;


     Str := (HTTPRIO as ITourSoup).GetTourGroupRate( '1CUSER', 'Robot1111111', param, 0 ); // Test
     //Str := (HTTPRIO as ITourSoup).GetTourGroupRate( 'SYSDBA', 'masterkey', param, 1 );

     aListSave:=TStringList.Create;
     aListSave.Text := UTF8Decode( Str );
     aListSave.SaveToFile( ExtractFilePath(Application.ExeName) +'Result.txt' );
     //ShowMessage( Str );
     //ADODataBank.Recordset :=  RecordsetFromXML( ConvertDynArrToString( aDataArr ) );
     //DataSource1.DataSet := ADODataBank;

     Memo1.Text :=  aListSave.Text;
   finally
     BillingData.Free;
     BillingData := nil;
     param.free;
   end;
   aListSave.Free;
   HTTPRIO:= nil;

end;

procedure TForm1.Button11Click(Sender: TObject);
var BillingData:TPaymentBillingData;
   HTTPRIO : THTTPRIO;

   Str:String;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';

   try

     Str := (HTTPRIO as ITourSoup).GetCountriesList( '1CUSER', 'Robot1111111', 448, 0);   //'1CUSER', 'Robot1111111',
     Memo1.Text :=UTF8Decode( Str );
   finally

   end;
   HTTPRIO:= nil;
end;



procedure TForm1.Button13Click(Sender: TObject);
var HTTPRIO : THTTPRIO;
   Str:String;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';

   try

     Str := (HTTPRIO as ITourSoup).GetCountryInfo( '1CUSER', 'Robot1111111', 1, 448, 0);   //'1CUSER', 'Robot1111111',
     Memo1.Text :=UTF8Decode( Str );
   finally

   end;
   HTTPRIO:= nil;
end;

procedure TForm1.Button14Click(Sender: TObject);
var HTTPRIO : THTTPRIO;
   Str:String;
   aDate:TXSDateTime;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';

   //HTTPRIO.URL:='http://192.168.0.4:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoap/TourSoap.dll/soap/ITourSoup';
   //HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';
   try
     aDate := TXSDateTime.Create;
     aDate.Year := 2019;
     aDate.Month := 4;
     aDate.Day := 8;

     Str := (HTTPRIO as ITourSoup).GetRateTourGroupOnDate_Old( '1CUSER', 'Robot1111111', 1055,35, aDate,  0);   //'1CUSER', 'Robot1111111',
     //Str := (HTTPRIO as ITourSoup).GetRateTourGroupOnDate_Old( 'SYSDBA', 'HonzOKey', 840,35, aDate,  0);   //'1CUSER', 'Robot1111111',


     Memo1.Text := Str;

     Memo1.Text :=UTF8Decode( Str );
   finally
     aDate.Free;

   end;
   HTTPRIO:= nil;

end;


procedure TForm1.Button15Click(Sender: TObject);
var HTTPRIO : THTTPRIO;
   Str:String;
   aDate:TXSDateTime;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';

   try
     aDate := TXSDateTime.Create;
     aDate.Year := 2019;
     aDate.Month := 4;
     aDate.Day := 8;

     Str := (HTTPRIO as ITourSoup).GetLanguages( '1CUSER', 'Robot1111111', 448, 0, 0);   //'1CUSER', 'Robot1111111',
     Memo1.Text := UTF8Decode( Str );

   finally
     aDate.Free;

   end;
   HTTPRIO:= nil;
end;

procedure TForm1.Button12Click(Sender: TObject);
var aDate:TXSDateTime;
begin
   aDate := TXSDateTime.Create;

   //aDate.AsDateTime := now;
   aDate.XSToNative( '2019-10-11T08:30:00.000+03:00' );
   //aDate.XSToNative('dd');

   ShowMessage( IntToStr( aDate.Year ) );

   aDate.Free;
end;


procedure TForm1.Button16Click(Sender: TObject);
var HTTPRIO : THTTPRIO;
   Str:String;
   aDate:TXSDateTime;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://localhost:10080/TourSoap/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoap/TourSoap.dll/soap/ITourSoup';

   try
     aDate := TXSDateTime.Create;
     aDate.Year := 2019;
     aDate.Month := 8;
     aDate.Day := 14;

     Str := (HTTPRIO as ITourSoup).GetAllServicesRateTourGroupOnDate_Old( '1CUSER', 'Robot1111111' , 41810, 35, aDate, 1,  0);   //'1CUSER', 'Robot1111111',      '1CUSER', 'Robot1111111'
     Memo1.Text := Str;

     Memo1.Text :=UTF8Decode( Str );
   finally
     aDate.Free;

   end;
   HTTPRIO:= nil;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Memo1.SelectAll;
  Memo1.SetFocus;
end;

procedure TForm1.Button18Click(Sender: TObject);
var HTTPRIO : THTTPRIO;
   Str:String;
   aDate:TXSDateTime;
   Sql:string;
   DBClient:TDataset;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';
   //Str := (HTTPRIO as ITourSoup).GetClientData( '1CUSER', 'Robot1111111', '19161852', 0 );   //'1CUSER', 'Robot1111111',
   Str := (HTTPRIO as ITourSoup).GetClientData( 'SYSDBA', 'masterkey', 36826, 0 );


     Memo1.Text := UTF8Decode( Str );

   HTTPRIO:= nil;


end;

procedure TForm1.Button19Click(Sender: TObject);
var HTTPRIO : THTTPRIO;
   Str:String;
   aDate:TXSDateTime;
   Sql:string;
   DBClient:TDataset;
begin
   HTTPRIO := THTTPRIO.Create( nil );
   HTTPRIO.HTTPWebNode.ConnectTimeout := 50000;
   HTTPRIO.HTTPWebNode.UserName := '1CUSER';
   HTTPRIO.HTTPWebNode.Password := 'Robot1111111';
   //HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/wsdl/ITourSoup';
   HTTPRIO.URL:='http://192.168.0.4:10080/TourSoapTest/TourSoap.dll/soap/ITourSoup';
   //Str := (HTTPRIO as ITourSoup).GetClientData( '1CUSER', 'Robot1111111', '19161852', 0 );   //'1CUSER', 'Robot1111111',
   Str := (HTTPRIO as ITourSoup).CheckClientByEDRPO( 'SYSDBA', 'masterkey', '19161852', 0 );


     Memo1.Text := UTF8Decode( Str );

   HTTPRIO:= nil;



end;

end.


