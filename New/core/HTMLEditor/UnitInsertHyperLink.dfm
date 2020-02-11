object FrmInsertHyperLink: TFrmInsertHyperLink
  Left = 747
  Top = 239
  BorderStyle = bsDialog
  Caption = #1051#1110#1085#1082
  ClientHeight = 174
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 507
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      507
      37)
    object SbtOK: TSpeedButton
      Left = 329
      Top = 8
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      Caption = 'OK'
      OnClick = SbtOKClick
    end
    object SbtClose: TSpeedButton
      Left = 417
      Top = 8
      Width = 81
      Height = 24
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      OnClick = SbtCloseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 137
    Align = alClient
    TabOrder = 1
    DesignSize = (
      507
      137)
    object Label8: TLabel
      Left = 22
      Top = 23
      Width = 48
      Height = 13
      Caption = #1042#1077#1073' '#1083#1110#1085#1082' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 22
      Top = 55
      Width = 36
      Height = 13
      Caption = #1058#1077#1082#1089#1090' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 22
      Top = 87
      Width = 52
      Height = 13
      Caption = #1055#1110#1076#1082#1072#1079#1082#1072' :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdLinkUrl: TcxTextEdit
      Left = 98
      Top = 20
      Anchors = [akLeft, akTop, akRight]
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 394
    end
    object EdLinkText: TcxTextEdit
      Left = 98
      Top = 52
      Anchors = [akLeft, akTop, akRight]
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 394
    end
    object EdLinkToolTip: TcxTextEdit
      Left = 98
      Top = 84
      Anchors = [akLeft, akTop, akRight]
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Width = 394
    end
    object ChShowInNewWindow: TcxCheckBox
      Left = 96
      Top = 112
      Caption = #1042#1110#1076#1082#1088#1080#1074#1072#1090#1080' '#1074' '#1085#1086#1074#1086#1084#1091' '#1074#1110#1082#1085#1110
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 169
    end
  end
end
