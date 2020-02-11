unit UnitDriveEditInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  ComCtrls, cxSpinEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit, Buttons, StdCtrls,
  cxGridDBTableView, TourConsts,
  UnitFramePhotoList, cxCheckBox, ExtCtrls,core,UnitProc,OptSet, UnitDriveServiceMaster,
  UnitListViewDataIcons, UnitHookControlChangeValue,UnitDrvShemaDisigner,UnitFrameComRequisites,
  UnitSelectVendor,cxGridTableView,UnitComRequisites,UnitFrameUpdateImages ;

const
  sDrives = 'Drives';

type

  TParamDriveEditInfo = record
    ElemBrDrive:TDBShemaView;
    ElemBrDrvKind:TDBShema;
    ElemDriveMap:TDBShema;
    ElemDrvImg:TDBShemaView;
    ElemBrCountry:TDBShemaView;
    ElemEuroClass:TDBShemaView;
    ElemSERVGROUP:TDBShemaView;
    ElemServices:TDBShemaView;
    ElemDrvSrvLnk:TDBShemaView;
    ElemDrvVendorQry:TDBShemaView;
    ElemSelectVendor:TDBShemaView;
    ElemShemaVehicleDetail : TDBShema;

    ImgListIcon :TImageList;
    ImgListDirection :TImageList;
    PathToFotoNotFound:string;
    DocStorePath:string;
  end;

  TFrmDriveEditInfo = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    ChNotUse: TcxCheckBox;
    Panel1: TPanel;
    PanelImageList: TPanel;
    Panel3: TPanel;
    Panel10: TPanel;
    Label1: TLabel;
    ListViewLargeBtn: TSpeedButton;
    ListViewListBtn: TSpeedButton;
    ListViewDetailBtn: TSpeedButton;
    butEditDrvKind: TSpeedButton;
    EdNameHotel: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdYearBus: TcxTextEdit;
    CmbxEuroClass: TcxExtLookupComboBox;
    Label4: TLabel;
    PlaceMapBtn: TSpeedButton;
    PlaceCountDBEdit: TcxSpinEdit;
    PlaceLabel: TLabel;
    CmbxSearchCountry: TcxExtLookupComboBox;
    Label5: TLabel;
    DriveNoLabel: TLabel;
    EdDriveNoDB: TcxTextEdit;
    Panel2: TPanel;
    ServiceListView: TListView;
    BtnSaveData: TBitBtn;
    Label6: TLabel;
    CmbxSearchDrvVendor: TcxExtLookupComboBox;
    butAddVendor: TSpeedButton;
    butEditVendor: TSpeedButton;
    butDelVendor: TSpeedButton;
    Bevel1: TBevel;
    FramePhotoList: TFramePhotoList;
    procedure PlaceMapBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure butEditDrvKindClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListViewLargeBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure butAddVendorClick(Sender: TObject);
    procedure butEditVendorClick(Sender: TObject);
    procedure butDelVendorClick(Sender: TObject);
  private
    { Private declarations }
    FisNew:Boolean;
    FDrvServ : TListViewDataIcons;
    FElemBrDrive:TDBShemaView;
    FElemBrDrvKind:TDBShema;
    FElemDrvImg:TDBShemaView;
    FElemBrCountry:TDBShemaView;
    FElemEuroClass:TDBShemaView;
    FElemSERVGROUP:TDBShemaView;
    FElemServices:TDBShemaView;
    FElemDrvSrvLnk:TDBShemaView;
    FElemDrvVendorQry:TDBShemaView;
    FElemSelectVendor:TDBShemaView;

    FElemDriveMap:TDBShema;
    FElemShemaVehicleDetail:TDBShema;

    FImgListIcon :TImageList;
    FImgListDirection :TImageList;

    FPathToFotoNotFound:string;
    FDocStorePath: String;
    FCanUpdate : Boolean;

    FHookControlChangeValue : THookControlChangeValue;
    procedure FActRefreshControls(Sender : TObject);
    function  FGetParamImg:TViewFieldImgUpd;
    procedure FPrepare( isNew:Boolean );
    procedure FShowData;
    Function  FCheckError:Boolean;
    function  FSaveData:Boolean;
    procedure FRefreshControls;
    procedure FPrepareShowVendor( VendorId:Variant );
    procedure FRefreshDrvSrv;
    function FCheckUsedDrive( ConDBParam:TConnectDBParam; ShowError: Boolean = False ): Boolean;
    procedure UpdateDrvVendorRequisites( isNew:Boolean; CurManager:Integer );
  public
    { Public declarations }

  end;

  function GetDriveDocStoreFolder(const Kind, Drive: String): String;
  procedure ShowDriveEditInfo( isNew, CanUpdate:Boolean; ElemParam:TParamDriveEditInfo );

