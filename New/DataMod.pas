unit DataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ImgList, ExtDlgs, ActnList, VDlgs, OleServer, Word97,
  WordXP;

const
  // Service kinds constants
  servBehicle = 0;
  // Communication identificators
  commNone = -1;
  commFax = 0;
  commEmail = 1;
  commXpress = 2;
  commPhone = 3;
  commErrandBoy = 4;
  prntDocPrintGuideAll = 0;
  prntDocPrintGuideTrip = 1;
  prntDocPrintGuideRoom = 2;

type
  TDM = class(TDataModule)
    Database: TDatabase;
    OrderTable: TTable;
    OrderSrc: TDataSource;
    OrderTableOrderId: TAutoIncField;
    OrderTableDateAndTime: TDateTimeField;
    OrderTableClientId: TIntegerField;
    OrderTableLookClient: TStringField;
    OrderTableAREPERSONS: TStringField;
    OrderTableReservTo: TDateTimeField;
    OrderTableReklamaSource: TIntegerField;
    OrderTableTotal: TCurrencyField;
    OrderTableDiscount: TFloatField;
    OrderTablePaid: TCurrencyField;
    OrderTableTotal2: TCurrencyField;
    OrderTableDiscount2: TFloatField;
    OrderTablePaid2: TCurrencyField;
    OrderTableCalcTotal: TCurrencyField;
    OrderTableCalcTotal2: TCurrencyField;
    OrderTableCalcDue: TCurrencyField;
    OrderTableCalcDue2: TCurrencyField;
    OrderTableDiscountValue: TCurrencyField;
    OrderTableDiscountValue2: TCurrencyField;
    OrderTableState: TSmallintField;
    OrderTableCalcState: TStringField;
    OrderTableMemo: TMemoField;
    OrderTableCalcMemo: TStringField;
    OrderTableLookIsCompany: TStringField;
    OrderTableTOURID: TIntegerField;
    OrderTableISGROUPED: TStringField;
    OrderTableTOURGROUPID: TIntegerField;
    OrderTripSumQry: TQuery;
    OrderTripSumQryPersonId: TIntegerField;
    OrderTripSumQrySUMRATE: TFloatField;
    OrderTripSumQrySUMRATE2: TFloatField;
    OrderTripSumQrySUMDISCOUNT: TFloatField;
    OrderTripSumQrySUMDISCOUNT2: TFloatField;
    OrderTripSumQrySUMINCREASE: TFloatField;
    OrderTripSumQrySUMINCREASE2: TFloatField;
    OrderSumQry: TQuery;
    OrderSumQryPersonId: TIntegerField;
    OrderSumQrySUMRATE: TFloatField;
    OrderSumQrySUMRATE2: TFloatField;
    OrderSumQrySUMDISCOUNT: TFloatField;
    OrderSumQrySUMDISCOUNT2: TFloatField;
    OrderSumQrySUMINCREASE: TFloatField;
    OrderSumQrySUMINCREASE2: TFloatField;
    OrderBillTable: TTable;
    OrderBillSrc: TDataSource;
    OrderBillTableOrderId: TIntegerField;
    OrderBillTableBillId: TAutoIncField;
    OrderBillTableBillNo: TStringField;
    OrderBillTablePaid: TCurrencyField;
    OrderBillTableCurrencyId: TIntegerField;
    OrderBillTableLookCurrency: TStringField;
    OrderBillTablePayMethod: TSmallintField;
    OrderBillTableCreditCard: TStringField;
    OrderBillTableCalcMethod: TStringField;
    OrderBillTableDue: TCurrencyField;
    OrderBillTableCurrencyRate: TFloatField;
    OrderBillTableBILLDATE: TDateTimeField;
    OrderBillTablePAYDATE: TDateTimeField;
    ReklamaTable: TTable;
    ReklamaSrc: TDataSource;
    ReklamaTableReklamaId: TAutoIncField;
    ReklamaTableName: TStringField;
    ReklamaTableVendorId: TIntegerField;
    VendorTable: TTable;
    VendorSrc: TDataSource;
    VendorTableClientId: TAutoIncField;
    VendorTableContact: TStringField;
    VendorTableName: TStringField;
    VendorTableHomePhone: TStringField;
    VendorTableWorkPhone: TStringField;
    VendorTableMobilPhone: TStringField;
    VendorTableFax: TStringField;
    VendorTablePager: TStringField;
    VendorTableZipCode: TStringField;
    VendorTableCityKind: TSmallintField;
    VendorTableCityId: TIntegerField;
    VendorTableProvince: TStringField;
    VendorTableTownship: TStringField;
    VendorTableStrKind: TSmallintField;
    VendorTableAddress: TStringField;
    VendorTableHouse: TStringField;
    VendorTableTenement: TStringField;
    VendorTableCountryId: TIntegerField;
    VendorTableMemo: TMemoField;
    VendorTableLookCity: TStringField;
    VendorTableCalcCountry: TStringField;
    VendorTableLookCountry: TIntegerField;
    VendorTableCalcPhone: TStringField;
    VendorTableCalcClient: TStringField;
    VendorTablePagerNo: TStringField;
    VendorTableWebSite: TStringField;
    VendorTableIdentCode: TIntegerField;
    VendorTableLicenseNo: TStringField;
    PersonTableTripPaid: TCurrencyField;
    PersonTableTripPaid2: TCurrencyField;
    PersonTableHotelPaid: TCurrencyField;
    PersonTableHotelPaid2: TCurrencyField;
    PersonTableTransferPaid: TCurrencyField;
    PersonTableTransferPaid2: TCurrencyField;
    PersonTableVisaPaid: TCurrencyField;
    PersonTableVisaPaid2: TCurrencyField;
    PersonTableExcursionPaid: TCurrencyField;
    PersonTableExcursionPaid2: TCurrencyField;
    PersonTableInsurePaid: TCurrencyField;
    PersonTableFirmPaid: TCurrencyField;
    PersonTableResortPaid: TCurrencyField;
    PersonTableResortPaid2: TCurrencyField;
    VendorTableISCOMPANY: TStringField;
    VendorTableE_MAIL: TStringField;
    ClientTable: TTable;
    ClientQrySrc: TDataSource;
    TouristSrc: TDataSource;
    AnketTable: TTable;
    AnketSrc: TDataSource;
    AnketTableTOURISTID: TIntegerField;
    AnketTableTOURISTANKETID: TAutoIncField;
    AnketTableIDENTCODE: TStringField;
    AnketTableOLDSURNAME: TStringField;
    AnketTableOLDSECONDNAME: TStringField;
    AnketTableBIRTHLOCALITY: TStringField;
    AnketTableBIRTHCOUNTRY: TStringField;
    AnketTablePASSPORTISSUE: TStringField;
    AnketTablePASSPORTISSUEADDRESS: TStringField;
    AnketTableNATIONALITY: TStringField;
    AnketTablePRIORNATIONALITY: TStringField;
    AnketTableSEX: TStringField;
    AnketTableMARRIED: TSmallintField;
    AnketTableSPOUSENAME: TStringField;
    AnketTableSPOUSESURNAME: TStringField;
    AnketTableSPOUSEOLDSURNAME: TStringField;
    AnketTableSPOUSEFIRSTNAME: TStringField;
    AnketTableSPOUSESECONDNAME: TStringField;
    AnketTableSPOUSEOLDSECONDNAME: TStringField;
    AnketTableSPOUSEBIRTHDATE: TDateTimeField;
    AnketTableSPOUSEBIRTHLOCALITY: TStringField;
    AnketTableSPOUSEBIRTHCOUNTRY: TStringField;
    AnketTableSPOUSENATIONALITY: TStringField;
    AnketTablePROFESSION: TStringField;
    AnketTableOCCUPATION: TStringField;
    AnketTableEMPLOYER: TStringField;
    AnketTableEMPLADDRESS: TStringField;
    AnketTableEMPLPHONE: TStringField;
    AnketTableFATHERNAME: TStringField;
    AnketTableMOTHERNAME: TStringField;
    AnketTableENDVISA: TStringField;
    AnketTableENDVISAKIND: TSmallintField;
    AnketTableENDVISANO: TStringField;
    AnketTableENDVISAFROM: TDateTimeField;
    AnketTableENDVISATO: TDateTimeField;
    AnketTableENDVISAISSUE: TStringField;
    AnketTableENDDESTCOUNTRY: TStringField;
    AnketTableRETURNVISA1: TStringField;
    AnketTableRETURNVISA2: TStringField;
    AnketTableRETURNVISA1NO: TStringField;
    AnketTableRETURNVISA2NO: TStringField;
    AnketTableRETURNVISA1DATE: TDateTimeField;
    AnketTableRETURNVISA2DATE: TDateTimeField;
    AnketTableMEMO: TMemoField;
    AnketVisitTable: TTable;
    AnketVisitSrc: TDataSource;
    AnketVisitTableTOURISTID: TIntegerField;
    AnketVisitTableTOURISTVISITID: TIntegerField;
    AnketVisitTableFROMDATE: TDateTimeField;
    AnketVisitTableTODATE: TDateTimeField;
    AnketVisitTableCOUNTRY: TStringField;
    AnketVisitTableEMBASDATE: TDateTimeField;
    AnketVisitTableEMBASADDRESS: TStringField;
    RelativesTable: TTable;
    RelativesSrc: TDataSource;
    RelativesTableTOURISTID: TIntegerField;
    RelativesTableSURNAME: TStringField;
    RelativesTableNAME: TStringField;
    RelativesTableSECONDNAME: TStringField;
    RelativesTableFIRSTNAME: TStringField;
    RelativesTableBIRTHDATE: TDateTimeField;
    RelativesTableBIRTHLOCALITY: TStringField;
    RelativesTableBIRTHCOUNTRY: TStringField;
    RelativesTableTOURISTRELATID: TAutoIncField;
    RelativesTableNATIONALITY: TStringField;
    RelativesTableRELATIVTEXT: TStringField;
    RelativesTableASTOURISTID: TIntegerField;
    RouteSrc: TDataSource;
    SheduleTable: TTable;
    SheduleSrc: TDataSource;
    SheduleTableRouteId: TIntegerField;
    SheduleTableSheduleId: TAutoIncField;
    SheduleTableSheduleNo: TSmallintField;
    SheduleTableFTimeLinkTo: TSmallintField;
    SheduleTableBTimeLinkTo: TSmallintField;
    SheduleTableForwardTime: TFloatField;
    SheduleTableBackwardTime: TFloatField;
    SheduleTableDEPARTFTIME: TDateTimeField;
    SheduleTableARRIVEFTIME: TDateTimeField;
    SheduleTableDEPARTBTIME: TDateTimeField;
    SheduleTableARRIVEBTIME: TDateTimeField;
    SheduleTableISDISTANCED: TStringField;
    SheduleTableISTIMED: TStringField;
    SheduleTableCalcShedule: TStringField;
    ShedItemTable: TTable;
    ShedItemSrc: TDataSource;
    ShedItemTableSheduleId: TIntegerField;
    ShedItemTableShedItemId: TAutoIncField;
    ShedItemTableDirection: TSmallintField;
    ShedItemTableStopOrder: TSmallintField;
    ShedItemTableBranch: TSmallintField;
    ShedItemTableStopId: TIntegerField;
    ShedItemTableDistance: TSmallintField;
    ShedItemTableArriveTime: TFloatField;
    ShedItemTableDuration: TFloatField;
    ShedItemTableDepartTime: TFloatField;
    RouteStopsQry: TQuery;
    RoutVendorQry: TQuery;
    RoutVendorSrc: TDataSource;
    CountryTable: TTable;
    CountrySrc: TDataSource;
    CountryTableCountryId: TAutoIncField;
    CountryTableName: TStringField;
    CountryTableCapital: TStringField;
    CountryTableTimeBias: TFloatField;
    CountryTableCurrency: TIntegerField;
    CountryTablePhoneCode: TStringField;
    CountryTableShortSign: TStringField;
    CountryTableCODE2: TStringField;
    CountryTableCODE3: TStringField;
    CountryTableNAME_ENG: TStringField;
    CountryTablePHONECODEUNIVAL: TStringField;
    CountryTablePHONECODEUNI: TStringField;
    CountryTableNEEDVISA: TStringField;
    CountryTableMemo: TMemoField;
    CountryTableLookCurrency: TStringField;
    CountryTableLookCurrencyShort: TStringField;
    CurrencyTable: TTable;
    CurrencySrc: TDataSource;
    CurrencyTableCurrencyId: TAutoIncField;
    CurrencyTableCurrencyName: TStringField;
    CurrencyTableCurrencyShort: TStringField;
    CurrencyTableCoins: TStringField;
    CurrencyTableCURRENCYCODE: TStringField;
    CurrencyTableRATEZOOM: TIntegerField;
    CurrencyTableCURRENTRATE: TFloatField;
    CurrencyTableLASTDATE: TDateTimeField;
    CityByCntryTable: TTable;
    CityByCntrySrc: TDataSource;
    CityByCntryTableCountryId: TIntegerField;
    CityByCntryTableCityId: TAutoIncField;
    CityByCntryTablePhoneCode: TStringField;
    CityByCntryTableMemo: TMemoField;
    CityByCntryTableTimeBias: TFloatField;
    CityByCntryTableName: TStringField;
    CityByCntryTableLookCountry: TStringField;
    CityByCntryTableLookPhoneCodeUni: TStringField;
    CityTable: TTable;
    CitySrc: TDataSource;
    CityTableCountryId: TIntegerField;
    CityTableCityId: TAutoIncField;
    CityTableName: TStringField;
    CityTableLookCountrySign: TStringField;
    TripQuery: TQuery;
    TripQrySrc: TDataSource;
    TripQueryLeavingId: TIntegerField;
    TripQueryCalcFrom: TStringField;
    TripQueryCalcArrive: TStringField;
    TripQueryLeaveDate: TDateTimeField;
    TripQueryDirection: TSmallintField;
    TripQueryDriveId: TIntegerField;
    TripByOrderQry: TQuery;
    TripByOrderQrySrc: TDataSource;
    TripByOrderQryROUTEID: TIntegerField;
    TripByOrderQryLEAVINGID: TIntegerField;
    TripByOrderQryDIRECTION: TSmallintField;
    TripByOrderQryLEAVEDATE: TDateTimeField;
    TripByOrderQryCalcFrom: TStringField;
    TripByOrderQryCalcArrive: TStringField;
    PlaceMapTable: TTable;
    PlaceMapTableLeavingId: TIntegerField;
    PlaceMapTablePlaceId: TAutoIncField;
    PlaceMapTablePLACENO: TStringField;
    PlaceMapTablePLACECLASS: TSmallintField;
    PlaceMapTableState: TSmallintField;
    PlaceMapTableOrderId: TIntegerField;
    PlaceMapTablePersonId: TIntegerField;
    PlaceMapTableStartCity: TIntegerField;
    PlaceMapTableStopCity: TIntegerField;
    PlaceMapTableRate: TCurrencyField;
    PlaceMapTableRate2: TCurrencyField;
    PlaceMapTableDiscount: TFloatField;
    PlaceMapTableDiscount2: TFloatField;
    PlaceMapTableIncrease: TFloatField;
    PlaceMapTableIncrease2: TFloatField;
    PlaceMapTableVendorId: TIntegerField;
    PlaceMapTableLookTourist: TStringField;
    PlaceByOrderQry: TQuery;
    PlaceByOrderQryLEAVINGID: TIntegerField;
    PlaceByOrderQrySTATE: TSmallintField;
    PlaceByOrderQryPLACENO: TStringField;
    PlaceByTripSrc: TDataSource;
    PlaceByTripTable: TTable;
    PlaceByTripTableLeavingId: TIntegerField;
    PlaceByTripTablePlaceId: TAutoIncField;
    PlaceByTripTablePLACENO: TStringField;
    PlaceByTripTablePLACECLASS: TSmallintField;
    PlaceByTripTableState: TSmallintField;
    PlaceByTripTableOrderId: TIntegerField;
    PlaceByTripTablePersonId: TIntegerField;
    PlaceByTripTableStartCity: TIntegerField;
    PlaceByTripTableStopCity: TIntegerField;
    PlaceByTripTableRate: TCurrencyField;
    PlaceByTripTableRate2: TCurrencyField;
    PlaceByTripTableDiscount: TFloatField;
    PlaceByTripTableDiscount2: TFloatField;
    PlaceByTripTableIncrease: TFloatField;
    PlaceByTripTableIncrease2: TFloatField;
    PlaceByTripTableLookTouristName: TStringField;
    PlaceByTripTableLookTouristBirthDate: TDateField;
    PlaceByTripTableLookStartPoint: TStringField;
    PlaceByTripTableLookStopPoint: TStringField;
    PlaceByTripTableCalcState: TStringField;
    PlaceWriteQuery: TQuery;
    PlaceWriteQueryState: TSmallintField;
    PlaceWriteQueryPersonId: TIntegerField;
    PlaceListQuery: TQuery;
    PlaceListSrc: TDataSource;
    PlaceListQueryLeavingId: TIntegerField;
    PlaceListQueryPersonId: TIntegerField;
    PlaceListQueryOrderId: TIntegerField;
    PlaceListQueryPLACENO: TStringField;
    PlaceListQueryState: TSmallintField;
    PlaceListQueryPlaceId: TIntegerField;
    PlaceListQueryLookTourist: TStringField;
    PlaceListQueryCalcState: TStringField;
    PlaceListQueryRate: TCurrencyField;
    PlaceListQueryRate2: TCurrencyField;
    PlaceUpdateQry: TQuery;
    PlaceUpdateQryOrderId: TIntegerField;
    PlaceUpdateQryState: TSmallintField;
    PlaceUpdateQryReservTo: TDateTimeField;
    PersonTable: TTable;
    PersonTablePersonId: TAutoIncField;
    PersonTableOrderId: TIntegerField;
    PersonTableTouristId: TIntegerField;
    PersonTableHotelTotal: TCurrencyField;
    PersonTableTransferTotal: TCurrencyField;
    PersonTableVisaTotal: TCurrencyField;
    PersonTableExcursionTotal: TCurrencyField;
    PersonTableHotelTotal2: TCurrencyField;
    PersonTableTransferTotal2: TCurrencyField;
    PersonTableVisaTotal2: TCurrencyField;
    PersonTableExcursionTotal2: TCurrencyField;
    PersonTableTripTotal: TCurrencyField;
    PersonTableTripTotal2: TCurrencyField;
    PersonTableInsureTotal: TCurrencyField;
    PersonTableResortTotal: TCurrencyField;
    PersonTableResortTotal2: TCurrencyField;
    PersonTableFirmTotal: TCurrencyField;
    PersonTableTotalPaid: TCurrencyField;
    PersonTableTotalPaid2: TCurrencyField;
    PersonTableTRIP: TStringField;
    PersonTableHOTEL: TStringField;
    PersonTableVISA: TStringField;
    PersonTableTRANSFER: TStringField;
    PersonTableEXCURSION: TStringField;
    PersonQry: TQuery;
    PersonQrySrc: TDataSource;
    PersonQryOrderId: TIntegerField;
    PersonQryPersonId: TIntegerField;
    PersonQryTouristId: TIntegerField;
    PersonQrySurName: TStringField;
    PersonQryName: TStringField;
    PersonQryHomePhone: TStringField;
    PersonQryPassportNo: TStringField;
    PersonQryMemo: TMemoField;
    PersonQryBIRTHDATE: TDateTimeField;
    PersonQryPASSPORTEXPIRE: TDateTimeField;
    PersonQryCalcName: TStringField;
    PersonQryCalcMemo: TStringField;
    PersonQryTRIP: TStringField;
    PersonQryHOTEL: TStringField;
    PersonQryTRANSFER: TStringField;
    PersonQryVISA: TStringField;
    PersonQryEXCURSION: TStringField;
    PersonQryTripTotal: TCurrencyField;
    PersonQryTripTotal2: TCurrencyField;
    PersonQryHotelTotal: TCurrencyField;
    PersonQryHotelTotal2: TCurrencyField;
    PersonQryTransferTotal: TCurrencyField;
    PersonQryTransferTotal2: TCurrencyField;
    PersonQryVisaTotal: TCurrencyField;
    PersonQryVisaTotal2: TCurrencyField;
    PersonQryExcursionTotal: TCurrencyField;
    PersonQryExcursionTotal2: TCurrencyField;
    PersonQryInsureTotal: TCurrencyField;
    PersonQryResortTotal: TCurrencyField;
    PersonQryResortTotal2: TCurrencyField;
    PersonQryFirmTotal: TCurrencyField;
    PersonQryTripPaid: TCurrencyField;
    PersonQryTripPaid2: TCurrencyField;
    PersonQryHotelPaid: TCurrencyField;
    PersonQryHotelPaid2: TCurrencyField;
    PersonQryTransferPaid: TCurrencyField;
    PersonQryTransferPaid2: TCurrencyField;
    PersonQryVisaPaid: TCurrencyField;
    PersonQryVisaPaid2: TCurrencyField;
    PersonQryExcursionPaid: TCurrencyField;
    PersonQryExcursionPaid2: TCurrencyField;
    PersonQryInsurePaid: TCurrencyField;
    PersonQryFirmPaid: TCurrencyField;
    PersonQryResortPaid: TCurrencyField;
    PersonQryResortPaid2: TCurrencyField;
    PersonQryTotalPaid: TCurrencyField;
    PersonQryTotalPaid2: TCurrencyField;
    PersonQryCalcMayBePaid: TCurrencyField;
    PersonQryCalcMayBePaid2: TCurrencyField;
    LookPersonQry: TQuery;
    LookPersonQryPersonId: TIntegerField;
    LookPersonQrySurName: TStringField;
    LookPersonQryName: TStringField;
    LookPersonQryHomePhone: TStringField;
    LookPersonQryOrderId: TIntegerField;
    LookPersonQryTouristId: TIntegerField;
    LookPersonQryBIRTHDATE: TDateTimeField;
    PlaceByPersonQry: TQuery;
    PlaceByPersonQryORDERID: TIntegerField;
    PlaceByPersonQryPERSONID: TIntegerField;
    PlaceByPersonQryLEAVINGID: TIntegerField;
    PlaceByPersonQryLEAVINGID_1: TIntegerField;
    PlaceByPersonQryROUTEID: TIntegerField;
    PlaceByPersonQrySTARTCITY: TIntegerField;
    PlaceByPersonQrySTOPCITY: TIntegerField;
    PlaceByPersonQrySTARTCITY_1: TIntegerField;
    PlaceByPersonQrySTOPCITY_1: TIntegerField;
    PlaceByPersonQryPLACENO: TStringField;
    PlaceByPersonQryPLACENO_1: TStringField;
    PlaceByPersonQryDIRECTION: TSmallintField;
    PlaceByPersonQryDIRECTION_1: TSmallintField;
    PlaceByPersonQryLEAVEDATE: TDateTimeField;
    PlaceByPersonQryLEAVEDATE_1: TDateTimeField;
    PlaceByPersonQryDRIVEID: TIntegerField;
    PlaceByPersonQryDRIVEID_1: TIntegerField;
    PlaceByPersonQryPLACECLASS: TSmallintField;
    PlaceByPersonQryPLACECLASS_1: TSmallintField;
    PlaceByPersonQryBIRTHDATE: TDateTimeField;
    PersInsureTable: TTable;
    PersInsureSrc: TDataSource;
    PersInsureTableOrderId: TIntegerField;
    PersInsureTablePersonId: TIntegerField;
    PersInsureTableInsureId: TAutoIncField;
    PersInsureTableFROMDATE: TDateTimeField;
    PersInsureTableDayCount: TSmallintField;
    PersInsureTableCalcToDate: TDateField;
    PersInsureTableDiscount: TFloatField;
    PersInsureTableInsureIdent: TStringField;
    PersInsureTableNetVal: TCurrencyField;
    PersInsureTableLookTouristName: TStringField;
    PersInsureTableLookTouristBirthDate: TDateField;
    HtlVendorQry: TQuery;
    HtlVendorSrc: TDataSource;
    HotelSrc: TDataSource;
    FeedTable: TTable;
    FeedSrc: TDataSource;
    FeedTableFEEDTYPEID: TIntegerField;
    FeedTableFEEDNAME: TStringField;
    RoomTypeTable: TTable;
    RoomTypeSrc: TDataSource;
    RoomTypeTableRoomTypeId: TAutoIncField;
    RoomTypeTableRoomType: TStringField;
    RoomTypeTableExtName: TStringField;
    RoomTypeTableCapacity: TSmallintField;
    RoomTypeTableAddCapacity: TSmallintField;
    RoomTypeTableMinPerson: TSmallintField;
    RoomTable: TTable;
    RoomSrc: TDataSource;
    RoomTableHotelId: TIntegerField;
    RoomTableHotelRoomId: TAutoIncField;
    RoomTableRoomTypeId: TIntegerField;
    RoomTableRoomCount: TSmallintField;
    RoomTableLookRoomType: TStringField;
    RoomTableLookRoomCap: TIntegerField;
    RoomTableCalcRoom: TStringField;
    RoomingTable: TTable;
    RoomingTableRoomingId: TAutoIncField;
    RoomingTablePersonId: TIntegerField;
    RoomingTableFROMDATE: TDateTimeField;
    RoomingTableTODATE: TDateTimeField;
    RoomingTableDayCount: TSmallintField;
    RoomingTableDayPaid: TSmallintField;
    RoomingTableHotelId: TIntegerField;
    RoomingTableRoomId: TIntegerField;
    RoomingTableFeedId: TIntegerField;
    RoomingTableRate: TCurrencyField;
    RoomingTableRate2: TCurrencyField;
    RoomingTableDiscount: TCurrencyField;
    RoomingTableDiscount2: TCurrencyField;
    RoomingTableIncrease: TCurrencyField;
    RoomingTableIncrease2: TCurrencyField;
    RoomingTableLookRoomName: TStringField;
    RoomingTableLookRoomCapacity: TIntegerField;
    RoomingTableLookTourist: TStringField;
    RoomingTableLookBirthDate: TDateField;
    RoomingTableLookFeed: TStringField;
    RoomingTableLookOrderId: TIntegerField;
    RoomingQry: TQuery;
    RoomingQrySrc: TDataSource;
    RoomingQryHotelId: TIntegerField;
    RoomingQryFROMDATE: TDateTimeField;
    RoomingQryTODATE: TDateTimeField;
    RoomingQryDayCount: TSmallintField;
    RoomingQryDayPaid: TSmallintField;
    RoomingQryRate: TCurrencyField;
    RoomingQryRate2: TCurrencyField;
    RoomingQryDiscount: TCurrencyField;
    RoomingQryDiscount2: TCurrencyField;
    RoomingQryIncrease: TCurrencyField;
    RoomingQryIncrease2: TCurrencyField;
    HotelByOrderQry: TQuery;
    HotelByOrderSrc: TDataSource;
    HotelByOrderQryCity: TStringField;
    HotelByOrderQryHotel: TStringField;
    HotelByOrderQryCountryId: TIntegerField;
    HotelByOrderQryCityId: TIntegerField;
    HotelByOrderQryHotelId: TIntegerField;
    HotelByOrderQryCOUNT: TIntegerField;
    HotelByOrderQrySTARS: TStringField;
    OrdInsureQry: TQuery;
    OrdInsureQrySrc: TDataSource;
    AnketCntryTable: TTable;
    AnketCntrySrc: TDataSource;
    AnketCntryTableCOUNTRYID: TIntegerField;
    AnketCntryTableNAME: TStringField;
    AnketTmpTable: TTable;
    AnketTmpSrc: TDataSource;
    AnketTmpTableCOUNTRYID: TIntegerField;
    AnketTmpTableTOURISTTEMPLATEID: TIntegerField;
    AnketTmpTableIDENTCODE: TStringField;
    AnketTmpTableOLDSURNAME: TStringField;
    AnketTmpTableOLDSECONDNAME: TStringField;
    AnketTmpTableBIRTHLOCALITY: TStringField;
    AnketTmpTableBIRTHCOUNTRY: TStringField;
    AnketTmpTablePASSPORTISSUE: TStringField;
    AnketTmpTablePASSPORTISSUEADDRESS: TStringField;
    AnketTmpTableNATIONALITY: TStringField;
    AnketTmpTablePRIORNATIONALITY: TStringField;
    AnketTmpTableSEX: TStringField;
    AnketTmpTableMARRIED: TStringField;
    AnketTmpTableSPOUSENAME: TStringField;
    AnketTmpTableSPOUSESURNAME: TStringField;
    AnketTmpTableSPOUSEOLDSURNAME: TStringField;
    AnketTmpTableSPOUSEFIRSTNAME: TStringField;
    AnketTmpTableSPOUSESECONDNAME: TStringField;
    AnketTmpTableSPOUSEOLDSECONDNAME: TStringField;
    AnketTmpTableSPOUSEBIRTHDATE: TStringField;
    AnketTmpTableSPOUSEBIRTHLOCALITY: TStringField;
    AnketTmpTableSPOUSEBIRTHCOUNTRY: TStringField;
    AnketTmpTableSPOUSENATIONALITY: TStringField;
    AnketTmpTablePROFESSION: TStringField;
    AnketTmpTableOCCUPATION: TStringField;
    AnketTmpTableEMPLOYER: TStringField;
    AnketTmpTableEMPLADDRESS: TStringField;
    AnketTmpTableEMPLPHONE: TStringField;
    AnketTmpTableDESTINATION: TStringField;
    AnketTmpTableSHENGENENTRY: TStringField;
    AnketTmpTableARRIVECUSTOM: TStringField;
    AnketTmpTableDEPARTCUSTOM: TStringField;
    AnketTmpTableGARANT: TStringField;
    AnketTmpTableGARANTADDRESS: TStringField;
    AnketTmpTableADDRESSTO: TStringField;
    AnketTmpTableREFERENCE: TStringField;
    AnketTmpTableTRAVELOBJECT: TStringField;
    AnketTmpTableDURATIONFROM: TStringField;
    AnketTmpTableDURATIONTO: TStringField;
    AnketTmpTableDRIVEKIND: TStringField;
    AnketTmpTableLASTVISITDATE: TStringField;
    AnketTmpTableLASTEMBASSYDATE: TStringField;
    AnketTmpTableDESTCOUNTRY: TStringField;
    AnketTmpTableVISAKIND: TStringField;
    AnketTmpTableVISAPERIOD: TStringField;
    AnketTmpTableNATIONALVISA: TStringField;
    AnketTmpTableENDDESTINATION: TStringField;
    AnketTmpTableENDVISA: TStringField;
    AnketTmpTableBIRTHDATE: TStringField;
    AnketTmpTablePARENTSCYR: TStringField;
    AnketTmpTablePARENTSLAT: TStringField;
    AnketTmpTableCHILDNAME: TStringField;
    AnketTmpTableCHILDSURNAME: TStringField;
    AnketTmpTableCHILDFIRSTNAME: TStringField;
    AnketTmpTableCHILDSECONDNAME: TStringField;
    AnketTmpTableCHILDBIRTHDATE: TStringField;
    AnketTmpTableCHILDBIRTHLOCALITY: TStringField;
    AnketTmpTableCHILDNATIONALITY: TStringField;
    AnketTmpTableRETURNVISA1: TStringField;
    AnketTmpTableRETURNVISA1NO: TStringField;
    AnketTmpTableRETURNVISA1DATE: TStringField;
    AnketTmpTableRETURNVISA2: TStringField;
    AnketTmpTableRETURNVISA2NO: TStringField;
    AnketTmpTableRETURNVISA2DATE: TStringField;
    AnketTmpTableOTHERINFO: TStringField;
    AnketTmpTableGARANTNATIONALITY: TStringField;
    AnketTmpTableHASMONEY: TStringField;
    AnketTmpTableENDVISAKIND: TStringField;
    AnketTmpTableENDVISANO: TStringField;
    AnketTmpTableENDVISADATE: TStringField;
    AnketTmpTableENDVISAISSUE: TStringField;
    AnketTmpTableLASTEMBASSYFILTER: TSmallintField;
    AnketTmpTableLASTVISITFILTER: TSmallintField;
    AnketTmpTableDOCUMENTS: TMemoField;
    AnketTmpQry: TQuery;
    AnketTmpQryCOUNTRYID: TIntegerField;
    AnketTmpQryTOURISTTEMPLATEID: TIntegerField;
    AnketTmpQryNAME: TStringField;
    OrdrCntryQrySrc: TDataSource;
    OrdrCntryQry: TQuery;
    OrdrCntryQryORDERID: TIntegerField;
    OrdrCntryQryORDERCNTRYID: TIntegerField;
    OrdrCntryQryCOUNTRYID: TIntegerField;
    OrdrCntryQryNAME: TStringField;
    OrdrCntryQryNEEDVISA: TStringField;
    OrdrCntryQryFLAG: TBlobField;
    OrdrCntryQryDOCUMENTS: TMemoField;
    OrdrCntryQryCalcNeedVisa: TStringField;
    OrdrCntryTable: TTable;
    OrdrCntryTableORDERID: TIntegerField;
    OrdrCntryTableORDERCNTRYID: TAutoIncField;
    OrdrCntryTableCOUNTRYID: TIntegerField;
    PersVisaTable: TTable;
    PersVisaSrc: TDataSource;
    PersVisaProc: TStoredProc;
    RouteSelQry: TQuery;
    RouteSelSrc: TDataSource;
    RouteSelQryRouteId: TIntegerField;
    RouteSelQryFromCity: TIntegerField;
    RouteSelQryArriveCity: TIntegerField;
    RouteSelQryDriveKind: TIntegerField;
    RouteSelQryFromName: TStringField;
    RouteSelQryArriveName: TStringField;
    RouteSelQryDriveName: TStringField;
    RouteSelQrySTRANGER: TStringField;
    RouteSelQryTransit: TMemoField;
    RouteSelQryCalcTransit: TStringField;
    SetOrderStateProc: TStoredProc;
    TripSumProc: TStoredProc;
    HotelSumProc: TStoredProc;
    ToursTable: TTable;
    ToursSrc: TDataSource;
    ToursTableID: TIntegerField;
    ToursTableTOURNAME: TStringField;
    ToursTableMEMO: TMemoField;
    FontDialog: TFontDialog;
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
    BrowseImgList: TImageList;
    EditorImgList: TImageList;
    NavigateImgList: TImageList;
    MainImgList: TImageList;
    GroupQry: TQuery;
    GroupQrySrc: TDataSource;
    GroupQryTOURNAME: TStringField;
    GroupQryTOURID: TIntegerField;
    GroupQryTOURGROUPID: TIntegerField;
    GroupQryTOURDATE: TDateTimeField;
    GroupQryMAXPERSON: TIntegerField;
    ClientQry: TQuery;
    ClientQryCLIENTID: TIntegerField;
    ClientQryMEMO: TMemoField;
    ClientQryNAME: TStringField;
    ClientQryCONTACT: TStringField;
    ClientQryPROVINCE: TStringField;
    ClientQryTOWNSHIP: TStringField;
    ClientQryCITYKIND: TSmallintField;
    ClientQryCITY: TStringField;
    ClientQrySTRKIND: TSmallintField;
    ClientQryADDRESS: TStringField;
    ClientQryHOUSE: TStringField;
    ClientQryTENEMENT: TStringField;
    ClientQryZIPCODE: TStringField;
    ClientQryCOUNTRYID: TIntegerField;
    ClientQryCNTRYCODE: TStringField;
    ClientQryAREACODE: TStringField;
    ClientQryPHONENO: TStringField;
    ClientQryEXTENTION: TStringField;
    ClientQryMOBILHONE: TStringField;
    ClientQryHOMEPHONE: TStringField;
    ClientQryE_MAIL: TStringField;
    ClientQryFAXCNTRY: TStringField;
    ClientQryFAXAREA: TStringField;
    ClientQryFAXNO: TStringField;
    ClientQryFAXEXT: TStringField;
    ClientTableCOMPANYID: TIntegerField;
    ClientTableCONTACTID: TIntegerField;
    ClientTableHOMEPHONEID: TIntegerField;
    ClientTableWORKPHONEID: TIntegerField;
    ClientTableMOBILPHONEID: TIntegerField;
    ClientTableFAXID: TIntegerField;
    ClientTableEMAILID: TIntegerField;
    ClientTablePAGERID: TIntegerField;
    ClientTablePAGERNO: TStringField;
    ClientTableOFFICEID: TIntegerField;
    ClientTableMEMO: TMemoField;
    ClientQryCalcWorkPhone: TStringField;
    ClientQryCalcFax: TStringField;
    ClientQryISENTERPR: TStringField;
    ClientQryCalcPhone: TStringField;
    RoutVendorQryROUTEID: TIntegerField;
    RoutVendorQryROUTEVENDORID: TIntegerField;
    RoutVendorQryVENDORID: TIntegerField;
    RoutVendorQryNAME: TStringField;
    RoutVendorQryISENTERPR: TStringField;
    HtlVendorQryHOTELID: TIntegerField;
    HtlVendorQryHOTELVENDORID: TIntegerField;
    HtlVendorQryVENDORID: TIntegerField;
    HtlVendorQryNAME: TStringField;
    HtlVendorQryISENTERPR: TStringField;
    ClientQryCOMPANYID: TIntegerField;
    ClientSrc: TDataSource;
    ClientTableCLIENTID: TAutoIncField;
    TouristTable: TTable;
    TouristTableSURNAME: TStringField;
    TouristTableNAME: TStringField;
    TouristTableSECONDNAME: TStringField;
    TouristTableFIRSTNAME: TStringField;
    TouristTableBIRTHDATE: TDateTimeField;
    TouristTablePASSPORTNO: TStringField;
    TouristTablePASSPORTDATE: TDateTimeField;
    TouristTablePASSPORTEXPIRE: TDateTimeField;
    TouristTablePASSPORTKIND: TSmallintField;
    TouristTableZIPCODE: TStringField;
    TouristTableCITYKIND: TSmallintField;
    TouristTableCITY: TStringField;
    TouristTablePROVINCE: TStringField;
    TouristTableTOWNSHIP: TStringField;
    TouristTableSTRKIND: TSmallintField;
    TouristTableADDRESS: TStringField;
    TouristTableHOUSE: TStringField;
    TouristTableTENEMENT: TStringField;
    TouristTableHOMEPHONE: TStringField;
    TouristTableWORKPHONE: TStringField;
    TouristTableADDITPHONE: TStringField;
    TouristTableCOUNTRYID: TIntegerField;
    TouristTableASCHILDID: TIntegerField;
    TouristTableCLIENTID: TAutoIncField;
    SheduleTableSHEDULENAME: TStringField;
    RouteStopsQrySHEDITEMID: TIntegerField;
    RouteStopsQryDIRECTION: TSmallintField;
    RouteStopsQryNAME: TStringField;
    LookPersonQrySrc: TDataSource;
    RouteStopsQrySrc: TDataSource;
    TripByOrderQryFROMCITY: TStringField;
    TripByOrderQryARRIVECITY: TStringField;
    TripByOrderQrySTRANGER: TStringField;
    TripByOrderQryTRANSIT: TStringField;
    TripByOrderQryDRIVEID: TIntegerField;
    TripByOrderQryDRIVEKIND: TStringField;
    TripByOrderQryDRIVEMODEL: TStringField;
    TripByOrderQryPCOUNT: TIntegerField;
    TripQueryDRIVEKIND: TStringField;
    TripQueryDRIVEMODEL: TStringField;
    TripQueryFROMCITY: TStringField;
    TripQueryARRIVECITY: TStringField;
    TripQueryPCOUNT: TIntegerField;
    TripQuerySTRANGER: TStringField;
    TripQueryTRANSIT: TStringField;
    TripQueryROUTEID: TIntegerField;
    PlaceByTripQry: TQuery;
    PlaceByTripQryLEAVINGID: TIntegerField;
    PlaceByTripQryPLACEID: TIntegerField;
    PlaceByTripQryPLACENO: TStringField;
    PlaceByTripQryPLACECLASS: TSmallintField;
    PlaceByTripQrySTATE: TSmallintField;
    PlaceByTripQryORDERID: TIntegerField;
    PlaceByTripQryCLIENTNAME: TStringField;
    PlaceByTripQryTOURISTNAME: TStringField;
    PlaceByTripQrySTARTPOINT: TStringField;
    PlaceByTripQrySTOPPOINT: TStringField;
    PlaceByTripQryRATE: TFloatField;
    PlaceByTripQryRATE2: TFloatField;
    PlaceByTripQryDISCOUNT: TFloatField;
    PlaceByTripQryDISCOUNT2: TFloatField;
    PlaceByTripQryINCREASE: TFloatField;
    PlaceByTripQryINCREASE2: TFloatField;
    PlaceByTripQryPERSONID: TIntegerField;
    PlaceByTripQrySTARTPOINTID: TIntegerField;
    PlaceByTripQrySTOPPOINTID: TIntegerField;
    PlaceByTripQryTOURISTBIRTHDATE: TDateTimeField;
    TripByOrderQryDCOUNT: TSmallintField;
    TripQueryDCOUNT: TIntegerField;
    OrderAnnulProc: TStoredProc;
    RoomingQryROOMINGID: TIntegerField;
    RoomingQryTOURISTNAME: TStringField;
    RoomingQryTOURISTBIRTHDATE: TDateTimeField;
    RoomingQryROOMNAME: TStringField;
    RoomingQryROOMCAPACITY: TIntegerField;
    RoomingQryFEEDTYPE: TStringField;
    RoomingQryORDERID: TIntegerField;
    RoomingQryPERSONID: TIntegerField;
    RoomingQryTOURISTPASSPORT: TStringField;
    PersResortQry: TQuery;
    PersResortQrySrc: TDataSource;
    PersResortTable: TTable;
    PersResortQryORDERID: TIntegerField;
    PersResortQryRESORTTAXID: TIntegerField;
    PersResortQryPERSONID: TIntegerField;
    PersResortQryVOUCHERNO: TStringField;
    PersResortQryRESORTTAX: TFloatField;
    PersResortQryCURR2ID: TIntegerField;
    PersResortQryFROMDATE: TDateTimeField;
    PersResortQryDAYCOUNT: TSmallintField;
    PersResortQryTOURISTNAME: TStringField;
    PersResortQryPASSPORTNO: TStringField;
    PersResortQryBIRTHDATE: TDateTimeField;
    PersResortQryRESORTNAME: TStringField;
    PersResortTableORDERID: TIntegerField;
    PersResortTableRESORTCITYID: TIntegerField;
    PersResortTablePERSONID: TIntegerField;
    PersResortTableVOUCHERNO: TStringField;
    PersResortTableRESORTTAX: TFloatField;
    PersResortTableCURR2ID: TIntegerField;
    PersResortTableFROMDATE: TDateTimeField;
    PersResortTableDAYCOUNT: TSmallintField;
    PersResortTableRESORTTAXID: TAutoIncField;
    RoomingTableSTATE: TSmallintField;
    RoomingTableORDERID: TIntegerField;
    RoomingTableCURR2ID: TIntegerField;
    PlaceMapTableCURR2ID: TIntegerField;
    GuideLstQry: TQuery;
    GuideLstQryLEAVEDATE: TDateTimeField;
    GuideLstQryPLACENO: TStringField;
    GuideLstQryTOURISTNAME: TStringField;
    GuideLstQryTOURISTBIRTHDATE: TDateTimeField;
    GuideLstQryCLIENTNAME: TStringField;
    GuideLstQryTRIPTOTAL2: TFloatField;
    GuideLstQryTRIPPAID2: TFloatField;
    GuideLstQryHOTELTOTAL2: TFloatField;
    GuideLstQryHOTELPAID2: TFloatField;
    GuideLstQryTRANSFERTOTAL2: TFloatField;
    GuideLstQryTRANSFERPAID2: TFloatField;
    GuideLstQryINSURETOTAL: TFloatField;
    GuideLstQryINSUREPAID: TFloatField;
    GuideLstQryFIRMTOTAL: TFloatField;
    GuideLstQryFIRMPAID: TFloatField;
    GuideLstQryRESORTTOTAL2: TFloatField;
    GuideLstQryRESORTPAID2: TFloatField;
    GuideLstQryTOTALPAID: TFloatField;
    GuideLstQryTOTALPAID2: TFloatField;
    GuideLstQryPERSONID: TIntegerField;
    GuideLstQrySTOPPOINT: TStringField;
    GuideLstQryCalcDue: TCurrencyField;
    GuideLstQryCalcDue2: TCurrencyField;
    PersVoucherQry: TQuery;
    PersVoucherQryRESORTTAXID: TIntegerField;
    PersVoucherQryPERSONID: TIntegerField;
    PersVoucherQryRESORTTAX: TFloatField;
    PersVoucherQryFROMDATE: TDateTimeField;
    PersVoucherQryDAYCOUNT: TSmallintField;
    PersVoucherQryRESORTNAME: TStringField;
    PersVoucherQryHOTELNAME: TStringField;
    PersVoucherQryHOTELSTARS: TStringField;
    PersVoucherQryTOURISTNAMEEN: TStringField;
    PersVoucherQryBIRTHDATE: TDateTimeField;
    PersVoucherQryPASSPORTNO: TStringField;
    PersVoucherQryFRWDRIVEKIND: TStringField;
    PersVoucherQryBKWDRIVEKIND: TStringField;
    PersVoucherQryROOMTYPE: TStringField;
    PersVoucherQryFEEDTYPE: TStringField;
    PersVoucherQryROOMCAPACITY: TSmallintField;
    PersResortQryTOURISTNAMEEN: TStringField;
    WordApplic: TWordApplication;
    WordDocument: TWordDocument;
    WordFont: TWordFont;
    WordParaFormat: TWordParagraphFormat;
    LookPersonQryTOURISTNAME: TStringField;
    PersResortTableLookTouristBirthDate: TDateField;
    TripByOrderQrySHEDULEID: TIntegerField;
    TripQuerySHEDULEID: TIntegerField;
    PersonQryTOURISTNAME: TStringField;
    OrderLstQry: TQuery;
    OrderLstQryPERSONID: TIntegerField;
    OrderLstQryTOURISTNAME: TStringField;
    OrderLstQryTOURISTBIRTHDATE: TDateTimeField;
    OrderLstQryTRIPTOTAL: TFloatField;
    OrderLstQryTRIPTOTAL2: TFloatField;
    OrderLstQryHOTELTOTAL: TFloatField;
    OrderLstQryHOTELTOTAL2: TFloatField;
    OrderLstQryTRANSFERTOTAL: TFloatField;
    OrderLstQryTRANSFERTOTAL2: TFloatField;
    OrderLstQryVISATOTAL: TFloatField;
    OrderLstQryVISATOTAL2: TFloatField;
    OrderLstQryEXCURSIONTOTAL: TFloatField;
    OrderLstQryEXCURSIONTOTAL2: TFloatField;
    OrderLstQryINSURETOTAL: TFloatField;
    OrderLstQryFIRMTOTAL: TFloatField;
    OrderLstQryRESORTTOTAL: TFloatField;
    OrderLstQryRESORTTOTAL2: TFloatField;
    OrderLstQryTOTALPAID: TFloatField;
    OrderLstQryTOTALPAID2: TFloatField;
    OrderLstQryCOUNTRYNAME: TStringField;
    OrderLstQryRESORTNAME: TStringField;
    OrderLstQryHOTELNAME: TStringField;
    OrderLstQryHOTELNIGHTCOUNT: TIntegerField;
    OrderLstQryROOMTYPE: TStringField;
    OrderLstQryFEEDTYPE: TStringField;
    OrderLstQryDRIVEKIND: TStringField;
    OrderLstQryFRWDATE: TDateTimeField;
    OrderLstQryBKWDATE: TDateTimeField;
    OrderLstQryFRWPLACENO: TStringField;
    OrderLstQryBKWPLACENO: TStringField;
    OrderLstQryFRWSTOPPOINT: TStringField;
    OrderLstQryBKWSTOPPOINT: TStringField;
    TripLstQry: TQuery;
    TripLstQryLEAVINGID: TIntegerField;
    TripLstQryPLACEID: TIntegerField;
    TripLstQryPLACENO: TStringField;
    TripLstQryORDERID: TIntegerField;
    TripLstQryCLIENTNAME: TStringField;
    TripLstQryPERSONID: TIntegerField;
    TripLstQryTOURISTNAME: TStringField;
    TripLstQryTOURISTNAMEEN: TStringField;
    TripLstQryTOURISTBIRTHDATE: TDateTimeField;
    TripLstQryTOURISTPASSPORT: TStringField;
    TripLstQrySTARTPOINT: TStringField;
    TripLstQrySTOPPOINT: TStringField;
    TripLstQryFROMDATE: TDateTimeField;
    TripLstQryDAYCOUNT: TSmallintField;
    TripLstQryRESORTNAME: TStringField;
    TripLstQryHOTELNAME: TStringField;
    TripLstQryVOUCHERNO: TStringField;
    TripLstQryRETURNDATE: TDateTimeField;
    TripLstQryBKWPLACENO: TStringField;
    TripLstQryTRIPTOTAL: TFloatField;
    TripLstQryTRIPTOTAL2: TFloatField;
    TripLstQryHOTELTOTAL: TFloatField;
    TripLstQryHOTELTOTAL2: TFloatField;
    TripLstQryTRANSFERTOTAL: TFloatField;
    TripLstQryTRANSFERTOTAL2: TFloatField;
    TripLstQryVISATOTAL: TFloatField;
    TripLstQryVISATOTAL2: TFloatField;
    TripLstQryEXCURSIONTOTAL: TFloatField;
    TripLstQryEXCURSIONTOTAL2: TFloatField;
    TripLstQryINSURETOTAL: TFloatField;
    TripLstQryFIRMTOTAL: TFloatField;
    TripLstQryRESORTTOTAL: TFloatField;
    TripLstQryRESORTTOTAL2: TFloatField;
    TripLstQryTOTALPAID: TFloatField;
    TripLstQryTOTALPAID2: TFloatField;
    TripLstQryMEMO: TMemoField;
    PlaceMapTableLookTouristBirthDate: TDateField;
    UsersTable: TTable;
    UsersSrc: TDataSource;
    UsersTableTMUSERID: TIntegerField;
    UsersTableTMUSERNAME: TStringField;
    UsersTableTMLOGIN: TStringField;
    UsersTableTMNAME2: TStringField;
    UsersTableTMPERMLEVEL: TIntegerField;
    OrderTableMANAGERID: TIntegerField;
    OrderTableLookManager: TStringField;
    OrderBillTableMANAGERID: TIntegerField;
    PersResortQryRESORTCITYID: TIntegerField;
    OrderQuery: TQuery;
    OrderQueryORDERID: TIntegerField;
    OrderQueryDATEANDTIME: TDateTimeField;
    OrderQueryCLIENTID: TIntegerField;
    OrderQueryRESERVTO: TDateTimeField;
    OrderQueryAREPERSONS: TStringField;
    OrderQuerySTATE: TSmallintField;
    OrderQueryMEMO: TMemoField;
    OrderQueryTOURID: TIntegerField;
    OrderQueryISGROUPED: TStringField;
    OrderQueryTOURGROUPID: TIntegerField;
    OrderQueryORDTRIP: TStringField;
    OrderQueryORDHOTEL: TStringField;
    OrderQueryORDRESORT: TStringField;
    OrderQueryORDINSURE: TStringField;
    OrderQueryORDTRANSFER: TStringField;
    OrderQueryORDVISA: TStringField;
    OrderQueryORDFIRMTAX: TStringField;
    OrderQueryCLIENTNAME: TStringField;
    OrderQueryCLIENTISENTERPR: TStringField;
    OrderQueryCLIENTCONTACT: TStringField;
    OrderQueryCLIENTPHONENO: TStringField;
    OrderQueryCLIENTFAXNO: TStringField;
    OrderQueryCLIENTHOMEPHONE: TStringField;
    OrderQueryCLIENTE_MAIL: TStringField;
    OrderQueryMANAGER: TStringField;
    OrderQueryCalcState: TStringField;
    PersonQryCalcDue: TCurrencyField;
    PersonQryCalcDue2: TCurrencyField;
    OrderBillTableRETURNED: TStringField;
    OrderBillTablePERSONID: TIntegerField;
    OrdRetPayProc: TStoredProc;
    RoomingQryCalcToDate: TDateTimeField;
    NoneVisaProc: TStoredProc;
    OrderBillTableCalcPaid: TCurrencyField;
    PlaceByTripQryCalcDue: TCurrencyField;
    PlaceByTripQryCalcDue2: TCurrencyField;
    PersVisaQry: TQuery;
    PersVisaQryTOURISTNAME: TStringField;
    PersVisaQryBIRTHDATE: TDateTimeField;
    PersVisaQryHOMEPHONE: TStringField;
    PersVisaQryORDERCNTRYID: TIntegerField;
    PersVisaQryPERSVISAID: TIntegerField;
    PersVisaQryNEEDVISA: TStringField;
    PersVisaQryANKETSTATE: TSmallintField;
    PersVisaQryDOCUMSTATE: TSmallintField;
    PersVisaQryDOCUMLIST: TMemoField;
    PersVisaQryVISATAX: TFloatField;
    PersVisaQryVISATAX2: TFloatField;
    PersVisaQryCURRENCYSHORT: TStringField;
    PersVisaQryCalcAnketState: TStringField;
    PersVisaQryCalcDocumState: TStringField;
    PersVisaQryCalcNeedVisa: TStringField;
    PersVisaQryFROMDATE: TDateTimeField;
    PersVisaQryTODATE: TDateTimeField;
    PersVisaQryVISAKIND: TStringField;
    PersVisaQryVISANO: TStringField;
    PersVisaTableORDERID: TIntegerField;
    PersVisaTableORDERCNTRYID: TIntegerField;
    PersVisaTablePERSONID: TIntegerField;
    PersVisaTableNEEDVISA: TStringField;
    PersVisaTableANKETSTATE: TSmallintField;
    PersVisaTableDOCUMSTATE: TSmallintField;
    PersVisaTableDOCUMLIST: TMemoField;
    PersVisaTableVISATAX: TFloatField;
    PersVisaTableVISATAX2: TFloatField;
    PersVisaTableCURR2ID: TIntegerField;
    PersVisaTableFROMDATE: TDateTimeField;
    PersVisaTableTODATE: TDateTimeField;
    PersVisaTableVISAKIND: TStringField;
    PersVisaTableVISANO: TStringField;
    PersVisaTableLookBirthDate: TDateField;
    VisaSumProc: TStoredProc;
    OrdOtherQry: TQuery;
    OrdOtherQrySrc: TDataSource;
    PersOtherQry: TQuery;
    PersOtherSrc: TDataSource;
    VisaSumQry: TQuery;
    VisaSumQrySrc: TDataSource;
    VisaSumQryCURRENCYSHORT: TStringField;
    VisaSumQryRATE: TFloatField;
    VisaSumQryCURRENCYNAME: TStringField;
    OtherSumQry: TQuery;
    OtherSumQrySrc: TDataSource;
    OrdOtherQryORDERID: TIntegerField;
    OrdOtherQrySERVCODEID: TIntegerField;
    OrdOtherQrySERVNAME: TStringField;
    OrdOtherQryORDERINCATEGORY: TIntegerField;
    OrdOtherQryCOUNT: TIntegerField;
    PersOtherQryTOURISTNAME: TStringField;
    PersOtherQryBIRTHDATE: TDateTimeField;
    PersOtherQryHOMEPHONE: TStringField;
    PersOtherQryORDERID: TIntegerField;
    PersOtherQryOTHERSERVID: TIntegerField;
    PersOtherQrySERVCODEID: TIntegerField;
    PersOtherQryRATE: TFloatField;
    PersOtherQryRATE2: TFloatField;
    PersOtherQryCURRENCYSHORT: TStringField;
    OtherSumQryCURRENCYNAME: TStringField;
    OtherSumQryCURRENCYSHORT: TStringField;
    OtherSumQryRATE: TFloatField;
    PersOtherQrySERVDATA: TMemoField;
    PersOtherQryCalcServData: TStringField;
    OtherSumProc: TStoredProc;
    PersOtherTable: TTable;
    PersOtherTableORDERID: TIntegerField;
    PersOtherTablePERSONID: TIntegerField;
    PersOtherTableSERVCODEID: TIntegerField;
    PersOtherTableSERVDATA: TMemoField;
    PersOtherTableRATE: TFloatField;
    PersOtherTableRATE2: TFloatField;
    PersOtherTableCURR2ID: TIntegerField;
    PersOtherTableLookBirthDate: TDateField;
    PersVisaTableVISAFOR: TSmallintField;
    PersVisaTableENTRYCOUNT: TStringField;
    PersVisaQryVISAFOR: TSmallintField;
    PersVisaQryENTRYCOUNT: TStringField;
    PersOtherTableOTHERSERVID: TAutoIncField;
    PersonQryOTHERTOTAL2: TFloatField;
    PersonQryOTHERPAID2: TFloatField;
    TripLstQryOTHERTOTAL2: TFloatField;
    GuideLstQryOTHERTOTAL2: TFloatField;
    GuideLstQryOTHERPAID2: TFloatField;
    OrderLstQryOTHERTOTAL2: TFloatField;
    PersonTableOTHERTOTAL2: TCurrencyField;
    PersonTableOTHERPAID2: TCurrencyField;
    HotelQry: TQuery;
    HotelQryCITYID: TIntegerField;
    HotelQryHOTELID: TIntegerField;
    HotelQryNAME: TStringField;
    HotelQrySTARS: TStringField;
    HotelQryHOTELKIND: TSmallintField;
    HotelQryCITY: TStringField;
    HotelQryHOTELGROUP: TStringField;
    HotelQryHOTELCATEGORY: TStringField;
    HotelQryGROUPID: TIntegerField;
    HotelQryCATEGORYID: TIntegerField;
    RouteQry: TQuery;
    RouteQryROUTEID: TIntegerField;
    RouteQryDRIVEKIND: TIntegerField;
    RouteQryKIND: TStringField;
    RouteQryFROMCITY: TIntegerField;
    RouteQryARRIVECITY: TIntegerField;
    RouteQryDEPART: TStringField;
    RouteQryARRIVE: TStringField;
    RouteQryCOUNTRYID: TIntegerField;
    RouteQryTRANSIT: TMemoField;
    RouteQrySTRANGER: TStringField;
    RouteQryCalcText: TStringField;
    RouteQryCalcTransit: TStringField;
    RouteQryCalcIsVoyage: TStringField;
    ResortSumQry: TQuery;
    ResortSumQrySrc: TDataSource;
    DriveMapQry: TQuery;
    DriveMapQryDRIVEID: TIntegerField;
    DriveMapQryDRIVEKIND: TIntegerField;
    DriveMapQryMAP: TMemoField;
    ResortSumQryCURRENCYNAME: TStringField;
    ResortSumQryCURRENCYSHORT: TStringField;
    ResortSumQryRATE: TFloatField;
    InsureSumQry: TQuery;
    InsureSumQrySrc: TDataSource;
    TripSumQry: TQuery;
    TripSumQrySrc: TDataSource;
    TripSumQryCURRENCYNAME: TStringField;
    TripSumQryCURRENCYSHORT: TStringField;
    TripSumQryRATE: TFloatField;
    HotelSumQry: TQuery;
    HotelSumQrySrc: TDataSource;
    HotelSumQryCURRENCYNAME: TStringField;
    HotelSumQryCURRENCYSHORT: TStringField;
    HotelSumQryRATE: TFloatField;
    InsureSumQryCURRENCYNAME: TStringField;
    InsureSumQryCURRENCYSHORT: TStringField;
    InsureSumQryCalcRate: TFloatField;
    PersonPayQry: TQuery;
    PersonPayQrySrc: TDataSource;
    PersonPayQryTOURISTNAME: TStringField;
    PersonPayQryBIRTHDATE: TDateTimeField;
    PersonPayQryORDERID: TIntegerField;
    PersonPayQryPERSONID: TIntegerField;
    PersonPayQryCURRID: TIntegerField;
    PersonPayQryTRIPTOTAL: TFloatField;
    PersonPayQryHOTELTOTAL: TFloatField;
    PersonPayQryTRANSFERTOTAL: TFloatField;
    PersonPayQryVISATOTAL: TFloatField;
    PersonPayQryEXCURSIONTOTAL: TFloatField;
    PersonPayQryRESORTTOTAL: TFloatField;
    PersonPayQryINSURETOTAL: TFloatField;
    PersonPayQryOTHERTOTAL: TFloatField;
    PersonPayQryTRIPPAID: TFloatField;
    PersonPayQryHOTELPAID: TFloatField;
    PersonPayQryTRANSFERPAID: TFloatField;
    PersonPayQryVISAPAID: TFloatField;
    PersonPayQryEXCURSIONPAID: TFloatField;
    PersonPayQryRESORTPAID: TFloatField;
    PersonPayQryINSUREPAID: TFloatField;
    PersonPayQryOTHERPAID: TFloatField;
    PersonPayQryCalcDue: TCurrencyField;
    PersonPayQryTOTAL: TFloatField;
    PersonPayQryPAID: TFloatField;
    PersonPayTable: TTable;
    PersonPayTableORDERID: TIntegerField;
    PersonPayTablePERSONID: TIntegerField;
    PersonPayTableCURRID: TIntegerField;
    PersonPayTableTRIPTOTAL: TFloatField;
    PersonPayTableHOTELTOTAL: TFloatField;
    PersonPayTableTRANSFERTOTAL: TFloatField;
    PersonPayTableVISATOTAL: TFloatField;
    PersonPayTableEXCURSIONTOTAL: TFloatField;
    PersonPayTableINSURETOTAL: TFloatField;
    PersonPayTableRESORTTOTAL: TFloatField;
    PersonPayTableOTHERTOTAL: TFloatField;
    PersonPayTableTRIPPAID: TFloatField;
    PersonPayTableHOTELPAID: TFloatField;
    PersonPayTableTRANSFERPAID: TFloatField;
    PersonPayTableVISAPAID: TFloatField;
    PersonPayTableEXCURSIONPAID: TFloatField;
    PersonPayTableINSUREPAID: TFloatField;
    PersonPayTableRESORTPAID: TFloatField;
    PersonPayTableOTHERPAID: TFloatField;
    PersonPayTableTOTAL: TFloatField;
    PersonPayTablePAID: TFloatField;
    OrderPayQry: TQuery;
    OrderPayQrySrc: TDataSource;
    OrderPayQryCURRENCYNAME: TStringField;
    OrderPayQryCURRENCYSHORT: TStringField;
    OrderPayQryTOTAL: TFloatField;
    OrderPayQryPAID: TFloatField;
    OrderPayQryCalcDue: TCurrencyField;
    PersOtherQryPERSONID: TIntegerField;
    ResortSumProc: TStoredProc;
    InsureSumProc: TStoredProc;
    PersonPayTablePERSONACCNTID: TIntegerField;
    PersonPayQryPERSONACCNTID: TIntegerField;
    OrderPayQryCURRENCYID: TIntegerField;
    OrderPayQryINDUE: TFloatField;
    RoomingQryCURRENCYSHORT: TStringField;
    PlaceByTripQryCURRENCYSHORT: TStringField;
    OrderTableINSUREDISCTYPE: TIntegerField;
    PersInsureQry: TQuery;
    PersInsureQryCalcToDate: TDateTimeField;
    PersInsureQryORDERID: TIntegerField;
    PersInsureQryINSUREID: TIntegerField;
    PersInsureQryPERSONID: TIntegerField;
    PersInsureQryFROMDATE: TDateTimeField;
    PersInsureQryDAYCOUNT: TSmallintField;
    PersInsureQryTOURISTNAME: TStringField;
    PersInsureQryBIRTHDATE: TDateTimeField;
    OrdInsureQryORDERID: TIntegerField;
    OrdInsureQryINSUREKIND: TIntegerField;
    OrdInsureQryKINDNAME: TStringField;
    OrdInsureQryORDERINCATEGORY: TIntegerField;
    OrdInsureQryCOUNT: TIntegerField;
    InsureSumQryPAY: TFloatField;
    PersInsureQryINSUREKIND: TIntegerField;
    PersInsureQryPOLICESE: TStringField;
    PersInsureQryPOLICENO: TStringField;
    PersInsureQryINSUREVALUE: TFloatField;
    PersInsureQryRATE: TFloatField;
    PersInsureQryPAY: TFloatField;
    PersInsureQryCURR: TStringField;
    PersInsureTableINSUREKIND: TIntegerField;
    PersInsureTablePOLICEVEND: TIntegerField;
    PersInsureTablePOLICESE: TStringField;
    PersInsureTablePOLICENO: TStringField;
    PersInsureTableRATE: TFloatField;
    PersInsureTablePAY: TFloatField;
    PersInsureTableINSUREVALUEID: TIntegerField;
    PoliceTrashProc: TStoredProc;
    PersInsureQryPOLICEVEND: TIntegerField;
    PoliceBreakProc: TStoredProc;
    PersInsureQryBREAKED: TStringField;
    PersVisaTableARRIVECUSTOM: TStringField;
    PersVisaTableDEPARTCUSTOM: TStringField;
    PersVisaTableGARANT: TStringField;
    PersVisaTableGARANTADDRESS: TStringField;
    PersVisaTableADDRESSTO: TStringField;
    PersVisaTableREFERENCE: TStringField;
    PersVisaTableTRAVELOBJECT: TStringField;
    PersVisaTableDRIVEKIND: TStringField;
    PersVisaTableGARANTPHONE: TStringField;
    PersVisaTableWRITEDATE: TDateTimeField;
    PersVisaQryTOURISTID: TIntegerField;
    PersVisaTablePERSVISAID: TAutoIncField;
    AnketTableEMPLHOUSE: TStringField;
    AnketTableEMPLCITY: TStringField;
    AnketTableEMPLZIPCODE: TStringField;
    PersVisaTableLASTVISITDATE: TDateTimeField;
    PersVisaTableLASTEMBASSYDATE: TDateTimeField;
    PersVisaTableGARANTSURNAME: TStringField;
    PersVisaTableGARANTNAME: TStringField;
    PersVisaTableGARANTHOUSE: TStringField;
    PersVisaTableGARANTCITY: TStringField;
    PersVisaTableGARANTZIPCODE: TStringField;
    PersVisaTableADDRTOHOUSE: TStringField;
    PersVisaTableADDRTOCITY: TStringField;
    PersVisaTableADDRTOZIPCODE: TStringField;
    PersVisaTableDESTINATION: TStringField;
    PersVisaTableSHENGENENTRY: TStringField;
    procedure DMCreate(Sender: TObject);
    procedure OrderQueryCalcFields(DataSet: TDataSet);
    procedure OrderTableBeforeOpen(DataSet: TDataSet);
    procedure OrderTableAfterOpen(DataSet: TDataSet);
    procedure OrderTableNewRecord(DataSet: TDataSet);
    procedure OrderTableAfterScroll(DataSet: TDataSet);
    procedure OrderTableCalcFields(DataSet: TDataSet);
    procedure OrderTableDiscountChange(Sender: TField);
    procedure OrderTableDiscount2Change(Sender: TField);
    procedure OrderTableDiscountValueChange(Sender: TField);
    procedure OrderTableDiscountValue2Change(Sender: TField);
    procedure OrderBillTableNewRecord(DataSet: TDataSet);
    procedure OrderBillTableCalcFields(DataSet: TDataSet);
    procedure ClientTableCalcFields(DataSet: TDataSet);
    procedure ClientTableNameValidate(Sender: TField);
    procedure ClientTableBeforePost(DataSet: TDataSet);
    procedure ClientQryCalcFields(DataSet: TDataSet);
    procedure VendorTableNameValidate(Sender: TField);
    procedure VendorTableCalcFields(DataSet: TDataSet);
    procedure TouristTableAfterOpen(DataSet: TDataSet);
    procedure TouristTablePASSPORTDATEChange(Sender: TField);
    procedure TouristTablePASSPORTEXPIREChange(Sender: TField);
    procedure RelativesTableNewRecord(DataSet: TDataSet);
    procedure PersonTableAfterOpen(DataSet: TDataSet);
    procedure PersonQryCalcFields(DataSet: TDataSet);
    procedure CountryTableAfterOpen(DataSet: TDataSet);
    procedure CountryTableBeforePost(DataSet: TDataSet);
    procedure CountryTableBeforeDelete(DataSet: TDataSet);
    procedure CityByCntryTableAfterOpen(DataSet: TDataSet);
    procedure CityByCntryTableNewRecord(DataSet: TDataSet);
    procedure RouteQryAfterOpen(DataSet: TDataSet);
    procedure RouteQryAfterScroll(DataSet: TDataSet);
    procedure RouteQryCalcFields(DataSet: TDataSet);
    procedure RouteSelQryCalcFields(DataSet: TDataSet);
    procedure SheduleTableCalcFields(DataSet: TDataSet);
    procedure TripQueryAfterScroll(DataSet: TDataSet);
    procedure TripQueryCalcFields(DataSet: TDataSet);
    procedure TripByOrderQryAfterOpen(DataSet: TDataSet);
    procedure TripByOrderQryCalcFields(DataSet: TDataSet);
    procedure PlaceByTripTableBeforeOpen(DataSet: TDataSet);
    procedure PlaceByTripTableNewRecord(DataSet: TDataSet);
    procedure PlaceByTripTableCalcFields(DataSet: TDataSet);
    procedure PlaceByTripTableAfterPost(DataSet: TDataSet);
    procedure PlaceMapTableAfterPost(DataSet: TDataSet);
    procedure PlaceListQueryBeforeOpen(DataSet: TDataSet);
    procedure PlaceListQueryAfterOpen(DataSet: TDataSet);
    procedure PlaceListQueryCalcFields(DataSet: TDataSet);
    procedure HotelQryAfterOpen(DataSet: TDataSet);
    procedure HotelSrcDataChange(Sender: TObject; Field: TField);
    procedure HotelByOrderQryAfterScroll(DataSet: TDataSet);
    procedure RoomingQryCalcFields(DataSet: TDataSet);
    procedure RoomingTableNewRecord(DataSet: TDataSet);
    procedure RoomTableBeforeOpen(DataSet: TDataSet);
    procedure RoomTableCalcFields(DataSet: TDataSet);
    procedure OrdInsureQryAfterScroll(DataSet: TDataSet);
    procedure PersInsureQryCalcFields(DataSet: TDataSet);
    procedure PersInsureTableUNHAPPYRATEChange(Sender: TField);
    procedure PersInsureTableMEDICALRATEChange(Sender: TField);
    procedure PersInsureTableDiscountChange(Sender: TField);
    procedure PersInsureTableNewRecord(DataSet: TDataSet);
    procedure PersInsureTableCalcFields(DataSet: TDataSet);
    procedure PersResortTableNewRecord(DataSet: TDataSet);
    procedure OrdrCntryQryAfterScroll(DataSet: TDataSet);
    procedure OrdrCntryQryCalcFields(DataSet: TDataSet);
    procedure PersVisaTableNewRecord(DataSet: TDataSet);
    procedure PersVisaQryCalcFields(DataSet: TDataSet);
    procedure OrdOtherQryAfterScroll(DataSet: TDataSet);
    procedure PersOtherQryCalcFields(DataSet: TDataSet);
    procedure OrderPayQryAfterScroll(DataSet: TDataSet);
    procedure OrderPayQryCalcFields(DataSet: TDataSet);
    procedure PersonPayQryCalcFields(DataSet: TDataSet);
    procedure PersonPayTableBeforePost(DataSet: TDataSet);
    procedure AnketTableNewRecord(DataSet: TDataSet);
    procedure GuideLstQryCalcFields(DataSet: TDataSet);
    procedure ToursTableAfterOpen(DataSet: TDataSet);
    procedure DMDestroy(Sender: TObject);
    procedure PersInsureTableRATEChange(Sender: TField);
  private
    FOrderTableDiscountChange: Boolean;
    //FPersInsureTableDiscountChange: Boolean;
    FRoomingTableDayCountChange: Boolean;
    FFilterByOrder: String;
    FTouristTemplateList: TStrings;
    FHistNationality: TStringList;
    FHistLocality: TStringList;
    FHistOccupation: TStringList;
    FHistProfession: TStringList;
    FHistEmplAddress: TStringList;
    FHistEmployer: TStringList;
    FIsTripInOrder: Boolean;
    FIsRTaxInOrder: Boolean;
    FIsRoomInOrder: Boolean;
    function GetFilterByOrder: String;
    procedure SetTouristTemplateList(const Value: TStrings);
  public
    procedure ChangeOrderedByTripDate(DateDelta: Double);
    procedure ChildAsTourist;
    procedure ClientAsTourist;
    procedure CreateListOfTourist(Cnt: Integer);
    function DatabaseApplyUpdates(const DataSets: array of TDBDataSet;
      Apply: Boolean): Boolean;
    procedure DatabaseCancelUpdates(const DataSets: array of TDBDataSet);
    function DataSetApplyUpdates(DataSet: TDBDataSet; Apply: Boolean): Boolean;
    procedure DataSetToStrings(DataSet: TDataSet; KeyFld, ListFld: TField;
      Clean: Boolean; Strings: TStrings);  // TDataSet records to TStrings
    procedure DelVisaCountry;
    function InsurePoliceBreak(Vend: Integer; const Se, No: String; RetSum: Currency): Boolean;
    function InsurePoliceTrash(Vend: Integer; const Se, No: String): Boolean;
    function InsureReturnValue: Currency;
    function NewOrder: Boolean;
    procedure NewPersonByTourist(UpdateList, LocateTourist: Boolean);
    function NewInsureKind(KindId: Integer; From: TDateTime; Days: Integer): Boolean;
    function NewVisaCountry(CntryId: Integer;
      From: TDateTime; Days: Integer; Tax2: Currency): Boolean;
    procedure OpenDataSet(DSet: TDataSet);
    procedure OrderAnnulation;
    procedure PlaceFree;  //vacate place
    procedure PrintOrderConfirmation(OrdServ: TOrderServices);
    procedure PrintTripQuide(DocId: Integer);
    procedure SelectQueryToStrings(             // database records to TStrings
      const Table, Key, KeyValue, Id, List, SortBy: String;
      Sort, Clean: Boolean; Strings: TStrings);
    procedure SelectQueryTo2Strings(const Table, Key, KeyValue, Id, List, List2,
      SortBy: String; Sort, Clean: Boolean; Strings, Strings2: TStrings);
    procedure SetReservToValue(DSet: TTable; ADateTime: TDateTime);
    //procedure UpdateOrderTripCost;
    //procedure UpdateOrderHotelCost;
    procedure UpdateOrderState;
    procedure UpdatePersonQuery(LocateTourist: Boolean);
    procedure UpdatePlaceTimeOut; //recalculating the place reserving timeout
    procedure UpdateTouristTemplateList;
    procedure UpdateTripQuery(InOrder: Boolean; DirKey: Integer;
      const RouteKey, DateKey, StateKey: String);
    procedure UpdateTripQueryInOrder;
    procedure UpdateQuery(Qry: TQuery);  //query reopening
    function ValidTouristBirthDate: Boolean;
    function ValidTouristPassportDate: Boolean;
    //procedure ItalianaMacros;
    property FilterByOrder: String read GetFilterByOrder;
    property HistLocality: TStringList read FHistLocality;
    property HistNationality: TStringList read FHistNationality;
    property HistProfession: TStringList read FHistProfession;
    property HistOccupation: TStringList read FHistOccupation;
    property HistEmployer: TStringList read FHistEmployer;
    property HistEmplAddress: TStringList read FHistEmplAddress;
    property IsTripInOrder: Boolean read FIsTripInOrder write FIsTripInOrder;
    property IsRoomInOrder: Boolean read FIsRoomInOrder write FIsRoomInOrder;
    property IsRTaxInOrder: Boolean read FIsRTaxInOrder write FIsRTaxInOrder;
    property TouristTemplateList: TStrings read FTouristTemplateList write SetTouristTemplateList;
  end;

