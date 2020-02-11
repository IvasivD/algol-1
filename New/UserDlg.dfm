object UserAutentifyDlg: TUserAutentifyDlg
  Left = 478
  Top = 111
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsDialog
  Caption = 'Ваше ім'#39'я'
  ClientHeight = 83
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 144
    Height = 13
    Caption = 'Виберіть Ваше ім'#39'я зі списку'
  end
  object ManagerDBLookupComboBox: TDBLookupComboBox
    Left = 164
    Top = 14
    Width = 159
    Height = 21
    Anchors = [akTop, akRight]
    Color = clInfoBk
    KeyField = 'TMUSERID'
    ListField = 'TMUSERNAME'
    ListSource = DM.UsersSrc
    TabOrder = 0
    OnClick = ManagerDBLookupComboBoxClick
    OnCloseUp = ManagerDBLookupComboBoxClick
  end
  object OkBtn: TBitBtn
    Left = 164
    Top = 52
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Enabled = False
    TabOrder = 1
    Kind = bkOK
  end
  object CancelBtn: TBitBtn
    Left = 248
    Top = 52
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Відміна'
    TabOrder = 2
    Kind = bkCancel
  end
end
