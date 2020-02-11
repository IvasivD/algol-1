program ParseNBU;

uses
  Forms,
  SysUtils,
  UnitMain in 'UnitMain.pas' {FmMain},
  UnitMergeDataBank in 'UnitMergeDataBank.pas',
  UnitProc in '..\UnitProc.pas',
  uLkJSON in '..\..\JSON\uLkJSON.pas',
  TourMbplIf in '..\..\..\LIntf\TourMbplIf.pas',
  OptSet in '..\..\OptSet.pas',
  TourFiles in '..\..\..\LIntf\TourFiles.pas',
  ExtStream in '..\ExtStream.pas',
  TourConsts in '..\..\..\LIntf\TourConsts.pas',
  TourCmnlIf in '..\..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmMain, FmMain);
  //if CompareText(ParamStr(1) ,'new')=0 then
  FmMain.AutoParserParam:=ParamStr(1);

  Application.Run;
end.