var
  DM: TDM;

var
  BDEDecimalSeparator: Char;

const
  nInsureKindMedical: Integer = 12;
  nInsureKindUnhappy: Integer = 13;

implementation

uses Math,
  TourConsts, OptSet, PlaceFrm, {TourFrm, }{RoomsFrm, }TourMbplIf, TourCmnlIf,
  TourStrMag;

{$R *.DFM}

const pBoolAsYesNo: array[Boolean] of Pointer = (@SDataModNo, @SDataModYes);

{ DM }

function TDM.GetFilterByOrder: String;
begin
  Result := Format('OrderId = %d', [OrderTableOrderId.AsInteger]);
end;

procedure TDM.SetTouristTemplateList(const Value: TStrings);
begin
  TouristTemplateList.Assign(Value);
end;

procedure TDM.ChangeOrderedByTripDate(DateDelta: Double);
begin
  {with PlaceUpdateQry do
  begin
    SQL.Text := Format(
      'update HtlRooming set', []);

  end;}
end;

procedure TDM.ChildAsTourist;
var
  ParentId, ChildId, AsTourist, CntryId, SKind, CKind: Integer;
  Nam1, Nam2, Nam3, Nam4, Phon, Addr, Hous, Tene, City, Zip, Tshp, Prov,
  Rel, BLoc, BCnt, Nati: String;
  BDate: TDateTime;
