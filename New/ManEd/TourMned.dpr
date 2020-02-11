program TourMned;

uses
  Forms,
  ManBrFrm in 'ManBrFrm.pas' {ManagerBrowseForm},
  ZTDlg in '..\ZTDlg.pas' {ZTourDialog},
  ZDlg in '..\ZDlg.pas' {ZDialog},
  ManPmFrm in 'ManPmFrm.pas' {ManagerPermisForm},
  ManPwFrm in 'ManPwFrm.pas' {ManagerPasswDlg},
  DataMod in 'DataMod.pas' {DM: TDataModule},
  TourDbUn in '..\..\LIntf\TourDbUn.pas',
  VDlgs in '..\VDlgs.pas',
  TourConsts in '..\..\LIntf\TourConsts.pas',
  TourCmnlIf in '..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  ZFndDlg in '..\ZFndDlg.pas' {ZFindDialog},
  Finder in '..\..\LIntf\Finder.pas',
  TourStrMag in '..\..\LIntf\TourStrMag.pas',
  OptSet in '..\OptSet.pas',
  TourMbplIf in '..\..\LIntf\TourMbplIf.pas',
  MngrDlg in '..\..\LIntf\MngrDlg.pas' {ManagerDlg},
  TourFiles in '..\..\LIntf\TourFiles.pas',
  KeyQryDlg in '..\..\LIntf\KeyQryDlg.pas' {PrivateKeyInputDlg},
  OrderHtmlConst in '..\..\LIntf\OrderHtmlConst.pas',
  OrderUn in '..\..\LIntf\OrderUn.pas',
  ExtStream in '..\ExtStream.pas',
  UnitProc in '..\core\UnitProc.pas',
  UnitADOQuery in '..\core\UnitADOQuery.pas',
  core in '..\core\core.pas',
  FrmProgress in '..\core\FrmProgress.pas' {FormProgres},
  UnitAnimationThreadProgress in '..\core\UnitAnimationThreadProgress.pas',
  UnitEditText in '..\core\UnitEditText.pas' {FrmEditText},
  UnitIBQuery in '..\core\UnitIBQuery.pas',
  UnitFunctWebSoap in '..\core\WEBSoap\UnitFunctWebSoap.pas',
  frmMergeLogSoap in '..\core\frmMergeLogSoap.pas' {frmMergeSoap},
  UnitWebSoap in '..\core\WEBSoap\UnitWebSoap.pas',
  UnitStructrureWebSoap in '..\core\WEBSoap\UnitStructrureWebSoap.pas',
  UnitUserPermission in '..\core\UnitUserPermission.pas',
  UnitInputData in '..\core\UnitInputData.pas' {FrmInputData},
  UnitFunctLog in '..\core\LOG\UnitFunctLog.pas',
  UnitCompareDataGrid in '..\core\UnitCompareDataGrid.pas',
  frmCompareDataGrid in '..\core\frmCompareDataGrid.pas' {FrmCompareData},
  UnitGenerateElementsCore in '..\core\UnitGenerateElementsCore.pas' {FrmFindAllElements};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Права доступу';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TManagerBrowseForm, ManagerBrowseForm);
  Application.Run;
end.
