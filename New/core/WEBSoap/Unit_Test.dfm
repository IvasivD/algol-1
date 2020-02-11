object FrmTestSynchronizeWebSoap: TFrmTestSynchronizeWebSoap
  Left = -19
  Top = 94
  Width = 1928
  Height = 959
  Caption = #1060#1086#1088#1084#1072' '#1076#1083#1103' '#1090#1077#1089#1090#1091#1074#1072#1085#1085#1103' '#1074#1077#1073' '#1089#1080#1085#1093#1088#1086#1085#1110#1079#1072#1094#1110#1111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 1176
    Top = 56
    Width = 105
    Height = 105
  end
  object ButClearCompanyCountry: TSpeedButton
    Left = 1477
    Top = 176
    Width = 23
    Height = 20
    Hint = #1054#1095#1080#1089#1090#1080#1090#1080' '#1087#1086#1083#1077' '#1087#1086#1096#1091#1082#1091
    Flat = True
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00B9C3C7FF596068FE6F7F85FEFF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00A4B8C2FE506870FF407890FF203840FFA4AB
      B2FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00ADBFC8FE607080FF60B8D0FF40A8C0FF3090B0FF2038
      40FFA4ABB2FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00A4BDCCFE7090A0FF80D0E0FF70D0E0FF60B8D0FF40A8C0FF3090
      B0FF203840FFA4ABB2FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00BEDADEFE80B8C0FF90D8E0FF80E0F0FF80D8F0FF70D0E0FF60B8D0FF40A8
      C0FF3090B0FF304050FFD2CFD2FFFF00FF00FF00FF00FF00FF00FF00FF00CEE6
      F1FF90C0D0FFB0E8F0FFC0F8FFFFA0E8F0FF90E0F0FF80D8F0FF70D0E0FF60B8
      D0FF6098A0FF605850FF504840FFC8C5C3FFFF00FF00FF00FF00B8DBEAFE90D0
      E0FFB0E8F0FFC0FFFFFFC0FFFFFFB0F8FFFFB0F0FFFF90E0F0FF80D8F0FF80B8
      C0FF606060FF808080FF606060FF504840FFF4F3F3FFFF00FF00A0C8E0FFA0D8
      E0FFC0F8FFFFC0FFFFFFC0FFFFFFC0FFFFFFC0FFFFFFB0F8FFFF90C8D0FF8078
      80FFA098A0FF807870FF707070FF505040FFFF00FF00FF00FF00EDF4F6FFB6D4
      DAFE9CC6D4FE80B8C0FFB0F0F0FFC0FFFFFFC0FFFFFFB0E0E0FFA0A0A0FFE0E0
      E0FF908880FFB0A8B0FF505050FF9A909AFEFF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00F7FAFBFF96BDCAFE80B0C0FFB0D8E0FFB0B0B0FFF0E8F0FFD0C8
      C0FFE0D8E0FF808080FF806060FF684A4AFEC8C3C3FFFF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00DFE7EBFFB0B0B0FFE0E0E0FFD0C8D0FFE0E0
      E0FFA0A0A0FFC09890FFD06060FF903840FF684A4AFEC8C3C3FFFF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00E1E1E1FFB0B0B0FFB0B0B0FFB0B0
      B0FFDCD1CEFFB08890FFD09090FFD06060FF903840FF684A4AFEFF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00E7D5D5FFC09090FFE09090FFB06870FF806870FFFF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00EFE5E3FFC29595FEC08890FFE1D4D7FFFF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    OnClick = ButClearCompanyCountryClick
  end
  object lbRam: TLabel
    Left = 1576
    Top = 368
    Width = 29
    Height = 13
    Caption = 'lbRam'
  end
  object Button1: TButton
    Left = 40
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 0
    OnClick = Button1Click
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 72
    Width = 1145
    Height = 217
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = ViewCountry
    end
  end
  object cxGrid2: TcxGrid
    Left = 8
    Top = 296
    Width = 1145
    Height = 217
    TabOrder = 2
    object cxGridDBTableView1: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGridLevel1: TcxGridLevel
      GridView = ViewCity
    end
  end
  object Button2: TButton
    Left = 40
    Top = 40
    Width = 129
    Height = 25
    Caption = 'Log merge User'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 40
    Width = 129
    Height = 25
    Caption = 'Log merge Admin'
    TabOrder = 4
    OnClick = Button3Click
  end
  object cxGrid3: TcxGrid
    Left = 8
    Top = 520
    Width = 369
    Height = 200
    TabOrder = 5
    object cxGrid3DBTableView1: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid3Level1: TcxGridLevel
      GridView = ViewTour
    end
  end
  object cxGrid4: TcxGrid
    Left = 400
    Top = 520
    Width = 361
    Height = 200
    TabOrder = 6
    object cxGridDBTableView2: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGridLevel2: TcxGridLevel
      GridView = ViewTemplate
    end
  end
  object cxGrid5: TcxGrid
    Left = 784
    Top = 520
    Width = 369
    Height = 200
    TabOrder = 7
    object cxGrid5DBTableView1: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid5Level1: TcxGridLevel
      GridView = ViewGroup
    end
  end
  object Button4: TButton
    Left = 504
    Top = 0
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 608
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 728
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Cascade'
    TabOrder = 10
    OnClick = Button6Click
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 721
    Width = 1895
    Height = 243
    Align = alBottom
    TabOrder = 11
    Properties.ActivePage = cxTabSheet2
    ClientRectBottom = 239
    ClientRectLeft = 4
    ClientRectRight = 1891
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      object cxGrid6: TcxGrid
        Left = 0
        Top = 0
        Width = 1361
        Height = 215
        Align = alClient
        TabOrder = 0
        object cxGrid6DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid6Level1: TcxGridLevel
          GridView = ViewTrip
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      object cxGrid7: TcxGrid
        Left = 16
        Top = -8
        Width = 385
        Height = 200
        TabOrder = 0
        object cxGrid7DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid7Level1: TcxGridLevel
          GridView = ViewPeriod
        end
      end
      object cxGrid8: TcxGrid
        Left = 416
        Top = 0
        Width = 433
        Height = 200
        TabOrder = 1
        object cxGridDBTableView3: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel3: TcxGridLevel
          GridView = ViewAGES
        end
      end
      object cxGrid9: TcxGrid
        Left = 912
        Top = 0
        Width = 409
        Height = 200
        TabOrder = 2
        object cxGridDBTableView4: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel4: TcxGridLevel
          GridView = ViewRates
        end
      end
    end
  end
  object Button8: TButton
    Left = 368
    Top = 40
    Width = 105
    Height = 25
    Caption = 'Show Log'
    TabOrder = 12
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 912
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Create Table'
    TabOrder = 13
    OnClick = Button9Click
  end
  object Panel4: TPanel
    Left = 1160
    Top = 400
    Width = 425
    Height = 25
    TabOrder = 14
    object SpeedButton1: TSpeedButton
      Left = 7
      Top = 1
      Width = 25
      Height = 20
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B00007B00007B00007B00
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF7B000000FF0000FF007B0000FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B000000FF0000FF007B00
        00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B00007B
        00007B00007B000000FF0000FF007B00007B00007B00007B0000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF7B000000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF007B0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B000000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF007B0000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF7B00007B00007B00007B000000FF0000FF007B00
        007B00007B00007B000000000000000000000000000000000000000000000000
        00000000007B000000FF0000FF007B0000000000000000FF00FF000000FF00FF
        000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B000000FF0000FF007B00
        00FF00FF000000FF00FF000000FF0000000000FF00FFFF0000FF0000FF0000FF
        00FFFF00007B00007B00007B00007B0000FF00FF000000FF00FF000000FF00FF
        000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FF000000FF0000000000FF00FFFF0000FF0000FF0000FF
        00FFFF0000FF0000FF0000FF0000FF0000FF00FF000000FF00FF000000FF00FF
        000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FF00FF000000FF00FF
        000000FF00FFFF0000FF0000FF0000FF00FFFF0000FF0000FF0000FF0000FF00
        00FF00FF000000FF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FF00FF}
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 33
      Top = 1
      Width = 25
      Height = 20
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF7B00000000FF7B0000FF00FFFF00FFFF00
        FF7B00000000FF7B0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B000000
        00FF0000FF0000FF7B0000FF00FF7B00000000FF0000FF0000FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF7B00000000FF0000FF0000FF7B00000000
        FF0000FF0000FF7B0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF7B00000000FF0000FF0000FF0000FF0000FF7B0000FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B00000000FF0000FF0000
        FF7B0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF7B00000000FF0000FF0000FF0000FF7B0000FF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF7B00000000FF0000FF0000FF0000FF0000
        FF0000FF7B0000FF00FF0000000000000000000000000000000000007B000000
        00FF0000FF0000FF7B00007B00000000FF0000FF0000FF7B0000000000FF00FF
        000000FF00FFFF00FFFF00FFFF00FF7B00000000FF7B0000FF00FFFF00FF7B00
        000000FF0000FF0000FF000000FF0000000000FF00FFFF0000FF0000FF0000FF
        00FF7B00007B0000FF0000FF0000FF00007B00000000FF7B0000000000FF00FF
        000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF7B0000FF00FF000000FF0000000000FF00FFFF0000FF0000FF0000FF
        00FFFF0000FF0000FF0000FF0000FF0000FF00FF000000FF00FF000000FF00FF
        000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FF00FF000000FF00FF
        000000FF00FFFF0000FF0000FF0000FF00FFFF0000FF0000FF0000FF0000FF00
        00FF00FF000000FF00FF00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000FF00FF}
      OnClick = SpeedButton2Click
    end
  end
  object cxGrid10: TcxGrid
    Left = 1160
    Top = 424
    Width = 425
    Height = 217
    TabOrder = 15
    object cxGrid2DBTableView1: TcxGridDBTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = ViewTestTable
    end
  end
  object ProgressBar: TProgressBar
    Left = 1160
    Top = 648
    Width = 425
    Height = 17
    TabOrder = 16
  end
  object Button7: TButton
    Left = 1000
    Top = 16
    Width = 105
    Height = 25
    Caption = 'Create Constraint'
    TabOrder = 17
  end
  object CmbxCompanyCountry: TcxExtLookupComboBox
    Left = 1325
    Top = 176
    Properties.DropDownListStyle = lsEditList
    Properties.DropDownRows = 24
    Properties.IncrementalFiltering = False
    Properties.View = ViewCompanyCountry
    Properties.KeyFieldNames = 'COUNTRYID'
    Properties.OnChange = CmbxCompanyCountryPropertiesChange
    Properties.OnInitPopup = CmbxCompanyCountryPropertiesInitPopup
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 18
    Width = 145
  end
  object cxTextEdit1: TcxTextEdit
    Left = 1320
    Top = 208
    TabOrder = 19
    Text = 'cxTextEdit1'
    Width = 121
  end
  object cxLookupComboBox1: TcxLookupComboBox
    Left = 1328
    Top = 240
    Properties.DropDownListStyle = lsEditList
    Properties.KeyFieldNames = 'COUNTRYID'
    Properties.ListColumns = <
      item
        FieldName = 'NAME'
      end>
    Properties.ListSource = SelCompCntryQrySrc
    Properties.OnChange = cxLookupComboBox1PropertiesChange
    TabOrder = 20
    Width = 169
  end
  object Button10: TButton
    Left = 1552
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Button10'
    TabOrder = 21
    OnClick = Button10Click
  end
  object aTree: TcxDBTreeList
    Left = 728
    Top = 424
    Width = 321
    Height = 265
    Bands = <
      item
      end>
    DataController.DataSource = TestTreeSrc
    DataController.ParentField = 'PAR_ID'
    DataController.KeyField = 'ID'
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    RootValue = -1
    TabOrder = 22
    object aTreeID: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      DataBinding.FieldName = 'ID'
      Width = 49
      Position.ColIndex = 3
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object aTreePAR_ID: TcxDBTreeListColumn
      Visible = False
      Caption.AlignHorz = taCenter
      DataBinding.FieldName = 'PAR_ID'
      Width = 57
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
      SortOrder = soAscending
      SortIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object aTreecxDBTreeACHECK: TcxDBTreeListColumn
      PropertiesClassName = 'TcxCheckBoxProperties'
      Properties.ValueChecked = 1
      Properties.ValueUnchecked = 0
      Properties.OnChange = aTreecxDBTreeACHECKPropertiesChange
      DataBinding.FieldName = 'ACHECK'
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object aTreeCHECK: TcxDBTreeListColumn
      PropertiesClassName = 'TcxTextEditProperties'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Caption.AlignHorz = taCenter
      DataBinding.FieldName = 'ACHECK'
      Width = 97
      Position.ColIndex = 4
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
    object aTreeNAME: TcxDBTreeListColumn
      Caption.AlignHorz = taCenter
      DataBinding.FieldName = 'NAME'
      Width = 229
      Position.ColIndex = 2
      Position.RowIndex = 0
      Position.BandIndex = 0
      Summary.FooterSummaryItems = <>
      Summary.GroupFooterSummaryItems = <>
    end
  end
  object cxCheckBox1: TcxCheckBox
    Left = 1528
    Top = 96
    Caption = 'cxCheckBox1'
    State = cbsChecked
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 23
    Width = 121
  end
  object Button11: TButton
    Left = 1160
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Filter Tree'
    TabOrder = 24
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 1248
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Clera Filter'
    TabOrder = 25
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 1600
    Top = 656
    Width = 75
    Height = 25
    Caption = 'Embassis'
    TabOrder = 26
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 1584
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button14'
    TabOrder = 27
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 1256
    Top = 280
    Width = 105
    Height = 25
    Caption = 'test view files'
    TabOrder = 28
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 1600
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Json Create'
    TabOrder = 29
    OnClick = Button16Click
  end
  object Memo1: TMemo
    Left = 1248
    Top = 464
    Width = 529
    Height = 153
    TabOrder = 30
  end
  object Button17: TButton
    Left = 1688
    Top = 416
    Width = 75
    Height = 25
    Caption = 'XML Create'
    TabOrder = 31
    OnClick = Button17Click
  end
  object Button18: TButton
    Left = 1664
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Translate'
    TabOrder = 32
    OnClick = Button18Click
  end
  object Button19: TButton
    Left = 1664
    Top = 368
    Width = 75
    Height = 25
    Caption = 'Button19'
    TabOrder = 33
    OnClick = Button19Click
  end
  object Button20: TButton
    Left = 504
    Top = 40
    Width = 75
    Height = 25
    Caption = '1c Merge Log'
    TabOrder = 34
    OnClick = Button20Click
  end
  object Chromium1: TChromium
    Left = 40
    Top = 88
    Width = 465
    Height = 257
    TabOrder = 35
  end
  object Button21: TButton
    Left = 1664
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button21'
    TabOrder = 36
    OnClick = Button21Click
  end
  object Memo2: TMemo
    Left = 1528
    Top = 208
    Width = 185
    Height = 89
    Lines.Strings = (
      'ISVENDOR '
      '    ISCLIENT '
      '    ASDRIVE '
      '    ASHOTEL '
      '    ASVISAS '
      '    ASINSUR '
      '    ASEXCRS '
      '    ASREKLM '
      '    ASOTHER '
      '    ASTICKT '
      '    ASTOURS '
      '    ISOTHER '
      '    ISENTERPR '
      '    ISPRIVATE '
      '    ASSCOLL '
      '    ASAPAIR '
      '    ASEMPLS '
      '    ISAGENT '
      '    ISPROPS '
      '    ISGOVERN '
      '    ISBUDGET '
      '    ISPOTENT '
      '    ASFOODS '
      '    ASURIST '
      '    ASMEDIC '
      '    ISHOTEL '
      '    ASRECRE '
      '    ASEXTRM '
      '    FORWORK '
      '    ASMUSEM '
      '    ASXHIBT '
      '    ASAMBAS '
      '    ASCOMMC '
      '    ASCMPTR '
      '    ASSTNRY '
      '    ASFURNT '
      '    ASGOODS '
      '    ASPETRL '
      '    ASMEDIA '
      '    ASCONSL '
      '    ASGUARD '
      '    ASBANKS '
      '    ASLEASE '
      '    ASKOMUN '
      '    ASBUILD '
      '    ASMASTR '
      '    ISBSMAN '
      '    ASPARSL '
      '    ASGUIDE '
      '    TAXPAY '
      '    BUS01 '
      '    BUS02 '
      '    BUS03 '
      '    BUS04 '
      '    BUS05 '
      '    BUS06 '
      '    BUS07 '
      '    BUS08 '
      '    BUS09 '
      '    BUS10 '
      '    BUS11 '
      '    BUS12 '
      '    BUS13 '
      '    BUS14 '
      '    BUS15 '
      '    BUS16 '
      '    BUS17 '
      '    BUS18 '
      '    BUS19 '
      '    ASPARSE '
      '    SEMINAR '
      '    ISTOUROPER '
      '    VIPCLIENT '
      '    BLACKLIST '
      '    LICENSETERMIN '
      '    ASNETAGENT '
      '    ARENEWCONTRACT '
      '    PERMEXTRAAGENT '
      '    ASAUPAIR '
      '    ISFILIYA '
      '    ISHEADOFFICE '
      '    NOTWORK '
      '    ORGFORMINNAME '
      '    WASDELETED '
      '    ASRESIDENT ')
    TabOrder = 37
  end
  object Button22: TButton
    Left = 1728
    Top = 192
    Width = 105
    Height = 25
    Caption = 'Prepare Img Toures'
    TabOrder = 38
    OnClick = Button22Click
  end
  object Button23: TButton
    Left = 1728
    Top = 632
    Width = 75
    Height = 25
    Caption = 'Button23'
    TabOrder = 40
    OnClick = Button23Click
  end
  object Panel1: TPanel
    Left = 136
    Top = 288
    Width = 577
    Height = 385
    Caption = 'Panel1'
    TabOrder = 39
  end
  object Button24: TButton
    Left = 1744
    Top = 696
    Width = 123
    Height = 25
    Caption = 'MergePhoneCodeCity'
    TabOrder = 41
    OnClick = Button24Click
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBDatabase
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 160
    Top = 1
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 'troll:D:\_Apollo\_TOURIB_TEST.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 301
    Top = 1
  end
  object MERGESOAPWEB: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from MERGESOAPWEB')
    Left = 496
    Top = 80
  end
  object HCountrySrc: TDataSource
    DataSet = HCountryQry
    Left = 331
    Top = 125
  end
  object HCitySrc: TDataSource
    DataSet = HCityQry
    Left = 395
    Top = 125
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 664
    Top = 24
    object ViewCountry: TcxGridDBTableView
      DataController.DataSource = HCountrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsView.GroupByBox = False
      object ViewCountryCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
      end
      object ViewCountryNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taBottomJustify
        HeaderAlignmentHorz = taCenter
      end
      object ViewCountryNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
      end
      object ViewCountryLATNAME: TcxGridDBColumn
        DataBinding.FieldName = 'LATNAME'
        Width = 109
      end
      object ViewCountryMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Width = 206
      end
    end
    object ViewCity: TcxGridDBTableView
      DataController.DataSource = HCitySrc
      DataController.KeyFieldNames = 'CITYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCityCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
      end
      object ViewCityCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
      end
      object ViewCityCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY'
      end
      object ViewCityNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Width = 132
      end
      object ViewCityNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
      end
      object ViewCityMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
      end
      object ViewCitySHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        Width = 61
      end
      object ViewCityASRESORT: TcxGridDBColumn
        DataBinding.FieldName = 'ASRESORT'
        Width = 92
      end
      object ViewCityRESORTTYPENAME: TcxGridDBColumn
        DataBinding.FieldName = 'RESORTTYPENAME'
      end
      object ViewCityCalcCityName: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCityName'
      end
    end
  end
  object MERGESOAPWEBDS: TDataSource
    DataSet = MERGESOAPWEB
    Left = 499
    Top = 125
  end
  object HCountryQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      ' select countryid, name, Name_Eng, latname, Memo'
      'from COUNTRIES '
      'order by Name')
    Left = 328
    Top = 80
    object HCountryQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"COUNTRIES"."COUNTRYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object HCountryQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES"."NAME"'
      Size = 30
    end
    object HCountryQryNAME_ENG: TIBStringField
      FieldName = 'NAME_ENG'
      Origin = '"COUNTRIES"."NAME_ENG"'
      Size = 41
    end
    object HCountryQryLATNAME: TIBStringField
      FieldName = 'LATNAME'
      Origin = '"COUNTRIES"."LATNAME"'
      Size = 1
    end
    object HCountryQryMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"COUNTRIES"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object HCityQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = HCountrySrc
    SQL.Strings = (
      'select distinct H.CityId, Ci.CountryId,'
      '  Co.Name as Country, Ci.Name, Ci.Name_Eng, '
      '  Ci.ShowWeb, Ci.Memo, Ci.AsResort, Rt.ItemName ResortTypeName'
      'from Hotels H'
      'left join Cities Ci on Ci.CityId = H.CityId'
      'left join Countries Co on Co.CountryId = Ci.CountryId'
      'left join NameLists Rt on Rt.NameId = Ci.ResortTypeId'
      'where H.CountryId = :CountryId'
      '  and Ci.AsArea is null'
      'union'
      'select Distinct Rl.ResortId, Ci.CountryId,'
      '  Co.Name as Country, Ci.Name, Ci.Name_Eng, '
      '  Ci.ShowWeb, Ci.Memo, Ci.AsResort, Rt.ItemName ResortTypeName'
      'from Hotels H'
      'left join Cities C on C.CityId = H.CityId'
      'left join ResortLinks Rl on Rl.AreaId = C.CityId'
      'left join Cities Ci on Ci.CityId = Rl.ResortId'
      'left join Countries Co on Co.CountryId = Ci.CountryId'
      'left join NameLists Rt on Rt.NameId = Ci.ResortTypeId'
      'where H.CountryId  = :CountryId and C.AsArea = '#39'T'#39
      'order by 4'
      '')
    Left = 392
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CountryId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CountryId'
        ParamType = ptUnknown
      end>
    object HCityQryCITYID: TIntegerField
      DisplayLabel = 'ID '#1052#1110#1089#1090#1072
      FieldName = 'CITYID'
      ProviderFlags = []
    end
    object HCityQryCOUNTRYID: TIntegerField
      DisplayLabel = 'ID '#1082#1088#1072#1111#1085#1080
      FieldName = 'COUNTRYID'
      ProviderFlags = []
    end
    object HCityQryCOUNTRY: TIBStringField
      DisplayLabel = #1050#1088#1072#1111#1085#1072
      FieldName = 'COUNTRY'
      ProviderFlags = []
      Size = 30
    end
    object HCityQryNAME: TIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'NAME'
      ProviderFlags = []
      Size = 190
    end
    object HCityQryNAME_ENG: TIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' ('#1072#1085#1075'.)'
      FieldName = 'NAME_ENG'
      ProviderFlags = []
      Size = 25
    end
    object HCityQrySHOWWEB: TIBStringField
      DisplayLabel = #1055#1086#1082'. '#1074#1077#1073
      FieldName = 'SHOWWEB'
      ProviderFlags = []
      Size = 1
    end
    object HCityQryMEMO: TMemoField
      FieldName = 'MEMO'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object HCityQryASRESORT: TIBStringField
      DisplayLabel = #1040#1057#1088#1077#1096#1086#1088#1090
      FieldName = 'ASRESORT'
      ProviderFlags = []
      Size = 1
    end
    object HCityQryRESORTTYPENAME: TIBStringField
      FieldName = 'RESORTTYPENAME'
      ProviderFlags = []
      Size = 75
    end
  end
  object TMUser: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select TMUSERID, TMFULLNAME from TMUSERS')
    Left = 592
    Top = 80
    object TMUserTMUSERID: TIntegerField
      FieldName = 'TMUSERID'
      Origin = '"TMUSERS"."TMUSERID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TMUserTMFULLNAME: TIBStringField
      FieldName = 'TMFULLNAME'
      Origin = '"TMUSERS"."TMFULLNAME"'
      Size = 35
    end
  end
  object TMUserDS: TDataSource
    DataSet = TMUser
    Left = 595
    Top = 125
  end
  object TourQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'Select * From Sel_Tours_Proc  '
      'where IsDisabled is null or IsDisabled = '#39'F'#39
      'order by TourName'
      ''
      '')
    Left = 832
    Top = 8
    object TourQryTOURNAME: TIBStringField
      FieldName = 'TOURNAME'
      Origin = '"SEL_TOURS_PROC"."TOURNAME"'
      Size = 255
    end
    object TourQryID: TIntegerField
      FieldName = 'ID'
      Origin = '"SEL_TOURS_PROC"."ID"'
    end
    object TourQryPARENT: TIntegerField
      FieldName = 'PARENT'
      Origin = '"SEL_TOURS_PROC"."PARENT"'
    end
    object TourQryGRP: TIBStringField
      FieldName = 'GRP'
      Origin = '"SEL_TOURS_PROC"."GRP"'
      Size = 1
    end
    object TourQryIND: TIBStringField
      FieldName = 'IND'
      Origin = '"SEL_TOURS_PROC"."IND"'
      Size = 1
    end
    object TourQryISDISABLED: TIBStringField
      FieldName = 'ISDISABLED'
      Origin = '"SEL_TOURS_PROC"."ISDISABLED"'
      Size = 1
    end
    object TourQrySHOWWEB: TIBStringField
      FieldName = 'SHOWWEB'
      Origin = '"SEL_TOURS_PROC"."SHOWWEB"'
      Size = 1
    end
    object TourQryCANADDGROUP: TIBStringField
      FieldName = 'CANADDGROUP'
      Origin = '"SEL_TOURS_PROC"."CANADDGROUP"'
      Size = 1
    end
    object TourQryISPSEUDO: TIBStringField
      FieldName = 'ISPSEUDO'
      Origin = '"SEL_TOURS_PROC"."ISPSEUDO"'
      Size = 1
    end
    object TourQryISARHIVED: TIBStringField
      FieldName = 'ISARHIVED'
      Origin = '"SEL_TOURS_PROC"."ISARHIVED"'
      Size = 1
    end
    object TourQryBONUSPROGRAMID: TIntegerField
      FieldName = 'BONUSPROGRAMID'
      Origin = '"SEL_TOURS_PROC"."BONUSPROGRAMID"'
    end
    object TourQryMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"SEL_TOURS_PROC"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TourQryMANAGERID: TIntegerField
      FieldName = 'MANAGERID'
      Origin = '"SEL_TOURS_PROC"."MANAGERID"'
    end
    object TourQryLOCALENAMES: TMemoField
      FieldName = 'LOCALENAMES'
      Origin = '"SEL_TOURS_PROC"."LOCALENAMES"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TourQrySHORTTOURNAME: TIBStringField
      FieldName = 'SHORTTOURNAME'
      Origin = '"SEL_TOURS_PROC"."SHORTTOURNAME"'
      Size = 10
    end
    object TourQryBONUSFROMDATE: TDateTimeField
      FieldName = 'BONUSFROMDATE'
      Origin = '"SEL_TOURS_PROC"."BONUSFROMDATE"'
    end
    object TourQryBONUSTILLDATE: TDateTimeField
      FieldName = 'BONUSTILLDATE'
      Origin = '"SEL_TOURS_PROC"."BONUSTILLDATE"'
    end
    object TourQryBONUSFROMSHOWWEB: TIBStringField
      FieldName = 'BONUSFROMSHOWWEB'
      Origin = '"SEL_TOURS_PROC"."BONUSFROMSHOWWEB"'
      Size = 1
    end
    object TourQryBONUSTILLSHOWWEB: TIBStringField
      FieldName = 'BONUSTILLSHOWWEB'
      Origin = '"SEL_TOURS_PROC"."BONUSTILLSHOWWEB"'
      Size = 1
    end
    object TourQrySPECIALDATEID: TIntegerField
      FieldName = 'SPECIALDATEID'
      Origin = '"SEL_TOURS_PROC"."SPECIALDATEID"'
    end
    object TourQryMANAGER: TIBStringField
      FieldName = 'MANAGER'
      Origin = '"SEL_TOURS_PROC"."MANAGER"'
      Size = 50
    end
    object TourQryPROGRAMNAME: TIBStringField
      FieldName = 'PROGRAMNAME'
      Origin = '"SEL_TOURS_PROC"."PROGRAMNAME"'
      Size = 30
    end
    object TourQrySPECIALNAME: TIBStringField
      FieldName = 'SPECIALNAME'
      Origin = '"SEL_TOURS_PROC"."SPECIALNAME"'
      Size = 150
    end
    object TourQryAREACTIVEPROMO: TIntegerField
      FieldName = 'AREACTIVEPROMO'
      Origin = '"SEL_TOURS_PROC"."AREACTIVEPROMO"'
    end
    object TourQryHITSALES: TIBStringField
      FieldName = 'HITSALES'
      Origin = '"SEL_TOURS_PROC"."HITSALES"'
      Size = 1
    end
    object TourQryISDEPART: TIBStringField
      FieldName = 'ISDEPART'
      Origin = '"SEL_TOURS_PROC"."ISDEPART"'
      Size = 1
    end
  end
  object TourSrc: TDataSource
    DataSet = TourQry
    Left = 816
    Top = 48
  end
  object TemplQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TourSrc
    SQL.Strings = (
      'select T.*, V.VariantName,'
      '  G.TourDate, Co.Name as Vendor'
      'from TourTemplates T'
      '  left join TourVariants V on V.TourVariantId = T.TourVariantId'
      '  left join Companies Co on Co.CompanyId = T.VendorId'
      '  left join TourGroups G on G.TourGroupId = T.TourGroupId'
      'where T.TourId = :Id'
      'order by T.TemplateName')
    Left = 800
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Size = 4
      end>
    object TemplQryTOURID: TIntegerField
      FieldName = 'TOURID'
    end
    object TemplQryTOURGROUPID: TIntegerField
      FieldName = 'TOURGROUPID'
    end
    object TemplQryTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
    end
    object TemplQryTEMPLATENAME: TStringField
      DisplayLabel = #1064#1072#1073#1083#1086#1085
      FieldName = 'TEMPLATENAME'
      Size = 60
    end
    object TemplQryTOURTIME: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1055#1086#1095#1072#1090#1086#1082
      FieldName = 'TOURTIME'
      DisplayFormat = 'hh:nn'
    end
    object TemplQryDAYCOUNT: TSmallintField
      Alignment = taCenter
      DisplayLabel = #1058#1088#1080#1074'.'
      FieldName = 'DAYCOUNT'
    end
    object TemplQryDISABLED: TStringField
      FieldName = 'DISABLED'
      Size = 1
    end
    object TemplQrySHOWWEB: TStringField
      FieldName = 'SHOWWEB'
      Size = 1
    end
    object TemplQryGROUPMIN: TSmallintField
      DisplayLabel = #1052#1110#1085'.'#1086#1089#1110#1073
      FieldName = 'GROUPMIN'
    end
    object TemplQryGROUPMAX: TSmallintField
      DisplayLabel = #1052#1072#1082#1089'.'#1086#1089#1110#1073
      FieldName = 'GROUPMAX'
    end
    object TemplQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 1
    end
    object TemplQryVARIANTNAME: TStringField
      DisplayLabel = #1042#1072#1088#1110#1072#1085#1090' '#1090#1091#1088#1091
      FieldName = 'VARIANTNAME'
      Size = 60
    end
    object TemplQryTOURDATE: TDateTimeField
      FieldName = 'TOURDATE'
    end
    object TemplQryVENDOR: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
      FieldName = 'VENDOR'
      Size = 60
    end
    object TemplQryORDERMEMO: TMemoField
      FieldName = 'ORDERMEMO'
      BlobType = ftMemo
      Size = 1
    end
    object TemplQryVENDORID: TIntegerField
      FieldName = 'VENDORID'
      Origin = '"TOURTEMPLATES"."VENDORID"'
    end
    object TemplQryPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"TOURTEMPLATES"."PARENTID"'
    end
    object TemplQryTOURVARIANTID: TIntegerField
      FieldName = 'TOURVARIANTID'
      Origin = '"TOURTEMPLATES"."TOURVARIANTID"'
    end
    object TemplQryBONUSCHECKTRIP: TIBStringField
      FieldName = 'BONUSCHECKTRIP'
      Origin = '"TOURTEMPLATES"."BONUSCHECKTRIP"'
      Size = 1
    end
    object TemplQryBONUSCHECKHOTEL: TIBStringField
      FieldName = 'BONUSCHECKHOTEL'
      Origin = '"TOURTEMPLATES"."BONUSCHECKHOTEL"'
      Size = 1
    end
    object TemplQryBONUSCHECKINSURE: TIBStringField
      FieldName = 'BONUSCHECKINSURE'
      Origin = '"TOURTEMPLATES"."BONUSCHECKINSURE"'
      Size = 1
    end
    object TemplQryBONUSCHECKVISA: TIBStringField
      FieldName = 'BONUSCHECKVISA'
      Origin = '"TOURTEMPLATES"."BONUSCHECKVISA"'
      Size = 1
    end
    object TemplQryBONUSCHECKEXCURS: TIBStringField
      FieldName = 'BONUSCHECKEXCURS'
      Origin = '"TOURTEMPLATES"."BONUSCHECKEXCURS"'
      Size = 1
    end
    object TemplQryBONUSCHECKOTHER: TIBStringField
      FieldName = 'BONUSCHECKOTHER'
      Origin = '"TOURTEMPLATES"."BONUSCHECKOTHER"'
      Size = 1
    end
  end
  object TemplSrc: TDataSource
    DataSet = TemplQry
    Left = 832
    Top = 120
  end
  object cxGridViewRepository: TcxGridViewRepository
    Left = 696
    Top = 104
    object ViewStops: TcxGridDBTableView
      DataController.KeyFieldNames = 'sheditemid'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.GroupByBox = False
      object ViewStopsSHEDITEMID: TcxGridDBColumn
        DataBinding.FieldName = 'SHEDITEMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
      end
      object ViewStopsSTOPORDER: TcxGridDBColumn
        DataBinding.FieldName = 'STOPORDER'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object ViewStopsCOUNTRYNAME: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'COUNTRYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 112
      end
      object ViewStopsCITYNAME: TcxGridDBColumn
        Caption = #1052#1110#1089#1090#1086
        DataBinding.FieldName = 'CITYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 127
      end
      object ViewStopsARRIVETIME: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1087#1088#1080#1073#1091#1090#1090#1103
        DataBinding.FieldName = 'ARRIVETIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 108
      end
      object ViewStopsDEPARTTIME: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1074#1110#1076#1087#1088#1072#1074#1083#1077#1085#1085#1103
        DataBinding.FieldName = 'DEPARTTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 108
      end
      object ViewStopsARRIVEDAY: TcxGridDBColumn
        Caption = #1044#1077#1085#1100' '#1087#1088#1080#1073#1091#1090#1090#1103
        DataBinding.FieldName = 'ARRIVEDAY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 108
      end
      object ViewStopsDEPARTDAY: TcxGridDBColumn
        Caption = #1044#1077#1085#1100' '#1074#1110#1076#1087#1088#1072#1074#1083#1077#1085#1085#1103
        DataBinding.FieldName = 'DEPARTDAY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Sorting = False
        Width = 108
      end
    end
    object ViewHotels: TcxGridDBTableView
      DataController.KeyFieldNames = 'TOURROOMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.GroupByBox = False
      object ViewHotelsTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsTOURROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURROOMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsSTARS: TcxGridDBColumn
        DataBinding.FieldName = 'STARS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsCITY: TcxGridDBColumn
        DataBinding.FieldName = 'CITY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 133
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 133
      end
      object ViewHotelsCalcHotel: TcxGridDBColumn
        DataBinding.FieldName = 'CalcHotel'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 133
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 133
      end
      object ViewHotelsBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 37
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 37
      end
      object ViewHotelsDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 37
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 37
      end
      object ViewHotelsFROMTIME: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1087#1086#1089#1077#1083#1077#1085#1085#1103
        DataBinding.FieldName = 'FROMTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 85
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 85
      end
      object ViewHotelsTILLTIME: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1074#1080#1089#1077#1083#1077#1085#1085#1103
        DataBinding.FieldName = 'TILLTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 88
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 88
      end
      object ViewHotelsGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 65
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 65
      end
      object ViewHotelsFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 67
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 67
      end
      object ViewHotelsFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 68
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 68
      end
      object ViewHotelsCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 29
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 29
      end
      object ViewHotelsVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'VENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 151
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 151
      end
      object ViewHotelsFROMDATE: TcxGridDBColumn
        DataBinding.FieldName = 'FROMDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsCalcTillDate: TcxGridDBColumn
        DataBinding.FieldName = 'CalcTillDate'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewHotelsCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY'
        Visible = False
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
    end
    object ViewDescription: TcxGridDBTableView
      DataController.KeyFieldNames = 'TOURDESCRIPTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.GroupByBox = False
      object ViewDescriptionTOURDESCRIPTID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURDESCRIPTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 170
      end
      object ViewDescriptionTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 110
      end
      object ViewDescriptionNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 280
      end
    end
    object ViewExcurs: TcxGridDBTableView
      DataController.KeyFieldNames = 'TOUREXCURID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.GroupByBox = False
      object ViewExcursTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursTOUREXCURID: TcxGridDBColumn
        DataBinding.FieldName = 'TOUREXCURID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursEXCURSID: TcxGridDBColumn
        DataBinding.FieldName = 'EXCURSID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursCITY: TcxGridDBColumn
        DataBinding.FieldName = 'CITY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 134
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 134
      end
      object ViewExcursNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 149
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 149
      end
      object ViewExcursBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 36
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 36
      end
      object ViewExcursCalcExTime: TcxGridDBColumn
        DataBinding.FieldName = 'CalcExTime'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 40
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 40
      end
      object ViewExcursEXTIME: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1087#1086#1095#1072#1090#1082#1091
        DataBinding.FieldName = 'EXTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 95
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 95
      end
      object ViewExcursTILLTIME: TcxGridDBColumn
        Caption = #1063#1072#1089' '#1079#1072#1082#1110#1085#1095#1077#1085#1085#1103
        DataBinding.FieldName = 'TILLTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 98
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 98
      end
      object ViewExcursTYPEEX: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEEX'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 90
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 90
      end
      object ViewExcursDRIVE: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 91
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 91
      end
      object ViewExcursGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursATDATE: TcxGridDBColumn
        DataBinding.FieldName = 'ATDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'VENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewExcursPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
    end
    object ViewOther: TcxGridDBTableView
      DataController.KeyFieldNames = 'TOUROTHERID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewOtherTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherTOUROTHERID: TcxGridDBColumn
        DataBinding.FieldName = 'TOUROTHERID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherSERVCODEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCODEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherSERVNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SERVNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 200
      end
      object ViewOtherBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherEXTIME: TcxGridDBColumn
        Caption = #1063#1072#1089
        DataBinding.FieldName = 'EXTIME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherCITY: TcxGridDBColumn
        DataBinding.FieldName = 'CITY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherATDATE: TcxGridDBColumn
        DataBinding.FieldName = 'ATDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 67
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 67
      end
      object ViewOtherNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 69
      end
      object ViewOtherRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 72
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 72
      end
      object ViewOtherFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 77
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 77
      end
      object ViewOtherCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 36
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 36
      end
      object ViewOtherDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherCalcExTime: TcxGridDBColumn
        DataBinding.FieldName = 'CalcExTime'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewOtherVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'VENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 135
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 135
      end
    end
    object ViewOtherList: TcxGridDBTableView
      DataController.KeyFieldNames = 'TOUROTHERID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewOtherListTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListTOUROTHERID: TcxGridDBColumn
        DataBinding.FieldName = 'TOUROTHERID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListSERVCODEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVCODEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListSERVNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SERVNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 245
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Width = 245
      end
      object ViewOtherListCITY: TcxGridDBColumn
        DataBinding.FieldName = 'CITY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListATDATE: TcxGridDBColumn
        DataBinding.FieldName = 'ATDATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListEXTIME: TcxGridDBColumn
        Caption = #1063#1072#1089
        DataBinding.FieldName = 'EXTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'VENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
      object ViewOtherListCalcExTime: TcxGridDBColumn
        DataBinding.FieldName = 'CalcExTime'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
      end
    end
    object ViewTemplate: TcxGridDBTableView
      DataController.DataSource = TemplSrc
      DataController.KeyFieldNames = 'TOURTEMPLATEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewTemplateTOURID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateTOURGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURGROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateTEMPLATENAME: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLATENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 187
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 187
      end
      object ViewTemplateTOURTIME: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTIME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 48
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 48
      end
      object ViewTemplateDAYCOUNT: TcxGridDBColumn
        Caption = #1058#1088#1080#1074#1072#1083#1110#1089#1090#1100' '#1090#1091#1088#1091
        DataBinding.FieldName = 'DAYCOUNT'
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 32
      end
      object ViewTemplateDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateVARIANTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'VARIANTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 190
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 190
      end
      object ViewTemplateTOURDATE: TcxGridDBColumn
        DataBinding.FieldName = 'TOURDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 112
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'VENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 364
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateORDERMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'ORDERMEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplatePARENTID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateTOURVARIANTID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURVARIANTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateBONUSCHECKTRIP: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKTRIP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateBONUSCHECKHOTEL: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKHOTEL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateBONUSCHECKINSURE: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKINSURE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateBONUSCHECKVISA: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKVISA'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateBONUSCHECKEXCURS: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKEXCURS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewTemplateBONUSCHECKOTHER: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKOTHER'
        Visible = False
        MinWidth = 10
        Options.Filtering = False
        Options.Focusing = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
    end
    object ViewGroup: TcxGridDBTableView
      DataController.DataSource = GroupSrc
      DataController.KeyFieldNames = 'TOURGROUPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewGroupTOURGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURGROUPID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 48
      end
      object ViewGroupTOURDATE: TcxGridDBColumn
        DataBinding.FieldName = 'TOURDATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 114
      end
      object ViewGroupMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewGroupTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewGroupTEMPLATENAME: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLATENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 166
      end
      object ViewGroupVARIANTNAME: TcxGridDBColumn
        DataBinding.FieldName = 'VARIANTNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 176
      end
      object ViewGroupTOURVARIANTID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURVARIANTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewCostSum: TcxGridDBTableView
      DataController.KeyFieldNames = 'RATECURRID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewCostSumRATECURRID: TcxGridDBColumn
        DataBinding.FieldName = 'RATECURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewCostSumNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewCostSumRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewCostSumAGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewCostSumFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
      end
      object ViewCostSumCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 32
      end
    end
    object ViewCost: TcxGridDBTableView
      DataController.KeyFieldNames = 'RATECURRID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewCostSERVKIND: TcxGridDBColumn
        DataBinding.FieldName = 'SERVKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCostRATECURRID: TcxGridDBColumn
        DataBinding.FieldName = 'RATECURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCostCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCostNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCostRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCostAGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCostFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCostCalcService: TcxGridDBColumn
        DataBinding.FieldName = 'CalcService'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewTour: TcxGridDBTableView
      DataController.DataSource = TourSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewTourID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 32
      end
      object ViewTourTOURNAME: TcxGridDBColumn
        DataBinding.FieldName = 'TOURNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 320
      end
      object ViewTourSPECIALDATEID: TcxGridDBColumn
        DataBinding.FieldName = 'SPECIALDATEID'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <>
        Properties.ShowDescriptions = False
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 30
      end
      object ViewTourPROGRAMNAME: TcxGridDBColumn
        DataBinding.FieldName = 'PROGRAMNAME'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 30
      end
      object ViewTourAREACTIVEPROMO: TcxGridDBColumn
        DataBinding.FieldName = 'AREACTIVEPROMO'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
          end
          item
            Value = 0
          end
          item
            ImageIndex = 62
            Value = 1
          end>
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 30
      end
      object ViewTourSHORTTOURNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHORTTOURNAME'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 40
      end
      object ViewTourCOUNTRYCODE: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYCODE'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourIND: TcxGridDBColumn
        DataBinding.FieldName = 'IND'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Value = 'F'
          end
          item
          end
          item
            ImageIndex = 43
            Value = 'T'
          end>
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 25
      end
      object ViewTourGRP: TcxGridDBColumn
        DataBinding.FieldName = 'GRP'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
          end
          item
            Value = 'F'
          end
          item
            ImageIndex = 43
            Value = 'T'
          end>
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 25
      end
      object ViewTourSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
          end
          item
            Value = 'F'
          end
          item
            ImageIndex = 61
            Value = 'T'
          end>
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 25
      end
      object ViewTourCalcDayCount: TcxGridDBColumn
        DataBinding.FieldName = 'CalcDayCount'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 90
      end
      object ViewTourMANAGER: TcxGridDBColumn
        DataBinding.FieldName = 'MANAGER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 110
      end
      object ViewTourPRIORCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'PRIORCOUNTRY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourISDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'ISDISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourISPSEUDO: TcxGridDBColumn
        DataBinding.FieldName = 'ISPSEUDO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourCANADDGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'CANADDGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourMANAGERID: TcxGridDBColumn
        DataBinding.FieldName = 'MANAGERID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourISARHIVED: TcxGridDBColumn
        DataBinding.FieldName = 'ISARHIVED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourBONUSPROGRAMID: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSPROGRAMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourREADYTODAYS: TcxGridDBColumn
        DataBinding.FieldName = 'READYTODAYS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourCUSTOMLIST1: TcxGridDBColumn
        DataBinding.FieldName = 'CUSTOMLIST1'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourCUSTOMLIST2: TcxGridDBColumn
        DataBinding.FieldName = 'CUSTOMLIST2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourTEMPLAT: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourDAYCOUNTMORE: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNTMORE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourDAYCOUNTNIGHT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNTNIGHT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourLOCALENAMES: TcxGridDBColumn
        DataBinding.FieldName = 'LOCALENAMES'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourBONUSFROMDATE: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSFROMDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourBONUSFROMSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSFROMSHOWWEB'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourBONUSTILLDATE: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSTILLDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourBONUSTILLSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSTILLSHOWWEB'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourSPECIALNAME: TcxGridDBColumn
        DataBinding.FieldName = 'SPECIALNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewTourTRIPROUTEID: TcxGridDBColumn
        DataBinding.FieldName = 'TRIPROUTEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewVisa: TcxGridDBTableView
      DataController.KeyFieldNames = 'TOURVISAID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewVisaTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaTOURVISAID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURVISAID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 172
      end
      object ViewVisaBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 36
      end
      object ViewVisaFROMDATE: TcxGridDBColumn
        DataBinding.FieldName = 'FROMDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 36
      end
      object ViewVisaGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 33
      end
      object ViewVisaNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 67
      end
      object ViewVisaVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'VENDOR'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 150
      end
      object ViewVisaCalcTillDate: TcxGridDBColumn
        DataBinding.FieldName = 'CalcTillDate'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaRATECURRID: TcxGridDBColumn
        DataBinding.FieldName = 'RATECURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaAGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaAGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaAGENTWHO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaAGENTWHO2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVAT: TcxGridDBColumn
        DataBinding.FieldName = 'VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVAT2: TcxGridDBColumn
        DataBinding.FieldName = 'VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaAGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaAGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaGROUPCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPCURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaGRATISPERSONCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISPERSONCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaGRATISBYVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISBYVENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaNETCHECK: TcxGridDBColumn
        DataBinding.FieldName = 'NETCHECK'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV1_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaV2_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVISAKIND: TcxGridDBColumn
        DataBinding.FieldName = 'VISAKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVISAFOR: TcxGridDBColumn
        DataBinding.FieldName = 'VISAFOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaENTRYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'ENTRYCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVALIDDAYS: TcxGridDBColumn
        DataBinding.FieldName = 'VALIDDAYS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaARRIVECUSTOMID: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVECUSTOMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaDEPARTCUSTOMID: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTCUSTOMID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaGARANTID: TcxGridDBColumn
        DataBinding.FieldName = 'GARANTID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaGARANTOFFICEID: TcxGridDBColumn
        DataBinding.FieldName = 'GARANTOFFICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaGARANTPHONEID: TcxGridDBColumn
        DataBinding.FieldName = 'GARANTPHONEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaADDRESSTOID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRESSTOID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaADDRTOPHONEID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDRTOPHONEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaTRAVELKIND: TcxGridDBColumn
        DataBinding.FieldName = 'TRAVELKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaDRIVEKINDID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEKINDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaVALIDDATE: TcxGridDBColumn
        DataBinding.FieldName = 'VALIDDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaPERIODDAYS: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODDAYS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaENTRYCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'ENTRYCOUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaCUSTCOSTS: TcxGridDBColumn
        DataBinding.FieldName = 'CUSTCOSTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewVisaSPONSORCOSTS: TcxGridDBColumn
        DataBinding.FieldName = 'SPONSORCOSTS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
    object ViewInsure: TcxGridDBTableView
      DataController.KeyFieldNames = 'TOURINSUREID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewInsureTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureTOURINSUREID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURINSUREID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureKINDNAME: TcxGridDBColumn
        DataBinding.FieldName = 'KINDNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureINSUREVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'INSUREVALUE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 32
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Width = 32
      end
      object ViewInsureFROMDATE: TcxGridDBColumn
        DataBinding.FieldName = 'FROMDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureINSURECURR: TcxGridDBColumn
        DataBinding.FieldName = 'INSURECURR'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'VENDOR'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 145
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
        Width = 145
      end
      object ViewInsureNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureCalcTillDate: TcxGridDBColumn
        DataBinding.FieldName = 'CalcTillDate'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsurePERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureINSUREKIND: TcxGridDBColumn
        DataBinding.FieldName = 'INSUREKIND'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureINSUREVALUEID: TcxGridDBColumn
        DataBinding.FieldName = 'INSUREVALUEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureRATECURRID: TcxGridDBColumn
        DataBinding.FieldName = 'RATECURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureAGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureAGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureAGENTWHO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureAGENTWHO2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureVATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureVAT: TcxGridDBColumn
        DataBinding.FieldName = 'VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureVATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureVAT2: TcxGridDBColumn
        DataBinding.FieldName = 'VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureAGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureAGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureGROUPCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPCURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureGRATISPERSONCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISPERSONCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureGRATISBYVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISBYVENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureNETCHECK: TcxGridDBColumn
        DataBinding.FieldName = 'NETCHECK'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV1_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureV2_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureINSUREDAYS: TcxGridDBColumn
        DataBinding.FieldName = 'INSUREDAYS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureRATECOST: TcxGridDBColumn
        DataBinding.FieldName = 'RATECOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureINSUREIDENT: TcxGridDBColumn
        DataBinding.FieldName = 'INSUREIDENT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
      object ViewInsureDAYCOUNT1: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT1'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Options.HorzSizing = False
      end
    end
    object ViewTrip: TcxGridDBTableView
      DataController.DataSource = TripSrc
      DataController.KeyFieldNames = 'TOURTRIPID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewTripTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripTOURTRIPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTRIPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripDRIVEKIND: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEKIND'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripROUTEID: TcxGridDBColumn
        DataBinding.FieldName = 'ROUTEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripROUTENAME: TcxGridDBColumn
        DataBinding.FieldName = 'ROUTENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripFROMCITY: TcxGridDBColumn
        DataBinding.FieldName = 'FROMCITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripCalcFromCity: TcxGridDBColumn
        DataBinding.FieldName = 'CalcFromCity'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripCalcArriveCity: TcxGridDBColumn
        DataBinding.FieldName = 'CalcArriveCity'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripARRIVECITY: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVECITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSHEDULENAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHEDULENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripDIRECTION: TcxGridDBColumn
        DataBinding.FieldName = 'DIRECTION'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 49
      end
      object ViewTripCalcDepartTime: TcxGridDBColumn
        DataBinding.FieldName = 'CalcDepartTime'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 41
      end
      object ViewTripCalcArriveTime: TcxGridDBColumn
        DataBinding.FieldName = 'CalcArriveTime'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 46
      end
      object ViewTripCalcStartPoint: TcxGridDBColumn
        DataBinding.FieldName = 'CalcStartPoint'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripCalcStopPoint: TcxGridDBColumn
        DataBinding.FieldName = 'CalcStopPoint'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripCURRENCYSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'CURRENCYSHORT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 43
      end
      object ViewTripTRIPID: TcxGridDBColumn
        DataBinding.FieldName = 'TRIPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripDRIVEKINDID: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEKINDID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripDRIVEKINDSHORT: TcxGridDBColumn
        DataBinding.FieldName = 'DRIVEKINDSHORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripLEAVEDATE: TcxGridDBColumn
        DataBinding.FieldName = 'LEAVEDATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSHEDULEID: TcxGridDBColumn
        DataBinding.FieldName = 'SHEDULEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripDEPARTFTIME: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTFTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripDEPARTBTIME: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTBTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripARRIVEBTIME: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVEBTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripARRIVEFTIME: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVEFTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSTARTCITY: TcxGridDBColumn
        DataBinding.FieldName = 'STARTCITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSTOPCITY: TcxGridDBColumn
        DataBinding.FieldName = 'STOPCITY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSTARTADDRESS: TcxGridDBColumn
        DataBinding.FieldName = 'STARTADDRESS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSTOPADDRESS: TcxGridDBColumn
        DataBinding.FieldName = 'STOPADDRESS'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripTRIPBACKID: TcxGridDBColumn
        DataBinding.FieldName = 'TRIPBACKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripRATECURRID: TcxGridDBColumn
        DataBinding.FieldName = 'RATECURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripAGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripAGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripAGENTWHO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripAGENTWHO2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripVATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripVAT: TcxGridDBColumn
        DataBinding.FieldName = 'VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripVATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripVAT2: TcxGridDBColumn
        DataBinding.FieldName = 'VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripAGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripAGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripGROUPCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPCURRID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripGRATISPERSONCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISPERSONCOUNT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripGRATISBYVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISBYVENDOR'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripNETCHECK: TcxGridDBColumn
        DataBinding.FieldName = 'NETCHECK'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV1_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripV2_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripRETURNDAY: TcxGridDBColumn
        DataBinding.FieldName = 'RETURNDAY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSTARTPOINT: TcxGridDBColumn
        DataBinding.FieldName = 'STARTPOINT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
      object ViewTripSTOPPOINT: TcxGridDBColumn
        DataBinding.FieldName = 'STOPPOINT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 100
      end
    end
    object ViewRates: TcxGridDBTableView
      DataController.DataSource = TR_RATES_DS
      DataController.KeyFieldNames = 'TOURRATEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewRatesTOURRATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURRATEID'
      end
      object ViewRatesPERIODID: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODID'
      end
      object ViewRatesAGEID: TcxGridDBColumn
        DataBinding.FieldName = 'AGEID'
      end
      object ViewRatesV1_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE'
      end
      object ViewRatesV1_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY'
      end
      object ViewRatesV1_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL'
      end
      object ViewRatesV2_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE'
      end
      object ViewRatesV2_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY'
      end
      object ViewRatesV2_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL'
      end
      object ViewRatesV1_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE2'
      end
      object ViewRatesV1_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY2'
      end
      object ViewRatesV1_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL2'
      end
      object ViewRatesV2_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE2'
      end
      object ViewRatesV2_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY2'
      end
      object ViewRatesV2_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL2'
      end
    end
    object ViewAGES: TcxGridDBTableView
      DataController.DataSource = TR_AGES_DS
      DataController.KeyFieldNames = 'AGEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewAGESAGEID: TcxGridDBColumn
        DataBinding.FieldName = 'AGEID'
      end
      object ViewAGESSERVKINDID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVKINDID'
      end
      object ViewAGESSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
      end
      object ViewAGESAGEFROM: TcxGridDBColumn
        DataBinding.FieldName = 'AGEFROM'
      end
      object ViewAGESAGETILL: TcxGridDBColumn
        DataBinding.FieldName = 'AGETILL'
      end
      object ViewAGESNAMEID: TcxGridDBColumn
        DataBinding.FieldName = 'NAMEID'
      end
      object ViewAGESISBASEAGE: TcxGridDBColumn
        DataBinding.FieldName = 'ISBASEAGE'
      end
    end
    object ViewPeriod: TcxGridDBTableView
      DataController.DataSource = TR_PERIODS_DS
      DataController.KeyFieldNames = 'PERIODID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewPeriodPERIODID: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODID'
      end
      object ViewPeriodSERVKINDID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVKINDID'
      end
      object ViewPeriodSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
      end
      object ViewPeriodPERIODFROM: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODFROM'
      end
      object ViewPeriodPERIODTILL: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTILL'
      end
      object ViewPeriodFROMDATE: TcxGridDBColumn
        DataBinding.FieldName = 'FROMDATE'
      end
      object ViewPeriodTILLDATE: TcxGridDBColumn
        DataBinding.FieldName = 'TILLDATE'
      end
      object ViewPeriodNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
    end
  end
  object TripQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TemplSrc
    SQL.Strings = (
      'select T.*,T.TourTripID ServiceId,'
      
        '  R.DriveKind as DriveKindId, K.Kind as DriveKind, K.KindShort a' +
        's DriveKindShort,'
      '  A.Name as FromCity, B.Name as ArriveCity, S.SheduleName,'
      '  S.DepartFTime, S.ArriveFTime, S.DepartBTime, S.ArriveBTime,'
      '  S1.StopCity as StartCity, S2.StopCity,'
      '  S1.StopAddress as StartAddress, S2.StopAddress,'
      '  L.LeaveDate, '
      '  Cu.CurrencyShort, R.Name RouteName'
      'from TourTrips T'
      '  left join Routes R on R.RouteId = T.RouteId'
      
        '  left join Shedules S on S.RouteId = T.RouteId and S.SheduleId ' +
        '= T.SheduleId'
      '  left join ShedItems I1 on I1.ShedItemId = T.StartPoint'
      '  left join ShedItems I2 on I2.ShedItemId = T.StopPoint'
      '  left join Stops_VIEW S1 on S1.StopId = I1.StopId'
      '  left join Stops_VIEW S2 on S2.StopId = I2.StopId'
      
        '  left join Leavings L on L.RouteId = T.RouteId and L.LeavingId ' +
        '= T.TripId'
      '  left join DrvKinds K on K.DriveKind = R.DriveKind'
      '  left join Cities A on A.CityId = R.FromCity'
      '  left join Cities B on B.CityId = R.ArriveCity'
      '  left join Currency Cu on Cu.CurrencyId = T.RateCurrId'
      'where T.TourTemplateId = :TourTemplateId'
      'order by TourTripId')
    Left = 1016
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TOURTEMPLATEID'
        ParamType = ptUnknown
        Size = 4
      end>
    object TripQryTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
    end
    object TripQryTOURTRIPID: TIntegerField
      FieldName = 'TOURTRIPID'
    end
    object TripQryROUTEID: TIntegerField
      DisplayLabel = #8470' '#1084#1072#1088#1096#1088#1091#1090#1091
      FieldName = 'ROUTEID'
    end
    object TripQrySHEDULEID: TIntegerField
      FieldName = 'SHEDULEID'
    end
    object TripQryBEGINDAY: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1044#1077#1085#1100
      FieldName = 'BEGINDAY'
    end
    object TripQryTRIPID: TIntegerField
      FieldName = 'TRIPID'
    end
    object TripQryDRIVEKINDID: TIntegerField
      FieldName = 'DRIVEKINDID'
    end
    object TripQryDRIVEKIND: TStringField
      DisplayLabel = #1058#1088'-'#1088#1090
      FieldName = 'DRIVEKIND'
      Size = 15
    end
    object TripQryDRIVEKINDSHORT: TStringField
      FieldName = 'DRIVEKINDSHORT'
      Size = 5
    end
    object TripQrySHEDULENAME: TStringField
      DisplayLabel = #1056#1086#1079#1082#1083#1072#1076
      FieldName = 'SHEDULENAME'
      Size = 40
    end
    object TripQryDEPARTFTIME: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1042#1080#1111#1079#1076' >'
      FieldName = 'DEPARTFTIME'
      DisplayFormat = 'hh:nn'
    end
    object TripQryARRIVEFTIME: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1055#1088#1080#1073'. >'
      FieldName = 'ARRIVEFTIME'
      DisplayFormat = 'hh:nn'
    end
    object TripQryDEPARTBTIME: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1042#1080#1111#1079#1076' <'
      FieldName = 'DEPARTBTIME'
      DisplayFormat = 'hh:nn'
    end
    object TripQryDIRECTION: TSmallintField
      Alignment = taCenter
      DisplayLabel = #1053#1072#1087#1088'.'
      FieldName = 'DIRECTION'
    end
    object TripQryLEAVEDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072' '#1074#1080#1111#1079#1076#1091
      FieldName = 'LEAVEDATE'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object TripQryFROMCITY: TStringField
      DisplayLabel = #1042#1110#1076
      FieldName = 'FROMCITY'
      Size = 25
    end
    object TripQryARRIVECITY: TStringField
      DisplayLabel = #1044#1086
      FieldName = 'ARRIVECITY'
      Size = 25
    end
    object TripQryGROUPMIN: TSmallintField
      DisplayLabel = #1052#1110#1085'.'#1075#1088#1091#1087#1072
      FieldName = 'GROUPMIN'
    end
    object TripQryGROUPMAX: TSmallintField
      DisplayLabel = #1052#1072#1082#1089'.'#1075#1088#1091#1087#1072
      FieldName = 'GROUPMAX'
    end
    object TripQryNETPERGROUP: TFloatField
      DisplayLabel = #1043#1088#1091#1087#1072', '#1075#1088#1085'.'
      FieldName = 'NETPERGROUP'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQryNETPERGROUP2: TFloatField
      DisplayLabel = #1043#1088#1091#1087#1072', '#1074#1072#1083'.'
      FieldName = 'NETPERGROUP2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQryCURRENCYSHORT: TStringField
      Alignment = taCenter
      DisplayLabel = #1042#1072#1083'.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object TripQryDISABLED: TStringField
      FieldName = 'DISABLED'
      Size = 1
    end
    object TripQryOPTIONAL: TStringField
      FieldName = 'OPTIONAL'
      Size = 1
    end
    object TripQryHIDDEN: TStringField
      FieldName = 'HIDDEN'
      Size = 1
    end
    object TripQryNETVAL: TFloatField
      DisplayLabel = #1053#1077#1090#1090#1086', '#1075#1088#1085'.'
      FieldName = 'NETVAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQryNETVAL2: TFloatField
      DisplayLabel = #1053#1077#1090#1090#1086', '#1074#1072#1083'.'
      FieldName = 'NETVAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQryRATE: TFloatField
      DisplayLabel = #1062#1110#1085#1072', '#1075#1088#1085'.'
      FieldName = 'RATE'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQryRATE2: TFloatField
      DisplayLabel = #1062#1110#1085#1072', '#1074#1072#1083'.'
      FieldName = 'RATE2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQryARRIVEBTIME: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1055#1088#1080#1073'. <'
      FieldName = 'ARRIVEBTIME'
      DisplayFormat = 'hh:nn'
    end
    object TripQryFORPAY: TFloatField
      DisplayLabel = #1044#1086' '#1086#1087#1083'.,'#1075#1088#1085'.'
      FieldName = 'FORPAY'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQryFORPAY2: TFloatField
      DisplayLabel = #1044#1086' '#1086#1087#1083'.,'#1074#1072#1083'.'
      FieldName = 'FORPAY2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object TripQrySTARTCITY: TStringField
      FieldName = 'STARTCITY'
      Size = 25
    end
    object TripQrySTOPCITY: TStringField
      FieldName = 'STOPCITY'
      Size = 25
    end
    object TripQrySTARTADDRESS: TStringField
      FieldName = 'STARTADDRESS'
      Size = 45
    end
    object TripQrySTOPADDRESS: TStringField
      FieldName = 'STOPADDRESS'
      Size = 45
    end
    object TripQryCalcFromCity: TStringField
      DisplayLabel = #1042#1110#1076
      FieldKind = fkCalculated
      FieldName = 'CalcFromCity'
      Size = 35
      Calculated = True
    end
    object TripQryCalcArriveCity: TStringField
      DisplayLabel = #1044#1086
      FieldKind = fkCalculated
      FieldName = 'CalcArriveCity'
      Size = 35
      Calculated = True
    end
    object TripQryCalcStartPoint: TStringField
      DisplayLabel = #1042#1080#1111#1079#1076' '#1079
      FieldKind = fkCalculated
      FieldName = 'CalcStartPoint'
      Size = 128
      Calculated = True
    end
    object TripQryCalcStopPoint: TStringField
      DisplayLabel = #1055#1088#1080#1073#1091#1090#1090#1103' '#1074
      FieldKind = fkCalculated
      FieldName = 'CalcStopPoint'
      Size = 128
      Calculated = True
    end
    object TripQryCalcDepartTime: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1042#1080#1111#1079#1076
      FieldKind = fkCalculated
      FieldName = 'CalcDepartTime'
      DisplayFormat = 'hh:nn'
      Calculated = True
    end
    object TripQryCalcArriveTime: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1055#1088#1080#1073'.'
      FieldKind = fkCalculated
      FieldName = 'CalcArriveTime'
      DisplayFormat = 'hh:nn'
      Calculated = True
    end
    object TripQryPERIODTYPE: TSmallintField
      FieldName = 'PERIODTYPE'
    end
    object TripQryROUTENAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1084#1072#1088#1096#1088#1091#1090#1091
      FieldName = 'ROUTENAME'
      Size = 250
    end
    object TripQryTRIPBACKID: TIntegerField
      FieldName = 'TRIPBACKID'
      Origin = '"TOURTRIPS"."TRIPBACKID"'
    end
    object TripQryVENDORID: TIntegerField
      FieldName = 'VENDORID'
      Origin = '"TOURTRIPS"."VENDORID"'
    end
    object TripQryRATECURRID: TIntegerField
      FieldName = 'RATECURRID'
      Origin = '"TOURTRIPS"."RATECURRID"'
    end
    object TripQryMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"TOURTRIPS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TripQryAGENTPAY: TFloatField
      FieldName = 'AGENTPAY'
      Origin = '"TOURTRIPS"."AGENTPAY"'
    end
    object TripQryAGENTPAY2: TFloatField
      FieldName = 'AGENTPAY2'
      Origin = '"TOURTRIPS"."AGENTPAY2"'
    end
    object TripQryAGENTWHO: TSmallintField
      FieldName = 'AGENTWHO'
      Origin = '"TOURTRIPS"."AGENTWHO"'
    end
    object TripQryAGENTWHO2: TSmallintField
      FieldName = 'AGENTWHO2'
      Origin = '"TOURTRIPS"."AGENTWHO2"'
    end
    object TripQryVATPERC: TFloatField
      FieldName = 'VATPERC'
      Origin = '"TOURTRIPS"."VATPERC"'
    end
    object TripQryVAT: TFloatField
      FieldName = 'VAT'
      Origin = '"TOURTRIPS"."VAT"'
    end
    object TripQryVATPERC2: TFloatField
      FieldName = 'VATPERC2'
      Origin = '"TOURTRIPS"."VATPERC2"'
    end
    object TripQryVAT2: TFloatField
      FieldName = 'VAT2'
      Origin = '"TOURTRIPS"."VAT2"'
    end
    object TripQryAGENTPERC: TFloatField
      FieldName = 'AGENTPERC'
      Origin = '"TOURTRIPS"."AGENTPERC"'
    end
    object TripQryAGENTPERC2: TFloatField
      FieldName = 'AGENTPERC2'
      Origin = '"TOURTRIPS"."AGENTPERC2"'
    end
    object TripQryGROUPCURRID: TIntegerField
      FieldName = 'GROUPCURRID'
      Origin = '"TOURTRIPS"."GROUPCURRID"'
    end
    object TripQryGRATISPERSONCOUNT: TIntegerField
      FieldName = 'GRATISPERSONCOUNT'
      Origin = '"TOURTRIPS"."GRATISPERSONCOUNT"'
    end
    object TripQryGRATISBYVENDOR: TIBStringField
      FieldName = 'GRATISBYVENDOR'
      Origin = '"TOURTRIPS"."GRATISBYVENDOR"'
      Size = 1
    end
    object TripQryNETCHECK: TIBStringField
      FieldName = 'NETCHECK'
      Origin = '"TOURTRIPS"."NETCHECK"'
      Size = 1
    end
    object TripQryV1_RATE: TFloatField
      FieldName = 'V1_RATE'
      Origin = '"TOURTRIPS"."V1_RATE"'
    end
    object TripQryV1_AGENTPAY: TFloatField
      FieldName = 'V1_AGENTPAY'
      Origin = '"TOURTRIPS"."V1_AGENTPAY"'
    end
    object TripQryV1_PAY: TFloatField
      FieldName = 'V1_PAY'
      Origin = '"TOURTRIPS"."V1_PAY"'
    end
    object TripQryV1_VATPERC: TFloatField
      FieldName = 'V1_VATPERC'
      Origin = '"TOURTRIPS"."V1_VATPERC"'
    end
    object TripQryV1_VAT: TFloatField
      FieldName = 'V1_VAT'
      Origin = '"TOURTRIPS"."V1_VAT"'
    end
    object TripQryV1_AGENTPERC: TFloatField
      FieldName = 'V1_AGENTPERC'
      Origin = '"TOURTRIPS"."V1_AGENTPERC"'
    end
    object TripQryV1_NETVAL: TFloatField
      FieldName = 'V1_NETVAL'
      Origin = '"TOURTRIPS"."V1_NETVAL"'
    end
    object TripQryV1_PAID: TFloatField
      FieldName = 'V1_PAID'
      Origin = '"TOURTRIPS"."V1_PAID"'
    end
    object TripQryV2_RATE: TFloatField
      FieldName = 'V2_RATE'
      Origin = '"TOURTRIPS"."V2_RATE"'
    end
    object TripQryV2_AGENTPAY: TFloatField
      FieldName = 'V2_AGENTPAY'
      Origin = '"TOURTRIPS"."V2_AGENTPAY"'
    end
    object TripQryV2_PAY: TFloatField
      FieldName = 'V2_PAY'
      Origin = '"TOURTRIPS"."V2_PAY"'
    end
    object TripQryV2_VATPERC: TFloatField
      FieldName = 'V2_VATPERC'
      Origin = '"TOURTRIPS"."V2_VATPERC"'
    end
    object TripQryV2_VAT: TFloatField
      FieldName = 'V2_VAT'
      Origin = '"TOURTRIPS"."V2_VAT"'
    end
    object TripQryV2_AGENTPERC: TFloatField
      FieldName = 'V2_AGENTPERC'
      Origin = '"TOURTRIPS"."V2_AGENTPERC"'
    end
    object TripQryV2_NETVAL: TFloatField
      FieldName = 'V2_NETVAL'
      Origin = '"TOURTRIPS"."V2_NETVAL"'
    end
    object TripQryV2_PAID: TFloatField
      FieldName = 'V2_PAID'
      Origin = '"TOURTRIPS"."V2_PAID"'
    end
    object TripQryV1_RATE2: TFloatField
      FieldName = 'V1_RATE2'
      Origin = '"TOURTRIPS"."V1_RATE2"'
    end
    object TripQryV1_AGENTPAY2: TFloatField
      FieldName = 'V1_AGENTPAY2'
      Origin = '"TOURTRIPS"."V1_AGENTPAY2"'
    end
    object TripQryV1_PAY2: TFloatField
      FieldName = 'V1_PAY2'
      Origin = '"TOURTRIPS"."V1_PAY2"'
    end
    object TripQryV1_VATPERC2: TFloatField
      FieldName = 'V1_VATPERC2'
      Origin = '"TOURTRIPS"."V1_VATPERC2"'
    end
    object TripQryV1_VAT2: TFloatField
      FieldName = 'V1_VAT2'
      Origin = '"TOURTRIPS"."V1_VAT2"'
    end
    object TripQryV1_AGENTPERC2: TFloatField
      FieldName = 'V1_AGENTPERC2'
      Origin = '"TOURTRIPS"."V1_AGENTPERC2"'
    end
    object TripQryV1_NETVAL2: TFloatField
      FieldName = 'V1_NETVAL2'
      Origin = '"TOURTRIPS"."V1_NETVAL2"'
    end
    object TripQryV1_PAID2: TFloatField
      FieldName = 'V1_PAID2'
      Origin = '"TOURTRIPS"."V1_PAID2"'
    end
    object TripQryV2_RATE2: TFloatField
      FieldName = 'V2_RATE2'
      Origin = '"TOURTRIPS"."V2_RATE2"'
    end
    object TripQryV2_AGENTPAY2: TFloatField
      FieldName = 'V2_AGENTPAY2'
      Origin = '"TOURTRIPS"."V2_AGENTPAY2"'
    end
    object TripQryV2_PAY2: TFloatField
      FieldName = 'V2_PAY2'
      Origin = '"TOURTRIPS"."V2_PAY2"'
    end
    object TripQryV2_VATPERC2: TFloatField
      FieldName = 'V2_VATPERC2'
      Origin = '"TOURTRIPS"."V2_VATPERC2"'
    end
    object TripQryV2_VAT2: TFloatField
      FieldName = 'V2_VAT2'
      Origin = '"TOURTRIPS"."V2_VAT2"'
    end
    object TripQryV2_AGENTPERC2: TFloatField
      FieldName = 'V2_AGENTPERC2'
      Origin = '"TOURTRIPS"."V2_AGENTPERC2"'
    end
    object TripQryV2_NETVAL2: TFloatField
      FieldName = 'V2_NETVAL2'
      Origin = '"TOURTRIPS"."V2_NETVAL2"'
    end
    object TripQryV2_PAID2: TFloatField
      FieldName = 'V2_PAID2'
      Origin = '"TOURTRIPS"."V2_PAID2"'
    end
    object TripQryRETURNDAY: TIntegerField
      FieldName = 'RETURNDAY'
      Origin = '"TOURTRIPS"."RETURNDAY"'
    end
    object TripQrySTARTPOINT: TIntegerField
      FieldName = 'STARTPOINT'
      Origin = '"TOURTRIPS"."STARTPOINT"'
    end
    object TripQrySTOPPOINT: TIntegerField
      FieldName = 'STOPPOINT'
      Origin = '"TOURTRIPS"."STOPPOINT"'
    end
    object TripQrySERVICEID: TIntegerField
      FieldName = 'SERVICEID'
      Origin = '"TOURTRIPS"."TOURTRIPID"'
      Required = True
    end
  end
  object TripSrc: TDataSource
    DataSet = TripQry
    Left = 1036
    Top = 128
  end
  object GroupQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TourSrc
    SQL.Strings = (
      'select G.TourGroupId, G.TourDate, G.Memo,'
      '  G.TourTemplateId, T.TemplateName, '
      '  V.TourVariantId, V.VariantName'
      'from TourGroups G'
      
        '  left join TourTemplates T on T.TourTemplateId = G.TourTemplate' +
        'Id'
      '  left join TourVariants V on V.TourVariantId = T.TourVariantId'
      'where G.TourId = :Id and G.TourDate >= :ParDate'
      'order by G.TourDate, G.TourGroupId')
    Left = 1024
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Size = 4
      end
      item
        DataType = ftDateTime
        Name = 'ParDate'
        ParamType = ptInput
        Value = '01.01.2000'
      end>
    object GroupQryTOURGROUPID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1043#1088#1091#1087#1072' '#8470
      FieldName = 'TOURGROUPID'
    end
    object GroupQryTOURDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1095#1072#1090#1082#1091
      FieldName = 'TOURDATE'
      DisplayFormat = 'ddd, dd.mm.yyyy hh:nn'
    end
    object GroupQryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 1
    end
    object GroupQryTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
    end
    object GroupQryTEMPLATENAME: TStringField
      DisplayLabel = #1064#1072#1073#1083#1086#1085
      FieldName = 'TEMPLATENAME'
      Size = 60
    end
    object GroupQryVARIANTNAME: TStringField
      DisplayLabel = #1042#1072#1088#1110#1072#1085#1090' '#1090#1091#1088#1091
      FieldName = 'VARIANTNAME'
      Size = 60
    end
    object GroupQryTOURVARIANTID: TIntegerField
      FieldName = 'TOURVARIANTID'
    end
  end
  object GroupSrc: TDataSource
    DataSet = GroupQry
    Left = 1040
    Top = 56
  end
  object ImageListElem: TImageList
    Left = 912
    Top = 56
    Bitmap = {
      494C010106000A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DBDBDB0036363E00D8D8D80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005D5D7B00BB68310059597B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FAFAFA00F8F6F600F4F0EF00F2E7
      E500EFDFDD00F0DFDE00F6F0F000000000000000000000000000000000000000
      000000000000B2B2B200FC850000FC850000FC850000ADADAD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F4EDED00F5EFEF00F7F5F500F7F5
      F400F6F2F200F4EDEC00F0DFDC00E8BAB200E38A7E00E16B5C00BCA1A200DD77
      6500E05A4500DC4D3B00E0766800F5E8E6000000000000000000000000000000
      00000000000033338200FC850000FC850000FC8500002F2F8600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CB464200DC554700E3796700E890
      7900E9967B00EA8C7000E9795A00DA6B5A00DB584A00E1554200E0715D00E376
      5F00E0675400DE5C4A00DE5D4C00F0D6D2000000000000000000000000000000
      00008C8C8C00FC850000FC850000FC850000FC850000FC850000878787000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF565300DC544400E16B5500E787
      6D00EC8E7000E0A18F00D2A19800C9989600D07A7400C1939400E46E5800E573
      5C00E0655400DE584700DF7A6D00F0DAD7000000000000000000000000000000
      00002121A300FC850000FC850000FC850000FC850000FC8500002020A8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF575600DC554700E2705C00E988
      6D00DEA49400DAA79900DF938000E4685400DE5D4D00D5776D00CF928A00DF7D
      6B00E0635100DE584800E07C6E00F0D8D4000000000000000000000000007D7D
      7D00FC850000FC850000FC850000FC850000FC850000FC850000FC8500007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF575600DC554700E3705C00E987
      6D00DCA69700DFA19000E9836700E16D5800DE5D4D00E25C4800CD938E00DF7B
      6A00E0635100DE584800E0716300F1DCD8000000000000000000000000002323
      AB00FC850000BB683100FC850000FC850000FC850000FC850000BB6831002D59
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF575600DC554700E3705A00E68C
      7600CDB3AE00EA937900E7876D00E16B5800DE5D4D00E15F4C00DA817300CA99
      9600E2604C00DE5C4C00DD544400EBBFBA00000000000000000093939300FC85
      0000FC85000020FFFF001DFAFF00FC850000FC8500001AFAFF000CFFFF00FC85
      00008E8E8E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CF575400DC554700E3705C00E78B
      7100DEA39300E8977E00E7876B00E16B5700DE5D4C00E05F4D00DC7E6E00DA84
      7600E1634F00DE5A4A00DC5F5000F1D4CF00000000000000000044447C00FC85
      0000FC850000BB68310000FFFF0012FDFD000CFDFD0000FFFF00BB683100FC85
      0000434380000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CD545000DC574800E2705C00EA85
      6800D3AFA600DAA99C00E9816500E3675200DF5A4A00E15D4A00C1A1A100DC81
      7300E1635100DE584800DD675900F0D9D50000000000000000002323B000FC85
      0000FC8500004DA6C50000FFFF0000FFFF0000FFFF0000FFFF00FC850000FC85
      00002222B7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CD504D00DC574800E2705A00E788
      7000EB947900DEA79700CDA39D00D87D7000D9685C00E05F4D00E2735D00E474
      5F00E0635200DE5A4A00DE5D4C00EABCB60000000000000000002929A400FC85
      0000FC8500001BFDFD0000FFFF0000FFFF0000FFFF0000FFFF000EF5FF00FC85
      00002828AA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CD4E4C00DC574800E26E5A00E788
      7000EA967A00E79C8300E28B7600C98F8B00D26E6500DF554400E2685400E370
      5A00E0655400DC5C4C00DD514000E5A19800000000000000000059596D00BB68
      310000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF004DDBE9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CE515000DA4D3F00E26D5800E787
      6E00E9947900EA927400E67E6300E1614C00E37B6C00ECB0A700F4D7D100F8E8
      E500F9ECE900F9EBE900F8E8E500F7E6E2000000000000000000CBCBCB00BB68
      3100FC850000FC850000BB68310000FFFF0000FFFF00BB683100FC850000BB68
      3100AEEFF3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5E2E000E9A79D00E48A7B00E897
      8100EEB7A500F3CEC200F6E0DA00F9EFED000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A7A7
      A700BB683100FC850000FC85000020FFFF0009FFFF00FC850000BB683100A3A3
      A300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D3D3D300636376002929A50042EAFD0032EAFD0061617600D1D1D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E4E4E400A8BCA70090958800BA827300C3847100C0948900C0B0AB00E0E0
      E00000000000000000000000000000000000A0C8EC0075B0E4003D8FD900328A
      D700328AD700328AD700328AD700328AD700328AD700328AD700328AD7003289
      D700378DD80083B7E700000000000000000000000000C4A89200B6947900AE88
      6A00A67C5B009E714D0097663F00905C3300956139009A694100A3744F00AD82
      5F009F714E00E6DCD300000000000000000000000000C4A89200B6947900AE88
      6A00A67C5B009E714D0097663F00905C3300956139009A694100A3744F00AD82
      5F009F714E00E6DCD3000000000000000000000000000000000000000000B2BE
      AE005BA9490080915200D57C5D00FF815B00FF815B00F97F5B00E5775E00D279
      5F00BDB1AD000000000000000000000000004597DA00DCEFF800A6DBF2009EDB
      F40096DAF3008ED8F30086D7F3007FD4F20079D3F20072D2F1006CD0F10069CF
      F100C0E8F6003D93D9000000000000000000D1BDAA00B8906D00D6BAA300DFC6
      B300E7D4C300EEDFD300F5EAE200FBF4EF00FDFAF600FFFEFD00FBEBDF00FBEF
      E600C19D8000CEB7A5000000000000000000D1BDAA00B8906D00D6BAA300DFC6
      B300E7D4C300EEDFD300F5EAE200FBF4EF00FDFAF600FFFEFD00FBEBDF00FBEF
      E600C19D8000CEB7A50000000000000000000000000000000000A2B79B0048D1
      2D0093905500FB786000FE805C00F7805C00FE805C00C1805F006F945700EC7A
      5E00F17B5700BBA29A0000000000000000003A95D900EFFAFE00A1E9F90091E5
      F80081E1F70072DEF60063DAF50054D7F40047D3F30039D0F2002ECDF10026CB
      F000CAF2FB003A95D9000000000000000000C6AB9100C7A48500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FEFBF700FEF7F100FEF6F100E4AE8600FAE8
      DB00CEAF9500C5A98F000000000000000000C6AB9100C7A48500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FEFBF700FEF7F100FEF6F100E4AE8600FAE8
      DB00CEAF9500C5A98F00000000000000000000000000C0C8BE004CD2280045E9
      28008B8C5A00FA7A5D00F8805C00F7805C00FE805C00C57D60004AC93A008197
      5500FA795E00EE7A5500C8BCB800000000003A9BD900F2FAFD00B3EDFA00A4E9
      F90095E6F80085E2F70076DEF60065DBF50057D7F40049D4F3003BD1F20030CE
      F100CCF2FB003A99D9000000000000000000DCCBBA009F6C3E00B4855900D9A5
      7B00D89E6F00D79B6A00D8966300D6925D00D48F5900D38E5700E29D6900FAE3
      D100D8BBA200C1A082000000000000000000DCCBBA009F6C3E00B4855900D9A5
      7B00CE956200A6702B00AC743100D6925D00D48F5900D38E5700E29D6900FAE3
      D100D8BBA200A5743600A7783900EDE3D800EFEDEF005BB7410050DB2E00719F
      4F00B8815E00F87D5C00F7805C00F7805C00FF815B00D77763005CB1450049DC
      2F009F845F00FF7E5C00D1785D00E5E6E60039A1D900F6FCFE00C8F2FC00B9EF
      FB00ACECFA009CE8F9008CE0F4007BBFBE00729D8A00B0817400BD847000A092
      8C00B5BFC1003D9FD600000000000000000000000000C09C7B00D5AE8C00FDF0
      E500F7C7A200F7CFAD00F6D3B400C0BC9E00949D7E00C0826F00CE856C00CD9A
      8A00BFAA9C00BB987500000000000000000000000000C09C7B00D5AE8C00FDF0
      E500E2B18400A06A23009F6A2300C59A6500CAA26E00CBA37000CBA47300CCAC
      8300BC966500A06B2300A06B2300E6DAC800B9C5B70040DF2600779B5100F472
      6300FF7F5C00F7805C00F7805C00F77F5B00EE776200B67961004CD634004EE8
      280056BC3E00CE796400BA746100C5B7B40039A6D800FEFFFF00F8FDFF00F6FD
      FF00F5FCFF00EEF5F80080B97E007F9C4B00DE7F5B00FF805B00FF815B00C380
      5C00E17A5C009B838000000000000000000000000000F0E7E000B7865600FEFE
      FD00FADEC200F4D9C00087B370007F9C4B00DE7F5B00FF805B00FF815B00C380
      5C00E17A5C00B57E6800000000000000000000000000F0E7E000B7865600FEFE
      FD00C69B6600A06B2300A6732E00A06B23009F6A2300A06B23009F6A2300A06B
      2300A06B2300A06C2700A06B2300C6A77D00A69B8E0086935200BA815F00FF7F
      5C00F7805C00F7805C00FD7F5C00BA815F0067A14F006DA64B0050E02D0052E1
      2C004DDB2F009D8263009B767900BA948B0037AAD800E8F6FB0094D4EF0088CE
      EE0076C1E80089BF85003CE22400AC8A5B00FF7D5D00F7805C00FC7C5F0081A0
      520084A15000FF765A00CC9E8F00000000000000000000000000B9865200FEFC
      F900F8DBC00093BC79003CE22400AC8A5A00FF7D5D00F7805C00FC7B5E0081A0
      510084A15000FF765A00CC9E8F00000000000000000000000000B9865200FEFC
      F900A36F2900B98B5000F2D4B600D0A87A00A06B23009F6A2300A06A2300A06B
      2400CEB18A00B6855200BA946300A06D2900AC807600FD7A5C00FD7F5C00F780
      5C00F7805C00F7805C00FE7F5C00BC7E60004BD533004DE7290052DF2D0052E2
      2C0052D234008A806100729E51008A8671003FACDA00F1FAFD0094DEF50093DC
      F4008AC4CA0049D22B0081A34F00D2815F00FB7F5C00FB805C00FE7960009597
      550042DC2F00AA8C5A00F3765800D2CAC8000000000000000000B9854B00FEFB
      F700D0C8AD0049D22B0082A44E00D3815E00FB7F5C00FB805C00FF795F009697
      540042DC2F00AB8C5800F3765800D2CAC8000000000000000000B9854B00FEFB
      F700A26E2700BD915700F7DBBD00D5AE8200A06B23009F6A2300A06B23009F6A
      2300D7C0A100B6824800BD9B6B00A16C270081807600DF766000F17C5D00F780
      5C00F7805C00F7805C00FE805C00CC7C61004ECB360051E32B0052DF2D0052E0
      2C0054D7310054CD37004DE8270068B157003FB2DA00F7FCFE008EE4F80091DE
      F50083AD8B006CAA4600F1776300FF7F5C00FA805C00DF815E00AC8461006EB3
      450049EC260066BE3E00B5706A00B99C98000000000000000000BC894D00FCF6
      F0009AAD80006DAA4500F1776300FF7F5C00FA805C00DF815E00AD8460006EB3
      450049EC260067BE3D00B5706A00B99C98000000000000000000BC894D00FCF6
      F000A7743100A06B2300AD7B3900A26E27009F6A2300A06B2300A06B2300A06B
      2400A26E2800A5702A00A06B2300A57534008FAE860059B63F0092865D00F97C
      5D00F7805C00F7805C00FA805C00E47960006DA84A004BE9270051E22B0052DE
      2D0052E02C0051E22B004EE5270084B476003AB3D900FDFEFE00FEFFFF00FEFE
      FF00B9827600FA7B5F00F9805C00F7805C00FE7F5C00C3825F0049CF360050E0
      2D0050E42A005FBE3C0083885D00888E6F000000000000000000CB9C6600F5E7
      D800B97F7100FA7A5E00F9805C00F7805C00FE7F5C00C5825F0049CF360050E0
      2D0050E42A0061C03C0083885D00888E6F000000000000000000CB9C6600F5E7
      D800A7753200A06B2300A06B2400A06B2300A06B23009F6A2300A06B24009F6A
      2300A06B2400A06B2300A06B2300A6763500BFC8BB0043E0250082975300FC79
      5E00F7805C00F7805C00F7805C00FD7D5B00A3815F0054AD470055CF360050E5
      2A0052DF2D0052E02C004DDA2800B3C1AE0057C0DE005FC1DF0061C2E00061C2
      E00083847100D9805D00F37F5D00F8805C00FD805C00D67D5F0052CB360050E6
      290052E02C0054D532004FDE2D0068BA53000000000000000000D6AF7E00F0D9
      C10092887100D9805C00F47F5D00F8805C00FD805C00D87E600054CD380050E6
      290052E02C0054D532004FDE2D0066B74E000000000000000000D6AF7E00F0D9
      C100A4702A00BC8D5400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00AC773300A16C2800F1F0F1005BB646006CA84800E179
      6000FE805C00FF7F5C00FA805C00F87F5B00B77B6400D0736700848F58004ED3
      350051E32B004FE6280058B63E00EBEAEB000000000000000000000000000000
      000090C1870058BB3C00E6795F00FB805C00F8805C00F5795E007D9F4F0048DC
      2F0050E32B0052E12C004DE625008BBF7C000000000000000000DFBC9100EDD0
      B20092C0850058BB3C00E87B6100FB805C00F8805C00F77B60007EA1510048DC
      2F0050E32B0052E12C004DE6250082AC5B000000000000000000DFBC9100EDD0
      B200A16C2600CCA57600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C7A27200A16C240000000000C8CFC50048BC3500BF80
      5D00C57B6000AC815F00ED796000FB805C00F87F5B00FF815B00EE7A5F00A77C
      640052CB39004CD42800BDC7BA00000000000000000000000000000000000000
      0000D5DDD30053BC3700CC805D00FD7D5C00FF7E5D00FC805C00BB7964009F89
      5B0054CA370050E52A004DD52800CED6CC000000000000000000E5C69D00EBCA
      A500D7DED30053BC3700CF815E00FF7E5D00FF7E5D00FC805C00BE7B6500A08B
      5C0056CC390050E52A004DD52800BEB18B000000000000000000E5C69D00EBCA
      A500A16D2600CCA77900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CEB08A00A06B25000000000000000000ACB5AC00D176
      5900D17E5D0062A050006AA14F00D97B6000FD805C00F8805C00FA7B5D00898D
      55004EC23500A1B89B0000000000000000000000000000000000000000000000
      00000000000093C19000A8885100BE805E00B1865C00F17D5C00FA7F5B00FC7A
      5D00AC815F004BCD2F0090C28200000000000000000000000000EACEA800EBC6
      9A00FEFEFE0095BF8A00A8885100C0806000B3885D00F37F5E00FC805D00FE7C
      5F00AF8361004BCD2F0090BC7700DBAB6A000000000000000000EACEA800EBC6
      9A00A16D2600C9A57800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C69D6900A16C2400000000000000000000000000C7C0
      BE00CB7A690092825A0044CD3500AA815D00FF7F5B00FE805A00F27B5A009381
      6300B1BEB1000000000000000000000000000000000000000000000000000000
      00000000000000000000C09F9700C6785C0054AF4500AA8E5600FF7E5C00FF7D
      5A00A388540087B5810000000000000000000000000000000000EFD8B900EAC0
      8C00FFFFFF00FAFAFA00C2A19900C6785C0054AF4500AA8E5600FF7E5C00FF7D
      5A00A388540084AB6F00DBAE7100F1DDC2000000000000000000EFD8B900EAC0
      8C00A7773600A4712C00A9793800A9793800A9783700A9783600A8773400A877
      3400A8763200A7742F00A06C2400A57330000000000000000000000000000000
      0000EAEBEB00B9BFB6008CB381007A906D00B2807500BB978E00C1B8B500E9E8
      E800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D3CDCD0095B58A0081986B00C2827300C6A0
      9200D3CCCB000000000000000000000000000000000000000000F7EBDB00E6BD
      8100EABC8100E8B77700E5B26E00C59F73008D9F600080905C00BF7B6600C08D
      7100C6A88500E8C59500F4E5CE00000000000000000000000000F7EBDB00E6BD
      8100C49251009F6A2300A06A2300A06B23009F6A2300A06A23009F6A23009F6A
      2300A06B2300A06B23009F6A2300CCB18D00424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFC7F00000000FFFFFC7F00000000
      FF01F83F000000000000F83F000000000000F01F000000000000F01F00000000
      0000E00F000000000000E00F000000000000C007000000000000C00700000000
      0000C007000000000000C007000000000000C007000000000000C00700000000
      00FFE00F00000000FFFFF01F00000000F00F000380038003E007000300030003
      C003000300030003800100030003000000000003800380000000000380038000
      00000001C001C00000000000C000C00000000000C000C00000000000C000C000
      00000000C000C0000000F000C000C0008001F000C000C000C003F801C000C000
      E007FC03C000C000F00FFE07C001C00000000000000000000000000000000000
      000000000000}
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from LOG')
    Left = 688
    Top = 192
    object IBQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = '"LOG"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuery1APLICATION: TIBStringField
      FieldName = 'APLICATION'
      Origin = '"LOG"."APLICATION"'
      Required = True
      Size = 100
    end
    object IBQuery1TITLE: TIBStringField
      FieldName = 'TITLE'
      Origin = '"LOG"."TITLE"'
      Size = 300
    end
    object IBQuery1TABLENAME: TIBStringField
      FieldName = 'TABLENAME'
      Origin = '"LOG"."TABLENAME"'
      Required = True
      Size = 100
    end
    object IBQuery1OBJID: TIntegerField
      FieldName = 'OBJID'
      Origin = '"LOG"."OBJID"'
      Required = True
    end
    object IBQuery1USERID: TIntegerField
      FieldName = 'USERID'
      Origin = '"LOG"."USERID"'
      Required = True
    end
    object IBQuery1TYPEACTION: TIntegerField
      FieldName = 'TYPEACTION'
      Origin = '"LOG"."TYPEACTION"'
      Required = True
    end
    object IBQuery1ADATE: TDateTimeField
      FieldName = 'ADATE'
      Origin = '"LOG"."ADATE"'
      Required = True
    end
    object IBQuery1FORMNAME: TIBStringField
      FieldName = 'FORMNAME'
      Origin = '"LOG"."FORMNAME"'
      Size = 100
    end
    object IBQuery1FORMCAPTION: TIBStringField
      FieldName = 'FORMCAPTION'
      Origin = '"LOG"."FORMCAPTION"'
      Size = 200
    end
    object IBQuery1ADATA: TBlobField
      FieldName = 'ADATA'
      Origin = '"LOG"."ADATA"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object IBQuery1APPLICATIONICON: TBlobField
      FieldName = 'APPLICATIONICON'
      Origin = '"LOG"."APPLICATIONICON"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBStoredProc1: TIBStoredProc
    Left = 224
    Top = 192
  end
  object TR_AGES: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TripSrc
    SQL.Strings = (
      ' select  * from TR_AGES where ServiceId = :ServiceId'
      '')
    Left = 320
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ServiceId'
        ParamType = ptUnknown
      end>
    object TR_AGESAGEID: TIntegerField
      FieldName = 'AGEID'
      Origin = '"TR_AGES"."AGEID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TR_AGESSERVKINDID: TIntegerField
      FieldName = 'SERVKINDID'
      Origin = '"TR_AGES"."SERVKINDID"'
    end
    object TR_AGESSERVICEID: TIntegerField
      FieldName = 'SERVICEID'
      Origin = '"TR_AGES"."SERVICEID"'
    end
    object TR_AGESAGEFROM: TIntegerField
      FieldName = 'AGEFROM'
      Origin = '"TR_AGES"."AGEFROM"'
    end
    object TR_AGESAGETILL: TIntegerField
      FieldName = 'AGETILL'
      Origin = '"TR_AGES"."AGETILL"'
    end
    object TR_AGESNAMEID: TIntegerField
      FieldName = 'NAMEID'
      Origin = '"TR_AGES"."NAMEID"'
    end
    object TR_AGESISBASEAGE: TIBStringField
      FieldName = 'ISBASEAGE'
      Origin = '"TR_AGES"."ISBASEAGE"'
      Size = 1
    end
  end
  object TR_AGES_DS: TDataSource
    DataSet = TR_AGES
    Left = 323
    Top = 261
  end
  object TR_PERIODS: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TripSrc
    SQL.Strings = (
      ' select  * from TR_PERIODS  where ServiceId = :ServiceId'
      '')
    Left = 512
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ServiceId'
        ParamType = ptUnknown
      end>
    object TR_PERIODSPERIODID: TIntegerField
      FieldName = 'PERIODID'
      Origin = '"TR_PERIODS"."PERIODID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TR_PERIODSSERVKINDID: TIntegerField
      FieldName = 'SERVKINDID'
      Origin = '"TR_PERIODS"."SERVKINDID"'
    end
    object TR_PERIODSSERVICEID: TIntegerField
      FieldName = 'SERVICEID'
      Origin = '"TR_PERIODS"."SERVICEID"'
    end
    object TR_PERIODSPERIODFROM: TIntegerField
      FieldName = 'PERIODFROM'
      Origin = '"TR_PERIODS"."PERIODFROM"'
    end
    object TR_PERIODSPERIODTILL: TIntegerField
      FieldName = 'PERIODTILL'
      Origin = '"TR_PERIODS"."PERIODTILL"'
    end
    object TR_PERIODSFROMDATE: TDateTimeField
      FieldName = 'FROMDATE'
      Origin = '"TR_PERIODS"."FROMDATE"'
    end
    object TR_PERIODSTILLDATE: TDateTimeField
      FieldName = 'TILLDATE'
      Origin = '"TR_PERIODS"."TILLDATE"'
    end
    object TR_PERIODSNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TR_PERIODS"."NAME"'
    end
  end
  object TR_PERIODS_DS: TDataSource
    DataSet = TR_PERIODS
    Left = 515
    Top = 269
  end
  object TR_RATES: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TR_AGES_DS
    SQL.Strings = (
      ' select  * from TR_RATES where  AgeId = :AgeId'
      '')
    Left = 408
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AgeId'
        ParamType = ptUnknown
      end>
    object TR_RATESTOURRATEID: TIntegerField
      FieldName = 'TOURRATEID'
      Origin = '"TR_RATES"."TOURRATEID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TR_RATESPERIODID: TIntegerField
      FieldName = 'PERIODID'
      Origin = '"TR_RATES"."PERIODID"'
      Required = True
    end
    object TR_RATESAGEID: TIntegerField
      FieldName = 'AGEID'
      Origin = '"TR_RATES"."AGEID"'
      Required = True
    end
    object TR_RATESV1_RATE: TFloatField
      FieldName = 'V1_RATE'
      Origin = '"TR_RATES"."V1_RATE"'
    end
    object TR_RATESV1_AGENTPAY: TFloatField
      FieldName = 'V1_AGENTPAY'
      Origin = '"TR_RATES"."V1_AGENTPAY"'
    end
    object TR_RATESV1_NETVAL: TFloatField
      FieldName = 'V1_NETVAL'
      Origin = '"TR_RATES"."V1_NETVAL"'
    end
    object TR_RATESV2_RATE: TFloatField
      FieldName = 'V2_RATE'
      Origin = '"TR_RATES"."V2_RATE"'
    end
    object TR_RATESV2_AGENTPAY: TFloatField
      FieldName = 'V2_AGENTPAY'
      Origin = '"TR_RATES"."V2_AGENTPAY"'
    end
    object TR_RATESV2_NETVAL: TFloatField
      FieldName = 'V2_NETVAL'
      Origin = '"TR_RATES"."V2_NETVAL"'
    end
    object TR_RATESV1_RATE2: TFloatField
      FieldName = 'V1_RATE2'
      Origin = '"TR_RATES"."V1_RATE2"'
    end
    object TR_RATESV1_AGENTPAY2: TFloatField
      FieldName = 'V1_AGENTPAY2'
      Origin = '"TR_RATES"."V1_AGENTPAY2"'
    end
    object TR_RATESV1_NETVAL2: TFloatField
      FieldName = 'V1_NETVAL2'
      Origin = '"TR_RATES"."V1_NETVAL2"'
    end
    object TR_RATESV2_RATE2: TFloatField
      FieldName = 'V2_RATE2'
      Origin = '"TR_RATES"."V2_RATE2"'
    end
    object TR_RATESV2_AGENTPAY2: TFloatField
      FieldName = 'V2_AGENTPAY2'
      Origin = '"TR_RATES"."V2_AGENTPAY2"'
    end
    object TR_RATESV2_NETVAL2: TFloatField
      FieldName = 'V2_NETVAL2'
      Origin = '"TR_RATES"."V2_NETVAL2"'
    end
  end
  object TR_RATES_DS: TDataSource
    DataSet = TR_RATES
    Left = 411
    Top = 269
  end
  object LOGDB: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TripSrc
    SQL.Strings = (
      
        'select LOG.*, (select TMFULLNAME from TMUSERS where TMUSERS.TMUS' +
        'ERID =LOG.userid ) USERNAME from LOG')
    Left = 912
    Top = 304
    object LOGDBID: TIntegerField
      FieldName = 'ID'
      Origin = '"LOG"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object LOGDBAPLICATION: TIBStringField
      FieldName = 'APLICATION'
      Origin = '"LOG"."APLICATION"'
      Required = True
      Size = 100
    end
    object LOGDBTITLE: TIBStringField
      FieldName = 'TITLE'
      Origin = '"LOG"."TITLE"'
      Size = 300
    end
    object LOGDBTABLENAME: TIBStringField
      FieldName = 'TABLENAME'
      Origin = '"LOG"."TABLENAME"'
      Required = True
      Size = 100
    end
    object LOGDBOBJID: TIntegerField
      FieldName = 'OBJID'
      Origin = '"LOG"."OBJID"'
      Required = True
    end
    object LOGDBUSERID: TIntegerField
      FieldName = 'USERID'
      Origin = '"LOG"."USERID"'
      Required = True
    end
    object LOGDBTYPEACTION: TIntegerField
      FieldName = 'TYPEACTION'
      Origin = '"LOG"."TYPEACTION"'
      Required = True
    end
    object LOGDBADATE: TDateTimeField
      FieldName = 'ADATE'
      Origin = '"LOG"."ADATE"'
      Required = True
    end
    object LOGDBFORMNAME: TIBStringField
      FieldName = 'FORMNAME'
      Origin = '"LOG"."FORMNAME"'
      Size = 100
    end
    object LOGDBFORMCAPTION: TIBStringField
      FieldName = 'FORMCAPTION'
      Origin = '"LOG"."FORMCAPTION"'
      Size = 200
    end
    object LOGDBADATA: TBlobField
      FieldName = 'ADATA'
      Origin = '"LOG"."ADATA"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object LOGDBUSERNAME: TIBStringField
      FieldName = 'USERNAME'
      ProviderFlags = []
      Size = 35
    end
    object LOGDBAPPLICATIONICON: TBlobField
      FieldName = 'APPLICATIONICON'
      Origin = '"LOG"."APPLICATIONICON"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object LOG_DS: TDataSource
    DataSet = LOGDB
    Left = 955
    Top = 309
  end
  object LSheet: TcxStyleRepository
    Left = 1106
    Top = 10
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10930928
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16774644
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clYellow
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16511978
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14542570
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clTeal
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211272
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 524288
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4194368
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 7897176
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnShadow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle71: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle72: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle73: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle74: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle75: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle76: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle77: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle78: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle79: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle80: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle81: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle82: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle83: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle84: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle85: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle86: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle87: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle88: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle89: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle90: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle91: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle92: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle93: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle94: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle95: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle96: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 4707838
    end
    object cxStyle97: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8454016
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle98: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle99: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle100: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle101: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle102: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle103: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle104: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle105: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle106: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle107: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle108: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle109: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8454016
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle110: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle111: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle112: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle113: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle114: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle115: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle116: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle117: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle118: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211288
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle119: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle120: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle121: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle122: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle123: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle124: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle125: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle126: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle127: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle128: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle129: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14679999
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle130: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle131: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle132: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle133: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle134: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle135: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle136: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle137: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle138: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle139: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle140: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle141: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle142: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle143: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle144: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14679999
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle145: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle146: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle147: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle148: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle149: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle150: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle151: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle152: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle153: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle154: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle155: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle156: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16772844
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle157: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle158: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16630203
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle159: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle160: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14932430
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle161: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16772844
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle162: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle163: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle164: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle165: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle166: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16630203
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle167: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle168: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle169: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle170: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle171: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle172: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle173: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle174: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8453888
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle175: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8453888
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle176: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12279296
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle177: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15066597
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle178: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle179: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle180: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle181: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle182: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle183: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle184: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle185: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle186: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle187: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle188: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle189: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle190: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle191: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle192: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle193: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle194: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle195: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle196: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle197: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12279296
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle198: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle199: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15790320
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle200: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle201: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle202: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle203: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle204: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle205: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle206: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle207: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle208: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle209: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle210: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle211: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14932430
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle212: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object cxStyle213: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
    object cxStyle214: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object cxStyle215: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15263999
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object DBCardStyle: TcxGridCardViewStyleSheet
      Styles.Background = cxStyle110
      Styles.Content = cxStyle113
      Styles.ContentEven = cxStyle114
      Styles.ContentOdd = cxStyle115
      Styles.Inactive = cxStyle116
      Styles.IncSearch = cxStyle117
      Styles.Selection = cxStyle119
      Styles.CaptionRow = cxStyle111
      Styles.CardBorder = cxStyle112
      Styles.RowCaption = cxStyle118
      BuiltIn = True
    end
    object DBBandedStyle: TcxGridBandedTableViewStyleSheet
      Styles.Background = cxStyle199
      Styles.Content = cxStyle99
      Styles.ContentEven = cxStyle160
      Styles.ContentOdd = cxStyle99
      Styles.FilterBox = cxStyle162
      Styles.Inactive = cxStyle167
      Styles.IncSearch = cxStyle168
      Styles.Selection = cxStyle171
      Styles.Footer = cxStyle163
      Styles.Group = cxStyle164
      Styles.GroupByBox = cxStyle165
      Styles.Header = cxStyle211
      Styles.Indicator = cxStyle169
      Styles.Preview = cxStyle170
      Styles.BandBackground = cxStyle157
      Styles.BandHeader = cxStyle211
      BuiltIn = True
    end
    object DBOtherStyle: TcxGridBandedTableViewStyleSheet
      Styles.Content = cxStyle178
      Styles.ContentEven = cxStyle179
      Styles.ContentOdd = cxStyle180
      Styles.Inactive = cxStyle174
      Styles.Selection = cxStyle175
      Styles.Header = cxStyle177
      Styles.Indicator = cxStyle173
      Styles.BandHeader = cxStyle176
      BuiltIn = True
    end
    object DBMonitorStyle: TcxGridBandedTableViewStyleSheet
      Caption = 'DBBandedStyle'
      Styles.Background = cxStyle195
      Styles.Content = cxStyle198
      Styles.ContentEven = cxStyle199
      Styles.ContentOdd = cxStyle200
      Styles.FilterBox = cxStyle201
      Styles.Inactive = cxStyle206
      Styles.IncSearch = cxStyle207
      Styles.Selection = cxStyle210
      Styles.Footer = cxStyle202
      Styles.Group = cxStyle203
      Styles.GroupByBox = cxStyle204
      Styles.Header = cxStyle205
      Styles.Indicator = cxStyle208
      Styles.Preview = cxStyle209
      Styles.BandBackground = cxStyle196
      Styles.BandHeader = cxStyle197
      BuiltIn = True
    end
    object GridTableViewStyle: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    object MyStyle: TcxGridTableViewStyleSheet
      Styles.Background = cxStyle100
      Styles.Content = cxStyle99
      Styles.ContentEven = cxStyle99
      Styles.ContentOdd = cxStyle99
      Styles.Inactive = cxStyle62
      Styles.Selection = cxStyle215
      Styles.Footer = cxStyle214
      Styles.GroupByBox = cxStyle189
      Styles.Header = cxStyle214
      BuiltIn = True
    end
    object MyStyleTree: TcxTreeListStyleSheet
      Styles.Background = cxStyle100
      Styles.Content = cxStyle99
      Styles.Inactive = cxStyle62
      Styles.Selection = cxStyle215
      Styles.BandBackground = cxStyle214
      Styles.BandContent = cxStyle99
      Styles.BandHeader = cxStyle212
      Styles.ColumnFooter = cxStyle212
      Styles.ColumnHeader = cxStyle214
      Styles.ContentEven = cxStyle99
      Styles.ContentOdd = cxStyle99
      Styles.Footer = cxStyle214
      BuiltIn = True
    end
  end
  object ADOConnection1: TADOConnection
    Left = 1216
    Top = 200
  end
  object IBQueryTESTTABLE: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from TEST_TABLE')
    Left = 1200
    Top = 296
    object IBQueryTESTTABLEID: TIntegerField
      FieldName = 'ID'
      Origin = '"TEST_TABLE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryTESTTABLENAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TEST_TABLE"."NAME"'
      Size = 200
    end
    object IBQueryTESTTABLEAVALUE: TIBStringField
      FieldName = 'AVALUE'
      Origin = '"TEST_TABLE"."AVALUE"'
      Size = 200
    end
  end
  object IBQueryTESTTABLESrc: TDataSource
    DataSet = IBQueryTESTTABLE
    Left = 1241
    Top = 335
  end
  object cxGridViewRepository2: TcxGridViewRepository
    Left = 560
    Top = 528
    object ViewTestTable: TcxGridDBTableView
      OnCellClick = ViewTestTableCellClick
      OnCustomDrawCell = ViewTestTableCustomDrawCell
      DataController.DataSource = LanguagesSrc
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsView.GroupByBox = False
      object ViewTestTableID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 55
      end
      object ViewTestTableCheck: TcxGridDBColumn
        Caption = 'Check'
        DataBinding.ValueType = 'Boolean'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewTestTableNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 180
      end
    end
  end
  object GridViewRepository: TcxGridViewRepository
    Left = 1448
    Top = 32
    object ViewCompany: TcxGridDBTableView
      DataController.DataSource = CompanySrc
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewCompanyCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompanyCOMPANYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 384
      end
      object ViewCompanyPERSCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'PERSCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 47
      end
      object ViewCompanyORDERCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'ORDERCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 35
      end
      object ViewCompanyLASTDATECRORDER: TcxGridDBColumn
        DataBinding.FieldName = 'LASTDATECRORDER'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
      end
      object ViewCompanyCalcDateContract: TcxGridDBColumn
        Caption = #1059#1075#1086#1076#1080
        DataBinding.FieldName = 'CalcDateContract'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 61
      end
      object ViewCompanySORTBYCONTRACT: TcxGridDBColumn
        Caption = #1059#1075#1086#1076#1080
        DataBinding.FieldName = 'SORTBYCONTRACT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 61
      end
      object ViewCompanyISOBDZVIN: TcxGridDBColumn
        DataBinding.FieldName = 'ISOBDZVIN'
        Width = 49
      end
      object ViewCompanyCOMMONNOTEADDDATE: TcxGridDBColumn
        DataBinding.FieldName = 'COMMONNOTEADDDATE'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 62
      end
      object ViewCompanyISVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 42
      end
      object ViewCompanyOBDZVINAGREEDATE: TcxGridDBColumn
        DataBinding.FieldName = 'OBDZVINAGREEDATE'
        Visible = False
      end
      object ViewCompanyAreWeb: TcxGridDBColumn
        DataBinding.FieldName = 'AREWEB'
        Visible = False
      end
      object ViewCompanyFIXDEFECTTODATE: TcxGridDBColumn
        DataBinding.FieldName = 'FIXDEFECTTODATE'
        Visible = False
      end
      object ViewCompanyOBDZVIN: TcxGridDBColumn
        DataBinding.FieldName = 'OBDZVIN'
        Visible = False
      end
      object ViewCompanyISHEADOFFICE: TcxGridDBColumn
        DataBinding.FieldName = 'ISHEADOFFICE'
        Visible = False
      end
      object ViewCompanyNOTWORK: TcxGridDBColumn
        DataBinding.FieldName = 'NOTWORK'
        Visible = False
      end
      object ViewCompanyAGENCYLOGO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENCYLOGO'
        Visible = False
      end
      object ViewCompanyDOCTODATE: TcxGridDBColumn
        DataBinding.FieldName = 'DOCTODATE'
        Visible = False
      end
    end
    object ViewCompanyCountry: TcxGridDBTableView
      DataController.DataSource = SelCompCntryQrySrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewCompanyCountryCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewCompanyCountryNAME: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 303
      end
      object ViewCompanyCountryLATNAME: TcxGridDBColumn
        Caption = #1051#1072#1090'.'
        DataBinding.FieldName = 'LATNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 39
      end
    end
  end
  object SelCompCntryQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select C.CountryId, C.Name, C.LatName'
      'from Countries C'
      
        'where exists (select * from CompOffices O where O.CountryId = C.' +
        'CountryId)'
      'order by C.Name')
    Left = 1408
    Top = 77
    object SelCompCntryQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object SelCompCntryQryNAME: TStringField
      FieldName = 'NAME'
      Size = 30
    end
    object SelCompCntryQryLATNAME: TStringField
      FieldName = 'LATNAME'
      Size = 1
    end
  end
  object SelCompCntryQrySrc: TDataSource
    DataSet = SelCompCntryQry
    Left = 1432
    Top = 104
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 1376
    Top = 288
    PixelsPerInch = 96
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 1400
    Top = 336
  end
  object CompanyQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select Co.* from SEL_COMPANIES_PROC(0) Co')
    Left = 1496
    Top = 271
    object CompanyQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object CompanyQryNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1092#1110#1088#1084#1080
      FieldName = 'NAME'
      Size = 100
    end
    object CompanyQryISENTERPR: TStringField
      Alignment = taRightJustify
      FieldName = 'ISENTERPR'
      Size = 1
    end
    object CompanyQryISPRIVATE: TStringField
      Alignment = taRightJustify
      FieldName = 'ISPRIVATE'
      Size = 1
    end
    object CompanyQryISGOVERN: TStringField
      Alignment = taRightJustify
      FieldName = 'ISGOVERN'
      Size = 1
    end
    object CompanyQryISBUDGET: TStringField
      Alignment = taRightJustify
      FieldName = 'ISBUDGET'
      Size = 1
    end
    object CompanyQryISVENDOR: TStringField
      Alignment = taRightJustify
      DisplayLabel = #1055#1086#1089#1090'?'
      FieldName = 'ISVENDOR'
      Size = 1
    end
    object CompanyQryISCLIENT: TStringField
      Alignment = taRightJustify
      DisplayLabel = #1047#1072#1084'?'
      FieldName = 'ISCLIENT'
      Size = 1
    end
    object CompanyQryISAGENT: TStringField
      Alignment = taRightJustify
      FieldName = 'ISAGENT'
      Size = 1
    end
    object CompanyQryISPROPS: TStringField
      Alignment = taRightJustify
      FieldName = 'ISPROPS'
      Size = 1
    end
    object CompanyQryISOTHER: TStringField
      Alignment = taRightJustify
      FieldName = 'ISOTHER'
      Size = 1
    end
    object CompanyQryASDRIVE: TStringField
      Alignment = taRightJustify
      FieldName = 'ASDRIVE'
      Size = 1
    end
    object CompanyQryASHOTEL: TStringField
      Alignment = taRightJustify
      FieldName = 'ASHOTEL'
      Size = 1
    end
    object CompanyQryASVISAS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASVISAS'
      Size = 1
    end
    object CompanyQryASINSUR: TStringField
      Alignment = taRightJustify
      FieldName = 'ASINSUR'
      Size = 1
    end
    object CompanyQryASEXCRS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASEXCRS'
      Size = 1
    end
    object CompanyQryASREKLM: TStringField
      Alignment = taRightJustify
      FieldName = 'ASREKLM'
      Size = 1
    end
    object CompanyQryASTICKT: TStringField
      Alignment = taRightJustify
      FieldName = 'ASTICKT'
      Size = 1
    end
    object CompanyQryASTOURS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASTOURS'
      Size = 1
    end
    object CompanyQryASSCOLL: TStringField
      Alignment = taRightJustify
      FieldName = 'ASSCOLL'
      Size = 1
    end
    object CompanyQryASAPAIR: TStringField
      Alignment = taRightJustify
      FieldName = 'ASAPAIR'
      Size = 1
    end
    object CompanyQryASEMPLS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASEMPLS'
      Size = 1
    end
    object CompanyQryASFOODS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASFOODS'
      Size = 1
    end
    object CompanyQryASURIST: TStringField
      Alignment = taRightJustify
      FieldName = 'ASURIST'
      Size = 1
    end
    object CompanyQryASMEDIC: TStringField
      Alignment = taRightJustify
      FieldName = 'ASMEDIC'
      Size = 1
    end
    object CompanyQryISHOTEL: TStringField
      Alignment = taRightJustify
      FieldName = 'ISHOTEL'
      Size = 1
    end
    object CompanyQryASRECRE: TStringField
      Alignment = taRightJustify
      FieldName = 'ASRECRE'
      Size = 1
    end
    object CompanyQryASEXTRM: TStringField
      Alignment = taRightJustify
      FieldName = 'ASEXTRM'
      Size = 1
    end
    object CompanyQryASOTHER: TStringField
      Alignment = taRightJustify
      FieldName = 'ASOTHER'
      Size = 1
    end
    object CompanyQryTAXPAYREGNO: TStringField
      Alignment = taRightJustify
      FieldName = 'TAXPAYREGNO'
    end
    object CompanyQryTAXPAYCODE: TStringField
      Alignment = taRightJustify
      FieldName = 'TAXPAYCODE'
      Size = 12
    end
    object CompanyQryIDENTCODE: TStringField
      Alignment = taRightJustify
      FieldName = 'IDENTCODE'
      Size = 10
    end
    object CompanyQryCLASSCODE: TStringField
      Alignment = taRightJustify
      FieldName = 'CLASSCODE'
      Size = 8
    end
    object CompanyQryFORWORK: TStringField
      Alignment = taRightJustify
      FieldName = 'FORWORK'
      Size = 1
    end
    object CompanyQryMEMO: TMemoField
      Alignment = taRightJustify
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 8
    end
    object CompanyQryISPOTENT: TStringField
      Alignment = taRightJustify
      FieldName = 'ISPOTENT'
      Size = 1
    end
    object CompanyQryISBSMAN: TStringField
      Alignment = taRightJustify
      FieldName = 'ISBSMAN'
      Size = 1
    end
    object CompanyQryASMUSEM: TStringField
      Alignment = taRightJustify
      FieldName = 'ASMUSEM'
      Size = 1
    end
    object CompanyQryASXHIBT: TStringField
      Alignment = taRightJustify
      FieldName = 'ASXHIBT'
      Size = 1
    end
    object CompanyQryASAMBAS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASAMBAS'
      Size = 1
    end
    object CompanyQryASCOMMC: TStringField
      Alignment = taRightJustify
      FieldName = 'ASCOMMC'
      Size = 1
    end
    object CompanyQryASCMPTR: TStringField
      Alignment = taRightJustify
      FieldName = 'ASCMPTR'
      Size = 1
    end
    object CompanyQryASSTNRY: TStringField
      Alignment = taRightJustify
      FieldName = 'ASSTNRY'
      Size = 1
    end
    object CompanyQryASFURNT: TStringField
      Alignment = taRightJustify
      FieldName = 'ASFURNT'
      Size = 1
    end
    object CompanyQryASGOODS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASGOODS'
      Size = 1
    end
    object CompanyQryASPETRL: TStringField
      Alignment = taRightJustify
      FieldName = 'ASPETRL'
      Size = 1
    end
    object CompanyQryASMEDIA: TStringField
      Alignment = taRightJustify
      FieldName = 'ASMEDIA'
      Size = 1
    end
    object CompanyQryASCONSL: TStringField
      Alignment = taRightJustify
      FieldName = 'ASCONSL'
      Size = 1
    end
    object CompanyQryASGUARD: TStringField
      Alignment = taRightJustify
      FieldName = 'ASGUARD'
      Size = 1
    end
    object CompanyQryASBANKS: TStringField
      Alignment = taRightJustify
      FieldName = 'ASBANKS'
      Size = 1
    end
    object CompanyQryASLEASE: TStringField
      Alignment = taRightJustify
      FieldName = 'ASLEASE'
      Size = 1
    end
    object CompanyQryASKOMUN: TStringField
      Alignment = taRightJustify
      FieldName = 'ASKOMUN'
      Size = 1
    end
    object CompanyQryASBUILD: TStringField
      Alignment = taRightJustify
      FieldName = 'ASBUILD'
      Size = 1
    end
    object CompanyQryASMASTR: TStringField
      Alignment = taRightJustify
      FieldName = 'ASMASTR'
      Size = 1
    end
    object CompanyQryCOMPKIND: TStringField
      Alignment = taRightJustify
      DisplayLabel = #1054#1088#1075'.'#1092#1086#1088#1084#1072
      FieldName = 'COMPKIND'
      Size = 40
    end
    object CompanyQryVCARDNO: TIntegerField
      FieldName = 'VCARDNO'
    end
    object CompanyQryADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
    object CompanyQryASGUIDE: TStringField
      Alignment = taRightJustify
      FieldName = 'ASGUIDE'
      Size = 1
    end
    object CompanyQryASPARSL: TStringField
      Alignment = taRightJustify
      FieldName = 'ASPARSL'
      Size = 1
    end
    object CompanyQryFULLNAME: TMemoField
      Alignment = taRightJustify
      FieldName = 'FULLNAME'
      BlobType = ftMemo
      Size = 8
    end
    object CompanyQryASPARSE: TStringField
      Alignment = taRightJustify
      FieldName = 'ASPARSE'
      Size = 1
    end
    object CompanyQryBUS17: TStringField
      Alignment = taRightJustify
      FieldName = 'BUS17'
      Size = 1
    end
    object CompanyQryTAXPAYSTATEID: TIntegerField
      FieldName = 'TAXPAYSTATEID'
    end
    object CompanyQryDATEOBDZVIN: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'DATEOBDZVIN'
    end
    object CompanyQryMANOBDZVIN: TIntegerField
      FieldName = 'MANOBDZVIN'
    end
    object CompanyQryMANAGER: TStringField
      Alignment = taRightJustify
      FieldName = 'MANAGER'
      Size = 35
    end
    object CompanyQryORGFORMID: TIntegerField
      FieldName = 'ORGFORMID'
    end
    object CompanyQryTAXPAY: TStringField
      Alignment = taRightJustify
      FieldName = 'TAXPAY'
      Size = 1
    end
    object CompanyQryTAXPAYREGDATE: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'TAXPAYREGDATE'
    end
    object CompanyQryLICENSEDATE: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'LICENSEDATE'
    end
    object CompanyQryWARRANTYSUM: TFloatField
      FieldName = 'WARRANTYSUM'
    end
    object CompanyQryWARRANTYVAL: TIntegerField
      FieldName = 'WARRANTYVAL'
    end
    object CompanyQryWARRANTYTERM: TDateTimeField
      Alignment = taRightJustify
      FieldName = 'WARRANTYTERM'
    end
    object CompanyQryLICENSETERMIN: TStringField
      Alignment = taRightJustify
      FieldName = 'LICENSETERMIN'
      Size = 1
    end
    object CompanyQryLICENSENO: TStringField
      FieldName = 'LICENSENO'
      Size = 8
    end
    object CompanyQryTAXNAME: TStringField
      FieldName = 'TAXNAME'
      Size = 100
    end
    object CompanyQryORGFORMNAME: TStringField
      FieldName = 'ORGFORMNAME'
      Size = 75
    end
    object CompanyQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 25
    end
    object CompanyQryTRADENAME: TStringField
      FieldName = 'TRADENAME'
      Size = 150
    end
    object CompanyQryCOMPANYNAME: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1092#1110#1088#1084#1080
      FieldName = 'COMPANYNAME'
      Size = 250
    end
    object CompanyQryOBDZVIN: TIntegerField
      FieldName = 'OBDZVIN'
    end
    object CompanyQryOBDZVINAGREEDATE: TDateTimeField
      FieldName = 'OBDZVINAGREEDATE'
    end
    object CompanyQryACTIONID: TIntegerField
      FieldName = 'ACTIONID'
    end
    object CompanyQryGOVREESTRTYPEID: TIntegerField
      FieldName = 'GOVREESTRTYPEID'
    end
    object CompanyQryGOVREESTRDATE: TDateTimeField
      FieldName = 'GOVREESTRDATE'
    end
    object CompanyQrySINGLETAXTYPEID: TIntegerField
      FieldName = 'SINGLETAXTYPEID'
    end
    object CompanyQryTAXPAYTYPEID: TIntegerField
      FieldName = 'TAXPAYTYPEID'
    end
    object CompanyQryASNETAGENT: TStringField
      FieldName = 'ASNETAGENT'
      Size = 1
    end
    object CompanyQryPERMEXTRAAGENT: TStringField
      FieldName = 'PERMEXTRAAGENT'
      Size = 1
    end
    object CompanyQryAREWEB: TStringField
      FieldName = 'AREWEB'
      Size = 1
    end
    object CompanyQryAREAGENTCONTRACT: TStringField
      DisplayLabel = #1040#1075#1059#1075
      FieldName = 'AREAGENTCONTRACT'
      Size = 1
    end
    object CompanyQryDOCTODATE: TDateTimeField
      FieldName = 'DOCTODATE'
    end
    object CompanyQryCalcDateContract: TDateTimeField
      DisplayLabel = #1040#1075#1059#1075
      FieldKind = fkCalculated
      FieldName = 'CalcDateContract'
      Calculated = True
    end
    object CompanyQryISRCVORIG: TStringField
      FieldName = 'ISRCVORIG'
      Size = 1
    end
    object CompanyQryISSENDORIG: TStringField
      FieldName = 'ISSENDORIG'
      Size = 1
    end
    object CompanyQryISRCVCOPY: TStringField
      FieldName = 'ISRCVCOPY'
      Size = 1
    end
    object CompanyQryISSEND: TStringField
      FieldName = 'ISSEND'
      Size = 1
    end
    object CompanyQryTILLDATE: TDateTimeField
      FieldName = 'TILLDATE'
    end
    object CompanyQrySIGNDATE: TDateTimeField
      FieldName = 'SIGNDATE'
    end
    object CompanyQryISPRINTED: TStringField
      FieldName = 'ISPRINTED'
      Size = 1
    end
    object CompanyQryISSIGN: TStringField
      FieldName = 'ISSIGN'
      Size = 1
    end
    object CompanyQryOURPERSONID: TIntegerField
      FieldName = 'OURPERSONID'
    end
    object CompanyQryNUMCONTRACT: TStringField
      FieldName = 'NUMCONTRACT'
      Size = 15
    end
    object CompanyQryITSPERSONID: TIntegerField
      FieldName = 'ITSPERSONID'
    end
    object CompanyQryFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 100
    end
    object CompanyQryCOMPCONTRACTID: TIntegerField
      FieldName = 'COMPCONTRACTID'
    end
    object CompanyQrySORTBYCONTRACT: TIntegerField
      FieldName = 'SORTBYCONTRACT'
    end
    object CompanyQryFIXDEFECTTODATE: TDateTimeField
      FieldName = 'FIXDEFECTTODATE'
    end
    object CompanyQryISOBDZVIN: TStringField
      DisplayLabel = #1045#1082#1089#1087#1086#1088#1090' '#1090#1091#1088#1110#1074
      FieldKind = fkCalculated
      FieldName = 'ISOBDZVIN'
      Size = 10
      Calculated = True
    end
    object CompanyQryEXPTOURCOMPNOTE: TMemoField
      FieldName = 'EXPTOURCOMPNOTE'
      BlobType = ftMemo
      Size = 8
    end
    object CompanyQryISEXTEND: TStringField
      FieldName = 'ISEXTEND'
      Size = 1
    end
    object CompanyQryALLDATAFILL: TStringField
      FieldName = 'ALLDATAFILL'
      Size = 1
    end
    object CompanyQryStanDoc: TIntegerField
      FieldName = 'StanDoc'
    end
    object CompanyQryORDERCOUNT: TIntegerField
      DisplayLabel = #1047#1072#1084#1086#1074#1083#1077#1085#1085#1103
      FieldName = 'ORDERCOUNT'
    end
    object CompanyQryPERSCOUNT: TIntegerField
      DisplayLabel = #1058#1091#1088#1080#1089#1090#1080
      FieldName = 'PERSCOUNT'
    end
    object CompanyQryLASTDATECRORDER: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1089#1090#1072#1085#1085#1100#1086#1075#1086' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103
      FieldName = 'LASTDATECRORDER'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object CompanyQryISTOUROPER: TStringField
      FieldName = 'ISTOUROPER'
      Size = 1
    end
    object CompanyQryASAUPAIR: TStringField
      FieldName = 'ASAUPAIR'
      Size = 1
    end
    object CompanyQryCONTRACTCOMPNOTE: TMemoField
      FieldName = 'CONTRACTCOMPNOTE'
      BlobType = ftMemo
      Size = 8
    end
    object CompanyQryCntrEditManId: TIntegerField
      FieldName = 'CntrEditManId'
    end
    object CompanyQryHEADOFFICEID: TIntegerField
      FieldName = 'HEADOFFICEID'
    end
    object CompanyQryHEADOFFICENAME: TStringField
      FieldName = 'HEADOFFICENAME'
      Size = 250
    end
    object CompanyQryISFILIYA: TStringField
      FieldName = 'ISFILIYA'
      Size = 1
    end
    object CompanyQryISHEADOFFICE: TStringField
      FieldName = 'ISHEADOFFICE'
      Size = 1
    end
    object CompanyQryTRADENAMEID: TIntegerField
      FieldName = 'TRADENAMEID'
    end
    object CompanyQryNOTWORK: TStringField
      FieldName = 'NOTWORK'
      Size = 1
    end
    object CompanyQryAGENCYLOGO: TStringField
      FieldName = 'AGENCYLOGO'
      Size = 30
    end
    object CompanyQryPEYMTOAGENCY: TStringField
      FieldName = 'PEYMTOAGENCY'
      Size = 1
    end
    object CompanyQryPERMREREESTR: TStringField
      FieldName = 'PERMREREESTR'
      Size = 1
    end
    object CompanyQrySINGLETAXDATE: TDateTimeField
      FieldName = 'SINGLETAXDATE'
    end
    object CompanyQryCOMPIDFORCNTRCT: TIntegerField
      FieldName = 'COMPIDFORCNTRCT'
    end
    object CompanyQryCONTRACTPROMPT: TMemoField
      FieldName = 'CONTRACTPROMPT'
      BlobType = ftMemo
      Size = 8
    end
    object CompanyQryLOGDATETIME: TDateTimeField
      FieldName = 'LOGDATETIME'
    end
    object CompanyQryEXPNOTEMANAGER: TStringField
      FieldName = 'EXPNOTEMANAGER'
      Size = 35
    end
    object CompanyQryASRESIDENT: TStringField
      FieldName = 'ASRESIDENT'
      Size = 1
    end
    object CompanyQryCOMMONNOTE: TMemoField
      FieldName = 'COMMONNOTE'
      BlobType = ftMemo
      Size = 8
    end
    object CompanyQryCOMMONNOTEADDDATE: TDateTimeField
      DisplayLabel = #1047#1072#1075#1072#1083#1100#1085#1072' '#1085#1086#1090#1072#1090#1082#1072
      FieldName = 'COMMONNOTEADDDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object CompanyQryCOMMONNOTEMANID: TIntegerField
      FieldName = 'COMMONNOTEMANID'
    end
    object CompanyQryRCVORIGDATE: TDateTimeField
      FieldName = 'RCVORIGDATE'
    end
    object CompanyQryAREAGCNTRWITHOUTTDATE: TIBStringField
      FieldName = 'AREAGCNTRWITHOUTTDATE'
      Origin = '"SEL_COMPANIES_PROC"."AREAGCNTRWITHOUTTDATE"'
      Size = 1
    end
    object CompanyQryWORKMANID: TIntegerField
      FieldName = 'WORKMANID'
      Origin = '"SEL_COMPANIES_PROC"."WORKMANID"'
    end
    object CompanyQryNOTEADDMANID: TIntegerField
      FieldName = 'NOTEADDMANID'
      Origin = '"SEL_COMPANIES_PROC"."NOTEADDMANID"'
    end
    object CompanyQryREREESTR: TIBStringField
      FieldName = 'REREESTR'
      Origin = '"SEL_COMPANIES_PROC"."REREESTR"'
      Size = 1
    end
    object CompanyQryCOMPNOTEID: TIntegerField
      FieldName = 'COMPNOTEID'
      Origin = '"SEL_COMPANIES_PROC"."COMPNOTEID"'
    end
    object CompanyQryCONTRACTLOGID: TIntegerField
      FieldName = 'CONTRACTLOGID'
      Origin = '"SEL_COMPANIES_PROC"."CONTRACTLOGID"'
    end
    object CompanyQryORGFORMINNAME: TIBStringField
      FieldName = 'ORGFORMINNAME'
      Origin = '"SEL_COMPANIES_PROC"."ORGFORMINNAME"'
      Size = 1
    end
    object CompanyQryADDDATE: TDateTimeField
      FieldName = 'ADDDATE'
      Origin = '"SEL_COMPANIES_PROC"."ADDDATE"'
    end
    object CompanyQryBLACKLIST: TIBStringField
      FieldName = 'BLACKLIST'
      Origin = '"SEL_COMPANIES_PROC"."BLACKLIST"'
      Size = 1
    end
    object CompanyQryVIPCLIENT: TIBStringField
      FieldName = 'VIPCLIENT'
      Origin = '"SEL_COMPANIES_PROC"."VIPCLIENT"'
      Size = 1
    end
    object CompanyQryCalcTaxPayStateId: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CalcTaxPayStateId'
      Calculated = True
    end
    object CompanyQryCOMPANYTRADENAME: TIBStringField
      FieldName = 'COMPANYTRADENAME'
      Origin = '"SEL_COMPANIES_PROC"."COMPANYTRADENAME"'
      Size = 250
    end
  end
  object CompanySrc: TDataSource
    DataSet = CompanyQry
    Left = 1512
    Top = 288
  end
  object cxGridViewRepository3: TcxGridViewRepository
    Left = 1600
    Top = 264
    object ViewComp: TcxGridDBTableView
      DataController.DataSource = CompanySrc
      DataController.KeyFieldNames = 'COMPANYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object cxGridDBColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object cxGridDBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 384
      end
      object ViewCompanyCOMPANYTRADENAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072' '#1092#1110#1088#1084#1080
        DataBinding.FieldName = 'COMPANYTRADENAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        SortIndex = 1
        SortOrder = soAscending
        Width = 384
      end
      object cxGridDBColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'PERSCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 47
      end
      object cxGridDBColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'ORDERCOUNT'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 35
      end
      object cxGridDBColumn5: TcxGridDBColumn
        DataBinding.FieldName = 'LASTDATECRORDER'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 64
      end
      object cxGridDBColumn6: TcxGridDBColumn
        Caption = #1059#1075#1086#1076#1080
        DataBinding.FieldName = 'CalcDateContract'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 61
      end
      object cxGridDBColumn7: TcxGridDBColumn
        Caption = #1059#1075#1086#1076#1080
        DataBinding.FieldName = 'SORTBYCONTRACT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 61
      end
      object cxGridDBColumn8: TcxGridDBColumn
        DataBinding.FieldName = 'ISOBDZVIN'
        Width = 49
      end
      object cxGridDBColumn9: TcxGridDBColumn
        DataBinding.FieldName = 'COMMONNOTEADDDATE'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 62
      end
      object cxGridDBColumn10: TcxGridDBColumn
        DataBinding.FieldName = 'OBDZVINAGREEDATE'
        Visible = False
      end
      object cxGridDBColumn11: TcxGridDBColumn
        DataBinding.FieldName = 'AREWEB'
        Visible = False
      end
      object cxGridDBColumn12: TcxGridDBColumn
        DataBinding.FieldName = 'FIXDEFECTTODATE'
        Visible = False
      end
      object cxGridDBColumn13: TcxGridDBColumn
        DataBinding.FieldName = 'OBDZVIN'
        Visible = False
      end
      object cxGridDBColumn14: TcxGridDBColumn
        DataBinding.FieldName = 'ISHEADOFFICE'
        Visible = False
      end
      object cxGridDBColumn15: TcxGridDBColumn
        DataBinding.FieldName = 'NOTWORK'
        Visible = False
      end
      object cxGridDBColumn16: TcxGridDBColumn
        DataBinding.FieldName = 'AGENCYLOGO'
        Visible = False
      end
      object cxGridDBColumn17: TcxGridDBColumn
        DataBinding.FieldName = 'DOCTODATE'
        Visible = False
      end
      object ViewCompanyISAGENT: TcxGridDBColumn
        DataBinding.FieldName = 'ISAGENT'
        Visible = False
      end
      object ViewCompanyISCLIENT: TcxGridDBColumn
        Caption = 'ISCLIENT'
        DataBinding.FieldName = 'ISCLIENT'
        Visible = False
      end
      object cxGridDBColumn18: TcxGridDBColumn
        Caption = 'ISVENDOR'
        DataBinding.FieldName = 'ISVENDOR'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 42
      end
      object ViewCompanyISTOUROPER: TcxGridDBColumn
        DataBinding.FieldName = 'ISTOUROPER'
        Visible = False
      end
      object ViewCompanyISOTHER: TcxGridDBColumn
        DataBinding.FieldName = 'ISOTHER'
        Visible = False
      end
      object ViewCompanyASDRIVE: TcxGridDBColumn
        DataBinding.FieldName = 'ASDRIVE'
        Visible = False
      end
      object ViewCompanyASHOTEL: TcxGridDBColumn
        DataBinding.FieldName = 'ASHOTEL'
        Visible = False
      end
      object ViewCompanyASVISAS: TcxGridDBColumn
        DataBinding.FieldName = 'ASVISAS'
        Visible = False
      end
      object ViewCompanyASINSUR: TcxGridDBColumn
        DataBinding.FieldName = 'ASINSUR'
        Visible = False
      end
      object ViewCompanyASEXCRS: TcxGridDBColumn
        DataBinding.FieldName = 'ASEXCRS'
        Visible = False
      end
      object ViewCompanyASREKLM: TcxGridDBColumn
        DataBinding.FieldName = 'ASREKLM'
        Visible = False
      end
      object ViewCompanyASTICKT: TcxGridDBColumn
        DataBinding.FieldName = 'ASTICKT'
        Visible = False
      end
      object ViewCompanyASTOURS: TcxGridDBColumn
        DataBinding.FieldName = 'ASTOURS'
        Visible = False
      end
      object ViewCompanyASSCOLL: TcxGridDBColumn
        DataBinding.FieldName = 'ASSCOLL'
        Visible = False
      end
      object ViewCompanyASAPAIR: TcxGridDBColumn
        DataBinding.FieldName = 'ASAPAIR'
        Visible = False
      end
      object ViewCompanyASEMPLS: TcxGridDBColumn
        DataBinding.FieldName = 'ASEMPLS'
        Visible = False
      end
      object ViewCompanyASFOODS: TcxGridDBColumn
        DataBinding.FieldName = 'ASFOODS'
        Visible = False
      end
      object ViewCompanyASURIST: TcxGridDBColumn
        DataBinding.FieldName = 'ASURIST'
        Visible = False
      end
      object ViewCompanyASMEDIC: TcxGridDBColumn
        DataBinding.FieldName = 'ASMEDIC'
        Visible = False
      end
      object ViewCompanyASRECRE: TcxGridDBColumn
        DataBinding.FieldName = 'ASRECRE'
        Visible = False
      end
      object ViewCompanyASEXTRM: TcxGridDBColumn
        DataBinding.FieldName = 'ASEXTRM'
        Visible = False
      end
      object ViewCompanyASOTHER: TcxGridDBColumn
        DataBinding.FieldName = 'ASOTHER'
        Visible = False
      end
      object ViewCompanyASMUSEM: TcxGridDBColumn
        DataBinding.FieldName = 'ASMUSEM'
        Visible = False
      end
      object ViewCompanyASXHIBT: TcxGridDBColumn
        DataBinding.FieldName = 'ASXHIBT'
        Visible = False
      end
      object ViewCompanyASAMBAS: TcxGridDBColumn
        DataBinding.FieldName = 'ASAMBAS'
        Visible = False
      end
      object ViewCompanyASCOMMC: TcxGridDBColumn
        DataBinding.FieldName = 'ASCOMMC'
        Visible = False
      end
      object ViewCompanyASCMPTR: TcxGridDBColumn
        DataBinding.FieldName = 'ASCMPTR'
        Visible = False
      end
      object ViewCompanyASSTNRY: TcxGridDBColumn
        DataBinding.FieldName = 'ASSTNRY'
        Visible = False
      end
      object ViewCompanyASFURNT: TcxGridDBColumn
        DataBinding.FieldName = 'ASFURNT'
        Visible = False
      end
      object ViewCompanyASGOODS: TcxGridDBColumn
        DataBinding.FieldName = 'ASGOODS'
        Visible = False
      end
      object ViewCompanyASPETRL: TcxGridDBColumn
        DataBinding.FieldName = 'ASPETRL'
        Visible = False
      end
      object ViewCompanyASMEDIA: TcxGridDBColumn
        DataBinding.FieldName = 'ASMEDIA'
        Visible = False
      end
      object ViewCompanyASCONSL: TcxGridDBColumn
        DataBinding.FieldName = 'ASCONSL'
        Visible = False
      end
      object ViewCompanyASGUARD: TcxGridDBColumn
        DataBinding.FieldName = 'ASGUARD'
        Visible = False
      end
      object ViewCompanyASBANKS: TcxGridDBColumn
        DataBinding.FieldName = 'ASBANKS'
        Visible = False
      end
      object ViewCompanyASLEASE: TcxGridDBColumn
        DataBinding.FieldName = 'ASLEASE'
        Visible = False
      end
      object ViewCompanyASKOMUN: TcxGridDBColumn
        DataBinding.FieldName = 'ASKOMUN'
        Visible = False
      end
      object ViewCompanyASBUILD: TcxGridDBColumn
        DataBinding.FieldName = 'ASBUILD'
        Visible = False
      end
      object ViewCompanyASMASTR: TcxGridDBColumn
        DataBinding.FieldName = 'ASMASTR'
        Visible = False
      end
      object ViewCompanyASGUIDE: TcxGridDBColumn
        DataBinding.FieldName = 'ASGUIDE'
        Visible = False
      end
      object ViewCompanyASPARSL: TcxGridDBColumn
        DataBinding.FieldName = 'ASPARSL'
        Visible = False
      end
      object ViewCompanyASPARSE: TcxGridDBColumn
        DataBinding.FieldName = 'ASPARSE'
        Visible = False
      end
      object ViewCompanyBUS17: TcxGridDBColumn
        DataBinding.FieldName = 'BUS17'
        Visible = False
      end
      object ViewCompanyASNETAGENT: TcxGridDBColumn
        DataBinding.FieldName = 'ASNETAGENT'
        Visible = False
      end
      object ViewCompanyASAUPAIR: TcxGridDBColumn
        DataBinding.FieldName = 'ASAUPAIR'
        Visible = False
      end
      object ViewCompanyISGOVERN: TcxGridDBColumn
        DataBinding.FieldName = 'ISGOVERN'
        Visible = False
      end
      object ViewCompanyISENTERPR: TcxGridDBColumn
        DataBinding.FieldName = 'ISENTERPR'
        Visible = False
      end
      object ViewCompanyISBUDGET: TcxGridDBColumn
        DataBinding.FieldName = 'ISBUDGET'
        Visible = False
      end
      object ViewCompanyISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
        Visible = False
      end
      object ViewCompanyISBSMAN: TcxGridDBColumn
        DataBinding.FieldName = 'ISBSMAN'
        Visible = False
      end
      object ViewCompanyCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object ViewCompanyCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
        Visible = False
      end
    end
    object cxGridDBTableView6: TcxGridDBTableView
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object cxGridDBColumn19: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object cxGridDBColumn20: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 303
      end
      object cxGridDBColumn21: TcxGridDBColumn
        Caption = #1051#1072#1090'.'
        DataBinding.FieldName = 'LATNAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 39
      end
    end
    object ViewCompanyCity: TcxGridDBTableView
      DataController.KeyFieldNames = 'CITYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewCompanyCityCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompanyCityNAME: TcxGridDBColumn
        Caption = #1052#1110#1089#1090#1086
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompanyCityNAME_ENG: TcxGridDBColumn
        DataBinding.FieldName = 'NAME_ENG'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompanyCityPROVINCE: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompanyCityTOWNSHIP: TcxGridDBColumn
        DataBinding.FieldName = 'TOWNSHIP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCompanyCityCalcCity: TcxGridDBColumn
        DataBinding.FieldName = 'CalcCity'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewEmail: TcxGridDBTableView
      DataController.KeyFieldNames = 'EMAILID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewEmailCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
      end
      object ViewEmailOFFICEID: TcxGridDBColumn
        DataBinding.FieldName = 'OFFICEID'
        Visible = False
      end
      object ViewEmailEMAILID: TcxGridDBColumn
        DataBinding.FieldName = 'EMAILID'
        Visible = False
      end
      object ViewEmailEMAIL: TcxGridDBColumn
        Caption = #1045'-'#1084#1077#1081#1083
        DataBinding.FieldName = 'EMAIL'
      end
    end
    object ViewWebSite: TcxGridDBTableView
      DataController.KeyFieldNames = 'WEBSITEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewWebSiteOFFICEID: TcxGridDBColumn
        DataBinding.FieldName = 'OFFICEID'
        Visible = False
      end
      object ViewWebSiteWEBSITEID: TcxGridDBColumn
        DataBinding.FieldName = 'WEBSITEID'
        Visible = False
      end
      object ViewWebSiteWEBSITE: TcxGridDBColumn
        DataBinding.FieldName = 'WEBSITE'
      end
    end
    object ViewPhone: TcxGridDBTableView
      DataController.KeyFieldNames = 'PHONEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewPhoneCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewPhoneOFFICEID: TcxGridDBColumn
        DataBinding.FieldName = 'OFFICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewPhonePHONEID: TcxGridDBColumn
        DataBinding.FieldName = 'PHONEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewPhoneCNTRYCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CNTRYCODE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 42
      end
      object ViewPhoneAREACODE: TcxGridDBColumn
        DataBinding.FieldName = 'AREACODE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 56
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 56
      end
      object ViewPhonePHONENO: TcxGridDBColumn
        DataBinding.FieldName = 'PHONENO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 75
      end
      object ViewPhoneEXTENTION: TcxGridDBColumn
        DataBinding.FieldName = 'EXTENTION'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 47
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 47
      end
      object ViewPhoneISDEFPHN: TcxGridDBColumn
        DataBinding.FieldName = 'ISDEFPHN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewPhoneISREDPHN: TcxGridDBColumn
        DataBinding.FieldName = 'ISREDPHN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewPhonePBXSPEEDCODE: TcxGridDBColumn
        DataBinding.FieldName = 'PBXSPEEDCODE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewPhoneCalcPhoneNo: TcxGridDBColumn
        DataBinding.FieldName = 'CalcPhoneNo'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewFax: TcxGridDBTableView
      DataController.KeyFieldNames = 'PHONEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewFaxCOMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewFaxOFFICEID: TcxGridDBColumn
        DataBinding.FieldName = 'OFFICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewFaxPHONEID: TcxGridDBColumn
        DataBinding.FieldName = 'PHONEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewFaxCNTRYCODE: TcxGridDBColumn
        DataBinding.FieldName = 'CNTRYCODE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 42
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 42
      end
      object ViewFaxAREACODE: TcxGridDBColumn
        DataBinding.FieldName = 'AREACODE'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 56
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 56
      end
      object ViewFaxPHONENO: TcxGridDBColumn
        DataBinding.FieldName = 'PHONENO'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 75
      end
      object ViewFaxEXTENTION: TcxGridDBColumn
        DataBinding.FieldName = 'EXTENTION'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 47
        Options.Filtering = False
        Options.HorzSizing = False
        Width = 47
      end
      object ViewFaxISDEFFAX: TcxGridDBColumn
        DataBinding.FieldName = 'ISDEFFAX'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewFaxISENABLED: TcxGridDBColumn
        DataBinding.FieldName = 'ISENABLED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewFaxISENABLED2: TcxGridDBColumn
        DataBinding.FieldName = 'ISENABLED2'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
      object ViewFaxPBXSPEEDCODE: TcxGridDBColumn
        DataBinding.FieldName = 'PBXSPEEDCODE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 64
        Options.Filtering = False
        Options.HorzSizing = False
      end
    end
    object ViewCompany2: TcxGridDBTableView
      DataController.DataModeController.GridMode = True
      DataController.DataSource = CompanySrc
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewCompany2COMPANYID: TcxGridDBColumn
        DataBinding.FieldName = 'COMPANYID'
      end
      object ViewCompany2NAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewCompany2ISENTERPR: TcxGridDBColumn
        DataBinding.FieldName = 'ISENTERPR'
      end
      object ViewCompany2ISPRIVATE: TcxGridDBColumn
        DataBinding.FieldName = 'ISPRIVATE'
      end
    end
  end
  object TestTree: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from TEST_TREE')
    Left = 1264
    Top = 672
    object TestTreeID: TIntegerField
      FieldName = 'ID'
      Origin = '"TEST_TREE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TestTreePAR_ID: TIntegerField
      FieldName = 'PAR_ID'
      Origin = '"TEST_TREE"."PAR_ID"'
    end
    object TestTreeNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TEST_TREE"."NAME"'
      Size = 250
    end
    object TestTreeCHECK: TSmallintField
      FieldName = 'ACHECK'
      Origin = '"TEST_TREE"."CHECK"'
    end
  end
  object TestTreeSrc: TDataSource
    DataSet = TestTree
    Left = 1320
    Top = 680
  end
  object ImageChecked: TImageList
    Left = 1312
    Top = 64
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A000E3E3E300E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300FFFFFF00000000000000000000000000A0A0A000E3E3E300E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300FFFFFF00000000000000000000000000A0A0A000E3E3E300E3E3
      E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3E300E3E3
      E300E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000F0F0F000F0F0F000A0A0A000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000F0F0F000A0A0A000A0A0A000A0A0A000F0F0F000F0F0F000F0F0F000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000F0F0F000F0F0F000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000A0A0A000A0A0A000F0F0F000A0A0A000A0A0A000A0A0A000F0F0F000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000A0A0A000F0F0F000F0F0F000F0F0F000A0A0A000A0A0A000A0A0A000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000A0A0A000A0A0A000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000A0A0A000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00E3E3E300FFFFFF00000000000000000000000000A0A0A00069696900F0F0
      F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0F000F0F0
      F000E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A000696969006969
      6900696969006969690069696900696969006969690069696900696969006969
      6900E3E3E300FFFFFF00000000000000000000000000A0A0A000696969006969
      6900696969006969690069696900696969006969690069696900696969006969
      6900E3E3E300FFFFFF00000000000000000000000000A0A0A000696969006969
      6900696969006969690069696900696969006969690069696900696969006969
      6900E3E3E300FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000FFFFFF00000000000000000000000000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000FFFFFF00000000000000000000000000A0A0A000A0A0A000A0A0
      A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0A000A0A0
      A000A0A0A000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      8003800380030000800380038003000080038003800300008003800380030000
      8003800380030000800380038003000080038003800300008003800380030000
      8003800380030000800380038003000080038003800300008003800380030000
      8003800380030000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object Languages: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from LANGUAGES')
    Left = 1472
    Top = 335
  end
  object LanguagesSrc: TDataSource
    DataSet = Languages
    Left = 1488
    Top = 352
  end
  object CNTREMBASSIES: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from CNTREMBASSIES')
    Left = 1416
    Top = 680
    object CNTREMBASSIESCNTREMBASSYID: TIntegerField
      FieldName = 'CNTREMBASSYID'
      Origin = '"CNTREMBASSIES"."CNTREMBASSYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CNTREMBASSIESCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"CNTREMBASSIES"."COUNTRYID"'
    end
    object CNTREMBASSIESEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
      Origin = '"CNTREMBASSIES"."EMBASSYID"'
    end
    object CNTREMBASSIESOUREMBASSY: TIBStringField
      FieldName = 'OUREMBASSY'
      Origin = '"CNTREMBASSIES"."OUREMBASSY"'
      Size = 1
    end
    object CNTREMBASSIESPERMTRANSFDOC: TSmallintField
      FieldName = 'PERMTRANSFDOC'
      Origin = '"CNTREMBASSIES"."PERMTRANSFDOC"'
    end
    object CNTREMBASSIESINPROVINCE: TIBStringField
      FieldName = 'INPROVINCE'
      Origin = '"CNTREMBASSIES"."INPROVINCE"'
      Size = 80
    end
    object CNTREMBASSIESALLREGION: TIBStringField
      FieldName = 'ALLREGION'
      Origin = '"CNTREMBASSIES"."ALLREGION"'
      Size = 1
    end
    object CNTREMBASSIESPAYBANKSERV: TFloatField
      FieldName = 'PAYBANKSERV'
      Origin = '"CNTREMBASSIES"."PAYBANKSERV"'
    end
    object CNTREMBASSIESCURRSERV: TSmallintField
      FieldName = 'CURRSERV'
      Origin = '"CNTREMBASSIES"."CURRSERV"'
    end
    object CNTREMBASSIESFUNDINGSUM: TFloatField
      FieldName = 'FUNDINGSUM'
      Origin = '"CNTREMBASSIES"."FUNDINGSUM"'
    end
    object CNTREMBASSIESFUNDINGVAL: TSmallintField
      FieldName = 'FUNDINGVAL'
      Origin = '"CNTREMBASSIES"."FUNDINGVAL"'
    end
    object CNTREMBASSIESFUNDINGCOUNT: TIntegerField
      FieldName = 'FUNDINGCOUNT'
      Origin = '"CNTREMBASSIES"."FUNDINGCOUNT"'
    end
    object CNTREMBASSIESFUNDINGPERIOD: TSmallintField
      FieldName = 'FUNDINGPERIOD'
      Origin = '"CNTREMBASSIES"."FUNDINGPERIOD"'
    end
    object CNTREMBASSIESBANKSUM: TFloatField
      FieldName = 'BANKSUM'
      Origin = '"CNTREMBASSIES"."BANKSUM"'
    end
    object CNTREMBASSIESBANKVAL: TSmallintField
      FieldName = 'BANKVAL'
      Origin = '"CNTREMBASSIES"."BANKVAL"'
    end
    object CNTREMBASSIESBANKCOUNT: TIntegerField
      FieldName = 'BANKCOUNT'
      Origin = '"CNTREMBASSIES"."BANKCOUNT"'
    end
    object CNTREMBASSIESBANKPERIOD: TSmallintField
      FieldName = 'BANKPERIOD'
      Origin = '"CNTREMBASSIES"."BANKPERIOD"'
    end
    object CNTREMBASSIESONTOURSUM: TFloatField
      FieldName = 'ONTOURSUM'
      Origin = '"CNTREMBASSIES"."ONTOURSUM"'
    end
    object CNTREMBASSIESAUTOFILLING: TIBStringField
      FieldName = 'AUTOFILLING'
      Origin = '"CNTREMBASSIES"."AUTOFILLING"'
      Size = 1
    end
    object CNTREMBASSIESREADYTODAYS: TIntegerField
      FieldName = 'READYTODAYS'
      Origin = '"CNTREMBASSIES"."READYTODAYS"'
    end
    object CNTREMBASSIESREADYTOTYPE: TIntegerField
      FieldName = 'READYTOTYPE'
      Origin = '"CNTREMBASSIES"."READYTOTYPE"'
    end
    object CNTREMBASSIESUSECODE: TIBStringField
      FieldName = 'USECODE'
      Origin = '"CNTREMBASSIES"."USECODE"'
      Size = 1
    end
    object CNTREMBASSIESOURFILING: TIBStringField
      FieldName = 'OURFILING'
      Origin = '"CNTREMBASSIES"."OURFILING"'
      Size = 1
    end
    object CNTREMBASSIESAPPLTYPEDATE: TIntegerField
      FieldName = 'APPLTYPEDATE'
      Origin = '"CNTREMBASSIES"."APPLTYPEDATE"'
    end
    object CNTREMBASSIESSERVCOST: TFloatField
      FieldName = 'SERVCOST'
      Origin = '"CNTREMBASSIES"."SERVCOST"'
    end
    object CNTREMBASSIESSERVCOSTVAL: TSmallintField
      FieldName = 'SERVCOSTVAL'
      Origin = '"CNTREMBASSIES"."SERVCOSTVAL"'
    end
    object CNTREMBASSIESSHORTNAME: TIBStringField
      FieldName = 'SHORTNAME'
      Origin = '"CNTREMBASSIES"."SHORTNAME"'
      Size = 5
    end
    object CNTREMBASSIESPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"CNTREMBASSIES"."PARENTID"'
    end
    object CNTREMBASSIESFILINGPLACEWORK: TIBStringField
      FieldName = 'FILINGPLACEWORK'
      Origin = '"CNTREMBASSIES"."FILINGPLACEWORK"'
      Size = 1
    end
    object CNTREMBASSIESNOTUSED: TIBStringField
      FieldName = 'NOTUSED'
      Origin = '"CNTREMBASSIES"."NOTUSED"'
      Size = 1
    end
    object CNTREMBASSIESFULLFUNDING: TIBStringField
      FieldName = 'FULLFUNDING'
      Origin = '"CNTREMBASSIES"."FULLFUNDING"'
      Size = 1
    end
    object CNTREMBASSIESTYPEFUNDING: TIntegerField
      FieldName = 'TYPEFUNDING'
      Origin = '"CNTREMBASSIES"."TYPEFUNDING"'
    end
    object CNTREMBASSIESFOROWNERVISA: TIBStringField
      FieldName = 'FOROWNERVISA'
      Origin = '"CNTREMBASSIES"."FOROWNERVISA"'
      Size = 1
    end
    object CNTREMBASSIESCOMMENTS: TMemoField
      FieldName = 'COMMENTS'
      Origin = '"CNTREMBASSIES"."COMMENTS"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object CNTREMBASSIESFORBIOMETRICPASS: TIBStringField
      FieldName = 'FORBIOMETRICPASS'
      Origin = '"CNTREMBASSIES"."FORBIOMETRICPASS"'
      Size = 1
    end
  end
  object CNTREMBASSIESSrc: TDataSource
    DataSet = CNTREMBASSIES
    Left = 1464
    Top = 696
  end
  object CNTREMBAS_INPROVINCE: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from CNTREMBAS_INPROVINCE')
    Left = 1552
    Top = 672
    object CNTREMBAS_INPROVINCEID: TIntegerField
      FieldName = 'ID'
      Origin = '"CNTREMBAS_INPROVINCE"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CNTREMBAS_INPROVINCECNTREMBASSYID: TIntegerField
      FieldName = 'CNTREMBASSYID'
      Origin = '"CNTREMBAS_INPROVINCE"."CNTREMBASSYID"'
    end
    object CNTREMBAS_INPROVINCEPROVINCEID: TIntegerField
      FieldName = 'PROVINCEID'
      Origin = '"CNTREMBAS_INPROVINCE"."PROVINCEID"'
    end
  end
  object CNTREMBAS_INPROVINCESSrc: TDataSource
    DataSet = CNTREMBAS_INPROVINCE
    Left = 1600
    Top = 688
  end
  object IBRATEQry: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    DataSource = TourSrc
    SQL.Strings = (
      
        'select TOURES.id TourId,TOURES.tourname,TOURTEMPLATES.daycount T' +
        'ourDays, TourGroups.tourgroupid, TourGroups.tourdate,'
      
        '        rate_line.id RateLineId,rate_line.name RateLineName,rate' +
        '_line.atype RateLineType,RATE_LINE_DATE.date_start RateLineDateS' +
        'tart,'
      
        '        RATE_LINE_DATE.date_end RateLineDateEnd, RATE_LINE_SERV.' +
        'id_service, RATE_LINE_SERV.type_service,'
      
        '        (select first 1 SERVICESKIND_LNG.name from SERVICESKIND_' +
        'LNG where SERVICESKIND_LNG.id_serviceskind = RATE_LINE_SERV.type' +
        '_service and SERVICESKIND_LnG.id_lng = :ID_LNG ) NameService ,'
      '        RATE_LINE_SERV.id_currency,'
      
        '        (select first 1 currency_lng.currencyname from currency_' +
        'lng where currency_lng.id_currency = RATE_LINE_SERV.id_currency ' +
        'and currency_lng.id_lng = :ID_LNG ) NameCurrency ,'
      
        '        (select first 1 currency_lng.coins from currency_lng whe' +
        're currency_lng.id_currency = RATE_LINE_SERV.id_currency and cur' +
        'rency_lng.id_lng = :ID_LNG ) NameCoinsCurrency ,'
      ''
      '        RATE_LINE_SERV_DETAIL.id RateLineDetailId,'
      '        RATE_LINE_SERV_DETAIL.rate ,'
      '        RATE_LINE_SERV_DETAIL.agentpay'
      ''
      '       from TourGroups'
      ' left join TOURES on TOURES.id = TourGroups.tourid'
      
        ' left join TOURTEMPLATES on TourGroups.tourtemplateid = TOURTEMP' +
        'LATES.tourtemplateid'
      ' left join rate_line on rate_line.id = TourGroups.id_rate_line'
      
        ' left join RATE_LINE_DATE on RATE_LINE_DATE.id_rate_line = RATE_' +
        'LINE.id'
      
        ' left join RATE_LINE_CATEGORY on RATE_LINE_CATEGORY.id_rate_line' +
        '_date = RATE_LINE_DATE.id and ( ( ID_CATEGORY_ORDERS = :CATEGORY' +
        '_ORDERS ) or ( ID_CATEGORY_ORDERS = 0)  )'
      
        ' left join RATE_LINE_SEASON on RATE_LINE_SEASON.id_rate_line_cat' +
        'egory = RATE_LINE_CATEGORY.id'
      
        ' left join RATE_LINE_SERV on RATE_LINE_SERV.id_rate_line_season ' +
        '= RATE_LINE_SEASON.id'
      
        ' left join RATE_LINE_SERV_DETAIL on RATE_LINE_SERV_DETAIL.id_rat' +
        'e_line_serv =  RATE_LINE_SERV.id'
      
        ' left join shr( RATE_LINE_SEASON.days, DOW( TourGroups.tourdate ' +
        ')-1 ) CHECK_DAYS on 1 = 1'
      ' where  RATE_LINE_DATE.state = 0 and'
      ''
      
        '      :DATEPAY between RATE_LINE_DATE.date_start and RATE_LINE_D' +
        'ATE.date_end and'
      
        '      TourGroups.tourdate between EncodeDate( RATE_LINE_SEASON.d' +
        'ay_start, RATE_LINE_SEASON.month_start, extractyear(TourGroups.t' +
        'ourdate) ) and'
      
        '                           EncodeDate(  RATE_LINE_SEASON.day_til' +
        'l, RATE_LINE_SEASON.month_till, extractyear(TourGroups.tourdate)' +
        ' ) and'
      
        '                           ( (( :AGE >= RATE_LINE_SERV_DETAIL.ag' +
        'e_from) and ( ( RATE_LINE_SERV_DETAIL.age_to<= :AGE ) or (RATE_L' +
        'INE_SERV_DETAIL.age_to=-1))) ) and'
      
        '                           ( (( DAYSBETWEEN( :DATEPAY, TourGroup' +
        's.tourdate )>=RATE_LINE_SERV_DETAIL.period_from) and'
      
        '                           ( (DAYSBETWEEN( :DATEPAY, TourGroups.' +
        'tourdate )<=RATE_LINE_SERV_DETAIL.period_to) or ((RATE_LINE_SERV' +
        '_DETAIL.period_to=-1))  ) ) ) and'
      
        '                           mod( CHECK_DAYS.res , 2 ) <> 0 and ( ' +
        'TourGroups.TourDate >= :DATE_START and ( (TourGroups.TourDate <=' +
        ' :DATE_END)  ) ) and'
      
        '                           ((  TOURES.id = :ID_TOUR) or ( :ID_TO' +
        'UR = -1) )')
    Left = 800
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_LNG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_LNG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_LNG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CATEGORY_ORDERS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATEPAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AGE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATEPAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATEPAY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_START'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATE_END'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TOUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_TOUR'
        ParamType = ptUnknown
      end>
    object IBRATEQryTOURID: TIntegerField
      FieldName = 'TOURID'
      Origin = '"TOURES"."ID"'
    end
    object IBRATEQryTOURNAME: TIBStringField
      FieldName = 'TOURNAME'
      Origin = '"TOURES"."TOURNAME"'
      Size = 250
    end
    object IBRATEQryTOURDAYS: TSmallintField
      FieldName = 'TOURDAYS'
      Origin = '"TOURTEMPLATES"."DAYCOUNT"'
    end
    object IBRATEQryTOURGROUPID: TIntegerField
      FieldName = 'TOURGROUPID'
      Origin = '"TOURGROUPS"."TOURGROUPID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBRATEQryTOURDATE: TDateTimeField
      FieldName = 'TOURDATE'
      Origin = '"TOURGROUPS"."TOURDATE"'
    end
    object IBRATEQryRATELINEID: TIntegerField
      FieldName = 'RATELINEID'
      Origin = '"RATE_LINE"."ID"'
    end
    object IBRATEQryRATELINENAME: TIBStringField
      FieldName = 'RATELINENAME'
      Origin = '"RATE_LINE"."NAME"'
      Size = 250
    end
    object IBRATEQryRATELINETYPE: TIntegerField
      FieldName = 'RATELINETYPE'
      Origin = '"RATE_LINE"."ATYPE"'
    end
    object IBRATEQryRATELINEDATESTART: TDateTimeField
      FieldName = 'RATELINEDATESTART'
      Origin = '"RATE_LINE_DATE"."DATE_START"'
    end
    object IBRATEQryRATELINEDATEEND: TDateTimeField
      FieldName = 'RATELINEDATEEND'
      Origin = '"RATE_LINE_DATE"."DATE_END"'
    end
    object IBRATEQryID_SERVICE: TIntegerField
      FieldName = 'ID_SERVICE'
      Origin = '"RATE_LINE_SERV"."ID_SERVICE"'
    end
    object IBRATEQryTYPE_SERVICE: TIntegerField
      FieldName = 'TYPE_SERVICE'
      Origin = '"RATE_LINE_SERV"."TYPE_SERVICE"'
    end
    object IBRATEQryNAMESERVICE: TIBStringField
      FieldName = 'NAMESERVICE'
      ProviderFlags = []
      Size = 100
    end
    object IBRATEQryID_CURRENCY: TIntegerField
      FieldName = 'ID_CURRENCY'
      Origin = '"RATE_LINE_SERV"."ID_CURRENCY"'
    end
    object IBRATEQryNAMECURRENCY: TIBStringField
      FieldName = 'NAMECURRENCY'
      ProviderFlags = []
      Size = 30
    end
    object IBRATEQryRATELINEDETAILID: TIntegerField
      FieldName = 'RATELINEDETAILID'
      Origin = '"RATE_LINE_SERV_DETAIL"."ID"'
    end
    object IBRATEQryRATE: TFloatField
      FieldName = 'RATE'
      Origin = '"RATE_LINE_SERV_DETAIL"."RATE"'
    end
    object IBRATEQryAGENTPAY: TFloatField
      FieldName = 'AGENTPAY'
      Origin = '"RATE_LINE_SERV_DETAIL"."AGENTPAY"'
    end
    object IBRATEQryNAMECOINSCURRENCY: TIBStringField
      FieldName = 'NAMECOINSCURRENCY'
      ProviderFlags = []
      Size = 30
    end
  end
  object IBRATESrc: TDataSource
    DataSet = IBRATEQry
    Left = 832
    Top = 368
  end
  object IBCOMPANIES_PARAM_NAME: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DESCRIPT'
        DataType = ftString
        Size = 200
      end>
    StoreDefs = True
    TableName = 'COMPANIES_PARAM_NAME'
    Left = 1584
    Top = 104
    object IBCOMPANIES_PARAM_NAMEID: TIntegerField
      FieldName = 'ID'
    end
    object IBCOMPANIES_PARAM_NAMENAME: TIBStringField
      FieldName = 'NAME'
      Size = 50
    end
    object IBCOMPANIES_PARAM_NAMEDESCRIPT: TIBStringField
      FieldName = 'DESCRIPT'
      Size = 200
    end
  end
  object IBCOMPANIES: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    TableName = 'COMPANIES'
    Left = 1680
    Top = 56
    object IBCOMPANIESCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
      Required = True
    end
    object IBCOMPANIESISVENDOR: TIBStringField
      FieldName = 'ISVENDOR'
      Size = 1
    end
    object IBCOMPANIESISCLIENT: TIBStringField
      FieldName = 'ISCLIENT'
      Size = 1
    end
    object IBCOMPANIESCLASSCODE: TIBStringField
      FieldName = 'CLASSCODE'
      Size = 8
    end
    object IBCOMPANIESTAXPAYCODE: TIBStringField
      FieldName = 'TAXPAYCODE'
      Size = 12
    end
    object IBCOMPANIESASDRIVE: TIBStringField
      FieldName = 'ASDRIVE'
      Size = 1
    end
    object IBCOMPANIESASHOTEL: TIBStringField
      FieldName = 'ASHOTEL'
      Size = 1
    end
    object IBCOMPANIESASVISAS: TIBStringField
      FieldName = 'ASVISAS'
      Size = 1
    end
    object IBCOMPANIESASINSUR: TIBStringField
      FieldName = 'ASINSUR'
      Size = 1
    end
    object IBCOMPANIESASEXCRS: TIBStringField
      FieldName = 'ASEXCRS'
      Size = 1
    end
    object IBCOMPANIESASREKLM: TIBStringField
      FieldName = 'ASREKLM'
      Size = 1
    end
    object IBCOMPANIESASOTHER: TIBStringField
      FieldName = 'ASOTHER'
      Size = 1
    end
    object IBCOMPANIESLICENSENO: TIBStringField
      FieldName = 'LICENSENO'
      Size = 8
    end
    object IBCOMPANIESMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
    end
    object IBCOMPANIESASTICKT: TIBStringField
      FieldName = 'ASTICKT'
      Size = 1
    end
    object IBCOMPANIESASTOURS: TIBStringField
      FieldName = 'ASTOURS'
      Size = 1
    end
    object IBCOMPANIESISOTHER: TIBStringField
      FieldName = 'ISOTHER'
      Size = 1
    end
    object IBCOMPANIESISENTERPR: TIBStringField
      FieldName = 'ISENTERPR'
      Size = 1
    end
    object IBCOMPANIESISPRIVATE: TIBStringField
      FieldName = 'ISPRIVATE'
      Size = 1
    end
    object IBCOMPANIESIDENTCODE: TIBStringField
      FieldName = 'IDENTCODE'
      Size = 10
    end
    object IBCOMPANIESASSCOLL: TIBStringField
      FieldName = 'ASSCOLL'
      Size = 1
    end
    object IBCOMPANIESASAPAIR: TIBStringField
      FieldName = 'ASAPAIR'
      Size = 1
    end
    object IBCOMPANIESASEMPLS: TIBStringField
      FieldName = 'ASEMPLS'
      Size = 1
    end
    object IBCOMPANIESISAGENT: TIBStringField
      FieldName = 'ISAGENT'
      Size = 1
    end
    object IBCOMPANIESISPROPS: TIBStringField
      FieldName = 'ISPROPS'
      Size = 1
    end
    object IBCOMPANIESISGOVERN: TIBStringField
      FieldName = 'ISGOVERN'
      Size = 1
    end
    object IBCOMPANIESISBUDGET: TIBStringField
      FieldName = 'ISBUDGET'
      Size = 1
    end
    object IBCOMPANIESISPOTENT: TIBStringField
      FieldName = 'ISPOTENT'
      Size = 1
    end
    object IBCOMPANIESASFOODS: TIBStringField
      FieldName = 'ASFOODS'
      Size = 1
    end
    object IBCOMPANIESASURIST: TIBStringField
      FieldName = 'ASURIST'
      Size = 1
    end
    object IBCOMPANIESASMEDIC: TIBStringField
      FieldName = 'ASMEDIC'
      Size = 1
    end
    object IBCOMPANIESISHOTEL: TIBStringField
      FieldName = 'ISHOTEL'
      Size = 1
    end
    object IBCOMPANIESASRECRE: TIBStringField
      FieldName = 'ASRECRE'
      Size = 1
    end
    object IBCOMPANIESASEXTRM: TIBStringField
      FieldName = 'ASEXTRM'
      Size = 1
    end
    object IBCOMPANIESFORWORK: TIBStringField
      FieldName = 'FORWORK'
      Size = 1
    end
    object IBCOMPANIESASMUSEM: TIBStringField
      FieldName = 'ASMUSEM'
      Size = 1
    end
    object IBCOMPANIESASXHIBT: TIBStringField
      FieldName = 'ASXHIBT'
      Size = 1
    end
    object IBCOMPANIESASAMBAS: TIBStringField
      FieldName = 'ASAMBAS'
      Size = 1
    end
    object IBCOMPANIESASCOMMC: TIBStringField
      FieldName = 'ASCOMMC'
      Size = 1
    end
    object IBCOMPANIESASCMPTR: TIBStringField
      FieldName = 'ASCMPTR'
      Size = 1
    end
    object IBCOMPANIESASSTNRY: TIBStringField
      FieldName = 'ASSTNRY'
      Size = 1
    end
    object IBCOMPANIESASFURNT: TIBStringField
      FieldName = 'ASFURNT'
      Size = 1
    end
    object IBCOMPANIESASGOODS: TIBStringField
      FieldName = 'ASGOODS'
      Size = 1
    end
    object IBCOMPANIESASPETRL: TIBStringField
      FieldName = 'ASPETRL'
      Size = 1
    end
    object IBCOMPANIESASMEDIA: TIBStringField
      FieldName = 'ASMEDIA'
      Size = 1
    end
    object IBCOMPANIESASCONSL: TIBStringField
      FieldName = 'ASCONSL'
      Size = 1
    end
    object IBCOMPANIESASGUARD: TIBStringField
      FieldName = 'ASGUARD'
      Size = 1
    end
    object IBCOMPANIESASBANKS: TIBStringField
      FieldName = 'ASBANKS'
      Size = 1
    end
    object IBCOMPANIESASLEASE: TIBStringField
      FieldName = 'ASLEASE'
      Size = 1
    end
    object IBCOMPANIESASKOMUN: TIBStringField
      FieldName = 'ASKOMUN'
      Size = 1
    end
    object IBCOMPANIESASBUILD: TIBStringField
      FieldName = 'ASBUILD'
      Size = 1
    end
    object IBCOMPANIESASMASTR: TIBStringField
      FieldName = 'ASMASTR'
      Size = 1
    end
    object IBCOMPANIESISBSMAN: TIBStringField
      FieldName = 'ISBSMAN'
      Size = 1
    end
    object IBCOMPANIESADDMANID: TIntegerField
      FieldName = 'ADDMANID'
    end
    object IBCOMPANIESNAME: TIBStringField
      FieldName = 'NAME'
      Size = 100
    end
    object IBCOMPANIESCOMPKIND: TIBStringField
      FieldName = 'COMPKIND'
      Size = 40
    end
    object IBCOMPANIESMEETINGPLACE: TIntegerField
      FieldName = 'MEETINGPLACE'
    end
    object IBCOMPANIESVCARDNO: TIntegerField
      FieldName = 'VCARDNO'
    end
    object IBCOMPANIESASPARSL: TIBStringField
      FieldName = 'ASPARSL'
      Size = 1
    end
    object IBCOMPANIESASGUIDE: TIBStringField
      FieldName = 'ASGUIDE'
      Size = 1
    end
    object IBCOMPANIESFULLNAME: TMemoField
      FieldName = 'FULLNAME'
      BlobType = ftMemo
    end
    object IBCOMPANIESORGFORMID: TIntegerField
      FieldName = 'ORGFORMID'
    end
    object IBCOMPANIESTAXPAY: TIBStringField
      FieldName = 'TAXPAY'
      Size = 1
    end
    object IBCOMPANIESTAXPAYREGDATE: TDateTimeField
      FieldName = 'TAXPAYREGDATE'
    end
    object IBCOMPANIESPRIVATEID: TIntegerField
      FieldName = 'PRIVATEID'
    end
    object IBCOMPANIESBUS01: TIBStringField
      FieldName = 'BUS01'
      Size = 1
    end
    object IBCOMPANIESBUS02: TIBStringField
      FieldName = 'BUS02'
      Size = 1
    end
    object IBCOMPANIESBUS03: TIBStringField
      FieldName = 'BUS03'
      Size = 1
    end
    object IBCOMPANIESBUS04: TIBStringField
      FieldName = 'BUS04'
      Size = 1
    end
    object IBCOMPANIESBUS05: TIBStringField
      FieldName = 'BUS05'
      Size = 1
    end
    object IBCOMPANIESBUS06: TIBStringField
      FieldName = 'BUS06'
      Size = 1
    end
    object IBCOMPANIESBUS07: TIBStringField
      FieldName = 'BUS07'
      Size = 1
    end
    object IBCOMPANIESBUS08: TIBStringField
      FieldName = 'BUS08'
      Size = 1
    end
    object IBCOMPANIESBUS09: TIBStringField
      FieldName = 'BUS09'
      Size = 1
    end
    object IBCOMPANIESBUS10: TIBStringField
      FieldName = 'BUS10'
      Size = 1
    end
    object IBCOMPANIESBUS11: TIBStringField
      FieldName = 'BUS11'
      Size = 1
    end
    object IBCOMPANIESBUS12: TIBStringField
      FieldName = 'BUS12'
      Size = 1
    end
    object IBCOMPANIESBUS13: TIBStringField
      FieldName = 'BUS13'
      Size = 1
    end
    object IBCOMPANIESBUS14: TIBStringField
      FieldName = 'BUS14'
      Size = 1
    end
    object IBCOMPANIESBUS15: TIBStringField
      FieldName = 'BUS15'
      Size = 1
    end
    object IBCOMPANIESBUS16: TIBStringField
      FieldName = 'BUS16'
      Size = 1
    end
    object IBCOMPANIESBUS17: TIBStringField
      FieldName = 'BUS17'
      Size = 1
    end
    object IBCOMPANIESBUS18: TIBStringField
      FieldName = 'BUS18'
      Size = 1
    end
    object IBCOMPANIESBUS19: TIBStringField
      FieldName = 'BUS19'
      Size = 1
    end
    object IBCOMPANIESASPARSE: TIBStringField
      FieldName = 'ASPARSE'
      Size = 1
    end
    object IBCOMPANIESTAXPAYSTATEID: TIntegerField
      FieldName = 'TAXPAYSTATEID'
    end
    object IBCOMPANIESNEWTAXPAYREGNO: TIBStringField
      FieldName = 'NEWTAXPAYREGNO'
    end
    object IBCOMPANIESTAXPAYREGNO: TIBStringField
      FieldName = 'TAXPAYREGNO'
    end
    object IBCOMPANIESAGENTINFO1: TIBStringField
      FieldName = 'AGENTINFO1'
      Size = 16
    end
    object IBCOMPANIESAGENTINFO2: TIBStringField
      FieldName = 'AGENTINFO2'
      Size = 16
    end
    object IBCOMPANIESADDDATE: TDateTimeField
      FieldName = 'ADDDATE'
    end
    object IBCOMPANIESWORKINGHOURS: TIBStringField
      FieldName = 'WORKINGHOURS'
      Size = 38
    end
    object IBCOMPANIESRECEPTIONHOURS: TIBStringField
      FieldName = 'RECEPTIONHOURS'
      Size = 38
    end
    object IBCOMPANIESLICENSEDATE: TDateTimeField
      FieldName = 'LICENSEDATE'
    end
    object IBCOMPANIESSEMINAR: TIBStringField
      FieldName = 'SEMINAR'
      Size = 1
    end
    object IBCOMPANIESDATEOBDZVIN: TDateTimeField
      FieldName = 'DATEOBDZVIN'
    end
    object IBCOMPANIESMANOBDZVIN: TIntegerField
      FieldName = 'MANOBDZVIN'
    end
    object IBCOMPANIESWARRANTYSUM: TFloatField
      FieldName = 'WARRANTYSUM'
    end
    object IBCOMPANIESWARRANTYVAL: TIntegerField
      FieldName = 'WARRANTYVAL'
    end
    object IBCOMPANIESWARRANTYTERM: TDateTimeField
      FieldName = 'WARRANTYTERM'
    end
    object IBCOMPANIESISTOUROPER: TIBStringField
      FieldName = 'ISTOUROPER'
      Size = 1
    end
    object IBCOMPANIESTRADENAMEID: TIntegerField
      FieldName = 'TRADENAMEID'
    end
    object IBCOMPANIESVIPCLIENT: TIBStringField
      FieldName = 'VIPCLIENT'
      Size = 1
    end
    object IBCOMPANIESBLACKLIST: TIBStringField
      FieldName = 'BLACKLIST'
      Size = 1
    end
    object IBCOMPANIESLICENSETERMIN: TIBStringField
      FieldName = 'LICENSETERMIN'
      Size = 1
    end
    object IBCOMPANIESACTIONID: TIntegerField
      FieldName = 'ACTIONID'
    end
    object IBCOMPANIESTAXPAYTYPEID: TIntegerField
      FieldName = 'TAXPAYTYPEID'
    end
    object IBCOMPANIESSINGLETAXTYPEID: TIntegerField
      FieldName = 'SINGLETAXTYPEID'
    end
    object IBCOMPANIESSINGLETAXREGNO: TIBStringField
      FieldName = 'SINGLETAXREGNO'
      Size = 10
    end
    object IBCOMPANIESSINGLETAXDATE: TDateTimeField
      FieldName = 'SINGLETAXDATE'
    end
    object IBCOMPANIESGOVREESTRTYPEID: TIntegerField
      FieldName = 'GOVREESTRTYPEID'
    end
    object IBCOMPANIESGOVREESTRDATE: TDateTimeField
      FieldName = 'GOVREESTRDATE'
    end
    object IBCOMPANIESOBDZVIN: TSmallintField
      FieldName = 'OBDZVIN'
    end
    object IBCOMPANIESOBDZVINAGREEDATE: TDateTimeField
      FieldName = 'OBDZVINAGREEDATE'
    end
    object IBCOMPANIESWORKMANID: TIntegerField
      FieldName = 'WORKMANID'
    end
    object IBCOMPANIESASNETAGENT: TIBStringField
      FieldName = 'ASNETAGENT'
      Size = 1
    end
    object IBCOMPANIESARENEWCONTRACT: TIBStringField
      FieldName = 'ARENEWCONTRACT'
      Size = 1
    end
    object IBCOMPANIESPERMEXTRAAGENT: TIBStringField
      FieldName = 'PERMEXTRAAGENT'
      Size = 1
    end
    object IBCOMPANIESDOCTODATE: TDateTimeField
      FieldName = 'DOCTODATE'
    end
    object IBCOMPANIESFIXDEFECTTODATE: TDateTimeField
      FieldName = 'FIXDEFECTTODATE'
    end
    object IBCOMPANIESSTANDOC: TIntegerField
      FieldName = 'STANDOC'
    end
    object IBCOMPANIESASAUPAIR: TIBStringField
      FieldName = 'ASAUPAIR'
      Size = 1
    end
    object IBCOMPANIESISFILIYA: TIBStringField
      FieldName = 'ISFILIYA'
      Size = 1
    end
    object IBCOMPANIESHEADOFFICEID: TIntegerField
      FieldName = 'HEADOFFICEID'
    end
    object IBCOMPANIESISHEADOFFICE: TIBStringField
      FieldName = 'ISHEADOFFICE'
      Size = 1
    end
    object IBCOMPANIESNOTWORK: TIBStringField
      FieldName = 'NOTWORK'
      Size = 1
    end
    object IBCOMPANIESNOTWORKMANID: TIntegerField
      FieldName = 'NOTWORKMANID'
    end
    object IBCOMPANIESNOTWORKDATE: TDateTimeField
      FieldName = 'NOTWORKDATE'
    end
    object IBCOMPANIESORGFORMINNAME: TIBStringField
      FieldName = 'ORGFORMINNAME'
      Size = 1
    end
    object IBCOMPANIESWASDELETED: TIBStringField
      FieldName = 'WASDELETED'
      Size = 1
    end
    object IBCOMPANIESASRESIDENT: TIBStringField
      FieldName = 'ASRESIDENT'
      Size = 1
    end
    object IBCOMPANIESCODEID1C: TIBStringField
      FieldName = 'CODEID1C'
      Size = 12
    end
    object IBCOMPANIESFILIYACODE: TIBStringField
      FieldName = 'FILIYACODE'
      Size = 10
    end
  end
  object IBCOMPANIES_PARAM_DATA: TIBTable
    Database = IBDatabase
    Transaction = IBTransaction
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID_COMPANIES'
        DataType = ftInteger
      end
      item
        Name = 'ID_COMPANIES_PARAM_NAME'
        DataType = ftInteger
      end
      item
        Name = 'AVALUE'
        DataType = ftInteger
      end>
    StoreDefs = True
    TableName = 'COMPANIES_PARAM_DATA'
    Left = 1712
    Top = 112
    object IBCOMPANIES_PARAM_DATAID: TIntegerField
      FieldName = 'ID'
    end
    object IBCOMPANIES_PARAM_DATAID_COMPANIES: TIntegerField
      FieldName = 'ID_COMPANIES'
    end
    object IBCOMPANIES_PARAM_DATAID_COMPANIES_PARAM_NAME: TIntegerField
      FieldName = 'ID_COMPANIES_PARAM_NAME'
    end
    object IBCOMPANIES_PARAM_DATAAVALUE: TIntegerField
      FieldName = 'AVALUE'
    end
  end
  object IBCompanyField: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'SELECT b.RDB$FIELD_NAME fieldName , d.RDB$TYPE_NAME fieldType,'
      ' c.RDB$FIELD_LENGTH fieldSize, b.RDB$NULL_FLAG IsNull,'
      '   b.rdb$Description Description'
      '   FROM   RDB$RELATIONS a'
      '   INNER JOIN RDB$RELATION_FIELDS b'
      '   ON     a.RDB$RELATION_NAME = b.RDB$RELATION_NAME'
      '   INNER JOIN RDB$FIELDS c'
      '   ON     b.RDB$FIELD_SOURCE = c.RDB$FIELD_NAME'
      '   INNER JOIN RDB$TYPES d'
      '   ON     c.RDB$FIELD_TYPE = d.RDB$TYPE'
      '   WHERE  a.RDB$SYSTEM_FLAG = 0'
      
        '    AND  d.RDB$FIELD_NAME = '#39'RDB$FIELD_TYPE'#39' AND b.RDB$RELATION_' +
        'NAME='#39'COMPANIES'#39
      '   ORDER BY a.RDB$RELATION_NAME, b.RDB$FIELD_ID')
    Left = 1632
    Top = 168
    object IBCompanyFieldFIELDNAME: TIBStringField
      FieldName = 'FIELDNAME'
      Origin = '"RDB$RELATION_FIELDS"."RDB$FIELD_NAME"'
      FixedChar = True
      Size = 31
    end
    object IBCompanyFieldFIELDTYPE: TIBStringField
      FieldName = 'FIELDTYPE'
      Origin = '"RDB$TYPES"."RDB$TYPE_NAME"'
      FixedChar = True
      Size = 31
    end
    object IBCompanyFieldFIELDSIZE: TSmallintField
      FieldName = 'FIELDSIZE'
      Origin = '"RDB$FIELDS"."RDB$FIELD_LENGTH"'
    end
    object IBCompanyFieldISNULL: TSmallintField
      FieldName = 'ISNULL'
      Origin = '"RDB$RELATION_FIELDS"."RDB$NULL_FLAG"'
    end
    object IBCompanyFieldDESCRIPTION: TMemoField
      FieldName = 'DESCRIPTION'
      Origin = '"RDB$RELATION_FIELDS"."RDB$DESCRIPTION"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  object Cities_PhoneCode: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      '   select CITY_ADM_UNIT.id, Cities.phonecode  from CITY_ADM_UNIT'
      
        '    left join Cities on Cities.cityid = CITY_ADM_UNIT.old_id_cit' +
        'y'
      '    where Cities.phonecode is not null and Cities.phonecode<>'#39#39)
    Left = 1712
    Top = 656
    object Cities_PhoneCodeID: TIntegerField
      FieldName = 'ID'
      Origin = '"CITY_ADM_UNIT"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Cities_PhoneCodePHONECODE: TIBStringField
      FieldName = 'PHONECODE'
      Origin = '"CITIES"."PHONECODE"'
      Size = 6
    end
  end
  object City_Adm_Unit_Info_PoneCode: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      'select * from CITY_ADM_UNIT_INFO where '
      'CITY_ADM_UNIT_INFO.id_city_adm_unit_type_info = 2')
    Left = 1816
    Top = 648
    object City_Adm_Unit_Info_PoneCodeID: TIntegerField
      FieldName = 'ID'
      Origin = '"CITY_ADM_UNIT_INFO"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object City_Adm_Unit_Info_PoneCodeID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
      Origin = '"CITY_ADM_UNIT_INFO"."ID_CITY_ADM_UNIT"'
    end
    object City_Adm_Unit_Info_PoneCodeID_CITY_ADM_UNIT_TYPE_INFO: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT_TYPE_INFO'
      Origin = '"CITY_ADM_UNIT_INFO"."ID_CITY_ADM_UNIT_TYPE_INFO"'
    end
    object City_Adm_Unit_Info_PoneCodeAVALUE: TIBStringField
      FieldName = 'AVALUE'
      Origin = '"CITY_ADM_UNIT_INFO"."AVALUE"'
      Size = 300
    end
  end
end
