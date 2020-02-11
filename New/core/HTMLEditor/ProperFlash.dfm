object Frm_ProperFlash: TFrm_ProperFlash
  Left = 661
  Top = 160
  BorderStyle = bsDialog
  Caption = #1042#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110' '#1092#1083#1077#1096
  ClientHeight = 473
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 537
    Height = 436
    ActivePage = TabProperty
    Align = alClient
    TabOrder = 0
    object TabProperty: TTabSheet
      Caption = #1042#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110
      object Label1: TLabel
        Left = 32
        Top = 146
        Width = 39
        Height = 13
        Caption = #1071#1082#1110#1089#1090#1100' :'
      end
      object Label2: TLabel
        Left = 16
        Top = 124
        Width = 33
        Height = 13
        Caption = #1060#1110#1083#1100#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 56
        Top = 131
        Width = 458
        Height = 2
      end
      object Label3: TLabel
        Left = 32
        Top = 173
        Width = 46
        Height = 13
        Caption = #1052#1072#1096#1090#1072#1073' :'
      end
      object SbtSelColorFon: TSpeedButton
        Left = 281
        Top = 195
        Width = 23
        Height = 16
        Caption = '...'
        Enabled = False
        OnClick = SbtSelColorFonClick
      end
      object Label4: TLabel
        Left = 32
        Top = 221
        Width = 77
        Height = 13
        Caption = #1042#1080#1088#1110#1074#1085#1102#1074#1072#1085#1085#1103' :'
      end
      object Label5: TLabel
        Left = 16
        Top = 244
        Width = 32
        Height = 13
        Caption = #1052#1072#1082#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel2: TBevel
        Left = 56
        Top = 251
        Width = 458
        Height = 2
      end
      object Label6: TLabel
        Left = 32
        Top = 269
        Width = 77
        Height = 13
        Caption = #1042#1080#1088#1110#1074#1085#1102#1074#1072#1085#1085#1103' :'
      end
      object Label7: TLabel
        Left = 32
        Top = 293
        Width = 89
        Height = 13
        Caption = #1058#1086#1074#1097#1080#1085#1072' '#1075#1088#1072#1085#1080#1094#1110':'
      end
      object Label8: TLabel
        Left = 324
        Top = 269
        Width = 125
        Height = 13
        Caption = #1030#1085#1090#1077#1088#1074#1072#1083' '#1087#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1110':'
      end
      object Label9: TLabel
        Left = 324
        Top = 293
        Width = 114
        Height = 13
        Caption = #1030#1085#1090#1077#1088#1074#1072#1083' '#1087#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1110':'
      end
      object Label10: TLabel
        Left = 16
        Top = 316
        Width = 35
        Height = 13
        Caption = #1056#1086#1079#1084#1110#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel3: TBevel
        Left = 56
        Top = 323
        Width = 458
        Height = 2
      end
      object LbWidth: TLabel
        Left = 248
        Top = 345
        Width = 45
        Height = 13
        Caption = #1064#1080#1088#1080#1085#1072' :'
      end
      object LbHeight: TLabel
        Left = 248
        Top = 374
        Width = 42
        Height = 13
        Caption = #1042#1080#1089#1086#1090#1072' :'
      end
      object Label14: TLabel
        Left = 10
        Top = 36
        Width = 61
        Height = 13
        Caption = 'URL-'#1072#1076#1088#1077#1089' :'
      end
      object Label16: TLabel
        Left = 16
        Top = 61
        Width = 62
        Height = 13
        Caption = #1042#1110#1076#1090#1074#1086#1088#1077#1085#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel4: TBevel
        Left = 85
        Top = 68
        Width = 427
        Height = 2
      end
      object Label13: TLabel
        Left = 10
        Top = 8
        Width = 77
        Height = 13
        Caption = #1030#1084#39#1103' - ID ( '#1083#1072#1090'. ):'
      end
      object cxChBxColorFonFlash: TcxCheckBox
        Left = 69
        Top = 192
        Caption = #1050#1086#1083#1110#1088' '#1092#1086#1085#1091' :'
        Properties.OnChange = cxChBxColorFonFlashPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 89
      end
      object PanColFonFlash: TPanel
        Left = 235
        Top = 195
        Width = 41
        Height = 16
        BiDiMode = bdLeftToRight
        Color = 15708538
        Enabled = False
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 1
      end
      object cxChBxTranspFlash: TcxCheckBox
        Left = 340
        Top = 192
        Caption = #1055#1088#1086#1079#1086#1088#1110#1089#1090#1100
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 85
      end
      object SpEdMaketThick: TcxSpinEdit
        Left = 247
        Top = 289
        Properties.MaxValue = 1000.000000000000000000
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Width = 57
      end
      object SpEdMaketIntervGorizont: TcxSpinEdit
        Left = 456
        Top = 265
        Properties.MaxValue = 1000.000000000000000000
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        Width = 57
      end
      object SpEdMaketIntervVertikal: TcxSpinEdit
        Left = 456
        Top = 291
        Properties.MaxValue = 1000.000000000000000000
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Width = 57
      end
      object cxChBxSetSize: TcxCheckBox
        Left = 28
        Top = 341
        Caption = #1047#1072#1076#1072#1090#1080' '#1088#1086#1079#1084#1110#1088
        Properties.OnEditValueChanged = cxChBxSetSizePropertiesEditValueChanged
        State = cbsChecked
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 6
        Width = 101
      end
      object EdWidth: TcxSpinEdit
        Left = 303
        Top = 341
        Properties.MaxValue = 1000.000000000000000000
        Properties.OnChange = SpEdSizeWidthPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 7
        Width = 57
      end
      object EdHeight: TcxSpinEdit
        Left = 303
        Top = 370
        Properties.MaxValue = 1000.000000000000000000
        Properties.OnChange = SpEdSizeHeightPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 8
        Width = 57
      end
      object cxChBxSaveProporc: TcxCheckBox
        Left = 28
        Top = 368
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1087#1088#1086#1087#1086#1088#1094#1110#1111
        Properties.OnEditValueChanged = cxChBxSaveProporcPropertiesEditValueChanged
        State = cbsChecked
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Width = 125
      end
      object CbxQualityFlash: TcxImageComboBox
        Left = 112
        Top = 141
        Properties.Items = <
          item
            Description = #1053#1080#1079#1100#1082#1072
            Value = 'Low'
          end
          item
            Description = #1053#1080#1079#1100#1082#1072' ('#1040#1074#1090#1086')'
            Value = 'AutoLow'
          end
          item
            Description = #1042#1080#1089#1086#1082#1072'('#1040#1074#1090#1086')'
            Value = 'AutoHigh'
          end
          item
            Description = #1057#1077#1088#1077#1076#1085#1103
            Value = 'Medium'
          end
          item
            Description = #1042#1080#1089#1086#1082#1072
            Value = 'High'
          end
          item
            Description = #1053#1072#1081#1082#1088#1072#1097#1072
            Value = 'Best'
          end>
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 10
        Width = 193
      end
      object cbxScaleFlash: TcxImageComboBox
        Left = 112
        Top = 168
        Properties.Items = <
          item
            Description = #1055#1086' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1102' ('#1042#1089#1077')'
            Value = 'Showall'
          end
          item
            Description = #1041#1077#1079' '#1075#1088#1072#1085#1080#1094#1110
            Value = 'NoBorder'
          end
          item
            Description = #1055#1110#1076#1073#1110#1088' '#1088#1086#1079#1084#1110#1088#1091
            Value = 'ExactFit'
          end>
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 11
        Width = 193
      end
      object cbxAlingFlash: TcxImageComboBox
        Left = 112
        Top = 218
        Properties.Items = <
          item
            Description = #1055#1086' '#1094#1077#1085#1090#1088#1110
            Value = ''
          end
          item
            Description = #1055#1086' '#1083#1110#1074#1086#1084#1091' '#1082#1088#1072#1102
            Value = 'L'
          end
          item
            Description = #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
            Value = 'R'
          end
          item
            Description = #1055#1086' '#1074#1077#1088#1093#1085#1100#1086#1084#1091' '#1082#1088#1072#1102
            Value = 'T'
          end
          item
            Description = #1055#1086' '#1085#1080#1078#1085#1100#1086#1084#1091' '#1088#1072#1102
            Value = 'B'
          end
          item
            Description = #1055#1086' '#1074#1077#1088#1093#1085#1100#1086#1084#1091' '#1110' '#1083#1110#1074#1086#1084#1091' '#1082#1088#1072#1103#1084
            Value = 'LT'
          end
          item
            Description = #1055#1086' '#1074#1077#1088#1093#1085#1100#1086#1084#1091' '#1110' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1103#1084
            Value = 'TR'
          end
          item
            Description = #1055#1086' '#1085#1080#1078#1085#1100#1086#1084#1091' '#1110' '#1083#1110#1074#1086#1084#1091' '#1082#1088#1072#1103#1084
            Value = 'LB'
          end
          item
            Description = #1055#1086' '#1085#1080#1078#1085#1100#1086#1084#1091' '#1110' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1103#1084
            Value = 'RB'
          end>
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 12
        Width = 193
      end
      object cbxAlingMaket: TcxImageComboBox
        Left = 135
        Top = 263
        Properties.Items = <
          item
            Description = #1055#1086' '#1079#1072#1084#1086#1074#1095#1091#1074#1072#1085#1085#1102
            Value = ''
          end
          item
            Description = #1055#1086' '#1083#1110#1074#1086#1084#1091' '#1082#1088#1072#1102
            Value = 'left'
          end
          item
            Description = #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
            Value = 'right'
          end
          item
            Description = #1055#1086' '#1074#1077#1088#1093#1085#1100#1086#1084#1091' '#1082#1088#1072#1102
            Value = 'top'
          end
          item
            Description = #1055#1086' '#1074#1077#1088#1093#1085#1100#1086#1084#1091' '#1082#1088#1072#1102' '#1096#1088#1080#1092#1090#1072
            Value = 'texttop'
          end
          item
            Description = #1055#1086' '#1089#1077#1088#1077#1076#1080#1085#1110
            Value = 'middle'
          end
          item
            Description = #1055#1086' '#1089#1077#1088#1077#1076#1080#1085#1110' '#1096#1088#1080#1092#1090#1072
            Value = 'absmiddle'
          end
          item
            Description = #1055#1086' '#1083#1110#1085#1110#1111' '#1096#1088#1080#1092#1090#1072
            Value = 'baseline'
          end
          item
            Description = #1055#1086' '#1085#1080#1078#1085#1100#1086#1084#1091' '#1082#1088#1072#1102
            Value = 'bottom'
          end
          item
            Description = #1055#1086' '#1085#1080#1078#1085#1100#1086#1084#1091' '#1082#1088#1072#1102' '#1096#1088#1080#1092#1090#1072
            Value = 'absbottom'
          end
          item
            Description = #1055#1086' '#1094#1077#1085#1090#1088#1110
            Value = 'center'
          end>
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.PopupBorderStyle = epbsDefault
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 13
        Width = 169
      end
      object EdNameFlash: TcxTextEdit
        Left = 125
        Top = 5
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 14
        Width = 388
      end
      object EdIUrlFlash: TcxTextEdit
        Left = 125
        Top = 32
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 15
        Width = 308
      end
      object Button1: TButton
        Left = 438
        Top = 30
        Width = 75
        Height = 23
        Caption = #1042#1080#1073#1110#1088
        TabOrder = 16
        OnClick = Button1Click
      end
      object cxChBxAutoPlay: TcxCheckBox
        Left = 36
        Top = 76
        Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1085#1080#1081' '#1079#1072#1087#1091#1089#1082
        State = cbsChecked
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 17
        Width = 141
      end
      object cxChBxRepeatPlay: TcxCheckBox
        Left = 36
        Top = 97
        Caption = #1055#1086#1074#1090#1086#1088#1077#1085#1085#1103
        State = cbsChecked
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 18
        Width = 93
      end
      object cxChBxShowMenu: TcxCheckBox
        Left = 212
        Top = 73
        Caption = #1055#1086#1082#1072#1079#1072#1090#1080' '#1084#1077#1085#1102
        State = cbsChecked
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 19
        Visible = False
        Width = 149
      end
      object cxChBxPropSWlive: TcxCheckBox
        Left = 212
        Top = 97
        Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1080' SWLiveConnect'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 20
        Width = 165
      end
      object CheckWidth: TcxCheckBox
        Left = 377
        Top = 341
        Caption = #1056#1086#1079#1090#1103#1075#1085#1091#1090#1080' '#1087#1086' '#1096#1080#1088#1080#1085#1110' :'
        Properties.Alignment = taRightJustify
        Properties.OnEditValueChanged = CheckWidthPropertiesEditValueChanged
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clBlack
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 21
        Width = 138
      end
      object CheckHeight: TcxCheckBox
        Left = 377
        Top = 368
        AutoSize = False
        Caption = #1056#1086#1079#1090#1103#1075#1085#1091#1090#1080' '#1087#1086' '#1074#1080#1089#1086#1090#1110'  :'
        Properties.Alignment = taRightJustify
        Properties.OnEditValueChanged = CheckHeightPropertiesEditValueChanged
        Style.LookAndFeel.NativeStyle = True
        Style.TextColor = clBlack
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 22
        Height = 22
        Width = 138
      end
    end
    object TabMain: TTabSheet
      Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1086
      ImageIndex = 1
      object Label17: TLabel
        Left = 0
        Top = 13
        Width = 116
        Height = 13
        Caption = #1047#1085#1072#1093#1086#1076#1078#1077#1085#1085#1103' '#1074' '#1084#1077#1088#1077#1078#1110
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 128
        Top = 20
        Width = 382
        Height = 2
      end
      object Label18: TLabel
        Left = 9
        Top = 32
        Width = 137
        Height = 13
        Caption = #1050#1086#1076' '#1082#1083#1072#1089#1091' Internet Explorer :'
      end
      object Label19: TLabel
        Left = 9
        Top = 72
        Width = 156
        Height = 13
        Caption = #1041#1072#1079#1086#1074#1080#1081' '#1082#1083#1072#1089' Internet Explorer :'
      end
      object Label20: TLabel
        Left = 9
        Top = 112
        Width = 207
        Height = 13
        Caption = #1057#1090#1086#1088#1110#1085#1082#1072' '#1087#1110#1076#1082#1083#1102#1095#1077#1085#1085#1103' '#1084#1086#1076#1091#1083#1110#1074' Netscape :'
      end
      object EdKodClass: TcxTextEdit
        Left = 8
        Top = 48
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 508
      end
      object EdBaseClass: TcxTextEdit
        Left = 7
        Top = 88
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 508
      end
      object EdPageIncludeModuleNetscape: TcxTextEdit
        Left = 7
        Top = 128
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 508
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 436
    Width = 537
    Height = 37
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      537
      37)
    object SbtOK: TSpeedButton
      Left = 359
      Top = 8
      Width = 81
      Height = 22
      Anchors = [akLeft, akBottom]
      Caption = 'OK'
      OnClick = SbtOKClick
    end
    object SbtClose: TSpeedButton
      Left = 447
      Top = 8
      Width = 81
      Height = 22
      Anchors = [akLeft, akBottom]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnClick = SbtCloseClick
    end
  end
  object OpenDialog: TOpenDialog
    Filter = '*.swf|*.swf'
    Left = 409
    Top = 134
  end
end
