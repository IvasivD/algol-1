object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 2678
  Top = 68
  Height = 599
  Width = 1032
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'TROLL:D:\Dima_DB\Country.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 45
    Top = 17
  end
  object IBTransaction: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 104
    Top = 9
  end
  object Country: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT  * from  COUNTRIES order by COUNTRY_ID')
    Left = 40
    Top = 72
    object CountryCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Required = True
    end
    object CountrySHORTNAME: TIBStringField
      FieldName = 'SHORTNAME'
      Origin = '"COUNTRIES"."SHORTNAME"'
      Size = 10
    end
    object CountryTITLE_RU: TIBStringField
      FieldName = 'TITLE_RU'
      Origin = '"COUNTRIES"."TITLE_RU"'
      Size = 1000
    end
    object CountryTITLE_UA: TIBStringField
      FieldName = 'TITLE_UA'
      Origin = '"COUNTRIES"."TITLE_UA"'
      Size = 1000
    end
    object CountryTITLE_EN: TIBStringField
      FieldName = 'TITLE_EN'
      Origin = '"COUNTRIES"."TITLE_EN"'
      Size = 1000
    end
    object CountryGEO_LAT: TFloatField
      FieldName = 'GEO_LAT'
      Origin = '"COUNTRIES"."GEO_LAT"'
    end
    object CountryGEO_LNG: TFloatField
      FieldName = 'GEO_LNG'
      Origin = '"COUNTRIES"."GEO_LNG"'
    end
    object CountryCOUNTRY_ID_TO: TIntegerField
      FieldName = 'COUNTRY_ID_TO'
      Origin = '"COUNTRIES"."COUNTRY_ID_TO"'
    end
  end
  object CountrySrc: TDataSource
    DataSet = Country
    Left = 96
    Top = 80
  end
  object CountryDetail: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = CountrySrc
    SQL.Strings = (
      'select * from COUNTRIES_DETAIL'
      
        'left join COUNTRIES_DET_TYPES on  COUNTRIES_DET_TYPES.id = COUNT' +
        'RIES_DETAIL.country_det_type_id'
      'where COUNTRY_ID=:COUNTRY_ID')
    Left = 40
    Top = 136
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COUNTRY_ID'
        ParamType = ptUnknown
      end>
    object CountryDetailID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRIES_DETAIL"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CountryDetailCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = '"COUNTRIES_DETAIL"."COUNTRY_ID"'
    end
    object CountryDetailCOUNTRY_DET_TYPE_ID: TIntegerField
      FieldName = 'COUNTRY_DET_TYPE_ID'
      Origin = '"COUNTRIES_DETAIL"."COUNTRY_DET_TYPE_ID"'
    end
    object CountryDetailAVALUE: TIBStringField
      FieldName = 'AVALUE'
      Origin = '"COUNTRIES_DETAIL"."AVALUE"'
      Size = 500
    end
    object CountryDetailFILE: TBlobField
      FieldName = 'AFILE'
      Origin = '"COUNTRIES_DETAIL"."FILE"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CountryDetailURL: TBlobField
      FieldName = 'AURL'
      Origin = '"COUNTRIES_DETAIL"."URL"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object CountryDetailLokUpTypeName: TStringField
      FieldKind = fkLookup
      FieldName = 'LokUpTypeName'
      LookupDataSet = CountryDetailTypes
      LookupKeyFields = 'ID'
      LookupResultField = 'NAME'
      KeyFields = 'COUNTRY_DET_TYPE_ID'
      LookupCache = True
      Size = 250
      Lookup = True
    end
    object CountryDetailID1: TIntegerField
      FieldName = 'ID1'
      Origin = '"COUNTRIES_DET_TYPES"."ID"'
    end
    object CountryDetailNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES_DET_TYPES"."NAME"'
      Size = 250
    end
    object CountryDetailUSE_ID_TO: TIntegerField
      FieldName = 'USE_ID_TO'
      Origin = '"COUNTRIES_DET_TYPES"."USE_ID_TO"'
    end
  end
  object CountryDetailSrc: TDataSource
    DataSet = CountryDetail
    Left = 96
    Top = 152
  end
  object CountryDetailTypes: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from COUNTRIES_DET_TYPES')
    Left = 40
    Top = 216
    object CountryDetailTypesID: TIntegerField
      FieldName = 'ID'
      Origin = '"COUNTRIES_DET_TYPES"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CountryDetailTypesNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES_DET_TYPES"."NAME"'
      Size = 250
    end
  end
  object CountryDetailTypesSrc: TDataSource
    DataSet = CountryDetailTypes
    Left = 104
    Top = 232
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 96
    Top = 304
    object ViewCountryList: TcxGridDBTableView
      DataController.DataSource = CountrySrc
      DataController.KeyFieldNames = 'COUNTRY_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewCountryListCOUNTRY_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'COUNTRY_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 33
      end
      object ViewCountryListSHORTNAME: TcxGridDBColumn
        Caption = 'SHORT'
        DataBinding.FieldName = 'SHORTNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 53
      end
      object ViewCountryListTITLE_UA: TcxGridDBColumn
        Caption = 'UA'
        DataBinding.FieldName = 'TITLE_UA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 372
      end
      object ViewCountryListTITLE_RU: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_RU'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewCountryListTITLE_EN: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_EN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewCountryListGEO_LAT: TcxGridDBColumn
        DataBinding.FieldName = 'GEO_LAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryListGEO_LNG: TcxGridDBColumn
        DataBinding.FieldName = 'GEO_LNG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewDetail: TcxGridDBTableView
      DataController.DataSource = CountryDetailSrc
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewDetailID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 45
      end
      object ViewDetailCOUNTRY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDetailCOUNTRY_DET_TYPE_ID: TcxGridDBColumn
        Caption = #1058#1080#1087
        DataBinding.FieldName = 'COUNTRY_DET_TYPE_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 51
      end
      object ViewDetailLokUpTypeName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'LokUpTypeName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 201
      end
      object ViewDetailAVALUE: TcxGridDBColumn
        Caption = #1044#1072#1085#1110
        DataBinding.FieldName = 'AVALUE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 223
      end
      object ViewDetailAFILE: TcxGridDBColumn
        DataBinding.FieldName = 'AFILE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDetailAURL: TcxGridDBColumn
        DataBinding.FieldName = 'AURL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 196
      end
      object ViewDetailNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewDetailUSE_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'USE_ID_TO'
      end
    end
    object ViewCountry: TcxGridDBTableView
      OnFocusedRecordChanged = ViewCountryFocusedRecordChanged
      DataController.DataSource = CountrySrc
      DataController.KeyFieldNames = 'COUNTRY_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCountryCOUNTRY_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'COUNTRY_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 60
      end
      object ViewCountryTITLE_UA: TcxGridDBColumn
        Caption = #1059#1082#1088#1072#1111#1085#1089#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_UA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object ViewCountryTITLE_RU: TcxGridDBColumn
        Caption = #1056#1086#1089#1110#1081#1089#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_RU'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object ViewCountryTITLE_EN: TcxGridDBColumn
        Caption = #1040#1085#1075#1083#1110#1081#1089#1082#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_EN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object ViewCountrySHORTNAME: TcxGridDBColumn
        Caption = #1040#1073#1088#1077#1074'.'
        DataBinding.FieldName = 'SHORTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 46
      end
      object ViewCountryGEO_LAT: TcxGridDBColumn
        Caption = 'GEO LAT'
        DataBinding.FieldName = 'GEO_LAT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
      object ViewCountryGEO_LNG: TcxGridDBColumn
        Caption = 'GEO LNG'
        DataBinding.FieldName = 'GEO_LNG'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
    end
    object ViewRegion: TcxGridDBTableView
      DataController.DataSource = RegionAllSrc
      DataController.KeyFieldNames = 'REGION_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewRegionREGION_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'REGION_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 60
      end
      object ViewRegionCOUNTRY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRegionTITLE_UA: TcxGridDBColumn
        Caption = #1059#1082#1088#1072#1111#1085#1089#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_UA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object ViewRegionTITLE_RU: TcxGridDBColumn
        Caption = #1056#1086#1089#1110#1081#1089#1082#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_RU'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object ViewRegionTITLE_EN: TcxGridDBColumn
        Caption = #1040#1085#1075#1083#1110#1081#1089#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_EN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object ViewRegionTITLE_ORIGINAL: TcxGridDBColumn
        Caption = #1054#1088#1080#1075#1110#1085#1072#1083#1100#1085#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'TITLE_ORIGINAL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 250
      end
      object ViewRegionGEO_LAT: TcxGridDBColumn
        Caption = 'GEO LAT'
        DataBinding.FieldName = 'GEO_LAT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
      object ViewRegionGEO_LNG: TcxGridDBColumn
        Caption = 'GEO LNG'
        DataBinding.FieldName = 'GEO_LNG'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
    end
    object ViewCity: TcxGridDBTableView
      DataController.DataSource = AdoCitySrc
      DataController.KeyFieldNames = 'CITY_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCityCITY_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'CITY_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 50
      end
      object ViewCityCOUNTRY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityREGION_ID: TcxGridDBColumn
        DataBinding.FieldName = 'REGION_ID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCityCOUNTRY_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID_TO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 104
      end
      object ViewCityREGION_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'REGION_ID_TO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 81
      end
      object ViewCityAREA_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'AREA_ID_TO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 75
      end
      object ViewCityTITLE_UA: TcxGridDBColumn
        Caption = #1059#1082#1088#1072#1111#1085#1089#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_UA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 166
      end
      object ViewCityTITLE_RU: TcxGridDBColumn
        Caption = #1056#1086#1089#1110#1081#1089#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_RU'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 131
      end
      object ViewCityTITLE_EN: TcxGridDBColumn
        Caption = #1040#1085#1075#1083#1110#1081#1089#1100#1082#1086#1102
        DataBinding.FieldName = 'TITLE_EN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 174
      end
      object ViewCityTITLE_ORIGINAL: TcxGridDBColumn
        Caption = #1054#1088#1080#1075#1110#1085#1072#1083#1100#1085#1072' '#1085#1072#1079#1074#1072
        DataBinding.FieldName = 'TITLE_ORIGINAL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 166
      end
      object ViewCityIMPORTANT: TcxGridDBColumn
        DataBinding.FieldName = 'IMPORTANT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 97
      end
      object ViewCityGEO_LAT: TcxGridDBColumn
        Caption = 'GEO LAT'
        DataBinding.FieldName = 'GEO_LAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
      object ViewCityGEO_LNG: TcxGridDBColumn
        Caption = 'GEO LNG'
        DataBinding.FieldName = 'GEO_LNG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
      object ViewCityAREA_ID: TcxGridDBColumn
        DataBinding.FieldName = 'AREA_ID'
        Visible = False
      end
      object ViewCityCITY_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'CITY_ID_TO'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.View = ViewCityToList
        Properties.KeyFieldNames = 'CITYID'
        Properties.ListFieldItem = ViewCityToListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 116
      end
      object ViewCityColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'CITY_ID_TO'
      end
    end
    object ViewCountryTO: TcxGridDBTableView
      DataController.DataSource = CounrtyTOSrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCountryTOCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 87
      end
      object ViewCountryTONAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 240
      end
      object ViewCountryTOFULLNAME: TcxGridDBColumn
        DataBinding.FieldName = 'FULLNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 261
      end
    end
    object ViewCountryFrom: TcxGridDBTableView
      DataController.DataSource = CountrySrc
      DataController.KeyFieldNames = 'COUNTRY_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCountryFromCOUNTRY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 78
      end
      object ViewCountryFromSHORTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCountryFromTITLE_UA: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_UA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 300
      end
      object ViewCountryFromTITLE_RU: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_RU'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 300
      end
      object ViewCountryFromTITLE_EN: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_EN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 300
      end
      object ViewCountryFromGEO_LAT: TcxGridDBColumn
        DataBinding.FieldName = 'GEO_LAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 300
      end
      object ViewCountryFromGEO_LNG: TcxGridDBColumn
        DataBinding.FieldName = 'GEO_LNG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 300
      end
      object ViewCountryFromCOUNTRY_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID_TO'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.View = ViewCountryTO
        Properties.KeyFieldNames = 'COUNTRYID'
        Properties.ListFieldItem = ViewCountryTONAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 274
      end
    end
    object ViewRegionTO: TcxGridDBTableView
      DataController.DataSource = ProvincesTOSrc
      DataController.KeyFieldNames = 'PROVINCEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'NAME'
          Column = ViewRegionTONAME
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object ViewRegionTOPROVINCEID: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 90
      end
      object ViewRegionTOCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 106
      end
      object ViewRegionTONAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 319
      end
    end
    object ViewRegionFrom: TcxGridDBTableView
      DataController.DataSource = RegionAllSrc
      DataController.KeyFieldNames = 'REGION_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'TITLE_UA'
          Column = ViewRegionFromTITLE_UA
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object ViewRegionFromREGION_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'REGION_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 60
      end
      object ViewRegionFromCOUNTRY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 69
      end
      object ViewRegionFromCOUNTRY_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID_TO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 92
      end
      object ViewRegionFromCOUNTRY_IDlookUp: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'COUNTRY_ID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'COUNTRY_ID'
        Properties.ListColumns = <
          item
            FieldName = 'TITLE_UA'
          end>
        Properties.ListSource = CountrySrc
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 121
      end
      object ViewRegionFromTITLE_UA: TcxGridDBColumn
        Caption = #1056#1077#1075#1110#1086#1085' UA'
        DataBinding.FieldName = 'TITLE_UA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 179
      end
      object ViewRegionFromTITLE_RU: TcxGridDBColumn
        Caption = #1056#1077#1075#1110#1086#1085' RU'
        DataBinding.FieldName = 'TITLE_RU'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 177
      end
      object ViewRegionFromTITLE_EN: TcxGridDBColumn
        Caption = #1056#1077#1075#1110#1086#1085' EN'
        DataBinding.FieldName = 'TITLE_EN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 156
      end
      object ViewRegionFromTITLE_ORIGINAL: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_ORIGINAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRegionFromGEO_LAT: TcxGridDBColumn
        DataBinding.FieldName = 'GEO_LAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRegionFromGEO_LNG: TcxGridDBColumn
        DataBinding.FieldName = 'GEO_LNG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewRegionFromREGION_ID_TO: TcxGridDBColumn
        Caption = #1057#1091#1084#1110#1089#1090#1085#1110#1089#1090#1100
        DataBinding.FieldName = 'REGION_ID_TO'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.View = ViewRegionTO
        Properties.KeyFieldNames = 'PROVINCEID'
        Properties.ListFieldItem = ViewRegionTONAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 263
      end
    end
    object ViewArea: TcxGridDBTableView
      FilterBox.Visible = fvNever
      DataController.DataSource = AreaSrc
      DataController.KeyFieldNames = 'AREA_ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'AREA_ID_TO'
          Column = ViewAreaAREA_ID_TO
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object ViewAreaAREA_ID: TcxGridDBColumn
        DataBinding.FieldName = 'AREA_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 70
      end
      object ViewAreaCOUNTRY_ID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
      object ViewAreaCOUNTRY_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY_ID_TO'
      end
      object ViewAreaREGION_ID: TcxGridDBColumn
        DataBinding.FieldName = 'REGION_ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 76
      end
      object ViewAreaREGION_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'REGION_ID_TO'
      end
      object ViewAreaTITLE_UA: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' UA'
        DataBinding.FieldName = 'TITLE_UA'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 181
      end
      object ViewAreaTITLE_RU: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' RU'
        DataBinding.FieldName = 'TITLE_RU'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 164
      end
      object ViewAreaTITLE_EN: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' EN'
        DataBinding.FieldName = 'TITLE_EN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 152
      end
      object ViewAreaTITLE_ORIGINAL: TcxGridDBColumn
        DataBinding.FieldName = 'TITLE_ORIGINAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 300
      end
      object ViewAreaAREA_ID_TO: TcxGridDBColumn
        DataBinding.FieldName = 'AREA_ID_TO'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.View = ViewAreaToList
        Properties.KeyFieldNames = 'TOWNSHIPID'
        Properties.ListFieldItem = ViewAreaToListNAME
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 139
      end
    end
    object ViewAreaTo: TcxGridDBTableView
      DataController.DataSource = TownShipToSrc
      DataController.KeyFieldNames = 'TOWNSHIPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'PROVINCEID'
          Column = ViewAreaToPROVINCEID
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object ViewAreaToTOWNSHIPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOWNSHIPID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewAreaToCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
      object ViewAreaToPROVINCEID: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 80
      end
      object ViewAreaToCAPITAL: TcxGridDBColumn
        DataBinding.FieldName = 'CAPITAL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 131
      end
      object ViewAreaToNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 157
      end
    end
    object ViewAreaToList: TcxGridDBTableView
      DataController.DataSource = TownShipToSrc
      DataController.KeyFieldNames = 'TOWNSHIPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewAreaToListTOWNSHIPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOWNSHIPID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 93
      end
      object ViewAreaToListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object ViewAreaToListPROVINCEID: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 88
      end
      object ViewAreaToListCAPITAL: TcxGridDBColumn
        DataBinding.FieldName = 'CAPITAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewAreaToListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 256
      end
    end
    object ViewCityTo: TcxGridDBTableView
      DataController.DataSource = CityToSrc
      DataController.KeyFieldNames = 'CITYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCityToCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 75
      end
      object ViewCityToCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 69
      end
      object ViewCityToPROVINCEID: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 76
      end
      object ViewCityToTOWNSHIPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOWNSHIPID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 81
      end
      object ViewCityToNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 172
      end
    end
    object ViewCityToList: TcxGridDBTableView
      DataController.DataSource = CityToSrc
      DataController.KeyFieldNames = 'CITYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCityToListCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 83
      end
      object ViewCityToListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 81
      end
      object ViewCityToListPROVINCEID: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 82
      end
      object ViewCityToListTOWNSHIPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOWNSHIPID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 86
      end
      object ViewCityToListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 300
      end
    end
  end
  object Region: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = CountrySrc
    SQL.Strings = (
      'select * from REGIONS where (COUNTRY_ID=:COUNTRY_ID) ')
    Left = 192
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COUNTRY_ID'
        ParamType = ptUnknown
      end>
    object RegionREGION_ID: TIntegerField
      FieldName = 'REGION_ID'
      Origin = '"REGIONS"."REGION_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object RegionCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = '"REGIONS"."COUNTRY_ID"'
    end
    object RegionTITLE_RU: TIBStringField
      FieldName = 'TITLE_RU'
      Origin = '"REGIONS"."TITLE_RU"'
      Size = 1000
    end
    object RegionTITLE_UA: TIBStringField
      FieldName = 'TITLE_UA'
      Origin = '"REGIONS"."TITLE_UA"'
      Size = 1000
    end
    object RegionTITLE_EN: TIBStringField
      FieldName = 'TITLE_EN'
      Origin = '"REGIONS"."TITLE_EN"'
      Size = 1000
    end
    object RegionTITLE_ORIGINAL: TIBStringField
      FieldName = 'TITLE_ORIGINAL'
      Origin = '"REGIONS"."TITLE_ORIGINAL"'
      Size = 1000
    end
    object RegionGEO_LAT: TFloatField
      FieldName = 'GEO_LAT'
      Origin = '"REGIONS"."GEO_LAT"'
    end
    object RegionGEO_LNG: TFloatField
      FieldName = 'GEO_LNG'
      Origin = '"REGIONS"."GEO_LNG"'
    end
  end
  object RegionSrc: TDataSource
    DataSet = Region
    Left = 248
    Top = 80
  end
  object City: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'SELECT CITIES.*, COUNTRIES.country_id_to,REGIONS.region_id_to, A' +
        'REA.area_id_to  from CITIES'
      'left join COUNTRIES on COUNTRIES.COUNTRY_ID = CITIES.country_id'
      'left join REGIONS on REGIONS.REGION_ID = CITIES.REGION_id'
      'left join AREA on AREA.area_id = CITIES.area_id'
      '')
    Left = 200
    Top = 144
    object CityCITY_ID: TIntegerField
      FieldName = 'CITY_ID'
      Origin = '"CITIES"."CITY_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CityCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = '"CITIES"."COUNTRY_ID"'
    end
    object CityIMPORTANT: TSmallintField
      FieldName = 'IMPORTANT'
      Origin = '"CITIES"."IMPORTANT"'
    end
    object CityREGION_ID: TIntegerField
      FieldName = 'REGION_ID'
      Origin = '"CITIES"."REGION_ID"'
    end
    object CityTITLE_RU: TIBStringField
      FieldName = 'TITLE_RU'
      Origin = '"CITIES"."TITLE_RU"'
      Size = 1000
    end
    object CityTITLE_UA: TIBStringField
      FieldName = 'TITLE_UA'
      Origin = '"CITIES"."TITLE_UA"'
      Size = 1000
    end
    object CityTITLE_EN: TIBStringField
      FieldName = 'TITLE_EN'
      Origin = '"CITIES"."TITLE_EN"'
      Size = 1000
    end
    object CityTITLE_ORIGINAL: TIBStringField
      FieldName = 'TITLE_ORIGINAL'
      Origin = '"CITIES"."TITLE_ORIGINAL"'
      Size = 1000
    end
    object CityGEO_LAT: TFloatField
      FieldName = 'GEO_LAT'
      Origin = '"CITIES"."GEO_LAT"'
    end
    object CityGEO_LNG: TFloatField
      FieldName = 'GEO_LNG'
      Origin = '"CITIES"."GEO_LNG"'
    end
    object CityAREA_ID: TIntegerField
      FieldName = 'AREA_ID'
      Origin = '"CITIES"."AREA_ID"'
    end
    object CityCOUNTRY_ID_TO: TIntegerField
      FieldName = 'COUNTRY_ID_TO'
      Origin = '"COUNTRIES"."COUNTRY_ID_TO"'
    end
    object CityREGION_ID_TO: TIntegerField
      FieldName = 'REGION_ID_TO'
      Origin = '"REGIONS"."REGION_ID_TO"'
    end
    object CityAREA_ID_TO: TIntegerField
      FieldName = 'AREA_ID_TO'
      Origin = '"AREA"."AREA_ID_TO"'
    end
    object CityCITY_ID_TO: TIntegerField
      FieldName = 'CITY_ID_TO'
    end
  end
  object CitySrc: TDataSource
    DataSet = City
    Left = 248
    Top = 152
  end
  object RegionAll: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    ParamCheck = False
    SQL.Strings = (
      'SELECT   REGIONS.*, COUNTRIES.country_id_to  from  REGIONS'
      'left join COUNTRIES on COUNTRIES.COUNTRY_ID = REGIONS.country_id'
      '')
    Left = 336
    Top = 80
    object IntegerField1: TIntegerField
      FieldName = 'REGION_ID'
      Origin = '"REGIONS"."REGION_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IntegerField2: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = '"REGIONS"."COUNTRY_ID"'
    end
    object IBStringField1: TIBStringField
      FieldName = 'TITLE_RU'
      Origin = '"REGIONS"."TITLE_RU"'
      Size = 1000
    end
    object IBStringField2: TIBStringField
      FieldName = 'TITLE_UA'
      Origin = '"REGIONS"."TITLE_UA"'
      Size = 1000
    end
    object IBStringField3: TIBStringField
      FieldName = 'TITLE_EN'
      Origin = '"REGIONS"."TITLE_EN"'
      Size = 1000
    end
    object IBStringField4: TIBStringField
      FieldName = 'TITLE_ORIGINAL'
      Origin = '"REGIONS"."TITLE_ORIGINAL"'
      Size = 1000
    end
    object FloatField1: TFloatField
      FieldName = 'GEO_LAT'
      Origin = '"REGIONS"."GEO_LAT"'
    end
    object FloatField2: TFloatField
      FieldName = 'GEO_LNG'
      Origin = '"REGIONS"."GEO_LNG"'
    end
    object RegionAllCOUNTRY_ID_TO: TIntegerField
      FieldName = 'COUNTRY_ID_TO'
      Origin = '"COUNTRIES"."COUNTRY_ID_TO"'
    end
    object RegionAllREGION_ID_TO: TIntegerField
      FieldName = 'REGION_ID_TO'
      Origin = '"REGIONS"."REGION_ID_TO"'
    end
  end
  object CityRegion: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'select CITY_ID, COUNTRY_ID, REGION_ID,  AREA_RU, TITLE_RU, AREA_' +
        'ID  from CITY where AREA_RU is not null')
    Left = 256
    Top = 296
    object CityRegionCITY_ID: TIntegerField
      FieldName = 'CITY_ID'
      Origin = '"CITY"."CITY_ID"'
      Required = True
    end
    object CityRegionCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = '"CITY"."COUNTRY_ID"'
      Required = True
    end
    object CityRegionREGION_ID: TIntegerField
      FieldName = 'REGION_ID'
      Origin = '"CITY"."REGION_ID"'
    end
    object CityRegionAREA_RU: TIBStringField
      FieldName = 'AREA_RU'
      Origin = '"CITY"."AREA_RU"'
      Size = 1000
    end
    object CityRegionTITLE_RU: TIBStringField
      FieldName = 'TITLE_RU'
      Origin = '"CITY"."TITLE_RU"'
      Size = 1000
    end
    object CityRegionAREA_ID: TIntegerField
      FieldName = 'AREA_ID'
      Origin = '"CITY"."AREA_ID"'
    end
  end
  object IBDatabaseTO: TIBDatabase
    Connected = True
    DatabaseName = 'alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 37
    Top = 401
  end
  object IBTransactionTO: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabaseTO
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 120
    Top = 401
  end
  object CounrtyTO: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      
        'SELECT countryid, NAME, FULLNAME from  COUNTRIES order by countr' +
        'yid')
    Left = 32
    Top = 480
    object CounrtyTOCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"COUNTRIES"."COUNTRYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CounrtyTONAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES"."NAME"'
      Size = 30
    end
    object CounrtyTOFULLNAME: TIBStringField
      FieldName = 'FULLNAME'
      Origin = '"COUNTRIES"."FULLNAME"'
      Size = 63
    end
  end
  object CounrtyTOSrc: TDataSource
    DataSet = CounrtyTO
    Left = 96
    Top = 488
  end
  object ProvincesTO: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      'SELECT * from  PROVINCES')
    Left = 176
    Top = 480
    object ProvincesTOCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"PROVINCES"."COUNTRYID"'
    end
    object ProvincesTOPROVINCEID: TIntegerField
      FieldName = 'PROVINCEID'
      Origin = '"PROVINCES"."PROVINCEID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ProvincesTONAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"PROVINCES"."NAME"'
      Size = 200
    end
    object ProvincesTOMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"PROVINCES"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object ProvincesTOSHORTSIGN: TIBStringField
      FieldName = 'SHORTSIGN'
      Origin = '"PROVINCES"."SHORTSIGN"'
      Size = 5
    end
    object ProvincesTONAME_ENG: TIBStringField
      FieldName = 'NAME_ENG'
      Origin = '"PROVINCES"."NAME_ENG"'
      Size = 35
    end
    object ProvincesTOCAPITALID: TIntegerField
      FieldName = 'CAPITALID'
      Origin = '"PROVINCES"."CAPITALID"'
    end
    object ProvincesTOUNITTYPEID: TIntegerField
      FieldName = 'UNITTYPEID'
      Origin = '"PROVINCES"."UNITTYPEID"'
    end
    object ProvincesTONAME_ORIGINAL: TIBStringField
      FieldName = 'NAME_ORIGINAL'
      Origin = '"PROVINCES"."NAME_ORIGINAL"'
      Size = 500
    end
    object ProvincesTOGOVCODE: TIntegerField
      FieldName = 'GOVCODE'
      Origin = '"PROVINCES"."GOVCODE"'
    end
  end
  object ProvincesTOSrc: TDataSource
    DataSet = ProvincesTO
    Left = 256
    Top = 496
  end
  object RegionAllSrc: TDataSource
    DataSet = RegionAll
    Left = 352
    Top = 120
  end
  object Area: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'SELECT  AREA.*, COUNTRIES.country_id_to,REGIONS.region_id_to  fr' +
        'om AREA'
      'left join COUNTRIES on COUNTRIES.COUNTRY_ID = AREA.country_id'
      'left join REGIONS on REGIONS.REGION_ID = AREA.REGION_id'
      ''
      'order by AREA_ID')
    Left = 200
    Top = 232
    object AreaAREA_ID: TIntegerField
      FieldName = 'AREA_ID'
      Origin = '"AREA"."AREA_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object AreaREGION_ID: TIntegerField
      FieldName = 'REGION_ID'
      Origin = '"AREA"."REGION_ID"'
    end
    object AreaCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = '"AREA"."COUNTRY_ID"'
    end
    object AreaTITLE_RU: TIBStringField
      FieldName = 'TITLE_RU'
      Origin = '"AREA"."TITLE_RU"'
      Size = 250
    end
    object AreaTITLE_UA: TIBStringField
      FieldName = 'TITLE_UA'
      Origin = '"AREA"."TITLE_UA"'
      Size = 250
    end
    object AreaTITLE_EN: TIBStringField
      FieldName = 'TITLE_EN'
      Origin = '"AREA"."TITLE_EN"'
      Size = 250
    end
    object AreaTITLE_ORIGINAL: TIBStringField
      FieldName = 'TITLE_ORIGINAL'
      Origin = '"AREA"."TITLE_ORIGINAL"'
      Size = 1000
    end
    object AreaAREA_ID_TO: TIntegerField
      FieldName = 'AREA_ID_TO'
      Origin = '"AREA"."AREA_ID_TO"'
    end
    object AreaCOUNTRY_ID_TO: TIntegerField
      FieldName = 'COUNTRY_ID_TO'
      Origin = '"COUNTRIES"."COUNTRY_ID_TO"'
    end
    object AreaREGION_ID_TO: TIntegerField
      FieldName = 'REGION_ID_TO'
      Origin = '"REGIONS"."REGION_ID_TO"'
    end
  end
  object AreaSrc: TDataSource
    DataSet = Area
    Left = 256
    Top = 240
  end
  object TownShipTo: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      
        'select townshipid, countryid, provinceid, capital, name from tow' +
        'nships')
    Left = 328
    Top = 408
    object TownShipToTOWNSHIPID: TIntegerField
      FieldName = 'TOWNSHIPID'
      Origin = '"TOWNSHIPS"."TOWNSHIPID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TownShipToCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"TOWNSHIPS"."COUNTRYID"'
      Required = True
    end
    object TownShipToPROVINCEID: TIntegerField
      FieldName = 'PROVINCEID'
      Origin = '"TOWNSHIPS"."PROVINCEID"'
    end
    object TownShipToCAPITAL: TIBStringField
      FieldName = 'CAPITAL'
      Origin = '"TOWNSHIPS"."CAPITAL"'
      Size = 50
    end
    object TownShipToNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TOWNSHIPS"."NAME"'
      Size = 45
    end
  end
  object TownShipToSrc: TDataSource
    DataSet = TownShipTo
    Left = 344
    Top = 464
  end
  object CityTo: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      
        'select CITIES.cityid, CITIES.countryid, CITIES.provinceid, CITIE' +
        'S.townshipid, CITIES.name, CITIES.name_original,countries.name C' +
        'OUNTRY_NAME from CITIES'
      'left join countries on countries.countryid = CITIES.countryid'
      '')
    Left = 424
    Top = 408
    object CityToCITYID: TIntegerField
      FieldName = 'CITYID'
      Origin = '"CITIES"."CITYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CityToCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"CITIES"."COUNTRYID"'
      Required = True
    end
    object CityToPROVINCEID: TIntegerField
      FieldName = 'PROVINCEID'
      Origin = '"CITIES"."PROVINCEID"'
    end
    object CityToTOWNSHIPID: TIntegerField
      FieldName = 'TOWNSHIPID'
      Origin = '"CITIES"."TOWNSHIPID"'
    end
    object CityToNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"CITIES"."NAME"'
      Size = 190
    end
    object CityToNAME_ORIGINAL: TIBStringField
      FieldName = 'NAME_ORIGINAL'
      Origin = '"CITIES"."NAME_ORIGINAL"'
      Size = 500
    end
    object CityToCOUNTRY_NAME: TIBStringField
      FieldName = 'COUNTRY_NAME'
      Origin = '"COUNTRIES"."NAME"'
      Size = 30
    end
  end
  object CityToSrc: TDataSource
    DataSet = AdoCITYTO
    Left = 472
    Top = 360
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'DSN=IBADO;Driver=Firebird/InterBase(r) driver;Dbname=TROLL:D:\Di' +
      'ma_DB\Country.GDB;CHARSET=WIN1251;PWD=masterkey;UID=sysdba;Clien' +
      't=C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll;'
    ConnectOptions = coAsyncConnect
    IsolationLevel = ilChaos
    LoginPrompt = False
    Left = 504
    Top = 64
  end
  object ADOCity: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT CITIES.*, COUNTRIES.country_id_to,REGIONS.region_id_to, A' +
      'REA.area_id_to  from CITIES'#13#10'left join COUNTRIES on COUNTRIES.CO' +
      'UNTRY_ID = CITIES.country_id'#13#10'left join REGIONS on REGIONS.REGIO' +
      'N_ID = CITIES.REGION_id'#13#10'left join AREA on AREA.area_id = CITIES' +
      '.area_id'#13#10#13#10'WHERE CITIES.COUNTRY_ID = 2 '#13#10'order by CITIES.CITY_I' +
      'D'
    Parameters = <>
    Left = 472
    Top = 144
    object ADOCityCITY_ID: TIntegerField
      FieldName = 'CITY_ID'
    end
    object ADOCityCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
    end
    object ADOCityIMPORTANT: TSmallintField
      FieldName = 'IMPORTANT'
    end
    object ADOCityREGION_ID: TIntegerField
      FieldName = 'REGION_ID'
    end
    object ADOCityAREA_ID: TIntegerField
      FieldName = 'AREA_ID'
    end
    object ADOCityTITLE_ORIGINAL: TStringField
      FieldName = 'TITLE_ORIGINAL'
      Size = 1000
    end
    object ADOCityGEO_LAT: TFloatField
      FieldName = 'GEO_LAT'
    end
    object ADOCityGEO_LNG: TFloatField
      FieldName = 'GEO_LNG'
    end
    object ADOCityCITY_ID_TO: TIntegerField
      FieldName = 'CITY_ID_TO'
    end
    object ADOCityCOUNTRY_ID_TO: TIntegerField
      FieldName = 'COUNTRY_ID_TO'
    end
    object ADOCityREGION_ID_TO: TIntegerField
      FieldName = 'REGION_ID_TO'
    end
    object ADOCityAREA_ID_TO: TIntegerField
      FieldName = 'AREA_ID_TO'
    end
    object ADOCityTITLE_RU: TStringField
      FieldName = 'TITLE_RU'
      Size = 1000
    end
    object ADOCityTITLE_UA: TStringField
      FieldName = 'TITLE_UA'
      Size = 1000
    end
    object ADOCityTITLE_EN: TStringField
      FieldName = 'TITLE_EN'
      Size = 1000
    end
  end
  object AdoCitySrc: TDataSource
    DataSet = ADOCity
    Left = 528
    Top = 144
  end
  object ADOConnection2: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=sysdba;Mode=ReadWrite;Extended Properties="DSN=IBADO;Dr' +
      'iver=Firebird/InterBase(r) driver;Dbname=alfa:D:\Tourmn\nettour\' +
      '_TOURIB_TEST.GDB;CHARSET=WIN1251;PWD=HonzOKey;UID=sysdba;Client=' +
      'C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll;"'
    ConnectOptions = coAsyncConnect
    IsolationLevel = ilChaos
    LoginPrompt = False
    Mode = cmReadWrite
    Left = 608
    Top = 256
  end
  object ADOProvincesTO: TADODataSet
    Connection = ADOConnection2
    CursorType = ctStatic
    CommandText = 'SELECT * from  PROVINCES'
    Parameters = <>
    Left = 560
    Top = 328
    object ADOProvincesTOCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object ADOProvincesTOPROVINCEID: TIntegerField
      FieldName = 'PROVINCEID'
    end
    object ADOProvincesTONAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object ADOProvincesTOMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object ADOProvincesTOSHORTSIGN: TStringField
      FieldName = 'SHORTSIGN'
      Size = 5
    end
    object ADOProvincesTONAME_ENG: TStringField
      FieldName = 'NAME_ENG'
      Size = 35
    end
    object ADOProvincesTOGOVCODE: TIntegerField
      FieldName = 'GOVCODE'
    end
    object ADOProvincesTOCAPITALID: TIntegerField
      FieldName = 'CAPITALID'
    end
    object ADOProvincesTOUNITTYPEID: TIntegerField
      FieldName = 'UNITTYPEID'
    end
  end
  object TestQuery_: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select  CITY_ID,TITLE_EN from CITY'
      '')
    Left = 936
    Top = 376
    object TestQuery_CITY_ID: TIntegerField
      FieldName = 'CITY_ID'
      Origin = '"CITY"."CITY_ID"'
      Required = True
    end
    object TestQuery_TITLE_EN: TIBStringField
      FieldName = 'TITLE_EN'
      Origin = '"CITY"."TITLE_EN"'
      Size = 1000
    end
  end
  object IBTableTest: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    BufferChunks = 10000
    DefaultIndex = False
    FieldDefs = <
      item
        Name = 'CITY_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COUNTRY_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IMPORTANT'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'REGION_ID'
        DataType = ftInteger
      end
      item
        Name = 'TITLE_RU'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_RU'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_RU'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_UA'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_UA'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_UA'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_BE'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_BE'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_BE'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_EN'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_EN'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_EN'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_ES'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_ES'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_ES'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_PT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_PT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_PT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_DE'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_DE'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_DE'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_FR'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_FR'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_FR'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_IT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_IT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_IT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_PL'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_PL'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_PL'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_JA'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_JA'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_JA'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_LT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_LT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_LT'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_LV'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_LV'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_LV'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'TITLE_CZ'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_CZ'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'REGION_CZ'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'AREA_ID'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'CITY_IDX1'
        Fields = 'CITY_ID'
        Options = [ixUnique]
      end
      item
        Name = 'CITY_IDX2'
        Fields = 'AREA_ID'
      end>
    StoreDefs = True
    TableName = 'CITY'
    Left = 944
    Top = 440
    object IBTableTestCITY_ID: TIntegerField
      FieldName = 'CITY_ID'
      Required = True
    end
    object IBTableTestTITLE_EN: TIBStringField
      FieldName = 'TITLE_EN'
      Size = 1000
    end
  end
  object COUNTRIES_INFOTo: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      'select  * from COUNTRIES_INFO'
      '')
    Left = 520
    Top = 408
  end
  object COUNTRIES_INFOSrc: TDataSource
    DataSet = CityTo
    Left = 552
    Top = 464
  end
  object LanguagesTO: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      'select  * from LANGUAGES'
      '')
    Left = 656
    Top = 384
    object LanguagesTOID: TIntegerField
      FieldName = 'ID'
      Origin = '"LANGUAGES"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LanguagesTONAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"LANGUAGES"."NAME"'
      Size = 100
    end
    object LanguagesTOORIGINAL_NAME: TIBStringField
      FieldName = 'ORIGINAL_NAME'
      Origin = '"LANGUAGES"."ORIGINAL_NAME"'
      Size = 100
    end
  end
  object TIME_ZONETo: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      'select  * from TIME_ZONE'
      '')
    Left = 664
    Top = 440
    object TIME_ZONEToID: TIntegerField
      FieldName = 'ID'
      Origin = '"TIME_ZONE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TIME_ZONEToNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TIME_ZONE"."NAME"'
      Size = 50
    end
    object TIME_ZONEToAVALUE: TIBBCDField
      FieldName = 'AVALUE'
      Origin = '"TIME_ZONE"."AVALUE"'
      Precision = 4
      Size = 2
    end
  end
  object FORM_GOVERNMENT: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      'select  * from FORM_GOVERNMENT'
      '')
    Left = 744
    Top = 384
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
    object FORM_GOVERNMENTNOTE: TMemoField
      FieldName = 'NOTE'
      Origin = '"FORM_GOVERNMENT"."NOTE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object CurrencyTo: TIBQuery
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SQL.Strings = (
      'select CURRENCYID, CURRENCYNAME,CURRENCYSHORT from CURRENCY'
      '')
    Left = 848
    Top = 384
    object CurrencyToCURRENCYID: TIntegerField
      FieldName = 'CURRENCYID'
      Origin = '"CURRENCY"."CURRENCYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CurrencyToCURRENCYNAME: TIBStringField
      FieldName = 'CURRENCYNAME'
      Origin = '"CURRENCY"."CURRENCYNAME"'
      Size = 30
    end
    object CurrencyToCURRENCYSHORT: TIBStringField
      FieldName = 'CURRENCYSHORT'
      Origin = '"CURRENCY"."CURRENCYSHORT"'
      Size = 4
    end
  end
  object TestQuery: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select AREA.country_id, AREA.TITLE_ORIGINAL, count(*) from AREA'#13 +
      #10'group by country_id, TITLE_ORIGINAL having count( * ) > 1'
    Parameters = <>
    Left = 832
    Top = 160
  end
  object CityToNew: TIBDataSet
    Database = IBDatabaseTO
    Transaction = IBTransactionTO
    SelectSQL.Strings = (
      
        'select CITIES.cityid, CITIES.countryid, CITIES.provinceid, CITIE' +
        'S.townshipid, CITIES.name, CITIES.name_original from CITIES'
      '')
    Left = 488
    Top = 224
  end
  object CityNew: TIBDataSet
    Database = IBDatabase
    Transaction = IBTransaction
    SelectSQL.Strings = (
      
        'SELECT CITIES.*, COUNTRIES.country_id_to,REGIONS.region_id_to, A' +
        'REA.area_id_to  from CITIES'
      'left join COUNTRIES on COUNTRIES.COUNTRY_ID = CITIES.country_id'
      'left join REGIONS on REGIONS.REGION_ID = CITIES.REGION_id'
      'left join AREA on AREA.area_id = CITIES.area_id'
      ''
      ''
      'WHERE CITIES.COUNTRY_ID=:COUNTRY_ID')
    DataSource = CountrySrc
    Left = 416
    Top = 216
    object CityNewCITY_ID: TIntegerField
      FieldName = 'CITY_ID'
      Origin = '"CITIES"."CITY_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CityNewCOUNTRY_ID: TIntegerField
      FieldName = 'COUNTRY_ID'
      Origin = '"CITIES"."COUNTRY_ID"'
      Required = True
    end
    object CityNewIMPORTANT: TSmallintField
      FieldName = 'IMPORTANT'
      Origin = '"CITIES"."IMPORTANT"'
      Required = True
    end
    object CityNewREGION_ID: TIntegerField
      FieldName = 'REGION_ID'
      Origin = '"CITIES"."REGION_ID"'
    end
    object CityNewAREA_ID: TIntegerField
      FieldName = 'AREA_ID'
      Origin = '"CITIES"."AREA_ID"'
    end
    object CityNewTITLE_RU: TIBStringField
      FieldName = 'TITLE_RU'
      Origin = '"CITIES"."TITLE_RU"'
      Size = 1000
    end
    object CityNewTITLE_UA: TIBStringField
      FieldName = 'TITLE_UA'
      Origin = '"CITIES"."TITLE_UA"'
      Size = 1000
    end
    object CityNewTITLE_EN: TIBStringField
      FieldName = 'TITLE_EN'
      Origin = '"CITIES"."TITLE_EN"'
      Size = 1000
    end
    object CityNewTITLE_ORIGINAL: TIBStringField
      FieldName = 'TITLE_ORIGINAL'
      Origin = '"CITIES"."TITLE_ORIGINAL"'
      Size = 1000
    end
    object CityNewGEO_LAT: TFloatField
      FieldName = 'GEO_LAT'
      Origin = '"CITIES"."GEO_LAT"'
    end
    object CityNewGEO_LNG: TFloatField
      FieldName = 'GEO_LNG'
      Origin = '"CITIES"."GEO_LNG"'
    end
    object CityNewCITY_ID_TO: TIntegerField
      FieldName = 'CITY_ID_TO'
      Origin = '"CITIES"."CITY_ID_TO"'
    end
    object CityNewCOUNTRY_ID_TO: TIntegerField
      FieldName = 'COUNTRY_ID_TO'
      Origin = '"COUNTRIES"."COUNTRY_ID_TO"'
    end
    object CityNewREGION_ID_TO: TIntegerField
      FieldName = 'REGION_ID_TO'
      Origin = '"REGIONS"."REGION_ID_TO"'
    end
    object CityNewAREA_ID_TO: TIntegerField
      FieldName = 'AREA_ID_TO'
      Origin = '"AREA"."AREA_ID_TO"'
    end
  end
  object AdoCITYTO: TADODataSet
    Active = True
    Connection = ADOConnection2
    CursorType = ctStatic
    CommandText = 
      'select CITIES.cityid, CITIES.countryid, CITIES.provinceid, CITIE' +
      'S.townshipid, CITIES.name, CITIES.name_original,countries.name C' +
      'OUNTRY_NAME from CITIES'#13#10'left join countries on countries.countr' +
      'yid = CITIES.countryid'#13#10#13#10'WHERE CITIES.COUNTRYID = 1'#13#10
    Parameters = <>
    Left = 416
    Top = 336
  end
end
