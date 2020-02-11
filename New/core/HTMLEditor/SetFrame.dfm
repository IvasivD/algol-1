object FrmUpdateIFrame: TFrmUpdateIFrame
  Left = 726
  Top = 246
  BorderStyle = bsDialog
  Caption = #1060#1088#1077#1081#1084
  ClientHeight = 339
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 302
    Width = 464
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      464
      37)
    object SbtOK: TSpeedButton
      Left = 279
      Top = 8
      Width = 83
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'OK'
      OnClick = SbtOKClick
    end
    object SbtClose: TSpeedButton
      Left = 371
      Top = 8
      Width = 83
      Height = 24
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnClick = SbtCloseClick
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 464
    Height = 302
    ActivePage = TabProperty
    Align = alClient
    TabOrder = 1
    object TabProperty: TTabSheet
      Caption = #1042#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110
      object Label1: TLabel
        Left = 5
        Top = 35
        Width = 36
        Height = 13
        Caption = #1054#1073#39#1108#1082#1090':'
      end
      object Label2: TLabel
        Left = 5
        Top = 58
        Width = 54
        Height = 13
        Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '
      end
      object Label3: TLabel
        Left = 21
        Top = 70
        Width = 37
        Height = 13
        Caption = #1079#1072#1084#1110#1085#1080':'
      end
      object Label13: TLabel
        Left = 5
        Top = 8
        Width = 77
        Height = 13
        Caption = #1030#1084#39#1103' - ID ( '#1083#1072#1090'. ):'
      end
      object EdPicture: TcxTextEdit
        Left = 62
        Top = 33
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 307
      end
      object EdAlt: TcxTextEdit
        Left = 62
        Top = 61
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 385
      end
      object GroupBoxAlign: TGroupBox
        Left = 6
        Top = 98
        Width = 257
        Height = 81
        Caption = #1056#1086#1079#1082#1083#1072#1076#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object Label4: TLabel
          Left = 13
          Top = 24
          Width = 74
          Height = 13
          Caption = #1042#1080#1088#1110#1074#1085#1102#1074#1072#1085#1085#1103':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label5: TLabel
          Left = 14
          Top = 52
          Width = 89
          Height = 13
          Caption = #1058#1086#1074#1097#1080#1085#1072' '#1075#1088#1072#1085#1080#1094#1110':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SelAlign: TcxImageComboBox
          Left = 120
          Top = 20
          EditValue = ''
          Properties.Items = <
            item
              Description = #1085#1077' '#1079#1072#1076#1072#1085#1086
              ImageIndex = 0
              Value = ''
            end
            item
              Description = #1079' '#1083#1110#1074#1072
              Value = 'left'
            end
            item
              Description = #1079' '#1087#1088#1072#1074#1072
              Value = 'right'
            end
            item
              Description = #1085#1072#1076' '#1090#1077#1082#1089#1090#1086#1084
              Value = 'textTop'
            end
            item
              Description = #1072#1073#1089'.'#1089#1077#1088#1077#1076#1080#1085#1072
              Value = 'absMiddle'
            end
            item
              Description = #1087#1086' '#1086#1089#1085#1086#1074#1110
              Value = 'baseline'
            end
            item
              Description = #1072#1073#1089'.'#1079#1085#1080#1079#1091
              Value = 'absBottom'
            end
            item
              Description = #1079#1085#1080#1079#1091
              Value = 'bottom'
            end
            item
              Description = #1087#1086#1089#1077#1088#1077#1076#1080#1085#1110
              Value = 'middle'
            end
            item
              Description = #1079#1074#1077#1088#1093#1091
              Value = 'top'
            end>
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.Shadow = False
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 126
        end
        object EdBorder: TcxSpinEdit
          Left = 120
          Top = 48
          Properties.AssignedValues.MinValue = True
          Properties.LargeIncrement = 1.000000000000000000
          Properties.MaxValue = 10.000000000000000000
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 57
        end
      end
      object GroupBoxInterval: TGroupBox
        Left = 270
        Top = 98
        Width = 177
        Height = 81
        Caption = #1030#1085#1090#1077#1088#1074#1072#1083' '#1087#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        object Label6: TLabel
          Left = 12
          Top = 24
          Width = 64
          Height = 13
          Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1110':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 12
          Top = 52
          Width = 53
          Height = 13
          Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1110':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EdHSpace: TcxTextEdit
          Left = 96
          Top = 20
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          OnKeyPress = EdHSpaceKeyPress
          Width = 69
        end
        object EdVSpace: TcxTextEdit
          Left = 96
          Top = 48
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          OnKeyPress = EdHSpaceKeyPress
          Width = 69
        end
      end
      object GroupBoxSize: TGroupBox
        Left = 6
        Top = 186
        Width = 283
        Height = 81
        Caption = #1056#1086#1079#1084#1110#1088':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        object LbWidth: TLabel
          Left = 13
          Top = 22
          Width = 48
          Height = 13
          Caption = #1064#1080#1088#1080#1085#1072' : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LbHeight: TLabel
          Left = 13
          Top = 52
          Width = 42
          Height = 13
          Caption = #1042#1080#1089#1086#1090#1072' :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object EdWidth: TcxSpinEdit
          Left = 63
          Top = 20
          Properties.MaxValue = 10000.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Value = 500
          Width = 73
        end
        object EdHeight: TcxSpinEdit
          Left = 63
          Top = 49
          Properties.MaxValue = 10000.000000000000000000
          Properties.MinValue = 1.000000000000000000
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Value = 500
          Width = 73
        end
        object CheckWidth: TcxCheckBox
          Left = 137
          Top = 20
          Caption = #1056#1086#1079#1090#1103#1075#1085#1091#1090#1080' '#1087#1086' '#1096#1080#1088#1080#1085#1110' :'
          Properties.Alignment = taRightJustify
          Properties.OnEditValueChanged = cxCheckWidthPropertiesEditValueChanged
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 138
        end
        object CheckHeight: TcxCheckBox
          Left = 137
          Top = 48
          AutoSize = False
          Caption = #1056#1086#1079#1090#1103#1075#1085#1091#1090#1080' '#1087#1086' '#1074#1080#1089#1086#1090#1110'  :'
          Properties.Alignment = taRightJustify
          Properties.OnEditValueChanged = cxCheckHeightPropertiesEditValueChanged
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Height = 22
          Width = 138
        end
      end
      object GroupBoxAdd: TGroupBox
        Left = 296
        Top = 186
        Width = 151
        Height = 81
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object ChBxAutoPlay: TcxCheckBox
          Left = 4
          Top = 20
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1085#1080#1081' '#1079#1072#1087#1091#1089#1082
          State = cbsChecked
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 141
        end
        object ChBxRepeatPlay: TcxCheckBox
          Left = 4
          Top = 48
          Caption = #1055#1086#1074#1090#1086#1088#1077#1085#1085#1103
          State = cbsChecked
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 86
        end
        object ChBxMutePlay: TcxCheckBox
          Left = 96
          Top = 48
          Caption = #1047#1074#1091#1082
          State = cbsChecked
          Style.LookAndFeel.NativeStyle = True
          Style.TextColor = clBlack
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 50
        end
      end
      object EdName: TcxTextEdit
        Left = 96
        Top = 5
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        OnKeyPress = EdNameKeyPress
        Width = 351
      end
      object ButSelSrc: TButton
        Left = 372
        Top = 32
        Width = 75
        Height = 23
        Caption = #1042#1080#1073#1110#1088
        TabOrder = 7
        OnClick = ButSelSrcClick
      end
    end
  end
end
