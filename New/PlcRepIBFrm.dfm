inherited PlaceByStateListForm: TPlaceByStateListForm
  Left = 222
  Top = 289
  Width = 786
  BorderStyle = bsSizeable
  Caption = #1055#1077#1088#1077#1083#1110#1082' '#1084#1110#1089#1094#1100' '#1087#1086' '#1089#1090#1072#1085#1091' '#1086#1087#1083#1072#1090#1080
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    Width = 778
    Height = 57
    inherited ShowMemoBtn: TSpeedButton
      Left = 534
      Top = 3
    end
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 33
      Height = 13
      Caption = #1047' '#1076#1072#1090#1080
    end
    object Label2: TLabel
      Left = 8
      Top = 34
      Width = 39
      Height = 13
      Caption = #1055#1086' '#1076#1072#1090#1091
    end
    object FromDatePicker: TDateTimePicker
      Left = 56
      Top = 6
      Width = 81
      Height = 21
      Date = 37102.670918113400000000
      Time = 37102.670918113400000000
      Color = clInfoBk
      TabOrder = 0
      OnChange = FromDatePickerChange
    end
    object TillDatePicker: TDateTimePicker
      Left = 56
      Top = 30
      Width = 81
      Height = 21
      Date = 37102.670918113400000000
      Time = 37102.670918113400000000
      Color = clInfoBk
      TabOrder = 1
    end
    object DirectionRadioGroup: TRadioGroup
      Left = 152
      Top = 16
      Width = 137
      Height = 35
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #1058#1091#1076#1080
        #1053#1072#1079#1072#1076)
      TabOrder = 2
    end
    object ExecuteBtn: TBitBtn
      Left = 688
      Top = 26
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1080#1073#1088#1072#1090#1080
      TabOrder = 3
      OnClick = ExecuteBtnClick
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000F0000000E0000000100
        0400000000007000000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0087FFFFFFFFFFFF0B3087FFFFFFFFFFF0BB0087FF
        FFFFFFFF0BB3008FFFFFFFFFF0BBB008FFFFFFFFF00BBB007FFFFFFF00BBB007
        FFF0FFFFF00BBB007FF0FFFFFFF00BB007F0FFFFFFFFF00B0070FFFFFFFFFFF0
        00F0FFFFFFFFFFFFFFF0}
      Margin = 4
    end
    object StateFilterCheckBox: TCheckBox
      Left = 304
      Top = 32
      Width = 105
      Height = 17
      Caption = #1055#1086' '#1089#1090#1072#1085#1091' '#1086#1087#1083#1072#1090#1080
      TabOrder = 4
      OnClick = StateFilterCheckBoxClick
    end
    object StateFilterComboBox: TAzComboBox
      Left = 412
      Top = 30
      Width = 145
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 5
      OnClick = StateFilterComboBoxClick
    end
  end
  inherited BottomPanel: TPanel
    Width = 778
    inherited ActiveRecordLabel: TLabel
      Visible = False
    end
    inherited CloseBtn: TBitBtn
      Left = 688
    end
    inherited PrintBtn: TBitBtn
      Left = 598
    end
  end
  inherited PersonListDBGrid: TSvtDBGrid
    Top = 57
    Width = 778
    Height = 327
    Color = clBtnFace
    Enabled = False
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LEAVEDATE'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ORDERID'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTNAME'
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOURISTNAME'
        Width = 156
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PLACENO'
        Visible = True
      end
      item
        Expanded = False
        Width = 4
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RETLEAVEDATE'
        Width = 65
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RETPLACENO'
        Visible = True
      end
      item
        Expanded = False
        Width = 4
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANAGER'
        Width = 136
        Visible = True
      end>
  end
  inherited SumPanel: TPanel
    Width = 778
  end
  inherited DetailListQuerySrc: TDataSource
    Top = 403
  end
  inherited DetailListQuery: TQuery
    Filtered = True
    SQL.Strings = (
      
        'select * from  PLACELIST_SEL_PROC (:FromDate, :TillDate, :Direct' +
        'ion)'
      'order by LeaveDate, OrderId')
    Top = 403
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'FromDate'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'TillDate'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Direction'
        ParamType = ptInput
      end>
    object DetailListQueryLEAVINGID: TIntegerField
      FieldName = 'LEAVINGID'
    end
    object DetailListQueryPLACEID: TIntegerField
      FieldName = 'PLACEID'
    end
    object DetailListQueryPLACENO: TStringField
      DisplayLabel = #1052#1110#1089#1094#1077
      FieldName = 'PLACENO'
      Size = 8
    end
    object DetailListQueryPLACECLASS: TSmallintField
      FieldName = 'PLACECLASS'
    end
    object DetailListQueryLEAVEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1090#1091#1076#1080
      FieldName = 'LEAVEDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DetailListQuerySTATE: TSmallintField
      FieldName = 'STATE'
    end
    object DetailListQueryORDERID: TIntegerField
      DisplayLabel = #1047#1072#1084'.'#8470
      FieldName = 'ORDERID'
    end
    object DetailListQueryCLIENTNAME: TStringField
      DisplayLabel = #1047#1072#1084#1086#1074#1085#1080#1082
      FieldName = 'CLIENTNAME'
      Size = 35
    end
    object DetailListQueryCLIENTISENTERPR: TStringField
      FieldName = 'CLIENTISENTERPR'
      Size = 1
    end
    object DetailListQueryPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object DetailListQueryTOURISTNAME: TStringField
      DisplayLabel = #1058#1091#1088#1080#1089#1090
      FieldName = 'TOURISTNAME'
      Size = 35
    end
    object DetailListQuerySTARTPOINT: TStringField
      FieldName = 'STARTPOINT'
      Size = 30
    end
    object DetailListQuerySTOPPOINT: TStringField
      FieldName = 'STOPPOINT'
      Size = 30
    end
    object DetailListQueryTICKETNO: TStringField
      FieldName = 'TICKETNO'
    end
    object DetailListQueryRATE: TFloatField
      FieldName = 'RATE'
    end
    object DetailListQueryRATE2: TFloatField
      FieldName = 'RATE2'
    end
    object DetailListQueryDISCOUNT: TFloatField
      FieldName = 'DISCOUNT'
    end
    object DetailListQueryDISCOUNT2: TFloatField
      FieldName = 'DISCOUNT2'
    end
    object DetailListQueryINCREASE: TFloatField
      FieldName = 'INCREASE'
    end
    object DetailListQueryINCREASE2: TFloatField
      FieldName = 'INCREASE2'
    end
    object DetailListQueryCURRENCYSHORT: TStringField
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object DetailListQueryORDERMEMO: TMemoField
      FieldName = 'ORDERMEMO'
      BlobType = ftMemo
      Size = 1
    end
    object DetailListQueryRESERVTO: TDateTimeField
      FieldName = 'RESERVTO'
    end
    object DetailListQueryMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldName = 'MANAGER'
      Size = 35
    end
    object DetailListQueryRETLEAVEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1079#1072#1076
      FieldName = 'RETLEAVEDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DetailListQueryRETPLACENO: TStringField
      DisplayLabel = #1052#1110#1089#1094#1077
      FieldName = 'RETPLACENO'
      Size = 8
    end
  end
  inherited PopupMenu: TPopupMenu
    Top = 403
  end
  inherited ActionList: TActionList
    Top = 403
  end
end
