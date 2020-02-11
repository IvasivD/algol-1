program Pr_TestDll;

uses
  Forms,
  UnitTestDll in 'UnitTestDll.pas',
  UnitFunctSoapDll in 'UnitFunctSoapDll.pas',
  UnitSoap1C in 'UnitSoap1C.pas',
  UnitProc in '..\UnitProc.pas',
  TourCurlIf in '..\..\..\LIntf\TourCurlIf.pas',
  LIfConsts in '..\..\..\LIntf\LIfConsts.pas',
  TourCmnlIf in '..\..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  TourFiles in '..\..\..\LIntf\TourFiles.pas',
  ExtStream in '..\ExtStream.pas',
  TourConsts in '..\..\..\LIntf\TourConsts.pas',
  OptSet in '..\..\OptSet.pas',
  frmMergeLogSoap in '..\frmMergeLogSoap.pas' {frmMergeSoap},
  core in '..\core.pas',
  FrmProgress in '..\FrmProgress.pas' {FormProgres},
  UnitIBQuery in '..\UnitIBQuery.pas',
  UnitFunctWebSoap in '..\WEBSoap\UnitFunctWebSoap.pas',
  frmCompareDataGrid in '..\frmCompareDataGrid.pas' {FrmCompareData},
  UnitEditText in '..\UnitEditText.pas' {FrmEditText},
  UnitInputData in '..\UnitInputData.pas' {FrmInputData},
  UnitWebSoap in '..\WEBSoap\UnitWebSoap.pas',
  UnitStructrureWebSoap in '..\WEBSoap\UnitStructrureWebSoap.pas',
  UnitCompareDataGrid in '..\UnitCompareDataGrid.pas',
  UnitGoogleMaps in '..\Google\UnitGoogleMaps.pas',
  UnitTranslate in '..\Google\UnitTranslate.pas' {FormGtranslater},
  uLkJSON in '..\..\JSON\uLkJSON.pas',
  UnitGenerateSQL in '..\UnitGenerateSQL.pas',
  UnitFunctLog in '..\LOG\UnitFunctLog.pas',
  UnitADOQuery in '..\UnitADOQuery.pas',
  UnitGTranslate in '..\Google\UnitGTranslate.pas' {FrmGtranslate},
  UnitAnimationThreadProgress in '..\UnitAnimationThreadProgress.pas',
  UnitProjectProc in '..\..\UnitProjectProc.pas',
  UnitUserPermission in '..\UnitUserPermission.pas',
  UnitGenerateElementsCore in '..\UnitGenerateElementsCore.pas' {FrmFindAllElements},
  UnitSqlDB in 'UnitSqlDB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.


UnitSoap1C

const
  defWSDL = 'http://192.168.0.101/Algol/ws/Algol?wsdl';         // Тестова база
  defURL  = 'http://192.168.0.101/Algol/ws/Algol';

  //defWSDL = 'http://B2/AlgolProd/ws/Algol?wsdl';            // Робоча база
  //defURL  = 'http://B2/AlgolProd/ws/Algol';
  defSvc  = 'Algol';
  defPrt  = 'AlgolSoap';
