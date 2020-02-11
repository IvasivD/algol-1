unit UnitDM;

interface

uses
  SysUtils, Classes, DB, Dialogs,IBCustomDataSet, IBQuery, IBDatabase, Core,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,Variants,
  cxTextEdit,UnitProc,FrmProgress,Forms, cxDBLookupComboBox,IBUpdateSQL,Clipbrd,UnitIBQuery,
  cxDBExtLookupComboBox, ADODB, IBTable ;

type
  TDM = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction: TIBTransaction;
    Country: TIBQuery;
    CountrySrc: TDataSource;
    CountryDetail: TIBQuery;
    CountryDetailSrc: TDataSource;
    CountryDetailTypes: TIBQuery;
    CountryDetailTypesSrc: TDataSource;
    CountryDetailTypesID: TIntegerField;
    CountryDetailTypesNAME: TIBStringField;
    CountryDetailID: TIntegerField;
    CountryDetailCOUNTRY_ID: TIntegerField;
    CountryDetailCOUNTRY_DET_TYPE_ID: TIntegerField;
    CountryDetailAVALUE: TIBStringField;
    CountryDetailFILE: TBlobField;
    CountryDetailURL: TBlobField;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewCountryList: TcxGridDBTableView;
    CountryCOUNTRY_ID: TIntegerField;
    CountrySHORTNAME: TIBStringField;
    CountryTITLE_RU: TIBStringField;
    CountryTITLE_UA: TIBStringField;
    CountryTITLE_EN: TIBStringField;
    CountryGEO_LAT: TFloatField;
    CountryGEO_LNG: TFloatField;
    ViewCountryListCOUNTRY_ID: TcxGridDBColumn;
    ViewCountryListSHORTNAME: TcxGridDBColumn;
    ViewCountryListTITLE_RU: TcxGridDBColumn;
    ViewCountryListTITLE_UA: TcxGridDBColumn;
    ViewCountryListTITLE_EN: TcxGridDBColumn;
    ViewCountryListGEO_LAT: TcxGridDBColumn;
    ViewCountryListGEO_LNG: TcxGridDBColumn;
    CountryDetailLokUpTypeName: TStringField;
    ViewDetail: TcxGridDBTableView;
    ViewDetailID: TcxGridDBColumn;
    ViewDetailCOUNTRY_ID: TcxGridDBColumn;
    ViewDetailCOUNTRY_DET_TYPE_ID: TcxGridDBColumn;
    ViewDetailAVALUE: TcxGridDBColumn;
    ViewDetailAFILE: TcxGridDBColumn;
    ViewDetailAURL: TcxGridDBColumn;
    ViewDetailLokUpTypeName: TcxGridDBColumn;
    ViewCountry: TcxGridDBTableView;
    ViewRegion: TcxGridDBTableView;
    ViewCity: TcxGridDBTableView;
    Region: TIBQuery;
    RegionSrc: TDataSource;
    RegionREGION_ID: TIntegerField;
    RegionCOUNTRY_ID: TIntegerField;
    RegionTITLE_RU: TIBStringField;
    RegionTITLE_UA: TIBStringField;
    RegionTITLE_EN: TIBStringField;
    RegionTITLE_ORIGINAL: TIBStringField;
    RegionGEO_LAT: TFloatField;
    RegionGEO_LNG: TFloatField;
    ViewCountryCOUNTRY_ID: TcxGridDBColumn;
    ViewCountrySHORTNAME: TcxGridDBColumn;
    ViewCountryTITLE_RU: TcxGridDBColumn;
    ViewCountryTITLE_UA: TcxGridDBColumn;
    ViewCountryTITLE_EN: TcxGridDBColumn;
    ViewCountryGEO_LAT: TcxGridDBColumn;
    ViewCountryGEO_LNG: TcxGridDBColumn;
    ViewRegionREGION_ID: TcxGridDBColumn;
    ViewRegionCOUNTRY_ID: TcxGridDBColumn;
    ViewRegionTITLE_RU: TcxGridDBColumn;
    ViewRegionTITLE_UA: TcxGridDBColumn;
    ViewRegionTITLE_EN: TcxGridDBColumn;
    ViewRegionTITLE_ORIGINAL: TcxGridDBColumn;
    ViewRegionGEO_LAT: TcxGridDBColumn;
    ViewRegionGEO_LNG: TcxGridDBColumn;
    City: TIBQuery;
    CitySrc: TDataSource;
    CityCITY_ID: TIntegerField;
    CityCOUNTRY_ID: TIntegerField;
    CityIMPORTANT: TSmallintField;
    CityREGION_ID: TIntegerField;
    CityTITLE_RU: TIBStringField;
    CityTITLE_UA: TIBStringField;
    CityTITLE_EN: TIBStringField;
    CityTITLE_ORIGINAL: TIBStringField;
    CityGEO_LAT: TFloatField;
    CityGEO_LNG: TFloatField;
    ViewCityCITY_ID: TcxGridDBColumn;
    ViewCityCOUNTRY_ID: TcxGridDBColumn;
    ViewCityIMPORTANT: TcxGridDBColumn;
    ViewCityREGION_ID: TcxGridDBColumn;
    ViewCityTITLE_RU: TcxGridDBColumn;
    ViewCityTITLE_UA: TcxGridDBColumn;
    ViewCityTITLE_EN: TcxGridDBColumn;
    ViewCityTITLE_ORIGINAL: TcxGridDBColumn;
    ViewCityGEO_LAT: TcxGridDBColumn;
    ViewCityGEO_LNG: TcxGridDBColumn;
    RegionAll: TIBQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    CityRegion: TIBQuery;
    CityRegionCITY_ID: TIntegerField;
    CityRegionCOUNTRY_ID: TIntegerField;
    CityRegionREGION_ID: TIntegerField;
    CityRegionAREA_RU: TIBStringField;
    CityRegionTITLE_RU: TIBStringField;
    CityRegionAREA_ID: TIntegerField;
    ViewCountryTO: TcxGridDBTableView;
    IBDatabaseTO: TIBDatabase;
    IBTransactionTO: TIBTransaction;
    CounrtyTO: TIBQuery;
    CounrtyTOSrc: TDataSource;
    CountryCOUNTRY_ID_TO: TIntegerField;
    CounrtyTOCOUNTRYID: TIntegerField;
    CounrtyTONAME: TIBStringField;
    CounrtyTOFULLNAME: TIBStringField;
    ViewCountryTOCOUNTRYID: TcxGridDBColumn;
    ViewCountryTONAME: TcxGridDBColumn;
    ViewCountryTOFULLNAME: TcxGridDBColumn;
    ViewCountryFrom: TcxGridDBTableView;
    ViewCountryFromCOUNTRY_ID: TcxGridDBColumn;
    ViewCountryFromSHORTNAME: TcxGridDBColumn;
    ViewCountryFromTITLE_RU: TcxGridDBColumn;
    ViewCountryFromTITLE_UA: TcxGridDBColumn;
    ViewCountryFromTITLE_EN: TcxGridDBColumn;
    ViewCountryFromGEO_LAT: TcxGridDBColumn;
    ViewCountryFromGEO_LNG: TcxGridDBColumn;
    ViewCountryFromCOUNTRY_ID_TO: TcxGridDBColumn;
    ProvincesTO: TIBQuery;
    ProvincesTOSrc: TDataSource;
    ViewRegionTO: TcxGridDBTableView;
    ViewRegionTOCOUNTRYID: TcxGridDBColumn;
    ViewRegionTOPROVINCEID: TcxGridDBColumn;
    ViewRegionTONAME: TcxGridDBColumn;
    ViewRegionFrom: TcxGridDBTableView;
    ViewRegionFromREGION_ID: TcxGridDBColumn;
    ViewRegionFromCOUNTRY_ID: TcxGridDBColumn;
    ViewRegionFromTITLE_RU: TcxGridDBColumn;
    ViewRegionFromTITLE_UA: TcxGridDBColumn;
    ViewRegionFromTITLE_EN: TcxGridDBColumn;
    ViewRegionFromTITLE_ORIGINAL: TcxGridDBColumn;
    ViewRegionFromGEO_LAT: TcxGridDBColumn;
    ViewRegionFromGEO_LNG: TcxGridDBColumn;
    RegionAllSrc: TDataSource;
    RegionAllREGION_ID_TO: TIntegerField;
    Area: TIBQuery;
    AreaSrc: TDataSource;
    AreaAREA_ID: TIntegerField;
    AreaREGION_ID: TIntegerField;
    AreaCOUNTRY_ID: TIntegerField;
    AreaTITLE_RU: TIBStringField;
    AreaTITLE_UA: TIBStringField;
    AreaTITLE_EN: TIBStringField;
    AreaTITLE_ORIGINAL: TIBStringField;
    ViewRegionFromREGION_ID_TO: TcxGridDBColumn;
    RegionAllCOUNTRY_ID_TO: TIntegerField;
    ViewRegionFromCOUNTRY_ID_TO: TcxGridDBColumn;
    ViewRegionFromCOUNTRY_IDlookUp: TcxGridDBColumn;
    TownShipTo: TIBQuery;
    TownShipToSrc: TDataSource;
    ViewArea: TcxGridDBTableView;
    ViewAreaAREA_ID: TcxGridDBColumn;
    ViewAreaREGION_ID: TcxGridDBColumn;
    ViewAreaCOUNTRY_ID: TcxGridDBColumn;
    ViewAreaTITLE_RU: TcxGridDBColumn;
    ViewAreaTITLE_UA: TcxGridDBColumn;
    ViewAreaTITLE_EN: TcxGridDBColumn;
    ViewAreaTITLE_ORIGINAL: TcxGridDBColumn;
    AreaAREA_ID_TO: TIntegerField;
    ViewAreaAREA_ID_TO: TcxGridDBColumn;
    ViewAreaTo: TcxGridDBTableView;
    TownShipToTOWNSHIPID: TIntegerField;
    TownShipToCOUNTRYID: TIntegerField;
    TownShipToPROVINCEID: TIntegerField;
    TownShipToCAPITAL: TIBStringField;
    TownShipToNAME: TIBStringField;
    ViewAreaToTOWNSHIPID: TcxGridDBColumn;
    ViewAreaToCOUNTRYID: TcxGridDBColumn;
    ViewAreaToPROVINCEID: TcxGridDBColumn;
    ViewAreaToCAPITAL: TcxGridDBColumn;
    ViewAreaToNAME: TcxGridDBColumn;
    AreaCOUNTRY_ID_TO: TIntegerField;
    AreaREGION_ID_TO: TIntegerField;
    ViewAreaCOUNTRY_ID_TO: TcxGridDBColumn;
    ViewAreaREGION_ID_TO: TcxGridDBColumn;
    ViewAreaToList: TcxGridDBTableView;
    ViewAreaToListTOWNSHIPID: TcxGridDBColumn;
    ViewAreaToListCOUNTRYID: TcxGridDBColumn;
    ViewAreaToListPROVINCEID: TcxGridDBColumn;
    ViewAreaToListCAPITAL: TcxGridDBColumn;
    ViewAreaToListNAME: TcxGridDBColumn;
    CityAREA_ID: TIntegerField;
    CityCOUNTRY_ID_TO: TIntegerField;
    CityREGION_ID_TO: TIntegerField;
    CityAREA_ID_TO: TIntegerField;
    ViewCityAREA_ID: TcxGridDBColumn;
    ViewCityCOUNTRY_ID_TO: TcxGridDBColumn;
    ViewCityREGION_ID_TO: TcxGridDBColumn;
    ViewCityAREA_ID_TO: TcxGridDBColumn;
    CityTo: TIBQuery;
    CityToSrc: TDataSource;
    CityToCITYID: TIntegerField;
    CityToCOUNTRYID: TIntegerField;
    CityToPROVINCEID: TIntegerField;
    CityToTOWNSHIPID: TIntegerField;
    CityToNAME: TIBStringField;
    ViewCityTo: TcxGridDBTableView;
    ViewCityToCITYID: TcxGridDBColumn;
    ViewCityToCOUNTRYID: TcxGridDBColumn;
    ViewCityToPROVINCEID: TcxGridDBColumn;
    ViewCityToTOWNSHIPID: TcxGridDBColumn;
    ViewCityToNAME: TcxGridDBColumn;
    CityCITY_ID_TO: TIntegerField;
    ViewCityCITY_ID_TO: TcxGridDBColumn;
    ViewCityToList: TcxGridDBTableView;
    ViewCityToListCITYID: TcxGridDBColumn;
    ViewCityToListCOUNTRYID: TcxGridDBColumn;
    ViewCityToListPROVINCEID: TcxGridDBColumn;
    ViewCityToListTOWNSHIPID: TcxGridDBColumn;
    ViewCityToListNAME: TcxGridDBColumn;
    ADOConnection1: TADOConnection;
    ADOCity: TADODataSet;
    AdoCitySrc: TDataSource;
    ADOCityCITY_ID: TIntegerField;
    ADOCityCOUNTRY_ID: TIntegerField;
    ADOCityIMPORTANT: TSmallintField;
    ADOCityREGION_ID: TIntegerField;
    ADOCityAREA_ID: TIntegerField;
    ADOCityTITLE_ORIGINAL: TStringField;
    ADOCityGEO_LAT: TFloatField;
    ADOCityGEO_LNG: TFloatField;
    ADOCityCITY_ID_TO: TIntegerField;
    ADOCityCOUNTRY_ID_TO: TIntegerField;
    ADOCityREGION_ID_TO: TIntegerField;
    ADOCityAREA_ID_TO: TIntegerField;
    ViewCityColumn1: TcxGridDBColumn;
    ADOConnection2: TADOConnection;
    ADOProvincesTO: TADODataSet;
    ADOProvincesTOCOUNTRYID: TIntegerField;
    ADOProvincesTOPROVINCEID: TIntegerField;
    ADOProvincesTONAME: TStringField;
    ADOProvincesTOMEMO: TMemoField;
    ADOProvincesTOSHORTSIGN: TStringField;
    ADOProvincesTONAME_ENG: TStringField;
    ADOProvincesTOGOVCODE: TIntegerField;
    ADOProvincesTOCAPITALID: TIntegerField;
    ADOProvincesTOUNITTYPEID: TIntegerField;
    ProvincesTOCOUNTRYID: TIntegerField;
    ProvincesTOPROVINCEID: TIntegerField;
    ProvincesTONAME: TIBStringField;
    ProvincesTOMEMO: TMemoField;
    ProvincesTOSHORTSIGN: TIBStringField;
    ProvincesTONAME_ENG: TIBStringField;
    ProvincesTOCAPITALID: TIntegerField;
    ProvincesTOUNITTYPEID: TIntegerField;
    TestQuery_: TIBQuery;
    IBTableTest: TIBTable;
    CountryDetailID1: TIntegerField;
    CountryDetailNAME: TIBStringField;
    CountryDetailUSE_ID_TO: TIntegerField;
    COUNTRIES_INFOTo: TIBQuery;
    COUNTRIES_INFOSrc: TDataSource;
    ViewDetailNAME: TcxGridDBColumn;
    ViewDetailUSE_ID_TO: TcxGridDBColumn;
    LanguagesTO: TIBQuery;
    TIME_ZONETo: TIBQuery;
    TIME_ZONEToID: TIntegerField;
    TIME_ZONEToNAME: TIBStringField;
    LanguagesTOID: TIntegerField;
    LanguagesTONAME: TIBStringField;
    LanguagesTOORIGINAL_NAME: TIBStringField;
    FORM_GOVERNMENT: TIBQuery;
    FORM_GOVERNMENTID: TIntegerField;
    FORM_GOVERNMENTNAME: TIBStringField;
    FORM_GOVERNMENTNOTE: TMemoField;
    CurrencyTo: TIBQuery;
    CurrencyToCURRENCYID: TIntegerField;
    CurrencyToCURRENCYNAME: TIBStringField;
    CurrencyToCURRENCYSHORT: TIBStringField;
    TestQuery_CITY_ID: TIntegerField;
    TestQuery_TITLE_EN: TIBStringField;
    IBTableTestCITY_ID: TIntegerField;
    IBTableTestTITLE_EN: TIBStringField;
    TestQuery: TADODataSet;
    CityToNAME_ORIGINAL: TIBStringField;
    CityToNew: TIBDataSet;
    CityNew: TIBDataSet;
    CityNewCITY_ID: TIntegerField;
    CityNewCOUNTRY_ID: TIntegerField;
    CityNewIMPORTANT: TSmallintField;
    CityNewREGION_ID: TIntegerField;
    CityNewAREA_ID: TIntegerField;
    CityNewTITLE_RU: TIBStringField;
    CityNewTITLE_UA: TIBStringField;
    CityNewTITLE_EN: TIBStringField;
    CityNewTITLE_ORIGINAL: TIBStringField;
    CityNewGEO_LAT: TFloatField;
    CityNewGEO_LNG: TFloatField;
    CityNewCITY_ID_TO: TIntegerField;
    CityNewCOUNTRY_ID_TO: TIntegerField;
    CityNewREGION_ID_TO: TIntegerField;
    CityNewAREA_ID_TO: TIntegerField;
    AdoCITYTO: TADODataSet;
    ProvincesTONAME_ORIGINAL: TIBStringField;
    ProvincesTOGOVCODE: TIntegerField;
    CityToCOUNTRY_NAME: TIBStringField;
    TIME_ZONEToAVALUE: TIBBCDField;
    ADOCityTITLE_RU: TStringField;
    ADOCityTITLE_UA: TStringField;
    ADOCityTITLE_EN: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ViewCountryFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private

    procedure InitElements;
    { Private declarations }
  public
    ParseByField:String;
    procedure GenTranslateSQL(CaptionProgres,FiledCaption:Widestring; Elem,ElemTo:TDBShemaView; IdFieldTo,idParentTable, TableTranslate:Widestring );
    procedure PrepareTestSQL;
    { Public declarations }
  end;

  Procedure FindSimilarCountry;
  Procedure FindSimilarRegion;
  function  FindSimilarRegionToID( CountryId:Variant; RegionName:Widestring; Similar:Boolean =True):Integer;

  Procedure FindSimilarArea;
  Procedure FindSimilarCity;

  procedure CorrectDatasetReplaseDel( DB:TDataset; Fields:array of String; Del, FromRepl, ToRepl:Widestring; CasePrepare:Boolean   );
  procedure ParepareClearValue(var aValue:widestring;SymblBegin,SymbEnd:wideString);
