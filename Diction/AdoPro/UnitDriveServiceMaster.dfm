object DriveServiceMasterForm: TDriveServiceMasterForm
  Left = 471
  Top = 238
  Width = 1037
  Height = 493
  Caption = #1055#1086#1089#1083#1091#1075#1080' '#1074' %s'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ModalPanel: TPanel
    Left = 0
    Top = 421
    Width = 1021
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    DesignSize = (
      1021
      34)
    object CancelBtn: TBitBtn
      Left = 939
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ModalResult = 2
      TabOrder = 0
      OnClick = CancelBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object PanelServiceLeft: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 421
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 210
      Height = 421
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object GridServGroup: TcxGrid
        Left = 0
        Top = 22
        Width = 210
        Height = 399
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
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 210
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
      Left = 420
      Top = 0
      Width = 26
      Height = 421
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
      Left = 210
      Top = 0
      Width = 210
      Height = 421
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 210
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
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
        Top = 22
        Width = 210
        Height = 399
        Hint = 
          #1057#1087#1080#1089#1086#1082' '#1076#1086#1089#1090#1091#1087#1085#1080#1093' '#1076#1083#1103' '#1074#1080#1073#1086#1088#1091' '#1087#1086#1089#1083#1091#1075', '#1097#1086' '#1085#1072#1076#1072#1102#1090#1100#1089#1103' '#1074' '#1075#1086#1090#1077#1083#1110', '#1089#1087#1086#1088#1091 +
          #1076#1110' '#1095#1080' '#1085#1086#1084#1077#1088#1110
        Align = alClient
        TabOrder = 1
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
          GridView = ViewDrvPossibleService
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 446
    Top = 0
    Width = 575
    Height = 421
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 0
      Top = 302
      Width = 575
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object Panel5: TPanel
      Left = 0
      Top = 305
      Width = 575
      Height = 22
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 3
        Top = 4
        Width = 52
        Height = 13
        Caption = #1055#1088#1080#1084#1110#1090#1082#1072' :'
      end
    end
    object GridObjService: TcxGrid
      Left = 0
      Top = 22
      Width = 575
      Height = 280
      Hint = 
        #1057#1087#1080#1089#1086#1082' '#1076#1086#1089#1090#1091#1087#1085#1080#1093' '#1076#1083#1103' '#1074#1080#1073#1086#1088#1091' '#1087#1086#1089#1083#1091#1075', '#1097#1086' '#1085#1072#1076#1072#1102#1090#1100#1089#1103' '#1074' '#1075#1086#1090#1077#1083#1110', '#1089#1087#1086#1088#1091 +
        #1076#1110' '#1095#1080' '#1085#1086#1084#1077#1088#1110
      Align = alClient
      TabOrder = 1
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
      end
    end
    object DBMemo: TcxDBMemo
      Left = 0
      Top = 327
      Align = alBottom
      Enabled = False
      StyleDisabled.Color = clMenu
      TabOrder = 2
      Height = 94
      Width = 575
    end
    object Panel6: TPanel
      Left = 0
      Top = 0
      Width = 575
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        575
        22)
      object Label3: TLabel
        Left = 3
        Top = 4
        Width = 88
        Height = 13
        Caption = #1042#1080#1073#1088#1072#1085#1110' '#1087#1086#1089#1083#1091#1075#1080' :'
      end
      object butRefresh: TSpeedButton
        Tag = 2
        Left = 529
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
      end
      object HtlServEditBtn: TSpeedButton
        Left = 551
        Top = 0
        Width = 23
        Height = 22
        Hint = #1047#1084#1110#1085#1080#1090#1080'|'#1047#1084#1110#1085#1080#1090#1080' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1102' '#1087#1088#1086' '#1087#1086#1089#1083#1091#1075#1091
        Anchors = [akTop, akRight]
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD0000
          BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00
          00FFFFFFFFFFFFFFFFFFFFFFFF31313131313132323230303031313130303031
          3131313131303030313131313131303030FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9D8D3D9BD00
          00FFFFFFFFFFFFFFFFFFFFFFFF313131C1BCC2C1BCC2C1BCC2C1BCC2C1BCC2C1
          BCC2C1BCC2C1BCC2C1BCC2C1BCC2323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFBD00
          00FFFFFFFFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000FFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFF000000000000FFFFFF000000000000FFFFFF000000000000000000BD00
          00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFF000000000000FFFFFF00000000
          0000FFFFFF000000000000000000323232FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000
          00FFFFFFFFFFFFFFFFFFFFFFFF323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFBD0000
          FFFFFF000000000000FFFFFF000000000000FFFFFF00000000000000FFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFF313131FFFFFF000000000000FFFFFF00000000
          0000FFFFFF000000000000F7F7F7FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF
          FF000000FFFFFFFFFFFFFFFFFF313131FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFFFFFFFFBD0000
          BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD000000000000FF
          FFFFFFFF000000FFFFFFFFFFFF31313132323231313130303030303032323231
          3131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
          FFFFFFBD0000BD0000FFFFFFBD0000BD0000FFFFFFBD0000BD000000000000FF
          FFFFFFFF000000FFFFFFFFFFFF303030FFFFFF313131323232FFFFFF32323230
          3030FFFFFF323232313131000000F8F8F8FFFFFF000000FFFFFFFFFFFFBD0000
          BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD0000BD00000000
          0000FFFFFFFFFF000000FFFFFF31313131313132323231313131313132323232
          3232313131313131313131323232000000F8F8F8FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          0000FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000F8F8F8FFFFFF000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000000000C600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000A8A3A9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF000000C600FFC600FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000A8A3A9A8A3A9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 2
        OnClick = HtlServEditBtnClick
      end
      object ServCopyOneToAllBtn: TSpeedButton
        Left = 375
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
        Left = 399
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
    end
  end
  object cxGridViewRepository: TcxGridViewRepository
    Left = 273
    Top = 168
    object ViewDrvPossibleService: TcxGridDBTableView
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
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewDrvPossibleServiceSERVICEID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVICEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceHAVEVALUE: TcxGridDBColumn
        DataBinding.FieldName = 'HAVEVALUE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceMEASUREUNIT: TcxGridDBColumn
        DataBinding.FieldName = 'MEASUREUNIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceLARGEICON: TcxGridDBColumn
        DataBinding.FieldName = 'LARGEICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceSMALLICON: TcxGridDBColumn
        DataBinding.FieldName = 'SMALLICON'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINHOTEL: TcxGridDBColumn
        DataBinding.FieldName = 'INHOTEL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINBUILD: TcxGridDBColumn
        DataBinding.FieldName = 'INBUILD'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINROOM: TcxGridDBColumn
        DataBinding.FieldName = 'INROOM'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceSERVGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'SERVGROUPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINFO: TcxGridDBColumn
        DataBinding.FieldName = 'INFO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINAUTO: TcxGridDBColumn
        DataBinding.FieldName = 'INAUTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINTRAIN: TcxGridDBColumn
        DataBinding.FieldName = 'INTRAIN'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINSHIP: TcxGridDBColumn
        DataBinding.FieldName = 'INSHIP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINPLANE: TcxGridDBColumn
        DataBinding.FieldName = 'INPLANE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceHAVECOST: TcxGridDBColumn
        DataBinding.FieldName = 'HAVECOST'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINFOOD: TcxGridDBColumn
        DataBinding.FieldName = 'INFOOD'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINRECRE: TcxGridDBColumn
        DataBinding.FieldName = 'INRECRE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewDrvPossibleServiceINRESORT: TcxGridDBColumn
        DataBinding.FieldName = 'INRESORT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
  end
  object PossibleServiceSrc: TDataSource
    Left = 272
    Top = 232
  end
end
