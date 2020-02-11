unit UnitDriveServiceMaster;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxContainer, cxTextEdit, cxMemo, cxDBEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,  core,
  cxGridDBTableView, cxGrid,UnitProc, Grids, DBGrids;

type
  TparamDriveService = record
    ElemBrDrive:TDBShemaView;
    ElemSERVGROUP :TDBShemaView;
    ElemSERVice :TDBShemaView;
    ElemDrvSrvLnk:TDBShemaView;
  end;

  TDriveServiceMasterForm = class(TForm)
    ModalPanel: TPanel;
    CancelBtn: TBitBtn;
    PanelServiceLeft: TPanel;
    Panel2: TPanel;
    GridServGroup: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel8: TPanel;
    ServSelectBtn: TSpeedButton;
    ServUnselectBtn: TSpeedButton;
    Panel4: TPanel;
    Panel11: TPanel;
    Label4: TLabel;
    GridPossibleService: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    Panel1: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    GridObjService: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DBMemo: TcxDBMemo;
    Panel6: TPanel;
    Label3: TLabel;
    Splitter1: TSplitter;
    cxGridViewRepository: TcxGridViewRepository;
    ViewDrvPossibleService: TcxGridDBTableView;
    PossibleServiceSrc: TDataSource;
    ViewDrvPossibleServiceSERVICEID: TcxGridDBColumn;
    ViewDrvPossibleServiceNAME: TcxGridDBColumn;
    ViewDrvPossibleServiceHAVEVALUE: TcxGridDBColumn;
    ViewDrvPossibleServiceMEASUREUNIT: TcxGridDBColumn;
    ViewDrvPossibleServiceLARGEICON: TcxGridDBColumn;
    ViewDrvPossibleServiceSMALLICON: TcxGridDBColumn;
    ViewDrvPossibleServiceINHOTEL: TcxGridDBColumn;
    ViewDrvPossibleServiceINBUILD: TcxGridDBColumn;
    ViewDrvPossibleServiceINROOM: TcxGridDBColumn;
    ViewDrvPossibleServiceSERVGROUPID: TcxGridDBColumn;
    ViewDrvPossibleServiceINFO: TcxGridDBColumn;
    ViewDrvPossibleServiceINAUTO: TcxGridDBColumn;
    ViewDrvPossibleServiceINTRAIN: TcxGridDBColumn;
    ViewDrvPossibleServiceINSHIP: TcxGridDBColumn;
    ViewDrvPossibleServiceINPLANE: TcxGridDBColumn;
    ViewDrvPossibleServiceMEMO: TcxGridDBColumn;
    ViewDrvPossibleServiceHAVECOST: TcxGridDBColumn;
    ViewDrvPossibleServiceINFOOD: TcxGridDBColumn;
    ViewDrvPossibleServiceINRECRE: TcxGridDBColumn;
    ViewDrvPossibleServiceINRESORT: TcxGridDBColumn;
    butRefresh: TSpeedButton;
    HtlServEditBtn: TSpeedButton;
    ServCopyOneToAllBtn: TSpeedButton;
    ServCopyAllToAllBtn: TSpeedButton;
    procedure ServSelectBtnClick(Sender: TObject);
    procedure ServUnselectBtnClick(Sender: TObject);
    procedure HtlServEditBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FDriveKind:Integer;
    FElemBrDrive: TDBShemaView;
    FElemSERVGROUP : TDBShemaView;
    FElemService : TDBShemaView;
    FElemDrvSrvLnk:TDBShemaView;

    procedure ViewDrvSrvLnkListDblClick(Sender: TObject);
    function  FMakeDBDrvServList( MainSql, DriveIdStr:String; DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;
    procedure FPrepare;
    procedure CloseElements;
    procedure FAddServiceToDrvLnk;
    procedure FDelServiceFromDrvLnk;

    procedure ViewServiceFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);

  public
    { Public declarations }
    Elem_DrvServListQry : TDBShemaView;
    procedure InitElements;
    procedure RefreshControls;
  end;

procedure ExecuteDriveServiceMaster( ParamDrive:TparamDriveService; Kind: Integer; var Key: Integer);

var
  DriveServiceMasterForm: TDriveServiceMasterForm;

implementation

{$R *.dfm}
procedure ExecuteDriveServiceMaster( ParamDrive:TparamDriveService; Kind: Integer; var Key: Integer);
begin
  try
    Application.CreateForm(TDriveServiceMasterForm, DriveServiceMasterForm);
    DriveServiceMasterForm.FDriveKind := Kind;
    DriveServiceMasterForm.FElemBrDrive := ParamDrive.ElemBrDrive;
    DriveServiceMasterForm.FElemSERVGROUP:= ParamDrive.ElemSERVGROUP;
    DriveServiceMasterForm.FElemService := ParamDrive.ElemService;
    DriveServiceMasterForm.FElemDrvSrvLnk:= ParamDrive.ElemDrvSrvLnk;

    DriveServiceMasterForm.FPrepare;
    DriveServiceMasterForm.ShowModal;

  finally
    DriveServiceMasterForm.CloseElements;
    DriveServiceMasterForm.Free;
  end;
