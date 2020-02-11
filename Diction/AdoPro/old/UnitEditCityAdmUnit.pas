unit UnitEditCityAdmUnit;

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
  cxContainer, StdCtrls, Buttons, UnitFrameDicCity, ExtCtrls, cxTextEdit,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,UnitProc,Core, ServMod,
  UnitLngTranslateEdit, UnitLngTranslate, CityNewForm, OptSet,
  ADODB;

type
  TFrmEditCityAdmUnit = class(TForm)
    PanelLeft: TPanel;
    GridResortCountry: TcxGrid;
    GridResortCountryDBTableView1: TcxGridDBTableView;
    GridResortCountryLevel1: TcxGridLevel;
    PanelSearchCountry: TPanel;
    butClearSearchCountry: TSpeedButton;
    EdSearchCountry: TcxTextEdit;
    Panel1: TPanel;
    butRefreshCountry: TSpeedButton;
    ModalPanel: TPanel;
    CancelBtn: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    butEditResort: TSpeedButton;
    butDelResort: TSpeedButton;
    butNewResort: TSpeedButton;
    ButResortLng: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel4: TPanel;
    SpeedButton6: TSpeedButton;
    EdSearchResort: TcxTextEdit;
    GridCityAdmUnitObjDBTableView1: TcxGridDBTableView;
    GridCityAdmUnitObjLevel1: TcxGridLevel;
    GridCityAdmUnitObj: TcxGrid;
    CITY_ADM_UNIT_ImgQry: TADOQuery;
    CITY_ADM_UNIT_ImgQryID: TIntegerField;
    CITY_ADM_UNIT_ImgQryID_CITY_ADM_UNIT: TIntegerField;
    CITY_ADM_UNIT_ImgQryFILENAME: TStringField;
    CITY_ADM_UNIT_ImgQryAORDER: TIntegerField;
    CITY_ADM_UNIT_ImgQryDESCRIPT: TMemoField;
    CITY_ADM_UNIT_ImgSrc: TDataSource;
    CITY_ADM_UNIT_SUB_RELQry: TADOQuery;
    CITY_AMIN_UNIT_SUB_RELSrc: TDataSource;
    GridViewRepository: TcxGridViewRepository;
    ViewCityAdmUnitObj: TcxGridDBTableView;
    ViewCityAdmUnitObjRESORTID: TcxGridDBColumn;
    ViewCityAdmUnitObjRESORTNAME: TcxGridDBColumn;
    ViewCityAdmUnitObjCITYKIND: TcxGridDBColumn;
    ViewCityAdmUnitObjCOUNTRYID: TcxGridDBColumn;
    CITY_ADM_UNIT_ImgQrySHOWWEB: TIntegerField;
    CITY_ADM_UNIT_SUB_RELQryID: TIntegerField;
    CITY_ADM_UNIT_SUB_RELQryID_CITY_ADM_UNIT: TIntegerField;
    CITY_ADM_UNIT_SUB_RELQryID_ADM_UNIT_SUB: TIntegerField;
    procedure EdSearchCountryPropertiesChange(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure butClearSearchCountryClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure butEditResortClick(Sender: TObject);
    procedure butNewResortClick(Sender: TObject);
    procedure butDelResortClick(Sender: TObject);
    procedure ButResortLngClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    //FPathToImage  :string;
    //FPathToHtml   :string;

    FPathToImageCity : string;
    FPathToHtmlCity  : string;
    FCurrManager     : Integer;
    FParamCountyAdminUnit : TParamCountyAdminUnit;


    procedure FPrepare;
    Procedure FDestroy;
    procedure FRefreshControls;
    procedure FUpdateToolActions(Value: Integer);
    procedure ViewResortDblClick(Sender: TObject);
    procedure ViewBrResortCountryFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);
  public
    { Public declarations }
    //Elem_Country : TDBShemaView;
    //Elem_City : TDBShemaView;
    
    Elem_CityAdmObj_SUB_RELQry : TDBShema;
    Elem_CityAdmObjImg : TDBShemaView;

    procedure ShowUpdateResort( isNew:Boolean );
    procedure InitElem( MainElem:TDBShemaView );
    procedure CloseElem;
  published
    property EnabledUpdate:Integer write FUpdateToolActions ;
  end;

  procedure ShowEditCountryAdminUnit( Caption:WideString; ParamCountyAdminUnit : TParamCountyAdminUnit; aCurrManager:integer );

