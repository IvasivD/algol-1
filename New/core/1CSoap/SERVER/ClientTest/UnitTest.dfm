object Form1: TForm1
  Left = 438
  Top = 167
  Width = 951
  Height = 649
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 64
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 176
    Top = 48
    Width = 113
    Height = 25
    Caption = 'Test File base 64'
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 64
    Top = 96
    Width = 153
    Height = 25
    Caption = 'Send File (Soap Atachment)'
    TabOrder = 2
    Visible = False
    OnClick = Button4Click
  end
  object Button3: TButton
    Left = 368
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Check Invoice'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button5: TButton
    Left = 480
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 368
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 368
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Ch Emeil '
    TabOrder = 6
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 368
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Check Soap DB'
    TabOrder = 7
    OnClick = Button8Click
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 184
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button9: TButton
    Left = 384
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Button9'
    TabOrder = 9
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 560
    Top = 256
    Width = 75
    Height = 25
    Caption = 'T Group Rate'
    TabOrder = 10
    OnClick = Button10Click
  end
  object Memo1: TMemo
    Left = 40
    Top = 320
    Width = 497
    Height = 265
    Lines.Strings = (
      'Memo1')
    TabOrder = 11
  end
  object Button11: TButton
    Left = 560
    Top = 288
    Width = 75
    Height = 25
    Caption = 'All Country'
    TabOrder = 12
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 808
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Button12'
    TabOrder = 13
    OnClick = Button12Click
  end
  object Button13: TButton
    Left = 560
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Country inf'
    TabOrder = 14
    OnClick = Button13Click
  end
  object Button14: TButton
    Left = 672
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Rate_Old'
    TabOrder = 15
    OnClick = Button14Click
  end
  object Button15: TButton
    Left = 560
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Languages'
    TabOrder = 16
    OnClick = Button15Click
  end
  object Button16: TButton
    Left = 672
    Top = 352
    Width = 121
    Height = 25
    Caption = 'Rate_All_Serv_Old'
    TabOrder = 17
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 536
    Top = 552
    Width = 75
    Height = 25
    Caption = 'Select All'
    TabOrder = 18
    OnClick = Button17Click
  end
  object Button18: TButton
    Left = 560
    Top = 384
    Width = 75
    Height = 25
    Caption = 'CompanyData'
    TabOrder = 19
    OnClick = Button18Click
  end
  object Button19: TButton
    Left = 664
    Top = 384
    Width = 75
    Height = 25
    Caption = 'CheckCompany'
    TabOrder = 20
    OnClick = Button19Click
  end
  object OpenDialog1: TOpenDialog
    Left = 408
    Top = 112
  end
  object ClientDBBank: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPBanks'
    RemoteServer = SoapConnection1
    Left = 680
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ClientDBBank
    Left = 752
    Top = 192
  end
  object DataSetProvider1: TDataSetProvider
    Left = 680
    Top = 256
  end
  object SoapConnection1: TSoapConnection
    Agent = 'Borland SOAP 1.2'
    Connected = True
    URL = 'http://localhost:10080/TourSoap/TourSoap.dll/soap/SoapDM'
    SOAPServerIID = 'IAppServerSOAP - {C99F4735-D6D2-495C-8CA2-E53E5A439E61}'
    UseSOAPAdapter = True
    Left = 568
    Top = 88
  end
  object ADODataBank: TADODataSet
    Parameters = <>
    Left = 752
    Top = 64
  end
  object ADODataSet1: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT Cast( '#39#39' as varchar(10) ) Representation, ZIPCODE ZIP, ( ' +
      'select name from COUNTRIES where COUNTRYID = COMPOFFICES.COUNTRY' +
      'ID ) State,PROVINCE Region, TOWNSHIP District,( select name from' +
      ' cities where CITYID = COMPOFFICES.CITYID ) CITY ,( select name ' +
      'from cities where CITYID = COMPOFFICES.CITYKIND ) Settlement , A' +
      'DDRESS Street, House ,TENEMENT Appartment from COMPOFFICES where' +
      ' COMPANYID = '#39'36826'#39
    Parameters = <>
    Left = 672
    Top = 488
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=masterkey;Persist Security Info=True' +
      ';User ID=SYSDBA;Extended Properties="Driver=Firebird/InterBase(r' +
      ') driver;Dbname=troll:D:\_Apollo\_TOURIB_TEST.GDB;PWD=masterkey;' +
      'UID=SYSDBA;"'
    LoginPrompt = False
    Left = 727
    Top = 484
  end
end
