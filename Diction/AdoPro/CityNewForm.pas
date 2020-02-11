unit CityNewForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdActns, ActnList, Menus, DB, StdCtrls, Buttons,
  Grids, ComCtrls, ExtCtrls, DBTables, IBDatabase,
  IBCustomDataSet, IBQuery, Mask, DBCtrls, AzComboBox, StrUtils,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCheckBox, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMemo, UnitHookControlChangeValue,UnitProc,
  UnitSelParentObj, UnitFrameSelParentObj, core, UnitFrameKindType,
  cxGroupBox, UnitFramePhotoList,UnitFrameUpdateImages, UnitUpdateImages,
  ADODB, UnitFrameSearchCity, UnitEditText, DBGrids,ServModDic ;

type
  TParamCountyAdminUnit = record
    ElemCountry : TDBShemaView;
    ElemCityAdmUnit : TDBShemaView;
    FolderName  : WideString;
    TypeObj     :Integer;
  end;

  TParamEdiInfoCity = record
    ElemCityAdmUntItemsType :TDBShemaView;
    ElemCITYADMUNITINFOQry :TDBShemaView;
    ElemAdminUnitQry  :TDBShemaView;
    ElemAdminUnitSubQry  :TDBShemaView;
    ElemAdminUnitSubRelQry  :TDBShema;
    ElemCity        : TDBShema;
    ElemCountry     : TDBShemaView;
    ElemCityIMG     : TDBShemaView;
    TypeAdminUnit   : variant;
    PathToImageCity : Widestring;
    PathToHtmlCity  : Widestring;
  end;

  TRecCityDataInfo = record
   id:Variant;
   ID_CITY_ADM_UNIT_TYPE_INFO:Variant;
   name :WideString;
   aValue:WideString;
  end;
  TRecCityDataInfoArr = array of TRecCityDataInfo;

  TCityEditNewForm = class(TForm)
    WorkPanel: TPanel;
    PhoneCodeLabel: TLabel;
    TimeBiasLabel: TLabel;
    TimeBiasLabel2: TLabel;
    TimeBiasGrnLabel: TLabel;
    InfoPageControl: TPageControl;
    TabObj: TTabSheet;
    TabMainObj: TTabSheet;
    Label4: TLabel;
    StatisticTabSheet: TTabSheet;
    PopulationLabel: TLabel;
    PopulationDateLabel: TLabel;
    PopulationYearLabel: TLabel;
    ClimateTabSheet: TTabSheet;
    TemperatureLabel: TLabel;
    SunnydaysLabel: TLabel;
    TemperatureGrid: TStringGrid;
    CtrlPanel: TPanel;
    ButShowLog: TSpeedButton;
    CancelBtn: TBitBtn;
    EdPhoneCode: TcxTextEdit;
    TimeBias: TcxTextEdit;
    PopulationEdit: TcxTextEdit;
    PopulationDate: TcxTextEdit;
    SunnydaysEdit: TcxTextEdit;
    ShowWebCheckBox: TcxCheckBox;
    NameLabel: TLabel;
    ButCountryLng: TSpeedButton;
    ParentObjDBGridDBTableView1: TcxGridDBTableView;
    ParentObjDBGridLevel1: TcxGridLevel;
    ParentObjDBGrid: TcxGrid;
    NameEdit: TcxTextEdit;
    BtnSaveData: TBitBtn;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewObjCityOn: TcxGridDBTableView;
    ViewObjTerritoriesOn: TcxGridDBTableView;
    ChildObjDBGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    FramePhotoList: TFramePhotoList;
    GroupBoxMemo: TcxGroupBox;
    MemoDescript: TcxMemo;
    CITY_ADM_UNIT_LINKS: TADOQuery;
    CITY_ADM_UNIT_LINKSSrc: TDataSource;
    butAddSeObject: TSpeedButton;
    butDelSeObject: TSpeedButton;
    FrameSearchCityObj: TFrameSearchCity;
    CITY_ADM_UNIT_LINKSID: TIntegerField;
    CITY_ADM_UNIT_LINKSID_CITY_ADM_UNIT: TIntegerField;
    CITY_ADM_UNIT_LINKSID_OBJ_CITY_ADM_UNIT: TIntegerField;
    ViewObjCityOnID: TcxGridDBColumn;
    ViewObjCityOnID_CITY_ADM_UNIT: TcxGridDBColumn;
    ViewObjCityOnID_OBJ_CITY_ADM_UNIT: TcxGridDBColumn;
    CITY_ADM_UNIT_LINKSNAME: TStringField;
    ViewObjCityOnNAME: TcxGridDBColumn;
    CITY_ADM_UNIT_LINKS_ON_Terytory: TADOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField1: TStringField;
    CITY_ADM_UNIT_LINKS_ON_TerytorySrc: TDataSource;
    ViewObjTerritoriesOnID: TcxGridDBColumn;
    ViewObjTerritoriesOnID_CITY_ADM_UNIT: TcxGridDBColumn;
    ViewObjTerritoriesOnID_OBJ_CITY_ADM_UNIT: TcxGridDBColumn;
    ViewObjTerritoriesOnNAME: TcxGridDBColumn;
    butEditMemo: TSpeedButton;
    FrameKindTypeAdminCity: TFrameKindType;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    
    procedure TemperatureGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ButCountryLngClick(Sender: TObject);
    procedure ButShowLogClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure PopulationEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure TimeBiasPropertiesChange(Sender: TObject);
    procedure butAddSeObjectClick(Sender: TObject);
    procedure butDelSeObjectClick(Sender: TObject);
    procedure butEditMemoClick(Sender: TObject);
  private
    //FisNew:Boolean;
    FParentCityRegion : Variant;
    FAddParam : TOptAddTreeNode;
    FCanUpdate:Boolean;
    FHookControlChangeValue : THookControlChangeValue;
    FParamElem              : TParamEdiInfoCity;
    FCurManager             : Integer;
    Elem_CITY_ADM_UNIT_LINKS : TDBShemaView;
    Elem_CITY_ADM_UNIT_LINKS_ON_Terytory : TDBShemaView;
    function  FIsNew:Boolean;
    procedure FRefreshControls;
    procedure FRefreshChangeControl(Sender: TObject);
    function  FGetPathImage : Widestring;
    function  FGetViewFieldImgUpdPrperty:TViewFieldImgUpd;
    function  CheckTemperature: Boolean;
   // procedure LoadTemperature;
    procedure FShowData( AddParam:TOptAddTreeNode );
    procedure FAddCity( FAddParam : TOptAddTreeNode; ParentCityRegion:variant );
    Function  FSaveData:Boolean;
    function  FCheckError( ShowErrorMes:Boolean = true ):Boolean;
    procedure FShowDataInf(aData:TRecCityDataInfoArr);
    procedure FAddValueCityInfo( IdTypeInfo:Variant; aValue :Variant );
    Procedure FShowUdateImageFor;
    procedure FAddObjLink( IdObjCityUnitAdmin:Variant );
  protected
    procedure PrepareDataFields;
    procedure SearchInputError;
    procedure FPrepare(  AddParam:TOptAddTreeNode );
    procedure FPrepareControls;
    procedure FPrepareFilterObjects;
    function  FGetParamImg:TViewFieldImgUpd;
  public
    procedure InitElements( MainElem:TDBShema );
    procedure CloseElem;
  end;
 procedure ShowEditCity( paramUpdateCity: TParamEdiInfoCity; AddParam:TOptAddTreeNode; aParentCityRegion:Variant; aCanUpdate:Boolean; CurManager:Integer );
 procedure PrepareFilterParentObjects( aView: TcxGridDBTableView );
 procedure ReadDataCityInf( ElemCityInfAdmUnitInf:TDBShemaView; var aData:TRecCityDataInfoArr );
