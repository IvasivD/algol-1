unit UnitFrameSearchCity;

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
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,Core,UnitProc,
  cxGridCustomView, cxGrid, IBCustomDataSet, IBQuery, Buttons, cxTextEdit,
  dxSkinscxPCPainter, cxGridLevel, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  IBDatabase, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, UnitIBQuery,UnitAdoQuery,
  ADODB;

type
  //TOptShowFieldData = set of( OptFiedlCityName,OptFiedlProvinceName, OptFieldTownShip );
  //TOptSearchData = ( OptSearchDataFromBegin,OptSearchDataLike );
  TIdMainParent = record
     id:Variant;
     aType:Integer;
  end;

  TFunctAfterSearchCity = procedure ( aOwnerSearchFrame:TComponent; id:Variant; idMainParent : TIdMainParent );

  TMyExtLookupComboBox = class(TcxExtLookupComboBox)
    private
       procedure DoCloseUp; override;
  end;


  TFrameSearchCity = class(TFrame)
    CitySrc: TDataSource;
    GridRepositoryTypeDescript: TcxGridViewRepository;
    ViewCitySerach: TcxGridDBTableView;
    ViewCitySerachID: TcxGridDBColumn;
    ViewCitySerachNAME: TcxGridDBColumn;
    EdSearchCity: TcxTextEdit;
    PanelControl: TPanel;
    butOptSeacrh: TSpeedButton;
    butSearchCityGlobal: TSpeedButton;
    ViewCitySerachLNAMEPATH: TcxGridDBColumn;
    ViewCitySerachid_main_parent: TcxGridDBColumn;
    ViewCitySerachAtype: TcxGridDBColumn;
    ADOCity: TADOQuery;

    procedure butSearchCityGlobalClick(Sender: TObject);
    procedure butSearchCityGlobalMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure butSearchCityGlobalMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure ViewCitySerachCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure EdSearchCityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdSearchCityExit(Sender: TObject);
    procedure EdSearchCityPropertiesChange(Sender: TObject);
  private
    FMainSql:WideString;
    FAddSql :WideString;
    FOnChange :TNotifyEvent;
    FPopupEd : TcxExtLookupComboBox;
    FFieldKey :string;
    FFieldName:string;
    FFiedlIDMainParent:string;
    FFieldAType:String;
    //FOptShowFieldData : TOptShowFieldData ;
    FElemCoutry : TDBShema;
    FPopUpWidth : Integer;
    FElemCity   : TDBShema;
    FShowAdinUnit : Boolean;
    FDBParam:TConnectDBParam;
    //FOptSearhData :  TOptSearchData;
    FFunctionAfterSearch : TFunctAfterSearchCity;
    procedure FFindBySearchtext;
    procedure FFindById( IdValue:Variant );
    procedure FShowPopupGridView(Show:Boolean);
    //procedure FPrepareViewToShow( OptShowField: TOptShowFieldData; ShowHeader:Boolean );
    procedure FPrepareDBCity(DBParam:TConnectDBParam);
    function  FGetNamePathForId(id:String; DBParam:TConnectDBParam ):variant;
    procedure FDestroyDBCity;

    function  FGetSqlNamePath( id:String ):widestring;
    function  FGetMainSqlIB:widestring;
    function  FGetMainSqlADO:widestring;

    { Private declarations }
  public
    { Public declarations }
    procedure SetEnabled( En:boolean );
    procedure SetValue( EditValue:Variant );
    function  EditValue : Variant;
    function  EditName : String;
    function  IdMainParent:TIdMainParent;
    function  GetSelValueByFieldName( FieldName:String ) : Variant;
    function  GetNamePathForCurrId: Variant;
    procedure RefreshControls;
    procedure Prepare( ElemCoutry:TDBShema; ShowAdinUnit:Boolean; CanUpdate:Boolean; PopUpWidth:Integer;
                       FunctionAfterSearch:TFunctAfterSearchCity;
                       EditStyle:TcxEditStyle=nil; ViewStyle:TcxGridTableViewStyles=nil );

    procedure SetSubConditionSql( SubConditionSql:string );
    procedure SetOnChangeControl( Event:TnotifyEvent );
    procedure Clear;
    procedure DestroyFrame;            
  end;

implementation

{$R *.dfm}

procedure TFrameSearchCity.Prepare( ElemCoutry:TDBShema; ShowAdinUnit:Boolean; CanUpdate:Boolean; PopUpWidth:Integer;
                                    FunctionAfterSearch:TFunctAfterSearchCity;
                                    EditStyle:TcxEditStyle; ViewStyle:TcxGridTableViewStyles );
