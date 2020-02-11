object FrameRangeAgePrice: TFrameRangeAgePrice
  Left = 0
  Top = 0
  Width = 466
  Height = 359
  TabOrder = 0
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 352
    TabOrder = 0
    object PanelAge: TPanel
      Left = 438
      Top = 1
      Width = 21
      Height = 350
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 21
        Height = 1
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object TabControlAge: TcxPageControl
        Left = 0
        Top = 21
        Width = 21
        Height = 329
        Align = alClient
        TabOrder = 1
        Properties.ActivePage = cxTabSheet3
        Properties.NavigatorPosition = npLeftTop
        Properties.Options = [pcoAlwaysShowGoDialogButton, pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoTopToBottomText]
        Properties.TabPosition = tpRight
        ClientRectRight = 0
        ClientRectTop = 0
        object cxTabSheet3: TcxTabSheet
          Caption = #1041#1110#1083#1100#1096#1077' 6 '#1090#1080#1078#1085#1110#1074
          ImageIndex = 0
        end
        object cxTabSheet4: TcxTabSheet
          Caption = #1041#1110#1083#1100#1096#1077' 5 '#1090#1080#1078#1085#1110#1074
          ImageIndex = 1
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 1
        Width = 21
        Height = 20
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object butEditAge: TSpeedButton
          Left = 0
          Top = 0
          Width = 22
          Height = 20
          Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1074#1110#1082'. '#1082#1072#1090#1077#1075#1086#1088#1110#1111
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C30E0000C30E00000000000000000000FFFFFFDBDBDB
            DEDEDEFFFFFFFFFFFFFFFFFFFDFFFDADE9B15ED86544D44D53D65B94E399F1FB
            F2FFFFFFFFFFFFFFFFFFFFFFFF8F8F8F3333337C7C7CF4F3F4FFFFFF78DD7D3A
            D74332D53B33D43C3BD7443BD74457D85FEDF9EDFFFFFFFFFFFFFFFFFFACACAC
            373737767676F4ECF3ABE1AE32D73C35D43E96E49A96E49A32D43C3DD7463ED9
            477BDF81E5F7E6FFFFFFFFFFFFF1F1F1DEDEDEFEFEFEFFFCFF63DF694BD853BE
            EDC1FFFFFFFFFFFFA0E7A435D54040D94945D94EA5E8A9FFFFFFFFFFFFFFFFFF
            FFFFFFFFFDFCF9F9F647DA518FE794FFFFFF80E6869DECA3FFFFFFA8E9AC3DD7
            4744DA4D90E896FFFFFFFFFFFFFFFFFFFFFFFEEBF3F870C0FA3ED1684ADD4F5E
            E0663BD9463BD94598EB9DFFFFFFA5EAA93FD94AA4EDA8FFFFFFFFFFFFFFFFFF
            DEF0FD37A5EB0F92F138BFAA4BE24544DC4E49DD5348DD523EDB4892EB9877E6
            7F79E680E2FAE3FFFFFFFFFFFFFFFFFFFEFFFF52B4F41B97E7219DEE41CE7F50
            E44B4EE1514DDF534DE05244DE4B5AE062E9FBE9FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFDFF1FD2CA4F11A96E9219DEC34BAA046D46D4CDC6148D66A92E9A0ECFC
            ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8DCFB229EED1C98E919
            95F01894DF23A1DE1B98DFA8D8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFF6AC1F91F9CEB1C98E71792E31492E70D91E855ADE6F6F9
            FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF7FF37ABF51F
            9BEA1091E41590DE91CCE7DBD9EC9D9AEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFB6E2FE189EF248ACE8CAE2E9BCB4E94D4CE23B3B
            E2ACACF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC
            E5FADDDFEB847FE43B3BE14344E45555E9D0D0FAFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9FC6866E33B3BE24848E67D7DEFEAEA
            FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFCECEF75A5AE9ADADF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object PanelTab: TPanel
      Left = 1
      Top = 1
      Width = 437
      Height = 350
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PanelPrice: TPanel
        Left = 0
        Top = 22
        Width = 437
        Height = 328
        Align = alClient
        BevelOuter = bvSpace
        TabOrder = 0
        object VatPercentLabel: TLabel
          Left = 9
          Top = 62
          Width = 61
          Height = 13
          Caption = #1057#1090#1072#1074#1082#1072' '#1055#1044#1042
        end
        object NetCostLabel: TLabel
          Left = 9
          Top = 88
          Width = 74
          Height = 13
          Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1085#1077#1090#1090#1086
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object RateLabel: TLabel
          Left = 9
          Top = 113
          Width = 82
          Height = 13
          Caption = #1042#1072#1088#1090#1110#1089#1090#1100' '#1073#1088#1091#1090#1090#1086
        end
        object AgentPercLabel: TLabel
          Left = 9
          Top = 193
          Width = 60
          Height = 13
          Caption = #1059' '#1074#1110#1076#1089#1086#1090#1082#1072#1093
        end
        object AgentPayLabel: TLabel
          Left = 9
          Top = 219
          Width = 45
          Height = 13
          Caption = #1059' '#1074#1072#1083#1102#1090#1110
        end
        object TotalLb: TLabel
          Left = 9
          Top = 253
          Width = 60
          Height = 13
          Caption = #1047#1072#1088#1086#1073#1110#1090#1086#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ForPay0Label: TLabel
          Left = 9
          Top = 279
          Width = 67
          Height = 13
          Caption = #1044#1086' '#1086#1087#1083#1072#1090#1080':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clHighlight
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 9
          Top = 35
          Width = 39
          Height = 13
          Caption = #1042#1072#1083#1102#1090#1072
        end
        object Rate2GroupBox: TGroupBox
          Left = 264
          Top = 11
          Width = 167
          Height = 310
          Caption = #1062#1110#1085#1072' '#1079#1072' '#1086#1089#1086#1073#1091':'
          TabOrder = 0
          object Bevel2: TBevel
            Left = 37
            Top = 137
            Width = 120
            Height = 2
            Shape = bsBottomLine
          end
          object Bevel5: TBevel
            Left = 8
            Top = 232
            Width = 150
            Height = 2
            Shape = bsBottomLine
          end
          object AgentPayCheckBox2: TCheckBox
            Left = 8
            Top = 129
            Width = 70
            Height = 17
            Caption = #1040#1075#1077#1085#1090#1089#1100#1082#1110
            TabOrder = 0
            OnClick = AgentPayCheckBoxClick
          end
          object PanelPrice2: TPanel
            Left = 2
            Top = 152
            Width = 163
            Height = 77
            BevelOuter = bvNone
            TabOrder = 1
            object AgentPercRadioButton2: TcxRadioButton
              Left = 12
              Top = 3
              Width = 38
              Height = 17
              Caption = '%'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = AgentPayCheckBoxClick
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
            end
            object AgentAbsRadioButton2: TcxRadioButton
              Left = 44
              Top = 3
              Width = 38
              Height = 17
              Caption = #1040#1073#1089'.'
              TabOrder = 1
              OnClick = AgentPayCheckBoxClick
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
            end
          end
          object NetCostVatEdit2: TcxCurrencyEdit
            Left = 8
            Top = 72
            EditValue = 0c
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object BrutCostVatEdit2: TcxCurrencyEdit
            Left = 8
            Top = 99
            EditValue = 0c
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object AgentPercEdit2: TcxCurrencyEdit
            Left = 8
            Top = 177
            EditValue = 0c
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 4
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object AgentPayValEdit2: TcxCurrencyEdit
            Left = 8
            Top = 204
            EditValue = 0c
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object RateComboBox2: TcxLookupComboBox
            Left = 8
            Top = 17
            Properties.ListColumns = <>
            Properties.ListOptions.ShowHeader = False
            Properties.OnInitPopup = VatRateIdcComboBoxPropertiesEditValueChanged
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Width = 90
          end
          object VatRateIdcComboBox2: TcxLookupComboBox
            Left = 8
            Top = 45
            Properties.ListColumns = <>
            Properties.ListOptions.ShowHeader = False
            Properties.OnEditValueChanged = VatRateIdcComboBoxPropertiesEditValueChanged
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 7
            Width = 90
          end
          object Panel6: TPanel
            Left = 2
            Top = 238
            Width = 163
            Height = 70
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 8
            DesignSize = (
              163
              70)
            object Bevel3: TBevel
              Left = 4
              Top = 22
              Width = 155
              Height = 2
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object TotalVatLabel2: TLabel
              Left = 4
              Top = 1
              Width = 60
              Height = 13
              Caption = #1042#1089#1100#1086#1075#1086',  %s'
            end
            object ForPayLabel2: TLabel
              Left = 4
              Top = 29
              Width = 57
              Height = 13
              Anchors = [akLeft, akTop, akRight]
              Caption = #1042#1089#1100#1086#1075#1086', %s'
            end
            object VatLabel2: TLabel
              Left = 4
              Top = 50
              Width = 53
              Height = 13
              Caption = #1042' '#1090'.'#1095'. '#1055#1044#1042
            end
            object TotalLabel2: TcxCurrencyEdit
              Left = 77
              Top = 0
              EditValue = 0.000000000000000000
              Enabled = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.TextColor = clBlack
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 0
              BiDiMode = bdRightToLeft
              ParentBiDiMode = False
              Width = 86
            end
            object ForPayLb2: TcxCurrencyEdit
              Left = 77
              Top = 24
              EditValue = 0.000000000000000000
              Enabled = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clHighlight
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.TextColor = clHighlight
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 1
              BiDiMode = bdRightToLeft
              ParentBiDiMode = False
              Width = 86
            end
            object VatLb2: TcxCurrencyEdit
              Left = 77
              Top = 45
              EditValue = 0.000000000000000000
              Enabled = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clHighlight
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.TextColor = clHighlight
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 2
              BiDiMode = bdRightToLeft
              ParentBiDiMode = False
              Width = 86
            end
          end
        end
        object RateGroupBox: TGroupBox
          Left = 93
          Top = 11
          Width = 167
          Height = 310
          Caption = #1062#1110#1085#1072' '#1079#1072' '#1086#1089#1086#1073#1091':'
          TabOrder = 1
          DesignSize = (
            167
            310)
          object Bevel1: TBevel
            Left = 37
            Top = 137
            Width = 116
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsBottomLine
          end
          object Bevel6: TBevel
            Left = 8
            Top = 232
            Width = 146
            Height = 2
            Anchors = [akLeft, akTop, akRight]
            Shape = bsBottomLine
          end
          object AgentPayCheckBox: TCheckBox
            Left = 8
            Top = 129
            Width = 69
            Height = 17
            Caption = #1040#1075#1077#1085#1090#1089#1100#1082#1110
            TabOrder = 0
            OnClick = AgentPayCheckBoxClick
          end
          object PanelPrice1: TPanel
            Left = 2
            Top = 152
            Width = 160
            Height = 77
            BevelOuter = bvNone
            TabOrder = 1
            object AgentPercRadioButton: TcxRadioButton
              Left = 12
              Top = 3
              Width = 38
              Height = 17
              Caption = '%'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = AgentPayCheckBoxClick
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
            end
            object AgentAbsRadioButton: TcxRadioButton
              Left = 44
              Top = 3
              Width = 38
              Height = 17
              Caption = #1040#1073#1089'.'
              TabOrder = 1
              OnClick = AgentPayCheckBoxClick
              LookAndFeel.Kind = lfStandard
              LookAndFeel.NativeStyle = False
            end
          end
          object NetCostVatEdit: TcxCurrencyEdit
            Left = 8
            Top = 71
            EditValue = 0.000000000000000000
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 2
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object BrutCostVatEdit: TcxCurrencyEdit
            Left = 8
            Top = 98
            EditValue = 0.000000000000000000
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 3
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object AgentPercEdit: TcxCurrencyEdit
            Left = 8
            Top = 177
            EditValue = 0.000000000000000000
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 4
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object AgentPayValEdit: TcxCurrencyEdit
            Left = 8
            Top = 204
            EditValue = 0.000000000000000000
            Properties.DisplayFormat = ',0.00;-,0.00'
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 5
            OnKeyUp = BrutCostVatEditKeyUp
            Width = 150
          end
          object RateComboBox: TcxLookupComboBox
            Left = 8
            Top = 17
            Properties.ListColumns = <>
            Properties.ListOptions.ShowHeader = False
            Properties.OnEditValueChanged = VatRateIdcComboBoxPropertiesEditValueChanged
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 6
            Width = 90
          end
          object VatRateIdcComboBox: TcxLookupComboBox
            Left = 8
            Top = 45
            Properties.ListColumns = <>
            Properties.ListOptions.ShowHeader = False
            Properties.OnEditValueChanged = VatRateIdcComboBoxPropertiesEditValueChanged
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 7
            Width = 90
          end
          object Panel7: TPanel
            Left = 2
            Top = 238
            Width = 163
            Height = 70
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 8
            DesignSize = (
              163
              70)
            object TotalVatLabel: TLabel
              Left = 4
              Top = 2
              Width = 60
              Height = 13
              Caption = #1042#1089#1100#1086#1075#1086',  %s'
            end
            object Bevel7: TBevel
              Left = 4
              Top = 23
              Width = 155
              Height = 2
              Anchors = [akLeft, akTop, akRight]
              Shape = bsTopLine
            end
            object ForPayLabel: TLabel
              Left = 4
              Top = 29
              Width = 57
              Height = 13
              Caption = #1042#1089#1100#1086#1075#1086', %s'
            end
            object VatLabel: TLabel
              Left = 4
              Top = 50
              Width = 53
              Height = 13
              Caption = #1042' '#1090'.'#1095'. '#1055#1044#1042
            end
            object TotalLabel: TcxCurrencyEdit
              Left = 77
              Top = 0
              EditValue = 0.000000000000000000
              Enabled = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.TextColor = clBlack
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 0
              BiDiMode = bdRightToLeft
              ParentBiDiMode = False
              Width = 86
            end
            object ForPayLb: TcxCurrencyEdit
              Left = 77
              Top = 24
              EditValue = 0.000000000000000000
              Enabled = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = [fsBold]
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clHighlight
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.TextColor = clHighlight
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 1
              BiDiMode = bdRightToLeft
              ParentBiDiMode = False
              Width = 86
            end
            object VatLb: TcxCurrencyEdit
              Left = 77
              Top = 45
              EditValue = 0.000000000000000000
              Enabled = False
              ParentColor = True
              ParentFont = False
              Properties.Alignment.Horz = taRightJustify
              Properties.Alignment.Vert = taVCenter
              Properties.DisplayFormat = ',0.00;-,0.00'
              Properties.ReadOnly = True
              Style.BorderStyle = ebsNone
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clBlue
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.LookAndFeel.Kind = lfStandard
              Style.LookAndFeel.NativeStyle = False
              Style.TextColor = clHighlight
              Style.TransparentBorder = True
              Style.IsFontAssigned = True
              StyleDisabled.Color = clBtnFace
              StyleDisabled.LookAndFeel.Kind = lfStandard
              StyleDisabled.LookAndFeel.NativeStyle = False
              StyleDisabled.TextColor = clHighlight
              StyleFocused.LookAndFeel.Kind = lfStandard
              StyleFocused.LookAndFeel.NativeStyle = False
              StyleHot.LookAndFeel.Kind = lfStandard
              StyleHot.LookAndFeel.NativeStyle = False
              TabOrder = 2
              BiDiMode = bdRightToLeft
              ParentBiDiMode = False
              Width = 86
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 437
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 24
          Height = 22
          Align = alLeft
          TabOrder = 0
          object butEditPeriod: TSpeedButton
            Left = 0
            Top = 1
            Width = 25
            Height = 20
            Hint = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080' '#1087#1077#1088#1110#1086#1076#1080
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FFFFFFDBDBDB
              DEDEDEFFFFFFFFFFFFFFFFFFFDFFFDADE9B15ED86544D44D53D65B94E399F1FB
              F2FFFFFFFFFFFFFFFFFFFFFFFF8F8F8F3333337C7C7CF4F3F4FFFFFF78DD7D3A
              D74332D53B33D43C3BD7443BD74457D85FEDF9EDFFFFFFFFFFFFFFFFFFACACAC
              373737767676F4ECF3ABE1AE32D73C35D43E96E49A96E49A32D43C3DD7463ED9
              477BDF81E5F7E6FFFFFFFFFFFFF1F1F1DEDEDEFEFEFEFFFCFF63DF694BD853BE
              EDC1FFFFFFFFFFFFA0E7A435D54040D94945D94EA5E8A9FFFFFFFFFFFFFFFFFF
              FFFFFFFFFDFCF9F9F647DA518FE794FFFFFF80E6869DECA3FFFFFFA8E9AC3DD7
              4744DA4D90E896FFFFFFFFFFFFFFFFFFFFFFFEEBF3F870C0FA3ED1684ADD4F5E
              E0663BD9463BD94598EB9DFFFFFFA5EAA93FD94AA4EDA8FFFFFFFFFFFFFFFFFF
              DEF0FD37A5EB0F92F138BFAA4BE24544DC4E49DD5348DD523EDB4892EB9877E6
              7F79E680E2FAE3FFFFFFFFFFFFFFFFFFFEFFFF52B4F41B97E7219DEE41CE7F50
              E44B4EE1514DDF534DE05244DE4B5AE062E9FBE9FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFDFF1FD2CA4F11A96E9219DEC34BAA046D46D4CDC6148D66A92E9A0ECFC
              ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8DCFB229EED1C98E919
              95F01894DF23A1DE1B98DFA8D8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFF6AC1F91F9CEB1C98E71792E31492E70D91E855ADE6F6F9
              FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAF7FF37ABF51F
              9BEA1091E41590DE91CCE7DBD9EC9D9AEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFB6E2FE189EF248ACE8CAE2E9BCB4E94D4CE23B3B
              E2ACACF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC
              E5FADDDFEB847FE43B3BE14344E45555E9D0D0FAFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF9FC6866E33B3BE24848E67D7DEFEAEA
              FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFCECEF75A5AE9ADADF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            OnClick = butEditPeriodClick
          end
        end
        object Panel3: TPanel
          Left = 24
          Top = 0
          Width = 413
          Height = 22
          Align = alClient
          TabOrder = 1
          object TabControlPeriod: TcxPageControl
            Left = 1
            Top = 1
            Width = 411
            Height = 20
            Align = alClient
            TabOrder = 0
            Properties.ActivePage = cxTabSheet2
            ClientRectRight = 0
            ClientRectTop = 0
            object cxTabSheet1: TcxTabSheet
              Caption = #1041#1110#1083#1100#1096#1077' 6 '#1090#1080#1078#1085#1110#1074
              ImageIndex = 0
            end
            object cxTabSheet2: TcxTabSheet
              Caption = #1041#1110#1083#1100#1096#1077' 5 '#1090#1080#1078#1085#1110#1074
              ImageIndex = 1
            end
          end
        end
      end
    end
  end
end
