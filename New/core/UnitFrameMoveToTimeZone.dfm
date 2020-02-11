object FrameMoveToTimeZone: TFrameMoveToTimeZone
  Left = 0
  Top = 0
  Width = 236
  Height = 104
  TabOrder = 0
  object PanelMain: TPanel
    Left = 0
    Top = 0
    Width = 236
    Height = 104
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 16
      Width = 33
      Height = 13
      Caption = #1052#1110#1089#1103#1094#1100
    end
    object LbDayTimeZoneMove: TLabel
      Left = 56
      Top = 73
      Width = 64
      Height = 13
      Caption = #1063#1080#1089#1083#1086' '#1084#1110#1089#1103#1094#1103
    end
    object Label9: TLabel
      Left = 196
      Top = 45
      Width = 31
      Height = 13
      Caption = #1084#1110#1089#1103#1094#1103
    end
    object RbCheckByWeekMonth: TcxRadioButton
      Left = 19
      Top = 43
      Width = 17
      Height = 17
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RbCheckByWeekMonthClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
    object CmDayForMonth: TcxImageComboBox
      Left = 96
      Top = 42
      Properties.Items = <
        item
          ImageIndex = 0
        end>
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
      Width = 97
    end
    object RbCheckByDay: TcxRadioButton
      Left = 19
      Top = 71
      Width = 17
      Height = 17
      TabOrder = 2
      OnClick = RbCheckByWeekMonthClick
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
    end
    object CmbMoveTimeZoneMonth: TcxImageComboBox
      Left = 47
      Top = 13
      Properties.Items = <>
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 146
    end
    object CmWeekForMonth: TcxImageComboBox
      Left = 47
      Top = 42
      EditValue = 0
      Properties.Items = <
        item
          Description = '1'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = '2'
          Value = 2
        end
        item
          Description = '3'
          Value = 3
        end
        item
          Description = '4'
          Value = 4
        end
        item
          Description = #1086#1089#1090'.'
          Value = 0
        end>
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
      Width = 50
    end
    object EdDayTimeZoneMove: TcxImageComboBox
      Left = 128
      Top = 70
      Properties.Items = <>
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Width = 65
    end
  end
end
