unit ServMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db,
  DBTables, ImgList, ExtDlgs, OleServer, Word2000, Excel2000,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ComObj, Jpeg, OfficeXP, ExcelXP, WordXP, StdCtrls,  Printers,
  IBCustomDataSet, IBQuery, IBDatabase, shellapi, ComCtrls, DBCtrls, ExtCtrls,
  IBStoredProc,  IBTable, StrUtils, core,UnitProc,
  UnitIBQuery, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxImageComboBox, cxTextEdit, cxCalendar, ADODB, UnitTimeLiner,
  cxCheckBox, cxImage, cxDBExtLookupComboBox, cxBlobEdit,StatForm,UnitGTranslate,
  cxTL, cxGridBandedTableView, cxGridCardView, dxmdaset, cxDBLookupComboBox,
  cxCheckComboBox, cxButtonEdit, UnitInputPrice , UnitExportWord,
  cxTimeEdit, cxDBTL, cxMaskEdit, Menus, MngrDlg, UnitProjectProc, UnitGenerateElementsCore,
  cxDropDownEdit;

const
  ObdzvinArr: array[1..10] of string = ('46', '24', '83', '24', '90', '46', '0', '0', '83', '80');
  nDictPartCommon = 0;
  nDictPartCountry = 1;
  nDictPartCity = 2;
  nDictPartHotel = 3;
  nDictPartHotelGrp = 4;
  nDictPartHotelCat = 5;
  nDictPartCurrency = 6;
  nDictPartDrive = 7;
  nDictPartRoomType = 8;
  nDictPartRoomView = 9;
  nDictPartFeedType = 10;
  nDictPartService = 11;
  nDictPartReklama = 12;
  nDictPartCompany = 13;
  nDictPartBank = 14;
  nDictPartHotelBld = 15;
  nDictPartServGrp = 16;
  nDictPartInterest = 17;
  nDictPartOther = 18;
  nDictPartHotelBuild = 19;
  nDictPartHotelType = 20;
  nDictPartLanguage = 21;
  nDictPartRoomExpandName = 22;
  nDictPartRoomInfraType = 23;
  nDictPartRoomIfraGroup = 24;
  nDictPartRoomInfrastructure = 25;
  nDictPartBedType = 26;//67; // Типи ліжок
  nDictPartDocumVisa = 50;
  nDictPartEmbassies = 51;
  nDictPartResort = 52;
  nDictPartNaturObject = 53;
  nDictPartResortType = 64;
  nDictPartNaturObjectType = 65;
  nDictPartAdminUnitType = 66; // Адміністративні одиниці
  COLOR_NUM = 14;

  BeginDate = '14.02.2011';
  sCntrctTempl = 'Templates\Contracts\';
  sAlgolStamp = 'Печатка Алголя.png';
  sOlegSign = 'Пiдпис Олега.png';

  sExtraAgent = '4%';
  sResortFormat = '%s, %s курорт';

  nCityObj = 0;
  nResortObj = 1;
  nNaturObj = 2;
  nInfraObj = 3;


