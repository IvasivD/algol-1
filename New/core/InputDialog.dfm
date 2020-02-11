object FrmInputDialog: TFrmInputDialog
  Left = 778
  Top = 282
  BorderStyle = bsDialog
  Caption = 'Fmr Caption'
  ClientHeight = 111
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    284
    111)
  PixelsPerInch = 96
  TextHeight = 13
  object PromptLabel: TLabel
    Left = 8
    Top = 24
    Width = 59
    Height = 13
    Caption = 'PromptLabel'
  end
  object EndDescript: TLabel
    Left = 258
    Top = 49
    Width = 17
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1082#1084'.'
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 78
    Width = 284
    Height = 33
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      284
      33)
    object OkBtn: TBitBtn
      Left = 104
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 194
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object EdValue: TcxTextEdit
    Left = 7
    Top = 45
    Anchors = [akLeft, akTop, akRight]
    Style.Color = clInfoBk
    TabOrder = 1
    Text = 'EdValue'
    Width = 269
  end
end
