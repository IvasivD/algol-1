object FmMain: TFmMain
  Left = 747
  Top = 330
  Width = 670
  Height = 91
  Caption = #1050#1091#1088#1089#1080' '#1042#1072#1083#1102#1090
  Color = clBtnFace
  Constraints.MaxHeight = 91
  Constraints.MaxWidth = 670
  Constraints.MinHeight = 91
  Constraints.MinWidth = 670
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 35
    Width = 654
    Height = 18
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 93
      Height = 18
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label2: TLabel
        Left = 8
        Top = 2
        Width = 78
        Height = 13
        Caption = #1047#1072#1074#1072#1085#1090#1072#1078#1077#1085#1085#1103':'
      end
    end
    object Panel3: TPanel
      Left = 93
      Top = 0
      Width = 561
      Height = 18
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ProgressBarUpdate: TProgressBar
        Left = 0
        Top = 2
        Width = 561
        Height = 14
        Align = alBottom
        TabOrder = 0
      end
      object Panel10: TPanel
        Left = 0
        Top = 2
        Width = 561
        Height = 0
        Align = alBottom
        Caption = 'Panel10'
        TabOrder = 1
      end
      object Panel4: TPanel
        Left = 0
        Top = 16
        Width = 561
        Height = 2
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
      end
    end
  end
  object ParsePanel: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 35
    Align = alTop
    TabOrder = 1
    object ButParseNewDB: TButton
      Left = 6
      Top = 5
      Width = 163
      Height = 25
      Caption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080' '#1082#1091#1088#1089#1080' '#1074#1072#1083#1102#1090
      TabOrder = 0
      OnClick = ButParseNewDBClick
    end
    object DateEdit: TcxDateEdit
      Left = 208
      Top = 8
      Properties.ShowTime = False
      TabOrder = 1
      Width = 121
    end
  end
  object BankDS: TDataSource
    DataSet = IBQueryBank
    Left = 440
    Top = 8
  end
  object IBQueryBank: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction
    SQL.Strings = (
      
        'select * from BANKS where D_CLOSE is NULL and BANKID =99999 and ' +
        'PARENTID = 99999')
    Left = 496
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
  object IBTransaction: TIBTransaction
    DefaultDatabase = IBDatabase
    Left = 552
    Top = 9
  end
  object IBDatabase: TIBDatabase
    DatabaseName = 'alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    Left = 613
    Top = 9
  end
end
