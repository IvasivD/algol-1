object FormProgres: TFormProgres
  Left = 623
  Top = 208
  BorderStyle = bsNone
  Caption = 'Wait'
  ClientHeight = 39
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = [fsBold]
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 0
    Top = 21
    Width = 339
    Height = 18
    Align = alClient
  end
  object ProgressBar: TProgressBar
    Left = 0
    Top = 21
    Width = 339
    Height = 18
    Align = alClient
    TabOrder = 0
  end
  object PanelCaption: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 21
    Align = alTop
    BevelOuter = bvLowered
    Color = 16366993
    TabOrder = 1
    object LbProgres: TLabel
      Left = 8
      Top = 4
      Width = 24
      Height = 13
      Caption = '      '
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object PanelProgressWait: TPanel
      Left = 317
      Top = 1
      Width = 21
      Height = 19
      Align = alRight
      BevelOuter = bvNone
      Color = 16366993
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
