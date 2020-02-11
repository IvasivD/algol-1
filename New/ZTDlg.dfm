object ZTourDialog: TZTourDialog
  Left = 1105
  Top = 49
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'ZTourDialog'
  ClientHeight = 346
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object WorkPanel: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 313
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 313
    Width = 535
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      535
      33)
    object OkBtn: TBitBtn
      Left = 355
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 1
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 445
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 2
      Kind = bkCancel
    end
    object ApplyAllBtn: TBitBtn
      Left = 8
      Top = 5
      Width = 82
      Height = 25
      Caption = #1044#1083#1103' '#1074#1089#1110#1093
      Enabled = False
      ModalResult = 8
      TabOrder = 0
      OnClick = ApplyAllBtnClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
  end
  object DataSrc: TDataSource
    Left = 8
    Top = 8
  end
  object MemoPopupMenu: TPopupMenu
    Left = 344
    Top = 8
    object EditCutPopupItem: TMenuItem
      Action = EditCutAction
    end
    object EditCopyPopupItem: TMenuItem
      Action = EditCopyAction
    end
    object EditPastePopupItem: TMenuItem
      Action = EditPasteAction
    end
    object MemoPopupSplitter: TMenuItem
      Caption = '-'
    end
    object FontSelectPopupItem: TMenuItem
      Action = SelectFontAction
    end
    object FontBoldPopupItem: TMenuItem
      Action = BoldFontAction
    end
    object FontItalicPopupItem: TMenuItem
      Action = ItalicFontAction
    end
    object FontUnderlinePopupItem: TMenuItem
      Action = UnderlinedFontAction
      ShortCut = 16469
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 376
    Top = 8
    object BoldFontAction: TAction
      Category = 'Font'
      Caption = '&'#1046#1080#1088#1085#1080#1081
      Hint = #1046#1080#1088#1085#1080#1081' '#1096#1088#1080#1092#1090
      ImageIndex = 22
      ShortCut = 16450
      OnExecute = BoldFontActionExecute
    end
    object ItalicFontAction: TAction
      Category = 'Font'
      Caption = '&'#1050#1091#1088#1089#1080#1074
      Hint = #1050#1091#1088#1089#1080#1074
      ImageIndex = 23
      ShortCut = 16457
      OnExecute = ItalicFontActionExecute
    end
    object UnderlinedFontAction: TAction
      Category = 'Font'
      Caption = #1055#1110#1076'&'#1095#1077#1088#1082#1091#1074#1072#1085#1085#1103
      ImageIndex = 24
      OnExecute = UnderlinedFontActionExecute
    end
    object SelectFontAction: TAction
      Category = 'Font'
      Caption = '&'#1064#1088#1080#1092#1090'...'
      Hint = #1042#1080#1073#1110#1088' '#1096#1088#1080#1092#1090#1072
      ShortCut = 16452
      OnExecute = SelectFontActionExecute
    end
    object EditCopyAction: TEditCopy
      Category = 'Edit'
      Caption = '&'#1050#1086#1087#1110#1102#1074#1072#1090#1080
      Hint = #1050#1086#1087#1110#1102#1074#1072#1090#1080' '#1074' '#1073#1091#1092#1077#1088
      ImageIndex = 8
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
    end
    object EditCutAction: TEditCut
      Category = 'Edit'
      Caption = #1042#1080'&'#1088#1110#1079#1072#1090#1080
      Hint = #1042#1080#1088#1110#1079#1072#1090#1080' '#1074' '#1073#1091#1092#1077#1088
      ImageIndex = 7
      ShortCut = 16472
      OnExecute = EditCutActionExecute
    end
    object EditPasteAction: TEditPaste
      Category = 'Edit'
      Caption = #1042#1089#1090'&'#1072#1074#1080#1090#1080
      Hint = #1042#1089#1090#1072#1074#1080#1090#1080' '#1079' '#1073#1091#1092#1077#1088#1072
      ImageIndex = 9
      ShortCut = 16470
      OnExecute = EditPasteActionExecute
    end
    object EditUndoAction: TAction
      Category = 'Edit'
      Caption = #1053#1072#1079#1072#1076
      Hint = #1042#1110#1076#1084#1110#1085#1080#1090#1080' '#1086#1089#1090#1072#1085#1085#1102' '#1086#1087#1077#1088#1072#1094#1110#1102' '#1079' '#1090#1077#1082#1089#1090#1086#1084
      ImageIndex = 10
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
  end
  object ApplyAllQry: TQuery
    DatabaseName = 'Tour'
    Left = 8
    Top = 304
  end
end