//var DBParam:TConnectDBParam;
begin
  FElemCoutry := ElemCoutry;

  FDBParam := FElemCoutry.DBGetParamConnect;
  //FOptShowFieldData := OptShowFieldData;
  FPopUpWidth := PopUpWidth;
  FFunctionAfterSearch := FunctionAfterSearch;

  FPopupEd := TMyExtLookupComboBox.Create(self);
  FFieldKey  := 'ID';
  FFieldName := 'NAME';
  FFiedlIDMainParent := 'ID_MAIN_PARENT';
  FFieldAType := 'ID_CITY_ADM_UNT_ITEMS_TYPE';
  FShowAdinUnit := ShowAdinUnit;

  FPopupEd.Parent := self;
  FPopupEd.SendToBack;
  FPopupEd.Left :=EdSearchCity.Left;
  FPopupEd.Top := EdSearchCity.Top;
  FPopupEd.Width := EdSearchCity.Width;
  FPopupEd.Height := EdSearchCity.Height;
  FPopupEd.Anchors := [akLeft,akTop,akRight];

  FPopupEd.Properties.DropDownSizeable := True;
  FPopupEd.Properties.DropDownRows := 24;

  if PopUpWidth<=0 then PopUpWidth := self.Width;
  FPopupEd.Properties.DropDownWidth := PopUpWidth;

  FPopupEd.Properties.View := ViewCitySerach;
  FPopupEd.Properties.KeyFieldNames := FFieldKey;
  FPopupEd.Properties.ListFieldItem := ViewCitySerach.GetColumnByFieldName( FFieldName );

  if EditStyle <> nil then EdSearchCity.Style := EditStyle;
  if ViewStyle <> nil then ViewCitySerach.Styles := ViewStyle;

  EdSearchCity.Enabled:= CanUpdate;
  PanelControl.Visible := CanUpdate;
  if PanelControl.Visible then
    EdSearchCity.Width := self.Width - PanelControl.Width
  else EdSearchCity.Width := self.Width;

  if not CanUpdate then
    EdSearchCity.StyleFocused:=EdSearchCity.StyleDisabled
  else EdSearchCity.StyleFocused:=EdSearchCity.Style;

  FAddSql := '';

  FOnChange := nil;
  //FCountryId := CountryId;

  FPrepareDBCity( FDBParam );

  {IBDatabase.Connected:=False;
  IBDatabase.DatabaseName := DBParam.PathDB;
  IBDatabase.Params.Values['password'] := DBParam.Password;
  IBDatabase.Params.Values['user_name'] := DBParam.UID;
  IBDatabase.Connected:=True; }

  FElemCity.DBClose;
  //CityQry.ParamByName('countryid').Value:= CountryId;

  //( FOptShowFieldData, True );
end;

function TFrameSearchCity.FGetSqlNamePath( id:String ):widestring;
begin
  result:=' select  '+
   ' CASE ' +
   '    when ( CITY_ADM_UNIT.id_main_parent > 0 ) then ( Select FIRST 1 NAME FROM CITY_PATH_PROC( CITY_ADM_UNIT.ID_PARENT , null,0,448 ) ) '+
   '    else  ( select name from CITY_ADM_UNT_ITEMS_TYPE where id_parent_fortree = CITY_ADM_UNIT.id_main_parent ) '+
   ' END NAMEPATH '+
  ' from CITY_ADM_UNIT where CITY_ADM_UNIT.ID = ' + id;
end;

function TFrameSearchCity.FGetMainSqlIB : widestring;
var ExtSql : WideString;
begin
  if not FShowAdinUnit then ExtSql :=' and ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  <> 1 )'
  else ExtSql := '';

  //' ( Select FIRST 1 NAME FROM CITY_PATH_PROC( CITY_ADM_UNIT.id, null ) ) NAMEPATH, ' +
  result := ' select CITY_ADM_UNIT.ID, CITY_ADM_UNIT.id_main_parent, CITY_ADM_UNIT.NAME, '+
            ' ( Select FIRST 1 NAME FROM CITY_PATH_PROC( CITY_ADM_UNIT.id, null, 0,448 ) ) NAMEPATH, ' +
            //'  CASE '+
            //' when ( CITY_ADM_UNIT.id_main_parent > 0 ) then ( Select FIRST 1 NAME FROM CITY_PATH_PROC( CITY_ADM_UNIT.ID_PARENT , null ) ) '+
            //' else  ( select name from CITY_ADM_UNT_ITEMS_TYPE where id_parent_fortree = CITY_ADM_UNIT.id_main_parent ) '+
            //' END NAMEPATH, '+
            ' ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE '+
            ' from CITY_ADM_UNIT left join ADMIN_UNIT on CITY_ADM_UNIT.id_admin_unit = ADMIN_UNIT.id where (ID_COUNTRY = :ID_COUNTRY) '+ExtSql;
