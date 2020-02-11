object DesctiptEditForm: TDesctiptEditForm
  Left = 535
  Top = 250
  Width = 967
  Height = 623
  Caption = #1054#1087#1080#1089' '#1077#1083#1077#1084#1077#1085#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object DescriptEdit: TcxMemo
    Left = 0
    Top = 125
    Align = alBottom
    Style.BorderStyle = ebs3D
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    OnExit = DescriptEditExit
    Height = 460
    Width = 951
  end
  object LanguageGrid: TcxGrid
    Left = 0
    Top = 4
    Width = 250
    Height = 86
    TabOrder = 2
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    object LanguageGridLevel1: TcxGridLevel
    end
  end
  object ShowWebCheckBox: TcxCheckBox
    Left = 257
    Top = 4
    Caption = #1042#1110#1076#1086#1073#1088#1072#1078#1072#1090#1080' '#1085#1072' '#1089#1072#1081#1090#1110
    Properties.NullStyle = nssUnchecked
    Properties.ValueChecked = 'T'
    Properties.ValueUnchecked = 'F'
    State = cbsGrayed
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 132
  end
end
