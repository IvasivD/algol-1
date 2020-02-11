program TourMan;

uses
  Forms,
  Controls,
  About in 'ABOUT.PAS' {AboutBox},
  TourMbplIf in '..\LIntf\TourMbplIf.pas',
  DataMod in 'DataMod.pas' {DM: TDataModule},
  ZTDlg in 'ZTDlg.pas' {ZTourDialog},
  QRPrevw in 'QRPrevw.pas' {ReportPreviewForm},
  ZTBrws in 'ZTBrws.pas' {ZTourBrowseForm},
  PlaceFrm in 'PlaceFrm.pas' {PlacementEditForm},
  PrcntDlg in 'PrcntDlg.pas' {PersonPaymentDlg},
  ZTPhDlg in 'ZTPhDlg.pas' {ZTourPhotoDialog},
  HtlQryDlg in 'HtlQryDlg.pas' {HotelQueryDlg},
  StatForm in 'StatForm.pas' {StatusBarForm},
  TourConsts in 'TourConsts.pas',
  VDlgs in 'VDlgs.pas',
  ImgPrevw in 'ImgPrevw.pas' {ImagePreviewForm},
  RoutSelDlg in 'RoutSelDlg.pas' {RouteChooseDlg},
  TxtPrevw in 'TxtPrevw.pas' {TextPreviewForm},
  OptSet in 'OptSet.pas',
  SdiMain in 'Sdimain.pas' {SDIAppForm},
  GrAnkDlg in 'GrAnkDlg.pas' {GroupAnketDlg},
  TourCmnlIf in '..\LIntf\TourCmnlIf.pas',
  DictLIf in '..\LIntf\DictLIf.pas',
  DataImgFrm in '..\LIntf\DataImgFrm.pas' {DatabaseImageForm},
  TmplLIf in '..\LIntf\TmplLIf.pas',
  DocLstFrm in 'DocLstFrm.pas' {DocumentListForm},
  Splash in 'Splash.pas' {SplashForm},
  InptHistDlg in '..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  PswrdUn in 'PswrdUn.pas',
  LIfConsts in '..\LIntf\LIfConsts.pas',
  TourCurlIf in '..\LIntf\TourCurlIf.pas',
  TourGrBr in 'TourGrBr.pas' {TourGroupBrowseForm},
  TripSelDlg in 'TripSelDlg.pas' {TripChooseDlg},
  VouchPrnDlg in 'VouchPrnDlg.pas' {VoucherPrintDlg},
  UserDlg in 'UserDlg.pas' {UserAutentifyDlg},
  TripDetFrm in 'TripDetFrm.pas' {TripDetailPersonListForm},
  ZRepFrm in 'ZRepFrm.pas' {ZReportListForm},
  BillRepFrm in 'BillRepFrm.pas' {OrderBillListForm},
  HtlSelDlg in 'HtlSelDlg.pas' {HotelChooseDlg},
  ZTView in 'ZTView.pas' {ZViewForm},
  ZTVwGrid in 'ZTVwGrid.pas' {ZViewGridForm},
  TripChrtFrm in 'TripChrtFrm.pas' {TripChartViewForm},
  ClientRepFrm in 'ClientRepFrm.pas' {ClientReportForm},
  ZSelDlg in 'ZSelDlg.pas' {ZSelectDlg},
  CntrySelDlg in 'CntrySelDlg.pas' {CountryChooseDlg},
  TourReplIf in '..\LIntf\TourReplIf.pas',
  TourHint in '..\LIntf\TourHint.pas',
  TempCls in '..\Italiana\Templat\TempCls.pas',
  TempCnsts in '..\Italiana\Templat\TempCnsts.pas',
  TourStrMag in '..\LIntf\TourStrMag.pas',
  InsKndSelDlg in 'InsKndSelDlg.pas' {InsureKindChooseDlg},
  InsPrntUn in 'InsPrntUn.pas',
  TourUnts in '..\LIntf\TourUnts.pas',
  TourFerr_TLB in '..\Modules\TripX\TourFerr_TLB.pas';

{$R *.RES}

begin
  SplashForm := TSplashForm.Create(Application);
  SplashForm.Show;
  Screen.Cursor := crHourGlass;
  SplashForm.Update;
  Application.Title := 'Менеджер турів';
  Application.HelpFile := 'Help\TourMan.HLP';
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TStatusBarForm, StatusBarForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TReportPreviewForm, ReportPreviewForm);
  Application.CreateForm(TPlacementEditForm, PlacementEditForm);
  Application.CreateForm(TTourGroupBrowseForm, TourGroupBrowseForm);
  StatusBarForm.Show;
  Screen.Cursor := crDefault;                                       
  SplashForm.Hide;
  SplashForm.Free;
  Application.Run;
end.