var
  FrmDriveEditInfo: TFrmDriveEditInfo;

implementation

uses ServMod, ServModDic;

{$R *.dfm}

function GetDriveDocStoreFolder(const Kind, Drive: String): String;
begin
  Result := IncludeTrailingPathDelimiter( OptionSet.StoreFolder ) +
            sDrives + PathDelim + Kind + PathDelim + Drive;
end;

procedure ShowDriveEditInfo( isNew, CanUpdate:Boolean; ElemParam:TParamDriveEditInfo  );
begin
  try
    Application.CreateForm(TFrmDriveEditInfo, FrmDriveEditInfo);

    FrmDriveEditInfo.FElemBrDrive := ElemParam.ElemBrDrive ;
    FrmDriveEditInfo.FElemBrDrvKind := ElemParam.ElemBrDrvKind;
    FrmDriveEditInfo.FElemDrvImg  := ElemParam.ElemDrvImg;

    FrmDriveEditInfo.FElemBrCountry := ElemParam.ElemBrCountry;
    FrmDriveEditInfo.FElemEuroClass := ElemParam.ElemEuroClass;
    FrmDriveEditInfo.FElemDriveMap  := ElemParam.ElemDriveMap;
    FrmDriveEditInfo.FElemSERVGROUP := ElemParam.ElemSERVGROUP;
    FrmDriveEditInfo.FElemServices  := ElemParam.ElemServices;
    FrmDriveEditInfo.FElemDrvSrvLnk := ElemParam.ElemDrvSrvLnk;
    FrmDriveEditInfo.FElemDrvVendorQry :=ElemParam.ElemDrvVendorQry;
    FrmDriveEditInfo.FElemSelectVendor:=ElemParam.ElemSelectVendor;

    FrmDriveEditInfo.FElemShemaVehicleDetail :=ElemParam.ElemShemaVehicleDetail;

    FrmDriveEditInfo.FImgListIcon   :=ElemParam.ImgListIcon;
    FrmDriveEditInfo.FImgListDirection :=ElemParam.ImgListDirection ;

    FrmDriveEditInfo.FPathToFotoNotFound := ElemParam.PathToFotoNotFound;
    FrmDriveEditInfo.FDocStorePath := ElemParam.DocStorePath;
    FrmDriveEditInfo.FCanUpdate  := CanUpdate;

    FrmDriveEditInfo.FPrepare( isNew );
    FrmDriveEditInfo.ShowModal;
  finally
    FrmDriveEditInfo.Free;
  end;
end;

function GetParamService:TParamListShowDataIcon;
begin
  result.FieldName    :='Name';
  result.FieldCommnets:='COMMENTS';
  result.FieldLargeIcon :='LARGEICON';
  result.FieldSmallIcon :='SMALLICON';
  result.FieldCurrencyShort :='CURRENCYSHORT';
  result.FieldCost    := 'COST';
  result.FieldHaveCost:='HAVECOST';
  result.FieldLinkId  :='LINKID';
end;

