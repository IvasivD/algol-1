object FrmCountryCityEdit: TFrmCountryCityEdit
  Left = 386
  Top = 182
  Width = 1176
  Height = 675
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1082#1088#1072#1111#1085
  Color = clBtnFace
  Constraints.MinHeight = 675
  Constraints.MinWidth = 922
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ModalPanel: TPanel
    Left = 0
    Top = 603
    Width = 1160
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    DesignSize = (
      1160
      34)
    object OkBtn: TBitBtn
      Left = 988
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 1078
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 311
    Height = 484
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    inline FrameDicBrCountry: TFrameDic
      Left = 0
      Top = 0
      Width = 311
      Height = 484
      Align = alClient
      TabOrder = 0
      inherited PanelMain: TPanel
        Width = 311
        Height = 484
        inherited SplitterBrowserHTML: TSplitter
          Top = 413
          Width = 311
        end
        inherited PanelGrid: TPanel
          Width = 311
          Height = 389
          inherited PanelImage: TPanel
            Left = 134
            Height = 389
            inherited ImagePrew: TcxImage
              Height = 389
            end
          end
          inherited PageControlData: TcxPageControl
            Width = 134
            Height = 389
            ClientRectBottom = 389
            ClientRectRight = 134
            inherited TabView: TcxTabSheet
              inherited GridMain: TcxGrid
                Width = 134
                Height = 365
              end
            end
            inherited TabTree: TcxTabSheet
              inherited DBTreeList: TcxDBTreeList
                Width = 134
                Height = 365
              end
            end
          end
        end
        inherited PanelDescription: TPanel
          Top = 416
          Width = 311
          inherited PageDesription: TcxPageControl
            Width = 311
            ClientRectRight = 307
            inherited TabHtmlDescript: TcxTabSheet
              inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                Width = 303
                inherited PanelDescriptHTML: TPanel
                  Width = 303
                  inherited PanelTop: TPanel
                    Width = 303
                    inherited Panel1: TPanel
                      Left = 154
                    end
                  end
                  inherited WebBrowserDicDesctript: TChromium
                    Width = 303
                  end
                end
              end
            end
          end
        end
        inherited PanelButton: TPanel
          Width = 311
          inherited PanelSearchText: TPanel
            Width = 59
            inherited PanelButSearch: TPanel
              Left = 35
            end
            inherited PanelTextSearch: TPanel
              Width = 35
              DesignSize = (
                35
                24)
              inherited EdSearch: TcxTextEdit
                Width = 29
              end
            end
          end
        end
      end
    end
  end
  object PanCountryDetail: TPanel
    Left = 0
    Top = 484
    Width = 1160
    Height = 119
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      1160
      119)
    object CapitalLabel: TLabel
      Left = 61
      Top = 55
      Width = 42
      Height = 13
      Caption = #1057#1090#1086#1083#1080#1094#1103
    end
    object TimeBiasLabel: TLabel
      Left = 250
      Top = 55
      Width = 70
      Height = 13
      Caption = #1056#1110#1079#1085#1080#1094#1103' '#1074' '#1095#1072#1089#1110
    end
    object CurrencyLabel: TLabel
      Left = 14
      Top = 81
      Width = 89
      Height = 13
      Caption = #1043#1088#1086#1096#1086#1074#1072' '#1086#1076#1080#1085#1080#1094#1103
    end
    object CurrencyShortLabel: TLabel
      Left = 44
      Top = 96
      Width = 59
      Height = 13
      Caption = #1087#1086#1079#1085#1072#1095#1077#1085#1085#1103
    end
    object Shape1: TShape
      Left = 1110
      Top = 34
      Width = 41
      Height = 25
      Anchors = [akTop, akRight]
      Shape = stEllipse
    end
    object TouristTemplateBtn: TSpeedButton
      Left = 1073
      Top = 4
      Width = 79
      Height = 22
      Anchors = [akTop, akRight]
      Caption = #1040#1085#1082#1077#1090#1072
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007777777777777777700000007777777774F77777700000007777
        7777444F77777000000077777774444F777770000000700000444F44F7777000
        000070FFF444F0744F777000000070F8884FF0774F777000000070FFFFFFF077
        74F77000000070F88888F077774F7000000070FFFFFFF0777774F000000070F8
        8777F07777774000000070FFFF00007777777000000070F88707077777777000
        000070FFFF007777777770000000700000077777777770000000777777777777
        777770000000}
      Visible = False
      OnClick = TouristTemplateBtnClick
    end
    object LocaleTimeLabel: TLabel
      Left = 352
      Top = 55
      Width = 81
      Height = 13
      Caption = 'LocaleTimeLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object URLBtn: TSpeedButton
      Left = 351
      Top = 96
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000000000
        0000000000001F7C1F7C1F7C1F7C1F7C000000000000FF03FF03FF03FF03FF03
        FF03FF0300001F7C1F7C1F7C00000000100010000000FF03FF03FF03FF03FF03
        FF03FF0300001F7C1F7C00001F001F001F0000020000FF03FF03FF03FF03FF03
        FF03FF0300001F7C000000021F001F00000200020000FF03FF03FF03FF03FF03
        FF03FF0300001F7C000000021F001F00000200020000FF03FF03FF03FF03FF03
        FF03FF030000000000021F001F001F00000200020000FF03FF03FF03FF03FF03
        FF03FF030000000000021F001F001F00000200020000FF03FF03FF03FF03FF03
        FF03FF03000000001F001F7C1F001F00000200020000104210421042FF03FF03
        FF03FF03000000001F7C1F001F00000200021F001F000000FF031042FF03FF03
        FF03FF03000000001F001F7C1F001F001F001F001F001F0000001042FF03FF03
        FF03FF0300001F7C00001F00000200021F001F001F0000021F00000000000000
        0000000000001F7C00001F7C1F00000200020002000200020002000200020002
        00001F7C1F7C1F7C1F7C00001F7C1F001F7C000200020002000200021F000000
        1F7C1F7C1F7C1F7C1F7C1F7C000000001F001F7C1F001F001F00000000001F7C
        1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C000000000000000000001F7C1F7C1F7C
        1F7C1F7C1F7C}
    end
    object Label5: TLabel
      Left = 20
      Top = 34
      Width = 84
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085#1085#1080#1081' '#1082#1086#1076
    end
    object ImgFlag: TImage
      Left = 1035
      Top = 65
      Width = 76
      Height = 50
      Anchors = [akTop, akRight]
      Proportional = True
      Stretch = True
      Transparent = True
    end
    object ImgGerb: TImage
      Left = 1113
      Top = 65
      Width = 37
      Height = 50
      Anchors = [akTop, akRight]
      Proportional = True
      Stretch = True
      Transparent = True
    end
    object LbShortSign: TLabel
      Left = 1102
      Top = 40
      Width = 59
      Height = 13
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'ShortSign'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object EdCountryName: TcxTextEdit
      Left = 10
      Top = 6
      Style.BorderStyle = ebsNone
      Style.Color = clMenu
      TabOrder = 0
      Text = 'Name'
      Width = 189
    end
    object EdPhoneCode: TcxTextEdit
      Left = 117
      Top = 31
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.Color = clWhite
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Text = 'PhoneCode'
      Width = 65
    end
    object EdCapital: TcxTextEdit
      Left = 117
      Top = 52
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.Color = clWhite
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Text = 'EdCapital'
      Width = 68
    end
    object EdCurrency: TcxTextEdit
      Left = 117
      Top = 78
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.Color = clWhite
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Text = 'Currency'
      Width = 316
    end
    object EdCurrencyShort: TcxTextEdit
      Left = 117
      Top = 93
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.Color = clWhite
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Text = 'ShortCurrency'
      Width = 84
    end
    object EdFullName: TcxTextEdit
      Left = 202
      Top = 6
      Enabled = False
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.Color = clBtnFace
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.Color = clWhite
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Text = 'FullName'
      Width = 95
    end
    object EdTimeDifference: TcxTextEdit
      Left = 319
      Top = 52
      Enabled = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.TextColor = clBlack
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.Color = clWhite
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Text = 'TBias'
      Width = 35
    end
  end
  object PanelCity: TPanel
    Left = 311
    Top = 0
    Width = 849
    Height = 484
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter1: TSplitter
      Left = 0
      Top = 213
      Width = 849
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object Panel1: TPanel
      Left = 0
      Top = 216
      Width = 849
      Height = 268
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      inline FrameDicListCity: TFrameDic
        Left = 0
        Top = 0
        Width = 849
        Height = 268
        Align = alClient
        TabOrder = 0
        inherited PanelMain: TPanel
          Width = 849
          Height = 268
          inherited SplitterBrowserHTML: TSplitter
            Top = 197
            Width = 849
          end
          inherited PanelGrid: TPanel
            Width = 849
            Height = 173
            inherited PanelImage: TPanel
              Left = 672
              Height = 173
              inherited ImagePrew: TcxImage
                Height = 173
              end
            end
            inherited PageControlData: TcxPageControl
              Width = 672
              Height = 173
              ClientRectBottom = 173
              ClientRectRight = 672
              inherited TabView: TcxTabSheet
                inherited GridMain: TcxGrid
                  Width = 672
                  Height = 149
                end
              end
              inherited TabTree: TcxTabSheet
                inherited DBTreeList: TcxDBTreeList
                  Width = 672
                  Height = 149
                end
              end
            end
          end
          inherited PanelDescription: TPanel
            Top = 200
            Width = 849
            inherited PageDesription: TcxPageControl
              Width = 849
              ClientRectRight = 845
              inherited TabHtmlDescript: TcxTabSheet
                inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                  Width = 841
                  inherited PanelDescriptHTML: TPanel
                    Width = 841
                    inherited PanelTop: TPanel
                      Width = 841
                      inherited Panel1: TPanel
                        Left = 692
                      end
                    end
                    inherited WebBrowserDicDesctript: TChromium
                      Width = 841
                    end
                  end
                end
              end
            end
          end
          inherited PanelButton: TPanel
            Width = 849
            inherited PanelSearchText: TPanel
              Width = 597
              inherited PanelButSearch: TPanel
                Left = 573
              end
              inherited PanelTextSearch: TPanel
                Width = 573
                DesignSize = (
                  573
                  24)
                inherited EdSearch: TcxTextEdit
                  Properties.OnChange = nil
                  Width = 567
                end
              end
            end
          end
        end
      end
    end
    inline FrameDicCityCountry: TFrameDicCity
      Left = 0
      Top = 0
      Width = 849
      Height = 213
      Align = alClient
      TabOrder = 1
      inherited Panel3: TPanel
        Width = 849
        Height = 213
        inherited PanelRegion: TPanel
          Width = 849
          Height = 213
          inherited DBTreeListRegion: TcxDBTreeList
            Width = 849
            Height = 189
          end
          inherited PanelTopCityRegion: TPanel
            Width = 849
            inherited Panel5: TPanel
              Width = 672
              inherited FrameSearchCity: TFrameSearchCity
                Width = 672
                inherited EdSearchCity: TcxTextEdit
                  Width = 624
                end
                inherited PanelControl: TPanel
                  Left = 625
                end
              end
            end
          end
        end
      end
    end
  end
  object TimerShowCountryTime: TTimer
    OnTimer = TimerShowCountryTimeTimer
    Left = 497
    Top = 520
  end
  object PMSelectKindTranslateSity: TPopupMenu
    Left = 481
    Top = 328
    object butKndSelectCityTranslateAll: TMenuItem
      Caption = #1042#1089#1110
      ImageIndex = 125
    end
    object butKndSelectCityTranslateByFilter: TMenuItem
      Caption = #1055#1086' '#1060#1110#1083#1100#1090#1088#1091
      ImageIndex = 92
    end
  end
end
