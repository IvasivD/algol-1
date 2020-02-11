unit UnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBDatabase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  cxGridLevel, cxGrid, ExtCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxTimeEdit, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, cxTextEdit,
  IBTable, StdCtrls , UnitDetailTours, cxMaskEdit, cxPCdxBarPopupMenu, cxPC,
  cxImageComboBox, ComCtrls, ImgList, cxGridBandedTableView, cxGridCardView,
  Menus;

type
  TForm1 = class(TForm)
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    DS_SHEDULEITEMS: TDataSource;
    SHEDULEITEMS: TIBQuery;
    DS_TOURS: TDataSource;
    TOURS: TIBQuery;
    DS_SHEDULES: TDataSource;
    SHEDULES: TIBQuery;
    SHEDULESROUTEID: TIntegerField;
    SHEDULESSHEDULEID: TIntegerField;
    SHEDULESSHEDULENO: TSmallintField;
    SHEDULESFTIMELINKTO: TSmallintField;
    SHEDULESBTIMELINKTO: TSmallintField;
    SHEDULESDEPARTFTIME: TDateTimeField;
    SHEDULESARRIVEFTIME: TDateTimeField;
    SHEDULESDEPARTBTIME: TDateTimeField;
    SHEDULESARRIVEBTIME: TDateTimeField;
    SHEDULESFORWARDTIME: TFloatField;
    SHEDULESBACKWARDTIME: TFloatField;
    SHEDULESISDISTANCED: TIBStringField;
    SHEDULESISTIMED: TIBStringField;
    SHEDULESSHEDULENAME: TIBStringField;
    SHEDULESADDMANID: TIntegerField;
    SHEDULESBIDIRECTIONAL: TIBStringField;
    SHEDULESTRANSIT: TMemoField;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewRouters: TcxGridDBTableView;
    Panel1: TPanel;
    GridTour: TcxGrid;
    GridTourDBTableView1: TcxGridDBTableView;
    GridTourLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    VieSchedule: TcxGridDBTableView;
    VieScheduleROUTEID: TcxGridDBColumn;
    VieScheduleSHEDULEID: TcxGridDBColumn;
    VieScheduleSHEDULENO: TcxGridDBColumn;
    VieScheduleFTIMELINKTO: TcxGridDBColumn;
    VieScheduleBTIMELINKTO: TcxGridDBColumn;
    VieScheduleDEPARTFTIME: TcxGridDBColumn;
    VieScheduleARRIVEFTIME: TcxGridDBColumn;
    VieScheduleDEPARTBTIME: TcxGridDBColumn;
    VieScheduleARRIVEBTIME: TcxGridDBColumn;
    VieScheduleFORWARDTIME: TcxGridDBColumn;
    VieScheduleBACKWARDTIME: TcxGridDBColumn;
    VieScheduleISDISTANCED: TcxGridDBColumn;
    VieScheduleISTIMED: TcxGridDBColumn;
    VieScheduleSHEDULENAME: TcxGridDBColumn;
    VieScheduleADDMANID: TcxGridDBColumn;
    VieScheduleBIDIRECTIONAL: TcxGridDBColumn;
    VieScheduleTRANSIT: TcxGridDBColumn;
    Panel2: TPanel;
    ViewSchedItem: TcxGridDBTableView;
    ViewSchedItemCOUNTRYNAME: TcxGridDBColumn;
    ViewSchedItemCITYNAME: TcxGridDBColumn;
    ViewSchedItemDISTANCE: TcxGridDBColumn;
    ViewSchedItemSTOPID: TcxGridDBColumn;
    ViewSchedItemSHEDITEMID: TcxGridDBColumn;
    ViewSchedItemSTOPORDER: TcxGridDBColumn;
    ViewSchedItemARRIVETIME: TcxGridDBColumn;
    ViewSchedItemDEPARTTIME: TcxGridDBColumn;
    ViewSchedItemARRIVEDAY: TcxGridDBColumn;
    ViewSchedItemDEPARTDAY: TcxGridDBColumn;
    ViewSchedItemEXTRADISTANCE: TcxGridDBColumn;
    Panel3: TPanel;
    DS_SCHEDITEM_TOURS: TDataSource;
    ViewSchedTours: TcxGridDBTableView;
    ViewSchedToursSCHEDITEMTOURID: TcxGridDBColumn;
    ViewSchedToursSTOPORDER: TcxGridDBColumn;
    ViewSchedToursSTOPID: TcxGridDBColumn;
    ViewSchedToursARRIVETIME: TcxGridDBColumn;
    ViewSchedToursDEPARTTIME: TcxGridDBColumn;
    ViewSchedToursPERMENTER: TcxGridDBColumn;
    ViewSchedToursPERMEXIT: TcxGridDBColumn;
    ViewSchedToursSHOWITEM: TcxGridDBColumn;
    ViewSchedToursARRIVEABOUT: TcxGridDBColumn;
    ViewSchedToursDEPARTABOUT: TcxGridDBColumn;
    TOURSTOURNAME: TIBStringField;
    TOURSDAYCOUNT: TSmallintField;
    TOURSROUTEID: TIntegerField;
    ViewRoutersTOURNAME: TcxGridDBColumn;
    ViewRoutersDAYCOUNT: TcxGridDBColumn;
    ViewRoutersROUTEID: TcxGridDBColumn;
    TOURSID: TIntegerField;
    ViewRoutersID: TcxGridDBColumn;
    SCHEDITEM_TOURS: TIBTable;
    SCHEDITEM_TOURSSCHEDITEMTOURID: TIntegerField;
    SCHEDITEM_TOURSPARENT: TIntegerField;
    SCHEDITEM_TOURSDESCRIPTION: TIBStringField;
    SCHEDITEM_TOURSSTOPORDER: TIntegerField;
    SCHEDITEM_TOURSSTOPID: TIntegerField;
    Button1: TButton;
    SCHEDITEM_TOURSCalcDescription: TStringField;
    ViewTourTemplate: TcxGridDBTableView;
    TOURTEMPLATES: TIBQuery;
    DS_TOURTEMPLATES: TDataSource;
    TOURTEMPLATESTOURID: TIntegerField;
    TOURTEMPLATESTOURGROUPID: TIntegerField;
    TOURTEMPLATESTOURTEMPLATEID: TIntegerField;
    TOURTEMPLATESTEMPLATENAME: TIBStringField;
    TOURTEMPLATESVENDORID: TIntegerField;
    TOURTEMPLATESGROUPMIN: TSmallintField;
    TOURTEMPLATESGROUPMAX: TSmallintField;
    TOURTEMPLATESMEMO: TMemoField;
    TOURTEMPLATESDISABLED: TIBStringField;
    TOURTEMPLATESPARENTID: TIntegerField;
    TOURTEMPLATESORDERMEMO: TMemoField;
    TOURTEMPLATESTOURTIME: TDateTimeField;
    TOURTEMPLATESDAYCOUNT: TSmallintField;
    TOURTEMPLATESSHOWWEB: TIBStringField;
    TOURTEMPLATESTOURVARIANTID: TIntegerField;
    TOURTEMPLATESBONUSCHECKTRIP: TIBStringField;
    TOURTEMPLATESBONUSCHECKHOTEL: TIBStringField;
    TOURTEMPLATESBONUSCHECKINSURE: TIBStringField;
    TOURTEMPLATESBONUSCHECKVISA: TIBStringField;
    TOURTEMPLATESBONUSCHECKEXCURS: TIBStringField;
    TOURTEMPLATESBONUSCHECKOTHER: TIBStringField;
    ViewTourTemplateTOURID: TcxGridDBColumn;
    ViewTourTemplateTOURGROUPID: TcxGridDBColumn;
    ViewTourTemplateTOURTEMPLATEID: TcxGridDBColumn;
    ViewTourTemplateTEMPLATENAME: TcxGridDBColumn;
    ViewTourTemplateVENDORID: TcxGridDBColumn;
    ViewTourTemplateGROUPMIN: TcxGridDBColumn;
    ViewTourTemplateGROUPMAX: TcxGridDBColumn;
    ViewTourTemplateMEMO: TcxGridDBColumn;
    ViewTourTemplateDISABLED: TcxGridDBColumn;
    ViewTourTemplatePARENTID: TcxGridDBColumn;
    ViewTourTemplateORDERMEMO: TcxGridDBColumn;
    ViewTourTemplateTOURTIME: TcxGridDBColumn;
    ViewTourTemplateDAYCOUNT: TcxGridDBColumn;
    ViewTourTemplateSHOWWEB: TcxGridDBColumn;
    ViewTourTemplateTOURVARIANTID: TcxGridDBColumn;
    ViewTourTemplateBONUSCHECKTRIP: TcxGridDBColumn;
    ViewTourTemplateBONUSCHECKHOTEL: TcxGridDBColumn;
    ViewTourTemplateBONUSCHECKINSURE: TcxGridDBColumn;
    ViewTourTemplateBONUSCHECKVISA: TcxGridDBColumn;
    ViewTourTemplateBONUSCHECKEXCURS: TcxGridDBColumn;
    ViewTourTemplateBONUSCHECKOTHER: TcxGridDBColumn;
    cxGrid5: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    DS_TOURTRIPS: TDataSource;
    TOURTRIPS: TIBQuery;
    TOURTRIPSTOURTEMPLATEID: TIntegerField;
    TOURTRIPSTOURTRIPID: TIntegerField;
    TOURTRIPSROUTEID: TIntegerField;
    TOURTRIPSSHEDULEID: TIntegerField;
    TOURTRIPSTRIPID: TIntegerField;
    TOURTRIPSTRIPBACKID: TIntegerField;
    TOURTRIPSVENDORID: TIntegerField;
    TOURTRIPSGROUPMIN: TSmallintField;
    TOURTRIPSGROUPMAX: TSmallintField;
    TOURTRIPSRATECURRID: TIntegerField;
    TOURTRIPSMEMO: TMemoField;
    TOURTRIPSRATE: TFloatField;
    TOURTRIPSRATE2: TFloatField;
    TOURTRIPSAGENTPAY: TFloatField;
    TOURTRIPSAGENTPAY2: TFloatField;
    TOURTRIPSAGENTWHO: TSmallintField;
    TOURTRIPSAGENTWHO2: TSmallintField;
    TOURTRIPSFORPAY: TFloatField;
    TOURTRIPSFORPAY2: TFloatField;
    TOURTRIPSVATPERC: TFloatField;
    TOURTRIPSVAT: TFloatField;
    TOURTRIPSVATPERC2: TFloatField;
    TOURTRIPSVAT2: TFloatField;
    TOURTRIPSDISABLED: TIBStringField;
    TOURTRIPSOPTIONAL: TIBStringField;
    TOURTRIPSNETPERGROUP: TFloatField;
    TOURTRIPSNETPERGROUP2: TFloatField;
    TOURTRIPSNETVAL: TFloatField;
    TOURTRIPSNETVAL2: TFloatField;
    TOURTRIPSAGENTPERC: TFloatField;
    TOURTRIPSAGENTPERC2: TFloatField;
    TOURTRIPSBEGINDAY: TIntegerField;
    TOURTRIPSGROUPCURRID: TIntegerField;
    TOURTRIPSGRATISPERSONCOUNT: TIntegerField;
    TOURTRIPSGRATISBYVENDOR: TIBStringField;
    TOURTRIPSHIDDEN: TIBStringField;
    TOURTRIPSNETCHECK: TIBStringField;
    TOURTRIPSV1_RATE: TFloatField;
    TOURTRIPSV1_AGENTPAY: TFloatField;
    TOURTRIPSV1_PAY: TFloatField;
    TOURTRIPSV1_VATPERC: TFloatField;
    TOURTRIPSV1_VAT: TFloatField;
    TOURTRIPSV1_AGENTPERC: TFloatField;
    TOURTRIPSV1_NETVAL: TFloatField;
    TOURTRIPSV1_PAID: TFloatField;
    TOURTRIPSV2_RATE: TFloatField;
    TOURTRIPSV2_AGENTPAY: TFloatField;
    TOURTRIPSV2_PAY: TFloatField;
    TOURTRIPSV2_VATPERC: TFloatField;
    TOURTRIPSV2_VAT: TFloatField;
    TOURTRIPSV2_AGENTPERC: TFloatField;
    TOURTRIPSV2_NETVAL: TFloatField;
    TOURTRIPSV2_PAID: TFloatField;
    TOURTRIPSV1_RATE2: TFloatField;
    TOURTRIPSV1_AGENTPAY2: TFloatField;
    TOURTRIPSV1_PAY2: TFloatField;
    TOURTRIPSV1_VATPERC2: TFloatField;
    TOURTRIPSV1_VAT2: TFloatField;
    TOURTRIPSV1_AGENTPERC2: TFloatField;
    TOURTRIPSV1_NETVAL2: TFloatField;
    TOURTRIPSV1_PAID2: TFloatField;
    TOURTRIPSV2_RATE2: TFloatField;
    TOURTRIPSV2_AGENTPAY2: TFloatField;
    TOURTRIPSV2_PAY2: TFloatField;
    TOURTRIPSV2_VATPERC2: TFloatField;
    TOURTRIPSV2_VAT2: TFloatField;
    TOURTRIPSV2_AGENTPERC2: TFloatField;
    TOURTRIPSV2_NETVAL2: TFloatField;
    TOURTRIPSV2_PAID2: TFloatField;
    TOURTRIPSRETURNDAY: TIntegerField;
    TOURTRIPSSTARTPOINT: TIntegerField;
    TOURTRIPSSTOPPOINT: TIntegerField;
    TOURTRIPSDIRECTION: TSmallintField;
    TOURTRIPSPERIODTYPE: TSmallintField;
    cxPageControl1: TcxPageControl;
    TabStops: TcxTabSheet;
    TabHotels: TcxTabSheet;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid4DBTableView1: TcxGridDBTableView;
    cxGrid4Level1: TcxGridLevel;
    cxGrid4: TcxGrid;
    DS_TOURROOMS: TDataSource;
    TOURROOMS: TIBQuery;
    TOURROOMSTOURTEMPLATEID: TIntegerField;
    TOURROOMSTOURROOMID: TIntegerField;
    TOURROOMSCOUNTRYID: TIntegerField;
    TOURROOMSCITYID: TIntegerField;
    TOURROOMSHOTELID: TIntegerField;
    TOURROOMSFROMDATE: TDateTimeField;
    TOURROOMSDAYCOUNT: TIntegerField;
    TOURROOMSVENDORID: TIntegerField;
    TOURROOMSGROUPMIN: TSmallintField;
    TOURROOMSGROUPMAX: TSmallintField;
    TOURROOMSRATECURRID: TIntegerField;
    TOURROOMSMEMO: TMemoField;
    TOURROOMSRATE: TFloatField;
    TOURROOMSRATE2: TFloatField;
    TOURROOMSAGENTPAY: TFloatField;
    TOURROOMSAGENTPAY2: TFloatField;
    TOURROOMSAGENTWHO: TSmallintField;
    TOURROOMSAGENTWHO2: TSmallintField;
    TOURROOMSFORPAY: TFloatField;
    TOURROOMSFORPAY2: TFloatField;
    TOURROOMSVATPERC: TFloatField;
    TOURROOMSVAT: TFloatField;
    TOURROOMSVATPERC2: TFloatField;
    TOURROOMSVAT2: TFloatField;
    TOURROOMSDISABLED: TIBStringField;
    TOURROOMSOPTIONAL: TIBStringField;
    TOURROOMSNETPERGROUP: TFloatField;
    TOURROOMSNETPERGROUP2: TFloatField;
    TOURROOMSNETVAL: TFloatField;
    TOURROOMSNETVAL2: TFloatField;
    TOURROOMSAGENTPERC: TFloatField;
    TOURROOMSAGENTPERC2: TFloatField;
    TOURROOMSBEGINDAY: TIntegerField;
    TOURROOMSGROUPCURRID: TIntegerField;
    TOURROOMSGRATISPERSONCOUNT: TIntegerField;
    TOURROOMSGRATISBYVENDOR: TIBStringField;
    TOURROOMSHIDDEN: TIBStringField;
    TOURROOMSNETCHECK: TIBStringField;
    TOURROOMSV1_RATE: TFloatField;
    TOURROOMSV1_AGENTPAY: TFloatField;
    TOURROOMSV1_PAY: TFloatField;
    TOURROOMSV1_VATPERC: TFloatField;
    TOURROOMSV1_VAT: TFloatField;
    TOURROOMSV1_AGENTPERC: TFloatField;
    TOURROOMSV1_NETVAL: TFloatField;
    TOURROOMSV1_PAID: TFloatField;
    TOURROOMSV2_RATE: TFloatField;
    TOURROOMSV2_AGENTPAY: TFloatField;
    TOURROOMSV2_PAY: TFloatField;
    TOURROOMSV2_VATPERC: TFloatField;
    TOURROOMSV2_VAT: TFloatField;
    TOURROOMSV2_AGENTPERC: TFloatField;
    TOURROOMSV2_NETVAL: TFloatField;
    TOURROOMSV2_PAID: TFloatField;
    TOURROOMSV1_RATE2: TFloatField;
    TOURROOMSV1_AGENTPAY2: TFloatField;
    TOURROOMSV1_PAY2: TFloatField;
    TOURROOMSV1_VATPERC2: TFloatField;
    TOURROOMSV1_VAT2: TFloatField;
    TOURROOMSV1_AGENTPERC2: TFloatField;
    TOURROOMSV1_NETVAL2: TFloatField;
    TOURROOMSV1_PAID2: TFloatField;
    TOURROOMSV2_RATE2: TFloatField;
    TOURROOMSV2_AGENTPAY2: TFloatField;
    TOURROOMSV2_PAY2: TFloatField;
    TOURROOMSV2_VATPERC2: TFloatField;
    TOURROOMSV2_VAT2: TFloatField;
    TOURROOMSV2_AGENTPERC2: TFloatField;
    TOURROOMSV2_NETVAL2: TFloatField;
    TOURROOMSV2_PAID2: TFloatField;
    TOURROOMSFEEDID: TIntegerField;
    TOURROOMSPERIODTYPE: TSmallintField;
    ViewTOURROOMS: TcxGridDBTableView;
    ViewTOURROOMSTOURTEMPLATEID: TcxGridDBColumn;
    ViewTOURROOMSTOURROOMID: TcxGridDBColumn;
    ViewTOURROOMSCOUNTRYID: TcxGridDBColumn;
    ViewTOURROOMSCITYID: TcxGridDBColumn;
    ViewTOURROOMSHOTELID: TcxGridDBColumn;
    ViewTOURROOMSFROMDATE: TcxGridDBColumn;
    ViewTOURROOMSDAYCOUNT: TcxGridDBColumn;
    ViewTOURROOMSVENDORID: TcxGridDBColumn;
    ViewTOURROOMSGROUPMIN: TcxGridDBColumn;
    ViewTOURROOMSGROUPMAX: TcxGridDBColumn;
    ViewTOURROOMSRATECURRID: TcxGridDBColumn;
    ViewTOURROOMSMEMO: TcxGridDBColumn;
    ViewTOURROOMSRATE: TcxGridDBColumn;
    ViewTOURROOMSRATE2: TcxGridDBColumn;
    ViewTOURROOMSAGENTPAY: TcxGridDBColumn;
    ViewTOURROOMSAGENTPAY2: TcxGridDBColumn;
    ViewTOURROOMSAGENTWHO: TcxGridDBColumn;
    ViewTOURROOMSAGENTWHO2: TcxGridDBColumn;
    ViewTOURROOMSFORPAY: TcxGridDBColumn;
    ViewTOURROOMSFORPAY2: TcxGridDBColumn;
    ViewTOURROOMSVATPERC: TcxGridDBColumn;
    ViewTOURROOMSVAT: TcxGridDBColumn;
    ViewTOURROOMSVATPERC2: TcxGridDBColumn;
    ViewTOURROOMSVAT2: TcxGridDBColumn;
    ViewTOURROOMSDISABLED: TcxGridDBColumn;
    ViewTOURROOMSOPTIONAL: TcxGridDBColumn;
    ViewTOURROOMSNETPERGROUP: TcxGridDBColumn;
    ViewTOURROOMSNETPERGROUP2: TcxGridDBColumn;
    ViewTOURROOMSNETVAL: TcxGridDBColumn;
    ViewTOURROOMSNETVAL2: TcxGridDBColumn;
    ViewTOURROOMSAGENTPERC: TcxGridDBColumn;
    ViewTOURROOMSAGENTPERC2: TcxGridDBColumn;
    ViewTOURROOMSBEGINDAY: TcxGridDBColumn;
    ViewTOURROOMSGROUPCURRID: TcxGridDBColumn;
    ViewTOURROOMSGRATISPERSONCOUNT: TcxGridDBColumn;
    ViewTOURROOMSGRATISBYVENDOR: TcxGridDBColumn;
    ViewTOURROOMSHIDDEN: TcxGridDBColumn;
    ViewTOURROOMSNETCHECK: TcxGridDBColumn;
    ViewTOURROOMSV1_RATE: TcxGridDBColumn;
    ViewTOURROOMSV1_AGENTPAY: TcxGridDBColumn;
    ViewTOURROOMSV1_PAY: TcxGridDBColumn;
    ViewTOURROOMSV1_VATPERC: TcxGridDBColumn;
    ViewTOURROOMSV1_VAT: TcxGridDBColumn;
    ViewTOURROOMSV1_AGENTPERC: TcxGridDBColumn;
    ViewTOURROOMSV1_NETVAL: TcxGridDBColumn;
    ViewTOURROOMSV1_PAID: TcxGridDBColumn;
    ViewTOURROOMSV2_RATE: TcxGridDBColumn;
    ViewTOURROOMSV2_AGENTPAY: TcxGridDBColumn;
    ViewTOURROOMSV2_PAY: TcxGridDBColumn;
    ViewTOURROOMSV2_VATPERC: TcxGridDBColumn;
    ViewTOURROOMSV2_VAT: TcxGridDBColumn;
    ViewTOURROOMSV2_AGENTPERC: TcxGridDBColumn;
    ViewTOURROOMSV2_NETVAL: TcxGridDBColumn;
    ViewTOURROOMSV2_PAID: TcxGridDBColumn;
    ViewTOURROOMSV1_RATE2: TcxGridDBColumn;
    ViewTOURROOMSV1_AGENTPAY2: TcxGridDBColumn;
    ViewTOURROOMSV1_PAY2: TcxGridDBColumn;
    ViewTOURROOMSV1_VATPERC2: TcxGridDBColumn;
    ViewTOURROOMSV1_VAT2: TcxGridDBColumn;
    ViewTOURROOMSV1_AGENTPERC2: TcxGridDBColumn;
    ViewTOURROOMSV1_NETVAL2: TcxGridDBColumn;
    ViewTOURROOMSV1_PAID2: TcxGridDBColumn;
    ViewTOURROOMSV2_RATE2: TcxGridDBColumn;
    ViewTOURROOMSV2_AGENTPAY2: TcxGridDBColumn;
    ViewTOURROOMSV2_PAY2: TcxGridDBColumn;
    ViewTOURROOMSV2_VATPERC2: TcxGridDBColumn;
    ViewTOURROOMSV2_VAT2: TcxGridDBColumn;
    ViewTOURROOMSV2_AGENTPERC2: TcxGridDBColumn;
    ViewTOURROOMSV2_NETVAL2: TcxGridDBColumn;
    ViewTOURROOMSV2_PAID2: TcxGridDBColumn;
    ViewTOURROOMSFEEDID: TcxGridDBColumn;
    ViewTOURROOMSPERIODTYPE: TcxGridDBColumn;
    DS_TOUREXCURS: TDataSource;
    TOUREXCURS: TIBQuery;
    ViewTOUREXCURS: TcxGridDBTableView;
    TOUREXCURSTOURTEMPLATEID: TIntegerField;
    TOUREXCURSTOUREXCURID: TIntegerField;
    TOUREXCURSCOUNTRYID: TIntegerField;
    TOUREXCURSCITYID: TIntegerField;
    TOUREXCURSEXCURSID: TIntegerField;
    TOUREXCURSATDATE: TDateTimeField;
    TOUREXCURSVENDORID: TIntegerField;
    TOUREXCURSGROUPMIN: TSmallintField;
    TOUREXCURSGROUPMAX: TSmallintField;
    TOUREXCURSRATECURRID: TIntegerField;
    TOUREXCURSMEMO: TMemoField;
    TOUREXCURSRATE: TFloatField;
    TOUREXCURSRATE2: TFloatField;
    TOUREXCURSAGENTPAY: TFloatField;
    TOUREXCURSAGENTPAY2: TFloatField;
    TOUREXCURSAGENTWHO: TSmallintField;
    TOUREXCURSAGENTWHO2: TSmallintField;
    TOUREXCURSFORPAY: TFloatField;
    TOUREXCURSFORPAY2: TFloatField;
    TOUREXCURSVATPERC: TFloatField;
    TOUREXCURSVAT: TFloatField;
    TOUREXCURSVATPERC2: TFloatField;
    TOUREXCURSVAT2: TFloatField;
    TOUREXCURSDISABLED: TIBStringField;
    TOUREXCURSOPTIONAL: TIBStringField;
    TOUREXCURSNETPERGROUP: TFloatField;
    TOUREXCURSNETPERGROUP2: TFloatField;
    TOUREXCURSNETVAL: TFloatField;
    TOUREXCURSNETVAL2: TFloatField;
    TOUREXCURSAGENTPERC: TFloatField;
    TOUREXCURSAGENTPERC2: TFloatField;
    TOUREXCURSBEGINDAY: TIntegerField;
    TOUREXCURSEXTIME: TFloatField;
    TOUREXCURSGROUPCURRID: TIntegerField;
    TOUREXCURSGRATISPERSONCOUNT: TIntegerField;
    TOUREXCURSGRATISBYVENDOR: TIBStringField;
    TOUREXCURSHIDDEN: TIBStringField;
    TOUREXCURSNETCHECK: TIBStringField;
    TOUREXCURSV1_RATE: TFloatField;
    TOUREXCURSV1_AGENTPAY: TFloatField;
    TOUREXCURSV1_PAY: TFloatField;
    TOUREXCURSV1_VATPERC: TFloatField;
    TOUREXCURSV1_VAT: TFloatField;
    TOUREXCURSV1_AGENTPERC: TFloatField;
    TOUREXCURSV1_NETVAL: TFloatField;
    TOUREXCURSV1_PAID: TFloatField;
    TOUREXCURSV2_RATE: TFloatField;
    TOUREXCURSV2_AGENTPAY: TFloatField;
    TOUREXCURSV2_PAY: TFloatField;
    TOUREXCURSV2_VATPERC: TFloatField;
    TOUREXCURSV2_VAT: TFloatField;
    TOUREXCURSV2_AGENTPERC: TFloatField;
    TOUREXCURSV2_NETVAL: TFloatField;
    TOUREXCURSV2_PAID: TFloatField;
    TOUREXCURSV1_RATE2: TFloatField;
    TOUREXCURSV1_AGENTPAY2: TFloatField;
    TOUREXCURSV1_PAY2: TFloatField;
    TOUREXCURSV1_VATPERC2: TFloatField;
    TOUREXCURSV1_VAT2: TFloatField;
    TOUREXCURSV1_AGENTPERC2: TFloatField;
    TOUREXCURSV1_NETVAL2: TFloatField;
    TOUREXCURSV1_PAID2: TFloatField;
    TOUREXCURSV2_RATE2: TFloatField;
    TOUREXCURSV2_AGENTPAY2: TFloatField;
    TOUREXCURSV2_PAY2: TFloatField;
    TOUREXCURSV2_VATPERC2: TFloatField;
    TOUREXCURSV2_VAT2: TFloatField;
    TOUREXCURSV2_AGENTPERC2: TFloatField;
    TOUREXCURSV2_NETVAL2: TFloatField;
    TOUREXCURSV2_PAID2: TFloatField;
    TOUREXCURSPERIODTYPE: TSmallintField;
    ViewTOUREXCURSTOURTEMPLATEID: TcxGridDBColumn;
    ViewTOUREXCURSTOUREXCURID: TcxGridDBColumn;
    ViewTOUREXCURSCOUNTRYID: TcxGridDBColumn;
    ViewTOUREXCURSCITYID: TcxGridDBColumn;
    ViewTOUREXCURSEXCURSID: TcxGridDBColumn;
    ViewTOUREXCURSATDATE: TcxGridDBColumn;
    ViewTOUREXCURSVENDORID: TcxGridDBColumn;
    ViewTOUREXCURSGROUPMIN: TcxGridDBColumn;
    ViewTOUREXCURSGROUPMAX: TcxGridDBColumn;
    ViewTOUREXCURSRATECURRID: TcxGridDBColumn;
    ViewTOUREXCURSMEMO: TcxGridDBColumn;
    ViewTOUREXCURSRATE: TcxGridDBColumn;
    ViewTOUREXCURSRATE2: TcxGridDBColumn;
    ViewTOUREXCURSAGENTPAY: TcxGridDBColumn;
    ViewTOUREXCURSAGENTPAY2: TcxGridDBColumn;
    ViewTOUREXCURSAGENTWHO: TcxGridDBColumn;
    ViewTOUREXCURSAGENTWHO2: TcxGridDBColumn;
    ViewTOUREXCURSFORPAY: TcxGridDBColumn;
    ViewTOUREXCURSFORPAY2: TcxGridDBColumn;
    ViewTOUREXCURSVATPERC: TcxGridDBColumn;
    ViewTOUREXCURSVAT: TcxGridDBColumn;
    ViewTOUREXCURSVATPERC2: TcxGridDBColumn;
    ViewTOUREXCURSVAT2: TcxGridDBColumn;
    ViewTOUREXCURSDISABLED: TcxGridDBColumn;
    ViewTOUREXCURSOPTIONAL: TcxGridDBColumn;
    ViewTOUREXCURSNETPERGROUP: TcxGridDBColumn;
    ViewTOUREXCURSNETPERGROUP2: TcxGridDBColumn;
    ViewTOUREXCURSNETVAL: TcxGridDBColumn;
    ViewTOUREXCURSNETVAL2: TcxGridDBColumn;
    ViewTOUREXCURSAGENTPERC: TcxGridDBColumn;
    ViewTOUREXCURSAGENTPERC2: TcxGridDBColumn;
    ViewTOUREXCURSBEGINDAY: TcxGridDBColumn;
    ViewTOUREXCURSEXTIME: TcxGridDBColumn;
    ViewTOUREXCURSGROUPCURRID: TcxGridDBColumn;
    ViewTOUREXCURSGRATISPERSONCOUNT: TcxGridDBColumn;
    ViewTOUREXCURSGRATISBYVENDOR: TcxGridDBColumn;
    ViewTOUREXCURSHIDDEN: TcxGridDBColumn;
    ViewTOUREXCURSNETCHECK: TcxGridDBColumn;
    ViewTOUREXCURSV1_RATE: TcxGridDBColumn;
    ViewTOUREXCURSV1_AGENTPAY: TcxGridDBColumn;
    ViewTOUREXCURSV1_PAY: TcxGridDBColumn;
    ViewTOUREXCURSV1_VATPERC: TcxGridDBColumn;
    ViewTOUREXCURSV1_VAT: TcxGridDBColumn;
    ViewTOUREXCURSV1_AGENTPERC: TcxGridDBColumn;
    ViewTOUREXCURSV1_NETVAL: TcxGridDBColumn;
    ViewTOUREXCURSV1_PAID: TcxGridDBColumn;
    ViewTOUREXCURSV2_RATE: TcxGridDBColumn;
    ViewTOUREXCURSV2_AGENTPAY: TcxGridDBColumn;
    ViewTOUREXCURSV2_PAY: TcxGridDBColumn;
    ViewTOUREXCURSV2_VATPERC: TcxGridDBColumn;
    ViewTOUREXCURSV2_VAT: TcxGridDBColumn;
    ViewTOUREXCURSV2_AGENTPERC: TcxGridDBColumn;
    ViewTOUREXCURSV2_NETVAL: TcxGridDBColumn;
    ViewTOUREXCURSV2_PAID: TcxGridDBColumn;
    ViewTOUREXCURSV1_RATE2: TcxGridDBColumn;
    ViewTOUREXCURSV1_AGENTPAY2: TcxGridDBColumn;
    ViewTOUREXCURSV1_PAY2: TcxGridDBColumn;
    ViewTOUREXCURSV1_VATPERC2: TcxGridDBColumn;
    ViewTOUREXCURSV1_VAT2: TcxGridDBColumn;
    ViewTOUREXCURSV1_AGENTPERC2: TcxGridDBColumn;
    ViewTOUREXCURSV1_NETVAL2: TcxGridDBColumn;
    ViewTOUREXCURSV1_PAID2: TcxGridDBColumn;
    ViewTOUREXCURSV2_RATE2: TcxGridDBColumn;
    ViewTOUREXCURSV2_AGENTPAY2: TcxGridDBColumn;
    ViewTOUREXCURSV2_PAY2: TcxGridDBColumn;
    ViewTOUREXCURSV2_VATPERC2: TcxGridDBColumn;
    ViewTOUREXCURSV2_VAT2: TcxGridDBColumn;
    ViewTOUREXCURSV2_AGENTPERC2: TcxGridDBColumn;
    ViewTOUREXCURSV2_NETVAL2: TcxGridDBColumn;
    ViewTOUREXCURSV2_PAID2: TcxGridDBColumn;
    ViewTOUREXCURSPERIODTYPE: TcxGridDBColumn;
    TabExcurs: TcxTabSheet;
    cxGrid6DBTableView1: TcxGridDBTableView;
    cxGrid6Level1: TcxGridLevel;
    cxGrid6: TcxGrid;
    ViewTOURROOMSCITIESNAME: TcxGridDBColumn;
    ViewTOURROOMSCOUNTRYNAME: TcxGridDBColumn;
    ViewTOURROOMSHOTELNAME: TcxGridDBColumn;
    ViewTOURROOMSHOTELSTARS: TcxGridDBColumn;
    TOUREXCURSEXCURSNAME: TIBStringField;
    ViewTOUREXCURSEXCURSNAME: TcxGridDBColumn;
    TOUREXCURSDAYCOUNT: TIntegerField;
    ViewTOUREXCURSDAYCOUNT: TcxGridDBColumn;
    Button2: TButton;
    SCHEDITEM_TOURSTYPEOBJ: TIntegerField;
    SCHEDITEM_TOURSTEMPLATEID: TIntegerField;
    SCHEDITEM_TOURSOBJID: TIntegerField;
    Panel4: TPanel;
    Button3: TButton;
    ProgressBar: TProgressBar;
    SCHEDITEM_TOURSTYPEACTION: TIntegerField;
    ImageListAction: TImageList;
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
    cxStyle216: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    PopupMenuTreeScheduleTour: TPopupMenu;
    PopUpMenuItemAddTransfer: TMenuItem;
    PopUpMenuItemAddHotel: TMenuItem;
    PopUpMenuItemAddExcursion: TMenuItem;
    N1: TMenuItem;
    PopUpMenuItemAddDetailDescription: TMenuItem;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    SHEDULESBEGINDAY: TIntegerField;
    VieScheduleBEGINDAY: TcxGridDBColumn;
    Button8: TButton;
    IBTransaction2: TIBTransaction;
    Button10: TButton;
    TOUR_DESCRIPTIONS: TIBTable;
    DS_TOUR_DESCRIPTIONS: TDataSource;
    TOUR_DESCRIPTIONSTOURDESCRIPTID: TIntegerField;
    TOUR_DESCRIPTIONSNAME: TIBStringField;
    TabDescription: TcxTabSheet;
    GridTourDescriptionDBTableView1: TcxGridDBTableView;
    GridTourDescriptionLevel1: TcxGridLevel;
    GridTourDescription: TcxGrid;
    ViewTourDescriptions: TcxGridDBTableView;
    ViewTourDescriptionsTOURDESCRIPTID: TcxGridDBColumn;
    ViewTourDescriptionsNAME: TcxGridDBColumn;
    Button4: TButton;
    TOUR_DESCRIPTIONSTOURTEMPLATEID: TIntegerField;
    ViewTourDescriptionsTOURTEMPLATEID: TcxGridDBColumn;
    PopUpMenuItemAddDetailDescriptionSub: TMenuItem;
    Button9: TButton;
    N2: TMenuItem;
    PopUpMenuItemAddDetailMoveUp: TMenuItem;
    PopUpMenuItemAddDetailMoveDown: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SCHEDITEM_TOURSOPTIONS: TIntegerField;
    SHEDULEITEMSSHEDITEMID: TIntegerField;
    SHEDULEITEMSSTOPORDER: TSmallintField;
    SHEDULEITEMSCOUNTRYNAME: TIBStringField;
    SHEDULEITEMSCITYNAME: TIBStringField;
    SHEDULEITEMSARRIVETIME: TFloatField;
    SHEDULEITEMSDEPARTTIME: TFloatField;
    SHEDULEITEMSARRIVEDAY: TIntegerField;
    SHEDULEITEMSDEPARTDAY: TIntegerField;
    SHEDULEITEMSEXTRADISTANCE: TIBStringField;
    SHEDULEITEMSEXTRADEPART: TIBStringField;
    SHEDULEITEMSEXTRAARRIVE: TIBStringField;
    ViewSchedItemEXTRADEPART: TcxGridDBColumn;
    ViewSchedItemEXTRAARRIVE: TcxGridDBColumn;
    SHEDULEITEMSPARENTARRIVEID: TIntegerField;
    SHEDULEITEMSPARENTDEPARTID: TIntegerField;
    ViewSchedItemPARENTARRIVEID: TcxGridDBColumn;
    ViewSchedItemPARENTDEPARTID: TcxGridDBColumn;
    TOURROOMSNAME: TIBStringField;
    TOURROOMSSTARS: TIBStringField;
    TOURROOMSCITY: TIBStringField;
    TOURROOMSCOUNTRY: TIBStringField;
    SHEDULEITEMSCITYID: TIntegerField;
    SCHEDITEM_TOURSCalcActionTime: TFloatField;
    SCHEDITEM_TOURSCITYID: TIntegerField;
    TOURROOMSFROMTIME: TFloatField;
    TOURROOMSTILLTIME: TFloatField;
    TOUREXCURSTILLTIME: TFloatField;
    TreeTourSched: TcxDBTreeList;
    TreeTourSchedSCHEDITEMTOURID: TcxDBTreeListColumn;
    TreeTourSchedTypeAction: TcxDBTreeListColumn;
    TreeTourSchedTypeOBJIcon: TcxDBTreeListColumn;
    TreeTourSchedCalcDescription: TcxDBTreeListColumn;
    TreeTourSchedArriveTime: TcxDBTreeListColumn;
    TreeTourSchedStopOrder: TcxDBTreeListColumn;
    TreeTourSchedParent: TcxDBTreeListColumn;
    TreeTourSchedObjID: TcxDBTreeListColumn;
    TreeTourSchedTemplateID: TcxDBTreeListColumn;
    TreeTourSchedcxDBTreeListOPTIONS: TcxDBTreeListColumn;
    TreeTourSchedcxDBTreeListCITYID: TcxDBTreeListColumn;
    ImageListErrors: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SCHEDITEM_TOURSCalcFields(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ViewRoutersFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure TreeTourSchedTypeActionGetDisplayText(
      Sender: TcxTreeListColumn; ANode: TcxTreeListNode;
      var Value: String);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure PopUpMenuItemAddDetailDescriptionClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure PopUpMenuItemAddDetailDescriptionSubClick(Sender: TObject);
    procedure TOUR_DESCRIPTIONSAfterInsert(DataSet: TDataSet);
    procedure PopupMenuTreeScheduleTourPopup(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure PopUpMenuItemAddDetailMoveUpClick(Sender: TObject);
    procedure PopUpMenuItemAddDetailMoveDownClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TreeTourSchedCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  private
    DatailTour : TDetailTours;
    { Private declarations }
  public
    procedure GenCurrTree;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses UnitIBQuery;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 IBDatabase1.Connected:=true;

 TOURS.Open;
 //TOURS.Locate('ID',116,[]);

 TOURTEMPLATES.Open;
 SHEDULES.Open;
 SHEDULEITEMS.Open;
 TOURROOMS.Open;
 TOUREXCURS.Open;

 TOUR_DESCRIPTIONS.Open;

 SCHEDITEM_TOURS.Open;

 DatailTour := TDetailTours.Create( TreeTourSched ,  SCHEDITEM_TOURS ,IBDatabase1.DatabaseName , IBDatabase1.Params.Values['user_name'], IBDatabase1.Params.Values['password']  );
 DatailTour.SetImageListInformError( ImageListErrors );

 DatailTour.AddPropertyForTypeObj(0, TabStops , ViewSchedItem,'DEPARTTIME','ARRIVETIME');
 DatailTour.AddPropertyForTypeObj(1, TabHotels, ViewTOURROOMS,'FROMTIME','TILLTIME' );
 DatailTour.AddPropertyForTypeObj(2, TabExcurs, ViewTOUREXCURS,'EXTIME','TILLTIME' );
 DatailTour.AddPropertyForTypeObj(3, TabDescription, ViewTourDescriptions,'',''  );



 DatailTour.RefreshDBTree;
end;

procedure TForm1.GenCurrTree;
var TemplateId:Integer;
    BeginSchedDay:Integer;
begin
   TemplateId := TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger;
   if SHEDULES.fieldByName('BEGINDAY').Value<>null then
     BeginSchedDay:=SHEDULES.fieldByName('BEGINDAY').AsInteger
   else BeginSchedDay:=1;
   try
     //TreeTourSched.BeginUpdate;
     DatailTour.GenerateForAllTypeObject( TemplateId, TOURTEMPLATES.fieldByName('DAYCOUNT').AsInteger ,BeginSchedDay );
   finally
    //TreeTourSched.EndUpdate;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 GenCurrTree;
end;

procedure TForm1.SCHEDITEM_TOURSCalcFields(DataSet: TDataSet);
begin
 if DataSet.FieldByName('Parent').Value = null then
   DataSet.FieldByName('CalcDescription').AsString := DataSet.FieldByName('Description').AsString +' '+ DataSet.FieldByName('STOPORDER').AsString
 else
  DataSet.FieldByName('CalcDescription').AsString := DataSet.FieldByName('Description').AsString;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   DatailTour.Remove;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  ViewRouters.Controller.SelectAll;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i:integer;
begin
 ProgressBar.Max := ViewRouters.Controller.SelectedRecordCount;
 for i:=0 to ViewRouters.Controller.SelectedRecordCount-1 do
 begin
   ViewRouters.Controller.SelectedRecords[i].Focused := True;
   TOURTEMPLATES.First;

   While not TOURTEMPLATES.Eof do
   begin
     ViewTourTemplate.Controller.FocusedRecord.Selected := True;

     GenCurrTree;
     TOURTEMPLATES.Next;
   end;

   ProgressBar.Position := ProgressBar.Position + 1;
 end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var a:TcxCustomGridTableView;
begin
  DatailTour.Close;
end;

procedure TForm1.ViewRoutersFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 TreeTourSched.FullExpand;
end;

procedure TForm1.TreeTourSchedTypeActionGetDisplayText(
  Sender: TcxTreeListColumn; ANode: TcxTreeListNode; var Value: String);
begin
  if (ANode.Values[ TreeTourSchedTypeOBJIcon.Position.VisibleColIndex ] = 0)and(ANode.Values[ TreeTourSchedTypeAction.Position.VisibleColIndex] = 0)  then Value:='Відправлення';
  if (ANode.Values[ TreeTourSchedTypeOBJIcon.Position.VisibleColIndex ] = 0)and(ANode.Values[ TreeTourSchedTypeAction.Position.VisibleColIndex ] = 1) then Value:='Прибуття';
  if (ANode.Values[ TreeTourSchedTypeOBJIcon.Position.VisibleColIndex ] = 1)and(ANode.Values[ TreeTourSchedTypeAction.Position.VisibleColIndex ] = 0) then Value:='Поселення в готель';
  if (ANode.Values[ TreeTourSchedTypeOBJIcon.Position.VisibleColIndex ] = 1)and(ANode.Values[ TreeTourSchedTypeAction.Position.VisibleColIndex ] = 1) then Value:='Виселення з готелю';
  if (ANode.Values[ TreeTourSchedTypeOBJIcon.Position.VisibleColIndex ] = 2)and(ANode.Values[ TreeTourSchedTypeAction.Position.VisibleColIndex ] = 0) then Value:='Початок екскурсії';
  if (ANode.Values[ TreeTourSchedTypeOBJIcon.Position.VisibleColIndex ] = 3)and(ANode.Values[ TreeTourSchedTypeAction.Position.VisibleColIndex ] = 0) then Value:='Детальний опис';

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 DatailTour.AddNewTransfer(TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger);
// SHEDULEITEMS.Insert;
// SHEDULEITEMS.FieldByName('').AsInteger
// SHEDULEITEMS.Post;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 DatailTour.AddNewHotel(TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 DatailTour.AddNewExcursion(TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
 DatailTour.AddNewExcursionSub(TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger);
end;

procedure TForm1.Button10Click(Sender: TObject);
var DelJustTree:Boolean;
begin
 if DatailTour.GetTypeByNode(TreeTourSched.FocusedNode).ActionType = 3 then DelJustTree:=False
 else DelJustTree:=True;
 DatailTour.DelFocusedObject(DelJustTree);
end;

procedure TForm1.PopUpMenuItemAddDetailDescriptionClick(Sender: TObject);
begin
 TOUR_DESCRIPTIONS.Insert;
 TOUR_DESCRIPTIONS.FieldByName('TOURTEMPLATEID').AsInteger:=TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger;
 TOUR_DESCRIPTIONS.FieldByName('Name').AsString := 'Новий Опис';
 TOUR_DESCRIPTIONS.Post;

 DatailTour.AddNewDescription( TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger );
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 TOUR_DESCRIPTIONS.Insert;
 TOUR_DESCRIPTIONS.FieldByName('TOURTEMPLATEID').AsInteger:=TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger;
 TOUR_DESCRIPTIONS.FieldByName('Name').AsString := 'Новий Опис';
 TOUR_DESCRIPTIONS.Post;

 DatailTour.AddNewDescription( TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger );
end;

procedure TForm1.PopUpMenuItemAddDetailDescriptionSubClick(Sender: TObject);
begin

 TOUR_DESCRIPTIONS.Insert;
 TOUR_DESCRIPTIONS.FieldByName('TOURTEMPLATEID').AsInteger:=TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger;
 TOUR_DESCRIPTIONS.FieldByName('Name').AsString := 'Новий Опис';
 TOUR_DESCRIPTIONS.Post;

 DatailTour.AddNewDescriptionToSub( TOURTEMPLATES.fieldByName('TOURTEMPLATEID').AsInteger );
end;

procedure TForm1.TOUR_DESCRIPTIONSAfterInsert(DataSet: TDataSet);
begin
 DataSet.FieldByName('TOURDESCRIPTID').AsInteger := IDGenId('gen_tour_descriptions_id' , IBDatabase1.DatabaseName , IBDatabase1.Params.Values['user_name'], IBDatabase1.Params.Values['password'] );
end;

procedure TForm1.PopupMenuTreeScheduleTourPopup(Sender: TObject);
begin

 PopUpMenuItemAddDetailDescription.Enabled:=TreeTourSched.FocusedNode<>nil;
 PopUpMenuItemAddDetailDescriptionSub.Enabled:=TreeTourSched.FocusedNode<>nil;
 PopUpMenuItemAddDetailMoveUp.Enabled:= true;
 PopUpMenuItemAddDetailMoveDown.Enabled := true;

 if TreeTourSched.FocusedNode<>nil then
 begin
   PopUpMenuItemAddDetailDescription.Enabled:=TreeTourSched.FocusedNode.Level >1;
   PopUpMenuItemAddDetailDescriptionSub.Enabled:=TreeTourSched.FocusedNode.Level >0;

   if DatailTour.GetTypeByNode(TreeTourSched.FocusedNode).ActionType = 3 then
   begin
     PopUpMenuItemAddDetailMoveUp.Enabled:= TreeTourSched.FocusedNode.getPrevSibling<>nil;
     PopUpMenuItemAddDetailMoveDown.Enabled:= TreeTourSched.FocusedNode.getNextSibling<>nil;
   end;

 end
end;

procedure TForm1.PopUpMenuItemAddDetailMoveUpClick(Sender: TObject);
begin
 DatailTour.MoveNodeUp( TreeTourSched.FocusedNode );
end;

procedure TForm1.PopUpMenuItemAddDetailMoveDownClick(Sender: TObject);
begin
  DatailTour.MoveNodeDown( TreeTourSched.FocusedNode );
end;

procedure TForm1.N4Click(Sender: TObject);
var DelJustTree:Boolean;
begin
 if DatailTour.GetTypeByNode(TreeTourSched.FocusedNode).ActionType = 3 then DelJustTree:=False
 else DelJustTree:=True;
 DatailTour.DelFocusedObject(DelJustTree);
end;

procedure TForm1.TreeTourSchedCustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
 if DatailTour = nil then exit;
 if ( AViewInfo.Column = TreeTourSchedTypeOBJIcon ) then 
 begin
   if ( AViewInfo.Node<>nil )and( AViewInfo.Node.Level = 2 )and( AViewInfo.Node.Values[AViewInfo.Column.ItemIndex] = 0 ) then
   begin
     DatailTour.TreeDrawFillRect(Sender, AViewInfo, ACanvas );
     ACanvas.DrawImage(ImageListAction ,AViewInfo.BoundsRect.Left + 7  , AViewInfo.BoundsRect.Top , 7 ,true);
     Adone:=true;
   end;
 end;
end;

end.
