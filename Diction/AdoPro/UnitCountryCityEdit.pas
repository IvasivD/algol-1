unit UnitCountryCityEdit;

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
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, Buttons, ExtCtrls,OrderUn,
  cxContainer, cxTextEdit,UnitEditInfoCountry,ServMod,core,UnitProc,TourConsts,IBQuery,
  CityNewForm,OptSet,UnitLngTranslate, cxMaskEdit, cxDropDownEdit,FrmProgress,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, Menus,
  UnitFrameDicCity, UnitFrameDic,UnitProjectProc,ServModDic;

type
  TFrmCountryCityEdit = class(TForm)
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PanelLeft: TPanel;
    PanCountryDetail: TPanel;
    CapitalLabel: TLabel;
    TimeBiasLabel: TLabel;
    CurrencyLabel: TLabel;
    CurrencyShortLabel: TLabel;
    Shape1: TShape;
    TouristTemplateBtn: TSpeedButton;
    LocaleTimeLabel: TLabel;
    URLBtn: TSpeedButton;
    Label5: TLabel;
    ImgFlag: TImage;
    ImgGerb: TImage;
    LbShortSign: TLabel;
    EdCountryName: TcxTextEdit;
    EdPhoneCode: TcxTextEdit;
    EdCapital: TcxTextEdit;
    EdCurrency: TcxTextEdit;
    EdCurrencyShort: TcxTextEdit;
    EdFullName: TcxTextEdit;
    EdTimeDifference: TcxTextEdit;
    TimerShowCountryTime: TTimer;
    PMSelectKindTranslateSity: TPopupMenu;
    butKndSelectCityTranslateAll: TMenuItem;
    butKndSelectCityTranslateByFilter: TMenuItem;
    PanelCity: TPanel;
    Panel1: TPanel;
    FrameDicCityCountry: TFrameDicCity;
    Splitter1: TSplitter;
    FrameDicBrCountry: TFrameDic;
    FrameDicListCity: TFrameDic;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TimerShowCountryTimeTimer(Sender: TObject);
    procedure TouristTemplateBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FrameDicListCityButTranslateLngClick(Sender: TObject);
  private
     FCurManager : Integer;
     FPathToImage:string;
     FPathToHtml :string;

     FPathToImageCity:string;
     FPathToHtmlCity:string;

     FSqlWhere : WideString;
     FSqlWhereGlobalSearch : WideString;

     procedure FPrepareFrameDic;
     procedure FPrepare;
     procedure FRefreshCountryTime;
     procedure FUpdateToolActions( Value:Integer );

     procedure FRefreshPanelCountryInfo( aData:TRecDataInfoArr );

    { Private declarations }
  public
    procedure RefreshControlsAction(Sender:TObject);
    procedure RefreshControls;
    procedure RefreshCountryInfo;
    procedure TouristTemplateActionExecute;

  published
    property CurManager : integer read FCurManager write FCurManager;
    property EnabledUpdate : Integer write FUpdateToolActions;
  end;

Procedure ShowEditCountryCity( Caption:Widestring; aCurManager:Integer );
procedure UpdateCountry( isNew:Boolean; CurManager:Integer );
procedure ShowUpdateEditCity( OptAdd : TOptAddTreeNode; CurManager:Integer );

implementation
uses UnitDictionGrid,UnitLngTranslateEdit, ServModIB, TmplFrmNew;
{$R *.dfm}

Procedure ShowEditCountryCity( Caption:Widestring; aCurManager:Integer );
var FrmCountryCityEdit: TForm;
begin
  ReplaseOn( Caption,'&','');
  FrmCountryCityEdit := FindFormByCaptionAndRestoreOnTop( Caption );
  if FrmCountryCityEdit <> nil then
  begin
    TFrmCountryCityEdit(FrmCountryCityEdit).CurManager := aCurManager;
    FormFocus(FrmCountryCityEdit.Handle, SW_RESTORE );
  end
  else
  begin
    Application.CreateForm(TFrmCountryCityEdit, FrmCountryCityEdit);
    FrmCountryCityEdit.Caption := Caption;
    TFrmCountryCityEdit(FrmCountryCityEdit).CurManager := aCurManager;
    TFrmCountryCityEdit(FrmCountryCityEdit).FPrepare;
    FrmCountryCityEdit.Show;
  end;
