program CourseOfValute;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FmMain},
  TourMbplIf in '..\..\..\LIntf\TourMbplIf.pas',
  OptSet in '..\..\OptSet.pas',
  TourFiles in '..\..\..\LIntf\TourFiles.pas',
  ExtStream in '..\ExtStream.pas',
  TourConsts in '..\..\..\LIntf\TourConsts.pas',
  TourCmnlIf in '..\..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  UnitMergeDataBank in '..\NBUBankParse\UnitMergeDataBank.pas',
  UnitProc in '..\UnitProc.pas',
  uLkJSON in '..\..\JSON\uLkJSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  FmMain.AutoParserParam:=ParamStr(1);

  Application.Run;
end.
