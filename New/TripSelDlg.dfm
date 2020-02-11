object TripChooseDlg: TTripChooseDlg
  Left = 657
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'Вибір рейсу'
  ClientHeight = 309
  ClientWidth = 337
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SelTripDBGrid: TDBGrid
    Left = 0
    Top = 0
    Width = 337
    Height = 275
    Align = alClient
    Color = clInfoBk
    DataSource = TripSelSrc
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
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'LEAVEDATE'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHEDULENAME'
        Title.Alignment = taCenter
        Width = 138
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VACANTCOUNT'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 275
    Width = 337
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object OkBtn: TBitBtn
      Left = 172
      Top = 4
      Width = 74
      Height = 25
      Hint = 'Створити маршрут'
      Anchors = [akTop, akRight]
      Caption = 'ОК'
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 253
      Top = 4
      Width = 75
      Height = 25
      Hint = 'Відмовитися від створення маршруту'
      Anchors = [akTop, akRight]
      Caption = 'Відміна'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object TripSelQry: TQuery
    DatabaseName = 'Tour'
    Filter = 'LeaveDate > '#39'05.07.1999'#39
    Filtered = True
    DataSource = DM.RouteSrc
    SQL.Strings = (
      'select LeavingId, LeaveDate, VacantCount, SheduleName'
      
        'from  TRIP_VACANCES_PROC (:ParRouteId, :ParFromDate, :ParDirecti' +
        'on)'
      'order by LeaveDate')
    Left = 16
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ParRouteId'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ParFromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'ParDirection'
        ParamType = ptUnknown
      end>
    object TripSelQryLEAVINGID: TIntegerField
      FieldName = 'LEAVINGID'
    end
    object TripSelQryLEAVEDATE: TDateTimeField
      DisplayLabel = 'Виїзд'
      FieldName = 'LEAVEDATE'
      DisplayFormat = 'dd.mm.yyyy hh:nn'
    end
    object TripSelQryVACANTCOUNT: TIntegerField
      DisplayLabel = 'Вільно'
      FieldName = 'VACANTCOUNT'
    end
    object TripSelQrySHEDULENAME: TStringField
      DisplayLabel = 'По розкладу'
      FieldName = 'SHEDULENAME'
      Size = 40
    end
  end
  object TripSelSrc: TDataSource
    DataSet = TripSelQry
    Left = 31
    Top = 208
  end
end