//var
//  FrmEditCityAdmUnit: TFrmEditCityAdmUnit;

implementation

{$R *.dfm}
procedure ShowEditCountryAdminUnit( Caption:WideString; ParamCountyAdminUnit : TParamCountyAdminUnit; aCurrManager:integer );
var aFrmEditDict:TForm;
begin
  aFrmEditDict := FindFormByCaption( Caption );
  if (aFrmEditDict <> nil )and(Assigned(aFrmEditDict)) then
  begin
    FormFocus(aFrmEditDict.Handle, SW_RESTORE );
    TFrmEditCityAdmUnit(aFrmEditDict).FCurrManager := aCurrManager;
    aFrmEditDict.FormStyle:= fsStayOnTop;
    aFrmEditDict.FormStyle:= fsNormal;
    if not aFrmEditDict.Showing then
      aFrmEditDict.Show;
    Exit;
  end
  else
  begin
    Application.CreateForm(TFrmEditCityAdmUnit, aFrmEditDict);
    aFrmEditDict.Caption := Caption;
    TFrmEditCityAdmUnit(aFrmEditDict).FParamCountyAdminUnit := ParamCountyAdminUnit;
    TFrmEditCityAdmUnit(aFrmEditDict).FCurrManager := aCurrManager;
    TFrmEditCityAdmUnit(aFrmEditDict).Fprepare;
    aFrmEditDict.Show;
  end;
end;

procedure TFrmEditCityAdmUnit.InitElem( MainElem:TDBShemaView );
begin
  //Elem_Country := CloneElemView( FParamCountyAdminUnit.ElemCountry) ;
  //Elem_City  := CloneElemView( FParamCountyAdminUnit.ElemCityAdmUnit) ;

  CITY_ADM_UNIT_SUB_RELQry.DataSource := MainElem.DS;
  Elem_CityAdmObj_SUB_RELQry :=  TDBShema.Create( CITY_ADM_UNIT_SUB_RELQry,  'CITY_ADM_UNIT_SUB_REL', 'ID', 'gen_city_adm_unit_sub_rel_id' );
  Elem_CityAdmObj_SUB_RELQry.AddMainElem( MainElem, 'ID_CITY_ADM_UNIT' );
  Elem_CityAdmObj_SUB_RELQry.AskBeforeDelete := False;

  CITY_ADM_UNIT_ImgQry.DataSource := MainElem.DS;
  Elem_CityAdmObjImg := TDBShemaView.Create( CITY_ADM_UNIT_ImgQry, nil, 'CITY_ADM_UNIT_IMG', 'ID', 'gen_city_adm_unit_img_id','AORDER' );
  Elem_CityAdmObjImg.AddMainElem( MainElem, 'ID_CITY_ADM_UNIT' );
  Elem_CityAdmObjImg.SetDefaultValue( ['SHOWWEB'], [1] );
end;

procedure TFrmEditCityAdmUnit.CloseElem;
begin
  //FParamCountyAdminUnit.ElemCountry.SaveDBPosition;
  //FParamCountyAdminUnit.ElemCityAdmUnit.SaveDBPosition;

  ViewSavePositionDBToIni( TcxGridDBTableView(GridResortCountry.Levels[0].GridView), FParamCountyAdminUnit.ElemCountry.GetElementIniFileName );
  ViewSavePositionDBToIni( TcxGridDBTableView(GridCityAdmUnitObj.Levels[0].GridView), FParamCountyAdminUnit.ElemCityAdmUnit.GetElementIniFileName );

  TcxGridDBTableView( GridCityAdmUnitObj.Levels[0].GridView ).OnDblClick := nil;
  TcxGridDBTableView( GridResortCountry.Levels[0].GridView ).OnFocusedRecordChanged := nil;

  //Elem_Country.Close;
  //Elem_City.Close;

  Elem_CityAdmObj_SUB_RELQry.Close;
  Elem_CityAdmObjImg.Close;

  if GridResortCountry.Levels[0].GridView <> nil then GridResortCountry.Levels[0].GridView.Free;
  if GridCityAdmUnitObj.Levels[0].GridView <> nil then GridCityAdmUnitObj.Levels[0].GridView.Free;

  CITY_ADM_UNIT_SUB_RELQry.DataSource := nil;
  CITY_ADM_UNIT_ImgQry.DataSource := nil;
