inherited GroupAnketDlg: TGroupAnketDlg
  Left = 375
  Top = 414
  Caption = 'Анкетні дані групи'
  ClientHeight = 310
  ClientWidth = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited WorkPanel: TPanel
    Width = 626
    Height = 277
    object PageControl: TPageControl
      Left = 1
      Top = 1
      Width = 624
      Height = 275
      ActivePage = TravelTabSheet
      Align = alClient
      TabOrder = 0
      object TravelTabSheet: TTabSheet
        Caption = 'Мета поїздки'
        object Label39: TLabel
          Left = 8
          Top = 216
          Width = 75
          Height = 13
          Caption = 'Мета подорожі'
        end
        object Label41: TLabel
          Left = 8
          Top = 180
          Width = 147
          Height = 13
          Caption = 'Довідки в країні проживання'
        end
        object Label44: TLabel
          Left = 8
          Top = 12
          Width = 102
          Height = 13
          Caption = 'Країна призначення'
        end
        object Label45: TLabel
          Left = 8
          Top = 36
          Width = 115
          Height = 13
          Caption = 'Країна в'#39'їзду в Шенген'
        end
        object Label46: TLabel
          Left = 8
          Top = 60
          Width = 104
          Height = 13
          Caption = 'Проїзд транспортом'
        end
        object Label47: TLabel
          Left = 8
          Top = 120
          Width = 80
          Height = 13
          Caption = 'Адреса гаранта'
        end
        object Label42: TLabel
          Left = 328
          Top = 11
          Width = 136
          Height = 13
          Caption = 'Прикордонний пункт в'#39'їзду'
          Visible = False
        end
        object Label43: TLabel
          Left = 328
          Top = 35
          Width = 140
          Height = 13
          Caption = 'Прикордонний пункт виїзду'
          Visible = False
        end
        object Label23: TLabel
          Left = 328
          Top = 60
          Width = 143
          Height = 13
          Caption = 'Основне місце призначення'
          Visible = False
        end
        object Label40: TLabel
          Left = 8
          Top = 96
          Width = 35
          Height = 13
          Caption = 'Гарант'
        end
        object Label1: TLabel
          Left = 328
          Top = 96
          Width = 88
          Height = 13
          Caption = 'Телефон гаранта'
        end
        object Label2: TLabel
          Left = 8
          Top = 144
          Width = 142
          Height = 13
          Caption = 'Адреса під час перебування'
        end
        object TravelObjectDBComboBox: TDBComboBox
          Left = 96
          Top = 212
          Width = 193
          Height = 21
          HelpContext = 741
          Color = clInfoBk
          DataField = 'TRAVELOBJECT'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            'Туризм'
            'Приватна поїздка'
            'Службова поїздка')
          TabOrder = 0
        end
        object GarantDBComboBox: TDBComboBox
          Left = 56
          Top = 92
          Width = 241
          Height = 21
          HelpContext = 753
          Color = clInfoBk
          DataField = 'GARANT'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            'TRANSTOURS    tel. 01 53 24 34 34'
            'Ircos Travel, Mondragone, Viale Margherita, 14')
          TabOrder = 1
        end
        object ReferenceDBComboBox: TDBComboBox
          Tag = -3
          Left = 160
          Top = 176
          Width = 449
          Height = 21
          HelpContext = 741
          Color = clBtnFace
          DataField = 'REFERENCE'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            'Tourist company "Algol", 0322-974121, 974122, 971766')
          TabOrder = 2
        end
        object DestCountryDBLookupComboBox: TDBLookupComboBox
          Tag = -1
          Left = 128
          Top = 8
          Width = 169
          Height = 21
          HelpContext = 751
          Color = clBtnFace
          DataField = 'DESTINATION'
          DataSource = DataSrc
          KeyField = 'NAME'
          ListField = 'NAME'
          ListSource = DM.CountrySrc
          TabOrder = 3
        end
        object ShengenEntryDBLookupComboBox: TDBLookupComboBox
          Left = 128
          Top = 32
          Width = 169
          Height = 21
          HelpContext = 751
          Color = clInfoBk
          DataField = 'SHENGENENTRY'
          DataSource = DataSrc
          KeyField = 'NAME'
          ListField = 'NAME'
          ListSource = DM.CountrySrc
          TabOrder = 4
        end
        object DriveKindDBLookupComboBox: TDBLookupComboBox
          Left = 128
          Top = 56
          Width = 169
          Height = 21
          HelpContext = 741
          Color = clInfoBk
          DataField = 'DRIVEKIND'
          DataSource = DataSrc
          KeyField = 'KIND'
          ListField = 'KIND'
          ListSource = DrvKindQrySrc
          TabOrder = 5
        end
        object GarantAddressDBComboBox: TDBComboBox
          Tag = -2
          Left = 95
          Top = 116
          Width = 514
          Height = 21
          HelpContext = 753
          Color = clBtnFace
          DataField = 'ADDRESSTO'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            '10, rue du Fg Montmartre 75009 Paris'
            'Mondragone, Viale Margherita, 14')
          TabOrder = 6
        end
        object ArriveCustomDBComboBox: TDBComboBox
          Left = 480
          Top = 7
          Width = 129
          Height = 21
          HelpContext = 752
          Color = 15191807
          DataField = 'ARRIVECUSTOM'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            'Tarvisio')
          TabOrder = 7
          Visible = False
          OnExit = ArriveCustomDBComboBoxExit
        end
        object DepartCustomDBComboBox: TDBComboBox
          Left = 480
          Top = 31
          Width = 129
          Height = 21
          HelpContext = 752
          Color = clInfoBk
          DataField = 'DEPARTCUSTOM'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            'Tarvisio')
          TabOrder = 8
          Visible = False
        end
        object DestinationDBComboBox: TDBComboBox
          Left = 480
          Top = 56
          Width = 129
          Height = 21
          HelpContext = 752
          Color = clInfoBk
          DataField = 'DESTINATION'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            'Tarvisio')
          TabOrder = 9
          Visible = False
        end
        object GarantPhoneDBComboBox: TDBComboBox
          Tag = -2
          Left = 424
          Top = 92
          Width = 185
          Height = 21
          HelpContext = 753
          Color = clBtnFace
          DataField = 'ADDRESSTO'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            '10, rue du Fg Montmartre 75009 Paris'
            'Mondragone, Viale Margherita, 14')
          TabOrder = 10
        end
        object AddressToDBComboBox: TDBComboBox
          Tag = -2
          Left = 159
          Top = 140
          Width = 450
          Height = 21
          HelpContext = 753
          Color = clBtnFace
          DataField = 'ADDRESSTO'
          DataSource = DataSrc
          ItemHeight = 13
          Items.Strings = (
            '10, rue du Fg Montmartre 75009 Paris'
            'Mondragone, Viale Margherita, 14')
          TabOrder = 11
        end
      end
      object VisaTabSheet: TTabSheet
        Caption = 'Візи і транзит'
        ImageIndex = 1
        object Label20: TLabel
          Left = 8
          Top = 104
          Width = 33
          Height = 13
          Caption = 'З дати'
        end
        object Label21: TLabel
          Left = 8
          Top = 128
          Width = 39
          Height = 13
          Caption = 'По дату'
        end
        object VisaGroupBox: TGroupBox
          Left = 8
          Top = 8
          Width = 480
          Height = 65
          Caption = 'Для чого запрошується віза'
          TabOrder = 0
          object VisaDBCheckBox1: TDBCheckBox
            Left = 8
            Top = 24
            Width = 153
            Height = 17
            Caption = 'Короткочас. перебування'
            DataSource = DataSrc
            TabOrder = 0
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object VisaDBCheckBox3: TDBCheckBox
            Left = 320
            Top = 24
            Width = 153
            Height = 17
            Caption = 'Транзит через аеропорт'
            DataSource = DataSrc
            TabOrder = 2
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object VisaDBCheckBox4: TDBCheckBox
            Left = 8
            Top = 40
            Width = 145
            Height = 17
            Caption = 'Одноразовий в'#39'їзд'
            DataSource = DataSrc
            TabOrder = 3
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object VisaDBCheckBox2: TDBCheckBox
            Left = 164
            Top = 24
            Width = 153
            Height = 17
            Caption = 'Транзит'
            DataSource = DataSrc
            TabOrder = 1
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object VisaDBCheckBox5: TDBCheckBox
            Left = 164
            Top = 40
            Width = 153
            Height = 17
            Caption = 'Одноразовий в'#39'їзд'
            DataSource = DataSrc
            TabOrder = 4
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
          object VisaDBCheckBox6: TDBCheckBox
            Left = 320
            Top = 40
            Width = 153
            Height = 17
            Caption = 'Одноразовий в'#39'їзд'
            DataSource = DataSrc
            TabOrder = 5
            ValueChecked = 'True'
            ValueUnchecked = 'False'
          end
        end
        object DBVisaFrom: TDBEdit
          Left = 56
          Top = 100
          Width = 89
          Height = 21
          HelpContext = 741
          Color = clInfoBk
          DataField = 'LASTVISITDATE'
          DataSource = DataSrc
          MaxLength = 8
          TabOrder = 1
        end
        object DBVisaTo: TDBEdit
          Left = 56
          Top = 124
          Width = 89
          Height = 21
          HelpContext = 741
          Color = clInfoBk
          DataField = 'LASTEMBASSYDATE'
          DataSource = DataSrc
          MaxLength = 8
          TabOrder = 2
        end
        object GroupBox1: TGroupBox
          Left = 160
          Top = 80
          Width = 153
          Height = 73
          TabOrder = 3
          object Label3: TLabel
            Left = 8
            Top = 24
            Width = 33
            Height = 13
            Caption = 'З дати'
          end
          object Label4: TLabel
            Left = 8
            Top = 48
            Width = 39
            Height = 13
            Caption = 'По дату'
          end
          object DBNationalVisaFrom: TDBEdit
            Left = 56
            Top = 20
            Width = 89
            Height = 21
            HelpContext = 741
            Color = clInfoBk
            DataSource = DataSrc
            MaxLength = 8
            TabOrder = 0
          end
          object DBNationalVisaTo: TDBEdit
            Left = 56
            Top = 44
            Width = 89
            Height = 21
            HelpContext = 741
            Color = clInfoBk
            DataSource = DataSrc
            MaxLength = 8
            TabOrder = 1
          end
        end
        object NationalVisaDBCheckBox: TDBCheckBox
          Left = 168
          Top = 76
          Width = 110
          Height = 17
          Caption = 'Національна віза'
          DataSource = DataSrc
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 160
          Width = 433
          Height = 41
          Caption = 'У разі транзиту:'
          TabOrder = 5
          object Label5: TLabel
            Left = 96
            Top = 16
            Width = 154
            Height = 13
            Caption = 'Країна кінцевого призначення'
          end
          object EndDestCountryDBComboBox: TDBComboBox
            Left = 256
            Top = 12
            Width = 169
            Height = 21
            Color = clInfoBk
            DataSource = DataSrc
            ItemHeight = 13
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited CtrlPanel: TPanel
    Top = 277
    Width = 626
    object Label6: TLabel [0]
      Left = 8
      Top = 11
      Width = 131
      Height = 13
      Caption = 'Дата оформлення анкети'
    end
    inherited OkBtn: TBitBtn
      Left = 447
    end
    inherited CancelBtn: TBitBtn
      Left = 534
    end
    object DBWriteDate: TDBEdit
      Left = 144
      Top = 7
      Width = 89
      Height = 21
      HelpContext = 741
      Color = clInfoBk
      DataField = 'LASTVISITDATE'
      DataSource = DataSrc
      MaxLength = 8
      TabOrder = 2
    end
  end
  object DrvKindQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select DriveKind, Kind from DrvKinds'
      'order by Kind')
    Left = 445
    Top = 225
    object DrvKindQryDRIVEKIND: TIntegerField
      FieldName = 'DRIVEKIND'
    end
    object DrvKindQryKIND: TStringField
      FieldName = 'KIND'
      Size = 15
    end
  end
  object DrvKindQrySrc: TDataSource
    DataSet = DrvKindQry
    Left = 461
    Top = 241
  end
end
