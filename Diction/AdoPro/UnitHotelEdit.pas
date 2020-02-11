unit UnitHotelEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxGraphics, cxControls,
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
  cxContainer, UnitFrameDicCity, cxTextEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,ServModIB,
  cxGridDBTableView, cxGrid,UnitProc,Core, Menus,UnitLngTranslateEdit,UnitLngTranslate,ClipBrd,
  DBCtrls, UnitFramePhotoList, TourCmnlIf, cxMemo, cxDBEdit ,UnitHotelInfoEdit,UnitHtlDocFrm,
  UnitFrameComRequisites, UnitComRequisites, UnitSelectVendor,UnitFrameUpdateImages,
  UnitFrameDic;

type
  TFrmHotelEdit = class(TForm)
    ModalPanel: TPanel;
    CancelBtn: TBitBtn;
    PanelLeft: TPanel;
    PanelRight: TPanel;
    Splitter1: TSplitter;
    PanelHotels: TPanel;
    PanelTop: TPanel;
    PanelLeftHotel: TPanel;
    Panel1: TPanel;
    PanelCustomer: TPanel;
    Panel2: TPanel;
    FramePhotoList: TFramePhotoList;
    FrameDicBrCountry: TFrameDic;
    FrameDicCityHotelsItems: TFrameDic;
    FrameDicHotel: TFrameDic;
    FrameDicHotelVendor: TFrameDic;
    procedure ButCountryLngClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FPathToHtml  : string;
    FPathToImage : string;
    FCurrManager : Integer;
    fIRefresh    : Boolean;
    procedure FUpdateToolActions( Value:Integer );
    procedure FRefreshControls;

  procedure FPrepareFrameDic;
  function  FGetParamImg:TViewFieldImgUpd;
  procedure Fprepare;
    { Private declarations }
  public
    procedure RefreshControlsAction(Sender: TObject);
  published
    property CurManager : integer read FCurrManager write FCurrManager;
    property EnabledUpdate:Integer write FUpdateToolActions ;
    { Public declarations }
  end;

Procedure ShowEditHotels( Caption:WideString; CurrManager:Integer );
procedure UpdateHtlVendorRequisites( isNew:Boolean; CurManager:Integer );
procedure UpdateHotels( isNew:Boolean; CurManager:Integer );
//var
//  FrmHotelEdit: TFrmHotelEdit;

implementation
Uses ServMod, UnitEditInfoCountry, OptSet, DocFileUn , ServModDic;
{$R *.dfm}

Procedure ShowEditHotels( Caption:WideString; CurrManager:Integer );
var FrmHotelEdit: TForm;
begin
  ReplaseOn( Caption,'&','');
  FrmHotelEdit := FindFormByCaptionAndRestoreOnTop( Caption );
  if FrmHotelEdit <> nil then
    TFrmHotelEdit(FrmHotelEdit).CurManager := CurrManager
  else
  begin
    Application.CreateForm(TFrmHotelEdit, FrmHotelEdit);
    FrmHotelEdit.Caption := Caption;
    TFrmHotelEdit(FrmHotelEdit).CurManager := CurrManager;
    TFrmHotelEdit(FrmHotelEdit).FPrepare;
    FrmHotelEdit.Show;
  end;
end;

procedure TFrmHotelEdit.ButCountryLngClick(Sender: TObject);
begin
  DMServIB.ShowLngForCoutry( Elem_BrCountryQry );
end;

procedure TFrmHotelEdit.FormDestroy(Sender: TObject);
begin
  FrameDicHotelVendor.DestroyFrame;
  FrameDicHotel.DestroyFrame;
  FrameDicCityHotelsItems.DestroyFrame;
  FrameDicBrCountry.DestroyFrame;
end;

