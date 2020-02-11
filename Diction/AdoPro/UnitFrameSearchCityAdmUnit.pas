unit UnitFrameSearchCityAdmUnit;

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
  ADODB, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Buttons, cxTextEdit, cxMaskEdit,
  cxDropDownEdit,Core, UnitProc, cxDBTL, cxTL, ExtCtrls, UnitAdoQuery, UnitIBQuery;

type
  TMycxPopupEdit = class(TcxPopupEdit)
   private
    // procedure DoCloseUp; override;
   public
  end;

  TFrameSearchCityAdmUnit = class(TFrame)
    EdSearchCity: TcxTextEdit;
    CitySrc: TDataSource;
    ADOCity: TADOQuery;
    PanelControl: TPanel;
    butOptSeacrh: TSpeedButton;
    butSearchCityGlobal: TSpeedButton;
    procedure EdSearchCityExit(Sender: TObject);
    procedure EdSearchCityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butSearchCityGlobalClick(Sender: TObject);
    procedure butSearchCityGlobalMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure butSearchCityGlobalMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FElemCoutry : TDBShema;
    FElemCityAdminUnit : TDBShemaTree;

    FAddSql     : WideString;
    FMainSql    : WideString;
    FPopUpWidth : Integer;
    FPopupEd    : TMycxPopupEdit;
    FFieldKey   : String;
    FFieldName  : string;
    FFieldParent: string;
    FDBTree     : TcxDBTreeList;
    FViewTree   : TcxGridDBTableView;
    FTreeStyle  : TcxTreeListStyleSheet;
    FOnChange   : TNotifyEvent;
    FManagerId  : Integer;

    procedure   FFindBySearchtext;
    procedure   FPrepareDBCity( DBParam:TConnectDBParam );
    procedure   FShowPopupGridView( Show:Boolean );
    procedure   FFindById( IdValue:Variant );
  public
    { Public declarations }
    
    function  EditValue:Variant;
    function  EditName:String;
    procedure SetValue( EditValue:Variant );

    procedure DoCloseUp;
    procedure RefreshControls;
    procedure SetManagerId( ManagerId:Integer );
    procedure Prepare( ElemCoutry : TDBShema; ViewTree:TcxGridDBTableView; CanUpdate:Boolean;
                       EditStyle:TcxEditStyle; TreeStyle:TcxTreeListStyleSheet );
  end;

implementation

{$R *.dfm}

procedure TFrameSearchCityAdmUnit.Prepare( ElemCoutry : TDBShema; ViewTree:TcxGridDBTableView; CanUpdate:Boolean;
                                           EditStyle  : TcxEditStyle; TreeStyle:TcxTreeListStyleSheet );
var DBParam:TConnectDBParam;
begin
  FElemCoutry := ElemCoutry;

  DBParam := FElemCoutry.DBGetParamConnect;
  FDBTree  := TcxDBTreeList.Create(Self);

  FPopupEd := TMycxPopupEdit.Create(self);
  FFieldKey  := 'ID';
  FFieldName := 'NAME';
  FFieldParent := 'ID_PARENT';
  FViewTree    := ViewTree;
  FTreeStyle   := TreeStyle;

  FPopupEd.Parent := self;

  FPopupEd.SendToBack;
  FPopupEd.Left :=EdSearchCity.Left;
  FPopupEd.Top := EdSearchCity.Top;
  FPopupEd.Width :=EdSearchCity.Width;
  FPopupEd.Height :=EdSearchCity.Height;
  FPopupEd.Anchors :=[akLeft,akTop,akRight];

  FPopupEd.Properties.PopupControl := FDBTree;
  
  FDBTree.DataController.DataSource := CitySrc;
  FDBTree.DataController.KeyField := FFieldKey;
  FDBTree.DataController.ParentField := FFieldParent;

  if EditStyle <> nil then EdSearchCity.Style := EditStyle;

  EdSearchCity.Enabled:= CanUpdate;
  PanelControl.Visible := CanUpdate;
  if PanelControl.Visible then
    EdSearchCity.Width := self.Width - PanelControl.Width
  else EdSearchCity.Width := self.Width;

  if not CanUpdate then
    EdSearchCity.StyleFocused:=EdSearchCity.StyleDisabled
  else EdSearchCity.StyleFocused:=EdSearchCity.Style;

  if FMainSql = '' then
    FMainSql := ADOCity.SQL.Text;

  FAddSql := '';
  FOnChange := nil;

  FPrepareDBCity(DBParam);
  FElemCityAdminUnit.DBClose;

  FElemCityAdminUnit.PreviewVirtualOnTree( FElemCityAdminUnit.Tree );
end;

procedure TFrameSearchCityAdmUnit.SetManagerId( ManagerId:Integer );
begin
  FManagerId := ManagerId;
  RefreshControls;
end;


