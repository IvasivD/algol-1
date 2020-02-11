program PrTestGoogleMaps;

uses
  Forms,
  UnitTest in 'UnitTest.pas' {Form1},
  UnitGoogleMaps in 'UnitGoogleMaps.pas',
  UnitProc in '..\UnitProc.pas',
  uLkJSON in '..\..\JSON\uLkJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
