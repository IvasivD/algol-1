inherited InsureKindChooseDlg: TInsureKindChooseDlg
  Caption = 'Вибір виду страхування'
  ClientWidth = 267
  PixelsPerInch = 96
  TextHeight = 13
  inherited SelTripDBGrid: TDBGrid
    Width = 267
    Columns = <
      item
        Expanded = False
        FieldName = 'KINDNAME'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited BottomPanel: TPanel
    Width = 267
    inherited OkBtn: TBitBtn
      Left = 102
    end
    inherited CancelBtn: TBitBtn
      Left = 183
    end
  end
  inherited SelQry: TQuery
    SQL.Strings = (
      'select KindId, KindName from INSURE_KINDS_VIEW'
      'order by OrderInCategory')
    object SelQryKINDID: TIntegerField
      FieldName = 'KINDID'
    end
    object SelQryKINDNAME: TStringField
      DisplayLabel = 'Види страхування'
      FieldName = 'KINDNAME'
      Size = 40
    end
  end
end
