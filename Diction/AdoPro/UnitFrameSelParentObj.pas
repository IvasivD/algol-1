unit UnitFrameSelParentObj;

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
  StdCtrls, cxRadioGroup, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Buttons, ExtCtrls, cxContainer, UnitFrameSearchCity, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, core,
  cxDBExtLookupComboBox, MemTableDataEh,  dxmdaset,UnitProc,
  cxPCdxBarPopupMenu, cxPC;

type
  TOpEn = ( optCity, optResort, optNaturObj, optInfra );
  ToOpEnArr = set of TOpEn;
  TFilterObj = procedure ( aView: TcxGridDBTableView );

  
  TParamSelParentObj =  record
      ElemObjLinkCountry : TDBShemaView;
      ElemObjLinks : TDBShemaView;
      ObjLinksMainTypeObj:Integer;
      ObjLinksMainObjId:Variant;

      ElemCountry : TDBShemaView;
      ElemNaturObjects:TDBShemaView;
      ElemInfra:TDBShemaView;

      ArrEn : ToOpEnArr ;
  end;

  TParamObj = record
    ObjId:Variant;
    TypeObj:Integer;
  end;

  TFrameSelParentObj = class(TFrame)
    PanSelCountry: TPanel;
    GridCounry: TcxGrid;
    GridCounryDBTableView1: TcxGridDBTableView;
    GridCounryLevel1: TcxGridLevel;
    Panel4: TPanel;
    Label1: TLabel;
    butDelSelCountry: TSpeedButton;
    butAddSelCountry: TSpeedButton;
    Bevel1: TBevel;
    PanelSelObject: TPanel;
    PanSelCity: TPanel;
    GridObject: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    PanelSearchObj: TPanel;
    Label2: TLabel;
    butAddSeObject: TSpeedButton;
    Bevel2: TBevel;
    RbCity: TcxRadioButton;
    rbResort: TcxRadioButton;
    RbNaturObj: TcxRadioButton;
    RbInfra: TcxRadioButton;
    PageControlSearcObject: TcxPageControl;
    TabCity: TcxTabSheet;
    FrameSearchCityObj: TFrameSearchCity;
    TabResort: TcxTabSheet;
    FrameSearchResortObj: TFrameSearchCity;
    TabNaturObj: TcxTabSheet;
    TabInfra: TcxTabSheet;
    CountryObjSrc: TDataSource;
    ObjLinksSrc: TDataSource;
    cxGridViewRepository: TcxGridViewRepository;
    ViewSelCountry: TcxGridDBTableView;
    ViewSelCountryCOUNTRINAME: TcxGridDBColumn;
    ViewSelObject: TcxGridDBTableView;
    ViewSelObjectLINKID: TcxGridDBColumn;
    ViewSelObjectMAIN_TYPEOBJ: TcxGridDBColumn;
    ViewSelObjectMAINOBJECTID: TcxGridDBColumn;
    ViewSelObjectTYPEOBJ: TcxGridDBColumn;
    ViewSelObjectOBJECTID: TcxGridDBColumn;
    ViewSelObjectOBJLINKCOUNTRY: TcxGridDBColumn;
    ViewSelObjectOBJECTNAME: TcxGridDBColumn;
    butDelSeObject: TSpeedButton;
    CmbxSearchNaturObj: TcxExtLookupComboBox;
    CmbxSearchInfrastructures: TcxExtLookupComboBox;
    CmbxSearchCountry: TcxExtLookupComboBox;
    ViewSelCountryCOUNTRYID: TcxGridDBColumn;
    procedure butDelSelCountryClick(Sender: TObject);
    procedure butAddSeObjectClick(Sender: TObject);
    procedure butDelSeObjectClick(Sender: TObject);
    procedure RbCityClick(Sender: TObject);
    procedure butAddSelCountryClick(Sender: TObject);
    procedure CmbxSearchCountryPropertiesChange(Sender: TObject);
    procedure CmbxSearchInfrastructuresPropertiesChange(Sender: TObject);
    procedure ViewSelCountryFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);

  private
    { Private declarations }
    FElemCountry :TDBShemaView;
    FElemObjLinkCountry :TDBShemaView;
    FElemObjLinks :TDBShemaView;

    FElemNaturObjects:TDBShemaView;
    FElemInfra:TDBShemaView;
    FObjLinksMainTypeObj :Integer;
    FObjLinksMainObjId :Variant;
    FDefCountryId : Variant;
    FFilterSelObj : TFilterObj;
    FMainObjId, FMainTypeObj :Variant;
    FArrEn : ToOpEnArr;
    FManagerId :Integer;

    procedure FAddCityToSel( FObjLinksMainTypeObj:Integer;FObjLinksMainObjId:Variant );
    procedure FAddCountryToSel( CountryId:Variant );
    Procedure FPrepareControls;
    Procedure FPrepareSelectRBControls( aArrEn : ToOpEnArr );
    Procedure FPrepare;
    function  FGetCurrObjId:TParamObj;
  public
    { Public declarations }
    procedure RefreshControls;
    Procedure InitFrame( ParamSelParentObj : TParamSelParentObj; MainObjId, MainTypeObj, DefCountryId:Variant; FilterSelObj:TFilterObj = nil );
    procedure SetManagerId( ManagerId:Integer );
  end;

