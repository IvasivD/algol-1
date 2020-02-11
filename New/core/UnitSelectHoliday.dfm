object FrmSelectHoliday: TFrmSelectHoliday
  Left = 698
  Top = 187
  Width = 314
  Height = 286
  Caption = #1047#1072#1075#1072#1083#1100#1085#1086#1085#1072#1094#1110#1086#1085#1072#1083#1100#1085#1110' '#1089#1074#1103#1090#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel
    Left = 8
    Top = 9
    Width = 30
    Height = 13
    Caption = #1053#1072#1079#1074#1072
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 215
    Width = 298
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      298
      33)
    object OkBtn: TBitBtn
      Left = 121
      Top = 5
      Width = 80
      Height = 25
      HelpContext = 801
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 209
      Top = 5
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object EdOficialName: TcxTextEdit
    Left = 8
    Top = 24
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Width = 283
  end
  inline FrameMoveToTimeZone: TFrameMoveToTimeZone
    Left = 19
    Top = 67
    Width = 236
    Height = 104
    TabOrder = 2
  end
  object RbCheckByReligionDate: TcxRadioButton
    Left = 8
    Top = 175
    Width = 246
    Height = 17
    Caption = #1044#1072#1090#1072' '#1074#1080#1079#1085#1072#1095#1072#1108#1090#1089#1103' '#1079#1072' '#1088#1077#1083#1110#1075#1110#1081#1085#1080#1084' '#1082#1072#1083#1077#1085#1076#1072#1088#1077#1084
    TabOrder = 3
    OnClick = RbCheckByReligionDateClick
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
  end
  object EdHolidayByReligiCalendar: TcxTextEdit
    Left = 8
    Top = 193
    Style.Color = clInfoBk
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Width = 283
  end
  object RbHolidayByData: TcxRadioButton
    Left = 8
    Top = 52
    Width = 60
    Height = 17
    Caption = #1044#1072#1090#1072
    Checked = True
    TabOrder = 5
    TabStop = True
    OnClick = RbHolidayByDataClick
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
  end
end
