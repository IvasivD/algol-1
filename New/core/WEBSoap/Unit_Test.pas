unit Unit_Test;

interface

uses cefvcl,ceflib,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, core, StdCtrls, DB, IBCustomDataSet, IBQuery, IBDatabase,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridLevel, cxClasses, cxGridCustomView, DBTables, cxTimeEdit, DateUtils,
  cxTextEdit, cxImageComboBox, ImgList, Grids, DBGrids, IBUpdateSQL,
  IBStoredProc, cxPCdxBarPopupMenu, cxPC,UnitFunctLog, ExtCtrls,UnitProc,
  cxTL, cxGridBandedTableView, cxGridCardView, ADODB, Buttons,UnitIBQuery, UnitStructrureWebSoap,
  ComCtrls, cxCalendar, cxContainer, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxPropertiesStore,
  cxDBLookupComboBox, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData,TourCmnlIf,
  cxDBTL, cxCheckComboBox, cxCheckBox, UnitFrameSearchCity,UnitPreviewFiles,uLkJSON, xmldom, XMLIntf, msxmldom, XMLDoc,
  ComObj, MSXML,UnitApiSite, cxDataUtils,UnitFunctSoapDll, IBTable, UnitADOQuery,TourMbplIf;

type
  
 TMycxExtLookupComboBoxProperties = class(TcxExtLookupComboBoxProperties)
  protected
    procedure DoPrepareDisplayValue(const AEditValue: TcxEditValue; var ADisplayValue: TcxEditValue; AEditFocused: Boolean); override;
  end;

  TMyTcxExtLookupComboBox = class(TcxExtLookupComboBox)
  protected
    class function GetPropertiesClass: TcxCustomEditPropertiesClass; override;
  end;

  {TElementNameVisitor = class(TCefDomVisitorOwn)
  private
    FMemo: TMemo;
  protected
    procedure visit(const document: ICefDomDocument); override;
  public
    constructor Create(AMemo:TMemo); reintroduce;
  end;  }


  TcxExtLookupComboBox = class(TMyTcxExtLookupComboBox);


  TFrmTestSynchronizeWebSoap = class(TForm)
    Button1: TButton;
    IBTransaction: TIBTransaction;
    IBDatabase: TIBDatabase;
    MERGESOAPWEB: TIBQuery;
    HCountrySrc: TDataSource;
    HCitySrc: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewCountry: TcxGridDBTableView;
    ViewCity: TcxGridDBTableView;
    ViewCountryCOUNTRYID: TcxGridDBColumn;
    ViewCountryNAME: TcxGridDBColumn;
    ViewCountryNAME_ENG: TcxGridDBColumn;
    ViewCountryLATNAME: TcxGridDBColumn;
    ViewCountryMEMO: TcxGridDBColumn;
    ViewCityCOUNTRYID: TcxGridDBColumn;
    ViewCityCITYID: TcxGridDBColumn;
    ViewCityCOUNTRY: TcxGridDBColumn;
    ViewCityNAME: TcxGridDBColumn;
    ViewCityNAME_ENG: TcxGridDBColumn;
    ViewCityMEMO: TcxGridDBColumn;
    ViewCitySHOWWEB: TcxGridDBColumn;
    ViewCityASRESORT: TcxGridDBColumn;
    ViewCityRESORTTYPENAME: TcxGridDBColumn;
    ViewCityCalcCityName: TcxGridDBColumn;
    MERGESOAPWEBDS: TDataSource;
    HCountryQry: TIBQuery;
    HCityQry: TIBQuery;
    HCityQryCITYID: TIntegerField;
    HCityQryCOUNTRYID: TIntegerField;
    HCityQryCOUNTRY: TIBStringField;
    HCityQryNAME: TIBStringField;
    HCityQryNAME_ENG: TIBStringField;
    HCityQrySHOWWEB: TIBStringField;
    HCityQryMEMO: TMemoField;
    HCityQryASRESORT: TIBStringField;
    HCityQryRESORTTYPENAME: TIBStringField;
    TMUser: TIBQuery;
    TMUserDS: TDataSource;
    TMUserTMUSERID: TIntegerField;
    TMUserTMFULLNAME: TIBStringField;
    Button2: TButton;
    Button3: TButton;
    TourQry: TIBQuery;
    TourSrc: TDataSource;
    TemplQry: TIBQuery;
    TemplQryTOURID: TIntegerField;
    TemplQryTOURGROUPID: TIntegerField;
    TemplQryTOURTEMPLATEID: TIntegerField;
    TemplQryTEMPLATENAME: TStringField;
    TemplQryTOURTIME: TDateTimeField;
    TemplQryDAYCOUNT: TSmallintField;
    TemplQryDISABLED: TStringField;
    TemplQrySHOWWEB: TStringField;
    TemplQryGROUPMIN: TSmallintField;
    TemplQryGROUPMAX: TSmallintField;
    TemplQryMEMO: TMemoField;
    TemplQryVARIANTNAME: TStringField;
    TemplQryTOURDATE: TDateTimeField;
    TemplQryVENDOR: TStringField;
    TemplQryORDERMEMO: TMemoField;
    TemplQryVENDORID: TIntegerField;
    TemplQryPARENTID: TIntegerField;
    TemplQryTOURVARIANTID: TIntegerField;
    TemplQryBONUSCHECKTRIP: TIBStringField;
    TemplQryBONUSCHECKHOTEL: TIBStringField;
    TemplQryBONUSCHECKINSURE: TIBStringField;
    TemplQryBONUSCHECKVISA: TIBStringField;
    TemplQryBONUSCHECKEXCURS: TIBStringField;
    TemplQryBONUSCHECKOTHER: TIBStringField;
    TemplSrc: TDataSource;
    cxGridViewRepository: TcxGridViewRepository;
    ViewStops: TcxGridDBTableView;
    ViewStopsSHEDITEMID: TcxGridDBColumn;
    ViewStopsSTOPORDER: TcxGridDBColumn;
    ViewStopsCOUNTRYNAME: TcxGridDBColumn;
    ViewStopsCITYNAME: TcxGridDBColumn;
    ViewStopsARRIVETIME: TcxGridDBColumn;
    ViewStopsDEPARTTIME: TcxGridDBColumn;
    ViewStopsARRIVEDAY: TcxGridDBColumn;
    ViewStopsDEPARTDAY: TcxGridDBColumn;
    ViewHotels: TcxGridDBTableView;
    ViewHotelsTOURTEMPLATEID: TcxGridDBColumn;
    ViewHotelsTOURROOMID: TcxGridDBColumn;
    ViewHotelsHOTELID: TcxGridDBColumn;
    ViewHotelsNAME: TcxGridDBColumn;
    ViewHotelsSTARS: TcxGridDBColumn;
    ViewHotelsCITY: TcxGridDBColumn;
    ViewHotelsCalcHotel: TcxGridDBColumn;
    ViewHotelsBEGINDAY: TcxGridDBColumn;
    ViewHotelsDAYCOUNT: TcxGridDBColumn;
    ViewHotelsFROMTIME: TcxGridDBColumn;
    ViewHotelsTILLTIME: TcxGridDBColumn;
    ViewHotelsGROUPMIN: TcxGridDBColumn;
    ViewHotelsGROUPMAX: TcxGridDBColumn;
    ViewHotelsNETPERGROUP: TcxGridDBColumn;
    ViewHotelsNETPERGROUP2: TcxGridDBColumn;
    ViewHotelsNETVAL: TcxGridDBColumn;
    ViewHotelsNETVAL2: TcxGridDBColumn;
    ViewHotelsRATE: TcxGridDBColumn;
    ViewHotelsRATE2: TcxGridDBColumn;
    ViewHotelsFORPAY: TcxGridDBColumn;
    ViewHotelsFORPAY2: TcxGridDBColumn;
    ViewHotelsCURRENCYSHORT: TcxGridDBColumn;
    ViewHotelsVENDOR: TcxGridDBColumn;
    ViewHotelsFROMDATE: TcxGridDBColumn;
    ViewHotelsCalcTillDate: TcxGridDBColumn;
    ViewHotelsDISABLED: TcxGridDBColumn;
    ViewHotelsOPTIONAL: TcxGridDBColumn;
    ViewHotelsHIDDEN: TcxGridDBColumn;
    ViewHotelsPERIODTYPE: TcxGridDBColumn;
    ViewHotelsCOUNTRY: TcxGridDBColumn;
    ViewDescription: TcxGridDBTableView;
    ViewDescriptionTOURDESCRIPTID: TcxGridDBColumn;
    ViewDescriptionTOURTEMPLATEID: TcxGridDBColumn;
    ViewDescriptionNAME: TcxGridDBColumn;
    ViewExcurs: TcxGridDBTableView;
    ViewExcursTOURTEMPLATEID: TcxGridDBColumn;
    ViewExcursTOUREXCURID: TcxGridDBColumn;
    ViewExcursEXCURSID: TcxGridDBColumn;
    ViewExcursCITY: TcxGridDBColumn;
    ViewExcursNAME: TcxGridDBColumn;
    ViewExcursBEGINDAY: TcxGridDBColumn;
    ViewExcursCalcExTime: TcxGridDBColumn;
    ViewExcursEXTIME: TcxGridDBColumn;
    ViewExcursTILLTIME: TcxGridDBColumn;
    ViewExcursTYPEEX: TcxGridDBColumn;
    ViewExcursDRIVE: TcxGridDBColumn;
    ViewExcursGROUPMIN: TcxGridDBColumn;
    ViewExcursGROUPMAX: TcxGridDBColumn;
    ViewExcursATDATE: TcxGridDBColumn;
    ViewExcursNETPERGROUP: TcxGridDBColumn;
    ViewExcursNETPERGROUP2: TcxGridDBColumn;
    ViewExcursCURRENCYSHORT: TcxGridDBColumn;
    ViewExcursVENDOR: TcxGridDBColumn;
    ViewExcursDISABLED: TcxGridDBColumn;
    ViewExcursOPTIONAL: TcxGridDBColumn;
    ViewExcursHIDDEN: TcxGridDBColumn;
    ViewExcursNETVAL: TcxGridDBColumn;
    ViewExcursNETVAL2: TcxGridDBColumn;
    ViewExcursRATE: TcxGridDBColumn;
    ViewExcursRATE2: TcxGridDBColumn;
    ViewExcursFORPAY: TcxGridDBColumn;
    ViewExcursFORPAY2: TcxGridDBColumn;
    ViewExcursPERIODTYPE: TcxGridDBColumn;
    ViewOther: TcxGridDBTableView;
    ViewOtherTOURTEMPLATEID: TcxGridDBColumn;
    ViewOtherTOUROTHERID: TcxGridDBColumn;
    ViewOtherSERVCODEID: TcxGridDBColumn;
    ViewOtherSERVNAME: TcxGridDBColumn;
    ViewOtherBEGINDAY: TcxGridDBColumn;
    ViewOtherEXTIME: TcxGridDBColumn;
    ViewOtherCITY: TcxGridDBColumn;
    ViewOtherGROUPMIN: TcxGridDBColumn;
    ViewOtherGROUPMAX: TcxGridDBColumn;
    ViewOtherNETPERGROUP: TcxGridDBColumn;
    ViewOtherNETPERGROUP2: TcxGridDBColumn;
    ViewOtherATDATE: TcxGridDBColumn;
    ViewOtherNETVAL: TcxGridDBColumn;
    ViewOtherNETVAL2: TcxGridDBColumn;
    ViewOtherRATE: TcxGridDBColumn;
    ViewOtherRATE2: TcxGridDBColumn;
    ViewOtherFORPAY: TcxGridDBColumn;
    ViewOtherFORPAY2: TcxGridDBColumn;
    ViewOtherCURRENCYSHORT: TcxGridDBColumn;
    ViewOtherDISABLED: TcxGridDBColumn;
    ViewOtherOPTIONAL: TcxGridDBColumn;
    ViewOtherHIDDEN: TcxGridDBColumn;
    ViewOtherPERIODTYPE: TcxGridDBColumn;
    ViewOtherCalcExTime: TcxGridDBColumn;
    ViewOtherVENDOR: TcxGridDBColumn;
    ViewOtherList: TcxGridDBTableView;
    ViewOtherListTOURTEMPLATEID: TcxGridDBColumn;
    ViewOtherListTOUROTHERID: TcxGridDBColumn;
    ViewOtherListSERVCODEID: TcxGridDBColumn;
    ViewOtherListSERVNAME: TcxGridDBColumn;
    ViewOtherListCITY: TcxGridDBColumn;
    ViewOtherListBEGINDAY: TcxGridDBColumn;
    ViewOtherListATDATE: TcxGridDBColumn;
    ViewOtherListEXTIME: TcxGridDBColumn;
    ViewOtherListGROUPMIN: TcxGridDBColumn;
    ViewOtherListGROUPMAX: TcxGridDBColumn;
    ViewOtherListNETPERGROUP: TcxGridDBColumn;
    ViewOtherListNETPERGROUP2: TcxGridDBColumn;
    ViewOtherListCURRENCYSHORT: TcxGridDBColumn;
    ViewOtherListVENDOR: TcxGridDBColumn;
    ViewOtherListDISABLED: TcxGridDBColumn;
    ViewOtherListOPTIONAL: TcxGridDBColumn;
    ViewOtherListHIDDEN: TcxGridDBColumn;
    ViewOtherListNETVAL: TcxGridDBColumn;
    ViewOtherListNETVAL2: TcxGridDBColumn;
    ViewOtherListRATE: TcxGridDBColumn;
    ViewOtherListRATE2: TcxGridDBColumn;
    ViewOtherListFORPAY: TcxGridDBColumn;
    ViewOtherListFORPAY2: TcxGridDBColumn;
    ViewOtherListPERIODTYPE: TcxGridDBColumn;
    ViewOtherListCalcExTime: TcxGridDBColumn;
    ViewTemplate: TcxGridDBTableView;
    ViewTemplateTOURID: TcxGridDBColumn;
    ViewTemplateTOURGROUPID: TcxGridDBColumn;
    ViewTemplateTOURTEMPLATEID: TcxGridDBColumn;
    ViewTemplateTEMPLATENAME: TcxGridDBColumn;
    ViewTemplateTOURTIME: TcxGridDBColumn;
    ViewTemplateDAYCOUNT: TcxGridDBColumn;
    ViewTemplateDISABLED: TcxGridDBColumn;
    ViewTemplateSHOWWEB: TcxGridDBColumn;
    ViewTemplateGROUPMIN: TcxGridDBColumn;
    ViewTemplateGROUPMAX: TcxGridDBColumn;
    ViewTemplateMEMO: TcxGridDBColumn;
    ViewTemplateVARIANTNAME: TcxGridDBColumn;
    ViewTemplateTOURDATE: TcxGridDBColumn;
    ViewTemplateVENDOR: TcxGridDBColumn;
    ViewTemplateORDERMEMO: TcxGridDBColumn;
    ViewTemplateVENDORID: TcxGridDBColumn;
    ViewTemplatePARENTID: TcxGridDBColumn;
    ViewTemplateTOURVARIANTID: TcxGridDBColumn;
    ViewTemplateBONUSCHECKTRIP: TcxGridDBColumn;
    ViewTemplateBONUSCHECKHOTEL: TcxGridDBColumn;
    ViewTemplateBONUSCHECKINSURE: TcxGridDBColumn;
    ViewTemplateBONUSCHECKVISA: TcxGridDBColumn;
    ViewTemplateBONUSCHECKEXCURS: TcxGridDBColumn;
    ViewTemplateBONUSCHECKOTHER: TcxGridDBColumn;
    ViewGroup: TcxGridDBTableView;
    ViewGroupTOURGROUPID: TcxGridDBColumn;
    ViewGroupTOURDATE: TcxGridDBColumn;
    ViewGroupMEMO: TcxGridDBColumn;
    ViewGroupTOURTEMPLATEID: TcxGridDBColumn;
    ViewGroupTEMPLATENAME: TcxGridDBColumn;
    ViewGroupVARIANTNAME: TcxGridDBColumn;
    ViewGroupTOURVARIANTID: TcxGridDBColumn;
    ViewCostSum: TcxGridDBTableView;
    ViewCostSumRATECURRID: TcxGridDBColumn;
    ViewCostSumNETVAL: TcxGridDBColumn;
    ViewCostSumRATE: TcxGridDBColumn;
    ViewCostSumAGENTPAY: TcxGridDBColumn;
    ViewCostSumFORPAY: TcxGridDBColumn;
    ViewCostSumCURRENCYSHORT: TcxGridDBColumn;
    ViewCost: TcxGridDBTableView;
    ViewCostSERVKIND: TcxGridDBColumn;
    ViewCostRATECURRID: TcxGridDBColumn;
    ViewCostCURRENCYSHORT: TcxGridDBColumn;
    ViewCostNETVAL: TcxGridDBColumn;
    ViewCostRATE: TcxGridDBColumn;
    ViewCostAGENTPAY: TcxGridDBColumn;
    ViewCostFORPAY: TcxGridDBColumn;
    ViewCostCalcService: TcxGridDBColumn;
    ViewTour: TcxGridDBTableView;
    ViewTourID: TcxGridDBColumn;
    ViewTourTOURNAME: TcxGridDBColumn;
    ViewTourSPECIALDATEID: TcxGridDBColumn;
    ViewTourPROGRAMNAME: TcxGridDBColumn;
    ViewTourAREACTIVEPROMO: TcxGridDBColumn;
    ViewTourSHORTTOURNAME: TcxGridDBColumn;
    ViewTourCOUNTRYCODE: TcxGridDBColumn;
    ViewTourIND: TcxGridDBColumn;
    ViewTourGRP: TcxGridDBColumn;
    ViewTourSHOWWEB: TcxGridDBColumn;
    ViewTourCalcDayCount: TcxGridDBColumn;
    ViewTourMANAGER: TcxGridDBColumn;
    ViewTourPRIORCOUNTRY: TcxGridDBColumn;
    ViewTourISDISABLED: TcxGridDBColumn;
    ViewTourISPSEUDO: TcxGridDBColumn;
    ViewTourCANADDGROUP: TcxGridDBColumn;
    ViewTourMANAGERID: TcxGridDBColumn;
    ViewTourMEMO: TcxGridDBColumn;
    ViewTourDAYCOUNT: TcxGridDBColumn;
    ViewTourISARHIVED: TcxGridDBColumn;
    ViewTourBONUSPROGRAMID: TcxGridDBColumn;
    ViewTourREADYTODAYS: TcxGridDBColumn;
    ViewTourCUSTOMLIST1: TcxGridDBColumn;
    ViewTourCUSTOMLIST2: TcxGridDBColumn;
    ViewTourTEMPLAT: TcxGridDBColumn;
    ViewTourDAYCOUNTMORE: TcxGridDBColumn;
    ViewTourDAYCOUNTNIGHT: TcxGridDBColumn;
    ViewTourLOCALENAMES: TcxGridDBColumn;
    ViewTourBONUSFROMDATE: TcxGridDBColumn;
    ViewTourBONUSFROMSHOWWEB: TcxGridDBColumn;
    ViewTourBONUSTILLDATE: TcxGridDBColumn;
    ViewTourBONUSTILLSHOWWEB: TcxGridDBColumn;
    ViewTourSPECIALNAME: TcxGridDBColumn;
    ViewTourTRIPROUTEID: TcxGridDBColumn;
    ViewVisa: TcxGridDBTableView;
    ViewVisaTOURTEMPLATEID: TcxGridDBColumn;
    ViewVisaTOURVISAID: TcxGridDBColumn;
    ViewVisaCOUNTRYID: TcxGridDBColumn;
    ViewVisaCOUNTRY: TcxGridDBColumn;
    ViewVisaBEGINDAY: TcxGridDBColumn;
    ViewVisaFROMDATE: TcxGridDBColumn;
    ViewVisaDAYCOUNT: TcxGridDBColumn;
    ViewVisaGROUPMIN: TcxGridDBColumn;
    ViewVisaGROUPMAX: TcxGridDBColumn;
    ViewVisaCURRENCYSHORT: TcxGridDBColumn;
    ViewVisaNETPERGROUP: TcxGridDBColumn;
    ViewVisaNETPERGROUP2: TcxGridDBColumn;
    ViewVisaNETVAL: TcxGridDBColumn;
    ViewVisaNETVAL2: TcxGridDBColumn;
    ViewVisaRATE: TcxGridDBColumn;
    ViewVisaRATE2: TcxGridDBColumn;
    ViewVisaFORPAY: TcxGridDBColumn;
    ViewVisaFORPAY2: TcxGridDBColumn;
    ViewVisaVENDOR: TcxGridDBColumn;
    ViewVisaCalcTillDate: TcxGridDBColumn;
    ViewVisaDISABLED: TcxGridDBColumn;
    ViewVisaOPTIONAL: TcxGridDBColumn;
    ViewVisaHIDDEN: TcxGridDBColumn;
    ViewVisaPERIODTYPE: TcxGridDBColumn;
    ViewVisaVENDORID: TcxGridDBColumn;
    ViewVisaRATECURRID: TcxGridDBColumn;
    ViewVisaMEMO: TcxGridDBColumn;
    ViewVisaAGENTPAY: TcxGridDBColumn;
    ViewVisaAGENTPAY2: TcxGridDBColumn;
    ViewVisaAGENTWHO: TcxGridDBColumn;
    ViewVisaAGENTWHO2: TcxGridDBColumn;
    ViewVisaVATPERC: TcxGridDBColumn;
    ViewVisaVAT: TcxGridDBColumn;
    ViewVisaVATPERC2: TcxGridDBColumn;
    ViewVisaVAT2: TcxGridDBColumn;
    ViewVisaAGENTPERC: TcxGridDBColumn;
    ViewVisaAGENTPERC2: TcxGridDBColumn;
    ViewVisaGROUPCURRID: TcxGridDBColumn;
    ViewVisaGRATISPERSONCOUNT: TcxGridDBColumn;
    ViewVisaGRATISBYVENDOR: TcxGridDBColumn;
    ViewVisaNETCHECK: TcxGridDBColumn;
    ViewVisaV1_RATE: TcxGridDBColumn;
    ViewVisaV1_AGENTPAY: TcxGridDBColumn;
    ViewVisaV1_PAY: TcxGridDBColumn;
    ViewVisaV1_VATPERC: TcxGridDBColumn;
    ViewVisaV1_VAT: TcxGridDBColumn;
    ViewVisaV1_AGENTPERC: TcxGridDBColumn;
    ViewVisaV1_NETVAL: TcxGridDBColumn;
    ViewVisaV1_PAID: TcxGridDBColumn;
    ViewVisaV2_RATE: TcxGridDBColumn;
    ViewVisaV2_AGENTPAY: TcxGridDBColumn;
    ViewVisaV2_PAY: TcxGridDBColumn;
    ViewVisaV2_VATPERC: TcxGridDBColumn;
    ViewVisaV2_VAT: TcxGridDBColumn;
    ViewVisaV2_AGENTPERC: TcxGridDBColumn;
    ViewVisaV2_NETVAL: TcxGridDBColumn;
    ViewVisaV2_PAID: TcxGridDBColumn;
    ViewVisaV1_RATE2: TcxGridDBColumn;
    ViewVisaV1_AGENTPAY2: TcxGridDBColumn;
    ViewVisaV1_PAY2: TcxGridDBColumn;
    ViewVisaV1_VATPERC2: TcxGridDBColumn;
    ViewVisaV1_VAT2: TcxGridDBColumn;
    ViewVisaV1_AGENTPERC2: TcxGridDBColumn;
    ViewVisaV1_NETVAL2: TcxGridDBColumn;
    ViewVisaV1_PAID2: TcxGridDBColumn;
    ViewVisaV2_RATE2: TcxGridDBColumn;
    ViewVisaV2_AGENTPAY2: TcxGridDBColumn;
    ViewVisaV2_PAY2: TcxGridDBColumn;
    ViewVisaV2_VATPERC2: TcxGridDBColumn;
    ViewVisaV2_VAT2: TcxGridDBColumn;
    ViewVisaV2_AGENTPERC2: TcxGridDBColumn;
    ViewVisaV2_NETVAL2: TcxGridDBColumn;
    ViewVisaV2_PAID2: TcxGridDBColumn;
    ViewVisaVISAKIND: TcxGridDBColumn;
    ViewVisaVISAFOR: TcxGridDBColumn;
    ViewVisaENTRYCOUNT: TcxGridDBColumn;
    ViewVisaVALIDDAYS: TcxGridDBColumn;
    ViewVisaARRIVECUSTOMID: TcxGridDBColumn;
    ViewVisaDEPARTCUSTOMID: TcxGridDBColumn;
    ViewVisaGARANTID: TcxGridDBColumn;
    ViewVisaGARANTOFFICEID: TcxGridDBColumn;
    ViewVisaGARANTPHONEID: TcxGridDBColumn;
    ViewVisaADDRESSTOID: TcxGridDBColumn;
    ViewVisaADDRTOPHONEID: TcxGridDBColumn;
    ViewVisaTRAVELKIND: TcxGridDBColumn;
    ViewVisaDRIVEKINDID: TcxGridDBColumn;
    ViewVisaVALIDDATE: TcxGridDBColumn;
    ViewVisaPERIODDAYS: TcxGridDBColumn;
    ViewVisaENTRYCOUNTRYID: TcxGridDBColumn;
    ViewVisaCUSTCOSTS: TcxGridDBColumn;
    ViewVisaSPONSORCOSTS: TcxGridDBColumn;
    ViewInsure: TcxGridDBTableView;
    ViewInsureTOURTEMPLATEID: TcxGridDBColumn;
    ViewInsureTOURINSUREID: TcxGridDBColumn;
    ViewInsureKINDNAME: TcxGridDBColumn;
    ViewInsureINSUREVALUE: TcxGridDBColumn;
    ViewInsureCURRENCYSHORT: TcxGridDBColumn;
    ViewInsureBEGINDAY: TcxGridDBColumn;
    ViewInsureFROMDATE: TcxGridDBColumn;
    ViewInsureDAYCOUNT: TcxGridDBColumn;
    ViewInsureGROUPMIN: TcxGridDBColumn;
    ViewInsureGROUPMAX: TcxGridDBColumn;
    ViewInsureINSURECURR: TcxGridDBColumn;
    ViewInsureVENDOR: TcxGridDBColumn;
    ViewInsureNETPERGROUP: TcxGridDBColumn;
    ViewInsureNETPERGROUP2: TcxGridDBColumn;
    ViewInsureCalcTillDate: TcxGridDBColumn;
    ViewInsureDISABLED: TcxGridDBColumn;
    ViewInsureOPTIONAL: TcxGridDBColumn;
    ViewInsureHIDDEN: TcxGridDBColumn;
    ViewInsureNETVAL: TcxGridDBColumn;
    ViewInsureNETVAL2: TcxGridDBColumn;
    ViewInsureRATE: TcxGridDBColumn;
    ViewInsureRATE2: TcxGridDBColumn;
    ViewInsureFORPAY: TcxGridDBColumn;
    ViewInsurePERIODTYPE: TcxGridDBColumn;
    ViewInsureFORPAY2: TcxGridDBColumn;
    ViewInsureINSUREKIND: TcxGridDBColumn;
    ViewInsureVENDORID: TcxGridDBColumn;
    ViewInsureINSUREVALUEID: TcxGridDBColumn;
    ViewInsureRATECURRID: TcxGridDBColumn;
    ViewInsureMEMO: TcxGridDBColumn;
    ViewInsureAGENTPAY: TcxGridDBColumn;
    ViewInsureAGENTPAY2: TcxGridDBColumn;
    ViewInsureAGENTWHO: TcxGridDBColumn;
    ViewInsureAGENTWHO2: TcxGridDBColumn;
    ViewInsureVATPERC: TcxGridDBColumn;
    ViewInsureVAT: TcxGridDBColumn;
    ViewInsureVATPERC2: TcxGridDBColumn;
    ViewInsureVAT2: TcxGridDBColumn;
    ViewInsureAGENTPERC: TcxGridDBColumn;
    ViewInsureAGENTPERC2: TcxGridDBColumn;
    ViewInsureGROUPCURRID: TcxGridDBColumn;
    ViewInsureGRATISPERSONCOUNT: TcxGridDBColumn;
    ViewInsureGRATISBYVENDOR: TcxGridDBColumn;
    ViewInsureNETCHECK: TcxGridDBColumn;
    ViewInsureV1_RATE: TcxGridDBColumn;
    ViewInsureV1_AGENTPAY: TcxGridDBColumn;
    ViewInsureV1_PAY: TcxGridDBColumn;
    ViewInsureV1_VATPERC: TcxGridDBColumn;
    ViewInsureV1_VAT: TcxGridDBColumn;
    ViewInsureV1_AGENTPERC: TcxGridDBColumn;
    ViewInsureV1_NETVAL: TcxGridDBColumn;
    ViewInsureV1_PAID: TcxGridDBColumn;
    ViewInsureV2_RATE: TcxGridDBColumn;
    ViewInsureV2_AGENTPAY: TcxGridDBColumn;
    ViewInsureV2_PAY: TcxGridDBColumn;
    ViewInsureV2_VATPERC: TcxGridDBColumn;
    ViewInsureV2_VAT: TcxGridDBColumn;
    ViewInsureV2_AGENTPERC: TcxGridDBColumn;
    ViewInsureV2_NETVAL: TcxGridDBColumn;
    ViewInsureV2_PAID: TcxGridDBColumn;
    ViewInsureV1_RATE2: TcxGridDBColumn;
    ViewInsureV1_AGENTPAY2: TcxGridDBColumn;
    ViewInsureV1_PAY2: TcxGridDBColumn;
    ViewInsureV1_VATPERC2: TcxGridDBColumn;
    ViewInsureV1_VAT2: TcxGridDBColumn;
    ViewInsureV1_AGENTPERC2: TcxGridDBColumn;
    ViewInsureV1_NETVAL2: TcxGridDBColumn;
    ViewInsureV1_PAID2: TcxGridDBColumn;
    ViewInsureV2_RATE2: TcxGridDBColumn;
    ViewInsureV2_AGENTPAY2: TcxGridDBColumn;
    ViewInsureV2_PAY2: TcxGridDBColumn;
    ViewInsureV2_VATPERC2: TcxGridDBColumn;
    ViewInsureV2_VAT2: TcxGridDBColumn;
    ViewInsureV2_AGENTPERC2: TcxGridDBColumn;
    ViewInsureV2_NETVAL2: TcxGridDBColumn;
    ViewInsureV2_PAID2: TcxGridDBColumn;
    ViewInsureINSUREDAYS: TcxGridDBColumn;
    ViewInsureRATECOST: TcxGridDBColumn;
    ViewInsureINSUREIDENT: TcxGridDBColumn;
    ViewInsureDAYCOUNT1: TcxGridDBColumn;
    ViewTrip: TcxGridDBTableView;
    ViewTripTOURTEMPLATEID: TcxGridDBColumn;
    ViewTripTOURTRIPID: TcxGridDBColumn;
    ViewTripDRIVEKIND: TcxGridDBColumn;
    ViewTripROUTEID: TcxGridDBColumn;
    ViewTripROUTENAME: TcxGridDBColumn;
    ViewTripFROMCITY: TcxGridDBColumn;
    ViewTripCalcFromCity: TcxGridDBColumn;
    ViewTripCalcArriveCity: TcxGridDBColumn;
    ViewTripARRIVECITY: TcxGridDBColumn;
    ViewTripBEGINDAY: TcxGridDBColumn;
    ViewTripSHEDULENAME: TcxGridDBColumn;
    ViewTripDIRECTION: TcxGridDBColumn;
    ViewTripCalcDepartTime: TcxGridDBColumn;
    ViewTripCalcArriveTime: TcxGridDBColumn;
    ViewTripCalcStartPoint: TcxGridDBColumn;
    ViewTripCalcStopPoint: TcxGridDBColumn;
    ViewTripCURRENCYSHORT: TcxGridDBColumn;
    ViewTripTRIPID: TcxGridDBColumn;
    ViewTripDRIVEKINDID: TcxGridDBColumn;
    ViewTripDRIVEKINDSHORT: TcxGridDBColumn;
    ViewTripLEAVEDATE: TcxGridDBColumn;
    ViewTripGROUPMIN: TcxGridDBColumn;
    ViewTripGROUPMAX: TcxGridDBColumn;
    ViewTripNETPERGROUP: TcxGridDBColumn;
    ViewTripNETPERGROUP2: TcxGridDBColumn;
    ViewTripDISABLED: TcxGridDBColumn;
    ViewTripOPTIONAL: TcxGridDBColumn;
    ViewTripHIDDEN: TcxGridDBColumn;
    ViewTripNETVAL: TcxGridDBColumn;
    ViewTripNETVAL2: TcxGridDBColumn;
    ViewTripRATE: TcxGridDBColumn;
    ViewTripSHEDULEID: TcxGridDBColumn;
    ViewTripDEPARTFTIME: TcxGridDBColumn;
    ViewTripDEPARTBTIME: TcxGridDBColumn;
    ViewTripARRIVEBTIME: TcxGridDBColumn;
    ViewTripARRIVEFTIME: TcxGridDBColumn;
    ViewTripRATE2: TcxGridDBColumn;
    ViewTripFORPAY: TcxGridDBColumn;
    ViewTripFORPAY2: TcxGridDBColumn;
    ViewTripSTARTCITY: TcxGridDBColumn;
    ViewTripSTOPCITY: TcxGridDBColumn;
    ViewTripSTARTADDRESS: TcxGridDBColumn;
    ViewTripSTOPADDRESS: TcxGridDBColumn;
    ViewTripPERIODTYPE: TcxGridDBColumn;
    ViewTripTRIPBACKID: TcxGridDBColumn;
    ViewTripVENDORID: TcxGridDBColumn;
    ViewTripRATECURRID: TcxGridDBColumn;
    ViewTripMEMO: TcxGridDBColumn;
    ViewTripAGENTPAY: TcxGridDBColumn;
    ViewTripAGENTPAY2: TcxGridDBColumn;
    ViewTripAGENTWHO: TcxGridDBColumn;
    ViewTripAGENTWHO2: TcxGridDBColumn;
    ViewTripVATPERC: TcxGridDBColumn;
    ViewTripVAT: TcxGridDBColumn;
    ViewTripVATPERC2: TcxGridDBColumn;
    ViewTripVAT2: TcxGridDBColumn;
    ViewTripAGENTPERC: TcxGridDBColumn;
    ViewTripAGENTPERC2: TcxGridDBColumn;
    ViewTripGROUPCURRID: TcxGridDBColumn;
    ViewTripGRATISPERSONCOUNT: TcxGridDBColumn;
    ViewTripGRATISBYVENDOR: TcxGridDBColumn;
    ViewTripNETCHECK: TcxGridDBColumn;
    ViewTripV1_RATE: TcxGridDBColumn;
    ViewTripV1_AGENTPAY: TcxGridDBColumn;
    ViewTripV1_PAY: TcxGridDBColumn;
    ViewTripV1_VATPERC: TcxGridDBColumn;
    ViewTripV1_VAT: TcxGridDBColumn;
    ViewTripV1_AGENTPERC: TcxGridDBColumn;
    ViewTripV1_NETVAL: TcxGridDBColumn;
    ViewTripV1_PAID: TcxGridDBColumn;
    ViewTripV2_RATE: TcxGridDBColumn;
    ViewTripV2_AGENTPAY: TcxGridDBColumn;
    ViewTripV2_PAY: TcxGridDBColumn;
    ViewTripV2_VATPERC: TcxGridDBColumn;
    ViewTripV2_VAT: TcxGridDBColumn;
    ViewTripV2_AGENTPERC: TcxGridDBColumn;
    ViewTripV2_NETVAL: TcxGridDBColumn;
    ViewTripV2_PAID: TcxGridDBColumn;
    ViewTripV1_RATE2: TcxGridDBColumn;
    ViewTripV1_AGENTPAY2: TcxGridDBColumn;
    ViewTripV1_PAY2: TcxGridDBColumn;
    ViewTripV1_VATPERC2: TcxGridDBColumn;
    ViewTripV1_VAT2: TcxGridDBColumn;
    ViewTripV1_AGENTPERC2: TcxGridDBColumn;
    ViewTripV1_NETVAL2: TcxGridDBColumn;
    ViewTripV1_PAID2: TcxGridDBColumn;
    ViewTripV2_RATE2: TcxGridDBColumn;
    ViewTripV2_AGENTPAY2: TcxGridDBColumn;
    ViewTripV2_PAY2: TcxGridDBColumn;
    ViewTripV2_VATPERC2: TcxGridDBColumn;
    ViewTripV2_VAT2: TcxGridDBColumn;
    ViewTripV2_AGENTPERC2: TcxGridDBColumn;
    ViewTripV2_NETVAL2: TcxGridDBColumn;
    ViewTripV2_PAID2: TcxGridDBColumn;
    ViewTripRETURNDAY: TcxGridDBColumn;
    ViewTripSTARTPOINT: TcxGridDBColumn;
    ViewTripSTOPPOINT: TcxGridDBColumn;
    TripQry: TIBQuery;
    TripQryTOURTEMPLATEID: TIntegerField;
    TripQryTOURTRIPID: TIntegerField;
    TripQryROUTEID: TIntegerField;
    TripQrySHEDULEID: TIntegerField;
    TripQryBEGINDAY: TIntegerField;
    TripQryTRIPID: TIntegerField;
    TripQryDRIVEKINDID: TIntegerField;
    TripQryDRIVEKIND: TStringField;
    TripQryDRIVEKINDSHORT: TStringField;
    TripQrySHEDULENAME: TStringField;
    TripQryDEPARTFTIME: TDateTimeField;
    TripQryARRIVEFTIME: TDateTimeField;
    TripQryDEPARTBTIME: TDateTimeField;
    TripQryARRIVEBTIME: TDateTimeField;
    TripQryDIRECTION: TSmallintField;
    TripQryLEAVEDATE: TDateTimeField;
    TripQryFROMCITY: TStringField;
    TripQryARRIVECITY: TStringField;
    TripQryGROUPMIN: TSmallintField;
    TripQryGROUPMAX: TSmallintField;
    TripQryNETPERGROUP: TFloatField;
    TripQryNETPERGROUP2: TFloatField;
    TripQryCURRENCYSHORT: TStringField;
    TripQryDISABLED: TStringField;
    TripQryOPTIONAL: TStringField;
    TripQryHIDDEN: TStringField;
    TripQryNETVAL: TFloatField;
    TripQryNETVAL2: TFloatField;
    TripQryRATE: TFloatField;
    TripQryRATE2: TFloatField;
    TripQryFORPAY: TFloatField;
    TripQryFORPAY2: TFloatField;
    TripQrySTARTCITY: TStringField;
    TripQrySTOPCITY: TStringField;
    TripQrySTARTADDRESS: TStringField;
    TripQrySTOPADDRESS: TStringField;
    TripQryCalcFromCity: TStringField;
    TripQryCalcArriveCity: TStringField;
    TripQryCalcStartPoint: TStringField;
    TripQryCalcStopPoint: TStringField;
    TripQryCalcDepartTime: TDateTimeField;
    TripQryCalcArriveTime: TDateTimeField;
    TripQryPERIODTYPE: TSmallintField;
    TripQryROUTENAME: TStringField;
    TripQryTRIPBACKID: TIntegerField;
    TripQryVENDORID: TIntegerField;
    TripQryRATECURRID: TIntegerField;
    TripQryMEMO: TMemoField;
    TripQryAGENTPAY: TFloatField;
    TripQryAGENTPAY2: TFloatField;
    TripQryAGENTWHO: TSmallintField;
    TripQryAGENTWHO2: TSmallintField;
    TripQryVATPERC: TFloatField;
    TripQryVAT: TFloatField;
    TripQryVATPERC2: TFloatField;
    TripQryVAT2: TFloatField;
    TripQryAGENTPERC: TFloatField;
    TripQryAGENTPERC2: TFloatField;
    TripQryGROUPCURRID: TIntegerField;
    TripQryGRATISPERSONCOUNT: TIntegerField;
    TripQryGRATISBYVENDOR: TIBStringField;
    TripQryNETCHECK: TIBStringField;
    TripQryV1_RATE: TFloatField;
    TripQryV1_AGENTPAY: TFloatField;
    TripQryV1_PAY: TFloatField;
    TripQryV1_VATPERC: TFloatField;
    TripQryV1_VAT: TFloatField;
    TripQryV1_AGENTPERC: TFloatField;
    TripQryV1_NETVAL: TFloatField;
    TripQryV1_PAID: TFloatField;
    TripQryV2_RATE: TFloatField;
    TripQryV2_AGENTPAY: TFloatField;
    TripQryV2_PAY: TFloatField;
    TripQryV2_VATPERC: TFloatField;
    TripQryV2_VAT: TFloatField;
    TripQryV2_AGENTPERC: TFloatField;
    TripQryV2_NETVAL: TFloatField;
    TripQryV2_PAID: TFloatField;
    TripQryV1_RATE2: TFloatField;
    TripQryV1_AGENTPAY2: TFloatField;
    TripQryV1_PAY2: TFloatField;
    TripQryV1_VATPERC2: TFloatField;
    TripQryV1_VAT2: TFloatField;
    TripQryV1_AGENTPERC2: TFloatField;
    TripQryV1_NETVAL2: TFloatField;
    TripQryV1_PAID2: TFloatField;
    TripQryV2_RATE2: TFloatField;
    TripQryV2_AGENTPAY2: TFloatField;
    TripQryV2_PAY2: TFloatField;
    TripQryV2_VATPERC2: TFloatField;
    TripQryV2_VAT2: TFloatField;
    TripQryV2_AGENTPERC2: TFloatField;
    TripQryV2_NETVAL2: TFloatField;
    TripQryV2_PAID2: TFloatField;
    TripQryRETURNDAY: TIntegerField;
    TripQrySTARTPOINT: TIntegerField;
    TripQrySTOPPOINT: TIntegerField;
    TripSrc: TDataSource;
    GroupQry: TIBQuery;
    GroupQryTOURGROUPID: TIntegerField;
    GroupQryTOURDATE: TDateTimeField;
    GroupQryMEMO: TMemoField;
    GroupQryTOURTEMPLATEID: TIntegerField;
    GroupQryTEMPLATENAME: TStringField;
    GroupQryVARIANTNAME: TStringField;
    GroupQryTOURVARIANTID: TIntegerField;
    GroupSrc: TDataSource;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    cxGrid5DBTableView1: TcxGridDBTableView;
    cxGrid5Level1: TcxGridLevel;
    cxGrid5: TcxGrid;
    ImageListElem: TImageList;
    Button4: TButton;
    Button5: TButton;
    IBQuery1: TIBQuery;
    IBStoredProc1: TIBStoredProc;
    IBQuery1ID: TIntegerField;
    IBQuery1APLICATION: TIBStringField;
    IBQuery1TITLE: TIBStringField;
    IBQuery1TABLENAME: TIBStringField;
    IBQuery1OBJID: TIntegerField;
    IBQuery1USERID: TIntegerField;
    IBQuery1TYPEACTION: TIntegerField;
    IBQuery1ADATE: TDateTimeField;
    IBQuery1FORMNAME: TIBStringField;
    IBQuery1FORMCAPTION: TIBStringField;
    IBQuery1ADATA: TBlobField;
    HCountryQryCOUNTRYID: TIntegerField;
    HCountryQryNAME: TIBStringField;
    HCountryQryNAME_ENG: TIBStringField;
    HCountryQryLATNAME: TIBStringField;
    HCountryQryMEMO: TMemoField;
    Button6: TButton;
    TR_AGES: TIBQuery;
    TR_AGES_DS: TDataSource;
    TR_AGESAGEID: TIntegerField;
    TR_AGESSERVKINDID: TIntegerField;
    TR_AGESSERVICEID: TIntegerField;
    TR_AGESAGEFROM: TIntegerField;
    TR_AGESAGETILL: TIntegerField;
    TR_AGESNAMEID: TIntegerField;
    TR_AGESISBASEAGE: TIBStringField;
    TR_PERIODS: TIBQuery;
    TR_PERIODS_DS: TDataSource;
    TR_RATES: TIBQuery;
    TR_RATES_DS: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid6: TcxGrid;
    cxGrid6DBTableView1: TcxGridDBTableView;
    cxGrid6Level1: TcxGridLevel;
    cxGrid7DBTableView1: TcxGridDBTableView;
    cxGrid7Level1: TcxGridLevel;
    cxGrid7: TcxGrid;
    ViewRates: TcxGridDBTableView;
    TR_RATESTOURRATEID: TIntegerField;
    TR_RATESPERIODID: TIntegerField;
    TR_RATESAGEID: TIntegerField;
    TR_RATESV1_RATE: TFloatField;
    TR_RATESV1_AGENTPAY: TFloatField;
    TR_RATESV1_NETVAL: TFloatField;
    TR_RATESV2_RATE: TFloatField;
    TR_RATESV2_AGENTPAY: TFloatField;
    TR_RATESV2_NETVAL: TFloatField;
    TR_RATESV1_RATE2: TFloatField;
    TR_RATESV1_AGENTPAY2: TFloatField;
    TR_RATESV1_NETVAL2: TFloatField;
    TR_RATESV2_RATE2: TFloatField;
    TR_RATESV2_AGENTPAY2: TFloatField;
    TR_RATESV2_NETVAL2: TFloatField;
    ViewRatesTOURRATEID: TcxGridDBColumn;
    ViewRatesPERIODID: TcxGridDBColumn;
    ViewRatesAGEID: TcxGridDBColumn;
    ViewRatesV1_RATE: TcxGridDBColumn;
    ViewRatesV1_AGENTPAY: TcxGridDBColumn;
    ViewRatesV1_NETVAL: TcxGridDBColumn;
    ViewRatesV2_RATE: TcxGridDBColumn;
    ViewRatesV2_AGENTPAY: TcxGridDBColumn;
    ViewRatesV2_NETVAL: TcxGridDBColumn;
    ViewRatesV1_RATE2: TcxGridDBColumn;
    ViewRatesV1_AGENTPAY2: TcxGridDBColumn;
    ViewRatesV1_NETVAL2: TcxGridDBColumn;
    ViewRatesV2_RATE2: TcxGridDBColumn;
    ViewRatesV2_AGENTPAY2: TcxGridDBColumn;
    ViewRatesV2_NETVAL2: TcxGridDBColumn;
    ViewAGES: TcxGridDBTableView;
    ViewAGESAGEID: TcxGridDBColumn;
    ViewAGESSERVKINDID: TcxGridDBColumn;
    ViewAGESSERVICEID: TcxGridDBColumn;
    ViewAGESAGEFROM: TcxGridDBColumn;
    ViewAGESAGETILL: TcxGridDBColumn;
    ViewAGESNAMEID: TcxGridDBColumn;
    ViewAGESISBASEAGE: TcxGridDBColumn;
    ViewPeriod: TcxGridDBTableView;
    TR_PERIODSPERIODID: TIntegerField;
    TR_PERIODSSERVKINDID: TIntegerField;
    TR_PERIODSSERVICEID: TIntegerField;
    TR_PERIODSPERIODFROM: TIntegerField;
    TR_PERIODSPERIODTILL: TIntegerField;
    TR_PERIODSFROMDATE: TDateTimeField;
    TR_PERIODSTILLDATE: TDateTimeField;
    TR_PERIODSNAME: TIBStringField;
    ViewPeriodPERIODID: TcxGridDBColumn;
    ViewPeriodSERVKINDID: TcxGridDBColumn;
    ViewPeriodSERVICEID: TcxGridDBColumn;
    ViewPeriodPERIODFROM: TcxGridDBColumn;
    ViewPeriodPERIODTILL: TcxGridDBColumn;
    ViewPeriodFROMDATE: TcxGridDBColumn;
    ViewPeriodTILLDATE: TcxGridDBColumn;
    ViewPeriodNAME: TcxGridDBColumn;
    cxGrid8: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGrid9: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    TripQrySERVICEID: TIntegerField;
    LOGDB: TIBQuery;
    LOG_DS: TDataSource;
    LOGDBID: TIntegerField;
    LOGDBAPLICATION: TIBStringField;
    LOGDBTITLE: TIBStringField;
    LOGDBTABLENAME: TIBStringField;
    LOGDBOBJID: TIntegerField;
    LOGDBUSERID: TIntegerField;
    LOGDBTYPEACTION: TIntegerField;
    LOGDBADATE: TDateTimeField;
    LOGDBFORMNAME: TIBStringField;
    LOGDBFORMCAPTION: TIBStringField;
    LOGDBADATA: TBlobField;
    LOGDBUSERNAME: TIBStringField;
    Button8: TButton;
    Button9: TButton;
    Image1: TImage;
    LOGDBAPPLICATIONICON: TBlobField;
    IBQuery1APPLICATIONICON: TBlobField;
    LSheet: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    cxStyle213: TcxStyle;
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    ADOConnection1: TADOConnection;
    IBQueryTESTTABLE: TIBQuery;
    IBQueryTESTTABLEID: TIntegerField;
    IBQueryTESTTABLENAME: TIBStringField;
    IBQueryTESTTABLESrc: TDataSource;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cxGrid10: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGridViewRepository2: TcxGridViewRepository;
    ViewTestTable: TcxGridDBTableView;
    ViewTestTableID: TcxGridDBColumn;
    ViewTestTableNAME: TcxGridDBColumn;
    IBQueryTESTTABLEAVALUE: TIBStringField;
    ProgressBar: TProgressBar;
    Button7: TButton;
    GridViewRepository: TcxGridViewRepository;
    ViewCompany: TcxGridDBTableView;
    ViewCompanyCOMPANYID: TcxGridDBColumn;
    ViewCompanyCOMPANYNAME: TcxGridDBColumn;
    ViewCompanyPERSCOUNT: TcxGridDBColumn;
    ViewCompanyORDERCOUNT: TcxGridDBColumn;
    ViewCompanyLASTDATECRORDER: TcxGridDBColumn;
    ViewCompanyCalcDateContract: TcxGridDBColumn;
    ViewCompanySORTBYCONTRACT: TcxGridDBColumn;
    ViewCompanyISOBDZVIN: TcxGridDBColumn;
    ViewCompanyCOMMONNOTEADDDATE: TcxGridDBColumn;
    ViewCompanyISVENDOR: TcxGridDBColumn;
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
    SelCompCntryQry: TIBQuery;
    SelCompCntryQryCOUNTRYID: TIntegerField;
    SelCompCntryQryNAME: TStringField;
    SelCompCntryQryLATNAME: TStringField;
    SelCompCntryQrySrc: TDataSource;
    CmbxCompanyCountry: TcxExtLookupComboBox;
    ButClearCompanyCountry: TSpeedButton;
    cxStyleRepository1: TcxStyleRepository;
    cxPropertiesStore1: TcxPropertiesStore;
    cxTextEdit1: TcxTextEdit;
    TourQryTOURNAME: TIBStringField;
    TourQryID: TIntegerField;
    TourQryPARENT: TIntegerField;
    TourQryGRP: TIBStringField;
    TourQryIND: TIBStringField;
    TourQryISDISABLED: TIBStringField;
    TourQrySHOWWEB: TIBStringField;
    TourQryCANADDGROUP: TIBStringField;
    TourQryISPSEUDO: TIBStringField;
    TourQryISARHIVED: TIBStringField;
    TourQryBONUSPROGRAMID: TIntegerField;
    TourQryMEMO: TMemoField;
    TourQryMANAGERID: TIntegerField;
    TourQryLOCALENAMES: TMemoField;
    TourQrySHORTTOURNAME: TIBStringField;
    TourQryBONUSFROMDATE: TDateTimeField;
    TourQryBONUSTILLDATE: TDateTimeField;
    TourQryBONUSFROMSHOWWEB: TIBStringField;
    TourQryBONUSTILLSHOWWEB: TIBStringField;
    TourQrySPECIALDATEID: TIntegerField;
    TourQryMANAGER: TIBStringField;
    TourQryPROGRAMNAME: TIBStringField;
    TourQrySPECIALNAME: TIBStringField;
    TourQryAREACTIVEPROMO: TIntegerField;
    TourQryHITSALES: TIBStringField;
    TourQryISDEPART: TIBStringField;
    cxLookupComboBox1: TcxLookupComboBox;
    CompanyQry: TIBQuery;
    CompanyQryCOMPANYID: TIntegerField;
    CompanyQryNAME: TStringField;
    CompanyQryISENTERPR: TStringField;
    CompanyQryISPRIVATE: TStringField;
    CompanyQryISGOVERN: TStringField;
    CompanyQryISBUDGET: TStringField;
    CompanyQryISVENDOR: TStringField;
    CompanyQryISCLIENT: TStringField;
    CompanyQryISAGENT: TStringField;
    CompanyQryISPROPS: TStringField;
    CompanyQryISOTHER: TStringField;
    CompanyQryASDRIVE: TStringField;
    CompanyQryASHOTEL: TStringField;
    CompanyQryASVISAS: TStringField;
    CompanyQryASINSUR: TStringField;
    CompanyQryASEXCRS: TStringField;
    CompanyQryASREKLM: TStringField;
    CompanyQryASTICKT: TStringField;
    CompanyQryASTOURS: TStringField;
    CompanyQryASSCOLL: TStringField;
    CompanyQryASAPAIR: TStringField;
    CompanyQryASEMPLS: TStringField;
    CompanyQryASFOODS: TStringField;
    CompanyQryASURIST: TStringField;
    CompanyQryASMEDIC: TStringField;
    CompanyQryISHOTEL: TStringField;
    CompanyQryASRECRE: TStringField;
    CompanyQryASEXTRM: TStringField;
    CompanyQryASOTHER: TStringField;
    CompanyQryTAXPAYREGNO: TStringField;
    CompanyQryTAXPAYCODE: TStringField;
    CompanyQryIDENTCODE: TStringField;
    CompanyQryCLASSCODE: TStringField;
    CompanyQryFORWORK: TStringField;
    CompanyQryMEMO: TMemoField;
    CompanyQryISPOTENT: TStringField;
    CompanyQryISBSMAN: TStringField;
    CompanyQryASMUSEM: TStringField;
    CompanyQryASXHIBT: TStringField;
    CompanyQryASAMBAS: TStringField;
    CompanyQryASCOMMC: TStringField;
    CompanyQryASCMPTR: TStringField;
    CompanyQryASSTNRY: TStringField;
    CompanyQryASFURNT: TStringField;
    CompanyQryASGOODS: TStringField;
    CompanyQryASPETRL: TStringField;
    CompanyQryASMEDIA: TStringField;
    CompanyQryASCONSL: TStringField;
    CompanyQryASGUARD: TStringField;
    CompanyQryASBANKS: TStringField;
    CompanyQryASLEASE: TStringField;
    CompanyQryASKOMUN: TStringField;
    CompanyQryASBUILD: TStringField;
    CompanyQryASMASTR: TStringField;
    CompanyQryCOMPKIND: TStringField;
    CompanyQryVCARDNO: TIntegerField;
    CompanyQryADDMANID: TIntegerField;
    CompanyQryASGUIDE: TStringField;
    CompanyQryASPARSL: TStringField;
    CompanyQryFULLNAME: TMemoField;
    CompanyQryASPARSE: TStringField;
    CompanyQryBUS17: TStringField;
    CompanyQryTAXPAYSTATEID: TIntegerField;
    CompanyQryDATEOBDZVIN: TDateTimeField;
    CompanyQryMANOBDZVIN: TIntegerField;
    CompanyQryMANAGER: TStringField;
    CompanyQryORGFORMID: TIntegerField;
    CompanyQryTAXPAY: TStringField;
    CompanyQryTAXPAYREGDATE: TDateTimeField;
    CompanyQryLICENSEDATE: TDateTimeField;
    CompanyQryWARRANTYSUM: TFloatField;
    CompanyQryWARRANTYVAL: TIntegerField;
    CompanyQryWARRANTYTERM: TDateTimeField;
    CompanyQryLICENSETERMIN: TStringField;
    CompanyQryLICENSENO: TStringField;
    CompanyQryTAXNAME: TStringField;
    CompanyQryORGFORMNAME: TStringField;
    CompanyQrySHORTNAME: TStringField;
    CompanyQryTRADENAME: TStringField;
    CompanyQryCOMPANYNAME: TStringField;
    CompanyQryOBDZVIN: TIntegerField;
    CompanyQryOBDZVINAGREEDATE: TDateTimeField;
    CompanyQryACTIONID: TIntegerField;
    CompanyQryGOVREESTRTYPEID: TIntegerField;
    CompanyQryGOVREESTRDATE: TDateTimeField;
    CompanyQrySINGLETAXTYPEID: TIntegerField;
    CompanyQryTAXPAYTYPEID: TIntegerField;
    CompanyQryASNETAGENT: TStringField;
    CompanyQryPERMEXTRAAGENT: TStringField;
    CompanyQryAREWEB: TStringField;
    CompanyQryAREAGENTCONTRACT: TStringField;
    CompanyQryDOCTODATE: TDateTimeField;
    CompanyQryCalcDateContract: TDateTimeField;
    CompanyQryISRCVORIG: TStringField;
    CompanyQryISSENDORIG: TStringField;
    CompanyQryISRCVCOPY: TStringField;
    CompanyQryISSEND: TStringField;
    CompanyQryTILLDATE: TDateTimeField;
    CompanyQrySIGNDATE: TDateTimeField;
    CompanyQryISPRINTED: TStringField;
    CompanyQryISSIGN: TStringField;
    CompanyQryOURPERSONID: TIntegerField;
    CompanyQryNUMCONTRACT: TStringField;
    CompanyQryITSPERSONID: TIntegerField;
    CompanyQryFILENAME: TStringField;
    CompanyQryCOMPCONTRACTID: TIntegerField;
    CompanyQrySORTBYCONTRACT: TIntegerField;
    CompanyQryFIXDEFECTTODATE: TDateTimeField;
    CompanyQryISOBDZVIN: TStringField;
    CompanyQryEXPTOURCOMPNOTE: TMemoField;
    CompanyQryISEXTEND: TStringField;
    CompanyQryALLDATAFILL: TStringField;
    CompanyQryStanDoc: TIntegerField;
    CompanyQryORDERCOUNT: TIntegerField;
    CompanyQryPERSCOUNT: TIntegerField;
    CompanyQryLASTDATECRORDER: TDateTimeField;
    CompanyQryISTOUROPER: TStringField;
    CompanyQryASAUPAIR: TStringField;
    CompanyQryCONTRACTCOMPNOTE: TMemoField;
    CompanyQryCntrEditManId: TIntegerField;
    CompanyQryHEADOFFICEID: TIntegerField;
    CompanyQryHEADOFFICENAME: TStringField;
    CompanyQryISFILIYA: TStringField;
    CompanyQryISHEADOFFICE: TStringField;
    CompanyQryTRADENAMEID: TIntegerField;
    CompanyQryNOTWORK: TStringField;
    CompanyQryAGENCYLOGO: TStringField;
    CompanyQryPEYMTOAGENCY: TStringField;
    CompanyQryPERMREREESTR: TStringField;
    CompanyQrySINGLETAXDATE: TDateTimeField;
    CompanyQryCOMPIDFORCNTRCT: TIntegerField;
    CompanyQryCONTRACTPROMPT: TMemoField;
    CompanyQryLOGDATETIME: TDateTimeField;
    CompanyQryEXPNOTEMANAGER: TStringField;
    CompanyQryASRESIDENT: TStringField;
    CompanyQryCOMMONNOTE: TMemoField;
    CompanyQryCOMMONNOTEADDDATE: TDateTimeField;
    CompanyQryCOMMONNOTEMANID: TIntegerField;
    CompanyQryRCVORIGDATE: TDateTimeField;
    CompanyQryAREAGCNTRWITHOUTTDATE: TIBStringField;
    CompanyQryWORKMANID: TIntegerField;
    CompanyQryNOTEADDMANID: TIntegerField;
    CompanyQryREREESTR: TIBStringField;
    CompanyQryCOMPNOTEID: TIntegerField;
    CompanyQryCONTRACTLOGID: TIntegerField;
    CompanyQryORGFORMINNAME: TIBStringField;
    CompanyQryADDDATE: TDateTimeField;
    CompanyQryBLACKLIST: TIBStringField;
    CompanyQryVIPCLIENT: TIBStringField;
    CompanyQryCalcTaxPayStateId: TIntegerField;
    CompanyQryCOMPANYTRADENAME: TIBStringField;
    CompanySrc: TDataSource;
    cxGridViewRepository3: TcxGridViewRepository;
    ViewComp: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    ViewCompanyCOMPANYTRADENAME: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridDBColumn15: TcxGridDBColumn;
    cxGridDBColumn16: TcxGridDBColumn;
    cxGridDBColumn17: TcxGridDBColumn;
    ViewCompanyISAGENT: TcxGridDBColumn;
    ViewCompanyISCLIENT: TcxGridDBColumn;
    cxGridDBColumn18: TcxGridDBColumn;
    ViewCompanyISTOUROPER: TcxGridDBColumn;
    ViewCompanyISOTHER: TcxGridDBColumn;
    ViewCompanyASDRIVE: TcxGridDBColumn;
    ViewCompanyASHOTEL: TcxGridDBColumn;
    ViewCompanyASVISAS: TcxGridDBColumn;
    ViewCompanyASINSUR: TcxGridDBColumn;
    ViewCompanyASEXCRS: TcxGridDBColumn;
    ViewCompanyASREKLM: TcxGridDBColumn;
    ViewCompanyASTICKT: TcxGridDBColumn;
    ViewCompanyASTOURS: TcxGridDBColumn;
    ViewCompanyASSCOLL: TcxGridDBColumn;
    ViewCompanyASAPAIR: TcxGridDBColumn;
    ViewCompanyASEMPLS: TcxGridDBColumn;
    ViewCompanyASFOODS: TcxGridDBColumn;
    ViewCompanyASURIST: TcxGridDBColumn;
    ViewCompanyASMEDIC: TcxGridDBColumn;
    ViewCompanyASRECRE: TcxGridDBColumn;
    ViewCompanyASEXTRM: TcxGridDBColumn;
    ViewCompanyASOTHER: TcxGridDBColumn;
    ViewCompanyASMUSEM: TcxGridDBColumn;
    ViewCompanyASXHIBT: TcxGridDBColumn;
    ViewCompanyASAMBAS: TcxGridDBColumn;
    ViewCompanyASCOMMC: TcxGridDBColumn;
    ViewCompanyASCMPTR: TcxGridDBColumn;
    ViewCompanyASSTNRY: TcxGridDBColumn;
    ViewCompanyASFURNT: TcxGridDBColumn;
    ViewCompanyASGOODS: TcxGridDBColumn;
    ViewCompanyASPETRL: TcxGridDBColumn;
    ViewCompanyASMEDIA: TcxGridDBColumn;
    ViewCompanyASCONSL: TcxGridDBColumn;
    ViewCompanyASGUARD: TcxGridDBColumn;
    ViewCompanyASBANKS: TcxGridDBColumn;
    ViewCompanyASLEASE: TcxGridDBColumn;
    ViewCompanyASKOMUN: TcxGridDBColumn;
    ViewCompanyASBUILD: TcxGridDBColumn;
    ViewCompanyASMASTR: TcxGridDBColumn;
    ViewCompanyASGUIDE: TcxGridDBColumn;
    ViewCompanyASPARSL: TcxGridDBColumn;
    ViewCompanyASPARSE: TcxGridDBColumn;
    ViewCompanyBUS17: TcxGridDBColumn;
    ViewCompanyASNETAGENT: TcxGridDBColumn;
    ViewCompanyASAUPAIR: TcxGridDBColumn;
    ViewCompanyISGOVERN: TcxGridDBColumn;
    ViewCompanyISENTERPR: TcxGridDBColumn;
    ViewCompanyISBUDGET: TcxGridDBColumn;
    ViewCompanyISPRIVATE: TcxGridDBColumn;
    ViewCompanyISBSMAN: TcxGridDBColumn;
    ViewCompanyCOUNTRYID: TcxGridDBColumn;
    ViewCompanyCITYID: TcxGridDBColumn;
    cxGridDBTableView6: TcxGridDBTableView;
    cxGridDBColumn19: TcxGridDBColumn;
    cxGridDBColumn20: TcxGridDBColumn;
    cxGridDBColumn21: TcxGridDBColumn;
    ViewCompanyCity: TcxGridDBTableView;
    ViewCompanyCityCITYID: TcxGridDBColumn;
    ViewCompanyCityNAME: TcxGridDBColumn;
    ViewCompanyCityNAME_ENG: TcxGridDBColumn;
    ViewCompanyCityPROVINCE: TcxGridDBColumn;
    ViewCompanyCityTOWNSHIP: TcxGridDBColumn;
    ViewCompanyCityCalcCity: TcxGridDBColumn;
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
    ViewCompany2: TcxGridDBTableView;
    ViewCompany2COMPANYID: TcxGridDBColumn;
    ViewCompany2NAME: TcxGridDBColumn;
    ViewCompany2ISENTERPR: TcxGridDBColumn;
    ViewCompany2ISPRIVATE: TcxGridDBColumn;
    Button10: TButton;
    TestTree: TIBQuery;
    TestTreeID: TIntegerField;
    TestTreePAR_ID: TIntegerField;
    TestTreeNAME: TIBStringField;
    TestTreeSrc: TDataSource;
    aTree: TcxDBTreeList;
    aTreeID: TcxDBTreeListColumn;
    aTreePAR_ID: TcxDBTreeListColumn;
    aTreeCHECK: TcxDBTreeListColumn;
    aTreeNAME: TcxDBTreeListColumn;
    TestTreeCHECK: TSmallintField;
    cxCheckBox1: TcxCheckBox;
    ImageChecked: TImageList;
    aTreecxDBTreeACHECK: TcxDBTreeListColumn;
    Button11: TButton;
    Button12: TButton;
    ViewTestTableCheck: TcxGridDBColumn;
    Languages: TIBQuery;
    LanguagesSrc: TDataSource;
    CNTREMBASSIES: TIBQuery;
    CNTREMBASSIESSrc: TDataSource;
    CNTREMBASSIESCNTREMBASSYID: TIntegerField;
    CNTREMBASSIESCOUNTRYID: TIntegerField;
    CNTREMBASSIESEMBASSYID: TIntegerField;
    CNTREMBASSIESOUREMBASSY: TIBStringField;
    CNTREMBASSIESPERMTRANSFDOC: TSmallintField;
    CNTREMBASSIESINPROVINCE: TIBStringField;
    CNTREMBASSIESALLREGION: TIBStringField;
    CNTREMBASSIESPAYBANKSERV: TFloatField;
    CNTREMBASSIESCURRSERV: TSmallintField;
    CNTREMBASSIESFUNDINGSUM: TFloatField;
    CNTREMBASSIESFUNDINGVAL: TSmallintField;
    CNTREMBASSIESFUNDINGCOUNT: TIntegerField;
    CNTREMBASSIESFUNDINGPERIOD: TSmallintField;
    CNTREMBASSIESBANKSUM: TFloatField;
    CNTREMBASSIESBANKVAL: TSmallintField;
    CNTREMBASSIESBANKCOUNT: TIntegerField;
    CNTREMBASSIESBANKPERIOD: TSmallintField;
    CNTREMBASSIESONTOURSUM: TFloatField;
    CNTREMBASSIESAUTOFILLING: TIBStringField;
    CNTREMBASSIESREADYTODAYS: TIntegerField;
    CNTREMBASSIESREADYTOTYPE: TIntegerField;
    CNTREMBASSIESUSECODE: TIBStringField;
    CNTREMBASSIESOURFILING: TIBStringField;
    CNTREMBASSIESAPPLTYPEDATE: TIntegerField;
    CNTREMBASSIESSERVCOST: TFloatField;
    CNTREMBASSIESSERVCOSTVAL: TSmallintField;
    CNTREMBASSIESSHORTNAME: TIBStringField;
    CNTREMBASSIESPARENTID: TIntegerField;
    CNTREMBASSIESFILINGPLACEWORK: TIBStringField;
    CNTREMBASSIESNOTUSED: TIBStringField;
    CNTREMBASSIESFULLFUNDING: TIBStringField;
    CNTREMBASSIESTYPEFUNDING: TIntegerField;
    CNTREMBASSIESFOROWNERVISA: TIBStringField;
    CNTREMBASSIESCOMMENTS: TMemoField;
    CNTREMBASSIESFORBIOMETRICPASS: TIBStringField;
    CNTREMBAS_INPROVINCE: TIBQuery;
    CNTREMBAS_INPROVINCESSrc: TDataSource;
    CNTREMBAS_INPROVINCEID: TIntegerField;
    CNTREMBAS_INPROVINCECNTREMBASSYID: TIntegerField;
    CNTREMBAS_INPROVINCEPROVINCEID: TIntegerField;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    IBRATEQry: TIBQuery;
    IBRATESrc: TDataSource;
    Memo1: TMemo;
    IBRATEQryTOURID: TIntegerField;
    IBRATEQryTOURNAME: TIBStringField;
    IBRATEQryTOURDAYS: TSmallintField;
    IBRATEQryTOURGROUPID: TIntegerField;
    IBRATEQryTOURDATE: TDateTimeField;
    IBRATEQryRATELINEID: TIntegerField;
    IBRATEQryRATELINENAME: TIBStringField;
    IBRATEQryRATELINETYPE: TIntegerField;
    IBRATEQryRATELINEDATESTART: TDateTimeField;
    IBRATEQryRATELINEDATEEND: TDateTimeField;
    IBRATEQryID_SERVICE: TIntegerField;
    IBRATEQryTYPE_SERVICE: TIntegerField;
    IBRATEQryNAMESERVICE: TIBStringField;
    IBRATEQryID_CURRENCY: TIntegerField;
    IBRATEQryNAMECURRENCY: TIBStringField;
    IBRATEQryRATELINEDETAILID: TIntegerField;
    IBRATEQryRATE: TFloatField;
    IBRATEQryAGENTPAY: TFloatField;
    IBRATEQryNAMECOINSCURRENCY: TIBStringField;
    Button17: TButton;
    Button18: TButton;
    lbRam: TLabel;
    Button19: TButton;
    Button20: TButton;
    Chromium1: TChromium;
    IBCOMPANIES_PARAM_NAME: TIBTable;
    Button21: TButton;
    Memo2: TMemo;
    IBCOMPANIES_PARAM_NAMEID: TIntegerField;
    IBCOMPANIES_PARAM_NAMENAME: TIBStringField;
    IBCOMPANIES: TIBTable;
    IBCOMPANIESCOMPANYID: TIntegerField;
    IBCOMPANIESISVENDOR: TIBStringField;
    IBCOMPANIESISCLIENT: TIBStringField;
    IBCOMPANIESCLASSCODE: TIBStringField;
    IBCOMPANIESTAXPAYCODE: TIBStringField;
    IBCOMPANIESASDRIVE: TIBStringField;
    IBCOMPANIESASHOTEL: TIBStringField;
    IBCOMPANIESASVISAS: TIBStringField;
    IBCOMPANIESASINSUR: TIBStringField;
    IBCOMPANIESASEXCRS: TIBStringField;
    IBCOMPANIESASREKLM: TIBStringField;
    IBCOMPANIESASOTHER: TIBStringField;
    IBCOMPANIESLICENSENO: TIBStringField;
    IBCOMPANIESMEMO: TMemoField;
    IBCOMPANIESASTICKT: TIBStringField;
    IBCOMPANIESASTOURS: TIBStringField;
    IBCOMPANIESISOTHER: TIBStringField;
    IBCOMPANIESISENTERPR: TIBStringField;
    IBCOMPANIESISPRIVATE: TIBStringField;
    IBCOMPANIESIDENTCODE: TIBStringField;
    IBCOMPANIESASSCOLL: TIBStringField;
    IBCOMPANIESASAPAIR: TIBStringField;
    IBCOMPANIESASEMPLS: TIBStringField;
    IBCOMPANIESISAGENT: TIBStringField;
    IBCOMPANIESISPROPS: TIBStringField;
    IBCOMPANIESISGOVERN: TIBStringField;
    IBCOMPANIESISBUDGET: TIBStringField;
    IBCOMPANIESISPOTENT: TIBStringField;
    IBCOMPANIESASFOODS: TIBStringField;
    IBCOMPANIESASURIST: TIBStringField;
    IBCOMPANIESASMEDIC: TIBStringField;
    IBCOMPANIESISHOTEL: TIBStringField;
    IBCOMPANIESASRECRE: TIBStringField;
    IBCOMPANIESASEXTRM: TIBStringField;
    IBCOMPANIESFORWORK: TIBStringField;
    IBCOMPANIESASMUSEM: TIBStringField;
    IBCOMPANIESASXHIBT: TIBStringField;
    IBCOMPANIESASAMBAS: TIBStringField;
    IBCOMPANIESASCOMMC: TIBStringField;
    IBCOMPANIESASCMPTR: TIBStringField;
    IBCOMPANIESASSTNRY: TIBStringField;
    IBCOMPANIESASFURNT: TIBStringField;
    IBCOMPANIESASGOODS: TIBStringField;
    IBCOMPANIESASPETRL: TIBStringField;
    IBCOMPANIESASMEDIA: TIBStringField;
    IBCOMPANIESASCONSL: TIBStringField;
    IBCOMPANIESASGUARD: TIBStringField;
    IBCOMPANIESASBANKS: TIBStringField;
    IBCOMPANIESASLEASE: TIBStringField;
    IBCOMPANIESASKOMUN: TIBStringField;
    IBCOMPANIESASBUILD: TIBStringField;
    IBCOMPANIESASMASTR: TIBStringField;
    IBCOMPANIESISBSMAN: TIBStringField;
    IBCOMPANIESADDMANID: TIntegerField;
    IBCOMPANIESNAME: TIBStringField;
    IBCOMPANIESCOMPKIND: TIBStringField;
    IBCOMPANIESMEETINGPLACE: TIntegerField;
    IBCOMPANIESVCARDNO: TIntegerField;
    IBCOMPANIESASPARSL: TIBStringField;
    IBCOMPANIESASGUIDE: TIBStringField;
    IBCOMPANIESFULLNAME: TMemoField;
    IBCOMPANIESORGFORMID: TIntegerField;
    IBCOMPANIESTAXPAY: TIBStringField;
    IBCOMPANIESTAXPAYREGDATE: TDateTimeField;
    IBCOMPANIESPRIVATEID: TIntegerField;
    IBCOMPANIESBUS01: TIBStringField;
    IBCOMPANIESBUS02: TIBStringField;
    IBCOMPANIESBUS03: TIBStringField;
    IBCOMPANIESBUS04: TIBStringField;
    IBCOMPANIESBUS05: TIBStringField;
    IBCOMPANIESBUS06: TIBStringField;
    IBCOMPANIESBUS07: TIBStringField;
    IBCOMPANIESBUS08: TIBStringField;
    IBCOMPANIESBUS09: TIBStringField;
    IBCOMPANIESBUS10: TIBStringField;
    IBCOMPANIESBUS11: TIBStringField;
    IBCOMPANIESBUS12: TIBStringField;
    IBCOMPANIESBUS13: TIBStringField;
    IBCOMPANIESBUS14: TIBStringField;
    IBCOMPANIESBUS15: TIBStringField;
    IBCOMPANIESBUS16: TIBStringField;
    IBCOMPANIESBUS17: TIBStringField;
    IBCOMPANIESBUS18: TIBStringField;
    IBCOMPANIESBUS19: TIBStringField;
    IBCOMPANIESASPARSE: TIBStringField;
    IBCOMPANIESTAXPAYSTATEID: TIntegerField;
    IBCOMPANIESNEWTAXPAYREGNO: TIBStringField;
    IBCOMPANIESTAXPAYREGNO: TIBStringField;
    IBCOMPANIESAGENTINFO1: TIBStringField;
    IBCOMPANIESAGENTINFO2: TIBStringField;
    IBCOMPANIESADDDATE: TDateTimeField;
    IBCOMPANIESWORKINGHOURS: TIBStringField;
    IBCOMPANIESRECEPTIONHOURS: TIBStringField;
    IBCOMPANIESLICENSEDATE: TDateTimeField;
    IBCOMPANIESSEMINAR: TIBStringField;
    IBCOMPANIESDATEOBDZVIN: TDateTimeField;
    IBCOMPANIESMANOBDZVIN: TIntegerField;
    IBCOMPANIESWARRANTYSUM: TFloatField;
    IBCOMPANIESWARRANTYVAL: TIntegerField;
    IBCOMPANIESWARRANTYTERM: TDateTimeField;
    IBCOMPANIESISTOUROPER: TIBStringField;
    IBCOMPANIESTRADENAMEID: TIntegerField;
    IBCOMPANIESVIPCLIENT: TIBStringField;
    IBCOMPANIESBLACKLIST: TIBStringField;
    IBCOMPANIESLICENSETERMIN: TIBStringField;
    IBCOMPANIESACTIONID: TIntegerField;
    IBCOMPANIESTAXPAYTYPEID: TIntegerField;
    IBCOMPANIESSINGLETAXTYPEID: TIntegerField;
    IBCOMPANIESSINGLETAXREGNO: TIBStringField;
    IBCOMPANIESSINGLETAXDATE: TDateTimeField;
    IBCOMPANIESGOVREESTRTYPEID: TIntegerField;
    IBCOMPANIESGOVREESTRDATE: TDateTimeField;
    IBCOMPANIESOBDZVIN: TSmallintField;
    IBCOMPANIESOBDZVINAGREEDATE: TDateTimeField;
    IBCOMPANIESWORKMANID: TIntegerField;
    IBCOMPANIESASNETAGENT: TIBStringField;
    IBCOMPANIESARENEWCONTRACT: TIBStringField;
    IBCOMPANIESPERMEXTRAAGENT: TIBStringField;
    IBCOMPANIESDOCTODATE: TDateTimeField;
    IBCOMPANIESFIXDEFECTTODATE: TDateTimeField;
    IBCOMPANIESSTANDOC: TIntegerField;
    IBCOMPANIESASAUPAIR: TIBStringField;
    IBCOMPANIESISFILIYA: TIBStringField;
    IBCOMPANIESHEADOFFICEID: TIntegerField;
    IBCOMPANIESISHEADOFFICE: TIBStringField;
    IBCOMPANIESNOTWORK: TIBStringField;
    IBCOMPANIESNOTWORKMANID: TIntegerField;
    IBCOMPANIESNOTWORKDATE: TDateTimeField;
    IBCOMPANIESORGFORMINNAME: TIBStringField;
    IBCOMPANIESWASDELETED: TIBStringField;
    IBCOMPANIESASRESIDENT: TIBStringField;
    IBCOMPANIESCODEID1C: TIBStringField;
    IBCOMPANIESFILIYACODE: TIBStringField;
    IBCOMPANIES_PARAM_DATA: TIBTable;
    IBCOMPANIES_PARAM_DATAID: TIntegerField;
    IBCOMPANIES_PARAM_DATAID_COMPANIES: TIntegerField;
    IBCOMPANIES_PARAM_DATAID_COMPANIES_PARAM_NAME: TIntegerField;
    IBCOMPANIES_PARAM_DATAAVALUE: TIntegerField;
    IBCompanyField: TIBQuery;
    IBCompanyFieldFIELDNAME: TIBStringField;
    IBCompanyFieldFIELDTYPE: TIBStringField;
    IBCompanyFieldFIELDSIZE: TSmallintField;
    IBCompanyFieldISNULL: TSmallintField;
    IBCompanyFieldDESCRIPTION: TMemoField;
    IBCOMPANIES_PARAM_NAMEDESCRIPT: TIBStringField;
    Button22: TButton;
    Button23: TButton;
    Panel1: TPanel;
    Cities_PhoneCode: TIBQuery;
    City_Adm_Unit_Info_PoneCode: TIBQuery;
    Cities_PhoneCodePHONECODE: TIBStringField;
    Cities_PhoneCodeID: TIntegerField;
    Button24: TButton;
    City_Adm_Unit_Info_PoneCodeID: TIntegerField;
    City_Adm_Unit_Info_PoneCodeID_CITY_ADM_UNIT: TIntegerField;
    City_Adm_Unit_Info_PoneCodeID_CITY_ADM_UNIT_TYPE_INFO: TIntegerField;
    City_Adm_Unit_Info_PoneCodeAVALUE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cxEditStyleController1StyleChanged(Sender: TObject);
    procedure ButClearCompanyCountryClick(Sender: TObject);
    procedure CmbxCompanyCountryPropertiesInitPopup(Sender: TObject);
    procedure CmbxCompanyCountryPropertiesChange(Sender: TObject);
    procedure cxLookupComboBox1PropertiesChange(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure aTreecxDBTreeACHECKPropertiesChange(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure ViewTestTableCellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ViewTestTableCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);

  private
     Arepositary: TcxEditRepositoryItem;

    { Private declarations }
  public
    function MyGetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False; AIsInplace: Boolean = True): WideString;


  procedure EditDrawItemEvent(AControl: TcxCustomComboBox; ACanvas: TcxCanvas;
    AIndex: Integer; const ARect: TRect; AState: TOwnerDrawState);
    { Public declarations }
  end;

 TresPoint = record
    First:Int64;
    Sec:Int64;
 end;




