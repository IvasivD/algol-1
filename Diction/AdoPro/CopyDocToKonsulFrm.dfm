object CopyDocToKonsulForm: TCopyDocToKonsulForm
  Left = 490
  Top = 132
  Width = 372
  Height = 234
  Caption = #1056#1086#1079#1084#1085#1086#1078#1077#1085#1085#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  DesignSize = (
    356
    196)
  PixelsPerInch = 96
  TextHeight = 13
  object CopyLabel: TLabel
    Left = 8
    Top = 12
    Width = 332
    Height = 30
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'CopyLabel'
    WordWrap = True
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 33
    Height = 13
    Caption = #1050#1088#1072#1111#1085#1072
  end
  object AllKonsulRBtn: TRadioButton
    Left = 8
    Top = 81
    Width = 113
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1059' '#1074#1089#1110' '#1082#1086#1085#1089#1091#1083#1100#1089#1090#1074#1072
    Checked = True
    TabOrder = 1
    TabStop = True
    OnClick = OneKonsulRBtnClick
  end
  object OneKonsulRBtn: TRadioButton
    Left = 8
    Top = 106
    Width = 167
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = #1042' '#1082#1086#1085#1082#1088#1077#1090#1085#1077' '#1082#1086#1085#1089#1091#1083#1100#1089#1090#1074#1086
    TabOrder = 3
    OnClick = OneKonsulRBtnClick
  end
  object EmbassyComboBox: TAzComboBox
    Left = 8
    Top = 128
    Width = 339
    Height = 21
    OnChange = EmbassyComboBoxChange
    Style = csDropDownList
    Anchors = [akLeft, akBottom]
    Color = clBtnFace
    Enabled = False
    ItemHeight = 13
    TabOrder = 2
  end
  object CountryComboBox: TAzComboBox
    Left = 46
    Top = 52
    Width = 160
    Height = 21
    OnChange = CountryComboBoxChange
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 161
    Width = 356
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      356
      35)
    object OkBtn: TBitBtn
      Left = 176
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Visible = False
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 265
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object CountryQry: TIBQuery
    Transaction = Transaction
    SQL.Strings = (
      'select Distinct C.CountryId, C.Name'
      'from Countries C'
      'left join CntrEmbassies E on E.CountryId = C.CountryId'
      
        'where E.CountryId is not null and E.InProvince is not null and E' +
        '.InProvince <> '#39#39
      'Order By C.Name')
    Left = 143
    Top = 53
    object CountryQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"COUNTRIES"."COUNTRYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CountryQryNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"COUNTRIES"."NAME"'
      Size = 30
    end
  end
  object EmbassyQry: TIBQuery
    Transaction = Transaction
    DataSource = CountrySrc
    SQL.Strings = (
      'select C.CompanyId, Ci.Name ||'#39', '#39'|| C.Name as EmbassyName'
      '              from CntrEmbassies E'
      '              left join Companies C on C.CompanyId = E.EmbassyId'
      
        '              left join CompOffices Co on Co.CompanyId = C.Compa' +
        'nyId and Co.IsDefault = '#39'T'#39
      
        '              left join city_adm_unit Ci on Ci.Id = Co.ID_CITY_A' +
        'DM_UNIT'
      '              where E.CountryId = :CountryId'
      '              and E.OurEmbassy = '#39'F'#39
      
        '              and ( (E.InProvince is not null) and (E.InProvince' +
        ' <> '#39#39') or (E.ForOwnerVisa = '#39'T'#39')  )'
      '              order by Ci.Name, C.Name')
    Left = 11
    Top = 130
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CountryId'
        ParamType = ptUnknown
      end>
    object EmbassyQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
      Origin = '"COMPANIES"."COMPANYID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object EmbassyQryEMBASSYNAME: TIBStringField
      FieldName = 'EMBASSYNAME'
      ProviderFlags = []
      Size = 292
    end
  end
  object Transaction: TIBTransaction
    Left = 253
    Top = 87
  end
  object CountrySrc: TDataSource
    DataSet = CountryQry
    Left = 191
    Top = 53
  end
end
