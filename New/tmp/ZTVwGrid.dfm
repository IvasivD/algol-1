inherited ZViewGridForm: TZViewGridForm
  Left = 363
  Top = 266
  Caption = 'ZViewGridForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    object ShowMemoBtn: TSpeedButton
      Left = 484
      Top = 6
      Width = 113
      Height = 22
      Hint = 'Текст примітки|Показати повний текст примітки'
      Anchors = [akTop, akRight]
      Caption = 'Текст примітки'
      Enabled = False
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000070000000000777777000000070FFFFFFFF0777777000000070FF
        FFFFFF0777777000000070F000000F0777777000000070F0FBFB000777777000
        000070F0BFBF0F0007777000000070F000000F0770077000000070FF0FF44444
        44444000000070FF0FF4FBFBFBFB4000000070FFF0F4BFBFBFBF4000000070FF
        F0F4FBFBFBFB4000000070000004BFBFBFBF4000000077777704444444444000
        000077777774F444444440000000777777744444444440000000777777777777
        777770000000}
      OnClick = ShowMemoBtnClick
    end
  end
  inherited BottomPanel: TPanel
    object ActiveRecordLabel: TLabel [0]
      Left = 160
      Top = 10
      Width = 91
      Height = 13
      Caption = 'ActiveRecordLabel'
    end
    object RecordCountLabel: TLabel [1]
      Left = 8
      Top = 10
      Width = 89
      Height = 13
      Caption = 'RecordCountLabel'
    end
  end
  object PersonListDBGrid: TDBGrid [2]
    Left = 0
    Top = 33
    Width = 688
    Height = 351
    Align = alClient
    Color = clInfoBk
    DataSource = DetailListQuerySrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = PersonListDBGridDrawColumnCell
    OnDblClick = PersonListDBGridDblClick
    OnKeyPress = PersonListDBGridKeyPress
    OnTitleClick = PersonListDBGridTitleClick
  end
  object SumPanel: TPanel [3]
    Left = 0
    Top = 384
    Width = 688
    Height = 33
    Align = alBottom
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object SumLabel1: TLabel
      Left = 8
      Top = 10
      Width = 31
      Height = 13
      Caption = 'Сума'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SumLabel2: TLabel
      Left = 48
      Top = 10
      Width = 53
      Height = 13
      Caption = 'по колонці'
    end
    object SumCalcBtn: TSpeedButton
      Left = 288
      Top = 5
      Width = 41
      Height = 22
      Action = SumCalcAction
      Caption = '='
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object SumColumnComboBox: TComboBox
      Left = 112
      Top = 6
      Width = 169
      Height = 21
      Style = csDropDownList
      Color = clInfoBk
      ItemHeight = 13
      TabOrder = 0
    end
    object SumResultEdit: TEdit
      Left = 336
      Top = 6
      Width = 97
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited DetailListQuerySrc: TDataSource
    OnStateChange = DetailListQuerySrcStateChange
    Top = 27
  end
  inherited DetailListQuery: TQuery
    AfterOpen = DetailListQueryAfterOpen
    Top = 27
  end
  inherited PopupMenu: TPopupMenu
    Top = 27
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Top = 27
    inherited PrintAction: TAction
      OnExecute = PrintActionExecute
    end
    object SumCalcAction: TAction
      Caption = 'Порахувати суму'
      Hint = 'Порахувати суму|Порахувати суму по вказаній колонці'
      ImageIndex = 3
      ShortCut = 16571
      OnExecute = SumCalcActionExecute
    end
  end
end
