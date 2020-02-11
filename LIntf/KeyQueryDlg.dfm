inherited ZDialog1: TZDialog1
  Caption = ''
  ClientHeight = 103
  ClientWidth = 315
  PixelsPerInch = 96
  TextHeight = 13
  object PromptLabel: TLabel [0]
    Left = 8
    Top = 16
    Width = 59
    Height = 13
    Caption = 'PromptLabel'
  end
  inherited CtrlPanel: TPanel
    Top = 70
    Width = 315
    inherited OkBtn: TBitBtn
      Left = 135
    end
    inherited CancelBtn: TBitBtn
      Left = 225
    end
  end
  object Edit: TEdit
    Left = 8
    Top = 32
    Width = 299
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    MaxLength = 10
    PasswordChar = '*'
    TabOrder = 1
  end
end
