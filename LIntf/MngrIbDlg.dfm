inherited ManagerDlg: TManagerDlg
  Left = 780
  Top = 432
  Caption = #1056#1077#1108#1089#1090#1088#1072#1094#1110#1103
  ClientHeight = 125
  OldCreateOrder = True
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 20
    Width = 58
    Height = 13
    Caption = #1050#1086#1088#1080#1089#1090#1091#1074#1072#1095
  end
  object PassLabel: TLabel [1]
    Left = 28
    Top = 60
    Width = 38
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object NewYearImage: TImage [2]
    Left = 6
    Top = 8
    Width = 32
    Height = 32
    Transparent = True
    Visible = False
  end
  object NameDBLookupComboBox: TDBLookupComboBox [3]
    Left = 80
    Top = 16
    Width = 211
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clInfoBk
    DropDownRows = 15
    KeyField = 'TMUSERID'
    ListField = 'MANAGER'
    ListSource = ManagerSrc
    TabOrder = 0
  end
  inherited CtrlPanel: TPanel
    Top = 92
    TabOrder = 2
  end
  object PassEdit: TEdit
    Left = 80
    Top = 56
    Width = 193
    Height = 21
    Color = clInfoBk
    PasswordChar = '*'
    TabOrder = 1
  end
  object ManagerSrc: TDataSource
    DataSet = ManagerQry
    Left = 24
    Top = 96
  end
  object ManagerQry: TIBQuery
    SQL.Strings = (
      'select TmUserId, TmUserName || '#39' '#39' || TmUserSurName as Manager,'
      '  TmName2, TmUserInfo1, TmPermLevel'
      'from TmUsers'
      'where TmPermLevel >= :Perm'
      'order by TmUserId')
    Left = 8
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Perm'
        ParamType = ptInput
      end>
    object ManagerQryTMUSERID: TIntegerField
      FieldName = 'TMUSERID'
      Origin = 'TMUSERS.TMUSERID'
      Required = True
    end
    object ManagerQryMANAGER: TIBStringField
      FieldName = 'MANAGER'
      Size = 51
    end
    object ManagerQryTMNAME2: TIBStringField
      FieldName = 'TMNAME2'
      Origin = 'TMUSERS.TMNAME2'
      Size = 10
    end
    object ManagerQryTMUSERINFO1: TIBStringField
      FieldName = 'TMUSERINFO1'
      Origin = 'TMUSERS.TMUSERINFO1'
      Size = 100
    end
    object ManagerQryTMPERMLEVEL: TIntegerField
      FieldName = 'TMPERMLEVEL'
      Origin = 'TMUSERS.TMPERMLEVEL'
    end
  end
end
