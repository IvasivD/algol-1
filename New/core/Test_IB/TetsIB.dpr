program TetsIB;

uses
  DXCore,
  Forms,
  FormU in 'FormU.pas' {Form1},
  DMMod in 'DMMod.pas' {DM: TDataModule},
  core in '..\core.pas',
  FrmProgress in '..\FrmProgress.pas' {FormProgres},
  UnitIBQuery in '..\UnitIBQuery.pas',
  UnitFunctWebSoap in '..\WEBSoap\UnitFunctWebSoap.pas',
  UnitProc in '..\UnitProc.pas',
  frmMergeLogSoap in '..\frmMergeLogSoap.pas' {frmMergeSoap};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormProgres, FormProgres);
  Application.CreateForm(TfrmMergeSoap, frmMergeSoap);
  Application.Run;
end.