var
  CityEditNewForm: TCityEditNewForm;

implementation

uses DateUtils,  TourConsts,
  OptSet, OrderUn,  ServModIB, UnitLngTranslateEdit ;
{$R *.dfm}
const
  nTemperatureCount = 3;
  nTemperatureDay = 1;
  nTemperatureNight = 2;
  nTemperatureWater = 3;
  sCityName = 'Вибір міста, яке входить до складу міста "%s"';

procedure ShowEditCity( paramUpdateCity: TParamEdiInfoCity; AddParam:TOptAddTreeNode; aParentCityRegion:Variant; aCanUpdate:Boolean; CurManager:Integer );
begin
 try
   Application.CreateForm( TCityEditNewForm, CityEditNewForm );

   CityEditNewForm.FParamElem := paramUpdateCity;
   CityEditNewForm.FAddParam  := AddParam;
   CityEditNewForm.FParentCityRegion :=aParentCityRegion;

   CityEditNewForm.FCurManager := CurManager;
   CityEditNewForm.FCanUpdate := aCanUpdate;
   CityEditNewForm.FPrepare( AddParam );
   if CityEditNewForm.ShowModal = mrOk then
     CityEditNewForm.FParamElem.ElemCity.RequeryCurrentRecord;

 finally
    CityEditNewForm.Free;
 end;

end;

procedure ScatterTemperatureValue(const Value: String; Values: TStrings);
var
  Idx, Pos, I: Integer;
  Val: String;
