object AddressDlg: TAddressDlg
  Left = 250
  Top = 201
  BorderStyle = bsDialog
  Caption = #1040#1076#1088#1077#1089#1072
  ClientHeight = 194
  ClientWidth = 611
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
  object CtrlPanel: TPanel
    Left = 0
    Top = 161
    Width = 611
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      611
      33)
    object CancelBtn: TBitBtn
      Left = 519
      Top = 5
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 0
      OnClick = CancelBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object OkBtn: TBitBtn
      Left = 432
      Top = 5
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1050
      TabOrder = 1
      OnClick = OkBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object WorkPanel: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 161
    HelpContext = 8050
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      611
      161)
    object Bevel1: TBevel
      Left = 8
      Top = 98
      Width = 595
      Height = 9
      Anchors = [akLeft, akRight, akBottom]
      Shape = bsTopLine
    end
    object OfficeNameLabel: TLabel
      Left = 8
      Top = 112
      Width = 60
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1053#1072#1079#1074#1072' '#1086#1092#1110#1089#1091
    end
    object Label1: TLabel
      Left = 9
      Top = 137
      Width = 26
      Height = 13
      Caption = #1058#1077#1089#1090' '
    end
    object OfficeNameDBEdit: TcxTextEdit
      Left = 78
      Top = 108
      Anchors = [akLeft, akRight, akBottom]
      Style.Color = clInfoBk
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 524
    end
    object IsDefaultDBCheckBox: TcxCheckBox
      Left = 75
      Top = 132
      Anchors = [akLeft, akBottom]
      Caption = #1054#1089#1085#1086#1074#1085#1072' '#1072#1076#1088#1077#1089#1072
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 110
    end
    object HeadOfficeDBCheckBox: TcxCheckBox
      Left = 187
      Top = 132
      Anchors = [akLeft, akBottom]
      Caption = #1070#1088#1080#1076#1080#1095#1085#1072' '#1072#1076#1088#1077#1089#1072
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 121
    end
    object MailOfficeDBCheckBox: TcxCheckBox
      Left = 307
      Top = 132
      Anchors = [akLeft, akBottom]
      Caption = #1040#1076#1088#1077#1089#1072' '#1076#1083#1103' '#1083#1080#1089#1090#1091#1074#1072#1085#1085#1103
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 150
    end
    object SalePoint: TcxCheckBox
      Left = 459
      Top = 132
      Anchors = [akLeft, akBottom]
      Caption = #1058#1086#1095#1082#1072' '#1087#1088#1086#1076#1072#1078#1091
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Width = 102
    end
    inline FrAddress: TFrAddress
      Left = 1
      Top = 1
      Width = 609
      Height = 105
      Align = alTop
      TabOrder = 5
      inherited Label1: TLabel
        Width = 33
      end
      inherited Label3: TLabel
        Width = 54
      end
      inherited Label5: TLabel
        Width = 19
      end
      inherited LbCityDistrict: TLabel
        Width = 58
      end
    end
  end
end