var
  FrmTestSynchronizeWebSoap: TFrmTestSynchronizeWebSoap;
  Elem_TMUSer : TDBShema;

  Elem_MERGESOAPWEB : TDBShemaSynchronize;
  Elem_HCountryQry : TDBShemaView;
  Elem_HCityQry : TDBShemaView;

  Elem_TourQry : TDBShemaView;
  Elem_TemplQry : TDBShemaView;
  Elem_GroupQry:TDBShemaView;
  Elem_TripQry :TDBShemaView;

  Elem_TR_AGES : TDBShemaView;
  Elem_TR_PERIODS:TDBShemaView;
  Elem_TR_RATES :TDBShemaView;

  Elem_Languages:TDBShemaView;

  Elem_TestSynhronize:TDBShemaView;
  Elem_SelCompCntryQry:TDBShemaView;
  Elem_COMPANYQRY: TDBShema;

  Elem_TestTree:TDBShemaTree;

  Elem_CNTREMBASSIES :TDBShemaView;
  Elem_CNTREMBAS_INPROVINCE :TDBShemaView;


  Elem_Cities_PhoneCode :TDBShemaView;
  Elem_City_Adm_Unit_Info_PoneCode :TDBShemaView;

implementation

uses
  FrmProgress;

{$R *.dfm}