begin
  Pos := 1;
  Idx := 1;
  with Values do for I := 1 to Count - 1 do Strings[I] := '';
  while Pos <= Length(Value) do
  begin
    Val := ExtractFieldName(Value, Pos);
    if Val = '*' then Val := '';
    Values[Idx] := Val;
    Inc(Idx);
    if Idx > 12 then Break;
  end;
end;

function GatherTemperatureValue(Values: TStrings): String;
var Val: String;
    Emp: Boolean;
    I: Integer;
begin
  Result := '';
  Emp := True;
  with Values do
    for I := 1 to Count - 1 do
    begin
      if I > 12 then Break;
      Val := Strings[I];
      if Val = '' then Val := '*'
      else if Val[1] in ['0'..'9'] then Val := '+' + Val;
      Result := Result + Val + ';';
      if Val <> '*' then Emp := False;
    end;
  if Emp then Result := ''
  else if Length(Result) > 0 then System.Delete(Result, Length(Result), 1);
end;

{ TCityEditNewForm }
function TCityEditNewForm.CheckTemperature: Boolean;
var
  I, J, T: Integer;
  S: String;
begin
  Result := True;
  with TemperatureGrid do
    for J := 1 to RowCount - 1 do
    begin
      for I := 1 to ColCount - 1 do
      begin
        S := Cells[I, J];
        if S <> '' then
          try
            if S[1] = '+' then System.Delete(S, 1, 1);
            T := StrToInt(S);
            Result := (T > -80) and (T < 70);
          except
            Result := False;
          end;
        if not Result then
        begin
          Col := I;
          Row := J;
          Break;
        end;
      end;
      if not Result then Break;
    end;
  if not Result then
  begin
    InfoPageControl.ActivePage := ClimateTabSheet;
    ActiveControl := TemperatureGrid;
    with TemperatureGrid do
      MyShowMessageDlg(  Format(SZTDlgErrTemperature,[Cells[0, Row], LongMonthNames[Col]] ), mtError, but_OK);
      //ErrorFmtDlg(SZTDlgErrTemperature, [Cells[0, Row], LongMonthNames[Col]]);
  end;
end;

procedure TCityEditNewForm.CloseElem;
begin
  Elem_CITY_ADM_UNIT_LINKS.Close;
  Elem_CITY_ADM_UNIT_LINKS_ON_Terytory.Close;
end;

procedure TCityEditNewForm.InitElements( MainElem:TDBShema );
begin
  CITY_ADM_UNIT_LINKS.DataSource := MainElem.DS;
  Elem_CITY_ADM_UNIT_LINKS :=  TDBShemaView.Create( CITY_ADM_UNIT_LINKS, ViewObjCityOn, 'CITY_ADM_UNIT_LINKS', 'ID', 'gen_city_adm_unit_links_id' );
  Elem_CITY_ADM_UNIT_LINKS.AddMainElem( MainElem, 'ID_CITY_ADM_UNIT' );

  CITY_ADM_UNIT_LINKS_ON_Terytory.DataSource := MainElem.DS;
  Elem_CITY_ADM_UNIT_LINKS_ON_Terytory :=  TDBShemaView.Create( CITY_ADM_UNIT_LINKS_ON_Terytory, ViewObjTerritoriesOn, 'CITY_ADM_UNIT_LINKS', 'ID', 'gen_city_adm_unit_links_id' );
  Elem_CITY_ADM_UNIT_LINKS_ON_Terytory.AddMainElem( MainElem, 'id_obj_city_adm_unit' );

  Elem_CITY_ADM_UNIT_LINKS.DBOpen;
  Elem_CITY_ADM_UNIT_LINKS_ON_Terytory.DBOpen;
end;

procedure TCityEditNewForm.PrepareDataFields;
const
  sT: array[1..nTemperatureCount] of String = (
    SCityFrmTemperatureDay, SCityFrmTemperatureNight, SCityFrmTemperatureWater);
var I, J: Integer;
    En: Boolean;
begin
  inherited;
  with TemperatureGrid do
  begin
    RowCount := Succ(nTemperatureCount);
    for I := 1 to 12 do Cells[I, 0] := ShortMonthNames[I];
    for J := 1 to nTemperatureCount do Cells[0, J] := sT[J];
    for J := 1 to RowCount - 1 do for I := 1 to ColCount - 1 do Cells[I, J] := '';
  end;
end;

