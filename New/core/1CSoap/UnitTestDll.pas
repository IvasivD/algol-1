unit UnitTestDll;

interface

uses Classes, Controls, StdCtrls ,
  Windows, Messages, SysUtils, Variants, Graphics,  Forms,
  Dialogs,  iniFiles , UnitCompareDataGrid, cxStyles, UnitFunctSoapDll , 
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxTL,
  cxGridBandedTableView, cxGridCardView, IBCustomDataSet, IBUpdateSQL,
  InvokeRegistry, WSDLIntf, TypInfo, WebServExp, WSDLBind, XMLSchema,
  WSDLPub, SOAPPasInv, SOAPHTTPPasInv, SOAPHTTPDisp, WebBrokerSOAP,TourCmnlIf,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdRawBase, IdRawClient, IdIcmpClient, ADODB,OptSet,IBQuery,UnitIBQuery,FrmProgress,Core,
  IBDatabase, UnitSqlDB ;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button8: TButton;
    LSheet: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    cxStyle213: TcxStyle;
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    Button13: TButton;
    Memo1: TMemo;
    Button7: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button14: TButton;
    Button15: TButton;
    ADOConnection1: TADOConnection;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    ADOConnection: TADOConnection;
    IBDatabase: TIBDatabase;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  CallSoap1C:TFunctCallSoap1C;
implementation

uses
  UnitProc;

 {$R *.dfm}
 
procedure TForm1.Button1Click(Sender: TObject);
var Res:Integer;
begin
 Res := CallSoap1C.ClientCreate(2206, True );
 ShowMessage( intToStr(Res) );
end;

procedure TForm1.Button2Click(Sender: TObject);
var Res:Integer;
begin
 Res := CallSoap1C.ClientDelete( 827, true);
 ShowMessage( intToStr(Res) );
end;

procedure TForm1.Button3Click(Sender: TObject);
var Res:Integer;
begin
 Res := CallSoap1C.ClientUpdate( 12054 , True, True  );
 ShowMessage( intToStr(Res) );
end;

procedure TForm1.Button4Click(Sender: TObject);
var Res:Integer;
begin
 //Res := CallSoap1C.ContractCreateByContractId( 23, True  );
 //ShowMessage( intToStr(Res) );
end;

procedure TForm1.Button5Click(Sender: TObject);
var Res:Integer;
begin
 //Res := CallSoap1C.ContractUpdateByContractId( 23, True  );
 //ShowMessage( intToStr(Res) );
end;

procedure TForm1.Button6Click(Sender: TObject);
var Res:Integer;
begin
  Res := CallSoap1C.ContractDelete(23 , true);
  ShowMessage( intToStr(Res) );
end;

procedure TForm1.FormCreate(Sender: TObject);
var DBParam:TConnectDBParam;
begin
  //CallSoap1C := TFunctCallSoap1C.Create( 'alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB', 'SYSDBA', 'masterkey', cxStyle215 );
  DBParam:=  MakeDBParam('Apollo:D:\TourMn\NetTour\TOURIB.GDB','SYSDBA', 'HonzOKey', nil,IBDatabase,nil );
  CallSoap1C := TFunctCallSoap1C.Create( DBParam, cxStyle215 );
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
 CallSoap1C.Free;
end;

procedure TForm1.Button8Click(Sender: TObject);
var PRes:Integer;
    ResDataArr:TDataCliArr;
begin
  PRes := CallSoap1C.GetDataClient( '2001909667' , '',22464 ,false, '', '','', true, ResDataArr );
  if (PRes = 0)and(Length(ResDataArr)>0 ) then
  begin
    ShowMessage(ResDataArr[0].Name +'  ('+IntToStr( Length(ResDataArr) )+')');
    Memo1.Lines.Add('Representation: '+ ResDataArr[0].Address.Representation );
    Memo1.Lines.Add('ZIP: '+ ResDataArr[0].Address.ZIP );
    Memo1.Lines.Add('State: '+ ResDataArr[0].Address.State );
    Memo1.Lines.Add('Region: '+ ResDataArr[0].Address.Region );
    Memo1.Lines.Add('District: '+ ResDataArr[0].Address.District );
    Memo1.Lines.Add('City: '+ ResDataArr[0].Address.City );
    Memo1.Lines.Add('Settlement: '+ ResDataArr[0].Address.Settlement );
    Memo1.Lines.Add('Street: '+ ResDataArr[0].Address.Street );
    Memo1.Lines.Add('House: '+ ResDataArr[0].Address.House );
    Memo1.Lines.Add('Building: '+ ResDataArr[0].Address.Building );
    Memo1.Lines.Add('Appartment: '+ ResDataArr[0].Address.Appartment );
  end;
