inherited EmbassyListForm: TEmbassyListForm
  Left = 1213
  Top = 278
  Caption = 'EmbassyListForm'
  ClientWidth = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited CtrlPanel: TPanel
    Width = 483
    inherited OkBtn: TBitBtn
      Left = 303
    end
    inherited CancelBtn: TBitBtn
      Left = 393
    end
  end
  object EmbassyCheckListBox: TCheckListBox
    Tag = 4
    Left = 0
    Top = 0
    Width = 483
    Height = 203
    Align = alClient
    Color = clInfoBk
    ItemHeight = 13
    TabOrder = 1
  end
  object EmbassyListQry: TIBQuery
    Database = DMServ.IBDatabase
    Transaction = DMServ.IBTransact
    SQL.Strings = (
      
        'select distinct Co.CompanyId, Co.Name || '#39', '#39' || Ci.Name as Emba' +
        'ssyName, E.EmbassyID'
      '  from Companies Co'
      
        '  left join  CntrEmbassies E on   E.EmbassyId = Co.CompanyId and' +
        ' E.OurEmbassy = :OurEmbassy and E.CountryId = :EmbassCntrId,'
      '       CompOffices O, Cities Ci'
      ' where Co.AsAmbas = '#39'T'#39
      '   and O.CompanyId = Co.CompanyId and O.CountryId = :CountryId'
      '   and Ci.CityId = O.CityId'
      '   and E.ParentId is null'
      ' order by Co.Name, Ci.Name')
    Left = 68
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'OurEmbassy'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EmbassCntrId'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CountryId'
        ParamType = ptUnknown
      end>
    object EmbassyListQryCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object EmbassyListQryEMBASSYID: TIntegerField
      FieldName = 'EMBASSYID'
    end
    object EmbassyListQryEMBASSYNAME: TIBStringField
      DisplayLabel = #1055#1088#1077#1076#1089#1090#1072#1074#1085#1080#1094#1090#1074#1086
      FieldName = 'EMBASSYNAME'
      ProviderFlags = []
      Size = 292
    end
  end
end