var
  DM: TDM;
  Elem_Country:TDBShemaView;
  Elem_Region :TDBShemaView;
  Elem_Area :TDBShemaView;
  Elem_City   :TDBShemaView;
  //Elem_CityRegion :TDBShemaView;

  Elem_CountryDetail:TDBShemaView;
  Elem_CountryDetailTypes:TDBShema;

  Elem_CounrtyTO:TDBShemaView;
  Elem_RegionTO :TDBShemaView;
  Elem_AreaTO   :TDBShemaView;
  Elem_CityTO   :TDBShemaView;
  Elem_COUNTRIES_INFOTo : TDBShemaView;
  Elem_LanguagesTO : TDBShemaView;
  Elem_TIME_ZONETo : TDBShemaView;
  Elem_FORM_GOVERNMENT :TDBShemaView;
  Elem_Currncy:TDBShemaView;

implementation
uses TourMbplIf;
{$R *.dfm}

{procedure CorrectCountry;
var CurrCountry:widestring;
begin
  Elem_Country.DB.First;
  while not Elem_Country.DB.EOF do
  begin
    CurrCountry := Elem_Country.DB.FieldByName('TITLE_UA').AsString;
    ReplaseOn(CurrCountry,'i','і');

    Elem_Country.DB.Edit;
    Elem_Country.DB.FieldByName('TITLE_UA').AsString :=UpFirstChar( CurrCountry );
    Elem_Country.DB.Post;
    Elem_Country.DB.Next;
  end;
end;  }

