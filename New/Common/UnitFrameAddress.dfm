object FrAddress: TFrAddress
  Left = 0
  Top = 0
  Width = 600
  Height = 105
  TabOrder = 0
  DesignSize = (
    600
    105)
  object Label1: TLabel
    Left = 79
    Top = 14
    Width = 34
    Height = 13
    Caption = #1050#1088#1072#1111#1085#1072
  end
  object Label2: TLabel
    Left = 435
    Top = 9
    Width = 51
    Height = 26
    Anchors = [akTop, akRight]
    Caption = #1055#1086#1096#1090#1086#1074#1080#1081#13#10#1110#1085#1076#1077#1082#1089
  end
  object Label3: TLabel
    Left = 11
    Top = 39
    Width = 56
    Height = 26
    Caption = #1053#1072#1089#1077#1083#1077#1085#1080#1081#13#10#1087#1091#1085#1082#1090
  end
  object Label5: TLabel
    Left = 399
    Top = 71
    Width = 18
    Height = 13
    Anchors = [akTop, akRight]
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
  object LbCityDistrict: TLabel
    Left = 398
    Top = 43
    Width = 61
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1056#1072#1081#1086#1085' '#1084#1110#1089#1090#1072
  end
  object ExtLupComboboxCountry: TcxExtLookupComboBox
    Left = 118
    Top = 11
    Anchors = [akLeft, akTop, akRight]
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
    Width = 272
  end
  object EdPostIndex: TcxTextEdit
    Left = 499
    Top = 11
    Anchors = [akTop, akRight]
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
  object EdBuilding: TcxTextEdit
    Left = 442
    Top = 67
    Anchors = [akTop, akRight]
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
    Width = 57
  end
  object ChOffice: TcxCheckBox
    Left = 509
    Top = 67
    Anchors = [akTop, akRight]
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
    TabOrder = 3
    Width = 41
  end
  object EdOffice: TcxTextEdit
    Left = 546
    Top = 67
    Anchors = [akTop, akRight]
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
    Width = 48
  end
  object ExtLupComboboxStreetKind: TcxExtLookupComboBox
    Left = 78
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
    TabOrder = 5
    Width = 97
  end
  object CmBoxStreet: TcxComboBox
    Left = 178
    Top = 67
    Anchors = [akLeft, akTop, akRight]
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
    TabOrder = 6
    Width = 211
  end
  inline FrameSearchCityAddres: TFrameSearchCity
    Left = 78
    Top = 39
    Width = 309
    Height = 24
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
    inherited EdSearchCity: TcxTextEdit
      Width = 261
    end
    inherited PanelControl: TPanel
      Left = 262
      Height = 24
    end
  end
  object EdDistrictCity: TcxTextEdit
    Left = 460
    Top = 39
    Anchors = [akTop, akRight]
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 8
    Width = 134
  end
  object ViewRepository: TcxGridViewRepository
    Left = 8
    Top = 72
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