end;

function TFrameSearchCity.FGetMainSqlADO:widestring;
begin
  // to be Continue
end;

procedure TFrameSearchCity.SetSubConditionSql( SubConditionSql:string );
begin
  FAddSql := SubConditionSql;
end;

procedure TFrameSearchCity.SetOnChangeControl( Event:TnotifyEvent );
begin
  FOnChange := Event;
end;

procedure TFrameSearchCity.FPrepareDBCity( DBParam:TConnectDBParam );
var CityQry : TDataset;
begin
  if DBParam.IBDatabaseConnection <> nil then
  begin
    FMainSql := FGetMainSqlIB;
    CityQry := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, FMainSql );
  end
  else
  if DBParam.TypeConnect = optTypeConADO then
  begin
    FMainSql := FGetMainSqlADO;
    CityQry := UnitAdoQuery.CreateDataSet( DBParam.ADOConnection, FMainSql );
  end;

  CityQry.Tag := -1;  
  CitySrc.DataSet := CityQry;

  FElemCity := TDBShema.Create(CityQry,'','ID','','');
end;

function TFrameSearchCity.FGetNamePathForId(id:String; DBParam:TConnectDBParam ):variant;
begin
  if DBParam.IBDatabaseConnection <> nil then
    Result := UnitIBQuery.GetValueDB( DBParam.PathDB, DBParam.UID, DBParam.Password, FGetSqlNamePath(id) )
  else
  if DBParam.TypeConnect = optTypeConADO then
   Result := UnitADOQuery.GetValueDB( DBParam.ADOConnection, FGetSqlNamePath(id) )
end;

procedure TFrameSearchCity.FDestroyDBCity;
begin
  CitySrc.DataSet := nil;
  FElemCity.Close;
end;

{procedure TFrameSearchCity.FPrepareViewToShow( OptShowField: TOptShowFieldData; ShowHeader:Boolean );
begin
  //ViewCitySerach.GetColumnByFieldName('NAME').Visible := OptFiedlCityName in FOptShowFieldData;
  //ViewCitySerach.GetColumnByFieldName('NAMEPATH').Visible := OptFiedlCityName in FOptShowFieldData;
  //ViewCitySerach.GetColumnByFieldName('PROVINCE').Visible := OptFiedlProvinceName in FOptShowFieldData;
  //ViewCitySerach.GetColumnByFieldName('TOWNSHIP').Visible := OptFieldTownShip in FOptShowFieldData;

  ViewCitySerach.OptionsView.Header := ShowHeader;
end;}

procedure TFrameSearchCity.FFindBySearchtext;
var StrSearch:string;
begin
  if Trim(EdSearchCity.Text)='' Then Exit;
  if not butOptSeacrh.Down then StrSearch := ''''+AnsiLowerCase( Trim( EdSearchCity.Text ) )+'%'''
  else StrSearch := ''''+'%'+AnsiLowerCase( Trim( EdSearchCity.Text ) )+'%''';

  FElemCity.DBClose;
  FElemCity.DBQueryChangeSql( FMainSql + FAddSql+ 'and LOCASE(CITY_ADM_UNIT.name) like '+StrSearch, False );
  FElemCity.DBQuerySetParamValue( 'ID_COUNTRY', FElemCoutry.GetValueId );
  FElemCity.DBOpen;
end;

procedure TFrameSearchCity.Clear;
begin
  EdSearchCity.EditValue := null;
  FElemCity.DBClose;
end;

procedure TFrameSearchCity.FFindById( IdValue:Variant );
begin
  FElemCity.DBClose;
  if IdValue <> null then
  begin
    FElemCity.DBQueryChangeSql( FMainSql + FAddSql+ ' and CITY_ADM_UNIT.ID = '+VarToStr( IdValue ), False );
    FElemCity.DBQuerySetParamValue( 'ID_COUNTRY', FElemCoutry.GetValueId );
    FElemCity.DBOpen;
  end;
end;

procedure TFrameSearchCity.FShowPopupGridView( Show:Boolean );
begin
  FPopupEd.Properties.DropDownHeight := 200;
  FPopupEd.DroppedDown := Show;
  butSearchCityGlobal.Down := Show;
end;

procedure TFrameSearchCity.RefreshControls;
begin
  FShowPopupGridView( butSearchCityGlobal.Down );
