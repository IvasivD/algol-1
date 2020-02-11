inherited ClientReportForm: TClientReportForm
  Left = 324
  Top = 245
  BorderIcons = [biSystemMenu, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Звіт по замовнику %s'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited ShowMemoBtn: TSpeedButton
      Visible = False
    end
  end
  inherited PersonListDBGrid: TDBGrid
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ORDERID'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATEANDTIME'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'RESERVTO'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CalcState'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Color = 16777040
        Expanded = False
        FieldName = 'TOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DISCOUNT'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DISCOUNTVALUE'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Color = 13434828
        Expanded = False
        FieldName = 'PAID'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 16777040
        Expanded = False
        FieldName = 'TOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DISCOUNT2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DISCOUNTVALUE2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Color = 13434828
        Expanded = False
        FieldName = 'PAID2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRIPTOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'TRIPTOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOTELTOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'HOTELTOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRANSFERTOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'TRANSFERTOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VISATOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'VISATOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCURSIONTOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'EXCURSIONTOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSURETOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRMTOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'OTHERTOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESORTTOTAL'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'RESORTTOTAL2'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited DetailListQuery: TQuery
    OnCalcFields = DetailListQueryCalcFields
    SQL.Strings = (
      'select * from SEL_CLIENT_PAYMENT_PROC (:ClientId)'
      'where state <> 5')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ClientId'
        ParamType = ptUnknown
      end>
    object DetailListQueryORDERID: TIntegerField
      DisplayLabel = 'Зам.№'
      FieldName = 'ORDERID'
    end
    object DetailListQueryDATEANDTIME: TDateTimeField
      DisplayLabel = 'Дата замовлення'
      FieldName = 'DATEANDTIME'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object DetailListQueryRESERVTO: TDateTimeField
      DisplayLabel = 'Бронь до'
      FieldName = 'RESERVTO'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object DetailListQueryTOTAL: TFloatField
      DisplayLabel = 'Всього грн.'
      FieldName = 'TOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryDISCOUNT: TFloatField
      DisplayLabel = 'Зниж.%'
      FieldName = 'DISCOUNT'
    end
    object DetailListQueryDISCOUNTVALUE: TFloatField
      DisplayLabel = 'Знижка грн.'
      FieldName = 'DISCOUNTVALUE'
    end
    object DetailListQueryPAID: TFloatField
      DisplayLabel = 'Оплач. грн.'
      FieldName = 'PAID'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTOTAL2: TFloatField
      DisplayLabel = 'Всього $'
      FieldName = 'TOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryDISCOUNT2: TFloatField
      DisplayLabel = 'Зниж.% $'
      FieldName = 'DISCOUNT2'
    end
    object DetailListQueryDISCOUNTVALUE2: TFloatField
      DisplayLabel = 'Знижка $'
      FieldName = 'DISCOUNTVALUE2'
    end
    object DetailListQueryPAID2: TFloatField
      DisplayLabel = 'Оплач. $'
      FieldName = 'PAID2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQuerySTATE: TSmallintField
      DisplayLabel = 'Стан'
      FieldName = 'STATE'
    end
    object DetailListQueryTRIPTOTAL: TFloatField
      DisplayLabel = 'Проїзд грн.'
      FieldName = 'TRIPTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTRIPTOTAL2: TFloatField
      DisplayLabel = 'Проїзд $'
      FieldName = 'TRIPTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryHOTELTOTAL: TFloatField
      DisplayLabel = 'Готель грн.'
      FieldName = 'HOTELTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryHOTELTOTAL2: TFloatField
      DisplayLabel = 'Готель $'
      FieldName = 'HOTELTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTRANSFERTOTAL: TFloatField
      DisplayLabel = 'Трансф.грн.'
      FieldName = 'TRANSFERTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTRANSFERTOTAL2: TFloatField
      DisplayLabel = 'Трансф.$'
      FieldName = 'TRANSFERTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryVISATOTAL: TFloatField
      DisplayLabel = 'Віза грн.'
      FieldName = 'VISATOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryVISATOTAL2: TFloatField
      DisplayLabel = 'Віза $'
      FieldName = 'VISATOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryEXCURSIONTOTAL: TFloatField
      DisplayLabel = 'Екск. грн.'
      FieldName = 'EXCURSIONTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryEXCURSIONTOTAL2: TFloatField
      DisplayLabel = 'Екск. $'
      FieldName = 'EXCURSIONTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryINSURETOTAL: TFloatField
      DisplayLabel = 'Страх. грн.'
      FieldName = 'INSURETOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryFIRMTOTAL: TFloatField
      DisplayLabel = 'Послуги грн.'
      FieldName = 'FIRMTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryOTHERTOTAL2: TFloatField
      DisplayLabel = 'Послуги $'
      FieldName = 'OTHERTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryRESORTTOTAL: TFloatField
      DisplayLabel = 'Кур.зб. грн.'
      FieldName = 'RESORTTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryRESORTTOTAL2: TFloatField
      DisplayLabel = 'Кур.зб. $'
      FieldName = 'RESORTTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryCalcState: TStringField
      DisplayLabel = 'Стан'
      FieldKind = fkCalculated
      FieldName = 'CalcState'
      Size = 14
      Calculated = True
    end
  end
end
