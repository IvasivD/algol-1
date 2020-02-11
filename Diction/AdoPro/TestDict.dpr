program TestDict;

uses
  DXCore,
  Forms,
  ServMod in 'ServMod.pas' {DMServ: TDataModule},
  TestMain in 'TestMain.pas' {FormMenuTop},
  UnitProc in '..\..\New\core\UnitProc.pas',
  UnitPreviewFiles in '..\..\New\core\UnitPreviewFiles.pas',
  UnitFunctSoapDll in '..\..\New\core\1CSoap\UnitFunctSoapDll.pas',
  UnitSoap1C in '..\..\New\core\1CSoap\UnitSoap1C.pas',
  UnitProgresStop in '..\..\New\core\UnitProgresStop.pas' {FrmProgresBarStop},
  frmMergeResults in '..\..\New\core\1CSoap\frmMergeResults.pas' {FrmMergeResultList},
  UnitGenerateElementsCore in '..\..\New\core\UnitGenerateElementsCore.pas' {FrmFindAllElements},
  OptSet in '..\..\New\OptSet.pas',
  TourFiles in '..\..\LIntf\TourFiles.pas',
  ExtStream in '..\..\New\ExtStream.pas',
  TourConsts in '..\..\LIntf\TourConsts.pas',
  TourCmnlIf in '..\..\LIntf\TourCmnlIf.pas',
  InptHistDlg in '..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  ImageMD in '..\..\New\ImageMD.pas',
  StatForm in '..\..\New\StatForm.pas' {StatusBarForm},
  TourMbplIf in '..\..\LIntf\TourMbplIf.pas',
  MngrDlg in '..\..\LIntf\MngrDlg.pas',
  OrderUn in '..\..\LIntf\OrderUn.pas',
  OrderHtmlConst in '..\..\LIntf\OrderHtmlConst.pas',
  MailSend_Frm in '..\..\LIntf\MailSend_Frm.pas',
  MailUn in '..\..\LIntf\MailUn.pas',
  TourStrMag in '..\..\LIntf\TourStrMag.pas',
  core in '..\..\New\core\core.pas',
  UnitIBQuery in '..\..\New\core\UnitIBQuery.pas',
  UnitExportExcel in '..\..\New\core\UnitExportExcel.pas',
  FrmProgress in '..\..\New\core\FrmProgress.pas' {FormProgres},
  UnitFunctWebSoap in '..\..\New\core\WEBSoap\UnitFunctWebSoap.pas',
  frmMergeLogSoap in '..\..\New\core\frmMergeLogSoap.pas' {frmMergeSoap},
  UnitEditText in '..\..\New\core\UnitEditText.pas' {FrmEditText},
  UnitWebSoap in '..\..\New\core\WEBSoap\UnitWebSoap.pas',
  UnitInputData in '..\..\New\core\UnitInputData.pas' {FrmInputData},
  UnitStructrureWebSoap in '..\..\New\core\WEBSoap\UnitStructrureWebSoap.pas',
  UnitCompareDataGrid in '..\..\New\core\UnitCompareDataGrid.pas',
  FrmCompareDataGrid in '..\..\New\core\frmCompareDataGrid.pas',
  UnitEditInfoCountry in 'UnitEditInfoCountry.pas' {FrmEditInfoCountry},
  UnitFrameMoveToTimeZone in '..\..\New\core\UnitFrameMoveToTimeZone.pas' {FrameMoveToTimeZone: TFrame},
  UnitTimeLiner in '..\..\New\core\UnitTimeLiner.pas',
  MyHint in '..\..\New\core\MyHint.pas',
  ListSelectForm in '..\..\New\core\ListSelectForm.pas' {FrListSelect},
  UnitSelectHoliday in '..\..\New\core\UnitSelectHoliday.pas' {FrmSelectHoliday},
  UnitCountryCityEdit in 'UnitCountryCityEdit.pas' {FrmCountryCityEdit},
  UnitLngTranslate in '..\..\New\core\UnitLngTranslate.pas' {FrmLngTranslate},
  UnitLngTranslateEdit in '..\..\New\core\UnitLngTranslateEdit.pas' {FrmLngTranslateEdit},
  UnitTranslate in '..\..\New\core\Google\UnitTranslate.pas' {FormGtranslater},
  UnitGoogleMaps in '..\..\New\core\Google\UnitGoogleMaps.pas',
  uLkJSON in '..\..\New\JSON\uLkJSON.pas',
  UnitFrameDicCity in 'UnitFrameDicCity.pas' {FrameDicCity: TFrame},
  UnitEditInfoExcursion in 'UnitEditInfoExcursion.pas' {Frm_UnitEditInfoExcursion},
  UnitFrameDescriptionWebHTML in '..\..\New\core\UnitFrameDescriptionWebHTML.pas' {FrameDescriptionWebHTML: TFrame},
  UnitHotelEdit in 'UnitHotelEdit.pas' {FrmHotelEdit},
  UnitHotelInfoEdit in 'UnitHotelInfoEdit.pas' {FrmHotelInfoEdit},
  UnitFrameSearchCity in '..\..\New\Common\UnitFrameSearchCity.pas' {FrameSearchCity: TFrame},
  UnitTourSoup in '..\..\New\core\1CSoap\UnitTourSoup.pas',
  UnitFunctLog in '..\..\New\core\LOG\UnitFunctLog.pas',
  UnitFramePhotoList in '..\..\New\core\UnitFramePhotoList.pas' {FramePhotoList: TFrame},
  UnitADOQuery in '..\..\New\core\UnitADOQuery.pas',
  UnitSelectVendor in '..\..\New\Common\UnitSelectVendor.pas' {FrmSelectVendor},
  ServModIB in 'ServModIB.pas' {DMServIB: TDataModule},
  EmbassyDocDlg in 'EmbassyDocDlg.pas',
  EmbassyDocEdtDlg in 'EmbassyDocEdtDlg.pas',
  CopyDocToKonsulFrm in 'CopyDocToKonsulFrm.pas' {CopyDocToKonsulForm},
  AnketDataFrm in 'AnketDataFrm.pas' {AnketDataForm},
  VisaCenterSelFrm in 'VisaCenterSelFrm.pas' {VisaCenterSelForm},
  DocumVisaBr in 'DocumVisaBr.pas' {DocumVisaEditDlg},
  TmplFrmNew in 'TmplFrmNew.pas' {TouristTemplateNewForm},
  FundingFrm in 'FundingFrm.pas' {FundingDlg},
  ServModDic in '..\..\New\Common\ServModDic.pas' {DMServDic: TDataModule},
  UnitCompBr in 'UnitCompBr.pas' {FrmCompanyBrowse},
  TourUnts in '..\..\LIntf\TourUnts.pas',
  AddrDlg in '..\..\New\Common\AddrDlg.pas' {AddressDlg},
  UnitFrameAddress in '..\..\New\Common\UnitFrameAddress.pas' {FrAddress: TFrame},
  UnitGridView in '..\..\New\core\UnitGridView.pas' {FrmGridView},
  UnitCompanyEdit in 'UnitCompanyEdit.pas' {FrmCompanyEdit},
  UnitSelectTradeName in 'UnitSelectTradeName.pas' {FrmSelectTradeName},
  UnitTradeNameEditDlg in 'UnitTradeNameEditDlg.pas' {FrmTradeNameEditDlg},
  UnitGridViewDetail in '..\..\New\core\UnitGridViewDetail.pas' {FrmGridViewDetail},
  UnitHtlDocFrm in 'UnitHtlDocFrm.pas' {FrmHotelDocMaster},
  UnitHtlServ in 'UnitHtlServ.pas' {FrmHtlServ},
  UnitFrameSelPrice in '..\..\New\core\UnitFrameSelPrice.pas' {FrameSelPrice: TFrame},
  UnitInputPrice in '..\..\New\core\RatePrice\UnitInputPrice.pas' {FrmInputPrice},
  UnitFrameComRequisites in '..\..\New\Common\UnitFrameComRequisites.pas' {FrameComRequisites: TFrame},
  UnitExportWord in '..\..\New\core\UnitExportWord.pas',
  UnitFrameUpdateImages in '..\..\New\core\UnitFrameUpdateImages.pas' {FrameUpdateImages: TFrame},
  UnitUpdateImages in '..\..\New\core\UnitUpdateImages.pas' {FrmUpdateImages},
  UnitHookControlChangeValue in '..\..\New\core\UnitHookControlChangeValue.pas',
  UnitComRequisites in '..\..\New\Common\UnitComRequisites.pas' {FrmRequisites},
  UnitGTranslate in '..\..\New\core\Google\UnitGTranslate.pas' {FrmGtranslate},
  UnitDriveBrowse in 'UnitDriveBrowse.pas' {FrmDriveBrowse},
  UnitDriveEditInfo in 'UnitDriveEditInfo.pas' {FrmDriveEditInfo},
  CityNewForm in 'CityNewForm.pas' {CityEditNewForm},
  UnitSelParentObj in 'UnitSelParentObj.pas' {FrmSelParentObj},
  UnitDriveServiceMaster in 'UnitDriveServiceMaster.pas' {DriveServiceMasterForm},
  UnitListViewDataIcons in '..\..\New\core\UnitListViewDataIcons.pas',
  UnitFrameSelParentObj in 'UnitFrameSelParentObj.pas' {FrameSelParentObj: TFrame},
  UnitFrameSearchCityAdmUnit in 'UnitFrameSearchCityAdmUnit.pas' {FrameSearchCityAdmUnit: TFrame},
  UnitFrameKindType in '..\..\New\core\UnitFrameKindType.pas' {FrameKindType: TFrame},
  UnitControlDrawImage in '..\..\New\core\UnitControlDrawImage.pas',
  UnitFrameCompanyPayState in '..\..\New\Common\UnitFrameCompanyPayState.pas' {FrameCompanyPayState: TFrame},
  ContractTemplatesFrm in 'ContractTemplatesFrm.pas' {ContractTemplatesForm},
  ContractDataFrm in 'ContractDataFrm.pas' {ContractDataForm},
  UnitDictionGrid in '..\..\New\core\UnitDictionGrid.pas' {FrmEditDict},
  UnitFrameDic in '..\..\New\core\UnitFrameDic.pas' {FrameDic: TFrame},
  UnitAnimationThreadProgress in '..\..\New\core\UnitAnimationThreadProgress.pas',
  UnitUserPermission in '..\..\New\core\UnitUserPermission.pas',
  UnitVehiclePlace in '..\..\New\core\UnitVehiclePlace.pas',
  UnitDrvShemaDisigner in 'UnitDrvShemaDisigner.pas' {FrmDrvShemaDisigner},
  UnitProjectProc in '..\..\New\UnitProjectProc.pas',
  UnitFrameSelectVendor in '..\..\New\Common\UnitFrameSelectVendor.pas' {FrameSelectVendor: TFrame},
  DocFileUn in '..\..\New\Common\DocFileUn.pas',
  UnitNoteEditDlg in '..\..\New\Common\UnitNoteEditDlg.pas' {FrmNoteEditDlg},
  ServUn in '..\..\New\Common\ServUn.pas',
  UnitContractEditForm in '..\..\New\Common\UnitContractEditForm.pas' {FrmContractEdit},
  ControlsHook in '..\..\New\core\ControlsHook.pas',
  UnitAdminRoleForm in '..\..\New\core\UnitAdminRoleForm.pas' {FrmAdminRole},
  UnitSqlDB in '..\..\New\core\1CSoap\UnitSqlDB.pas',
  SnifferViewStyle in '..\..\New\core\SnifferViewStyle.pas';

{$R *.RES}

begin

  Application.Initialize;
  Application.Title := 'Туристичні довідники';
  Application.HelpFile := 'Help\Tourman.hlp';

  Application.CreateForm(TDMServDic, DMServDic);
  Application.CreateForm(TDMServIB, DMServIB);
  Application.CreateForm(TDMServ, DMServ);
  if  DMServ.CurManager <>0 then
  begin
    ControlsHook.InitHook( ElemUserRole, DMServ.AdminControl );
    
    Application.CreateForm(TFormMenuTop, FormMenuTop);
    Application.CreateForm(TStatusBarForm, StatusBarForm);
    InitStatusBar( StatusBarForm.StatusBar );
    
    StatusBarForm.Prepare;
  end;

  SnifferViewStyle.InitDataModuleSnifferViewStyle();
  Application.Run;

end.

