unit UnitResortEdit;

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
  UnitLngTranslateEdit, UnitLngTranslate, CityNewForm, OptSet;

type
  TParamCountyAdminUnit = record

    ElemCountry : TDBShemaView;
    ElemCityAdmUnit : TDBShema;
    ElemCityAdmImg  : TDBShemaView;
    ElemAdminUnitSubQry : TDBShemaView;
    ElemAdminUnitSubRelQry : TDBShema;

    FolderName  : WideString;
  end;

  TFrmResortEdit = class(TForm)
    PanelLeft: TPanel;
    GridResortCountry: TcxGrid;
    GridResortCountryDBTableView1: TcxGridDBTableView;
    GridResortCountryLevel1: TcxGridLevel;
    PanelSearchCountry: TPanel;
    butClearSearchCountry: TSpeedButton;
    EdSearchCountry: TcxTextEdit;
    Panel1: TPanel;
    butRefreshCountry: TSpeedButton;
    butEditCountry: TSpeedButton;
    butDelCountry: TSpeedButton;
    butAddCountry: TSpeedButton;
    ButCountryLng: TSpeedButton;
    Bevel3: TBevel;
    Bevel4: TBevel;
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
    GridResortDBTableView1: TcxGridDBTableView;
    GridResortLevel1: TcxGridLevel;
    GridResort: TcxGrid;
    procedure EdSearchCountryPropertiesChange(Sender: TObject);
    procedure cxTextEdit1PropertiesChange(Sender: TObject);
    procedure butClearSearchCountryClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure butEditResortClick(Sender: TObject);
    procedure butNewResortClick(Sender: TObject);
    procedure butDelResortClick(Sender: TObject);
    procedure ButResortLngClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FPathToImage  :string;
    FPathToHtml   :string;

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
    procedure ShowUpdateResort( isNew:Boolean );
  published
    property EnabledUpdate:Integer write FUpdateToolActions ;
  end;

  procedure ShowEditCountryAdminUnit( Caption:WideString; ParamCountyAdminUnit : TParamCountyAdminUnit; aCurrManager:integer );

var
  FrmResortEdit: TFrmResortEdit;

implementation

{$R *.dfm}
procedure ShowEditCountryAdminUnit( Caption:WideString; ParamCountyAdminUnit : TParamCountyAdminUnit; aCurrManager:integer );
begin
  if Assigned(FrmResortEdit) and (FrmResortEdit.Showing) then
  begin
    FormFocus(FrmResortEdit.Handle, SW_RESTORE );
    Exit;
  end
  else
  begin
    Application.CreateForm(TFrmResortEdit, FrmResortEdit);
    FrmResortEdit.FParamCountyAdminUnit := ParamCountyAdminUnit;
    FrmResortEdit.FCurrManager := aCurrManager;
    FrmResortEdit.Fprepare;
    FrmResortEdit.Show;
  end;

end;

procedure TFrmResortEdit.Fprepare;
begin
  TcxGridDBTableView(GridResortCountry.Levels[0].GridView).OnFocusedRecordChanged := ViewBrResortCountryFocusedRecordChanged;

  Elem_BrCountryQry.DBOpen;
  Elem_ResortQry.DBOpen;
  TcxGridDBTableView(GridResort.Levels[0].GridView).OnDblClick := ViewResortDblClick;
  FRefreshControls;
end;

procedure TFrmResortEdit.ViewBrResortCountryFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if self = nil then exit;
  if not self.Showing then exit;

  FRefreshControls;
end;

procedure TFrmResortEdit.ViewResortDblClick(Sender: TObject);
begin
  if butEditResort.Enabled then butEditResort.Click;
end;

procedure TFrmResortEdit.EdSearchCountryPropertiesChange(Sender: TObject);
begin
  SetFilterOnWievForManyColumns( TcxgridDBTableView( GridResortCountry.Levels[0].GridView ), ['NAME'],[EdSearchCountry.Text],['like'],[fboOr]);
end;

procedure TFrmResortEdit.butClearSearchCountryClick(Sender: TObject);
begin
  EdSearchCountry.Clear;
end;

procedure TFrmResortEdit.cxTextEdit1PropertiesChange(Sender: TObject);
begin
  SetFilterOnWievForManyColumns( TcxgridDBTableView( GridResortCountry.Levels[0].GridView ), ['RESORTNAME'],[EdSearchResort.Text],['like'],[fboOr]);
end;

procedure TFrmResortEdit.SpeedButton6Click(Sender: TObject);
begin
  EdSearchResort.Clear;
end;