procedure ReadDataCityInf( ElemCityInfAdmUnitInf:TDBShemaView; var aData:TRecCityDataInfoArr );
var Len:Integer;
begin
  ElemCityInfAdmUnitInf.DB.First;

  while not ElemCityInfAdmUnitInf.DB.Eof do
  begin
    Len := Length(aData);
    SetLength(aData,len+1);
    aData[len].id:= ElemCityInfAdmUnitInf.GetValueId;

    aData[len].ID_CITY_ADM_UNIT_TYPE_INFO:= ElemCityInfAdmUnitInf.DB.FieldByName('ID_CITY_ADM_UNIT_TYPE_INFO').AsInteger;
    aData[len].name:= ElemCityInfAdmUnitInf.DB.FieldByName('NAME').asString;
    aData[len].aValue:= Trim( ElemCityInfAdmUnitInf.DB.FieldByName('AVALUE').asString);

    ElemCityInfAdmUnitInf.DB.Next;
  end;
end;

procedure TCityEditNewForm.FShowDataInf(aData:TRecCityDataInfoArr);
var i:Integer;
    AVAlueStr:Widestring;
begin
  FParamElem.ElemCITYADMUNITINFOQry.DB.First;
  for i:=0 to Length(aData)-1 do
  begin
    if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 1 then
      if aData[i].aValue<>'' then
      begin
        AVAlueStr := aData[i].aValue;
        ReplaseON( AVAlueStr,'.',DecimalSeparator );
        TimeBias.EditValue := StrToFloat( AVAlueStr );
      end;

    if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 2 then
      EdPhoneCode.editValue := aData[i].aValue;

    if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 3 then
      PopulationEdit.editValue := aData[i].aValue;

    if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 4 then
      PopulationDate.editValue := aData[i].aValue;

    if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 5 then
      SunnydaysEdit.editValue := aData[i].aValue;

    if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 6 then
      ScatterTemperatureValue( aData[i].aValue,   TemperatureGrid.Rows[nTemperatureDay]   );

    if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 7 then
      ScatterTemperatureValue( aData[i].aValue,   TemperatureGrid.Rows[nTemperatureNight]   );

   if aData[i].ID_CITY_ADM_UNIT_TYPE_INFO = 8 then
      ScatterTemperatureValue( aData[i].aValue,   TemperatureGrid.Rows[nTemperatureWater]   );
  end;
end;

procedure TCityEditNewForm.SearchInputError;
begin
  //if OkBtn.Enabled then ActiveControl := OkBtn else ActiveControl := CancelBtn;
end;

procedure TCityEditNewForm.FPrepare( AddParam:TOptAddTreeNode );
begin
  InitElements( FParamElem.ElemCity );

  FParamElem.ElemAdminUnitQry.DBOpen;
  FParamElem.ElemAdminUnitSubQry.DBOpen;
  //FParamElem.ElemOBJECTLINKS.DBOpen;
  //FParamElem.ElemNaturObj.DBOpen;
  //FParamElem.ElemInfra.DBOpen;
  FParamElem.ElemCITYADMUNITINFOQry.DBOpen;
  FParamElem.ElemCityIMG.DBOpen;
  {if not Elem_OBJECTLINKS_COUNTRYQry.DBLocate( Elem_OBJECTLINKS_COUNTRYQry.FieldKod, Elem_BrCountryQry.GetValueId,[] ) then
    Elem_OBJECTLINKS_COUNTRYQry.DBClose; }
  //Elem_OBJECTLINKSQry.DBAddSQLWhere( 'and ObjectLinks.mainobjectid = '+Elem_BrCityQry.GetValueIdStr );

  FPrepareControls;
  PrepareDataFields;
  FShowData( AddParam );

  FHookControlChangeValue := THookControlChangeValue.Create( self, FRefreshChangeControl );
  FrameSearchCityObj.Prepare( FParamElem.ElemCountry,True, self.FCanUpdate, FrameSearchCityObj.Width * 2,nil, nil, FParamElem.ElemCountry.View.Styles );
  FrameSearchCityObj.SetOnChangeControl ( FRefreshChangeControl );
  FRefreshControls;
end;

procedure PrepareFilterParentObjects( aView: TcxGridDBTableView );
var V_FiltrTypeObj:Variant;
begin
 { V_FiltrTypeObj := VarArrayCreate( [0, 1], varVariant );
  V_FiltrTypeObj[0]:=0;
  V_FiltrTypeObj[1]:=1;

  SetFilterOnWievForManyColumns( aView,
                                 ['MAIN_TYPEOBJ','MAINOBJECTID'],[V_FiltrTypeObj, CityEditNewForm.FParamElem.ElemCity.GetValueId ],['in','='],[fboAnd], fboAnd ); }
end;

