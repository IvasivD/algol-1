object FrmEditPicture: TFrmEditPicture
  Left = 781
  Top = 189
  BorderStyle = bsDialog
  Caption = #1056#1080#1089#1091#1085#1086#1082
  ClientHeight = 262
  ClientWidth = 462
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
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 462
    Height = 225
    ActivePage = TabProperty
    Align = alClient
    TabOrder = 0
    object TabProperty: TTabSheet
      Caption = #1042#1083#1072#1089#1090#1080#1074#1086#1089#1090#1110
      object Label1: TLabel
        Left = 5
        Top = 36
        Width = 45
        Height = 13
        Caption = #1056#1080#1089#1091#1085#1086#1082':'
      end
      object Label2: TLabel
        Left = 5
        Top = 59
        Width = 54
        Height = 13
        Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '
      end
      object Label3: TLabel
        Left = 21
        Top = 71
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
        Top = 34
        Properties.OnChange = EdPicturePropertiesChange
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 303
      end
      object ButSelPicture: TButton
        Left = 372
        Top = 33
        Width = 75
        Height = 23
        Caption = #1042#1080#1073#1110#1088
        TabOrder = 1
        OnClick = ButSelPictureClick
      end
      object EdAlt: TcxTextEdit
        Left = 62
        Top = 62
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 385
      end
      object GroupBox1: TGroupBox
        Left = 6
        Top = 91
        Width = 257
        Height = 81
        Caption = #1056#1086#1079#1082#1083#1072#1076#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
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
          Left = 13
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
          Width = 68
        end
      end
      object GroupBox2: TGroupBox
        Left = 270
        Top = 91
        Width = 177
        Height = 81
        Caption = #1030#1085#1090#1077#1088#1074#1072#1083' '#1087#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 12673280
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
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
        TabOrder = 5
        Width = 351
      end
      object chCodeTo64: TcxCheckBox
        Left = 1
        Top = 174
        Caption = #1047#1072#1082#1086#1076#1091#1074#1072#1090#1080' '#1074' Base 64'
        TabOrder = 6
        Width = 141
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 225
    Width = 462
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      462
      37)
    object SbtOK: TSpeedButton
      Left = 277
      Top = 8
      Width = 83
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'OK'
      OnClick = SbtOKClick
    end
    object SbtClose: TSpeedButton
      Left = 369
      Top = 8
      Width = 83
      Height = 24
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnClick = SbtCloseClick
    end
  end
end