procedure TFrmResortEdit.ShowUpdateResort( isNew:Boolean );
var ParamEdiInfoCity : TParamEdiInfoCity;
    AddParam:TOptAddTreeNode;
begin
  ParamEdiInfoCity.ElemCITYADMUNITINFOQry := Elem_CITY_ADM_UNIT_INFOQry;
  ParamEdiInfoCity.ElemAdminUnitQry := Elem_Admin_UnitQry;

  ParamEdiInfoCity.ElemAdminUnitSubQry := Elem_Admin_Unit_SubQry;           //!!
  ParamEdiInfoCity.ElemAdminUnitSubRelQry := nil;// Elem_Resort_AMIN_UNIT_SUB_RELQry; //!!

  //ParamEdiInfoCity.ElemOBJECTLINKS := Elem_OBJECTLINKSQry;
  //ParamEdiInfoCity.ElemNaturObj := Elem_NaturObjQry;
  //ParamEdiInfoCity.ElemInfra := Elem_INFRAQry;
  ParamEdiInfoCity.ElemCity := Elem_ResortQry;
  ParamEdiInfoCity.ElemCountry := Elem_BrCountryQry;
  ParamEdiInfoCity.ElemCityIMG  := Elem_ResortImgQry;        //!!

  ParamEdiInfoCity.PathToImageCity := FPathToImageCity;
  ParamEdiInfoCity.PathToHtmlCity  := FPathToHtmlCity;

  ParamEdiInfoCity.TypeAdminUnit := VarArrayCreate( [0,0], varVariant );
  ParamEdiInfoCity.TypeAdminUnit[0]:= 2 ;

  if isNew then AddParam := OptTreeNodeAddInsert
  else AddParam := OptTreeNodeAddNone;

  ShowEditCity( ParamEdiInfoCity, AddParam, -2, True, self.FCurrManager );
  ParamEdiInfoCity.ElemCity.RequeryCurrentRecord;
end;

procedure TFrmResortEdit.butNewResortClick(Sender: TObject);
begin
  ShowUpdateResort( True );
  //ShowUpdateResortInfEdit( True, butNewResort.Enabled );
end;

procedure TFrmResortEdit.butEditResortClick(Sender: TObject);
begin
  ShowUpdateResort( False );
  //ShowUpdateResortInfEdit( False, butNewResort.Enabled );
end;

procedure TFrmResortEdit.butDelResortClick(Sender: TObject);
begin
  Elem_ResortQry.DBDelete(True);
end;

procedure TFrmResortEdit.ButResortLngClick(Sender: TObject);
var FieldTranslateShema:TFieldTranslateShemaArr;
begin
  AddLngFieldColumnToShema( FieldTranslateShema, Elem_ResortQry, 'NAME', 'NAME'  );
  ShowLngTranslate( Elem_ResortQry, nil, FieldTranslateShema, 'оригінал', True, 780, DMServ.CurManager,'( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE = 2 )',
                    'left join ADMIN_UNIT on CITY_ADM_UNIT.id_admin_unit = ADMIN_UNIT.id' );   //Elem_BrCountryQry
end;

procedure TFrmResortEdit.FormDestroy(Sender: TObject);
begin
  FDestroy;
end;

procedure TFrmResortEdit.FDestroy;
begin
  TcxGridDBTableView(GridResort.Levels[0].GridView).OnDblClick := nil;
end;

procedure TFrmResortEdit.FRefreshControls;
begin
  butNewResort.Enabled := ( DMServ.CurManager > 0 ) and ( TcxgridDBTableView( GridResortCountry.Levels[0].GridView ).ViewData.RecordCount <> 0 );
  butEditResort.Enabled:= ( DMServ.CurManager > 0 ) and ( Elem_ResortQry.View.ViewData.RowCount <> 0 );
  butDelResort.Enabled := ( DMServ.CurManager > 0 ) and ( Elem_ResortQry.View.ViewData.RowCount <> 0 );
  ButResortLng.Enabled := ( DMServ.CurManager > 0 ) and ( Elem_ResortQry.View.ViewData.RowCount <> 0 );
end;

procedure TFrmResortEdit.FUpdateToolActions(Value: Integer);
begin
  FRefreshControls;
end;

procedure TFrmResortEdit.FormCreate(Sender: TObject);
begin
  FPathToImage  := OptionSet.WebPathToImage+'COUNTRIES\';
  FPathToHtml   := OptionSet.WebPathToHtml+'COUNTRIES\';

  FPathToImageCity  := OptionSet.WebPathToImage + 'CITY_AMD_UNIT\RESORT\';
  FPathToHtmlCity   := OptionSet.WebPathToHtml + 'CITY_AMD_UNIT\RESORT\';
end;

end.
