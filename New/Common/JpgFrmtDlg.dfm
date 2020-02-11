object JpegImageFormatDlg: TJpegImageFormatDlg
  Left = 517
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' '#1092#1086#1088#1084#1072#1090#1091' JPEG'
  ClientHeight = 321
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  DesignSize = (
    451
    321)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 435
    Height = 153
    Anchors = [akLeft, akTop, akRight]
    Caption = #1071#1082#1110#1089#1090#1100' '#1079#1086#1073#1088#1072#1078#1077#1085#1085#1103
    TabOrder = 0
    DesignSize = (
      435
      153)
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 72
      Height = 13
      Caption = #1053#1080#1079#1100#1082#1072' '#1103#1082#1110#1089#1090#1100
    end
    object Label3: TLabel
      Left = 347
      Top = 24
      Width = 71
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1042#1080#1089#1086#1082#1072' '#1103#1082#1110#1089#1090#1100
    end
    object Label4: TLabel
      Left = 16
      Top = 80
      Width = 91
      Height = 13
      Caption = '('#1053#1077#1074#1077#1083#1080#1082#1080#1081' '#1092#1072#1081#1083')'
    end
    object Label5: TLabel
      Left = 340
      Top = 80
      Width = 78
      Height = 13
      Anchors = [akTop, akRight]
      Caption = '('#1042#1077#1083#1080#1082#1080#1081' '#1092#1072#1081#1083')'
    end
    object Label6: TLabel
      Left = 26
      Top = 104
      Width = 394
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        #1047#1073#1110#1083#1100#1096#1077#1085#1085#1103' '#1103#1082#1086#1089#1090#1110' '#1087#1088#1080#1079#1074#1086#1076#1080#1090#1100' '#1076#1086' '#1079#1073#1110#1083#1100#1096#1077#1085#1085#1103' '#1088#1086#1079#1084#1110#1088#1091' '#1092#1072#1081#1083#1091' '#1110' '#1079#1073#1110#1083#1100 +
        #1096#1077#1085#1085#1103' '#1095#1072#1089#1091' '#1079#1072#1074#1072#1085#1090#1072#1078#1077#1085#1085#1103' '#1079#1086#1073#1088#1072#1078#1077#1085#1085#1103', '#1097#1086' '#1084#1072#1108' '#1089#1091#1090#1090#1108#1074#1077' '#1079#1085#1072#1095#1077#1085#1085#1103' '#1087#1088#1080' ' +
        #1087#1077#1088#1077#1075#1083#1103#1076#1110' '#1079#1086#1073#1088#1072#1078#1077#1085#1085#1103' '#1074' '#1092#1086#1088#1084#1072#1090#1110' JPEG '#1079' Internet'
      WordWrap = True
    end
    object QualityTrackBar: TTrackBar
      Left = 16
      Top = 40
      Width = 404
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      Max = 100
      Frequency = 10
      Position = 100
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 184
    Width = 435
    Height = 89
    Anchors = [akLeft, akTop, akRight]
    Caption = #1042#1110#1076#1090#1074#1086#1088#1077#1085#1085#1103
    TabOrder = 1
    DesignSize = (
      435
      89)
    object Label1: TLabel
      Left = 26
      Top = 48
      Width = 394
      Height = 33
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 
        #1044#1086#1079#1074#1086#1083#1103#1108' '#1074#1080#1074#1086#1076#1080#1090#1080' '#1079#1086#1073#1088#1072#1078#1077#1085#1085#1103' '#1087#1086#1074#1085#1110#1089#1090#1102' '#1079' '#1087#1086#1089#1090#1091#1087#1086#1074#1080#1084' '#1079#1073#1110#1083#1100#1096#1077#1085#1085#1103#1084' '#1095 +
        #1110#1090#1082#1086#1089#1090#1110' '#1087#1086' '#1084#1110#1088#1110' '#1079#1072#1074#1072#1085#1090#1072#1078#1077#1085#1085#1103' '#1087#1088#1086#1075#1088#1072#1084#1086#1102' '#1087#1077#1088#1077#1075#1083#1103#1076#1091
      WordWrap = True
    end
    object ProgressiveEncodingCheckBox: TCheckBox
      Left = 8
      Top = 24
      Width = 145
      Height = 17
      Caption = #1055#1088#1086#1075#1088#1077#1089#1080#1074#1085#1072' '#1088#1086#1079#1075#1086#1088#1090#1082#1072
      TabOrder = 0
    end
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 288
    Width = 451
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      451
      33)
    object OkBtn: TBitBtn
      Left = 274
      Top = 4
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 363
      Top = 4
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
