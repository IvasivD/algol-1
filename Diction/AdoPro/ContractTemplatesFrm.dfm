object ContractTemplatesForm: TContractTemplatesForm
  Left = 372
  Top = 238
  Width = 867
  Height = 701
  Caption = #1064#1072#1073#1083#1086#1085#1080' '#1091#1075#1086#1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 188
    Width = 851
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel2: TPanel
    Left = 0
    Top = 191
    Width = 851
    Height = 439
    Align = alClient
    TabOrder = 0
    object Panel1: TPanel
      Left = 305
      Top = 1
      Width = 545
      Height = 437
      Align = alClient
      TabOrder = 0
      object BookMarkSelectBtn: TSpeedButton
        Left = 2
        Top = 43
        Width = 23
        Height = 22
        Hint = #1044#1086#1076#1072#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000BDBD00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000000000000000000000000000BDBD00BDBD00000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000BDBD00BDBD00BDBD00BD
          BD00BDBD00BDBD00BDBD00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000BDBD00BDBD00BDBD00BDBD00BDBD00BDBD00BDBD00BDBD000000
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000BDBD00BDBD00BDBD00BD
          BD00BDBD00BDBD00BDBD00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF000000000000000000000000000000BDBD00BDBD00000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000BDBD00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        OnClick = BookMarkSelectBtnClick
      end
      object BookMarkUnSelectBtn: TSpeedButton
        Left = 3
        Top = 69
        Width = 23
        Height = 22
        Hint = #1042#1080#1076#1072#1083#1080#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000BDBD0000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000BDBD00BDBD00000000000000000000000000000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000BDBD00BDBD00BDBD00BD
          BD00BDBD00BDBD00BDBD00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          000000BDBD00BDBD00BDBD00BDBD00BDBD00BDBD00BDBD00BDBD00000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000BDBD00BDBD00BDBD00BD
          BD00BDBD00BDBD00BDBD00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF000000BDBD00BDBD00000000000000000000000000000000FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000BDBD0000
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF000000000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        ParentFont = False
        OnClick = BookMarkUnSelectBtnClick
      end
      object SelTemplGrid: TcxGrid
        Left = 28
        Top = 1
        Width = 516
        Height = 435
        Align = alRight
        PopupMenu = CliboardPopupMenu
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object SelTemplGridLevel1: TcxGridLevel
          GridView = DMServ.ViewSelCntrTemplQry
        end
      end
    end
    object CntrTemplGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 304
      Height = 437
      Align = alLeft
      TabOrder = 1
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      object CntrTemplGridLevel1: TcxGridLevel
        GridView = DMServ.ViewCntrTemplQry
      end
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 29
    Width = 851
    Height = 159
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 2
    OnChange = PageControlChange
    OnChanging = PageControlChanging
    object TabSheet1: TTabSheet
      Caption = #1058#1080#1087#1080' '#1091#1075#1086#1076
      object ContractGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 843
        Height = 131
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object ContractGridLevel1: TcxGridLevel
          GridView = DMServ.ViewSelContractQry
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1042#1080#1076#1080' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1110#1074
      ImageIndex = 1
      object EntrpFileNameLabel: TLabel
        Left = 143
        Top = 9
        Width = 95
        Height = 13
        Caption = 'EntrpFileNameLabel'
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = EntrpFileNameLabelClick
        OnMouseEnter = EntrpFileNameLabelMouseEnter
        OnMouseLeave = IndvdFileNameLabelMouseLeave
      end
      object BsnmFileNameLabel: TLabel
        Tag = 1
        Left = 143
        Top = 36
        Width = 70
        Height = 13
        Caption = 'FileNameLabel'
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = EntrpFileNameLabelClick
        OnMouseEnter = EntrpFileNameLabelMouseEnter
        OnMouseLeave = IndvdFileNameLabelMouseLeave
      end
      object IndvdFileNameLabel: TLabel
        Tag = 2
        Left = 143
        Top = 63
        Width = 70
        Height = 13
        Caption = 'FileNameLabel'
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = EntrpFileNameLabelClick
        OnMouseEnter = EntrpFileNameLabelMouseEnter
        OnMouseLeave = IndvdFileNameLabelMouseLeave
      end
      object IsEnterprRadioButton: TRadioButton
        Left = 8
        Top = 7
        Width = 129
        Height = 17
        Caption = #1044#1083#1103' '#1102#1088#1080#1076#1080#1095#1085#1080#1093' '#1086#1089#1110#1073
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RadioButtonClick
      end
      object IsBsmanRadioButton: TRadioButton
        Tag = 1
        Left = 8
        Top = 34
        Width = 113
        Height = 17
        Caption = #1044#1083#1103' '#1060#1054#1055
        TabOrder = 1
        OnClick = RadioButtonClick
      end
      object IsPrivateRadioButton: TRadioButton
        Tag = 2
        Left = 8
        Top = 61
        Width = 121
        Height = 17
        Caption = #1044#1083#1103' '#1092#1110#1079#1080#1095#1085#1080#1093' '#1086#1089#1110#1073
        TabOrder = 2
        OnClick = RadioButtonClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1055#1086' '#1076#1086#1074#1110#1088#1077#1085#1086#1089#1090#1110
      ImageIndex = 2
      object ErrandLabel: TLabel
        Tag = 3
        Left = 8
        Top = 9
        Width = 57
        Height = 13
        Caption = 'ErrandLabel'
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnClick = EntrpFileNameLabelClick
        OnMouseEnter = EntrpFileNameLabelMouseEnter
        OnMouseLeave = IndvdFileNameLabelMouseLeave
      end
    end
    object TourVendorTabSheet: TTabSheet
      Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1080
      ImageIndex = 3
      OnShow = TourVendorTabSheetShow
      object TourVendorGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 843
        Height = 131
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object TourVendorGridLevel: TcxGridLevel
          GridView = DMServ.ViewVendorTour
        end
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 851
    Height = 29
    ButtonHeight = 25
    ButtonWidth = 113
    Caption = 'ToolBar1'
    TabOrder = 1
    object SelectShablonBtn: TBitBtn
      Left = 0
      Top = 2
      Width = 115
      Height = 25
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1096#1072#1073#1083#1086#1085
      TabOrder = 0
      OnClick = SelectShablonBtnClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
        00000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000
        FF00FF000000000000000000000000000000000000FFFFFFFFFFFF0000000000
        00000000FFFFFF000000FFFF00000000000000FFFFFF00FFFFFFFFFF00FFFFFF
        FFFF00FFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00000000
        FFFFFF00FFFFFFFFFF00FFFF000000000000000000000000000000FFFFFFFFFF
        FF000000FFFFFF000000FFFF0000000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
        FFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFFFFFFFF000000FFFF00000000
        FFFFFF00FFFFFFFFFF00FFFF000000000000000000000000000000FFFFFFFFFF
        FF000000FFFFFF000000FFFF0000000000FFFFFFFFFF00FFFFFFFFFF00FFFFFF
        FFFF00FFFFFFFFFF00FFFF000000FFFFFFFFFFFFFFFFFF000000FFFF00000000
        FFFFFF00FFFF000000000000000000000000000000000000000000FFFFFFFFFF
        FF000000FFFFFF000000000000000000000000FFFFFF00FFFF000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
        FF00FF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFF00
        0000000000000000FFFFFFFFFFFF000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00FFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FF000000FF0000FF
        0000FF0000FF0000FF0000FF0000000000FFFFFF000000FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000
        0000000000000000000000000000000000FF00FFFF00FFFF00FF}
    end
    object CheckBookmarkBitBtn: TBitBtn
      Left = 115
      Top = 2
      Width = 142
      Height = 25
      Caption = #1055#1077#1088#1077#1074#1110#1088#1080#1090#1080' '#1079#1072#1082#1083#1072#1076#1082#1080
      TabOrder = 1
      OnClick = CheckBookmarkBitBtnClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF000000000000000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000000000000000FF
        FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        000000000000000000FFFFFF000000000000FFFFFFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF000000000000000000FFFFFFFF00FFFF00FF00
        0000000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        000000FFFFFFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
        00FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FFFFFFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 630
    Width = 851
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      851
      33)
    object OkBtn: TBitBtn
      Left = 671
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 761
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object CliboardPopupMenu: TPopupMenu
    Left = 627
    Top = 243
    object N1: TMenuItem
      Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080' '#1079#1072#1082#1083#1072#1076#1082#1091' '#1074' '#1073#1091#1092#1077#1088
      ImageIndex = 16
      OnClick = N1Click
    end
  end
  object PopupMenu: TPopupMenu
    Left = 418
    Top = 97
    object N2: TMenuItem
      Action = CopyAction
    end
    object N3: TMenuItem
      Action = PasteAction
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 351
    Top = 96
    object CopyAction: TAction
      Caption = #1050#1086#1087#1110#1102#1074#1072#1090#1080' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1083#1110#1074
      OnExecute = CopyActionExecute
    end
    object PasteAction: TAction
      Caption = #1042#1089#1090#1072#1074#1080#1090#1080' '#1089#1087#1080#1089#1086#1082' '#1087#1086#1083#1110#1074
      OnExecute = PasteActionExecute
    end
  end
  object WordDocum: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 640
    Top = 79
  end
  object WordApplic: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 704
    Top = 79
  end
end