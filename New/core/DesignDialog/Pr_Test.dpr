program Pr_Test;

uses
  Forms,
  UnitTest in 'UnitTest.pas' {Form1},
  DesignDialog in 'DesignDialog.pas',
  formDialog in 'formDialog.pas' {frmDialog},
  re_bmp in 're_bmp.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
