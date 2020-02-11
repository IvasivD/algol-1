object FrmEditDictDetail: TFrmEditDictDetail
  Left = 331
  Top = 98
  Width = 1203
  Height = 839
  Caption = #1044#1086#1074#1110#1076#1085#1080#1082
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 313
    Width = 1187
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  inline FrameDic1: TFrameDic
    Left = 0
    Top = 0
    Width = 1187
    Height = 313
    Align = alTop
    TabOrder = 0
    inherited PanelMain: TPanel
      Width = 1187
      Height = 313
      inherited SplitterBrowserHTML: TSplitter
        Top = 110
        Width = 1187
      end
      inherited PanelGrid: TPanel
        Width = 1187
        Height = 86
        inherited PanelImage: TPanel
          Left = 916
          Height = 86
          inherited ImagePrew: TcxImage
            Height = 86
          end
        end
        inherited PageControlData: TcxPageControl
          Width = 916
          Height = 86
          ClientRectBottom = 82
          ClientRectRight = 912
          inherited TabView: TcxTabSheet
            inherited GridMain: TcxGrid
              Width = 908
              Height = 58
            end
          end
          inherited TabTree: TcxTabSheet
            inherited DBTreeList: TcxDBTreeList
              Width = 908
              Height = 58
              OnDblClick = nil
            end
          end
        end
      end
      inherited PanelDescription: TPanel
        Top = 113
        Width = 1187
        inherited PageDesription: TcxPageControl
          Width = 1187
          ClientRectRight = 1183
          inherited TabHtmlDescript: TcxTabSheet
            inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
              Width = 1179
              inherited PanelDescriptHTML: TPanel
                Width = 1179
                inherited Panel16: TPanel
                  Width = 1179
                  inherited CmbSelectLngDescript: TcxImageComboBox
                    Left = 1037
                  end
                end
                inherited WebBrowserDicDesctript: TChromium
                  Width = 1179
                end
              end
            end
          end
          inherited TabTextDescriptStaf: TcxTabSheet
            inherited MemoDescript: TcxMemo
              Width = 1179
            end
          end
        end
      end
      inherited PanelButton: TPanel
        Width = 1187
        inherited PanelSearchCountry: TPanel
          Width = 950
          inherited butSearch: TSpeedButton
            Left = 924
            OnClick = nil
          end
          inherited EdSearch: TcxTextEdit
            OnKeyPress = nil
            Width = 922
          end
        end
      end
    end
  end
  inline FrameDicDetail: TFrameDic
    Left = 0
    Top = 316
    Width = 1187
    Height = 485
    Align = alClient
    TabOrder = 1
    inherited PanelMain: TPanel
      Width = 1187
      Height = 485
      inherited SplitterBrowserHTML: TSplitter
        Top = 282
        Width = 1187
      end
      inherited PanelGrid: TPanel
        Width = 1187
        Height = 258
        inherited PanelImage: TPanel
          Left = 916
          Height = 258
          inherited ImagePrew: TcxImage
            Height = 258
          end
        end
        inherited PageControlData: TcxPageControl
          Width = 916
          Height = 258
          Properties.ActivePage = FrameDicDetail.TabView
          ClientRectBottom = 254
          ClientRectRight = 912
          inherited TabView: TcxTabSheet
            inherited GridMain: TcxGrid
              Width = 908
              Height = 230
            end
          end
          inherited TabTree: TcxTabSheet
            inherited DBTreeList: TcxDBTreeList
              Width = 568
              Height = 169
              OnDblClick = nil
            end
          end
        end
      end
      inherited PanelDescription: TPanel
        Top = 285
        Width = 1187
        inherited PageDesription: TcxPageControl
          Width = 1187
          ClientRectRight = 1183
          inherited TabHtmlDescript: TcxTabSheet
            inherited FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML
              Width = 1179
              inherited PanelDescriptHTML: TPanel
                Width = 1179
                inherited Panel16: TPanel
                  Width = 1179
                  inherited CmbSelectLngDescript: TcxImageComboBox
                    Left = 1037
                  end
                end
                inherited WebBrowserDicDesctript: TChromium
                  Width = 1179
                end
              end
            end
          end
        end
      end
      inherited PanelButton: TPanel
        Width = 1187
        inherited PanelSearchCountry: TPanel
          Width = 950
          inherited butSearch: TSpeedButton
            Left = 924
            OnClick = nil
          end
          inherited EdSearch: TcxTextEdit
            OnKeyPress = nil
            Width = 922
          end
        end
      end
    end
  end
end
