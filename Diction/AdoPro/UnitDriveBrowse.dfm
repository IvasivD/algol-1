object FrmDriveBrowse: TFrmDriveBrowse
  Left = 353
  Top = 194
  Width = 1375
  Height = 799
  Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1110' '#1079#1072#1089#1086#1073#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ModalPanel: TPanel
    Left = 0
    Top = 727
    Width = 1359
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    DesignSize = (
      1359
      34)
    object CancelBtn: TBitBtn
      Left = 1270
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      Kind = bkCancel
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 151
    Height = 620
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    inline FrameDicDrvKind: TFrameDic
      Left = 0
      Top = 0
      Width = 151
      Height = 620
      Align = alClient
      TabOrder = 0
      inherited PanelMain: TPanel
        Width = 151
        Height = 620
        inherited SplitterBrowserHTML: TSplitter
          Top = 549
          Width = 151
        end
        inherited PanelGrid: TPanel
          Width = 151
          Height = 525
          inherited PanelImage: TPanel
            Left = -26
            Height = 525
            inherited ImagePrew: TcxImage
              Height = 525
            end
          end
          inherited PageControlData: TcxPageControl
            Width = 39
            Height = 525
            ClientRectBottom = 525
            ClientRectRight = 39
            ClientRectTop = 2
            inherited TabView: TcxTabSheet
              inherited GridMain: TcxGrid
                Width = 39
                Height = 523
              end
            end
            inherited TabTree: TcxTabSheet
              inherited DBTreeList: TcxDBTreeList
                Width = 39
                Height = 523
              end
            end
          end
        end
        inherited PanelDescription: TPanel
          Top = 552
          Width = 151
          inherited PageDesription: TcxPageControl
            Width = 151
            ClientRectRight = 147
            inherited TabHtmlDescript: TcxTabSheet
              inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                Width = 143
                inherited PanelDescriptHTML: TPanel
                  Width = 143
                  inherited PanelTop: TPanel
                    Width = 143
                    inherited Panel1: TPanel
                      Left = -6
                    end
                  end
                  inherited WebBrowserDicDesctript: TChromium
                    Width = 143
                  end
                end
              end
            end
          end
        end
        inherited PanelButton: TPanel
          Width = 151
          inherited PanelSearchText: TPanel
            Width = 20
            inherited PanelButSearch: TPanel
              Left = -4
            end
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 620
    Width = 1359
    Height = 107
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object GridDriveNote: TcxGrid
      Left = 0
      Top = 0
      Width = 1359
      Height = 107
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      object cxGridDBTableView3: TcxGridDBTableView
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = True
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = True
        Navigator.Buttons.GotoBookmark.Visible = True
        Navigator.Buttons.Filter.Visible = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CellHints = True
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
      end
      object cxGridLevel3: TcxGridLevel
        GridView = DMServ.ViewDriveNoteQry
      end
    end
  end
  object Panel4: TPanel
    Left = 1071
    Top = 0
    Width = 288
    Height = 620
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object Panel8: TPanel
      Left = 0
      Top = 0
      Width = 288
      Height = 620
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PanelCustomer: TPanel
        Left = 0
        Top = 265
        Width = 288
        Height = 355
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        inline FrameDicDrvService: TFrameDic
          Left = 0
          Top = 0
          Width = 288
          Height = 355
          Align = alClient
          TabOrder = 0
          inherited PanelMain: TPanel
            Width = 288
            Height = 355
            inherited SplitterBrowserHTML: TSplitter
              Top = 284
              Width = 288
            end
            inherited PanelGrid: TPanel
              Width = 288
              Height = 260
              inherited PanelImage: TPanel
                Left = 111
                Height = 260
                inherited ImagePrew: TcxImage
                  Height = 260
                end
              end
              inherited PageControlData: TcxPageControl
                Width = 111
                Height = 260
                ClientRectBottom = 260
                ClientRectRight = 111
                inherited TabView: TcxTabSheet
                  inherited GridMain: TcxGrid
                    Width = 111
                    Height = 236
                  end
                end
                inherited TabTree: TcxTabSheet
                  inherited DBTreeList: TcxDBTreeList
                    Width = 507
                    Height = 450
                  end
                end
              end
            end
            inherited PanelDescription: TPanel
              Top = 287
              Width = 288
              inherited PageDesription: TcxPageControl
                Width = 288
                ClientRectRight = 284
                inherited TabHtmlDescript: TcxTabSheet
                  inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                    Width = 280
                    inherited PanelDescriptHTML: TPanel
                      Width = 280
                      inherited PanelTop: TPanel
                        Width = 280
                        inherited Panel1: TPanel
                          Left = 131
                        end
                      end
                      inherited WebBrowserDicDesctript: TChromium
                        Width = 280
                      end
                    end
                  end
                end
              end
            end
            inherited PanelButton: TPanel
              Width = 288
              inherited PanelSearchText: TPanel
                Width = 36
                inherited PanelButSearch: TPanel
                  Left = 12
                end
                inherited PanelTextSearch: TPanel
                  Width = 12
                  inherited EdSearch: TcxTextEdit
                    Width = 10
                  end
                end
              end
            end
          end
        end
      end
      inline FramePhotoList: TFramePhotoList
        Left = 0
        Top = 0
        Width = 288
        Height = 265
        Align = alTop
        TabOrder = 1
        inherited PhotoPanel: TPanel
          Width = 288
          Height = 265
          inherited PanelCanvas: TPanel
            Width = 288
            Height = 231
            inherited ImgShow: TcxImage
              Height = 207
              Width = 288
            end
            inherited PanelInfoButton: TPanel
              Top = 207
              Width = 288
              inherited PanelFotoDate: TPanel
                Width = 218
                inherited LbDateOfFoto: TLabel
                  Width = 68
                end
              end
              inherited Panel1: TPanel
                Left = 218
              end
            end
          end
          inherited PanelBottom: TPanel
            Top = 231
            Width = 288
            Height = 34
            inherited Panel2: TPanel
              Width = 288
              Height = 34
              inherited MemoDescript: TcxMemo
                Enabled = False
                StyleDisabled.TextColor = clBlack
                Height = 34
                Width = 288
              end
            end
          end
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 369
    Top = 376
    Width = 696
    Height = 120
    BevelOuter = bvNone
    TabOrder = 4
  end
  object PanelDrive: TPanel
    Left = 151
    Top = 0
    Width = 920
    Height = 620
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
    object PanelShema: TPanel
      Left = 644
      Top = 0
      Width = 276
      Height = 620
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 276
        Height = 620
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object GridShemaDrv: TcxGrid
          Left = 0
          Top = 0
          Width = 276
          Height = 620
          Align = alClient
          DragMode = dmAutomatic
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object GridShemaDrvDBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object GridShemaDrvLevel2: TcxGridLevel
            GridView = ViewVEHICLE
          end
        end
      end
    end
    inline FrameDicDrivers: TFrameDic
      Left = 0
      Top = 0
      Width = 644
      Height = 620
      Align = alClient
      TabOrder = 1
      inherited PanelMain: TPanel
        Width = 644
        Height = 620
        inherited SplitterBrowserHTML: TSplitter
          Top = 549
          Width = 644
        end
        inherited PanelGrid: TPanel
          Width = 644
          Height = 525
          inherited PanelImage: TPanel
            Left = 467
            Height = 525
            inherited ImagePrew: TcxImage
              Height = 525
            end
          end
          inherited PageControlData: TcxPageControl
            Width = 467
            Height = 525
            ClientRectBottom = 525
            ClientRectRight = 467
            inherited TabView: TcxTabSheet
              inherited GridMain: TcxGrid
                Width = 467
                Height = 501
              end
            end
            inherited TabTree: TcxTabSheet
              inherited DBTreeList: TcxDBTreeList
                Width = 543
                Height = 503
              end
            end
          end
        end
        inherited PanelDescription: TPanel
          Top = 552
          Width = 644
          inherited PageDesription: TcxPageControl
            Width = 644
            ClientRectRight = 640
            inherited TabHtmlDescript: TcxTabSheet
              inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                Width = 636
                inherited PanelDescriptHTML: TPanel
                  Width = 636
                  inherited PanelTop: TPanel
                    Width = 636
                    inherited Panel1: TPanel
                      Left = 487
                    end
                  end
                  inherited WebBrowserDicDesctript: TChromium
                    Width = 636
                  end
                end
              end
            end
          end
        end
        inherited PanelButton: TPanel
          Width = 644
          inherited PanelSearchText: TPanel
            Width = 392
            inherited PanelButSearch: TPanel
              Left = 368
            end
            inherited PanelTextSearch: TPanel
              Width = 368
              inherited EdSearch: TcxTextEdit
                Width = 366
              end
            end
          end
        end
      end
    end
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 984
    Top = 216
    object ViewVEHICLE: TcxGridBandedTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Bands = <
        item
        end>
      object ViewVEHICLEColumn2: TcxGridBandedColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object ViewVEHICLEColumn1: TcxGridBandedColumn
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
  end
end
