object FrmHtlServ: TFrmHtlServ
  Left = 567
  Top = 178
  BorderStyle = bsDialog
  Caption = #1055#1086#1089#1083#1091#1075#1080' '#1074' '#1075#1086#1090#1077#1083#1110
  ClientHeight = 527
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CtrlPanel: TPanel
    Left = 0
    Top = 494
    Width = 787
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      787
      33)
    object CancelBtn: TBitBtn
      Left = 697
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object GridBuilds: TcxGrid
    Left = 5
    Top = 6
    Width = 284
    Height = 200
    TabOrder = 1
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    object GridBuildsDBTableView1: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
    end
    object GridBuildsLevel1: TcxGridLevel
      GridView = DMServ.ViewHtlBuildSel
    end
  end
  object GridApartments: TcxGrid
    Left = 292
    Top = 6
    Width = 490
    Height = 200
    TabOrder = 2
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    object cxGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
    end
    object cxGridLevel1: TcxGridLevel
      GridView = DMServ.ViewHtlRoomSel
    end
  end
  object PanelServiceLeft: TPanel
    Left = 6
    Top = 214
    Width = 365
    Height = 273
    BevelOuter = bvNone
    TabOrder = 3
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 185
      Height = 273
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object GridServGroup: TcxGrid
        Left = 0
        Top = 22
        Width = 185
        Height = 251
        Hint = #1050#1072#1090#1077#1075#1086#1088#1110#1111' '#1087#1086#1089#1083#1091#1075' '#1079' '#1076#1086#1074#1110#1076#1085#1080#1082#1072
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = True
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = True
          Navigator.Buttons.GotoBookmark.Visible = True
          Navigator.Buttons.Filter.Visible = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
        end
        object cxGridLevel2: TcxGridLevel
          GridView = DMServ.ViewServGroupList
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label1: TLabel
          Left = 2
          Top = 4
          Width = 83
          Height = 13
          Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1111' '#1087#1086#1089#1083#1091#1075
        end
      end
    end
    object Panel8: TPanel
      Left = 339
      Top = 0
      Width = 26
      Height = 273
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object ServSelectBtn: TSpeedButton
        Left = 3
        Top = 89
        Width = 22
        Height = 22
        Hint = #1042#1080#1073#1088#1072#1090#1080' '#1087#1086#1089#1083#1091#1075#1091'|'#1042#1080#1073#1088#1072#1090#1080' '#1087#1086#1089#1083#1091#1075#1091
        Caption = '>'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = ServSelectBtnClick
      end
      object ServUnselectBtn: TSpeedButton
        Left = 3
        Top = 113
        Width = 22
        Height = 22
        Caption = '<'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = ServUnselectBtnClick
      end
    end
    object Panel4: TPanel
      Left = 185
      Top = 0
      Width = 154
      Height = 273
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object PageControlPossibleServices: TcxPageControl
        Left = 0
        Top = 22
        Width = 154
        Height = 27
        Align = alTop
        TabOrder = 0
        Properties.ActivePage = TabServInHotel
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        OnChange = PageControlPossibleServicesChange
        ClientRectBottom = 25
        ClientRectLeft = 2
        ClientRectRight = 152
        ClientRectTop = 22
        object TabServInHotel: TcxTabSheet
          Caption = #1043#1086#1090#1077#1083#1100
          ImageIndex = 0
        end
        object TabServInBuild: TcxTabSheet
          Caption = #1057#1087#1086#1088#1091#1076#1072
          ImageIndex = 1
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 26
            Height = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton1: TSpeedButton
              Left = 3
              Top = 89
              Width = 22
              Height = 22
              Hint = #1042#1080#1073#1088#1072#1090#1080' '#1087#1086#1089#1083#1091#1075#1091'|'#1042#1080#1073#1088#1072#1090#1080' '#1087#1086#1089#1083#1091#1075#1091
              Caption = '>'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton2: TSpeedButton
              Left = 3
              Top = 113
              Width = 22
              Height = 22
              Caption = '<'
              Enabled = False
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object TabServInRoom: TcxTabSheet
          Caption = #1053#1086#1084#1077#1088
          ImageIndex = 2
          object Panel17: TPanel
            Left = 0
            Top = 0
            Width = 26
            Height = 3
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton3: TSpeedButton
              Left = 3
              Top = 89
              Width = 22
              Height = 22
              Hint = #1042#1080#1073#1088#1072#1090#1080' '#1087#1086#1089#1083#1091#1075#1091'|'#1042#1080#1073#1088#1072#1090#1080' '#1087#1086#1089#1083#1091#1075#1091
              Caption = '>'
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpeedButton4: TSpeedButton
              Left = 3
              Top = 113
              Width = 22
              Height = 22
              Caption = '<'
              Enabled = False
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 154
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label4: TLabel
          Left = 3
          Top = 4
          Width = 101
          Height = 13
          Caption = #1052#1086#1078#1083#1080#1074#1110' '#1087#1086#1089#1083#1091#1075#1080' '#1074' :'
        end
      end
      object GridPossibleService: TcxGrid
        Left = 0
        Top = 49
        Width = 154
        Height = 224
        Hint = 
          #1057#1087#1080#1089#1086#1082' '#1076#1086#1089#1090#1091#1087#1085#1080#1093' '#1076#1083#1103' '#1074#1080#1073#1086#1088#1091' '#1087#1086#1089#1083#1091#1075', '#1097#1086' '#1085#1072#1076#1072#1102#1090#1100#1089#1103' '#1074' '#1075#1086#1090#1077#1083#1110', '#1089#1087#1086#1088#1091 +
          #1076#1110' '#1095#1080' '#1085#1086#1084#1077#1088#1110
        Align = alClient
        TabOrder = 2
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object cxGridDBTableView3: TcxGridDBTableView
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = True
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = True
          Navigator.Buttons.GotoBookmark.Visible = True
          Navigator.Buttons.Filter.Visible = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
        end
        object cxGridLevel3: TcxGridLevel
          GridView = ViewPossibleService
        end
      end
    end
  end
  object Panel6: TPanel
    Left = 375
    Top = 214
    Width = 405
    Height = 273
    BevelOuter = bvNone
    TabOrder = 4
    object Panel7: TPanel
      Left = 0
      Top = 0
      Width = 405
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        405
        22)
      object Label3: TLabel
        Left = 2
        Top = 4
        Width = 201
        Height = 13
        Caption = #1055#1086#1089#1083#1091#1075#1080' '#1074' '#1085#1086#1084#1077#1088#1110' DBL/'#1074' '#1089#1087#1086#1088#1091#1076#1110'/'#1074' '#1075#1086#1090#1077#1083#1110
      end
      object HtlServEditBtn: TSpeedButton
        Left = 380
        Top = 0
        Width = 23
        Height = 22
        Hint = #1047#1084#1110#1085#1080#1090#1080'|'#1047#1084#1110#1085#1080#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1087#1088#1086' '#1087#1086#1089#1083#1091#1075#1091
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777700000007777777777777777700000007444444444444777700000007488
          8888888847777000000074777777770747777000000074700700700047777000
          000074777777770007777000000074700700700B80777000000074777777770B
          707770000000744444444440B8077000000074F44F44F440B707700000007444
          444444440B80700000007777777777770B807000000077777777777770050000
          0000777777777777705500000000777777777777770070000000777777777777
          777770000000}
        OnClick = HtlServEditBtnClick
      end
      object ServCopyOneToAllBtn: TSpeedButton
        Left = 286
        Top = 0
        Width = 23
        Height = 22
        Hint = 
          #1056#1086#1079#1084#1085#1086#1078#1080#1090#1080' '#1076#1083#1103' '#1074#1089#1110#1093'|'#1050#1086#1087#1110#1102#1074#1072#1090#1080' '#1087#1086#1089#1083#1091#1075#1091' '#1076#1083#1103' '#1074#1089#1110#1093' '#1110#1085#1096#1080#1093' '#1089#1087#1086#1088#1091#1076' '#1095#1080' '#1085 +
          #1086#1084#1077#1088#1110#1074' '#1074' '#1089#1087#1086#1088#1091#1076#1110
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008888777777778888888800008800
          00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
          0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
          FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
          44F000004440F0780000880BFFF0FFF0FFFBF0780000880F44F0FB00F0000078
          0000880FFBF0F0FFF0FFF0880000880000000F44F0FB08880000888888880FFB
          F0F0888800008888888800000008888800008888888888888888888800008888
          88888888888888880000}
        Visible = False
      end
      object ServCopyAllToAllBtn: TSpeedButton
        Left = 310
        Top = 0
        Width = 23
        Height = 22
        Hint = 
          #1056#1086#1079#1084#1085#1086#1078#1080#1090#1080' '#1074#1089#1110'|'#1050#1086#1087#1110#1102#1074#1072#1090#1080' '#1074#1089#1110' '#1087#1086#1089#1083#1091#1075#1080' '#1076#1083#1103' '#1074#1089#1110#1093' '#1110#1085#1096#1080#1093' '#1089#1087#1086#1088#1091#1076' '#1095#1080' '#1085#1086 +
          #1084#1077#1088#1110#1074' '#1074' '#1089#1087#1086#1088#1091#1076#1110
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          66010000424D6601000000000000760000002800000014000000140000000100
          040000000000F000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888800008888888888888888888800008888777777778888888800008800
          00000000788888880000880BFFFBFFF0777777880000880F444444F000000078
          0000880FFBFFFBF0FBFFF0780000880F444444F04444F0780000880BFFFBFFF0
          FFFBF0780000880F444444F04444F0780000880FFBFFFBF0FBFFF0780000880F
          44F000004477F0780000880BFFF0FFF0FF0007780000880F44F0FB00F70A0778
          0000880FFBF0F0FF000A00080000880000000F470AAAAA080000888888880FFB
          000A00080000888888880000770A088800008888888888888800088800008888
          88888888888888880000}
        Visible = False
      end
      object butRefresh: TSpeedButton
        Tag = 2
        Left = 353
        Top = 0
        Width = 23
        Height = 22
        Hint = #1054#1085#1086#1074#1080#1090#1080
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBAACA4F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAC4C0E67F3AD7D4D2FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6F6F6C57B4EEE843CB9855FB78F70B89477B6A596DDDCDBFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB39584EC8645E18241F08F46FC
          9E4FFFAF5AFFBC65EFAE65B8ABA0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          CAC3C0E98043E28143E38848E8914EDC9459CE9666D59D67F6B768FFCF76B7A9
          9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CFCDBA8668E18348EF8D4BF19652BF
          B6B1FFFFFFFCFCFCE0DEDDBFA891F2B26ED1CFCDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD2CECCB89178EF9352B49C8BFFFFFFFFFFFFFFFFFFFFFFFFCDC8
          C3BAACA1E6E5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D4D2C1
          B7B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFDFDFDFFFFFFFFFFFFFFFFFF
          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C0BCC9C4C1FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4BCB8B7ACA6FFFFFFFFFFFFFFFFFFFF
          FFFFC2B5ADEB853EB48666C6C0BCFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          ECECECC67046A87E69D3D0CEF8F8F8FFFFFFD8D5D3E07B38EF873FE7853FBB81
          59C2B9B4F0F0F0FFFFFFFFFFFFFFFFFFFFFFFFC5BDB9E77841D36730B66C45B4
          714DC36D3CDA702FDC7533E07B37F98E44B8A99EF4F4F4FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFC5BDB9CB7A51EC7C41EB783AE77636E27435D97132E77B38B786
          69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEBB9A9A1B4
          8D78B7886EB8886AE27C42D47F4DDFDEDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F0F0DA7E4BB6A69DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBCAFA8F7F7F7FFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        OnClick = butRefreshClick
      end
    end
    object GridHtlService: TcxGrid
      Left = 0
      Top = 22
      Width = 405
      Height = 251
      Align = alClient
      TabOrder = 1
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      object cxGridDBTableView4: TcxGridDBTableView
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = True
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = True
        Navigator.Buttons.GotoBookmark.Visible = True
        Navigator.Buttons.Filter.Visible = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
      end
      object cxGridLevel4: TcxGridLevel
        GridView = DMServ.ViewHtlSrvLnkList
      end
    end
  end
  object cxGridViewRepository: TcxGridViewRepository
    Left = 336
    Top = 168
    object ViewPossibleService: TcxGridDBTableView
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.PriorPage.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Next.Visible = True
      Navigator.Buttons.NextPage.Visible = True
      Navigator.Buttons.Last.Visible = True
      Navigator.Buttons.Insert.Visible = True
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Visible = True
      Navigator.Buttons.Edit.Visible = True
      Navigator.Buttons.Post.Visible = True
      Navigator.Buttons.Cancel.Visible = True
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = True
      Navigator.Buttons.GotoBookmark.Visible = True
      Navigator.Buttons.Filter.Visible = True
      DataController.DataSource = PossibleServiceSrc
      DataController.KeyFieldNames = 'SERVICEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.StyleSheet = DMServ.MyStyle
      object ViewPossibleServiceSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINHOTEL: TcxGridDBColumn
        DataBinding.FieldName = 'INHOTEL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINBUILD: TcxGridDBColumn
        DataBinding.FieldName = 'INBUILD'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINROOM: TcxGridDBColumn
        DataBinding.FieldName = 'INROOM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceSERVGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVGROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINFO: TcxGridDBColumn
        DataBinding.FieldName = 'INFO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINAUTO: TcxGridDBColumn
        DataBinding.FieldName = 'INAUTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINTRAIN: TcxGridDBColumn
        DataBinding.FieldName = 'INTRAIN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINSHIP: TcxGridDBColumn
        DataBinding.FieldName = 'INSHIP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINPLANE: TcxGridDBColumn
        DataBinding.FieldName = 'INPLANE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceHAVECOST: TcxGridDBColumn
        DataBinding.FieldName = 'HAVECOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINFOOD: TcxGridDBColumn
        DataBinding.FieldName = 'INFOOD'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINRECRE: TcxGridDBColumn
        DataBinding.FieldName = 'INRECRE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewPossibleServiceINRESORT: TcxGridDBColumn
        DataBinding.FieldName = 'INRESORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
  end
  object PossibleServiceSrc: TDataSource
    Left = 256
    Top = 304
  end
end
