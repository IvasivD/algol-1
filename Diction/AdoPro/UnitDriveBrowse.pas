unit UnitDriveBrowse;

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
  cxContainer, Grids, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, UnitFramePhotoList, ExtCtrls,
  Buttons, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, UnitDriveEditInfo,OptSet,
  TourConsts,  UnitFrameComRequisites,UnitComRequisites,
  UnitSelectVendor,UnitProc, UnitFrameDic, cxGridBandedTableView,UnitVehiclePlace,
  ImgList, UnitFrameUpdateImages,UnitProjectProc, Menus ;

type
  TFrmDriveBrowse = class(TForm)
    ModalPanel: TPanel;
    CancelBtn: TBitBtn;
    PanelLeft: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel8: TPanel;
    PanelCustomer: TPanel;
    FramePhotoList: TFramePhotoList;
    GridDriveNote: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    PanelDrive: TPanel;
    PanelShema: TPanel;
    Panel6: TPanel;
    GridShemaDrv: TcxGrid;
    GridShemaDrvDBTableView1: TcxGridDBTableView;
    GridShemaDrvLevel2: TcxGridLevel;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewVEHICLE: TcxGridBandedTableView;
    ViewVEHICLEColumn2: TcxGridBandedColumn;
    ViewVEHICLEColumn1: TcxGridBandedColumn;
    FrameDicDrivers: TFrameDic;
    FrameDicDrvService: TFrameDic;
    FrameDicDrvKind: TFrameDic;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FrameDicDriversbutEditClick(Sender: TObject);
  private
    { Private declarations }
    FPathToFotoNotFound:String;
    FCurrManager:Integer;
    FCurManagerName : Widestring;
    FVehicleShemaDrvPlaceView : TVehiclePlaceView ;
    procedure FRefreshControls;
    procedure ViewDrvVendorCellDblClick(
              Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);

    procedure FPrepareFrameDic;
    function  FGetParamImg:TViewFieldImgUpd;
    procedure FPrepare;
    procedure FPrepareVehicleShema;
    procedure FUpdateToolActions( Value: Integer );
  public
    { Public declarations }

    procedure RefreshControlsAction( Sender : TObject );
  published
    property CurManager : integer read FCurrManager write FCurrManager;
    property EnabledUpdate:Integer write FUpdateToolActions ;
  end;

procedure ShowDriveBrowse( Caption:WideString; aCurManager:Integer; aCurManagerName:Widestring );
function  GetDocStorePathDrivers: String;
procedure UpdateDrive( isNew:Boolean; CurManager:integer );

implementation

uses
  ServMod, ServModIB, ServModDic;

{$R *.dfm}

procedure ShowDriveBrowse( Caption:WideString; aCurManager:Integer; aCurManagerName:Widestring );
var FrmDriveBrowse: TForm;
begin
  ReplaseOn( Caption,'&','');
  FrmDriveBrowse := FindFormByCaptionAndRestoreOnTop( Caption );
  if FrmDriveBrowse <> nil then
    TFrmDriveBrowse(FrmDriveBrowse).CurManager := aCurManager
  else
  begin
    Application.CreateForm(TFrmDriveBrowse, FrmDriveBrowse );
    FrmDriveBrowse.Caption := Caption;
    TFrmDriveBrowse(FrmDriveBrowse).CurManager := aCurManager;
    TFrmDriveBrowse(FrmDriveBrowse).FCurManagerName := aCurManagerName;
    TFrmDriveBrowse(FrmDriveBrowse).FPrepare;
    FrmDriveBrowse.Show;
  end;

end;

procedure TFrmDriveBrowse.FPrepareFrameDic;
var ParamDicDrvKind: TParamFormDict;
    ParamDicDrivers: TParamFormDict;
    ParamDicDicDrvService: TParamFormDict;
begin
   PrepareDefaultParamDic(ParamDicDrvKind);
   ParamDicDrvKind.Func.LogProc := ShowLog;
   ParamDicDrvKind.Update.SearchPanel := False;
   ParamDicDrvKind.Func.RefreshFunction := RefreshControlsAction;
   FrameDicDrvKind.Init( Elem_BrDrvKindQry, Self.FCurrManager,ParamDicDrvKind );

   PrepareDefaultParamDic(ParamDicDrivers);
   ParamDicDrivers.Func.LogProc := ShowLog;
   ParamDicDrivers.Func.AddProcGridView := UpdateDrive;
   ParamDicDrivers.Func.RefreshFunction := RefreshControlsAction;
   ParamDicDrivers.Update.EditViewData := True;
   FrameDicDrivers.Init( Elem_BrDriveQry, Self.FCurrManager,ParamDicDrivers );

   PrepareDefaultParamDic(ParamDicDicDrvService);
   ParamDicDicDrvService.Update.VisiblePanelButton := False;
   FrameDicDrvService.Init( Elem_DrvSrvLnkQry, Self.FCurrManager, ParamDicDicDrvService );
end;