type
  TDictParts = nDictPartCommon..nDictPartOther;

  //TFillWordDocProc = procedure of object;
  //TFillWordDocProcNew = function(TypeTempl: Integer = 0): Boolean of object;

  TFieldSectionData = record
    FormCaption: WideString;
    MemoFieldName: WideString;
    IdFieldName:   WideString;
    MainFieldName: WideString;

    CheckUseServldSql: WideString;
    UkrServNameSQLSql: WideString;

    SmallIconField: WideString;
    LargeIconField: WideString;
  end;

  TOfficeData = record
    IsDef  : Variant;
    IsHead : Variant;
  end;

  TDMServ = class(TDataModule)
    ReklamaQry: TADOQuery;
    ReklamaQryName: TStringField;
    ReklamaQryVendorId: TIntegerField;
    DriveFloorTotalQry: TADOQuery;
    DrvSrvLnkQry: TADOQuery;
    BankLookQry: TADOQuery;
    BankLookQrySrc: TDataSource;
    CompAccountQry: TADOQuery;
    CompAccountQryCOMPANYID: TIntegerField;
    CompAccountQryACCOUNTID: TIntegerField;
    CompAccountQryBANKID: TIntegerField;
    CompAccountQryACCOUNTNO: TStringField;
    CompAccountQryACCOUNTNO2: TStringField;
    CompAccountQryISCORRESP: TStringField;
    AnketTempQry: TADOQuery;
    AnketTempQryCOUNTRYID: TIntegerField;
    AnketTempQryTOURISTTEMPLATEID: TIntegerField;
    AnketTempQryIDENTCODE: TStringField;
    AnketTempQryOLDSURNAME: TStringField;
    AnketTempQryOLDSECONDNAME: TStringField;
    AnketTempQryBIRTHLOCALITY: TStringField;
    AnketTempQryBIRTHCOUNTRY: TStringField;
    AnketTempQryPASSPORTISSUE: TStringField;
    AnketTempQryPASSPORTISSUEADDRESS: TStringField;
    AnketTempQryNATIONALITY: TStringField;
    AnketTempQryPRIORNATIONALITY: TStringField;
    AnketTempQrySEX: TStringField;
    AnketTempQryMARRIED: TStringField;
    AnketTempQrySPOUSENAME: TStringField;
    AnketTempQrySPOUSESURNAME: TStringField;
    AnketTempQrySPOUSEOLDSURNAME: TStringField;
    AnketTempQrySPOUSEFIRSTNAME: TStringField;
    AnketTempQrySPOUSESECONDNAME: TStringField;
    AnketTempQrySPOUSEOLDSECONDNAME: TStringField;
    AnketTempQrySPOUSEBIRTHDATE: TStringField;
    AnketTempQrySPOUSEBIRTHLOCALITY: TStringField;
    AnketTempQrySPOUSEBIRTHCOUNTRY: TStringField;
    AnketTempQrySPOUSENATIONALITY: TStringField;
    AnketTempQryPROFESSION: TStringField;
    AnketTempQryOCCUPATION: TStringField;
    AnketTempQryEMPLOYER: TStringField;
    AnketTempQryEMPLADDRESS: TStringField;
    AnketTempQryEMPLPHONE: TStringField;
    AnketTempQryDESTINATION: TStringField;
    AnketTempQrySHENGENENTRY: TStringField;
    AnketTempQryARRIVECUSTOM: TStringField;
    AnketTempQryDEPARTCUSTOM: TStringField;
    AnketTempQryGARANT: TStringField;
    AnketTempQryGARANTADDRESS: TStringField;
    AnketTempQryREFERENCE: TStringField;
    AnketTempQryTRAVELOBJECT: TStringField;
    AnketTempQryDURATIONFROM: TStringField;
    AnketTempQryDURATIONTO: TStringField;
    AnketTempQryDRIVEKIND: TStringField;
    AnketTempQryLASTVISITDATE: TStringField;
    AnketTempQryLASTEMBASSYDATE: TStringField;
    AnketTempQryDESTCOUNTRY: TStringField;
    AnketTempQryVISAKIND: TStringField;
    AnketTempQryVISAPERIOD: TStringField;
    AnketTempQryNATIONALVISA: TStringField;
    AnketTempQryENDDESTINATION: TStringField;
    AnketTempQryENDVISA: TStringField;
    AnketTempQryBIRTHDATE: TStringField;
    AnketTempQryPARENTSCYR: TStringField;
    AnketTempQryPARENTSLAT: TStringField;
    AnketTempQryCHILDNAME: TStringField;
    AnketTempQryCHILDSURNAME: TStringField;
    AnketTempQryCHILDFIRSTNAME: TStringField;
    AnketTempQryCHILDSECONDNAME: TStringField;
    AnketTempQryCHILDBIRTHDATE: TStringField;
    AnketTempQryCHILDBIRTHLOCALITY: TStringField;
    AnketTempQryCHILDNATIONALITY: TStringField;
    AnketTempQryRETURNVISA1: TStringField;
    AnketTempQryRETURNVISA1NO: TStringField;
    AnketTempQryRETURNVISA1DATE: TStringField;
    AnketTempQryRETURNVISA2: TStringField;
    AnketTempQryRETURNVISA2NO: TStringField;
    AnketTempQryRETURNVISA2DATE: TStringField;
    AnketTempQryOTHERINFO: TStringField;
    AnketTempQryGARANTNATIONALITY: TStringField;
    AnketTempQryHASMONEY: TStringField;
    AnketTempQryENDVISAKIND: TStringField;
    AnketTempQryENDVISANO: TStringField;
    AnketTempQryENDVISADATE: TStringField;
    AnketTempQryENDVISAISSUE: TStringField;
    AnketTempQryLASTEMBASSYFILTER: TSmallintField;
    AnketTempQryLASTVISITFILTER: TSmallintField;
    AnketTempQryDOCUMENTS: TMemoField;
    BrDrvMapQry: TADOQuery;
    BrDrvMapQryDRIVEID: TIntegerField;
    BrDrvMapQryPLACEMAPID: TIntegerField;
    BrDrvMapQryFLOORNO: TSmallintField;
    BrDrvMapQryFLOORNAME: TStringField;
    BrDrvMapQryPLACECOUNT: TSmallintField;
    BrDrvMapQryNUMBERORDER: TSmallintField;
    BrDrvMapQryNUMBERCHARSET: TSmallintField;
    BrDrvMapQryMAP: TMemoField;
    BrDrvMapSrc: TDataSource;
    HotelCopyProc: TADOStoredProc;
    ReklamaQryMEMO: TMemoField;
    ReklamaQryLookVendor: TStringField;
    CompanyQry: TADOQuery;
    CompanySrc: TDataSource;
    CompAccountQryADDMANID: TIntegerField;
    AnketTempQryADDITADDRESS: TStringField;
    AnketTempQryFATHERCYR: TStringField;
    AnketTempQryFATHERLAT: TStringField;
    AnketTempQryMOTHERCYR: TStringField;
    AnketTempQryMOTHERLAT: TStringField;
    AnketTempQryMOTHEROLDCYR: TStringField;
    AnketTempQryMOTHEROLDLAT: TStringField;
    AnketTempQryCHILDBIRTHCOUNTRY: TStringField;
    AnketTempQryGARANTPHONE: TStringField;
    AnketTempQryADDRTONAME: TStringField;
    AnketTempQryADDRESSTO: TStringField;
    AnketTempQryADDRTOPHONE: TStringField;
    AnketTempQrySPOUSESEX: TStringField;
    InterestQry: TADOQuery;
    InterestQryINTERESTID: TIntegerField;
    InterestQryNAME: TStringField;
    InterestQrySTARS: TStringField;
    InterestQryCITY: TStringField;
    InterestQryINTERESTKIND: TStringField;
    InterestQryINTERESTTYPE: TStringField;
    InterestQryCOUNTRYID: TIntegerField;
    InterestQryENTERPRISEID: TIntegerField;
    InterestQrySHOWWEB: TStringField;
    InterestQryCOMMENTS: TMemoField;
    InterestQryCOUNTRY_ENG: TStringField;
    IntrstImgQry: TADOQuery;
    IntrstImgSrc: TDataSource;
    InterestSrc: TDataSource;
    IntrstImgQryINTERESTID: TIntegerField;
    IntrstImgQryINTERESTIMAGEID: TIntegerField;
    IntrstImgQryFILENAME: TStringField;
    IntrstImgQryORDERNO: TIntegerField;
    IntrstImgQryDESCRIPT: TMemoField;
    IntrstImgQryIMGKIND: TSmallintField;
    IntrstImgQrySHOWLOC: TStringField;
    IntrstImgQrySHOWWEB: TStringField;
    IntrstImgQryCalcFileName: TStringField;
    IntrstVendorSrc: TDataSource;
    IntrstVendorQry: TADOQuery;
    IntrstVendorQryINTERESTID: TIntegerField;
    IntrstVendorQryINTERESTVENDORID: TIntegerField;
    IntrstVendorQryCOMPANYID: TIntegerField;
    IntrstVendorQryNAME: TStringField;
    AnketTempQryPASSPORTEXPIREMONTHS: TSmallintField;
    DrvImgSrc: TDataSource;
    DrvImgQry: TADOQuery;
    DrvImgQryDRIVEIMAGEID: TIntegerField;
    DrvImgQryDRIVEID: TIntegerField;
    DrvImgQryFILENAME: TStringField;
    DrvImgQryORDERNO: TIntegerField;
    DrvImgQryDESCRIPT: TMemoField;
    DrvImgQryIMGKIND: TSmallintField;
    DrvImgQrySHOWLOC: TStringField;
    DrvImgQrySHOWWEB: TStringField;
    DrvImgQryCalcFileName: TStringField;
    DrvVendorSrc: TDataSource;
    DrvVendorQry: TADOQuery;
    DrvVendorQryDRIVEID: TIntegerField;
    DrvVendorQryDRIVEVENDORID: TIntegerField;
    DrvVendorQryCOMPANYID: TIntegerField;
    DrvVendorQryNAME: TStringField;
    DrvSrvLnkQryDRIVEID: TIntegerField;
    DrvSrvLnkQryLINKID: TIntegerField;
    DrvSrvLnkQrySERVICEID: TIntegerField;
    DrvSrvLnkQryHAVEVALUE: TStringField;
    DrvSrvLnkQryINTVALUE: TIntegerField;
    DrvSrvLnkQryMEASUREUNIT: TStringField;
    DrvSrvLnkQryHAVECOST: TSmallintField;
    DrvSrvLnkQryCOST: TFloatField;
    DrvSrvLnkQryCURRID: TIntegerField;
    DrvSrvLnkQryCOMMENTS: TMemoField;
    DrvSrvLnkQryNAME: TStringField;
    DrvSrvLnkQryLARGEICON: TBlobField;
    DrvSrvLnkQrySMALLICON: TBlobField;
    DrvSrvLnkQryCURRENCYSHORT: TStringField;
    DrvSrvLnkQryCalcValue: TStringField;
    DrvSrvLnkQryCalcCost: TStringField;
    DrvSrvLnkQryCalcHaveCost: TStringField;
    DrvSrvLnkQryCalcMemo: TStringField;
    AllDocQry: TADOQuery;
    VisaDocAddProc: TADOStoredProc;
    VisaDocDelProc: TADOStoredProc;
    VISADOCUMENTS_NEWQry: TADOQuery;
    VISADOCUMENTS_NEWQryVISADOCUMENTID: TIntegerField;
    VISADOCUMENTS_NEWQryCOUNTRYID: TIntegerField;
    VISADOCUMENTS_NEWQryEMBASSYID: TIntegerField;
    VISADOCUMENTS_NEWQryDOCID: TIntegerField;
    VISADOCUMENTS_NEWQryNEEDCOUNT: TIntegerField;
    VISADOCUMENTS_NEWQryAGERESTRICTION: TIntegerField;
    VISADOCUMENTS_NEWQryEXPIREMONTHS: TIntegerField;
    VISADOCUMENTS_NEWQryISSUEDMONTHS: TIntegerField;
    VISADOCUMENTS_NEWQrySUMMA: TFloatField;
    VISADOCUMENTS_NEWQryCOMMENTS: TMemoField;
    ItsDocumVisaListQry: TADOQuery;
    ItsDocumVisaListQryDOCID: TIntegerField;
    ItsDocumVisaListQryVISADOCUMENTID: TIntegerField;
    ItsDocumVisaListQryVIEWNAME: TStringField;
    ItsDocumVisaListQryNEEDCOUNT: TIntegerField;
    ItsDocumVisaListQryAGERESTRICTION: TIntegerField;
    ItsDocumVisaListQryEXPIREMONTHS: TIntegerField;
    ItsDocumVisaListQryISSUEDMONTHS: TIntegerField;
    ItsDocumVisaListQryCalcAgeRestr: TStringField;
    ItsDocumVisaListQryTYPEID: TIntegerField;
    ItsDocumVisaListQryTYPENAME: TStringField;
    ItsDocumVisaListQryPERIOD: TIntegerField;
    ItsDocumVisaListQryISUSE: TStringField;
    ItsDocumVisaListQrySHORTNAME: TStringField;
    ItsDocumVisaListQryEXPIREPERIOD: TIntegerField;
    ItsDocumVisaListQryISSUESPERIOD: TIntegerField;
    ItsDocumVisaListQryTYPEVAL: TIntegerField;
    ItsDocumVisaListQryTYPEDOCID: TIntegerField;
    ItsDocumVisaListQryCOMMENTS: TMemoField;
    ItsDocumVisaListQryMARRIEDSTATE: TIntegerField;
    ItsDocumVisaListQryFORIND: TStringField;
    ItsDocumVisaListQryFORADDMANUAL: TStringField;
    ItsDocumVisaListQryPOSADA: TStringField;
    ItsDocumVisaListQryCalcMarried: TStringField;
    ItsDocumVisaListQryFUNDING: TStringField;
    ItsDocumVisaListQryPOSADAID: TIntegerField;
    ItsDocumVisaListQryRETURNED: TStringField;
    ItsDocumVisaListQryCalcExpireMonths: TStringField;
    ItsDocumVisaListQryCalcIssuedMonths: TStringField;
    ItsDocumVisaListQryCalcSum: TStringField;
    ItsDocumVisaListQryTRANSMIT: TStringField;
    ItsDocumVisaListQryVisaDocGroupId: TIntegerField;
    ItsDocumVisaListQryGROUPNAME: TStringField;
    StoreEmbassyProc: TADOStoredProc;
    ItsDocumVisaListQryBEGINDOC: TStringField;
    ItsDocumVisaListQryDOCFORLASTCOUNT: TIntegerField;
    ItsDocumVisaListQryDOCFORLASTPERIOD: TIntegerField;
    ItsDocumVisaListQryCalcDocForLast: TStringField;
    ItsDocumVisaListQryONETYPEDOC: TIntegerField;
    ItsDocumVisaListQryEMBASSYID: TIntegerField;
    ItsDocumVisaListQrySUBGROUPNAME: TStringField;
    ItsDocumVisaListQrySUBGROUPID: TIntegerField;
    ItsDocumVisaListQryLINK: TStringField;
    UpdLinkProc: TADOStoredProc;
    ItsDocumVisaListQryCOUNTRYID: TIntegerField;
    SelPartnersQry: TADOQuery;
    SelPartnersQryPARTNERID: TIntegerField;
    SelPartnersQryCURRID: TIntegerField;
    SelPartnersQryPARTNERNAME: TStringField;
    SelPartnersQryCOMPANYID: TIntegerField;
    SelPartnersQryPAYFORSERV: TFloatField;
    SelPartnersQryCURRENCYSHORT: TStringField;
    SelPartnersQryCalcPayServ: TStringField;
    SelTaxSystemQry: TADOQuery;
    SelItsPersonQry: TADOQuery;
    SelItsPersonQryCOMPANYID: TIntegerField;
    SelItsPersonQryPERSONID: TIntegerField;
    SelItsPersonQryFULLNAME: TStringField;
    SelItsPersonQryOCCUPATION: TStringField;
    SelItsPersonQrySIGNRIGHT: TStringField;
    SelItsPersonQryNAME: TStringField;
    SelItsPersonQrySECONDNAME: TStringField;
    SelItsPersonQryCalcFullName: TStringField;
    SelItsPersonQryAREACODE: TStringField;
    SelItsPersonQryPHONENO: TStringField;
    SelItsPersonQryCalcPhoneNo: TStringField;
    LastNoteQry: TADOQuery;
    LastNoteQryMEMO: TMemoField;
    SelPersonQry: TADOQuery;
    SelPersonQryCOMPANYID: TIntegerField;
    SelPersonQryPERSONID: TIntegerField;
    SelPersonQryFULLNAME: TStringField;
    SelPersonQryOCCUPATION: TStringField;
    SelPersonQrySIGNRIGHT: TStringField;
    SelPersonQryNAME: TStringField;
    SelPersonQrySECONDNAME: TStringField;
    SelCompCntrctsQry: TADOQuery;
    SelCompCntrctsQryCOMPANYID: TIntegerField;
    SelCompCntrctsQryTRADENAME: TStringField;
    SelCompCntrctsQryCONTRACTID: TIntegerField;
    SelCompCntrctsQryTILLDATE: TDateTimeField;
    ServiceAddProc: TADOStoredProc;
    ServGroupAddProc: TADOStoredProc;
    CheckRoomQry: TADOQuery;
    AnketTempQrySECONDNAME: TStringField;
    AnketTempQryFIRSTNAME: TStringField;
    AnketTempQryMIDDLENAME: TStringField;
    AnketTempQryMIDDLELNAME: TStringField;
    AnketTempQryPASSPORTNOINSIDE: TStringField;
    AnketTempQryPASSDATEINSIDE: TStringField;
    AnketTempQryPASSISSUEDINSIDE: TStringField;
    AnketTempQryFATHERSECONDCYR: TStringField;
    AnketTempQryFATHERSECONDLAT: TStringField;
    AnketTempQryFATHEROLDCYR: TStringField;
    AnketTempQryFATHEROLDLAT: TStringField;
    AnketTempQryFATHERNATIONALITY: TStringField;
    AnketTempQryFATHERBIRTHDATE: TStringField;
    AnketTempQryFATHERBIRTHLOCALITY: TStringField;
    AnketTempQryADDRESS: TStringField;
    AnketTempQryBIRTHSURNAME: TStringField;
    AnketTempQryBIRTHSURNAMELAT: TStringField;
    AnketTempQryHOMEPHONE: TStringField;
    AnketTempQryMOBILPHONE: TStringField;
    AnketTempQryEMAIL: TStringField;
    AnketTempQryPASSPORTNO: TStringField;
    AnketTempQryPASSPORTDATE: TStringField;
    AnketTempQryPASSPORTEXPIRE: TStringField;
    AnketTempQryFATHERTO: TSmallintField;
    AnketTempQryFATHERBIRTHCOUNTRY: TStringField;
    AnketTempQryMOTHERSECONDCYR: TStringField;
    AnketTempQryMOTHERSECONDLAT: TStringField;
    AnketTempQryMOTHERNATIONALITY: TStringField;
    AnketTempQryMOTHERBIRTHDATE: TStringField;
    AnketTempQryMOTHERBIRTHCOUNTRY: TStringField;
    AnketTempQryMOTHERBIRTHLOCALITY: TStringField;
    AnketTempQryMOTHERTO: TSmallintField;
    AnketTempQrySPOUSEWITH: TSmallintField;
    AnketTempQryCHILDOLDCYR: TStringField;
    AnketTempQryCHILDOLDLAT: TStringField;
    AnketTempQryCHILDWITH: TSmallintField;
    AnketTempQryGUARDIANCYR: TStringField;
    AnketTempQryGUARDIANLAT: TStringField;
    AnketTempQryGUARDIANSECONDCYR: TStringField;
    AnketTempQryGUARDIANSECONDLAT: TStringField;
    AnketTempQryGUARDIANOLDCYR: TStringField;
    AnketTempQryGUARDIANOLDLAT: TStringField;
    AnketTempQryGUARDIANNATIONALITY: TStringField;
    AnketTempQryGUARDIANBIRTHDATE: TStringField;
    AnketTempQryGUARDIANBIRTHCOUNTRY: TStringField;
    AnketTempQryGUARDIANBIRTHLOCALITY: TStringField;
    AnketTempQryGUARDIANTO: TSmallintField;
    AnketTempQryEMPLEMAIL: TStringField;
    AnketTempQryGAINSUM: TStringField;
    AnketTempQryPERSGARANTSURNAME: TStringField;
    AnketTempQryPERSGARANTNAME: TStringField;
    AnketTempQryPERSGARANTBIRTHDATE: TStringField;
    AnketTempQryPERSGARANTNATIONALITY: TStringField;
    AnketTempQryPERSGARANTADDRESS: TStringField;
    AnketTempQryPERSGARANTPHONE: TStringField;
    AnketTempQryPERSGARANTFAX: TStringField;
    AnketTempQryPERSGARANTEMAIL: TStringField;
    AnketTempQryBIOMETRICS: TStringField;
    AnketTempQryOLDVISALASTYEAR: TStringField;
    AnketTempQryOLDVISAFORYEARS: TSmallintField;
    AnketTempQryOLDVISASHENGEN: TStringField;
    AnketTempQryOLDVISAALLWORLD: TStringField;
    AnketTempQryOLDVISANO: TStringField;
    AnketTempQryOLDVISAFROM: TStringField;
    AnketTempQryOLDVISATILL: TStringField;
    AnketTempQryOLDVISATRAVELOBJECT: TStringField;
    AnketTempQryOLDVISAENTRYCOUNT: TStringField;
    AnketTempQryOLDVISAPERIOD: TStringField;
    AnketTempQryOLDVISACOUNTRY: TStringField;
    AnketTempQryOLDVISAEMBASADDRESS: TStringField;
    AnketTempQryOLDVISAEMBASDATE: TStringField;
    AnketTempQryVISAENTRYCOUNT: TStringField;
    AnketTempQryVISAFROM: TStringField;
    AnketTempQryVISATILL: TStringField;
    AnketTempQryVISAHASMONEYCAST: TStringField;
    AnketTempQryVISAHASMONEYSPONSOR: TStringField;
    AnketTempQryENDVISAFROM: TStringField;
    AnketTempQryENDVISATILL: TStringField;
    AnketTempQryPERMSTAYNO: TStringField;
    AnketTempQryPERMSTAYISSUE: TStringField;
    AnketTempQryPERMSTAYFROM: TStringField;
    AnketTempQryPERMSTAYTILL: TStringField;
    AnketTempQryHOTELTONAME: TStringField;
    AnketTempQryADDRTOFAX: TStringField;
    AnketTempQryADDRTOEMAIL: TStringField;
    AnketTempQryGARANTFAX: TStringField;
    AnketTempQryGARANTEMAIL: TStringField;
    AnketTempQryPERSCONTNAME: TStringField;
    AnketTempQryPERSCONTADDRESS: TStringField;
    AnketTempQryPERSCONTPHONE: TStringField;
    AnketTempQryPERSCONTFAX: TStringField;
    AnketTempQryPERSCONTEMAIL: TStringField;
    AnketTempQryDELIVERYPALCE: TStringField;
    AnketTempQryDELIVERYDATE: TStringField;
    AnketTempQryGROUPBY: TStringField;
    AnketTempQryPASSINSIDEWITH: TSmallintField;
    CompAccountQryNOTUSE: TStringField;
    AnketTempQryOCCUPTRANSSTATELANG: TStringField;
    AnketTempQryOCCUPTRANSENGLLANG: TStringField;
    AnketTempQryADDITPHONE: TStringField;
    ItsDocumVisaListQryBEFOREFILING: TIntegerField;
    ItsDocumVisaListQryBEFOREFILINGPERIOD: TIntegerField;
    ItsDocumVisaListQryCalcBeforeFiling: TStringField;
    ItsDocumVisaListQryBANKWITHOUTSUM: TStringField;
    AnketTempQryBANKSUM: TStringField;
    ItsDocumVisaListQrySAMETYPEDOCID: TIntegerField;
    ItsDocumVisaListQrySETOFDOCUMENT: TIntegerField;
    ItsDocumVisaListQryCalcSameTypeDoc: TStringField;
    ItsDocumVisaListQryFILINGATWORK: TStringField;
    ItsDocumVisaListQryFOROWNERVISA: TSmallintField;
    DriveNoteQry: TADOQuery;
    DriveNoteQryCalcMemo: TStringField;
    DriveNoteQryLEAVINGID: TIntegerField;
    DriveNoteQryDRIVENOTEID: TIntegerField;
    DriveNoteQryMEMO: TMemoField;
    DriveNoteQryDELETED: TStringField;
    DriveNoteQryADDDATE: TDateTimeField;
    DriveNoteQryADDMANAGER: TStringField;
    DriveNoteQryDELDATE: TDateTimeField;
    DriveNoteQryDELMANAGER: TStringField;
    DriveNoteQryDRIVEID: TIntegerField;
    DriveNoteSrc: TDataSource;
    ReklamaQryREKLAMAID: TIntegerField;
    ReklamaQryPRESETTYPE: TSmallintField;
    ReklamaQryPRIORORDER: TSmallintField;
    CompanyQryCalcTaxPayStateId: TIntegerField;
    GridViewRepository: TcxGridViewRepository;
    ViewCompany: TcxGridDBTableView;
    ViewCompanyCOMPANYID: TcxGridDBColumn;
    ViewCompanyISVENDOR: TcxGridDBColumn;
    ViewCompanyCOMPANYNAME: TcxGridDBColumn;
    ViewCompanySORTBYCONTRACT: TcxGridDBColumn;
    ViewCompanyORDERCOUNT: TcxGridDBColumn;
    ViewCompanyLASTDATECRORDER: TcxGridDBColumn;
    ViewCompanyCOMMONNOTEADDDATE: TcxGridDBColumn;
    ViewCompanyPERSCOUNT: TcxGridDBColumn;
    ViewCompanyOBDZVINAGREEDATE: TcxGridDBColumn;
    ViewCompanyAreWeb: TcxGridDBColumn;
    ViewCompanyFIXDEFECTTODATE: TcxGridDBColumn;
    ViewCompanyOBDZVIN: TcxGridDBColumn;
    ViewCompanyISHEADOFFICE: TcxGridDBColumn;
    ViewCompanyNOTWORK: TcxGridDBColumn;
    ViewCompanyAGENCYLOGO: TcxGridDBColumn;
    ViewCompanyDOCTODATE: TcxGridDBColumn;
    ViewCompanyCountry: TcxGridDBTableView;
    ViewCompanyCountryCOUNTRYID: TcxGridDBColumn;
    ViewCompanyCountryNAME: TcxGridDBColumn;
    ViewCompanyCountryLATNAME: TcxGridDBColumn;
    ViewCompanyCity: TcxGridDBTableView;
    ViewCompanyCityID: TcxGridDBColumn;
    ViewCompanyCityNAME: TcxGridDBColumn;
    ViewCompanyCityNAME_ENG: TcxGridDBColumn;
    ViewCompanyCOMPANYTRADENAME: TcxGridDBColumn;
    ViewCompanyISAGENT: TcxGridDBColumn;
    ViewCompanyISCLIENT: TcxGridDBColumn;
    ViewCompanyISTOUROPER: TcxGridDBColumn;
    ViewCompanyASTOURS: TcxGridDBColumn;
    ViewCompanyASNETAGENT: TcxGridDBColumn;
    ViewCompanyASAUPAIR: TcxGridDBColumn;
    ViewCompanyISENTERPR: TcxGridDBColumn;
    ViewCompanyISPRIVATE: TcxGridDBColumn;
    ViewCompanyISBSMAN: TcxGridDBColumn;
    CountryCompQry: TADOQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    CountryCompSrc: TDataSource;
    CityCompanyQry: TADOQuery;
    StringField3: TStringField;
    CityCompanySrc: TDataSource;
    ViewCompanyWORKMANID: TcxGridDBColumn;
    ViewCompanyADDMANID: TcxGridDBColumn;
    ViewCompanyShowNAME: TcxGridDBColumn;
    ViewCompanyTRADENAME: TcxGridDBColumn;
    ViewCompanyName: TcxGridDBColumn;
    CompanyQryCalcDateContract: TStringField;
    ViewCompanyAREAGENTCONTRACT: TcxGridDBColumn;
    ViewCompanySTANDOC: TcxGridDBColumn;
    Repository_EmbassyDocumDlg: TcxGridViewRepository;
    View_EmbassyDocumDlg_DocTypesDBGrid: TcxGridDBTableView;
    View_EmbassyDocumDlg_DocTypesDBGridView_EmbassyDocumDlg_DocTypesDBGridDOCNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_DocTypesDBGridView_EmbassyDocumDlg_DocTypesDBGridSHORTNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGrid: TcxGridDBTableView;
    View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcEmbassyName: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcFundingSum: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcBankSum: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGridCalcOnTourSum: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGrid1: TcxGridDBColumn;
    View_EmbassyDocumDlg_FilingDBGrid: TcxGridDBTableView;
    View_EmbassyDocumDlg_FilingDBGridView_EmbassyDocumDlg_FilingDBGridCalcFieldName: TcxGridDBColumn;
    View_EmbassyDocumDlg_SelPartnerDBGrid: TcxGridDBTableView;
    View_EmbassyDocumDlg_SelPartnerDBGridView_EmbassyDocumDlg_SelPartnerDBGridPARTNERNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_SelPartnerDBGridView_EmbassyDocumDlg_SelPartnerDBGridCalcPayServ: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGrid: TcxGridDBTableView;
    View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcEmbassyName: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcServCost: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcPayBank: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGridCalcReadyToDay: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridView_EmbassyDocumDlg_VisaCenterDBGrid: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGrid: TcxGridDBTableView;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridVIEWNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridTYPENAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcSameTypeDoc: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridNEEDCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcBeforeFiling: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcIssuedMonths: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridBEGINDOC: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcExpireMonths: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcDocForLast: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcAgeRestr: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcMarried: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridPOSADA: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridCalcSum: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridFORIND: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridFORADDMANUAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridTRANSMIT: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridRETURNED: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridGROUPNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridView_EmbassyDocumDlg_UsedDocsDBGridSUBGROUPNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGrid: TcxGridDBTableView;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridDOCNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridTYPENAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcSameTypeDoc: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridNEEDCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGrid: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcIssuedMonths: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridBEGINDOC: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcExpireMonths: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcDocForLast: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcAgeRestr: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcMarried: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridPOSADA: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridCalcSum: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridFORIND: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridFORADDMANUAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridTRANSMIT: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridRETURNED: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridGROUPNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridView_EmbassyDocumDlg_OneTypeDocDBGridSUBGROUPNAME: TcxGridDBColumn;
    ItsDocumVisaListSrc: TDataSource;
    View_EmbassyDocumDlg_UsedDocsDBGridISUSE: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridLINK: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBFILINGATWORK: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridFOROWNERVISA: TcxGridDBColumn;
    CNTREMBAS_INPROVINCE: TADOQuery;
    CNTREMBAS_INPROVINCESrc: TDataSource;
    CNTREMBAS_INPROVINCEID: TIntegerField;
    CNTREMBAS_INPROVINCECNTREMBASSYID: TIntegerField;
    ViewContEmbasInprovince: TcxGridDBTableView;
    ViewContEmbasInprovinceID: TcxGridDBColumn;
    ViewContEmbasInprovinceCNTREMBASSYID: TcxGridDBColumn;
    CNTREMBAS_INPROVINCENAME: TIBStringField;
    ViewContEmbasInprovinceNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridView_EmbassyDocumDlg_EmbassyDBGrid2: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridOUREMBASSY: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridCNTREMBASSYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridCOMPANYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridEMBASSYNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridCityName: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridCOUNTRYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridFOROWNERVISA: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridFUNDINGSUM: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridFUNDINGVAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridFUNDINGCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridFUNDINGPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridBANKSUM: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridBANKVAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridBANKCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridBANKPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridONTOURSUM: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridOURFILING: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridFILINGPLACEWORK: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridVisaDocumentId: TcxGridDBColumn;
    View_EmbassyDocumDlg_DocTypesDBGridDOCID: TcxGridDBColumn;
    View_EmbassyDocumDlg_DocTypesDBGridMEMO: TcxGridDBColumn;
    VisaCenterSrc: TDataSource;
    SelVisaCentersQry: TADOQuery;
    SelVisaCentersQryEMBASSYNAME: TStringField;
    SelVisaCentersQryCOMPANYID: TIntegerField;
    SelVisaCentersQryCntrEmbassyId: TIntegerField;
    SelVisaCentersQryITSKONSUL: TStringField;
    SelVisaCentersQryCOUNTRYID: TIntegerField;
    SelVisaCentersQryFUNDINGSUM: TFloatField;
    SelVisaCentersQryFUNDINGVAL: TSmallintField;
    SelVisaCentersQryFUNDINGCOUNT: TIntegerField;
    SelVisaCentersQryFUNDINGPERIOD: TSmallintField;
    SelVisaCentersQryBANKSUM: TFloatField;
    SelVisaCentersQryBANKVAL: TSmallintField;
    SelVisaCentersQryBANKCOUNT: TIntegerField;
    SelVisaCentersQryBANKPERIOD: TSmallintField;
    SelVisaCentersQryPERMTRANSFDOC: TSmallintField;
    SelVisaCentersQryONTOURSUM: TFloatField;
    SelVisaCentersQryPAYBANKSERV: TFloatField;
    SelVisaCentersQryCURRSERV: TSmallintField;
    SelVisaCentersQryREADYTODAYS: TIntegerField;
    SelVisaCentersQryREADYTOTYPE: TIntegerField;
    SelVisaCentersQryAUTOFILLING: TStringField;
    SelVisaCentersQryUSECODE: TStringField;
    SelVisaCentersQryOURFILING: TStringField;
    SelVisaCentersQryAPPLTYPEDATE: TIntegerField;
    SelVisaCentersQrySERVCOST: TFloatField;
    SelVisaCentersQrySERVCOSTVAL: TSmallintField;
    SelVisaCentersQryPARENTID: TIntegerField;
    SelVisaCentersQryCalcEmbassyName: TStringField;
    SelVisaCentersQryCalcPayBank: TStringField;
    SelVisaCentersQryCalcServCost: TStringField;
    SelVisaCentersQryCITYNAME: TStringField;
    SelVisaCentersQryFILINGPLACEWORK: TStringField;
    SelVisaCentersQryCalcReadyToDay: TStringField;
    SelVisaCentersQryFULLFUNDING: TStringField;
    SelVisaCentersQryTYPEFUNDING: TIntegerField;
    SelVisaCentersQryCOMMENTS: TMemoField;
    View_EmbassyDocumDlg_VisaCenterDBGridEMBASSYNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridCOMPANYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridCntrEmbassyId: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridITSKONSUL: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridCOUNTRYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGSUM: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGVAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridFUNDINGPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridBANKSUM: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridBANKVAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridBANKCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridBANKPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridPERMTRANSFDOC: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridONTOURSUM: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridPAYBANKSERV: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridCURRSERV: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridREADYTODAYS: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridREADYTOTYPE: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridAUTOFILLING: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridUSECODE: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridOURFILING: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridAPPLTYPEDATE: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridSERVCOST: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridSERVCOSTVAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridPARENTID: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridCITYNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridFILINGPLACEWORK: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridFULLFUNDING: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridTYPEFUNDING: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridCOMMENTS: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridColumn1: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridColumn2: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridColumn3: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridColumn4: TcxGridDBColumn;
    View_EmbassyDocumDlg_VisaCenterDBGridColumn5: TcxGridDBColumn;
    SelPartnerSrc: TDataSource;
    View_EmbassyDocumDlg_SelPartnerDBGridPARTNERID: TcxGridDBColumn;
    View_EmbassyDocumDlg_SelPartnerDBGridCURRID: TcxGridDBColumn;
    View_EmbassyDocumDlg_SelPartnerDBGridCOMPANYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_SelPartnerDBGridPAYFORSERV: TcxGridDBColumn;
    View_EmbassyDocumDlg_SelPartnerDBGridCURRENCYSHORT: TcxGridDBColumn;
    SelPartnersQryEMBASSYID: TIntegerField;
    View_EmbassyDocumDlg_SelPartnerDBGridEMBASSYID: TcxGridDBColumn;
    OneTypeDocQry: TADOQuery;
    OneTypeDocQryDOCNAME: TStringField;
    OneTypeDocQryTYPENAME: TStringField;
    OneTypeDocQryISUSE: TStringField;
    OneTypeDocQryNEEDCOUNT: TIntegerField;
    OneTypeDocQryMARRIEDSTATE: TIntegerField;
    OneTypeDocQryAGERESTRICTION: TIntegerField;
    OneTypeDocQryCalcExpireMonths: TStringField;
    OneTypeDocQryCalcIssuedMonths: TStringField;
    OneTypeDocQryCalcAgeRestr: TStringField;
    OneTypeDocQryFORIND: TStringField;
    OneTypeDocQryFORADDMANUAL: TStringField;
    OneTypeDocQryPOSADA: TStringField;
    OneTypeDocQryCalcMarried: TStringField;
    OneTypeDocQryRETURNED: TStringField;
    OneTypeDocQryCalcSum: TStringField;
    OneTypeDocQryTRANSMIT: TStringField;
    OneTypeDocQryBEGINDOC: TStringField;
    OneTypeDocQryDOCFORLASTCOUNT: TIntegerField;
    OneTypeDocQryDOCFORLASTPERIOD: TIntegerField;
    OneTypeDocQryCalcDocForLast: TStringField;
    OneTypeDocQryGROUPNAME: TStringField;
    OneTypeDocQryEXPIREMONTHS: TIntegerField;
    OneTypeDocQryISSUEDMONTHS: TIntegerField;
    OneTypeDocQryEXPIREPERIOD: TIntegerField;
    OneTypeDocQryISSUESPERIOD: TIntegerField;
    OneTypeDocQryFUNDING: TStringField;
    OneTypeDocQrySHORTNAME: TStringField;
    OneTypeDocQrySUBGROUPNAME: TStringField;
    OneTypeDocQryDOCID: TIntegerField;
    OneTypeDocQrySETOFDOCUMENT: TIntegerField;
    OneTypeDocQrySAMETYPEDOCID: TIntegerField;
    OneTypeDocQryCalcSameTypeDoc: TStringField;
    OneTypeDocSrc: TDataSource;
    OneTypeDocQryVISADOCUMENTID: TIntegerField;
    View_EmbassyDocumDlg_OneTypeDocDBGridISUSE: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridMARRIEDSTATE: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridAGERESTRICTION: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridDOCFORLASTCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridDOCFORLASTPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridEXPIREMONTHS: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridISSUEDMONTHS: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridEXPIREPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridISSUESPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridSUMMA: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridFUNDING: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridSHORTNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridDOCID: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridSETOFDOCUMENT: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridSAMETYPEDOCID: TcxGridDBColumn;
    View_EmbassyDocumDlg_OneTypeDocDBGridVISADOCUMENTID: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridPERMTRANSFDOC: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridPAYBANKSERV: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridREADYTODAYS: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridAUTOFILLING: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridUSECODE: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridTYPEFUNDING: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridREADYTOTYPE: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridAPPLTYPEDATE: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridSERVCOST: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridSERVCOSTVAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridCURRSERV: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridCOMMENTS: TcxGridDBColumn;
    View_EmbassyDocumDlg_EmbassyDBGridINPROVINCE: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridDOCID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridAGERESTRICTION: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridEXPIREMONTHS: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridISSUEDMONTHS: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridSUMMA: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridTYPEID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridSHORTNAME: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridEXPIREPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridISSUESPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridTYPEVAL: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridTYPEDOCID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridCOMMENTS: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridMARRIEDSTATE: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridFUNDING: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridPOSADAID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridFUNDINGCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridVisaDocGroupId: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridDOCFORLASTCOUNT: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridDOCFORLASTPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridONETYPEDOC: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridEMBASSYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridSUBGROUPID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridCOUNTRYID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridBEFOREFILING: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridBEFOREFILINGPERIOD: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridBANKWITHOUTSUM: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridSAMETYPEDOCID: TcxGridDBColumn;
    View_EmbassyDocumDlg_UsedDocsDBGridSETOFDOCUMENT: TcxGridDBColumn;
    ADOConnection_: TADOConnection;
    AnketTempSrc: TDataSource;
    MemDataAddresHistory: TdxMemData;
    MemDataAddresHistoryID: TIntegerField;
    MemDataAddresHistoryKindStreet: TIntegerField;
    MemDataAddresHistoryStreetName: TStringField;
    MemDataAddresHistoryBuilding: TStringField;
    MemDataAddresHistoryOffice: TStringField;
    MemDataAddresHistoryCityId: TIntegerField;
    MemDataAddresHistoryProvinceId: TIntegerField;
    NotesQry: TADOQuery;
    NotesSrc: TDataSource;
    NotesQryCOMPANYID: TIntegerField;
    NotesQryCOMPNOTEID: TIntegerField;
    NotesQryMEMO: TMemoField;
    NotesQryDELETED: TStringField;
    NotesQryADDDATE: TDateTimeField;
    NotesQryADDMANID: TIntegerField;
    NotesQryDELDATE: TDateTimeField;
    NotesQryDELMANID: TIntegerField;
    NotesQryTYPENOTE: TIntegerField;
    NotesQryCATEGORYNOTE: TSmallintField;
    NotesQryNDATE: TDateTimeField;
    NotesQryREPORTDATE: TDateTimeField;
    NotesQryREPORTSENDPR: TStringField;
    NotesQryREPORTSENDBOSS: TStringField;
    COMPANIES_PARAM_DATA: TADOQuery;
    COMPANIES_PARAM_DATASrc: TDataSource;
    SelTradeNameSrc: TDataSource;
    SelTradeNameQry: TADOQuery;
    SelTradeNameQryTRADENAMEID: TIntegerField;
    SelTradeNameQryTRADENAME: TStringField;
    SelTradeNameQryAGENCYLOGO: TStringField;
    SelTradeNameQryPEYMTOAGENCY: TStringField;
    SelTradeNameQryISNETAGENCY: TStringField;
    SelTradeNameQryEMAILID: TIntegerField;
    SelTradeNameQryNOINCLUDEAGENTTOBILL: TStringField;
    SelCompanyByTradeNameQry: TADOQuery;
    SelCompanyByTradeNameSrc: TDataSource;
    SelCompanyByTradeNameQryCOMPANYID: TIntegerField;
    SelCompanyByTradeNameQryCOMPANYNAME: TStringField;
    SelCompanyByTradeNameQryISHEADOFFICE: TStringField;
    ViewSelTradeName: TcxGridDBTableView;
    ViewSelTradeNameTRADENAMEID: TcxGridDBColumn;
    ViewSelTradeNameTRADENAME: TcxGridDBColumn;
    ViewSelTradeNameAGENCYLOGO: TcxGridDBColumn;
    ViewSelTradeNamePEYMTOAGENCY: TcxGridDBColumn;
    ViewSelTradeNameISNETAGENCY: TcxGridDBColumn;
    ViewSelTradeNameEMAILID: TcxGridDBColumn;
    ViewSelTradeNameNOINCLUDEAGENTTOBILL: TcxGridDBColumn;
    ViewSelCompanyByTradeName: TcxGridDBTableView;
    ViewSelCompanyByTradeNameCOMPANYID: TcxGridDBColumn;
    ViewSelCompanyByTradeNameCOMPANYNAME: TcxGridDBColumn;
    ViewSelCompanyByTradeNameISHEADOFFICE: TcxGridDBColumn;
    ViewSelTradeNameList: TcxGridDBTableView;
    ViewSelTradeNameListTRADENAMEID: TcxGridDBColumn;
    ViewSelTradeNameListTRADENAME: TcxGridDBColumn;
    SelHeadDataQry: TADOQuery;
    SelHeadDataQryTAXPAYSTATEID: TIntegerField;
    SelHeadDataQryTAXDETAILID: TIntegerField;
    SelHeadDataQrySINGLETAXTYPEID: TIntegerField;
    SelHeadDataQrySINGLETAXDATE: TDateTimeField;
    SelHeadDataQryTAXPAYCODE: TStringField;
    SelHeadDataQryTAXPAYTYPEID: TIntegerField;
    SelHeadDataQryTAXPAYREGDATE: TDateTimeField;
    SelHeadDataQryWARRANTYSUM: TFloatField;
    SelHeadDataQryWARRANTYTERM: TDateTimeField;
    SelHeadDataQryLICENSEDATE: TDateTimeField;
    SelHeadDataQryLICENSENO: TStringField;
    SelHeadDataQryWARRANTYVAL: TIntegerField;
    SelHeadDataQryLICENSETERMIN: TStringField;
    SelHeadDataQryNAME: TStringField;
    SelHeadDataQryTRADENAMEID: TIntegerField;
    ExistCompQry: TADOQuery;
    ExistCompSrc: TDataSource;
    ExistOfficeQry: TADOQuery;
    ExistOfficeQrySrc: TDataSource;
    ViewExistsCompany: TcxGridDBTableView;
    ExistOfficeQryOFFICEID: TIntegerField;
    ExistOfficeQryISDEFAULT: TStringField;
    ExistOfficeQryADDRESS: TStringField;
    ExistOfficeQryCOUNTRY: TStringField;
    ViewExistsCompanyCOMPANYID: TcxGridDBColumn;
    ViewExistsCompanyTRADENAME: TcxGridDBColumn;
    ViewExistsCompanyNAME: TcxGridDBColumn;
    ViewExistsCompanyCOMPKIND: TcxGridDBColumn;
    ExistCompQryCalcName: TStringField;
    ViewExistsCompanyCalcName: TcxGridDBColumn;
    ViewExistsCompanyOffice: TcxGridDBTableView;
    ViewExistsCompanyOfficeOFFICEID: TcxGridDBColumn;
    ViewExistsCompanyOfficeISDEFAULT: TcxGridDBColumn;
    ViewExistsCompanyOfficeHOUSE: TcxGridDBColumn;
    ViewExistsCompanyOfficeTENEMENT: TcxGridDBColumn;
    ViewExistsCompanyOfficeADDRESS: TcxGridDBColumn;
    ViewExistsCompanyOfficeZIPCODE: TcxGridDBColumn;
    ViewExistsCompanyOfficeCOUNTRY: TcxGridDBColumn;
    CompanyNotesSrc: TDataSource;
    ViewCompNotesBlackListVip: TcxGridDBTableView;
    ViewCompNotesBlackListVipCOMPANYID: TcxGridDBColumn;
    ViewCompNotesBlackListVipCOMPANYNOTEID: TcxGridDBColumn;
    ViewCompNotesBlackListVipMEMO: TcxGridDBColumn;
    ViewCompNotesBlackListVipADDDATE: TcxGridDBColumn;
    ViewCompNotesBlackListVipADDMANAGER: TcxGridDBColumn;
    ViewCompNotesBlackListVipVIP: TcxGridDBColumn;
    ViewCompNotesBlackListVipBLACKLIST: TcxGridDBColumn;
    ViewCompNotesBlackListVipCalcStatusNote: TcxGridDBColumn;
    CompanyNotesQry: TADOQuery;
    CompanyNotesQryCOMPANYID: TIntegerField;
    CompanyNotesQryCOMPANYNOTEID: TIntegerField;
    CompanyNotesQryMEMO: TMemoField;
    CompanyNotesQryADDDATE: TDateTimeField;
    CompanyNotesQryADDMANAGER: TStringField;
    CompanyNotesQryVIP: TStringField;
    CompanyNotesQryBLACKLIST: TStringField;
    CompanyNotesQryCalcStatusNote: TStringField;
    SelTaxSystemQryTAXSYSTEMID: TIntegerField;
    SelTaxSystemQryTAXNAME: TStringField;
    SelTaxSystemQryPAYER: TSmallintField;
    SelTaxSystemQryCOMMENTS: TMemoField;
    SelTaxSystemQryINCOMETAXABS: TFloatField;
    SelTaxSystemQryINCOMETAXVAL: TFloatField;
    SelTaxSystemQryPDVSUM: TFloatField;
    SelTaxSystemQrySINGLETAX: TStringField;
    SelTaxSystemQryTAXDETAILID: TIntegerField;
    SelTaxSystemQryCalcNameTax: TStringField;
    SelTaxSystemQryCalcIncomTax: TStringField;
    ViewSelTaxSystemList: TcxGridDBTableView;
    SelTaxSystemSrc: TDataSource;
    ViewSelTaxSystemListTAXSYSTEMID: TcxGridDBColumn;
    ViewSelTaxSystemListTAXNAME: TcxGridDBColumn;
    ViewSelTaxSystemListPAYER: TcxGridDBColumn;
    ViewSelTaxSystemListCOMMENTS: TcxGridDBColumn;
    ViewSelTaxSystemListINCOMETAXABS: TcxGridDBColumn;
    ViewSelTaxSystemListINCOMETAXVAL: TcxGridDBColumn;
    ViewSelTaxSystemListPDVSUM: TcxGridDBColumn;
    ViewSelTaxSystemListSINGLETAX: TcxGridDBColumn;
    ViewSelTaxSystemListTAXDETAILID: TcxGridDBColumn;
    ViewSelTaxSystemListCalcNameTax: TcxGridDBColumn;
    ViewSelTaxSystemListCalcIncomTax: TcxGridDBColumn;
    ImportLogQry: TADOQuery;
    ImportLogSrc: TDataSource;
    ViewImportLog: TcxGridDBTableView;
    ImportLogQryLOGID: TIntegerField;
    ImportLogQryHOTELID: TIntegerField;
    ImportLogQryMANAGERID: TIntegerField;
    ImportLogQryIMPORTDATE: TDateTimeField;
    ImportLogQryWEBSITE: TStringField;
    ImportLogQryMANAGER: TStringField;
    ViewImportLogLOGID: TcxGridDBColumn;
    ViewImportLogHOTELID: TcxGridDBColumn;
    ViewImportLogMANAGERID: TcxGridDBColumn;
    ViewImportLogIMPORTDATE: TcxGridDBColumn;
    ViewImportLogWEBSITE: TcxGridDBColumn;
    ViewImportLogMANAGER: TcxGridDBColumn;
    ViewDrvVendor: TcxGridDBTableView;
    ViewDrvVendorDRIVEID: TcxGridDBColumn;
    ViewDrvVendorDRIVEVENDORID: TcxGridDBColumn;
    ViewDrvVendorCOMPANYID: TcxGridDBColumn;
    ViewDrvVendorNAME: TcxGridDBColumn;
    ViewBrDrive: TcxGridDBTableView;
    ViewBrDriveDRIVEKIND: TcxGridDBColumn;
    ViewBrDriveDRIVEID: TcxGridDBColumn;
    ViewBrDriveMODEL: TcxGridDBColumn;
    ViewBrDrivePLACECOUNT: TcxGridDBColumn;
    ViewBrDriveFLOORS: TcxGridDBColumn;
    ViewBrDrivePLACEMAPNO: TcxGridDBColumn;
    ViewBrDriveMEMO: TcxGridDBColumn;
    ViewBrDriveDRIVENO: TcxGridDBColumn;
    ViewBrDriveISPROTO: TcxGridDBColumn;
    ViewBrDriveREGCOUNTRY: TcxGridDBColumn;
    ViewBrDriveADDMANID: TcxGridDBColumn;
    ViewBrDriveYEARBUS: TcxGridDBColumn;
    ViewBrDriveEUROCLASS: TcxGridDBColumn;
    ViewBrDriveDISABLED: TcxGridDBColumn;
    ViewDriveNoteQry: TcxGridDBTableView;
    ViewDriveNoteQryCalcMemo: TcxGridDBColumn;
    ViewDriveNoteQryLEAVINGID: TcxGridDBColumn;
    ViewDriveNoteQryDRIVENOTEID: TcxGridDBColumn;
    ViewDriveNoteQryMEMO: TcxGridDBColumn;
    ViewDriveNoteQryDELETED: TcxGridDBColumn;
    ViewDriveNoteQryADDDATE: TcxGridDBColumn;
    ViewDriveNoteQryADDMANAGER: TcxGridDBColumn;
    ViewDriveNoteQryDELDATE: TcxGridDBColumn;
    ViewDriveNoteQryDELMANAGER: TcxGridDBColumn;
    ViewDriveNoteQryDRIVEID: TcxGridDBColumn;
    BrDriveSrc: TDataSource;
    BrDriveQry: TADOQuery;
    BrDriveQryDRIVEKIND: TIntegerField;
    BrDriveQryDRIVEID: TIntegerField;
    BrDriveQryMODEL: TStringField;
    BrDriveQryPLACECOUNT: TSmallintField;
    BrDriveQryFLOORS: TSmallintField;
    BrDriveQryPLACEMAPNO: TSmallintField;
    BrDriveQryMEMO: TMemoField;
    BrDriveQryKIND: TStringField;
    BrDriveQryDRIVENO: TStringField;
    BrDriveQryISPROTO: TStringField;
    BrDriveQryREGCOUNTRY: TIntegerField;
    BrDriveQryADDMANID: TIntegerField;
    BrDriveQryYEARBUS: TIntegerField;
    BrDriveQryEUROCLASS: TIntegerField;
    BrDriveQryCLASSNAME: TStringField;
    BrDriveQryDISABLED: TStringField;
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
    DictSectQry: TADOQuery;
    DictSectQryDICTSECTIONID: TIntegerField;
    DictSectQrySECTIONNAME: TIBStringField;
    DictSectQryCOMMENTS: TMemoField;
    DictSectQrySMALLICON: TBlobField;
    DictSectQryLARGEICON: TBlobField;
    DictSectSrc: TDataSource;
    DictSect_ItemQry: TADOQuery;
    DictSect_ItemQryITEMID: TIntegerField;
    DictSect_ItemQryITEMNAME: TIBStringField;
    DictSect_ItemQryCOMMENTS: TMemoField;
    DictSect_ItemQryDICTSECTIONID: TIntegerField;
    DictSect_ItemQryLARGEICON: TBlobField;
    DictSect_ItemQrySMALLICON: TBlobField;
    DictSect_ItemSrc: TDataSource;
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
    DrvVendorQryCOMPIDFORCNTRCT: TIntegerField;
    ViewDrvVendorCOMPIDFORCNTRCT: TcxGridDBColumn;
    DrvVendorQryISPRIVATE: TIntegerField;
    ViewDrvVendorISPRIVATE: TcxGridDBColumn;
    ViewDrvVendorISVENDOR: TcxGridDBColumn;
    ViewDrvVendorISENTERPR: TcxGridDBColumn;
    ViewSelectVendorList: TcxGridDBTableView;
    ViewSelectVendorListCOMPANYID: TcxGridDBColumn;
    ViewSelectVendorListNAME: TcxGridDBColumn;
    ViewSelectVendorListISPRIVATE: TcxGridDBColumn;
    ViewSelectVendorListISVENDOR: TcxGridDBColumn;
    DrvSrvLnkSrc: TDataSource;
    ViewDrvSrvLnkList: TcxGridDBTableView;
    ViewDrvSrvLnkListDRIVEID: TcxGridDBColumn;
    ViewDrvSrvLnkListLINKID: TcxGridDBColumn;
    ViewDrvSrvLnkListSERVICEID: TcxGridDBColumn;
    ViewDrvSrvLnkListHAVEVALUE: TcxGridDBColumn;
    ViewDrvSrvLnkListINTVALUE: TcxGridDBColumn;
    ViewDrvSrvLnkListMEASUREUNIT: TcxGridDBColumn;
    ViewDrvSrvLnkListHAVECOST: TcxGridDBColumn;
    ViewDrvSrvLnkListCOST: TcxGridDBColumn;
    ViewDrvSrvLnkListCURRID: TcxGridDBColumn;
    ViewDrvSrvLnkListCOMMENTS: TcxGridDBColumn;
    ViewDrvSrvLnkListNAME: TcxGridDBColumn;
    ViewDrvSrvLnkListLARGEICON: TcxGridDBColumn;
    ViewDrvSrvLnkListSMALLICON: TcxGridDBColumn;
    ViewDrvSrvLnkListCURRENCYSHORT: TcxGridDBColumn;
    ViewDrvSrvLnkListCalcValue: TcxGridDBColumn;
    ViewDrvSrvLnkListCalcCost: TcxGridDBColumn;
    ViewDrvSrvLnkListCalcHaveCost: TcxGridDBColumn;
    ViewDrvSrvLnkListCalcMemo: TcxGridDBColumn;
    DrvSrvLnkQryCalcPrice: TStringField;
    ViewDrvSrvLnkListCalcPrice: TcxGridDBColumn;
    SelCountryObjectLinksQry: TADOQuery;
    SelCountryObjectLinksSrc: TDataSource;
    SelCountryObjectLinksQryCOUNTRYID: TIntegerField;
    SelCountryObjectLinksQryCOUNTRINAME: TStringField;
    VisaDocumentsSrc: TDataSource;
    CompContractNumsQry: TADOQuery;
    CompContractNumsSrc: TDataSource;
    SelCntrTemplQry: TADOQuery;
    SelCntrTemplSrc: TDataSource;
    CompContractNumsQryCOMPCONTRACTNUMID: TIntegerField;
    CompContractNumsQryCONTRACTDATE: TDateTimeField;
    CompContractNumsQryCONTRACTNUM: TIntegerField;
    InterestQryID_CITY_ADM_UNIT: TIntegerField;
    CityCompanyQryID: TIntegerField;
    CountryCompQryLATNAME: TStringField;
    CityCompanyQryNAME_ENG: TStringField;
    ViewCOMPANIES_PARAM_DATAList: TcxGridDBTableView;
    ViewCOMPANIES_PARAM_DATAListID: TcxGridDBColumn;
    ViewCOMPANIES_PARAM_DATAListID_COMPANIES: TcxGridDBColumn;
    ViewCOMPANIES_PARAM_DATAListID_COMPANIES_PARAM_NAME: TcxGridDBColumn;
    ViewCOMPANIES_PARAM_DATAListAVALUE: TcxGridDBColumn;
    COMPANIES_PARAM_DATAID: TIntegerField;
    COMPANIES_PARAM_DATAID_COMPANIES: TIntegerField;
    COMPANIES_PARAM_DATAID_COMPANIES_PARAM_NAME: TIntegerField;
    COMPANIES_PARAM_DATAAVALUE: TIntegerField;
    COMPANIES_PARAM_DATANAME: TStringField;
    ViewCOMPANIES_PARAM_DATAListNAME: TcxGridDBColumn;
    COMPANIES_PARAM_DATAATYPE: TIntegerField;
    ViewCOMPANIES_PARAM_DATAListATYPE: TcxGridDBColumn;
    CompEnterpriseHoteQry: TADOQuery;
    CompEnterpriseHoteSrc: TDataSource;
    CompEnterpriseHoteQryCOMPANYID: TIntegerField;
    CompEnterpriseHoteQryISVENDOR: TStringField;
    CompEnterpriseHoteQryISCLIENT: TStringField;
    CompEnterpriseHoteQryCLASSCODE: TStringField;
    CompEnterpriseHoteQryTAXPAYCODE: TStringField;
    CompEnterpriseHoteQryASDRIVE: TStringField;
    CompEnterpriseHoteQryASHOTEL: TStringField;
    CompEnterpriseHoteQryASVISAS: TStringField;
    CompEnterpriseHoteQryASINSUR: TStringField;
    CompEnterpriseHoteQryASEXCRS: TStringField;
    CompEnterpriseHoteQryASREKLM: TStringField;
    CompEnterpriseHoteQryASOTHER: TStringField;
    CompEnterpriseHoteQryLICENSENO: TStringField;
    CompEnterpriseHoteQryMEMO: TMemoField;
    CompEnterpriseHoteQryASTICKT: TStringField;
    CompEnterpriseHoteQryASTOURS: TStringField;
    CompEnterpriseHoteQryISOTHER: TStringField;
    CompEnterpriseHoteQryISENTERPR: TStringField;
    CompEnterpriseHoteQryISPRIVATE: TStringField;
    CompEnterpriseHoteQryIDENTCODE: TStringField;
    CompEnterpriseHoteQryASSCOLL: TStringField;
    CompEnterpriseHoteQryASAPAIR: TStringField;
    CompEnterpriseHoteQryASEMPLS: TStringField;
    CompEnterpriseHoteQryISAGENT: TStringField;
    CompEnterpriseHoteQryISPROPS: TStringField;
    CompEnterpriseHoteQryISGOVERN: TStringField;
    CompEnterpriseHoteQryISBUDGET: TStringField;
    CompEnterpriseHoteQryISPOTENT: TStringField;
    CompEnterpriseHoteQryASFOODS: TStringField;
    CompEnterpriseHoteQryASURIST: TStringField;
    CompEnterpriseHoteQryASMEDIC: TStringField;
    CompEnterpriseHoteQryISHOTEL: TStringField;
    CompEnterpriseHoteQryASRECRE: TStringField;
    CompEnterpriseHoteQryASEXTRM: TStringField;
    CompEnterpriseHoteQryFORWORK: TStringField;
    CompEnterpriseHoteQryASMUSEM: TStringField;
    CompEnterpriseHoteQryASXHIBT: TStringField;
    CompEnterpriseHoteQryASAMBAS: TStringField;
    CompEnterpriseHoteQryASCOMMC: TStringField;
    CompEnterpriseHoteQryASCMPTR: TStringField;
    CompEnterpriseHoteQryASSTNRY: TStringField;
    CompEnterpriseHoteQryASFURNT: TStringField;
    CompEnterpriseHoteQryASGOODS: TStringField;
    CompEnterpriseHoteQryASPETRL: TStringField;
    CompEnterpriseHoteQryASMEDIA: TStringField;
    CompEnterpriseHoteQryASCONSL: TStringField;
    CompEnterpriseHoteQryASGUARD: TStringField;
    CompEnterpriseHoteQryASBANKS: TStringField;
    CompEnterpriseHoteQryASLEASE: TStringField;
    CompEnterpriseHoteQryASKOMUN: TStringField;
    CompEnterpriseHoteQryASBUILD: TStringField;
    CompEnterpriseHoteQryASMASTR: TStringField;
    CompEnterpriseHoteQryISBSMAN: TStringField;
    CompEnterpriseHoteQryADDMANID: TIntegerField;
    CompEnterpriseHoteQryNAME: TStringField;
    CompEnterpriseHoteQryCOMPKIND: TStringField;
    CompEnterpriseHoteQryMEETINGPLACE: TIntegerField;
    CompEnterpriseHoteQryVCARDNO: TIntegerField;
    CompEnterpriseHoteQryASPARSL: TStringField;
    CompEnterpriseHoteQryASGUIDE: TStringField;
    CompEnterpriseHoteQryFULLNAME: TMemoField;
    CompEnterpriseHoteQryORGFORMID: TIntegerField;
    CompEnterpriseHoteQryTAXPAY: TStringField;
    CompEnterpriseHoteQryTAXPAYREGDATE: TDateTimeField;
    CompEnterpriseHoteQryPRIVATEID: TIntegerField;
    CompEnterpriseHoteQryBUS01: TStringField;
    CompEnterpriseHoteQryBUS02: TStringField;
    CompEnterpriseHoteQryBUS03: TStringField;
    CompEnterpriseHoteQryBUS04: TStringField;
    CompEnterpriseHoteQryBUS05: TStringField;
    CompEnterpriseHoteQryBUS06: TStringField;
    CompEnterpriseHoteQryBUS07: TStringField;
    CompEnterpriseHoteQryBUS08: TStringField;
    CompEnterpriseHoteQryBUS09: TStringField;
    CompEnterpriseHoteQryBUS10: TStringField;
    CompEnterpriseHoteQryBUS11: TStringField;
    CompEnterpriseHoteQryBUS12: TStringField;
    CompEnterpriseHoteQryBUS13: TStringField;
    CompEnterpriseHoteQryBUS14: TStringField;
    CompEnterpriseHoteQryBUS15: TStringField;
    CompEnterpriseHoteQryBUS16: TStringField;
    CompEnterpriseHoteQryBUS17: TStringField;
    CompEnterpriseHoteQryBUS18: TStringField;
    CompEnterpriseHoteQryBUS19: TStringField;
    CompEnterpriseHoteQryASPARSE: TStringField;
    CompEnterpriseHoteQryTAXPAYSTATEID: TIntegerField;
    CompEnterpriseHoteQryNEWTAXPAYREGNO: TStringField;
    CompEnterpriseHoteQryTAXPAYREGNO: TStringField;
    CompEnterpriseHoteQryAGENTINFO1: TStringField;
    CompEnterpriseHoteQryAGENTINFO2: TStringField;
    CompEnterpriseHoteQryADDDATE: TDateTimeField;
    CompEnterpriseHoteQryWORKINGHOURS: TStringField;
    CompEnterpriseHoteQryRECEPTIONHOURS: TStringField;
    CompEnterpriseHoteQryLICENSEDATE: TDateTimeField;
    CompEnterpriseHoteQrySEMINAR: TStringField;
    CompEnterpriseHoteQryDATEOBDZVIN: TDateTimeField;
    CompEnterpriseHoteQryMANOBDZVIN: TIntegerField;
    CompEnterpriseHoteQryWARRANTYSUM: TFloatField;
    CompEnterpriseHoteQryWARRANTYVAL: TIntegerField;
    CompEnterpriseHoteQryWARRANTYTERM: TDateTimeField;
    CompEnterpriseHoteQryISTOUROPER: TStringField;
    CompEnterpriseHoteQryTRADENAMEID: TIntegerField;
    CompEnterpriseHoteQryVIPCLIENT: TStringField;
    CompEnterpriseHoteQryBLACKLIST: TStringField;
    CompEnterpriseHoteQryLICENSETERMIN: TStringField;
    CompEnterpriseHoteQryACTIONID: TIntegerField;
    CompEnterpriseHoteQryTAXPAYTYPEID: TIntegerField;
    CompEnterpriseHoteQrySINGLETAXTYPEID: TIntegerField;
    CompEnterpriseHoteQrySINGLETAXREGNO: TStringField;
    CompEnterpriseHoteQrySINGLETAXDATE: TDateTimeField;
    CompEnterpriseHoteQryGOVREESTRTYPEID: TIntegerField;
    CompEnterpriseHoteQryGOVREESTRDATE: TDateTimeField;
    CompEnterpriseHoteQryOBDZVIN: TSmallintField;
    CompEnterpriseHoteQryOBDZVINAGREEDATE: TDateTimeField;
    CompEnterpriseHoteQryWORKMANID: TIntegerField;
    CompEnterpriseHoteQryASNETAGENT: TStringField;
    CompEnterpriseHoteQryARENEWCONTRACT: TStringField;
    CompEnterpriseHoteQryPERMEXTRAAGENT: TStringField;
    CompEnterpriseHoteQryDOCTODATE: TDateTimeField;
    CompEnterpriseHoteQryFIXDEFECTTODATE: TDateTimeField;
    CompEnterpriseHoteQrySTANDOC: TIntegerField;
    CompEnterpriseHoteQryASAUPAIR: TStringField;
    CompEnterpriseHoteQryISFILIYA: TStringField;
    CompEnterpriseHoteQryHEADOFFICEID: TIntegerField;
    CompEnterpriseHoteQryISHEADOFFICE: TStringField;
    CompEnterpriseHoteQryNOTWORK: TStringField;
    CompEnterpriseHoteQryNOTWORKMANID: TIntegerField;
    CompEnterpriseHoteQryNOTWORKDATE: TDateTimeField;
    CompEnterpriseHoteQryORGFORMINNAME: TStringField;
    CompEnterpriseHoteQryWASDELETED: TStringField;
    CompEnterpriseHoteQryASRESIDENT: TStringField;
    CompEnterpriseHoteQryCODEID1C: TStringField;
    CompEnterpriseHoteQryFILIYACODE: TStringField;
    CompEnterpriseHoteQryHOTELID: TIntegerField;
    CompEnterpriseHoteQryCOMPIDFORCNTRCT: TIntegerField;
    BrDriveQryLookDriveKind: TStringField;
    VisaDocGroupsQry: TADOQuery;
    VisaDocGroupsQryVISADOCGROUPID: TIntegerField;
    VisaDocGroupsQrySORTORDER: TIntegerField;
    VisaDocGroupsQryGROUPNAME: TStringField;
    VisaDocGroupsQryINTVALUE: TIntegerField;
    VisaDocSubGroupsQry: TADOQuery;
    VisaDocumentsQry: TADOQuery;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    View_EmbassyDocumDlg_DocTypesDBGridORDERINCATEGORY: TcxGridDBColumn;
    View_EmbassyDocumDlg_DocTypesDBGridONETYPEDOC: TcxGridDBColumn;
    View_EmbassyDocumDlg_DocTypesDBGridCNTLINK: TcxGridDBColumn;
    DrvVendorQryALLDATAFILL: TIntegerField;
    DrvVendorQryISVENDOR: TStringField;
    DrvVendorQryISENTERPR: TStringField;
    DrvVendorQryACTIONID: TIntegerField;
    DrvVendorQryGOVREESTRTYPEID: TIntegerField;
    DrvVendorQryIDENTCODE: TStringField;
    DrvVendorQryGOVREESTRDATE: TDateTimeField;
    ViewDrvVendorALLDATAFILL: TcxGridDBColumn;
    ViewDrvVendorACTIONID: TcxGridDBColumn;
    ViewDrvVendorGOVREESTRTYPEID: TcxGridDBColumn;
    ViewDrvVendorIDENTCODE: TcxGridDBColumn;
    ViewDrvVendorGOVREESTRDATE: TcxGridDBColumn;
    DrvVendorQryASRESIDENT: TStringField;
    ViewDrvVendorASRESIDENT: TcxGridDBColumn;
    VendorTourQry: TADOQuery;
    SelContractQry: TADOQuery;
    CntrTemplQry: TADOQuery;
    VendorTourQryCOMPANYID: TIntegerField;
    VendorTourQryNAME: TStringField;
    VendorTourQryID: TIntegerField;
    VendorTourQryCONTRACTPATH: TStringField;
    VendorTourSrc: TDataSource;
    SelContractQryID: TIntegerField;
    SelContractQryNAME: TStringField;
    SelContractQrySHORTNAME: TStringField;
    SelContractQryTEMPLATS: TMemoField;
    SelContractQryDAYCOUNT: TIntegerField;
    SelContractQryCalcActualDate: TDateTimeField;
    SelContractQryCalcShablon: TStringField;
    SelContracSrc: TDataSource;
    CntrTemplSrc: TDataSource;
    GridRepositoryContractTemplate: TcxGridViewRepository;
    ViewVendorTour: TcxGridDBTableView;
    ViewVendorTourCOMPANYID: TcxGridDBColumn;
    ViewVendorTourID: TcxGridDBColumn;
    ViewVendorTourNAME: TcxGridDBColumn;
    ViewVendorTourcontractpath: TcxGridDBColumn;
    ViewSelContractQry: TcxGridDBTableView;
    ViewSelContractQryCONTRACTNAME: TcxGridDBColumn;
    ViewSelContractQryCalcActualDate: TcxGridDBColumn;
    ViewSelContractQryCalcShablon: TcxGridDBColumn;
    ViewSelContractQryTEMPLATS: TcxGridDBColumn;
    ViewSelContractQryDAYCOUNT: TcxGridDBColumn;
    ViewSelContractQrySHORTNAME: TcxGridDBColumn;
    ViewSelContractQryID: TcxGridDBColumn;
    ViewCntrTemplQry: TcxGridDBTableView;
    ViewCntrTemplQryFIELD_NAME: TcxGridDBColumn;
    ViewCntrTemplQryDESCRIPT: TcxGridDBColumn;
    ViewCntrTemplQryTABLE_NAME: TcxGridDBColumn;
    ViewCntrTemplQryANUMBER: TcxGridDBColumn;
    ViewSelCntrTemplQry: TcxGridDBTableView;
    ViewSelCntrTemplQrySOURCETABLE: TcxGridDBColumn;
    ViewSelCntrTemplQryDESCRIPT: TcxGridDBColumn;
    ViewSelCntrTemplQryBOOKMARK: TcxGridDBColumn;
    ViewSelCntrTemplQryUSECOUNT: TcxGridDBColumn;
    ViewSelCntrTemplQryCONTRACTTEMPLATEID: TcxGridDBColumn;
    ViewSelCntrTemplQryCONTRACTID: TcxGridDBColumn;
    ViewSelCntrTemplQryREQUIREDFIELD: TcxGridDBColumn;
    ViewSelCntrTemplQryNOTUSE: TcxGridDBColumn;
    CntrTemplQryFIELD_NAME: TStringField;
    CntrTemplQryDESCRIPT: TMemoField;
    CntrTemplQryTABLE_NAME: TStringField;
    CntrTemplQryANUMBER: TIntegerField;
    SelCntrTemplQryCONTRACTTEMPLATEID: TIntegerField;
    SelCntrTemplQryCONTRACTID: TIntegerField;
    SelCntrTemplQryREQUIREDFIELD: TStringField;
    SelCntrTemplQryBOOKMARK: TStringField;
    SelCntrTemplQryDESCRIPT: TMemoField;
    SelCntrTemplQrySOURCETABLE: TStringField;
    SelCntrTemplQryUSECOUNT: TSmallintField;
    VendorTourContractQry: TADOQuery;
    VendorTourContractQryID: TIntegerField;
    VendorTourContractQryVENDORID: TIntegerField;
    VendorTourContractQryCONTRACTPATH: TStringField;
    DictSectQryKEYNAME: TStringField;
    DictSect_ItemQryKEYNAME: TStringField;
    ViewDictSectionSMALLICON: TcxGridDBColumn;
    ViewDictSectionLARGEICON: TcxGridDBColumn;
    ViewDictSectionKEYNAME: TcxGridDBColumn;
    ViewDictSectionItemLARGEICON: TcxGridDBColumn;
    ViewDictSectionItemSMALLICON: TcxGridDBColumn;
    ViewDictSectionItemKEYNAME: TcxGridDBColumn;
    DrvVendorQryVENDORID: TIntegerField;
    ViewDrvVendorVENDORID: TcxGridDBColumn;
    PopupMenuCopyNameHotel: TPopupMenu;
    N1: TMenuItem;
    CompanyQryCOMPANYNAME: TStringField;
    CompanyQryMANAGER: TStringField;
    CompanyQryTAXNAME: TStringField;
    CompanyQryORGFORMNAME: TStringField;
    CompanyQrySHORTNAME: TStringField;
    CompanyQryTRADENAME: TStringField;
    CompanyQryCOMPANYID: TIntegerField;
    CompanyQryNAME: TStringField;
    CompanyQryISENTERPR: TStringField;
    CompanyQryISPRIVATE: TStringField;
    CompanyQryISVENDOR: TStringField;
    CompanyQryISCLIENT: TStringField;
    CompanyQryISAGENT: TStringField;
    CompanyQryISHOTEL: TStringField;
    CompanyQryTAXPAYREGNO: TStringField;
    CompanyQryTAXPAYCODE: TStringField;
    CompanyQryIDENTCODE: TStringField;
    CompanyQryCLASSCODE: TStringField;
    CompanyQryFORWORK: TStringField;
    CompanyQryMEMO: TMemoField;
    CompanyQryISBSMAN: TStringField;
    CompanyQryCOMPKIND: TStringField;
    CompanyQryVCARDNO: TIntegerField;
    CompanyQryADDMANID: TIntegerField;
    CompanyQryFULLNAME: TMemoField;
    CompanyQryTAXPAYSTATEID: TIntegerField;
    CompanyQryDATEOBDZVIN: TDateTimeField;
    CompanyQryMANOBDZVIN: TIntegerField;
    CompanyQryORGFORMID: TIntegerField;
    CompanyQryTAXPAY: TStringField;
    CompanyQryTAXPAYREGDATE: TDateTimeField;
    CompanyQryLICENSEDATE: TDateTimeField;
    CompanyQryWARRANTYSUM: TFloatField;
    CompanyQryWARRANTYVAL: TIntegerField;
    CompanyQryWARRANTYTERM: TDateTimeField;
    CompanyQryLICENSETERMIN: TStringField;
    CompanyQryLICENSENO: TStringField;
    CompanyQryOBDZVIN: TSmallintField;
    CompanyQryOBDZVINAGREEDATE: TDateTimeField;
    CompanyQryACTIONID: TIntegerField;
    CompanyQryGOVREESTRTYPEID: TIntegerField;
    CompanyQryGOVREESTRDATE: TDateTimeField;
    CompanyQrySINGLETAXTYPEID: TIntegerField;
    CompanyQryTAXPAYTYPEID: TIntegerField;
    CompanyQryAREAGENTCONTRACT: TStringField;
    CompanyQrySIGNDATE: TDateTimeField;
    CompanyQryTILLDATE: TDateTimeField;
    CompanyQryDOCTODATE: TDateTimeField;
    CompanyQryISRCVORIG: TStringField;
    CompanyQryISSEND: TStringField;
    CompanyQryISRCVCOPY: TStringField;
    CompanyQryISSENDORIG: TStringField;
    CompanyQryISPRINTED: TStringField;
    CompanyQryISSIGN: TStringField;
    CompanyQryOURPERSONID: TIntegerField;
    CompanyQryITSPERSONID: TIntegerField;
    CompanyQryNUMCONTRACT: TStringField;
    CompanyQryFILENAME: TStringField;
    CompanyQryCOMPCONTRACTID: TIntegerField;
    CompanyQrySORTBYCONTRACT: TIntegerField;
    CompanyQryAREAGCNTRWITHOUTTDATE: TStringField;
    CompanyQryFIXDEFECTTODATE: TDateTimeField;
    CompanyQryEXPTOURCOMPNOTE: TMemoField;
    CompanyQryISEXTEND: TStringField;
    CompanyQryALLDATAFILL: TStringField;
    CompanyQrySTANDOC: TIntegerField;
    CompanyQryWORKMANID: TIntegerField;
    CompanyQryPERSCOUNT: TIntegerField;
    CompanyQryORDERCOUNT: TIntegerField;
    CompanyQryLASTDATECRORDER: TDateTimeField;
    CompanyQryISTOUROPER: TStringField;
    CompanyQryASAUPAIR: TStringField;
    CompanyQryCONTRACTCOMPNOTE: TMemoField;
    CompanyQryNOTEADDMANID: TIntegerField;
    CompanyQryCNTREDITMANID: TIntegerField;
    CompanyQryHEADOFFICEID: TIntegerField;
    CompanyQryHEADOFFICENAME: TStringField;
    CompanyQryISFILIYA: TStringField;
    CompanyQryISHEADOFFICE: TStringField;
    CompanyQryTRADENAMEID: TIntegerField;
    CompanyQryNOTWORK: TStringField;
    CompanyQryAGENCYLOGO: TStringField;
    CompanyQryPEYMTOAGENCY: TStringField;
    CompanyQryPERMREREESTR: TStringField;
    CompanyQryREREESTR: TStringField;
    CompanyQrySINGLETAXDATE: TDateTimeField;
    CompanyQryCOMPIDFORCNTRCT: TIntegerField;
    CompanyQryCONTRACTPROMPT: TMemoField;
    CompanyQryLOGDATETIME: TDateTimeField;
    CompanyQryEXPNOTEMANAGER: TStringField;
    CompanyQryCOMPNOTEID: TIntegerField;
    CompanyQryCONTRACTLOGID: TIntegerField;
    CompanyQryORGFORMINNAME: TStringField;
    CompanyQryADDDATE: TDateTimeField;
    CompanyQryASRESIDENT: TStringField;
    CompanyQryCOMMONNOTE: TBlobField;
    CompanyQryCOMMONNOTEADDDATE: TDateTimeField;
    CompanyQryCOMMONNOTEMANID: TIntegerField;
    CompanyQryRCVORIGDATE: TDateTimeField;
    CompanyQryCOMPANYTRADENAME: TStringField;
    CompanyQryNOTWORKDATE: TDateTimeField;
    CompanyQryNOTWORKMANID: TIntegerField;
    CompanyQryARENEWCONTRACT: TStringField;
    CompanyQryAREWEB: TStringField;
    CompanyQryASNETAGENT: TIntegerField;
    CompanyQryASTOURS: TIntegerField;
    CNTREMBAS_INPROVINCEID_CITY_ADM_UNIT: TIntegerField;
    ViewContEmbasInprovinceID_CITY_ADM_UNIT: TcxGridDBColumn;
    CompanyQryISBUDGET: TIntegerField;
    ViewCompanyMANAGER: TcxGridDBColumn;
    ViewCompanyISBUDGET: TcxGridDBColumn;
    CompanyQryISOTHER: TIntegerField;
    ViewCompanyISOTHER: TcxGridDBColumn;
    SHEMA_VEHICLE_DETAILDS: TDataSource;
    SHEMA_VEHICLE_DETAIL: TADOQuery;
    BrDrvMapQryNUMBERDIRECTION: TIntegerField;
    BrDrvMapQryGORIZONTDIRECTION: TIntegerField;
    BrDrvMapQryVERTICALDIRECTION: TIntegerField;
    SHEMA_VEHICLE_DETAILID: TIntegerField;
    SHEMA_VEHICLE_DETAILPLACE: TStringField;
    SHEMA_VEHICLE_DETAILATYPE: TIntegerField;
    SHEMA_VEHICLE_DETAILDIRECTION: TIntegerField;
    SHEMA_VEHICLE_DETAILALEVEL: TIntegerField;
    SHEMA_VEHICLE_DETAILID_DRVMAPS: TIntegerField;
    BrDriveQryVENDORNAME: TStringField;
    ViewBrDriveKIND: TcxGridDBColumn;
    ViewBrDriveCLASSNAME: TcxGridDBColumn;
    ViewBrDriveLookDriveKind: TcxGridDBColumn;
    ViewBrDriveVENDORNAME: TcxGridDBColumn;
    BrDriveQryVENDORID: TIntegerField;
    ViewBrDriveVENDORID: TcxGridDBColumn;
    SelectVendor: TADOQuery;
    SelectVendorSrc: TDataSource;
    SelectVendorCOMPANYID: TIntegerField;
    SelectVendorNAME: TStringField;
    SelectVendorGOVREESTRTYPEID: TIntegerField;
    SelectVendorIDENTCODE: TStringField;
    SelectVendorGOVREESTRDATE: TDateTimeField;
    SelectVendorASRESIDENT: TStringField;
    SelectVendorISPRIVATE: TIntegerField;
    SelectVendorISVENDOR: TStringField;
    SelectVendorISENTERPR: TStringField;
    SelectVendorCOMPIDFORCNTRCT: TIntegerField;
    SelectVendorALLDATAFILL: TIntegerField;
    SelectVendorACTIONID: TIntegerField;
    ViewDrvSrvLnk: TcxGridDBTableView;
    ViewDrvSrvLnkDRIVEID: TcxGridDBColumn;
    ViewDrvSrvLnkLINKID: TcxGridDBColumn;
    ViewDrvSrvLnkSERVICEID: TcxGridDBColumn;
    ViewDrvSrvLnkHAVEVALUE: TcxGridDBColumn;
    ViewDrvSrvLnkINTVALUE: TcxGridDBColumn;
    ViewDrvSrvLnkMEASUREUNIT: TcxGridDBColumn;
    ViewDrvSrvLnkHAVECOST: TcxGridDBColumn;
    ViewDrvSrvLnkCOST: TcxGridDBColumn;
    ViewDrvSrvLnkCURRID: TcxGridDBColumn;
    ViewDrvSrvLnkCOMMENTS: TcxGridDBColumn;
    ViewDrvSrvLnkNAME: TcxGridDBColumn;
    ViewDrvSrvLnkLARGEICON: TcxGridDBColumn;
    ViewDrvSrvLnkSMALLICON: TcxGridDBColumn;
    ViewDrvSrvLnkCURRENCYSHORT: TcxGridDBColumn;
    ViewDrvSrvLnkCalcValue: TcxGridDBColumn;
    ViewDrvSrvLnkCalcCost: TcxGridDBColumn;
    ViewDrvSrvLnkCalcHaveCost: TcxGridDBColumn;
    ViewDrvSrvLnkCalcMemo: TcxGridDBColumn;
    ViewDrvSrvLnkCalcPrice: TcxGridDBColumn;
    VisaDocumentsQryVISADOCUMENTID: TIntegerField;
    VisaDocumentsQryDOCID: TIntegerField;
    VisaDocumentsQryISUSE: TStringField;
    VisaDocumentsQryDOCNAME: TStringField;
    VisaDocumentsQryNEEDCOUNT: TIntegerField;
    VisaDocumentsQryAGERESTRICTION: TIntegerField;
    VisaDocumentsQryEXPIREMONTHS: TIntegerField;
    VisaDocumentsQryCOMMENTS: TMemoField;
    ItsDocumVisaListQrySUMMA: TFloatField;
    ItsDocumVisaListQryFUNDINGCOUNT: TSmallintField;
    OneTypeDocQrySUMMA: TFloatField;
    SHEMA_VEHICLE_DETAILAROW: TIntegerField;
    SHEMA_VEHICLE_DETAILCOL: TIntegerField;
    AllDocQryTYPEDOCID: TIntegerField;
    AllDocQryDOCID: TIntegerField;
    AllDocQryVIEWNAME: TStringField;
    AllDocQryTYPEID: TIntegerField;
    AllDocQryTYPENAME: TStringField;
    ExistCompQryCOMPANYID: TIntegerField;
    ExistCompQryTRADENAME: TStringField;
    ExistCompQryNAME: TStringField;
    ExistCompQryCOMPKIND: TStringField;
    ExistOfficeQryHOUSE: TStringField;
    ExistOfficeQryTENEMENT: TStringField;
    VisaDocSubGroupsQryID: TIntegerField;
    VisaDocSubGroupsQryNAME: TStringField;
    VisaDocSubGroupsQryAORDER: TIntegerField;
    CompanyDocsQry: TADOQuery;
    CompanyDocsQryDOCID: TIntegerField;
    CompanyDocsQryDOCNAME: TIBStringField;
    CompanyDocsQryCalcFileCount: TIntegerField;
    CompanyDocsQryCATEGORYID: TIntegerField;
    CompanyDocsSrc: TDataSource;
    CountriesHaveHotelsSrc: TDataSource;
    ViewCoutriesHaveHotels: TcxGridDBTableView;
    CountriesHaveHotelsQry: TADOQuery;
    CountriesHaveHotelsQryCOUNTRYID: TIntegerField;
    CountriesHaveHotelsQryNAME: TStringField;
    CountriesHaveHotelsQrySHOWWEB: TStringField;
    CountriesHaveHotelsQryLNGNOTFOUND: TLargeintField;
    CountriesHaveHotelsQryLNGCHANGE: TLargeintField;
    CountriesHaveHotelsQrySHORTSIGN: TStringField;
    CountriesHaveHotelsQryTIMEBIAS: TFloatField;
    CountriesHaveHotelsQryCCODE: TStringField;
    CountriesHaveHotelsQryCODE2: TStringField;
    CountriesHaveHotelsQryCODE3: TStringField;
    CountriesHaveHotelsQryNEEDVISA: TStringField;
    CountriesHaveHotelsQryPHONECODEUNI: TStringField;
    ViewCoutriesHaveHotelsCOUNTRYID: TcxGridDBColumn;
    ViewCoutriesHaveHotelsCCODE: TcxGridDBColumn;
    ViewCoutriesHaveHotelsCODE2: TcxGridDBColumn;
    ViewCoutriesHaveHotelsCODE3: TcxGridDBColumn;
    ViewCountriesHaveHotelList: TcxGridDBTableView;
    ViewCountriesHaveHotelListCOUNTRYID: TcxGridDBColumn;
    ViewCountriesHaveHotelListName: TcxGridDBColumn;
    ViewCountriesHaveHotelListNAME_ENG: TcxGridDBColumn;
    ViewCoutriesHaveHotelsName: TcxGridDBColumn;
    ViewCoutriesHaveHotelsSHOWWEB: TcxGridDBColumn;
    ViewCoutriesHaveHotelsLNGCHANGE: TcxGridDBColumn;
    ViewCoutriesHaveHotelsLNGNOTFOUND: TcxGridDBColumn;
    ViewCoutriesHaveHotelsSHORTSIGN: TcxGridDBColumn;
    ViewCoutriesHaveHotelsTIMEBIAS: TcxGridDBColumn;
    ViewCoutriesHaveHotelsNEEDVISA: TcxGridDBColumn;
    ViewCoutriesHaveHotelsPHONECODEUNI: TcxGridDBColumn;
    ViewCountriesHaveHotelListLATNAME: TcxGridDBColumn;
    ViewCountriesHaveHotelListMEMO: TcxGridDBColumn;

                              
    procedure DMServCreate(Sender: TObject);
    procedure BrCountryQryCalcFields(DataSet: TDataSet);
    procedure CityTableNewRecord(DataSet: TDataSet);
    procedure HtlSrvLnkQryCalcFields(DataSet: TDataSet);
    procedure BrDriveTableDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DrvImgQryCalcFields(DataSet: TDataSet);
    procedure BrServiceQryCalcFields(DataSet: TDataSet);
    procedure BrServiceQryINFOODGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure VendorTable_BeforePost(DataSet: TDataSet);
    procedure VendorTableNameValidate(Sender: TField);
    procedure PhoneQryCalcFields(DataSet: TDataSet);
    procedure CompAccountQryNewRecord(DataSet: TDataSet);
    procedure CompCorrAccntQry_NewRecord(DataSet: TDataSet);
    procedure HtlDocQryCalcFields(DataSet: TDataSet);
    procedure IntrstImgQryCalcFields(DataSet: TDataSet);
    procedure IntrstSrvLnkTableNewRecord(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
//    procedure ItsKonsulQryCalcFields(DataSet: TDataSet);
    procedure ItsDocumVisaListQryCalcFields(DataSet: TDataSet);
    procedure SelPartnersQryCalcFields(DataSet: TDataSet);
    procedure SelTaxSystemQryCalcFields(DataSet: TDataSet);
    procedure CompanyNotesQryCalcFields(DataSet: TDataSet);
    procedure SelItsPersonQryCalcFields(DataSet: TDataSet);
    procedure HtlRoomQryCalcFields(DataSet: TDataSet);
    procedure RoomVariantQryCalcFields(DataSet: TDataSet);
    procedure DriveNoteQryCalcFields(DataSet: TDataSet);

    procedure CompanyQryNewRecord(DataSet: TDataSet);
    procedure ViewCompanyCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

    procedure ViewCompanyCustomDrawCellISOBDZVIN(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewCompanyCustomDrawCellCompanyName(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

    procedure ViewCompanyCustomDrawCellContract(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewPhoneCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewFaxCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure CompanyQryAfterOpen(DataSet: TDataSet);
    procedure _ViewPersonCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewContractCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewCompNoteCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewOrderListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure View_EmbassyDocumDlg_UsedDocsDBGridCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewCompanyDataControllerFilterGetValueList(
      Sender: TcxFilterCriteria; AItemIndex: Integer;
      AValueList: TcxDataFilterValueList);
    procedure COUNTRIES_HOLIDAYSCalcFields(DataSet: TDataSet);
    procedure CNTREMBASSIESCalcFields(DataSet: TDataSet);
    procedure View_EmbassyDocumDlg_EmbassyDBGridCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewBrCountryCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewBrCountryHaveHotelsCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewBrCityCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure SelVendorQry_NewRecord(DataSet: TDataSet);
    procedure IntrstSrvLnkQry_NewRecord(DataSet: TDataSet);
    procedure ContractQryNewRecord(DataSet: TDataSet);

    procedure SelVisaCentersQryCalcFields(DataSet: TDataSet);
    procedure OneTypeDocQryCalcFields(DataSet: TDataSet);
    procedure View_EmbassyDocumDlg_OneTypeDocDBGridCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FilingQryCalcFields(DataSet: TDataSet);
    procedure HtlGrpQryNewRecord(DataSet: TDataSet);
    procedure IntrstImgQryNewRecord(DataSet: TDataSet);
    procedure DrvImgQryNewRecord(DataSet: TDataSet);
    procedure WebSiteQryNewRecord(DataSet: TDataSet);
    procedure PersonQryNewRecord(DataSet: TDataSet);
    procedure ViewSelTradeNameCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewSelCompanyByTradeNameCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewTaxSystemDetailINCOMETAXABSGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ExistCompQryCalcFields(DataSet: TDataSet);
    procedure ViewHotelDocColumnSizeGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewHtlSrvLnkListColumnPricePropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ViewBldSrvLnkListCalcPricePropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ViewRoomSrvLnkListCalcPricePropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ViewHtlRoomROOMTYPEIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewHtlRoomROOMTYPEIDShortGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewHtlRoomSelROOMTYPEIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewHtlRoomSelEXTNAMEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewHtlRoomSelCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewHotelDocFILENAMEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ViewDrvSrvLnkListCalcPricePropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure ViewBankD_OPENGetDataText(Sender: TcxCustomGridTableItem;
      ARecordIndex: Integer; var AText: String);
    procedure ViewServicesSMALLICONPropertiesCustomClick(Sender: TObject);
    procedure ViewHtlGrpLOGOIMAGEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ViewHtlGrpCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewCountryTypeInfoTABLE_INDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure TreeCOUNTRY_TEMPL_ADM_UNITID_ADMIN_UNITPropertiesInitPopup(
      Sender: TObject);
    procedure ViewBedTypeCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewRoomExpandNameCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewHOTEL_BUILDSCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewHOTEL_BUILDSListCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewHtkKindCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewHtlBuildCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewAdminUnitCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewAdminUnitListCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewAdminUnitSubCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewAdminUnitSubListCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewServGroupCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewServGroupListCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewResortCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewInfraCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewInfraListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewNaturObjCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewNaturObjListCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewCountryTypeInfoCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewKindStreetCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewKindStreetListCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ViewServicesCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ViewComunicationTypeICONPropertiesCustomClick(
      Sender: TObject);
    procedure SelContractQryCalcFields(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure ViewDrvSrvLnkListHAVECOSTPropertiesEditValueChanged(
      Sender: TObject);
    procedure ViewHtlSrvLnkListHAVECOSTPropertiesEditValueChanged(
      Sender: TObject);
    procedure ViewBldSrvLnkListHAVECOSTPropertiesEditValueChanged(
      Sender: TObject);
    procedure ViewRoomSrvLnkListHAVECOSTPropertiesEditValueChanged(
      Sender: TObject);

  private
    FAdminControl : Boolean;
    FCurManager: Integer;
    FCurManagerPerm: Boolean;
    FCurManagerPerms: array[TDictParts] of Integer;
    FCompanyQryCountry: Integer;
    FCompanyQryCity: Integer;
    FCompanyQryFilter: String;
    FStoreFileName: string;
    function  SrvLinColumnPriceButClick(Elem:TDBShemaView; Sender: TObject; AButtonIndex: Integer):boolean;
    function  SrvLinHAVECOSTPropertiesEditValueChanged(Elem:TDBShemaView; Sender: TObject):Boolean;
    procedure CalcCostField(ClcCost, Cost, Have, ClcHave, Memo, ClcMemo: TField);
    function  FGetCurManagerName: String;
    procedure ModuleWriteOptions;
    procedure FSetCurManager(const Value: Integer);
    function  FDoCheckManager: Boolean;
    function  FGetManager : Integer;

    function GetSectionData: TFieldSectionData;
    function GetItsLocalLang: Boolean;

  public
    FHiperLink: String;
    FCompanyFilter: string;
    procedure Prepare;


    procedure DBTreeListCountryTemplateAdmUnitCustomDrawDataCell(
      Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);

    function ServiceAdd(FromId: Integer): Integer;
    function ServGroupAdd(FromId: Integer): Integer;

    //procedure LaunchWordNewDocument;
    procedure SetIBQueryOrderBy(Qry: TADOQuery; const Ord: String);
    procedure SortMemoList(MLines: TStrings);
    //function GetDocumentFolder(CompanyId: Integer = 0): String;
    //function GetDocumentFullName(const DocName: String): String;
    function GetContractDir: string;
    procedure DrawContractLabel(aLabel: TLabel; OnEntered: Boolean);
    function GetFileNameWithMemo(aField: TField; sNameParId: Integer = 0): string;
    //procedure OpenShablonDoc(ShablonName: string; DocVsbl: Boolean = True);
    function GetPartners_ContractDocsStoreFolder(const Company: String): String;
    //function GetPatchPartnersDoc(InTmp: Boolean = False): string;
    function GetTypeNote(const Index: Integer): integer;
    //function CheckRcvDoc: Boolean;
    //function MoveRcvCopy: Boolean;
    procedure LogContractDataChanging(
      LogCategory, ContractId, CompanyId, User: Integer;
      const Prompt: string);      
    procedure SendMailPartnerAboutContract(aTag: Integer; aElemCOMPANYQRY, aElemEmailQry:TDBShema) ;
    procedure SetVisibleCheckBox(Control: TControl);

    procedure DrawWebImage(aImage: TImage; ShowWeb: Boolean; WebId, WebId2:Integer);
    procedure UpdateForeignNameQry(ServTable, ServTable2: string;
      ServId, ServId2: Integer);
    procedure UpdateForeignNameMTable(Id, ServId: Integer;
      const ServTable, ServName, ServMemo, ServExtName: string;
      ServId2: Integer = 0; const ServTable2: string = '');

    function CheckUniqHtlRoom(BuilId, RoomTypeId, HotelRoomId, ExpandNameId,
      Capacity, AddCapacity, AddCapAdult: Integer): Boolean;
    function GetExtraPath: string;

    //procedure AddCountryToMemTable(const ObjectId, Value: string);
    function GenInsertObjectLinkSQL(CountryId, MainObjectId, ObjectId: Integer;
      MainTableName, TableName: string): string; 
    function GenUpdateObjectLinkSQL(LinkId, MainObjectId: Integer;
      MainTableName: string): string;
    function GenDeleteObjectLinkSQL(const DelList: string): string;
    //procedure UpdateRoomVariantQry;
    //procedure UpdateSearchEdit(SearchEdit: TAdvEdit;
    //  FieldName, FieldID: TField);
    function CheckUniqName(const SQLText, ErrorMsg: String): Boolean;
    function GetObjectTableName(aTag: Integer): string;

    function myStoreFileName(var Fldr, Subj: string;
      ReferId, TypeFolder: Integer; aSaveExtPdf: Boolean = False): Boolean;

    procedure PrepareMainSqlCompanyQuery;

    procedure InitElements;
    procedure CloseAllElements;
    
    //procedure AddAddresToHistory(Dataset:TDataset; FieldIdName, FieldKindStreet, FieldCityID, FieldProvinceId,
    //                                 FieldStreetName,FieldBuilding,FieldTenement:Widestring );

    Function GetCurrentHotelDocFolder( aView:TcxGridDBTableView; ARecord: TcxCustomGridRecord ):String;

    procedure RefreshComapnyOne(idCompany:variant);
    property  CompanyQryFilter: String read FCompanyQryFilter write FCompanyQryFilter;
    property  CurManager: Integer read FGetManager write FSetCurManager;
    property  CurManagerName: String read FGetCurManagerName;
    property  AdminControl : boolean read FAdminControl;
    //property CurManagerPerm: Boolean read FCurManagerPerm write SetCurManagerPerm;
    {property CurManagerPerms[Dict: Integer]: Integer read GetCurManagerPerms write SetCurManagerPerms;
    property CurManagerAccessPerms[Dict: Integer]: Boolean index 0 read GetCurManagerAccPerms;
    property CurManagerAddPerms[Dict: Integer]: Boolean index 1 read GetCurManagerAccPerms;
    property CurManagerEditPerms[Dict: Integer]: Boolean index 2 read GetCurManagerAccPerms;
    property CurManagerViewPerms[Dict: Integer]: Boolean index 3 read GetCurManagerAccPerms;
    property CurManagerDeletePerms[Dict: Integer]: Boolean index 4 read GetCurManagerAccPerms;
    property CurManagerPrintPerms[Dict: Integer]: Boolean index 5 read GetCurManagerAccPerms;
    property CurManagerSpecEditPerms[Dict: Integer]: Boolean index 6 read GetCurManagerAccPerms;
    property CurManagerAdminPerms[Dict: Integer]: Boolean index 9 read GetCurManagerAccPerms; }

    function CheckManager:boolean;
    property CommonTypeNote: integer index 0 read GetTypeNote;
    property ExportTypeNote: integer index 1 read GetTypeNote;
    property ContractTypeNote: integer index 2 read GetTypeNote;
    property StoreFileName: string read FStoreFileName write FStoreFileName;
    property ItsLocalLang: Boolean read GetItsLocalLang;
  end;

function CheckActionLevel(Action: Boolean): Boolean;

var
  DMServ: TDMServ;



var
  EnCompanyBrowseShow: Boolean = True;
  EnCompanyBrowseSel: Boolean = True;
  EnEditEnterpriseProp: Boolean = True;
  EnEditClientProp: Boolean = True;
  EnEditVendorProp: Boolean = True;

  Elem_HtlVendorQry : TDBShemaView;
  Elem_DRVKINDQry : TDBShemaView;
  Elem_SERVGROUPQry : TDBShemaView;
  Elem_REKLAMAQry : TDBShemaView;
  Elem_HTLCATEGQry : TDBShemaView;
  Elem_HTLGRPQry : TDBShemaView;

  Elem_DrvSrvLnkQry : TDBShemaView;
  Elem_DriveFloorTotalQry : TDBShemaView;
  Elem_BuildsQry : TDBShemaView;
  Elem_COMPANYQRY : TDBShemaView;
  Elem_SelHeadDataQuery : TDBShema;
  Elem_CompEnterpriseHoteQry : TDBShemaView;
  Elem_COMPACCOUNTQry : TDBShemaView;
  //Elem_BANKMQry : TDBShemaView;
  //Elem_COMPCORRACCNTQry : TDBShemaView;
  Elem_BankLookQry : TDBShemaView;
  Elem_ANKETTEMPQry : TDBShemaView;
  Elem_BrDrvMapQry : TDBShemaView;
  //Elem_SHEMA_VEHICLE:TDBShema;
  Elem_SHEMA_VEHICLE_DETAIL:TDBShema;
  Elem_LOOKCITYTABLE : TDBShemaView;
  Elem_HtlBuildQry : TDBShemaView;
  Elem_HtlRoomQry : TDBShemaView;
  Elem_SERVICEQry : TDBShemaView;
  Elem_HCityQry : TDBShemaTree;
  Elem_BrHotelQry : TDBShemaView;
  Elem_HtlImgQry :TDBShemaView;
  Elem_HotelKindQry: TDBShemaView;
  Elem_HotelCLASSQry :TDBShemaView;
  Elem_BrDriveQry : TDBShemaView;
  Elem_RoomTypeQry: TDBShemaView;
  Elem_DriveEuroClass : TDBShemaView;
  Elem_Comunication_TypeQry : TDBShemaView;

  Elem_HtlSrvLnkQry : TDBShemaView;
  Elem_BldSrvLnkQry : TDBShemaView;
  Elem_RoomSrvLnkQry : TDBShemaView;

  Elem_AccountQry : TDBShemaView;
  Elem_CorrAccntQry : TDBShemaView;
  Elem_COMPANIES_PARAM_KIND :TDBShemaView;
  Elem_COMPANIES_PARAM_NAME :TDBShemaView;
  Elem_COMPANIES_PARAM_DATA :TDBShemaView;

  Elem_CountryCompQry: TDBShemaView;
  Elem_CityCompanyQry: TDBShemaView;
  Elem_SelTradeNameQry: TDBShemaView;
  Elem_SelCompanyByTradeNameQry: TDBShemaView;
  Elem_CurrencyQry : TDBShemaView;
  Elem_CurrencyMainQry : TDBShemaView;

  Elem_VisaDocGroupsQry : TDBShemaView;
  Elem_VisaDocSubGroupsQry :TDBShemaView;

  Elem_DocumVisaQry : TDBShemaView;
  Elem_HTLDOCQry : TDBShemaView;
  Elem_HTLBUILDTABLE : TDBShemaView;
  Elem_HTLROOMTABLE : TDBShemaView;
  //Elem_MisQry : TDBShemaView;
  Elem_TypeNotesQry:TDBShemaView;
  
  //Elem_EmployeeQry : TDBShemaView;
  Elem_BankQry : TDBShemaView;
  Elem_InterestQry : TDBShemaView;
  //Elem_IntrstSrvLnkQry : TDBShemaView;
  Elem_IntrstVendorQry : TDBShemaView;

  Elem_BrDrvKindQry : TDBShemaView;
  Elem_INTRSTIMGQry : TDBShemaView;

  Elem_DRVIMGQry : TDBShemaView;
  //Elem_CompChkEntQry : TDBShemaView;
  Elem_DrvVendorQry : TDBShemaView;
  Elem_SelectVendor: TDBShemaView;

  Elem_VisaDocumentsQry : TDBShemaView;
  Elem_VISADOCUMENTS_NEWQry : TDBShemaView;
  Elem_ItsDocumVisaListQry : TDBShemaView;
  Elem_AllDocQry : TDBShemaView;

  Elem_SelPartnersQry : TDBShemaView;
  Elem_TAXSYSTEMTABLE : TDBShemaView;
  Elem_CompanyNotesQry : TDBShemaView;
  Elem_SelItsPersonQry : TDBShemaView;
  Elem_COMP_CONTRACTS_KINDQry: TDBShemaView;
  Elem_CompContractNumsQry   : TDBShema;

  Elem_LastNoteQry : TDBShemaView;
  Elem_SelCompCntrctsQry : TDBShemaView;
  Elem_CompanyDocsQry : TDBShemaView;

  Elem_CheckRoomQry : TDBShemaView;
  Elem_NaturObjQry : TDBShemaView;
  //Elem_PROVINCETABLE : TDBShemaView;
  Elem_RESORTIMGQry : TDBShemaView;
  Elem_RoomVariantQry : TDBShemaView;
  Elem_RoomBedQry : TDBShemaView;
  Elem_BedTypeQry : TDBShemaView;
  Elem_CompOrgFrmQry:TDBShemaView;
  Elem_INFRAQry : TDBShemaView;

  Elem_TaxSystemQry : TDBShemaView;
  Elem_TAXSYSTEMDetailQry : TDBShemaView;
  Elem_SelTaxSystemQry : TDBShemaView;

  Elem_UsersQry : TDBShemaView;
  Elem_DriveNoteQry : TDBShemaView;
  Elem_COUNTRIES_TYPE_INFO:TDBShemaView;
  Elem_COUNTRIES_INFO : TDBShemaView;

  Elem_ItsKonsulQry : TDBShemaView;
  Elem_SelVisaCentersQry : TDBShemaView;
  Elem_ItDesriptQry : TDBShemaView;
  Elem_BrCountryQry : TDBShemaView;
  Elem_BrCountryHaveHotelsQry : TDBShemaView;//show countries have hotels
  Elem_Admin_unitQry: TDBShemaView;
  Elem_Admin_unit_SubQry :TDBShemaView;

  Elem_Admin_unitQry0 : TDBShemaView;
  Elem_Admin_unitQry1 : TDBShemaView;
  Elem_Admin_unitQry2 : TDBShemaView;
  Elem_Admin_unitQry3 : TDBShemaView;
  Elem_Admin_unitQry4 : TDBShemaView;

  Elem_CITY_ADM_UNT_ITEMS_TYPEQry :TDBShemaView;
  Elem_COUNTRY_TEMPL_ADM_UNITQry:TDBShemaTree;
  Elem_City_Admin_UnitRegionQry:TDBShemaTree;
  Elem_City_Admin_Unit : TDBShemaTree;
  Elem_CITY_ADM_UNIT_INFOQry : TDBShemaView;
  Elem_CITY_ADM_UNIT_SUB_RELQry :TDBShema;
  Elem_City_ADM_UnitImgQry:TDBShemaView;
  Elem_ResortQry : TDBShemaView;
  Elem_DictSectQry : TDBShemaView;
  Elem_DictSect_ItemQry : TDBShemaView;
  Elem_CountrySectDescrQry : TDBShemaTree;
  Elem_Language : TDBShemaView;

  Elem_Religion : TDBShemaView;
  Elem_UNIT_MEASUR :TDBShemaView;

  Elem_SCHEDITEM_TOURS_WEB_TEMPLATE :TDBShemaView;
  Elem_SCHEDITEM_TOURS_WEB_TIME :TDBShemaView;

  Elem_Form_Government :TDBShemaView;
  Elem_Country_Holidays:TDBShemaView;
  Elem_Power_Volt_Freq:TDBShemaView;
  Elem_TypePowSockets :TDBShemaView;
  Elem_TIME_ZONE:TDBShemaView;
  Elem_COUNTRIES_MOVE_TIME:TDBShemaView;
  Elem_InternacionalOrg :TDBShemaView;
  Elem_CAR_TYPE_INFO   :TDBShemaView;
  Elem_COUNTRIES_CAR_SPEED_INFO:TDBShemaView;
  Elem_CNTREMBASSIES:TDBShemaView;
  Elem_LNG_TRANSLATE_TEMPLATE:TDBShemaView;
  Elem_LNG_TRANSL_TEMP_DETAIL:TDBShemaView;
  Elem_CNTREMBASSIESRepresent:TDBShemaView;
  Elem_CNTREMBAS_INPROVINCE:TDBShemaView;
  Elem_ProvinceOfUkraineQry:TDBShemaView;
  Elem_EmbassyList:TDBShemaView;
  Elem_EXCURSIONQry:TDBShemaView;
  Elem_ExcursCityQry :TDBShemaView;
  Elem_EXCURSION_PLACEQry:TDBShemaView;
  Elem_EXCURS_TYPE_CONTENTQry:TDBShemaView;
  Elem_EXCURS_TYPE_TRIPQry:TDBShemaView;
  Elem_EXCURS_LAYOUT_DESCRIPTQry:TDBShemaView;

  Elem_SERVICESKINDQry :TDBShemaView;
  Elem_SERVICE_TYPEQry :TDBShemaView;
  Elem_SERVICE_TYPE_CONDITIONQry :TDBShemaView;
  Elem_COMPACTIONS:TDBShemaView;

  Elem_OCCUPATIONS:TDBShemaView;
  Elem_COMP_TYPEDOCUM:TDBShemaView;
  Elem_FEEDTYPES:TDBShemaView;
  Elem_OTHERSERVICE:TDBShemaView;

  Elem_TOURISTANKETTEMPLATES : TDBShemaView;
  Elem_OneTypeDocQry:TDBShemaView;
 // Elem_SelCapShablonQry:TDBShemaView;
  Elem_TypeDocumQry:TDBShemaView;
  Elem_ExpandNameQry:TDBShemaView;
  Elem_SelPersonQry:TDBShemaView;
  Elem_SelCompAction : TDBShemaView;
  Elem_ExistCompQry  : TDBShemaView;
  Elem_ExistOfficeQry  : TDBShemaView;
  Elem_SeFromPartnerPersonQry :TDBShemaView;
  Elem_ImportLog : TDBShemaView;
  Elem_SelCountryObjectLinksQry :TDBShemaView;
  Elem_KindStreetQry  :TDBShemaView;

  Elem_SelContractQry: TDBShemaView;
  Elem_CntrTemplQry: TDBShemaView;
  Elem_SelCntrTemplQry: TDBShemaView;
  Elem_VendorTourQry: TDBShemaView;
  Elem_VendorTourContractQry: TDBShema;

  Elem_PASSPORTKINDS:TDBShemaView;
  Elem_STATUSDOC : TDBShemaView;
  Elem_REPOSKIND : TDBShemaView;
  Elem_SPONSOR : TDBShemaView;
  Elem_PAYMENT_BYSPONSOR:TDBShemaView;

  Elem_MISMATCHQry : TDBShemaView;
  Elem_VISADOCTYPEQry : TDBShemaView;
  Elem_DocForQry : TDBShemaView;
  Elem_CREDITCARDSQry : TDBShemaView;

implementation

uses Variants, Clipbrd, TourConsts, OptSet, TourCmnlIf, TourMbplIf,
  ServUn,  OrderUn, DocFileUn, UnitHtlDocFrm,
  MailSend_Frm, TourStrMag, ServModIB,  FrmProgress, TestMain, ServModDic, UnitHotelInfoEdit,
  UnitFrameComRequisites, UnitUserPermission;

{$R *.dfm}

procedure SetCommonActionState(Lev: Integer);
begin
  EnCompanyBrowseShow := True;
  EnCompanyBrowseSel := True;
  EnEditEnterpriseProp := True;
  EnEditClientProp := True;
  EnEditVendorProp := True;
end;

function CheckActionLevel(Action: Boolean): Boolean;
begin
  Result := Action;
  if not Result then ErrorDlg(SdataModErrorCheckAction);
end;

{ TDMServ }

procedure TDMServ.CalcCostField(ClcCost, Cost, Have, ClcHave, Memo, ClcMemo: TField);
begin  // calculate calculated fields for service cost and memo
  with ClcCost do
    case Have.AsInteger of
      0: AsString := Cost.DisplayText;
      1: if Cost.AsFloat = 0 then
           AsString := '+' else AsString := Cost.DisplayText;
      else AsString := '?';
    end;
  ClcHave.Value := GetHotelServiceHaveCostInfo(Have.AsInteger);
  ClcMemo.Value := Memo.AsString;
end;

function TDMServ.FGetCurManagerName: String;
begin
  Result := Elem_UsersQry.DB.FieldByName('MANAGER').asString;
end;

procedure TDMServ.ModuleWriteOptions;
const
  kCompany = 'Company';
  kCountry = 'Country';
  kCity = 'City';
  kHotel = 'Hotel';
  kPriFilter = 'PriFilter';
  kSecFilter = 'SecFilter';
  kThirdFilter = 'ThirdFilter';  
  sLastOpDiction = 'LastOpened\Diction';
  kCntryFilter = 'CntryFilter';
  kResort = 'Resort';
  kResortCntr = 'ResortCntr';
  kNaturObj = 'NaturObj';
  kNaturCntrObj = 'NaturCntrObj';
  kProvCountry = 'ProvCountry';
  kProvince = 'Province';
  kInfraObj = 'InfraObj'; 
  kInfraCntrObj = 'InfraCntrObj'; 
begin
{  with OptionSet do
  begin
    KeyWriteInteger(sLastOpDiction, kCountry, LastOpDictCountry);
    KeyWriteInteger(sLastOpDiction, kCity, LastOpDictCity);
    KeyWriteInteger(sLastOpDiction, kProvCountry, LastOpDictProvCountry);
    KeyWriteInteger(sLastOpDiction, kProvince, LastOpDictProvince);
    KeyWriteInteger(sLastOpDiction, kHotel + kCountry, LastOpDictHCountry);
    KeyWriteInteger(sLastOpDiction, kHotel + kCity, LastOpDictHCity);
    KeyWriteInteger(sLastOpDiction, kHotel, LastOpDictHotel);
    KeyWriteInteger(sLastOpDiction, kCompany, LastOpDictCompany);
    KeyWriteInteger(sLastOpDiction, kPriFilter, LastPriFilterDictCompany);
    KeyWriteInteger(sLastOpDiction, kSecFilter, LastSecFilterDictCompany);
    KeyWriteInteger(sLastOpDiction, kThirdFilter, LastThirdFilterDictCompany);    
    KeyWriteInteger(sLastOpDiction, kCntryFilter, LastCntryFilterDictCompany);    
    KeyWriteInteger(sLastOpDiction, kResortCntr, LastOpDictResortCntr);    
    KeyWriteInteger(sLastOpDiction, kResort, LastOpDictResort);
    KeyWriteInteger(sLastOpDiction, kNaturCntrObj, LastOpDictNaturCntrObj);
    KeyWriteInteger(sLastOpDiction, kNaturObj, LastOpDictNaturObj);    
    KeyWriteInteger(sLastOpDiction, kInfraCntrObj, LastOpDictInfraCntrObj);    
    KeyWriteInteger(sLastOpDiction, kInfraObj, LastOpDictInfraObj);    
    KeyWriteInteger(sOptSetLastOpTourman, kOptSetLastManager, LastOpManager);
  end; }
end;

function TDMServ.FDoCheckManager: Boolean;
var ManId: Integer;
begin
  FAdminControl := False;
  ManId := CurManager;

  result := ExecuteManagerDlg( Elem_UsersQry.DBGetParamConnect, Application.Title, ManId, FAdminControl );
  CurManager := ManId;
end;

function TDMServ.CheckManager:boolean;
begin
  result:= FDoCheckManager;
end;

procedure TDMServ.Prepare;
begin
   //TourMan DB
  //PrepareConnectDatabeseTourManTest(IBDatabase,True);
  PrepareConnectDatabeseTourManTest( DmServDic.ADOConnection, True );
  //PrepareConnectDatabeseTourManWork( DmServDic.ADOConnection, True ); // Робоча
  //PrepareConnectDatabeseTourManMySqlWork(ADOConnection);
  //PrepareConnectDatabeseTourManWork( ADOConnection,True );

  //FindDatasetProblemField( 'troll:D:\_Apollo\_TOURIB_TEST.GDB','SYSDBA','masterkey');
  //SynchrConnectDatabaseIBAndAdo( IbDatabase, DmServDic.ADOConnection, True );

  OptionSet := TOptionSet.Create;
  SetCommonActionState( 5 );
  StoreFileName := EmptyStr;

  TimerPingServer.SetIBServerForPing( DmServDic.ADOConnection, 10, True );
  InitElements;
  //FindDatasetNotInElem;
  if not CheckManager then
  begin
    Application.Terminate;
    Exit;
  end;
  //BDEDecimalSeparator := GetBDEDecimalSeparator;
  ElemUserRole.RefreshRole( self.CurManager, Elem_UsersQry.DBGetParamConnect );

  //CheckDBOnOpen;// Тестуєм всі елементи
end;

procedure TDMServ.DMServCreate(Sender: TObject);
begin
  Prepare;
end;

procedure TDMServ.BrCountryQryCalcFields(DataSet: TDataSet);
var S: String;
begin
  with DataSet do
  if not FieldByName('PHONECODE').IsNull then
  begin
    if DBBooleanGetValue( DataSet, 'PHONECODEUNI') then
      S := FieldByName('PHONECODEUNIVAL').AsString else S := SServModPhoneCode;
    if S <> '' then S := '-' + S;
    S := Format('%s-[%s]', [S, SServModPhoneNumber]);
    FieldByName('CalcPhoneCode').Value := FieldByName('PHONECODE').AsString + S;
  end;
end;

procedure TDMServ.CityTableNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('TimeBias').Value := Elem_BrCountryQry.DB.FieldByName('TIMEBIAS').Value;
  if Elem_BrCountryQry.DBBooleanValue['PHONECODEUNI'] then
    DataSet.FieldByName('PhoneCode').Value := Elem_BrCountryQry.DB.FieldByName('PHONECODEUNIVAL').Value;
  DataSet.FieldByName('DICTBROWSE').AsBoolean := True;
  DataSet.FieldByName('ADDMANID').Value := CurManager;
end;

procedure TDMServ.HtlSrvLnkQryCalcFields(DataSet: TDataSet);
begin
  CalcCostField( DataSet.FieldByName('CalcCost'), DataSet.FieldByName('COST'),
                 DataSet.FieldByName('HAVECOST'), DataSet.FieldByName('CalcHaveCost'),
                 DataSet.FieldByName('COMMENTS'), DataSet.FieldByName('CalcMemo') );

  DataSet.FieldByName('CalcValue').asString := DataSet.FieldByName('INTVALUE').asString + #32 + DataSet.FieldByName('MEASUREUNIT').asString;

  if DataSet.FieldByName('COST').AsCurrency <> 0 then
    DataSet.FieldByName('CalcPrice').AsString :=  PrepareFormatPrice( DataSet.FieldByName('COST').AsCurrency , DataSet.FieldByName('CURRENCYSHORT').AsString )
  else DataSet.FieldByName('CalcPrice').AsString := '';
end;

procedure TDMServ.BrDriveTableDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  ErrorDlg(E.Message);
end;

procedure TDMServ.DrvImgQryCalcFields(DataSet: TDataSet);
var S: String;
begin
  S := ExtractFileName(DataSet.FieldByName('FILENAME').asString);
  with  DataSet.FieldByName('CalcFileName') do
    if S = '' then Value := DataSet.FieldByName('FILENAME').asString else Value := S;
end;

procedure TDMServ.BrServiceQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcName').value := DataSet.FieldByName('NAME').asString;
end;

procedure TDMServ.BrServiceQryINFOODGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
const CheckValue: array[Boolean] of String[1] = (' ', '+');
begin
  Text := CheckValue[Sender.AsBoolean];
end;

procedure TDMServ.VendorTable_BeforePost(DataSet: TDataSet);
begin
  if DataSet.FieldByName('Name').AsString = '' then
  begin
    DataSet.Cancel;
    raise EDatabaseError.Create(SDataModErrInvalidName);
  end;
end;

procedure TDMServ.VendorTableNameValidate(Sender: TField);
begin
  if not ConfirmDlgYC(SDataModConfirmVendorName) then Abort;
end;

procedure TDMServ.PhoneQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcPhoneNo').asString := MakePhoneNo( DataSet.FieldByName('CNTRYCODE').asString,DataSet.FieldByName('AREACODE').asString,
                                           DataSet.FieldByName('PHONENO').asString, DataSet.FieldByName('EXTENTION').asString);

  DataSet.FieldByName('CalcNumber').asString := DataSet.FieldByName('CNTRYCODE').asString +
  DataSet.FieldByName('AREACODE').asString + DataSet.FieldByName('PHONENO').asString + DataSet.FieldByName('EXTENTION').asString;

end;

procedure TDMServ.CompAccountQryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('COMPANYID').asInteger := Elem_COMPANYQRY.GetValueId;//CompanyTableCOMPANYID.Value;
  DataSet.FieldByName('ISCORRESP').AsBoolean := False;
  DataSet.FieldByName('ADDMANID').asInteger := CurManager;
end;

procedure TDMServ.CompCorrAccntQry_NewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('COMPANYID').asInteger := Elem_COMPANYQRY.GetValueId;//CompanyTableCOMPANYID.Value;
  DataSet.FieldByName('ISCORRESP').AsBoolean := True;
  DataSet.FieldByName('ADDMANID').asInteger := CurManager;
end;

procedure TDMServ.ContractQryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ADDMANID').AsInteger := CurManager;
end;

procedure TDMServ.HtlDocQryCalcFields(DataSet: TDataSet);
var S: String;
begin
  S := DataSet.FieldByName('DESCRIPT').asString;
  if S = '' then S := ExtractFileName(DataSet.FieldByName('FILENAME').asString);

  if S = '' then DataSet.FieldByName('CalcFileName').asString:= DataSet.FieldByName('FILENAME').asString
  else DataSet.FieldByName('CalcFileName').asString := S;   
end;

procedure TDMServ.IntrstImgQryCalcFields(DataSet: TDataSet);
var S: String;
begin
  S := ExtractFileName(IntrstImgQry.FieldByName('FILENAME').asString);
  with IntrstImgQryCalcFileName do
    if S = '' then Value := IntrstImgQry.FieldByName('FILENAME').asString else Value := S;
end;

procedure TDMServ.IntrstSrvLnkTableNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('INTERESTID').asInteger := Elem_InterestQry.DB.FieldByName('INTERESTID').asInteger;
end;

procedure TDMServ.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(OptionSet) then FreeAndNil(OptionSet);
  DmServDic.ADOConnection.Connected := False;
  DeactiveStatusBar;
  CloseAllElements;
end;

procedure TDMServ.SortMemoList(MLines: TStrings);
var SortList:TStringList;
begin
  SortList := TStringList.Create;
  SortList.AddStrings(MLines);
  SortList.Sort;
  MLines.Clear;
  MLines.AddStrings(SortList);
  SortList.Free;
end;

procedure TDMServ.ItsDocumVisaListQryCalcFields(DataSet: TDataSet);
var StrSum: String;
begin
  //inherited;

  if DataSet.FieldByName('AGERESTRICTION').Value < 0 then
    DataSet.FieldByName('CalcAgeRestr').asString := Format('до %d р.', [Abs(DataSet.FieldByName('AGERESTRICTION').asInteger)])
  else
  if DataSet.FieldByName('AGERESTRICTION').Value > 0 then
    DataSet.FieldByName('CalcAgeRestr').asString := Format('з %d р.', [DataSet.FieldByName('AGERESTRICTION').asInteger])
  else DataSet.FieldByName('CalcAgeRestr').asString := '';

  if not DataSet.FieldByName('MARRIEDSTATE').IsNull then
    DataSet.FieldByName('CalcMarried').asString := LoadResString(pMarriedMUaIdents[DataSet.FieldByName('MARRIEDSTATE').asInteger]);

  if DataSet.FieldByName('ExpireMonths').IsNull then DataSet.FieldByName('CalcExpireMonths').asString := ''
  else
  DataSet.FieldByName('CalcExpireMonths').asString := DataSet.FieldByName('ExpireMonths').AsString + ' ' + Expire[DataSet.FieldByName('EXPIREPERIOD').asInteger];

  if DataSet.FieldByName('ISSUEDMONTHS').IsNull then DataSet.FieldByName('CalcIssuedMonths').asString := ''
  else DataSet.FieldByName('CalcIssuedMonths').asString := DataSet.FieldByName('ISSUEDMONTHS').AsString + ' ' + Expire[DataSet.FieldByName('ISSUESPERIOD').asInteger];

  if DataSet.FieldByName('DOCFORLASTCOUNT').IsNull then DataSet.FieldByName('CalcDocForLast').asString := ''
  else DataSet.FieldByName('CalcDocForLast').asString := DataSet.FieldByName('DOCFORLASTCOUNT').AsString + ' ' + Expire[DataSet.FieldByName('DOCFORLASTPERIOD').asInteger];

  with ItsDocumVisaListQrySumma do
  if (DataSet.FieldByName('Summa').value = 0) and (DataSet.FieldByName('FUNDING').isNull) then
    DataSet.FieldByName('CalcSum').asString := ''
  else
  begin
    if DataSet.FieldByName('FUNDING').asString = 'T' then StrSum := 'Додаткове фінансування '
    else if DataSet.FieldByName('FUNDING').asString = 'W' then StrSum := 'Додаткове фін. без суми '
    else if DataSet.FieldByName('FUNDING').asString = 'F' then StrSum := 'Основний дохід '
    else StrSum := 'Банк' + IfThen( DataSet.FieldByName('BANKWITHOUTSUM').AsBoolean, ' без суми', '');
    DataSet.FieldByName('CalcSum').asString := StrSum;
  end;

  if not DataSet.FieldByName('BEFOREFILING').IsNull then DataSet.FieldByName('CalcBeforeFiling').asString :=
  Format('%d %s', [ DataSet.FieldByName('BEFOREFILING').asInteger, Expire[ DataSet.FieldByName('BEFOREFILINGPERIOD').asInteger] ]);

  if not DataSet.FieldByName('SETOFDOCUMENT').IsNull or not DataSet.FieldByName('SAMETYPEDOCID').IsNull
  then DataSet.FieldByName('CalcSameTypeDoc').asString := Format('%s / %s', [
    DataSet.FieldByName('SETOFDOCUMENT').asString, DataSet.FieldByName('SAMETYPEDOCID').asString]);
end;

procedure TDMServ.SelPartnersQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcPayServ').asString := FormatCurrency( DataSet.FieldByName('PAYFORSERV').AsCurrency )+ ' ' + DataSet.FieldByName('CURRENCYSHORT').asString;
end;

procedure TDMServ.SelTaxSystemQryCalcFields(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('INCOMETAXABS').IsNull then
    DataSet.FieldByName('CalcIncomTax').asString := CurrToStr(DataSet.FieldByName('INCOMETAXABS').AsCurrency) + ' %';

  if not DataSet.FieldByName('INCOMETAXVAL').IsNull then
    DataSet.FieldByName('CalcIncomTax').asString := CurrToStr(DataSet.FieldByName('INCOMETAXVAL').AsCurrency) + ' грн.';
  DataSet.FieldByName('CalcNameTax').asString := DataSet.FieldByName('TAXNAME').asString + ' / ' + DataSet.FieldByName('CalcIncomTax').asString;

  if DataSet.FieldByName('PAYER').asInteger = 0 then
    DataSet.FieldByName('CalcNameTax').asString := DataSet.FieldByName('CalcNameTax').asString + ' / не платник ПДВ'
  else
    DataSet.FieldByName('CalcNameTax').asString := DataSet.FieldByName('CalcNameTax').asString + ' / ' + DataSet.fieldByName('PDVSUM').AsString + ' %' ;
end;

procedure TDMServ.CompanyNotesQryCalcFields(DataSet: TDataSet);
const 
  sVIPArr: array[Boolean] of string = ('не VIP', 'VIP');
  sBlackArr: array[Boolean] of string = ('не BlackList', 'BlackList');
var St: string;
begin
  if not DataSet.FieldByName('VIP').IsNull then St := sVIPArr[DataSet.FieldByName('VIP').AsBoolean]
  else St := sBlackArr[ DataSet.FieldByName('BLACKLIST').AsBoolean];
  DataSet.FieldByName('CalcStatusNote').asString := St;
end;

procedure TDMServ.SelItsPersonQryCalcFields(DataSet: TDataSet);
begin
  Elem_SelItsPersonQry.DB.FieldByName('CalcFullName').asString :=
    Elem_SelItsPersonQry.DB.FieldByName('FULLNAME').asString + ', ' + Elem_SelItsPersonQry.DB.FieldByName('OCCUPATION').asString;
  Elem_SelItsPersonQry.DB.FieldByName('CalcPhoneNo').asString :=
    Elem_SelItsPersonQry.DB.FieldByName('AREACODE').asString + ' ' + Elem_SelItsPersonQry.DB.FieldByName('PHONENO').asString;
end;

function TDMServ.GetContractDir: string;
const
  sContact = 'Contracts\';
begin                                                                
  Result := IncludeTrailingPathDelimiter(OptionSet.TemplateFolder) + sContact;
  Result := IncludeTrailingPathDelimiter(Result);
end;

procedure TDMServ.DrawContractLabel(aLabel: TLabel; OnEntered: Boolean);
const 
  sColor: array[Boolean] of TColor = (clWindowText, clBlue);
begin
  with aLabel.Font do 
  begin 
    Color := sColor[OnEntered];  
    if OnEntered then Style := Style + [fsUnderLine]
    else Style := Style - [fsUnderLine]
  end;            
end;

function TDMServ.GetFileNameWithMemo(aField: TField; sNameParId: Integer = 0): string;
begin
  with TStringList.Create do
  try
    Assign(aField);
    Result := Values[arrNamePar[sNameParId]]
  finally
    Free;
  end;  
end;

{function TDMServ.GetPatchPartnersDoc(InTmp: Boolean = False): string;
var Fldr: String;
    Temp: Integer;
begin
  Temp := GetKeyboardLayout(GetWindowThreadProcessId(GetForegroundWindow, nil));
//  ShowMessage(IntToStr(Temp));
  if Temp = 67699721 then ActivateKeyboardLayout(69338146, 0); //('Ukrainian') 
  Fldr := IncludeTrailingPathDelimiter( GetPartners_DocsStoreFolder( Elem_COMPANYQRY.GetValueIdStr ));
  if InTmp then Fldr := Fldr + 'Temp';    
  if not DirectoryExists(Fldr)
  then ForceDirectories(Fldr);
  Result := IncludeTrailingPathDelimiter(Fldr);
  Clipboard.AsText := Result;
  ActivateKeyboardLayout(Temp, 0);
end; }

function TDMServ.GetTypeNote(const Index: Integer): integer;
const sTypeNoteShortName: array[0..2] of string = ('common', 'export', 'contact');
begin
  Elem_TypeNotesQry.DBOpen;
  Elem_TypeNotesQry.DB.Locate('SHORTNAME', sTypeNoteShortName[Index], []);
  Result := Elem_TypeNotesQry.GetValueId;
  Elem_TypeNotesQry.DBClose;
end;

{function TDMServ.CheckRcvDoc: Boolean;
var TmpPatch: string;
begin         
  TmpPatch := DMServ.GetPatchPartnersDoc(True);
  Result := ConfirmDlgYC('Скопіюйте отриману угоду в папку. Шлях до неї записано в буфер обміну')
    and not PathIsDirectoryEmpty(PChar(TmpPatch));
  if Result then MoveRcvCopy
  else ErrorDlg('Копія угоди не збережена. Повторіть спробу.')
end;

function TDMServ.MoveRcvCopy: Boolean;
var
  SR: TSearchRec;
  I: Integer;
  SourceDir, TargetDir: string;
begin
  Result := False;
  SourceDir := DMServ.GetPatchPartnersDoc(True);
  TargetDir := DMServ.GetPatchPartnersDoc;
  if not DirectoryExists(SourceDir) then
    Exit;
  if not ForceDirectories(TargetDir) then
    Exit;

  I := FindFirst(SourceDir + '*', faAnyFile, SR);
  try
    while I = 0 do
    begin
      if (SR.Name <> '') and (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        Result := MoveFile(Pchar(SourceDir + SR.Name), 
              Pchar(TargetDir + SR.Name));
        if not Result then exit;
      end;
      I := FindNext(SR);
    end;
  finally
    SysUtils.FindClose(SR);
    RemoveDirectory(PChar(SourceDir));
  end;
end;  }

procedure TDMServ.LogContractDataChanging(LogCategory, ContractId,
  CompanyId, User: Integer; const Prompt: string);
begin

end;

procedure TDMServ.SendMailPartnerAboutContract(aTag: Integer; aElemCOMPANYQRY, aElemEmailQry:TDBShema  );
type TContractAction = array[nContractSentOrig..nContractExtend] of Pointer;
var 
  Addr, ASubject, AText: String;
const 
  ContractAction = [nContractSentOrig..nContractExtend];
  SubjectCntrActArr: TContractAction = (
    @sDictSubContractSentOrig, 
    @sDictSubContractRcvOrig, @sDictTextEmpty, @sDictSubContractExtend);
  TextCntrActArr: TContractAction = (
    @sDictTextContractSentOrig,
    @sDictTextContractRcvOrig, @sDictTextEmpty, @sDictTextContractExtend);
    
begin
  if aTag in ContractAction then 
  begin
    ASubject := LoadResString(SubjectCntrActArr[ATag]);
    AText := LoadResString(TextCntrActArr[ATag]);  
    case aTag of
      nContractExtend: AText := Format(AText, [FormatDateTime('dd.mm.yyyy', Date + 14), CurManagerName]);
      nContractSentOrig: AText := Format(AText, [FormatDateTime('dd.mm.yyyy', Date), CurManagerName]);
      nContractRcvOrig: AText := Format(AText, [CurManagerName]);
    end;
    Addr := aElemEmailQry.DB.FieldByName('EMAIL').asString;
    ExecuteMailSendText(Addr, '', ASubject, AText, SVDlgsEmail, False, 
      EmptyStr, False, aElemCOMPANYQRY.GetValueId, nil, False,
      {nPartnerDocFolder}nContractFolder, myStoreFileName)
  end;
end;

procedure TDMServ.SetVisibleCheckBox(Control: TControl);
var I: Integer;
begin
  if Control is TTabSheet then
  with Control as TTabSheet do
  for I := 0 to ControlCount - 1 do
  if Controls[I] is TDBCheckBox 
  then (Controls[I] as TDBCheckBox).Visible := True;
end;


procedure TDMServ.DrawWebImage(aImage: TImage; ShowWeb: Boolean; WebId,
  WebId2: Integer);
begin
  with aImage, DMServDic.BrowseImgList do
  begin
    Picture := nil;
    if ShowWeb then Draw(Canvas, 0, 0, WebId) else Draw(Canvas, 0, 0, WebId2);
  end;
end;

function TDMServ.ServiceAdd(FromId: Integer): Integer;
begin

end;

function TDMServ.ServGroupAdd(FromId: Integer): Integer;

begin

end;


procedure TDMServ.UpdateForeignNameQry(ServTable, ServTable2: string;
  ServId, ServId2: Integer);
const SelSQL_Var1 = 'select LanguageId, LanguageName, ServNameTranslate, ' +
    'T.Comments, T.servtranslateid, T.NeedChange, ' +
    'L.LanguageShort2 LangShortName, T.OtherNameTrans ' +
    'from Language_View L ' +
    'left join ServTranslate T on T.ServTable = :ServTable ' +
    '  and T.LangId = L.LanguageId and T.ServId = :ServId ' +
    'where L.ActualLang = ''T'' and L.LanguageId <> :LocalLang ' +
    'order by OrderInCategory';  
    SelSQL_Var2 = 'select LanguageId, LanguageName, st.ServNameTranslate, ' +
    'T.Comments, T.servtranslateid, T.NeedChange, ' +
    'L.LanguageShort2 LangShortName, sT.OtherNameTrans ' +
    'from Language_View L ' +
    'left join ServTranslate T on T.ServTable = :ServTable ' +
    '  and T.LangId = L.LanguageId and T.ServId = :ServId ' +
    'left join ServTranslate sT on sT.ServTable = :ServTable2 ' +
    '  and sT.LangId = L.LanguageId and sT.ServId = :ServId2 ' +
    'where L.ActualLang = ''T'' and L.LanguageId <> :LocalLang ' +
    'order by OrderInCategory';
begin
 { with SelForeingNameQry do
  begin
    if ServId2 > 0 then SQL.Text := SelSQL_Var2 else SQL.Text := SelSQL_Var1;
    Close;                                          
    with Transaction do if Active then Commit;
    ParamByName('ServTable').Value := ServTable;
    ParamByName('ServId').Value := ServId;
    ParamByName('LocalLang').Value := nLocalLang;
    SetQueryParam(Params.FindParam('ServTable2'), ftString, ServTable2);
    SetQueryParam(Params.FindParam('ServId2'), ftInteger, ServId2);
    Open;
  end;}
end;

procedure TDMServ.UpdateForeignNameMTable(Id, ServId: Integer;
  const ServTable, ServName, ServMemo, ServExtName: string;
  ServId2: Integer = 0; const ServTable2: string = '');
var NeedChangeForHotel: Boolean;
begin

end;

procedure TDMServ.HtlRoomQryCalcFields(DataSet: TDataSet);
begin
  if (not DataSet.FieldByName('CHILDTO').IsNull)and(DataSet.FieldByName('CHILDTO').Value >0 ) then
    DataSet.FieldByName('CalcChildTo').asString := DataSet.FieldByName('CHILDTO').AsString + #32 +
    CountLabelCaption( DataSet.FieldByName('CHILDTO').asINteger, SVDlgsYearOne, SVDlgsYearTwo, SVDlgsYearMore);
end;

function TDMServ.CheckUniqHtlRoom(BuilId, RoomTypeId, HotelRoomId,
  ExpandNameId, Capacity, AddCapacity, AddCapAdult: Integer): Boolean;
begin

end;

function TDMServ.GetExtraPath: string;
var ObjectId: Integer;
begin
  ObjectId := Elem_HtlImgQry.DB.FieldByName('OBJECTID').asInteger;
  Result := EmptyStr;
  if Elem_HtlImgQry.DB.FieldByName('TABLEID').asInteger = HtlBuildImage
  then Result := IncludeTrailingPathDelimiter(IntToStr(ObjectId));
  if Elem_HtlImgQry.DB.FieldByName('TABLEID').asInteger = HtlRoomImage 
  then Result := IncludeTrailingPathDelimiter(Result + Elem_HtlImgQry.DB.FieldByName('BUILDID').asString +
    PathDelim + IntToStr(ObjectId));
end;

function TDMServ.GenInsertObjectLinkSQL(CountryId, MainObjectId, ObjectId: Integer;
  MainTableName, TableName: string): string;
const InsSQL = 'Insert Into ObjectLinks(CountryId, MainObjectId, ObjectId, MainTableName, ' +
  'TableName) Values(%d, %d, %d, ''%s'', ''%s'')';
      InsEmptSQL = 'Insert Into ObjectLinks(CountryId, ObjectId, ' +
  'TableName) Values(%d, %d, ''%s'')';
begin
  if MainObjectId = 0 then Result := Format(InsEmptSQL, [CountryId, ObjectId, TableName])
  else Result := Format(InsSql, [CountryId, MainObjectId, ObjectId, MainTableName, TableName]);
end;

function TDMServ.GenDeleteObjectLinkSQL(const DelList: string): string;
const DelSQL = 'Delete From ObjectLinks Where LinkId in (%s)';
var sList: string;
begin
  sList := Copy(DelList, 0, Length(DelList)-1);
  Result := Format(DelSQL, [sList]);
end;

procedure TDMServ.RoomVariantQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcVariantName').asString := Format('Варіант %d', [DataSet.RecNo]);
end;

procedure TDMServ.SetIBQueryOrderBy(Qry: TADOQuery; const Ord: String);
const sOrd = 'order by ';
var
  S: String;
  N: Integer;
begin
  if FoundSubString(sOrd, Ord) then S := Ord else S := sOrd + Ord;
  with Qry do
  begin                
    N := PosSubString(sOrd, SQL.Text);
    if Active then Close;
    if N = 0 then SQL.Text := SQL.Text + #32 + S
    else SQL.Text := Copy(SQL.Text, 1, Pred(N)) + S;
  end;
end;

{procedure TDMServ.UpdateSearchEdit(SearchEdit: TAdvEdit; FieldName,
  FieldID: TField);
var DataQuery: TDataSet; 
begin
  SearchEdit.Text := EmptyStr;
  with SearchEdit.Lookup do
  begin
    DisplayList.Clear;
    ValueList.Clear;    
    if Assigned(FieldName) then 
    begin               
      DataQuery := FieldName.DataSet;
      if not DataQuery.Active then DataQuery.Open;
      while not DataQuery.Eof do
      begin
        DisplayList.Add(FieldName.AsString);
        ValueList.Add(FieldID.AsString);
        DataQuery.Next;
      end;
    end;
  end;
end;}


function TDMServ.CheckUniqName(const SQLText, ErrorMsg: String): Boolean;
begin

end;

function TDMServ.GetObjectTableName(aTag: Integer): string;
begin
  case aTag of
    nCityObj: Result := sTablCity;
    nResortObj: Result := 'RESORTS';//sTablResort;
    nNaturObj: Result := sTablNaturObject;
    nInfraObj: Result := sTablInfrastructure;
  end;
end;

{procedure TDMServ.AddCountryToMemTable(const ObjectId, Value: string);
begin
  CountryObjSrc.DataSet := nil;
  with SelCountryObjTable do
  if not Locate('COUNTRYID', ObjectId, []) then
  begin   
    Append;
    SelCountryObjTableCOUNTRYID.AsString := ObjectId;
    SelCountryObjTableCOUNTRYNAME.Value := Value;
    SelCountryObjTableSTATUS.Value := nRowAdd;
    Post;
  end;
  CountryObjSrc.DataSet := SelCountryObjTable;  
end; }

function TDMServ.GenUpdateObjectLinkSQL(LinkId, MainObjectId: Integer;
  MainTableName: string): string;
const UpdSQL = 'Update ObjectLinks set MainObjectId = %d, MainTableName = ''%s'' ' +
  'where LinkId = %d';
begin
  Result := Format(UpdSQL, [MainObjectId, MainTableName, LinkId]);
end;

procedure TDMServ.DriveNoteQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcMemo').asString := DataSet.FieldByName('MEMO').AsVariant;
end;

function TDMServ.GetPartners_ContractDocsStoreFolder(
  const Company: String): String;
begin
  Result := IncludeTrailingBackslash(GetPartners_DocsStoreFolder(Company)) + '6' + PathDelim;
  ForceDirectories(Result);
end;

function TDMServ.myStoreFileName(var Fldr, Subj: string; ReferId,
  TypeFolder: Integer; aSaveExtPdf: Boolean = False): Boolean;
begin
  MakeDocStoreFileName(Fldr, Subj, ReferId, TypeFolder);
  Result := Fldr <> EmptyStr;
  StoreFileName := Subj;
end;

procedure TDMServ.PrepareMainSqlCompanyQuery;
begin
  if Elem_COMPANYQRY.DB is TADOQuery then
  begin
    TADOQuery(Elem_COMPANYQRY.DB).SQL.Text := CompanyQry.SQL.Text;
    Elem_COMPANYQRY.MainSQL := CompanyQry.SQL.Text;
  end
  else
  if Elem_COMPANYQRY.DB is TIBCustomDataSet then
  begin
    TIBQuery(Elem_COMPANYQRY.DB).SQL.Text := CompanyQry.SQL.Text;
    Elem_COMPANYQRY.MainSQL := CompanyQry.SQL.Text;
  end
end;

{procedure TDMServ.InitDynamicElements;
begin
  Elem_Admin_unitQry := TDBShemaView.Create( DMServDic.Admin_unitQry, ViewAdminUnit, 'Admin_unit', 'ID', 'gen_admin_unit_id' );
  Elem_Admin_unitQry.AddTranslateTable( 'ADMIN_UNIT_LNG', 'NAME', 'ID_ADMIN_UNIT','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );
  Elem_Admin_unitQry.ViewList := ViewAdminUnitList;
end;   }

procedure FunctionPrepareCOUNTRY_TEMPL_ADM_UNITQryUpdateForm(Sender:TObject);
begin
  Elem_CITY_ADM_UNT_ITEMS_TYPEQry.DB.Locate(Elem_CITY_ADM_UNT_ITEMS_TYPEQry.FieldKod,Elem_COUNTRY_TEMPL_ADM_UNITQry.DB.FieldByName('id_city_adm_unt_items_type').Value,[]);
end;

procedure TDMServ.InitElements;
var LogFieldNames : TLogFields;
    aProgres:TProgressFormProp;
begin
  try
    try
      aProgres := ShowProgress( WaitFormCaption ,-1);
      LogFieldNames := GetStructRecLogFiles;

      Elem_UsersQry := TDBShemaView.Create( DMServDic.UsersQry, nil, 'TMUSERS_INFO', 'ID', 'gen_tmusers_info_id' );
      Elem_UsersQry.ViewList := DMServDic.ViewManagesList;
      Elem_UsersQry.DS :=  DMServDic.UsersSrc;

      Elem_BrCountryQry := TDBShemaView.Create( DMServDic.BrCountryQry, DMServDic.ViewBrCountry, 'COUNTRIES', 'COUNTRYID', 'countries_gen' );
      Elem_BrCountryQry.SetDefaultValue( ['ACTUAL','SHENGEN','PHONECODEUNI','NEEDVISA'] , ['F','F','F','F'] );
      Elem_BrCountryQry.AddTranslateTable( 'COUNTRIES_LNG', 'NAME', 'ID_COUNTRIES','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );
      Elem_BrCountryQry.ViewList := DMServDic.ViewBrCountryList;

      Elem_BrCountryHaveHotelsQry := TDBShemaView.Create( DMServ.CountriesHaveHotelsQry, DMServ.ViewCoutriesHaveHotels, 'COUNTRIES', 'COUNTRYID', 'countries_gen' );//countries have hotels
      Elem_BrCountryHaveHotelsQry.SetDefaultValue( ['ACTUAL','SHENGEN','PHONECODEUNI','NEEDVISA'] , ['F','F','F','F'] );
      Elem_BrCountryHaveHotelsQry.AddTranslateTable( 'COUNTRIES_LNG', 'NAME', 'ID_COUNTRIES','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );
      Elem_BrCountryHaveHotelsQry.ViewList := DMServ.ViewCountriesHaveHotelList;

      Elem_DRVKINDQry := TDBShemaView.Create( DMServDic.DrvKindsQry, nil, 'DRVKINDS', 'DRIVEKIND', 'DRVKINDS_GEN' );
      Elem_DRVKINDQry.ViewList := DMServDic.ViewDrvKindList;

      Elem_SERVGROUPQry := TDBShemaView.Create( DMServDic.ServGroupQry, DMServDic.ViewServGroup, 'SERVGROUPS', 'SERVICEGROUPID', 'SERVGROUPS_GEN' );
      Elem_SERVGROUPQry.ViewList := DMServDic.ViewServGroupList;
      Elem_SERVGROUPQry.AddTranslateTable( 'SERVGROUPS_LNG', 'SERVICEGROUPNAME', 'ID_SERVGROUPS','ID_LNG','CHANGE_SERVICEGROUPNAME', nLocalLang );

      Elem_REKLAMAQry  := TDBShemaView.Create( ReklamaQry, nil, 'REKLAMA', 'REKLAMAID', 'REKLAMA_GEN' );
      Elem_BuildsQry := TDBShemaView.Create( DMServDic.BuildsQry, DMServDic.ViewHOTEL_BUILDS, 'HOTEL_BUILDS', 'ID', 'gen_hotel_builds_id' );
      Elem_BuildsQry.ViewList := DMServDic.ViewHOTEL_BUILDSList;
      Elem_BuildsQry.AddTranslateTable( 'HOTEL_BUILDS_LNG', 'NAME', 'ID_HOTEL_BUILDS','ID_LNG','CHANGE_NAME', nLocalLang, -1, -1 );

      Elem_HTLCATEGQry := TDBShemaView.Create( DMServDic.HTLCATEGQry, nil, 'HTLCATEG', 'HOTELCATEGID', 'HTLCATEG_GEN' );
      Elem_HTLGRPQry   := TDBShemaView.Create( DMServDic.HtlGrpQry, DMServDic.ViewHtlGrp, 'HTLGRPS', 'HOTELGROUPID', 'HTLGRPS_GEN' );

      Elem_BrDrvKindQry := TDBShemaView.Create( DMServDic.BrDrvKindQry, DMServDic.ViewBrDrvKind, 'DrvKinds', 'DRIVEKIND', 'drvkinds_gen' );

      Elem_BrDriveQry := TDBShemaView.Create( BrDriveQry, ViewBrDrive, 'DRIVE', 'DRIVEID', 'DRIVE_GEN' );
      Elem_BrDriveQry.AddMainElem( Elem_BrDRVKINDQry, 'DRIVEKIND' );
      Elem_BrDriveQry.SetTableAlies('D');

      Elem_DrvSrvLnkQry := TDBShemaView.Create( DrvSrvLnkQry, ViewDrvSrvLnk, 'DRVSERVLINKS', 'LINKID', 'DRVSERVLINKS_GEN' );
      Elem_DrvSrvLnkQry.ViewList := ViewDrvSrvLnkList;
      Elem_DrvSrvLnkQry.AddMainElem( Elem_BrDriveQry, 'DRIVEID' );
      Elem_DrvSrvLnkQry.SetDefaultValue( ['HAVECOST'],[-1] );
      Elem_DrvSrvLnkQry.SetTableAlies('L');

      Elem_DriveFloorTotalQry := TDBShemaView.Create( DriveFloorTotalQry, nil, 'DRVMAPS', 'PLACEMAPID', 'DRVMAPS_GEN' );

      Elem_COMPACCOUNTQry := TDBShemaView.Create( COMPACCOUNTQry, nil, 'COMPACCOUNTS', 'ACCOUNTID', 'COMPACCOUNTS_GEN' );
      //Elem_BANKMQry := TDBShemaView.Create( BankMQry, nil, 'BANKS', 'BANKID', 'BANKS_GEN' );

      Elem_BankLookQry := TDBShemaView.Create( BankLookQry, nil, 'BANKS', 'BANKID', 'BANKS_GEN' );
      Elem_ANKETTEMPQry := TDBShemaView.Create( AnketTempQry, nil, 'TOURISTTEMPLATES', 'TOURISTTEMPLATEID', 'TOURISTTEMPLATES_GEN' );

      Elem_BrDrvMapQry := TDBShemaView.Create( BrDrvMapQry, nil, 'DRVMAPS', 'PLACEMAPID', 'DRVMAPS_GEN' );
      Elem_BrDrvMapQry.AddMainElem(Elem_BrDriveQry, 'DRIVEID' );

     // Elem_SHEMA_VEHICLE := TDBShema.Create( SHEMA_VEHICLE,  'SHEMA_VEHICLE', 'ID', 'gen_shema_vehicle_id' );
     // Elem_SHEMA_VEHICLE.AddMainElem( Elem_BrDrvMapQry, 'ID_DRVMAPS');

      Elem_SHEMA_VEHICLE_DETAIL := TDBShema.Create( SHEMA_VEHICLE_DETAIL,  'SHEMA_VEHICLE_DETAIL', 'ID', 'gen_shema_vehicle_detail_id' );
      Elem_SHEMA_VEHICLE_DETAIL.AddMainElem( Elem_BrDrvMapQry, 'ID_DRVMAPS' );

      Elem_HtlBuildQry := TDBShemaView.Create( DMServDic.HtlBuildQry, DMServDic.ViewHtlBuild, 'HTLBUILDS', 'HOTELBUILDID', 'HTLBUILDS_GEN' );
      Elem_HtlBuildQry.SetTableAlies('H');
      Elem_HtlRoomQry  := TDBShemaView.Create( DMServDic.HtlRoomQry, DMServDic.ViewHtlRoom, 'HTLROOMS', 'HOTELROOMID', 'HTLROOMS_GEN' );
      Elem_HtlRoomQry.AddMainElem( Elem_HtlBuildQry, 'BuildId' );
      Elem_HtlRoomQry.SetTableAlies('H');

      Elem_SERVICEQry := TDBShemaView.Create( DMServDic.ServicesQry, DMServDic.ViewServices, 'SERVICES', 'SERVICEID', 'SERVICES_GEN' );
      Elem_SERVICEQry.AddMainElem( Elem_SERVGROUPQry, 'SERVGROUPID' );
      Elem_SERVICEQry.ViewList := DMServDic.ViewHtlServList;
      Elem_SERVICEQry.AddTranslateTable( 'SERVICES_LNG', 'NAME', 'ID_SERVICES','ID_LNG','CHANGE_NAME', nLocalLang );

      Elem_HCityQry := TDBShemaTree.Create( DMServDic.HCityQry, nil , '', 'ID' );     //  DMServDic.ViewBrCityHotels Видалити
      //Elem_HCityQry.AddMainElem( Elem_BrCountryQry, 'ID_COUNTRY');
      Elem_HCityQry.AddMainElem( Elem_BrCountryHaveHotelsQry, 'ID_COUNTRY');//show countries have hotels
      Elem_HCityQry.AddVirtualTreeParam('ID_PARENT',DMServDic.TreeHotelCityAdmUnit, False, DmServDic.MyStyleTree );

      Elem_BrHotelQry := TDBShemaView.Create( DMServDic.BrHotelQry, DMServDic.ViewBrHotel, 'HOTELS', 'HOTELID', 'HOTELS_GEN' );
      Elem_BrHotelQry.AddTranslateTable( 'HOTELS_LNG', 'NAME', 'ID_HOTELS','ID_LNG','CHANGE_NAME', nLocalLang, -1, 12 );
      Elem_BrHotelQry.AddMainElem(Elem_HCityQry , 'ID_CITY_ADM_UNIT');
      //Elem_BrHotelQry.AddPopUpMenuOnViewField( 'NAME',PopupMenuCopyNameHotel,mbRight );
      Elem_BrHotelQry.SetTableAlies('H');

      Elem_HtlImgQry := TDBShemaView.Create( DMServDic.HtlImgQry, nil, 'HTLIMAGES', 'HOTELIMAGEID', 'htlimages_gen', 'ORDERNO' );
      Elem_HtlImgQry.AddMainElem( Elem_BrHotelQry, 'HOTELID' );
      Elem_HtlImgQry.SetDefaultValue(['TABLEID','SHOWLOC','SHOWWEB'],[0,True, True]);

      Elem_HtlVendorQry := TDBShemaView.Create( DMServDic.HtlVendorQry, DMServDic.ViewHtlVendor, 'HTLVENDORS', 'HOTELVENDORID', 'HTLVENDORS_GEN' );
      Elem_HtlVendorQry.AddMainElem( Elem_BrHotelQry, 'HOTELID' );
      Elem_HtlVendorQry.SetTableAlies('H');

      Elem_HotelKindQry :=TDBShemaView.Create( DMServDic.HotelKindQry, DMServDic.ViewHtkKind, 'HOTELKIND', 'ID', 'gen_hotelkind_id','AORDER' );
      Elem_HotelKindQry.ViewList := DMServDic.ViewHotelKind;
      Elem_HotelKindQry.AddTranslateTable( 'HOTELKIND_LNG', 'NAME', 'ID_HOTELKIND','ID_LNG','CHANGE_NAME', nLocalLang, -1, -1 );

      Elem_HotelCLASSQry :=TDBShemaView.Create( DMServDic.HOTELCLASSQry, DMServDic.ViewHotelClassDic, 'HOTELCLASS', 'ID', 'gen_hotelclass_id' );
      Elem_HotelCLASSQry.ViewList := DMServDic.ViewHotelClassList;
      Elem_HotelCLASSQry.AddTranslateTable( 'HOTELCLASS_LNG', 'NAME', 'ID_HOTELCLASS','ID_LNG','CHANGE_NAME', nLocalLang, -1, -1 );

      Elem_RoomTypeQry:= TDBShemaView.Create( DMServDic.RoomTypeQry, DMServDic.ViewRoomTypeQry, 'ROOMTYPES', 'ROOMTYPEID', 'ROOMTYPES_GEN');
      Elem_RoomTypeQry.ViewList := DMServDic.ViewRoomTypeQryList;
      Elem_RoomTypeQry.AddTranslateTable( 'ROOMTYPES_LNG', 'ROOMTYPE', 'ID_ROOMTYPES','ID_LNG','CHANGE_ROOMTYPE', nLocalLang, -1, -1 );
      Elem_RoomTypeQry.AddTranslateTable( 'ROOMTYPES_LNG', 'EXTNAME', 'ID_ROOMTYPES','ID_LNG','CHANGE_EXTNAME', nLocalLang, -1, -1 ); 

      Elem_DriveEuroClass :=TDBShemaView.Create( DMServDic.DriveEuroClassQry, DMServDic.ViewDriveEuroClass, 'DRIVEEUROCLASS', 'ID', 'gen_driveeuroclass_id' );
      Elem_DriveEuroClass.ViewList := DMServDic.ViewDriveEuroClassList;

      Elem_Comunication_TypeQry := TDBShemaView.Create( DMServDic.Comunication_TypeQry, DMServDic.ViewComunicationType, 'COMUNICATION_TYPE', 'ID', 'gen_comunication_type_id','AORDER' );
      Elem_Comunication_TypeQry.ViewList := DMServDic.ViewComunicationTypeList;

      Elem_COMPANYQRY := TDBShemaView.Create( CompanyQry, ViewCompany, 'COMPANIES', 'COMPANYID', 'COMPANIES_GEN' );
      Elem_COMPANYQRY.DBQuerySetParamValue('COMPANYID',0);
      Elem_COMPANYQRY.SetTableAlies('COMPANIES');

      Elem_CompEnterpriseHoteQry :=TDBShemaView.Create( CompEnterpriseHoteQry, nil, 'COMPANIES', 'COMPANYID', 'COMPANIES_GEN' );

      Elem_SelHeadDataQuery := TDBShema.Create( SelHeadDataQry, '', 'COMPANYID', '' );

      Elem_COMPANIES_PARAM_KIND := TDBShemaView.Create( DMServDic.COMPANIES_PARAM_KIND, DMServDic.ViewCOMPANIES_PARAM_KIND, 'COMPANIES_PARAM_KIND' ,'ID', 'gen_companies_param_kind_id', 'AORDER' );
      Elem_COMPANIES_PARAM_KIND.ViewList := DMServDic.ViewCOMPANIES_PARAM_KINDList;

      Elem_COMPANIES_PARAM_NAME :=  TDBShemaView.Create( DMServDic.COMPANIES_PARAM_NAME, DMServDic.ViewCOMPANIES_PARAM_NAME, 'COMPANIES_PARAM_NAME' ,'ID', 'gen_companies_param_name_id' );
      Elem_COMPANIES_PARAM_NAME.ViewList := DMServDic.ViewCOMPANIES_PARAM_NAMEList;

      Elem_COMPANIES_PARAM_DATA :=  TDBShemaView.Create( COMPANIES_PARAM_DATA,nil, 'COMPANIES_PARAM_DATA' ,'ID', 'gen_companies_param_data_id' );
      Elem_COMPANIES_PARAM_DATA.DS := COMPANIES_PARAM_DATASrc;
      Elem_COMPANIES_PARAM_DATA.ViewList := ViewCOMPANIES_PARAM_DATAList;
      Elem_COMPANIES_PARAM_DATA.AddMainElem( Elem_COMPANYQRY, 'ID_COMPANIES' );
      Elem_COMPANIES_PARAM_DATA.SetUniqFieldNames(['ID_COMPANIES_PARAM_NAME']);

      //Elem_COMPCORRACCNTQry := TDBShemaView.Create( COMPCORRACCNTQry, nil, 'COMPACCOUNTS', 'ACCOUNTID', 'COMPACCOUNTS_GEN' );
      //Elem_COMPCORRACCNTQry.AddMainElem(Elem_COMPANYQRY, 'COMPANYID' );

      Elem_COMP_CONTRACTS_KINDQry := TDBShemaView.Create( DMServDic.COMP_CONTRACTS_KINDQry, DMServDic.ViewCompContractKind, 'COMP_CONTRACTS_KIND', 'ID', 'gen_comp_contracts_kind_id', 'AORDER');
      Elem_COMP_CONTRACTS_KINDQry.ViewList := DMServDic.ViewCompContractKindList;

      Elem_CompContractNumsQry := TDBShema.Create( CompContractNumsQry, 'CompContractNums', 'COMPCONTRACTNUMID', 'gen_compcontractnums_id' );

      Elem_CountryCompQry := TDBShemaView.Create( CountryCompQry, nil, 'COUNTRIES', 'COUNTRYID', 'COUNTRIES_GEN' );
      Elem_CountryCompQry.ViewList := ViewCompanyCountry;

      Elem_CityCompanyQry := TDBShemaView.Create( CityCompanyQry, nil, 'CITY_ADM_UNIT', 'ID', 'gen_city_adm_unit_id' );
      Elem_CityCompanyQry.ViewList := ViewCompanyCity;
      Elem_CurrencyQry := TDBShemaView.Create( DMServDic.CurrencyQry, DMServDic.ViewCurrency, 'CURRENCY', 'CURRENCYID', 'CURRENCY_GEN' );
      Elem_CurrencyQry.ViewList := DMServDic.ViewCurrencyList;
      Elem_CurrencyQry.AddTranslateTable( 'CURRENCY_LNG', 'CURRENCYNAME', 'ID_CURRENCY','ID_LNG','CHANGE_CURRENCYNAME', nLocalLang,  120,4 );
      Elem_CurrencyQry.AddTranslateTable( 'CURRENCY_LNG', 'COINS', 'ID_CURRENCY','ID_LNG','CHANGE_COINS', nLocalLang, 120, 4 );

      Elem_CurrencyMainQry := TDBShemaView.Create( DMServDic.CurrencyMainQry, nil, 'CURRENCY', 'CURRENCYID', 'CURRENCY_GEN' );
      Elem_CurrencyMainQry.ViewList := DMServDic.ViewCurrencyMainList;
      Elem_HTLDOCQry := TDBShemaView.Create( DMServDic.HTLDOCQry, DMServDic.ViewHotelDoc, 'HTLDOCUMENTS', 'HOTELDOCID', 'HTLDOCUMENTS_GEN', '' );    //ORDERNO
      Elem_HTLDOCQry.AddMainElem( Elem_BrHotelQry, 'HOTELID' );

      Elem_HtlSrvLnkQry := TDBShemaView.Create( DMServDic.HtlSrvLnkQry, DMServDic.ViewHtlSrvLnk, 'HTLSERVLNK', 'LINKID', 'HTLSERVLNK_GEN' );
      Elem_HtlSrvLnkQry.ViewList := DMServDic.ViewHtlSrvLnkList;
      Elem_HtlSrvLnkQry.AddMainElem( Elem_BrHotelQry, 'HOTELID' );
      Elem_HtlSrvLnkQry.SetDefaultValue( ['HAVECOST'],[-1] );

      Elem_BldSrvLnkQry := TDBShemaView.Create( DMServDic.BldSrvLnkQry, DMServDic.ViewBldSrvLnk, 'HBLDSERVLNK', 'LINKID', 'HBLDSERVLNK_GEN' );
      Elem_BldSrvLnkQry.ViewList := DMServDic.ViewBldSrvLnkList;
      Elem_BldSrvLnkQry.AddMainElem( Elem_HtlBuildQry, 'HOTELBUILDID' );
      Elem_BldSrvLnkQry.SetDefaultValue( ['HAVECOST'],[-1] );

      Elem_RoomSrvLnkQry := TDBShemaView.Create( DMServDic.RoomSrvLnkQry, nil, 'ROOMSERVLNK', 'LINKID', 'ROOMSERVLNK_GEN' );
      Elem_RoomSrvLnkQry.ViewList := DMServDic.ViewRoomSrvLnkList;
      Elem_RoomSrvLnkQry.AddMainElem( Elem_HtlRoomQry, 'HotelRoomId' );
      Elem_RoomSrvLnkQry.SetDefaultValue( ['HAVECOST'],[-1] );

      //Elem_EmployeeQry := TDBShemaView.Create( EmployeeQry, nil, 'COMPPERSONS', 'PERSONID', 'COMPPERSONS_GEN' );
      Elem_BankQry := TDBShemaView.Create( DMServDic.BankQry, DMServDic.ViewBank, 'BANKS', 'BANKID', 'BANKS_GEN' );
      Elem_InterestQry := TDBShemaView.Create( InterestQry, nil, 'INTERESTS', 'INTERESTID', 'INTERESTS_GEN' );
      //Elem_ICityQry := TDBShemaView.Create( ICityQry, nil, 'INTERESTS', 'INTERESTID', 'INTERESTS_GEN' );
      //Elem_IntrstSrvLnkQry := TDBShemaView.Create( IntrstSrvLnkQry, nil, 'INTRSTSERVLNK', 'LINKID', 'INTRSTSERVLNK_GEN' );
      Elem_IntrstVendorQry := TDBShemaView.Create( IntrstVendorQry, nil, 'INTRSTVENDORS', 'INTERESTVENDORID', 'INTRSTVENDORS_GEN' );
      Elem_INTRSTIMGQry := TDBShemaView.Create( IntrstImgQry, nil, 'INTRSTIMAGES', 'INTERESTIMAGEID', 'INTRSTIMAGES_GEN' );
      Elem_INTRSTIMGQry.AddMainElem( Elem_InterestQry, 'INTERESTID' );

      //Elem_CompChkEntQry := TDBShemaView.Create( CompChkEntQry, nil, 'HOTELS', 'HOTELID', 'HOTELS_GEN' );
      Elem_DRVIMGQry := TDBShemaView.Create( DRVIMGQry, nil, 'DRVIMAGES', 'DRIVEIMAGEID', 'DRVIMAGES_GEN','ORDERNO' );
      Elem_DRVIMGQry.AddMainElem( Elem_BrDriveQry, 'DRIVEID' );

      Elem_DrvVendorQry := TDBShemaView.Create( DrvVendorQry, ViewDrvVendor, 'DRVVENDORS', 'DRIVEVENDORID', 'DRVVENDORS_GEN' );
      Elem_DrvVendorQry.AddMainElem( Elem_BrDriveQry, 'DRIVEID' );
      Elem_DrvVendorQry.SetTableAlies( 'V' );

      Elem_SelectVendor:= TDBShemaView.Create( SelectVendor, ViewDrvVendor, 'COMPANIES', 'COMPANYID', 'COMPANIES_GEN' );
      Elem_SelectVendor.ViewList := ViewSelectVendorList;

      Elem_VisaDocGroupsQry := TDBShemaView.Create( VisaDocGroupsQry, nil, 'VisaDocGroups_View', 'VISADOCGROUPID', 'NAMELISTS_GEN', 'SORTORDER' );
      Elem_VisaDocSubGroupsQry := TDBShemaView.Create( VisaDocSubGroupsQry, nil, 'SubGroup_View', 'SUBGROUPID', 'NAMELISTS_GEN', 'SORTORDER' );

      Elem_DocumVisaQry := TDBShemaView.Create( DMServDic.DocumVisaQry, DMServDic.ViewVisaDoc, 'VISADOC', 'ID', 'gen_visadoc_id', 'ORDERINCATEGORY' );
      Elem_VisaDocumentsQry := TDBShemaView.Create( VisaDocumentsQry, nil, 'VISADOCUMENTS_NEW', 'VISADOCUMENTID', 'VISADOCUMENTS_GEN' );
      Elem_VISADOCUMENTS_NEWQry := TDBShemaView.Create( VISADOCUMENTS_NEWQry, nil, 'VISADOCUMENTS_NEW', 'VISADOCUMENTID', 'VISADOCUMENTS_NEW_GEN' );
      Elem_ItsDocumVisaListQry := TDBShemaView.Create( ItsDocumVisaListQry, View_EmbassyDocumDlg_UsedDocsDBGrid, 'VISADOCUMENTS_NEW', 'VISADOCUMENTID', 'VISADOCUMENTS_NEW_GEN' );

      Elem_AllDocQry := TDBShemaView.Create( AllDocQry, nil, 'VISADOCUMENTS_NEW', 'VISADOCUMENTID', 'VISADOCUMENTS_NEW_GEN' );

      Elem_SelPartnersQry := TDBShemaView.Create( SelPartnersQry, View_EmbassyDocumDlg_SelPartnerDBGrid, 'PARTNERS', 'PARTNERID', 'GEN_PARTNERS_ID' );
      Elem_TAXSYSTEMQry := TDBShemaView.Create( DMServDic.TaxSystemQry, DMServDic.ViewTaxSystem, 'TAXSYSTEM', 'TAXSYSTEMID', 'GEN_TAXSYSTEM_ID' );
      Elem_TAXSYSTEMDetailQry := TDBShemaView.Create( DMServDic.TaxSystemDetailsQry, DMServDic.ViewTaxSystemDetail, 'TaxSystemDetails', 'TAXDETAILID', 'gen_taxsystemdetails_id' );
      Elem_SelTaxSystemQry := TDBShemaView.Create( SelTaxSystemQry, nil, '', 'TaxDetailId', '' );
      Elem_SelTaxSystemQry.ViewList := ViewSelTaxSystemList;

      Elem_CompanyNotesQry := TDBShemaView.Create( CompanyNotesQry, ViewCompNotesBlackListVip, 'CompanyNotes', 'CompanyNoteId', 'gen_companynotes_id' );
      Elem_CompanyNotesQry.AddMainElem( Elem_COMPANYQRY,'COMPANYID' );

      Elem_SelItsPersonQry := TDBShemaView.Create( SelItsPersonQry, nil, 'COMPPERSONS', 'PERSONID', 'COMPPERSONS_GEN' );
      Elem_LastNoteQry := TDBShemaView.Create( LastNoteQry, nil, 'COMPNOTES', 'COMPNOTEID', 'COMPNOTES_GEN' );
      Elem_SelCompCntrctsQry := TDBShemaView.Create( SelCompCntrctsQry, nil, 'COMPANIES', 'COMPANYID', 'COMPANIES_GEN' );
      Elem_CompanyDocsQry := TDBShemaView.Create( CompanyDocsQry, ViewCompanyDocs, 'CategoryDocs', 'CategoryId', '' );
      Elem_CompanyDocsQry.DS := CompanyDocsSrc;

      Elem_CheckRoomQry := TDBShemaView.Create( CheckRoomQry, nil, 'HTLROOMS', 'HOTELROOMID', 'HTLROOMS_GEN' );

      Elem_NaturObjQry := TDBShemaView.Create( DMServDic.NaturObjQry, DMServDic.ViewNaturObj, 'CITY_ADM_UNIT', 'ID', 'gen_city_adm_unit_id' );
      Elem_NaturObjQry.ViewList := DMServDic.ViewNaturObjList;
      Elem_NaturObjQry.AddMainElem(Elem_BrCountryQry, 'ID_COUNTRY');
      Elem_NaturObjQry.AddTranslateTable( 'CITY_ADM_UNIT_LNG', 'NAME', 'ID_CITY_ADM_UNIT','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );

      Elem_RoomVariantQry := TDBShemaView.Create( DMServDic.RoomVariantQry, DMServDic.ViewRoomVarian,'HtlRoomVariants', 'VARIANTID', 'gen_htlroomvariants_id' );
      Elem_RoomVariantQry.AddMainElem(Elem_HtlRoomQry,'HTLROOMID');
      Elem_RoomVariantQry.ViewList := DMServDic.ViewRoomVariantList;

      Elem_RoomBedQry := TDBShemaView.Create( DMServDic.RoomBedQry, DMServDic.ViewRoomBed, 'HTLROOMBEDS', 'BEDID', 'GEN_HTLROOMBEDS_ID' );
      Elem_RoomBedQry.AddMainElem( Elem_RoomVariantQry, 'VARIANTID');

      Elem_BedTypeQry := TDBShemaView.Create( DMServDic.BedTypeQry, DMServDic.ViewBedType, 'BEDTYPES', 'BEDTYPEID', 'GEN_BEDTYPES_ID' );
      Elem_BedTypeQry.ViewList := DMServDic.ViewBedTypeList;
      Elem_BedTypeQry.AddTranslateTable( 'BEDTYPES_LNG', 'NAME', 'ID_BEDTYPES','ID_LNG','CHANGE_NAME', nLocalLang, -1, -1 );
      Elem_BedTypeQry.AddTranslateTable( 'BEDTYPES_LNG', 'SHORTNAME', 'ID_BEDTYPES','ID_LNG','CHANGE_SHORTNAME', nLocalLang, -1, -1 );

      Elem_InfraQry := TDBShemaView.Create( DMServDic.InfraQry, DMServDic.ViewInfra, 'CITY_ADM_UNIT', 'ID', 'gen_city_adm_unit_id' );
      Elem_InfraQry.AddMainElem(Elem_BrCountryQry, 'ID_COUNTRY');
      Elem_InfraQry.AddTranslateTable( 'CITY_ADM_UNIT_LNG', 'NAME', 'ID_CITY_ADM_UNIT','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );
      Elem_InfraQry.ViewList := DMServDic.ViewInfraList;

      Elem_DriveNoteQry := TDBShemaView.Create( DriveNoteQry, nil, 'DRIVENOTES', 'DRIVENOTEID', 'GEN_DRIVENOTES_ID' );
      Elem_ItsKonsulQry := TDBShemaView.Create( DMServDic.ItsKonsulQry, nil, 'CNTREMBASSIES', 'CNTREMBASSYID', 'CNTREMBASSIES_GEN' );
      Elem_SelVisaCentersQry := TDBShemaView.Create( SelVisaCentersQry, View_EmbassyDocumDlg_VisaCenterDBGrid, 'CNTREMBASSIES', 'CNTREMBASSYID', 'CNTREMBASSIES_GEN' );
      //Elem_ItDesriptQry := TDBShemaView.Create( DMServIB.ItDesriptQry, nil, 'ITEM_DESCRIPTION', 'DESCRIPTID', 'GEN_ITEM_DESCRIPTION_ID' );

      Elem_CITY_ADM_UNT_ITEMS_TYPEQry := TDBShemaView.Create( DMServDic.CITY_ADM_UNT_ITEMS_TYPEQry, DMServDic.ViewCITY_ADM_UNT_ITEMS_TYPE, 'CITY_ADM_UNT_ITEMS_TYPE', 'ID', 'gen_city_adm_unt_items_type_id', 'AORDER' );
      Elem_CITY_ADM_UNT_ITEMS_TYPEQry.ViewList := DMServDic.ViewCITY_ADM_UNT_ITEMS_TYPEList;

      Elem_Admin_unitQry := TDBShemaView.Create( DMServDic.Admin_unitQry, DMServDic.ViewAdminUnit, 'Admin_unit', 'ID', 'gen_admin_unit_id' );
      Elem_Admin_unitQry.AddTranslateTable( 'ADMIN_UNIT_LNG', 'NAME', 'ID_ADMIN_UNIT','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );
      Elem_Admin_unitQry.AddTranslateTable( 'ADMIN_UNIT_LNG', 'NAMESHORT', 'ID_ADMIN_UNIT','ID_LNG','CHANGE_NAMESHORT', nLocalLang, -1, 0 );
      Elem_Admin_unitQry.ViewList := DMServDic.ViewAdminUnitList;
      Elem_Admin_unitQry.AddMainElem( Elem_CITY_ADM_UNT_ITEMS_TYPEQry, 'ID_CITY_ADM_UNT_ITEMS_TYPE' );

      Elem_Admin_unit_SubQry := TDBShemaView.Create( DMServDic.ADMIN_UNIT_SUBQry, DMServDic.ViewAdminUnitSub, 'ADMIN_UNIT_SUB', 'ID', 'gen_admin_unit_sub_id','AORDER' );
      Elem_Admin_unit_SubQry.AddMainElem(Elem_Admin_unitQry, 'ID_ADMIN_UNIT' );
      Elem_Admin_unit_SubQry.AddTranslateTable( 'ADMIN_UNIT_SUB_LNG', 'NAME', 'ID_ADMIN_UNIT_SUB','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );
      Elem_Admin_unit_SubQry.ViewList := DMServDic.ViewAdminUnitSubList;

      Elem_COUNTRY_TEMPL_ADM_UNITQry := TDBShemaTree.Create( DMServDic.COUNTRY_TEMPL_ADM_UNITQry, nil, 'COUNTRY_TEMPL_ADM_UNIT', 'ID', 'gen_country_templ_adm_unit_id' );
      Elem_COUNTRY_TEMPL_ADM_UNITQry.addMainElem(Elem_BrCountryQry, 'ID_COUNTRY');
      Elem_COUNTRY_TEMPL_ADM_UNITQry.AddVirtualTreeParam( 'ID_PARENT', DMServDic.TreeCOUNTRY_TEMPL_ADM_UNIT, True, DmServDic.MyStyleTree );
      Elem_COUNTRY_TEMPL_ADM_UNITQry.AddDrawCellTree( DBTreeListCountryTemplateAdmUnitCustomDrawDataCell );
      Elem_COUNTRY_TEMPL_ADM_UNITQry.FunctionPrepareUpdateForm := FunctionPrepareCOUNTRY_TEMPL_ADM_UNITQryUpdateForm;

      Elem_City_Admin_UnitRegionQry := TDBShemaTree.Create( DMServDic.City_Admin_UnitRegionQry, nil, 'CITY_ADM_UNIT', 'ID', 'gen_city_adm_unit_id' );
      Elem_City_Admin_UnitRegionQry.addMainElem(Elem_BrCountryQry, 'ID_COUNTRY');
      Elem_City_Admin_UnitRegionQry.AddVirtualTreeParam( 'ID_PARENT', DMServDic.TreeCity_Admin_UnitRegion, True, DmServDic.MyStyleTree );
      Elem_City_Admin_UnitRegionQry.AddTranslateTable( 'CITY_ADM_UNIT_LNG', 'NAME', 'ID_CITY_ADM_UNIT','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );
      Elem_City_Admin_UnitRegionQry.SetTableAlies('C');

      Elem_City_Admin_Unit := TDBShemaTree.Create( DMServDic.City_Admin_Unit, nil, 'CITY_ADM_UNIT', 'ID', 'gen_city_adm_unit_id' ); // ViewCityAdminUnit
      Elem_City_Admin_Unit.DS := DMServDic.City_Admin_UnitSrc;
      Elem_City_Admin_Unit.AddMainElem(Elem_BrCountryQry, 'ID_COUNTRY');
      Elem_City_Admin_Unit.AddReletionTopElem( Elem_City_Admin_UnitRegionQry, 'ID_MAIN_PARENT' );
      Elem_City_Admin_Unit.AddVirtualTreeParam('ID_PARENT',DMServDic.TreeCity_Admin_Region, True, DmServDic.MyStyleTree);
      Elem_City_Admin_Unit.AddTranslateTable( 'CITY_ADM_UNIT_LNG', 'NAME', 'ID_CITY_ADM_UNIT','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );

      Elem_CITY_ADM_UNIT_INFOQry := TDBShemaView.Create( DMServDic.CITY_ADM_UNIT_INFOQry, nil, 'CITY_ADM_UNIT_INFO', 'ID', 'gen_city_adm_unit_info_id' );

      Elem_CITY_ADM_UNIT_SUB_RELQry :=  TDBShema.Create( DMServDic.CITY_ADM_UNIT_SUB_RELQry,  'CITY_ADM_UNIT_SUB_REL', 'ID', 'gen_city_adm_unit_sub_rel_id' );
      Elem_CITY_ADM_UNIT_SUB_RELQry.AddMainElem( Elem_City_Admin_Unit, 'ID_CITY_ADM_UNIT' );
      Elem_CITY_ADM_UNIT_SUB_RELQry.AskBeforeDelete := False;

      Elem_City_ADM_UnitImgQry := TDBShemaView.Create( DMServDic.City_Admin_UnitImgQry, nil, 'CITY_ADM_UNIT_IMG', 'ID', 'gen_city_adm_unit_img_id','AORDER' );
      Elem_City_ADM_UnitImgQry.AddMainElem( Elem_City_Admin_Unit, 'ID_CITY_ADM_UNIT' );

      Elem_COUNTRIES_TYPE_INFO:=TDBShemaView.Create( DMServDic.COUNTRIES_TYPE_INFO, DMServDic.ViewCountryTypeInfo, 'COUNTRIES_TYPE_INFO', 'ID', 'gen_countries_type_info_id' );
      Elem_COUNTRIES_TYPE_INFO.AddTranslateTable( 'COUNTRIES_TYPE_INFO_LNG','NAME','ID_COUNTRIES_TYPE_INFO','ID_LNG','CHANGE_NAME', nLocalLang );

      Elem_COUNTRIES_INFO := TDBShemaView.Create( DMServDic.COUNTRIES_INFO, nil, 'COUNTRIES_INFO', 'ID', 'gen_countries_info_id' );
      Elem_COUNTRIES_INFO.AddMainElem(Elem_BrCountryQry,'ID_COUNTRIES' );
      Elem_COUNTRIES_INFO.AddTranslateTable( 'COUNTRIES_INFO_LNG', 'AVALUE', 'ID_COUNTRIES_INFO','ID_LNG','CHANGE_AVALUE', nLocalLang );

      Elem_ResortQry := TDBShemaView.Create( DMServDic.ResortQry, DMServDic.ViewResort, 'CITY_ADM_UNIT', 'ID', 'gen_city_adm_unit_id'  );
      Elem_ResortQry.AddMainElem(Elem_BrCountryQry, 'ID_COUNTRY');
      Elem_ResortQry.AddTranslateTable( 'CITY_ADM_UNIT_LNG', 'NAME', 'ID_CITY_ADM_UNIT','ID_LNG','CHANGE_NAME', nLocalLang, -1, 0 );

      Elem_DictSectQry := TDBShemaView.Create( DictSectQry, ViewDictSection, 'DictSections', 'DICTSECTIONID', 'gen_dictsections_id' );
      Elem_DictSectQry.ViewList := ViewDicSectionList;
      Elem_DictSectQry.AddTranslateTable('DICTSECTIONS_LNG','SECTIONNAME','ID_DICTSECTIONS','ID_LNG','CHANGE_SECTIONNAME', nLocalLang );

      Elem_DictSect_ItemQry := TDBShemaView.Create( DictSect_ItemQry, ViewDictSectionItem, 'DictSection_Items', 'ITEMID', 'gen_dictsection_items_id' );
      Elem_DictSect_ItemQry.ViewList := ViewDicSectionItemsList;
      Elem_DictSect_ItemQry.AddMainElem( Elem_DictSectQry, 'DICTSECTIONID' );
      Elem_DictSect_ItemQry.AddTranslateTable('DICTSECTION_ITEMS_LNG','ITEMNAME','ID_DICTSECTION_ITEMS','ID_LNG','CNAHGE_ITEMNAME', nLocalLang );

      Elem_CountrySectDescrQry := TDBShemaTree.Create( DMServDic.CountrySectDescrQry, nil, 'COUNTRY_SECT_DESCRIPTS', 'ID', 'gen_country_sect_descripts_id','AORDER' );
      Elem_CountrySectDescrQry.DS := DMServDic.CountrySectDescrSrc;
      Elem_CountrySectDescrQry.AddTranslateTable('COUNTRY_SECT_DESC_LNG','NAME','ID_COUNTRY_SECT_DESCRIPTS','ID_LNG','CHANGE_NAME', nLocalLang );
                            
      Elem_Language :=  TDBShemaView.Create( DMServDic.Language, DMServDic.ViewLanguageDict, 'LANGUAGES', 'id', 'gen_languages_id' );
      Elem_Language.ViewList := DMServDic.ViewLanguageList;
      Elem_Language.AddTranslateTable('LANGUAGES_LNG','NAME','ID_LANGUAGES','ID_LNG','CHANGE_NAME', nLocalLang );

      Elem_Religion :=  TDBShemaView.Create( DMServDic.Religion, DMServDic.ViewReligionDict, 'Religion', 'id', 'gen_religion_id' );
      Elem_Religion.AddTranslateTable('RELIGION_LNG','NAME','ID_RELIGION','ID_LNG','CHANGE_NAME', nLocalLang );

      Elem_UNIT_MEASUR :=  TDBShemaView.Create( DMServDic.UNIT_MEASUR, DMServDic.ViewUnitMeashur, 'UNIT_MEASUR', 'id', 'gen_unit_measur_id' );
      Elem_UNIT_MEASUR.ViewList := DMServDic.ViewUnitMeasurList;
      Elem_UNIT_MEASUR.AddTranslateTable('UNIT_MEASUR_LNG','NAME','ID_UNIT_MEASUR','ID_LNG','CHANGE_NAME', nLocalLang , 120 );
      Elem_UNIT_MEASUR.AddTranslateTable('UNIT_MEASUR_LNG','ANAMES','ID_UNIT_MEASUR','ID_LNG','CHANGE_ANAMES', nLocalLang,120 );
      Elem_UNIT_MEASUR.AddTranslateTable('UNIT_MEASUR_LNG','SHORT','ID_UNIT_MEASUR','ID_LNG','CHANGE_SHORT', nLocalLang, 50 );

      Elem_SCHEDITEM_TOURS_WEB_TEMPLATE := TDBShemaView.Create( DMServDic.SCHEDITEM_TOURS_WEB_TEMPLATE, DMServDic.ViewTemplTourProgramDic, 'SCHEDITEM_TOURS_WEB_TEMPLATE', 'id', 'gen_scheditem_tours_web_templat' );
      Elem_SCHEDITEM_TOURS_WEB_TEMPLATE.AddTranslateTable('SCHED_TOUR_WEB_TEM_LNG','REPRESENTATION','ID_SCHEDITEM_TOURS_WEB_TEMPLATE','ID_LNG','CHANGE_REPRESENTATION', nLocalLang , -1 );

      Elem_SCHEDITEM_TOURS_WEB_TIME := TDBShemaView.Create( DMServDic.SCHEDITEM_TOURS_WEB_TIME, DMServDic.ViewTemplTimeTourProgramDic, 'SCHEDITEM_TOURS_WEB_TIME', 'id', 'gen_scheditem_tours_web_time_id' );
      Elem_SCHEDITEM_TOURS_WEB_TIME.AddTranslateTable('SCHED_TOUR_WEB_TIME_LNG','REPRESENTATION','ID_SCHEDITEM_TOURS_WEB_TIME','ID_LNG','CHANGE_REPRESENTATION', nLocalLang , -1 );

      Elem_Form_Government :=  TDBShemaView.Create( DMServDic.FORM_GOVERNMENT, DMServDic.ViewFormGovernment, 'FORM_GOVERNMENT', 'id', 'gen_form_government_id' );
      Elem_Form_Government.ViewList := DMServDic.ViewFormGovernmentList;
      Elem_Form_Government.AddTranslateTable('FORM_GOVERNMENT_LNG','NAME','ID_FORM_GOVERNMENT','ID_LNG','CHANGE_NAME', nLocalLang );

      Elem_InternacionalOrg :=  TDBShemaView.Create( DMServDic.INTERNACIONAL_ORG, DMServDic.ViewInternacionalOrgDict, 'INTERNACIONAL_ORG', 'id', 'gen_INTERNACIONAL_org_id' );
      Elem_InternacionalOrg.AddTranslateTable('INTERNACIONAL_ORG_LNG','NAME','ID_INTERNACIONAL_ORG','ID_LNG','CHANGE_NAME', nLocalLang , 120);

      Elem_Country_Holidays :=  TDBShemaView.Create( DMServDic.COUNTRIES_HOLIDAYS, DMServDic.ViewCountriesHolidays, 'COUNTRIES_HOLIDAYS', 'id', 'gen_countries_holidays_id' );
      Elem_Power_Volt_Freq := TDBShemaView.Create( DMServDic.POWER_VOLT_FREQ, DMServDic.ViewPowerVoltFreq, 'POWER_VOLT_FREQ', 'id', 'gen_power_volt_freq_id' );
      Elem_Power_Volt_Freq.ViewList := DMServDic.ViewPowerVoltFreqList;

      Elem_TIME_ZONE := TDBShemaView.Create( DMServDic.TIME_ZONE, DMServDic.ViewTimeZoneDic, 'TIME_ZONE', 'id', 'gen_time_zone_id' );
      Elem_COUNTRIES_MOVE_TIME :=TDBShemaView.Create( DMServDic.COUNTRIES_MOVE_TIME, nil, 'COUNTRIES_MOVE_TIME', 'id', 'gen_countries_move_time_id' );
      Elem_COUNTRIES_MOVE_TIME.AddMainElem(Elem_BrCountryQry,'ID_COUNTRY' );

      Elem_TypePowSockets   :=  TDBShemaView.Create( DMServDic.TYPE_POW_SOCKETS, nil, 'TYPE_POW_SOCKETS', 'id', 'gen_type_pow_sockets_id' );
      Elem_TypePowSockets.ViewList := DMServDic.ViewTypePowerSocket;

      Elem_CAR_TYPE_INFO := TDBShemaView.Create( DMServDic.CAR_TYPE_INFO, DMServDic.ViewCarTypeInfo, 'CAR_TYPE_INFO', 'id', 'gen_car_type_info_id' );
      Elem_CAR_TYPE_INFO.AddTranslateTable('CAR_TYPE_INFO_LNG','NAME','ID_CAR_TYPE_INFO','ID_LNG','CHANGE_NAME', nLocalLang );

      Elem_COUNTRIES_CAR_SPEED_INFO := TDBShemaView.Create( DMServDic.COUNTRIES_CAR_SPEED_INFO, DMServDic.ViewCountriesCarSpeedInfo, 'COUNTRIES_CAR_SPEED_INFO', 'id', 'gen_countries_car_speed_info_id' );
      Elem_COUNTRIES_CAR_SPEED_INFO.AddMainElem( Elem_BrCountryQry,'ID_COUNTRY');

      Elem_CNTREMBASSIES := TDBShemaView.Create( DMServDic.CNTREMBASSIES, DMServDic.ViewCountryEMBASSIES, 'CNTREMBASSIES', 'CNTREMBASSYID', 'CNTREMBASSIES_GEN' );
      Elem_CNTREMBASSIES.AddMainElem( Elem_BrCountryQry, 'COUNTRYID' );

      Elem_LNG_TRANSLATE_TEMPLATE := TDBShemaView.Create( DMServDic.LNG_TRANSLATE_TEMPLATE, DMServDic.ViewLngTranslateTemplateDic, 'LNG_TRANSLATE_TEMPLATE', 'ID', 'gen_lng_translate_template_id' );
      Elem_LNG_TRANSL_TEMP_DETAIL := TDBShemaView.Create( DMServDic.LNG_TRANSL_TEMP_DETAIL, DMServDic.ViewLngTranslateTemplateDetailDic, 'LNG_TRANSL_TEMP_DETAIL','ID','gen_lng_transl_temp_detail_id','AORDER');
      Elem_LNG_TRANSL_TEMP_DETAIL.AddMainElem( Elem_LNG_TRANSLATE_TEMPLATE, 'ID_LNG_TRANSLATE_TEMPLATE' );

      Elem_CNTREMBASSIESRepresent := TDBShemaView.Create( DMServDic.CNTREMBASSIES, DMServDic.ViewCountryEMBASSIESInUkraineForRepresent, 'CNTREMBASSIES', 'CNTREMBASSYID', 'CNTREMBASSIES_GEN' );

      Elem_CNTREMBAS_INPROVINCE := TDBShemaView.Create( CNTREMBAS_INPROVINCE, ViewContEmbasInprovince, 'CNTREMBAS_INPROVINCE', 'id', 'gen_cntrembas_inprovince_id' );
      Elem_CNTREMBAS_INPROVINCE.AddMainElem( Elem_CNTREMBASSIES, 'CNTREMBASSYID' );
      Elem_ProvinceOfUkraineQry := TDBShemaView.Create( DMServDic.ProvinceOfUkraineQry, DMServDic.ViewProvinceOfUkraine, 'CITY_ADM_UNIT', 'ID', '' );
      Elem_EmbassyList := TDBShemaView.Create( DMServDic.EmbassyListQry, DMServDic.ViewEmbassyList, 'Companies', 'COMPANYID', '' );

      Elem_SelTradeNameQry := TDBShemaView.Create(SelTradeNameQry, ViewSelTradeName, 'TRADENAMES','TRADENAMEID','') ;
      Elem_SelTradeNameQry.ViewList := ViewSelTradeNameList;
      Elem_SelCompanyByTradeNameQry := TDBShemaView.Create(SelCompanyByTradeNameQry, ViewSelCompanyByTradeName,'','COMPANYID');

      Elem_ExcursCityQry := TDBShemaView.Create( DMServDic.ExCityQry, DMServDic.ViewBrCityExcurs, 'CITY_ADM_UNIT', 'ID' );
      Elem_ExcursCityQry.AddMainElem( Elem_BrCountryQry, 'ID_COUNTRY');

      Elem_EXCURSIONQry := TDBShemaView.Create( DMServDic.EXCURSIONQry, DMServDic.ViewExcursion, 'EXCURSION', 'EID', 'EXCURSION_GEN' );
      Elem_EXCURSIONQry.AddMainElem( Elem_ExcursCityQry, 'id_city_adm_unit' );
      Elem_EXCURSIONQry.AddReletionTopElem( Elem_BrCountryQry, 'COUNTRYID' );
      Elem_EXCURSIONQry.AddTranslateTable('EXCURSION_LNG','NAME','ID_EID','ID_LNG','CHANGE_NAME', nLocalLang, 120 );

      Elem_EXCURSION_PLACEQry := TDBShemaView.Create( DMServDic.EXCURSION_PLACEQry, DMServDic.ViewExcursionPlace, 'EXCURSION_PLACE', 'ID', 'gen_excursion_place_id' );
      Elem_EXCURSION_PLACEQry.AddTranslateTable('EXCURSION_PLACE_LNG','NAME','ID_EXCURSION_PLACE','ID_LNG','CHANGE_NAME', nLocalLang );
      Elem_EXCURSION_PLACEQry.ViewList := DMServDic.ViewExcursionPlace;

      Elem_EXCURS_TYPE_CONTENTQry := TDBShemaView.Create( DMServDic.EXCURS_TYPE_CONTENTQry, DMServDic.ViewExcursionTypeContent, 'EXCURS_TYPE_CONTENT', 'ID', 'gen_excurs_type_content_id' );
      Elem_EXCURS_TYPE_CONTENTQry.AddTranslateTable('EXCURS_TYPE_CONTENT_LNG','NAME','ID_EXCURS_TYPE_CONTENT','ID_LNG','CHANGE_NAME', nLocalLang );
      Elem_EXCURS_TYPE_CONTENTQry.ViewList := DMServDic.ViewExcursionTypeContent;

      Elem_EXCURS_TYPE_TRIPQry := TDBShemaView.Create( DMServDic.EXCURS_TYPE_TRIPQry, DMServDic.ViewExcursionTrip, 'EXCURS_TYPE_TRIP', 'ID', 'gen_excurs_type_trip_id' );
      Elem_EXCURS_TYPE_TRIPQry.AddTranslateTable('EXCURS_TYPE_TRIP_LNG', 'NAME', 'ID_EXCURS_TYPE_TRIP', 'ID_LNG', 'CHANGE_NAME', nLocalLang );
      Elem_EXCURS_TYPE_TRIPQry.ViewList := DMServDic.ViewExcursionTrip;

      Elem_EXCURS_LAYOUT_DESCRIPTQry := TDBShemaView.Create( DMServDic.EXCURS_LAYOUT_DESCRIPTQry, DMServDic.ViewExcursLayoutDesript, 'EXCURS_LAYOUT_DESCRIPT', 'ID', 'gen_excurs_layout_descript_id','AORDER' );
      Elem_EXCURS_LAYOUT_DESCRIPTQry.AddMainElem( Elem_EXCURSIONQry, 'ID_EXCURSION' );

      Elem_SERVICESKINDQry := TDBShemaView.Create( DMServDic.SERVICESKINDQry, DMServDic.ViewSERVICEKIND, 'SERVICESKIND', 'ID', 'gen_serviceskind_id','' );
      Elem_SERVICESKINDQry.AddTranslateTable('SERVICESKIND_LNG', 'NAME', 'ID_SERVICESKIND', 'ID_LNG', 'CHANGE_NAME', nLocalLang );

      Elem_SERVICE_TYPEQry := TDBShemaView.Create( DMServDic.SERVICE_TYPEQry, DMServDic.ViewServiceType, 'SERVICE_TYPE', 'ID', 'gen_service_type_id','' );
      Elem_SERVICE_TYPEQry.AddTranslateTable('SERVICE_TYPE_LNG','NAME','ID_SERVICE_TYPE','ID_LNG', 'CHANGE_NAME', nLocalLang );

      Elem_SERVICE_TYPE_CONDITIONQry := TDBShemaView.Create( DMServDic.SERVICE_TYPE_CONDITIONQry, DMServDic.ViewServiceTypeCondition, 'SERVICE_TYPE_CONDITION', 'ID', 'gen_service_type_condition_id','' );
      Elem_SERVICE_TYPE_CONDITIONQry.AddMainElem( Elem_SERVICESKINDQry, 'TYPEOBJ' );
      Elem_SERVICE_TYPE_CONDITIONQry.AddTranslateTable('SERVICE_TYPE_COND_LNG','NAME','ID_SERVICE_TYPE_CONDITION','ID_LNG', 'CHANGE_NAME', nLocalLang );

      Elem_CompOrgFrmQry := TDBShemaView.Create( DMServDic.CompOrgFrmQry, DMServDic.ViewORGFORMS, 'ORGFORMS', 'ID', 'gen_orgforms_id' );
      Elem_CompOrgFrmQry.ViewList := DMServDic.ViewORGFORMSList;
      Elem_CompOrgFrmQry.AddTranslateTable( 'ORGFORMS_LNG', 'NAME', 'ID_ORGFORMS', 'ID_LNG', 'CHANGE_NAME', nLocalLang, 120 );
      Elem_CompOrgFrmQry.AddTranslateTable( 'ORGFORMS_LNG', 'SHORTNAME','ID_ORGFORMS','ID_LNG','CHANGE_SHORTNAME', nLocalLang,80 );
      Elem_CompOrgFrmQry.AddTranslateTable( 'ORGFORMS_LNG', 'FULLNAME','ID_ORGFORMS','ID_LNG','CHANGE_FULLNAME', nLocalLang,300 );

      Elem_COMPACTIONS := TDBShemaView.Create( DMServDic.COMPACTIONSQry, DMServDic.ViewCOMPACTIONS, 'COMPACTIONS', 'ID', 'gen_compactions_id', 'AORDER' );
      Elem_COMPACTIONS.AddTranslateTable( 'COMPACTIONS_LNG', 'NAME', 'ID_COMPACTIONS', 'ID_LNG', 'CHANGE_NAME', nLocalLang, 120 );
      Elem_COMPACTIONS.AddTranslateTable( 'COMPACTIONS_LNG', 'SHORTNAME', 'ID_COMPACTIONS', 'ID_LNG', 'CHANGE_SHORTNAME', nLocalLang, 120 );

      Elem_OCCUPATIONS := TDBShemaView.Create( DMServDic.OCCUPATIONSQry, DMServDic.ViewOCCUPATIONS, 'OCCUPATIONS', 'ID', 'gen_occupations_id', 'AORDER' );
      Elem_OCCUPATIONS.AddTranslateTable( 'OCCUPATIONS_LNG', 'NAME', 'ID_OCCUPATIONS', 'ID_LNG', 'CHANGE_NAME', nLocalLang, 120 );
      Elem_OCCUPATIONS.ViewList := DMServDic.ViewOCCUPATIONSList;

      Elem_COMP_TYPEDOCUM := TDBShemaView.Create( DMServDic.COMP_TYPEDOCUMQry, DMServDic.ViewCOMP_TYPEDOCUM, 'COMP_TYPEDOCUM', 'ID', 'gen_comp_typedocum_id', 'AORDER' );
      Elem_COMP_TYPEDOCUM.AddTranslateTable( 'COMP_TYPEDOCUM_LNG', 'NAME', 'ID_COMP_TYPEDOCUM', 'ID_LNG', 'CHANGE_NAME', nLocalLang, 120 );

      Elem_FEEDTYPES :=  TDBShemaView.Create( DMServDic.FEEDTYPESQry, DMServDic.ViewFEEDTYPES, 'FEEDTYPES', 'FEEDTYPEID', 'feedtypes_gen', 'SORTORDER' );
      Elem_FEEDTYPES.AddTranslateTable('FEEDTYPES_LNG','FEEDNAME', 'ID_FEEDTYPES', 'ID_LNG', 'CHANGE_FEEDNAME', nLocalLang, 120 );

      Elem_OTHERSERVICE:=TDBShemaView.Create( DMServDic.OTHERSERVICESQry, DMServDic.ViewOtherService, 'OTHERSERVICES', 'ID', 'gen_otherservices_id', 'ORDERINCATEGORY' );

      Elem_TOURISTANKETTEMPLATES := TDBShemaView.Create( DMServDic.FilingQry, DMServDic.ViewFiling, 'TOURISTANKETTEMPLATES', 'TEMPLID', '' );

      //Elem_MisQry := TDBShemaView.Create( MisQry , nil, 'DocumMismatch', 'DOCID', 'GEN_DOCUMMISMATCH_ID' );
      Elem_TypeNotesQry :=  TDBShemaView.Create( DMServDic.TypeNotesQry , nil, 'TypeNote', 'ID', 'gen_typenote_id' );

      Elem_OneTypeDocQry := TDBShemaView.Create( OneTypeDocQry, View_EmbassyDocumDlg_OneTypeDocDBGrid, 'VisaDocuments_New', 'VISADOCUMENTID', '' );
      Elem_TypeDocumQry := TDBShemaView.Create( DMServDic.TypeDocumQry, nil, 'COMP_TYPEDOCUM', 'ID', 'gen_comp_typedocum_id' );
      Elem_TypeDocumQry.ViewList := DMServDic.ViewTypeDocumList;

      Elem_ExpandNameQry := TDBShemaView.Create( DMServDic.ExpandNameQry, DMServDic.ViewRoomExpandName, 'RoomExpandNames', 'EXPANDNAMEID', 'gen_roomexpandname_id' );
      Elem_ExpandNameQry.AddTranslateTable( 'ROOMEXPANDNAMES_LNG', 'EXPANDNAME','ID_ROOMEXPANDNAMES','ID_LNG','CHANGE_EXPANDNAME', nLocalLang, 200 );

      Elem_SelPersonQry := TDBShemaView.Create( SelPersonQry, nil, 'COMPPERSONS', 'PERSONID', 'CompPersons_Gen' );

      Elem_SelCompAction := TDBShemaView.Create( DMServDic.SelCompActionQry, DMServDic.ViewSelCompAction, 'COMPACTIONS', 'ID', 'gen_compactions_id' );
      Elem_SelCompAction.ViewList := DMServDic.ViewSelCompActionList;

      Elem_ExistCompQry := TDBShemaView.Create( ExistCompQry, ViewExistsCompany, '', 'COMPANYID', '' );
      Elem_ExistOfficeQry := TDBShemaView.Create( ExistOfficeQry , ViewExistsCompanyOffice, '', 'OFFICEID', '' );

      Elem_SelCountryObjectLinksQry := TDBShemaView.Create( SelCountryObjectLinksQry, nil, 'OBJECTLINKS', 'COUNTRYID', '' );
      Elem_SelCountryObjectLinksQry.DS := SelCountryObjectLinksSrc;

      Elem_KindStreetQry := TDBShemaView.Create( DMServDic.KINDSTREET, DMServDic.ViewKindStreet, 'KINDSTREET', 'ID', 'gen_kindstreet_id', 'AORDER' );
      Elem_KindStreetQry.ViewList := DMServDic.ViewKindStreetList;
      Elem_KindStreetQry.AddTranslateTable( 'KINDSTREET_LNG', 'NAME','ID_KINDSTREET','ID_LNG','CHANGE_NAME', nLocalLang, 200 );

      Elem_ImportLog :=  TDBShemaView.Create( ImportLogQry, ViewImportLog, 'IMPORTHOTELLOG', 'LOGID', 'gen_importhotellog_id' );

      Elem_VendorTourQry := TDBShemaView.Create( VendorTourQry, ViewVendorTour, '', 'COMPANYID', '');
      Elem_VendorTourContractQry := TDBShema.Create( VendorTourContractQry, 'TourVendorContracts', 'ID', 'gen_tourvendorcontracts_id' );
      Elem_VendorTourContractQry.AddMainElem(Elem_VendorTourQry, 'VENDORID');
      Elem_SelContractQry := TDBShemaView.Create( SelContractQry, ViewSelContractQry, '', 'ID');
      Elem_CntrTemplQry := TDBShemaView.Create( CntrTemplQry, ViewCntrTemplQry, '', 'ANUMBER');
      Elem_SelCntrTemplQry := TDBShemaView.Create( SelCntrTemplQry, ViewSelCntrTemplQry, 'CONTRACTTEMPLATES', 'CONTRACTTEMPLATEID', 'contracttemplates_gen');

      Elem_PASSPORTKINDS := TDBShemaView.Create( DMServDic.PASSPORTKINDS, DMServDic.ViewPASSPORTKINDS, 'PASSPORTKINDS', 'ID', 'gen_passportkinds_id','AORDER');
      Elem_STATUSDOC :=  TDBShemaView.Create( DMServDic.STATUSDOC, DMServDic.ViewSTATUSDOC, 'STATUSDOC', 'ID', 'gen_statusdoc_id','AORDER');
      Elem_REPOSKIND := TDBShemaView.Create( DMServDic.REPOSKIND, DMServDic.ViewREPOSKIND, 'REPOSKIND', 'ID', 'gen_reposkind_id','AORDER');
      Elem_SPONSOR :=  TDBShemaView.Create( DMServDic.SPONSOR, DMServDic.ViewSPONSOR, 'SPONSOR', 'ID', 'gen_sponsor_id','AORDER');
      Elem_PAYMENT_BYSPONSOR := TDBShemaView.Create( DMServDic.PAYMENT_BYSPONSOR, DMServDic.ViewPAYMENT_BYSPONSOR, 'PAYMENT_BYSPONSOR', 'ID', 'gen_payment_bysponsor_id','AORDER');

      Elem_MISMATCHQry := TDBShemaView.Create( DMServDic.MISMATCHQry, DMServDic.ViewMismatch, 'MISMATCH', 'ID', 'gen_mismatch_id', 'AORDER');
      Elem_VISADOCTYPEQry := TDBShemaView.Create( DMServDic.VISADOCTYPEQry, DMServDic.ViewVisaDocType, 'VISADOCTYPE', 'ID','gen_visadoctype_id', 'AORDER' );
      Elem_DocForQry := TDBShemaView.Create( DMServDic.DOCFORQry , DMServDic.ViewDocFor,'DOCFOR', 'ID', 'gen_docfor_id','AORDER');
      Elem_CREDITCARDSQry := TDBShemaView.Create( DMServDic.CREDITCARDSQry , DMServDic.ViewCreditCards, 'CREDITCARDS', 'ID','gen_creditcards_id', 'AORDER' );

      {Elem_COMPANYQRY.AddDatailElem( Elem_PersonQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_EmailQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_PhoneQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_FaxQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_WebSiteQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_BankQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_ContractQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_LogContractQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_OrderListQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_CompNoteQry );
      Elem_COMPANYQRY.AddDatailElem( Elem_CompanyDocsQry ); }

      Elem_CITY_ADM_UNT_ITEMS_TYPEQry.DBOpen;
      Elem_UNIT_MEASUR.DBOpen;
      Elem_Admin_unitQry.DBOpen;
      Elem_Language.DBOpen;
      Elem_CurrencyQry.DBOpen;
      Elem_COMPANIES_PARAM_KIND.DBOpen;

      ElemUserRole := TRoleShema.Create( ExtractFileName(Application.ExeName), Elem_UsersQry.DBGetParamConnect, False);
      ElemUserRole.AddImageIcon( DMServDic.ImageListAdmin, 0);
      SetLogForAllElements( Elem_UsersQry, 'MANAGER', 'LOG', 'LOG_ADD', LogFieldNames, DmServDic.cxStyle216 );
    except
      ShowMessage( 'Error Last Created Element '+ TDBShema( AllElemnts.Items[AllElemnts.Count-1]).Name );
    end;

  finally
    ClosedProgress(aProgres.FormProgres);
  end;
end;

procedure TDMServ.RefreshComapnyOne(idCompany:variant);
begin
  Elem_CompanyQRY.DBClose;
  Elem_CompanyQRY.DBQuerySetParamValue('COMPANYID',idCompany);
  Elem_CompanyQRY.DBOpen;
end;

procedure TDMServ.CloseAllElements;
begin 
  SaveDBPositionElements;
  FreeAllElements;
end;

function TDMServ.GetSectionData: TFieldSectionData;
begin
  Result.FormCaption := 'Категорія опису';
  Result.MemoFieldName := 'COMMENTS';
  Result.IdFieldName := 'DICTSECTIONID';
  Result.MainFieldName := 'SECTIONNAME';
  Result.SmallIconField := 'SMALLICON';
  Result.LargeIconField := 'LARGEICON';

  Result.CheckUseServldSql := 'select * from country_sect_descripts where DICTSECTIONID = :Id';
  Result.UkrServNameSQLSql := 'update DictSections set SECTIONNAME = :Name, Comments = :Comments ' +
    'where DICTSECTIONID = :ServId';
end;


procedure TDMServ.CompanyQryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ADDMANID').value := CurManager;
end;

procedure TDMServ.ViewCompanyCustomDrawCellISOBDZVIN(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var //IndIsObdzvin:Integer;
    IndObdzvin:Integer;
    IndObdzvinGreeDate:Integer;
    IndAreWeb:Integer;
    IndFixDefectToDate:Integer;
    Obdzvin:Integer;
    ImgId:Integer;
    AreWeb:Boolean;
    DisplayValueText:Widestring;
    AlignmentVertical: TcxAlignmentVert;
//***********************************************************************
function GetIsObdzvin( aObdzvin, aObdzvinGrateDate:Variant ):Widestring;
begin
  if aObdzvin<>null then
  begin
    case aObdzvin of
      nObdzvinNeedCall: if aObdzvinGrateDate <> null then result := FormatDateTime('dd.mm.yyyy', aObdzvinGrateDate );
      nObdzvinPermExtraAgent, nObdzvinToBanExtraAgent: result := sExtraAgent;
    end;  
  end;
end;
//***********************************************************************
begin
   //IndIsObdzvin:= TcxGridDBTableView(Sender).GetColumnByFieldName('ISOBDZVIN').Index;
   IndObdzvin:= TcxGridDBTableView(Sender).GetColumnByFieldName('OBDZVIN').Index;
   IndObdzvinGreeDate := TcxGridDBTableView(Sender).GetColumnByFieldName('OBDZVINAGREEDATE').Index;
   IndAreWeb  := TcxGridDBTableView(Sender).GetColumnByFieldName('AreWeb').Index;
   IndFixDefectToDate:= TcxGridDBTableView(Sender).GetColumnByFieldName('FIXDEFECTTODATE').Index;

   if AViewInfo.Item.Index = IndObdzvin then
   begin
      DisplayValueText  := GetIsObdzvin( AViewInfo.GridRecord.Values[IndObdzvin], AViewInfo.GridRecord.Values[IndObdzvinGreeDate] );

      if AViewInfo.GridRecord.Values[IndObdzvin]<>null then
        Obdzvin := AViewInfo.GridRecord.Values[IndObdzvin]
      else Obdzvin := -1;

      if (AViewInfo.GridRecord.Values[IndAreWeb]<> null)and(AViewInfo.GridRecord.Values[IndAreWeb]='T') then AreWeb:=True
      else AreWeb := false;

      if (Obdzvin in [nObdzvinPromise, nObdzvinNeedCall]) and (AViewInfo.GridRecord.Values[IndObdzvinGreeDate] >= Date) then ACanvas.Brush.Color := clYellow
      else
      if ((Obdzvin in [nObdzvinPromise, nObdzvinNeedCall]) and (AViewInfo.GridRecord.Values[IndObdzvinGreeDate] < Date)) or (Obdzvin = nObdzvinTakeTour)
      then ACanvas.Brush.Color := clRed
      else
      if (Obdzvin = nObdzvinNone) and AreWeb then ACanvas.Brush.Color := clRed
      else
      if (Obdzvin = nObdzvinNeedChangeTour) and ( AViewInfo.GridRecord.Values[IndFixDefectToDate] >= Date) then ACanvas.Brush.Color := clYellow
      else
      if (Obdzvin = nObdzvinNeedChangeTour) and ( AViewInfo.GridRecord.Values[IndFixDefectToDate] < Date) then ACanvas.Brush.Color := clRed
      else
      if Obdzvin = nObdzvinPermExtraAgent then ACanvas.Brush.Color := clLime
      else
      if Obdzvin = nObdzvinToBanExtraAgent then ACanvas.Brush.Color := clRed
      else
      if Obdzvin = nObdzvinSendMail then ACanvas.Brush.Color := clRed;

      ACanvas.Brush.Style := bsSolid;
      ViewDrawFillRect(Sender, AViewInfo, ACanvas );
      ACanvas.Font.Color := clBlack;
      AlignmentVertical := vaCenter;

      if Obdzvin > nObdzvinNeedCall then
      begin
        ImgId := StrToInt(ObdzvinArr[Obdzvin]);
        if ImgId > 0 then
          ShowTextImageInCell(Sender, ACanvas, AViewInfo,DMServDic.BrowseImgList,ImgId, OptImgPosCenter, DisplayValueText );
      end
       else ACanvas.DrawTexT( DisplayValueText ,AViewInfo.Bounds , AViewInfo.Properties.Alignment.Horz , AlignmentVertical, False, False);
      ADone:=True;
   end;
end;

procedure TDMServ.ViewCompanyCustomDrawCellCompanyName(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var IndCOMPANYNAME:Integer;
    IndCOMPANYTRADENAME:Integer;
    IndISHEADOFFICE:Integer;
    IndNOTWORK:Integer;
    IndAGENCYLOGO:Integer;
    IsHeadOffice:Boolean;
    NotWork:Boolean;
    FileLogo:Widestring;
begin
  IndCOMPANYNAME  := TcxGridDBTableView( Sender ).GetColumnByFieldName('COMPANYNAME').Index;
  IndCOMPANYTRADENAME  := TcxGridDBTableView( Sender ).GetColumnByFieldName('COMPANYTRADENAME').Index;
  IndISHEADOFFICE := TcxGridDBTableView( Sender ).GetColumnByFieldName('ISHEADOFFICE').Index;
  IndNOTWORK      := TcxGridDBTableView( Sender ).GetColumnByFieldName('NOTWORK').Index;
  IndAGENCYLOGO   := TcxGridDBTableView( Sender ).GetColumnByFieldName('AGENCYLOGO').Index;

  if AViewInfo.Item.Index in [ IndCOMPANYNAME,IndCOMPANYTRADENAME ] then
  begin
    if (AViewInfo.GridRecord.Values[ IndAGENCYLOGO ] <> null)and(AViewInfo.GridRecord.Values[ IndAGENCYLOGO ]<>'') then
      FileLogo :=AViewInfo.GridRecord.Values[ IndAGENCYLOGO ]
    else FileLogo:='';

    if (AViewInfo.GridRecord.Values[IndISHEADOFFICE]<> null)and(AViewInfo.GridRecord.Values[IndISHEADOFFICE]='T') then IsHeadOffice:=True
    else IsHeadOffice := false;

    if (AViewInfo.GridRecord.Values[IndNOTWORK]<> null)and(AViewInfo.GridRecord.Values[IndNOTWORK]='T') then NotWork:=True
    else NotWork := false;

    if IsHeadOffice then ACanvas.Font.Style := [fsBold];
    if NotWork then
    begin
      ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut];
      ACanvas.Font.Color := clRed;
    end;
    
    if not ShowTextImageInCellFromFile( Sender, ACanvas,AViewInfo, GetNetAgencyFileName(FileLogo),  OptImgPosRight ) then
    begin
      ViewDrawFillRect( Sender, AViewInfo, ACanvas );
      ACanvas.DrawTexT( AViewInfo.DisplayValue , AViewInfo.Bounds ,0, True);
    end;

    ADone:=True;  
  end;
end;

procedure TDMServ.ViewCompanyCustomDrawCellContract(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var IndSortByContract:Integer;
    IndDOCTODATE:Integer;
    IndAREAGENTCONTRACT:Integer;
    IndSTANDOC:Integer;
    SortByContract:Integer;
    ImgId :Integer;
    ImgIdLeft :Integer;
    LeftPos:Integer;
    RightPos:Integer;
    AlignmentVertical: TcxAlignmentVert;
    DisplayValueText :Widestring;
    CelPositionLeft : TImageCellPosition;
    CelPositionRight : TImageCellPosition;

function GetDateContract:String;
begin
   result :='';
   if (AViewInfo.GridRecord.Values[IndDOCTODATE] <> null) and
      (AViewInfo.GridRecord.Values[IndAREAGENTCONTRACT] <>'T' ) and
      ( (AViewInfo.GridRecord.Values[IndSTANDOC]<>null)and(AViewInfo.GridRecord.Values[IndSTANDOC]=1)) then
     result := AViewInfo.GridRecord.Values[IndDOCTODATE];
end;

begin
  IndAREAGENTCONTRACT  := TcxGridDBTableView( Sender ).GetColumnByFieldName('AREAGENTCONTRACT').Index;
  IndSortByContract    := TcxGridDBTableView( Sender ).GetColumnByFieldName('SORTBYCONTRACT').Index;
  IndDOCTODATE         := TcxGridDBTableView( Sender ).GetColumnByFieldName('DOCTODATE').Index;
  IndSTANDOC           := TcxGridDBTableView( Sender ).GetColumnByFieldName('STANDOC').Index;

  if AViewInfo.Item.Index = IndSortByContract then
  begin
    if AViewInfo.GridRecord.Values[IndSortByContract]<>null then SortByContract:= AViewInfo.GridRecord.Values[IndSortByContract]
    else SortByContract:=-1;

    if AViewInfo.GridRecord.Values[IndSortByContract]<>null then
      case SortByContract of
       SortByContractNotCntr: ACanvas.Brush.Color := clRed;
       SortByContractNeedCall, SortByContractSendDoc, SortByContractTakeOrgn: if  AViewInfo.GridRecord.Values[IndDOCTODATE] > Date 
       then ACanvas.Brush.Color := clYellow
       else ACanvas.Brush.Color := clRed;

       SortByContractFillData: ACanvas.Brush.Color := clYellow;
       SortByContractNotRcv, SortByContractNotRcv1, SortByContractNotRcv2: ACanvas.Brush.Color := clRed;
      end;

    ACanvas.Font.Color := clBlack;

    //Є діюча або підписана, або нема угоди
    ImgId := 0;
    ImgIdLeft := 0;

    if SortByContract >= 0 then
    begin
      ImgId := SortByContractImgArr[SortByContract];
      if SortByContract in SortByContractLeftImgArr then ImgIdLeft := SortByContractImgArr2[SortByContract];
    end;

    CelPositionLeft := OptImgPosCenter;
    CelPositionRight := OptImgPosCenter;

    if (ImgIdLeft > 0) and (ImgId > 0)
    then
    begin
      CelPositionLeft := OptImgPosLeft;
      CelPositionRight := OptImgPosRight;
    end;

    AlignmentVertical := vaCenter;
    ViewDrawFillRect( Sender, AViewInfo, ACanvas );
    DisplayValueText := GetDateContract;

    if DisplayValueText <> '' then
      ACanvas.DrawTexT( DisplayValueText ,AViewInfo.Bounds , AViewInfo.Properties.Alignment.Horz , AlignmentVertical, False, False);

    //друк лівої
    if ImgIdLeft > 0 then
    begin
      AViewInfo.Text :='';
      ShowTextImageInCell(Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList,ImgIdLeft, CelPositionLeft );
    end;

    //друк правої
    if ImgId > 0 then
    begin
      AViewInfo.Text :='';
      ShowTextImageInCell(Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList,ImgId, CelPositionRight );
    end;
    ADone:=True; 
  end;
end;

procedure TDMServ.ViewCompanyCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  ViewCompanyCustomDrawCellCompanyName( Sender, ACanvas, AViewInfo, ADone );
  ViewCompanyCustomDrawCellISOBDZVIN( Sender, ACanvas, AViewInfo, ADone );
  ViewCompanyCustomDrawCellContract( Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewPhoneCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var IndISDEFPHN:Integer;
    IndISREDPHN:Integer;
begin

  IndISDEFPHN  := TcxGridDBTableView( Sender ).GetColumnByFieldName('ISDEFPHN').Index;
  IndISREDPHN  := TcxGridDBTableView( Sender ).GetColumnByFieldName('ISREDPHN').Index;

  if AViewInfo.GridRecord.Values[IndISDEFPHN]='T' then
    ACanvas.Font.Style := ACanvas.Font.Style + [fsBold]
  else
    ACanvas.Font.Style := ACanvas.Font.Style - [fsBold];

  if AViewInfo.GridRecord.Values[IndISREDPHN]='T' then ACanvas.Font.Color := clRed;

end;

procedure TDMServ.ViewFaxCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
const nImg: array[Boolean] of Integer = (-1, 15);
var IndISDEFFAX:Integer;
    IndISENABLED:Integer;
    IndISENABLED2:Integer;
begin

  IndISDEFFAX  := TcxGridDBTableView( Sender ).GetColumnByFieldName('ISDEFFAX').Index;
  IndISENABLED  := TcxGridDBTableView( Sender ).GetColumnByFieldName('ISENABLED').Index;
  IndISENABLED2  := TcxGridDBTableView( Sender ).GetColumnByFieldName('ISENABLED2').Index;

  if AViewInfo.GridRecord.Values[IndISDEFFAX] = 'T' then
    ACanvas.Font.Style := ACanvas.Font.Style + [fsBold]
  else
    ACanvas.Font.Style := ACanvas.Font.Style - [fsBold];
end;

procedure TDMServ.CompanyQryAfterOpen(DataSet: TDataSet);
begin
  //SetReadOnlyFieldOnDataset(DataSet,False);
end;

procedure TDMServ._ViewPersonCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var Dismiss: Boolean;
    IndIDISMISSED:Integer;
    IndNOTACCESSED:Integer;
begin
  IndIDISMISSED  := TcxGridDBTableView( Sender ).GetColumnByFieldName('DISMISSED').Index;
  IndNOTACCESSED := TcxGridDBTableView( Sender ).GetColumnByFieldName('NOTACCESSED').Index;

  Dismiss := AViewInfo.GridRecord.Values[IndIDISMISSED]='T';
  if not Dismiss then ACanvas.Font.Style := ACanvas.Font.Style - [fsStrikeout]
  else
  begin
    ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeout];
    ACanvas.Font.Color := clRed;
  end;

  if (not Dismiss) and (AViewInfo.GridRecord.Values[IndNOTACCESSED]='T') then
  begin
    if (sender.IsControlFocused ) then ACanvas.Font.Color := clYellow
    else ACanvas.Font.Color := clMaroon;
  end;

end;

procedure TDMServ.ViewContractCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var IndINVALID :Integer;
    IndTILLDATE:Integer;
    IndPERMREREESTR:Integer;
begin
  IndINVALID  := TcxGridDBTableView( Sender ).GetColumnByFieldName('INVALID').Index;
  IndTILLDATE  := TcxGridDBTableView( Sender ).GetColumnByFieldName('TILLDATE').Index;
  IndPERMREREESTR := TcxGridDBTableView( Sender ).GetColumnByFieldName('PERMREREESTR').Index;

  if ( AViewInfo.GridRecord.Values[IndINVALID]='T' )or
     ((AViewInfo.GridRecord.Values[IndTILLDATE]<>null)and (AViewInfo.GridRecord.Values[IndTILLDATE]< Now )) then
  ACanvas.Font.Color := clRed
  else

  if AViewInfo.GridRecord.Values[IndPERMREREESTR]='T' then
  begin
    ACanvas.Brush.Color := clYellow;
    ACanvas.Font.Color := clBlack;
  end;
end;

procedure TDMServ.ViewCompNoteCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  ColName: string;  
  Obdzvin, ImgId, CatCntrNote: Integer;
  IndCALCCATEGORYNOTE:Integer;
  IndTYPENOTE:Integer;
  IndCATEGORYNOTE:INteger;
  IndNDATE:Integer;
  IndFIXNDATE:Integer;
begin
  inherited;
  
  IndCALCCATEGORYNOTE  := TcxGridDBTableView( Sender ).GetColumnByFieldName('CALCCATEGORYNOTE').Index;
  IndTYPENOTE := TcxGridDBTableView( Sender ).GetColumnByFieldName('TYPENOTE').Index;
  IndCATEGORYNOTE := TcxGridDBTableView( Sender ).GetColumnByFieldName('CATEGORYNOTE').Index;
  IndNDATE := TcxGridDBTableView( Sender ).GetColumnByFieldName('NDATE').Index;
  IndFIXNDATE := TcxGridDBTableView( Sender ).GetColumnByFieldName('FIXNDATE').Index;

  if AViewInfo.Item.Index = IndCALCCATEGORYNOTE then
  begin
    //ACanvas.Brush.Color := clInfoBk;

    if AViewInfo.GridRecord.Values[IndTYPENOTE] = ExportTypeNote then
    begin
      if AViewInfo.GridRecord.Values[IndCATEGORYNOTE]<>null then
        Obdzvin :=AViewInfo.GridRecord.Values[IndCATEGORYNOTE]
      else Obdzvin:=0;

      if Obdzvin = nObdzvinPermExtraAgent then ACanvas.Brush.Color := clLime;
      if Obdzvin = nObdzvinToBanExtraAgent then ACanvas.Brush.Color := clRed;
      if Obdzvin = nObdzvinSendMail then ACanvas.Brush.Color := clYellow;
    end;

    if (AViewInfo.GridRecord.Values[IndTYPENOTE] = ExportTypeNote) or ( AViewInfo.GridRecord.Values[IndTYPENOTE] = ContractTypeNote) then
    if not AViewInfo.GridRecord.Values[IndNDATE] <> null then
    begin
      if (AViewInfo.GridRecord.Values[IndNDATE] > Date) or (AViewInfo.GridRecord.Values[IndFIXNDATE]='T' ) then ACanvas.Brush.Color := clYellow
      else ACanvas.Brush.Color := clRed;
    end
    else
    if AViewInfo.GridRecord.Values[IndCALCCATEGORYNOTE] = null then ACanvas.Brush.Color := clYellow;

    ACanvas.Brush.Style := bsSolid;
    ACanvas.Font.Color := clBlack;

    ImgId := 0;
    if AViewInfo.GridRecord.Values[IndTYPENOTE] = CommonTypeNote then
    begin
      if AViewInfo.GridRecord.Values[IndCATEGORYNOTE] = null then
        ImgId := 9
      else ImgId := nCommonNoteArr[ Integer(AViewInfo.GridRecord.Values[IndCATEGORYNOTE]) ];
    end; 

    if AViewInfo.GridRecord.Values[IndTYPENOTE] = ExportTypeNote then
    begin
       if Obdzvin > nObdzvinNeedCall then
       begin
         ImgId := StrToInt(ObdzvinArr[Obdzvin]);
         if ImgId > 0 then
         begin
           ShowTextImageInCell(Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, ImgId, OptImgPosCenter );
           ADone:= True;
         end;
       end;

       ImgId := 0;
       case Obdzvin of
         nObdzvinTakenAndRefuse: ImgId := 80;
       end;

       if ImgId > 0 then
       begin
         ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, ImgId, OptImgPosCenter );
         ADone:= True;
       end;

    end;
    if (AViewInfo.GridRecord.Values[IndTYPENOTE] = ContractTypeNote) and (AViewInfo.GridRecord.Values[IndCATEGORYNOTE]<>null) then
      ImgId := nContractStateArr[ Integer( AViewInfo.GridRecord.Values[IndCATEGORYNOTE]) ];

    if ImgId > 0 then
    begin
      ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, ImgId, OptImgPosCenter );
      ADone:= True;
    end;
  end;
end;

procedure TDMServ.ViewOrderListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  OrderState, OrderState2: Integer;
  ColName: string;
  IndSTATE:Integer;
  IndSTATE2:Integer;
  IndCalcState:Integer;
  IndCalcState2:Integer;
  IndSPECIALDATEID:Integer;
begin
  IndSTATE  := TcxGridDBTableView( Sender ).GetColumnByFieldName('STATE').Index;
  IndSTATE2  := TcxGridDBTableView( Sender ).GetColumnByFieldName('STATE2').Index;
  IndCalcState := TcxGridDBTableView( Sender ).GetColumnByFieldName('CalcState').Index;
  IndCalcState2 := TcxGridDBTableView( Sender ).GetColumnByFieldName('CalcState2').Index;
  IndSPECIALDATEID :=  TcxGridDBTableView( Sender ).GetColumnByFieldName('SPECIALDATEID').Index;


  if AViewInfo.GridRecord.Values[IndSTATE]<>null then
    OrderState :=  AViewInfo.GridRecord.Values[IndSTATE]
  else OrderState:=0;

  if AViewInfo.GridRecord.Values[IndSTATE2]<>null then
    OrderState2 :=  AViewInfo.GridRecord.Values[IndSTATE2]
  else OrderState2:=0;

  ACanvas.Font.Style := ACanvas.Font.Style - [fsStrikeout];
  if OrderState = ordAnnuled then
  begin
    ACanvas.Font.Color := clRed;
    ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeout];
  end;

  if AViewInfo.Item.Index = IndCalcState then
  begin
    ACanvas.Brush.Style := bsSolid;
    ACanvas.Brush.Color := GetOrderStateColor(OrderState);
    ACanvas.Font.Color := clWindowText;
  end;

  if AViewInfo.Item.Index = IndCalcState2 then
  begin
    ACanvas.Brush.Style := bsSolid;
    ACanvas.Brush.Color := GetOrderStateColor(OrderState2);
    ACanvas.Font.Color := clWindowText;
  end;

  if (AViewInfo.Item.Index = IndSPECIALDATEID) and (AViewInfo.GridRecord.Values[IndSPECIALDATEID]<>null) then
  begin
    ACanvas.Brush.Style := bsSolid;
    ViewDrawFillRect( Sender, AViewInfo, ACanvas );
    ShowTextImageInCellFromFile(Sender, ACanvas, AViewInfo, GetGroupLogoFileName( String( AViewInfo.GridRecord.Values[IndSPECIALDATEID]) + '.jpg'),OptImgPosCenter );
    ADone:=True;
  end;

end;

procedure TDMServ.View_EmbassyDocumDlg_UsedDocsDBGridCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const VisaImg: array[1..2] of Integer = (69, 123);
var ImgInd:Integer;
    IndISUSE:Integer;
    IndLINK :Integer;
    IndVIEWNAME:Integer;
    IndTYPENAME:Integer;
    IndFILINGATWORK:Integer;
    IndFORIND:Integer;
    IndFORADDMANUAL:Integer;
    IndRETURNED:Integer;
    IndTRANSMIT:Integer;
    IndBEGINDOC:Integer;
    IndFOROWNERVISA:Integer;
begin
  IndISUSE:= TcxGridDBTableView( Sender ).GetColumnByFieldName('ISUSE').Index;
  IndLINK := TcxGridDBTableView( Sender ).GetColumnByFieldName('LINK').Index;
  IndVIEWNAME := TcxGridDBTableView( Sender ).GetColumnByFieldName('VIEWNAME').Index;
  IndTYPENAME := TcxGridDBTableView( Sender ).GetColumnByFieldName('TYPENAME').Index;
  IndFILINGATWORK := TcxGridDBTableView( Sender ).GetColumnByFieldName('FILINGATWORK').Index;
  IndFORIND := TcxGridDBTableView( Sender ).GetColumnByFieldName('FORIND').Index;
  IndFORADDMANUAL := TcxGridDBTableView( Sender ).GetColumnByFieldName('FORADDMANUAL').Index;
  IndRETURNED := TcxGridDBTableView( Sender ).GetColumnByFieldName('RETURNED').Index;
  IndTRANSMIT := TcxGridDBTableView( Sender ).GetColumnByFieldName('TRANSMIT').Index;
  IndBEGINDOC := TcxGridDBTableView( Sender ).GetColumnByFieldName('BEGINDOC').Index;
  IndFOROWNERVISA := TcxGridDBTableView( Sender ).GetColumnByFieldName('FOROWNERVISA').Index;

  if AViewInfo.GridRecord.Values[IndISUSE]<>'T'  then
    ACanvas.Font.Color := clRed;

  if (AViewInfo.GridRecord.Values[IndLINK]<>null) and (AViewInfo.Item.Index = IndVIEWNAME) then
  begin
    ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, 61, OptImgPosRight );
    ADone:=True;
  end
  else
  if (AViewInfo.Item.Index = IndTYPENAME) and ( AViewInfo.GridRecord.Values[IndFILINGATWORK]='T' )  then
  begin
    ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, 118, OptImgPosRight );
    ADone:=True;
  end;
  
  if  AViewInfo.Item.Index in [IndFORIND,IndFORADDMANUAL,IndRETURNED,IndTRANSMIT,IndBEGINDOC,IndFOROWNERVISA] then
   begin
     //ACanvas.Brush.Style := bsSolid;
     ViewDrawFillRect(Sender, AViewInfo, ACanvas );
     if (AViewInfo.Item.Index = IndFORIND )and( AViewInfo.GridRecord.Values[IndFORIND] = 'T') or
        (AViewInfo.Item.Index = IndFORADDMANUAL)and( AViewInfo.GridRecord.Values[IndFORADDMANUAL] = 'T') or
        (AViewInfo.Item.Index = IndRETURNED)and( AViewInfo.GridRecord.Values[IndRETURNED] = 'T') or
        (AViewInfo.Item.Index = IndTRANSMIT)and( AViewInfo.GridRecord.Values[IndTRANSMIT] = 'T') or
        (AViewInfo.Item.Index = IndBEGINDOC)and( AViewInfo.GridRecord.Values[IndBEGINDOC] = 'T') then
     begin
       ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, 69, OptImgPosCenter );
     end
     else
     if (AViewInfo.Item.Index = IndFOROWNERVISA)and( AViewInfo.GridRecord.Values[IndFOROWNERVISA] <> null) then
     begin
       ImgInd:=AViewInfo.GridRecord.Values[IndFOROWNERVISA];
       ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, VisaImg[ImgInd],OptImgPosCenter  );
     end;
     ADone:=True;
   end;
end;

procedure TDMServ.ViewCompanyDataControllerFilterGetValueList(
  Sender: TcxFilterCriteria; AItemIndex: Integer;
  AValueList: TcxDataFilterValueList);
begin
   ShowMessage('On Get Value List');
end;

procedure TDMServ.COUNTRIES_HOLIDAYSCalcFields(DataSet: TDataSet);
var Str:string;
begin
  if DataSet.FieldByName('TYPEDATE').AsInteger = -2 then
    DataSet.FieldByName('CalcDate').AsString :=  DataSet.FieldByName('NAMEBYRELIGION').AsString
  else
    begin
    if DataSet.FieldByName('TYPEDATE').AsInteger = -1 then
      DataSet.FieldByName('CalcDate').AsString := AddNolForLengthNumber(DataSet.FieldByName('AMONTH').AsString,2) +' / '+ AddNolForLengthNumber(DataSet.FieldByName('AVALUE').AsString,2)
    else
      if DataSet.FieldByName('TYPEDATE').AsInteger = 0 then Str:='Ост.'
      else  Str := DataSet.FieldByName('TYPEDATE').AsString;

      DataSet.FieldByName('CalcDate').AsString := AddNolForLengthNumber(DataSet.FieldByName('AMONTH').AsString,2) +'/ '+Str+' '+ DayNamesUkr[DataSet.FieldByName('AVALUE').asInteger];
    end;

end;

procedure TDMServ.CNTREMBASSIESCalcFields(DataSet: TDataSet);
const sSum = '%s %s за %d %s';
      sOnTour = '%s %s';
var CityName:string;
begin
  CityName := DataSet.FieldByName('CityName').AsString;
  DataSet.FieldByName('CalcEmbassyName').AsString := IfThen(CityName <> EmptyStr, CityName + ', ', EmptyStr) + DataSet.FieldByName('EMBASSYNAME').AsString;

  if DataSet.FieldByName('FUNDINGSUM').Value>0 then
    DataSet.FieldByName('CalcFundingSum').asString := Format(sSum, [DataSet.FieldByName('FUNDINGSUM').AsString,
                                                          val[DataSet.FieldByName('FUNDINGVAL').asInteger],
                                                          DataSet.FieldByName('FUNDINGCOUNT').asInteger,
                                                          Expire[DataSet.FieldByName('FUNDINGPERIOD').asInteger]] );

  if DataSet.FieldByName('BankSUM').Value>0 then
    DataSet.FieldByName('CalcBankSum').AsString := Format(sSum, [ DataSet.FieldByName('BankSUM').AsString,
                                                   Val[ DataSet.FieldByName('BankVAL').asInteger ], DataSet.FieldByName('BankCOUNT').asInteger,
                                                   Expire[DataSet.FieldByName('BankPERIOD').asInteger ]]);

   if DataSet.FieldByName('ONTOURSUM').Value>0 then
     DataSet.FieldByName('CalcOnTourSum').AsString := Format(sOnTour, [DataSet.FieldByName('ONTOURSUM').AsString, Val[DataSet.FieldByName('BankVAL').asInteger ]]); 
end;

procedure TDMServ.View_EmbassyDocumDlg_EmbassyDBGridCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var IndOURFILING:Integer;
    IndFILINGPLACEWORK:Integer;
    ImgInd:Integer;
begin
  IndOURFILING:= TcxGridDBTableView( Sender ).GetColumnByFieldName('OURFILING').Index;
  IndFILINGPLACEWORK := TcxGridDBTableView( Sender ).GetColumnByFieldName('FILINGPLACEWORK').Index;

  case AViewInfo.Item.Index of
    6: begin
         if AViewInfo.GridRecord.Values[IndFILINGPLACEWORK] = 'T' then
           ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, 69, OptImgPosCenter  );
       end;

    7: begin
         if AViewInfo.GridRecord.Values[IndOURFILING] <> null then
         begin
           if AViewInfo.GridRecord.Values[IndOURFILING] = 'F' then ImgInd := 50
           else ImgInd :=49;

           ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, ImgInd, OptImgPosCenter  );
         end;
       end;
  end;
end;

procedure TDMServ.DBTreeListCountryTemplateAdmUnitCustomDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnguageIconTree('ID_ADMIN_UNIT','LNGNOTFOUND','LNGCHANGE', Sender, ACanvas, AViewInfo, ADone);
end;

procedure TDMServ.ViewBrCountryCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME','LNGNOTFOUND','LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewBrCountryHaveHotelsCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME','LNGNOTFOUND','LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewBrCityCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon('NAME','LNGNOTFOUND','LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.SelVendorQry_NewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ISVENDOR').AsBoolean := True;
  DataSet.FieldByName('ISCLIENT').AsBoolean := False;
  DataSet.FieldByName('ISENTERPR').AsBoolean := True;
  DataSet.FieldByName('ISPRIVATE').AsBoolean := False;
  DataSet.FieldByName('ISOTHER').AsBoolean := False;
  DataSet.FieldByName('ASTOURS').AsBoolean := False;
  DataSet.FieldByName('ASDRIVE').AsBoolean := False;
  DataSet.FieldByName('ASTICKT').AsBoolean := False;
  DataSet.FieldByName('ASHOTEL').AsBoolean := False;
  DataSet.FieldByName('ASVISAS').AsBoolean := False;
  DataSet.FieldByName('ASINSUR').AsBoolean := False;
  DataSet.FieldByName('ASEXCRS').AsBoolean := False;
  DataSet.FieldByName('ASREKLM').AsBoolean := False;
  DataSet.FieldByName('ASOTHER').AsBoolean := False;
end;

procedure TDMServ.IntrstSrvLnkQry_NewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('INTERESTID').Value :=Elem_InterestQry.DB.FieldByName('INTERESTID').asInteger;
end;

procedure TDMServ.FSetCurManager(const Value: Integer);
begin
  Elem_UsersQry.DBClose;
  Elem_UsersQry.DBQuerySetParamValue('USERID',Value);
  Elem_UsersQry.DBOpen;
end;

function TDMServ.FGetManager: Integer;
begin
  result := Elem_UsersQry.GetCurrManagerId;
end;

procedure TDMServ.SelVisaCentersQryCalcFields(DataSet: TDataSet);
const sOnTour = '%s %s';
      ReadyToDayArr: array[0..1] of string = ('кал.', 'роб.');
begin
  Dataset.FieldByName('CalcEmbassyName').asString := IfThen( DataSet.FieldByName('CITYNAME').AsString <> EmptyStr, DataSet.FieldByName('CITYNAME').AsString + ', ', EmptyStr ) +
  Dataset.FieldByName('EMBASSYNAME').asString;

  if DataSet.FieldByName('SERVCOST').asFloat > 0 then
    Dataset.FieldByName('CalcServCost').asString := Format(sOnTour, [DataSet.FieldByName('SERVCOST').asString,
     Val[Dataset.FieldByName('SERVCOSTVAL').asInteger]]);

  if not DataSet.FieldByName('PAYBANKSERV').IsNull then Dataset.FieldByName('CalcPayBank').asString :=
    FloatToStr(DataSet.FieldByName('PAYBANKSERV').AsCurrency) + ' ' + Val[Dataset.FieldByName('CURRSERV').asInteger];

  if not DataSet.FieldByName('READYTODAYS').IsNull then Dataset.FieldByName('CalcReadyToDay').asString :=
   Format('%d %s %s', [DataSet.FieldByName('READYTODAYS').asInteger, ReadyToDayArr[ Dataset.FieldByName('READYTOTYPE').asInteger] ,
   ChangeDayLabel(DataSet.FieldByName('READYTODAYS').AsInteger) ]);
end;

procedure TDMServ.OneTypeDocQryCalcFields(DataSet: TDataSet);
var StrSum: string;
begin
  inherited;

  if DataSet.FieldByName('AGERESTRICTION').Value < 0 then
    DataSet.FieldByName('CalcAgeRestr').Value := Format('до %d р.', [Abs(DataSet.FieldByName('AGERESTRICTION').asInteger)])
  else
  if DataSet.FieldByName('AGERESTRICTION').Value > 0 then
    DataSet.FieldByName('CalcAgeRestr').Value := Format('з %d р.', [DataSet.FieldByName('AGERESTRICTION').asInteger])
  else DataSet.FieldByName('CalcAgeRestr').Value := '';

  if not  DataSet.FieldByName('MARRIEDSTATE').IsNull then
    DataSet.FieldByName('CalcMarried').Value := LoadResString(pMarriedMUaIdents[DataSet.FieldByName('MARRIEDSTATE').asInteger]);

  if DataSet.FieldByName('ExpireMonths').IsNull then DataSet.FieldByName('CalcEXPIREMONTHS').asString := ''
  else DataSet.FieldByName('CalcEXPIREMONTHS').asString  := DataSet.FieldByName('ExpireMonths').AsString + ' ' + Expire[DataSet.FieldByName('EXPIREPERIOD').AsInteger];

  if DataSet.FieldByName('ISSUEDMONTHS').IsNull then DataSet.FieldByName('CalcISSUEDMONTHS').AsString := ''
  else DataSet.FieldByName('CalcISSUEDMONTHS').AsString :=  DataSet.FieldByName('ISSUEDMONTHS').AsString + ' ' + Expire[ DataSet.FieldByName('ISSUESPERIOD').asinteger ];

  if DataSet.FieldByName('DOCFORLASTCOUNT').IsNull then DataSet.FieldByName('CalcDocForLast').asString := ''
  else DataSet.FieldByName('CalcDocForLast').asString := DataSet.FieldByName('DOCFORLASTCOUNT').AsString + ' ' +
        Expire[DataSet.FieldByName('DOCFORLASTPERIOD').asInteger];

  if ( DataSet.FieldByName('Summa').Value = 0) and ( DataSet.FieldByName('FUNDING').isNull ) then
    DataSet.FieldByName('CalcSum').asString := ''
  else
  begin
    if DataSet.FieldByName('FUNDING').asString = 'T' then StrSum := 'Додаткове фінансування '
    else if DataSet.FieldByName('FUNDING').asString = 'W' then StrSum := 'Додаткове фін. без суми '
    else if DataSet.FieldByName('FUNDING').asString = 'F' then StrSum := 'Основний дохід '
    else StrSum := 'Банк';
    DataSet.FieldByName('CalcSum').asString := StrSum;
  end;

  if not DataSet.FieldByName('SETOFDOCUMENT').IsNull or not DataSet.FieldByName('SAMETYPEDOCID').IsNull then
    DataSet.FieldByName('CalcSameTypeDoc').asString := Format('%s / %s', [
    DataSet.FieldByName('SETOFDOCUMENT').asString, DataSet.FieldByName('SAMETYPEDOCID').asString ]);
end;

procedure TDMServ.View_EmbassyDocumDlg_OneTypeDocDBGridCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var ColName: String;
    FORINDInd:Integer;
    FORADDMANUALInd:Integer;
    RETURNEDInd :Integer;
    TRANSMITInd :Integer;
    BEGINDOCInd :Integer;
    TYPENAMEInd :Integer;
begin

  TYPENAMEInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('TYPENAME').Index;
  FORINDInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('FORIND').Index;
  FORADDMANUALInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('FORADDMANUAL').Index;
  RETURNEDInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('RETURNED').Index;
  TRANSMITInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('TRANSMIT').Index;
  BEGINDOCInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('BEGINDOC').Index;

  if Elem_OneTypeDocQry.GetFocusedViewValue('TYPENAME',AViewInfo) =  null then
    ACanvas.Font.Color := clDkGray;

  if Elem_OneTypeDocQry.GetFocusedViewValue('ISUSE',AViewInfo) =  'F' then
    ACanvas.Font.Color := clRed;

  if AViewInfo.Item.Index in [FORINDInd,FORADDMANUALInd,RETURNEDInd,TRANSMITInd,BEGINDOCInd] then
    ACanvas.Brush.Style := bsSolid;

end;

procedure TDMServ.FilingQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcFieldName').AsString :=
  Elem_ANKETTEMPQry.DB.FieldByName(DataSet.FieldByName('FieldName').AsString).DisplayLabel;
end;

procedure TDMServ.HtlGrpQryNewRecord(DataSet: TDataSet);
begin
  Dataset.FieldByName('ADDMANID').asInteger := CurManager;
end;

procedure TDMServ.IntrstImgQryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('SHOWLOC').AsBoolean := True;
  DataSet.FieldByName('SHOWWEB').AsBoolean := True;
end;

procedure TDMServ.DrvImgQryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('SHOWLOC').AsBoolean := True;
  DataSet.FieldByName('SHOWWEB').AsBoolean := True;
end;

procedure TDMServ.WebSiteQryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ADDMANID').asInteger := CurManager;
end;

procedure TDMServ.PersonQryNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('ADDMANID').asInteger := CurManager;
end;

{procedure TDMServ.AddAddresToHistory(Dataset:TDataset; FieldIdName, FieldKindStreet, FieldCityID, FieldProvinceId,
                                     FieldStreetName,FieldBuilding,FieldTenement:Widestring );
var Values : array of Core.TFieldValue;
    KeyData: Core.TFieldValue;
begin
  SetLength( Values, 6 );
  Values[0].FieldName := FieldKindStreet;
  Values[0].Value := Dataset.fieldByName(FieldKindStreet).Value;

  Values[1].FieldName := FieldCityID;
  Values[1].Value := Dataset.fieldByName(FieldCityID).Value;

  Values[2].FieldName := FieldProvinceId;
  Values[2].Value := Dataset.fieldByName(FieldProvinceId).Value;

  Values[3].FieldName := FieldStreetName;
  Values[3].Value := Dataset.fieldByName(FieldStreetName).Value;

  Values[4].FieldName := FieldBuilding;
  Values[4].Value := Dataset.fieldByName(FieldBuilding).Value;

  Values[5].FieldName := FieldTenement;
  Values[5].Value := Dataset.fieldByName(FieldTenement).Value;

  KeyData.FieldName := FieldIdName;
  KeyData.Value := Dataset.fieldByName(FieldIdName).Value;

  AddToMemData( MemDataAddresHistory, KeyData, Values );
end; }

procedure TDMServ.ViewSelTradeNameCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var TRADENAMEInd : Integer;
    AGENCYLOGOInd : Integer;
    PathToImage : WideString;
begin
  TRADENAMEInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('TRADENAME').Index;
  AGENCYLOGOInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('AGENCYLOGO').Index;

  if ( AViewInfo.Item.Index = TRADENAMEInd ) and ( AViewInfo.GridRecord.Values[TRADENAMEInd]='T' ) then
    ACanvas.Font.Style := [fsBold]
  else
  if ( AViewInfo.Item.Index = AGENCYLOGOInd )and ( AViewInfo.GridRecord.Values[AGENCYLOGOInd]<>null ) then
  begin
    PathToImage := GetNetAgencyFileName( AViewInfo.GridRecord.Values[AGENCYLOGOInd] ) ;
    if FileExists( PathToImage ) then
    begin
      ACanvas.Brush.Style := bsSolid;
      ViewDrawFillRect( Sender, AViewInfo, ACanvas );

      ShowTextImageInCellFromFile( Sender, ACanvas, AViewInfo, PathToImage, OptImgPosCenter, False );
      ADone:=True;
    end;
  end;
end;

procedure TDMServ.ViewSelCompanyByTradeNameCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var COMPANYNAMEInd : Integer;
begin
  COMPANYNAMEInd := TcxGridDBTableView( Sender ).GetColumnByFieldName('COMPANYNAME').Index;

  if ( AViewInfo.Item.Index = COMPANYNAMEInd )and ( AViewInfo.GridRecord.Values[COMPANYNAMEInd] = 'T' ) then
    ACanvas.Font.Style := [fsBold];
end;

procedure TDMServ.ViewTaxSystemDetailINCOMETAXABSGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if AText <> '' then AText :=AText+ ' %';
end;

{procedure TDMServ.CompTaxLogMemTableEhBeforePost(DataSet: TDataSet);
begin
   DataSet.FieldByName('ManId').AsInteger := DMServ.CurManager;
   DataSet.FieldByName('EDITDATE').AsDateTime := Now;
end; }

procedure TDMServ.ExistCompQryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('CalcName').AsString:= MyIfThen( DataSet.FieldByName('TRADENAME').asString<>'',
                                                       DataSet.FieldByName('TRADENAME').asString+'/', '')+ DataSet.FieldByName('NAME').asString; 
end;

function TDMServ.SrvLinColumnPriceButClick(Elem:TDBShemaView; Sender: TObject; AButtonIndex: Integer):boolean;
var CaptColPrice :WideString;
    CaptColCurrId :WideString;
    CaptCost: WideString;
    Cost  : Variant;
    CurrId:Variant;
    DisplText:string;
    HaveCost:Integer;
begin
  CaptCost := TcxGridDBTableView(Elem.ViewList).GetColumnByFieldName('HAVECOST').Caption;
  CaptColPrice := TcxGridDBTableView(Elem.ViewList).GetColumnByFieldName('COST').Caption;
  CaptColCurrId := TcxGridDBTableView(Elem.ViewList).GetColumnByFieldName('CURRID').Caption;

  HaveCost:= Elem.GetVerticalGridGridByCaptionValue( CaptCost );
  Cost := Elem.GetVerticalGridGridByCaptionValue( CaptColPrice );
  CurrId := Elem.GetVerticalGridGridByCaptionValue( CaptColCurrId );
  DisplText :='';

  if (HaveCost<>1)and(HaveCost<>2) then exit;
  if ShowInputPrice( TControl(Sender), Elem_CurrencyQry,  Cost, CurrId, DisplText, 37, True ) then
  begin
    Elem.UpdateVerticalGridFocusValue( Sender , DisplText );
    Elem.UpdateVerticalGridByCaptionValue( Sender, CaptColPrice, Cost );
    Elem.UpdateVerticalGridByCaptionValue( Sender, CaptColCurrId, CurrId );
    result:=True;
  end;
end;

function TDMServ.SrvLinHAVECOSTPropertiesEditValueChanged(Elem:TDBShemaView; Sender: TObject):Boolean;
var HaveCost:variant;
begin
  HaveCost := Elem.GetVerticalGridGridByFieldNameValue('HAVECOST', TcxGridDBtableView(Elem.ViewList) );
  result := False;
  if (HaveCost<>1) and (HaveCost<>2) then
  begin
    Elem.UpdateVerticalGridByFieldNameValue(Sender,'COST', null, TcxGridDBtableView( Elem.ViewList) );
    Elem.UpdateVerticalGridByFieldNameValue(Sender,'CalcPrice', null, TcxGridDBtableView( Elem.ViewList) );
    result := True;
  end;
end;

procedure TDMServ.ViewDrvSrvLnkListCalcPricePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  SrvLinColumnPriceButClick( Elem_DrvSrvLnkQry, Sender, AButtonIndex );
end;

procedure TDMServ.ViewHtlSrvLnkListColumnPricePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  SrvLinColumnPriceButClick( Elem_HtlSrvLnkQry, Sender, AButtonIndex );
end;

procedure TDMServ.ViewBldSrvLnkListCalcPricePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  SrvLinColumnPriceButClick( Elem_BldSrvLnkQry, Sender, AButtonIndex );
end;

procedure TDMServ.ViewRoomSrvLnkListCalcPricePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  SrvLinColumnPriceButClick( Elem_RoomSrvLnkQry, Sender, AButtonIndex );
end;

procedure TDMServ.ViewDrvSrvLnkListHAVECOSTPropertiesEditValueChanged(
  Sender: TObject);
begin
  SrvLinHAVECOSTPropertiesEditValueChanged( Elem_DrvSrvLnkQry, Sender );
end;

procedure TDMServ.ViewHtlSrvLnkListHAVECOSTPropertiesEditValueChanged(
  Sender: TObject);
begin
  SrvLinHAVECOSTPropertiesEditValueChanged( Elem_HtlSrvLnkQry, Sender );
end;

procedure TDMServ.ViewBldSrvLnkListHAVECOSTPropertiesEditValueChanged(
  Sender: TObject);
begin
  SrvLinHAVECOSTPropertiesEditValueChanged( Elem_BldSrvLnkQry, Sender );
end;

procedure TDMServ.ViewRoomSrvLnkListHAVECOSTPropertiesEditValueChanged(
  Sender: TObject);
begin
  SrvLinHAVECOSTPropertiesEditValueChanged( Elem_RoomSrvLnkQry, Sender );
end;

procedure TDMServ.ViewHtlRoomROOMTYPEIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var IndColEXPANDNAMEID :Integer;
    DisplayTextEXPANDNAME :string;
begin

  IndColEXPANDNAMEID := TcxGridDBTableView(Sender).GetColumnByFieldName('EXPANDNAMEID').Index;
  DisplayTextEXPANDNAME := ARecord.DisplayTexts[IndColEXPANDNAMEID];
  AText := AText + ' '+DisplayTextEXPANDNAME;
end;

procedure TDMServ.ViewHtlRoomROOMTYPEIDShortGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var IndColEXPANDNAMEIDShort:Integer;
    DisplayTextEXPANDNAMEShort :string;
begin
  IndColEXPANDNAMEIDShort := TcxGridDBTableView(Sender).GetColumnByFieldName('EXPANDNAMEIDExt').Index;
  DisplayTextEXPANDNAMEShort := ARecord.DisplayTexts[IndColEXPANDNAMEIDShort];
  AText := AText + ' '+DisplayTextEXPANDNAMEShort;
end;

procedure TDMServ.ViewHtlRoomSelROOMTYPEIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var IndColEXPANDNAMEID :Integer;
    DisplayTextEXPANDNAME :string;
begin
  IndColEXPANDNAMEID := TcxGridDBTableView(Sender).GetColumnByFieldName('EXPANDNAMEID').Index;
  DisplayTextEXPANDNAME := ARecord.DisplayTexts[IndColEXPANDNAMEID];
  AText := AText + ' '+DisplayTextEXPANDNAME;
end;

procedure TDMServ.ViewHtlRoomSelEXTNAMEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var IndColEXPANDNAMEIDShort:Integer;
    DisplayTextEXPANDNAMEShort :string;
begin
  IndColEXPANDNAMEIDShort := TcxGridDBTableView(Sender).GetColumnByFieldName('EXPANDNAMEIDExt').Index;
  DisplayTextEXPANDNAMEShort := ARecord.DisplayTexts[IndColEXPANDNAMEIDShort];
  AText := AText + ' '+DisplayTextEXPANDNAMEShort;
end;

procedure TDMServ.ViewHtlRoomSelCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var IndColDeleted:Integer;
    IndColIMPORTED:Integer;
begin
  IndColDeleted := TcxGridDBTableView(Sender).GetColumnByFieldName('DELETED').Index;
  IndColIMPORTED := TcxGridDBTableView(Sender).GetColumnByFieldName('IMPORTED').Index;
  if AViewInfo.GridRecord.Values[ IndColDeleted ]='T' then
  ACanvas.Font.Color := clRed;

  if ( AViewInfo.Item.Caption ='Тип кімнати' ) and ( AViewInfo.GridRecord.Values[IndColIMPORTED]='T' ) then
  begin
    ACanvas.Brush.Style := bsSolid;
    ViewDrawFillRect( Sender, AViewInfo, ACanvas );
    ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServDic.BrowseImgList, 108, OptImgPosRight,AViewInfo.Text );

    ADone:=True;
  end;

  DMServDic.CustomDrawLnghangeIcon( 'ROOMTYPEID', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

Function TDMServ.GetCurrentHotelDocFolder( aView:TcxGridDBTableView; ARecord: TcxCustomGridRecord ):String;
var HOTELDOCIDInd : Integer;
    FILENAMEInd : Integer;
    CountryEn:WideString;
begin
  HOTELDOCIDInd := aView.GetColumnByFieldName('HOTELID').Index;
  FILENAMEInd := aView.GetColumnByFieldName('FILENAME').Index;
  CountryEn := Elem_BrHotelQry.DB.FieldByName('COUNTRY_ENG').AsString;
  if ( ARecord.Values[HOTELDOCIDInd] <> null ) and ( ARecord.Values[FILENAMEInd]<>null ) then
    result := GetHotelDocFolder( CountryEn, ARecord.Values[HOTELDOCIDInd] )
  else result :='';

end;

procedure TDMServ.ViewHotelDocColumnSizeGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var i:Integer;
    HOTELDOCIDInd  : Integer;
    FILENAMEInd    : Integer;
    DocumentFolder : WideString;
begin
  DocumentFolder := GetCurrentHotelDocFolder( TcxGridDBTableView( Sender.GridView ), ARecord );
  FILENAMEInd := TcxGridDBTableView( Sender.GridView ).GetColumnByFieldName('FILENAME').Index;

  if (DocumentFolder <>'') and ( ARecord.Values[FILENAMEInd]<>null ) then
    AText := Format('%d KB', [ GetFileSize(GetLocalFileName( IncludeTrailingPathDelimiter(DocumentFolder) + ARecord.Values[FILENAMEInd] ) )] );

end;

procedure TDMServ.ViewHotelDocFILENAMEPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var SelectFile:string;
    InitDir:string;
    DocumentFolder : WideString;
begin
  InitDir := OptionSet.InboxFolder;
  SelectFile := MySelectFile( InitDir, 'Текстовий документ (*.doc;*.rtf;*.txt)|*.doc;*.rtf;*.txt|Електронна таблиця (*.xls;*.csv)|*.xls;*.csv|Презентація PowerPoint (*.ppt)|*.ppt|Сторінка в Internet (*.htm;*.html;*.url)|*.htm;*.html;*.url|Всі файли (*.*)|*.*');
  if (SelectFile <> '^') and ( FileExists( SelectFile ) ) then
  begin
    Elem_HTLDOCQry.UpdateVerticalGridFocusValue( Sender, ExtractFileName( SelectFile ) );
    DocumentFolder := GetHotelDocFileName( Elem_BrHotelQry.DB.FieldByName('COUNTRY_ENG').AsString,
                                           Elem_HTLDOCQry.GetVerticalGridGridByCaptionValue('HOTELID'),
                                           ExtractFileName( SelectFile ) );
    MyCopyFile( SelectFile, DocumentFolder  );
  end;
end;

procedure TDMServ.ViewBankD_OPENGetDataText(Sender: TcxCustomGridTableItem;
  ARecordIndex: Integer; var AText: String);
var aTime:TTime;
begin
  if AText <> '' then
  begin
    aTime := UnitProc.GetTime( StrToDateTime(AText) );
    if aTime <> 0 then
      aText := TimeToStr( aTime )
    else
    aText := '';
  end;
end;

procedure TDMServ.ViewServicesSMALLICONPropertiesCustomClick(
  Sender: TObject);
begin
  TcxImage(Sender).LoadFromFile;
end;

procedure TDMServ.ViewHtlGrpLOGOIMAGEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var SelectFile:string;
    NewFileName:string;
begin
  SelectFile :=OpenFileName('','(*.jpg,*.png,*.jpeg,*.gif,*.bmp)|*.jpg;*.png;*.jpeg;*.gif;*.bmp');       
  if SelectFile <> '^' then
  begin
    if not CheckExtOnGraficFile( ExtractFileExt(SelectFile) ) then
      MyShowMessageDlg( ErrMesSelectedFileIsNotIcon, mtError, but_Ok )
    else
    begin
      NewFileName := ExtractFileName( SelectFile );

      MyCopyFileApi( SelectFile, GetGroupLogoFileFolder + NewFileName );
      Elem_HTLGRPQry.UpdateVerticalGridFocusValue( Sender, NewFileName );
    end;
  end;
end;

procedure TDMServ.ViewHtlGrpCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var  FileName:String;
     indLogo:integer;
begin
  indLogo := TcxGridDBTableView(Sender).GetColumnByFieldName('LOGOIMAGE').Index;

  if ( AViewInfo.Item.Caption = '') then
  begin
    ACanvas.Brush.Style := bsSolid;
    ViewDrawFillRect( Sender, AViewInfo, ACanvas );
    if AViewInfo.GridRecord.Values[indLogo] <> null then
    begin
      FileName :=  CheckLastSleshOnPath(  GetGroupLogoFileFolder, True ) + VarToStr( AViewInfo.GridRecord.Values[indLogo] );
      ShowTextImageInCellFromFile( Sender, ACanvas, AViewInfo, FileName , OptImgPosCenter, False, True );
      ADone:=True;
    end;
  end;
end;

procedure TDMServ.ViewCountryTypeInfoTABLE_INDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
  if ARecord.Values[Sender.Index]=null then AText:='';    //AText = 'Немає' then
end;

procedure TDMServ.TreeCOUNTRY_TEMPL_ADM_UNITID_ADMIN_UNITPropertiesInitPopup(
  Sender: TObject);
begin
  //SetFilterOnWievForManyColumns( ViewAdminUnitList,['ID_CITY_ADM_UNT_ITEMS_TYPE'],[1],['='],[fboAnd] );
end;

procedure TDMServ.ViewBedTypeCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
  DMServDic.CustomDrawLnghangeIcon( 'SHORTNAME', 'LNGNOTFOUND', 'LNGCHANGE_SH', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewRoomExpandNameCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'EXPANDNAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
  DMServDic.CustomDrawLnghangeIcon( 'EXTNAME', 'LNGNOTFOUND', 'LNGCHANGE_EX', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewHOTEL_BUILDSCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewHOTEL_BUILDSListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewHtkKindCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewHtlBuildCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'BUILDID', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewAdminUnitCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewAdminUnitListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewAdminUnitSubCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewAdminUnitSubListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewServGroupCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'SERVICEGROUPNAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewServGroupListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'SERVICEGROUPNAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewResortCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewInfraCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewInfraListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewNaturObjCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewNaturObjListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewCountryTypeInfoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewKindStreetCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewKindStreetListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewServicesCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  DMServDic.CustomDrawLnghangeIcon( 'NAME', 'LNGNOTFOUND', 'LNGCHANGE', Sender, ACanvas, AViewInfo, ADone );
end;

procedure TDMServ.ViewComunicationTypeICONPropertiesCustomClick(
  Sender: TObject);
begin
  TcxImage(Sender).LoadFromFile;
end;

procedure TDMServ.SelContractQryCalcFields(DataSet: TDataSet);
begin
  with DataSet.FieldByName('DAYCOUNT') do
  if not IsNull then DataSet.FieldByName('CalcActualDate').Value := StrToDate(BeginDate) + Value;
  DataSet.FieldByName('CalcShablon').Value := DMServ.GetFileNameWithMemo(DataSet.FieldByName('TEMPLATS'));
end;

procedure TDMServ.N1Click(Sender: TObject);
var NameHotel:WideString;
begin
  ChangeKeyBoardLayout( klUkrainian );
  NameHotel := VarToStr( Elem_BrHotelQry.View.GetColumnByFieldName('NAME').EditValue );
  Clipboard.AsText := NameHotel;
end;

function TDMServ.GetItsLocalLang: Boolean;
begin
  Result := true;//SelCommTransQry.FieldByName('LANGUAGEID').asInteger = nLocalLang;
end;

end.

//  SetFilterOnWievForManyColumns( ViewAdminUnitList,['ATYPE'],[1],['<>'],[fboAnd] );

  {var ColName: String;
    indTypeName : Integer;
    IndISuse  : Integer;
    IndFORIND : Integer;
    IndFORADDMANUAL : Integer;
    IndRETURNED : Integer;
    IndTRANSMIT : Integer;
    IndBEGINDOC : Integer;

  indTypeName := TcxGridDBTableView( Sender ).GetColumnByFieldName('TYPENAME').Index;
  IndISuse:= TcxGridDBTableView( Sender ).GetColumnByFieldName('ISUSE').Index;
  IndFORIND := TcxGridDBTableView( Sender ).GetColumnByFieldName('FORIND').Index;
  //IndFORADDMANUAL := TcxGridDBTableView( Sender ).GetColumnByFieldName('FORADDMANUAL').Index;
  //IndRETURNED := TcxGridDBTableView( Sender ).GetColumnByFieldName('RETURNED').Index;
  //IndTRANSMIT := TcxGridDBTableView( Sender ).GetColumnByFieldName('TRANSMIT').Index;
  //IndBEGINDOC := TcxGridDBTableView( Sender ).GetColumnByFieldName('BEGINDOC').Index;

  {if AViewInfo.GridRecord.Values[IndTYPENAME] = null then ACanvas.Font.Color := clDkGray;
  if AViewInfo.GridRecord.Values[IndISUSE] <> null then ACanvas.Font.Color := clRed;

  if (ColName = 'FORIND') or (ColName = 'FORADDMANUAL') or (ColName = 'RETURNED') or (ColName = 'TRANSMIT') or (ColName = 'BEGINDOC') then
  begin
    ACanvas.Brush.Style := bsSolid;

    if ( (AViewInfo.Item.Index = IndFORIND) and (AViewInfo.GridRecord.Values[IndFORIND]='T') ) or
       ( (AViewInfo.Item.Index = IndFORADDMANUAL) and (AViewInfo.GridRecord.Values[IndFORADDMANUAL]='T') ) or
       ( (AViewInfo.Item.Index = IndRETURNED) and (AViewInfo.GridRecord.Values[IndRETURNED]='T') ) or
       ( (AViewInfo.Item.Index = IndTRANSMIT) and (AViewInfo.GridRecord.Values[IndTRANSMIT]='T') ) or
       ( (AViewInfo.Item.Index = IndBEGINDOC) and (AViewInfo.GridRecord.Values[IndBEGINDOC]='T') ) then

    if ((ColName = 'FORIND') and ( Elem_OneTypeDocQry.DBBooleanValue['FORIND'] ))
      or ((ColName = 'FORADDMANUAL') and ( Elem_OneTypeDocQry.DBBooleanValue['FORADDMANUAL'] ))
      or ((ColName = 'RETURNED') and (Elem_OneTypeDocQry.DBBooleanValue['RETURNED'] ))
      or ((ColName = 'TRANSMIT') and ( Elem_OneTypeDocQry.DBBooleanValue['TRANSMIT'] ))
      or ((ColName = 'BEGINDOC') and ( Elem_OneTypeDocQry.DBBooleanValue['BEGINDOC'] )) then
    begin
      ViewDrawFillRect( Sender, AViewInfo, ACanvas );
      ShowTextImageInCell( Sender, ACanvas, AViewInfo, BrowseImgList, 69, OptImgPosRight );
      ADone:=True;
    end;
  end;}



//   \+\d{1,4}\(\d{1,5}\)\d(\d\d?)?\d\d\d\d       телефон ввід

Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True;User ID=SYSDBA;Extended Properties="Driver=Firebird/InterBase(r) driver;Dbname=troll:D:\_Apollo\_TOURIB_TEST.GDB;PWD=masterkey;UID=SYSDBA;"