procedure TCityEditNewForm.FPrepareFilterObjects;
var V_FiltrTypeObj:Variant;
begin
 { V_FiltrTypeObj := VarArrayCreate( [0, 1], varVariant );
  V_FiltrTypeObj[0]:=0;
  V_FiltrTypeObj[1]:=1;

  PrepareFilterParentObjects( TcxGridDBTableView( ParentObjDBGrid.Levels[0].GridView ) );

  SetFilterOnWievForManyColumns( TcxGridDBTableView( ChildObjDBGrid.Levels[0].GridView ),
                                ['TYPEOBJ','OBJECTID'],[ V_FiltrTypeObj, FParamElem.ElemCity.GetValueId ],['in','='],[fboAnd], fboAnd );  }
end;

function TCityEditNewForm.FGetParamImg:TViewFieldImgUpd;
begin
  result.ElemImages := self.FParamElem.ElemCityIMG;
  result.FieldId := self.FParamElem.ElemCityIMG.FieldKod;
  result.FieldFileName := 'FILENAME';
  result.FieldWeb  := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';

  result.FieldObject :=  '';
  result.FieldObjValue := '';
end;

procedure TCityEditNewForm.FPrepareControls;
var paramFrame: TParamFrameKindType;
begin
  FParamElem.ElemCityAdmUntItemsType.DB.Locate( FParamElem.ElemCityAdmUntItemsType.FieldKod, FParamElem.TypeAdminUnit,[] );
  //FParamElem.ElemAdminUnitQry.SetFilterOnViewList( ['ID_CITY_ADM_UNT_ITEMS_TYPE'], [ FParamElem.TypeAdminUnit ], ['in'] );

  paramFrame.ElemType := FParamElem.ElemAdminUnitQry;
  paramFrame.ElemKindType := FParamElem.ElemAdminUnitSubQry;
  paramFrame.ElemKindTypeRel := FParamElem.ElemAdminUnitSubRelQry;
  paramFrame.FieldKeyKindRelation := 'ID_ADM_UNIT_SUB';

  FrameKindTypeAdminCity.InitFrame( paramFrame, Self.FCanUpdate, FRefreshChangeControl );
  FramePhotoList.IntitListPhotoFrame( FGetParamImg, OptionSet.WebPathToImage+'no-image.png', FParamElem.ElemAdminUnitQry.View.Styles );
  FramePhotoList.SetShowDateFoto( True, 'Дата фото.' );
  FramePhotoList.MemoDescript.StyleDisabled.Color := FParamElem.ElemAdminUnitQry.View.Styles.Content.Color;

  TcxGridDBTableView( ParentObjDBGrid.Levels[0].GridView ).Styles := FParamElem.ElemAdminUnitQry.View.Styles;
  TcxGridDBTableView( ChildObjDBGrid.Levels[0].GridView ).Styles := FParamElem.ElemAdminUnitQry.View.Styles;

  //FPrepareFilterObjects;

  NameEdit.Properties.ReadOnly := not FCanUpdate;
  EdPhoneCode.Properties.ReadOnly := not FCanUpdate;
  TimeBias.Properties.ReadOnly := not FCanUpdate;
  SunnydaysEdit.Properties.ReadOnly := not FCanUpdate;
  butEditMemo.Enabled := FCanUpdate;
  ShowWebCheckBox.Properties.ReadOnly := not FCanUpdate;
  PopulationEdit.Properties.ReadOnly := not FCanUpdate;
  PopulationDate.Properties.ReadOnly := not FCanUpdate;

  InfoPageControl.ActivePage := TabObj;
end;

procedure TCityEditNewForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
  if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
     CanClose := self.FSaveData;
end;

procedure TCityEditNewForm.FShowData( AddParam:TOptAddTreeNode );
var ProvEn: Boolean;
    DataInf:TRecCityDataInfoArr;
begin
  ProvEn := FParamElem.ElemCity.DB.FieldByName('id_Country').AsInteger <> OptionSet.LocaleCountry;
  TimeBiasGrnLabel.Caption := '';

  if AddParam in [ OptTreeNodeAddInsert, OptTreeNodeAddLast,OptTreeNodeAddSub ] then
  begin
    TimeBias.editValue := EmptyStr;
    EdPhoneCode.editValue := EmptyStr;
    PopulationEdit.editValue := EmptyStr;
    PopulationDate.editValue := EmptyStr;
    SunnydaysEdit.editValue := EmptyStr;
    FrameKindTypeAdminCity.ShowData( null );
    Elem_CITY_ADM_UNIT_LINKS.ShowEmptyDataOnView( True );
    Elem_CITY_ADM_UNIT_LINKS_ON_Terytory.ShowEmptyDataOnView( True );
  end
  else
  begin
   //AsResortCheckBox.Checked := FParamElem.ElemCity.DB.FieldByName('ID_TYPERESORT').AsInteger = 1;

    FrameKindTypeAdminCity.ShowData( FParamElem.ElemCity.DB.FieldByName('ID_ADMIN_UNIT').Value );
    NameEdit.editValue := FParamElem.ElemCity.DB.FieldByName('NAME').value;
    MemoDescript.EditValue := FParamElem.ElemCity.DB.FieldByName('AMEMO').value;
    
    ReadDataCityInf( self.FParamElem.ElemCITYADMUNITINFOQry, DataInf );
    FShowDataInf( DataInf );
  end;

  ShowWebCheckBox.Checked := (AddParam in [OptTreeNodeAddNone]) and FParamElem.ElemCity.DBBooleanValue['SHOWWEB'];