procedure TFrmDriveBrowse.FPrepareVehicleShema;
var VehicleDBDetail : TDBShemaVehicleDetail;
begin
{  VehicleDBDetail.Elem := Elem_SHEMA_VEHICLE_DETAIL;
  VehicleDBDetail.FiedlPlace :='PLACE';
  VehicleDBDetail.FiedlDirection :='DIRECTION';
  VehicleDBDetail.FiedlCol :='ACOL';
  VehicleDBDetail.FieldType :='ATYPE';
  VehicleDBDetail.FieldRow :='AROW';
  VehicleDBDetail.FieldALEVEL :='ALEVEL';
  VehicleDBDetail.FieldUsedColor :='';

  FVehicleShemaDrvPlaceView := TVehiclePlaceView.Create( ViewVEHICLE, VehicleDBDetail, 50, False);
  FVehicleShemaDrvPlaceView.SetHintParam( $00E8E8FF, clBlack );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( 0, $00E1FFFF, '', 'Місце', DMServ.ImageListDirectionVEHICLE,[0,1,2,3],[0,1,2,3] );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -1, -16777212, '','Вихід', DMServ.ImageListVEHICLE,[],[],2 );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -2, -16777212,'', 'Прохід', nil,[],[] );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -3, $00EEF3F9, '','Столик', DMServ.ImageListVEHICLE,[],[],1 );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -4, $00A8A8FF, '','Службове місце', DMServ.ImageListDirectionVEHICLE,[],[] );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -5, $00A8A8FF, ' ','Службове місце з виходом', DMServ.ImageListVEHICLE,[],[], 2 );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -6, $00A8A8FF, '', 'Водій', DMServ.ImageListVEHICLE,[],[], 3 );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -7, -16777212, 'WC', 'Туалет', nil,[],[] );
  FVehicleShemaDrvPlaceView.AddObjectPlaceColor( -8, -16777212, '', 'Сходи', DMServ.ImageListVEHICLE, [],[], 4 );}
end;

function TFrmDriveBrowse.FGetParamImg:TViewFieldImgUpd;
begin
  result.ElemImages := Elem_DRVIMGQry;
  result.FieldId := Elem_DRVIMGQry.FieldKod;
  result.FieldFileName := 'FILENAME';
  result.FieldWeb  := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';

  result.FieldObject :=  '';
  result.FieldObjValue := '';
end;

procedure TFrmDriveBrowse.FPrepare;
begin
  Elem_BrDrvKindQry.DBOpen;
  Elem_BrDriveQry.DBOpen;
  Elem_DRVIMGQry.DBOpen;
  Elem_BrCountryQry.DBOpen;
  Elem_DriveEuroClass.DBOpen;

  Elem_BrDrvMapQry.DBOpen;
  Elem_DriveNoteQry.DBOpen;
  Elem_SHEMA_VEHICLE_DETAIL.DBOpen;

  //FPrepareVehicleShema;
  FVehicleShemaDrvPlaceView := DMServIB.PrepareVehicleShema(Elem_SHEMA_VEHICLE_DETAIL,ViewVEHICLE);
  FPrepareFrameDic;

  FPathToFotoNotFound := OptionSet.WebPathToImage+'no-image.png';
  FramePhotoList.IntitListPhotoFrame( FGetParamImg, FPathToFotoNotFound, Elem_BrDriveQry.View.Styles ); //  OptionSet.WebPathToImage+'no-image.png'
  FramePhotoList.SetShowDateFoto( True, 'Дата фото.' );
  FramePhotoList.SetShowCanUpdateFoto( False );

  FUpdateToolActions( DMServ.CurManager );
  FRefreshControls;
end;

function GetDocStorePathDrivers: String;
begin
  Result := GetLocalFileName( IncludeTrailingPathDelimiter(
      GetDriveDocStoreFolder( Elem_BrDrvKindQry.DB.FieldByName('KIND_ENG').asString,
                              Elem_BrDriveQry.DB.FieldByName('DRIVEID').asString) ) );
end;

procedure UpdateDrive( isNew:Boolean; CurManager:Integer  );
var ElemParam : TParamDriveEditInfo;
begin
  ElemParam.ElemBrDrive := Elem_BrDriveQry;
  ElemParam.ElemBrDrvKind := Elem_BrDrvKindQry;
  ElemParam.ElemDrvImg := Elem_DRVIMGQry;
  ElemParam.ElemBrCountry := Elem_BrCountryQry;
  ElemParam.ElemEuroClass := Elem_DriveEuroClass;
  ElemParam.ElemDriveMap := Elem_BrDrvMapQry;
  ElemParam.ElemSERVGROUP := Elem_SERVGROUPQry;
  ElemParam.ElemDrvSrvLnk := Elem_DrvSrvLnkQry;
  ElemParam.ElemServices   := Elem_ServiceQry;
  ElemParam.ElemDrvVendorQry := Elem_DrvVendorQry;
  ElemParam.ElemSelectVendor:= Elem_SelectVendor;

  ElemParam.ElemShemaVehicleDetail := Elem_SHEMA_VEHICLE_DETAIL;

  ElemParam.ImgListIcon := DMServDic.ImageListVEHICLE;
  ElemParam.ImgListDirection := DMServDic.ImageListDirectionVEHICLE;

  ElemParam.PathToFotoNotFound := OptionSet.WebPathToImage+'no-image.png';//FPathToFotoNotFound;
  ElemParam.DocStorePath := GetDocStorePathDrivers;
  ShowDriveEditInfo( isNew, CurManager <> 0, ElemParam );
