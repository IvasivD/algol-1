inherited ManagerEditDlg: TManagerEditDlg
  Left = 443
  Top = 634
  Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
  ClientHeight = 230
  ClientWidth = 383
  PixelsPerInch = 96
  TextHeight = 13
  inherited WorkPanel: TPanel
    Width = 383
    Height = 81
    object UserNameLabel: TLabel
      Left = 8
      Top = 16
      Width = 19
      Height = 13
      Caption = #1030#1084#39#1103
    end
    object Label2: TLabel
      Left = 182
      Top = 16
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077
    end
    object FullNameLabel: TLabel
      Left = 8
      Top = 48
      Width = 102
      Height = 13
      Caption = #1055#1088#1110#1079#1074#1080#1097#1077' '#1090#1072' '#1110#1085#1110#1094#1110#1072#1083#1080
    end
    object UserNameDBEdit: TDBEdit
      Left = 32
      Top = 12
      Width = 137
      Height = 21
      Color = clInfoBk
      DataField = 'TMUSERNAME'
      DataSource = DataSrc
      TabOrder = 0
      OnExit = DBPersonNameExit
      OnKeyPress = DBCyrNameKeyPress
    end
    object UserSurNameDBEdit: TDBEdit
      Left = 238
      Top = 12
      Width = 137
      Height = 21
      Anchors = [akTop, akRight]
      Color = clInfoBk
      DataField = 'TMUSERSURNAME'
      DataSource = DataSrc
      TabOrder = 1
      OnExit = UserSurNameDBEditExit
      OnKeyPress = DBCyrNameKeyPress
    end
    object FullNameDBEdit: TDBEdit
      Left = 120
      Top = 44
      Width = 255
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      DataField = 'TMFULLNAME'
      DataSource = DataSrc
      TabOrder = 2
      OnEnter = FullNameDBEditEnter
      OnExit = FullNameDBEditExit
    end
  end
  inherited CtrlPanel: TPanel
    Top = 197
    Width = 383
    TabOrder = 2
    inherited OkBtn: TBitBtn
      Left = 203
    end
    inherited CancelBtn: TBitBtn
      Left = 293
    end
    inherited ApplyAllBtn: TBitBtn
      Visible = False
    end
  end
  object PermLevPanel: TPanel [2]
    Left = 0
    Top = 81
    Width = 383
    Height = 116
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvLowered
    TabOrder = 1
    object PermLevLabel: TLabel
      Left = 32
      Top = 17
      Width = 75
      Height = 13
      Caption = #1056#1110#1074#1077#1085#1100' '#1076#1086#1089#1090#1091#1087#1091
    end
    object Label1: TLabel
      Left = 32
      Top = 49
      Width = 72
      Height = 13
      Caption = #1043#1088#1091#1087#1072' '#1074' '#1044#1086#1096#1094#1110
    end
    object PbxAccntLabel: TLabel
      Left = 32
      Top = 84
      Width = 125
      Height = 13
      Caption = #1050#1086#1076' '#1076#1086#1089#1090#1091#1087#1091' '#1086#1092#1110#1089#1085#1086#1111' '#1040#1058#1057
    end
    object PermLevComboBox: TAzComboBox
      Left = 120
      Top = 13
      Width = 209
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
    object CategComboBox: TAzComboBox
      Left = 120
      Top = 45
      Width = 209
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
    object PbxAccntEdit: TEdit
      Left = 168
      Top = 80
      Width = 161
      Height = 21
      Color = clInfoBk
      MaxLength = 10
      PasswordChar = '*'
      TabOrder = 2
      OnKeyPress = DBDigitalKeyPress
    end
  end
  inherited DataSrc: TDataSource
    DataSet = DM.ManagerTable
    Left = 40
  end
  inherited MemoPopupMenu: TPopupMenu
    Left = 304
  end
  inherited ActionList: TActionList
    Left = 336
  end
end
