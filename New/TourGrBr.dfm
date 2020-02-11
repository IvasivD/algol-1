inherited TourGroupBrowseForm: TTourGroupBrowseForm
  Left = 202
  Top = 197
  Width = 483
  Height = 457
  Caption = 'Тури і групи'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CoolBar: TCoolBar
    Width = 475
    Bands = <
      item
        Break = False
        Control = ToolBar
        ImageIndex = -1
        MinHeight = 27
        Width = 471
      end>
    inherited ToolBar: TToolBar
      Width = 458
    end
  end
  inherited DetailPanel: TPanel
    Left = 0
    Top = 308
    Width = 475
    Height = 88
    Align = alBottom
    Visible = False
  end
  inherited ModalPanel: TPanel
    Top = 396
    Width = 475
    inherited OkBtn: TBitBtn
      Left = 297
    end
    inherited CancelBtn: TBitBtn
      Left = 387
    end
  end
  inherited MasterPanel: TPanel
    Width = 475
    Height = 277
    inherited MasterSplitter: TSplitter
      Top = 185
      Width = 475
    end
    inherited DBGrid: TDBGrid
      Width = 475
      Height = 185
      DataSource = DataSrc
      Columns = <
        item
          Expanded = False
          FieldName = 'TOURNAME'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOURDATE'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MAXPERSON'
          PickList.Strings = ()
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    inherited MasterDBRichEdit: TDBRichEdit
      Top = 188
      Width = 475
    end
  end
  inherited DataSrc: TDataSource
    DataSet = DM.GroupQry
  end
end