procedure TFrmHotelEdit.FPrepareFrameDic;
var ParamDicCountry: TParamFormDict;
    ParamDicCityHotelsItems: TParamFormDict;
    ParamDicCityHotels: TParamFormDict;
    ParamDicDicHtlVendor: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicCountry);
  ParamDicCountry.Func.LogProc := ShowLog;
  ParamDicCountry.Update.SearchPanel := True;
  ParamDicCountry.Func.RefreshFunction := RefreshControlsAction;
  ParamDicCountry.Update.VisibleUpdate := False;
  FrameDicBrCountry.Init( Elem_BrCountryQry, Self.FCurrManager, ParamDicCountry );
  //FrameDicBrCountry.Init( Elem_BrCountryHaveHotelsQry, Self.FCurrManager, ParamDicCountry );//countries have hotels

  PrepareDefaultParamDic(ParamDicCityHotelsItems);
  ParamDicCityHotelsItems.Func.LogProc := ShowLog;
  ParamDicCityHotelsItems.Update.SearchPanel := True;
  ParamDicCityHotelsItems.Func.RefreshFunction := RefreshControlsAction;
  ParamDicCityHotelsItems.Update.VisibleUpdate := False;
  FrameDicCityHotelsItems.Init( Elem_HCityQry, Self.FCurrManager, ParamDicCityHotelsItems );

  PrepareDefaultParamDic(ParamDicCityHotels);
  ParamDicCityHotels.Func.LogProc := ShowLog;
  ParamDicCityHotels.Func.RefreshFunction := RefreshControlsAction;
  ParamDicCityHotels.Func.AddProcGridView := UpdateHotels;
  ParamDicCityHotels.Description.DescriptionStafField :='COMMENTS';
  ParamDicCityHotels.Description.DescriptionHeight := 50;
  ParamDicCityHotels.MainElem := Elem_HCityQry.GetActiveCloneElem;
  FrameDicHotel.Init( Elem_BrHotelQry, Self.FCurrManager, ParamDicCityHotels );

  PrepareDefaultParamDic(ParamDicDicHtlVendor);
  ParamDicDicHtlVendor.Func.LogProc := ShowLog;
  ParamDicDicHtlVendor.Update.SearchPanel := False;
  ParamDicDicHtlVendor.Func.AddProcGridView := UpdateHtlVendorRequisites;
  ParamDicDicHtlVendor.Func.RefreshFunction := RefreshControlsAction;
  ParamDicDicHtlVendor.MainElem := Elem_BrHotelQry.GetActiveCloneElem;
  FrameDicHotelVendor.Init( Elem_HtlVendorQry, DMServ.CurManager, ParamDicDicHtlVendor );
end;

function TFrmHotelEdit.FGetParamImg:TViewFieldImgUpd;
begin
  result.ElemImages := Elem_HtlImgQry;
  result.FieldId := Elem_HtlImgQry.FieldKod;
  result.FieldFileName := 'FILENAME';
  result.FieldWeb  := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';

  result.FieldObject :=  '';
  result.FieldObjValue := '';
end;

procedure TFrmHotelEdit.Fprepare;
begin
  fIRefresh:= False;
  FPathToImage  := OptionSet.WebPathToImage + 'HOTELS\';
  FPathToHtml   := OptionSet.WebPathToHtml + 'HOTELS\';

  FramePhotoList.IntitListPhotoFrame( FGetParamImg, OptionSet.WebPathToImage+'no-image.png' );
  FramePhotoList.SetShowDateFoto( True, 'Дата фото.' );
  FramePhotoList.SetShowCanUpdateFoto( False );

  FPrepareFrameDic;

  //Elem_BrCountryQry.DBOpen;
  Elem_BrCountryHaveHotelsQry.DBOpen;//show countries have hotels
  Elem_HCityQry.DBOpen;
  Elem_BrHotelQry.DBOpen;
  Elem_HtlVendorQry.DBOpen;
  Elem_HtlImgQry.DBOpen;
  //Elem_HtlImgQry.DBQueryChangeSql( MakeSelHtlImgSQL(HtlAllImage) );  я заремив
end;

procedure TFrmHotelEdit.FRefreshControls;
begin
  try
    fIRefresh:=true;
    //if Elem_BrCountryQry.View.ViewData.RowCount =0 then
    if Elem_BrCountryHaveHotelsQry.View.ViewData.RowCount =0 then      //show countries have hotels
    begin
      Elem_HCityQry.HideDataForFilterOnTree( True );
      Elem_BrHotelQry.HideDataForFilterOnView( True );
      Elem_HtlVendorQry.HideDataForFilterOnView( True );
    end
    else
    begin
      Elem_HCityQry.HideDataForFilterOnTree( False);
      Elem_BrHotelQry.HideDataForFilterOnView( False );
      Elem_HtlVendorQry.HideDataForFilterOnView( False );
    end;

    if Elem_HCityQry.DBRecordCount =0 then
    begin
      Elem_BrHotelQry.HideDataForFilterOnView( True );
      Elem_HtlVendorQry.HideDataForFilterOnView( True );
    end
    else
    begin
      Elem_BrHotelQry.HideDataForFilterOnView( False );
      Elem_HtlVendorQry.HideDataForFilterOnView( False );
    end;

    if Assigned(FramePhotoList) then
      FramePhotoList.Refresh( GetDocStorePath, True );

    FrameDicBrCountry.RefreshControls(Self.FCurrManager);
    FrameDicCityHotelsItems.RefreshControls(Self.FCurrManager);
    FrameDicHotel.RefreshControls(Self.FCurrManager);
    FrameDicHotelVendor.RefreshControls(Self.FCurrManager);
    
  finally
    fIRefresh:=False;
  end;
