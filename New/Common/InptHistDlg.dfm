object InputHistoryDlg: TInputHistoryDlg
  Left = 408
  Top = 108
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  ClientHeight = 164
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PromptLabel: TLabel
    Left = 8
    Top = 24
    Width = 59
    Height = 13
    Caption = 'PromptLabel'
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 130
    Width = 336
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object OkBtn: TBitBtn
      Left = 159
      Top = 5
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OÊ'
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 246
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Â³äì³íà'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object ComboBox: TComboBox
    Left = 8
    Top = 40
    Width = 321
    Height = 21
    Color = clInfoBk
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnExit = ComboBoxExit
  end
end
