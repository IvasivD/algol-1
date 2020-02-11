library TourSoap;

uses
  dxCore,
  ActiveX,
  ComObj,
  WebBroker,
  ISAPIThreadPool,
  ISAPIApp,
  DMTourSoap in 'DMTourSoap.pas' {WebDM: TWebModule},
  TourSoupImpl in 'TourSoupImpl.pas',
  TourSoupIntf in 'TourSoupIntf.pas',
  TourFiles in '..\..\..\..\LIntf\TourFiles.pas',
  ExtStream in '..\..\ExtStream.pas',
  UnitProc in '..\..\UnitProc.pas',
  TourConsts in '..\..\..\..\LIntf\TourConsts.pas',
  TourCmnlIf in '..\..\..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  UnitIBQuery in '..\..\UnitIBQuery.pas',
  UnitPaymentBilling in 'UnitPaymentBilling.pas',
  UnitGenerateSQL in '..\..\UnitGenerateSQL.pas',
  DMSoapData in 'DMSoapData.pas' {SoapDM: TSoapDataModule},
  UnitADOQuery in '..\..\UnitADOQuery.pas',
  UnitApiSite in 'UnitApiSite.pas',
  uLkJSON in '..\..\..\JSON\uLkJSON.pas',
  UnitSQLData in 'UnitSQLData.pas',
  UnitSqlDB in '..\UnitSqlDB.pas';

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

begin
  dxInitialize;
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.CreateForm(TWebDM, WebDM);
  Application.Run;
end.


//Resolved Problem with IIS
// http://www-01.ibm.com/support/docview.wss?uid=swg21882952
// https://www.forum.mista.ru/topic.php?id=529054