end;

procedure TForm1.Button13Click(Sender: TObject);
var Res:Integer;
begin
 Res:=CallSoap1C.SynhronizationCompanyDBAnd1C( 1, 25474{26201{827}, True, true, true, true,true );      //827     22464     22464
 if Res = 1 then ShowMessage('Dta is not Equal');
 if Res = 0 then ShowMessage('Dta is Equal');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 CallSoap1C.ShowFindMergeSoap1CLog(1, false, true, true, true, true,false );
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  CallSoap1C.ShowFindMergeSoap1CLog( 1, true, true, true, true, true,false );
end;

procedure TForm1.Button9Click(Sender: TObject);
var Res:Integer;
begin
  Res:=CallSoap1C.SynhronizationBankAccountsDBAnd1C( 1,  827, false, true, true, true, True );  // 180 -45              (2206  3 - 1)     (2802  2 - 1 !)
  if Res = 1 then ShowMessage('Dta is not Equal');
  if Res = 0 then ShowMessage('Dta is Equal');
end;

procedure TForm1.Button10Click(Sender: TObject);
var Res:Integer;
   PPathToContract:string;
begin
  Res := CallSoap1C.SynhronizationContractDBAnd1CByClientId( 1, 22533 , True, True );//2206       17899
end;

procedure TForm1.Button12Click(Sender: TObject);
var Res:Integer;
begin
  //Res := CallSoap1C.SynhronizationInvoiceDBAnd1C( 1,  170507, 6, true, true );  //172541
  Res := CallSoap1C.SynhronizationFinalyInvoiceDBAnd1C( 1,  175237, 1, true, true );  //172541
end;

procedure TForm1.Button14Click(Sender: TObject);
var Res:Integer;
begin
  Res := CallSoap1C.InvoicePackedsUpdate( true );
end;

procedure TForm1.Button15Click(Sender: TObject);
var Res:Integer;
begin
  Res:= CallSoap1C.UpdateCurrencyRate( 1, [8,37], Now, True, True );
  ShowMessage( IntToStr( Res ) );
end;

procedure TForm1.Button16Click(Sender: TObject);
var aDateTime:TDateTime;
begin
  aDateTime := ParseDateTimeFromStr( '19800419203059' );
  ShowMessage( DateTimeToStr(aDateTime ));
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  CallSoap1C.SynchronizePrivateByIDENTCodeAndName(True, True);
  //CallSoap1C.SynchronizePrivateByIDENTCodeAndName(True, False);
end;

procedure TForm1.Button18Click(Sender: TObject);
var res:Integer;
   a:TFont;
begin
  res:= ConsoleAddUser( '\\ALFA\C$\Program Files\Firebird\Firebird_1_5\bin\gsec',
                        'Alfa:C:\Program Files\Firebird\Firebird_1_5\security.fdb',
                        'SYSDBA', 'masterkey', 'Acid', 'acid12345678901234', 'Oleh', 'Fedak');

  ShowMessage( IntToStr(res) );         
end;

end.
{select COMPANYID , NAME,FULLNAME,HEADOFFICEID,
case
 WHEN (ISBSMAN ='T') THEN 0
 WHEN (ISENTERPR='T')THEN 1
 ELSE -1
END as Legal ,

case
 WHEN(ISBSMAN ='T') THEN IDENTCODE
 ELSE null
END as INN ,

case
 WHEN (ISENTERPR='T') THEN IDENTCODE
 ELSE null
END as EDRPOU ,

case
 WHEN ASRESIDENT ='T' then 1
 ELSE 0
END as Resident

FROM COMPANIES 
where COMPANYID = 6
}


{
select COMPCONTRACTID , COMPANYID , SUBSTR(FILENAME, 1, STRLEN(FILENAME) - 4) NAME,

CONTRACTTYPE,NUMCONTRACT,  COMMENTS, FROMDATE

from COMPCONTRACTS

where COMPCONTRACTID = 23
}


//C:\Users\Oleh.GNOME\AppData\Local\VirtualStore\Windows   INI
