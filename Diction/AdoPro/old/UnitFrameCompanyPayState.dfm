object FrameCompanyPayState: TFrameCompanyPayState
  Left = 0
  Top = 0
  Width = 497
  Height = 254
  TabOrder = 0
  DesignSize = (
    497
    254)
  object TaxPayGroupBox: TGroupBox
    Left = 5
    Top = 11
    Width = 488
    Height = 238
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1044#1083#1103' '#1091#1082#1088#1072#1111#1085#1089#1100#1082#1080#1093' '#1087#1072#1088#1090#1085#1077#1088#1110#1074': '#1076#1110#1108' '#1085#1072' '#1087#1110#1076#1089#1090#1072#1074#1110
    TabOrder = 0
    DesignSize = (
      488
      238)
    object SingleTaxGroupBox: TGroupBox
      Left = 8
      Top = 85
      Width = 473
      Height = 143
      Hint = '|'#1050#1086#1076' '#1087#1083#1072#1090#1085#1080#1082#1072' '#1055#1044#1042
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      object DateSingleTaxLabel: TLabel
        Left = 289
        Top = 53
        Width = 79
        Height = 13
        Caption = #1055#1086#1076#1072#1090#1086#1082' '#1076#1110#1108' '#1074#1110#1076
      end
      object TypeSingleTaxLabel: TLabel
        Left = 181
        Top = 53
        Width = 77
        Height = 13
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      end
      object DocSingleLabel: TLabel
        Left = 8
        Top = 62
        Width = 117
        Height = 26
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1088#1086' '#1089#1080#1089#1090#1077#1084#1091' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103
        WordWrap = True
      end
      object TaxLabel: TLabel
        Left = 385
        Top = 53
        Width = 83
        Height = 13
        Caption = #1057#1090#1072#1074#1082#1072' '#1087#1086#1076#1072#1090#1082#1091
      end
      object TaxPayStateLabel: TLabel
        Left = 8
        Top = -2
        Width = 124
        Height = 13
        Caption = #1057#1080#1089#1090#1077#1084#1072' '#1086#1087#1086#1076#1072#1090#1082#1091#1074#1072#1085#1085#1103
      end
      object TaxPayCodeLabel: TLabel
        Left = 88
        Top = 98
        Width = 18
        Height = 13
        Alignment = taRightJustify
        Caption = #1030#1055#1053
      end
      object TypeDocLabel: TLabel
        Left = 181
        Top = 98
        Width = 77
        Height = 13
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      end
      object TaxPayRegDateLabel: TLabel
        Left = 289
        Top = 98
        Width = 56
        Height = 13
        Caption = #1055#1044#1042' '#1076#1110#1108' '#1074#1110#1076
      end
      object PDVLabel: TLabel
        Left = 385
        Top = 98
        Width = 61
        Height = 13
        Caption = #1057#1090#1072#1074#1082#1072' '#1055#1044#1042
      end
      object TaxPayLabel: TLabel
        Left = 7
        Top = 105
        Width = 74
        Height = 28
        AutoSize = False
        Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1088#1086' '#1089#1087#1083#1072#1090#1091' '#1055#1044#1042
        WordWrap = True
      end
      object HistoryBtn: TSpeedButton
        Left = 385
        Top = 22
        Width = 80
        Height = 21
        Caption = #1030#1089#1090#1086#1088#1110#1103
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD0000
          BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00
          00FFFFFFFFFFFFFFFFFFFFFFFF31313131313132323230303031313130303031
          3131313131303030313131313131303030FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9BD00
          00FFFFFFFFFFFFFFFFFFFFFFFF313131C1BCC2C1BCC2C1BCC2C1BCC2C1BCC2C1
          BCC2C1BCC2C1BCC2C1BCC2C1BCC2323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFBD00
          00FFFFFFFFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000000000BD00
          00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFF000000000000FFFFFF00000000
          0000FFFFFF000000000000000000323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFF000000000000FFFFFF000000000000FFFFFF00000000000000FFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFF313131FFFFFF000000000000FFFFFF00000000
          0000FFFFFF000000000000F7F7F7FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
          BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD000000000000FF
          FFFFFFFF000000FFFFFFFFFFFF31313132323231313130303030303032323231
          3131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
          FFFFFFBD0000BD0000FFFFFFBD0000BD0000FFFFFFBD0000BD000000000000FF
          FFFFFFFF000000FFFFFFFFFFFF303030FFFFFF313131323232FFFFFF32323230
          3030FFFFFF323232313131000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
          BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00000000
          0000FFFFFFFFFF000000FFFFFF31313131313132323231313131313132323232
          3232313131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          0000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000C600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000A8A3A9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000C600FFC600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000A8A3A9A8A3A9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = HistoryBtnClick
      end
      object PPEdit: TcxTextEdit
        Left = 385
        Top = 67
        Enabled = False
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 80
      end
      object PDVEdit: TcxTextEdit
        Left = 385
        Top = 112
        Enabled = False
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 80
      end
      object SingleTaxDateDateEdit: TcxDateEdit
        Tag = 1
        Left = 289
        Top = 67
        Enabled = False
        Style.BorderStyle = ebs3D
        Style.Color = clInfoBk
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 86
      end
      object TaxPayRegDateDateEdit: TcxDateEdit
        Tag = 2
        Left = 289
        Top = 112
        Enabled = False
        Style.BorderStyle = ebs3D
        Style.Color = clInfoBk
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 86
      end
      object TaxPayCodeEdit: TcxTextEdit
        Left = 84
        Top = 112
        HelpContext = 8008
        Enabled = False
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 85
      end
      object TaxPayStateComboBox: TcxExtLookupComboBox
        Left = 9
        Top = 23
        Enabled = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 365
      end
      object SingleTaxComboBox: TcxExtLookupComboBox
        Left = 180
        Top = 67
        Enabled = False
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 100
      end
      object TaxPayTypeIdComboBox: TcxExtLookupComboBox
        Left = 180
        Top = 112
        Enabled = False
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 100
      end
    end
    object ReestrGroupBox: TGroupBox
      Left = 8
      Top = 20
      Width = 473
      Height = 59
      Hint = '|'#1050#1086#1076' '#1087#1083#1072#1090#1085#1080#1082#1072' '#1055#1044#1042
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1088#1086' '#1076#1077#1088#1078#1072#1074#1085#1091' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1102
      TabOrder = 0
      object ReestrDateLabel: TLabel
        Left = 291
        Top = 15
        Width = 79
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111
      end
      object Label12: TLabel
        Left = 62
        Top = 15
        Width = 77
        Height = 13
        Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      end
      object IdentCodeLabel: TLabel
        Left = 166
        Top = 15
        Width = 110
        Height = 13
        Caption = #1030#1076#1077#1085#1090#1080#1092#1110#1082#1072#1094#1110#1081#1085#1080#1081' '#1082#1086#1076' '
        FocusControl = IdentCodeDBEdit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object IdentCodeDBEdit: TcxTextEdit
        Left = 166
        Top = 29
        HelpContext = 8008
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 121
      end
      object ReestrDateDateEdit: TcxDateEdit
        Left = 291
        Top = 29
        Style.BorderStyle = ebs3D
        Style.Color = clInfoBk
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 87
      end
      object ReestrComboBox: TcxExtLookupComboBox
        Left = 62
        Top = 29
        Properties.DropDownAutoSize = True
        Properties.DropDownRows = 24
        Properties.DropDownSizeable = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 100
      end
    end
  end
  object ItsActionComboBox: TcxExtLookupComboBox
    Left = 259
    Top = 6
    Anchors = [akLeft, akTop, akRight, akBottom]
    Properties.DropDownAutoSize = True
    Properties.DropDownRows = 24
    Properties.DropDownSizeable = True
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.TextColor = clBlack
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 227
  end
end
