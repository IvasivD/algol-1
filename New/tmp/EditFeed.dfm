inherited EditFeedfrm: TEditFeedfrm
  Left = 364
  Top = 175
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103
  ClientHeight = 308
  ClientWidth = 291
  PixelsPerInch = 96
  TextHeight = 13
  inherited WorkPanel: TPanel
    Width = 291
    Height = 274
    object TouristNameDBText: TDBText [0]
      Left = 8
      Top = 8
      Width = 114
      Height = 13
      AutoSize = True
      DataField = 'TOURISTNAME'
      DataSource = DM.RoomingQrySrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel [1]
      Left = 8
      Top = 148
      Width = 59
      Height = 13
      Caption = #1061#1072#1088#1095#1091#1074#1072#1085#1085#1103
    end
    object Label2: TLabel [2]
      Left = 8
      Top = 185
      Width = 47
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1088#1080#1084#1110#1090#1082#1072
    end
    inherited RichEdit: TRichEdit
      Top = 341
      Width = 523
      TabOrder = 3
    end
    object FeedComboBox: TDBLookupComboBox
      Left = 74
      Top = 144
      Width = 209
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      KeyField = 'FEEDTYPEID'
      ListField = 'CalcFeedName'
      ListSource = FeedSelectSrc
      TabOrder = 1
    end
    object Memo: TMemo
      Left = 8
      Top = 201
      Width = 275
      Height = 65
      Anchors = [akLeft, akRight, akBottom]
      Color = clInfoBk
      TabOrder = 2
    end
    object PeriodGroupBox: TGroupBox
      Left = 8
      Top = 32
      Width = 275
      Height = 89
      Anchors = [akLeft, akTop, akRight]
      Caption = #1058#1077#1088#1084#1110#1085' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 28
        Width = 41
        Height = 13
        Caption = #1042#1110#1076' '#1076#1072#1090#1080
      end
      object Label4: TLabel
        Left = 8
        Top = 60
        Width = 39
        Height = 13
        Caption = #1055#1086' '#1076#1072#1090#1091
      end
      object Label5: TLabel
        Left = 160
        Top = 28
        Width = 31
        Height = 13
        Caption = #1053#1086#1095#1077#1081
      end
      object ChangePeriodBtn: TSpeedButton
        Left = 160
        Top = 56
        Width = 105
        Height = 22
        Hint = #1047#1084#1110#1085#1080#1090#1080'|'#1047#1084#1110#1085#1080#1090#1080' '#1090#1077#1088#1084#1110#1085' '#1087#1088#1086#1078#1080#1074#1072#1085#1085#1103
        AllowAllUp = True
        GroupIndex = 1
        Caption = #1047#1084#1110#1085#1080#1090#1080
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDD0000000DDDDD00000000000D0000000DDDDD0F7F7F7F7F0D0000000D000
          007CCCCCCC70D0000000D0F7F0F7F7F7F7F0D0000000D07CC07F711F7F70D000
          0000D0F7F0F7F117F7F0D0000000D071107F7F117F70D0000000D0F1F0F7F7F1
          17F0D0000000D071107F11111F70D0000000D0F1F0F7F7F7F7F0D0000000D071
          100000000000D0000000D0F7F0CCCCCCCCC0D0000000D000000000000000D000
          0000D0CCCCCCCC0DDDDDD0000000D0000000000DDDDDD0000000DDDDDDDDDDDD
          DDDDD0000000}
        OnClick = ChangePeriodBtnClick
      end
      object FromDatePicker: TDateTimePicker
        Left = 64
        Top = 24
        Width = 81
        Height = 21
        CalAlignment = dtaLeft
        Date = 37853.6278690394
        Time = 37853.6278690394
        Color = clBtnFace
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnCloseUp = DaysEditChange
        OnChange = DaysEditChange
      end
      object TillDatePicker: TDateTimePicker
        Left = 64
        Top = 56
        Width = 81
        Height = 21
        CalAlignment = dtaLeft
        Date = 37853.6278690394
        Time = 37853.6278690394
        Color = clBtnFace
        DateFormat = dfShort
        DateMode = dmComboBox
        Enabled = False
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
      end
      object DaysEdit: TSpinEdit
        Left = 200
        Top = 24
        Width = 65
        Height = 22
        Color = clBtnFace
        Enabled = False
        MaxValue = 299
        MinValue = 1
        TabOrder = 2
        Value = 1
        OnChange = DaysEditChange
      end
    end
  end
  inherited CtrlPanel: TPanel
    Top = 274
    Width = 291
    inherited OkBtn: TBitBtn
      Left = 111
      Width = 82
      TabOrder = 1
    end
    inherited CancelBtn: TBitBtn
      Left = 201
      TabOrder = 2
    end
    object ApplyAllBtn: TBitBtn
      Left = 8
      Top = 5
      Width = 82
      Height = 25
      Caption = '&'#1044#1083#1103' '#1074#1089#1110#1093
      TabOrder = 0
      Kind = bkAll
    end
  end
  inherited MemoPopupMenu: TPopupMenu
    Left = 304
    Top = 264
  end
  inherited ActionList: TActionList
    Left = 256
  end
  object FeedSelectSrc: TDataSource
    DataSet = SelFeedQry
    Left = 216
    Top = 144
  end
  object SelFeedQry: TQuery
    OnCalcFields = SelFeedQryCalcFields
    DatabaseName = 'Tour'
    SQL.Strings = (
      'SELECT * FROM FEED_TYPES_VIEW')
    Left = 208
    Top = 128
    object SelFeedQryFEEDTYPEID: TIntegerField
      FieldName = 'FEEDTYPEID'
      Origin = 'TOUR.FEEDTYPES.FEEDTYPEID'
    end
    object SelFeedQryFEEDNAME: TStringField
      FieldName = 'FEEDNAME'
      Origin = 'TOUR.FEEDTYPES.FEEDNAME'
      Size = 10
    end
    object SelFeedQryMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = 'TOUR.FEEDTYPES.MEMO'
      BlobType = ftMemo
      Size = 1
    end
    object SelFeedQrySORTORDER: TSmallintField
      FieldName = 'SORTORDER'
      Origin = 'TOUR.FEEDTYPES.SORTORDER'
    end
    object SelFeedQryNAME: TStringField
      FieldName = 'NAME'
      Origin = 'TOUR.FEEDTYPES.NAME'
      Size = 25
    end
    object SelFeedQryCalcFeedName: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcFeedName'
      Size = 30
      Calculated = True
    end
  end
end
