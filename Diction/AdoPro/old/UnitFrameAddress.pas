unit UnitFrameAddress;

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
  cxCheckBox, cxTextEdit, Buttons, cxMaskEdit, cxDropDownEdit,cxStyles,cxGridTableView,
  UnitIBQuery,UnitADOQuery,DB,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, StdCtrls,Core, UnitProc,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxGridCustomView,
  cxGrid, IBCustomDataSet, ADODB, IBQuery, Grids, DBGrids,
  UnitFrameSearchCity;

type
  TParamApartment = ( opParamOffice, opParamApartment );

  TParamAddres = record
    ElemCountry:TDBShema;
    ElemAddres:TDBShema;
    FieldNameCountryId:String;
    //FieldNamePROVINCEId:string;
    //FieldNameTownshipId:string;
    FieldNameCityId:string;
    FieldNamePostIndex:string;
    FieldNameStreetKindId:string;
    FieldNameStreet:string;
    FieldNameAddres:string;
    FieldNameBuilding:string;
    FieldNameOfficeNull:string;
    FieldNameOffice:string;
  end;

  {TParamAddres = record
    CounrtyId:Variant;
    AreaProvinceId:Variant;
    RayonId :Variant;
    CityId:Variant;
    
    PostIndex:WideString;
    RayounText:WideString;
    BuildingN:WideString;
    OfficeN:Widestring;
  end; }

  TDBDat = record
    DB:TDataset;
    DS:TDataSource;
  end;


  TFrAddress = class(TFrame)
    Label1: TLabel;
    ExtLupComboboxCountry: TcxExtLookupComboBox;
    butSearchAllTownShips: TSpeedButton;
    Label2: TLabel;
    EdPostIndex: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdRayon: TcxTextEdit;
    Label5: TLabel;
    EdBuilding: TcxTextEdit;
    ChOffice: TcxCheckBox;
    EdOffice: TcxTextEdit;
    ExtLupComboboxStreetKind: TcxExtLookupComboBox;
    ViewRepository: TcxGridViewRepository;
    ViewContryList: TcxGridDBTableView;
    ViewContryListCOUNTRYID: TcxGridDBColumn;
    ViewContryListNAME: TcxGridDBColumn;
    ViewProvinciesList: TcxGridDBTableView;
    ViewProvinciesListPROVINCEID: TcxGridDBColumn;
    ViewProvinciesListCOUNTRYID: TcxGridDBColumn;
    ViewProvinciesListNAME: TcxGridDBColumn;
    ViewTownShipsList: TcxGridDBTableView;
    ViewTownShipsListTOWNSHIPID: TcxGridDBColumn;
    ViewTownShipsListNAME: TcxGridDBColumn;
    ViewTownShipsListPROVINCEID: TcxGridDBColumn;
    ViewTownShipsListCOUNTRYID: TcxGridDBColumn;
    ViewKindStreetList: TcxGridDBTableView;
    ViewKindStreetListID: TcxGridDBColumn;
    ViewKindStreetListNAME: TcxGridDBColumn;
    ViewKindStreetListAORDER: TcxGridDBColumn;
    CmBoxStreet: TcxComboBox;
    ViewCitiesList: TcxGridDBTableView;
    ViewCitiesListCOUNTRYID: TcxGridDBColumn;
    ViewCitiesListCITYID: TcxGridDBColumn;
    ViewCitiesListColumnCITINAME: TcxGridDBColumn;
    ViewCitiesListprovincesNAME: TcxGridDBColumn;
    ViewCitiesListtownshipsNAME: TcxGridDBColumn;
    ViewCitiesListprovinceid: TcxGridDBColumn;
    ViewCitiesListtownshipid: TcxGridDBColumn;
    Label6: TLabel;
    FrameSearchCityAddres: TFrameSearchCity;
    procedure ExtLupComboboxCountryPropertiesChange(Sender: TObject);
    procedure EdRayonPropertiesChange(Sender: TObject);
    procedure ChOfficePropertiesChange(Sender: TObject);
    procedure CmBoxStreetPropertiesChange(Sender: TObject);
  private
    { Private declarations }
     FElem_BrCountryQry: TDBShemaView;
     FElem_KindStreetQry : TDBShemaView;

     FDBDatCountry:TDBDat;
     FDBDatKindStreet:TDBDat;
     FPrepareShow:Boolean;

     procedure FSaveHistory;
     procedure FDeactiveElement(aElem:TDBShemaView);
     Function  FPreapareDB( ConParam:TConnectDBParam;Sql:Widestring; Active:boolean=True; MainDS:TDataSource=nil; MainField:string='' ):TDBDat;
     procedure FPrepareControls( CanUpdate:Boolean; ParamApartment :TParamApartment );
  public

    { Public declarations }
    function  CheckError(ShowErrorMes:Boolean):Boolean;
    procedure SaveDataControls( isNew:Boolean; ParamAddres:TParamAddres );
    procedure PrepareDataControls( isNew:Boolean; ParamAddres:TParamAddres );
    procedure RefreshControls;
    procedure Prepare( ConParam:TConnectDBParam; CanUpdate: Boolean;
                       ParamApartment :TParamApartment;
                       EditStyle: TcxEditStyle=nil;
                       ViewStyle: TcxGridTableViewStyleSheet=nil );
    procedure Deactive;
  end;

