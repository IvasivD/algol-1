object FrmBrwsDic: TFrmBrwsDic
  Left = 636
  Top = 230
  Width = 1038
  Height = 675
  Caption = 'FrmBrwsDic'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCanResize = FormCanResize
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object CoolBar: TCoolBar
    Left = 0
    Top = 0
    Width = 1022
    Height = 31
    Anchors = []
    AutoSize = True
    Bands = <
      item
        Break = False
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 1018
      end>
    FixedSize = True
    object ToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 1005
      Height = 27
      Align = alClient
      Anchors = [akLeft, akTop, akBottom]
      AutoSize = True
      ButtonHeight = 25
      ButtonWidth = 25
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = DMServ.BrowseImgList
      TabOrder = 0
      Transparent = True
      object DataSetRefreshBtn: TToolButton
        Left = 0
        Top = 0
        Action = ActDBRefresh
      end
      object DataSetFirstBtn: TToolButton
        Left = 25
        Top = 0
        Action = ActViewFirst
      end
      object DataSetPriorBtn: TToolButton
        Left = 50
        Top = 0
        Action = ActViewPrev
      end
      object DataSetNextBtn: TToolButton
        Left = 75
        Top = 0
        Action = ActViewNext
      end
      object DataSetLastBtn: TToolButton
        Left = 100
        Top = 0
        Action = ActViewLast
      end
      object SeparatorTBtn0: TToolButton
        Left = 125
        Top = 0
        Width = 8
        Caption = 'SeparatorTBtn0'
        ImageIndex = 76
        Style = tbsSeparator
      end
      object AppendTbtn: TToolButton
        Tag = 1
        Left = 133
        Top = 0
        Action = ActInsertDB
      end
      object EditTbtn: TToolButton
        Tag = 2
        Left = 158
        Top = 0
        Action = ActDBEdit
      end
      object CopyTBtn: TToolButton
        Left = 183
        Top = 0
        Action = ActCopyRow
      end
      object SeparatorTBtn2: TToolButton
        Left = 208
        Top = 0
        Width = 8
        Caption = 'SeparatorTBtn2'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object DeleteTbtn: TToolButton
        Left = 216
        Top = 0
        Action = ActViewDelete
      end
      object SeparatorTBtn4: TToolButton
        Left = 241
        Top = 0
        Width = 8
        Caption = 'SeparatorTBtn4'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ViewMemosTBtn: TToolButton
        Left = 249
        Top = 0
        Action = ViewMemo
        AllowAllUp = True
      end
      object SeparatorTBtn3: TToolButton
        Left = 274
        Top = 0
        Width = 8
        Caption = 'SeparatorTBtn3'
        ImageIndex = 10
        Style = tbsSeparator
      end
      object ListingExport2ExcelBtn: TToolButton
        Left = 282
        Top = 0
        Action = ViewExportExcel
      end
      object LangPanel: TPanel
        Left = 307
        Top = 0
        Width = 250
        Height = 25
        Align = alCustom
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object LangComboBox: TcxLookupComboBox
          Left = 82
          Top = 2
          Properties.DropDownListStyle = lsFixedList
          Properties.ListColumns = <>
          Properties.ListOptions.ShowHeader = False
          Properties.OnEditValueChanged = LangComboBoxPropertiesEditValueChanged
          Style.Color = 14811135
          Style.LookAndFeel.Kind = lfStandard
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 167
        end
        object LangCheckBox: TcxCheckBox
          Left = 6
          Top = 2
          Caption = #1055#1077#1088#1077#1082#1083#1072#1076
          Properties.OnEditValueChanged = LangCheckBoxPropertiesEditValueChanged
          Style.BorderStyle = ebs3D
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Transparent = True
          Width = 74
        end
      end
    end
  end
  object DetailPanel: TPanel
    Left = 839
    Top = 31
    Width = 183
    Height = 572
    Align = alRight
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
  end
  object ModalPanel: TPanel
    Left = 0
    Top = 603
    Width = 1022
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    DesignSize = (
      1022
      34)
    object OkBtn: TBitBtn
      Left = 850
      Top = 5
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      OnClick = OkBtnClick
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 940
      Top = 5
      Width = 81
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = CancelBtnClick
      Kind = bkCancel
    end
  end
  object MasterPanel: TPanel
    Left = 0
    Top = 31
    Width = 839
    Height = 572
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object SplitterMemPanel: TSplitter
      Left = 0
      Top = 448
      Width = 839
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
    end
    object PanelViewMemText: TPanel
      Left = 0
      Top = 451
      Width = 839
      Height = 121
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object PanelViewMemTextOriginal: TPanel
        Left = 0
        Top = 0
        Width = 440
        Height = 121
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object MasterDBRichEdit: TcxDBRichEdit
          Left = 0
          Top = 0
          Align = alClient
          Enabled = False
          Style.Color = 14811135
          Style.LookAndFeel.Kind = lfStandard
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Height = 121
          Width = 440
        end
      end
      object PanelViewMemTextTransl: TPanel
        Left = 440
        Top = 0
        Width = 399
        Height = 121
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object MasterDBRichEditTransl: TcxDBRichEdit
          Left = 0
          Top = 0
          Align = alClient
          Enabled = False
          Style.Color = 14811135
          Style.LookAndFeel.Kind = lfStandard
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfStandard
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfStandard
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfStandard
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Height = 121
          Width = 399
        end
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 839
      Height = 448
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object GridElem: TcxGrid
        Left = 0
        Top = 0
        Width = 839
        Height = 448
        Align = alClient
        PopupMenu = PopupMenu
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object GridElemDBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object GridElemLevel1: TcxGridLevel
        end
      end
    end
  end
  object ActionListTopBut: TActionList
    Images = DMServ.BrowseImgList
    Left = 392
    Top = 79
    object ActDBRefresh: TAction
      ImageIndex = 124
      OnExecute = ActDBRefreshExecute
    end
    object ActViewFirst: TAction
      Caption = #1055#1077#1088#1096#1080#1081
      ImageIndex = 10
      OnExecute = ActViewFirstExecute
    end
    object ActViewPrev: TAction
      Caption = 'ActViewPrev'
      ImageIndex = 11
      OnExecute = ActViewPrevExecute
    end
    object ActViewNext: TAction
      Caption = 'ActViewNext'
      ImageIndex = 12
      OnExecute = ActViewNextExecute
    end
    object ActViewLast: TAction
      Caption = #1054#1089#1090#1072#1090#1085#1110#1081
      ImageIndex = 13
      OnExecute = ActViewLastExecute
    end
    object ActInsertDB: TAction
      Caption = #1053#1086#1074#1080#1081
      ImageIndex = 0
      OnExecute = ActInsertDBExecute
    end
    object ActDBEdit: TAction
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
      ImageIndex = 1
      OnExecute = ActDBEditExecute
    end
    object ActCopyRow: TAction
      Caption = 'ActCopyRow'
      ImageIndex = 21
      OnExecute = ActCopyRowExecute
    end
    object ActViewDelete: TAction
      Caption = 'ActViewDelete'
      ImageIndex = 3
      OnExecute = ActViewDeleteExecute
    end
    object ViewMemo: TAction
      Caption = 'ViewMemo'
      ImageIndex = 8
      OnExecute = ViewMemoExecute
    end
    object ViewExportExcel: TAction
      Caption = 'ViewExportExcel'
      ImageIndex = 73
      OnExecute = ViewExportExcelExecute
    end
    object ActSelectAll: TAction
      Caption = #1042#1080#1076#1110#1083#1080#1090#1080' '#1074#1089#1077
    end
  end
  object PopupMenu: TPopupMenu
    Images = DMServ.BrowseImgList
    OnPopup = PopupMenuPopup
    Left = 582
    Top = 146
    object PUpMenuFirst: TMenuItem
      Action = ActViewFirst
    end
    object PUpMenuLast: TMenuItem
      Action = ActViewLast
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PUpMenuNew: TMenuItem
      Action = ActInsertDB
    end
    object PUpMenuEdit: TMenuItem
      Action = ActDBEdit
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object PUpMenuSelectAll: TMenuItem
      Action = ActSelectAll
    end
  end
end
