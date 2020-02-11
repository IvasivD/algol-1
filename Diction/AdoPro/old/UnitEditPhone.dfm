object FrmEditPhone: TFrmEditPhone
  Left = 842
  Top = 299
  Width = 419
  Height = 334
  Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1080#1081' '#1085#1086#1084#1077#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 51
    Top = 20
    Width = 55
    Height = 13
    Caption = #1050#1086#1076' '#1082#1088#1072#1111#1085#1080
  end
  object Label2: TLabel
    Left = 12
    Top = 44
    Width = 96
    Height = 13
    Caption = #1050#1086#1076' '#1084#1110#1089#1090#1072' ('#1088#1077#1075#1110#1086#1085#1091')'
  end
  object Label3: TLabel
    Left = 8
    Top = 68
    Width = 95
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1080#1081' '#1085#1086#1084#1077#1088
  end
  object Label4: TLabel
    Left = 43
    Top = 92
    Width = 61
    Height = 13
    Caption = #1056#1086#1079#1096#1080#1088#1077#1085#1085#1103
  end
  object AreaCodeEditBtn: TSpeedButton
    Left = 200
    Top = 40
    Width = 23
    Height = 22
    Hint = 
      #1047#1084#1110#1085#1080#1090#1080' '#1082#1086#1076'|'#1047#1084#1110#1085#1080#1090#1080' '#1082#1086#1076' '#1084#1110#1089#1090#1072' ('#1088#1077#1075#1110#1086#1085#1091', '#1087#1088#1086#1074#1072#1081#1076#1077#1088#1072' '#1084#1086#1073#1110#1083#1100#1085#1086#1075#1086' '#1079#1074 +
      #39#1103#1079#1082#1091')'
    AllowAllUp = True
    GroupIndex = 1
    Flat = True
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      7777700000007777777777777777700000007444444444444777700000007488
      8888888847777000000074777777770747777000000074700700700047777000
      000074777777770007777000000074700700700B80777000000074777777770B
      707770000000744444444440B8077000000074F44F44F440B707700000007444
      444444440B80700000007777777777770B807000000077777777777770050000
      0000777777777777705500000000777777777777770070000000777777777777
      777770000000}
    OnClick = AreaCodeEditBtnClick
  end
  object Label6: TLabel
    Left = 8
    Top = 138
    Width = 214
    Height = 13
    Caption = #1047#1072#1087#1088#1086#1075#1088#1072#1084#1086#1074#1072#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1096#1074#1080#1076#1082#1086#1075#1086' '#1085#1072#1073#1086#1088#1091
  end
  object MemoLabel: TLabel
    Left = 28
    Top = 192
    Width = 36
    Height = 13
    Caption = #1063#1086#1084#1091' '#1085#1110
  end
  object ModalPanel: TPanel
    Left = 0
    Top = 263
    Width = 403
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      403
      33)
    object OkBtn: TBitBtn
      Left = 231
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 321
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DBCntryCode: TcxTextEdit
    Left = 120
    Top = 15
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 81
  end
  object DBAreaCode: TcxTextEdit
    Left = 120
    Top = 39
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Width = 81
  end
  object DBPhoneNo: TcxTextEdit
    Left = 120
    Top = 64
    Hint = '|'#1058#1077#1083#1077#1092#1086#1085#1085#1080#1081' '#1085#1086#1084#1077#1088' '#1073#1077#1079' '#1082#1086#1076#1110#1074' '#1082#1088#1072#1111#1085#1080' '#1110' '#1088#1077#1075#1110#1086#1085#1091
    ParentShowHint = False
    ShowHint = True
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Width = 105
  end
  object DBExtention: TcxTextEdit
    Left = 120
    Top = 90
    Hint = '|'#1056#1086#1079#1096#1080#1088#1077#1085#1085#1103' '#1090#1077#1083#1077#1092#1086#1085#1085#1086#1075#1086' '#1085#1086#1084#1077#1088#1072' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1081#1086#1075#1086' '#1086#1092#1110#1089#1085#1086#1102' '#1040#1058#1057
    ParentShowHint = False
    ShowHint = True
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Width = 81
  end
  object Memo: TcxMemo
    Left = 72
    Top = 191
    Lines.Strings = (
      '')
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 5
    Height = 41
    Width = 321
  end
  object IsEnabledCheckBox: TcxCheckBox
    Left = 4
    Top = 165
    Caption = #1044#1086#1079#1074#1086#1083#1103#1108#1090#1100#1089#1103' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1087#1088#1080' '#1088#1086#1079#1089#1080#1083#1094#1110
    Properties.OnChange = IsEnabledCheckBoxPropertiesChange
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Width = 277
  end
  object IsEnabled2CheckBox: TcxCheckBox
    Left = 4
    Top = 235
    Caption = #1055#1072#1088#1090#1085#1077#1088' '#1079#1075#1110#1076#1085#1080#1081' '#1085#1072' '#1088#1086#1079#1089#1080#1083#1082#1091
    Properties.OnChange = IsEnabled2CheckBoxPropertiesChange
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    Width = 253
  end
  object PbxSpeedCodeDBEdit: TcxTextEdit
    Left = 245
    Top = 136
    Hint = '|'#1047#1072#1087#1088#1086#1075#1088#1072#1084#1086#1074#1072#1085#1080#1081' '#1074' '#1086#1092#1110#1089#1085#1110#1081' '#1040#1058#1057' '#1085#1086#1084#1077#1088' '#1096#1074#1080#1076#1082#1086#1075#1086' '#1085#1072#1073#1086#1088#1091
    ParentShowHint = False
    ShowHint = True
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 8
    Width = 81
  end
  object CntryText: TStaticText
    Left = 232
    Top = 19
    Width = 53
    Height = 17
    Caption = 'CntryText'
    TabOrder = 9
  end
  object AreaText: TStaticText
    Left = 232
    Top = 44
    Width = 49
    Height = 17
    Caption = 'AreaText'
    TabOrder = 10
  end
  object GroupBoxUseAs: TcxGroupBox
    Left = 232
    Top = 59
    Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103' '#1103#1082':'
    TabOrder = 11
    Height = 68
    Width = 161
    object IsPhoneDBCheckBox: TcxCheckBox
      Left = 9
      Top = 16
      Caption = #1058#1077#1083#1077#1092#1086#1085
      Properties.OnChange = IsEnabledCheckBoxPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 69
    end
    object IsFaxDBCheckBox: TcxCheckBox
      Left = 9
      Top = 32
      Hint = '|'#1053#1086#1084#1077#1088' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103' '#1076#1083#1103' '#1087#1088#1080#1081#1086#1084#1091' '#1092#1072#1082#1089#1110#1074
      Caption = #1060#1072#1082#1089
      ParentShowHint = False
      Properties.OnChange = IsEnabledCheckBoxPropertiesChange
      ShowHint = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 69
    end
    object IsRedPhnDBCheckBox: TcxCheckBox
      Left = 9
      Top = 48
      Hint = '|'#1053#1086#1084#1077#1088' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103' '#1103#1082' '#1095#1077#1088#1075#1086#1074#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
      Caption = #1063#1077#1088#1075#1086#1074#1080#1081' '#1090#1077#1083#1077#1092#1086#1085
      ParentShowHint = False
      Properties.OnChange = IsEnabledCheckBoxPropertiesChange
      ShowHint = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 125
    end
    object IsDefFaxDBCheckBox: TcxCheckBox
      Left = 78
      Top = 32
      Hint = '|'#1053#1086#1084#1077#1088' '#1108' '#1086#1089#1085#1086#1074#1085#1080#1084' '#1085#1086#1084#1077#1088#1086#1084' '#1092#1072#1082#1089#1091' '#1086#1092#1110#1089#1091
      Caption = #1054#1089#1085#1086#1074#1085#1080#1081
      ParentShowHint = False
      Properties.OnChange = IsEnabledCheckBoxPropertiesChange
      ShowHint = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 75
    end
    object IsDefPhnDBCheckBox: TcxCheckBox
      Left = 78
      Top = 16
      Hint = '|'#1053#1086#1084#1077#1088' '#1108' '#1086#1089#1085#1086#1074#1085#1080#1084' '#1085#1086#1084#1077#1088#1086#1084' '#1090#1077#1083#1077#1092#1086#1085#1091' '#1086#1092#1110#1089#1091
      Caption = #1054#1089#1085#1086#1074#1085#1080#1081
      ParentShowHint = False
      Properties.OnChange = IsEnabledCheckBoxPropertiesChange
      ShowHint = True
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 75
    end
  end
end
