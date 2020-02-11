object RoomsEditDlg: TRoomsEditDlg
  Left = 517
  Top = 205
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'Бронювання готелю %s'
  ClientHeight = 205
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RequestPlaceCountLabel1: TLabel
    Left = 8
    Top = 11
    Width = 68
    Height = 13
    Alignment = taRightJustify
    Caption = 'Забронювати'
    WordWrap = True
  end
  object RequestPlaceCountLabel2: TLabel
    Left = 136
    Top = 11
    Width = 28
    Height = 13
    Caption = 'місць'
  end
  object Label10: TLabel
    Left = 39
    Top = 50
    Width = 33
    Height = 13
    Caption = 'З дати'
  end
  object Label11: TLabel
    Left = 39
    Top = 76
    Width = 37
    Height = 13
    Caption = 'по дату'
  end
  object RequestDayCountLabel: TLabel
    Left = 136
    Top = 113
    Width = 20
    Height = 13
    Caption = 'днів'
  end
  object Label13: TLabel
    Left = 12
    Top = 113
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'Проживання'
  end
  object Label17: TLabel
    Left = 24
    Top = 139
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Оплата за'
  end
  object ForPayDayCountLabel: TLabel
    Left = 136
    Top = 139
    Width = 20
    Height = 13
    Caption = 'днів'
  end
  object Label14: TLabel
    Left = 192
    Top = 11
    Width = 62
    Height = 13
    Caption = 'Розміщення'
  end
  object Label15: TLabel
    Left = 192
    Top = 38
    Width = 59
    Height = 13
    Caption = 'Харчування'
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 172
    Width = 467
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object OkBtn: TBitBtn
      Left = 288
      Top = 5
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OК'
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 375
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Відміна'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object RequestPlaceCountEdit: TSpinEdit
    Left = 83
    Top = 8
    Width = 44
    Height = 22
    Color = clInfoBk
    MaxValue = 999
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object RequestFromDatePicker: TDateTimePicker
    Left = 83
    Top = 46
    Width = 82
    Height = 21
    CalAlignment = dtaLeft
    Date = 36299.5833333333
    Time = 36299.5833333333
    Color = clInfoBk
    DateFormat = dfShort
    DateMode = dmComboBox
    Kind = dtkDate
    ParseInput = False
    TabOrder = 2
    OnCloseUp = RequestFromDatePickerChange
    OnChange = RequestFromDatePickerChange
  end
  object RequestToDatePicker: TDateTimePicker
    Left = 83
    Top = 72
    Width = 82
    Height = 21
    CalAlignment = dtaLeft
    Date = 36299.5833217593
    Time = 36299.5833217593
    Color = clInfoBk
    DateFormat = dfShort
    DateMode = dmComboBox
    Enabled = False
    Kind = dtkDate
    ParseInput = False
    TabOrder = 3
  end
  object RequestDayCountEdit: TSpinEdit
    Left = 83
    Top = 108
    Width = 44
    Height = 22
    Hint = '|Кількість ночей, на яку замовляється проживання'
    Color = clInfoBk
    MaxValue = 999
    MinValue = 1
    TabOrder = 4
    Value = 3
    OnChange = RequestDayCountEditClick
    OnClick = RequestDayCountEditClick
  end
  object ForPayDayCountEdit: TSpinEdit
    Left = 83
    Top = 134
    Width = 44
    Height = 22
    Hint = '|Це поле використовується для визначення екстрасів'
    Color = clInfoBk
    MaxValue = 999
    MinValue = 1
    TabOrder = 5
    Value = 3
    OnChange = ForPayDayCountEditChange
    OnClick = ForPayDayCountEditChange
  end
  object RoomDBLookupComboBox: TDBLookupComboBox
    Left = 264
    Top = 8
    Width = 137
    Height = 21
    Color = clInfoBk
    KeyField = 'HotelRoomId'
    ListField = 'CalcRoom'
    ListSource = DM.RoomSrc
    TabOrder = 6
  end
  object FeedDBLookupComboBox: TDBLookupComboBox
    Left = 264
    Top = 34
    Width = 73
    Height = 21
    Color = clInfoBk
    KeyField = 'FEEDTYPEID'
    ListField = 'FEEDNAME'
    ListSource = DM.FeedSrc
    TabOrder = 7
  end
  object HotelRateGroupBox: TGroupBox
    Left = 197
    Top = 72
    Width = 262
    Height = 84
    Caption = 'Ціна проживання за 1 місце (тариф)'
    TabOrder = 8
    object Label19: TLabel
      Left = 16
      Top = 30
      Width = 64
      Height = 13
      Caption = 'Оплата:   тут'
    end
    object Label20: TLabel
      Left = 61
      Top = 54
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'там'
    end
    object HotelRateEdit1: TEdit
      Left = 88
      Top = 26
      Width = 73
      Height = 21
      Color = clInfoBk
      TabOrder = 0
      OnKeyPress = HotelRateEditKeyPress
    end
    object HotelRateEdit2: TEdit
      Left = 88
      Top = 50
      Width = 73
      Height = 21
      Color = clInfoBk
      TabOrder = 1
      OnKeyPress = HotelRateEditKeyPress
    end
    object HotelRateRadioButton1: TRadioButton
      Left = 184
      Top = 28
      Width = 57
      Height = 17
      Caption = 'за добу'
      Checked = True
      TabOrder = 2
      TabStop = True
    end
    object HotelRateRadioButton2: TRadioButton
      Left = 184
      Top = 52
      Width = 57
      Height = 17
      Caption = 'разом'
      TabOrder = 3
    end
  end
end
