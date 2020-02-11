object FrAddress: TFrAddress
  Left = 0
  Top = 0
  Width = 612
  Height = 105
  TabOrder = 0
  object Label1: TLabel
    Left = 159
    Top = 14
    Width = 33
    Height = 13
    Caption = #1050#1088#1072#1111#1085#1072
  end
  object butSearchAllTownShips: TSpeedButton
    Left = 404
    Top = 9
    Width = 23
    Height = 22
    AllowAllUp = True
    GroupIndex = 1
    Flat = True
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F000000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333300003333333333333300333300003333333333333333333300003333
      3333333333003333000033033333333333003333000030003333333333300333
      00000F000333333330330033000030F000333333300330030000330F00000007
      3300003300003330F0078887033333330000333300788FF87033333300003333
      0788888F877333330000333308888888F80333330000333307888888F8033333
      00003333078FF8888803333300003333777FF888877333330000333330778888
      7033333300003333330777770333333300003333333700073333333300003333
      33333333333333330000}
    Transparent = False
  end
  object Label2: TLabel
    Left = 449
    Top = 9
    Width = 51
    Height = 26
    Caption = #1055#1086#1096#1090#1086#1074#1080#1081#13#10#1110#1085#1076#1077#1082#1089
  end
  object Label3: TLabel
    Left = 11
    Top = 39
    Width = 54
    Height = 26
    Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1081#13#10#1087#1091#1085#1082#1090
  end
  object Label4: TLabel
    Left = 411
    Top = 44
    Width = 30
    Height = 13
    Caption = #1056#1072#1081#1086#1085
    Visible = False
  end
  object Label5: TLabel
    Left = 411
    Top = 71
    Width = 19
    Height = 13
    Caption = #1041#1091#1076
  end
  object Label6: TLabel
    Left = 13
    Top = 14
    Width = 44
    Height = 13
    Caption = #1040#1076#1088#1077#1089#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ExtLupComboboxCountry: TcxExtLookupComboBox
    Left = 196
    Top = 11
    Properties.OnChange = ExtLupComboboxCountryPropertiesChange
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
    Width = 207
  end
  object EdPostIndex: TcxTextEdit
    Left = 504
    Top = 11
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 95
  end
  object EdRayon: TcxTextEdit
    Left = 448
    Top = 40
    Properties.OnChange = EdRayonPropertiesChange
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
    Visible = False
    Width = 153
  end
  object EdBuilding: TcxTextEdit
    Left = 448
    Top = 67
    Properties.OnChange = EdRayonPropertiesChange
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
    Width = 57
  end
  object ChOffice: TcxCheckBox
    Left = 515
    Top = 67
    Caption = #1054#1092
    Properties.OnChange = ChOfficePropertiesChange
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Width = 41
  end
  object EdOffice: TcxTextEdit
    Left = 552
    Top = 67
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
    Width = 48
  end
  object ExtLupComboboxStreetKind: TcxExtLookupComboBox
    Left = 80
    Top = 67
    Properties.OnChange = ExtLupComboboxCountryPropertiesChange
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
    Width = 97
  end
  object CmBoxStreet: TcxComboBox
    Left = 180
    Top = 67
    Properties.OnChange = CmBoxStreetPropertiesChange
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
    Width = 223
  end
  inline FrameSearchCityAddres: TFrameSearchCity
    Left = 80
    Top = 39
    Width = 321
    Height = 24
    TabOrder = 8
    inherited EdSearchCity: TcxTextEdit
      Width = 273
    end
    inherited PanelControl: TPanel
      Left = 274
      Height = 24
    end
  end
  object ViewRepository: TcxGridViewRepository
    Left = 72
    object ViewContryList: TcxGridDBTableView
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
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewContryListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object ViewContryListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
    end
    object ViewProvinciesList: TcxGridDBTableView
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
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewProvinciesListPROVINCEID: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCEID'
        Visible = False
      end
      object ViewProvinciesListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object ViewProvinciesListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
    end
    object ViewTownShipsList: TcxGridDBTableView
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
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewTownShipsListTOWNSHIPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOWNSHIPID'
        Visible = False
      end
      object ViewTownShipsListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewTownShipsListPROVINCEID: TcxGridDBColumn
        DataBinding.FieldName = 'PROVINCEID'
        Visible = False
      end
      object ViewTownShipsListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
    end
    object ViewKindStreetList: TcxGridDBTableView
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
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewKindStreetListID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object ViewKindStreetListNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
      end
      object ViewKindStreetListAORDER: TcxGridDBColumn
        DataBinding.FieldName = 'AORDER'
        Visible = False
      end
    end
    object ViewCitiesList: TcxGridDBTableView
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
      DataController.KeyFieldNames = 'CITYID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      object ViewCitiesListCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCitiesListCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewCitiesListColumnCITINAME: TcxGridDBColumn
        DataBinding.FieldName = 'CITINAME'
        Visible = False
      end
      object ViewCitiesListprovincesNAME: TcxGridDBColumn
        DataBinding.FieldName = 'provincesNAME'
        Visible = False
      end
      object ViewCitiesListtownshipsNAME: TcxGridDBColumn
        DataBinding.FieldName = 'townshipsNAME'
        Visible = False
      end
      object ViewCitiesListprovinceid: TcxGridDBColumn
        DataBinding.FieldName = 'provinceid'
        Visible = False
      end
      object ViewCitiesListtownshipid: TcxGridDBColumn
        DataBinding.FieldName = 'townshipid'
        Visible = False
      end
    end
  end
end
