object FrmFindAllElements: TFrmFindAllElements
  Left = 234
  Top = 179
  Width = 1475
  Height = 675
  Caption = 'Elements'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1459
    Height = 41
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Generate'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Test'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 232
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save To File'
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button9: TButton
      Left = 408
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Fix Dtaset_fields'
      TabOrder = 3
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 504
      Top = 8
      Width = 153
      Height = 25
      Caption = 'Exctract All SQL to Path File'
      TabOrder = 4
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 672
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Find All Elements'
      TabOrder = 5
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 824
      Top = 8
      Width = 153
      Height = 25
      Caption = 'find KeyWord  Server Object'
      TabOrder = 6
      OnClick = Button12Click
    end
    object Button15: TButton
      Left = 992
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Find NameList in View'
      TabOrder = 7
      OnClick = Button15Click
    end
    object Button19: TButton
      Left = 1184
      Top = 8
      Width = 137
      Height = 25
      Caption = 'Fix Generate value'
      TabOrder = 8
      OnClick = Button19Click
    end
    object Button20: TButton
      Left = 320
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Make List From'
      TabOrder = 9
      OnClick = Button20Click
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 41
    Width = 1459
    Height = 596
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet3
    ClientRectBottom = 592
    ClientRectLeft = 4
    ClientRectRight = 1455
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Create All Alements'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 1281
        Height = 568
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = ViewElements
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Gen Trigers'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1451
        Height = 41
        Align = alTop
        Caption = 'Panel2'
        TabOrder = 0
        object Button3: TButton
          Left = 24
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Gen'
          TabOrder = 0
          OnClick = Button3Click
        end
      end
      object cxGrid2: TcxGrid
        Left = 0
        Top = 41
        Width = 1451
        Height = 527
        Align = alClient
        TabOrder = 1
        object cxGrid2DBTableView1: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid2Level1: TcxGridLevel
          GridView = ViewTrigers
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Procedures'
      ImageIndex = 2
      object cxGrid3: TcxGrid
        Left = 0
        Top = 29
        Width = 1451
        Height = 539
        Align = alClient
        TabOrder = 0
        object cxGrid3DBTableView1: TcxGridDBTableView
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
        object cxGrid3Level1: TcxGridLevel
          GridView = ViewProcedures
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1451
        Height = 29
        Align = alTop
        TabOrder = 1
        object Button5: TButton
          Left = 280
          Top = 0
          Width = 97
          Height = 25
          Caption = 'Find Other Proc'
          TabOrder = 0
          OnClick = Button5Click
        end
        object EditPath: TEdit
          Left = 560
          Top = 3
          Width = 425
          Height = 21
          TabOrder = 1
          Text = 'D:\Development\Delphi\Software\Algol_Source\'
        end
        object Button6: TButton
          Left = 992
          Top = 2
          Width = 75
          Height = 25
          Caption = 'Find in files'
          TabOrder = 2
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 1088
          Top = 1
          Width = 75
          Height = 25
          Caption = 'Save not use'
          TabOrder = 3
          OnClick = Button7Click
        end
        object Button8: TButton
          Left = 384
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Find in trigers'
          TabOrder = 4
          OnClick = Button8Click
        end
        object Button13: TButton
          Left = 464
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Find in Views'
          TabOrder = 5
          OnClick = Button13Click
        end
        object Button14: TButton
          Left = 1200
          Top = 0
          Width = 75
          Height = 25
          Caption = 'CurrScan'
          TabOrder = 6
          OnClick = Button14Click
        end
        object Button16: TButton
          Left = 0
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Show Proc'
          TabOrder = 7
          OnClick = Button16Click
        end
        object Button17: TButton
          Left = 80
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Show View'
          TabOrder = 8
          OnClick = Button17Click
        end
        object Button18: TButton
          Left = 168
          Top = 0
          Width = 75
          Height = 25
          Caption = 'Show Table'
          TabOrder = 9
          OnClick = Button18Click
        end
      end
    end
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 912
    Top = 128
    object ViewElements: TcxGridDBTableView
      DataController.DataSource = DSMemData
      DataController.KeyFieldNames = 'RecId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewElementsRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 47
        IsCaptionAssigned = True
      end
      object ViewElementsN: TcxGridDBColumn
        Caption = 'N'
        OnGetDisplayText = ViewElementsNGetDisplayText
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 36
      end
      object ViewElementsDatasetName: TcxGridDBColumn
        Caption = 'Dataset Name'
        DataBinding.FieldName = 'DatasetName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 179
      end
      object ViewElementsFormName: TcxGridDBColumn
        Caption = 'Form Name'
        DataBinding.FieldName = 'FormName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 98
      end
      object ViewElementsTableName: TcxGridDBColumn
        Caption = 'Table Name'
        DataBinding.FieldName = 'TableName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 262
      end
      object ViewElementsKeyFieldName: TcxGridDBColumn
        Caption = 'Key Field Name'
        DataBinding.FieldName = 'KeyFieldName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 292
      end
      object ViewElementsViewName: TcxGridDBColumn
        DataBinding.FieldName = 'ViewName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 100
      end
      object ViewElementsGenIdName: TcxGridDBColumn
        DataBinding.FieldName = 'GenIdName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 150
      end
      object ViewElementsCheckElem: TcxGridDBColumn
        Caption = 'Create Elem'
        DataBinding.FieldName = 'CheckElem'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 69
      end
    end
    object ViewTrigers: TcxGridDBTableView
      DataController.DataSource = DS_Trigers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object ViewTrigersRDBTRIGGER_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'RDB$TRIGGER_NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewTrigersRDBRELATION_NAME: TcxGridDBColumn
        DataBinding.FieldName = 'RDB$RELATION_NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object ViewTrigersRDBTRIGGER_SOURCE: TcxGridDBColumn
        DataBinding.FieldName = 'CalTrigerSource'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 195
      end
    end
    object ViewProcedures: TcxGridDBTableView
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
      DataController.DataSource = DS_MemDataProc
      DataController.KeyFieldNames = 'RecId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewProceduresRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 57
      end
      object ViewProceduresPROC_NAME: TcxGridDBColumn
        Caption = '??'#39'???'
        DataBinding.FieldName = 'PROC_NAME'
        HeaderAlignmentHorz = taCenter
        Width = 137
      end
      object ViewProceduresPROC_CODE: TcxGridDBColumn
        Caption = '??????'
        DataBinding.FieldName = 'PROC_CODE'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.BlobPaintStyle = bpsText
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 107
      end
      object ViewProceduresUSE_IN: TcxGridDBColumn
        Caption = 'Use in Other Stored Proc'
        DataBinding.FieldName = 'USE_IN_DB'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 138
      end
      object ViewProceduresUSE_IN_Project: TcxGridDBColumn
        Caption = 'Use In Client project code'
        DataBinding.FieldName = 'USE_IN_Project'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 234
      end
      object ViewProceduresUSE_IN_Trigers: TcxGridDBColumn
        Caption = 'Use In Trigers'
        DataBinding.FieldName = 'USE_IN_Trigers'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 332
      end
      object ViewProceduresUSE_IN_View: TcxGridDBColumn
        Caption = 'USE IN View'
        DataBinding.FieldName = 'USE_IN_View'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 331
      end
      object ViewProceduresColumn1: TcxGridDBColumn
      end
    end
  end
  object MemData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 344
    Top = 120
    object MemDataDatasetName: TStringField
      FieldName = 'DatasetName'
      Size = 100
    end
    object MemDataFormName: TStringField
      FieldName = 'FormName'
      Size = 200
    end
    object MemDataTableName: TStringField
      FieldName = 'TableName'
      Size = 100
    end
    object MemDataKeyFieldName: TStringField
      FieldName = 'KeyFieldName'
      Size = 100
    end
    object MemDataCheckElem: TBooleanField
      FieldName = 'CheckElem'
    end
    object MemDataViewName: TStringField
      FieldName = 'ViewName'
      Size = 200
    end
    object MemDataGenIdName: TStringField
      FieldName = 'GenIdName'
      Size = 100
    end
  end
  object DSMemData: TDataSource
    DataSet = MemData
    Left = 416
    Top = 120
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=SYSDBA;Extended Properties="Driver=Firebird/InterBase(r' +
      ') driver;Dbname=troll:D:\_Apollo\_TOURIB_TEST.GDB;PWD=masterkey;' +
      'UID=SYSDBA;"'
    ConnectOptions = coAsyncConnect
    IsolationLevel = ilChaos
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 608
    Top = 128
  end
  object GetKeyFieldName: TADODataSet
    CacheSize = 200
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      ' select s.RDB$FIELD_NAME'#13#10'    from rdb$indices i'#13#10'    left join ' +
      'rdb$index_segments s on i.rdb$index_name = s.rdb$index_name'#13#10'   ' +
      ' left join rdb$relation_constraints r on r.rdb$index_name = s.rd' +
      'b$index_name'#13#10'   where ( i.RDB$RELATION_NAME = :TABLENAME  ) and' +
      ' (rdb$unique_flag = 1)'#13#10'     and RDB$constraint_type = '#39'PRIMARY ' +
      'KEY'#39
    Parameters = <>
    Left = 712
    Top = 160
  end
  object ADOTest: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 592
    Top = 184
  end
  object ADOGetTrigers: TADODataSet
    CacheSize = 200
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOGetTrigersCalcFields
    CommandText = 
      ' select rdb$trigger_name, rdb$relation_name, rdb$trigger_source ' +
      'from rdb$triggers'#13#10'        where rdb$trigger_type = 1 and rdb$sy' +
      'stem_flag = 0'#13#10'          and strpos('#39'CHECK'#39', rdb$trigger_name) =' +
      ' 0'#13#10'          and ( (rdb$trigger_source like '#39'%gen%'#39' or rdb$trig' +
      'ger_source like '#39'%GEN%'#39' or rdb$trigger_source like '#39'%Gen%'#39' ) and' +
      #13#10'              (  rdb$trigger_source not like '#39'%if (new.%'#39' ) an' +
      'd (rdb$trigger_source not like '#39'%IF (new.%'#39' ) and (rdb$trigger_s' +
      'ource not like '#39'%IF (NEW.%'#39' )'#13#10'                  and (rdb$trigge' +
      'r_source not like '#39'%if (NEW.%'#39' )  )'#13#10
    Parameters = <>
    Left = 792
    Top = 200
    object ADOGetTrigersRDBTRIGGER_NAME: TStringField
      FieldName = 'RDB$TRIGGER_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOGetTrigersRDBRELATION_NAME: TStringField
      FieldName = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOGetTrigersRDBTRIGGER_SOURCE: TMemoField
      FieldName = 'RDB$TRIGGER_SOURCE'
      BlobType = ftMemo
    end
    object ADOGetTrigersCalTrigerSource: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalTrigerSource'
      Size = 5000
      Calculated = True
    end
  end
  object DS_Trigers: TDataSource
    DataSet = ADOGetTrigers
    Left = 796
    Top = 257
  end
  object ADOProcedures: TADODataSet
    CacheSize = 200
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOGetTrigersCalcFields
    CommandText = 'SELECT *'#13#10'FROM rdb$procedures'#13#10'ORDER BY rdb$procedure_name'
    Parameters = <>
    Left = 920
    Top = 200
    object ADOProceduresRDBPROCEDURE_NAME: TStringField
      FieldName = 'RDB$PROCEDURE_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOProceduresRDBPROCEDURE_ID: TSmallintField
      FieldName = 'RDB$PROCEDURE_ID'
    end
    object ADOProceduresRDBPROCEDURE_INPUTS: TSmallintField
      FieldName = 'RDB$PROCEDURE_INPUTS'
    end
    object ADOProceduresRDBPROCEDURE_OUTPUTS: TSmallintField
      FieldName = 'RDB$PROCEDURE_OUTPUTS'
    end
    object ADOProceduresRDBDESCRIPTION: TMemoField
      FieldName = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object ADOProceduresRDBPROCEDURE_SOURCE: TMemoField
      FieldName = 'RDB$PROCEDURE_SOURCE'
      BlobType = ftMemo
    end
    object ADOProceduresRDBPROCEDURE_BLR: TBlobField
      FieldName = 'RDB$PROCEDURE_BLR'
    end
    object ADOProceduresRDBSECURITY_CLASS: TStringField
      FieldName = 'RDB$SECURITY_CLASS'
      FixedChar = True
      Size = 31
    end
    object ADOProceduresRDBOWNER_NAME: TStringField
      FieldName = 'RDB$OWNER_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOProceduresRDBRUNTIME: TBlobField
      FieldName = 'RDB$RUNTIME'
    end
    object ADOProceduresRDBSYSTEM_FLAG: TSmallintField
      FieldName = 'RDB$SYSTEM_FLAG'
    end
  end
  object DS_Procedures: TDataSource
    DataSet = ADOProcedures
    Left = 924
    Top = 257
  end
  object MemDataProc: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 344
    Top = 184
    object MemDataProcPROC_NAME: TStringField
      FieldName = 'PROC_NAME'
      Size = 500
    end
    object MemDataProcUSE_IN: TStringField
      FieldName = 'USE_IN_DB'
      Size = 1000
    end
    object MemDataProcUSE_IN_Project: TStringField
      FieldName = 'USE_IN_Project'
      Size = 1000
    end
    object MemDataProcUSE_IN_Trigers: TStringField
      FieldName = 'USE_IN_Trigers'
      Size = 1000
    end
    object MemDataProcUSE_IN_View: TStringField
      FieldName = 'USE_IN_View'
      Size = 200
    end
    object MemDataProcUse_In_Table: TBooleanField
      FieldName = 'Use_In_Table'
    end
    object MemDataProcPROC_CODE: TStringField
      DisplayWidth = 20000
      FieldName = 'PROC_CODE'
      Size = 20000
    end
  end
  object DS_MemDataProc: TDataSource
    DataSet = MemDataProc
    Left = 432
    Top = 184
  end
  object ADOGetAllTrigers: TADODataSet
    CacheSize = 200
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from RDB$TRIGGERS'
    Parameters = <>
    Left = 800
    Top = 344
    object ADOGetAllTrigersRDBTRIGGER_NAME: TStringField
      FieldName = 'RDB$TRIGGER_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOGetAllTrigersRDBRELATION_NAME: TStringField
      FieldName = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOGetAllTrigersRDBTRIGGER_SEQUENCE: TSmallintField
      FieldName = 'RDB$TRIGGER_SEQUENCE'
    end
    object ADOGetAllTrigersRDBTRIGGER_TYPE: TSmallintField
      FieldName = 'RDB$TRIGGER_TYPE'
    end
    object ADOGetAllTrigersRDBTRIGGER_SOURCE: TMemoField
      FieldName = 'RDB$TRIGGER_SOURCE'
      BlobType = ftMemo
    end
    object ADOGetAllTrigersRDBTRIGGER_BLR: TBlobField
      FieldName = 'RDB$TRIGGER_BLR'
    end
    object ADOGetAllTrigersRDBDESCRIPTION: TMemoField
      FieldName = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object ADOGetAllTrigersRDBTRIGGER_INACTIVE: TSmallintField
      FieldName = 'RDB$TRIGGER_INACTIVE'
    end
    object ADOGetAllTrigersRDBSYSTEM_FLAG: TSmallintField
      FieldName = 'RDB$SYSTEM_FLAG'
    end
    object ADOGetAllTrigersRDBFLAGS: TSmallintField
      FieldName = 'RDB$FLAGS'
    end
  end
  object ADOGetTrigersProblem: TADODataSet
    CacheSize = 200
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOGetTrigersCalcFields
    CommandText = 
      ' select * from rdb$triggers'#13#10'        where rdb$system_flag = 0'#13#10 +
      '          and strpos('#39'CHECK'#39', rdb$trigger_name) = 0'
    Parameters = <>
    Left = 1064
    Top = 200
    object StringField1: TStringField
      FieldName = 'RDB$TRIGGER_NAME'
      FixedChar = True
      Size = 31
    end
    object StringField2: TStringField
      FieldName = 'RDB$RELATION_NAME'
      FixedChar = True
      Size = 31
    end
    object MemoField1: TMemoField
      FieldName = 'RDB$TRIGGER_SOURCE'
      BlobType = ftMemo
    end
    object ADOGetTrigersProblemRDBTRIGGER_SEQUENCE: TSmallintField
      FieldName = 'RDB$TRIGGER_SEQUENCE'
    end
    object ADOGetTrigersProblemRDBTRIGGER_BLR: TBlobField
      FieldName = 'RDB$TRIGGER_BLR'
    end
    object ADOGetTrigersProblemRDBDESCRIPTION: TMemoField
      FieldName = 'RDB$DESCRIPTION'
      BlobType = ftMemo
    end
    object ADOGetTrigersProblemRDBTRIGGER_INACTIVE: TSmallintField
      FieldName = 'RDB$TRIGGER_INACTIVE'
    end
    object ADOGetTrigersProblemRDBSYSTEM_FLAG: TSmallintField
      FieldName = 'RDB$SYSTEM_FLAG'
    end
    object ADOGetTrigersProblemRDBFLAGS: TSmallintField
      FieldName = 'RDB$FLAGS'
    end
    object ADOGetTrigersProblemRDBTRIGGER_TYPE: TLargeintField
      FieldName = 'RDB$TRIGGER_TYPE'
    end
    object ADOGetTrigersProblemRDBVALID_BLR: TSmallintField
      FieldName = 'RDB$VALID_BLR'
    end
    object ADOGetTrigersProblemRDBDEBUG_INFO: TBlobField
      FieldName = 'RDB$DEBUG_INFO'
    end
    object ADOGetTrigersProblemRDBENGINE_NAME: TWideStringField
      FieldName = 'RDB$ENGINE_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOGetTrigersProblemRDBENTRYPOINT: TStringField
      FieldName = 'RDB$ENTRYPOINT'
      FixedChar = True
      Size = 255
    end
  end
  object DS_ADOGetTrigersProblem: TDataSource
    DataSet = ADOGetTrigersProblem
    Left = 1068
    Top = 257
  end
  object ADOView: TADODataSet
    CacheSize = 200
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOGetTrigersCalcFields
    CommandText = 
      ' SELECT RDB$RELATIONS.RDB$DESCRIPTION DESCRIPT,'#13#10'          RDB$R' +
      'ELATIONS.RDB$VIEW_SOURCE VIEW_SOURCE,'#13#10'          RDB$RELATIONS.R' +
      'DB$RELATION_NAME TABLE_NAME,'#13#10'          RDB$RELATIONS.RDB$FIELD_' +
      'ID FIELD_ID,'#13#10'          RDB$RELATIONS.RDB$OWNER_NAME OWNER_NAME,' +
      #13#10'          RDB$RELATIONS.RDB$SYSTEM_FLAG '#13#10'   FROM RDB$RELATION' +
      'S'#13#10'    WHERE (RDB$RELATIONS.RDB$SYSTEM_FLAG = 0 )  and'#13#10'       (' +
      'RDB$RELATIONS.RDB$VIEW_SOURCE IS not NULL )'#13#10'   ORDER BY RDB$REL' +
      'ATIONS.RDB$RELATION_NAME'
    Parameters = <>
    Left = 920
    Top = 328
    object ADOViewDESCRIPT: TMemoField
      FieldName = 'DESCRIPT'
      BlobType = ftMemo
    end
    object ADOViewVIEW_SOURCE: TMemoField
      FieldName = 'VIEW_SOURCE'
      BlobType = ftMemo
    end
    object ADOViewTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOViewFIELD_ID: TSmallintField
      FieldName = 'FIELD_ID'
    end
    object ADOViewOWNER_NAME: TStringField
      FieldName = 'OWNER_NAME'
      FixedChar = True
      Size = 31
    end
    object ADOViewRDBSYSTEM_FLAG: TSmallintField
      FieldName = 'RDB$SYSTEM_FLAG'
    end
  end
  object ADOViewDS: TDataSource
    DataSet = ADOView
    Left = 924
    Top = 385
  end
  object ADOTable: TADODataSet
    CacheSize = 200
    Connection = ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADOGetTrigersCalcFields
    CommandText = 
      '         SELECT RDB$RELATIONS.RDB$DESCRIPTION DESCRIPT,'#13#10'       ' +
      '   RDB$RELATIONS.RDB$VIEW_SOURCE VIEW_SOURCE,'#13#10'          RDB$REL' +
      'ATIONS.RDB$RELATION_NAME TABLE_NAME,'#13#10'          RDB$RELATIONS.RD' +
      'B$FIELD_ID FIELD_ID,'#13#10'          RDB$RELATIONS.RDB$OWNER_NAME OWN' +
      'ER_NAME,'#13#10'          RDB$RELATIONS.RDB$SYSTEM_FLAG '#13#10'   FROM RDB$' +
      'RELATIONS'#13#10'    WHERE (RDB$RELATIONS.RDB$SYSTEM_FLAG = 0 )  and'#13#10 +
      '       (RDB$RELATIONS.RDB$VIEW_SOURCE IS NULL )'#13#10'   ORDER BY RDB' +
      '$RELATIONS.RDB$RELATION_NAME'
    Parameters = <>
    Left = 1040
    Top = 328
    object MemoField2: TMemoField
      FieldName = 'DESCRIPT'
      BlobType = ftMemo
    end
    object MemoField3: TMemoField
      FieldName = 'VIEW_SOURCE'
      BlobType = ftMemo
    end
    object StringField3: TStringField
      FieldName = 'TABLE_NAME'
      FixedChar = True
      Size = 31
    end
    object SmallintField1: TSmallintField
      FieldName = 'FIELD_ID'
    end
    object StringField4: TStringField
      FieldName = 'OWNER_NAME'
      FixedChar = True
      Size = 31
    end
    object SmallintField2: TSmallintField
      FieldName = 'RDB$SYSTEM_FLAG'
    end
  end
  object ADOTableSrc: TDataSource
    DataSet = ADOTable
    Left = 1044
    Top = 385
  end
end
