inherited ManagerPasswDlg: TManagerPasswDlg
  Caption = #1047#1084#1110#1085#1072' '#1087#1072#1088#1086#1083#1102
  ClientHeight = 226
  ClientWidth = 257
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 72
    Width = 75
    Height = 13
    Caption = #1057#1090#1072#1088#1080#1081' '#1087#1072#1088#1086#1083#1100
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 112
    Width = 71
    Height = 13
    Caption = #1053#1086#1074#1080#1081' '#1087#1072#1088#1086#1083#1100
  end
  object Label4: TLabel [2]
    Left = 8
    Top = 143
    Width = 80
    Height = 26
    Caption = #1055#1110#1076#1090#1074#1077#1088#1076#1078#1077#1085#1085#1103' '#1085#1086#1074#1086#1075#1086' '#1087#1072#1088#1086#1083#1102
    WordWrap = True
  end
  object NameLabel: TLabel [3]
    Left = 8
    Top = 16
    Width = 64
    Height = 13
    Caption = 'NameLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel [4]
    Left = 8
    Top = 44
    Width = 241
    Height = 9
    Shape = bsTopLine
  end
  inherited CtrlPanel: TPanel
    Top = 193
    Width = 257
    TabOrder = 3
    inherited OkBtn: TBitBtn
      Left = 77
    end
    inherited CancelBtn: TBitBtn
      Left = 167
    end
  end
  object OldTextEdit: TEdit
    Left = 96
    Top = 68
    Width = 153
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    MaxLength = 24
    PasswordChar = '*'
    TabOrder = 0
  end
  object NewTextEdit: TEdit
    Left = 96
    Top = 108
    Width = 153
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    MaxLength = 24
    PasswordChar = '*'
    TabOrder = 1
  end
  object ConfirmTextEdit: TEdit
    Left = 96
    Top = 148
    Width = 153
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    MaxLength = 24
    PasswordChar = '*'
    TabOrder = 2
  end
end