end;

procedure TFrmEditCityAdmUnit.Fprepare;
begin
  //FPathToImage  := OptionSet.WebPathToImage+'COUNTRIES\';
  //FPathToHtml   := OptionSet.WebPathToHtml+'COUNTRIES\';

  FPathToImageCity  := OptionSet.WebPathToImage + 'CITY_AMD_UNIT\'+FParamCountyAdminUnit.FolderName+'\';
  FPathToHtmlCity   := OptionSet.WebPathToHtml + 'CITY_AMD_UNIT\'+FParamCountyAdminUnit.FolderName+'\';

  InitElem( FParamCountyAdminUnit.ElemCityAdmUnit );
  FParamCountyAdminUnit.ElemCountry.DBOpen;
  FParamCountyAdminUnit.ElemCityAdmUnit.DBOpen;

  GridResortCountry.Levels[0].GridView := FParamCountyAdminUnit.ElemCountry.CloneView( self, False );
  ViewRestorePositionDBFromIni( TcxGridDBTableView(GridResortCountry.Levels[0].GridView), FParamCountyAdminUnit.ElemCountry.GetElementIniFileName );

  GridCityAdmUnitObj.Levels[0].GridView := FParamCountyAdminUnit.ElemCityAdmUnit.CloneView(Self,False);
  ViewRestorePositionDBFromIni( TcxGridDBTableView(GridResortCountry.Levels[0].GridView), FParamCountyAdminUnit.ElemCityAdmUnit.GetElementIniFileName );
  
  TcxGridDBTableView( GridResortCountry.Levels[0].GridView ).OnFocusedRecordChanged := ViewBrResortCountryFocusedRecordChanged;
  TcxGridDBTableView( GridCityAdmUnitObj.Levels[0].GridView ).OnDblClick := ViewResortDblClick;
  FRefreshControls;
end;

procedure TFrmEditCityAdmUnit.ViewBrResortCountryFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if self = nil then exit;
  if not self.Showing then exit;

  if Sender.IsControlFocused then
    TcxGridDBTableView( GridCityAdmUnitObj.Levels[0].GridView ).DataController.GotoFirst;

  FRefreshControls;
end;

procedure TFrmEditCityAdmUnit.ViewResortDblClick(Sender: TObject);
begin
  if butEditResort.Enabled then butEditResort.Click;
end;

procedure TFrmEditCityAdmUnit.EdSearchCountryPropertiesChange(Sender: TObject);
begin
  SetFilterOnWievForManyColumns( TcxgridDBTableView( GridResortCountry.Levels[0].GridView ), ['NAME'],[EdSearchCountry.Text],['like'],[fboOr]);
end;

procedure TFrmEditCityAdmUnit.butClearSearchCountryClick(Sender: TObject);
begin
  EdSearchCountry.Clear;
end;

procedure TFrmEditCityAdmUnit.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  SetFilterOnWievForManyColumns( TcxgridDBTableView( GridResortCountry.Levels[0].GridView ), ['RESORTNAME'],[EdSearchResort.Text],['like'],[fboOr]);
end;

procedure TFrmEditCityAdmUnit.SpeedButton6Click(Sender: TObject);
begin
  EdSearchResort.Clear;
end;

procedure TFrmEditCityAdmUnit.ShowUpdateResort( isNew:Boolean );
var ParamEdiInfoCity : TParamEdiInfoCity;
    AddParam:TOptAddTreeNode;
