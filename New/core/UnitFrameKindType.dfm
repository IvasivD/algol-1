object FrameKindType: TFrameKindType
  Left = 0
  Top = 0
  Width = 392
  Height = 257
  TabOrder = 0
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      392
      26)
    object CityKindLabel: TLabel
      Left = 7
      Top = 8
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object CityKindComboBox: TcxExtLookupComboBox
      Left = 32
      Top = 5
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownAutoSize = True
      Properties.DropDownRows = 24
      Properties.OnEditValueChanged = CityKindComboBoxPropertiesEditValueChanged
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 357
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 26
    Width = 4
    Height = 231
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 388
    Top = 26
    Width = 4
    Height = 231
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
  end
  object GroupBoxkindType: TcxGroupBox
    Left = 4
    Top = 26
    Align = alClient
    Caption = #1042#1080#1076
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Height = 231
    Width = 384
    object GridKindType: TcxGrid
      Left = 2
      Top = 18
      Width = 380
      Height = 211
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      object GridKindTypeDBTableView1: TcxGridDBTableView
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
      object GridKindTypeLevel1: TcxGridLevel
      end
    end
  end
end
