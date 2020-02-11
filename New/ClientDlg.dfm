object ClientChooseDlg: TClientChooseDlg
  Left = 661
  Top = 152
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1042#1080#1073#1110#1088' '#1079#1072#1084#1086#1074#1085#1080#1082#1072
  ClientHeight = 268
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PromptLabel: TLabel
    Left = 130
    Top = 38
    Width = 254
    Height = 26
    AutoSize = False
    Caption = 'PromptLabel'
    WordWrap = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 234
    Width = 396
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      396
      34)
    object OkBtn: TBitBtn
      Left = 231
      Top = 4
      Width = 74
      Height = 25
      Hint = #1057#1090#1074#1086#1088#1080#1090#1080' '#1084#1072#1088#1096#1088#1091#1090
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      ModalResult = 1
      TabOrder = 0
      OnClick = OkBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object CancelBtn: TBitBtn
      Left = 312
      Top = 4
      Width = 75
      Height = 25
      Hint = #1042#1110#1076#1084#1086#1074#1080#1090#1080#1089#1103' '#1074#1110#1076' '#1089#1090#1074#1086#1088#1077#1085#1085#1103' '#1084#1072#1088#1096#1088#1091#1090#1091
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      OnClick = CancelBtnClick
      Kind = bkCancel
    end
  end
  object ClientRadioGroup: TRadioGroup
    Left = 0
    Top = 5
    Width = 117
    Height = 58
    Caption = #1047#1072#1084#1086#1074#1085#1080#1082
    ItemIndex = 1
    Items.Strings = (
      '&'#1055#1088#1080#1074#1072#1090#1085#1072' '#1086#1089#1086#1073#1072
      '&'#1070#1088#1080#1076#1080#1095#1085#1072' '#1086#1089#1086#1073#1072)
    TabOrder = 1
    OnClick = ClientRadioGroupClick
  end
  object IsVendorCheckBox: TCheckBox
    Left = 128
    Top = 8
    Width = 169
    Height = 17
    Caption = #1058#1110#1083#1100#1082#1080' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1080' '#1087#1086#1089#1083#1091#1075
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = ClientRadioGroupClick
  end
  object GridSelVendor: TcxGrid
    Left = 0
    Top = 96
    Width = 396
    Height = 138
    Align = alBottom
    TabOrder = 3
    object GridSelVendorDBTableView1: TcxGridDBTableView
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
    object GridSelVendorLevel1: TcxGridLevel
    end
  end
  object SearchEdit: TcxTextEdit
    Left = 0
    Top = 72
    Properties.OnChange = SearchEditPropertiesChange
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
    OnExit = SearchEditExit
    OnKeyPress = SearchEditKeyPress
    Width = 395
  end
end
