object DMServIB: TDMServIB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 485
  Top = 127
  Height = 560
  Width = 1253
  object CITY_ADM_UNIT_ImgQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'Select * from CITY_ADM_UNIT_IMG where ID_CITY_ADM_UNIT = :ID')
    Left = 64
    Top = 16
    object CITY_ADM_UNIT_ImgQryID: TIntegerField
      FieldName = 'ID'
    end
    object CITY_ADM_UNIT_ImgQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
    object CITY_ADM_UNIT_ImgQryFILENAME: TStringField
      FieldName = 'FILENAME'
      Size = 200
    end
    object CITY_ADM_UNIT_ImgQryAORDER: TIntegerField
      FieldName = 'AORDER'
    end
    object CITY_ADM_UNIT_ImgQryDESCRIPT: TMemoField
      FieldName = 'DESCRIPT'
      BlobType = ftMemo
    end
    object CITY_ADM_UNIT_ImgQrySHOWWEB: TIntegerField
      FieldName = 'SHOWWEB'
    end
  end
  object CITY_ADM_UNIT_ImgSrc: TDataSource
    DataSet = CITY_ADM_UNIT_ImgQry
    Left = 64
    Top = 64
  end
  object CITY_ADM_UNIT_SUB_RELQry: TADOQuery
    Connection = DMServDic.ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from CITY_ADM_UNIT_SUB_REL where ID_CITY_ADM_UNIT = :ID')
    Left = 233
    Top = 15
    object CITY_ADM_UNIT_SUB_RELQryID: TIntegerField
      FieldName = 'ID'
    end
    object CITY_ADM_UNIT_SUB_RELQryID_CITY_ADM_UNIT: TIntegerField
      FieldName = 'ID_CITY_ADM_UNIT'
    end
    object CITY_ADM_UNIT_SUB_RELQryID_ADM_UNIT_SUB: TIntegerField
      FieldName = 'ID_ADM_UNIT_SUB'
    end
  end
  object CITY_AMIN_UNIT_SUB_RELSrc: TDataSource
    DataSet = CITY_ADM_UNIT_SUB_RELQry
    Left = 233
    Top = 63
  end
end
