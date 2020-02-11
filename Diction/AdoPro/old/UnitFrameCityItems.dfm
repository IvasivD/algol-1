object FrameCityItems: TFrameCityItems
  Left = 0
  Top = 0
  Width = 754
  Height = 438
  TabOrder = 0
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 754
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      754
      24)
    object butReftershCitiytems: TSpeedButton
      Tag = 2
      Left = 3
      Top = 1
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
      OnClick = butReftershCitiytemsClick
    end
    object EdSearchCountry: TcxTextEdit
      Left = 30
      Top = 2
      Anchors = [akLeft, akTop, akRight]
      Properties.OnChange = EdSearchCountryPropertiesChange
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.Color = clInfoBk
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 723
    end
  end
  object GridCityAdmUnit: TcxGrid
    Left = 0
    Top = 24
    Width = 754
    Height = 414
    Align = alClient
    TabOrder = 1
    object GridCityAdmUnitDBTableView1: TcxGridDBTableView
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
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
    end
    object GridCityAdmUnitLevel1: TcxGridLevel
      GridView = GridCityAdmUnitDBTableView1
    end
  end
  object DBTreeCityItemsSrc: TDataSource
    Left = 392
    Top = 312
  end
end