begin
  ParentId := TouristTableClientId.Value;
  ChildId := RelativesTableTOURISTRELATID.Value;
  Rel := RelativesTableRELATIVTEXT.AsString;
  Nam1 := RelativesTableSURNAME.Value;
  Nam2 := RelativesTableNAME.Value;
  Nam3 := RelativesTableSECONDNAME.Value;
  Nam4 := RelativesTableFIRSTNAME.Value;
  BDate := RelativesTableBIRTHDATE.Value;
  BLoc := RelativesTableBIRTHLOCALITY.Value;
  BCnt := RelativesTableBIRTHCOUNTRY.Value;
  Nati := RelativesTableNATIONALITY.Value;
  Phon := TouristTableHomePhone.Value;
  CntryId := TouristTableCOUNTRYID.Value;
  SKind := TouristTableStrKind.Value;
  Addr := TouristTableAddress.Value;
  Hous := TouristTableHouse.Value;
  Tene := TouristTableTenement.Value;
  CKind := TouristTableCityKind.Value;
  City := TouristTableCity.Value;
  Zip := TouristTableZipCode.Value;
  Tshp := TouristTableTownship.Value;
  Prov := TouristTableProvince.Value;
  with TouristTable do
  begin
    Append;
    TouristTableSURNAME.Value := Nam1;
    TouristTableNAME.Value := Nam2;
    TouristTableSECONDNAME.Value := Nam3;
    TouristTableFIRSTNAME.Value := Nam4;
    TouristTableBIRTHDATE.Value := BDate;
    TouristTableHomePhone.Value := Phon;
    TouristTableCOUNTRYID.Value := CntryId;
    TouristTableStrKind.Value := SKind;
    TouristTableAddress.Value := Addr;
    TouristTableHouse.Value := Hous;
    TouristTableTenement.Value := Tene;
    TouristTableCityKind.Value := CKind;
    TouristTableCity.Value := City;
    TouristTableZipCode.Value := Zip;
    TouristTableTownship.Value := Tshp;
    TouristTableProvince.Value := Prov;
    TouristTableAsCHILDID.Value := ChildId;
    Post;
    Refresh;
  end;
  with AnketTable do
  begin
    Append;
    AnketTableBIRTHLOCALITY.Value := BLoc;
    AnketTableBIRTHCOUNTRY.Value := BCnt;
    AnketTableNATIONALITY.Value := Nati;
    with AnketTableSEX do
      if StrChildIsMale(Rel) then
        Value := SVDlgsSexMaleUa else Value := SVDlgsSexFemaleUa;
    Post;
    Refresh;
  end;
  if TouristTable.CachedUpdates then
    DatabaseApplyUpdates([TouristTable, AnketTable, RelativesTable], True)
  else TouristTable.Refresh;
  AsTourist := TouristTableClientId.AsInteger;
  NewPersonByTourist(True, False);
  TouristTable.Locate('ClientId', ParentId, []);
  with RelativesTable do
    if Locate('TOURISTRELATID', ChildId, []) then
    begin
      Edit;
      RelativesTableASTOURISTID.Value := AsTourist;
      Post;
      Refresh;
    end;
  if TouristTable.CachedUpdates then
    DatabaseApplyUpdates([TouristTable, AnketTable, RelativesTable], True)
  else TouristTable.Refresh;
