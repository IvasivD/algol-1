object FrmRequisites: TFrmRequisites
  Left = 706
  Top = 189
  BorderStyle = bsDialog
  Caption = #1056#1077#1082#1074#1110#1079#1080#1090#1080
  ClientHeight = 450
  ClientWidth = 543
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
    Top = 416
    Width = 543
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      543
      34)
    object CancelBtn: TBitBtn
      Left = 453
      Top = 5
      Width = 82
      Height = 25
      HelpContext = 802
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1080#1090#1080
      TabOrder = 0
      OnClick = CancelBtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  inline FrameComRequisites: TFrameComRequisites
    Left = 0
    Top = 0
    Width = 543
    Height = 416
    Align = alClient
    TabOrder = 1
    inherited PanelTab: TPanel
      Width = 543
      Height = 416
      inherited PageControl: TPageControl
        Width = 543
        Height = 416
        inherited OfficeTabSheet: TTabSheet
          inherited Panel10: TPanel
            Top = 122
            Width = 535
            inherited Panel13: TPanel
              Width = 259
              inherited Panel14: TPanel
                Width = 259
                inherited Panel28: TPanel
                  Left = 167
                end
              end
              inherited GridComunicationCompOffice: TcxGrid
                Width = 259
              end
            end
          end
          inherited Panel15: TPanel
            Width = 535
            Height = 122
            inherited Panel17: TPanel
              Width = 535
            end
            inherited GridOffices: TcxGrid
              Width = 535
              Height = 100
            end
          end
        end
        inherited AccountTabSheet: TTabSheet
          inherited Panel1: TPanel
            Width = 535
            Height = 388
            inherited Panel20: TPanel
              Width = 535
              Height = 136
              inherited GridBankAccount: TcxGrid
                Width = 533
                Height = 112
              end
              inherited Panel21: TPanel
                Width = 533
              end
            end
            inherited PanelFramePayState: TPanel
              Width = 535
              inherited FrameRequsiteCompanyPayState: TFrameCompanyPayState
                Width = 535
                inherited TaxPayGroupBox: TGroupBox
                  Width = 526
                  inherited SingleTaxGroupBox: TGroupBox
                    Width = 511
                  end
                  inherited ReestrGroupBox: TGroupBox
                    Width = 511
                  end
                end
                inherited ItsActionComboBox: TcxExtLookupComboBox
                  Width = 265
                end
              end
            end
          end
        end
        inherited ProfileTabSheet: TTabSheet
          inherited GridKindBranch: TcxGrid
            Width = 535
            Height = 366
          end
          inherited Panel2: TPanel
            Width = 535
          end
        end
        inherited ContractTabSheet: TTabSheet
          inherited GridContractLog: TcxGrid
            Width = 535
            Height = 235
          end
          inherited Panel22: TPanel
            Width = 535
            inherited Panel23: TPanel
              Width = 535
              inherited butContractReRestr: TSpeedButton
                Left = 420
              end
              inherited ActionContractBtn: TSpeedButton
                Left = 448
              end
              inherited ContractSendDocBtn: TSpeedButton
                Left = 475
              end
              inherited ContractOpenDocBtn: TSpeedButton
                Left = 502
              end
            end
            inherited GridContract: TcxGrid
              Width = 535
            end
          end
        end
        inherited OrderTabSheet: TTabSheet
          inherited GridOrderList: TcxGrid
            Width = 535
            Height = 388
          end
        end
        inherited NoteTabSheet: TTabSheet
          inherited GridNotes: TcxGrid
            Width = 535
            Height = 366
          end
          inherited Panel4: TPanel
            Top = 366
            Width = 535
          end
        end
        inherited DocumentTabSheet: TTabSheet
          inherited Panel5: TPanel
            Width = 535
            inherited GridDoc: TcxGrid
              Width = 535
            end
          end
          inherited Panel24: TPanel
            Width = 535
            Height = 239
            inherited GridFiles: TcxGrid
              Width = 535
              Height = 239
            end
          end
        end
      end
    end
    inherited GridViewRepository: TcxGridViewRepository
      inherited ViewPerson: TcxGridDBTableView
        inherited ViewPersonCOMPANYID: TcxGridDBColumn
          IsCaptionAssigned = True
        end
        inherited ViewPersonPERSONID: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
      inherited ViewContractLog: TcxGridDBTableView
        inherited ViewContractLogSUBCATEGORY: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
      inherited ViewComunicationPerson: TcxGridDBTableView
        inherited ViewComunicationPersonICON: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
      inherited ViewComunicationCompany: TcxGridDBTableView
        inherited ViewComunicationCompanyICON: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
      inherited ViewOffices: TcxGridDBTableView
        inherited ViewOfficesISDEFAULT: TcxGridDBColumn
          IsCaptionAssigned = True
        end
        inherited ViewOfficesHEADOFFICE: TcxGridDBColumn
          IsCaptionAssigned = True
        end
        inherited ViewOfficesITSMAILADDRESS: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
      inherited ViewComunication_Comp_Office: TcxGridDBTableView
        inherited ViewComunication_Comp_OfficeICON: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
      inherited ViewComunicationCompanyList: TcxGridDBTableView
        inherited ViewComunicationCompanyListICON: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
      inherited ViewComunication_Comp_Person: TcxGridDBTableView
        inherited ViewComunication_Comp_PersonICON: TcxGridDBColumn
          IsCaptionAssigned = True
        end
      end
    end
  end
end
