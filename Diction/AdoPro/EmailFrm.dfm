object EmailAddressEditFrm: TEmailAddressEditFrm
  Left = 790
  Top = 194
  Width = 393
  Height = 414
  Caption = #1040#1076#1088#1077#1089#1072' E-mail'
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
  object ModalPanel: TPanel
    Left = 0
    Top = 343
    Width = 377
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      377
      33)
    object OkBtn: TBitBtn
      Left = 205
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 295
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object WorkPanel: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 343
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      377
      343)
    object Label1: TLabel
      Left = 8
      Top = 20
      Width = 137
      Height = 13
      Caption = #1040#1076#1088#1077#1089#1072' '#1077#1083#1077#1082#1090#1088#1086#1085#1085#1086#1111' '#1087#1086#1096#1090#1080
    end
    object Label2: TLabel
      Left = 8
      Top = 52
      Width = 114
      Height = 13
      Caption = #1053#1072#1079#1074#1072' '#1074' '#1072#1076#1088#1077#1089#1085#1110#1081' '#1082#1085#1080#1079#1110
    end
    object Bevel1: TBevel
      Left = 8
      Top = 244
      Width = 361
      Height = 8
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object LabelMemo: TLabel
      Left = 30
      Top = 268
      Width = 36
      Height = 13
      Caption = #1063#1086#1084#1091' '#1085#1110
      Enabled = False
    end
    object OfficeGroupBox: TGroupBox
      Left = 8
      Top = 88
      Width = 361
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103
      TabOrder = 0
      object OfficeRadioButton2: TcxRadioButton
        Left = 8
        Top = 24
        Width = 132
        Height = 17
        Caption = #1042' '#1084#1077#1078#1072#1093' '#1094#1110#1083#1086#1111' '#1092#1110#1088#1084#1080
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = OfficeRadioButton2Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object OfficeRadioButton1: TcxRadioButton
        Left = 8
        Top = 48
        Width = 153
        Height = 17
        Caption = #1042' '#1084#1077#1078#1072#1093' '#1086#1076#1085#1086#1075#1086' '#1086#1092#1110#1089#1091':'
        TabOrder = 1
        OnClick = OfficeRadioButton2Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object OfficeComboBox: TcxExtLookupComboBox
        Left = 16
        Top = 68
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
        Width = 335
      end
    end
    object EmailEdit: TcxTextEdit
      Left = 152
      Top = 16
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
      Width = 217
    end
    object AliasEdit: TcxTextEdit
      Left = 152
      Top = 48
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
      Width = 217
    end
    object IsDefaultCheckBox: TcxCheckBox
      Left = 4
      Top = 197
      Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1103#1082' '#1086#1089#1085#1086#1074#1085#1091' '#1072#1076#1088#1077#1089#1091
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 253
    end
    object IsEnabledCheckBox: TcxCheckBox
      Left = 4
      Top = 245
      Caption = #1044#1086#1079#1074#1086#1083#1103#1108#1090#1100#1089#1103' '#1074#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1074#1072#1090#1080' '#1087#1088#1080' '#1088#1086#1079#1089#1080#1083#1094#1110
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      OnClick = OfficeRadioButton2Click
      Width = 277
    end
    object IsEnabled2CheckBox: TcxCheckBox
      Left = 4
      Top = 317
      Caption = #1055#1072#1088#1090#1085#1077#1088' '#1079#1075#1110#1076#1085#1080#1081' '#1085#1072' '#1088#1086#1079#1089#1080#1083#1082#1091
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Width = 253
    end
    object Memo: TcxMemo
      Left = 72
      Top = 270
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
      TabOrder = 6
      Height = 41
      Width = 296
    end
  end
end