end;

procedure TDM.ClientAsTourist;
var
  S: String;
  P: Integer;
begin
  //another application >
  Exit;
  {S := ClientQryName.AsString;
  P := Pos(' ', S);
  with TouristTable do
  begin
    Append;
    //TouristTableClientId.Value := ClientTableClientId.Value;
    if P > 0       // Client.Name = SurName + ' ' + Name
    then begin
      TouristTableSurName.Value := Copy(S, 1, P - 1);
      TouristTableName.Value := Copy(S, P + 1, Length(S));
    end
    else begin     // otherwise
      TouristTableSurName.Value :=
        InputBox(SDataModInputSurNameCaption, SDataModInputSurNamePrompt, S);
      TouristTableName.Value :=
        InputBox(SDataModInputNameCaption, SDataModInputNamePrompt, S);
    end;
    TouristTableSecondName.Value := UkraineToEnglish(TouristTableSurName.AsString);
    TouristTableFirstName.Value := UkraineToEnglish(TouristTableName.AsString);
    TouristTableHomePhone.Value := ClientQryHomePhone.Value;
    TouristTableWorkPhone.Value := ClientQryCalcWorkPhone.Value;
    TouristTableStrKind.Value := ClientQryStrKind.Value;
    TouristTableCOUNTRYID.Value := ClientQryCountryId.Value;
    TouristTableAddress.Value := ClientQryAddress.Value;
    TouristTableZipCode.Value := ClientQryZipCode.Value;
    TouristTableCityKind.Value := ClientQryCityKind.Value;
    TouristTableCity.Value := ClientQryCity.Value;
    TouristTableProvince.Value := ClientQryProvince.Value;
    TouristTableTownship.Value := ClientQryTownship.Value;
    TouristTableHouse.Value := ClientQryHouse.Value;
    TouristTableTenement.Value := ClientQryTenement.Value;
  end;
  if TouristEditForm.ShowTourist(True, False) then // Post or Cancel TouristTable here
  begin
    ///if TouristTable.CachedUpdates then
    ///  DatabaseApplyUpdates([TouristTable, AnketTable, RelativesTable], True)
    ///else TouristTable.Refresh;
    NewPersonByTourist(True, False);
    ///if (P = 0) and (ConfirmDlgYN(SDataModConfirmInputName)) then
    ///  with ClientTable do  // SurName and Name were inputed
    ///  begin
    ///    Edit;
    ///    ClientTableName.Value :=
    ///      TouristTableSurName.Value + ' ' + TouristTableName.Value;
    ///    Post;
    ///  end;
  end;}
