object Form1: TForm1
  Left = 819
  Top = 138
  Width = 267
  Height = 214
  Caption = 'Test Translate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Test'
    TabOrder = 0
    OnClick = Button1Click
  end
  object MemoRes: TMemo
    Left = 16
    Top = 56
    Width = 209
    Height = 89
    Lines.Strings = (
      'MemoRes')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 112
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
end
