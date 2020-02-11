inherited CountryChooseDlg: TCountryChooseDlg
  Left = 615
  Top = 323
  Caption = 'Вибір країни'
  ClientWidth = 209
  PixelsPerInch = 96
  TextHeight = 13
  inherited SelTripDBGrid: TDBGrid
    Width = 209
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited BottomPanel: TPanel
    Width = 209
    inherited OkBtn: TBitBtn
      Left = 44
    end
    inherited CancelBtn: TBitBtn
      Left = 125
    end
  end
  inherited SelQry: TQuery
    SQL.Strings = (
      'select CountryId, Name from Countries'
      'order by Name')
    object SelQryCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
    end
    object SelQryNAME: TStringField
      DisplayLabel = 'Назва країни'
      FieldName = 'NAME'
      Size = 30
    end
  end
end
