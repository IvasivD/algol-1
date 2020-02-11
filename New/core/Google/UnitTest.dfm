object Form1: TForm1
  Left = 743
  Top = 246
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 309
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelDist: TLabel
    Left = 224
    Top = 64
    Width = 67
    Height = 23
    Caption = '0.0 '#1082#1084'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 30
    Width = 28
    Height = 13
    Caption = 'From:'
  end
  object Label3: TLabel
    Left = 16
    Top = 53
    Width = 16
    Height = 13
    Caption = 'To:'
  end
  object LabelDur: TLabel
    Left = 224
    Top = 104
    Width = 75
    Height = 23
    Caption = '0.0 '#1075#1086#1076'.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button2: TButton
    Left = 224
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Calculate'
    TabOrder = 0
    OnClick = Button2Click
  end
  object ComboCityFrom: TcxLookupComboBox
    Left = 71
    Top = 24
    Properties.KeyFieldNames = 'CITYID'
    Properties.ListColumns = <
      item
        FieldName = 'CITY'
      end>
    Properties.ListSource = CityDS
    TabOrder = 1
    Width = 145
  end
  object ComboCityTo: TcxLookupComboBox
    Left = 71
    Top = 48
    Properties.KeyFieldNames = 'CITYID'
    Properties.ListColumns = <
      item
        FieldName = 'CITY'
      end>
    Properties.ListSource = CityDS
    TabOrder = 2
    Width = 145
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 80
    Width = 201
    Height = 201
    Caption = 'Wai points:'
    TabOrder = 3
    object SpeedButton1: TSpeedButton
      Left = 160
      Top = 20
      Width = 33
      Height = 22
      Caption = 'Add'
      OnClick = SpeedButton1Click
    end
    object DellCurrWayPoint: TSpeedButton
      Left = 8
      Top = 172
      Width = 27
      Height = 22
      Caption = 'Del'
      OnClick = DellCurrWayPointClick
    end
    object butClearWayPoint: TSpeedButton
      Left = 40
      Top = 172
      Width = 33
      Height = 22
      Caption = 'Clear'
      OnClick = butClearWayPointClick
    end
    object LookupComboBoxCurrWayPoint: TcxLookupComboBox
      Left = 8
      Top = 20
      Properties.KeyFieldNames = 'CITYID'
      Properties.ListColumns = <
        item
          FieldName = 'CITY'
        end>
      Properties.ListSource = CityDS
      TabOrder = 0
      Width = 145
    end
    object ListBoxWayPoint: TcxListBox
      Left = 8
      Top = 50
      Width = 185
      Height = 118
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object ListBoxGeoCoordinate: TcxListBox
    Left = 224
    Top = 130
    Width = 185
    Height = 118
    ItemHeight = 13
    TabOrder = 4
  end
  object Button1: TButton
    Left = 320
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Map'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 328
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 6
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 232
    Top = 201
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 304
    Top = 200
  end
  object IBQueryCity: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      
        'select CITYID,CITIES.NAME as CITY, COUNTRIES.NAME as COUNTRY fro' +
        'm CITIES'
      'left join COUNTRIES on COUNTRIES.COUNTRYID = CITIES.COUNTRYID')
    Left = 232
    Top = 256
    object IBQueryCityCITYID: TIntegerField
      FieldName = 'CITYID'
      Origin = '"CITIES"."CITYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQueryCityCITY: TIBStringField
      FieldName = 'CITY'
      Origin = '"CITIES"."NAME"'
      Size = 190
    end
    object IBQueryCityCOUNTRY: TIBStringField
      FieldName = 'COUNTRY'
      Origin = '"COUNTRIES"."NAME"'
      Size = 30
    end
  end
  object CityDS: TDataSource
    DataSet = IBQueryCity
    Left = 296
    Top = 256
  end
end
