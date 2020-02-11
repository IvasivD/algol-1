unit UnitHtlServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxPCdxBarPopupMenu, StdCtrls, cxPC, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, UnitIBQuery,UnitADOQuery,
  cxGridDBTableView, cxGrid, Buttons, ExtCtrls, core,UnitProc, IBQuery, AdoDB ;

type
   TElemServicesUpdate = record
     ElemHtlSrvLnk  :TDBShemaView;
     ElemBldSrvLnk  :TDBShemaView;
     ElemRoomSrvLnk :TDBShemaView;

     ElemSERVGROUP  :TDBShemaView;
     ElemService    :TDBShemaView;
     ElemCurrency   :TDBShemaView;

     Elem_BrHotelQry  :TDBShemaView;
     Elem_HtlBuildQry :TDBShemaView;
     Elem_HtlRoomQry  :TDBShemaView;
   end;

  TFrmHtlServ = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    GridBuildsDBTableView1: TcxGridDBTableView;
    GridBuildsLevel1: TcxGridLevel;
    GridBuilds: TcxGrid;
    GridApartments: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    PanelServiceLeft: TPanel;
    Panel2: TPanel;
    GridServGroup: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    HtlServEditBtn: TSpeedButton;
    ServCopyOneToAllBtn: TSpeedButton;
    ServCopyAllToAllBtn: TSpeedButton;
    GridHtlService: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    Panel8: TPanel;
    ServSelectBtn: TSpeedButton;
    ServUnselectBtn: TSpeedButton;
    Panel4: TPanel;
    PageControlPossibleServices: TcxPageControl;
    TabServInHotel: TcxTabSheet;
    TabServInBuild: TcxTabSheet;
    Panel12: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TabServInRoom: TcxTabSheet;
    Panel17: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel11: TPanel;
    Label4: TLabel;
    GridPossibleService: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridViewRepository: TcxGridViewRepository;
    ViewPossibleService: TcxGridDBTableView;
    PossibleServiceSrc: TDataSource;
    ViewPossibleServiceSERVICEID: TcxGridDBColumn;
    ViewPossibleServiceNAME: TcxGridDBColumn;
    ViewPossibleServiceHAVEVALUE: TcxGridDBColumn;
    ViewPossibleServiceMEASUREUNIT: TcxGridDBColumn;
    ViewPossibleServiceLARGEICON: TcxGridDBColumn;
    ViewPossibleServiceSMALLICON: TcxGridDBColumn;
    ViewPossibleServiceINHOTEL: TcxGridDBColumn;
    ViewPossibleServiceINBUILD: TcxGridDBColumn;
    ViewPossibleServiceINROOM: TcxGridDBColumn;
    ViewPossibleServiceSERVGROUPID: TcxGridDBColumn;
    ViewPossibleServiceINFO: TcxGridDBColumn;
    ViewPossibleServiceINAUTO: TcxGridDBColumn;
    ViewPossibleServiceINTRAIN: TcxGridDBColumn;
    ViewPossibleServiceINSHIP: TcxGridDBColumn;
    ViewPossibleServiceINPLANE: TcxGridDBColumn;
    ViewPossibleServiceMEMO: TcxGridDBColumn;
    ViewPossibleServiceHAVECOST: TcxGridDBColumn;
    ViewPossibleServiceINFOOD: TcxGridDBColumn;
    ViewPossibleServiceINRECRE: TcxGridDBColumn;
    ViewPossibleServiceINRESORT: TcxGridDBColumn;
    butRefresh: TSpeedButton;
    procedure PageControlPossibleServicesChange(Sender: TObject);
    procedure ServSelectBtnClick(Sender: TObject);
    procedure ServUnselectBtnClick(Sender: TObject);
    procedure HtlServEditBtnClick(Sender: TObject);
    procedure butRefreshClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
     FSaveHtlSerDblClick : TNotifyEvent;

     FElemHtlSrvLnk  :TDBShemaView;
     FElemBldSrvLnk  :TDBShemaView;
     FElemRoomSrvLnk :TDBShemaView;

     FElemSERVGROUP  :TDBShemaView;
     FElemService    :TDBShemaView;
     FElemCurrency   :TDBShemaView;
     FElemBrHotelQry :TDBShemaView;
     FElemHtlBuildQry :TDBShemaView;
     FElemHtlRoomQry  :TDBShemaView;

     //*******************
     FElem_HtlServListQry :TDBShemaView;
     FElem_BldServListQry :TDBShemaView;
     FElem_RoomServListQry:TDBShemaView;
     //*******************
     //function FCreateDB(Sql:string; DSMasterDetail:TDatasource; DBParam:TConnectDBParam;  Active:Boolean=True ):TDataset;
     function FMakeDBHtlServList( MainSql,HotelIdStr:String; DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;
     function FMakeDBRoomServList( MainSql,HotelRoomIdStr:String;DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;
     function FMakeDBBldServLis( MainSql,HotelBuildIdStr:String;DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;

     procedure ViewHtlSrvLnkListDblClick(Sender: TObject);

     procedure FAddServiceToHtlLnk;
     procedure FDelServiceFromHtlLnk;
    
     procedure FPrepare;
     procedure FPreparePageControlPossibleService( TabPageIndex:integer );
     procedure FSetPrepareGridViewFroPossibleServices;
     function  FCurrElemService:TDBShema;
     function  FCurrElemSrvLink:TDBShemaView;
  public
    { Public declarations }
    procedure RefreshControls;
    procedure InitElements;
    procedure CloseElements;
  end;

Procedure ExecuteHotelServiceMaster( ElemServicesUpdate:TElemServicesUpdate; TabPageIndex:Integer );

var
  FrmHtlServ: TFrmHtlServ;

implementation

{$R *.dfm}

Procedure ExecuteHotelServiceMaster( ElemServicesUpdate:TElemServicesUpdate; TabPageIndex:Integer );
begin
  try
    Application.CreateForm(TFrmHtlServ, FrmHtlServ);
    FrmHtlServ.FElemHtlSrvLnk  := ElemServicesUpdate.ElemHtlSrvLnk;
    FrmHtlServ.FElemBldSrvLnk  := ElemServicesUpdate.ElemBldSrvLnk;
    FrmHtlServ.FElemRoomSrvLnk := ElemServicesUpdate.ElemRoomSrvLnk;
    
    FrmHtlServ.FElemSERVGROUP  := ElemServicesUpdate.ElemSERVGROUP;
    FrmHtlServ.FElemService := ElemServicesUpdate.ElemService;
    FrmHtlServ.FElemCurrency:= ElemServicesUpdate.ElemCurrency;

    FrmHtlServ.FElemBrHotelQry  :=ElemServicesUpdate.Elem_BrHotelQry;
    FrmHtlServ.FElemHtlBuildQry :=ElemServicesUpdate.Elem_HtlBuildQry;
    FrmHtlServ.FElemHtlRoomQry  :=ElemServicesUpdate.Elem_HtlRoomQry;

    FrmHtlServ.FPrepare;
    FrmHtlServ.FPreparePageControlPossibleService( TabPageIndex );
    FrmHtlServ.ShowModal;
  finally
    FrmHtlServ.CloseElements;
    FrmHtlServ.free;
  end;
end;

procedure TFrmHtlServ.FPrepare;
begin
  InitElements;
  FSaveHtlSerDblClick:=GridHtlService.Levels[0].GridView.OnDblClick;
  GridHtlService.Levels[0].GridView := FCurrElemSrvLink.ViewList;
  GridHtlService.Levels[0].GridView.OnDblClick := ViewHtlSrvLnkListDblClick;


  FSetPrepareGridViewFroPossibleServices;
  RefreshControls;
end;

procedure TFrmHtlServ.FPreparePageControlPossibleService( TabPageIndex:integer );
begin
  PageControlPossibleServices.ActivePageIndex:=TabPageIndex;
end;

function TFrmHtlServ.FMakeDBHtlServList( MainSql, HotelIdStr:String; DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;
var Sql : string;
begin
  Sql := MainSql + ' and Services.InHotel = ''T'' '+
  ' and 1 > ( select count(*) from HtlServLnk L where L.HotelId = '+HotelIdStr+' and L.ServiceId =  Services.ServiceId ) ';

  result := DBCreate( Sql,DSMasterDetail, DBParam );
end;

function TFrmHtlServ.FMakeDBBldServLis( MainSql,HotelBuildIdStr:String; DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;
var Sql : string;
begin
  Sql := MainSql + ' and Services.InBuild = ''T'' '+
  ' and 1 > ( select count(*) from HBldServLnk L where L.HotelBuildId = '+HotelBuildIdStr+' and L.ServiceId =  Services.ServiceId ) ';

  result := DBCreate( Sql,DSMasterDetail, DBParam );
end;

function TFrmHtlServ.FMakeDBRoomServList( MainSql, HotelRoomIdStr:String; DSMasterDetail:TDatasource; DBParam:TConnectDBParam ):TDataset;
var Sql : string;
begin
  Sql := MainSql + ' and Services.InRoom =''T'' ' +
  ' and 1 > ( select count(*) from RoomServLnk L  where L.HotelRoomId = '+HotelRoomIdStr+' and L.ServiceId = Services.ServiceId ) ';

  result := DBCreate( Sql,DSMasterDetail, DBParam );
end;

procedure TFrmHtlServ.InitElements;
var HtlList:TDataset;
    BldList:TDataSet;
    RoomList:TDataSet;
begin
  HtlList := FMakeDBHtlServList( FElemService.MainSQL, FElemBrHotelQry.GetValueIdStr ,FElemSERVGROUP.DS, FElemService.DBGetParamConnect );
  BldList := FMakeDBBldServLis( FElemService.MainSQL,  FElemHtlBuildQry.GetValueIdStr,FElemSERVGROUP.DS, FElemService.DBGetParamConnect );
  RoomList:= FMakeDBRoomServList( FElemService.MainSQL,FElemHtlRoomQry.GetValueIdStr ,FElemSERVGROUP.DS, FElemService.DBGetParamConnect );

  FElem_HtlServListQry := TDBShemaView.Create( HtlList, nil, 'Services',  'ServiceId', '' );
  FElem_BldServListQry := TDBShemaView.Create( BldList, nil, 'Services', 'ServiceId', '' );
  FElem_RoomServListQry:= TDBShemaView.Create( RoomList, nil,'Services', 'ServiceId', '' );
end;

procedure TFrmHtlServ.CloseElements;
begin
  FElem_HtlServListQry.Close;
  FElem_BldServListQry.Close;
  FElem_RoomServListQry.Close;
end;

procedure TFrmHtlServ.FAddServiceToHtlLnk;
begin
  FCurrElemSrvLink.DB.Append;
  FCurrElemSrvLink.DB.FieldByName('SERVICEID').Value := FCurrElemService.GetValueId;
  FCurrElemSrvLink.DB.Post;

  FCurrElemService.Requery;
  FCurrElemSrvLink.Requery;
end;

procedure TFrmHtlServ.FDelServiceFromHtlLnk;
begin
  FCurrElemSrvLink.DBDelete(True);
  FCurrElemService.Requery;
end;

function TFrmHtlServ.FCurrElemService:TDBShema;
begin
  if PageControlPossibleServices.ActivePage =  TabServInHotel then result := FElem_HtlServListQry;
  if PageControlPossibleServices.ActivePage =  TabServInBuild then result := FElem_BldServListQry;
  if PageControlPossibleServices.ActivePage =  TabServInRoom  then result := FElem_RoomServListQry;
end;

function TFrmHtlServ.FCurrElemSrvLink:TDBShemaView;
begin
  if PageControlPossibleServices.ActivePage =  TabServInHotel then result := FElemHtlSrvLnk;
  if PageControlPossibleServices.ActivePage =  TabServInBuild then result := FElemBldSrvLnk;
  if PageControlPossibleServices.ActivePage =  TabServInRoom  then result := FElemRoomSrvLnk;
end;

procedure TFrmHtlServ.FSetPrepareGridViewFroPossibleServices;
begin
  PossibleServiceSrc.DataSet := FCurrElemService.DB;
end;

procedure TFrmHtlServ.FormDestroy(Sender: TObject);
begin
  GridHtlService.Levels[0].GridView.OnDblClick  := FSaveHtlSerDblClick;
end;


procedure TFrmHtlServ.PageControlPossibleServicesChange(Sender: TObject);
begin
  FSetPrepareGridViewFroPossibleServices;
  RefreshControls;
end;

procedure TFrmHtlServ.RefreshControls;
begin
  ServSelectBtn.Enabled := FElemService.DBRecordCount <> 0;
  ServUnselectBtn.Enabled := FCurrElemSrvLink.DBRecordCount <> 0;
  HtlServEditBtn.Enabled := FCurrElemSrvLink.DBRecordCount <> 0;
end;

procedure TFrmHtlServ.ServSelectBtnClick(Sender: TObject);
begin
  FAddServiceToHtlLnk;
  RefreshControls;
end;

procedure TFrmHtlServ.ServUnselectBtnClick(Sender: TObject);
begin
  FDelServiceFromHtlLnk;
  RefreshControls;
end;

procedure TFrmHtlServ.HtlServEditBtnClick(Sender: TObject);
begin
  FCurrElemSrvLink.ShowUpdateFormByViewList;
end;

procedure TFrmHtlServ.ViewHtlSrvLnkListDblClick(Sender: TObject);
begin
  HtlServEditBtn.Click;
end;

procedure TFrmHtlServ.butRefreshClick(Sender: TObject);
begin
  FCurrElemSrvLink.Requery;
end;


end.

Hotel
and 1 > (
  select count(*) from HtlServLnk L
  where L.HotelId = :HotelId and L.ServiceId = S.ServiceId)


build
  and 1 > (
    select count(*) from HBldServLnk L 
    where L.HotelBuildId = :HotelBuildId and L.ServiceId = S.ServiceId)

room
and 1 > (
    select count(*) from RoomServLnk L 
    where L.HotelRoomId = :HotelRoomId and L.ServiceId = S.ServiceId)


 {procedure TFrmHtlServ.FSetFilterGridPossibleServices;
var FilterFiled:string;
begin
  if PageControlPossibleServices.ActivePage =  TabServInHotel then FilterFiled :='InHotel';
  if PageControlPossibleServices.ActivePage =  TabServInBuild then FilterFiled :='InBuild';
  if PageControlPossibleServices.ActivePage =  TabServInRoom then FilterFiled  :='InRoom';

  FElemService.SetFilterOnViewList([FilterFiled],['T'],['=']);
end;}   