end;

procedure TFrmCountryCityEdit.FPrepareFrameDic;
var ParamDicCountry: TParamFormDict;
    ParamDicCity   : TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicCountry);
  ParamDicCountry.Func.LogProc := ShowLog;
  ParamDicCountry.Func.RefreshFunction := RefreshControlsAction;
  ParamDicCountry.Func.AddProcGridView := UpdateCountry;
  ParamDicCountry.Update.SearchFilter := True;
  FrameDicBrCountry.Init( Elem_BrCountryQry, Self.FCurManager, ParamDicCountry );

  PrepareDefaultParamDic(ParamDicCity);
  ParamDicCity.MainElem := Elem_City_Admin_UnitRegionQry;
  ParamDicCity.Func.LogProc := ShowLog;
  ParamDicCity.Func.RefreshFunction := RefreshControlsAction;
  ParamDicCity.Func.AddProcTreeView := ShowUpdateEditCity;
  ParamDicCity.lng.LngJoinSql := 'left join ADMIN_UNIT on CITY_ADM_UNIT.id_admin_unit = ADMIN_UNIT.id';
  FrameDicListCity.Init( Elem_City_Admin_Unit, Self.FCurManager, ParamDicCity );
end;

procedure TFrmCountryCityEdit.FRefreshCountryTime;
begin
  if not Elem_BrCountryQry.DB.fieldByName('TIMEBIAS').IsNull then
  begin
    EdTimeDifference.Text := Elem_BrCountryQry.DB.fieldByName('TIMEBIAS').AsString;
    LocaleTimeLabel.Caption := FormatDateTime( SCityBrLocaleTimeMsg, Now + Elem_BrCountryQry.DB.fieldByName('TIMEBIAS').asFloat / 24 );
  end
  else
  begin
    EdTimeDifference.Text := '';
    LocaleTimeLabel.Caption := '';
  end;
end;