end;

procedure TCityEditNewForm.FAddValueCityInfo( IdTypeInfo:Variant; aValue :Variant );
begin
  if ( aValue = null ) then
  begin
    if self.FParamElem.ElemCITYADMUNITINFOQry.DB.Locate('ID_CITY_ADM_UNIT_TYPE_INFO',IdTypeInfo,[]) then
      self.FParamElem.ElemCITYADMUNITINFOQry.DBDelete(false);
    Exit;
  end;
  //***********************************
  if (aValue <> null) then
  begin
    if self.FParamElem.ElemCITYADMUNITINFOQry.DB.Locate('ID_CITY_ADM_UNIT_TYPE_INFO',IdTypeInfo,[]) then
      self.FParamElem.ElemCITYADMUNITINFOQry.DB.Edit
    else self.FParamElem.ElemCITYADMUNITINFOQry.DB.Insert;
  end;
  //***********************************
  if self.FParamElem.ElemCITYADMUNITINFOQry.DB.State in [dsInsert,dsEdit] then
  begin
    self.FParamElem.ElemCITYADMUNITINFOQry.DB.FieldByName('ID_CITY_ADM_UNIT_TYPE_INFO').Value := IdTypeInfo;
    self.FParamElem.ElemCITYADMUNITINFOQry.DB.FieldByName('AVALUE').Value := aValue;
    self.FParamElem.ElemCITYADMUNITINFOQry.DB.Post;
  end;
end;

function TCityEditNewForm.FCheckError( ShowErrorMes:Boolean = true ):Boolean;
begin
  Result := False;
  if ValidateValueControl( NameEdit, 'Вкажіть назву населеного пункту'  ) then
    if FrameKindTypeAdminCity.CheckError( ShowErrorMes ) then
      if CheckTemperature then Result := True;
end;

procedure TCityEditNewForm.FAddCity( FAddParam : TOptAddTreeNode; ParentCityRegion:variant );
begin
  if FParamElem.ElemCity is TDBShemaTree then
  begin
    if self.FAddParam in [OptTreeNodeAddInsert, OptTreeNodeAddLast] then
    begin
      if TDBShemaTree(FParamElem.ElemCity).tree.FocusedNode = nil then
        TDBShemaTree(FParamElem.ElemCity).AddNodeForParentId( ParentCityRegion )
      else TDBShemaTree(FParamElem.ElemCity).InsertNode;
    end
    else
    if self.FAddParam in [OptTreeNodeAddSub] then
      TDBShemaTree(FParamElem.ElemCity).AddSubNode;
  end
  else
  if FParamElem.ElemCity is TDBShemaView then
  begin
    FParamElem.ElemCity.DB.Insert;
    FParamElem.ElemCity.DB.FieldByName('ID_MAIN_PARENT').value := ParentCityRegion;
  end;
end;

