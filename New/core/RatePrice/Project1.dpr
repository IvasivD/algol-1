program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UnitPeriodAgeRange in 'UnitPeriodAgeRange.pas',
  UnitFrameAge in 'UnitFrameAge.pas' {FrameRangeAgePrice: TFrame},
  UnitProc in '..\UnitProc.pas',
  core in '..\core.pas',
  FrmProgress in '..\FrmProgress.pas' {FormProgres},
  UnitEditText in '..\UnitEditText.pas' {FrmEditText},
  UnitIBQuery in '..\UnitIBQuery.pas',
  UnitFunctWebSoap in '..\WEBSoap\UnitFunctWebSoap.pas',
  frmMergeLogSoap in '..\frmMergeLogSoap.pas' {frmMergeSoap},
  UnitWebSoap in '..\WEBSoap\UnitWebSoap.pas',
  UnitInputData in '..\UnitInputData.pas' {FrmInputData};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormProgres, FormProgres);
  Application.CreateForm(TFrmEditText, FrmEditText);
  Application.CreateForm(TfrmMergeSoap, frmMergeSoap);
  Application.Run;
end.
