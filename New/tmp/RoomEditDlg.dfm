inherited RoomingEditDlg: TRoomingEditDlg
  Left = 373
  Top = 175
  Caption = 'Розміщення в готелі  %s'
  ClientHeight = 357
  ClientWidth = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited WorkPanel: TPanel
    Width = 417
    Height = 324
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 35
      Height = 13
      Caption = 'Турист'
    end
    object DBBirthLookup: TDBText
      Left = 272
      Top = 20
      Width = 72
      Height = 13
      AutoSize = True
      DataField = 'LookBirthDate'
      DataSource = DataSrc
    end
    object Label10: TLabel
      Left = 8
      Top = 98
      Width = 83
      Height = 13
      Caption = 'Дата поселення'
    end
    object Label11: TLabel
      Left = 8
      Top = 124
      Width = 68
      Height = 13
      Caption = 'Дата вибуття'
    end
    object RequestDayCountLabel: TLabel
      Left = 136
      Top = 161
      Width = 20
      Height = 13
      Caption = 'днів'
    end
    object Label13: TLabel
      Left = 8
      Top = 161
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Проживання'
    end
    object Label17: TLabel
      Left = 20
      Top = 187
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Оплата за'
    end
    object ForPayDayCountLabel: TLabel
      Left = 136
      Top = 187
      Width = 20
      Height = 13
      Caption = 'днів'
    end
    object Label14: TLabel
      Left = 200
      Top = 99
      Width = 62
      Height = 13
      Caption = 'Розміщення'
    end
    object Label15: TLabel
      Left = 200
      Top = 126
      Width = 59
      Height = 13
      Caption = 'Харчування'
    end
    object Label2: TLabel
      Left = 256
      Top = 234
      Width = 25
      Height = 13
      Caption = 'грн.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 96
      Top = 230
      Width = 56
      Height = 13
      Caption = 'По тарифу:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 168
      Top = 292
      Width = 53
      Height = 13
      Caption = 'До оплати'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 230
      Width = 52
      Height = 13
      Caption = 'Вартість'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 208
      Width = 401
      Height = 9
      Anchors = [akLeft, akTop, akRight]
      Shape = bsBottomLine
    end
    object Label5: TLabel
      Left = 8
      Top = 60
      Width = 35
      Height = 13
      Caption = 'Готель'
    end
    object HotelChangeBtn: TSpeedButton
      Left = 256
      Top = 56
      Width = 20
      Height = 22
      Hint = 'Змінити готель|Змінити готель на інший'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDFDDDDDDDDDDDDDDD0DDDDDDDDDDDDDDD8FDDDDDDDDDDDDD000DD
        DDDDDDDDDDD888FDDDDDDDDDDD00000DDDDDDDDDDD88888FDDDDDDDDD0000000
        DDDDDDDDD8888888FDDDDDDD000000000DDDDDDD888888888DDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
      NumGlyphs = 2
      OnClick = HotelChangeBtnClick
    end
    object TouristDBLookupComboBox: TDBLookupComboBox
      Left = 56
      Top = 16
      Width = 201
      Height = 21
      Color = clInfoBk
      DataField = 'PersonId'
      DataSource = DataSrc
      KeyField = 'PersonId'
      ListField = 'TOURISTNAME'
      TabOrder = 0
    end
    object FromDatePicker: TDateTimePicker
      Left = 99
      Top = 94
      Width = 82
      Height = 21
      CalAlignment = dtaLeft
      Date = 36299.5833333333
      Time = 36299.5833333333
      Color = clInfoBk
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnCloseUp = FromDatePickerChange
      OnChange = FromDatePickerChange
    end
    object ToDatePicker: TDateTimePicker
      Left = 99
      Top = 120
      Width = 82
      Height = 21
      CalAlignment = dtaLeft
      Date = 36299.5833217593
      Time = 36299.5833217593
      Color = clBtnFace
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object RequestDayCountEdit: TSpinEdit
      Left = 83
      Top = 156
      Width = 44
      Height = 22
      Hint = '|Кількість ночей, на яку замовляється проживання'
      Color = clInfoBk
      MaxValue = 999
      MinValue = 1
      TabOrder = 3
      Value = 3
      OnChange = RequestDayCountEditChange
      OnClick = RequestDayCountEditChange
    end
    object ForPayDayCountEdit: TSpinEdit
      Left = 83
      Top = 182
      Width = 44
      Height = 22
      Hint = '|Це поле використовується для визначення екстрасів'
      Color = clInfoBk
      MaxValue = 999
      MinValue = 1
      TabOrder = 4
      Value = 3
      OnChange = ForPayDayCountEditChange
      OnClick = ForPayDayCountEditChange
    end
    object RoomDBLookupComboBox: TDBLookupComboBox
      Left = 272
      Top = 96
      Width = 137
      Height = 21
      Color = clInfoBk
      DataField = 'RoomId'
      DataSource = DataSrc
      KeyField = 'HotelRoomId'
      ListField = 'CalcRoom'
      TabOrder = 5
    end
    object FeedDBLookupComboBox: TDBLookupComboBox
      Left = 272
      Top = 122
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'FeedId'
      DataSource = DataSrc
      KeyField = 'FEEDTYPEID'
      ListField = 'FEEDNAME'
      TabOrder = 6
    end
    object HotelRateEdit1: TEdit
      Left = 256
      Top = 250
      Width = 73
      Height = 21
      Color = clInfoBk
      TabOrder = 9
      Text = '0'
      OnChange = HotelRateRadioButtonClick
      OnKeyPress = DBNumberKeyPress
    end
    object HotelRateEdit2: TEdit
      Left = 336
      Top = 250
      Width = 73
      Height = 21
      Color = clInfoBk
      TabOrder = 11
      OnChange = HotelRateRadioButtonClick
      OnKeyPress = DBNumberKeyPress
    end
    object HotelRateRadioButton1: TRadioButton
      Left = 168
      Top = 228
      Width = 57
      Height = 17
      Caption = 'за добу'
      Checked = True
      TabOrder = 7
      TabStop = True
      OnClick = HotelRateRadioButtonClick
    end
    object HotelRateRadioButton2: TRadioButton
      Left = 168
      Top = 244
      Width = 54
      Height = 17
      Caption = 'разом'
      TabOrder = 8
    end
    object Curr2DBLookupComboBox: TDBLookupComboBox
      Left = 336
      Top = 226
      Width = 73
      Height = 21
      Color = clInfoBk
      DataField = 'CURR2ID'
      DataSource = DataSrc
      KeyField = 'CURRENCYID'
      ListField = 'CURRENCYSHORT'
      ListSource = SelCurr2QrySrc
      TabOrder = 10
    end
    object RateDBEdit: TDBEdit
      Left = 256
      Top = 288
      Width = 73
      Height = 21
      Color = clBtnFace
      DataField = 'Rate'
      DataSource = DataSrc
      ReadOnly = True
      TabOrder = 12
    end
    object Rate2DBEdit: TDBEdit
      Left = 336
      Top = 288
      Width = 73
      Height = 21
      Color = clBtnFace
      DataField = 'Rate2'
      DataSource = DataSrc
      ReadOnly = True
      TabOrder = 13
    end
    object HotelNamePanel: TPanel
      Left = 48
      Top = 56
      Width = 201
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      BorderWidth = 4
      Caption = 'HotelNamePanel'
      TabOrder = 14
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 56
      Top = 56
      Width = 201
      Height = 21
      Color = clInfoBk
      DataField = 'HotelId'
      DataSource = DataSrc
      KeyField = 'HOTELID'
      ListField = 'HOTELNAME;STARS'
      ListSource = HotelSelSrc
      TabOrder = 15
      Visible = False
    end
  end
  inherited CtrlPanel: TPanel
    Top = 324
    Width = 417
    inherited OkBtn: TBitBtn
      Left = 238
    end
    inherited CancelBtn: TBitBtn
      Left = 325
    end
    inherited ApplyAllBtn: TBitBtn
      Enabled = True
    end
  end
  inherited DataSrc: TDataSource
    DataSet = DM.RoomingTable
  end
  object SelCurr2Qry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select CurrencyId, CurrencyShort from CURRENCYSHORT_VIEW'
      'order by CurrencyShort')
    Left = 360
    Top = 184
    object SelCurr2QryCURRENCYID: TIntegerField
      FieldName = 'CURRENCYID'
    end
    object SelCurr2QryCURRENCYSHORT: TStringField
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
  end
  object SelCurr2QrySrc: TDataSource
    DataSet = SelCurr2Qry
    Left = 376
    Top = 208
  end
  object HotelSelQry: TQuery
    DatabaseName = 'Tour'
    Filtered = True
    SQL.Strings = (
      'select C.CountryId, H.CityId, H.HotelId, C.Name as CountryName, '
      '  T.Name as ResortName, H.Name as HotelName, H.Stars'
      'from Hotels H, Cities T, Countries C'
      'where T.CityId = H.CityId and T.CountryId = C.CountryId'
      'order by C.Name, T.Name, H.Name, H.Stars desc')
    Left = 328
    Top = 48
    object HotelSelQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object HotelSelQryCITYID: TIntegerField
      FieldName = 'CITYID'
    end
    object HotelSelQryHOTELID: TIntegerField
      FieldName = 'HOTELID'
    end
    object HotelSelQryCOUNTRYNAME: TStringField
      FieldName = 'COUNTRYNAME'
      Size = 30
    end
    object HotelSelQryRESORTNAME: TStringField
      FieldName = 'RESORTNAME'
      Size = 25
    end
    object HotelSelQryHOTELNAME: TStringField
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
    Left = 343
    Top = 72
  end
end