Function TCityEditNewForm.FSaveData:Boolean;
var SaveUpdateForm : boolean;
begin
  result := False;
  if not FCheckError( true ) then Exit;

  try
    SaveUpdateForm := FParamElem.ElemCity.UpdateForm;
    FParamElem.ElemCity.UpdateForm := False;

    if self.FAddParam in [ OptTreeNodeAddInsert, OptTreeNodeAddLast, OptTreeNodeAddSub ] then
      FAddCity( FAddParam , FParentCityRegion )
    else FParamElem.ElemCity.DB.Edit;

    FParamElem.ElemCity.DB.FieldByName('ID_ADMIN_UNIT').Value := FrameKindTypeAdminCity.CityKindComboBox.EditValue;
    FParamElem.ElemCity.DB.FieldByName('NAME').value := NameEdit.editValue;
    FParamElem.ElemCity.DB.FieldByName('AMEMO').value:= MemoDescript.EditValue;
    FParamElem.ElemCity.DBBooleanValue['SHOWWEB']:= ShowWebCheckBox.Checked ;
    FParamElem.ElemCity.DBPost;
    
    Elem_CITY_ADM_UNIT_LINKS.ShowEmptyDataOnView( False );
    Elem_CITY_ADM_UNIT_LINKS_ON_Terytory.ShowEmptyDataOnView( False );

    FrameKindTypeAdminCity.SaveCheckRelation;

    FAddValueCityInfo( 1, TimeBias.editValue );
    FAddValueCityInfo( 2, EdPhoneCode.editValue );
    FAddValueCityInfo( 3, PopulationEdit.editValue );
    FAddValueCityInfo( 4, PopulationDate.editValue );
    FAddValueCityInfo( 5, SunnydaysEdit.editValue );
    FAddValueCityInfo( 6, GatherTemperatureValue( TemperatureGrid.Rows[nTemperatureDay]) );
    FAddValueCityInfo( 7, GatherTemperatureValue( TemperatureGrid.Rows[nTemperatureNight]) );
    FAddValueCityInfo( 8, GatherTemperatureValue( TemperatureGrid.Rows[nTemperatureWater]) );

    result := True;
    //self.FIsNew := False;
    self.FAddParam := OptTreeNodeAddNone;

    FHookControlChangeValue.IsChange := False;
    FRefreshControls;
  finally
    FParamElem.ElemCity.UpdateForm := SaveUpdateForm;
  end;
end;


procedure TCityEditNewForm.TemperatureGridKeyPress(Sender: TObject;
  var Key: Char);
var Text: String;
begin
  case Key of
    '0'..'9', #8: ;
    '-', '+':
    begin
      with Sender as TStringGrid do
      begin
        Text := Cells[Col, Row];
        if Text <> '' then
        begin
          if ((Pos('-', Text) = 0) and (Pos('+', Text) = 0)) then
            Cells[Col, Row] := Key + Text;
          Key := #0;
        end;
      end;

    end;
  else
  begin
    Key := #0;
    exit;
  end;
  end;

  self.FHookControlChangeValue.IsChange := True;
  FRefreshControls;
end;

procedure TCityEditNewForm.FormShow(Sender: TObject);
begin
  Self.Height := 580;
end;

procedure TCityEditNewForm.ButCountryLngClick(Sender: TObject);
begin
  ShowTranslateLng( FParamElem.ElemCity, NameEdit.Text, 'NAME', 'uk', FParamElem.ElemCountry.View.Styles );
end;

procedure TCityEditNewForm.ButShowLogClick(Sender: TObject);
begin
  ShowLog( self,self.FParamElem.ElemCountry.DBGetParamConnect,self.FParamElem.ElemCountry.GetCurrManagerId, -1, [] );
end;

procedure TCityEditNewForm.FRefreshChangeControl(Sender: TObject);
begin
  FRefreshControls;
end;

function TCityEditNewForm.FIsNew:Boolean;
begin
  result := self.FAddParam in [OptTreeNodeAddInsert,OptTreeNodeAddLast,OptTreeNodeAddSub];
end;

procedure TCityEditNewForm.FRefreshControls;
var AsResort: Boolean;
    ProvEn:Boolean;
begin
  ProvEn := self.FParamElem.ElemCity.GetValueId <> OptionSet.LocaleCountry;

  PhoneCodeLabel.Enabled := EdPhoneCode.Enabled;
  EdPhoneCode.Enabled := FCanUpdate and not self.FParamElem.ElemCountry.DBBooleanValue['PHONECODEUNI'];

  if Self.FHookControlChangeValue <> nil then
    BtnSaveData.Enabled := Self.FHookControlChangeValue.IsChange or FrameKindTypeAdminCity.IsChange
  else BtnSaveData.Enabled := False;

  ParentObjDBGrid.Enabled := not self.FisNew;
  ChildObjDBGrid.Enabled := not self.FisNew;
  //ButResortImgsEdit.Enabled := not self.FisNew;
  if not self.FisNew then FramePhotoList.Refresh( FGetPathImage )
  else FramePhotoList.Refresh( '' );

  butAddSeObject.Enabled := FrameSearchCityObj.EditName <> '';
  butDelSeObject.Enabled := TcxGridDBTableView(ParentObjDBGrid.Levels[0].GridView).ViewData.RowCount <> 0;
end;

procedure TCityEditNewForm.CancelBtnClick(Sender: TObject);
begin
   self.ModalResult := mrCancel;
end;

procedure TCityEditNewForm.BtnSaveDataClick(Sender: TObject);
begin
  self.FSaveData;
end;

