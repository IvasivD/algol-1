object FrmUpdateImages: TFrmUpdateImages
  Left = 636
  Top = 248
  Width = 736
  Height = 388
  Caption = #1060#1086#1090#1086#1075#1088#1072#1092#1110#1111
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ModalPanel: TPanel
    Left = 0
    Top = 317
    Width = 720
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      720
      33)
    object CancelBtn: TBitBtn
      Left = 633
      Top = 4
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      Kind = bkCancel
    end
  end
  inline FrameUpdateImages: TFrameUpdateImages
    Left = 0
    Top = 0
    Width = 720
    Height = 317
    Align = alClient
    TabOrder = 1
    inherited PanelLeft: TPanel
      Height = 292
      inherited GridImgList: TcxGrid
        Height = 158
      end
      inherited Panel3: TPanel
        Top = 158
      end
      inherited MemDescript: TcxDBMemo
        Top = 179
      end
    end
    inherited Panel9: TPanel
      Width = 720
    end
    inherited Panel2: TPanel
      Width = 390
      Height = 292
      inherited Panel4: TPanel
        Width = 390
      end
      inherited ViewImage: TcxImage
        Height = 271
        Width = 390
      end
    end
    inherited cxGridViewRepository: TcxGridViewRepository
      inherited ViewImgList: TcxGridDBTableView
        inherited ViewImgListColumnOrder: TcxGridDBColumn
          Properties.ReadOnly = False
        end
        inherited ViewImgListColumnFileName: TcxGridDBColumn
          Tag = 5
          Properties.OnButtonClick = nil
        end
        inherited ViewImgListColumnWeb: TcxGridDBColumn
          Properties.NullStyle = nssGrayedChecked
        end
      end
    end
  end
end
