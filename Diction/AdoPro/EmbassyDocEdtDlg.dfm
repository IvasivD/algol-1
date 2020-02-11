object EmbassyDocEditDlg: TEmbassyDocEditDlg
  Left = 945
  Top = 91
  Width = 257
  Height = 879
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1085#1072' '#1074#1110#1079#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 841
    Align = alClient
    TabOrder = 0
    DesignSize = (
      241
      841)
    object DocNameLabel: TLabel
      Left = 8
      Top = 12
      Width = 225
      Height = 26
      AutoSize = False
      Caption = 'DocNameLabel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object MemoLabel: TLabel
      Left = 8
      Top = 720
      Width = 45
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1055#1088#1080#1084#1110#1090#1082#1080
    end
    object Label2: TLabel
      Left = 8
      Top = 49
      Width = 76
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
    end
    object IssuedLabel: TLabel
      Tag = 1
      Left = 25
      Top = 186
      Width = 139
      Height = 39
      Caption = #1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#1076#1086' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076#1091' '#1076#1110#1111' '#1074#1110#1079#1080' '#1085#1077' '#1076#1072#1074#1085#1110#1096#1072' '#1085#1110#1078
      WordWrap = True
      OnClick = IssuedLabelClick
    end
    object BeginDocLabel: TLabel
      Tag = 2
      Left = 25
      Top = 246
      Width = 181
      Height = 26
      Caption = 
        #1055#1086#1095#1072#1090#1086#1082' '#1087#1077#1088#1110#1086#1076#1091' '#1076#1110#1111' '#1076#1086#1082#1091#1084#1077#1085#1090#1091'          '#1085#1077' '#1087#1110#1079#1085#1110#1096#1077' '#1087#1086#1095#1072#1090#1082#1091' '#1087#1077#1088#1110#1086#1076 +
        #1091' '#1076#1110#1111' '#1074#1110#1079#1080
      WordWrap = True
      OnClick = IssuedLabelClick
    end
    object ExpireDocLabel: TLabel
      Tag = 3
      Left = 25
      Top = 280
      Width = 192
      Height = 26
      Caption = #1055#1077#1088#1110#1086#1076' '#1076#1110#1111' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#1087#1110#1089#1083#1103' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103' '#1087#1077#1088#1110#1086#1076#1091' '#1076#1110#1111' '#1074#1110#1079#1080' '#1085#1077' '#1084#1077#1085#1096#1077
      WordWrap = True
      OnClick = IssuedLabelClick
    end
    object LinkBtn: TSpeedButton
      Left = 210
      Top = 24
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFDEDEDE7B6B6B4A08085A1818A57373EFDEDEFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDEDEDE736B735229297B10189C
        10189C1018A51818A52929C67373F7DEDEFF00FFFF00FFFF00FFFF00FFFF00FF
        C6C6C62929294200009410187B4A184A9418BD3118E71818D61818C60000BD29
        29EFC6C6FF00FFFF00FFFF00FFDEDEDE2929294A0808941018A5291829AD1800
        FF186B9C18AD5A18A56318F71018DE0808C62121F7E7E7FF00FFFF00FF736B73
        2100007B2118AD1018A5391818D61818E71810F718A57318D64218FF2118FF18
        18DE0000DE7373FF00FFDEDEDE2929295218188C1818C608188C5A1810EF1821
        E71821FF18BD6B18FF0018FF2118FF2118FF1818DE2929FFDEE7737373291818
        6B18189C1818BD211842AD1810F71821F71821FF1821F718D65218FF0818FF21
        18FF1018EF1818D6847318181842181863291831841829A51818D61821E71821
        FF1810FF1829F718AD8C18FF0818FF1018F73118EF31187B6318181818421818
        4A421808AD1810AD1818CE1818E71808FF184ADE1873BD1842DE18F72918F729
        189CA518F72918944A1884737339101863291821941810AD1810DE1810F71821
        E7185ACE1831EF184ADE18AD8C1863BD1842EF18848C18BD9C73DEDEDE292929
        6310187B3918299C1839AD18BD4218D6311863BD1810FF1842EF1818FF1818FF
        1808FF1839DE29F7DEDEFF00FF736B73290000941018635A187B631884731863
        A518739C186BBD1863C61810FF1821FF1800EF0073DE73FF00FFFF00FFDEDEDE
        2929295208089C18185A6B1821C61821E71829DE1829DE1831EF1821FF1810EF
        0829C621EFEFE7FF00FFFF00FFFF00FFC6C6C62929294A00009418188C39184A
        8C1821CE1818E71810E71800C60029B529CEE7C6FF00FFFF00FFFF00FFFF00FF
        FF00FFDEDEDE736B734239296B29188431189C291863631829AD296BBD73E7EF
        DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6E7DE6B84734A
        18186B0818AD6B73DEE7DEFF00FFFF00FFFF00FFFF00FFFF00FF}
      Visible = False
      OnClick = LinkBtnClick
    end
    object BeforeFilingLabel: TLabel
      Tag = 4
      Left = 25
      Top = 125
      Width = 167
      Height = 39
      Caption = #1044#1072#1090#1072' '#1074#1080#1076#1072#1095#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1091' '#1076#1086' '#1076#1072#1090#1080' '#1087#1086#1076#1072#1095#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1085#1077' '#1076#1072#1074#1085#1110#1096#1072' '#1085#1110#1078
      WordWrap = True
      OnClick = IssuedLabelClick
    end
    object FilingAtWorkImage: TImage
      Left = 217
      Top = 515
      Width = 16
      Height = 16
      Center = True
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000C30E0000C30E0000000000000000
        0000F2F2F29F9F9F9F9F9FF2F2F2F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0A6A6A6C1C1C1F0F0F09F9F9FF9F9F9F9F9F98B8B8BF2F2
        F2F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F09F9F9F7C3000A46722BA
        BABAADADADF9F9F9A7A7A7C1C1C1868686FCFCFCF0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0ADADAD6C2908B06616D89C4BB6AFA7EDEDEDC7C7C78B8B8BA6A6A6F2F2
        F28B8B8BF0F0F0F0F0F0F0F0F0F0F0F0BABABA6C2908B06616D39848ABA294F0
        F0F0F0F0F0DBDBDBD0D0D0E5E5E5E5E5E5E5E5E5999999F0F0F0F0F0F0C4C4C4
        672D14B06616D89C4BABA294F0F0F0F0F0F0F0F0F0F0F0F0E1E0E0BABABAE1E0
        E0EDEDEDD0D0D0BABABADBDBDB65301CB06616D89C4BA89B85F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0E5E5E5BABABAE5E5E5EDEDED949597734123B36510
        D89C4BAA997FF0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0EDED
        EDC1C1C1D0D0D0C7C7C7BFA992D89C4BAA997FF0F0F0F0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F2F2F2A7A7A7D0D0D0DBDBDB9E9991
        E5E5E5F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
        F0FCFCFC868686B2B2B2EDEDEDE1E0E07C7C7C8686867C7C7C999999F9F9F9F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0FCFCFC868686949597F9F9F9ADADADEDEDED
        E5E5E5E5E5E5EDEDEDD0D0D0868686F0F0F0F0F0F0F0F0F0F0F0F0F0F0F08686
        86949597FCFCFCF0F0F0C7C7C7DBDBDBE5E5E5E5E5E5E5E5E5F2F2F2C4C4C4D0
        D0D0F0F0F0F0F0F0FCFCFC868686999999F9F9F9F0F0F0F0F0F0ADADADF2F2F2
        EDEDEDC7C7C7C7C7C7ADADADFFFFFFA6A6A6F0F0F0F9F9F9999999C7C7C7F2F2
        F2F0F0F0F0F0F0F0F0F0C1C1C1F2F2F2FCFCFC999999F0F0F0F0F0F0B2B2B2A7
        A7A7F0F0F0949597C7C7C7C7C7C7F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0B2B2B2
        FFFFFFE5E5E5999999F0F0F0F0F0F0F0F0F0F0F0F0C1C1C1D0D0D0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F9F9F9B2B2B2C4C4C4BABABAF2F2F2F0F0F0F0
        F0F0}
      OnClick = FilingAtWorkImageClick
    end
    object Label1: TLabel
      Left = 8
      Top = 101
      Width = 46
      Height = 13
      Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100
    end
    object NeedCountEdit: TSpinEdit
      Left = 58
      Top = 96
      Width = 30
      Height = 22
      Color = clInfoBk
      MaxValue = 99
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object ExpireMonthCheckBox: TCheckBox
      Left = 8
      Top = 280
      Width = 17
      Height = 17
      TabOrder = 11
      WordWrap = True
      OnClick = ExpireMonthCheckBoxClick
    end
    object IssuedMonthCheckBox: TCheckBox
      Left = 8
      Top = 186
      Width = 17
      Height = 17
      TabOrder = 7
      OnClick = IssuedMonthCheckBoxClick
    end
    object ExpireMonthEdit: TSpinEdit
      Left = 100
      Top = 312
      Width = 57
      Height = 22
      Color = clBtnFace
      Enabled = False
      MaxValue = 120
      MinValue = 0
      TabOrder = 12
      Value = 0
    end
    object IssuedMonthEdit: TSpinEdit
      Left = 100
      Top = 218
      Width = 57
      Height = 22
      Color = clBtnFace
      Enabled = False
      MaxValue = 120
      MinValue = 0
      TabOrder = 8
      Value = 0
    end
    object AgeRestrictGroupBox: TGroupBox
      Left = 8
      Top = 385
      Width = 225
      Height = 75
      TabOrder = 18
      object AgeRestrictYearLabel: TLabel
        Left = 190
        Top = 39
        Width = 26
        Height = 13
        Caption = #1088#1086#1082#1110#1074
        Enabled = False
      end
      object AgeBeforeRadioButton: TRadioButton
        Left = 8
        Top = 24
        Width = 153
        Height = 17
        Caption = #1076#1083#1103' '#1090#1091#1088#1080#1089#1090#1110#1074' '#1074#1110#1082#1086#1084' '#1076#1086
        Enabled = False
        TabOrder = 0
      end
      object AgeAfterRadioButton: TRadioButton
        Left = 8
        Top = 48
        Width = 137
        Height = 17
        Caption = #1076#1083#1103' '#1090#1091#1088#1080#1089#1090#1110#1074' '#1074#1110#1082#1086#1084' '#1074#1110#1076
        Enabled = False
        TabOrder = 1
      end
      object AgeRestrictEdit: TSpinEdit
        Left = 145
        Top = 34
        Width = 41
        Height = 22
        Color = clBtnFace
        Enabled = False
        MaxValue = 149
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
    end
    object AgeRestrictCheckBox: TCheckBox
      Left = 8
      Top = 384
      Width = 119
      Height = 17
      Caption = #1054#1073#1084#1077#1078#1077#1085#1085#1103' '#1087#1086' '#1074#1110#1082#1091
      TabOrder = 17
      OnClick = AgeRestrictCheckBoxClick
    end
    object TypeDocComboBox: TAzComboBox
      Left = 8
      Top = 67
      Width = 225
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
    object IsUseCheckBox: TCheckBox
      Left = 118
      Top = 47
      Width = 116
      Height = 17
      Caption = #1042#1080#1082#1086#1088#1080#1089#1090#1086#1074#1091#1108#1090#1100#1089#1103
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object ExpirePeriodComboBox: TAzComboBox
      Left = 160
      Top = 312
      Width = 74
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 13
      Items.Strings = (
        #1076#1077#1085#1100
        #1090#1080#1078#1076#1077#1085#1100
        #1084#1110#1089#1103#1094#1100
        #1088#1110#1082)
    end
    object IssuedPeriodComboBox: TAzComboBox
      Left = 160
      Top = 218
      Width = 74
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 9
      Items.Strings = (
        #1076#1077#1085#1100
        #1090#1080#1078#1076#1077#1085#1100
        #1084#1110#1089#1103#1094#1100
        #1088#1110#1082)
    end
    object Memo1: TMemo
      Left = 8
      Top = 735
      Width = 225
      Height = 68
      Anchors = [akLeft, akBottom]
      Color = clInfoBk
      Lines.Strings = (
        'Memo1')
      TabOrder = 30
    end
    object MARRIEDCheckBox: TCheckBox
      Left = 8
      Top = 467
      Width = 177
      Height = 17
      Caption = #1057#1110#1084#1077#1081#1085#1080#1081' '#1089#1090#1072#1085
      TabOrder = 19
      OnClick = MARRIEDCheckBoxClick
    end
    object PosadaCheckBox: TCheckBox
      Left = 8
      Top = 514
      Width = 67
      Height = 17
      Caption = #1055#1086#1089#1072#1076#1072
      TabOrder = 21
      OnClick = PosadaCheckBoxClick
    end
    object MarriedComboBox: TAzComboBox
      Left = 8
      Top = 486
      Width = 225
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 20
    end
    object PosadaComboBox: TAzComboBox
      Left = 8
      Top = 533
      Width = 225
      Height = 21
      OnChange = PosadaComboBoxChange
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 23
    end
    object IndCheckBox: TCheckBox
      Left = 8
      Top = 644
      Width = 145
      Height = 17
      Caption = #1044#1083#1103' '#1110#1085#1076#1080#1074#1110#1076#1091#1072#1083#1110#1074
      TabOrder = 26
    end
    object ManualCheckBox: TCheckBox
      Left = 8
      Top = 664
      Width = 161
      Height = 17
      Caption = #1044#1083#1103' '#1074#1089#1110#1093' '#1076#1086#1076#1072#1074#1072#1090#1080' '#1074#1088#1091#1095#1085#1091
      TabOrder = 27
    end
    object ReturnedCheckBox: TCheckBox
      Left = 8
      Top = 703
      Width = 129
      Height = 17
      Hint = 
        #1055#1088#1080' '#1087#1077#1088#1077#1074#1077#1076#1077#1085#1085#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074' '#1074' '#1089#1090#1072#1085'  "'#1054#1087#1088#1072#1094#1102#1074#1072#1085#1110'" , '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1077#1088#1077#1084 +
        #1110#1097#1091#1108#1090#1100#1089#1103' '#1074' '#1088#1086#1079#1076#1110#1083' "'#1054#1090#1088#1080#1084#1072#1085#1110' '#1074#1110#1076' '#1090#1091#1088#1080#1089#1090#1072'"'
      Caption = #1055#1086#1074#1077#1088#1085#1077#1085#1085#1103' '#1090#1091#1088#1080#1089#1090#1091
      TabOrder = 29
    end
    object TransmitCheckBox: TCheckBox
      Left = 8
      Top = 684
      Width = 185
      Height = 17
      Caption = #1053#1072#1096#1110' '#1076#1086#1082#1091#1084#1077#1085#1090#1080
      TabOrder = 28
    end
    object FundingGroupBox: TGroupBox
      Left = 8
      Top = 566
      Width = 225
      Height = 72
      TabOrder = 25
      object GainRadioButton: TRadioButton
        Left = 9
        Top = 13
        Width = 144
        Height = 17
        Caption = #1086#1089#1085#1086#1074#1085#1080#1081' '#1076#1086#1093#1110#1076
        TabOrder = 0
        TabStop = True
        OnClick = FundingRadioButtonClick
      end
      object FundingRadioButton: TRadioButton
        Left = 9
        Top = 51
        Width = 147
        Height = 17
        Caption = #1076#1086#1076#1072#1090#1082#1086#1074#1077' '#1092#1110#1085#1072#1085#1089#1091#1074#1072#1085#1085#1103
        TabOrder = 2
        TabStop = True
        OnClick = FundingRadioButtonClick
      end
      object BankRadioButton: TRadioButton
        Left = 9
        Top = 32
        Width = 51
        Height = 17
        Caption = #1073#1072#1085#1082
        TabOrder = 1
        TabStop = True
        OnClick = FundingRadioButtonClick
      end
      object WithOutSumCheckBox: TCheckBox
        Left = 156
        Top = 51
        Width = 67
        Height = 17
        Caption = #1073#1077#1079' '#1089#1091#1084#1080
        Enabled = False
        TabOrder = 3
        OnClick = WithOutSumCheckBoxClick
      end
      object BankWithOutSumCheckBox: TCheckBox
        Tag = 1
        Left = 64
        Top = 32
        Width = 67
        Height = 17
        Caption = #1073#1077#1079' '#1089#1091#1084#1080
        Enabled = False
        TabOrder = 4
        OnClick = WithOutSumCheckBoxClick
      end
    end
    object NecessarySumCheckBox: TCheckBox
      Left = 8
      Top = 561
      Width = 97
      Height = 17
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1088#1086
      TabOrder = 24
      OnClick = NecessarySumCheckBoxClick
    end
    object BeginDocCheckBox: TCheckBox
      Left = 8
      Top = 246
      Width = 17
      Height = 17
      TabOrder = 10
      WordWrap = True
    end
    object DocForLastCheckBox: TCheckBox
      Left = 8
      Top = 340
      Width = 216
      Height = 17
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1079#1072' '#1086#1089#1090#1072#1085#1085#1110', '#1097#1086#1085#1072#1081#1084#1077#1085#1096#1077
      TabOrder = 14
      OnClick = DocForLastCheckBoxClick
    end
    object DocForLastEdit: TSpinEdit
      Left = 100
      Top = 359
      Width = 57
      Height = 22
      Color = clBtnFace
      Enabled = False
      MaxValue = 120
      MinValue = 0
      TabOrder = 15
      Value = 0
    end
    object DocForLastPeriodComboBox: TAzComboBox
      Left = 160
      Top = 359
      Width = 74
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 16
      Items.Strings = (
        #1076#1077#1085#1100
        #1090#1080#1078#1076#1077#1085#1100
        #1084#1110#1089#1103#1094#1100
        #1088#1110#1082)
    end
    object BeforeFilingCheckBox: TCheckBox
      Left = 8
      Top = 125
      Width = 17
      Height = 17
      TabOrder = 4
      OnClick = BeforeFilingCheckBoxClick
    end
    object BeforeFilingEdit: TSpinEdit
      Left = 100
      Top = 157
      Width = 57
      Height = 22
      Color = clBtnFace
      Enabled = False
      MaxValue = 120
      MinValue = 0
      TabOrder = 5
      Value = 0
    end
    object BeforeFilingComboBox: TAzComboBox
      Left = 160
      Top = 157
      Width = 74
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        #1076#1077#1085#1100
        #1090#1080#1078#1076#1077#1085#1100
        #1084#1110#1089#1103#1094#1100
        #1088#1110#1082)
    end
    object FilingAtWorkCheckBox: TCheckBox
      Left = 200
      Top = 514
      Width = 17
      Height = 17
      Enabled = False
      TabOrder = 22
    end
    object ForComboBox: TAzComboBox
      Left = 92
      Top = 97
      Width = 141
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object DocumVisaSrc: TDataSource
    DataSet = VisaDocumTable
    Left = 136
    Top = 584
  end
  object VisaDocumTable: TIBTable
    TableName = 'VISADOCUMENTS_NEW'
    Left = 8
    Top = 8
    object VisaDocumTableVISADOCUMENTID: TIntegerField
      FieldName = 'VISADOCUMENTID'
      Required = True
    end
    object VisaDocumTableCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object VisaDocumTableEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
    end
    object VisaDocumTableDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object VisaDocumTableNEEDCOUNT: TIntegerField
      FieldName = 'NEEDCOUNT'
    end
    object VisaDocumTableAGERESTRICTION: TIntegerField
      FieldName = 'AGERESTRICTION'
    end
    object VisaDocumTableEXPIREMONTHS: TIntegerField
      FieldName = 'EXPIREMONTHS'
    end
    object VisaDocumTableISSUEDMONTHS: TIntegerField
      FieldName = 'ISSUEDMONTHS'
    end
    object VisaDocumTableSUMMA: TFloatField
      FieldName = 'SUMMA'
    end
    object VisaDocumTablePERIOD: TIntegerField
      FieldName = 'PERIOD'
    end
    object VisaDocumTableISUSE: TStringField
      FieldName = 'ISUSE'
      Size = 1
    end
    object VisaDocumTableEXPIREPERIOD: TIntegerField
      FieldName = 'EXPIREPERIOD'
    end
    object VisaDocumTableISSUESPERIOD: TIntegerField
      FieldName = 'ISSUESPERIOD'
    end
    object VisaDocumTableTYPEVAL: TIntegerField
      FieldName = 'TYPEVAL'
    end
    object VisaDocumTableTYPEDOCID: TIntegerField
      FieldName = 'TYPEDOCID'
    end
    object VisaDocumTableCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      BlobType = ftMemo
      Size = 1
    end
    object VisaDocumTableFORADDMANUAL: TStringField
      FieldName = 'FORADDMANUAL'
      Size = 1
    end
    object VisaDocumTableFORIND: TStringField
      FieldName = 'FORIND'
      Size = 1
    end
    object VisaDocumTablePOSADA: TIntegerField
      FieldName = 'POSADA'
    end
    object VisaDocumTableMARRIEDSTATE: TIntegerField
      FieldName = 'MARRIEDSTATE'
    end
    object VisaDocumTableFUNDING: TStringField
      FieldName = 'FUNDING'
      Size = 1
    end
    object VisaDocumTableRETURNED: TStringField
      FieldName = 'RETURNED'
      Size = 1
    end
    object VisaDocumTableTRANSMIT: TStringField
      DisplayLabel = #1053#1077' '#1087#1077#1088#1077#1076#1072#1074#1072#1090#1080
      FieldName = 'TRANSMIT'
      Size = 1
    end
    object VisaDocumTableFUNDINGCOUNT: TIntegerField
      FieldName = 'FUNDINGCOUNT'
    end
    object VisaDocumTableBEGINDOC: TStringField
      FieldName = 'BEGINDOC'
      Size = 1
    end
    object VisaDocumTableDOCFORLASTCOUNT: TIntegerField
      FieldName = 'DOCFORLASTCOUNT'
    end
    object VisaDocumTableDOCFORLASTPERIOD: TIntegerField
      FieldName = 'DOCFORLASTPERIOD'
    end
    object VisaDocumTableBEFOREFILING: TIntegerField
      FieldName = 'BEFOREFILING'
    end
    object VisaDocumTableBEFOREFILINGPERIOD: TIntegerField
      FieldName = 'BEFOREFILINGPERIOD'
    end
    object VisaDocumTableBANKWITHOUTSUM: TStringField
      FieldName = 'BANKWITHOUTSUM'
      Size = 1
    end
    object VisaDocumTableFILINGATWORK: TStringField
      FieldName = 'FILINGATWORK'
      Size = 1
    end
    object VisaDocumTableFOROWNERVISA: TSmallintField
      FieldName = 'FOROWNERVISA'
    end
    object VisaDocumTableDOCFOR: TIntegerField
      FieldName = 'DOCFOR'
    end
  end
  object TypeDocQry: TIBQuery
    SQL.Strings = (
      'Select ItemName Name, NameId id'
      'from NameLists'
      'where Category=51'
      'order by 1')
    Left = 168
    Top = 584
    object TypeDocQryID: TIntegerField
      FieldName = 'ID'
    end
    object TypeDocQryNAME: TStringField
      FieldName = 'NAME'
      Size = 75
    end
  end
  object TypeDocTable: TIBTable
    TableName = 'VISATYPEDOCS'
    Left = 200
    object TypeDocTableVISATYPEDOCID: TIntegerField
      FieldName = 'VISATYPEDOCID'
    end
    object TypeDocTableDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object TypeDocTableTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
  end
  object PosadaQry: TIBQuery
    SQL.Strings = (
      'select POSADANAMEID, POSADANAME, SORTORDER'
      'from POSADA_VIEW'
      'Order by 2')
    Left = 69
    Top = 2
    object PosadaQryPOSADANAMEID: TIntegerField
      FieldName = 'POSADANAMEID'
      Origin = 'DICT.POSADA_VIEW.POSADANAMEID'
    end
    object PosadaQryPOSADANAME: TStringField
      FieldName = 'POSADANAME'
      Origin = 'DICT.POSADA_VIEW.POSADANAME'
      Size = 75
    end
    object PosadaQrySORTORDER: TIntegerField
      FieldName = 'SORTORDER'
      Origin = 'DICT.POSADA_VIEW.SORTORDER'
    end
  end
  object CheckQry: TIBQuery
    Left = 192
    Top = 544
  end
end
