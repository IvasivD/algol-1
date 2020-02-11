unit SdiMain;

interface

uses Windows, Classes, Forms, Controls, Menus, ComCtrls, ToolWin, ActnList,
  StdActns, VDlgs, TourFerr_TLB;

type
  TSDIAppForm = class(TForm)
    ActionList: TActionList;
    OrderBrowseAction: TAction;
    OrderNewAction: TAction;
    TripBrowseAction: TAction;
    MasterTripAction: TAction;
    TripDecisionAction: TAction;
    InsuranceAction: TAction;
    HotelBrowseAction: TAction;
    MasterHotelAction: TAction;
    RateHotelAction: TAction;
    RateRouteAction: TAction;
    MasterCurrencyAction: TAction;
    DictionaryCityAction: TAction;
    DictionaryDriveKindAction: TAction;
    DictionaryHotelGroupAction: TAction;
    DictionaryHotelCategoryAction: TAction;
    DictionaryRoomTypesAction: TAction;
    DictionaryServiceAction: TAction;
    DictionaryCurrencyAction: TAction;
    DictionaryCompanyAction: TAction;
    DictionaryReklamaAction: TAction;
    ToolsOptionAction: TAction;
    FileSuspendAction: TAction;
    CloseAction: TAction;
    PopupMenu: TPopupMenu;
    ServiceMenu: TMenuItem;
    TripMenu: TMenuItem;
    TripBrowseItem: TMenuItem;
    N8: TMenuItem;
    TripDecisionItem: TMenuItem;
    HotelBrowseItem: TMenuItem;
    InsuranceItem: TMenuItem;
    N2: TMenuItem;
    FileExitItem: TMenuItem;
    ClientMenu: TMenuItem;
    OrderBrowseItem: TMenuItem;
    OrderNewItem: TMenuItem;
    DictionaryMenu: TMenuItem;
    DictionaryCityItem: TMenuItem;
    DictionaryDriveKindItem: TMenuItem;
    DictionaryHotelMenu: TMenuItem;
    DictionaryHotelGroupItem: TMenuItem;
    DictionaryHotelCategoryItem: TMenuItem;
    DictionaryRoomTypesItem: TMenuItem;
    DictionaryServiceItem: TMenuItem;
    DictionaryCurrencyItem: TMenuItem;
    DictionaryReklamaItem: TMenuItem;
    DictionaryCompanyItem: TMenuItem;
    ToolsMenu: TMenuItem;
    ToolsSettingItem: TMenuItem;
    FileSuspendItem: TMenuItem;
    N13: TMenuItem;
    ToolsOptionItem: TMenuItem;
    AdminMenu: TMenuItem;
    AdminTripMasterItem: TMenuItem;
    AdminHotelMasterItem: TMenuItem;
    AdminRateMasterItem: TMenuItem;
    AdminRouteRateItem: TMenuItem;
    AdminCurrencyMasterItem: TMenuItem;
    HelpMenu: TMenuItem;
    N17: TMenuItem;
    HelpAboutItem: TMenuItem;
    CoolBar: TCoolBar;
    MenuToolBar: TToolBar;
    ServiceMenuTbtn: TToolButton;
    ClientMenuTbtn: TToolButton;
    BrowseMenuTbtn: TToolButton;
    ToolMenuTbtn: TToolButton;
    AdminMenuTBtn: TToolButton;
    HelpMenuTbtn: TToolButton;
    WorkToolBar: TToolBar;
    OrderTbtn: TToolButton;
    TripToolBtn: TToolButton;
    HotelTbtn: TToolButton;
    InsuranceTbtn: TToolButton;
    UserToolBar: TToolBar;
    ToolButton1: TToolButton;
    AdminDataImageAction: TAction;
    N1: TMenuItem;
    AdminDataImageItem: TMenuItem;
    HelpContentsAction: THelpContents;
    HelpFinderAction: THelpTopicSearch;
    HelpOnHelpAction: THelpOnHelp;
    HelpContentsItem: TMenuItem;
    HelpSearchItem: TMenuItem;
    HelpHowToUseItem: TMenuItem;
    ManageVisasAction: TAction;
    ManageVisasItem: TMenuItem;
    ManageExcursionAction: TAction;
    ManageExcursionItem: TMenuItem;
    ManageToursAction: TAction;
    ManageToursItem: TMenuItem;
    N6: TMenuItem;
    OrderClientsAction: TAction;
    OrderClientsItem: TMenuItem;
    HelpAboutAction: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ViewMenu: TMenuItem;
    ToolsSettingAction: TAction;
    ToolsCaptionsAction: TAction;
    N3: TMenuItem;
    RatesMenu: TMenuItem;
    ToolButton6: TToolButton;
    RateInsureAction: TAction;
    RateVisaAction: TAction;
    RateExcursionAction: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    ToolButton7: TToolButton;
    MasterMenu: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    AdminAccessAction: TAction;
    AdminUsersAction: TAction;
    AdminLogAction: TAction;
    N12: TMenuItem;
    N14: TMenuItem;
    MasterInsureAction: TAction;
    MasterVisaAction: TAction;
    MasterExcursionAction: TAction;
    MasterTemplateAction: TAction;
    MasterInsureAction1: TMenuItem;
    MasterExcursionAction1: TMenuItem;
    MasterVisaAction1: TMenuItem;
    N9: TMenuItem;
    N15: TMenuItem;
    MasterToursAction: TAction;
    N16: TMenuItem;
    N18: TMenuItem;
    DictionaryFeedTypesAction: TAction;
    OrderReportCashAction: TAction;
    N19: TMenuItem;
    OrderMemoAction: TAction;
    ToolButton2: TToolButton;
    N20: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AppRestore(Sender: TObject);
    procedure ShowHint(Sender: TObject);
    procedure CoolBarResize(Sender: TObject);
    procedure UserToolBarDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure UserToolBarDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure AdminTbtnClick(Sender: TObject);
    procedure FileSuspendActionExecute(Sender: TObject);
    procedure OrderBrowseActionExecute(Sender: TObject);
    procedure OrderNewActionExecute(Sender: TObject);
    procedure OrderReportCashActionExecute(Sender: TObject);
    procedure OrderMemoActionExecute(Sender: TObject);
    procedure ManageToursActionExecute(Sender: TObject);
    procedure MasterTripActionExecute(Sender: TObject);
    procedure TripBrowseActionExecute(Sender: TObject);
    procedure MasterHotelActionExecute(Sender: TObject);
    procedure HotelBrowseActionExecute(Sender: TObject);
    procedure InsuranceActionExecute(Sender: TObject);
    procedure DictionaryCityActionExecute(Sender: TObject);
    procedure DictionaryDriveKindActionExecute(Sender: TObject);
    procedure DictionaryCurrencyActionExecute(Sender: TObject);
    procedure DictionaryHotelGroupActionExecute(Sender: TObject);
    procedure DictionaryHotelCategoryActionExecute(Sender: TObject);
    procedure DictionaryRoomTypesActionExecute(Sender: TObject);
    procedure DictionaryFeedTypesActionExecute(Sender: TObject);
    procedure DictionaryServiceActionExecute(Sender: TObject);
    procedure DictionaryReklamaActionExecute(Sender: TObject);
    procedure DictionaryCompanyActionExecute(Sender: TObject);
    procedure ToolsOptionActionExecute(Sender: TObject);
    procedure RateHotelActionExecute(Sender: TObject);
    procedure RateRouteActionExecute(Sender: TObject);
    procedure MasterTemplateActionExecute(Sender: TObject);
    procedure MasterCurrencyActionExecute(Sender: TObject);
    procedure MasterExcursionActionExecute(Sender: TObject);
    procedure MasterToursActionExecute(Sender: TObject);
    procedure AdminDataImageActionExecute(Sender: TObject);
    procedure HelpAboutActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ManageVisasActionExecute(Sender: TObject);
  private
    FNeedCheckAccess: Boolean;
    FFerrIntf: ITripPlacement;
    procedure CheckAccess;
    {function CheckExchangeActual(CurrId: Integer): Boolean;}
    function CheckInputAccess: Boolean;
    procedure ExecuteDictionaryAction(Action: TAction; MId, DId: Longint);
    procedure LaunchUtility(const ExeName, Params, Title: String; var UtilHnd: Cardinal);
    procedure SetGlobalFormats;
    procedure SetWindowSizes;
    procedure WorkAccessMode;
  public
    //procedure DMHotelQryScrolled(var Msg: TDataScrollMsg); message dm_HotelQryScrolled;
    procedure DMHotelTblScrolled(var Msg: TDataScrollMsg); message dm_HotelTblScrolled;
    procedure DMRouteTblScrolled(var Msg: TDataScrollMsg); message dm_RouteTblScrolled;
    procedure DMTripsQryScrolled(var Msg: TDataScrollMsg); message dm_TripsQryScrolled;
    procedure DMVisasQryScrolled(var Msg: TDataScrollMsg); message dm_VisasQryScrolled;
    procedure WMMyStatusMsg(var Msg: TMyStatusMsg); message wm_MyStatusMsg;
  end;

