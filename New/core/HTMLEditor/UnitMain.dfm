object FrmHtmlEditor: TFrmHtmlEditor
  Left = 290
  Top = 71
  Width = 1218
  Height = 876
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' HTML'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameHTMLEditor: TFrameHTMLEditor
    Left = 0
    Top = 0
    Width = 1202
    Height = 818
    Align = alClient
    TabOrder = 0
    inherited MainPageControl: TcxPageControl
      Width = 1202
      Height = 771
      Properties.ActivePage = FrameHTMLEditor.TabVisualEditor
      ClientRectBottom = 769
      ClientRectRight = 1200
      inherited TabVisualEditor: TcxTabSheet
        inherited MyHTMLEdit: TDHTMLEdit
          Width = 1198
          Height = 747
          OnDisplayChanged = nil
          ControlData = {
            00080000D17B0000344D00000B00FFFF0B00FFFF0B00FFFF0B00FFFF0B00FFFF
            0300010000000B00FFFF0300000000000B0000000B00FFFF0B00FFFF03003200
            00000300320000000B0000000B00FFFF}
        end
      end
    end
    inherited ToolBarMain: TToolBar
      Width = 1202
    end
    inherited ToolBarTop: TToolBar
      Width = 1202
    end
    inherited cxGridViewRepository1: TcxGridViewRepository
      inherited ViewIconList: TcxGridDBTableView
        Styles.Background = nil
        Styles.Content = nil
        Styles.ContentEven = nil
        Styles.ContentOdd = nil
        Styles.Inactive = nil
        Styles.Selection = nil
        Styles.Footer = nil
        Styles.GroupByBox = nil
        Styles.Header = nil
      end
    end
    inherited LSheet: TcxStyleRepository
      PixelsPerInch = 96
      inherited DBCardStyle: TcxGridCardViewStyleSheet
        BuiltIn = True
      end
      inherited DBBandedStyle: TcxGridBandedTableViewStyleSheet
        BuiltIn = True
      end
      inherited DBOtherStyle: TcxGridBandedTableViewStyleSheet
        BuiltIn = True
      end
      inherited DBMonitorStyle: TcxGridBandedTableViewStyleSheet
        BuiltIn = True
      end
      inherited GridTableViewStyle: TcxGridTableViewStyleSheet
        BuiltIn = True
      end
      inherited MyStyle: TcxGridTableViewStyleSheet
        BuiltIn = True
      end
      inherited MyStyleTree: TcxTreeListStyleSheet
        BuiltIn = True
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = FrameHTMLEditor.ImageList1
    Left = 464
    Top = 152
    object ButPreviewIE: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object MmenNewPage: TMenuItem
        Caption = #1053#1086#1074#1080#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        ImageIndex = 0
        OnClick = MmenNewPageClick
      end
      object N27: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object MButOpen: TMenuItem
        Caption = #1042#1110#1076#1082#1088#1080#1090#1080
        ImageIndex = 2
        OnClick = MButOpenClick
      end
      object ButSaveHtml: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080
        ImageIndex = 4
        OnClick = ButSaveHtmlClick
      end
      object ButSaveAsHtml: TMenuItem
        Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1103#1082
        ImageIndex = 5
        OnClick = ButSaveAsHtmlClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object PreviewPrintHTML: TMenuItem
        Caption = #1055#1086#1087#1077#1088#1077#1076#1085#1110#1081' '#1087#1077#1088#1077#1075#1083#1103#1076
        ImageIndex = 67
        OnClick = PreviewPrintHTMLClick
      end
      object PrintHTML: TMenuItem
        Caption = #1044#1088#1091#1082
        ImageIndex = 7
        OnClick = PrintHTMLClick
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object ButRtfToHtml: TMenuItem
        Caption = #1045#1082#1089#1087#1086#1088#1090' '#1079' RTF'
        Visible = False
      end
      object N31: TMenuItem
        Caption = '-'
        Enabled = False
        Visible = False
      end
      object ButGoogleHrome: TMenuItem
        Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1074' Google Hrome'
        ImageIndex = 74
        OnClick = ButGoogleHromeClick
      end
      object ButPreviewMozilla: TMenuItem
        Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1074' Mozilla'
        ImageIndex = 70
        OnClick = ButPreviewMozillaClick
      end
      object ButPreviewOpera: TMenuItem
        Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1074' Opera'
        ImageIndex = 71
        OnClick = ButPreviewOperaClick
      end
      object BtPrewiewBrowserIE: TMenuItem
        Caption = #1055#1077#1088#1077#1075#1083#1103#1076' '#1074' IE'
        ImageIndex = 69
        OnClick = BtPrewiewBrowserIEClick
      end
      object N26: TMenuItem
        Caption = '-'
        Enabled = False
      end
    end
    object MenEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      object MnUndo: TMenuItem
        Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
        ImageIndex = 56
        OnClick = MnUndoClick
      end
      object MnRedo: TMenuItem
        Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1080
        ImageIndex = 55
        OnClick = MnRedoClick
      end
      object N20: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object MnuSelectAll: TMenuItem
        Caption = #1042#1080#1076#1110#1083#1080#1090#1080' '#1074#1089#1077
        ImageIndex = 51
        OnClick = MnuSelectAllClick
      end
      object MnCut: TMenuItem
        Caption = #1042#1080#1088#1110#1079#1072#1090#1080
        ImageIndex = 12
        OnClick = MnCutClick
      end
      object MnCopy: TMenuItem
        Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080
        ImageIndex = 13
        OnClick = MnCopyClick
      end
      object MnPaste: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1080#1090#1080
        ImageIndex = 14
        OnClick = MnPasteClick
      end
      object MnPasteWithFilter: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1080#1090#1080' '#1079' '#1092#1110#1083#1100#1090#1088#1086#1084
        ImageIndex = 72
        OnClick = MnPasteWithFilterClick
      end
      object N1: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object MnEdObject: TMenuItem
        Caption = #1054#1073#39#1108#1082#1090
        OnClick = MnEdObjectClick
      end
    end
    object N8: TMenuItem
      Caption = #1042#1089#1090#1072#1074#1080#1090#1080
      object MnButFlash: TMenuItem
        Caption = #1060#1083#1077#1096' '#1086#1073#39#1108#1082#1090
        ImageIndex = 62
        OnClick = MnButFlashClick
      end
      object MnInsertImage: TMenuItem
        Caption = #1052#1072#1083#1102#1085#1086#1082
        ImageIndex = 28
        OnClick = MnInsertImageClick
      end
      object MnTable: TMenuItem
        Caption = #1058#1072#1073#1083#1080#1094#1102
        ImageIndex = 54
        OnClick = MnTableClick
      end
      object N9: TMenuItem
        Caption = '-'
        Enabled = False
      end
      object ButInsertSymbal: TMenuItem
        Caption = #1057#1080#1084#1074#1086#1083'...'
        ImageIndex = 77
        OnClick = ButInsertSymbalClick
      end
    end
    object N21: TMenuItem
      Caption = #1054#1087#1094#1110#1111
      object N22: TMenuItem
        Caption = #1047#1084#1110#1085#1080#1090#1080
      end
      object N23: TMenuItem
        Caption = '-'
        Enabled = False
      end
    end
    object N6: TMenuItem
      Caption = #1044#1086#1087#1086#1084#1086#1075#1072
      Visible = False
      object N7: TMenuItem
        Caption = #1055#1088#1086' '#1087#1088#1086#1075#1088#1072#1084#1091
      end
    end
  end
end
