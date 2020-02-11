object ZDataBrowseForm: TZDataBrowseForm
  Left = 679
  Top = 304
  Width = 453
  Height = 495
  Caption = 'ZDataBrowseForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 376
    Width = 445
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    MinSize = 54
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 445
    Height = 24
    AutoSize = True
    Caption = 'ToolBar'
    EdgeBorders = [ebBottom]
    Flat = True
    Images = DM.BrImageList
    TabOrder = 0
    object DataSetFirstBtn: TToolButton
      Left = 0
      Top = 0
      Action = DataSetFirstAction
    end
    object DataSetPriorBtn: TToolButton
      Left = 23
      Top = 0
      Action = DataSetPriorAction
    end
    object DataSetNextBtn: TToolButton
      Left = 46
      Top = 0
      Action = DataSetNextAction
    end
    object DataSetLastBtn: TToolButton
      Left = 69
      Top = 0
      Action = DataSetLastAction
    end
    object DataSetRefreshBtn: TToolButton
      Left = 92
      Top = 0
      Action = DataSetRefreshAction
    end
    object ToolButton6: TToolButton
      Left = 115
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object RecordAddBtn: TToolButton
      Left = 123
      Top = 0
      Action = RecordAddAction
    end
    object RecordEditBtn: TToolButton
      Left = 146
      Top = 0
      Action = RecordEditAction
    end
    object RecordFindBtn: TToolButton
      Left = 169
      Top = 0
      Action = RecordFindAction
    end
    object ToolButton10: TToolButton
      Left = 192
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object RecordDeleteBtn: TToolButton
      Left = 200
      Top = 0
      Action = RecordDeleteAction
    end
    object ToolButton12: TToolButton
      Left = 223
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ViewMemoBtn: TToolButton
      Left = 231
      Top = 0
      Action = ViewMemoAction
    end
  end
  object DBGrid: TDBGrid
    Left = 0
    Top = 24
    Width = 445
    Height = 352
    Align = alClient
    Color = clInfoBk
    Constraints.MinHeight = 58
    DataSource = DataSource
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridDblClick
  end
  object DBMemo: TDBMemo
    Left = 0
    Top = 379
    Width = 445
    Height = 89
    Align = alBottom
    Color = clBtnFace
    Constraints.MinHeight = 54
    DataSource = DataSource
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    Visible = False
  end
  object ActionList: TActionList
    Images = DM.BrImageList
    OnUpdate = ActionListUpdate
    Left = 40
    Top = 16
    object DataSetFirstAction: TDataSetFirst
      Category = 'Dataset'
      Caption = '&Перший рядок'
      Hint = 'Перший рядок'
      ImageIndex = 0
      DataSource = DataSource
    end
    object DataSetPriorAction: TDataSetPrior
      Category = 'Dataset'
      Caption = 'Поп&ередній рядок'
      Hint = 'Попередній рядок'
      ImageIndex = 1
      DataSource = DataSource
    end
    object DataSetNextAction: TDataSetNext
      Category = 'Dataset'
      Caption = '&Наступний рядок'
      Hint = 'Наступний рядок'
      ImageIndex = 2
      DataSource = DataSource
    end
    object DataSetLastAction: TDataSetLast
      Category = 'Dataset'
      Caption = '&Останній рядок'
      Hint = 'Останній рядок'
      ImageIndex = 3
      DataSource = DataSource
    end
    object DataSetRefreshAction: TAction
      Category = 'Dataset'
      Caption = 'По&новити'
      Hint = 'Поновити'
      ImageIndex = 4
      OnExecute = DataSetRefreshActionExecute
    end
    object RecordFindAction: TAction
      Category = 'Record'
      Caption = 'По&шук'
      Hint = 'Пошук|Знайти'
      ImageIndex = 7
      OnExecute = RecordFindActionExecute
    end
    object RecordAddAction: TAction
      Tag = 1
      Category = 'Record'
      Caption = '&Додати'
      Hint = 'Додати'
      ImageIndex = 5
      OnExecute = RecordEditActionExecute
    end
    object RecordEditAction: TAction
      Category = 'Record'
      Caption = 'З&мінити'
      Hint = 'Змінити'
      ImageIndex = 6
      OnExecute = RecordEditActionExecute
    end
    object RecordDeleteAction: TAction
      Category = 'Record'
      Caption = 'Видалити'
      Hint = 'Видалити'
      ImageIndex = 8
      OnExecute = RecordDeleteActionExecute
    end
    object ViewMemoAction: TAction
      Category = 'View'
      Caption = 'Примітка'
      Hint = 'Примітка|Показати / сховати примітку'
      ImageIndex = 10
      OnExecute = ViewMemoActionExecute
    end
  end
  object DataSource: TDataSource
    Left = 8
    Top = 16
  end
end
