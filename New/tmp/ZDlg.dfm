object ZDialog: TZDialog
  Left = 973
  Top = 708
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'ZDialog'
  ClientHeight = 242
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object CtrlPanel: TPanel
    Left = 0
    Top = 209
    Width = 299
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      299
      33)
    object OkBtn: TBitBtn
      Left = 119
      Top = 5
      Width = 80
      Height = 25
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
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