implementation


{$R *.dfm}

{ TFrAddress }

Function TFrAddress.FPreapareDB( ConParam:TConnectDBParam;Sql:Widestring; Active:boolean=True; MainDS:TDataSource=nil; MainField:string='' ):TDBDat;
begin
  if ConParam.IBDatabaseConnection <> nil then
  begin
    result.DB := UnitIBQuery.CreateDataSet( ConParam.PathDB,ConParam.UID,ConParam.Password, Sql, Active );
    TIBQuery(result.DB).DataSource := MainDS;
  end
  else
    if ConParam.ADOConnection <> nil then
    begin
      result.DB := UnitADOQuery.CreateDataSet( ConParam.ADOConnection, Sql , cmdText, Active);
      TADODataSet( result.DB ).DataSource := MainDS;
    end;

  if result.DB <> nil then
  begin
    Result.DS := TDataSource.Create(self);
    Result.DS.DataSet :=result.DB;
  end;
end;

procedure TFrAddress.FDeactiveElement(aElem:TDBShemaView);
var aDB:TDataSet;
begin
  aDB:= aElem.DB;
  aElem.Close;

  DestroyDB( aDB );
end;

procedure AfterCitySearch( aOwnerSearchFrame:TComponent; id:Variant; idMainParent : TIdMainParent );
begin

end;

procedure TFrAddress.FPrepareControls( CanUpdate:Boolean; ParamApartment :TParamApartment );
begin
  SetPropInCxExtLookupComboBox( ExtLupComboboxCountry, TcxGridDBTableView( FElem_BrCountryQry.ViewList), 'NAME',FElem_BrCountryQry.FieldKod,CanUpdate,false );
  SetPropInCxExtLookupComboBox( ExtLupComboboxStreetKind, TcxGridDBTableView( FElem_KindStreetQry.ViewList), 'NAME',FElem_KindStreetQry.FieldKod,CanUpdate,false );

  FrameSearchCityAddres.Prepare(FElem_BrCountryQry, False, CanUpdate, FrameSearchCityAddres.Width + 250 ,AfterCitySearch, nil , TcxGRidDBTableView(FElem_BrCountryQry.ViewList).Styles );

  if ParamApartment = opParamOffice then ChOffice.Caption :='оф.';
  if ParamApartment = opParamApartment then ChOffice.Caption :='кв.';

end;

procedure TFrAddress.Prepare( ConParam:TConnectDBParam; CanUpdate: Boolean;
                              ParamApartment :TParamApartment;
                              EditStyle: TcxEditStyle=nil;
                              ViewStyle: TcxGridTableViewStyleSheet=nil );

