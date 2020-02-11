program WebSynchrStructTable;

uses
  Forms,
  UnitWebSynchrSturctTable in 'UnitWebSynchrSturctTable.pas' {FrmWebSynchrSturctTable},
  core in '..\core.pas',
  FrmProgress in '..\FrmProgress.pas' {FormProgres},
  UnitProc in '..\UnitProc.pas',
  UnitEditText in '..\UnitEditText.pas' {FrmEditText},
  UnitIBQuery in '..\UnitIBQuery.pas',
  frmMergeLogSoap in '..\frmMergeLogSoap.pas' {frmMergeSoap},
  UnitInputData in '..\UnitInputData.pas' {FrmInputData},
  UnitDM_WebSynchrStructTable in 'UnitDM_WebSynchrStructTable.pas' {DM: TDataModule},
  UnitStructrureWebSoap in 'UnitStructrureWebSoap.pas',
  uLkJSON in '..\..\JSON\uLkJSON.pas',
  OptSet in '..\..\OptSet.pas',
  TourFiles in '..\..\..\LIntf\TourFiles.pas',
  ExtStream in '..\..\ExtStream.pas',
  TourConsts in '..\..\..\LIntf\TourConsts.pas',
  TourCmnlIf in '..\..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  TourMbplIf in '..\..\..\LIntf\TourMbplIf.pas',
  UnitADOQuery in '..\UnitADOQuery.pas',
  UnitFunctLog in '..\LOG\UnitFunctLog.pas',
  UnitCompareDataGrid in '..\UnitCompareDataGrid.pas',
  frmCompareDataGrid in '..\frmCompareDataGrid.pas' {FrmCompareData},
  UnitAnimationThreadProgress in '..\UnitAnimationThreadProgress.pas',
  UnitGenerateElementsCore in '..\UnitGenerateElementsCore.pas' {FrmFindAllElements};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmWebSynchrSturctTable, FrmWebSynchrSturctTable);
  Application.CreateForm(TFrmCompareData, FrmCompareData);
  Application.CreateForm(TFrmFindAllElements, FrmFindAllElements);
  Application.Run;
end.


muser
AxyHu6I5

MySQL Manager
http://phpma1.studio-creative.com.ua/tbl_sql.php?db=algol&table=test_table

136.243.144.33

muser
AxyHu6I5


algol
nJN8<Sqj`8

ftp://algol:nJN8<Sqj`8@136.243.144.33/www/frontend/web/
