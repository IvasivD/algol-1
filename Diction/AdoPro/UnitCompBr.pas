unit UnitCompBr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,cxGridDBDataDefinitions,
  cxGridTableView, cxGridDBTableView, cxGrid,ServMod, cxContainer,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxCheckBox,
  cxTextEdit, cxDropDownEdit, cxMaskEdit, cxImageComboBox, dxBevel,
  ComCtrls, ToolWin, DBCtrls, Mask, ImgList,ServModIB,TourUnts,Core,OrderUn,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, DragDrop, Menus,UnitProc,ActnList,
  DropTarget, DragDropText,FrmProgress,OptSet,TourStrMag, UnitFrameAddress,
  AddrDlg,MailSend_Frm,TourConsts,TourCmnlIf, UnitContractEditForm,
  UnitPreviewFiles, UnitIBQuery,UnitADOQuery, ADODB, IBQuery,
  UnitCompanyEdit,UnitExportWord, UnitFrameComRequisites, ServUn,
  cxGroupBox ;

  Const

  nPriCount = 5;
  nSecCount = 20;
  nTrdCount = 4;

  DogCategoryName: array[0..nContrCategoryCount] of string =('',
   'Не є агентом', 'Закінчився термін дії угоди',
   'Передзвонити після "дати"', 'Дату дзвінка протерміновано',
   'Документи надійдуть до "дати"', 'Дату надходження док. протерміновано',
   'Внесено всі реквізити', 'Угоду згенеровано',
   'Дозволено перереєстрацію угоди', 'Перегенерована угода',
   'Угоду надіслано мейлом', 'Копію угоди приєднано',
   'Термін роботи з копією угоди продовжено',
   'Угоду роздруковано', 'Угоду підписано',
   'Угоду надіслано поштою', 'Оригінал не отримано більше 3 тижнів',
   'Оригінал надішлють до "дати"', 'Дату надходження оригіналу протерміновано',
   'Зареєстровано отримання оригіналу',
   'Відмова партнера укладати угоду');
  DocCategoryItem: array[0..nContrCategoryCount] of Integer = (-2,
    -1, 0, 1, 101, 2, 102, 3, 4, 5, 6, 7, 12, 17, 18, 19, 20, 21, 22, 122, 23, 24);

  ExportCategoryName: array[0..nExportCategoryCount] of string =('',
   'Не є нашим агентом або є агентом і не має сайту', 'Агент, є сайт, не було експорту',
   'Передзвонити після "дати"', 'Дату дзвінка протерміновано',
   'Розмістять тури до "дати"', 'Дату розміщення турів протерміновано',
   'Агент зняв з сайту наші тури', 'Наші тури розміщені на сайті агента',
   'Відправили мейл із переліком недоліків',
   'Виправлять недоліки до "дати"', 'Дату виправлення недоліків протерміновано',
   'Агент має додаткові 4%', 'Агент не хоче додаткові 4%',
   'Агент зняв наші тури та відмовився їх розміщувати',
   'Агент відмовився розміщувати наші тури');
  ExportCategoryItem: array[0..nExportCategoryCount] of Integer = (
    -1, 0, 100, 1, 101, 2, 102, 3, 4, 5, 6, 106, 7, 8, 9, 10);

  sPriFlds: array[0..nPriCount] of String = ('',
    'ISAGENT', 'ISCLIENT', 'ISVENDOR', 'ISTOUROPER', 'ISOTHER');
  sSecFlds: array[0..nSecCount * 2] of String = ('',
    'ASTOURS', 'ASHOTEL', 'ISHOTEL', 'ASDRIVE', 'ASTICKT', 'ASVISAS',
    'ASEXCRS', 'ASGUIDE', 'ASMUSEM', 'ASEXTRM', 'ASFOODS', 'ASRECRE',
    'ASMEDIC', 'ASINSUR', 'ASSCOLL', 'ASEMPLS', 'ASXHIBT', 'ASAMBAS',
    'ASPARSE', 'ASAPAIR',
    'ASCOMMC', 'ASCMPTR', 'ASSTNRY', 'ASFURNT', 'ASGOODS', 'ASPETRL',
    'ASMEDIA', 'ASREKLM', 'ASLEASE', 'ASURIST', 'ASCONSL', 'ASGUARD',
    'ASBANKS', 'ISGOVERN', 'ASKOMUN', 'ASBUILD', 'ASMASTR', 'ASPARSL',
    'BUS17', 'ASOTHER');
  sTrdFlds: array[0..nTrdCount] of String = ('',
    'ISENTERPR', 'ISBUDGET', 'ISPRIVATE', 'ISBSMAN');
  sSecFldsNew: array[0..nSecCount*2] of String = (
    'ASTOURS', 'ASNETAGENT', 'ASHOTEL', 'ASDRIVE', 
    'ASFOODS', 'ASTICKT', 'ASVISAS', 'ASEXCRS', 
    'ASGUIDE', 'ASMEDIC', 'ASINSUR', 'ASRECRE',
    'ASMUSEM', 'ASEXTRM', 'ASSCOLL', 'ASAUPAIR',
    'ASEMPLS', 'ASPARSE', 'ASXHIBT', 'ASAMBAS',
    'ASAPAIR',
    'ASCOMMC', 'ASCMPTR', 'ASSTNRY', 'ASFURNT', 'ASGOODS', 'ASPETRL',
    'ASMEDIA', 'ASREKLM', 'ASLEASE', 'ASURIST', 'ASCONSL', 'ASGUARD',
    'ASBANKS', 'ISGOVERN', 'ASKOMUN', 'ASBUILD', 'ASMASTR', 'ASPARSL',
    'BUS17', 'ASOTHER');

  pTourNew: array[0..nSecCount] of Pointer = (
    @SCompBrAsTours, @SCompBrAsNetAgent, @SCompBrAsHotel, @SCompBrAsDrive,
    @SCompBrAsFoods, @SCompBrAsTickt, @SCompBrAsVisas, @SCompBrAsExcrs,
    @SCompBrAsGuide, @SCompBrAsMedic, @SCompBrAsInsur, @SCompBrAsRecre,
    @SCompBrAsMusem, @SCompBrAsExtrm, @SCompBrAsScool, @SCompBrAsAuPair,
    @SCompBrAsEmpls, @SCompBrAsParse, @SCompBrAsXhibt, @SCompBrAsAmbas,
    @SCompBrAsAPair);

  pWorkNew: array[0..nSecCount - 1] of Pointer = (
    @SCompBrAsCommc, @SCompBrAsCmptr, @SCompBrAsStnry, @SCompBrAsFurnt,
    @SCompBrAsGoods, @SCompBrAsPetrl, @SCompBrAsMedia, @SCompBrAsReklm,
    @SCompBrAsLease, @SCompBrAsUrist, @SCompBrAsConsl, @SCompBrAsGuard,
    @SCompBrAsBanks, @SCompBrAsGovrn, @SCompBrAsKomun, @SCompBrAsBuild,
    @SCompBrAsMastr, @SCompBrAsParsl, @SCompBrWkBus17, @SCompBrAsOther);

  nAllCategory = 0;
  nOrderCategory = 1;
  nCntrCategory = 2;
  nExportCategory = 3;
