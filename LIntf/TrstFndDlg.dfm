inherited ZTouristFindDlg: TZTouristFindDlg
  Left = 381
  Top = 478
  Caption = #1055#1086#1096#1091#1082
  ClientHeight = 419
  ClientWidth = 771
  OldCreateOrder = True
  OnActivate = FormActivate
  DesignSize = (
    771
    419)
  PixelsPerInch = 96
  TextHeight = 13
  inherited CtrlPanel: TPanel
    Top = 386
    Width = 771
    TabOrder = 1
    DesignSize = (
      771
      33)
    inherited OkBtn: TBitBtn
      Left = 591
      Enabled = False
      TabOrder = 1
    end
    inherited CancelBtn: TBitBtn
      Left = 681
      TabOrder = 2
    end
    object FindBtn: TBitBtn
      Left = 8
      Top = 5
      Width = 82
      Height = 25
      Hint = #1047#1085#1072#1081#1090#1080' '#1074#1078#1077
      Caption = #1047#1085'&'#1072#1081#1090#1080
      Enabled = False
      TabOrder = 0
      OnClick = FindBtnClick
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        77777000000077777777777777777000000070000077777000007000000070B0
        00777770F0007000000070F000777770B0007000000070000000700000007000
        0000700B000000B0000070000000700F000700F0000070000000700B000700B0
        0000700000007700000000000007700000007770B00070B00077700000007770
        0000700000777000000077770007770007777000000077770B07770B07777000
        0000777700077700077770000000777777777777777770000000777777777777
        777770000000}
    end
  end
  object ChooseGroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 755
    Height = 113
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    DesignSize = (
      755
      113)
    object OrderNoRadioButton: TRadioButton
      Left = 8
      Top = 18
      Width = 138
      Height = 17
      Caption = #1055#1086' &'#1085#1086#1084#1077#1088#1091' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103
      TabOrder = 0
      TabStop = True
      OnClick = OrderRadioButtonClick
    end
    object ClientNameRadioButton: TRadioButton
      Tag = 1
      Left = 320
      Top = 18
      Width = 92
      Height = 17
      Caption = #1055#1086' &'#1079#1072#1084#1086#1074#1085#1080#1082#1091
      Checked = True
      TabOrder = 2
      TabStop = True
      OnClick = OrderRadioButtonClick
    end
    object OrderDateRadioButton: TRadioButton
      Tag = 2
      Left = 8
      Top = 50
      Width = 186
      Height = 17
      Caption = #1055#1086' &'#1076#1072#1090#1110' '#1086#1092#1086#1088#1084#1083#1077#1085#1085#1103' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103
      Enabled = False
      TabOrder = 4
      TabStop = True
      OnClick = OrderRadioButtonClick
    end
    object OrderDatePicker: TDateTimePicker
      Left = 208
      Top = 48
      Width = 97
      Height = 21
      Date = 36740.811365092600000000
      Time = 36740.811365092600000000
      Color = clBtnFace
      Enabled = False
      TabOrder = 5
    end
    object TouristNameRadioButton: TRadioButton
      Tag = 3
      Left = 320
      Top = 50
      Width = 74
      Height = 17
      Caption = #1055#1086' &'#1090#1091#1088#1080#1089#1090#1091
      TabOrder = 6
      TabStop = True
      OnClick = OrderRadioButtonClick
    end
    object SearchAcceptBtn: TBitBtn
      Left = 665
      Top = 78
      Width = 82
      Height = 25
      Hint = 
        #1042#1080#1073#1088#1072#1090#1080' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103'|'#1042#1080#1073#1088#1072#1090#1080' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103', '#1074' '#1103#1082#1080#1093' '#1079#1085#1072#1081#1076#1077#1085#1086' '#1090#1091#1088#1080#1089#1090#1072' (' +
        #1090#1091#1088#1080#1089#1090#1110#1074')'
      Anchors = [akRight, akBottom]
      Caption = #1042#1080#1073#1088#1072#1090#1080
      Enabled = False
      TabOrder = 9
      OnClick = SearchAcceptBtnClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000014000000140000000100
        040000000000F000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333300003333333333333300333300003333333333333333333300003333
        3333333333003333000033033333333333003333000030003333333333300333
        00000F000333333330330033000030F000333333300330030000330F00000007
        3300003300003330F0078887033333330000333300788FF87033333300003333
        0788888F877333330000333308888888F80333330000333307888888F8033333
        00003333078FF8888803333300003333777FF888877333330000333330778888
        7033333300003333330777770333333300003333333700073333333300003333
        33333333333333330000}
    end
    object OrderNoComboBox: TAzComboBox
      Left = 160
      Top = 16
      Width = 145
      Height = 21
      History = True
      OnChange = OrderNoComboBoxChange
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
      OnExit = ClientNameComboBoxExit
      OnKeyDown = OrderNoComboBoxKeyDown
    end
    object ClientNameComboBox: TAzComboBox
      Left = 420
      Top = 16
      Width = 327
      Height = 21
      History = True
      OnChange = OrderNoComboBoxChange
      ItemHeight = 13
      TabOrder = 3
      OnExit = ClientNameComboBoxExit
      OnKeyDown = OrderNoComboBoxKeyDown
    end
    object TouristNameComboBox: TAzComboBox
      Left = 420
      Top = 48
      Width = 327
      Height = 21
      History = True
      OnChange = OrderNoComboBoxChange
      Color = clBtnFace
      Enabled = False
      ItemHeight = 13
      TabOrder = 7
      OnExit = ClientNameComboBoxExit
      OnKeyDown = OrderNoComboBoxKeyDown
    end
    object ExtraFindCheckBox: TCheckBox
      Left = 8
      Top = 82
      Width = 275
      Height = 17
      Hint = 
        #1064#1091#1082#1072#1090#1080' '#1074#1074#1077#1076#1077#1085#1080#1081' '#1090#1077#1082#1089#1090' '#1085#1077' '#1090#1110#1083#1100#1082#1080' '#1089#1087#1086#1095#1072#1090#1082#1091', '#1072' '#1081' '#1074#1089#1077#1088#1077#1076#1080#1085#1110' '#1074#1080#1073#1088#1072#1085#1086#1075 +
        #1086' '#1087#1086#1083#1103
      Caption = #1064#1091#1082#1072#1090#1080' '#1074#1074#1077#1076#1077#1085#1080#1081' '#1090'&'#1077#1082#1089#1090' '#1074#1089#1077#1088#1077#1076#1080#1085#1110' '#1074#1080#1073#1088#1072#1085#1086#1075#1086' '#1087#1086#1083#1103
      TabOrder = 8
    end
  end
  object TouristFoundDBGrid: TSvtDBGrid
    Left = 8
    Top = 136
    Width = 755
    Height = 245
    Color = clInfoBk
    DataSource = SearchTouristQrySrc
    Enabled = False
    FixedColsNum = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    SortedColIndex = -1
    AllowSortedCols = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = TouristFoundDBGridDrawColumnCell
    OnSortedChange = TouristFoundDBGridSortedChange
    Columns = <
      item
        Expanded = False
        FieldName = 'ORDERID'
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORDERDATE'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTNAME'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOURISTNAME'
        Width = 132
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BIRTHDATE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COUNTRY'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FROMDATE'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TILLDATE'
        Width = 65
        Visible = True
      end>
  end
  object SearchTouristQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select OrderId, OrderDate, OrderState, OrderState2, ClientName,'
      '  TourGroupId, CountryId, PersVisaId,'
      
        '  PersonId, TouristName, BirthDate, FromDate, TillDate, Country,' +
        ' Manager'
      'from Visa_find_sel_proc'
      'order by OrderId, PersonId')
    Left = 72
    Top = 280
    object SearchTouristQryORDERID: TIntegerField
      Alignment = taCenter
      DisplayLabel = #1047#1072#1084' '#8470
      FieldName = 'ORDERID'
    end
    object SearchTouristQryORDERDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103
      FieldName = 'ORDERDATE'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object SearchTouristQryTOURGROUPID: TIntegerField
      FieldName = 'TOURGROUPID'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object SearchTouristQryPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object SearchTouristQryTOURISTNAME: TStringField
      DisplayLabel = #1058#1091#1088#1080#1089#1090
      FieldName = 'TOURISTNAME'
      Size = 61
    end
    object SearchTouristQryBIRTHDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1088'.'
      FieldName = 'BIRTHDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object SearchTouristQryFROMDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1047' '#1076#1072#1090#1080
      FieldName = 'FROMDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object SearchTouristQryTILLDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = #1055#1086' '#1076#1072#1090#1091
      FieldName = 'TILLDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object SearchTouristQryMANAGER: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      FieldName = 'MANAGER'
      Size = 51
    end
    object SearchTouristQryCLIENTNAME: TStringField
      DisplayLabel = #1047#1072#1084#1086#1074#1085#1080#1082
      FieldName = 'CLIENTNAME'
      Size = 60
    end
    object SearchTouristQryORDERSTATE: TIntegerField
      FieldName = 'ORDERSTATE'
    end
    object SearchTouristQryORDERSTATE2: TIntegerField
      FieldName = 'ORDERSTATE2'
    end
  end
  object SearchTouristQrySrc: TDataSource
    DataSet = SearchTouristQry
    Left = 88
    Top = 296
  end
end
