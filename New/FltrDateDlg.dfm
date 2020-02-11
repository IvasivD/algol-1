inherited DateFltrDlg: TDateFltrDlg
  Left = 698
  Top = 249
  Caption = #1060#1110#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1110
  ClientHeight = 149
  ClientWidth = 218
  PixelsPerInch = 96
  TextHeight = 13
  object FromDateLabel: TLabel [0]
    Left = 8
    Top = 68
    Width = 33
    Height = 13
    Caption = #1047' '#1076#1072#1090#1080
  end
  object TillDateLabel: TLabel [1]
    Left = 8
    Top = 92
    Width = 39
    Height = 13
    Caption = #1055#1086' '#1076#1072#1090#1091
  end
  inherited CtrlPanel: TPanel
    Top = 116
    Width = 218
    TabOrder = 4
    inherited OkBtn: TBitBtn
      Left = 38
    end
    inherited CancelBtn: TBitBtn
      Left = 128
    end
  end
  object WithOutRadioButton: TRadioButton
    Left = 8
    Top = 13
    Width = 137
    Height = 17
    Caption = #1047#1085#1103#1090#1080' '#1092#1110#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1110
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadioButtonClick
  end
  object FilterRadioButton: TRadioButton
    Tag = 1
    Left = 8
    Top = 37
    Width = 137
    Height = 17
    Caption = #1042#1089#1090#1072#1085#1086#1074#1080#1090#1080' '#1087#1077#1088#1110#1086#1076
    TabOrder = 1
    OnClick = RadioButtonClick
  end
  object FromDatePicker: TcxDateEdit
    Left = 56
    Top = 64
    Properties.OnChange = FromDatePickerChange
    Style.BorderStyle = ebs3D
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Width = 88
  end
  object TillDatePicker: TcxDateEdit
    Left = 56
    Top = 88
    Properties.OnChange = FromDatePickerChange
    Style.BorderStyle = ebs3D
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Width = 88
  end
end
