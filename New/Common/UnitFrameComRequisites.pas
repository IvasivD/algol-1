unit UnitFrameComRequisites;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  ComCtrls, DBCtrls, StdCtrls, Mask, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, UnitFrameAddress, AddrDlg,
  cxGridDBTableView, cxGrid, ExtCtrls, Buttons,  OptSet, Core,UnitProc,
  OleServer, WordXP, MailSend_Frm,TourConsts,TourCmnlIf, UnitExportWord,
  WinFaxSendForm, SKYPE4COMLib_TLB,OrderUn,UnitIBQuery,UnitADOQuery,IBQuery,ADODB,
  DocFileUn, UnitNoteEditDlg, DragDrop, DropTarget, DragDropText, Menus, UnitPreviewFiles,TourUnts,
  cxContainer, cxCheckBox, cxDBEdit, cxTextEdit, IBCustomDataSet,
  cxCalendar, cxImage, cxDBExtLookupComboBox, cxImageComboBox, cxBlobEdit,UnitFunctSoapDll,frmMergeResults,
  cxDBLookupComboBox, cxButtonEdit, dxmdaset, ImgList,ServUn,  IdHTTP, ShellAPI, ShFolder,MaskUtils,UnitProgresStop,
  UnitFrameCompanyPayState, cxMaskEdit, IBUpdateSQL,UnitProjectProc, cxTL,
  cxGridBandedTableView, cxGridCardView, cxMemo;

const
  ClientDataSync = True;


  sCntrctTempl = 'Templates\Contracts\';
  sAlgolStamp = 'Печатка Алголя.png';
  sOlegSign = 'Пiдпис Олега.png';
  ErrValidValue = 'Введене значення не відповідповідає шаблону';
  sNamePar = 'Default';
  sEntrpPar = 'Entrp';
  sBsnmPar = 'Bsnm';
  sIndvdPar = 'Indvd'; 
  sErrandPar = 'Errand';
  arrNamePar: array [0..4] of string = ( sNamePar, sEntrpPar, sBsnmPar, sIndvdPar, sErrandPar );

