program PrTest;

uses
  Forms,
  UnitTest in 'UnitTest.pas' {Form1},
  ITourSoup1 in 'ITourSoup1.pas',
  UnitProc in '..\..\..\UnitProc.pas',
  UnitADOQuery in '..\..\..\UnitADOQuery.pas',
  UnitApiSite in '..\UnitApiSite.pas',
  uLkJSON in '..\..\..\..\JSON\uLkJSON.pas',
  UnitSQLData in '..\UnitSQLData.pas',
  UnitPaymentBilling in '..\UnitPaymentBilling.pas',
  UnitIBQuery in '..\..\..\UnitIBQuery.pas',
  TourSoupIntf in '..\TourSoupIntf.pas',
  UnitSqlDB in '..\..\UnitSqlDB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