end;

procedure TDriveServiceMasterForm.FPrepare;
begin
  GridServGroup.Levels[0].GridView := FElemSERVGROUP.ViewList;
  GridPossibleService.Levels[0].GridView := ViewDrvPossibleService;
  GridObjService.Levels[0].GridView := FElemDrvSrvLnk.ViewList;
  GridObjService.Levels[0].GridView.OnDblClick := ViewDrvSrvLnkListDblClick;

  ViewDrvPossibleService.Styles := FElemSERVGROUP.View.Styles;
  DBMemo.DataBinding.DataSource := FElemDrvSrvLnk.DS;
  DBMemo.DataBinding.DataField  := 'CalcMemo';


  TcxGridDBtableView(GridServGroup.Levels[0].GridView).OnFocusedRecordChanged:= ViewServiceFocusedRecordChanged;

  FElemBrDrive.DBOpen;
  FElemSERVGROUP.DBOpen;
  FElemService.DBOpen;
  FElemDrvSrvLnk.DBOpen;

  InitElements;
  RefreshControls;
end;

procedure TDriveServiceMasterForm.CloseElements;
begin
  GridObjService.Levels[0].GridView.OnDblClick := nil;
   TcxGridDBtableView(GridServGroup.Levels[0].GridView).OnFocusedRecordChanged := nil;
  Elem_DrvServListQry.Close;
end;

function TDriveServiceMasterForm.FMakeDBDrvServList( MainSql, DriveIdStr:String; DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;
var Sql : string;
begin
  Sql := MainSql + ' and Services.InAuto = ''T'' '+
  ' and 1 > ( select count(*) from DRVSERVLINKS L where L.DRIVEID = '+DriveIdStr+' and L.ServiceId =  Services.ServiceId ) ';

  result := DBCreate( Sql,DSMasterDetail, DBParam );
end;

procedure TDriveServiceMasterForm.InitElements;
var DrvServList:TDataset;
begin
  DrvServList := FMakeDBDrvServList( FElemService.MainSQL, FElemBrDrive.GetValueIdStr ,FElemSERVGROUP.DS, FElemService.DBGetParamConnect );
  Elem_DrvServListQry := TDBShemaView.Create( DrvServList, ViewDrvPossibleService, 'Services',  'ServiceId', '' );
  PossibleServiceSrc.Dataset := Elem_DrvServListQry.DB;
end;

procedure TDriveServiceMasterForm.FAddServiceToDrvLnk;
begin
  FElemDrvSrvLnk.DB.Append;
  FElemDrvSrvLnk.DB.FieldByName('SERVICEID').Value := Elem_DrvServListQry.GetValueId;
  FElemDrvSrvLnk.DB.Post;

  Elem_DrvServListQry.Requery;
  FElemDrvSrvLnk.Requery;
end;

procedure TDriveServiceMasterForm.FDelServiceFromDrvLnk;
begin
  FElemDrvSrvLnk.DBDelete(True);
  Elem_DrvServListQry.Requery;
end;

procedure TDriveServiceMasterForm.ServSelectBtnClick(Sender: TObject);
begin
  FAddServiceToDrvLnk;
  RefreshControls;
end;

procedure TDriveServiceMasterForm.ServUnselectBtnClick(Sender: TObject);
begin
  FDelServiceFromDrvLnk;
  RefreshControls;
end;

procedure TDriveServiceMasterForm.RefreshControls;
begin
  if Elem_DrvServListQry = nil then exit;
  
  ServSelectBtn.Enabled := (Elem_DrvServListQry.DBRecordCount <> 0) and (FElemDrvSrvLnk.CheckRoleInsert);
  ServUnselectBtn.Enabled := (FElemDrvSrvLnk.DBRecordCount <> 0)and (FElemDrvSrvLnk.CheckRoleDelete);
  HtlServEditBtn.Enabled := ( TcxGridDBTableView(GridObjService.Levels[0].GridView).ViewData.RowCount <> 0 ) and (FElemDrvSrvLnk.CheckRoleUpdate);;
end;

procedure TDriveServiceMasterForm.HtlServEditBtnClick(Sender: TObject);
begin
  FElemDrvSrvLnk.ShowUpdateFormByViewList;
  RefreshControls;
end;

procedure TDriveServiceMasterForm.ViewDrvSrvLnkListDblClick(Sender: TObject);
begin
  HtlServEditBtn.Click;
end;

procedure TDriveServiceMasterForm.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TDriveServiceMasterForm.ViewServiceFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshControls;
end;

end.