type
  TParamSynchrShowLog = record
    param:PParamSynchr;
    isAdmin:Boolean;
  end;
  PParamSynchrShowLog = ^TParamSynchrShowLog;

  TParamSynchrClient = record
    param:PParamSynchr;
    ClientId:Integer;
    Res : Integer;
  end;
  PParamSynchrClient = ^TParamSynchrClient;


  TParamHotelEnterprise = record
    HotelId   : Variant;
    HotelName : WideString;
    HotelKindName : WideString;
    HotelCountryName : WideString;
    HoteCityName  : WideString;
    ElemCompEnterpriseHotel : TDBShemaView;
    ElemHotel :TDBShemaView;
    idCity : Variant;
    idCountry :Variant;
  end;

  TParamComRequisitesFrame =  record
    AdoConnection :TADOConnection;
    ElemCompanyQry :TDBShemaView;
    ElemCompanyDocsQry:TDBShemaView;
    ElemCOMPCONTRACTSKINDQry:TDBShemaView;
    ElemTypeNotesQry:TDBShemaView;
    ElemCompaniesParamName : TDBShemaView;
    ElemOCCUPATIONS :TDBShemaView;
    ElemComunicationType:TDBShemaView;
    //ElemCompTaxLogMemTableEh :TDBShemaView;
    //ElemCompTaxSystemLogQry : TDBShemaView;
    ElemTypeDocumQry : TDBShemaView;
    ElemSelCompAction :TDBShemaView;
    ElemSelTaxSystemQry :TDBShemaView;
    ElemUsersQry :TDBShemaView;
    ElemCompContractNumsQry:TDBShema;

    ParamHotelEnterprise : TParamHotelEnterprise;
    ViewStyle: TcxGridTableViewStyleSheet;
  end;

  TFrameComRequisites = class(TFrame)
    PanelTab: TPanel;
    PageControl: TPageControl;
    OfficeTabSheet: TTabSheet;
    AccountTabSheet: TTabSheet;
    ProfileTabSheet: TTabSheet;
    PersonTabSheet: TTabSheet;
    ContractTabSheet: TTabSheet;
    GridContractLog: TcxGrid;
    GridContractLogDBTableView1: TcxGridDBTableView;
    GridContractLogLevel1: TcxGridLevel;
    OrderTabSheet: TTabSheet;
    GridOrderList: TcxGrid;
    GridOrderListDBTableView1: TcxGridDBTableView;
    GridOrderListLevel1: TcxGridLevel;
    NoteTabSheet: TTabSheet;
    GridNotes: TcxGrid;
    GridNotesDBTableView1: TcxGridDBTableView;
    GridNotesLevel1: TcxGridLevel;
    Panel4: TPanel;
    butAddNote: TSpeedButton;
    butPreviewNote: TSpeedButton;
    DocumentTabSheet: TTabSheet;
    WordDocum: TWordDocument;
    WordApplic: TWordApplication;
    WinFaxSendForm: TWinFaxSendForm;
    PopupMenu1: TPopupMenu;
    N19: TMenuItem;
    N20: TMenuItem;
    GridDropTextTarget: TDropTextTarget;
    CopyPathPopupMenu: TPopupMenu;
    CopyMenuItem: TMenuItem;
    OpenMenuItem: TMenuItem;
    GridDataFormatAdapterStream: TDataFormatAdapter;
    GridDataFormatAdapterFile: TDataFormatAdapter;
    DropTextTarget: TDropTextTarget;
    DataFormatAdapterFile: TDataFormatAdapter;
    DataFormatAdapterStream: TDataFormatAdapter;
    CompanySrc: TDataSource;
    AccountSrc: TDataSource;
    PersonSrc: TDataSource;
    Panel1: TPanel;
    OfficeQry: TADOQuery;
    OfficeQryOFFICEID: TIntegerField;
    OfficeQryCOMPANYID: TIntegerField;
    OfficeQryCOUNTRYID: TIntegerField;
    OfficeQryISDEFAULT: TIBStringField;
    OfficeQryHEADOFFICE: TIBStringField;
    OfficeQryOFFICENAME: TIBStringField;
    OfficeQryZIPCODE: TIBStringField;
    OfficeQrySTRKIND: TSmallintField;
    OfficeQryADDRESS: TIBStringField;
    OfficeQryHOUSE: TIBStringField;
    OfficeQryTENEMENT: TIBStringField;
    OfficeQryCITY: TIBStringField;
    OfficeQryCITY_ENG: TIBStringField;
    OfficeQryITSMAILADDRESS: TIBStringField;
    OfficeQryCOUNTRY: TIBStringField;
    OfficeQryCOUNTRY_ENG: TIBStringField;
    OfficeQryLATNAME: TIBStringField;
    OfficeQryTENEMENTNULL: TIBStringField;
    OfficeQryADDMANID: TIntegerField;
    OfficeQryCNTRYCODE: TStringField;
    OfficeSrc: TDataSource;
    PersonQry: TADOQuery;
    PersonQryCOMPANYID: TIntegerField;
    PersonQryPERSONID: TIntegerField;
    PersonQryNAME: TStringField;
    PersonQrySECONDNAME: TStringField;
    PersonQryOCCUPATION: TStringField;
    AccountQry: TADOQuery;
    AccountQryCOMPANYID: TIntegerField;
    AccountQryACCOUNTID: TIntegerField;
    AccountQryBANKID: TIntegerField;
    AccountQryACCOUNTNO: TStringField;
    AccountQryACCOUNTNO2: TStringField;
    AccountQryBANKNAME: TStringField;
    AccountQryBANKADDRESS: TStringField;
    AccountQryBANKMFO: TStringField;
    AccountQryBANKSWIFT: TStringField;
    ContractQry: TADOQuery;
    ContractQryCOMPCONTRACTID: TIntegerField;
    ContractQryCONTRACTNAME: TStringField;
    ContractQryONLYREG: TStringField;
    ContractQryFROMDATE: TDateTimeField;
    ContractQryTILLDATE: TDateTimeField;
    ContractQryWRITEDATE: TDateTimeField;
    ContractQrySIGNDATE: TDateTimeField;
    ContractQryOURPERSON: TStringField;
    ContractQryITSPERSON: TStringField;
    ContractQryISPRINTED: TStringField;
    ContractQryISSEND: TStringField;
    ContractQryISRCVCOPY: TStringField;
    ContractQryISRCVORIG: TStringField;
    ContractQryCOMMENTS: TMemoField;
    ContractQryFILENAME: TStringField;
    ContractQryCREATOR: TStringField;
    ContractQrySENDER: TStringField;
    ContractQryCOPYRCVER: TStringField;
    ContractQryORIGRCVER: TStringField;
    ContractQryTEMPLVER: TDateTimeField;
    ContractQryNUMCONTRACT: TStringField;
    ContractQryISSENDORIG: TStringField;
    ContractQryISSIGN: TStringField;
    ContractQryINVALID: TStringField;
    ContractQryISEXTEND: TStringField;
    ContractQryRCVCOPYDATE: TDateTimeField;
    ContractQryCONTRACTTYPE: TIntegerField;
    ContractQryPERMREREESTR: TStringField;
    ContractQryADDMANID: TIntegerField;
    ContractQryCOMPANYID: TIntegerField;
    ContractQryONLYREGNAME: TIBStringField;
    ContractQryOURPERSONID: TIntegerField;
    ContractQryITSPERSONID: TIntegerField;
    LogContractQry: TADOQuery;
    LogContractQryLOGDATETIME: TDateTimeField;
    LogContractQrySUBCATEGNAME: TStringField;
    LogContractQryMANAGER: TStringField;
    LogContractQryLOGPROMPT: TMemoField;
    LogContractQryLOGCATEGORY: TIntegerField;
    LogContractQryCONTRACTLOGID: TIntegerField;
    LogContractQryFILENAME: TStringField;
    LogContractQryCalcLog: TStringField;
    ContractSrc: TDataSource;
    LogContractSrc: TDataSource;
    CompHeadPropQry: TADOQuery;
    OrderListQry: TADOQuery;
    OrderListQryORDERID: TIntegerField;
    OrderListQryDATEANDTIME: TDateTimeField;
    OrderListQryRESERVTO: TDateTimeField;
    OrderListQryTOURID: TIntegerField;
    OrderListQryTOURGROUPID: TIntegerField;
    OrderListQryTOURNAME: TStringField;
    OrderListQryVARIANTNAME: TStringField;
    OrderListQryPERSONCOUNT: TIntegerField;
    OrderListQrySTATE: TSmallintField;
    OrderListQrySTATE2: TSmallintField;
    OrderListQryTOURDATE: TDateTimeField;
    OrderListQrySPECIALDATEID: TIntegerField;
    OrderListQrySPECIALNAME: TStringField;
    OrderListQryTOURIND: TStringField;
    OrderListQryTOURGROUPPROMOID: TIntegerField;
    OrderListQryPROMOFROMDATE: TDateTimeField;
    OrderListQryPROMOTILLDATE: TDateTimeField;
    OrderListQryPROGRAMNAME: TStringField;
    OrderListQryCalcState: TStringField;
    OrderListQryCalcState2: TStringField;
    OrderListSrc: TDataSource;
    CompNoteQry: TADOQuery;
    CompNoteQryCOMPNOTEID: TIntegerField;
    CompNoteQryMEMO: TMemoField;
    CompNoteQryADDDATE: TDateTimeField;
    CompNoteQryADDMANAGER: TStringField;
    CompNoteQryCalcMemo: TStringField;
    CompNoteQryTYPENOTE: TIntegerField;
    CompNoteQryTYPENOTENAME: TStringField;
    CompNoteQryCATEGORYNOTE: TIntegerField;
    CompNoteQryCalcCategoryNote: TStringField;
    CompNoteQryNDATE: TDateTimeField;
    CompNoteQryFIXNDATE: TStringField;
    CompNoteSrc: TDataSource;
    MemFiles: TdxMemData;
    MemFilesFileName: TStringField;
    MemFilesFileDate: TDateTimeField;
    MemFilesFileSize: TFloatField;
    MemFilesFileType: TStringField;
    MemFilesFilePath: TStringField;
    MemFilesFileOpt: TIntegerField;
    MemFilesICON: TStringField;
    DSMemFiles: TDataSource;
    GridRepositoryScanDoc: TcxGridViewRepository;
    ViewCompanyDocs: TcxGridDBTableView;
    ViewCompanyDocsDOCID: TcxGridDBColumn;
    ViewCompanyDocsDOCNAME: TcxGridDBColumn;
    ViewCompanyDocsCalcFilaCount: TcxGridDBColumn;
    ViewCompanyDocsCATEGORYID: TcxGridDBColumn;
    ViewFiles: TcxGridDBTableView;
    ViewFilesRecId: TcxGridDBColumn;
    ViewFilesFileName: TcxGridDBColumn;
    ViewFilesFileDate: TcxGridDBColumn;
    ViewFilesFileSize: TcxGridDBColumn;
    ViewFilesFileType: TcxGridDBColumn;
    ViewFilesFilePath: TcxGridDBColumn;
    ViewFilesFileOpt: TcxGridDBColumn;
    ViewFilesICON: TcxGridDBColumn;
    ViewDictSection: TcxGridDBTableView;
    ViewDictSectionDICTSECTIONID: TcxGridDBColumn;
    ViewDictSectionSECTIONNAME: TcxGridDBColumn;
    ViewDictSectionCOMMENTS: TcxGridDBColumn;
    ViewDictSectionItem: TcxGridDBTableView;
    ViewDictSectionItemITENID: TcxGridDBColumn;
    ViewDictSectionItemITEMNAME: TcxGridDBColumn;
    ViewDictSectionItemCOMMENTS: TcxGridDBColumn;
    ViewDictSectionItemDICTSECTIONID: TcxGridDBColumn;
    ViewDicSectionList: TcxGridDBTableView;
    ViewDicSectionListDICTSECTIONID: TcxGridDBColumn;
    ViewDicSectionListSECTIONNAME: TcxGridDBColumn;
    ViewDicSectionListCOMMENTS: TcxGridDBColumn;
    ViewDicSectionListSMALLICON: TcxGridDBColumn;
    ViewDicSectionListLARGEICON: TcxGridDBColumn;
    ViewDicSectionItemsList: TcxGridDBTableView;
    ViewDicSectionItemsListITEMID: TcxGridDBColumn;
    ViewDicSectionItemsListITEMNAME: TcxGridDBColumn;
    ViewDicSectionItemsListCOMMENTS: TcxGridDBColumn;
    ViewDicSectionItemsListDICTSECTIONID: TcxGridDBColumn;
    ViewDicSectionItemsListLARGEICON: TcxGridDBColumn;
    ViewDicSectionItemsListSMALLICON: TcxGridDBColumn;
    SelOurPersonQry: TADOQuery;
    SelOurPersonQryCOMPANYID: TIntegerField;
    SelOurPersonQryPERSONID: TIntegerField;
    SelOurPersonQryFULLNAME: TStringField;
    SelOurPersonQryOCCUPATION: TStringField;
    SelOurPersonQrySIGNRIGHT: TStringField;
    SelOurPersonQryERRANDNO: TStringField;
    SelOurPersonQryERRANDFROM: TDateTimeField;
    SelOurPersonQryERRANDTO: TDateTimeField;
    SelOurPersonQryCalcFullName: TStringField;
    SelOurPersonSrc: TDataSource;
    SeFromPartnerPersonQry: TADOQuery;
    SeFromPartnerPersonQryCOMPANYID: TIntegerField;
    SeFromPartnerPersonQryPERSONID: TIntegerField;
    SeFromPartnerPersonQryNAME: TStringField;
    SeFromPartnerPersonQrySECONDNAME: TStringField;
    SeFromPartnerPersonQryFULLNAME: TStringField;
    SeFromPartnerPersonQryOCCUPATION: TStringField;
    SeFromPartnerPersonQrySIGNRIGHT: TStringField;
    SeFromPartnerPersonQryCalcFullName: TStringField;
    SeFromPartnerPersonSrc: TDataSource;
    GridViewRepository: TcxGridViewRepository;
    ViewEmail: TcxGridDBTableView;
    ViewEmailCOMPANYID: TcxGridDBColumn;
    ViewEmailOFFICEID: TcxGridDBColumn;
    ViewEmailEMAILID: TcxGridDBColumn;
    ViewEmailEMAIL: TcxGridDBColumn;
    ViewWebSite: TcxGridDBTableView;
    ViewWebSiteOFFICEID: TcxGridDBColumn;
    ViewWebSiteWEBSITEID: TcxGridDBColumn;
    ViewWebSiteWEBSITE: TcxGridDBColumn;
    ViewPhone: TcxGridDBTableView;
    ViewPhoneCOMPANYID: TcxGridDBColumn;
    ViewPhoneOFFICEID: TcxGridDBColumn;
    ViewPhonePHONEID: TcxGridDBColumn;
    ViewPhoneCNTRYCODE: TcxGridDBColumn;
    ViewPhoneAREACODE: TcxGridDBColumn;
    ViewPhonePHONENO: TcxGridDBColumn;
    ViewPhoneEXTENTION: TcxGridDBColumn;
    ViewPhoneISDEFPHN: TcxGridDBColumn;
    ViewPhoneISREDPHN: TcxGridDBColumn;
    ViewPhonePBXSPEEDCODE: TcxGridDBColumn;
    ViewPhoneCalcPhoneNo: TcxGridDBColumn;
    ViewFax: TcxGridDBTableView;
    ViewFaxCOMPANYID: TcxGridDBColumn;
    ViewFaxOFFICEID: TcxGridDBColumn;
    ViewFaxPHONEID: TcxGridDBColumn;
    ViewFaxCNTRYCODE: TcxGridDBColumn;
    ViewFaxAREACODE: TcxGridDBColumn;
    ViewFaxPHONENO: TcxGridDBColumn;
    ViewFaxEXTENTION: TcxGridDBColumn;
    ViewFaxISDEFFAX: TcxGridDBColumn;
    ViewFaxISENABLED: TcxGridDBColumn;
    ViewFaxISENABLED2: TcxGridDBColumn;
    ViewFaxPBXSPEEDCODE: TcxGridDBColumn;
    ViewPerson: TcxGridDBTableView;
    ViewPersonCOMPANYID: TcxGridDBColumn;
    ViewPersonPERSONID: TcxGridDBColumn;
    ViewPersonFULLNAME: TcxGridDBColumn;
    ViewPersonOCCUPATION: TcxGridDBColumn;
    ViewPersonDISMISSED: TcxGridDBColumn;
    ViewPersonNOTACCESSED: TcxGridDBColumn;
    ViewContract: TcxGridDBTableView;
    ViewContractCOMPCONTRACTID: TcxGridDBColumn;
    ViewContractCONTRACTNAME: TcxGridDBColumn;
    ViewContractNUMCONTRACT: TcxGridDBColumn;
    ViewContractSIGNDATE: TcxGridDBColumn;
    ViewContractFROMDATE: TcxGridDBColumn;
    ViewContractTILLDATE: TcxGridDBColumn;
    ViewContractINVALID: TcxGridDBColumn;
    ViewContractPERMREREESTR: TcxGridDBColumn;
    ViewContractLog: TcxGridDBTableView;
    ViewContractLogCONTRACTLOGID: TcxGridDBColumn;
    ViewContractLogLOGDATETIME: TcxGridDBColumn;
    ViewContractLogMANAGER: TcxGridDBColumn;
    ViewContractLogSUBCATEGORY: TcxGridDBColumn;
    ViewContractLogSUBCATEGNAME: TcxGridDBColumn;
    ViewContractLogLOGPROMPT: TcxGridDBColumn;
    ViewContractLogCalcLog: TcxGridDBColumn;
    ViewContractLogLOGCATEGORY: TcxGridDBColumn;
    ViewContractLogFILENAME: TcxGridDBColumn;
    ViewCompNote: TcxGridDBTableView;
    ViewCompNoteCOMPNOTEID: TcxGridDBColumn;
    ViewCompNoteMEMO: TcxGridDBColumn;
    ViewCompNoteADDDATE: TcxGridDBColumn;
    ViewCompNoteCalcCategoryNote: TcxGridDBColumn;
    ViewCompNoteADDMANAGER: TcxGridDBColumn;
    ViewCompNoteCalcMemo: TcxGridDBColumn;
    ViewCompNoteTYPENOTE: TcxGridDBColumn;
    ViewCompNoteTYPENOTENAME: TcxGridDBColumn;
    ViewCompNoteCATEGORYNOTE: TcxGridDBColumn;
    ViewCompNoteNDATE: TcxGridDBColumn;
    ViewCompNoteFIXNDATE: TcxGridDBColumn;
    ViewOrderList: TcxGridDBTableView;
    ViewOrderListORDERID: TcxGridDBColumn;
    ViewOrderListDATEANDTIME: TcxGridDBColumn;
    ViewOrderListCalcState: TcxGridDBColumn;
    ViewOrderListCalcState2: TcxGridDBColumn;
    ViewOrderListTOURNAME: TcxGridDBColumn;
    ViewOrderListSPECIALDATEID: TcxGridDBColumn;
    ViewOrderListTOURDATE: TcxGridDBColumn;
    ViewOrderListPERSONCOUNT: TcxGridDBColumn;
    ViewOrderListSPECIALNAME: TcxGridDBColumn;
    ViewOrderListSTATE: TcxGridDBColumn;
    ViewOrderListSTATE2: TcxGridDBColumn;
    ViewEmailList: TcxGridDBTableView;
    ViewEmailListEMAILID: TcxGridDBColumn;
    ViewEmailListEMAIL: TcxGridDBColumn;
    ViewEmailListALIAS: TcxGridDBColumn;
    ViewEmailListISENABLED: TcxGridDBColumn;
    ViewEmailListISENABLED2: TcxGridDBColumn;
    ViewEmailListMEMO: TcxGridDBColumn;
    ViewOfficesList: TcxGridDBTableView;
    ViewOfficesListOFFICEID: TcxGridDBColumn;
    ViewOfficesListCOMPANYID: TcxGridDBColumn;
    ViewOfficesListCOUNTRYID: TcxGridDBColumn;
    ViewOfficesListCalcAddress: TcxGridDBColumn;
    ViewSelOurPersonList: TcxGridDBTableView;
    ViewSelOurPersonListCOMPANYID: TcxGridDBColumn;
    ViewSelOurPersonListPERSONID: TcxGridDBColumn;
    ViewSelOurPersonListFULLNAME: TcxGridDBColumn;
    ViewSelOurPersonListOCCUPATION: TcxGridDBColumn;
    ViewSelOurPersonListSIGNRIGHT: TcxGridDBColumn;
    ViewSelOurPersonListERRANDNO: TcxGridDBColumn;
    ViewSelOurPersonListERRANDFROM: TcxGridDBColumn;
    ViewSelOurPersonListERRANDTO: TcxGridDBColumn;
    ViewSelOurPersonListCalcFullName: TcxGridDBColumn;
    ViewSeFromPartnerPersonList: TcxGridDBTableView;
    ViewSeFromPartnerPersonListCOMPANYID: TcxGridDBColumn;
    ViewSeFromPartnerPersonListPERSONID: TcxGridDBColumn;
    ViewSeFromPartnerPersonListNAME: TcxGridDBColumn;
    ViewSeFromPartnerPersonListSECONDNAME: TcxGridDBColumn;
    ViewSeFromPartnerPersonListFULLNAME: TcxGridDBColumn;
    ViewSeFromPartnerPersonListOCCUPATION: TcxGridDBColumn;
    ViewSeFromPartnerPersonListSIGNRIGHT: TcxGridDBColumn;
    ViewSeFromPartnerPersonListCalcFullName: TcxGridDBColumn;
    BrowseImgList: TImageList;
    OfficeQryID_CITY_ADM_UNIT: TIntegerField;
    GridKindBranch: TcxGrid;
    GridKindBranchDBTableView1: TcxGridDBTableView;
    GridKindBranchLevel1: TcxGridLevel;
    COMPANIES_PARAM_DATA: TADOQuery;
    COMPANIES_PARAM_DATAID: TIntegerField;
    COMPANIES_PARAM_DATAID_COMPANIES: TIntegerField;
    COMPANIES_PARAM_DATAID_COMPANIES_PARAM_NAME: TIntegerField;
    COMPANIES_PARAM_DATAAVALUE: TIntegerField;
    COMPANIES_PARAM_DATANAME: TStringField;
    COMPANIES_PARAM_DATASrc: TDataSource;
    ViewCompaniesParamDataList: TcxGridDBTableView;
    ViewCompaniesParamDataListID: TcxGridDBColumn;
    ViewCompaniesParamDataListID_COMPANIES: TcxGridDBColumn;
    ViewCompaniesParamDataListID_COMPANIES_PARAM_NAME: TcxGridDBColumn;
    ViewCompaniesParamDataListAVALUE: TcxGridDBColumn;
    ViewCompaniesParamDataListNAME: TcxGridDBColumn;
    Panel2: TPanel;
    butDelKindBranch: TSpeedButton;
    butAddKindBranch: TSpeedButton;
    COMPANIES_PARAM_DATAATYPE: TIntegerField;
    ViewCompaniesParamDataListATYPE: TcxGridDBColumn;
    Comunication_PersonQry: TADOQuery;
    Comunication_PersonSrc: TDataSource;
    ViewComunicationPerson: TcxGridDBTableView;
    ViewComunicationPersonID: TcxGridDBColumn;
    ViewComunicationPersonID_COMPPERSONS: TcxGridDBColumn;
    ViewComunicationPersonID_COMUNICATION_TYPE: TcxGridDBColumn;
    ViewComunicationPersonAVALUE: TcxGridDBColumn;
    Panel5: TPanel;
    GridDoc: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    Panel6: TPanel;
    butDelPersons: TSpeedButton;
    butEditPersons: TSpeedButton;
    butAddPersons: TSpeedButton;
    WordUpBtn: TSpeedButton;
    GridPerson: TcxGrid;
    GridPersonDBTableView1: TcxGridDBTableView;
    GridPersonLevel1: TcxGridLevel;
    ViewPersonNAME: TcxGridDBColumn;
    ViewPersonSECONDNAME: TcxGridDBColumn;
    ViewPersonMEMO: TcxGridDBColumn;
    ViewPersonLASTNAME: TcxGridDBColumn;
    PersonQryDISMISSED: TStringField;
    PersonQryNOTACCESSED: TStringField;
    PersonQryLASTNAME: TStringField;
    PersonQryADDMANID: TIntegerField;
    PersonQryMEMO: TMemoField;
    ViewPersonADDMANID: TcxGridDBColumn;
    PersonQryNAMEFORCONTRACT: TStringField;
    ViewPersonNAMEFORCONTRACT: TcxGridDBColumn;
    Panel8: TPanel;
    Panel7: TPanel;
    Label22: TLabel;
    PersonQryCalcFullName: TStringField;
    Comunication_PersonQryID: TIntegerField;
    Comunication_PersonQryID_COMPPERSONS: TIntegerField;
    Comunication_PersonQryID_COMUNICATION_TYPE: TIntegerField;
    Comunication_PersonQryAVALUE: TStringField;
    Comunication_PersonQryICON: TBlobField;
    ViewComunicationPersonICON: TcxGridDBColumn;
    Comunication_PersonQryWEBLINK: TStringField;
    Comunication_PersonQryTEMPLATE: TStringField;
    ViewComunicationPersonWEBLINK: TcxGridDBColumn;
    ViewComunicationPersonTEMPLATE: TcxGridDBColumn;
    Comunication_CompanyQry: TADOQuery;
    Comunication_CompanySrc: TDataSource;
    Comunication_CompanyQryID: TIntegerField;
    Comunication_CompanyQryID_COMPANY: TIntegerField;
    Comunication_CompanyQryID_COMUNICATION_TYPE: TIntegerField;
    Comunication_CompanyQryAVALUE: TStringField;
    Comunication_CompanyQryICON: TBlobField;
    Comunication_CompanyQryWEBLINK: TStringField;
    Comunication_CompanyQryTEMPLATE: TStringField;
    ViewComunicationCompany: TcxGridDBTableView;
    ViewComunicationCompanyID: TcxGridDBColumn;
    ViewComunicationCompanyID_COMPANY: TcxGridDBColumn;
    ViewComunicationCompanyID_COMUNICATION_TYPE: TcxGridDBColumn;
    ViewComunicationCompanyAVALUE: TcxGridDBColumn;
    ViewComunicationCompanyICON: TcxGridDBColumn;
    ViewComunicationCompanyWEBLINK: TcxGridDBColumn;
    ViewComunicationCompanyTEMPLATE: TcxGridDBColumn;
    ViewOffices: TcxGridDBTableView;
    ViewOfficesOFFICEID: TcxGridDBColumn;
    ViewOfficesCOMPANYID: TcxGridDBColumn;
    ViewOfficesCOUNTRYID: TcxGridDBColumn;
    ViewOfficesISDEFAULT: TcxGridDBColumn;
    ViewOfficesHEADOFFICE: TcxGridDBColumn;
    ViewOfficesOFFICENAME: TcxGridDBColumn;
    ViewOfficesZIPCODE: TcxGridDBColumn;
    ViewOfficesSTRKIND: TcxGridDBColumn;
    ViewOfficesADDRESS: TcxGridDBColumn;
    ViewOfficesHOUSE: TcxGridDBColumn;
    ViewOfficesTENEMENT: TcxGridDBColumn;
    ViewOfficesCITY: TcxGridDBColumn;
    ViewOfficesCITY_ENG: TcxGridDBColumn;
    ViewOfficesITSMAILADDRESS: TcxGridDBColumn;
    ViewOfficesCOUNTRY: TcxGridDBColumn;
    ViewOfficesCOUNTRY_ENG: TcxGridDBColumn;
    ViewOfficesLATNAME: TcxGridDBColumn;
    ViewOfficesTENEMENTNULL: TcxGridDBColumn;
    ViewOfficesADDMANID: TcxGridDBColumn;
    ViewOfficesCNTRYCODE: TcxGridDBColumn;
    ViewOfficesID_CITY_ADM_UNIT: TcxGridDBColumn;
    OfficeQryCalcAddres: TStringField;
    ViewOfficesALLADDRESS: TcxGridDBColumn;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    butAddCompanyComunication: TSpeedButton;
    butEditCompanyComunication: TSpeedButton;
    butDelCompanyComunication: TSpeedButton;
    GridComunicationCompany: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    Panel13: TPanel;
    Panel14: TPanel;
    butAddOfficeComunication: TSpeedButton;
    butEditOfficeComunication: TSpeedButton;
    butDelOfficeComunication: TSpeedButton;
    GridComunicationCompOffice: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    Comunication_Comp_OfficeQry: TADOQuery;
    Comunication_Comp_OfficeSrc: TDataSource;
    ViewComunication_Comp_Office: TcxGridDBTableView;
    ViewComunication_Comp_OfficeID: TcxGridDBColumn;
    ViewComunication_Comp_OfficeID_OFFICE: TcxGridDBColumn;
    ViewComunication_Comp_OfficeID_COMUNICATION_TYPE: TcxGridDBColumn;
    ViewComunication_Comp_OfficeICON: TcxGridDBColumn;
    Comunication_Comp_OfficeQryID: TIntegerField;
    Comunication_Comp_OfficeQryID_COMPANY: TIntegerField;
    Comunication_Comp_OfficeQryID_COMUNICATION_TYPE: TIntegerField;
    Comunication_Comp_OfficeQryAVALUE: TStringField;
    Comunication_Comp_OfficeQryICON: TBlobField;
    Comunication_Comp_OfficeQryWEBLINK: TStringField;
    Comunication_Comp_OfficeQryTEMPLATE: TStringField;
    Comunication_Comp_OfficeQryID_COMUNICATION_COMPANY: TIntegerField;
    Comunication_Comp_OfficeQryID_OFFICE: TIntegerField;
    ViewComunication_Comp_OfficeAVALUE: TcxGridDBColumn;
    ViewComunication_Comp_OfficeID_COMUNICATION_COMPANY: TcxGridDBColumn;
    Panel9: TPanel;
    GridComunications: TcxGrid;
    GridComunicationsDBTableView1: TcxGridDBTableView;
    GridComunicationsLevel1: TcxGridLevel;
    Panel16: TPanel;
    butAddPersonsComunication: TSpeedButton;
    buEditPersonsComunication: TSpeedButton;
    butDelPersonsComunication: TSpeedButton;
    butCallToLinklPersonsComunication: TSpeedButton;
    PersonQryID_COMPOFFICES: TIntegerField;
    ViewPersonID_COMPOFFICES: TcxGridDBColumn;
    ViewOfficesListOFFICENAME: TcxGridDBColumn;
    ViewComunicationCompanyList: TcxGridDBTableView;
    ViewComunicationCompanyListID: TcxGridDBColumn;
    ViewComunicationCompanyListID_COMPANY: TcxGridDBColumn;
    ViewComunicationCompanyListID_COMUNICATION_TYPE: TcxGridDBColumn;
    ViewComunicationCompanyListAVALUE: TcxGridDBColumn;
    ViewComunicationCompanyListICON: TcxGridDBColumn;
    ViewComunicationCompanyListWEBLINK: TcxGridDBColumn;
    ViewComunicationCompanyListTEMPLATE: TcxGridDBColumn;
    butCallToLinklCompanyComunication: TSpeedButton;
    butCallToLinklOfficeComunication: TSpeedButton;
    Panel15: TPanel;
    Panel17: TPanel;
    butAddAddres: TSpeedButton;
    butEditAddres: TSpeedButton;
    butDelAddres: TSpeedButton;
    GridOffices: TcxGrid;
    GridOfficesDBTableView1: TcxGridDBTableView;
    GridOfficesLevel1: TcxGridLevel;
    ViewComunication_Comp_OfficeID_COMPANY: TcxGridDBColumn;
    ViewComunication_Comp_OfficeWEBLINK: TcxGridDBColumn;
    ViewComunication_Comp_OfficeTEMPLATE: TcxGridDBColumn;
    Panel18: TPanel;
    Panel19: TPanel;
    butAddCopmPersonComunication: TSpeedButton;
    butEditCopmPersonComunication: TSpeedButton;
    butDelCopmPersonComunication: TSpeedButton;
    butCallToLinklComPersonsComunication: TSpeedButton;
    GridComunicationCompPerson: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    Comunication_Comp_PersonQry: TADOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    BlobField1: TBlobField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField4: TIntegerField;
    Comunication_Comp_PersonSrc: TDataSource;
    ViewComunication_Comp_Person: TcxGridDBTableView;
    Comunication_Comp_PersonQryID_COMPPERSONS: TIntegerField;
    ViewComunication_Comp_PersonID: TcxGridDBColumn;
    ViewComunication_Comp_PersonID_COMPANY: TcxGridDBColumn;
    ViewComunication_Comp_PersonID_COMUNICATION_TYPE: TcxGridDBColumn;
    ViewComunication_Comp_PersonAVALUE: TcxGridDBColumn;
    ViewComunication_Comp_PersonICON: TcxGridDBColumn;
    ViewComunication_Comp_PersonWEBLINK: TcxGridDBColumn;
    ViewComunication_Comp_PersonTEMPLATE: TcxGridDBColumn;
    ViewComunication_Comp_PersonID_COMUNICATION_COMPANY: TcxGridDBColumn;
    ViewComunication_Comp_PersonID_COMPPERSONS: TcxGridDBColumn;
    Panel20: TPanel;
    GridBankAccount: TcxGrid;
    GridBankAccountDBTableView1: TcxGridDBTableView;
    GridBankAccountLevel1: TcxGridLevel;
    ViewAccounts: TcxGridDBTableView;
    ViewAccountsCOMPANYID: TcxGridDBColumn;
    ViewAccountsACCOUNTID: TcxGridDBColumn;
    ViewAccountsBANKID: TcxGridDBColumn;
    ViewAccountsACCOUNTNO: TcxGridDBColumn;
    ViewAccountsBANKNAME: TcxGridDBColumn;
    ViewAccountsBANKADDRESS: TcxGridDBColumn;
    ViewAccountsBANKMFO: TcxGridDBColumn;
    Panel21: TPanel;
    butAddAccount: TSpeedButton;
    butEditAccount: TSpeedButton;
    butDelAccount: TSpeedButton;
    PanelFramePayState: TPanel;
    FrameRequsiteCompanyPayState: TFrameCompanyPayState;
    CompTaxSystemLogQry: TADOQuery;
    CompTaxSystemLogQryTAXSYSTEMID: TIntegerField;
    CompTaxSystemLogQryFROMDATE: TDateTimeField;
    CompTaxSystemLogQryTODATE: TDateTimeField;
    CompTaxSystemLogQryMANID: TIntegerField;
    CompTaxSystemLogQryEDITDATE: TDateTimeField;
    CompTaxSystemLogQryMANAGER: TIBStringField;
    CompTaxSystemLogQryTAXNAME: TStringField;
    CompTaxSystemLogQryINCOMETAXABS: TFloatField;
    CompTaxSystemLogQryINCOMETAXVAL: TFloatField;
    CompTaxSystemLogQryPAYER: TSmallintField;
    CompTaxSystemLogQryCalcNameTax: TStringField;
    CompTaxSystemLogQryPDVSUM: TFloatField;
    CompTaxSystemLogQryTAXDETAILID: TIntegerField;
    CompTaxSystemLogQryTAXSYSTEMTODATE: TDateTimeField;
    CompTaxSystemLogQrySINGLETAXTYPEID: TIntegerField;
    CompTaxSystemLogQryTAXPAYTYPEID: TIntegerField;
    CompTaxSystemLogQryTAXPAYCODE: TStringField;
    CompTaxSystemLogQryTAXPAYREGDATE: TDateTimeField;
    CompTaxSystemLogQrycomptaxsystemlogid: TIntegerField;
    CompTaxSystemLogQryCOMPANYID: TIntegerField;
    ViewCompTaxSystemLog: TcxGridDBTableView;
    CompTaxSystemLogSrc: TDataSource;
    ViewCompTaxSystemLogTAXSYSTEMID: TcxGridDBColumn;
    ViewCompTaxSystemLogFROMDATE: TcxGridDBColumn;
    ViewCompTaxSystemLogTODATE: TcxGridDBColumn;
    ViewCompTaxSystemLogMANID: TcxGridDBColumn;
    ViewCompTaxSystemLogEDITDATE: TcxGridDBColumn;
    ViewCompTaxSystemLogMANAGER: TcxGridDBColumn;
    ViewCompTaxSystemLogTAXNAME: TcxGridDBColumn;
    ViewCompTaxSystemLogINCOMETAXABS: TcxGridDBColumn;
    ViewCompTaxSystemLogINCOMETAXVAL: TcxGridDBColumn;
    ViewCompTaxSystemLogPAYER: TcxGridDBColumn;
    ViewCompTaxSystemLogCalcNameTax: TcxGridDBColumn;
    ViewCompTaxSystemLogPDVSUM: TcxGridDBColumn;
    ViewCompTaxSystemLogTAXDETAILID: TcxGridDBColumn;
    ViewCompTaxSystemLogTAXSYSTEMTODATE: TcxGridDBColumn;
    ViewCompTaxSystemLogSINGLETAXTYPEID: TcxGridDBColumn;
    ViewCompTaxSystemLogTAXPAYTYPEID: TcxGridDBColumn;
    ViewCompTaxSystemLogTAXPAYCODE: TcxGridDBColumn;
    ViewCompTaxSystemLogTAXPAYREGDATE: TcxGridDBColumn;
    ViewCompTaxSystemLogcomptaxsystemlogid: TcxGridDBColumn;
    ViewCompTaxSystemLogCOMPANYID: TcxGridDBColumn;
    ViewCompTaxSystemLogList: TcxGridDBTableView;
    ViewCompTaxSystemLogListTAXSYSTEMID: TcxGridDBColumn;
    ViewCompTaxSystemLogListFROMDATE: TcxGridDBColumn;
    ViewCompTaxSystemLogListTODATE: TcxGridDBColumn;
    ViewCompTaxSystemLogListMANID: TcxGridDBColumn;
    ViewCompTaxSystemLogListEDITDATE: TcxGridDBColumn;
    ViewCompTaxSystemLogListMANAGER: TcxGridDBColumn;
    ViewCompTaxSystemLogListTAXNAME: TcxGridDBColumn;
    ViewCompTaxSystemLogListINCOMETAXABS: TcxGridDBColumn;
    ViewCompTaxSystemLogListINCOMETAXVAL: TcxGridDBColumn;
    ViewCompTaxSystemLogListPAYER: TcxGridDBColumn;
    ViewCompTaxSystemLogListCalcNameTax: TcxGridDBColumn;
    ViewCompTaxSystemLogListPDVSUM: TcxGridDBColumn;
    ViewCompTaxSystemLogListTAXDETAILID: TcxGridDBColumn;
    ViewCompTaxSystemLogListTAXSYSTEMTODATE: TcxGridDBColumn;
    ViewCompTaxSystemLogListSINGLETAXTYPEID: TcxGridDBColumn;
    ViewCompTaxSystemLogListTAXPAYTYPEID: TcxGridDBColumn;
    ViewCompTaxSystemLogListTAXPAYCODE: TcxGridDBColumn;
    ViewCompTaxSystemLogListTAXPAYREGDATE: TcxGridDBColumn;
    ViewCompTaxSystemLogListcomptaxsystemlogid: TcxGridDBColumn;
    ViewCompTaxSystemLogListCOMPANYID: TcxGridDBColumn;
    Panel22: TPanel;
    Panel23: TPanel;
    ContractAddNewBtn: TSpeedButton;
    ContractEditBtn: TSpeedButton;
    AgentContractBtn: TSpeedButton;
    butContractReRestr: TSpeedButton;
    ActionContractBtn: TSpeedButton;
    ContractSendDocBtn: TSpeedButton;
    ContractOpenDocBtn: TSpeedButton;
    GridContract: TcxGrid;
    GridContractDBTableView1: TcxGridDBTableView;
    GridContractLevel1: TcxGridLevel;
    Panel24: TPanel;
    GridFiles: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    OfficeQrySALEPOINT: TIntegerField;
    ViewOfficesSALEPOINT: TcxGridDBColumn;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Comunication_Comp_OfficeQryISDEF: TIntegerField;
    ViewComunication_Comp_OfficeISDEF: TcxGridDBColumn;
    Comunication_CompanyQryFORMAT_OUT: TStringField;
    ViewComunicationCompanyFORMAT_OUT: TcxGridDBColumn;
    Comunication_Comp_OfficeQryFORMAT_OUT: TStringField;
    ViewComunication_Comp_OfficeFORMAT_OUT: TcxGridDBColumn;
    Comunication_PersonQryNAME: TStringField;
    Comunication_PersonQryFORMAT_OUT: TStringField;
    Comunication_Comp_PersonQryFORMAT_OUT: TStringField;
    ViewComunicationPersonNAME: TcxGridDBColumn;
    ViewComunicationPersonFORMAT_OUT: TcxGridDBColumn;
    ViewComunication_Comp_PersonFORMAT_OUT: TcxGridDBColumn;
    OfficeQryALLADDRESS: TStringField;
    LSheet: TcxStyleRepository;
    cxStyle216: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    DBRichEdit: TcxDBMemo;
    procedure butAddAddresClick(Sender: TObject);
    procedure butEditAddresClick(Sender: TObject);
    procedure butDelAddresClick(Sender: TObject);
    procedure WebSiteBtnClick(Sender: TObject);
    procedure butAddPhonesClick(Sender: TObject);
    procedure butEditPhonesClick(Sender: TObject);
    procedure butDelPhonesClick(Sender: TObject);
    procedure butAddFaxClick(Sender: TObject);
    procedure butEditFaxClick(Sender: TObject);
    procedure butDelFaxClick(Sender: TObject);
    procedure FaxUpBtnClick(Sender: TObject);
    procedure WordUpBtnClick(Sender: TObject);
    procedure ContractAddNewBtnClick(Sender: TObject);
    procedure ContractEditBtnClick(Sender: TObject);
    procedure AgentContractBtnClick(Sender: TObject);
    procedure butContractReRestrClick(Sender: TObject);
    procedure ContractOpenDocBtnClick(Sender: TObject);
    procedure butAddNoteClick(Sender: TObject);
    procedure butPreviewNoteClick(Sender: TObject);
    procedure GridDropTextTargetDragOver(Sender: TObject;
      ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
    procedure ViewCompanyDocsFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewContractLogCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure PersonQryCalcFields(DataSet: TDataSet);
    procedure PhoneQry_NewRecord(DataSet: TDataSet);
    procedure FaxQry_NewRecord(DataSet: TDataSet);
    procedure butAddKindBranchClick(Sender: TObject);
    procedure butDelKindBranchClick(Sender: TObject);
    procedure COMPANIES_PARAM_DATAAfterInsert(DataSet: TDataSet);
    procedure butAddPersonsClick(Sender: TObject);
    procedure butEditPersonsClick(Sender: TObject);
    procedure butDelPersonsClick(Sender: TObject);
    procedure butAddPersonsComunicationClick(Sender: TObject);
    procedure buEditPersonsComunicationClick(Sender: TObject);
    procedure butDelPersonsComunicationClick(Sender: TObject);
    procedure ViewComunicationPersonDblClick(Sender: TObject);
    procedure butCallToLinklPersonsComunicationClick(Sender: TObject);
    procedure ViewPersonFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewComunicationPersonID_COMUNICATION_TYPEPropertiesEditValueChanged(
      Sender: TObject);

   procedure  ViewComunicationCompanyID_COMUNICATION_TYPEPropertiesEditValueChanged(
      Sender: TObject);
    procedure OfficeQryCalcFields(DataSet: TDataSet);
    procedure butAddCompanyComunicationClick(Sender: TObject);
    procedure butEditCompanyComunicationClick(Sender: TObject);
    procedure butDelCompanyComunicationClick(Sender: TObject);
    procedure butAddOfficeComunicationClick(Sender: TObject);
    procedure butEditOfficeComunicationClick(Sender: TObject);
    procedure butDelOfficeComunicationClick(Sender: TObject);
    procedure butCallToLinklCompanyComunicationClick(Sender: TObject);
    procedure butCallToLinklOfficeComunicationClick(Sender: TObject);
    procedure butCallToLinklComPersonsComunicationClick(Sender: TObject);
    procedure butAddCopmPersonComunicationClick(Sender: TObject);
    procedure butEditCopmPersonComunicationClick(Sender: TObject);
    procedure butDelCopmPersonComunicationClick(Sender: TObject);
    procedure ViewComunicationCompanyDblClick(Sender: TObject);
    procedure ViewComunication_Comp_OfficeDblClick(Sender: TObject);
    procedure ViewComunication_Comp_PersonDblClick(Sender: TObject);
    procedure ViewOfficesDblClick(Sender: TObject);
    procedure butAddAccountClick(Sender: TObject);
    procedure butEditAccountClick(Sender: TObject);
    procedure butDelAccountClick(Sender: TObject);
    procedure ViewAccountsDblClick(Sender: TObject);
    procedure ViewComunicationCompanyAVALUEPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure ViewComunicationPersonAVALUEPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure ViewCompanyDocsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure DropTextTargetDrop(Sender: TObject; ShiftState: TShiftState;
      APoint: TPoint; var Effect: Integer);
    procedure PageControlChange(Sender: TObject);
    procedure ViewComunicationCompanyCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewComunication_Comp_OfficeCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewComunicationPersonCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewComunication_Comp_PersonCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewFilesFileSizeGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
  private

    FOffRecNo : Integer;
    FAccRecNo : Integer;
    FCorrRecNo: Integer;
    FPersRecNo: Integer;
    FDraggedFile :Boolean;

    FElemCompanyQry : TDBShemaView;
    FElemTypeNotesQry : TDBShemaView;
    FElemCOMPCONTRACTSKINDQry : TDBShemaView;
    FElemCompanyDocsQry : TDBShemaView;
    FElemCompaniesParamName : TDBShemaView;
    FElemOCCUPATIONS : TDBShemaView;
    FElemComunicationType:TDBShemaView;
    //FElemCompTaxLogMemTableEh : TDBShemaView;
    //FElemCompTaxSystemLogQry : TDBShemaView;
    FElemTypeDocumQry : TDBShemaView;
    FElemSelCompAction: TDBShemaView;
    FElemSelTaxSystemQry :TDBShemaView;
    FElemUsersQry:TDBShemaView;
    FElemCompContractNumsQry: TDBShema;

    FViewStyle: TcxGridTableViewStyleSheet;
    FCurManager: Integer;
    FCurManagerName :WideString;
    //FLevMngPermis :Integer;
    FCanUpdate :Boolean;
    FStoreFileName :WideString;
    ViewFlesDocItemRow: TcxCustomGridRecord;
    
    function  GetDefMail: string;
    procedure FContractAgentSendMail(const FileName: string);
    function  FGetPathToDoc: string;
    function  FGetCountRecCompanyGridDB:Integer;
    procedure ContractActionExecute( aTag: Integer );
    procedure CopyFileProc(FileName: string);
    procedure StoreContractRcv;
    procedure FUpdateCompanyProperties;
    function  GetContractType: Integer;
    function  FillDocument( TypeTempl: Integer ): Boolean;
    function  CheckCompanyData: Boolean;
    function  CompanyAreLicenseDoc: Boolean;
    procedure UpdateContract( ActionTag:Integer );

    procedure UpdateAddres(isNew:Boolean);
    Function  FPrepareShowAddres:TParamCompAddres;
    procedure FPrepareViewColumns;
    procedure FPrepareControls(CanUpdate:Boolean);

    procedure FPrepareConnectionDataset;
    procedure PrepareEmailsPhoneFilter;
    procedure FPrepareViewGrid;
    procedure FPrepareDS;
    procedure FPrepareHotelCompanyEnterprice( paramHotel : TParamHotelEnterprise; ElemOffice:TDBShema  );

    procedure OrderListGridDblClick(Sender: TObject);
    procedure RecordEditContract(Sender: TObject);
    procedure RecordEditPerson(Sender: TObject);
    procedure EditPerson(isNew:Boolean);
    procedure FPrepareExLupColumn( aColum: TcxGridDBColumn );
    procedure CompanyDocsQryCalcFields(DataSet: TDataSet);
    procedure UpdateGridDrop;
    { Private declarations }
  public
    { Public declarations }
    ViewFlesDocs : TViewFilesIE;
    FAdoConnection : TAdoConnection;

    Elem_OfficeQry : TDBShemaView;
    Elem_PersonQry : TDBShemaView;
    Elem_AccountQry : TDBShemaView;
    Elem_ContractQry : TDBShemaView;
    Elem_LogContractQry : TDBShemaView;
    Elem_OrderListQry: TDBShemaView;
    Elem_CompNoteQry : TDBShemaView;
    Elem_ComFilesDoc : TDBShemaView;
    Elem_CompHeadPropQry:TDBShema;
    Elem_SelOurPersonQry : TDBShemaView;
    Elem_SeFromPartnerPersonQry : TDBShemaView;
    Elem_CompaniesParamData : TDBShemaView;
    Elem_CompTaxSystemLogQry : TDBShemaView;
    Elem_Comunication_PersonQry :TDBShemaView;
    Elem_Comunication_CompanyQry:TDBShemaView;
    Elem_Comunication_Comp_OfficeQry:TDBShemaView;
    Elem_Comunication_Comp_PersonQry:TDBShemaView;

    procedure InitElements;
    procedure PrepareCompCount;
    procedure RefreshControls;

    procedure ViewComunicationFormatDrawCell(FieldValue,FieldFormat:string;
                                             Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
                                             AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

    function  myStoreFileName(var Fldr, Subj: string; ReferId,
                             TypeFolder: Integer; aSaveExtPdf: Boolean = False): Boolean;

    procedure IntitComRquisitesFrame( ParamFrame:TParamComRequisitesFrame;  CanUpdate :Boolean; aCurrManager:Integer; aCurManagerName:Widestring  );
    procedure DestroyFrame;
    procedure ReQueryAllDbOffice;
    procedure SetManager(CurrManager:Integer; FCurManagerName:Widestring; CanUpdate:Boolean);
  protected
    property DraggedFile: Boolean read FDraggedFile write FDraggedFile;
    
  end;

    function CheckReadyToSynhronize( CurManager:Integer; ElemCompany:TDBShemaView; ShowError:Boolean  ):Integer;

    function MergeClientTo1CByClientId(ClientId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent:Boolean=true; AutoMerge:Boolean=false ):Integer;
    function MergeClientTo1C( ClientId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent:Boolean=true;AutoMerge:Boolean=false):Integer;
    function MergeClientAccountsTo1CByClientId( ClientId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent: Boolean=true; AutoMerge:boolean=false  ): Integer;
    function MergeClientAccountsTo1C( ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent: Boolean=true ):Integer;

    function MergeClientContractById( IdClient,IdContract:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowMessage:Boolean=false ) : Integer;
    function MergeClientContract( CompanyId , ContractId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowMessage:Boolean=false ) : Integer;

    procedure ShowMergeLog1C( ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true  );
    function  MergeAllContractsForIdClient( id:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true ):integer;
    procedure MergeAllForCurrentCompany( ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle  );

    procedure CheckForMargeContract( aParam: Integer; CompanyId, ContractId:Variant; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle );



    function GetPathContractFile(FileName: string; aElemCompanyQry:TDBShema ): string;
    //function GetItsHeadFax(aElemCompHeadPropQry:TDBShema): string;
    //function GetItsHeadPhone( aElemCompHeadPropQry:TDBShema ): string;
    //function GetItsHeadAddress( aElemCompHeadPropQry:TDBShema ): String;
    function GetItsCompanyTaxPayData( aElemCompHeadPropQry:TDBShema ): String;
    function GetDocumentFolder( aElemCompanyQry:TDBShema; CompanyId: Integer = 0 ): String;
    function GetDocumentFullName(aElemCompanyQry:TDBShema; const DocName: String): String;
    function SingContract( WordDocum:TWordDocument; WordApplic:TWordApplication ): Boolean;
    function GetPartners_DocsStoreFolder( const Company: String ): String;
    function GetPartners_ContractDocsStoreFolder( const Company: String ): String;
    function GetDefMail( aElemEmailQry:TDBShema ): string;
    function DoPrintContract( WordDocum:TWordDocument; WordApplic:TWordApplication; ElemCompany,ElemContract:TDBShemaView ): Boolean;
    function ContractSendMail( WordDocum:TWordDocument; WordApplic:TWordApplication;
                                aElemCompanyQry, aElemContractQry, aElemEmail:TDBShema;CurManagerName:String; GetPathFile: TGetPathFile = nil ): Boolean;
    function newPrintWordDocument(WordDocum:TWordDocument; WordApplic:TWordApplication;aElemCompany,aElemCOMPCONTRACTSKINDQry:TDBShemaView; DocId: Integer;
                                  FillProc: TFillWordDocProcNew; const SaveAs: String;
                                  IsBoss: Boolean; OnlyView: Boolean = False; ReGenerate: Boolean = False): Boolean;

implementation

uses Types,UnitContractEditForm;

{$R *.dfm}

function GetDocumentFolder( aElemCompanyQry:TDBShema; CompanyId: Integer = 0 ): String;
var Ok: Boolean;
begin
 { Ok := True;
  Result := OptionSet.StoreFolder;
  if not DirectoryExists(Result) then Ok := CreateFolder(Result, True);
  if Ok then
  begin
    Result := IncludeTrailingPathDelimiter(Result) + sContracts;
    if not DirectoryExists(Result) then Ok := CreateFolder(Result, True);
    if Ok then
    begin
      if CompanyId = 0 then Result := Result + PathDelim + aElemCompanyQry.DB.FieldByName('COMPANYID').AsString
      else Result := Result + PathDelim + IntToStr(CompanyId);
      if not DirectoryExists(Result) then Ok := CreateFolder(Result, True);
    end;
  end;
  if not Ok then ErrorFmtDlg(SVDlgsDirCreateFatal, [Result]);}

  Result := IncludeTrailingPathDelimiter(OptionSet.StoreFolder) + sContracts + PathDelim + aElemCompanyQry.GetValueIdStr + PathDelim;
  ExistsDir(Result);
  if not DirectoryExists(Result) then ErrorFmtDlg(SVDlgsDirCreateFatal, [Result]);
end;


function GetDocumentFullName(aElemCompanyQry:TDBShema; const DocName: String): String;
var Fldr: String;
begin
  Fldr := GetDocumentFolder(aElemCompanyQry);
  Result := GetLocalFileName(
    IncludeTrailingPathDelimiter(Fldr) + ExtractFileName(DocName));
end;

function GetContractStoreFolder( aElemCompanyQry:TDBShema; CompanyId: Integer): String;
var Fldr: string;
begin
  Fldr := GetDocumentFolder( aElemCompanyQry, CompanyId );
  Result := GetLocalFileName( IncludeTrailingPathDelimiter(Fldr) );
end;

function GetPathContractFile(FileName: string; aElemCompanyQry:TDBShema ): string;
begin
  Result := IncludeTrailingPathDelimiter( GetContractStoreFolder( aElemCompanyQry, aElemCompanyQry.DB.FieldByName('COMPIDFORCNTRCT').asInteger ) ) + FileName;
end;

{function GetItsHeadPhone( aElemCompHeadPropQry:TDBShema ): string;
begin
  Result := GetPhoneNumber(
    aElemCompHeadPropQry.DB.FieldByName('PHONECNTRYCODE'), aElemCompHeadPropQry.DB.FieldByName('PHONEAREACODE'),
    aElemCompHeadPropQry.DB.FieldByName('PHONENO'), aElemCompHeadPropQry.DB.FieldByName('PHONEEXT') );
end;

function GetItsHeadFax(aElemCompHeadPropQry:TDBShema): string;
begin
  Result := GetPhoneNumber(
    aElemCompHeadPropQry.DB.FieldByName('FAXCNTRYCODE'), aElemCompHeadPropQry.DB.FieldByName('FAXAREACODE'),
    aElemCompHeadPropQry.DB.FieldByName('FAXNO'), aElemCompHeadPropQry.DB.FieldByName('FAXEXT') );
end;

function GetItsHeadAddress(aElemCompHeadPropQry:TDBShema): String;
begin
  Result := GetOldAddressString(aElemCompHeadPropQry.DB.FieldByName('HEADSTRKIND'), aElemCompHeadPropQry.DB.FieldByName('HEADADDRESS'),
    aElemCompHeadPropQry.DB.FieldByName('HEADHOUSE'), aElemCompHeadPropQry.DB.FieldByName('HEADTENEMENT'),
    aElemCompHeadPropQry.DB.FieldByName('HEADCITYKIND'), aElemCompHeadPropQry.DB.FieldByName('HEADCITY'),
    aElemCompHeadPropQry.DB.FieldByName('HEADTOWNSHIP'), aElemCompHeadPropQry.DB.FieldByName('HEADPROVINCE'), aElemCompHeadPropQry.DB.FieldByName('HEADZIPCODE'), nil);
end; }

function GetItsCompanyTaxPayData( aElemCompHeadPropQry:TDBShema ): String;
begin
  if aElemCompHeadPropQry.DB.FieldByName('TAXPAYCODE').IsNull then Result := 'Не платник ПДВ'
  else Result := Format('Індивідуальний податковий № %s',
    [aElemCompHeadPropQry.DB.FieldByName('TAXPAYCODE').AsString]);
end;

function GetPartners_DocsStoreFolder( const Company: String ): String;
begin
  Result := IncludeTrailingPathDelimiter(OptionSet.StoreFolder) + sPartners_Docs + PathDelim + Company;
end;

function GetPartners_ContractDocsStoreFolder( const Company: String ): String;
begin
  Result := IncludeTrailingBackslash(GetPartners_DocsStoreFolder(Company)) + '6' + PathDelim;
  ForceDirectories(Result);
end;

function SingContract( WordDocum:TWordDocument; WordApplic:TWordApplication ): Boolean;
const
  sForTuorOp = 'Від Туроператора__________________	          ';
  sForTourAg = '	          Від Турагента__________________';
var
  nLeft, nTop, nWigth, nHigh, nLeftForSing: OleVariant;
  SaveWithDoc, nRange, NumPage: OleVariant;
  PageCount, I: Integer;
  TemplDir, sFooter: string;
  FooterRange: Range;
begin
 Result := True;
 try
   PageCount := WordDocum.ComputeStatistics(wdStatisticPages);
   FooterRange := WordDocum.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range;
   sFooter := FooterRange.Text;
   FooterRange.InsertBefore(sForTuorOp);
   FooterRange.InsertAfter(sForTourAg);
   FooterRange := WordDocum.Sections.Item(1).Footers.Item(wdHeaderFooterEvenPages).Range;
   sFooter := FooterRange.Text;
   FooterRange.InsertBefore(sForTuorOp);
   FooterRange.InsertAfter(sForTourAg);
   nLeft := 5;
   nLeftForSing := 40;
   nTop := 650;
   nWigth := 120;
   nHigh := 120;
   for I := 0 to PageCount do
   begin
     NumPage := I;
     nRange := WordDocum.GoTo_(EmptyParam, EmptyParam, NumPage);
     SaveWithDoc := True;
     TemplDir := IncludeTrailingPathDelimiter(OptionSet.StoreFolder) +
      IncludeTrailingPathDelimiter(sCntrctTempl);
     WordDocum.Shapes.AddPicture(TemplDir + sAlgolStamp,  EmptyParam, SaveWithDoc, nLeft, nTop, nWigth, nHigh, nRange);
     WordDocum.Shapes.AddPicture(TemplDir + sOlegSign, EmptyParam, SaveWithDoc, nLeftForSing, nTop, nWigth, nHigh, nRange);
   end;
 except
  Result := false;
 end
end;

function SetParamCompany( DBParam:TConnectDBParam; IDCOMPANY:Variant; ParamName:string;aValue:Variant):integer;
var SQL: string;
begin
  SQL:='EXECUTE PROCEDURE SET_COMPANY_PARAM( '+VarToStr(IDCOMPANY)+','''+ ParamName+''','+VarToStr(aValue)+' )';
  Result := DBUpdate( SQL, DBParam );
end;

function GetPDFContract( WordDocum:TWordDocument; WordApplic:TWordApplication;aElemCompanyQry:TDBShema;
                        DocName: string; OnlyConvert: Boolean = False): string;
var
  Template, NewTemplate, DocType, Vis, FileFormat, NotSave, I: OleVariant;
  TmpFile: string;
  HadDocum: _Document;
begin
  TmpFile := GetPathContractFile( DocName , aElemCompanyQry );
  Template := TmpFile;
  NewTemplate := False;
  Vis := False;
  DocType := 0;
  NotSave := False;
  if not OnlyConvert then WordApplicOpen( WordDocum,WordApplic, TmpFile, Template, NewTemplate, DocType, Vis);
  if OnlyConvert or SingContract( WordDocum, WordApplic ) then
  begin
    I := 1;
    HadDocum := WordApplic.Documents.Item(I) as _Document;
    FileFormat := nPDFFileFormat;
    TmpFile := ChangeFileExt(TmpFile, '.pdf');
    if FileExists(TmpFile) then DeleteFile(TmpFile);
    Template := TmpFile;
    WordDocum.SaveAs(Template, FileFormat);
    HadDocum.Close(NotSave, EmptyParam, EmptyParam);
  end else ErrorDlg(SDictSingContractError);
//  WordClose;
  Result := TmpFile;
end;

procedure UpdateClientOfficeAsEnterprise( ElemHotel, ElemOffice : TDBShema; CompanyId, NewCntryId, NewCityId:Variant );
var StateEditHotel:Boolean;
    CntryId, Id_City_Adm_Unit : Integer;
begin
  if not ( ElemHotel.DB.State in [ dsEdit, dsInsert ] ) then
    StateEditHotel := False
  else StateEditHotel := True;

  if not StateEditHotel then ElemHotel.DB.Edit;
  ElemHotel.DB.FieldByName('ENTERPRISEID').Value := CompanyId;
  with ElemHotel.DB.FieldByName('COUNTRYID') do if IsNull then CntryId := NewCntryId else CntryId := Value;
  with ElemHotel.DB.FieldByName('ID_CITY_ADM_UNIT') do if IsNull then Id_City_Adm_Unit := NewCityId else Id_City_Adm_Unit := Value;
  ElemHotel.DB.Post;

  ElemOffice.DBOpen;

  ElemOffice.DB.Edit;
  ElemOffice.DB.FieldByName('COUNTRYID').Value := CntryId;
  ElemOffice.DB.FieldByName('ID_CITY_ADM_UNIT').Value := Id_City_Adm_Unit;
  ElemOffice.DB.Post;
end;

Procedure UpdateParamCompanyForHotel( IDCompany:Variant; DBParam:TConnectDBParam );
var Sql : WideString;
    DB : TDataset;
begin
  if IDCompany <> null then
  begin
    SetParamCompany( DBParam, IDCompany, 'ISOTHER',1 );
    SetParamCompany( DBParam, IDCompany, 'ASHOTEL',1 );
  end;
end;

function AddClientAsEnterprise( HotelName, HotelKind, HotelCity, HotelCntry: String; ElemComEnterprice:TDBShema ):Variant;
var StateEditHotel:Boolean;
    DBParam:TConnectDBParam;
begin
  DBParam := ElemComEnterprice.DBGetParamConnect;

  if ElemComEnterprice.DB.IsEmpty then
    ElemComEnterprice.DB.Insert
  else ElemComEnterprice.DB.Edit;

  ElemComEnterprice.DBBooleanValue['ISHOTEL'] := True;
  ElemComEnterprice.DB.FieldByName('NAME').Value := MakeHotelEnterpriseName( HotelKind, HotelName, HotelCity, HotelCntry );
  ElemComEnterprice.DB.Post;

  result := ElemComEnterprice.GetValueId;
  UpdateParamCompanyForHotel( result, DBParam );
end;

procedure TFrameComRequisites.FPrepareHotelCompanyEnterprice( paramHotel : TParamHotelEnterprise; ElemOffice:TDBShema );
var CurrCompanyID :Variant;
begin
  if ( paramHotel.HotelId <> Unassigned) and ( paramHotel.HotelId <> null ) then
  begin
    CurrCompanyID := AddClientAsEnterprise( paramHotel.HotelName, paramHotel.HotelKindName, paramHotel.HoteCityName, paramHotel.HotelCountryName, paramHotel.ElemCompEnterpriseHotel );
    if CurrCompanyID <> null then
      UpdateClientOfficeAsEnterprise( paramHotel.ElemHotel, ElemOffice, CurrCompanyID, paramHotel.idCountry, paramHotel.idCity );

    self.RefreshControls;
  end;
end;
//******************************************************************************
procedure TFrameComRequisites.IntitComRquisitesFrame( ParamFrame:TParamComRequisitesFrame;  CanUpdate :Boolean; aCurrManager:Integer; aCurManagerName:Widestring );
var ElemCompanyParam:TParamCompanyPayState;
begin
  FAdoConnection := ParamFrame.AdoConnection;
  FElemCompanyQry :=ParamFrame.ElemCompanyQry;
  FElemTypeDocumQry := ParamFrame.ElemTypeDocumQry;
  FElemSelCompAction := ParamFrame.ElemSelCompAction;

  FElemCOMPCONTRACTSKINDQry := ParamFrame.ElemCOMPCONTRACTSKINDQry;
  FElemCompanyDocsQry := ParamFrame.ElemCompanyDocsQry;
  FElemTypeNotesQry := ParamFrame.ElemTypeNotesQry;
  FElemCompaniesParamName := ParamFrame.ElemCompaniesParamName;
  FElemOCCUPATIONS := ParamFrame.ElemOCCUPATIONS;
  FElemComunicationType := ParamFrame.ElemComunicationType;
  FElemSelTaxSystemQry := ParamFrame.ElemSelTaxSystemQry;
  FElemCompContractNumsQry := ParamFrame.ElemCompContractNumsQry;
  FElemUsersQry :=  ParamFrame.ElemUsersQry;

  FPrepareDS;

  ViewFlesDocs := TViewFilesIE.Create( ViewFiles, nil, nil );
  ViewFlesDocs.SetOptionView;
  FViewStyle  :=ParamFrame.ViewStyle;

  InitElements;

  ElemCompanyParam.ElemCompany:= self.FElemCompanyQry;
  ElemCompanyParam.ElemCompTaxSystemLogQry :=Elem_CompTaxSystemLogQry;
  ElemCompanyParam.ElemTypeDocumQry := FElemTypeDocumQry ;
  ElemCompanyParam.ElemSelCompAction := FElemSelCompAction;
  ElemCompanyParam.ElemSelTaxSystemQry := FElemSelTaxSystemQry;

  ViewFlesDocItemRow := nil;
  DraggedFile := False;

  FPrepareViewGrid;
  FPrepareControls(CanUpdate);
  FrameRequsiteCompanyPayState.IntitFrame( ElemCompanyParam, False );

  Elem_OrderListQry.View.OnDblClick := OrderListGridDblClick;
  Elem_ContractQry.View.OnDblClick := RecordEditContract;
  Elem_PersonQry.View.OnDblClick   := RecordEditPerson;

  PrepareCompCount;
  SetManager( aCurrManager, aCurManagerName, CanUpdate );
  if ( ParamFrame.ParamHotelEnterprise.HotelId <> Unassigned ) and
     ( ParamFrame.ParamHotelEnterprise.HotelId <> null ) then
    FPrepareHotelCompanyEnterprice( ParamFrame.ParamHotelEnterprise, self.Elem_OfficeQry );
end;

procedure TFrameComRequisites.RecordEditPerson(Sender: TObject);
begin
  if butEditPersons.Enabled then butEditPersons.Click;
end;

procedure TFrameComRequisites.FPrepareConnectionDataset;
begin
  OfficeQry.Connection :=FAdoConnection;
  ContractQry.Connection := FAdoConnection;
  LogContractQry.Connection := FAdoConnection;
  PersonQry.Connection := FAdoConnection;
  AccountQry.Connection := FAdoConnection;
  OrderListQry.Connection := FAdoConnection;
  CompNoteQry.Connection := FAdoConnection;
  SelOurPersonQry.Connection := FAdoConnection;
  CompHeadPropQry.Connection := FAdoConnection;
  SeFromPartnerPersonQry.Connection := FAdoConnection;
  COMPANIES_PARAM_DATA.Connection := FAdoConnection;
  Comunication_CompanyQry.Connection := FAdoConnection;
  Comunication_PersonQry.Connection := FAdoConnection;
  Comunication_Comp_PersonQry.Connection := FAdoConnection;
  Comunication_Comp_OfficeQry.Connection := FAdoConnection;
  CompTaxSystemLogQry.Connection := FAdoConnection;
end;

procedure TFrameComRequisites.InitElements;
var MaskTemplate : TMasMaskTemplate;
begin
  FPrepareConnectionDataset;

  MaskTemplate.FieldName :='AVALUE';
  MaskTemplate.FieldOnElemSource := 'ID_COMUNICATION_TYPE';
  MaskTemplate.ElemeSource := FElemComunicationType;
  MaskTemplate.FieldSourceTemplateName := 'TEMPLATE';

  Elem_OfficeQry := TDBShemaView.Create( OfficeQry, ViewOffices, 'COMPOFFICES', 'OFFICEID', 'COMPOFFICES_GEN' );
  Elem_OfficeQry.AddMainElem( FElemCOMPANYQRY, 'COMPANYID');
  Elem_OfficeQry.ViewList := ViewOfficesList;

  Elem_PersonQry := TDBShemaView.Create( PersonQry, ViewPerson, 'COMPPERSONS', 'PERSONID', 'COMPPERSONS_GEN' );
  Elem_PersonQry.AddMainElem( FElemCOMPANYQRY, 'COMPANYID');
  Elem_PersonQry.DBQuerySetParamValue( 'OurCompany', OptionSet.LocaleCompany);

  Elem_AccountQry := TDBShemaView.Create( AccountQry, ViewAccounts, 'COMPACCOUNTS', 'ACCOUNTID', 'COMPACCOUNTS_GEN' );
  Elem_AccountQry.AddMainElem( FElemCOMPANYQRY, 'COMPANYID');

  Elem_ContractQry := TDBShemaView.Create( ContractQry, ViewContract, 'COMPCONTRACTS', 'COMPCONTRACTID', 'COMPCONTRACTS_GEN' );
  Elem_ContractQry.AddMainElem( FElemCompanyQry,'COMPANYID' );

  Elem_LogContractQry := TDBShemaView.Create( LogContractQry, ViewContractLog, 'CONTRACTLOG', 'CONTRACTLOGID', 'CONTRACTLOG_GEN' );
  Elem_CompHeadPropQry :=TDBShemaView.Create( CompHeadPropQry, nil, '', '', '', '' );
  Elem_OrderListQry := TDBShemaView.Create( OrderListQry, ViewOrderList, '', 'ORDERID', '' );

  Elem_CompNoteQry := TDBShemaView.Create( CompNoteQry, ViewCompNote, 'CompNotes', 'COMPNOTEID', 'COMPNotes_gen' );
  Elem_CompNoteQry.AddMainElem( FElemCompanyQry,'COMPANYID' );

  Elem_ComFilesDoc  :=  TDBShemaView.Create( MemFiles, ViewFiles, '', 'RecId', '' );
  Elem_ComFilesDoc.AskBeforeDelete := False;

  Elem_SelOurPersonQry := TDBShemaView.Create( SelOurPersonQry, nil, '', 'PERSONID', '' );
  Elem_SelOurPersonQry.ViewList := ViewSelOurPersonList;

  Elem_SeFromPartnerPersonQry := TDBShemaView.Create( SeFromPartnerPersonQry, nil, '', 'PERSONID', '' );
  Elem_SeFromPartnerPersonQry.ViewList := ViewSeFromPartnerPersonList;

  Elem_Comunication_CompanyQry :=  TDBShemaView.Create( Comunication_CompanyQry, ViewComunicationCompany, 'COMUNICATION_COMPANY', 'ID', 'gen_comunication_company_id' );
  Elem_Comunication_CompanyQry.AddMainElem( FElemCOMPANYQRY , 'ID_COMPANY');
  Elem_Comunication_CompanyQry.ViewList := ViewComunicationCompanyList;
  Elem_Comunication_CompanyQry.SetUniqFieldNames(['AVALUE']);
  Elem_Comunication_CompanyQry.AddFieldMaskTemplate( MaskTemplate );

  Elem_Comunication_PersonQry := TDBShemaView.Create( Comunication_PersonQry, ViewComunicationPerson, 'COMUNICATION_PERSON', 'ID', 'gen_comunication_person_id');
  Elem_Comunication_PersonQry.addMainElem( Elem_PersonQry , 'ID_COMPPERSONS' );
  Elem_Comunication_PersonQry.SetUniqFieldNames(['AVALUE']);
  Elem_Comunication_PersonQry.AddFieldMaskTemplate( MaskTemplate );

  Elem_Comunication_Comp_OfficeQry :=TDBShemaView.Create( Comunication_Comp_OfficeQry, ViewComunication_Comp_Office, 'COMUNICATION_COMP_OFFICE', 'ID', 'gen_comunication_comp_office_id' );
  Elem_Comunication_Comp_OfficeQry.AddMainElem( Elem_OfficeQry, 'ID_OFFICE' );
  Elem_Comunication_Comp_OfficeQry.SetUniqFieldNames(['ID_COMUNICATION_COMPANY']);

  Elem_Comunication_Comp_PersonQry :=TDBShemaView.Create( Comunication_Comp_PersonQry, ViewComunication_Comp_Person, 'COMUNICATION_COMP_PERSON', 'ID', 'gen_comunication_comp_person_id' );
  Elem_Comunication_Comp_PersonQry.AddMainElem( Elem_PersonQry, 'ID_COMPPERSONS' );
  Elem_Comunication_Comp_PersonQry.SetUniqFieldNames(['ID_COMUNICATION_COMPANY']);

  COMPANIES_PARAM_DATA.AfterInsert := COMPANIES_PARAM_DATAAfterInsert ;

  Elem_CompaniesParamData :=  TDBShemaView.Create( COMPANIES_PARAM_DATA, nil, 'COMPANIES_PARAM_DATA' ,'ID', 'gen_companies_param_data_id' );
  Elem_CompaniesParamData.ViewList := ViewCompaniesParamDataList;
  Elem_CompaniesParamData.SetUniqFieldNames(['ID_COMPANIES_PARAM_NAME']);

  Elem_CompTaxSystemLogQry := TDBShemaView.Create( CompTaxSystemLogQry, ViewCompTaxSystemLog, 'CompTaxSystemLog', 'COMPTAXSYSTEMLOGID', 'gen_comptaxsystemlog_id' );
  Elem_CompTaxSystemLogQry.AddMainElem( FElemCOMPANYQRY, 'COMPANYID' );
  Elem_CompTaxSystemLogQry.ViewList := ViewCompTaxSystemLogList;
  //Elem_CompTaxSystemLogQry.SetTableAlies('C');
end;

procedure TFrameComRequisites.DestroyFrame;
begin

  Elem_OrderListQry.View.OnDblClick := nil;
  Elem_ContractQry.View.OnDblClick := nil;
  Elem_PersonQry.View.OnDblClick   := nil;
  CompanySrc.DataSet := nil; 

  FElemCompanyDocsQry.DB.OnCalcFields := nil;

  Elem_AccountQry.Close;
  Elem_ContractQry.Close;
  Elem_LogContractQry.Close;
  Elem_CompHeadPropQry.Close;
  Elem_OrderListQry.Close;
  Elem_CompNoteQry.Close;
  Elem_ComFilesDoc.Close;
  Elem_SelOurPersonQry.Close;
  Elem_SeFromPartnerPersonQry.Close;
  Elem_Comunication_CompanyQry.Close;
  Elem_Comunication_PersonQry.Close;
  Elem_Comunication_Comp_OfficeQry.Close;
  Elem_Comunication_Comp_PersonQry.Close;
  Elem_OfficeQry.Close;
  Elem_CompaniesParamData.Close;
  Elem_CompTaxSystemLogQry.Close;
  Elem_PersonQry.Close;
  ViewFlesDocs.Close;
  ViewFlesDocs := nil;
end;

procedure TFrameComRequisites.ReQueryAllDbOffice;
begin
  Elem_PersonQry.Requery;
  Elem_ContractQry.Requery;
  Elem_LogContractQry.Requery;
  Elem_CompNoteQry.Requery;
  Elem_OrderListQry.Requery;
  Elem_AccountQry.Requery;
  Elem_Comunication_CompanyQry.Requery;
  Elem_Comunication_PersonQry.Requery;
  Elem_Comunication_Comp_OfficeQry.Requery;
  Elem_Comunication_Comp_PersonQry.Requery;
  Elem_CompTaxSystemLogQry.Requery;

  Elem_OfficeQry.Requery;
  Elem_ComFilesDoc.Requery;
  FElemCompaniesParamName.Requery;
  Elem_CompaniesParamData.Requery;
end;



procedure TFrameComRequisites.OrderListGridDblClick(Sender: TObject);
begin
  if FCurManager <> 0 then
    LaunchOrderBrowser('', Elem_OrderListQry.DB.FieldByName('ORDERID').asInteger, FCurManager )
end;

procedure TFrameComRequisites.RecordEditContract(Sender: TObject);
begin
  if ContractEditBtn.Enabled then ContractEditBtn.Click;
end;

Function TFrameComRequisites.FPrepareShowAddres:TParamCompAddres;
begin
  result.ParamAddres.ElemAddres := Elem_OfficeQry;
  result.ParamAddres.FieldNameCountryId:= 'CountryID';
  result.ParamAddres.FieldNameId_City_adm_unit    :='ID_CITY_ADM_UNIT';
  result.ParamAddres.FieldNamePostIndex:= 'ZIPCODE';
  result.ParamAddres.FieldNameStreetKindId:= 'StrKind';
  result.ParamAddres.FieldNameStreet:= 'ADDRESS';
  result.ParamAddres.FieldNameBuilding:='HOUSE';
  result.ParamAddres.FieldNameOfficeNull:= 'TENEMENTNULL';
  result.ParamAddres.FieldNameOffice:='TENEMENT';
  result.FieldNameIsDef := 'ISDEFAULT';
  result.FieldNameHeadOffice:= 'HEADOFFICE';
  result.FieldNameMailOffice:= 'ITSMAILADDRESS';
  result.FieldNameOfficeName:= 'OFFICENAME';
  Result.FieldNameSaleOffice:= 'SALEPOINT';
end;

procedure TFrameComRequisites.FPrepareExLupColumn( aColum: TcxGridDBColumn );
begin
  TcxExtLookupComboBoxProperties( aColum.Properties ).DropDownAutoSize := True;
  TcxExtLookupComboBoxProperties( aColum.Properties ).DropDownSizeable := True;
end;

procedure TFrameComRequisites.FPrepareViewColumns;
begin

  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXDETAILID').Properties ). View := FElemSelTaxSystemQry.ViewList;
  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXDETAILID').Properties ).KeyFieldNames := FElemSelTaxSystemQry.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXDETAILID').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemSelTaxSystemQry.ViewList ).GetColumnByFieldName('CalcNameTax');
  FPrepareExLupColumn( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXDETAILID') );

  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('SINGLETAXTYPEID').Properties ). View := FElemTypeDocumQry.ViewList;
  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('SINGLETAXTYPEID').Properties ).KeyFieldNames := FElemTypeDocumQry.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('SINGLETAXTYPEID').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemTypeDocumQry.ViewList ).GetColumnByFieldName('NAME');
  FPrepareExLupColumn( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('SINGLETAXTYPEID') );

  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXPAYTYPEID').Properties ). View := FElemTypeDocumQry.ViewList;
  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXPAYTYPEID').Properties ).KeyFieldNames := FElemTypeDocumQry.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXPAYTYPEID').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemTypeDocumQry.ViewList ).GetColumnByFieldName('NAME');
  FPrepareExLupColumn( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('TAXPAYTYPEID') );

  TcxLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('MANID').Properties ).ListSource := FElemUsersQry.DS;
  TcxLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('MANID').Properties ).KeyFieldNames := FElemUsersQry.FieldKod;
  TcxLookupComboBoxProperties( Elem_CompTaxSystemLogQry.View.GetColumnByFieldName('MANID').Properties ).ListColumns.Add.FieldName :=  'MANAGER';

  TcxExtLookupComboBoxProperties(TcxGridDBTableView(Elem_CompaniesParamData.ViewList).GetColumnByFieldName('ID_COMPANIES_PARAM_NAME').Properties).View := FElemCompaniesParamName.ViewList;
  TcxExtLookupComboBoxProperties(TcxGridDBTableView(Elem_CompaniesParamData.ViewList).GetColumnByFieldName('ID_COMPANIES_PARAM_NAME').Properties).KeyFieldNames := FElemCompaniesParamName.FieldKod;
  TcxExtLookupComboBoxProperties(TcxGridDBTableView(Elem_CompaniesParamData.ViewList).GetColumnByFieldName('ID_COMPANIES_PARAM_NAME').Properties).ListFieldItem :=
    TcxGridDBTableView( FElemCompaniesParamName.ViewList ).GetColumnByFieldName('DESCRIPT');
  FPrepareExLupColumn( TcxGridDBTableView(Elem_CompaniesParamData.ViewList).GetColumnByFieldName('ID_COMPANIES_PARAM_NAME') );

  TcxExtLookupComboBoxProperties( Elem_Comunication_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ). View := FElemComunicationType.ViewList;
  TcxExtLookupComboBoxProperties( Elem_Comunication_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).KeyFieldNames := FElemComunicationType.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_Comunication_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemComunicationType.ViewList ).GetColumnByFieldName('NAME');
  FPrepareExLupColumn( Elem_Comunication_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE') );

  TcxExtLookupComboBoxProperties( Elem_Comunication_CompanyQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ). View := FElemComunicationType.ViewList;
  TcxExtLookupComboBoxProperties( Elem_Comunication_CompanyQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).KeyFieldNames := FElemComunicationType.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_Comunication_CompanyQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemComunicationType.ViewList ).GetColumnByFieldName('NAME');
  FPrepareExLupColumn( Elem_Comunication_CompanyQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE') );

  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ). View := FElemComunicationType.ViewList;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).KeyFieldNames := FElemComunicationType.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemComunicationType.ViewList ).GetColumnByFieldName('NAME');
  FPrepareExLupColumn( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE') );

  TcxExtLookupComboBoxProperties( ViewComunicationCompanyList.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ). View := FElemComunicationType.ViewList;
  TcxExtLookupComboBoxProperties( ViewComunicationCompanyList.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).KeyFieldNames := FElemComunicationType.FieldKod;
  TcxExtLookupComboBoxProperties( ViewComunicationCompanyList.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemComunicationType.ViewList ).GetColumnByFieldName('NAME');
  FPrepareExLupColumn( ViewComunicationCompanyList.GetColumnByFieldName('ID_COMUNICATION_TYPE') );

  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY').Properties ). View := Elem_Comunication_CompanyQry.ViewList;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY').Properties ).KeyFieldNames := Elem_Comunication_CompanyQry.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY').Properties ).ListFieldItem :=
    TcxGridDBTableView( Elem_Comunication_CompanyQry.ViewList ).GetColumnByFieldName('AVALUE');
  FPrepareExLupColumn( Elem_Comunication_Comp_OfficeQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY') );

  TcxExtLookupComboBoxProperties( Elem_PersonQry.View.GetColumnByFieldName('ID_COMPOFFICES').Properties ). View := Elem_OfficeQry.ViewList;
  TcxExtLookupComboBoxProperties( Elem_PersonQry.View.GetColumnByFieldName('ID_COMPOFFICES').Properties ).KeyFieldNames := Elem_OfficeQry.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_PersonQry.View.GetColumnByFieldName('ID_COMPOFFICES').Properties ).ListFieldItem :=
    TcxGridDBTableView( Elem_OfficeQry.ViewList ).GetColumnByFieldName('CalcAddres');
  FPrepareExLupColumn( Elem_PersonQry.View.GetColumnByFieldName('ID_COMPOFFICES') );

  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ). View := FElemComunicationType.ViewList;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).KeyFieldNames := FElemComunicationType.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).ListFieldItem :=
    TcxGridDBTableView( FElemComunicationType.ViewList ).GetColumnByFieldName('NAME');
  FPrepareExLupColumn( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE') );

  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY').Properties ). View := Elem_Comunication_CompanyQry.ViewList;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY').Properties ).KeyFieldNames := Elem_Comunication_CompanyQry.FieldKod;
  TcxExtLookupComboBoxProperties( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY').Properties ).ListFieldItem :=
    TcxGridDBTableView( Elem_Comunication_CompanyQry.ViewList ).GetColumnByFieldName('AVALUE');
  FPrepareExLupColumn( Elem_Comunication_Comp_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_COMPANY') );

  TcxExtLookupComboBoxProperties( Elem_Comunication_PersonQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).OnEditValueChanged := ViewComunicationPersonID_COMUNICATION_TYPEPropertiesEditValueChanged;
  TcxExtLookupComboBoxProperties( Elem_Comunication_CompanyQry.View.GetColumnByFieldName('ID_COMUNICATION_TYPE').Properties ).OnEditValueChanged := ViewComunicationCompanyID_COMUNICATION_TYPEPropertiesEditValueChanged;

end;

procedure TFrameComRequisites.FPrepareControls(CanUpdate:Boolean);
begin
  FPrepareViewColumns;

  GridKindBranch.Levels[0].GridView := Elem_CompaniesParamData.ViewList;
  Elem_CompaniesParamData.SetFilterOnViewList(['atype'],[0],['>=']);

  SetEnabledControlsOnFromByClassName( self, TcxDBTextEdit, CanUpdate );
  PageControl.ActivePage := OfficeTabSheet;
  if not CanUpdate then
    SetEnabledChildControls(Self, CanUpdate, [], [ TPanel, TPageControl, TcxGrid, TtabSheet ] );
end;

procedure TFrameComRequisites.UpdateAddres(isNew:Boolean);
var ParamApart:TParamApartment;
    CompParamAddres:TParamCompAddres;
begin
  if FElemCompanyQry.DBBooleanValue['isPrivate'] then
    ParamApart := opParamApartment
  else ParamApart := opParamOffice;

  CompParamAddres := FPrepareShowAddres;
  if ShowUpdateAddres( CompParamAddres, isNew, True, ParamApart, nil, FViewStyle ) then
   RefreshControls;
end;

procedure TFrameComRequisites.butAddAddresClick(Sender: TObject);
begin
  UpdateAddres( True );
end;

procedure TFrameComRequisites.butEditAddresClick(Sender: TObject);
begin
  UpdateAddres( false );
end;

procedure TFrameComRequisites.butDelAddresClick(Sender: TObject);
begin
  Elem_OfficeQry.DBDelete;
end;

procedure TFrameComRequisites.PrepareEmailsPhoneFilter;
begin

end;

procedure TFrameComRequisites.PrepareCompCount;
begin
  FOffRecNo := 1;
  FAccRecNo := 1;
  FCorrRecNo := 1;
  FPersRecNo := 1;
end;

function TFrameComRequisites.FGetCountRecCompanyGridDB:Integer;
begin
  if ( FElemCompanyQry.View <> nil ) and
     ( FElemCompanyQry.View.Site.Parent <> nil) then result := FElemCompanyQry.View.ViewData.RowCount
  else result := FElemCompanyQry.DBRecordCount;
end;

procedure TFrameComRequisites.RefreshControls;
begin
  PrepareEmailsPhoneFilter;
  //**********************
  butAddAddres.Enabled := (FGetCountRecCompanyGridDB <> 0) and (FCurManager > 0) and ( Elem_OfficeQry.CheckRoleInsert );
  butEditAddres.Enabled := ( not Elem_OfficeQry.DB.IsEmpty ) and (FCurManager > 0) and ( Elem_OfficeQry.CheckRoleUpdate );
  butDelAddres.Enabled := ( not Elem_OfficeQry.DB.IsEmpty ) and (FCurManager > 0) and ( Elem_OfficeQry.CheckRoleDelete );
  //**********************
  butAddNote.Enabled :=  (FGetCountRecCompanyGridDB <> 0)and(FCurManager > 0) and (Elem_CompNoteQry.CheckRoleInsert );
  butPreviewNote.Enabled := (TcxGridDBTableView( GridNotes.Levels[0].GridView).ViewData.RowCount <> 0) and (FCurManager > 0)and (Elem_CompNoteQry.CheckRoleUpdate );
  ContractAddNewBtn.Enabled := (FGetCountRecCompanyGridDB <> 0)and(FCurManager > 0 )and( Elem_ContractQry.CheckRoleInsert );
  ContractEditBtn.Enabled := ( Elem_ContractQry.DBRecordCount <> 0 ) and (FCurManager > 0) and ( Elem_ContractQry.CheckRoleUpdate );;
  ContractOpenDocBtn.Enabled := ( Elem_ContractQry.DBRecordCount <> 0 ) and (FCurManager > 0);
  AgentContractBtn.Enabled := ( Elem_ContractQry.DBRecordCount <> 0 ) and (FCurManager > 0);
  //**********************
  butAddKindBranch.Enabled := (FGetCountRecCompanyGridDB <> 0)and(FCurManager > 0) and (Elem_CompaniesParamData.CheckRoleInsert);
  butDelKindBranch.Enabled := ( TcxGridDBTableView( GridKindBranch.Levels[0].GridView ).ViewData.RowCount <> 0 )  and (FCurManager > 0)and (Elem_CompaniesParamData.CheckRoleDelete);
  //**********************
  butAddPersons.Enabled  := (FElemCompanyQry.DBRecordCount <> 0) and( FCurManager > 0 ) and ( Elem_PersonQry.CheckRoleInsert );
  butEditPersons.Enabled := (Elem_PersonQry.View.ViewData.RowCount <> 0) and( FCurManager > 0 ) and ( Elem_PersonQry.CheckRoleUpdate );
  butDelPersons.Enabled  := (Elem_PersonQry.View.ViewData.RowCount <> 0) and( FCurManager > 0 ) and ( Elem_PersonQry.CheckRoleDelete );
  //**********************
  butAddCompanyComunication.Enabled :=  (FElemCompanyQry.DBRecordCount <> 0) and( FCurManager > 0 ) and ( Elem_Comunication_CompanyQry.CheckRoleInsert );
  butEditCompanyComunication.Enabled := ( TcxGridDBTableView(GridComunicationCompany.Levels[0].GridView ).ViewData.RowCount <> 0 ) and (FCurManager > 0) and ( Elem_Comunication_CompanyQry.CheckRoleUpdate );
  butDelCompanyComunication.Enabled :=  ( TcxGridDBTableView(GridComunicationCompany.Levels[0].GridView ).ViewData.RowCount <> 0 ) and (FCurManager > 0) and ( Elem_Comunication_CompanyQry.CheckRoleDelete );
  butCallToLinklCompanyComunication.Enabled := ( TcxGridDBTableView(GridComunicationCompany.Levels[0].GridView ).ViewData.RowCount <> 0 ) ;
  //**********************
  butAddOfficeComunication.Enabled :=  (TcxGridDBTableView(GridOffices.Levels[0].GridView).ViewData.RowCount <> 0) and (FCurManager > 0) and ( Elem_Comunication_Comp_OfficeQry.CheckRoleInsert );
  butEditOfficeComunication.Enabled:=  (TcxGridDBTableView(GridComunicationCompOffice.Levels[0].GridView).ViewData.RowCount <> 0) and (FCurManager > 0)and (Elem_Comunication_Comp_OfficeQry.CheckRoleUpdate );
  butDelOfficeComunication.Enabled :=  (TcxGridDBTableView(GridComunicationCompOffice.Levels[0].GridView).ViewData.RowCount <> 0) and (FCurManager > 0)and (Elem_Comunication_Comp_OfficeQry.CheckRoleDelete );
  butCallToLinklOfficeComunication.Enabled := (TcxGridDBTableView(GridComunicationCompOffice.Levels[0].GridView).ViewData.RowCount <> 0) ;
  //**********************
  butAddPersonsComunication.Enabled := (Elem_PersonQry.View.ViewData.RowCount <> 0) and( FCurManager > 0 ) and (Elem_Comunication_PersonQry.CheckRoleInsert );
  buEditPersonsComunication.Enabled := (Elem_Comunication_PersonQry.View.ViewData.RowCount <> 0) and( FCurManager > 0 )and (Elem_Comunication_PersonQry.CheckRoleUpdate );
  butDelPersonsComunication.Enabled := (Elem_Comunication_PersonQry.View.ViewData.RowCount <> 0) and( FCurManager > 0 )and (Elem_Comunication_PersonQry.CheckRoleDelete );
  butCallToLinklPersonsComunication.Enabled := buEditPersonsComunication.Enabled;
  //**********************
  butAddCopmPersonComunication.Enabled := ( Elem_PersonQry.View.ViewData.RowCount <> 0) and( FCurManager > 0 ) and ( Elem_Comunication_Comp_PersonQry.CheckRoleInsert );
  butEditCopmPersonComunication.Enabled:=  ( TcxGridDBTableView(GridComunicationCompPerson.Levels[0].GridView ).ViewData.RowCount <> 0 ) and( FCurManager > 0 )and ( Elem_Comunication_Comp_PersonQry.CheckRoleUpdate );
  butDelCopmPersonComunication.Enabled :=  ( TcxGridDBTableView(GridComunicationCompPerson.Levels[0].GridView ).ViewData.RowCount <> 0 ) and( FCurManager > 0 )and ( Elem_Comunication_Comp_PersonQry.CheckRoleDelete );
  butCallToLinklComPersonsComunication.Enabled := ( TcxGridDBTableView(GridComunicationCompPerson.Levels[0].GridView ).ViewData.RowCount <> 0 );
  //**********************
  butAddAccount.Enabled :=  (FElemCompanyQry.DBRecordCount <> 0) and( FCurManager > 0 ) and ( Elem_AccountQry.CheckRoleInsert );
  butEditAccount.Enabled := ( Elem_AccountQry.View.ViewData.RowCount <> 0 ) and( FCurManager > 0 )and ( Elem_AccountQry.CheckRoleUpdate );
  butDelAccount.Enabled := ( Elem_AccountQry.View.ViewData.RowCount <> 0 ) and( FCurManager > 0 )and ( Elem_AccountQry.CheckRoleDelete );
  //**********************
  Elem_CompaniesParamData.SetFocusOnView( TcxGridDBTableView(Elem_CompaniesParamData.ViewList) );
  UpdateGridDrop;
end;

procedure TFrameComRequisites.EditPerson(isNew:Boolean);
begin
  if (  FElemCompanyQry.GetValueId = OptionSet.LocaleCompany) then
    ErrorFmtDlg(SCompBrErrorAddYourSelfPerson, [ FElemCompanyQry.DB.FieldByName('NAME').AsString ])
  else
  begin
    if not isNew then Elem_PersonQry.DBEdit( True )
    else Elem_PersonQry.DBInsert( True );
  end;
  RefreshControls;
end;

{procedure TFrameComRequisites.ExecuteSendMail(FileName: string = '');
var
  Addr, Fldr, ASubject: String;
  Attach: TStrings;
  TmplName: OleVariant;
begin
  Addr := Elem_EmailQry.DB.fieldByName('EMAIL').AsString;
  Attach := TStringList.Create;
  try
    ASubject := EmptyStr;
    if FileName <> EmptyStr then
    begin
      Fldr := IncludeTrailingPathDelimiter(GetCurrentDir);
      TmplName := Fldr + ChangeFileExt(ExtractFileName(FileName), '.doc');
      WordDocum.SaveAs(TmplName);
      WordClose( WordApplic );

      FileName := TmplName;
      Attach.Add(FileName);
      ASubject := 'Реєстраційна форма';
    end;
    if not ExecuteMailSendText(Addr, '', ASubject, '', SVDlgsEmail, False, EmptyStr, False, 0, Attach) then
      MyShowMessageDlg(  Format(STripAnlzFrmErrorSendMail, [Addr] ),mtError, but_OK );
  finally
    DeleteFile(FileName);
    Attach.Free;
  end;
end;  }

procedure TFrameComRequisites.WebSiteBtnClick(Sender: TObject);
begin

end;

{procedure TFrameComRequisites.UpdatePhonesFax( aElemPhone:TDBShemaView; isNew:Boolean );
begin
  if ExecutePhoneEditFrm(  aElemPhone, Elem_OfficeQry, FElemCOMPANYQRY, isNew, FCurManager ) then
  begin
    Elem_PhoneQry.Requery;
    Elem_FaxQry.Requery;
  end;
end; }

procedure TFrameComRequisites.butAddPhonesClick(Sender: TObject);
begin
  //UpdatePhonesFax( Elem_PhoneQry, True );
end;

procedure TFrameComRequisites.butEditPhonesClick(Sender: TObject);
begin
  //UpdatePhonesFax( Elem_PhoneQry, False );
end;

procedure TFrameComRequisites.butDelPhonesClick(Sender: TObject);
begin
  //Elem_PhoneQry.DBDelete;
end;

procedure TFrameComRequisites.butAddFaxClick(Sender: TObject);
begin
  //UpdatePhonesFax( Elem_FaxQry, True );
end;

procedure TFrameComRequisites.butEditFaxClick(Sender: TObject);
begin
  //UpdatePhonesFax( Elem_FaxQry, False );
end;

procedure TFrameComRequisites.butDelFaxClick(Sender: TObject);
begin
  //Elem_FaxQry.DBDelete;
end;

procedure TFrameComRequisites.FaxUpBtnClick(Sender: TObject);
begin
{with WinFaxSendForm do
  begin
    ClearRecepients;
    RecepientCompany := FElemCOMPANYQRY.DB.FieldByName('NAME').AsString;
    if Sender = FaxUpBtn then
    begin
      RecepientName := FElemCOMPANYQRY.DB.FieldByName('NAME').AsString;
      RecepientCountryCode := Elem_FaxQry.DB.FieldByName('CNTRYCODE').asString;
      RecepientAreaCode := Elem_FaxQry.DB.FieldByName('AREACODE').asString;
      RecepientNumber := Elem_FaxQry.DB.FieldByName('PHONENO').asString;
      RecepientExtension := Elem_FaxQry.DB.FieldByName('EXTENTION').asString;
    end
    else
    begin
      RecepientName := Elem_PersonQry.DB.FieldByName('FULLNAME').asString;
      RecepientCountryCode := Elem_PersonQry.DB.FieldByName('FAXCNTRY').asString;
      RecepientAreaCode := Elem_PersonQry.DB.FieldByName('FAXAREA').asString;
      RecepientNumber := Elem_PersonQry.DB.FieldByName('FAXNUMBER').asString;
      RecepientExtension := Elem_PersonQry.DB.FieldByName('FAXEXT').asString;
    end;
    AddRecepient;
    Send;
  end;  }
end;

procedure TFrameComRequisites.WordUpBtnClick(Sender: TObject);
begin
  LaunchWordDocument( WordDocum, WordApplic, '', OptionSet.WordDocTemplate, False );
end;

function TFrameComRequisites.CompanyAreLicenseDoc: Boolean;
begin
  Result := GetCountFilesForPath(
    GetDocStoreFolder(OptionSet.StoreFolder, [ FElemCOMPANYQRY.DB.FieldByName('COMPANYID').value, nPartnerLicenseDocFolder], nPartnerDocFolder), '*.*') > 0;
  if not Result then  MyShowMessageDlg ('Не приєднані скан копії банківської гарантії в папку документів партнера!',mtError, but_OK);
end;

function TFrameComRequisites.CheckCompanyData: Boolean;
begin
  Result :=  FElemCOMPANYQRY.DBBooleanValue['ALLDATAFILL'];
  if not Result then  MyShowMessageDlg(  'Незаповнені всі обов`язкові дані партнера.',mtError, but_OK )
  else Result := CompanyAreLicenseDoc;
end;

procedure TFrameComRequisites.UpdateContract( ActionTag:Integer );
var ParamContract:TParamContract;
begin
  ParamContract.ElemCompany  := FElemCompanyQry;
  ParamContract.ElemContract := Elem_ContractQry;
  ParamContract.ElemLog := Elem_LogContractQry;
  ParamContract.ElemCompHeadPropQry := Elem_CompHeadPropQry;
  ParamContract.ElemCompContractKind := FElemCOMPCONTRACTSKINDQry;
  ParamContract.ElemSelOurPersonQry :=  Elem_SelOurPersonQry;
  ParamContract.ElemSeFromPartnerPersonQry := Elem_SeFromPartnerPersonQry;
  ParamContract.ElemCompContractNumsQry := FElemCompContractNumsQry;
  ParamContract.MarkDifStyle := cxStyle216;
  //ParamContract.ElemSelCntrTemplQry :=Elem_SelCntrTemplQry;
  //ParamContract.ElemEmailQry := Elem_EmailQry;

  if ( CheckCompanyData ) and ( ExecuteContractEditForm( ParamContract, self.FCurManager, self.FCurManagerName, ActionTag, True, self.FCanUpdate ) ) then
  begin

    Elem_ContractQry.RequeryCurrentRecord;
    Elem_LogContractQry.Requery;
    FElemCOMPANYQRY.RequeryCurrentRecord;
  end;
end;

procedure TFrameComRequisites.ContractAddNewBtnClick(Sender: TObject);
begin
  UpdateContract( remStateAppend );
end;

procedure TFrameComRequisites.ContractEditBtnClick(Sender: TObject);
begin
  UpdateContract( remStateEdit );
end;

function TFrameComRequisites.GetDefMail: string;
begin
  //with EmailQry do if not Locate('ISDEFAULT', 'T', []) then First;
  //Result := Elem_EmailQry.DB.FieldByName('EMAIL').asString;
end;

procedure TFrameComRequisites.FContractAgentSendMail(const FileName: string);
var Attach: TStrings;
  DocName, Subject, eMail, aText: string;
begin
  inherited;
  Attach := TStringList.Create;
  try
    DocName := GetPathContractFile(FileName, FElemCOMPANYQRY );
    DocName := ChangeFileExt(DocName, '.pdf');
    Subject := 'Алголь. Шаблон угоди із замовником';
    Attach.Add(DocName);
    eMail := GetDefMail;

    aText := Format(sDictTextSendContractToAgent, [ FElemCOMPANYQRY.DB.FieldByName('NUMCONTRACT').AsString ,
      FormatDateTime('dd.mm.yyyy року.', FElemCOMPANYQRY.DB.FieldByName('SIGNDATE').Value ), self.FCurManagerName ]);

    if not ExecuteMailSendText(eMail, '', Subject, aText, '', False, '', False, FElemCOMPANYQRY.GetValueId, Attach, False, {nPartnerDocFolder,} nContractFolder, myStoreFileName) then
      ErrorFmtDlg(STripAnlzFrmErrorSendMail, [eMail])
    else
    try
      DeleteFile(DocName);
    except
      ErrorDlg('Помилка видалення файлу:'#13#13 + DocName);
    end;
  finally
    Attach.Free;
  end;
end;


procedure TFrameComRequisites.AgentContractBtnClick(Sender: TObject);
const sDocName = 'Шаблон угоди із замовником.doc';
var
  FName: String;
  FillProc: TFillWordDocProcNew;
begin
  FName := IncludeTrailingPathDelimiter(GetCurrentDir) + sDocName;
  if FileExists(FName) then DeleteFile(FName);
  FillProc := FillDocument;
  if NewPrintWordDocument( WordDocum, WordApplic, self.FElemCompanyQry, self.FElemCOMPCONTRACTSKINDQry, GetContractType, 
                           FillProc, FName, True, True, True) then
    FContractAgentSendMail( sDocName )
end;

function TFrameComRequisites.GetContractType: Integer;
const nAgentContractId = 1128;
begin
  Result := nAgentContractId;
end;

procedure TFrameComRequisites.FUpdateCompanyProperties;
begin
  UpdateCompanyProperties( Elem_CompHeadPropQry, FElemCOMPANYQRY.DB.FieldByName('COMPANYID').value,
                                                 FElemCOMPANYQRY.DB.FieldByName('OURPERSONID').Value,
                                                 FElemCOMPANYQRY.DB.FieldByName('ITSPERSONID').Value,
                                                 FElemCOMPANYQRY.DB.FieldByName('NumContract').Value,
                                                 FElemCOMPANYQRY.DB.FieldByName('SignDate').Value );
  Elem_CompHeadPropQry.DBOpen;
end;

function GetSqlContractTemplatesIB(TypeTempl: Integer):string;
begin
  result := 'select Pp.RDB$DESCRIPTION DESCRIPT, T.* ' +
    'from ContractTemplates T ' +
    'LEFT OUTER JOIN RDB$PROCEDURE_PARAMETERS Pp ON Pp.RDB$PROCEDURE_NAME = T.sourcetable  ' +
    'and Pp.RDB$PARAMETER_NAME = T.requiredfield and Pp.rdb$PROCEDURE_NAME = T.SourceTable  ' +
    'where Pp.RDB$PARAMETER_TYPE = 1 and Pp.RDB$DESCRIPTION is not null';

  if TypeTempl = 0 then result := result +' and ContractId = :ContractId'
  else result := result +' and ContractType = :ContractType';
end;

function GetSqlContractTemplatesADO(TypeTempl: Integer):string;
begin
  result :=''; //  Далі буде
end;

function GetDefMail( aElemEmailQry:TDBShema ): string;
begin
  if aElemEmailQry.DB.Locate( 'ISDEFAULT', aElemEmailQry.DBGetBooleanTrueValue( 'ISDEFAULT' ) ,[] ) then
    aElemEmailQry.DB.First;

  Result := aElemEmailQry.DB.FieldByName('EMAIL').asString;
end;

function TFrameComRequisites.FillDocument( TypeTempl: Integer ): Boolean;
var
  curBookmarkWork, curBookmark, currField, SQLText: string;
  BookmarkNotFound: string;
  I, UseCount: Integer;
  aDB:TDataset;
  DBParam:TConnectDBParam;
  //*************************************
  function GetItsCompanyType: Integer;
  begin
    if Elem_CompHeadPropQry.DBBooleanValue['ISENTERPR'] then Result := 0
    else
    if Elem_CompHeadPropQry.DBBooleanValue['ISBSMAN'] then Result := 1
    else Result := 2;
  end;
  //*************************************
  function GetContractIdByTypeTempl:Integer;
  begin
    if TypeTempl = 0 then result := GetContractType
    else
    if TypeTempl = 1 then result:= GetItsCompanyType
    else
    if TypeTempl = 3 then result := TypeTempl;
  end;
  //*************************************
begin
  FUpdateCompanyProperties;
  BookmarkNotFound := EmptyStr;
  DBParam := Elem_CompHeadPropQry.DBGetParamConnect;
  //*************************************
  try
    if DBParam.IBDatabaseConnection <>nil then
    begin
      aDB := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, nil, GetSqlContractTemplatesIB(TypeTempl), False );
      if TIBQuery(aDB).Params.FindParam('ContractId') <> nil then
        TIBQuery(aDB).ParamByName('ContractId').Value := GetContractIdByTypeTempl;
    end;
    if DBParam.ADOConnection <>nil then
    begin
      aDB := UnitAdoQuery.CreateDataSet( DBParam.ADOConnection, GetSqlContractTemplatesADO(TypeTempl),cmdText, False );
      if TAdoQuery(aDB).Parameters.FindParam('ContractId') <> nil then
        TAdoQuery(aDB).Parameters.ParamByName('ContractId').Value := GetContractIdByTypeTempl;
    end;
    aDB.Open;
    //*************************************
    while not aDB.Eof do
    begin
      curBookmark := aDB.FieldByName('BOOKMARK').asString;
      currField := aDB.FieldByName('REQUIREDFIELD').asString;

      if currField = 'HEADADDRESS' then currField := Elem_CompHeadPropQry.DB.fieldByName('HEADADDRES').AsString //GetItsHeadAddress( Elem_CompHeadPropQry )
      else
      if currField = 'PHONENO' then currField := Elem_CompHeadPropQry.DB.fieldByName('OFFICEPHONE').AsString //GetItsHeadPhone( Elem_CompHeadPropQry )
      else
      if currField = 'FAXNO' then currField := Elem_CompHeadPropQry.DB.fieldByName('OFFICEFAX').AsString //GetItsHeadFax( Elem_CompHeadPropQry )
      else
      if currField = 'TAXPAYCODE' then currField := GetItsCompanyTaxPayData ( Elem_CompHeadPropQry )
      else currField := Elem_CompHeadPropQry.DB.FieldByName(currField).AsString;
      UseCount := MyIfThen( aDB.FieldByName('USECOUNT').asInteger = 0, 1, aDB.FieldByName('USECOUNT').asInteger);

      for I := 1 to UseCount do
      begin
        curBookmarkWork := curBookmark + MyIfThen(I > 1, IntToStr(I), EmptyStr);
        if not SetWordBookmark( WordDocum, WordApplic,  curBookmarkWork, currField, False) then
          BookmarkNotFound := BookmarkNotFound + curBookmarkWork + #13;
      end;
      aDB.Next;
    end;
  finally
     DestroyDB(aDB);
  end;

  Result := BookmarkNotFound = EmptyStr;
  if not Result then ErrorFmtDlg(SDataModErrorWordBookmarksNotFound, [BookmarkNotFound]);
end;

procedure TFrameComRequisites.butContractReRestrClick(Sender: TObject);
begin
  if WarningDlgYN(sDictContractContractReReestr) and
     WarningDlgYN(sDictContractContractReReestr2) then UpdateContract( remStateEdit );
end;

procedure TFrameComRequisites.ContractOpenDocBtnClick(Sender: TObject);
var FName, PDFFile: String;
begin
  FName := GetPathContractFile( Elem_ContractQry.DB.FieldByName('FILENAME').asString, FElemCompanyQry );
  if ExtractFileExt(FName) = '.doc' then PDFFile := ChangeFileExt(FName, '.pdf');
  if FileExists(PDFFile) then ShellOpenDocument(PDFFile)
  else
    ShellOpenDocument( GetPDFContract( WordDocum, WordApplic, FElemCompanyQry, ExtractFileName( FName) ) ) ;
end;

procedure TFrameComRequisites.FPrepareDS;
begin
  FElemCompanyDocsQry.DB.OnCalcFields := CompanyDocsQryCalcFields;
  CompanySrc.DataSet := FElemCompanyQry.DB;
  FElemCompaniesParamName.DBOpen;
  FElemComunicationType.DBOpen;
end;

procedure TFrameComRequisites.FPrepareViewGrid;
begin
  Elem_ContractQry.View.Styles.StyleSheet := self.FViewStyle;
  Elem_LogContractQry.View.Styles.StyleSheet := self.FViewStyle;
  Elem_OrderListQry.View.Styles.StyleSheet := self.FViewStyle;
  Elem_CompNoteQry.View.Styles.StyleSheet := self.FViewStyle;
  FElemCompanyDocsQry.View.Styles.StyleSheet := self.FViewStyle;
  Elem_ComFilesDoc.View.Styles.StyleSheet := self.FViewStyle;
  Elem_PersonQry.View.Styles.StyleSheet := self.FViewStyle;
  Elem_Comunication_PersonQry.View.Styles.StyleSheet := self.FViewStyle;
  TcxGridDBTableView(Elem_CompaniesParamData.ViewList).Styles.StyleSheet := self.FViewStyle;
  ViewCompanyDocs.Styles.StyleSheet := self.FViewStyle;
  ViewOffices.Styles.StyleSheet := self.FViewStyle;
  ViewAccounts.Styles.StyleSheet := self.FViewStyle;
  ViewComunication_Comp_Office.Styles.StyleSheet := self.FViewStyle;
  ViewComunication_Comp_Person.Styles.StyleSheet := self.FViewStyle;
  ViewComunicationCompany.Styles.StyleSheet := self.FViewStyle;
  ViewComunicationPerson.Styles.StyleSheet := self.FViewStyle;
  ViewCompTaxSystemLog.Styles.StyleSheet := self.FViewStyle;
  ViewCompTaxSystemLogList.Styles.StyleSheet := self.FViewStyle;
  ViewComunicationCompanyList.Styles.StyleSheet := self.FViewStyle;
  ViewOfficesList.Styles.StyleSheet := self.FViewStyle;
  //**************
  GridContract.Levels[0].GridView := Elem_ContractQry.View;
  GridContractLog.Levels[0].GridView := Elem_LogContractQry.View;
  GridOrderList.Levels[0].GridView := Elem_OrderListQry.View;
  GridNotes.Levels[0].GridView := Elem_CompNoteQry.View;
  GridPerson.Levels[0].GridView := Elem_PersonQry.View;

  ViewCompanyDocs.DataController.DataSource := FElemCompanyDocsQry.DS;
  GridDoc.Levels[0].GridView := ViewCompanyDocs;
  GridFiles.Levels[0].GridView := Elem_ComFilesDoc.View;
end;


procedure TFrameComRequisites.butAddNoteClick(Sender: TObject);
begin
  ShowNoteEditDlg( FElemTypeNotesQry, Elem_CompNoteQry, True, True );
end;

procedure TFrameComRequisites.butPreviewNoteClick(Sender: TObject);
begin
  ShowNoteEditDlg( FElemTypeNotesQry, Elem_CompNoteQry, False, True );
end;

procedure TFrameComRequisites.CopyFileProc(FileName: string);
begin
  myCopyFile(FileName, GetPartners_ContractDocsStoreFolder( FElemCOMPANYQRY.DB.FieldByName('COMPANYID').AsString ));
end;

function DoPrintContract( WordDocum:TWordDocument; WordApplic:TWordApplication; ElemCompany,ElemContract:TDBShemaView ): Boolean;
var DocName: string;
begin
  DocName := ElemContract.DB.FieldByName('FILENAME').asString;
  DocName := GetPathContractFile( DocName, ElemCompany );
  Result := FileExists(DocName);
    if Result then Result := PrintWordDoc(WordDocum, WordApplic, DocName) else ErrorDlg( 'Помилка друку договору.' );
end;

function TFrameComRequisites.myStoreFileName(var Fldr, Subj: string; ReferId,
  TypeFolder: Integer; aSaveExtPdf: Boolean = False): Boolean;
begin
  MakeDocStoreFileName(Fldr, Subj, ReferId, TypeFolder);
  Result := Fldr <> EmptyStr;
  //StoreFileName := Subj;
end;

function ContractSendMail( WordDocum:TWordDocument; WordApplic:TWordApplication;
                           aElemCompanyQry, aElemContractQry, aElemEmail:TDBShema; CurManagerName:String; GetPathFile: TGetPathFile = nil ): Boolean;
var Attach: TStrings;
  DocName, Subject, eMail, aText: string;
  IsSent: Boolean;
begin
  Attach := TStringList.Create;
  IsSent := aElemContractQry.DBBooleanValue['ISSEND'];

  try
    if IsSent then
    begin
      DocName := GetPathContractFile(aElemContractQry.DB.FieldByName('FILENAME').asString, aElemCompanyQry );
      DocName := ChangeFileExt(DocName, '.pdf');
    end
    else
    begin
      DocName := aElemContractQry.DB.FieldByName('FILENAME').asString;
      DocName := GetPDFContract(WordDocum,WordApplic,aElemCompanyQry, DocName);
    end;
    Subject := sDictSubContractSendMail;
    Attach.Add(DocName);
    eMail := GetDefMail( aElemEmail ); //Self.Elem_EmailQry
    aText := Format(sDictTextContractSendMail, [ FormatDateTime('dd.mm.yyyy', Date + 14), CurManagerName]);

    Result := ExecuteMailSendText( eMail, '', Subject, aText, '', False, '', False, aElemCompanyQry.DB.FieldByName('COMPANYID').value, Attach, False, nContractFolder, GetPathFile ); //myStoreFileName
    if not IsSent then MoveFile( PAnsiChar(DocName), PAnsiChar( GetPathContractFile(ExtractFileName(DocName),aElemCompanyQry ) ) );
  finally
    Attach.Free;
  end;
end;

procedure TFrameComRequisites.ContractActionExecute( aTag: Integer );
var
  SetText: string;
  ContractId, CompanyId: Integer;
  DoAction: Boolean;
begin
  DoAction := False;
  Elem_ContractQry.DB.Edit;

  case aTag of
    nContractPrint:
    begin
      DoAction := WarningDlgYN('Друкувати угоду?') and DoPrintContract( WordDocum, WordApplic,self.FElemCompanyQry , self.Elem_ContractQry );
      Elem_ContractQry.DBBooleanValue['ISPRINTED'] := True;
    end;
    nContractSign:
    begin
      Elem_ContractQry.DBBooleanValue['ISSIGN'] := True;
      DoAction := WarningDlgYN('Позначити угоду як пропечатану?');
    end;
    nContractSentOrig:
    begin
      Elem_ContractQry.DBBooleanValue['ISSENDORIG'] := True;
      DoAction := WarningDlgYN('Відмітити, що відправлено оригінал?');
    end;
    {nContractSendMail:
    begin
      DoAction := WarningDlgYN('Надіслати підписану угоду?') and ContractSendMail(WordDocum,WordApplic, self.FElemCompanyQry , self.Elem_ContractQry, self.Elem_EmailQry, self.FCurManagerName, myStoreFileName );
      Elem_ContractQry.DBBooleanValue['ISSEND'] := True;
    end; }
    nContractRcvCopy:
    begin
      DoAction := True;
      Elem_ContractQry.DBBooleanValue['ISRCVCOPY'] := True;
      Elem_ContractQry.DB.FieldByName('RCVCOPYMANID').asInteger := self.FCurManager;
      Elem_ContractQry.DB.FieldByName('RCVCOPYDATE').asDateTime := Now;
    end;
    nContractExtend:
    begin
      DoAction := WarningDlgYN(sDictContractContractExtend);
      Elem_ContractQry.DBBooleanValue['IsExtend'] := True;
      Elem_ContractQry.DB.FieldByName('RCVCOPYDATE').asDateTime := Now;
    end;
    nContractRcvOrig:
    begin
      Elem_ContractQry.DBBooleanValue['ISRCVORIG'] := True;
      Elem_ContractQry.DB.FieldByName('RCVORIGMANID').asInteger := self.FCurManager;
      Elem_ContractQry.DB.FieldByName('RCVORIGDATE').asDateTime := Now;
      Elem_ContractQry.DB.FieldByName('IsExtend').value := Null;

      DoAction := WarningDlgYN('Відмітити, що отримано оригінал?');
    end;
  end;

  if DoAction then
  begin
   // DMServ.SendMailPartnerAboutContract( aTag, FElemCOMPANYQRY, Elem_EmailQry );
    Elem_ContractQry.DB.Post;
    FElemCOMPANYQRY.RequeryCurrentRecord;
  end;
end;

procedure TFrameComRequisites.StoreContractRcv;
var StoreFolder: string;
begin
  if WarningDlgYN('Приєднати підписану сканкопію угоди?') then
  begin
    StoreFolder := GetPartners_ContractDocsStoreFolder( FElemCOMPANYQRY.DB.FieldByName('COMPANYID').AsString );
    CopyDropFile( GridDataFormatAdapterFile , StoreFolder , CopyFileProc );
    CopyDropFileStream( GridDataFormatAdapterStream , StoreFolder , CopyFileProc );
    ContractActionExecute( 4 );
  end;
end;

procedure TFrameComRequisites.DropTextTargetDrop(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
begin
  if Sender = GridDropTextTarget then
  begin
    if GridDropTextTarget.Target = GridContract then StoreContractRcv
    else
    if GridDropTextTarget.Target = GridDoc then
    begin
      GridDoc.SetFocus;
      ViewFlesDocs.CopyDragDropFileStream( GridDataFormatAdapterStream );
      ViewFlesDocs.CopyDragDropFile( GridDataFormatAdapterFile );
    end;
  end
  else
  if Sender = DropTextTarget then
  begin
    GridFiles.SetFocus;
    ViewFlesDocs.CopyDragDropFileStream( DataFormatAdapterStream );
    ViewFlesDocs.CopyDragDropFile( DataFormatAdapterFile );
  end;

  FElemCompanyDocsQry.Requery;
  DraggedFile := False;
end;

procedure TFrameComRequisites.GridDropTextTargetDragOver(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; var Effect: Integer);
begin
  if (Sender as TDropTextTarget).Target = GridDoc then
  begin
    GridDoc.SetFocus;
    self.FDraggedFile := True;
    FElemCompanyDocsQry.View.OnMouseMove ( FElemCompanyDocsQry.View, [], APoint.X, APoint.Y );
  end;
end;

function TFrameComRequisites.FGetPathToDoc: string;
var Value: Variant;
begin
  Result := '';
  if FElemCompanyDocsQry <> nil then
    if FElemCompanyDocsQry.DB.FieldByName('DOCID').asInteger > 0 then
      Result := GetPartners_DocsStoreFolder( FElemCompanyQry.GetValueId ) +
                PathDelim + FElemCompanyDocsQry.DB.FieldByName('DOCID').asString + PathDelim;
end;

procedure TFrameComRequisites.ViewCompanyDocsFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var CurrPath:string;
begin
  if ViewFlesDocs = nil then exit;
  CurrPath := FGetPathToDoc;
  ViewFlesDocs.RefreshFilesDB( CurrPath , ['*.*'] );
end;

procedure TFrameComRequisites.ViewContractLogCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const ImgArr: array[nLogSubCategDictContractArr] of
  Integer = (8, 90, 40, 49, 89, 84, 62, 1, 91, 102, 96, 100, 94, 80, 98, 100, 101, 62);
var
  ImgId : Integer;
  ColName: string;
  IndSUBCATEGORY:Integer;
  IndLOGCATEGORY:Integer;
  IndLOGDATETIME:Integer;
  IndFILENAME:Integer;
begin
  if AViewInfo=nil then exit;
  if AViewInfo.GridRecord= nil then exit;
  if ACanvas = nil then exit;

  IndSUBCATEGORY  := TcxGridDBTableView( Sender ).GetColumnByFieldName('SUBCATEGORY').Index;
  IndLOGCATEGORY  := TcxGridDBTableView( Sender ).GetColumnByFieldName('LOGCATEGORY').Index;
  IndLOGDATETIME  := TcxGridDBTableView( Sender ).GetColumnByFieldName('LOGDATETIME').Index;
  IndFILENAME     := TcxGridDBTableView( Sender ).GetColumnByFieldName('FILENAME').Index;

  if Elem_ContractQry.DB.FieldByName('INVALID').AsBoolean or
    (not Elem_ContractQry.DB.FieldByName('TILLDATE').IsNull and (Elem_ContractQry.DB.FieldByName('TILLDATE').Value < Now)) then
  ACanvas.Font.Color := clRed;

  if AViewInfo.Item.Index = IndSUBCATEGORY then
  begin

    if AViewInfo.GridRecord.Values[IndLOGCATEGORY] = nLogSubCategDictContractPromiseRcvOrg then
      ACanvas.Brush.Color := clYellow
    else
      ACanvas.Brush.Color := clInfoBk;

    if AViewInfo.GridRecord.Values[IndLOGCATEGORY] <> null then
    begin
      ImgId := AViewInfo.GridRecord.Values[IndLOGCATEGORY];
      ShowTextImageInCell(Sender, ACanvas, AViewInfo, BrowseImgList, ImgArr[ImgId], OptImgPosCenter );
      ADone:= True;
    end;
  end;

  if (AViewInfo.Item.Index  = IndLOGDATETIME) and (AViewInfo.GridRecord.Values[IndFILENAME]<> null) then
  begin
    ShowTextImageInCell(Sender, ACanvas, AViewInfo, BrowseImgList, 90, OptImgPosRight );
    ADone:= True;
  end;
end;

procedure TFrameComRequisites.PersonQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcFullName').AsString :=
  DataSet.FieldByName('NAME').asString +' '+
  DataSet.FieldByName('LASTNAME').asString +' '+
  DataSet.FieldByName('SECONDNAME').asString;
end;

procedure TFrameComRequisites.PhoneQry_NewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('OFFICEID').asInteger := Elem_OfficeQry.GetValueId;
  DBBooleanSetValue( DataSet,'ISPHN', True );
  DBBooleanSetValue( DataSet,'ISMOB', False );
  DBBooleanSetValue( DataSet,'ISFAX', False );
  DBBooleanSetValue( DataSet,'ISPGR', False );
  DataSet.FieldByName('ADDMANID').asInteger := FCurManager;
end;

procedure TFrameComRequisites.FaxQry_NewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('OFFICEID').asInteger := Elem_OfficeQry.GetValueId;
  DBBooleanSetValue( DataSet,'ISPHN', False );
  DBBooleanSetValue( DataSet,'ISMOB', False );
  DBBooleanSetValue( DataSet,'ISFAX', True );
  DBBooleanSetValue( DataSet,'ISPGR', False );
  DataSet.FieldByName('ADDMANID').asInteger := FCurManager;
end;

procedure TFrameComRequisites.SetManager( CurrManager: Integer; FCurManagerName: Widestring; CanUpdate:Boolean );
begin
  self.FCurManager := CurrManager;
  self.FCurManagerName := FCurManagerName;
  //Self.FLevMngPermis := FLevMngPermis;
  FCanUpdate := CanUpdate;
  FPrepareControls( CanUpdate );
  Self.RefreshControls;
end;

function GetDocumentTemplate( aElemCompContractKind:TDBShemaView; DocId: Integer; const TemplFolder: String ): String;
begin
  Result := '';

  aElemCompContractKind.DBOpen;
  if not aElemCompContractKind.DB.Locate('ID', DocId, []) then ErrorDlg(SDataModErrorRecordNotFound)
  else
    with TStringList.Create do
      try

        Assign(aElemCompContractKind.DB.FieldByName('TEMPLATS'));
        Result := Values[sNamePar];
        if Result = '' then ErrorDlg(SDataModErrorTemplateIsNull);
      finally
        Free;
      end;

  if Result <> '' then
  begin
    Result := IncludeTrailingPathDelimiter(OptionSet.StoreFolder) +
      IncludeTrailingPathDelimiter(TemplFolder) + Result;
    if not FileExists(Result) then
    begin
      ErrorFmtDlg(SDataModErrorTemplateNotExists, [Result]);
      Result := '';
    end;
  end;
end;


function AddCapDocumentTemplate ( WordDocum:TWordDocument; WordApplic:TWordApplication; aElemCompany,aElemCOMPCONTRACTSKINDQry : TDBShemaView; Tmpl: string;
  IsBoss: Boolean; FillProc: TFillWordDocProcNew): Boolean;
var
  CapDocument, HadForErrand: string;
  Template, NewTemplate, DocType, Vis, aBookmark, aCap: OleVariant;
  StartText, EndText, vr1, I, NotSave: OleVariant;
  aTablRange: Range;
  ErrandRange, CapRange: string;
  HadDocum: _Document;
  K: Integer;

function GetFileNameWithMemo(aField: TField; sNameParId: Integer = 0): string;
begin
  with TStringList.Create do
  try
    Assign(aField);
    Result := Values[arrNamePar[sNameParId]]
  finally
    Free;
  end;
end;

begin
  Result := True;

  if aElemCompany.DBBooleanValue['ISENTERPR'] then CapDocument := GetFileNameWithMemo( aElemCOMPCONTRACTSKINDQry.DB.FieldByName('TEMPLATS'), 1 )
  else if aElemCompany.DBBooleanValue['ISBSMAN'] then CapDocument := GetFileNameWithMemo( aElemCOMPCONTRACTSKINDQry.DB.FieldByName('TEMPLATS'), 2 )
  else CapDocument := GetFileNameWithMemo( aElemCOMPCONTRACTSKINDQry.DB.FieldByName('TEMPLATS'), 3 );

  if not IsBoss then HadForErrand := GetFileNameWithMemo( aElemCOMPCONTRACTSKINDQry.DB.FieldByName('TEMPLATS'), 4 );

  CapDocument := ExtractFilePath(Tmpl) + CapDocument;

  NewTemplate := False;
  DocType := 0;
  Vis := False;

  try
    if not IsBoss then
    begin
      //заповнення даних по довіреності
      HadForErrand := ExtractFilePath(Tmpl) + HadForErrand;
      Template := HadForErrand;
      WordApplicOpen( WordDocum,WordApplic, HadForErrand, Template, NewTemplate, DocType, Vis, True);
      // виділити все крім останнього "Ентера"
      Result := FillProc(3);

      if not Result then
      begin
        WordClose( WordApplic );
        Exit;
      end;

      StartText := 0;
      vr1 := wdStory;
      WordApplic.Selection.EndKey(vr1,EmptyParam);
      EndText := WordApplic.Selection.End_;
      ErrandRange := WordDocum.Range(StartText, EndText).Text;

      WordClose( WordApplic );
    end;
    // відкриття шапки
    Template := CapDocument;
    WordApplicOpen( WordDocum, WordApplic, CapDocument, Template, NewTemplate, DocType, Vis, True);
    I := 1;
    HadDocum := WordApplic.Documents.Item(I) as _Document;
    // заповнення шапки
    Result := FillProc(1);

    if not Result then
    begin
      WordClose(WordApplic);
      Exit;
    end;

    // копіювання шапки
    CapRange := Trim(WordDocum.Paragraphs.Item(1).Range.Text);
    // виділення підвалу
    WordDocum.Tables.Item(1).Range.Select;
    aTablRange := WordDocum.Tables.Item(1).Range;
    Template := Tmpl;
    // відкриття договору
    WordApplicOpen( WordDocum, WordApplic, Tmpl, Template, NewTemplate, DocType, Vis, True);
    // якщо по довіреності
    if not IsBoss then
    begin
      aBookmark := 'OURPERSONNAMEFORCONTRACT';
      SetWordBookmark( WordDocum, WordApplic, aBookmark, ErrandRange, False);

      aBookmark := 'OURPERSONNAMEFORCONTRACT2';
      SetWordBookmark(WordDocum, WordApplic, aBookmark, ErrandRange, False)
    end;
    // вставляєм шапку
    aBookmark := 'Шапка';
    for K := 1 to 3 do
    begin
      aCap := aBookmark + MyIfThen(K > 1, IntToStr(K), EmptyStr);
      SetWordBookmark(WordDocum, WordApplic, aCap, CapRange, False);
    end;

    // вставляєм підвал
    aTablRange.Copy;
    aBookmark := 'Підвал';
    try
      WordDocum.Bookmarks.Item(aBookmark).Range.Select;
      WordApplic.Selection.Range.Paste;
    except
    end;

    Result := FillProc(0);
    NotSave := False;
    HadDocum.Close(NotSave, EmptyParam, EmptyParam);

    if not Result then begin WordClose( WordApplic ); Exit; end;
  except
    on E: EAbort do WordApplic.Disconnect;
    on E: Exception do
    begin
      ErrorDlg(E.Message);
      WordApplic.Disconnect;
    end;
  end;
end;

procedure ShowPDFContract( WordDocum:TWordDocument; WordApplic:TWordApplication;
                           aElemCompany:TDBShemaView;
                           SaveAs: string; OnlyView: Boolean = False; ReGenerate: Boolean = False);
var
  PDFDocName: string;
begin
  PDFDocName := GetPDFContract( WordDocum,WordApplic, aElemCompany, ExtractFileName(SaveAs), True);
  if not ReGenerate then ShellOpenDocument(PDFDocName)
end;

function newPrintWordDocument(WordDocum:TWordDocument; WordApplic:TWordApplication;aElemCompany,aElemCOMPCONTRACTSKINDQry:TDBShemaView; DocId: Integer;
  FillProc: TFillWordDocProcNew; const SaveAs: String;
  IsBoss: Boolean; OnlyView: Boolean = False; ReGenerate: Boolean = False): Boolean;
var
  Tmpl: String;
  VSaveAs, FForm, LckCom, Pwd, Rcnt, WrPwd, ROnly: OleVariant;
begin
  Tmpl := GetDocumentTemplate( aElemCOMPCONTRACTSKINDQry, DocId, sCntrctTempl);

  Result := AddCapDocumentTemplate( WordDocum, WordApplic,aElemCompany,aElemCOMPCONTRACTSKINDQry, Tmpl, IsBoss, FillProc );
  Result := Result and (Tmpl <> '');

  if not Result then Exit;
  Result := False;
  try
    if SaveAs <> '' then
    begin
      VSaveAs := SaveAs;
      FForm := EmptyParam;
      LckCom := EmptyParam;
      Rcnt := EmptyParam;
      WrPwd := SWordPass;
      ROnly := not OnlyView;
      Pwd := SWordPass;
      WordDocum.SaveAs(VSaveAs, FForm, LckCom, Pwd, Rcnt, WrPwd, ROnly);
    end;

    ShowPDFContract( WordDocum, WordApplic,aElemCompany, SaveAs, OnlyView, ReGenerate);
    Result := True;
    VSaveAs := False;
    if OnlyView then DeleteFile(SaveAs);
  except
    on E: EAbort do WordApplic.Disconnect;
    on E: Exception do
    begin
      ErrorDlg(E.Message);
      WordApplic.Disconnect;
    end;
  end;
end;

procedure TFrameComRequisites.butAddKindBranchClick(Sender: TObject);
begin
  Elem_CompaniesParamData.DBInsertByListView;
  Elem_CompaniesParamData.Requery;
  RefreshControls;
end;

procedure TFrameComRequisites.butDelKindBranchClick(Sender: TObject);
begin
  Elem_CompaniesParamData.DBDelete( True );
  RefreshControls;
end;

procedure TFrameComRequisites.COMPANIES_PARAM_DATAAfterInsert(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('ID_COMPANIES').Value := self.CompanySrc.DataSet.fieldByName('COMPANYID').Value;
end;

procedure TFrameComRequisites.butAddPersonsClick(Sender: TObject);
begin
  EditPerson(True);
end;

procedure TFrameComRequisites.butEditPersonsClick(Sender: TObject);
begin
  EditPerson(False);
end;

procedure TFrameComRequisites.butDelPersonsClick(Sender: TObject);
begin
  Elem_PersonQry.DBDelete(True);
  RefreshControls;
end;

procedure TFrameComRequisites.butAddPersonsComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_PersonQry.DBInsert(True);
  Elem_Comunication_PersonQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.buEditPersonsComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_PersonQry.RequeryCurrentRecord;
  Elem_Comunication_PersonQry.DBEdit(True);
  Elem_Comunication_PersonQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.butDelPersonsComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_PersonQry.DBDelete(True);
  RefreshControls;
end;

procedure TFrameComRequisites.ViewComunicationPersonDblClick(
  Sender: TObject);
begin
  if buEditPersonsComunication.Enabled then buEditPersonsComunication.Click;
end;

procedure TFrameComRequisites.ViewPersonFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshControls;
end;

procedure TFrameComRequisites.ViewComunicationCompanyID_COMUNICATION_TYPEPropertiesEditValueChanged(
  Sender: TObject);
begin
  Elem_Comunication_CompanyQry.RefreshVerticalGridPrepareMaskField;
  UpdatePrefixCountryCode( Sender, Elem_Comunication_CompanyQry,  Elem_OfficeQry.GetValueId );
end;

procedure TFrameComRequisites.ViewComunicationPersonID_COMUNICATION_TYPEPropertiesEditValueChanged(
  Sender: TObject);
begin
   Elem_Comunication_PersonQry.RefreshVerticalGridPrepareMaskField;
   UpdatePrefixCountryCode( Sender, Elem_Comunication_PersonQry,  Elem_PersonQry.DB.FieldByName('ID_COMPOFFICES').Value );
end;

procedure TFrameComRequisites.OfficeQryCalcFields(DataSet: TDataSet);
var CityFld, CntryFld: TField;
begin
  if Elem_OfficeQry.DB.FieldByName('LATNAME').AsBoolean then
  begin
    CityFld :=  Elem_OfficeQry.DB.FieldByName('CITY_ENG');
    CntryFld := Elem_OfficeQry.DB.FieldByName('COUNTRY_ENG');
  end
  else
  begin
    CityFld  := Elem_OfficeQry.DB.FieldByName('CITY');
    CntryFld := Elem_OfficeQry.DB.FieldByName('COUNTRY');
  end;

  //DataSet.FieldByName('CalcAddres').AsString :=
  //GetOfficeAddressString(  DataSet.FieldByName('STRKIND'), DataSet.FieldByName('ADDRESS'),
  //DataSet.FieldByName('HOUSE'),DataSet.FieldByName('TENEMENT'),DataSet.FieldByName('CITYKIND'), CityFld, nil, nil, DataSet.FieldByName('ZIPCODE'),CntryFld );
end;

procedure TFrameComRequisites.butAddCompanyComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_CompanyQry.DBInsert(True);
  Elem_Comunication_CompanyQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.butEditCompanyComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_CompanyQry.RequeryCurrentRecord;
  Elem_Comunication_CompanyQry.DBEdit(True);
  Elem_Comunication_CompanyQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.butDelCompanyComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_CompanyQry.DBDelete(True);
  RefreshControls;
end;

procedure TFrameComRequisites.butAddOfficeComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_Comp_OfficeQry.DBInsert(True);
  Elem_Comunication_Comp_OfficeQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.butEditOfficeComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_Comp_OfficeQry.RequeryCurrentRecord;
  Elem_Comunication_Comp_OfficeQry.DBEdit(True);
  Elem_Comunication_Comp_OfficeQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.butDelOfficeComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_Comp_OfficeQry.DBDelete(True);
  RefreshControls;
end;

procedure TFrameComRequisites.butCallToLinklPersonsComunicationClick(
  Sender: TObject);
begin
  CallLink( self.Handle, Elem_Comunication_PersonQry.DB.FieldByName('AVALUE').AsString, Elem_Comunication_PersonQry.DB.FieldByName('WEBLINK').AsString);
end;

procedure TFrameComRequisites.butCallToLinklCompanyComunicationClick(
  Sender: TObject);
begin
  CallLink( self.Handle, Elem_Comunication_CompanyQry.DB.FieldByName('AVALUE').AsString, Elem_Comunication_CompanyQry.DB.FieldByName('WEBLINK').AsString);
end;

procedure TFrameComRequisites.butCallToLinklOfficeComunicationClick(
  Sender: TObject);
begin
  CallLink( self.Handle, Elem_Comunication_Comp_OfficeQry.DB.FieldByName('AVALUE').AsString, Elem_Comunication_Comp_OfficeQry.DB.FieldByName('WEBLINK').AsString);
end;

procedure TFrameComRequisites.butCallToLinklComPersonsComunicationClick(
  Sender: TObject);
begin
  CallLink( self.Handle, Elem_Comunication_Comp_PersonQry.DB.FieldByName('AVALUE').AsString, Elem_Comunication_Comp_PersonQry.DB.FieldByName('WEBLINK').AsString);
end;

procedure TFrameComRequisites.butAddCopmPersonComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_Comp_PersonQry.DBInsert( True );
  Elem_Comunication_Comp_PersonQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.butEditCopmPersonComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_Comp_PersonQry.RequeryCurrentRecord;
  Elem_Comunication_Comp_PersonQry.DBEdit( True );
  Elem_Comunication_Comp_PersonQry.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameComRequisites.butDelCopmPersonComunicationClick(
  Sender: TObject);
begin
  Elem_Comunication_Comp_PersonQry.DBDelete( True );
  RefreshControls;
end;

procedure TFrameComRequisites.ViewComunicationCompanyDblClick(
  Sender: TObject);
begin
  if butEditCompanyComunication.Enabled then butEditCompanyComunication.Click;
end;

procedure TFrameComRequisites.ViewComunication_Comp_OfficeDblClick(
  Sender: TObject);
begin
  if butEditOfficeComunication.Enabled then butEditOfficeComunication.Click;
end;

procedure TFrameComRequisites.ViewComunication_Comp_PersonDblClick(
  Sender: TObject);
begin
  if butEditCopmPersonComunication.Enabled then butEditCopmPersonComunication.Click;
end;

procedure TFrameComRequisites.ViewOfficesDblClick(Sender: TObject);
begin
  if butEditAddres.Enabled then butEditAddres.Click;
end;

procedure TFrameComRequisites.butAddAccountClick(Sender: TObject);
begin
  Elem_AccountQry.DBInsert(True);
end;

procedure TFrameComRequisites.butEditAccountClick(Sender: TObject);
begin
  Elem_AccountQry.DBEdit(True);
end;

procedure TFrameComRequisites.butDelAccountClick(Sender: TObject);
begin
  Elem_AccountQry.DBDelete(True);
end;

procedure TFrameComRequisites.ViewAccountsDblClick(Sender: TObject);
begin
  if butEditAccount.Enabled then butEditAccount.Click;
end;

procedure TFrameComRequisites.ViewComunicationCompanyAVALUEPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  ErrorText := '';
  if Error then
    MyShowMessageDlg( ErrValidValue, mtError, but_OK );
end;

procedure TFrameComRequisites.ViewComunicationPersonAVALUEPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  ErrorText := '';
  if Error then
    MyShowMessageDlg( ErrValidValue, mtError, but_OK );
end;

procedure TFrameComRequisites.ViewCompanyDocsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var HitTest: TcxCustomGridHitTest;
begin
  HitTest := ViewCompanyDocs.ViewInfo.GetHitTest(X, Y);
  if ( HitTest<>nil )and( HitTest is TcxGridRecordCellHitTest ) and DraggedFile then begin
    ViewFlesDocItemRow := TcxGridRecordCellHitTest(HitTest).GridRecord;
    ViewFlesDocItemRow.Selected := True;
    ViewFlesDocItemRow.Focused := True;
    DraggedFile := False;
  end;
end;

procedure TFrameComRequisites.CompanyDocsQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcFileCount').AsInteger := GetCountFilesForPath(FGetPathToDoc, '*.*', False);
end;

procedure TFrameComRequisites.UpdateGridDrop;
begin
  if PageControl.ActivePage = ContractTabSheet then
  begin
    GridDropTextTarget.Target := GridContract;
    if (FElemCompanyQry.DB.FindField('SORTBYCONTRACT')<>nil) and
       (FElemCompanyQry.GetValueByFieldName('SORTBYCONTRACT') = SortByContractSendEmail) then
      GridDropTextTarget.DragTypes := [dtCopy, dtlink]
    else GridDropTextTarget.DragTypes := [];
  end
  else
  if PageControl.ActivePage = DocumentTabSheet then
  begin
    GridDropTextTarget.Target := GridDoc;
    GridDropTextTarget.DragTypes := [dtCopy, dtlink]
  end;
end;

procedure TFrameComRequisites.PageControlChange(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrameComRequisites.ViewComunicationFormatDrawCell( FieldValue,FieldFormat:string;
                                                              Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
                                                              AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean );
var indFormatOut:integer;
    indValue:Integer;
    ATextOut:string;
    aRect:TRect;
    StyleCol:TcxStyle;
begin
   indValue := TcxGridDBTableView(Sender).GetColumnByFieldName('AVALUE').Index;
   indFormatOut := TcxGridDBTableView(Sender).GetColumnByFieldName('FORMAT_OUT').Index;
  if ( AViewInfo.Item.Index = indValue )and( AViewInfo.GridRecord.Values[indFormatOut] <> null ) then
  begin
     aRect := AViewInfo.EditBounds;
     aRect.Top := AViewInfo.TextBounds.Top;
     aRect.Left := AViewInfo.TextBounds.Left;

     StyleCol := GetSelectionColor(Sender);

     ViewDrawFillRect( Sender, AViewInfo, ACanvas );
     ATextOut := MaskDoFormatText( VarToStr( AViewInfo.GridRecord.Values[indFormatOut] ), VarToStr( AViewInfo.Value ), ' ' );

     if ( AViewInfo.Focused ) or ( AViewInfo.Selected ) then ACanvas.Font.Color := StyleCol.TextColor;

     ACanvas.DrawTexT( ATextOut, aRect, 0, True );
     ADone:=True;
  end;

end;

procedure TFrameComRequisites.ViewComunicationCompanyCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   ViewComunicationFormatDrawCell( 'AVALUE','FORMAT_OUT', Sender, ACanvas,AViewInfo, ADone );
end;

procedure TFrameComRequisites.ViewComunication_Comp_OfficeCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ViewComunicationFormatDrawCell( 'AVALUE','FORMAT_OUT', Sender, ACanvas,AViewInfo, ADone );
end;

procedure TFrameComRequisites.ViewComunicationPersonCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ViewComunicationFormatDrawCell( 'AVALUE','FORMAT_OUT', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TFrameComRequisites.ViewComunication_Comp_PersonCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ViewComunicationFormatDrawCell( 'AVALUE','FORMAT_OUT', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TFrameComRequisites.ViewFilesFileSizeGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if (AText<>'') and (IsStrANumber(AText)) then
    AText :=    FormatFloat('### ###.##', StrToFloat(AText) / 1024 ) +' КБ'
end;

function CheckReadyToSynhronize(CurManager:Integer; ElemCompany:TDBShemaView; ShowError:Boolean ):Integer;
begin
  result:=0;
  if CurManager <=0 then
  begin
    ErrorDlg('Для синхронізації з 1С потрібно зарееструструватись в системі.');
    result:=-5;
    Exit;
  end;
  //*************************************************
  if not ElemCompany.DB.FieldByName('AREAGENTCONTRACT').AsBoolean then
  begin
    if (ShowError) then InformDlg('Синхронізація доступна лише для партнерів з якими укладено договір');
    result:=-6;
    exit;
  end;
  //*************************************************
  if not ElemCompany.DB.FieldByName('PeymToAgency').AsBoolean then
  begin
    if (ShowError) then InformDlg('Синхронізація доступна лише для партнерів з прямими розрахунками');
    result:=-7;
    exit;
  end;
  //*************************************************
end;
//******************************************************************************

function DllFunctMergeClientTo1CByClientId( DllFunc : Pointer; paramFun:Pointer ):Boolean;
begin
  PParamSynchrClient(paramFun).Res := TMergeClientTo1CByClientId(DllFunc)( PParamSynchrClient(paramFun).param , PParamSynchrClient(paramFun).ClientId );
  result := PParamSynchrClient(paramFun).Res = 0;
end;
//******************************************************************************
function MergeClientTo1CByClientId(ClientId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent:Boolean=true; AutoMerge:Boolean=false ):Integer;
var CallSoap1C:TFunctCallSoap1C;
    ParamSynchrClient:PParamSynchrClient;
begin
  if not ClientDataSync then Exit;

  result := CheckReadyToSynhronize( ElemCompany.GetCurrManagerId, ElemCompany, not ShowWhenDiferent );
  if result<>0 then exit;
  //*************************************************
  try
   CallSoap1C := TFunctCallSoap1C.Create(  ElemCompany.DBGetParamConnect, MarkDifStyle , ShowLoadCursor );

   result := CallSoap1C.SynhronizationCompanyDBAnd1C( ElemCompany.GetCurrManagerId, ClientId , ShowWhenDiferent, true, true, true, AutoMerge);
  finally
   CallSoap1C.Free;
  end;
end;
//******************************************************************************
function MergeClientTo1C( ClientId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent:Boolean=true;AutoMerge:Boolean=false ):Integer;
begin
   result := MergeClientTo1CByClientId( ClientId, ElemCompany, MarkDifStyle, ShowLoadCursor, ShowWhenDiferent,AutoMerge);
end;
//******************************************************************************
function MergeClientAccountsTo1CByClientId( ClientId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent: Boolean=true; AutoMerge:boolean=false ): Integer;
 var CallSoap1C:TFunctCallSoap1C;
begin
  if not ClientDataSync then Exit;

  result:=CheckReadyToSynhronize( ElemCompany.GetCurrManagerId, ElemCompany, not ShowWhenDiferent);
  if result<>0  then exit;

  try
   CallSoap1C := TFunctCallSoap1C.Create( ElemCompany.DBGetParamConnect, MarkDifStyle,ShowLoadCursor );

   result:=CallSoap1C.SynhronizationClientAndBankAccountsDBAnd1C( ElemCompany.GetCurrManagerId, ElemCompany.GetValueId, ShowWhenDiferent, true, true, true, AutoMerge );
  finally
   CallSoap1C.Free;
  end;
end;
//******************************************************************************
function MergeClientAccountsTo1C( ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowWhenDiferent: Boolean=true ): Integer;
begin
  result:= MergeClientAccountsTo1CByClientId( ElemCompany.GetValueId, ElemCompany,MarkDifStyle, ShowLoadCursor, ShowWhenDiferent );
end;
//******************************************************************************
function MergeClientContractById( IdClient,IdContract:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowMessage:Boolean=false ) : Integer;
var CallSoap1C:TFunctCallSoap1C;
begin
  if not ClientDataSync then Exit;

  result:=CheckReadyToSynhronize( ElemCompany.GetCurrManagerId, ElemCompany, True );
  if result<>0  then exit;

  try
   CallSoap1C := TFunctCallSoap1C.Create(  ElemCompany.DBGetParamConnect, MarkDifStyle, ShowLoadCursor );

   result := CallSoap1C.SynhronizationClientAndContractDBAnd1CByContractId( ElemCompany.GetCurrManagerId, IdClient, IdContract,  true, true );

   if (result = 0)and(ShowMessage) then
    InformDlg('Синхронізація договору пройшла успішно.');

  finally
   CallSoap1C.Free;
  end;
end;
//******************************************************************************
function MergeClientContract( CompanyId , ContractId:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true; ShowMessage:Boolean=false ) : Integer;
begin
   result:=MergeClientContractById( CompanyId, ContractId, ElemCompany, MarkDifStyle, ShowLoadCursor, ShowMessage);
end;
//******************************************************************************
function DllFunctShowMergeLog1C( DllFunc : Pointer; paramFun:Pointer ):Boolean;
begin
  //PParamSynchrClient(paramFun).Res :=
  TShowMergeLog1C(DllFunc)( PParamSynchrShowLog(paramFun).param, PParamSynchrShowLog(paramFun).isAdmin  );
  result:=True;
  //result := PParamSynchrClient(paramFun).Res = 0;
end;
//******************************************************************************
procedure ShowMergeLog1C( ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true );
var CallSoap1C:TFunctCallSoap1C;
var ParamSynchr :PParamSynchrShowLog;
begin

 { try
    New( ParamSynchr );
    ParamSynchr.isAdmin := DMServ.CurManagerAdminPerms[nDictPartCommon];   // is Admin
    ParamSynchr.param := FGetParamSynchr( True , False );

    ExecFunctDLL( 'LibSOAP1C.dll', 'ShowMergeLog1C', DllFunctShowMergeLog1C , ParamSynchr );

  finally
    Dispose( ParamSynchr.param );
    Dispose( ParamSynchr );
  end; }

  try
    CallSoap1C := TFunctCallSoap1C.Create(  ElemCompany.DBGetParamConnect, MarkDifStyle, ShowLoadCursor );

    //if DMServ.CurManagerAdminPerms[nDictPartCommon] then
    CallSoap1C.ShowFindMergeSoap1CLog( ElemCompany.GetCurrManagerId , true, true, true, true, true );
    //else CallSoap1C.ShowFindMergeSoap1CLog( DMServ.CurManager, false, true, true, true, true );

  finally
    CallSoap1C.Free;
  end;
end;
//******************************************************************************
function MergeAllContractsForIdClient( id:Integer; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle; ShowLoadCursor:Boolean=true ):integer;
var CallSoap1C:TFunctCallSoap1C;
    DsContracts:TDataset;
    CountOk:Integer;
    Res:Integer;
begin
 try
   Result:=0;
   CallSoap1C := TFunctCallSoap1C.Create(  ElemCompany.DBGetParamConnect, MarkDifStyle ,ShowLoadCursor);
   DsContracts:= CallSoap1C.GetAllContractsForClientId( id );

   CountOk:=0;
   While not DsContracts.Eof do
   begin
     Res := MergeClientContractById( id, DsContracts.FieldByName('COMPCONTRACTID').AsInteger,ElemCompany, MarkDifStyle, ShowLoadCursor );
     if Res = 0 then Inc(CountOk);
     DsContracts.Next;
   end;

   if DsContracts.RecordCount = CountOk then Result:=0
   else Result:=-1;

 finally
   DsContracts.Close;
   CallSoap1C.DestroyDSQuery( DsContracts );
   CallSoap1C.Free;
 end;
end;
//******************************************************************************
procedure CheckForMargeContract( aParam: Integer; CompanyId, ContractId:Variant; ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle );
begin
  if aParam in [nContractRcvOrig, nContractRcvCopy, nContractExtend, nContractFinish, nContractReReestr] then
    MergeClientContract( CompanyId , ContractId, ElemCompany, MarkDifStyle );
end;
//******************************************************************************
procedure MergeAllForCurrentCompany( ElemCompany:TDBShemaView; MarkDifStyle:TcxStyle );
const MessInteruptProgresAction = 'Ви дійсно хочете зупинити синхронізацію?';
var i:Integer;
    SaveBmk:TBookmark;
    resCompany:Integer;
    resContract:Integer;
    resBankAccounts:Integer;
    ActionProgres:TProgressBar;
    CountOk:Integer;
    ResSynhronize:TResultSynhronizeSoap1C;
    CaptionProgres:WideString;
    IndexIdColumn:Integer;
    IndexNameColumn:Integer;
    idValue:Variant;
    NameValue:WideString;
begin
  if not ClientDataSync then Exit;
  
 try
  ActionProgres:= ShowProgres( 'Зачекайте',MessInteruptProgresAction);
  ResSynhronize:=TResultSynhronizeSoap1C.Create;

  if ElemCompany.View.DataController.Controller.SelectedRecordCount = 0 then exit;
  //if aGrid.SelectedRows.Count =0 then
  //  aGrid.SelectedRows.CurrentRowSelected:=true;

  //SaveBmk := aGrid.DataSource.DataSet.GetBookmark;
  //aGrid.DataSource.DataSet.DisableControls;
  ElemCompany.DB.DisableControls;
  ElemCompany.SavePosSelected;
  ElemCompany.SaveBookmark;

  ActionProgres.Max := ElemCompany.View.DataController.Controller.SelectedRecordCount;
  ActionProgres.Position := 0;
  IndexIdColumn := ElemCompany.View.GetColumnByFieldName( ElemCompany.FieldKod ).Index;
  IndexNameColumn := ElemCompany.View.GetColumnByFieldName( 'NAME' ).Index;

  for i:=0 to ElemCompany.View.DataController.Controller.SelectedRecordCount-1 do
  begin
    resCompany := -6;
    resContract:= -6;
    resBankAccounts := -6;

    //Application.ProcessMessages;
    idValue := ElemCompany.View.DataController.Controller.SelectedRecords[i].Values [IndexIdColumn];
    NameValue := VarToStr( ElemCompany.View.DataController.Controller.SelectedRecords[i].Values[IndexNameColumn] );
    ElemCompany.DB.Locate( ElemCompany.FieldKod, idValue,[] );
    //aGrid.DataSource.DataSet.GotoBookmark( Pointer(aGrid.SelectedRows.Items[i]) );
   
    CaptionProgres:=FormingShortlyTextToWidthByControl( TForm(ActionProgres.Owner), NameValue, TForm(ActionProgres.Owner).Width - 100 ,'','...');
    SetCurrTitleProgresAction('Синхронізація: '+CaptionProgres + #13#10 + IntToStr(i+1)+ '/' +IntToStr( ActionProgres.Max ));

    resCompany:= MergeClientTo1C( idValue , ElemCompany, MarkDifStyle, False, True, False );
    if resCompany = -5 then break;
    //***********************
    if resCompany = 0 then
     resContract := MergeAllContractsForIdClient( idValue ,ElemCompany, MarkDifStyle,  False );
    //***********************
    if resCompany = 0 then
     resBankAccounts:= MergeClientAccountsTo1CByClientId( idValue , ElemCompany, MarkDifStyle, False, True, True);
    //*************************************************
    if resContract = -1 then resContract:=-6;
    if resBankAccounts = -1 then resBankAccounts:=-6;

    if (resCompany<>-6) and (resCompany <> 0 ) then resCompany:=1;
    if (resContract<>-6) and (resContract <> 0) then resContract:=1;
    if (resBankAccounts<>-6)and(resBankAccounts <> 0) then resBankAccounts:=1;
    //*************************************************
   if resCompany = -6 then
   begin
    resContract:= -6;
    resBankAccounts:= -6;
   end;
   //*************************************************
   ResSynhronize.AddResult( NameValue, idValue, resCompany , resContract ,resBankAccounts );
   ActionProgres.Position := ActionProgres.Position + 1;
   ActionProgres.Repaint;
   
   if not CanContinueProgresAction then Break;
  end;                   

 finally
   HideProgres;
   ResSynhronize.ShowResult;
   ElemCompany.GotoBookmark;
   ElemCompany.RestorePosSelected;
   ElemCompany.DB.EnableControls;

   ResSynhronize.Close;
 end;
end;
//******************************************************************************


end.

// DMServ.ADOConnection



