object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 483
  Top = 205
  Height = 333
  Width = 444
  object IBDatabase: TIBDatabase
    Connected = True
    DatabaseName = 'Alfa:D:\TourMn\NetTour\_TOURIB_TEST.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    Left = 33
    Top = 241
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBDatabase
    DefaultAction = TACommitRetaining
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saCommitRetaining
    Left = 105
    Top = 244
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase
    Transaction = IBTransaction1
    OnPostError = IBQuery1PostError
    SQL.Strings = (
      'select * from TEST_TRANSACT')
    Left = 40
    Top = 155
    object IBQuery1ID: TIntegerField
      FieldName = 'ID'
      Origin = '"TEST_TRANSACT"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQuery1NAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"TEST_TRANSACT"."NAME"'
      Size = 250
    end
    object IBQuery1ID2: TIntegerField
      FieldName = 'ID2'
      Origin = '"TEST_TRANSACT"."ID2"'
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 86
    Top = 159
  end
end
