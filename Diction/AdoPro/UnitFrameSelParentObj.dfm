object FrameSelParentObj: TFrameSelParentObj
  Left = 0
  Top = 0
  Width = 428
  Height = 503
  TabOrder = 0
  object PanSelCountry: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 193
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object GridCounry: TcxGrid
      Left = 0
      Top = 43
      Width = 428
      Height = 150
      Align = alClient
      TabOrder = 0
      object GridCounryDBTableView1: TcxGridDBTableView
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
      object GridCounryLevel1: TcxGridLevel
        GridView = ViewSelCountry
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 428
      Height = 43
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        428
        43)
      object Label1: TLabel
        Left = 3
        Top = 4
        Width = 109
        Height = 13
        Caption = #1050#1088#1072#1111#1085#1080' '#1088#1086#1079#1090#1072#1096#1091#1074#1072#1085#1085#1103
      end
      object butDelSelCountry: TSpeedButton
        Tag = 2
        Left = 23
        Top = 21
        Width = 23
        Height = 21
        Hint = #1042#1080#1076#1072#1083#1080#1090#1080
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014140000FF801414A1A1A0A1A1A0A1A1
          A08014140000FF7B0000A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D
          2D2D8282822D2D2DA1A1A0A1A1A0A1A1A02D2D2D8282821E1E1EA1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF1414F3801414A1A1A08014
          141414F30000FF0000FFA1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D2D2D85
          85858181818686862E2E2DA1A1A02D2D2D868686818181828282A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF1414F38014141414
          F30000FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D
          2D2D8686868282828686862D2D2D8585858282828686862E2E2EA1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000
          FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A02D2D2D8686868282828282828282828686862E2E2EA1A1A0A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014140000FF0000FF0000
          FF801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A0A1A1A02E2E2D8282828181818282822E2E2DA1A1A0A1A1A0A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000
          FF801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A02D2D2D8585858282828282828282822E2E2DA1A1A0A1A1A0A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000FF0000
          FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02E
          2E2D8686868181818282828181818282828686862D2D2DA1A1A0262626262626
          3535352626262626262626268426262626E90000FF1414F38014148014141414
          F30000FF1414F38014142626262626263535352626262626262626263C3C3C89
          89898282828686862D2D2D2D2D2D8686868282828585852D2D2D141414A1A1A0
          262626A1A1A0A1A1A0A1A1A0A1A1A08014141414F3801414A1A1A0A1A1A08014
          140000FF0000FF0000FF141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A02E
          2E2D8686862D2D2DA1A1A0A1A1A02E2E2D828282838383828282262626E92626
          353535A1A1A0F31414F31414F31414A1A1A0801414842626E92626E92626E926
          268014142626E98014142626265B5B5B353535A1A1A0515151515150515151A1
          A1A02D2D2D3C3C3C5B5B5A5B5B5B5B5B5A2D2D2D8989892E2E2D141414A1A1A0
          262626A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1
          A0A1A1A0842626A1A1A0141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A03C3C3CA1A1A0262626E92626
          353535A1A1A0F31414F31414F31414A1A1A0F31414F31414F31414F31414F314
          14A1A1A0262626A1A1A02626265B5B5A353535A1A1A0515150525252515150A1
          A1A0515151515151515150515151525252A1A1A0262626A1A1A0141414A1A1A0
          262626A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1
          A0A1A1A0262626A1A1A0141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0262626A1A1A0262626262626
          4242422626262626261414142626262626262626261414141414141414142626
          26262626353535A1A1A026262626262642424226262626262614141426262626
          2626262626141414141414141414262626262626353535A1A1A0141414A1A1A0
          262626A1A1A0F31414FF0000F31414A1A1A0F31414FF0000FF0000FF0000F314
          14A1A1A0262626A1A1A0141414A1A1A0262626A1A1A0515150464646515150A1
          A1A0515151464646454545464646515150A1A1A0262626A1A1A0141414141414
          2626261414141414140000001414141414141414140000000000000000001414
          14141414262626A1A1A014141414141426262614141414141400000014141414
          1414141414000000000000000000141414141414262626A1A1A0}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = butDelSelCountryClick
      end
      object butAddSelCountry: TSpeedButton
        Tag = 2
        Left = 0
        Top = 21
        Width = 23
        Height = 21
        Hint = #1044#1086#1076#1072#1090#1080
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1C1C1C1D1D1D1D1D1D1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1C1C1CDCDCDCDCDCDC1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1D1D1DDCDCDCDCDCDC1D1D1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B000000FF0000FF007B00
          007B00007B00007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1C1C1D
          1D1D1E1E1E1D1D1DDCDCDCDCDCDC1D1D1D1C1C1C1C1C1C1C1C1CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1DDC
          DCDCDDDDDDDCDCDCDCDCDCDDDDDDDCDCDCDCDCDCDDDDDD1C1C1CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1C1CDD
          DDDDDCDCDCDCDCDCDCDCDCDDDDDDDCDCDCDCDCDCDCDCDC1C1C1CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B000000FF0000FF007B00
          007B00007B00007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1D1D
          1D1D1C1C1C1D1D1DDCDCDCDCDCDC1D1D1D1D1D1D1C1C1C1C1C1C000000000000
          0000000000000000000000000000000000000000007B000000FF0000FF007B00
          00000000000000FFFFFF00000000000000000000000000000000000000000000
          00000000001D1D1DDCDCDCDCDCDC1C1C1C000000000000FFFFFF000000FFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
          00FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1C1C1CDCDCDCDCDCDC1C1C1CFFFFFF000000FFFFFF000000FF0000
          000000FFFFFFFF0000FF0000FF0000FFFFFFFF00007B00007B00007B00007B00
          00FFFFFF000000FFFFFF000000454545000000FFFFFF464646474747454545FF
          FFFF4545451D1D1D1D1D1D1D1D1D1D1D1DFFFFFF000000FFFFFF000000FFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF0000
          000000FFFFFFFF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FF00
          00FFFFFF000000FFFFFF000000454545000000FFFFFF464646454545454545FF
          FFFF454545464646454545454545454545FFFFFF000000FFFFFF000000FFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000FFFFFF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000FFFFFF000000FFFFFF
          000000FFFFFFFF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FF00
          00FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF454545464646454545FF
          FFFF464646454545464646464646454545FFFFFF000000FFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000FFFFFF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000FFFFFF}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = butAddSelCountryClick
      end
      object Bevel1: TBevel
        Left = 51
        Top = 22
        Width = 2
        Height = 19
      end
      object CmbxSearchCountry: TcxExtLookupComboBox
        Left = 57
        Top = 21
        Hint = #1050#1088#1072#1111#1085#1072', '#1076#1077' '#1092#1110#1088#1084#1072' '#1084#1072#1108' '#1086#1092#1110#1089'|'#1050#1088#1072#1111#1085#1072', '#1076#1077' '#1092#1110#1088#1084#1072' '#1084#1072#1108' '#1086#1092#1110#1089
        Anchors = [akLeft, akTop, akRight]
        Properties.DropDownListStyle = lsEditList
        Properties.DropDownRows = 24
        Properties.HideSelection = False
        Properties.IncrementalFiltering = False
        Properties.OnChange = CmbxSearchCountryPropertiesChange
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleDisabled.TextColor = clBlack
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 371
      end
    end
  end
  object PanelSelObject: TPanel
    Left = 0
    Top = 193
    Width = 428
    Height = 310
    Align = alClient
    TabOrder = 1
    object PanSelCity: TPanel
      Left = 1
      Top = 79
      Width = 426
      Height = 230
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object GridObject: TcxGrid
        Left = 0
        Top = 0
        Width = 426
        Height = 230
        Align = alClient
        TabOrder = 0
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
          OptionsBehavior.CellHints = True
          OptionsSelection.CellSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
        end
        object cxGridLevel1: TcxGridLevel
          GridView = ViewSelObject
        end
      end
    end
    object PanelSearchObj: TPanel
      Left = 1
      Top = 1
      Width = 426
      Height = 78
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        426
        78)
      object Label2: TLabel
        Left = 3
        Top = 3
        Width = 134
        Height = 13
        Caption = #1047#1085#1072#1093#1086#1076#1080#1090#1100#1089#1103' '#1085#1072' '#1090#1077#1088#1080#1090#1086#1088#1110#1111':'
      end
      object butAddSeObject: TSpeedButton
        Tag = 2
        Left = 0
        Top = 37
        Width = 23
        Height = 21
        Hint = #1044#1086#1076#1072#1090#1080
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1C1C1C1D1D1D1D1D1D1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1C1C1CDCDCDCDCDCDC1C1C1CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1D1D1DDCDCDCDCDCDC1D1D1DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B000000FF0000FF007B00
          007B00007B00007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1C1C1D
          1D1D1E1E1E1D1D1DDCDCDCDCDCDC1D1D1D1C1C1C1C1C1C1C1C1CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1DDC
          DCDCDDDDDDDCDCDCDCDCDCDDDDDDDCDCDCDCDCDCDDDDDD1C1C1CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF0000FF0000FF0000FF0000FF
          0000FF0000FF007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1C1C1CDD
          DDDDDCDCDCDCDCDCDCDCDCDDDDDDDCDCDCDCDCDCDCDCDC1C1C1CFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7B00007B00007B00007B000000FF0000FF007B00
          007B00007B00007B0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1D1D1D1D
          1D1D1C1C1C1D1D1DDCDCDCDCDCDC1D1D1D1D1D1D1C1C1C1C1C1C000000000000
          0000000000000000000000000000000000000000007B000000FF0000FF007B00
          00000000000000FFFFFF00000000000000000000000000000000000000000000
          00000000001D1D1DDCDCDCDCDCDC1C1C1C000000000000FFFFFF000000FFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B000000FF0000FF007B00
          00FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF1C1C1CDCDCDCDCDCDC1C1C1CFFFFFF000000FFFFFF000000FF0000
          000000FFFFFFFF0000FF0000FF0000FFFFFFFF00007B00007B00007B00007B00
          00FFFFFF000000FFFFFF000000454545000000FFFFFF464646474747454545FF
          FFFF4545451D1D1D1D1D1D1D1D1D1D1D1DFFFFFF000000FFFFFF000000FFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000FF0000
          000000FFFFFFFF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FF00
          00FFFFFF000000FFFFFF000000454545000000FFFFFF464646454545454545FF
          FFFF454545464646454545454545454545FFFFFF000000FFFFFF000000FFFFFF
          000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000FFFFFF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000FFFFFF000000FFFFFF
          000000FFFFFFFF0000FF0000FF0000FFFFFFFF0000FF0000FF0000FF0000FF00
          00FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF454545464646454545FF
          FFFF464646454545464646464646454545FFFFFF000000FFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000FFFFFF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000FFFFFF}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = butAddSeObjectClick
      end
      object Bevel2: TBevel
        Left = 51
        Top = 38
        Width = 2
        Height = 19
      end
      object butDelSeObject: TSpeedButton
        Tag = 2
        Left = 23
        Top = 37
        Width = 23
        Height = 21
        Hint = #1042#1080#1076#1072#1083#1080#1090#1080
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014140000FF801414A1A1A0A1A1A0A1A1
          A08014140000FF7B0000A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D
          2D2D8282822D2D2DA1A1A0A1A1A0A1A1A02D2D2D8282821E1E1EA1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF1414F3801414A1A1A08014
          141414F30000FF0000FFA1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D2D2D85
          85858181818686862E2E2DA1A1A02D2D2D868686818181828282A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF1414F38014141414
          F30000FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02D
          2D2D8686868282828686862D2D2D8585858282828686862E2E2EA1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000
          FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A02D2D2D8686868282828282828282828686862E2E2EA1A1A0A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014140000FF0000FF0000
          FF801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A0A1A1A02E2E2D8282828181818282822E2E2DA1A1A0A1A1A0A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000
          FF801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A02D2D2D8585858282828282828282822E2E2DA1A1A0A1A1A0A1A1A0A1A1A0
          A1A1A0A1A1A0A1A1A0A1A1A0A1A1A08014141414F30000FF0000FF0000FF0000
          FF1414F3801414A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A02E
          2E2D8686868181818282828181818282828686862D2D2DA1A1A0262626262626
          3535352626262626262626268426262626E90000FF1414F38014148014141414
          F30000FF1414F38014142626262626263535352626262626262626263C3C3C89
          89898282828686862D2D2D2D2D2D8686868282828585852D2D2D141414A1A1A0
          262626A1A1A0A1A1A0A1A1A0A1A1A08014141414F3801414A1A1A0A1A1A08014
          140000FF0000FF0000FF141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A02E
          2E2D8686862D2D2DA1A1A0A1A1A02E2E2D828282838383828282262626E92626
          353535A1A1A0F31414F31414F31414A1A1A0801414842626E92626E92626E926
          268014142626E98014142626265B5B5B353535A1A1A0515151515150515151A1
          A1A02D2D2D3C3C3C5B5B5A5B5B5B5B5B5A2D2D2D8989892E2E2D141414A1A1A0
          262626A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1
          A0A1A1A0842626A1A1A0141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A03C3C3CA1A1A0262626E92626
          353535A1A1A0F31414F31414F31414A1A1A0F31414F31414F31414F31414F314
          14A1A1A0262626A1A1A02626265B5B5A353535A1A1A0515150525252515150A1
          A1A0515151515151515150515151525252A1A1A0262626A1A1A0141414A1A1A0
          262626A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1
          A0A1A1A0262626A1A1A0141414A1A1A0262626A1A1A0A1A1A0A1A1A0A1A1A0A1
          A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0A1A1A0262626A1A1A0262626262626
          4242422626262626261414142626262626262626261414141414141414142626
          26262626353535A1A1A026262626262642424226262626262614141426262626
          2626262626141414141414141414262626262626353535A1A1A0141414A1A1A0
          262626A1A1A0F31414FF0000F31414A1A1A0F31414FF0000FF0000FF0000F314
          14A1A1A0262626A1A1A0141414A1A1A0262626A1A1A0515150464646515150A1
          A1A0515151464646454545464646515150A1A1A0262626A1A1A0141414141414
          2626261414141414140000001414141414141414140000000000000000001414
          14141414262626A1A1A014141414141426262614141414141400000014141414
          1414141414000000000000000000141414141414262626A1A1A0}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = butDelSeObjectClick
      end
      object RbCity: TcxRadioButton
        Left = 5
        Top = 20
        Width = 60
        Height = 17
        Caption = #1052#1110#1089#1090#1072
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RbCityClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object rbResort: TcxRadioButton
        Left = 65
        Top = 20
        Width = 69
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1050#1091#1088#1086#1088#1090#1091
        TabOrder = 1
        OnClick = RbCityClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object RbNaturObj: TcxRadioButton
        Left = 137
        Top = 20
        Width = 140
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1055#1088#1080#1088#1086#1076#1085#1080#1095#1086#1075#1086' '#1086#1073#8217#1108#1082#1090#1091
        TabOrder = 2
        OnClick = RbCityClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object RbInfra: TcxRadioButton
        Left = 281
        Top = 20
        Width = 143
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1054#1073#8217#1108#1082#1090#1091' '#1110#1085#1092#1088#1072#1089#1090#1088#1091#1082#1090#1091#1088#1080
        TabOrder = 3
        OnClick = RbCityClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object PageControlSearcObject: TcxPageControl
        Left = 57
        Top = 35
        Width = 370
        Height = 42
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Properties.ActivePage = TabCity
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        ClientRectBottom = 40
        ClientRectLeft = 2
        ClientRectRight = 368
        ClientRectTop = 22
        object TabCity: TcxTabSheet
          Caption = 'TabCity'
          ImageIndex = 0
          inline FrameSearchCityObj: TFrameSearchCity
            Left = 0
            Top = 0
            Width = 366
            Height = 18
            Align = alClient
            TabOrder = 0
            inherited EdSearchCity: TcxTextEdit
              Width = 182
            end
            inherited PanelControl: TPanel
              Left = 302
              Height = 21
            end
            inherited ADOCity: TADOQuery
              Left = 280
            end
          end
        end
        object TabResort: TcxTabSheet
          Caption = 'TabResort'
          ImageIndex = 3
          inline FrameSearchResortObj: TFrameSearchCity
            Left = 0
            Top = 0
            Width = 366
            Height = 18
            Align = alClient
            TabOrder = 0
            inherited EdSearchCity: TcxTextEdit
              Width = 29
            end
            inherited PanelControl: TPanel
              Left = 302
              Height = 21
            end
            inherited ADOCity: TADOQuery
              Left = 280
            end
          end
        end
        object TabNaturObj: TcxTabSheet
          Caption = 'TabNaturObj'
          ImageIndex = 1
          object CmbxSearchNaturObj: TcxExtLookupComboBox
            Left = 0
            Top = 0
            Align = alClient
            Properties.DropDownListStyle = lsEditList
            Properties.DropDownRows = 24
            Properties.HideSelection = False
            Properties.IncrementalFiltering = False
            Properties.OnChange = CmbxSearchInfrastructuresPropertiesChange
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Width = 366
          end
        end
        object TabInfra: TcxTabSheet
          Caption = 'TabInfra'
          ImageIndex = 2
          object CmbxSearchInfrastructures: TcxExtLookupComboBox
            Left = 0
            Top = 0
            Align = alClient
            Properties.DropDownListStyle = lsEditList
            Properties.DropDownRows = 24
            Properties.HideSelection = False
            Properties.IncrementalFiltering = False
            Properties.OnChange = CmbxSearchInfrastructuresPropertiesChange
            Style.Color = clInfoBk
            Style.LookAndFeel.Kind = lfStandard
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.Kind = lfStandard
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleDisabled.TextColor = clBlack
            StyleFocused.LookAndFeel.Kind = lfStandard
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.Kind = lfStandard
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 0
            Width = 366
          end
        end
      end
    end
  end
  object CountryObjSrc: TDataSource
    Left = 44
    Top = 75
  end
  object ObjLinksSrc: TDataSource
    Left = 84
    Top = 283
  end
  object cxGridViewRepository: TcxGridViewRepository
    Left = 100
    Top = 345
    object ViewSelCountry: TcxGridDBTableView
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
      OnFocusedRecordChanged = ViewSelCountryFocusedRecordChanged
      DataController.DataSource = CountryObjSrc
      DataController.KeyFieldNames = 'COUNTRYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewSelCountryCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
      end
      object ViewSelCountryCOUNTRINAME: TcxGridDBColumn
        Caption = #1050#1088#1072#1111#1085#1072
        DataBinding.FieldName = 'COUNTRINAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
    object ViewSelObject: TcxGridDBTableView
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
      DataController.DataSource = ObjLinksSrc
      DataController.KeyFieldNames = 'LINKID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.CellHints = True
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewSelObjectLINKID: TcxGridDBColumn
        DataBinding.FieldName = 'LINKID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSelObjectMAIN_TYPEOBJ: TcxGridDBColumn
        DataBinding.FieldName = 'MAIN_TYPEOBJ'
        Visible = False
      end
      object ViewSelObjectMAINOBJECTID: TcxGridDBColumn
        DataBinding.FieldName = 'MAINOBJECTID'
        Visible = False
      end
      object ViewSelObjectTYPEOBJ: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEOBJ'
        Visible = False
      end
      object ViewSelObjectOBJECTID: TcxGridDBColumn
        DataBinding.FieldName = 'OBJECTID'
        Visible = False
      end
      object ViewSelObjectOBJLINKCOUNTRY: TcxGridDBColumn
        DataBinding.FieldName = 'OBJLINKCOUNTRY'
        Visible = False
      end
      object ViewSelObjectOBJECTNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'CalcObjName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
    end
  end
end