end;

procedure TDM.CreateListOfTourist(Cnt: Integer);
var
  S: String;
  P: Integer;
begin
  S := ClientQryName.Value;
  P := Pos(' ', S);
  if P > 0 then S := Copy(S, 1, P - 1);
  for P := 0 to Pred(Cnt) do
    with TouristTable do
    begin
      Append;
      TouristTableSurName.Value := S;
      TouristTableName.Value := IntToStr(Succ(P));
      TouristTableSecondName.Value := UkraineToEnglish(TouristTableSurName.AsString);
      TouristTableFirstName.Value := UkraineToEnglish(TouristTableName.AsString);
      Post;
      if CachedUpdates then
        DatabaseApplyUpdates([TouristTable, AnketTable, RelativesTable], True)
      else Refresh;
      NewPersonByTourist(False, False);
    end;
  if Cnt > 0 then UpdatePersonQuery(False);
end;

function TDM.DatabaseApplyUpdates(const DataSets: array of TDBDataSet;
  Apply: Boolean): Boolean;
var ErrCat: byte;
begin
  if Apply then
    try
      Database.ApplyUpdates(DataSets);
      Result := True;
    except
      on E: Exception do
      begin
        DatabaseCancelUpdates(DataSets);
        with E as EDBEngineError do ErrCat := Errors[ErrorCount - 1].Category;
        raise EDatabaseError.CreateFmt(SDataModExceptMessage,
          [GetDatabaseErrorCategory(ErrCat), E.Message]);
      end;
    end
  else begin
    Result := True;
    {Result := ConfirmDlgYC(SDataModConfirmApplyUpdates);
    if Result then }DatabaseCancelUpdates(DataSets);
  end;
end;

procedure TDM.DatabaseCancelUpdates(const DataSets: array of TDBDataSet);
var I: Integer;
begin
  for I := 0 to High(DataSets) do DataSets[I].CancelUpdates;
end;

function TDM.DataSetApplyUpdates(DataSet: TDBDataSet; Apply: Boolean): Boolean;
begin
  Result := True;
  with TDBDataSet(DataSet) do
  begin
    if (State in dsEditModes) or UpdatesPending then
    begin
      if Apply then
      begin
        Database.ApplyUpdates([DataSet as TDBDataSet]);
        // A call of CancelUpdates garantier removing of any discard changes
        CancelUpdates;
      end
      else
      begin
        if ConfirmDlgYC(SDataModConfirmApplyUpdates) then CancelUpdates
        else Result := False;
      end;
    end;
  end;
end;

procedure TDM.DataSetToStrings(DataSet: TDataSet; KeyFld, ListFld: TField;
  Clean: Boolean; Strings: TStrings);
begin
  DataSet.First;
  with Strings do
  begin
    if Clean then Clear;
    while not DataSet.Eof do
    begin
      if Assigned(KeyFld) and (KeyFld is TIntegerField) then
        AddObject(ListFld.AsString, Pointer(KeyFld.AsInteger))
      else Add(ListFld.AsString);
      DataSet.Next;
    end;
  end;
end;

procedure TDM.DelVisaCountry;
begin
  if WarningFmtDlgYC(SOrderFrmWarningVisaCntryDelete, [OrdrCntryQryNAME.AsString])
  then begin
    with NoneVisaProc do
    begin
      Close;
      ParamByName('ORDERID').Value := OrderTableOrderId.AsInteger;
      ParamByName('OCNTRID').Value := OrdrCntryQryORDERCNTRYID.AsInteger;
      Prepare;
      ExecProc;
    end;
    UpdateQuery(OrdrCntryQry);
    UpdateQuery(PersVisaQry);
  end;
end;

function TDM.InsurePoliceBreak(Vend: Integer; const Se, No: String; RetSum: Currency): Boolean;
begin
  Result := True;
  Database.StartTransaction;
  try
    PoliceBreakProc.ParamByName('POLICEVEND').Value := Vend;
    PoliceBreakProc.ParamByName('POLICESE').Value := Se;
    PoliceBreakProc.ParamByName('POLICENO').Value := No;
    PoliceBreakProc.ParamByName('BREAKDATE').Value := Now;
    PoliceBreakProc.ParamByName('PAYREST').Value := RetSum;
    PoliceBreakProc.Prepare;
    PoliceBreakProc.ExecProc;
    Database.Commit;
  except
    Database.Rollback;
    Result := False;
  end;
end;

function TDM.InsurePoliceTrash(Vend: Integer; const Se, No: String): Boolean;
begin
  Result := True;
  Database.StartTransaction;
  try
    PoliceTrashProc.ParamByName('POLICEVEND').Value := Vend;
    PoliceTrashProc.ParamByName('POLICESE').Value := Se;
    PoliceTrashProc.ParamByName('POLICENO').Value := No;
    PoliceTrashProc.Prepare;
    PoliceTrashProc.ExecProc;
    Database.Commit;
  except
    Database.Rollback;
    Result := False;
  end;
end;

function TDM.NewOrder: Boolean;
begin
  Result := ConfirmDlgYN(SDataModConfirmNewOrder);
  if Result then OrderTable.Append;
end;

function TDM.InsureReturnValue: Currency;
var Days: Integer;
begin
  Days := Round(Int(PersInsureQryCalcToDate.AsFloat) - Int(Now)) + 1;
  Result :=
    PersInsureQryPAY.AsCurrency / PersInsureQryDAYCOUNT.Value * Days * 0.85;
end;

procedure TDM.NewPersonByTourist(UpdateList, LocateTourist: Boolean);
begin
  PersonTable.Append;
  PersonTableTouristId.Value := TouristTableClientId.Value;
  PersonTable.Post;
  PersonTable.Refresh;
  if UpdateList then UpdatePersonQuery(LocateTourist);
end;

function TDM.NewVisaCountry(CntryId: Integer;
  From: TDateTime; Days: Integer; Tax2: Currency): Boolean;
const sUpd =
  'update PersVisas set FromDate = ''%s'', ToDate = ''%s'' where OrderId = %d and OrderCntryId = %d';
begin
  if not OrdrCntryQry.Active then UpdateQuery(OrdrCntryQry);
  Result := not OrdrCntryQry.Locate('CountryId', CntryId, []);
  if not Result then ErrorDlg(SOrderFrmErrVisaCntryExists)
  else begin
    with OrdrCntryTable do
    begin
      if not Active then Open;
      Append;
      OrdrCntryTableORDERID.Value := OrderTableOrderId.Value;
      OrdrCntryTableCOUNTRYID.Value := CntryId;
      Post;
      Refresh;
    end;
    OrdrCntryQry.AfterScroll := nil;
    UpdateQuery(OrdrCntryQry);
    OrdrCntryQry.AfterScroll := OrdrCntryQryAfterScroll;
    Result := OrdrCntryQry.Locate('CountryId', CntryId, []);
    if Result then
      with PersVisaProc do
      begin
        ParamByName('OrderId').Value := OrdrCntryQryORDERID.Value;
        ParamByName('OCntrId').Value := OrdrCntryQryORDERCNTRYID.Value;
        ParamByName('CntryId').Value := CntryId;
        with ParamByName('FromDate') do Value := null;
          //if From = 0 then Value := null else AsString := DateToStr(From);
        with ParamByName('ToDate') do Value := null;
          //if From = 0 then Value := null else AsString := DateToStr(From + Days);
        ParamByName('VISATAX').Value := null;
        if Tax2 < 0 then ParamByName('VISATX2').Value := null
          else ParamByName('VISATX2').Value := Tax2;
        ParamByName('CURR2ID').Value := OptionSet.DefaultCurrency;
        Prepare;
        ExecProc;
        with TQuery.Create(Self) do
        try
          DatabaseName := Self.Database.DatabaseName;
          SQL.Text := Format(sUpd, [DateToStr(From), DateToStr(From + Days),
            OrdrCntryQryORDERID.AsInteger, OrdrCntryQryORDERCNTRYID.AsInteger]);
          ExecSQL;
        finally
          Free;
        end;
        UpdateQuery(PersVisaQry);
      end
    else ErrorDlg(SOrderFrmErrVisaCntryNotFound);
  end;
end;

function TDM.NewInsureKind(KindId: Integer; From: TDateTime; Days: Integer): Boolean;
begin

end;

procedure TDM.OpenDataSet(DSet: TDataSet);
begin
  with DSet do if not Active then Open;
end;

procedure TDM.OrderAnnulation;
begin
  OrderAnnulProc.Params[0].Value := OrderTableOrderId.Value;
  OrderAnnulProc.Prepare;
  OrderAnnulProc.ExecProc;
  OrderTable.Refresh;
end;

procedure TDM.PlaceFree;
begin
  PlaceMapTableOrderId.Clear;
  PlaceMapTablePersonId.Clear;
  PlaceMapTableState.Value := plcFree;
  PlaceMapTableStartCity.Clear;
  PlaceMapTableStopCity.Clear;
  PlaceMapTableRate.Clear;
  PlaceMapTableRate2.Clear;
  PlaceMapTableDiscount.Clear;
  PlaceMapTableDiscount2.Clear;
  PlaceMapTableIncrease.Clear;
  PlaceMapTableIncrease2.Clear;
end;

procedure TDM.PrintOrderConfirmation(OrdServ: TOrderServices);
const
  nColCount = 8;
  sCols: array[1..nColCount] of Pointer = (
    @SDataModOrderConfCol1, @SDataModOrderConfCol2, @SDataModOrderConfCol3,
    @SDataModOrderConfCol4, @SDataModOrderConfCol5, @SDataModOrderConfCol6,
    @SDataModOrderConfCol7, @SDataModOrderConfCol8);
  wCols: array[1..nColCount] of Integer = (27, 150, 45, 45, 45, 45, 45, 27);
var
  Template, NewTemplate, ItemIndex: OleVariant;
  CurRange: Range;
  WordTable: Table;
  N, I: Integer;
  RT, RR, RH, RI, RZ, ST, SR, SH, SI, SZ, Sum1, Sum2, SumI: Currency;
begin
  ST := 0;
  SR := 0;
  SH := 0;
  SI := 0;
  SZ := 0;
  Sum1 := 0;
  Sum2 := 0;
  SumI := 0;
  try
    Template := EmptyParam;
    NewTemplate := True;
    Template := OptionSet.WordDocTemplate;
    NewTemplate := False;
    ItemIndex := 1;
    try
      WordApplic.Connect;
    except
      ErrorDlg(SDataModErrorWordNotInstall);
      Abort;
    end;
    Template := OptionSet.WordDocTemplate;
    NewTemplate := False;
    WordApplic.Documents.Add(Template, NewTemplate);
    WordDocument.ConnectTo(WordApplic.Documents.Item(ItemIndex));
    WordDocument.PageSetup.Orientation := 0;
    WordDocument.PageSetup.RightMargin := WordDocument.PageSetup.LeftMargin;
    // title
    WordParaFormat.ConnectTo(WordDocument.Sentences.Last.ParagraphFormat);
    WordParaFormat.Alignment := wdAlignParagraphLeft;
    WordDocument.Range.InsertAfter(Format(SDataModOrderConfTitle, [DateToStr(Now)]));
    WordDocument.Range.InsertAfter(' '#13 + OrderTableLookClient.Value + #13);
    WordDocument.Range.InsertParagraphAfter;
    // services
    WordDocument.Range.InsertAfter(Format(SDataModOrderConfLine0, [PersonQry.RecordCount]));
    WordDocument.Range.InsertAfter(SDataModOrderConfTrip0);
    with TripByOrderQry do
      try
        DisableControls;
        First;
        while not Eof do
        begin
          WordDocument.Range.InsertAfter(Format(SDataModOrderConfTripN + #13, [
            TripByOrderQryCalcFrom.Value, TripByOrderQryCalcArrive.Value,
            TripByOrderQryLEAVEDATE.DisplayText, TripByOrderQryPCOUNT.AsInteger]));
          Next;
        end;
      finally
        EnableControls;
      end;
    WordDocument.Range.InsertParagraphAfter;
    UpdateQuery(RoomingQry);
    with HotelByOrderQry do
      try
        DisableControls;
        First;
        while not Eof do
        begin
          WordDocument.Range.InsertAfter(Format(SDataModOrderConfHotel + #13, [
            HotelByOrderQryCity.Value, HotelByOrderQryHotel.Value,
            HotelByOrderQrySTARS.Value, RoomingQryROOMNAME.Value,
            RoomingQryFEEDTYPE.Value, HotelByOrderQryCOUNT.AsInteger]));
          Next;
        end;
      finally
        EnableControls;
      end;
    WordDocument.Range.InsertParagraphAfter;
    // table
    CurRange := WordDocument.Paragraphs.Last.Range;
    WordTable := CurRange.Tables.Add(CurRange, 2, nColCount);
    WordFont.ConnectTo(WordTable.Range.Font);
    WordFont.Size := 10;
    for I := 1 to nColCount do
    begin
      WordTable.Columns.Item(I).Width := wCols[I];
      WordTable.Cell(1, I).Range.InsertAfter(LoadResString(sCols[I]));
    end;
    WordTable.Borders.Enable := 1;
    N := 1;
    //with PersonQry do
      try
        UpdateQuery(OrderLstQry);
        {DisableControls;
        First;}
        while not OrderLstQry.Eof do
        begin
          RT := OrderLstQryTRIPTOTAL.Value;
          RR := OrderLstQryRESORTTOTAL2.Value;
          RH := OrderLstQryHOTELTOTAL2.Value;
          RI := OrderLstQryINSURETOTAL.Value;
          RZ := OrderLstQryFIRMTOTAL.Value;
          ST := ST + RT;
          SR := SR + RR;
          SH := SH + RH;
          SI := SI + RI;
          SZ := SZ + RZ;
          Sum1 := Sum1 + OrderLstQryTRIPTOTAL.AsCurrency +
            OrderLstQryHOTELTOTAL.AsCurrency + OrderLstQryTRANSFERTOTAL.AsCurrency +
            OrderLstQryVISATOTAL.AsCurrency + OrderLstQryEXCURSIONTOTAL.AsCurrency +
            OrderLstQryINSURETOTAL.AsCurrency + OrderLstQryFIRMTOTAL.AsCurrency +
            OrderLstQryRESORTTOTAL.AsCurrency;
          SumI := SumI + OrderLstQryINSURETOTAL.AsCurrency;
          Sum2 := Sum2 + OrderLstQryTRIPTOTAL2.AsCurrency +
            OrderLstQryHOTELTOTAL2.AsCurrency + OrderLstQryTRANSFERTOTAL2.AsCurrency +
            OrderLstQryVISATOTAL2.AsCurrency + OrderLstQryEXCURSIONTOTAL2.AsCurrency +
            OrderLstQryRESORTTOTAL2.AsCurrency + OrderLstQryOTHERTOTAL2.AsCurrency;
          Inc(N);
          ItemIndex := WordTable.Rows.Item(N);
          with WordTable.Rows.Add(ItemIndex) do
          begin
            if N <> 2 then Borders.Item(wdBorderTop).Visible := False;
            Cells.Item(1).Range.InsertAfter(OrderLstQryFRWPLACENO.Value);
            Cells.Item(2).Range.InsertAfter(OrderLstQryTOURISTNAME.Value);
            Cells.Item(3).Range.InsertAfter(FormatCurrency(RT));
            Cells.Item(4).Range.InsertAfter(FormatCurrency(RR));
            Cells.Item(5).Range.InsertAfter(FormatCurrency(RH));
            Cells.Item(6).Range.InsertAfter(FormatCurrency(RI));
            Cells.Item(7).Range.InsertAfter(FormatCurrency(RZ));
            Cells.Item(8).Range.InsertAfter(OrderLstQryBKWPLACENO.Value);
          end;
          OrderLstQry.Next;
        end;
        with WordTable.Rows do
        begin
          WordParaFormat.ConnectTo(First.Range.ParagraphFormat);
          WordParaFormat.Alignment := wdAlignParagraphCenter;
          WordParaFormat.ConnectTo(Last.Range.ParagraphFormat);
          WordParaFormat.Alignment := wdAlignParagraphRight;
          WordFont.ConnectTo(Last.Range.Font);
          WordFont.Bold := 1;
          Last.Cells.Item(2).Range.InsertAfter(SDataModOrderConfSumm + ':');
          Last.Cells.Item(3).Range.InsertAfter(FormatCurrency(ST));
          Last.Cells.Item(4).Range.InsertAfter(FormatCurrency(SR));
          Last.Cells.Item(5).Range.InsertAfter(FormatCurrency(SH));
          Last.Cells.Item(6).Range.InsertAfter(FormatCurrency(SI));
          Last.Cells.Item(7).Range.InsertAfter(FormatCurrency(SZ));
        end;
      finally
        {EnableControls;}
      end;
    WordDocument.Range.InsertParagraphAfter;
    WordDocument.Range.InsertAfter(SDataModOrderConfForPay + #13);
    WordDocument.Range.InsertAfter(Format('%25s %-4s - %s'#13, [
      FormatCurrency(Sum2), SPayDlgUSD, SDataModOrderConfSumLst2]));
    WordDocument.Range.InsertAfter(Format('%25s %-4s - %s'#13, [
      FormatCurrency(Sum1 - SumI), SPayDlgUAH, SDataModOrderConfSumPred]));
    WordDocument.Range.InsertAfter(Format('%25s %-4s - %s'#13, [
      FormatCurrency(SumI), SPayDlgUAH, SDataModOrderConfSumLast]));
    WordApplic.Visible := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      WordApplic.Disconnect;
    end;
  end;
