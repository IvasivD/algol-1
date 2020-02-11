unit TestMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,UnitGenerateElementsCore,
  ImgList, Menus, ActnList, ComCtrls, ToolWin, StdCtrls, StdActns, IniFiles, UnitCompBr, cxFilter,
  AzComboBox,UnitCountryCityEdit,cxGridDBTableView,TypInfo,UnitHotelEdit,TourCmnlIf, UnitFrameComRequisites,
  UnitDictionGrid,  UnitDriveBrowse,UnitResortEdit,UnitProc , Core,DB, FrmProgress, UnitIBQuery, UnitAdminRoleForm;


Const  xClientWindow: Integer = 0;
       yClientWindow: Integer = 74;
       hClientWindow: Integer = 467;
       wClientWindow: Integer = 800;
       xBrowseWindow: Integer = 0;
       yBrowseWindow: Integer = 90;

type
  TFormMenuTop = class(TForm)
    ActionList: TActionList;
    TripMasterAction: TAction;
    HotelMasterAction: TAction;
    CloseAction: TAction;
    DictionaryCityAction: TAction;
    DictionaryDriveAction: TAction;
    DictionaryHotelAction: TAction;
    DictionaryHotelGroupAction: TAction;
    DictionaryHotelTypeAction: TAction;
    DictionaryRoomTypesAction: TAction;
    DictionaryServiceAction: TAction;
    DictionaryCurrencyAction: TAction;
    DictionaryReklamaAction: TAction;
    RateMasterAction: TAction;
    DictionaryCompanyAction: TAction;
    RouteRateAction: TAction;
    FileSuspendAction: TAction;
    CurrencyMasterAction: TAction;
    PopupMenu: TPopupMenu;
    ToolsMenuSplitter2: TMenuItem;
    FileExitItem: TMenuItem;
    DictionaryMenu: TMenuItem;
    DictionaryCityItem: TMenuItem;
    DictionaryDriveKindItem: TMenuItem;
    DictionaryHotelMenu: TMenuItem;
    DictionaryHotelItem: TMenuItem;
    DictionaryHotelGroupItem: TMenuItem;
    DictionaryHotelCategoryItem: TMenuItem;
    DictionaryRoomTypesItem: TMenuItem;
    DictionaryServiceItem: TMenuItem;
    DictionaryCurrencyItem: TMenuItem;
    DictionaryClientItem: TMenuItem;
    ToolsMenu: TMenuItem;
    ToolsMenuSplitter1: TMenuItem;
    ToolsOptionItem: TMenuItem;
    HelpMenu: TMenuItem;
    HelpContentsItem: TMenuItem;
    HelpSearchItem: TMenuItem;
    HelpHowToUseItem: TMenuItem;
    HelpMenuSplitter: TMenuItem;
    HelpAboutItem: TMenuItem;
    MenuToolBar: TToolBar;
    DictionaryMenuBtn: TToolButton;
    DictionaryBankAction: TAction;
    DictionaryBankItem: TMenuItem;
    MainImgList: TImageList;
    CtrlToolBar: TToolBar;
    DictionaryCityBtn: TToolButton;
    DictionaryDriveBtn: TToolButton;
    DictionaryHotelBtn: TToolButton;
    DictionaryServiceBtn: TToolButton;
    DictionaryCurrencyBtn: TToolButton;
    DictionaryCompanyBtn: TToolButton;
    DictionaryBankBtn: TToolButton;
    DictionaryFeedTypesAction: TAction;
    DictionaryRoomViewsAction: TAction;
    DictionaryRoomViewsItem: TMenuItem;
    DictionaryOccupationAction: TAction;
    DictionaryOtherMenu: TMenuItem;
    DictionaryBusinessProfileAction: TAction;
    HelpContentsAction: THelpContents;
    HelpFinderAction: THelpTopicSearch;
    HelpOnHelpAction: THelpOnHelp;
    HelpMenuBtn: TToolButton;
    DictionaryOtherBtn: TToolButton;
    OtherPopupMenu: TPopupMenu;
    LoginAction: TAction;
    ToolsLoginItem: TMenuItem;
    ToolsMenuBtn: TToolButton;
    DictionaryProvinceAction: TAction;
    HelpAboutAction: TAction;
    DictionaryInterestAction: TAction;
    DictionaryDocumVisaAction: TAction;
    DictionarySystemTaxAction: TAction;
    ContrTemplAction: TAction;
    DictionaryHotelBuildAction: TAction;
    DictionaryActualLangAction: TAction;
    DictionaryExpandRoomNameAction: TAction;
    DictionaryResortAction: TAction;
    HotelPopupMenu: TPopupMenu;
    butGroupHotels: TMenuItem;
    butKindHotel: TMenuItem;
    butHtlBuilds: TMenuItem;
    butRoomType: TMenuItem;
    butRoomExpandName: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    butFeedTypes: TMenuItem;
    CityPopupMenu: TPopupMenu;
    N13: TMenuItem;
    CompPopupMenu: TPopupMenu;
    N15: TMenuItem;
    N1: TMenuItem;
    N17: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    DictionaryResortTypeAction: TAction;
    N32: TMenuItem;
    N33: TMenuItem;
    DictionaryNaturObjTypeAction: TAction;
    N34: TMenuItem;
    DictionaryNaturObjAction: TAction;
    N36: TMenuItem;
    N37: TMenuItem;
    DictionaryAdminUnitTypeAction: TAction;
    N38: TMenuItem;
    DictionaryBedTypeAction: TAction;
    N40: TMenuItem;
    butBedType: TMenuItem;
    DictionaryInfraTypeAction: TAction;
    N42: TMenuItem;
    DictionaryInfraAction: TAction;
    N44: TMenuItem;
    N45: TMenuItem;
    DictionaryExcursAction: TAction;
    DictionaryExursBtn: TToolButton;
    ShExcursPopupMenu: TPopupMenu;
    DictionaryShTypesAction: TAction;
    ButExcursionPlace: TMenuItem;
    N47: TMenuItem;
    ButToolsMergeLog1C: TMenuItem;
    DictionarySectionAction: TAction;
    N48: TMenuItem;
    butCountryInfoType: TMenuItem;
    butDictUnitMeashur: TMenuItem;
    butDicKindCar: TMenuItem;
    butLanguages: TMenuItem;
    butReligions: TMenuItem;
    butDicVoltType: TMenuItem;
    butDicFregType: TMenuItem;
    butInternacionalOrg: TMenuItem;
    butLngTranslateTemplateDic: TMenuItem;
    N51: TMenuItem;
    butTemplateToutProgram: TMenuItem;
    butTemplateTimeToutProgram: TMenuItem;
    butDicTimeZone: TMenuItem;
    ButDicExcursionByContext: TMenuItem;
    ButDicExcursionByTrip: TMenuItem;
    butFormGovernment: TMenuItem;
    butOrgFormCompany: TMenuItem;
    N46: TMenuItem;
    butOccupations: TMenuItem;
    ButToolsLog: TMenuItem;
    N12: TMenuItem;
    butKindStreet: TMenuItem;
    butKindStr: TMenuItem;
    butKindContract: TMenuItem;
    ButKindContr: TMenuItem;
    PUpMenuService: TPopupMenu;
    butKindService: TMenuItem;
    butTypeServices: TMenuItem;
    ButServiceTypeConditions: TMenuItem;
    butOtherServ: TMenuItem;
    butAdminUnit: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    butKindOjBranch: TMenuItem;
    butKindObjBranch: TMenuItem;
    HotellClass: TMenuItem;
    butComunicationType: TMenuItem;
    butTypeAdminUnit: TMenuItem;
    butTourObject: TMenuItem;
    butDicTypeSectionItem: TMenuItem;
    Button1: TButton;
    ToolButtonDoc: TToolButton;
    PUpMenuVisa: TPopupMenu;
    butVasaDoc: TMenuItem;
    butKindPasport: TMenuItem;
    ButDocState: TMenuItem;
    butSponsor: TMenuItem;
    butActionCompany: TMenuItem;
    butCompanyDocType: TMenuItem;
    butReposKind: TMenuItem;
    butPaymentBySponsor: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    butMismatchDoc: TMenuItem;
    butKindVasaDoc: TMenuItem;
    butDocFor: TMenuItem;
    butCreditCard: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure FormRestore(Sender: TObject);
    procedure LoginActionExecute(Sender: TObject);
    procedure DictionaryCurrencyActionExecute(Sender: TObject);
    procedure DictionaryRoomViewsActionExecute(Sender: TObject);
    procedure DictionaryHotelActionExecute(Sender: TObject);
    procedure DictionaryInterestActionExecute(Sender: TObject);
    procedure DictionaryProvinceActionExecute(Sender: TObject);
    procedure DictionaryDriveActionExecute(Sender: TObject);
    procedure DictionaryCompanyActionExecute(Sender: TObject);
    procedure HelpContentsActionExecute(Sender: TObject);
    procedure HelpAboutActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure ToolButton20Click(Sender: TObject);
    procedure ContrTemplActionExecute(Sender: TObject);
    procedure DictionaryExpandRoomNameActionExecute(Sender: TObject);
    procedure DictionaryNaturObjTypeActionExecute(Sender: TObject);
    procedure DictionaryNaturObjActionExecute(Sender: TObject);
    procedure DictionaryAdminUnitTypeActionExecute(Sender: TObject);
    procedure ButToolsMergeLog1CClick(Sender: TObject);
    procedure DictionarySectionActionExecute(Sender: TObject);
    procedure butCountryInfoTypeClick(Sender: TObject);
    procedure butLanguagesClick(Sender: TObject);
    procedure butReligionsClick(Sender: TObject);
    procedure butDictUnitMeashurClick(Sender: TObject);
    procedure butDicKindCarClick(Sender: TObject);
    procedure butDicVoltTypeClick(Sender: TObject);
    procedure butDicFregTypeClick(Sender: TObject);
    procedure butInternacionalOrgClick(Sender: TObject);
    procedure butLngTranslateTemplateDicClick(Sender: TObject);
    procedure butTemplateToutProgramClick(Sender: TObject);
    procedure butTemplateTimeToutProgramClick(Sender: TObject);
    procedure butDicTimeZoneClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ButExcursionPlaceClick(Sender: TObject);
    procedure ButDicExcursionByTripClick(Sender: TObject);
    procedure ButDicExcursionByContextClick(Sender: TObject);
    procedure butFormGovernmentClick(Sender: TObject);
    procedure butOrgFormCompanyClick(Sender: TObject);
    procedure butOccupationsClick(Sender: TObject);
    procedure ButToolsLogClick(Sender: TObject);
    procedure DictionaryResortActionExecute(Sender: TObject);
    procedure butKindStrClick(Sender: TObject);
    procedure butKindContractClick(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure butKindServiceClick(Sender: TObject);
    procedure butTypeServicesClick(Sender: TObject);
    procedure ButServiceTypeConditionsClick(Sender: TObject);
    procedure butOtherServClick(Sender: TObject);
    procedure butGroupHotelsClick(Sender: TObject);
    procedure butKindHotelClick(Sender: TObject);
    procedure butHtlBuildsClick(Sender: TObject);
    procedure butRoomTypeClick(Sender: TObject);
    procedure butRoomExpandNameClick(Sender: TObject);
    procedure butBedTypeClick(Sender: TObject);
    procedure butFeedTypesClick(Sender: TObject);
    procedure DictionaryServiceBtnClick(Sender: TObject);
    procedure DictionaryCurrencyBtnClick(Sender: TObject);
    procedure DictionaryBankBtnClick(Sender: TObject);
    procedure butAdminUnitClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure butKindOjBranchClick(Sender: TObject);
    procedure DictionaryExursBtnClick(Sender: TObject);
    procedure butKindObjBranchClick(Sender: TObject);
    procedure HotellClassClick(Sender: TObject);
    procedure butComunicationTypeClick(Sender: TObject);
    procedure butGroupAdminUnitClick(Sender: TObject);
    procedure CityPopupMenuPopup(Sender: TObject);
    procedure butTourObjectClick(Sender: TObject);
    procedure DictionaryCityBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure butKindPasportClick(Sender: TObject);
    procedure ButDocStateClick(Sender: TObject);
    procedure butSponsorClick(Sender: TObject);
    procedure butActionCompanyClick(Sender: TObject);
    procedure butCompanyDocTypeClick(Sender: TObject);
    procedure butReposKindClick(Sender: TObject);
    procedure butPaymentBySponsorClick(Sender: TObject);
    procedure butMismatchDocClick(Sender: TObject);
    procedure butKindVasaDocClick(Sender: TObject);
    procedure butDocForClick(Sender: TObject);
    procedure butCreditCardClick(Sender: TObject);
  private
    FActivation: Boolean;
    FBrowseId: string;
    procedure OnMove(var Msg: TWMMove); message WM_MOVE;
    procedure SynchronizeWithStatusBarForm;
    procedure CheckManager;
    function  GetManagerName: string;
    procedure ParamResponse;
    procedure SetActionState;
    procedure SetWindowSizes;
    procedure SetWindowApril;
    procedure UpdateBrowserActions;
    procedure UpdateManagerName;
    procedure ShowDicAdminUnitItems( Sender: TObject );
  public
    procedure Prepare;  
(*    procedure SetForeground;
  protected
    procedure GetMessage(var msg: TWMCopyData); message WM_COPYDATA;*)
  end;

var
  FormMenuTop: TFormMenuTop;
  

implementation

uses OptSet ,
  ServMod, StatForm,MngrDlg, ServModIB, ContractTemplatesFrm,
  TourConsts, ServModDic;

{$R *.DFM}

procedure TFormMenuTop.CheckManager;
begin
  if  DMServ.CheckManager then
  begin
    UpdateManagerName;
    UpdateBrowserActions;
  end;
end;

function TFormMenuTop.GetManagerName: string;
begin
  if DMServ.CurManager = 0 then Result := '' else
    Result := Format('%s: %s', [SOrderFrmDocManager, DMServ.CurManagerName]); 
end;

procedure TFormMenuTop.ParamResponse;
var Man: String;
begin
 { if (ParamCount > 0) then
  begin
    if GetExeParamExists('companies') then
      with DictionaryCompanyAction do if Enabled then Execute;
    if GetExeParamExists('cities') then
      with DictionaryCityAction do if Enabled then Execute;
    if GetExeParamExists('hotels') then
      with DictionaryHotelAction do if Enabled then Execute;
    if GetExeParamExists('shablons', FBrowseId) then
      with DictionaryExcursAction do if Enabled then Execute;
    if GetExeParamExists('taxsystem') then
      with DictionarySystemTaxAction do if Enabled then Execute;
    GetExeParamExists('Man', Man);
    DMServ.CurManager := SafeStrToInt(Man);
    if DMServ.CurManager > 0 then
    begin
      UpdateManagerName;
      UpdateBrowserActions;
    end;
  end; }
end;

procedure TFormMenuTop.SetActionState;
begin
  DictionaryCityAction.Enabled := True;
  DictionaryDriveAction.Enabled := True;
  DictionaryHotelAction.Enabled := True;
  DictionaryHotelGroupAction.Enabled := True;
  DictionaryHotelTypeAction.Enabled := True;
  DictionaryRoomTypesAction.Enabled := True;
  DictionaryServiceAction.Enabled := True;
  DictionaryCurrencyAction.Enabled := True;
  DictionaryReklamaAction.Enabled := True;
  DictionaryCompanyAction.Enabled := True;
  DictionaryBankAction.Enabled := True;
  DictionaryFeedTypesAction.Enabled := True;
  DictionaryOccupationAction.Enabled := True;
  DictionaryBusinessProfileAction.Enabled := True;
  DictionaryRoomViewsAction.Visible := False;
end;

procedure TFormMenuTop.SetWindowApril;
var Y, M, D, H, N, S, C: Word;
begin
  DecodeDate(Now, Y, M, D);
  DecodeTime(Now, H, N, S, C);
  if (D = 1) and (M = 4) and (H in [9..14])
    and (not Assigned(DMServ) or (DMServ.CurManager = 0))
  then begin
    AlphaBlend := not AlphaBlend;
    TransparentColor := not TransparentColor;
  end;
end;

procedure TFormMenuTop.SetWindowSizes;
var R: TRect;
begin
  if GetMainOptions then Exit;
  if GetSystemWorkArea(R) then
  begin // correct heights and widths in order of Work area
    Left := R.Left;
    Top := R.Top;
    Width := R.Right - R.Left;
    hClientWindow := R.Bottom;
  end
  else begin
    Left := 0;
    Top := 0;
  end;
  xClientWindow := Left; //CtrlToolBar.Width + 4;
  yClientWindow := Top + Height; //CtrlToolBar.Top + 20;
  if wClientWindow < Width then wClientWindow := Width; // <=800
  //gPixelsPerInch := PixelsPerInch; // scale constant
  xBrowseWindow := xClientWindow + 80;
  yBrowseWindow := yClientWindow;
  SetWindowApril;
end;

procedure TFormMenuTop.UpdateBrowserActions;
var I: Integer;
    P: Pointer;
begin
  with Application do
  for I := 0 to ComponentCount - 1 do
  begin
    if ( Components[I] is TForm ) and ( TForm(Components[I]).Showing ) then
    begin
      P := GetPropInfo( Application.Components[I].ClassInfo, 'EnabledUpdate' );
      if P <> nil then
        SetOrdProp( Application.Components[I], P, DMServ.CurManager );
    end;
  end;

  if ElemUserRole<>nil then
    ElemUserRole.RefreshRole( DMServ.CurManager, Elem_UsersQry.DBGetParamConnect );
end;

procedure TFormMenuTop.UpdateManagerName;
begin
  StatusBarForm.StatusBar.Panels[0].Text := GetManagerName;
end;

procedure TFormMenuTop.Prepare;
begin
  SetActionState;
  Application.OnHint := ShowHint;
  Application.OnRestore := FormRestore;
  FActivation := True;
  //UpdateManagerName;
end;

procedure TFormMenuTop.FormActivate(Sender: TObject);
begin
  if FActivation then
  begin
    Application.ProcessMessages;
    SetWindowSizes;
    ParamResponse;
    FActivation := False;
  end;
end;

procedure TFormMenuTop.ShowHint(Sender: TObject);
begin
  if Assigned(StatusBarForm) then
    with StatusBarForm.StatusBar.Panels do
      Items[Count - 1].Text := GetLongHint(Application.Hint);
end;

procedure TFormMenuTop.FormRestore(Sender: TObject);
begin
  SetWindowApril;
end;

procedure TFormMenuTop.LoginActionExecute(Sender: TObject);
begin
  CheckManager;
end;

procedure TFormMenuTop.DictionaryCurrencyActionExecute(Sender: TObject);
begin
  //ShowCurrencyBrowse(0, DMServ.CurManager);
end;

procedure TFormMenuTop.DictionaryRoomViewsActionExecute(Sender: TObject);
begin
  //ShowRoomViewBrowse(0, DMServ.CurManager);
end;

procedure TFormMenuTop.DictionaryProvinceActionExecute(Sender: TObject);
begin
  //ShowProvinceBrowse(0, 0, DMServ.CurManager);
end;

procedure TFormMenuTop.DictionaryDriveActionExecute(Sender: TObject);
begin
  ShowDriveBrowse('Транспортні засоби', DMServ.CurManager, DMServ.CurManagerName );
end;

procedure TFormMenuTop.DictionaryHotelActionExecute(Sender: TObject);
begin
  //ShowHotelBrowse(0, 0, DMServ.CurManager);
  ShowEditHotels( 'Довідник готелів', DMServ.CurManager );
end;

procedure TFormMenuTop.DictionaryInterestActionExecute(Sender: TObject);
begin
  //ShowInterestBrowse(0, 0, DMServ.CurManager);
end;

procedure TFormMenuTop.DictionaryCompanyActionExecute(Sender: TObject);
begin
  MyShowCompanyBrowse('Реквізити партнерів', DMServ.CurManager,  DMServ.CurManagerName, True );
end;

procedure TFormMenuTop.HelpContentsActionExecute(Sender: TObject);
begin
  with Screen do
    if ActiveControl.HelpContext <> 0 then
      Application.HelpContext(ActiveControl.HelpContext)
    else if ActiveForm.HelpContext <> 0 then
      Application.HelpContext(ActiveForm.HelpContext)
    else Application.HelpCommand(HELP_FINDER, 0);
end;

procedure TFormMenuTop.HelpAboutActionExecute(Sender: TObject);
begin
  //ShowAboutDlg;
end;

procedure TFormMenuTop.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TFormMenuTop.ToolButton19Click(Sender: TObject);
var S: String;
begin
  //Form2.Show;
  Exit;
  {}
  with DMServ do
    try
      Elem_BankQry.DBOpen;
      Elem_BankQry.DB.DisableControls;
      Elem_BankQry.DB.First;
      //CachedUpdates := True;
      while not Elem_BankQry.DB.Eof do
      begin
        S := Elem_BankQry.DB.FieldByName('NAME').AsString;// BankTableNAME.Value;
        Elem_BankQry.DB.Edit;
        {S := StringReplace(S, 'Києв', 'Київ', [rfReplaceAll]);
        S := StringReplace(S, 'КИЄВ', 'КИЇВ', [rfReplaceAll]);
        S := StringReplace(S, 'Миколаєв', 'Миколаїв', [rfReplaceAll]);
        S := StringReplace(S, 'Украєн', 'Україн', [rfReplaceAll]);
        S := StringReplace(S, 'УКРАЄH', 'УКРАЇН', [rfReplaceAll]);}
        S := StringReplace(S, 'Луганськоє', 'Луганської', [rfReplaceAll, rfIgnoreCase]);
        {S := StringReplace(S, 'Вiнницькоє', 'Вінницької', [rfReplaceAll]);
        //S := StringReplace(S, 'Волинськоє', 'Волинської', [rfReplaceAll]);
        //S := StringReplace(S, 'Луганськоє', 'Луганської', [rfReplaceAll]);
        S := StringReplace(S, 'Днiпропетровськоє', 'Дніпропетровської', [rfReplaceAll]);
        //S := StringReplace(S, 'Донецькоє', 'Донецької', [rfReplaceAll]);
        S := StringReplace(S, 'Львiвськоє', 'Львівської', [rfReplaceAll]);
        //S := StringReplace(S, 'Житомирськоє', 'Житомирської', [rfReplaceAll]);
        S := StringReplace(S, 'Запорiзькоє', 'Запорізької', [rfReplaceAll]);
        //S := StringReplace(S, 'Закарпатськоє', 'Закарпатської', [rfReplaceAll]);
        S := StringReplace(S, 'Франкiвськоє', 'Франківської', [rfReplaceAll]);
        S := StringReplace(S, 'Кiровоградськоє', 'Кіровоградської', [rfReplaceAll]);
        //S := StringReplace(S, 'Київськоє', 'Київської', [rfReplaceAll]);
        //S := StringReplace(S, 'Миколаївськоє', 'Миколаївської', [rfReplaceAll]);
        //S := StringReplace(S, 'Одеськоє', 'Одеської', [rfReplaceAll]);
        //S := StringReplace(S, 'Полтавськоє', 'Полтавської', [rfReplaceAll]);
        S := StringReplace(S, 'Рiвненськоє', 'Рівненської', [rfReplaceAll]);
        //S := StringReplace(S, 'Сумськоє', 'Сумської', [rfReplaceAll]);
        S := StringReplace(S, 'Тернопiльськоє', 'Тернопільської', [rfReplaceAll]);
        S := StringReplace(S, 'Харкiвськоє', 'Харківської', [rfReplaceAll]);}
        {S := StringReplace(S, 'Херсонськоє', 'Херсонської', [rfReplaceAll]);
        S := StringReplace(S, 'Хмельницькоє', 'Хмельницької', [rfReplaceAll]);
        S := StringReplace(S, 'Черкаськоє', 'Черкаської', [rfReplaceAll]);
        S := StringReplace(S, 'Чернiгiвськоє', 'Чернігівської', [rfReplaceAll]);
        S := StringReplace(S, 'Чернiвецькоє', 'Чернівецької', [rfReplaceAll]);
        //S := StringReplace(S, 'Київі', 'Києві', [rfReplaceAll, rfIgnoreCase]);}
        //BankTableNAME.Value := S;
        Elem_BankQry.DB.FieldByName('NAME').AsString:=S;
        Elem_BankQry.DB.Post;
        Elem_BankQry.DB.Next;
        //Post;
        //Next;
      end;
      //Refresh;
      //Database.ApplyUpdates([BankTable]);
    finally
      //CancelUpdates;
      //CachedUpdates := False;
      Elem_BankQry.DB.EnableControls;
    end;
end;

procedure TFormMenuTop.ToolButton20Click(Sender: TObject);
begin
  //TestForm.Show;
end;

procedure TFormMenuTop.ContrTemplActionExecute(Sender: TObject);
begin
  ExecuteContractTemplates
end;

procedure TFormMenuTop.DictionaryExpandRoomNameActionExecute(Sender: TObject);
begin
  //ShowExpandRoomNameBrowse(0, DMServ.CurManager);
end;

procedure TFormMenuTop.DictionaryNaturObjTypeActionExecute(Sender: TObject);
begin
  //ShowTypeNaturObj( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.DictionaryNaturObjActionExecute(Sender: TObject);
begin
  //ShowNaturObj( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.DictionaryAdminUnitTypeActionExecute(Sender: TObject);
begin
  //ShowAdminUnitTypeBrowse(0, DMServ.CurManager);
end;

procedure TFormMenuTop.ButToolsMergeLog1CClick(Sender: TObject);
begin
  ShowMergeLog1C( Elem_COMPANYQRY , DMServDic.cxStyle216 );
end;

procedure TFormMenuTop.DictionarySectionActionExecute(Sender: TObject);
begin
  ShowDicDictSectItem( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butCountryInfoTypeClick(Sender: TObject);
begin
  ShowDicCountriesTypeInfo( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butLanguagesClick(Sender: TObject);
begin
  ShowDicLanguages( TMenuItem(Sender).Caption );
end;
                                
procedure TFormMenuTop.butReligionsClick(Sender: TObject);
begin
  ShowDicReligions( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butDictUnitMeashurClick(Sender: TObject);
begin
  ShowDicMeasur( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butDicKindCarClick(Sender: TObject);
begin
  ShowDicCarTypeInfo( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butDicVoltTypeClick(Sender: TObject);
begin
  ShowDicPowerVolt( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butDicFregTypeClick(Sender: TObject);
begin
  ShowDicFregType( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butInternacionalOrgClick(Sender: TObject);
begin
  ShowDicInternacionalOrg( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butLngTranslateTemplateDicClick(Sender: TObject);
begin
  ShowDicLngTrasnlTeplate( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butTemplateToutProgramClick(Sender: TObject);
begin
  ShowDicSchedItemToursWebTemplate( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butTemplateTimeToutProgramClick(Sender: TObject);
begin
  ShowDicSchedItemToursWebTimeTemplate( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butDicTimeZoneClick(Sender: TObject);
begin
  ShowDicTimeZone( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.SynchronizeWithStatusBarForm;
var 
   Desktop:   TRect;
   CurrMonitor:TMonitor;
begin
  if StatusBarForm<>nil then
  begin
    CurrMonitor := screen.MonitorFromWindow(Self.Handle);
    StatusBarForm.Top := CurrMonitor.WorkareaRect.Bottom - StatusBarForm.Height;

    StatusBarForm.Left :=self.Left;
    StatusBarForm.Width:=self.Width;
  end;
end;

procedure TFormMenuTop.OnMove(var Msg: TWMMove);
begin
  inherited;
  SynchronizeWithStatusBarForm;
end;

procedure TFormMenuTop.FormResize(Sender: TObject);
begin
  SynchronizeWithStatusBarForm;
end;

procedure TFormMenuTop.ButExcursionPlaceClick(Sender: TObject);
begin
  ShowDicExcursionPlace( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.ButDicExcursionByTripClick(Sender: TObject);
begin
  ShowDicExcursionByTypeTrip( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.ButDicExcursionByContextClick(Sender: TObject);
begin
  ShowDicExcursionByContent( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butFormGovernmentClick(Sender: TObject);
begin
  ShowDicFormGovernment( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butOrgFormCompanyClick(Sender: TObject);
begin
  ShowDicFormOrg( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butOccupationsClick(Sender: TObject);
begin
  ShowDicOccupations( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.ButToolsLogClick(Sender: TObject);
begin
  ShowLog( nil, Elem_UsersQry.DBGetParamConnect, Elem_UsersQry.GetCurrManagerId, -1 ,[]);
  //ShowLog( DMServ.Database, DMServ.Database.Params.Values['user_name'], DMServ.Database.Params.Values['password'],nil, DMServ.cxStyle215 ) ;
end;

procedure TFormMenuTop.DictionaryResortActionExecute(Sender: TObject);
begin
  ShowDicResort( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butKindStrClick(Sender: TObject);
begin
  ShowKindStreet ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butKindContractClick(Sender: TObject);
begin
  ShowKindContract( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.N37Click(Sender: TObject);
begin
  ShowDicNaturObj( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butKindServiceClick(Sender: TObject);
begin
  ShowDicServiceKind( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butTypeServicesClick(Sender: TObject);
begin
   ShowDicServiceType( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.ButServiceTypeConditionsClick(Sender: TObject);
begin
  ShowDicServiceTypeConditions( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butOtherServClick(Sender: TObject);
begin
  ShowOtherServices( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butGroupHotelsClick(Sender: TObject);
begin
  ShowHtlGroup( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butKindHotelClick(Sender: TObject);
begin
  ShowHtlKind( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butHtlBuildsClick(Sender: TObject);
begin
  ShowBuilds ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butRoomTypeClick(Sender: TObject);
begin
  ShowRoomType( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butRoomExpandNameClick(Sender: TObject);
begin
  ShowRoomExpandName( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butBedTypeClick(Sender: TObject);
begin
  ShowBedType( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butFeedTypesClick(Sender: TObject);
begin
  ShowFeedTypes( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.DictionaryServiceBtnClick(Sender: TObject);
begin
  ShowServicesBrowse( 'Послуги' );
end;

procedure TFormMenuTop.DictionaryCurrencyBtnClick(Sender: TObject);
begin
  ShowCurrencyType( 'Довідник грошові одиниці' );
end;

procedure TFormMenuTop.DictionaryBankBtnClick(Sender: TObject);
begin
  ShowBank ( 'Довідник банки' );
end;

procedure TFormMenuTop.butAdminUnitClick(Sender: TObject);
begin
  ShowCountryTemlAdminUnit( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.N15Click(Sender: TObject);
begin
  ShowSystemTaxBrowse(TMenuItem(Sender).Caption);
end;

procedure TFormMenuTop.N45Click(Sender: TObject);
begin
   ShowDicInfraObj( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butKindOjBranchClick(Sender: TObject);
begin
  ShowDicCompParamName( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.DictionaryExursBtnClick(Sender: TObject);
begin
  ShowDicDictExcursion( TToolButton(Sender).Caption );
end;

procedure TFormMenuTop.butKindObjBranchClick(Sender: TObject);
begin
  ShowDicCompParamKind ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.HotellClassClick(Sender: TObject);
begin
  ShowHotelCLASS ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butComunicationTypeClick(Sender: TObject);
begin
  ShowComunicationTypes( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butGroupAdminUnitClick(Sender: TObject);
begin
  ShowAdmin_unitAndSub( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butTourObjectClick(Sender: TObject);
begin
  ShowTourObjects( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.ShowDicAdminUnitItems(Sender: TObject);
begin
  //if Elem_CITY_ADM_UNT_ITEMS_TYPEQry.DB.Locate( Elem_CITY_ADM_UNT_ITEMS_TYPEQry.FieldKod,TMenuItem(Sender).Tag,[]) then
  //  ShowAdmin_unitAndSub ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.CityPopupMenuPopup(Sender: TObject);
begin
  //CreateMenuDB( Elem_CITY_ADM_UNT_ITEMS_TYPEQry.DB, 'ID', 'NAME', 'MenUnitItem_',  butTypeAdminUnit, ShowDicAdminUnitItems );
end;


procedure TFormMenuTop.DictionaryCityBtnClick(Sender: TObject);
begin
  ShowEditCountryCity( TToolButton(Sender).Caption, DMServ.CurManager );
end;

procedure TFormMenuTop.Button1Click(Sender: TObject);
var DB:TDataset;
    param:TConnectDBParam;
    CurPhone:WideString;
    Elem:TDBShema;
    Progres : TProgressFormProp;
    Sql:string;
    aList:TStringList;
        a:TAction;
begin
 { aList:=TStringList.Create;
  param := Elem_UsersQry.DBGetParamConnect;
  DB := UnitIBQuery.GetAllTables( param.PathDB, param.UID, param.Password );
  while not DB.Eof do
  begin
    if not DB.FieldByName('DESCRIPT').IsNull then
    begin
      Sql :=' update RDB$RELATIONS set RDB$DESCRIPTION = '+SetNormalValueForSql( Trim(DB.FieldByName('DESCRIPT').AsString))+' where RDB$RELATION_NAME='+#39+Trim( DB.FieldByName('TABLE_NAME').AsString)+#39+';';
      aList.Add( Sql );
    end;
    DB.Next;
  end;}

 { DestroyDB(DB);

  aList.SaveToFile(ExtractFilePath(Application.ExeName)+'TableDescript.Sql');
  aList.Free; }
{  Sql := 'select COMUNICATION_PERSON.* from COMUNICATION_PERSON ';

  param := Elem_COMPANYQRY.DBGetParamConnect;
  DB := DBCreate( Sql, nil, param);
  Progres := ShowProgress( WaitFormCaption );
  Elem:=TDBShema.Create(DB,'COMUNICATION_PERSON','ID','');
  While not Elem.DB.Eof do
  begin
    CurPhone := Elem.DB.FieldByName('AVALUE').asString;
    //ReplaseON(CurPhone,'(','');
    //ReplaseON(CurPhone,')','');
    ReplaseON(CurPhone,' ','');

    //CurPhoneNew := Elem.DB.FieldByName('NEWPHONE').asString;
    if CurPhone<>'' then
    begin
      Elem.DB.Edit;
      Elem.DB.FieldByName('AVALUE').asString := CurPhone;
      Elem.DB.Post;
    end;
    Elem.DB.Next;
  end;

  Elem.Close;
  ClosedProgress( Progres.FormProgres );}
end;

procedure TFormMenuTop.FormCreate(Sender: TObject);
begin
  Prepare;
end;

procedure TFormMenuTop.N4Click(Sender: TObject);
begin
  ShowDocVisa ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butKindPasportClick(Sender: TObject);
begin
  ShowPasportKinds ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.ButDocStateClick(Sender: TObject);
begin
  ShowDicState ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butSponsorClick(Sender: TObject);
begin
  ShowDicSponsor( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butActionCompanyClick(Sender: TObject);
begin
  ShowDicActionComp( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butCompanyDocTypeClick(Sender: TObject);
begin
  ShowCompDocType( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butReposKindClick(Sender: TObject);
begin
  ShowDicReposKind ( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butPaymentBySponsorClick(Sender: TObject);
begin
  ShowDicPaymentBySponsor( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butMismatchDocClick(Sender: TObject);
begin
  ShowDicMismatchDoc( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butKindVasaDocClick(Sender: TObject);
begin
  ShowDicVisaDocType( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butDocForClick(Sender: TObject);
begin
  ShowDicDocFor( TMenuItem(Sender).Caption );
end;

procedure TFormMenuTop.butCreditCardClick(Sender: TObject);
begin
  ShowDicCreditCard( TMenuItem(Sender).Caption );
end;

end.



{var DB:TDataset;
    param:TConnectDBParam;
    CurPhone:WideString;
    Elem:TDBShema;
    Progres : TProgressFormProp;
begin
 Sql := 'select COMUNICATION_COMPANY.*, '+
  ' case '+
  '  when ( (substr(COMPPHONES.cntrycode, strlen(COMPPHONES.cntrycode), strlen(COMPPHONES.cntrycode) ) = ''0'') and (substr(COMPPHONES.areacode, 1, 1) = ''0'') ) then '+
  ' ''+''||COMPPHONES.cntrycode ||''(''|| substr(COMPPHONES.areacode, 2, strlen(COMPPHONES.cntrycode) ) ||'')''|| COMPPHONES.phoneno  '+
  '  else ''+''||COMPPHONES.cntrycode ||''(''|| COMPPHONES.areacode||'')''|| COMPPHONES.phoneno '+
  ' end NEWPHONE '+

  ' from COMUNICATION_COMPANY '+
  ' left join COMPPHONES on COMPPHONES.phoneid = COMUNICATION_COMPANY.old_id '+
  ' where  COMUNICATION_COMPANY.id_comunication_type in (1,2,9)';

  param := Elem_COMPANYQRY.DBGetParamConnect;
  DB := DBCreate( Sql, nil, param);
  Progres := ShowProgress( WaitFormCaption );
  Elem:=TDBShema.Create(DB,'COMUNICATION_COMPANY','ID','');
  While not Elem.DB.Eof do
  begin
    CurPhone := Elem.DB.FieldByName('AVALUE').asString;
    CurPhoneNew := Elem.DB.FieldByName('NEWPHONE').asString;
    if CurPhone<>'' then
    begin
      Elem.DB.Edit;
      Elem.DB.FieldByName('AVALUE').asString := CurPhoneNew;
      Elem.DB.Post;
    end;
    Elem.DB.Next;
  end;

  Elem.Close;
  ClosedProgress( Progres.FormProgres ); }



 { Table Comments

  var DB:TDataset;
    param:TConnectDBParam;
    CurPhone:WideString;
    Elem:TDBShema;
    Progres : TProgressFormProp;
    Sql:string;
    aList:TStringList;
begin
  aList:=TStringList.Create;
  param := Elem_UsersQry.DBGetParamConnect;
  DB := UnitIBQuery.GetAllTables( param.PathDB, param.UID, param.Password );
  while not DB.Eof do
  begin
    if not DB.FieldByName('DESCRIPT').IsNull then
    begin
      Sql :=' update RDB$RELATIONS set RDB$DESCRIPTION = '+SetNormalValueForSql( Trim(DB.FieldByName('DESCRIPT').AsString))+' where RDB$RELATION_NAME='+#39+Trim( DB.FieldByName('TABLE_NAME').AsString)+#39+';';
      aList.Add( Sql );
    end;
    DB.Next;
  end;

  DestroyDB(DB);

  aList.SaveToFile(ExtractFilePath(Application.ExeName)+'TableDescript.Sql');
  aList.Free;}




