object TripDetailPersonListForm: TTripDetailPersonListForm
  Left = 322
  Top = 167
  Width = 696
  Height = 479
  BorderIcons = [biSystemMenu]
  Caption = 'Список туристів на рейс %s - %s, %s'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object PersonListDBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 419
    Align = alClient
    Color = clInfoBk
    DataSource = DetailListQuerySrc
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clHighlight
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = PersonListDBGridCellClick
    OnDblClick = PersonListDBGridDblClick
    OnKeyUp = PersonListDBGridKeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'PLACENO'
        Title.Alignment = taCenter
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOURISTNAME'
        Title.Alignment = taCenter
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOURISTNAMEEN'
        Title.Alignment = taCenter
        Width = 156
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOURISTBIRTHDATE'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOURISTPASSPORT'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTNAME'
        Title.Alignment = taCenter
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STARTPOINT'
        Title.Alignment = taCenter
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STOPPOINT'
        Title.Alignment = taCenter
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FROMDATE'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DAYCOUNT'
        Title.Alignment = taCenter
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESORTNAME'
        Title.Alignment = taCenter
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOTELNAME'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOUCHERNO'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RETURNDATE'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BKWPLACENO'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 13434828
        Expanded = False
        FieldName = 'TOTALPAID'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 13434828
        Expanded = False
        FieldName = 'TOTALPAID2'
        Title.Alignment = taCenter
        Width = 76
        Visible = True
      end
      item
        Color = 16768511
        Expanded = False
        FieldName = 'CalcDue'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clHighlight
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Color = 16768511
        Expanded = False
        FieldName = 'CalcDue2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clHighlight
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TRIPTOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'TRIPTOTAL2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HOTELTOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'HOTELTOTAL2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INSURETOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRMTOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'OTHERTOTAL2'
        Title.Alignment = taCenter
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RESORTTOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Color = 15073262
        Expanded = False
        FieldName = 'RESORTTOTAL2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsItalic]
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CalcMemo'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object Panel7: TPanel
    Left = 0
    Top = 419
    Width = 688
    Height = 33
    Align = alBottom
    Alignment = taLeftJustify
    BevelOuter = bvNone
    BorderWidth = 8
    TabOrder = 1
    object CloseBtn: TBitBtn
      Left = 597
      Top = 5
      Width = 81
      Height = 24
      Hint = '|Закрити детальний список туристів'
      Anchors = [akTop, akRight]
      Caption = 'Закрити'
      ModalResult = 1
      TabOrder = 0
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333333333333FFF3333333333333
        00333333333333FF77F3333333333300903333333333FF773733333333330099
        0333333333FF77337F3333333300999903333333FF7733337333333700999990
        3333333777333337F3333333099999903333333373F333373333333330999903
        33333333F7F3337F33333333709999033333333F773FF3733333333709009033
        333333F7737737F3333333709073003333333F77377377F33333370907333733
        33333773773337333333309073333333333337F7733333333333370733333333
        3333377733333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object DetailListQuerySrc: TDataSource
    DataSet = DetailListQuery
    Left = 16
    Top = 419
  end
  object DetailListQuery: TQuery
    OnCalcFields = DetailListQueryCalcFields
    DatabaseName = 'Tour'
    DataSource = DM.TripQrySrc
    SQL.Strings = (
      'select * from PLACE_N_ROOM_SEL_PROC (:LeavingId)'
      'order by OrderId')
    Left = 48
    Top = 419
    ParamData = <
      item
        DataType = ftInteger
        Name = 'LeavingId'
        ParamType = ptUnknown
      end>
    object DetailListQueryLEAVINGID: TIntegerField
      FieldName = 'LEAVINGID'
    end
    object DetailListQueryPLACEID: TIntegerField
      FieldName = 'PLACEID'
    end
    object DetailListQueryPLACENO: TStringField
      Alignment = taCenter
      DisplayLabel = 'М.туди'
      FieldName = 'PLACENO'
      Size = 8
    end
    object DetailListQueryORDERID: TIntegerField
      FieldName = 'ORDERID'
    end
    object DetailListQueryCLIENTNAME: TStringField
      DisplayLabel = 'Замовник'
      FieldName = 'CLIENTNAME'
      Size = 35
    end
    object DetailListQueryPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object DetailListQueryTOURISTNAME: TStringField
      DisplayLabel = 'Турист'
      FieldName = 'TOURISTNAME'
      Size = 35
    end
    object DetailListQueryTOURISTNAMEEN: TStringField
      DisplayLabel = 'Tourist'
      FieldName = 'TOURISTNAMEEN'
      Size = 35
    end
    object DetailListQueryTOURISTBIRTHDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Дата нар.'
      DisplayWidth = 10
      FieldName = 'TOURISTBIRTHDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DetailListQueryTOURISTPASSPORT: TStringField
      DisplayLabel = 'Паспорт №'
      FieldName = 'TOURISTPASSPORT'
      Size = 10
    end
    object DetailListQuerySTARTPOINT: TStringField
      DisplayLabel = 'Їде з'
      FieldName = 'STARTPOINT'
      Size = 30
    end
    object DetailListQuerySTOPPOINT: TStringField
      DisplayLabel = 'Їде до'
      FieldName = 'STOPPOINT'
      Size = 30
    end
    object DetailListQueryFROMDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'З дати'
      DisplayWidth = 10
      FieldName = 'FROMDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DetailListQueryDAYCOUNT: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Днів'
      FieldName = 'DAYCOUNT'
    end
    object DetailListQueryRESORTNAME: TStringField
      DisplayLabel = 'Курорт'
      FieldName = 'RESORTNAME'
      Size = 25
    end
    object DetailListQueryHOTELNAME: TStringField
      DisplayLabel = 'Готель'
      FieldName = 'HOTELNAME'
      Size = 25
    end
    object DetailListQueryVOUCHERNO: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ваучер №'
      FieldName = 'VOUCHERNO'
      Size = 10
    end
    object DetailListQueryRETURNDATE: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Дата назад'
      DisplayWidth = 10
      FieldName = 'RETURNDATE'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object DetailListQueryBKWPLACENO: TStringField
      Alignment = taCenter
      DisplayLabel = 'М.назад'
      FieldName = 'BKWPLACENO'
      Size = 24
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
      DisplayLabel = 'Готель грн'
      FieldName = 'HOTELTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryHOTELTOTAL2: TFloatField
      DisplayLabel = 'Готель $'
      FieldName = 'HOTELTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTRANSFERTOTAL: TFloatField
      FieldName = 'TRANSFERTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTRANSFERTOTAL2: TFloatField
      FieldName = 'TRANSFERTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryVISATOTAL: TFloatField
      FieldName = 'VISATOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryVISATOTAL2: TFloatField
      FieldName = 'VISATOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryEXCURSIONTOTAL: TFloatField
      FieldName = 'EXCURSIONTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryEXCURSIONTOTAL2: TFloatField
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
      DisplayLabel = 'Кур.зб.грн.'
      FieldName = 'RESORTTOTAL'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryRESORTTOTAL2: TFloatField
      DisplayLabel = 'Кур.зб.$'
      FieldName = 'RESORTTOTAL2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTOTALPAID: TFloatField
      DisplayLabel = 'Оплачено грн.'
      FieldName = 'TOTALPAID'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryTOTALPAID2: TFloatField
      DisplayLabel = 'Оплачено $'
      FieldName = 'TOTALPAID2'
      DisplayFormat = '0.00;-0.00;0'
    end
    object DetailListQueryMEMO: TMemoField
      FieldName = 'MEMO'
      BlobType = ftMemo
      Size = 1
    end
    object DetailListQueryCalcMemo: TStringField
      DisplayLabel = 'Примітка'
      FieldKind = fkCalculated
      FieldName = 'CalcMemo'
      Size = 60
      Calculated = True
    end
    object DetailListQueryCalcDue: TCurrencyField
      DisplayLabel = 'Борг грн.'
      FieldKind = fkCalculated
      FieldName = 'CalcDue'
      DisplayFormat = '0.00;0.00;0'
      Calculated = True
    end
    object DetailListQueryCalcDue2: TCurrencyField
      DisplayLabel = 'Борг $'
      FieldKind = fkCalculated
      FieldName = 'CalcDue2'
      DisplayFormat = '0.00;0.00;0'
      Calculated = True
    end
  end
  object PopupMenu: TPopupMenu
    Left = 328
    Top = 248
    object CloseItem: TMenuItem
      Caption = 'Закрити'
      Hint = '|Закрити детальний список туристів'
      ShortCut = 27
      OnClick = CloseItemClick
    end
  end
end
