program CountryPars;

uses
  Forms,
  UnitText in 'UnitText.pas' {FrmMain},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitProc in '..\UnitProc.pas',
  core in '..\core.pas',
  FrmProgress in '..\FrmProgress.pas' {FormProgres},
  UnitEditText in '..\UnitEditText.pas' {FrmEditText},
  UnitIBQuery in '..\UnitIBQuery.pas',
  UnitFunctWebSoap in '..\WEBSoap\UnitFunctWebSoap.pas',
  frmMergeLogSoap in '..\frmMergeLogSoap.pas' {frmMergeSoap},
  UnitWebSoap in '..\WEBSoap\UnitWebSoap.pas',
  UnitStructrureWebSoap in '..\WEBSoap\UnitStructrureWebSoap.pas',
  UnitInputData in '..\UnitInputData.pas' {FrmInputData},
  TourMbplIf in '..\..\..\LIntf\TourMbplIf.pas',
  OptSet in '..\..\OptSet.pas',
  TourFiles in '..\..\..\LIntf\TourFiles.pas',
  ExtStream in '..\ExtStream.pas',
  TourConsts in '..\..\..\LIntf\TourConsts.pas',
  TourCmnlIf in '..\..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  UnitPreviewResult in 'UnitPreviewResult.pas' {FrmCountryDetail},
  UnitTranslate in '..\Google\UnitTranslate.pas' {FormGtranslater},
  UnitGoogleMaps in '..\Google\UnitGoogleMaps.pas',
  uLkJSON in '..\..\JSON\uLkJSON.pas',
  UnitLngTranslate in '..\UnitLngTranslate.pas' {FrmLngTranslate},
  UnitLngTranslateEdit in '..\UnitLngTranslateEdit.pas' {FrmLngTranslateEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFormGtranslater, FormGtranslater);
  Application.CreateForm(TFrmLngTranslate, FrmLngTranslate);
  Application.CreateForm(TFrmLngTranslateEdit, FrmLngTranslateEdit);
  Application.Run;
end.