procedure CorrectRegions;
var CurrRegUA:widestring;
    CurrRegRU:widestring;
begin
  Elem_Region.DB.First;
  while not Elem_Region.DB.EOF do
  begin
    CurrRegUA := Elem_Region.DB.FieldByName('TITLE_UA').AsString;
    CurrRegRU := Elem_Region.DB.FieldByName('TITLE_RU').AsString;
    //ReplaseOn(CurrRegUA,'автономний округ','АО');
    //ReplaseOn(CurrRegRU,'автономный округ','АО');

    Elem_Region.DB.Edit;
    Elem_Region.DB.FieldByName('TITLE_UA').AsString :=CurrRegUA;// UpFirstChar( CurrRegUA );
    Elem_Region.DB.FieldByName('TITLE_RU').AsString :=CurrRegUA;//UpFirstChar( CurrRegRU );
    Elem_Region.DB.Post;
    Elem_Region.DB.Next;
  end;
end;

procedure ParepareClearValue(var aValue:widestring;SymblBegin,SymbEnd:wideString);
var WorkValue:Widestring;
    WorkValueNumber:Widestring;
    indStart:Integer;
begin
  WorkValue := aValue;
  if AnsiPos( SymblBegin, WorkValue )<>0 then
  begin
    indStart :=0;

    While AnsiPos( SymblBegin, Copy(WorkValue,indStart+1,Length(WorkValue)-indStart) )<>0 do
    begin

      WorkValueNumber := ParseTextInQuotes(WorkValue, indStart, SymblBegin[1], SymbEnd[1] );
      //ReplaseOn(WorkValueNumber,'/','');
      //if IsStrANumber(WorkValueNumber) then
      ReplaseOn(aValue,SymblBegin+WorkValueNumber+SymbEnd,'');

    end;
  end;
end;
//******************************************************************************

function PrepareText( aText:Widestring; Del, FromRepl, ToRepl:Widestring ):Widestring;
begin
  if Del <> '' then ReplaseON(aText,Del,'');
  if FromRepl<>'' then ReplaseON(aText, FromRepl,ToRepl);

  result := aText;
end;

