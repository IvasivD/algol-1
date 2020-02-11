object SoapDM: TSoapDM
  OldCreateOrder = False
  OnCreate = SoapDataModuleCreate
  Left = 507
  Top = 328
  Height = 263
  Width = 616
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=SYSDBA;Extended Properties="Driver=Firebird/InterBase(r' +
      ') driver;Dbname=alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB;"'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 48
    Top = 16
  end
  object DSPBanks: TDataSetProvider
    DataSet = ADOBank
    Left = 280
    Top = 40
  end
  object ADOBank: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select * from BANKS'
    Parameters = <>
    Left = 224
    Top = 40
  end
end
