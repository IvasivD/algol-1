object SetPayServDlg: TSetPayServDlg
  Left = 681
  Top = 276
  Width = 209
  Height = 144
  Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1087#1086#1089#1083#1091#1075
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object PartnerLabel: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = 'PartnerLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 26
    Width = 123
    Height = 13
    Caption = #1042#1082#1072#1078#1110#1090#1100' '#1074#1072#1088#1090#1110#1089#1090#1100' '#1087#1086#1089#1083#1091#1075
  end
  object PayEdit: TAzEdit
    Left = 8
    Top = 45
    Width = 57
    Height = 21
    TabOrder = 0
    Text = '0'
    OnExit = PayEditExit
    OnKeyPress = PayEditKeyPress
  end
  object CurrComboBox: TAzComboBox
    Left = 72
    Top = 45
    Width = 81
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      #1043#1088#1085
      #1028#1074#1088#1086)
  end
end
