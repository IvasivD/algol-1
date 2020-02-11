inherited OrderBillListForm: TOrderBillListForm
  BorderIcons = [biSystemMenu, biHelp]
  Caption = 'Звіт про оплату по платіжних документах'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ReportListDBGrid: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'ORDERID'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTNAME'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BILLNO'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BILLDATE'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURRENCYSHORT'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURRENCYRATE'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAID'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DUE'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PAYDATE'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CalcMethod'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CREDITCARD'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANAGER'
        PickList.Strings = ()
        Title.Alignment = taCenter
        Width = 103
        Visible = True
      end>
  end
  inherited RepListQuery: TQuery
    OnCalcFields = RepListQueryCalcFields
    SQL.Strings = (
      'select B.* from Order_bill_Sel_Proc B, Orders O'
      'where O.OrderId = B.OrderId and O.State <> 5'
      'order by B.OrderId')
    object RepListQueryORDERID: TIntegerField
      DisplayLabel = 'Зам.№'
      FieldName = 'ORDERID'
    end
    object RepListQueryCLIENTNAME: TStringField
      DisplayLabel = 'Замовник'
      FieldName = 'CLIENTNAME'
      Size = 35
    end
    object RepListQueryBILLID: TIntegerField
      FieldName = 'BILLID'
    end
    object RepListQueryBILLNO: TStringField
      DisplayLabel = 'Рах.№'
      FieldName = 'BILLNO'
      Size = 16
    end
    object RepListQueryBILLDATE: TDateTimeField
      DisplayLabel = 'Дата опл.'
      DisplayWidth = 10
      FieldName = 'BILLDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object RepListQueryCURRENCYSHORT: TStringField
      DisplayLabel = 'Гр.од.'
      FieldName = 'CURRENCYSHORT'
      Size = 4
    end
    object RepListQueryCURRENCYRATE: TFloatField
      DisplayLabel = 'Курс'
      FieldName = 'CURRENCYRATE'
      DisplayFormat = '0.00;-0.00;0'
    end
    object RepListQueryPAID: TFloatField
      DisplayLabel = 'Сума'
      FieldName = 'PAID'
      DisplayFormat = '0.00;-0.00;0'
    end
    object RepListQueryDUE: TFloatField
      DisplayLabel = 'Борг'
      FieldName = 'DUE'
      DisplayFormat = '0.00;-0.00;0'
    end
    object RepListQueryPAYDATE: TDateTimeField
      DisplayLabel = 'Дата'
      FieldName = 'PAYDATE'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object RepListQueryPAYMETHOD: TSmallintField
      FieldName = 'PAYMETHOD'
    end
    object RepListQueryCREDITCARD: TStringField
      DisplayLabel = 'Картка'
      FieldName = 'CREDITCARD'
      Size = 7
    end
    object RepListQueryMANAGER: TStringField
      DisplayLabel = 'Менеджер'
      FieldName = 'MANAGER'
      Size = 15
    end
    object RepListQueryCalcMethod: TStringField
      DisplayLabel = 'Вид оплати'
      FieldKind = fkCalculated
      FieldName = 'CalcMethod'
      Size = 8
      Calculated = True
    end
  end
end