function SetPoint(First,Sec:Integer): UInt64 ;
begin
 result := First + (Sec shl 24);
end;
//******************************************************************************
function GetPoint(value: Int64): TresPoint;
begin
 result.First := value and $FFFFFF;
 result.Sec := (value shr 24) and $FFFFFF;
end;
//******************************************************************************
procedure TFrmTestSynchronizeWebSoap.FormCreate(Sender: TObject);
var LogFieldNames : TLogFields;
begin
  //PrepareConnectDatabeseTourManTest( IBDatabase,True );
  PrepareConnectDatabeseTourManWork(IBDatabase,True);


  Elem_TMUSer := TDBShema.Create( TMUser, 'TMUSERS', 'TMUSERID' );
  Elem_TMUSer.DBOpen;
  LogFieldNames := GetStructRecLogFiles;

  {LogFieldNames.FieldID              := 'ID';
  LogFieldNames.FieldApplicationName := 'APLICATION';
  LogFieldNames.FieldIconApplication := 'APPLICATIONICON';
  LogFieldNames.FieldTitleElem       := 'TITLE';
  LogFieldNames.FieldTableName       := 'TABLENAME';
  LogFieldNames.FieldKeyFieldId      := 'KEYFIELDID';
  LogFieldNames.FieldIDObject        := 'OBJID';
  LogFieldNames.FieldIDUser          := 'USERID';
  LogFieldNames.FieldAction          := 'TYPEACTION';
  LogFieldNames.FieldDATE            := 'ADATE';
  LogFieldNames.FieldDATA            := 'ADATA';
  LogFieldNames.FieldFormName        := 'FORMNAME';
  LogFieldNames.FieldFormCaption     := 'FORMCAPTION'; }
  //*********************************

 { Elem_MERGESOAPWEB := TDBShemaSynchronize.Create( MERGESOAPWEB, nil, 'MERGESOAPWEB', 'ID','gen_mergesoapweb_id' );
  Elem_MERGESOAPWEB.SetTitle('Журнал веб. синхронізацій');
  Elem_MERGESOAPWEB.SetUserElem(Elem_TMUSer, 'TMFULLNAME');
  Elem_MERGESOAPWEB.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  Elem_MERGESOAPWEB.SetFieldColumnShowMainImage('TABLENAME');
  Elem_MERGESOAPWEB.DBOpen; }
  //***************************************************************************
  Elem_HCountryQry := TDBShemaView.Create( HCountryQry, ViewCountry, 'COUNTRIES', 'COUNTRYID' );
  //Elem_HCountryQry.SetWebSynchronizeElem( Elem_MERGESOAPWEB, ['COUNTRYID','NAME'],'NAME', True );
  Elem_HCountryQry.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
  //Elem_HCountryQry.SetLogTable('LOG_ADD',  LogFieldNames ,nil);
  Elem_HCountryQry.SetTitle('Країни');
  Elem_HCountryQry.SetMainIcon( ImageListElem, 4 );
  Elem_HCountryQry.AddIconToField('NAME','LATNAME','T', ImageListElem,16, 0, OptImgPosLeft );
  Elem_HCountryQry.AddIconToField('NAME','LATNAME','F', ImageListElem,16, 3, OptImgPosRight );
  Elem_HCountryQry.DBOpen;

  Elem_HCityQry := TDBShemaView.Create( HCityQry, ViewCity, 'CITIES', 'CITYID' );
 // Elem_HCityQry.SetWebSynchronizeElem( Elem_MERGESOAPWEB, [], 'NAME', True );
  Elem_HCityQry.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
 // Elem_HCityQry.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  Elem_HCityQry.AddMainElem( Elem_HCountryQry, 'COUNTRYID' );
  Elem_HCityQry.SetTitle('Міста');
  Elem_HCityQry.SetMainIcon(ImageListElem , 5);
  Elem_HCityQry.AddIconToField('NAME','SHOWWEB', null , ImageListElem,16, 2, OptImgPosLeft );
  Elem_HCityQry.DBOpen;

  Elem_TourQry :=  TDBShemaView.Create( TourQry, ViewTour, 'TOURES', 'ID', 'tours_gen' );
 // Elem_TourQry.SetWebSynchronizeElem( Elem_MERGESOAPWEB, [],'TOURNAME', True );
  Elem_TourQry.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
  //Elem_TourQry.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  Elem_TourQry.SetMainIcon( ImageListElem , 0 );
  Elem_TourQry.SetTitle('Тури');
  Elem_TourQry.DBOpen;

  Elem_TemplQry := TDBShemaView.Create( TemplQry, ViewTemplate, 'TOURTEMPLATES', 'TOURTEMPLATEID', 'TOURTEMPLATES_GEN' );
  Elem_TemplQry.AddMainElem( Elem_TourQry , 'TOURID');
  Elem_TemplQry.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
 // Elem_TemplQry.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  //Elem_TemplQry.SetWebSynchronizeElem( Elem_MERGESOAPWEB, [],'TEMPLATENAME', True );
  Elem_TemplQry.SetDS( TemplSrc );
  Elem_TemplQry.SetDefaultValue(['ShowWeb'], ['F']);
  Elem_TemplQry.SetTitle('Шаблони турів');
  Elem_TemplQry.SetMainIcon( ImageListElem , 2 );
  Elem_TemplQry.DBOpen;

  Elem_GroupQry := TDBShemaView.Create( GroupQry, ViewGroup, 'TOURGROUPS', 'TOURGROUPID', 'TOURGROUPS_GEN' );
  Elem_GroupQry.AddMainElem( Elem_TourQry , 'TOURID');
  Elem_GroupQry.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
 // Elem_GroupQry.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  //Elem_GroupQry.SetWebSynchronizeElem( Elem_MERGESOAPWEB, [],'', True );
  Elem_GroupQry.SetTitle('Групи турів');
  Elem_GroupQry.SetMainIcon( ImageListElem , 1 );
  Elem_GroupQry.DBOpen;

  Elem_TripQry := TDBShemaView.Create( TripQry, ViewTrip, 'TOURTRIPS', 'TOURTRIPID', 'TOURTRIP_GEN' );
  Elem_TripQry.AddMainElem( Elem_TemplQry , 'TOURTEMPLATEID');
  Elem_TripQry.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
  //Elem_TripQry.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  //Elem_TripQry.SetWebSynchronizeElem( Elem_MERGESOAPWEB, [],'', True );
  Elem_TripQry.SetDefaultValue(['NetCheck', 'Hidden'], ['T', 'F']);
  Elem_TripQry.SetTitle('Шаблон проїзду');
  Elem_TripQry.SetMainIcon( ImageListElem , 3 );
  Elem_TripQry.DBOpen;

  Elem_TR_AGES := TDBShemaView.Create( TR_AGES, nil, 'TR_AGES', 'AGEID' );
  Elem_TR_AGES.AddMainElem( Elem_TripQry , 'ServiceId');
  Elem_TR_AGES.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
 // Elem_TR_AGES.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  Elem_TR_AGES.SetTitle('Вік');
  Elem_TR_AGES.DBOpen;

  Elem_TR_RATES :=TDBShemaView.Create( TR_RATES, nil, 'TR_RATES', 'TOURRATEID' );
  Elem_TR_RATES.AddMainElem( Elem_TR_AGES , 'AGEID');
  Elem_TR_RATES.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
 // Elem_TR_RATES.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  Elem_TR_RATES.SetTitle('Вік категорії');
  Elem_TR_RATES.DBOpen;

  Elem_TR_PERIODS := TDBShemaView.Create( TR_PERIODS, nil, 'TR_PERIODS', 'PERIODID' );
  Elem_TR_PERIODS.AddMainElem( Elem_TripQry , 'ServiceId');
  Elem_TR_PERIODS.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
 // Elem_TR_PERIODS.SetLogTable('LOG_ADD',  LogFieldNames,nil );
  Elem_TR_PERIODS.SetTitle('Періоди');
  Elem_TR_PERIODS.DBOpen;

  Elem_Languages := TDBShemaView.Create( Languages, ViewTestTable, 'Languages', 'id' );
  Elem_Languages.DBOpen;

 { Elem_TestSynhronize:= TDBShemaView.Create( IBQueryTESTTABLE, ViewTestTable, 'TEST_TABLE', 'ID', 'gen_test_table_id' );
  Elem_TestSynhronize.UpdateForm := true;
  Elem_TestSynhronize.SetUserElem( Elem_TMUSer, 'TMFULLNAME');
  Elem_TestSynhronize.SetWebSynchronizeElem( Elem_MERGESOAPWEB, ['name','avalue'], 'NAME', True );   //
  Elem_TestSynhronize.DBOpen;    }

  Elem_SelCompCntryQry   := TDBShemaView.Create( SelCompCntryQry, nil, 'COUNTRIES', 'COUNTRYID', '' );
  Elem_SelCompCntryQry.ViewList := ViewCompanyCountry;
  Elem_SelCompCntryQry.DBOpen;
  Elem_SelCompCntryQry.SetExtLookupComboBoxListView(CmbxCompanyCountry,'NAME',True,False,nil,'Всі країни');

  //Arepositary:= TcxEditRepositoryItem.Create(self);
  //CmbxCompanyCountry.RepositoryItem :=Arepositary;
 { Elem_TestTree   := TDBShemaTree.Create( TestTree,   aTree, 'TEST_TREE', 'ID', '' );
  Elem_TestTree.DBOpen;
  Elem_TestTree.TreeExpandAll;   }
 // CmbxCompanyCountry.Properties.OnDrawItem := EditDrawItemEvent;
  //Arepositary.Properties. GetDisplayText:=MyGetDisplayText;

  Elem_COMPANYQRY := TDBShema.Create( CompanyQry, 'COMPANIES', 'COMPANYID', 'COMPANIES_GEN' );

  Elem_CNTREMBASSIES := TDBShemaView.Create( CNTREMBASSIES,nil, 'CNTREMBASSIES', 'CNTREMBASSYID', 'CNTREMBASSIES_GEN' );
  Elem_CNTREMBAS_INPROVINCE := TDBShemaView.Create( CNTREMBAS_INPROVINCE, nil, 'CNTREMBAS_INPROVINCE', 'ID', 'gen_cntrembas_inprovince_id' );


  Elem_Cities_PhoneCode := TDBShemaView.Create( Cities_PhoneCode,nil, 'CITY_ADM_UNIT', 'ID', '' );
  Elem_City_Adm_Unit_Info_PoneCode := TDBShemaView.Create( City_Adm_Unit_Info_PoneCode,nil, 'CITY_ADM_UNIT_INFO', 'ID', 'gen_city_adm_unit_info_id' );

 { FrameSearchCity1.Prepare( Elem_HCityQry.DBGetParamConnect, Elem_HCountryQry.GetValueId,
                           [ OptFiedlCityName,OptFiedlProvinceName, OptFieldTownShip],
                            nil, MyStyle.Styles );}
