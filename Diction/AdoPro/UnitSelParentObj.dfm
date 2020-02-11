object FrmSelParentObj: TFrmSelParentObj
  Left = 672
  Top = 205
  Width = 439
  Height = 492
  Caption = #1056#1086#1079#1090#1072#1096#1091#1074#1072#1085#1085#1103' - '#1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameSelParentObjSelect: TFrameSelParentObj
    Left = 0
    Top = 0
    Width = 423
    Height = 454
    Align = alClient
    TabOrder = 0
    inherited PanSelCountry: TPanel
      Width = 423
      inherited GridCounry: TcxGrid
        Width = 423
      end
      inherited Panel4: TPanel
        Width = 423
        inherited CmbxSearchCountry: TcxExtLookupComboBox
          Width = 366
        end
      end
    end
    inherited PanelSelObject: TPanel
      Width = 423
      Height = 261
      inherited PanSelCity: TPanel
        Width = 421
        Height = 181
        inherited GridObject: TcxGrid
          Width = 421
          Height = 181
        end
      end
      inherited PanelSearchObj: TPanel
        Width = 421
        inherited rbResort: TcxRadioButton
          Left = 60
        end
        inherited RbNaturObj: TcxRadioButton
          Left = 132
        end
        inherited RbInfra: TcxRadioButton
          Left = 276
        end
        inherited PageControlSearcObject: TcxPageControl
          Width = 365
          ClientRectRight = 363
          inherited TabCity: TcxTabSheet
            inherited FrameSearchCityObj: TFrameSearchCity
              Width = 361
              inherited EdSearchCity: TcxTextEdit
                Width = 233
              end
              inherited PanelControl: TPanel
                Left = 297
              end
            end
          end
          inherited TabResort: TcxTabSheet
            inherited FrameSearchResortObj: TFrameSearchCity
              inherited EdSearchCity: TcxTextEdit
                Width = 131
              end
            end
          end
          inherited TabNaturObj: TcxTabSheet
            inherited CmbxSearchNaturObj: TcxExtLookupComboBox
              Width = 361
            end
          end
        end
      end
    end
  end
end