procedure TFrmDriveEditInfo.UpdateDrvVendorRequisites( isNew:Boolean; CurManager:Integer );
var CaptEdRequisites:String;
    ParamFrame:TParamComRequisitesFrame;
    OpenOne:Boolean;
    VendId: variant;
begin
  if isNew then
  begin
    VendId := CmbxSearchDrvVendor.EditValue;

    if SelectVendorClient( 'Постачальник транспортних засобів',DMServ.CurManager, FElemDrvVendorQry.DBGetParamConnect, 'ASDRIVE',
                           FElemDrvVendorQry.View.Styles.StyleSheet, VendId ) then
    begin
      FPrepareShowVendor( VendId );
      CmbxSearchDrvVendor.EditValue := VendId;
    end;
  end
  else
  begin
    ParamFrame.AdoConnection := DMServDic.ADOConnection;
    ParamFrame.ElemCompanyQry := FElemSelectVendor;
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
    //ElemCompanyParam.ElemCompTaxSystemLogQry := FElem_CompTaxSystemLogQry;

    ParamFrame.ViewStyle := TcxGridTableViewStyleSheet( FElemSelectVendor.View.Styles.StyleSheet );
    CaptEdRequisites := FElemSelectVendor.DB.FieldByName('NAME').AsString +' / '+' - Реквізити';

    ShowUpdateRequisites( CaptEdRequisites, ParamFrame, CurManager <> 0 , CurManager, DMServ.CurManagerName );
  end;
end;

function TFrmDriveEditInfo.FGetParamImg:TViewFieldImgUpd;
begin
  result.ElemImages := FElemDrvImg;
  result.FieldId := FElemDrvImg.FieldKod;
  result.FieldFileName := 'FILENAME';
  result.FieldWeb  := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';

  result.FieldObject :=  '';
  result.FieldObjValue := '';
end;


