inherited LogDataViewForm: TLogDataViewForm
  Left = 227
  Top = 406
  Caption = #1046#1091#1088#1085#1072#1083
  ClientHeight = 505
  ClientWidth = 1016
  Constraints.MaxWidth = 1024
  OldCreateOrder = True
  Position = poDefaultPosOnly
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    Width = 1016
    Height = 109
    BorderWidth = 8
    object FromDateCheckBox: TCheckBox
      Left = 8
      Top = 10
      Width = 63
      Height = 17
      Caption = #1042#1110#1076' '#1076#1072#1090#1080
      TabOrder = 0
      OnClick = FromDateCheckBoxClick
    end
    object TillDateCheckBox: TCheckBox
      Left = 8
      Top = 34
      Width = 63
      Height = 17
      Caption = #1055#1086'  '#1076#1072#1090#1091
      TabOrder = 2
      OnClick = TillDateCheckBoxClick
    end
    object FromDatePicker: TDateTimePicker
      Left = 82
      Top = 8
      Width = 87
      Height = 21
      CalAlignment = dtaLeft
      Date = 37462
      Time = 37462
      Color = clBtnFace
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnCloseUp = FromDateCheckBoxClick
      OnChange = FromDatePickerChange
    end
    object TillDatePicker: TDateTimePicker
      Left = 82
      Top = 32
      Width = 87
      Height = 21
      CalAlignment = dtaLeft
      Date = 37462.9999884259
      Time = 37462.9999884259
      Color = clBtnFace
      DateFormat = dfShort
      DateMode = dmComboBox
      Enabled = False
      Kind = dtkDate
      ParseInput = False
      TabOrder = 3
    end
    object CategoryComboBox: TAzComboBox
      Left = 268
      Top = 8
      Width = 193
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 5
    end
    object CategoryCheckBox: TCheckBox
      Left = 184
      Top = 10
      Width = 57
      Height = 17
      Caption = #1052#1086#1076#1091#1083#1100
      TabOrder = 4
      OnClick = CategoryCheckBoxClick
    end
    object SubCategoryCheckBox: TCheckBox
      Left = 184
      Top = 34
      Width = 69
      Height = 17
      Caption = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      TabOrder = 6
      OnClick = SubCategoryCheckBoxClick
    end
    object SubCategoryComboBox: TAzComboBox
      Left = 268
      Top = 32
      Width = 193
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 7
    end
    object ActionCheckBox: TCheckBox
      Left = 184
      Top = 58
      Width = 67
      Height = 17
      Caption = #1054#1087#1077#1088#1072#1094#1110#1103
      TabOrder = 8
      OnClick = ActionCheckBoxClick
    end
    object ActionComboBox: TAzComboBox
      Left = 268
      Top = 56
      Width = 193
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 9
    end
    object UserCheckBox: TCheckBox
      Left = 184
      Top = 82
      Width = 79
      Height = 17
      Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
      TabOrder = 10
      OnClick = UserCheckBoxClick
    end
    object UserComboBox: TAzComboBox
      Left = 268
      Top = 80
      Width = 193
      Height = 21
      Style = csDropDownList
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 11
    end
    object LogPromptDBMemo: TDBMemo
      Left = 479
      Top = 8
      Width = 529
      Height = 93
      Align = alRight
      Color = clBtnFace
      DataField = 'LOGPROMPT'
      DataSource = DetailListQuerySrc
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 13
    end
    object FilterBtn: TBitBtn
      Left = 8
      Top = 56
      Width = 161
      Height = 25
      Caption = #1060#1110#1083#1100#1090#1088#1091#1074#1072#1090#1080
      TabOrder = 12
      OnClick = FilterBtnClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000000000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDD88880
        DDDDDD000000DDDDDD8000008DDDDD000000DDDDDD00FF770DDDDD000000DDDD
        DD8000000DDDDD000000DDDDDD00FF770DDDDD000000DDDDDD8000000DDDDD00
        0000DDDDDD0F878F0DDDDD000000DDDDDD8B878BF0DDDD000000DDDDD0FF878F
        F8DDDD000000DDDD8BFB878BFB8DDD000000DDD8BFF87778FFB8DD000000DDD8
        FBF87778FBF8DD000000DDD8BF0800080FB8DD000000DDD8FBF8FBF8FBF8DD00
        0000DDDD8FFFFFFFFF8DDD000000DDDDD8FBFBFBF8DDDD000000DDDDDD88BFB8
        8DDDDD000000DDDDDDDD888DDDDDDD000000}
    end
  end
  inherited BottomPanel: TPanel
    Top = 472
    Width = 1016
    TabOrder = 2
    inherited CloseBtn: TBitBtn
      Left = 926
    end
  end
  object PersonListDBGrid: TDBGrid [2]
    Left = 0
    Top = 109
    Width = 1016
    Height = 363
    Align = alClient
    Color = clInfoBk
    DataSource = DetailListQuerySrc
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
    Columns = <
      item
        Expanded = False
        FieldName = 'LOGDATETIME'
        Title.Alignment = taCenter
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANAGER'
        Title.Alignment = taCenter
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CATEGORYNAME'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIONNAME'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBCATEGNAME'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CalcLogPrompt'
        Title.Alignment = taCenter
        Width = 438
        Visible = True
      end>
  end
  inherited DetailListQuerySrc: TDataSource
    Top = 467
  end
  inherited DetailListQuery: TQuery
    OnCalcFields = DetailListQueryCalcFields
    Filtered = True
    SQL.Strings = (
      'select L.ProgramLogId, L.LogDateTime,'
      '  L.LogCategory, L.SubCategory, L.LogAction, L.UserId,'
      '  C.ItemName as CategoryName, S.ItemName as SubCategName,'
      '  A.ItemName as ActionName,'
      '  U.TmUserName || '#39' '#39' || U.TmUserSurName as Manager, L.LogPrompt'
      'from ProgramLog L'
      
        '  left join NameLists C on C.Category = 25 and C.IntValue = L.Lo' +
        'gCategory'
      
        '  left join NameLists S on S.Category = 26 and S.IntValue = L.Su' +
        'bCategory'
      
        '  left join NameLists A on A.Category = 27 and A.IntValue = L.Lo' +
        'gAction'
      '  left join TmUsers U on U.TmUserId = L.UserId'
      'order by L.LogDateTime desc')
    Top = 467
    object DetailListQueryPROGRAMLOGID: TIntegerField
      FieldName = 'PROGRAMLOGID'
    end
    object DetailListQueryLOGDATETIME: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072' '#1110' '#1095#1072#1089
      FieldName = 'LOGDATETIME'
      DisplayFormat = 'ddd, dd.mm.yyyy hh:nn'
    end
    object DetailListQueryLOGCATEGORY: TIntegerField
      FieldName = 'LOGCATEGORY'
    end
    object DetailListQuerySUBCATEGORY: TIntegerField
      FieldName = 'SUBCATEGORY'
    end
    object DetailListQueryLOGACTION: TIntegerField
      FieldName = 'LOGACTION'
    end
    object DetailListQueryUSERID: TIntegerField
      FieldName = 'USERID'
    end
    object DetailListQueryCATEGORYNAME: TStringField
      DisplayLabel = #1052#1086#1076#1091#1083#1100
      FieldName = 'CATEGORYNAME'
      Size = 40
    end
    object DetailListQuerySUBCATEGNAME: TStringField
      DisplayLabel = #1050#1072#1090#1077#1075#1086#1088#1110#1103
      FieldName = 'SUBCATEGNAME'
      Size = 40
    end
    object DetailListQueryACTIONNAME: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1094#1110#1103
      FieldName = 'ACTIONNAME'
      Size = 40
    end
    object DetailListQueryMANAGER: TStringField
      DisplayLabel = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
      FieldName = 'MANAGER'
      Size = 51
    end
    object DetailListQueryLOGPROMPT: TMemoField
      FieldName = 'LOGPROMPT'
      BlobType = ftMemo
      Size = 1
    end
    object DetailListQueryCalcLogPrompt: TStringField
      DisplayLabel = #1054#1087#1080#1089
      FieldKind = fkCalculated
      FieldName = 'CalcLogPrompt'
      Size = 255
      Calculated = True
    end
  end
  inherited PopupMenu: TPopupMenu
    Top = 467
  end
  inherited ActionList: TActionList
    Top = 467
  end
  inherited PrintDialog: TPrintDialog
    Top = 467
  end
  inherited ImageList: TImageList
    Top = 467
  end
  object SelCategoryQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select ItemName, IntValue'
      'from NameLists'
      'where Category = 25 and IntValue > 0'
      'order by IntValue')
    Left = 544
    Top = 40
    object SelCategoryQryITEMNAME: TStringField
      FieldName = 'ITEMNAME'
      Size = 40
    end
    object SelCategoryQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
  end
  object SelSubCategQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select ItemName, IntValue'
      'from NameLists'
      'where Category = 26 and IntValue > 0'
      'order by IntValue')
    Left = 576
    Top = 40
    object SelSubCategQryITEMNAME: TStringField
      FieldName = 'ITEMNAME'
      Size = 40
    end
    object SelSubCategQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
  end
  object SelActionQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select ItemName, IntValue'
      'from NameLists'
      'where Category = 27 and IntValue > 0'
      'order by IntValue')
    Left = 608
    Top = 40
    object SelActionQryITEMNAME: TStringField
      FieldName = 'ITEMNAME'
      Size = 40
    end
    object SelActionQryINTVALUE: TIntegerField
      FieldName = 'INTVALUE'
    end
  end
  object SelUserQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      
        'select U.TmUserId, U.TmUserName || '#39' '#39' || U.TmUserSurName as Man' +
        'ager, count(*)'
      'from TmUsers U, ProgramLog L'
      'where L.UserId = U.TmUserId'
      'group by U.TmUserId, U.TmUserName, U.TmUserSurName')
    Left = 640
    Top = 40
    object SelUserQryTMUSERID: TIntegerField
      FieldName = 'TMUSERID'
    end
    object SelUserQryMANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 51
    end
  end
end
