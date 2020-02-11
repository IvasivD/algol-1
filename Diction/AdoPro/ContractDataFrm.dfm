object ContractDataForm: TContractDataForm
  Left = 401
  Top = 387
  Width = 435
  Height = 146
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 75
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 88
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088#1080' '#1076#1110#1081#1089#1085#1110' '#1079
    end
    object FileNameLabel: TLabel
      Left = 115
      Top = 45
      Width = 70
      Height = 13
      Caption = 'FileNameLabel'
      DragCursor = crHandPoint
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clInfoText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = FileNameLabelClick
      OnMouseEnter = FileNameLabelMouseEnter
      OnMouseLeave = FileNameLabelMouseLeave
    end
    object SelectShablonBtn: TBitBtn
      Left = 8
      Top = 39
      Width = 97
      Height = 25
      Caption = #1042#1080#1073#1088#1072#1090#1080' '#1096#1072#1073#1083#1086#1085
      TabOrder = 0
      OnClick = SelectShablonBtnClick
    end
    object ActualDateEdit: TcxDateEdit
      Left = 115
      Top = 8
      Style.BorderStyle = ebs3D
      Style.Color = clInfoBk
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 121
    end
  end
  object CtrlPanel: TPanel
    Left = 0
    Top = 75
    Width = 419
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      419
      33)
    object OkBtn: TBitBtn
      Left = 239
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'O'#1050
      TabOrder = 0
      Kind = bkOK
    end
    object CancelBtn: TBitBtn
      Left = 329
      Top = 5
      Width = 82
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1072
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object ContractDataQry: TQuery
    DatabaseName = 'Dict'
    SQL.Strings = (
      'select *'
      'from COMP_CONTRACTS_VIEW'
      'where ContractId = :ContractId')
    Left = 328
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ContractId'
        ParamType = ptUnknown
      end>
    object ContractDataQryCONTRACTID: TIntegerField
      FieldName = 'CONTRACTID'
    end
    object ContractDataQryCONTRACTNAME: TStringField
      FieldName = 'CONTRACTNAME'
      Size = 75
    end
    object ContractDataQrySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 25
    end
    object ContractDataQryTEMPLATS: TMemoField
      FieldName = 'TEMPLATS'
      BlobType = ftMemo
      Size = 1
    end
    object ContractDataQryDAYCOUNT: TIntegerField
      FieldName = 'DAYCOUNT'
    end
  end
  object WordDocum: TWordDocument
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 208
    Top = 39
  end
  object WordApplic: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 280
    Top = 39
  end
end