end;

procedure TDM.PrintTripQuide(DocId: Integer);
const
  nMaxCount = 16;
  nColCount: array[prntDocPrintGuideAll..prntDocPrintGuideRoom] of Integer = (
    nMaxCount, 7, 6);
  nPageOrient: array[prntDocPrintGuideAll..prntDocPrintGuideRoom] of Integer = (
    1, 0, 0);
  sCols: array[prntDocPrintGuideAll..prntDocPrintGuideRoom] of
      array[1..nMaxCount] of Pointer = ((
    @SDataModTripQuide1, @SDataModTripQuide2, @SDataModTripQuide3,
    @SDataModTripQuide4, @SPlaceFrmPrintGuideTitle16, @SDataModTripQuide5,
    @SDataModTripQuide6, @SDataModTripQuide7,
    @SDataModTripQuide8, @SDataModTripQuide9,
    @SDataModTripQuide10, @SDataModTripQuide11, @SDataModTripQuide12,
    @SDataModTripQuide13, @SDataModTripQuide14, @SDataModTripQuide15), (
    @SDataModTripQuide1, @SDataModTripQuide2, @SDataModTripQuide14,
    @SDataModTripQuide3, @SDataModTripQuide4, @SDataModTripQuide13,
    @SDataModTripQuide15, nil, nil, nil, nil, nil, nil, nil, nil, nil), (
    @SDataModTripQuide2, @SDataModTripQuide14, @SDataModTripQuide16,
    @SDataModTripQuide6, @SDataModTripQuide13, @SDataModTripQuide15,
    nil, nil, nil, nil, nil, nil, nil, nil, nil, nil));
  sTit: array[prntDocPrintGuideAll..prntDocPrintGuideRoom] of Pointer = (
    @SDataModDocPrintGuideAll,
    @SDataModDocPrintGuideTrip, @SDataModDocPrintGuideRoom);
  wCols: array[prntDocPrintGuideAll..prntDocPrintGuideRoom] of
      array[1..nMaxCount] of Integer = ((
    25, 150, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 25), (
    25, 145, 62, 77, 77, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), (
    145, 62, 77, 75, 53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
var
  Template, NewTemplate, ItemIndex: OleVariant;
  CurRange: Range;
  WordTable: Table;
  N, I: Integer;
  RT, RR, RH, RI, RF, RA, Rp1, Rp2, Rd1, Rd2,
  ST, SR, SH, SI, SF, SA, Sp1, Sp2, Sd1, Sd2, S1, S2: Currency;
begin
  ST := 0; // sum by trip in $
  SR := 0; // sum by resort
  SH := 0; // sum by hotel
  SI := 0; // sum by insure in UAH
  SF := 0; // sum by firm tax in UAH
  SA := 0; // sum by trip in UAH // transfer
  Sp1 := 0; // sum of paid in UAH
  Sp2 := 0; // sum of paid in USD
  Sd1 := 0; // sum of due in UAH
  Sd2 := 0; // sum of due in USD
  S1 := 0; // sum in UAH
  S2 := 0; // sum in USD
  try
    Template := EmptyParam;
    NewTemplate := True;
    Template := OptionSet.WordDocTemplate;
    NewTemplate := False;
    ItemIndex := 1;
    try
      WordApplic.Connect;
    except
      ErrorDlg(SDataModErrorWordNotInstall);
      Abort;
    end;
    Template := OptionSet.WordDocTemplate;
    NewTemplate := False;
    ItemIndex := Max(1, WordApplic.Documents.Count);
    WordApplic.Documents.Add(Template, NewTemplate);
    WordDocument.ConnectTo(WordApplic.Documents.Item(ItemIndex));
    with WordDocument.PageSetup do
    begin
      Orientation := nPageOrient[DocId];
      LeftMargin := 32; //LeftMargin / 2;
      RightMargin := LeftMargin;
      BottomMargin := 32;
    end;
    WordParaFormat.ConnectTo(WordDocument.Sentences.Last.ParagraphFormat);
    WordParaFormat.Alignment := wdAlignParagraphLeft;
    WordFont.ConnectTo(WordDocument.Sentences.Last.Font);
    WordFont.Name := 'Times New Roman Cyr';
    WordFont.Size := 12;
    WordFont.Bold := 1;
    // title
    WordDocument.Range.InsertBefore(Format('%s - %s   (%s), %50s', [
      TripQueryCalcFrom.Value, TripQueryCalcArrive.Value,
      TripQueryDRIVEKIND.Value, TripQueryLeaveDate.DisplayText]));
    WordDocument.Range.InsertAfter(LoadResString(sTit[DocId]) + #13);
    WordFont.ConnectTo(WordDocument.Sentences.Last.Font);
    WordFont.Size := 10;
    WordFont.Bold := 0;
    WordDocument.Range.InsertParagraphAfter;
    // table
    CurRange := WordDocument.Paragraphs.Last.Range;
    WordTable := CurRange.Tables.Add(CurRange, 2, nColCount[DocId]);
    WordFont.ConnectTo(WordTable.Range.Font);
    WordFont.Size := 10;
    for I := 1 to nColCount[DocId] do
    begin
      WordTable.Columns.Item(I).Width := wCols[DocId, I];
      WordTable.Cell(1, I).Range.InsertAfter(LoadResString(sCols[DocId, I]));
    end;
    WordTable.Borders.Enable := 1;
    N := 1;
    UpdateQuery(TripLstQry);
    with TripLstQry do
      try
        DisableControls;
        First;
        while not Eof do
        begin
          RT := TripLstQryTRIPTOTAL2.Value;
          RR := TripLstQryRESORTTOTAL2.Value;
          RH := TripLstQryHOTELTOTAL2.Value;
          RI := TripLstQryINSURETOTAL.Value;
          RF := TripLstQryFIRMTOTAL.Value;
          RA := TripLstQryTRIPTOTAL.Value;
          Rp1 := TripLstQryTOTALPAID.Value;
          Rp2 := TripLstQryTOTALPAID2.Value;
          Rd1 := TripLstQryTRIPTOTAL.AsCurrency +
            TripLstQryHOTELTOTAL.AsCurrency + TripLstQryTRANSFERTOTAL.AsCurrency +
            TripLstQryVISATOTAL.AsCurrency + TripLstQryEXCURSIONTOTAL.AsCurrency +
            TripLstQryINSURETOTAL.AsCurrency + TripLstQryFIRMTOTAL.AsCurrency +
            TripLstQryRESORTTOTAL.AsCurrency - TripLstQryTOTALPAID.AsCurrency;
          Rd2 := TripLstQryTRIPTOTAL2.AsCurrency +
            TripLstQryHOTELTOTAL2.AsCurrency + TripLstQryTRANSFERTOTAL2.AsCurrency +
            TripLstQryVISATOTAL2.AsCurrency + TripLstQryEXCURSIONTOTAL2.AsCurrency +
            TripLstQryRESORTTOTAL2.AsCurrency + TripLstQryOTHERTOTAL2.AsCurrency -
            TripLstQryTOTALPAID2.AsCurrency;
          ST := ST + RT;
          SR := SR + RR;
          SH := SH + RH;
          SI := SI + RI;
          SF := SF + RF;
          SA := SA + RA;
          Sp1 := Sp1 + Rp1;
          Sp2 := Sp2 + Rp2;
          Sd1 := Sd1 + Rd1;
          Sd2 := Sd2 + Rd2;
          Inc(N);
          ItemIndex := WordTable.Rows.Item(N);
          with WordTable.Rows.Add(ItemIndex) do
          begin
            //if N <> 2 then Borders.Item(wdBorderTop).Visible := False;
            case DocId of
              prntDocPrintGuideAll:
              begin                  // without transfer
                Cells.Item(1).Range.InsertAfter(TripLstQryPLACENO.Value);
                Cells.Item(2).Range.InsertAfter(TripLstQryTOURISTNAMEEN.Value);
                //Cells.Item(3).Range.InsertAfter(TripLstQryStartPoint.Value);
                Cells.Item(4).Range.InsertAfter(TripLstQrySTOPPOINT.Value);
                Cells.Item(5).Range.InsertAfter(FormatCurrency(RA));
                Cells.Item(6).Range.InsertAfter(FormatCurrency(RT));
                Cells.Item(7).Range.InsertAfter(FormatCurrency(RH));
                Cells.Item(8).Range.InsertAfter(FormatCurrency(RI));
                Cells.Item(9).Range.InsertAfter(FormatCurrency(RF));
                Cells.Item(10).Range.InsertAfter(FormatCurrency(RR));
                Cells.Item(11).Range.InsertAfter(FormatCurrency(Rp1));
                Cells.Item(12).Range.InsertAfter(FormatCurrency(Rp2));
                Cells.Item(13).Range.InsertAfter(FormatCurrency(Rd1));
                Cells.Item(14).Range.InsertAfter(FormatCurrency(Rd2));
                Cells.Item(15).Range.InsertAfter(TripLstQryTOURISTBIRTHDATE.DisplayText);
                Cells.Item(16).Range.InsertAfter(TripLstQryTOURISTPASSPORT.Value);  //TripLstQryCLIENTNAME.Value);
              end;
              prntDocPrintGuideTrip:
              begin
                Cells.Item(1).Range.InsertAfter(TripLstQryPLACENO.Value);
                Cells.Item(2).Range.InsertAfter(TripLstQryTOURISTNAME.Value);
                Cells.Item(3).Range.InsertAfter(TripLstQryTOURISTBIRTHDATE.DisplayText);
                //Cells.Item(4).Range.InsertAfter(TripLstQryStartPoint.Value);
                Cells.Item(5).Range.InsertAfter(TripLstQrySTOPPOINT.Value);
                Cells.Item(6).Range.InsertAfter(FormatCurrency(Rd2));
                Cells.Item(7).Range.InsertAfter(TripLstQryCLIENTNAME.Value);
              end;
              prntDocPrintGuideRoom:
              begin
                Cells.Item(1).Range.InsertAfter(TripLstQryTOURISTNAME.Value);
                Cells.Item(2).Range.InsertAfter(TripLstQryTOURISTBIRTHDATE.DisplayText);
                Cells.Item(3).Range.InsertAfter(TripLstQrySTOPPOINT.Value);
                //Cells.Item(4).Range.InsertAfter(TripLstQryHotelName.Value);
                Cells.Item(5).Range.InsertAfter(FormatCurrency(Rd2));
                Cells.Item(6).Range.InsertAfter(TripLstQryCLIENTNAME.Value);
              end;
            end;
          end;
          Next;
        end;
        S1 := SI + SF;           // sum in UAH
        S2 := ST + SR + SH + SA; // sum in USD
        with WordTable.Rows do
        begin
          WordParaFormat.ConnectTo(First.Range.ParagraphFormat);
          WordParaFormat.Alignment := wdAlignParagraphCenter;
          WordParaFormat.ConnectTo(Last.Range.ParagraphFormat);
          WordParaFormat.Alignment := wdAlignParagraphRight;
          WordFont.ConnectTo(Last.Range.Font);
          WordFont.Bold := 1;
          Last.Cells.Item(2).Range.InsertAfter(SDataModOrderConfSumm + ':');
          case DocId of
            prntDocPrintGuideAll:
            begin                  // without transfer
              Last.Cells.Item(5).Range.InsertAfter(FormatCurrency(ST));
              Last.Cells.Item(6).Range.InsertAfter(FormatCurrency(ST));
              Last.Cells.Item(7).Range.InsertAfter(FormatCurrency(SH));
              Last.Cells.Item(8).Range.InsertAfter(FormatCurrency(SI));
              Last.Cells.Item(9).Range.InsertAfter(FormatCurrency(SF));
              Last.Cells.Item(10).Range.InsertAfter(FormatCurrency(SR));
              Last.Cells.Item(11).Range.InsertAfter(FormatCurrency(Sp1));
              Last.Cells.Item(12).Range.InsertAfter(FormatCurrency(Sp2));
              Last.Cells.Item(13).Range.InsertAfter(FormatCurrency(Sd1));
              Last.Cells.Item(14).Range.InsertAfter(FormatCurrency(Sd2));
            end;
            prntDocPrintGuideTrip:
              Last.Cells.Item(6).Range.InsertAfter(FormatCurrency(Sd2));
            prntDocPrintGuideRoom:
              Last.Cells.Item(5).Range.InsertAfter(FormatCurrency(Sd2));
          end;
        end;
      finally
        EnableControls;
      end;
    {UpdateQuery(GuideLstQry);
    with GuideLstQry do
      try
        DisableControls;
        First;
        while not Eof do
        begin
          RT := GuideLstQryTRIPTOTAL2.Value;
          RR := GuideLstQryRESORTTOTAL2.Value;
          RH := GuideLstQryHOTELTOTAL2.Value;
          RI := GuideLstQryINSURETOTAL.Value;
          RF := GuideLstQryFIRMTOTAL.Value;
          RA := GuideLstQryTRANSFERTOTAL2.Value;
          Rp1 := GuideLstQryTOTALPAID.Value;
          Rp2 := GuideLstQryTOTALPAID2.Value;
          Rd1 := GuideLstQryCalcDue.Value;
          Rd2 := GuideLstQryCalcDue2.Value;
          ST := ST + RT;
          SR := SR + RR;
          SH := SH + RH;
          SI := SI + RI;
          SF := SF + RF;
          SA := SA + RA;
          Sp1 := Sp1 + Rp1;
          Sp2 := Sp2 + Rp2;
          Sd1 := Sd1 + Rd1;
          Sd2 := Sd2 + Rd2;
          Inc(N);
          ItemIndex := WordTable.Rows.Item(N);
          with WordTable.Rows.Add(ItemIndex) do
          begin
            //if N <> 2 then Borders.Item(wdBorderTop).Visible := False;
            case DocId of
              prntDocPrintGuideAll:
              begin                  // without transfer
                Cells.Item(1).Range.InsertAfter(GuideLstQryPLACENO.Value);
                Cells.Item(2).Range.InsertAfter(GuideLstQryTOURISTNAME.Value);
                //Cells.Item(3).Range.InsertAfter(GuideLstQryStartPoint.Value);
                Cells.Item(4).Range.InsertAfter(GuideLstQrySTOPPOINT.Value);
                Cells.Item(5).Range.InsertAfter(FormatCurrency(RT));
                Cells.Item(6).Range.InsertAfter(FormatCurrency(RH));
                Cells.Item(7).Range.InsertAfter(FormatCurrency(RI));
                Cells.Item(8).Range.InsertAfter(FormatCurrency(RF));
                Cells.Item(9).Range.InsertAfter(FormatCurrency(RR));
                Cells.Item(10).Range.InsertAfter(FormatCurrency(Rp1));
                Cells.Item(11).Range.InsertAfter(FormatCurrency(Rp2));
                Cells.Item(12).Range.InsertAfter(FormatCurrency(Rd1));
                Cells.Item(13).Range.InsertAfter(FormatCurrency(Rd2));
                Cells.Item(14).Range.InsertAfter(GuideLstQryTOURISTBIRTHDATE.DisplayText);
                Cells.Item(15).Range.InsertAfter(GuideLstQryCLIENTNAME.Value);
              end;
              prntDocPrintGuideTrip:
              begin
                Cells.Item(1).Range.InsertAfter(GuideLstQryPLACENO.Value);
                Cells.Item(2).Range.InsertAfter(GuideLstQryTOURISTNAME.Value);
                Cells.Item(3).Range.InsertAfter(GuideLstQryTOURISTBIRTHDATE.DisplayText);
                //Cells.Item(4).Range.InsertAfter(GuideLstQryStartPoint.Value);
                Cells.Item(5).Range.InsertAfter(GuideLstQrySTOPPOINT.Value);
                Cells.Item(6).Range.InsertAfter(FormatCurrency(Rd2));
                Cells.Item(7).Range.InsertAfter(GuideLstQryCLIENTNAME.Value);
              end;
              prntDocPrintGuideRoom:
              begin
                Cells.Item(1).Range.InsertAfter(GuideLstQryTOURISTNAME.Value);
                Cells.Item(2).Range.InsertAfter(GuideLstQryTOURISTBIRTHDATE.DisplayText);
                Cells.Item(3).Range.InsertAfter(GuideLstQrySTOPPOINT.Value);
                //Cells.Item(4).Range.InsertAfter(GuideLstQryHotelName.Value);
                Cells.Item(5).Range.InsertAfter(FormatCurrency(Rd2));
                Cells.Item(6).Range.InsertAfter(GuideLstQryCLIENTNAME.Value);
              end;
            end;
          end;
          Next;
        end;
        S1 := SI + SF;           // sum in UAH
        S2 := ST + SR + SH + SA; // sum in USD
        with WordTable.Rows do
        begin
          WordParaFormat.ConnectTo(First.Range.ParagraphFormat);
          WordParaFormat.Alignment := wdAlignParagraphCenter;
          WordParaFormat.ConnectTo(Last.Range.ParagraphFormat);
          WordParaFormat.Alignment := wdAlignParagraphRight;
          WordFont.ConnectTo(Last.Range.Font);
          WordFont.Bold := 1;
          Last.Cells.Item(2).Range.InsertAfter(SDataModOrderConfSumm + ':');
          case DocId of
            prntDocPrintGuideAll:
            begin                  // without transfer
              Last.Cells.Item(5).Range.InsertAfter(FormatCurrency(ST));
              Last.Cells.Item(6).Range.InsertAfter(FormatCurrency(SH));
              Last.Cells.Item(7).Range.InsertAfter(FormatCurrency(SI));
              Last.Cells.Item(8).Range.InsertAfter(FormatCurrency(SF));
              Last.Cells.Item(9).Range.InsertAfter(FormatCurrency(SR));
              Last.Cells.Item(10).Range.InsertAfter(FormatCurrency(Sp1));
              Last.Cells.Item(11).Range.InsertAfter(FormatCurrency(Sp2));
              Last.Cells.Item(12).Range.InsertAfter(FormatCurrency(Sd1));
              Last.Cells.Item(13).Range.InsertAfter(FormatCurrency(Sd2));
            end;
            prntDocPrintGuideTrip:
              Last.Cells.Item(6).Range.InsertAfter(FormatCurrency(Sd2));
            prntDocPrintGuideRoom:
              Last.Cells.Item(5).Range.InsertAfter(FormatCurrency(Sd2));
          end;
        end;
      finally
        EnableControls;
      end;}
    WordApplic.Visible := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      WordApplic.Disconnect;
    end;
  end;
end;

procedure TDM.SelectQueryToStrings(const Table, Key, KeyValue, Id, List,
  SortBy: String; Sort, Clean: Boolean; Strings: TStrings);
begin
  SelectQueryTo2Strings(
    Table, Key, KeyValue, Id, List, '', SortBy, Sort, Clean, Strings, nil);
end;

procedure TDM.SelectQueryTo2Strings(const Table, Key, KeyValue, Id, List, List2,
  SortBy: String; Sort, Clean: Boolean; Strings, Strings2: TStrings);
var P: Pointer;
begin
  if Clean then
  begin
    Strings.Clear;
    if Assigned(Strings2) then Strings2.Clear;
  end;
  with TQuery.Create(Self) do
    try
      DatabaseName := Self.Database.DatabaseName;
      if List2 = '' then
        SQL.Add(Format('select %s, %s from %s', [Id, List, Table]))
      else SQL.Add(Format('select %s, %s, %s from %s', [Id, List, List2, Table]));
      if (Key <> '') and (KeyValue <> '') then
        SQL.Add(Format('where %s = %s', [Key, KeyValue]));
      if Sort then
      begin
        if SortBy = '' then  SQL.Add(Format('order by %s', [List]))
        else SQL.Add(Format('order by %s', [SortBy]));
      end;
      Prepare;
      Open;
      while not Eof do
      begin
        P := Pointer(FieldByName(Id).AsInteger);
        Strings.AddObject(FieldByName(List).DisplayText, P);
        if Assigned(Strings2) and (List2 <> '') then
          Strings2.AddObject(FieldByName(List2).DisplayText, P);
        Next;
      end;
      Close;
    finally
      Free;
    end;
end;

procedure TDM.SetReservToValue(DSet: TTable; ADateTime: TDateTime);
begin
  if ADateTime > DSet.FieldByName('DateAndTime').AsDateTime then
    with DSet do
    begin
      Edit;
      FieldByName('ReservTo').Value := ADateTime;
      Post;
      Refresh;
      if DSet = OrderTable then UpdateOrderState;
    end
  else ErrorDlg(SDataModErrReservTime);
end;

{procedure TDM.UpdateOrderTripCost;
begin
  UpdateQuery(OrderTripSumQry);
  Screen.Cursor := crHourglass;
  ClearOrderTilesTotal(OrderTripTotal);
  UpdateQuery(PersonQry);
  with PersonQry do
    try
      DisableControls;
      PersonTable.DisableControls;
      First;
      while not Eof do
      begin
        if PersonTable.Locate('PersonId', PersonQryPersonId.Value, []) then
        begin
          PersonTable.Edit;
          if OrderTripSumQry.Locate('PersonId', PersonTablePersonId.Value, []) then
          begin
            PersonTableTripTotal.Value := OrderTripSumQrySUMRate.AsCurrency -
              OrderTripSumQrySUMDiscount.AsCurrency +
              OrderTripSumQrySUMIncrease.AsCurrency;
            PersonTableTripTotal2.Value := OrderTripSumQrySUMRate2.AsCurrency -
              OrderTripSumQrySUMDiscount2.AsCurrency +
              OrderTripSumQrySUMIncrease2.AsCurrency;
            PersonTableTrip.AsBoolean :=
              not (PersonTableTripTotal.IsNull or PersonTableTripTotal2.IsNull);
          end
          else PersonTableTrip.AsBoolean := False;
          PersonTable.Post;
          PersonTable.Refresh;
          with OrderTripTotal do
          begin
            Total := Total + PersonTableTripTotal.AsCurrency;
            Total2 := Total2 + PersonTableTripTotal2.AsCurrency;
          end;
        end;
        Next;
      end;
    finally
      PersonTable.EnableControls;
      EnableControls;
      Screen.Cursor := crDefault;
      OrderTripSumQry.Close;
    end;
end;}

{procedure TDM.UpdateOrderHotelCost;
begin
  UpdateQuery(OrderSumQry);
  Screen.Cursor := crHourglass;
  ClearOrderTilesTotal(OrderHotelTotal);
  UpdateQuery(PersonQry);
  with PersonQry do
    try
      DisableControls;
      PersonTable.DisableControls;
      First;
      while not Eof do
      begin
        if PersonTable.Locate('PersonId', PersonQryPersonId.Value, []) then
        begin
          PersonTable.Edit;
          if OrderSumQry.Locate('PersonId', PersonTablePersonId.Value, []) then
          begin
            PersonTableHotelTotal.Value := OrderSumQrySUMRate.AsCurrency -
              OrderSumQrySUMDiscount.AsCurrency +
              OrderSumQrySUMIncrease.AsCurrency;
            PersonTableHotelTotal2.Value := OrderSumQrySUMRate2.AsCurrency -
              OrderSumQrySUMDiscount2.AsCurrency +
              OrderSumQrySUMIncrease2.AsCurrency;
            PersonTableHotel.AsBoolean :=
              not (PersonTableHotelTotal.IsNull or PersonTableHotelTotal2.IsNull);
          end
          else PersonTableHotel.AsBoolean := False;
          PersonTable.Post;
          PersonTable.Refresh;
        end;
        Next;
      end;
    finally
      PersonTable.EnableControls;
      EnableControls;
    end;
  with OrderSumQry do
    try
      First;
      while not Eof do
      begin
        with OrderHotelTotal do
        begin
          Total := Total + OrderSumQrySUMRate.AsCurrency -
            OrderSumQrySUMDiscount.AsCurrency + OrderSumQrySUMIncrease.AsCurrency;
          Total2 := Total2 + OrderSumQrySUMRate2.AsCurrency -
            OrderSumQrySUMDiscount2.AsCurrency + OrderSumQrySUMIncrease2.AsCurrency;
        end;
        Next;
      end;
    finally
      Screen.Cursor := crDefault;
      OrderSumQry.Close;
    end;
end;}

procedure TDM.UpdateOrderState;
begin
  SetOrderStateProc.ParamByName('CURORDER').Value := OrderTableOrderId.Value;
  SetOrderStateProc.ParamByName('LCLCURID').Value := OptionSet.LocaleCurrency;
  SetOrderStateProc.Prepare;
  SetOrderStateProc.ExecProc;
  OrderTable.Refresh;
end;

procedure TDM.UpdatePersonQuery(LocateTourist: Boolean);
begin
  UpdateQuery(PersonQry);
  if LocateTourist then
    PersonQry.Locate('TouristId', TouristTableClientId.Value, []);
end;

procedure TDM.UpdatePlaceTimeOut;
begin
  {SetOrderStateProc.ParamByName('CURORDER').Value := OrderTableOrderId.Value;
  SetOrderStateProc.Prepare;
  SetOrderStateProc.ExecProc;}
end;

procedure TDM.UpdateTouristTemplateList;
begin
  UpdateQuery(AnketTmpQry);
  Screen.Cursor := crHourGlass;
  with AnketTmpQry, FTouristTemplateList do
    try
      Clear;
      Add(SDataModSelectAll);
      while not Eof do
      begin
        AddObject(AnketTmpQryNAME.AsString,
          Pointer(AnketTmpQryTOURISTTEMPLATEID.AsInteger));
        Next;
      end;
      Close;
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure TDM.UpdateTripQuery(InOrder: Boolean; DirKey: Integer;
  const RouteKey, DateKey, StateKey: String);
var Id: Integer;
begin
  Id := TripQueryLeavingId.AsInteger;
  with TripQuery do
  begin
    DisableControls;
    Close;
    Prepare;
    ParamByName('ParRouteId').Value := RouteQryROUTEID.Value;
    ParamByName('ParFromDate').Value := '01.01.2000';
    ParamByName('ParDirection').Value := DirKey;
    Open;
    Locate('LeavingId', Id, []);
    EnableControls;
  end;
end;

procedure TDM.UpdateTripQueryInOrder;
var Id: Integer;
begin
  Id := TripByOrderQryLeavingId.AsInteger;
  with TripByOrderQry do
  begin
    DisableControls;
    SQL[6] := Format('and OrderId = %d', [OrderTableOrderId.Value]);
    UpdateQuery(TripByOrderQry);
    Locate('LeavingId', Id, []);
    EnableControls;
  end;
end;

procedure TDM.UpdateQuery(Qry: TQuery);
const
  pMsg: array[0..10] of Pointer = (@SDataModUpdateQryUnknown,
    @SDataModUpdateQryTrip, @SDataModUpdateQryPlaceCount,
    @SDataModUpdateQryPlaceList, @SDataModUpdateQryDriveFloorTotal,
    @SDataModUpdateQryPlaceByOrder, @SDataModUpdateQryPlaceUpdate,
    @SDataModUpdateQryInsTrip, @SDataModUpdateQryOrderCntry,
    @SDataModUpdateQryHotelServ, @SDataModUpdateQryRoomServ);
var T: Integer;
begin
//  if Qry = PlaceQuery then UpdatePlaceTimeOut;
  T := Qry.Tag;
  if not (T in [1..7]) then T := 0;
  SendMyStatusMsg(LoadResString(pMsg[T]));
  Screen.Cursor := crHourglass;
  with Qry do
  try
    DisableControls;
    {if (Qry = PlaceListQuery) or (Qry = PlaceUpdateQry)
      or (Qry = PlaceByOrderQuery)
    then }Close;
    Prepare;
    Open;
  finally
    Screen.Cursor := crDefault;
    ClearMyStatusMsg;
    EnableControls;
  end;
end;

function TDM.ValidTouristBirthDate: Boolean;
begin
  Result := False;
  with TouristTableBIRTHDATE do
  begin
    if IsNull then ErrorDlg(SDataModErrEmptyBirthDate)
    else if Value >= Date then ErrorFmtDlg(SDataModErrFutureDate, [AsString])
    else if YearAge(Value) > 130 then ErrorDlg(SDataModErrIllegalBirthYear)
    else Result := True;
    if Result then
    begin
      if YearAge(Value) > 99 then InformDlg(SDataModErrTooOldBirthDate)
      else if (YearAge(Value) < 14) and (
        (RelativesTable.RecordCount > 0) or (AnketTableMARRIED.AsInteger > 0))
        then InformDlg(SDataModErrTooYngBirthDate);
    end;
  end;
end;

function TDM.ValidTouristPassportDate: Boolean;
begin
  with TouristTablePASSPORTDATE do
  begin
    Result := IsNull;
    if not Result then
    begin
      if Value <= TouristTableBIRTHDATE.Value then ErrorDlg(SDataModErrIllegalPassportDate)
      else if not TouristTablePASSPORTEXPIRE.IsNull and (Value >= TouristTablePASSPORTEXPIRE.Value) then
        ErrorDlg(SDataModErrIllegalPassportExpire)
      else if Value > Date then ErrorFmtDlg(SDataModErrFutureDate, [AsString])
      else Result := True;
    end;
  end;
end;

procedure TDM.DMCreate(Sender: TObject);
begin
  FFilterByOrder := '';
  Database.Connected := False;
  Database.LoginPrompt := False;
  Database.Params.Values['SERVER NAME'] := OptionSet.DatabaseFolder;
  FOrderTableDiscountChange := False;
  //FPersInsureTableDiscountChange := False;
  FRoomingTableDayCountChange := False;
  FTouristTemplateList := TStringList.Create;
  IsTripInOrder := False;
  IsRoomInOrder := False;
  IsRTaxInOrder := False;
  ChangeLogStrings(Database.Params);
  ClientTable.AutoCalcFields := False;
  TouristTable.AutoCalcFields := False;
  PersonTable.AutoCalcFields := False;
  UsersTable.Open;
  ToursTable.Open;
  UpdateQuery(OrderQuery);
  OrderQuery.Last;
  OrderTable.Open;
  PersonTable.AutoCalcFields := True;
  TouristTable.AutoCalcFields := True;
  ClientTable.AutoCalcFields := True;
  UpdatePlaceTimeOut;  // deadline
  FHistLocality := TStringList.Create;
  FHistNationality := TStringList.Create;
  FHistProfession := TStringList.Create;
  FHistOccupation := TStringList.Create;
  FHistEmployer := TStringList.Create;
  FHistEmplAddress := TStringList.Create;
  BDEDecimalSeparator := GetBDEDecimalSeparator;
  TripSumQry.ParamByName('ParLocalCurr').Value := OptionSet.LocaleCurrency;
  HotelSumQry.ParamByName('ParLocalCurr').Value := OptionSet.LocaleCurrency;
  //ResortSumQry.ParamByName('ParLocalCurr').Value := OptionSet.LocaleCurrency;
  InsureSumQry.ParamByName('ParLocalCurr').Value := OptionSet.LocaleCurrency;
  VisaSumQry.ParamByName('ParLocalCurr').Value := OptionSet.LocaleCurrency;
  OtherSumQry.ParamByName('ParLocalCurr').Value := OptionSet.LocaleCurrency;
end;

procedure TDM.OrderQueryCalcFields(DataSet: TDataSet);
begin
  OrderQueryCalcState.Value := GetOrderPaymentStateName(OrderQuerySTATE.Value);
end;

procedure TDM.OrderTableBeforeOpen(DataSet: TDataSet);
begin
  OpenDataSet(ReklamaTable);
  UpdateQuery(ClientQry);
end;

procedure TDM.OrderTableAfterOpen(DataSet: TDataSet);
begin
  OrderBillTable.Open;
  OrdrCntryTable.Open;
end;

procedure TDM.OrderTableNewRecord(DataSet: TDataSet);
begin
  OrderTableDateAndTime.Value := Now + OptionSet.OrderTimeBias;
  OrderTableReservTo.Value := OrderTableDateAndTime.Value + OptionSet.OrderReservTime;
end;

procedure TDM.OrderTableAfterScroll(DataSet: TDataSet);
var Fltr: String;
begin
  ClientQry.Locate('ClientId', OrderTableClientId.Value, []);
  Fltr := FilterByOrder;
  LookPersonQry.Filter := Fltr;
  PlaceByTripQry.Filter := Fltr;
  RoomingQry.Filter := Fltr;
  PersResortQry.Filter := Fltr;
end;

procedure TDM.OrderTableCalcFields(DataSet: TDataSet);
begin // positive "Discount" == Increase, negative "Discount" == Discount
  OrderTableCalcTotal.Value := OrderTableTotal.AsCurrency - OrderTableDiscountValue.AsCurrency;
  OrderTableCalcTotal2.Value := OrderTableTotal2.AsCurrency - OrderTableDiscountValue2.AsCurrency;
  OrderTableCalcDue.Value := OrderTableCalcTotal.Value - OrderTablePaid.AsCurrency;
  OrderTableCalcDue2.Value := OrderTableCalcTotal2.Value - OrderTablePaid2.AsCurrency;
  OrderTableCalcState.Value := GetOrderPaymentStateName(OrderTableState.Value);
  OrderTableCalcMemo.Value := OrderTableMemo.AsString;
end;

procedure TDM.OrderTableDiscountChange(Sender: TField);
begin
  FOrderTableDiscountChange := True;
  OrderTableDiscountValue.Value :=
    OrderTableTotal.AsCurrency * OrderTableDiscount.AsFloat / 100;
  FOrderTableDiscountChange := False;
end;

procedure TDM.OrderTableDiscount2Change(Sender: TField);
begin
  FOrderTableDiscountChange := True;
  OrderTableDiscountValue2.Value :=
    OrderTableTotal2.AsCurrency * OrderTableDiscount2.AsFloat / 100;
  FOrderTableDiscountChange := False;
end;

procedure TDM.OrderTableDiscountValueChange(Sender: TField);
begin
  if not FOrderTableDiscountChange then
    try
      OrderTableDiscount.Value :=
        OrderTableDiscountValue.AsCurrency / OrderTableTotal.AsCurrency * 100;
    except
      OrderTableDiscount.Value := 0;
    end;
end;

procedure TDM.OrderTableDiscountValue2Change(Sender: TField);
begin
  if not FOrderTableDiscountChange then
    try
      OrderTableDiscount2.Value :=
        OrderTableDiscountValue2.AsCurrency / OrderTableTotal2.AsCurrency * 100;
    except
      OrderTableDiscount.Value := 0;
    end;
end;

procedure TDM.OrderBillTableNewRecord(DataSet: TDataSet);
begin
  OrderBillTableBillDate.Value := Now;
end;

procedure TDM.OrderBillTableCalcFields(DataSet: TDataSet);
begin
  OrderBillTableCalcMethod.Value := PayMethodIdent(OrderBillTablePayMethod.Value);
  with OrderBillTableCalcPaid do
    if OrderBillTableCurrencyRate.IsNull then Clear
    else Value := OrderBillTablePaid.AsCurrency * OrderBillTableCurrencyRate.AsCurrency;
end;

procedure TDM.ClientTableCalcFields(DataSet: TDataSet);
begin
  {if ClientTableIsCompany.AsBoolean then
    ClientTableCalcClient.Value := Format('%s', [ClientTableName.Value])
  else ClientTableCalcClient.Value := ClientTableName.Value;
  ClientTableCalcCountry.Value := ClientTableLookCountry.AsString;
  if ClientTableHomePhone.IsNull then
    ClientTableCalcPhone.Value := ClientTableWorkPhone.Value
  else ClientTableCalcPhone.Value := ClientTableHomePhone.Value;}
end;

procedure TDM.ClientTableNameValidate(Sender: TField);
begin
  if not ConfirmDlgYC(SDataModConfirmClientName) then Abort;
end;

procedure TDM.ClientTableBeforePost(DataSet: TDataSet);
begin
  {if DataSet.FieldByName('Name').AsString = '' then
  begin
    DataSet.Cancel;
    raise EDatabaseError.Create(SDataModErrInvalidName);
  end;}
end;

procedure TDM.ClientQryCalcFields(DataSet: TDataSet);
begin
  ClientQryCalcWorkPhone.Value :=
    ClientQryCNTRYCODE.AsString + ClientQryAREACODE.AsString +
    ClientQryPHONENO.AsString + ClientQryEXTENTION.AsString;
  ClientQryCalcFax.Value :=
    ClientQryFAXCNTRY.AsString + ClientQryFAXAREA.AsString +
    ClientQryFAXNO.AsString + ClientQryFAXEXT.AsString;
  if ClientQryHomePhone.IsNull then
    ClientQryCalcPhone.Value := ClientQryCalcWorkPhone.Value
  else ClientQryCalcPhone.Value := ClientQryHomePhone.Value;
end;

procedure TDM.VendorTableNameValidate(Sender: TField);
begin
  if not ConfirmDlgYC(SDataModConfirmVendorName) then Abort;
end;

procedure TDM.VendorTableCalcFields(DataSet: TDataSet);
begin
  if VendorTableIsCompany.AsBoolean then
    VendorTableCalcClient.Value := Format('%s', [VendorTableName.Value])
  else VendorTableCalcClient.Value := VendorTableName.Value;
  VendorTableCalcCountry.Value := VendorTableLookCountry.AsString;
  if VendorTableHomePhone.IsNull then
    VendorTableCalcPhone.Value := VendorTableWorkPhone.Value
  else VendorTableCalcPhone.Value := VendorTableHomePhone.Value;
end;

procedure TDM.TouristTableAfterOpen(DataSet: TDataSet);
begin
  AnketTable.Open;
  //AnketCountryTable.Open;  -> probably not use
  AnketTmpTable.Open;                          
  AnketVisitTable.Open;
  RelativesTable.Open;
  UpdateTouristTemplateList;
end;

procedure TDM.TouristTablePASSPORTDATEChange(Sender: TField);
begin
  TouristTablePASSPORTEXPIRE.Value := DateAddYear(
    TouristTablePASSPORTDATE.AsDateTime, OptionSet.PassportExpireDuration);
end;

procedure TDM.TouristTablePASSPORTEXPIREChange(Sender: TField);
var
  Chk: TDateTime;
  Exp: Integer;
begin
  Chk := TouristTablePASSPORTEXPIRE.AsDateTime;
  Exp := Round(Chk - Now);
  if Exp <= 0 then ErrorDlg(SDataModErrorPassportExpire)
  else if DateAddMonth(Now, OptionSet.PassportExpireCheckMonths) >= Chk then
    InformFmtDlg(SDataModInformPassportExpire, [Exp, DayCountString(Exp)]);
end;

procedure TDM.RelativesTableNewRecord(DataSet: TDataSet);
begin
  if AnketTable.RecordCount > 0 then
  begin
    RelativesTableBIRTHLOCALITY.Value := AnketTableBIRTHLOCALITY.Value;
    RelativesTableBIRTHCOUNTRY.Value := AnketTableBIRTHCOUNTRY.Value;
    RelativesTableNATIONALITY.Value := AnketTableNATIONALITY.Value;
  end;
  RelativesTableSURNAME.Value := TouristTableSurName.Value;
  RelativesTableSECONDNAME.Value := TouristTableSecondName.Value;
  RelativesTableRELATIVTEXT.Value := RelativeIdent(0);
end;

procedure TDM.PersonTableAfterOpen(DataSet: TDataSet);
begin
  //PersInsureTable.Open;
  //PersVisaTable.Open;
  //RoomingTable.Open;
  //UpdateQuery(HotelByOrderQry);
  UpdateQuery(LookPersonQry);
end;

procedure TDM.PersonQryCalcFields(DataSet: TDataSet);
begin
  PersonQryCalcName.Value :=
    PersonQrySurName.AsString + #32 + PersonQryName.AsString;
  PersonQryCalcMemo.Value := PersonQryMemo.AsString;
  PersonQryCalcMayBePaid.Value := PersonQryTripTotal.AsCurrency +
    PersonQryHotelTotal.AsCurrency + PersonQryTransferTotal.AsCurrency +
    PersonQryVisaTotal.AsCurrency + PersonQryExcursionTotal.AsCurrency +
    PersonQryResortTotal.AsCurrency + PersonQryFirmTotal.AsCurrency +
    PersonQryInsureTotal.AsCurrency;
  PersonQryCalcMayBePaid2.Value := PersonQryTripTotal2.AsCurrency +
    PersonQryHotelTotal2.AsCurrency + PersonQryTransferTotal2.AsCurrency +
    PersonQryVisaTotal2.AsCurrency + PersonQryExcursionTotal2.AsCurrency +
    PersonQryResortTotal2.AsCurrency + PersonQryOTHERTOTAL2.AsCurrency;
  PersonQryCalcDue.Value :=
    PersonQryCalcMayBePaid.AsCurrency - PersonQryTotalPaid.AsCurrency;
  PersonQryCalcDue2.Value :=
    PersonQryCalcMayBePaid2.AsCurrency - PersonQryTotalPaid2.AsCurrency;
end;

procedure TDM.CountryTableAfterOpen(DataSet: TDataSet);
begin
  with OptionSet do
    if LastOpTMCountry = 0 then CountryTable.Locate('CountryId', DefaultCountry, [])
    else CountryTable.Locate('CountryId', LastOpTMCountry, []);
end;

procedure TDM.CountryTableBeforePost(DataSet: TDataSet);
begin
  with CountryTableName do Value := CapitalName(AsString);
end;

procedure TDM.CountryTableBeforeDelete(DataSet: TDataSet);
begin
  if CityByCntryTable.RecordCount > 0 then
    raise EDatabaseError.CreateFmtHelp(
      SDataModDeleteExceptCountry, [CountryTableName.AsString], 0);
end;

procedure TDM.CityByCntryTableAfterOpen(DataSet: TDataSet);
begin
  with OptionSet do
    if LastOpTMCity > 0 then CityByCntryTable.Locate('CityId', LastOpTMCity, []);
end;

procedure TDM.CityByCntryTableNewRecord(DataSet: TDataSet);
begin
  CityByCntryTableCountryId.Value := CountryTableCountryId.Value;
end;

procedure TDM.RouteQryAfterOpen(DataSet: TDataSet);
begin
  with OptionSet do
    if LastOpTMRoute > 0 then RouteQry.Locate('RouteId', LastOpTMRoute, []);
  OpenDataSet(SheduleTable);
  UpdateQuery(RoutVendorQry);
  RouteQryAfterScroll(DataSet);
  OpenDataSet(ShedItemTable);
end;

procedure TDM.RouteQryAfterScroll(DataSet: TDataSet);
begin
  SendMessage(MainFormHandle, DM_ROUTETBLSCROLLED, RouteQryROUTEID.AsInteger, 0);
end;

procedure TDM.RouteQryCalcFields(DataSet: TDataSet);
var S: String;
begin
  with RouteQryFromCity do
    RouteQryCalcIsVoyage.AsBoolean :=
      not IsNull and (Value = RouteQryArriveCity.Value);
  RouteQryCalcTransit.Value := RouteQryTransit.AsString;
  with RouteQryCalcTransit do
    if AsString = '' then
      S := '' else S := Format(SDataModTransitText, [AsString]);
  RouteQryCalcText.Value := Format('%d.%s - %s (%s) %s', [
    RouteQryROUTEID.AsInteger,
    RouteQryDEPART.AsString, RouteQryARRIVE.AsString, RouteQryKIND.AsString, S]);
end;

procedure TDM.RouteSelQryCalcFields(DataSet: TDataSet);
begin
  RouteSelQryCalcTransit.Value := RouteSelQryTransit.AsString;
end;

procedure TDM.SheduleTableCalcFields(DataSet: TDataSet);
begin
  if RouteQryCalcIsVoyage.AsBoolean then
    SheduleTableCalcShedule.Value := Format(SDataModSheduleCalc2, [
      SheduleTableSHEDULENAME.AsString,
      FormatDateTime('hh:nn', SheduleTableDepartFTime.AsDateTime),
      FormatDateTime('hh:nn', SheduleTableArriveFTime.AsDateTime)])
  else
    SheduleTableCalcShedule.Value := Format(SDataModSheduleCalc1, [
      SheduleTableSHEDULENAME.AsString,
      FormatDateTime('hh:nn', SheduleTableDepartFTime.AsDateTime),
      FormatDateTime('hh:nn', SheduleTableArriveFTime.AsDateTime),
      FormatDateTime('hh:nn', SheduleTableDepartBTime.AsDateTime),
      FormatDateTime('hh:nn', SheduleTableArriveBTime.AsDateTime)]);
end;

procedure TDM.TripQueryAfterScroll(DataSet: TDataSet);
begin
  //UpdateQuery(PlaceListQuery);
  SendMessage(
    MainFormHandle, dm_TripsQryScrolled, TripQueryLeavingId.AsInteger, 0);
end;

procedure TDM.TripQueryCalcFields(DataSet: TDataSet);
begin
  if TripQueryDirection.Value = 0 then
  begin
    TripQueryCalcFrom.Value := TripQueryFROMCITY.Value;
    TripQueryCalcArrive.Value := TripQueryARRIVECITY.Value;
  end
  else begin
    TripQueryCalcFrom.Value := TripQueryARRIVECITY.Value;
    TripQueryCalcArrive.Value := TripQueryFROMCITY.Value;
  end;
end;

procedure TDM.TripByOrderQryAfterOpen(DataSet: TDataSet);
begin
  //if PlaceByTripQry.DataSource.DataSet = DataSet then
    RouteStopsQry.Filter := 'Direction = ' + TripByOrderQryDIRECTION.AsString;
end;

procedure TDM.TripByOrderQryCalcFields(DataSet: TDataSet);
begin
  if TripByOrderQryDirection.Value = 0 then
  begin
    TripByOrderQryCalcFrom.Value := TripByOrderQryFROMCITY.Value;
    TripByOrderQryCalcArrive.Value := TripByOrderQryARRIVECITY.Value;
  end
  else begin
    TripByOrderQryCalcFrom.Value := TripByOrderQryARRIVECITY.Value;
    TripByOrderQryCalcArrive.Value := TripByOrderQryFROMCITY.Value;
  end;
end;

procedure TDM.PlaceByTripTableBeforeOpen(DataSet: TDataSet);
begin
  UpdateQuery(RouteStopsQry);
end;

procedure TDM.PlaceByTripTableNewRecord(DataSet: TDataSet);
begin
  PlaceByTripTableStartCity.Value :=  RouteQryFROMCITY.Value;
  PlaceByTripTableStopCity.Value :=  RouteQryARRIVECITY.Value;
  PlaceByTripTableOrderId.Value := OrderTableOrderId.Value;
  PlaceByTripTableState.Value := plcUsed;
end;

procedure TDM.PlaceByTripTableCalcFields(DataSet: TDataSet);
begin
  PlaceByTripTableCalcState.Value := GetPlacePayStateName(PlaceByTripTableState.Value);
end;

procedure TDM.PlaceByTripTableAfterPost(DataSet: TDataSet);
begin
  PlaceMapTable.Refresh;
end;

procedure TDM.PlaceMapTableAfterPost(DataSet: TDataSet);
begin
  if IsTripInOrder then UpdateQuery(PlaceListQuery);
end;

procedure TDM.PlaceListQueryBeforeOpen(DataSet: TDataSet);
begin
  PlaceListQuery.Filter := ChooseCaptionString(IsTripInOrder,
    Format('OrderId = %d', [OrderTableOrderId.AsInteger]), '');
end;

procedure TDM.PlaceListQueryAfterOpen(DataSet: TDataSet);
//var Ttl1, Ttl2: Currency;
begin
  {if IsTripInOrder then
  begin
    Ttl1 := 0;
    Ttl2 := 0;
    with PlaceListQuery do
    begin
      DisableControls;
      while not Eof do
      begin
        Ttl1 := Ttl1 + PlaceListQueryRate.AsCurrency;
        Ttl2 := Ttl2 + PlaceListQueryRate2.AsCurrency;
        Next;
      end;
      First;
      EnableControls;
    end;
    OrderTable.Edit;
    OrderTableTotal.Value := Ttl1;
    OrderTableTotal2.Value := Ttl2;
    OrderTable.Post;
  end;}
end;

procedure TDM.PlaceListQueryCalcFields(DataSet: TDataSet);
begin
  PlaceListQueryCalcState.Value := GetPlacePayStateName(PlaceListQueryState.Value);
end;

procedure TDM.HotelQryAfterOpen(DataSet: TDataSet);
begin
  with OptionSet do
    if LastOpTMHotel > 0 then HotelQry.Locate('HotelId', LastOpTMHotel, []);
  UpdateQuery(HtlVendorQry); // used in RoomPrintForm & viewed in RoomsEditForm
  OpenDataSet(FeedTable);
  OpenDataSet(RoomTable);
  RoomTable.Refresh;
end;

procedure TDM.HotelSrcDataChange(Sender: TObject; Field: TField);
begin
  SendMessage(
    MainFormHandle, dm_HotelTblScrolled, HotelQryHotelId.AsInteger, 0);
end;

procedure TDM.HotelByOrderQryAfterScroll(DataSet: TDataSet);
begin
  {SendMessage(
    MainFormHandle, dm_HotelQryScrolled, HotelByOrderQryHotelId.AsInteger, 0);}
end;

procedure TDM.RoomingQryCalcFields(DataSet: TDataSet);
begin
  RoomingQryCalcToDate.Value :=
    Int(RoomingQryFROMDATE.AsDateTime) + RoomingQryDayCount.AsInteger;
end;

procedure TDM.RoomingTableNewRecord(DataSet: TDataSet);
begin
  RoomingTableHotelId.Value := HotelQryHOTELID.Value;
end;

procedure TDM.RoomTableBeforeOpen(DataSet: TDataSet);
begin
  RoomTypeTable.Open;
end;

procedure TDM.RoomTableCalcFields(DataSet: TDataSet);
begin
  RoomTableCalcRoom.Value := Format('%s (%d)', [
    RoomTableLookRoomType.AsString, RoomTableLookRoomCap.AsInteger]);
end;

procedure TDM.OrdInsureQryAfterScroll(DataSet: TDataSet);
begin
  PersInsureQry.Filter := Format('INSUREKIND = %d', [OrdInsureQryINSUREKIND.AsInteger]);
end;

procedure TDM.PersInsureQryCalcFields(DataSet: TDataSet);
begin
  with PersInsureQryCalcToDate do
    if PersInsureQryFROMDATE.IsNull then Clear
    else Value := PersInsureQryFROMDATE.AsDateTime + PersInsureQryDAYCOUNT.Value - 1;
end;

procedure TDM.PersInsureTableRATEChange(Sender: TField);
begin
  if PersInsureTableINSUREKIND.Value = nInsureKindMedical
    then PersInsureTableMEDICALRATEChange(Sender)
    else PersInsureTableUNHAPPYRATEChange(Sender);
end;

procedure TDM.PersInsureTableMEDICALRATEChange(Sender: TField);
var
  Rate, Net: Currency;
  DiscType: TDiscountCalcType;
begin
  if OrderTableOrderId.Value = PersInsureTableOrderId.Value then
  begin
    if OrderTableINSUREDISCTYPE.IsNull then DiscType := insDiscountCalcOur
      else DiscType := OrderTableINSUREDISCTYPE.AsInteger;
    Rate := PersInsureTableRATE.AsCurrency;
    Net := PersInsureTableRATE.AsCurrency * (1 - PersInsureTableDiscount.AsFloat);
    case DiscType of
      insDiscountCalcOur:
      begin
        PersInsureTablePAY.Value := Rate;
        PersInsureTableNETVAL.Value := Net;
      end;
      insDiscountCalcClient:
      begin
        PersInsureTablePAY.Value := Net;
        PersInsureTableNETVAL.Value := Rate;
      end;
      else begin
        PersInsureTablePAY.Value := Rate;
        PersInsureTableNETVAL.Value := Rate;
      end;
    end;
  end;
end;

procedure TDM.PersInsureTableUNHAPPYRATEChange(Sender: TField);
begin
  PersInsureTablePAY.Value := PersInsureTableRATE.Value;
end;

procedure TDM.PersInsureTableDiscountChange(Sender: TField);
begin
  PersInsureTableRATEChange(Sender);
end;

procedure TDM.PersInsureTableNewRecord(DataSet: TDataSet);
begin
  PersInsureTableOrderId.Value := OrderTableOrderId.Value;
  PersInsureTablePersonId.Value := PersonQryPersonId.Value;
end;

procedure TDM.PersInsureTableCalcFields(DataSet: TDataSet);
begin
  with PersInsureTableFromDate do
    if IsNull then PersInsureTableCalcToDate.Clear
    else PersInsureTableCalcToDate.Value :=
      AsDateTime + PersInsureTableDayCount.Value - 1;
end;

procedure TDM.PersResortTableNewRecord(DataSet: TDataSet);
begin
  PersResortTableORDERID.Value := OrderTableOrderId.Value;
end;

procedure TDM.OrdrCntryQryAfterScroll(DataSet: TDataSet);
begin
  PersVisaQry.Filter := Format('ORDERCNTRYID = %d', [OrdrCntryQryORDERCNTRYID.AsInteger]);
end;

procedure TDM.OrdrCntryQryCalcFields(DataSet: TDataSet);
begin
  OrdrCntryQryCalcNeedVisa.Value := LoadResString(pBoolAsYesNo[OrdrCntryQryNEEDVISA.AsBoolean]);
end;

procedure TDM.PersVisaTableNewRecord(DataSet: TDataSet);
begin
  PersVisaTableORDERID.Value := OrderTableOrderId.Value;
end;

procedure TDM.PersVisaQryCalcFields(DataSet: TDataSet);
const pSt: array[0..2] of Pointer =
  (@SDataModDocState0, @SDataModDocState1, @SDataModDocState2);
begin
  PersVisaQryCalcAnketState.Value := LoadResString(pSt[PersVisaQryANKETSTATE.AsInteger]);
  PersVisaQryCalcDocumState.Value := LoadResString(pSt[PersVisaQryDOCUMSTATE.AsInteger]);
  PersVisaQryCalcNeedVisa.Value := LoadResString(pBoolAsYesNo[PersVisaQryNEEDVISA.AsBoolean]);
end;

procedure TDM.OrdOtherQryAfterScroll(DataSet: TDataSet);
begin
  PersOtherQry.Filter := Format('SERVCODEID = %d', [OrdOtherQrySERVCODEID.AsInteger]);
end;

procedure TDM.PersOtherQryCalcFields(DataSet: TDataSet);
begin
  PersOtherQryCalcServData.Value := PersOtherQryServData.AsString;
end;

procedure TDM.OrderPayQryAfterScroll(DataSet: TDataSet);
begin
  PersonPayQry.Filter := Format('CurrId = %d', [OrderPayQryCURRENCYID.AsInteger]);
end;

procedure TDM.OrderPayQryCalcFields(DataSet: TDataSet);
begin
  OrderPayQryCalcDue.Value :=
    OrderPayQryTOTAL.AsCurrency - OrderPayQryPAID.AsCurrency;
end;

procedure TDM.PersonPayQryCalcFields(DataSet: TDataSet);
begin
  PersonPayQryCalcDue.Value :=
    PersonPayQryTOTAL.AsCurrency - PersonPayQryPAID.AsCurrency;
end;

procedure TDM.PersonPayTableBeforePost(DataSet: TDataSet);
begin
  PersonPayTableTOTAL.Value :=
    PersonPayTableTRIPTOTAL.AsCurrency + PersonPayTableTRANSFERTOTAL.AsCurrency +
    PersonPayTableHOTELTOTAL.AsCurrency + PersonPayTableRESORTTOTAL.AsCurrency +
    PersonPayTableVISATOTAL.AsCurrency + PersonPayTableEXCURSIONTOTAL.AsCurrency +
    PersonPayTableINSURETOTAL.AsCurrency + PersonPayTableOTHERTOTAL.AsCurrency;
  PersonPayTablePAID.Value :=
    PersonPayTableTRIPPAID.AsCurrency + PersonPayTableTRANSFERPAID.AsCurrency +
    PersonPayTableHOTELPAID.AsCurrency + PersonPayTableRESORTPAID.AsCurrency +
    PersonPayTableVISAPAID.AsCurrency + PersonPayTableEXCURSIONPAID.AsCurrency +
    PersonPayTableINSUREPAID.AsCurrency + PersonPayTableOTHERPAID.AsCurrency;
end;

procedure TDM.AnketTableNewRecord(DataSet: TDataSet);
begin
  AnketTableTOURISTID.Value := TouristTableClientId.Value;
  AnketTableENDVISA.AsBoolean := False;
  AnketTableRETURNVISA1.AsBoolean := False;
  AnketTableRETURNVISA2.AsBoolean := False;
end;

procedure TDM.GuideLstQryCalcFields(DataSet: TDataSet);
begin
  GuideLstQryCalcDue.Value := GuideLstQryINSURETOTAL.Value +
    GuideLstQryFIRMTOTAL.Value - GuideLstQryTOTALPAID.Value;
  GuideLstQryCalcDue2.Value := GuideLstQryTRIPTOTAL2.Value +
    GuideLstQryHOTELTOTAL2.Value + GuideLstQryTRANSFERTOTAL2.Value +
    GuideLstQryRESORTTOTAL2.Value - GuideLstQryTOTALPAID.Value;
end;

procedure TDM.ToursTableAfterOpen(DataSet: TDataSet);
begin
  //UpdateQuery(TourGroupQry);
end;

procedure TDM.DMDestroy(Sender: TObject);
begin
  if HotelQry.Active then OptionSet.LastOpTMHotel := HotelQryHOTELID.Value;
  if CityByCntryTable.Active then OptionSet.LastOpTMCity := CityByCntryTableCityId.Value;
  if CountryTable.Active then OptionSet.LastOpTMCountry := CountryTableCountryId.Value;
  if RouteQry.Active then OptionSet.LastOpTMRoute := RouteQryROUTEID.Value;
  with Database do
  begin
    //if InTransaction then Commit;
    Connected := False;
  end;
  FHistEmplAddress.Free;
  FHistEmployer.Free;
  FHistOccupation.Free;
  FHistProfession.Free;
  FHistNationality.Free;
  FHistLocality.Free;
  FTouristTemplateList.Free;
end;

end.