var arrFields:TArrFieldsParam;
begin
  FPrepareShow := True;

  FDBDatCountry  := FPreapareDB( ConParam, 'select countryid,  NAME  from COUNTRIES' );
  FDBDatKindStreet :=FPreapareDB( ConParam, 'select * from KINDSTREET ');

  FElem_BrCountryQry := TDBShemaView.Create( FDBDatCountry.DB, nil, 'COUNTRIES', 'COUNTRYID', 'countries_gen' );
  FElem_BrCountryQry.ViewList := ViewContryList;
  ViewContryList.Styles.StyleSheet := ViewStyle;
  FElem_BrCountryQry.DS := FDBDatCountry.DS;
  TcxGridDBTableView(FElem_BrCountryQry.ViewList).DataController.DataSource := FDBDatCountry.DS;
  TcxGridDBTableView(FElem_BrCountryQry.ViewList).DataController.KeyFieldNames := FElem_BrCountryQry.FieldKod;

  FElem_KindStreetQry := TDBShemaView.Create( FDBDatKindStreet.DB, nil, 'KINDSTREET', 'ID', 'gen_kindstreet_id' );
  FElem_KindStreetQry.ViewList := ViewKindStreetList;
  ViewKindStreetList.Styles.StyleSheet := ViewStyle;
  FElem_KindStreetQry.DS := FDBDatKindStreet.DS;

  TcxGridDBTableView(FElem_KindStreetQry.ViewList).DataController.DataSource := FElem_KindStreetQry.DS;
  TcxGridDBTableView(FElem_KindStreetQry.ViewList).DataController.KeyFieldNames := FElem_KindStreetQry.FieldKod;

  FPrepareControls( CanUpdate,ParamApartment );

  FElem_BrCountryQry.DBOpen;
  FElem_KindStreetQry.DBOpen;
  FPrepareShow := False;
end;

procedure TFrAddress.PrepareDataControls( isNew:Boolean; ParamAddres:TParamAddres );
var aElem:TDBShema;
begin
  try
    FPrepareShow := True;
    aElem :=ParamAddres.ElemAddres;
    if not isNew then
    begin
      ExtLupComboboxCountry.EditValue := aElem.DB.FieldByName( ParamAddres.FieldNameCountryId ).Value;
      FrameSearchCityAddres.SetValue( aElem.DB.FieldByName( ParamAddres.FieldNameCityId ).Value );

      ExtLupComboboxStreetKind.EditValue := aElem.DB.FieldByName( ParamAddres.FieldNameStreetKindId ).Value;
      CmBoxStreet.EditValue := aElem.DB.FieldByName( ParamAddres.FieldNameStreet ).Value;
      EdPostIndex.EditValue := aElem.DB.FieldByName( ParamAddres.FieldNamePostIndex ).Value;
      EdBuilding.EditValue := aElem.DB.FieldByName( ParamAddres.FieldNameBuilding ).Value;
      EdOffice.Text := aElem.DB.FieldByName( ParamAddres.FieldNameOffice ).asString;
      ChOffice.Checked := aElem.DB.FieldByName( ParamAddres.FieldNameOfficeNull ).AsBoolean;

    end
    else
    begin
      ExtLupComboboxCountry.EditValue := null;
      FrameSearchCityAddres.SetValue(null);
      ExtLupComboboxStreetKind.EditValue := null;
      CmBoxStreet.Text :='';
      EdPostIndex.Text :='';
      EdBuilding.Text  :='';
      ChOffice.Checked :=false;
    end;
  finally
    FPrepareShow := False;
  end;

  RefreshControls;
end;