end;

procedure TFrmDriveBrowse.ViewDrvVendorCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin

end;

procedure TFrmDriveBrowse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmDriveBrowse.FRefreshControls;
var B:Boolean;
begin

  if FramePhotoList<> nil then
    FramePhotoList.Refresh( GetDocStorePathDrivers );
  B := Elem_BrDriveQry.DBRecordCount <>0 ;
  FVehicleShemaDrvPlaceView.SetLevelParam( Elem_BrDrvKindQry.DB.fieldByName('NAME_LEVEL').AsString );
  FVehicleShemaDrvPlaceView.ViewByGroupColumn;
end;

procedure TFrmDriveBrowse.RefreshControlsAction( Sender : TObject );
begin
  FRefreshControls;
end;

procedure TFrmDriveBrowse.FUpdateToolActions( Value: Integer );
begin
  self.FCurrManager := Value;
  
  FRefreshControls;
  FrameDicDrvKind.RefreshControls( self.FCurrManager );
  FrameDicDrivers.RefreshControls( self.FCurrManager );
  FrameDicDrvService.RefreshControls( self.FCurrManager );
end;

procedure TFrmDriveBrowse.FormDestroy(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.Destroy;

  FrameDicDrvKind.DestroyFrame;
  FrameDicDrivers.DestroyFrame;
  FrameDicDrvService.DestroyFrame;
end;


procedure TFrmDriveBrowse.FrameDicDriversbutEditClick(Sender: TObject);
begin
  FrameDicDrivers.butEditClick(Sender);

end;

end.


{procedure UpdateDrvVendorRequisites( isNew:Boolean; CurManager:Integer );
var CaptEdRequisites:String;
    ParamFrame:TParamComRequisitesFrame;
    OpenOne:Boolean;
    VendId: variant;
begin
  if isNew then
  begin
    VendId := Elem_DrvVendorQry.DB.FieldByName('CompanyId').Value;

    if SelectVendorClient( 'Постачальник транспортних засобів',DMServ.CurManager, Elem_DrvVendorQry.DBGetParamConnect, 'ASDRIVE',
                           Elem_DrvVendorQry.View.Styles.StyleSheet, VendId ) then
    //if ExecuteChooseClientDlg( Elem_DrvVendorQry, FrmDriveBrowse.ClientOrigin, False,  VendId ) then
    begin
      if not Elem_DrvVendorQry.DB.Locate('VENDORID',VendId,[]) then
      begin
        Elem_DrvVendorQry.DBInsert;
        Elem_DrvVendorQry.DB.FieldByName('VENDORID').Value := VendId;
        Elem_DrvVendorQry.DBPost;
        Elem_DrvVendorQry.Requery;
      end;
    end;
  end
  else
  begin
    ParamFrame.AdoConnection := DMServ.ADOConnection;
    ParamFrame.ElemCompanyQry := Elem_DrvVendorQry;
    ParamFrame.ElemCompanyDocsQry := Elem_CompanyDocsQry;
    ParamFrame.ElemCOMPCONTRACTSKINDQry := Elem_COMP_CONTRACTS_KINDQry;
    ParamFrame.ElemTypeNotesQry := Elem_TypeNotesQry;
    ParamFrame.ElemCompaniesParamName := Elem_COMPANIES_PARAM_NAME;
    ParamFrame.ElemOCCUPATIONS := Elem_OCCUPATIONS;
    ParamFrame.ElemComunicationType := Elem_Comunication_TypeQry;
    ParamFrame.ElemTypeDocumQry := Elem_TypeDocumQry;
    ParamFrame.ElemSelCompAction := Elem_SelCompAction;
    ParamFrame.ElemSelTaxSystemQry := Elem_SelTaxSystemQry;
    ParamFrame.ElemCompContractNumsQry := Elem_CompContractNumsQry;
    ParamFrame.ElemUsersQry := Elem_UsersQry;

    ParamFrame.ViewStyle := TcxGridTableViewStyleSheet( Elem_DrvVendorQry.View.Styles.StyleSheet );
    CaptEdRequisites := Elem_DrvVendorQry.DB.FieldByName('NAME').AsString +' / '+' - Реквізити';

    ShowUpdateRequisites( CaptEdRequisites, ParamFrame, CurManager <> 0 ,
                          CurManager, DMServ.CurManagerName );
  end; 
end; }
