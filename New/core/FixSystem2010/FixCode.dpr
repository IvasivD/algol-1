program FixCode;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  UnitProc in '..\UnitProc.pas',
  UnitFrmTest in 'UnitFrmTest.pas' {FrmTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TFrmTest, FrmTest);
  Application.Run;
end.