end;

procedure TFrmTestSynchronizeWebSoap.EditDrawItemEvent(AControl: TcxCustomComboBox; ACanvas: TcxCanvas;
    AIndex: Integer; const ARect: TRect; AState: TOwnerDrawState);
begin
  //if AControl.EditValue= null then
  //  ACanvas.DrawTexT('Всі Країни',ARect,1,true );
end;

function TFrmTestSynchronizeWebSoap.MyGetDisplayText(const AEditValue: TcxEditValue;
  AFullText: Boolean = False; AIsInplace: Boolean = True): WideString;
begin
  Result := '';
end;


procedure TFrmTestSynchronizeWebSoap.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAllElements;

end;

procedure TFrmTestSynchronizeWebSoap.Button1Click(Sender: TObject);
var Progres:TProgressFormProp;
begin
  Elem_HCountryQry.WebSynchronizeDB( Progres, True );
  Elem_TourQry.WebSynchronizeDB( Progres, True);
end;

procedure TFrmTestSynchronizeWebSoap.Button2Click(Sender: TObject);
begin
 Elem_MERGESOAPWEB.ShowMergeLog;
end;

procedure TFrmTestSynchronizeWebSoap.Button3Click(Sender: TObject);
begin
 Elem_MERGESOAPWEB.ShowMergeLog(True,False,False,False);