begin
  ParamEdiInfoCity.ElemCityAdmUntItemsType := Elem_CITY_ADM_UNT_ITEMS_TYPEQry;
  ParamEdiInfoCity.ElemCITYADMUNITINFOQry := Elem_CITY_ADM_UNIT_INFOQry;
  ParamEdiInfoCity.ElemAdminUnitQry := Elem_Admin_UnitQry;

  ParamEdiInfoCity.ElemAdminUnitSubQry := Elem_Admin_Unit_SubQry;
  ParamEdiInfoCity.ElemAdminUnitSubRelQry := Elem_CityAdmObj_SUB_RELQry;

  //ParamEdiInfoCity.ElemOBJECTLINKS := Elem_OBJECTLINKSQry;
  ParamEdiInfoCity.ElemCountry := FParamCountyAdminUnit.ElemCountry;
  ParamEdiInfoCity.ElemCity := FParamCountyAdminUnit.ElemCityAdmUnit;

  ParamEdiInfoCity.ElemCityIMG  := Elem_CityAdmObjImg;

  ParamEdiInfoCity.PathToImageCity := FPathToImageCity;
  ParamEdiInfoCity.PathToHtmlCity  := FPathToHtmlCity;

  ParamEdiInfoCity.TypeAdminUnit := self.FParamCountyAdminUnit.TypeObj;//VarArrayCreate( [0,0], varVariant );
  //ParamEdiInfoCity.TypeAdminUnit[0]:= self.FParamCountyAdminUnit.TypeObj ;

  if isNew then AddParam := OptTreeNodeAddInsert
  else AddParam := OptTreeNodeAddNone;

  ShowEditCity( ParamEdiInfoCity, AddParam, ( -1 * self.FParamCountyAdminUnit.TypeObj ), True, self.FCurrManager );
  ParamEdiInfoCity.ElemCity.RequeryCurrentRecord;
end;

procedure TFrmEditCityAdmUnit.butNewResortClick(Sender: TObject);
begin
  ShowUpdateResort( True );
  FRefreshControls;
  //ShowUpdateResortInfEdit( True, butNewResort.Enabled );
end;

procedure TFrmEditCityAdmUnit.butEditResortClick(Sender: TObject);
begin
  ShowUpdateResort( False );
  FRefreshControls;
  //ShowUpdateResortInfEdit( False, butNewResort.Enabled );
end;

procedure TFrmEditCityAdmUnit.butDelResortClick(Sender: TObject);
begin
  self.FParamCountyAdminUnit.ElemCityAdmUnit.DBDelete(True);
  FRefreshControls;
end;

procedure TFrmEditCityAdmUnit.ButResortLngClick(Sender: TObject);
var FieldTranslateShema:TFieldTranslateShemaArr;
begin
  AddLngFieldColumnToShema( FieldTranslateShema, self.FParamCountyAdminUnit.ElemCityAdmUnit, 'NAME', 'NAME'  );

  ShowLngTranslate( self.FParamCountyAdminUnit.ElemCityAdmUnit, nil, FieldTranslateShema, 'оригінал', True, 780, DMServ.CurManager,
                    '( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE ='+IntToStr( self.FParamCountyAdminUnit.TypeObj )+' )',
                    'left join ADMIN_UNIT on CITY_ADM_UNIT.id_admin_unit = ADMIN_UNIT.id' );   //Elem_BrCountryQry
end;

procedure TFrmEditCityAdmUnit.FormDestroy(Sender: TObject);
begin
  FDestroy;
end;

procedure TFrmEditCityAdmUnit.FDestroy;
begin
  CloseElem;
end;

procedure TFrmEditCityAdmUnit.FRefreshControls;
begin
  butNewResort.Enabled := ( DMServ.CurManager > 0 ) and ( TcxgridDBTableView( GridResortCountry.Levels[0].GridView ).ViewData.RowCount <> 0 );
  butEditResort.Enabled:= ( DMServ.CurManager > 0 ) and ( TcxGridDBTableView( GridCityAdmUnitObj.Levels[0].GridView ).ViewData.RowCount <> 0 );
  butDelResort.Enabled := ( DMServ.CurManager > 0 ) and ( TcxGridDBTableView( GridCityAdmUnitObj.Levels[0].GridView ).ViewData.RowCount <> 0 );
  ButResortLng.Enabled := ( DMServ.CurManager > 0 ) and ( TcxGridDBTableView( GridCityAdmUnitObj.Levels[0].GridView ).ViewData.RowCount <> 0 );
end;


procedure TFrmEditCityAdmUnit.FUpdateToolActions(Value: Integer);
begin
  FRefreshControls;
end;

procedure TFrmEditCityAdmUnit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