implementation

{$R *.dfm}


procedure TFrameSelParentObj.InitFrame( ParamSelParentObj : TParamSelParentObj; MainObjId, MainTypeObj, DefCountryId:Variant; FilterSelObj:TFilterObj = nil );
begin
  FElemCountry := ParamSelParentObj.ElemCountry;
  FElemObjLinkCountry := ParamSelParentObj.ElemObjLinkCountry;
  FElemObjLinks := ParamSelParentObj.ElemObjLinks;
  FElemNaturObjects := ParamSelParentObj.ElemNaturObjects;
  FElemInfra := ParamSelParentObj.ElemInfra;
  FArrEn := ParamSelParentObj.ArrEn;

  FObjLinksMainTypeObj := ParamSelParentObj.ObjLinksMainTypeObj;
  FObjLinksMainObjId := ParamSelParentObj.ObjLinksMainObjId;
  FDefCountryId := DefCountryId;
  FFilterSelObj := FilterSelObj;
  FMainObjId := MainObjId;
  FMainTypeObj := MainTypeObj;

  FPrepare;
end;

procedure TFrameSelParentObj.SetManagerId( ManagerId:Integer );
begin
  FManagerId := ManagerId;
  RefreshControls;
end;

Procedure TFrameSelParentObj.FPrepare;
begin
  FElemCountry.DBReOpen;
  FElemObjLinkCountry.DBQuerySetParamValue('objectid',FMainObjId );
  FElemObjLinkCountry.DBQuerySetParamValue('typeobj', FMainTypeObj );
  FElemObjLinkCountry.DBOpen;
  FElemObjLinks.DBReOpen;
  FElemNaturObjects.DBReOpen;
  FElemInfra.DBReOpen;

  CountryObjSrc.DataSet := FElemObjLinkCountry.DB;
  ObjLinksSrc.DataSet := FElemObjLinks.DB;

  FPrepareControls;
  RefreshControls;
end;

Procedure TFrameSelParentObj.FPrepareSelectRBControls( aArrEn : ToOpEnArr );
var i:Integer;
begin
  if not ( optCity in aArrEn ) then begin RbCity.Enabled:=False; rbResort.Checked :=True;   end;
  if not ( optResort in aArrEn ) then begin rbResort.Enabled:=False;RbNaturObj.Checked := True; end;
  if not ( optNaturObj in aArrEn ) then begin RbNaturObj.Enabled:=False; RbInfra.Checked :=True;end;
  if not ( optInfra in aArrEn ) then begin RbInfra.Enabled:=False;RbInfra.Checked :=False; end;
end;

