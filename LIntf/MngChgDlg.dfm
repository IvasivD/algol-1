inherited ManagerChangeDlg: TManagerChangeDlg
  Left = 596
  Top = 288
  Caption = #1055#1077#1088#1077#1076#1072#1095#1072' '#1087#1088#1072#1074', '#1094#1110#1085#1085#1086#1089#1090#1077#1081' '#1090#1086#1097#1086
  ClientHeight = 195
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Name1Label: TLabel [0]
    Left = 8
    Top = 20
    Width = 44
    Height = 13
    Caption = #1055#1077#1088#1077#1076#1072#1074
  end
  object Ident1Label: TLabel [1]
    Left = 14
    Top = 52
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Name2Label: TLabel [2]
    Left = 8
    Top = 100
    Width = 44
    Height = 13
    Caption = #1055#1088#1080#1081#1085#1103#1074
  end
  object Ident2Label: TLabel [3]
    Left = 14
    Top = 132
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object Bevel1: TBevel [4]
    Left = 8
    Top = 80
    Width = 281
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  inherited CtrlPanel: TPanel
    Top = 162
  end
  object Name1DBLookupComboBox: TDBLookupComboBox
    Left = 64
    Top = 16
    Width = 227
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    DropDownRows = 15
    KeyField = 'TMUSERID'
    ListField = 'MANAGER'
    ListSource = Manager1Src
    TabOrder = 1
  end
  object Ident1Edit: TEdit
    Left = 64
    Top = 48
    Width = 209
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    PasswordChar = '*'
    TabOrder = 2
    Text = #1089#1077#1079#1072#1084#1074#1110#1076#1082#1088#1080#1081#1089#1103
  end
  object Name2DBLookupComboBox: TDBLookupComboBox
    Left = 64
    Top = 96
    Width = 227
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    DropDownRows = 15
    KeyField = 'TMUSERID'
    ListField = 'MANAGER'
    ListSource = Manager2Src
    TabOrder = 3
  end
  object Ident2Edit: TEdit
    Left = 64
    Top = 128
    Width = 209
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    PasswordChar = '*'
    TabOrder = 4
    Text = #1089#1077#1079#1072#1084#1074#1110#1076#1082#1088#1080#1081#1089#1103
  end
  object Manager1Qry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select TmUserId, TmUserName || '#39' '#39' || TmUserSurName as Manager,'
      '  TmUserInfo1, TmPermLevel'
      'from TmUsers'
      'where TmPermLevel >= :Perm'
      'order by TmUserId')
    Left = 16
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Perm'
        ParamType = ptUnknown
      end>
    object Manager1QryTMUSERID: TIntegerField
      FieldName = 'TMUSERID'
    end
    object Manager1QryMANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 51
    end
    object Manager1QryTMUSERINFO1: TStringField
      FieldName = 'TMUSERINFO1'
      Size = 100
    end
    object Manager1QryTMPERMLEVEL: TIntegerField
      FieldName = 'TMPERMLEVEL'
    end
  end
  object Manager1Src: TDataSource
    DataSet = Manager1Qry
    Left = 32
    Top = 168
  end
  object Manager2Qry: TQuery
    DatabaseName = 'Tour'
    SQL.Strings = (
      'select TmUserId, TmUserName || '#39' '#39' || TmUserSurName as Manager,'
      '  TmUserInfo1, TmPermLevel'
      'from TmUsers'
      'where TmPermLevel >= :Perm'
      'order by TmUserId')
    Left = 72
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Perm'
        ParamType = ptUnknown
      end>
    object Manager2QryTMUSERID: TIntegerField
      FieldName = 'TMUSERID'
    end
    object Manager2QryMANAGER: TStringField
      FieldName = 'MANAGER'
      Size = 51
    end
    object Manager2QryTMUSERINFO1: TStringField
      FieldName = 'TMUSERINFO1'
      Size = 100
    end
    object Manager2QryTMPERMLEVEL: TIntegerField
      FieldName = 'TMPERMLEVEL'
    end
  end
  object Manager2Src: TDataSource
    DataSet = Manager2Qry
    Left = 88
    Top = 168
  end
end
