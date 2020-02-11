unit UnitResortInfoEdit;

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
  cxCheckBox, Buttons, cxTextEdit, StdCtrls, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, ExtCtrls,
  UnitFrameSelParentObj,cxGridDBTableView, cxFilter, ServMod,Core,UnitProc, cxMemo,
  UnitFramePhotoList, UnitFrameUpdateImages,TourCmnlIf,OptSet,DocFileUn,UnitUpdateImages,
  UnitLngTranslateEdit, UnitHookControlChangeValue, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, UnitSelParentObj, UnitFrameKindType ;

type
  TFrmResortInfEdit = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    BtnSaveData: TBitBtn;
    LbName: TLabel;
    EdName: TcxTextEdit;
    ButResortLng: TSpeedButton;
    Panel1: TPanel;
    ButResortImgsEdit: TSpeedButton;
    FramePhotoListResort: TFramePhotoList;
    Bevel1: TBevel;
    Panel3: TPanel;
    ParentObjDBGrid: TcxGrid;
    ParentObjDBGridDBTableView1: TcxGridDBTableView;
    ParentObjDBGridLevel1: TcxGridLevel;
    Panel2: TPanel;
    Label1: TLabel;
    EditObjBtn: TSpeedButton;
    Panel4: TPanel;
    ChildObjDBGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    Panel5: TPanel;
    Label3: TLabel;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewObjCityOn: TcxGridDBTableView;
    ViewObjCityOnLINKID: TcxGridDBColumn;
    ViewObjCityOnMAIN_TYPEOBJ: TcxGridDBColumn;
    ViewObjCityOnMAINOBJECTID: TcxGridDBColumn;
    ViewObjCityOnTYPEOBJ: TcxGridDBColumn;
    ViewObjCityOnOBJECTID: TcxGridDBColumn;
    ViewObjCityOnOBJLINKCOUNTRY: TcxGridDBColumn;
    ViewObjCityOnOBJECTNAME: TcxGridDBColumn;
    ViewObjCityOnMAINOBJECTNAME: TcxGridDBColumn;
    ViewObjCityOnID_COUNTRY: TcxGridDBColumn;
    ViewObjCityOnCOUNTRINAME: TcxGridDBColumn;
    ViewObjTerritoriesOn: TcxGridDBTableView;
    ViewObjTerritoriesOnLINKID: TcxGridDBColumn;
    ViewObjTerritoriesOnMAIN_TYPEOBJ: TcxGridDBColumn;
    ViewObjTerritoriesOnMAINOBJECTID: TcxGridDBColumn;
    ViewObjTerritoriesOnTYPEOBJ: TcxGridDBColumn;
    ViewObjTerritoriesOnOBJECTID: TcxGridDBColumn;
    ViewObjTerritoriesOnOBJLINKCOUNTRY: TcxGridDBColumn;
    ViewObjTerritoriesOnOBJECTNAME: TcxGridDBColumn;
    ViewObjTerritoriesOnMAINOBJECTNAME: TcxGridDBColumn;
    ViewObjTerritoriesOnID_COUNTRY: TcxGridDBColumn;
    ViewObjTerritoriesOnCOUNTRINAME: TcxGridDBColumn;
    ViewObjCityOnCalcMainObjName: TcxGridDBColumn;
    FrameKindTypeResort: TFrameKindType;
    procedure ButResortImgsEditClick(Sender: TObject);
    procedure ButResortLngClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CancelBtnClick(Sender: TObject);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure EditObjBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FCanUpdate : Boolean;
    FIsNew     : Boolean;
    FHookControlChangeValue : THookControlChangeValue;
    procedure FParepare;
    procedure FRefreshControls;
    procedure FRefreshChangeControl(Sender: TObject);
    procedure FPrepareControls;
    procedure FShowData;
    function  FSaveData:Boolean;
    function  FGetViewFieldImgUpdPrperty:TViewFieldImgUpd;
    procedure FUpdateToolActions( Value:Integer );
    Procedure FShowUdateImageFor;
    procedure FPrepareFilterObjects;
  public
    { Public declarations }
    function  GetDocStorePath: String;

  published
    property EnabledUpdate:Integer write FUpdateToolActions ;
  end;

  function GetResortDocStoreFolder(const Cntry, ResortId: String): String;
  procedure ShowUpdateResortInfEdit( isNew:Boolean; CanEdit:Boolean );
