object ZReportListForm: TZReportListForm
  Left = 265
  Top = 183
  Width = 696
  Height = 479
  BorderIcons = [biSystemMenu]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object ReportListDBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 419
    Align = alClient
    Color = clInfoBk
    DataSource = RepListQuerySrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = ReportListDBGridCellClick
    OnDblClick = ReportListDBGridDblClick
    OnKeyUp = ReportListDBGridKeyUp
  end
  object Panel7: TPanel
    Left = 0
    Top = 419
    Width = 688
    Height = 33
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 8
    TabOrder = 1
    object PrintBtn: TSpeedButton
      Left = 184
      Top = 6
      Width = 89
      Height = 22
      Hint = '����|���� ������� �� �������'
      Caption = '����'
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00E3E3E3E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E30000000000000000000000E3E3E3E300DBDBDBDB
        DBDBDBDBDB00DB00E3E300000000000000000000000000DB00E300DBDBDBDBDB
        DBFCFCFCDBDB000000E300DBDBDBDBDBDB929292DBDB00DB00E3000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00E30000000000
        0000000000DB00DB0000E3E300FFFFFFFFFFFFFFFF00DB00DB00E3E3E300FF00
        00000000FF00000000E3E3E3E300FFFFFFFFFFFFFFFF00E3E3E3E3E3E3E300FF
        0000000000FF00E3E3E3E3E3E3E300FFFFFFFFFFFFFFFF00E3E3E3E3E3E3E300
        0000000000000000E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3}
      Margin = 8
    end
    object CloseBtn: TBitBtn
      Left = 597
      Top = 5
      Width = 81
      Height = 24
      Hint = '|������� �� ����'
      Anchors = [akTop, akRight]
      Caption = '�������'
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333333333333FFF3333333333333
        00333333333333FF77F3333333333300903333333333FF773733333333330099
        0333333333FF77337F3333333300999903333333FF7733337333333700999990
        3333333777333337F3333333099999903333333373F333373333333330999903
        33333333F7F3337F33333333709999033333333F773FF3733333333709009033
        333333F7737737F3333333709073003333333F77377377F33333370907333733
        33333773773337333333309073333333333337F7733333333333370733333333
        3333377733333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object RepListQuerySrc: TDataSource
    DataSet = RepListQuery
    Left = 16
    Top = 419
  end
  object RepListQuery: TQuery
    DatabaseName = 'Tour'
    Left = 48
    Top = 419
  end
  object PopupMenu: TPopupMenu
    Left = 40
    Top = 104
    object PrintItem: TMenuItem
      Caption = '����'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CloseItem: TMenuItem
      Action = CloseAction
    end
  end
  object ActionList: TActionList
    Images = DM.NavigateImgList
    Left = 8
    Top = 104
    object PrintAction: TAction
      Caption = '����'
      Enabled = False
      Hint = '����|���� ������� �� �������'
      ImageIndex = 16
      ShortCut = 16464
      OnExecute = PrintActionExecute
    end
    object CloseAction: TAction
      Caption = '�������'
      Hint = '�������|������� �� ����'
      ImageIndex = 8
      ShortCut = 27
      OnExecute = CloseActionExecute
    end
  end
end