procedure TFrmDriveEditInfo.FPrepare( isNew:Boolean );
begin
  FisNew := isNew;
  FElemBrDrive.DBOpen;
  FElemDrvImg.DBOpen;
  FElemBrCountry.DBOpen;
  FElemEuroClass.DBOpen;
  FElemDriveMap.DBOpen;
  FElemDrvSrvLnk.DBOpen;
  FElemDrvVendorQry.DBOpen;
  FPrepareShowVendor( FElemBrDrive.DB.fieldByName('VENDORID').value );

  SetPropInCxExtLookupComboBox( CmbxEuroClass, TcxGridDBTableView( FElemEuroClass.ViewList ),'NAME', FElemEuroClass.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( CmbxSearchCountry, TcxGridDBTableView( FElemBrCountry.ViewList ),'NAME', FElemBrCountry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( CmbxSearchDrvVendor,TcxGridDBTableView( FElemSelectVendor.ViewList ),'NAME', FElemSelectVendor.FieldKod,True,false );

  FramePhotoList.IntitListPhotoFrame( FGetParamImg, FPathToFotoNotFound, FElemBrCountry.View.Styles ); //  OptionSet.WebPathToImage+'no-image.png'
  FramePhotoList.SetShowDateFoto( True, 'Дата фото.' );
  FramePhotoList.SetShowCanUpdateFoto( True );

  FDrvServ := TListViewDataIcons.Create( GetParamService, ServiceListView );
  FRefreshDrvSrv;

  FShowData;
  FRefreshControls;
  FHookControlChangeValue := THookControlChangeValue.Create(self, FActRefreshControls );
end;

procedure TFrmDriveEditInfo.FPrepareShowVendor( VendorId:Variant );
begin
  FElemSelectVendor.DBClose;
  FElemSelectVendor.DBQuerySetParamValue('VENDORID',VendorId);  //FElemBrDrive.DB.fieldByName('VENDORID').value
  FElemSelectVendor.DBOpen;
end;

procedure TFrmDriveEditInfo.FRefreshDrvSrv;
begin
  if (self.FDrvServ <> nil)and(not FisNew) then
    self.FDrvServ.DrawServiceListBySet( FElemDrvSrvLnk, DMServ.ItsLocalLang )
  else ServiceListView.Clear;
end;

procedure TFrmDriveEditInfo.FShowData;
begin
  if not FisNew then
  begin
    EdNameHotel.EditValue := FElemBrDrive.DB.fieldByName('MODEL').value;
    EdYearBus.EditValue :=  FElemBrDrive.DB.fieldByName('YEARBUS').value;
    CmbxEuroClass.EditValue := FElemBrDrive.DB.fieldByName('EUROCLASS').value;
    PlaceCountDBEdit.EditValue := FElemBrDrive.DB.fieldByName('PlaceCount').asInteger;
    CmbxSearchCountry.EditValue := FElemBrDrive.DB.fieldByName('REGCOUNTRY').value;
    EdDriveNoDB.EditValue := FElemBrDrive.DB.fieldByName('DRIVENO').value;
    ChNotUse.Checked := FElemBrDrive.DB.fieldByName('DISABLED').AsBoolean;
    CmbxSearchDrvVendor.EditValue := FElemBrDrive.DB.fieldByName('VENDORID').value;
  end
   else
   begin
     EdNameHotel.EditValue := null;
     EdYearBus.EditValue := null;
     CmbxEuroClass.EditValue := null;
     PlaceCountDBEdit.EditValue := null;
     CmbxSearchCountry.EditValue:= null;
     EdDriveNoDB.EditValue := null;
     ChNotUse.Checked := false;
     FramePhotoList.ClearImage;
   end;
end;

Function TFrmDriveEditInfo.FCheckError:Boolean;
begin
  Result := False;

  if ValidateValueControl( CmbxSearchDrvVendor, 'Виберіть постачальника'  ) then
    Result := True;
end;

function TFrmDriveEditInfo.FSaveData: Boolean;
begin
  if not FCheckError then Exit;

  if self.FisNew then FElemBrDrive.DB.Insert
  else FElemBrDrive.DB.Edit;
  
  FElemBrDrive.DB.fieldByName('MODEL').value := EdNameHotel.EditValue;
  FElemBrDrive.DB.fieldByName('YEARBUS').value := EdYearBus.EditValue;
  FElemBrDrive.DB.fieldByName('EUROCLASS').value := CmbxEuroClass.EditValue;
  FElemBrDrive.DB.fieldByName('PlaceCount').asInteger := PlaceCountDBEdit.EditValue;
  FElemBrDrive.DB.fieldByName('REGCOUNTRY').value := CmbxSearchCountry.EditValue;
  FElemBrDrive.DB.fieldByName('DRIVENO').value := EdDriveNoDB.EditValue;
  FElemBrDrive.DB.fieldByName('DISABLED').AsBoolean :=  ChNotUse.Enabled;
  FElemBrDrive.DB.Post;
  FElemBrDrive.RequeryCurrentRecord;
  // Add Vendor************

  if FElemDrvVendorQry.DB.IsEmpty then
    FElemDrvVendorQry.DBInsert
  else FElemDrvVendorQry.DBEdit;

  FElemDrvVendorQry.DB.FieldByName('VENDORID').Value := CmbxSearchDrvVendor.EditValue;
  FElemDrvVendorQry.DBPost;
  FElemDrvVendorQry.Requery;

  self.FisNew := False;
  FHookControlChangeValue.IsChange := False;
  FRefreshControls;
end;


procedure TFrmDriveEditInfo.FActRefreshControls(Sender : TObject);
begin
  FRefreshControls;
end;

procedure TFrmDriveEditInfo.FRefreshControls;
begin
  if not Self.FisNew then
    FramePhotoList.Refresh( FDocStorePath );

  SetEnabledChildControls( Self, FCanUpdate, [ CancelBtn ], [ Tpanel ] );
  butEditDrvKind.Enabled := ( FCanUpdate ) and ( not self.FisNew ) and ( FElemBrDrive.CheckRoleUpdate );
  PlaceMapBtn.Enabled := FCanUpdate;

  if Self.FHookControlChangeValue <> nil then
    BtnSaveData.Enabled := ( Self.FHookControlChangeValue.IsChange )// and ( ( ( FElemBrDrive.CheckRoleUpdate ) and (not self.FisNew) ) or ( ( FElemBrDrive.CheckRoleInsert ) and ( self.FisNew ) ) )
  else BtnSaveData.Enabled := False;

  CmbxSearchDrvVendor.Enabled := False;

  butEditVendor.Enabled := CmbxSearchDrvVendor.EditValue <> null;
  butDelVendor.Enabled := CmbxSearchDrvVendor.EditValue <> null;
end;

function TFrmDriveEditInfo.FCheckUsedDrive( ConDBParam:TConnectDBParam; ShowError: Boolean = False ): Boolean;
var Sql :string;
begin
   Sql := 'select Count(*) aCount from Leavings where DriveId = '+FElemBrDrive.GetValueIdStr;
   result:= DBGetValue(ConDBParam,  Sql, 'aCount' ) > 0;
   if Result and ShowError then MyShowMessageDlg('Не можна редагувати схему транспортного засобу, що використовується!', mtError, but_OK );
end;

procedure TFrmDriveEditInfo.PlaceMapBtnClick(Sender: TObject);
var PlcCount: Integer;
begin
  if PlaceCountDBEdit.Value<>null then
    PlcCount := PlaceCountDBEdit.Value
  else PlcCount := 0;

  ShowDrvShemaDisigner( FElemBrDrive, FElemBrDrvKind, FElemDriveMap, FElemShemaVehicleDetail, PlcCount );
end;

procedure TFrmDriveEditInfo.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmDriveEditInfo.butEditDrvKindClick(Sender: TObject);
var Serv: Integer;
    ParamDrive:TparamDriveService;
begin
  ParamDrive.ElemBrDrive := FElemBrDrive;
  ParamDrive.ElemSERVGROUP := FElemSERVGROUP;
  ParamDrive.ElemService := FElemServices;
  ParamDrive.ElemDrvSrvLnk := FElemDrvSrvLnk;

  ExecuteDriveServiceMaster(ParamDrive, FElemBrDrive.DB.FieldByName('DRIVEKIND').asInteger , Serv );
  FRefreshDrvSrv;
end;

procedure TFrmDriveEditInfo.FormDestroy(Sender: TObject);
begin
  FDrvServ.Free;
  FHookControlChangeValue.Free;
end;

procedure TFrmDriveEditInfo.ListViewLargeBtnClick(Sender: TObject);
begin
  FDrvServ.SetListViewStyle( (Sender as TComponent).Tag );
end;

procedure TFrmDriveEditInfo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
       CanClose := self.FSaveData;
end;

procedure TFrmDriveEditInfo.BtnSaveDataClick(Sender: TObject);
begin
  FSaveData;
end;

procedure TFrmDriveEditInfo.butAddVendorClick(Sender: TObject);
begin
  UpdateDrvVendorRequisites( True, self.FElemBrDrive.GetCurrManagerId );
end;

procedure TFrmDriveEditInfo.butEditVendorClick(Sender: TObject);
begin
  UpdateDrvVendorRequisites( False, self.FElemBrDrive.GetCurrManagerId );
end;

procedure TFrmDriveEditInfo.butDelVendorClick(Sender: TObject);
begin
  CmbxSearchDrvVendor.EditValue := null;
end;

end.



    { if not Elem_DrvVendorQry.DB.Locate('VENDORID',VendId,[]) then
      begin
        Elem_DrvVendorQry.DBInsert;
        Elem_DrvVendorQry.DB.FieldByName('VENDORID').Value := VendId;
        Elem_DrvVendorQry.DBPost;
        Elem_DrvVendorQry.Requery;
      end;}