var
  SDIAppForm: TSDIAppForm;

implementation

uses
  Messages, SysUtils, DBConsts, TourConsts, StatForm, OptSet, DataMod, PswrdUn,
  DictLIf, DataImgFrm, TourCmnlIf, TourMbplIf, About, PlaceFrm, {RoomsFrm, }
  TourGrBr, BillRepFrm, ComObj, TourUnts;

{$R *.DFM}

var
  HAppInsure: Cardinal;

{ TSDIAppForm }

procedure TSDIAppForm.CheckAccess;
begin
  Exit;
  if not FNeedCheckAccess then Exit
  else if CheckInputAccess then FNeedCheckAccess := False else TermForm;
end;

{function TSDIAppForm.CheckExchangeActual(CurrId: Integer): Boolean;
begin
  Result := IsCurrencyCommerceActual(CurrId);
  OrderBrowseAction.Enabled := Result;
  OrderNewAction.Enabled := Result;
end;}

function TSDIAppForm.CheckInputAccess: Boolean;
begin
  Result := AskBpLgStr;
  WorkAccessMode;
end;

procedure TSDIAppForm.ExecuteDictionaryAction(Action: TAction; MId, DId: Longint);
begin
  Action.Enabled := ShowDictionaryBrowse(Action.Tag, MId, DId);
