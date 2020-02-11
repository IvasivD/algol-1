object HotelChooseDlg: THotelChooseDlg
  Left = 380
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'Вибір готелю'
  ClientHeight = 309
  ClientWidth = 462
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SelHotelDBGrid: TDBGrid
    Left = 0
    Top = 25
    Width = 338
    Height = 250
    Align = alClient
    Color = clInfoBk
    DataSource = HotelSelSrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RESORTNAME'
        Title.Alignment = taCenter
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOTELNAME'
        Title.Alignment = taCenter
        Width = 136
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'STARS'
        Title.Alignment = taCenter
        Width = 42
        Visible = True
      end>
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 275
    Width = 462
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object OkBtn: TBitBtn
      Left = 297
      Top = 4
      Width = 74
      Height = 25
      Hint = 'Створити маршрут'
      Anchors = [akTop, akRight]
      Caption = 'ОК'
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 378
      Top = 4
      Width = 75
      Height = 25
      Hint = 'Відмовитися від створення маршруту'
      Anchors = [akTop, akRight]
      Caption = 'Відміна'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object RoomsDBGrid: TDBGrid
    Left = 338
    Top = 25
    Width = 124
    Height = 250
    Align = alRight
    Color = clBtnFace
    DataSource = RoomInHotelQrySrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ROOMTYPE'
        Title.Alignment = taCenter
        Width = 103
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 25
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 8
    Caption = 'Країна'
    TabOrder = 3
    object CountryDBLookupComboBox: TDBLookupComboBox
      Left = 52
      Top = 2
      Width = 225
      Height = 21
      Color = clInfoBk
      KeyField = 'COUNTRYID'
      ListField = 'NAME'
      ListSource = SelCntrySrc
      TabOrder = 0
      OnClick = CountryDBLookupComboBoxClick
    end
  end
  object HotelSelQry: TQuery
    AfterScroll = HotelSelQryAfterScroll
    DatabaseName = 'Tour'
    Filtered = True
    DataSource = SelCntrySrc
    SQL.Strings = (
      
        'select H.CityId, H.HotelId, C.Name as ResortName, H.Name as Hote' +
        'lName, H.Stars'
      '  from Hotels H, Cities C'
      'where C.CityId = H.CityId and C.CountryId = :CountryId'
      'order by C.Name, H.Name, H.Stars desc')
    Left = 16
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CountryId'
        ParamType = ptUnknown
      end>
    object HotelSelQryCITYID: TIntegerField
      FieldName = 'CITYID'
    end
    object HotelSelQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object HotelSelQryRESORTNAME: TStringField
      DisplayLabel = 'Курорт'
      FieldName = 'RESORTNAME'
      Size = 25
    end
    object HotelSelQryHOTELNAME: TStringField
      DisplayLabel = 'Готель'
      FieldName = 'HOTELNAME'
      Size = 15
    end
    object HotelSelQrySTARS: TStringField
      FieldName = 'STARS'
      Size = 5
    end
  end
  object HotelSelSrc: TDataSource
    DataSet = HotelSelQry
    Left = 31
    Top = 208
  end
  object RoomInHotelQry: TQuery
    DatabaseName = 'Tour'
    DataSource = HotelSelSrc
    SQL.Strings = (
      
        'select R.HotelRoomId, R.RoomTypeId, T.RoomType from HtlRooms R, ' +
        'RoomTypes T'
      'where R.HotelId = :HotelId and T.RoomTypeId = R.RoomTypeId'
      'order by R.RoomTypeId')
    Left = 232
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'HOTELID'
        ParamType = ptUnknown
      end>
    object RoomInHotelQryROOMTYPEID: TIntegerField
      FieldName = 'ROOMTYPEID'
    end
    object RoomInHotelQryROOMTYPE: TStringField
      DisplayLabel = 'Номери'
      FieldName = 'ROOMTYPE'
      Size = 30
    end
    object RoomInHotelQryHOTELROOMID: TIntegerField
      FieldName = 'HOTELROOMID'
    end
  end
  object RoomInHotelQrySrc: TDataSource
    DataSet = RoomInHotelQry
    Left = 247
    Top = 208
  end
  object SelCntryQry: TQuery
    AfterScroll = HotelSelQryAfterScroll
    DatabaseName = 'Tour'
    Filtered = True
    SQL.Strings = (
      'select C.CountryId, C.Name from Countries C'
      'where exists ('
      '  select H.HotelId from Hotels H, Cities T'
      '  where T.CityId = H.CityId and T.CountryId = C.CountryId)'
      'order by C.Name')
    Left = 56
    Top = 80
    object SelCntryQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object SelCntryQryNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
  end
  object SelCntrySrc: TDataSource
    DataSet = SelCntryQry
    Left = 71
    Top = 104
  end
end
