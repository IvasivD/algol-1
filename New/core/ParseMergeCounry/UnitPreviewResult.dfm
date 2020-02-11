object FrmCountryDetail: TFrmCountryDetail
  Left = 42
  Top = 110
  Width = 1749
  Height = 835
  Caption = #1044#1072#1085#1110' '#1087#1086' '#1082#1088#1072#1111#1085#1072#1093
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 1733
    Height = 797
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet6
    ClientRectBottom = 793
    ClientRectLeft = 4
    ClientRectRight = 1729
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = #1042#1110#1082#1110#1087#1077#1076#1110#1103
      ImageIndex = 0
      object Panel1: TPanel
        Left = 0
        Top = 728
        Width = 1725
        Height = 41
        Align = alBottom
        TabOrder = 0
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 465
        Height = 728
        Align = alLeft
        TabOrder = 1
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = DM.ViewCountryList
        end
      end
      object Panel2: TPanel
        Left = 465
        Top = 0
        Width = 1260
        Height = 728
        Align = alClient
        TabOrder = 2
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 1258
          Height = 152
          Align = alTop
          TabOrder = 0
          object ImgFlag: TImage
            Left = 72
            Top = 16
            Width = 249
            Height = 113
          end
          object ImgGerb: TImage
            Left = 400
            Top = 16
            Width = 249
            Height = 113
          end
          object Label1: TLabel
            Left = 177
            Top = 134
            Width = 37
            Height = 13
            Caption = #1055#1088#1072#1087#1086#1088
          end
          object Label2: TLabel
            Left = 508
            Top = 133
            Width = 24
            Height = 13
            Caption = #1043#1077#1088#1073
          end
        end
        object Panel4: TPanel
          Left = 1
          Top = 153
          Width = 1258
          Height = 574
          Align = alClient
          TabOrder = 1
          object cxGrid2: TcxGrid
            Left = 1
            Top = 1
            Width = 1256
            Height = 572
            Align = alClient
            TabOrder = 0
            object cxGrid2DBTableView1: TcxGridDBTableView
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
            end
            object cxGrid2Level1: TcxGridLevel
              GridView = DM.ViewDetail
            end
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = #1050#1088#1072#1111#1085#1080
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 178
        Width = 1725
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter2: TSplitter
        Left = 0
        Top = 544
        Width = 1725
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1725
        Height = 178
        Align = alTop
        Caption = 'Panel5'
        TabOrder = 0
        object cxGrid3: TcxGrid
          Left = 1
          Top = 1
          Width = 1515
          Height = 176
          Align = alClient
          TabOrder = 0
          object cxGrid3DBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = DM.ViewCountry
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 181
        Width = 1725
        Height = 363
        Align = alClient
        Caption = 'Panel6'
        TabOrder = 1
        object cxGrid4: TcxGrid
          Left = 1
          Top = 35
          Width = 1515
          Height = 268
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGridLevel1: TcxGridLevel
            GridView = DM.ViewRegion
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 1
          Width = 1515
          Height = 34
          Align = alTop
          TabOrder = 1
          object Label3: TLabel
            Left = 492
            Top = 12
            Width = 53
            Height = 13
            Caption = #1042#1080#1076#1072#1083#1080#1090#1080':'
          end
          object Label4: TLabel
            Left = 684
            Top = 12
            Width = 48
            Height = 13
            Caption = #1047#1072#1084#1110#1085#1080#1090#1080':'
          end
          object Label5: TLabel
            Left = 876
            Top = 12
            Width = 17
            Height = 13
            Caption = #1053#1072':'
          end
          object SpeedButton1: TSpeedButton
            Left = 1023
            Top = 8
            Width = 23
            Height = 22
            Caption = '*'
            OnClick = SpeedButton1Click
          end
          object SpeedButton2: TSpeedButton
            Left = 440
            Top = 5
            Width = 20
            Height = 24
            Caption = '*'
            OnClick = SpeedButton2Click
          end
          object SpeedButton3: TSpeedButton
            Left = 304
            Top = 7
            Width = 17
            Height = 22
            Caption = '*'
            OnClick = SpeedButton3Click
          end
          object Button1: TButton
            Left = 192
            Top = 5
            Width = 113
            Height = 25
            Caption = #1055#1077#1088#1077#1082#1083#1072#1089#1090#1080' '#1079' Eng'
            TabOrder = 0
            OnClick = Button1Click
          end
          object EdDelWord: TcxTextEdit
            Left = 551
            Top = 8
            TabOrder = 1
            Width = 121
          end
          object EdChangeFrom: TcxTextEdit
            Left = 742
            Top = 7
            TabOrder = 2
            Width = 121
          end
          object EdChangeTo: TcxTextEdit
            Left = 894
            Top = 7
            TabOrder = 3
            Width = 121
          end
          object Button2: TButton
            Left = 1064
            Top = 5
            Width = 145
            Height = 25
            Caption = #1055#1086#1082#1072#1079#1072#1090#1080' '#1052#1110#1089#1090#1072' '#1088#1077#1075#1110#1086#1085#1091
            TabOrder = 4
            OnClick = Button2Click
          end
          object Button3: TButton
            Left = 330
            Top = 4
            Width = 109
            Height = 25
            Caption = #1055#1077#1088#1077#1082#1083#1072#1089#1090#1080' '#1079' '#1054#1088#1080#1075
            TabOrder = 5
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 1339
            Top = 7
            Width = 75
            Height = 23
            Caption = #1042' '#1082#1110#1085#1077#1094#1100
            TabOrder = 6
            OnClick = Button4Click
          end
          object EdRevers: TcxTextEdit
            Left = 1215
            Top = 7
            TabOrder = 7
            Width = 121
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 547
        Width = 1725
        Height = 222
        Align = alBottom
        Caption = 'Panel7'
        TabOrder = 2
        object cxGrid5: TcxGrid
          Left = 1
          Top = 1
          Width = 1515
          Height = 220
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView2: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGridLevel2: TcxGridLevel
          end
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = #1047#1083#1080#1074#1072#1085#1085#1103' '#1050#1088#1072#1111#1085
      ImageIndex = 2
      object Splitter3: TSplitter
        Left = 697
        Top = 28
        Height = 741
      end
      object cxGrid6: TcxGrid
        Left = 700
        Top = 28
        Width = 1025
        Height = 741
        Align = alClient
        TabOrder = 0
        object cxGrid6DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid6Level1: TcxGridLevel
          GridView = DM.ViewCountryTO
        end
      end
      object cxGrid7: TcxGrid
        Left = 0
        Top = 28
        Width = 697
        Height = 741
        Align = alLeft
        TabOrder = 1
        object cxGridDBTableView3: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridLevel3: TcxGridLevel
          GridView = DM.ViewCountryFrom
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1725
        Height = 28
        Align = alTop
        Caption = 'Panel9'
        TabOrder = 2
        object Button5: TButton
          Left = 8
          Top = 2
          Width = 75
          Height = 23
          Caption = #1047#1085#1072#1081#1090#1080
          TabOrder = 0
          OnClick = Button5Click
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = #1047#1083#1080#1074#1072#1085#1085#1103' '#1056#1077#1075#1110#1086#1085#1080
      ImageIndex = 3
      object Splitter4: TSplitter
        Left = 1005
        Top = 28
        Height = 741
        Align = alRight
      end
      object cxGrid8: TcxGrid
        Left = 1008
        Top = 28
        Width = 717
        Height = 741
        Align = alRight
        TabOrder = 0
        object cxGrid8DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid8Level1: TcxGridLevel
          GridView = DM.ViewRegionTO
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 0
        Width = 1725
        Height = 28
        Align = alTop
        TabOrder = 1
        object Label6: TLabel
          Left = 628
          Top = 7
          Width = 53
          Height = 13
          Caption = #1042#1080#1076#1072#1083#1080#1090#1080':'
        end
        object Label7: TLabel
          Left = 820
          Top = 7
          Width = 48
          Height = 13
          Caption = #1047#1072#1084#1110#1085#1080#1090#1080':'
        end
        object Label8: TLabel
          Left = 1012
          Top = 7
          Width = 17
          Height = 13
          Caption = #1053#1072':'
        end
        object SpeedButton4: TSpeedButton
          Left = 1255
          Top = 1
          Width = 23
          Height = 22
          Caption = '*'
          OnClick = SpeedButton4Click
        end
        object Button6: TButton
          Left = 8
          Top = 2
          Width = 75
          Height = 23
          Caption = #1047#1085#1072#1081#1090#1080
          TabOrder = 0
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 128
          Top = 0
          Width = 129
          Height = 25
          Caption = #1047#1085#1072#1081#1090#1080' '#1087#1086#1090#1086#1095#1085#1080#1081
          TabOrder = 1
          OnClick = Button7Click
        end
        object Edit: TEdit
          Left = 272
          Top = 2
          Width = 257
          Height = 21
          TabOrder = 2
        end
        object Button8: TButton
          Left = 536
          Top = 2
          Width = 75
          Height = 22
          Caption = #1047#1085#1072#1081#1090#1080
          TabOrder = 3
          OnClick = Button8Click
        end
        object EdRegionDel: TcxTextEdit
          Left = 687
          Top = 2
          TabOrder = 4
          Width = 121
        end
        object EdRegionFrom: TcxTextEdit
          Left = 878
          Top = 2
          TabOrder = 5
          Width = 121
        end
        object EdRegionTo: TcxTextEdit
          Left = 1030
          Top = 2
          TabOrder = 6
          Width = 121
        end
        object ChCaseChar: TCheckBox
          Left = 1160
          Top = 5
          Width = 97
          Height = 17
          Caption = #1056#1077#1075#1110#1089#1090#1077#1088' '#1073#1091#1082#1074
          TabOrder = 7
        end
        object Button9: TButton
          Left = 1296
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Button9'
          TabOrder = 8
          OnClick = Button9Click
        end
      end
      object cxGrid9: TcxGrid
        Left = 0
        Top = 28
        Width = 1005
        Height = 741
        Align = alClient
        TabOrder = 2
        object cxGrid9DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid9Level1: TcxGridLevel
          GridView = DM.ViewRegionFrom
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = #1047#1083#1080#1074#1072#1085#1085#1103' Area'
      ImageIndex = 4
      object Splitter5: TSplitter
        Left = 1197
        Top = 30
        Height = 739
        Align = alRight
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 1725
        Height = 30
        Align = alTop
        TabOrder = 0
        object Label9: TLabel
          Left = 204
          Top = 7
          Width = 53
          Height = 13
          Caption = #1042#1080#1076#1072#1083#1080#1090#1080':'
        end
        object Label10: TLabel
          Left = 396
          Top = 7
          Width = 48
          Height = 13
          Caption = #1047#1072#1084#1110#1085#1080#1090#1080':'
        end
        object SpeedButton5: TSpeedButton
          Left = 831
          Top = 1
          Width = 23
          Height = 22
          Caption = '*'
          OnClick = SpeedButton5Click
        end
        object Button10: TButton
          Left = 8
          Top = 2
          Width = 75
          Height = 23
          Caption = #1047#1085#1072#1081#1090#1080
          TabOrder = 0
          OnClick = Button10Click
        end
        object Button11: TButton
          Left = 112
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Button11'
          TabOrder = 1
          OnClick = Button11Click
        end
        object EdAreaDel: TcxTextEdit
          Left = 263
          Top = 2
          TabOrder = 2
          Width = 121
        end
        object EdAreaFrom: TcxTextEdit
          Left = 454
          Top = 2
          TabOrder = 3
          Width = 121
        end
        object EdAreaTo: TcxTextEdit
          Left = 606
          Top = 2
          TabOrder = 4
          Width = 121
        end
        object ChAreaCaseChar: TCheckBox
          Left = 736
          Top = 5
          Width = 97
          Height = 17
          Caption = #1056#1077#1075#1110#1089#1090#1077#1088' '#1073#1091#1082#1074
          TabOrder = 5
        end
      end
      object cxGrid10: TcxGrid
        Left = 1200
        Top = 30
        Width = 525
        Height = 739
        Align = alRight
        TabOrder = 1
        object cxGrid10DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid10Level1: TcxGridLevel
          GridView = DM.ViewAreaTo
        end
      end
      object cxGrid11: TcxGrid
        Left = 0
        Top = 30
        Width = 1197
        Height = 739
        Align = alClient
        TabOrder = 2
        object cxGrid11DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid11Level1: TcxGridLevel
          GridView = DM.ViewArea
        end
      end
    end
    object cxTabSheet6: TcxTabSheet
      Caption = #1047#1083#1080#1074#1072#1085#1085#1103' '#1052#1110#1089#1090
      ImageIndex = 5
      object Splitter6: TSplitter
        Left = 1242
        Top = 32
        Height = 737
        Align = alRight
      end
      object cxGrid12: TcxGrid
        Left = 1245
        Top = 32
        Width = 480
        Height = 737
        Align = alRight
        TabOrder = 0
        object cxGrid12DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid12Level1: TcxGridLevel
          GridView = DM.ViewCityTo
        end
      end
      object cxGrid13: TcxGrid
        Left = 0
        Top = 32
        Width = 1242
        Height = 737
        Align = alClient
        TabOrder = 1
        object cxGrid13DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid13Level1: TcxGridLevel
          GridView = DM.ViewCity
        end
      end
      object Panel12: TPanel
        Left = 0
        Top = 0
        Width = 1725
        Height = 32
        Align = alTop
        TabOrder = 2
        object Button12: TButton
          Left = 8
          Top = 4
          Width = 75
          Height = 25
          Caption = #1047#1085#1072#1081#1090#1080
          TabOrder = 0
          OnClick = Button12Click
        end
        object Button13: TButton
          Left = 160
          Top = 3
          Width = 121
          Height = 25
          Caption = 'Merge Country'
          TabOrder = 1
          OnClick = Button13Click
        end
        object Button14: TButton
          Left = 296
          Top = 3
          Width = 121
          Height = 25
          Caption = 'Merge Region'
          TabOrder = 2
          OnClick = Button14Click
        end
        object Button15: TButton
          Left = 424
          Top = 3
          Width = 121
          Height = 25
          Caption = 'Merge Area'
          TabOrder = 3
          OnClick = Button15Click
        end
        object Button16: TButton
          Left = 556
          Top = 3
          Width = 121
          Height = 25
          Caption = 'Merge City'
          TabOrder = 4
          OnClick = Button16Click
        end
        object Button17: TButton
          Left = 760
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Button17'
          TabOrder = 5
          OnClick = Button17Click
        end
      end
    end
  end
end
