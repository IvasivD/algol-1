object FormGtranslater: TFormGtranslater
  Left = 524
  Top = 120
  Width = 881
  Height = 694
  Caption = 'Google translater '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 54
    Width = 865
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 865
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 28
      Width = 865
      Height = 26
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 162
        Top = 6
        Width = 62
        Height = 13
        Caption = 'To Language'
      end
      object Label2: TLabel
        Left = 8
        Top = 6
        Width = 74
        Height = 13
        Caption = 'From Language'
      end
      object butTranslate: TButton
        Left = 320
        Top = 3
        Width = 72
        Height = 20
        Caption = 'Translate'
        TabOrder = 0
        OnClick = butTranslateClick
      end
      object EditLngTo: TEdit
        Left = 234
        Top = 2
        Width = 64
        Height = 21
        TabOrder = 1
        Text = 'ua'
      end
      object EditLngFrom: TEdit
        Left = 88
        Top = 1
        Width = 64
        Height = 21
        TabOrder = 2
        Text = 'auto'
      end
    end
    object MemTextFrom: TMemo
      Left = 0
      Top = 0
      Width = 865
      Height = 28
      Align = alTop
      Lines.Strings = (
        'Vienna')
      TabOrder = 1
    end
  end
  object PageControlTransl: TcxPageControl
    Left = 0
    Top = 57
    Width = 865
    Height = 599
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = TabChrome
    ClientRectBottom = 595
    ClientRectLeft = 4
    ClientRectRight = 861
    ClientRectTop = 24
    object TabChrome: TcxTabSheet
      Caption = 'TabChrome'
      ImageIndex = 0
      object Chromium: TChromium
        Left = 0
        Top = 25
        Width = 857
        Height = 546
        Align = alClient
        DefaultUrl = 'about:blank'
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 857
        Height = 25
        Align = alTop
        TabOrder = 1
        object Edit2: TEdit
          Left = 8
          Top = 0
          Width = 649
          Height = 21
          TabOrder = 0
        end
        object Button2: TButton
          Left = 664
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 744
          Top = 0
          Width = 33
          Height = 25
          Caption = 'Send'
          TabOrder = 2
          OnClick = Button3Click
        end
      end
    end
    object TabIE: TcxTabSheet
      Caption = 'TabIE'
      ImageIndex = 1
      object WebBrowser: TWebBrowser
        Left = 0
        Top = 25
        Width = 857
        Height = 546
        Align = alClient
        TabOrder = 0
        ControlData = {
          4C00000066590000E93D00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E12620A000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 857
        Height = 25
        Align = alTop
        TabOrder = 1
        object Edit1: TEdit
          Left = 8
          Top = 0
          Width = 649
          Height = 21
          TabOrder = 0
        end
        object Button1: TButton
          Left = 664
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
  end
  object TimerAutoRun: TTimer
    Enabled = False
    OnTimer = TimerAutoRunTimer
    Left = 632
    Top = 208
  end
end