end;

procedure TSDIAppForm.LaunchUtility(const ExeName, Params, Title: String;
  var UtilHnd: Cardinal);
begin
  {if UtilHnd > 32 then PostMessage(HAppInsure, WM_ACTIVATE, 0, 0)
  else }UtilHnd := ShellUtil(ExeName, Params, Title);
end;

procedure TSDIAppForm.SetGlobalFormats;
begin   //set national global variables
  ShortDateFormat := 'dd.mm.yyyy';
  CurrencyString := '';
end;

procedure TSDIAppForm.SetWindowSizes;
var R: TRect;
begin
  ClientHeight := CoolBar.Height;
  Width := Screen.Width;
  Left := 0;
  Top := 0;
  if GetMainOptions then Exit;
  if SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0) then
  begin // correct heights and widths in order of Work area
    Top := R.Top;
    hClientWindow := R.Bottom - Height - Top;
    Width := R.Right;
  end;
  Constraints.MaxHeight := Height;
  yClientWindow := Height + Top; //top of other windows
  if wClientWindow < Width then wClientWindow := Width; // <=800
  gPixelsPerInch := PixelsPerInch; // scale constant
  xBrowseWindow := xClientWindow + 80;
  yBrowseWindow := yClientWindow;
end;

procedure TSDIAppForm.WorkAccessMode;
begin
  AdminMenu.Enabled := AppAccessMode = accsAdministrator;
  AdminMenuTBtn.Enabled := AdminMenu.Enabled;
  OrderBrowseAction.Visible := AppAccessMode <> accsGuest;
  MasterTripAction.Visible := AppAccessMode = accsAdministrator;
  TripBrowseAction.Visible := AppAccessMode <> accsGuest;
  TripDecisionAction.Visible := AppAccessMode <> accsGuest;
  HotelBrowseAction.Visible := AppAccessMode <> accsGuest;
  InsuranceAction.Visible := AppAccessMode <> accsGuest;
  DictionaryDriveKindAction.Visible := AppAccessMode <> accsGuest;
  ToolsOptionAction.Visible := AppAccessMode = accsAdministrator;
end;

{procedure TSDIAppForm.DMHotelQryScrolled(var Msg: TDataScrollMsg);
begin
  if Assigned(OrderEditForm) then OrderEditForm.HotelByOrderQryScrolled;
end;}

procedure TSDIAppForm.DMHotelTblScrolled(var Msg: TDataScrollMsg);
begin
  //if Assigned(RoomsEditForm) then RoomsEditForm.HotelQryUpdated;
end;

procedure TSDIAppForm.DMRouteTblScrolled(var Msg: TDataScrollMsg);
begin
  if Assigned(PlacementEditForm) then PlacementEditForm.RouteTblSrcAfterScroll;
end;

procedure TSDIAppForm.DMTripsQryScrolled(var Msg: TDataScrollMsg);
begin
  //another application >
  {if Assigned(OrderEditForm) then OrderEditForm.TripQrySrcAfterScroll;
  if Assigned(PlacementEditForm) then PlacementEditForm.TripQrySrcAfterScroll;}
end;

procedure TSDIAppForm.DMVisasQryScrolled(var Msg: TDataScrollMsg);
begin
  //another application >
  {if Assigned(OrderEditForm) then OrderEditForm.VisaQrySrcAfterScroll;}
end;