procedure TCityEditNewForm.PopulationEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key := EnableInputJustNumber(Sender, Key, false);
end;

procedure TCityEditNewForm.FormDestroy(Sender: TObject);
begin
  CloseElem;
  FrameKindTypeAdminCity.DestroyFrame;
  
  if FHookControlChangeValue<>nil then
    FHookControlChangeValue.Destroy;
end;

procedure TCityEditNewForm.TimeBiasPropertiesChange(Sender: TObject);
var Bias: Double;
begin
  if IsStrANumber( TimeBias.Text ) then
  begin
    Bias := StrToFloat(TimeBias.Text);
    TimeBiasGrnLabel.Caption := FloatToStr(Bias + 2);
  end
  else TimeBiasGrnLabel.Caption := '';
end;

function TCityEditNewForm.FGetViewFieldImgUpdPrperty:TViewFieldImgUpd;
begin
  result.ElemImages := FParamElem.ElemCityIMG;
  result.FieldId := 'ID';
  result.FieldFileName := 'FILENAME';
  result.FieldWeb  := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';
end;

function TCityEditNewForm.FGetPathImage:Widestring;
begin
  result := self.FParamElem.PathToImageCity + self.FParamElem.ElemCity.GetValueIdStr+'\';
end;

Procedure TCityEditNewForm.FShowUdateImageFor;
var ImgUpdPrperty:TViewFieldImgUpd;
begin
  ImgUpdPrperty := FGetViewFieldImgUpdPrperty;
  ImgUpdPrperty.FieldObject :=  '';
  ImgUpdPrperty.FieldObjValue := '';

  ShowUpdateImages( ImgUpdPrperty, FGetPathImage, OptionSet.WebPathToImage+'no-image.png', self.FParamElem.ElemCountry.View.Styles );
  FRefreshControls;
end;


procedure TCityEditNewForm.FAddObjLink( IdObjCityUnitAdmin:Variant );
begin
  if IdObjCityUnitAdmin <> null then
  begin

    if not Elem_CITY_ADM_UNIT_LINKS.DB.Locate('ID_OBJ_CITY_ADM_UNIT', IdObjCityUnitAdmin,[] ) then       //CmbxSearchCountry.EditValue
    begin
      Elem_CITY_ADM_UNIT_LINKS.DBInsert;
      Elem_CITY_ADM_UNIT_LINKS.DB.FieldByName('ID_OBJ_CITY_ADM_UNIT').Value := IdObjCityUnitAdmin;       //CmbxSearchCountry.EditValue;
      Elem_CITY_ADM_UNIT_LINKS.DBPost;
      Elem_CITY_ADM_UNIT_LINKS.RequeryCurrentRecord;
      Elem_CITY_ADM_UNIT_LINKS_ON_Terytory.Requery;
    end;

  end
  else MyShowMessageDlg( 'Виберіть Об''єкт', mtError, but_OK );
end;

procedure TCityEditNewForm.butAddSeObjectClick(Sender: TObject);
begin
  FAddObjLink( FrameSearchCityObj.EditValue );
  FRefreshControls;
end;

procedure TCityEditNewForm.butDelSeObjectClick(Sender: TObject);
begin
  Elem_CITY_ADM_UNIT_LINKS.DBDelete(True);
  FRefreshControls;
end;

procedure TCityEditNewForm.butEditMemoClick(Sender: TObject);
var NewText: Widestring;
begin
  NewText := ShowEditText( MemoDescript.Text, 'Примітка' );
  if NewText <> '^' then
  begin
    MemoDescript.Text := NewText;
  end;

end;

end.



{var ParamSelParentObj : TParamSelParentObj;
    OpEnArr : ToOpEnArr;
begin

  ParamSelParentObj.ElemCountry := FParamElem.ElemCountry;
  //ParamSelParentObj.ElemObjLinkCountry := FParamElem.ElemResortCountry;// Elem_ResortCountryQry;
  ParamSelParentObj.ElemObjLinks := FParamElem.ElemOBJECTLINKS;
  //ParamSelParentObj.ElemNaturObjects := FParamElem.ElemNaturObj;
  //ParamSelParentObj.ElemInfra:= FParamElem.ElemInfra;

  ParamSelParentObj.ObjLinksMainTypeObj := 1;
  ParamSelParentObj.ObjLinksMainObjId := FParamElem.ElemCity.GetValueId;

  ParamSelParentObj.ArrEn := [ optResort, optNaturObj , optInfra ];

  ShowParentObjEditDlg( ParamSelParentObj , FParamElem.ElemCity.GetValueId, 0, FParamElem.ElemCountry.GetValueId, FCurManager, PrepareFilterParentObjects ); }
