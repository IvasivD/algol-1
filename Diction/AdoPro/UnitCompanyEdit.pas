unit UnitCompanyEdit;

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
  cxTextEdit, ExtCtrls, cxDBEdit, StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxCalendar, AzComboBox, Mask, DBCtrls, ComCtrls, Grids,
  Buttons,Core, cxRadioGroup, cxCheckBox, cxLookupEdit, cxDBLookupEdit,cxGridDBTableView,
  cxDBExtLookupComboBox, cxGroupBox,UnitProc, dxSkinscxPCPainter,UnitSelectTradeName,
  cxPCdxBarPopupMenu, cxPC, UnitGridView,UnitGridViewDetail,
  ImgList, DBGrids, MemTableEh, OrderUn, TourConsts, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGrid, cxMemo,UnitEditText,UnitHookControlChangeValue,
  UnitFrameCompanyPayState;

type
  TRecCompanyParamData = record
    id:Variant;
    id_ParamName:Integer;
    ParamName   :WideString;
    //ParamNameDescript :WideString;
    aValue:Variant;
  end;
  TRecCompanyParamDataArr = array of TRecCompanyParamData;

  TParamControl = record
    idParam:Integer;
    ParamName:String;
    CheckControl : TControl;
    UncheckControl:TControl;
  end;
  TParamControlArr = array of TParamControl;

  TParamElemCompanyEdit = record
    Elem_Company:TDBShemaView;
    ElemCompOrgFrmQry:TDBShemaView;
    Elem_SelTradeNameQry:TDBShemaView;
    Elem_SelCompanyByTradeNameQry:TDBShemaView;
    Elem_Emails:TDBShemaView;
    Elem_TypeDocumQry :TDBShemaView;
    Elem_CompTaxSystemLogQry : TDBShemaView;
    Elem_CurrencyMainQry : TDBShemaView;
    ElemCompaniesParamData:TDBShemaView;
    Elem_SelHeadDataQuery:TDBShema;
    Elem_SelCompAction:TDBShemaView;
    Elem_ExistCompQry :TDBShemaView;
    Elem_CompanyNotesQry :TDBShemaView;
    Elem_ExistOfficeQry :TDBShemaView;
    Elem_SelTaxSystemQry:TDBShemaView;

  end;

  TFrmCompanyEdit = class(TForm)
    CtrlPanel: TPanel;
    AddManLabel: TLabel;
    ButShowLog: TSpeedButton;
    CancelBtn: TBitBtn;
    NotWorkDBCheckBox: TcxCheckBox;
    WorkPanel: TPanel;
    PanelTop: TPanel;
    PanelFiliyaTabs: TPanel;
    PageControlFiliyaTabs: TcxPageControl;
    TabFiliya: TcxTabSheet;
    Label13: TLabel;
    HeadNameLabel: TLabel;
    Label7: TLabel;
    FiliyaFullNameEdit: TcxTextEdit;
    TabOffice: TcxTabSheet;
    OrgFormLabel: TLabel;
    Label6: TLabel;
    FullNameLabel: TLabel;
    OrgFormComboBox: TcxExtLookupComboBox;
    OrgFormInNameDBCheckBox: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    IsFiliyaDBCheckBox: TcxCheckBox;
    IsBsmanDBCheckBox: TcxCheckBox;
    RbIsEnterpr: TcxRadioButton;
    RbIsNoEnterpr: TcxRadioButton;
    ResidentRadioBtn: TcxRadioButton;
    NotResidentRadioBtn: TcxRadioButton;
    StatusGroupBox: TGroupBox;
    VendorLabel: TLabel;
    IsVendorImage: TImage;
    AgentLabel: TLabel;
    IsAgentImage: TImage;
    IsClientImage: TImage;
    ClientLabel: TLabel;
    IsTourOperImage: TImage;
    TourOperLabel: TLabel;
    NameLabel: TLabel;
    NameDBEdit: TcxTextEdit;
    CheckNameBtn: TSpeedButton;
    Panel2: TPanel;
    TradeNameLabel: TLabel;
    EditTradeNameBtn: TSpeedButton;
    DelBtn: TSpeedButton;
    TradeNameComboBox: TcxExtLookupComboBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Label21: TLabel;
    ProfilePageControl: TPageControl;
    TourismSheet: TTabSheet;
    ScheduleSheet: TTabSheet;
    WorkingHoursLabel: TLabel;
    ReceptionHoursLabel: TLabel;
    WorkingHoursEditBtn: TSpeedButton;
    ReceptionHoursEditBtn: TSpeedButton;
    WorkingHoursGrid: TStringGrid;
    ReceptionHoursGrid: TStringGrid;
    CompWarrantyGroupBox: TGroupBox;
    LicenseNoLabel: TLabel;
    WarantyTermLabel: TLabel;
    CompWarrantyLabel: TLabel;
    LicenseNoDBEdit: TcxTextEdit;
    WarrantySumDBEdit: TcxTextEdit;
    LicensePermanentRadioButton: TcxRadioButton;
    WithDateRadioButton: TcxRadioButton;
    WarantyCheckBox: TcxCheckBox;
    WarrantyValComboBox: TcxExtLookupComboBox;
    WarrantyTermDBDateEdit: TcxDateEdit;
    LicenseDateDBDateTimeEdit: TcxDateEdit;
    VipDBCheckBox: TcxCheckBox;
    BlackDBCheckBox: TcxCheckBox;
    PageCntrMemo: TcxPageControl;
    TabParamMemo: TcxTabSheet;
    TabMemo: TcxTabSheet;
    Memo: TcxMemo;
    GridParamMemoDBTableView1: TcxGridDBTableView;
    GridParamMemoLevel1: TcxGridLevel;
    GridParamMemo: TcxGrid;
    ButMemoClient: TSpeedButton;
    ButMemoVipClient: TSpeedButton;
    ButMemoBlackListClient: TSpeedButton;
    GridKindBranchDBTableView1: TcxGridDBTableView;
    GridKindBranchLevel1: TcxGridLevel;
    GridKindBranch: TcxGrid;
    Panel1: TPanel;
    butDelKindBranch: TSpeedButton;
    butAddKindBranch: TSpeedButton;
    BtnSaveData: TBitBtn;
    FrameCompanyPayState: TFrameCompanyPayState;
    procedure EditTradeNameBtnClick(Sender: TObject);
    function GetIsNetAgent: Boolean;
    function GetIsNetHeadOffice: Boolean;
    procedure OrgFormInNameDBCheckBoxPropertiesChange(Sender: TObject);
    procedure HistoryBtnClick(Sender: TObject);
    procedure ResidentRadioBtnClick(Sender: TObject);
    procedure IsFiliyaDBCheckBoxPropertiesChange(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
    procedure CheckNameBtnClick(Sender: TObject);
    procedure ButMemoVipClientClick(Sender: TObject);
    procedure ButMemoBlackListClientClick(Sender: TObject);
    procedure ButMemoClientClick(Sender: TObject);
    procedure VipDBCheckBoxClick(Sender: TObject);
    procedure BlackDBCheckBoxClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WarantyCheckBoxPropertiesChange(Sender: TObject);
    procedure IsBsmanDBCheckBoxPropertiesChange(Sender: TObject);
    procedure butAddKindBranchClick(Sender: TObject);
    procedure butDelKindBranchClick(Sender: TObject);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FrameCompanyPayStateHistoryBtnClick(Sender: TObject);
  private
    { Private declarations }
    FHookControlChangeValue : THookControlChangeValue;
    FElem_Company:TDBShemaView;
    FElemCompOrgFrmQry:TDBShemaView;
    FElemCompaniesParamData:TDBShemaView;
    FElem_SelTradeNameQry :TDBShemaView;
    FElem_SelCompanyByTradeNameQry:TDBShemaView;
    FElem_TypeDocumQry :TDBShemaView;
    //FElem_CompTaxLogMemTableEh:TDBShemaView;
    FElem_CompTaxSystemLogQry :TDBShemaView;
    FElem_CurrencyMainQry : TDBShemaView;
    FElem_SelHeadDataQuery : TDBShema;
    FElem_SelCompAction:TDBShemaView;
    FElem_ExistCompQry :TDBShemaView;
    FElem_ExistOfficeQry :TDBShemaView;
    FElem_CompanyNotesQry :TDBShemaView;
    FElem_SelTaxSystemQry:TDBShemaView;

    FElem_Emails : TDBShemaView;
    FisNew :Boolean;
    FCanUpdate :Boolean;
    FDataParam:TRecCompanyParamDataArr;

    FParamControlArr:TParamControlArr;
    //procedure FSetActualTaxSystem;
    //procedure FReadCurrTaxSystem(setNull:Boolean=false);
    Function  FCheckError:Boolean;

    procedure FActRefreshControls(Sender: TObject);
    procedure FUpdateStatusCheck;
    procedure FShowData;
    procedure FShowDataDefForNew;
    // procedure FFilStoreTaxMemData;
    //procedure FUpdateStoreTaxFromMemData;
    procedure PrepareWorkingHours;
    Function  FSaveData: boolean;
    procedure FShowDataParam( aData:TRecCompanyParamDataArr );
    function  FReadDataParamFromControls:TRecCompanyParamDataArr;
    procedure FSaveDataParam;

    procedure FShowDataOnControl(aParamControl: TParamControl);
    function  FFindParamDataByIdParam(IdParam:Integer): TParamControl;
    Procedure FShowDefDataValueAllParam;
    Procedure FPrepareShowControl(aControl:TControl;State:Boolean);
    function  FReadCurrControl( aControl:TControl ):Variant;
    procedure FPrepareFieldParam;
    procedure FPrepare(isNew:Boolean);
    procedure UpdateSelTradeNameQry( TradeId: Variant );
    procedure UpdateHeadOfficeName;
    procedure FFillTradeNameData( OldTradeId, TradeId: Integer );
    procedure FPrepareFormComponents;
    function  GetIsFiliya: Boolean;
    procedure UpdateMemo( Elem:TDBShemaView; ChControl:TcxCheckBox );
    procedure RefreshControls;
  protected
     property IsNetAgent: Boolean read GetIsNetAgent;
     property IsNetHeadOffice: Boolean read GetIsNetHeadOffice;
     property IsFiliya: Boolean read GetIsFiliya;
  public
     function GoToClient( Elem,ElemDetail:TObject  ):Boolean;
    { Public declarations }
  end;

 procedure ShowUpdateCompany( ParamElemCompanyEdit:TParamElemCompanyEdit; isNew, Update:Boolean );
 Function  ShowExistCompany(aElem_ExistCompQry, aElem_ExistOfficeQry:TDBShemaView; CompanyName, CompanyId:string;  ActGoToFind:TUpdateValueDetail= nil ) : boolean;
var
  FrmCompanyEdit: TFrmCompanyEdit;

implementation


{$R *.dfm}

procedure ShowUpdateCompany( ParamElemCompanyEdit:TParamElemCompanyEdit; isNew, Update:Boolean );
begin
  try
    Application.CreateForm(TFrmCompanyEdit, FrmCompanyEdit);
    FrmCompanyEdit.FElem_Company := ParamElemCompanyEdit.Elem_Company;
    FrmCompanyEdit.FElemCompOrgFrmQry := ParamElemCompanyEdit.ElemCompOrgFrmQry;
    FrmCompanyEdit.FElemCompaniesParamData := ParamElemCompanyEdit.ElemCompaniesParamData;
    FrmCompanyEdit.FElem_SelTradeNameQry := ParamElemCompanyEdit.Elem_SelTradeNameQry;
    FrmCompanyEdit.FElem_SelCompanyByTradeNameQry := ParamElemCompanyEdit.Elem_SelCompanyByTradeNameQry;
    FrmCompanyEdit.FElem_Emails := ParamElemCompanyEdit.Elem_Emails;
    FrmCompanyEdit.FElem_TypeDocumQry := ParamElemCompanyEdit.Elem_TypeDocumQry;
    FrmCompanyEdit.FElem_CompTaxSystemLogQry := ParamElemCompanyEdit.Elem_CompTaxSystemLogQry;
    FrmCompanyEdit.FElem_CurrencyMainQry := ParamElemCompanyEdit.Elem_CurrencyMainQry;
    FrmCompanyEdit.FElem_SelHeadDataQuery := ParamElemCompanyEdit.Elem_SelHeadDataQuery;
    FrmCompanyEdit.FElem_SelCompAction := ParamElemCompanyEdit.Elem_SelCompAction;
    FrmCompanyEdit.FElem_ExistCompQry := ParamElemCompanyEdit.Elem_ExistCompQry;
    FrmCompanyEdit.FElem_ExistOfficeQry := ParamElemCompanyEdit.Elem_ExistOfficeQry ;
    FrmCompanyEdit.FElem_CompanyNotesQry := ParamElemCompanyEdit.Elem_CompanyNotesQry;
    FrmCompanyEdit.FElem_SelTaxSystemQry := ParamElemCompanyEdit.Elem_SelTaxSystemQry;
    FrmCompanyEdit.FCanUpdate:= Update;
    FrmCompanyEdit.FisNew := isNew;

    FrmCompanyEdit.FPrepare(isNew);
    FrmCompanyEdit.ShowModal;

  finally
    FrmCompanyEdit.Free;
  end;
end;

procedure ReadDataCompanyParam( aElemCompaniesParamData:TDBShema; var aData:TRecCompanyParamDataArr );
var Len:Integer;
begin
  aElemCompaniesParamData.DB.First;

  while not aElemCompaniesParamData.DB.Eof do
  begin
    Len := Length(aData);
    SetLength(aData,len+1);

    aData[len].id := aElemCompaniesParamData.GetValueId;
    aData[len].ParamName := aElemCompaniesParamData.DB.FieldByName('NAME').asString;
    aData[len].id_ParamName := aElemCompaniesParamData.DB.FieldByName('ID_COMPANIES_PARAM_NAME').AsInteger;
    //aData[len].ParamNameDescript:= aElemCompaniesParamData.DB.FieldByName('descript').asString;
    aData[len].aValue := aElemCompaniesParamData.DB.FieldByName('AVALUE').asInteger;

    aElemCompaniesParamData.DB.Next;
  end;
end;

procedure SaveDataParam( aData:TRecCompanyParamDataArr; aElemCompaniesParamData:TDBShema );
var i:Integer;
begin
  for i:=0 to Length(aData)-1 do
  begin

    if aData[i].aValue <> null then
    begin
      if not aElemCompaniesParamData.DB.Locate('ID_COMPANIES_PARAM_NAME', aData[i].id_ParamName, []) then
        aElemCompaniesParamData.DB.Insert
      else aElemCompaniesParamData.DB.Edit;

      aElemCompaniesParamData.DB.FieldByName('ID_COMPANIES_PARAM_NAME').asInteger := aData[i].id_ParamName;
      aElemCompaniesParamData.DB.FieldByName('AVALUE').asInteger := aData[i].aValue;

      aElemCompaniesParamData.DB.Post;
    end
    else
    begin
      if aElemCompaniesParamData.DB.Locate('ID_COMPANIES_PARAM_NAME', aData[i].id_ParamName, []) then
         aElemCompaniesParamData.DBDelete(False);
    end;

  end;
end;

Function ShowExistCompany( aElem_ExistCompQry, aElem_ExistOfficeQry:TDBShemaView; CompanyName, CompanyId:string; ActGoToFind:TUpdateValueDetail= nil ) : boolean;
var CompEditPanlel:TPanelEdit;
    OfficeEditPanlel:TPanelEdit;
    butOkModProperty:TButModalProperty;
    butCancelModProperty:TButModalProperty;
    ResGridDetail:TResGridViewDetail;
begin
  aElem_ExistCompQry.DBQuerySetParamValue( 'Name', '%'+AnsiLowerCase( CompanyName )+'%' );
  aElem_ExistCompQry.DBQuerySetParamValue( 'CompanyId', CompanyId );
  aElem_ExistCompQry.DBOpen;
  if aElem_ExistCompQry.DBRecordCount = 0 then
    result := False
  else
  begin
     CompEditPanlel := GetEmptyPanelEdit( [False,False,False] );
     OfficeEditPanlel := GetEmptyPanelEdit( [False,False,False] );

     if @ActGoToFind <> nil then
     begin
       butOkModProperty := GetDefButModProperty('Перейти');
       butOkModProperty.ImgListIndex := 0;
       butOkModProperty.Action := ActGoToFind;
     end else butOkModProperty := GetDefButModProperty('');

     butCancelModProperty := GetDefButModProperty('Закрити');
     ResGridDetail:= ShowGridViewDetail( 'Контроль назви', aElem_ExistCompQry, aElem_ExistOfficeQry,
                                         CompEditPanlel, OfficeEditPanlel, butOkModProperty, butCancelModProperty );
     if ResGridDetail.ElemId <> null then
       result := True;
  end;
end;

function TFrmCompanyEdit.GoToClient( Elem,ElemDetail:TObject ):Boolean;
begin
  result := False;
  if (Self.FisNew)and(MyShowMessageDlg( 'Введені дані з форми будуть втрачені?'+#13#10+
                                        'Збережіть їх або підтвердіть перехід до знайденого партнера.' , mtConfirmation, but_YES_NO ) <> Res_YES) then exit;

  if FElem_Company.DB.Locate( FElem_Company.FieldKod, TDBShema(Elem).DB.FieldByName('COMPANYID').value,[] ) then
  begin
    FElem_Company.SetFocusOnView;
    FPrepare( false );
  end;
  
  result := True;
end;

procedure TFrmCompanyEdit.FPrepareFieldParam;
procedure AddParamControl( ParamId:Integer; ParamName:string; CheckControl:TControl; UncheckControl:TControl= nil );
var len:Integer;
begin
  Len := Length(FParamControlArr);
  SetLength( FParamControlArr, len +1);
  FParamControlArr[len].idParam := ParamId;
  FParamControlArr[len].ParamName := ParamName;
  FParamControlArr[len].CheckControl := CheckControl;
  FParamControlArr[len].UncheckControl := UncheckControl;
end;
//*************************************
begin
  {AddParamControl(  1,'ISVENDOR', IsVendorImage );
  AddParamControl( 18,'ISAGENT',  IsAgentImage );
  AddParamControl(  2,'ISCLIENT', IsClientImage );
  AddParamControl( 72,'ISTOUROPER', IsTourOperImage ); }

  //AddParamControl( 13,'ISENTERPR', RbIsEnterpr, RbIsNoEnterpr );
  //AddParamControl( 80,'ISFILIYA', IsFiliyaDBCheckBox );
  //AddParamControl( 47,'ISBSMAN', IsBsmanDBCheckBox );

  //AddParamControl( 11,'ASTOURS', AsToursDBCheckBox );
  //AddParamControl( 81,'ISHEADOFFICE', HeadOffDBCheckBox );
  // AddParamControl( 76,'ASNETAGENT', AsNetAgentDBCheckBox );
  {AddParamControl(  4,'ASHOTEL', AsHotelDBCheckBox );
  AddParamControl(  3,'ASDRIVE', AsDriveDBCheckBox );
  AddParamControl( 23,'ASFOODS', AsFoodsDBCheckBox );
  AddParamControl( 10,'ASTICKT', AsTicktDBCheckBox );
  AddParamControl(  5,'ASVISAS', AsVisasDBCheckBox );

  AddParamControl( 7,'ASEXCRS', AsExcrsDBCheckBox );
  AddParamControl( 49,'ASGUIDE', AsGuideDBCheckBox );
  AddParamControl( 25,'ASMEDIC', AsMedicDBCheckBox );
  AddParamControl( 6,'ASINSUR', AsInsurDBCheckBox );
  AddParamControl( 27,'ASRECRE', AsRecreDBCheckBox );
  AddParamControl( 30,'ASMUSEM', AsMusemDBCheckBox );
  AddParamControl( 28,'ASEXTRM', AsExtrmDBCheckBox );

  AddParamControl( 15,'ASSCOLL', AsScollDBCheckBox );
  AddParamControl( 79,'ASAUPAIR',AsAuPairDBCheckBox );
  AddParamControl( 17,'ASEMPLS',AsEmplsDBCheckBox );
  AddParamControl( 70,'ASPARSE',AsParseDBCheckBox );
  AddParamControl( 31,'ASXHIBT',AsXhibtDBCheckBox );
  AddParamControl( 32,'ASAMBAS',AsAmbasDBCheckBox );
  AddParamControl( 16,'ASAPAIR',AsAPairDBCheckBox );

  AddParamControl( 33,'ASCOMMC', AsCommcDBCheckBox );
  AddParamControl( 34,'ASCMPTR', AsCmptrDBCheckBox );
  AddParamControl( 35,'ASSTNRY', AsStnryDBCheckBox );
  AddParamControl( 36,'ASFURNT', AsFurntDBCheckBox );
  AddParamControl( 37,'ASGOODS', AsGoodsDBCheckBox );
  AddParamControl( 38,'ASPETRL', AsPetrlDBCheckBox );

  AddParamControl( 39,'ASMEDIA', AsMediaDBCheckBox );
  AddParamControl( 8,'ASREKLM', AsReklmDBCheckBox );
  AddParamControl( 43,'ASLEASE', AsLeaseDBCheckBox );
  AddParamControl( 24,'ASURIST', AsUristDBCheckBox );
  AddParamControl( 40,'ASCONSL', AsConslDBCheckBox );
  AddParamControl( 41,'ASGUARD', AsGuardDBCheckBox );
  AddParamControl( 67,'BUS17',   Bus17DBCheckBox );

  AddParamControl( 42,'ASBANKS',  AsBanksDBCheckBox );
  AddParamControl( 20,'ISGOVERN', IsGovernDBCheckBox );
  AddParamControl( 44,'ASKOMUN',  AsKomunDBCheckBox );
  AddParamControl( 45,'ASBUILD',  AsBuildDBCheckBox );
  AddParamControl( 46,'ASMASTR',  AsMastrDBCheckBox );
  AddParamControl( 48,'ASPARSL',  AsParslDBCheckBox );
  AddParamControl( 9 ,'ASOTHER',  AsOtherDBCheckBox );}

  AddParamControl( 73 ,'VIPCLIENT', VipDBCheckBox );
  AddParamControl( 74 ,'BLACKLIST', BlackDBCheckBox );
  AddParamControl( 82 ,'NOTWORK',   NotWorkDBCheckBox );
  AddParamControl( 75 ,'LICENSETERMIN', WithDateRadioButton,LicensePermanentRadioButton );
  //AddParamControl( 85 ,'ASRESIDENT', ResidentRadioBtn, NotResidentRadioBtn );
end;

function TFrmCompanyEdit.FFindParamDataByIdParam( IdParam:Integer ) : TParamControl;
var i:integer;
begin
  Result.idParam := -1;
  for i:=0 to Length(self.FParamControlArr)-1 do
  begin
    if self.FParamControlArr[i].idParam = IdParam then
    begin
      Result := self.FParamControlArr[i];
      break;
    end;
  end;
end;

Procedure TFrmCompanyEdit.FPrepareShowControl( aControl:TControl; State:Boolean );
var Ev:TNotifyEvent;
begin
if aControl <> nil then
  begin
    if aControl is TcxCheckBox then
    begin
      try
        Ev := TcxCheckBox( aControl ).OnClick;
        TcxCheckBox( aControl ).OnClick := nil;
        TcxCheckBox( aControl ).Checked := State;
      finally
        TcxCheckBox( aControl ).OnClick := Ev;
      end;
    end;
    //********************
    if aControl is TcxRadioButton then
    begin
      try
        Ev := TcxRadioButton( aControl ).OnClick;
        TcxRadioButton( aControl ).OnClick := nil;
        TcxRadioButton( aControl ).Checked := State;
      finally
        TcxRadioButton( aControl ).OnClick := Ev;
      end;
    end;
    //********************
    if aControl is TImage then TImage( aControl ).Visible := State;
  end;
end;

function TFrmCompanyEdit.FReadCurrControl( aControl:TControl ):Variant;
begin
if aControl <> nil then
  begin
    if aControl is TcxCheckBox then result := MyIfThen( TcxCheckBox( aControl ).Checked, 1,null);
    if aControl is TcxRadioButton then result :=  MyIfThen( TcxRadioButton( aControl ).Checked, 1, null);
    if aControl is TImage then result :=  MyIfThen(  TImage( aControl ).Visible, 1, null);
  end;
end;

Procedure TFrmCompanyEdit.FShowDefDataValueAllParam;
var i:integer;
begin
  for i:=0 to Length(self.FParamControlArr)-1 do
    if self.FParamControlArr[i].UncheckControl <> nil then
      FPrepareShowControl( self.FParamControlArr[i].UncheckControl , True );
end;

procedure TFrmCompanyEdit.FShowDataOnControl( aParamControl: TParamControl );
begin
  FPrepareShowControl( aParamControl.CheckControl, True );
  FPrepareShowControl( aParamControl.UncheckControl, False );
end;

procedure TFrmCompanyEdit.FShowDataParam( aData:TRecCompanyParamDataArr );
var i:Integer;
    CurrParamControl: TParamControl;
begin
  FShowDefDataValueAllParam;

  for i:=0 to Length(aData)-1 do
  begin
    CurrParamControl := FFindParamDataByIdParam( aData[i].id_ParamName );
    if CurrParamControl.idParam <>-1 then
      FShowDataOnControl( CurrParamControl );
  end;
end;

function TFrmCompanyEdit.FReadDataParamFromControls:TRecCompanyParamDataArr;
var i:Integer;
    Len : Integer;
    CurraValue:Variant;
begin
  for i:=0 to Length(self.FParamControlArr)-1 do
  begin
   CurraValue:= FReadCurrControl( self.FParamControlArr[i].CheckControl );

   Len := Length(Result);
   SetLength(Result,Len+1);

   Result[len].id_ParamName:=self.FParamControlArr[i].idParam;
   Result[len].ParamName:=self.FParamControlArr[i].ParamName;
   Result[len].aValue:=CurraValue;
  end;
end;

function CheckUnicalIdentCode( ConDBParam:TConnectDBParam; aCompanyId, aIdentCode:String ):Boolean;
var Sql:string;
begin
  Sql := 'Select CompanyId from  Companies where CompanyId <> '+aCompanyId+' and IdentCode = '+#39+aIdentCode+#39;
  if DBGetValue( ConDBParam, Sql, 'CompanyId' ) = null then
    result := True
  else result := False;
end;

Function TFrmCompanyEdit.FCheckError:Boolean;
var ErrMess:Widestring;
begin
  result := True;
  ErrMess:='';
  {if (AsToursDBCheckBox.Checked) then
  begin
    if Trim(IdentCodeDBEdit.Text) ='' then ErrMess := 'Вкажіть '+IdentCodeLabel.Caption
    else 
    if (not CheckUnicalIdentCode( FElem_Company.DBGetParamConnect, FElem_Company.GetValueIdStr, IdentCodeDBEdit.Text )) then
      ErrMess := 'Партнер в якого '+IdentCodeLabel.Caption+' " '+IdentCodeDBEdit.Text+' " вже знайдено в базі.';

    result := False;
  end;}

  if (ErrMess<>'') then MyShowMessageDlg( ErrMess, mtError, but_Ok );
end;

procedure TFrmCompanyEdit.FShowDataDefForNew;
begin
  ResidentRadioBtn.Checked := True;
  RbIsEnterpr.Checked := True;
end;

procedure TFrmCompanyEdit.FUpdateStatusCheck;
begin
  IsVendorImage.Visible := FElem_Company.DBBooleanValue['ISVENDOR'];
  IsAgentImage.Visible :=  FElem_Company.DBBooleanValue['ISAGENT'];
  IsClientImage.Visible := FElem_Company.DBBooleanValue['ISCLIENT'];
  IsTourOperImage.Visible := FElem_Company.DBBooleanValue['ISTOUROPER'];
end;

procedure TFrmCompanyEdit.FShowData;
begin
  FUpdateStatusCheck;

  if ( FElem_Company.DBBooleanValue['ASRESIDENT']) or
     ( FElem_Company.DB.FieldByName('ASRESIDENT').IsNull ) then
    ResidentRadioBtn.Checked := True
  else NotResidentRadioBtn.Checked := True;

  if FElem_Company.DBBooleanValue['ISENTERPR'] then RbIsEnterpr.Checked := True
  else RbIsNoEnterpr.Checked := True;

  IsFiliyaDBCheckBox.Checked := FElem_Company.DBBooleanValue['ISFILIYA'];
  IsBsmanDBCheckBox.Checked := FElem_Company.DBBooleanValue['ISBSMAN'];

  NameDBEdit.EditValue:= FElem_Company.DB.FieldByName('NAME').AsString;
  FiliyaFullNameEdit.EditValue := FElem_Company.DB.FieldByName('FULLNAME').AsString;

  FullNameLabel.Caption := FElem_Company.DB.FieldByName('FULLNAME').AsString; //DMServ.CompanyTableFULLNAME.AsString;
  FullNameLabel.Hint := FullNameLabel.Caption;

  OrgFormComboBox.EditValue := FElem_Company.DB.FieldByName('ORGFORMID').Value;
  TradeNameComboBox.EditValue := FElem_Company.DB.FieldByName('TRADENAMEID').value;
  Memo.EditValue := FElem_Company.DB.FieldByName('Memo').value;

  //if FrameCompanyPayState.ItsActionComboBox.Visible then FrameCompanyPayState.ItsActionComboBox.EditValue := FElem_Company.DB.FieldByName('ACTIONID').value
  //else FrameCompanyPayState.ItsActionComboBox.EditValue:=null;

  if WarrantySumDBEdit.Enabled then
    WarrantySumDBEdit.EditValue := FElem_Company.DB.FieldByName('WARRANTYSUM').Value
  else  WarrantySumDBEdit.Clear;

  if WarrantyValComboBox.Enabled then
    WarrantyValComboBox.EditValue := FElem_Company.DB.FieldByName('WARRANTYVAL').AsInteger
  else WarrantyValComboBox.EditValue := null;

  UpdateHeadOfficeName;
  FrameCompanyPayState.ShowData;
end;

procedure TFrmCompanyEdit.PrepareWorkingHours;
var I: Integer;
begin
  with WorkingHoursGrid do
  begin
    for I := 2 to 7 do Cells[Pred(I), 0] := LongDayNames[I];
    Cells[7, 0] := LongDayNames[1];
    Cells[0, 1] := SCompFrmWorkingHours;
    Cells[0, 2] := SCompFrmDinnerHours;
  end;
  with ReceptionHoursGrid do
  begin
    Cells[0, 0] := SCompFrmReceptionHours;
    Cells[0, 1] := SCompFrmDinnerHours;
  end;
end;

Function TFrmCompanyEdit.FSaveData: boolean;
begin
  result := False;
  if not FCheckError then Exit;

  //FUpdateStoreTaxFromMemData;

  if FisNew then
    FElem_Company.DB.Insert
  else FElem_Company.DB.Edit;

  FElem_Company.DB.FieldByName('NAME').AsString := NameDBEdit.EditValue;
  FElem_Company.DB.FieldByName('FULLNAME').AsString := FiliyaFullNameEdit.EditValue;
  FElem_Company.DB.FieldByName('ORGFORMID').value:= OrgFormComboBox.EditValue;
  FElem_Company.DB.FieldByName('TRADENAMEID').value :=  TradeNameComboBox.EditValue;
  FElem_Company.DB.FieldByName('TRADENAMEID').value :=  TradeNameComboBox.EditValue;
  FElem_Company.DB.FieldByName('Memo').value :=  Memo.EditValue;

  FrameCompanyPayState.SetUpdateDataToDBCompany;
  {if FrameCompanyPayState.ItsActionComboBox.Visible then FElem_Company.DB.FieldByName('ACTIONID').value := FrameCompanyPayState.ItsActionComboBox.EditValue
  else FElem_Company.DB.FieldByName('ACTIONID').value:=null;

  if ReestrComboBox.Enabled then
    FElem_Company.DB.FieldByName('GOVREESTRTYPEID').value := ReestrComboBox.EditValue
  else FElem_Company.DB.FieldByName('GOVREESTRTYPEID').value := null; }

  {if ReestrDateDateEdit.Enabled then
    FElem_Company.DB.FieldByName('GOVREESTRDATE').Value := null
  else
    if ReestrDateDateEdit.EditValue <> null then
       FElem_Company.DB.FieldByName('GOVREESTRDATE').Value := ReestrDateDateEdit.Date; }

 { if SingleTaxComboBox.Enabled then
    FElem_Company.DB.FieldByName('SINGLETAXTYPEID').Value := SingleTaxComboBox.EditValue
  else FElem_Company.DB.FieldByName('SINGLETAXTYPEID').Value := null;  }

  {if TaxPayTypeIdComboBox.Enabled then
    FElem_Company.DB.FieldByName('TAXPAYTYPEID').Value := TaxPayTypeIdComboBox.EditValue
  else FElem_Company.DB.FieldByName('TAXPAYTYPEID').Clear; }

  //FElem_Company.DB.FieldByName('TAXPAYSTATEID').Value := TaxPayStateComboBox.EditValue;

  FElem_Company.DB.Post;
  FSaveDataParam;
  FHookControlChangeValue.IsChange := False;
  FisNew := False;
  result := True;
  Self.RefreshControls;
end;

procedure TFrmCompanyEdit.FSaveDataParam;
var DataParam:TRecCompanyParamDataArr;
begin
  DataParam := self.FReadDataParamFromControls;
  SaveDataParam( DataParam, self.FElemCompaniesParamData );
end;

procedure TFrmCompanyEdit.FPrepareFormComponents;
begin
  PageControlFiliyaTabs.Properties.HideTabs:=True;
  PanelFiliyaTabs.Height := 48;
  PanelTop.Height := 160;
  self.Height := self.Height - 14;
end;

procedure TFrmCompanyEdit.FPrepare(isNew:Boolean);
var ElemCompanyParam:TParamCompanyPayState;
begin
  FisNew := isNew;
  self.FElemCompOrgFrmQry.DBOpen;
  self.FElemCompaniesParamData.DBOpen;
  FElem_SelTradeNameQry.DBOpen;
  FElem_CompTaxSystemLogQry.DBOpen;
  //FElem_CompTaxLogMemTableEh.DBOpen;
  FElem_CurrencyMainQry.DBOpen;
  FElem_SelHeadDataQuery.DBOpen;
  FElem_SelCompAction.DBOpen;
  FElem_TypeDocumQry.DBOpen;
  FElem_CompanyNotesQry.DBOpen;
  FElem_SelTaxSystemQry.DBOpen;
  
  //FFilStoreTaxMemData;

  FPrepareFormComponents;
  SetPropInCxExtLookupComboBox( OrgFormComboBox,TcxGridDBTableView( FElemCompOrgFrmQry.ViewList ) ,'NAME', FElemCompOrgFrmQry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( TradeNameComboBox,TcxGridDBTableView( FElem_SelTradeNameQry.ViewList ) ,'TRADENAME', FElem_SelTradeNameQry.FieldKod, True, false );
  SetPropInCxExtLookupComboBox( WarrantyValComboBox, TcxGridDBTableView( FElem_CurrencyMainQry.ViewList ), 'CURRENCYSHORT', FElem_CurrencyMainQry.FieldKod , True, False);

  GridKindBranch.Levels[0].GridView :=FElemCompaniesParamData.ViewList;
  TcxGridDBTableView(GridKindBranch.Levels[0].GridView).DataController.GotoFirst;

  FElemCompaniesParamData.SetFilterOnViewList(['atype'],[0],['>=']);

  ElemCompanyParam.ElemCompany := FElem_Company;
  ElemCompanyParam.ElemCompTaxSystemLogQry := FElem_CompTaxSystemLogQry;
  ElemCompanyParam.ElemTypeDocumQry := FElem_TypeDocumQry;
  ElemCompanyParam.ElemSelCompAction := FElem_SelCompAction;
  ElemCompanyParam.ElemSelTaxSystemQry := FElem_SelTaxSystemQry;

  FrameCompanyPayState.IntitFrame( ElemCompanyParam, Self.FCanUpdate );

  if not isNew then
  begin
    FPrepareFieldParam;
    ReadDataCompanyParam( self.FElemCompaniesParamData, FDataParam );
    FShowDataParam( FDataParam );
    FShowData;
  end
   else FShowDataDefForNew;

  PrepareWorkingHours;
  RefreshControls;
  PageCntrMemo.HideTabs := True;

  FHookControlChangeValue := THookControlChangeValue.Create(self, FActRefreshControls );
  FHookControlChangeValue.AddControl( FrameCompanyPayState );
end;

procedure TFrmCompanyEdit.UpdateSelTradeNameQry( TradeId: Variant );
begin
  TradeNameComboBox.EditValue := TradeId;
end;

procedure TFrmCompanyEdit.UpdateHeadOfficeName;
begin
  HeadNameLabel.Caption := FElem_SelHeadDataQuery.DB.FieldByName('NAME').asString;
end;

procedure TFrmCompanyEdit.FFillTradeNameData( OldTradeId, TradeId: Integer );
var IsNetAgency: Boolean;
begin
  UpdateSelTradeNameQry(TradeId);
end;


procedure TFrmCompanyEdit.EditTradeNameBtnClick(Sender: TObject);
var TradeId, OldTradeId: Integer;
begin
  ShowSelectTradeName( FElem_SelTradeNameQry, FElem_SelCompanyByTradeNameQry, FElem_Emails,
                       IsNetAgent, IsNetHeadOffice, TradeId );
  RefreshControls;
end;

function TFrmCompanyEdit.GetIsNetAgent: Boolean;
begin
  Result := IsAgentImage.Visible;
end;

function TFrmCompanyEdit.GetIsNetHeadOffice: Boolean;
begin
  result:= FElemCompaniesParamData.DB.Locate('NAME','ISHEADOFFICE',[]);
end;

function TFrmCompanyEdit.GetIsFiliya: Boolean;
begin
  result:= FElemCompaniesParamData.DB.Locate('NAME','ISFILIYA',[]);
end;

procedure TFrmCompanyEdit.RefreshControls;
begin
  CheckNameBtn.Enabled := (self.FisNew) and (FCanUpdate);
  OrgFormComboBox.Enabled := (ResidentRadioBtn.Checked) and (RbIsEnterpr.Checked) and (not OrgFormInNameDBCheckBox.Checked)and FCanUpdate;
  FiliyaFullNameEdit.Enabled:= ( ResidentRadioBtn.Checked ) and  ( FCanUpdate );
  IsBsmanDBCheckBox.Enabled := ( RbIsNoEnterpr.Checked ) and ( FCanUpdate );

  FrameCompanyPayState.RefreshControls( RbIsEnterpr.Checked,ResidentRadioBtn.Checked,FCanUpdate );
  WarrantySumDBEdit.Enabled := (WarantyCheckBox.Checked) and  ( FCanUpdate );

  EditTradeNameBtn.Enabled := ( FCanUpdate );
  WarantyCheckBox.Enabled := {(AsToursDBCheckBox.Checked) and} (ResidentRadioBtn.Checked) and  ( FCanUpdate );
  WarrantySumDBEdit.Enabled := (WarantyCheckBox.Checked) {and (AsToursDBCheckBox.Checked)} and ResidentRadioBtn.Checked and  ( FCanUpdate );
  WarrantyValComboBox.Enabled:= (WarantyCheckBox.Checked) {and (AsToursDBCheckBox.Checked)} and ResidentRadioBtn.Checked and  ( FCanUpdate );
  WarrantyTermDBDateEdit.Enabled := (WarantyCheckBox.Checked) {and (AsToursDBCheckBox.Checked)} and  ( FCanUpdate );

  //FrameCompanyPayState.HistoryBtn.Enabled :=  (ResidentRadioBtn.Checked) and  ( FCanUpdate );
  LicenseNoDBEdit.Enabled := {(AsToursDBCheckBox.Checked) and } ( FCanUpdate );
  LicensePermanentRadioButton.Enabled := {(AsToursDBCheckBox.Checked) and}  ( FCanUpdate );
  WithDateRadioButton.Enabled := {(AsToursDBCheckBox.Checked) and } ( FCanUpdate );
  LicenseDateDBDateTimeEdit.Enabled := (WithDateRadioButton.Checked) and  ( FCanUpdate );
  DelBtn.Enabled := (TradeNameComboBox.EditValue<>null) and  ( FCanUpdate );
  IsFiliyaDBCheckBox.Enabled := False;

  if ButMemoClient.Down then PageCntrMemo.ActivePage := TabMemo
  else PageCntrMemo.ActivePage := TabParamMemo;

  if ButMemoVipClient.Down then
  begin
    self.FElem_CompanyNotesQry.SetFilterOnView(['VIP'],[null],['<>']);
    self.FElem_CompanyNotesQry.SetFocusOnView;
  end
  else
   if ButMemoBlackListClient.Down then
   begin
     self.FElem_CompanyNotesQry.SetFilterOnView(['BLACKLIST'],[null],['<>']);
     self.FElem_CompanyNotesQry.SetFocusOnView;
   end
   else self.FElem_CompanyNotesQry.ClearFilterOnView;

  if not FCanUpdate then
  begin
    SetEnabledChildControls( Self, FCanUpdate,[ ],[ TPageControl, TPanel ] );
    CancelBtn.Enabled := True;
  end;
  butAddKindBranch.Enabled :=  ( FCanUpdate ) and ( not self.FisNew );
  butDelKindBranch.Enabled :=  ( TcxGridDBTableView(GridKindBranch.Levels[0].GridView).ViewData.RowCount <> 0) and
                               ( FCanUpdate ) and ( not self.FisNew );

  if Self.FHookControlChangeValue <> nil then
    BtnSaveData.Enabled := Self.FHookControlChangeValue.IsChange
  else BtnSaveData.Enabled := False;
end;

procedure TFrmCompanyEdit.OrgFormInNameDBCheckBoxPropertiesChange(
  Sender: TObject);
begin
  if OrgFormInNameDBCheckBox.Checked then
    OrgFormComboBox.EditValue := null;

  RefreshControls;
end;

procedure TFrmCompanyEdit.HistoryBtnClick(Sender: TObject);
var PanelEdit:TPanelEdit;
    TaxPayStateId:Variant;
    butOk:TButModalProperty;
begin

end;

procedure TFrmCompanyEdit.ResidentRadioBtnClick(Sender: TObject);
begin
  if  RbIsEnterpr.Checked then isBsmanDBCheckBox.Checked :=False;
  if RbIsNoEnterpr.Checked then OrgFormComboBox.EditValue := null;
  RefreshControls;
end;

procedure TFrmCompanyEdit.IsFiliyaDBCheckBoxPropertiesChange(
  Sender: TObject);
begin
  //WarantyCheckBox.Checked := AsToursDBCheckBox.Checked;
  RefreshControls;
end;

procedure TFrmCompanyEdit.WarantyCheckBoxPropertiesChange(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmCompanyEdit.IsBsmanDBCheckBoxPropertiesChange(
  Sender: TObject);
begin
  if ( RbIsNoEnterpr.Checked ) and (IsBsmanDBCheckBox.Checked ) then
    OrgFormComboBox.EditValue := 770
  else OrgFormComboBox.EditValue := null;

  RefreshControls;
end;

procedure TFrmCompanyEdit.DelBtnClick(Sender: TObject);
begin
  if MyShowMessageDlg(Format('Ви дійсно хочете видалити %s?', [TradeOrNetNameArr3[IsNetHeadOffice or IsNetAgent]]) , mtConfirmation, but_YES_NO ) = Res_YES then
  begin
    TradeNameComboBox.EditValue := null;
    RefreshControls;
  end;
end;

procedure TFrmCompanyEdit.CheckNameBtnClick(Sender: TObject);
begin
  ShowExistCompany( FElem_ExistCompQry, FElem_ExistOfficeQry, NameDBEdit.Text,FElem_Company.GetValueIdStr, GoToClient );
end;

procedure TFrmCompanyEdit.ButMemoVipClientClick(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmCompanyEdit.ButMemoBlackListClientClick(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmCompanyEdit.ButMemoClientClick(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmCompanyEdit.UpdateMemo( Elem:TDBShemaView; ChControl:TcxCheckBox );
var aText:widestring;
    Ev:TnotifyEvent;
begin
  try
    Ev := ChControl.OnClick;
    ChControl.OnClick := nil;
    RefreshControls;

    aText := ShowEditText('','Введіть примітку');
    if aText<>'^' then
    begin
      Elem.DB.Insert;

      if ChControl.Tag = 0 then
        Elem.DBBooleanValue['VIP'] := ChControl.Checked
      else
        if ChControl.Tag = 1 then
          Elem.DBBooleanValue['BLACKLIST'] := ChControl.Checked;

      Elem.DB.FieldByName('MEMO').AsString := aText;
      Elem.DB.FieldByName('ADDDATE').AsDateTime := Now;

      Elem.DB.Post;
    end
    else
      ChControl.Checked :=  not ChControl.Checked;
  finally
    ChControl.OnClick := Ev;
  end;
  RefreshControls;
end;

procedure TFrmCompanyEdit.VipDBCheckBoxClick(Sender: TObject);
begin
  ButMemoVipClient.Down := True;
  UpdateMemo( self.FElem_CompanyNotesQry, TcxCheckBox(Sender) );
end;

procedure TFrmCompanyEdit.BlackDBCheckBoxClick(Sender: TObject);
begin
  ButMemoBlackListClient.Down := True;
  UpdateMemo( self.FElem_CompanyNotesQry, TcxCheckBox(Sender) );
end;

procedure TFrmCompanyEdit.FormDestroy(Sender: TObject);
begin
  FHookControlChangeValue.Close;
end;

procedure TFrmCompanyEdit.butAddKindBranchClick(Sender: TObject);
begin
  FElemCompaniesParamData.DBInsertByListView;
  FElemCompaniesParamData.Requery;
  RefreshControls;
end;

procedure TFrmCompanyEdit.butDelKindBranchClick(Sender: TObject);
begin
  FElemCompaniesParamData.DBDelete(True);
  RefreshControls;
end;

procedure TFrmCompanyEdit.FActRefreshControls(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmCompanyEdit.BtnSaveDataClick(Sender: TObject);
begin
  FSaveData;
end;

procedure TFrmCompanyEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
       CanClose := self.FSaveData;
end;

procedure TFrmCompanyEdit.FormShow(Sender: TObject);
begin
  FElemCompaniesParamData.SetFocusOnView( TcxGridDBTableView( GridKindBranch.Levels[0].GridView ) );
  PositionFormCenterFromMainForm( self );
end;

procedure TFrmCompanyEdit.FrameCompanyPayStateHistoryBtnClick(
  Sender: TObject);
var isChange:Boolean;
begin
  isChange := self.FHookControlChangeValue.IsChange;
  FrameCompanyPayState.HistoryBtnClick(Sender);
  self.FHookControlChangeValue.IsChange := isChange;
  RefreshControls;
end;

end.



FORWORK = True   якщо

AsCommcDBCheckBox.Field.AsBoolean
    or AsCmptrDBCheckBox.Field.AsBoolean or AsPetrlDBCheckBox.Field.AsBoolean
    or AsKomunDBCheckBox.Field.AsBoolean or AsFurntDBCheckBox.Field.AsBoolean
    or AsGuardDBCheckBox.Field.AsBoolean or AsMediaDBCheckBox.Field.AsBoolean
    or AsReklmDBCheckBox.Field.AsBoolean or AsUristDBCheckBox.Field.AsBoolean
    or AsLeaseDBCheckBox.Field.AsBoolean or AsParslDBCheckBox.Field.AsBoolean
    or AsBuildDBCheckBox.Field.AsBoolean or AsStnryDBCheckBox.Field.AsBoolean
    or AsBanksDBCheckBox.Field.AsBoolean or AsConslDBCheckBox.Field.AsBoolean
    or AsGoodsDBCheckBox.Field.AsBoolean or AsMastrDBCheckBox.Field.AsBoolean;