end;

procedure TFrmTestSynchronizeWebSoap.Button4Click(Sender: TObject);
var SameValue:Int64;
    Values:TresPoint;
    StartDate, EndDate: TDateTime;
    i,years:Integer;
    a:Double;
begin
 //SameValue := SetPoint( 500529 , 945345 );
                                           //9989898
 SameValue := SetPoint( 9999999 , 127 );
 //a:=StrToFloat( '96900529897,7' );

 //ShowMessage(FloatToStr(a));
 Values := GetPoint( SameValue );
 ShowMessage( IntToStr( Values.First )+' '+ IntToStr( Values.Sec ) );
 {StartDate:=StrToDate('07.07.2017');
 EndDate:=StrToDate('12.02.2018');

 years := YearsBetween(StartDate,EndDate);
 i := MonthsBetween(StartDate, EndDate)- years * 12;
 //i := BusinessDaysBetween( StartDate, EndDate );
 ShowMessage( IntToStr(i) );}
end;

procedure TFrmTestSynchronizeWebSoap.Button5Click(Sender: TObject);
var StrFieldData:TFieldValuePackedArr;
    stm,Stream,StreamIcon: TMemoryStream;
    i:Integer;
    bf      : TBlobField;
    ArraySize:Integer;
    L:Integer;
