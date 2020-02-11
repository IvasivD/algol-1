object FrmMain: TFrmMain
  Left = 2538
  Top = 207
  Width = 1089
  Height = 675
  Caption = #1055#1072#1088#1089#1077#1088' '#1082#1088#1072#1111#1085' ('#1042#1110#1082#1110#1087#1077#1076#1110#1103')'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object WebBrowser: TWebBrowser
    Left = 0
    Top = 41
    Width = 1073
    Height = 596
    Align = alClient
    TabOrder = 0
    OnDocumentComplete = WebBrowserDocumentComplete
    ControlData = {
      4C000000E66E0000993D00000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1073
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 976
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1086#1082#1072#1079#1072#1090#1080
      TabOrder = 0
      OnClick = Button1Click
    end
    object EdUrlForParse: TEdit
      Left = 8
      Top = 12
      Width = 881
      Height = 21
      TabOrder = 1
      Text = 'https://uk.wikipedia.org/wiki/'
    end
    object Button2: TButton
      Left = 896
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Run'
      TabOrder = 2
      OnClick = Button2Click
    end
  end
end