procedure TFrAddress.SaveDataControls( isNew:Boolean; ParamAddres:TParamAddres );
var aElem:TDBShema;
begin
  aElem :=ParamAddres.ElemAddres;
  if not isNew then ParamAddres.ElemAddres.DB.Edit
  else ParamAddres.ElemAddres.DB.Insert;

  aElem.DB.FieldByName( ParamAddres.FieldNameCountryId ).Value := ExtLupComboboxCountry.EditValue;
  aElem.DB.FieldByName( ParamAddres.FieldNameCityId ).Value := FrameSearchCityAddres.EditValue;

  aElem.DB.FieldByName( ParamAddres.FieldNameStreetKindId ).Value := ExtLupComboboxStreetKind.EditValue;
  aElem.DB.FieldByName( ParamAddres.FieldNameStreet ).Value := CmBoxStreet.EditValue;
  aElem.DB.FieldByName( ParamAddres.FieldNamePostIndex ).Value := EdPostIndex.EditValue ;
  aElem.DB.FieldByName( ParamAddres.FieldNameBuilding ).Value := EdBuilding.EditValue;
  aElem.DB.FieldByName( ParamAddres.FieldNameOffice ).asString := EdOffice.Text;
  aElem.DB.FieldByName( ParamAddres.FieldNameOfficeNull ).AsBoolean := ChOffice.Checked ;
end;

procedure TFrAddress.FSaveHistory;
begin

end;

procedure TFrAddress.Deactive;
begin
  FSaveHistory;
  FDeactiveElement( FElem_BrCountryQry );
  FDeactiveElement( FElem_KindStreetQry );
end;

procedure TFrAddress.RefreshControls;
begin
  if FPrepareShow then Exit;

  FrameSearchCityAddres.Enabled := ExtLupComboboxCountry.EditValue <> null;
  
  ExtLupComboboxStreetKind.Enabled := ExtLupComboboxCountry.EditValue <> null and FrameSearchCityAddres.Enabled;
  CmBoxStreet.Enabled := ExtLupComboboxCountry.EditValue <> null and ExtLupComboboxStreetKind.Enabled;
  EdBuilding.Enabled := (ExtLupComboboxCountry.EditValue <> null) and (CmBoxStreet.Enabled);
  EdOffice.Enabled := ChOffice.Checked;
end;

procedure TFrAddress.ExtLupComboboxCountryPropertiesChange(
  Sender: TObject);
begin
  if FPrepareShow then Exit;

  if not TcxExtLookupComboBox(Sender).Focused then Exit;
  RefreshControls;
end;

procedure TFrAddress.EdRayonPropertiesChange(Sender: TObject);
begin
  if FPrepareShow then Exit;

  if not TcxExtLookupComboBox(Sender).Focused then Exit;
  RefreshControls;
end;

procedure TFrAddress.ChOfficePropertiesChange(Sender: TObject);
begin
  if FPrepareShow then Exit;

  RefreshControls;
end;

procedure TFrAddress.CmBoxStreetPropertiesChange(Sender: TObject);
begin
  if FPrepareShow then Exit;

  if not TcxExtLookupComboBox(Sender).Focused then Exit;
  RefreshControls;
end;

function TFrAddress.CheckError( ShowErrorMes:Boolean ):Boolean;
var MessEr:WideString;
begin
  MessEr :='';

  if ExtLupComboboxCountry.EditValue = null then
     MessEr := '¬каж≥ть крањну';
  if FrameSearchCityAddres.EditValue = null then
     MessEr := '¬каж≥ть населений пункт';
  if ExtLupComboboxStreetKind.EditValue = null then
     MessEr := '¬каж≥ть тип м≥сцевосц≥';
  if CmBoxStreet.Text = '' then
     MessEr := '¬каж≥ть м≥сцев≥сть';
  if EdBuilding.Text = '' then
     MessEr := '¬каж≥ть номер будинку';
  if (ChOffice.Checked )and(EdOffice.Text='') then
     MessEr := '¬каж≥ть оф≥с';

  Result :=  MessEr = '';
  if ( MessEr <> '' ) and ( ShowErrorMes )  then
    MyShowMessageDlg( MessEr, mtError, but_OK );

end;

end.

 ExtLupComboboxCity
  if FPrepareShow then Exit;

  if not TcxExtLookupComboBox(Sender).Focused then Exit;
  RefreshControls;