begin
 if IBQuery1.Active then IBQuery1.Close;
 IBQuery1.open;
 IBQuery1.Last;
 Stream := TMemoryStream.Create;
 StreamIcon := TMemoryStream.Create;

 TBlobField(IBQuery1.FieldByName('ADATA')).SaveToStream( Stream );

 TBlobField(IBQuery1.FieldByName('APPLICATIONICON')).SaveToStream( StreamIcon );

 StreamIcon.SaveToFile( 'D:\testIconApp.bmp');
 Image1.Picture.Bitmap.LoadFromStream( StreamIcon );
 StreamIcon.Free;
 exit;
  try
    Stream.Position :=0;
    Stream.Read(L, SizeOf(L));
    SetLength(StrFieldData, L);
    Stream.Read( Pointer(StrFieldData)^, L * SizeOf(TfieldPackedValue));

     for i:=0 to Length(StrFieldData)-1 do
     ShowMessage( StrFieldData[i].FieldName +' = '+StrFieldData[i].Value );
  finally
    Stream.Free;
  end;
end;

procedure TFrmTestSynchronizeWebSoap.Button6Click(Sender: TObject);
begin
 Elem_TripQry.CascadeDelete;
end;

procedure ShowLog( ConnectToDB, Login, Password: String;aFormActive:TForm;  MarkDifStyle:TcxStyle );
var LogView:TFunctLog;
    TableNames:TVarArr;
begin
 { try
   LogView:=TFunctLog.Create( ConnectToDB, Login, Password ) ;
   LogView.ShowLogPrograms(1, aFormActive, -1, TableNames, MarkDifStyle);
  finally
   LogView.Close;
  end; }
end;

procedure TFrmTestSynchronizeWebSoap.Button8Click(Sender: TObject);
begin
 ShowLog( IBDatabase.DatabaseName, IBDatabase.Params.Values['user_name'], IBDatabase.Params.Values['password'],nil, cxStyle215) ;
end;

procedure TFrmTestSynchronizeWebSoap.Button9Click(Sender: TObject);
var ElemRateLine:TStructureSynchronizeSoapWeb;
    ElemRateLineCategory :TStructureSynchronizeSoapWeb;
    ElemRateLineDate :TStructureSynchronizeSoapWeb;
    ElemRateLineSeason :TStructureSynchronizeSoapWeb;
    ElemRateLineServ :TStructureSynchronizeSoapWeb;
    ElemRateLineServDetail:TStructureSynchronizeSoapWeb;

    DBParam: TConnectDBParam;
    var PathDB, UID, Password:String;