type
  TParamNameProfiles =  record
    Name:WideString;
    AnodeParamKind: TcxTreeListNode;
  end;
  TParamNameProfilesArr = array of TParamNameProfiles;

  TFrmCompanyBrowse = class(TForm)
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    QuickFilterPanel: TPanel;
    ContractImageList: TImageList;
    ExportTourImageList: TImageList;
    PanelGridCompany: TPanel;
    DetailPanel: TPanel;
    PanelTab: TPanel;
    GridCompany: TcxGrid;
    GridCompanyDBTableView1: TcxGridDBTableView;
    GridCompanyLevel1: TcxGridLevel;
    Panel3: TPanel;
    Panel2: TPanel;
    butSynchronizeCompanyTo1C: TSpeedButton;
    butFind: TSpeedButton;
    butDelCompany: TSpeedButton;
    butUpdateCompany: TSpeedButton;
    butAddCompany: TSpeedButton;
    butResfresCompany: TSpeedButton;
    ClearSearchCompany: TSpeedButton;
    EdiFindCmpanyByName: TcxTextEdit;
    TypeNameCheckBox: TcxCheckBox;
    PanelFilterManagerForCompany: TPanel;
    butClearManager: TSpeedButton;
    butClearStatus: TSpeedButton;
    butClearSubCategory: TSpeedButton;
    Label1: TLabel;
    CmbxManager: TcxExtLookupComboBox;
    CmbxCategory: TcxImageComboBox;
    SubCategoryComboBox: TcxImageComboBox;
    ButClearThirdSelectComboBox: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label17: TLabel;
    ButClearComboxStatusSelect: TSpeedButton;
    ButClearSecondaryPopupEdit: TSpeedButton;
    ThirdSelectComboBox: TcxImageComboBox;
    ComboxStatusSelect: TcxImageComboBox;
    ExtParamNameProfiles: TcxExtLookupComboBox;
    FrameComRequisites: TFrameComRequisites;
    dxBevel2: TdxBevel;
    Label18: TLabel;
    CmbxCompanyCountry: TcxExtLookupComboBox;
    ButClearCompanyCountry: TSpeedButton;
    Label30: TLabel;
    CmbxCompanyCity: TcxExtLookupComboBox;
    ButClearCompanyCity: TSpeedButton;
    ButSearch: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N21: TMenuItem;
    N22: TMenuItem;
    procedure ButSearchClick(Sender: TObject);
    procedure butSynchronizeCompanyTo1CClick(Sender: TObject);
    procedure ClearSearchCompanyClick(Sender: TObject);
    procedure TypeNameCheckBoxClick(Sender: TObject);
    procedure ButClearThirdSelectComboBoxClick(Sender: TObject);
    procedure ButClearComboxStatusSelectClick(Sender: TObject);
    procedure butClearManagerClick(Sender: TObject);
    procedure butClearStatusClick(Sender: TObject);
    procedure butClearSubCategoryClick(Sender: TObject);
    procedure ButClearCompanyCountryClick(Sender: TObject);
    procedure ButClearCompanyCityClick(Sender: TObject);
    procedure SubCategoryComboBoxPropertiesChange(Sender: TObject);
    procedure CmbxCategoryPropertiesChange(Sender: TObject);
    procedure CmbxCompanyCountryPropertiesChange(Sender: TObject);
    procedure ThirdSelectComboBoxPropertiesChange(Sender: TObject);
    procedure ComboxStatusSelectPropertiesChange(Sender: TObject);
    procedure CmbxCompanyCityPropertiesChange(Sender: TObject);
    procedure CmbxCompanyCityPropertiesInitPopup(Sender: TObject);
    procedure ButClearSecondaryPopupEditClick(Sender: TObject);
    procedure SubCategoryComboBoxClick(Sender: TObject);
    procedure butResfresCompanyClick(Sender: TObject);
    procedure butUpdateCompanyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butAddCompanyClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CmbxManagerPropertiesChange(Sender: TObject);
    procedure butDelCompanyClick(Sender: TObject);
    procedure ExtParamNameProfilesPropertiesChange(Sender: TObject);
    procedure ExtParamNameProfilesPropertiesInitPopup(Sender: TObject);
    procedure EdiFindCmpanyByNamePropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOffRecNo : Integer;
    FAccRecNo : Integer;
    FCorrRecNo: Integer;
    FPersRecNo: Integer;
    FOnClick  : Boolean;
    FChangeCategotyFilter: Boolean;
    FCategoryComboBoxChange: Boolean;
    FMamgerId : Integer;
    //FLevMngPermis :Integer;
    FCurManagerName:string;
    FItsShortMenu :Boolean;
    FCanUpdate : Boolean;

    procedure UpdateSubCategoryComboBox(CategoryId: Integer);
    procedure FUpdateToolActions( Value:Integer );

    procedure RefreshFilterBtn;
    procedure FPrepareComRquisitesFrame;
    procedure FPrepareControls;
    procedure FDestroyControls;
    procedure SetFilterCompanyView;
    procedure SetFilterCompanyCountryDB;

    procedure CopyFileProc(FileName: string);
    procedure UpdateCompany( IsNew:Boolean; IsFiliya: Boolean = False );
    function  GetContractType: Integer;

    procedure ViewCompanyCOMPANYNAMEGetDisplayText(
              Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;   var AText: String);

    procedure ViewCompanyFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);

    function  CheckCompanyData: Boolean;
    function  CompanyAreLicenseDoc: Boolean;
    procedure RecordEditCompany(Sender: TObject);

    procedure UpdateToolButtons;
    procedure RefreshControls;


    procedure PrepareValueFromField( FieldName:String; var MasFieldName:TVarArr;
                                 var MasValue:TVarArrVariant; var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                 ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );

    procedure PrepareValueFromMas(  MasField:array of String;IndMas:Integer; var MasFieldName:TVarArr;
                                     var MasValue:TVarArrVariant; var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                     ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );

    procedure PrepareFilterManager(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    procedure PrepareFilterCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    procedure PrepareFilterSubCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    procedure PrepareFilterStatus(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
    procedure PrepareFilterStatusKindActivity(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
    procedure PrepareFilterOrgForm( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );

    function  PrepareFilterCountryCity:Boolean;
    procedure PrepareFilterCompanyName( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
    function  GetCurrFieldCompanyName:Widestring;

    { Private declarations }
  public
    procedure SetComercialCompanyView(isComercial:Boolean);

    published
    property EnabledUpdate:Integer write FUpdateToolActions ;

    { Public declarations }
  end;

  procedure MyShowCompanyBrowse( Caption:Widestring; MamgerId:Integer; FCurManagerName :WideString;  aCanUpdate:Boolean );
  function  GetPrepareComRquisitesFrame:TParamComRequisitesFrame;
  procedure RefreshAllDBForCompany;
  procedure OpenAllDBForCompany;
var
  FrmCompanyBrowse: TFrmCompanyBrowse;

implementation
uses IBCustomDataSet, SKYPE4COMLib_TLB , ServModDic;
{$R *.dfm}

procedure MyShowCompanyBrowse( Caption:Widestring; MamgerId:Integer; FCurManagerName :WideString; aCanUpdate:Boolean );
var aFrmCompanyBrowse: TForm;
begin
  ReplaseOn( Caption,'&','');
  aFrmCompanyBrowse := FindFormByCaptionAndRestoreOnTop( Caption );
  if aFrmCompanyBrowse <> nil then
  begin
    TFrmCompanyBrowse(aFrmCompanyBrowse).FMamgerId := MamgerId;
    FormFocus(aFrmCompanyBrowse.Handle, SW_RESTORE );
    Exit;
  end
  else
  begin
    Forms.Application.CreateForm(TFrmCompanyBrowse, aFrmCompanyBrowse);
    TFrmCompanyBrowse(aFrmCompanyBrowse).Caption := Caption;
    TFrmCompanyBrowse(aFrmCompanyBrowse).FMamgerId := MamgerId;
    TFrmCompanyBrowse(aFrmCompanyBrowse).FCurManagerName := FCurManagerName;
    TFrmCompanyBrowse(aFrmCompanyBrowse).FCanUpdate := aCanUpdate;
    TFrmCompanyBrowse(aFrmCompanyBrowse).FPrepareControls;
    aFrmCompanyBrowse.Show;
  end;

end;

procedure TFrmCompanyBrowse.FormDestroy(Sender: TObject);
begin
  self.FDestroyControls;
end;

procedure TFrmCompanyBrowse.FPrepareControls;
begin
  OpenAllDBForCompany;
  FPrepareComRquisitesFrame;
  self.FrameComRequisites.ReQueryAllDbOffice;

  Elem_UsersQry.SetExtLookupComboBoxListView( CmbxManager,'MANAGER', True, False, nil, 'Всі' );
  Elem_CountryCompQry.SetExtLookupComboBoxListView( CmbxCompanyCountry, 'NAME', True, False, nil, 'Всі країни' );
  Elem_CityCompanyQry.SetExtLookupComboBoxListView( CmbxCompanyCity, 'NAME', True, False, nil, 'Всі міста' );
  Elem_COMPANIES_PARAM_NAME.SetExtLookupComboBoxListView(ExtParamNameProfiles,'DESCRIPT', True,False, ExtParamNameProfiles.Properties.View, 'Всі види');

  Elem_COMPANYQRY.View.OnDblClick  := RecordEditCompany;

  Elem_COMPANYQRY.View.GetColumnByFieldName('NAME').OnGetDisplayText:= ViewCompanyCOMPANYNAMEGetDisplayText;
  Elem_COMPANYQRY.View.OnFocusedRecordChanged :=ViewCompanyFocusedRecordChanged; // AddFocusedRecordChanged( ViewCompanyFocusedRecordChanged );


  RefreshControls;
  FUpdateToolActions( DMServ.CurManager );
  Elem_COMPANYQRY.SetFocusOnView;
end;

function GetPrepareComRquisitesFrame:TParamComRequisitesFrame;
begin
  result.AdoConnection := DMServDic.ADOConnection;
  result.ElemCompanyQry := Elem_CompanyQry;                      //!
  result.ElemTypeNotesQry := Elem_TypeNotesQry;  //!
  result.ElemCOMPCONTRACTSKINDQry := Elem_COMP_CONTRACTS_KINDQry;  //!
  result.ElemCompanyDocsQry:=Elem_CompanyDocsQry;  //!
  result.ElemOCCUPATIONS := Elem_OCCUPATIONS;
  result.ElemCompaniesParamName := Elem_COMPANIES_PARAM_NAME;
  result.ElemComunicationType := Elem_Comunication_TypeQry;
  result.ElemTypeDocumQry := Elem_TypeDocumQry;
  result.ElemSelCompAction:= Elem_SelCompAction;
  result.ElemSelTaxSystemQry := Elem_SelTaxSystemQry;
  result.ElemUsersQry := Elem_UsersQry;
  result.ElemCompContractNumsQry := Elem_CompContractNumsQry;
  
  result.ParamHotelEnterprise.HotelId := null;
  result.ParamHotelEnterprise.HotelName := '';
  result.ParamHotelEnterprise.HotelKindName := '';
  result.ParamHotelEnterprise.HotelCountryName := '';
  result.ParamHotelEnterprise.HoteCityName := '';

  result.ViewStyle := DMServDic.MyStyle;
end;

procedure TFrmCompanyBrowse.FPrepareComRquisitesFrame;
var ParamFrame:TParamComRequisitesFrame;
begin
  ParamFrame := GetPrepareComRquisitesFrame;
  FrameComRequisites.IntitComRquisitesFrame( ParamFrame, False, self.FMamgerId,  FCurManagerName );
end;

procedure TFrmCompanyBrowse.ViewCompanyCOMPANYNAMEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var IndName:Integer;
    IndTradeName:Integer;
    VarStr1:WideString;
    VarStr2:WideString;
    Separ:String;
begin
   IndName  := TcxGridDBTableView( Sender.GridView ).GetColumnByFieldName('NAME').Index;
   IndTradeName  := TcxGridDBTableView( Sender.GridView ).GetColumnByFieldName('TRADENAME').Index;

   VarStr1 :=Trim( ARecord.DisplayTexts[IndName]);
   VarStr2 :=Trim( ARecord.DisplayTexts[IndTradeName]);
   if (VarStr1<>'')and(VarStr2<>'') then Separ:=' / '
   else Separ :='';

   if not TypeNameCheckBox.Checked then
     AText:=  VarStr1 + Separ + VarStr2
   else
     AText:=  VarStr2 + Separ + VarStr1;
end;

procedure TFrmCompanyBrowse.ViewCompanyFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if (Elem_CompanyDocsQry<> nil)and(Elem_CompanyDocsQry.DB.Active) then
    Elem_CompanyDocsQry.Requery;

  if FrameComRequisites <> nil then
  begin
    FrameComRequisites.PrepareCompCount;
    FrameComRequisites.FrameRequsiteCompanyPayState.ShowData;
  end; 

  RefreshControls;
end;

procedure TFrmCompanyBrowse.UpdateToolButtons;
begin
 { if Elem_OfficeQry.DBRecordCount = 0 then OfficeCountLabel.Caption := EmptyStr
  else OfficeCountLabel.Caption := Format('%d/%d', [FOffRecNo, Elem_OfficeQry.DBRecordCount]);
  //***********************
  PrevOfficeBtn.Enabled := not Elem_OfficeQry.DB.Bof;
  NextOfficeBtn.Enabled := not Elem_OfficeQry.DB.Eof;
  //***********************
  PrevAccountBtn.Enabled :=  not Elem_AccountQry.DB.Bof;
  NextAccountBtn.Enabled :=  not Elem_AccountQry.DB.Eof;
  //***********************
  PrevForeignBtn.Enabled :=  not Elem_AccountQry.DB.Bof;
  NextForeignBtn.Enabled :=  not Elem_AccountQry.DB.Eof;
  //*********************** }
  SubCategoryComboBox.Enabled := (CmbxCategory.EditValue > nOrderCategory);
end;

procedure TFrmCompanyBrowse.RefreshControls;
begin
  if not Self.Showing then Exit;

  butAddCompany.Enabled := (DMServ.CurManager > 0)and( Elem_COMPANYQRY.CheckRoleInsert );
  butUpdateCompany.Enabled := (Elem_COMPANYQRY.View.ViewData.RowCount <> 0)and( Elem_COMPANYQRY.CheckRoleUpdate );;
  butDelCompany.Enabled := (Elem_COMPANYQRY.View.ViewData.RowCount <> 0) and(DMServ.CurManager > 0) and ( Elem_COMPANYQRY.CheckRoleDelete );;
  butSynchronizeCompanyTo1C.Enabled := (Elem_COMPANYQRY.View.ViewData.RowCount <> 0) and (DMServ.CurManager > 0);
  //**********************
  FrameComRequisites.RefreshControls;

  FrameComRequisites.FrameRequsiteCompanyPayState.RefreshControls( Elem_COMPANYQRY.DB.FieldByName('ISENTERPR').AsBoolean ,
                                                                 ( Elem_COMPANYQRY.DB.FieldByName('ASRESIDENT').AsBoolean ) or
                                                                 ( Elem_COMPANYQRY.DB.FieldByName('ASRESIDENT').IsNull ), False );
end;

procedure TFrmCompanyBrowse.PrepareValueFromField( FieldName:String; var MasFieldName:TVarArr;
                                                    var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                                    ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );
var Len:INteger;
begin
  Len:=Length(MasFieldName);
  SetLength(MasFieldName,Len+1);
  MasFieldName[Len]:= FieldName;

  Len:=Length(MasValue);
  SetLength(MasValue,Len+1);
  MasValue[Len]:= ValueTrue;

  Len:=Length(MasEqual);
  SetLength(MasEqual,Len+1);
  MasEqual[Len]:= Equal;

  Len:=Length(MasBool);
  SetLength(MasBool,Len+1);
  MasBool[Len]:= ValueBool;
end;


procedure TFrmCompanyBrowse.FDestroyControls;
begin
  Elem_COMPANYQRY.View.OnDblClick  := nil;
  Elem_COMPANYQRY.View.GetColumnByFieldName('NAME').OnGetDisplayText:= nil;
  Elem_COMPANYQRY.View.OnFocusedRecordChanged := nil;// AddFocusedRecordChanged( nil );
  FrameComRequisites.DestroyFrame;
end;

procedure TFrmCompanyBrowse.ButSearchClick(Sender: TObject);
begin
  SetFilterCompanyCountryDB;
  SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.butSynchronizeCompanyTo1CClick(
  Sender: TObject);
begin
  MergeAllForCurrentCompany( Elem_COMPANYQRY, FrameComRequisites.cxStyle216 );
end;

procedure TFrmCompanyBrowse.PrepareValueFromMas( MasField:array of String;IndMas:Integer; var MasFieldName:TVarArr;
                                                   var MasValue:TVarArrVariant; var MasEqual:TVarArr; var MasBool:TVarArrBool;
                                                   ValueTrue:Variant;Equal:String='=';ValueBool:TcxFilterBoolOperatorKind=fboAnd );
begin
  if IndMas < Length(MasField) then
    PrepareValueFromField( MasField[ Integer( IndMas ) ], MasFieldName, MasValue, MasEqual,MasBool, ValueTrue,Equal,ValueBool);
end;

procedure TFrmCompanyBrowse.PrepareFilterStatus(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
var b:Integer;
    ValCompare:Variant;
begin
  if ComboxStatusSelect.EditValue <> -1 then
  begin
    b:=Integer( ComboxStatusSelect.EditValue);
    if sPriFlds[ b ] <> 'ISOTHER' then ValCompare := 'T'
    else ValCompare := 1;
    
    PrepareValueFromMas( sPriFlds, Integer( ComboxStatusSelect.EditValue),  MasFieldName, MasValue, MasEqual, MasBool, ValCompare );
  end;
end;

procedure TFrmCompanyBrowse.PrepareFilterManager(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
begin
  if CmbxManager.EditValue <> null then
    PrepareValueFromField( 'ADDMANID',  MasFieldName, MasValue, MasEqual, MasBool, IntToStr( CmbxManager.EditValue)  );
end;

procedure TFrmCompanyBrowse.PrepareFilterCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
begin
  if CmbxCategory.EditValue=nOrderCategory then
  begin
    PrepareValueFromField( 'LASTDATECRORDER',  MasFieldName, MasValue, MasEqual, MasBool, null,'<>' );

    if CmbxManager.EditValue <> null then
      PrepareValueFromField( 'WORKMANID',  MasFieldName, MasValue, MasEqual, MasBool,  IntToStr( CmbxManager.EditValue),'=' );
  end;
end;

procedure TFrmCompanyBrowse.PrepareFilterSubCategory(var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );
var SubCategory:Integer;
    V_SortByContract: Variant;
begin
  if SubCategoryComboBox.EditValue <> null then
  begin
    SubCategory := SubCategoryComboBox.EditValue ;
    if SubCategory > -2 then
    begin
      if SubCategory in [SortByContractNeedCall, SortByContractSendDoc, SortByContractTakeOrgn] then
        PrepareValueFromField( 'DOCTODATE',  MasFieldName, MasValue, MasEqual, MasBool,  Date,'>' );

      if SubCategory in [101, 102, 122] then
      begin
        SubCategory := SubCategory - 100;
        PrepareValueFromField( 'DOCTODATE',  MasFieldName, MasValue, MasEqual, MasBool,  Date,'<=' );
      end
      else
      if SubCategory = SortByContractSendEmail then
      begin
         V_SortByContract := VarArrayCreate([0, 4], varVariant);
         V_SortByContract[0]:=8;
         V_SortByContract[1]:=9;
         V_SortByContract[2]:=10;
         V_SortByContract[3]:=11;
         V_SortByContract[4]:=SortByContractSendEmail;

         PrepareValueFromField( 'SORTBYCONTRACT',  MasFieldName, MasValue, MasEqual, MasBool,  V_SortByContract,'in' );
      end
      else
      if SubCategory = SortByContractRcvCopy then
      begin
         V_SortByContract := VarArrayCreate([0, 4], varVariant);
         V_SortByContract[0]:=13;
         V_SortByContract[1]:=14;
         V_SortByContract[2]:=15;
         V_SortByContract[3]:=16;
         V_SortByContract[4]:=SortByContractRcvCopy;
         
         PrepareValueFromField( 'SORTBYCONTRACT',  MasFieldName, MasValue, MasEqual, MasBool,  V_SortByContract,'in' );
      end;
    end;
  end;
end;

procedure TFrmCompanyBrowse.PrepareFilterStatusKindActivity( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool );

begin

end;

procedure TFrmCompanyBrowse.PrepareFilterOrgForm( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
var B:Integer;
    ValCompare:Variant;
begin
   if ThirdSelectComboBox.ItemIndex > 0 then
   begin
     B := ThirdSelectComboBox.ItemIndex;
     if sTrdFlds[B]<>'ISBUDGET'  then ValCompare :='T'
     else ValCompare := 1;

     PrepareValueFromMas( sTrdFlds, B,  MasFieldName, MasValue, MasEqual,MasBool, ValCompare );
     if ThirdSelectComboBox.ItemIndex = 3 then
      PrepareValueFromField( 'IsBsman', MasFieldName, MasValue, MasEqual,MasBool, 'T','<>' );
   end;
end;

function TFrmCompanyBrowse.PrepareFilterCountryCity:Boolean;

Const WhereFilterCountry = 'where exists (select * from compoffices o where COMPANIES.companyid = o.companyid and o.CountryId = :CountryId )';             //or o.cityid = :cityid       :CountryId
      WhereFilterCity = 'where exists (select * from compoffices o where COMPANIES.companyid = o.companyid and o.Id_CITY_ADM_UNIT = :Id_CITY_ADM_UNIT )'; //:cityid
      WhereFilterParamNameProfile = ' exists (select * from COMPANIES_PARAM_DATA p where COMPANIES.companyid = p.ID_COMPANIES and p.id_companies_param_name = :IdParamName )';
var DS:TDataset;
    ExtSql : string;
begin
  result := false;
  try
    Elem_COMPANYQRY.DB.DisableControls;

    if (CmbxCompanyCountry.EditValue<>null) or ( ExtParamNameProfiles.EditValue <> null) then
    begin
      Elem_COMPANYQRY.DB.Close;
      DMServ.PrepareMainSqlCompanyQuery;

      if ExtParamNameProfiles.EditValue <> null then
        ExtSql := WhereFilterParamNameProfile
      else ExtSql :='';

      if CmbxCompanyCity.EditValue<>null then
      begin
        Elem_COMPANYQRY.DBAddSQLWhere( WhereFilterCity + MyIfThen(ExtSql<>'',' and '+ExtSql,'') , False );
        Elem_COMPANYQRY.DBQuerySetParamValue('Id_CITY_ADM_UNIT',CmbxCompanyCity.EditValue);
        if (ExtParamNameProfiles.EditValue <> null)and(ExtSql<>'') then
          Elem_COMPANYQRY.DBQuerySetParamValue('IdParamName',ExtParamNameProfiles.EditValue);
      end
      else
      if CmbxCompanyCountry.EditValue <> null then
      begin
        Elem_COMPANYQRY.DBAddSQLWhere( WhereFilterCountry + MyIfThen(ExtSql<>'',' and '+ExtSql,''), False );
        Elem_COMPANYQRY.DBQuerySetParamValue('CountryId',CmbxCompanyCountry.EditValue);
        if (ExtParamNameProfiles.EditValue <> null)and(ExtSql<>'') then
          Elem_COMPANYQRY.DBQuerySetParamValue('IdParamName',ExtParamNameProfiles.EditValue);
      end
      else
      if ( ExtSql <>'' ) then
      begin
        Elem_COMPANYQRY.DBAddSQLWhere( 'where '+ExtSql , False );
        if (ExtParamNameProfiles.EditValue <> null) then
          Elem_COMPANYQRY.DBQuerySetParamValue('IdParamName',ExtParamNameProfiles.EditValue);
      end;

      Elem_COMPANYQRY.DBOpenWait;
      result:=True;
    end
    else
    if DBHaveWHere( Elem_COMPANYQRY.DB ) then
    begin
      Elem_COMPANYQRY.DBClose;
      DMServ.PrepareMainSqlCompanyQuery;

      Elem_COMPANYQRY.DBOpenWait;
      result :=True;
    end;
  finally
    Elem_COMPANYQRY.DB.EnableControls;
  end;
end;

function TFrmCompanyBrowse.GetCurrFieldCompanyName:Widestring;
begin
  if TypeNameCheckBox.Checked then result :='COMPANYTRADENAME'
  else result :='COMPANYNAME';
end;

procedure TFrmCompanyBrowse.PrepareFilterCompanyName( var MasFieldName:TVarArr; var MasValue:TVarArrVariant;var MasEqual:TVarArr; var MasBool:TVarArrBool  );
var CurrFieldCompanyName:Widestring;
begin
  if EdiFindCmpanyByName.Text<>'' then
    PrepareValueFromField( GetCurrFieldCompanyName, MasFieldName, MasValue, MasEqual, MasBool, EdiFindCmpanyByName.Text ,'like' );
end;

procedure TFrmCompanyBrowse.SetFilterCompanyView;
var MasFieldName:TVarArr;
    MasValue:TVarArrVariant;
    MasEqual:TVarArr;
    MasBool :TVarArrBool;
begin
   try
    Screen.Cursor := crHourGlass;
    GridCompany.BeginUpdate;
    Elem_COMPANYQRY.View.BeginUpdate;

    PrepareFilterManager( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterCategory( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterSubCategory( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterStatus( MasFieldName, MasValue,MasEqual,MasBool );
    PrepareFilterStatusKindActivity( MasFieldName, MasValue, MasEqual,MasBool );
    PrepareFilterOrgForm( MasFieldName, MasValue, MasEqual,MasBool );
    PrepareFilterCompanyName( MasFieldName, MasValue,MasEqual,MasBool );

    if Length(MasFieldName)<>0 then
      SetFilterOnWievForManyColumns( Elem_COMPANYQRY.View, MasFieldName, MasValue, MasEqual, MasBool, fboAnd , True, False )
    else Elem_COMPANYQRY.ClearFilterOnView;

  finally
    Elem_COMPANYQRY.View.EndUpdate;
    if Elem_COMPANYQRY.View.DataController.RowCount = 0 then
    begin
      Elem_COMPANYQRY.ShowClearDetailData( true );
      FrameComRequisites.PageControl.ActivePage := FrameComRequisites.OfficeTabSheet;
      //FrameComRequisites.AddressMemo.Clear;
      PanelTab.Repaint;
      LockControl(PanelTab, True );
    end
    else
    begin
      Elem_COMPANYQRY.ShowClearDetailData( False );
      PanelTab.Repaint;
      LockControl(PanelTab, False );
    end;
    GridCompany.EndUpdate;
    Screen.Cursor:=crDefault;
  end;
  
  Elem_COMPANYQRY.SetFocusOnView;
end;

procedure TFrmCompanyBrowse.SetFilterCompanyCountryDB;
var Progres : TProgressFormProp;
begin
  try
    Progres := ShowProgress( WaitFormCaption );
    GridCompany.BeginUpdate;
    Elem_COMPANYQRY.View.BeginUpdate;

    Progres.ProgressCaption.Repaint;
    if PrepareFilterCountryCity then
      if Elem_COMPANYQRY.DB is TIBCustomDataSet then
        TIBCustomDataSet(Elem_COMPANYQRY.DB).FetchAll;

  finally
    Elem_COMPANYQRY.View.EndUpdate;
    GridCompany.EndUpdate;
    ClosedProgress( Progres.FormProgres );
  end;
end;

procedure TFrmCompanyBrowse.ClearSearchCompanyClick(Sender: TObject);
begin
   EdiFindCmpanyByName.Text :=''; 
end;

procedure TFrmCompanyBrowse.TypeNameCheckBoxClick(Sender: TObject);
begin
   SetComercialCompanyView( TypeNameCheckBox.Checked );
end;

procedure TFrmCompanyBrowse.SetComercialCompanyView(isComercial:Boolean);
var aColumn:TcxGridDBColumn;
begin
  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').Visible:= not isComercial;
  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').Visible:= isComercial;
  if isComercial then
  begin
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').Width := Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').Width;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortOrder :=  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortOrder;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortIndex :=  Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortIndex;
  end
  else
  begin
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').Width := Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').Width ;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortOrder:=Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortOrder;
    Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYNAME').SortIndex:=Elem_COMPANYQRY.View.GetColumnByFieldName('COMPANYTRADENAME').SortIndex;
  end;
end;

procedure TFrmCompanyBrowse.ButClearThirdSelectComboBoxClick(
  Sender: TObject);
begin
  ThirdSelectComboBox.EditValue := 0;
end;

procedure TFrmCompanyBrowse.butClearManagerClick(Sender: TObject);
begin
  CmbxManager.EditValue := null;
end;

procedure TFrmCompanyBrowse.butClearStatusClick(Sender: TObject);
begin
  CmbxCategory.EditValue:=0;
  butClearSubCategory.Click;
end;

procedure TFrmCompanyBrowse.butClearSubCategoryClick(Sender: TObject);
begin
  SubCategoryComboBox.EditValue:=null;
end;

procedure TFrmCompanyBrowse.ButClearCompanyCountryClick(Sender: TObject);
begin
  CmbxCompanyCountry.EditValue := null;
  SetFilterCompanyCountryDB;
end;

procedure TFrmCompanyBrowse.ButClearCompanyCityClick(Sender: TObject);
begin
  CmbxCompanyCity.EditValue := null;
end;

procedure TFrmCompanyBrowse.SubCategoryComboBoxPropertiesChange(
  Sender: TObject);
begin
  SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.CmbxCategoryPropertiesChange(Sender: TObject);
var CategoryId: Integer;
begin
  FChangeCategotyFilter := True;
  if ((Sender as TcxImageCombobox).Tag = 1) then
  begin
    FCategoryComboBoxChange := True;
  end;
  CategoryId := TcxImageCombobox(Sender).EditValue;

  SubCategoryComboBox.Enabled := CategoryId > nOrderCategory;
  if CategoryId > nOrderCategory then UpdateSubCategoryComboBox(CategoryId);
  UpdateToolButtons;
  SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.RefreshFilterBtn;
begin
  ButSearch.Enabled := CmbxCompanyCountry.EditValue <> null or ExtParamNameProfiles.EditValue <> null;
end;

procedure TFrmCompanyBrowse.CmbxCompanyCountryPropertiesChange(
  Sender: TObject);
begin
  CmbxCompanyCity.EditValue:=null;
  RefreshFilterBtn;
end;

procedure TFrmCompanyBrowse.ThirdSelectComboBoxPropertiesChange(
  Sender: TObject);
begin
  SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.ComboxStatusSelectPropertiesChange(
  Sender: TObject);
begin
  SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.CmbxCompanyCityPropertiesChange(
  Sender: TObject);
begin
  RefreshFilterBtn;
end;

procedure TFrmCompanyBrowse.CmbxCompanyCityPropertiesInitPopup(
  Sender: TObject);
begin
  if CmbxCompanyCountry.EditValue = null then Abort;
  InitLocateDBKeyValueInCxExtLookupComboBox( CmbxCompanyCountry );
end;

procedure TFrmCompanyBrowse.RecordEditCompany(Sender: TObject);
begin
  if butUpdateCompany.Enabled then butUpdateCompany.Click;
end;

function TFrmCompanyBrowse.CompanyAreLicenseDoc: Boolean;
begin
  Result := GetCountFilesForPath(
    GetDocStoreFolder(OptionSet.StoreFolder, [ Elem_COMPANYQRY.GetValueId, nPartnerLicenseDocFolder], nPartnerDocFolder), '*.*') > 0;
  if not Result then ErrorDlg('Не приєднані скан копії банківської гарантії в папку документів партнера!');
end;

function TFrmCompanyBrowse.CheckCompanyData: Boolean;
begin
  Result :=  Elem_COMPANYQRY.DB.FieldByName('ALLDATAFILL').AsBoolean;
  if not Result then ErrorDlg('Незаповнені всі обов`язкові дані партнера.')
  else Result := CompanyAreLicenseDoc;
end;

procedure TFrmCompanyBrowse.CopyFileProc(FileName: string);
begin
  myCopyFile(FileName, DMServ.GetPartners_ContractDocsStoreFolder( Elem_COMPANYQRY.GetValueIdStr ));
end;

procedure TFrmCompanyBrowse.FUpdateToolActions(Value: Integer);
begin
  RefreshControls;

  FMamgerId := DMServ.CurManager;
  //FLevMngPermis:= DMServ.CurManagerPerms[uspDictCompany];
  FCurManagerName := DMServ.CurManagerName;

  FrameComRequisites.SetManager( self.FMamgerId, FCurManagerName, false );
end;

function GetSqlContractTemplatesIB(TypeTempl: Integer):string;
begin
  result := 'select Pp.RDB$DESCRIPTION DESCRIPT, T.* ' +
    'from ContractTemplates T ' +
    'LEFT OUTER JOIN RDB$PROCEDURE_PARAMETERS Pp ON Pp.RDB$PROCEDURE_NAME = T.sourcetable  ' +
    'and Pp.RDB$PARAMETER_NAME = T.requiredfield and Pp.rdb$PROCEDURE_NAME = T.SourceTable  ' +
    'where Pp.RDB$PARAMETER_TYPE = 1 and Pp.RDB$DESCRIPTION is not null';

  if TypeTempl = 0 then result := result +' and ContractId = :ContractId'
  else result := result +' and ContractType = :ContractType';
end;

function GetSqlContractTemplatesADO(TypeTempl: Integer):string;
begin
  result :='';//  Далі буде
end;

{procedure TFrmCompanyBrowse.UpdateCompanyProperties;
begin
  Elem_CompHeadPropQry.DBQuerySetParamValue('CompanyId', Elem_COMPANYQRY.GetValueId );
  Elem_CompHeadPropQry.DBQuerySetParamValue('OurPersonId',Elem_COMPANYQRY.DB.FieldByName('OURPERSONID').Value );
  Elem_CompHeadPropQry.DBQuerySetParamValue('ItsPersonId', Elem_COMPANYQRY.DB.FieldByName('ITSPERSONID').Value );
  Elem_CompHeadPropQry.DBQuerySetParamValue('varNumContract', Elem_COMPANYQRY.DB.FieldByName('NumContract').Value );
  Elem_CompHeadPropQry.DBQuerySetParamValue('varWriteDate', Elem_COMPANYQRY.DB.FieldByName('SignDate').Value );
  Elem_CompHeadPropQry.DBOpen;
end; }

function TFrmCompanyBrowse.GetContractType: Integer;
const nAgentContractId = 1128;
begin
  Result := nAgentContractId;
end;

procedure TFrmCompanyBrowse.ButClearComboxStatusSelectClick(
  Sender: TObject);
begin
  ComboxStatusSelect.EditValue:=-1;
end;

procedure TFrmCompanyBrowse.ButClearSecondaryPopupEditClick(
  Sender: TObject);
begin
  ExtParamNameProfiles.EditValue:=null;
  SetFilterCompanyCountryDB;
end;

procedure TFrmCompanyBrowse.UpdateSubCategoryComboBox(CategoryId: Integer);
var 
  I, LengthArr, CutImgs, Id: Integer;
  cxImageComboBoxItem: TcxImageComboBoxItem;
  CurImageList: TImageList; 
  pName: ^string;
  pItem: ^Integer; 
  ItsShortMenu: Boolean;
begin
  ItsShortMenu := (CmbxManager.EditValue <> null);
  if ItsShortMenu then CutImgs := 3 else CutImgs := 0;

  if FItsShortMenu and ItsShortMenu then ItsShortMenu := False
  else FItsShortMenu := ItsShortMenu;

  case CategoryId of
   nCntrCategory:
    begin
      CurImageList := ContractImageList;
      LengthArr := nContrCategoryCount;
      pName := @DogCategoryName[CutImgs];
      pItem := @DocCategoryItem[CutImgs];
    end;
   nExportCategory: 
    begin
      CurImageList := ExportTourImageList;
      LengthArr := nExportCategoryCount;
      pName := @ExportCategoryName[CutImgs];
      pItem := @ExportCategoryItem[CutImgs];
    end;   
  end;               
  //with SubCategoryComboBox do
  begin
    if (ItsShortMenu and ((SubCategoryComboBox.ItemIndex < CutImgs) or (SubCategoryComboBox.ItemIndex in [7, 8]))) or FCategoryComboBoxChange
    then id := pItem^
    else
    begin
     if SubCategoryComboBox.EditValue <> null then id := StrToInt((SubCategoryComboBox.EditValue))
     else id:=0;
    end;
    FCategoryComboBoxChange := False;

    SubCategoryComboBox.Properties.Items.BeginUpdate;
    try
      SubCategoryComboBox.Properties.Items.Clear;
      SubCategoryComboBox.Properties.Images := CurImageList;
      for I := CutImgs to LengthArr do
      begin
        if not (FItsShortMenu and (CategoryId = nExportCategory)) or not (I in [7, 8]) then
        begin
          SubCategoryComboBox.Properties.Items.Add;
          cxImageComboBoxItem := SubCategoryComboBox.Properties.Items[I - CutImgs];

          cxImageComboBoxItem.ImageIndex := I;
          if pName<>nil then
          begin
            cxImageComboBoxItem.Description := pName^;
            cxImageComboBoxItem.Value := pItem^;
          end;

        end else Inc(CutImgs);
        Inc(pName);
        Inc(pItem);
      end;
    finally
      SubCategoryComboBox.Properties.Items.EndUpdate;
    end;  
    SubCategoryComboBox.EditValue := Id;
  end;
end;

procedure TFrmCompanyBrowse.SubCategoryComboBoxClick(Sender: TObject);
begin
  FChangeCategotyFilter := True;
  UpdateToolButtons;
end;

procedure RefreshAllDBForCompany;
var aProgres:TProgressFormProp;
begin
  try
    aProgres := ShowProgress( WaitFormCaption , -1 );
    Forms.Application.ProcessMessages;
    Elem_COMPANYQRY.Requery( True );
    Elem_CountryCompQry.Requery;
    Elem_CityCompanyQry.Requery;

    Elem_OCCUPATIONS.Requery;
    Elem_TAXSYSTEMQry.Requery;

    Elem_CompanyDocsQry.Requery;
  finally
     ClosedProgress(aProgres.FormProgres);
  end;
end;

procedure OpenAllDBForCompany;
begin
  Elem_COMPANYQRY.DBOpenWait(True);
  Elem_CountryCompQry.DBOpenWait;
  Elem_CityCompanyQry.DBOpenWait;
  Elem_OCCUPATIONS.DBOpen;
  Elem_TAXSYSTEMQry.DBOpen;
  Elem_CompanyDocsQry.DBOpen;
  Elem_COMPANIES_PARAM_KIND.DBOpen;
  Elem_COMPANIES_PARAM_NAME.DBOpen;
end;

procedure TFrmCompanyBrowse.butResfresCompanyClick(Sender: TObject);
begin
  RefreshAllDBForCompany;
  FrameComRequisites.ReQueryAllDbOffice;
end;

procedure TFrmCompanyBrowse.UpdateCompany( IsNew:Boolean; IsFiliya: Boolean = False );
var ParamElemCompanyEdit:TParamElemCompanyEdit;
begin
  ParamElemCompanyEdit.Elem_Company := Elem_COMPANYQRY;
  ParamElemCompanyEdit.Elem_TypeDocumQry := Elem_TypeDocumQry;

  ParamElemCompanyEdit.ElemCompOrgFrmQry := Elem_CompOrgFrmQry;
  ParamElemCompanyEdit.Elem_SelTradeNameQry := Elem_SelTradeNameQry;
  ParamElemCompanyEdit.Elem_SelCompanyByTradeNameQry := Elem_SelCompanyByTradeNameQry;
  //ParamElemCompanyEdit.Elem_Emails := FrameComRequisites.Elem_EmailQry;

  //ParamElemCompanyEdit.Elem_CompTaxLogMemTableEh := Elem_CompTaxLogMemTableEh;
  //ParamElemCompanyEdit.Elem_CompTaxSystemLogQry := Elem_CompTaxSystemLogQry;
  ParamElemCompanyEdit.ElemCompaniesParamData := Elem_COMPANIES_PARAM_DATA;
  ParamElemCompanyEdit.Elem_CurrencyMainQry := Elem_CurrencyMainQry;
  ParamElemCompanyEdit.Elem_SelHeadDataQuery := Elem_SelHeadDataQuery;
  ParamElemCompanyEdit.Elem_SelCompAction := Elem_SelCompAction;
  ParamElemCompanyEdit.Elem_ExistCompQry := Elem_ExistCompQry;
  ParamElemCompanyEdit.Elem_ExistOfficeQry := Elem_ExistOfficeQry;
  ParamElemCompanyEdit.Elem_CompanyNotesQry := Elem_CompanyNotesQry;
  ParamElemCompanyEdit.Elem_SelTaxSystemQry := Elem_SelTaxSystemQry;
  ParamElemCompanyEdit.Elem_CompTaxSystemLogQry := self.FrameComRequisites.Elem_CompTaxSystemLogQry;
  ShowUpdateCompany( ParamElemCompanyEdit , IsNew, butAddCompany.Enabled );
end;

procedure TFrmCompanyBrowse.butUpdateCompanyClick(Sender: TObject);
begin
  UpdateCompany( False );
end;

procedure TFrmCompanyBrowse.butAddCompanyClick(Sender: TObject);
begin
  UpdateCompany( True );
end;

procedure TFrmCompanyBrowse.FormShow(Sender: TObject);
begin
  RefreshControls;
  PositionFormCenterFromMainForm( self );
end;

procedure TFrmCompanyBrowse.CmbxManagerPropertiesChange(Sender: TObject);
begin
  SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.butDelCompanyClick(Sender: TObject);
begin
  Elem_COMPANYQRY.DBDelete(True);
end;

procedure TFrmCompanyBrowse.ExtParamNameProfilesPropertiesChange(
  Sender: TObject);
begin
  SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.ExtParamNameProfilesPropertiesInitPopup(
  Sender: TObject);
begin
  TcxGridDBTableView(ExtParamNameProfiles.Properties.View).DataController.Groups.FullExpand;
  if ExtParamNameProfiles.EditValue = null then
   TcxGridDBTableView(ExtParamNameProfiles.Properties.View).DataController.GotoFirst;
end;

procedure TFrmCompanyBrowse.EdiFindCmpanyByNamePropertiesChange(
  Sender: TObject);
begin
 SetFilterCompanyView;
end;

procedure TFrmCompanyBrowse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
