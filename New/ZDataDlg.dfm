inherited ZDataDialog: TZDataDialog
  Left = 666
  Top = 307
  Caption = 'ZDataDialog'
  ClientHeight = 391
  ClientWidth = 444
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CtrlPanel: TPanel
    Top = 358
    Width = 444
    TabOrder = 1
    DesignSize = (
      444
      33)
    inherited OkBtn: TBitBtn
      Left = 264
    end
    inherited CancelBtn: TBitBtn
      Left = 354
    end
  end
  object WorkPanel: TPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 358
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    DesignSize = (
      444
      358)
    object Memo: TMemo
      Left = 8
      Top = 250
      Width = 428
      Height = 98
      Anchors = [akLeft, akRight, akBottom]
      Color = clInfoBk
      ScrollBars = ssVertical
      TabOrder = 0
      Visible = False
    end
  end
  object DataSource: TDataSource
    Left = 8
    Top = 8
  end
end