begin
  GetParamDatabaseIB( IBDatabase, PathDB, UID, Password );

  DBParam.PathDB := PathDB;
  DBParam.UID := UID;
  DBParam.Password := Password;

  try
   ElemRateLine:= TStructureSynchronizeSoapWeb.Create( 'RATE_LINE', DBParam , true);
   ElemRateLineCategory:= TStructureSynchronizeSoapWeb.Create( 'RATE_LINE_CATEGORY', DBParam, true );
   ElemRateLineDate:= TStructureSynchronizeSoapWeb.Create( 'RATE_LINE_DATE', DBParam , true);
   ElemRateLineSeason:= TStructureSynchronizeSoapWeb.Create( 'RATE_LINE_SEASON', DBParam , true);
   ElemRateLineServ:= TStructureSynchronizeSoapWeb.Create( 'RATE_LINE_SERV', DBParam, true );
   ElemRateLineServDetail:= TStructureSynchronizeSoapWeb.Create( 'RATE_LINE_SERV_DETAIL', DBParam, true );

   SynchroniceWebSoapAll ( true, ProgressBar );
  finally
    //CloseAllSynchroniceElements;
  end;
end;

procedure TFrmTestSynchronizeWebSoap.SpeedButton1Click(Sender: TObject);
var ValueStream:TMemoryStream;
begin
  Elem_TestSynhronize.UpdateForm:=false;

  ValueStream:= TMemoryStream.Create;


  Elem_TestSynhronize.DB.Insert;
  Elem_TestSynhronize.DB.FieldByName('NAME').AsString:='acid';
  Elem_TestSynhronize.DB.FieldByName('AVALUE').AsString:='value2';
  //Elem_TestSynhronize.DBAddBlobData('TEST_BLOB', );
  //ValueStream.LoadFromFile( 'D:\TEST\test.png');
  //Elem_TestSynhronize.DBAddBlobData('TEST_BLOB',ValueStream );
  Elem_TestSynhronize.DB.Post;

  ValueStream.Free;
end;

procedure TFrmTestSynchronizeWebSoap.SpeedButton2Click(Sender: TObject);
begin
  Elem_TestSynhronize.DB.Delete;


end;


procedure TFrmTestSynchronizeWebSoap.cxEditStyleController1StyleChanged(
  Sender: TObject);
begin
  //CmbxCompanyCountry.RepositoryItem.Properties.
end;

procedure TFrmTestSynchronizeWebSoap.ButClearCompanyCountryClick(
  Sender: TObject);
begin
  CmbxCompanyCountry.EditValue:=null;

 

end;

procedure TFrmTestSynchronizeWebSoap.CmbxCompanyCountryPropertiesInitPopup(
  Sender: TObject);
begin
  //if TcxComboBox(Sender).EditValue = null then  TcxComboBox(Sender).Text:='';
end;

{ TMycxExtLookupComboBoxProperties }

procedure TMycxExtLookupComboBoxProperties.DoPrepareDisplayValue(
  const AEditValue: TcxEditValue; var ADisplayValue: TcxEditValue;
  AEditFocused: Boolean);
begin
  inherited;
  if VarIsNull(AEditValue) or (AEditValue = '')or(AEditValue = null) then
    ADisplayValue := '- Select -';
end;

{ TMyTcxExtLookupComboBox }

class function TMyTcxExtLookupComboBox.GetPropertiesClass: TcxCustomEditPropertiesClass;
begin
   Result := TMycxExtLookupComboBoxProperties;
end;

procedure TFrmTestSynchronizeWebSoap.CmbxCompanyCountryPropertiesChange(
  Sender: TObject);
begin

  TcxExtLookupComboBox(Sender).Properties.OnChange := nil;
  if TcxExtLookupComboBox(Sender).EditValue = Null then
    TcxExtLookupComboBox(Sender).Text := 'Nothing';
 TcxExtLookupComboBox(Sender).Properties.OnChange := CmbxCompanyCountryPropertiesChange;

end;

procedure TFrmTestSynchronizeWebSoap.cxLookupComboBox1PropertiesChange(
  Sender: TObject);
begin
 TcxLookupComboBox(Sender).Properties.OnChange := nil;
  if TcxLookupComboBox(Sender).EditValue = Null then
    TcxLookupComboBox(Sender).Text := 'Nothing';
 TcxLookupComboBox(Sender).Properties.OnChange := cxLookupComboBox1PropertiesChange;
end;

procedure TFrmTestSynchronizeWebSoap.Button10Click(Sender: TObject);
begin
 // CompanyQry.Close;
 // CompanyQry.Open;
  ViewComp.BeginUpdate;
  Elem_COMPANYQRY.DB.Close;
  Elem_COMPANYQRY.DB.Open;
  //Elem_COMPANYQRY.DB.Close;
  //Elem_COMPANYQRY.DB.Open;
  ViewComp.EndUpdate;
end;

procedure TFrmTestSynchronizeWebSoap.aTreecxDBTreeACHECKPropertiesChange(
  Sender: TObject);
begin
  Elem_TestTree.CheckSmartFocusedNode( 'ACHECK' );
end;

procedure TFrmTestSynchronizeWebSoap.Button11Click(Sender: TObject);
begin
  Elem_TestTree.SetFilterOnTree(['ID'],[12,13],['<>'],[]);
  Elem_TestTree.RefreshSmartNodesOnTree('ACHECK');
end;

procedure TFrmTestSynchronizeWebSoap.Button12Click(Sender: TObject);
begin
  Elem_TestTree.ClearFilterOnTree;
  Elem_TestTree.RefreshSmartNodesOnTree('ACHECK');
end;

function CheckList(ARecord: TcxCustomGridRecord; aList:TList): Boolean;
begin
  //Result := aList.IndexOf(Pointer(ARecord.RecordIndex)) <> - 1;
end;

procedure TFrmTestSynchronizeWebSoap.ViewTestTableCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var AGridRecord: TcxCustomGridRecord;
    indColCheck:integer;
begin
{ AGridRecord:=TcxGRidDBTableView(Sender).DataController.Controller.SelectedRecords[0];
 indColCheck:=GetIndexColByCaptionFromWiew('Check',TcxGRidDBTableView(Sender));
 if ACellViewInfo.Item.Index=indColCheck then
    begin
      if (AGridRecord <> nil) then
        if CheckList(AGridRecord,self.FSelectPetitionTemplate) then
           begin
             FSelectPetitionTemplate.Remove(Pointer(AGridRecord.RecordIndex));
             AGridRecord.Values[indColCheck]:=false;
             Abort;
           end
        else
           begin
            FSelectPetitionTemplate.Add(Pointer(AGridRecord.RecordIndex));
            AGridRecord.Values[indColCheck]:=true;
            Abort;
           end;
    end; }

end;

procedure TFrmTestSynchronizeWebSoap.ViewTestTableCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 { if (AViewInfo.Item=ViewTestTableCheck)and
    (AViewInfo.EditViewInfo is TcxCustomCheckBoxViewInfo) then
    TcxCustomCheckBoxViewInfo(AViewInfo.EditViewInfo).State :=  TcxCheckBoxState(CheckList(AViewInfo.GridRecord,FSelectPetitionTemplate)); }
end;

procedure FillEmbassisInProvince(idEmbasis:Variant;Id_Str : TStringList );
var i:integer;
begin
  for i:=0 to Id_Str.Count-1 do
  begin

    Elem_CNTREMBAS_INPROVINCE.DB.Insert;
    Elem_CNTREMBAS_INPROVINCE.DB.FieldByName('CNTREMBASSYID').Value := idEmbasis;
    Elem_CNTREMBAS_INPROVINCE.DB.FieldByName('PROVINCEID').asString :=Id_Str.Strings[i];
    Elem_CNTREMBAS_INPROVINCE.DB.Post;

  end;
end;


procedure TFrmTestSynchronizeWebSoap.Button13Click(Sender: TObject);
var Id_Str:TStringList;
    Progres:TProgressFormProp;
begin
  Elem_CNTREMBASSIES.DBOpen;
  Elem_CNTREMBAS_INPROVINCE.DBOpen;

 try
  Progres := ShowProgress( 'Waint' , Elem_CNTREMBASSIES.DBRecordCount );

  Elem_CNTREMBASSIES.DB.First;
  While not Elem_CNTREMBASSIES.DB.Eof do
  begin
    try
      Id_Str := SplitToWords( Elem_CNTREMBASSIES.DB.FieldByName('INPROVINCE').AsString );
      FillEmbassisInProvince(Elem_CNTREMBASSIES.GetValueId, Id_Str );
    finally
      Id_Str.Free;
    end;
    Elem_CNTREMBASSIES.DB.Next;
    Progres.ProgressBar.Position := Progres.ProgressBar.Position +1;
  end;
 finally
   ClosedProgress;
 end;
end;

procedure TFrmTestSynchronizeWebSoap.Button14Click(Sender: TObject);
begin
  //ShowMessage( VarToStr( FrameSearchCity1.EditValue ) );
end;

procedure TFrmTestSynchronizeWebSoap.Button15Click(Sender: TObject);
var ViewFilesIE:TViewFilesIE;
    PropMSG : TPropMSG;
    BillFile:String;
