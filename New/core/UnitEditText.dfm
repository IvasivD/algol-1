object FrmEditText: TFrmEditText
  Left = 709
  Top = 244
  Width = 446
  Height = 234
  Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object MemoText: TMemo
    Tag = -1
    Left = 0
    Top = 0
    Width = 430
    Height = 155
    Align = alClient
    Color = clInfoBk
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 155
    Width = 430
    Height = 41
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      430
      41)
    object ButOk: TBitBtn
      Left = 255
      Top = 9
      Width = 80
      Height = 25
      HelpContext = 801
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object ButCancel: TBitBtn
      Left = 340
      Top = 9
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