var
  FrmResortInfEdit: TFrmResortInfEdit;

implementation


{$R *.dfm}
procedure ShowUpdateResortInfEdit( isNew:Boolean; CanEdit:Boolean );
begin
  try
    Application.CreateForm(TFrmResortInfEdit, FrmResortInfEdit);
    FrmResortInfEdit.FCanUpdate := CanEdit;
    FrmResortInfEdit.FIsNew := isNew;
    FrmResortInfEdit.FParepare;
    FrmResortInfEdit.ShowModal;

  finally
    FrmResortInfEdit.Free;
  end;
end;

procedure PrepareFilterParentObjects( aView: TcxGridDBTableView );
var V_FiltrTypeObj:Variant;
begin
  {V_FiltrTypeObj := VarArrayCreate( [0, 0], varVariant );
  V_FiltrTypeObj[0]:=1; }

  SetFilterOnWievForManyColumns( aView,
                                 ['OBJECTID'],[  Elem_ResortQry.GetValueId ],['='],[fboAnd], fboAnd );
end;

procedure TFrmResortInfEdit.FPrepareFilterObjects;
var V_FiltrTypeObj:Variant;
begin
 { V_FiltrTypeObj := VarArrayCreate( [0, 0], varVariant );
  V_FiltrTypeObj[0]:=1;   }

  PrepareFilterParentObjects( TcxGridDBTableView( ParentObjDBGrid.Levels[0].GridView ) );

  SetFilterOnWievForManyColumns( TcxGridDBTableView( ChildObjDBGrid.Levels[0].GridView ),
                                ['MAINOBJECTID'],[  Elem_ResortQry.GetValueId ],['='],[fboAnd], fboAnd );
end;

procedure TFrmResortInfEdit.FParepare;
var paramFrame: TParamFrameKindType;
begin
  //Elem_ResortTypeQry.DBOpen;
  Elem_KindStreetQry.DBOpen;
  Elem_RESORTIMGQry.DBOpen;
  Elem_CITYKINDQry.DBOpen;
  //Elem_ProvinceQry.DBOpen;
  //Elem_TownShipsQry.DBOpen;
  //Elem_OBJECTLINKSQry.DBQuerySetParamValue('typeobj', 1 );
  //Elem_OBJECTLINKSQry.DBQuerySetParamValue('objectid', Elem_ResortQry.GetValueId );
  //Elem_OBJECTLINKSQry.DBOpen;

  //Elem_NaturObjQry.DBOpen;
  //Elem_InfraQry.DBOpen;

  FPrepareControls;
  FShowData;

  FHookControlChangeValue := THookControlChangeValue.Create( Self, FRefreshChangeControl );
  Elem_Admin_UnitQry.SetFilterOnViewList( ['ID_CITY_ADM_UNT_ITEMS_TYPE'], [2], ['='] );

  paramFrame.ElemType := Elem_Admin_UnitQry;
  paramFrame.ElemKindType := Elem_Admin_Unit_SubQry;
  //paramFrame.ElemKindTypeRel := Elem_CITY_AMIN_UNIT_SUB_RELQry;
  paramFrame.FieldKeyKindRelation := 'ID_ADM_UNIT_SUB';
  FrameKindTypeResort.InitFrame( paramFrame, Self.FCanUpdate, FRefreshChangeControl );
  //FHookControlChangeValue.AddControl( FrameSelParentObjInfEdit );
  FRefreshControls;
end;

