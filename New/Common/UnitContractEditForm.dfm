object FrmContractEdit: TFrmContractEdit
  Left = 681
  Top = 109
  Width = 473
  Height = 678
  Caption = '?????'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object CtrlPanel: TPanel
    Left = 0
    Top = 607
    Width = 457
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      457
      33)
    object CancelBtn: TBitBtn
      Left = 367
      Top = 5
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '???????'
      TabOrder = 0
      OnClick = CancelBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object OkBtn: TBitBtn
      Left = 277
      Top = 5
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '??'
      TabOrder = 1
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
    object ReviewCntrBtn: TButton
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = '???????? '
      TabOrder = 2
      OnClick = ReviewCntrBtnClick
    end
  end
  object WorkPanel: TPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 607
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      457
      607)
    object MemoLabel: TLabel
      Left = 10
      Top = 476
      Width = 40
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = '????????'
    end
    object ContractTypeLabel: TLabel
      Left = 8
      Top = 53
      Width = 43
      Height = 13
      Caption = '??? ?????'
    end
    object SignDateLabel: TLabel
      Left = 8
      Top = 103
      Width = 50
      Height = 26
      Caption = '???? ??????????'
      WordWrap = True
    end
    object AttachFileBtn: TSpeedButton
      Left = 336
      Top = 78
      Width = 112
      Height = 22
      Hint = '????????? ????|????????? ???????? ? ??????? ?????'
      Anchors = [akTop, akRight]
      Caption = '????????? ????'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFF000FFF
        FFFFFFFFF0FFF0FFFFFFFFFF0F808F7FFFFFFFFF0F0F0F0FFFFFFFFF0F0F0F0F
        FFFFFFFF0F0F0F0FFFFFFFFF0F0F0F0FFFFFFFFF0F0F0F0FFFFFFFFF0F0F0F0F
        FFFFFFFF0F0F0F0FFFFFFFFF0F0F0F0FFFFFFFFF0F0F0F0FFFFFFFFF0F0F0F0F
        FFFFFFFF0F0F0F0FFFFFFFFFFF0FFF7FFFFFFFFFFF80008FFFFF}
      Visible = False
      OnClick = AttachFileBtnClick
    end
    object ActionLabel: TLabel
      Left = 8
      Top = 83
      Width = 56
      Height = 13
      Caption = '??? ? ??????'
    end
    object Label1: TLabel
      Left = 8
      Top = 132
      Width = 46
      Height = 26
      Caption = '????? ??? ? ????'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 199
      Top = 111
      Width = 33
      Height = 13
      Caption = '? ?????'
    end
    object SignGroupBox: TGroupBox
      Left = 8
      Top = 165
      Width = 442
      Height = 74
      Anchors = [akLeft, akTop, akRight]
      Caption = '???????'
      TabOrder = 3
      object OurPersonLabel: TLabel
        Left = 8
        Top = 20
        Width = 33
        Height = 13
        Caption = '??? ???'
      end
      object ItsPersonLabel: TLabel
        Left = 8
        Top = 46
        Width = 58
        Height = 13
        Caption = '??? ????????'
      end
      object OurPersonComboBox: TcxExtLookupComboBox
        Left = 80
        Top = 16
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
        Width = 352
      end
      object ItsPersonComboBox: TcxExtLookupComboBox
        Left = 80
        Top = 43
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
        Width = 352
      end
    end
    object SignDateEdit: TcxDateEdit
      Left = 79
      Top = 106
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 106
    end
    object FromDateEdit: TcxDateEdit
      Left = 79
      Top = 136
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 106
    end
    object TillDateEdit: TcxDateEdit
      Left = 264
      Top = 136
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 106
    end
    object EditRadioButton: TcxRadioButton
      Left = 8
      Top = 16
      Width = 113
      Height = 17
      Caption = '????? ?? ???????'
      Checked = True
      TabOrder = 4
      TabStop = True
      OnClick = EditRadioButtonClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
    object SaveRadioButton: TcxRadioButton
      Left = 144
      Top = 16
      Width = 113
      Height = 17
      Caption = '??????? ?????'
      TabOrder = 5
      Visible = False
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
    object ContractTypeComboBox: TcxExtLookupComboBox
      Left = 79
      Top = 50
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
      Width = 371
    end
    object NumContractEdit: TcxTextEdit
      Left = 248
      Top = 106
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
      Width = 121
    end
    object GridLogContract: TcxGrid
      Left = 8
      Top = 248
      Width = 443
      Height = 223
      TabOrder = 8
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      object GridLogContractDBTableView1: TcxGridDBTableView
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
      object GridLogContractLevel1: TcxGridLevel
        GridView = ViewContractLog
      end
    end
    object Memo: TcxMemo
      Left = 8
      Top = 492
      Lines.Strings = (
        '')
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 9
      Height = 108
      Width = 441
    end
    object ActionComboBox: TcxImageComboBox
      Left = 79
      Top = 79
      Properties.Items = <>
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 10
      Width = 255
    end
    object TillDateCheckBox: TcxCheckBox
      Left = 196
      Top = 135
      Caption = '?? ????'
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 11
      Width = 65
    end
  end
  object WordApplic: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 144
    Top = 375
  end
  object WordDocum: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 144
    Top = 423
  end
  object GridViewRepository: TcxGridViewRepository
    Left = 328
    Top = 288
    object ViewContractLog: TcxGridDBTableView
      DataController.KeyFieldNames = 'CONTRACTLOGID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsView.NoDataToDisplayInfoText = ' '
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewContractLogCONTRACTLOGID: TcxGridDBColumn
        DataBinding.FieldName = 'CONTRACTLOGID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewContractLogLOGDATETIME: TcxGridDBColumn
        Caption = '???? ?? ???'
        DataBinding.FieldName = 'LOGDATETIME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 110
      end
      object ViewContractLogMANAGER: TcxGridDBColumn
        Caption = '????????'
        DataBinding.FieldName = 'MANAGER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 140
      end
      object ViewContractLogSUBCATEGORY: TcxGridDBColumn
        DataBinding.FieldName = 'SUBCATEGORY'
        Options.Filtering = False
        Width = 20
        IsCaptionAssigned = True
      end
      object ViewContractLogSUBCATEGNAME: TcxGridDBColumn
        Caption = '???'
        DataBinding.FieldName = 'SUBCATEGNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 210
      end
      object ViewContractLogLOGPROMPT: TcxGridDBColumn
        DataBinding.FieldName = 'LOGPROMPT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 210
      end
      object ViewContractLogCalcLog: TcxGridDBColumn
        DataBinding.FieldName = 'CalcLog'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewContractLogLOGCATEGORY: TcxGridDBColumn
        DataBinding.FieldName = 'LOGCATEGORY'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewContractLogFILENAME: TcxGridDBColumn
        DataBinding.FieldName = 'FILENAME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
    end
  end
end
