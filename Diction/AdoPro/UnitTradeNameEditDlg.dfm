object FrmTradeNameEditDlg: TFrmTradeNameEditDlg
  Left = 805
  Top = 207
  BorderStyle = bsDialog
  Caption = #1050#1086#1084#1077#1088#1094#1110#1081#1085#1072' '#1085#1072#1079#1074#1072
  ClientHeight = 209
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClick = SelImageBtnClick
  DesignSize = (
    289
    209)
  PixelsPerInch = 96
  TextHeight = 13
  object NewTradeLabel: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    Caption = #1050#1086#1084#1077#1088#1094#1110#1081#1085#1072' '#1085#1072#1079#1074#1072
  end
  object Agencylogo: TImage
    Left = 8
    Top = 49
    Width = 16
    Height = 16
    Transparent = True
  end
  object SelImageBtn: TSpeedButton
    Left = 32
    Top = 46
    Width = 105
    Height = 22
    Caption = #1042#1080#1073#1088#1072#1090#1080' '#1083#1086#1075#1086#1090#1080#1087
    Flat = True
    OnClick = SelImageBtnClick
  end
  object EMailLabel: TLabel
    Left = 9
    Top = 132
    Width = 251
    Height = 13
    Caption = 'Email '#1094#1077#1085#1090#1088#1072#1083#1100#1085#1086#1075#1086' '#1086#1092#1110#1089#1091' '#1076#1083#1103' '#1074#1110#1076#1087#1088#1072#1074#1082#1080' '#1088#1072#1093#1091#1085#1082#1110#1074
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 176
    Width = 289
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      289
      33)
    object OkBtn: TBitBtn
      Left = 109
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 199
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object PeymenRadioGroup: TRadioGroup
    Left = 9
    Top = 72
    Width = 265
    Height = 56
    Caption = #1060#1110#1085#1072#1085#1089#1086#1074#1110' '#1088#1086#1079#1088#1072#1093#1091#1085#1082#1080' '#1087#1088#1086#1074#1086#1076#1103#1090#1100#1089#1103':'
    Items.Strings = (
      #1079' '#1094#1077#1085#1090#1088#1072#1083#1100#1085#1080#1084' '#1086#1092#1110#1089#1086#1084
      #1079' '#1072#1075#1077#1085#1094#1110#1108#1102)
    TabOrder = 1
  end
  object BillCheckBox: TCheckBox
    Left = 166
    Top = 84
    Width = 94
    Height = 24
    Caption = #1053#1077' '#1074#1082#1083#1102#1095#1072#1090#1080' '#1072#1075#1077#1085#1090#1072' '#1074' '#1088#1072#1093'.'
    TabOrder = 2
    WordWrap = True
  end
  object TradeNameEdit: TcxTextEdit
    Left = 8
    Top = 25
    Anchors = [akLeft, akTop, akRight]
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.Color = clInfoBk
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Width = 270
  end
  object EMailComboBox: TcxExtLookupComboBox
    Left = 9
    Top = 147
    Properties.DropDownAutoSize = True
    Properties.DropDownRows = 24
    Properties.DropDownSizeable = True
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
    Width = 265
  end
end
