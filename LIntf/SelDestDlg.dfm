inherited ReportDestinationSelectDlg: TReportDestinationSelectDlg
  Left = 685
  Top = 427
  Caption = 'ReportDestinationSelectDlg'
  ClientHeight = 201
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CtrlPanel: TPanel
    Top = 168
  end
  object DestinationRadioGroup: TRadioGroup
    Left = 8
    Top = 16
    Width = 283
    Height = 105
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1088#1080#1079#1085#1072#1095#1077#1085#1085#1103
    Items.Strings = (
      #1055#1077#1088#1077#1075#1083#1103#1076
      #1044#1088#1091#1082#1091#1074#1072#1090#1080
      #1055#1086#1089#1083#1072#1090#1080' '#1087#1086' '#1092#1072#1082#1089#1091
      #1055#1086#1089#1083#1072#1090#1080' '#1077#1083#1077#1082#1090#1088#1086#1085#1085#1086#1102' '#1087#1086#1096#1090#1086#1102)
    TabOrder = 1
  end
  object ShowMemoCheckBox: TCheckBox
    Left = 8
    Top = 136
    Width = 199
    Height = 17
    Caption = #1042#1082#1083#1102#1095#1080#1090#1080' '#1087#1088#1080#1084#1110#1090#1082#1091' '#1087#1086' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1102
    TabOrder = 2
  end
end
