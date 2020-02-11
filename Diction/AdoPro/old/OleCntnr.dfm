object OleContainerForm: TOleContainerForm
  Left = 307
  Top = 136
  AutoScroll = False
  Caption = 'OleContainerForm'
  ClientHeight = 688
  ClientWidth = 791
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TopToolPanel: TPanel
    Left = 0
    Top = 0
    Width = 791
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
  end
  object ContainerPanel: TPanel
    Left = 0
    Top = 41
    Width = 791
    Height = 606
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object OleContainer: TOleContainer
      Left = 4
      Top = 4
      Width = 783
      Height = 598
      AutoActivate = aaManual
      Align = alClient
      SizeMode = smAutoSize
      TabOrder = 0
      Visible = False
    end
  end
  object BottomToolPanel: TPanel
    Left = 0
    Top = 647
    Width = 791
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
  object MainMenu: TMainMenu
    Left = 48
    Top = 16
    object FileMenu: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object FileShellOpenItem: TMenuItem
        Caption = '&'#1042#1110#1076#1082#1088#1080#1090#1080' '#1086#1082#1088#1077#1084#1086
        OnClick = FileShellOpenItemClick
      end
      object FileSeparatorItem1: TMenuItem
        Caption = '-'
      end
      object FileCloseItem: TMenuItem
        Caption = #1047#1072#1082#1088#1080#1090#1080
        ShortCut = 16499
        OnClick = FileCloseItemClick
      end
    end
  end
end
