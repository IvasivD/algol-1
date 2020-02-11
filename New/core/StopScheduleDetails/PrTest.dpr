program PrTest;

uses
  Forms,
  UnitTest in 'UnitTest.pas' {Form1},
  UnitDetailTours in 'UnitDetailTours.pas',
  UnitIBQuery in '..\UnitIBQuery.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