end;

procedure TFrmHotelEdit.FUpdateToolActions(Value: Integer);
begin
  self.FCurrManager := Value;
  FRefreshControls;
  FrameDicBrCountry.RefreshControls( self.FCurrManager );
  FrameDicCityHotelsItems.RefreshControls( self.FCurrManager );
  FrameDicHotel.RefreshControls( self.FCurrManager );
  FrameDicHotelVendor.RefreshControls( self.FCurrManager );
end;

procedure UpdateHotels( isNew:Boolean; CurManager:Integer );
begin
  ShowEditHotelInfo( isNew, CurManager, DMServ.CurManagerName, CurManager<>0 );
end;

procedure UpdateHtlVendorRequisites( isNew:Boolean; CurManager:Integer );
var CaptEdRequisites:String;
    ParamFrame:TParamComRequisitesFrame;
    VendId: variant;
begin
  if isNew then
  begin
    VendId := Elem_HtlVendorQry.DB.FieldByName('CompanyId').Value;

    if SelectVendorClient( 'Постачальник готельних послуг',DMServ.CurManager, Elem_HtlVendorQry.DBGetParamConnect, 'ISHOTEL',
                           Elem_HtlVendorQry.View.Styles.StyleSheet, VendId ) then
    begin
      if not Elem_HtlVendorQry.DB.Locate('VENDORID',VendId,[]) then
      begin
        Elem_HtlVendorQry.DBInsert;
        Elem_HtlVendorQry.DB.FieldByName('VENDORID').Value := VendId;
        Elem_HtlVendorQry.DBPost;
        Elem_HtlVendorQry.Requery;
      end;
    end;
  end
  else
  begin
    ParamFrame.AdoConnection := DMServDic.ADOConnection;
    ParamFrame.ElemCompanyQry := Elem_HtlVendorQry;
    ParamFrame.ElemCompanyDocsQry := Elem_CompanyDocsQry;
    ParamFrame.ElemCOMPCONTRACTSKINDQry := Elem_COMP_CONTRACTS_KINDQry;
    ParamFrame.ElemTypeNotesQry := Elem_TypeNotesQry;
    ParamFrame.ElemCompaniesParamName := Elem_COMPANIES_PARAM_NAME;
    ParamFrame.ElemOCCUPATIONS := Elem_OCCUPATIONS;
    ParamFrame.ElemComunicationType := Elem_Comunication_TypeQry;
    ParamFrame.ElemCompContractNumsQry := Elem_CompContractNumsQry;
    ParamFrame.ElemUsersQry := Elem_UsersQry;
    //ParamFrame.ElemCompTaxSystemLogQry := Elem_CompTaxSystemLogQry;
    ParamFrame.ElemTypeDocumQry := Elem_TypeDocumQry;
    ParamFrame.ElemSelCompAction := Elem_SelCompAction;
    ParamFrame.ElemSelTaxSystemQry := Elem_SelTaxSystemQry;

    ParamFrame.ViewStyle := TcxGridTableViewStyleSheet( Elem_HtlVendorQry.View.Styles.StyleSheet );
    CaptEdRequisites := Elem_HtlVendorQry.DB.FieldByName('NAME').AsString +' / '+' - Реквізити';

    ShowUpdateRequisites( CaptEdRequisites, ParamFrame, CurManager <> 0 ,
                          DMServ.CurManager,  DMServ.CurManagerName );
  end; 
end;

procedure TFrmHotelEdit.FormShow(Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrmHotelEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmHotelEdit.RefreshControlsAction(Sender: TObject);
begin
  if fIRefresh then exit;
  FRefreshControls;
end;
end.


// Copy Name
{var NameHotel:WideString;
begin
  {ChangeKeyBoardLayout( klUkrainian );
  NameHotel := VarToStr( TcxgridDBTableView(GridHotels.Levels[0].GridView).GetColumnByFieldName('NAME').EditValue );
  Clipboard.AsText := NameHotel; }



  //SetFilterOnWievForManyColumns( TcxgridDBTableView(GridBrCountry.Levels[0].GridView), ['NAME'],[EdSearchCountry.Text],['like'],[fboOr]);
