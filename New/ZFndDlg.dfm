object ZFindDialog: TZFindDialog
  Left = 740
  Top = 470
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1055#1086#1096#1091#1082
  ClientHeight = 266
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    341
    266)
  PixelsPerInch = 96
  TextHeight = 13
  object PromptLabel: TLabel
    Left = 8
    Top = 72
    Width = 90
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
  end
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 65
    Height = 13
    Caption = #1055#1086#1096#1091#1082' '#1074' '#1087#1086#1083#1110
  end
  object TextComboBox: TComboBox
    Left = 8
    Top = 88
    Width = 325
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    ItemHeight = 13
    TabOrder = 0
    OnChange = TextComboBoxChange
    OnExit = TextComboBoxExit
  end
  object OptionRadioGroup: TRadioGroup
    Left = 8
    Top = 120
    Width = 157
    Height = 105
    Anchors = [akLeft, akTop, akRight]
    ItemIndex = 2
    Items.Strings = (
      #1057#1087#1110#1074#1087#1072#1076#1072#1108' '#1087#1086#1074#1085#1110#1089#1090#1102
      #1055#1086#1095#1080#1085#1072#1108#1090#1100#1089#1103' '#1079
      #1052#1110#1089#1090#1080#1090#1100
      #1047#1072#1082#1110#1085#1095#1091#1108#1090#1100#1089#1103)
    TabOrder = 1
    OnClick = TextComboBoxChange
  end
  object CaseSensityCheckBox: TCheckBox
    Left = 196
    Top = 124
    Width = 137
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1053#1077#1079#1072#1083#1077#1078#1085#1086' '#1074#1110#1076' '#1088#1077#1108#1089#1090#1088#1091
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = TextComboBoxChange
  end
  object FieldComboBox: TComboBox
    Left = 8
    Top = 32
    Width = 325
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    ItemHeight = 13
    TabOrder = 6
    OnChange = TextComboBoxChange
    OnExit = TextComboBoxExit
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 233
    Width = 341
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      341
      33)
    object CloseBtn: TBitBtn
      Left = 251
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 1
      Kind = bkCancel
    end
    object OkBtn: TBitBtn
      Left = 161
      Top = 5
      Width = 82
      Height = 25
      Enabled = False
      TabOrder = 0
      Kind = bkOK
    end
  end
  object FindNextBtn: TBitBtn
    Tag = 1
    Left = 251
    Top = 200
    Width = 82
    Height = 25
    Caption = #1047#1085#1072#1081#1090#1080' '#1097#1077
    Enabled = False
    TabOrder = 4
    OnClick = FindNextBtnClick
  end
  object FindBtn: TBitBtn
    Left = 251
    Top = 168
    Width = 82
    Height = 25
    Caption = #1047#1085#1072#1081#1090#1080
    Default = True
    Enabled = False
    TabOrder = 3
    OnClick = FindBtnClick
    Glyph.Data = {
      42010000424D4201000000000000760000002800000011000000110000000100
      040000000000CC00000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
      DDDDD0000000DDDDD000DDDDD000D0000000DDDDD070DDDDD070D0000000DDDD
      D0008DDD8000D0000000DDDDD00000000000D0000000D444407000070000D000
      0000D4FFF07000070000D0000000D4F8800000000000D0000000D4FFFF000070
      000DD0000000D4F88F80088F00DDD0000000D4FFFFF00FFF00DDD0000000D4F8
      8F80088F00DDD0000000D4FFFFFFFFFF4DDDD0000000D444444444444DDDD000
      0000D474474474474DDDD0000000D444444444444DDDD0000000DDDDDDDDDDDD
      DDDDD0000000}
  end
end