procedure TFrmCountryCityEdit.FRefreshPanelCountryInfo( aData:TRecDataInfoArr );
var CurrData:TRecDataInfoArr;
begin
  EdCountryName.EditValue := Elem_BrCountryQry.DB.fieldByName('NAME').asString;
  LbShortSign.Caption :=  Elem_BrCountryQry.DB.fieldByName('SHORTSIGN').asString; 

  CurrData := FindDataCountryInfByTypeInf( aData, 14 );
  if Length(CurrData)>0 then EdPhoneCode.EditValue :=CurrData[0].aValue
  else EdPhoneCode.EditValue :='';

  CurrData := FindDataCountryInfByTypeInf( aData, 4 );
  if Length(CurrData)>0 then EdCapital.EditValue :=CurrData[0].AddValue
  else EdCapital.EditValue :='';

  CurrData := FindDataCountryInfByTypeInf( aData, 6 );
  if Length(CurrData)>0 then
  begin
    if Elem_CurrencyQry.DB.Locate(Elem_CurrencyQry.FieldKod, CurrData[0].IdValue,[]) then
      EdCurrency.EditValue :=Elem_CurrencyQry.DB.FieldByName('CURRENCYNAME').asString;
    EdCurrencyShort.EditValue :=CurrData[0].AddValue;
  end
  else
  begin
    EdCurrency.EditValue :='';
    EdCurrencyShort.EditValue :='';
  end;

  CurrData := FindDataCountryInfByTypeInf( aData, 3 );
  if Length(CurrData)>0 then EdFullName.Text := CurrData[0].aValue
  else EdFullName.Text :='';

  CurrData := FindDataCountryInfByTypeInf( aData, 1 );
  if Length(CurrData)>0 then LoadImageInf( ImgGerb, FPathToImage+'GERB\'+  CurrData[0].aValue )
  else ImgGerb.Picture:=nil;

  CurrData := FindDataCountryInfByTypeInf( aData, 2 );
  if Length(CurrData)>0 then LoadImageInf( ImgFlag, FPathToImage+'FLAG\'+  CurrData[0].aValue )
  else ImgFlag.Picture:=nil;

  FRefreshCountryTime;
end;

procedure TFrmCountryCityEdit.RefreshCountryInfo;
var aData:TRecDataInfoArr;
begin
  if self.name = '' then exit;
  
  ReadDataCountryInf( aData );
  FRefreshPanelCountryInfo( aData );
end;

procedure TFrmCountryCityEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCountryCityEdit.FormShow(Sender: TObject);
begin
  RefreshCountryInfo;
  ChangeKeyBoardLayout;
  PositionFormCenterFromMainForm( self );
end;

procedure TFrmCountryCityEdit.FPrepare;
var ParamFrame:TParamFrameDicCity;
begin
  Elem_BrCountryQry.DBOpen;
  Elem_City_Admin_UnitRegionQry.DBOpen;
  Elem_City_Admin_Unit.DBOpenWait;

  Elem_COUNTRIES_INFO.DBOpen;
  Elem_CurrencyQry.DBOpen;
  Elem_COUNTRY_TEMPL_ADM_UNITQry.DBOpen;

  FPathToImage  := OptionSet.WebPathToImage + 'COUNTRIES\';
  FPathToHtml   := OptionSet.WebPathToHtml + 'COUNTRIES\';

  FPathToImageCity  := OptionSet.WebPathToImage + 'CITY_AMD_UNIT\CITIES\';
  FPathToHtmlCity   := OptionSet.WebPathToHtml + 'CITY_AMD_UNIT\CITIES\';

  ParamFrame.GoogleTranslate := nil;
  ParamFrame.ElemCounry := Elem_BrCountryQry;

  ParamFrame.ElemCityAdmUntItemsType := Elem_CITY_ADM_UNT_ITEMS_TYPEQry;
  ParamFrame.ElemCITYADMUNITINFOQry := Elem_CITY_ADM_UNIT_INFOQry;
  ParamFrame.ElemCityAdminUnitRegion := Elem_City_Admin_UnitRegionQry;
  ParamFrame.ElemCityAdminUnit := Elem_City_Admin_Unit;
  ParamFrame.ElemAdminUnitQry  := Elem_Admin_unitQry;
  ParamFrame.ElemAdminUnitSubQry := Elem_Admin_unit_SubQry;
  ParamFrame.ElemAdminUnitSubRelQry := Elem_CITY_ADM_UNIT_SUB_RELQry;
  ParamFrame.ElemCountryTemplAdmUnit := Elem_COUNTRY_TEMPL_ADM_UNITQry;
  ParamFrame.ElemCityAdminUnitIMG := Elem_City_Adm_UnitImgQry;

  ParamFrame.ElemResortCountry := Elem_BrCountryQry;

  ParamFrame.PathToImageCity := FPathToImageCity;
  ParamFrame.PathToHtmlCity  := FPathToHtmlCity;
  ParamFrame.LogProc := ShowLog; 
  FrameDicCityCountry.IntitDicCityFrame( ParamFrame, True , CurManager );

  FPrepareFrameDic;

  FUpdateToolActions( CurManager );
end;

procedure UpdateCountry( isNew:Boolean; CurManager:Integer );
var aPathToImage:string;
    aPathToHtml:string;
begin
  aPathToImage  := OptionSet.WebPathToImage+'COUNTRIES\';
  aPathToHtml   := OptionSet.WebPathToHtml+'COUNTRIES\';

  ShowEditCountryInfo( isNew, aPathToImage, aPathToHtml, CurManager, (CurManager > 0) );
end;

procedure ShowUpdateEditCity( OptAdd : TOptAddTreeNode; CurManager:Integer );
var ParamEdiInfoCity : TParamEdiInfoCity;
    ParentCityRegion : Variant;
begin
  ParamEdiInfoCity.ElemCityAdmUntItemsType := Elem_CITY_ADM_UNT_ITEMS_TYPEQry;
  ParamEdiInfoCity.ElemCITYADMUNITINFOQry := Elem_CITY_ADM_UNIT_INFOQry;
  ParamEdiInfoCity.ElemAdminUnitQry := Elem_Admin_unitQry;
  ParamEdiInfoCity.ElemAdminUnitSubQry := Elem_Admin_unit_SubQry;
  ParamEdiInfoCity.ElemAdminUnitSubRelQry := Elem_CITY_ADM_UNIT_SUB_RELQry;

  ParamEdiInfoCity.ElemCity := Elem_City_Admin_Unit;
  ParamEdiInfoCity.ElemCountry := Elem_BrCountryQry;
  ParamEdiInfoCity.ElemCityIMG  := Elem_City_Adm_UnitImgQry;
  ParamEdiInfoCity.PathToImageCity := OptionSet.WebPathToImage + 'CITY_AMD_UNIT\CITIES\';
  ParamEdiInfoCity.PathToHtmlCity  := OptionSet.WebPathToHtml + 'CITY_AMD_UNIT\CITIES\';
  ParamEdiInfoCity.TypeAdminUnit := 0;

  ParentCityRegion := ParamEdiInfoCity.ElemCity.DB.FieldByName( 'ID_PARENT' ).Value;
  ShowEditCity(ParamEdiInfoCity, OptAdd, ParentCityRegion, True,  CurManager );
  Elem_City_Admin_Unit.RequeryCurrentRecord;
end;


procedure TFrmCountryCityEdit.TimerShowCountryTimeTimer(Sender: TObject);
begin
  FRefreshCountryTime;
end;

procedure TFrmCountryCityEdit.FUpdateToolActions( Value:Integer );
begin
  CurManager := Value;
  RefreshControls;
  FrameDicBrCountry.RefreshControls( CurManager );
  FrameDicListCity.RefreshControls( CurManager );
end;

procedure TFrmCountryCityEdit.RefreshControls;
begin
  if Elem_BrCountryQry.GetActiveCloneElem.View.ViewData.RowCount =0 then 
  begin
    Elem_City_Admin_UnitRegionQry.HideDataForFilterOnTree(True);
    Elem_City_Admin_Unit.GetActiveCloneElem.HideDataForFilterOnTree(True);
  end
  else
  begin
    Elem_City_Admin_UnitRegionQry.HideDataForFilterOnTree(False);
    Elem_City_Admin_Unit.GetActiveCloneElem.HideDataForFilterOnTree(False);
  end;

  FrameDicCityCountry.SetEnabledUpdate( FCurManager > 0 );
  FrameDicCityCountry.SetManager( FCurManager );
  RefreshCountryInfo;

  FrameDicCityCountry.RefreshControls;

  if FrameDicListCity.ParamDicFormMain.MainElem<> nil then
    FrameDicListCity.SelfRefresh;
end;

procedure TFrmCountryCityEdit.RefreshControlsAction(Sender:TObject);
begin
  RefreshControls;
end;

procedure TFrmCountryCityEdit.TouristTemplateActionExecute;
var
  Cntry: String;
  St: Integer;
begin
  TouristTemplateNewForm := TTouristTemplateNewForm.Create(Application);
  with TouristTemplateNewForm do
  try
    Cntry := Elem_BrCountryQry.DB.FieldByName('NAME').asString;
    Caption := Format(Caption, [Cntry]);

    if Elem_ANKETTEMPQry.DBRecordCount = 0 then
      St := remStateAppend else St := remStateEdit;
    //ShowRecord(St);    я заремив
    if MayBeDeleted then Elem_ANKETTEMPQry.DB.Delete;
  finally
    Free;
  end;
end;

procedure TFrmCountryCityEdit.TouristTemplateBtnClick(Sender: TObject);
begin
  TouristTemplateActionExecute;
end;

procedure TFrmCountryCityEdit.FormDestroy(Sender: TObject);
begin
  FrameDicCityCountry.DeactiveDicCityFrame;
  FrameDicListCity.DestroyFrame;
  FrameDicBrCountry.DestroyFrame;
end;

procedure TFrmCountryCityEdit.FrameDicListCityButTranslateLngClick(
  Sender: TObject);
var CurrParamDic:TParamFormDict;
begin
  CurrParamDic := FrameDicListCity.ParamDicFormMain;
  CurrParamDic.lng.LngAddSql :=' ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE = 0 )  and (ID_MAIN_PARENT = '+Elem_City_Admin_UnitRegionQry.GetValueIdStr+')';

  FrameDicListCity.ParamDicFormMain := CurrParamDic ;
  FrameDicListCity.ButTranslateLngClick( Sender );
end;

end.
