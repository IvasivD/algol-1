object ZSelectDlg: TZSelectDlg
  Left = 357
  Top = 109
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'ZSelectDlg'
  ClientHeight = 289
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 255
    Width = 390
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      390
      34)
    object OkBtn: TBitBtn
      Left = 210
      Top = 4
      Width = 82
      Height = 25
      Hint = '|'#1042#1080#1073#1088#1072#1090#1080
      Anchors = [akTop, akRight]
      Caption = #1054#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 300
      Top = 4
      Width = 82
      Height = 25
      Hint = '|'#1042#1110#1076#1084#1086#1074#1080#1090#1080#1089#1103' '#1074#1110#1076' '#1074#1080#1073#1086#1088#1091
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DatePanel: TPanel
    Left = 0
    Top = 200
    Width = 390
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object FromDateLabel: TLabel
      Left = 8
      Top = 8
      Width = 33
      Height = 13
      Caption = #1047' '#1076#1072#1090#1080
    end
    object Label2: TLabel
      Left = 224
      Top = 8
      Width = 23
      Height = 13
      Caption = #1044#1085#1110#1074
    end
    object TillDateLabel: TLabel
      Left = 8
      Top = 32
      Width = 39
      Height = 13
      AutoSize = False
      Caption = #1055#1086
    end
    object TillDateValueLabel: TLabel
      Left = 48
      Top = 32
      Width = 89
      Height = 13
      Caption = 'TillDateValueLabel'
    end
    object FromDatePicker: TDateTimePicker
      Left = 48
      Top = 4
      Width = 89
      Height = 21
      Date = 36892.520849108800000000
      Time = 36892.520849108800000000
      Color = clInfoBk
      TabOrder = 0
      OnClick = DaysEditClick
      OnCloseUp = DaysEditClick
      OnChange = DaysEditClick
    end
    object DaysEdit: TSpinEdit
      Left = 256
      Top = 3
      Width = 49
      Height = 22
      Color = clInfoBk
      MaxValue = 999
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnChange = DaysEditClick
      OnClick = DaysEditClick
    end
    object FromTimePicker: TDateTimePicker
      Left = 136
      Top = 4
      Width = 73
      Height = 21
      Date = 37515.000000000000000000
      Time = 37515.000000000000000000
      Color = clInfoBk
      Kind = dtkTime
      TabOrder = 2
      Visible = False
    end
  end
  object SelDBGrid: TSvtDBGrid
    Left = 0
    Top = 0
    Width = 390
    Height = 200
    Align = alClient
    Color = clInfoBk
    DataSource = SelSrc
    FixedColsNum = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    SortedColIndex = 0
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = SelDBGridDrawColumnCell
    OnKeyPress = SelDBGridKeyPress
  end
  object SelQry: TIBQuery
    Top = 240
  end
  object SelSrc: TDataSource
    DataSet = SelQry
    Left = 15
    Top = 264
  end
end