procedure TSDIAppForm.WMMyStatusMsg(var Msg: TMyStatusMsg);
begin
  with StatusBarForm.StatusBar do
  begin
    Panels.Items[1].Text := GetLongHint(Msg.Symb);
    Update;
  end;
end;

procedure TSDIAppForm.FormCreate(Sender: TObject);
begin
  SetWindowSizes;
  MainFormHandle := Handle;  //for sending status bar messages
  FNeedCheckAccess := True;  //need password dialog activate
  Application.OnHint := ShowHint;
  Application.OnRestore := AppRestore;
  SetGlobalFormats;
  OptionSet := TOptionSet.Create;
  if OptionSet.DatabaseFolder = '' then Application.Terminate;
end;

procedure TSDIAppForm.FormActivate(Sender: TObject);
begin
  CheckAccess;
end;

procedure TSDIAppForm.AppRestore(Sender: TObject);
begin
  FNeedCheckAccess := True;
  CheckAccess;
end;

procedure TSDIAppForm.ShowHint(Sender: TObject);
begin
  if Assigned(StatusBarForm) then
    with StatusBarForm.StatusBar.Panels do
      Items[Count - 1].Text := GetLongHint(Application.Hint);
end;

procedure TSDIAppForm.CoolBarResize(Sender: TObject);
begin
  ClientHeight := CoolBar.Height;
end;

procedure TSDIAppForm.UserToolBarDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := (Sender <> Source) and (Source is TToolButton);
end;

procedure TSDIAppForm.UserToolBarDragDrop(Sender, Source: TObject;
  X, Y: Integer);
begin
  if (Source is TToolButton) then
    with TToolButton.Create(Self) do
    begin
      Parent := UserToolBar;
      ImageIndex := (Source as TToolButton).ImageIndex;
      Name := (Source as TToolButton).Name;
      OnClick := (Source as TToolButton).OnClick;
      Style := (Source as TToolButton).Style;
    end;
end;

procedure TSDIAppForm.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  //OrderNewAction.Enabled := False; //another application > not OrderEditForm.Visible;
end;

procedure TSDIAppForm.AdminTbtnClick(Sender: TObject);
//var P: TPoint;
begin
  {with AdminTbtn do
  begin
    P := ClientToScreen(Point(Left, Top));
    ConstructPopupMenu.Popup(WorkToolBar.Left + Left + 4, P.y + Height);
  end;}
end;

procedure TSDIAppForm.FileSuspendActionExecute(Sender: TObject);
begin
  Application.Minimize;
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_SCREENSAVE, 0);
end;

procedure TSDIAppForm.OrderBrowseActionExecute(Sender: TObject);
begin
  {if not CheckExchangeActual(OptionSet.CurrencyInter) then
    ErrorFmtDlg(SOrderBrErrorExchangeNotActual, [''])
  else }
  //if OrderEditForm.Visible then OrderEditForm.Show else OrderBrowseForm.Show;
  //ShellUtil(fShlBrwsOrder, ParBpLgStr, OrderBrowseAction.Caption);
  LaunchOrderBrowser(OrderBrowseAction.Caption, nParIdNone);
end;

procedure TSDIAppForm.OrderNewActionExecute(Sender: TObject);
begin                                                      
  {with OrderBrowseForm do
  begin
    Show;
    EditTbtnClick(AppendTbtn);
  end;}
  //ShellUtil(fShlBrwsOrder, ParBpLgStr + ' -new', OrderBrowseAction.Caption);
  LaunchOrderBrowser(OrderBrowseAction.Caption, nParIdNew);
end;

procedure TSDIAppForm.OrderReportCashActionExecute(Sender: TObject);
begin
  ShowOrderBillListForm;
end;

procedure TSDIAppForm.OrderMemoActionExecute(Sender: TObject);
begin
  //another application > ShowOrderPersonMemoList;
end;

procedure TSDIAppForm.ManageToursActionExecute(Sender: TObject);
begin
  TourGroupBrowseForm.Show;
end;

procedure TSDIAppForm.MasterTripActionExecute(Sender: TObject);
begin
  ShellUtility(fShlMastRoute, ParBpLgStr, '');
end;

procedure TSDIAppForm.TripBrowseActionExecute(Sender: TObject);
//var Ferr: OleVariant;
begin
  //PlacementEditForm.BrowseTrips(False);
  FFerrIntf := CoTripPlacement.Create;
  FFerrIntf.BrowseTrips(0);
end;

procedure TSDIAppForm.MasterHotelActionExecute(Sender: TObject);
begin
  // тимчасово готелі викликаються як довідник
  // пізніше - через майстер готелів
  ExecuteDictionaryAction(MasterHotelAction,
    DM.HotelQryCITYID.AsInteger, DM.HotelQryHOTELID.AsInteger);