Function CorrectStrArea( aValue:Widestring;FieldName:String ):Widestring;
begin
  replaseOn( aValue, ' Муніципалітет', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' муніципалітет' );

  replaseOn( aValue, 'Область', 'обл' );

  replaseOn( aValue, ' Перепису ', ' ' );
  replaseOn( aValue, ' Переписи ', ' ' );

  replaseOn( aValue, ' Місто', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' місто' );

  replaseOn( aValue, ' Город', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' город' );

  replaseOn( aValue, ' Район', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' район' );
  
  replaseOn( aValue, 'Район ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'район ' );

  replaseOn( aValue, ' Штат', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' штат' );

  replaseOn( aValue, ' Улус', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' улус' );

  replaseOn( aValue, ' Округу', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' округ' );

  replaseOn( aValue, ' Округа', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' округ' );

  replaseOn( aValue, ' Округ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' округ' );

  replaseOn( aValue, ' Графство', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' графство' );

  replaseOn( aValue, ' Повіт', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' повіт' );

  replaseOn( aValue, 'Острів ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'острів ' );

  replaseOn( aValue, 'Остров ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'остров ' );

  replaseOn( aValue, ' Уезд', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' Уезд' );

  replaseOn( aValue, ' District', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' district' );

  replaseOn( aValue, ' County', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' сounty' );

  replaseOn( aValue, ' City', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' city' );

  replaseOn( aValue, 'City ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'city ' );

  replaseOn( aValue, ' Region', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' region' );

  replaseOn( aValue, ' County', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' county' );

  replaseOn( aValue, 'County ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'county ' );

  replaseOn( aValue, 'Of', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@','of' );

  replaseOn( aValue, 'Municipality ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'municipality ' );

  replaseOn( aValue, ' Municipality', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' municipality' );

  replaseOn( aValue, ' Parish', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' parish' );

  replaseOn( aValue, 'Parish ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'parish ' );

  replaseOn( aValue, ' Волость', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' волость' );

  replaseOn( aValue, 'Волость ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'волость ' );

  replaseOn( aValue, 'Графство ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'графство ' );

  replaseOn( aValue, ' Графство', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' графство' );

  replaseOn( aValue, 'Province ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'province ' );

  replaseOn( aValue, ' Province', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' province' );

  replaseOn( aValue, ' Обл', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' обл' );

  replaseOn( aValue, 'Обл ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'обл ' );

  replaseOn( aValue, 'Край ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'край ' );

  replaseOn( aValue, ' Край', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', ' край' );

  replaseOn( aValue, 'Республіка', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'республіка' );

  replaseOn( aValue, 'Републіка', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'републіка' );

  replaseOn( aValue, 'Республика', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'республика' );


  replaseOn( aValue, 'Republic', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'republic' );

  replaseOn( aValue, 'State', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'state' );

  replaseOn( aValue, 'Prefegitura', 'Prefecture' );

  replaseOn( aValue, 'Префектура', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@', 'префектура' );
  replaseOn( aValue, 'Прэфэктурэ','префектура' );

  replaseOn( aValue, 'Номос', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@','номос' );

  replaseOn( aValue, 'Новадс ', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@','новадс ' );

  replaseOn( aValue, ' Новадс', '@REPLACE@' );
  replaseOn( aValue, '@REPLACE@',' новадс' );

  if AnsiPos('_UA', FieldName)<>0 then
  begin
    replaseOn( aValue, '-каунті', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' графство' );

    replaseOn( aValue, ' Каунті', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' графство' );

    replaseOn( aValue, ' Прихід', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' парафія' );

    replaseOn( aValue, 'Прихід ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'парафія ' );

    replaseOn( aValue, ' Приходу', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' парафія' );

    replaseOn( aValue, ' Приход', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' парафія' );

    replaseOn( aValue, 'Округ ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'округ ' );

    replaseOn( aValue, 'Місто ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'місто ' );

    replaseOn( aValue, 'Муніципалітет ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'муніципалітет ' );

    replaseOn( aValue, ' Муніципалітет', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' муніципалітет' );

    replaseOn( aValue, 'Муниципалітет', 'муніципалітет' );

    replaseOn( aValue, ' Селище', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' селище' );

    replaseOn( aValue, 'Селище ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'селище ' );

    replaseOn( aValue, 'Провінція ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'провінція ' );

    replaseOn( aValue, ' Провінція', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' провінція' );

    replaseOn( aValue, ' Провінке', '@REPLACE@' );  // Провінкія Де
    replaseOn( aValue, '@REPLACE@', ' провінція' );

    replaseOn( aValue, ' Провінкія', '@REPLACE@' );  // Провінкія Де
    replaseOn( aValue, '@REPLACE@', ' провінція' );

    replaseOn( aValue, 'Провінке ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'провінція ' );

    replaseOn( aValue, '(провінція)', 'провінція' );
    replaseOn( aValue, 'Дістрікт', 'район' );
    replaseOn( aValue, 'дістрікт', 'район' );

    replaseOn( aValue, 'Міський', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@','міський' );

    replaseOn( aValue, ' Де ', ' ' ); 

    replaseOn( aValue, 'Говернорате', 'муніципалітет' );
  end;

  if AnsiPos('_RU', FieldName)<>0 then
  begin
    replaseOn( aValue, '-каунти', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' округ' );

    replaseOn( aValue, ' Каунти', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' округ' );

    replaseOn( aValue, ' каунти', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' округ' );

    replaseOn( aValue, ' Прихода', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' приход' );

    replaseOn( aValue, ' Приход', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' приход' );

    replaseOn( aValue, 'Приход ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'приход ' );

    replaseOn( aValue, 'Округ ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'округ ' );

    replaseOn( aValue, 'Город ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'город ' );

    replaseOn( aValue, 'Муниципалитет ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'муниципалитет ' );

    replaseOn( aValue, 'Муницыпалитет', 'муниципалитет ' );

    replaseOn( aValue, ' Муниципалитет', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' муниципалитет' );

    replaseOn( aValue, ' Поселок', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' поселок' );

    replaseOn( aValue, 'Поселок ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'поселок ' );

    replaseOn( aValue, ' Провинция', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' провинция' );

    replaseOn( aValue, 'Провинция ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', 'провинция ' );

    replaseOn( aValue, ' Провинкэ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' провинция' );

    replaseOn( aValue, ' Провинкиа', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' провинция' );

    replaseOn( aValue, 'Провинкэ ', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@', ' провинция' );

    replaseOn( aValue, 'Городской', '@REPLACE@' );
    replaseOn( aValue, '@REPLACE@','городской' );

    replaseOn( aValue, '(провинция)', 'провинция' );

    replaseOn( aValue, ' Дэ ', ' ' );

    replaseOn( aValue, 'Дистрикт', 'район' );
    replaseOn( aValue, 'дистрикт', 'район' );
    replaseOn( aValue, 'Говэрноратэ', 'муниципалитет' );
  end;

  result :=aValue;
end;

procedure CorrectDatasetReplaseDel( DB:TDataset; Fields:array of String; Del, FromRepl, ToRepl:Widestring; CasePrepare:Boolean  );
var i:integer;
    CurrText:Widestring;
    Progres:TProgressFormProp;
begin
  TIBQuery(DB).FetchAll;
  try
  Progres := ShowProgress('Wait:' , DB.recordCount ); 
  DB.First;
  while not DB.Eof do
  begin
     Application.ProcessMessages;
     
     DB.Edit;
     for i:=0 to Length( Fields )-1 do
     begin
       CurrText := DB.FieldByName( Fields[i] ).AsString;
       //CurrText := PrepareText( CurrText, Del, FromRepl, '@REPLACE@' );
       //CurrText := PrepareText( CurrText, Del, '@REPLACE@', ToRepl );

       //if CasePrepare then CurrText := AllWordsInUpFirstChar( CurrText );

       CurrText := CorrectStrArea(CurrText,Fields[i] );
       DB.FieldByName( Fields[i] ).AsString := Trim( CurrText );
     end;
     DB.Post;
     
     DB.Next;
     Progres.ProgressBar.Position := Progres.ProgressBar.Position +1;
     Progres.ProgressCaption.Repaint;
  end;
  finally
   ClosedProgress;
  end;
end;

{function AddArea( CounrtyId, RegionId:Variant; AreaName:Widestring ):Integer;
begin
  if not Elem_Area.DB.Locate('COUNTRY_ID;REGION_ID;TITLE_ORIGINAL',VarArrayOf( [ RegionId, AreaName ] ),[] ) then
  begin
     Elem_Region.DB.Insert;
     Elem_Region.DB.FieldByName('COUNTRY_ID').AsInteger := CounrtyId ;
     Elem_Region.DB.FieldByName('REGION_ID').AsInteger := RegionId ;
     Elem_Region.DB.FieldByName('TITLE_ORIGINAL').asString := AreaName ;
     //Elem_Region.DB.FieldByName('PARENT').AsInteger := RegionId ;
     Elem_Region.DB.Post;
     
     Result := Elem_Region.GetValueId;
  end
   else Result := Elem_Region.GetValueId;

end; }


(*procedure PrepareArea;
var CounrtyId: Integer;
    RegionId : Integer;
    AreaName : Widestring;
    AreaId   : Integer;
    Progres:TProgressFormProp;
    //ListSQLUpdate:TStringList;
    FileName:String;
    F:TextFile;
begin
  FileName:= ExtractFilePath(Application.ExeName)+'UpdateCityAreaIdNew.Sql';
  AssignFile(F, FileName );
  //DeleteFile(FileName);
  //Rewrite(F);
  Rewrite(F);

  Elem_CityRegion.DBOpen;
  {Elem_CityRegion.DB.Locate('CITY_ID', 1109042,[]);
  Elem_CityRegion.DB.Next;}
  //TIBQuery(Elem_CityRegion.DB).FetchAll;
  //.DBOpen;

  try
    //ListSQLUpdate := TStringList.create;
    Progres := ShowProgress('Wait' , -1 ); //Elem_CityRegion.DBRecordCount

    Elem_CityRegion.DB.First;
    while not Elem_CityRegion.DB.Eof do
    begin

      CounrtyId:= Elem_CityRegion.DB.FieldByName('COUNTRY_ID').AsInteger;
      RegionId := Elem_CityRegion.DB.FieldByName('REGION_ID').AsInteger;
      AreaName := Elem_CityRegion.DB.FieldByName('AREA_RU').AsString;

      AreaId   := AddArea(CounrtyId, RegionId, AreaName );

      //ListSQLUpdate.Add('UPDATE CITY SET AREA_ID='+IntToStr(AreaId)+' WHERE CITY_ID='+Elem_CityRegion.GetValueIdStr+';' );

      writeLn(F, 'UPDATE CITY SET AREA_ID='+IntToStr(AreaId)+' WHERE CITY_ID='+Elem_CityRegion.GetValueIdStr+';' );
      Elem_CityRegion.DB.Next;

      Progres.ProgressBar.Position := Progres.ProgressBar.Position + 1;
    end;

    //ListSQLUpdate.SaveToFile( ExtractFilePath(Application.ExeName)+'UpdateCityAreaId.Sql' );
  finally

    // ListSQLUpdate.Free;
    CloseFile(F);
    ClosedProgress;
  end;
end;  *)

function FindSimilarCounrtyToID(CountryName:Widestring):Integer;
begin
  try
    result:=-1;
    Elem_CounrtyTO.DB.DisableControls;
    Elem_CounrtyTO.DB.First;
    Elem_CounrtyTO.View.BeginUpdate;
    While not Elem_CounrtyTO.DB.Eof do
    begin
      if StringIsLike( CountryName, Elem_CounrtyTO.DB.FieldByName('NAME').AsString ) then
      begin
        result := Elem_CounrtyTO.GetValueId;
        break;
      end;
      Elem_CounrtyTO.DB.Next;
    end;

  finally
    Elem_CounrtyTO.DB.EnableControls;
    Elem_CounrtyTO.View.EndUpdate;
  end;
end;

Procedure FindSimilarCountry;
var FindId:Integer;
    Progres:TProgressFormProp;
begin
 try
    Elem_Country.DB.DisableControls;
    Elem_Country.DB.First;
    Progres := ShowProgress('Wait' , Elem_Country.DBRecordCount );
    While not Elem_Country.DB.Eof do
    begin
      Application.ProcessMessages;

      FindId := FindSimilarCounrtyToID( Elem_Country.DB.FieldByName('TITLE_UA').AsString );
      if FindId <> -1 then
      begin
        Elem_Country.DB.Edit;
        Elem_Country.DB.FieldByName('COUNTRY_ID_TO').AsInteger := FindId ;
        Elem_Country.DB.Post;
      end;
      Progres.ProgressCaption.Repaint;
      Progres.ProgressBar.Position:= Progres.ProgressBar.Position +1;
      Elem_Country.DB.Next;
    end;
 finally
   Elem_Country.DB.EnableControls;
   ClosedProgress;
 end;
end;

function PrepareRegionName( RegionName:Widestring ):Widestring;
begin
  ReplaseOn(RegionName,'провінция','');
  ReplaseOn(RegionName,'Провінция','');
  ReplaseOn(RegionName,'Провінкія','');
  ReplaseOn(RegionName,'провінкія','');

  ReplaseOn(RegionName,'Республіка','');
  ReplaseOn(RegionName,'Республік','');
  ReplaseOn(RegionName,'АО','');
  ReplaseOn(RegionName,'ао','');

  ReplaseOn(RegionName,'республыка','');
  ReplaseOn(RegionName,'Республыка','');

  ReplaseOn(RegionName,'департаменто','');
  ReplaseOn(RegionName,'Департаменто','');


  ReplaseOn(RegionName,'републіка','');
  ReplaseOn(RegionName,'републік','');

  ReplaseOn(RegionName,'регіон','');
  ReplaseOn(RegionName,'Регіон','');

  ReplaseOn(RegionName,'районі','');
  ReplaseOn(RegionName,'Районі','');

  ReplaseOn(RegionName,'район','');
  ReplaseOn(RegionName,'Район','');
  ReplaseOn(RegionName,'девелопмент','');
  ReplaseOn(RegionName,'Девелопмент','');
  
  ReplaseOn(RegionName,'баладіях','');
  ReplaseOn(RegionName,'Баладіях','');
  ReplaseOn(RegionName,'муніципалітет','');
  ReplaseOn(RegionName,'Муніципалітет','');

  ReplaseON(RegionName, 'Обл.', '');
  ReplaseON(RegionName, 'обл.', '');

  ReplaseON(RegionName, 'префектура', '');
  ReplaseON(RegionName, 'Префектура', '');

  ReplaseON(RegionName, 'округ', '');
  ReplaseON(RegionName, 'Округ', '');

  ReplaseON(RegionName, 'повіт', '');
  ReplaseON(RegionName, 'Повіт', '');
  
  ReplaseON(RegionName, 'штат', '');
  ReplaseON(RegionName, 'Штат', '');
  ReplaseON(RegionName, 'графство', '');
  ReplaseON(RegionName, 'Графство', '');
  result := Trim(RegionName);
end;

function FindSimilarRegionToID( CountryId:Variant; RegionName:Widestring; Similar:Boolean =True):Integer;
var CurrNameRegion:widestring;
begin
  RegionName := CorrectStrArea( RegionName, '' );
  RegionName := PrepareRegionName( RegionName );
  try
    result:=-1;
    Elem_RegionTO.DB.DisableControls;
    Elem_RegionTO.DB.First;
    Elem_RegionTO.View.BeginUpdate;

    While not Elem_RegionTO.DB.Eof do
    begin
      CurrNameRegion:= Elem_RegionTO.DB.FieldByName('NAME').AsString;
      CurrNameRegion := CorrectStrArea(CurrNameRegion,''); // PrepareRegionName( CurrNameRegion );
      CurrNameRegion := PrepareRegionName( CurrNameRegion );

     if Similar then
      begin
        if (Elem_RegionTO.DB.FieldByName('COUNTRYID').Value = CountryId ) and
           (StringIsLike( RegionName, CurrNameRegion , 0.9 ) ) then
        begin
          result := Elem_RegionTO.GetValueId;
          break;
        end;
      end
       else
       begin
         if (Elem_RegionTO.DB.FieldByName('COUNTRYID').Value = CountryId ) and
            ( (ansiPos(RegionName,CurrNameRegion)<>0) or (ansiPos( CurrNameRegion, RegionName )<>0)) then
          begin
            result := Elem_RegionTO.GetValueId;
            break;
          end;
       end;


      Elem_RegionTO.DB.Next;
    end;

  finally
    Elem_RegionTO.DB.EnableControls;
    Elem_RegionTO.View.EndUpdate;
  end;

end;

Procedure FindSimilarRegion;
var FindId:Integer;
    Progres:TProgressFormProp;
begin
 try
    Elem_Region.DB.DisableControls;
    Elem_Region.DB.First;
    Progres := ShowProgress('Wait' , Elem_Region.DBRecordCount );
    While not Elem_Region.DB.Eof do
    begin
      Application.ProcessMessages;

      //if Elem_Region.DB.FieldByName('REGION_ID_TO').Value = null then
      begin
        {if Elem_RegionTO.DB.Locate('NAME',Elem_Region.DB.FieldByName('TITLE_UA').AsString,[]) then
          FindId := Elem_RegionTO.GetValueId
        else FindId :=-1;}

        FindId := FindSimilarRegionToID( Elem_Region.DB.FieldByName('COUNTRY_ID_TO').Value, Elem_Region.DB.FieldByName('TITLE_UA').AsString );
        if FindId <> -1 then
        begin
          Elem_Region.DB.Edit;
          Elem_Region.DB.FieldByName('REGION_ID_TO').AsInteger := FindId ;
          Elem_Region.DB.Post;
        end
         else
         begin
           Elem_Region.DB.Edit;
           Elem_Region.DB.FieldByName('REGION_ID_TO').value := Null ;
           Elem_Region.DB.Post;
         end;
      end;

      Progres.ProgressCaption.Repaint;
      Progres.ProgressBar.Position:= Progres.ProgressBar.Position +1;
      Elem_Region.DB.Next;
    end;
 finally
   Elem_Region.DB.EnableControls;
   ClosedProgress;
 end;
end;


function FindSimilarAreaToID( CountryId,RegionId:Variant; AreaName:Widestring ):Integer;
var CurrNameArea:widestring;
begin
  AreaName := PrepareRegionName( AreaName );
  try
    result:=-1;
    Elem_AreaTO.DB.DisableControls;
    Elem_AreaTO.DB.First;
    Elem_AreaTO.View.BeginUpdate;

    While not Elem_AreaTO.DB.Eof do
    begin
      CurrNameArea:= Elem_AreaTO.DB.FieldByName('NAME').AsString;
      CurrNameArea :=PrepareRegionName (CurrNameArea);
      if ( Elem_AreaTO.DB.FieldByName('COUNTRYID').Value = CountryId ) and
         ( (RegionId<>null)and( Elem_AreaTO.DB.FieldByName('PROVINCEID').Value = RegionId )OR(RegionId=NULL))  and
         ( StringIsLike( AreaName, CurrNameArea, 0.6 ) ) then
      begin
        result := Elem_AreaTO.GetValueId;
        break;
      end;
      Elem_AreaTO.DB.Next;
    end;

  finally
    Elem_AreaTO.DB.EnableControls;
    Elem_AreaTO.View.EndUpdate;
  end;

end;

Procedure FindSimilarArea;
var FindId:Integer;
    Progres:TProgressFormProp;
begin
  try
    Elem_Area.DB.DisableControls;
    Elem_Area.DB.First;
    Progres := ShowProgress( 'Wait' , Elem_Area.DBRecordCount );

    While not Elem_Area.DB.Eof do
    begin
      Application.ProcessMessages;

      if Elem_Area.DB.FieldByName('AREA_ID_TO').Value = null then
      begin
        FindId := FindSimilarAreaToID( Elem_Area.DB.FieldByName('COUNTRY_ID_TO').Value, Elem_Area.DB.FieldByName('REGION_ID_TO').Value, Elem_Area.DB.FieldByName('TITLE_UA').AsString );
        if FindId <> -1 then
        begin
          Elem_Area.DB.Edit;
          Elem_Area.DB.FieldByName('AREA_ID_TO').AsInteger := FindId ;
          Elem_Area.DB.Post;
        end;
      end;

      Progres.ProgressCaption.Repaint;
      Progres.ProgressBar.Position:= Progres.ProgressBar.Position +1;
      Elem_Area.DB.Next;
    end;

  finally
   Elem_Area.DB.EnableControls;
   ClosedProgress;
  end;
end;

function FindSimilarCityToID(Country,RegionId,AreaId:Variant; CityName:Widestring ):Integer;
var CurrCityName:widestring;
begin
  result:=-1;
  if Trim( CityName )='' then exit;

  try
    Elem_CityTO.DB.DisableControls;
    Elem_CityTO.DB.First;
    Elem_CityTO.View.BeginUpdate;

    While not Elem_CityTO.DB.Eof do
    begin
      CurrCityName:= Elem_CityTO.DB.FieldByName('NAME').AsString;
      //CurrNameArea :=PrepareRegionName (CurrNameArea);

      if ( Elem_CityTO.DB.FieldByName('COUNTRYID').Value = Country ) and
         ( (RegionId<>null)and( Elem_CityTO.DB.FieldByName('PROVINCEID').Value = RegionId )OR(RegionId=NULL)OR(Elem_CityTO.DB.FieldByName('PROVINCEID').Value=null) )  and
         ( (AreaId<>null)and( Elem_CityTO.DB.FieldByName('TOWNSHIPID').Value = AreaId )OR(AreaId=NULL)or(Elem_CityTO.DB.FieldByName('TOWNSHIPID').Value=null)  )  and
         ( StringIsLike( CityName, CurrCityName, 0.80 ) ) then
      begin
        result := Elem_CityTO.GetValueId;
        break;
      end;
      Elem_CityTO.DB.Next;
    end;

  finally
    Elem_CityTO.DB.EnableControls;
    Elem_CityTO.View.EndUpdate;
  end;
end;


Procedure FindSimilarCity;
var FindId:Integer;
    Progres:TProgressFormProp;
    //aList:TStringList;
    F:TextFile;
    FileName:string;
begin
  try
    //aList:=TStringList.Create;
    FileName:= ExtractFilePath(Application.ExeName)+'UpdateCimilarCity.Sql';
    AssignFile(F, FileName );
    Rewrite(F);

    Elem_City.DB.DisableControls;
    Elem_City.DB.First;
    Elem_City.View.DataController.DataSource := nil;
    Elem_CityTO.View.DataController.DataSource := nil;
    //if Elem_City.DB.Locate('CITY_ID',CITIES.DBRecordCount,[]) then
      Progres := ShowProgress( 'Wait' , Elem_City.DBRecordCount );

    While not Elem_City.DB.Eof do
    begin
      Application.ProcessMessages;

      //if Elem_City.DB.FieldByName('CITY_ID_TO').Value = null then
      begin
        FindId := FindSimilarCityToID( Elem_City.DB.FieldByName('COUNTRY_ID_TO').Value,
                                       Elem_City.DB.FieldByName('REGION_ID_TO').Value,
                                       Elem_City.DB.FieldByName('AREA_ID_TO').Value, Elem_City.DB.FieldByName('TITLE_UA').AsString );
        if FindId <> - 1 then
        begin
          //aList.Add('UPDATE CITIES SET CITY_ID_TO='+IntToStr(FindId)+' WHERE CITY_ID='+Elem_City.GetValueIdStr+';' );
          writeLn(F, 'UPDATE CITIES SET CITY_ID_TO='+IntToStr(FindId)+' WHERE CITY_ID='+Elem_City.GetValueIdStr+';' );
          {Elem_City.DB.Edit;
          Elem_City.DB.FieldByName('CITY_ID_TO').AsInteger := FindId ;
          Elem_City.DB.Post;}
        end
         else
           begin
               writeLn(F, 'UPDATE CITIES SET CITY_ID_TO = null WHERE CITY_ID='+Elem_City.GetValueIdStr+';' );
            { Elem_City.DB.Edit;
             Elem_City.DB.FieldByName('CITY_ID_TO').asVariant := null ;
             Elem_City.DB.Post;  }
           end
      end;

      Progres.ProgressCaption.Repaint;
      Progres.ProgressBar.Position:= Progres.ProgressBar.Position +1;
      Elem_City.DB.Next;
    end;
    //aList.SaveToFile( ExtractFilePath(Application.ExeName)+'UpdateCimilarCity.Sql' );
  finally
    CloseFile(F);
    Elem_City.View.DataController.DataSource := Elem_City.DS;
    Elem_CityTO.View.DataController.DataSource := Elem_CityTO.DS;
    Elem_City.DB.EnableControls;
    ClosedProgress;
   //aList.Free;
  end;
end;

procedure TDM.GenTranslateSQL(CaptionProgres,FiledCaption:Widestring; Elem, ElemTo:TDBShemaView; IdFieldTo,idParentTable, TableTranslate:Widestring );
var UA,RU,EN:Widestring;
    SQL:Widestring;
    //ListSQL:TStringList;
    Progres:TProgressFormProp;
    WasUpdate:Boolean;
    FileName1:Widestring;
    FileErrorLog:Widestring;
    F,FLog:TextFile;
function GetCurrCaption:WideString;
begin
  if FiledCaption<>'' then
  Result := CaptionProgres+' '+ElemTo.DB.fieldByName(FiledCaption).AsString;
end;
//*****************************************
begin
  try
    //ListSQL:=TStringList.Create;
    Elem.DB.First;

    Progres := ShowProgress( 'Wait :'+GetCurrCaption , Elem.DBRecordCount );

    FileName1 := ExtractFilePath(Application.ExeName)+'Translate_'+TableTranslate+'.Sql';
    FileErrorLog := ExtractFilePath(Application.ExeName)+'Error_'+TableTranslate+'.Sql';
    AssignFile( F, FileName1);
    Rewrite(F);

    AssignFile( FLog, FileErrorLog);
    Rewrite( FLog );

    while not Elem.DB.Eof do
    begin
   //   if Elem.GetValueId = 3090707 then
    //   ShowMessage('Stop');

      UA := Elem.DB.FieldByName('TITLE_UA').asString;
      RU := Elem.DB.FieldByName('TITLE_RU').asString;
      EN := Elem.DB.FieldByName('TITLE_EN').asString;


      try
        WasUpdate := False;
        if not Elem.DB.FieldByName(IdFieldTo).IsNull then
        begin
          //SQL :='UPDATE '+ Elem.TableName + ' SET NAME = '+#39+UA+#39+' where ' + Elem.FIeldKod+ ' = ' + Elem.GetValueIdStr+';'
          if ElemTo.DB.Locate(ElemTo.FieldKod, Elem.DB.FieldByName(IdFieldTo).Value,[]) then
          begin
            ElemTo.DB.Edit;
            ElemTo.DB.FieldByName('NAME').AsString := UA;
            ElemTo.DB.Post;
            WasUpdate:=True;
          end;
        end;

        if not WasUpdate then
        begin
          //if ElemTo.GetValueId = 4722524 then
          // ShowMessage('dddd');

          //if not ElemTo.DB.Locate( 'COUNTRYID;PROVINCEID;NAME', VarArrayOf( [ ElemTo.DB.FieldByName('COUNTRYID').Value,UA]) ,[]) then
          ElemTo.DB.Insert;
          //else ElemTo.DB.Edit;

          if (ElemTo.DB.FindField('COUNTRYID')<>nil)and( ElemTo.FieldKod<>'COUNTRYID' ) then
            ElemTo.DB.FieldByName('COUNTRYID').Value := Elem.DB.FieldByName('COUNTRY_ID_TO').Value;

          if (ElemTo.DB.FindField('PROVINCEID')<>nil)and( ElemTo.FieldKod<>'PROVINCEID' ) then
            ElemTo.DB.FieldByName('PROVINCEID').Value := Elem.DB.FieldByName('REGION_ID_TO').Value;

          if (ElemTo.DB.FindField('TOWNSHIPID')<>nil)and( ElemTo.FieldKod<>'TOWNSHIPID' ) then
            ElemTo.DB.FieldByName('TOWNSHIPID').Value := Elem.DB.FieldByName('AREA_ID_TO').Value;

          if (ElemTo.DB.FindField('NAME_ORIGINAL')<>nil) then
            ElemTo.DB.FieldByName('NAME_ORIGINAL').Value := Elem.DB.FieldByName('TITLE_ORIGINAL').Value;

          ElemTo.DB.FieldByName('NAME').AsString := UA;
          ElemTo.DB.Post;

          //if Elem.DB.FieldByName(IdFieldTo).Value = null then
          begin
            Elem.DB.Edit;
            Elem.DB.FieldByName(IdFieldTo).Value := ElemTo.GetValueId;
            Elem.DB.Post;
          end;
        end;
      except
        //Clipboard.AsText:= Elem.GetValueIdStr;//TIBUpdateSQL( TIBQuery(ElemTo.DB).UpdateObject ).ModifySQL.Text;
        //ShowMessage(Elem.GetValueIdStr);
         Writeln(FLog, ElemTo.GetValueIdStr );
      end;

      SQL :='INSERT INTO '+TableTranslate+' ( '+idParentTable+', ID_LNG, TRANSLATE ) VALUES ('+ElemTo.GetValueIdStr+',448,'+SetNormalValueForSql(UA)+ ');';
      Writeln(F,SQL);
      //ListSQL.add(SQL);
      SQL :='INSERT INTO '+TableTranslate+' ( '+idParentTable+', ID_LNG, TRANSLATE ) VALUES ('+ElemTo.GetValueIdStr+',423,'+SetNormalValueForSql(RU)+ ');';
      Writeln(F,SQL);
      //ListSQL.add(SQL);
      SQL :='INSERT INTO '+TableTranslate+' ( '+idParentTable+', ID_LNG, TRANSLATE ) VALUES ('+ElemTo.GetValueIdStr+',350,'+SetNormalValueForSql(EN)+ ');';
      Writeln(F,SQL);
      //ListSQL.add(SQL);
      
      Application.ProcessMessages;
      Progres.ProgressCaption.Caption := GetCurrCaption;
      Progres.ProgressCaption.Repaint;
      Progres.ProgressBar.Position:= Progres.ProgressBar.Position +1;

      Elem.DB.Next;
    end;
   {if (TIBQuery(ElemTo.DB).CachedUpdates) then
   begin
     TIBQuery(ElemTo.DB).ApplyUpdates;
     TIBQuery(ElemTo.DB).Transaction.CommitRetaining;
   end; }

   //ElemTo.DBOpen;

   //ListSQL.SaveToFile( ExtractFilePath(Application.ExeName)+'Translate_'+TableTranslate+'.Sql' );
  finally
    //ListSQL.free;
    CloseFile(F);
    CloseFile(FLog);
    ClosedProgress;
  end;
end;

//\<.[^\[\]\(\)\<\>]+\>|\[.[^\[\]\(\)\<\>]+\]|\(.[^\[\]\(\)\<\>]+\)

procedure TDM.PrepareTestSQL;
var ListSQL:TStringList;
    index:Integer;
    Value:WideString;
    F:TextFile;
    FileName1:WideString;
     var PathDB, UID, Password:String ;
    SQL:WideString;
    SQLCheckSity:WideString;
    CurrDB:TIBQuery;
    CurrDBCity:TIBQuery;

function CheckAREOnCity(Areaid:String):Boolean;
begin
try
   SQLCheckSity := 'SELECT * from CITIES WHERE AREA_ID ='+Areaid;
   CurrDBCity := CreateDataSet(  PathDB, UID, Password, SQLCheckSity );
   if CurrDBCity.IsEmpty then writeLn(F, 'DELETE FROM AREA WHERE AREA_ID ='+Areaid+';' );
 finally
    DestroyDS(CurrDBCity );
 end;
end;

begin
  TestQuery.Open;
 try
    // ListSQL:=TStringList.Create;
   GetParamDatabaseIB( IBDatabase,  PathDB, UID, Password );

   TestQuery.Last;
   //IBTableTest.First;
   index:=1;
   FileName1 := ExtractFilePath( Application.ExeName )+'DELETE_SIMILARAREA.SQL';
   AssignFile( F, FileName1);
   Rewrite(F);

   while not TestQuery.bof do
   begin
     SQL :='select * from AREA where TITLE_ORIGINAL ='+SetNormalValueForSql( TestQuery.FieldByName('TITLE_ORIGINAL').AsString );

     try
       CurrDB := CreateDataSet( PathDB, UID, Password, SQL );
       while not CurrDB.eof do
       begin
         try
           SQLCheckSity := 'SELECT Count(*) from CITIES WHERE AREA_ID ='+CurrDB.fieldByName('AREA_ID').AsString;
           CurrDBCity := CreateDataSet(  PathDB, UID, Password, SQLCheckSity );
           if CurrDBCity.RecordCount=0 then
             writeLn(F, 'DELETE FROM AREA WHERE AREA_ID ='+CurrDB.fieldByName('AREA_ID').AsString+';' );
         finally
            DestroyDS(CurrDBCity );
         end;
         CurrDB.Next;
       end;

     finally
       DestroyDS( CurrDB) ;
     end;
     //writeLn(F, 'UPDATE CITIES SET TITLE_ORIGINAL = '+SetNormalValueForSql( TestQuery.FieldByName('TITLE_EN').AsString)+' WHERE CITY_ID='+ TestQuery.FieldByName('CITY_ID').asString+';');

     TestQuery.Prior;
   end;
    //ListSQL.SaveToFile( ExtractFilePath(Application.ExeName)+'GOVERNMENTS_.Sql' );
 finally

   CloseFile(F);
 end;

 //IBTableTest.Transaction.Commit;
end;

procedure UpdateCountryInfo(CountryId,TypeId,IdValue,Value,IdUnitMeasur:Variant);
begin
   if not Elem_COUNTRIES_INFOTo.DB.Locate('ID_COUNTRIES;ID_COUNTRIES_TYPE_INFO;ID_VALUE;AVALUE',VarArrayOf( [ CountryId, TypeId,IdValue,Value ] ),[] )  then
     Elem_COUNTRIES_INFOTo.DB.Insert
   else Elem_COUNTRIES_INFOTo.DB.Edit;

   Elem_COUNTRIES_INFOTo.DB.FieldByName('ID_COUNTRIES').Value := CountryId;
   Elem_COUNTRIES_INFOTo.DB.FieldByName('ID_COUNTRIES_TYPE_INFO').Value := TypeId;
   Elem_COUNTRIES_INFOTo.DB.FieldByName('ID_VALUE').Value := IdValue;
   Elem_COUNTRIES_INFOTo.DB.FieldByName('AVALUE').Value := Value;
   Elem_COUNTRIES_INFOTo.DB.FieldByName('ID_UNIT_MEASUR').Value := IdUnitMeasur;
   Elem_COUNTRIES_INFOTo.DB.Post; 
end;

function GetMeasurId(TypeId:Integer;CurrValueValue:Widestring):Variant;
begin
  Result := null;
  if TypeId = 7 then result  :=8;
  if (TypeId = 7)and(AnsiPos('млн',CurrValueValue)=0 ) then result  :=10;
  if (TypeId = 9)  then result  :=12;
  if (TypeId = 9)and(AnsiPos('км',CurrValueValue)=0 ) then result  :=1;

  if (TypeId = 8)and(AnsiPos('тис',CurrValueValue)=0 ) then result  :=8;
  if (TypeId = 8)and(AnsiPos('тис',CurrValueValue)<>0 ) then result :=9;
  if TypeId = 16 then result :=4;
  if TypeId = 17 then result :=5;
  if TypeId = 18 then result :=6;
end;

function GetCurrFileNameForSaveImage(StartPath:WideString;CountryId:Integer;TypeId:Integer):WideString;
var SubPath:WideString;
    MarkFile:WideString;
begin
   Result := '';
   if TypeId = 1 then begin SubPath :='GERB';MarkFile:='G';end;
   if TypeId = 2 then begin SubPath :='FLAG';MarkFile:='F';end;

   if SubPath <>'' then
     Result := CheckLastSleshOnPath(StartPath,True)+SubPath+'\'+MarkFile+AddNolForLengthNumber( IntToStr(CountryId), 4 );

   ExistsDir(Result);
end;

function PrepareLanguage(aValue:Widestring):widestring;
begin

  ReplaseOn(aValue,'нідерландська','голландська');
  result := Trim( AnsiLowerCase(  aValue ) );
end;

function GetLanguages( Value:Widestring ):TStringList;
var i:Integer;
    aList:TStringList;
    CurrLng:Widestring;
begin
  result := TStringList.Create;
  aList := SplitToWords(Value);
  try
    for i:=0 to aList.Count-1 do
    begin
       CurrLng := PrepareLanguage(  aList.Strings[i] );

       if Elem_LanguagesTO.DB.Locate( 'NAME', CurrLng ,[] )  then
         result.Add( Elem_LanguagesTO.GetValueIdStr );
    end;
  finally
    aList.Free;
  end;
end;

procedure AddLanguages(CountryId,CurrIdType:Integer; Value:Widestring);
var i:Integer;
    aList:TStringList;
begin
 try
   aList := GetLanguages( Value );
   for i:=0 to aList.Count-1 do
     UpdateCountryInfo(CountryId,CurrIdType,aList.Strings[i],null,null);

 finally
   aList.Free;
 end;
end;

function PrepareValueToTimeZone(aValue:Real):WideString;
var StrInt:Widestring;
    StrScale:Widestring;
    Minus:Widestring;
begin
  StrInt := IntToStr( Trunc( aValue ) );
  StrScale := FloatToStr( Frac(aValue) );
  ReplaseON(StrScale, '0,', '' );

  if AnsiPos('-',StrInt)<>0 then Minus:='-'
  else Minus :='';
  ReplaseOn(StrInt,'-','');
  
  StrInt := AddNolForLengthNumber(StrInt,2);
  StrScale := AddNolForLengthNumber(StrScale,2);
  if Minus<>'-' then StrInt:='+'+StrInt
  else StrInt:='-'+StrInt;

  result := 'UTC'+StrInt+':'+StrScale;
end;


procedure AddTimeZoneToList( aValue:Widestring; aList:TStringList);
var i,aTo:real;
    a:real;
    FromValue:Widestring;
    ToValue:Widestring;
    PosSplit:Integer;
    CurrTimeZone:Widestring;
    SplitStr:WideString;
begin
   PosSplit:= AnsiPos('—',aValue);
   if PosSplit = 0 then
   begin
     PosSplit :=AnsiPos('…',aValue);
     SplitStr:= '…';
   end
    else SplitStr := '—';

   ReplaseOn(aValue,'UTC','');
   ReplaseOn(aValue,':',',');
   ReplaseOn(aValue,'[','');

   if PosSplit<>0 then
   begin

      PosSplit:= AnsiPos(SplitStr , aValue);

      FromValue := Copy(aValue,1,PosSplit-1);
      ToValue   := Copy(aValue, PosSplit+1, Length(aValue)-PosSplit+1 );
      i := StrToFloat(FromValue);
      aTo := StrToFloat( ToValue );
      if i>aTo then
      begin
        a:=i;
        i:=aTo;
        aTo:=a;
      end;

      While i<=aTo do
      begin
        CurrTimeZone := PrepareValueToTimeZone(i);
        aList.add(CurrTimeZone);    // UTC+3:30

        i:=i+1;
      end;
   end
    else
    begin
      if aValue<>'' then
      begin
        CurrTimeZone := PrepareValueToTimeZone( StrToFloat( aValue) );
        aList.add(CurrTimeZone);
      end;
    end;
end;

function GetTimeZone( Value:Widestring ):TStringList;
var i:Integer;
    aList:TStringList;
    aListNew:TStringList;
    CurrTimeZone:WideString;
    CurrValue:WideString;
begin
  result := TStringList.Create;
  ReplaseON( Value,'-','~');
  ReplaseON( Value,' від ','');
  ReplaseON( Value,'від ','');

  ReplaseON( Value,' до ','—');

  aList := SplitToWords(Value);
  aListNew :=TStringList.Create;

  for i:=0 to aList.count-1 do
  begin
    CurrValue :=aList.strings[i];
    ReplaseON( CurrValue,'~','-' );

    if AnsiPos('UTC', CurrValue )<>0 then
      AddTimeZoneToList( CurrValue, aListNew );
  end;

  try

    for i:=0 to aListNew.Count-1 do
    begin
      if Elem_TIME_ZONETo.DB.Locate('NAME',aListNew.Strings[i],[] )  then
        result.Add( Elem_TIME_ZONETo.GetValueIdStr );
    end;

  finally
    aListNew.Free;
    aList.Free;
  end;
end;

procedure AddtTimeZone( CountryId,CurrIdType:Integer; Value:Widestring );
var i:Integer;
    aList:TStringList;
begin
  try
    aList := GetTimeZone( Value );
    for i:=0 to aList.Count-1 do
       UpdateCountryInfo(CountryId,CurrIdType,aList.Strings[i],null,null);
  finally
   aList.Free;
  end;
end;

procedure AddFormGOVERNMENT( CountryId, CurrIdType:Integer; Value:Widestring );
begin
  ReplaseOn(Value,#13#10,' ');
  if Elem_FORM_GOVERNMENT.DB.Locate('NAME',Value,[]) then
    UpdateCountryInfo(CountryId,CurrIdType,Elem_FORM_GOVERNMENT.GetValueId, null,null );
end;

function GetCurrency(Value:Widestring):TStringList;
var i:Integer;
    aList:TStringList;
    aListNew:TStringList;
    CurrTimeZone:WideString;
    CurrValue:WideString;
begin
  result := TStringList.Create;
  aList := SplitToWords(Value);

  try
    for i:=0 to aList.Count-1 do
    begin
      if Elem_Currncy.DB.Locate('CURRENCYSHORT',aList.Strings[i],[] )  then
        result.Add( Elem_Currncy.GetValueIdStr );
    end;

  finally
    aList.Free;
  end;
end;


procedure AddCurrency( CountryId, CurrIdType:Integer; Value:Widestring );
var i:Integer;
    aList:TStringList;
begin
  try
    aList := GetCurrency( Value );
    for i:=0 to aList.Count-1 do
       UpdateCountryInfo(CountryId,CurrIdType,aList.Strings[i],null,null);
  finally
   aList.Free;
  end;
end;

procedure AddCapitalCity( CountryId, CurrIdType:Integer; Value:Widestring );
begin
  if not Elem_CityTO.DB.Active then Exit;
  
  if Elem_CityTO.DB.Locate('COUNTRYID;NAME',VarArrayOf([CountryId, Value]),[]) then
    UpdateCountryInfo(CountryId,CurrIdType, Elem_CityTO.GetValueIdStr, null, null);
end;

function PrepareValue(aValue:Widestring;TypeId:Integer):Widestring;
begin
  ParepareClearValue(aValue,'(',')');
  ParepareClearValue(aValue,'[',']');
  ParepareClearValue(aValue,'{','}');
  ReplaseON(aValue,'км.','');
  ReplaseON(aValue,'км','');
  ReplaseON(aValue,'тис.','');
  ReplaseON(aValue,'тис','');
  ReplaseON(aValue,'осіб','');
  ReplaseON(aValue,'чол.','');
  ReplaseON(aValue,'чол','');
  ReplaseON(aValue,';','');
  ReplaseON(aValue,'млн.','');
  ReplaseON(aValue,'млн','');

  ReplaseON(aValue,#13#10,'');
  if TypeId in [7,8] then
  begin
    ReplaseOn(aValue,', ',',');
    ReplaseOn(aValue,',',' ');
    ReplaseOn(aValue,'.',' ');
  end;
  if AnsiPos('Помилка виразу',aValue)<>0 then aValue:='';


  Result := Trim( LowerCase(aValue ));
end;

procedure MergeCountryInfoForCurrCountry( CountryId:Integer; StartPath:String);
var CurrValue:WideString;
    CurrIdType:Integer;
    CurrMeasurId :Variant;
    FileToSave:WideString;
    StreamFile:TMemoryStream;
begin
  //if CountryId =43 then ShowMessage('STOP');
  Elem_CountryDetail.DB.First;
  while not Elem_CountryDetail.DB.Eof do
  begin
     if Elem_CountryDetail.DB.FieldByName('USE_ID_TO').Value <> null then
     begin
       CurrIdType    := Elem_CountryDetail.DB.FieldByName('USE_ID_TO').AsInteger;
       CurrValue     := Elem_CountryDetail.DB.FieldByName('AVALUE').AsString;
       FileToSave    := GetCurrFileNameForSaveImage(StartPath, CountryId,CurrIdType);
       CurrMeasurId  := GetMeasurId( CurrIdType, CurrValue );

       if ( (CurrIdType = 1)or(CurrIdType = 2) ) and( not Elem_CountryDetail.Db.FieldByName('AFILE').IsNull) then
       begin

          StreamFile:=  Elem_CountryDetail.DBGetBlobData('AFILE');
          try
            if not Elem_CountryDetail.Db.FieldByName('AFILE').IsNull then
            begin
              try
                FileToSave:=FileToSave+'.png';
                StreamFile.SaveToFile( FileToSave );
                CurrValue := ExtractFileName( FileToSave );
              except
              end;
            end;

          finally
            StreamFile.Free;
          end;
       end;
        if CurrIdType in [4,7,8,9,11] then CurrValue := PrepareValue(CurrValue,CurrIdType );

        try
         if CurrIdType = 20 then AddLanguages(CountryId, CurrIdType, CurrValue )
         else
          if CurrIdType = 12 then AddtTimeZone( CountryId,CurrIdType, CurrValue )
         else
          if CurrIdType = 5 then AddFormGOVERNMENT( CountryId,CurrIdType, CurrValue )
          else
          if CurrIdType = 6 then AddCurrency( CountryId,CurrIdType, CurrValue )
          else
           if CurrIdType = 4 then AddCapitalCity(CountryId, CurrIdType, CurrValue )
          else
          UpdateCountryInfo(CountryId,CurrIdType,null,CurrValue, CurrMeasurId );
        except
          ShowMessage( IntToStr(CountryId) );
        end;

     end;

     Elem_CountryDetail.DB.Next;
  end;
end;

procedure MergeCountry( StartPath:String );
begin
  Elem_Country.DB.First;
  while not Elem_Country.DB.Eof do
  begin
     MergeCountryInfoForCurrCountry( Elem_Country.DB.FieldByName('COUNTRY_ID_TO').Value, StartPath );
     Elem_Country.DB.Next;
  end;
end;




//аутономоус
function GenIdRegion:Variant;
var PathDB, UID, Password:String;
begin
   GetParamDatabaseIB( DM.IBDatabaseTO, PathDB, UID, Password );
   result := IDGenId( Elem_RegionTO.GeneratorIdName, PathDB, UID, Password );
end;

function GenIdCityTo:Variant;
var PathDB, UID, Password:String;
begin
   GetParamDatabaseIB( DM.IBDatabaseTO, PathDB, UID, Password );
   result := IDGenId( Elem_CityTO.GeneratorIdName, PathDB, UID, Password );

end;

procedure TDM.InitElements;
begin
   //PrepareTestSQL;
   // GetTimeZone('(UTC-5 до -10)');
   //AddTimeZoneToList('UTC+3;UTC+10', aList);
   //AddTimeZoneToList('UTC+2…UTC+12', aList);
   //GetTimeZone( '([[UTCUTC+5, UTC+6, без літнього часу]])' );
   //AddTimeZoneToList('UTCUTC+5, UTC+6, без літнього часу', aList);//([[UTCUTC+5, UTC+6, без літнього часу]])
   //ShowMessage(  PrepareValue('17 098 246  (1-а)') );

   Elem_Country := TDBShemaView.Create( Country, ViewCountry, 'COUNTRIES', 'COUNTRY_ID', 'gen_countries_id' );
   Elem_Country.ViewList := ViewCountryList;
   Elem_CountryDetail := TDBShemaView.Create( CountryDetail,ViewDetail, 'COUNTRIES_DETAIL', 'ID', 'gen_countries_detail_id' );
   Elem_CountryDetailTypes := TDBShema.Create( CountryDetailTypes, 'COUNTRIES_DET_TYPES', 'ID', 'gen_countries_det_types_id' );

   //Elem_Region := TDBShemaView.Create( Region, ViewRegion, 'REGIONS', 'REGION_ID', 'gen_regions_id' );
   Elem_Region := TDBShemaView.Create( RegionAll, ViewRegionFrom, 'REGIONS', 'REGION_ID', 'gen_regions_id' );
   Elem_Area := TDBShemaView.Create( Area, nil, 'AREA', 'AREA_ID', 'gen_area_id' );
   Elem_City := TDBShemaView.Create( AdoCity, ViewCity, 'CITIES', 'CITY_ID', 'gen_cities_id' );
   //Elem_City.CreateIBDynamicCloneDataset( City );
   //CitySrc.DataSet :=Elem_City.DB;

   Elem_CounrtyTO := TDBShemaView.Create( CounrtyTO, ViewCountryTO, 'COUNTRIES', 'COUNTRYID', 'countries_gen' );
   Elem_RegionTO  := TDBShemaView.Create( ProvincesTO, ViewRegionTO,'PROVINCES', 'PROVINCEID','Provinces_gen' );
   Elem_AreaTO    := TDBShemaView.Create( TownShipTo, ViewAreaTo,   'townships', 'TOWNSHIPID', 'TownShips_gen' );
   Elem_CityTO    := TDBShemaView.Create( AdoCITYTO, ViewCityTo,   'CITIES', 'CITYID', 'cities_gen' );
   Elem_CityTO.SetFunctionGenId( GenIdCityTo );
   //Elem_CityTO.CreateIBDynamicCloneDataset( CityTo );
   //CityToSrc.DataSet := Elem_CityTO.DB;


   Elem_COUNTRIES_INFOTo := TDBShemaView.Create( COUNTRIES_INFOTo, nil,   'COUNTRIES_INFO', 'ID', 'gen_countries_info_id' );
   Elem_LanguagesTO :=TDBShemaView.Create( LanguagesTO, nil,   'LANGUAGES', 'ID', '' );
   Elem_TIME_ZONETo :=TDBShemaView.Create( TIME_ZONETo, nil,   'TIME_ZONE', 'ID', '' );
   Elem_FORM_GOVERNMENT:= TDBShemaView.Create( FORM_GOVERNMENT, nil,   'FORM_GOVERNMENT', 'ID', '' );
   Elem_Currncy := TDBShemaView.Create( CurrencyTo, nil,   'CURRENCY', 'CURRENCYID', '' );

   //Elem_RegionTO.SetFunctionGenId( GenIdRegion );
   //Elem_CityRegion := TDBShemaView.Create( CityRegion, nil, 'CITY', 'CITY_ID', 'gen_cities_id' );

   Elem_Country.DBOpen;
   Elem_CountryDetail.DBOpen;
   Elem_CountryDetailTypes.DBOpen;

   Elem_Region.DBOpen;
   Elem_Area.DBOpen;

   //PrepareArea;
   Elem_CounrtyTO.DBOpen;
   Elem_RegionTO.DBOpen;
   Elem_AreaTO.DBOpen;
   // Elem_CityTO.DBOpen;

   //CorrectRegions;
   Elem_City.DBOpen;
   Elem_CityTo.DBOpen;

   Elem_LanguagesTO.DBOpen;
   Elem_TIME_ZONETo.DBOpen;
   Elem_FORM_GOVERNMENT.DBOpen;
   Elem_COUNTRIES_INFOTo.DBOpen;
   Elem_Currncy.DBOpen;


   ParseByField := 'TITLE_UA';

   // MergeCountry( ExtractFilePath( Application.ExeName ) );
   //GetTimeZone( '([[UTCUTC+5, UTC+6, без літнього часу]])' );
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  IBDatabase.Connected := True;
  //PrepareConnectDatabeseTourManTest(IBDatabase,True);
  //PrepareConnectDatabeseTourManWork(IBDatabase,True);

  InitElements;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  FreeAllElements;
end;

procedure TDM.ViewCountryFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  {Elem_City.DBClose;
  TIBQuery(Elem_City.DB).SQL.Text :='SELECT * from  CITIES where COUNTRY_ID=:COUNTRY_ID';

  Elem_City.DBQuerySetParamValue( 'COUNTRY_ID', Elem_Country.GetValueId );
  Elem_City.DBOpen; }
end;

end.
