program GTranslate;

uses
  Forms,
  UnitGoogleMaps in 'UnitGoogleMaps.pas',
  UnitProc in '..\UnitProc.pas',
  uLkJSON in '..\..\JSON\uLkJSON.pas',
  UnittTestTranslater in 'UnittTestTranslater.pas' {Form1},
  UnitTranslate in 'UnitTranslate.pas' {FormGtranslater};

{$R *.res}

begin
  Application.Initialize;

  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormGtranslater, FormGtranslater);
  //FormMain.ParamLngFrom:=ParamStr(1);
  //FormMain.ParamLngTo:=ParamStr(2);
  //FormMain.ParamTextForTranslate:=ParamStr(3);

  Application.Run;
end.
