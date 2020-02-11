object FrmSetTable: TFrmSetTable
  Left = 748
  Top = 191
  BorderStyle = bsDialog
  Caption = #1042#1089#1090#1072#1074#1080#1090#1080' '#1058#1072#1073#1083#1080#1094#1102
  ClientHeight = 378
  ClientWidth = 484
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 484
    Height = 341
    ActivePage = TabProperty
    Align = alClient
    TabOrder = 0
    object TabProperty: TTabSheet
      Caption = #1042#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110
      object Label1: TLabel
        Left = 14
        Top = 4
        Width = 43
        Height = 13
        Caption = #1058#1072#1073#1083#1080#1094#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 80
        Top = 11
        Width = 386
        Height = 2
      end
      object Label2: TLabel
        Left = 22
        Top = 32
        Width = 101
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1089#1090#1086#1074#1087#1094#1110#1074' : '
      end
      object Label3: TLabel
        Left = 22
        Top = 60
        Width = 87
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1088#1103#1076#1082#1110#1074' :'
      end
      object LbSizeCell: TLabel
        Left = 14
        Top = 203
        Width = 37
        Height = 13
        Caption = #1071#1095#1077#1081#1082#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LbWidth: TLabel
        Left = 206
        Top = 32
        Width = 48
        Height = 13
        Caption = #1064#1080#1088#1080#1085#1072' : '
      end
      object LbHeight: TLabel
        Left = 206
        Top = 60
        Width = 42
        Height = 13
        Caption = #1042#1080#1089#1086#1090#1072' :'
      end
      object Bevel3: TBevel
        Left = 66
        Top = 209
        Width = 399
        Height = 2
      end
      object Bevel4: TBevel
        Left = 80
        Top = 117
        Width = 386
        Height = 2
      end
      object Label4: TLabel
        Left = 30
        Top = 110
        Width = 33
        Height = 13
        Caption = #1050#1086#1083#1110#1088' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SbtSelColorTableBorder: TSpeedButton
        Left = 289
        Top = 126
        Width = 23
        Height = 16
        Caption = '...'
        Enabled = False
        OnClick = SbtSelColorTableBorderClick
      end
      object Label5: TLabel
        Left = 46
        Top = 245
        Width = 33
        Height = 13
        Caption = #1050#1086#1083#1110#1088' :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 124
        Top = 252
        Width = 341
        Height = 2
      end
      object SbtSelColorTableFon: TSpeedButton
        Left = 289
        Top = 148
        Width = 23
        Height = 16
        Caption = '...'
        Enabled = False
        OnClick = SbtSelColorTableFonClick
      end
      object SbtSelColorCellBorder: TSpeedButton
        Left = 289
        Top = 264
        Width = 23
        Height = 16
        Caption = '...'
        Enabled = False
        OnClick = SbtSelColorCellBorderClick
      end
      object SbtSelColorCellFon: TSpeedButton
        Left = 289
        Top = 286
        Width = 23
        Height = 16
        Caption = '...'
        Enabled = False
        OnClick = SbtSelColorCellFonClick
      end
      object Label6: TLabel
        Left = 124
        Top = 225
        Width = 77
        Height = 13
        Caption = #1058#1086#1074#1097#1080#1085#1072' '#1083#1110#1085#1110#1111' : '
      end
      object Label7: TLabel
        Left = 306
        Top = 225
        Width = 43
        Height = 13
        Caption = #1042#1110#1076#1089#1090#1091#1087' :'
      end
      object Label8: TLabel
        Left = 30
        Top = 176
        Width = 78
        Height = 13
        Caption = #1052#1072#1083#1102#1085#1086#1082' '#1092#1086#1085#1091':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SbtSelectPicture: TSpeedButton
        Left = 435
        Top = 174
        Width = 23
        Height = 19
        Caption = '...'
        OnClick = SbtSelectPictureClick
      end
      object Label9: TLabel
        Left = 312
        Top = 90
        Width = 89
        Height = 13
        Caption = #1058#1086#1074#1097#1080#1085#1072' '#1075#1088#1072#1085#1080#1094#1110':'
      end
      object SpEdCountColumn: TcxSpinEdit
        Left = 122
        Top = 28
        Properties.MaxValue = 100.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Value = 5
        Width = 73
      end
      object SpEdCountRow: TcxSpinEdit
        Left = 122
        Top = 57
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Value = 2
        Width = 73
      end
      object EdWidth: TcxSpinEdit
        Left = 254
        Top = 28
        Properties.MaxValue = 1000.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Value = 100
        Width = 73
      end
      object EdHeight: TcxSpinEdit
        Left = 254
        Top = 57
        Properties.MaxValue = 1000.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Value = 50
        Width = 73
      end
      object CheckWidth: TcxCheckBox
        Left = 329
        Top = 27
        Caption = #1056#1086#1079#1090#1103#1075#1085#1091#1090#1080' '#1087#1086' '#1096#1080#1088#1080#1085#1110' :'
        Properties.Alignment = taRightJustify
        Properties.OnChange = cxCheckWidthPropertiesChange
        State = cbsChecked
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        Width = 138
      end
      object CheckHeight: TcxCheckBox
        Left = 329
        Top = 56
        AutoSize = False
        Caption = #1056#1086#1079#1090#1103#1075#1085#1091#1090#1080' '#1087#1086' '#1074#1080#1089#1086#1090#1110'  :'
        Properties.Alignment = taRightJustify
        Properties.OnChange = cxCheckHeightPropertiesChange
        State = cbsChecked
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Height = 22
        Width = 138
      end
      object PanColTableBorder: TPanel
        Left = 240
        Top = 126
        Width = 40
        Height = 16
        BiDiMode = bdLeftToRight
        Color = clBlack
        Enabled = False
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 6
      end
      object cxChBxColorTableBorder: TcxCheckBox
        Left = 111
        Top = 123
        Caption = #1050#1086#1083#1110#1088' '#1073#1086#1088#1076#1077#1088#1072' :'
        Properties.OnChange = cxChBxColorTableBorderPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 7
        Width = 105
      end
      object cxChBxColorTableFon: TcxCheckBox
        Left = 111
        Top = 145
        Caption = #1050#1086#1083#1110#1088' '#1092#1086#1085#1091' :'
        Properties.OnChange = cxChBxColorTableFonPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 8
        Width = 89
      end
      object cxChBxColorCellBorder: TcxCheckBox
        Left = 119
        Top = 260
        Caption = #1050#1086#1083#1110#1088' '#1073#1086#1088#1076#1077#1088#1072' :'
        Properties.OnChange = cxChBxColorCellBorderPropertiesChange
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Width = 105
      end
      object cxChBxColorCellFon: TcxCheckBox
        Left = 119
        Top = 283
        Caption = #1050#1086#1083#1110#1088' '#1092#1086#1085#1091' :'
        Properties.OnChange = cxChBxColorCellFonPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 10
        Width = 89
      end
      object PanColTableFon: TPanel
        Left = 240
        Top = 148
        Width = 40
        Height = 16
        BiDiMode = bdLeftToRight
        Color = clSilver
        Enabled = False
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 11
      end
      object PanColCellBorder: TPanel
        Left = 240
        Top = 264
        Width = 40
        Height = 16
        BiDiMode = bdLeftToRight
        Color = clTeal
        Enabled = False
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 12
      end
      object PanColCellFon: TPanel
        Left = 240
        Top = 286
        Width = 40
        Height = 16
        BiDiMode = bdLeftToRight
        Color = clSilver
        Enabled = False
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 13
      end
      object SpEdCellspacing: TcxSpinEdit
        Left = 202
        Top = 221
        Properties.MaxValue = 100.000000000000000000
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 14
        Value = 1
        Width = 73
      end
      object SpEdCellpadding: TcxSpinEdit
        Left = 352
        Top = 221
        Properties.MaxValue = 100.000000000000000000
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 15
        Value = 1
        Width = 73
      end
      object EdImageTableCell: TcxTextEdit
        Left = 114
        Top = 173
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 16
        Width = 318
      end
      object SpEdBorderTable: TcxSpinEdit
        Left = 408
        Top = 86
        Properties.MaxValue = 1000.000000000000000000
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 17
        Value = 1
        Width = 57
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 341
    Width = 484
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      484
      37)
    object SbtOK: TSpeedButton
      Left = 306
      Top = 8
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'OK'
      OnClick = SbtOKClick
    end
    object SbtClose: TSpeedButton
      Left = 394
      Top = 8
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnClick = SbtCloseClick
    end
  end
  object OpenDlgImage: TOpenDialog
    Filter = 'HTML|*.html|HTM|*.htm'
    Left = 232
  end
  object OpenDlgHTML: TOpenDialog
    Filter = 'HTML|*.html;*.htm|'#1060#1072#1081#1083' '#1084#1086#1074#1080'|*.js'
    Left = 136
  end
end
