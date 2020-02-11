object FrmHotelEdit: TFrmHotelEdit
  Left = 404
  Top = 265
  Width = 1398
  Height = 652
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082' '#1075#1086#1090#1077#1083#1110#1074
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ModalPanel: TPanel
    Left = 0
    Top = 580
    Width = 1382
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    DesignSize = (
      1382
      34)
    object CancelBtn: TBitBtn
      Left = 1293
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
    Width = 260
    Height = 580
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    inline FrameDicBrCountry: TFrameDic
      Left = 0
      Top = 0
      Width = 260
      Height = 580
      Align = alClient
      TabOrder = 0
      inherited PanelMain: TPanel
        Width = 260
        Height = 580
        inherited SplitterBrowserHTML: TSplitter
          Top = 509
          Width = 260
        end
        inherited PanelGrid: TPanel
          Width = 260
          Height = 485
          inherited PanelImage: TPanel
            Left = 83
            Height = 485
            inherited ImagePrew: TcxImage
              Height = 485
            end
          end
          inherited PageControlData: TcxPageControl
            Width = 83
            Height = 485
            ClientRectBottom = 485
            ClientRectRight = 83
            inherited TabView: TcxTabSheet
              inherited GridMain: TcxGrid
                Width = 83
                Height = 461
              end
            end
            inherited TabTree: TcxTabSheet
              inherited DBTreeList: TcxDBTreeList
                Width = 83
                Height = 461
              end
            end
          end
        end
        inherited PanelDescription: TPanel
          Top = 512
          Width = 260
          inherited PageDesription: TcxPageControl
            Width = 260
            ClientRectRight = 256
            inherited TabHtmlDescript: TcxTabSheet
              inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                Width = 252
                inherited PanelDescriptHTML: TPanel
                  Width = 252
                  inherited PanelTop: TPanel
                    Width = 252
                    inherited Panel1: TPanel
                      Left = 103
                    end
                  end
                  inherited WebBrowserDicDesctript: TChromium
                    Width = 252
                  end
                end
              end
            end
          end
        end
        inherited PanelButton: TPanel
          Width = 260
          inherited PanelSearchText: TPanel
            Width = 8
            inherited PanelButSearch: TPanel
              Left = -16
            end
          end
        end
      end
    end
  end
  object PanelRight: TPanel
    Left = 260
    Top = 0
    Width = 1122
    Height = 580
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter1: TSplitter
      Left = 482
      Top = 0
      Height = 580
    end
    object PanelHotels: TPanel
      Left = 485
      Top = 0
      Width = 637
      Height = 580
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object PanelLeftHotel: TPanel
        Left = 0
        Top = 0
        Width = 413
        Height = 580
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        inline FrameDicHotel: TFrameDic
          Left = 0
          Top = 0
          Width = 413
          Height = 580
          Align = alClient
          TabOrder = 0
          inherited PanelMain: TPanel
            Width = 413
            Height = 580
            inherited SplitterBrowserHTML: TSplitter
              Top = 509
              Width = 413
            end
            inherited PanelGrid: TPanel
              Width = 413
              Height = 485
              inherited PanelImage: TPanel
                Left = 236
                Height = 485
                inherited ImagePrew: TcxImage
                  Height = 485
                end
              end
              inherited PageControlData: TcxPageControl
                Width = 236
                Height = 485
                ClientRectBottom = 485
                ClientRectRight = 236
                inherited TabView: TcxTabSheet
                  inherited GridMain: TcxGrid
                    Width = 236
                    Height = 461
                  end
                end
                inherited TabTree: TcxTabSheet
                  inherited DBTreeList: TcxDBTreeList
                    Width = 370
                    Height = 484
                  end
                end
              end
            end
            inherited PanelDescription: TPanel
              Top = 512
              Width = 413
              inherited PageDesription: TcxPageControl
                Width = 413
                ClientRectRight = 409
                inherited TabHtmlDescript: TcxTabSheet
                  inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                    Width = 405
                    inherited PanelDescriptHTML: TPanel
                      Width = 405
                      inherited PanelTop: TPanel
                        Width = 405
                        inherited Panel1: TPanel
                          Left = 256
                        end
                      end
                      inherited WebBrowserDicDesctript: TChromium
                        Width = 405
                      end
                    end
                  end
                end
              end
            end
            inherited PanelButton: TPanel
              Width = 413
              inherited PanelSearchText: TPanel
                Width = 161
                inherited PanelButSearch: TPanel
                  Left = 137
                end
                inherited PanelTextSearch: TPanel
                  Width = 137
                  inherited EdSearch: TcxTextEdit
                    Width = 135
                  end
                end
              end
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 413
        Top = 0
        Width = 224
        Height = 580
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object PanelCustomer: TPanel
          Left = 0
          Top = 201
          Width = 224
          Height = 379
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          inline FrameDicHotelVendor: TFrameDic
            Left = 0
            Top = 0
            Width = 224
            Height = 379
            Align = alClient
            TabOrder = 0
            inherited PanelMain: TPanel
              Width = 224
              Height = 379
              inherited SplitterBrowserHTML: TSplitter
                Top = 308
                Width = 224
              end
              inherited PanelGrid: TPanel
                Width = 224
                Height = 284
                inherited PanelImage: TPanel
                  Left = 47
                  Height = 284
                  inherited ImagePrew: TcxImage
                    Height = 284
                  end
                end
                inherited PageControlData: TcxPageControl
                  Width = 47
                  Height = 284
                  ClientRectBottom = 284
                  ClientRectRight = 47
                  inherited TabView: TcxTabSheet
                    inherited GridMain: TcxGrid
                      Width = 47
                      Height = 260
                    end
                  end
                  inherited TabTree: TcxTabSheet
                    inherited DBTreeList: TcxDBTreeList
                      Width = 47
                      Height = 260
                    end
                  end
                end
              end
              inherited PanelDescription: TPanel
                Top = 311
                Width = 224
                inherited PageDesription: TcxPageControl
                  Width = 224
                  ClientRectRight = 220
                  inherited TabHtmlDescript: TcxTabSheet
                    inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                      Width = 216
                      inherited PanelDescriptHTML: TPanel
                        Width = 216
                        inherited PanelTop: TPanel
                          Width = 216
                          inherited Panel1: TPanel
                            Left = 67
                          end
                        end
                        inherited WebBrowserDicDesctript: TChromium
                          Width = 216
                        end
                      end
                    end
                  end
                end
              end
              inherited PanelButton: TPanel
                Width = 224
              end
            end
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 224
          Height = 201
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          inline FramePhotoList: TFramePhotoList
            Left = 0
            Top = 0
            Width = 224
            Height = 201
            Align = alClient
            TabOrder = 0
            inherited PhotoPanel: TPanel
              Width = 224
              Height = 201
              inherited PanelCanvas: TPanel
                Width = 224
                Height = 172
                inherited ImgShow: TcxImage
                  Height = 148
                  Width = 224
                end
                inherited PanelInfoButton: TPanel
                  Top = 148
                  Width = 224
                  inherited PanelFotoDate: TPanel
                    Width = 154
                    inherited LbDateOfFoto: TLabel
                      Width = 68
                    end
                  end
                  inherited Panel1: TPanel
                    Left = 154
                  end
                end
              end
              inherited PanelBottom: TPanel
                Top = 172
                Width = 224
                inherited Panel2: TPanel
                  Width = 224
                  inherited MemoDescript: TcxMemo
                    Width = 224
                  end
                end
              end
            end
          end
        end
      end
    end
    object PanelTop: TPanel
      Left = 0
      Top = 0
      Width = 482
      Height = 580
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      inline FrameDicCityHotelsItems: TFrameDic
        Left = 0
        Top = 0
        Width = 482
        Height = 580
        Align = alClient
        TabOrder = 0
        inherited PanelMain: TPanel
          Width = 482
          Height = 580
          inherited SplitterBrowserHTML: TSplitter
            Top = 509
            Width = 482
          end
          inherited PanelGrid: TPanel
            Width = 482
            Height = 485
            inherited PanelImage: TPanel
              Left = 305
              Height = 485
              inherited ImagePrew: TcxImage
                Height = 485
              end
            end
            inherited PageControlData: TcxPageControl
              Width = 305
              Height = 485
              ClientRectBottom = 485
              ClientRectRight = 305
              inherited TabView: TcxTabSheet
                inherited GridMain: TcxGrid
                  Width = 305
                  Height = 461
                end
              end
              inherited TabTree: TcxTabSheet
                inherited DBTreeList: TcxDBTreeList
                  Width = 171
                  Height = 484
                end
              end
            end
          end
          inherited PanelDescription: TPanel
            Top = 512
            Width = 482
            inherited PageDesription: TcxPageControl
              Width = 482
              ClientRectRight = 478
              inherited TabHtmlDescript: TcxTabSheet
                inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
                  Width = 474
                  inherited PanelDescriptHTML: TPanel
                    Width = 474
                    inherited PanelTop: TPanel
                      Width = 474
                      inherited Panel1: TPanel
                        Left = 325
                      end
                    end
                    inherited WebBrowserDicDesctript: TChromium
                      Width = 474
                    end
                  end
                end
              end
            end
          end
          inherited PanelButton: TPanel
            Width = 482
            inherited PanelSearchText: TPanel
              Width = 230
              inherited PanelButSearch: TPanel
                Left = 206
              end
              inherited PanelTextSearch: TPanel
                Width = 206
                inherited EdSearch: TcxTextEdit
                  Width = 204
                end
              end
            end
          end
        end
      end
    end
  end
end
