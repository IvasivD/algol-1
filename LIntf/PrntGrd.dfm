object PrintGridPropertyDlg: TPrintGridPropertyDlg
  Left = 469
  Top = 283
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = #1044#1088#1091#1082' '#1090#1072#1073#1083#1080#1094#1110
  ClientHeight = 483
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  DesignSize = (
    479
    483)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 102
    Height = 13
    Caption = #1044#1088#1091#1082#1091#1074#1072#1090#1080' '#1082#1086#1083#1086#1085#1082#1080':'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 13
    Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
  end
  object CheckAllBtn: TSpeedButton
    Tag = 1
    Left = 8
    Top = 418
    Width = 89
    Height = 22
    Hint = '|'#1055#1086#1084#1110#1090#1080#1090#1080' '#1074#1089#1110' '#1082#1086#1083#1086#1085#1082#1080
    Anchors = [akLeft, akBottom]
    Caption = #1055#1086#1084#1110#1090#1080#1090#1080' '#1074#1089#1077
    Flat = True
    OnClick = CheckAllBtnClick
  end
  object UncheckAllBtn: TSpeedButton
    Left = 98
    Top = 418
    Width = 89
    Height = 22
    Hint = '|'#1047#1085#1103#1090#1080' '#1074#1089#1110' '#1087#1086#1084#1110#1090#1082#1080
    Anchors = [akLeft, akBottom]
    Caption = #1047#1085#1103#1090#1080' '#1074#1089#1077
    Flat = True
    OnClick = CheckAllBtnClick
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 450
    Width = 479
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      479
      33)
    object OkBtn: TBitBtn
      Left = 299
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 389
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object TitleEdit: TEdit
    Left = 8
    Top = 24
    Width = 463
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    TabOrder = 1
  end
  object CheckListBox: TCheckListBox
    Left = 8
    Top = 72
    Width = 463
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clInfoBk
    Columns = 2
    ItemHeight = 13
    TabOrder = 2
  end
end