end;
{ TmyCxPopUpEdit }

procedure TMyExtLookupComboBox.DoCloseUp;
begin
  inherited;
  TFrameSearchCity(self.Owner).butSearchCityGlobal.Tag := -1;
  TFrameSearchCity(self.Owner).butSearchCityGlobal.Down := False;

  if TFrameSearchCity(self.Owner).FPopupEd.EditText <> ''  then
    TFrameSearchCity(self.Owner).EdSearchCity.Text := TFrameSearchCity(self.Owner).FPopupEd.EditText;
  TFrameSearchCity(self.Owner).EdSearchCity.SetFocus;


  if @TFrameSearchCity(self.Owner).FFunctionAfterSearch <> nil then
    TFrameSearchCity(self.Owner).FFunctionAfterSearch( self.Owner, TFrameSearchCity(self.Owner).EditValue, TFrameSearchCity(self.Owner).IdMainParent );

  if @TFrameSearchCity(self.Owner).FOnChange <> nil then
    TFrameSearchCity(self.Owner).FOnChange( self );
end;

procedure TFrameSearchCity.SetValue( EditValue:Variant  );
begin
  FFindById( EditValue );
  self.FPopupEd.EditValue :=EditValue ;
  EdSearchCity.Text := self.FPopupEd.EditText;
  //self.FPopupEd.Text := EditName;
  //EdSearchCity.Text := EditName;
end;

procedure TFrameSearchCity.butSearchCityGlobalClick(Sender: TObject);
begin
  if butSearchCityGlobal.Down then
  begin
    FFindBySearchtext;
    FShowPopupGridView( True );
  end
  else
    FShowPopupGridView( False );
end;

function TFrameSearchCity.EditValue:Variant;
begin
  result := self.FPopupEd.EditValue;
end;

function TFrameSearchCity.IdMainParent:TIdMainParent;
begin
  if self.EditValue <> null then
  begin
    if CitySrc.DataSet.Locate( FFieldKey, self.EditValue ,[] ) then
    begin
      result.id := CitySrc.DataSet.fieldByName( FFiedlIDMainParent ).Value;   // atype
      result.aType := CitySrc.DataSet.fieldByName( FFieldAType ).asInteger;
    end
  end
  else result.id := null;
end;


function TFrameSearchCity.EditName:String;
begin
  Result := self.FPopupEd.Text;
end;

procedure TFrameSearchCity.butSearchCityGlobalMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if butSearchCityGlobal.Tag = -1 then
  begin
    butSearchCityGlobal.Tag := 0;
    Abort;
  end;
end;

procedure TFrameSearchCity.butSearchCityGlobalMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  butSearchCityGlobal.Tag:=0;
end;

procedure TFrameSearchCity.ViewCitySerachCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  EdSearchCity.Text := EditName;
  FPopupEd.Text := EditName;
  FShowPopupGridView( False );
end;

procedure TFrameSearchCity.EdSearchCityKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_Return) then
  begin
    FFindBySearchtext;
    FShowPopupGridView( True );
  end
  else
  if ( (ssShift in Shift) and( Key = 40 ) ) then
    FShowPopupGridView( True );
end;

procedure TFrameSearchCity.EdSearchCityExit(Sender: TObject);
begin
  if not self.FPopupEd.DroppedDown then
    EdSearchCity.Text := self.FPopupEd.Text
end;

procedure TFrameSearchCity.EdSearchCityPropertiesChange(Sender: TObject);
begin
  if EdSearchCity.Text ='' then
    FPopupEd.EditValue := null;
  if @FOnChange <> nil then FOnChange( sender );
end;

function TFrameSearchCity.GetSelValueByFieldName(FieldName: String): Variant;
begin
  if ( self.EditValue <> null ) and ( FElemCity.DB.Active ) then
  begin
    if FElemCity.DB.Locate(self.FPopupEd.Properties.KeyFieldNames,self.EditValue,[]) then
      result := FElemCity.DB.fieldByName(FieldName).Value
    else result:= null;
  end
  else result:= null;
end;

function TFrameSearchCity.GetNamePathForCurrId: Variant;
begin
  if self.EditValue <> null then
    result := FGetNamePathForId( VarToStr( self.EditValue), FDBParam )
  else result := null;
end;

procedure TFrameSearchCity.DestroyFrame;
begin
  FDestroyDBCity;
end;

procedure TFrameSearchCity.SetEnabled(En: boolean);
begin
 self.EdSearchCity.Enabled := En;
 self.butSearchCityGlobal.Enabled := En;
 self.butOptSeacrh.Enabled := En;
end;

end.
