object DMServDic: TDMServDic
  OldCreateOrder = False
  Left = 62
  Top = 3
  Height = 1028
  Width = 1794
  object BrCountryQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' select Co.CountryId, Co.Name, Co.ShowWeb, Co.SHORTSIGN, Co.TIME' +
        'BIAS,  Co.ccode, Co.Code2,Co.Code3,Co.NEEDVISA, Co.PHONECODEUNI,'
      '   '
      '     ( select Count(Languages.ID) from Languages'
      
        '      left join countries_lng on countries_lng.id_lng = Language' +
        's.id and countries_lng.id_countries = Co.CountryId'
      
        '      where Languages.active_translate is not null and countries' +
        '_lng.id_lng is null ) LNGNOTFOUND,'
      
        '     ( select sum( countries_lng.change_name ) from countries_ln' +
        'g where countries_lng.id_countries = Co.CountryId ) LNGCHANGE'
      ''
      '  from Countries Co ')
    Left = 1016
    Top = 128
    object BrCountryQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object BrCountryQryNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object BrCountryQrySHOWWEB: TStringField
      FieldName = 'SHOWWEB'
      Size = 1
    end
    object BrCountryQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object BrCountryQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object BrCountryQrySHORTSIGN: TStringField
      FieldName = 'SHORTSIGN'
      Size = 3
    end
    object BrCountryQryTIMEBIAS: TFloatField
      FieldName = 'TIMEBIAS'
    end
    object BrCountryQryCCODE: TStringField
      FieldName = 'CCODE'
      Size = 3
    end
    object BrCountryQryCODE2: TStringField
      FieldName = 'CODE2'
      Size = 2
    end
    object BrCountryQryCODE3: TStringField
      FieldName = 'CODE3'
      Size = 3
    end
    object BrCountryQryNEEDVISA: TStringField
      FieldName = 'NEEDVISA'
      Size = 1
    end
    object BrCountryQryPHONECODEUNI: TStringField
      FieldName = 'PHONECODEUNI'
      Size = 1
    end
  end
  object BrCountrySrc: TDataSource
    DataSet = BrCountryQry
    Left = 1019
    Top = 179
  end
  object HCityQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'CountryId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        '   select  distinct H.id_city_adm_unit ID, H.countryid ID_COUNTR' +
        'Y,'
      '   Ci.Name CITYNAME,'
      
        '   ( select NAME from CITY_ADM_UNT_ITEMS_TYPE_LNG WHERE id_lng =' +
        ' 350 and H.id_city_adm_unit = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm' +
        '_unt_items_type ) Name_Eng ,'
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = ' +
        'Languages.id and CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = H.id_city_' +
        'adm_unit'
      
        '     where Languages.active_translate is not null and CITY_ADM_U' +
        'NIT_lng.id_lng is null ) LNGNOTFOUND,'
      ''
      
        '    ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_' +
        'UNIT_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = H.id_city_ad' +
        'm_unit ) LNGCHANGE ,'
      ''
      '    CASE'
      
        '      when ( Ci.id_main_parent > 0 ) then ( Select FIRST 1 NAME ' +
        'FROM CITY_PATH_PROC( Ci.ID_PARENT , null, 0,448 ) )'
      
        '      else ( Select FIRST 1 NAME FROM CITY_PATH_PROC( Ci.ID , nu' +
        'll, 0,448 ) )'
      '    END NAMEPATH'
      ''
      '    from Hotels H'
      '    left join CITY_ADM_UNIT Ci on Ci.Id = H.id_city_adm_unit'
      '    left join Countries Co on Co.CountryId = Ci.id_country'
      '    where H.CountryId = :CountryId')
    Left = 1360
    Top = 384
    object HCityQryID: TIntegerField
      FieldName = 'ID'
    end
    object HCityQryID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object HCityQryCITYNAME: TStringField
      FieldName = 'CITYNAME'
      Size = 250
    end
    object HCityQryNAME_ENG: TStringField
      FieldName = 'NAME_ENG'
      Size = 250
    end
    object HCityQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object HCityQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object HCityQryNAMEPATH: TStringField
      FieldName = 'NAMEPATH'
      Size = 1000
    end
  end
  object HCitySrc: TDataSource
    DataSet = HCityQry
    Left = 1361
    Top = 427
  end
  object RoomTypeSrc: TDataSource
    DataSet = RoomTypeQry
    Left = 203
    Top = 45
  end
  object RoomTypeQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from RoomTypes')
    Left = 200
    Top = 7
    object RoomTypeQryROOMTYPEID: TIntegerField
      FieldName = 'ROOMTYPEID'
    end
    object RoomTypeQryROOMTYPE: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1085#1086#1084#1077#1088#1091
      FieldName = 'ROOMTYPE'
      Size = 30
    end
    object RoomTypeQryEXTNAME: TStringField
      DisplayLabel = #1057#1082#1086#1088#1086#1095'.'
      FieldName = 'EXTNAME'
      Size = 10
    end
    object RoomTypeQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object RoomTypeQryCAPACITY: TSmallintField
      FieldName = 'CAPACITY'
    end
    object RoomTypeQryADDCAPACITY: TSmallintField
      FieldName = 'ADDCAPACITY'
    end
    object RoomTypeQryMINPERSON: TSmallintField
      FieldName = 'MINPERSON'
    end
    object RoomTypeQryADDCAPADULT: TSmallintField
      FieldName = 'ADDCAPADULT'
    end
  end
  object FEEDTYPESQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select FEEDTYPES.*,'
      '  ( select Count(Languages.ID) from Languages'
      
        '  left join FEEDTYPES_lng on FEEDTYPES_lng.id_lng = Languages.id' +
        ' and FEEDTYPES_lng.id_feedtypes = FEEDTYPES.feedtypeid'
      
        '  where Languages.active_translate is not null and FEEDTYPES_lng' +
        '.id_lng is null ) LNGNOTFOUND,'
      ''
      
        '  ( select sum( FEEDTYPES_lng.change_feedname ) from FEEDTYPES_l' +
        'ng where FEEDTYPES_lng.id_feedtypes = FEEDTYPES.feedtypeid ) LNG' +
        'CHANGE'
      ' from FEEDTYPES')
    Left = 200
    Top = 96
    object FEEDTYPESQryFEEDTYPEID: TIntegerField
      FieldName = 'FEEDTYPEID'
      Origin = '"FEEDTYPES"."FEEDTYPEID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FEEDTYPESQryFEEDNAME: TIBStringField
      FieldName = 'FEEDNAME'
      Origin = '"FEEDTYPES"."FEEDNAME"'
      Size = 50
    end
    object FEEDTYPESQryMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"FEEDTYPES"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
    end
    object FEEDTYPESQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"FEEDTYPES"."NAME"'
      Size = 25
    end
    object FEEDTYPESQrySORTORDER: TSmallintField
      FieldName = 'SORTORDER'
      Origin = '"FEEDTYPES"."SORTORDER"'
    end
    object FEEDTYPESQryRATEPREFER: TIBStringField
      FieldName = 'RATEPREFER'
      Origin = '"FEEDTYPES"."RATEPREFER"'
      Size = 1
    end
    object FEEDTYPESQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object FEEDTYPESQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object FEEDTYPESSrc: TDataSource
    DataSet = FEEDTYPESQry
    Left = 200
    Top = 136
  end
  object OTHERSERVICESQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from OTHERSERVICES')
    Left = 296
    Top = 8
    object OTHERSERVICESQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"OTHERSERVICES"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object OTHERSERVICESQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"OTHERSERVICES"."NAME"'
      Size = 200
    end
    object OTHERSERVICESQryORDERINCATEGORY: TIntegerField
      FieldName = 'ORDERINCATEGORY'
      Origin = '"OTHERSERVICES"."ORDERINCATEGORY"'
    end
    object OTHERSERVICESQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
      Origin = '"OTHERSERVICES"."INTVALUE"'
    end
    object OTHERSERVICESQryORDERED: TIntegerField
      FieldName = 'ORDERED'
      Origin = '"OTHERSERVICES"."ORDERED"'
    end
    object OTHERSERVICESQryMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"OTHERSERVICES"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object OTHERSERVICESSrc: TDataSource
    DataSet = OTHERSERVICESQry
    Left = 296
    Top = 48
  end
  object HtlCategSrc: TDataSource
    DataSet = HtlCategQry
    Left = 35
    Top = 61
  end
  object HtlCategQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM HTLCATEG')
    Left = 35
    Top = 13
    object HtlCategQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object HtlCategQryHOTELCATEGID: TIntegerField
      FieldName = 'HOTELCATEGID'
      Required = True
    end
    object HtlCategQryNAME: TIBStringField
      FieldName = 'NAME'
    end
  end
  object HotelKindSrc: TDataSource
    DataSet = HotelKindQry
    Left = 110
    Top = 61
  end
  object HotelKindQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select HOTELKIND.*,'
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join HOTELKIND_lng on HOTELKIND_lng.id_lng = Languages.id' +
        ' and HOTELKIND_lng.id_hotelkind = HOTELKIND.id'
      
        '  where Languages.active_translate is not null and HOTELKIND_lng' +
        '.id_lng is null ) LNGNOTFOUND,'
      
        ' ( select sum( HOTELKIND_lng.change_name ) from HOTELKIND_lng wh' +
        'ere HOTELKIND_lng.id_hotelkind = HOTELKIND.id ) LNGCHANGE'
      ''
      ' from HOTELKIND'
      ''
      ''
      '')
    Left = 110
    Top = 13
    object HotelKindQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"HOTELKIND"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object HotelKindQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"HOTELKIND"."NAME"'
      Size = 100
    end
    object HotelKindQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object HotelKindQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object HotelKindQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object MISMATCHQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM MISMATCH')
    Left = 31
    Top = 536
    object MISMATCHQryID: TIntegerField
      FieldName = 'ID'
    end
    object MISMATCHQryNAME: TStringField
      FieldName = 'NAME'
      Size = 300
    end
    object MISMATCHQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object MISMATCHSrc: TDataSource
    DataSet = MISMATCHQry
    Left = 31
    Top = 592
  end
  object BuildsQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select HOTEL_BUILDS.*,'
      ''
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join HOTEL_BUILDS_lng on HOTEL_BUILDS_lng.id_lng = Langua' +
        'ges.id and HOTEL_BUILDS_lng.id_hotel_builds = HOTEL_BUILDS.id'
      
        '  where Languages.active_translate is not null and HOTEL_BUILDS_' +
        'lng.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( HOTEL_BUILDS_lng.change_name ) from HOTEL_BUILDS' +
        '_lng where HOTEL_BUILDS_lng.id_hotel_builds = HOTEL_BUILDS.id ) ' +
        'LNGCHANGE'
      ''
      ' from HOTEL_BUILDS')
    Left = 296
    Top = 93
    object BuildsQryID: TIntegerField
      FieldName = 'ID'
    end
    object BuildsQryNAME: TStringField
      FieldName = 'NAME'
      Size = 300
    end
    object BuildsQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object BuildsQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object BuildsQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object BuildsQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object BuildsQrySrc: TDataSource
    DataSet = BuildsQry
    Left = 296
    Top = 133
  end
  object DocumVisaQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select VISADOC.*, ( select Count(L.VisaDocLinkId) from VisaDocLi' +
        'nks L where DocId = VISADOC.ID ) CntLink from  VISADOC')
    Left = 120
    Top = 536
    object DocumVisaQryID: TIntegerField
      FieldName = 'ID'
    end
    object DocumVisaQryNAME: TStringField
      FieldName = 'NAME'
      Size = 350
    end
    object DocumVisaQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 50
    end
    object DocumVisaQryORDERINCATEGORY: TIntegerField
      FieldName = 'ORDERINCATEGORY'
    end
    object DocumVisaQryONETYPEDOC: TIntegerField
      FieldName = 'ONETYPEDOC'
    end
    object DocumVisaQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object DocumVisaQryCNTLINK: TLargeintField
      FieldName = 'CNTLINK'
    end
  end
  object DocumVisaSrc: TDataSource
    DataSet = DocumVisaQry
    Left = 120
    Top = 584
  end
  object COUNTRIES_INFO: TADOQuery
    Connection = ADOConnection
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select COUNTRIES_INFO.ID, COUNTRIES_INFO.id_countries_type_info,' +
        ' COUNTRIES_TYPE_INFO.NAME,COUNTRIES_TYPE_INFO.table_ind, COUNTRI' +
        'ES_INFO.id_value,  COUNTRIES_INFO.AVALUE,'
      'COUNTRIES_INFO.id_unit_measur,'
      'CASE'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 1 THEN ( select CITIES.N' +
        'AME from CITIES WHERE CITIES.cityid =  COUNTRIES_INFO.id_value )'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 2 THEN ( select language' +
        's.NAME from languages WHERE languages.id =  COUNTRIES_INFO.id_va' +
        'lue )'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 3 THEN ( select FORM_GOV' +
        'ERNMENT.NAME from FORM_GOVERNMENT WHERE FORM_GOVERNMENT.id =  CO' +
        'UNTRIES_INFO.id_value )'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 4 THEN ( select currency' +
        '.currencyshort from currency WHERE currency.currencyid =  COUNTR' +
        'IES_INFO.id_value )'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 5 THEN ( select POWER_VO' +
        'LT_FREQ.avalue from POWER_VOLT_FREQ WHERE POWER_VOLT_FREQ.id =  ' +
        'COUNTRIES_INFO.id_value )'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 6 THEN ( select TYPE_POW' +
        '_SOCKETS.name from TYPE_POW_SOCKETS WHERE TYPE_POW_SOCKETS.id = ' +
        ' COUNTRIES_INFO.id_value )'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 7 THEN (select religion.' +
        'name from religion WHERE religion.ID =  COUNTRIES_INFO.id_value ' +
        ')'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 8 THEN (select INTERNACI' +
        'ONAL_ORG.name from INTERNACIONAL_ORG WHERE INTERNACIONAL_ORG.ID ' +
        '=  COUNTRIES_INFO.id_value )'
      
        '   WHEN COUNTRIES_TYPE_INFO.table_ind = 9 THEN (select TIME_ZONE' +
        '.NAME from TIME_ZONE WHERE TIME_ZONE.ID =  COUNTRIES_INFO.id_val' +
        'ue )'
      
        '   WHEN COUNTRIES_INFO.id_unit_measur is not null THEN ( select ' +
        'UNIT_MEASUR.short from UNIT_MEASUR where id =  COUNTRIES_INFO.id' +
        '_unit_measur )'
      'ELSE null'
      'END as ADDVALUE, ID_COUNTRIES '
      'from COUNTRIES_INFO'
      
        'left join COUNTRIES_TYPE_INFO on COUNTRIES_TYPE_INFO.id = COUNTR' +
        'IES_INFO.id_countries_type_info'
      'where ID_COUNTRIES = :COUNTRYID')
    Left = 1136
    Top = 128
    object COUNTRIES_INFOID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRIES_INFO"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object COUNTRIES_INFOID_COUNTRIES_TYPE_INFO: TIntegerField
      FieldName = 'ID_COUNTRIES_TYPE_INFO'
      Origin = '"COUNTRIES_INFO"."ID_COUNTRIES_TYPE_INFO"'
    end
    object COUNTRIES_INFONAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES_TYPE_INFO"."NAME"'
      Size = 200
    end
    object COUNTRIES_INFOTABLE_IND: TIntegerField
      FieldName = 'TABLE_IND'
      Origin = '"COUNTRIES_TYPE_INFO"."TABLE_IND"'
    end
    object COUNTRIES_INFOID_VALUE: TIntegerField
      FieldName = 'ID_VALUE'
      Origin = '"COUNTRIES_INFO"."ID_VALUE"'
    end
    object COUNTRIES_INFOAVALUE: TIBStringField
      FieldName = 'AVALUE'
      Origin = '"COUNTRIES_INFO"."AVALUE"'
      Size = 300
    end
    object COUNTRIES_INFOADDVALUE: TIBStringField
      FieldName = 'ADDVALUE'
      ProviderFlags = []
      Size = 200
    end
    object COUNTRIES_INFOID_UNIT_MEASUR: TIntegerField
      FieldName = 'ID_UNIT_MEASUR'
      Origin = '"COUNTRIES_INFO"."ID_UNIT_MEASUR"'
    end
    object COUNTRIES_INFOID_COUNTRIES: TIntegerField
      FieldName = 'ID_COUNTRIES'
      Origin = '"COUNTRIES_INFO"."ID_COUNTRIES"'
    end
  end
  object Language: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from LANGUAGES')
    Left = 416
    Top = 16
    object LanguageID: TIntegerField
      FieldName = 'ID'
      Origin = '"LANGUAGES"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LanguageNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"LANGUAGES"."NAME"'
      Size = 100
    end
    object LanguageORIGINAL_NAME: TIBStringField
      FieldName = 'ORIGINAL_NAME'
      Origin = '"LANGUAGES"."ORIGINAL_NAME"'
      Size = 100
    end
    object LanguageACTIVE_TRANSLATE: TIntegerField
      FieldName = 'ACTIVE_TRANSLATE'
      Origin = '"LANGUAGES"."ACTIVE_TRANSLATE"'
    end
    object LanguageIDENT: TIBStringField
      FieldName = 'IDENT'
      Origin = '"LANGUAGES"."IDENT"'
      Size = 2
    end
    object LanguageICON: TIBStringField
      FieldName = 'ICON'
      Origin = '"LANGUAGES"."ICON"'
      Size = 100
    end
  end
  object LanguageSrc: TDataSource
    DataSet = Language
    Left = 416
    Top = 64
  end
  object Religion: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from Religion')
    Left = 528
    Top = 16
    object ReligionID: TIntegerField
      FieldName = 'ID'
      Origin = '"RELIGION"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object ReligionNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"RELIGION"."NAME"'
      Size = 70
    end
  end
  object ReligionSrc: TDataSource
    DataSet = Religion
    Left = 528
    Top = 64
  end
  object POWER_VOLT_FREQ: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      
        'select POWER_VOLT_FREQ.*,POWER_VOLT_FREQ.AVALUE||UNIT_MEASUR.sho' +
        'rt MEASURNAME from POWER_VOLT_FREQ'
      
        'left join UNIT_MEASUR on UNIT_MEASUR.ID = POWER_VOLT_FREQ.id_uni' +
        't_measur')
    Left = 421
    Top = 112
    object POWER_VOLT_FREQID: TIntegerField
      FieldName = 'ID'
      Origin = '"POWER_VOLT_FREQ"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object POWER_VOLT_FREQTYPE: TIntegerField
      FieldName = 'ATYPE'
      Origin = '"POWER_VOLT_FREQ"."TYPE"'
    end
    object POWER_VOLT_FREQVALUE: TIntegerField
      FieldName = 'AVALUE'
      Origin = '"POWER_VOLT_FREQ"."VALUE"'
    end
    object POWER_VOLT_FREQID_UNIT_MEASUR: TIntegerField
      FieldName = 'ID_UNIT_MEASUR'
      Origin = '"POWER_VOLT_FREQ"."ID_UNIT_MEASUR"'
    end
    object POWER_VOLT_FREQMEASURNAME: TIBStringField
      FieldName = 'MEASURNAME'
      ProviderFlags = []
      Size = 21
    end
  end
  object POWER_VOLT_FREQSrc: TDataSource
    DataSet = POWER_VOLT_FREQ
    Left = 421
    Top = 160
  end
  object UNIT_MEASUR: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from UNIT_MEASUR')
    Left = 416
    Top = 216
    object UNIT_MEASURID: TIntegerField
      FieldName = 'ID'
      Origin = '"UNIT_MEASUR"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object UNIT_MEASURNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"UNIT_MEASUR"."NAME"'
      Size = 50
    end
    object UNIT_MEASURANAMES: TIBStringField
      FieldName = 'ANAMES'
      Origin = '"UNIT_MEASUR"."ANAMES"'
      Size = 50
    end
    object UNIT_MEASURSHORT: TIBStringField
      FieldName = 'SHORT'
      Origin = '"UNIT_MEASUR"."SHORT"'
      Size = 10
    end
  end
  object UNIT_MEASURSrc: TDataSource
    DataSet = UNIT_MEASUR
    Left = 416
    Top = 272
  end
  object FORM_GOVERNMENT: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from FORM_GOVERNMENT')
    Left = 639
    Top = 112
    object FORM_GOVERNMENTID: TIntegerField
      FieldName = 'ID'
      Origin = '"FORM_GOVERNMENT"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FORM_GOVERNMENTNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"FORM_GOVERNMENT"."NAME"'
      Size = 200
    end
  end
  object FORM_GOVERNMENTSrc: TDataSource
    DataSet = FORM_GOVERNMENT
    Left = 639
    Top = 160
  end
  object COUNTRIES_HOLIDAYS: TADOQuery
    Connection = ADOConnection
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'CountryId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from COUNTRIES_HOLIDAYS'
      'where ID_COUNTRIES = :COUNTRYID')
    Left = 640
    Top = 320
    object COUNTRIES_HOLIDAYSID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRIES_HOLIDAYS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object COUNTRIES_HOLIDAYSID_COUNTRIES: TIntegerField
      FieldName = 'ID_COUNTRIES'
      Origin = '"COUNTRIES_HOLIDAYS"."ID_COUNTRIES"'
    end
    object COUNTRIES_HOLIDAYSNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES_HOLIDAYS"."NAME"'
      Size = 500
    end
    object COUNTRIES_HOLIDAYSTYPEDATE: TIntegerField
      FieldName = 'TYPEDATE'
      Origin = '"COUNTRIES_HOLIDAYS"."TYPEDATE"'
    end
    object COUNTRIES_HOLIDAYSAMONTH: TIntegerField
      FieldName = 'AMONTH'
      Origin = '"COUNTRIES_HOLIDAYS"."AMONTH"'
    end
    object COUNTRIES_HOLIDAYSAVALUE: TIntegerField
      FieldName = 'AVALUE'
      Origin = '"COUNTRIES_HOLIDAYS"."AVALUE"'
    end
    object COUNTRIES_HOLIDAYSCOUNTDAYS: TIntegerField
      FieldName = 'COUNTDAYS'
      Origin = '"COUNTRIES_HOLIDAYS"."COUNTDAYS"'
    end
    object COUNTRIES_HOLIDAYSNAMEBYRELIGION: TIBStringField
      FieldName = 'NAMEBYRELIGION'
      Origin = '"COUNTRIES_HOLIDAYS"."NAMEBYRELIGION"'
      Size = 50
    end
    object COUNTRIES_HOLIDAYSCalcDate: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcDate'
      Size = 100
      Calculated = True
    end
  end
  object COUNTRIES_HOLIDAYSSrc: TDataSource
    DataSet = COUNTRIES_HOLIDAYS
    Left = 640
    Top = 368
  end
  object TYPE_POW_SOCKETS: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from TYPE_POW_SOCKETS')
    Left = 640
    Top = 424
    object TYPE_POW_SOCKETSID: TIntegerField
      FieldName = 'ID'
      Origin = '"TYPE_POW_SOCKETS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TYPE_POW_SOCKETSNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TYPE_POW_SOCKETS"."NAME"'
      Size = 3
    end
    object TYPE_POW_SOCKETSICON: TBlobField
      FieldName = 'ICON'
      Origin = '"TYPE_POW_SOCKETS"."ICON"'
      ProviderFlags = [pfInUpdate]
    end
  end
  object TYPE_POW_SOCKETSSrc: TDataSource
    DataSet = TYPE_POW_SOCKETS
    Left = 640
    Top = 456
  end
  object TIME_ZONE: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from TIME_ZONE')
    Left = 416
    Top = 424
    object TIME_ZONEID: TIntegerField
      FieldName = 'ID'
      Origin = '"TIME_ZONE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TIME_ZONENAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TIME_ZONE"."NAME"'
      Size = 50
    end
    object TIME_ZONEAVALUE: TFloatField
      FieldName = 'AVALUE'
      Origin = '"TIME_ZONE"."AVALUE"'
    end
  end
  object TIME_ZONESrc: TDataSource
    DataSet = TIME_ZONE
    Left = 416
    Top = 472
  end
  object CAR_TYPE_INFO: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from CAR_TYPE_INFO')
    Left = 528
    Top = 336
    object CAR_TYPE_INFOID: TIntegerField
      FieldName = 'ID'
      Origin = '"CAR_TYPE_INFO"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CAR_TYPE_INFONAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"CAR_TYPE_INFO"."NAME"'
      Size = 100
    end
    object CAR_TYPE_INFONOTE: TMemoField
      FieldName = 'NOTE'
      Origin = '"CAR_TYPE_INFO"."NOTE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object CAR_TYPE_INFOSrc: TDataSource
    DataSet = CAR_TYPE_INFO
    Left = 536
    Top = 376
  end
  object COUNTRIES_CAR_SPEED_INFO: TADOQuery
    Connection = ADOConnection
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from COUNTRIES_CAR_SPEED_INFO'
      'where ID_COUNTRY = :COUNTRYID')
    Left = 639
    Top = 208
    object COUNTRIES_CAR_SPEED_INFOID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRIES_CAR_SPEED_INFO"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object COUNTRIES_CAR_SPEED_INFOID_CAR_TYPE_INFO: TIntegerField
      FieldName = 'ID_CAR_TYPE_INFO'
      Origin = '"COUNTRIES_CAR_SPEED_INFO"."ID_CAR_TYPE_INFO"'
    end
    object COUNTRIES_CAR_SPEED_INFOAUTOSTRADA: TIntegerField
      FieldName = 'AUTOSTRADA'
      Origin = '"COUNTRIES_CAR_SPEED_INFO"."AUTOSTRADA"'
    end
    object COUNTRIES_CAR_SPEED_INFOSPEEDROAD: TIntegerField
      FieldName = 'SPEEDROAD'
      Origin = '"COUNTRIES_CAR_SPEED_INFO"."SPEEDROAD"'
    end
    object COUNTRIES_CAR_SPEED_INFOOTHERREAD: TIntegerField
      FieldName = 'OTHERREAD'
      Origin = '"COUNTRIES_CAR_SPEED_INFO"."OTHERREAD"'
    end
    object COUNTRIES_CAR_SPEED_INFOSETTLEMENTS: TIntegerField
      FieldName = 'SETTLEMENTS'
      Origin = '"COUNTRIES_CAR_SPEED_INFO"."SETTLEMENTS"'
    end
    object COUNTRIES_CAR_SPEED_INFOID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
      Origin = '"COUNTRIES_CAR_SPEED_INFO"."ID_COUNTRY"'
    end
  end
  object COUNTRIES_CAR_SPEED_INFOSrc: TDataSource
    DataSet = COUNTRIES_CAR_SPEED_INFO
    Left = 640
    Top = 256
  end
  object INTERNACIONAL_ORG: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from INTERNACIONAL_ORG')
    Left = 528
    Top = 224
    object INTERNACIONAL_ORGID: TIntegerField
      FieldName = 'ID'
      Origin = '"INTERNACIONAL_ORG"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object INTERNACIONAL_ORGNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"INTERNACIONAL_ORG"."NAME"'
      Size = 100
    end
  end
  object INTERNACIONAL_ORGSrc: TDataSource
    DataSet = INTERNACIONAL_ORG
    Left = 528
    Top = 280
  end
  object CNTREMBASSIES: TADOQuery
    Connection = ADOConnection
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select distinct Co.CompanyId,  E.CNTREMBASSYID, Co.Name as Embas' +
        'syName, Ci.Name as CityName, E.OurEmbassy, E.CountryId,E.ForOwne' +
        'rVisa, COALESCE( E.FUNDINGSUM, 0 ) FUNDINGSUM,E.FUNDINGVAL,E.FUN' +
        'DINGCOUNT, E.FUNDINGPERIOD, E.InProvince,'
      
        'COALESCE(E.BANKSUM, 0) BANKSUM, E.BANKVAL, E.BANKCOUNT, E.BANKPE' +
        'RIOD,COALESCE(E.ONTOURSUM, 0) ONTOURSUM, E.OurFiling, E.FilingPl' +
        'aceWork,PERMTRANSFDOC,PAYBANKSERV,READYTODAYS,AUTOFILLING,USECOD' +
        'E,TypeFunding,READYTOTYPE,APPLTYPEDATE,SERVCOST,SERVCOSTVAL,CURR' +
        'SERV,COMMENTS'
      ''
      'from CntrEmbassies E, Companies Co, CompOffices O, Cities Ci'
      'where E.CountryId = :CountryId'
      '  and Co.CompanyId = E.EmbassyId'
      '  and O.CompanyId = Co.CompanyId'
      '  and Ci.CityId = O.CityId'
      '  and Co.AsAmbas = '#39'T'#39
      'order by Co.Name, Ci.Name')
    Left = 530
    Top = 120
    object CNTREMBASSIESCNTREMBASSYID: TIntegerField
      FieldName = 'CNTREMBASSYID'
      Origin = '"CNTREMBASSIES"."CNTREMBASSYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CNTREMBASSIESCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object CNTREMBASSIESEMBASSYNAME: TStringField
      DisplayLabel = #1055#1088#1077#1076#1089#1090#1072#1074#1085#1080#1094#1090#1074#1086
      FieldName = 'EMBASSYNAME'
      Size = 100
    end
    object CNTREMBASSIESCityName: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089#1072
      FieldName = 'CityName'
      Size = 25
    end
    object CNTREMBASSIESOUREMBASSY: TIBStringField
      FieldName = 'OUREMBASSY'
      Origin = '"CNTREMBASSIES"."OUREMBASSY"'
      Size = 1
    end
    object CNTREMBASSIESCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"CNTREMBASSIES"."COUNTRYID"'
    end
    object CNTREMBASSIESFOROWNERVISA: TIBStringField
      FieldName = 'FOROWNERVISA'
      Origin = '"CNTREMBASSIES"."FOROWNERVISA"'
      Size = 1
    end
    object CNTREMBASSIESFUNDINGSUM: TFloatField
      FieldName = 'FUNDINGSUM'
      ProviderFlags = []
    end
    object CNTREMBASSIESFUNDINGVAL: TSmallintField
      FieldName = 'FUNDINGVAL'
      Origin = '"CNTREMBASSIES"."FUNDINGVAL"'
    end
    object CNTREMBASSIESFUNDINGCOUNT: TIntegerField
      FieldName = 'FUNDINGCOUNT'
      Origin = '"CNTREMBASSIES"."FUNDINGCOUNT"'
    end
    object CNTREMBASSIESFUNDINGPERIOD: TSmallintField
      FieldName = 'FUNDINGPERIOD'
      Origin = '"CNTREMBASSIES"."FUNDINGPERIOD"'
    end
    object CNTREMBASSIESBANKSUM: TFloatField
      FieldName = 'BANKSUM'
      ProviderFlags = []
    end
    object CNTREMBASSIESBANKVAL: TSmallintField
      FieldName = 'BANKVAL'
      Origin = '"CNTREMBASSIES"."BANKVAL"'
    end
    object CNTREMBASSIESBANKCOUNT: TIntegerField
      FieldName = 'BANKCOUNT'
      Origin = '"CNTREMBASSIES"."BANKCOUNT"'
    end
    object CNTREMBASSIESBANKPERIOD: TSmallintField
      FieldName = 'BANKPERIOD'
      Origin = '"CNTREMBASSIES"."BANKPERIOD"'
    end
    object CNTREMBASSIESONTOURSUM: TFloatField
      FieldName = 'ONTOURSUM'
      ProviderFlags = []
    end
    object CNTREMBASSIESOURFILING: TIBStringField
      FieldName = 'OURFILING'
      Origin = '"CNTREMBASSIES"."OURFILING"'
      Size = 1
    end
    object CNTREMBASSIESFILINGPLACEWORK: TIBStringField
      FieldName = 'FILINGPLACEWORK'
      Origin = '"CNTREMBASSIES"."FILINGPLACEWORK"'
      Size = 1
    end
    object CNTREMBASSIESPERMTRANSFDOC: TSmallintField
      FieldName = 'PERMTRANSFDOC'
      Origin = '"CNTREMBASSIES"."PERMTRANSFDOC"'
    end
    object CNTREMBASSIESPAYBANKSERV: TFloatField
      FieldName = 'PAYBANKSERV'
      Origin = '"CNTREMBASSIES"."PAYBANKSERV"'
    end
    object CNTREMBASSIESREADYTODAYS: TIntegerField
      FieldName = 'READYTODAYS'
      Origin = '"CNTREMBASSIES"."READYTODAYS"'
    end
    object CNTREMBASSIESAUTOFILLING: TIBStringField
      FieldName = 'AUTOFILLING'
      Origin = '"CNTREMBASSIES"."AUTOFILLING"'
      Size = 1
    end
    object CNTREMBASSIESUSECODE: TIBStringField
      FieldName = 'USECODE'
      Origin = '"CNTREMBASSIES"."USECODE"'
      Size = 1
    end
    object CNTREMBASSIESTYPEFUNDING: TIntegerField
      FieldName = 'TYPEFUNDING'
      Origin = '"CNTREMBASSIES"."TYPEFUNDING"'
    end
    object CNTREMBASSIESREADYTOTYPE: TIntegerField
      FieldName = 'READYTOTYPE'
      Origin = '"CNTREMBASSIES"."READYTOTYPE"'
    end
    object CNTREMBASSIESAPPLTYPEDATE: TIntegerField
      FieldName = 'APPLTYPEDATE'
      Origin = '"CNTREMBASSIES"."APPLTYPEDATE"'
    end
    object CNTREMBASSIESSERVCOST: TFloatField
      FieldName = 'SERVCOST'
      Origin = '"CNTREMBASSIES"."SERVCOST"'
    end
    object CNTREMBASSIESSERVCOSTVAL: TSmallintField
      FieldName = 'SERVCOSTVAL'
      Origin = '"CNTREMBASSIES"."SERVCOSTVAL"'
    end
    object CNTREMBASSIESCURRSERV: TSmallintField
      FieldName = 'CURRSERV'
      Origin = '"CNTREMBASSIES"."CURRSERV"'
    end
    object CNTREMBASSIESCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      Origin = '"CNTREMBASSIES"."COMMENTS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object CNTREMBASSIESINPROVINCE: TIBStringField
      FieldName = 'INPROVINCE'
      Origin = '"CNTREMBASSIES"."INPROVINCE"'
      Size = 80
    end
    object CNTREMBASSIESCalcEmbassyName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcEmbassyName'
      Size = 200
      Calculated = True
    end
    object CNTREMBASSIESCalcFundingSum: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcFundingSum'
      Calculated = True
    end
    object CNTREMBASSIESCalcBankSum: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcBankSum'
      Calculated = True
    end
    object CNTREMBASSIESCalcOnTourSum: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcOnTourSum'
      Calculated = True
    end
  end
  object CNTREMBASSIESSrc: TDataSource
    DataSet = CNTREMBASSIES
    Left = 536
    Top = 172
  end
  object COUNTRIES_MOVE_TIME: TADOQuery
    Connection = ADOConnection
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from COUNTRIES_MOVE_TIME'
      'where ID_COUNTRY = :COUNTRYID'
      '')
    Left = 416
    Top = 328
    object COUNTRIES_MOVE_TIMEID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRIES_MOVE_TIME"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object COUNTRIES_MOVE_TIMEID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
      Origin = '"COUNTRIES_MOVE_TIME"."ID_COUNTRY"'
    end
    object COUNTRIES_MOVE_TIMEMONTH_1: TIntegerField
      FieldName = 'MONTH_1'
      Origin = '"COUNTRIES_MOVE_TIME"."MONTH_1"'
    end
    object COUNTRIES_MOVE_TIMETYPEMOVED_1: TIntegerField
      FieldName = 'TYPEMOVED_1'
      Origin = '"COUNTRIES_MOVE_TIME"."TYPEMOVED_1"'
    end
    object COUNTRIES_MOVE_TIMEAVALUE_1: TIntegerField
      FieldName = 'AVALUE_1'
      Origin = '"COUNTRIES_MOVE_TIME"."AVALUE_1"'
    end
    object COUNTRIES_MOVE_TIMEMONTH_2: TIntegerField
      FieldName = 'MONTH_2'
      Origin = '"COUNTRIES_MOVE_TIME"."MONTH_2"'
    end
    object COUNTRIES_MOVE_TIMETYPEMOVED_2: TIntegerField
      FieldName = 'TYPEMOVED_2'
      Origin = '"COUNTRIES_MOVE_TIME"."TYPEMOVED_2"'
    end
    object COUNTRIES_MOVE_TIMEAVALUE_2: TIntegerField
      FieldName = 'AVALUE_2'
      Origin = '"COUNTRIES_MOVE_TIME"."AVALUE_2"'
    end
  end
  object COUNTRIES_MOVE_TIMESrc: TDataSource
    DataSet = COUNTRIES_MOVE_TIME
    Left = 416
    Top = 368
  end
  object ProvinceOfUkraineQrySrc: TDataSource
    DataSet = ProvinceOfUkraineQry
    Left = 296
    Top = 232
  end
  object ProvinceOfUkraineQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, Cnt.name CO' +
        'UNTRY,  C.SHOWWEB, MC.NAME Capital'
      'from CITY_ADM_UNIT C'
      'left join CITY_ADM_UNIT MC on C.ID_MAIN_CITY = MC.id'
      'left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id'
      'left join Countries Cnt on Cnt.CountryId = C.ID_COUNTRY'
      'where ADMIN_UNIT.ID = 1 and C.id_country = 1')
    Left = 296
    Top = 184
    object ProvinceOfUkraineQryCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 30
    end
    object ProvinceOfUkraineQryNAME: TStringField
      FieldName = 'NAME'
      Size = 35
    end
    object ProvinceOfUkraineQryCAPITAL: TStringField
      FieldName = 'CAPITAL'
      Size = 25
    end
    object ProvinceOfUkraineQryID: TIntegerField
      FieldName = 'ID'
    end
    object ProvinceOfUkraineQryID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object ProvinceOfUkraineQryID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
    end
    object ProvinceOfUkraineQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
  end
  object BedTypeQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select BedTypes.*,'
      '   ( select Count(Languages.ID) from Languages'
      
        '  left join BedTypes_lng on BedTypes_lng.id_lng = Languages.id a' +
        'nd BedTypes_lng.id_bedtypes = BedTypes.bedtypeid'
      
        '  where Languages.active_translate is not null and BedTypes_lng.' +
        'id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( BedTypes_lng.change_name ) from BedTypes_lng whe' +
        're BedTypes_lng.id_bedtypes = BedTypes.bedtypeid ) LNGCHANGE,'
      
        '  ( select sum( BedTypes_lng.change_shortname ) from BedTypes_ln' +
        'g where BedTypes_lng.id_bedtypes = BedTypes.bedtypeid ) LNGCHANG' +
        'E_SH'
      ' from BedTypes')
    Left = 33
    Top = 115
    object BedTypeQryBEDTYPEID: TIntegerField
      FieldName = 'BEDTYPEID'
      Origin = 'DICT.BEDTYPES.BEDTYPEID'
    end
    object BedTypeQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      Origin = 'DICT.BEDTYPES.NAME'
      Size = 100
    end
    object BedTypeQrySHORTNAME: TStringField
      DisplayLabel = #1057#1082#1086#1088'.'
      FieldName = 'SHORTNAME'
      Origin = 'DICT.BEDTYPES.SHORTNAME'
    end
    object BedTypeQryCAPACITY: TIntegerField
      DisplayLabel = #1052'-'#1089#1090#1100
      FieldName = 'CAPACITY'
      Origin = 'DICT.BEDTYPES.CAPACITY'
    end
    object BedTypeQryMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = 'DICT.BEDTYPES.MEMO'
      BlobType = ftMemo
    end
    object BedTypeQryPRIORITY: TIntegerField
      DisplayLabel = #1055#1088#1080#1086#1088#1110#1090#1077#1090
      FieldName = 'PRIORITY'
    end
    object BedTypeQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object BedTypeQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object BedTypeQryLNGCHANGE_SH: TLargeintField
      FieldName = 'LNGCHANGE_SH'
    end
  end
  object CurrencyQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *  from Currency')
    Left = 632
    Top = 15
    object CurrencyQryCURRENCYID: TIntegerField
      FieldName = 'CURRENCYID'
    end
    object CurrencyQryCURRENCYNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'CURRENCYNAME'
      Size = 30
    end
    object CurrencyQryCURRENCYSHORT: TStringField
      Alignment = taCenter
      DisplayLabel = #1057#1082#1086#1088#1086#1095'.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object CurrencyQryCURRENCYCODE: TStringField
      Alignment = taCenter
      DisplayLabel = #1050#1086#1076
      FieldName = 'CURRENCYCODE'
      Size = 3
    end
    object CurrencyQryPREFERRATE: TStringField
      FieldName = 'PREFERRATE'
      Size = 1
    end
    object CurrencyQryINTERESTRATE: TStringField
      FieldName = 'INTERESTRATE'
      Size = 1
    end
    object CurrencyQryISUSED: TStringField
      FieldName = 'ISUSED'
      Size = 1
    end
    object CurrencyQryCOINS: TStringField
      DisplayLabel = #1056#1086#1079#1084'. '#1084#1086#1085#1077#1090#1072
      FieldName = 'COINS'
      Size = 15
    end
    object CurrencyQryCURRENTRATE: TFloatField
      FieldName = 'CURRENTRATE'
      DisplayFormat = '0.0000'
    end
    object CurrencyQryRATEZOOM: TIntegerField
      FieldName = 'RATEZOOM'
    end
    object CurrencyQryLASTDATE: TDateTimeField
      Alignment = taCenter
      FieldName = 'LASTDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object CurrencyQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object CurrencyQryCURRCATEG: TIntegerField
      FieldName = 'CURRCATEG'
    end
    object CurrencyQryCURRENCYNAMEBY: TStringField
      FieldName = 'CURRENCYNAMEBY'
      Size = 35
    end
    object CurrencyQryORDERPRIORITY: TIntegerField
      FieldName = 'ORDERPRIORITY'
    end
    object CurrencyQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
  end
  object CurrencySrc: TDataSource
    DataSet = CurrencyQry
    Left = 635
    Top = 61
  end
  object BrDrvKindQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DrvKinds')
    Left = 127
    Top = 327
    object BrDrvKindQryDRIVEKIND: TIntegerField
      FieldName = 'DRIVEKIND'
    end
    object BrDrvKindQryKIND: TStringField
      DisplayLabel = #1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1091
      FieldName = 'KIND'
      Size = 15
    end
    object BrDrvKindQryKIND_ENG: TStringField
      FieldName = 'KIND_ENG'
      Size = 15
    end
    object BrDrvKindQryCATEGORY: TSmallintField
      FieldName = 'CATEGORY'
    end
    object BrDrvKindQryKINDSHORT: TStringField
      FieldName = 'KINDSHORT'
      Size = 5
    end
    object BrDrvKindQryNAME_LEVEL: TStringField
      FieldName = 'NAME_LEVEL'
      Size = 100
    end
  end
  object BrDrvKindSrc: TDataSource
    DataSet = BrDrvKindQry
    Left = 130
    Top = 373
  end
  object InfraQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, C.ID_PARENT' +
        ',C.ID_MAIN_PARENT, C.ID_MAIN_CITY, C.ID_ADMIN_UNIT_SUB, C.SHOWWE' +
        'B, ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE ,C.AMEMO,'
      ' CASE When ( C.id > 0  ) then'
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = ' +
        'Languages.id and CITY_ADM_UNIT_lng.id_city_adm_unit = C.ID'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNIT_lng.id_lng is null )'
      '    else ('
      '      select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEM' +
        'S_TYPE_LNG.id_lng = Languages.id'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TY' +
        'PE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CI' +
        'TY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_I' +
        'TEMS_TYPE.id_parent_fortree'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNT_ITEMS_TYPE_LNG.id_lng is null )'
      '    END LNGNOTFOUND,'
      
        ' ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_UNI' +
        'T_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = C.ID ) LNGCHANG' +
        'E,'
      
        ' ( Select FIRST 1 NAME FROM CITY_PATH_PROC( C.ID , null, 0,448 )' +
        ' ) NAMEPATH'
      ''
      'from CITY_ADM_UNIT C'
      'left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id'
      
        'where ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  = 4 )  and ( C.ID' +
        '_Country = :COUNTRYID )')
    Left = 1024
    Top = 320
    object InfraQryID: TIntegerField
      FieldName = 'ID'
    end
    object InfraQryID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object InfraQryNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
    object InfraQryID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
    end
    object InfraQryID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
    end
    object InfraQryID_MAIN_PARENT: TIntegerField
      FieldName = 'ID_MAIN_PARENT'
    end
    object InfraQryID_MAIN_CITY: TIntegerField
      FieldName = 'ID_MAIN_CITY'
    end
    object InfraQryID_ADMIN_UNIT_SUB: TIntegerField
      FieldName = 'ID_ADMIN_UNIT_SUB'
    end
    object InfraQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
    object InfraQryID_CITY_ADM_UNT_ITEMS_TYPE: TIntegerField
      FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
    end
    object InfraQryAMEMO: TMemoField
      FieldName = 'AMEMO'
      BlobType = ftMemo
    end
    object InfraQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object InfraQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object InfraQryNAMEPATH: TStringField
      FieldName = 'NAMEPATH'
      Size = 1000
    end
  end
  object CompOrgFrmQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from ORGFORMS')
    Left = 110
    Top = 111
    object CompOrgFrmQryID: TIntegerField
      FieldName = 'ID'
    end
    object CompOrgFrmQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object CompOrgFrmQryNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object CompOrgFrmQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
    end
    object CompOrgFrmQryFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 250
    end
    object CompOrgFrmQrySHORTIDENT: TStringField
      FieldName = 'SHORTIDENT'
      Size = 10
    end
    object CompOrgFrmQryDISABLED: TIntegerField
      FieldName = 'DISABLED'
    end
  end
  object CompOrgFrmSrc: TDataSource
    DataSet = CompOrgFrmQry
    Left = 110
    Top = 160
  end
  object NaturObjQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        '  Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, C.ID_PARE' +
        'NT,C.ID_MAIN_PARENT, C.ID_MAIN_CITY, C.ID_ADMIN_UNIT_SUB, C.SHOW' +
        'WEB, ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE ,C.AMEMO,'
      ' CASE When ( C.id > 0  ) then'
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = ' +
        'Languages.id and CITY_ADM_UNIT_lng.id_city_adm_unit = C.ID'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNIT_lng.id_lng is null )'
      '    else ('
      '      select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEM' +
        'S_TYPE_LNG.id_lng = Languages.id'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TY' +
        'PE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CI' +
        'TY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_I' +
        'TEMS_TYPE.id_parent_fortree'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNT_ITEMS_TYPE_LNG.id_lng is null )'
      '    END LNGNOTFOUND,'
      
        ' ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_UNI' +
        'T_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = C.ID ) LNGCHANG' +
        'E,'
      
        ' ( Select FIRST 1 NAME FROM CITY_PATH_PROC( C.ID , null, 0,448 )' +
        ' ) NAMEPATH'
      ''
      'from CITY_ADM_UNIT C'
      'left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id'
      
        'where ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  = 3 )  and ( C.ID' +
        '_Country = :COUNTRYID )'
      '')
    Left = 1144
    Top = 384
    object NaturObjQryID: TIntegerField
      FieldName = 'ID'
    end
    object NaturObjQryID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object NaturObjQryNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
    object NaturObjQryID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
    end
    object NaturObjQryID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
    end
    object NaturObjQryID_MAIN_PARENT: TIntegerField
      FieldName = 'ID_MAIN_PARENT'
    end
    object NaturObjQryID_MAIN_CITY: TIntegerField
      FieldName = 'ID_MAIN_CITY'
    end
    object NaturObjQryID_ADMIN_UNIT_SUB: TIntegerField
      FieldName = 'ID_ADMIN_UNIT_SUB'
    end
    object NaturObjQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
    object NaturObjQryID_CITY_ADM_UNT_ITEMS_TYPE: TIntegerField
      FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
    end
    object NaturObjQryAMEMO: TMemoField
      FieldName = 'AMEMO'
      BlobType = ftMemo
    end
    object NaturObjQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object NaturObjQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object NaturObjQryNAMEPATH: TStringField
      FieldName = 'NAMEPATH'
      Size = 1000
    end
  end
  object NaturObjSrc: TDataSource
    DataSet = NaturObjQry
    Left = 1144
    Top = 432
  end
  object TypeNotesQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * From TypeNote')
    Left = 30
    Top = 224
    object TypeNotesQryID: TIntegerField
      FieldName = 'ID'
    end
    object TypeNotesQryNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object TypeNotesQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
    end
    object TypeNotesQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object TypeNotesSrc: TDataSource
    DataSet = TypeNotesQry
    Left = 30
    Top = 272
  end
  object TypeDocumQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select * from Comp_TypeDocum')
    Left = 116
    Top = 223
    object TypeDocumQryID: TIntegerField
      FieldName = 'ID'
    end
    object TypeDocumQryNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object TypeDocumQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object ExpandNameQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select RoomExpandNames.*,'
      '   ( select Count(Languages.ID) from Languages'
      
        '  left join RoomExpandNames_lng on RoomExpandNames_lng.id_lng = ' +
        'Languages.id and RoomExpandNames_lng.id_roomexpandnames = RoomEx' +
        'pandNames.expandnameid'
      
        '  where Languages.active_translate is not null and RoomExpandNam' +
        'es_lng.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( RoomExpandNames_lng.change_expandname ) from Roo' +
        'mExpandNames_lng where RoomExpandNames_lng.id_roomexpandnames = ' +
        'RoomExpandNames.expandnameid ) LNGCHANGE,'
      
        '  ( select sum( RoomExpandNames_lng.CHANGE_EXTNAME ) from RoomEx' +
        'pandNames_lng where RoomExpandNames_lng.id_roomexpandnames = Roo' +
        'mExpandNames.expandnameid ) LNGCHANGE_EX'
      ' from RoomExpandNames'
      '')
    Left = 295
    Top = 487
    object ExpandNameQryEXPANDNAMEID: TIntegerField
      FieldName = 'EXPANDNAMEID'
    end
    object ExpandNameQryEXPANDNAME: TStringField
      FieldName = 'EXPANDNAME'
      Size = 50
    end
    object ExpandNameQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object ExpandNameQryEXTNAME: TStringField
      FieldName = 'EXTNAME'
    end
    object ExpandNameQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object ExpandNameQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object ExpandNameQryLNGCHANGE_EX: TLargeintField
      FieldName = 'LNGCHANGE_EX'
    end
  end
  object ExpandNameSrc: TDataSource
    DataSet = ExpandNameQry
    Left = 296
    Top = 536
  end
  object ResortQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        '  Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, C.ID_PARE' +
        'NT,C.ID_MAIN_PARENT, C.ID_MAIN_CITY, C.ID_ADMIN_UNIT_SUB, C.SHOW' +
        'WEB, ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE ,C.AMEMO,'
      ' CASE When ( C.id > 0  ) then'
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = ' +
        'Languages.id and CITY_ADM_UNIT_lng.id_city_adm_unit = C.ID'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNIT_lng.id_lng is null )'
      '    else ('
      '      select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEM' +
        'S_TYPE_LNG.id_lng = Languages.id'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TY' +
        'PE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CI' +
        'TY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_I' +
        'TEMS_TYPE.id_parent_fortree'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNT_ITEMS_TYPE_LNG.id_lng is null )'
      '    END LNGNOTFOUND,'
      
        ' ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_UNI' +
        'T_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = C.ID ) LNGCHANG' +
        'E,'
      
        ' ( Select FIRST 1 NAME FROM CITY_PATH_PROC( C.ID , null, 0,448 )' +
        ' ) NAMEPATH'
      ''
      'from CITY_ADM_UNIT C'
      'left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id'
      
        'where ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  = 2 )  and ( C.ID' +
        '_Country = :COUNTRYID )')
    Left = 904
    Top = 320
    object ResortQryID: TIntegerField
      FieldName = 'ID'
    end
    object ResortQryID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object ResortQryNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
    object ResortQryID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
    end
    object ResortQryID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
    end
    object ResortQryID_MAIN_PARENT: TIntegerField
      FieldName = 'ID_MAIN_PARENT'
    end
    object ResortQryID_MAIN_CITY: TIntegerField
      FieldName = 'ID_MAIN_CITY'
    end
    object ResortQryID_ADMIN_UNIT_SUB: TIntegerField
      FieldName = 'ID_ADMIN_UNIT_SUB'
    end
    object ResortQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
    object ResortQryID_CITY_ADM_UNT_ITEMS_TYPE: TIntegerField
      FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
    end
    object ResortQryAMEMO: TMemoField
      FieldName = 'AMEMO'
      BlobType = ftMemo
    end
    object ResortQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object ResortQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object ResortQryNAMEPATH: TStringField
      FieldName = 'NAMEPATH'
      Size = 1000
    end
  end
  object ResortSrc: TDataSource
    DataSet = ResortQry
    Left = 904
    Top = 371
  end
  object COUNTRIES_TYPE_INFO: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '  select COUNTRIES_TYPE_INFO.*,'
      '  '
      '  ( select Count(Languages.ID) from Languages'
      
        '  left join COUNTRIES_TYPE_INFO_lng on COUNTRIES_TYPE_INFO_lng.i' +
        'd_lng = Languages.id and COUNTRIES_TYPE_INFO_lng.id_countries_ty' +
        'pe_info =  COUNTRIES_TYPE_INFO.id'
      
        '  where Languages.active_translate is not null and COUNTRIES_TYP' +
        'E_INFO_lng.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( COUNTRIES_TYPE_INFO_lng.change_name ) from COUNT' +
        'RIES_TYPE_INFO_lng where COUNTRIES_TYPE_INFO_lng.id_countries_ty' +
        'pe_info = COUNTRIES_TYPE_INFO.id ) LNGCHANGE'
      ''
      '  from COUNTRIES_TYPE_INFO')
    Left = 1280
    Top = 128
    object COUNTRIES_TYPE_INFOID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRIES_TYPE_INFO"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object COUNTRIES_TYPE_INFONAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES_TYPE_INFO"."NAME"'
      Size = 200
    end
    object COUNTRIES_TYPE_INFOTABLE_IND: TIntegerField
      FieldName = 'TABLE_IND'
      Origin = '"COUNTRIES_TYPE_INFO"."TABLE_IND"'
    end
    object COUNTRIES_TYPE_INFOLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object COUNTRIES_TYPE_INFOLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object COUNTRIES_TYPE_INFOSrc: TDataSource
    DataSet = COUNTRIES_TYPE_INFO
    Left = 1280
    Top = 176
  end
  object KINDSTREET: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '  select KINDSTREET.*,'
      '  ( select Count(Languages.ID) from Languages'
      
        '  left join KINDSTREET_lng on KINDSTREET_lng.id_lng = Languages.' +
        'id and KINDSTREET_lng.id_kindstreet =  KINDSTREET.id'
      
        '  where Languages.active_translate is not null and KINDSTREET_ln' +
        'g.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( KINDSTREET_lng.change_name ) from KINDSTREET_lng' +
        ' where KINDSTREET_lng.id_kindstreet = KINDSTREET.id ) LNGCHANGE'
      ''
      '  from KINDSTREET')
    Left = 416
    Top = 528
    object KINDSTREETID: TIntegerField
      FieldName = 'ID'
    end
    object KINDSTREETNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object KINDSTREETAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object KINDSTREETLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object KINDSTREETLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
  end
  object KINDSTREETSrc: TDataSource
    DataSet = KINDSTREET
    Left = 416
    Top = 576
  end
  object COMP_CONTRACTS_KINDQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from COMP_CONTRACTS_KIND')
    Left = 639
    Top = 511
    object COMP_CONTRACTS_KINDQryID: TIntegerField
      FieldName = 'ID'
    end
    object COMP_CONTRACTS_KINDQryNAME: TStringField
      FieldName = 'NAME'
      Size = 300
    end
    object COMP_CONTRACTS_KINDQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 100
    end
    object COMP_CONTRACTS_KINDQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object COMP_CONTRACTS_KINDQryTEMPLATS: TMemoField
      FieldName = 'TEMPLATS'
      BlobType = ftMemo
    end
    object COMP_CONTRACTS_KINDQryDAYCOUNT: TIntegerField
      FieldName = 'DAYCOUNT'
    end
    object COMP_CONTRACTS_KINDQryTOURID: TIntegerField
      FieldName = 'TOURID'
    end
    object COMP_CONTRACTS_KINDQryGROUPID: TIntegerField
      FieldName = 'GROUPID'
    end
  end
  object COMP_CONTRACTS_KINDSrc: TDataSource
    DataSet = COMP_CONTRACTS_KINDQry
    Left = 640
    Top = 560
  end
  object TypeDocumSrc: TDataSource
    DataSet = TypeDocumQry
    Left = 118
    Top = 272
  end
  object TaxSystemQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from TaxSystem')
    Left = 536
    Top = 528
    object TaxSystemQryTAXSYSTEMID: TIntegerField
      FieldName = 'TAXSYSTEMID'
    end
    object TaxSystemQryTAXNAME: TStringField
      FieldName = 'TAXNAME'
      Size = 100
    end
    object TaxSystemQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object TaxSystemQrySINGLETAX: TStringField
      FieldName = 'SINGLETAX'
      Size = 1
    end
    object TaxSystemQryCalcIncomTax: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcIncomTax'
      Size = 30
      Calculated = True
    end
  end
  object TaxSystemSrc: TDataSource
    DataSet = TaxSystemQry
    Left = 536
    Top = 576
  end
  object TaxSystemDetailsQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    OnCalcFields = TaxSystemDetailsQryCalcFields
    DataSource = TaxSystemSrc
    Parameters = <
      item
        Name = 'TAXSYSTEMID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * from TaxSystemDetails where TAXSYSTEMID = :TAXSYSTEMID'
      '')
    Left = 640
    Top = 616
    object TaxSystemDetailsQryTAXSYSTEMID: TIntegerField
      FieldName = 'TAXSYSTEMID'
    end
    object TaxSystemDetailsQryTAXDETAILID: TIntegerField
      FieldName = 'TAXDETAILID'
    end
    object TaxSystemDetailsQryINCOMETAXABS: TFloatField
      FieldName = 'INCOMETAXABS'
    end
    object TaxSystemDetailsQryINCOMETAXVAL: TFloatField
      FieldName = 'INCOMETAXVAL'
    end
    object TaxSystemDetailsQryPAYER: TSmallintField
      FieldName = 'PAYER'
    end
    object TaxSystemDetailsQryPDVSUM: TFloatField
      FieldName = 'PDVSUM'
    end
    object TaxSystemDetailsQryFROMDATE: TDateTimeField
      FieldName = 'FROMDATE'
    end
    object TaxSystemDetailsQryTODATE: TDateTimeField
      FieldName = 'TODATE'
    end
    object TaxSystemDetailsQryCalcPayerTAX: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPayerTAX'
      Size = 50
      Calculated = True
    end
  end
  object TaxSystemDetailsSrc: TDataSource
    DataSet = TaxSystemDetailsQry
    Left = 640
    Top = 664
  end
  object CurrencyMainQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select *  from Currency where ( CurrencyId = 8 ) or ( CurrencyId' +
        ' = 37 ) or ( CurrencyId = 75 )')
    Left = 536
    Top = 431
    object IntegerField1: TIntegerField
      FieldName = 'CURRENCYID'
    end
    object StringField1: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'CURRENCYNAME'
      Size = 30
    end
    object StringField2: TStringField
      Alignment = taCenter
      DisplayLabel = #1057#1082#1086#1088#1086#1095'.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object StringField3: TStringField
      Alignment = taCenter
      DisplayLabel = #1050#1086#1076
      FieldName = 'CURRENCYCODE'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'PREFERRATE'
      Size = 1
    end
    object StringField5: TStringField
      FieldName = 'INTERESTRATE'
      Size = 1
    end
    object StringField6: TStringField
      FieldName = 'ISUSED'
      Size = 1
    end
    object StringField7: TStringField
      DisplayLabel = #1056#1086#1079#1084'. '#1084#1086#1085#1077#1090#1072
      FieldName = 'COINS'
      Size = 15
    end
    object FloatField1: TFloatField
      FieldName = 'CURRENTRATE'
      DisplayFormat = '0.0000'
    end
    object IntegerField2: TIntegerField
      FieldName = 'RATEZOOM'
    end
    object DateTimeField1: TDateTimeField
      Alignment = taCenter
      FieldName = 'LASTDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object MemoField1: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object IntegerField3: TIntegerField
      FieldName = 'CURRCATEG'
    end
    object StringField8: TStringField
      FieldName = 'CURRENCYNAMEBY'
      Size = 35
    end
    object IntegerField4: TIntegerField
      FieldName = 'ORDERPRIORITY'
    end
    object IntegerField5: TIntegerField
      FieldName = 'ADDMANID'
    end
  end
  object CurrencyMainSrc: TDataSource
    DataSet = CurrencyMainQry
    Left = 539
    Top = 477
  end
  object SelCompActionQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from COMPACTIONS')
    Left = 415
    Top = 624
    object SelCompActionQryID: TIntegerField
      FieldName = 'ID'
    end
    object SelCompActionQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object SelCompActionQryNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object SelCompActionQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 10
    end
  end
  object SelCompActionSrc: TDataSource
    DataSet = SelCompActionQry
    Left = 416
    Top = 672
  end
  object ServGroupQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select ServGroups.*,'
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join ServGroups_lng on ServGroups_lng.id_lng = Languages.' +
        'id and ServGroups_lng.id_servgroups = ServGroups.servicegroupid'
      
        '  where Languages.active_translate is not null and ServGroups_ln' +
        'g.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( ServGroups_lng.change_servicegroupname ) from Se' +
        'rvGroups_lng where ServGroups_lng.id_servgroups = ServGroups.ser' +
        'vicegroupid ) LNGCHANGE'
      ''
      ' from ServGroups'
      '')
    Left = 30
    Top = 320
    object ServGroupQrySERVICEGROUPID: TIntegerField
      FieldName = 'SERVICEGROUPID'
    end
    object ServGroupQrySERVICEGROUPNAME: TStringField
      FieldName = 'SERVICEGROUPNAME'
      Size = 190
    end
    object ServGroupQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object ServGroupQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object ServGroupQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
  end
  object ServGroupSrc: TDataSource
    DataSet = ServGroupQry
    Left = 30
    Top = 368
  end
  object ServicesQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = ServGroupSrc
    Parameters = <
      item
        Name = 'SERVICEGROUPID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      '  select Services.*,'
      '   ( select Count(Languages.ID) from Languages'
      
        '  left join Services_LNG on Services_LNG.id_lng = Languages.id a' +
        'nd Services_LNG.id_services =  Services.serviceid'
      
        '  where Languages.active_translate is not null and Services_LNG.' +
        'id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( Services_LNG.change_name ) from Services_LNG whe' +
        're Services_LNG.id_services = Services.serviceid ) LNGCHANGE'
      ''
      '  from Services where ServGroupId = :SERVICEGROUPID'
      '')
    Left = 32
    Top = 416
    object ServicesQrySERVICEID: TIntegerField
      FieldName = 'SERVICEID'
    end
    object ServicesQryNAME: TStringField
      FieldName = 'NAME'
      Size = 190
    end
    object ServicesQryHAVEVALUE: TStringField
      FieldName = 'HAVEVALUE'
      Size = 1
    end
    object ServicesQryMEASUREUNIT: TStringField
      FieldName = 'MEASUREUNIT'
      Size = 5
    end
    object ServicesQryLARGEICON: TBlobField
      FieldName = 'LARGEICON'
    end
    object ServicesQrySMALLICON: TBlobField
      FieldName = 'SMALLICON'
    end
    object ServicesQryINHOTEL: TStringField
      FieldName = 'INHOTEL'
      Size = 1
    end
    object ServicesQryINBUILD: TStringField
      FieldName = 'INBUILD'
      Size = 1
    end
    object ServicesQryINROOM: TStringField
      FieldName = 'INROOM'
      Size = 1
    end
    object ServicesQrySERVGROUPID: TIntegerField
      FieldName = 'SERVGROUPID'
    end
    object ServicesQryINFO: TStringField
      FieldName = 'INFO'
      Size = 10
    end
    object ServicesQryINAUTO: TStringField
      FieldName = 'INAUTO'
      Size = 1
    end
    object ServicesQryINTRAIN: TStringField
      FieldName = 'INTRAIN'
      Size = 1
    end
    object ServicesQryINSHIP: TStringField
      FieldName = 'INSHIP'
      Size = 1
    end
    object ServicesQryINPLANE: TStringField
      FieldName = 'INPLANE'
      Size = 1
    end
    object ServicesQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object ServicesQryHAVECOST: TStringField
      FieldName = 'HAVECOST'
      Size = 1
    end
    object ServicesQryINFOOD: TStringField
      FieldName = 'INFOOD'
      Size = 1
    end
    object ServicesQryINRECRE: TStringField
      FieldName = 'INRECRE'
      Size = 1
    end
    object ServicesQryINRESORT: TStringField
      FieldName = 'INRESORT'
      Size = 1
    end
    object ServicesQryID_UNIT_MEASUR: TIntegerField
      FieldName = 'ID_UNIT_MEASUR'
    end
    object ServicesQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object ServicesQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
  end
  object ServicesSrc: TDataSource
    DataSet = ServicesQry
    Left = 30
    Top = 464
  end
  object SERVICESKINDQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from SERVICESKIND')
    Left = 760
    Top = 8
    object SERVICESKINDQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"SERVICESKIND"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SERVICESKINDQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"SERVICESKIND"."NAME"'
      Size = 100
    end
  end
  object SERVICESKINDSrc: TDataSource
    DataSet = SERVICESKINDQry
    Left = 760
    Top = 48
  end
  object HOTELCLASSQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select  HOTELCLASS.* ,'
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Languages.' +
        'id and HOTELCLASS_lng.id_hotelclass = HOTELCLASS.id'
      
        '  where Languages.active_translate is not null and HOTELCLASS_ln' +
        'g.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( HOTELCLASS_lng.change_name ) from HOTELCLASS_lng' +
        ' where HOTELCLASS_lng.id_hotelclass = HOTELCLASS.id ) LNGCHANGE'
      ''
      ' from HOTELCLASS')
    Left = 763
    Top = 119
    object HOTELCLASSQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"HOTELLCLASS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object HOTELCLASSQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"HOTELLCLASS"."NAME"'
      Size = 100
    end
    object HOTELCLASSQryCTYPE: TIntegerField
      FieldName = 'CTYPE'
      Origin = '"HOTELLCLASS"."CTYPE"'
    end
    object HOTELCLASSQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object HOTELCLASSQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object HOTELCLASSQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object HOTELCLASSSrc: TDataSource
    DataSet = HOTELCLASSQry
    Left = 763
    Top = 169
  end
  object SERVICE_TYPEQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ' select SERVICE_TYPE.*,'
      ''
      '  ( select Count(Languages.ID) from Languages'
      
        '  left join SERVICE_TYPE_LNG on SERVICE_TYPE_LNG.id_lng = Langua' +
        'ges.id and SERVICE_TYPE_LNG.id_service_type =  SERVICE_TYPE.id'
      
        '  where Languages.active_translate is not null and SERVICE_TYPE_' +
        'LNG.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( SERVICE_TYPE_LNG.change_name ) from SERVICE_TYPE' +
        '_LNG where SERVICE_TYPE_LNG.id_service_type = SERVICE_TYPE.id ) ' +
        'LNGCHANGE'
      ''
      '  from SERVICE_TYPE'
      '')
    Left = 118
    Top = 424
    object SERVICE_TYPEQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"SERVICE_TYPE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SERVICE_TYPEQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"SERVICE_TYPE"."NAME"'
      Size = 100
    end
    object SERVICE_TYPEQryICON: TBlobField
      FieldName = 'ICON'
      Origin = '"SERVICE_TYPE"."ICON"'
      ProviderFlags = [pfInUpdate]
    end
    object SERVICE_TYPEQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object SERVICE_TYPEQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object SERVICE_TYPESrc: TDataSource
    DataSet = SERVICE_TYPEQry
    Left = 118
    Top = 472
  end
  object CITYKINDQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CITYKIND')
    Left = 760
    Top = 224
    object CITYKINDQryID: TIntegerField
      FieldName = 'ID'
    end
    object CITYKINDQryNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object CITYKINDQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object CITYKINDSrc: TDataSource
    DataSet = CITYKINDQry
    Left = 760
    Top = 272
  end
  object BedTypeSrc: TDataSource
    DataSet = BedTypeQry
    Left = 32
    Top = 160
  end
  object DriveEuroClassQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DRIVEEUROCLASS')
    Left = 296
    Top = 287
    object DriveEuroClassQryID: TIntegerField
      FieldName = 'ID'
    end
    object DriveEuroClassQryNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object DriveEuroClassQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object DriveEuroClassSrc: TDataSource
    DataSet = DriveEuroClassQry
    Left = 299
    Top = 341
  end
  object InfraSrc: TDataSource
    DataSet = InfraQry
    Left = 1024
    Top = 368
  end
  object Admin_unitQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = CITY_ADM_UNT_ITEMS_TYPESrc
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select admin_unit.*,'
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join admin_unit_lng on admin_unit_lng.id_lng = Languages.' +
        'id and admin_unit_lng.id_admin_unit = admin_unit.id'
      
        '  where Languages.active_translate is not null and admin_unit_ln' +
        'g.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( admin_unit_lng.change_name ) from admin_unit_lng' +
        ' where admin_unit_lng.id_admin_unit = admin_unit.id ) LNGCHANGE'
      ''
      ' from admin_unit  where ID_CITY_ADM_UNT_ITEMS_TYPE = :ID'
      '')
    Left = 1032
    object Admin_unitQryID: TIntegerField
      FieldName = 'ID'
    end
    object Admin_unitQryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 200
    end
    object Admin_unitQryNAMESHORT: TStringField
      FieldName = 'NAMESHORT'
    end
    object Admin_unitQryID_CITY_ADM_UNT_ITEMS_TYPE: TIntegerField
      FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
    end
    object Admin_unitQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object Admin_unitQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object Admin_unitQryTYPESHOW: TIntegerField
      FieldName = 'TYPESHOW'
    end
  end
  object COUNTRY_TEMPL_ADM_UNITQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'CountryId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        ' select COUNTRY_TEMPL_ADM_UNIT.*, admin_unit.name,admin_unit.id_' +
        'city_adm_unt_items_type,'
      ''
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join admin_unit_lng on admin_unit_lng.id_lng = Languages.' +
        'id and admin_unit_lng.id_admin_unit = COUNTRY_TEMPL_ADM_UNIT.id_' +
        'admin_unit'
      
        '  where Languages.active_translate is not null and admin_unit_ln' +
        'g.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( admin_unit_lng.change_name ) from admin_unit_lng' +
        ' where admin_unit_lng.id_admin_unit = COUNTRY_TEMPL_ADM_UNIT.id_' +
        'admin_unit ) LNGCHANGE'
      ''
      ' from COUNTRY_TEMPL_ADM_UNIT'
      
        ' left join admin_unit on COUNTRY_TEMPL_ADM_UNIT.id_admin_unit = ' +
        'admin_unit.id'
      ' where ID_COUNTRY = :CountryId')
    Left = 1152
    object COUNTRY_TEMPL_ADM_UNITQryID: TIntegerField
      FieldName = 'ID'
    end
    object COUNTRY_TEMPL_ADM_UNITQryID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object COUNTRY_TEMPL_ADM_UNITQryID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
    end
    object COUNTRY_TEMPL_ADM_UNITQryID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
    end
    object COUNTRY_TEMPL_ADM_UNITQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object COUNTRY_TEMPL_ADM_UNITQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object COUNTRY_TEMPL_ADM_UNITQryNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object COUNTRY_TEMPL_ADM_UNITQryID_CITY_ADM_UNT_ITEMS_TYPE: TIntegerField
      FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
    end
  end
  object Admin_unitSrc: TDataSource
    DataSet = Admin_unitQry
    Left = 1032
    Top = 48
  end
  object COUNTRY_TEMPL_ADM_UNITSrc: TDataSource
    DataSet = COUNTRY_TEMPL_ADM_UNITQry
    Left = 1152
    Top = 56
  end
  object City_Admin_UnitRegionQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        ' Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, C.ID_PAREN' +
        'T,C.ID_MAIN_PARENT, C.ID_MAIN_CITY, C.ID_ADMIN_UNIT_SUB, C.SHOWW' +
        'EB, ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE,ADMIN_UNIT.name ADMIN_' +
        'UNIT_NAME,'
      ' MC.NAME MAIN_CITY,'
      ' CASE When ( C.id > 0  ) then'
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = ' +
        'Languages.id and CITY_ADM_UNIT_lng.id_city_adm_unit = C.ID'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNIT_lng.id_lng is null )'
      '    else ('
      '      select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEM' +
        'S_TYPE_LNG.id_lng = Languages.id'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TY' +
        'PE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CI' +
        'TY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_I' +
        'TEMS_TYPE.id_parent_fortree'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNT_ITEMS_TYPE_LNG.id_lng is null )'
      '    END LNGNOTFOUND,'
      
        ' ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_UNI' +
        'T_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = C.ID ) LNGCHANG' +
        'E'
      ''
      ''
      'from CITY_ADM_UNIT C'
      'left join CITY_ADM_UNIT MC on C.ID_MAIN_CITY = MC.id'
      'left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id'
      
        'where ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE = 1 and MC.id_countr' +
        'y = :COUNTRYID')
    Left = 896
    Top = 224
    object City_Admin_UnitRegionQryID: TIntegerField
      FieldName = 'ID'
    end
    object City_Admin_UnitRegionQryID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object City_Admin_UnitRegionQryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 250
    end
    object City_Admin_UnitRegionQryID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
      Required = True
    end
    object City_Admin_UnitRegionQryID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
    end
    object City_Admin_UnitRegionQryID_MAIN_CITY: TIntegerField
      FieldName = 'ID_MAIN_CITY'
    end
    object City_Admin_UnitRegionQryID_MAIN_PARENT: TIntegerField
      FieldName = 'ID_MAIN_PARENT'
    end
    object City_Admin_UnitRegionQryID_ADMIN_UNIT_SUB: TIntegerField
      FieldName = 'ID_ADMIN_UNIT_SUB'
    end
    object City_Admin_UnitRegionQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
    object City_Admin_UnitRegionQryID_CITY_ADM_UNT_ITEMS_TYPE: TIntegerField
      FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
    end
    object City_Admin_UnitRegionQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object City_Admin_UnitRegionQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object City_Admin_UnitRegionQryMAIN_CITY: TStringField
      FieldName = 'MAIN_CITY'
      Size = 250
    end
    object City_Admin_UnitRegionQryADMIN_UNIT_NAME: TStringField
      FieldName = 'ADMIN_UNIT_NAME'
      Size = 200
    end
  end
  object City_Admin_UnitRegionSrc: TDataSource
    DataSet = City_Admin_UnitRegionQry
    Left = 896
    Top = 264
  end
  object City_Admin_Unit: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    OnCalcFields = BrCityQry_CalcFields
    DataSource = City_Admin_UnitRegionSrc
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, C.ID_PARENT' +
        ',C.ID_MAIN_PARENT, C.ID_MAIN_CITY, C.ID_ADMIN_UNIT_SUB, C.SHOWWE' +
        'B, ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE ,C.AMEMO, ADMIN_UNIT.na' +
        'me ADMIN_UNIT_NAME,'
      ' CASE When ( C.id > 0  ) then'
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = ' +
        'Languages.id and CITY_ADM_UNIT_lng.id_city_adm_unit = C.ID'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNIT_lng.id_lng is null )'
      '    else ('
      '      select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEM' +
        'S_TYPE_LNG.id_lng = Languages.id'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TY' +
        'PE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CI' +
        'TY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_I' +
        'TEMS_TYPE.id_parent_fortree'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNT_ITEMS_TYPE_LNG.id_lng is null )'
      '    END LNGNOTFOUND,'
      
        ' ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_UNI' +
        'T_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = C.ID ) LNGCHANG' +
        'E'
      ''
      'from CITY_ADM_UNIT C'
      'left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id'
      
        'where ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  = 0 )  and ( C.ID' +
        '_MAIN_PARENT = :ID ) ')
    Left = 1021
    Top = 224
    object City_Admin_UnitID: TIntegerField
      FieldName = 'ID'
    end
    object City_Admin_UnitID_COUNTRY: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object City_Admin_UnitNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 250
    end
    object City_Admin_UnitID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
      Required = True
    end
    object City_Admin_UnitID_PARENT: TIntegerField
      FieldName = 'ID_PARENT'
    end
    object City_Admin_UnitID_MAIN_CITY: TIntegerField
      FieldName = 'ID_MAIN_CITY'
    end
    object City_Admin_UnitID_MAIN_PARENT: TIntegerField
      FieldName = 'ID_MAIN_PARENT'
    end
    object City_Admin_UnitID_ADMIN_UNIT_SUB: TIntegerField
      FieldName = 'ID_ADMIN_UNIT_SUB'
    end
    object City_Admin_UnitSHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
    object City_Admin_UnitID_CITY_ADM_UNT_ITEMS_TYPE: TIntegerField
      FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
    end
    object City_Admin_UnitAMEMO: TMemoField
      FieldName = 'AMEMO'
      BlobType = ftMemo
    end
    object City_Admin_UnitLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object City_Admin_UnitLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object City_Admin_UnitADMIN_UNIT_NAME: TStringField
      FieldName = 'ADMIN_UNIT_NAME'
      Size = 200
    end
  end
  object City_Admin_UnitSrc: TDataSource
    DataSet = City_Admin_Unit
    Left = 1023
    Top = 267
  end
  object ADMIN_UNIT_SUBQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = Admin_unitSrc
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select ADMIN_UNIT_SUB.*,'
      ''
      '  ( select Count(Languages.ID) from Languages'
      
        '    left join ADMIN_UNIT_SUB_lng on ADMIN_UNIT_SUB_lng.id_lng = ' +
        'Languages.id and ADMIN_UNIT_SUB_lng.id_admin_unit_sub = ADMIN_UN' +
        'IT_SUB.id'
      
        '    where Languages.active_translate is not null and ADMIN_UNIT_' +
        'SUB_lng.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( ADMIN_UNIT_SUB_lng.change_name ) from ADMIN_UNIT' +
        '_SUB_lng where ADMIN_UNIT_SUB_lng.id_admin_unit_sub = ADMIN_UNIT' +
        '_SUB.id ) LNGCHANGE'
      ''
      ' from ADMIN_UNIT_SUB where ID_ADMIN_UNIT = :ID')
    Left = 896
    Top = 120
    object IntegerField6: TIntegerField
      FieldName = 'ID'
    end
    object ADMIN_UNIT_SUBQryID_ADMIN_UNIT: TIntegerField
      FieldName = 'ID_ADMIN_UNIT'
    end
    object StringField9: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object ADMIN_UNIT_SUBQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object ADMIN_UNIT_SUBQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object ADMIN_UNIT_SUBQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
  end
  object ADMIN_UNIT_SUBSrc: TDataSource
    DataSet = ADMIN_UNIT_SUBQry
    Left = 896
    Top = 168
  end
  object CITY_ADM_UNT_ITEMS_TYPEQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from CITY_ADM_UNT_ITEMS_TYPE')
    Left = 904
    Top = 8
    object CITY_ADM_UNT_ITEMS_TYPEQryID: TIntegerField
      FieldName = 'ID'
    end
    object CITY_ADM_UNT_ITEMS_TYPEQryNAME: TStringField
      FieldName = 'NAME'
      Size = 250
    end
    object CITY_ADM_UNT_ITEMS_TYPEQryID_PARENT_FORTREE: TIntegerField
      FieldName = 'ID_PARENT_FORTREE'
    end
    object CITY_ADM_UNT_ITEMS_TYPEQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object CITY_ADM_UNT_ITEMS_TYPESrc: TDataSource
    DataSet = CITY_ADM_UNT_ITEMS_TYPEQry
    Left = 904
    Top = 56
  end
  object CITY_ADM_UNIT_INFOQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = City_Admin_UnitSrc
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select CITY_ADM_UNIT_INFO.*, CITY_ADM_UNIT_TYPE_INFO.NAME from C' +
        'ITY_ADM_UNIT_INFO'
      
        'left join CITY_ADM_UNIT_TYPE_INFO on CITY_ADM_UNIT_TYPE_INFO.id ' +
        '= CITY_ADM_UNIT_INFO.id_city_adm_unit_type_info'
      'where ID_CITY_ADM_UNIT = :ID')
    Left = 1144
    Top = 280
    object CITY_ADM_UNIT_INFOQryID: TIntegerField
      FieldName = 'ID'
    end
    object CITY_ADM_UNIT_INFOQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
    object CITY_ADM_UNIT_INFOQryID_CITY_ADM_UNIT_TYPE_INFO: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT_TYPE_INFO'
    end
    object CITY_ADM_UNIT_INFOQryAVALUE: TStringField
      FieldName = 'AVALUE'
      Size = 300
    end
    object CITY_ADM_UNIT_INFOQryNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
  end
  object CITY_ADM_UNIT_INFOSrc: TDataSource
    DataSet = CITY_ADM_UNIT_INFOQry
    Left = 1144
    Top = 328
  end
  object CITY_ADM_UNIT_SUB_RELQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = City_Admin_UnitSrc
    Parameters = <
      item
        Name = 'ID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from CITY_ADM_UNIT_SUB_REL where ID_CITY_ADM_UNIT = :ID')
    Left = 1137
    Top = 175
  end
  object CITY_ADM_UNIT_SUB_RELSrc: TDataSource
    DataSet = CITY_ADM_UNIT_SUB_RELQry
    Left = 1137
    Top = 227
  end
  object City_Admin_UnitImgQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = City_Admin_UnitSrc
    Parameters = <
      item
        Name = 'ID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from CITY_ADM_UNIT_IMG where ID_CITY_ADM_UNIT = :ID ')
    Left = 1272
    Top = 280
    object City_Admin_UnitImgQryID: TIntegerField
      FieldName = 'ID'
    end
    object City_Admin_UnitImgQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
    object City_Admin_UnitImgQryFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 200
    end
    object City_Admin_UnitImgQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object City_Admin_UnitImgQryDESCRIPT: TMemoField
      FieldName = 'DESCRIPT'
      BlobType = ftMemo
    end
    object City_Admin_UnitImgQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
  end
  object City_Admin_UnitImgSrc: TDataSource
    DataSet = City_Admin_UnitImgQry
    Left = 1272
    Top = 328
  end
  object COMPANIES_PARAM_NAME: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' select COMPANIES_PARAM_NAME.*, COMPANIES_PARAM_KIND.name KINDNA' +
        'ME, COMPANIES_PARAM_KIND.aorder from COMPANIES_PARAM_NAME'
      
        ' left join COMPANIES_PARAM_KIND on COMPANIES_PARAM_NAME.atype = ' +
        'companies_param_KIND.id where COMPANIES_PARAM_NAME.atype >=0')
    Left = 760
    Top = 335
    object COMPANIES_PARAM_NAMEID: TIntegerField
      FieldName = 'ID'
    end
    object COMPANIES_PARAM_NAMENAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
    object COMPANIES_PARAM_NAMEDESCRIPT: TStringField
      FieldName = 'DESCRIPT'
      Size = 200
    end
    object COMPANIES_PARAM_NAMEATYPE: TIntegerField
      FieldName = 'ATYPE'
    end
    object COMPANIES_PARAM_NAMEKINDNAME: TStringField
      FieldName = 'KINDNAME'
      Size = 100
    end
    object COMPANIES_PARAM_NAMEAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object COMPANIES_PARAM_NAMESrc: TDataSource
    DataSet = COMPANIES_PARAM_NAME
    Left = 760
    Top = 376
  end
  object ExCityQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'CountryId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  distinct E.id_city_adm_unit ID, E.countryid ID_COUNTRY,'
      '  CASE'
      '   When ( E.id_city_adm_unit > 0  ) then Ci.Name'
      
        '   else ( select name from CITY_ADM_UNT_ITEMS_TYPE where id_pare' +
        'nt_fortree = E.id_city_adm_unit )'
      '  END CITYNAME,'
      '   CASE'
      
        '    When ( E.id_city_adm_unit > 0  ) then ( select NAME from CIT' +
        'Y_ADM_UNT_ITEMS_TYPE_LNG WHERE id_lng = 350 and E.id_city_adm_un' +
        'it = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type )'
      
        '    else ( select CITY_ADM_UNT_ITEMS_TYPE_LNG.NAME from CITY_ADM' +
        '_UNT_ITEMS_TYPE_LNG'
      
        '          left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEM' +
        'S_TYPE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type'
      
        '          where CITY_ADM_UNT_ITEMS_TYPE_LNG.id_lng = 350 and E.i' +
        'd_city_adm_unit = CITY_ADM_UNT_ITEMS_TYPE.id_parent_fortree )'
      '    END Name_Eng,'
      '    CASE When ( E.id_city_adm_unit > 0  ) then'
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = ' +
        'Languages.id and CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = E.id_city_' +
        'adm_unit'
      
        '     where Languages.active_translate is not null and CITY_ADM_U' +
        'NIT_lng.id_lng is null )'
      '    else ('
      '      select Count(Languages.ID) from Languages'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEM' +
        'S_TYPE_LNG.id_lng = Languages.id'
      
        '      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TY' +
        'PE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CI' +
        'TY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_I' +
        'TEMS_TYPE.id_parent_fortree'
      
        '      where Languages.active_translate is not null and CITY_ADM_' +
        'UNT_ITEMS_TYPE_LNG.id_lng is null )'
      '    END LNGNOTFOUND,'
      
        '   ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_U' +
        'NIT_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = E.id_city_adm' +
        '_unit ) LNGCHANGE,'
      ''
      
        '   ( Select FIRST 1 NAME FROM CITY_PATH_PROC( Ci.ID_PARENT , nul' +
        'l, 0,448 ) ) NAMEPATH'
      'from EXCURSION E'
      'left join CITY_ADM_UNIT Ci on Ci.Id = E.id_city_adm_unit'
      'left join Countries Co on Co.CountryId = Ci.id_country'
      'where E.CountryId = :CountryId')
    Left = 1248
    Top = 384
    object IntegerField7: TIntegerField
      FieldName = 'ID'
    end
    object IntegerField8: TIntegerField
      FieldName = 'ID_COUNTRY'
    end
    object ExCityQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object LargeintField1: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object StringField12: TStringField
      FieldName = 'NAMEPATH'
      Size = 1000
    end
    object ExCityQryCITYNAME: TStringField
      FieldName = 'CITYNAME'
      Size = 250
    end
    object ExCityQryNAME_ENG: TStringField
      FieldName = 'NAME_ENG'
      Size = 250
    end
  end
  object ExCitySrc: TDataSource
    DataSet = ExCityQry
    Left = 1249
    Top = 427
  end
  object COMPANIES_PARAM_KIND: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from COMPANIES_PARAM_KIND')
    Left = 760
    Top = 431
    object COMPANIES_PARAM_KINDID: TIntegerField
      FieldName = 'ID'
    end
    object COMPANIES_PARAM_KINDNAME: TStringField
      FieldName = 'NAME'
      Size = 100
    end
    object COMPANIES_PARAM_KINDAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object COMPANIES_PARAM_KINDSrc: TDataSource
    DataSet = COMPANIES_PARAM_KIND
    Left = 760
    Top = 472
  end
  object Comunication_TypeQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from COMUNICATION_TYPE')
    Left = 296
    Top = 592
    object Comunication_TypeQryID: TIntegerField
      FieldName = 'ID'
    end
    object Comunication_TypeQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object Comunication_TypeQryNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object Comunication_TypeQryICON: TBlobField
      FieldName = 'ICON'
      Required = True
    end
    object Comunication_TypeQryWEBLINK: TStringField
      FieldName = 'WEBLINK'
      Size = 500
    end
    object Comunication_TypeQryTEMPLATE: TStringField
      FieldName = 'TEMPLATE'
      Size = 100
    end
    object Comunication_TypeQryUSECODECOUNTRY: TIntegerField
      FieldName = 'USECODECOUNTRY'
    end
    object Comunication_TypeQryFORMAT_OUT: TStringField
      FieldName = 'FORMAT_OUT'
      Size = 100
    end
  end
  object Comunication_TypeSrc: TDataSource
    DataSet = Comunication_TypeQry
    Left = 296
    Top = 640
  end
  object PASSPORTKINDS: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from PASSPORTKINDS')
    Left = 904
    Top = 424
    object PASSPORTKINDSID: TIntegerField
      FieldName = 'ID'
    end
    object PASSPORTKINDSNAME: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object PASSPORTKINDSAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object PASSPORTKINDSSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 25
    end
    object PASSPORTKINDSLAT: TStringField
      FieldName = 'LAT'
      Size = 25
    end
    object PASSPORTKINDSLATNAME: TStringField
      FieldName = 'LATNAME'
      Size = 40
    end
    object PASSPORTKINDSVALIDYEARS: TIntegerField
      FieldName = 'VALIDYEARS'
    end
  end
  object PASSPORTKINDSSrc: TDataSource
    DataSet = PASSPORTKINDS
    Left = 904
    Top = 472
  end
  object STATUSDOC: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from  STATUSDOC')
    Left = 1032
    Top = 424
    object STATUSDOCID: TIntegerField
      FieldName = 'ID'
    end
    object STATUSDOCNAME: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object STATUSDOCAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object STATUSDOCSrc: TDataSource
    DataSet = STATUSDOC
    Left = 1032
    Top = 472
  end
  object TRIP_KIND: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from  TRIP_KIND')
    Left = 1032
    Top = 632
    object TRIP_KINDID: TIntegerField
      FieldName = 'ID'
    end
    object TRIP_KINDNAME: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object TRIP_KINDAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object TRIP_KINDSrc: TDataSource
    DataSet = TRIP_KIND
    Left = 1032
    Top = 680
  end
  object SPONSOR: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from  SPONSOR')
    Left = 1152
    Top = 488
    object SPONSORID: TIntegerField
      FieldName = 'ID'
    end
    object SPONSORNAME: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object SPONSORAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object SPONSORSrc: TDataSource
    DataSet = SPONSOR
    Left = 1152
    Top = 536
  end
  object PAYMENT_BYSPONSOR: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from PAYMENT_BYSPONSOR')
    Left = 1248
    Top = 480
    object IntegerField10: TIntegerField
      FieldName = 'ID'
    end
    object StringField10: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object IntegerField11: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object PAYMENT_BYSPONSORSrc: TDataSource
    DataSet = PAYMENT_BYSPONSOR
    Left = 1248
    Top = 528
  end
  object REPOSKIND: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from  REPOSKIND')
    Left = 1032
    Top = 528
    object REPOSKINDID: TIntegerField
      FieldName = 'ID'
    end
    object REPOSKINDNAME: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object REPOSKINDKIND: TIntegerField
      FieldName = 'KIND'
    end
    object REPOSKINDSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 25
    end
    object REPOSKINDVISIBLED: TIntegerField
      FieldName = 'VISIBLED'
    end
    object REPOSKINDAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object REPOSKINDSrc: TDataSource
    DataSet = REPOSKIND
    Left = 1032
    Top = 576
  end
  object DataSource1: TDataSource
    Left = 1248
    Top = 528
  end
  object VISADOCTYPEQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from VISADOCTYPE')
    Left = 1360
    Top = 480
    object IntegerField14: TIntegerField
      FieldName = 'ID'
    end
    object StringField13: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object VISADOCTYPEQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 25
    end
    object IntegerField15: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object VISADOCTYPESrc: TDataSource
    DataSet = VISADOCTYPEQry
    Left = 1360
    Top = 528
  end
  object DOCFORQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from DOCFOR')
    Left = 1360
    Top = 576
    object DOCFORQryID: TIntegerField
      FieldName = 'ID'
    end
    object DOCFORQryNAME: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object DOCFORQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object DOCFORSrc: TDataSource
    DataSet = DOCFORQry
    Left = 1360
    Top = 624
  end
  object CREDITCARDSQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select  * from CREDITCARDS')
    Left = 1248
    Top = 576
    object IntegerField16: TIntegerField
      FieldName = 'ID'
    end
    object StringField14: TStringField
      FieldName = 'NAME'
      Size = 75
    end
    object IntegerField17: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object CREDITCARDSSrc: TDataSource
    DataSet = CREDITCARDSQry
    Left = 1248
    Top = 624
  end
  object GridViewRepository: TcxGridViewRepository
    Left = 1400
    Top = 8
    object ViewUnitMeasurList: TcxGridDBTableView
      DataController.DataSource = UNIT_MEASURSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewUnitMeasurListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewUnitMeasurListNAME: TcxGridDBColumn
        Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 196
      end
      object ViewUnitMeasurListNAMES: TcxGridDBColumn
        Caption = 'Names'
        DataBinding.FieldName = 'ANAMES'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewUnitMeasurListSHORT: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 91
      end
    end
    object ViewLanguage: TcxGridDBTableView
      DataController.DataSource = LanguageSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewLanguageID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewLanguageCheck: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 30
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 30
      end
      object ViewLanguageNAME: TcxGridDBColumn
        Caption = #1052#1086#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 335
      end
      object ViewLanguageORIGINAL_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'ORIGINAL_NAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewReligion: TcxGridDBTableView
      DataController.DataSource = ReligionSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewReligionID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewReligionCheck: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 30
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 30
      end
      object ViewReligionNAME: TcxGridDBColumn
        Caption = #1056#1077#1083#1110#1075#1110#1103
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 302
      end
    end
    object ViewFormGovernmentList: TcxGridDBTableView
      DataController.DataSource = FORM_GOVERNMENTSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewFormGovernmentListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewFormGovernmentListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 334
      end
      object ViewFormGovernmentListNOTE: TcxGridDBColumn
        DataBinding.FieldName = 'NOTE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 152
      end
    end
    object ViewCountriesHolidays: TcxGridDBTableView
      DataController.DataSource = COUNTRIES_HOLIDAYSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCountriesHolidaysID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountriesHolidaysNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 360
      end
      object ViewCountriesHolidaysAMONTH: TcxGridDBColumn
        Tag = 100
        Caption = #1052#1110#1089#1103#1094#1100
        DataBinding.FieldName = 'AMONTH'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountriesHolidaysADAY: TcxGridDBColumn
        Tag = 100
        Caption = #1044#1077#1085#1100
        DataBinding.FieldName = 'ADAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountriesHolidaysADATE: TcxGridDBColumn
        Tag = -1
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'CalcDate'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 200
      end
      object ViewCountriesHolidaysCOUNTDAYS: TcxGridDBColumn
        Caption = #1050#1110#1083'. '#1076#1085#1110#1074
        DataBinding.FieldName = 'COUNTDAYS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewCountriesHolidaysID_COUNTRIES: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRIES'
        Visible = False
      end
      object ViewCountriesHolidaysTYPEDATE: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEDATE'
        Visible = False
      end
      object ViewCountriesHolidaysAVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'AVALUE'
        Visible = False
      end
      object ViewCountriesHolidaysNAMEBYRELIGION: TcxGridDBColumn
        DataBinding.FieldName = 'NAMEBYRELIGION'
        Visible = False
      end
    end
    object ViewCurrencyList: TcxGridDBTableView
      DataController.DataSource = CurrencySrc
      DataController.KeyFieldNames = 'CURRENCYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCurrencyListCURRENCYID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListCURRENCYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 59
      end
      object ViewCurrencyListCURRENCYCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYCODE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 37
      end
      object ViewCurrencyListPREFERRATE: TcxGridDBColumn
        DataBinding.FieldName = 'PREFERRATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListINTERESTRATE: TcxGridDBColumn
        DataBinding.FieldName = 'INTERESTRATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListISUSED: TcxGridDBColumn
        DataBinding.FieldName = 'ISUSED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListCOINS: TcxGridDBColumn
        DataBinding.FieldName = 'COINS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListCURRENTRATE: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENTRATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListRATEZOOM: TcxGridDBColumn
        DataBinding.FieldName = 'RATEZOOM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListLASTDATE: TcxGridDBColumn
        DataBinding.FieldName = 'LASTDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCurrencyListMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewPowerVoltFreqList: TcxGridDBTableView
      DataController.DataSource = POWER_VOLT_FREQSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewPowerVoltFreqListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPowerVoltFreqListTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ATYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPowerVoltFreqListAVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'VALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPowerVoltFreqListID_UNIT_MEASUR: TcxGridDBColumn
        DataBinding.FieldName = 'ID_UNIT_MEASUR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPowerVoltFreqListMEASURNAME: TcxGridDBColumn
        DataBinding.FieldName = 'MEASURNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 112
      end
    end
    object ViewTypePowerSocket: TcxGridDBTableView
      DataController.DataSource = TYPE_POW_SOCKETSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTypePowerSocketID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTypePowerSocketNAME: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 66
      end
      object ViewTypePowerSocketICON: TcxGridDBColumn
        Caption = #1042#1080#1075#1083#1103#1076
        DataBinding.FieldName = 'ICON'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TdxPNGImage'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 56
      end
    end
    object ViewTimeZone: TcxGridDBTableView
      DataController.DataSource = TIME_ZONESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTimeZoneID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTimeZoneCheck: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        MinWidth = 30
        Options.HorzSizing = False
        Width = 30
      end
      object ViewTimeZoneNAME: TcxGridDBColumn
        Caption = #1063#1072#1089#1086#1074#1110' '#1079#1086#1085#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 306
      end
      object ViewTimeZoneAVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'AVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewInternacionalOrg: TcxGridDBTableView
      DataController.DataSource = INTERNACIONAL_ORGSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewInternacionalOrgID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewInternacionalOrgCheck: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Visible = False
        MinWidth = 30
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 30
      end
      object ViewInternacionalOrgNAME: TcxGridDBColumn
        Caption = #1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1103
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewCarTypeInfo: TcxGridDBTableView
      DataController.DataSource = CAR_TYPE_INFOSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCarTypeInfoID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCarTypeInfoNAME: TcxGridDBColumn
        Caption = #1058#1080#1087#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 260
      end
      object ViewCarTypeInfoNOTE: TcxGridDBColumn
        Caption = #1030#1085#1092#1086#1088#1084#1072#1094#1110#1103
        DataBinding.FieldName = 'NOTE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 424
      end
    end
    object ViewCountriesCarSpeedInfo: TcxGridDBTableView
      DataController.DataSource = COUNTRIES_CAR_SPEED_INFOSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCountriesCarSpeedInfoID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountriesCarSpeedInfoID_CAR_TYPE_INFO: TcxGridDBColumn
        Caption = #1058#1080#1087#1080
        DataBinding.FieldName = 'ID_CAR_TYPE_INFO'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewCarTypeInfo
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewCarTypeInfoNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 210
      end
      object ViewCountriesCarSpeedInfoAUTOSTRADA: TcxGridDBColumn
        Caption = #1040#1074#1090#1086#1089#1090#1088#1072#1076#1072
        DataBinding.FieldName = 'AUTOSTRADA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewCountriesCarSpeedInfoSPEEDROAD: TcxGridDBColumn
        Caption = #1064#1074#1080#1076#1082#1110#1089#1085#1110' '#1076#1086#1088#1086#1075#1080
        DataBinding.FieldName = 'SPEEDROAD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewCountriesCarSpeedInfoOTHERREAD: TcxGridDBColumn
        Caption = #1030#1085#1096#1110' '#1076#1086#1088#1086#1075#1080
        DataBinding.FieldName = 'OTHERREAD'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewCountriesCarSpeedInfoSETTLEMENTS: TcxGridDBColumn
        Caption = #1053#1072#1089#1077#1083#1077#1085#1110' '#1087#1091#1085#1082#1090#1080
        DataBinding.FieldName = 'SETTLEMENTS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
    end
    object ViewCountryEMBASSIES: TcxGridDBTableView
      DataController.DataSource = CNTREMBASSIESSrc
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCountryEMBASSIESCNTREMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'CNTREMBASSYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryEMBASSIESCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryEMBASSIESEMBASSYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 500
      end
      object ViewCountryEMBASSIESCityName: TcxGridDBColumn
        DataBinding.FieldName = 'CityName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 184
      end
      object ViewCountryEMBASSIESOUREMBASSY: TcxGridDBColumn
        DataBinding.FieldName = 'OUREMBASSY'
        Visible = False
      end
      object ViewCountryEMBASSIESCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object ViewCountryEMBASSIESFOROWNERVISA: TcxGridDBColumn
        Caption = #1044#1083#1103' '#1074#1083#1072#1089#1085#1080#1082#1110#1074' '#1074#1110#1079
        DataBinding.FieldName = 'FOROWNERVISA'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        Visible = False
      end
    end
    object ViewEmbassyList: TcxGridDBTableView
      DataController.DataSource = EmbassyListSrc
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewEmbassyListEMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewEmbassyListCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewEmbassyListSelect: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        MinWidth = 30
        Options.HorzSizing = False
        Width = 30
      end
      object ViewEmbassyListEMBASSYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewEmbassyListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object ViewEmbassyListOUREMBASSY: TcxGridDBColumn
        DataBinding.FieldName = 'OUREMBASSY'
        Visible = False
      end
      object ViewEmbassyListOFFICECOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'OFFICECOUNTRY'
        Visible = False
      end
    end
    object ViewCountryEMBASSIESInUkraineForRepresent: TcxGridDBTableView
      DataController.DataSource = CNTREMBASSIESSrc
      DataController.KeyFieldNames = 'CNTREMBASSYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCountryEMBASSIESInUkraineForRepresentCNTREMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'CNTREMBASSYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCountryEMBASSIESInUkraineForRepresentCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCountryEMBASSIESInUkraineForRepresentEMBASSYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCountryEMBASSIESInUkraineForRepresentCityName: TcxGridDBColumn
        DataBinding.FieldName = 'CityName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCountryEMBASSIESInUkraineForRepresentOUREMBASSY: TcxGridDBColumn
        DataBinding.FieldName = 'OUREMBASSY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCountryEMBASSIESInUkraineForRepresentCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCountryEMBASSIESInUkraineForRepresentFOROWNERVISA: TcxGridDBColumn
        DataBinding.FieldName = 'FOROWNERVISA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewProvinceOfUkraine: TcxGridDBTableView
      DataController.DataSource = ProvinceOfUkraineQrySrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewProvinceOfUkraineID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewProvinceOfUkraineID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        IsCaptionAssigned = True
      end
      object ViewProvinceOfUkraineID_ADMIN_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        IsCaptionAssigned = True
      end
      object ViewProvinceOfUkraineSelect: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        MinWidth = 30
        Options.HorzSizing = False
        Width = 30
      end
      object ViewProvinceOfUkraineCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        IsCaptionAssigned = True
      end
      object ViewProvinceOfUkraineNAME: TcxGridDBColumn
        Caption = #1054#1073#1083#1072#1089#1090#1110
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewProvinceOfUkraineCAPITAL: TcxGridDBColumn
        DataBinding.FieldName = 'CAPITAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        IsCaptionAssigned = True
      end
      object ViewProvinceOfUkraineSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        Visible = False
      end
    end
    object ViewBrCountry: TcxGridDBTableView
      DataController.DataSource = BrCountrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrCountryCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 37
        IsCaptionAssigned = True
      end
      object ViewBrCountryNAME: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewBrCountrySHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 24
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 24
      end
      object ViewBrCountryLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewBrCountryLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewBrCountrySHORTSIGN: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTSIGN'
        Visible = False
      end
      object ViewBrCountryTIMEBIAS: TcxGridDBColumn
        DataBinding.FieldName = 'TIMEBIAS'
        Visible = False
      end
      object ViewBrCountryCCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CCODE'
        Visible = False
      end
      object ViewBrCountryCODE2: TcxGridDBColumn
        DataBinding.FieldName = 'CODE2'
        Visible = False
      end
      object ViewBrCountryCODE3: TcxGridDBColumn
        DataBinding.FieldName = 'CODE3'
        Visible = False
      end
      object ViewBrCountryNEEDVISA: TcxGridDBColumn
        DataBinding.FieldName = 'NEEDVISA'
        Visible = False
      end
      object ViewBrCountryPHONECODEUNI: TcxGridDBColumn
        DataBinding.FieldName = 'PHONECODEUNI'
        Visible = False
      end
    end
    object ViewPowerVoltFreq: TcxGridDBTableView
      DataController.DataSource = POWER_VOLT_FREQSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewPowerVoltFreqID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPowerVoltFreqTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ATYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPowerVoltFreqAVALUE: TcxGridDBColumn
        Caption = #1053#1072#1087#1088#1091#1075#1072
        DataBinding.FieldName = 'AVALUE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 121
      end
      object ViewPowerVoltFreqID_UNIT_MEASUR: TcxGridDBColumn
        Caption = #1054#1076#1080#1085#1080#1094#1103' '#1074#1080#1084#1110#1088#1091
        DataBinding.FieldName = 'ID_UNIT_MEASUR'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.View = ViewUnitMeasurList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewUnitMeasurListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 104
      end
      object ViewPowerVoltFreqMEASURNAME: TcxGridDBColumn
        DataBinding.FieldName = 'MEASURNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewFormGovernment: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = FORM_GOVERNMENTSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewFormGovernmentID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewFormGovernmentNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewCurrency: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CurrencySrc
      DataController.KeyFieldNames = 'CURRENCYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = MyStyle
      object ViewCurrencyCURRENCYID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCurrencyCURRENCYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 221
      end
      object ViewCurrencyCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 48
        Options.HorzSizing = False
        Width = 48
      end
      object ViewCurrencyCURRENCYCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYCODE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 36
        Options.HorzSizing = False
        Width = 36
      end
      object ViewCurrencyISUSED: TcxGridDBColumn
        Caption = #1042#1080#1082#1086#1088#1089#1090'.'#1074' '#1087#1088#1086#1075#1088#1072#1084#1072#1093
        DataBinding.FieldName = 'ISUSED'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
        Width = 64
      end
      object ViewCurrencyPREFERRATE: TcxGridDBColumn
        Caption = #1056#1072#1093#1091#1074#1072#1090#1080'. '#1082#1086#1084'. '#1082#1091#1088#1089
        DataBinding.FieldName = 'PREFERRATE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000
          0000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF00000084848484848484848484848484
          8484848484848484848484848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFF848484FFFFFF84
          8484FFFFFF848484FFFFFF848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF00000000000000000000
          0000000000000000000000848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFF848484FFFFFF84
          8484FFFFFF848484FFFFFF848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF00000000000000000000
          0000000000000000000000848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFF848484FFFFFF84
          8484FFFFFF848484FFFFFF848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF00000000000000000000
          0000000000000000000000848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFF848484FFFFFF84
          8484FFFFFF848484FFFFFF848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF00000000000000000000
          0000000000000000000000848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF00000000000000000000
          0000000000000000000000848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF848484000000FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000
          0000000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
        Width = 64
      end
      object ViewCurrencyINTERESTRATE: TcxGridDBColumn
        Caption = #1055#1086#1082#1072#1079' '#1085#1072' '#1089#1072#1081#1090#1110
        DataBinding.FieldName = 'INTERESTRATE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
        Width = 64
      end
      object ViewCurrencyCOINS: TcxGridDBColumn
        DataBinding.FieldName = 'COINS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.HorzSizing = False
        Width = 150
      end
      object ViewCurrencyCURRENTRATE: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENTRATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCurrencyRATEZOOM: TcxGridDBColumn
        DataBinding.FieldName = 'RATEZOOM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewCurrencyLASTDATE: TcxGridDBColumn
        DataBinding.FieldName = 'LASTDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 112
        Options.HorzSizing = False
      end
      object ViewCurrencyMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
    end
    object ViewCountryTypeInfo: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COUNTRIES_TYPE_INFOSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCountryTypeInfoID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCountryTypeInfoNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 521
      end
      object ViewCountryTypeInfoTABLE_IND: TcxGridDBColumn
        Caption = #1058#1072#1073#1083#1080#1094#1103
        DataBinding.FieldName = 'TABLE_IND'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1050#1088#1072#1111#1085#1080
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1052#1110#1089#1090#1072
            Value = 1
          end
          item
            Description = #1052#1086#1074#1080
            Value = 2
          end
          item
            Description = #1060#1086#1088#1084#1080' '#1087#1088#1072#1074#1083#1110#1085#1085#1103
            Value = 3
          end
          item
            Description = #1043#1088#1086#1096#1086#1074#1072' '#1086#1076#1080#1085#1080#1094#1103
            Value = 4
          end
          item
            Description = #1053#1072#1087#1088#1091#1075#1072'/'#1095#1072#1089#1090#1086#1090#1072
            Value = 5
          end
          item
            Description = #1058#1080#1087#1080' '#1088#1086#1079#1077#1090#1086#1082
            Value = 6
          end
          item
            Description = #1056#1077#1083#1110#1075#1110#1103
            Value = 7
          end
          item
            Description = #1052#1110#1078#1085#1072#1088'. '#1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
            Value = 8
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 163
      end
      object ViewCountryTypeInfoLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewCountryTypeInfoLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewReligionDict: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ReligionSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewReligionDictID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewReligionDictNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewCompContractKind: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMP_CONTRACTS_KINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCompContractKindID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompContractKindAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 42
      end
      object ViewCompContractKindNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 217
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 217
      end
      object ViewCompContractKindSHORTNAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 125
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 125
      end
      object ViewCompContractKindTEMPLATS: TcxGridDBColumn
        Caption = #1064#1072#1073#1083#1086#1085
        DataBinding.FieldName = 'TEMPLATS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 232
      end
      object ViewCompContractKindDAYCOUNT: TcxGridDBColumn
        Caption = #1050#1110#1083'. '#1076#1085#1110#1074
        DataBinding.FieldName = 'DAYCOUNT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 68
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 68
      end
      object ViewCompContractKindTOURID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewCompContractKindGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewCompContractKindList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMP_CONTRACTS_KINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCompContractKindListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompContractKindListAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.HorzSizing = False
        Width = 42
      end
      object ViewCompContractKindListNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompContractKindListSHORTNAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompContractKindListTEMPLATS: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLATS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompContractKindListDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompContractKindListTOURID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompContractKindListGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewTypeDocumList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = TypeDocumSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewTypeDocumListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taRightJustify
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTypeDocumListNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taRightJustify
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTypeDocumListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        HeaderAlignmentHorz = taRightJustify
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
      end
    end
    object ViewTaxSystem: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = TaxSystemSrc
      DataController.KeyFieldNames = 'TAXSYSTEMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTaxSystemTAXSYSTEMID: TcxGridDBColumn
        DataBinding.FieldName = 'TAXSYSTEMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTaxSystemTAXNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'TAXNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 620
      end
      object ViewTaxSystemSINGLETAX: TcxGridDBColumn
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        DataBinding.FieldName = 'SINGLETAX'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 64
      end
      object ViewTaxSystemCOMMENTS: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 383
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 383
      end
    end
    object ViewTaxSystemDetail: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = TaxSystemDetailsSrc
      DataController.KeyFieldNames = 'TAXDETAILID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTaxSystemDetailTAXSYSTEMID: TcxGridDBColumn
        DataBinding.FieldName = 'TAXSYSTEMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTaxSystemDetailTAXDETAILID: TcxGridDBColumn
        DataBinding.FieldName = 'TAXDETAILID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTaxSystemDetailINCOMETAXABS: TcxGridDBColumn
        Caption = #1055#1086#1076#1072#1090#1086#1082' (%)'
        DataBinding.FieldName = 'INCOMETAXABS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 152
      end
      object ViewTaxSystemDetailINCOMETAXVAL: TcxGridDBColumn
        DataBinding.FieldName = 'INCOMETAXVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTaxSystemDetailCalcPayerTAX: TcxGridDBColumn
        Tag = -100
        Caption = #1055#1044#1042' (%)'
        DataBinding.FieldName = 'CalcPayerTAX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 127
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 127
      end
      object ViewTaxSystemDetailPAYER: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1083#1072#1090#1085#1080#1082
        DataBinding.FieldName = 'PAYER'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTaxSystemDetailPDVSUM: TcxGridDBColumn
        Tag = 100
        Caption = #1057#1091#1084#1072
        DataBinding.FieldName = 'PDVSUM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTaxSystemDetailFROMDATE: TcxGridDBColumn
        Caption = #1044#1110#1108' '#1079' '
        DataBinding.FieldName = 'FROMDATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 100
      end
      object ViewTaxSystemDetailTODATE: TcxGridDBColumn
        Caption = #1044#1110#1108' '#1087#1086
        DataBinding.FieldName = 'TODATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
    end
    object ViewTaxSystemList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = TaxSystemSrc
      DataController.KeyFieldNames = 'TAXSYSTEMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewTaxSystemListTAXSYSTEMID: TcxGridDBColumn
        DataBinding.FieldName = 'TAXSYSTEMID'
        Visible = False
      end
      object ViewTaxSystemListTAXNAME: TcxGridDBColumn
        DataBinding.FieldName = 'TAXNAME'
      end
      object ViewTaxSystemListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
      object ViewTaxSystemListSINGLETAX: TcxGridDBColumn
        DataBinding.FieldName = 'SINGLETAX'
        Visible = False
      end
    end
    object ViewCurrencyMainList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CurrencyMainSrc
      DataController.KeyFieldNames = 'CURRENCYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCurrencyMainListCURRENCYID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYID'
        Visible = False
      end
      object ViewCurrencyMainListCURRENCYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYNAME'
        Visible = False
      end
      object ViewCurrencyMainListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewSelCompAction: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SelCompActionSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewSelCompActionID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelCompActionAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 52
      end
      object ViewSelCompActionNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 418
      end
      object ViewSelCompActionSHORTNAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 214
      end
    end
    object ViewSelCompActionList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SelCompActionSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewSelCompActionListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelCompActionListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewSelCompActionListNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
      end
      object ViewSelCompActionListSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewHotelDoc: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HtlDocSrc
      DataController.KeyFieldNames = 'HOTELDOCID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHotelDocHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHotelDocHOTELDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELDOCID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHotelDocORDERNO: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'ORDERNO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.HorzSizing = False
        Width = 32
      end
      object ViewHotelDocDESCRIPT: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 279
      end
      object ViewHotelDocFILENAME: TcxGridDBColumn
        DataBinding.FieldName = 'FILENAME'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 242
      end
      object ViewHotelDocCalcFileName: TcxGridDBColumn
        Tag = -1
        DataBinding.FieldName = 'CalcFileName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 129
      end
      object ViewHotelDocSHOWLOC: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWLOC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHotelDocColumnSize: TcxGridDBColumn
        Caption = #1056#1086#1079#1084#1110#1088
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHotelDocSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 34
      end
    end
    object ViewHtlBuild: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HtlBuildSrc
      DataController.KeyFieldNames = 'HOTELBUILDID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlBuildHOTELBUILDID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELBUILDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildBUILDID: TcxGridDBColumn
        Caption = #1057#1087#1086#1088#1091#1076#1072
        DataBinding.FieldName = 'BUILDID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownListStyle = lsEditList
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Properties.View = ViewHOTEL_BUILDSList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewHOTEL_BUILDSListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSTARS: TcxGridDBColumn
        Tag = 100
        DataBinding.FieldName = 'STARS'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = #1090#1091#1088#1082#1083#1072#1089#1091
            ImageIndex = 0
            Value = #1090#1091#1088#1082#1083#1072#1089#1091
          end
          item
            Description = '*'
            Value = '*'
          end
          item
            Description = '*+'
            Value = '*+'
          end
          item
            Description = '**'
            Value = '**'
          end
          item
            Description = '**.***'
            Value = '**.***'
          end
          item
            Description = '**+'
            Value = '**+'
          end
          item
            Description = '***'
            Value = '***'
          end
          item
            Description = '***+'
            Value = '***+'
          end
          item
            Description = '****'
            Value = '****'
          end
          item
            Description = '****+'
            Value = '****+'
          end
          item
            Description = '*****'
            Value = '*****'
          end
          item
            Description = '*****+'
            Value = '*****+'
          end
          item
            Description = 'HV'
            Value = 'HV'
          end
          item
            Description = 'HV-1'
            Value = 'HV-1'
          end>
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHtlBuildLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewHtlRoom: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HtlRoomSrc
      DataController.KeyFieldNames = 'HOTELROOMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlRoomHOTELROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELROOMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomROOMTYPEID: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1082#1110#1084#1085#1072#1090#1080
        DataBinding.FieldName = 'ROOMTYPEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Properties.View = ViewRoomTypeQryList
        Properties.KeyFieldNames = 'ROOMTYPEID'
        Properties.ListFieldItem = ViewRoomTypeQryListROOMTYPE
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 183
      end
      object ViewHtlRoomROOMTYPEIDShort: TcxGridDBColumn
        Tag = -1
        Caption = #1057#1082#1086#1088#1086#1095'.'
        DataBinding.FieldName = 'ROOMTYPEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewRoomTypeQryList
        Properties.KeyFieldNames = 'ROOMTYPEID'
        Properties.ListFieldItem = ViewRoomTypeQryListEXTNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 84
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 84
      end
      object ViewHtlRoomEXPANDNAMEID: TcxGridDBColumn
        Tag = 100
        Caption = #1056#1086#1079#1096#1080#1088#1077#1085#1085#1103' '#1085#1072#1079#1074#1080
        DataBinding.FieldName = 'EXPANDNAMEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Properties.View = ViewExpandNameList
        Properties.KeyFieldNames = 'EXPANDNAMEID'
        Properties.ListFieldItem = ViewExpandNameListEXPANDNAME
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomEXPANDNAMEIDExt: TcxGridDBColumn
        DataBinding.FieldName = 'EXPANDNAMEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewExpandNameList
        Properties.KeyFieldNames = 'EXPANDNAMEID'
        Properties.ListFieldItem = ViewExpandNameListEXTNAME
        Visible = False
      end
      object ViewHtlRoomROOMCOUNT: TcxGridDBColumn
        AlternateCaption = #1050'-'#1089#1090#1100' '#1085#1086#1084#1077#1088#1110#1074
        Caption = #1050'-'#1089#1090#1100
        DataBinding.FieldName = 'ROOMCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewHtlRoomCAPACITY: TcxGridDBColumn
        Caption = #1052#1110#1089#1085#1110#1089#1090#1100
        DataBinding.FieldName = 'CAPACITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 48
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 48
      end
      object ViewHtlRoomADDCAPADULT: TcxGridDBColumn
        AlternateCaption = #1074'.'#1090'.'#1095'. '#1076#1086#1088#1086#1089#1083#1080#1093
        DataBinding.FieldName = 'ADDCAPADULT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewHtlRoomADDCAPACITY: TcxGridDBColumn
        AlternateCaption = #1044#1086#1076#1072#1090#1082#1086#1074#1110' '#1083#1110#1078#1082#1072
        DataBinding.FieldName = 'ADDCAPACITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewHtlRoomCalcChildTo: TcxGridDBColumn
        Tag = -1
        DataBinding.FieldName = 'CalcChildTo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 44
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 44
      end
      object ViewHtlRoomCHILDTO: TcxGridDBColumn
        Tag = 100
        AlternateCaption = #1044#1110#1090#1080' '#1076#1086' ('#1088#1086#1082#1110#1074')'
        Caption = #1044#1110#1090#1080' '#1076#1086
        DataBinding.FieldName = 'CHILDTO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomROOMAREA: TcxGridDBColumn
        DataBinding.FieldName = 'ROOMAREA'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewHtlRoomDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomBUILDID: TcxGridDBColumn
        DataBinding.FieldName = 'BUILDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomIMPORTED: TcxGridDBColumn
        DataBinding.FieldName = 'IMPORTED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomMINPERSON: TcxGridDBColumn
        DataBinding.FieldName = 'MINPERSON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlRoomLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHtlRoomLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewRoomBed: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = RoomBedSrc
      DataController.KeyFieldNames = 'BEDID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewRoomBedHTLROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'HTLROOMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRoomBedVARIANTID: TcxGridDBColumn
        DataBinding.FieldName = 'VARIANTID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 60
      end
      object ViewRoomBedBEDID: TcxGridDBColumn
        DataBinding.FieldName = 'BEDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRoomBedBEDTYPEID: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'BEDTYPEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Properties.View = ViewBedTypeList
        Properties.KeyFieldNames = 'BEDTYPEID'
        Properties.ListFieldItem = ViewBedTypeListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRoomBedBEDTYPEIDShort: TcxGridDBColumn
        Tag = -1
        Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'BEDTYPEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewBedTypeList
        Properties.KeyFieldNames = 'BEDTYPEID'
        Properties.ListFieldItem = ViewBedTypeListSHORTNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
      object ViewRoomBedBEDCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'BEDCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 43
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 43
      end
      object ViewRoomBedBEDSIZE: TcxGridDBColumn
        DataBinding.FieldName = 'BEDSIZE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 133
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 133
      end
      object ViewRoomBedMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewRoomBedBEDMAIN: TcxGridDBColumn
        DataBinding.FieldName = 'BEDMAIN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewRoomVariantList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = RoomVariantSrc
      DataController.KeyFieldNames = 'VARIANTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewRoomVariantListHTLROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'HTLROOMID'
        Visible = False
        Options.Sorting = False
      end
      object ViewRoomVariantListVARIANTID: TcxGridDBColumn
        DataBinding.FieldName = 'VARIANTID'
        Visible = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soDescending
      end
      object ViewRoomVariantListDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        Options.Sorting = False
      end
      object ViewRoomVariantListVariantName: TcxGridDBColumn
        Caption = #1042#1072#1088#1110#1072#1085#1090
        DataBinding.FieldName = 'CalcVariantName'
        Options.Sorting = False
      end
    end
    object ViewRoomVarian: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = RoomVariantSrc
      DataController.KeyFieldNames = 'VARIANTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewRoomVarianHTLROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'HTLROOMID'
        Visible = False
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewRoomVarianVARIANTID: TcxGridDBColumn
        DataBinding.FieldName = 'VARIANTID'
        Visible = False
        Options.Filtering = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soDescending
      end
      object ViewRoomVarianDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewRoomVarianVariantName: TcxGridDBColumn
        Caption = #1042#1072#1088#1110#1072#1085#1090
        DataBinding.FieldName = 'CalcVariantName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
    end
    object ViewHtlSrvLnk: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HtlSrvLnkSrc
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlSrvLnkHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkHAVECOST: TcxGridDBColumn
        DataBinding.FieldName = 'HAVECOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCOST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCalcCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCost'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlSrvLnkCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewHtlBuildSel: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'HOTELBUILDID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlBuildSelHOTELBUILDID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELBUILDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSelBUILDID: TcxGridDBColumn
        Caption = #1057#1087#1086#1088#1091#1076#1072
        DataBinding.FieldName = 'BUILDID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewHOTEL_BUILDSList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewHOTEL_BUILDSListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSelDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSelHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSelCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSelTRANSCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'TRANSCOMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSelSTARS: TcxGridDBColumn
        DataBinding.FieldName = 'STARS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlBuildSelTRANSBUILDNAME: TcxGridDBColumn
        DataBinding.FieldName = 'TRANSBUILDNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewHtlRoomSel: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'HOTELROOMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlRoomSelHOTELROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELROOMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelROOMTYPEID: TcxGridDBColumn
        Caption = #1058#1080#1087' '#1082#1110#1084#1085#1072#1090#1080
        DataBinding.FieldName = 'ROOMTYPEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewRoomTypeQryList
        Properties.KeyFieldNames = 'ROOMTYPEID'
        Properties.ListFieldItem = ViewRoomTypeQryListROOMTYPE
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelEXPANDNAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'EXPANDNAMEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewExpandNameList
        Properties.KeyFieldNames = 'EXPANDNAMEID'
        Properties.ListFieldItem = ViewExpandNameListEXPANDNAME
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelEXTNAME: TcxGridDBColumn
        Caption = #1057#1082#1086#1088#1086#1095'.'
        DataBinding.FieldName = 'ROOMTYPEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewRoomTypeQryList
        Properties.KeyFieldNames = 'ROOMTYPEID'
        Properties.ListFieldItem = ViewRoomTypeQryListEXTNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 84
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 84
      end
      object ViewHtlRoomSelEXPANDNAMEIDExt: TcxGridDBColumn
        DataBinding.FieldName = 'EXPANDNAMEID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewExpandNameList
        Properties.KeyFieldNames = 'EXPANDNAMEID'
        Properties.ListFieldItem = ViewExpandNameListEXTNAME
        Visible = False
      end
      object ViewHtlRoomSelROOMCOUNT: TcxGridDBColumn
        Caption = #1050'-'#1090#1100
        DataBinding.FieldName = 'ROOMCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewHtlRoomSelCAPACITY: TcxGridDBColumn
        Caption = #1052#1110#1089#1085#1110#1089#1090#1100
        DataBinding.FieldName = 'CAPACITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 48
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 48
      end
      object ViewHtlRoomSelADDCAPADULT: TcxGridDBColumn
        DataBinding.FieldName = 'ADDCAPADULT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewHtlRoomSelADDCAPACITY: TcxGridDBColumn
        DataBinding.FieldName = 'ADDCAPACITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewHtlRoomSelCalcChildTo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcChildTo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 44
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 44
      end
      object ViewHtlRoomSelDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelBUILDID: TcxGridDBColumn
        DataBinding.FieldName = 'BUILDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelCHILDTO: TcxGridDBColumn
        DataBinding.FieldName = 'CHILDTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelROOMAREA: TcxGridDBColumn
        DataBinding.FieldName = 'ROOMAREA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelIMPORTED: TcxGridDBColumn
        DataBinding.FieldName = 'IMPORTED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelMINPERSON: TcxGridDBColumn
        DataBinding.FieldName = 'MINPERSON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlRoomSelLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHtlRoomSelLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewServGroup: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ServGroupSrc
      DataController.KeyFieldNames = 'SERVICEGROUPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewServGroupSERVICEGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEGROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServGroupSERVICEGROUPNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'SERVICEGROUPNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 300
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 300
      end
      object ViewServGroupCOMMENTS: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 390
      end
      object ViewServGroupLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewServGroupLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewServGroupList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ServGroupSrc
      DataController.KeyFieldNames = 'SERVICEGROUPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewServGroupListSERVICEGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEGROUPID'
        Visible = False
        Options.Filtering = False
      end
      object ViewServGroupListSERVICEGROUPNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEGROUPNAME'
        Options.Filtering = False
      end
      object ViewServGroupListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        Options.Filtering = False
      end
      object ViewServGroupListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewServGroupListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewHtlServList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ServicesSrc
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewHtlServListSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListNAME: TcxGridDBColumn
        Caption = #1055#1086#1089#1083#1091#1075#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListINHOTEL: TcxGridDBColumn
        DataBinding.FieldName = 'INHOTEL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListINBUILD: TcxGridDBColumn
        DataBinding.FieldName = 'INBUILD'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListINROOM: TcxGridDBColumn
        DataBinding.FieldName = 'INROOM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlServListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewHtlSrvLnkList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlSrvLnkListHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 411
      end
      object ViewHtlSrvLnkListHAVECOST: TcxGridDBColumn
        Tag = 100
        Caption = #1054#1087#1083#1072#1090#1072
        DataBinding.FieldName = 'HAVECOST'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1054#1082#1088#1077#1084#1072' '#1087#1083#1072#1090#1072
            Value = 1
          end
          item
            Description = #1054#1087#1083#1072#1095#1091#1108#1090#1100#1089#1103' '#1095#1072#1089#1090#1082#1086#1074#1086
            Value = 2
          end
          item
            Description = #1053#1077#1084#1072#1108' '#1074#1072#1088#1090#1086#1089#1090#1110
            Value = 3
          end
          item
            Value = -1
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewHtlSrvLnkListCOST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListCalcCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtlSrvLnkListColumnPrice: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'CalcPrice'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 133
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 133
      end
    end
    object ViewBldSrvLnkList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BldSrvLnkSrc
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBldSrvLnkListHOTELBUILDID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELBUILDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 411
      end
      object ViewBldSrvLnkListHAVECOST: TcxGridDBColumn
        Caption = #1054#1087#1083#1072#1090#1072
        DataBinding.FieldName = 'HAVECOST'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1054#1082#1088#1077#1084#1072' '#1087#1083#1072#1090#1072
            Value = 1
          end
          item
            Description = #1054#1087#1083#1072#1095#1091#1108#1090#1100#1089#1103' '#1095#1072#1089#1090#1082#1086#1074#1086
            Value = 2
          end
          item
            Description = #1053#1077#1084#1072#1108' '#1074#1072#1088#1090#1086#1089#1090#1110
            Value = 3
          end
          item
            Value = -1
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewBldSrvLnkListSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCOST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCalcCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBldSrvLnkListCalcPrice: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'CalcPrice'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 133
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 133
      end
    end
    object ViewRoomSrvLnkList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = RoomSrvLnkSrs
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewRoomSrvLnkListHOTELROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELROOMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 411
      end
      object ViewRoomSrvLnkListHAVECOST: TcxGridDBColumn
        Caption = #1054#1087#1083#1072#1090#1072
        DataBinding.FieldName = 'HAVECOST'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1054#1082#1088#1077#1084#1072' '#1087#1083#1072#1090#1072
            Value = 1
          end
          item
            Description = #1054#1087#1083#1072#1095#1091#1108#1090#1100#1089#1103' '#1095#1072#1089#1090#1082#1086#1074#1086
            Value = 2
          end
          item
            Description = #1053#1077#1084#1072#1108' '#1074#1072#1088#1090#1086#1089#1090#1110
            Value = 3
          end
          item
            Value = '-1'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.HorzSizing = False
        Width = 100
      end
      object ViewRoomSrvLnkListSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCOST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCalcCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRoomSrvLnkListCalcPrice: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'CalcPrice'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 133
        Options.HorzSizing = False
        Width = 133
      end
    end
    object ViewHOTEL_BUILDSList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BuildsQrySrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewHOTEL_BUILDSListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewHOTEL_BUILDSListAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewHOTEL_BUILDSListNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 232
      end
      object ViewHOTEL_BUILDSListCOMMENTS: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 452
      end
      object ViewHOTEL_BUILDSListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHOTEL_BUILDSListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewHOTEL_BUILDS: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BuildsQrySrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHOTEL_BUILDSID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
      end
      object ViewHOTEL_BUILDSAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 40
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 40
      end
      object ViewHOTEL_BUILDSNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Options.Sorting = False
        Width = 300
      end
      object ViewHOTEL_BUILDSCOMMENTS: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 23
      end
      object ViewHOTEL_BUILDSLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHOTEL_BUILDSLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewCityKindList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CITYKINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCityKindListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityKindListNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCityKindListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
    end
    object ViewCityKind: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CITYKINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCityKindID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityKindAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 53
      end
      object ViewCityKindNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 273
      end
    end
    object ViewBldSrvLnk: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBldSrvLnkHOTELBUILDID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELBUILDID'
        Visible = False
      end
      object ViewBldSrvLnkLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
      end
      object ViewBldSrvLnkSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
      end
      object ViewBldSrvLnkHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
      end
      object ViewBldSrvLnkINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
      end
      object ViewBldSrvLnkMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
      end
      object ViewBldSrvLnkHAVECOST: TcxGridDBColumn
        DataBinding.FieldName = 'HAVECOST'
        Visible = False
      end
      object ViewBldSrvLnkCOST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
      end
      object ViewBldSrvLnkNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewBldSrvLnkLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
      end
      object ViewBldSrvLnkSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
      end
      object ViewBldSrvLnkCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
      end
      object ViewBldSrvLnkCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
      end
      object ViewBldSrvLnkCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
      end
      object ViewBldSrvLnkCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
      end
      object ViewBldSrvLnkCalcCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCost'
      end
      object ViewBldSrvLnkCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
      end
      object ViewBldSrvLnkCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
      end
      object ViewBldSrvLnkCalcPrice: TcxGridDBColumn
        DataBinding.FieldName = 'CalcPrice'
        Visible = False
      end
    end
    object ViewRoomTypeQry: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = RoomTypeSrc
      DataController.KeyFieldNames = 'ROOMTYPEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewRoomTypeQryROOMTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'ROOMTYPEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRoomTypeQryROOMTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ROOMTYPE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 185
        Options.Filtering = False
        Width = 185
      end
      object ViewRoomTypeQryEXTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EXTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 130
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 130
      end
      object ViewRoomTypeQryMEMO: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 369
      end
    end
    object ViewRoomTypeQryList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = RoomTypeSrc
      DataController.KeyFieldNames = 'ROOMTYPEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewRoomTypeQryListROOMTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'ROOMTYPEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRoomTypeQryListROOMTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ROOMTYPE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 234
      end
      object ViewRoomTypeQryListEXTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EXTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 138
      end
      object ViewRoomTypeQryListMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewExpandName: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ExpandNameSrc
      DataController.KeyFieldNames = 'EXPANDNAMEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewExpandNameEXPANDNAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'EXPANDNAMEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExpandNameEXPANDNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'EXPANDNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 304
        Options.Filtering = False
      end
      object ViewExpandNameEXTNAME: TcxGridDBColumn
        Caption = #1057#1082#1086#1088#1086#1090#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'EXTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 124
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewExpandNameCOMMENTS: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewExpandNameList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ExpandNameSrc
      DataController.KeyFieldNames = 'EXPANDNAMEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewExpandNameListEXPANDNAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'EXPANDNAMEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExpandNameListEXPANDNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'EXPANDNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExpandNameListEXTNAME: TcxGridDBColumn
        Caption = #1057#1082#1086#1088#1086#1090#1095'.'
        DataBinding.FieldName = 'EXTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExpandNameListCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewBedType: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BedTypeSrc
      DataController.KeyFieldNames = 'BEDTYPEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBedTypeBEDTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'BEDTYPEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBedTypeNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Width = 200
      end
      object ViewBedTypeSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
      object ViewBedTypeCAPACITY: TcxGridDBColumn
        Caption = #1052#1110#1089#1090#1082#1110#1089#1090#1100
        DataBinding.FieldName = 'CAPACITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewBedTypePRIORITY: TcxGridDBColumn
        DataBinding.FieldName = 'PRIORITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewBedTypeMEMO: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 167
      end
      object ViewBedTypeLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewBedTypeLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewBedTypeLNGCHANGE_SH: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE_SH'
        Visible = False
      end
    end
    object ViewBedTypeList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BedTypeSrc
      DataController.KeyFieldNames = 'BEDTYPEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBedTypeListBEDTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'BEDTYPEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBedTypeListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 240
      end
      object ViewBedTypeListSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBedTypeListCAPACITY: TcxGridDBColumn
        DataBinding.FieldName = 'CAPACITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBedTypeListMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBedTypeListPRIORITY: TcxGridDBColumn
        DataBinding.FieldName = 'PRIORITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBedTypeListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewBedTypeListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewBedTypeListLNGCHANGE_SH: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE_SH'
        Visible = False
      end
    end
    object ViewSelOurPersonList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'PERSONID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewSelOurPersonListCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListPERSONID: TcxGridDBColumn
        DataBinding.FieldName = 'PERSONID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListFULLNAME: TcxGridDBColumn
        DataBinding.FieldName = 'FULLNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListOCCUPATION: TcxGridDBColumn
        DataBinding.FieldName = 'OCCUPATION'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListSIGNRIGHT: TcxGridDBColumn
        DataBinding.FieldName = 'SIGNRIGHT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListERRANDNO: TcxGridDBColumn
        DataBinding.FieldName = 'ERRANDNO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListERRANDFROM: TcxGridDBColumn
        DataBinding.FieldName = 'ERRANDFROM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListERRANDTO: TcxGridDBColumn
        DataBinding.FieldName = 'ERRANDTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelOurPersonListCalcFullName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'CalcFullName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewSeFromPartnerPersonList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'PERSONID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewSeFromPartnerPersonListCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
      end
      object ViewSeFromPartnerPersonListPERSONID: TcxGridDBColumn
        DataBinding.FieldName = 'PERSONID'
        Visible = False
      end
      object ViewSeFromPartnerPersonListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
      end
      object ViewSeFromPartnerPersonListSECONDNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SECONDNAME'
        Visible = False
      end
      object ViewSeFromPartnerPersonListFULLNAME: TcxGridDBColumn
        DataBinding.FieldName = 'FULLNAME'
        Visible = False
      end
      object ViewSeFromPartnerPersonListOCCUPATION: TcxGridDBColumn
        DataBinding.FieldName = 'OCCUPATION'
        Visible = False
      end
      object ViewSeFromPartnerPersonListSIGNRIGHT: TcxGridDBColumn
        DataBinding.FieldName = 'SIGNRIGHT'
        Visible = False
      end
      object ViewSeFromPartnerPersonListCalcFullName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'CalcFullName'
      end
    end
    object ViewImportLog: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'LOGID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewImportLogLOGID: TcxGridDBColumn
        DataBinding.FieldName = 'LOGID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogMANAGERID: TcxGridDBColumn
        DataBinding.FieldName = 'MANAGERID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogIMPORTDATE: TcxGridDBColumn
        Caption = #1044#1072#1090#1072
        DataBinding.FieldName = 'IMPORTDATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewImportLogWEBSITE: TcxGridDBColumn
        Caption = #1057#1072#1081#1090
        DataBinding.FieldName = 'WEBSITE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewImportLogMANAGER: TcxGridDBColumn
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        DataBinding.FieldName = 'MANAGER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewDrvVendor: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'DRIVEVENDORID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewDrvVendorDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorDRIVEVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEVENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvVendorCOMPIDFORCNTRCT: TcxGridDBColumn
        DataBinding.FieldName = 'COMPIDFORCNTRCT'
        Visible = False
      end
      object ViewDrvVendorISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
        Visible = False
      end
      object ViewDrvVendorISVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
      end
      object ViewDrvVendorISENTERPR: TcxGridDBColumn
        DataBinding.FieldName = 'ISENTERPR'
        Visible = False
      end
      object ViewDrvVendorALLDATAFILL: TcxGridDBColumn
        DataBinding.FieldName = 'ALLDATAFILL'
        Visible = False
      end
      object ViewDrvVendorACTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIONID'
        Visible = False
      end
      object ViewDrvVendorGOVREESTRTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'GOVREESTRTYPEID'
        Visible = False
      end
      object ViewDrvVendorIDENTCODE: TcxGridDBColumn
        DataBinding.FieldName = 'IDENTCODE'
        Visible = False
      end
      object ViewDrvVendorGOVREESTRDATE: TcxGridDBColumn
        DataBinding.FieldName = 'GOVREESTRDATE'
        Visible = False
      end
      object ViewDrvVendorASRESIDENT: TcxGridDBColumn
        DataBinding.FieldName = 'ASRESIDENT'
        Visible = False
      end
      object ViewDrvVendorVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
      end
    end
    object ViewBrDrive: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'DRIVEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrDriveDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewBrDriveMODEL: TcxGridDBColumn
        DataBinding.FieldName = 'MODEL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.HorzSizing = False
        Width = 150
      end
      object ViewBrDriveDRIVENO: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVENO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDrivePLACECOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'PLACECOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDriveYEARBUS: TcxGridDBColumn
        DataBinding.FieldName = 'YEARBUS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDriveEUROCLASS: TcxGridDBColumn
        Caption = #1044#1074#1080#1075#1091#1085
        DataBinding.FieldName = 'EUROCLASS'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDriveFLOORS: TcxGridDBColumn
        DataBinding.FieldName = 'FLOORS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.HorzSizing = False
        Width = 70
      end
      object ViewBrDrivePLACEMAPNO: TcxGridDBColumn
        DataBinding.FieldName = 'PLACEMAPNO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveDRIVEKIND: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1091
        DataBinding.FieldName = 'DRIVEKIND'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveISPROTO: TcxGridDBColumn
        DataBinding.FieldName = 'ISPROTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveREGCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'REGCOUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveADDMANID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewBrDriveKIND: TcxGridDBColumn
        DataBinding.FieldName = 'KIND'
        Visible = False
      end
      object ViewBrDriveCLASSNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CLASSNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
      end
      object ViewBrDriveLookDriveKind: TcxGridDBColumn
        DataBinding.FieldName = 'LookDriveKind'
        Visible = False
      end
      object ViewBrDriveVENDORNAME: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
        DataBinding.FieldName = 'VENDORNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDriveVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
      end
    end
    object ViewDriveEuroClass: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DriveEuroClassSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewDriveEuroClassID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDriveEuroClassAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 32
      end
      object ViewDriveEuroClassNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewDriveEuroClassList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DriveEuroClassSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewDriveEuroClassListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewDriveEuroClassListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewDriveEuroClassListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
    end
    object ViewBrDrvKind: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrDrvKindSrc
      DataController.KeyFieldNames = 'DRIVEKIND'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrDrvKindDRIVEKIND: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDrvKindKIND: TcxGridDBColumn
        DataBinding.FieldName = 'KIND'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDrvKindKINDSHORT: TcxGridDBColumn
        Tag = 100
        Caption = #1057#1082#1086#1088#1086#1095'. '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'KINDSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
      object ViewBrDrvKindKIND_ENG: TcxGridDBColumn
        Tag = 100
        Caption = #1051#1072#1090#1080#1085'. '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'KIND_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
      object ViewBrDrvKindCATEGORY: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
        DataBinding.FieldName = 'CATEGORY'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = #1040#1074#1090#1086#1084#1086#1073#1110#1083#1100#1085#1080#1081
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1047#1072#1083#1110#1079#1085#1080#1095#1085#1080#1081
            Value = 1
          end
          item
            Description = #1052#1086#1088#1089#1100#1082#1080#1081
            Value = 2
          end
          item
            Description = #1055#1086#1074#1110#1090#1088#1103#1085#1080#1081
            Value = 3
          end>
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 120
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 120
      end
      object ViewBrDrvKindNAME_LEVEL: TcxGridDBColumn
        Tag = 100
        Caption = #1053#1072#1079#1074#1072' '#1088#1110#1074#1085#1103
        DataBinding.FieldName = 'NAME_LEVEL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewBrDrvKindList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrDrvKindSrc
      DataController.KeyFieldNames = 'DRIVEKIND'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrDrvKindListDRIVEKIND: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDrvKindListKIND: TcxGridDBColumn
        DataBinding.FieldName = 'KIND'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDrvKindListKIND_ENG: TcxGridDBColumn
        Caption = #1051#1072#1090#1080#1085#1082#1086#1102
        DataBinding.FieldName = 'KIND_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDrvKindListCATEGORY: TcxGridDBColumn
        DataBinding.FieldName = 'CATEGORY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrDrvKindListKINDSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'KINDSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewDriveNoteQry: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'DRIVENOTEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewDriveNoteQryADDDATE: TcxGridDBColumn
        DataBinding.FieldName = 'ADDDATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.HorzSizing = False
        Width = 110
      end
      object ViewDriveNoteQryADDMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANAGER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 160
        Options.HorzSizing = False
        Width = 160
      end
      object ViewDriveNoteQryLEAVINGID: TcxGridDBColumn
        DataBinding.FieldName = 'LEAVINGID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.HorzSizing = False
        Width = 60
      end
      object ViewDriveNoteQryCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 600
      end
      object ViewDriveNoteQryDRIVENOTEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVENOTEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDELETED: TcxGridDBColumn
        DataBinding.FieldName = 'DELETED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDELDATE: TcxGridDBColumn
        DataBinding.FieldName = 'DELDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDELMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'DELMANAGER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDriveNoteQryDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewSelectVendorList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewSelectVendorListCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelectVendorListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelectVendorListISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelectVendorListISVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewObjLinksCountryList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewObjLinksCountryListID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewObjLinksCountryListID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewObjectLinks: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'LINKID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewObjectLinksLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksMAIN_TYPEOBJ: TcxGridDBColumn
        DataBinding.FieldName = 'MAIN_TYPEOBJ'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksMAINOBJECTID: TcxGridDBColumn
        DataBinding.FieldName = 'MAINOBJECTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksTYPEOBJ: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEOBJ'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksOBJECTID: TcxGridDBColumn
        DataBinding.FieldName = 'OBJECTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksCOUNTRYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksOBJECTNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'OBJECTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewObjectLinksOBJLINKCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'OBJLINKCOUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewNaturObj: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = NaturObjSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewNaturObjNID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjNAMEPATH: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'NAMEPATH'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 158
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 158
      end
      object ViewNaturObjNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 494
      end
      object ViewNaturObjID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjID_ADMIN_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjID_MAIN_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_PARENT'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjID_MAIN_CITY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_CITY'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjID_ADMIN_UNIT_SUB: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT_SUB'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjID_CITY_ADM_UNT_ITEMS_TYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjAMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'AMEMO'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
        Options.Filtering = False
      end
      object ViewNaturObjSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
    end
    object ViewNaturObjList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = NaturObjSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewNaturObjListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewNaturObjListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewNaturObjListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewNaturObjListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewInfra: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = InfraSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewInfraID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraNAMEPATH: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'NAMEPATH'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 150
      end
      object ViewInfraNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 504
      end
      object ViewInfraID_ADMIN_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraID_MAIN_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraID_MAIN_CITY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_CITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraID_ADMIN_UNIT_SUB: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT_SUB'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewInfraID_CITY_ADM_UNT_ITEMS_TYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraAMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'AMEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
        Options.Filtering = False
      end
      object ViewInfraLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
        Options.Filtering = False
      end
    end
    object ViewInfraList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = InfraSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewInfraListINFRAID: TcxGridDBColumn
        DataBinding.FieldName = 'INFRAID'
        Visible = False
      end
      object ViewInfraListTYPELINKID: TcxGridDBColumn
        DataBinding.FieldName = 'TYPELINKID'
        Visible = False
      end
      object ViewInfraListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewInfraListMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
      object ViewInfraListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewInfraListID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
      end
      object ViewInfraListID_ADMIN_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        Visible = False
      end
      object ViewInfraListID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
      end
      object ViewInfraListID_MAIN_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_PARENT'
        Visible = False
      end
      object ViewInfraListID_MAIN_CITY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_CITY'
        Visible = False
      end
      object ViewInfraListID_ADMIN_UNIT_SUB: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT_SUB'
        Visible = False
      end
      object ViewInfraListSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        Visible = False
      end
      object ViewInfraListID_CITY_ADM_UNT_ITEMS_TYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
      end
      object ViewInfraListAMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'AMEMO'
        Visible = False
      end
      object ViewInfraListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewInfraListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewDrvSrvLnkList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'LinkId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewDrvSrvLnkListDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewDrvSrvLnkListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 100
        Options.Filtering = False
        Width = 100
      end
      object ViewDrvSrvLnkListHAVECOST: TcxGridDBColumn
        Tag = 100
        Caption = #1054#1087#1083#1072#1090#1072
        DataBinding.FieldName = 'HAVECOST'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1054#1082#1088#1077#1084#1072' '#1087#1083#1072#1090#1072
            Value = 1
          end
          item
            Description = #1054#1087#1083#1072#1095#1091#1108#1090#1100#1089#1103' '#1095#1072#1089#1090#1082#1086#1074#1086
            Value = 2
          end
          item
            Description = #1053#1077#1084#1072#1108' '#1074#1072#1088#1090#1086#1089#1090#1110
            Value = 3
          end
          item
            Value = '-1'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewDrvSrvLnkListCOST: TcxGridDBColumn
        Tag = -100
        DataBinding.FieldName = 'COST'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCOMMENTS: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewDrvSrvLnkListCalcCost: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'CalcCost'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        MinWidth = 133
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 133
      end
      object ViewDrvSrvLnkListCalcPrice: TcxGridDBColumn
        Caption = #1042#1072#1088#1090#1110#1089#1090#1100
        DataBinding.FieldName = 'CalcPrice'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 70
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 70
      end
    end
    object ViewObjLinksCountry: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrCountrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewObjLinksCountryID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
        Options.Filtering = False
      end
      object ViewObjLinksCountryCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
      end
      object ViewObjLinksCountryNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
      end
      object ViewObjLinksCountryNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
      end
      object ViewObjLinksCountryMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaBottom
      end
      object ViewObjLinksCountrySHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        Visible = False
      end
      object ViewObjLinksCountryLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewObjLinksCountryLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewObjLinksCountrySHORTSIGN: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTSIGN'
        Visible = False
      end
      object ViewObjLinksCountryTIMEBIAS: TcxGridDBColumn
        DataBinding.FieldName = 'TIMEBIAS'
        Visible = False
      end
      object ViewObjLinksCountryCCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CCODE'
        Visible = False
      end
      object ViewObjLinksCountryCODE2: TcxGridDBColumn
        DataBinding.FieldName = 'CODE2'
        Visible = False
      end
      object ViewObjLinksCountryCODE3: TcxGridDBColumn
        DataBinding.FieldName = 'CODE3'
        Visible = False
      end
      object ViewObjLinksCountryNEEDVISA: TcxGridDBColumn
        DataBinding.FieldName = 'NEEDVISA'
        Visible = False
      end
      object ViewObjLinksCountryPHONECODEUNI: TcxGridDBColumn
        DataBinding.FieldName = 'PHONECODEUNI'
        Visible = False
      end
    end
    object ViewResort: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ResortSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewResortRESORTID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewResortNAMEPATH: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'NAMEPATH'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 150
      end
      object ViewResortRESORTNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 145
      end
      object ViewResortCITYKIND: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewResortCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewResortID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
      end
      object ViewResortID_MAIN_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_PARENT'
        Visible = False
      end
      object ViewResortID_MAIN_CITY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_CITY'
        Visible = False
      end
      object ViewResortID_ADMIN_UNIT_SUB: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT_SUB'
        Visible = False
      end
      object ViewResortSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.HorzSizing = False
        Width = 32
      end
      object ViewResortID_CITY_ADM_UNT_ITEMS_TYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
      end
      object ViewResortAMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'AMEMO'
        Visible = False
      end
      object ViewResortLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewResortLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewResortTypeList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewResortTypeListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewResortTypeListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewResortTypeListMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
    end
    object ViewKindStreetList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = KINDSTREETSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewKindStreetListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewKindStreetListNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewKindStreetListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewKindStreetListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewKindStreetListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewKindStreet: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = KINDSTREETSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewKindStreetID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
      end
      object ViewKindStreetAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewKindStreetNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
      end
      object ViewKindStreetLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewKindStreetLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewTypeResort: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTypeResortID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewTypeResortNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.HorzSizing = False
        Width = 150
      end
      object ViewTypeResortMEMO: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 512
      end
    end
    object ViewNaturObjType: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewNaturObjTypeID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewNaturObjTypeAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 42
      end
      object ViewNaturObjTypeNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 154
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 154
      end
      object ViewNaturObjTypeMEMO: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewInfraTypes: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'TYPEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewInfraTypesTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewInfraTypesNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 154
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 154
      end
      object ViewInfraTypesCOMMENTS: TcxGridDBColumn
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'COMMENTS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekBlob
        Properties.BlobPaintStyle = bpsText
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 550
      end
    end
    object ViewVisaDoc: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DocumVisaSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewVisaDocID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewVisaDocORDERINCATEGORY: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'ORDERINCATEGORY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 42
      end
      object ViewVisaDocNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Width = 200
      end
      object ViewVisaDocSHORTNAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.HorzSizing = False
        Width = 200
      end
      object ViewVisaDocONETYPEDOC: TcxGridDBColumn
        DataBinding.FieldName = 'ONETYPEDOC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
      end
      object ViewVisaDocMEMO: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 300
      end
      object ViewVisaDocCNTLINK: TcxGridDBColumn
        DataBinding.FieldName = 'CNTLINK'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 94
        Options.HorzSizing = False
      end
    end
    object ViewBank: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BankSrc
      DataController.KeyFieldNames = 'BANKID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBankBANKID: TcxGridDBColumn
        DataBinding.FieldName = 'BANKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBankNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 400
        Options.Filtering = False
        Width = 400
      end
      object ViewBankCOUNTRYID: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'COUNTRYID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewBrCountry
        Properties.KeyFieldNames = 'COUNTRYID'
        Properties.ListFieldItem = ViewBrCountryNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewBankADDRESS: TcxGridDBColumn
        Caption = #1040#1076#1088#1077#1089#1072
        DataBinding.FieldName = 'ADDRESS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 250
        Options.Filtering = False
        Width = 250
      end
      object ViewBankSWIFT: TcxGridDBColumn
        DataBinding.FieldName = 'SWIFT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewBankMFO: TcxGridDBColumn
        DataBinding.FieldName = 'MFO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewBankGLMFO: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1075#1086#1083#1086#1074#1085#1086#1075#1086' '#1052#1060#1054
        DataBinding.FieldName = 'GLMFO'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewBankD_OPEN: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1074#1110#1076#1082#1088'.'
        DataBinding.FieldName = 'D_OPEN'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Nullstring = '0'
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewBankD_CLOSE: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1079#1072#1082#1088'.'
        DataBinding.FieldName = 'D_CLOSE'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewBankPARENTID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBankDEPCODE: TcxGridDBColumn
        Caption = #1044#1077#1087' '#1082#1086#1076
        DataBinding.FieldName = 'DEPCODE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 140
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 140
      end
      object ViewBankMEMO: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewServices: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ServicesSrc
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewServicesSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServicesNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1087#1086#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Width = 200
      end
      object ViewServicesID_UNIT_MEASUR: TcxGridDBColumn
        Caption = #1054#1076#1080#1085'. '#1074#1080#1084'.'
        DataBinding.FieldName = 'ID_UNIT_MEASUR'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewServicesINHOTEL: TcxGridDBColumn
        Caption = #1043#1086#1090'.'
        DataBinding.FieldName = 'INHOTEL'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINBUILD: TcxGridDBColumn
        Caption = #1057#1087#1086#1088'.'
        DataBinding.FieldName = 'INBUILD'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINROOM: TcxGridDBColumn
        Caption = #1053#1086#1084'.'
        DataBinding.FieldName = 'INROOM'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINAUTO: TcxGridDBColumn
        Caption = #1040#1074#1090#1086
        DataBinding.FieldName = 'INAUTO'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINTRAIN: TcxGridDBColumn
        Caption = #1055'-'#1079#1076'.'
        DataBinding.FieldName = 'INTRAIN'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINSHIP: TcxGridDBColumn
        Caption = #1050#1086#1088'.'
        DataBinding.FieldName = 'INSHIP'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINPLANE: TcxGridDBColumn
        Caption = #1051#1110#1090'.'
        DataBinding.FieldName = 'INPLANE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINFOOD: TcxGridDBColumn
        Caption = #1061#1072#1088'.'
        DataBinding.FieldName = 'INFOOD'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINRECRE: TcxGridDBColumn
        Caption = #1054#1079#1076'.'
        DataBinding.FieldName = 'INRECRE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesINRESORT: TcxGridDBColumn
        Caption = #1042#1110#1076#1087'.'
        DataBinding.FieldName = 'INRESORT'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 'T'
        Properties.ValueUnchecked = 'F'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewServicesSMALLICONShow: TcxGridDBColumn
        Tag = -100
        DataBinding.FieldName = 'SMALLICON'
        PropertiesClassName = 'TcxImageProperties'
        MinWidth = 25
        Options.ShowEditButtons = isebNever
        Options.HorzSizing = False
        Width = 25
        IsCaptionAssigned = True
      end
      object ViewServicesSMALLICON: TcxGridDBColumn
        Tag = 100
        Caption = '24x24'
        DataBinding.FieldName = 'SMALLICON'
        PropertiesClassName = 'TcxImageProperties'
        Properties.PopupMenuLayout.MenuItems = [pmiDelete, pmiCustom]
        Properties.PopupMenuLayout.CustomMenuItemCaption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080
        Properties.PopupMenuLayout.CustomMenuItemGlyph.Data = {
          76020000424D76020000000000003600000028000000100000000C0000000100
          18000000000040020000120B0000120B00000000000000000000FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFF00000000000000FFFFF0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFF000000FFFFFFFFFFFF00000000FFFF
          00000000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFF000000FFFFFF000000FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F0000000FFFFFF00000000FFFF
          FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFFF0F0F0000000000000FFFFFF00FFFFFFFFFF00000000000000000000
          0000000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFF00000000000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000000000000000000000
          00000000000000FFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF000000FFFFFFFFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFF0000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 34
        Options.Filtering = False
        Options.HorzSizing = False
        Options.SortByDisplayText = isbtOn
        Width = 34
      end
      object ViewServicesLARGEICON: TcxGridDBColumn
        Tag = 100
        Caption = '32x32'
        DataBinding.FieldName = 'LARGEICON'
        PropertiesClassName = 'TcxImageProperties'
        Properties.PopupMenuLayout.MenuItems = [pmiDelete, pmiCustom]
        Properties.PopupMenuLayout.CustomMenuItemCaption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080
        Properties.PopupMenuLayout.CustomMenuItemGlyph.Data = {
          76020000424D76020000000000003600000028000000100000000C0000000100
          18000000000040020000120B0000120B00000000000000000000FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFF00000000000000FFFFF0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFF000000FFFFFFFFFFFF00000000FFFF
          00000000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFF000000FFFFFF000000FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F0000000FFFFFF00000000FFFF
          FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFFF0F0F0000000000000FFFFFF00FFFFFFFFFF00000000000000000000
          0000000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFF00000000000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000000000000000000000
          00000000000000FFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF000000FFFFFFFFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFF0000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 34
        Options.Filtering = False
        Options.HorzSizing = False
        Options.SortByDisplayText = isbtOn
        Width = 34
      end
      object ViewServicesSERVGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVGROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewServicesMEMO: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServicesHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServicesINFO: TcxGridDBColumn
        DataBinding.FieldName = 'INFO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServicesHAVECOST: TcxGridDBColumn
        DataBinding.FieldName = 'HAVECOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServicesMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServicesLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewServicesLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewHtlGrp: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'HOTELGROUPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlGrpHOTELGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELGROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewHtlGrpLOGOIMAGE: TcxGridDBColumn
        Tag = 100
        Caption = #1051#1086#1075#1086#1090#1080#1087
        DataBinding.FieldName = 'LOGOIMAGE'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewHtlGrpLOGOIMAGE2: TcxGridDBColumn
        Tag = -100
        MinWidth = 30
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 30
        IsCaptionAssigned = True
      end
      object ViewHtlGrpNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 250
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 250
      end
      object ViewHtlGrpWEBSITE: TcxGridDBColumn
        Caption = #1057#1072#1081#1090
        DataBinding.FieldName = 'WEBSITE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Width = 200
      end
      object ViewHtlGrpMEMO: TcxGridDBColumn
        Tag = 100
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Properties.MemoWantReturns = False
        Properties.MemoWantTabs = False
        Properties.MemoWordWrap = False
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 245
      end
    end
    object ViewHtkKind: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HotelKindSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtkKindID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtkKindAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 32
      end
      object ViewHtkKindNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHtkKindLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHtkKindLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewRoomExpandName: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ExpandNameSrc
      DataController.KeyFieldNames = 'EXPANDNAMEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewRoomExpandNameEXPANDNAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'EXPANDNAMEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewRoomExpandNameEXPANDNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'EXPANDNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Width = 200
      end
      object ViewRoomExpandNameEXTNAME: TcxGridDBColumn
        Caption = #1057#1082#1086#1088#1086#1095'.'
        DataBinding.FieldName = 'EXTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
      object ViewRoomExpandNameCOMMENTS: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRoomExpandNameLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewRoomExpandNameLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewRoomExpandNameLNGCHANGE_EX: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE_EX'
        Visible = False
      end
    end
    object ViewAdminUnit: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = Admin_unitSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewAdminUnitID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewAdminUnitNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 150
      end
      object ViewAdminUnitNAMESHORT: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'NAMESHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewAdminUnitTYPE: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 120
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 120
      end
      object ViewAdminUnitLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewAdminUnitLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewAdminUnitTYPESHOW: TcxGridDBColumn
        Caption = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080
        DataBinding.FieldName = 'TYPESHOW'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Items = <
          item
            ImageIndex = 0
          end
          item
            Description = #1057#1087#1077#1088#1077#1076#1091
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1042' '#1082#1110#1085#1094#1110
            Value = 1
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
    end
    object ViewAdminUnitList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = Admin_unitSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewAdminUnitListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewAdminUnitListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewAdminUnitListNAMESHORT: TcxGridDBColumn
        DataBinding.FieldName = 'NAMESHORT'
        Visible = False
      end
      object ViewAdminUnitListTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
      end
      object ViewAdminUnitListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewAdminUnitListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewCityAdminUnit: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = City_Admin_UnitSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCityAdminUnitID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityAdminUnitID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityAdminUnitNAME: TcxGridDBColumn
        Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1081' '#1087#1091#1085#1082#1090
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 545
      end
      object ViewCityAdminUnitID_ADMIN_UNIT: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1080
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewAdminUnitList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewAdminUnitListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewCityAdminUnitID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityAdminUnitID_MAIN_CITY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_CITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityAdminUnitATYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ATYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewAdminUnitSub: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ADMIN_UNIT_SUBSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewAdminUnitSubID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewAdminUnitSubAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewAdminUnitSubCheck: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Visible = False
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewAdminUnitSubNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewAdminUnitSubID_ADMIN_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewAdminUnitSubLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewAdminUnitSubLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewAdminUnitSubList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ADMIN_UNIT_SUBSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewAdminUnitSubListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewAdminUnitSubListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewAdminUnitSubListID_ADMIN_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewAdminUnitSubListSheck: TcxGridDBColumn
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        Visible = False
        MinWidth = 32
        Options.HorzSizing = False
        Width = 32
      end
      object ViewAdminUnitSubListNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 656
      end
      object ViewAdminUnitSubListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewAdminUnitSubListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewCITY_ADM_UNT_ITEMS_TYPE: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CITY_ADM_UNT_ITEMS_TYPESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCITY_ADM_UNT_ITEMS_TYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCITY_ADM_UNT_ITEMS_TYPEAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 35
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 35
      end
      object ViewCITY_ADM_UNT_ITEMS_TYPENAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 566
      end
      object ViewCITY_ADM_UNT_ITEMS_TYPEID_PARENT_FORTREE: TcxGridDBColumn
        Caption = 'ID '#1087#1072#1088#1077#1085#1090
        DataBinding.FieldName = 'ID_PARENT_FORTREE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 83
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 83
      end
    end
    object ViewCITY_ADM_UNT_ITEMS_TYPEList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CITY_ADM_UNT_ITEMS_TYPESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCITY_ADM_UNT_ITEMS_TYPEListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Sorting = False
      end
      object ViewCITY_ADM_UNT_ITEMS_TYPEListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Options.Sorting = False
      end
      object ViewCITY_ADM_UNT_ITEMS_TYPEListID_PARENT_FORTREE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT_FORTREE'
        Visible = False
        Options.Sorting = False
      end
      object ViewCITY_ADM_UNT_ITEMS_TYPEListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
      end
    end
    object ViewCountryCityAdminUnit: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrCountrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCountryCityAdminUnitCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            ImageIndex = 61
            Value = 'T'
          end
          item
            Value = 'F'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 24
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 24
      end
      object ViewCountryCityAdminUnitLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitSHORTSIGN: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTSIGN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitTIMEBIAS: TcxGridDBColumn
        DataBinding.FieldName = 'TIMEBIAS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitCCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CCODE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitCODE2: TcxGridDBColumn
        DataBinding.FieldName = 'CODE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitCODE3: TcxGridDBColumn
        DataBinding.FieldName = 'CODE3'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitNEEDVISA: TcxGridDBColumn
        DataBinding.FieldName = 'NEEDVISA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryCityAdminUnitPHONECODEUNI: TcxGridDBColumn
        DataBinding.FieldName = 'PHONECODEUNI'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewCOMPANIES_PARAM_DATAList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCOMPANIES_PARAM_DATAListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_DATAListID_COMPANIES: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COMPANIES'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_DATAListID_COMPANIES_PARAM_NAME: TcxGridDBColumn
        Caption = #1042#1080#1076' '#1076#1110#1103#1083#1100#1085#1086#1089#1090#1110
        DataBinding.FieldName = 'ID_COMPANIES_PARAM_NAME'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewCOMPANIES_PARAM_NAMEList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewCOMPANIES_PARAM_NAMEListDESCRIPT
      end
      object ViewCOMPANIES_PARAM_DATAListAVALUE: TcxGridDBColumn
        Caption = #1047#1085#1072#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'AVALUE'
        Visible = False
        Width = 143
      end
      object ViewCOMPANIES_PARAM_DATAListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_DATAListATYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ATYPE'
        Visible = False
      end
    end
    object ViewCOMPANIES_PARAM_NAMEList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMPANIES_PARAM_NAMESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCOMPANIES_PARAM_NAMEListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_NAMEListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
      end
      object ViewCOMPANIES_PARAM_NAMEListDESCRIPT: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPT'
      end
      object ViewCOMPANIES_PARAM_NAMEListATYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ATYPE'
        Visible = False
      end
    end
    object ViewCOMPANIES_PARAM_NAME: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMPANIES_PARAM_NAMESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCOMPANIES_PARAM_NAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCOMPANIES_PARAM_NAMENAME: TcxGridDBColumn
        Caption = #1050#1083#1102#1095' (En)'
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 120
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 120
      end
      object ViewCOMPANIES_PARAM_NAMEDESCRIPT: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'DESCRIPT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCOMPANIES_PARAM_NAMEATYPE: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'ATYPE'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewCOMPANIES_PARAM_KINDList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewCOMPANIES_PARAM_KINDListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 200
      end
    end
    object ViewCOMPANIES_PARAM_KIND: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMPANIES_PARAM_KINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCOMPANIES_PARAM_KINDID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCOMPANIES_PARAM_KINDAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 39
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 39
      end
      object ViewCOMPANIES_PARAM_KINDNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 645
      end
    end
    object ViewCOMPANIES_PARAM_KINDList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMPANIES_PARAM_KINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCOMPANIES_PARAM_KINDListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Filtering = False
      end
      object ViewCOMPANIES_PARAM_KINDListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        Options.Filtering = False
      end
      object ViewCOMPANIES_PARAM_KINDListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Options.Filtering = False
      end
    end
    object ViewCOMPANIES_PARAM_NAMEByGroup: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMPANIES_PARAM_NAMESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCOMPANIES_PARAM_NAMEByGroupID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Sorting = False
      end
      object ViewCOMPANIES_PARAM_NAMEByGroupNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
        Options.Sorting = False
      end
      object ViewCOMPANIES_PARAM_NAMEByGroupDESCRIPT: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPT'
        Options.Sorting = False
      end
      object ViewCOMPANIES_PARAM_NAMEByGroupATYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ATYPE'
        Visible = False
        Options.Sorting = False
      end
      object ViewCOMPANIES_PARAM_NAMEByGroupKINDNAME: TcxGridDBColumn
        Caption = #1042#1080#1076
        DataBinding.FieldName = 'KINDNAME'
        Visible = False
        GroupIndex = 0
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewCOMPANIES_PARAM_NAMEByGroupAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        SortIndex = 1
        SortOrder = soAscending
      end
    end
    object ViewComunicationType: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = Comunication_TypeSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewComunicationTypeID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewComunicationTypeAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 42
      end
      object ViewComunicationTypeNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 301
      end
      object ViewComunicationTypeWEBLINK: TcxGridDBColumn
        Caption = #1051#1110#1085#1082
        DataBinding.FieldName = 'WEBLINK'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 624
      end
      object ViewComunicationTypeTEMPLATE: TcxGridDBColumn
        Caption = #1064#1072#1073#1083#1086#1085' '#1074#1074#1086#1076#1091
        DataBinding.FieldName = 'TEMPLATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 300
      end
      object ViewComunicationTypeFORMAT_OUT: TcxGridDBColumn
        Caption = #1060#1086#1088#1084#1072#1090' '#1074#1080#1074#1086#1076#1091
        DataBinding.FieldName = 'FORMAT_OUT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 300
      end
      object ViewComunicationTypeUSECODECOUNTRY: TcxGridDBColumn
        Caption = #1055#1088#1077#1092#1110#1082#1089
        DataBinding.FieldName = 'USECODECOUNTRY'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            ImageIndex = 0
          end
          item
            Description = #1050#1086#1076' '#1082#1088#1072#1111#1085#1080
            Value = 1
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
      object ViewComunicationTypeICON: TcxGridDBColumn
        Caption = #1030#1082#1086#1085#1082#1072
        DataBinding.FieldName = 'ICON'
        PropertiesClassName = 'TcxImageProperties'
        Properties.PopupMenuLayout.MenuItems = [pmiCustom]
        Properties.PopupMenuLayout.CustomMenuItemCaption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080
        Properties.PopupMenuLayout.CustomMenuItemGlyph.Data = {
          76020000424D76020000000000003600000028000000100000000C0000000100
          18000000000040020000120B0000120B00000000000000000000FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFF00000000000000FFFFF0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFF000000FFFFFFFFFFFF00000000FFFF
          00000000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFF000000FFFFFF000000FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F0000000FFFFFF00000000FFFF
          FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFFF0F0F0000000000000FFFFFF00FFFFFFFFFF00000000000000000000
          0000000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFF00000000000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000000000000000000000
          00000000000000FFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF000000FFFFFFFFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFF0000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
      end
      object ViewComunicationTypeColumn1: TcxGridDBColumn
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.MaskKind = emkRegExprEx
        Properties.EditMask = '(http:\/\/www|https:\/\/www|ftp:\/\/www|www)([.][\S]+)'
        Visible = False
      end
    end
    object ViewComunicationTypeList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = Comunication_TypeSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewComunicationTypeListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewComunicationTypeListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        MinWidth = 64
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewComunicationTypeListICON: TcxGridDBColumn
        DataBinding.FieldName = 'ICON'
        PropertiesClassName = 'TcxImageProperties'
        Width = 42
        IsCaptionAssigned = True
      end
      object ViewComunicationTypeListNAME: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'NAME'
        Width = 300
      end
      object ViewComunicationTypeListWEBLINK: TcxGridDBColumn
        DataBinding.FieldName = 'WEBLINK'
        Visible = False
        Width = 400
      end
      object ViewComunicationTypeListTEMPLATE: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLATE'
        Visible = False
      end
      object ViewComunicationTypeListUSECODECOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'USECODECOUNTRY'
        Visible = False
      end
    end
    object ViewCityAdminUnitList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = City_Admin_UnitSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewCityAdminUnitListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewCityAdminUnitListID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
      end
      object ViewCityAdminUnitListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
    end
    object ViewDrvSrvLnk: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'LINKID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewDrvSrvLnkDRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkINTVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INTVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkHAVECOST: TcxGridDBColumn
        DataBinding.FieldName = 'HAVECOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCOST: TcxGridDBColumn
        DataBinding.FieldName = 'COST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'CURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
      object ViewDrvSrvLnkCOMMENTS: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'COMMENTS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
      end
      object ViewDrvSrvLnkLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcValue: TcxGridDBColumn
        DataBinding.FieldName = 'CalcValue'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcHaveCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHaveCost'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcMemo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcMemo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvSrvLnkCalcPrice: TcxGridDBColumn
        DataBinding.FieldName = 'CalcPrice'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewPASSPORTKINDS: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = PASSPORTKINDSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewPASSPORTKINDSID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewPASSPORTKINDSAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 43
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 43
      end
      object ViewPASSPORTKINDSNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 330
      end
      object ViewPASSPORTKINDSSHORTNAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 112
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 112
      end
      object ViewPASSPORTKINDSLAT: TcxGridDBColumn
        Caption = #1051#1072#1090'.'
        DataBinding.FieldName = 'LAT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 111
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 111
      end
      object ViewPASSPORTKINDSLATNAME: TcxGridDBColumn
        Caption = #1051#1072#1090'. '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'LATNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 126
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 126
      end
      object ViewPASSPORTKINDSVALIDYEARS: TcxGridDBColumn
        Caption = #1044#1099#1081#1089#1085#1080#1081' ('#1088#1086#1082#1110#1074')'
        DataBinding.FieldName = 'VALIDYEARS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
    end
    object ViewSTATUSDOC: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = STATUSDOCSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewSTATUSDOCID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSTATUSDOCAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 64
      end
      object ViewSTATUSDOCNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 639
      end
    end
    object ViewREPOSKIND: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = REPOSKINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewREPOSKINDID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewREPOSKINDAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewREPOSKINDNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewREPOSKINDSHORTNAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 154
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewREPOSKINDKIND: TcxGridDBColumn
        Caption = #1042#1080#1076
        DataBinding.FieldName = 'KIND'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewREPOSKINDVISIBLED: TcxGridDBColumn
        Caption = #1042#1080#1076#1080#1084#1080#1081
        DataBinding.FieldName = 'VISIBLED'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewSPONSOR: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SPONSORSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewSPONSORID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSPONSORAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewSPONSORNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewPAYMENT_BYSPONSOR: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = PAYMENT_BYSPONSORSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewPAYMENT_BYSPONSORID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Filtering = False
      end
      object ViewPAYMENT_BYSPONSORAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewPAYMENT_BYSPONSORNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewMismatch: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = MISMATCHSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewMismatchID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewMismatchAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewMismatchNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewVisaDocType: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = VISADOCTYPESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewVisaDocTypeID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaDocTypeAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewVisaDocTypeNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaDocTypeSHORTNAME: TcxGridDBColumn
        Caption = #1050#1086#1088#1086#1090#1082#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 154
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewDocFor: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DOCFORSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewDocForID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDocForAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewDocForNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewCreditCards: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CREDITCARDSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCreditCardsID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCreditCardsAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewCreditCardsNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewManagesList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = UsersSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewManagesListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewManagesListMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'MANAGER'
      end
      object ViewManagesListCOMPPERSONID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPPERSONID'
        Visible = False
      end
    end
  end
  object EmbassyListQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'COUNTRYID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        ' select distinct Co.CompanyId, Co.Name || '#39', '#39' || Ci.Name as Emb' +
        'assyName, E.embassyid, E.countryid, O.countryid OFFICECOUNTRY'
      '  from Companies Co'
      
        '  left join  CntrEmbassies E on E.EmbassyId = Co.CompanyId and E' +
        '.CountryId = :COUNTRYID'
      '  left join CompOffices O on O.CompanyId = Co.CompanyId'
      '  left join city_adm_unit Ci on Ci.id = O.id_city_adm_unit'
      ' where Co.AsAmbas = '#39'T'#39' and E.ParentId is null'
      ' order by Co.Name, Ci.Name')
    Left = 764
    Top = 521
    object EmbassyListQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object EmbassyListQryEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
    end
    object EmbassyListQryEMBASSYNAME: TIBStringField
      DisplayLabel = #1055#1088#1077#1076#1089#1090#1072#1074#1085#1080#1094#1090#1074#1086
      FieldName = 'EMBASSYNAME'
      ProviderFlags = []
      Size = 292
    end
    object EmbassyListQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"CNTREMBASSIES"."COUNTRYID"'
    end
    object EmbassyListQryOFFICECOUNTRY: TIntegerField
      FieldName = 'OFFICECOUNTRY'
      Origin = '"COMPOFFICES"."COUNTRYID"'
    end
  end
  object EmbassyListSrc: TDataSource
    DataSet = EmbassyListQry
    Left = 766
    Top = 573
  end
  object BrHotelQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = HCitySrc
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select H.*,'
      '      G.Name HotelGroup, C.Name CityName,'
      
        '     ( Select NAME FROM COUNTRIES_LNG where ID_COUNTRIES = H.cou' +
        'ntryid and ID_LNG = 350 ) COUNTRY_ENG,'
      
        '      ( select sum((N.Capacity + N.AddCapacity) * N.RoomCount) f' +
        'rom HtlRooms N'
      
        '        where N.HotelId = H.HotelId and (N.Deleted is null or N.' +
        'Deleted = '#39'F'#39') ) HotelCapacity ,'
      '      ( CASE'
      
        '       WHEN (exists (select * from htlrooming r where r.hotelid ' +
        '= H.HotelId )'
      
        '            or exists (select * from htlroommaps r where r.hotel' +
        'id = H.HotelId ) ) THEN '#39'T'#39
      '       ELSE '#39'F'#39
      '      END ) AreRoom ,'
      '      ( CASE'
      
        '       WHEN (exists (select * from ImportHotelLog hl where hl.ho' +
        'telid = H.HotelId )) THEN '#39'T'#39
      '       ELSE '#39'F'#39
      '       END) Imported,'
      '      ( select cast(K.name as varchar(15)) from HOTELKIND K'
      '       where K.id = H.hotelkind ) HotelKindName,'
      '  '
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join hotels_lng on hotels_lng.id_lng = Languages.id a' +
        'nd hotels_lng.ID_HOTELS = H.HOTELID'
      
        '      where Languages.active_translate is not null and hotels_ln' +
        'g.id_lng is null ) LNGNOTFOUND,'
      
        '    ( select sum(hotels_lng.change_name ) from hotels_lng where ' +
        'hotels_lng.ID_HOTELS = H.HOTELID ) LNGCHANGE ,'
      ''
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Langua' +
        'ges.id and HOTELCLASS_lng.id_hotelclass = H.CATCLASS1'
      
        '      where Languages.active_translate is not null and HOTELCLAS' +
        'S_lng.id_lng is null and H.catclass1 is not null ) LNGNOTFOUND_C' +
        'L1,'
      
        '    ( select sum(HOTELCLASS_lng.change_name ) from HOTELCLASS_ln' +
        'g where HOTELCLASS_lng.id_hotelclass = H.CATCLASS1 ) LNGCHANGE_C' +
        'L1,'
      ''
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Langua' +
        'ges.id and HOTELCLASS_lng.id_hotelclass = H.catclass2'
      
        '      where Languages.active_translate is not null and HOTELCLAS' +
        'S_lng.id_lng is null and H.catclass2 is not null ) LNGNOTFOUND_C' +
        'L2,'
      
        '    ( select sum(HOTELCLASS_lng.change_name ) from HOTELCLASS_ln' +
        'g where HOTELCLASS_lng.id_hotelclass = H.CATCLASS2 ) LNGCHANGE_C' +
        'L2,'
      ''
      '    ( select Count(Languages.ID) from Languages'
      
        '      left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Langua' +
        'ges.id and HOTELCLASS_lng.id_hotelclass = H.catclass3'
      
        '      where Languages.active_translate is not null and HOTELCLAS' +
        'S_lng.id_lng is null and H.catclass3 is not null  ) LNGNOTFOUND_' +
        'CL3,'
      
        '    ( select sum(HOTELCLASS_lng.change_name ) from HOTELCLASS_ln' +
        'g where HOTELCLASS_lng.id_hotelclass = H.CATCLASS2 ) LNGCHANGE_C' +
        'L3'
      ''
      '    from Hotels H'
      '      left join HtlGrps G on G.HotelGroupId = H.GroupId'
      '      left join CITY_ADM_UNIT C on C.Id = H.ID_CITY_ADM_UNIT'
      '      where  H.ID_CITY_ADM_UNIT =  :ID')
    Left = 25
    Top = 653
    object BrHotelQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
      ProviderFlags = []
    end
    object BrHotelQrySTARS: TIBStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'STARS'
      ProviderFlags = []
      Size = 10
    end
    object BrHotelQryGROUPID: TIntegerField
      FieldName = 'GROUPID'
      ProviderFlags = []
    end
    object BrHotelQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object BrHotelQryHOTELKIND: TSmallintField
      FieldName = 'HOTELKIND'
      ProviderFlags = []
    end
    object BrHotelQryCATEGORYID: TIntegerField
      FieldName = 'CATEGORYID'
      ProviderFlags = []
    end
    object BrHotelQrySTRANGER: TIBStringField
      FieldName = 'STRANGER'
      ProviderFlags = []
      Size = 1
    end
    object BrHotelQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      ProviderFlags = []
    end
    object BrHotelQryENTERPRISEID: TIntegerField
      FieldName = 'ENTERPRISEID'
      ProviderFlags = []
    end
    object BrHotelQrySHOWWEB: TIBStringField
      DisplayLabel = 'Web'
      FieldName = 'SHOWWEB'
      ProviderFlags = []
      Size = 1
    end
    object BrHotelQryURL: TMemoField
      FieldName = 'URL'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object BrHotelQryWEBCOMMENTS: TMemoField
      FieldName = 'WEBCOMMENTS'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object BrHotelQrySHOWWEB2: TIBStringField
      FieldName = 'SHOWWEB2'
      ProviderFlags = []
      Size = 1
    end
    object BrHotelQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
      ProviderFlags = []
    end
    object BrHotelQryNAME: TIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1075#1086#1090#1077#1083#1102
      FieldName = 'NAME'
      ProviderFlags = []
      Size = 35
    end
    object BrHotelQryLANGUAGES: TIBStringField
      FieldName = 'LANGUAGES'
      ProviderFlags = []
      Size = 50
    end
    object BrHotelQryCATCLASS1: TIntegerField
      FieldName = 'CATCLASS1'
      ProviderFlags = []
    end
    object BrHotelQryCATCLASS2: TIntegerField
      FieldName = 'CATCLASS2'
      ProviderFlags = []
    end
    object BrHotelQryCATCLASS3: TIntegerField
      FieldName = 'CATCLASS3'
      ProviderFlags = []
    end
    object BrHotelQryTODELETE: TSmallintField
      FieldName = 'TODELETE'
      ProviderFlags = []
    end
    object BrHotelQryPLACECOMMENTS: TMemoField
      FieldName = 'PLACECOMMENTS'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object BrHotelQryDESCRCOMMENTS: TMemoField
      FieldName = 'DESCRCOMMENTS'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object BrHotelQryINROOMCOMMENTS: TMemoField
      FieldName = 'INROOMCOMMENTS'
      ProviderFlags = []
      BlobType = ftMemo
    end
    object BrHotelQryADDRESS: TIBStringField
      FieldName = 'ADDRESS'
      ProviderFlags = []
      Size = 250
    end
    object BrHotelQryALTNAME: TIBStringField
      FieldName = 'ALTNAME'
      ProviderFlags = []
      Size = 250
    end
    object BrHotelQryDISABLED: TIBStringField
      FieldName = 'DISABLED'
      ProviderFlags = []
      Size = 1
    end
    object BrHotelQryCOUNTRY_ENG: TIBStringField
      FieldName = 'COUNTRY_ENG'
      ProviderFlags = []
      Size = 300
    end
    object BrHotelQryHOTELCAPACITY: TLargeintField
      DisplayLabel = #1042#1084#1110#1089#1090
      FieldName = 'HOTELCAPACITY'
      ProviderFlags = []
    end
    object BrHotelQryAREROOM: TIBStringField
      DisplayLabel = #1055#1088#1086#1078#1080#1074#1072#1083#1080
      FieldName = 'AREROOM'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object BrHotelQryIMPORTED: TIBStringField
      DisplayLabel = 'Booking'
      FieldName = 'IMPORTED'
      ProviderFlags = []
      FixedChar = True
      Size = 1
    end
    object BrHotelQryHOTELKINDNAME: TIBStringField
      DisplayLabel = #1058#1080#1087
      FieldName = 'HOTELKINDNAME'
      ProviderFlags = []
      Size = 15
    end
    object BrHotelQryCITYNAME: TIBStringField
      FieldName = 'CITYNAME'
      ProviderFlags = []
      Size = 190
    end
    object BrHotelQryHOTELGROUP: TIBStringField
      FieldName = 'HOTELGROUP'
      ProviderFlags = []
      Size = 35
    end
    object BrHotelQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object BrHotelQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
      ProviderFlags = []
    end
    object BrHotelQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
    object BrHotelQryLNGCHANGE_CL1: TLargeintField
      FieldName = 'LNGCHANGE_CL1'
    end
    object BrHotelQryLNGNOTFOUND_CL1: TLargeintField
      FieldName = 'LNGNOTFOUND_CL1'
    end
    object BrHotelQryLNGCHANGE_CL2: TLargeintField
      FieldName = 'LNGCHANGE_CL2'
    end
    object BrHotelQryLNGNOTFOUND_CL2: TLargeintField
      FieldName = 'LNGNOTFOUND_CL2'
    end
    object BrHotelQryLNGNOTFOUND_CL3: TLargeintField
      FieldName = 'LNGNOTFOUND_CL3'
    end
    object BrHotelQryLNGCHANGE_CL3: TLargeintField
      FieldName = 'LNGCHANGE_CL3'
    end
    object BrHotelQryCITYID: TIntegerField
      FieldName = 'CITYID'
    end
  end
  object BrHotelSrc: TDataSource
    DataSet = BrHotelQry
    Left = 28
    Top = 701
  end
  object HtlBuildQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrHotelSrc
    Parameters = <
      item
        Name = 'HotelId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select H.HotelBuildId, H.HotelId, H.BuildId, H.Deleted, H.Commen' +
        'ts,  H.Stars,'
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join HOTEL_BUILDS_lng on HOTEL_BUILDS_lng.id_lng = Langua' +
        'ges.id and HOTEL_BUILDS_lng.id_hotel_builds = H.buildid'
      
        '  where Languages.active_translate is not null and HOTEL_BUILDS_' +
        'lng.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( HOTEL_BUILDS_lng.change_name ) from HOTEL_BUILDS' +
        '_lng where HOTEL_BUILDS_lng.id_hotel_builds = H.buildid ) LNGCHA' +
        'NGE'
      ''
      'from HtlBuilds H'
      'where H.HotelId = :HotelId')
    Left = 319
    Top = 781
    object HtlBuildQryHOTELBUILDID: TIntegerField
      FieldName = 'HOTELBUILDID'
    end
    object HtlBuildQryBUILDID: TIntegerField
      FieldName = 'BUILDID'
    end
    object HtlBuildQryDELETED: TStringField
      FieldName = 'DELETED'
      Size = 1
    end
    object HtlBuildQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object HtlBuildQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object HtlBuildQrySTARS: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'STARS'
      Size = 7
    end
    object HtlBuildQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object HtlBuildQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
  end
  object HtlBuildSrc: TDataSource
    DataSet = HtlBuildQry
    Left = 319
    Top = 829
  end
  object HtlRoomQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'HOTELBUILDID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select H.HotelRoomId, H.RoomTypeId,  H.Capacity,'
      '  H.HotelId, H.BuildId, H.Comments, H.ChildTo,'
      
        '  H.RoomCount, H.AddCapacity, H.MinPerson, H.AddCapAdult, H.Dele' +
        'ted,'
      '  H.ExpandNameId,'
      '  H.RoomArea, H.Imported,'
      ''
      ' ( select Count(Languages.ID) from Languages'
      
        '  left join ROOMTYPES_lng on ROOMTYPES_lng.id_lng = Languages.id' +
        ' and ROOMTYPES_lng.id_roomtypes = H.RoomTypeId'
      
        '  where Languages.active_translate is not null and ROOMTYPES_lng' +
        '.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( ROOMTYPES_lng.change_roomtype ) from ROOMTYPES_l' +
        'ng where ROOMTYPES_lng.id_roomtypes = H.RoomTypeId ) LNGCHANGE'
      ''
      'from HtlRooms H'
      '  where H.BuildId = :HotelBuildId')
    Left = 383
    Top = 781
    object HtlRoomQryHOTELROOMID: TIntegerField
      FieldName = 'HOTELROOMID'
    end
    object HtlRoomQryROOMTYPEID: TIntegerField
      FieldName = 'ROOMTYPEID'
    end
    object HtlRoomQryROOMCOUNT: TSmallintField
      DisplayLabel = #1050#1110#1083#1100#1082#1110#1089#1090#1100
      FieldName = 'ROOMCOUNT'
    end
    object HtlRoomQryADDCAPACITY: TSmallintField
      DisplayLabel = #1044#1086#1076'.'
      FieldName = 'ADDCAPACITY'
    end
    object HtlRoomQryADDCAPADULT: TSmallintField
      DisplayLabel = #1044#1086#1088'.'
      FieldName = 'ADDCAPADULT'
    end
    object HtlRoomQryDELETED: TStringField
      FieldName = 'DELETED'
      Size = 1
    end
    object HtlRoomQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object HtlRoomQryBUILDID: TIntegerField
      FieldName = 'BUILDID'
    end
    object HtlRoomQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object HtlRoomQryCHILDTO: TSmallintField
      FieldName = 'CHILDTO'
    end
    object HtlRoomQryCalcChildTo: TStringField
      DisplayLabel = #1044#1110#1090#1080' '#1076#1086
      FieldKind = fkCalculated
      FieldName = 'CalcChildTo'
      Size = 10
      Calculated = True
    end
    object HtlRoomQryCAPACITY: TSmallintField
      FieldName = 'CAPACITY'
    end
    object HtlRoomQryMINPERSON: TSmallintField
      FieldName = 'MINPERSON'
    end
    object HtlRoomQryEXPANDNAMEID: TIntegerField
      FieldName = 'EXPANDNAMEID'
    end
    object HtlRoomQryROOMAREA: TIntegerField
      FieldName = 'ROOMAREA'
    end
    object HtlRoomQryIMPORTED: TStringField
      FieldName = 'IMPORTED'
      Size = 1
    end
    object HtlRoomQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object HtlRoomQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object HtlRoomSrc: TDataSource
    DataSet = HtlRoomQry
    Left = 384
    Top = 829
  end
  object HtlImgQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'HotelId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select HtlImages.*, R.BuildId from HtlImages'
      '    left join HtlRooms R on R.HotelRoomId = HtlImages.ObjectId'
      '    where HtlImages.HotelId = :HotelId'
      'order by HtlImages.ImgKind, HtlImages.OrderNo')
    Left = 26
    Top = 781
    object HtlImgQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
      Origin = 'DICT.HTLIMAGES.HOTELID'
    end
    object HtlImgQryHOTELIMAGEID: TIntegerField
      FieldName = 'HOTELIMAGEID'
      Origin = 'DICT.HTLIMAGES.HOTELIMAGEID'
    end
    object HtlImgQryFILENAME: TStringField
      DisplayLabel = #1060#1072#1081#1083' '#1084#1072#1083#1102#1085#1082#1091
      FieldName = 'FILENAME'
      Origin = 'DICT.HTLIMAGES.FILENAME'
      Size = 128
    end
    object HtlImgQryORDERNO: TIntegerField
      FieldName = 'ORDERNO'
      Origin = 'DICT.HTLIMAGES.ORDERNO'
    end
    object HtlImgQryDESCRIPT: TMemoField
      FieldName = 'DESCRIPT'
      Origin = 'DICT.HTLIMAGES.DESCRIPT'
      BlobType = ftMemo
    end
    object HtlImgQryIMGKIND: TSmallintField
      FieldName = 'IMGKIND'
      Origin = 'DICT.HTLIMAGES.IMGKIND'
    end
    object HtlImgQrySHOWLOC: TStringField
      Alignment = taCenter
      FieldName = 'SHOWLOC'
      Origin = 'DICT.HTLIMAGES.SHOWLOC'
      Size = 1
    end
    object HtlImgQrySHOWWEB: TStringField
      Alignment = taCenter
      DisplayLabel = 'Web'
      FieldName = 'SHOWWEB'
      Origin = 'DICT.HTLIMAGES.SHOWWEB'
      Size = 1
    end
    object HtlImgQryCalcFileName: TStringField
      DisplayLabel = #1060#1086#1090#1086' '#1095#1080' '#1084#1072#1083#1102#1085#1086#1082
      FieldKind = fkCalculated
      FieldName = 'CalcFileName'
      Size = 50
      Calculated = True
    end
    object HtlImgQryTABLEID: TIntegerField
      FieldName = 'TABLEID'
    end
    object HtlImgQryOBJECTID: TIntegerField
      FieldName = 'OBJECTID'
    end
    object HtlImgQryBUILDID: TIntegerField
      FieldName = 'BUILDID'
    end
  end
  object HtlImgSrc: TDataSource
    DataSet = HtlImgQry
    Left = 26
    Top = 821
  end
  object HtlDocQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'HOTELID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from HtlDocuments'
      'where HotelId = :HotelId'
      'order by OrderNo')
    Left = 103
    Top = 788
    object HtlDocQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
      Origin = 'DICT.HTLDOCUMENTS.HOTELID'
    end
    object HtlDocQryHOTELDOCID: TIntegerField
      FieldName = 'HOTELDOCID'
      Origin = 'DICT.HTLDOCUMENTS.HOTELDOCID'
    end
    object HtlDocQryFILENAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1092#1072#1081#1083#1091
      FieldName = 'FILENAME'
      Origin = 'DICT.HTLDOCUMENTS.FILENAME'
      Size = 128
    end
    object HtlDocQryDESCRIPT: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'DESCRIPT'
      Origin = 'DICT.HTLDOCUMENTS.DESCRIPT'
      Size = 60
    end
    object HtlDocQrySHOWLOC: TStringField
      Alignment = taCenter
      FieldName = 'SHOWLOC'
      Origin = 'DICT.HTLDOCUMENTS.SHOWLOC'
      Size = 1
    end
    object HtlDocQrySHOWWEB: TStringField
      Alignment = taCenter
      DisplayLabel = 'Web'
      FieldName = 'SHOWWEB'
      Origin = 'DICT.HTLDOCUMENTS.SHOWWEB'
      Size = 1
    end
    object HtlDocQryCalcFileName: TStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldKind = fkCalculated
      FieldName = 'CalcFileName'
      Size = 50
      Calculated = True
    end
    object HtlDocQryORDERNO: TIntegerField
      FieldName = 'ORDERNO'
    end
  end
  object HtlDocSrc: TDataSource
    DataSet = HtlDocQry
    Left = 106
    Top = 833
  end
  object HtlGrpQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        ' select HotelGroupId, Name, FullName, LogoImage, WebSite, addman' +
        'id, Memo from HtlGrps')
    Left = 174
    Top = 781
    object HtlGrpQryHOTELGROUPID: TIntegerField
      FieldName = 'HOTELGROUPID'
    end
    object HtlGrpQryNAME: TStringField
      DisplayLabel = #1052#1077#1088#1077#1078#1072
      FieldName = 'NAME'
      Size = 35
    end
    object HtlGrpQryFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 70
    end
    object HtlGrpQryLOGOIMAGE: TStringField
      FieldName = 'LOGOIMAGE'
      Size = 50
    end
    object HtlGrpQryWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Size = 50
    end
    object HtlGrpQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object HtlGrpQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
  end
  object HtlGrpSrc: TDataSource
    DataSet = HtlGrpQry
    Left = 169
    Top = 833
  end
  object HtlVendorQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'HOTELID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT H.hotelid,  H.HotelvendorId, H.vendorid, C.CompanyId,  C.' +
        'Name, C.ISVENDOR,'
      
        ' ( select FIRST 1 AVALUE from GET_COMPANY_PARAM (C.CompanyId,'#39'IS' +
        'PRIVATE'#39') ) ISPRIVATE,'
      ' C.ISVENDOR, C.ISENTERPR,'
      '  case'
      '     when C.isfiliya = '#39'T'#39' then C.headofficeid'
      '     else C.companyid'
      '  end CompIdForCntrct,'
      'case'
      
        '    when ( ( (C.ORGFORMID is not Null) or (C.IsFiliya = '#39'T'#39') or ' +
        '(C.OrgFormInName = '#39'T'#39') )'
      '    and ( C.ISENTERPR is not null or C.ACTIONID Is not Null )'
      
        '    and ( C.GOVREESTRTYPEID is not Null and C.IDENTCODE Is not N' +
        'ull )'
      
        '    and ( C.GOVREESTRDATE is not Null and C.TAXPAYSTATEID Is not' +
        ' Null ) ) then 1'
      '  else 0'
      ' end AllDataFill,'
      
        ' C.ACTIONID,  C.GOVREESTRTYPEID,  C.IDENTCODE, C.GOVREESTRDATE,C' +
        '.ASRESIDENT'
      ''
      'FROM HtlVendors H'
      'left join Companies C on H.VendorId = C.CompanyId'
      'where H.hotelid = :HotelId')
    Left = 239
    Top = 775
    object HtlVendorQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object HtlVendorQryHOTELVENDORID: TIntegerField
      FieldName = 'HOTELVENDORID'
    end
    object HtlVendorQryVENDORID: TIntegerField
      FieldName = 'VENDORID'
    end
    object HtlVendorQryNAME: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1080
      FieldName = 'NAME'
      Size = 100
    end
    object HtlVendorQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object HtlVendorQryCOMPIDFORCNTRCT: TIntegerField
      FieldName = 'COMPIDFORCNTRCT'
    end
    object HtlVendorQryISPRIVATE: TIntegerField
      FieldName = 'ISPRIVATE'
    end
    object HtlVendorQryALLDATAFILL: TIntegerField
      FieldName = 'ALLDATAFILL'
    end
    object HtlVendorQryACTIONID: TIntegerField
      FieldName = 'ACTIONID'
    end
    object HtlVendorQryISVENDOR: TStringField
      FieldName = 'ISVENDOR'
      Size = 1
    end
    object HtlVendorQryISENTERPR: TStringField
      FieldName = 'ISENTERPR'
      Size = 1
    end
    object HtlVendorQryGOVREESTRTYPEID: TIntegerField
      FieldName = 'GOVREESTRTYPEID'
    end
    object HtlVendorQryIDENTCODE: TStringField
      FieldName = 'IDENTCODE'
      Size = 10
    end
    object HtlVendorQryGOVREESTRDATE: TDateTimeField
      FieldName = 'GOVREESTRDATE'
    end
    object HtlVendorQryASRESIDENT: TStringField
      FieldName = 'ASRESIDENT'
      Size = 1
    end
  end
  object HtlVendorSrc: TDataSource
    DataSet = HtlVendorQry
    Left = 239
    Top = 825
  end
  object FilingQry: TADOQuery
    Connection = ADOConnection
    DataSource = CNTREMBASSIESSrc
    Parameters = <
      item
        Name = 'CompanyId'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'Select *'
      'from TouristAnketTemplates'
      'where EmbassyId = :CompanyId and TypeId = 1')
    Left = 300
    Top = 389
    object FilingQryTEMPLID: TIntegerField
      FieldName = 'TEMPLID'
      Origin = '"TOURISTANKETTEMPLATES"."TEMPLID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FilingQryTYPEID: TIntegerField
      FieldName = 'TYPEID'
      Origin = '"TOURISTANKETTEMPLATES"."TYPEID"'
    end
    object FilingQryFIELDNAME: TIBStringField
      DisplayLabel = #1044#1086#1082#1091#1084#1077#1085#1090
      FieldName = 'FIELDNAME'
      Origin = '"TOURISTANKETTEMPLATES"."FIELDNAME"'
      Size = 30
    end
    object FilingQryEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
      Origin = '"TOURISTANKETTEMPLATES"."EMBASSYID"'
    end
    object FilingQryCalcFieldName: TStringField
      DisplayLabel = #1040#1085#1082#1077#1090#1085#1110' '#1076#1072#1085#1110' '#1076#1083#1103' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111' '#1085#1072' '#1087#1086#1076#1072#1095#1091
      DisplayWidth = 100
      FieldKind = fkCalculated
      FieldName = 'CalcFieldName'
      Size = 100
      Calculated = True
    end
  end
  object FilingSrc: TDataSource
    DataSet = FilingQry
    Left = 300
    Top = 437
  end
  object OCCUPATIONSQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from OCCUPATIONS '
      '')
    Left = 904
    Top = 520
    object OCCUPATIONSQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"OCCUPATIONS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object OCCUPATIONSQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"OCCUPATIONS"."NAME"'
      Size = 200
    end
    object OCCUPATIONSQryKIND: TIntegerField
      FieldName = 'KIND'
      Origin = '"OCCUPATIONS"."KIND"'
    end
    object OCCUPATIONSQryORDERKIND: TIntegerField
      FieldName = 'ORDERKIND'
      Origin = '"OCCUPATIONS"."ORDERKIND"'
    end
    object OCCUPATIONSQryAORDER: TIntegerField
      FieldName = 'AORDER'
      Origin = '"OCCUPATIONS"."AORDER"'
    end
  end
  object OCCUPATIONSSrc: TDataSource
    DataSet = OCCUPATIONSQry
    Left = 904
    Top = 576
  end
  object SERVICE_TYPE_CONDITIONQry: TADOQuery
    Connection = ADOConnection
    DataSource = SERVICESKINDSrc
    Parameters = <
      item
        Name = 'ID'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from SERVICE_TYPE_CONDITION'
      'WHERE TYPEOBJ =:ID')
    Left = 912
    Top = 640
    object SERVICE_TYPE_CONDITIONQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"SERVICE_TYPE_CONDITION"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SERVICE_TYPE_CONDITIONQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"SERVICE_TYPE_CONDITION"."NAME"'
      Size = 300
    end
    object SERVICE_TYPE_CONDITIONQryTYPEOBJ: TIntegerField
      FieldName = 'TYPEOBJ'
      Origin = '"SERVICE_TYPE_CONDITION"."TYPEOBJ"'
    end
  end
  object SERVICE_TYPE_CONDITIONSrc: TDataSource
    DataSet = SERVICE_TYPE_CONDITIONQry
    Left = 912
    Top = 688
  end
  object COMPACTIONSQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from COMPACTIONS'
      '')
    Left = 1120
    Top = 632
    object COMPACTIONSQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"COMPACTIONS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object COMPACTIONSQryAORDER: TIntegerField
      FieldName = 'AORDER'
      Origin = '"COMPACTIONS"."AORDER"'
    end
    object COMPACTIONSQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COMPACTIONS"."NAME"'
      Size = 50
    end
    object COMPACTIONSQrySHORTNAME: TIBStringField
      FieldName = 'SHORTNAME'
      Origin = '"COMPACTIONS"."SHORTNAME"'
      Size = 10
    end
  end
  object COMPACTIONSSrc: TDataSource
    DataSet = COMPACTIONSQry
    Left = 1120
    Top = 688
  end
  object GridRepositoryTypeDescript: TcxGridViewRepository
    Left = 1400
    Top = 61
    object ViewSection: TcxGridDBTableView
      DataController.KeyFieldNames = 'DICTSECTIONID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewSectionDICTSECTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'DICTSECTIONID'
        Visible = False
      end
      object ViewSectionSECTIONNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SECTIONNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 159
      end
    end
    object ViewItem: TcxGridDBTableView
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewItemID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewItemDESCRIPT: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRIPT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewItemSECTIONNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SECTIONNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 299
      end
      object ViewItemITEMNAME: TcxGridDBColumn
        Caption = #1055#1091#1085#1082#1090
        DataBinding.FieldName = 'ITEMNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 285
      end
      object ViewItemDICTSECTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'DICTSECTIONID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewItemSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = DMServ.BrowseImgList
        Properties.Items = <
          item
            ImageIndex = 61
            Value = 'T'
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 30
        Options.HorzSizing = False
        Width = 30
      end
    end
    object ViewLanguageList: TcxGridDBTableView
      DataController.DataSource = LanguageSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewLanguageListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewLanguageListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewLanguageListORIGINAL_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'ORIGINAL_NAME'
        Visible = False
      end
      object ViewLanguageListACTIVE_TRANSLATE: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIVE_TRANSLATE'
        Visible = False
      end
      object ViewLanguageListIDENT: TcxGridDBColumn
        DataBinding.FieldName = 'IDENT'
        Visible = False
        MinWidth = 30
        Options.HorzSizing = False
        Width = 30
      end
    end
    object VisaCenter: TcxGridDBTableView
      DataController.DataSource = DMServ.VisaCenterSrc
      DataController.KeyFieldNames = 'CntrEmbassyId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object VisaCenterCntrEmbassyId: TcxGridDBColumn
        DataBinding.FieldName = 'CntrEmbassyId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterCalcEmbassyName: TcxGridDBColumn
        DataBinding.FieldName = 'CalcEmbassyName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 198
      end
      object VisaCenterCalcServCost: TcxGridDBColumn
        DataBinding.FieldName = 'CalcServCost'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 50
      end
      object VisaCenterCalcPayBank: TcxGridDBColumn
        DataBinding.FieldName = 'CalcPayBank'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterCalcReadyToDay: TcxGridDBColumn
        DataBinding.FieldName = 'CalcReadyToDay'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterColumn1: TcxGridDBColumn
        Options.HorzSizing = False
        Width = 20
      end
      object VisaCenterColumn2: TcxGridDBColumn
        Options.HorzSizing = False
        Width = 20
      end
      object VisaCenterColumn3: TcxGridDBColumn
        Options.HorzSizing = False
        Width = 20
      end
      object VisaCenterColumn4: TcxGridDBColumn
        Options.HorzSizing = False
        Width = 20
      end
      object VisaCenterColumn5: TcxGridDBColumn
        Options.HorzSizing = False
        Width = 20
      end
      object VisaCenterColumn6: TcxGridDBColumn
        Options.HorzSizing = False
        Width = 20
      end
      object VisaCenterEMBASSYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterITSKONSUL: TcxGridDBColumn
        DataBinding.FieldName = 'ITSKONSUL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterFUNDINGSUM: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGSUM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterFUNDINGVAL: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterFUNDINGCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterFUNDINGPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'FUNDINGPERIOD'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterBANKSUM: TcxGridDBColumn
        DataBinding.FieldName = 'BANKSUM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterBANKVAL: TcxGridDBColumn
        DataBinding.FieldName = 'BANKVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterBANKCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'BANKCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterBANKPERIOD: TcxGridDBColumn
        DataBinding.FieldName = 'BANKPERIOD'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterPERMTRANSFDOC: TcxGridDBColumn
        DataBinding.FieldName = 'PERMTRANSFDOC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterONTOURSUM: TcxGridDBColumn
        DataBinding.FieldName = 'ONTOURSUM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterPAYBANKSERV: TcxGridDBColumn
        DataBinding.FieldName = 'PAYBANKSERV'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterCURRSERV: TcxGridDBColumn
        DataBinding.FieldName = 'CURRSERV'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterREADYTODAYS: TcxGridDBColumn
        DataBinding.FieldName = 'READYTODAYS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterREADYTOTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'READYTOTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterAUTOFILLING: TcxGridDBColumn
        DataBinding.FieldName = 'AUTOFILLING'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterUSECODE: TcxGridDBColumn
        DataBinding.FieldName = 'USECODE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterOURFILING: TcxGridDBColumn
        DataBinding.FieldName = 'OURFILING'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterAPPLTYPEDATE: TcxGridDBColumn
        DataBinding.FieldName = 'APPLTYPEDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterSERVCOST: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterSERVCOSTVAL: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCOSTVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterPARENTID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterCITYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CITYNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterFILINGPLACEWORK: TcxGridDBColumn
        DataBinding.FieldName = 'FILINGPLACEWORK'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterFULLFUNDING: TcxGridDBColumn
        DataBinding.FieldName = 'FULLFUNDING'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterTYPEFUNDING: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEFUNDING'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VisaCenterCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewLanguageDict: TcxGridDBTableView
      DataController.DataSource = LanguageSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewLanguageDictID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewLanguageDictNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 264
      end
      object ViewLanguageDictORIGINAL_NAME: TcxGridDBColumn
        Caption = #1054#1088#1080#1075#1110#1085#1072#1083#1100#1085#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'ORIGINAL_NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 208
      end
      object ViewLanguageDictACTIVE_TRANSLATE: TcxGridDBColumn
        Caption = #1044#1083#1103' '#1087#1077#1088#1077#1082#1083#1072#1076#1110#1074
        DataBinding.FieldName = 'ACTIVE_TRANSLATE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            ImageIndex = 0
          end
          item
            Description = #1058#1072#1082
            Value = 1
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 89
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 89
      end
      object ViewLanguageDictIDENT: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'IDENT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 48
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 48
      end
      object ViewLanguageDictICON: TcxGridDBColumn
        Caption = #1030#1082#1086#1085#1082#1072
        DataBinding.FieldName = 'ICON'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 38
      end
    end
    object ViewUnitMeashur: TcxGridDBTableView
      DataController.DataSource = UNIT_MEASURSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewUnitMeashurID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewUnitMeashurNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewUnitMeashurNAMES: TcxGridDBColumn
        Caption = #1052#1085#1086#1078#1080#1085#1072
        DataBinding.FieldName = 'ANAMES'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewUnitMeashurSHORT: TcxGridDBColumn
        Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'SHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 74
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 74
      end
    end
    object ViewInternacionalOrgDict: TcxGridDBTableView
      DataController.DataSource = INTERNACIONAL_ORGSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.CellAutoHeight = True
      OptionsView.CellTextMaxLineCount = 10
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = MyStyle
      object ViewInternacionalOrgDictID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 38
      end
      object ViewInternacionalOrgDictNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 287
      end
    end
    object ViewLngTranslateTemplateDic: TcxGridDBTableView
      DataController.DataSource = LNG_TRANSLATE_TEMPLATESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewLngTranslateTemplateDicID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewLngTranslateTemplateDicID_LNG: TcxGridDBColumn
        Caption = #1052#1086#1074#1072
        DataBinding.FieldName = 'ID_LNG'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewLanguageList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewLanguageListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 150
      end
      object ViewLngTranslateTemplateDicTABLE_IND: TcxGridDBColumn
        Caption = #1058#1072#1073#1083#1080#1094#1103
        DataBinding.FieldName = 'TABLE_IND'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Items = <
          item
            Description = #1050#1088#1072#1111#1085#1080
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1052#1110#1089#1090#1072
            Value = 1
          end
          item
            Description = #1052#1086#1074#1080
            Value = 2
          end
          item
            Description = #1060#1086#1088#1084#1080' '#1055#1088#1072#1074#1083#1110#1085#1085#1103
            Value = 3
          end
          item
            Description = #1042#1072#1083#1102#1090#1072
            Value = 4
          end
          item
            Description = #1053#1072#1087#1088#1091#1075#1072' - '#1063#1072#1089#1090#1086#1090#1072
            Value = 5
          end
          item
            Description = #1058#1080#1087' '#1088#1086#1079#1077#1090#1086#1082
            Value = 6
          end
          item
            Description = #1056#1077#1083#1110#1075#1110#1111
            Value = 7
          end
          item
            Description = #1052#1110#1078#1085#1072#1088#1086#1076#1085#1110' '#1054#1088#1075#1072#1085#1110#1079#1072#1094#1110#1111
            Value = 8
          end
          item
            Description = #1063#1072#1089#1086#1074#1110' '#1087#1086#1103#1089#1080
            Value = 9
          end
          item
            Description = #1054#1073#1083#1072#1089#1090#1110','#1087#1088#1086#1074#1110#1085#1094#1110#1111
            Value = 10
          end
          item
            Description = #1056#1072#1081#1086#1085#1080
            Value = 11
          end
          item
            Description = #1043#1086#1090#1077#1083#1110
            Value = 12
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 150
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 150
      end
      object ViewLngTranslateTemplateDicATEMPLATE: TcxGridDBColumn
        Caption = #1064#1072#1073#1083#1086#1085
        DataBinding.FieldName = 'ATEMPLATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 256
      end
      object ViewLngTranslateTemplateDicUPPERCASE: TcxGridDBColumn
        Caption = #1047' '#1074#1077#1083#1080#1082#1086#1111' '#1073#1091#1082#1074#1080
        DataBinding.FieldName = 'UPPERCASE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Items = <
          item
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1047' '#1074#1077#1083#1080#1082#1086#1111' '#1073#1091#1082#1074#1080
            Value = 1
          end
          item
            Description = #1047' '#1084#1072#1083#1077#1085#1100#1082#1086#1111' '#1073#1091#1082#1074#1080
            Value = 2
          end
          item
            Description = #1047' '#1074#1077#1083#1080#1082#1086#1111' '#1073#1091#1074#1082#1080' ('#1074#1089#1110' '#1089#1083#1086#1074#1072')'
            Value = 3
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 128
      end
    end
    object ViewTemplTourProgramDic: TcxGridDBTableView
      DataController.DataSource = SCHEDITEM_TOURS_WEB_TEMPLATESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTemplTourProgramDicID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTemplTourProgramDicNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 160
      end
      object ViewTemplTourProgramDicTYPEOBJ: TcxGridDBColumn
        Caption = #1055#1086#1089#1083#1091#1075#1072
        DataBinding.FieldName = 'TYPEOBJ'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            ImageIndex = 0
          end
          item
            Description = #1047#1091#1087#1080#1085#1082#1080
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1043#1086#1090#1077#1083#1100
            Value = 1
          end
          item
            Description = #1045#1082#1089#1082#1091#1088#1089#1110#1111
            Value = 4
          end
          item
            Description = #1054#1087#1080#1089
            Value = 10
          end
          item
            Description = #1030#1085#1096#1110' '#1087#1086#1089#1083#1091#1075#1080
            Value = 6
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 102
      end
      object ViewTemplTourProgramDicACTIONTYPE: TcxGridDBColumn
        Caption = #1044#1110#1103
        DataBinding.FieldName = 'ACTIONTYPE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            ImageIndex = 0
          end
          item
            Description = #1055#1086#1095#1072#1090#1086#1082'('#1042#1110#1076#1087#1088#1072#1074#1083#1077#1085#1085#1103')'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1050#1110#1085#1077#1094#1100'('#1055#1088#1080#1073#1091#1090#1090#1103')'
            Value = 1
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 132
      end
      object ViewTemplTourProgramDicREPRESENTATION: TcxGridDBColumn
        Caption = #1064#1072#1073#1083#1086#1085' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1085#1103
        DataBinding.FieldName = 'REPRESENTATION'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 290
      end
      object ViewTemplTourProgramDicLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewTemplTourProgramDicLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewTemplTourProgramDicLNGCHANGE_REP: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE_REP'
        Visible = False
      end
    end
    object ViewTemplTimeTourProgramDic: TcxGridDBTableView
      DataController.DataSource = SCHEDITEM_TOURS_WEB_TIMESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTemplTimeTourProgramDicID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTemplTimeTourProgramDicNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 180
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 180
      end
      object ViewTemplTimeTourProgramDicTYPEOBJ: TcxGridDBColumn
        Caption = #1055#1086#1089#1083#1091#1075#1072
        DataBinding.FieldName = 'TYPEOBJ'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            ImageIndex = 0
          end
          item
            Description = #1055#1086#1089#1083#1091#1075#1072
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1043#1086#1090#1077#1083#1100
            Value = 1
          end
          item
            Description = #1045#1082#1089#1082#1091#1088#1089#1110#1111
            Value = 4
          end
          item
            Description = #1054#1087#1080#1089
            Value = 10
          end
          item
            Description = #1030#1085#1096#1110' '#1087#1086#1089#1083#1091#1075#1080
            Value = 6
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 90
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 90
      end
      object ViewTemplTimeTourProgramDicACTIONTYPE: TcxGridDBColumn
        Caption = #1044#1110#1103
        DataBinding.FieldName = 'ACTIONTYPE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            ImageIndex = 0
          end
          item
            Description = #1055#1086#1095#1072#1090#1086#1082'('#1042#1110#1076#1087#1088#1072#1074#1083#1077#1085#1085#1103')'
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1050#1110#1085#1077#1094#1100'('#1055#1088#1080#1073#1091#1090#1090#1103')'
            Value = 1
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 110
      end
      object ViewTemplTimeTourProgramDicTIMEOBJ: TcxGridDBColumn
        Caption = #1063#1072#1089
        DataBinding.FieldName = 'TIMEOBJ'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1055#1086#1082#1072#1079#1091#1074#1072#1090#1080
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1053#1077' '#1087#1086#1082#1072#1079#1091#1074#1072#1090#1080
            Value = 1
          end
          item
            Description = #1055#1088#1080#1073#1083#1080#1079#1085#1080#1081
            Value = 2
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 80
      end
      object ViewTemplTimeTourProgramDicTIMEFROM: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1076#1110#1111' '#1079' '
        DataBinding.FieldName = 'TIMEFROM'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewTemplTimeTourProgramDicTIMETILL: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1076#1110#1111' '#1087#1086
        DataBinding.FieldName = 'TIMETILL'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 60
      end
      object ViewTemplTimeTourProgramDicREPRESENTATION: TcxGridDBColumn
        Caption = #1064#1072#1073#1083#1086#1085' '#1087#1088#1077#1076#1089#1090#1072#1074#1083#1077#1085#1085#1103
        DataBinding.FieldName = 'REPRESENTATION'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 184
      end
      object ViewTemplTimeTourProgramDicLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewTemplTimeTourProgramDicLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewLngTranslateTemplateDetailDic: TcxGridDBTableView
      DataController.DataSource = LNG_TRANSL_TEMP_DETAILSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewLngTranslateTemplateDetailDicID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewLngTranslateTemplateDetailDicID_LNG_TRANSLATE_TEMPLATE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_LNG_TRANSLATE_TEMPLATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewLngTranslateTemplateDetailDicORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 37
      end
      object ViewLngTranslateTemplateDetailDicNAME: TcxGridDBColumn
        Caption = #1057#1083#1086#1074#1072' '#1076#1083#1103' '#1074#1080#1076#1072#1083#1077#1085#1085#1103' '#1079' '#1087#1077#1088#1077#1082#1083#1072#1076#1091
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 371
      end
    end
    object ViewTimeZoneDic: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = TIME_ZONESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewTimeZoneDicID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTimeZoneDicNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 588
      end
      object ViewTimeZoneDicAVALUE: TcxGridDBColumn
        Caption = #1047#1084#1110#1097#1077#1085#1085#1103
        DataBinding.FieldName = 'AVALUE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 100
      end
    end
    object ViewBrCountryExcurs: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrCountrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrCountryExcursCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCountryExcursNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 273
      end
      object ViewBrCountryExcursSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = DMServ.BrowseImgList
        Properties.Items = <
          item
            ImageIndex = 61
            Value = 'T'
          end
          item
            Value = 'F'
          end
          item
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 28
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 28
      end
      object ViewBrCountryExcursLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCountryExcursLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewBrCityExcurs: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = ExCitySrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrCityExcursID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityExcursID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityExcursLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityExcursLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityExcursCITYNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'CITYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 180
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 180
      end
      object ViewBrCityExcursNAMEPATH: TcxGridDBColumn
        Caption = #1056#1086#1079#1090#1072#1096#1091#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'NAMEPATH'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityExcursNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
      end
    end
    object ViewExcursion: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'EID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewExcursionEID: TcxGridDBColumn
        DataBinding.FieldName = 'EID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 416
      end
      object ViewExcursionBEG: TcxGridDBColumn
        Caption = #1055#1086#1095#1072#1090#1086#1082
        DataBinding.FieldName = 'BEG'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 120
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 120
      end
      object ViewExcursionDURATION: TcxGridDBColumn
        Caption = #1058#1088#1080#1074#1072#1083#1110#1089#1090#1100
        DataBinding.FieldName = 'DURATION'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 110
      end
      object ViewExcursionMANAGERID: TcxGridDBColumn
        Caption = #1052#1077#1085#1077#1076#1078#1077#1088
        DataBinding.FieldName = 'MANAGERID'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 138
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 138
      end
      object ViewExcursionMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionDRTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'DRTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionTYPEEX: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEEX'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionSTAND: TcxGridDBColumn
        DataBinding.FieldName = 'STAND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionIND_GRP: TcxGridDBColumn
        DataBinding.FieldName = 'IND_GRP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'PMIN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'PMAX'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionGUIDE: TcxGridDBColumn
        DataBinding.FieldName = 'GUIDE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionFORCED: TcxGridDBColumn
        DataBinding.FieldName = 'FORCED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionDRVKIND: TcxGridDBColumn
        DataBinding.FieldName = 'DRVKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionSTANDDAYS: TcxGridDBColumn
        DataBinding.FieldName = 'STANDDAYS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionCURR2ID: TcxGridDBColumn
        DataBinding.FieldName = 'CURR2ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionCURR1ID: TcxGridDBColumn
        DataBinding.FieldName = 'CURR1ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionZ_P: TcxGridDBColumn
        DataBinding.FieldName = 'Z_P'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEIND_GUIDE: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEIND_GUIDE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEIND_DRIVE: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEIND_DRIVE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEIND_TICKET: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEIND_TICKET'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEIND_OUR: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEIND_OUR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEIND_OUTSIDE: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEIND_OUTSIDE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEGRP_GUIDE: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEGRP_GUIDE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEGRP_DRIVE: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEGRP_DRIVE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEGRP_TICKET: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEGRP_TICKET'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEGRP_OUR: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEGRP_OUR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionPRICEIGRP_OUTSIDE: TcxGridDBColumn
        DataBinding.FieldName = 'PRICEIGRP_OUTSIDE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewExcursionLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewExcursionLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewExcursionCITYNAME: TcxGridDBColumn
        Caption = #1052#1110#1089#1090#1086
        DataBinding.FieldName = 'CITYNAME'
        Visible = False
        Width = 120
      end
      object ViewExcursionTYPETRIP: TcxGridDBColumn
        DataBinding.FieldName = 'TYPETRIP'
        Visible = False
      end
      object ViewExcursionTYPEPLACE: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEPLACE'
        Visible = False
      end
      object ViewExcursionTYPECONTENT1: TcxGridDBColumn
        DataBinding.FieldName = 'TYPECONTENT'
        Visible = False
      end
      object ViewExcursionNEEDGUIDE: TcxGridDBColumn
        DataBinding.FieldName = 'NEEDGUIDE'
        Visible = False
      end
      object ViewExcursionISREQUIRED: TcxGridDBColumn
        DataBinding.FieldName = 'ISREQUIRED'
        Visible = False
      end
      object ViewExcursionID_CITY_ADM_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNIT'
        Visible = False
      end
    end
    object ViewExcursionPlace: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewExcursionPlaceID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewExcursionPlaceNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewExcursionTypeContent: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = EXCURS_TYPE_CONTENTSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewExcursionTypeContentID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewExcursionTypeContentNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewExcursionTrip: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = EXCURS_TYPE_TRIPSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewExcursionTripID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Filtering = False
      end
      object ViewExcursionTripNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewDrvKindList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = DrvKindsSrc
      DataController.KeyFieldNames = 'DRIVEKIND'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewDrvKindListDRIVEKIND: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDrvKindListKIND: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'KIND'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewDrvKindListCATEGORY: TcxGridDBColumn
        DataBinding.FieldName = 'CATEGORY'
        Visible = False
      end
      object ViewDrvKindListKINDSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'KINDSHORT'
        Visible = False
      end
    end
    object ViewExcursLayoutDesript: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = EXCURS_LAYOUT_DESCRIPTSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewExcursLayoutDesriptID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Filtering = False
      end
      object ViewExcursLayoutDesriptID_EXCURSION: TcxGridDBColumn
        DataBinding.FieldName = 'ID_EXCURSION'
        Visible = False
        Options.Filtering = False
      end
      object ViewExcursLayoutDesriptAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        MinWidth = 22
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 22
      end
      object ViewExcursLayoutDesriptNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 647
      end
    end
    object ViewSERVICEKIND: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SERVICESKINDSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewSERVICEKINDID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSERVICEKINDNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewServiceType: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SERVICE_TYPESrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewServiceTypeID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Options.Filtering = False
      end
      object ViewServiceTypeNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServiceTypeICON: TcxGridDBColumn
        Caption = #1030#1082#1086#1085#1082#1072
        DataBinding.FieldName = 'ICON'
        PropertiesClassName = 'TcxImageProperties'
        Properties.PopupMenuLayout.MenuItems = [pmiCustom]
        Properties.PopupMenuLayout.CustomMenuItemCaption = #1047#1072#1085#1090#1072#1078#1080#1090#1080
        Properties.PopupMenuLayout.CustomMenuItemGlyph.Data = {
          76020000424D76020000000000003600000028000000100000000C0000000100
          18000000000040020000120B0000120B00000000000000000000FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFF00000000000000FFFFF0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFF000000FFFFFFFFFFFF00000000FFFF
          00000000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFF000000FFFFFF000000FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0
          F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F0000000FFFFFF00000000FFFF
          FFFFFF000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0F000FFFFF0F0
          F000FFFFF0F0F0000000000000FFFFFF00FFFFFFFFFF00000000000000000000
          0000000000F0F0F000FFFFF0F0F000FFFFF0F0F000FFFF00000000000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000000000000000000000
          00000000000000FFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
          FF000000FFFFFFFFFFFF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFF
          FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFF00000000FFFF
          FFFFFF00FFFFFFFFFF00FFFF0000000000000000000000000000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.SortByDisplayText = isbtOn
        Width = 50
      end
      object ViewServiceTypeLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewServiceTypeLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewServiceTypeCondition: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = SERVICE_TYPE_CONDITIONSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewServiceTypeConditionID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServiceTypeConditionTYPEOBJ: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEOBJ'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewServiceTypeConditionNAME: TcxGridDBColumn
        Caption = #1059#1084#1086#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewBrCountryHotels: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrCountrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrCountryHotelsCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCountryHotelsNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 656
      end
      object ViewBrCountryHotelsNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
      end
      object ViewBrCountryHotelsLATNAME: TcxGridDBColumn
        DataBinding.FieldName = 'LATNAME'
        Visible = False
      end
      object ViewBrCountryHotelsMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
      object ViewBrCountryHotelsLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewBrCountryHotelsLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewBrCityHotels: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HCitySrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrCityHotelsCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityHotelsCITYNAME: TcxGridDBColumn
        Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1081' '#1087#1091#1085#1082#1090
        DataBinding.FieldName = 'CITYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 180
        Options.Filtering = False
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 180
      end
      object ViewBrCityHotelsID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityHotelsID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityHotelsNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityHotelsLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityHotelsLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewBrCityHotelsNAMEPATH: TcxGridDBColumn
        Caption = #1056#1086#1079#1090#1072#1096#1091#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'NAMEPATH'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 385
      end
    end
    object ViewHotelKind: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HotelKindSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewHotelKindID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHotelKindAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewHotelKindNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHotelKindLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHotelKindLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewHotelClassDic: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HOTELCLASSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHotelClassDicID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewHotelClassDicAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewHotelClassDicNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 563
      end
      object ViewHotelClassDicCTYPE: TcxGridDBColumn
        Caption = #1050#1083#1072#1089
        DataBinding.FieldName = 'CTYPE'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1050#1083#1072#1089#1089' 1'
            ImageIndex = 0
            Value = 1
          end
          item
            Description = #1050#1083#1072#1089#1089' 2'
            Value = 2
          end
          item
            Description = #1050#1083#1072#1089#1089' 3'
            Value = 3
          end>
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 121
      end
      object ViewHotelClassDicLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHotelClassDicLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewHotelClassList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HOTELCLASSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewHotelClassListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewHotelClassListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewHotelClassListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewHotelClassListCTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'CTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
      end
      object ViewHotelClassListLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewHotelClassListLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewBrCountryList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrCountrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewBrCountryListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewBrCountryListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewBrCountryListNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewBrCountryListLATNAME: TcxGridDBColumn
        DataBinding.FieldName = 'LATNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewBrCountryListMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewORGFORMS: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CompOrgFrmSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewORGFORMSID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewORGFORMSAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 34
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 34
      end
      object ViewORGFORMSNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 236
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 236
      end
      object ViewORGFORMSFULLNAME: TcxGridDBColumn
        Caption = #1055#1086#1074#1085#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'FULLNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 346
      end
      object ViewORGFORMSSHORTNAME: TcxGridDBColumn
        Caption = #1040#1073#1088#1077#1074#1110#1072#1090#1091#1088#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 100
      end
      object ViewORGFORMSSHORTIDENT: TcxGridDBColumn
        Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1090#1086#1088
        DataBinding.FieldName = 'SHORTIDENT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 84
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 84
      end
      object ViewORGFORMSDISABLED: TcxGridDBColumn
        Caption = #1053#1077' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103
        DataBinding.FieldName = 'DISABLED'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 42
      end
    end
    object ViewCOMPACTIONS: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMPACTIONSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCOMPACTIONSID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCOMPACTIONSAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 32
      end
      object ViewCOMPACTIONSNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Sorting = False
      end
      object ViewCOMPACTIONSSHORTNAME: TcxGridDBColumn
        Caption = #1057#1082#1086#1088#1086#1095#1077#1085#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 100
      end
    end
    object ViewOCCUPATIONS: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = OCCUPATIONSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewOCCUPATIONSID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewOCCUPATIONSAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 32
      end
      object ViewOCCUPATIONSNAME: TcxGridDBColumn
        Caption = #1055#1086#1089#1072#1076#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 64
      end
      object ViewOCCUPATIONSKIND: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'KIND'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Items = <
          item
            Description = #1042#1083#1072#1089#1085#1080#1082#1080
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1044#1080#1088#1077#1082#1090#1086#1088#1080
            Value = 1
          end
          item
            Description = #1041#1091#1093#1075#1072#1083#1090#1077#1088#1080
            Value = 2
          end>
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 84
        Options.HorzSizing = False
        Width = 84
      end
      object ViewOCCUPATIONSORDERKIND: TcxGridDBColumn
        Caption = #1030#1085#1076#1077#1082#1089' '#1076#1083#1103' '#1090#1080#1087#1091
        DataBinding.FieldName = 'ORDERKIND'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.HorzSizing = False
        Width = 100
      end
    end
    object ViewCOMP_TYPEDOCUM: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COMP_TYPEDOCUMSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewCOMP_TYPEDOCUMID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCOMP_TYPEDOCUMAORDER: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'AORDER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.HorzSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 32
      end
      object ViewCOMP_TYPEDOCUMNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewBrHotel: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = BrHotelSrc
      DataController.KeyFieldNames = 'HOTELID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewBrHotelHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelHOTELKINDNAME: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELKINDNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 84
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 84
      end
      object ViewBrHotelNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 158
      end
      object ViewBrHotelSTARS: TcxGridDBColumn
        DataBinding.FieldName = 'STARS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 58
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 58
      end
      object ViewBrHotelHOTELCAPACITY: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELCAPACITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 48
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 48
      end
      object ViewBrHotelAREROOM: TcxGridDBColumn
        DataBinding.FieldName = 'AREROOM'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Images = DMServ.BrowseImgList
        Properties.Items = <
          item
            ImageIndex = 107
          end>
        Properties.ShowDescriptions = False
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewBrHotelIMPORTED: TcxGridDBColumn
        DataBinding.FieldName = 'IMPORTED'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Images = DMServ.BrowseImgList
        Properties.Items = <
          item
            ImageIndex = 108
            Value = 'T'
          end>
        Properties.ShowDescriptions = False
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewBrHotelSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.Images = DMServ.BrowseImgList
        Properties.Items = <
          item
            ImageIndex = 61
            Value = 'T'
          end
          item
            Value = 'F'
          end>
        Properties.ShowDescriptions = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 33
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 33
      end
      object ViewBrHotelCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'COMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelHOTELKIND: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelCATEGORYID: TcxGridDBColumn
        DataBinding.FieldName = 'CATEGORYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelSTRANGER: TcxGridDBColumn
        DataBinding.FieldName = 'STRANGER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelENTERPRISEID: TcxGridDBColumn
        DataBinding.FieldName = 'ENTERPRISEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelURL: TcxGridDBColumn
        DataBinding.FieldName = 'URL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelWEBCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'WEBCOMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelSHOWWEB2: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelADDMANID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelLANGUAGES: TcxGridDBColumn
        DataBinding.FieldName = 'LANGUAGES'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 304
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelCATCLASS1: TcxGridDBColumn
        DataBinding.FieldName = 'CATCLASS1'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelCATCLASS2: TcxGridDBColumn
        DataBinding.FieldName = 'CATCLASS2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelCATCLASS3: TcxGridDBColumn
        DataBinding.FieldName = 'CATCLASS3'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelTODELETE: TcxGridDBColumn
        DataBinding.FieldName = 'TODELETE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelPLACECOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'PLACECOMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelDESCRCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRCOMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelINROOMCOMMENTS: TcxGridDBColumn
        DataBinding.FieldName = 'INROOMCOMMENTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelADDRESS: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 1504
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelALTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'ALTNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 1504
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelASAREA: TcxGridDBColumn
        DataBinding.FieldName = 'ASAREA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelCOUNTRY_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 1804
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelCITYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CITYNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 1144
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelHOTELGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 214
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewBrHotelLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewBrHotelLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
      object ViewBrHotelID_CITY_ADM_UNIT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNIT'
        Visible = False
      end
    end
    object ViewHtlVendor: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HtlVendorSrc
      DataController.KeyFieldNames = 'HOTELVENDORID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewHtlVendorHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlVendorHOTELVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELVENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlVendorVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlVendorNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewHtlVendorCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
      end
      object ViewHtlVendorCOMPIDFORCNTRCT: TcxGridDBColumn
        DataBinding.FieldName = 'COMPIDFORCNTRCT'
        Visible = False
      end
      object ViewHtlVendorISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
        Visible = False
      end
      object ViewHtlVendorISVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
      end
      object ViewHtlVendorISENTERPR: TcxGridDBColumn
        DataBinding.FieldName = 'ISENTERPR'
        Visible = False
      end
      object ViewHtlVendorALLDATAFILL: TcxGridDBColumn
        DataBinding.FieldName = 'ALLDATAFILL'
        Visible = False
      end
      object ViewHtlVendorACTIONID: TcxGridDBColumn
        DataBinding.FieldName = 'ACTIONID'
        Visible = False
      end
      object ViewHtlVendorGOVREESTRTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'GOVREESTRTYPEID'
        Visible = False
      end
      object ViewHtlVendorIDENTCODE: TcxGridDBColumn
        DataBinding.FieldName = 'IDENTCODE'
        Visible = False
      end
      object ViewHtlVendorGOVREESTRDATE: TcxGridDBColumn
        DataBinding.FieldName = 'GOVREESTRDATE'
        Visible = False
      end
      object ViewHtlVendorASRESIDENT: TcxGridDBColumn
        DataBinding.FieldName = 'ASRESIDENT'
        Visible = False
      end
    end
    object ViewFEEDTYPES: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = FEEDTYPESSrc
      DataController.KeyFieldNames = 'FEEDTYPEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewFEEDTYPESFEEDTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'FEEDTYPEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewFEEDTYPESSORTORDER: TcxGridDBColumn
        Caption = 'N'
        DataBinding.FieldName = 'SORTORDER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 42
      end
      object ViewFEEDTYPESFEEDNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'FEEDNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 140
        Options.Filtering = False
        Options.Sorting = False
        Width = 140
      end
      object ViewFEEDTYPESNAME: TcxGridDBColumn
        Caption = #1057#1082#1086#1088'. '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 80
      end
      object ViewFEEDTYPESMEMO: TcxGridDBColumn
        Tag = 100
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 144
      end
      object ViewFEEDTYPESRATEPREFER: TcxGridDBColumn
        DataBinding.FieldName = 'RATEPREFER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewFEEDTYPESLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object ViewFEEDTYPESLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object ViewOtherService: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = OTHERSERVICESSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewOtherServiceID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.HorzSizing = False
        Options.Sorting = False
      end
      object ViewOtherServiceORDERINCATEGORY: TcxGridDBColumn
        Caption = #8470
        DataBinding.FieldName = 'ORDERINCATEGORY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.HorzSizing = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 42
      end
      object ViewOtherServiceNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 300
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 300
      end
      object ViewOtherServiceORDERED: TcxGridDBColumn
        Caption = #1057#1086#1088#1090#1091#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'ORDERED'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 80
      end
      object ViewOtherServiceINTVALUE: TcxGridDBColumn
        Caption = #1047#1085#1072#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'INTVALUE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000840000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFF84000084
          0000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF840000840000840000FFFFFFFF00FFFF00FF84
          0000840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF
          00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FFFFFFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF840000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.HorzSizing = False
        Options.Sorting = False
        Width = 80
      end
      object ViewOtherServiceMEMO: TcxGridDBColumn
        Caption = #1050#1086#1084#1077#1085#1090#1072#1088
        DataBinding.FieldName = 'MEMO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Sorting = False
      end
    end
    object ViewFiling: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = FilingSrc
      DataController.KeyFieldNames = 'TEMPLID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object ViewFilingTEMPLID: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewFilingTYPEID: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewFilingFIELDNAME: TcxGridDBColumn
        DataBinding.FieldName = 'FIELDNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewFilingEMBASSYID: TcxGridDBColumn
        DataBinding.FieldName = 'EMBASSYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewFilingCalcFieldName: TcxGridDBColumn
        DataBinding.FieldName = 'CalcFieldName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewOCCUPATIONSList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = OCCUPATIONSSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewOCCUPATIONSListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewOCCUPATIONSListNAME: TcxGridDBColumn
        Caption = #1055#1086#1089#1072#1076#1072
        DataBinding.FieldName = 'NAME'
      end
      object ViewOCCUPATIONSListKIND: TcxGridDBColumn
        DataBinding.FieldName = 'KIND'
        Visible = False
      end
      object ViewOCCUPATIONSListORDERKIND: TcxGridDBColumn
        DataBinding.FieldName = 'ORDERKIND'
        Visible = False
      end
      object ViewOCCUPATIONSListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
      end
    end
    object ViewORGFORMSList: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = CompOrgFrmSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = MyStyle
      object ViewORGFORMSListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewORGFORMSListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
      end
      object ViewORGFORMSListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewORGFORMSListSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
      end
      object ViewORGFORMSListFULLNAME: TcxGridDBColumn
        DataBinding.FieldName = 'FULLNAME'
        Visible = False
      end
      object ViewORGFORMSListSHORTIDENT: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTIDENT'
        Visible = False
      end
      object ViewORGFORMSListDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
      end
    end
  end
  object COMP_TYPEDOCUMQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from COMP_TYPEDOCUM'
      '')
    Left = 1248
    Top = 680
    object COMP_TYPEDOCUMQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"COMP_TYPEDOCUM"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object COMP_TYPEDOCUMQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COMP_TYPEDOCUM"."NAME"'
      Size = 200
    end
    object COMP_TYPEDOCUMQryAORDER: TIntegerField
      FieldName = 'AORDER'
      Origin = '"COMP_TYPEDOCUM"."AORDER"'
    end
  end
  object COMP_TYPEDOCUMSrc: TDataSource
    DataSet = COMP_TYPEDOCUMQry
    Left = 1248
    Top = 728
  end
  object EXCURS_TYPE_TRIPQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from EXCURS_TYPE_TRIP')
    Left = 640
    Top = 776
    object IntegerField9: TIntegerField
      FieldName = 'ID'
      Origin = '"EXCURSION_PLACE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField4: TIBStringField
      FieldName = 'NAME'
      Origin = '"EXCURSION_PLACE"."NAME"'
      Size = 100
    end
  end
  object EXCURS_TYPE_TRIPSrc: TDataSource
    DataSet = EXCURS_TYPE_TRIPQry
    Left = 640
    Top = 824
  end
  object CITY_ADM_UNIT_ImgQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * from CITY_ADM_UNIT_IMG where ID_CITY_ADM_UNIT = :ID')
    Left = 792
    Top = 776
    object CITY_ADM_UNIT_ImgQryID: TIntegerField
      FieldName = 'ID'
    end
    object CITY_ADM_UNIT_ImgQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
    object CITY_ADM_UNIT_ImgQryFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 200
    end
    object CITY_ADM_UNIT_ImgQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object CITY_ADM_UNIT_ImgQryDESCRIPT: TMemoField
      FieldName = 'DESCRIPT'
      BlobType = ftMemo
    end
    object CITY_ADM_UNIT_ImgQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
  end
  object CITY_ADM_UNIT_ImgSrc: TDataSource
    DataSet = CITY_ADM_UNIT_ImgQry
    Left = 792
    Top = 824
  end
  object EXCURSIONQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = ExCitySrc
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      ' select EXCURSION.*, '
      ' ( select Count(Languages.ID) from Languages'
      
        '   left join EXCURSION_lng on EXCURSION_lng.id_lng = Languages.i' +
        'd and EXCURSION_lng.id_eid = EXCURSION.eid'
      
        '   where Languages.active_translate is not null and EXCURSION_ln' +
        'g.id_lng is null ) LNGNOTFOUND,'
      
        ' ( select sum( EXCURSION_lng.change_name ) from EXCURSION_lng wh' +
        'ere EXCURSION_lng.id_eid = EXCURSION.eid ) LNGCHANGE'
      ''
      ' from EXCURSION'
      ' where EXCURSION.id_city_adm_unit=:ID')
    Left = 538
    Top = 776
    object EXCURSIONQryEID: TIntegerField
      FieldName = 'EID'
      Origin = '"EXCURSION"."EID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EXCURSIONQryBEG: TDateTimeField
      FieldName = 'BEG'
      Origin = '"EXCURSION"."BEG"'
    end
    object EXCURSIONQrySTAND: TDateTimeField
      FieldName = 'STAND'
      Origin = '"EXCURSION"."STAND"'
    end
    object EXCURSIONQryIND_GRP: TIntegerField
      FieldName = 'IND_GRP'
      Origin = '"EXCURSION"."IND_GRP"'
    end
    object EXCURSIONQryPMIN: TIntegerField
      FieldName = 'PMIN'
      Origin = '"EXCURSION"."PMIN"'
    end
    object EXCURSIONQryPMAX: TIntegerField
      FieldName = 'PMAX'
      Origin = '"EXCURSION"."PMAX"'
    end
    object EXCURSIONQryCITYID: TIntegerField
      FieldName = 'CITYID'
      Origin = '"EXCURSION"."CITYID"'
    end
    object EXCURSIONQryDRVKIND: TIntegerField
      FieldName = 'DRVKIND'
      Origin = '"EXCURSION"."DRVKIND"'
    end
    object EXCURSIONQrySTANDDAYS: TIntegerField
      FieldName = 'STANDDAYS'
      Origin = '"EXCURSION"."STANDDAYS"'
    end
    object EXCURSIONQryCURR2ID: TIntegerField
      FieldName = 'CURR2ID'
      Origin = '"EXCURSION"."CURR2ID"'
    end
    object EXCURSIONQryCURR1ID: TIntegerField
      FieldName = 'CURR1ID'
      Origin = '"EXCURSION"."CURR1ID"'
    end
    object EXCURSIONQryZ_P: TIntegerField
      FieldName = 'Z_P'
      Origin = '"EXCURSION"."Z_P"'
    end
    object EXCURSIONQryPRICEIND_GUIDE: TFloatField
      FieldName = 'PRICEIND_GUIDE'
      Origin = '"EXCURSION"."PRICEIND_GUIDE"'
    end
    object EXCURSIONQryPRICEIND_DRIVE: TFloatField
      FieldName = 'PRICEIND_DRIVE'
      Origin = '"EXCURSION"."PRICEIND_DRIVE"'
    end
    object EXCURSIONQryPRICEIND_TICKET: TFloatField
      FieldName = 'PRICEIND_TICKET'
      Origin = '"EXCURSION"."PRICEIND_TICKET"'
    end
    object EXCURSIONQryPRICEIND_OUR: TFloatField
      FieldName = 'PRICEIND_OUR'
      Origin = '"EXCURSION"."PRICEIND_OUR"'
    end
    object EXCURSIONQryPRICEIND_OUTSIDE: TFloatField
      FieldName = 'PRICEIND_OUTSIDE'
      Origin = '"EXCURSION"."PRICEIND_OUTSIDE"'
    end
    object EXCURSIONQryPRICEGRP_GUIDE: TFloatField
      FieldName = 'PRICEGRP_GUIDE'
      Origin = '"EXCURSION"."PRICEGRP_GUIDE"'
    end
    object EXCURSIONQryPRICEGRP_DRIVE: TFloatField
      FieldName = 'PRICEGRP_DRIVE'
      Origin = '"EXCURSION"."PRICEGRP_DRIVE"'
    end
    object EXCURSIONQryPRICEGRP_TICKET: TFloatField
      FieldName = 'PRICEGRP_TICKET'
      Origin = '"EXCURSION"."PRICEGRP_TICKET"'
    end
    object EXCURSIONQryPRICEGRP_OUR: TFloatField
      FieldName = 'PRICEGRP_OUR'
      Origin = '"EXCURSION"."PRICEGRP_OUR"'
    end
    object EXCURSIONQryPRICEIGRP_OUTSIDE: TFloatField
      FieldName = 'PRICEIGRP_OUTSIDE'
      Origin = '"EXCURSION"."PRICEIGRP_OUTSIDE"'
    end
    object EXCURSIONQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"EXCURSION"."NAME"'
      Size = 45
    end
    object EXCURSIONQryDURATION: TFloatField
      FieldName = 'DURATION'
      Origin = '"EXCURSION"."DURATION"'
    end
    object EXCURSIONQryMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
      Origin = '"EXCURSION"."MANAGERID"'
    end
    object EXCURSIONQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"EXCURSION"."COUNTRYID"'
    end
    object EXCURSIONQryLNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
    object EXCURSIONQryLNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
      ProviderFlags = []
    end
    object EXCURSIONQryTYPETRIP: TIntegerField
      FieldName = 'TYPETRIP'
      Origin = '"EXCURSION"."TYPETRIP"'
    end
    object EXCURSIONQryTYPEPLACE: TIntegerField
      FieldName = 'TYPEPLACE'
      Origin = '"EXCURSION"."TYPEPLACE"'
    end
    object EXCURSIONQryTYPECONTENT: TIntegerField
      FieldName = 'TYPECONTENT'
      Origin = '"EXCURSION"."TYPECONTENT"'
    end
    object EXCURSIONQryNEEDGUIDE: TIntegerField
      FieldName = 'NEEDGUIDE'
      Origin = '"EXCURSION"."NEEDGUIDE"'
    end
    object EXCURSIONQryISREQUIRED: TIntegerField
      FieldName = 'ISREQUIRED'
      Origin = '"EXCURSION"."ISREQUIRED"'
    end
    object EXCURSIONQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object EXCURSIONQryTYPEEX: TStringField
      FieldName = 'TYPEEX'
      Size = 25
    end
    object EXCURSIONQryGUIDE: TStringField
      FieldName = 'GUIDE'
      Size = 1
    end
    object EXCURSIONQryFORCED: TStringField
      FieldName = 'FORCED'
      Size = 1
    end
    object EXCURSIONQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
  end
  object EXCURSIONSrc: TDataSource
    DataSet = EXCURSIONQry
    Left = 536
    Top = 832
  end
  object EXCURS_LAYOUT_DESCRIPTQry: TADOQuery
    Connection = ADOConnection
    DataSource = EXCURSIONSrc
    Parameters = <
      item
        Name = 'EID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from EXCURS_LAYOUT_DESCRIPT'
      'where ID_EXCURSION=:EID')
    Left = 944
    Top = 776
    object EXCURS_LAYOUT_DESCRIPTQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"EXCURS_LAYOUT_DESCRIPT"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EXCURS_LAYOUT_DESCRIPTQryID_EXCURSION: TIntegerField
      FieldName = 'ID_EXCURSION'
      Origin = '"EXCURS_LAYOUT_DESCRIPT"."ID_EXCURSION"'
    end
    object EXCURS_LAYOUT_DESCRIPTQryAORDER: TIntegerField
      FieldName = 'AORDER'
      Origin = '"EXCURS_LAYOUT_DESCRIPT"."AORDER"'
    end
    object EXCURS_LAYOUT_DESCRIPTQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"EXCURS_LAYOUT_DESCRIPT"."NAME"'
      Size = 200
    end
  end
  object EXCURS_LAYOUT_DESCRIPTSrc: TDataSource
    DataSet = EXCURS_LAYOUT_DESCRIPTQry
    Left = 944
    Top = 824
  end
  object EXCURSION_PLACEQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from EXCURSION_PLACE')
    Left = 1088
    Top = 776
    object EXCURSION_PLACEQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"EXCURSION_PLACE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object EXCURSION_PLACEQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"EXCURSION_PLACE"."NAME"'
      Size = 100
    end
  end
  object EXCURSION_PLACESrc: TDataSource
    DataSet = EXCURSION_PLACEQry
    Left = 1088
    Top = 832
  end
  object DrvKindsQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from DrvKinds')
    Left = 1368
    Top = 272
    object DrvKindsQryDRIVEKIND: TIntegerField
      FieldName = 'DRIVEKIND'
      Origin = '"DRVKINDS"."DRIVEKIND"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DrvKindsQryKIND: TIBStringField
      FieldName = 'KIND'
      Origin = '"DRVKINDS"."KIND"'
      Required = True
      Size = 15
    end
    object DrvKindsQryCATEGORY: TSmallintField
      FieldName = 'CATEGORY'
      Origin = '"DRVKINDS"."CATEGORY"'
    end
    object DrvKindsQryKINDSHORT: TIBStringField
      FieldName = 'KINDSHORT'
      Origin = '"DRVKINDS"."KINDSHORT"'
      Size = 5
    end
    object DrvKindsQryKIND_ENG: TIBStringField
      FieldName = 'KIND_ENG'
      Origin = '"DRVKINDS"."KIND_ENG"'
      Size = 15
    end
  end
  object DrvKindsSrc: TDataSource
    DataSet = DrvKindsQry
    Left = 1368
    Top = 320
  end
  object EXCURS_TYPE_CONTENTQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from EXCURS_TYPE_CONTENT')
    Left = 1224
    Top = 776
    object IntegerField12: TIntegerField
      FieldName = 'ID'
      Origin = '"EXCURSION_PLACE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField3: TIBStringField
      FieldName = 'NAME'
      Origin = '"EXCURSION_PLACE"."NAME"'
      Size = 100
    end
  end
  object EXCURS_TYPE_CONTENTSrc: TDataSource
    DataSet = EXCURS_TYPE_CONTENTQry
    Left = 1224
    Top = 832
  end
  object SCHEDITEM_TOURS_WEB_TEMPLATE: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '  select SCHEDITEM_TOURS_WEB_TEMPLATE.*,'
      '   ( select Count(Languages.ID) from Languages'
      
        '  left join SCHED_TOUR_WEB_TEM_LNG on SCHED_TOUR_WEB_TEM_LNG.id_' +
        'lng = Languages.id and SCHED_TOUR_WEB_TEM_LNG.id_scheditem_tours' +
        '_web_template =  SCHEDITEM_TOURS_WEB_TEMPLATE.id'
      
        '  where Languages.active_translate is not null and SCHED_TOUR_WE' +
        'B_TEM_LNG.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( SCHED_TOUR_WEB_TEM_LNG.change_representation ) f' +
        'rom SCHED_TOUR_WEB_TEM_LNG where SCHED_TOUR_WEB_TEM_LNG.id_sched' +
        'item_tours_web_template = SCHEDITEM_TOURS_WEB_TEMPLATE.id ) LNGC' +
        'HANGE'
      ''
      '  from  SCHEDITEM_TOURS_WEB_TEMPLATE')
    Left = 1424
    Top = 672
    object SCHEDITEM_TOURS_WEB_TEMPLATEID: TIntegerField
      FieldName = 'ID'
      Origin = '"SCHEDITEM_TOURS_WEB_TEMPLATE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SCHEDITEM_TOURS_WEB_TEMPLATETYPEOBJ: TIntegerField
      FieldName = 'TYPEOBJ'
      Origin = '"SCHEDITEM_TOURS_WEB_TEMPLATE"."TYPEOBJ"'
    end
    object SCHEDITEM_TOURS_WEB_TEMPLATEACTIONTYPE: TIntegerField
      FieldName = 'ACTIONTYPE'
      Origin = '"SCHEDITEM_TOURS_WEB_TEMPLATE"."ACTIONTYPE"'
    end
    object SCHEDITEM_TOURS_WEB_TEMPLATENAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"SCHEDITEM_TOURS_WEB_TEMPLATE"."NAME"'
      Size = 100
    end
    object SCHEDITEM_TOURS_WEB_TEMPLATEREPRESENTATION: TIBStringField
      FieldName = 'REPRESENTATION'
      Origin = '"SCHEDITEM_TOURS_WEB_TEMPLATE"."REPRESENTATION"'
      Size = 1000
    end
    object SCHEDITEM_TOURS_WEB_TEMPLATELNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object SCHEDITEM_TOURS_WEB_TEMPLATELNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object SCHEDITEM_TOURS_WEB_TEMPLATESrc: TDataSource
    DataSet = SCHEDITEM_TOURS_WEB_TEMPLATE
    Left = 1424
    Top = 720
  end
  object SCHEDITEM_TOURS_WEB_TIME: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '  select SCHEDITEM_TOURS_WEB_TIME.*,'
      '  ( select Count(Languages.ID) from Languages'
      
        '  left join SCHED_TOUR_WEB_TIME_LNG on SCHED_TOUR_WEB_TIME_LNG.i' +
        'd_lng = Languages.id and SCHED_TOUR_WEB_TIME_LNG.id_scheditem_to' +
        'urs_web_time =  SCHEDITEM_TOURS_WEB_TIME.id'
      
        '  where Languages.active_translate is not null and SCHED_TOUR_WE' +
        'B_TIME_LNG.id_lng is null ) LNGNOTFOUND,'
      
        '  ( select sum( SCHED_TOUR_WEB_TIME_LNG.change_representation ) ' +
        'from SCHED_TOUR_WEB_TIME_LNG where SCHED_TOUR_WEB_TIME_LNG.id_sc' +
        'heditem_tours_web_time = SCHEDITEM_TOURS_WEB_TIME.id ) LNGCHANGE'
      ''
      '  from SCHEDITEM_TOURS_WEB_TIME'
      '')
    Left = 1552
    Top = 656
    object SCHEDITEM_TOURS_WEB_TIMEID: TIntegerField
      FieldName = 'ID'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SCHEDITEM_TOURS_WEB_TIMENAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."NAME"'
      Size = 100
    end
    object SCHEDITEM_TOURS_WEB_TIMETYPEOBJ: TIntegerField
      FieldName = 'TYPEOBJ'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."TYPEOBJ"'
    end
    object SCHEDITEM_TOURS_WEB_TIMEACTIONTYPE: TIntegerField
      FieldName = 'ACTIONTYPE'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."ACTIONTYPE"'
    end
    object SCHEDITEM_TOURS_WEB_TIMETIMEOBJ: TIntegerField
      FieldName = 'TIMEOBJ'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."TIMEOBJ"'
    end
    object SCHEDITEM_TOURS_WEB_TIMETIMEFROM: TDateTimeField
      FieldName = 'TIMEFROM'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."TIMEFROM"'
    end
    object SCHEDITEM_TOURS_WEB_TIMETIMETILL: TDateTimeField
      FieldName = 'TIMETILL'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."TIMETILL"'
    end
    object SCHEDITEM_TOURS_WEB_TIMEREPRESENTATION: TIBStringField
      FieldName = 'REPRESENTATION'
      Origin = '"SCHEDITEM_TOURS_WEB_TIME"."REPRESENTATION"'
      Size = 250
    end
    object SCHEDITEM_TOURS_WEB_TIMELNGCHANGE: TLargeintField
      FieldName = 'LNGCHANGE'
    end
    object SCHEDITEM_TOURS_WEB_TIMELNGNOTFOUND: TLargeintField
      FieldName = 'LNGNOTFOUND'
    end
  end
  object SCHEDITEM_TOURS_WEB_TIMESrc: TDataSource
    DataSet = SCHEDITEM_TOURS_WEB_TIME
    Left = 1552
    Top = 704
  end
  object LNG_TRANSLATE_TEMPLATE: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT * from LNG_TRANSLATE_TEMPLATE')
    Left = 1424
    Top = 776
    object LNG_TRANSLATE_TEMPLATEID: TIntegerField
      FieldName = 'ID'
      Origin = '"LNG_TRANSLATE_TEMPLATE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LNG_TRANSLATE_TEMPLATEID_LNG: TIntegerField
      FieldName = 'ID_LNG'
      Origin = '"LNG_TRANSLATE_TEMPLATE"."ID_LNG"'
      Required = True
    end
    object LNG_TRANSLATE_TEMPLATETABLE_IND: TIntegerField
      FieldName = 'TABLE_IND'
      Origin = '"LNG_TRANSLATE_TEMPLATE"."TABLE_IND"'
    end
    object LNG_TRANSLATE_TEMPLATEATEMPLATE: TIBStringField
      FieldName = 'ATEMPLATE'
      Origin = '"LNG_TRANSLATE_TEMPLATE"."ATEMPLATE"'
      Size = 200
    end
    object LNG_TRANSLATE_TEMPLATEUPPERCASE: TIntegerField
      FieldName = 'UPPERCASE'
      Origin = '"LNG_TRANSLATE_TEMPLATE"."UPPERCASE"'
    end
  end
  object LNG_TRANSLATE_TEMPLATESrc: TDataSource
    DataSet = LNG_TRANSLATE_TEMPLATE
    Left = 1424
    Top = 824
  end
  object LNG_TRANSL_TEMP_DETAIL: TADOQuery
    Connection = ADOConnection
    DataSource = LNG_TRANSLATE_TEMPLATESrc
    Parameters = <
      item
        Name = 'ID'
        DataType = ftInteger
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * from LNG_TRANSL_TEMP_DETAIL'
      'WHERE ID_LNG_TRANSLATE_TEMPLATE =:ID')
    Left = 1576
    Top = 778
    object LNG_TRANSL_TEMP_DETAILID: TIntegerField
      FieldName = 'ID'
      Origin = '"LNG_TRANSL_TEMP_DETAIL"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LNG_TRANSL_TEMP_DETAILID_LNG_TRANSLATE_TEMPLATE: TIntegerField
      FieldName = 'ID_LNG_TRANSLATE_TEMPLATE'
      Origin = '"LNG_TRANSL_TEMP_DETAIL"."ID_LNG_TRANSLATE_TEMPLATE"'
    end
    object LNG_TRANSL_TEMP_DETAILNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"LNG_TRANSL_TEMP_DETAIL"."NAME"'
      Size = 100
    end
    object LNG_TRANSL_TEMP_DETAILORDER: TIntegerField
      FieldName = 'AORDER'
    end
  end
  object LNG_TRANSL_TEMP_DETAILSrc: TDataSource
    DataSet = LNG_TRANSL_TEMP_DETAIL
    Left = 1576
    Top = 832
  end
  object CountrySectDescrQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select COUNTRY_SECT_DESCRIPTS.*, case'
      
        '    WHEN (COUNTRY_SECT_DESCRIPTS.dictsectionid is not null) THEN' +
        ' (select first 1 DICTSECTIONS.sectionname from DICTSECTIONS wher' +
        'e DICTSECTIONS.dictsectionid = COUNTRY_SECT_DESCRIPTS.dictsectio' +
        'nid )'
      
        '    WHEN (COUNTRY_SECT_DESCRIPTS.itemid is not null) THEN (selec' +
        't  first 1 DICTSECTION_ITEMS.itemname from DICTSECTION_ITEMS  wh' +
        'ere DICTSECTION_ITEMS.itemid = COUNTRY_SECT_DESCRIPTS.itemid )'
      
        '    WHEN (COUNTRY_SECT_DESCRIPTS.name is not null) THEN ( COUNTR' +
        'Y_SECT_DESCRIPTS.name )'
      '    ELSE '#39#39
      '    END NAME_ITEM'
      'from COUNTRY_SECT_DESCRIPTS')
    Left = 1469
    Top = 274
    object CountrySectDescrQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRY_SECT_DESCRIPTS"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CountrySectDescrQryAORDER: TIntegerField
      FieldName = 'AORDER'
      Origin = '"COUNTRY_SECT_DESCRIPTS"."AORDER"'
    end
    object CountrySectDescrQryPARENT: TIntegerField
      FieldName = 'PARENT'
      Origin = '"COUNTRY_SECT_DESCRIPTS"."PARENT"'
    end
    object CountrySectDescrQryDICTSECTIONID: TIntegerField
      FieldName = 'DICTSECTIONID'
      Origin = '"COUNTRY_SECT_DESCRIPTS"."DICTSECTIONID"'
    end
    object CountrySectDescrQryITEMID: TIntegerField
      FieldName = 'ITEMID'
      Origin = '"COUNTRY_SECT_DESCRIPTS"."ITEMID"'
    end
    object CountrySectDescrQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRY_SECT_DESCRIPTS"."NAME"'
      Size = 250
    end
    object CountrySectDescrQryNAME_ITEM: TIBStringField
      FieldName = 'NAME_ITEM'
      ProviderFlags = []
      Size = 250
    end
  end
  object CountrySectDescrSrc: TDataSource
    DataSet = CountrySectDescrQry
    Left = 1467
    Top = 322
  end
  object ItsKonsulQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrCountrySrc
    Parameters = <
      item
        Name = 'CountryId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select C.CompanyId, C.Name as EmbassyName,'
      '              E.InProvince ItsKonsul, E.CountryId,'
      '              COALESCE(FUNDINGSUM, 0) FUNDINGSUM, FUNDINGVAL,'
      '              FUNDINGCOUNT, FUNDINGPERIOD,'
      
        '              COALESCE(BANKSUM, 0) BANKSUM, BANKVAL, BANKCOUNT, ' +
        'BANKPERIOD,'
      '              PERMTRANSFDOC, COALESCE(ONTOURSUM, 0) ONTOURSUM,'
      
        '              PayBankServ, CurrServ, ReadyToDays, ReadyToType, A' +
        'utoFilling,'
      '              UseCode, OurFiling, ApplTypeDate,'
      
        '              ServCost, ServCostVal, E.ParentId, E.CntrEmbassyId' +
        ','
      
        '              Ci.Name CityName, FilingPlaceWork, FullFunding, TY' +
        'PEFUNDING, E.Comments'
      '              from CntrEmbassies E'
      '              left join Companies C on C.CompanyId = E.EmbassyId'
      
        '              left join CompOffices Co on Co.CompanyId = C.Compa' +
        'nyId and Co.IsDefault = '#39'T'#39
      '              left join Cities Ci on Ci.CityId = Co.CityId'
      '              '
      'where E.CountryId = :CountryId'
      '              and E.OurEmbassy = '#39'F'#39
      
        '              and ( (E.InProvince is not null) and (E.InProvince' +
        ' <> '#39#39') or (E.ForOwnerVisa = '#39'T'#39') )'
      '              order by Ci.Name, C.Name')
    Left = 1464
    Top = 382
    object ItsKonsulQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object ItsKonsulQryEMBASSYNAME: TStringField
      DisplayLabel = #1050#1086#1085#1089#1091#1083#1100#1089#1090#1074#1086
      FieldName = 'EMBASSYNAME'
      Size = 100
    end
    object ItsKonsulQryBANKPERIOD: TSmallintField
      FieldName = 'BANKPERIOD'
    end
    object ItsKonsulQryBANKCOUNT: TIntegerField
      FieldName = 'BANKCOUNT'
    end
    object ItsKonsulQryBANKVAL: TSmallintField
      FieldName = 'BANKVAL'
    end
    object ItsKonsulQryFUNDINGPERIOD: TSmallintField
      FieldName = 'FUNDINGPERIOD'
    end
    object ItsKonsulQryFUNDINGCOUNT: TIntegerField
      FieldName = 'FUNDINGCOUNT'
    end
    object ItsKonsulQryFUNDINGVAL: TSmallintField
      FieldName = 'FUNDINGVAL'
    end
    object ItsKonsulQryITSKONSUL: TStringField
      FieldName = 'ITSKONSUL'
      Size = 80
    end
    object ItsKonsulQryFUNDINGSUM: TFloatField
      FieldName = 'FUNDINGSUM'
    end
    object ItsKonsulQryBANKSUM: TFloatField
      FieldName = 'BANKSUM'
    end
    object ItsKonsulQryCalcFundingSum: TStringField
      DisplayLabel = #1044#1086#1093#1110#1076
      FieldKind = fkCalculated
      FieldName = 'CalcFundingSum'
      Size = 80
      Calculated = True
    end
    object ItsKonsulQryCalcBankSum: TStringField
      DisplayLabel = #1047#1072#1083#1080#1096#1086#1082' '#1074' '#1073#1072#1085#1082#1091
      FieldKind = fkCalculated
      FieldName = 'CalcBankSum'
      Size = 80
      Calculated = True
    end
    object ItsKonsulQryONTOURSUM: TFloatField
      FieldName = 'ONTOURSUM'
    end
    object ItsKonsulQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object ItsKonsulQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object ItsKonsulQryPAYBANKSERV: TFloatField
      FieldName = 'PAYBANKSERV'
    end
    object ItsKonsulQryCURRSERV: TSmallintField
      FieldName = 'CURRSERV'
    end
    object ItsKonsulQryREADYTOTYPE: TIntegerField
      FieldName = 'READYTOTYPE'
    end
    object ItsKonsulQryREADYTODAYS: TIntegerField
      FieldName = 'READYTODAYS'
    end
    object ItsKonsulQryAUTOFILLING: TStringField
      FieldName = 'AUTOFILLING'
      Size = 1
    end
    object ItsKonsulQryUSECODE: TStringField
      FieldName = 'USECODE'
      Size = 1
    end
    object ItsKonsulQrySERVCOST: TFloatField
      FieldName = 'SERVCOST'
    end
    object ItsKonsulQrySERVCOSTVAL: TSmallintField
      FieldName = 'SERVCOSTVAL'
    end
    object ItsKonsulQryCalcOnTourSum: TStringField
      DisplayLabel = '+ '#1053#1072' '#1090#1091#1088
      FieldKind = fkCalculated
      FieldName = 'CalcOnTourSum'
      Calculated = True
    end
    object ItsKonsulQryPARENTID: TIntegerField
      FieldName = 'PARENTID'
    end
    object ItsKonsulQryCntrEmbassyId: TIntegerField
      FieldName = 'CntrEmbassyId'
    end
    object ItsKonsulQryCITYNAME: TStringField
      DisplayLabel = #1040#1076#1088#1077#1089#1072
      FieldName = 'CITYNAME'
      Size = 190
    end
    object ItsKonsulQryAPPLTYPEDATE: TIntegerField
      FieldName = 'APPLTYPEDATE'
    end
    object ItsKonsulQryOURFILING: TStringField
      FieldName = 'OURFILING'
      Size = 1
    end
    object ItsKonsulQryCalcEmbassyName: TStringField
      DisplayLabel = #1050#1086#1085#1089#1091#1083#1100#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'CalcEmbassyName'
      Size = 250
      Calculated = True
    end
    object ItsKonsulQryPERMTRANSFDOC: TSmallintField
      FieldName = 'PERMTRANSFDOC'
      Origin = '"CNTREMBASSIES"."PERMTRANSFDOC"'
    end
    object ItsKonsulQryFILINGPLACEWORK: TStringField
      FieldName = 'FILINGPLACEWORK'
      Size = 1
    end
    object ItsKonsulQryFULLFUNDING: TStringField
      FieldName = 'FULLFUNDING'
      Size = 1
    end
    object ItsKonsulQryTYPEFUNDING: TIntegerField
      FieldName = 'TYPEFUNDING'
    end
  end
  object EmbassySrc: TDataSource
    DataSet = ItsKonsulQry
    Left = 1464
    Top = 425
  end
  object ImageListVEHICLE: TImageList
    Left = 1536
    Top = 57
    Bitmap = {
      494C01010A000F00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D2955C00FDF9F5000000000000000000FBF7F400C1855D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9813E00C87A290000000000000000000000000000000000AA500B00C58F
      6E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D18A
      4000E4B16700EAB75A0000000000000000000000000000000000C9710500B75F
      0300C89677000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4924D00E7B6
      6C00FDD87C00E09A2F00C56E0B00C56E0B00C56E0B00C56E0B00C56E0B00DC86
      0000B35B0300C8967B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EBC38400F1CB7F00FFE2
      8C00F4C35700F1BD5700EEB84A00EBB13E00E6A53100DF972300D88A1300D17C
      0500D9830000B7600100C8997E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1CB8500F5D28900FFE08F00F8CF
      6A00F6CA6800F2C15C00EDB84F00EAB04500E5A53600E0992C00DB8F1C00D583
      0E00CE780100D9830000BD660100EBD8C8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1C57100FFFFD700FEDA7B00FAD2
      7000F7CF6E00F2C46000EFBA5100EBB34400E7A73700E29D2C00DE922200D889
      1700D27D0700D37A0000DE870100AE6428000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6B26900FFF2C600FEDD
      8600F7CC6500FAD17700F9D87C00F7CC6D00F3C56200F0BE5500E4A53700DA8C
      1C00DB8C1000D57F0400B3672C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2AA5A00FFF6
      C800FCDB7D00F6D18300E4A53700E4A53700E4A53700E4A53700E6B25B00E39B
      2300DE911A00AE62270000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D0D0
      D000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4AE
      6000FFFFD400EDBE590000000000000000000000000000000000DC902700EDB0
      3800B26831000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C2C2
      C20000000000DDDDDD00E6E6E600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E3A96000EBBB650000000000000000000000000000000000D58C2C00B168
      2800000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CFCF
      CF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D38D3A0000000000000000000000000000000000B7682E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007D7BE300D2D2F30000000000000000000000000000000000DEDEE6004D4B
      CA00CFCEE2000000000000000000000000000000000000000000000000000000
      000000000000000000007B0000007B0000007B0000007B000000FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BAB8
      F1000906F800211FDD00E0E0EF00000000000000000000000000716FDB003C3A
      D400000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B00000000FF000000FF00007B00000000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000CECECE003E3E
      3E006E6E6E00000000005E5E5E003E3E3E00CECECE0000000000DEDEDE007E7E
      7E001E1E1E002E2E2E008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      E9001919EC000A0AFA006767D8000000000000000000ADADE6000D0CEC007979
      CE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B00000000FF000000FF00007B000000000000000000
      00000000000000000000000000000000000000000000000000007E7E7E000000
      000000000000DEDEDE0000000000000000008E8E8E00000000003E3E3E000000
      00006E6E6E005E5E5E003E3E3E000000000000000000000000000000000089D4
      9C00169837001598360015973600159736001597360015973600169837001597
      360057BB70000000000000000000000000000000000000000000000000000000
      0000696BD900161BF8001016ED00C3C2EE00CAC9EF00272CF4002B2DE100E9E9
      F300000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B0000007B00000000FF000000FF00007B0000007B0000007B00
      00007B00000000000000000000000000000000000000000000002E2E2E000000
      0000000000005E5E5E0000000000000000004E4E4E00DEDEDE00000000005E5E
      5E000000000000000000DEDEDE00000000000000000000000000000000000000
      00008AD39D0013963400149635001597360015973600159736001294330056BA
      6F00000000000000000000000000000000000000000000000000000000000000
      0000E1E1F100575CDF001F2FFC003A43EF003946F300212FF600AFAEEB000000
      0000000000000000000000000000000000000000000000000000000000007B00
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00007B0000000000000000000000000000000000000000000000000000003E3E
      3E000000000000000000000000003E3E3E000E0E0E00BEBEBE00000000007E7E
      7E00000000000000000000000000000000000000000000000000000000000000
      0000000000008DD5A0001497350014963500159736001395340056BA6F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B8B7EC004553F3001D34F8001A2FF7008888EB00000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
      00007B00000000000000000000000000000000000000AEAEAE00000000007E7E
      7E002E2E2E00000000003E3E3E006E6E6E0000000000CECECE001E1E1E001E1E
      1E0000000000DEDEDE007E7E7E00000000000000000000000000000000000000
      0000000000000000000098D9A800159736001294330066C17D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B3B4F9005564F5002D47F6003C54F8003F58F600767DF100000000000000
      0000000000000000000000000000000000000000000000000000000000007B00
      00007B0000007B0000007B00000000FF000000FF00007B0000007B0000007B00
      00007B000000000000000000000000000000000000006E6E6E0000000000BEBE
      BE006E6E6E00000000007E7E7E00AEAEAE00000000008E8E8E008E8E8E000E0E
      0E0000000000000000003E3E3E00000000000000000000000000000000000000
      000000000000000000000000000097D8A7005FBF770000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4AA
      E8003553F6002F51F8004762F8008487F5008F95F6005874F8006076F600CACD
      FB00000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B00000000FF000000FF00007B000000000000000000
      00000000000000000000000000000000000000000000CECECE00BEBEBE000000
      0000DEDEDE00BEBEBE000000000000000000BEBEBE00DEDEDE00000000000000
      00009E9E9E00BEBEBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000495D
      FB004B6FF8005C73F8009394F70000000000000000009F9FF7006B7DF700687B
      F800AAAFF900000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00000000007B00000000FF000000FF00007B000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008F8F
      F6006268F500A5A2F70000000000000000000000000000000000E5E5FB008887
      F500666AF5000000000000000000000000000000000000000000000000000000
      000000000000000000007B0000007B0000007B0000007B000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F5F1EA00F2EADE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDCD006A6A6A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EFE0CA00D9B07500D8B68400E7D0AC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EEEEEE00A4A4
      A4002D2D2D000000000003030300DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ADADAD00656565005757570055555500646464009D9D9D00EDED
      ED00000000000000000000000000000000000000000000000000000000000000
      000000000000F0E9DC00EFE1CD00D6AC6D00D9B27900E9D3B200F4EFE600F9F8
      F4000000000000000000000000000000000060829900DBE2E700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000064849A0000000000000000009F9F9F00020202000000
      0000000000000404040005050500060606000404040009090900989898000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F000696969006E6E6E00D5D5D500A0A0A0008C8C8C00DADADA00818181005D5D
      5D00E6E6E60000000000000000000000000000000000F9F6EF00F4EEE400D6AF
      7600F4EEE500E5CFAA00F2E9DA00DFC69D00DCBF9300F4EBDD00DFC49900F8F3
      EB00DDBB8A00F2ECE300000000000000000067869D00A7B8C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B9C8D2005B7D960000000000000000000E0E0E00000000000404
      040004040400020202000D0D0D00CACACA00E3E3E300ABABAB00000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B009F9F9F000000000000000000B9B9B9009E9E9E000000000000000000C1C1
      C1005A5A5A00F3F3F300000000000000000000000000F7F4EF00DCBD8E00D7AE
      7000E1C79E00EEE1CC00DABA8900D7B27900D6AF7300D9BA8900ECDCC300E6D1
      AF00D5A86600DCBD8B00F7F3ED000000000098ADBC007491A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000839DB000879FB10000000000000000001B1B1B00030303000404
      04000404040002020200151515000000000000000000F2F2F2006D6D6D000000
      0000000000000000000000000000000000000000000000000000C5C5C5006E6E
      6E000000000000000000000000008B8B8B007575750000000000000000000000
      00008A898A00A2A2A200000000000000000000000000F7F2EA00D2A35E00DCBB
      8700DCBE8F00D5AA6C00D8B88300E9D4B300EDDCC100D9B78200D6AE7300DABB
      8A00DDBE8D00CD994D00F9F3E90000000000CDD7DE004B718C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000587B9400BAC8D20000000000000000001C1C1C00030303000404
      0400040404000202020018181800000000000000000000000000000000000000
      0000E1E1E100000000000000000000000000000000000000000077777700C9C9
      C90000000000000000008080800045454500464646006A6A6A00000000000000
      0000DEDEDE006565650000000000000000000000000000000000F8F5EE00F2EB
      E000E5CEAB00DEBF9100F1E9D900D7AE7000D6AE7200F0E5D300E0C19200DFBF
      9100EFE1CB00F4EEE300000000000000000000000000436C8600CDD7DF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEE3E8003E6784000000000000000000000000001C1C1C00030303000404
      0400040404000202020014141400000000000000000000000000000000000000
      000063636300A7A7A70000000000000000000000000000000000545454007272
      72008989890076767600474747004B4B4B004B4B4B00474747006C6C6C008989
      89007B7B7B005656560000000000000000000000000000000000ECDFC800E6D1
      B000E0CCAA00DEC49A00D8AF7300D7AE7000D5AD6F00D7AF7200DCBB8600DDC2
      9600E4CCA500E9D5B600000000000000000000000000618299009AAFBE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFBFCB00557890000000000000000000000000001C1C1C00030303000404
      040004040400020202001515150000000000BABABA007A7A7A007D7D7D007F7F
      7F002929290000000000AAAAAA0000000000000000000000000058585800A6A6
      A600D3D3D300BBBBBB00494949004A4A4A004A4A4A0046464600AFAFAF00D3D3
      D300B6B6B6005A5A5A0000000000000000000000000000000000F7F2E900F2E8
      D700E5D1B000E0C39900F1E8D700D6AD7100D6AE7100F1E6D400DEC09000DFC3
      9A00F0E3D000F6F1E90000000000000000000000000096ACBB0063849B000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007591A500829DAF000000000000000000000000001C1C1C00030303000404
      040004040400020202001717170000000000A8A8A800595959005B5B5B005F5F
      5F002121210000000000B6B6B60000000000000000000000000098989800B0B0
      B0000000000000000000BCBCBC004C4C4C0047474700A7A7A700000000000000
      0000CCCCCC0075757500000000000000000000000000F6EFE400D1A05900DDC0
      9200DFC59D00D6AE7100D9B88300E8D5B600E9D6B800DBBB8900D4AA6A00DABB
      8B00D9B98400D2A36000F8F2E9000000000000000000D6DEE4002F5B79004069
      8400426A8600426A8600426A8600426A8600426A8600426A8600426A8600426A
      860029567500C2CFD8000000000000000000000000001C1C1C00030303000404
      0400040404000202020017171700000000000000000000000000000000000000
      000066666600B4B4B40000000000000000000000000000000000DDDDDD005B5B
      5B0000000000000000000000000000000000EEEEEE0000000000000000000000
      000064646400C4C4C400000000000000000000000000F7F1E700DCBD8C00D6AB
      6B00E2C79E00ECDCC600D9BA8900D7B07500D8B17700D8B88500EDDFC700E5CF
      AA00D8AF7200DCBC8C00000000000000000000000000D9E0E500436A86002755
      7500275575002755750027557500275575002755750027557500275575002755
      750036617E00D0D9DF000000000000000000000000001C1C1C00030303000404
      0400030303000000000002020200000000000000000000000000000000000000
      0000E5E5E500000000000000000000000000000000000000000000000000AFAF
      AF0058585800E4E4E40000000000000000000000000000000000000000007474
      74008D8D8D0000000000000000000000000000000000F9F6F000F3EFE800DAB3
      7700F7F1E800E3C79C00F2E9DA00DEC49600DFC39800F1E8D800E6CDA900F6EE
      E100D7AC6C00F2E7D600F9F6F00000000000B9C8D2003A6380003B6582003862
      7F00396380003963800039638000396380003963800039638000396380003862
      7F003B65820037617F00AABDC80000000000000000001B1B1B00030303000303
      0300101010005D5D5D00C3C3C3000000000000000000F4F4F4008B8B8B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAF005656560087878700BFBFBF00C5C5C50093939300565656009494
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000F3EBDF00ECDABF00D8B27700D7AF7500F0E2CA00F2E9D9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000F0F0F00000000001616
      160088888800C8C8C800D5D5D500CACACA00CBCBCB0097979700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E2E2E200A9A9A900838383007D7D7D00A7A7A700DADADA000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EAD4B400D7B37D00D5AE7400EEDBBD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A7A7A7001D1D1D001E1E
      1E001C1C1C000C0C0C000808080008080800080808000E0E0E009F9F9F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F1EBE000F5EFE40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      F99FFFFF00000000F3CF0FFF00000000E3C7EFFF00000000C003EFFF00000000
      8001E0FF000000000000FEFF000000000000FEFF000000008001FE0700000000
      C003FFE700000000E3C7FFE100000000F3CFFFE100000000FBDFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFF3C7FC17FFFFFFFFE1CFFC27C441FFFFE18FFC3F
      C041E007F00FE007C00DF00FF01FE007C00FF81FF83FE0078009FC3FF03FE007
      8001FE7FE00FFC3F9333FFFFE187E43FFFFFFFFFE3C7FC3FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFF9FFFFFF
      FC3FFFFFC0FFF80FF80F3FFD801FE00780033FF9801FE66380013FF9819FCE73
      80013FF981F7CC33C0039FF381F3C003C0039FF38101C003C0039FF38101CC33
      8001800381F3CF738003800381F7E3E780010001819FF00FF81FFFFF801FF81F
      FC3FFFFF801FFFFFFE7FFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageListDirectionVEHICLE: TImageList
    Left = 1536
    Top = 9
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000089D4
      9C00169837001598360015973600159736001597360015973600169837001597
      360057BB70000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005FBF770097D8A70000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6AC
      F3003211F7003211F7003211F7003211F7003211F7003211F7003211F7003211
      F7008472F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B6ACF3008472F20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008AD39D0013963400149635001597360015973600159736001294330056BA
      6F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000066C17D00129433001597360098D9A800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6ACF3003211F7003211F7003211F7003211F7003211F7003211F7008472
      F200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B6ACF3003211F7003211F7008472F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008DD5A0001497350014963500159736001395340056BA6F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056BA6F00139534001597360014963500149735008DD5A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B6ACF3003211F7003211F7003211F7003211F7008472F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B6ACF3003211F7003211F7003211F7003211F7008472F2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000098D9A800159736001294330066C17D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000056BA6F001294330015973600159736001597360014963500139634008AD3
      9D00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B6ACF3003211F7003211F7008472F200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6ACF3003211F7003211F7003211F7003211F7003211F7003211F7008472
      F200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000097D8A7005FBF770000000000000000000000
      00000000000000000000000000000000000000000000000000000000000057BB
      7000159736001698370015973600159736001597360015973600159836001698
      370089D49C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B6ACF3008472F20000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B6AC
      F3003211F7003211F7003211F7003211F7003211F7003211F7003211F7003211
      F7008472F2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      E007FE7FE007FE7FF00FFC3FF00FFC3FF81FF81FF81FF81FFC3FF00FFC3FF00F
      FE7FE007FE7FE007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object HtlSrvLnkQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = BrHotelSrc
    Parameters = <
      item
        Name = 'HotelId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select L.HotelId, L.LinkId, L.ServiceId,'
      'S.HaveValue, L.IntValue, S.MeasureUnit,'
      'L.HaveCost, L.Cost, L.CurrId, L.Comments,'
      'S.Name, S.LargeIcon, S.SmallIcon, C.CurrencyShort'
      'from HtlServLnk L'
      'left join SERVICES S on S.serviceid = L.serviceid'
      'left join Currency C on C.CurrencyId = L.CurrId'
      'where L.HotelId = :HotelId ')
    Left = 168
    Top = 886
    object HtlSrvLnkQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object HtlSrvLnkQryLINKID: TIntegerField
      FieldName = 'LINKID'
    end
    object HtlSrvLnkQrySERVICEID: TIntegerField
      FieldName = 'SERVICEID'
    end
    object HtlSrvLnkQryHAVEVALUE: TStringField
      FieldName = 'HAVEVALUE'
      Size = 1
    end
    object HtlSrvLnkQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
    object HtlSrvLnkQryMEASUREUNIT: TStringField
      FieldName = 'MEASUREUNIT'
      Size = 5
    end
    object HtlSrvLnkQryHAVECOST: TSmallintField
      FieldName = 'HAVECOST'
    end
    object HtlSrvLnkQryCOST: TFloatField
      DisplayLabel = #1062#1110#1085#1072
      FieldName = 'COST'
    end
    object HtlSrvLnkQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      Size = 190
    end
    object HtlSrvLnkQryLARGEICON: TBlobField
      FieldName = 'LARGEICON'
    end
    object HtlSrvLnkQrySMALLICON: TBlobField
      FieldName = 'SMALLICON'
    end
    object HtlSrvLnkQryCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object HtlSrvLnkQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object HtlSrvLnkQryCURRENCYSHORT: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1072#1083'.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object HtlSrvLnkQryCalcValue: TStringField
      DisplayLabel = #1042#1077#1083#1080#1095#1080#1085#1072
      FieldKind = fkCalculated
      FieldName = 'CalcValue'
      Calculated = True
    end
    object HtlSrvLnkQryCalcCost: TStringField
      DisplayLabel = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100'?'
      FieldKind = fkCalculated
      FieldName = 'CalcCost'
      Size = 10
      Calculated = True
    end
    object HtlSrvLnkQryCalcHaveCost: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1093'.'#1091' '#1074#1072#1088#1090'?'
      FieldKind = fkCalculated
      FieldName = 'CalcHaveCost'
      Size = 11
      Calculated = True
    end
    object HtlSrvLnkQryCalcMemo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcMemo'
      Size = 255
      Calculated = True
    end
    object HtlSrvLnkQryCalcPrice: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPrice'
      Size = 100
      Calculated = True
    end
  end
  object BldSrvLnkQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = HtlBuildSrc
    Parameters = <
      item
        Name = 'HOTELBUILDID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      '  select L.HotelBuildId, L.LinkId, L.ServiceId,'
      '  S.HaveValue, L.IntValue, S.MeasureUnit,'
      '  L.HaveCost, L.Cost, L.CurrId, L.Comments,'
      '  S.Name, S.LargeIcon, S.SmallIcon, C.CurrencyShort'
      '  from HBldServLnk L'
      '  left join SERVICES S on S.serviceid = L.serviceid'
      '  left join Currency C on C.CurrencyId = L.CurrId'
      '  where L.HotelBuildId = :HotelBuildId')
    Left = 240
    Top = 878
    object BldSrvLnkQryHOTELBUILDID: TIntegerField
      FieldName = 'HOTELBUILDID'
    end
    object BldSrvLnkQryLINKID: TIntegerField
      FieldName = 'LINKID'
    end
    object BldSrvLnkQrySERVICEID: TIntegerField
      FieldName = 'SERVICEID'
    end
    object BldSrvLnkQryHAVEVALUE: TStringField
      FieldName = 'HAVEVALUE'
      Size = 1
    end
    object BldSrvLnkQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
    object BldSrvLnkQryMEASUREUNIT: TStringField
      FieldName = 'MEASUREUNIT'
      Size = 5
    end
    object BldSrvLnkQryHAVECOST: TSmallintField
      FieldName = 'HAVECOST'
    end
    object BldSrvLnkQryCOST: TFloatField
      DisplayLabel = #1062#1110#1085#1072
      FieldName = 'COST'
    end
    object BldSrvLnkQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      Size = 190
    end
    object BldSrvLnkQryLARGEICON: TBlobField
      FieldName = 'LARGEICON'
    end
    object BldSrvLnkQrySMALLICON: TBlobField
      FieldName = 'SMALLICON'
    end
    object BldSrvLnkQryCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object BldSrvLnkQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object BldSrvLnkQryCURRENCYSHORT: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1072#1083'.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object BldSrvLnkQryCalcValue: TStringField
      DisplayLabel = #1042#1077#1083#1080#1095#1080#1085#1072
      FieldKind = fkCalculated
      FieldName = 'CalcValue'
      Calculated = True
    end
    object BldSrvLnkQryCalcCost: TStringField
      DisplayLabel = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100'?'
      FieldKind = fkCalculated
      FieldName = 'CalcCost'
      Size = 10
      Calculated = True
    end
    object BldSrvLnkQryCalcHaveCost: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1093'.'#1091' '#1074#1072#1088#1090'?'
      FieldKind = fkCalculated
      FieldName = 'CalcHaveCost'
      Size = 11
      Calculated = True
    end
    object BldSrvLnkQryCalcMemo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcMemo'
      Size = 25
      Calculated = True
    end
    object BldSrvLnkQryCalcPrice: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPrice'
      Size = 100
      Calculated = True
    end
  end
  object RoomSrvLnkQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = HtlRoomSrc
    Parameters = <
      item
        Name = 'HOTELROOMID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select L.HotelRoomId, L.LinkId, L.ServiceId,'
      'S.HaveValue, L.IntValue, S.MeasureUnit,'
      'L.HaveCost, L.Cost, L.CurrId, L.Comments,'
      'S.Name, S.LargeIcon, S.SmallIcon, C.CurrencyShort'
      'from RoomServLnk L'
      'left join SERVICES S on S.serviceid = L.serviceid'
      'left join Currency C on C.CurrencyId = L.CurrId'
      'where L.HotelRoomId = :HotelRoomId')
    Left = 316
    Top = 886
    object RoomSrvLnkQryHOTELROOMID: TIntegerField
      FieldName = 'HOTELROOMID'
    end
    object RoomSrvLnkQryLINKID: TIntegerField
      FieldName = 'LINKID'
    end
    object RoomSrvLnkQrySERVICEID: TIntegerField
      FieldName = 'SERVICEID'
    end
    object RoomSrvLnkQryHAVEVALUE: TStringField
      FieldName = 'HAVEVALUE'
      Size = 1
    end
    object RoomSrvLnkQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
    object RoomSrvLnkQryMEASUREUNIT: TStringField
      FieldName = 'MEASUREUNIT'
      Size = 5
    end
    object RoomSrvLnkQryHAVECOST: TSmallintField
      FieldName = 'HAVECOST'
    end
    object RoomSrvLnkQryCOST: TFloatField
      DisplayLabel = #1062#1110#1085#1072
      FieldName = 'COST'
    end
    object RoomSrvLnkQryCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object RoomSrvLnkQryCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
    end
    object RoomSrvLnkQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      Size = 190
    end
    object RoomSrvLnkQryLARGEICON: TBlobField
      FieldName = 'LARGEICON'
    end
    object RoomSrvLnkQrySMALLICON: TBlobField
      FieldName = 'SMALLICON'
    end
    object RoomSrvLnkQryCURRENCYSHORT: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1072#1083'.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object RoomSrvLnkQryCalcValue: TStringField
      DisplayLabel = #1042#1077#1083#1080#1095#1080#1085#1072
      FieldKind = fkCalculated
      FieldName = 'CalcValue'
      Calculated = True
    end
    object RoomSrvLnkQryCalcCost: TStringField
      DisplayLabel = #1042#1093#1086#1076#1080#1090#1100' '#1091' '#1074#1072#1088#1090#1110#1089#1090#1100'?'
      FieldKind = fkCalculated
      FieldName = 'CalcCost'
      Size = 10
      Calculated = True
    end
    object RoomSrvLnkQryCalcHaveCost: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1093'.'#1091' '#1074#1072#1088#1090'?'
      FieldKind = fkCalculated
      FieldName = 'CalcHaveCost'
      Size = 11
      Calculated = True
    end
    object RoomSrvLnkQryCalcMemo: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcMemo'
      Size = 25
      Calculated = True
    end
    object RoomSrvLnkQryCalcPrice: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcPrice'
      Size = 100
      Calculated = True
    end
  end
  object RoomVariantQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = HtlRoomSrc
    Parameters = <
      item
        Name = 'HotelRoomId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from HtlRoomVariants where HtlRoomId = :HotelRoomId')
    Left = 29
    Top = 880
    object RoomVariantQryHTLROOMID: TIntegerField
      FieldName = 'HTLROOMID'
    end
    object RoomVariantQryVARIANTID: TIntegerField
      FieldName = 'VARIANTID'
    end
    object RoomVariantQryDELETED: TStringField
      FieldName = 'DELETED'
      Size = 1
    end
    object RoomVariantQryCalcVariantName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcVariantName'
      Size = 200
      Calculated = True
    end
  end
  object RoomVariantSrc: TDataSource
    DataSet = RoomVariantQry
    Left = 26
    Top = 927
  end
  object RoomBedQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    DataSource = RoomVariantSrc
    Parameters = <
      item
        Name = 'VariantId'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from HTlRoomBeds  where VariantId = :VariantId'
      '')
    Left = 108
    Top = 880
    object RoomBedQryHTLROOMID: TIntegerField
      FieldName = 'HTLROOMID'
    end
    object RoomBedQryVARIANTID: TIntegerField
      FieldName = 'VARIANTID'
    end
    object RoomBedQryBEDID: TIntegerField
      FieldName = 'BEDID'
    end
    object RoomBedQryBEDTYPEID: TIntegerField
      FieldName = 'BEDTYPEID'
    end
    object RoomBedQryBEDSIZE: TStringField
      DisplayLabel = #1056#1086#1079#1084#1110#1088
      FieldName = 'BEDSIZE'
      Size = 100
    end
    object RoomBedQryBEDMAIN: TSmallintField
      FieldName = 'BEDMAIN'
    end
    object RoomBedQryBEDCOUNT: TIntegerField
      DisplayLabel = #1050'-'#1089#1090#1100
      FieldName = 'BEDCOUNT'
    end
    object RoomBedQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
  end
  object RoomBedSrc: TDataSource
    DataSet = RoomBedQry
    Left = 108
    Top = 928
  end
  object HtlSrvLnkSrc: TDataSource
    DataSet = HtlSrvLnkQry
    Left = 168
    Top = 936
  end
  object BldSrvLnkSrc: TDataSource
    DataSet = BldSrvLnkQry
    Left = 240
    Top = 928
  end
  object RoomSrvLnkSrs: TDataSource
    DataSet = RoomSrvLnkQry
    Left = 312
    Top = 928
  end
  object UsersSrc: TDataSource
    DataSet = UsersQry
    Left = 1648
    Top = 56
  end
  object UsersQry: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'USERID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        '  select TM.id,  COMPPERSONS.secondname||'#39' '#39'||COMPPERSONS.name a' +
        's Manager,'
      '   TM.comppersonid from tmusers_info TM'
      
        '   left join COMPPERSONS on TM.comppersonid = COMPPERSONS.person' +
        'id'
      '   where  TM.id =:USERID'
      '')
    Left = 1648
    Top = 8
    object UsersQryID: TIntegerField
      FieldName = 'ID'
    end
    object UsersQryMANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 61
    end
    object UsersQryCOMPPERSONID: TIntegerField
      FieldName = 'COMPPERSONID'
    end
  end
  object LSheet: TcxStyleRepository
    Left = 1539
    Top = 113
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10930928
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16774644
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clYellow
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16511978
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14542570
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clTeal
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211272
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 524288
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4194368
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 7897176
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnShadow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle71: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle72: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle73: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle74: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle75: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle76: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle77: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle78: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle79: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle80: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle81: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle82: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle83: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle84: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle85: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle86: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle87: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle88: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle89: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle90: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle91: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle92: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle93: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle94: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle95: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle96: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 4707838
    end
    object cxStyle97: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8454016
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle98: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle99: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle100: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle101: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle102: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle103: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle104: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle105: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle106: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle107: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle108: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle109: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8454016
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle110: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle111: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle112: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle113: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle114: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle115: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle116: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle117: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle118: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211288
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle119: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle120: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle121: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle122: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle123: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle124: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle125: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle126: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle127: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle128: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle129: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14679999
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle130: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle131: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle132: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle133: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle134: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle135: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle136: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle137: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle138: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle139: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle140: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle141: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle142: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle143: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle144: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14679999
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle145: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle146: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle147: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle148: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle149: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle150: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle151: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle152: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle153: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle154: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle155: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle156: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16772844
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle157: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle158: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16630203
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle159: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle160: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14932430
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle161: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16772844
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle162: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle163: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle164: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle165: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle166: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16630203
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle167: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle168: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle169: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle170: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle171: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle172: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle173: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle174: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8453888
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle175: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8453888
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle176: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12279296
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle177: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15066597
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle178: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle179: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle180: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle181: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle182: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle183: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle184: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle185: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle186: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle187: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle188: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle189: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle190: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle191: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle192: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle193: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle194: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle195: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle196: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle197: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12279296
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle198: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle199: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15790320
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle200: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle201: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle202: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle203: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle204: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle205: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle206: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle207: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle208: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle209: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle210: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle211: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14932430
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle212: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object cxStyle213: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
    object cxStyle214: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object cxStyle215: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle216: TcxStyle
      AssignedValues = [svColor]
      Color = 15263999
    end
    object DBCardStyle: TcxGridCardViewStyleSheet
      Styles.Background = cxStyle110
      Styles.Content = cxStyle113
      Styles.ContentEven = cxStyle114
      Styles.ContentOdd = cxStyle115
      Styles.Inactive = cxStyle116
      Styles.IncSearch = cxStyle117
      Styles.Selection = cxStyle119
      Styles.CaptionRow = cxStyle111
      Styles.CardBorder = cxStyle112
      Styles.RowCaption = cxStyle118
      BuiltIn = True
    end
    object DBBandedStyle: TcxGridBandedTableViewStyleSheet
      Styles.Background = cxStyle199
      Styles.Content = cxStyle99
      Styles.ContentEven = cxStyle99
      Styles.ContentOdd = cxStyle99
      Styles.FilterBox = cxStyle162
      Styles.Inactive = cxStyle167
      Styles.IncSearch = cxStyle168
      Styles.Selection = cxStyle171
      Styles.Footer = cxStyle163
      Styles.Group = cxStyle164
      Styles.GroupByBox = cxStyle165
      Styles.Header = cxStyle214
      Styles.Indicator = cxStyle169
      Styles.Preview = cxStyle170
      Styles.BandBackground = cxStyle157
      Styles.BandHeader = cxStyle214
      BuiltIn = True
    end
    object DBOtherStyle: TcxGridBandedTableViewStyleSheet
      Styles.Content = cxStyle178
      Styles.ContentEven = cxStyle179
      Styles.ContentOdd = cxStyle180
      Styles.Inactive = cxStyle174
      Styles.Selection = cxStyle175
      Styles.Header = cxStyle177
      Styles.Indicator = cxStyle173
      Styles.BandHeader = cxStyle176
      BuiltIn = True
    end
    object DBMonitorStyle: TcxGridBandedTableViewStyleSheet
      Caption = 'DBBandedStyle'
      Styles.Background = cxStyle195
      Styles.Content = cxStyle198
      Styles.ContentEven = cxStyle199
      Styles.ContentOdd = cxStyle200
      Styles.FilterBox = cxStyle201
      Styles.Inactive = cxStyle206
      Styles.IncSearch = cxStyle207
      Styles.Selection = cxStyle210
      Styles.Footer = cxStyle202
      Styles.Group = cxStyle203
      Styles.GroupByBox = cxStyle204
      Styles.Header = cxStyle205
      Styles.Indicator = cxStyle208
      Styles.Preview = cxStyle209
      Styles.BandBackground = cxStyle196
      Styles.BandHeader = cxStyle197
      BuiltIn = True
    end
    object GridTableViewStyle: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    object MyStyle: TcxGridTableViewStyleSheet
      Styles.Background = cxStyle100
      Styles.Content = cxStyle99
      Styles.ContentEven = cxStyle99
      Styles.ContentOdd = cxStyle99
      Styles.Inactive = cxStyle62
      Styles.Selection = cxStyle215
      Styles.Footer = cxStyle214
      Styles.GroupByBox = cxStyle189
      Styles.Header = cxStyle214
      BuiltIn = True
    end
    object MyStyleTree: TcxTreeListStyleSheet
      Styles.Background = cxStyle100
      Styles.Content = cxStyle99
      Styles.Inactive = cxStyle62
      Styles.Selection = cxStyle215
      Styles.BandBackground = cxStyle214
      Styles.BandContent = cxStyle99
      Styles.BandHeader = cxStyle212
      Styles.ColumnFooter = cxStyle212
      Styles.ColumnHeader = cxStyle214
      Styles.ContentEven = cxStyle99
      Styles.ContentOdd = cxStyle99
      Styles.Footer = cxStyle214
      BuiltIn = True
    end
  end
  object GridViewRepositoryCloneTree: TcxGridViewRepository
    Left = 1400
    Top = 128
    object TreeCOUNTRY_TEMPL_ADM_UNIT: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = COUNTRY_TEMPL_ADM_UNITSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object TreeCOUNTRY_TEMPL_ADM_UNITID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCOUNTRY_TEMPL_ADM_UNITID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCOUNTRY_TEMPL_ADM_UNITID_ADMIN_UNIT: TcxGridDBColumn
        Tag = 100
        Caption = #1040#1076#1084#1110#1085'. '#1086#1076#1080#1085#1080#1094#1103
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object TreeCOUNTRY_TEMPL_ADM_UNITNAME: TcxGridDBColumn
        Tag = -1
        Caption = #1040#1076#1084#1110#1085'. '#1086#1076#1080#1085#1080#1094#1103
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 250
      end
      object TreeCOUNTRY_TEMPL_ADM_UNITID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCOUNTRY_TEMPL_ADM_UNITLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object TreeCOUNTRY_TEMPL_ADM_UNITLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object TreeCity_Admin_UnitRegion: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = City_Admin_UnitRegionSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object TreeCity_Admin_UnitRegionID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_UnitRegionID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_UnitRegionNAME: TcxGridDBColumn
        Caption = #1040#1076#1084#1110#1085#1110#1089#1090#1088#1072#1090#1080#1074#1085#1072' '#1086#1076#1080#1085#1080#1094#1103
        DataBinding.FieldName = 'NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 269
      end
      object TreeCity_Admin_UnitRegionADMIN_UNIT_NAME: TcxGridDBColumn
        Tag = -100
        Caption = #1058#1080#1087' '#1072#1076#1084#1110#1085' '#1086#1076#1080#1085#1080#1094#1110
        DataBinding.FieldName = 'ADMIN_UNIT_NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 144
      end
      object TreeCity_Admin_UnitRegionID_ADMIN_UNIT: TcxGridDBColumn
        Tag = 100
        Caption = #1058#1080#1087' '#1072#1076#1084#1110#1085' '#1086#1076#1080#1085#1080#1094#1110
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewAdminUnitList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewAdminUnitListNAME
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 144
      end
      object TreeCity_Admin_UnitRegionID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        IsCaptionAssigned = True
      end
      object TreeCity_Admin_UnitRegionMAIN_CITY: TcxGridDBColumn
        Tag = -100
        Caption = #1043#1086#1083#1086#1074#1085#1077' '#1084#1110#1089#1090#1086
        DataBinding.FieldName = 'MAIN_CITY'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 160
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 160
      end
      object TreeCity_Admin_UnitRegionID_MAIN_CITY: TcxGridDBColumn
        Tag = 100
        Caption = #1043#1086#1083#1086#1074#1085#1077' '#1084#1110#1089#1090#1086
        DataBinding.FieldName = 'ID_MAIN_CITY'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewCityAdminUnitList
        Properties.KeyFieldNames = 'ID'
        Properties.ListFieldItem = ViewCityAdminUnitListNAME
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 160
      end
      object TreeCity_Admin_UnitRegionATYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_UnitRegionID_MAIN_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_PARENT'
        Visible = False
      end
      object TreeCity_Admin_UnitRegionID_ADMIN_UNIT_SUB: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT_SUB'
        Visible = False
      end
      object TreeCity_Admin_UnitRegionSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 40
      end
      object TreeCity_Admin_UnitRegionLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object TreeCity_Admin_UnitRegionLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object TreeCity_Admin_Region: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = City_Admin_UnitSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object TreeCity_Admin_RegionID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_RegionID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_RegionNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 319
      end
      object TreeCity_Admin_RegionID_ADMIN_UNIT: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 144
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 144
      end
      object TreeCity_Admin_RegionADMIN_UNIT_NAME: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'ADMIN_UNIT_NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 144
      end
      object TreeCity_Admin_RegionID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_RegionID_MAIN_CITY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_CITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_RegionATYPE: TcxGridDBColumn
        DataBinding.FieldName = 'ID_CITY_ADM_UNT_ITEMS_TYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_RegionID_MAIN_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_PARENT'
        Visible = False
      end
      object TreeCity_Admin_RegionSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 40
      end
      object TreeCity_Admin_RegionID_ADMIN_UNIT_SUB: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT_SUB'
        Visible = False
      end
      object TreeCity_Admin_RegionAMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'AMEMO'
        Visible = False
      end
      object TreeCity_Admin_RegionLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
      end
      object TreeCity_Admin_RegionLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
      end
    end
    object TreeCity_Admin_HCityItems: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = HCitySrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = MyStyle
      object TreeCity_Admin_HCityItemsID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_HCityItemsID_COUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_COUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_HCityItemsNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 180
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 180
      end
      object TreeCity_Admin_HCityItemsID_ADMIN_UNIT: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'ID_ADMIN_UNIT'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 144
      end
      object TreeCity_Admin_HCityItemsID_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_HCityItemsID_MAIN_PARENT: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_PARENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_HCityItemsID_MAIN_CITY: TcxGridDBColumn
        DataBinding.FieldName = 'ID_MAIN_CITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_HCityItemsID_ADMIN_UNIT_SUB: TcxGridDBColumn
        DataBinding.FieldName = 'ID_ADMIN_UNIT_SUB'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_HCityItemsNAMEPATH: TcxGridDBColumn
        Caption = #1056#1086#1079#1090#1072#1096#1091#1074#1072#1085#1085#1103
        DataBinding.FieldName = 'NAMEPATH'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 500
      end
      object TreeCity_Admin_HCityItemsSHOWWEB: TcxGridDBColumn
        Caption = #1042#1077#1073
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE7B6B6B4A
          08085A1818A57373EFDEDEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
          10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294200009410187B4A184A
          9418BD3118E71818D61818C60000BD2929EFC6C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
          FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B732100007B2118AD1018A5391818D61818
          E71810F718A57318D64218FF2118FF1818DE0000DE7373FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
          E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7373732918186B18189C1818BD211842AD1810F71821
          F71821FF1821F718D65218FF0818FF2118FF1018EF1818D68473FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF18181842181863291831841829A51818D61821E71821
          FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF1818184218184A421808AD1810AD1818CE1818E71808
          FF184ADE1873BD1842DE18F72918F729189CA518F72918944A18FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF84737339101863291821941810AD1810DE1810F71821
          E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFDEDEDE2929296310187B3918299C1839AD18BD4218D6
          311863BD1810FF1842EF1818FF1818FF1808FF1839DE29F7DEDEFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF736B73290000941018635A187B631884731863
          A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDEDEDE2929295208089C18185A6B1821C61821
          E71829DE1829DE1831EF1821FF1810EF0829C621EFEFE7FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
          8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B734239296B291884
          31189C291863631829AD296BBD73E7EFDEFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
          18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
        Properties.GlyphCount = 2
        Properties.NullStyle = nssUnchecked
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 40
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 40
      end
      object TreeCity_Admin_HCityItemsLNGNOTFOUND: TcxGridDBColumn
        DataBinding.FieldName = 'LNGNOTFOUND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object TreeCity_Admin_HCityItemsLNGCHANGE: TcxGridDBColumn
        DataBinding.FieldName = 'LNGCHANGE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=SYSDBA;Extended Properties="Driver=Firebird/InterBase(r' +
      ') driver;Dbname=troll:D:\_Apollo\_TOURIB_TEST.GDB;PWD=masterkey;' +
      'UID=SYSDBA;"'
    LoginPrompt = False
    Left = 1647
    Top = 116
  end
  object BankQry: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select * from Banks')
    Left = 121
    Top = 642
    object BankQryBANKID: TIntegerField
      FieldName = 'BANKID'
    end
    object BankQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1073#1072#1085#1082#1091
      FieldName = 'NAME'
      Size = 250
    end
    object BankQryADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 250
    end
    object BankQrySWIFT: TStringField
      DisplayLabel = 'S.W.I.F.T.'
      FieldName = 'SWIFT'
      Size = 22
    end
    object BankQryMFO: TStringField
      DisplayLabel = #1052#1060#1054
      FieldName = 'MFO'
      Size = 6
    end
    object BankQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 1
    end
    object BankQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object BankQryGLMFO: TIBStringField
      FieldName = 'GLMFO'
      Origin = '"BANKS"."GLMFO"'
      Size = 6
    end
    object BankQryD_OPEN: TDateTimeField
      FieldName = 'D_OPEN'
      Origin = '"BANKS"."D_OPEN"'
    end
    object BankQryD_CLOSE: TDateTimeField
      FieldName = 'D_CLOSE'
      Origin = '"BANKS"."D_CLOSE"'
    end
    object BankQryPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"BANKS"."PARENTID"'
    end
    object BankQryDEPCODE: TIBStringField
      FieldName = 'DEPCODE'
      Origin = '"BANKS"."DEPCODE"'
    end
  end
  object BankSrc: TDataSource
    DataSet = BankQry
    Left = 122
    Top = 696
  end
end
