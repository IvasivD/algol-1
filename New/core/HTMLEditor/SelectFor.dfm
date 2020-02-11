object FrmSelectFor: TFrmSelectFor
  Left = 969
  Top = 128
  Width = 242
  Height = 259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object cxRGroupSelect: TcxRadioGroup
    Left = 0
    Top = 0
    Align = alClient
    Properties.Items = <>
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Height = 149
    Width = 226
  end
  object PanBottom: TPanel
    Left = 0
    Top = 189
    Width = 226
    Height = 32
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      226
      32)
    object SbtOk: TSpeedButton
      Left = 49
      Top = 5
      Width = 81
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = 'Ok'
      OnClick = SbtOkClick
    end
    object SbtCancel: TSpeedButton
      Left = 137
      Top = 5
      Width = 81
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      OnClick = SbtCancelClick
    end
  end
  object BoxEditLng: TGroupBox
    Left = 0
    Top = 149
    Width = 226
    Height = 40
    Align = alBottom
    Caption = #1055#1088#1086#1074#1086#1076#1080#1090#1080' '#1079#1084#1110#1085#1080' '#1074' '#1088#1072#1084#1082#1072#1093':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object RbtBlockLng: TcxRadioButton
      Left = 8
      Top = 18
      Width = 97
      Height = 17
      Caption = #1073#1083#1086#1082#1091' '#1083#1077#1085#1075#1074#1110#1095
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TabStop = True
      LookAndFeel.NativeStyle = True
    end
    object RbtSelLng: TcxRadioButton
      Left = 112
      Top = 18
      Width = 105
      Height = 17
      Caption = #1074#1080#1073#1088#1072#1085#1086#1111' '#1084#1086#1074#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      LookAndFeel.NativeStyle = True
    end
  end
end
