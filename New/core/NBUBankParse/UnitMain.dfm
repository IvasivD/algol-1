object FmMain: TFmMain
  Left = 557
  Top = 164
  Width = 1158
  Height = 364
  Caption = 'Update new Banks'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 288
    Width = 1142
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 57
      Height = 38
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 4
        Width = 31
        Height = 13
        Caption = 'Parse:'
      end
      object Label2: TLabel
        Left = 8
        Top = 21
        Width = 39
        Height = 13
        Caption = 'Update:'
      end
    end
    object Panel3: TPanel
      Left = 57
      Top = 0
      Width = 1085
      Height = 38
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ProgressBarParse: TProgressBar
        Left = 0
        Top = 0
        Width = 1085
        Height = 17
        Align = alTop
        TabOrder = 0
      end
      object ProgressBarUpdate: TProgressBar
        Left = 0
        Top = 21
        Width = 1085
        Height = 17
        Align = alBottom
        TabOrder = 1
      end
      object Panel10: TPanel
        Left = 0
        Top = 21
        Width = 1085
        Height = 0
        Align = alBottom
        Caption = 'Panel10'
        TabOrder = 2
      end
    end
  end
  object PageControl: TcxPageControl
    Left = 0
    Top = 35
    Width = 1142
    Height = 253
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = TabParseText
    ClientRectBottom = 249
    ClientRectLeft = 4
    ClientRectRight = 1138
    ClientRectTop = 24
    object TabParseText: TcxTabSheet
      Caption = 'View new Parses'
      ImageIndex = 0
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 1134
        Height = 225
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Manual Check Banks'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 570
        Top = 31
        Height = 194
        Align = alRight
      end
      object DBTreeList: TcxDBTreeList
        Left = 0
        Top = 31
        Width = 570
        Height = 194
        Align = alClient
        Bands = <
          item
          end>
        DataController.DataSource = BankDS
        DataController.ParentField = 'PARENTID'
        DataController.KeyField = 'BANKID'
        OptionsData.Editing = False
        OptionsData.Deleting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        RootValue = -1
        TabOrder = 0
        OnFocusedNodeChanged = DBTreeListFocusedNodeChanged
        object cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = #1041#1072#1085#1082
          DataBinding.FieldName = 'NAME'
          Width = 659
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          DataBinding.FieldName = 'GLMFO'
          Width = 68
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          DataBinding.FieldName = 'MFO'
          Width = 50
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxDBTreeList1cxDBTreeListColumn5: TcxDBTreeListColumn
          Caption.AlignHorz = taCenter
          Caption.Text = #1055#1072#1088#1089#1077#1088' '#1041#1072#1085#1082
          DataBinding.FieldName = 'CalBANK'
          Width = 439
          Position.ColIndex = 3
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
      object Panel4: TPanel
        Left = 573
        Top = 31
        Width = 561
        Height = 194
        Align = alRight
        Caption = 'Panel4'
        TabOrder = 1
        object Splitter2: TSplitter
          Left = 1
          Top = -443
          Width = 559
          Height = 3
          Cursor = crVSplit
          Align = alBottom
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 559
          Height = 72
          Align = alTop
          TabOrder = 0
          object ButRefresh: TSpeedButton
            Left = 408
            Top = 8
            Width = 23
            Height = 22
            Caption = '*'
            OnClick = ButRefreshClick
          end
          object SpeedButton1: TSpeedButton
            Left = 8
            Top = 8
            Width = 23
            Height = 22
            Caption = '!!!'
            OnClick = SpeedButton1Click
          end
          object EdTextLike: TcxTextEdit
            Left = 40
            Top = 8
            TabOrder = 0
            Width = 361
          end
          object butSetToBank: TButton
            Left = 144
            Top = 37
            Width = 121
            Height = 25
            Caption = 'Set To Bank'
            TabOrder = 1
            OnClick = butSetToBankClick
          end
          object Button7: TButton
            Left = 8
            Top = 37
            Width = 121
            Height = 25
            Caption = 'Set All To Bank'
            TabOrder = 2
            OnClick = Button7Click
          end
        end
        object cxGrid2: TcxGrid
          Left = 1
          Top = 73
          Width = 559
          Height = 176
          Align = alClient
          TabOrder = 1
          object cxGridDBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGridLevel1: TcxGridLevel
            GridView = ViewParentBanks
          end
        end
        object Panel6: TPanel
          Left = 1
          Top = -440
          Width = 559
          Height = 633
          Align = alBottom
          Caption = 'Panel6'
          TabOrder = 2
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 557
            Height = 631
            Align = alClient
            TabOrder = 0
            object Panel8: TPanel
              Left = 1
              Top = 1
              Width = 555
              Height = 33
              Align = alTop
              TabOrder = 0
              object Button4: TButton
                Left = 136
                Top = 5
                Width = 121
                Height = 25
                Caption = 'Set Not Active'
                TabOrder = 0
                OnClick = Button4Click
              end
              object Button6: TButton
                Left = 8
                Top = 5
                Width = 121
                Height = 25
                Caption = 'Set Not Active All'
                TabOrder = 1
                OnClick = Button6Click
              end
            end
            object cxGrid1: TcxGrid
              Left = 1
              Top = 34
              Width = 555
              Height = 596
              Align = alClient
              TabOrder = 1
              object cxGrid1DBTableView1: TcxGridDBTableView
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
              end
              object cxGrid1Level1: TcxGridLevel
                GridView = ViewDetail
              end
            end
          end
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 0
        Width = 1134
        Height = 31
        Align = alTop
        TabOrder = 2
        object Label3: TLabel
          Left = 200
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Curr Name:'
        end
        object EdCurrName: TcxTextEdit
          Left = 264
          Top = 5
          TabOrder = 0
          Width = 513
        end
        object Button8: TButton
          Left = 784
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Update'
          TabOrder = 1
          OnClick = Button8Click
        end
        object Button3: TButton
          Left = 3
          Top = 3
          Width = 75
          Height = 25
          Caption = 'Show All Tree'
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button5: TButton
          Left = 83
          Top = 3
          Width = 97
          Height = 25
          Caption = 'Show Other Banks'
          TabOrder = 3
          OnClick = Button5Click
        end
      end
    end
  end
  object ParsePanel: TPanel
    Left = 0
    Top = 0
    Width = 1142
    Height = 35
    Align = alTop
    TabOrder = 2
    object Button1: TButton
      Left = 86
      Top = 5
      Width = 97
      Height = 25
      Caption = 'Parse To Screen'
      TabOrder = 0
      OnClick = Button1Click
    end
    object ButParseNewDB: TButton
      Left = 6
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Parse New DB'
      TabOrder = 1
      OnClick = ButParseNewDBClick
    end
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 'alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 413
    Top = 9
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase
    Left = 360
    Top = 9
  end
  object IBQueryBank: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction1
    OnCalcFields = IBQueryBankCalcFields
    SQL.Strings = (
      
        'select * from BANKS where D_CLOSE is NULL and BANKID =99999 and ' +
        'PARENTID = 99999')
    Left = 288
    Top = 8
    object IBQueryBankBANKID: TIntegerField
      FieldName = 'BANKID'
      Origin = '"BANKS"."BANKID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryBankNAME: TIBStringField
      DisplayWidth = 250
      FieldName = 'NAME'
      Origin = '"BANKS"."NAME"'
      Size = 250
    end
    object IBQueryBankADDRESS: TIBStringField
      FieldName = 'ADDRESS'
      Origin = '"BANKS"."ADDRESS"'
      Size = 50
    end
    object IBQueryBankSWIFT: TIBStringField
      FieldName = 'SWIFT'
      Origin = '"BANKS"."SWIFT"'
      Size = 22
    end
    object IBQueryBankMFO: TIBStringField
      FieldName = 'MFO'
      Origin = '"BANKS"."MFO"'
      Size = 6
    end
    object IBQueryBankMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"BANKS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IBQueryBankCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"BANKS"."COUNTRYID"'
    end
    object IBQueryBankGLMFO: TIBStringField
      FieldName = 'GLMFO'
      Origin = '"BANKS"."GLMFO"'
      Size = 6
    end
    object IBQueryBankD_OPEN: TDateTimeField
      FieldName = 'D_OPEN'
      Origin = '"BANKS"."D_OPEN"'
    end
    object IBQueryBankD_CLOSE: TDateTimeField
      FieldName = 'D_CLOSE'
      Origin = '"BANKS"."D_CLOSE"'
    end
    object IBQueryBankPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"BANKS"."PARENTID"'
    end
    object IBQueryBankDEPCODE: TIBStringField
      FieldName = 'DEPCODE'
      Origin = '"BANKS"."DEPCODE"'
    end
    object IBQueryBankCalBANK: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalBANK'
      Size = 300
      Calculated = True
    end
  end
  object BankDS: TDataSource
    DataSet = IBQueryBank
    Left = 224
    Top = 8
  end
  object DS_MasterBank: TDataSource
    DataSet = IBQueryMasterBank
    Left = 512
    Top = 8
  end
  object IBQueryMasterBank: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction1
    OnCalcFields = IBQueryBankCalcFields
    SQL.Strings = (
      'select * from BANKS')
    Left = 624
    Top = 8
    object IntegerField1: TIntegerField
      FieldName = 'BANKID'
      Origin = '"BANKS"."BANKID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField1: TIBStringField
      DisplayWidth = 250
      FieldName = 'NAME'
      Origin = '"BANKS"."NAME"'
      Size = 250
    end
    object IBStringField2: TIBStringField
      FieldName = 'ADDRESS'
      Origin = '"BANKS"."ADDRESS"'
      Size = 50
    end
    object IBStringField3: TIBStringField
      FieldName = 'SWIFT'
      Origin = '"BANKS"."SWIFT"'
      Size = 22
    end
    object IBStringField4: TIBStringField
      FieldName = 'MFO'
      Origin = '"BANKS"."MFO"'
      Size = 6
    end
    object MemoField1: TMemoField
      FieldName = 'MEMO'
      Origin = '"BANKS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IntegerField2: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"BANKS"."COUNTRYID"'
    end
    object IBStringField5: TIBStringField
      FieldName = 'GLMFO'
      Origin = '"BANKS"."GLMFO"'
      Size = 6
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'D_OPEN'
      Origin = '"BANKS"."D_OPEN"'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'D_CLOSE'
      Origin = '"BANKS"."D_CLOSE"'
    end
    object IntegerField3: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"BANKS"."PARENTID"'
    end
    object IBStringField7: TIBStringField
      FieldName = 'DEPCODE'
      Origin = '"BANKS"."DEPCODE"'
    end
    object StringField1: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalBANK'
      Size = 300
      Calculated = True
    end
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 444
    Top = 73
    object ViewDetail: TcxGridDBTableView
      DataController.DataSource = DS_MasterBank
      DataController.KeyFieldNames = 'BANKID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object ViewDetailBankID: TcxGridDBColumn
        DataBinding.FieldName = 'BANKID'
        Visible = False
      end
      object ViewDetailName: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 484
      end
    end
    object ViewParentBanks: TcxGridDBTableView
      DataController.DataSource = DSParentBank
      DataController.KeyFieldNames = 'BANKID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Editing = False
      OptionsSelection.CellSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      object ViewParentBanksID: TcxGridDBColumn
        DataBinding.FieldName = 'BANKID'
        Visible = False
      end
      object ViewParentBanksColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTID'
        Width = 55
      end
      object ViewParentBanksNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 177
      end
    end
  end
  object DSParentBank: TDataSource
    DataSet = IBQueryParentBank
    Left = 736
    Top = 8
  end
  object IBQueryParentBank: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction1
    OnCalcFields = IBQueryBankCalcFields
    SQL.Strings = (
      'select * from BANKS where PARENTID is NULL')
    Left = 832
    Top = 8
    object IntegerField4: TIntegerField
      FieldName = 'BANKID'
      Origin = '"BANKS"."BANKID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField8: TIBStringField
      DisplayWidth = 250
      FieldName = 'NAME'
      Origin = '"BANKS"."NAME"'
      Size = 250
    end
    object IBStringField9: TIBStringField
      FieldName = 'ADDRESS'
      Origin = '"BANKS"."ADDRESS"'
      Size = 50
    end
    object IBStringField10: TIBStringField
      FieldName = 'SWIFT'
      Origin = '"BANKS"."SWIFT"'
      Size = 22
    end
    object IBStringField11: TIBStringField
      FieldName = 'MFO'
      Origin = '"BANKS"."MFO"'
      Size = 6
    end
    object MemoField2: TMemoField
      FieldName = 'MEMO'
      Origin = '"BANKS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IntegerField5: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"BANKS"."COUNTRYID"'
    end
    object IBStringField12: TIBStringField
      FieldName = 'GLMFO'
      Origin = '"BANKS"."GLMFO"'
      Size = 6
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'D_OPEN'
      Origin = '"BANKS"."D_OPEN"'
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'D_CLOSE'
      Origin = '"BANKS"."D_CLOSE"'
    end
    object IntegerField6: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"BANKS"."PARENTID"'
    end
    object IBStringField14: TIBStringField
      FieldName = 'DEPCODE'
      Origin = '"BANKS"."DEPCODE"'
    end
    object StringField2: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalBANK'
      Size = 300
      Calculated = True
    end
  end
  object IBQueryExec: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction1
    OnCalcFields = IBQueryBankCalcFields
    SQL.Strings = (
      'select * from BANKS where PARENTID is NULL')
    Left = 376
    Top = 72
    object IntegerField7: TIntegerField
      FieldName = 'BANKID'
      Origin = '"BANKS"."BANKID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBStringField15: TIBStringField
      FieldName = 'NAME'
      Origin = '"BANKS"."NAME"'
      Size = 50
    end
    object IBStringField16: TIBStringField
      FieldName = 'ADDRESS'
      Origin = '"BANKS"."ADDRESS"'
      Size = 50
    end
    object IBStringField17: TIBStringField
      FieldName = 'SWIFT'
      Origin = '"BANKS"."SWIFT"'
      Size = 22
    end
    object IBStringField18: TIBStringField
      FieldName = 'MFO'
      Origin = '"BANKS"."MFO"'
      Size = 6
    end
    object MemoField3: TMemoField
      FieldName = 'MEMO'
      Origin = '"BANKS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IntegerField8: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"BANKS"."COUNTRYID"'
    end
    object IBStringField19: TIBStringField
      FieldName = 'GLMFO'
      Origin = '"BANKS"."GLMFO"'
      Size = 6
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'D_OPEN'
      Origin = '"BANKS"."D_OPEN"'
    end
    object DateTimeField6: TDateTimeField
      FieldName = 'D_CLOSE'
      Origin = '"BANKS"."D_CLOSE"'
    end
    object IntegerField9: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"BANKS"."PARENTID"'
    end
    object IBStringField20: TIBStringField
      FieldName = 'NAME2'
      Origin = '"BANKS"."NAME2"'
      Size = 300
    end
    object IBStringField21: TIBStringField
      FieldName = 'DEPCODE'
      Origin = '"BANKS"."DEPCODE"'
    end
    object StringField3: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalBANK'
      Size = 300
      Calculated = True
    end
  end
end