procedure TFrameSearchCityAdmUnit.FPrepareDBCity( DBParam:TConnectDBParam );
var CityQry : TDataset;
begin
  if DBParam.IBDatabaseConnection <> nil then
    CityQry := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, nil, ADOCity.SQL.Text )
  else
  if DBParam.TypeConnect = optTypeConADO then
    CityQry := UnitAdoQuery.CreateDataSet( DBParam.ADOConnection, ADOCity.SQL.Text );

  CityQry.Tag := -1;  
  CitySrc.DataSet := CityQry;

  FElemCityAdminUnit := TDBShemaTree.Create( CityQry, FDBTree, 'CITY_ADM_UNIT', 'ID', 'gen_city_adm_unit_id' );
  FElemCityAdminUnit.AddVirtualTreeParam( FFieldParent, FViewTree, True, FTreeStyle );
end;

procedure TFrameSearchCityAdmUnit.EdSearchCityExit(Sender: TObject);
begin
  if not self.FPopupEd.DroppedDown then
    EdSearchCity.Text := self.FPopupEd.Text
end;

procedure TFrameSearchCityAdmUnit.FFindBySearchtext;
var StrSearch:string;
begin
  if Trim(EdSearchCity.Text)='' Then Exit;
  if not butOptSeacrh.Down then StrSearch := ''''+AnsiLowerCase( Trim( EdSearchCity.Text ) )+'%'''
  else StrSearch := ''''+'%'+AnsiLowerCase( Trim( EdSearchCity.Text ) )+'%''';

  FElemCityAdminUnit.DBClose;
  FElemCityAdminUnit.DBQueryChangeSql( FMainSql + FAddSql+ 'and LOCASE( CITY_ADM_UNIT.name ) like '+StrSearch, False );
  FElemCityAdminUnit.DBQuerySetParamValue( 'ID_COUNTRY', FElemCoutry.GetValueId );
  FElemCityAdminUnit.DBOpen;

end;

procedure TFrameSearchCityAdmUnit.FShowPopupGridView( Show:Boolean );
begin
  FDBTree.Width := EdSearchCity.Width;

  FPopupEd.DroppedDown := Show;
  butSearchCityGlobal.Down := Show;
end;

procedure TFrameSearchCityAdmUnit.EdSearchCityKeyDown(Sender: TObject;
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

procedure TFrameSearchCityAdmUnit.RefreshControls;
begin
  FShowPopupGridView( butSearchCityGlobal.Down );
end;

procedure TFrameSearchCityAdmUnit.DoCloseUp;
begin
  inherited;
  TFrameSearchCityAdmUnit(self.Owner).butSearchCityGlobal.Tag := -1;
  TFrameSearchCityAdmUnit(self.Owner).butSearchCityGlobal.Down := False;

  if TFrameSearchCityAdmUnit(self.Owner).FPopupEd.EditText <> ''  then
    TFrameSearchCityAdmUnit(self.Owner).EdSearchCity.Text := TFrameSearchCityAdmUnit(self.Owner).FPopupEd.EditText;
  TFrameSearchCityAdmUnit(self.Owner).EdSearchCity.SetFocus;
end;

procedure TFrameSearchCityAdmUnit.FFindById( IdValue:Variant );
begin
  FElemCityAdminUnit.DBClose;
  if IdValue <> null then
  begin
    FElemCityAdminUnit.DBQueryChangeSql( FMainSql + FAddSql+ ' and CITY_ADM_UNIT.ID = '+VarToStr( IdValue ), False );
    FElemCityAdminUnit.DBQuerySetParamValue( 'countryid', FElemCoutry.GetValueId );
    FElemCityAdminUnit.DBOpen;
  end;
end;

procedure TFrameSearchCityAdmUnit.SetValue( EditValue:Variant );
begin
  FFindById( EditValue );
  self.FPopupEd.EditValue :=EditValue ;
  EdSearchCity.Text := self.FPopupEd.EditText;
end;

function TFrameSearchCityAdmUnit.EditValue:Variant;
begin
  result := self.FPopupEd.EditValue;
end;

function TFrameSearchCityAdmUnit.EditName:String;
begin
  Result := self.FPopupEd.Text;
end;

procedure TFrameSearchCityAdmUnit.butSearchCityGlobalClick(
  Sender: TObject);
begin
  if butSearchCityGlobal.Down then
  begin
    FFindBySearchtext;
    FShowPopupGridView( True );
  end
  else
    FShowPopupGridView( False );
end;

procedure TFrameSearchCityAdmUnit.butSearchCityGlobalMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
 if butSearchCityGlobal.Tag = -1 then
  begin
    butSearchCityGlobal.Tag := 0;
    Abort;
  end;
end;

procedure TFrameSearchCityAdmUnit.butSearchCityGlobalMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  butSearchCityGlobal.Tag:=0;
end;

end.