end;

procedure TSDIAppForm.HotelBrowseActionExecute(Sender: TObject);
begin
  //RoomsEditForm.BrowseRoomings(False);
  LaunchUtility(fShlMastInsure, ParBpLgStr, InsuranceAction.Caption, HAppInsure);
end;

procedure TSDIAppForm.InsuranceActionExecute(Sender: TObject);
begin
  //ShellUtil(fShlMastInsure, ParBpLgStr, InsuranceAction.Caption);
  LaunchUtility(fShlMastInsure, ParBpLgStr, InsuranceAction.Caption, HAppInsure);
end;

procedure TSDIAppForm.ManageVisasActionExecute(Sender: TObject);
begin
  ShellUtil(fShlMastVisa, ParBpLgStr, ManageVisasAction.Caption);
end;

procedure TSDIAppForm.DictionaryCityActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryCityAction,
    DM.CityByCntryTableCountryId.AsInteger, DM.CityByCntryTableCityId.AsInteger);
end;

procedure TSDIAppForm.DictionaryDriveKindActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryDriveKindAction,
    DM.DriveMapQryDRIVEKIND.AsInteger, DM.DriveMapQryDRIVEID.AsInteger);
end;

procedure TSDIAppForm.DictionaryCurrencyActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryCurrencyAction, 0,
    DM.CurrencyTableCurrencyId.AsInteger);
end;

procedure TSDIAppForm.DictionaryHotelGroupActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryHotelGroupAction, 0,
    DM.HotelQryGROUPID.AsInteger);
end;

procedure TSDIAppForm.DictionaryHotelCategoryActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryHotelCategoryAction, 0,
    DM.HotelQryCATEGORYID.AsInteger);
end;

procedure TSDIAppForm.DictionaryRoomTypesActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryRoomTypesAction, 0,
    DM.RoomTypeTableRoomTypeId.AsInteger);
end;

procedure TSDIAppForm.DictionaryFeedTypesActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryFeedTypesAction, 0,
    DM.FeedTableFEEDTYPEID.AsInteger);
end;

procedure TSDIAppForm.DictionaryServiceActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryServiceAction, 0, 0);
end;

procedure TSDIAppForm.DictionaryReklamaActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryReklamaAction, 0,
    DM.ReklamaTableReklamaId.AsInteger);
end;

procedure TSDIAppForm.DictionaryCompanyActionExecute(Sender: TObject);
begin
  ExecuteDictionaryAction(DictionaryCompanyAction, 0, 0);
    //DM.ClientTableCompanyId.AsInteger);
end;

procedure TSDIAppForm.ToolsOptionActionExecute(Sender: TObject);
begin
  //ShowOptionDlg;
end;

procedure TSDIAppForm.RateHotelActionExecute(Sender: TObject);
begin
  ShellUtility(fShlRateHotel, ParBpLgStr, RateHotelAction.Caption);
end;

procedure TSDIAppForm.RateRouteActionExecute(Sender: TObject);
begin
  ShellUtility(fShlRateRoute, ParBpLgStr, RateRouteAction.Caption);
end;

procedure TSDIAppForm.MasterTemplateActionExecute(Sender: TObject);
begin
  ShellUtility(fShlMastTemplate, ParBpLgStr, '');
end;

procedure TSDIAppForm.MasterCurrencyActionExecute(Sender: TObject);
begin
  ShellUtility(fShlRateCurrency, ParBpLgStr, '');
end;

procedure TSDIAppForm.MasterExcursionActionExecute(Sender: TObject);
begin
  ShellUtility(fShlMastExcursion, ParBpLgStr, '');
end;

procedure TSDIAppForm.MasterToursActionExecute(Sender: TObject);
begin
  ShellUtility(fShlMastTours, ParBpLgStr, '');
end;

procedure TSDIAppForm.AdminDataImageActionExecute(Sender: TObject);
begin
  ShowDatabaseImageForm(DM);
end;

procedure TSDIAppForm.HelpAboutActionExecute(Sender: TObject);
begin
  ShowAboutBox;
end;

procedure TSDIAppForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TSDIAppForm.FormDestroy(Sender: TObject);
begin
  if HAppInsure > 32 then PostMessage(HAppInsure, WM_QUIT, 0, 0);
  Application.HelpCommand(HELP_QUIT, 0);
  if Assigned(OptionSet) then OptionSet.Free;
end;

procedure TSDIAppForm.ToolButton1Click(Sender: TObject);
begin
  //DM.ItalianaMacros;
end;

initialization
  HAppInsure := 0;

end.

