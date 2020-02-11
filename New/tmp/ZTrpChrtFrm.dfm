inherited ZTripViewChartForm: TZTripViewChartForm
  Left = 337
  Top = 199
  Width = 727
  Height = 516
  BorderStyle = bsSizeToolWin
  Caption = 'Аналіз проживання'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TopPanel: TPanel
    Width = 719
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 35
      Height = 13
      Caption = 'Курорт'
    end
    object ShowGridBtn: TSpeedButton
      Left = 568
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Таблиця|Показати / сховати таблицю'
      AllowAllUp = True
      Anchors = [akTop, akRight]
      GroupIndex = 2
      Flat = True
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000DDDDDDDDDDDDDDDDD0000000D444444444444444D0000000D4FF
        FFFFFFFFFFF4D0000000D4F000F000F000F4D0000000D4FFFFFFFFFFFFF4D000
        0000D4F000F000F000F4D0000000D4FFFFFFFFFFFFF4D0000000D4F000F000F0
        00F4D0000000D4FFFFFFFFFFFFF4D0000000D4F000F000F000F4D0000000D4FF
        FFFFFFFFFFF4D0000000D444444444444444D0000000D4F444F444F444F4D000
        0000D444444444444444D0000000DDDDDDDDDDDDDDDDD0000000DDDDDDDDDDDD
        DDDDD0000000}
      OnClick = ShowGridBtnClick
    end
    object PrintChartBtn: TSpeedButton
      Left = 616
      Top = 6
      Width = 23
      Height = 22
      Hint = 'Друк графіка|Друкувати графік'
      Anchors = [akTop, akRight]
      Flat = True
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000004000
        000080000000FF000000002000004020000080200000FF200000004000004040
        000080400000FF400000006000004060000080600000FF600000008000004080
        000080800000FF80000000A0000040A0000080A00000FFA0000000C0000040C0
        000080C00000FFC0000000FF000040FF000080FF0000FFFF0000000020004000
        200080002000FF002000002020004020200080202000FF202000004020004040
        200080402000FF402000006020004060200080602000FF602000008020004080
        200080802000FF80200000A0200040A0200080A02000FFA0200000C0200040C0
        200080C02000FFC0200000FF200040FF200080FF2000FFFF2000000040004000
        400080004000FF004000002040004020400080204000FF204000004040004040
        400080404000FF404000006040004060400080604000FF604000008040004080
        400080804000FF80400000A0400040A0400080A04000FFA0400000C0400040C0
        400080C04000FFC0400000FF400040FF400080FF4000FFFF4000000060004000
        600080006000FF006000002060004020600080206000FF206000004060004040
        600080406000FF406000006060004060600080606000FF606000008060004080
        600080806000FF80600000A0600040A0600080A06000FFA0600000C0600040C0
        600080C06000FFC0600000FF600040FF600080FF6000FFFF6000000080004000
        800080008000FF008000002080004020800080208000FF208000004080004040
        800080408000FF408000006080004060800080608000FF608000008080004080
        800080808000FF80800000A0800040A0800080A08000FFA0800000C0800040C0
        800080C08000FFC0800000FF800040FF800080FF8000FFFF80000000A0004000
        A0008000A000FF00A0000020A0004020A0008020A000FF20A0000040A0004040
        A0008040A000FF40A0000060A0004060A0008060A000FF60A0000080A0004080
        A0008080A000FF80A00000A0A00040A0A00080A0A000FFA0A00000C0A00040C0
        A00080C0A000FFC0A00000FFA00040FFA00080FFA000FFFFA0000000C0004000
        C0008000C000FF00C0000020C0004020C0008020C000FF20C0000040C0004040
        C0008040C000FF40C0000060C0004060C0008060C000FF60C0000080C0004080
        C0008080C000FF80C00000A0C00040A0C00080A0C000FFA0C00000C0C00040C0
        C00080C0C000FFC0C00000FFC00040FFC00080FFC000FFFFC0000000FF004000
        FF008000FF00FF00FF000020FF004020FF008020FF00FF20FF000040FF004040
        FF008040FF00FF40FF000060FF004060FF008060FF00FF60FF000080FF004080
        FF008080FF00FF80FF0000A0FF0040A0FF0080A0FF00FFA0FF0000C0FF0040C0
        FF0080C0FF00FFC0FF0000FFFF0040FFFF0080FFFF00FFFFFF00E3E3E3E3E3E3
        E3E3E3E3E3E3E3E3E3E3E3E30000000000000000000000E3E3E3E300DBDBDBDB
        DBDBDBDBDB00DB00E3E300000000000000000000000000DB00E300DBDBDBDBDB
        DBFCFCFCDBDB000000E300DBDBDBDBDBDB929292DBDB00DB00E3000000000000
        00000000000000DBDB0000DBDBDBDBDBDBDBDBDBDB00DB00DB00E30000000000
        0000000000DB00DB0000E3E300FFFFFFFFFFFFFFFF00DB00DB00E3E3E300FF00
        00000000FF00000000E3E3E3E300FFFFFFFFFFFFFFFF00E3E3E3E3E3E3E300FF
        0000000000FF00E3E3E3E3E3E3E300FFFFFFFFFFFFFFFF00E3E3E3E3E3E3E300
        0000000000000000E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3}
      OnClick = ChartPrintActionExecute
    end
    object CitiesDBLookupComboBox: TDBLookupComboBox
      Left = 64
      Top = 6
      Width = 417
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      KeyField = 'CITYID'
      ListField = 'CITYNAME'
      ListSource = CitiesSrc
      TabOrder = 0
      OnCloseUp = CitiesDBLookupComboBoxCloseUp
    end
  end
  inherited BottomPanel: TPanel
    Top = 456
    Width = 719
    object Label3: TLabel [0]
      Left = 8
      Top = 10
      Width = 33
      Height = 13
      Caption = 'З дати'
    end
    object Label2: TLabel [1]
      Left = 152
      Top = 10
      Width = 39
      Height = 13
      Caption = 'По дату'
    end
    inherited CloseBtn: TBitBtn
      Left = 629
    end
    object FromDatePicker: TDateTimePicker
      Left = 48
      Top = 6
      Width = 81
      Height = 21
      CalAlignment = dtaLeft
      Date = 37062.5328594907
      Time = 37062.5328594907
      Color = clInfoBk
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
      OnChange = FromDatePickerChange
    end
    object TillDatePicker: TDateTimePicker
      Left = 200
      Top = 6
      Width = 81
      Height = 21
      CalAlignment = dtaLeft
      Date = 37062.5328594907
      Time = 37062.5328594907
      Color = clInfoBk
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
      OnChange = TillDatePickerChange
    end
  end
  object DBChart: TDBChart [2]
    Left = 0
    Top = 33
    Width = 719
    Height = 423
    BackImageMode = pbmTile
    BackWall.Brush.Color = clWhite
    LeftWall.Brush.Color = clWhite
    MarginBottom = 1
    MarginLeft = 1
    MarginRight = 1
    MarginTop = 1
    Title.Text.Strings = (
      'TDBChart')
    BottomAxis.DateTimeFormat = 'dd.mm yyyy'
    BottomAxis.Increment = 0.000694444444444444
    BottomAxis.LabelsMultiLine = True
    BottomAxis.LabelStyle = talValue
    Legend.Alignment = laBottom
    Legend.ShadowColor = clGray
    Legend.TopPos = 20
    Legend.VertMargin = 12
    TopAxis.DateTimeFormat = 'h:mm'
    View3D = False
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    Align = alClient
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 112
      Top = 112
      Width = 497
      Height = 113
      Color = clInfoBk
      DataSource = SelRouteQrySrc
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clHighlight
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Visible = False
    end
    object Series1: TPieSeries
      Active = False
      Marks.ArrowLength = 8
      Marks.Visible = False
      DataSource = SelRoomingQry
      SeriesColor = clRed
      XLabelsSource = 'HOTELNAME'
      OtherSlice.Text = 'Other'
      PieValues.DateTime = False
      PieValues.Name = 'Pie'
      PieValues.Multiplier = 1
      PieValues.Order = loNone
      PieValues.ValueSource = 'COUNT'
    end
    object Series2: TBarSeries
      ColorEachPoint = True
      Marks.ArrowLength = 20
      Marks.Visible = True
      DataSource = SelRoomingQry
      SeriesColor = 16744448
      XLabelsSource = 'HOTELNAME'
      BarStyle = bsRectGradient
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Bar'
      YValues.Multiplier = 1
      YValues.Order = loNone
      YValues.ValueSource = 'COUNT'
    end
  end
  inherited DetailListQuery: TQuery
    DataSource = SelRouteQrySrc
  end
  inherited ActionList: TActionList
    object ChartPrintAction: TAction
      Caption = 'Друк графіка'
      Hint = 'Друк графіка|Роздрукувати графік'
      OnExecute = ChartPrintActionExecute
    end
  end
  object SelRouteQrySrc: TDataSource
    DataSet = SelRoomingQry
    Left = 352
    Top = 16
  end
  object SelRoomingQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select count( roomingid ), ROOMING_SEL_PROC2.HotelName'
      'from ROOMING_SEL_PROC2'
      'WHERE cityid = :cityid'
      
        'AND (  (FromDate >= :DPar AND FromDate < :DPar1) OR ( (FromDate+' +
        'DayCount) > :DPar AND (FromDate+DayCount ) <= :DPar1 ) OR (  Fro' +
        'mDate <= :DPar  AND  (FromDate+DayCount) > :DPar1 ) )'
      'group by ROOMING_SEL_PROC2.HotelName'
      'order by ROOMING_SEL_PROC2.HotelName                    '
      ' ')
    Left = 384
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cityid'
        ParamType = ptUnknown
        Value = '21'
      end
      item
        DataType = ftDateTime
        Name = 'DPar'
        ParamType = ptUnknown
        Value = '01.01.2001'
      end
      item
        DataType = ftDateTime
        Name = 'DPar1'
        ParamType = ptUnknown
        Value = '01.12.2001'
      end
      item
        DataType = ftDateTime
        Name = 'DPar'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DPar1'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DPar'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DPar1'
        ParamType = ptUnknown
      end>
  end
  object CitiesQry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select distinct'
      'cities.name as cityname,'
      'cities.cityid'
      'from htlrooming'
      '    left join hotels on hotels.hotelid=htlrooming.hotelid'
      '    left join cities on cities.cityid = hotels.cityid'
      'order by cities.name')
    Left = 48
    Top = 49
  end
  object CitiesSrc: TDataSource
    DataSet = CitiesQry
    Left = 16
    Top = 41
  end
end