begin
  BillFile:= 'D:\Development\Delphi\Software\Замовлення № 1652622017-04-11 18-28-36 .eml';

  ViewFilesIE := TViewFilesIE.create;//Create(Nil,Nil,nil);
    try
      PropMSG := ViewFilesIE.ParseOutlookFile(BillFile, 'D:\temp\');

      ShellOpenDocument(PropMSG.From.name);
    finally
      ViewFilesIE.Close;
      ViewFilesIE := nil;
    end;


end;

function MakeXmlRate(Dataset:TDataset;isAgent:Boolean):widestring;
var
  xml: IXMLDOMDocument;
  node: IXMLDomNode;
  node2: IXMLDomNode;
  nodes_row: IXMLDomNodeList;
  ProcesInst:IXMLDOMProcessingInstruction;
  Root:IXMLDOMElement;
begin
  xml := CreateOleObject('Microsoft.XMLDOM') as IXMLDOMDocument;
  xml.async := False;
  ProcesInst:=xml.createProcessingInstruction('xml','version='+#39+'1.0'+#39+' '+'encoding='+#39+'utf-8'+#39);
  xml.insertBefore(ProcesInst,xml.childNodes[0]);

  Root := xml.createElement('RATES');
  xml.appendchild(Root);

  //xml.Encoding := 'UTF-8';
end;


function MakeJsonRate(Dataset:TDataset;isAgent:Boolean):widestring;
var  i:Integer;
   JSONObject : TlkJSONobject;
   ListLineRate : TlkJSONlist;
   ListServiceRate : TlkJSONlist;

   JSONObjectRate : TlkJSONobject;
   ServiceObjectRate : TlkJSONobject;
   Find:Boolean;
   TotalSum:Double;
   TotalAgentPay:Double;
//***************************************************************
function findObjInListByName(aList : TlkJSONlist;aNameSection,aNameValue:String ):TlkJSONobject;
var i:integer;
    s:string;
begin
  Result := nil;
  for i:=0 to aList.Count-1 do
  begin
   s :=aList.Child[i].Field[aNameSection].Value;
   if s = aNameValue then
   begin
     Result := TlkJSONobject(aList.Child[i]);
     Break;
   end;
 end;
end;
//***************************************************************
procedure AddRateService( aList:TlkJSONobject; aIsAgent:Boolean );
begin
  aList.Add('ID_SERVICE',Dataset.FieldByName('ID_SERVICE').asInteger );
  aList.Add('TYPE_SERVICE',Dataset.FieldByName('TYPE_SERVICE').asInteger );
  aList.Add('ID_CURRENCY',Dataset.FieldByName('ID_CURRENCY').asInteger );
  aList.Add('RATE',Dataset.FieldByName('RATE').AsFloat );
  if aIsAgent then
    aList.Add('AGENTPAY',Dataset.FieldByName('AGENTPAY').AsFloat );
end;
//***************************************************************
begin
  JSONObject := TlkJSONobject.Create;

  Dataset.Open;
  Dataset.First;
  ListLineRate := TlkJSONlist.Create;

  while not Dataset.Eof do
  begin

    ServiceObjectRate  := TlkJSONobject.Create;
    TotalSum := Dataset.FieldByName('RATE').AsFloat;
    TotalAgentPay := Dataset.FieldByName('AGENTPAY').AsFloat;

    JSONObjectRate := findObjInListByName( ListLineRate, 'RATE_NAME',Dataset.FieldByName('NAME').AsString );
    if JSONObjectRate = nil then
    begin
      ListServiceRate := TlkJSONlist.Create;
      JSONObjectRate:= TlkJSONobject.Create;
      JSONObjectRate.Add( 'ID', Dataset.FieldByName('ID').asInteger );
      JSONObjectRate.Add( 'RATE_NAME', Dataset.FieldByName('NAME').AsString );
      JSONObjectRate.Add( 'ATYPE', Dataset.FieldByName('ATYPE').asInteger );
      JSONObjectRate.Add( 'DATE_START', Dataset.FieldByName('DATE_START').AsString );
      JSONObjectRate.Add( 'DATE_END', Dataset.FieldByName('DATE_END').AsString );

      if ListLineRate.IndexOf( JSONObjectRate ) = -1 then
        ListLineRate.Add( JSONObjectRate );

      Find:=False;
      JSONObjectRate.Add( 'TOTAL_RATE', TotalSum );
      if isAgent then
        JSONObjectRate.Add( 'TOTAL_AGENTPAY', TotalAgentPay );
    end
    else
    begin
      ListServiceRate := TlkJSONlist(JSONObjectRate.Field['RATE_SERVICE']);
      JSONObjectRate.Field['TOTAL_RATE'].Value := JSONObjectRate.Field['TOTAL_RATE'].Value + TotalSum;
      if isAgent then
        JSONObjectRate.Field['TOTAL_AGENTPAY'].Value := JSONObjectRate.Field['TOTAL_AGENTPAY'].Value + TotalAgentPay;

      Find:=True;
    end;

    AddRateService( ServiceObjectRate,isAgent );
    ListServiceRate.Add( ServiceObjectRate );
    if not Find then JSONObjectRate.Add( 'RATE_SERVICE', ListServiceRate );

    Dataset.Next;
  end;

  JSONObject.Add('RATES', ListLineRate );
  i:=0;

  result :=   Utf8Decode( GenerateReadableText(JSONObject, i)) ;
  JSONObject.Free;
end;


procedure TFrmTestSynchronizeWebSoap.Button16Click(Sender: TObject);
var aPiSite : TApiSite;
begin
  IBRATEQry.Close;
  IBRATEQry.ParamByName('DATEPAY').Value := Date;
  IBRATEQry.ParamByName('DATE_START').Value := Date;
  IBRATEQry.ParamByName('DATE_END').Value := MaxDateTime;
  IBRATEQry.ParamByName('CATEGORY_ORDERS').Value := 0;
  IBRATEQry.ParamByName('ID_TOUR').Value := -1;

  IBRATEQry.ParamByName('ID_LNG').Value := 448;
  IBRATEQry.ParamByName('AGE').Value := 10;
  IBRATEQry.Open;

  aPiSite := TApiSite.Create;
  Memo1.Lines.Text := aPiSite.MakeJsonToursAndRates( IBRATEQry , True );
  //Memo1.Lines.Text := MakeJsonRate( IBRATEQry, True );

  aPiSite.Free;
end;

procedure TFrmTestSynchronizeWebSoap.Button17Click(Sender: TObject);
var aPiSite : TApiSite;
begin
  IBRATEQry.Close;
  IBRATEQry.ParamByName('DATEPAY').Value := Date;
  IBRATEQry.ParamByName('DATE_START').Value := Date;
  IBRATEQry.ParamByName('DATE_END').Value := MaxDateTime;
  IBRATEQry.ParamByName('CATEGORY_ORDERS').Value := 0;
  IBRATEQry.ParamByName('ID_TOUR').Value := -1;


  IBRATEQry.ParamByName('ID_LNG').Value := 448;
  IBRATEQry.ParamByName('AGE').Value := 10;
  IBRATEQry.Open;

  aPiSite := TApiSite.Create;

  Memo1.Lines.Text := aPiSite.MakeToursAndRatesObject( IBRATEQry , True , opApiXML);

  aPiSite.Free;
end;
type
 TDllFunct = function( DllFunc:Pointer; paramFun:Pointer ):boolean;

 TGTextTranslate = function ( LngFrom, LngTo, TextForTranslate : WideString;
                              TextNeedConvertToUrl:Boolean ):WideString; stdcall;


 TMyParamDll = Record
   aForm:TForm;
   LngFrom: String;
   LngTo: String;
   TextForTranslate: String;
   TextNeedConvertToUrl:Boolean;
   TranslatedReS:String;
 end;
 PMyParamDll = ^TMyParamDll;

function MyDllFunct( DllFunc : Pointer; paramFun:Pointer):boolean;
var Res:Integer;
begin
  Res:=-1;
  PMyParamDll(paramFun)^.TranslatedReS := TGTextTranslate(DllFunc) (
    PMyParamDll(paramFun)^.LngFrom,
    PMyParamDll(paramFun)^.LngTo,
    PMyParamDll(paramFun)^.TextForTranslate,
    PMyParamDll(paramFun)^.TextNeedConvertToUrl );
end;

procedure TFrmTestSynchronizeWebSoap.Button18Click(Sender: TObject);
var str :String;
    i:Integer;
    Status: TMemoryStatus;
    Res:Integer;

var param:PMyParamDll;
begin

   new(param);
   param.aForm := Self;
   param.LngFrom := 'uk';
   param.LngTo := 'ru';
   param.TextForTranslate := 'Англійський фунт';
   param.TextNeedConvertToUrl:=True;

   ExecFunctDLL( 'GTranslate.dll', 'GTextTranslate', MyDllFunct, param ) ;
   ShowMessage(param.TranslatedReS);
   Dispose(param);
  {for i:=0 to 2000 do
  begin

  Status.dwLength := sizeof(TMemoryStatus);
  GlobalMemoryStatus(Status);

  lbRam.Caption := FloatToStr( Status.dwMemoryLoad) +'  '+FloatToStr( Status.dwAvailPhys )+'  '+FloatToStr( Status.dwTotalVirtual );


   //CefLoadLibDefault;
   //Sleep(10000);
   str := ShowTranslateText('auto','ru','Австралійский фунт',True,True );

   //CefFreeLibDefault;


   //Sleep( Random(5000) );
  end;}
  
end;

function GTextTranslate( LngFrom, LngTo, TextForTranslate:Widestring;
                        TextNeedConvertToUrl:Boolean ):Widestring;stdcall;
//var FrmOwner:TForm;
//    GoogleTranslate : TGoogleTranslate;
begin
 { try
   Application.CreateForm( TForm, FrmOwner );
   GoogleTranslate:= TGoogleTranslate.Create( FrmOwner );
   //GoogleTranslate := TGoogleTranslate.Create( FrmTestSynchronizeWebSoap );
   result := GoogleTranslate.Translate( LngFrom, LngTo, TextForTranslate, TextNeedConvertToUrl, OptTranslate );

  finally
    GoogleTranslate.Close;
    FrmOwner.free;
  end;}
end;

procedure TFrmTestSynchronizeWebSoap.Button19Click(Sender: TObject);
var sres:string;
begin
  //sres := GTextTranslate( 'uk', 'ru', 'Англійський фунт', True );
  //ShowMessage(sres);
end;

procedure TFrmTestSynchronizeWebSoap.Button20Click(Sender: TObject);
var  CallSoap1C:TFunctCallSoap1C;
begin
 { CallSoap1C := TFunctCallSoap1C.Create( 'Apollo:D:\TourMn\NetTour\TOURIB.GDB', 'SYSDBA', 'HonzOKey', cxStyle215 );
  CallSoap1C.ShowFindMergeSoap1CLog( 1, true, true, true, true, true,false );
  CallSoap1C.Close; }
end;


{constructor TElementNameVisitor.Create(AMemo:TMemo);
begin
  inherited Create;
  FMemo := AMemo;
end;

procedure TElementNameVisitor.Visit(const document: ICefDomDocument);
  procedure ProcessNode(ANode: ICefDomNode);
  var
    Node: ICefDomNode;
  begin
    if Assigned(ANode) then
    begin
      Node := ANode.FirstChild;
      while Assigned(Node) do
      begin
        if Node.ElementTagName='DIV' then
        begin
          if Node.GetElementAttribute('id')='type-tabs' then
            FMemo.Lines.Add('FOUND');
        end;
        ProcessNode(Node);
        Node := Node.NextSibling;
      end;
    end;
  end;

begin
  FMemo.Lines.Add('START');
  ProcessNode(document.Body);
end; }

{ TElementNameVisitor }

{constructor TElementNameVisitor.Create(AMemo: TMemo);
begin
  inherited Create;
  FMemo := AMemo;
end;}

(*procedure TElementNameVisitor.visit(const document: ICefDomDocument);
  procedure ProcessNode2(ANode: ICefDomNode);
  var
    Node: ICefDomNode;
  begin
   { if Assigned(ANode) then
    begin
      Node := ANode.FirstChild;
      while Assigned(Node) do
      begin
        if Node.ElementTagName='DIV' then
        begin
          //if Node.GetElementAttribute('id')='type-tabs' then
          //  FMemo.Lines.Add('FOUND');
        end;
        ProcessNode(Node);
        Node := Node.NextSibling;
      end;
    end; }
  end; 

begin
  //FMemo.Lines.Add('START');
  //inherited;
  //ProcessNode(document.Body);
end;  *)



procedure TFrmTestSynchronizeWebSoap.Button21Click(Sender: TObject);
var i:Integer;
begin
   IBCompanyField.Open;
   IBCOMPANIES_PARAM_NAME.Open;

   while not IBCompanyField.Eof do
   begin
     if IBCOMPANIES_PARAM_NAME.Locate('NAME',Trim( IBCompanyField.FieldByName('FIELDNAME').AsString ),[] )  then
     begin
       IBCOMPANIES_PARAM_NAME.Edit;
       IBCOMPANIES_PARAM_NAME.FieldByName('DESCRIPT').AsString := IBCompanyField.FieldByName('DESCRIPTION').AsString;
       IBCOMPANIES_PARAM_NAME.Post;
     end;


     IBCompanyField.Next;
   end;

 { IBCOMPANIES.Open;
  IBCOMPANIES_PARAM_NAME.Open;
  IBCOMPANIES_PARAM_DATA.Open;
  IBCOMPANIES.First;
  While not IBCOMPANIES.Eof do
  begin
    IBCOMPANIES_PARAM_NAME.First;
    while not IBCOMPANIES_PARAM_NAME.Eof do
    begin
      if IBCOMPANIES.FindField( IBCOMPANIES_PARAM_NAME.FieldByName('NAME').AsString ) <> nil then
      if IBCOMPANIES.FieldByName( IBCOMPANIES_PARAM_NAME.FieldByName('NAME').AsString ).AsBoolean then
      begin
        IBCOMPANIES_PARAM_DATA.Insert;
        IBCOMPANIES_PARAM_DATA.FieldByName('ID_COMPANIES').AsInteger := IBCOMPANIES.FieldByName('COMPANYID').AsInteger;
        IBCOMPANIES_PARAM_DATA.FieldByName('ID_COMPANIES_PARAM_NAME').AsInteger := IBCOMPANIES_PARAM_NAME.FieldByName('ID').AsInteger;
        IBCOMPANIES_PARAM_DATA.FieldByName('AVALUE').AsInteger := 1;
        IBCOMPANIES_PARAM_DATA.Post;
      end;

      IBCOMPANIES_PARAM_NAME.Next;
    end;

    IBCOMPANIES.Next;
  end; }
end;

procedure TFrmTestSynchronizeWebSoap.Button22Click(Sender: TObject);
var Path:WideString;
    PathTo :WideString;
    CurrPath:WideString;
    CurrPathTo:WideString;
    aList:TStringList;
    i:Integer;
    IdxPic:Integer;
begin
   Path := '\\DWARF\Tours_files\';
   PathTo:= 'N:\ТурМенеджер - Документи\WEB\IMAGES\CONTENTS\TOUR\';

   try
     aList := TStringList.Create;
     Elem_TourQry.DB.First;

     while not Elem_TourQry.DB.Eof do
     begin
       aList.Clear;
       CurrPath := Path + Elem_TourQry.GetValueIdStr+'\';
       FindFile ( CurrPath , aList, '*.jpg',1  );
       IdxPic := 1;
       //try
       //if Elem_TourQry.GetValueId = 107 then ShowMessage('ffff');

       for i:=0 to aList.Count-1 do
       begin
         try
           if FileGraphicCheckOnSize( CurrPath + aList[i],150,-1 ) then
           begin
             CurrPathTo :=PathTo+Elem_TourQry.GetValueIdStr+'\';
             ExistsDir( CurrPathTo );

             MyCopyFile( CurrPath+aList[i] , CurrPathTo + 'Img_'+IntToStr(IdxPic) + ExtractFileExt( aList[i] ) );
             Inc(IdxPic);
           end;
         except
         end;
       end;
       {except
         ShowMessage('Error '+Elem_TourQry.GetValueIdStr);
       end; }

       Elem_TourQry.DB.Next;
     end;
   finally
     aList.Free;
   end;
end;

function FMakeStructSectionCounries( Dataset: TDataset; Parent:TWinControl ):TcxDBTreeList;
var i:Integer;
    DS   : TDatasource;
    aCol : TcxDBTreeListColumn;
begin
  DS := TDatasource.Create(nil);
  DS.DataSet := Dataset;
  result := TcxDBTreeList.Create(nil);
  //result.parent := Parent;
  result.DataController.DataSource := DS;
  result.DataController.KeyField :='ID';
  result.DataController.ParentField :='PARENT';
  for i:=0 to Dataset.FieldCount-1 do
  begin
    aCol := TcxDBTreeListColumn( result.CreateColumn( nil ) );
    aCol.DataBinding.FieldName := Dataset.Fields[i].FieldName;
  end;
  result.GetColumnByFieldName('AORDER').SortOrder:=soAscending;
end;
//******************************************************************************
function SqtSqlCountrySection( idLng:String ):string;
begin
  result :=
  'select COUNTRY_SECT_DESCRIPTS.id,COUNTRY_SECT_DESCRIPTS.parent, COUNTRY_SECT_DESCRIPTS.AOrder, '+
  ' case '+
  '  WHEN (COUNTRY_SECT_DESCRIPTS.dictsectionid is not null) THEN (select first 1 DICTSECTIONS_lng.sectionname from DICTSECTIONS_lng where DICTSECTIONS_lng.id_dictsections = COUNTRY_SECT_DESCRIPTS.dictsectionid and DICTSECTIONS_lng.id_lng = '+idLng+' ) '+
  '  WHEN (COUNTRY_SECT_DESCRIPTS.itemid is not null) THEN (select  first 1 DICTSECTION_ITEMS_LNG.itemname from DICTSECTION_ITEMS_LNG  where DICTSECTION_ITEMS_LNG.id_dictsection_items = COUNTRY_SECT_DESCRIPTS.itemid and DICTSECTION_ITEMS_LNG.id_lng = '+idLng+' ) '+
  '  WHEN (COUNTRY_SECT_DESCRIPTS.name is not null) THEN (  select first 1  country_sect_desc_LNG.name from country_sect_desc_LNG where country_sect_desc_LNG.id_country_sect_descripts = COUNTRY_SECT_DESCRIPTS.id and  country_sect_desc_LNG.id_lng = '+idLng+' ) '+
  ' ELSE '''' ' +
  ' END NAME_ITEM from COUNTRY_SECT_DESCRIPTS order by AORDER ';
end;

procedure FMakeJsonSectionNode(aNode:TcxTreeListNode; var JsObjParent: TlkJSONobject );
var IndId:Integer;
    IndParent :Integer;
    IndName:Integer;
    CurrJsObj:TlkJSONobject;
begin
  IndId := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName('ID').ItemIndex;
  IndParent := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName('PARENT').ItemIndex;
  IndName := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName('NAME_ITEM').ItemIndex;

  while aNode <> nil do
  begin
    CurrJsObj:= TlkJSONobject.Create;
    CurrJsObj.Add( 'ID', aNode.Texts[IndId] );
    CurrJsObj.Add( 'PARENT', aNode.Texts[IndParent] );
    CurrJsObj.Add( 'NAME', aNode.Texts[IndName] );
    JsObjParent.Add( 'NODES', CurrJsObj );
    if aNode.HasChildren then
      FMakeJsonSectionNode(aNode.getFirstChild,CurrJsObj);

    aNode:=aNode.getNextSibling;
  end;
end;

function FMakeJsonSectionCounries(aTree:TcxDBTreeList):String;
var i:Integer;
    ObjectAll : TlkJSONobject;
    aNode:TcxTreeListNode;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    aNode := aTree.TopNode;
    FMakeJsonSectionNode(aNode, ObjectAll );

    i:=0;
    result :=  Utf8Decode(GenerateReadableText( ObjectAll, i )) ;
  finally
    ObjectAll.Free;
  end;
end;
procedure TFrmTestSynchronizeWebSoap.Button23Click(Sender: TObject);
var DB:TDataSet;
    ConP:TConnectDBParam;
    aTree:TcxDBTreeList;
    str:string;
begin
  {ConP := Elem_MERGESOAPWEB.DBGetParamConnect;
  DB := UnitIBQuery.CreateDataSet( ConP.PathDB, ConP.UID, ConP.Password, SqtSqlCountrySection('448') );
  aTree := FMakeStructSectionCounries( DB, Panel1 );
  str := FMakeJsonSectionCounries(aTree);
  aTree.Free;
  Memo1.Text := str;    }


 // UnitIBQuery.DestroyDS(TIBQuery(DB));
end;

procedure TFrmTestSynchronizeWebSoap.Button24Click(Sender: TObject);
begin
  Elem_Cities_PhoneCode.DBOpen;
  Elem_City_Adm_Unit_Info_PoneCode.DBOpen;
  While not Elem_Cities_PhoneCode.DB.Eof do
  begin

    if not Elem_City_Adm_Unit_Info_PoneCode.DB.Locate('ID_CITY_ADM_UNIT', Elem_Cities_PhoneCode.GetValueId,[] ) then
      Elem_City_Adm_Unit_Info_PoneCode.DB.Insert
    else Elem_City_Adm_Unit_Info_PoneCode.DB.Edit;

    Elem_City_Adm_Unit_Info_PoneCode.DB.FieldByName('ID_CITY_ADM_UNIT_TYPE_INFO').AsInteger:= 2;
    Elem_City_Adm_Unit_Info_PoneCode.DB.FieldByName('ID_CITY_ADM_UNIT').AsInteger:= Elem_Cities_PhoneCode.GetValueId;
    Elem_City_Adm_Unit_Info_PoneCode.DB.FieldByName('AVALUE').asString :=Elem_Cities_PhoneCode.DB.fieldByName('PHONECODE').AsString;

    Elem_Cities_PhoneCode.DB.Next;

  end;
end;

end.

const
  defWSDL = 'http://sc008.studio-creative.com.ua/exchangeservice.wsdl.php';
  defURL  = 'http://sc008.studio-creative.com.ua/exchangeservice.php';
  defSvc  = 'ExchangeService';
  defPrt  = 'ExchangeServicePort';



{function CheckSmartNodeForChildChecked( aNode:TcxTreeListNode; FieldCheck:String ):Integer;
var IndColCheck:Integer;
    Count:Integer;
    CountCheck:Integer;
    UntilLevel:Integer;
    SaveNode:TcxTreeListNode;
    k:integer;
begin
  result:=0;
  Count:=0;
  CountCheck:=0;
  if aNode = nil then exit;
  SaveNode := aNode;

  IndColCheck := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName( FieldCheck ).ItemIndex;
  UntilLevel := aNode.Level;

  while aNode<>nil do
  begin
    if ((aNode.HasChildren) and(aNode <> SaveNode)) or
       (( not aNode.HasChildren )) then
    begin
      inc(Count);
      if (aNode.Values[ IndColCheck ] = 1) then inc(CountCheck);
    end;
    //*********************
    aNode:=aNode.GetNext;
    if ( aNode <> nil ) and ( aNode.Level <= UntilLevel ) then break;
  end;

  if CountCheck = 0 then result:=0;
  if (CountCheck <> 0) and (CountCheck = Count ) then result:=1;
  if (CountCheck <> 0) and (CountCheck <> Count ) then result:=2;

end;  }

{procedure TFrmTestSynchronizeWebSoap.aTreeCustomDrawDataCell(
  Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
var resChild:Integer;
    IconImage:Integer;
begin
  if AViewInfo.Column =  TcxDBTreeList(Sender).GetColumnByFieldName('ACHECK') then
  begin
     resChild:= CheckSmartNodeForChildChecked( AViewInfo.Node, 'ACHECK' );
     if resChild <> 0 then
     begin
       if resChild = 1 then IconImage:=1;
       if resChild = 2 then IconImage:=2;
     end
      else IconImage :=0;

     ShowTextImageInCellTree(Sender, ACanvas, AViewInfo, ImageChecked,13, IconImage, OptImgPosCenter );
     ADone :=True;
  end;
end;  }
