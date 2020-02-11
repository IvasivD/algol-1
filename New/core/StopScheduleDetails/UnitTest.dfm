object Form1: TForm1
  Left = 238
  Top = 82
  Width = 1658
  Height = 908
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 603
    Height = 870
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    object GridTour: TcxGrid
      Left = 1
      Top = 42
      Width = 601
      Height = 390
      Align = alClient
      TabOrder = 0
      object GridTourDBTableView1: TcxGridDBTableView
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object GridTourLevel1: TcxGridLevel
        GridView = ViewRouters
      end
    end
    object cxGrid2: TcxGrid
      Left = 1
      Top = 656
      Width = 601
      Height = 213
      Align = alBottom
      TabOrder = 1
      object cxGridDBTableView1: TcxGridDBTableView
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel1: TcxGridLevel
        GridView = VieSchedule
      end
    end
    object cxGrid5: TcxGrid
      Left = 1
      Top = 432
      Width = 601
      Height = 224
      Align = alBottom
      TabOrder = 2
      object cxGridDBTableView2: TcxGridDBTableView
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
      end
      object cxGridLevel2: TcxGridLevel
        GridView = ViewTourTemplate
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 601
      Height = 41
      Align = alTop
      TabOrder = 3
      object Button3: TButton
        Left = 64
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Create '
        TabOrder = 0
        OnClick = Button3Click
      end
      object ProgressBar: TProgressBar
        Left = 144
        Top = 14
        Width = 449
        Height = 17
        TabOrder = 1
      end
      object Button8: TButton
        Left = 3
        Top = 9
        Width = 57
        Height = 25
        Caption = 'Select All'
        TabOrder = 2
        OnClick = Button8Click
      end
    end
  end
  object Panel2: TPanel
    Left = 603
    Top = 0
    Width = 1039
    Height = 870
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 297
      Width = 1037
      Height = 41
      Align = alTop
      TabOrder = 0
      object Button1: TButton
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Create'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 104
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Remove'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button5: TButton
        Left = 232
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Insert Stop'
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 312
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Insert Hotel'
        TabOrder = 3
        OnClick = Button6Click
      end
      object Button7: TButton
        Left = 392
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Insert  Excusion'
        TabOrder = 4
        OnClick = Button7Click
      end
      object Button10: TButton
        Left = 760
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Del'
        TabOrder = 5
        OnClick = Button10Click
      end
      object Button4: TButton
        Left = 629
        Top = 8
        Width = 121
        Height = 25
        Caption = 'Insert Descriptions'
        TabOrder = 6
        OnClick = Button4Click
      end
      object Button9: TButton
        Left = 504
        Top = 8
        Width = 105
        Height = 25
        Caption = 'Insert  Sub Excurs'
        TabOrder = 7
        OnClick = Button9Click
      end
    end
    object cxPageControl1: TcxPageControl
      Left = 1
      Top = 1
      Width = 1037
      Height = 296
      Align = alTop
      TabOrder = 1
      Properties.ActivePage = TabStops
      ClientRectBottom = 292
      ClientRectLeft = 4
      ClientRectRight = 1033
      ClientRectTop = 24
      object TabStops: TcxTabSheet
        Caption = #1047#1091#1087#1080#1085#1082#1080
        ImageIndex = 0
        object cxGrid3: TcxGrid
          Left = 0
          Top = 0
          Width = 1029
          Height = 268
          Align = alClient
          TabOrder = 0
          object cxGrid3DBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid3Level1: TcxGridLevel
            GridView = ViewSchedItem
          end
        end
      end
      object TabHotels: TcxTabSheet
        Caption = #1055#1086#1089#1077#1083#1077#1085#1085#1103' ('#1043#1086#1090#1077#1083#1100')'
        ImageIndex = 1
        object cxGrid4: TcxGrid
          Left = 0
          Top = 0
          Width = 1029
          Height = 268
          Align = alClient
          TabOrder = 0
          object cxGrid4DBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid4Level1: TcxGridLevel
            GridView = ViewTOURROOMS
          end
        end
      end
      object TabExcurs: TcxTabSheet
        Caption = #1045#1082#1089#1082#1091#1088#1089#1110#1111
        ImageIndex = 2
        object cxGrid6: TcxGrid
          Left = 0
          Top = 0
          Width = 843
          Height = 204
          Align = alClient
          TabOrder = 0
          object cxGrid6DBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid6Level1: TcxGridLevel
            GridView = ViewTOUREXCURS
          end
        end
      end
      object TabDescription: TcxTabSheet
        Caption = '  '#1054#1087#1080#1089'  '
        ImageIndex = 3
        object GridTourDescription: TcxGrid
          Left = 0
          Top = 0
          Width = 984
          Height = 268
          Align = alClient
          TabOrder = 0
          object GridTourDescriptionDBTableView1: TcxGridDBTableView
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object GridTourDescriptionLevel1: TcxGridLevel
            GridView = ViewTourDescriptions
          end
        end
      end
    end
    object TreeTourSched: TcxDBTreeList
      Left = 1
      Top = 338
      Width = 1037
      Height = 531
      Align = alClient
      Bands = <
        item
        end>
      DataController.DataSource = DS_SCHEDITEM_TOURS
      DataController.ParentField = 'PARENT'
      DataController.KeyField = 'SCHEDITEMTOURID'
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      OptionsBehavior.Sorting = False
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsData.Inserting = True
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      PopupMenu = PopupMenuTreeScheduleTour
      RootValue = -1
      Styles.StyleSheet = MyStyleTree
      TabOrder = 2
      OnCustomDrawDataCell = TreeTourSchedCustomDrawDataCell
      object TreeTourSchedSCHEDITEMTOURID: TcxDBTreeListColumn
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        DataBinding.FieldName = 'SCHEDITEMTOURID'
        Width = 174
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedTypeAction: TcxDBTreeListColumn
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Items = <
          item
            Description = #1055#1086#1095#1072#1090#1086#1082
            ImageIndex = 0
            Value = 0
          end
          item
            Description = #1050#1110#1085#1077#1094#1100
            Value = 1
          end>
        Caption.AlignHorz = taCenter
        Caption.Text = #1058#1080#1087' '#1087#1086#1089#1083#1091#1075#1080
        DataBinding.FieldName = 'TYPEACTION'
        Width = 111
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
        OnGetDisplayText = TreeTourSchedTypeActionGetDisplayText
      end
      object TreeTourSchedTypeOBJIcon: TcxDBTreeListColumn
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.Images = ImageListAction
        Properties.Items = <
          item
            Description = #1055#1077#1088#1077#1111#1079#1076
            ImageIndex = 2
            Value = 0
          end
          item
            Description = #1043#1086#1090#1077#1083#1100
            ImageIndex = 1
            Value = 1
          end
          item
            Description = #1045#1082#1089#1082#1091#1088#1089#1110#1103
            ImageIndex = 0
            Value = 2
          end
          item
            Description = #1054#1087#1080#1089
            ImageIndex = 3
            Value = 3
          end
          item
            Description = #1055#1077#1088#1077#1111#1079#1076
            ImageIndex = 7
            Value = 10
          end
          item
            Description = #1030#1085#1096#1077
          end>
        Properties.ShowDescriptions = False
        Caption.AlignHorz = taCenter
        Caption.Text = #1044#1110#1103
        DataBinding.FieldName = 'TYPEOBJ'
        Width = 44
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedCalcDescription: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = ' '
        DataBinding.FieldName = 'CalcDescription'
        Width = 238
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedArriveTime: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.TimeFormat = tfHourMin
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        Caption.Text = #1063#1072#1089
        DataBinding.FieldName = 'CalcActionTime'
        Width = 64
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedStopOrder: TcxDBTreeListColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        DataBinding.FieldName = 'STOPORDER'
        Width = 100
        Position.ColIndex = 7
        Position.RowIndex = 0
        Position.BandIndex = 0
        SortOrder = soAscending
        SortIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedParent: TcxDBTreeListColumn
        Visible = False
        DataBinding.FieldName = 'PARENT'
        Position.ColIndex = 6
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedObjID: TcxDBTreeListColumn
        Visible = False
        DataBinding.FieldName = 'OBJID'
        Position.ColIndex = 8
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedTemplateID: TcxDBTreeListColumn
        Visible = False
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        DataBinding.FieldName = 'TEMPLATEID'
        Width = 100
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedcxDBTreeListOPTIONS: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.AlignVert = vaCenter
        DataBinding.FieldName = 'OPTIONS'
        Width = 56
        Position.ColIndex = 9
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object TreeTourSchedcxDBTreeListCITYID: TcxDBTreeListColumn
        DataBinding.FieldName = 'CITYID'
        Position.ColIndex = 10
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 400
    Top = 41
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    Left = 485
    Top = 41
  end
  object DS_SHEDULEITEMS: TDataSource
    DataSet = SHEDULEITEMS
    Left = 728
    Top = 72
  end
  object SHEDULEITEMS: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    DataSource = DS_TOURTEMPLATES
    SQL.Strings = (
      'SELECT * FROM SEL_SHEDITEM_PROC(:TourTemplateId)')
    Left = 824
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TOURTEMPLATEID'
        ParamType = ptUnknown
        Size = 4
      end>
    object SHEDULEITEMSSHEDITEMID: TIntegerField
      FieldName = 'SHEDITEMID'
      Origin = '"SHEDULEITEMS_SEL_PROC"."SHEDITEMID"'
    end
    object SHEDULEITEMSSTOPORDER: TSmallintField
      FieldName = 'STOPORDER'
      Origin = '"SHEDULEITEMS_SEL_PROC"."STOPORDER"'
    end
    object SHEDULEITEMSCOUNTRYNAME: TIBStringField
      FieldName = 'COUNTRYNAME'
      Origin = '"SHEDULEITEMS_SEL_PROC"."COUNTRYNAME"'
      Size = 30
    end
    object SHEDULEITEMSCITYNAME: TIBStringField
      FieldName = 'CITYNAME'
      Origin = '"SHEDULEITEMS_SEL_PROC"."CITYNAME"'
      Size = 190
    end
    object SHEDULEITEMSARRIVETIME: TFloatField
      FieldName = 'ARRIVETIME'
      Origin = '"SHEDULEITEMS_SEL_PROC"."ARRIVETIME"'
    end
    object SHEDULEITEMSDEPARTTIME: TFloatField
      FieldName = 'DEPARTTIME'
      Origin = '"SHEDULEITEMS_SEL_PROC"."DEPARTTIME"'
    end
    object SHEDULEITEMSARRIVEDAY: TIntegerField
      FieldName = 'ARRIVEDAY'
      Origin = '"SHEDULEITEMS_SEL_PROC"."ARRIVEDAY"'
    end
    object SHEDULEITEMSDEPARTDAY: TIntegerField
      FieldName = 'DEPARTDAY'
      Origin = '"SHEDULEITEMS_SEL_PROC"."DEPARTDAY"'
    end
    object SHEDULEITEMSEXTRADISTANCE: TIBStringField
      FieldName = 'EXTRADISTANCE'
      Origin = '"SHEDULEITEMS_SEL_PROC"."EXTRADISTANCE"'
      Size = 1
    end
    object SHEDULEITEMSEXTRADEPART: TIBStringField
      FieldName = 'EXTRADEPART'
      Origin = '"SEL_SHEDITEM_PROC"."EXTRADEPART"'
      Size = 1
    end
    object SHEDULEITEMSEXTRAARRIVE: TIBStringField
      FieldName = 'EXTRAARRIVE'
      Origin = '"SEL_SHEDITEM_PROC"."EXTRAARRIVE"'
      Size = 1
    end
    object SHEDULEITEMSPARENTARRIVEID: TIntegerField
      FieldName = 'PARENTARRIVEID'
      Origin = '"SEL_SHEDITEM_PROC"."PARENTARRIVEID"'
    end
    object SHEDULEITEMSPARENTDEPARTID: TIntegerField
      FieldName = 'PARENTDEPARTID'
      Origin = '"SEL_SHEDITEM_PROC"."PARENTDEPARTID"'
    end
    object SHEDULEITEMSCITYID: TIntegerField
      FieldName = 'CITYID'
      Origin = '"SEL_SHEDITEM_PROC"."CITYID"'
    end
  end
  object DS_TOURS: TDataSource
    DataSet = TOURS
    Left = 112
    Top = 24
  end
  object TOURS: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    SQL.Strings = (
      'select TOURES.ID, TOURES.TOURNAME,TOURES.DAYCOUNT,'
      'TOURES.TRIPROUTEID as ROUTEID'
      
        ' from TOURES  left join ROUTES on TOURES.TRIPROUTEID = ROUTES.RO' +
        'UTEID')
    Left = 240
    Top = 32
    object TOURSID: TIntegerField
      FieldName = 'ID'
      Origin = '"TOURES"."ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOURSTOURNAME: TIBStringField
      FieldName = 'TOURNAME'
      Origin = '"TOURES"."TOURNAME"'
      Required = True
      Size = 250
    end
    object TOURSDAYCOUNT: TSmallintField
      FieldName = 'DAYCOUNT'
      Origin = '"TOURES"."DAYCOUNT"'
    end
    object TOURSROUTEID: TIntegerField
      FieldName = 'ROUTEID'
      Origin = '"TOURES"."TRIPROUTEID"'
    end
  end
  object DS_SHEDULES: TDataSource
    DataSet = SHEDULES
    Left = 112
    Top = 138
  end
  object SHEDULES: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    DataSource = DS_TOURTEMPLATES
    SQL.Strings = (
      'SELECT S.*, TT.BeginDay from TOURTRIPS TT'
      'left join SHEDULES S on S.SHEDULEID = TT.SHEDULEID'
      'WHERE TOURTEMPLATEID = :TOURTEMPLATEID'
      'order by TT.BeginDay')
    Left = 240
    Top = 138
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TOURTEMPLATEID'
        ParamType = ptUnknown
      end>
    object SHEDULESROUTEID: TIntegerField
      FieldName = 'ROUTEID'
      Origin = '"SHEDULES"."ROUTEID"'
      Required = True
    end
    object SHEDULESSHEDULEID: TIntegerField
      FieldName = 'SHEDULEID'
      Origin = '"SHEDULES"."SHEDULEID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object SHEDULESSHEDULENO: TSmallintField
      FieldName = 'SHEDULENO'
      Origin = '"SHEDULES"."SHEDULENO"'
    end
    object SHEDULESFTIMELINKTO: TSmallintField
      FieldName = 'FTIMELINKTO'
      Origin = '"SHEDULES"."FTIMELINKTO"'
    end
    object SHEDULESBTIMELINKTO: TSmallintField
      FieldName = 'BTIMELINKTO'
      Origin = '"SHEDULES"."BTIMELINKTO"'
    end
    object SHEDULESDEPARTFTIME: TDateTimeField
      FieldName = 'DEPARTFTIME'
      Origin = '"SHEDULES"."DEPARTFTIME"'
    end
    object SHEDULESARRIVEFTIME: TDateTimeField
      FieldName = 'ARRIVEFTIME'
      Origin = '"SHEDULES"."ARRIVEFTIME"'
    end
    object SHEDULESDEPARTBTIME: TDateTimeField
      FieldName = 'DEPARTBTIME'
      Origin = '"SHEDULES"."DEPARTBTIME"'
    end
    object SHEDULESARRIVEBTIME: TDateTimeField
      FieldName = 'ARRIVEBTIME'
      Origin = '"SHEDULES"."ARRIVEBTIME"'
    end
    object SHEDULESFORWARDTIME: TFloatField
      FieldName = 'FORWARDTIME'
      Origin = '"SHEDULES"."FORWARDTIME"'
    end
    object SHEDULESBACKWARDTIME: TFloatField
      FieldName = 'BACKWARDTIME'
      Origin = '"SHEDULES"."BACKWARDTIME"'
    end
    object SHEDULESISDISTANCED: TIBStringField
      FieldName = 'ISDISTANCED'
      Origin = '"SHEDULES"."ISDISTANCED"'
      Size = 1
    end
    object SHEDULESISTIMED: TIBStringField
      FieldName = 'ISTIMED'
      Origin = '"SHEDULES"."ISTIMED"'
      Size = 1
    end
    object SHEDULESSHEDULENAME: TIBStringField
      FieldName = 'SHEDULENAME'
      Origin = '"SHEDULES"."SHEDULENAME"'
      Size = 40
    end
    object SHEDULESADDMANID: TIntegerField
      FieldName = 'ADDMANID'
      Origin = '"SHEDULES"."ADDMANID"'
    end
    object SHEDULESBIDIRECTIONAL: TIBStringField
      FieldName = 'BIDIRECTIONAL'
      Origin = '"SHEDULES"."BIDIRECTIONAL"'
      Size = 1
    end
    object SHEDULESTRANSIT: TMemoField
      FieldName = 'TRANSIT'
      Origin = '"SHEDULES"."TRANSIT"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object SHEDULESBEGINDAY: TIntegerField
      FieldName = 'BEGINDAY'
      Origin = '"TOURTRIPS"."BEGINDAY"'
    end
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 1096
    Top = 48
    object ViewRouters: TcxGridDBTableView
      OnFocusedRecordChanged = ViewRoutersFocusedRecordChanged
      DataController.DataSource = DS_TOURS
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.MultiSelect = True
      OptionsView.GroupByBox = False
      object ViewRoutersID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 64
      end
      object ViewRoutersROUTEID: TcxGridDBColumn
        DataBinding.FieldName = 'ROUTEID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewRoutersTOURNAME: TcxGridDBColumn
        DataBinding.FieldName = 'TOURNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 392
      end
      object ViewRoutersDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 87
      end
    end
    object VieSchedule: TcxGridDBTableView
      DataController.DataSource = DS_SHEDULES
      DataController.KeyFieldNames = 'SHEDULEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object VieScheduleROUTEID: TcxGridDBColumn
        DataBinding.FieldName = 'ROUTEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleSHEDULEID: TcxGridDBColumn
        DataBinding.FieldName = 'SHEDULEID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleSHEDULENO: TcxGridDBColumn
        DataBinding.FieldName = 'SHEDULENO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleFTIMELINKTO: TcxGridDBColumn
        DataBinding.FieldName = 'FTIMELINKTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleBTIMELINKTO: TcxGridDBColumn
        DataBinding.FieldName = 'BTIMELINKTO'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleDEPARTFTIME: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTFTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleARRIVEFTIME: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVEFTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleDEPARTBTIME: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTBTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleARRIVEBTIME: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVEBTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleFORWARDTIME: TcxGridDBColumn
        DataBinding.FieldName = 'FORWARDTIME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 104
      end
      object VieScheduleBACKWARDTIME: TcxGridDBColumn
        DataBinding.FieldName = 'BACKWARDTIME'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 107
      end
      object VieScheduleISDISTANCED: TcxGridDBColumn
        DataBinding.FieldName = 'ISDISTANCED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 92
      end
      object VieScheduleISTIMED: TcxGridDBColumn
        DataBinding.FieldName = 'ISTIMED'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleSHEDULENAME: TcxGridDBColumn
        DataBinding.FieldName = 'SHEDULENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 221
      end
      object VieScheduleADDMANID: TcxGridDBColumn
        DataBinding.FieldName = 'ADDMANID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleBIDIRECTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'BIDIRECTIONAL'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleTRANSIT: TcxGridDBColumn
        DataBinding.FieldName = 'TRANSIT'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object VieScheduleBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        Width = 89
      end
    end
    object ViewSchedItem: TcxGridDBTableView
      DataController.DataSource = DS_SHEDULEITEMS
      DataController.KeyFieldNames = 'SHEDITEMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewSchedItemSHEDITEMID: TcxGridDBColumn
        DataBinding.FieldName = 'SHEDITEMID'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 77
      end
      object ViewSchedItemCOUNTRYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 133
      end
      object ViewSchedItemCITYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CITYNAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 89
      end
      object ViewSchedItemDISTANCE: TcxGridDBColumn
        DataBinding.FieldName = 'DISTANCE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSchedItemSTOPID: TcxGridDBColumn
        DataBinding.FieldName = 'STOPID'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
      end
      object ViewSchedItemSTOPORDER: TcxGridDBColumn
        DataBinding.FieldName = 'STOPORDER'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 96
      end
      object ViewSchedItemARRIVETIME: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVETIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 104
      end
      object ViewSchedItemDEPARTTIME: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 108
      end
      object ViewSchedItemARRIVEDAY: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVEDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 114
      end
      object ViewSchedItemDEPARTDAY: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTDAY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 118
      end
      object ViewSchedItemEXTRAARRIVE: TcxGridDBColumn
        DataBinding.FieldName = 'EXTRAARRIVE'
      end
      object ViewSchedItemEXTRADEPART: TcxGridDBColumn
        DataBinding.FieldName = 'EXTRADEPART'
      end
      object ViewSchedItemEXTRADISTANCE: TcxGridDBColumn
        DataBinding.FieldName = 'EXTRADISTANCE'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 89
      end
      object ViewSchedItemPARENTARRIVEID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTARRIVEID'
      end
      object ViewSchedItemPARENTDEPARTID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTDEPARTID'
      end
    end
    object ViewSchedTours: TcxGridDBTableView
      DataController.DataSource = DS_SCHEDITEM_TOURS
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.CellSelect = False
      object ViewSchedToursSCHEDITEMTOURID: TcxGridDBColumn
        DataBinding.FieldName = 'SCHEDITEMTOURID'
      end
      object ViewSchedToursSTOPORDER: TcxGridDBColumn
        DataBinding.FieldName = 'STOPORDER'
      end
      object ViewSchedToursSTOPID: TcxGridDBColumn
        DataBinding.FieldName = 'STOPID'
      end
      object ViewSchedToursARRIVETIME: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVETIME'
      end
      object ViewSchedToursDEPARTTIME: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTTIME'
      end
      object ViewSchedToursPERMENTER: TcxGridDBColumn
        DataBinding.FieldName = 'PERMENTER'
      end
      object ViewSchedToursPERMEXIT: TcxGridDBColumn
        DataBinding.FieldName = 'PERMEXIT'
      end
      object ViewSchedToursSHOWITEM: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWITEM'
      end
      object ViewSchedToursARRIVEABOUT: TcxGridDBColumn
        DataBinding.FieldName = 'ARRIVEABOUT'
      end
      object ViewSchedToursDEPARTABOUT: TcxGridDBColumn
        DataBinding.FieldName = 'DEPARTABOUT'
      end
    end
    object ViewTourTemplate: TcxGridDBTableView
      DataController.DataSource = DS_TOURTEMPLATES
      DataController.KeyFieldNames = 'TOURTEMPLATEID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewTourTemplateTOURID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURID'
        Visible = False
      end
      object ViewTourTemplateTOURGROUPID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURGROUPID'
        Visible = False
      end
      object ViewTourTemplateTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
      end
      object ViewTourTemplateTEMPLATENAME: TcxGridDBColumn
        DataBinding.FieldName = 'TEMPLATENAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 445
      end
      object ViewTourTemplateVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
      end
      object ViewTourTemplateGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        Visible = False
      end
      object ViewTourTemplateGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        Visible = False
      end
      object ViewTourTemplateMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
      object ViewTourTemplateDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
      end
      object ViewTourTemplatePARENTID: TcxGridDBColumn
        DataBinding.FieldName = 'PARENTID'
        Visible = False
      end
      object ViewTourTemplateORDERMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'ORDERMEMO'
        Visible = False
      end
      object ViewTourTemplateTOURTIME: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTIME'
        Visible = False
      end
      object ViewTourTemplateDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
      end
      object ViewTourTemplateSHOWWEB: TcxGridDBColumn
        DataBinding.FieldName = 'SHOWWEB'
        Visible = False
      end
      object ViewTourTemplateTOURVARIANTID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURVARIANTID'
        Visible = False
      end
      object ViewTourTemplateBONUSCHECKTRIP: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKTRIP'
        Visible = False
      end
      object ViewTourTemplateBONUSCHECKHOTEL: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKHOTEL'
        Visible = False
      end
      object ViewTourTemplateBONUSCHECKINSURE: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKINSURE'
        Visible = False
      end
      object ViewTourTemplateBONUSCHECKVISA: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKVISA'
        Visible = False
      end
      object ViewTourTemplateBONUSCHECKEXCURS: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKEXCURS'
        Visible = False
      end
      object ViewTourTemplateBONUSCHECKOTHER: TcxGridDBColumn
        DataBinding.FieldName = 'BONUSCHECKOTHER'
        Visible = False
      end
    end
    object ViewTOURROOMS: TcxGridDBTableView
      DataController.DataSource = DS_TOURROOMS
      DataController.KeyFieldNames = 'TOURROOMID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewTOURROOMSTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
      end
      object ViewTOURROOMSTOURROOMID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURROOMID'
        Visible = False
      end
      object ViewTOURROOMSCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
        Visible = False
      end
      object ViewTOURROOMSCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
        Visible = False
      end
      object ViewTOURROOMSHOTELID: TcxGridDBColumn
        DataBinding.FieldName = 'HOTELID'
        Visible = False
      end
      object ViewTOURROOMSFROMDATE: TcxGridDBColumn
        DataBinding.FieldName = 'FROMDATE'
        Width = 85
      end
      object ViewTOURROOMSBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
      end
      object ViewTOURROOMSDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
        Width = 86
      end
      object ViewTOURROOMSVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
        Visible = False
      end
      object ViewTOURROOMSGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        Visible = False
      end
      object ViewTOURROOMSGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        Visible = False
      end
      object ViewTOURROOMSRATECURRID: TcxGridDBColumn
        DataBinding.FieldName = 'RATECURRID'
        Visible = False
      end
      object ViewTOURROOMSMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
      object ViewTOURROOMSRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
      end
      object ViewTOURROOMSRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
      end
      object ViewTOURROOMSAGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY'
        Visible = False
      end
      object ViewTOURROOMSAGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY2'
        Visible = False
      end
      object ViewTOURROOMSAGENTWHO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO'
        Visible = False
      end
      object ViewTOURROOMSAGENTWHO2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO2'
        Visible = False
      end
      object ViewTOURROOMSFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
      end
      object ViewTOURROOMSFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
      end
      object ViewTOURROOMSVATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC'
        Visible = False
      end
      object ViewTOURROOMSVAT: TcxGridDBColumn
        DataBinding.FieldName = 'VAT'
        Visible = False
      end
      object ViewTOURROOMSVATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC2'
        Visible = False
      end
      object ViewTOURROOMSVAT2: TcxGridDBColumn
        DataBinding.FieldName = 'VAT2'
        Visible = False
      end
      object ViewTOURROOMSDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
      end
      object ViewTOURROOMSOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
      end
      object ViewTOURROOMSNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
      end
      object ViewTOURROOMSNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
      end
      object ViewTOURROOMSNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
      end
      object ViewTOURROOMSNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
      end
      object ViewTOURROOMSAGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC'
        Visible = False
      end
      object ViewTOURROOMSAGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC2'
        Visible = False
      end
      object ViewTOURROOMSGROUPCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPCURRID'
        Visible = False
      end
      object ViewTOURROOMSGRATISPERSONCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISPERSONCOUNT'
        Visible = False
      end
      object ViewTOURROOMSGRATISBYVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISBYVENDOR'
        Visible = False
      end
      object ViewTOURROOMSHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
      end
      object ViewTOURROOMSNETCHECK: TcxGridDBColumn
        DataBinding.FieldName = 'NETCHECK'
        Visible = False
      end
      object ViewTOURROOMSV1_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE'
        Visible = False
      end
      object ViewTOURROOMSV1_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY'
        Visible = False
      end
      object ViewTOURROOMSV1_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY'
        Visible = False
      end
      object ViewTOURROOMSV1_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC'
        Visible = False
      end
      object ViewTOURROOMSV1_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT'
        Visible = False
      end
      object ViewTOURROOMSV1_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC'
        Visible = False
      end
      object ViewTOURROOMSV1_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL'
        Visible = False
      end
      object ViewTOURROOMSV1_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID'
        Visible = False
      end
      object ViewTOURROOMSV2_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE'
        Visible = False
      end
      object ViewTOURROOMSV2_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY'
        Visible = False
      end
      object ViewTOURROOMSV2_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY'
        Visible = False
      end
      object ViewTOURROOMSV2_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC'
        Visible = False
      end
      object ViewTOURROOMSV2_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT'
        Visible = False
      end
      object ViewTOURROOMSV2_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC'
        Visible = False
      end
      object ViewTOURROOMSV2_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL'
        Visible = False
      end
      object ViewTOURROOMSV2_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID'
        Visible = False
      end
      object ViewTOURROOMSV1_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE2'
        Visible = False
      end
      object ViewTOURROOMSV1_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY2'
        Visible = False
      end
      object ViewTOURROOMSV1_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY2'
        Visible = False
      end
      object ViewTOURROOMSV1_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC2'
        Visible = False
      end
      object ViewTOURROOMSV1_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT2'
        Visible = False
      end
      object ViewTOURROOMSV1_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC2'
        Visible = False
      end
      object ViewTOURROOMSV1_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL2'
        Visible = False
      end
      object ViewTOURROOMSV1_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID2'
        Visible = False
      end
      object ViewTOURROOMSV2_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE2'
        Visible = False
      end
      object ViewTOURROOMSV2_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY2'
        Visible = False
      end
      object ViewTOURROOMSV2_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY2'
        Visible = False
      end
      object ViewTOURROOMSV2_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC2'
        Visible = False
      end
      object ViewTOURROOMSV2_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT2'
        Visible = False
      end
      object ViewTOURROOMSV2_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC2'
        Visible = False
      end
      object ViewTOURROOMSV2_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL2'
        Visible = False
      end
      object ViewTOURROOMSV2_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID2'
        Visible = False
      end
      object ViewTOURROOMSFEEDID: TcxGridDBColumn
        DataBinding.FieldName = 'FEEDID'
        Visible = False
      end
      object ViewTOURROOMSPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
      end
      object ViewTOURROOMSCITIESNAME: TcxGridDBColumn
        DataBinding.FieldName = 'CITY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 145
      end
      object ViewTOURROOMSCOUNTRYNAME: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRY'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 168
      end
      object ViewTOURROOMSHOTELNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 200
      end
      object ViewTOURROOMSHOTELSTARS: TcxGridDBColumn
        DataBinding.FieldName = 'STARS'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
    end
    object ViewTOUREXCURS: TcxGridDBTableView
      DataController.DataSource = DS_TOUREXCURS
      DataController.KeyFieldNames = 'TOUREXCURID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewTOUREXCURSTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
      end
      object ViewTOUREXCURSEXCURSNAME: TcxGridDBColumn
        DataBinding.FieldName = 'EXCURSNAME'
        Width = 158
      end
      object ViewTOUREXCURSTOUREXCURID: TcxGridDBColumn
        DataBinding.FieldName = 'TOUREXCURID'
        Visible = False
        Width = 90
      end
      object ViewTOUREXCURSBEGINDAY: TcxGridDBColumn
        DataBinding.FieldName = 'BEGINDAY'
        Width = 86
      end
      object ViewTOUREXCURSCOUNTRYID: TcxGridDBColumn
        DataBinding.FieldName = 'COUNTRYID'
      end
      object ViewTOUREXCURSCITYID: TcxGridDBColumn
        DataBinding.FieldName = 'CITYID'
      end
      object ViewTOUREXCURSEXCURSID: TcxGridDBColumn
        DataBinding.FieldName = 'EXCURSID'
      end
      object ViewTOUREXCURSATDATE: TcxGridDBColumn
        DataBinding.FieldName = 'ATDATE'
      end
      object ViewTOUREXCURSVENDORID: TcxGridDBColumn
        DataBinding.FieldName = 'VENDORID'
      end
      object ViewTOUREXCURSGROUPMIN: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMIN'
        Visible = False
      end
      object ViewTOUREXCURSGROUPMAX: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPMAX'
        Visible = False
      end
      object ViewTOUREXCURSRATECURRID: TcxGridDBColumn
        DataBinding.FieldName = 'RATECURRID'
        Visible = False
      end
      object ViewTOUREXCURSMEMO: TcxGridDBColumn
        DataBinding.FieldName = 'MEMO'
        Visible = False
      end
      object ViewTOUREXCURSRATE: TcxGridDBColumn
        DataBinding.FieldName = 'RATE'
        Visible = False
      end
      object ViewTOUREXCURSRATE2: TcxGridDBColumn
        DataBinding.FieldName = 'RATE2'
        Visible = False
      end
      object ViewTOUREXCURSAGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY'
        Visible = False
      end
      object ViewTOUREXCURSAGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPAY2'
        Visible = False
      end
      object ViewTOUREXCURSAGENTWHO: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO'
        Visible = False
      end
      object ViewTOUREXCURSAGENTWHO2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTWHO2'
        Visible = False
      end
      object ViewTOUREXCURSFORPAY: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY'
        Visible = False
      end
      object ViewTOUREXCURSFORPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'FORPAY2'
        Visible = False
      end
      object ViewTOUREXCURSVATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC'
        Visible = False
      end
      object ViewTOUREXCURSVAT: TcxGridDBColumn
        DataBinding.FieldName = 'VAT'
        Visible = False
      end
      object ViewTOUREXCURSVATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'VATPERC2'
        Visible = False
      end
      object ViewTOUREXCURSVAT2: TcxGridDBColumn
        DataBinding.FieldName = 'VAT2'
        Visible = False
      end
      object ViewTOUREXCURSDISABLED: TcxGridDBColumn
        DataBinding.FieldName = 'DISABLED'
        Visible = False
      end
      object ViewTOUREXCURSOPTIONAL: TcxGridDBColumn
        DataBinding.FieldName = 'OPTIONAL'
        Visible = False
      end
      object ViewTOUREXCURSNETPERGROUP: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP'
        Visible = False
      end
      object ViewTOUREXCURSNETPERGROUP2: TcxGridDBColumn
        DataBinding.FieldName = 'NETPERGROUP2'
        Visible = False
      end
      object ViewTOUREXCURSNETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL'
        Visible = False
      end
      object ViewTOUREXCURSNETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'NETVAL2'
        Visible = False
      end
      object ViewTOUREXCURSAGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC'
        Visible = False
      end
      object ViewTOUREXCURSAGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'AGENTPERC2'
        Visible = False
      end
      object ViewTOUREXCURSEXTIME: TcxGridDBColumn
        DataBinding.FieldName = 'EXTIME'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.TimeFormat = tfHourMin
        Width = 57
      end
      object ViewTOUREXCURSGROUPCURRID: TcxGridDBColumn
        DataBinding.FieldName = 'GROUPCURRID'
        Visible = False
      end
      object ViewTOUREXCURSGRATISPERSONCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISPERSONCOUNT'
        Visible = False
      end
      object ViewTOUREXCURSGRATISBYVENDOR: TcxGridDBColumn
        DataBinding.FieldName = 'GRATISBYVENDOR'
        Visible = False
      end
      object ViewTOUREXCURSHIDDEN: TcxGridDBColumn
        DataBinding.FieldName = 'HIDDEN'
        Visible = False
      end
      object ViewTOUREXCURSNETCHECK: TcxGridDBColumn
        DataBinding.FieldName = 'NETCHECK'
        Visible = False
      end
      object ViewTOUREXCURSV1_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE'
        Visible = False
      end
      object ViewTOUREXCURSV1_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY'
        Visible = False
      end
      object ViewTOUREXCURSV1_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY'
        Visible = False
      end
      object ViewTOUREXCURSV1_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC'
        Visible = False
      end
      object ViewTOUREXCURSV1_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT'
        Visible = False
      end
      object ViewTOUREXCURSV1_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC'
        Visible = False
      end
      object ViewTOUREXCURSV1_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL'
        Visible = False
      end
      object ViewTOUREXCURSV1_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID'
        Visible = False
      end
      object ViewTOUREXCURSV2_RATE: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE'
        Visible = False
      end
      object ViewTOUREXCURSV2_AGENTPAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY'
        Visible = False
      end
      object ViewTOUREXCURSV2_PAY: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY'
        Visible = False
      end
      object ViewTOUREXCURSV2_VATPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC'
        Visible = False
      end
      object ViewTOUREXCURSV2_VAT: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT'
        Visible = False
      end
      object ViewTOUREXCURSV2_AGENTPERC: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC'
        Visible = False
      end
      object ViewTOUREXCURSV2_NETVAL: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL'
        Visible = False
      end
      object ViewTOUREXCURSV2_PAID: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID'
        Visible = False
      end
      object ViewTOUREXCURSV1_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_RATE2'
        Visible = False
      end
      object ViewTOUREXCURSV1_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPAY2'
        Visible = False
      end
      object ViewTOUREXCURSV1_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAY2'
        Visible = False
      end
      object ViewTOUREXCURSV1_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VATPERC2'
        Visible = False
      end
      object ViewTOUREXCURSV1_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_VAT2'
        Visible = False
      end
      object ViewTOUREXCURSV1_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_AGENTPERC2'
        Visible = False
      end
      object ViewTOUREXCURSV1_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_NETVAL2'
        Visible = False
      end
      object ViewTOUREXCURSV1_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V1_PAID2'
        Visible = False
      end
      object ViewTOUREXCURSV2_RATE2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_RATE2'
        Visible = False
      end
      object ViewTOUREXCURSV2_AGENTPAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPAY2'
        Visible = False
      end
      object ViewTOUREXCURSV2_PAY2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAY2'
        Visible = False
      end
      object ViewTOUREXCURSV2_VATPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VATPERC2'
        Visible = False
      end
      object ViewTOUREXCURSV2_VAT2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_VAT2'
        Visible = False
      end
      object ViewTOUREXCURSV2_AGENTPERC2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_AGENTPERC2'
        Visible = False
      end
      object ViewTOUREXCURSV2_NETVAL2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_NETVAL2'
        Visible = False
      end
      object ViewTOUREXCURSV2_PAID2: TcxGridDBColumn
        DataBinding.FieldName = 'V2_PAID2'
        Visible = False
      end
      object ViewTOUREXCURSPERIODTYPE: TcxGridDBColumn
        DataBinding.FieldName = 'PERIODTYPE'
        Visible = False
      end
      object ViewTOUREXCURSDAYCOUNT: TcxGridDBColumn
        DataBinding.FieldName = 'DAYCOUNT'
      end
    end
    object ViewTourDescriptions: TcxGridDBTableView
      DataController.DataSource = DS_TOUR_DESCRIPTIONS
      DataController.KeyFieldNames = 'TOURDESCRIPTID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GroupByBox = False
      object ViewTourDescriptionsTOURDESCRIPTID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURDESCRIPTID'
      end
      object ViewTourDescriptionsNAME: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072
        DataBinding.FieldName = 'NAME'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Width = 395
      end
      object ViewTourDescriptionsTOURTEMPLATEID: TcxGridDBColumn
        DataBinding.FieldName = 'TOURTEMPLATEID'
        Visible = False
      end
    end
  end
  object DS_SCHEDITEM_TOURS: TDataSource
    DataSet = SCHEDITEM_TOURS
    Left = 1248
    Top = 384
  end
  object SCHEDITEM_TOURS: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
    OnCalcFields = SCHEDITEM_TOURSCalcFields
    FieldDefs = <
      item
        Name = 'SCHEDITEMTOURID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TEMPLATEID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PARENT'
        DataType = ftInteger
      end
      item
        Name = 'TYPEOBJ'
        DataType = ftInteger
      end
      item
        Name = 'TYPEACTION'
        DataType = ftInteger
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'OBJID'
        DataType = ftInteger
      end
      item
        Name = 'CITYID'
        DataType = ftInteger
      end
      item
        Name = 'STOPORDER'
        DataType = ftInteger
      end
      item
        Name = 'STOPID'
        DataType = ftInteger
      end
      item
        Name = 'OPTIONS'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'PK_SCHEDITEM_TOURS'
        Fields = 'SCHEDITEMTOURID'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'TEMPLATEID'
    MasterFields = 'TOURTEMPLATEID'
    MasterSource = DS_TOURTEMPLATES
    StoreDefs = True
    TableName = 'SCHEDITEM_TOURS'
    Left = 1376
    Top = 384
    object SCHEDITEM_TOURSSCHEDITEMTOURID: TIntegerField
      FieldName = 'SCHEDITEMTOURID'
    end
    object SCHEDITEM_TOURSPARENT: TIntegerField
      FieldName = 'PARENT'
    end
    object SCHEDITEM_TOURSDESCRIPTION: TIBStringField
      FieldName = 'DESCRIPTION'
      Size = 300
    end
    object SCHEDITEM_TOURSSTOPORDER: TIntegerField
      FieldName = 'STOPORDER'
    end
    object SCHEDITEM_TOURSSTOPID: TIntegerField
      FieldName = 'STOPID'
    end
    object SCHEDITEM_TOURSTYPEACTION: TIntegerField
      FieldName = 'TYPEACTION'
    end
    object SCHEDITEM_TOURSCalcDescription: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcDescription'
      Size = 300
      Calculated = True
    end
    object SCHEDITEM_TOURSTYPEOBJ: TIntegerField
      FieldName = 'TYPEOBJ'
    end
    object SCHEDITEM_TOURSTEMPLATEID: TIntegerField
      FieldName = 'TEMPLATEID'
      Required = True
    end
    object SCHEDITEM_TOURSOBJID: TIntegerField
      FieldName = 'OBJID'
    end
    object SCHEDITEM_TOURSOPTIONS: TIntegerField
      FieldName = 'OPTIONS'
    end
    object SCHEDITEM_TOURSCalcActionTime: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CalcActionTime'
      Calculated = True
    end
    object SCHEDITEM_TOURSCITYID: TIntegerField
      FieldName = 'CITYID'
    end
  end
  object TOURTEMPLATES: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    DataSource = DS_TOURS
    SQL.Strings = (
      'SELECT * from  TOURTEMPLATES WHERE TOURID = :ID')
    Left = 240
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object TOURTEMPLATESTOURID: TIntegerField
      FieldName = 'TOURID'
      Origin = '"TOURTEMPLATES"."TOURID"'
    end
    object TOURTEMPLATESTOURGROUPID: TIntegerField
      FieldName = 'TOURGROUPID'
      Origin = '"TOURTEMPLATES"."TOURGROUPID"'
    end
    object TOURTEMPLATESTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
      Origin = '"TOURTEMPLATES"."TOURTEMPLATEID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOURTEMPLATESTEMPLATENAME: TIBStringField
      FieldName = 'TEMPLATENAME'
      Origin = '"TOURTEMPLATES"."TEMPLATENAME"'
      Required = True
      Size = 60
    end
    object TOURTEMPLATESVENDORID: TIntegerField
      FieldName = 'VENDORID'
      Origin = '"TOURTEMPLATES"."VENDORID"'
    end
    object TOURTEMPLATESGROUPMIN: TSmallintField
      FieldName = 'GROUPMIN'
      Origin = '"TOURTEMPLATES"."GROUPMIN"'
    end
    object TOURTEMPLATESGROUPMAX: TSmallintField
      FieldName = 'GROUPMAX'
      Origin = '"TOURTEMPLATES"."GROUPMAX"'
    end
    object TOURTEMPLATESMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"TOURTEMPLATES"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TOURTEMPLATESDISABLED: TIBStringField
      FieldName = 'DISABLED'
      Origin = '"TOURTEMPLATES"."DISABLED"'
      Size = 1
    end
    object TOURTEMPLATESPARENTID: TIntegerField
      FieldName = 'PARENTID'
      Origin = '"TOURTEMPLATES"."PARENTID"'
    end
    object TOURTEMPLATESORDERMEMO: TMemoField
      FieldName = 'ORDERMEMO'
      Origin = '"TOURTEMPLATES"."ORDERMEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TOURTEMPLATESTOURTIME: TDateTimeField
      FieldName = 'TOURTIME'
      Origin = '"TOURTEMPLATES"."TOURTIME"'
    end
    object TOURTEMPLATESDAYCOUNT: TSmallintField
      FieldName = 'DAYCOUNT'
      Origin = '"TOURTEMPLATES"."DAYCOUNT"'
    end
    object TOURTEMPLATESSHOWWEB: TIBStringField
      FieldName = 'SHOWWEB'
      Origin = '"TOURTEMPLATES"."SHOWWEB"'
      Size = 1
    end
    object TOURTEMPLATESTOURVARIANTID: TIntegerField
      FieldName = 'TOURVARIANTID'
      Origin = '"TOURTEMPLATES"."TOURVARIANTID"'
    end
    object TOURTEMPLATESBONUSCHECKTRIP: TIBStringField
      FieldName = 'BONUSCHECKTRIP'
      Origin = '"TOURTEMPLATES"."BONUSCHECKTRIP"'
      Size = 1
    end
    object TOURTEMPLATESBONUSCHECKHOTEL: TIBStringField
      FieldName = 'BONUSCHECKHOTEL'
      Origin = '"TOURTEMPLATES"."BONUSCHECKHOTEL"'
      Size = 1
    end
    object TOURTEMPLATESBONUSCHECKINSURE: TIBStringField
      FieldName = 'BONUSCHECKINSURE'
      Origin = '"TOURTEMPLATES"."BONUSCHECKINSURE"'
      Size = 1
    end
    object TOURTEMPLATESBONUSCHECKVISA: TIBStringField
      FieldName = 'BONUSCHECKVISA'
      Origin = '"TOURTEMPLATES"."BONUSCHECKVISA"'
      Size = 1
    end
    object TOURTEMPLATESBONUSCHECKEXCURS: TIBStringField
      FieldName = 'BONUSCHECKEXCURS'
      Origin = '"TOURTEMPLATES"."BONUSCHECKEXCURS"'
      Size = 1
    end
    object TOURTEMPLATESBONUSCHECKOTHER: TIBStringField
      FieldName = 'BONUSCHECKOTHER'
      Origin = '"TOURTEMPLATES"."BONUSCHECKOTHER"'
      Size = 1
    end
  end
  object DS_TOURTEMPLATES: TDataSource
    DataSet = TOURTEMPLATES
    Left = 112
    Top = 80
  end
  object DS_TOURTRIPS: TDataSource
    DataSet = TOURTRIPS
    Left = 400
    Top = 96
  end
  object TOURTRIPS: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    DataSource = DS_TOURS
    SQL.Strings = (
      'SELECT * from  TOURTRIPS WHERE ROUTEID = :ROUTEID')
    Left = 488
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ROUTEID'
        ParamType = ptUnknown
      end>
    object TOURTRIPSTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
      Origin = '"TOURTRIPS"."TOURTEMPLATEID"'
    end
    object TOURTRIPSTOURTRIPID: TIntegerField
      FieldName = 'TOURTRIPID'
      Origin = '"TOURTRIPS"."TOURTRIPID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOURTRIPSROUTEID: TIntegerField
      FieldName = 'ROUTEID'
      Origin = '"TOURTRIPS"."ROUTEID"'
    end
    object TOURTRIPSSHEDULEID: TIntegerField
      FieldName = 'SHEDULEID'
      Origin = '"TOURTRIPS"."SHEDULEID"'
    end
    object TOURTRIPSTRIPID: TIntegerField
      FieldName = 'TRIPID'
      Origin = '"TOURTRIPS"."TRIPID"'
    end
    object TOURTRIPSTRIPBACKID: TIntegerField
      FieldName = 'TRIPBACKID'
      Origin = '"TOURTRIPS"."TRIPBACKID"'
    end
    object TOURTRIPSVENDORID: TIntegerField
      FieldName = 'VENDORID'
      Origin = '"TOURTRIPS"."VENDORID"'
    end
    object TOURTRIPSGROUPMIN: TSmallintField
      FieldName = 'GROUPMIN'
      Origin = '"TOURTRIPS"."GROUPMIN"'
    end
    object TOURTRIPSGROUPMAX: TSmallintField
      FieldName = 'GROUPMAX'
      Origin = '"TOURTRIPS"."GROUPMAX"'
    end
    object TOURTRIPSRATECURRID: TIntegerField
      FieldName = 'RATECURRID'
      Origin = '"TOURTRIPS"."RATECURRID"'
    end
    object TOURTRIPSMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"TOURTRIPS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TOURTRIPSRATE: TFloatField
      FieldName = 'RATE'
      Origin = '"TOURTRIPS"."RATE"'
    end
    object TOURTRIPSRATE2: TFloatField
      FieldName = 'RATE2'
      Origin = '"TOURTRIPS"."RATE2"'
    end
    object TOURTRIPSAGENTPAY: TFloatField
      FieldName = 'AGENTPAY'
      Origin = '"TOURTRIPS"."AGENTPAY"'
    end
    object TOURTRIPSAGENTPAY2: TFloatField
      FieldName = 'AGENTPAY2'
      Origin = '"TOURTRIPS"."AGENTPAY2"'
    end
    object TOURTRIPSAGENTWHO: TSmallintField
      FieldName = 'AGENTWHO'
      Origin = '"TOURTRIPS"."AGENTWHO"'
    end
    object TOURTRIPSAGENTWHO2: TSmallintField
      FieldName = 'AGENTWHO2'
      Origin = '"TOURTRIPS"."AGENTWHO2"'
    end
    object TOURTRIPSFORPAY: TFloatField
      FieldName = 'FORPAY'
      Origin = '"TOURTRIPS"."FORPAY"'
    end
    object TOURTRIPSFORPAY2: TFloatField
      FieldName = 'FORPAY2'
      Origin = '"TOURTRIPS"."FORPAY2"'
    end
    object TOURTRIPSVATPERC: TFloatField
      FieldName = 'VATPERC'
      Origin = '"TOURTRIPS"."VATPERC"'
    end
    object TOURTRIPSVAT: TFloatField
      FieldName = 'VAT'
      Origin = '"TOURTRIPS"."VAT"'
    end
    object TOURTRIPSVATPERC2: TFloatField
      FieldName = 'VATPERC2'
      Origin = '"TOURTRIPS"."VATPERC2"'
    end
    object TOURTRIPSVAT2: TFloatField
      FieldName = 'VAT2'
      Origin = '"TOURTRIPS"."VAT2"'
    end
    object TOURTRIPSDISABLED: TIBStringField
      FieldName = 'DISABLED'
      Origin = '"TOURTRIPS"."DISABLED"'
      Size = 1
    end
    object TOURTRIPSOPTIONAL: TIBStringField
      FieldName = 'OPTIONAL'
      Origin = '"TOURTRIPS"."OPTIONAL"'
      Size = 1
    end
    object TOURTRIPSNETPERGROUP: TFloatField
      FieldName = 'NETPERGROUP'
      Origin = '"TOURTRIPS"."NETPERGROUP"'
    end
    object TOURTRIPSNETPERGROUP2: TFloatField
      FieldName = 'NETPERGROUP2'
      Origin = '"TOURTRIPS"."NETPERGROUP2"'
    end
    object TOURTRIPSNETVAL: TFloatField
      FieldName = 'NETVAL'
      Origin = '"TOURTRIPS"."NETVAL"'
    end
    object TOURTRIPSNETVAL2: TFloatField
      FieldName = 'NETVAL2'
      Origin = '"TOURTRIPS"."NETVAL2"'
    end
    object TOURTRIPSAGENTPERC: TFloatField
      FieldName = 'AGENTPERC'
      Origin = '"TOURTRIPS"."AGENTPERC"'
    end
    object TOURTRIPSAGENTPERC2: TFloatField
      FieldName = 'AGENTPERC2'
      Origin = '"TOURTRIPS"."AGENTPERC2"'
    end
    object TOURTRIPSBEGINDAY: TIntegerField
      FieldName = 'BEGINDAY'
      Origin = '"TOURTRIPS"."BEGINDAY"'
    end
    object TOURTRIPSGROUPCURRID: TIntegerField
      FieldName = 'GROUPCURRID'
      Origin = '"TOURTRIPS"."GROUPCURRID"'
    end
    object TOURTRIPSGRATISPERSONCOUNT: TIntegerField
      FieldName = 'GRATISPERSONCOUNT'
      Origin = '"TOURTRIPS"."GRATISPERSONCOUNT"'
    end
    object TOURTRIPSGRATISBYVENDOR: TIBStringField
      FieldName = 'GRATISBYVENDOR'
      Origin = '"TOURTRIPS"."GRATISBYVENDOR"'
      Size = 1
    end
    object TOURTRIPSHIDDEN: TIBStringField
      FieldName = 'HIDDEN'
      Origin = '"TOURTRIPS"."HIDDEN"'
      Size = 1
    end
    object TOURTRIPSNETCHECK: TIBStringField
      FieldName = 'NETCHECK'
      Origin = '"TOURTRIPS"."NETCHECK"'
      Size = 1
    end
    object TOURTRIPSV1_RATE: TFloatField
      FieldName = 'V1_RATE'
      Origin = '"TOURTRIPS"."V1_RATE"'
    end
    object TOURTRIPSV1_AGENTPAY: TFloatField
      FieldName = 'V1_AGENTPAY'
      Origin = '"TOURTRIPS"."V1_AGENTPAY"'
    end
    object TOURTRIPSV1_PAY: TFloatField
      FieldName = 'V1_PAY'
      Origin = '"TOURTRIPS"."V1_PAY"'
    end
    object TOURTRIPSV1_VATPERC: TFloatField
      FieldName = 'V1_VATPERC'
      Origin = '"TOURTRIPS"."V1_VATPERC"'
    end
    object TOURTRIPSV1_VAT: TFloatField
      FieldName = 'V1_VAT'
      Origin = '"TOURTRIPS"."V1_VAT"'
    end
    object TOURTRIPSV1_AGENTPERC: TFloatField
      FieldName = 'V1_AGENTPERC'
      Origin = '"TOURTRIPS"."V1_AGENTPERC"'
    end
    object TOURTRIPSV1_NETVAL: TFloatField
      FieldName = 'V1_NETVAL'
      Origin = '"TOURTRIPS"."V1_NETVAL"'
    end
    object TOURTRIPSV1_PAID: TFloatField
      FieldName = 'V1_PAID'
      Origin = '"TOURTRIPS"."V1_PAID"'
    end
    object TOURTRIPSV2_RATE: TFloatField
      FieldName = 'V2_RATE'
      Origin = '"TOURTRIPS"."V2_RATE"'
    end
    object TOURTRIPSV2_AGENTPAY: TFloatField
      FieldName = 'V2_AGENTPAY'
      Origin = '"TOURTRIPS"."V2_AGENTPAY"'
    end
    object TOURTRIPSV2_PAY: TFloatField
      FieldName = 'V2_PAY'
      Origin = '"TOURTRIPS"."V2_PAY"'
    end
    object TOURTRIPSV2_VATPERC: TFloatField
      FieldName = 'V2_VATPERC'
      Origin = '"TOURTRIPS"."V2_VATPERC"'
    end
    object TOURTRIPSV2_VAT: TFloatField
      FieldName = 'V2_VAT'
      Origin = '"TOURTRIPS"."V2_VAT"'
    end
    object TOURTRIPSV2_AGENTPERC: TFloatField
      FieldName = 'V2_AGENTPERC'
      Origin = '"TOURTRIPS"."V2_AGENTPERC"'
    end
    object TOURTRIPSV2_NETVAL: TFloatField
      FieldName = 'V2_NETVAL'
      Origin = '"TOURTRIPS"."V2_NETVAL"'
    end
    object TOURTRIPSV2_PAID: TFloatField
      FieldName = 'V2_PAID'
      Origin = '"TOURTRIPS"."V2_PAID"'
    end
    object TOURTRIPSV1_RATE2: TFloatField
      FieldName = 'V1_RATE2'
      Origin = '"TOURTRIPS"."V1_RATE2"'
    end
    object TOURTRIPSV1_AGENTPAY2: TFloatField
      FieldName = 'V1_AGENTPAY2'
      Origin = '"TOURTRIPS"."V1_AGENTPAY2"'
    end
    object TOURTRIPSV1_PAY2: TFloatField
      FieldName = 'V1_PAY2'
      Origin = '"TOURTRIPS"."V1_PAY2"'
    end
    object TOURTRIPSV1_VATPERC2: TFloatField
      FieldName = 'V1_VATPERC2'
      Origin = '"TOURTRIPS"."V1_VATPERC2"'
    end
    object TOURTRIPSV1_VAT2: TFloatField
      FieldName = 'V1_VAT2'
      Origin = '"TOURTRIPS"."V1_VAT2"'
    end
    object TOURTRIPSV1_AGENTPERC2: TFloatField
      FieldName = 'V1_AGENTPERC2'
      Origin = '"TOURTRIPS"."V1_AGENTPERC2"'
    end
    object TOURTRIPSV1_NETVAL2: TFloatField
      FieldName = 'V1_NETVAL2'
      Origin = '"TOURTRIPS"."V1_NETVAL2"'
    end
    object TOURTRIPSV1_PAID2: TFloatField
      FieldName = 'V1_PAID2'
      Origin = '"TOURTRIPS"."V1_PAID2"'
    end
    object TOURTRIPSV2_RATE2: TFloatField
      FieldName = 'V2_RATE2'
      Origin = '"TOURTRIPS"."V2_RATE2"'
    end
    object TOURTRIPSV2_AGENTPAY2: TFloatField
      FieldName = 'V2_AGENTPAY2'
      Origin = '"TOURTRIPS"."V2_AGENTPAY2"'
    end
    object TOURTRIPSV2_PAY2: TFloatField
      FieldName = 'V2_PAY2'
      Origin = '"TOURTRIPS"."V2_PAY2"'
    end
    object TOURTRIPSV2_VATPERC2: TFloatField
      FieldName = 'V2_VATPERC2'
      Origin = '"TOURTRIPS"."V2_VATPERC2"'
    end
    object TOURTRIPSV2_VAT2: TFloatField
      FieldName = 'V2_VAT2'
      Origin = '"TOURTRIPS"."V2_VAT2"'
    end
    object TOURTRIPSV2_AGENTPERC2: TFloatField
      FieldName = 'V2_AGENTPERC2'
      Origin = '"TOURTRIPS"."V2_AGENTPERC2"'
    end
    object TOURTRIPSV2_NETVAL2: TFloatField
      FieldName = 'V2_NETVAL2'
      Origin = '"TOURTRIPS"."V2_NETVAL2"'
    end
    object TOURTRIPSV2_PAID2: TFloatField
      FieldName = 'V2_PAID2'
      Origin = '"TOURTRIPS"."V2_PAID2"'
    end
    object TOURTRIPSRETURNDAY: TIntegerField
      FieldName = 'RETURNDAY'
      Origin = '"TOURTRIPS"."RETURNDAY"'
    end
    object TOURTRIPSSTARTPOINT: TIntegerField
      FieldName = 'STARTPOINT'
      Origin = '"TOURTRIPS"."STARTPOINT"'
    end
    object TOURTRIPSSTOPPOINT: TIntegerField
      FieldName = 'STOPPOINT'
      Origin = '"TOURTRIPS"."STOPPOINT"'
    end
    object TOURTRIPSDIRECTION: TSmallintField
      FieldName = 'DIRECTION'
      Origin = '"TOURTRIPS"."DIRECTION"'
    end
    object TOURTRIPSPERIODTYPE: TSmallintField
      FieldName = 'PERIODTYPE'
      Origin = '"TOURTRIPS"."PERIODTYPE"'
    end
  end
  object DS_TOURROOMS: TDataSource
    DataSet = TOURROOMS
    Left = 400
    Top = 160
  end
  object TOURROOMS: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    DataSource = DS_TOURTEMPLATES
    SQL.Strings = (
      
        'select TOURROOMS.*,cities.name City,countries.Name Country,hotel' +
        's.NAME, hotels.STARS from TOURROOMS'
      'left join hotels on hotels.HOTELID = TOURROOMS.HOTELID'
      'left join cities on TOURROOMS.cityid =  cities.cityid'
      
        'left join countries on TOURROOMS.countryid =  countries.countryi' +
        'd'
      ''
      'WHERE TOURTEMPLATEID = :TOURTEMPLATEID')
    Left = 488
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TOURTEMPLATEID'
        ParamType = ptUnknown
      end>
    object TOURROOMSTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
      Origin = '"TOURROOMS"."TOURTEMPLATEID"'
    end
    object TOURROOMSTOURROOMID: TIntegerField
      FieldName = 'TOURROOMID'
      Origin = '"TOURROOMS"."TOURROOMID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOURROOMSCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"TOURROOMS"."COUNTRYID"'
    end
    object TOURROOMSCITYID: TIntegerField
      FieldName = 'CITYID'
      Origin = '"TOURROOMS"."CITYID"'
    end
    object TOURROOMSHOTELID: TIntegerField
      FieldName = 'HOTELID'
      Origin = '"TOURROOMS"."HOTELID"'
    end
    object TOURROOMSFROMDATE: TDateTimeField
      FieldName = 'FROMDATE'
      Origin = '"TOURROOMS"."FROMDATE"'
    end
    object TOURROOMSDAYCOUNT: TIntegerField
      FieldName = 'DAYCOUNT'
      Origin = '"TOURROOMS"."DAYCOUNT"'
    end
    object TOURROOMSVENDORID: TIntegerField
      FieldName = 'VENDORID'
      Origin = '"TOURROOMS"."VENDORID"'
    end
    object TOURROOMSGROUPMIN: TSmallintField
      FieldName = 'GROUPMIN'
      Origin = '"TOURROOMS"."GROUPMIN"'
    end
    object TOURROOMSGROUPMAX: TSmallintField
      FieldName = 'GROUPMAX'
      Origin = '"TOURROOMS"."GROUPMAX"'
    end
    object TOURROOMSRATECURRID: TIntegerField
      FieldName = 'RATECURRID'
      Origin = '"TOURROOMS"."RATECURRID"'
    end
    object TOURROOMSMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"TOURROOMS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TOURROOMSRATE: TFloatField
      FieldName = 'RATE'
      Origin = '"TOURROOMS"."RATE"'
    end
    object TOURROOMSRATE2: TFloatField
      FieldName = 'RATE2'
      Origin = '"TOURROOMS"."RATE2"'
    end
    object TOURROOMSAGENTPAY: TFloatField
      FieldName = 'AGENTPAY'
      Origin = '"TOURROOMS"."AGENTPAY"'
    end
    object TOURROOMSAGENTPAY2: TFloatField
      FieldName = 'AGENTPAY2'
      Origin = '"TOURROOMS"."AGENTPAY2"'
    end
    object TOURROOMSAGENTWHO: TSmallintField
      FieldName = 'AGENTWHO'
      Origin = '"TOURROOMS"."AGENTWHO"'
    end
    object TOURROOMSAGENTWHO2: TSmallintField
      FieldName = 'AGENTWHO2'
      Origin = '"TOURROOMS"."AGENTWHO2"'
    end
    object TOURROOMSFORPAY: TFloatField
      FieldName = 'FORPAY'
      Origin = '"TOURROOMS"."FORPAY"'
    end
    object TOURROOMSFORPAY2: TFloatField
      FieldName = 'FORPAY2'
      Origin = '"TOURROOMS"."FORPAY2"'
    end
    object TOURROOMSVATPERC: TFloatField
      FieldName = 'VATPERC'
      Origin = '"TOURROOMS"."VATPERC"'
    end
    object TOURROOMSVAT: TFloatField
      FieldName = 'VAT'
      Origin = '"TOURROOMS"."VAT"'
    end
    object TOURROOMSVATPERC2: TFloatField
      FieldName = 'VATPERC2'
      Origin = '"TOURROOMS"."VATPERC2"'
    end
    object TOURROOMSVAT2: TFloatField
      FieldName = 'VAT2'
      Origin = '"TOURROOMS"."VAT2"'
    end
    object TOURROOMSDISABLED: TIBStringField
      FieldName = 'DISABLED'
      Origin = '"TOURROOMS"."DISABLED"'
      Size = 1
    end
    object TOURROOMSOPTIONAL: TIBStringField
      FieldName = 'OPTIONAL'
      Origin = '"TOURROOMS"."OPTIONAL"'
      Size = 1
    end
    object TOURROOMSNETPERGROUP: TFloatField
      FieldName = 'NETPERGROUP'
      Origin = '"TOURROOMS"."NETPERGROUP"'
    end
    object TOURROOMSNETPERGROUP2: TFloatField
      FieldName = 'NETPERGROUP2'
      Origin = '"TOURROOMS"."NETPERGROUP2"'
    end
    object TOURROOMSNETVAL: TFloatField
      FieldName = 'NETVAL'
      Origin = '"TOURROOMS"."NETVAL"'
    end
    object TOURROOMSNETVAL2: TFloatField
      FieldName = 'NETVAL2'
      Origin = '"TOURROOMS"."NETVAL2"'
    end
    object TOURROOMSAGENTPERC: TFloatField
      FieldName = 'AGENTPERC'
      Origin = '"TOURROOMS"."AGENTPERC"'
    end
    object TOURROOMSAGENTPERC2: TFloatField
      FieldName = 'AGENTPERC2'
      Origin = '"TOURROOMS"."AGENTPERC2"'
    end
    object TOURROOMSBEGINDAY: TIntegerField
      FieldName = 'BEGINDAY'
      Origin = '"TOURROOMS"."BEGINDAY"'
    end
    object TOURROOMSGROUPCURRID: TIntegerField
      FieldName = 'GROUPCURRID'
      Origin = '"TOURROOMS"."GROUPCURRID"'
    end
    object TOURROOMSGRATISPERSONCOUNT: TIntegerField
      FieldName = 'GRATISPERSONCOUNT'
      Origin = '"TOURROOMS"."GRATISPERSONCOUNT"'
    end
    object TOURROOMSGRATISBYVENDOR: TIBStringField
      FieldName = 'GRATISBYVENDOR'
      Origin = '"TOURROOMS"."GRATISBYVENDOR"'
      Size = 1
    end
    object TOURROOMSHIDDEN: TIBStringField
      FieldName = 'HIDDEN'
      Origin = '"TOURROOMS"."HIDDEN"'
      Size = 1
    end
    object TOURROOMSNETCHECK: TIBStringField
      FieldName = 'NETCHECK'
      Origin = '"TOURROOMS"."NETCHECK"'
      Size = 1
    end
    object TOURROOMSV1_RATE: TFloatField
      FieldName = 'V1_RATE'
      Origin = '"TOURROOMS"."V1_RATE"'
    end
    object TOURROOMSV1_AGENTPAY: TFloatField
      FieldName = 'V1_AGENTPAY'
      Origin = '"TOURROOMS"."V1_AGENTPAY"'
    end
    object TOURROOMSV1_PAY: TFloatField
      FieldName = 'V1_PAY'
      Origin = '"TOURROOMS"."V1_PAY"'
    end
    object TOURROOMSV1_VATPERC: TFloatField
      FieldName = 'V1_VATPERC'
      Origin = '"TOURROOMS"."V1_VATPERC"'
    end
    object TOURROOMSV1_VAT: TFloatField
      FieldName = 'V1_VAT'
      Origin = '"TOURROOMS"."V1_VAT"'
    end
    object TOURROOMSV1_AGENTPERC: TFloatField
      FieldName = 'V1_AGENTPERC'
      Origin = '"TOURROOMS"."V1_AGENTPERC"'
    end
    object TOURROOMSV1_NETVAL: TFloatField
      FieldName = 'V1_NETVAL'
      Origin = '"TOURROOMS"."V1_NETVAL"'
    end
    object TOURROOMSV1_PAID: TFloatField
      FieldName = 'V1_PAID'
      Origin = '"TOURROOMS"."V1_PAID"'
    end
    object TOURROOMSV2_RATE: TFloatField
      FieldName = 'V2_RATE'
      Origin = '"TOURROOMS"."V2_RATE"'
    end
    object TOURROOMSV2_AGENTPAY: TFloatField
      FieldName = 'V2_AGENTPAY'
      Origin = '"TOURROOMS"."V2_AGENTPAY"'
    end
    object TOURROOMSV2_PAY: TFloatField
      FieldName = 'V2_PAY'
      Origin = '"TOURROOMS"."V2_PAY"'
    end
    object TOURROOMSV2_VATPERC: TFloatField
      FieldName = 'V2_VATPERC'
      Origin = '"TOURROOMS"."V2_VATPERC"'
    end
    object TOURROOMSV2_VAT: TFloatField
      FieldName = 'V2_VAT'
      Origin = '"TOURROOMS"."V2_VAT"'
    end
    object TOURROOMSV2_AGENTPERC: TFloatField
      FieldName = 'V2_AGENTPERC'
      Origin = '"TOURROOMS"."V2_AGENTPERC"'
    end
    object TOURROOMSV2_NETVAL: TFloatField
      FieldName = 'V2_NETVAL'
      Origin = '"TOURROOMS"."V2_NETVAL"'
    end
    object TOURROOMSV2_PAID: TFloatField
      FieldName = 'V2_PAID'
      Origin = '"TOURROOMS"."V2_PAID"'
    end
    object TOURROOMSV1_RATE2: TFloatField
      FieldName = 'V1_RATE2'
      Origin = '"TOURROOMS"."V1_RATE2"'
    end
    object TOURROOMSV1_AGENTPAY2: TFloatField
      FieldName = 'V1_AGENTPAY2'
      Origin = '"TOURROOMS"."V1_AGENTPAY2"'
    end
    object TOURROOMSV1_PAY2: TFloatField
      FieldName = 'V1_PAY2'
      Origin = '"TOURROOMS"."V1_PAY2"'
    end
    object TOURROOMSV1_VATPERC2: TFloatField
      FieldName = 'V1_VATPERC2'
      Origin = '"TOURROOMS"."V1_VATPERC2"'
    end
    object TOURROOMSV1_VAT2: TFloatField
      FieldName = 'V1_VAT2'
      Origin = '"TOURROOMS"."V1_VAT2"'
    end
    object TOURROOMSV1_AGENTPERC2: TFloatField
      FieldName = 'V1_AGENTPERC2'
      Origin = '"TOURROOMS"."V1_AGENTPERC2"'
    end
    object TOURROOMSV1_NETVAL2: TFloatField
      FieldName = 'V1_NETVAL2'
      Origin = '"TOURROOMS"."V1_NETVAL2"'
    end
    object TOURROOMSV1_PAID2: TFloatField
      FieldName = 'V1_PAID2'
      Origin = '"TOURROOMS"."V1_PAID2"'
    end
    object TOURROOMSV2_RATE2: TFloatField
      FieldName = 'V2_RATE2'
      Origin = '"TOURROOMS"."V2_RATE2"'
    end
    object TOURROOMSV2_AGENTPAY2: TFloatField
      FieldName = 'V2_AGENTPAY2'
      Origin = '"TOURROOMS"."V2_AGENTPAY2"'
    end
    object TOURROOMSV2_PAY2: TFloatField
      FieldName = 'V2_PAY2'
      Origin = '"TOURROOMS"."V2_PAY2"'
    end
    object TOURROOMSV2_VATPERC2: TFloatField
      FieldName = 'V2_VATPERC2'
      Origin = '"TOURROOMS"."V2_VATPERC2"'
    end
    object TOURROOMSV2_VAT2: TFloatField
      FieldName = 'V2_VAT2'
      Origin = '"TOURROOMS"."V2_VAT2"'
    end
    object TOURROOMSV2_AGENTPERC2: TFloatField
      FieldName = 'V2_AGENTPERC2'
      Origin = '"TOURROOMS"."V2_AGENTPERC2"'
    end
    object TOURROOMSV2_NETVAL2: TFloatField
      FieldName = 'V2_NETVAL2'
      Origin = '"TOURROOMS"."V2_NETVAL2"'
    end
    object TOURROOMSV2_PAID2: TFloatField
      FieldName = 'V2_PAID2'
      Origin = '"TOURROOMS"."V2_PAID2"'
    end
    object TOURROOMSFEEDID: TIntegerField
      FieldName = 'FEEDID'
      Origin = '"TOURROOMS"."FEEDID"'
    end
    object TOURROOMSPERIODTYPE: TSmallintField
      FieldName = 'PERIODTYPE'
      Origin = '"TOURROOMS"."PERIODTYPE"'
    end
    object TOURROOMSNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"HOTELS"."NAME"'
      Size = 35
    end
    object TOURROOMSSTARS: TIBStringField
      FieldName = 'STARS'
      Origin = '"HOTELS"."STARS"'
      Size = 10
    end
    object TOURROOMSCITY: TIBStringField
      FieldName = 'CITY'
      Origin = '"CITIES"."NAME"'
      Size = 190
    end
    object TOURROOMSCOUNTRY: TIBStringField
      FieldName = 'COUNTRY'
      Origin = '"COUNTRIES"."NAME"'
      Size = 30
    end
    object TOURROOMSFROMTIME: TFloatField
      FieldName = 'FROMTIME'
      Origin = '"TOURROOMS"."FROMTIME"'
    end
    object TOURROOMSTILLTIME: TFloatField
      FieldName = 'TILLTIME'
      Origin = '"TOURROOMS"."TILLTIME"'
    end
  end
  object DS_TOUREXCURS: TDataSource
    DataSet = TOUREXCURS
    Left = 400
    Top = 224
  end
  object TOUREXCURS: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    DataSource = DS_TOURTEMPLATES
    SQL.Strings = (
      'SELECT TOUREXCURS.* ,EXCURSION.name,'
      'EXCURSION.STANDDAYS DAYCOUNT  from TOUREXCURS'
      
        'LET JOIN EXCURSION on EXCURSION.EID = TOUREXCURS.excursid WHERE ' +
        'TOURTEMPLATEID = :TOURTEMPLATEID'
      ''
      'order by BEGINDAY, EXTIME')
    Left = 488
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TOURTEMPLATEID'
        ParamType = ptUnknown
      end>
    object TOUREXCURSTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
      Origin = '"TOUREXCURS"."TOURTEMPLATEID"'
    end
    object TOUREXCURSTOUREXCURID: TIntegerField
      FieldName = 'TOUREXCURID'
      Origin = '"TOUREXCURS"."TOUREXCURID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TOUREXCURSCOUNTRYID: TIntegerField
      FieldName = 'COUNTRYID'
      Origin = '"TOUREXCURS"."COUNTRYID"'
    end
    object TOUREXCURSCITYID: TIntegerField
      FieldName = 'CITYID'
      Origin = '"TOUREXCURS"."CITYID"'
    end
    object TOUREXCURSEXCURSID: TIntegerField
      FieldName = 'EXCURSID'
      Origin = '"TOUREXCURS"."EXCURSID"'
    end
    object TOUREXCURSATDATE: TDateTimeField
      FieldName = 'ATDATE'
      Origin = '"TOUREXCURS"."ATDATE"'
    end
    object TOUREXCURSVENDORID: TIntegerField
      FieldName = 'VENDORID'
      Origin = '"TOUREXCURS"."VENDORID"'
    end
    object TOUREXCURSGROUPMIN: TSmallintField
      FieldName = 'GROUPMIN'
      Origin = '"TOUREXCURS"."GROUPMIN"'
    end
    object TOUREXCURSGROUPMAX: TSmallintField
      FieldName = 'GROUPMAX'
      Origin = '"TOUREXCURS"."GROUPMAX"'
    end
    object TOUREXCURSRATECURRID: TIntegerField
      FieldName = 'RATECURRID'
      Origin = '"TOUREXCURS"."RATECURRID"'
    end
    object TOUREXCURSMEMO: TMemoField
      FieldName = 'MEMO'
      Origin = '"TOUREXCURS"."MEMO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object TOUREXCURSRATE: TFloatField
      FieldName = 'RATE'
      Origin = '"TOUREXCURS"."RATE"'
    end
    object TOUREXCURSRATE2: TFloatField
      FieldName = 'RATE2'
      Origin = '"TOUREXCURS"."RATE2"'
    end
    object TOUREXCURSAGENTPAY: TFloatField
      FieldName = 'AGENTPAY'
      Origin = '"TOUREXCURS"."AGENTPAY"'
    end
    object TOUREXCURSAGENTPAY2: TFloatField
      FieldName = 'AGENTPAY2'
      Origin = '"TOUREXCURS"."AGENTPAY2"'
    end
    object TOUREXCURSAGENTWHO: TSmallintField
      FieldName = 'AGENTWHO'
      Origin = '"TOUREXCURS"."AGENTWHO"'
    end
    object TOUREXCURSAGENTWHO2: TSmallintField
      FieldName = 'AGENTWHO2'
      Origin = '"TOUREXCURS"."AGENTWHO2"'
    end
    object TOUREXCURSFORPAY: TFloatField
      FieldName = 'FORPAY'
      Origin = '"TOUREXCURS"."FORPAY"'
    end
    object TOUREXCURSFORPAY2: TFloatField
      FieldName = 'FORPAY2'
      Origin = '"TOUREXCURS"."FORPAY2"'
    end
    object TOUREXCURSVATPERC: TFloatField
      FieldName = 'VATPERC'
      Origin = '"TOUREXCURS"."VATPERC"'
    end
    object TOUREXCURSVAT: TFloatField
      FieldName = 'VAT'
      Origin = '"TOUREXCURS"."VAT"'
    end
    object TOUREXCURSVATPERC2: TFloatField
      FieldName = 'VATPERC2'
      Origin = '"TOUREXCURS"."VATPERC2"'
    end
    object TOUREXCURSVAT2: TFloatField
      FieldName = 'VAT2'
      Origin = '"TOUREXCURS"."VAT2"'
    end
    object TOUREXCURSDISABLED: TIBStringField
      FieldName = 'DISABLED'
      Origin = '"TOUREXCURS"."DISABLED"'
      Size = 1
    end
    object TOUREXCURSOPTIONAL: TIBStringField
      FieldName = 'OPTIONAL'
      Origin = '"TOUREXCURS"."OPTIONAL"'
      Size = 1
    end
    object TOUREXCURSNETPERGROUP: TFloatField
      FieldName = 'NETPERGROUP'
      Origin = '"TOUREXCURS"."NETPERGROUP"'
    end
    object TOUREXCURSNETPERGROUP2: TFloatField
      FieldName = 'NETPERGROUP2'
      Origin = '"TOUREXCURS"."NETPERGROUP2"'
    end
    object TOUREXCURSNETVAL: TFloatField
      FieldName = 'NETVAL'
      Origin = '"TOUREXCURS"."NETVAL"'
    end
    object TOUREXCURSNETVAL2: TFloatField
      FieldName = 'NETVAL2'
      Origin = '"TOUREXCURS"."NETVAL2"'
    end
    object TOUREXCURSAGENTPERC: TFloatField
      FieldName = 'AGENTPERC'
      Origin = '"TOUREXCURS"."AGENTPERC"'
    end
    object TOUREXCURSAGENTPERC2: TFloatField
      FieldName = 'AGENTPERC2'
      Origin = '"TOUREXCURS"."AGENTPERC2"'
    end
    object TOUREXCURSBEGINDAY: TIntegerField
      FieldName = 'BEGINDAY'
      Origin = '"TOUREXCURS"."BEGINDAY"'
    end
    object TOUREXCURSEXTIME: TFloatField
      FieldName = 'EXTIME'
      Origin = '"TOUREXCURS"."EXTIME"'
    end
    object TOUREXCURSGROUPCURRID: TIntegerField
      FieldName = 'GROUPCURRID'
      Origin = '"TOUREXCURS"."GROUPCURRID"'
    end
    object TOUREXCURSGRATISPERSONCOUNT: TIntegerField
      FieldName = 'GRATISPERSONCOUNT'
      Origin = '"TOUREXCURS"."GRATISPERSONCOUNT"'
    end
    object TOUREXCURSGRATISBYVENDOR: TIBStringField
      FieldName = 'GRATISBYVENDOR'
      Origin = '"TOUREXCURS"."GRATISBYVENDOR"'
      Size = 1
    end
    object TOUREXCURSHIDDEN: TIBStringField
      FieldName = 'HIDDEN'
      Origin = '"TOUREXCURS"."HIDDEN"'
      Size = 1
    end
    object TOUREXCURSNETCHECK: TIBStringField
      FieldName = 'NETCHECK'
      Origin = '"TOUREXCURS"."NETCHECK"'
      Size = 1
    end
    object TOUREXCURSV1_RATE: TFloatField
      FieldName = 'V1_RATE'
      Origin = '"TOUREXCURS"."V1_RATE"'
    end
    object TOUREXCURSV1_AGENTPAY: TFloatField
      FieldName = 'V1_AGENTPAY'
      Origin = '"TOUREXCURS"."V1_AGENTPAY"'
    end
    object TOUREXCURSV1_PAY: TFloatField
      FieldName = 'V1_PAY'
      Origin = '"TOUREXCURS"."V1_PAY"'
    end
    object TOUREXCURSV1_VATPERC: TFloatField
      FieldName = 'V1_VATPERC'
      Origin = '"TOUREXCURS"."V1_VATPERC"'
    end
    object TOUREXCURSV1_VAT: TFloatField
      FieldName = 'V1_VAT'
      Origin = '"TOUREXCURS"."V1_VAT"'
    end
    object TOUREXCURSV1_AGENTPERC: TFloatField
      FieldName = 'V1_AGENTPERC'
      Origin = '"TOUREXCURS"."V1_AGENTPERC"'
    end
    object TOUREXCURSV1_NETVAL: TFloatField
      FieldName = 'V1_NETVAL'
      Origin = '"TOUREXCURS"."V1_NETVAL"'
    end
    object TOUREXCURSV1_PAID: TFloatField
      FieldName = 'V1_PAID'
      Origin = '"TOUREXCURS"."V1_PAID"'
    end
    object TOUREXCURSV2_RATE: TFloatField
      FieldName = 'V2_RATE'
      Origin = '"TOUREXCURS"."V2_RATE"'
    end
    object TOUREXCURSV2_AGENTPAY: TFloatField
      FieldName = 'V2_AGENTPAY'
      Origin = '"TOUREXCURS"."V2_AGENTPAY"'
    end
    object TOUREXCURSV2_PAY: TFloatField
      FieldName = 'V2_PAY'
      Origin = '"TOUREXCURS"."V2_PAY"'
    end
    object TOUREXCURSV2_VATPERC: TFloatField
      FieldName = 'V2_VATPERC'
      Origin = '"TOUREXCURS"."V2_VATPERC"'
    end
    object TOUREXCURSV2_VAT: TFloatField
      FieldName = 'V2_VAT'
      Origin = '"TOUREXCURS"."V2_VAT"'
    end
    object TOUREXCURSV2_AGENTPERC: TFloatField
      FieldName = 'V2_AGENTPERC'
      Origin = '"TOUREXCURS"."V2_AGENTPERC"'
    end
    object TOUREXCURSV2_NETVAL: TFloatField
      FieldName = 'V2_NETVAL'
      Origin = '"TOUREXCURS"."V2_NETVAL"'
    end
    object TOUREXCURSV2_PAID: TFloatField
      FieldName = 'V2_PAID'
      Origin = '"TOUREXCURS"."V2_PAID"'
    end
    object TOUREXCURSV1_RATE2: TFloatField
      FieldName = 'V1_RATE2'
      Origin = '"TOUREXCURS"."V1_RATE2"'
    end
    object TOUREXCURSV1_AGENTPAY2: TFloatField
      FieldName = 'V1_AGENTPAY2'
      Origin = '"TOUREXCURS"."V1_AGENTPAY2"'
    end
    object TOUREXCURSV1_PAY2: TFloatField
      FieldName = 'V1_PAY2'
      Origin = '"TOUREXCURS"."V1_PAY2"'
    end
    object TOUREXCURSV1_VATPERC2: TFloatField
      FieldName = 'V1_VATPERC2'
      Origin = '"TOUREXCURS"."V1_VATPERC2"'
    end
    object TOUREXCURSV1_VAT2: TFloatField
      FieldName = 'V1_VAT2'
      Origin = '"TOUREXCURS"."V1_VAT2"'
    end
    object TOUREXCURSV1_AGENTPERC2: TFloatField
      FieldName = 'V1_AGENTPERC2'
      Origin = '"TOUREXCURS"."V1_AGENTPERC2"'
    end
    object TOUREXCURSV1_NETVAL2: TFloatField
      FieldName = 'V1_NETVAL2'
      Origin = '"TOUREXCURS"."V1_NETVAL2"'
    end
    object TOUREXCURSV1_PAID2: TFloatField
      FieldName = 'V1_PAID2'
      Origin = '"TOUREXCURS"."V1_PAID2"'
    end
    object TOUREXCURSV2_RATE2: TFloatField
      FieldName = 'V2_RATE2'
      Origin = '"TOUREXCURS"."V2_RATE2"'
    end
    object TOUREXCURSV2_AGENTPAY2: TFloatField
      FieldName = 'V2_AGENTPAY2'
      Origin = '"TOUREXCURS"."V2_AGENTPAY2"'
    end
    object TOUREXCURSV2_PAY2: TFloatField
      FieldName = 'V2_PAY2'
      Origin = '"TOUREXCURS"."V2_PAY2"'
    end
    object TOUREXCURSV2_VATPERC2: TFloatField
      FieldName = 'V2_VATPERC2'
      Origin = '"TOUREXCURS"."V2_VATPERC2"'
    end
    object TOUREXCURSV2_VAT2: TFloatField
      FieldName = 'V2_VAT2'
      Origin = '"TOUREXCURS"."V2_VAT2"'
    end
    object TOUREXCURSV2_AGENTPERC2: TFloatField
      FieldName = 'V2_AGENTPERC2'
      Origin = '"TOUREXCURS"."V2_AGENTPERC2"'
    end
    object TOUREXCURSV2_NETVAL2: TFloatField
      FieldName = 'V2_NETVAL2'
      Origin = '"TOUREXCURS"."V2_NETVAL2"'
    end
    object TOUREXCURSV2_PAID2: TFloatField
      FieldName = 'V2_PAID2'
      Origin = '"TOUREXCURS"."V2_PAID2"'
    end
    object TOUREXCURSPERIODTYPE: TSmallintField
      FieldName = 'PERIODTYPE'
      Origin = '"TOUREXCURS"."PERIODTYPE"'
    end
    object TOUREXCURSEXCURSNAME: TIBStringField
      FieldName = 'NAME'
      Origin = '"EXCURSION"."NAME"'
      Size = 45
    end
    object TOUREXCURSDAYCOUNT: TIntegerField
      FieldName = 'DAYCOUNT'
      Origin = '"EXCURSION"."STANDDAYS"'
    end
    object TOUREXCURSTILLTIME: TFloatField
      FieldName = 'TILLTIME'
      Origin = '"TOUREXCURS"."TILLTIME"'
    end
  end
  object ImageListAction: TImageList
    Width = 30
    Left = 944
    Top = 137
    Bitmap = {
      494C01010800090004001E001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000078000000300000000100200000000000005A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00DFDFF0009594CB00C6C6E000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002322BE007F7EBA00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00DF640F00D9620900DA60
      0900D6590800D0540600CE4E0200CB4B0000D3500800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5600D00C965
      1100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ECECF4001410C100110EFF000B09DD00A5A5
      C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006665
      B100110CFC007D7CAF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EC8A2100F6C34E00F09F
      2000F0971800EF911500EE8B0F00E37D0A00DA680A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C45D0B00DD963B00EDBD
      6500C7631200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E6F3E000E9F4E5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E4F2
      DE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B7B6DB00110FDF000E0CFC00100EFF00110F
      B600F4F4F700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2D2E2000D0C
      DC000D0BD600D6D6E600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EC882100F6D47F00EFA5
      3200ED951D00ED941C00EF921700E2821100DA6B0F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C45D0D00DE922C00F5D67500F6BF
      2900D27C1600C9681700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8EDCF00ADDA99008ACB6E00B3DD
      A100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C9E6BC009BD2
      83008FCD7400D7ECCF0000000000000000000000000000000000000000000000
      0000000000000000000000000000C7C7E0002524D7000F0EFB000E0EEF000F0F
      FA007271BB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F7FB001B19BF001313
      FF00201EA600FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00ED912500F6D88A00F0AE
      3D00EF9F2600EE9D2600F09A1F00E4891900DB721300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C2580900E3931F00FCDC6E00F2B62B00E68A
      0000EF9B0000CE720C00C9681800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000BAE0AA00B0DB
      9E00B2DC9F00B2DC9F00B2DC9F00B7DEA600B1DC9E0085C869009BD282007EC4
      5F009DD38600B5DDA300B2DC9F00B2DC9F00B2DC9F00B2DC9F00B2DC9F00B2DC
      9F00B2DC9F00B2DC9F00B3DDA100B1DC9E00B0DB9E00B1DC9E009BD283008BCB
      6F0099D17F0081C56200BBE0AA00E7F3E1000000000000000000000000000000
      0000000000000000000000000000FFFFFF003C3BB3002627FF00090AEE001214
      FA000F10DB00DDDDEE00FFFFFF00FFFFFF00FFFFFF004F4EC5001416FF001112
      E5009F9FCE00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF9A2B00F8DE9C00F2B4
      4700F0A63200F0A53000F1A32900E7932100DC781900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00C1570700E59F2E00FEE68C00F2BD3800EFA71B00EDA4
      1800E68F0200ED9E0200D0730A00C9681900FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000080C661006BBE
      46006BBE46006BBE46006BBE46006BBE460070BF4D007DC55E0098D17F0084C8
      66006EBE4B006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE
      46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE460071BF4E0088CA
      6A0098D17F0076C255006ABC450081C562000000000000000000000000000000
      0000000000000000000000000000FFFFFF00E0E0F000272BC600252CFE000D0E
      EE00161CFE003232CC00FFFFFF00FFFFFF006969D600181DF900191EFE002121
      C000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0A03100F9E2AB00F3BB
      5300F2AF3B00F1AC3900F3AA3300E89E2B00DC781F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00C1560500E5A54000FFF3B100F7D47400F5BD3600F3B53400EFA9
      2100EC9C0E00E48C0000F0A90E00D4760800C9681A00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000000000008FCC720074C0
      510075C1540075C1540075C1540075C1530079C358007DC55D0082C763007DC5
      5D0078C2570075C1530075C1540075C1540075C1540075C1540075C1540075C1
      540075C1540075C1540080C661007EC55E0079C2560074C0510072C050007DC5
      5D0084C7640076C154006BBE460072C04F000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00ABAAE100393FE0002531
      FA00121CF6001B25F6009492E1008988E3001D26F7001E2BFF00151BE200C3C2
      E900FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1A13700FAEABE00F4C2
      6100F3B54400F2B64500F4B33E00E7A53500E0822500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00C1550500E5A63F00FFFCCC00FDE9A200F8C94700F6C95100F4BD3C00F1B0
      2C00EEA41A00E9950500E18B0000F0AD1500D5770800C0550000FFFFFF000000
      00000000000000000000000000000000000000000000000000008CCB71006DBD
      49006DBE49006DBE49006DBE49006DBE49006FBE4B0071BF4E0075C1530071BF
      4E006EBE4B006DBE49006DBE49006DBE49006DBE49006DBE49006DBE49006DBE
      49006DBE49006DBE490071BF4E00C2E3B50000000000CCE8C0007CC45B006FBF
      4C0075C1530071BF4E0074C152009BD283000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00726FD8004C57
      F6002839F8001B2DF7001F29EE002131F6002236F9001F2FF2006B68DD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ED820B00ED952500ED8F1B00EA780300F3A94300FBE7B600F6C5
      6A00F4BD5400F4BB5100F6BA4A00EAAA4100D7782100DC700E00E26E1000E578
      1600E46A0C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C157
      0800E4A54100FFFEC800FFFBC800FDDE6700FBD46300F7CD5500F5C54700F3B6
      3500EFA82400ED9F1200E9930000E6910100F4BA2300D47A0B00C05500000000
      00000000000000000000000000000000000000000000000000008BCB6E006BBE
      46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE
      46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE
      46006BBE46006BBE46006BBE4600BAE0AA0000000000D1EAC60082C763006BBE
      46006BBE46006BBE46006BBD4600CCE7BF000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00615F
      DC005261F500293CF600253AF800263AF7002638F6003C3ADE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EF830700EEA03100FAE39F00F9D59300F8D17C00F8CC7000F7C8
      6800F6C56300F5C15B00F6C05500EDAF4A00DF973700E99B3600F0B03E00E580
      1A00E56508000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DA8A
      2600F8BE3300F3B83B00ECA01A00E7A33B00FFF7C700FAD26100F7C84E00F5BF
      4000F2B32F00F3AB1C00CA670900BE510000BE510000BF540000C05500000000
      000000000000000000000000000000000000000000000000000092CE79006FBE
      4B0084C7640082C7630082C7630082C7630079C358006ABC45007AC3590084C7
      640082C7630082C7630080C6610072C04F006EBE4B0082C7630082C7630082C7
      630082C763007CC45B006BBD4700ACDA9900D9EDD000CCE8C000A2D58A008CCB
      71006BBE460096D07E00D6ECCC00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008B8B
      EC002939F1002F45F8002338F600253EF8001F28EA00E3E1FB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00ED710400F1AA5500FEFDF100FCE7BF00F9CE7000F8CF
      7A00F7CB7200F7C86900F6C36100F6C05900F7C05400F8CB5D00ED9A2E00E667
      0A00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E8A03700FFFDD900FBD76900F8CB5500F6C7
      4900F4BD3900F5B42700C5610B00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000098D17F00A5D6
      8F0000000000000000000000000000000000C8E6BB0073C05100D1EAC6000000
      0000000000000000000000000000A4D68E009CD2840000000000000000000000
      000000000000D8EDCF0084C86600C2E3B50000000000E6F3E100C1E2B200BFE2
      B000C2E3B5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00C1C0FA00353FF000314C
      F9002B46F800253FF6004E69F900536EF9002341F6004A4FF000F3F3FE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00ED6F0000F1AC5000FEF8E400FBE1AD00F9D1
      7D00F8D27F00F8CF7700F7CA6D00F7C76500F9D06F00EEA13900E7690700FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EAA83D00FFFCD800FBDC7100F9D26000F7C9
      5200F6C44300F8BC3300C5600A00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000A9D89200AFDB
      9B0000000000000000000000000000000000CDE8C30074C15200D6ECCC000000
      0000000000000000000000000000A9D89300A2D58A0000000000000000000000
      000000000000DCEED50085C86900B8DFA80000000000DEEFD600ADDA9A00CEE8
      C200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F9F9FF005D60F400314CF6003656F8002F4A
      F600304FF600516EF9003D3FF200555CF4006B8AFA00385EF8002833F300D5D3
      FC00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00EE700000F2B35C00FFFAEB00FCE2
      AD00F9D58300F9D38300F9CE7A00FAD88500EFAE4A00E96F0800FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EBA83C00FFFEDD00FDE07A00FBD76900F9CF
      5C00F7CA4D00FCC63E00C5600900FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000B4DDA200A4D6
      8E00E5F2DF00DFF0D800E0F0D900DEEFD700BAE0AA0074C05100BEE1AE00E5F2
      DF00DFF0D800E1F1DA00D4EBCA009ED3860094CF7A00E4F2DE00DFF0D800E0F0
      D900E1F1DA00C2E3B5007EC55E0084C86600A9D89500ACD99700C5E4B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5FF5003B61F8003A5AF7003150F7003D5F
      F700637DFA004042F600E9E8FD00CAC8FB003F40F500778EFA006389FA002D45
      F5009696FA00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EF780000F5BB6800FFFA
      EC00FCE1AC00FAD78800FCE19F00F4BB5F00ED770900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ECAA3D00FFFFE000FEE38000FCDC7200F9D3
      6500F8CD5600FDCD4700C55F0800FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000BBE0AB0074C1
      52007EC45F007EC55E007EC55E007EC55E007BC35A006BBD470078C257007FC6
      61007EC55E007EC55E007DC55E0075C154006FBE4B007EC45F007EC55E007EC5
      5E007EC55E007CC45B006FBE4B006BBE46006BBE4600B8DFA800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004755F8004F76F8003E61F8005679F8006279
      F9005955F700F7F6FF00FFFFFF00FFFFFF00F0EFFF00726DF700525AF8007F9C
      FA006B89FA005661F700D4D3FD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F17D0000F5C1
      7000FFF9EC00FEEFD000F6C67100EE7F0A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EDAB3E00FFFFE300FEE78900FDE17A00FBDA
      6F00FAD06300FFD55500C45E0700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000DFF0D8007BC4
      5A006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE
      46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE46006BBE
      46006BBE46006BBE46006BBE460079C35900CBE7BE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006462F600697BF9006C82F9005055F6008984
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDAFD006561
      F6005455F7006B7EF8004A4FF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F386
      0100F8CF8700F9DC9B00F1880C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEB14400FFFFFA00FFF49D00FFF08E00FFEB
      8300FFE67600FFE76700C45E0600FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000DDEF
      D6009DD3860098D17F0099D17F0099D17F0099D17F0099D17F0099D17F0099D1
      7F0099D17F0099D17F0099D17F0099D17F0099D17F0099D17F0099D17F0099D1
      7F0099D17F0098D17F00B7DEA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B9B7FB005353F6005C5FF7006763F600F5F5
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4E3
      FE009E9BF9006566F6006D6CF700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2950E00F3971400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEA42A00F1BC5A00EDAC3800E9A23100E398
      2E00DE912800DC8C2500CA671300FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000095959D0088889000E6E6E8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E9E9EB008888900096969E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D2BC8700BA913500ECE4D000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000083838D007A7A8400E2E2E4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6E6E7007A7A840086868F00000000000000
      000000000000000000000000000000000000000000000000000000000000FAED
      EB00FAEFEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FAEBEA0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E3D5B600B589
      2300B17D0700C4A55D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080AE6900639C470000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639C47007EAD6600000000000000
      000000000000000000000000000000000000878790007A7A8400E4E4E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E8E8E9007A7A840089899100000000000000
      0000000000000000000000000000000000000000000000000000F8E3E100F3C4
      C000EEABA500F4C9C50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6D8D500F0B8B300EFAFA900F8E2E0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E4D5B400B07D0A00B17E
      0B00B17E0B00E0D3AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000072A5590057953800E7EFE300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7EFE3005795380070A45600000000000000
      000000000000000000000000000000000000878790007A7A8400DFDFE1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DFDFE2007A7A840089899200000000000000
      0000F4CECA00F3C7C300F3C8C400F3C8C400F3C8C400F4CBC700F3C7C300EDA8
      A200F0B7B200ECA39C00F1B9B400F4CAC600F3C8C400F3C8C400F3C8C400F3C8
      C400F3C8C400F3C8C400F3C8C400F3C8C400F4C9C500F3C7C300F3C7C300F3C7
      C300F0B8B300EDACA600F0B6B000EDA59E00F5CECA00FAEDEC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EFE8D800D6C29100CAAB6500C19E4700AF810F00B2810D00B281
      0E00B17E0900E6D9BB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000078A85E005795380000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005795380075A75B00000000000000
      000000000000000000000000000000000000888890007A7A840085858E008888
      9100888890008888900088889000888890008888900088889000878790008787
      900087879000878790008787900086868F0086868F008787900086868F008686
      8F0086868F0086868F0085858E0082828B007A7A840089899100000000000000
      0000EDA49E00EC968E00EC968E00EC968E00EC968E00EC968E00EB999100ECA2
      9C00F0B5B000EEA7A100EA989000EC968E00EC968E00EC968E00EC968E00EC96
      8E00EC968E00EC968E00EC968E00EC968E00EC968E00EC968E00EC968E00EC96
      8E00EB999200EEAAA300F0B5B000EB9D9600EA948C00EDA59E00000000000000
      000000000000000000000000000000000000000000000000000000000000F5F1
      E700CBAE6700B3821100B4820C00B4820C00B78A1D00CAA85500B4830E00B483
      0E00B4810C00C39E4700F1ECDE00000000000000000000000000000000000000
      000000000000000000000000000000000000BAD3AF00B6D0A800B6D0A800B6D0
      A800679E4B0057953800A8C79800B6D0AA00B4CFA600B7D1A900B4CFA600B6D0
      AA00B5CFA800B6D0A800B5CFA800B6D0A800B6D0A800B5CFA800B6D0AA00B4CF
      A600B7D1A900B4CFA600B7D1A900A8C7980057953800659D4B00B6D0A800B6D0
      A800B6D0A800BBD3AD000000000000000000888890007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A83008C8C9400000000000000
      0000EFAEA800EB9B9400EA9C9500EA9C9500EA9C9500EB9D9500EC9F9800EDA2
      9B00EDA69F00EDA29B00EC9F9800EB9D9500EA9C9500EA9C9500EA9C9500EA9C
      9500EA9C9500EA9C9500EA9C9500EA9C9500EDA49D00ECA39C00EC9E9700EB9B
      9400EB9B9300EDA29B00EDA69F00EB9D9600EC968E00EB9A9300000000000000
      0000000000000000000000000000000000000000000000000000F1ECDE00BD93
      2E00B6830800B7850C00B7850D00B7850D00FEFEFC00FEFEFC00B7850D00B785
      0D00B7850D00B6830900B98C1E00F2ECD9000000000000000000000000000000
      00000000000000000000000000000000000088B372007CAC64007EAC65007DAC
      67005F994200579538007DAC670078A9600084B16F0076A85D0084B16F007AA9
      600082B06C007BAB640080AE6B0080AE69007DAC670081AF6B0079AA610084B1
      6D0076A85D0084B16F0077A960007EAD6600579538005F99420080AD68007CAC
      64007DAC670088B372000000000000000000878790007A7A8400D0D0D400E7E7
      E900EDEDEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EEADA700EA968F00EA978F00EA978F00EA978F00EA978F00EA989000EB9A
      9200EB9D9500EB9A9200EA989000EA978F00EA978F00EA978F00EA978F00EA97
      8F00EA978F00EA978F00EA978F00EA978F00EB999200F5D3D00000000000F7DA
      D800ECA19A00EA989100EB9D9500EB999200EB9C9400F0B7B200000000000000
      0000000000000000000000000000000000000000000000000000C0973400B886
      0A00B8870E00B8870D00B8870D00B8870D00FEFEFC00FEFEFC00B8880E00B887
      0D00B8870D00B8870E00B8850900BD942B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000079AA61005795380000000000DDE9D80000000000D7E5D10000000000E4ED
      E00000000000E5EEE20000000000000000000000000000000000E9F0E5000000
      0000D9E6D20000000000DBE7D500000000005693370077A96000000000000000
      000000000000000000000000000000000000878790007A7A8400E8E8E9000000
      0000DDDDDE00D9D9DC00D9D9DC00D8D8DB00D8D8DB00D8D8DB00D8D8DB00D8D8
      DB00D8D8DB00D8D8DB00D8D8DB00D7D7DA00D7D7DA00D7D7DA00D7D7DA00D7D7
      DA00D7D7DA00D6D6D900D6D6D900D6D6D900D6D6D900DBDBDD00000000000000
      0000EEACA600EC968E00EC968E00EC968E00EC968E00EC968E00EC968E00EC96
      8E00EC968E00EC968E00EC968E00EC968E00EC968E00EC968E00EC968E00EC96
      8E00EC968E00EC968E00EC968E00EC968E00EC968E00F4CECA0000000000F7DE
      DB00EDA69F00EC968E00EC968E00EC968E00EA958D00F7DAD700000000000000
      00000000000000000000000000000000000000000000E3CE9E00B9860800BB8A
      0F00BB8A0F00BB8A0F00BB8A0F00BB890F00BE901D00C79F3B00BB8A0F00BB8A
      0F00BB8A0F00BB8A0F00BB8A1000B9860700DEC78F0000000000000000000000
      000000000000000000000000000000000000DDE9D80000000000E7EFE300E7EF
      E30078A9600057953800E3EDDF00D7E5D10000000000D6E4CF00E3EDDF00AFCC
      A100AFCCA100A8C79700ADCA9E00ABC99D00AAC89A00ADCA9E00B1CDA200E1EB
      DB00D7E5D10000000000D5E4CD00E6EEE2005693370076A85D0000000000E4ED
      E00000000000DFEADB000000000000000000878790007A7A8400EAEAEB00DADA
      DC007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A840080808A00000000000000
      0000EFB1AB00EA989000EDA69F00EDA69F00EDA69F00EDA69F00EC9F9800EA94
      8C00ECA09900EDA69F00EDA69F00EDA69F00EDA49D00EB9A9300EA989000EDA6
      9F00EDA69F00EDA69F00EDA69F00ECA19A00EA968E00F3C4BF00F8E3E200F7DA
      D800F1BCB700EEADA700EC968E00F0B4AF00F8E1DF0000000000000000000000
      00000000000000000000000000000000000000000000C7A13E00BD890C00BD8B
      0F00BD8B0F00BD8B0F00BE8B0E00BF8C0F00C8A34100DCC48600BE8B0F00BD8B
      0F00BD8B0F00BD8B0F00BD8A0E00BD8A0D00C49B340000000000000000000000
      000000000000000000000000000000000000A4C59500B8D1AB00E7EFE300E9F0
      E50078A9600057953800E3ECDE00DEE9D8000000000098BD8700A8C79800D2E2
      C900000000000000000000000000000000000000000000000000D2E2C900AAC8
      9A009ABF8800E6EEE200DBE7D400E6EEE2005693370076A85D0000000000E6EE
      E200C0D7B500A3C493000000000000000000878790007A7A8400E6E6E7000000
      0000BEBEC300BABABF00B6B6BB00B2B2B80092929A007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A840085858E00000000000000
      0000F0B5B000F2BEBA0000000000000000000000000000000000F6D8D500EB9B
      9400F7DEDB0000000000000000000000000000000000F2BEB900F1B8B3000000
      0000000000000000000000000000F8E3E100EEA7A100F5D3D00000000000FAED
      EC00F5D2CF00F5D1CE00F5D3D000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1931E00BF8D0F00BF8D
      0F00BF8D0F00BF8D0F00C08D1000C38F1000FEFEFC00FEFEFC00C08E1000BF8D
      1000BF8D0F00BF8D0F00BF8D0F00BF8D0F00C1921C0000000000000000000000
      00000000000000000000000000000000000000000000C3D8B8009ABE88000000
      00007AA960005795380000000000B1CDA300A1C39000DFEADB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DFEADB009DC18C00B0CCA300000000005795380076A85D00000000009CC0
      8B00C0D7B500000000000000000000000000878790007A7A8400E2E2E4000000
      000000000000D2D2D5000000000000000000B7B7BC007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A840087879000000000000000
      0000F2C0BC00F3C5C10000000000000000000000000000000000F7DBD900EB9C
      9400F8E1DF0000000000000000000000000000000000F2C1BC00F1BCB7000000
      0000000000000000000000000000F9E6E400EDA8A200F4CCC80000000000F9E7
      E500F3C5C000F7DBD80000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CAA13900C28D0E00C28D
      1000C28D1000C28D1000C28D1000CEA43B00FEFEFC00FFFFFF00CEA43B00C38E
      1000C28D1000C28D1000C28E1000C28D0F00C89B300000000000000000000000
      0000000000000000000000000000000000000000000000000000C1D7B600BBD3
      AF007BAB64005A963C00C8DBBF00A1C391000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3C49200C6DABC005A963D007AAA6200C2D8B800BDD4
      B10000000000000000000000000000000000888890007A7A8400E7E7E900EAEA
      EC0081818A007A7A840086868F0000000000B7B7BC007A7A84007A7A84007A7A
      84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A84007A7A
      84007A7A84007A7A83007F7F88008787900096969E00CFCFD300000000000000
      0000F4CAC600F2BEB900FAECEA00F9E8E600F9E8E700F9E7E600F4CECA00EB9B
      9400F5D0CD00FAECEA00F9E8E600F9E9E800F8E0DE00F1B9B300F0B2AD00FAEB
      EA00F9E8E600F9E8E700F9E9E700F5D3D000ECA39C00ECA7A000F2C2BD00F3C3
      BF00F6D5D2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2CA9200C28C0800C590
      1000C4901000C4901000C5900F00DAB86700FEFEFC00FFFFFF00DAB86700C590
      0F00C4900F00C4901000C5901000C38C0900DCC07C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ADCA
      9E005A963C00569337008AB47400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008AB47400579538005C973E00AAC89A000000
      000000000000000000000000000000000000888890007A7A8400EBEBEC00CACA
      CE007A7A84007A7A84007A7A8400D8D8DB00C4C4C8007A7A84007A7A84007B7B
      84007F7F89008787900094949C00A1A1A700AAAAB000B4B4B900C1C1C600D1D1
      D400DDDDE000E6E6E80000000000000000000000000000000000000000000000
      0000F5CECB00EB9C9400ECA39C00ECA39C00ECA39C00ECA39C00ECA09900EA96
      8E00EC9F9800EDA49D00ECA39C00ECA39C00ECA29C00EA9C9500EA989000ECA3
      9C00ECA39C00ECA39C00ECA39C00ECA19A00EA989000EC968E00EC968E00F4CC
      C800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA9D2900C590
      0B00C6921000C6920F00C6920F00CEA43B00FFFFFF00FFFFFF00CEA43B00C793
      1000C6920F00C6921000C5900C00C7981E00F7F2E70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00006DA25200639C4700C5DABB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C7DBBD00639C4700699F4E00E7EFE3000000
      000000000000000000000000000000000000888891007A7A8400E7E7E800EBEB
      EC007F7F89007A7A840085858E000000000000000000D7D7DA00DFDFE100E7E7
      E900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F9E8E600ECA19A00EC968E00EC968E00EC968E00EC968E00EC968E00EC96
      8E00EC968E00EC968E00EC968E00EC968E00EC968E00EC968E00EC968E00EC96
      8E00EC968E00EC968E00EC968E00EC968E00EC968E00ECA09800F7D9D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1E8CF00C695
      1800C9930E00C9941100CA941100DAB86700FFFFFF00FFFFFF00E6CE9300CA94
      1100C9941100CA930F00C5910E00EDE1C0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000086868F007A7A8400E1E1E3000000
      0000E6E6E700CBCBCF00EBEBED00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F9E6E500F1B9B400F0B5B000F0B6B000F0B6B000F0B6B000F0B6
      B000F0B6B000F0B6B000F0B6B000F0B6B000F0B6B000F0B6B000F0B6B000F0B6
      B000F0B6B000F0B6B000F0B6B000F0B5B000F4CBC70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0E9
      D400D1AD4C00CB951000CC940F00CA961700E6D29C00ECDCB600CA981E00CC94
      1000CA940F00D1A94100F0E6CC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B5BA0097979E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ECE1BE00DABF7600D1A83E00CC9C2500CC9B2300D1A93D00D9BD
      6D00EBDEBB000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000078000000300000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FE0001FFF80007FFE0001FFFFFFFFF00
      FE0001FFF80007FFE0001FFF9FFFEF00FE0001FFF80007FFE0001FFF0FFFC300
      FE0001FFF80007FFE0001FC000000000FE0001FFF80007FFE0001FC000000000
      FE0001FFF80007FFE0001FC000000000FE0001FFF80007FFE0001FC000008000
      FE0001FFF80007FFE0001FC000008000FE0001FFF80007FFE0001FC000000100
      FE0001FFF80007FFE0001FCF1E788700FE0001FFF80007FFE0001FCF1E788F00
      FE0001FFF80007FFE0001FC000001F00FE0001FFF80007FFE0001FC000003F00
      FE0001FFF80007FFE0001FC000007F00FE0001FFF80007FFE0001FE00001FF00
      FE0001FFF80007FFE0001FFFFFFFFF00FFFFFFFF1FFFFE3FFFFFFFFFFFF1FF00
      FFFFFFFF1FFFFE3FE7FFFBFFFFC3FF00F3FFFF3F1FFFFE3FC3FFF0FFFF83FF00
      F1FFFE3F1FFFFE300000003FF803FF00F3FFFF3F000000300000003FE001FF00
      00000003000000300000003FC000FF000000000307FFFFF00000203FC000FF00
      F2ABD53F100000300000203F80007F004080042B000000300000007F80007F00
      008FC02310000033C79E21FF80007F00923FF1271B000033C79E23FF80007F00
      C0FFFC0F01000030000007FF80007F00E1FFFE1F000003F000000FFFC0007F00
      F1FFFE1F018FFFF000001FFFC000FF00FFFFFFFF11FFFFF800007FFFE001FF00
      FFFFFFFF3FFFFFFFFFFFFFFFF807FF00}
  end
  object LSheet: TcxStyleRepository
    Left = 689
    Top = 161
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 10930928
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16774644
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clYellow
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16511978
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14542570
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clTeal
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211272
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 524288
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4194368
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 7897176
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnShadow
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle71: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle72: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle73: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle74: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle75: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle76: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle77: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle78: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle79: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle80: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle81: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle82: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle83: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle84: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle85: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle86: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle87: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle88: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle89: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle90: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle91: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle92: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle93: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle94: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle95: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle96: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 4707838
    end
    object cxStyle97: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8454016
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle98: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle99: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle100: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle101: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle102: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle103: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle104: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle105: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle106: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle107: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle108: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle109: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8454016
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle110: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle111: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle112: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle113: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle114: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle115: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle116: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle117: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle118: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14211288
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle119: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle120: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle121: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle122: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle123: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle124: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle125: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle126: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle127: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle128: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle129: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14679999
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle130: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle131: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle132: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle133: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle134: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle135: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle136: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle137: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle138: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle139: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle140: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle141: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle142: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4227072
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle143: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle144: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14679999
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle145: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle146: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle147: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle148: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle149: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle150: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle151: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle152: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle153: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle154: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle155: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713983
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle156: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16772844
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle157: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle158: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16630203
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle159: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle160: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14932430
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle161: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16772844
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle162: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle163: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle164: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle165: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle166: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16630203
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle167: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle168: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle169: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle170: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle171: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle172: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle173: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle174: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8453888
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle175: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8453888
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle176: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12279296
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle177: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15066597
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle178: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle179: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle180: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clDefault
    end
    object cxStyle181: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle182: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle183: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle184: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle185: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle186: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle187: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle188: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle189: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle190: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle191: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle192: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle193: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle194: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle195: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle196: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle197: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12279296
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle198: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10944511
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle199: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15790320
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle200: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle201: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle202: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16766894
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle203: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14872561
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle204: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle205: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle206: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle207: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle208: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15451300
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle209: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle210: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12713860
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle211: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14932430
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object cxStyle212: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object cxStyle213: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clRed
    end
    object cxStyle214: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHotLight
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clHighlight
    end
    object cxStyle215: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle216: TcxStyle
      AssignedValues = [svColor]
      Color = 15263999
    end
    object DBCardStyle: TcxGridCardViewStyleSheet
      Styles.Background = cxStyle110
      Styles.Content = cxStyle113
      Styles.ContentEven = cxStyle114
      Styles.ContentOdd = cxStyle115
      Styles.Inactive = cxStyle116
      Styles.IncSearch = cxStyle117
      Styles.Selection = cxStyle119
      Styles.CaptionRow = cxStyle111
      Styles.CardBorder = cxStyle112
      Styles.RowCaption = cxStyle118
      BuiltIn = True
    end
    object DBBandedStyle: TcxGridBandedTableViewStyleSheet
      Styles.Background = cxStyle199
      Styles.Content = cxStyle99
      Styles.ContentEven = cxStyle160
      Styles.ContentOdd = cxStyle99
      Styles.FilterBox = cxStyle162
      Styles.Inactive = cxStyle167
      Styles.IncSearch = cxStyle168
      Styles.Selection = cxStyle171
      Styles.Footer = cxStyle163
      Styles.Group = cxStyle164
      Styles.GroupByBox = cxStyle165
      Styles.Header = cxStyle211
      Styles.Indicator = cxStyle169
      Styles.Preview = cxStyle170
      Styles.BandBackground = cxStyle157
      Styles.BandHeader = cxStyle211
      BuiltIn = True
    end
    object DBOtherStyle: TcxGridBandedTableViewStyleSheet
      Styles.Content = cxStyle178
      Styles.ContentEven = cxStyle179
      Styles.ContentOdd = cxStyle180
      Styles.Inactive = cxStyle174
      Styles.Selection = cxStyle175
      Styles.Header = cxStyle177
      Styles.Indicator = cxStyle173
      Styles.BandHeader = cxStyle176
      BuiltIn = True
    end
    object DBMonitorStyle: TcxGridBandedTableViewStyleSheet
      Caption = 'DBBandedStyle'
      Styles.Background = cxStyle195
      Styles.Content = cxStyle198
      Styles.ContentEven = cxStyle199
      Styles.ContentOdd = cxStyle200
      Styles.FilterBox = cxStyle201
      Styles.Inactive = cxStyle206
      Styles.IncSearch = cxStyle207
      Styles.Selection = cxStyle210
      Styles.Footer = cxStyle202
      Styles.Group = cxStyle203
      Styles.GroupByBox = cxStyle204
      Styles.Header = cxStyle205
      Styles.Indicator = cxStyle208
      Styles.Preview = cxStyle209
      Styles.BandBackground = cxStyle196
      Styles.BandHeader = cxStyle197
      BuiltIn = True
    end
    object GridTableViewStyle: TcxGridTableViewStyleSheet
      BuiltIn = True
    end
    object MyStyle: TcxGridTableViewStyleSheet
      Styles.Background = cxStyle100
      Styles.Content = cxStyle99
      Styles.ContentEven = cxStyle99
      Styles.ContentOdd = cxStyle99
      Styles.Inactive = cxStyle62
      Styles.Selection = cxStyle215
      Styles.Footer = cxStyle214
      Styles.GroupByBox = cxStyle189
      Styles.Header = cxStyle214
      BuiltIn = True
    end
    object MyStyleTree: TcxTreeListStyleSheet
      Styles.Background = cxStyle100
      Styles.Content = cxStyle99
      Styles.Inactive = cxStyle62
      Styles.Selection = cxStyle215
      Styles.BandBackground = cxStyle214
      Styles.BandContent = cxStyle99
      Styles.BandHeader = cxStyle212
      Styles.ColumnFooter = cxStyle212
      Styles.ColumnHeader = cxStyle214
      Styles.ContentEven = cxStyle99
      Styles.ContentOdd = cxStyle99
      Styles.Footer = cxStyle214
      BuiltIn = True
    end
  end
  object PopupMenuTreeScheduleTour: TPopupMenu
    Images = ImageListAction
    OnPopup = PopupMenuTreeScheduleTourPopup
    Left = 1035
    Top = 448
    object PopUpMenuItemAddTransfer: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1087#1077#1088#1077#1111#1079#1076
      ImageIndex = 2
    end
    object PopUpMenuItemAddHotel: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1075#1086#1090#1077#1083#1100
      ImageIndex = 1
    end
    object PopUpMenuItemAddExcursion: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1077#1082#1089#1082#1091#1088#1089#1110#1102
      ImageIndex = 0
    end
    object N1: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object PopUpMenuItemAddDetailDescription: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1086#1087#1080#1089' '#1085#1072' '#1088#1110#1074#1085#1110
      ImageIndex = 3
      OnClick = PopUpMenuItemAddDetailDescriptionClick
    end
    object PopUpMenuItemAddDetailDescriptionSub: TMenuItem
      Caption = #1044#1086#1076#1072#1090#1080' '#1086#1087#1080#1089' '#1085#1072' '#1087#1110#1076#1088#1110#1074#1085#1110
      ImageIndex = 3
      OnClick = PopUpMenuItemAddDetailDescriptionSubClick
    end
    object N2: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object PopUpMenuItemAddDetailMoveUp: TMenuItem
      Caption = #1055#1110#1076#1085#1103#1090#1080' '#1074' '#1074#1077#1088#1093
      ImageIndex = 5
      OnClick = PopUpMenuItemAddDetailMoveUpClick
    end
    object PopUpMenuItemAddDetailMoveDown: TMenuItem
      Caption = #1054#1087#1091#1089#1090#1080#1090#1080' '#1074' '#1085#1080#1079
      ImageIndex = 6
      OnClick = PopUpMenuItemAddDetailMoveDownClick
    end
    object N3: TMenuItem
      Caption = '-'
      Enabled = False
    end
    object N4: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      ImageIndex = 4
      OnClick = N4Click
    end
  end
  object IBTransaction2: TIBTransaction
    DefaultDatabase = IBDatabase1
    Left = 1355
    Top = 480
  end
  object TOUR_DESCRIPTIONS: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction2
    AfterInsert = TOUR_DESCRIPTIONSAfterInsert
    FieldDefs = <
      item
        Name = 'TOURDESCRIPTID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TOURTEMPLATEID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 300
      end>
    IndexDefs = <
      item
        Name = 'PK_TOUR_DESCRIPTIONS'
        Fields = 'TOURDESCRIPTID'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TOUR_DESCRIPTIONS_1'
        Fields = 'TOURTEMPLATEID'
      end>
    IndexFieldNames = 'TOURTEMPLATEID'
    MasterFields = 'TOURTEMPLATEID'
    MasterSource = DS_TOURTEMPLATES
    StoreDefs = True
    TableName = 'TOUR_DESCRIPTIONS'
    Left = 520
    Top = 288
    object TOUR_DESCRIPTIONSTOURDESCRIPTID: TIntegerField
      FieldName = 'TOURDESCRIPTID'
      Required = True
    end
    object TOUR_DESCRIPTIONSNAME: TIBStringField
      FieldName = 'NAME'
      Size = 300
    end
    object TOUR_DESCRIPTIONSTOURTEMPLATEID: TIntegerField
      FieldName = 'TOURTEMPLATEID'
    end
  end
  object DS_TOUR_DESCRIPTIONS: TDataSource
    DataSet = TOUR_DESCRIPTIONS
    Left = 392
    Top = 288
  end
  object ImageListErrors: TImageList
    Left = 944
    Top = 201
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DBDBDB0036363900D8D8D80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B6B5DF006563C7001C19B500130EBB00130EBB001C19B5006563C700B6B5
      DF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005D5D6600090997005959630000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F6FC004845
      B9000F0BD500130FF4001611FF001611FF001611FF001611FF00130FF4000F0B
      D5004845B900F7F6FC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B200070777001010FF0007077C00ADADAD00000000000000
      00000000000000000000000000000000000000000000F8F8FD00221FB9001512
      F2001816FE001615F4001614EF001514EF001514EF001614EF001615F4001816
      FE001512F200221FB900F8F8FD00000000001A1AFD007373FD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005555FD002727FD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000030304D000D0DEA000F0FFD000E0EED002C2C4C00000000000000
      000000000000000000000000000000000000000000004D49C8001719F2001A1D
      F900181BF000181BF100181BF100181BF100181BF100181BF100181BF100181B
      F0001A1DF9001719F2004D49C800000000000202FD006464FD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004141FD001111FD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C000909A3000F0FFF000E0EF3000F0FFF000A0AA700878787000000
      000000000000000000000000000000000000BAB8EB001417DF001C26FB001A22
      F0001B22F1001B22F1001B22F1001B22F1001B22F1001B22F1001B22F1001B22
      F1001A22F0001C26FB001417DF00BAB8EC000303FD005F5FFD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003B3BFD001212FD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B1B50000E0EF8000E0EF6000E0EF4000E0EF6000E0EFA00191951000000
      0000000000000000000000000000000000006865DD001E2AF5001827F5000512
      F0000412F0000412F0000412F0000412F0000412F0000412F0000412F0000412
      F0000512F0001827F5001E2AF5006B67DD001010FD000000FF000A0AFD000909
      FD000909FD000909FD000909FD000606FD000505FD000505FD000505FD000606
      FD000707FD000606FD000000FF001D1DFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007D7D
      7D000A0AB6000F0FFF000E0EF4000E0EF4000E0EF4000F0FFF000B0BBA007878
      7800000000000000000000000000000000003331DC001328FB002125D0007573
      D9007171DA006F6FDA006F6FDA006F6FDA006F6FDA006F6FDA006F6FDA007171
      DA007573D9002225D0001930FC002826D7000B0BFD002727FD007474FD007777
      FD007777FD007777FD007777FD007474FD007373FD007373FD007373FD007474
      FD007777FD007878FD007878FD008D8DFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C1C
      54000E0EFB000E0EF5000F0FFC000F0FFF000F0FFC000E0EF5000F0FFD001919
      5800000000000000000000000000000000005858E7001937F7003E3FE100F1F1
      F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1
      F600F1F1F6004848E1000F2FF900191AD9000202FD006666FD0000000000D3D3
      FD00CFCFFD00CFCFFD00D0D0FD00CECEFD00CCCCFD00CCCCFD00CCCCFD00CDCD
      FD00CECEFD00CECEFD00CDCDFD00D2D2FD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393000A0A
      A6000F0FFF000F0FFC000C0CCE000909A4000C0CCD000F0FFC000F0FFF000A0A
      AB008E8E8E000000000000000000000000005452EC005473F9005C5CEF00F1F1
      F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1F600F1F1
      F600F1F1F6004041EC00092AF8002021D6000202FD006F6FFD00CBCBFD000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF001717FD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414155000D0D
      E9000F0FFF00080891005E5E5F00ABABAB006161620008088D000F0FFF000E0E
      EC00404056000000000000000000000000005D58ED005A77F9006E71F700D8D6
      FD00D4D6FB00C4C3FB00B3B4FA00B3B5FB00B4B5FB00B4B5FB00B4B5FB00B6B7
      FB00BEBCFC004347F7004460F1005D58E0000202FD006565FD0000000000CBCB
      FD00BDBDFD00000000005E5EFD000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF001A1AFD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C57000F0F
      FF000D0DE300484857000000000000000000000000004C4C59000D0DE0000F0F
      FF001B1B5B000000000000000000000000008C84F3007084FA005B7DF700516E
      F600526EF600536EF6004E6AF5003E5CF4003756F4003755F4003757F4004160
      F400516CF7006283FC007287EC008A83EA000202FD006B6BFD00000000003131
      FD001717FD00C2C2FD008181FD000000FF000000FF000000FF000000FF000000
      FF000606FD000F0FFD001B1BFD007979FD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000222254000F0F
      FF000D0DDE00575761000000000000000000000000005C5C63000C0CDA000F0F
      FF0021215700000000000000000000000000C9C6F9005E5DF40080A1FA005D7B
      F7006480F7006682F7006682F7006985F7006B87F7006B87F7006B87F7006884
      F7005E7CF70081A2FF005456D500C9C6F9000202FD007272FD00B7B7FD000000
      FF000000FF006E6EFD00BEBEFD006060FD008282FD008F8FFD00A9A9FD00C6C6
      FD00DADAFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000595960000C0C
      D7000F0FFF000909700089898900D9D9D9008C8C8C000A0A6D000F0FFF000D0D
      DA0056565E00000000000000000000000000000000007169F3007D86F80087A6
      FA00617FF7006783F7006B85F7006A86F7006985F7006985F7006683F600617F
      F60089A7FF00707ADE006E66E900000000000202FD006666FD00000000006161
      FD004040FD00D5D5FD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBCBCB000D0D
      58000F0FFE000F0FFD000A0AAB00060677000A0AAA000F0FFC000F0FFF000B0B
      5A00C7C7C70000000000000000000000000000000000FAF9FF004F42F2008087
      F6009DBCFB007F9FFB006D8BF8006D89F8006D89F8006D8BFA00809FFC00A0BE
      FD007984E300473EDC00FAF9FF00000000003030FD009090FD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A7A7
      A7000C0C53000C0CD6000F0FFF001010FF000F0FFF000C0CD8000B0B5500A3A3
      A300000000000000000000000000000000000000000000000000F9F9FF006F67
      F5006160F10094A3F400A2B9F900A2BBFA00A2BCFA00A2B8F70092A2EF005C5B
      DF006C65EC00F9F9FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D3D3D300636368002424560015155F002424560061616600D1D1D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7C4FC008680F5005F5AEF005B58EC005A58EB005C57EB00857EF100C7C4
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FC7FF00FFFFF0000FC7FC003FFFF0000
      F83F80013FFC0000F83F80013FFC0000F01F00003FFC0000F01F000000000000
      E00F000000000000E00F000020000000C007000000000000C007000024000000
      C387000020000000C387000000070000C007800123FF0000C00780013FFF0000
      E00FC003FFFF0000F01FF00FFFFF000000000000000000000000000000000000
      000000000000}
  end
end
