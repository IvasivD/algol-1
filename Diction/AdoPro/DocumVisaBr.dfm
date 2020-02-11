object DocumVisaEditDlg: TDocumVisaEditDlg
  Left = 942
  Top = 138
  Width = 444
  Height = 360
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1080' '#1085#1072' '#1074#1110#1079#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object LinkQry: TIBQuery
    SQL.Strings = (
      'Select Link, TypeId, ViewName TypeName, VisaDocLinkId'
      'From VisaDocLinks L'
      'left join Docum_Type_Visa_View V on V.ViewId = L.TypeId'
      'where DocId = :ViewId')
    Left = 10
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ViewId'
        ParamType = ptUnknown
      end>
    object LinkQryLINK: TStringField
      DisplayLabel = #1051#1110#1085#1082
      FieldName = 'LINK'
      Size = 255
    end
    object LinkQryTypeName: TStringField
      DisplayLabel = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
      FieldName = 'TypeName'
      Size = 75
    end
    object LinkQryTYPEID: TIntegerField
      FieldName = 'TYPEID'
    end
    object LinkQryVISADOCLINKID: TIntegerField
      FieldName = 'VISADOCLINKID'
    end
  end
  object LinkSrc: TDataSource
    DataSet = LinkQry
    Left = 70
    Top = 156
  end
end
