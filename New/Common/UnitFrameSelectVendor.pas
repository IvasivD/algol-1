unit UnitFrameSelectVendor;

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
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridLevel, cxClasses, cxGridCustomView,
  cxTextEdit, Buttons, StdCtrls, cxCheckBox, ExtCtrls,Core, UnitProc,UnitFrameComRequisites;

type
  TFrameSelectVendor = class(TFrame)
    ClientRadioGroup: TRadioGroup;
    IsVendorCheckBox: TcxCheckBox;
    PromptLabel: TLabel;
    butAddVendor: TSpeedButton;
    butDelVendor: TSpeedButton;
    SearchEdit: TcxTextEdit;
    GridSelVendor: TcxGrid;
    GridSelVendorDBTableView1: TcxGridDBTableView;
    GridSelVendorLevel1: TcxGridLevel;
    CompanyVendorDS: TDataSource;
    GridRepositoryScanDoc: TcxGridViewRepository;
    ViewCompanyVendor: TcxGridDBTableView;
    ViewCompanyVendorcompanyid: TcxGridDBColumn;
    ViewCompanyVendorname: TcxGridDBColumn;
    ViewCompanyVendorISENTERPR: TcxGridDBColumn;
    ViewCompanyVendorFilterField: TcxGridDBColumn;
    ViewCompanyVendorISVENDOR: TcxGridDBColumn;
    procedure IsVendorCheckBoxPropertiesChange(Sender: TObject);
    procedure ClientRadioGroupClick(Sender: TObject);
    procedure butAddVendorClick(Sender: TObject);
    procedure butDelVendorClick(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure ViewCompanyVendorFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    FFilterFieldParam:String;

    procedure FCloseElem;
    procedure FFilterSearch;
    procedure FUpdateVendor( isNew:Boolean );
    function FGetSqlIB( FilterFieldParam:String ):string;
    function FGetSqlAdo( FilterFieldParam:String ):string;
    function FGetSql( DBParam:TConnectDBParam; FilterFieldParam:String ):string;

    function FGetSqlUpdateFilterParamIB( CompanyId, FilterFieldParam:String ):string;
    function FGetSqlUpdateFilterParamADO(CompanyId, FilterFieldParam:String ):string;
    function FGetSqlUpdateFilterParam(DBParam:TConnectDBParam; CompanyId, FilterFieldParam:String):string;

    procedure FInitElem( DBParam:TConnectDBParam; ViewStyle:TcxCustomStyleSheet; FilterFieldParam:String; DefVendId:variant );
  public
    { Public declarations }
    ElemVendor:TDBShemaView;
    procedure Prepare( DBParam:TConnectDBParam; FilterFieldParam:String;
                       ViewStyle:TcxCustomStyleSheet; DefVendId:variant );

    procedure DestroyFrame;                   
  end;

implementation

{$R *.dfm}


procedure TFrameSelectVendor.Prepare( DBParam:TConnectDBParam; FilterFieldParam:String;
                                      ViewStyle:TcxCustomStyleSheet; DefVendId:variant );
begin
  self.FFilterFieldParam := FilterFieldParam;
  self.FInitElem( DBParam, ViewStyle, FilterFieldParam , DefVendId );
end;

procedure TFrameSelectVendor.FInitElem( DBParam:TConnectDBParam; ViewStyle:TcxCustomStyleSheet; FilterFieldParam:String; DefVendId: variant );
var SQL:string;
    DB:TDataset;
begin
  ViewCompanyVendor.Styles.StyleSheet:= ViewStyle;
  ClientRadioGroup.ItemIndex := 1;
  SearchEdit.Clear;

  SQL := FGetSql( DBParam , FilterFieldParam );
  DB := DBCreate( SQL, nil, DBParam, False );
  DB.Tag := 0;
  CompanyVendorDS.DataSet := DB;

  ElemVendor := TDBShemaView.Create( DB, ViewCompanyVendor, 'companies', 'CompanyId', 'COMPANIES_GEN' );
  ElemVendor.DBOpenWait;

 //ElemVendor.AddCellDblClick();

  FFilterSearch;

  if DefVendId <> null then
    ElemVendor.DB.Locate(ElemVendor.FieldKod,DefVendId,[] )
  else ElemVendor.View.DataController.GotoFirst;

  ElemVendor.ViewFocusRowIndex;
  //ElemVendor.SetFocusOnView;
end;

function TFrameSelectVendor.FGetSqlIB( FilterFieldParam:String ):string;
begin
  result:=' select companies.companyid, companies.name, companies.ISENTERPR, companies.ISVENDOR, companies.isprivate, '+
          ' ( Select AVALUE from GET_COMPANY_PARAM (companies.CompanyId,'''+FilterFieldParam+''') ) FilterField from companies '+
          ' where ( Select AVALUE from GET_COMPANY_PARAM (companies.CompanyId,'''+FilterFieldParam+''') ) = 1 ';
end;

function TFrameSelectVendor.FGetSqlAdo( FilterFieldParam:String ):string;
begin
  result:=' select companies.companyid, companies.name, companies.ISENTERPR, companies.ISVENDOR, companies.isprivate, '+
          ' GET_COMPANY_PARAM (companies.CompanyId,'''+FilterFieldParam+''') FilterField from companies '+
          ' where ( GET_COMPANY_PARAM (companies.CompanyId,'''+FilterFieldParam+''') ) = 1 ';
end;

function TFrameSelectVendor.FGetSql( DBParam:TConnectDBParam; FilterFieldParam:String ):string;
begin
  if DBParam.IBDatabaseConnection <> nil then
    result := FGetSqlIB( FilterFieldParam )
  else
  if (DBParam.TypeConnect = optTypeConADO) and (DBParam.ADOConnection<>nil) then
    Result := FGetSqlAdo( FilterFieldParam );
end;

function TFrameSelectVendor.FGetSqlUpdateFilterParamIB( CompanyId, FilterFieldParam:String ):string;
begin
  result := 'EXECUTE PROCEDURE SET_COMPANY_PARAM( '+CompanyId+','+#39+FFilterFieldParam+#39+',1 )';
end;

function TFrameSelectVendor.FGetSqlUpdateFilterParamADO(CompanyId, FilterFieldParam:String ):string;
begin
  result := 'EXECUTE PROCEDURE SET_COMPANY_PARAM( '+CompanyId+','+#39+FFilterFieldParam+#39+',1 )';
end;

function TFrameSelectVendor.FGetSqlUpdateFilterParam(DBParam:TConnectDBParam; CompanyId, FilterFieldParam:String):string;
begin
  if DBParam.IBDatabaseConnection <> nil then
    result := FGetSqlUpdateFilterParamIB(CompanyId, FilterFieldParam )
  else
  if (DBParam.TypeConnect = optTypeConADO) and (DBParam.ADOConnection<>nil) then
    result := FGetSqlUpdateFilterParamADO(CompanyId, FilterFieldParam );
end;

procedure TFrameSelectVendor.FFilterSearch;
var EnterprCondition:string;
begin
  if ClientRadioGroup.ItemIndex = 1 then EnterprCondition := '='
  else EnterprCondition := '<>';
  //*****************************
  if not IsVendorCheckBox.Checked then
    ElemVendor.SetFilterOnView( [ 'IsEnterpr' ], [ 'T' ], [EnterprCondition] )
  else
    ElemVendor.SetFilterOnView( [ 'IsEnterpr', 'ISVENDOR' ], [ 'T', 'T' ], [ EnterprCondition , '=' ],fboAnd );
  //*****************************
  SearchEdit.Text := '';
  //SearchEdit.SetFocus;
  //ActiveControl := SearchEdit;
end;


procedure TFrameSelectVendor.IsVendorCheckBoxPropertiesChange(
  Sender: TObject);
begin
  FFilterSearch;
end;

procedure TFrameSelectVendor.ClientRadioGroupClick(Sender: TObject);
begin
  FFilterSearch;
end;

procedure TFrameSelectVendor.butAddVendorClick(Sender: TObject);
begin
  FUpdateVendor( True );
end;

procedure TFrameSelectVendor.butDelVendorClick(Sender: TObject);
begin
  ElemVendor.DB.Delete;
end;

procedure TFrameSelectVendor.SearchEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   ElemVendor.SetFilterOnView( [ 'NAME' ], [ SearchEdit.Text ], ['like'], fboOr );
end;

procedure TFrameSelectVendor.FUpdateVendor( isNew:Boolean );
var ParamFrame : TParamComRequisitesFrame;
    CaptEdRequisites: string;
    CurrName:string;
    SqlUpdateFilterParam:String;
begin
  if isNew then
  begin
    CurrName := UpperCase( Trim(SearchEdit.Text) );

    if not ( ElemVendor.DB.Locate('NAME',CurrName,[] ) ) then
    begin
      ElemVendor.DB.Insert;
      ElemVendor.DB.FieldByName('ISVENDOR').AsBoolean  := True;
      ElemVendor.DB.FieldByName('ISENTERPR').AsBoolean := ClientRadioGroup.ItemIndex = 1;
      ElemVendor.DB.FieldByName('ISPRIVATE').AsBoolean := ClientRadioGroup.ItemIndex = 0;
      ElemVendor.DB.FieldByName('NAME').AsString       := UpperCase( Trim(SearchEdit.Text) );
      ElemVendor.DB.Post;

      SqlUpdateFilterParam := FGetSqlUpdateFilterParam( ElemVendor.DBGetParamConnect, ElemVendor.GetValueIdStr, Self.FFilterFieldParam );
      DBUpdate(SqlUpdateFilterParam, ElemVendor.DBGetParamConnect );
    end;

    ElemVendor.SetFocusOnView;
  end;

end;

procedure TFrameSelectVendor.DestroyFrame;
begin
  FCloseElem;
end;

procedure TFrameSelectVendor.FCloseElem;
begin
  ElemVendor.Close;
end;

procedure TFrameSelectVendor.ViewCompanyVendorFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var lngName:Integer;
begin

  if Sender.Focused then
  begin
    lngName := TcxGridDBTableView( Sender ).GetColumnByFieldName('NAME').Index;
    if AFocusedRecord <> nil then
      SearchEdit.EditValue := AFocusedRecord.Values[ lngName ];
  end;


end;

end.