procedure TFrmResortInfEdit.FRefreshChangeControl(Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrmResortInfEdit.FPrepareControls;
var ParamSelParentObj : TParamSelParentObj;
begin
 { ParamSelParentObj.ElemCountry := Elem_BrCountryQry;
  ParamSelParentObj.ElemObjLinkCountry := Elem_OBJECTLINKS_COUNTRYQry;
  ParamSelParentObj.ElemObjLinks := Elem_OBJECTLINKSQry;
  ParamSelParentObj.ElemNaturObjects := Elem_NaturObjQry;
  ParamSelParentObj.ElemInfra:= Elem_InfraQry;

  ParamSelParentObj.ObjLinksMainTypeObj := 1;
  ParamSelParentObj.ObjLinksMainObjId := Elem_BrCityQry.GetValueId;

  ParamSelParentObj.ArrEn := [ optResort, optNaturObj , optInfra ];

  FrameSelParentObjInfEdit.InitFrame( ParamSelParentObj , Elem_BrCityQry.GetValueId, 0, null, PrepareFilterParentObjects );
  FrameSelParentObjInfEdit.SetManagerId( DMServ.CurManager ); }
  TcxGridDBTableView( ParentObjDBGrid.Levels[0].GridView ).Styles := Elem_CITYKINDQry.View.Styles;
  TcxGridDBTableView( ChildObjDBGrid.Levels[0].GridView ).Styles := Elem_CITYKINDQry.View.Styles;

  FPrepareFilterObjects;

  //SetPropInCxExtLookupComboBox( CmbxKindResort, TcxGridDBTableView( Elem_ResortTypeQry.ViewList ),'NAME', Elem_BrCountryQry.FieldKod, FCanUpdate, false );
  //SetPropInCxExtLookupComboBox( ExtLupComboboxStreetKind, TcxGridDBTableView( Elem_KindStreetQry.ViewList), 'NAME',Elem_KindStreetQry.FieldKod,FCanUpdate,false );

  FramePhotoListResort.IntitListPhotoFrame( Elem_RESORTIMGQry, 'FILENAME', 'DESCRIPT', OptionSet.WebPathToImage+'no-image.png' );
  //FramePhotoListResort.MemoDescript.StyleDisabled.Color := TcxGridDBTableView( Elem_ResortTypeQry.ViewList ).Styles.Content.Color;

  FUpdateToolActions( DMServ.CurManager );
end;

procedure TFrmResortInfEdit.FRefreshControls;
begin
  //CmbxKindResort.Enabled := ( DMServ.CurManager > 0);
  //ExtLupComboboxStreetKind.Enabled := ( DMServ.CurManager > 0) and ( chSetSityKind.Checked);
  //chSetSityKind.Enabled := ( DMServ.CurManager > 0);
  EdName.Enabled := ( DMServ.CurManager > 0);

  FramePhotoListResort.Refresh( GetDocStorePath, True );

  if Self.FHookControlChangeValue <> nil then
    BtnSaveData.Enabled := Self.FHookControlChangeValue.IsChange
  else BtnSaveData.Enabled := False;

  ButResortImgsEdit.Enabled := (DMServ.CurManager > 0);
end;

function TFrmResortInfEdit.FSaveData: Boolean;
begin
  if not FIsNew then Elem_ResortQry.DBEdit
  else Elem_ResortQry.DBInsert;
  Elem_ResortQry.DB.FieldByName('NAME').Value := EdName.EditValue;
  FrameKindTypeResort.SaveCheckRelation;


  //Elem_ResortQry.DB.FieldByName('RESORTTYPEID').Value := CmbxKindResort.EditValue;
  //Elem_ResortQry.DB.FieldByName('RESORTNAME').Value := EdName.EditValue ;
  //Elem_ResortQry.DB.FieldByName('MEMO').Value := MemoHotelDesript.EditValue;
  Elem_ResortQry.DBPost;

  self.FIsNew := False;
  FHookControlChangeValue.IsChange := False;
  FRefreshControls;
end;

procedure TFrmResortInfEdit.FShowData;
begin
  if not FIsNew then
  begin
    //CmbxKindResort.EditValue := Elem_ResortQry.DB.FieldByName('RESORTTYPEID').Value;
    EdName.EditValue := Elem_ResortQry.DB.FieldByName('NAME').Value;
    FrameKindTypeResort.ShowData( Elem_ResortQry.DB.FieldByName('ID_ADMIN_UNIT').Value );
  end
  else
  begin
    EdName.EditValue := null;
    FrameKindTypeResort.ShowData( null );
  end;
end;

function GetResortDocStoreFolder(const Cntry, ResortId: String): String;
begin
  Result := IncludeTrailingPathDelimiter(OptionSet.StoreFolder) +
    sResorts + PathDelim + Cntry + PathDelim + ResortId;
end;

function TFrmResortInfEdit.GetDocStorePath: String;
begin
  Result := GetLocalFileName(IncludeTrailingPathDelimiter(
    GetResortDocStoreFolder(
      Elem_BrCountryQry.DB.FieldByName('NAME_ENG').asString, Elem_ResortQry.DB.FieldByName('RESORTID').asString)));
end;

function TFrmResortInfEdit.FGetViewFieldImgUpdPrperty:TViewFieldImgUpd;
begin
  result.ElemImages := Elem_RESORTIMGQry;
  result.FieldId := 'RESORTIMAGEID';
  result.FieldFileName := 'FILENAME';
  result.FieldWeb := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';
end;

Procedure TFrmResortInfEdit.FShowUdateImageFor;
var ImgUpdPrperty:TViewFieldImgUpd;
begin
  ImgUpdPrperty := FGetViewFieldImgUpdPrperty;
  ImgUpdPrperty.FieldObject :=  '';
  ImgUpdPrperty.FieldObjValue := '';

  ShowUpdateImages( ImgUpdPrperty, GetDocStorePath, OptionSet.WebPathToImage+'no-image.png', Elem_BrHotelQry.View.Styles );
end;

procedure TFrmResortInfEdit.ButResortImgsEditClick(Sender: TObject);
begin
  FShowUdateImageFor;
end;

procedure TFrmResortInfEdit.ButResortLngClick(Sender: TObject);
begin
  ShowTranslateLng( Elem_ResortQry, EdName.Text, 'NAME', 'uk', Elem_BrCountryQry.View.Styles );
end;

procedure TFrmResortInfEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
       CanClose := self.FSaveData;
end;

procedure TFrmResortInfEdit.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmResortInfEdit.BtnSaveDataClick(Sender: TObject);
begin
  self.FSaveData;
end;

procedure TFrmResortInfEdit.FUpdateToolActions(Value: Integer);
begin
  //FrameSelParentObjInfEdit.SetManagerId( Value );
  FRefreshControls;
end;

procedure TFrmResortInfEdit.EditObjBtnClick(Sender: TObject);
var ParamSelParentObj : TParamSelParentObj;
    OpEnArr : ToOpEnArr;
begin
  ParamSelParentObj.ElemCountry := Elem_BrCountryQry;
  ParamSelParentObj.ElemObjLinkCountry := Elem_SelCountryObjectLinksQry;
  //ParamSelParentObj.ElemObjLinks := Elem_OBJECTLINKSQry;
  //ParamSelParentObj.ElemNaturObjects := Elem_NaturObjQry;
  //ParamSelParentObj.ElemInfra:= Elem_InfraQry;

  ParamSelParentObj.ObjLinksMainTypeObj := 1;
  ParamSelParentObj.ObjLinksMainObjId := Elem_ResortQry.GetValueId;

  ParamSelParentObj.ArrEn := [ optResort, optNaturObj , optInfra ];

  ShowParentObjEditDlg( ParamSelParentObj , Elem_ResortQry.GetValueId, 1, null, DMServ.CurManager, PrepareFilterParentObjects );
end;

procedure TFrmResortInfEdit.FormDestroy(Sender: TObject);
begin
  //Elem_OBJECTLINKSQry.DBClose;
  //FrameKindTypeResort.DestroyFrame;
end;

end.