Procedure TFrameSelParentObj.FPrepareControls;
begin
  SetPropInCxExtLookupComboBox( CmbxSearchCountry, TcxGridDBTableView( FElemCountry.ViewList ),'NAME', FElemCountry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( CmbxSearchNaturObj, TcxGridDBTableView( FElemNaturObjects.ViewList ),'NAME', FElemNaturObjects.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( CmbxSearchInfrastructures, TcxGridDBTableView( FElemInfra.ViewList ),'NAME', FElemInfra.FieldKod, True, false );

  FrameSearchCityObj.Prepare( FElemCountry,True, True, FrameSearchCityObj.Width * 2, nil,
                              nil, FElemCountry.View.Styles );

  FrameSearchCityObj.SetOnChangeControl ( RbCityClick );

  FrameSearchResortObj.Prepare( FElemCountry,True, True, FrameSearchResortObj.Width * 2, nil,
                                nil, FElemCountry.View.Styles );
  FrameSearchResortObj.SetSubConditionSql(' and ResortTypeId >1 ');
  FrameSearchResortObj.SetOnChangeControl ( RbCityClick );


  ViewSelCountry.Styles.StyleSheet := FElemCountry.View.Styles.StyleSheet;
  ViewSelCountry.DataController.DataSource := FElemObjLinkCountry.DS;

  ViewSelObject.Styles.StyleSheet := FElemCountry.View.Styles.StyleSheet;
  ViewSelObject.DataController.DataSource := FElemObjLinks.DS;

  if @FFilterSelObj <> nil then FFilterSelObj( ViewSelObject ) ;
  ViewSelObject.DataController.Filter.Refresh;

  PageControlSearcObject.HideTabs := True;
  PanelSearchObj.Height := 59;
  PageControlSearcObject.Height := 25;

  if FDefCountryId <> null then
  begin
    PanSelCountry.Visible := False;
    CmbxSearchCountry.EditValue := FDefCountryId;
  end;

  FPrepareSelectRBControls( FArrEn );
end;

procedure TFrameSelParentObj.FAddCountryToSel( CountryId:Variant );
begin
  if CountryId <> null then
  begin
    if not FElemObjLinkCountry.DB.Locate('COUNTRYID', CountryId,[] ) then       //CmbxSearchCountry.EditValue
    begin
      FElemObjLinks.DBInsert;
      FElemObjLinks.DB.FieldByName('COUNTRYID').Value := CountryId;       //CmbxSearchCountry.EditValue;
      FElemObjLinks.DB.FieldByName('objectid').Value := self.FMainObjId;
      FElemObjLinks.DB.FieldByName('typeobj').Value :=  self.FMainTypeObj;
      FElemObjLinks.DBPost;
      FElemObjLinkCountry.Requery;
    end;
  end
  else MyShowMessageDlg( 'Виберіть країну', mtError, but_OK );
end;


procedure TFrameSelParentObj.FAddCityToSel( FObjLinksMainTypeObj:Integer;FObjLinksMainObjId:Variant );
var CurrObjId:TParamObj;
begin
  CurrObjId := FGetCurrObjId;

  if CurrObjId.ObjId <> null then
  begin
    if FindValuesInViewByField( TcxGridDBTableView(GridObject.Levels[0].GridView),['OBJECTID','TYPEOBJ'], [CurrObjId.ObjId, CurrObjId.TypeObj] )= -1 then
    //if not FElemObjLinks.ViewDBLocate('OBJECTID;TYPEOBJ', VarArrayOf( [CurrObjId.ObjId, CurrObjId.TypeObj] ),[]  ) then
    begin
      FElemObjLinks.DBInsert;
      FElemObjLinks.DB.FieldByName('MAINOBJECTID').Value := FMainObjId;
      FElemObjLinks.DB.FieldByName('MAIN_TYPEOBJ').Value := FMainTypeObj;

      FElemObjLinks.DB.FieldByName('OBJECTID').Value := CurrObjId.ObjId;   
      FElemObjLinks.DB.FieldByName('TYPEOBJ').Value := CurrObjId.typeObj;
      FElemObjLinks.DBPost;
    end;
    FElemObjLinks.RequeryCurrentRecord;
  end
  else MyShowMessageDlg( 'Виберіть країну', mtError, but_OK );
end;

procedure TFrameSelParentObj.butAddSelCountryClick(Sender: TObject);
begin
  FAddCountryToSel( CmbxSearchCountry.EditValue );
  RefreshControls;
end;

function TFrameSelParentObj.FGetCurrObjId:TParamObj;
begin
  if ( RbCity.Checked ) then
  begin
    Result.ObjId := FrameSearchCityObj.EditValue;
    Result.TypeObj := 0;
  end;
  //***************************
  if ( rbResort.Checked ) then
  begin
    Result.ObjId := FrameSearchResortObj.EditValue;
    Result.TypeObj := 1;
  end;
  //***************************
  if ( RbNaturObj.Checked ) then
  begin
    if CmbxSearchNaturObj.EditText <>'' then
      Result.ObjId := CmbxSearchNaturObj.EditValue
    else Result.ObjId := null;

    Result.TypeObj := 2;
  end;
  //***************************
  if ( RbInfra.Checked ) then
  begin
    if CmbxSearchInfrastructures.EditText <> '' then
      Result.ObjId := CmbxSearchInfrastructures.EditValue
    else Result.ObjId:= null;
    
    Result.TypeObj := 3;
  end;
end;

procedure TFrameSelParentObj.RefreshControls;
begin
  CmbxSearchCountry.Enabled :=  FManagerId > 0;
  FrameSearchCityObj.EdSearchCity.Enabled := FManagerId > 0;
  FrameSearchResortObj.EdSearchCity.Enabled := FManagerId > 0;
  CmbxSearchNaturObj.Enabled := FManagerId > 0;
  CmbxSearchInfrastructures.Enabled := FManagerId > 0;

  butAddSelCountry.Enabled := ( FManagerId > 0 ) and ( CmbxSearchCountry.EditValue <> null);
  butDelSelCountry.Enabled := ( FManagerId > 0 ) and ( TcxGridDBTableView(GridCounry.Levels[0].GridView).DataController.RowCount <> 0);

  butAddSeObject.Enabled := ( FManagerId > 0 ) and ( FGetCurrObjId.ObjId <> null);
  butDelSeObject.Enabled := ( FManagerId > 0 ) and ( TcxGridDBTableView(GridObject.Levels[0].GridView).DataController.RowCount <> 0);

  if RbCity.Checked then PageControlSearcObject.ActivePage := TabCity
  else
  if RbResort.Checked then PageControlSearcObject.ActivePage := TabResort
  else
  if RbNaturObj.Checked then PageControlSearcObject.ActivePage := TabNaturObj
  else
  if RbInfra.Checked then PageControlSearcObject.ActivePage := TabInfra;
end;

procedure TFrameSelParentObj.butAddSeObjectClick(Sender: TObject);
begin
  if self.FDefCountryId <> null then
    FAddCountryToSel( self.FDefCountryId );

  FAddCityToSel( FObjLinksMainTypeObj , FObjLinksMainObjId );
  RefreshControls;
end;

procedure TFrameSelParentObj.butDelSeObjectClick(Sender: TObject);
begin
  FElemObjLinks.DBDelete;
  RefreshControls;
end;

procedure TFrameSelParentObj.RbCityClick(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrameSelParentObj.butDelSelCountryClick(Sender: TObject);
begin
  FElemObjLinkCountry.DBDelete;
  FElemObjLinkCountry.Requery;
  RefreshControls;
end;

procedure TFrameSelParentObj.CmbxSearchCountryPropertiesChange(
  Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrameSelParentObj.CmbxSearchInfrastructuresPropertiesChange(
  Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrameSelParentObj.ViewSelCountryFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (ViewSelObject<>nil)and(ViewSelObject.ViewData.RowCount<>0) then
   begin
      if ViewSelObject.ViewData.Rows[0].visible then
      begin
        ViewSelObject.ViewData.Rows[0].Focused:=true;
        ViewSelObject.ViewData.Records[0].Selected:=true;
      end;
   end;
end;

end.
