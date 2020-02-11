inherited PrinterSelectDlg: TPrinterSelectDlg
  Left = 815
  Top = 406
  Caption = #1042#1080#1073#1110#1088' '#1087#1088#1080#1085#1090#1077#1088#1072
  ClientHeight = 92
  ClientWidth = 381
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object PrinterLabel: TLabel [0]
    Left = 8
    Top = 20
    Width = 95
    Height = 13
    Hint = #1055#1088#1080#1085#1090#1077#1088' '#1076#1083#1103' '#1076#1088#1091#1082#1091' '#1087#1086#1083#1110#1089#1091
    Caption = #1055#1088#1080#1085#1090#1077#1088' '#1076#1083#1103' '#1076#1088#1091#1082#1091
  end
  inherited CtrlPanel: TPanel
    Top = 59
    Width = 381
    inherited OkBtn: TBitBtn
      Left = 201
    end
    inherited CancelBtn: TBitBtn
      Left = 291
    end
  end
  object PrinterComboBox: TComboBox
    Left = 116
    Top = 16
    Width = 257
    Height = 21
    Hint = #1055#1088#1080#1085#1090#1077#1088' '#1076#1083#1103' '#1076#1088#1091#1082#1091' '#1087#1086#1083#1110#1089#1091
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    ItemHeight = 13
    TabOrder = 1
  end
end
